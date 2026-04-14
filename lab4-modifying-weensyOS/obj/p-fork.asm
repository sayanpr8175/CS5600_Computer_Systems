
obj/p-fork.full:     file format elf64-x86-64


Disassembly of section .text:

0000000000100000 <process_main()>:
    int field2;
};
const test_struct test1 = {61, {0}, 6161};
test_struct test2;

void process_main() {
  100000:	f3 0f 1e fa          	endbr64
  100004:	55                   	push   %rbp
  100005:	48 89 e5             	mov    %rsp,%rbp
  100008:	41 56                	push   %r14
  10000a:	41 55                	push   %r13
  10000c:	41 54                	push   %r12
  10000e:	53                   	push   %rbx
// make_syscall
//    These functions define the WeensyOS system call calling convention.
//    We provide versions for system calls with 0-2 arguments.

__always_inline uintptr_t make_syscall(int syscallno) {
    register uintptr_t rax asm("rax") = syscallno;
  10000f:	b8 01 00 00 00       	mov    $0x1,%eax
    asm volatile ("syscall"
  100014:	0f 05                	syscall
            : "+a" (rax)
            : /* all input registers are also output registers */
            : "cc", "memory", "rcx", "rdx", "rsi", "rdi", "r8", "r9",
              "r10", "r11");
    return rax;
  100016:	49 89 c5             	mov    %rax,%r13
    pid_t initial_pid = sys_getpid();
    test2.field1 = 61;
  100019:	c7 05 dd 1f 00 00 3d 	movl   $0x3d,0x1fdd(%rip)        # 102000 <test2>
  100020:	00 00 00 
    register uintptr_t rax asm("rax") = syscallno;
  100023:	b8 05 00 00 00       	mov    $0x5,%eax
    asm volatile ("syscall"
  100028:	0f 05                	syscall
    return rax;
  10002a:	49 89 c6             	mov    %rax,%r14
    register uintptr_t rax asm("rax") = syscallno;
  10002d:	b8 01 00 00 00       	mov    $0x1,%eax
    asm volatile ("syscall"
  100032:	0f 05                	syscall
    return rax;
  100034:	48 89 c3             	mov    %rax,%rbx
    assert(test1.field1 == 61 && test1.field2 == 6161);

    // Fork a total of three new copies, checking `fork` return values.
    pid_t p1 = sys_fork();
    pid_t intermediate_pid = sys_getpid();
    if (p1 == 0) {
  100037:	45 85 f6             	test   %r14d,%r14d
  10003a:	0f 85 c2 00 00 00    	jne    100102 <process_main()+0x102>
        assert(intermediate_pid != initial_pid);
  100040:	41 39 c5             	cmp    %eax,%r13d
  100043:	0f 84 a0 00 00 00    	je     1000e9 <process_main()+0xe9>
    register uintptr_t rax asm("rax") = syscallno;
  100049:	b8 05 00 00 00       	mov    $0x5,%eax
    asm volatile ("syscall"
  10004e:	0f 05                	syscall
    return rax;
  100050:	49 89 c4             	mov    %rax,%r12
    register uintptr_t rax asm("rax") = syscallno;
  100053:	b8 01 00 00 00       	mov    $0x1,%eax
    asm volatile ("syscall"
  100058:	0f 05                	syscall
        assert(intermediate_pid == initial_pid && p1 != initial_pid);
    }

    pid_t p2 = sys_fork();
    pid_t final_pid = sys_getpid();
    if (p2 == 0) {
  10005a:	45 85 e4             	test   %r12d,%r12d
  10005d:	0f 85 df 00 00 00    	jne    100142 <process_main()+0x142>
        assert(final_pid != initial_pid && final_pid != intermediate_pid);
  100063:	41 39 c5             	cmp    %eax,%r13d
  100066:	0f 84 bd 00 00 00    	je     100129 <process_main()+0x129>
  10006c:	39 c3                	cmp    %eax,%ebx
  10006e:	0f 84 b5 00 00 00    	je     100129 <process_main()+0x129>
        assert(final_pid == intermediate_pid);
    }

    // Check that multi-page segments can be loaded.
    assert(test1.field1 == 61 && test1.field2 == 6161);
    assert(test2.field1 == 61);
  100074:	83 3d 85 1f 00 00 3d 	cmpl   $0x3d,0x1f85(%rip)        # 102000 <test2>
  10007b:	0f 85 10 01 00 00    	jne    100191 <process_main()+0x191>
    test2.field2 = 61 + final_pid;
  100081:	8d 58 3d             	lea    0x3d(%rax),%ebx
  100084:	89 1d 7a 2f 00 00    	mov    %ebx,0x2f7a(%rip)        # 103004 <test2+0x1004>
    register uintptr_t rax asm("rax") = syscallno;
  10008a:	b8 02 00 00 00       	mov    $0x2,%eax
    asm volatile ("syscall"
  10008f:	0f 05                	syscall
    sys_yield();
    assert(test2.field2 == 61 + final_pid);
  100091:	3b 1d 6d 2f 00 00    	cmp    0x2f6d(%rip),%ebx        # 103004 <test2+0x1004>
  100097:	0f 85 0d 01 00 00    	jne    1001aa <process_main()+0x1aa>
    register uintptr_t rax asm("rax") = syscallno;
  10009d:	b8 01 00 00 00       	mov    $0x1,%eax
    asm volatile ("syscall"
  1000a2:	0f 05                	syscall
    return rax;
  1000a4:	49 89 c4             	mov    %rax,%r12


// sys_getpid
//    Return current process ID. (Never fails.)
inline pid_t sys_getpid() {
    return make_syscall(SYSCALL_GETPID);
  1000a7:	89 c3                	mov    %eax,%ebx

    // The rest of this code is like p-allocator.c.

    pid_t p = sys_getpid();
    srand(p);
  1000a9:	89 c7                	mov    %eax,%edi
  1000ab:	e8 ad 02 00 00       	call   10035d <srand(unsigned int)>
//    Return the smallest multiple of `m` greater than or equal to `x`.
//    Equivalently, round `x` up to the nearest multiple of `m`.
template <typename T>
inline constexpr T round_up(T x, unsigned m) {
    static_assert(std::is_unsigned<T>::value, "T must be unsigned");
    return round_down(x + m - 1, m);
  1000b0:	41 bd 23 40 10 00    	mov    $0x104023,%r13d
  1000b6:	49 81 e5 00 f0 ff ff 	and    $0xfffffffffffff000,%r13

    uint8_t* heap_bottom = (uint8_t*) round_up((uintptr_t) end, PAGESIZE);
    heap_top = heap_bottom;
  1000bd:	4c 89 2d 4c 2f 00 00 	mov    %r13,0x2f4c(%rip)        # 103010 <heap_top>
    return x;
}

__always_inline uintptr_t rdrsp() {
    uintptr_t x;
    asm volatile("movq %%rsp, %0" : "=r" (x));
  1000c4:	48 89 e0             	mov    %rsp,%rax
    stack_bottom = (uint8_t*) round_down((uintptr_t) rdrsp() - 1, PAGESIZE);
  1000c7:	48 83 e8 01          	sub    $0x1,%rax
  1000cb:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  1000d1:	48 89 05 30 2f 00 00 	mov    %rax,0x2f30(%rip)        # 103008 <stack_bottom>

    while (heap_top != stack_bottom) {
  1000d8:	4c 39 e8             	cmp    %r13,%rax
  1000db:	0f 84 91 01 00 00    	je     100272 <process_main()+0x272>
            console[CPOS(24, 79)] = p;
            // update `heap_top`
            heap_top += PAGESIZE;
        } else if (x < p + 1 && heap_bottom < heap_top) {
            // ensure we can write to any previously-allocated page
            uintptr_t addr = rand((uintptr_t) heap_bottom,
  1000e1:	45 89 ee             	mov    %r13d,%r14d
  1000e4:	e9 3d 01 00 00       	jmp    100226 <process_main()+0x226>
        assert(intermediate_pid != initial_pid);
  1000e9:	b9 00 00 00 00       	mov    $0x0,%ecx
  1000ee:	ba b0 0d 10 00       	mov    $0x100db0,%edx
  1000f3:	be 1d 00 00 00       	mov    $0x1d,%esi
  1000f8:	bf fb 0e 10 00       	mov    $0x100efb,%edi
  1000fd:	e8 31 0c 00 00       	call   100d33 <assert_fail(char const*, int, char const*, char const*)>
        assert(intermediate_pid == initial_pid && p1 != initial_pid);
  100102:	41 39 c5             	cmp    %eax,%r13d
  100105:	75 09                	jne    100110 <process_main()+0x110>
  100107:	45 39 f5             	cmp    %r14d,%r13d
  10010a:	0f 85 39 ff ff ff    	jne    100049 <process_main()+0x49>
  100110:	b9 00 00 00 00       	mov    $0x0,%ecx
  100115:	ba d0 0d 10 00       	mov    $0x100dd0,%edx
  10011a:	be 1f 00 00 00       	mov    $0x1f,%esi
  10011f:	bf fb 0e 10 00       	mov    $0x100efb,%edi
  100124:	e8 0a 0c 00 00       	call   100d33 <assert_fail(char const*, int, char const*, char const*)>
        assert(final_pid != initial_pid && final_pid != intermediate_pid);
  100129:	b9 00 00 00 00       	mov    $0x0,%ecx
  10012e:	ba 10 0e 10 00       	mov    $0x100e10,%edx
  100133:	be 25 00 00 00       	mov    $0x25,%esi
  100138:	bf fb 0e 10 00       	mov    $0x100efb,%edi
  10013d:	e8 f1 0b 00 00       	call   100d33 <assert_fail(char const*, int, char const*, char const*)>
        assert(p2 != p1 && p2 != intermediate_pid && p2 != initial_pid);
  100142:	45 39 e6             	cmp    %r12d,%r14d
  100145:	0f 94 c2             	sete   %dl
  100148:	44 39 e3             	cmp    %r12d,%ebx
  10014b:	0f 94 c1             	sete   %cl
  10014e:	08 ca                	or     %cl,%dl
  100150:	75 26                	jne    100178 <process_main()+0x178>
  100152:	45 39 e5             	cmp    %r12d,%r13d
  100155:	74 21                	je     100178 <process_main()+0x178>
        assert(final_pid == intermediate_pid);
  100157:	39 c3                	cmp    %eax,%ebx
  100159:	0f 84 15 ff ff ff    	je     100074 <process_main()+0x74>
  10015f:	b9 00 00 00 00       	mov    $0x0,%ecx
  100164:	ba 05 0f 10 00       	mov    $0x100f05,%edx
  100169:	be 28 00 00 00       	mov    $0x28,%esi
  10016e:	bf fb 0e 10 00       	mov    $0x100efb,%edi
  100173:	e8 bb 0b 00 00       	call   100d33 <assert_fail(char const*, int, char const*, char const*)>
        assert(p2 != p1 && p2 != intermediate_pid && p2 != initial_pid);
  100178:	b9 00 00 00 00       	mov    $0x0,%ecx
  10017d:	ba 50 0e 10 00       	mov    $0x100e50,%edx
  100182:	be 27 00 00 00       	mov    $0x27,%esi
  100187:	bf fb 0e 10 00       	mov    $0x100efb,%edi
  10018c:	e8 a2 0b 00 00       	call   100d33 <assert_fail(char const*, int, char const*, char const*)>
    assert(test2.field1 == 61);
  100191:	b9 00 00 00 00       	mov    $0x0,%ecx
  100196:	ba 23 0f 10 00       	mov    $0x100f23,%edx
  10019b:	be 2d 00 00 00       	mov    $0x2d,%esi
  1001a0:	bf fb 0e 10 00       	mov    $0x100efb,%edi
  1001a5:	e8 89 0b 00 00       	call   100d33 <assert_fail(char const*, int, char const*, char const*)>
    assert(test2.field2 == 61 + final_pid);
  1001aa:	b9 00 00 00 00       	mov    $0x0,%ecx
  1001af:	ba 88 0e 10 00       	mov    $0x100e88,%edx
  1001b4:	be 30 00 00 00       	mov    $0x30,%esi
  1001b9:	bf fb 0e 10 00       	mov    $0x100efb,%edi
  1001be:	e8 70 0b 00 00       	call   100d33 <assert_fail(char const*, int, char const*, char const*)>
    register uintptr_t rax asm("rax") = syscallno;
  1001c3:	b8 04 00 00 00       	mov    $0x4,%eax
    asm volatile ("syscall"
  1001c8:	48 8b 3d 41 2e 00 00 	mov    0x2e41(%rip),%rdi        # 103010 <heap_top>
  1001cf:	0f 05                	syscall
            if (sys_page_alloc(heap_top) < 0) {
  1001d1:	85 c0                	test   %eax,%eax
  1001d3:	0f 88 99 00 00 00    	js     100272 <process_main()+0x272>
            for (unsigned long* l = (unsigned long*) heap_top;
  1001d9:	48 8b 0d 30 2e 00 00 	mov    0x2e30(%rip),%rcx        # 103010 <heap_top>
                 l != (unsigned long*) (heap_top + PAGESIZE);
  1001e0:	48 8d 91 00 10 00 00 	lea    0x1000(%rcx),%rdx
            for (unsigned long* l = (unsigned long*) heap_top;
  1001e7:	48 89 c8             	mov    %rcx,%rax
                assert(*l == 0);
  1001ea:	48 83 38 00          	cmpq   $0x0,(%rax)
  1001ee:	75 69                	jne    100259 <process_main()+0x259>
            for (unsigned long* l = (unsigned long*) heap_top;
  1001f0:	48 83 c0 08          	add    $0x8,%rax
                 l != (unsigned long*) (heap_top + PAGESIZE);
  1001f4:	48 39 d0             	cmp    %rdx,%rax
  1001f7:	75 f1                	jne    1001ea <process_main()+0x1ea>
            *heap_top = p;
  1001f9:	44 88 21             	mov    %r12b,(%rcx)
            console[CPOS(24, 79)] = p;
  1001fc:	66 44 89 25 9a 8d fb 	mov    %r12w,-0x47266(%rip)        # b8f9e <console+0xf9e>
  100203:	ff 
            heap_top += PAGESIZE;
  100204:	48 81 05 01 2e 00 00 	addq   $0x1000,0x2e01(%rip)        # 103010 <heap_top>
  10020b:	00 10 00 00 
    register uintptr_t rax asm("rax") = syscallno;
  10020f:	b8 02 00 00 00       	mov    $0x2,%eax
    asm volatile ("syscall"
  100214:	0f 05                	syscall
    while (heap_top != stack_bottom) {
  100216:	48 8b 05 eb 2d 00 00 	mov    0x2deb(%rip),%rax        # 103008 <stack_bottom>
  10021d:	48 39 05 ec 2d 00 00 	cmp    %rax,0x2dec(%rip)        # 103010 <heap_top>
  100224:	74 4c                	je     100272 <process_main()+0x272>
        int x = rand(0, ALLOC_SLOWDOWN - 1);
  100226:	be 63 00 00 00       	mov    $0x63,%esi
  10022b:	bf 00 00 00 00       	mov    $0x0,%edi
  100230:	e8 47 01 00 00       	call   10037c <rand(int, int)>
        if (x < p) {
  100235:	39 d8                	cmp    %ebx,%eax
  100237:	7c 8a                	jl     1001c3 <process_main()+0x1c3>
        } else if (x < p + 1 && heap_bottom < heap_top) {
  100239:	75 d4                	jne    10020f <process_main()+0x20f>
  10023b:	48 8b 05 ce 2d 00 00 	mov    0x2dce(%rip),%rax        # 103010 <heap_top>
  100242:	49 39 c5             	cmp    %rax,%r13
  100245:	73 c8                	jae    10020f <process_main()+0x20f>
                                  (uintptr_t) heap_top - 1);
  100247:	8d 70 ff             	lea    -0x1(%rax),%esi
            uintptr_t addr = rand((uintptr_t) heap_bottom,
  10024a:	44 89 f7             	mov    %r14d,%edi
  10024d:	e8 2a 01 00 00       	call   10037c <rand(int, int)>
                                  (uintptr_t) heap_top - 1);
  100252:	48 98                	cltq
            *((char*) addr) = p;
  100254:	44 88 20             	mov    %r12b,(%rax)
  100257:	eb b6                	jmp    10020f <process_main()+0x20f>
                assert(*l == 0);
  100259:	b9 00 00 00 00       	mov    $0x0,%ecx
  10025e:	ba 36 0f 10 00       	mov    $0x100f36,%edx
  100263:	be 45 00 00 00       	mov    $0x45,%esi
  100268:	bf fb 0e 10 00       	mov    $0x100efb,%edi
  10026d:	e8 c1 0a 00 00       	call   100d33 <assert_fail(char const*, int, char const*, char const*)>
    register uintptr_t rax asm("rax") = syscallno;
  100272:	b8 02 00 00 00       	mov    $0x2,%eax
    asm volatile ("syscall"
  100277:	0f 05                	syscall
        }
        sys_yield();
    }

    // After running out of memory, do nothing forever
    while (true) {
  100279:	eb f7                	jmp    100272 <process_main()+0x272>
  10027b:	90                   	nop

000000000010027c <string_printer::putc(unsigned char, int)>:
    char* end_;
    size_t n_;
    string_printer(char* s, size_t size)
        : s_(s), end_(s + size), n_(0) {
    }
    void putc(unsigned char c, int) override {
  10027c:	f3 0f 1e fa          	endbr64
        if (s_ < end_) {
  100280:	48 8b 47 08          	mov    0x8(%rdi),%rax
  100284:	48 3b 47 10          	cmp    0x10(%rdi),%rax
  100288:	73 0b                	jae    100295 <string_printer::putc(unsigned char, int)+0x19>
            *s_++ = c;
  10028a:	48 8d 50 01          	lea    0x1(%rax),%rdx
  10028e:	48 89 57 08          	mov    %rdx,0x8(%rdi)
  100292:	40 88 30             	mov    %sil,(%rax)
        }
        ++n_;
  100295:	48 83 47 18 01       	addq   $0x1,0x18(%rdi)
    }
  10029a:	c3                   	ret

000000000010029b <strlen>:
size_t strlen(const char* s) {
  10029b:	f3 0f 1e fa          	endbr64
    for (n = 0; *s != '\0'; ++s) {
  10029f:	80 3f 00             	cmpb   $0x0,(%rdi)
  1002a2:	74 10                	je     1002b4 <strlen+0x19>
  1002a4:	b8 00 00 00 00       	mov    $0x0,%eax
        ++n;
  1002a9:	48 83 c0 01          	add    $0x1,%rax
    for (n = 0; *s != '\0'; ++s) {
  1002ad:	80 3c 07 00          	cmpb   $0x0,(%rdi,%rax,1)
  1002b1:	75 f6                	jne    1002a9 <strlen+0xe>
  1002b3:	c3                   	ret
  1002b4:	b8 00 00 00 00       	mov    $0x0,%eax
}
  1002b9:	c3                   	ret

00000000001002ba <strnlen>:
size_t strnlen(const char* s, size_t maxlen) {
  1002ba:	f3 0f 1e fa          	endbr64
  1002be:	48 89 f0             	mov    %rsi,%rax
    for (n = 0; n != maxlen && *s != '\0'; ++s) {
  1002c1:	ba 00 00 00 00       	mov    $0x0,%edx
  1002c6:	48 85 f6             	test   %rsi,%rsi
  1002c9:	74 10                	je     1002db <strnlen+0x21>
  1002cb:	80 3c 17 00          	cmpb   $0x0,(%rdi,%rdx,1)
  1002cf:	74 0b                	je     1002dc <strnlen+0x22>
        ++n;
  1002d1:	48 83 c2 01          	add    $0x1,%rdx
    for (n = 0; n != maxlen && *s != '\0'; ++s) {
  1002d5:	48 39 d0             	cmp    %rdx,%rax
  1002d8:	75 f1                	jne    1002cb <strnlen+0x11>
  1002da:	c3                   	ret
  1002db:	c3                   	ret
  1002dc:	48 89 d0             	mov    %rdx,%rax
}
  1002df:	c3                   	ret

00000000001002e0 <strchr>:
char* strchr(const char* s, int c) {
  1002e0:	f3 0f 1e fa          	endbr64
    while (*s != '\0' && *s != (char) c) {
  1002e4:	0f b6 07             	movzbl (%rdi),%eax
  1002e7:	84 c0                	test   %al,%al
  1002e9:	74 10                	je     1002fb <strchr+0x1b>
  1002eb:	40 38 f0             	cmp    %sil,%al
  1002ee:	74 18                	je     100308 <strchr+0x28>
        ++s;
  1002f0:	48 83 c7 01          	add    $0x1,%rdi
    while (*s != '\0' && *s != (char) c) {
  1002f4:	0f b6 07             	movzbl (%rdi),%eax
  1002f7:	84 c0                	test   %al,%al
  1002f9:	75 f0                	jne    1002eb <strchr+0xb>
        return (char*) s;
  1002fb:	40 84 f6             	test   %sil,%sil
  1002fe:	b8 00 00 00 00       	mov    $0x0,%eax
  100303:	48 0f 44 c7          	cmove  %rdi,%rax
}
  100307:	c3                   	ret
        return (char*) s;
  100308:	48 89 f8             	mov    %rdi,%rax
  10030b:	c3                   	ret

000000000010030c <rand()>:
int rand() {
  10030c:	f3 0f 1e fa          	endbr64
    if (!rand_seed_set) {
  100310:	83 3d 09 2d 00 00 00 	cmpl   $0x0,0x2d09(%rip)        # 103020 <rand_seed_set>
  100317:	74 27                	je     100340 <rand()+0x34>
    rand_seed = rand_seed * 6364136223846793005UL + 1;
  100319:	48 b8 2d 7f 95 4c 2d 	movabs $0x5851f42d4c957f2d,%rax
  100320:	f4 51 58 
  100323:	48 0f af 05 ed 2c 00 	imul   0x2ced(%rip),%rax        # 103018 <rand_seed>
  10032a:	00 
  10032b:	48 83 c0 01          	add    $0x1,%rax
  10032f:	48 89 05 e2 2c 00 00 	mov    %rax,0x2ce2(%rip)        # 103018 <rand_seed>
    return (rand_seed >> 32) & RAND_MAX;
  100336:	48 c1 e8 20          	shr    $0x20,%rax
  10033a:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
}
  10033f:	c3                   	ret
    rand_seed = ((unsigned long) seed << 32) | seed;
  100340:	48 b8 9e 87 d4 30 9e 	movabs $0x30d4879e30d4879e,%rax
  100347:	87 d4 30 
  10034a:	48 89 05 c7 2c 00 00 	mov    %rax,0x2cc7(%rip)        # 103018 <rand_seed>
    rand_seed_set = 1;
  100351:	c7 05 c5 2c 00 00 01 	movl   $0x1,0x2cc5(%rip)        # 103020 <rand_seed_set>
  100358:	00 00 00 
}
  10035b:	eb bc                	jmp    100319 <rand()+0xd>

000000000010035d <srand(unsigned int)>:
void srand(unsigned seed) {
  10035d:	f3 0f 1e fa          	endbr64
    rand_seed = ((unsigned long) seed << 32) | seed;
  100361:	89 f8                	mov    %edi,%eax
  100363:	48 c1 e7 20          	shl    $0x20,%rdi
  100367:	48 01 c7             	add    %rax,%rdi
  10036a:	48 89 3d a7 2c 00 00 	mov    %rdi,0x2ca7(%rip)        # 103018 <rand_seed>
    rand_seed_set = 1;
  100371:	c7 05 a5 2c 00 00 01 	movl   $0x1,0x2ca5(%rip)        # 103020 <rand_seed_set>
  100378:	00 00 00 
}
  10037b:	c3                   	ret

000000000010037c <rand(int, int)>:
int rand(int min, int max) {
  10037c:	f3 0f 1e fa          	endbr64
  100380:	55                   	push   %rbp
  100381:	48 89 e5             	mov    %rsp,%rbp
  100384:	41 54                	push   %r12
  100386:	53                   	push   %rbx
    assert(min <= max);
  100387:	39 f7                	cmp    %esi,%edi
  100389:	7f 26                	jg     1003b1 <rand(int, int)+0x35>
  10038b:	41 89 fc             	mov    %edi,%r12d
  10038e:	89 f3                	mov    %esi,%ebx
    unsigned long r = rand();
  100390:	e8 77 ff ff ff       	call   10030c <rand()>
    return min + (r * (max - min + 1)) / ((unsigned long) RAND_MAX + 1);
  100395:	44 29 e3             	sub    %r12d,%ebx
  100398:	83 c3 01             	add    $0x1,%ebx
  10039b:	48 63 db             	movslq %ebx,%rbx
    unsigned long r = rand();
  10039e:	48 98                	cltq
    return min + (r * (max - min + 1)) / ((unsigned long) RAND_MAX + 1);
  1003a0:	48 0f af d8          	imul   %rax,%rbx
  1003a4:	48 c1 eb 1f          	shr    $0x1f,%rbx
  1003a8:	41 8d 04 1c          	lea    (%r12,%rbx,1),%eax
}
  1003ac:	5b                   	pop    %rbx
  1003ad:	41 5c                	pop    %r12
  1003af:	5d                   	pop    %rbp
  1003b0:	c3                   	ret
    assert(min <= max);
  1003b1:	b9 00 00 00 00       	mov    $0x0,%ecx
  1003b6:	ba 3e 0f 10 00       	mov    $0x100f3e,%edx
  1003bb:	be 45 01 00 00       	mov    $0x145,%esi
  1003c0:	bf 49 0f 10 00       	mov    $0x100f49,%edi
  1003c5:	e8 69 09 00 00       	call   100d33 <assert_fail(char const*, int, char const*, char const*)>

00000000001003ca <printer::vprintf(int, char const*, __va_list_tag*)>:
void printer::vprintf(int color, const char* format, va_list val) {
  1003ca:	f3 0f 1e fa          	endbr64
  1003ce:	55                   	push   %rbp
  1003cf:	48 89 e5             	mov    %rsp,%rbp
  1003d2:	41 57                	push   %r15
  1003d4:	41 56                	push   %r14
  1003d6:	41 55                	push   %r13
  1003d8:	41 54                	push   %r12
  1003da:	53                   	push   %rbx
  1003db:	48 83 ec 58          	sub    $0x58,%rsp
  1003df:	49 89 ff             	mov    %rdi,%r15
  1003e2:	41 89 f5             	mov    %esi,%r13d
  1003e5:	49 89 d4             	mov    %rdx,%r12
  1003e8:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
    for (; *format; ++format) {
  1003ec:	0f b6 02             	movzbl (%rdx),%eax
  1003ef:	84 c0                	test   %al,%al
  1003f1:	0f 85 aa 05 00 00    	jne    1009a1 <printer::vprintf(int, char const*, __va_list_tag*)+0x5d7>
}
  1003f7:	48 83 c4 58          	add    $0x58,%rsp
  1003fb:	5b                   	pop    %rbx
  1003fc:	41 5c                	pop    %r12
  1003fe:	41 5d                	pop    %r13
  100400:	41 5e                	pop    %r14
  100402:	41 5f                	pop    %r15
  100404:	5d                   	pop    %rbp
  100405:	c3                   	ret
        for (++format; *format; ++format) {
  100406:	49 8d 5c 24 01       	lea    0x1(%r12),%rbx
  10040b:	45 0f b6 64 24 01    	movzbl 0x1(%r12),%r12d
  100411:	45 84 e4             	test   %r12b,%r12b
  100414:	0f 84 08 01 00 00    	je     100522 <printer::vprintf(int, char const*, __va_list_tag*)+0x158>
        int flags = 0;
  10041a:	41 be 00 00 00 00    	mov    $0x0,%r14d
            const char* flagc = strchr(flag_chars, *format);
  100420:	41 0f be f4          	movsbl %r12b,%esi
  100424:	bf 51 16 10 00       	mov    $0x101651,%edi
  100429:	e8 b2 fe ff ff       	call   1002e0 <strchr>
  10042e:	48 89 c1             	mov    %rax,%rcx
            if (flagc) {
  100431:	48 85 c0             	test   %rax,%rax
  100434:	74 74                	je     1004aa <printer::vprintf(int, char const*, __va_list_tag*)+0xe0>
                flags |= 1 << (flagc - flag_chars);
  100436:	48 81 e9 51 16 10 00 	sub    $0x101651,%rcx
  10043d:	b8 01 00 00 00       	mov    $0x1,%eax
  100442:	d3 e0                	shl    %cl,%eax
  100444:	41 09 c6             	or     %eax,%r14d
        for (++format; *format; ++format) {
  100447:	48 83 c3 01          	add    $0x1,%rbx
  10044b:	44 0f b6 23          	movzbl (%rbx),%r12d
  10044f:	45 84 e4             	test   %r12b,%r12b
  100452:	75 cc                	jne    100420 <printer::vprintf(int, char const*, __va_list_tag*)+0x56>
        int width = -1;
  100454:	44 89 75 a4          	mov    %r14d,-0x5c(%rbp)
  100458:	41 be ff ff ff ff    	mov    $0xffffffff,%r14d
        int precision = -1;
  10045e:	c7 45 a0 ff ff ff ff 	movl   $0xffffffff,-0x60(%rbp)
        if (*format == '.') {
  100465:	80 3b 2e             	cmpb   $0x2e,(%rbx)
  100468:	0f 84 dc 00 00 00    	je     10054a <printer::vprintf(int, char const*, __va_list_tag*)+0x180>
        switch (*format) {
  10046e:	0f b6 03             	movzbl (%rbx),%eax
  100471:	3c 6c                	cmp    $0x6c,%al
  100473:	0f 84 77 01 00 00    	je     1005f0 <printer::vprintf(int, char const*, __va_list_tag*)+0x226>
  100479:	0f 8f 52 01 00 00    	jg     1005d1 <printer::vprintf(int, char const*, __va_list_tag*)+0x207>
  10047f:	3c 68                	cmp    $0x68,%al
  100481:	0f 85 8c 01 00 00    	jne    100613 <printer::vprintf(int, char const*, __va_list_tag*)+0x249>
            ++format;
  100487:	48 8d 43 01          	lea    0x1(%rbx),%rax
  10048b:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
        switch (*format) {
  10048f:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
  100493:	8d 50 bd             	lea    -0x43(%rax),%edx
  100496:	80 fa 35             	cmp    $0x35,%dl
  100499:	0f 87 b8 05 00 00    	ja     100a57 <printer::vprintf(int, char const*, __va_list_tag*)+0x68d>
  10049f:	0f b6 d2             	movzbl %dl,%edx
  1004a2:	3e ff 24 d5 60 0f 10 	notrack jmp *0x100f60(,%rdx,8)
  1004a9:	00 
        if (*format >= '1' && *format <= '9') {
  1004aa:	44 89 75 a4          	mov    %r14d,-0x5c(%rbp)
  1004ae:	41 8d 44 24 cf       	lea    -0x31(%r12),%eax
  1004b3:	3c 08                	cmp    $0x8,%al
  1004b5:	77 31                	ja     1004e8 <printer::vprintf(int, char const*, __va_list_tag*)+0x11e>
            for (width = 0; *format >= '0' && *format <= '9'; ) {
  1004b7:	0f b6 03             	movzbl (%rbx),%eax
  1004ba:	8d 50 d0             	lea    -0x30(%rax),%edx
  1004bd:	80 fa 09             	cmp    $0x9,%dl
  1004c0:	77 72                	ja     100534 <printer::vprintf(int, char const*, __va_list_tag*)+0x16a>
  1004c2:	41 be 00 00 00 00    	mov    $0x0,%r14d
                width = 10 * width + *format++ - '0';
  1004c8:	48 83 c3 01          	add    $0x1,%rbx
  1004cc:	43 8d 14 b6          	lea    (%r14,%r14,4),%edx
  1004d0:	0f be c0             	movsbl %al,%eax
  1004d3:	44 8d 74 50 d0       	lea    -0x30(%rax,%rdx,2),%r14d
            for (width = 0; *format >= '0' && *format <= '9'; ) {
  1004d8:	0f b6 03             	movzbl (%rbx),%eax
  1004db:	8d 50 d0             	lea    -0x30(%rax),%edx
  1004de:	80 fa 09             	cmp    $0x9,%dl
  1004e1:	76 e5                	jbe    1004c8 <printer::vprintf(int, char const*, __va_list_tag*)+0xfe>
  1004e3:	e9 76 ff ff ff       	jmp    10045e <printer::vprintf(int, char const*, __va_list_tag*)+0x94>
        } else if (*format == '*') {
  1004e8:	41 80 fc 2a          	cmp    $0x2a,%r12b
  1004ec:	75 51                	jne    10053f <printer::vprintf(int, char const*, __va_list_tag*)+0x175>
            width = va_arg(val, int);
  1004ee:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1004f2:	8b 01                	mov    (%rcx),%eax
  1004f4:	83 f8 2f             	cmp    $0x2f,%eax
  1004f7:	77 17                	ja     100510 <printer::vprintf(int, char const*, __va_list_tag*)+0x146>
  1004f9:	89 c2                	mov    %eax,%edx
  1004fb:	48 03 51 10          	add    0x10(%rcx),%rdx
  1004ff:	83 c0 08             	add    $0x8,%eax
  100502:	89 01                	mov    %eax,(%rcx)
  100504:	44 8b 32             	mov    (%rdx),%r14d
            ++format;
  100507:	48 83 c3 01          	add    $0x1,%rbx
  10050b:	e9 4e ff ff ff       	jmp    10045e <printer::vprintf(int, char const*, __va_list_tag*)+0x94>
            width = va_arg(val, int);
  100510:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  100514:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  100518:	48 8d 42 08          	lea    0x8(%rdx),%rax
  10051c:	48 89 47 08          	mov    %rax,0x8(%rdi)
  100520:	eb e2                	jmp    100504 <printer::vprintf(int, char const*, __va_list_tag*)+0x13a>
        int flags = 0;
  100522:	c7 45 a4 00 00 00 00 	movl   $0x0,-0x5c(%rbp)
        int width = -1;
  100529:	41 be ff ff ff ff    	mov    $0xffffffff,%r14d
  10052f:	e9 2a ff ff ff       	jmp    10045e <printer::vprintf(int, char const*, __va_list_tag*)+0x94>
            for (width = 0; *format >= '0' && *format <= '9'; ) {
  100534:	41 be 00 00 00 00    	mov    $0x0,%r14d
  10053a:	e9 1f ff ff ff       	jmp    10045e <printer::vprintf(int, char const*, __va_list_tag*)+0x94>
        int width = -1;
  10053f:	41 be ff ff ff ff    	mov    $0xffffffff,%r14d
  100545:	e9 14 ff ff ff       	jmp    10045e <printer::vprintf(int, char const*, __va_list_tag*)+0x94>
            ++format;
  10054a:	48 8d 53 01          	lea    0x1(%rbx),%rdx
            if (*format >= '0' && *format <= '9') {
  10054e:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
  100552:	8d 48 d0             	lea    -0x30(%rax),%ecx
  100555:	80 f9 09             	cmp    $0x9,%cl
  100558:	76 13                	jbe    10056d <printer::vprintf(int, char const*, __va_list_tag*)+0x1a3>
            } else if (*format == '*') {
  10055a:	3c 2a                	cmp    $0x2a,%al
  10055c:	74 33                	je     100591 <printer::vprintf(int, char const*, __va_list_tag*)+0x1c7>
            ++format;
  10055e:	48 89 d3             	mov    %rdx,%rbx
                precision = 0;
  100561:	c7 45 a0 00 00 00 00 	movl   $0x0,-0x60(%rbp)
  100568:	e9 01 ff ff ff       	jmp    10046e <printer::vprintf(int, char const*, __va_list_tag*)+0xa4>
                for (precision = 0; *format >= '0' && *format <= '9'; ) {
  10056d:	b9 00 00 00 00       	mov    $0x0,%ecx
                    precision = 10 * precision + *format++ - '0';
  100572:	48 83 c2 01          	add    $0x1,%rdx
  100576:	8d 0c 89             	lea    (%rcx,%rcx,4),%ecx
  100579:	0f be c0             	movsbl %al,%eax
  10057c:	8d 4c 48 d0          	lea    -0x30(%rax,%rcx,2),%ecx
                for (precision = 0; *format >= '0' && *format <= '9'; ) {
  100580:	0f b6 02             	movzbl (%rdx),%eax
  100583:	8d 70 d0             	lea    -0x30(%rax),%esi
  100586:	40 80 fe 09          	cmp    $0x9,%sil
  10058a:	76 e6                	jbe    100572 <printer::vprintf(int, char const*, __va_list_tag*)+0x1a8>
  10058c:	48 89 d3             	mov    %rdx,%rbx
  10058f:	eb 1c                	jmp    1005ad <printer::vprintf(int, char const*, __va_list_tag*)+0x1e3>
                precision = va_arg(val, int);
  100591:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  100595:	8b 01                	mov    (%rcx),%eax
  100597:	83 f8 2f             	cmp    $0x2f,%eax
  10059a:	77 23                	ja     1005bf <printer::vprintf(int, char const*, __va_list_tag*)+0x1f5>
  10059c:	89 c2                	mov    %eax,%edx
  10059e:	48 03 51 10          	add    0x10(%rcx),%rdx
  1005a2:	83 c0 08             	add    $0x8,%eax
  1005a5:	89 01                	mov    %eax,(%rcx)
  1005a7:	8b 0a                	mov    (%rdx),%ecx
                ++format;
  1005a9:	48 83 c3 02          	add    $0x2,%rbx
            if (precision < 0) {
  1005ad:	85 c9                	test   %ecx,%ecx
  1005af:	b8 00 00 00 00       	mov    $0x0,%eax
  1005b4:	0f 49 c1             	cmovns %ecx,%eax
  1005b7:	89 45 a0             	mov    %eax,-0x60(%rbp)
  1005ba:	e9 af fe ff ff       	jmp    10046e <printer::vprintf(int, char const*, __va_list_tag*)+0xa4>
                precision = va_arg(val, int);
  1005bf:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1005c3:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  1005c7:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1005cb:	48 89 41 08          	mov    %rax,0x8(%rcx)
  1005cf:	eb d6                	jmp    1005a7 <printer::vprintf(int, char const*, __va_list_tag*)+0x1dd>
        switch (*format) {
  1005d1:	3c 74                	cmp    $0x74,%al
  1005d3:	74 1b                	je     1005f0 <printer::vprintf(int, char const*, __va_list_tag*)+0x226>
  1005d5:	3c 7a                	cmp    $0x7a,%al
  1005d7:	74 17                	je     1005f0 <printer::vprintf(int, char const*, __va_list_tag*)+0x226>
        switch (*format) {
  1005d9:	8d 50 bd             	lea    -0x43(%rax),%edx
  1005dc:	80 fa 35             	cmp    $0x35,%dl
  1005df:	0f 87 6f 06 00 00    	ja     100c54 <printer::vprintf(int, char const*, __va_list_tag*)+0x88a>
  1005e5:	0f b6 d2             	movzbl %dl,%edx
  1005e8:	3e ff 24 d5 10 11 10 	notrack jmp *0x101110(,%rdx,8)
  1005ef:	00 
            ++format;
  1005f0:	48 8d 43 01          	lea    0x1(%rbx),%rax
  1005f4:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
        switch (*format) {
  1005f8:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
  1005fc:	8d 50 bd             	lea    -0x43(%rax),%edx
  1005ff:	80 fa 35             	cmp    $0x35,%dl
  100602:	0f 87 4f 04 00 00    	ja     100a57 <printer::vprintf(int, char const*, __va_list_tag*)+0x68d>
  100608:	0f b6 d2             	movzbl %dl,%edx
  10060b:	3e ff 24 d5 c0 12 10 	notrack jmp *0x1012c0(,%rdx,8)
  100612:	00 
  100613:	8d 50 bd             	lea    -0x43(%rax),%edx
  100616:	80 fa 35             	cmp    $0x35,%dl
  100619:	0f 87 34 04 00 00    	ja     100a53 <printer::vprintf(int, char const*, __va_list_tag*)+0x689>
  10061f:	0f b6 d2             	movzbl %dl,%edx
  100622:	3e ff 24 d5 70 14 10 	notrack jmp *0x101470(,%rdx,8)
  100629:	00 
            long x = length ? va_arg(val, long) : va_arg(val, int);
  10062a:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  10062e:	8b 07                	mov    (%rdi),%eax
  100630:	83 f8 2f             	cmp    $0x2f,%eax
  100633:	77 38                	ja     10066d <printer::vprintf(int, char const*, __va_list_tag*)+0x2a3>
  100635:	89 c2                	mov    %eax,%edx
  100637:	48 03 57 10          	add    0x10(%rdi),%rdx
  10063b:	83 c0 08             	add    $0x8,%eax
  10063e:	89 07                	mov    %eax,(%rdi)
  100640:	48 8b 12             	mov    (%rdx),%rdx
            int negative = x < 0 ? FLAG_NEGATIVE : 0;
  100643:	48 89 d0             	mov    %rdx,%rax
  100646:	48 c1 f8 37          	sar    $0x37,%rax
            num = negative ? -x : x;
  10064a:	49 89 d3             	mov    %rdx,%r11
  10064d:	49 f7 db             	neg    %r11
  100650:	25 00 01 00 00       	and    $0x100,%eax
  100655:	4c 0f 44 da          	cmove  %rdx,%r11
            flags |= FLAG_NUMERIC | FLAG_SIGNED | negative;
  100659:	8b 7d a4             	mov    -0x5c(%rbp),%edi
  10065c:	09 f8                	or     %edi,%eax
  10065e:	0c c0                	or     $0xc0,%al
  100660:	89 45 a4             	mov    %eax,-0x5c(%rbp)
        const char* data = "";
  100663:	bb 58 0f 10 00       	mov    $0x100f58,%ebx
            break;
  100668:	e9 f4 01 00 00       	jmp    100861 <printer::vprintf(int, char const*, __va_list_tag*)+0x497>
            long x = length ? va_arg(val, long) : va_arg(val, int);
  10066d:	48 8b 5d 90          	mov    -0x70(%rbp),%rbx
  100671:	48 8b 53 08          	mov    0x8(%rbx),%rdx
  100675:	48 8d 42 08          	lea    0x8(%rdx),%rax
  100679:	48 89 43 08          	mov    %rax,0x8(%rbx)
  10067d:	eb c1                	jmp    100640 <printer::vprintf(int, char const*, __va_list_tag*)+0x276>
        switch (*format) {
  10067f:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  100683:	eb 04                	jmp    100689 <printer::vprintf(int, char const*, __va_list_tag*)+0x2bf>
  100685:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            long x = length ? va_arg(val, long) : va_arg(val, int);
  100689:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  10068d:	8b 01                	mov    (%rcx),%eax
  10068f:	83 f8 2f             	cmp    $0x2f,%eax
  100692:	77 10                	ja     1006a4 <printer::vprintf(int, char const*, __va_list_tag*)+0x2da>
  100694:	89 c2                	mov    %eax,%edx
  100696:	48 03 51 10          	add    0x10(%rcx),%rdx
  10069a:	83 c0 08             	add    $0x8,%eax
  10069d:	89 01                	mov    %eax,(%rcx)
  10069f:	48 63 12             	movslq (%rdx),%rdx
  1006a2:	eb 9f                	jmp    100643 <printer::vprintf(int, char const*, __va_list_tag*)+0x279>
  1006a4:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  1006a8:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  1006ac:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1006b0:	48 89 47 08          	mov    %rax,0x8(%rdi)
  1006b4:	eb e9                	jmp    10069f <printer::vprintf(int, char const*, __va_list_tag*)+0x2d5>
        switch (*format) {
  1006b6:	b8 01 00 00 00       	mov    $0x1,%eax
  1006bb:	c7 45 9c 0a 00 00 00 	movl   $0xa,-0x64(%rbp)
  1006c2:	e9 9d 00 00 00       	jmp    100764 <printer::vprintf(int, char const*, __va_list_tag*)+0x39a>
  1006c7:	b8 00 00 00 00       	mov    $0x0,%eax
  1006cc:	c7 45 9c 0a 00 00 00 	movl   $0xa,-0x64(%rbp)
  1006d3:	e9 8c 00 00 00       	jmp    100764 <printer::vprintf(int, char const*, __va_list_tag*)+0x39a>
  1006d8:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  1006dc:	b8 00 00 00 00       	mov    $0x0,%eax
  1006e1:	c7 45 9c 0a 00 00 00 	movl   $0xa,-0x64(%rbp)
  1006e8:	eb 7a                	jmp    100764 <printer::vprintf(int, char const*, __va_list_tag*)+0x39a>
  1006ea:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  1006ee:	b8 00 00 00 00       	mov    $0x0,%eax
  1006f3:	c7 45 9c 0a 00 00 00 	movl   $0xa,-0x64(%rbp)
  1006fa:	eb 68                	jmp    100764 <printer::vprintf(int, char const*, __va_list_tag*)+0x39a>
            num = length ? va_arg(val, unsigned long) : va_arg(val, unsigned);
  1006fc:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  100700:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  100704:	48 8d 42 08          	lea    0x8(%rdx),%rax
  100708:	48 89 47 08          	mov    %rax,0x8(%rdi)
  10070c:	eb 70                	jmp    10077e <printer::vprintf(int, char const*, __va_list_tag*)+0x3b4>
  10070e:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  100712:	8b 01                	mov    (%rcx),%eax
  100714:	83 f8 2f             	cmp    $0x2f,%eax
  100717:	77 10                	ja     100729 <printer::vprintf(int, char const*, __va_list_tag*)+0x35f>
  100719:	89 c2                	mov    %eax,%edx
  10071b:	48 03 51 10          	add    0x10(%rcx),%rdx
  10071f:	83 c0 08             	add    $0x8,%eax
  100722:	89 01                	mov    %eax,(%rcx)
  100724:	44 8b 1a             	mov    (%rdx),%r11d
  100727:	eb 58                	jmp    100781 <printer::vprintf(int, char const*, __va_list_tag*)+0x3b7>
  100729:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  10072d:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  100731:	48 8d 42 08          	lea    0x8(%rdx),%rax
  100735:	48 89 41 08          	mov    %rax,0x8(%rcx)
  100739:	eb e9                	jmp    100724 <printer::vprintf(int, char const*, __va_list_tag*)+0x35a>
        switch (*format) {
  10073b:	b8 01 00 00 00       	mov    $0x1,%eax
  100740:	eb 1b                	jmp    10075d <printer::vprintf(int, char const*, __va_list_tag*)+0x393>
  100742:	b8 00 00 00 00       	mov    $0x0,%eax
  100747:	eb 14                	jmp    10075d <printer::vprintf(int, char const*, __va_list_tag*)+0x393>
  100749:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  10074d:	b8 00 00 00 00       	mov    $0x0,%eax
  100752:	eb 09                	jmp    10075d <printer::vprintf(int, char const*, __va_list_tag*)+0x393>
  100754:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  100758:	b8 00 00 00 00       	mov    $0x0,%eax
            base = -16;
  10075d:	c7 45 9c f0 ff ff ff 	movl   $0xfffffff0,-0x64(%rbp)
            num = length ? va_arg(val, unsigned long) : va_arg(val, unsigned);
  100764:	85 c0                	test   %eax,%eax
  100766:	74 a6                	je     10070e <printer::vprintf(int, char const*, __va_list_tag*)+0x344>
  100768:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  10076c:	8b 07                	mov    (%rdi),%eax
  10076e:	83 f8 2f             	cmp    $0x2f,%eax
  100771:	77 89                	ja     1006fc <printer::vprintf(int, char const*, __va_list_tag*)+0x332>
  100773:	89 c2                	mov    %eax,%edx
  100775:	48 03 57 10          	add    0x10(%rdi),%rdx
  100779:	83 c0 08             	add    $0x8,%eax
  10077c:	89 07                	mov    %eax,(%rdi)
  10077e:	4c 8b 1a             	mov    (%rdx),%r11
            flags |= FLAG_NUMERIC;
  100781:	8b 45 a4             	mov    -0x5c(%rbp),%eax
  100784:	83 c8 40             	or     $0x40,%eax
    if (base < 0) {
  100787:	83 7d 9c 00          	cmpl   $0x0,-0x64(%rbp)
  10078b:	0f 89 ea 02 00 00    	jns    100a7b <printer::vprintf(int, char const*, __va_list_tag*)+0x6b1>
    *--pos = '\0';
  100791:	c6 45 cf 00          	movb   $0x0,-0x31(%rbp)
    if (flags & FLAG_THOUSANDS) {
  100795:	a8 20                	test   $0x20,%al
  100797:	0f 85 0d 03 00 00    	jne    100aaa <printer::vprintf(int, char const*, __va_list_tag*)+0x6e0>
  10079d:	89 45 a4             	mov    %eax,-0x5c(%rbp)
        digits = lower_digits;
  1007a0:	41 ba 20 16 10 00    	mov    $0x101620,%r10d
        base = -base;
  1007a6:	41 b9 10 00 00 00    	mov    $0x10,%r9d
    if (flags & FLAG_THOUSANDS) {
  1007ac:	c7 45 98 40 00 00 00 	movl   $0x40,-0x68(%rbp)
        thousands_pos = nullptr;
  1007b3:	bf 00 00 00 00       	mov    $0x0,%edi
  1007b8:	e9 0f 03 00 00       	jmp    100acc <printer::vprintf(int, char const*, __va_list_tag*)+0x702>
        switch (*format) {
  1007bd:	b8 01 00 00 00       	mov    $0x1,%eax
  1007c2:	eb 1b                	jmp    1007df <printer::vprintf(int, char const*, __va_list_tag*)+0x415>
  1007c4:	b8 00 00 00 00       	mov    $0x0,%eax
  1007c9:	eb 14                	jmp    1007df <printer::vprintf(int, char const*, __va_list_tag*)+0x415>
  1007cb:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  1007cf:	b8 00 00 00 00       	mov    $0x0,%eax
  1007d4:	eb 09                	jmp    1007df <printer::vprintf(int, char const*, __va_list_tag*)+0x415>
  1007d6:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  1007da:	b8 00 00 00 00       	mov    $0x0,%eax
            base = 16;
  1007df:	c7 45 9c 10 00 00 00 	movl   $0x10,-0x64(%rbp)
            goto format_unsigned;
  1007e6:	e9 79 ff ff ff       	jmp    100764 <printer::vprintf(int, char const*, __va_list_tag*)+0x39a>
        switch (*format) {
  1007eb:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  1007ef:	eb 04                	jmp    1007f5 <printer::vprintf(int, char const*, __va_list_tag*)+0x42b>
  1007f1:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            num = (uintptr_t) va_arg(val, void*);
  1007f5:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1007f9:	8b 01                	mov    (%rcx),%eax
  1007fb:	83 f8 2f             	cmp    $0x2f,%eax
  1007fe:	77 22                	ja     100822 <printer::vprintf(int, char const*, __va_list_tag*)+0x458>
  100800:	89 c2                	mov    %eax,%edx
  100802:	48 03 51 10          	add    0x10(%rcx),%rdx
  100806:	83 c0 08             	add    $0x8,%eax
  100809:	89 01                	mov    %eax,(%rcx)
  10080b:	4c 8b 1a             	mov    (%rdx),%r11
            flags |= FLAG_ALT | FLAG_ALT2 | FLAG_NUMERIC;
  10080e:	8b 45 a4             	mov    -0x5c(%rbp),%eax
  100811:	0d 41 02 00 00       	or     $0x241,%eax
            base = -16;
  100816:	c7 45 9c f0 ff ff ff 	movl   $0xfffffff0,-0x64(%rbp)
  10081d:	e9 6f ff ff ff       	jmp    100791 <printer::vprintf(int, char const*, __va_list_tag*)+0x3c7>
            num = (uintptr_t) va_arg(val, void*);
  100822:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  100826:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  10082a:	48 8d 42 08          	lea    0x8(%rdx),%rax
  10082e:	48 89 47 08          	mov    %rax,0x8(%rdi)
  100832:	eb d7                	jmp    10080b <printer::vprintf(int, char const*, __va_list_tag*)+0x441>
        switch (*format) {
  100834:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  100838:	eb 04                	jmp    10083e <printer::vprintf(int, char const*, __va_list_tag*)+0x474>
  10083a:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            data = va_arg(val, char*);
  10083e:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  100842:	8b 07                	mov    (%rdi),%eax
  100844:	83 f8 2f             	cmp    $0x2f,%eax
  100847:	0f 87 70 01 00 00    	ja     1009bd <printer::vprintf(int, char const*, __va_list_tag*)+0x5f3>
  10084d:	89 c2                	mov    %eax,%edx
  10084f:	48 03 57 10          	add    0x10(%rdi),%rdx
  100853:	83 c0 08             	add    $0x8,%eax
  100856:	89 07                	mov    %eax,(%rdi)
  100858:	48 8b 1a             	mov    (%rdx),%rbx
        unsigned long num = 0;
  10085b:	41 bb 00 00 00 00    	mov    $0x0,%r11d
        if (flags & FLAG_NUMERIC) {
  100861:	8b 45 a4             	mov    -0x5c(%rbp),%eax
  100864:	83 e0 40             	and    $0x40,%eax
  100867:	89 45 98             	mov    %eax,-0x68(%rbp)
        const char* prefix = "";
  10086a:	41 bc 58 0f 10 00    	mov    $0x100f58,%r12d
        if (flags & FLAG_NUMERIC) {
  100870:	0f 85 f8 03 00 00    	jne    100c6e <printer::vprintf(int, char const*, __va_list_tag*)+0x8a4>
        if (precision >= 0 && !(flags & FLAG_NUMERIC)) {
  100876:	8b 7d a0             	mov    -0x60(%rbp),%edi
  100879:	89 f8                	mov    %edi,%eax
  10087b:	f7 d0                	not    %eax
  10087d:	c1 e8 1f             	shr    $0x1f,%eax
  100880:	89 45 8c             	mov    %eax,-0x74(%rbp)
  100883:	83 7d 98 00          	cmpl   $0x0,-0x68(%rbp)
  100887:	0f 85 63 03 00 00    	jne    100bf0 <printer::vprintf(int, char const*, __va_list_tag*)+0x826>
  10088d:	84 c0                	test   %al,%al
  10088f:	0f 84 5b 03 00 00    	je     100bf0 <printer::vprintf(int, char const*, __va_list_tag*)+0x826>
            datalen = strnlen(data, precision);
  100895:	48 63 f7             	movslq %edi,%rsi
  100898:	48 89 df             	mov    %rbx,%rdi
  10089b:	e8 1a fa ff ff       	call   1002ba <strnlen>
  1008a0:	89 45 9c             	mov    %eax,-0x64(%rbp)
                   && datalen + (int) strlen(prefix) < width) {
  1008a3:	8b 45 a4             	mov    -0x5c(%rbp),%eax
  1008a6:	83 e0 46             	and    $0x46,%eax
            zeros = 0;
  1008a9:	c7 45 a0 00 00 00 00 	movl   $0x0,-0x60(%rbp)
                   && datalen + (int) strlen(prefix) < width) {
  1008b0:	83 f8 42             	cmp    $0x42,%eax
  1008b3:	0f 84 6f 03 00 00    	je     100c28 <printer::vprintf(int, char const*, __va_list_tag*)+0x85e>
        width -= datalen + zeros + strlen(prefix);
  1008b9:	4c 89 e7             	mov    %r12,%rdi
  1008bc:	e8 da f9 ff ff       	call   10029b <strlen>
  1008c1:	8b 7d a0             	mov    -0x60(%rbp),%edi
  1008c4:	8b 4d 9c             	mov    -0x64(%rbp),%ecx
  1008c7:	01 f9                	add    %edi,%ecx
  1008c9:	44 89 f2             	mov    %r14d,%edx
  1008cc:	29 ca                	sub    %ecx,%edx
  1008ce:	29 c2                	sub    %eax,%edx
  1008d0:	41 89 d6             	mov    %edx,%r14d
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
  1008d3:	f6 45 a4 04          	testb  $0x4,-0x5c(%rbp)
  1008d7:	75 32                	jne    10090b <printer::vprintf(int, char const*, __va_list_tag*)+0x541>
  1008d9:	85 d2                	test   %edx,%edx
  1008db:	7e 2e                	jle    10090b <printer::vprintf(int, char const*, __va_list_tag*)+0x541>
        width -= datalen + zeros + strlen(prefix);
  1008dd:	89 55 a4             	mov    %edx,-0x5c(%rbp)
            putc(' ', color);
  1008e0:	49 8b 07             	mov    (%r15),%rax
  1008e3:	44 89 ea             	mov    %r13d,%edx
  1008e6:	be 20 00 00 00       	mov    $0x20,%esi
  1008eb:	4c 89 ff             	mov    %r15,%rdi
  1008ee:	ff 10                	call   *(%rax)
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
  1008f0:	41 83 ee 01          	sub    $0x1,%r14d
  1008f4:	45 85 f6             	test   %r14d,%r14d
  1008f7:	7f e7                	jg     1008e0 <printer::vprintf(int, char const*, __va_list_tag*)+0x516>
  1008f9:	8b 55 a4             	mov    -0x5c(%rbp),%edx
  1008fc:	85 d2                	test   %edx,%edx
  1008fe:	b8 01 00 00 00       	mov    $0x1,%eax
  100903:	0f 4f c2             	cmovg  %edx,%eax
  100906:	29 c2                	sub    %eax,%edx
  100908:	41 89 d6             	mov    %edx,%r14d
        for (; *prefix; ++prefix) {
  10090b:	41 0f b6 04 24       	movzbl (%r12),%eax
  100910:	84 c0                	test   %al,%al
  100912:	74 1b                	je     10092f <printer::vprintf(int, char const*, __va_list_tag*)+0x565>
            putc(*prefix, color);
  100914:	0f b6 f0             	movzbl %al,%esi
  100917:	49 8b 07             	mov    (%r15),%rax
  10091a:	44 89 ea             	mov    %r13d,%edx
  10091d:	4c 89 ff             	mov    %r15,%rdi
  100920:	ff 10                	call   *(%rax)
        for (; *prefix; ++prefix) {
  100922:	49 83 c4 01          	add    $0x1,%r12
  100926:	41 0f b6 04 24       	movzbl (%r12),%eax
  10092b:	84 c0                	test   %al,%al
  10092d:	75 e5                	jne    100914 <printer::vprintf(int, char const*, __va_list_tag*)+0x54a>
        for (; zeros > 0; --zeros) {
  10092f:	44 8b 65 a0          	mov    -0x60(%rbp),%r12d
  100933:	45 85 e4             	test   %r12d,%r12d
  100936:	7e 16                	jle    10094e <printer::vprintf(int, char const*, __va_list_tag*)+0x584>
            putc('0', color);
  100938:	49 8b 07             	mov    (%r15),%rax
  10093b:	44 89 ea             	mov    %r13d,%edx
  10093e:	be 30 00 00 00       	mov    $0x30,%esi
  100943:	4c 89 ff             	mov    %r15,%rdi
  100946:	ff 10                	call   *(%rax)
        for (; zeros > 0; --zeros) {
  100948:	41 83 ec 01          	sub    $0x1,%r12d
  10094c:	75 ea                	jne    100938 <printer::vprintf(int, char const*, __va_list_tag*)+0x56e>
        for (; datalen > 0; ++data, --datalen) {
  10094e:	8b 45 9c             	mov    -0x64(%rbp),%eax
  100951:	85 c0                	test   %eax,%eax
  100953:	7e 1d                	jle    100972 <printer::vprintf(int, char const*, __va_list_tag*)+0x5a8>
  100955:	41 89 c4             	mov    %eax,%r12d
  100958:	49 01 dc             	add    %rbx,%r12
            putc(*data, color);
  10095b:	0f b6 33             	movzbl (%rbx),%esi
  10095e:	49 8b 07             	mov    (%r15),%rax
  100961:	44 89 ea             	mov    %r13d,%edx
  100964:	4c 89 ff             	mov    %r15,%rdi
  100967:	ff 10                	call   *(%rax)
        for (; datalen > 0; ++data, --datalen) {
  100969:	48 83 c3 01          	add    $0x1,%rbx
  10096d:	49 39 dc             	cmp    %rbx,%r12
  100970:	75 e9                	jne    10095b <printer::vprintf(int, char const*, __va_list_tag*)+0x591>
        for (; width > 0; --width) {
  100972:	45 85 f6             	test   %r14d,%r14d
  100975:	7e 16                	jle    10098d <printer::vprintf(int, char const*, __va_list_tag*)+0x5c3>
            putc(' ', color);
  100977:	49 8b 07             	mov    (%r15),%rax
  10097a:	44 89 ea             	mov    %r13d,%edx
  10097d:	be 20 00 00 00       	mov    $0x20,%esi
  100982:	4c 89 ff             	mov    %r15,%rdi
  100985:	ff 10                	call   *(%rax)
        for (; width > 0; --width) {
  100987:	41 83 ee 01          	sub    $0x1,%r14d
  10098b:	75 ea                	jne    100977 <printer::vprintf(int, char const*, __va_list_tag*)+0x5ad>
    for (; *format; ++format) {
  10098d:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  100991:	4c 8d 60 01          	lea    0x1(%rax),%r12
  100995:	0f b6 40 01          	movzbl 0x1(%rax),%eax
  100999:	84 c0                	test   %al,%al
  10099b:	0f 84 56 fa ff ff    	je     1003f7 <printer::vprintf(int, char const*, __va_list_tag*)+0x2d>
        if (*format != '%') {
  1009a1:	3c 25                	cmp    $0x25,%al
  1009a3:	0f 84 5d fa ff ff    	je     100406 <printer::vprintf(int, char const*, __va_list_tag*)+0x3c>
            putc(*format, color);
  1009a9:	0f b6 f0             	movzbl %al,%esi
  1009ac:	49 8b 07             	mov    (%r15),%rax
  1009af:	44 89 ea             	mov    %r13d,%edx
  1009b2:	4c 89 ff             	mov    %r15,%rdi
  1009b5:	ff 10                	call   *(%rax)
            continue;
  1009b7:	4c 89 65 a8          	mov    %r12,-0x58(%rbp)
  1009bb:	eb d0                	jmp    10098d <printer::vprintf(int, char const*, __va_list_tag*)+0x5c3>
            data = va_arg(val, char*);
  1009bd:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1009c1:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  1009c5:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1009c9:	48 89 41 08          	mov    %rax,0x8(%rcx)
  1009cd:	e9 86 fe ff ff       	jmp    100858 <printer::vprintf(int, char const*, __va_list_tag*)+0x48e>
        switch (*format) {
  1009d2:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  1009d6:	eb 04                	jmp    1009dc <printer::vprintf(int, char const*, __va_list_tag*)+0x612>
  1009d8:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            color = va_arg(val, int);
  1009dc:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1009e0:	8b 01                	mov    (%rcx),%eax
  1009e2:	83 f8 2f             	cmp    $0x2f,%eax
  1009e5:	77 10                	ja     1009f7 <printer::vprintf(int, char const*, __va_list_tag*)+0x62d>
  1009e7:	89 c2                	mov    %eax,%edx
  1009e9:	48 03 51 10          	add    0x10(%rcx),%rdx
  1009ed:	83 c0 08             	add    $0x8,%eax
  1009f0:	89 01                	mov    %eax,(%rcx)
  1009f2:	44 8b 2a             	mov    (%rdx),%r13d
            continue;
  1009f5:	eb 96                	jmp    10098d <printer::vprintf(int, char const*, __va_list_tag*)+0x5c3>
            color = va_arg(val, int);
  1009f7:	48 8b 5d 90          	mov    -0x70(%rbp),%rbx
  1009fb:	48 8b 53 08          	mov    0x8(%rbx),%rdx
  1009ff:	48 8d 42 08          	lea    0x8(%rdx),%rax
  100a03:	48 89 43 08          	mov    %rax,0x8(%rbx)
  100a07:	eb e9                	jmp    1009f2 <printer::vprintf(int, char const*, __va_list_tag*)+0x628>
        switch (*format) {
  100a09:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  100a0d:	eb 04                	jmp    100a13 <printer::vprintf(int, char const*, __va_list_tag*)+0x649>
  100a0f:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            numbuf[0] = va_arg(val, int);
  100a13:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  100a17:	8b 07                	mov    (%rdi),%eax
  100a19:	83 f8 2f             	cmp    $0x2f,%eax
  100a1c:	77 23                	ja     100a41 <printer::vprintf(int, char const*, __va_list_tag*)+0x677>
  100a1e:	89 c2                	mov    %eax,%edx
  100a20:	48 03 57 10          	add    0x10(%rdi),%rdx
  100a24:	83 c0 08             	add    $0x8,%eax
  100a27:	89 07                	mov    %eax,(%rdi)
  100a29:	8b 02                	mov    (%rdx),%eax
  100a2b:	88 45 b0             	mov    %al,-0x50(%rbp)
            numbuf[1] = '\0';
  100a2e:	c6 45 b1 00          	movb   $0x0,-0x4f(%rbp)
            data = numbuf;
  100a32:	48 8d 5d b0          	lea    -0x50(%rbp),%rbx
        unsigned long num = 0;
  100a36:	41 bb 00 00 00 00    	mov    $0x0,%r11d
            break;
  100a3c:	e9 20 fe ff ff       	jmp    100861 <printer::vprintf(int, char const*, __va_list_tag*)+0x497>
            numbuf[0] = va_arg(val, int);
  100a41:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  100a45:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  100a49:	48 8d 42 08          	lea    0x8(%rdx),%rax
  100a4d:	48 89 47 08          	mov    %rax,0x8(%rdi)
  100a51:	eb d6                	jmp    100a29 <printer::vprintf(int, char const*, __va_list_tag*)+0x65f>
        switch (*format) {
  100a53:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            numbuf[0] = (*format ? *format : '%');
  100a57:	84 c0                	test   %al,%al
  100a59:	0f 85 f1 01 00 00    	jne    100c50 <printer::vprintf(int, char const*, __va_list_tag*)+0x886>
  100a5f:	c6 45 b0 25          	movb   $0x25,-0x50(%rbp)
            numbuf[1] = '\0';
  100a63:	c6 45 b1 00          	movb   $0x0,-0x4f(%rbp)
                format--;
  100a67:	48 83 6d a8 01       	subq   $0x1,-0x58(%rbp)
            data = numbuf;
  100a6c:	48 8d 5d b0          	lea    -0x50(%rbp),%rbx
        unsigned long num = 0;
  100a70:	41 bb 00 00 00 00    	mov    $0x0,%r11d
  100a76:	e9 e6 fd ff ff       	jmp    100861 <printer::vprintf(int, char const*, __va_list_tag*)+0x497>
    *--pos = '\0';
  100a7b:	c6 45 cf 00          	movb   $0x0,-0x31(%rbp)
    if (flags & FLAG_THOUSANDS) {
  100a7f:	f6 45 a4 20          	testb  $0x20,-0x5c(%rbp)
  100a83:	74 73                	je     100af8 <printer::vprintf(int, char const*, __va_list_tag*)+0x72e>
        thousands_pos = pos - (base == 10 ? 3 : 4);
  100a85:	8b 5d 9c             	mov    -0x64(%rbp),%ebx
  100a88:	41 89 d9             	mov    %ebx,%r9d
  100a8b:	89 45 a4             	mov    %eax,-0x5c(%rbp)
  100a8e:	41 ba 40 16 10 00    	mov    $0x101640,%r10d
  100a94:	c7 45 98 40 00 00 00 	movl   $0x40,-0x68(%rbp)
  100a9b:	83 fb 0a             	cmp    $0xa,%ebx
  100a9e:	0f 94 c0             	sete   %al
  100aa1:	0f b6 c0             	movzbl %al,%eax
  100aa4:	48 83 e8 04          	sub    $0x4,%rax
  100aa8:	eb 1d                	jmp    100ac7 <printer::vprintf(int, char const*, __va_list_tag*)+0x6fd>
    if (flags & FLAG_THOUSANDS) {
  100aaa:	89 45 a4             	mov    %eax,-0x5c(%rbp)
        digits = lower_digits;
  100aad:	41 ba 20 16 10 00    	mov    $0x101620,%r10d
        base = -base;
  100ab3:	41 b9 10 00 00 00    	mov    $0x10,%r9d
    if (flags & FLAG_THOUSANDS) {
  100ab9:	c7 45 98 40 00 00 00 	movl   $0x40,-0x68(%rbp)
        thousands_pos = pos - (base == 10 ? 3 : 4);
  100ac0:	48 c7 c0 fc ff ff ff 	mov    $0xfffffffffffffffc,%rax
  100ac7:	48 8d 7c 05 cf       	lea    -0x31(%rbp,%rax,1),%rdi
  100acc:	48 8d 4d ce          	lea    -0x32(%rbp),%rcx
        thousands_pos = nullptr;
  100ad0:	4c 89 d8             	mov    %r11,%rax
            *--pos = digits[val % base];
  100ad3:	49 63 f1             	movslq %r9d,%rsi
    } while (val != 0 && pos != buf);
  100ad6:	4c 8d 45 b0          	lea    -0x50(%rbp),%r8
  100ada:	eb 57                	jmp    100b33 <printer::vprintf(int, char const*, __va_list_tag*)+0x769>
    if (flags & FLAG_THOUSANDS) {
  100adc:	41 ba 40 16 10 00    	mov    $0x101640,%r10d
  100ae2:	41 b9 0a 00 00 00    	mov    $0xa,%r9d
  100ae8:	c7 45 9c 0a 00 00 00 	movl   $0xa,-0x64(%rbp)
        thousands_pos = pos - (base == 10 ? 3 : 4);
  100aef:	48 c7 c0 fd ff ff ff 	mov    $0xfffffffffffffffd,%rax
  100af6:	eb cf                	jmp    100ac7 <printer::vprintf(int, char const*, __va_list_tag*)+0x6fd>
  100af8:	44 8b 4d 9c          	mov    -0x64(%rbp),%r9d
  100afc:	89 45 a4             	mov    %eax,-0x5c(%rbp)
  100aff:	41 ba 40 16 10 00    	mov    $0x101640,%r10d
  100b05:	c7 45 98 40 00 00 00 	movl   $0x40,-0x68(%rbp)
        thousands_pos = nullptr;
  100b0c:	bf 00 00 00 00       	mov    $0x0,%edi
  100b11:	eb b9                	jmp    100acc <printer::vprintf(int, char const*, __va_list_tag*)+0x702>
            *--pos = digits[val % base];
  100b13:	48 89 cb             	mov    %rcx,%rbx
  100b16:	ba 00 00 00 00       	mov    $0x0,%edx
  100b1b:	48 f7 f6             	div    %rsi
  100b1e:	41 0f b6 14 12       	movzbl (%r10,%rdx,1),%edx
  100b23:	88 11                	mov    %dl,(%rcx)
    } while (val != 0 && pos != buf);
  100b25:	48 83 e9 01          	sub    $0x1,%rcx
  100b29:	48 85 c0             	test   %rax,%rax
  100b2c:	74 2d                	je     100b5b <printer::vprintf(int, char const*, __va_list_tag*)+0x791>
  100b2e:	4c 39 c3             	cmp    %r8,%rbx
  100b31:	74 28                	je     100b5b <printer::vprintf(int, char const*, __va_list_tag*)+0x791>
        if (pos == thousands_pos) {
  100b33:	48 8d 51 01          	lea    0x1(%rcx),%rdx
  100b37:	48 39 d7             	cmp    %rdx,%rdi
  100b3a:	75 d7                	jne    100b13 <printer::vprintf(int, char const*, __va_list_tag*)+0x749>
            *--pos = base == 10 ? ',' : '\'';
  100b3c:	48 89 cb             	mov    %rcx,%rbx
  100b3f:	41 83 f9 0a          	cmp    $0xa,%r9d
  100b43:	0f 94 c2             	sete   %dl
  100b46:	8d 54 92 27          	lea    0x27(%rdx,%rdx,4),%edx
  100b4a:	40 0f 94 c7          	sete   %dil
  100b4e:	40 0f b6 ff          	movzbl %dil,%edi
  100b52:	88 11                	mov    %dl,(%rcx)
            thousands_pos = pos - (base == 10 ? 3 : 4);
  100b54:	48 8d 7c 39 fc       	lea    -0x4(%rcx,%rdi,1),%rdi
  100b59:	eb ca                	jmp    100b25 <printer::vprintf(int, char const*, __va_list_tag*)+0x75b>
        if ((flags & FLAG_NUMERIC) && (flags & FLAG_SIGNED)) {
  100b5b:	8b 7d a4             	mov    -0x5c(%rbp),%edi
  100b5e:	89 f8                	mov    %edi,%eax
  100b60:	f7 d0                	not    %eax
  100b62:	a8 c0                	test   $0xc0,%al
  100b64:	75 3c                	jne    100ba2 <printer::vprintf(int, char const*, __va_list_tag*)+0x7d8>
                prefix = "-";
  100b66:	41 bc 55 0f 10 00    	mov    $0x100f55,%r12d
            if (flags & FLAG_NEGATIVE) {
  100b6c:	f7 c7 00 01 00 00    	test   $0x100,%edi
  100b72:	0f 85 fe fc ff ff    	jne    100876 <printer::vprintf(int, char const*, __va_list_tag*)+0x4ac>
                prefix = "+";
  100b78:	41 bc 50 0f 10 00    	mov    $0x100f50,%r12d
            } else if (flags & FLAG_PLUSPOSITIVE) {
  100b7e:	40 f6 c7 10          	test   $0x10,%dil
  100b82:	0f 85 ee fc ff ff    	jne    100876 <printer::vprintf(int, char const*, __va_list_tag*)+0x4ac>
        const char* prefix = "";
  100b88:	40 f6 c7 08          	test   $0x8,%dil
  100b8c:	ba 57 0f 10 00       	mov    $0x100f57,%edx
  100b91:	b8 58 0f 10 00       	mov    $0x100f58,%eax
  100b96:	48 0f 45 c2          	cmovne %rdx,%rax
  100b9a:	49 89 c4             	mov    %rax,%r12
  100b9d:	e9 d4 fc ff ff       	jmp    100876 <printer::vprintf(int, char const*, __va_list_tag*)+0x4ac>
  100ba2:	41 bc 58 0f 10 00    	mov    $0x100f58,%r12d
        } else if ((flags & FLAG_NUMERIC) && (flags & FLAG_ALT)
  100ba8:	8b 4d a4             	mov    -0x5c(%rbp),%ecx
  100bab:	89 c8                	mov    %ecx,%eax
  100bad:	f7 d0                	not    %eax
  100baf:	a8 41                	test   $0x41,%al
  100bb1:	0f 85 bf fc ff ff    	jne    100876 <printer::vprintf(int, char const*, __va_list_tag*)+0x4ac>
                   && (base == 16 || base == -16)
  100bb7:	8b 45 9c             	mov    -0x64(%rbp),%eax
  100bba:	83 c0 10             	add    $0x10,%eax
  100bbd:	a9 df ff ff ff       	test   $0xffffffdf,%eax
  100bc2:	0f 85 ae fc ff ff    	jne    100876 <printer::vprintf(int, char const*, __va_list_tag*)+0x4ac>
                   && (num || (flags & FLAG_ALT2))) {
  100bc8:	4d 85 db             	test   %r11,%r11
  100bcb:	75 09                	jne    100bd6 <printer::vprintf(int, char const*, __va_list_tag*)+0x80c>
  100bcd:	f6 c5 02             	test   $0x2,%ch
  100bd0:	0f 84 a0 fc ff ff    	je     100876 <printer::vprintf(int, char const*, __va_list_tag*)+0x4ac>
            prefix = (base == -16 ? "0x" : "0X");
  100bd6:	83 7d 9c f0          	cmpl   $0xfffffff0,-0x64(%rbp)
  100bda:	ba 52 0f 10 00       	mov    $0x100f52,%edx
  100bdf:	b8 59 0f 10 00       	mov    $0x100f59,%eax
  100be4:	48 0f 45 c2          	cmovne %rdx,%rax
  100be8:	49 89 c4             	mov    %rax,%r12
  100beb:	e9 86 fc ff ff       	jmp    100876 <printer::vprintf(int, char const*, __va_list_tag*)+0x4ac>
            datalen = strlen(data);
  100bf0:	48 89 df             	mov    %rbx,%rdi
  100bf3:	e8 a3 f6 ff ff       	call   10029b <strlen>
  100bf8:	89 45 9c             	mov    %eax,-0x64(%rbp)
            && precision >= 0) {
  100bfb:	83 7d 98 00          	cmpl   $0x0,-0x68(%rbp)
  100bff:	0f 84 9e fc ff ff    	je     1008a3 <printer::vprintf(int, char const*, __va_list_tag*)+0x4d9>
  100c05:	80 7d 8c 00          	cmpb   $0x0,-0x74(%rbp)
  100c09:	0f 84 94 fc ff ff    	je     1008a3 <printer::vprintf(int, char const*, __va_list_tag*)+0x4d9>
            zeros = precision > datalen ? precision - datalen : 0;
  100c0f:	8b 7d a0             	mov    -0x60(%rbp),%edi
  100c12:	89 fa                	mov    %edi,%edx
  100c14:	29 c2                	sub    %eax,%edx
  100c16:	39 c7                	cmp    %eax,%edi
  100c18:	b8 00 00 00 00       	mov    $0x0,%eax
  100c1d:	0f 4f c2             	cmovg  %edx,%eax
  100c20:	89 45 a0             	mov    %eax,-0x60(%rbp)
  100c23:	e9 91 fc ff ff       	jmp    1008b9 <printer::vprintf(int, char const*, __va_list_tag*)+0x4ef>
                   && datalen + (int) strlen(prefix) < width) {
  100c28:	4c 89 e7             	mov    %r12,%rdi
  100c2b:	e8 6b f6 ff ff       	call   10029b <strlen>
  100c30:	8b 7d 9c             	mov    -0x64(%rbp),%edi
  100c33:	8d 14 07             	lea    (%rdi,%rax,1),%edx
            zeros = width - datalen - strlen(prefix);
  100c36:	44 89 f1             	mov    %r14d,%ecx
  100c39:	29 f9                	sub    %edi,%ecx
  100c3b:	29 c1                	sub    %eax,%ecx
  100c3d:	44 39 f2             	cmp    %r14d,%edx
  100c40:	b8 00 00 00 00       	mov    $0x0,%eax
  100c45:	0f 4c c1             	cmovl  %ecx,%eax
  100c48:	89 45 a0             	mov    %eax,-0x60(%rbp)
  100c4b:	e9 69 fc ff ff       	jmp    1008b9 <printer::vprintf(int, char const*, __va_list_tag*)+0x4ef>
  100c50:	48 8b 5d a8          	mov    -0x58(%rbp),%rbx
            numbuf[0] = (*format ? *format : '%');
  100c54:	88 45 b0             	mov    %al,-0x50(%rbp)
            numbuf[1] = '\0';
  100c57:	c6 45 b1 00          	movb   $0x0,-0x4f(%rbp)
  100c5b:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            data = numbuf;
  100c5f:	48 8d 5d b0          	lea    -0x50(%rbp),%rbx
        unsigned long num = 0;
  100c63:	41 bb 00 00 00 00    	mov    $0x0,%r11d
  100c69:	e9 f3 fb ff ff       	jmp    100861 <printer::vprintf(int, char const*, __va_list_tag*)+0x497>
    *--pos = '\0';
  100c6e:	c6 45 cf 00          	movb   $0x0,-0x31(%rbp)
    if (flags & FLAG_THOUSANDS) {
  100c72:	f6 45 a4 20          	testb  $0x20,-0x5c(%rbp)
  100c76:	0f 85 60 fe ff ff    	jne    100adc <printer::vprintf(int, char const*, __va_list_tag*)+0x712>
  100c7c:	41 ba 40 16 10 00    	mov    $0x101640,%r10d
  100c82:	41 b9 0a 00 00 00    	mov    $0xa,%r9d
  100c88:	c7 45 9c 0a 00 00 00 	movl   $0xa,-0x64(%rbp)
        thousands_pos = nullptr;
  100c8f:	bf 00 00 00 00       	mov    $0x0,%edi
  100c94:	e9 33 fe ff ff       	jmp    100acc <printer::vprintf(int, char const*, __va_list_tag*)+0x702>

0000000000100c99 <vsnprintf>:
};

ssize_t vsnprintf(char* s, size_t size, const char* format, va_list val) {
  100c99:	f3 0f 1e fa          	endbr64
  100c9d:	55                   	push   %rbp
  100c9e:	48 89 e5             	mov    %rsp,%rbp
  100ca1:	53                   	push   %rbx
  100ca2:	48 83 ec 28          	sub    $0x28,%rsp
  100ca6:	48 89 f3             	mov    %rsi,%rbx
        : s_(s), end_(s + size), n_(0) {
  100ca9:	48 c7 45 d0 68 16 10 	movq   $0x101668,-0x30(%rbp)
  100cb0:	00 
  100cb1:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  100cb5:	48 01 f7             	add    %rsi,%rdi
  100cb8:	48 89 7d e0          	mov    %rdi,-0x20(%rbp)
  100cbc:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
  100cc3:	00 
    string_printer sp(s, size);
    sp.vprintf(0, format, val);
  100cc4:	be 00 00 00 00       	mov    $0x0,%esi
  100cc9:	48 8d 7d d0          	lea    -0x30(%rbp),%rdi
  100ccd:	e8 f8 f6 ff ff       	call   1003ca <printer::vprintf(int, char const*, __va_list_tag*)>
    if (size && sp.s_ < sp.end_) {
  100cd2:	48 85 db             	test   %rbx,%rbx
  100cd5:	74 10                	je     100ce7 <vsnprintf+0x4e>
  100cd7:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  100cdb:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  100cdf:	48 39 c2             	cmp    %rax,%rdx
  100ce2:	73 0d                	jae    100cf1 <vsnprintf+0x58>
        *sp.s_ = 0;
  100ce4:	c6 02 00             	movb   $0x0,(%rdx)
    } else if (size) {
        sp.end_[-1] = 0;
    }
    return sp.n_;
}
  100ce7:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  100ceb:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
  100cef:	c9                   	leave
  100cf0:	c3                   	ret
        sp.end_[-1] = 0;
  100cf1:	c6 40 ff 00          	movb   $0x0,-0x1(%rax)
  100cf5:	eb f0                	jmp    100ce7 <vsnprintf+0x4e>

0000000000100cf7 <snprintf>:

ssize_t snprintf(char* s, size_t size, const char* format, ...) {
  100cf7:	f3 0f 1e fa          	endbr64
  100cfb:	55                   	push   %rbp
  100cfc:	48 89 e5             	mov    %rsp,%rbp
  100cff:	48 83 ec 50          	sub    $0x50,%rsp
  100d03:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  100d07:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
  100d0b:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
  100d0f:	c7 45 b8 18 00 00 00 	movl   $0x18,-0x48(%rbp)
  100d16:	48 8d 45 10          	lea    0x10(%rbp),%rax
  100d1a:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
  100d1e:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  100d22:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    int n = vsnprintf(s, size, format, val);
  100d26:	48 8d 4d b8          	lea    -0x48(%rbp),%rcx
  100d2a:	e8 6a ff ff ff       	call   100c99 <vsnprintf>
    va_end(val);
    return n;
  100d2f:	48 98                	cltq
}
  100d31:	c9                   	leave
  100d32:	c3                   	ret

0000000000100d33 <assert_fail(char const*, int, char const*, char const*)>:
int error_vprintf(int cpos, int color, const char* format, va_list val) {
    return console_vprintf(cpos, color, format, val);
}

void assert_fail(const char* file, int line, const char* msg,
                 const char* description) {
  100d33:	f3 0f 1e fa          	endbr64
  100d37:	55                   	push   %rbp
  100d38:	48 89 e5             	mov    %rsp,%rbp
  100d3b:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
  100d42:	41 89 f0             	mov    %esi,%r8d
    cursorpos = CPOS(23, 0);
  100d45:	c7 05 ad 82 fb ff 30 	movl   $0x730,-0x47d53(%rip)        # b8ffc <cursorpos>
  100d4c:	07 00 00 
    char buf[240];
    if (description) {
  100d4f:	48 85 c9             	test   %rcx,%rcx
  100d52:	74 39                	je     100d8d <assert_fail(char const*, int, char const*, char const*)+0x5a>
  100d54:	49 89 c9             	mov    %rcx,%r9
        snprintf(buf, sizeof(buf),
  100d57:	48 83 ec 08          	sub    $0x8,%rsp
  100d5b:	52                   	push   %rdx
  100d5c:	56                   	push   %rsi
  100d5d:	57                   	push   %rdi
  100d5e:	48 89 f9             	mov    %rdi,%rcx
  100d61:	ba a8 0e 10 00       	mov    $0x100ea8,%edx
  100d66:	be f0 00 00 00       	mov    $0xf0,%esi
  100d6b:	48 8d bd 10 ff ff ff 	lea    -0xf0(%rbp),%rdi
  100d72:	b0 00                	mov    $0x0,%al
  100d74:	e8 7e ff ff ff       	call   100cf7 <snprintf>
  100d79:	48 83 c4 20          	add    $0x20,%rsp
    register uintptr_t rax asm("rax") = syscallno;
  100d7d:	b8 03 00 00 00       	mov    $0x3,%eax
    asm volatile ("syscall"
  100d82:	48 8d bd 10 ff ff ff 	lea    -0xf0(%rbp),%rdi
  100d89:	0f 05                	syscall
//    Panic.
[[noreturn]] inline void sys_panic(const char* msg) {
    make_syscall(SYSCALL_PANIC, (uintptr_t) msg);

    // should never get here
    while (true) {
  100d8b:	eb fe                	jmp    100d8b <assert_fail(char const*, int, char const*, char const*)+0x58>
                 "%s:%d: %s\n%s:%d: user assertion '%s' failed\n",
                 file, line, description, file, line, msg);
    } else {
        snprintf(buf, sizeof(buf),
  100d8d:	49 89 d1             	mov    %rdx,%r9
  100d90:	48 89 f9             	mov    %rdi,%rcx
  100d93:	ba d8 0e 10 00       	mov    $0x100ed8,%edx
  100d98:	be f0 00 00 00       	mov    $0xf0,%esi
  100d9d:	48 8d bd 10 ff ff ff 	lea    -0xf0(%rbp),%rdi
  100da4:	b0 00                	mov    $0x0,%al
  100da6:	e8 4c ff ff ff       	call   100cf7 <snprintf>
  100dab:	eb d0                	jmp    100d7d <assert_fail(char const*, int, char const*, char const*)+0x4a>
