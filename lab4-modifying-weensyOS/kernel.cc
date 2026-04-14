#include "kernel.hh"
#include "k-apic.hh"
#include "k-vmiter.hh"
#include "obj/k-firstprocess.h"
#include "atomic.hh"

// kernel.cc
//
//    This is the kernel.


// INITIAL PHYSICAL MEMORY LAYOUT
//
//  +-------------- Base Memory --------------+
//  v                                         v
// +-----+--------------------+----------------+--------------------+---------/
// |     | Kernel      Kernel |       :    I/O | App 1        App 1 | App 2
// |     | Code + Data  Stack |  ...  : Memory | Code + Data  Stack | Code ...
// +-----+--------------------+----------------+--------------------+---------/
// 0  0x40000              0x80000 0xA0000 0x100000             0x140000
//                                             ^
//                                             | \___ PROC_SIZE ___/
//                                      PROC_START_ADDR

#define PROC_SIZE 0x40000       // initial state only

proc ptable[NPROC];             // array of process descriptors
                                // Note that `ptable[0]` is never used.
proc* current;                  // pointer to currently executing proc

#define HZ 100                  // timer interrupt frequency (interrupts/sec)
static atomic<unsigned long> ticks; // # timer interrupts so far


// Memory state - see `kernel.hh`
physpageinfo physpages[NPAGES];


[[noreturn]] void schedule();
[[noreturn]] void run(proc* p);
void exception(regstate* regs);
uintptr_t syscall(regstate* regs);
void memshow();


// kernel_start(command)
//    Initialize the hardware and processes and start running. The `command`
//    string is an optional string passed from the boot loader.

static void process_setup(pid_t pid, const char* program_name);

void kernel_start(const char* command) {
    // initialize hardware
    init_hardware();
    log_printf("Starting WeensyOS\n");

    ticks = 1;
    init_timer(HZ);

    // clear screen
    console_clear();

    // Exercise 1:
    // Q: for kernel space, which physical memory the virtual address 0x1000 maps to?
    // (run the kernel, and check contents in "log.txt")
    log_printf("[kernel] VA[0x1000] maps to PA[%p]\n", vmiter(kernel_pagetable, 0x1000).pa());

    // TODO: use "log_printf" to print all kernel VA->PA mapping.
    // confirm that kernel indeed identical map all physical memory [0x0, MEMSIZE_PHYSICAL)
    // notes:
    //   - You will see that the first page is special.
    //   - You can comment out the code after confirmation
    //     (saving space in log.txt for other debugging info).

    /* your code here */


    /*

    for(vmiter it(kernel_pagetable, 0x1000); it.va() < MEMSIZE_VIRTUAL; it += PAGESIZE)
    {
        if(it.present())
        {
            log_printf("Kernel VA %p -> PA %p\n", it.va(), it.pa());
        }
    }
        
    */


    // (re-)initialize kernel page table
    for (uintptr_t addr = 0; addr < MEMSIZE_PHYSICAL; addr += PAGESIZE) {

        // Exercise 2:
        // - remove process accesses to the kernel memory,
        // - except CGA console page (CONSOLE_ADDR).
        // - keep kernel isolation when allocating memory
        //   (your code will be somewhere else; also read "sys_page_alloc" spec
        //   in "u-lib.hh"; ignore free memory for now)
        //
        // TODO: update code below

        int perm;

        if (addr == 0) {
            // nullptr is inaccessible even to the kernel
            perm = 0;
        }else if (addr == CONSOLE_ADDR)
        {
            perm = PTE_P | PTE_W | PTE_U;

        }else if (addr < PROC_START_ADDR)
        {
            perm = PTE_P | PTE_W;

        }else{
            perm = PTE_P | PTE_W | PTE_U;
        }
        // (re-)install identity mapping
        int r = vmiter(kernel_pagetable, addr).try_map(addr, perm);
        assert(r == 0); // mappings during kernel_start MUST NOT fail
                        // (Note that later mappings might fail!!)
    }

    // set up process descriptors
    for (pid_t i = 0; i < NPROC; i++) {
        ptable[i].pid = i;
        ptable[i].state = P_FREE;
    }
    if (!command) {
        command = WEENSYOS_FIRST_PROCESS;
    }
    if (!program_image(command).empty()) {
        process_setup(1, command);
    } else {
        process_setup(1, "allocator");
        process_setup(2, "allocator2");
        process_setup(3, "allocator3");
        process_setup(4, "allocator4");
    }

    // switch to first process using run()
    run(&ptable[1]);
}


