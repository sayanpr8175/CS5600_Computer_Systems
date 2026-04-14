
obj/p-allocator.full:     file format elf64-x86-64


Disassembly of section .text:

0000000000100000 <process_main()>:

// These global variables go on the data page.
uint8_t* heap_top;
uint8_t* stack_bottom;

void process_main() {
  100000:	f3 0f 1e fa          	endbr64
  100004:	55                   	push   %rbp
  100005:	48 89 e5             	mov    %rsp,%rbp
  100008:	41 54                	push   %r12
  10000a:	53                   	push   %rbx
// make_syscall
//    These functions define the WeensyOS system call calling convention.
//    We provide versions for system calls with 0-2 arguments.

__always_inline uintptr_t make_syscall(int syscallno) {
    register uintptr_t rax asm("rax") = syscallno;
  10000b:	b8 01 00 00 00       	mov    $0x1,%eax
    asm volatile ("syscall"
  100010:	0f 05                	syscall
            : "+a" (rax)
            : /* all input registers are also output registers */
            : "cc", "memory", "rcx", "rdx", "rsi", "rdi", "r8", "r9",
              "r10", "r11");
    return rax;
  100012:	49 89 c4             	mov    %rax,%r12


// sys_getpid
//    Return current process ID. (Never fails.)
inline pid_t sys_getpid() {
    return make_syscall(SYSCALL_GETPID);
  100015:	89 c3                	mov    %eax,%ebx
    pid_t p = sys_getpid();
    srand(p);
  100017:	89 c7                	mov    %eax,%edi
  100019:	e8 a7 01 00 00       	call   1001c5 <srand(unsigned int)>
//    Return the smallest multiple of `m` greater than or equal to `x`.
//    Equivalently, round `x` up to the nearest multiple of `m`.
template <typename T>
inline constexpr T round_up(T x, unsigned m) {
    static_assert(std::is_unsigned<T>::value, "T must be unsigned");
    return round_down(x + m - 1, m);
  10001e:	ba 1b 30 10 00       	mov    $0x10301b,%edx

    // The heap starts on the page right after the 'end' symbol,
    // whose address is the first address not allocated to process code
    // or data.
    heap_top = (uint8_t*) round_up((uintptr_t) end, PAGESIZE);
  100023:	48 81 e2 00 f0 ff ff 	and    $0xfffffffffffff000,%rdx
  10002a:	48 89 15 d7 1f 00 00 	mov    %rdx,0x1fd7(%rip)        # 102008 <heap_top>
    return x;
}

__always_inline uintptr_t rdrsp() {
    uintptr_t x;
    asm volatile("movq %%rsp, %0" : "=r" (x));
  100031:	48 89 e0             	mov    %rsp,%rax

    // The bottom of the stack is the first address on the current
    // stack page (this process never needs more than one stack page).
    stack_bottom = (uint8_t*) round_down((uintptr_t) rdrsp() - 1, PAGESIZE);
  100034:	48 83 e8 01          	sub    $0x1,%rax
  100038:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  10003e:	48 89 05 bb 1f 00 00 	mov    %rax,0x1fbb(%rip)        # 102000 <stack_bottom>

    // Allocate heap pages until (1) hit the stack (out of address space)
    // or (2) allocation fails (out of physical memory).
    while (heap_top != stack_bottom) {
  100045:	48 39 c2             	cmp    %rax,%rdx
  100048:	75 4f                	jne    100099 <process_main()+0x99>
    register uintptr_t rax asm("rax") = syscallno;
  10004a:	b8 02 00 00 00       	mov    $0x2,%eax
    asm volatile ("syscall"
  10004f:	0f 05                	syscall
        }
        sys_yield();
    }

    // After running out of memory, do nothing forever
    while (true) {
  100051:	eb f7                	jmp    10004a <process_main()+0x4a>
                assert(*l == 0);
  100053:	b9 00 00 00 00       	mov    $0x0,%ecx
  100058:	ba 20 0c 10 00       	mov    $0x100c20,%edx
  10005d:	be 24 00 00 00       	mov    $0x24,%esi
  100062:	bf 28 0c 10 00       	mov    $0x100c28,%edi
  100067:	e8 2f 0b 00 00       	call   100b9b <assert_fail(char const*, int, char const*, char const*)>
            *heap_top = p;
  10006c:	44 88 21             	mov    %r12b,(%rcx)
            console[CPOS(24, 79)] = p;
  10006f:	66 44 89 25 27 8f fb 	mov    %r12w,-0x470d9(%rip)        # b8f9e <console+0xf9e>
  100076:	ff 
            heap_top += PAGESIZE;
  100077:	48 81 05 86 1f 00 00 	addq   $0x1000,0x1f86(%rip)        # 102008 <heap_top>
  10007e:	00 10 00 00 
    register uintptr_t rax asm("rax") = syscallno;
  100082:	b8 02 00 00 00       	mov    $0x2,%eax
    asm volatile ("syscall"
  100087:	0f 05                	syscall
    while (heap_top != stack_bottom) {
  100089:	48 8b 05 70 1f 00 00 	mov    0x1f70(%rip),%rax        # 102000 <stack_bottom>
  100090:	48 39 05 71 1f 00 00 	cmp    %rax,0x1f71(%rip)        # 102008 <heap_top>
  100097:	74 b1                	je     10004a <process_main()+0x4a>
        if (rand(0, ALLOC_SLOWDOWN - 1) < p) {
  100099:	be 09 00 00 00       	mov    $0x9,%esi
  10009e:	bf 00 00 00 00       	mov    $0x0,%edi
  1000a3:	e8 3c 01 00 00       	call   1001e4 <rand(int, int)>
  1000a8:	39 d8                	cmp    %ebx,%eax
  1000aa:	7d d6                	jge    100082 <process_main()+0x82>
    register uintptr_t rax asm("rax") = syscallno;
  1000ac:	b8 04 00 00 00       	mov    $0x4,%eax
    asm volatile ("syscall"
  1000b1:	48 8b 3d 50 1f 00 00 	mov    0x1f50(%rip),%rdi        # 102008 <heap_top>
  1000b8:	0f 05                	syscall
            if (sys_page_alloc(heap_top) < 0) {
  1000ba:	85 c0                	test   %eax,%eax
  1000bc:	78 8c                	js     10004a <process_main()+0x4a>
            for (unsigned long* l = (unsigned long*) heap_top;
  1000be:	48 8b 0d 43 1f 00 00 	mov    0x1f43(%rip),%rcx        # 102008 <heap_top>
                 l != (unsigned long*) (heap_top + PAGESIZE);
  1000c5:	48 8d 91 00 10 00 00 	lea    0x1000(%rcx),%rdx
            for (unsigned long* l = (unsigned long*) heap_top;
  1000cc:	48 89 c8             	mov    %rcx,%rax
                assert(*l == 0);
  1000cf:	48 83 38 00          	cmpq   $0x0,(%rax)
  1000d3:	0f 85 7a ff ff ff    	jne    100053 <process_main()+0x53>
            for (unsigned long* l = (unsigned long*) heap_top;
  1000d9:	48 83 c0 08          	add    $0x8,%rax
                 l != (unsigned long*) (heap_top + PAGESIZE);
  1000dd:	48 39 d0             	cmp    %rdx,%rax
  1000e0:	75 ed                	jne    1000cf <process_main()+0xcf>
  1000e2:	eb 88                	jmp    10006c <process_main()+0x6c>

00000000001000e4 <string_printer::putc(unsigned char, int)>:
    char* end_;
    size_t n_;
    string_printer(char* s, size_t size)
        : s_(s), end_(s + size), n_(0) {
    }
    void putc(unsigned char c, int) override {
  1000e4:	f3 0f 1e fa          	endbr64
        if (s_ < end_) {
  1000e8:	48 8b 47 08          	mov    0x8(%rdi),%rax
  1000ec:	48 3b 47 10          	cmp    0x10(%rdi),%rax
  1000f0:	73 0b                	jae    1000fd <string_printer::putc(unsigned char, int)+0x19>
            *s_++ = c;
  1000f2:	48 8d 50 01          	lea    0x1(%rax),%rdx
  1000f6:	48 89 57 08          	mov    %rdx,0x8(%rdi)
  1000fa:	40 88 30             	mov    %sil,(%rax)
        }
        ++n_;
  1000fd:	48 83 47 18 01       	addq   $0x1,0x18(%rdi)
    }
  100102:	c3                   	ret

0000000000100103 <strlen>:
size_t strlen(const char* s) {
  100103:	f3 0f 1e fa          	endbr64
    for (n = 0; *s != '\0'; ++s) {
  100107:	80 3f 00             	cmpb   $0x0,(%rdi)
  10010a:	74 10                	je     10011c <strlen+0x19>
  10010c:	b8 00 00 00 00       	mov    $0x0,%eax
        ++n;
  100111:	48 83 c0 01          	add    $0x1,%rax
    for (n = 0; *s != '\0'; ++s) {
  100115:	80 3c 07 00          	cmpb   $0x0,(%rdi,%rax,1)
  100119:	75 f6                	jne    100111 <strlen+0xe>
  10011b:	c3                   	ret
  10011c:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100121:	c3                   	ret

0000000000100122 <strnlen>:
size_t strnlen(const char* s, size_t maxlen) {
  100122:	f3 0f 1e fa          	endbr64
  100126:	48 89 f0             	mov    %rsi,%rax
    for (n = 0; n != maxlen && *s != '\0'; ++s) {
  100129:	ba 00 00 00 00       	mov    $0x0,%edx
  10012e:	48 85 f6             	test   %rsi,%rsi
  100131:	74 10                	je     100143 <strnlen+0x21>
  100133:	80 3c 17 00          	cmpb   $0x0,(%rdi,%rdx,1)
  100137:	74 0b                	je     100144 <strnlen+0x22>
        ++n;
  100139:	48 83 c2 01          	add    $0x1,%rdx
    for (n = 0; n != maxlen && *s != '\0'; ++s) {
  10013d:	48 39 d0             	cmp    %rdx,%rax
  100140:	75 f1                	jne    100133 <strnlen+0x11>
  100142:	c3                   	ret
  100143:	c3                   	ret
  100144:	48 89 d0             	mov    %rdx,%rax
}
  100147:	c3                   	ret

0000000000100148 <strchr>:
char* strchr(const char* s, int c) {
  100148:	f3 0f 1e fa          	endbr64
    while (*s != '\0' && *s != (char) c) {
  10014c:	0f b6 07             	movzbl (%rdi),%eax
  10014f:	84 c0                	test   %al,%al
  100151:	74 10                	je     100163 <strchr+0x1b>
  100153:	40 38 f0             	cmp    %sil,%al
  100156:	74 18                	je     100170 <strchr+0x28>
        ++s;
  100158:	48 83 c7 01          	add    $0x1,%rdi
    while (*s != '\0' && *s != (char) c) {
  10015c:	0f b6 07             	movzbl (%rdi),%eax
  10015f:	84 c0                	test   %al,%al
  100161:	75 f0                	jne    100153 <strchr+0xb>
        return (char*) s;
  100163:	40 84 f6             	test   %sil,%sil
  100166:	b8 00 00 00 00       	mov    $0x0,%eax
  10016b:	48 0f 44 c7          	cmove  %rdi,%rax
}
  10016f:	c3                   	ret
        return (char*) s;
  100170:	48 89 f8             	mov    %rdi,%rax
  100173:	c3                   	ret

0000000000100174 <rand()>:
int rand() {
  100174:	f3 0f 1e fa          	endbr64
    if (!rand_seed_set) {
  100178:	83 3d 99 1e 00 00 00 	cmpl   $0x0,0x1e99(%rip)        # 102018 <rand_seed_set>
  10017f:	74 27                	je     1001a8 <rand()+0x34>
    rand_seed = rand_seed * 6364136223846793005UL + 1;
  100181:	48 b8 2d 7f 95 4c 2d 	movabs $0x5851f42d4c957f2d,%rax
  100188:	f4 51 58 
  10018b:	48 0f af 05 7d 1e 00 	imul   0x1e7d(%rip),%rax        # 102010 <rand_seed>
  100192:	00 
  100193:	48 83 c0 01          	add    $0x1,%rax
  100197:	48 89 05 72 1e 00 00 	mov    %rax,0x1e72(%rip)        # 102010 <rand_seed>
    return (rand_seed >> 32) & RAND_MAX;
  10019e:	48 c1 e8 20          	shr    $0x20,%rax
  1001a2:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
}
  1001a7:	c3                   	ret
    rand_seed = ((unsigned long) seed << 32) | seed;
  1001a8:	48 b8 9e 87 d4 30 9e 	movabs $0x30d4879e30d4879e,%rax
  1001af:	87 d4 30 
  1001b2:	48 89 05 57 1e 00 00 	mov    %rax,0x1e57(%rip)        # 102010 <rand_seed>
    rand_seed_set = 1;
  1001b9:	c7 05 55 1e 00 00 01 	movl   $0x1,0x1e55(%rip)        # 102018 <rand_seed_set>
  1001c0:	00 00 00 
}
  1001c3:	eb bc                	jmp    100181 <rand()+0xd>

00000000001001c5 <srand(unsigned int)>:
void srand(unsigned seed) {
  1001c5:	f3 0f 1e fa          	endbr64
    rand_seed = ((unsigned long) seed << 32) | seed;
  1001c9:	89 f8                	mov    %edi,%eax
  1001cb:	48 c1 e7 20          	shl    $0x20,%rdi
  1001cf:	48 01 c7             	add    %rax,%rdi
  1001d2:	48 89 3d 37 1e 00 00 	mov    %rdi,0x1e37(%rip)        # 102010 <rand_seed>
    rand_seed_set = 1;
  1001d9:	c7 05 35 1e 00 00 01 	movl   $0x1,0x1e35(%rip)        # 102018 <rand_seed_set>
  1001e0:	00 00 00 
}
  1001e3:	c3                   	ret

00000000001001e4 <rand(int, int)>:
int rand(int min, int max) {
  1001e4:	f3 0f 1e fa          	endbr64
  1001e8:	55                   	push   %rbp
  1001e9:	48 89 e5             	mov    %rsp,%rbp
  1001ec:	41 54                	push   %r12
  1001ee:	53                   	push   %rbx
    assert(min <= max);
  1001ef:	39 f7                	cmp    %esi,%edi
  1001f1:	7f 26                	jg     100219 <rand(int, int)+0x35>
  1001f3:	41 89 fc             	mov    %edi,%r12d
  1001f6:	89 f3                	mov    %esi,%ebx
    unsigned long r = rand();
  1001f8:	e8 77 ff ff ff       	call   100174 <rand()>
    return min + (r * (max - min + 1)) / ((unsigned long) RAND_MAX + 1);
  1001fd:	44 29 e3             	sub    %r12d,%ebx
  100200:	83 c3 01             	add    $0x1,%ebx
  100203:	48 63 db             	movslq %ebx,%rbx
    unsigned long r = rand();
  100206:	48 98                	cltq
    return min + (r * (max - min + 1)) / ((unsigned long) RAND_MAX + 1);
  100208:	48 0f af d8          	imul   %rax,%rbx
  10020c:	48 c1 eb 1f          	shr    $0x1f,%rbx
  100210:	41 8d 04 1c          	lea    (%r12,%rbx,1),%eax
}
  100214:	5b                   	pop    %rbx
  100215:	41 5c                	pop    %r12
  100217:	5d                   	pop    %rbp
  100218:	c3                   	ret
    assert(min <= max);
  100219:	b9 00 00 00 00       	mov    $0x0,%ecx
  10021e:	ba 37 0c 10 00       	mov    $0x100c37,%edx
  100223:	be 45 01 00 00       	mov    $0x145,%esi
  100228:	bf 42 0c 10 00       	mov    $0x100c42,%edi
  10022d:	e8 69 09 00 00       	call   100b9b <assert_fail(char const*, int, char const*, char const*)>

0000000000100232 <printer::vprintf(int, char const*, __va_list_tag*)>:
void printer::vprintf(int color, const char* format, va_list val) {
  100232:	f3 0f 1e fa          	endbr64
  100236:	55                   	push   %rbp
  100237:	48 89 e5             	mov    %rsp,%rbp
  10023a:	41 57                	push   %r15
  10023c:	41 56                	push   %r14
  10023e:	41 55                	push   %r13
  100240:	41 54                	push   %r12
  100242:	53                   	push   %rbx
  100243:	48 83 ec 58          	sub    $0x58,%rsp
  100247:	49 89 ff             	mov    %rdi,%r15
  10024a:	41 89 f5             	mov    %esi,%r13d
  10024d:	49 89 d4             	mov    %rdx,%r12
  100250:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
    for (; *format; ++format) {
  100254:	0f b6 02             	movzbl (%rdx),%eax
  100257:	84 c0                	test   %al,%al
  100259:	0f 85 aa 05 00 00    	jne    100809 <printer::vprintf(int, char const*, __va_list_tag*)+0x5d7>
}
  10025f:	48 83 c4 58          	add    $0x58,%rsp
  100263:	5b                   	pop    %rbx
  100264:	41 5c                	pop    %r12
  100266:	41 5d                	pop    %r13
  100268:	41 5e                	pop    %r14
  10026a:	41 5f                	pop    %r15
  10026c:	5d                   	pop    %rbp
  10026d:	c3                   	ret
        for (++format; *format; ++format) {
  10026e:	49 8d 5c 24 01       	lea    0x1(%r12),%rbx
  100273:	45 0f b6 64 24 01    	movzbl 0x1(%r12),%r12d
  100279:	45 84 e4             	test   %r12b,%r12b
  10027c:	0f 84 08 01 00 00    	je     10038a <printer::vprintf(int, char const*, __va_list_tag*)+0x158>
        int flags = 0;
  100282:	41 be 00 00 00 00    	mov    $0x0,%r14d
            const char* flagc = strchr(flag_chars, *format);
  100288:	41 0f be f4          	movsbl %r12b,%esi
  10028c:	bf 51 13 10 00       	mov    $0x101351,%edi
  100291:	e8 b2 fe ff ff       	call   100148 <strchr>
  100296:	48 89 c1             	mov    %rax,%rcx
            if (flagc) {
  100299:	48 85 c0             	test   %rax,%rax
  10029c:	74 74                	je     100312 <printer::vprintf(int, char const*, __va_list_tag*)+0xe0>
                flags |= 1 << (flagc - flag_chars);
  10029e:	48 81 e9 51 13 10 00 	sub    $0x101351,%rcx
  1002a5:	b8 01 00 00 00       	mov    $0x1,%eax
  1002aa:	d3 e0                	shl    %cl,%eax
  1002ac:	41 09 c6             	or     %eax,%r14d
        for (++format; *format; ++format) {
  1002af:	48 83 c3 01          	add    $0x1,%rbx
  1002b3:	44 0f b6 23          	movzbl (%rbx),%r12d
  1002b7:	45 84 e4             	test   %r12b,%r12b
  1002ba:	75 cc                	jne    100288 <printer::vprintf(int, char const*, __va_list_tag*)+0x56>
        int width = -1;
  1002bc:	44 89 75 a4          	mov    %r14d,-0x5c(%rbp)
  1002c0:	41 be ff ff ff ff    	mov    $0xffffffff,%r14d
        int precision = -1;
  1002c6:	c7 45 a0 ff ff ff ff 	movl   $0xffffffff,-0x60(%rbp)
        if (*format == '.') {
  1002cd:	80 3b 2e             	cmpb   $0x2e,(%rbx)
  1002d0:	0f 84 dc 00 00 00    	je     1003b2 <printer::vprintf(int, char const*, __va_list_tag*)+0x180>
        switch (*format) {
  1002d6:	0f b6 03             	movzbl (%rbx),%eax
  1002d9:	3c 6c                	cmp    $0x6c,%al
  1002db:	0f 84 77 01 00 00    	je     100458 <printer::vprintf(int, char const*, __va_list_tag*)+0x226>
  1002e1:	0f 8f 52 01 00 00    	jg     100439 <printer::vprintf(int, char const*, __va_list_tag*)+0x207>
  1002e7:	3c 68                	cmp    $0x68,%al
  1002e9:	0f 85 8c 01 00 00    	jne    10047b <printer::vprintf(int, char const*, __va_list_tag*)+0x249>
            ++format;
  1002ef:	48 8d 43 01          	lea    0x1(%rbx),%rax
  1002f3:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
        switch (*format) {
  1002f7:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
  1002fb:	8d 50 bd             	lea    -0x43(%rax),%edx
  1002fe:	80 fa 35             	cmp    $0x35,%dl
  100301:	0f 87 b8 05 00 00    	ja     1008bf <printer::vprintf(int, char const*, __va_list_tag*)+0x68d>
  100307:	0f b6 d2             	movzbl %dl,%edx
  10030a:	3e ff 24 d5 60 0c 10 	notrack jmp *0x100c60(,%rdx,8)
  100311:	00 
        if (*format >= '1' && *format <= '9') {
  100312:	44 89 75 a4          	mov    %r14d,-0x5c(%rbp)
  100316:	41 8d 44 24 cf       	lea    -0x31(%r12),%eax
  10031b:	3c 08                	cmp    $0x8,%al
  10031d:	77 31                	ja     100350 <printer::vprintf(int, char const*, __va_list_tag*)+0x11e>
            for (width = 0; *format >= '0' && *format <= '9'; ) {
  10031f:	0f b6 03             	movzbl (%rbx),%eax
  100322:	8d 50 d0             	lea    -0x30(%rax),%edx
  100325:	80 fa 09             	cmp    $0x9,%dl
  100328:	77 72                	ja     10039c <printer::vprintf(int, char const*, __va_list_tag*)+0x16a>
  10032a:	41 be 00 00 00 00    	mov    $0x0,%r14d
                width = 10 * width + *format++ - '0';
  100330:	48 83 c3 01          	add    $0x1,%rbx
  100334:	43 8d 14 b6          	lea    (%r14,%r14,4),%edx
  100338:	0f be c0             	movsbl %al,%eax
  10033b:	44 8d 74 50 d0       	lea    -0x30(%rax,%rdx,2),%r14d
            for (width = 0; *format >= '0' && *format <= '9'; ) {
  100340:	0f b6 03             	movzbl (%rbx),%eax
  100343:	8d 50 d0             	lea    -0x30(%rax),%edx
  100346:	80 fa 09             	cmp    $0x9,%dl
  100349:	76 e5                	jbe    100330 <printer::vprintf(int, char const*, __va_list_tag*)+0xfe>
  10034b:	e9 76 ff ff ff       	jmp    1002c6 <printer::vprintf(int, char const*, __va_list_tag*)+0x94>
        } else if (*format == '*') {
  100350:	41 80 fc 2a          	cmp    $0x2a,%r12b
  100354:	75 51                	jne    1003a7 <printer::vprintf(int, char const*, __va_list_tag*)+0x175>
            width = va_arg(val, int);
  100356:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  10035a:	8b 01                	mov    (%rcx),%eax
  10035c:	83 f8 2f             	cmp    $0x2f,%eax
  10035f:	77 17                	ja     100378 <printer::vprintf(int, char const*, __va_list_tag*)+0x146>
  100361:	89 c2                	mov    %eax,%edx
  100363:	48 03 51 10          	add    0x10(%rcx),%rdx
  100367:	83 c0 08             	add    $0x8,%eax
  10036a:	89 01                	mov    %eax,(%rcx)
  10036c:	44 8b 32             	mov    (%rdx),%r14d
            ++format;
  10036f:	48 83 c3 01          	add    $0x1,%rbx
  100373:	e9 4e ff ff ff       	jmp    1002c6 <printer::vprintf(int, char const*, __va_list_tag*)+0x94>
            width = va_arg(val, int);
  100378:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  10037c:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  100380:	48 8d 42 08          	lea    0x8(%rdx),%rax
  100384:	48 89 47 08          	mov    %rax,0x8(%rdi)
  100388:	eb e2                	jmp    10036c <printer::vprintf(int, char const*, __va_list_tag*)+0x13a>
        int flags = 0;
  10038a:	c7 45 a4 00 00 00 00 	movl   $0x0,-0x5c(%rbp)
        int width = -1;
  100391:	41 be ff ff ff ff    	mov    $0xffffffff,%r14d
  100397:	e9 2a ff ff ff       	jmp    1002c6 <printer::vprintf(int, char const*, __va_list_tag*)+0x94>
            for (width = 0; *format >= '0' && *format <= '9'; ) {
  10039c:	41 be 00 00 00 00    	mov    $0x0,%r14d
  1003a2:	e9 1f ff ff ff       	jmp    1002c6 <printer::vprintf(int, char const*, __va_list_tag*)+0x94>
        int width = -1;
  1003a7:	41 be ff ff ff ff    	mov    $0xffffffff,%r14d
  1003ad:	e9 14 ff ff ff       	jmp    1002c6 <printer::vprintf(int, char const*, __va_list_tag*)+0x94>
            ++format;
  1003b2:	48 8d 53 01          	lea    0x1(%rbx),%rdx
            if (*format >= '0' && *format <= '9') {
  1003b6:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
  1003ba:	8d 48 d0             	lea    -0x30(%rax),%ecx
  1003bd:	80 f9 09             	cmp    $0x9,%cl
  1003c0:	76 13                	jbe    1003d5 <printer::vprintf(int, char const*, __va_list_tag*)+0x1a3>
            } else if (*format == '*') {
  1003c2:	3c 2a                	cmp    $0x2a,%al
  1003c4:	74 33                	je     1003f9 <printer::vprintf(int, char const*, __va_list_tag*)+0x1c7>
            ++format;
  1003c6:	48 89 d3             	mov    %rdx,%rbx
                precision = 0;
  1003c9:	c7 45 a0 00 00 00 00 	movl   $0x0,-0x60(%rbp)
  1003d0:	e9 01 ff ff ff       	jmp    1002d6 <printer::vprintf(int, char const*, __va_list_tag*)+0xa4>
                for (precision = 0; *format >= '0' && *format <= '9'; ) {
  1003d5:	b9 00 00 00 00       	mov    $0x0,%ecx
                    precision = 10 * precision + *format++ - '0';
  1003da:	48 83 c2 01          	add    $0x1,%rdx
  1003de:	8d 0c 89             	lea    (%rcx,%rcx,4),%ecx
  1003e1:	0f be c0             	movsbl %al,%eax
  1003e4:	8d 4c 48 d0          	lea    -0x30(%rax,%rcx,2),%ecx
                for (precision = 0; *format >= '0' && *format <= '9'; ) {
  1003e8:	0f b6 02             	movzbl (%rdx),%eax
  1003eb:	8d 70 d0             	lea    -0x30(%rax),%esi
  1003ee:	40 80 fe 09          	cmp    $0x9,%sil
  1003f2:	76 e6                	jbe    1003da <printer::vprintf(int, char const*, __va_list_tag*)+0x1a8>
  1003f4:	48 89 d3             	mov    %rdx,%rbx
  1003f7:	eb 1c                	jmp    100415 <printer::vprintf(int, char const*, __va_list_tag*)+0x1e3>
                precision = va_arg(val, int);
  1003f9:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1003fd:	8b 01                	mov    (%rcx),%eax
  1003ff:	83 f8 2f             	cmp    $0x2f,%eax
  100402:	77 23                	ja     100427 <printer::vprintf(int, char const*, __va_list_tag*)+0x1f5>
  100404:	89 c2                	mov    %eax,%edx
  100406:	48 03 51 10          	add    0x10(%rcx),%rdx
  10040a:	83 c0 08             	add    $0x8,%eax
  10040d:	89 01                	mov    %eax,(%rcx)
  10040f:	8b 0a                	mov    (%rdx),%ecx
                ++format;
  100411:	48 83 c3 02          	add    $0x2,%rbx
            if (precision < 0) {
  100415:	85 c9                	test   %ecx,%ecx
  100417:	b8 00 00 00 00       	mov    $0x0,%eax
  10041c:	0f 49 c1             	cmovns %ecx,%eax
  10041f:	89 45 a0             	mov    %eax,-0x60(%rbp)
  100422:	e9 af fe ff ff       	jmp    1002d6 <printer::vprintf(int, char const*, __va_list_tag*)+0xa4>
                precision = va_arg(val, int);
  100427:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  10042b:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  10042f:	48 8d 42 08          	lea    0x8(%rdx),%rax
  100433:	48 89 41 08          	mov    %rax,0x8(%rcx)
  100437:	eb d6                	jmp    10040f <printer::vprintf(int, char const*, __va_list_tag*)+0x1dd>
        switch (*format) {
  100439:	3c 74                	cmp    $0x74,%al
  10043b:	74 1b                	je     100458 <printer::vprintf(int, char const*, __va_list_tag*)+0x226>
  10043d:	3c 7a                	cmp    $0x7a,%al
  10043f:	74 17                	je     100458 <printer::vprintf(int, char const*, __va_list_tag*)+0x226>
        switch (*format) {
  100441:	8d 50 bd             	lea    -0x43(%rax),%edx
  100444:	80 fa 35             	cmp    $0x35,%dl
  100447:	0f 87 6f 06 00 00    	ja     100abc <printer::vprintf(int, char const*, __va_list_tag*)+0x88a>
  10044d:	0f b6 d2             	movzbl %dl,%edx
  100450:	3e ff 24 d5 10 0e 10 	notrack jmp *0x100e10(,%rdx,8)
  100457:	00 
            ++format;
  100458:	48 8d 43 01          	lea    0x1(%rbx),%rax
  10045c:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
        switch (*format) {
  100460:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
  100464:	8d 50 bd             	lea    -0x43(%rax),%edx
  100467:	80 fa 35             	cmp    $0x35,%dl
  10046a:	0f 87 4f 04 00 00    	ja     1008bf <printer::vprintf(int, char const*, __va_list_tag*)+0x68d>
  100470:	0f b6 d2             	movzbl %dl,%edx
  100473:	3e ff 24 d5 c0 0f 10 	notrack jmp *0x100fc0(,%rdx,8)
  10047a:	00 
  10047b:	8d 50 bd             	lea    -0x43(%rax),%edx
  10047e:	80 fa 35             	cmp    $0x35,%dl
  100481:	0f 87 34 04 00 00    	ja     1008bb <printer::vprintf(int, char const*, __va_list_tag*)+0x689>
  100487:	0f b6 d2             	movzbl %dl,%edx
  10048a:	3e ff 24 d5 70 11 10 	notrack jmp *0x101170(,%rdx,8)
  100491:	00 
            long x = length ? va_arg(val, long) : va_arg(val, int);
  100492:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  100496:	8b 07                	mov    (%rdi),%eax
  100498:	83 f8 2f             	cmp    $0x2f,%eax
  10049b:	77 38                	ja     1004d5 <printer::vprintf(int, char const*, __va_list_tag*)+0x2a3>
  10049d:	89 c2                	mov    %eax,%edx
  10049f:	48 03 57 10          	add    0x10(%rdi),%rdx
  1004a3:	83 c0 08             	add    $0x8,%eax
  1004a6:	89 07                	mov    %eax,(%rdi)
  1004a8:	48 8b 12             	mov    (%rdx),%rdx
            int negative = x < 0 ? FLAG_NEGATIVE : 0;
  1004ab:	48 89 d0             	mov    %rdx,%rax
  1004ae:	48 c1 f8 37          	sar    $0x37,%rax
            num = negative ? -x : x;
  1004b2:	49 89 d3             	mov    %rdx,%r11
  1004b5:	49 f7 db             	neg    %r11
  1004b8:	25 00 01 00 00       	and    $0x100,%eax
  1004bd:	4c 0f 44 da          	cmove  %rdx,%r11
            flags |= FLAG_NUMERIC | FLAG_SIGNED | negative;
  1004c1:	8b 7d a4             	mov    -0x5c(%rbp),%edi
  1004c4:	09 f8                	or     %edi,%eax
  1004c6:	0c c0                	or     $0xc0,%al
  1004c8:	89 45 a4             	mov    %eax,-0x5c(%rbp)
        const char* data = "";
  1004cb:	bb 51 0c 10 00       	mov    $0x100c51,%ebx
            break;
  1004d0:	e9 f4 01 00 00       	jmp    1006c9 <printer::vprintf(int, char const*, __va_list_tag*)+0x497>
            long x = length ? va_arg(val, long) : va_arg(val, int);
  1004d5:	48 8b 5d 90          	mov    -0x70(%rbp),%rbx
  1004d9:	48 8b 53 08          	mov    0x8(%rbx),%rdx
  1004dd:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1004e1:	48 89 43 08          	mov    %rax,0x8(%rbx)
  1004e5:	eb c1                	jmp    1004a8 <printer::vprintf(int, char const*, __va_list_tag*)+0x276>
        switch (*format) {
  1004e7:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  1004eb:	eb 04                	jmp    1004f1 <printer::vprintf(int, char const*, __va_list_tag*)+0x2bf>
  1004ed:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            long x = length ? va_arg(val, long) : va_arg(val, int);
  1004f1:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1004f5:	8b 01                	mov    (%rcx),%eax
  1004f7:	83 f8 2f             	cmp    $0x2f,%eax
  1004fa:	77 10                	ja     10050c <printer::vprintf(int, char const*, __va_list_tag*)+0x2da>
  1004fc:	89 c2                	mov    %eax,%edx
  1004fe:	48 03 51 10          	add    0x10(%rcx),%rdx
  100502:	83 c0 08             	add    $0x8,%eax
  100505:	89 01                	mov    %eax,(%rcx)
  100507:	48 63 12             	movslq (%rdx),%rdx
  10050a:	eb 9f                	jmp    1004ab <printer::vprintf(int, char const*, __va_list_tag*)+0x279>
  10050c:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  100510:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  100514:	48 8d 42 08          	lea    0x8(%rdx),%rax
  100518:	48 89 47 08          	mov    %rax,0x8(%rdi)
  10051c:	eb e9                	jmp    100507 <printer::vprintf(int, char const*, __va_list_tag*)+0x2d5>
        switch (*format) {
  10051e:	b8 01 00 00 00       	mov    $0x1,%eax
  100523:	c7 45 9c 0a 00 00 00 	movl   $0xa,-0x64(%rbp)
  10052a:	e9 9d 00 00 00       	jmp    1005cc <printer::vprintf(int, char const*, __va_list_tag*)+0x39a>
  10052f:	b8 00 00 00 00       	mov    $0x0,%eax
  100534:	c7 45 9c 0a 00 00 00 	movl   $0xa,-0x64(%rbp)
  10053b:	e9 8c 00 00 00       	jmp    1005cc <printer::vprintf(int, char const*, __va_list_tag*)+0x39a>
  100540:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  100544:	b8 00 00 00 00       	mov    $0x0,%eax
  100549:	c7 45 9c 0a 00 00 00 	movl   $0xa,-0x64(%rbp)
  100550:	eb 7a                	jmp    1005cc <printer::vprintf(int, char const*, __va_list_tag*)+0x39a>
  100552:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  100556:	b8 00 00 00 00       	mov    $0x0,%eax
  10055b:	c7 45 9c 0a 00 00 00 	movl   $0xa,-0x64(%rbp)
  100562:	eb 68                	jmp    1005cc <printer::vprintf(int, char const*, __va_list_tag*)+0x39a>
            num = length ? va_arg(val, unsigned long) : va_arg(val, unsigned);
  100564:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  100568:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  10056c:	48 8d 42 08          	lea    0x8(%rdx),%rax
  100570:	48 89 47 08          	mov    %rax,0x8(%rdi)
  100574:	eb 70                	jmp    1005e6 <printer::vprintf(int, char const*, __va_list_tag*)+0x3b4>
  100576:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  10057a:	8b 01                	mov    (%rcx),%eax
  10057c:	83 f8 2f             	cmp    $0x2f,%eax
  10057f:	77 10                	ja     100591 <printer::vprintf(int, char const*, __va_list_tag*)+0x35f>
  100581:	89 c2                	mov    %eax,%edx
  100583:	48 03 51 10          	add    0x10(%rcx),%rdx
  100587:	83 c0 08             	add    $0x8,%eax
  10058a:	89 01                	mov    %eax,(%rcx)
  10058c:	44 8b 1a             	mov    (%rdx),%r11d
  10058f:	eb 58                	jmp    1005e9 <printer::vprintf(int, char const*, __va_list_tag*)+0x3b7>
  100591:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  100595:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  100599:	48 8d 42 08          	lea    0x8(%rdx),%rax
  10059d:	48 89 41 08          	mov    %rax,0x8(%rcx)
  1005a1:	eb e9                	jmp    10058c <printer::vprintf(int, char const*, __va_list_tag*)+0x35a>
        switch (*format) {
  1005a3:	b8 01 00 00 00       	mov    $0x1,%eax
  1005a8:	eb 1b                	jmp    1005c5 <printer::vprintf(int, char const*, __va_list_tag*)+0x393>
  1005aa:	b8 00 00 00 00       	mov    $0x0,%eax
  1005af:	eb 14                	jmp    1005c5 <printer::vprintf(int, char const*, __va_list_tag*)+0x393>
  1005b1:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  1005b5:	b8 00 00 00 00       	mov    $0x0,%eax
  1005ba:	eb 09                	jmp    1005c5 <printer::vprintf(int, char const*, __va_list_tag*)+0x393>
  1005bc:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  1005c0:	b8 00 00 00 00       	mov    $0x0,%eax
            base = -16;
  1005c5:	c7 45 9c f0 ff ff ff 	movl   $0xfffffff0,-0x64(%rbp)
            num = length ? va_arg(val, unsigned long) : va_arg(val, unsigned);
  1005cc:	85 c0                	test   %eax,%eax
  1005ce:	74 a6                	je     100576 <printer::vprintf(int, char const*, __va_list_tag*)+0x344>
  1005d0:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  1005d4:	8b 07                	mov    (%rdi),%eax
  1005d6:	83 f8 2f             	cmp    $0x2f,%eax
  1005d9:	77 89                	ja     100564 <printer::vprintf(int, char const*, __va_list_tag*)+0x332>
  1005db:	89 c2                	mov    %eax,%edx
  1005dd:	48 03 57 10          	add    0x10(%rdi),%rdx
  1005e1:	83 c0 08             	add    $0x8,%eax
  1005e4:	89 07                	mov    %eax,(%rdi)
  1005e6:	4c 8b 1a             	mov    (%rdx),%r11
            flags |= FLAG_NUMERIC;
  1005e9:	8b 45 a4             	mov    -0x5c(%rbp),%eax
  1005ec:	83 c8 40             	or     $0x40,%eax
    if (base < 0) {
  1005ef:	83 7d 9c 00          	cmpl   $0x0,-0x64(%rbp)
  1005f3:	0f 89 ea 02 00 00    	jns    1008e3 <printer::vprintf(int, char const*, __va_list_tag*)+0x6b1>
    *--pos = '\0';
  1005f9:	c6 45 cf 00          	movb   $0x0,-0x31(%rbp)
    if (flags & FLAG_THOUSANDS) {
  1005fd:	a8 20                	test   $0x20,%al
  1005ff:	0f 85 0d 03 00 00    	jne    100912 <printer::vprintf(int, char const*, __va_list_tag*)+0x6e0>
  100605:	89 45 a4             	mov    %eax,-0x5c(%rbp)
        digits = lower_digits;
  100608:	41 ba 20 13 10 00    	mov    $0x101320,%r10d
        base = -base;
  10060e:	41 b9 10 00 00 00    	mov    $0x10,%r9d
    if (flags & FLAG_THOUSANDS) {
  100614:	c7 45 98 40 00 00 00 	movl   $0x40,-0x68(%rbp)
        thousands_pos = nullptr;
  10061b:	bf 00 00 00 00       	mov    $0x0,%edi
  100620:	e9 0f 03 00 00       	jmp    100934 <printer::vprintf(int, char const*, __va_list_tag*)+0x702>
        switch (*format) {
  100625:	b8 01 00 00 00       	mov    $0x1,%eax
  10062a:	eb 1b                	jmp    100647 <printer::vprintf(int, char const*, __va_list_tag*)+0x415>
  10062c:	b8 00 00 00 00       	mov    $0x0,%eax
  100631:	eb 14                	jmp    100647 <printer::vprintf(int, char const*, __va_list_tag*)+0x415>
  100633:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  100637:	b8 00 00 00 00       	mov    $0x0,%eax
  10063c:	eb 09                	jmp    100647 <printer::vprintf(int, char const*, __va_list_tag*)+0x415>
  10063e:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  100642:	b8 00 00 00 00       	mov    $0x0,%eax
            base = 16;
  100647:	c7 45 9c 10 00 00 00 	movl   $0x10,-0x64(%rbp)
            goto format_unsigned;
  10064e:	e9 79 ff ff ff       	jmp    1005cc <printer::vprintf(int, char const*, __va_list_tag*)+0x39a>
        switch (*format) {
  100653:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  100657:	eb 04                	jmp    10065d <printer::vprintf(int, char const*, __va_list_tag*)+0x42b>
  100659:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            num = (uintptr_t) va_arg(val, void*);
  10065d:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  100661:	8b 01                	mov    (%rcx),%eax
  100663:	83 f8 2f             	cmp    $0x2f,%eax
  100666:	77 22                	ja     10068a <printer::vprintf(int, char const*, __va_list_tag*)+0x458>
  100668:	89 c2                	mov    %eax,%edx
  10066a:	48 03 51 10          	add    0x10(%rcx),%rdx
  10066e:	83 c0 08             	add    $0x8,%eax
  100671:	89 01                	mov    %eax,(%rcx)
  100673:	4c 8b 1a             	mov    (%rdx),%r11
            flags |= FLAG_ALT | FLAG_ALT2 | FLAG_NUMERIC;
  100676:	8b 45 a4             	mov    -0x5c(%rbp),%eax
  100679:	0d 41 02 00 00       	or     $0x241,%eax
            base = -16;
  10067e:	c7 45 9c f0 ff ff ff 	movl   $0xfffffff0,-0x64(%rbp)
  100685:	e9 6f ff ff ff       	jmp    1005f9 <printer::vprintf(int, char const*, __va_list_tag*)+0x3c7>
            num = (uintptr_t) va_arg(val, void*);
  10068a:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  10068e:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  100692:	48 8d 42 08          	lea    0x8(%rdx),%rax
  100696:	48 89 47 08          	mov    %rax,0x8(%rdi)
  10069a:	eb d7                	jmp    100673 <printer::vprintf(int, char const*, __va_list_tag*)+0x441>
        switch (*format) {
  10069c:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  1006a0:	eb 04                	jmp    1006a6 <printer::vprintf(int, char const*, __va_list_tag*)+0x474>
  1006a2:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            data = va_arg(val, char*);
  1006a6:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  1006aa:	8b 07                	mov    (%rdi),%eax
  1006ac:	83 f8 2f             	cmp    $0x2f,%eax
  1006af:	0f 87 70 01 00 00    	ja     100825 <printer::vprintf(int, char const*, __va_list_tag*)+0x5f3>
  1006b5:	89 c2                	mov    %eax,%edx
  1006b7:	48 03 57 10          	add    0x10(%rdi),%rdx
  1006bb:	83 c0 08             	add    $0x8,%eax
  1006be:	89 07                	mov    %eax,(%rdi)
  1006c0:	48 8b 1a             	mov    (%rdx),%rbx
        unsigned long num = 0;
  1006c3:	41 bb 00 00 00 00    	mov    $0x0,%r11d
        if (flags & FLAG_NUMERIC) {
  1006c9:	8b 45 a4             	mov    -0x5c(%rbp),%eax
  1006cc:	83 e0 40             	and    $0x40,%eax
  1006cf:	89 45 98             	mov    %eax,-0x68(%rbp)
        const char* prefix = "";
  1006d2:	41 bc 51 0c 10 00    	mov    $0x100c51,%r12d
        if (flags & FLAG_NUMERIC) {
  1006d8:	0f 85 f8 03 00 00    	jne    100ad6 <printer::vprintf(int, char const*, __va_list_tag*)+0x8a4>
        if (precision >= 0 && !(flags & FLAG_NUMERIC)) {
  1006de:	8b 7d a0             	mov    -0x60(%rbp),%edi
  1006e1:	89 f8                	mov    %edi,%eax
  1006e3:	f7 d0                	not    %eax
  1006e5:	c1 e8 1f             	shr    $0x1f,%eax
  1006e8:	89 45 8c             	mov    %eax,-0x74(%rbp)
  1006eb:	83 7d 98 00          	cmpl   $0x0,-0x68(%rbp)
  1006ef:	0f 85 63 03 00 00    	jne    100a58 <printer::vprintf(int, char const*, __va_list_tag*)+0x826>
  1006f5:	84 c0                	test   %al,%al
  1006f7:	0f 84 5b 03 00 00    	je     100a58 <printer::vprintf(int, char const*, __va_list_tag*)+0x826>
            datalen = strnlen(data, precision);
  1006fd:	48 63 f7             	movslq %edi,%rsi
  100700:	48 89 df             	mov    %rbx,%rdi
  100703:	e8 1a fa ff ff       	call   100122 <strnlen>
  100708:	89 45 9c             	mov    %eax,-0x64(%rbp)
                   && datalen + (int) strlen(prefix) < width) {
  10070b:	8b 45 a4             	mov    -0x5c(%rbp),%eax
  10070e:	83 e0 46             	and    $0x46,%eax
            zeros = 0;
  100711:	c7 45 a0 00 00 00 00 	movl   $0x0,-0x60(%rbp)
                   && datalen + (int) strlen(prefix) < width) {
  100718:	83 f8 42             	cmp    $0x42,%eax
  10071b:	0f 84 6f 03 00 00    	je     100a90 <printer::vprintf(int, char const*, __va_list_tag*)+0x85e>
        width -= datalen + zeros + strlen(prefix);
  100721:	4c 89 e7             	mov    %r12,%rdi
  100724:	e8 da f9 ff ff       	call   100103 <strlen>
  100729:	8b 7d a0             	mov    -0x60(%rbp),%edi
  10072c:	8b 4d 9c             	mov    -0x64(%rbp),%ecx
  10072f:	01 f9                	add    %edi,%ecx
  100731:	44 89 f2             	mov    %r14d,%edx
  100734:	29 ca                	sub    %ecx,%edx
  100736:	29 c2                	sub    %eax,%edx
  100738:	41 89 d6             	mov    %edx,%r14d
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
  10073b:	f6 45 a4 04          	testb  $0x4,-0x5c(%rbp)
  10073f:	75 32                	jne    100773 <printer::vprintf(int, char const*, __va_list_tag*)+0x541>
  100741:	85 d2                	test   %edx,%edx
  100743:	7e 2e                	jle    100773 <printer::vprintf(int, char const*, __va_list_tag*)+0x541>
        width -= datalen + zeros + strlen(prefix);
  100745:	89 55 a4             	mov    %edx,-0x5c(%rbp)
            putc(' ', color);
  100748:	49 8b 07             	mov    (%r15),%rax
  10074b:	44 89 ea             	mov    %r13d,%edx
  10074e:	be 20 00 00 00       	mov    $0x20,%esi
  100753:	4c 89 ff             	mov    %r15,%rdi
  100756:	ff 10                	call   *(%rax)
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
  100758:	41 83 ee 01          	sub    $0x1,%r14d
  10075c:	45 85 f6             	test   %r14d,%r14d
  10075f:	7f e7                	jg     100748 <printer::vprintf(int, char const*, __va_list_tag*)+0x516>
  100761:	8b 55 a4             	mov    -0x5c(%rbp),%edx
  100764:	85 d2                	test   %edx,%edx
  100766:	b8 01 00 00 00       	mov    $0x1,%eax
  10076b:	0f 4f c2             	cmovg  %edx,%eax
  10076e:	29 c2                	sub    %eax,%edx
  100770:	41 89 d6             	mov    %edx,%r14d
        for (; *prefix; ++prefix) {
  100773:	41 0f b6 04 24       	movzbl (%r12),%eax
  100778:	84 c0                	test   %al,%al
  10077a:	74 1b                	je     100797 <printer::vprintf(int, char const*, __va_list_tag*)+0x565>
            putc(*prefix, color);
  10077c:	0f b6 f0             	movzbl %al,%esi
  10077f:	49 8b 07             	mov    (%r15),%rax
  100782:	44 89 ea             	mov    %r13d,%edx
  100785:	4c 89 ff             	mov    %r15,%rdi
  100788:	ff 10                	call   *(%rax)
        for (; *prefix; ++prefix) {
  10078a:	49 83 c4 01          	add    $0x1,%r12
  10078e:	41 0f b6 04 24       	movzbl (%r12),%eax
  100793:	84 c0                	test   %al,%al
  100795:	75 e5                	jne    10077c <printer::vprintf(int, char const*, __va_list_tag*)+0x54a>
        for (; zeros > 0; --zeros) {
  100797:	44 8b 65 a0          	mov    -0x60(%rbp),%r12d
  10079b:	45 85 e4             	test   %r12d,%r12d
  10079e:	7e 16                	jle    1007b6 <printer::vprintf(int, char const*, __va_list_tag*)+0x584>
            putc('0', color);
  1007a0:	49 8b 07             	mov    (%r15),%rax
  1007a3:	44 89 ea             	mov    %r13d,%edx
  1007a6:	be 30 00 00 00       	mov    $0x30,%esi
  1007ab:	4c 89 ff             	mov    %r15,%rdi
  1007ae:	ff 10                	call   *(%rax)
        for (; zeros > 0; --zeros) {
  1007b0:	41 83 ec 01          	sub    $0x1,%r12d
  1007b4:	75 ea                	jne    1007a0 <printer::vprintf(int, char const*, __va_list_tag*)+0x56e>
        for (; datalen > 0; ++data, --datalen) {
  1007b6:	8b 45 9c             	mov    -0x64(%rbp),%eax
  1007b9:	85 c0                	test   %eax,%eax
  1007bb:	7e 1d                	jle    1007da <printer::vprintf(int, char const*, __va_list_tag*)+0x5a8>
  1007bd:	41 89 c4             	mov    %eax,%r12d
  1007c0:	49 01 dc             	add    %rbx,%r12
            putc(*data, color);
  1007c3:	0f b6 33             	movzbl (%rbx),%esi
  1007c6:	49 8b 07             	mov    (%r15),%rax
  1007c9:	44 89 ea             	mov    %r13d,%edx
  1007cc:	4c 89 ff             	mov    %r15,%rdi
  1007cf:	ff 10                	call   *(%rax)
        for (; datalen > 0; ++data, --datalen) {
  1007d1:	48 83 c3 01          	add    $0x1,%rbx
  1007d5:	49 39 dc             	cmp    %rbx,%r12
  1007d8:	75 e9                	jne    1007c3 <printer::vprintf(int, char const*, __va_list_tag*)+0x591>
        for (; width > 0; --width) {
  1007da:	45 85 f6             	test   %r14d,%r14d
  1007dd:	7e 16                	jle    1007f5 <printer::vprintf(int, char const*, __va_list_tag*)+0x5c3>
            putc(' ', color);
  1007df:	49 8b 07             	mov    (%r15),%rax
  1007e2:	44 89 ea             	mov    %r13d,%edx
  1007e5:	be 20 00 00 00       	mov    $0x20,%esi
  1007ea:	4c 89 ff             	mov    %r15,%rdi
  1007ed:	ff 10                	call   *(%rax)
        for (; width > 0; --width) {
  1007ef:	41 83 ee 01          	sub    $0x1,%r14d
  1007f3:	75 ea                	jne    1007df <printer::vprintf(int, char const*, __va_list_tag*)+0x5ad>
    for (; *format; ++format) {
  1007f5:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  1007f9:	4c 8d 60 01          	lea    0x1(%rax),%r12
  1007fd:	0f b6 40 01          	movzbl 0x1(%rax),%eax
  100801:	84 c0                	test   %al,%al
  100803:	0f 84 56 fa ff ff    	je     10025f <printer::vprintf(int, char const*, __va_list_tag*)+0x2d>
        if (*format != '%') {
  100809:	3c 25                	cmp    $0x25,%al
  10080b:	0f 84 5d fa ff ff    	je     10026e <printer::vprintf(int, char const*, __va_list_tag*)+0x3c>
            putc(*format, color);
  100811:	0f b6 f0             	movzbl %al,%esi
  100814:	49 8b 07             	mov    (%r15),%rax
  100817:	44 89 ea             	mov    %r13d,%edx
  10081a:	4c 89 ff             	mov    %r15,%rdi
  10081d:	ff 10                	call   *(%rax)
            continue;
  10081f:	4c 89 65 a8          	mov    %r12,-0x58(%rbp)
  100823:	eb d0                	jmp    1007f5 <printer::vprintf(int, char const*, __va_list_tag*)+0x5c3>
            data = va_arg(val, char*);
  100825:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  100829:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  10082d:	48 8d 42 08          	lea    0x8(%rdx),%rax
  100831:	48 89 41 08          	mov    %rax,0x8(%rcx)
  100835:	e9 86 fe ff ff       	jmp    1006c0 <printer::vprintf(int, char const*, __va_list_tag*)+0x48e>
        switch (*format) {
  10083a:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  10083e:	eb 04                	jmp    100844 <printer::vprintf(int, char const*, __va_list_tag*)+0x612>
  100840:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            color = va_arg(val, int);
  100844:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  100848:	8b 01                	mov    (%rcx),%eax
  10084a:	83 f8 2f             	cmp    $0x2f,%eax
  10084d:	77 10                	ja     10085f <printer::vprintf(int, char const*, __va_list_tag*)+0x62d>
  10084f:	89 c2                	mov    %eax,%edx
  100851:	48 03 51 10          	add    0x10(%rcx),%rdx
  100855:	83 c0 08             	add    $0x8,%eax
  100858:	89 01                	mov    %eax,(%rcx)
  10085a:	44 8b 2a             	mov    (%rdx),%r13d
            continue;
  10085d:	eb 96                	jmp    1007f5 <printer::vprintf(int, char const*, __va_list_tag*)+0x5c3>
            color = va_arg(val, int);
  10085f:	48 8b 5d 90          	mov    -0x70(%rbp),%rbx
  100863:	48 8b 53 08          	mov    0x8(%rbx),%rdx
  100867:	48 8d 42 08          	lea    0x8(%rdx),%rax
  10086b:	48 89 43 08          	mov    %rax,0x8(%rbx)
  10086f:	eb e9                	jmp    10085a <printer::vprintf(int, char const*, __va_list_tag*)+0x628>
        switch (*format) {
  100871:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  100875:	eb 04                	jmp    10087b <printer::vprintf(int, char const*, __va_list_tag*)+0x649>
  100877:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            numbuf[0] = va_arg(val, int);
  10087b:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  10087f:	8b 07                	mov    (%rdi),%eax
  100881:	83 f8 2f             	cmp    $0x2f,%eax
  100884:	77 23                	ja     1008a9 <printer::vprintf(int, char const*, __va_list_tag*)+0x677>
  100886:	89 c2                	mov    %eax,%edx
  100888:	48 03 57 10          	add    0x10(%rdi),%rdx
  10088c:	83 c0 08             	add    $0x8,%eax
  10088f:	89 07                	mov    %eax,(%rdi)
  100891:	8b 02                	mov    (%rdx),%eax
  100893:	88 45 b0             	mov    %al,-0x50(%rbp)
            numbuf[1] = '\0';
  100896:	c6 45 b1 00          	movb   $0x0,-0x4f(%rbp)
            data = numbuf;
  10089a:	48 8d 5d b0          	lea    -0x50(%rbp),%rbx
        unsigned long num = 0;
  10089e:	41 bb 00 00 00 00    	mov    $0x0,%r11d
            break;
  1008a4:	e9 20 fe ff ff       	jmp    1006c9 <printer::vprintf(int, char const*, __va_list_tag*)+0x497>
            numbuf[0] = va_arg(val, int);
  1008a9:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  1008ad:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  1008b1:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1008b5:	48 89 47 08          	mov    %rax,0x8(%rdi)
  1008b9:	eb d6                	jmp    100891 <printer::vprintf(int, char const*, __va_list_tag*)+0x65f>
        switch (*format) {
  1008bb:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            numbuf[0] = (*format ? *format : '%');
  1008bf:	84 c0                	test   %al,%al
  1008c1:	0f 85 f1 01 00 00    	jne    100ab8 <printer::vprintf(int, char const*, __va_list_tag*)+0x886>
  1008c7:	c6 45 b0 25          	movb   $0x25,-0x50(%rbp)
            numbuf[1] = '\0';
  1008cb:	c6 45 b1 00          	movb   $0x0,-0x4f(%rbp)
                format--;
  1008cf:	48 83 6d a8 01       	subq   $0x1,-0x58(%rbp)
            data = numbuf;
  1008d4:	48 8d 5d b0          	lea    -0x50(%rbp),%rbx
        unsigned long num = 0;
  1008d8:	41 bb 00 00 00 00    	mov    $0x0,%r11d
  1008de:	e9 e6 fd ff ff       	jmp    1006c9 <printer::vprintf(int, char const*, __va_list_tag*)+0x497>
    *--pos = '\0';
  1008e3:	c6 45 cf 00          	movb   $0x0,-0x31(%rbp)
    if (flags & FLAG_THOUSANDS) {
  1008e7:	f6 45 a4 20          	testb  $0x20,-0x5c(%rbp)
  1008eb:	74 73                	je     100960 <printer::vprintf(int, char const*, __va_list_tag*)+0x72e>
        thousands_pos = pos - (base == 10 ? 3 : 4);
  1008ed:	8b 5d 9c             	mov    -0x64(%rbp),%ebx
  1008f0:	41 89 d9             	mov    %ebx,%r9d
  1008f3:	89 45 a4             	mov    %eax,-0x5c(%rbp)
  1008f6:	41 ba 40 13 10 00    	mov    $0x101340,%r10d
  1008fc:	c7 45 98 40 00 00 00 	movl   $0x40,-0x68(%rbp)
  100903:	83 fb 0a             	cmp    $0xa,%ebx
  100906:	0f 94 c0             	sete   %al
  100909:	0f b6 c0             	movzbl %al,%eax
  10090c:	48 83 e8 04          	sub    $0x4,%rax
  100910:	eb 1d                	jmp    10092f <printer::vprintf(int, char const*, __va_list_tag*)+0x6fd>
    if (flags & FLAG_THOUSANDS) {
  100912:	89 45 a4             	mov    %eax,-0x5c(%rbp)
        digits = lower_digits;
  100915:	41 ba 20 13 10 00    	mov    $0x101320,%r10d
        base = -base;
  10091b:	41 b9 10 00 00 00    	mov    $0x10,%r9d
    if (flags & FLAG_THOUSANDS) {
  100921:	c7 45 98 40 00 00 00 	movl   $0x40,-0x68(%rbp)
        thousands_pos = pos - (base == 10 ? 3 : 4);
  100928:	48 c7 c0 fc ff ff ff 	mov    $0xfffffffffffffffc,%rax
  10092f:	48 8d 7c 05 cf       	lea    -0x31(%rbp,%rax,1),%rdi
  100934:	48 8d 4d ce          	lea    -0x32(%rbp),%rcx
        thousands_pos = nullptr;
  100938:	4c 89 d8             	mov    %r11,%rax
            *--pos = digits[val % base];
  10093b:	49 63 f1             	movslq %r9d,%rsi
    } while (val != 0 && pos != buf);
  10093e:	4c 8d 45 b0          	lea    -0x50(%rbp),%r8
  100942:	eb 57                	jmp    10099b <printer::vprintf(int, char const*, __va_list_tag*)+0x769>
    if (flags & FLAG_THOUSANDS) {
  100944:	41 ba 40 13 10 00    	mov    $0x101340,%r10d
  10094a:	41 b9 0a 00 00 00    	mov    $0xa,%r9d
  100950:	c7 45 9c 0a 00 00 00 	movl   $0xa,-0x64(%rbp)
        thousands_pos = pos - (base == 10 ? 3 : 4);
  100957:	48 c7 c0 fd ff ff ff 	mov    $0xfffffffffffffffd,%rax
  10095e:	eb cf                	jmp    10092f <printer::vprintf(int, char const*, __va_list_tag*)+0x6fd>
  100960:	44 8b 4d 9c          	mov    -0x64(%rbp),%r9d
  100964:	89 45 a4             	mov    %eax,-0x5c(%rbp)
  100967:	41 ba 40 13 10 00    	mov    $0x101340,%r10d
  10096d:	c7 45 98 40 00 00 00 	movl   $0x40,-0x68(%rbp)
        thousands_pos = nullptr;
  100974:	bf 00 00 00 00       	mov    $0x0,%edi
  100979:	eb b9                	jmp    100934 <printer::vprintf(int, char const*, __va_list_tag*)+0x702>
            *--pos = digits[val % base];
  10097b:	48 89 cb             	mov    %rcx,%rbx
  10097e:	ba 00 00 00 00       	mov    $0x0,%edx
  100983:	48 f7 f6             	div    %rsi
  100986:	41 0f b6 14 12       	movzbl (%r10,%rdx,1),%edx
  10098b:	88 11                	mov    %dl,(%rcx)
    } while (val != 0 && pos != buf);
  10098d:	48 83 e9 01          	sub    $0x1,%rcx
  100991:	48 85 c0             	test   %rax,%rax
  100994:	74 2d                	je     1009c3 <printer::vprintf(int, char const*, __va_list_tag*)+0x791>
  100996:	4c 39 c3             	cmp    %r8,%rbx
  100999:	74 28                	je     1009c3 <printer::vprintf(int, char const*, __va_list_tag*)+0x791>
        if (pos == thousands_pos) {
  10099b:	48 8d 51 01          	lea    0x1(%rcx),%rdx
  10099f:	48 39 d7             	cmp    %rdx,%rdi
  1009a2:	75 d7                	jne    10097b <printer::vprintf(int, char const*, __va_list_tag*)+0x749>
            *--pos = base == 10 ? ',' : '\'';
  1009a4:	48 89 cb             	mov    %rcx,%rbx
  1009a7:	41 83 f9 0a          	cmp    $0xa,%r9d
  1009ab:	0f 94 c2             	sete   %dl
  1009ae:	8d 54 92 27          	lea    0x27(%rdx,%rdx,4),%edx
  1009b2:	40 0f 94 c7          	sete   %dil
  1009b6:	40 0f b6 ff          	movzbl %dil,%edi
  1009ba:	88 11                	mov    %dl,(%rcx)
            thousands_pos = pos - (base == 10 ? 3 : 4);
  1009bc:	48 8d 7c 39 fc       	lea    -0x4(%rcx,%rdi,1),%rdi
  1009c1:	eb ca                	jmp    10098d <printer::vprintf(int, char const*, __va_list_tag*)+0x75b>
        if ((flags & FLAG_NUMERIC) && (flags & FLAG_SIGNED)) {
  1009c3:	8b 7d a4             	mov    -0x5c(%rbp),%edi
  1009c6:	89 f8                	mov    %edi,%eax
  1009c8:	f7 d0                	not    %eax
  1009ca:	a8 c0                	test   $0xc0,%al
  1009cc:	75 3c                	jne    100a0a <printer::vprintf(int, char const*, __va_list_tag*)+0x7d8>
                prefix = "-";
  1009ce:	41 bc 4e 0c 10 00    	mov    $0x100c4e,%r12d
            if (flags & FLAG_NEGATIVE) {
  1009d4:	f7 c7 00 01 00 00    	test   $0x100,%edi
  1009da:	0f 85 fe fc ff ff    	jne    1006de <printer::vprintf(int, char const*, __va_list_tag*)+0x4ac>
                prefix = "+";
  1009e0:	41 bc 49 0c 10 00    	mov    $0x100c49,%r12d
            } else if (flags & FLAG_PLUSPOSITIVE) {
  1009e6:	40 f6 c7 10          	test   $0x10,%dil
  1009ea:	0f 85 ee fc ff ff    	jne    1006de <printer::vprintf(int, char const*, __va_list_tag*)+0x4ac>
        const char* prefix = "";
  1009f0:	40 f6 c7 08          	test   $0x8,%dil
  1009f4:	ba 50 0c 10 00       	mov    $0x100c50,%edx
  1009f9:	b8 51 0c 10 00       	mov    $0x100c51,%eax
  1009fe:	48 0f 45 c2          	cmovne %rdx,%rax
  100a02:	49 89 c4             	mov    %rax,%r12
  100a05:	e9 d4 fc ff ff       	jmp    1006de <printer::vprintf(int, char const*, __va_list_tag*)+0x4ac>
  100a0a:	41 bc 51 0c 10 00    	mov    $0x100c51,%r12d
        } else if ((flags & FLAG_NUMERIC) && (flags & FLAG_ALT)
  100a10:	8b 4d a4             	mov    -0x5c(%rbp),%ecx
  100a13:	89 c8                	mov    %ecx,%eax
  100a15:	f7 d0                	not    %eax
  100a17:	a8 41                	test   $0x41,%al
  100a19:	0f 85 bf fc ff ff    	jne    1006de <printer::vprintf(int, char const*, __va_list_tag*)+0x4ac>
                   && (base == 16 || base == -16)
  100a1f:	8b 45 9c             	mov    -0x64(%rbp),%eax
  100a22:	83 c0 10             	add    $0x10,%eax
  100a25:	a9 df ff ff ff       	test   $0xffffffdf,%eax
  100a2a:	0f 85 ae fc ff ff    	jne    1006de <printer::vprintf(int, char const*, __va_list_tag*)+0x4ac>
                   && (num || (flags & FLAG_ALT2))) {
  100a30:	4d 85 db             	test   %r11,%r11
  100a33:	75 09                	jne    100a3e <printer::vprintf(int, char const*, __va_list_tag*)+0x80c>
  100a35:	f6 c5 02             	test   $0x2,%ch
  100a38:	0f 84 a0 fc ff ff    	je     1006de <printer::vprintf(int, char const*, __va_list_tag*)+0x4ac>
            prefix = (base == -16 ? "0x" : "0X");
  100a3e:	83 7d 9c f0          	cmpl   $0xfffffff0,-0x64(%rbp)
  100a42:	ba 4b 0c 10 00       	mov    $0x100c4b,%edx
  100a47:	b8 52 0c 10 00       	mov    $0x100c52,%eax
  100a4c:	48 0f 45 c2          	cmovne %rdx,%rax
  100a50:	49 89 c4             	mov    %rax,%r12
  100a53:	e9 86 fc ff ff       	jmp    1006de <printer::vprintf(int, char const*, __va_list_tag*)+0x4ac>
            datalen = strlen(data);
  100a58:	48 89 df             	mov    %rbx,%rdi
  100a5b:	e8 a3 f6 ff ff       	call   100103 <strlen>
  100a60:	89 45 9c             	mov    %eax,-0x64(%rbp)
            && precision >= 0) {
  100a63:	83 7d 98 00          	cmpl   $0x0,-0x68(%rbp)
  100a67:	0f 84 9e fc ff ff    	je     10070b <printer::vprintf(int, char const*, __va_list_tag*)+0x4d9>
  100a6d:	80 7d 8c 00          	cmpb   $0x0,-0x74(%rbp)
  100a71:	0f 84 94 fc ff ff    	je     10070b <printer::vprintf(int, char const*, __va_list_tag*)+0x4d9>
            zeros = precision > datalen ? precision - datalen : 0;
  100a77:	8b 7d a0             	mov    -0x60(%rbp),%edi
  100a7a:	89 fa                	mov    %edi,%edx
  100a7c:	29 c2                	sub    %eax,%edx
  100a7e:	39 c7                	cmp    %eax,%edi
  100a80:	b8 00 00 00 00       	mov    $0x0,%eax
  100a85:	0f 4f c2             	cmovg  %edx,%eax
  100a88:	89 45 a0             	mov    %eax,-0x60(%rbp)
  100a8b:	e9 91 fc ff ff       	jmp    100721 <printer::vprintf(int, char const*, __va_list_tag*)+0x4ef>
                   && datalen + (int) strlen(prefix) < width) {
  100a90:	4c 89 e7             	mov    %r12,%rdi
  100a93:	e8 6b f6 ff ff       	call   100103 <strlen>
  100a98:	8b 7d 9c             	mov    -0x64(%rbp),%edi
  100a9b:	8d 14 07             	lea    (%rdi,%rax,1),%edx
            zeros = width - datalen - strlen(prefix);
  100a9e:	44 89 f1             	mov    %r14d,%ecx
  100aa1:	29 f9                	sub    %edi,%ecx
  100aa3:	29 c1                	sub    %eax,%ecx
  100aa5:	44 39 f2             	cmp    %r14d,%edx
  100aa8:	b8 00 00 00 00       	mov    $0x0,%eax
  100aad:	0f 4c c1             	cmovl  %ecx,%eax
  100ab0:	89 45 a0             	mov    %eax,-0x60(%rbp)
  100ab3:	e9 69 fc ff ff       	jmp    100721 <printer::vprintf(int, char const*, __va_list_tag*)+0x4ef>
  100ab8:	48 8b 5d a8          	mov    -0x58(%rbp),%rbx
            numbuf[0] = (*format ? *format : '%');
  100abc:	88 45 b0             	mov    %al,-0x50(%rbp)
            numbuf[1] = '\0';
  100abf:	c6 45 b1 00          	movb   $0x0,-0x4f(%rbp)
  100ac3:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            data = numbuf;
  100ac7:	48 8d 5d b0          	lea    -0x50(%rbp),%rbx
        unsigned long num = 0;
  100acb:	41 bb 00 00 00 00    	mov    $0x0,%r11d
  100ad1:	e9 f3 fb ff ff       	jmp    1006c9 <printer::vprintf(int, char const*, __va_list_tag*)+0x497>
    *--pos = '\0';
  100ad6:	c6 45 cf 00          	movb   $0x0,-0x31(%rbp)
    if (flags & FLAG_THOUSANDS) {
  100ada:	f6 45 a4 20          	testb  $0x20,-0x5c(%rbp)
  100ade:	0f 85 60 fe ff ff    	jne    100944 <printer::vprintf(int, char const*, __va_list_tag*)+0x712>
  100ae4:	41 ba 40 13 10 00    	mov    $0x101340,%r10d
  100aea:	41 b9 0a 00 00 00    	mov    $0xa,%r9d
  100af0:	c7 45 9c 0a 00 00 00 	movl   $0xa,-0x64(%rbp)
        thousands_pos = nullptr;
  100af7:	bf 00 00 00 00       	mov    $0x0,%edi
  100afc:	e9 33 fe ff ff       	jmp    100934 <printer::vprintf(int, char const*, __va_list_tag*)+0x702>

0000000000100b01 <vsnprintf>:
};

ssize_t vsnprintf(char* s, size_t size, const char* format, va_list val) {
  100b01:	f3 0f 1e fa          	endbr64
  100b05:	55                   	push   %rbp
  100b06:	48 89 e5             	mov    %rsp,%rbp
  100b09:	53                   	push   %rbx
  100b0a:	48 83 ec 28          	sub    $0x28,%rsp
  100b0e:	48 89 f3             	mov    %rsi,%rbx
        : s_(s), end_(s + size), n_(0) {
  100b11:	48 c7 45 d0 68 13 10 	movq   $0x101368,-0x30(%rbp)
  100b18:	00 
  100b19:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  100b1d:	48 01 f7             	add    %rsi,%rdi
  100b20:	48 89 7d e0          	mov    %rdi,-0x20(%rbp)
  100b24:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
  100b2b:	00 
    string_printer sp(s, size);
    sp.vprintf(0, format, val);
  100b2c:	be 00 00 00 00       	mov    $0x0,%esi
  100b31:	48 8d 7d d0          	lea    -0x30(%rbp),%rdi
  100b35:	e8 f8 f6 ff ff       	call   100232 <printer::vprintf(int, char const*, __va_list_tag*)>
    if (size && sp.s_ < sp.end_) {
  100b3a:	48 85 db             	test   %rbx,%rbx
  100b3d:	74 10                	je     100b4f <vsnprintf+0x4e>
  100b3f:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  100b43:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  100b47:	48 39 c2             	cmp    %rax,%rdx
  100b4a:	73 0d                	jae    100b59 <vsnprintf+0x58>
        *sp.s_ = 0;
  100b4c:	c6 02 00             	movb   $0x0,(%rdx)
    } else if (size) {
        sp.end_[-1] = 0;
    }
    return sp.n_;
}
  100b4f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  100b53:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
  100b57:	c9                   	leave
  100b58:	c3                   	ret
        sp.end_[-1] = 0;
  100b59:	c6 40 ff 00          	movb   $0x0,-0x1(%rax)
  100b5d:	eb f0                	jmp    100b4f <vsnprintf+0x4e>

0000000000100b5f <snprintf>:

ssize_t snprintf(char* s, size_t size, const char* format, ...) {
  100b5f:	f3 0f 1e fa          	endbr64
  100b63:	55                   	push   %rbp
  100b64:	48 89 e5             	mov    %rsp,%rbp
  100b67:	48 83 ec 50          	sub    $0x50,%rsp
  100b6b:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  100b6f:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
  100b73:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
  100b77:	c7 45 b8 18 00 00 00 	movl   $0x18,-0x48(%rbp)
  100b7e:	48 8d 45 10          	lea    0x10(%rbp),%rax
  100b82:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
  100b86:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  100b8a:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    int n = vsnprintf(s, size, format, val);
  100b8e:	48 8d 4d b8          	lea    -0x48(%rbp),%rcx
  100b92:	e8 6a ff ff ff       	call   100b01 <vsnprintf>
    va_end(val);
    return n;
  100b97:	48 98                	cltq
}
  100b99:	c9                   	leave
  100b9a:	c3                   	ret

0000000000100b9b <assert_fail(char const*, int, char const*, char const*)>:
int error_vprintf(int cpos, int color, const char* format, va_list val) {
    return console_vprintf(cpos, color, format, val);
}

void assert_fail(const char* file, int line, const char* msg,
                 const char* description) {
  100b9b:	f3 0f 1e fa          	endbr64
  100b9f:	55                   	push   %rbp
  100ba0:	48 89 e5             	mov    %rsp,%rbp
  100ba3:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
  100baa:	41 89 f0             	mov    %esi,%r8d
    cursorpos = CPOS(23, 0);
  100bad:	c7 05 45 84 fb ff 30 	movl   $0x730,-0x47bbb(%rip)        # b8ffc <cursorpos>
  100bb4:	07 00 00 
    char buf[240];
    if (description) {
  100bb7:	48 85 c9             	test   %rcx,%rcx
  100bba:	74 39                	je     100bf5 <assert_fail(char const*, int, char const*, char const*)+0x5a>
  100bbc:	49 89 c9             	mov    %rcx,%r9
        snprintf(buf, sizeof(buf),
  100bbf:	48 83 ec 08          	sub    $0x8,%rsp
  100bc3:	52                   	push   %rdx
  100bc4:	56                   	push   %rsi
  100bc5:	57                   	push   %rdi
  100bc6:	48 89 f9             	mov    %rdi,%rcx
  100bc9:	ba 70 13 10 00       	mov    $0x101370,%edx
  100bce:	be f0 00 00 00       	mov    $0xf0,%esi
  100bd3:	48 8d bd 10 ff ff ff 	lea    -0xf0(%rbp),%rdi
  100bda:	b0 00                	mov    $0x0,%al
  100bdc:	e8 7e ff ff ff       	call   100b5f <snprintf>
  100be1:	48 83 c4 20          	add    $0x20,%rsp
    register uintptr_t rax asm("rax") = syscallno;
  100be5:	b8 03 00 00 00       	mov    $0x3,%eax
    asm volatile ("syscall"
  100bea:	48 8d bd 10 ff ff ff 	lea    -0xf0(%rbp),%rdi
  100bf1:	0f 05                	syscall
//    Panic.
[[noreturn]] inline void sys_panic(const char* msg) {
    make_syscall(SYSCALL_PANIC, (uintptr_t) msg);

    // should never get here
    while (true) {
  100bf3:	eb fe                	jmp    100bf3 <assert_fail(char const*, int, char const*, char const*)+0x58>
                 "%s:%d: %s\n%s:%d: user assertion '%s' failed\n",
                 file, line, description, file, line, msg);
    } else {
        snprintf(buf, sizeof(buf),
  100bf5:	49 89 d1             	mov    %rdx,%r9
  100bf8:	48 89 f9             	mov    %rdi,%rcx
  100bfb:	ba a0 13 10 00       	mov    $0x1013a0,%edx
  100c00:	be f0 00 00 00       	mov    $0xf0,%esi
  100c05:	48 8d bd 10 ff ff ff 	lea    -0xf0(%rbp),%rdi
  100c0c:	b0 00                	mov    $0x0,%al
  100c0e:	e8 4c ff ff ff       	call   100b5f <snprintf>
  100c13:	eb d0                	jmp    100be5 <assert_fail(char const*, int, char const*, char const*)+0x4a>
