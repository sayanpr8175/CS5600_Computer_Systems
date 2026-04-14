
obj/p-exit.full:     file format elf64-x86-64


Disassembly of section .text:

0000000000100000 <sys_exit()>:
  100000:	f3 0f 1e fa          	endbr64
    while (true) {
  100004:	b8 06 00 00 00       	mov    $0x6,%eax
        int x = rand(0, ALLOC_SLOWDOWN);
  100009:	0f 05                	syscall
            }
  10000b:	b8 03 00 00 00       	mov    $0x3,%eax
        } else {
  100010:	bf a0 10 10 00       	mov    $0x1010a0,%edi
  100015:	0f 05                	syscall
  100017:	eb fe                	jmp    100017 <sys_exit()+0x17>

0000000000100019 <process_main()>:
void process_main() {
  100019:	f3 0f 1e fa          	endbr64
  10001d:	55                   	push   %rbp
  10001e:	48 89 e5             	mov    %rsp,%rbp
  100021:	41 57                	push   %r15
  100023:	41 56                	push   %r14
  100025:	41 55                	push   %r13
  100027:	41 54                	push   %r12
  100029:	53                   	push   %rbx
  10002a:	48 83 ec 08          	sub    $0x8,%rsp
    for (size_t i = 0; i != sizeof(pagemark); ++i) {
  10002e:	b8 00 00 00 00       	mov    $0x0,%eax
        assert(pagemark[i] == 0);
  100033:	80 b8 00 20 10 00 00 	cmpb   $0x0,0x102000(%rax)
  10003a:	75 0e                	jne    10004a <process_main()+0x31>
    for (size_t i = 0; i != sizeof(pagemark); ++i) {
  10003c:	48 83 c0 01          	add    $0x1,%rax
  100040:	48 3d 00 10 00 00    	cmp    $0x1000,%rax
  100046:	75 eb                	jne    100033 <process_main()+0x1a>
  100048:	eb 2b                	jmp    100075 <process_main()+0x5c>
        assert(pagemark[i] == 0);
  10004a:	b9 00 00 00 00       	mov    $0x0,%ecx
  10004f:	ba bc 10 10 00       	mov    $0x1010bc,%edx
  100054:	be 10 00 00 00       	mov    $0x10,%esi
  100059:	bf cd 10 10 00       	mov    $0x1010cd,%edi
  10005e:	e8 c2 0f 00 00       	call   101025 <assert_fail(char const*, int, char const*, char const*)>
                sys_exit();
  100063:	e8 98 ff ff ff       	call   100000 <sys_exit()>
            } else if (choice != 2 ? p > 0 : p == 0) {
  100068:	85 db                	test   %ebx,%ebx
  10006a:	75 09                	jne    100075 <process_main()+0x5c>
  10006c:	eb 44                	jmp    1000b2 <process_main()+0x99>
// make_syscall
//    These functions define the WeensyOS system call calling convention.
//    We provide versions for system calls with 0-2 arguments.

__always_inline uintptr_t make_syscall(int syscallno) {
    register uintptr_t rax asm("rax") = syscallno;
  10006e:	b8 02 00 00 00       	mov    $0x2,%eax
    asm volatile ("syscall"
  100073:	0f 05                	syscall
        int x = rand(0, ALLOC_SLOWDOWN);
  100075:	be 12 00 00 00       	mov    $0x12,%esi
  10007a:	bf 00 00 00 00       	mov    $0x0,%edi
  10007f:	e8 ad 03 00 00       	call   100431 <rand(int, int)>
        if (x == 0) {
  100084:	85 c0                	test   %eax,%eax
  100086:	75 e6                	jne    10006e <process_main()+0x55>
    register uintptr_t rax asm("rax") = syscallno;
  100088:	b8 05 00 00 00       	mov    $0x5,%eax
    asm volatile ("syscall"
  10008d:	0f 05                	syscall
            : "+a" (rax)
            : /* all input registers are also output registers */
            : "cc", "memory", "rcx", "rdx", "rsi", "rdi", "r8", "r9",
              "r10", "r11");
    return rax;
  10008f:	48 89 c3             	mov    %rax,%rbx
            int choice = rand(0, 2);
  100092:	be 02 00 00 00       	mov    $0x2,%esi
  100097:	bf 00 00 00 00       	mov    $0x0,%edi
  10009c:	e8 90 03 00 00       	call   100431 <rand(int, int)>
            if (choice == 0 && p > 0) {
  1000a1:	85 c0                	test   %eax,%eax
  1000a3:	75 04                	jne    1000a9 <process_main()+0x90>
  1000a5:	85 db                	test   %ebx,%ebx
  1000a7:	7f ba                	jg     100063 <process_main()+0x4a>
            } else if (choice != 2 ? p > 0 : p == 0) {
  1000a9:	83 f8 02             	cmp    $0x2,%eax
  1000ac:	74 ba                	je     100068 <process_main()+0x4f>
  1000ae:	85 db                	test   %ebx,%ebx
  1000b0:	7e c3                	jle    100075 <process_main()+0x5c>
    int speed = rand(1, 16);
  1000b2:	be 10 00 00 00       	mov    $0x10,%esi
  1000b7:	bf 01 00 00 00       	mov    $0x1,%edi
  1000bc:	e8 70 03 00 00       	call   100431 <rand(int, int)>
  1000c1:	89 c3                	mov    %eax,%ebx
    register uintptr_t rax asm("rax") = syscallno;
  1000c3:	b8 01 00 00 00       	mov    $0x1,%eax
    asm volatile ("syscall"
  1000c8:	0f 05                	syscall


// sys_getpid
//    Return current process ID. (Never fails.)
inline pid_t sys_getpid() {
    return make_syscall(SYSCALL_GETPID);
  1000ca:	41 89 c5             	mov    %eax,%r13d
//    Return the smallest multiple of `m` greater than or equal to `x`.
//    Equivalently, round `x` up to the nearest multiple of `m`.
template <typename T>
inline constexpr T round_up(T x, unsigned m) {
    static_assert(std::is_unsigned<T>::value, "T must be unsigned");
    return round_down(x + m - 1, m);
  1000cd:	41 bc 1b 40 10 00    	mov    $0x10401b,%r12d
    uint8_t* heap_bottom = (uint8_t*) round_up((uintptr_t) end, PAGESIZE);
  1000d3:	49 81 e4 00 f0 ff ff 	and    $0xfffffffffffff000,%r12
    heap_top = heap_bottom;
  1000da:	4c 89 25 27 2f 00 00 	mov    %r12,0x2f27(%rip)        # 103008 <heap_top>
    return x;
}

__always_inline uintptr_t rdrsp() {
    uintptr_t x;
    asm volatile("movq %%rsp, %0" : "=r" (x));
  1000e1:	48 89 e0             	mov    %rsp,%rax
    stack_bottom = (uint8_t*) round_down((uintptr_t) rdrsp() - 1, PAGESIZE);
  1000e4:	48 83 e8 01          	sub    $0x1,%rax
  1000e8:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  1000ee:	48 89 05 0b 2f 00 00 	mov    %rax,0x2f0b(%rip)        # 103000 <stack_bottom>
    while (heap_top != stack_bottom) {
  1000f5:	4c 39 e0             	cmp    %r12,%rax
  1000f8:	0f 84 30 02 00 00    	je     10032e <process_main()+0x315>
    unsigned nalloc = 0;
  1000fe:	41 be 00 00 00 00    	mov    $0x0,%r14d
  100104:	eb 34                	jmp    10013a <process_main()+0x121>
                    assert(*addr == pagemark[pn]);
  100106:	b9 00 00 00 00       	mov    $0x0,%ecx
  10010b:	ba d7 10 10 00       	mov    $0x1010d7,%edx
  100110:	be 34 00 00 00       	mov    $0x34,%esi
  100115:	bf cd 10 10 00       	mov    $0x1010cd,%edi
  10011a:	e8 06 0f 00 00       	call   101025 <assert_fail(char const*, int, char const*, char const*)>
    register uintptr_t rax asm("rax") = syscallno;
  10011f:	b8 02 00 00 00       	mov    $0x2,%eax
    asm volatile ("syscall"
  100124:	0f 05                	syscall
    while (heap_top != stack_bottom) {
  100126:	48 8b 05 d3 2e 00 00 	mov    0x2ed3(%rip),%rax        # 103000 <stack_bottom>
  10012d:	48 39 05 d4 2e 00 00 	cmp    %rax,0x2ed4(%rip)        # 103008 <heap_top>
  100134:	0f 84 f4 01 00 00    	je     10032e <process_main()+0x315>
        int x = rand(0, 6 * ALLOC_SLOWDOWN);
  10013a:	be 6c 00 00 00       	mov    $0x6c,%esi
  10013f:	bf 00 00 00 00       	mov    $0x0,%edi
  100144:	e8 e8 02 00 00       	call   100431 <rand(int, int)>
        if (x >= 8 * speed) {
  100149:	8d 14 dd 00 00 00 00 	lea    0x0(,%rbx,8),%edx
  100150:	39 c2                	cmp    %eax,%edx
  100152:	0f 8f 88 00 00 00    	jg     1001e0 <process_main()+0x1c7>
            if (x % 4 < 2 && heap_top != heap_bottom) {
  100158:	99                   	cltd
  100159:	c1 ea 1e             	shr    $0x1e,%edx
  10015c:	01 d0                	add    %edx,%eax
  10015e:	83 e0 03             	and    $0x3,%eax
  100161:	29 d0                	sub    %edx,%eax
  100163:	83 f8 01             	cmp    $0x1,%eax
  100166:	7f b7                	jg     10011f <process_main()+0x106>
  100168:	48 8b 05 99 2e 00 00 	mov    0x2e99(%rip),%rax        # 103008 <heap_top>
  10016f:	4c 39 e0             	cmp    %r12,%rax
  100172:	74 ab                	je     10011f <process_main()+0x106>
                unsigned pn = rand(0, (heap_top - heap_bottom - 1) / PAGESIZE);
  100174:	4c 29 e0             	sub    %r12,%rax
  100177:	48 8d 70 ff          	lea    -0x1(%rax),%rsi
  10017b:	48 c1 ee 0c          	shr    $0xc,%rsi
  10017f:	bf 00 00 00 00       	mov    $0x0,%edi
  100184:	e8 a8 02 00 00       	call   100431 <rand(int, int)>
                if (pn < sizeof(pagemark)) {
  100189:	3d ff 0f 00 00       	cmp    $0xfff,%eax
  10018e:	77 8f                	ja     10011f <process_main()+0x106>
                    volatile uint8_t* addr = heap_bottom + pn * PAGESIZE;
  100190:	89 c1                	mov    %eax,%ecx
  100192:	48 89 ca             	mov    %rcx,%rdx
  100195:	48 c1 e2 0c          	shl    $0xc,%rdx
  100199:	4c 01 e2             	add    %r12,%rdx
                    assert(*addr == pagemark[pn]);
  10019c:	0f b6 32             	movzbl (%rdx),%esi
  10019f:	40 3a b1 00 20 10 00 	cmp    0x102000(%rcx),%sil
  1001a6:	0f 85 5a ff ff ff    	jne    100106 <process_main()+0xed>
                    *addr = pagemark[pn] = self;
  1001ac:	89 c0                	mov    %eax,%eax
  1001ae:	44 88 a8 00 20 10 00 	mov    %r13b,0x102000(%rax)
  1001b5:	44 88 2a             	mov    %r13b,(%rdx)
                    assert(*addr == self);
  1001b8:	0f b6 02             	movzbl (%rdx),%eax
  1001bb:	0f b6 c0             	movzbl %al,%eax
  1001be:	44 39 e8             	cmp    %r13d,%eax
  1001c1:	0f 84 58 ff ff ff    	je     10011f <process_main()+0x106>
  1001c7:	b9 00 00 00 00       	mov    $0x0,%ecx
  1001cc:	ba ed 10 10 00       	mov    $0x1010ed,%edx
  1001d1:	be 36 00 00 00       	mov    $0x36,%esi
  1001d6:	bf cd 10 10 00       	mov    $0x1010cd,%edi
  1001db:	e8 45 0e 00 00       	call   101025 <assert_fail(char const*, int, char const*, char const*)>
        x = rand(0, 7 + min(nalloc / 4, 10U));
  1001e0:	44 89 f6             	mov    %r14d,%esi
  1001e3:	c1 ee 02             	shr    $0x2,%esi
    return a < b ? a : b;
  1001e6:	b8 0a 00 00 00       	mov    $0xa,%eax
  1001eb:	39 c6                	cmp    %eax,%esi
  1001ed:	0f 47 f0             	cmova  %eax,%esi
  1001f0:	83 c6 07             	add    $0x7,%esi
  1001f3:	bf 00 00 00 00       	mov    $0x0,%edi
  1001f8:	e8 34 02 00 00       	call   100431 <rand(int, int)>
        if (x < 2) {
  1001fd:	83 f8 01             	cmp    $0x1,%eax
  100200:	7e 2a                	jle    10022c <process_main()+0x213>
        } else if (x < 3) {
  100202:	83 f8 02             	cmp    $0x2,%eax
  100205:	7e 75                	jle    10027c <process_main()+0x263>
    register uintptr_t rax asm("rax") = syscallno;
  100207:	b8 04 00 00 00       	mov    $0x4,%eax
    asm volatile ("syscall"
  10020c:	48 8b 3d f5 2d 00 00 	mov    0x2df5(%rip),%rdi        # 103008 <heap_top>
  100213:	0f 05                	syscall
        } else if (sys_page_alloc(heap_top) >= 0) {
  100215:	85 c0                	test   %eax,%eax
  100217:	79 68                	jns    100281 <process_main()+0x268>
        } else if (nalloc < 4) {
  100219:	41 83 fe 03          	cmp    $0x3,%r14d
  10021d:	0f 86 06 01 00 00    	jbe    100329 <process_main()+0x310>
            nalloc -= 4;
  100223:	41 83 ee 04          	sub    $0x4,%r14d
  100227:	e9 fa fe ff ff       	jmp    100126 <process_main()+0x10d>
    register uintptr_t rax asm("rax") = syscallno;
  10022c:	b8 05 00 00 00       	mov    $0x5,%eax
    asm volatile ("syscall"
  100231:	0f 05                	syscall
            if (sys_fork() == 0) {
  100233:	85 c0                	test   %eax,%eax
  100235:	0f 85 eb fe ff ff    	jne    100126 <process_main()+0x10d>
    register uintptr_t rax asm("rax") = syscallno;
  10023b:	b8 01 00 00 00       	mov    $0x1,%eax
    asm volatile ("syscall"
  100240:	0f 05                	syscall
    return rax;
  100242:	49 89 c7             	mov    %rax,%r15
                assert(new_self != self);
  100245:	44 39 e8             	cmp    %r13d,%eax
  100248:	74 19                	je     100263 <process_main()+0x24a>
                speed = rand(1, 16);
  10024a:	be 10 00 00 00       	mov    $0x10,%esi
  10024f:	bf 01 00 00 00       	mov    $0x1,%edi
  100254:	e8 d8 01 00 00       	call   100431 <rand(int, int)>
  100259:	89 c3                	mov    %eax,%ebx
                self = new_self;
  10025b:	45 89 fd             	mov    %r15d,%r13d
  10025e:	e9 c3 fe ff ff       	jmp    100126 <process_main()+0x10d>
                assert(new_self != self);
  100263:	b9 00 00 00 00       	mov    $0x0,%ecx
  100268:	ba fb 10 10 00       	mov    $0x1010fb,%edx
  10026d:	be 41 00 00 00       	mov    $0x41,%esi
  100272:	bf cd 10 10 00       	mov    $0x1010cd,%edi
  100277:	e8 a9 0d 00 00       	call   101025 <assert_fail(char const*, int, char const*, char const*)>
            sys_exit();
  10027c:	e8 7f fd ff ff       	call   100000 <sys_exit()>
            for (unsigned long* l = (unsigned long*) heap_top;
  100281:	48 8b 0d 80 2d 00 00 	mov    0x2d80(%rip),%rcx        # 103008 <heap_top>
                 l != (unsigned long*) (heap_top + PAGESIZE);
  100288:	48 8d 91 00 10 00 00 	lea    0x1000(%rcx),%rdx
            for (unsigned long* l = (unsigned long*) heap_top;
  10028f:	48 89 c8             	mov    %rcx,%rax
                assert(*l == 0);
  100292:	48 83 38 00          	cmpq   $0x0,(%rax)
  100296:	75 78                	jne    100310 <process_main()+0x2f7>
            for (unsigned long* l = (unsigned long*) heap_top;
  100298:	48 83 c0 08          	add    $0x8,%rax
                 l != (unsigned long*) (heap_top + PAGESIZE);
  10029c:	48 39 d0             	cmp    %rdx,%rax
  10029f:	75 f1                	jne    100292 <process_main()+0x279>
            *heap_top = speed;
  1002a1:	88 19                	mov    %bl,(%rcx)
            console[CPOS(24, 79)] = speed;
  1002a3:	66 89 1d f4 8c fb ff 	mov    %bx,-0x4730c(%rip)        # b8f9e <console+0xf9e>
            unsigned pn = (heap_top - heap_bottom) / PAGESIZE;
  1002aa:	48 8b 05 57 2d 00 00 	mov    0x2d57(%rip),%rax        # 103008 <heap_top>
  1002b1:	48 89 c2             	mov    %rax,%rdx
  1002b4:	4c 29 e2             	sub    %r12,%rdx
  1002b7:	48 c1 ea 0c          	shr    $0xc,%rdx
            if (pn < sizeof(pagemark)) {
  1002bb:	81 fa ff 0f 00 00    	cmp    $0xfff,%edx
  1002c1:	77 08                	ja     1002cb <process_main()+0x2b2>
                pagemark[pn] = speed;
  1002c3:	89 d2                	mov    %edx,%edx
  1002c5:	88 9a 00 20 10 00    	mov    %bl,0x102000(%rdx)
            heap_top += PAGESIZE;
  1002cb:	48 05 00 10 00 00    	add    $0x1000,%rax
  1002d1:	48 89 05 30 2d 00 00 	mov    %rax,0x2d30(%rip)        # 103008 <heap_top>
            nalloc = (heap_top - heap_bottom) / PAGESIZE;
  1002d8:	4c 29 e0             	sub    %r12,%rax
  1002db:	49 89 c6             	mov    %rax,%r14
  1002de:	49 c1 ee 0c          	shr    $0xc,%r14
            if (console[CPOS(24, 0)]) {
  1002e2:	0f b7 05 17 8c fb ff 	movzwl -0x473e9(%rip),%eax        # b8f00 <console+0xf00>
  1002e9:	66 85 c0             	test   %ax,%ax
  1002ec:	0f 84 34 fe ff ff    	je     100126 <process_main()+0x10d>
                console_printf(CPOS(24, 0), 0, "\n");
  1002f2:	ba 14 11 10 00       	mov    $0x101114,%edx
  1002f7:	be 00 00 00 00       	mov    $0x0,%esi
  1002fc:	bf 80 07 00 00       	mov    $0x780,%edi
  100301:	b8 00 00 00 00       	mov    $0x0,%eax
  100306:	e8 e0 0c 00 00       	call   100feb <console_printf(int, int, char const*, ...)>
  10030b:	e9 16 fe ff ff       	jmp    100126 <process_main()+0x10d>
                assert(*l == 0);
  100310:	b9 00 00 00 00       	mov    $0x0,%ecx
  100315:	ba 0c 11 10 00       	mov    $0x10110c,%edx
  10031a:	be 4c 00 00 00       	mov    $0x4c,%esi
  10031f:	bf cd 10 10 00       	mov    $0x1010cd,%edi
  100324:	e8 fc 0c 00 00       	call   101025 <assert_fail(char const*, int, char const*, char const*)>
            sys_exit();
  100329:	e8 d2 fc ff ff       	call   100000 <sys_exit()>
        if (rand(0, 2 * ALLOC_SLOWDOWN - 1) == 0) {
  10032e:	be 23 00 00 00       	mov    $0x23,%esi
  100333:	bf 00 00 00 00       	mov    $0x0,%edi
  100338:	e8 f4 00 00 00       	call   100431 <rand(int, int)>
  10033d:	85 c0                	test   %eax,%eax
  10033f:	74 09                	je     10034a <process_main()+0x331>
    register uintptr_t rax asm("rax") = syscallno;
  100341:	b8 02 00 00 00       	mov    $0x2,%eax
    asm volatile ("syscall"
  100346:	0f 05                	syscall
//    Yield control of the CPU to the kernel. The kernel will pick another
//    process to run, if possible; if there is no other process, it will
//    run this process again. (Never fails.)
inline void sys_yield() {
    make_syscall(SYSCALL_YIELD);
}
  100348:	eb e4                	jmp    10032e <process_main()+0x315>
            sys_exit();
  10034a:	e8 b1 fc ff ff       	call   100000 <sys_exit()>
  10034f:	90                   	nop

0000000000100350 <string_printer::putc(unsigned char, int)>:
    char* end_;
    size_t n_;
    string_printer(char* s, size_t size)
        : s_(s), end_(s + size), n_(0) {
    }
    void putc(unsigned char c, int) override {
  100350:	f3 0f 1e fa          	endbr64
        if (s_ < end_) {
  100354:	48 8b 47 08          	mov    0x8(%rdi),%rax
  100358:	48 3b 47 10          	cmp    0x10(%rdi),%rax
  10035c:	73 0b                	jae    100369 <string_printer::putc(unsigned char, int)+0x19>
            *s_++ = c;
  10035e:	48 8d 50 01          	lea    0x1(%rax),%rdx
  100362:	48 89 57 08          	mov    %rdx,0x8(%rdi)
  100366:	40 88 30             	mov    %sil,(%rax)
        }
        ++n_;
  100369:	48 83 47 18 01       	addq   $0x1,0x18(%rdi)
    }
  10036e:	c3                   	ret

000000000010036f <strlen>:
size_t strlen(const char* s) {
  10036f:	f3 0f 1e fa          	endbr64
    for (n = 0; *s != '\0'; ++s) {
  100373:	80 3f 00             	cmpb   $0x0,(%rdi)
  100376:	74 10                	je     100388 <strlen+0x19>
  100378:	b8 00 00 00 00       	mov    $0x0,%eax
        ++n;
  10037d:	48 83 c0 01          	add    $0x1,%rax
    for (n = 0; *s != '\0'; ++s) {
  100381:	80 3c 07 00          	cmpb   $0x0,(%rdi,%rax,1)
  100385:	75 f6                	jne    10037d <strlen+0xe>
  100387:	c3                   	ret
  100388:	b8 00 00 00 00       	mov    $0x0,%eax
}
  10038d:	c3                   	ret

000000000010038e <strnlen>:
size_t strnlen(const char* s, size_t maxlen) {
  10038e:	f3 0f 1e fa          	endbr64
  100392:	48 89 f0             	mov    %rsi,%rax
    for (n = 0; n != maxlen && *s != '\0'; ++s) {
  100395:	ba 00 00 00 00       	mov    $0x0,%edx
  10039a:	48 85 f6             	test   %rsi,%rsi
  10039d:	74 10                	je     1003af <strnlen+0x21>
  10039f:	80 3c 17 00          	cmpb   $0x0,(%rdi,%rdx,1)
  1003a3:	74 0b                	je     1003b0 <strnlen+0x22>
        ++n;
  1003a5:	48 83 c2 01          	add    $0x1,%rdx
    for (n = 0; n != maxlen && *s != '\0'; ++s) {
  1003a9:	48 39 d0             	cmp    %rdx,%rax
  1003ac:	75 f1                	jne    10039f <strnlen+0x11>
  1003ae:	c3                   	ret
  1003af:	c3                   	ret
  1003b0:	48 89 d0             	mov    %rdx,%rax
}
  1003b3:	c3                   	ret

00000000001003b4 <strchr>:
char* strchr(const char* s, int c) {
  1003b4:	f3 0f 1e fa          	endbr64
    while (*s != '\0' && *s != (char) c) {
  1003b8:	0f b6 07             	movzbl (%rdi),%eax
  1003bb:	84 c0                	test   %al,%al
  1003bd:	74 10                	je     1003cf <strchr+0x1b>
  1003bf:	40 38 f0             	cmp    %sil,%al
  1003c2:	74 18                	je     1003dc <strchr+0x28>
        ++s;
  1003c4:	48 83 c7 01          	add    $0x1,%rdi
    while (*s != '\0' && *s != (char) c) {
  1003c8:	0f b6 07             	movzbl (%rdi),%eax
  1003cb:	84 c0                	test   %al,%al
  1003cd:	75 f0                	jne    1003bf <strchr+0xb>
        return (char*) s;
  1003cf:	40 84 f6             	test   %sil,%sil
  1003d2:	b8 00 00 00 00       	mov    $0x0,%eax
  1003d7:	48 0f 44 c7          	cmove  %rdi,%rax
}
  1003db:	c3                   	ret
        return (char*) s;
  1003dc:	48 89 f8             	mov    %rdi,%rax
  1003df:	c3                   	ret

00000000001003e0 <rand()>:
int rand() {
  1003e0:	f3 0f 1e fa          	endbr64
    if (!rand_seed_set) {
  1003e4:	83 3d 2d 2c 00 00 00 	cmpl   $0x0,0x2c2d(%rip)        # 103018 <rand_seed_set>
  1003eb:	74 27                	je     100414 <rand()+0x34>
    rand_seed = rand_seed * 6364136223846793005UL + 1;
  1003ed:	48 b8 2d 7f 95 4c 2d 	movabs $0x5851f42d4c957f2d,%rax
  1003f4:	f4 51 58 
  1003f7:	48 0f af 05 11 2c 00 	imul   0x2c11(%rip),%rax        # 103010 <rand_seed>
  1003fe:	00 
  1003ff:	48 83 c0 01          	add    $0x1,%rax
  100403:	48 89 05 06 2c 00 00 	mov    %rax,0x2c06(%rip)        # 103010 <rand_seed>
    return (rand_seed >> 32) & RAND_MAX;
  10040a:	48 c1 e8 20          	shr    $0x20,%rax
  10040e:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
}
  100413:	c3                   	ret
    rand_seed = ((unsigned long) seed << 32) | seed;
  100414:	48 b8 9e 87 d4 30 9e 	movabs $0x30d4879e30d4879e,%rax
  10041b:	87 d4 30 
  10041e:	48 89 05 eb 2b 00 00 	mov    %rax,0x2beb(%rip)        # 103010 <rand_seed>
    rand_seed_set = 1;
  100425:	c7 05 e9 2b 00 00 01 	movl   $0x1,0x2be9(%rip)        # 103018 <rand_seed_set>
  10042c:	00 00 00 
}
  10042f:	eb bc                	jmp    1003ed <rand()+0xd>

0000000000100431 <rand(int, int)>:
int rand(int min, int max) {
  100431:	f3 0f 1e fa          	endbr64
  100435:	55                   	push   %rbp
  100436:	48 89 e5             	mov    %rsp,%rbp
  100439:	41 54                	push   %r12
  10043b:	53                   	push   %rbx
    assert(min <= max);
  10043c:	39 f7                	cmp    %esi,%edi
  10043e:	7f 26                	jg     100466 <rand(int, int)+0x35>
  100440:	41 89 fc             	mov    %edi,%r12d
  100443:	89 f3                	mov    %esi,%ebx
    unsigned long r = rand();
  100445:	e8 96 ff ff ff       	call   1003e0 <rand()>
    return min + (r * (max - min + 1)) / ((unsigned long) RAND_MAX + 1);
  10044a:	44 29 e3             	sub    %r12d,%ebx
  10044d:	83 c3 01             	add    $0x1,%ebx
  100450:	48 63 db             	movslq %ebx,%rbx
    unsigned long r = rand();
  100453:	48 98                	cltq
    return min + (r * (max - min + 1)) / ((unsigned long) RAND_MAX + 1);
  100455:	48 0f af d8          	imul   %rax,%rbx
  100459:	48 c1 eb 1f          	shr    $0x1f,%rbx
  10045d:	41 8d 04 1c          	lea    (%r12,%rbx,1),%eax
}
  100461:	5b                   	pop    %rbx
  100462:	41 5c                	pop    %r12
  100464:	5d                   	pop    %rbp
  100465:	c3                   	ret
    assert(min <= max);
  100466:	b9 00 00 00 00       	mov    $0x0,%ecx
  10046b:	ba 16 11 10 00       	mov    $0x101116,%edx
  100470:	be 45 01 00 00       	mov    $0x145,%esi
  100475:	bf 21 11 10 00       	mov    $0x101121,%edi
  10047a:	e8 a6 0b 00 00       	call   101025 <assert_fail(char const*, int, char const*, char const*)>
  10047f:	90                   	nop

0000000000100480 <printer::vprintf(int, char const*, __va_list_tag*)>:
void printer::vprintf(int color, const char* format, va_list val) {
  100480:	f3 0f 1e fa          	endbr64
  100484:	55                   	push   %rbp
  100485:	48 89 e5             	mov    %rsp,%rbp
  100488:	41 57                	push   %r15
  10048a:	41 56                	push   %r14
  10048c:	41 55                	push   %r13
  10048e:	41 54                	push   %r12
  100490:	53                   	push   %rbx
  100491:	48 83 ec 58          	sub    $0x58,%rsp
  100495:	49 89 ff             	mov    %rdi,%r15
  100498:	41 89 f5             	mov    %esi,%r13d
  10049b:	49 89 d4             	mov    %rdx,%r12
  10049e:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
    for (; *format; ++format) {
  1004a2:	0f b6 02             	movzbl (%rdx),%eax
  1004a5:	84 c0                	test   %al,%al
  1004a7:	0f 85 aa 05 00 00    	jne    100a57 <printer::vprintf(int, char const*, __va_list_tag*)+0x5d7>
}
  1004ad:	48 83 c4 58          	add    $0x58,%rsp
  1004b1:	5b                   	pop    %rbx
  1004b2:	41 5c                	pop    %r12
  1004b4:	41 5d                	pop    %r13
  1004b6:	41 5e                	pop    %r14
  1004b8:	41 5f                	pop    %r15
  1004ba:	5d                   	pop    %rbp
  1004bb:	c3                   	ret
        for (++format; *format; ++format) {
  1004bc:	49 8d 5c 24 01       	lea    0x1(%r12),%rbx
  1004c1:	45 0f b6 64 24 01    	movzbl 0x1(%r12),%r12d
  1004c7:	45 84 e4             	test   %r12b,%r12b
  1004ca:	0f 84 08 01 00 00    	je     1005d8 <printer::vprintf(int, char const*, __va_list_tag*)+0x158>
        int flags = 0;
  1004d0:	41 be 00 00 00 00    	mov    $0x0,%r14d
            const char* flagc = strchr(flag_chars, *format);
  1004d6:	41 0f be f4          	movsbl %r12b,%esi
  1004da:	bf 31 18 10 00       	mov    $0x101831,%edi
  1004df:	e8 d0 fe ff ff       	call   1003b4 <strchr>
  1004e4:	48 89 c1             	mov    %rax,%rcx
            if (flagc) {
  1004e7:	48 85 c0             	test   %rax,%rax
  1004ea:	74 74                	je     100560 <printer::vprintf(int, char const*, __va_list_tag*)+0xe0>
                flags |= 1 << (flagc - flag_chars);
  1004ec:	48 81 e9 31 18 10 00 	sub    $0x101831,%rcx
  1004f3:	b8 01 00 00 00       	mov    $0x1,%eax
  1004f8:	d3 e0                	shl    %cl,%eax
  1004fa:	41 09 c6             	or     %eax,%r14d
        for (++format; *format; ++format) {
  1004fd:	48 83 c3 01          	add    $0x1,%rbx
  100501:	44 0f b6 23          	movzbl (%rbx),%r12d
  100505:	45 84 e4             	test   %r12b,%r12b
  100508:	75 cc                	jne    1004d6 <printer::vprintf(int, char const*, __va_list_tag*)+0x56>
        int width = -1;
  10050a:	44 89 75 a4          	mov    %r14d,-0x5c(%rbp)
  10050e:	41 be ff ff ff ff    	mov    $0xffffffff,%r14d
        int precision = -1;
  100514:	c7 45 a0 ff ff ff ff 	movl   $0xffffffff,-0x60(%rbp)
        if (*format == '.') {
  10051b:	80 3b 2e             	cmpb   $0x2e,(%rbx)
  10051e:	0f 84 dc 00 00 00    	je     100600 <printer::vprintf(int, char const*, __va_list_tag*)+0x180>
        switch (*format) {
  100524:	0f b6 03             	movzbl (%rbx),%eax
  100527:	3c 6c                	cmp    $0x6c,%al
  100529:	0f 84 77 01 00 00    	je     1006a6 <printer::vprintf(int, char const*, __va_list_tag*)+0x226>
  10052f:	0f 8f 52 01 00 00    	jg     100687 <printer::vprintf(int, char const*, __va_list_tag*)+0x207>
  100535:	3c 68                	cmp    $0x68,%al
  100537:	0f 85 8c 01 00 00    	jne    1006c9 <printer::vprintf(int, char const*, __va_list_tag*)+0x249>
            ++format;
  10053d:	48 8d 43 01          	lea    0x1(%rbx),%rax
  100541:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
        switch (*format) {
  100545:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
  100549:	8d 50 bd             	lea    -0x43(%rax),%edx
  10054c:	80 fa 35             	cmp    $0x35,%dl
  10054f:	0f 87 b8 05 00 00    	ja     100b0d <printer::vprintf(int, char const*, __va_list_tag*)+0x68d>
  100555:	0f b6 d2             	movzbl %dl,%edx
  100558:	3e ff 24 d5 40 11 10 	notrack jmp *0x101140(,%rdx,8)
  10055f:	00 
        if (*format >= '1' && *format <= '9') {
  100560:	44 89 75 a4          	mov    %r14d,-0x5c(%rbp)
  100564:	41 8d 44 24 cf       	lea    -0x31(%r12),%eax
  100569:	3c 08                	cmp    $0x8,%al
  10056b:	77 31                	ja     10059e <printer::vprintf(int, char const*, __va_list_tag*)+0x11e>
            for (width = 0; *format >= '0' && *format <= '9'; ) {
  10056d:	0f b6 03             	movzbl (%rbx),%eax
  100570:	8d 50 d0             	lea    -0x30(%rax),%edx
  100573:	80 fa 09             	cmp    $0x9,%dl
  100576:	77 72                	ja     1005ea <printer::vprintf(int, char const*, __va_list_tag*)+0x16a>
  100578:	41 be 00 00 00 00    	mov    $0x0,%r14d
                width = 10 * width + *format++ - '0';
  10057e:	48 83 c3 01          	add    $0x1,%rbx
  100582:	43 8d 14 b6          	lea    (%r14,%r14,4),%edx
  100586:	0f be c0             	movsbl %al,%eax
  100589:	44 8d 74 50 d0       	lea    -0x30(%rax,%rdx,2),%r14d
            for (width = 0; *format >= '0' && *format <= '9'; ) {
  10058e:	0f b6 03             	movzbl (%rbx),%eax
  100591:	8d 50 d0             	lea    -0x30(%rax),%edx
  100594:	80 fa 09             	cmp    $0x9,%dl
  100597:	76 e5                	jbe    10057e <printer::vprintf(int, char const*, __va_list_tag*)+0xfe>
  100599:	e9 76 ff ff ff       	jmp    100514 <printer::vprintf(int, char const*, __va_list_tag*)+0x94>
        } else if (*format == '*') {
  10059e:	41 80 fc 2a          	cmp    $0x2a,%r12b
  1005a2:	75 51                	jne    1005f5 <printer::vprintf(int, char const*, __va_list_tag*)+0x175>
            width = va_arg(val, int);
  1005a4:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1005a8:	8b 01                	mov    (%rcx),%eax
  1005aa:	83 f8 2f             	cmp    $0x2f,%eax
  1005ad:	77 17                	ja     1005c6 <printer::vprintf(int, char const*, __va_list_tag*)+0x146>
  1005af:	89 c2                	mov    %eax,%edx
  1005b1:	48 03 51 10          	add    0x10(%rcx),%rdx
  1005b5:	83 c0 08             	add    $0x8,%eax
  1005b8:	89 01                	mov    %eax,(%rcx)
  1005ba:	44 8b 32             	mov    (%rdx),%r14d
            ++format;
  1005bd:	48 83 c3 01          	add    $0x1,%rbx
  1005c1:	e9 4e ff ff ff       	jmp    100514 <printer::vprintf(int, char const*, __va_list_tag*)+0x94>
            width = va_arg(val, int);
  1005c6:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  1005ca:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  1005ce:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1005d2:	48 89 47 08          	mov    %rax,0x8(%rdi)
  1005d6:	eb e2                	jmp    1005ba <printer::vprintf(int, char const*, __va_list_tag*)+0x13a>
        int flags = 0;
  1005d8:	c7 45 a4 00 00 00 00 	movl   $0x0,-0x5c(%rbp)
        int width = -1;
  1005df:	41 be ff ff ff ff    	mov    $0xffffffff,%r14d
  1005e5:	e9 2a ff ff ff       	jmp    100514 <printer::vprintf(int, char const*, __va_list_tag*)+0x94>
            for (width = 0; *format >= '0' && *format <= '9'; ) {
  1005ea:	41 be 00 00 00 00    	mov    $0x0,%r14d
  1005f0:	e9 1f ff ff ff       	jmp    100514 <printer::vprintf(int, char const*, __va_list_tag*)+0x94>
        int width = -1;
  1005f5:	41 be ff ff ff ff    	mov    $0xffffffff,%r14d
  1005fb:	e9 14 ff ff ff       	jmp    100514 <printer::vprintf(int, char const*, __va_list_tag*)+0x94>
            ++format;
  100600:	48 8d 53 01          	lea    0x1(%rbx),%rdx
            if (*format >= '0' && *format <= '9') {
  100604:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
  100608:	8d 48 d0             	lea    -0x30(%rax),%ecx
  10060b:	80 f9 09             	cmp    $0x9,%cl
  10060e:	76 13                	jbe    100623 <printer::vprintf(int, char const*, __va_list_tag*)+0x1a3>
            } else if (*format == '*') {
  100610:	3c 2a                	cmp    $0x2a,%al
  100612:	74 33                	je     100647 <printer::vprintf(int, char const*, __va_list_tag*)+0x1c7>
            ++format;
  100614:	48 89 d3             	mov    %rdx,%rbx
                precision = 0;
  100617:	c7 45 a0 00 00 00 00 	movl   $0x0,-0x60(%rbp)
  10061e:	e9 01 ff ff ff       	jmp    100524 <printer::vprintf(int, char const*, __va_list_tag*)+0xa4>
                for (precision = 0; *format >= '0' && *format <= '9'; ) {
  100623:	b9 00 00 00 00       	mov    $0x0,%ecx
                    precision = 10 * precision + *format++ - '0';
  100628:	48 83 c2 01          	add    $0x1,%rdx
  10062c:	8d 0c 89             	lea    (%rcx,%rcx,4),%ecx
  10062f:	0f be c0             	movsbl %al,%eax
  100632:	8d 4c 48 d0          	lea    -0x30(%rax,%rcx,2),%ecx
                for (precision = 0; *format >= '0' && *format <= '9'; ) {
  100636:	0f b6 02             	movzbl (%rdx),%eax
  100639:	8d 70 d0             	lea    -0x30(%rax),%esi
  10063c:	40 80 fe 09          	cmp    $0x9,%sil
  100640:	76 e6                	jbe    100628 <printer::vprintf(int, char const*, __va_list_tag*)+0x1a8>
  100642:	48 89 d3             	mov    %rdx,%rbx
  100645:	eb 1c                	jmp    100663 <printer::vprintf(int, char const*, __va_list_tag*)+0x1e3>
                precision = va_arg(val, int);
  100647:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  10064b:	8b 01                	mov    (%rcx),%eax
  10064d:	83 f8 2f             	cmp    $0x2f,%eax
  100650:	77 23                	ja     100675 <printer::vprintf(int, char const*, __va_list_tag*)+0x1f5>
  100652:	89 c2                	mov    %eax,%edx
  100654:	48 03 51 10          	add    0x10(%rcx),%rdx
  100658:	83 c0 08             	add    $0x8,%eax
  10065b:	89 01                	mov    %eax,(%rcx)
  10065d:	8b 0a                	mov    (%rdx),%ecx
                ++format;
  10065f:	48 83 c3 02          	add    $0x2,%rbx
            if (precision < 0) {
  100663:	85 c9                	test   %ecx,%ecx
  100665:	b8 00 00 00 00       	mov    $0x0,%eax
  10066a:	0f 49 c1             	cmovns %ecx,%eax
  10066d:	89 45 a0             	mov    %eax,-0x60(%rbp)
  100670:	e9 af fe ff ff       	jmp    100524 <printer::vprintf(int, char const*, __va_list_tag*)+0xa4>
                precision = va_arg(val, int);
  100675:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  100679:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  10067d:	48 8d 42 08          	lea    0x8(%rdx),%rax
  100681:	48 89 41 08          	mov    %rax,0x8(%rcx)
  100685:	eb d6                	jmp    10065d <printer::vprintf(int, char const*, __va_list_tag*)+0x1dd>
        switch (*format) {
  100687:	3c 74                	cmp    $0x74,%al
  100689:	74 1b                	je     1006a6 <printer::vprintf(int, char const*, __va_list_tag*)+0x226>
  10068b:	3c 7a                	cmp    $0x7a,%al
  10068d:	74 17                	je     1006a6 <printer::vprintf(int, char const*, __va_list_tag*)+0x226>
        switch (*format) {
  10068f:	8d 50 bd             	lea    -0x43(%rax),%edx
  100692:	80 fa 35             	cmp    $0x35,%dl
  100695:	0f 87 6f 06 00 00    	ja     100d0a <printer::vprintf(int, char const*, __va_list_tag*)+0x88a>
  10069b:	0f b6 d2             	movzbl %dl,%edx
  10069e:	3e ff 24 d5 f0 12 10 	notrack jmp *0x1012f0(,%rdx,8)
  1006a5:	00 
            ++format;
  1006a6:	48 8d 43 01          	lea    0x1(%rbx),%rax
  1006aa:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
        switch (*format) {
  1006ae:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
  1006b2:	8d 50 bd             	lea    -0x43(%rax),%edx
  1006b5:	80 fa 35             	cmp    $0x35,%dl
  1006b8:	0f 87 4f 04 00 00    	ja     100b0d <printer::vprintf(int, char const*, __va_list_tag*)+0x68d>
  1006be:	0f b6 d2             	movzbl %dl,%edx
  1006c1:	3e ff 24 d5 a0 14 10 	notrack jmp *0x1014a0(,%rdx,8)
  1006c8:	00 
  1006c9:	8d 50 bd             	lea    -0x43(%rax),%edx
  1006cc:	80 fa 35             	cmp    $0x35,%dl
  1006cf:	0f 87 34 04 00 00    	ja     100b09 <printer::vprintf(int, char const*, __va_list_tag*)+0x689>
  1006d5:	0f b6 d2             	movzbl %dl,%edx
  1006d8:	3e ff 24 d5 50 16 10 	notrack jmp *0x101650(,%rdx,8)
  1006df:	00 
            long x = length ? va_arg(val, long) : va_arg(val, int);
  1006e0:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  1006e4:	8b 07                	mov    (%rdi),%eax
  1006e6:	83 f8 2f             	cmp    $0x2f,%eax
  1006e9:	77 38                	ja     100723 <printer::vprintf(int, char const*, __va_list_tag*)+0x2a3>
  1006eb:	89 c2                	mov    %eax,%edx
  1006ed:	48 03 57 10          	add    0x10(%rdi),%rdx
  1006f1:	83 c0 08             	add    $0x8,%eax
  1006f4:	89 07                	mov    %eax,(%rdi)
  1006f6:	48 8b 12             	mov    (%rdx),%rdx
            int negative = x < 0 ? FLAG_NEGATIVE : 0;
  1006f9:	48 89 d0             	mov    %rdx,%rax
  1006fc:	48 c1 f8 37          	sar    $0x37,%rax
            num = negative ? -x : x;
  100700:	49 89 d3             	mov    %rdx,%r11
  100703:	49 f7 db             	neg    %r11
  100706:	25 00 01 00 00       	and    $0x100,%eax
  10070b:	4c 0f 44 da          	cmove  %rdx,%r11
            flags |= FLAG_NUMERIC | FLAG_SIGNED | negative;
  10070f:	8b 7d a4             	mov    -0x5c(%rbp),%edi
  100712:	09 f8                	or     %edi,%eax
  100714:	0c c0                	or     $0xc0,%al
  100716:	89 45 a4             	mov    %eax,-0x5c(%rbp)
        const char* data = "";
  100719:	bb 15 11 10 00       	mov    $0x101115,%ebx
            break;
  10071e:	e9 f4 01 00 00       	jmp    100917 <printer::vprintf(int, char const*, __va_list_tag*)+0x497>
            long x = length ? va_arg(val, long) : va_arg(val, int);
  100723:	48 8b 5d 90          	mov    -0x70(%rbp),%rbx
  100727:	48 8b 53 08          	mov    0x8(%rbx),%rdx
  10072b:	48 8d 42 08          	lea    0x8(%rdx),%rax
  10072f:	48 89 43 08          	mov    %rax,0x8(%rbx)
  100733:	eb c1                	jmp    1006f6 <printer::vprintf(int, char const*, __va_list_tag*)+0x276>
        switch (*format) {
  100735:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  100739:	eb 04                	jmp    10073f <printer::vprintf(int, char const*, __va_list_tag*)+0x2bf>
  10073b:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            long x = length ? va_arg(val, long) : va_arg(val, int);
  10073f:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  100743:	8b 01                	mov    (%rcx),%eax
  100745:	83 f8 2f             	cmp    $0x2f,%eax
  100748:	77 10                	ja     10075a <printer::vprintf(int, char const*, __va_list_tag*)+0x2da>
  10074a:	89 c2                	mov    %eax,%edx
  10074c:	48 03 51 10          	add    0x10(%rcx),%rdx
  100750:	83 c0 08             	add    $0x8,%eax
  100753:	89 01                	mov    %eax,(%rcx)
  100755:	48 63 12             	movslq (%rdx),%rdx
  100758:	eb 9f                	jmp    1006f9 <printer::vprintf(int, char const*, __va_list_tag*)+0x279>
  10075a:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  10075e:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  100762:	48 8d 42 08          	lea    0x8(%rdx),%rax
  100766:	48 89 47 08          	mov    %rax,0x8(%rdi)
  10076a:	eb e9                	jmp    100755 <printer::vprintf(int, char const*, __va_list_tag*)+0x2d5>
        switch (*format) {
  10076c:	b8 01 00 00 00       	mov    $0x1,%eax
  100771:	c7 45 9c 0a 00 00 00 	movl   $0xa,-0x64(%rbp)
  100778:	e9 9d 00 00 00       	jmp    10081a <printer::vprintf(int, char const*, __va_list_tag*)+0x39a>
  10077d:	b8 00 00 00 00       	mov    $0x0,%eax
  100782:	c7 45 9c 0a 00 00 00 	movl   $0xa,-0x64(%rbp)
  100789:	e9 8c 00 00 00       	jmp    10081a <printer::vprintf(int, char const*, __va_list_tag*)+0x39a>
  10078e:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  100792:	b8 00 00 00 00       	mov    $0x0,%eax
  100797:	c7 45 9c 0a 00 00 00 	movl   $0xa,-0x64(%rbp)
  10079e:	eb 7a                	jmp    10081a <printer::vprintf(int, char const*, __va_list_tag*)+0x39a>
  1007a0:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  1007a4:	b8 00 00 00 00       	mov    $0x0,%eax
  1007a9:	c7 45 9c 0a 00 00 00 	movl   $0xa,-0x64(%rbp)
  1007b0:	eb 68                	jmp    10081a <printer::vprintf(int, char const*, __va_list_tag*)+0x39a>
            num = length ? va_arg(val, unsigned long) : va_arg(val, unsigned);
  1007b2:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  1007b6:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  1007ba:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1007be:	48 89 47 08          	mov    %rax,0x8(%rdi)
  1007c2:	eb 70                	jmp    100834 <printer::vprintf(int, char const*, __va_list_tag*)+0x3b4>
  1007c4:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1007c8:	8b 01                	mov    (%rcx),%eax
  1007ca:	83 f8 2f             	cmp    $0x2f,%eax
  1007cd:	77 10                	ja     1007df <printer::vprintf(int, char const*, __va_list_tag*)+0x35f>
  1007cf:	89 c2                	mov    %eax,%edx
  1007d1:	48 03 51 10          	add    0x10(%rcx),%rdx
  1007d5:	83 c0 08             	add    $0x8,%eax
  1007d8:	89 01                	mov    %eax,(%rcx)
  1007da:	44 8b 1a             	mov    (%rdx),%r11d
  1007dd:	eb 58                	jmp    100837 <printer::vprintf(int, char const*, __va_list_tag*)+0x3b7>
  1007df:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1007e3:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  1007e7:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1007eb:	48 89 41 08          	mov    %rax,0x8(%rcx)
  1007ef:	eb e9                	jmp    1007da <printer::vprintf(int, char const*, __va_list_tag*)+0x35a>
        switch (*format) {
  1007f1:	b8 01 00 00 00       	mov    $0x1,%eax
  1007f6:	eb 1b                	jmp    100813 <printer::vprintf(int, char const*, __va_list_tag*)+0x393>
  1007f8:	b8 00 00 00 00       	mov    $0x0,%eax
  1007fd:	eb 14                	jmp    100813 <printer::vprintf(int, char const*, __va_list_tag*)+0x393>
  1007ff:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  100803:	b8 00 00 00 00       	mov    $0x0,%eax
  100808:	eb 09                	jmp    100813 <printer::vprintf(int, char const*, __va_list_tag*)+0x393>
  10080a:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  10080e:	b8 00 00 00 00       	mov    $0x0,%eax
            base = -16;
  100813:	c7 45 9c f0 ff ff ff 	movl   $0xfffffff0,-0x64(%rbp)
            num = length ? va_arg(val, unsigned long) : va_arg(val, unsigned);
  10081a:	85 c0                	test   %eax,%eax
  10081c:	74 a6                	je     1007c4 <printer::vprintf(int, char const*, __va_list_tag*)+0x344>
  10081e:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  100822:	8b 07                	mov    (%rdi),%eax
  100824:	83 f8 2f             	cmp    $0x2f,%eax
  100827:	77 89                	ja     1007b2 <printer::vprintf(int, char const*, __va_list_tag*)+0x332>
  100829:	89 c2                	mov    %eax,%edx
  10082b:	48 03 57 10          	add    0x10(%rdi),%rdx
  10082f:	83 c0 08             	add    $0x8,%eax
  100832:	89 07                	mov    %eax,(%rdi)
  100834:	4c 8b 1a             	mov    (%rdx),%r11
            flags |= FLAG_NUMERIC;
  100837:	8b 45 a4             	mov    -0x5c(%rbp),%eax
  10083a:	83 c8 40             	or     $0x40,%eax
    if (base < 0) {
  10083d:	83 7d 9c 00          	cmpl   $0x0,-0x64(%rbp)
  100841:	0f 89 ea 02 00 00    	jns    100b31 <printer::vprintf(int, char const*, __va_list_tag*)+0x6b1>
    *--pos = '\0';
  100847:	c6 45 cf 00          	movb   $0x0,-0x31(%rbp)
    if (flags & FLAG_THOUSANDS) {
  10084b:	a8 20                	test   $0x20,%al
  10084d:	0f 85 0d 03 00 00    	jne    100b60 <printer::vprintf(int, char const*, __va_list_tag*)+0x6e0>
  100853:	89 45 a4             	mov    %eax,-0x5c(%rbp)
        digits = lower_digits;
  100856:	41 ba 00 18 10 00    	mov    $0x101800,%r10d
        base = -base;
  10085c:	41 b9 10 00 00 00    	mov    $0x10,%r9d
    if (flags & FLAG_THOUSANDS) {
  100862:	c7 45 98 40 00 00 00 	movl   $0x40,-0x68(%rbp)
        thousands_pos = nullptr;
  100869:	bf 00 00 00 00       	mov    $0x0,%edi
  10086e:	e9 0f 03 00 00       	jmp    100b82 <printer::vprintf(int, char const*, __va_list_tag*)+0x702>
        switch (*format) {
  100873:	b8 01 00 00 00       	mov    $0x1,%eax
  100878:	eb 1b                	jmp    100895 <printer::vprintf(int, char const*, __va_list_tag*)+0x415>
  10087a:	b8 00 00 00 00       	mov    $0x0,%eax
  10087f:	eb 14                	jmp    100895 <printer::vprintf(int, char const*, __va_list_tag*)+0x415>
  100881:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  100885:	b8 00 00 00 00       	mov    $0x0,%eax
  10088a:	eb 09                	jmp    100895 <printer::vprintf(int, char const*, __va_list_tag*)+0x415>
  10088c:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  100890:	b8 00 00 00 00       	mov    $0x0,%eax
            base = 16;
  100895:	c7 45 9c 10 00 00 00 	movl   $0x10,-0x64(%rbp)
            goto format_unsigned;
  10089c:	e9 79 ff ff ff       	jmp    10081a <printer::vprintf(int, char const*, __va_list_tag*)+0x39a>
        switch (*format) {
  1008a1:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  1008a5:	eb 04                	jmp    1008ab <printer::vprintf(int, char const*, __va_list_tag*)+0x42b>
  1008a7:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            num = (uintptr_t) va_arg(val, void*);
  1008ab:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1008af:	8b 01                	mov    (%rcx),%eax
  1008b1:	83 f8 2f             	cmp    $0x2f,%eax
  1008b4:	77 22                	ja     1008d8 <printer::vprintf(int, char const*, __va_list_tag*)+0x458>
  1008b6:	89 c2                	mov    %eax,%edx
  1008b8:	48 03 51 10          	add    0x10(%rcx),%rdx
  1008bc:	83 c0 08             	add    $0x8,%eax
  1008bf:	89 01                	mov    %eax,(%rcx)
  1008c1:	4c 8b 1a             	mov    (%rdx),%r11
            flags |= FLAG_ALT | FLAG_ALT2 | FLAG_NUMERIC;
  1008c4:	8b 45 a4             	mov    -0x5c(%rbp),%eax
  1008c7:	0d 41 02 00 00       	or     $0x241,%eax
            base = -16;
  1008cc:	c7 45 9c f0 ff ff ff 	movl   $0xfffffff0,-0x64(%rbp)
  1008d3:	e9 6f ff ff ff       	jmp    100847 <printer::vprintf(int, char const*, __va_list_tag*)+0x3c7>
            num = (uintptr_t) va_arg(val, void*);
  1008d8:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  1008dc:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  1008e0:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1008e4:	48 89 47 08          	mov    %rax,0x8(%rdi)
  1008e8:	eb d7                	jmp    1008c1 <printer::vprintf(int, char const*, __va_list_tag*)+0x441>
        switch (*format) {
  1008ea:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  1008ee:	eb 04                	jmp    1008f4 <printer::vprintf(int, char const*, __va_list_tag*)+0x474>
  1008f0:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            data = va_arg(val, char*);
  1008f4:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  1008f8:	8b 07                	mov    (%rdi),%eax
  1008fa:	83 f8 2f             	cmp    $0x2f,%eax
  1008fd:	0f 87 70 01 00 00    	ja     100a73 <printer::vprintf(int, char const*, __va_list_tag*)+0x5f3>
  100903:	89 c2                	mov    %eax,%edx
  100905:	48 03 57 10          	add    0x10(%rdi),%rdx
  100909:	83 c0 08             	add    $0x8,%eax
  10090c:	89 07                	mov    %eax,(%rdi)
  10090e:	48 8b 1a             	mov    (%rdx),%rbx
        unsigned long num = 0;
  100911:	41 bb 00 00 00 00    	mov    $0x0,%r11d
        if (flags & FLAG_NUMERIC) {
  100917:	8b 45 a4             	mov    -0x5c(%rbp),%eax
  10091a:	83 e0 40             	and    $0x40,%eax
  10091d:	89 45 98             	mov    %eax,-0x68(%rbp)
        const char* prefix = "";
  100920:	41 bc 15 11 10 00    	mov    $0x101115,%r12d
        if (flags & FLAG_NUMERIC) {
  100926:	0f 85 f8 03 00 00    	jne    100d24 <printer::vprintf(int, char const*, __va_list_tag*)+0x8a4>
        if (precision >= 0 && !(flags & FLAG_NUMERIC)) {
  10092c:	8b 7d a0             	mov    -0x60(%rbp),%edi
  10092f:	89 f8                	mov    %edi,%eax
  100931:	f7 d0                	not    %eax
  100933:	c1 e8 1f             	shr    $0x1f,%eax
  100936:	89 45 8c             	mov    %eax,-0x74(%rbp)
  100939:	83 7d 98 00          	cmpl   $0x0,-0x68(%rbp)
  10093d:	0f 85 63 03 00 00    	jne    100ca6 <printer::vprintf(int, char const*, __va_list_tag*)+0x826>
  100943:	84 c0                	test   %al,%al
  100945:	0f 84 5b 03 00 00    	je     100ca6 <printer::vprintf(int, char const*, __va_list_tag*)+0x826>
            datalen = strnlen(data, precision);
  10094b:	48 63 f7             	movslq %edi,%rsi
  10094e:	48 89 df             	mov    %rbx,%rdi
  100951:	e8 38 fa ff ff       	call   10038e <strnlen>
  100956:	89 45 9c             	mov    %eax,-0x64(%rbp)
                   && datalen + (int) strlen(prefix) < width) {
  100959:	8b 45 a4             	mov    -0x5c(%rbp),%eax
  10095c:	83 e0 46             	and    $0x46,%eax
            zeros = 0;
  10095f:	c7 45 a0 00 00 00 00 	movl   $0x0,-0x60(%rbp)
                   && datalen + (int) strlen(prefix) < width) {
  100966:	83 f8 42             	cmp    $0x42,%eax
  100969:	0f 84 6f 03 00 00    	je     100cde <printer::vprintf(int, char const*, __va_list_tag*)+0x85e>
        width -= datalen + zeros + strlen(prefix);
  10096f:	4c 89 e7             	mov    %r12,%rdi
  100972:	e8 f8 f9 ff ff       	call   10036f <strlen>
  100977:	8b 7d a0             	mov    -0x60(%rbp),%edi
  10097a:	8b 4d 9c             	mov    -0x64(%rbp),%ecx
  10097d:	01 f9                	add    %edi,%ecx
  10097f:	44 89 f2             	mov    %r14d,%edx
  100982:	29 ca                	sub    %ecx,%edx
  100984:	29 c2                	sub    %eax,%edx
  100986:	41 89 d6             	mov    %edx,%r14d
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
  100989:	f6 45 a4 04          	testb  $0x4,-0x5c(%rbp)
  10098d:	75 32                	jne    1009c1 <printer::vprintf(int, char const*, __va_list_tag*)+0x541>
  10098f:	85 d2                	test   %edx,%edx
  100991:	7e 2e                	jle    1009c1 <printer::vprintf(int, char const*, __va_list_tag*)+0x541>
        width -= datalen + zeros + strlen(prefix);
  100993:	89 55 a4             	mov    %edx,-0x5c(%rbp)
            putc(' ', color);
  100996:	49 8b 07             	mov    (%r15),%rax
  100999:	44 89 ea             	mov    %r13d,%edx
  10099c:	be 20 00 00 00       	mov    $0x20,%esi
  1009a1:	4c 89 ff             	mov    %r15,%rdi
  1009a4:	ff 10                	call   *(%rax)
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
  1009a6:	41 83 ee 01          	sub    $0x1,%r14d
  1009aa:	45 85 f6             	test   %r14d,%r14d
  1009ad:	7f e7                	jg     100996 <printer::vprintf(int, char const*, __va_list_tag*)+0x516>
  1009af:	8b 55 a4             	mov    -0x5c(%rbp),%edx
  1009b2:	85 d2                	test   %edx,%edx
  1009b4:	b8 01 00 00 00       	mov    $0x1,%eax
  1009b9:	0f 4f c2             	cmovg  %edx,%eax
  1009bc:	29 c2                	sub    %eax,%edx
  1009be:	41 89 d6             	mov    %edx,%r14d
        for (; *prefix; ++prefix) {
  1009c1:	41 0f b6 04 24       	movzbl (%r12),%eax
  1009c6:	84 c0                	test   %al,%al
  1009c8:	74 1b                	je     1009e5 <printer::vprintf(int, char const*, __va_list_tag*)+0x565>
            putc(*prefix, color);
  1009ca:	0f b6 f0             	movzbl %al,%esi
  1009cd:	49 8b 07             	mov    (%r15),%rax
  1009d0:	44 89 ea             	mov    %r13d,%edx
  1009d3:	4c 89 ff             	mov    %r15,%rdi
  1009d6:	ff 10                	call   *(%rax)
        for (; *prefix; ++prefix) {
  1009d8:	49 83 c4 01          	add    $0x1,%r12
  1009dc:	41 0f b6 04 24       	movzbl (%r12),%eax
  1009e1:	84 c0                	test   %al,%al
  1009e3:	75 e5                	jne    1009ca <printer::vprintf(int, char const*, __va_list_tag*)+0x54a>
        for (; zeros > 0; --zeros) {
  1009e5:	44 8b 65 a0          	mov    -0x60(%rbp),%r12d
  1009e9:	45 85 e4             	test   %r12d,%r12d
  1009ec:	7e 16                	jle    100a04 <printer::vprintf(int, char const*, __va_list_tag*)+0x584>
            putc('0', color);
  1009ee:	49 8b 07             	mov    (%r15),%rax
  1009f1:	44 89 ea             	mov    %r13d,%edx
  1009f4:	be 30 00 00 00       	mov    $0x30,%esi
  1009f9:	4c 89 ff             	mov    %r15,%rdi
  1009fc:	ff 10                	call   *(%rax)
        for (; zeros > 0; --zeros) {
  1009fe:	41 83 ec 01          	sub    $0x1,%r12d
  100a02:	75 ea                	jne    1009ee <printer::vprintf(int, char const*, __va_list_tag*)+0x56e>
        for (; datalen > 0; ++data, --datalen) {
  100a04:	8b 45 9c             	mov    -0x64(%rbp),%eax
  100a07:	85 c0                	test   %eax,%eax
  100a09:	7e 1d                	jle    100a28 <printer::vprintf(int, char const*, __va_list_tag*)+0x5a8>
  100a0b:	41 89 c4             	mov    %eax,%r12d
  100a0e:	49 01 dc             	add    %rbx,%r12
            putc(*data, color);
  100a11:	0f b6 33             	movzbl (%rbx),%esi
  100a14:	49 8b 07             	mov    (%r15),%rax
  100a17:	44 89 ea             	mov    %r13d,%edx
  100a1a:	4c 89 ff             	mov    %r15,%rdi
  100a1d:	ff 10                	call   *(%rax)
        for (; datalen > 0; ++data, --datalen) {
  100a1f:	48 83 c3 01          	add    $0x1,%rbx
  100a23:	49 39 dc             	cmp    %rbx,%r12
  100a26:	75 e9                	jne    100a11 <printer::vprintf(int, char const*, __va_list_tag*)+0x591>
        for (; width > 0; --width) {
  100a28:	45 85 f6             	test   %r14d,%r14d
  100a2b:	7e 16                	jle    100a43 <printer::vprintf(int, char const*, __va_list_tag*)+0x5c3>
            putc(' ', color);
  100a2d:	49 8b 07             	mov    (%r15),%rax
  100a30:	44 89 ea             	mov    %r13d,%edx
  100a33:	be 20 00 00 00       	mov    $0x20,%esi
  100a38:	4c 89 ff             	mov    %r15,%rdi
  100a3b:	ff 10                	call   *(%rax)
        for (; width > 0; --width) {
  100a3d:	41 83 ee 01          	sub    $0x1,%r14d
  100a41:	75 ea                	jne    100a2d <printer::vprintf(int, char const*, __va_list_tag*)+0x5ad>
    for (; *format; ++format) {
  100a43:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  100a47:	4c 8d 60 01          	lea    0x1(%rax),%r12
  100a4b:	0f b6 40 01          	movzbl 0x1(%rax),%eax
  100a4f:	84 c0                	test   %al,%al
  100a51:	0f 84 56 fa ff ff    	je     1004ad <printer::vprintf(int, char const*, __va_list_tag*)+0x2d>
        if (*format != '%') {
  100a57:	3c 25                	cmp    $0x25,%al
  100a59:	0f 84 5d fa ff ff    	je     1004bc <printer::vprintf(int, char const*, __va_list_tag*)+0x3c>
            putc(*format, color);
  100a5f:	0f b6 f0             	movzbl %al,%esi
  100a62:	49 8b 07             	mov    (%r15),%rax
  100a65:	44 89 ea             	mov    %r13d,%edx
  100a68:	4c 89 ff             	mov    %r15,%rdi
  100a6b:	ff 10                	call   *(%rax)
            continue;
  100a6d:	4c 89 65 a8          	mov    %r12,-0x58(%rbp)
  100a71:	eb d0                	jmp    100a43 <printer::vprintf(int, char const*, __va_list_tag*)+0x5c3>
            data = va_arg(val, char*);
  100a73:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  100a77:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  100a7b:	48 8d 42 08          	lea    0x8(%rdx),%rax
  100a7f:	48 89 41 08          	mov    %rax,0x8(%rcx)
  100a83:	e9 86 fe ff ff       	jmp    10090e <printer::vprintf(int, char const*, __va_list_tag*)+0x48e>
        switch (*format) {
  100a88:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  100a8c:	eb 04                	jmp    100a92 <printer::vprintf(int, char const*, __va_list_tag*)+0x612>
  100a8e:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            color = va_arg(val, int);
  100a92:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  100a96:	8b 01                	mov    (%rcx),%eax
  100a98:	83 f8 2f             	cmp    $0x2f,%eax
  100a9b:	77 10                	ja     100aad <printer::vprintf(int, char const*, __va_list_tag*)+0x62d>
  100a9d:	89 c2                	mov    %eax,%edx
  100a9f:	48 03 51 10          	add    0x10(%rcx),%rdx
  100aa3:	83 c0 08             	add    $0x8,%eax
  100aa6:	89 01                	mov    %eax,(%rcx)
  100aa8:	44 8b 2a             	mov    (%rdx),%r13d
            continue;
  100aab:	eb 96                	jmp    100a43 <printer::vprintf(int, char const*, __va_list_tag*)+0x5c3>
            color = va_arg(val, int);
  100aad:	48 8b 5d 90          	mov    -0x70(%rbp),%rbx
  100ab1:	48 8b 53 08          	mov    0x8(%rbx),%rdx
  100ab5:	48 8d 42 08          	lea    0x8(%rdx),%rax
  100ab9:	48 89 43 08          	mov    %rax,0x8(%rbx)
  100abd:	eb e9                	jmp    100aa8 <printer::vprintf(int, char const*, __va_list_tag*)+0x628>
        switch (*format) {
  100abf:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  100ac3:	eb 04                	jmp    100ac9 <printer::vprintf(int, char const*, __va_list_tag*)+0x649>
  100ac5:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            numbuf[0] = va_arg(val, int);
  100ac9:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  100acd:	8b 07                	mov    (%rdi),%eax
  100acf:	83 f8 2f             	cmp    $0x2f,%eax
  100ad2:	77 23                	ja     100af7 <printer::vprintf(int, char const*, __va_list_tag*)+0x677>
  100ad4:	89 c2                	mov    %eax,%edx
  100ad6:	48 03 57 10          	add    0x10(%rdi),%rdx
  100ada:	83 c0 08             	add    $0x8,%eax
  100add:	89 07                	mov    %eax,(%rdi)
  100adf:	8b 02                	mov    (%rdx),%eax
  100ae1:	88 45 b0             	mov    %al,-0x50(%rbp)
            numbuf[1] = '\0';
  100ae4:	c6 45 b1 00          	movb   $0x0,-0x4f(%rbp)
            data = numbuf;
  100ae8:	48 8d 5d b0          	lea    -0x50(%rbp),%rbx
        unsigned long num = 0;
  100aec:	41 bb 00 00 00 00    	mov    $0x0,%r11d
            break;
  100af2:	e9 20 fe ff ff       	jmp    100917 <printer::vprintf(int, char const*, __va_list_tag*)+0x497>
            numbuf[0] = va_arg(val, int);
  100af7:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  100afb:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  100aff:	48 8d 42 08          	lea    0x8(%rdx),%rax
  100b03:	48 89 47 08          	mov    %rax,0x8(%rdi)
  100b07:	eb d6                	jmp    100adf <printer::vprintf(int, char const*, __va_list_tag*)+0x65f>
        switch (*format) {
  100b09:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            numbuf[0] = (*format ? *format : '%');
  100b0d:	84 c0                	test   %al,%al
  100b0f:	0f 85 f1 01 00 00    	jne    100d06 <printer::vprintf(int, char const*, __va_list_tag*)+0x886>
  100b15:	c6 45 b0 25          	movb   $0x25,-0x50(%rbp)
            numbuf[1] = '\0';
  100b19:	c6 45 b1 00          	movb   $0x0,-0x4f(%rbp)
                format--;
  100b1d:	48 83 6d a8 01       	subq   $0x1,-0x58(%rbp)
            data = numbuf;
  100b22:	48 8d 5d b0          	lea    -0x50(%rbp),%rbx
        unsigned long num = 0;
  100b26:	41 bb 00 00 00 00    	mov    $0x0,%r11d
  100b2c:	e9 e6 fd ff ff       	jmp    100917 <printer::vprintf(int, char const*, __va_list_tag*)+0x497>
    *--pos = '\0';
  100b31:	c6 45 cf 00          	movb   $0x0,-0x31(%rbp)
    if (flags & FLAG_THOUSANDS) {
  100b35:	f6 45 a4 20          	testb  $0x20,-0x5c(%rbp)
  100b39:	74 73                	je     100bae <printer::vprintf(int, char const*, __va_list_tag*)+0x72e>
        thousands_pos = pos - (base == 10 ? 3 : 4);
  100b3b:	8b 5d 9c             	mov    -0x64(%rbp),%ebx
  100b3e:	41 89 d9             	mov    %ebx,%r9d
  100b41:	89 45 a4             	mov    %eax,-0x5c(%rbp)
  100b44:	41 ba 20 18 10 00    	mov    $0x101820,%r10d
  100b4a:	c7 45 98 40 00 00 00 	movl   $0x40,-0x68(%rbp)
  100b51:	83 fb 0a             	cmp    $0xa,%ebx
  100b54:	0f 94 c0             	sete   %al
  100b57:	0f b6 c0             	movzbl %al,%eax
  100b5a:	48 83 e8 04          	sub    $0x4,%rax
  100b5e:	eb 1d                	jmp    100b7d <printer::vprintf(int, char const*, __va_list_tag*)+0x6fd>
    if (flags & FLAG_THOUSANDS) {
  100b60:	89 45 a4             	mov    %eax,-0x5c(%rbp)
        digits = lower_digits;
  100b63:	41 ba 00 18 10 00    	mov    $0x101800,%r10d
        base = -base;
  100b69:	41 b9 10 00 00 00    	mov    $0x10,%r9d
    if (flags & FLAG_THOUSANDS) {
  100b6f:	c7 45 98 40 00 00 00 	movl   $0x40,-0x68(%rbp)
        thousands_pos = pos - (base == 10 ? 3 : 4);
  100b76:	48 c7 c0 fc ff ff ff 	mov    $0xfffffffffffffffc,%rax
  100b7d:	48 8d 7c 05 cf       	lea    -0x31(%rbp,%rax,1),%rdi
  100b82:	48 8d 4d ce          	lea    -0x32(%rbp),%rcx
        thousands_pos = nullptr;
  100b86:	4c 89 d8             	mov    %r11,%rax
            *--pos = digits[val % base];
  100b89:	49 63 f1             	movslq %r9d,%rsi
    } while (val != 0 && pos != buf);
  100b8c:	4c 8d 45 b0          	lea    -0x50(%rbp),%r8
  100b90:	eb 57                	jmp    100be9 <printer::vprintf(int, char const*, __va_list_tag*)+0x769>
    if (flags & FLAG_THOUSANDS) {
  100b92:	41 ba 20 18 10 00    	mov    $0x101820,%r10d
  100b98:	41 b9 0a 00 00 00    	mov    $0xa,%r9d
  100b9e:	c7 45 9c 0a 00 00 00 	movl   $0xa,-0x64(%rbp)
        thousands_pos = pos - (base == 10 ? 3 : 4);
  100ba5:	48 c7 c0 fd ff ff ff 	mov    $0xfffffffffffffffd,%rax
  100bac:	eb cf                	jmp    100b7d <printer::vprintf(int, char const*, __va_list_tag*)+0x6fd>
  100bae:	44 8b 4d 9c          	mov    -0x64(%rbp),%r9d
  100bb2:	89 45 a4             	mov    %eax,-0x5c(%rbp)
  100bb5:	41 ba 20 18 10 00    	mov    $0x101820,%r10d
  100bbb:	c7 45 98 40 00 00 00 	movl   $0x40,-0x68(%rbp)
        thousands_pos = nullptr;
  100bc2:	bf 00 00 00 00       	mov    $0x0,%edi
  100bc7:	eb b9                	jmp    100b82 <printer::vprintf(int, char const*, __va_list_tag*)+0x702>
            *--pos = digits[val % base];
  100bc9:	48 89 cb             	mov    %rcx,%rbx
  100bcc:	ba 00 00 00 00       	mov    $0x0,%edx
  100bd1:	48 f7 f6             	div    %rsi
  100bd4:	41 0f b6 14 12       	movzbl (%r10,%rdx,1),%edx
  100bd9:	88 11                	mov    %dl,(%rcx)
    } while (val != 0 && pos != buf);
  100bdb:	48 83 e9 01          	sub    $0x1,%rcx
  100bdf:	48 85 c0             	test   %rax,%rax
  100be2:	74 2d                	je     100c11 <printer::vprintf(int, char const*, __va_list_tag*)+0x791>
  100be4:	4c 39 c3             	cmp    %r8,%rbx
  100be7:	74 28                	je     100c11 <printer::vprintf(int, char const*, __va_list_tag*)+0x791>
        if (pos == thousands_pos) {
  100be9:	48 8d 51 01          	lea    0x1(%rcx),%rdx
  100bed:	48 39 d7             	cmp    %rdx,%rdi
  100bf0:	75 d7                	jne    100bc9 <printer::vprintf(int, char const*, __va_list_tag*)+0x749>
            *--pos = base == 10 ? ',' : '\'';
  100bf2:	48 89 cb             	mov    %rcx,%rbx
  100bf5:	41 83 f9 0a          	cmp    $0xa,%r9d
  100bf9:	0f 94 c2             	sete   %dl
  100bfc:	8d 54 92 27          	lea    0x27(%rdx,%rdx,4),%edx
  100c00:	40 0f 94 c7          	sete   %dil
  100c04:	40 0f b6 ff          	movzbl %dil,%edi
  100c08:	88 11                	mov    %dl,(%rcx)
            thousands_pos = pos - (base == 10 ? 3 : 4);
  100c0a:	48 8d 7c 39 fc       	lea    -0x4(%rcx,%rdi,1),%rdi
  100c0f:	eb ca                	jmp    100bdb <printer::vprintf(int, char const*, __va_list_tag*)+0x75b>
        if ((flags & FLAG_NUMERIC) && (flags & FLAG_SIGNED)) {
  100c11:	8b 7d a4             	mov    -0x5c(%rbp),%edi
  100c14:	89 f8                	mov    %edi,%eax
  100c16:	f7 d0                	not    %eax
  100c18:	a8 c0                	test   $0xc0,%al
  100c1a:	75 3c                	jne    100c58 <printer::vprintf(int, char const*, __va_list_tag*)+0x7d8>
                prefix = "-";
  100c1c:	41 bc 2d 11 10 00    	mov    $0x10112d,%r12d
            if (flags & FLAG_NEGATIVE) {
  100c22:	f7 c7 00 01 00 00    	test   $0x100,%edi
  100c28:	0f 85 fe fc ff ff    	jne    10092c <printer::vprintf(int, char const*, __va_list_tag*)+0x4ac>
                prefix = "+";
  100c2e:	41 bc 28 11 10 00    	mov    $0x101128,%r12d
            } else if (flags & FLAG_PLUSPOSITIVE) {
  100c34:	40 f6 c7 10          	test   $0x10,%dil
  100c38:	0f 85 ee fc ff ff    	jne    10092c <printer::vprintf(int, char const*, __va_list_tag*)+0x4ac>
        const char* prefix = "";
  100c3e:	40 f6 c7 08          	test   $0x8,%dil
  100c42:	ba 2f 11 10 00       	mov    $0x10112f,%edx
  100c47:	b8 15 11 10 00       	mov    $0x101115,%eax
  100c4c:	48 0f 45 c2          	cmovne %rdx,%rax
  100c50:	49 89 c4             	mov    %rax,%r12
  100c53:	e9 d4 fc ff ff       	jmp    10092c <printer::vprintf(int, char const*, __va_list_tag*)+0x4ac>
  100c58:	41 bc 15 11 10 00    	mov    $0x101115,%r12d
        } else if ((flags & FLAG_NUMERIC) && (flags & FLAG_ALT)
  100c5e:	8b 4d a4             	mov    -0x5c(%rbp),%ecx
  100c61:	89 c8                	mov    %ecx,%eax
  100c63:	f7 d0                	not    %eax
  100c65:	a8 41                	test   $0x41,%al
  100c67:	0f 85 bf fc ff ff    	jne    10092c <printer::vprintf(int, char const*, __va_list_tag*)+0x4ac>
                   && (base == 16 || base == -16)
  100c6d:	8b 45 9c             	mov    -0x64(%rbp),%eax
  100c70:	83 c0 10             	add    $0x10,%eax
  100c73:	a9 df ff ff ff       	test   $0xffffffdf,%eax
  100c78:	0f 85 ae fc ff ff    	jne    10092c <printer::vprintf(int, char const*, __va_list_tag*)+0x4ac>
                   && (num || (flags & FLAG_ALT2))) {
  100c7e:	4d 85 db             	test   %r11,%r11
  100c81:	75 09                	jne    100c8c <printer::vprintf(int, char const*, __va_list_tag*)+0x80c>
  100c83:	f6 c5 02             	test   $0x2,%ch
  100c86:	0f 84 a0 fc ff ff    	je     10092c <printer::vprintf(int, char const*, __va_list_tag*)+0x4ac>
            prefix = (base == -16 ? "0x" : "0X");
  100c8c:	83 7d 9c f0          	cmpl   $0xfffffff0,-0x64(%rbp)
  100c90:	ba 2a 11 10 00       	mov    $0x10112a,%edx
  100c95:	b8 31 11 10 00       	mov    $0x101131,%eax
  100c9a:	48 0f 45 c2          	cmovne %rdx,%rax
  100c9e:	49 89 c4             	mov    %rax,%r12
  100ca1:	e9 86 fc ff ff       	jmp    10092c <printer::vprintf(int, char const*, __va_list_tag*)+0x4ac>
            datalen = strlen(data);
  100ca6:	48 89 df             	mov    %rbx,%rdi
  100ca9:	e8 c1 f6 ff ff       	call   10036f <strlen>
  100cae:	89 45 9c             	mov    %eax,-0x64(%rbp)
            && precision >= 0) {
  100cb1:	83 7d 98 00          	cmpl   $0x0,-0x68(%rbp)
  100cb5:	0f 84 9e fc ff ff    	je     100959 <printer::vprintf(int, char const*, __va_list_tag*)+0x4d9>
  100cbb:	80 7d 8c 00          	cmpb   $0x0,-0x74(%rbp)
  100cbf:	0f 84 94 fc ff ff    	je     100959 <printer::vprintf(int, char const*, __va_list_tag*)+0x4d9>
            zeros = precision > datalen ? precision - datalen : 0;
  100cc5:	8b 7d a0             	mov    -0x60(%rbp),%edi
  100cc8:	89 fa                	mov    %edi,%edx
  100cca:	29 c2                	sub    %eax,%edx
  100ccc:	39 c7                	cmp    %eax,%edi
  100cce:	b8 00 00 00 00       	mov    $0x0,%eax
  100cd3:	0f 4f c2             	cmovg  %edx,%eax
  100cd6:	89 45 a0             	mov    %eax,-0x60(%rbp)
  100cd9:	e9 91 fc ff ff       	jmp    10096f <printer::vprintf(int, char const*, __va_list_tag*)+0x4ef>
                   && datalen + (int) strlen(prefix) < width) {
  100cde:	4c 89 e7             	mov    %r12,%rdi
  100ce1:	e8 89 f6 ff ff       	call   10036f <strlen>
  100ce6:	8b 7d 9c             	mov    -0x64(%rbp),%edi
  100ce9:	8d 14 07             	lea    (%rdi,%rax,1),%edx
            zeros = width - datalen - strlen(prefix);
  100cec:	44 89 f1             	mov    %r14d,%ecx
  100cef:	29 f9                	sub    %edi,%ecx
  100cf1:	29 c1                	sub    %eax,%ecx
  100cf3:	44 39 f2             	cmp    %r14d,%edx
  100cf6:	b8 00 00 00 00       	mov    $0x0,%eax
  100cfb:	0f 4c c1             	cmovl  %ecx,%eax
  100cfe:	89 45 a0             	mov    %eax,-0x60(%rbp)
  100d01:	e9 69 fc ff ff       	jmp    10096f <printer::vprintf(int, char const*, __va_list_tag*)+0x4ef>
  100d06:	48 8b 5d a8          	mov    -0x58(%rbp),%rbx
            numbuf[0] = (*format ? *format : '%');
  100d0a:	88 45 b0             	mov    %al,-0x50(%rbp)
            numbuf[1] = '\0';
  100d0d:	c6 45 b1 00          	movb   $0x0,-0x4f(%rbp)
  100d11:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            data = numbuf;
  100d15:	48 8d 5d b0          	lea    -0x50(%rbp),%rbx
        unsigned long num = 0;
  100d19:	41 bb 00 00 00 00    	mov    $0x0,%r11d
  100d1f:	e9 f3 fb ff ff       	jmp    100917 <printer::vprintf(int, char const*, __va_list_tag*)+0x497>
    *--pos = '\0';
  100d24:	c6 45 cf 00          	movb   $0x0,-0x31(%rbp)
    if (flags & FLAG_THOUSANDS) {
  100d28:	f6 45 a4 20          	testb  $0x20,-0x5c(%rbp)
  100d2c:	0f 85 60 fe ff ff    	jne    100b92 <printer::vprintf(int, char const*, __va_list_tag*)+0x712>
  100d32:	41 ba 20 18 10 00    	mov    $0x101820,%r10d
  100d38:	41 b9 0a 00 00 00    	mov    $0xa,%r9d
  100d3e:	c7 45 9c 0a 00 00 00 	movl   $0xa,-0x64(%rbp)
        thousands_pos = nullptr;
  100d45:	bf 00 00 00 00       	mov    $0x0,%edi
  100d4a:	e9 33 fe ff ff       	jmp    100b82 <printer::vprintf(int, char const*, __va_list_tag*)+0x702>

0000000000100d4f <vsnprintf>:
};

ssize_t vsnprintf(char* s, size_t size, const char* format, va_list val) {
  100d4f:	f3 0f 1e fa          	endbr64
  100d53:	55                   	push   %rbp
  100d54:	48 89 e5             	mov    %rsp,%rbp
  100d57:	53                   	push   %rbx
  100d58:	48 83 ec 28          	sub    $0x28,%rsp
  100d5c:	48 89 f3             	mov    %rsi,%rbx
        : s_(s), end_(s + size), n_(0) {
  100d5f:	48 c7 45 d0 00 19 10 	movq   $0x101900,-0x30(%rbp)
  100d66:	00 
  100d67:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  100d6b:	48 01 f7             	add    %rsi,%rdi
  100d6e:	48 89 7d e0          	mov    %rdi,-0x20(%rbp)
  100d72:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
  100d79:	00 
    string_printer sp(s, size);
    sp.vprintf(0, format, val);
  100d7a:	be 00 00 00 00       	mov    $0x0,%esi
  100d7f:	48 8d 7d d0          	lea    -0x30(%rbp),%rdi
  100d83:	e8 f8 f6 ff ff       	call   100480 <printer::vprintf(int, char const*, __va_list_tag*)>
    if (size && sp.s_ < sp.end_) {
  100d88:	48 85 db             	test   %rbx,%rbx
  100d8b:	74 10                	je     100d9d <vsnprintf+0x4e>
  100d8d:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  100d91:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  100d95:	48 39 c2             	cmp    %rax,%rdx
  100d98:	73 0d                	jae    100da7 <vsnprintf+0x58>
        *sp.s_ = 0;
  100d9a:	c6 02 00             	movb   $0x0,(%rdx)
    } else if (size) {
        sp.end_[-1] = 0;
    }
    return sp.n_;
}
  100d9d:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  100da1:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
  100da5:	c9                   	leave
  100da6:	c3                   	ret
        sp.end_[-1] = 0;
  100da7:	c6 40 ff 00          	movb   $0x0,-0x1(%rax)
  100dab:	eb f0                	jmp    100d9d <vsnprintf+0x4e>

0000000000100dad <snprintf>:

ssize_t snprintf(char* s, size_t size, const char* format, ...) {
  100dad:	f3 0f 1e fa          	endbr64
  100db1:	55                   	push   %rbp
  100db2:	48 89 e5             	mov    %rsp,%rbp
  100db5:	48 83 ec 50          	sub    $0x50,%rsp
  100db9:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  100dbd:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
  100dc1:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
  100dc5:	c7 45 b8 18 00 00 00 	movl   $0x18,-0x48(%rbp)
  100dcc:	48 8d 45 10          	lea    0x10(%rbp),%rax
  100dd0:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
  100dd4:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  100dd8:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    int n = vsnprintf(s, size, format, val);
  100ddc:	48 8d 4d b8          	lea    -0x48(%rbp),%rcx
  100de0:	e8 6a ff ff ff       	call   100d4f <vsnprintf>
    va_end(val);
    return n;
  100de5:	48 98                	cltq
}
  100de7:	c9                   	leave
  100de8:	c3                   	ret
  100de9:	90                   	nop

0000000000100dea <console_printer::console_printer(int, bool)>:
    void scroll();
    void move_cursor();
};

__noinline
console_printer::console_printer(int cpos, bool scroll)
  100dea:	f3 0f 1e fa          	endbr64
    : cell_(console), scroll_(scroll) {
  100dee:	48 c7 07 18 19 10 00 	movq   $0x101918,(%rdi)
  100df5:	48 c7 47 08 00 80 0b 	movq   $0xb8000,0x8(%rdi)
  100dfc:	00 
  100dfd:	88 57 10             	mov    %dl,0x10(%rdi)
    if (cpos < 0) {
  100e00:	85 f6                	test   %esi,%esi
  100e02:	78 18                	js     100e1c <console_printer::console_printer(int, bool)+0x32>
        cell_ += cursorpos;
    } else if (cpos <= CONSOLE_ROWS * CONSOLE_COLUMNS) {
  100e04:	81 fe d0 07 00 00    	cmp    $0x7d0,%esi
  100e0a:	7f 0f                	jg     100e1b <console_printer::console_printer(int, bool)+0x31>
        cell_ += cpos;
  100e0c:	48 63 f6             	movslq %esi,%rsi
  100e0f:	48 8d 84 36 00 80 0b 	lea    0xb8000(%rsi,%rsi,1),%rax
  100e16:	00 
  100e17:	48 89 47 08          	mov    %rax,0x8(%rdi)
    }
}
  100e1b:	c3                   	ret
        cell_ += cursorpos;
  100e1c:	8b 05 da 81 fb ff    	mov    -0x47e26(%rip),%eax        # b8ffc <cursorpos>
  100e22:	48 98                	cltq
  100e24:	48 8d 84 00 00 80 0b 	lea    0xb8000(%rax,%rax,1),%rax
  100e2b:	00 
  100e2c:	48 89 47 08          	mov    %rax,0x8(%rdi)
  100e30:	c3                   	ret
  100e31:	90                   	nop

0000000000100e32 <console_printer::scroll()>:

__noinline
void console_printer::scroll() {
  100e32:	f3 0f 1e fa          	endbr64
    assert(cell_ >= console + CONSOLE_ROWS * CONSOLE_COLUMNS);
  100e36:	48 81 7f 08 a0 8f 0b 	cmpq   $0xb8fa0,0x8(%rdi)
  100e3d:	00 
  100e3e:	72 56                	jb     100e96 <console_printer::scroll()+0x64>
    if (scroll_) {
  100e40:	b8 00 80 0b 00       	mov    $0xb8000,%eax
  100e45:	80 7f 10 00          	cmpb   $0x0,0x10(%rdi)
  100e49:	74 46                	je     100e91 <console_printer::scroll()+0x5f>
        int i = 0;
  100e4b:	b8 00 00 00 00       	mov    $0x0,%eax
        while (i != (CONSOLE_ROWS - 1) * CONSOLE_COLUMNS) {
            console[i] = console[i + CONSOLE_COLUMNS];
  100e50:	8d 50 50             	lea    0x50(%rax),%edx
  100e53:	b9 00 80 0b 00       	mov    $0xb8000,%ecx
  100e58:	48 63 d2             	movslq %edx,%rdx
  100e5b:	0f b7 34 51          	movzwl (%rcx,%rdx,2),%esi
  100e5f:	48 63 d0             	movslq %eax,%rdx
  100e62:	66 89 34 51          	mov    %si,(%rcx,%rdx,2)
            ++i;
  100e66:	83 c0 01             	add    $0x1,%eax
        while (i != (CONSOLE_ROWS - 1) * CONSOLE_COLUMNS) {
  100e69:	3d 80 07 00 00       	cmp    $0x780,%eax
  100e6e:	75 e0                	jne    100e50 <console_printer::scroll()+0x1e>
        }
        while (i != CONSOLE_ROWS * CONSOLE_COLUMNS) {
            console[i] = 0;
  100e70:	48 63 d0             	movslq %eax,%rdx
  100e73:	66 c7 84 12 00 80 0b 	movw   $0x0,0xb8000(%rdx,%rdx,1)
  100e7a:	00 00 00 
            ++i;
  100e7d:	83 c0 01             	add    $0x1,%eax
        while (i != CONSOLE_ROWS * CONSOLE_COLUMNS) {
  100e80:	3d d0 07 00 00       	cmp    $0x7d0,%eax
  100e85:	75 e9                	jne    100e70 <console_printer::scroll()+0x3e>
        }
        cell_ -= CONSOLE_COLUMNS;
  100e87:	48 8b 47 08          	mov    0x8(%rdi),%rax
  100e8b:	48 2d a0 00 00 00    	sub    $0xa0,%rax
  100e91:	48 89 47 08          	mov    %rax,0x8(%rdi)
  100e95:	c3                   	ret
void console_printer::scroll() {
  100e96:	55                   	push   %rbp
  100e97:	48 89 e5             	mov    %rsp,%rbp
    assert(cell_ >= console + CONSOLE_ROWS * CONSOLE_COLUMNS);
  100e9a:	b9 00 00 00 00       	mov    $0x0,%ecx
  100e9f:	ba 38 18 10 00       	mov    $0x101838,%edx
  100ea4:	be 80 02 00 00       	mov    $0x280,%esi
  100ea9:	bf 21 11 10 00       	mov    $0x101121,%edi
  100eae:	e8 72 01 00 00       	call   101025 <assert_fail(char const*, int, char const*, char const*)>
  100eb3:	90                   	nop

0000000000100eb4 <console_printer::putc(unsigned char, int)>:
    extern void console_show_cursor(int);
    console_show_cursor(cursorpos);
#endif
}

inline void console_printer::putc(unsigned char c, int color) {
  100eb4:	f3 0f 1e fa          	endbr64
  100eb8:	55                   	push   %rbp
  100eb9:	48 89 e5             	mov    %rsp,%rbp
  100ebc:	41 55                	push   %r13
  100ebe:	41 54                	push   %r12
  100ec0:	53                   	push   %rbx
  100ec1:	48 83 ec 08          	sub    $0x8,%rsp
  100ec5:	48 89 fb             	mov    %rdi,%rbx
  100ec8:	41 89 f5             	mov    %esi,%r13d
  100ecb:	41 89 d4             	mov    %edx,%r12d
    while (cell_ >= console + CONSOLE_ROWS * CONSOLE_COLUMNS) {
  100ece:	48 8b 47 08          	mov    0x8(%rdi),%rax
  100ed2:	48 3d a0 8f 0b 00    	cmp    $0xb8fa0,%rax
  100ed8:	72 14                	jb     100eee <console_printer::putc(unsigned char, int)+0x3a>
        scroll();
  100eda:	48 89 df             	mov    %rbx,%rdi
  100edd:	e8 50 ff ff ff       	call   100e32 <console_printer::scroll()>
    while (cell_ >= console + CONSOLE_ROWS * CONSOLE_COLUMNS) {
  100ee2:	48 8b 43 08          	mov    0x8(%rbx),%rax
  100ee6:	48 3d a0 8f 0b 00    	cmp    $0xb8fa0,%rax
  100eec:	73 ec                	jae    100eda <console_printer::putc(unsigned char, int)+0x26>
    }
    if (c == '\n') {
  100eee:	41 80 fd 0a          	cmp    $0xa,%r13b
  100ef2:	74 1e                	je     100f12 <console_printer::putc(unsigned char, int)+0x5e>
        while (pos != 80) {
            *cell_++ = ' ' | color;
            ++pos;
        }
    } else {
        *cell_++ = c | color;
  100ef4:	45 0f b6 ed          	movzbl %r13b,%r13d
  100ef8:	45 09 e5             	or     %r12d,%r13d
  100efb:	48 8d 50 02          	lea    0x2(%rax),%rdx
  100eff:	48 89 53 08          	mov    %rdx,0x8(%rbx)
  100f03:	66 44 89 28          	mov    %r13w,(%rax)
    }
}
  100f07:	48 83 c4 08          	add    $0x8,%rsp
  100f0b:	5b                   	pop    %rbx
  100f0c:	41 5c                	pop    %r12
  100f0e:	41 5d                	pop    %r13
  100f10:	5d                   	pop    %rbp
  100f11:	c3                   	ret
        int pos = (cell_ - console) % 80;
  100f12:	48 2d 00 80 0b 00    	sub    $0xb8000,%rax
  100f18:	48 89 c1             	mov    %rax,%rcx
  100f1b:	48 89 c6             	mov    %rax,%rsi
  100f1e:	48 d1 fe             	sar    $1,%rsi
  100f21:	48 ba 67 66 66 66 66 	movabs $0x6666666666666667,%rdx
  100f28:	66 66 66 
  100f2b:	48 89 f0             	mov    %rsi,%rax
  100f2e:	48 f7 ea             	imul   %rdx
  100f31:	48 c1 fa 05          	sar    $0x5,%rdx
  100f35:	48 89 c8             	mov    %rcx,%rax
  100f38:	48 c1 f8 3f          	sar    $0x3f,%rax
  100f3c:	48 29 c2             	sub    %rax,%rdx
  100f3f:	48 8d 14 92          	lea    (%rdx,%rdx,4),%rdx
  100f43:	48 c1 e2 04          	shl    $0x4,%rdx
  100f47:	89 f0                	mov    %esi,%eax
  100f49:	29 d0                	sub    %edx,%eax
            *cell_++ = ' ' | color;
  100f4b:	41 83 cc 20          	or     $0x20,%r12d
  100f4f:	48 8b 53 08          	mov    0x8(%rbx),%rdx
  100f53:	48 8d 4a 02          	lea    0x2(%rdx),%rcx
  100f57:	48 89 4b 08          	mov    %rcx,0x8(%rbx)
  100f5b:	66 44 89 22          	mov    %r12w,(%rdx)
            ++pos;
  100f5f:	83 c0 01             	add    $0x1,%eax
        while (pos != 80) {
  100f62:	83 f8 50             	cmp    $0x50,%eax
  100f65:	75 e8                	jne    100f4f <console_printer::putc(unsigned char, int)+0x9b>
  100f67:	eb 9e                	jmp    100f07 <console_printer::putc(unsigned char, int)+0x53>
  100f69:	90                   	nop

0000000000100f6a <console_printer::move_cursor()>:
void console_printer::move_cursor() {
  100f6a:	f3 0f 1e fa          	endbr64
    cursorpos = cell_ - console;
  100f6e:	48 8b 47 08          	mov    0x8(%rdi),%rax
  100f72:	48 2d 00 80 0b 00    	sub    $0xb8000,%rax
  100f78:	48 d1 f8             	sar    $1,%rax
  100f7b:	89 05 7b 80 fb ff    	mov    %eax,-0x47f85(%rip)        # b8ffc <cursorpos>
}
  100f81:	c3                   	ret

0000000000100f82 <console_vprintf(int, int, char const*, __va_list_tag*)>:

// console_vprintf, console_printf
//    Print a message onto the console, starting at the given cursor position.

__noinline
int console_vprintf(int cpos, int color, const char* format, va_list val) {
  100f82:	f3 0f 1e fa          	endbr64
  100f86:	55                   	push   %rbp
  100f87:	48 89 e5             	mov    %rsp,%rbp
  100f8a:	41 56                	push   %r14
  100f8c:	41 55                	push   %r13
  100f8e:	41 54                	push   %r12
  100f90:	53                   	push   %rbx
  100f91:	48 83 ec 20          	sub    $0x20,%rsp
  100f95:	89 fb                	mov    %edi,%ebx
  100f97:	41 89 f4             	mov    %esi,%r12d
  100f9a:	49 89 d5             	mov    %rdx,%r13
  100f9d:	49 89 ce             	mov    %rcx,%r14
    console_printer cp(cpos, cpos < 0);
  100fa0:	89 fa                	mov    %edi,%edx
  100fa2:	c1 ea 1f             	shr    $0x1f,%edx
  100fa5:	89 fe                	mov    %edi,%esi
  100fa7:	48 8d 7d c8          	lea    -0x38(%rbp),%rdi
  100fab:	e8 3a fe ff ff       	call   100dea <console_printer::console_printer(int, bool)>
    cp.vprintf(color, format, val);
  100fb0:	4c 89 f1             	mov    %r14,%rcx
  100fb3:	4c 89 ea             	mov    %r13,%rdx
  100fb6:	44 89 e6             	mov    %r12d,%esi
  100fb9:	48 8d 7d c8          	lea    -0x38(%rbp),%rdi
  100fbd:	e8 be f4 ff ff       	call   100480 <printer::vprintf(int, char const*, __va_list_tag*)>
    if (cpos < 0) {
  100fc2:	85 db                	test   %ebx,%ebx
  100fc4:	78 1a                	js     100fe0 <console_vprintf(int, int, char const*, __va_list_tag*)+0x5e>
        cp.move_cursor();
    }
    return cp.cell_ - console;
  100fc6:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  100fca:	48 2d 00 80 0b 00    	sub    $0xb8000,%rax
  100fd0:	48 d1 f8             	sar    $1,%rax
}
  100fd3:	48 83 c4 20          	add    $0x20,%rsp
  100fd7:	5b                   	pop    %rbx
  100fd8:	41 5c                	pop    %r12
  100fda:	41 5d                	pop    %r13
  100fdc:	41 5e                	pop    %r14
  100fde:	5d                   	pop    %rbp
  100fdf:	c3                   	ret
        cp.move_cursor();
  100fe0:	48 8d 7d c8          	lea    -0x38(%rbp),%rdi
  100fe4:	e8 81 ff ff ff       	call   100f6a <console_printer::move_cursor()>
  100fe9:	eb db                	jmp    100fc6 <console_vprintf(int, int, char const*, __va_list_tag*)+0x44>

0000000000100feb <console_printf(int, int, char const*, ...)>:

__noinline
int console_printf(int cpos, int color, const char* format, ...) {
  100feb:	f3 0f 1e fa          	endbr64
  100fef:	55                   	push   %rbp
  100ff0:	48 89 e5             	mov    %rsp,%rbp
  100ff3:	48 83 ec 50          	sub    $0x50,%rsp
  100ff7:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  100ffb:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
  100fff:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
  101003:	c7 45 b8 18 00 00 00 	movl   $0x18,-0x48(%rbp)
  10100a:	48 8d 45 10          	lea    0x10(%rbp),%rax
  10100e:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
  101012:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  101016:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    cpos = console_vprintf(cpos, color, format, val);
  10101a:	48 8d 4d b8          	lea    -0x48(%rbp),%rcx
  10101e:	e8 5f ff ff ff       	call   100f82 <console_vprintf(int, int, char const*, __va_list_tag*)>
    va_end(val);
    return cpos;
}
  101023:	c9                   	leave
  101024:	c3                   	ret

0000000000101025 <assert_fail(char const*, int, char const*, char const*)>:
int error_vprintf(int cpos, int color, const char* format, va_list val) {
    return console_vprintf(cpos, color, format, val);
}

void assert_fail(const char* file, int line, const char* msg,
                 const char* description) {
  101025:	f3 0f 1e fa          	endbr64
  101029:	55                   	push   %rbp
  10102a:	48 89 e5             	mov    %rsp,%rbp
  10102d:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
  101034:	41 89 f0             	mov    %esi,%r8d
    cursorpos = CPOS(23, 0);
  101037:	c7 05 bb 7f fb ff 30 	movl   $0x730,-0x48045(%rip)        # b8ffc <cursorpos>
  10103e:	07 00 00 
    char buf[240];
    if (description) {
  101041:	48 85 c9             	test   %rcx,%rcx
  101044:	74 39                	je     10107f <assert_fail(char const*, int, char const*, char const*)+0x5a>
  101046:	49 89 c9             	mov    %rcx,%r9
        snprintf(buf, sizeof(buf),
  101049:	48 83 ec 08          	sub    $0x8,%rsp
  10104d:	52                   	push   %rdx
  10104e:	56                   	push   %rsi
  10104f:	57                   	push   %rdi
  101050:	48 89 f9             	mov    %rdi,%rcx
  101053:	ba 98 18 10 00       	mov    $0x101898,%edx
  101058:	be f0 00 00 00       	mov    $0xf0,%esi
  10105d:	48 8d bd 10 ff ff ff 	lea    -0xf0(%rbp),%rdi
  101064:	b0 00                	mov    $0x0,%al
  101066:	e8 42 fd ff ff       	call   100dad <snprintf>
  10106b:	48 83 c4 20          	add    $0x20,%rsp
    register uintptr_t rax asm("rax") = syscallno;
  10106f:	b8 03 00 00 00       	mov    $0x3,%eax
    asm volatile ("syscall"
  101074:	48 8d bd 10 ff ff ff 	lea    -0xf0(%rbp),%rdi
  10107b:	0f 05                	syscall
//    Panic.
[[noreturn]] inline void sys_panic(const char* msg) {
    make_syscall(SYSCALL_PANIC, (uintptr_t) msg);

    // should never get here
    while (true) {
  10107d:	eb fe                	jmp    10107d <assert_fail(char const*, int, char const*, char const*)+0x58>
                 "%s:%d: %s\n%s:%d: user assertion '%s' failed\n",
                 file, line, description, file, line, msg);
    } else {
        snprintf(buf, sizeof(buf),
  10107f:	49 89 d1             	mov    %rdx,%r9
  101082:	48 89 f9             	mov    %rdi,%rcx
  101085:	ba c8 18 10 00       	mov    $0x1018c8,%edx
  10108a:	be f0 00 00 00       	mov    $0xf0,%esi
  10108f:	48 8d bd 10 ff ff ff 	lea    -0xf0(%rbp),%rdi
  101096:	b0 00                	mov    $0x0,%al
  101098:	e8 10 fd ff ff       	call   100dad <snprintf>
  10109d:	eb d0                	jmp    10106f <assert_fail(char const*, int, char const*, char const*)+0x4a>