// kalloc(sz)
//    Kernel physical memory allocator. Allocates at least `sz` contiguous bytes
//    and returns a pointer to the allocated memory, or `nullptr` on failure.
//    The returned pointer’s address is a valid physical address, but since the
//    WeensyOS kernel uses an identity mapping for virtual memory, it is also a
//    valid virtual address that the kernel can access or modify.
//
//    The allocator selects from physical pages that can be allocated for
//    process use (so not reserved pages or kernel data), and from physical
//    pages that are currently unused (`physpages[N].refcount == 0`).
//
//    On WeensyOS, `kalloc` is a page-based allocator: if `sz > PAGESIZE`
//    the allocation fails; if `sz < PAGESIZE` it allocates a whole page
//    anyway.
//
//    The handout code returns the next allocatable free page it can find.
//    It checks all pages. (You could maybe make this faster!)
//
//    The returned memory is initially filled with 0xCC, which corresponds to
//    the `int3` instruction. Executing that instruction will cause a `PANIC:
//    Unhandled exception 3!` This may help you debug.

void* kalloc(size_t sz) {
    if (sz > PAGESIZE) {
        return nullptr;
    }

    for (uintptr_t pa = 0; pa != MEMSIZE_PHYSICAL; pa += PAGESIZE) {
        if (allocatable_physical_address(pa)
            && physpages[pa / PAGESIZE].refcount == 0) {
            physpages[pa / PAGESIZE].refcount++;
            memset((void*) pa, 0xCC, PAGESIZE);
            return (void*) pa;
        }
    }
    return nullptr;
}


// kfree(kptr)
//    Free `kptr`, which must have been previously returned by `kalloc`.
//    If `kptr == nullptr` does nothing.

void kfree(void* kptr) {
    //(void) kptr;
    if (!kptr)
    {return;}
    uintptr_t pa = (uintptr_t) kptr;
    assert(physpages[pa / PAGESIZE].refcount > 0);
    physpages[pa / PAGESIZE].refcount--;
}


// process_setup(pid, program_name)
//    Load application program `program_name` as process number `pid`.
//    This loads the application's code and data into memory, sets its
//    %rip and %rsp, gives it a stack page, and marks it as runnable.


// Exercise 4: isolate address spaces
// - see instructions for the TODOs
// - most of your code will go to "process_setup"
// - there are several other places you need to touch.

