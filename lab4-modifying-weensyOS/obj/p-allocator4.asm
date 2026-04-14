
obj/p-allocator4.full:     file format elf64-x86-64


Disassembly of section .text:

00000000001c0000 <process_main()>:

// These global variables go on the data page.
uint8_t* heap_top;
uint8_t* stack_bottom;

void process_main() {
  1c0000:	f3 0f 1e fa          	endbr64
  1c0004:	55                   	push   %rbp
  1c0005:	48 89 e5             	mov    %rsp,%rbp
  1c0008:	41 54                	push   %r12
  1c000a:	53                   	push   %rbx
// make_syscall
//    These functions define the WeensyOS system call calling convention.
//    We provide versions for system calls with 0-2 arguments.

__always_inline uintptr_t make_syscall(int syscallno) {
    register uintptr_t rax asm("rax") = syscallno;
  1c000b:	b8 01 00 00 00       	mov    $0x1,%eax
    asm volatile ("syscall"
  1c0010:	0f 05                	syscall
            : "+a" (rax)
            : /* all input registers are also output registers */
            : "cc", "memory", "rcx", "rdx", "rsi", "rdi", "r8", "r9",
              "r10", "r11");
    return rax;
  1c0012:	49 89 c4             	mov    %rax,%r12


// sys_getpid
//    Return current process ID. (Never fails.)
inline pid_t sys_getpid() {
    return make_syscall(SYSCALL_GETPID);
  1c0015:	89 c3                	mov    %eax,%ebx
    pid_t p = sys_getpid();
    srand(p);
  1c0017:	89 c7                	mov    %eax,%edi
  1c0019:	e8 a7 01 00 00       	call   1c01c5 <srand(unsigned int)>
//    Return the smallest multiple of `m` greater than or equal to `x`.
//    Equivalently, round `x` up to the nearest multiple of `m`.
template <typename T>
inline constexpr T round_up(T x, unsigned m) {
    static_assert(std::is_unsigned<T>::value, "T must be unsigned");
    return round_down(x + m - 1, m);
  1c001e:	ba 1b 30 1c 00       	mov    $0x1c301b,%edx

    // The heap starts on the page right after the 'end' symbol,
    // whose address is the first address not allocated to process code
    // or data.
    heap_top = (uint8_t*) round_up((uintptr_t) end, PAGESIZE);
  1c0023:	48 81 e2 00 f0 ff ff 	and    $0xfffffffffffff000,%rdx
  1c002a:	48 89 15 d7 1f 00 00 	mov    %rdx,0x1fd7(%rip)        # 1c2008 <heap_top>
    return x;
}

__always_inline uintptr_t rdrsp() {
    uintptr_t x;
    asm volatile("movq %%rsp, %0" : "=r" (x));
  1c0031:	48 89 e0             	mov    %rsp,%rax

    // The bottom of the stack is the first address on the current
    // stack page (this process never needs more than one stack page).
    stack_bottom = (uint8_t*) round_down((uintptr_t) rdrsp() - 1, PAGESIZE);
  1c0034:	48 83 e8 01          	sub    $0x1,%rax
  1c0038:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  1c003e:	48 89 05 bb 1f 00 00 	mov    %rax,0x1fbb(%rip)        # 1c2000 <stack_bottom>

    // Allocate heap pages until (1) hit the stack (out of address space)
    // or (2) allocation fails (out of physical memory).
    while (heap_top != stack_bottom) {
  1c0045:	48 39 c2             	cmp    %rax,%rdx
  1c0048:	75 4f                	jne    1c0099 <process_main()+0x99>
    register uintptr_t rax asm("rax") = syscallno;
  1c004a:	b8 02 00 00 00       	mov    $0x2,%eax
    asm volatile ("syscall"
  1c004f:	0f 05                	syscall
        }
        sys_yield();
    }

    // After running out of memory, do nothing forever
    while (true) {
  1c0051:	eb f7                	jmp    1c004a <process_main()+0x4a>
                assert(*l == 0);
  1c0053:	b9 00 00 00 00       	mov    $0x0,%ecx
  1c0058:	ba 20 0c 1c 00       	mov    $0x1c0c20,%edx
  1c005d:	be 24 00 00 00       	mov    $0x24,%esi
  1c0062:	bf 28 0c 1c 00       	mov    $0x1c0c28,%edi
  1c0067:	e8 2f 0b 00 00       	call   1c0b9b <assert_fail(char const*, int, char const*, char const*)>
            *heap_top = p;
  1c006c:	44 88 21             	mov    %r12b,(%rcx)
            console[CPOS(24, 79)] = p;
  1c006f:	66 44 89 25 27 8f ef 	mov    %r12w,-0x1070d9(%rip)        # b8f9e <console+0xf9e>
  1c0076:	ff 
            heap_top += PAGESIZE;
  1c0077:	48 81 05 86 1f 00 00 	addq   $0x1000,0x1f86(%rip)        # 1c2008 <heap_top>
  1c007e:	00 10 00 00 
    register uintptr_t rax asm("rax") = syscallno;
  1c0082:	b8 02 00 00 00       	mov    $0x2,%eax
    asm volatile ("syscall"
  1c0087:	0f 05                	syscall
    while (heap_top != stack_bottom) {
  1c0089:	48 8b 05 70 1f 00 00 	mov    0x1f70(%rip),%rax        # 1c2000 <stack_bottom>
  1c0090:	48 39 05 71 1f 00 00 	cmp    %rax,0x1f71(%rip)        # 1c2008 <heap_top>
  1c0097:	74 b1                	je     1c004a <process_main()+0x4a>
        if (rand(0, ALLOC_SLOWDOWN - 1) < p) {
  1c0099:	be 09 00 00 00       	mov    $0x9,%esi
  1c009e:	bf 00 00 00 00       	mov    $0x0,%edi
  1c00a3:	e8 3c 01 00 00       	call   1c01e4 <rand(int, int)>
  1c00a8:	39 d8                	cmp    %ebx,%eax
  1c00aa:	7d d6                	jge    1c0082 <process_main()+0x82>
    register uintptr_t rax asm("rax") = syscallno;
  1c00ac:	b8 04 00 00 00       	mov    $0x4,%eax
    asm volatile ("syscall"
  1c00b1:	48 8b 3d 50 1f 00 00 	mov    0x1f50(%rip),%rdi        # 1c2008 <heap_top>
  1c00b8:	0f 05                	syscall
            if (sys_page_alloc(heap_top) < 0) {
  1c00ba:	85 c0                	test   %eax,%eax
  1c00bc:	78 8c                	js     1c004a <process_main()+0x4a>
            for (unsigned long* l = (unsigned long*) heap_top;
  1c00be:	48 8b 0d 43 1f 00 00 	mov    0x1f43(%rip),%rcx        # 1c2008 <heap_top>
                 l != (unsigned long*) (heap_top + PAGESIZE);
  1c00c5:	48 8d 91 00 10 00 00 	lea    0x1000(%rcx),%rdx
            for (unsigned long* l = (unsigned long*) heap_top;
  1c00cc:	48 89 c8             	mov    %rcx,%rax
                assert(*l == 0);
  1c00cf:	48 83 38 00          	cmpq   $0x0,(%rax)
  1c00d3:	0f 85 7a ff ff ff    	jne    1c0053 <process_main()+0x53>
            for (unsigned long* l = (unsigned long*) heap_top;
  1c00d9:	48 83 c0 08          	add    $0x8,%rax
                 l != (unsigned long*) (heap_top + PAGESIZE);
  1c00dd:	48 39 d0             	cmp    %rdx,%rax
  1c00e0:	75 ed                	jne    1c00cf <process_main()+0xcf>
  1c00e2:	eb 88                	jmp    1c006c <process_main()+0x6c>

00000000001c00e4 <string_printer::putc(unsigned char, int)>:
    char* end_;
    size_t n_;
    string_printer(char* s, size_t size)
        : s_(s), end_(s + size), n_(0) {
    }
    void putc(unsigned char c, int) override {
  1c00e4:	f3 0f 1e fa          	endbr64
        if (s_ < end_) {
  1c00e8:	48 8b 47 08          	mov    0x8(%rdi),%rax
  1c00ec:	48 3b 47 10          	cmp    0x10(%rdi),%rax
  1c00f0:	73 0b                	jae    1c00fd <string_printer::putc(unsigned char, int)+0x19>
            *s_++ = c;
  1c00f2:	48 8d 50 01          	lea    0x1(%rax),%rdx
  1c00f6:	48 89 57 08          	mov    %rdx,0x8(%rdi)
  1c00fa:	40 88 30             	mov    %sil,(%rax)
        }
        ++n_;
  1c00fd:	48 83 47 18 01       	addq   $0x1,0x18(%rdi)
    }
  1c0102:	c3                   	ret

00000000001c0103 <strlen>:
size_t strlen(const char* s) {
  1c0103:	f3 0f 1e fa          	endbr64
    for (n = 0; *s != '\0'; ++s) {
  1c0107:	80 3f 00             	cmpb   $0x0,(%rdi)
  1c010a:	74 10                	je     1c011c <strlen+0x19>
  1c010c:	b8 00 00 00 00       	mov    $0x0,%eax
        ++n;
  1c0111:	48 83 c0 01          	add    $0x1,%rax
    for (n = 0; *s != '\0'; ++s) {
  1c0115:	80 3c 07 00          	cmpb   $0x0,(%rdi,%rax,1)
  1c0119:	75 f6                	jne    1c0111 <strlen+0xe>
  1c011b:	c3                   	ret
  1c011c:	b8 00 00 00 00       	mov    $0x0,%eax
}
  1c0121:	c3                   	ret

00000000001c0122 <strnlen>:
size_t strnlen(const char* s, size_t maxlen) {
  1c0122:	f3 0f 1e fa          	endbr64
  1c0126:	48 89 f0             	mov    %rsi,%rax
    for (n = 0; n != maxlen && *s != '\0'; ++s) {
  1c0129:	ba 00 00 00 00       	mov    $0x0,%edx
  1c012e:	48 85 f6             	test   %rsi,%rsi
  1c0131:	74 10                	je     1c0143 <strnlen+0x21>
  1c0133:	80 3c 17 00          	cmpb   $0x0,(%rdi,%rdx,1)
  1c0137:	74 0b                	je     1c0144 <strnlen+0x22>
        ++n;
  1c0139:	48 83 c2 01          	add    $0x1,%rdx
    for (n = 0; n != maxlen && *s != '\0'; ++s) {
  1c013d:	48 39 d0             	cmp    %rdx,%rax
  1c0140:	75 f1                	jne    1c0133 <strnlen+0x11>
  1c0142:	c3                   	ret
  1c0143:	c3                   	ret
  1c0144:	48 89 d0             	mov    %rdx,%rax
}
  1c0147:	c3                   	ret

00000000001c0148 <strchr>:
char* strchr(const char* s, int c) {
  1c0148:	f3 0f 1e fa          	endbr64
    while (*s != '\0' && *s != (char) c) {
  1c014c:	0f b6 07             	movzbl (%rdi),%eax
  1c014f:	84 c0                	test   %al,%al
  1c0151:	74 10                	je     1c0163 <strchr+0x1b>
  1c0153:	40 38 f0             	cmp    %sil,%al
  1c0156:	74 18                	je     1c0170 <strchr+0x28>
        ++s;
  1c0158:	48 83 c7 01          	add    $0x1,%rdi
    while (*s != '\0' && *s != (char) c) {
  1c015c:	0f b6 07             	movzbl (%rdi),%eax
  1c015f:	84 c0                	test   %al,%al
  1c0161:	75 f0                	jne    1c0153 <strchr+0xb>
        return (char*) s;
  1c0163:	40 84 f6             	test   %sil,%sil
  1c0166:	b8 00 00 00 00       	mov    $0x0,%eax
  1c016b:	48 0f 44 c7          	cmove  %rdi,%rax
}
  1c016f:	c3                   	ret
        return (char*) s;
  1c0170:	48 89 f8             	mov    %rdi,%rax
  1c0173:	c3                   	ret

00000000001c0174 <rand()>:
int rand() {
  1c0174:	f3 0f 1e fa          	endbr64
    if (!rand_seed_set) {
  1c0178:	83 3d 99 1e 00 00 00 	cmpl   $0x0,0x1e99(%rip)        # 1c2018 <rand_seed_set>
  1c017f:	74 27                	je     1c01a8 <rand()+0x34>
    rand_seed = rand_seed * 6364136223846793005UL + 1;
  1c0181:	48 b8 2d 7f 95 4c 2d 	movabs $0x5851f42d4c957f2d,%rax
  1c0188:	f4 51 58 
  1c018b:	48 0f af 05 7d 1e 00 	imul   0x1e7d(%rip),%rax        # 1c2010 <rand_seed>
  1c0192:	00 
  1c0193:	48 83 c0 01          	add    $0x1,%rax
  1c0197:	48 89 05 72 1e 00 00 	mov    %rax,0x1e72(%rip)        # 1c2010 <rand_seed>
    return (rand_seed >> 32) & RAND_MAX;
  1c019e:	48 c1 e8 20          	shr    $0x20,%rax
  1c01a2:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
}
  1c01a7:	c3                   	ret
    rand_seed = ((unsigned long) seed << 32) | seed;
  1c01a8:	48 b8 9e 87 d4 30 9e 	movabs $0x30d4879e30d4879e,%rax
  1c01af:	87 d4 30 
  1c01b2:	48 89 05 57 1e 00 00 	mov    %rax,0x1e57(%rip)        # 1c2010 <rand_seed>
    rand_seed_set = 1;
  1c01b9:	c7 05 55 1e 00 00 01 	movl   $0x1,0x1e55(%rip)        # 1c2018 <rand_seed_set>
  1c01c0:	00 00 00 
}
  1c01c3:	eb bc                	jmp    1c0181 <rand()+0xd>

00000000001c01c5 <srand(unsigned int)>:
void srand(unsigned seed) {
  1c01c5:	f3 0f 1e fa          	endbr64
    rand_seed = ((unsigned long) seed << 32) | seed;
  1c01c9:	89 f8                	mov    %edi,%eax
  1c01cb:	48 c1 e7 20          	shl    $0x20,%rdi
  1c01cf:	48 01 c7             	add    %rax,%rdi
  1c01d2:	48 89 3d 37 1e 00 00 	mov    %rdi,0x1e37(%rip)        # 1c2010 <rand_seed>
    rand_seed_set = 1;
  1c01d9:	c7 05 35 1e 00 00 01 	movl   $0x1,0x1e35(%rip)        # 1c2018 <rand_seed_set>
  1c01e0:	00 00 00 
}
  1c01e3:	c3                   	ret

00000000001c01e4 <rand(int, int)>:
int rand(int min, int max) {
  1c01e4:	f3 0f 1e fa          	endbr64
  1c01e8:	55                   	push   %rbp
  1c01e9:	48 89 e5             	mov    %rsp,%rbp
  1c01ec:	41 54                	push   %r12
  1c01ee:	53                   	push   %rbx
    assert(min <= max);
  1c01ef:	39 f7                	cmp    %esi,%edi
  1c01f1:	7f 26                	jg     1c0219 <rand(int, int)+0x35>
  1c01f3:	41 89 fc             	mov    %edi,%r12d
  1c01f6:	89 f3                	mov    %esi,%ebx
    unsigned long r = rand();
  1c01f8:	e8 77 ff ff ff       	call   1c0174 <rand()>
    return min + (r * (max - min + 1)) / ((unsigned long) RAND_MAX + 1);
  1c01fd:	44 29 e3             	sub    %r12d,%ebx
  1c0200:	83 c3 01             	add    $0x1,%ebx
  1c0203:	48 63 db             	movslq %ebx,%rbx
    unsigned long r = rand();
  1c0206:	48 98                	cltq
    return min + (r * (max - min + 1)) / ((unsigned long) RAND_MAX + 1);
  1c0208:	48 0f af d8          	imul   %rax,%rbx
  1c020c:	48 c1 eb 1f          	shr    $0x1f,%rbx
  1c0210:	41 8d 04 1c          	lea    (%r12,%rbx,1),%eax
}
  1c0214:	5b                   	pop    %rbx
  1c0215:	41 5c                	pop    %r12
  1c0217:	5d                   	pop    %rbp
  1c0218:	c3                   	ret
    assert(min <= max);
  1c0219:	b9 00 00 00 00       	mov    $0x0,%ecx
  1c021e:	ba 37 0c 1c 00       	mov    $0x1c0c37,%edx
  1c0223:	be 45 01 00 00       	mov    $0x145,%esi
  1c0228:	bf 42 0c 1c 00       	mov    $0x1c0c42,%edi
  1c022d:	e8 69 09 00 00       	call   1c0b9b <assert_fail(char const*, int, char const*, char const*)>

00000000001c0232 <printer::vprintf(int, char const*, __va_list_tag*)>:
void printer::vprintf(int color, const char* format, va_list val) {
  1c0232:	f3 0f 1e fa          	endbr64
  1c0236:	55                   	push   %rbp
  1c0237:	48 89 e5             	mov    %rsp,%rbp
  1c023a:	41 57                	push   %r15
  1c023c:	41 56                	push   %r14
  1c023e:	41 55                	push   %r13
  1c0240:	41 54                	push   %r12
  1c0242:	53                   	push   %rbx
  1c0243:	48 83 ec 58          	sub    $0x58,%rsp
  1c0247:	49 89 ff             	mov    %rdi,%r15
  1c024a:	41 89 f5             	mov    %esi,%r13d
  1c024d:	49 89 d4             	mov    %rdx,%r12
  1c0250:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
    for (; *format; ++format) {
  1c0254:	0f b6 02             	movzbl (%rdx),%eax
  1c0257:	84 c0                	test   %al,%al
  1c0259:	0f 85 aa 05 00 00    	jne    1c0809 <printer::vprintf(int, char const*, __va_list_tag*)+0x5d7>
}
  1c025f:	48 83 c4 58          	add    $0x58,%rsp
  1c0263:	5b                   	pop    %rbx
  1c0264:	41 5c                	pop    %r12
  1c0266:	41 5d                	pop    %r13
  1c0268:	41 5e                	pop    %r14
  1c026a:	41 5f                	pop    %r15
  1c026c:	5d                   	pop    %rbp
  1c026d:	c3                   	ret
        for (++format; *format; ++format) {
  1c026e:	49 8d 5c 24 01       	lea    0x1(%r12),%rbx
  1c0273:	45 0f b6 64 24 01    	movzbl 0x1(%r12),%r12d
  1c0279:	45 84 e4             	test   %r12b,%r12b
  1c027c:	0f 84 08 01 00 00    	je     1c038a <printer::vprintf(int, char const*, __va_list_tag*)+0x158>
        int flags = 0;
  1c0282:	41 be 00 00 00 00    	mov    $0x0,%r14d
            const char* flagc = strchr(flag_chars, *format);
  1c0288:	41 0f be f4          	movsbl %r12b,%esi
  1c028c:	bf 51 13 1c 00       	mov    $0x1c1351,%edi
  1c0291:	e8 b2 fe ff ff       	call   1c0148 <strchr>
  1c0296:	48 89 c1             	mov    %rax,%rcx
            if (flagc) {
  1c0299:	48 85 c0             	test   %rax,%rax
  1c029c:	74 74                	je     1c0312 <printer::vprintf(int, char const*, __va_list_tag*)+0xe0>
                flags |= 1 << (flagc - flag_chars);
  1c029e:	48 81 e9 51 13 1c 00 	sub    $0x1c1351,%rcx
  1c02a5:	b8 01 00 00 00       	mov    $0x1,%eax
  1c02aa:	d3 e0                	shl    %cl,%eax
  1c02ac:	41 09 c6             	or     %eax,%r14d
        for (++format; *format; ++format) {
  1c02af:	48 83 c3 01          	add    $0x1,%rbx
  1c02b3:	44 0f b6 23          	movzbl (%rbx),%r12d
  1c02b7:	45 84 e4             	test   %r12b,%r12b
  1c02ba:	75 cc                	jne    1c0288 <printer::vprintf(int, char const*, __va_list_tag*)+0x56>
        int width = -1;
  1c02bc:	44 89 75 a4          	mov    %r14d,-0x5c(%rbp)
  1c02c0:	41 be ff ff ff ff    	mov    $0xffffffff,%r14d
        int precision = -1;
  1c02c6:	c7 45 a0 ff ff ff ff 	movl   $0xffffffff,-0x60(%rbp)
        if (*format == '.') {
  1c02cd:	80 3b 2e             	cmpb   $0x2e,(%rbx)
  1c02d0:	0f 84 dc 00 00 00    	je     1c03b2 <printer::vprintf(int, char const*, __va_list_tag*)+0x180>
        switch (*format) {
  1c02d6:	0f b6 03             	movzbl (%rbx),%eax
  1c02d9:	3c 6c                	cmp    $0x6c,%al
  1c02db:	0f 84 77 01 00 00    	je     1c0458 <printer::vprintf(int, char const*, __va_list_tag*)+0x226>
  1c02e1:	0f 8f 52 01 00 00    	jg     1c0439 <printer::vprintf(int, char const*, __va_list_tag*)+0x207>
  1c02e7:	3c 68                	cmp    $0x68,%al
  1c02e9:	0f 85 8c 01 00 00    	jne    1c047b <printer::vprintf(int, char const*, __va_list_tag*)+0x249>
            ++format;
  1c02ef:	48 8d 43 01          	lea    0x1(%rbx),%rax
  1c02f3:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
        switch (*format) {
  1c02f7:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
  1c02fb:	8d 50 bd             	lea    -0x43(%rax),%edx
  1c02fe:	80 fa 35             	cmp    $0x35,%dl
  1c0301:	0f 87 b8 05 00 00    	ja     1c08bf <printer::vprintf(int, char const*, __va_list_tag*)+0x68d>
  1c0307:	0f b6 d2             	movzbl %dl,%edx
  1c030a:	3e ff 24 d5 60 0c 1c 	notrack jmp *0x1c0c60(,%rdx,8)
  1c0311:	00 
        if (*format >= '1' && *format <= '9') {
  1c0312:	44 89 75 a4          	mov    %r14d,-0x5c(%rbp)
  1c0316:	41 8d 44 24 cf       	lea    -0x31(%r12),%eax
  1c031b:	3c 08                	cmp    $0x8,%al
  1c031d:	77 31                	ja     1c0350 <printer::vprintf(int, char const*, __va_list_tag*)+0x11e>
            for (width = 0; *format >= '0' && *format <= '9'; ) {
  1c031f:	0f b6 03             	movzbl (%rbx),%eax
  1c0322:	8d 50 d0             	lea    -0x30(%rax),%edx
  1c0325:	80 fa 09             	cmp    $0x9,%dl
  1c0328:	77 72                	ja     1c039c <printer::vprintf(int, char const*, __va_list_tag*)+0x16a>
  1c032a:	41 be 00 00 00 00    	mov    $0x0,%r14d
                width = 10 * width + *format++ - '0';
  1c0330:	48 83 c3 01          	add    $0x1,%rbx
  1c0334:	43 8d 14 b6          	lea    (%r14,%r14,4),%edx
  1c0338:	0f be c0             	movsbl %al,%eax
  1c033b:	44 8d 74 50 d0       	lea    -0x30(%rax,%rdx,2),%r14d
            for (width = 0; *format >= '0' && *format <= '9'; ) {
  1c0340:	0f b6 03             	movzbl (%rbx),%eax
  1c0343:	8d 50 d0             	lea    -0x30(%rax),%edx
  1c0346:	80 fa 09             	cmp    $0x9,%dl
  1c0349:	76 e5                	jbe    1c0330 <printer::vprintf(int, char const*, __va_list_tag*)+0xfe>
  1c034b:	e9 76 ff ff ff       	jmp    1c02c6 <printer::vprintf(int, char const*, __va_list_tag*)+0x94>
        } else if (*format == '*') {
  1c0350:	41 80 fc 2a          	cmp    $0x2a,%r12b
  1c0354:	75 51                	jne    1c03a7 <printer::vprintf(int, char const*, __va_list_tag*)+0x175>
            width = va_arg(val, int);
  1c0356:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1c035a:	8b 01                	mov    (%rcx),%eax
  1c035c:	83 f8 2f             	cmp    $0x2f,%eax
  1c035f:	77 17                	ja     1c0378 <printer::vprintf(int, char const*, __va_list_tag*)+0x146>
  1c0361:	89 c2                	mov    %eax,%edx
  1c0363:	48 03 51 10          	add    0x10(%rcx),%rdx
  1c0367:	83 c0 08             	add    $0x8,%eax
  1c036a:	89 01                	mov    %eax,(%rcx)
  1c036c:	44 8b 32             	mov    (%rdx),%r14d
            ++format;
  1c036f:	48 83 c3 01          	add    $0x1,%rbx
  1c0373:	e9 4e ff ff ff       	jmp    1c02c6 <printer::vprintf(int, char const*, __va_list_tag*)+0x94>
            width = va_arg(val, int);
  1c0378:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  1c037c:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  1c0380:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1c0384:	48 89 47 08          	mov    %rax,0x8(%rdi)
  1c0388:	eb e2                	jmp    1c036c <printer::vprintf(int, char const*, __va_list_tag*)+0x13a>
        int flags = 0;
  1c038a:	c7 45 a4 00 00 00 00 	movl   $0x0,-0x5c(%rbp)
        int width = -1;
  1c0391:	41 be ff ff ff ff    	mov    $0xffffffff,%r14d
  1c0397:	e9 2a ff ff ff       	jmp    1c02c6 <printer::vprintf(int, char const*, __va_list_tag*)+0x94>
            for (width = 0; *format >= '0' && *format <= '9'; ) {
  1c039c:	41 be 00 00 00 00    	mov    $0x0,%r14d
  1c03a2:	e9 1f ff ff ff       	jmp    1c02c6 <printer::vprintf(int, char const*, __va_list_tag*)+0x94>
        int width = -1;
  1c03a7:	41 be ff ff ff ff    	mov    $0xffffffff,%r14d
  1c03ad:	e9 14 ff ff ff       	jmp    1c02c6 <printer::vprintf(int, char const*, __va_list_tag*)+0x94>
            ++format;
  1c03b2:	48 8d 53 01          	lea    0x1(%rbx),%rdx
            if (*format >= '0' && *format <= '9') {
  1c03b6:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
  1c03ba:	8d 48 d0             	lea    -0x30(%rax),%ecx
  1c03bd:	80 f9 09             	cmp    $0x9,%cl
  1c03c0:	76 13                	jbe    1c03d5 <printer::vprintf(int, char const*, __va_list_tag*)+0x1a3>
            } else if (*format == '*') {
  1c03c2:	3c 2a                	cmp    $0x2a,%al
  1c03c4:	74 33                	je     1c03f9 <printer::vprintf(int, char const*, __va_list_tag*)+0x1c7>
            ++format;
  1c03c6:	48 89 d3             	mov    %rdx,%rbx
                precision = 0;
  1c03c9:	c7 45 a0 00 00 00 00 	movl   $0x0,-0x60(%rbp)
  1c03d0:	e9 01 ff ff ff       	jmp    1c02d6 <printer::vprintf(int, char const*, __va_list_tag*)+0xa4>
                for (precision = 0; *format >= '0' && *format <= '9'; ) {
  1c03d5:	b9 00 00 00 00       	mov    $0x0,%ecx
                    precision = 10 * precision + *format++ - '0';
  1c03da:	48 83 c2 01          	add    $0x1,%rdx
  1c03de:	8d 0c 89             	lea    (%rcx,%rcx,4),%ecx
  1c03e1:	0f be c0             	movsbl %al,%eax
  1c03e4:	8d 4c 48 d0          	lea    -0x30(%rax,%rcx,2),%ecx
                for (precision = 0; *format >= '0' && *format <= '9'; ) {
  1c03e8:	0f b6 02             	movzbl (%rdx),%eax
  1c03eb:	8d 70 d0             	lea    -0x30(%rax),%esi
  1c03ee:	40 80 fe 09          	cmp    $0x9,%sil
  1c03f2:	76 e6                	jbe    1c03da <printer::vprintf(int, char const*, __va_list_tag*)+0x1a8>
  1c03f4:	48 89 d3             	mov    %rdx,%rbx
  1c03f7:	eb 1c                	jmp    1c0415 <printer::vprintf(int, char const*, __va_list_tag*)+0x1e3>
                precision = va_arg(val, int);
  1c03f9:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1c03fd:	8b 01                	mov    (%rcx),%eax
  1c03ff:	83 f8 2f             	cmp    $0x2f,%eax
  1c0402:	77 23                	ja     1c0427 <printer::vprintf(int, char const*, __va_list_tag*)+0x1f5>
  1c0404:	89 c2                	mov    %eax,%edx
  1c0406:	48 03 51 10          	add    0x10(%rcx),%rdx
  1c040a:	83 c0 08             	add    $0x8,%eax
  1c040d:	89 01                	mov    %eax,(%rcx)
  1c040f:	8b 0a                	mov    (%rdx),%ecx
                ++format;
  1c0411:	48 83 c3 02          	add    $0x2,%rbx
            if (precision < 0) {
  1c0415:	85 c9                	test   %ecx,%ecx
  1c0417:	b8 00 00 00 00       	mov    $0x0,%eax
  1c041c:	0f 49 c1             	cmovns %ecx,%eax
  1c041f:	89 45 a0             	mov    %eax,-0x60(%rbp)
  1c0422:	e9 af fe ff ff       	jmp    1c02d6 <printer::vprintf(int, char const*, __va_list_tag*)+0xa4>
                precision = va_arg(val, int);
  1c0427:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1c042b:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  1c042f:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1c0433:	48 89 41 08          	mov    %rax,0x8(%rcx)
  1c0437:	eb d6                	jmp    1c040f <printer::vprintf(int, char const*, __va_list_tag*)+0x1dd>
        switch (*format) {
  1c0439:	3c 74                	cmp    $0x74,%al
  1c043b:	74 1b                	je     1c0458 <printer::vprintf(int, char const*, __va_list_tag*)+0x226>
  1c043d:	3c 7a                	cmp    $0x7a,%al
  1c043f:	74 17                	je     1c0458 <printer::vprintf(int, char const*, __va_list_tag*)+0x226>
        switch (*format) {
  1c0441:	8d 50 bd             	lea    -0x43(%rax),%edx
  1c0444:	80 fa 35             	cmp    $0x35,%dl
  1c0447:	0f 87 6f 06 00 00    	ja     1c0abc <printer::vprintf(int, char const*, __va_list_tag*)+0x88a>
  1c044d:	0f b6 d2             	movzbl %dl,%edx
  1c0450:	3e ff 24 d5 10 0e 1c 	notrack jmp *0x1c0e10(,%rdx,8)
  1c0457:	00 
            ++format;
  1c0458:	48 8d 43 01          	lea    0x1(%rbx),%rax
  1c045c:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
        switch (*format) {
  1c0460:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
  1c0464:	8d 50 bd             	lea    -0x43(%rax),%edx
  1c0467:	80 fa 35             	cmp    $0x35,%dl
  1c046a:	0f 87 4f 04 00 00    	ja     1c08bf <printer::vprintf(int, char const*, __va_list_tag*)+0x68d>
  1c0470:	0f b6 d2             	movzbl %dl,%edx
  1c0473:	3e ff 24 d5 c0 0f 1c 	notrack jmp *0x1c0fc0(,%rdx,8)
  1c047a:	00 
  1c047b:	8d 50 bd             	lea    -0x43(%rax),%edx
  1c047e:	80 fa 35             	cmp    $0x35,%dl
  1c0481:	0f 87 34 04 00 00    	ja     1c08bb <printer::vprintf(int, char const*, __va_list_tag*)+0x689>
  1c0487:	0f b6 d2             	movzbl %dl,%edx
  1c048a:	3e ff 24 d5 70 11 1c 	notrack jmp *0x1c1170(,%rdx,8)
  1c0491:	00 
            long x = length ? va_arg(val, long) : va_arg(val, int);
  1c0492:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  1c0496:	8b 07                	mov    (%rdi),%eax
  1c0498:	83 f8 2f             	cmp    $0x2f,%eax
  1c049b:	77 38                	ja     1c04d5 <printer::vprintf(int, char const*, __va_list_tag*)+0x2a3>
  1c049d:	89 c2                	mov    %eax,%edx
  1c049f:	48 03 57 10          	add    0x10(%rdi),%rdx
  1c04a3:	83 c0 08             	add    $0x8,%eax
  1c04a6:	89 07                	mov    %eax,(%rdi)
  1c04a8:	48 8b 12             	mov    (%rdx),%rdx
            int negative = x < 0 ? FLAG_NEGATIVE : 0;
  1c04ab:	48 89 d0             	mov    %rdx,%rax
  1c04ae:	48 c1 f8 37          	sar    $0x37,%rax
            num = negative ? -x : x;
  1c04b2:	49 89 d3             	mov    %rdx,%r11
  1c04b5:	49 f7 db             	neg    %r11
  1c04b8:	25 00 01 00 00       	and    $0x100,%eax
  1c04bd:	4c 0f 44 da          	cmove  %rdx,%r11
            flags |= FLAG_NUMERIC | FLAG_SIGNED | negative;
  1c04c1:	8b 7d a4             	mov    -0x5c(%rbp),%edi
  1c04c4:	09 f8                	or     %edi,%eax
  1c04c6:	0c c0                	or     $0xc0,%al
  1c04c8:	89 45 a4             	mov    %eax,-0x5c(%rbp)
        const char* data = "";
  1c04cb:	bb 51 0c 1c 00       	mov    $0x1c0c51,%ebx
            break;
  1c04d0:	e9 f4 01 00 00       	jmp    1c06c9 <printer::vprintf(int, char const*, __va_list_tag*)+0x497>
            long x = length ? va_arg(val, long) : va_arg(val, int);
  1c04d5:	48 8b 5d 90          	mov    -0x70(%rbp),%rbx
  1c04d9:	48 8b 53 08          	mov    0x8(%rbx),%rdx
  1c04dd:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1c04e1:	48 89 43 08          	mov    %rax,0x8(%rbx)
  1c04e5:	eb c1                	jmp    1c04a8 <printer::vprintf(int, char const*, __va_list_tag*)+0x276>
        switch (*format) {
  1c04e7:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  1c04eb:	eb 04                	jmp    1c04f1 <printer::vprintf(int, char const*, __va_list_tag*)+0x2bf>
  1c04ed:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            long x = length ? va_arg(val, long) : va_arg(val, int);
  1c04f1:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1c04f5:	8b 01                	mov    (%rcx),%eax
  1c04f7:	83 f8 2f             	cmp    $0x2f,%eax
  1c04fa:	77 10                	ja     1c050c <printer::vprintf(int, char const*, __va_list_tag*)+0x2da>
  1c04fc:	89 c2                	mov    %eax,%edx
  1c04fe:	48 03 51 10          	add    0x10(%rcx),%rdx
  1c0502:	83 c0 08             	add    $0x8,%eax
  1c0505:	89 01                	mov    %eax,(%rcx)
  1c0507:	48 63 12             	movslq (%rdx),%rdx
  1c050a:	eb 9f                	jmp    1c04ab <printer::vprintf(int, char const*, __va_list_tag*)+0x279>
  1c050c:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  1c0510:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  1c0514:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1c0518:	48 89 47 08          	mov    %rax,0x8(%rdi)
  1c051c:	eb e9                	jmp    1c0507 <printer::vprintf(int, char const*, __va_list_tag*)+0x2d5>
        switch (*format) {
  1c051e:	b8 01 00 00 00       	mov    $0x1,%eax
  1c0523:	c7 45 9c 0a 00 00 00 	movl   $0xa,-0x64(%rbp)
  1c052a:	e9 9d 00 00 00       	jmp    1c05cc <printer::vprintf(int, char const*, __va_list_tag*)+0x39a>
  1c052f:	b8 00 00 00 00       	mov    $0x0,%eax
  1c0534:	c7 45 9c 0a 00 00 00 	movl   $0xa,-0x64(%rbp)
  1c053b:	e9 8c 00 00 00       	jmp    1c05cc <printer::vprintf(int, char const*, __va_list_tag*)+0x39a>
  1c0540:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  1c0544:	b8 00 00 00 00       	mov    $0x0,%eax
  1c0549:	c7 45 9c 0a 00 00 00 	movl   $0xa,-0x64(%rbp)
  1c0550:	eb 7a                	jmp    1c05cc <printer::vprintf(int, char const*, __va_list_tag*)+0x39a>
  1c0552:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  1c0556:	b8 00 00 00 00       	mov    $0x0,%eax
  1c055b:	c7 45 9c 0a 00 00 00 	movl   $0xa,-0x64(%rbp)
  1c0562:	eb 68                	jmp    1c05cc <printer::vprintf(int, char const*, __va_list_tag*)+0x39a>
            num = length ? va_arg(val, unsigned long) : va_arg(val, unsigned);
  1c0564:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  1c0568:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  1c056c:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1c0570:	48 89 47 08          	mov    %rax,0x8(%rdi)
  1c0574:	eb 70                	jmp    1c05e6 <printer::vprintf(int, char const*, __va_list_tag*)+0x3b4>
  1c0576:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1c057a:	8b 01                	mov    (%rcx),%eax
  1c057c:	83 f8 2f             	cmp    $0x2f,%eax
  1c057f:	77 10                	ja     1c0591 <printer::vprintf(int, char const*, __va_list_tag*)+0x35f>
  1c0581:	89 c2                	mov    %eax,%edx
  1c0583:	48 03 51 10          	add    0x10(%rcx),%rdx
  1c0587:	83 c0 08             	add    $0x8,%eax
  1c058a:	89 01                	mov    %eax,(%rcx)
  1c058c:	44 8b 1a             	mov    (%rdx),%r11d
  1c058f:	eb 58                	jmp    1c05e9 <printer::vprintf(int, char const*, __va_list_tag*)+0x3b7>
  1c0591:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1c0595:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  1c0599:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1c059d:	48 89 41 08          	mov    %rax,0x8(%rcx)
  1c05a1:	eb e9                	jmp    1c058c <printer::vprintf(int, char const*, __va_list_tag*)+0x35a>
        switch (*format) {
  1c05a3:	b8 01 00 00 00       	mov    $0x1,%eax
  1c05a8:	eb 1b                	jmp    1c05c5 <printer::vprintf(int, char const*, __va_list_tag*)+0x393>
  1c05aa:	b8 00 00 00 00       	mov    $0x0,%eax
  1c05af:	eb 14                	jmp    1c05c5 <printer::vprintf(int, char const*, __va_list_tag*)+0x393>
  1c05b1:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  1c05b5:	b8 00 00 00 00       	mov    $0x0,%eax
  1c05ba:	eb 09                	jmp    1c05c5 <printer::vprintf(int, char const*, __va_list_tag*)+0x393>
  1c05bc:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  1c05c0:	b8 00 00 00 00       	mov    $0x0,%eax
            base = -16;
  1c05c5:	c7 45 9c f0 ff ff ff 	movl   $0xfffffff0,-0x64(%rbp)
            num = length ? va_arg(val, unsigned long) : va_arg(val, unsigned);
  1c05cc:	85 c0                	test   %eax,%eax
  1c05ce:	74 a6                	je     1c0576 <printer::vprintf(int, char const*, __va_list_tag*)+0x344>
  1c05d0:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  1c05d4:	8b 07                	mov    (%rdi),%eax
  1c05d6:	83 f8 2f             	cmp    $0x2f,%eax
  1c05d9:	77 89                	ja     1c0564 <printer::vprintf(int, char const*, __va_list_tag*)+0x332>
  1c05db:	89 c2                	mov    %eax,%edx
  1c05dd:	48 03 57 10          	add    0x10(%rdi),%rdx
  1c05e1:	83 c0 08             	add    $0x8,%eax
  1c05e4:	89 07                	mov    %eax,(%rdi)
  1c05e6:	4c 8b 1a             	mov    (%rdx),%r11
            flags |= FLAG_NUMERIC;
  1c05e9:	8b 45 a4             	mov    -0x5c(%rbp),%eax
  1c05ec:	83 c8 40             	or     $0x40,%eax
    if (base < 0) {
  1c05ef:	83 7d 9c 00          	cmpl   $0x0,-0x64(%rbp)
  1c05f3:	0f 89 ea 02 00 00    	jns    1c08e3 <printer::vprintf(int, char const*, __va_list_tag*)+0x6b1>
    *--pos = '\0';
  1c05f9:	c6 45 cf 00          	movb   $0x0,-0x31(%rbp)
    if (flags & FLAG_THOUSANDS) {
  1c05fd:	a8 20                	test   $0x20,%al
  1c05ff:	0f 85 0d 03 00 00    	jne    1c0912 <printer::vprintf(int, char const*, __va_list_tag*)+0x6e0>
  1c0605:	89 45 a4             	mov    %eax,-0x5c(%rbp)
        digits = lower_digits;
  1c0608:	41 ba 20 13 1c 00    	mov    $0x1c1320,%r10d
        base = -base;
  1c060e:	41 b9 10 00 00 00    	mov    $0x10,%r9d
    if (flags & FLAG_THOUSANDS) {
  1c0614:	c7 45 98 40 00 00 00 	movl   $0x40,-0x68(%rbp)
        thousands_pos = nullptr;
  1c061b:	bf 00 00 00 00       	mov    $0x0,%edi
  1c0620:	e9 0f 03 00 00       	jmp    1c0934 <printer::vprintf(int, char const*, __va_list_tag*)+0x702>
        switch (*format) {
  1c0625:	b8 01 00 00 00       	mov    $0x1,%eax
  1c062a:	eb 1b                	jmp    1c0647 <printer::vprintf(int, char const*, __va_list_tag*)+0x415>
  1c062c:	b8 00 00 00 00       	mov    $0x0,%eax
  1c0631:	eb 14                	jmp    1c0647 <printer::vprintf(int, char const*, __va_list_tag*)+0x415>
  1c0633:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  1c0637:	b8 00 00 00 00       	mov    $0x0,%eax
  1c063c:	eb 09                	jmp    1c0647 <printer::vprintf(int, char const*, __va_list_tag*)+0x415>
  1c063e:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  1c0642:	b8 00 00 00 00       	mov    $0x0,%eax
            base = 16;
  1c0647:	c7 45 9c 10 00 00 00 	movl   $0x10,-0x64(%rbp)
            goto format_unsigned;
  1c064e:	e9 79 ff ff ff       	jmp    1c05cc <printer::vprintf(int, char const*, __va_list_tag*)+0x39a>
        switch (*format) {
  1c0653:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  1c0657:	eb 04                	jmp    1c065d <printer::vprintf(int, char const*, __va_list_tag*)+0x42b>
  1c0659:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            num = (uintptr_t) va_arg(val, void*);
  1c065d:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1c0661:	8b 01                	mov    (%rcx),%eax
  1c0663:	83 f8 2f             	cmp    $0x2f,%eax
  1c0666:	77 22                	ja     1c068a <printer::vprintf(int, char const*, __va_list_tag*)+0x458>
  1c0668:	89 c2                	mov    %eax,%edx
  1c066a:	48 03 51 10          	add    0x10(%rcx),%rdx
  1c066e:	83 c0 08             	add    $0x8,%eax
  1c0671:	89 01                	mov    %eax,(%rcx)
  1c0673:	4c 8b 1a             	mov    (%rdx),%r11
            flags |= FLAG_ALT | FLAG_ALT2 | FLAG_NUMERIC;
  1c0676:	8b 45 a4             	mov    -0x5c(%rbp),%eax
  1c0679:	0d 41 02 00 00       	or     $0x241,%eax
            base = -16;
  1c067e:	c7 45 9c f0 ff ff ff 	movl   $0xfffffff0,-0x64(%rbp)
  1c0685:	e9 6f ff ff ff       	jmp    1c05f9 <printer::vprintf(int, char const*, __va_list_tag*)+0x3c7>
            num = (uintptr_t) va_arg(val, void*);
  1c068a:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  1c068e:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  1c0692:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1c0696:	48 89 47 08          	mov    %rax,0x8(%rdi)
  1c069a:	eb d7                	jmp    1c0673 <printer::vprintf(int, char const*, __va_list_tag*)+0x441>
        switch (*format) {
  1c069c:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  1c06a0:	eb 04                	jmp    1c06a6 <printer::vprintf(int, char const*, __va_list_tag*)+0x474>
  1c06a2:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            data = va_arg(val, char*);
  1c06a6:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  1c06aa:	8b 07                	mov    (%rdi),%eax
  1c06ac:	83 f8 2f             	cmp    $0x2f,%eax
  1c06af:	0f 87 70 01 00 00    	ja     1c0825 <printer::vprintf(int, char const*, __va_list_tag*)+0x5f3>
  1c06b5:	89 c2                	mov    %eax,%edx
  1c06b7:	48 03 57 10          	add    0x10(%rdi),%rdx
  1c06bb:	83 c0 08             	add    $0x8,%eax
  1c06be:	89 07                	mov    %eax,(%rdi)
  1c06c0:	48 8b 1a             	mov    (%rdx),%rbx
        unsigned long num = 0;
  1c06c3:	41 bb 00 00 00 00    	mov    $0x0,%r11d
        if (flags & FLAG_NUMERIC) {
  1c06c9:	8b 45 a4             	mov    -0x5c(%rbp),%eax
  1c06cc:	83 e0 40             	and    $0x40,%eax
  1c06cf:	89 45 98             	mov    %eax,-0x68(%rbp)
        const char* prefix = "";
  1c06d2:	41 bc 51 0c 1c 00    	mov    $0x1c0c51,%r12d
        if (flags & FLAG_NUMERIC) {
  1c06d8:	0f 85 f8 03 00 00    	jne    1c0ad6 <printer::vprintf(int, char const*, __va_list_tag*)+0x8a4>
        if (precision >= 0 && !(flags & FLAG_NUMERIC)) {
  1c06de:	8b 7d a0             	mov    -0x60(%rbp),%edi
  1c06e1:	89 f8                	mov    %edi,%eax
  1c06e3:	f7 d0                	not    %eax
  1c06e5:	c1 e8 1f             	shr    $0x1f,%eax
  1c06e8:	89 45 8c             	mov    %eax,-0x74(%rbp)
  1c06eb:	83 7d 98 00          	cmpl   $0x0,-0x68(%rbp)
  1c06ef:	0f 85 63 03 00 00    	jne    1c0a58 <printer::vprintf(int, char const*, __va_list_tag*)+0x826>
  1c06f5:	84 c0                	test   %al,%al
  1c06f7:	0f 84 5b 03 00 00    	je     1c0a58 <printer::vprintf(int, char const*, __va_list_tag*)+0x826>
            datalen = strnlen(data, precision);
  1c06fd:	48 63 f7             	movslq %edi,%rsi
  1c0700:	48 89 df             	mov    %rbx,%rdi
  1c0703:	e8 1a fa ff ff       	call   1c0122 <strnlen>
  1c0708:	89 45 9c             	mov    %eax,-0x64(%rbp)
                   && datalen + (int) strlen(prefix) < width) {
  1c070b:	8b 45 a4             	mov    -0x5c(%rbp),%eax
  1c070e:	83 e0 46             	and    $0x46,%eax
            zeros = 0;
  1c0711:	c7 45 a0 00 00 00 00 	movl   $0x0,-0x60(%rbp)
                   && datalen + (int) strlen(prefix) < width) {
  1c0718:	83 f8 42             	cmp    $0x42,%eax
  1c071b:	0f 84 6f 03 00 00    	je     1c0a90 <printer::vprintf(int, char const*, __va_list_tag*)+0x85e>
        width -= datalen + zeros + strlen(prefix);
  1c0721:	4c 89 e7             	mov    %r12,%rdi
  1c0724:	e8 da f9 ff ff       	call   1c0103 <strlen>
  1c0729:	8b 7d a0             	mov    -0x60(%rbp),%edi
  1c072c:	8b 4d 9c             	mov    -0x64(%rbp),%ecx
  1c072f:	01 f9                	add    %edi,%ecx
  1c0731:	44 89 f2             	mov    %r14d,%edx
  1c0734:	29 ca                	sub    %ecx,%edx
  1c0736:	29 c2                	sub    %eax,%edx
  1c0738:	41 89 d6             	mov    %edx,%r14d
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
  1c073b:	f6 45 a4 04          	testb  $0x4,-0x5c(%rbp)
  1c073f:	75 32                	jne    1c0773 <printer::vprintf(int, char const*, __va_list_tag*)+0x541>
  1c0741:	85 d2                	test   %edx,%edx
  1c0743:	7e 2e                	jle    1c0773 <printer::vprintf(int, char const*, __va_list_tag*)+0x541>
        width -= datalen + zeros + strlen(prefix);
  1c0745:	89 55 a4             	mov    %edx,-0x5c(%rbp)
            putc(' ', color);
  1c0748:	49 8b 07             	mov    (%r15),%rax
  1c074b:	44 89 ea             	mov    %r13d,%edx
  1c074e:	be 20 00 00 00       	mov    $0x20,%esi
  1c0753:	4c 89 ff             	mov    %r15,%rdi
  1c0756:	ff 10                	call   *(%rax)
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
  1c0758:	41 83 ee 01          	sub    $0x1,%r14d
  1c075c:	45 85 f6             	test   %r14d,%r14d
  1c075f:	7f e7                	jg     1c0748 <printer::vprintf(int, char const*, __va_list_tag*)+0x516>
  1c0761:	8b 55 a4             	mov    -0x5c(%rbp),%edx
  1c0764:	85 d2                	test   %edx,%edx
  1c0766:	b8 01 00 00 00       	mov    $0x1,%eax
  1c076b:	0f 4f c2             	cmovg  %edx,%eax
  1c076e:	29 c2                	sub    %eax,%edx
  1c0770:	41 89 d6             	mov    %edx,%r14d
        for (; *prefix; ++prefix) {
  1c0773:	41 0f b6 04 24       	movzbl (%r12),%eax
  1c0778:	84 c0                	test   %al,%al
  1c077a:	74 1b                	je     1c0797 <printer::vprintf(int, char const*, __va_list_tag*)+0x565>
            putc(*prefix, color);
  1c077c:	0f b6 f0             	movzbl %al,%esi
  1c077f:	49 8b 07             	mov    (%r15),%rax
  1c0782:	44 89 ea             	mov    %r13d,%edx
  1c0785:	4c 89 ff             	mov    %r15,%rdi
  1c0788:	ff 10                	call   *(%rax)
        for (; *prefix; ++prefix) {
  1c078a:	49 83 c4 01          	add    $0x1,%r12
  1c078e:	41 0f b6 04 24       	movzbl (%r12),%eax
  1c0793:	84 c0                	test   %al,%al
  1c0795:	75 e5                	jne    1c077c <printer::vprintf(int, char const*, __va_list_tag*)+0x54a>
        for (; zeros > 0; --zeros) {
  1c0797:	44 8b 65 a0          	mov    -0x60(%rbp),%r12d
  1c079b:	45 85 e4             	test   %r12d,%r12d
  1c079e:	7e 16                	jle    1c07b6 <printer::vprintf(int, char const*, __va_list_tag*)+0x584>
            putc('0', color);
  1c07a0:	49 8b 07             	mov    (%r15),%rax
  1c07a3:	44 89 ea             	mov    %r13d,%edx
  1c07a6:	be 30 00 00 00       	mov    $0x30,%esi
  1c07ab:	4c 89 ff             	mov    %r15,%rdi
  1c07ae:	ff 10                	call   *(%rax)
        for (; zeros > 0; --zeros) {
  1c07b0:	41 83 ec 01          	sub    $0x1,%r12d
  1c07b4:	75 ea                	jne    1c07a0 <printer::vprintf(int, char const*, __va_list_tag*)+0x56e>
        for (; datalen > 0; ++data, --datalen) {
  1c07b6:	8b 45 9c             	mov    -0x64(%rbp),%eax
  1c07b9:	85 c0                	test   %eax,%eax
  1c07bb:	7e 1d                	jle    1c07da <printer::vprintf(int, char const*, __va_list_tag*)+0x5a8>
  1c07bd:	41 89 c4             	mov    %eax,%r12d
  1c07c0:	49 01 dc             	add    %rbx,%r12
            putc(*data, color);
  1c07c3:	0f b6 33             	movzbl (%rbx),%esi
  1c07c6:	49 8b 07             	mov    (%r15),%rax
  1c07c9:	44 89 ea             	mov    %r13d,%edx
  1c07cc:	4c 89 ff             	mov    %r15,%rdi
  1c07cf:	ff 10                	call   *(%rax)
        for (; datalen > 0; ++data, --datalen) {
  1c07d1:	48 83 c3 01          	add    $0x1,%rbx
  1c07d5:	49 39 dc             	cmp    %rbx,%r12
  1c07d8:	75 e9                	jne    1c07c3 <printer::vprintf(int, char const*, __va_list_tag*)+0x591>
        for (; width > 0; --width) {
  1c07da:	45 85 f6             	test   %r14d,%r14d
  1c07dd:	7e 16                	jle    1c07f5 <printer::vprintf(int, char const*, __va_list_tag*)+0x5c3>
            putc(' ', color);
  1c07df:	49 8b 07             	mov    (%r15),%rax
  1c07e2:	44 89 ea             	mov    %r13d,%edx
  1c07e5:	be 20 00 00 00       	mov    $0x20,%esi
  1c07ea:	4c 89 ff             	mov    %r15,%rdi
  1c07ed:	ff 10                	call   *(%rax)
        for (; width > 0; --width) {
  1c07ef:	41 83 ee 01          	sub    $0x1,%r14d
  1c07f3:	75 ea                	jne    1c07df <printer::vprintf(int, char const*, __va_list_tag*)+0x5ad>
    for (; *format; ++format) {
  1c07f5:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  1c07f9:	4c 8d 60 01          	lea    0x1(%rax),%r12
  1c07fd:	0f b6 40 01          	movzbl 0x1(%rax),%eax
  1c0801:	84 c0                	test   %al,%al
  1c0803:	0f 84 56 fa ff ff    	je     1c025f <printer::vprintf(int, char const*, __va_list_tag*)+0x2d>
        if (*format != '%') {
  1c0809:	3c 25                	cmp    $0x25,%al
  1c080b:	0f 84 5d fa ff ff    	je     1c026e <printer::vprintf(int, char const*, __va_list_tag*)+0x3c>
            putc(*format, color);
  1c0811:	0f b6 f0             	movzbl %al,%esi
  1c0814:	49 8b 07             	mov    (%r15),%rax
  1c0817:	44 89 ea             	mov    %r13d,%edx
  1c081a:	4c 89 ff             	mov    %r15,%rdi
  1c081d:	ff 10                	call   *(%rax)
            continue;
  1c081f:	4c 89 65 a8          	mov    %r12,-0x58(%rbp)
  1c0823:	eb d0                	jmp    1c07f5 <printer::vprintf(int, char const*, __va_list_tag*)+0x5c3>
            data = va_arg(val, char*);
  1c0825:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1c0829:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  1c082d:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1c0831:	48 89 41 08          	mov    %rax,0x8(%rcx)
  1c0835:	e9 86 fe ff ff       	jmp    1c06c0 <printer::vprintf(int, char const*, __va_list_tag*)+0x48e>
        switch (*format) {
  1c083a:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  1c083e:	eb 04                	jmp    1c0844 <printer::vprintf(int, char const*, __va_list_tag*)+0x612>
  1c0840:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            color = va_arg(val, int);
  1c0844:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1c0848:	8b 01                	mov    (%rcx),%eax
  1c084a:	83 f8 2f             	cmp    $0x2f,%eax
  1c084d:	77 10                	ja     1c085f <printer::vprintf(int, char const*, __va_list_tag*)+0x62d>
  1c084f:	89 c2                	mov    %eax,%edx
  1c0851:	48 03 51 10          	add    0x10(%rcx),%rdx
  1c0855:	83 c0 08             	add    $0x8,%eax
  1c0858:	89 01                	mov    %eax,(%rcx)
  1c085a:	44 8b 2a             	mov    (%rdx),%r13d
            continue;
  1c085d:	eb 96                	jmp    1c07f5 <printer::vprintf(int, char const*, __va_list_tag*)+0x5c3>
            color = va_arg(val, int);
  1c085f:	48 8b 5d 90          	mov    -0x70(%rbp),%rbx
  1c0863:	48 8b 53 08          	mov    0x8(%rbx),%rdx
  1c0867:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1c086b:	48 89 43 08          	mov    %rax,0x8(%rbx)
  1c086f:	eb e9                	jmp    1c085a <printer::vprintf(int, char const*, __va_list_tag*)+0x628>
        switch (*format) {
  1c0871:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  1c0875:	eb 04                	jmp    1c087b <printer::vprintf(int, char const*, __va_list_tag*)+0x649>
  1c0877:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            numbuf[0] = va_arg(val, int);
  1c087b:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  1c087f:	8b 07                	mov    (%rdi),%eax
  1c0881:	83 f8 2f             	cmp    $0x2f,%eax
  1c0884:	77 23                	ja     1c08a9 <printer::vprintf(int, char const*, __va_list_tag*)+0x677>
  1c0886:	89 c2                	mov    %eax,%edx
  1c0888:	48 03 57 10          	add    0x10(%rdi),%rdx
  1c088c:	83 c0 08             	add    $0x8,%eax
  1c088f:	89 07                	mov    %eax,(%rdi)
  1c0891:	8b 02                	mov    (%rdx),%eax
  1c0893:	88 45 b0             	mov    %al,-0x50(%rbp)
            numbuf[1] = '\0';
  1c0896:	c6 45 b1 00          	movb   $0x0,-0x4f(%rbp)
            data = numbuf;
  1c089a:	48 8d 5d b0          	lea    -0x50(%rbp),%rbx
        unsigned long num = 0;
  1c089e:	41 bb 00 00 00 00    	mov    $0x0,%r11d
            break;
  1c08a4:	e9 20 fe ff ff       	jmp    1c06c9 <printer::vprintf(int, char const*, __va_list_tag*)+0x497>
            numbuf[0] = va_arg(val, int);
  1c08a9:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  1c08ad:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  1c08b1:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1c08b5:	48 89 47 08          	mov    %rax,0x8(%rdi)
  1c08b9:	eb d6                	jmp    1c0891 <printer::vprintf(int, char const*, __va_list_tag*)+0x65f>
        switch (*format) {
  1c08bb:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            numbuf[0] = (*format ? *format : '%');
  1c08bf:	84 c0                	test   %al,%al
  1c08c1:	0f 85 f1 01 00 00    	jne    1c0ab8 <printer::vprintf(int, char const*, __va_list_tag*)+0x886>
  1c08c7:	c6 45 b0 25          	movb   $0x25,-0x50(%rbp)
            numbuf[1] = '\0';
  1c08cb:	c6 45 b1 00          	movb   $0x0,-0x4f(%rbp)
                format--;
  1c08cf:	48 83 6d a8 01       	subq   $0x1,-0x58(%rbp)
            data = numbuf;
  1c08d4:	48 8d 5d b0          	lea    -0x50(%rbp),%rbx
        unsigned long num = 0;
  1c08d8:	41 bb 00 00 00 00    	mov    $0x0,%r11d
  1c08de:	e9 e6 fd ff ff       	jmp    1c06c9 <printer::vprintf(int, char const*, __va_list_tag*)+0x497>
    *--pos = '\0';
  1c08e3:	c6 45 cf 00          	movb   $0x0,-0x31(%rbp)
    if (flags & FLAG_THOUSANDS) {
  1c08e7:	f6 45 a4 20          	testb  $0x20,-0x5c(%rbp)
  1c08eb:	74 73                	je     1c0960 <printer::vprintf(int, char const*, __va_list_tag*)+0x72e>
        thousands_pos = pos - (base == 10 ? 3 : 4);
  1c08ed:	8b 5d 9c             	mov    -0x64(%rbp),%ebx
  1c08f0:	41 89 d9             	mov    %ebx,%r9d
  1c08f3:	89 45 a4             	mov    %eax,-0x5c(%rbp)
  1c08f6:	41 ba 40 13 1c 00    	mov    $0x1c1340,%r10d
  1c08fc:	c7 45 98 40 00 00 00 	movl   $0x40,-0x68(%rbp)
  1c0903:	83 fb 0a             	cmp    $0xa,%ebx
  1c0906:	0f 94 c0             	sete   %al
  1c0909:	0f b6 c0             	movzbl %al,%eax
  1c090c:	48 83 e8 04          	sub    $0x4,%rax
  1c0910:	eb 1d                	jmp    1c092f <printer::vprintf(int, char const*, __va_list_tag*)+0x6fd>
    if (flags & FLAG_THOUSANDS) {
  1c0912:	89 45 a4             	mov    %eax,-0x5c(%rbp)
        digits = lower_digits;
  1c0915:	41 ba 20 13 1c 00    	mov    $0x1c1320,%r10d
        base = -base;
  1c091b:	41 b9 10 00 00 00    	mov    $0x10,%r9d
    if (flags & FLAG_THOUSANDS) {
  1c0921:	c7 45 98 40 00 00 00 	movl   $0x40,-0x68(%rbp)
        thousands_pos = pos - (base == 10 ? 3 : 4);
  1c0928:	48 c7 c0 fc ff ff ff 	mov    $0xfffffffffffffffc,%rax
  1c092f:	48 8d 7c 05 cf       	lea    -0x31(%rbp,%rax,1),%rdi
  1c0934:	48 8d 4d ce          	lea    -0x32(%rbp),%rcx
        thousands_pos = nullptr;
  1c0938:	4c 89 d8             	mov    %r11,%rax
            *--pos = digits[val % base];
  1c093b:	49 63 f1             	movslq %r9d,%rsi
    } while (val != 0 && pos != buf);
  1c093e:	4c 8d 45 b0          	lea    -0x50(%rbp),%r8
  1c0942:	eb 57                	jmp    1c099b <printer::vprintf(int, char const*, __va_list_tag*)+0x769>
    if (flags & FLAG_THOUSANDS) {
  1c0944:	41 ba 40 13 1c 00    	mov    $0x1c1340,%r10d
  1c094a:	41 b9 0a 00 00 00    	mov    $0xa,%r9d
  1c0950:	c7 45 9c 0a 00 00 00 	movl   $0xa,-0x64(%rbp)
        thousands_pos = pos - (base == 10 ? 3 : 4);
  1c0957:	48 c7 c0 fd ff ff ff 	mov    $0xfffffffffffffffd,%rax
  1c095e:	eb cf                	jmp    1c092f <printer::vprintf(int, char const*, __va_list_tag*)+0x6fd>
  1c0960:	44 8b 4d 9c          	mov    -0x64(%rbp),%r9d
  1c0964:	89 45 a4             	mov    %eax,-0x5c(%rbp)
  1c0967:	41 ba 40 13 1c 00    	mov    $0x1c1340,%r10d
  1c096d:	c7 45 98 40 00 00 00 	movl   $0x40,-0x68(%rbp)
        thousands_pos = nullptr;
  1c0974:	bf 00 00 00 00       	mov    $0x0,%edi
  1c0979:	eb b9                	jmp    1c0934 <printer::vprintf(int, char const*, __va_list_tag*)+0x702>
            *--pos = digits[val % base];
  1c097b:	48 89 cb             	mov    %rcx,%rbx
  1c097e:	ba 00 00 00 00       	mov    $0x0,%edx
  1c0983:	48 f7 f6             	div    %rsi
  1c0986:	41 0f b6 14 12       	movzbl (%r10,%rdx,1),%edx
  1c098b:	88 11                	mov    %dl,(%rcx)
    } while (val != 0 && pos != buf);
  1c098d:	48 83 e9 01          	sub    $0x1,%rcx
  1c0991:	48 85 c0             	test   %rax,%rax
  1c0994:	74 2d                	je     1c09c3 <printer::vprintf(int, char const*, __va_list_tag*)+0x791>
  1c0996:	4c 39 c3             	cmp    %r8,%rbx
  1c0999:	74 28                	je     1c09c3 <printer::vprintf(int, char const*, __va_list_tag*)+0x791>
        if (pos == thousands_pos) {
  1c099b:	48 8d 51 01          	lea    0x1(%rcx),%rdx
  1c099f:	48 39 d7             	cmp    %rdx,%rdi
  1c09a2:	75 d7                	jne    1c097b <printer::vprintf(int, char const*, __va_list_tag*)+0x749>
            *--pos = base == 10 ? ',' : '\'';
  1c09a4:	48 89 cb             	mov    %rcx,%rbx
  1c09a7:	41 83 f9 0a          	cmp    $0xa,%r9d
  1c09ab:	0f 94 c2             	sete   %dl
  1c09ae:	8d 54 92 27          	lea    0x27(%rdx,%rdx,4),%edx
  1c09b2:	40 0f 94 c7          	sete   %dil
  1c09b6:	40 0f b6 ff          	movzbl %dil,%edi
  1c09ba:	88 11                	mov    %dl,(%rcx)
            thousands_pos = pos - (base == 10 ? 3 : 4);
  1c09bc:	48 8d 7c 39 fc       	lea    -0x4(%rcx,%rdi,1),%rdi
  1c09c1:	eb ca                	jmp    1c098d <printer::vprintf(int, char const*, __va_list_tag*)+0x75b>
        if ((flags & FLAG_NUMERIC) && (flags & FLAG_SIGNED)) {
  1c09c3:	8b 7d a4             	mov    -0x5c(%rbp),%edi
  1c09c6:	89 f8                	mov    %edi,%eax
  1c09c8:	f7 d0                	not    %eax
  1c09ca:	a8 c0                	test   $0xc0,%al
  1c09cc:	75 3c                	jne    1c0a0a <printer::vprintf(int, char const*, __va_list_tag*)+0x7d8>
                prefix = "-";
  1c09ce:	41 bc 4e 0c 1c 00    	mov    $0x1c0c4e,%r12d
            if (flags & FLAG_NEGATIVE) {
  1c09d4:	f7 c7 00 01 00 00    	test   $0x100,%edi
  1c09da:	0f 85 fe fc ff ff    	jne    1c06de <printer::vprintf(int, char const*, __va_list_tag*)+0x4ac>
                prefix = "+";
  1c09e0:	41 bc 49 0c 1c 00    	mov    $0x1c0c49,%r12d
            } else if (flags & FLAG_PLUSPOSITIVE) {
  1c09e6:	40 f6 c7 10          	test   $0x10,%dil
  1c09ea:	0f 85 ee fc ff ff    	jne    1c06de <printer::vprintf(int, char const*, __va_list_tag*)+0x4ac>
        const char* prefix = "";
  1c09f0:	40 f6 c7 08          	test   $0x8,%dil
  1c09f4:	ba 50 0c 1c 00       	mov    $0x1c0c50,%edx
  1c09f9:	b8 51 0c 1c 00       	mov    $0x1c0c51,%eax
  1c09fe:	48 0f 45 c2          	cmovne %rdx,%rax
  1c0a02:	49 89 c4             	mov    %rax,%r12
  1c0a05:	e9 d4 fc ff ff       	jmp    1c06de <printer::vprintf(int, char const*, __va_list_tag*)+0x4ac>
  1c0a0a:	41 bc 51 0c 1c 00    	mov    $0x1c0c51,%r12d
        } else if ((flags & FLAG_NUMERIC) && (flags & FLAG_ALT)
  1c0a10:	8b 4d a4             	mov    -0x5c(%rbp),%ecx
  1c0a13:	89 c8                	mov    %ecx,%eax
  1c0a15:	f7 d0                	not    %eax
  1c0a17:	a8 41                	test   $0x41,%al
  1c0a19:	0f 85 bf fc ff ff    	jne    1c06de <printer::vprintf(int, char const*, __va_list_tag*)+0x4ac>
                   && (base == 16 || base == -16)
  1c0a1f:	8b 45 9c             	mov    -0x64(%rbp),%eax
  1c0a22:	83 c0 10             	add    $0x10,%eax
  1c0a25:	a9 df ff ff ff       	test   $0xffffffdf,%eax
  1c0a2a:	0f 85 ae fc ff ff    	jne    1c06de <printer::vprintf(int, char const*, __va_list_tag*)+0x4ac>
                   && (num || (flags & FLAG_ALT2))) {
  1c0a30:	4d 85 db             	test   %r11,%r11
  1c0a33:	75 09                	jne    1c0a3e <printer::vprintf(int, char const*, __va_list_tag*)+0x80c>
  1c0a35:	f6 c5 02             	test   $0x2,%ch
  1c0a38:	0f 84 a0 fc ff ff    	je     1c06de <printer::vprintf(int, char const*, __va_list_tag*)+0x4ac>
            prefix = (base == -16 ? "0x" : "0X");
  1c0a3e:	83 7d 9c f0          	cmpl   $0xfffffff0,-0x64(%rbp)
  1c0a42:	ba 4b 0c 1c 00       	mov    $0x1c0c4b,%edx
  1c0a47:	b8 52 0c 1c 00       	mov    $0x1c0c52,%eax
  1c0a4c:	48 0f 45 c2          	cmovne %rdx,%rax
  1c0a50:	49 89 c4             	mov    %rax,%r12
  1c0a53:	e9 86 fc ff ff       	jmp    1c06de <printer::vprintf(int, char const*, __va_list_tag*)+0x4ac>
            datalen = strlen(data);
  1c0a58:	48 89 df             	mov    %rbx,%rdi
  1c0a5b:	e8 a3 f6 ff ff       	call   1c0103 <strlen>
  1c0a60:	89 45 9c             	mov    %eax,-0x64(%rbp)
            && precision >= 0) {
  1c0a63:	83 7d 98 00          	cmpl   $0x0,-0x68(%rbp)
  1c0a67:	0f 84 9e fc ff ff    	je     1c070b <printer::vprintf(int, char const*, __va_list_tag*)+0x4d9>
  1c0a6d:	80 7d 8c 00          	cmpb   $0x0,-0x74(%rbp)
  1c0a71:	0f 84 94 fc ff ff    	je     1c070b <printer::vprintf(int, char const*, __va_list_tag*)+0x4d9>
            zeros = precision > datalen ? precision - datalen : 0;
  1c0a77:	8b 7d a0             	mov    -0x60(%rbp),%edi
  1c0a7a:	89 fa                	mov    %edi,%edx
  1c0a7c:	29 c2                	sub    %eax,%edx
  1c0a7e:	39 c7                	cmp    %eax,%edi
  1c0a80:	b8 00 00 00 00       	mov    $0x0,%eax
  1c0a85:	0f 4f c2             	cmovg  %edx,%eax
  1c0a88:	89 45 a0             	mov    %eax,-0x60(%rbp)
  1c0a8b:	e9 91 fc ff ff       	jmp    1c0721 <printer::vprintf(int, char const*, __va_list_tag*)+0x4ef>
                   && datalen + (int) strlen(prefix) < width) {
  1c0a90:	4c 89 e7             	mov    %r12,%rdi
  1c0a93:	e8 6b f6 ff ff       	call   1c0103 <strlen>
  1c0a98:	8b 7d 9c             	mov    -0x64(%rbp),%edi
  1c0a9b:	8d 14 07             	lea    (%rdi,%rax,1),%edx
            zeros = width - datalen - strlen(prefix);
  1c0a9e:	44 89 f1             	mov    %r14d,%ecx
  1c0aa1:	29 f9                	sub    %edi,%ecx
  1c0aa3:	29 c1                	sub    %eax,%ecx
  1c0aa5:	44 39 f2             	cmp    %r14d,%edx
  1c0aa8:	b8 00 00 00 00       	mov    $0x0,%eax
  1c0aad:	0f 4c c1             	cmovl  %ecx,%eax
  1c0ab0:	89 45 a0             	mov    %eax,-0x60(%rbp)
  1c0ab3:	e9 69 fc ff ff       	jmp    1c0721 <printer::vprintf(int, char const*, __va_list_tag*)+0x4ef>
  1c0ab8:	48 8b 5d a8          	mov    -0x58(%rbp),%rbx
            numbuf[0] = (*format ? *format : '%');
  1c0abc:	88 45 b0             	mov    %al,-0x50(%rbp)
            numbuf[1] = '\0';
  1c0abf:	c6 45 b1 00          	movb   $0x0,-0x4f(%rbp)
  1c0ac3:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            data = numbuf;
  1c0ac7:	48 8d 5d b0          	lea    -0x50(%rbp),%rbx
        unsigned long num = 0;
  1c0acb:	41 bb 00 00 00 00    	mov    $0x0,%r11d
  1c0ad1:	e9 f3 fb ff ff       	jmp    1c06c9 <printer::vprintf(int, char const*, __va_list_tag*)+0x497>
    *--pos = '\0';
  1c0ad6:	c6 45 cf 00          	movb   $0x0,-0x31(%rbp)
    if (flags & FLAG_THOUSANDS) {
  1c0ada:	f6 45 a4 20          	testb  $0x20,-0x5c(%rbp)
  1c0ade:	0f 85 60 fe ff ff    	jne    1c0944 <printer::vprintf(int, char const*, __va_list_tag*)+0x712>
  1c0ae4:	41 ba 40 13 1c 00    	mov    $0x1c1340,%r10d
  1c0aea:	41 b9 0a 00 00 00    	mov    $0xa,%r9d
  1c0af0:	c7 45 9c 0a 00 00 00 	movl   $0xa,-0x64(%rbp)
        thousands_pos = nullptr;
  1c0af7:	bf 00 00 00 00       	mov    $0x0,%edi
  1c0afc:	e9 33 fe ff ff       	jmp    1c0934 <printer::vprintf(int, char const*, __va_list_tag*)+0x702>

00000000001c0b01 <vsnprintf>:
};

ssize_t vsnprintf(char* s, size_t size, const char* format, va_list val) {
  1c0b01:	f3 0f 1e fa          	endbr64
  1c0b05:	55                   	push   %rbp
  1c0b06:	48 89 e5             	mov    %rsp,%rbp
  1c0b09:	53                   	push   %rbx
  1c0b0a:	48 83 ec 28          	sub    $0x28,%rsp
  1c0b0e:	48 89 f3             	mov    %rsi,%rbx
        : s_(s), end_(s + size), n_(0) {
  1c0b11:	48 c7 45 d0 68 13 1c 	movq   $0x1c1368,-0x30(%rbp)
  1c0b18:	00 
  1c0b19:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  1c0b1d:	48 01 f7             	add    %rsi,%rdi
  1c0b20:	48 89 7d e0          	mov    %rdi,-0x20(%rbp)
  1c0b24:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
  1c0b2b:	00 
    string_printer sp(s, size);
    sp.vprintf(0, format, val);
  1c0b2c:	be 00 00 00 00       	mov    $0x0,%esi
  1c0b31:	48 8d 7d d0          	lea    -0x30(%rbp),%rdi
  1c0b35:	e8 f8 f6 ff ff       	call   1c0232 <printer::vprintf(int, char const*, __va_list_tag*)>
    if (size && sp.s_ < sp.end_) {
  1c0b3a:	48 85 db             	test   %rbx,%rbx
  1c0b3d:	74 10                	je     1c0b4f <vsnprintf+0x4e>
  1c0b3f:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  1c0b43:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  1c0b47:	48 39 c2             	cmp    %rax,%rdx
  1c0b4a:	73 0d                	jae    1c0b59 <vsnprintf+0x58>
        *sp.s_ = 0;
  1c0b4c:	c6 02 00             	movb   $0x0,(%rdx)
    } else if (size) {
        sp.end_[-1] = 0;
    }
    return sp.n_;
}
  1c0b4f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  1c0b53:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
  1c0b57:	c9                   	leave
  1c0b58:	c3                   	ret
        sp.end_[-1] = 0;
  1c0b59:	c6 40 ff 00          	movb   $0x0,-0x1(%rax)
  1c0b5d:	eb f0                	jmp    1c0b4f <vsnprintf+0x4e>

00000000001c0b5f <snprintf>:

ssize_t snprintf(char* s, size_t size, const char* format, ...) {
  1c0b5f:	f3 0f 1e fa          	endbr64
  1c0b63:	55                   	push   %rbp
  1c0b64:	48 89 e5             	mov    %rsp,%rbp
  1c0b67:	48 83 ec 50          	sub    $0x50,%rsp
  1c0b6b:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  1c0b6f:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
  1c0b73:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
  1c0b77:	c7 45 b8 18 00 00 00 	movl   $0x18,-0x48(%rbp)
  1c0b7e:	48 8d 45 10          	lea    0x10(%rbp),%rax
  1c0b82:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
  1c0b86:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  1c0b8a:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    int n = vsnprintf(s, size, format, val);
  1c0b8e:	48 8d 4d b8          	lea    -0x48(%rbp),%rcx
  1c0b92:	e8 6a ff ff ff       	call   1c0b01 <vsnprintf>
    va_end(val);
    return n;
  1c0b97:	48 98                	cltq
}
  1c0b99:	c9                   	leave
  1c0b9a:	c3                   	ret

00000000001c0b9b <assert_fail(char const*, int, char const*, char const*)>:
int error_vprintf(int cpos, int color, const char* format, va_list val) {
    return console_vprintf(cpos, color, format, val);
}

void assert_fail(const char* file, int line, const char* msg,
                 const char* description) {
  1c0b9b:	f3 0f 1e fa          	endbr64
  1c0b9f:	55                   	push   %rbp
  1c0ba0:	48 89 e5             	mov    %rsp,%rbp
  1c0ba3:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
  1c0baa:	41 89 f0             	mov    %esi,%r8d
    cursorpos = CPOS(23, 0);
  1c0bad:	c7 05 45 84 ef ff 30 	movl   $0x730,-0x107bbb(%rip)        # b8ffc <cursorpos>
  1c0bb4:	07 00 00 
    char buf[240];
    if (description) {
  1c0bb7:	48 85 c9             	test   %rcx,%rcx
  1c0bba:	74 39                	je     1c0bf5 <assert_fail(char const*, int, char const*, char const*)+0x5a>
  1c0bbc:	49 89 c9             	mov    %rcx,%r9
        snprintf(buf, sizeof(buf),
  1c0bbf:	48 83 ec 08          	sub    $0x8,%rsp
  1c0bc3:	52                   	push   %rdx
  1c0bc4:	56                   	push   %rsi
  1c0bc5:	57                   	push   %rdi
  1c0bc6:	48 89 f9             	mov    %rdi,%rcx
  1c0bc9:	ba 70 13 1c 00       	mov    $0x1c1370,%edx
  1c0bce:	be f0 00 00 00       	mov    $0xf0,%esi
  1c0bd3:	48 8d bd 10 ff ff ff 	lea    -0xf0(%rbp),%rdi
  1c0bda:	b0 00                	mov    $0x0,%al
  1c0bdc:	e8 7e ff ff ff       	call   1c0b5f <snprintf>
  1c0be1:	48 83 c4 20          	add    $0x20,%rsp
    register uintptr_t rax asm("rax") = syscallno;
  1c0be5:	b8 03 00 00 00       	mov    $0x3,%eax
    asm volatile ("syscall"
  1c0bea:	48 8d bd 10 ff ff ff 	lea    -0xf0(%rbp),%rdi
  1c0bf1:	0f 05                	syscall
//    Panic.
[[noreturn]] inline void sys_panic(const char* msg) {
    make_syscall(SYSCALL_PANIC, (uintptr_t) msg);

    // should never get here
    while (true) {
  1c0bf3:	eb fe                	jmp    1c0bf3 <assert_fail(char const*, int, char const*, char const*)+0x58>
                 "%s:%d: %s\n%s:%d: user assertion '%s' failed\n",
                 file, line, description, file, line, msg);
    } else {
        snprintf(buf, sizeof(buf),
  1c0bf5:	49 89 d1             	mov    %rdx,%r9
  1c0bf8:	48 89 f9             	mov    %rdi,%rcx
  1c0bfb:	ba a0 13 1c 00       	mov    $0x1c13a0,%edx
  1c0c00:	be f0 00 00 00       	mov    $0xf0,%esi
  1c0c05:	48 8d bd 10 ff ff ff 	lea    -0xf0(%rbp),%rdi
  1c0c0c:	b0 00                	mov    $0x0,%al
  1c0c0e:	e8 4c ff ff ff       	call   1c0b5f <snprintf>
  1c0c13:	eb d0                	jmp    1c0be5 <assert_fail(char const*, int, char const*, char const*)+0x4a>
