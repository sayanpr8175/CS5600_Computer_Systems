
obj/p-allocator2.full:     file format elf64-x86-64


Disassembly of section .text:

0000000000140000 <process_main()>:

// These global variables go on the data page.
uint8_t* heap_top;
uint8_t* stack_bottom;

void process_main() {
  140000:	f3 0f 1e fa          	endbr64
  140004:	55                   	push   %rbp
  140005:	48 89 e5             	mov    %rsp,%rbp
  140008:	41 54                	push   %r12
  14000a:	53                   	push   %rbx
// make_syscall
//    These functions define the WeensyOS system call calling convention.
//    We provide versions for system calls with 0-2 arguments.

__always_inline uintptr_t make_syscall(int syscallno) {
    register uintptr_t rax asm("rax") = syscallno;
  14000b:	b8 01 00 00 00       	mov    $0x1,%eax
    asm volatile ("syscall"
  140010:	0f 05                	syscall
            : "+a" (rax)
            : /* all input registers are also output registers */
            : "cc", "memory", "rcx", "rdx", "rsi", "rdi", "r8", "r9",
              "r10", "r11");
    return rax;
  140012:	49 89 c4             	mov    %rax,%r12


// sys_getpid
//    Return current process ID. (Never fails.)
inline pid_t sys_getpid() {
    return make_syscall(SYSCALL_GETPID);
  140015:	89 c3                	mov    %eax,%ebx
    pid_t p = sys_getpid();
    srand(p);
  140017:	89 c7                	mov    %eax,%edi
  140019:	e8 a7 01 00 00       	call   1401c5 <srand(unsigned int)>
//    Return the smallest multiple of `m` greater than or equal to `x`.
//    Equivalently, round `x` up to the nearest multiple of `m`.
template <typename T>
inline constexpr T round_up(T x, unsigned m) {
    static_assert(std::is_unsigned<T>::value, "T must be unsigned");
    return round_down(x + m - 1, m);
  14001e:	ba 1b 30 14 00       	mov    $0x14301b,%edx

    // The heap starts on the page right after the 'end' symbol,
    // whose address is the first address not allocated to process code
    // or data.
    heap_top = (uint8_t*) round_up((uintptr_t) end, PAGESIZE);
  140023:	48 81 e2 00 f0 ff ff 	and    $0xfffffffffffff000,%rdx
  14002a:	48 89 15 d7 1f 00 00 	mov    %rdx,0x1fd7(%rip)        # 142008 <heap_top>
    return x;
}

__always_inline uintptr_t rdrsp() {
    uintptr_t x;
    asm volatile("movq %%rsp, %0" : "=r" (x));
  140031:	48 89 e0             	mov    %rsp,%rax

    // The bottom of the stack is the first address on the current
    // stack page (this process never needs more than one stack page).
    stack_bottom = (uint8_t*) round_down((uintptr_t) rdrsp() - 1, PAGESIZE);
  140034:	48 83 e8 01          	sub    $0x1,%rax
  140038:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  14003e:	48 89 05 bb 1f 00 00 	mov    %rax,0x1fbb(%rip)        # 142000 <stack_bottom>

    // Allocate heap pages until (1) hit the stack (out of address space)
    // or (2) allocation fails (out of physical memory).
    while (heap_top != stack_bottom) {
  140045:	48 39 c2             	cmp    %rax,%rdx
  140048:	75 4f                	jne    140099 <process_main()+0x99>
    register uintptr_t rax asm("rax") = syscallno;
  14004a:	b8 02 00 00 00       	mov    $0x2,%eax
    asm volatile ("syscall"
  14004f:	0f 05                	syscall
        }
        sys_yield();
    }

    // After running out of memory, do nothing forever
    while (true) {
  140051:	eb f7                	jmp    14004a <process_main()+0x4a>
                assert(*l == 0);
  140053:	b9 00 00 00 00       	mov    $0x0,%ecx
  140058:	ba 20 0c 14 00       	mov    $0x140c20,%edx
  14005d:	be 24 00 00 00       	mov    $0x24,%esi
  140062:	bf 28 0c 14 00       	mov    $0x140c28,%edi
  140067:	e8 2f 0b 00 00       	call   140b9b <assert_fail(char const*, int, char const*, char const*)>
            *heap_top = p;
  14006c:	44 88 21             	mov    %r12b,(%rcx)
            console[CPOS(24, 79)] = p;
  14006f:	66 44 89 25 27 8f f7 	mov    %r12w,-0x870d9(%rip)        # b8f9e <console+0xf9e>
  140076:	ff 
            heap_top += PAGESIZE;
  140077:	48 81 05 86 1f 00 00 	addq   $0x1000,0x1f86(%rip)        # 142008 <heap_top>
  14007e:	00 10 00 00 
    register uintptr_t rax asm("rax") = syscallno;
  140082:	b8 02 00 00 00       	mov    $0x2,%eax
    asm volatile ("syscall"
  140087:	0f 05                	syscall
    while (heap_top != stack_bottom) {
  140089:	48 8b 05 70 1f 00 00 	mov    0x1f70(%rip),%rax        # 142000 <stack_bottom>
  140090:	48 39 05 71 1f 00 00 	cmp    %rax,0x1f71(%rip)        # 142008 <heap_top>
  140097:	74 b1                	je     14004a <process_main()+0x4a>
        if (rand(0, ALLOC_SLOWDOWN - 1) < p) {
  140099:	be 09 00 00 00       	mov    $0x9,%esi
  14009e:	bf 00 00 00 00       	mov    $0x0,%edi
  1400a3:	e8 3c 01 00 00       	call   1401e4 <rand(int, int)>
  1400a8:	39 d8                	cmp    %ebx,%eax
  1400aa:	7d d6                	jge    140082 <process_main()+0x82>
    register uintptr_t rax asm("rax") = syscallno;
  1400ac:	b8 04 00 00 00       	mov    $0x4,%eax
    asm volatile ("syscall"
  1400b1:	48 8b 3d 50 1f 00 00 	mov    0x1f50(%rip),%rdi        # 142008 <heap_top>
  1400b8:	0f 05                	syscall
            if (sys_page_alloc(heap_top) < 0) {
  1400ba:	85 c0                	test   %eax,%eax
  1400bc:	78 8c                	js     14004a <process_main()+0x4a>
            for (unsigned long* l = (unsigned long*) heap_top;
  1400be:	48 8b 0d 43 1f 00 00 	mov    0x1f43(%rip),%rcx        # 142008 <heap_top>
                 l != (unsigned long*) (heap_top + PAGESIZE);
  1400c5:	48 8d 91 00 10 00 00 	lea    0x1000(%rcx),%rdx
            for (unsigned long* l = (unsigned long*) heap_top;
  1400cc:	48 89 c8             	mov    %rcx,%rax
                assert(*l == 0);
  1400cf:	48 83 38 00          	cmpq   $0x0,(%rax)
  1400d3:	0f 85 7a ff ff ff    	jne    140053 <process_main()+0x53>
            for (unsigned long* l = (unsigned long*) heap_top;
  1400d9:	48 83 c0 08          	add    $0x8,%rax
                 l != (unsigned long*) (heap_top + PAGESIZE);
  1400dd:	48 39 d0             	cmp    %rdx,%rax
  1400e0:	75 ed                	jne    1400cf <process_main()+0xcf>
  1400e2:	eb 88                	jmp    14006c <process_main()+0x6c>

00000000001400e4 <string_printer::putc(unsigned char, int)>:
    char* end_;
    size_t n_;
    string_printer(char* s, size_t size)
        : s_(s), end_(s + size), n_(0) {
    }
    void putc(unsigned char c, int) override {
  1400e4:	f3 0f 1e fa          	endbr64
        if (s_ < end_) {
  1400e8:	48 8b 47 08          	mov    0x8(%rdi),%rax
  1400ec:	48 3b 47 10          	cmp    0x10(%rdi),%rax
  1400f0:	73 0b                	jae    1400fd <string_printer::putc(unsigned char, int)+0x19>
            *s_++ = c;
  1400f2:	48 8d 50 01          	lea    0x1(%rax),%rdx
  1400f6:	48 89 57 08          	mov    %rdx,0x8(%rdi)
  1400fa:	40 88 30             	mov    %sil,(%rax)
        }
        ++n_;
  1400fd:	48 83 47 18 01       	addq   $0x1,0x18(%rdi)
    }
  140102:	c3                   	ret

0000000000140103 <strlen>:
size_t strlen(const char* s) {
  140103:	f3 0f 1e fa          	endbr64
    for (n = 0; *s != '\0'; ++s) {
  140107:	80 3f 00             	cmpb   $0x0,(%rdi)
  14010a:	74 10                	je     14011c <strlen+0x19>
  14010c:	b8 00 00 00 00       	mov    $0x0,%eax
        ++n;
  140111:	48 83 c0 01          	add    $0x1,%rax
    for (n = 0; *s != '\0'; ++s) {
  140115:	80 3c 07 00          	cmpb   $0x0,(%rdi,%rax,1)
  140119:	75 f6                	jne    140111 <strlen+0xe>
  14011b:	c3                   	ret
  14011c:	b8 00 00 00 00       	mov    $0x0,%eax
}
  140121:	c3                   	ret

0000000000140122 <strnlen>:
size_t strnlen(const char* s, size_t maxlen) {
  140122:	f3 0f 1e fa          	endbr64
  140126:	48 89 f0             	mov    %rsi,%rax
    for (n = 0; n != maxlen && *s != '\0'; ++s) {
  140129:	ba 00 00 00 00       	mov    $0x0,%edx
  14012e:	48 85 f6             	test   %rsi,%rsi
  140131:	74 10                	je     140143 <strnlen+0x21>
  140133:	80 3c 17 00          	cmpb   $0x0,(%rdi,%rdx,1)
  140137:	74 0b                	je     140144 <strnlen+0x22>
        ++n;
  140139:	48 83 c2 01          	add    $0x1,%rdx
    for (n = 0; n != maxlen && *s != '\0'; ++s) {
  14013d:	48 39 d0             	cmp    %rdx,%rax
  140140:	75 f1                	jne    140133 <strnlen+0x11>
  140142:	c3                   	ret
  140143:	c3                   	ret
  140144:	48 89 d0             	mov    %rdx,%rax
}
  140147:	c3                   	ret

0000000000140148 <strchr>:
char* strchr(const char* s, int c) {
  140148:	f3 0f 1e fa          	endbr64
    while (*s != '\0' && *s != (char) c) {
  14014c:	0f b6 07             	movzbl (%rdi),%eax
  14014f:	84 c0                	test   %al,%al
  140151:	74 10                	je     140163 <strchr+0x1b>
  140153:	40 38 f0             	cmp    %sil,%al
  140156:	74 18                	je     140170 <strchr+0x28>
        ++s;
  140158:	48 83 c7 01          	add    $0x1,%rdi
    while (*s != '\0' && *s != (char) c) {
  14015c:	0f b6 07             	movzbl (%rdi),%eax
  14015f:	84 c0                	test   %al,%al
  140161:	75 f0                	jne    140153 <strchr+0xb>
        return (char*) s;
  140163:	40 84 f6             	test   %sil,%sil
  140166:	b8 00 00 00 00       	mov    $0x0,%eax
  14016b:	48 0f 44 c7          	cmove  %rdi,%rax
}
  14016f:	c3                   	ret
        return (char*) s;
  140170:	48 89 f8             	mov    %rdi,%rax
  140173:	c3                   	ret

0000000000140174 <rand()>:
int rand() {
  140174:	f3 0f 1e fa          	endbr64
    if (!rand_seed_set) {
  140178:	83 3d 99 1e 00 00 00 	cmpl   $0x0,0x1e99(%rip)        # 142018 <rand_seed_set>
  14017f:	74 27                	je     1401a8 <rand()+0x34>
    rand_seed = rand_seed * 6364136223846793005UL + 1;
  140181:	48 b8 2d 7f 95 4c 2d 	movabs $0x5851f42d4c957f2d,%rax
  140188:	f4 51 58 
  14018b:	48 0f af 05 7d 1e 00 	imul   0x1e7d(%rip),%rax        # 142010 <rand_seed>
  140192:	00 
  140193:	48 83 c0 01          	add    $0x1,%rax
  140197:	48 89 05 72 1e 00 00 	mov    %rax,0x1e72(%rip)        # 142010 <rand_seed>
    return (rand_seed >> 32) & RAND_MAX;
  14019e:	48 c1 e8 20          	shr    $0x20,%rax
  1401a2:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
}
  1401a7:	c3                   	ret
    rand_seed = ((unsigned long) seed << 32) | seed;
  1401a8:	48 b8 9e 87 d4 30 9e 	movabs $0x30d4879e30d4879e,%rax
  1401af:	87 d4 30 
  1401b2:	48 89 05 57 1e 00 00 	mov    %rax,0x1e57(%rip)        # 142010 <rand_seed>
    rand_seed_set = 1;
  1401b9:	c7 05 55 1e 00 00 01 	movl   $0x1,0x1e55(%rip)        # 142018 <rand_seed_set>
  1401c0:	00 00 00 
}
  1401c3:	eb bc                	jmp    140181 <rand()+0xd>

00000000001401c5 <srand(unsigned int)>:
void srand(unsigned seed) {
  1401c5:	f3 0f 1e fa          	endbr64
    rand_seed = ((unsigned long) seed << 32) | seed;
  1401c9:	89 f8                	mov    %edi,%eax
  1401cb:	48 c1 e7 20          	shl    $0x20,%rdi
  1401cf:	48 01 c7             	add    %rax,%rdi
  1401d2:	48 89 3d 37 1e 00 00 	mov    %rdi,0x1e37(%rip)        # 142010 <rand_seed>
    rand_seed_set = 1;
  1401d9:	c7 05 35 1e 00 00 01 	movl   $0x1,0x1e35(%rip)        # 142018 <rand_seed_set>
  1401e0:	00 00 00 
}
  1401e3:	c3                   	ret

00000000001401e4 <rand(int, int)>:
int rand(int min, int max) {
  1401e4:	f3 0f 1e fa          	endbr64
  1401e8:	55                   	push   %rbp
  1401e9:	48 89 e5             	mov    %rsp,%rbp
  1401ec:	41 54                	push   %r12
  1401ee:	53                   	push   %rbx
    assert(min <= max);
  1401ef:	39 f7                	cmp    %esi,%edi
  1401f1:	7f 26                	jg     140219 <rand(int, int)+0x35>
  1401f3:	41 89 fc             	mov    %edi,%r12d
  1401f6:	89 f3                	mov    %esi,%ebx
    unsigned long r = rand();
  1401f8:	e8 77 ff ff ff       	call   140174 <rand()>
    return min + (r * (max - min + 1)) / ((unsigned long) RAND_MAX + 1);
  1401fd:	44 29 e3             	sub    %r12d,%ebx
  140200:	83 c3 01             	add    $0x1,%ebx
  140203:	48 63 db             	movslq %ebx,%rbx
    unsigned long r = rand();
  140206:	48 98                	cltq
    return min + (r * (max - min + 1)) / ((unsigned long) RAND_MAX + 1);
  140208:	48 0f af d8          	imul   %rax,%rbx
  14020c:	48 c1 eb 1f          	shr    $0x1f,%rbx
  140210:	41 8d 04 1c          	lea    (%r12,%rbx,1),%eax
}
  140214:	5b                   	pop    %rbx
  140215:	41 5c                	pop    %r12
  140217:	5d                   	pop    %rbp
  140218:	c3                   	ret
    assert(min <= max);
  140219:	b9 00 00 00 00       	mov    $0x0,%ecx
  14021e:	ba 37 0c 14 00       	mov    $0x140c37,%edx
  140223:	be 45 01 00 00       	mov    $0x145,%esi
  140228:	bf 42 0c 14 00       	mov    $0x140c42,%edi
  14022d:	e8 69 09 00 00       	call   140b9b <assert_fail(char const*, int, char const*, char const*)>

0000000000140232 <printer::vprintf(int, char const*, __va_list_tag*)>:
void printer::vprintf(int color, const char* format, va_list val) {
  140232:	f3 0f 1e fa          	endbr64
  140236:	55                   	push   %rbp
  140237:	48 89 e5             	mov    %rsp,%rbp
  14023a:	41 57                	push   %r15
  14023c:	41 56                	push   %r14
  14023e:	41 55                	push   %r13
  140240:	41 54                	push   %r12
  140242:	53                   	push   %rbx
  140243:	48 83 ec 58          	sub    $0x58,%rsp
  140247:	49 89 ff             	mov    %rdi,%r15
  14024a:	41 89 f5             	mov    %esi,%r13d
  14024d:	49 89 d4             	mov    %rdx,%r12
  140250:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
    for (; *format; ++format) {
  140254:	0f b6 02             	movzbl (%rdx),%eax
  140257:	84 c0                	test   %al,%al
  140259:	0f 85 aa 05 00 00    	jne    140809 <printer::vprintf(int, char const*, __va_list_tag*)+0x5d7>
}
  14025f:	48 83 c4 58          	add    $0x58,%rsp
  140263:	5b                   	pop    %rbx
  140264:	41 5c                	pop    %r12
  140266:	41 5d                	pop    %r13
  140268:	41 5e                	pop    %r14
  14026a:	41 5f                	pop    %r15
  14026c:	5d                   	pop    %rbp
  14026d:	c3                   	ret
        for (++format; *format; ++format) {
  14026e:	49 8d 5c 24 01       	lea    0x1(%r12),%rbx
  140273:	45 0f b6 64 24 01    	movzbl 0x1(%r12),%r12d
  140279:	45 84 e4             	test   %r12b,%r12b
  14027c:	0f 84 08 01 00 00    	je     14038a <printer::vprintf(int, char const*, __va_list_tag*)+0x158>
        int flags = 0;
  140282:	41 be 00 00 00 00    	mov    $0x0,%r14d
            const char* flagc = strchr(flag_chars, *format);
  140288:	41 0f be f4          	movsbl %r12b,%esi
  14028c:	bf 51 13 14 00       	mov    $0x141351,%edi
  140291:	e8 b2 fe ff ff       	call   140148 <strchr>
  140296:	48 89 c1             	mov    %rax,%rcx
            if (flagc) {
  140299:	48 85 c0             	test   %rax,%rax
  14029c:	74 74                	je     140312 <printer::vprintf(int, char const*, __va_list_tag*)+0xe0>
                flags |= 1 << (flagc - flag_chars);
  14029e:	48 81 e9 51 13 14 00 	sub    $0x141351,%rcx
  1402a5:	b8 01 00 00 00       	mov    $0x1,%eax
  1402aa:	d3 e0                	shl    %cl,%eax
  1402ac:	41 09 c6             	or     %eax,%r14d
        for (++format; *format; ++format) {
  1402af:	48 83 c3 01          	add    $0x1,%rbx
  1402b3:	44 0f b6 23          	movzbl (%rbx),%r12d
  1402b7:	45 84 e4             	test   %r12b,%r12b
  1402ba:	75 cc                	jne    140288 <printer::vprintf(int, char const*, __va_list_tag*)+0x56>
        int width = -1;
  1402bc:	44 89 75 a4          	mov    %r14d,-0x5c(%rbp)
  1402c0:	41 be ff ff ff ff    	mov    $0xffffffff,%r14d
        int precision = -1;
  1402c6:	c7 45 a0 ff ff ff ff 	movl   $0xffffffff,-0x60(%rbp)
        if (*format == '.') {
  1402cd:	80 3b 2e             	cmpb   $0x2e,(%rbx)
  1402d0:	0f 84 dc 00 00 00    	je     1403b2 <printer::vprintf(int, char const*, __va_list_tag*)+0x180>
        switch (*format) {
  1402d6:	0f b6 03             	movzbl (%rbx),%eax
  1402d9:	3c 6c                	cmp    $0x6c,%al
  1402db:	0f 84 77 01 00 00    	je     140458 <printer::vprintf(int, char const*, __va_list_tag*)+0x226>
  1402e1:	0f 8f 52 01 00 00    	jg     140439 <printer::vprintf(int, char const*, __va_list_tag*)+0x207>
  1402e7:	3c 68                	cmp    $0x68,%al
  1402e9:	0f 85 8c 01 00 00    	jne    14047b <printer::vprintf(int, char const*, __va_list_tag*)+0x249>
            ++format;
  1402ef:	48 8d 43 01          	lea    0x1(%rbx),%rax
  1402f3:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
        switch (*format) {
  1402f7:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
  1402fb:	8d 50 bd             	lea    -0x43(%rax),%edx
  1402fe:	80 fa 35             	cmp    $0x35,%dl
  140301:	0f 87 b8 05 00 00    	ja     1408bf <printer::vprintf(int, char const*, __va_list_tag*)+0x68d>
  140307:	0f b6 d2             	movzbl %dl,%edx
  14030a:	3e ff 24 d5 60 0c 14 	notrack jmp *0x140c60(,%rdx,8)
  140311:	00 
        if (*format >= '1' && *format <= '9') {
  140312:	44 89 75 a4          	mov    %r14d,-0x5c(%rbp)
  140316:	41 8d 44 24 cf       	lea    -0x31(%r12),%eax
  14031b:	3c 08                	cmp    $0x8,%al
  14031d:	77 31                	ja     140350 <printer::vprintf(int, char const*, __va_list_tag*)+0x11e>
            for (width = 0; *format >= '0' && *format <= '9'; ) {
  14031f:	0f b6 03             	movzbl (%rbx),%eax
  140322:	8d 50 d0             	lea    -0x30(%rax),%edx
  140325:	80 fa 09             	cmp    $0x9,%dl
  140328:	77 72                	ja     14039c <printer::vprintf(int, char const*, __va_list_tag*)+0x16a>
  14032a:	41 be 00 00 00 00    	mov    $0x0,%r14d
                width = 10 * width + *format++ - '0';
  140330:	48 83 c3 01          	add    $0x1,%rbx
  140334:	43 8d 14 b6          	lea    (%r14,%r14,4),%edx
  140338:	0f be c0             	movsbl %al,%eax
  14033b:	44 8d 74 50 d0       	lea    -0x30(%rax,%rdx,2),%r14d
            for (width = 0; *format >= '0' && *format <= '9'; ) {
  140340:	0f b6 03             	movzbl (%rbx),%eax
  140343:	8d 50 d0             	lea    -0x30(%rax),%edx
  140346:	80 fa 09             	cmp    $0x9,%dl
  140349:	76 e5                	jbe    140330 <printer::vprintf(int, char const*, __va_list_tag*)+0xfe>
  14034b:	e9 76 ff ff ff       	jmp    1402c6 <printer::vprintf(int, char const*, __va_list_tag*)+0x94>
        } else if (*format == '*') {
  140350:	41 80 fc 2a          	cmp    $0x2a,%r12b
  140354:	75 51                	jne    1403a7 <printer::vprintf(int, char const*, __va_list_tag*)+0x175>
            width = va_arg(val, int);
  140356:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  14035a:	8b 01                	mov    (%rcx),%eax
  14035c:	83 f8 2f             	cmp    $0x2f,%eax
  14035f:	77 17                	ja     140378 <printer::vprintf(int, char const*, __va_list_tag*)+0x146>
  140361:	89 c2                	mov    %eax,%edx
  140363:	48 03 51 10          	add    0x10(%rcx),%rdx
  140367:	83 c0 08             	add    $0x8,%eax
  14036a:	89 01                	mov    %eax,(%rcx)
  14036c:	44 8b 32             	mov    (%rdx),%r14d
            ++format;
  14036f:	48 83 c3 01          	add    $0x1,%rbx
  140373:	e9 4e ff ff ff       	jmp    1402c6 <printer::vprintf(int, char const*, __va_list_tag*)+0x94>
            width = va_arg(val, int);
  140378:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  14037c:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  140380:	48 8d 42 08          	lea    0x8(%rdx),%rax
  140384:	48 89 47 08          	mov    %rax,0x8(%rdi)
  140388:	eb e2                	jmp    14036c <printer::vprintf(int, char const*, __va_list_tag*)+0x13a>
        int flags = 0;
  14038a:	c7 45 a4 00 00 00 00 	movl   $0x0,-0x5c(%rbp)
        int width = -1;
  140391:	41 be ff ff ff ff    	mov    $0xffffffff,%r14d
  140397:	e9 2a ff ff ff       	jmp    1402c6 <printer::vprintf(int, char const*, __va_list_tag*)+0x94>
            for (width = 0; *format >= '0' && *format <= '9'; ) {
  14039c:	41 be 00 00 00 00    	mov    $0x0,%r14d
  1403a2:	e9 1f ff ff ff       	jmp    1402c6 <printer::vprintf(int, char const*, __va_list_tag*)+0x94>
        int width = -1;
  1403a7:	41 be ff ff ff ff    	mov    $0xffffffff,%r14d
  1403ad:	e9 14 ff ff ff       	jmp    1402c6 <printer::vprintf(int, char const*, __va_list_tag*)+0x94>
            ++format;
  1403b2:	48 8d 53 01          	lea    0x1(%rbx),%rdx
            if (*format >= '0' && *format <= '9') {
  1403b6:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
  1403ba:	8d 48 d0             	lea    -0x30(%rax),%ecx
  1403bd:	80 f9 09             	cmp    $0x9,%cl
  1403c0:	76 13                	jbe    1403d5 <printer::vprintf(int, char const*, __va_list_tag*)+0x1a3>
            } else if (*format == '*') {
  1403c2:	3c 2a                	cmp    $0x2a,%al
  1403c4:	74 33                	je     1403f9 <printer::vprintf(int, char const*, __va_list_tag*)+0x1c7>
            ++format;
  1403c6:	48 89 d3             	mov    %rdx,%rbx
                precision = 0;
  1403c9:	c7 45 a0 00 00 00 00 	movl   $0x0,-0x60(%rbp)
  1403d0:	e9 01 ff ff ff       	jmp    1402d6 <printer::vprintf(int, char const*, __va_list_tag*)+0xa4>
                for (precision = 0; *format >= '0' && *format <= '9'; ) {
  1403d5:	b9 00 00 00 00       	mov    $0x0,%ecx
                    precision = 10 * precision + *format++ - '0';
  1403da:	48 83 c2 01          	add    $0x1,%rdx
  1403de:	8d 0c 89             	lea    (%rcx,%rcx,4),%ecx
  1403e1:	0f be c0             	movsbl %al,%eax
  1403e4:	8d 4c 48 d0          	lea    -0x30(%rax,%rcx,2),%ecx
                for (precision = 0; *format >= '0' && *format <= '9'; ) {
  1403e8:	0f b6 02             	movzbl (%rdx),%eax
  1403eb:	8d 70 d0             	lea    -0x30(%rax),%esi
  1403ee:	40 80 fe 09          	cmp    $0x9,%sil
  1403f2:	76 e6                	jbe    1403da <printer::vprintf(int, char const*, __va_list_tag*)+0x1a8>
  1403f4:	48 89 d3             	mov    %rdx,%rbx
  1403f7:	eb 1c                	jmp    140415 <printer::vprintf(int, char const*, __va_list_tag*)+0x1e3>
                precision = va_arg(val, int);
  1403f9:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1403fd:	8b 01                	mov    (%rcx),%eax
  1403ff:	83 f8 2f             	cmp    $0x2f,%eax
  140402:	77 23                	ja     140427 <printer::vprintf(int, char const*, __va_list_tag*)+0x1f5>
  140404:	89 c2                	mov    %eax,%edx
  140406:	48 03 51 10          	add    0x10(%rcx),%rdx
  14040a:	83 c0 08             	add    $0x8,%eax
  14040d:	89 01                	mov    %eax,(%rcx)
  14040f:	8b 0a                	mov    (%rdx),%ecx
                ++format;
  140411:	48 83 c3 02          	add    $0x2,%rbx
            if (precision < 0) {
  140415:	85 c9                	test   %ecx,%ecx
  140417:	b8 00 00 00 00       	mov    $0x0,%eax
  14041c:	0f 49 c1             	cmovns %ecx,%eax
  14041f:	89 45 a0             	mov    %eax,-0x60(%rbp)
  140422:	e9 af fe ff ff       	jmp    1402d6 <printer::vprintf(int, char const*, __va_list_tag*)+0xa4>
                precision = va_arg(val, int);
  140427:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  14042b:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  14042f:	48 8d 42 08          	lea    0x8(%rdx),%rax
  140433:	48 89 41 08          	mov    %rax,0x8(%rcx)
  140437:	eb d6                	jmp    14040f <printer::vprintf(int, char const*, __va_list_tag*)+0x1dd>
        switch (*format) {
  140439:	3c 74                	cmp    $0x74,%al
  14043b:	74 1b                	je     140458 <printer::vprintf(int, char const*, __va_list_tag*)+0x226>
  14043d:	3c 7a                	cmp    $0x7a,%al
  14043f:	74 17                	je     140458 <printer::vprintf(int, char const*, __va_list_tag*)+0x226>
        switch (*format) {
  140441:	8d 50 bd             	lea    -0x43(%rax),%edx
  140444:	80 fa 35             	cmp    $0x35,%dl
  140447:	0f 87 6f 06 00 00    	ja     140abc <printer::vprintf(int, char const*, __va_list_tag*)+0x88a>
  14044d:	0f b6 d2             	movzbl %dl,%edx
  140450:	3e ff 24 d5 10 0e 14 	notrack jmp *0x140e10(,%rdx,8)
  140457:	00 
            ++format;
  140458:	48 8d 43 01          	lea    0x1(%rbx),%rax
  14045c:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
        switch (*format) {
  140460:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
  140464:	8d 50 bd             	lea    -0x43(%rax),%edx
  140467:	80 fa 35             	cmp    $0x35,%dl
  14046a:	0f 87 4f 04 00 00    	ja     1408bf <printer::vprintf(int, char const*, __va_list_tag*)+0x68d>
  140470:	0f b6 d2             	movzbl %dl,%edx
  140473:	3e ff 24 d5 c0 0f 14 	notrack jmp *0x140fc0(,%rdx,8)
  14047a:	00 
  14047b:	8d 50 bd             	lea    -0x43(%rax),%edx
  14047e:	80 fa 35             	cmp    $0x35,%dl
  140481:	0f 87 34 04 00 00    	ja     1408bb <printer::vprintf(int, char const*, __va_list_tag*)+0x689>
  140487:	0f b6 d2             	movzbl %dl,%edx
  14048a:	3e ff 24 d5 70 11 14 	notrack jmp *0x141170(,%rdx,8)
  140491:	00 
            long x = length ? va_arg(val, long) : va_arg(val, int);
  140492:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  140496:	8b 07                	mov    (%rdi),%eax
  140498:	83 f8 2f             	cmp    $0x2f,%eax
  14049b:	77 38                	ja     1404d5 <printer::vprintf(int, char const*, __va_list_tag*)+0x2a3>
  14049d:	89 c2                	mov    %eax,%edx
  14049f:	48 03 57 10          	add    0x10(%rdi),%rdx
  1404a3:	83 c0 08             	add    $0x8,%eax
  1404a6:	89 07                	mov    %eax,(%rdi)
  1404a8:	48 8b 12             	mov    (%rdx),%rdx
            int negative = x < 0 ? FLAG_NEGATIVE : 0;
  1404ab:	48 89 d0             	mov    %rdx,%rax
  1404ae:	48 c1 f8 37          	sar    $0x37,%rax
            num = negative ? -x : x;
  1404b2:	49 89 d3             	mov    %rdx,%r11
  1404b5:	49 f7 db             	neg    %r11
  1404b8:	25 00 01 00 00       	and    $0x100,%eax
  1404bd:	4c 0f 44 da          	cmove  %rdx,%r11
            flags |= FLAG_NUMERIC | FLAG_SIGNED | negative;
  1404c1:	8b 7d a4             	mov    -0x5c(%rbp),%edi
  1404c4:	09 f8                	or     %edi,%eax
  1404c6:	0c c0                	or     $0xc0,%al
  1404c8:	89 45 a4             	mov    %eax,-0x5c(%rbp)
        const char* data = "";
  1404cb:	bb 51 0c 14 00       	mov    $0x140c51,%ebx
            break;
  1404d0:	e9 f4 01 00 00       	jmp    1406c9 <printer::vprintf(int, char const*, __va_list_tag*)+0x497>
            long x = length ? va_arg(val, long) : va_arg(val, int);
  1404d5:	48 8b 5d 90          	mov    -0x70(%rbp),%rbx
  1404d9:	48 8b 53 08          	mov    0x8(%rbx),%rdx
  1404dd:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1404e1:	48 89 43 08          	mov    %rax,0x8(%rbx)
  1404e5:	eb c1                	jmp    1404a8 <printer::vprintf(int, char const*, __va_list_tag*)+0x276>
        switch (*format) {
  1404e7:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  1404eb:	eb 04                	jmp    1404f1 <printer::vprintf(int, char const*, __va_list_tag*)+0x2bf>
  1404ed:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            long x = length ? va_arg(val, long) : va_arg(val, int);
  1404f1:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1404f5:	8b 01                	mov    (%rcx),%eax
  1404f7:	83 f8 2f             	cmp    $0x2f,%eax
  1404fa:	77 10                	ja     14050c <printer::vprintf(int, char const*, __va_list_tag*)+0x2da>
  1404fc:	89 c2                	mov    %eax,%edx
  1404fe:	48 03 51 10          	add    0x10(%rcx),%rdx
  140502:	83 c0 08             	add    $0x8,%eax
  140505:	89 01                	mov    %eax,(%rcx)
  140507:	48 63 12             	movslq (%rdx),%rdx
  14050a:	eb 9f                	jmp    1404ab <printer::vprintf(int, char const*, __va_list_tag*)+0x279>
  14050c:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  140510:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  140514:	48 8d 42 08          	lea    0x8(%rdx),%rax
  140518:	48 89 47 08          	mov    %rax,0x8(%rdi)
  14051c:	eb e9                	jmp    140507 <printer::vprintf(int, char const*, __va_list_tag*)+0x2d5>
        switch (*format) {
  14051e:	b8 01 00 00 00       	mov    $0x1,%eax
  140523:	c7 45 9c 0a 00 00 00 	movl   $0xa,-0x64(%rbp)
  14052a:	e9 9d 00 00 00       	jmp    1405cc <printer::vprintf(int, char const*, __va_list_tag*)+0x39a>
  14052f:	b8 00 00 00 00       	mov    $0x0,%eax
  140534:	c7 45 9c 0a 00 00 00 	movl   $0xa,-0x64(%rbp)
  14053b:	e9 8c 00 00 00       	jmp    1405cc <printer::vprintf(int, char const*, __va_list_tag*)+0x39a>
  140540:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  140544:	b8 00 00 00 00       	mov    $0x0,%eax
  140549:	c7 45 9c 0a 00 00 00 	movl   $0xa,-0x64(%rbp)
  140550:	eb 7a                	jmp    1405cc <printer::vprintf(int, char const*, __va_list_tag*)+0x39a>
  140552:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  140556:	b8 00 00 00 00       	mov    $0x0,%eax
  14055b:	c7 45 9c 0a 00 00 00 	movl   $0xa,-0x64(%rbp)
  140562:	eb 68                	jmp    1405cc <printer::vprintf(int, char const*, __va_list_tag*)+0x39a>
            num = length ? va_arg(val, unsigned long) : va_arg(val, unsigned);
  140564:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  140568:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  14056c:	48 8d 42 08          	lea    0x8(%rdx),%rax
  140570:	48 89 47 08          	mov    %rax,0x8(%rdi)
  140574:	eb 70                	jmp    1405e6 <printer::vprintf(int, char const*, __va_list_tag*)+0x3b4>
  140576:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  14057a:	8b 01                	mov    (%rcx),%eax
  14057c:	83 f8 2f             	cmp    $0x2f,%eax
  14057f:	77 10                	ja     140591 <printer::vprintf(int, char const*, __va_list_tag*)+0x35f>
  140581:	89 c2                	mov    %eax,%edx
  140583:	48 03 51 10          	add    0x10(%rcx),%rdx
  140587:	83 c0 08             	add    $0x8,%eax
  14058a:	89 01                	mov    %eax,(%rcx)
  14058c:	44 8b 1a             	mov    (%rdx),%r11d
  14058f:	eb 58                	jmp    1405e9 <printer::vprintf(int, char const*, __va_list_tag*)+0x3b7>
  140591:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  140595:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  140599:	48 8d 42 08          	lea    0x8(%rdx),%rax
  14059d:	48 89 41 08          	mov    %rax,0x8(%rcx)
  1405a1:	eb e9                	jmp    14058c <printer::vprintf(int, char const*, __va_list_tag*)+0x35a>
        switch (*format) {
  1405a3:	b8 01 00 00 00       	mov    $0x1,%eax
  1405a8:	eb 1b                	jmp    1405c5 <printer::vprintf(int, char const*, __va_list_tag*)+0x393>
  1405aa:	b8 00 00 00 00       	mov    $0x0,%eax
  1405af:	eb 14                	jmp    1405c5 <printer::vprintf(int, char const*, __va_list_tag*)+0x393>
  1405b1:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  1405b5:	b8 00 00 00 00       	mov    $0x0,%eax
  1405ba:	eb 09                	jmp    1405c5 <printer::vprintf(int, char const*, __va_list_tag*)+0x393>
  1405bc:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  1405c0:	b8 00 00 00 00       	mov    $0x0,%eax
            base = -16;
  1405c5:	c7 45 9c f0 ff ff ff 	movl   $0xfffffff0,-0x64(%rbp)
            num = length ? va_arg(val, unsigned long) : va_arg(val, unsigned);
  1405cc:	85 c0                	test   %eax,%eax
  1405ce:	74 a6                	je     140576 <printer::vprintf(int, char const*, __va_list_tag*)+0x344>
  1405d0:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  1405d4:	8b 07                	mov    (%rdi),%eax
  1405d6:	83 f8 2f             	cmp    $0x2f,%eax
  1405d9:	77 89                	ja     140564 <printer::vprintf(int, char const*, __va_list_tag*)+0x332>
  1405db:	89 c2                	mov    %eax,%edx
  1405dd:	48 03 57 10          	add    0x10(%rdi),%rdx
  1405e1:	83 c0 08             	add    $0x8,%eax
  1405e4:	89 07                	mov    %eax,(%rdi)
  1405e6:	4c 8b 1a             	mov    (%rdx),%r11
            flags |= FLAG_NUMERIC;
  1405e9:	8b 45 a4             	mov    -0x5c(%rbp),%eax
  1405ec:	83 c8 40             	or     $0x40,%eax
    if (base < 0) {
  1405ef:	83 7d 9c 00          	cmpl   $0x0,-0x64(%rbp)
  1405f3:	0f 89 ea 02 00 00    	jns    1408e3 <printer::vprintf(int, char const*, __va_list_tag*)+0x6b1>
    *--pos = '\0';
  1405f9:	c6 45 cf 00          	movb   $0x0,-0x31(%rbp)
    if (flags & FLAG_THOUSANDS) {
  1405fd:	a8 20                	test   $0x20,%al
  1405ff:	0f 85 0d 03 00 00    	jne    140912 <printer::vprintf(int, char const*, __va_list_tag*)+0x6e0>
  140605:	89 45 a4             	mov    %eax,-0x5c(%rbp)
        digits = lower_digits;
  140608:	41 ba 20 13 14 00    	mov    $0x141320,%r10d
        base = -base;
  14060e:	41 b9 10 00 00 00    	mov    $0x10,%r9d
    if (flags & FLAG_THOUSANDS) {
  140614:	c7 45 98 40 00 00 00 	movl   $0x40,-0x68(%rbp)
        thousands_pos = nullptr;
  14061b:	bf 00 00 00 00       	mov    $0x0,%edi
  140620:	e9 0f 03 00 00       	jmp    140934 <printer::vprintf(int, char const*, __va_list_tag*)+0x702>
        switch (*format) {
  140625:	b8 01 00 00 00       	mov    $0x1,%eax
  14062a:	eb 1b                	jmp    140647 <printer::vprintf(int, char const*, __va_list_tag*)+0x415>
  14062c:	b8 00 00 00 00       	mov    $0x0,%eax
  140631:	eb 14                	jmp    140647 <printer::vprintf(int, char const*, __va_list_tag*)+0x415>
  140633:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  140637:	b8 00 00 00 00       	mov    $0x0,%eax
  14063c:	eb 09                	jmp    140647 <printer::vprintf(int, char const*, __va_list_tag*)+0x415>
  14063e:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  140642:	b8 00 00 00 00       	mov    $0x0,%eax
            base = 16;
  140647:	c7 45 9c 10 00 00 00 	movl   $0x10,-0x64(%rbp)
            goto format_unsigned;
  14064e:	e9 79 ff ff ff       	jmp    1405cc <printer::vprintf(int, char const*, __va_list_tag*)+0x39a>
        switch (*format) {
  140653:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  140657:	eb 04                	jmp    14065d <printer::vprintf(int, char const*, __va_list_tag*)+0x42b>
  140659:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            num = (uintptr_t) va_arg(val, void*);
  14065d:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  140661:	8b 01                	mov    (%rcx),%eax
  140663:	83 f8 2f             	cmp    $0x2f,%eax
  140666:	77 22                	ja     14068a <printer::vprintf(int, char const*, __va_list_tag*)+0x458>
  140668:	89 c2                	mov    %eax,%edx
  14066a:	48 03 51 10          	add    0x10(%rcx),%rdx
  14066e:	83 c0 08             	add    $0x8,%eax
  140671:	89 01                	mov    %eax,(%rcx)
  140673:	4c 8b 1a             	mov    (%rdx),%r11
            flags |= FLAG_ALT | FLAG_ALT2 | FLAG_NUMERIC;
  140676:	8b 45 a4             	mov    -0x5c(%rbp),%eax
  140679:	0d 41 02 00 00       	or     $0x241,%eax
            base = -16;
  14067e:	c7 45 9c f0 ff ff ff 	movl   $0xfffffff0,-0x64(%rbp)
  140685:	e9 6f ff ff ff       	jmp    1405f9 <printer::vprintf(int, char const*, __va_list_tag*)+0x3c7>
            num = (uintptr_t) va_arg(val, void*);
  14068a:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  14068e:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  140692:	48 8d 42 08          	lea    0x8(%rdx),%rax
  140696:	48 89 47 08          	mov    %rax,0x8(%rdi)
  14069a:	eb d7                	jmp    140673 <printer::vprintf(int, char const*, __va_list_tag*)+0x441>
        switch (*format) {
  14069c:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  1406a0:	eb 04                	jmp    1406a6 <printer::vprintf(int, char const*, __va_list_tag*)+0x474>
  1406a2:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            data = va_arg(val, char*);
  1406a6:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  1406aa:	8b 07                	mov    (%rdi),%eax
  1406ac:	83 f8 2f             	cmp    $0x2f,%eax
  1406af:	0f 87 70 01 00 00    	ja     140825 <printer::vprintf(int, char const*, __va_list_tag*)+0x5f3>
  1406b5:	89 c2                	mov    %eax,%edx
  1406b7:	48 03 57 10          	add    0x10(%rdi),%rdx
  1406bb:	83 c0 08             	add    $0x8,%eax
  1406be:	89 07                	mov    %eax,(%rdi)
  1406c0:	48 8b 1a             	mov    (%rdx),%rbx
        unsigned long num = 0;
  1406c3:	41 bb 00 00 00 00    	mov    $0x0,%r11d
        if (flags & FLAG_NUMERIC) {
  1406c9:	8b 45 a4             	mov    -0x5c(%rbp),%eax
  1406cc:	83 e0 40             	and    $0x40,%eax
  1406cf:	89 45 98             	mov    %eax,-0x68(%rbp)
        const char* prefix = "";
  1406d2:	41 bc 51 0c 14 00    	mov    $0x140c51,%r12d
        if (flags & FLAG_NUMERIC) {
  1406d8:	0f 85 f8 03 00 00    	jne    140ad6 <printer::vprintf(int, char const*, __va_list_tag*)+0x8a4>
        if (precision >= 0 && !(flags & FLAG_NUMERIC)) {
  1406de:	8b 7d a0             	mov    -0x60(%rbp),%edi
  1406e1:	89 f8                	mov    %edi,%eax
  1406e3:	f7 d0                	not    %eax
  1406e5:	c1 e8 1f             	shr    $0x1f,%eax
  1406e8:	89 45 8c             	mov    %eax,-0x74(%rbp)
  1406eb:	83 7d 98 00          	cmpl   $0x0,-0x68(%rbp)
  1406ef:	0f 85 63 03 00 00    	jne    140a58 <printer::vprintf(int, char const*, __va_list_tag*)+0x826>
  1406f5:	84 c0                	test   %al,%al
  1406f7:	0f 84 5b 03 00 00    	je     140a58 <printer::vprintf(int, char const*, __va_list_tag*)+0x826>
            datalen = strnlen(data, precision);
  1406fd:	48 63 f7             	movslq %edi,%rsi
  140700:	48 89 df             	mov    %rbx,%rdi
  140703:	e8 1a fa ff ff       	call   140122 <strnlen>
  140708:	89 45 9c             	mov    %eax,-0x64(%rbp)
                   && datalen + (int) strlen(prefix) < width) {
  14070b:	8b 45 a4             	mov    -0x5c(%rbp),%eax
  14070e:	83 e0 46             	and    $0x46,%eax
            zeros = 0;
  140711:	c7 45 a0 00 00 00 00 	movl   $0x0,-0x60(%rbp)
                   && datalen + (int) strlen(prefix) < width) {
  140718:	83 f8 42             	cmp    $0x42,%eax
  14071b:	0f 84 6f 03 00 00    	je     140a90 <printer::vprintf(int, char const*, __va_list_tag*)+0x85e>
        width -= datalen + zeros + strlen(prefix);
  140721:	4c 89 e7             	mov    %r12,%rdi
  140724:	e8 da f9 ff ff       	call   140103 <strlen>
  140729:	8b 7d a0             	mov    -0x60(%rbp),%edi
  14072c:	8b 4d 9c             	mov    -0x64(%rbp),%ecx
  14072f:	01 f9                	add    %edi,%ecx
  140731:	44 89 f2             	mov    %r14d,%edx
  140734:	29 ca                	sub    %ecx,%edx
  140736:	29 c2                	sub    %eax,%edx
  140738:	41 89 d6             	mov    %edx,%r14d
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
  14073b:	f6 45 a4 04          	testb  $0x4,-0x5c(%rbp)
  14073f:	75 32                	jne    140773 <printer::vprintf(int, char const*, __va_list_tag*)+0x541>
  140741:	85 d2                	test   %edx,%edx
  140743:	7e 2e                	jle    140773 <printer::vprintf(int, char const*, __va_list_tag*)+0x541>
        width -= datalen + zeros + strlen(prefix);
  140745:	89 55 a4             	mov    %edx,-0x5c(%rbp)
            putc(' ', color);
  140748:	49 8b 07             	mov    (%r15),%rax
  14074b:	44 89 ea             	mov    %r13d,%edx
  14074e:	be 20 00 00 00       	mov    $0x20,%esi
  140753:	4c 89 ff             	mov    %r15,%rdi
  140756:	ff 10                	call   *(%rax)
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
  140758:	41 83 ee 01          	sub    $0x1,%r14d
  14075c:	45 85 f6             	test   %r14d,%r14d
  14075f:	7f e7                	jg     140748 <printer::vprintf(int, char const*, __va_list_tag*)+0x516>
  140761:	8b 55 a4             	mov    -0x5c(%rbp),%edx
  140764:	85 d2                	test   %edx,%edx
  140766:	b8 01 00 00 00       	mov    $0x1,%eax
  14076b:	0f 4f c2             	cmovg  %edx,%eax
  14076e:	29 c2                	sub    %eax,%edx
  140770:	41 89 d6             	mov    %edx,%r14d
        for (; *prefix; ++prefix) {
  140773:	41 0f b6 04 24       	movzbl (%r12),%eax
  140778:	84 c0                	test   %al,%al
  14077a:	74 1b                	je     140797 <printer::vprintf(int, char const*, __va_list_tag*)+0x565>
            putc(*prefix, color);
  14077c:	0f b6 f0             	movzbl %al,%esi
  14077f:	49 8b 07             	mov    (%r15),%rax
  140782:	44 89 ea             	mov    %r13d,%edx
  140785:	4c 89 ff             	mov    %r15,%rdi
  140788:	ff 10                	call   *(%rax)
        for (; *prefix; ++prefix) {
  14078a:	49 83 c4 01          	add    $0x1,%r12
  14078e:	41 0f b6 04 24       	movzbl (%r12),%eax
  140793:	84 c0                	test   %al,%al
  140795:	75 e5                	jne    14077c <printer::vprintf(int, char const*, __va_list_tag*)+0x54a>
        for (; zeros > 0; --zeros) {
  140797:	44 8b 65 a0          	mov    -0x60(%rbp),%r12d
  14079b:	45 85 e4             	test   %r12d,%r12d
  14079e:	7e 16                	jle    1407b6 <printer::vprintf(int, char const*, __va_list_tag*)+0x584>
            putc('0', color);
  1407a0:	49 8b 07             	mov    (%r15),%rax
  1407a3:	44 89 ea             	mov    %r13d,%edx
  1407a6:	be 30 00 00 00       	mov    $0x30,%esi
  1407ab:	4c 89 ff             	mov    %r15,%rdi
  1407ae:	ff 10                	call   *(%rax)
        for (; zeros > 0; --zeros) {
  1407b0:	41 83 ec 01          	sub    $0x1,%r12d
  1407b4:	75 ea                	jne    1407a0 <printer::vprintf(int, char const*, __va_list_tag*)+0x56e>
        for (; datalen > 0; ++data, --datalen) {
  1407b6:	8b 45 9c             	mov    -0x64(%rbp),%eax
  1407b9:	85 c0                	test   %eax,%eax
  1407bb:	7e 1d                	jle    1407da <printer::vprintf(int, char const*, __va_list_tag*)+0x5a8>
  1407bd:	41 89 c4             	mov    %eax,%r12d
  1407c0:	49 01 dc             	add    %rbx,%r12
            putc(*data, color);
  1407c3:	0f b6 33             	movzbl (%rbx),%esi
  1407c6:	49 8b 07             	mov    (%r15),%rax
  1407c9:	44 89 ea             	mov    %r13d,%edx
  1407cc:	4c 89 ff             	mov    %r15,%rdi
  1407cf:	ff 10                	call   *(%rax)
        for (; datalen > 0; ++data, --datalen) {
  1407d1:	48 83 c3 01          	add    $0x1,%rbx
  1407d5:	49 39 dc             	cmp    %rbx,%r12
  1407d8:	75 e9                	jne    1407c3 <printer::vprintf(int, char const*, __va_list_tag*)+0x591>
        for (; width > 0; --width) {
  1407da:	45 85 f6             	test   %r14d,%r14d
  1407dd:	7e 16                	jle    1407f5 <printer::vprintf(int, char const*, __va_list_tag*)+0x5c3>
            putc(' ', color);
  1407df:	49 8b 07             	mov    (%r15),%rax
  1407e2:	44 89 ea             	mov    %r13d,%edx
  1407e5:	be 20 00 00 00       	mov    $0x20,%esi
  1407ea:	4c 89 ff             	mov    %r15,%rdi
  1407ed:	ff 10                	call   *(%rax)
        for (; width > 0; --width) {
  1407ef:	41 83 ee 01          	sub    $0x1,%r14d
  1407f3:	75 ea                	jne    1407df <printer::vprintf(int, char const*, __va_list_tag*)+0x5ad>
    for (; *format; ++format) {
  1407f5:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  1407f9:	4c 8d 60 01          	lea    0x1(%rax),%r12
  1407fd:	0f b6 40 01          	movzbl 0x1(%rax),%eax
  140801:	84 c0                	test   %al,%al
  140803:	0f 84 56 fa ff ff    	je     14025f <printer::vprintf(int, char const*, __va_list_tag*)+0x2d>
        if (*format != '%') {
  140809:	3c 25                	cmp    $0x25,%al
  14080b:	0f 84 5d fa ff ff    	je     14026e <printer::vprintf(int, char const*, __va_list_tag*)+0x3c>
            putc(*format, color);
  140811:	0f b6 f0             	movzbl %al,%esi
  140814:	49 8b 07             	mov    (%r15),%rax
  140817:	44 89 ea             	mov    %r13d,%edx
  14081a:	4c 89 ff             	mov    %r15,%rdi
  14081d:	ff 10                	call   *(%rax)
            continue;
  14081f:	4c 89 65 a8          	mov    %r12,-0x58(%rbp)
  140823:	eb d0                	jmp    1407f5 <printer::vprintf(int, char const*, __va_list_tag*)+0x5c3>
            data = va_arg(val, char*);
  140825:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  140829:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  14082d:	48 8d 42 08          	lea    0x8(%rdx),%rax
  140831:	48 89 41 08          	mov    %rax,0x8(%rcx)
  140835:	e9 86 fe ff ff       	jmp    1406c0 <printer::vprintf(int, char const*, __va_list_tag*)+0x48e>
        switch (*format) {
  14083a:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  14083e:	eb 04                	jmp    140844 <printer::vprintf(int, char const*, __va_list_tag*)+0x612>
  140840:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            color = va_arg(val, int);
  140844:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  140848:	8b 01                	mov    (%rcx),%eax
  14084a:	83 f8 2f             	cmp    $0x2f,%eax
  14084d:	77 10                	ja     14085f <printer::vprintf(int, char const*, __va_list_tag*)+0x62d>
  14084f:	89 c2                	mov    %eax,%edx
  140851:	48 03 51 10          	add    0x10(%rcx),%rdx
  140855:	83 c0 08             	add    $0x8,%eax
  140858:	89 01                	mov    %eax,(%rcx)
  14085a:	44 8b 2a             	mov    (%rdx),%r13d
            continue;
  14085d:	eb 96                	jmp    1407f5 <printer::vprintf(int, char const*, __va_list_tag*)+0x5c3>
            color = va_arg(val, int);
  14085f:	48 8b 5d 90          	mov    -0x70(%rbp),%rbx
  140863:	48 8b 53 08          	mov    0x8(%rbx),%rdx
  140867:	48 8d 42 08          	lea    0x8(%rdx),%rax
  14086b:	48 89 43 08          	mov    %rax,0x8(%rbx)
  14086f:	eb e9                	jmp    14085a <printer::vprintf(int, char const*, __va_list_tag*)+0x628>
        switch (*format) {
  140871:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  140875:	eb 04                	jmp    14087b <printer::vprintf(int, char const*, __va_list_tag*)+0x649>
  140877:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            numbuf[0] = va_arg(val, int);
  14087b:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  14087f:	8b 07                	mov    (%rdi),%eax
  140881:	83 f8 2f             	cmp    $0x2f,%eax
  140884:	77 23                	ja     1408a9 <printer::vprintf(int, char const*, __va_list_tag*)+0x677>
  140886:	89 c2                	mov    %eax,%edx
  140888:	48 03 57 10          	add    0x10(%rdi),%rdx
  14088c:	83 c0 08             	add    $0x8,%eax
  14088f:	89 07                	mov    %eax,(%rdi)
  140891:	8b 02                	mov    (%rdx),%eax
  140893:	88 45 b0             	mov    %al,-0x50(%rbp)
            numbuf[1] = '\0';
  140896:	c6 45 b1 00          	movb   $0x0,-0x4f(%rbp)
            data = numbuf;
  14089a:	48 8d 5d b0          	lea    -0x50(%rbp),%rbx
        unsigned long num = 0;
  14089e:	41 bb 00 00 00 00    	mov    $0x0,%r11d
            break;
  1408a4:	e9 20 fe ff ff       	jmp    1406c9 <printer::vprintf(int, char const*, __va_list_tag*)+0x497>
            numbuf[0] = va_arg(val, int);
  1408a9:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  1408ad:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  1408b1:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1408b5:	48 89 47 08          	mov    %rax,0x8(%rdi)
  1408b9:	eb d6                	jmp    140891 <printer::vprintf(int, char const*, __va_list_tag*)+0x65f>
        switch (*format) {
  1408bb:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            numbuf[0] = (*format ? *format : '%');
  1408bf:	84 c0                	test   %al,%al
  1408c1:	0f 85 f1 01 00 00    	jne    140ab8 <printer::vprintf(int, char const*, __va_list_tag*)+0x886>
  1408c7:	c6 45 b0 25          	movb   $0x25,-0x50(%rbp)
            numbuf[1] = '\0';
  1408cb:	c6 45 b1 00          	movb   $0x0,-0x4f(%rbp)
                format--;
  1408cf:	48 83 6d a8 01       	subq   $0x1,-0x58(%rbp)
            data = numbuf;
  1408d4:	48 8d 5d b0          	lea    -0x50(%rbp),%rbx
        unsigned long num = 0;
  1408d8:	41 bb 00 00 00 00    	mov    $0x0,%r11d
  1408de:	e9 e6 fd ff ff       	jmp    1406c9 <printer::vprintf(int, char const*, __va_list_tag*)+0x497>
    *--pos = '\0';
  1408e3:	c6 45 cf 00          	movb   $0x0,-0x31(%rbp)
    if (flags & FLAG_THOUSANDS) {
  1408e7:	f6 45 a4 20          	testb  $0x20,-0x5c(%rbp)
  1408eb:	74 73                	je     140960 <printer::vprintf(int, char const*, __va_list_tag*)+0x72e>
        thousands_pos = pos - (base == 10 ? 3 : 4);
  1408ed:	8b 5d 9c             	mov    -0x64(%rbp),%ebx
  1408f0:	41 89 d9             	mov    %ebx,%r9d
  1408f3:	89 45 a4             	mov    %eax,-0x5c(%rbp)
  1408f6:	41 ba 40 13 14 00    	mov    $0x141340,%r10d
  1408fc:	c7 45 98 40 00 00 00 	movl   $0x40,-0x68(%rbp)
  140903:	83 fb 0a             	cmp    $0xa,%ebx
  140906:	0f 94 c0             	sete   %al
  140909:	0f b6 c0             	movzbl %al,%eax
  14090c:	48 83 e8 04          	sub    $0x4,%rax
  140910:	eb 1d                	jmp    14092f <printer::vprintf(int, char const*, __va_list_tag*)+0x6fd>
    if (flags & FLAG_THOUSANDS) {
  140912:	89 45 a4             	mov    %eax,-0x5c(%rbp)
        digits = lower_digits;
  140915:	41 ba 20 13 14 00    	mov    $0x141320,%r10d
        base = -base;
  14091b:	41 b9 10 00 00 00    	mov    $0x10,%r9d
    if (flags & FLAG_THOUSANDS) {
  140921:	c7 45 98 40 00 00 00 	movl   $0x40,-0x68(%rbp)
        thousands_pos = pos - (base == 10 ? 3 : 4);
  140928:	48 c7 c0 fc ff ff ff 	mov    $0xfffffffffffffffc,%rax
  14092f:	48 8d 7c 05 cf       	lea    -0x31(%rbp,%rax,1),%rdi
  140934:	48 8d 4d ce          	lea    -0x32(%rbp),%rcx
        thousands_pos = nullptr;
  140938:	4c 89 d8             	mov    %r11,%rax
            *--pos = digits[val % base];
  14093b:	49 63 f1             	movslq %r9d,%rsi
    } while (val != 0 && pos != buf);
  14093e:	4c 8d 45 b0          	lea    -0x50(%rbp),%r8
  140942:	eb 57                	jmp    14099b <printer::vprintf(int, char const*, __va_list_tag*)+0x769>
    if (flags & FLAG_THOUSANDS) {
  140944:	41 ba 40 13 14 00    	mov    $0x141340,%r10d
  14094a:	41 b9 0a 00 00 00    	mov    $0xa,%r9d
  140950:	c7 45 9c 0a 00 00 00 	movl   $0xa,-0x64(%rbp)
        thousands_pos = pos - (base == 10 ? 3 : 4);
  140957:	48 c7 c0 fd ff ff ff 	mov    $0xfffffffffffffffd,%rax
  14095e:	eb cf                	jmp    14092f <printer::vprintf(int, char const*, __va_list_tag*)+0x6fd>
  140960:	44 8b 4d 9c          	mov    -0x64(%rbp),%r9d
  140964:	89 45 a4             	mov    %eax,-0x5c(%rbp)
  140967:	41 ba 40 13 14 00    	mov    $0x141340,%r10d
  14096d:	c7 45 98 40 00 00 00 	movl   $0x40,-0x68(%rbp)
        thousands_pos = nullptr;
  140974:	bf 00 00 00 00       	mov    $0x0,%edi
  140979:	eb b9                	jmp    140934 <printer::vprintf(int, char const*, __va_list_tag*)+0x702>
            *--pos = digits[val % base];
  14097b:	48 89 cb             	mov    %rcx,%rbx
  14097e:	ba 00 00 00 00       	mov    $0x0,%edx
  140983:	48 f7 f6             	div    %rsi
  140986:	41 0f b6 14 12       	movzbl (%r10,%rdx,1),%edx
  14098b:	88 11                	mov    %dl,(%rcx)
    } while (val != 0 && pos != buf);
  14098d:	48 83 e9 01          	sub    $0x1,%rcx
  140991:	48 85 c0             	test   %rax,%rax
  140994:	74 2d                	je     1409c3 <printer::vprintf(int, char const*, __va_list_tag*)+0x791>
  140996:	4c 39 c3             	cmp    %r8,%rbx
  140999:	74 28                	je     1409c3 <printer::vprintf(int, char const*, __va_list_tag*)+0x791>
        if (pos == thousands_pos) {
  14099b:	48 8d 51 01          	lea    0x1(%rcx),%rdx
  14099f:	48 39 d7             	cmp    %rdx,%rdi
  1409a2:	75 d7                	jne    14097b <printer::vprintf(int, char const*, __va_list_tag*)+0x749>
            *--pos = base == 10 ? ',' : '\'';
  1409a4:	48 89 cb             	mov    %rcx,%rbx
  1409a7:	41 83 f9 0a          	cmp    $0xa,%r9d
  1409ab:	0f 94 c2             	sete   %dl
  1409ae:	8d 54 92 27          	lea    0x27(%rdx,%rdx,4),%edx
  1409b2:	40 0f 94 c7          	sete   %dil
  1409b6:	40 0f b6 ff          	movzbl %dil,%edi
  1409ba:	88 11                	mov    %dl,(%rcx)
            thousands_pos = pos - (base == 10 ? 3 : 4);
  1409bc:	48 8d 7c 39 fc       	lea    -0x4(%rcx,%rdi,1),%rdi
  1409c1:	eb ca                	jmp    14098d <printer::vprintf(int, char const*, __va_list_tag*)+0x75b>
        if ((flags & FLAG_NUMERIC) && (flags & FLAG_SIGNED)) {
  1409c3:	8b 7d a4             	mov    -0x5c(%rbp),%edi
  1409c6:	89 f8                	mov    %edi,%eax
  1409c8:	f7 d0                	not    %eax
  1409ca:	a8 c0                	test   $0xc0,%al
  1409cc:	75 3c                	jne    140a0a <printer::vprintf(int, char const*, __va_list_tag*)+0x7d8>
                prefix = "-";
  1409ce:	41 bc 4e 0c 14 00    	mov    $0x140c4e,%r12d
            if (flags & FLAG_NEGATIVE) {
  1409d4:	f7 c7 00 01 00 00    	test   $0x100,%edi
  1409da:	0f 85 fe fc ff ff    	jne    1406de <printer::vprintf(int, char const*, __va_list_tag*)+0x4ac>
                prefix = "+";
  1409e0:	41 bc 49 0c 14 00    	mov    $0x140c49,%r12d
            } else if (flags & FLAG_PLUSPOSITIVE) {
  1409e6:	40 f6 c7 10          	test   $0x10,%dil
  1409ea:	0f 85 ee fc ff ff    	jne    1406de <printer::vprintf(int, char const*, __va_list_tag*)+0x4ac>
        const char* prefix = "";
  1409f0:	40 f6 c7 08          	test   $0x8,%dil
  1409f4:	ba 50 0c 14 00       	mov    $0x140c50,%edx
  1409f9:	b8 51 0c 14 00       	mov    $0x140c51,%eax
  1409fe:	48 0f 45 c2          	cmovne %rdx,%rax
  140a02:	49 89 c4             	mov    %rax,%r12
  140a05:	e9 d4 fc ff ff       	jmp    1406de <printer::vprintf(int, char const*, __va_list_tag*)+0x4ac>
  140a0a:	41 bc 51 0c 14 00    	mov    $0x140c51,%r12d
        } else if ((flags & FLAG_NUMERIC) && (flags & FLAG_ALT)
  140a10:	8b 4d a4             	mov    -0x5c(%rbp),%ecx
  140a13:	89 c8                	mov    %ecx,%eax
  140a15:	f7 d0                	not    %eax
  140a17:	a8 41                	test   $0x41,%al
  140a19:	0f 85 bf fc ff ff    	jne    1406de <printer::vprintf(int, char const*, __va_list_tag*)+0x4ac>
                   && (base == 16 || base == -16)
  140a1f:	8b 45 9c             	mov    -0x64(%rbp),%eax
  140a22:	83 c0 10             	add    $0x10,%eax
  140a25:	a9 df ff ff ff       	test   $0xffffffdf,%eax
  140a2a:	0f 85 ae fc ff ff    	jne    1406de <printer::vprintf(int, char const*, __va_list_tag*)+0x4ac>
                   && (num || (flags & FLAG_ALT2))) {
  140a30:	4d 85 db             	test   %r11,%r11
  140a33:	75 09                	jne    140a3e <printer::vprintf(int, char const*, __va_list_tag*)+0x80c>
  140a35:	f6 c5 02             	test   $0x2,%ch
  140a38:	0f 84 a0 fc ff ff    	je     1406de <printer::vprintf(int, char const*, __va_list_tag*)+0x4ac>
            prefix = (base == -16 ? "0x" : "0X");
  140a3e:	83 7d 9c f0          	cmpl   $0xfffffff0,-0x64(%rbp)
  140a42:	ba 4b 0c 14 00       	mov    $0x140c4b,%edx
  140a47:	b8 52 0c 14 00       	mov    $0x140c52,%eax
  140a4c:	48 0f 45 c2          	cmovne %rdx,%rax
  140a50:	49 89 c4             	mov    %rax,%r12
  140a53:	e9 86 fc ff ff       	jmp    1406de <printer::vprintf(int, char const*, __va_list_tag*)+0x4ac>
            datalen = strlen(data);
  140a58:	48 89 df             	mov    %rbx,%rdi
  140a5b:	e8 a3 f6 ff ff       	call   140103 <strlen>
  140a60:	89 45 9c             	mov    %eax,-0x64(%rbp)
            && precision >= 0) {
  140a63:	83 7d 98 00          	cmpl   $0x0,-0x68(%rbp)
  140a67:	0f 84 9e fc ff ff    	je     14070b <printer::vprintf(int, char const*, __va_list_tag*)+0x4d9>
  140a6d:	80 7d 8c 00          	cmpb   $0x0,-0x74(%rbp)
  140a71:	0f 84 94 fc ff ff    	je     14070b <printer::vprintf(int, char const*, __va_list_tag*)+0x4d9>
            zeros = precision > datalen ? precision - datalen : 0;
  140a77:	8b 7d a0             	mov    -0x60(%rbp),%edi
  140a7a:	89 fa                	mov    %edi,%edx
  140a7c:	29 c2                	sub    %eax,%edx
  140a7e:	39 c7                	cmp    %eax,%edi
  140a80:	b8 00 00 00 00       	mov    $0x0,%eax
  140a85:	0f 4f c2             	cmovg  %edx,%eax
  140a88:	89 45 a0             	mov    %eax,-0x60(%rbp)
  140a8b:	e9 91 fc ff ff       	jmp    140721 <printer::vprintf(int, char const*, __va_list_tag*)+0x4ef>
                   && datalen + (int) strlen(prefix) < width) {
  140a90:	4c 89 e7             	mov    %r12,%rdi
  140a93:	e8 6b f6 ff ff       	call   140103 <strlen>
  140a98:	8b 7d 9c             	mov    -0x64(%rbp),%edi
  140a9b:	8d 14 07             	lea    (%rdi,%rax,1),%edx
            zeros = width - datalen - strlen(prefix);
  140a9e:	44 89 f1             	mov    %r14d,%ecx
  140aa1:	29 f9                	sub    %edi,%ecx
  140aa3:	29 c1                	sub    %eax,%ecx
  140aa5:	44 39 f2             	cmp    %r14d,%edx
  140aa8:	b8 00 00 00 00       	mov    $0x0,%eax
  140aad:	0f 4c c1             	cmovl  %ecx,%eax
  140ab0:	89 45 a0             	mov    %eax,-0x60(%rbp)
  140ab3:	e9 69 fc ff ff       	jmp    140721 <printer::vprintf(int, char const*, __va_list_tag*)+0x4ef>
  140ab8:	48 8b 5d a8          	mov    -0x58(%rbp),%rbx
            numbuf[0] = (*format ? *format : '%');
  140abc:	88 45 b0             	mov    %al,-0x50(%rbp)
            numbuf[1] = '\0';
  140abf:	c6 45 b1 00          	movb   $0x0,-0x4f(%rbp)
  140ac3:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            data = numbuf;
  140ac7:	48 8d 5d b0          	lea    -0x50(%rbp),%rbx
        unsigned long num = 0;
  140acb:	41 bb 00 00 00 00    	mov    $0x0,%r11d
  140ad1:	e9 f3 fb ff ff       	jmp    1406c9 <printer::vprintf(int, char const*, __va_list_tag*)+0x497>
    *--pos = '\0';
  140ad6:	c6 45 cf 00          	movb   $0x0,-0x31(%rbp)
    if (flags & FLAG_THOUSANDS) {
  140ada:	f6 45 a4 20          	testb  $0x20,-0x5c(%rbp)
  140ade:	0f 85 60 fe ff ff    	jne    140944 <printer::vprintf(int, char const*, __va_list_tag*)+0x712>
  140ae4:	41 ba 40 13 14 00    	mov    $0x141340,%r10d
  140aea:	41 b9 0a 00 00 00    	mov    $0xa,%r9d
  140af0:	c7 45 9c 0a 00 00 00 	movl   $0xa,-0x64(%rbp)
        thousands_pos = nullptr;
  140af7:	bf 00 00 00 00       	mov    $0x0,%edi
  140afc:	e9 33 fe ff ff       	jmp    140934 <printer::vprintf(int, char const*, __va_list_tag*)+0x702>

0000000000140b01 <vsnprintf>:
};

ssize_t vsnprintf(char* s, size_t size, const char* format, va_list val) {
  140b01:	f3 0f 1e fa          	endbr64
  140b05:	55                   	push   %rbp
  140b06:	48 89 e5             	mov    %rsp,%rbp
  140b09:	53                   	push   %rbx
  140b0a:	48 83 ec 28          	sub    $0x28,%rsp
  140b0e:	48 89 f3             	mov    %rsi,%rbx
        : s_(s), end_(s + size), n_(0) {
  140b11:	48 c7 45 d0 68 13 14 	movq   $0x141368,-0x30(%rbp)
  140b18:	00 
  140b19:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  140b1d:	48 01 f7             	add    %rsi,%rdi
  140b20:	48 89 7d e0          	mov    %rdi,-0x20(%rbp)
  140b24:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
  140b2b:	00 
    string_printer sp(s, size);
    sp.vprintf(0, format, val);
  140b2c:	be 00 00 00 00       	mov    $0x0,%esi
  140b31:	48 8d 7d d0          	lea    -0x30(%rbp),%rdi
  140b35:	e8 f8 f6 ff ff       	call   140232 <printer::vprintf(int, char const*, __va_list_tag*)>
    if (size && sp.s_ < sp.end_) {
  140b3a:	48 85 db             	test   %rbx,%rbx
  140b3d:	74 10                	je     140b4f <vsnprintf+0x4e>
  140b3f:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  140b43:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  140b47:	48 39 c2             	cmp    %rax,%rdx
  140b4a:	73 0d                	jae    140b59 <vsnprintf+0x58>
        *sp.s_ = 0;
  140b4c:	c6 02 00             	movb   $0x0,(%rdx)
    } else if (size) {
        sp.end_[-1] = 0;
    }
    return sp.n_;
}
  140b4f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  140b53:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
  140b57:	c9                   	leave
  140b58:	c3                   	ret
        sp.end_[-1] = 0;
  140b59:	c6 40 ff 00          	movb   $0x0,-0x1(%rax)
  140b5d:	eb f0                	jmp    140b4f <vsnprintf+0x4e>

0000000000140b5f <snprintf>:

ssize_t snprintf(char* s, size_t size, const char* format, ...) {
  140b5f:	f3 0f 1e fa          	endbr64
  140b63:	55                   	push   %rbp
  140b64:	48 89 e5             	mov    %rsp,%rbp
  140b67:	48 83 ec 50          	sub    $0x50,%rsp
  140b6b:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  140b6f:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
  140b73:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
  140b77:	c7 45 b8 18 00 00 00 	movl   $0x18,-0x48(%rbp)
  140b7e:	48 8d 45 10          	lea    0x10(%rbp),%rax
  140b82:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
  140b86:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  140b8a:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    int n = vsnprintf(s, size, format, val);
  140b8e:	48 8d 4d b8          	lea    -0x48(%rbp),%rcx
  140b92:	e8 6a ff ff ff       	call   140b01 <vsnprintf>
    va_end(val);
    return n;
  140b97:	48 98                	cltq
}
  140b99:	c9                   	leave
  140b9a:	c3                   	ret

0000000000140b9b <assert_fail(char const*, int, char const*, char const*)>:
int error_vprintf(int cpos, int color, const char* format, va_list val) {
    return console_vprintf(cpos, color, format, val);
}

void assert_fail(const char* file, int line, const char* msg,
                 const char* description) {
  140b9b:	f3 0f 1e fa          	endbr64
  140b9f:	55                   	push   %rbp
  140ba0:	48 89 e5             	mov    %rsp,%rbp
  140ba3:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
  140baa:	41 89 f0             	mov    %esi,%r8d
    cursorpos = CPOS(23, 0);
  140bad:	c7 05 45 84 f7 ff 30 	movl   $0x730,-0x87bbb(%rip)        # b8ffc <cursorpos>
  140bb4:	07 00 00 
    char buf[240];
    if (description) {
  140bb7:	48 85 c9             	test   %rcx,%rcx
  140bba:	74 39                	je     140bf5 <assert_fail(char const*, int, char const*, char const*)+0x5a>
  140bbc:	49 89 c9             	mov    %rcx,%r9
        snprintf(buf, sizeof(buf),
  140bbf:	48 83 ec 08          	sub    $0x8,%rsp
  140bc3:	52                   	push   %rdx
  140bc4:	56                   	push   %rsi
  140bc5:	57                   	push   %rdi
  140bc6:	48 89 f9             	mov    %rdi,%rcx
  140bc9:	ba 70 13 14 00       	mov    $0x141370,%edx
  140bce:	be f0 00 00 00       	mov    $0xf0,%esi
  140bd3:	48 8d bd 10 ff ff ff 	lea    -0xf0(%rbp),%rdi
  140bda:	b0 00                	mov    $0x0,%al
  140bdc:	e8 7e ff ff ff       	call   140b5f <snprintf>
  140be1:	48 83 c4 20          	add    $0x20,%rsp
    register uintptr_t rax asm("rax") = syscallno;
  140be5:	b8 03 00 00 00       	mov    $0x3,%eax
    asm volatile ("syscall"
  140bea:	48 8d bd 10 ff ff ff 	lea    -0xf0(%rbp),%rdi
  140bf1:	0f 05                	syscall
//    Panic.
[[noreturn]] inline void sys_panic(const char* msg) {
    make_syscall(SYSCALL_PANIC, (uintptr_t) msg);

    // should never get here
    while (true) {
  140bf3:	eb fe                	jmp    140bf3 <assert_fail(char const*, int, char const*, char const*)+0x58>
                 "%s:%d: %s\n%s:%d: user assertion '%s' failed\n",
                 file, line, description, file, line, msg);
    } else {
        snprintf(buf, sizeof(buf),
  140bf5:	49 89 d1             	mov    %rdx,%r9
  140bf8:	48 89 f9             	mov    %rdi,%rcx
  140bfb:	ba a0 13 14 00       	mov    $0x1413a0,%edx
  140c00:	be f0 00 00 00       	mov    $0xf0,%esi
  140c05:	48 8d bd 10 ff ff ff 	lea    -0xf0(%rbp),%rdi
  140c0c:	b0 00                	mov    $0x0,%al
  140c0e:	e8 4c ff ff ff       	call   140b5f <snprintf>
  140c13:	eb d0                	jmp    140be5 <assert_fail(char const*, int, char const*, char const*)+0x4a>