void process_setup(pid_t pid, const char* program_name) {
    init_process(&ptable[pid], 0);

    // initialize process page table
    //ptable[pid].pagetable = kernel_pagetable;

    ptable[pid].pagetable = (x86_64_pagetable*) kalloc(PAGESIZE);
    assert(ptable[pid].pagetable);
    memset(ptable[pid].pagetable, 0, PAGESIZE);

    for(vmiter it(kernel_pagetable, 0); it.va() < PROC_START_ADDR; it += PAGESIZE)
    {
        if (it.present())
        {
            int r = vmiter(ptable[pid].pagetable, it.va()).try_map(it.pa(), it.perm());
            assert(r == 0);
        }
        
    }

    // obtain reference to program image
    // (The program image models the process executable.)
    program_image pgm(program_name);

    // Allocate, map and copy

    for(auto seg = pgm.begin(); seg != pgm.end(); seg++)
    {
        for(uintptr_t a = round_down(seg.va(), PAGESIZE); 
        a < seg.va() + seg.size(); a += PAGESIZE)
        {
            void *pa = kalloc(PAGESIZE);
            assert(pa);
            int perm = PTE_P | PTE_U;
            if(seg.writable())
            {
                perm = perm | PTE_W;
            }

            int r = vmiter(ptable[pid].pagetable, a).try_map(pa, perm);
            assert(r == 0);
        }
    }

    for(auto seg = pgm.begin(); seg != pgm.end(); seg++)
    {
        uintptr_t va = seg.va();
        uintptr_t pa = vmiter(ptable[pid].pagetable, va).pa();

        memset((void *) pa, 0, seg.size());
        memcpy((void *) pa, seg.data(), seg.data_size());
    }

    // Exercise 3:
    // - read "program_image" and "program_image_segment" in "kernel.hh" for their interfaces
    // - copy-paste the code from Exercise 3 instructions
    // - complete it and check if the outputs align with "objdump"
    // TODO: your code here


    log_printf("program %s: entry point %p\n", program_name, pgm.entry());
    size_t n = 0;
    for (auto seg = pgm.begin(); seg != pgm.end(); ++seg, ++n) {
    log_printf("  seg[%zu]: addr %p, size %p, data_size %p, read-only? (%s)\n",
               n, seg.va(),
               seg.size(),
               seg.data_size(),
               seg.writable()? "no" :"yes"); 
    }



    /*
    // allocate and map process memory as specified in program image
    for (auto seg = pgm.begin(); seg != pgm.end(); ++seg) {
        for (uintptr_t a = round_down(seg.va(), PAGESIZE);
             a < seg.va() + seg.size();
             a += PAGESIZE) {
            // `a` is the process virtual address for the next code or data page
            // (The handout code requires that the corresponding physical
            // address is currently free.)
            assert(physpages[a / PAGESIZE].refcount == 0);
            ++physpages[a / PAGESIZE].refcount;
        }
    }
    

    // copy instructions and data from program image into process memory
    for (auto seg = pgm.begin(); seg != pgm.end(); ++seg) {
        memset((void*) seg.va(), 0, seg.size());
        memcpy((void*) seg.va(), seg.data(), seg.data_size());
    }
    */

    // mark entry point
    ptable[pid].regs.reg_rip = pgm.entry();

    // allocate and map stack segment
    // Compute process virtual address for stack page
    // uintptr_t stack_addr = PROC_START_ADDR + PROC_SIZE * pid - PAGESIZE;
    
    uintptr_t stack_addr = MEMSIZE_VIRTUAL - PAGESIZE;

    // The handout code requires that the corresponding physical address
    // is currently free.

    void * stack_pa = kalloc(PAGESIZE);
    assert(stack_pa);
    memset(stack_pa, 0, PAGESIZE);
    int r = vmiter(ptable[pid].pagetable, stack_addr).try_map(stack_pa, 
        PTE_P | PTE_W | PTE_U);
    assert(r==0);
    //assert(physpages[stack_addr / PAGESIZE].refcount == 0);
    //++physpages[stack_addr / PAGESIZE].refcount;
    ptable[pid].regs.reg_rsp = stack_addr + PAGESIZE;

    // mark process as runnable
    ptable[pid].state = P_RUNNABLE;
}



// exception(regs)
//    Exception handler (for interrupts, traps, and faults).
//
//    The register values from exception time are stored in `regs`.
//    The processor responds to an exception by saving application state on
//    the kernel's stack, then jumping to kernel assembly code (in
//    k-exception.S). That code saves more registers on the kernel's stack,
//    then calls exception().
//
//    Note that hardware interrupts are disabled when the kernel is running.

void exception(regstate* regs) {
    // Copy the saved registers into the `current` process descriptor.
    current->regs = *regs;
    regs = &current->regs;

    // It can be useful to log events using `log_printf`.
    // Events logged this way are stored in the host's `log.txt` file.
    /* log_printf("proc %d: exception %d at rip %p\n",
                current->pid, regs->reg_intno, regs->reg_rip); */

    // Show the current cursor location and memory state
    // (unless this is a kernel fault).
    console_show_cursor(cursorpos);
    if (regs->reg_intno != INT_PF || (regs->reg_errcode & PTE_U)) {
        memshow();
    }

    // If Control-C was typed, exit the virtual machine.
    check_keyboard();


    // Actually handle the exception.
    switch (regs->reg_intno) {

    case INT_IRQ + IRQ_TIMER:
        ++ticks;
        lapicstate::get().ack();
        schedule();
        break;                  /* will not be reached */

    case INT_PF: {
        // Analyze faulting address and access type.
        uintptr_t addr = rdcr2();
        const char* operation = regs->reg_errcode & PTE_W
                ? "write" : "read";
        const char* problem = regs->reg_errcode & PTE_P
                ? "protection problem" : "missing page";

        if (!(regs->reg_errcode & PTE_U)) {
            proc_panic(current, "Kernel page fault on %p (%s %s, rip=%p)!\n",
                       addr, operation, problem, regs->reg_rip);
        }
        error_printf(CPOS(24, 0), 0x0C00,
                     "Process %d page fault on %p (%s %s, rip=%p)!\n",
                     current->pid, addr, operation, problem, regs->reg_rip);
        current->state = P_FAULTED;
        break;
    }

    default:
        proc_panic(current, "Unhandled exception %d (rip=%p)!\n",
                   regs->reg_intno, regs->reg_rip);

    }


    // Return to the current process (or run something else).
    if (current->state == P_RUNNABLE) {
        run(current);
    } else {
        schedule();
    }
}


int syscall_page_alloc(uintptr_t addr);


// syscall(regs)
//    Handle a system call initiated by a `syscall` instruction.
//    The process’s register values at system call time are accessible in
//    `regs`.
//
//    If this function returns with value `V`, then the user process will
//    resume with `V` stored in `%rax` (so the system call effectively
//    returns `V`). Alternately, the kernel can exit this function by
//    calling `schedule()`, perhaps after storing the eventual system call
//    return value in `current->regs.reg_rax`.
//
//    It is only valid to return from this function if
//    `current->state == P_RUNNABLE`.
//
//    Note that hardware interrupts are disabled when the kernel is running.

uintptr_t syscall(regstate* regs) {
    // Copy the saved registers into the `current` process descriptor.
    current->regs = *regs;
    regs = &current->regs;

    // It can be useful to log events using `log_printf`.
    // Events logged this way are stored in the host's `log.txt` file.
    /* log_printf("proc %d: syscall %d at rip %p\n",
                  current->pid, regs->reg_rax, regs->reg_rip); */

    // Show the current cursor location and memory state.
    console_show_cursor(cursorpos);
    memshow();

    // If Control-C was typed, exit the virtual machine.
    check_keyboard();


    // Actually handle the exception.
    switch (regs->reg_rax) {

    case SYSCALL_PANIC:
        user_panic(current);
        break; // will not be reached

    case SYSCALL_GETPID:
        return current->pid;

    case SYSCALL_YIELD:
        current->regs.reg_rax = 0;
        schedule();             // does not return

    case SYSCALL_PAGE_ALLOC:
        return syscall_page_alloc(current->regs.reg_rdi);

    case SYSCALL_FORK: {
        //panic("Fork not implemented!\n");
        pid_t child_pid = -1;
        for(pid_t i = 1; i< NPROC; i++)
        {
            if(ptable[i].state == P_FREE)
            {
                child_pid = i;
                break;
            }
        }
        if(child_pid<0){return -1;}
        x86_64_pagetable * child_pt = (x86_64_pagetable*) kalloc(PAGESIZE);
        if(!child_pt){return -1;}
        memset(child_pt, 0, PAGESIZE);

        for(vmiter it(current->pagetable, 0); it.va() < MEMSIZE_VIRTUAL; it += PAGESIZE)
        {
            if(!it.present()){continue;}

            if (it.va() < PROC_START_ADDR) {
            
            int r = vmiter(child_pt, it.va()).try_map(it.pa(), it.perm());
            if (r != 0) {goto fork_fail;}
        } else if (it.va() == CONSOLE_ADDR) {
            
            int r = vmiter(child_pt, it.va()).try_map(it.pa(), it.perm());
            if (r != 0) {goto fork_fail;}
        } else if (it.user() && it.writable()) {
            
            void* pa = kalloc(PAGESIZE);
            if (!pa) {goto fork_fail;}
            memcpy(pa, (void*) it.pa(), PAGESIZE);
            int r = vmiter(child_pt, it.va()).try_map(pa, it.perm());
            if (r != 0) { kfree(pa); goto fork_fail; }
        } else {
            
            int r = vmiter(child_pt, it.va()).try_map(it.pa(), it.perm());
            if (r != 0) {goto fork_fail;}
            ++physpages[it.pa() / PAGESIZE].refcount;
        }

        }


        ptable[child_pid].pagetable = child_pt;
        ptable[child_pid].regs = current->regs;
        ptable[child_pid].regs.reg_rax = 0;
        ptable[child_pid].state = P_RUNNABLE;
        ptable[child_pid].pid = child_pid;

        return child_pid;


        fork_fail:
            for (vmiter it(child_pt, 0); it.va() < MEMSIZE_VIRTUAL; it += PAGESIZE) {
                if (it.present() && it.va() >= PROC_START_ADDR && it.va() != CONSOLE_ADDR) {
                    kfree((void*) it.pa());
                }
            }
            kfree(child_pt);
            return -1;
    }

    case SYSCALL_EXIT: {
        //panic("Exit not implemented!\n");
        for (vmiter it(current->pagetable, 0); it.va() < MEMSIZE_VIRTUAL; it += PAGESIZE) {
            if (it.present() && it.va() >= PROC_START_ADDR && it.va() != CONSOLE_ADDR) {
                kfree((void*) it.pa());
            }
        }
    
        for (ptiter it(current->pagetable); !it.done(); it.next()) {
            kfree((void*) it.pa());
        }
        
        kfree(current->pagetable);
        current->pagetable = nullptr;
        current->state = P_FREE;
        schedule();
    }

    default:
        proc_panic(current, "Unhandled system call %ld (pid=%d, rip=%p)!\n",
                   regs->reg_rax, current->pid, regs->reg_rip);

    }

    panic("Should not get here!\n");
}


// syscall_page_alloc(addr)
//    Handles the SYSCALL_PAGE_ALLOC system call. This function
//    should implement the specification for `sys_page_alloc`
//    in `u-lib.hh` (but in the handout code, it does not).

int syscall_page_alloc(uintptr_t addr) {

    if(addr % PAGESIZE != 0
    || addr < PROC_START_ADDR
    || addr >= MEMSIZE_VIRTUAL)
    {
        return -1;
    }

    void * pa = kalloc(PAGESIZE);
    if(!pa){
        return -1;
    }

    memset(pa, 0, PAGESIZE);
    int r = vmiter(current->pagetable, addr).try_map(pa, PTE_P | PTE_W | PTE_U);
    if(r!=0)
    {
        kfree(pa); return -1;
    }
    return 0;

    //assert(physpages[addr / PAGESIZE].refcount == 0);
    //++physpages[addr / PAGESIZE].refcount;
    //memset((void*) addr, 0, PAGESIZE);
    //return 0;
}


// schedule
//    Pick the next process to run and then run it.
//    If there are no runnable processes, spins forever.

void schedule() {
    pid_t pid = current->pid;
    for (unsigned spins = 1; true; ++spins) {
        pid = (pid + 1) % NPROC;
        if (ptable[pid].state == P_RUNNABLE) {
            run(&ptable[pid]);
        }

        // If Control-C was typed, exit the virtual machine.
        check_keyboard();

        // If spinning forever, show the memviewer.
        if (spins % (1 << 12) == 0) {
            memshow();
            log_printf("%u\n", spins);
        }
    }
}


// run(p)
//    Run process `p`. This involves setting `current = p` and calling
//    `exception_return` to restore its page table and registers.

void run(proc* p) {
    assert(p->state == P_RUNNABLE);
    current = p;

    // Check the process's current pagetable.
    check_pagetable(p->pagetable);

    // This function is defined in k-exception.S. It restores the process's
    // registers then jumps back to user mode.
    exception_return(p);

    // should never get here
    while (true) {
    }
}


// memshow()
//    Draw a picture of memory (physical and virtual) on the CGA console.
//    Switches to a new process's virtual memory map every 0.25 sec.
//    Uses `console_memviewer()`, a function defined in `k-memviewer.cc`.

void memshow() {
    static unsigned last_ticks = 0;
    static int showing = 0;

    // switch to a new process every 0.25 sec
    if (last_ticks == 0 || ticks - last_ticks >= HZ / 2) {
        last_ticks = ticks;
        showing = (showing + 1) % NPROC;
    }

    proc* p = nullptr;
    for (int search = 0; !p && search < NPROC; ++search) {
        if (ptable[showing].state != P_FREE
            && ptable[showing].pagetable) {
            p = &ptable[showing];
        } else {
            showing = (showing + 1) % NPROC;
        }
    }

    console_memviewer(p);
    if (!p) {
        console_printf(CPOS(10, 26), 0x0F00, "   VIRTUAL ADDRESS SPACE\n"
            "                          [All processes have exited]\n"
            "\n\n\n\n\n\n\n\n\n\n\n");
    }
}
