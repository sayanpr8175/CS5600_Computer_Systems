
obj/p-allocator3.full:     file format elf64-x86-64


Disassembly of section .text:

0000000000180000 <process_main()>:

// These global variables go on the data page.
uint8_t* heap_top;
uint8_t* stack_bottom;

void process_main() {
  180000:	f3 0f 1e fa          	endbr64
  180004:	55                   	push   %rbp
  180005:	48 89 e5             	mov    %rsp,%rbp
  180008:	41 54                	push   %r12
  18000a:	53                   	push   %rbx
// make_syscall
//    These functions define the WeensyOS system call calling convention.
//    We provide versions for system calls with 0-2 arguments.

__always_inline uintptr_t make_syscall(int syscallno) {
    register uintptr_t rax asm("rax") = syscallno;
  18000b:	b8 01 00 00 00       	mov    $0x1,%eax
    asm volatile ("syscall"
  180010:	0f 05                	syscall
            : "+a" (rax)
            : /* all input registers are also output registers */
            : "cc", "memory", "rcx", "rdx", "rsi", "rdi", "r8", "r9",
              "r10", "r11");
    return rax;
  180012:	49 89 c4             	mov    %rax,%r12


// sys_getpid
//    Return current process ID. (Never fails.)
inline pid_t sys_getpid() {
    return make_syscall(SYSCALL_GETPID);
  180015:	89 c3                	mov    %eax,%ebx
    pid_t p = sys_getpid();
    srand(p);
  180017:	89 c7                	mov    %eax,%edi
  180019:	e8 a7 01 00 00       	call   1801c5 <srand(unsigned int)>
//    Return the smallest multiple of `m` greater than or equal to `x`.
//    Equivalently, round `x` up to the nearest multiple of `m`.
template <typename T>
inline constexpr T round_up(T x, unsigned m) {
    static_assert(std::is_unsigned<T>::value, "T must be unsigned");
    return round_down(x + m - 1, m);
  18001e:	ba 1b 30 18 00       	mov    $0x18301b,%edx

    // The heap starts on the page right after the 'end' symbol,
    // whose address is the first address not allocated to process code
    // or data.
    heap_top = (uint8_t*) round_up((uintptr_t) end, PAGESIZE);
  180023:	48 81 e2 00 f0 ff ff 	and    $0xfffffffffffff000,%rdx
  18002a:	48 89 15 d7 1f 00 00 	mov    %rdx,0x1fd7(%rip)        # 182008 <heap_top>
    return x;
}

__always_inline uintptr_t rdrsp() {
    uintptr_t x;
    asm volatile("movq %%rsp, %0" : "=r" (x));
  180031:	48 89 e0             	mov    %rsp,%rax

    // The bottom of the stack is the first address on the current
    // stack page (this process never needs more than one stack page).
    stack_bottom = (uint8_t*) round_down((uintptr_t) rdrsp() - 1, PAGESIZE);
  180034:	48 83 e8 01          	sub    $0x1,%rax
  180038:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  18003e:	48 89 05 bb 1f 00 00 	mov    %rax,0x1fbb(%rip)        # 182000 <stack_bottom>

    // Allocate heap pages until (1) hit the stack (out of address space)
    // or (2) allocation fails (out of physical memory).
    while (heap_top != stack_bottom) {
  180045:	48 39 c2             	cmp    %rax,%rdx
  180048:	75 4f                	jne    180099 <process_main()+0x99>
    register uintptr_t rax asm("rax") = syscallno;
  18004a:	b8 02 00 00 00       	mov    $0x2,%eax
    asm volatile ("syscall"
  18004f:	0f 05                	syscall
        }
        sys_yield();
    }

    // After running out of memory, do nothing forever
    while (true) {
  180051:	eb f7                	jmp    18004a <process_main()+0x4a>
                assert(*l == 0);
  180053:	b9 00 00 00 00       	mov    $0x0,%ecx
  180058:	ba 20 0c 18 00       	mov    $0x180c20,%edx
  18005d:	be 24 00 00 00       	mov    $0x24,%esi
  180062:	bf 28 0c 18 00       	mov    $0x180c28,%edi
  180067:	e8 2f 0b 00 00       	call   180b9b <assert_fail(char const*, int, char const*, char const*)>
            *heap_top = p;
  18006c:	44 88 21             	mov    %r12b,(%rcx)
            console[CPOS(24, 79)] = p;
  18006f:	66 44 89 25 27 8f f3 	mov    %r12w,-0xc70d9(%rip)        # b8f9e <console+0xf9e>
  180076:	ff 
            heap_top += PAGESIZE;
  180077:	48 81 05 86 1f 00 00 	addq   $0x1000,0x1f86(%rip)        # 182008 <heap_top>
  18007e:	00 10 00 00 
    register uintptr_t rax asm("rax") = syscallno;
  180082:	b8 02 00 00 00       	mov    $0x2,%eax
    asm volatile ("syscall"
  180087:	0f 05                	syscall
    while (heap_top != stack_bottom) {
  180089:	48 8b 05 70 1f 00 00 	mov    0x1f70(%rip),%rax        # 182000 <stack_bottom>
  180090:	48 39 05 71 1f 00 00 	cmp    %rax,0x1f71(%rip)        # 182008 <heap_top>
  180097:	74 b1                	je     18004a <process_main()+0x4a>
        if (rand(0, ALLOC_SLOWDOWN - 1) < p) {
  180099:	be 09 00 00 00       	mov    $0x9,%esi
  18009e:	bf 00 00 00 00       	mov    $0x0,%edi
  1800a3:	e8 3c 01 00 00       	call   1801e4 <rand(int, int)>
  1800a8:	39 d8                	cmp    %ebx,%eax
  1800aa:	7d d6                	jge    180082 <process_main()+0x82>
    register uintptr_t rax asm("rax") = syscallno;
  1800ac:	b8 04 00 00 00       	mov    $0x4,%eax
    asm volatile ("syscall"
  1800b1:	48 8b 3d 50 1f 00 00 	mov    0x1f50(%rip),%rdi        # 182008 <heap_top>
  1800b8:	0f 05                	syscall
            if (sys_page_alloc(heap_top) < 0) {
  1800ba:	85 c0                	test   %eax,%eax
  1800bc:	78 8c                	js     18004a <process_main()+0x4a>
            for (unsigned long* l = (unsigned long*) heap_top;
  1800be:	48 8b 0d 43 1f 00 00 	mov    0x1f43(%rip),%rcx        # 182008 <heap_top>
                 l != (unsigned long*) (heap_top + PAGESIZE);
  1800c5:	48 8d 91 00 10 00 00 	lea    0x1000(%rcx),%rdx
            for (unsigned long* l = (unsigned long*) heap_top;
  1800cc:	48 89 c8             	mov    %rcx,%rax
                assert(*l == 0);
  1800cf:	48 83 38 00          	cmpq   $0x0,(%rax)
  1800d3:	0f 85 7a ff ff ff    	jne    180053 <process_main()+0x53>
            for (unsigned long* l = (unsigned long*) heap_top;
  1800d9:	48 83 c0 08          	add    $0x8,%rax
                 l != (unsigned long*) (heap_top + PAGESIZE);
  1800dd:	48 39 d0             	cmp    %rdx,%rax
  1800e0:	75 ed                	jne    1800cf <process_main()+0xcf>
  1800e2:	eb 88                	jmp    18006c <process_main()+0x6c>

00000000001800e4 <string_printer::putc(unsigned char, int)>:
    char* end_;
    size_t n_;
    string_printer(char* s, size_t size)
        : s_(s), end_(s + size), n_(0) {
    }
    void putc(unsigned char c, int) override {
  1800e4:	f3 0f 1e fa          	endbr64
        if (s_ < end_) {
  1800e8:	48 8b 47 08          	mov    0x8(%rdi),%rax
  1800ec:	48 3b 47 10          	cmp    0x10(%rdi),%rax
  1800f0:	73 0b                	jae    1800fd <string_printer::putc(unsigned char, int)+0x19>
            *s_++ = c;
  1800f2:	48 8d 50 01          	lea    0x1(%rax),%rdx
  1800f6:	48 89 57 08          	mov    %rdx,0x8(%rdi)
  1800fa:	40 88 30             	mov    %sil,(%rax)
        }
        ++n_;
  1800fd:	48 83 47 18 01       	addq   $0x1,0x18(%rdi)
    }
  180102:	c3                   	ret

0000000000180103 <strlen>:
size_t strlen(const char* s) {
  180103:	f3 0f 1e fa          	endbr64
    for (n = 0; *s != '\0'; ++s) {
  180107:	80 3f 00             	cmpb   $0x0,(%rdi)
  18010a:	74 10                	je     18011c <strlen+0x19>
  18010c:	b8 00 00 00 00       	mov    $0x0,%eax
        ++n;
  180111:	48 83 c0 01          	add    $0x1,%rax
    for (n = 0; *s != '\0'; ++s) {
  180115:	80 3c 07 00          	cmpb   $0x0,(%rdi,%rax,1)
  180119:	75 f6                	jne    180111 <strlen+0xe>
  18011b:	c3                   	ret
  18011c:	b8 00 00 00 00       	mov    $0x0,%eax
}
  180121:	c3                   	ret

0000000000180122 <strnlen>:
size_t strnlen(const char* s, size_t maxlen) {
  180122:	f3 0f 1e fa          	endbr64
  180126:	48 89 f0             	mov    %rsi,%rax
    for (n = 0; n != maxlen && *s != '\0'; ++s) {
  180129:	ba 00 00 00 00       	mov    $0x0,%edx
  18012e:	48 85 f6             	test   %rsi,%rsi
  180131:	74 10                	je     180143 <strnlen+0x21>
  180133:	80 3c 17 00          	cmpb   $0x0,(%rdi,%rdx,1)
  180137:	74 0b                	je     180144 <strnlen+0x22>
        ++n;
  180139:	48 83 c2 01          	add    $0x1,%rdx
    for (n = 0; n != maxlen && *s != '\0'; ++s) {
  18013d:	48 39 d0             	cmp    %rdx,%rax
  180140:	75 f1                	jne    180133 <strnlen+0x11>
  180142:	c3                   	ret
  180143:	c3                   	ret
  180144:	48 89 d0             	mov    %rdx,%rax
}
  180147:	c3                   	ret

0000000000180148 <strchr>:
char* strchr(const char* s, int c) {
  180148:	f3 0f 1e fa          	endbr64
    while (*s != '\0' && *s != (char) c) {
  18014c:	0f b6 07             	movzbl (%rdi),%eax
  18014f:	84 c0                	test   %al,%al
  180151:	74 10                	je     180163 <strchr+0x1b>
  180153:	40 38 f0             	cmp    %sil,%al
  180156:	74 18                	je     180170 <strchr+0x28>
        ++s;
  180158:	48 83 c7 01          	add    $0x1,%rdi
    while (*s != '\0' && *s != (char) c) {
  18015c:	0f b6 07             	movzbl (%rdi),%eax
  18015f:	84 c0                	test   %al,%al
  180161:	75 f0                	jne    180153 <strchr+0xb>
        return (char*) s;
  180163:	40 84 f6             	test   %sil,%sil
  180166:	b8 00 00 00 00       	mov    $0x0,%eax
  18016b:	48 0f 44 c7          	cmove  %rdi,%rax
}
  18016f:	c3                   	ret
        return (char*) s;
  180170:	48 89 f8             	mov    %rdi,%rax
  180173:	c3                   	ret

0000000000180174 <rand()>:
int rand() {
  180174:	f3 0f 1e fa          	endbr64
    if (!rand_seed_set) {
  180178:	83 3d 99 1e 00 00 00 	cmpl   $0x0,0x1e99(%rip)        # 182018 <rand_seed_set>
  18017f:	74 27                	je     1801a8 <rand()+0x34>
    rand_seed = rand_seed * 6364136223846793005UL + 1;
  180181:	48 b8 2d 7f 95 4c 2d 	movabs $0x5851f42d4c957f2d,%rax
  180188:	f4 51 58 
  18018b:	48 0f af 05 7d 1e 00 	imul   0x1e7d(%rip),%rax        # 182010 <rand_seed>
  180192:	00 
  180193:	48 83 c0 01          	add    $0x1,%rax
  180197:	48 89 05 72 1e 00 00 	mov    %rax,0x1e72(%rip)        # 182010 <rand_seed>
    return (rand_seed >> 32) & RAND_MAX;
  18019e:	48 c1 e8 20          	shr    $0x20,%rax
  1801a2:	25 ff ff ff 7f       	and    $0x7fffffff,%eax
}
  1801a7:	c3                   	ret
    rand_seed = ((unsigned long) seed << 32) | seed;
  1801a8:	48 b8 9e 87 d4 30 9e 	movabs $0x30d4879e30d4879e,%rax
  1801af:	87 d4 30 
  1801b2:	48 89 05 57 1e 00 00 	mov    %rax,0x1e57(%rip)        # 182010 <rand_seed>
    rand_seed_set = 1;
  1801b9:	c7 05 55 1e 00 00 01 	movl   $0x1,0x1e55(%rip)        # 182018 <rand_seed_set>
  1801c0:	00 00 00 
}
  1801c3:	eb bc                	jmp    180181 <rand()+0xd>

00000000001801c5 <srand(unsigned int)>:
void srand(unsigned seed) {
  1801c5:	f3 0f 1e fa          	endbr64
    rand_seed = ((unsigned long) seed << 32) | seed;
  1801c9:	89 f8                	mov    %edi,%eax
  1801cb:	48 c1 e7 20          	shl    $0x20,%rdi
  1801cf:	48 01 c7             	add    %rax,%rdi
  1801d2:	48 89 3d 37 1e 00 00 	mov    %rdi,0x1e37(%rip)        # 182010 <rand_seed>
    rand_seed_set = 1;
  1801d9:	c7 05 35 1e 00 00 01 	movl   $0x1,0x1e35(%rip)        # 182018 <rand_seed_set>
  1801e0:	00 00 00 
}
  1801e3:	c3                   	ret

00000000001801e4 <rand(int, int)>:
int rand(int min, int max) {
  1801e4:	f3 0f 1e fa          	endbr64
  1801e8:	55                   	push   %rbp
  1801e9:	48 89 e5             	mov    %rsp,%rbp
  1801ec:	41 54                	push   %r12
  1801ee:	53                   	push   %rbx
    assert(min <= max);
  1801ef:	39 f7                	cmp    %esi,%edi
  1801f1:	7f 26                	jg     180219 <rand(int, int)+0x35>
  1801f3:	41 89 fc             	mov    %edi,%r12d
  1801f6:	89 f3                	mov    %esi,%ebx
    unsigned long r = rand();
  1801f8:	e8 77 ff ff ff       	call   180174 <rand()>
    return min + (r * (max - min + 1)) / ((unsigned long) RAND_MAX + 1);
  1801fd:	44 29 e3             	sub    %r12d,%ebx
  180200:	83 c3 01             	add    $0x1,%ebx
  180203:	48 63 db             	movslq %ebx,%rbx
    unsigned long r = rand();
  180206:	48 98                	cltq
    return min + (r * (max - min + 1)) / ((unsigned long) RAND_MAX + 1);
  180208:	48 0f af d8          	imul   %rax,%rbx
  18020c:	48 c1 eb 1f          	shr    $0x1f,%rbx
  180210:	41 8d 04 1c          	lea    (%r12,%rbx,1),%eax
}
  180214:	5b                   	pop    %rbx
  180215:	41 5c                	pop    %r12
  180217:	5d                   	pop    %rbp
  180218:	c3                   	ret
    assert(min <= max);
  180219:	b9 00 00 00 00       	mov    $0x0,%ecx
  18021e:	ba 37 0c 18 00       	mov    $0x180c37,%edx
  180223:	be 45 01 00 00       	mov    $0x145,%esi
  180228:	bf 42 0c 18 00       	mov    $0x180c42,%edi
  18022d:	e8 69 09 00 00       	call   180b9b <assert_fail(char const*, int, char const*, char const*)>

0000000000180232 <printer::vprintf(int, char const*, __va_list_tag*)>:
void printer::vprintf(int color, const char* format, va_list val) {
  180232:	f3 0f 1e fa          	endbr64
  180236:	55                   	push   %rbp
  180237:	48 89 e5             	mov    %rsp,%rbp
  18023a:	41 57                	push   %r15
  18023c:	41 56                	push   %r14
  18023e:	41 55                	push   %r13
  180240:	41 54                	push   %r12
  180242:	53                   	push   %rbx
  180243:	48 83 ec 58          	sub    $0x58,%rsp
  180247:	49 89 ff             	mov    %rdi,%r15
  18024a:	41 89 f5             	mov    %esi,%r13d
  18024d:	49 89 d4             	mov    %rdx,%r12
  180250:	48 89 4d 90          	mov    %rcx,-0x70(%rbp)
    for (; *format; ++format) {
  180254:	0f b6 02             	movzbl (%rdx),%eax
  180257:	84 c0                	test   %al,%al
  180259:	0f 85 aa 05 00 00    	jne    180809 <printer::vprintf(int, char const*, __va_list_tag*)+0x5d7>
}
  18025f:	48 83 c4 58          	add    $0x58,%rsp
  180263:	5b                   	pop    %rbx
  180264:	41 5c                	pop    %r12
  180266:	41 5d                	pop    %r13
  180268:	41 5e                	pop    %r14
  18026a:	41 5f                	pop    %r15
  18026c:	5d                   	pop    %rbp
  18026d:	c3                   	ret
        for (++format; *format; ++format) {
  18026e:	49 8d 5c 24 01       	lea    0x1(%r12),%rbx
  180273:	45 0f b6 64 24 01    	movzbl 0x1(%r12),%r12d
  180279:	45 84 e4             	test   %r12b,%r12b
  18027c:	0f 84 08 01 00 00    	je     18038a <printer::vprintf(int, char const*, __va_list_tag*)+0x158>
        int flags = 0;
  180282:	41 be 00 00 00 00    	mov    $0x0,%r14d
            const char* flagc = strchr(flag_chars, *format);
  180288:	41 0f be f4          	movsbl %r12b,%esi
  18028c:	bf 51 13 18 00       	mov    $0x181351,%edi
  180291:	e8 b2 fe ff ff       	call   180148 <strchr>
  180296:	48 89 c1             	mov    %rax,%rcx
            if (flagc) {
  180299:	48 85 c0             	test   %rax,%rax
  18029c:	74 74                	je     180312 <printer::vprintf(int, char const*, __va_list_tag*)+0xe0>
                flags |= 1 << (flagc - flag_chars);
  18029e:	48 81 e9 51 13 18 00 	sub    $0x181351,%rcx
  1802a5:	b8 01 00 00 00       	mov    $0x1,%eax
  1802aa:	d3 e0                	shl    %cl,%eax
  1802ac:	41 09 c6             	or     %eax,%r14d
        for (++format; *format; ++format) {
  1802af:	48 83 c3 01          	add    $0x1,%rbx
  1802b3:	44 0f b6 23          	movzbl (%rbx),%r12d
  1802b7:	45 84 e4             	test   %r12b,%r12b
  1802ba:	75 cc                	jne    180288 <printer::vprintf(int, char const*, __va_list_tag*)+0x56>
        int width = -1;
  1802bc:	44 89 75 a4          	mov    %r14d,-0x5c(%rbp)
  1802c0:	41 be ff ff ff ff    	mov    $0xffffffff,%r14d
        int precision = -1;
  1802c6:	c7 45 a0 ff ff ff ff 	movl   $0xffffffff,-0x60(%rbp)
        if (*format == '.') {
  1802cd:	80 3b 2e             	cmpb   $0x2e,(%rbx)
  1802d0:	0f 84 dc 00 00 00    	je     1803b2 <printer::vprintf(int, char const*, __va_list_tag*)+0x180>
        switch (*format) {
  1802d6:	0f b6 03             	movzbl (%rbx),%eax
  1802d9:	3c 6c                	cmp    $0x6c,%al
  1802db:	0f 84 77 01 00 00    	je     180458 <printer::vprintf(int, char const*, __va_list_tag*)+0x226>
  1802e1:	0f 8f 52 01 00 00    	jg     180439 <printer::vprintf(int, char const*, __va_list_tag*)+0x207>
  1802e7:	3c 68                	cmp    $0x68,%al
  1802e9:	0f 85 8c 01 00 00    	jne    18047b <printer::vprintf(int, char const*, __va_list_tag*)+0x249>
            ++format;
  1802ef:	48 8d 43 01          	lea    0x1(%rbx),%rax
  1802f3:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
        switch (*format) {
  1802f7:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
  1802fb:	8d 50 bd             	lea    -0x43(%rax),%edx
  1802fe:	80 fa 35             	cmp    $0x35,%dl
  180301:	0f 87 b8 05 00 00    	ja     1808bf <printer::vprintf(int, char const*, __va_list_tag*)+0x68d>
  180307:	0f b6 d2             	movzbl %dl,%edx
  18030a:	3e ff 24 d5 60 0c 18 	notrack jmp *0x180c60(,%rdx,8)
  180311:	00 
        if (*format >= '1' && *format <= '9') {
  180312:	44 89 75 a4          	mov    %r14d,-0x5c(%rbp)
  180316:	41 8d 44 24 cf       	lea    -0x31(%r12),%eax
  18031b:	3c 08                	cmp    $0x8,%al
  18031d:	77 31                	ja     180350 <printer::vprintf(int, char const*, __va_list_tag*)+0x11e>
            for (width = 0; *format >= '0' && *format <= '9'; ) {
  18031f:	0f b6 03             	movzbl (%rbx),%eax
  180322:	8d 50 d0             	lea    -0x30(%rax),%edx
  180325:	80 fa 09             	cmp    $0x9,%dl
  180328:	77 72                	ja     18039c <printer::vprintf(int, char const*, __va_list_tag*)+0x16a>
  18032a:	41 be 00 00 00 00    	mov    $0x0,%r14d
                width = 10 * width + *format++ - '0';
  180330:	48 83 c3 01          	add    $0x1,%rbx
  180334:	43 8d 14 b6          	lea    (%r14,%r14,4),%edx
  180338:	0f be c0             	movsbl %al,%eax
  18033b:	44 8d 74 50 d0       	lea    -0x30(%rax,%rdx,2),%r14d
            for (width = 0; *format >= '0' && *format <= '9'; ) {
  180340:	0f b6 03             	movzbl (%rbx),%eax
  180343:	8d 50 d0             	lea    -0x30(%rax),%edx
  180346:	80 fa 09             	cmp    $0x9,%dl
  180349:	76 e5                	jbe    180330 <printer::vprintf(int, char const*, __va_list_tag*)+0xfe>
  18034b:	e9 76 ff ff ff       	jmp    1802c6 <printer::vprintf(int, char const*, __va_list_tag*)+0x94>
        } else if (*format == '*') {
  180350:	41 80 fc 2a          	cmp    $0x2a,%r12b
  180354:	75 51                	jne    1803a7 <printer::vprintf(int, char const*, __va_list_tag*)+0x175>
            width = va_arg(val, int);
  180356:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  18035a:	8b 01                	mov    (%rcx),%eax
  18035c:	83 f8 2f             	cmp    $0x2f,%eax
  18035f:	77 17                	ja     180378 <printer::vprintf(int, char const*, __va_list_tag*)+0x146>
  180361:	89 c2                	mov    %eax,%edx
  180363:	48 03 51 10          	add    0x10(%rcx),%rdx
  180367:	83 c0 08             	add    $0x8,%eax
  18036a:	89 01                	mov    %eax,(%rcx)
  18036c:	44 8b 32             	mov    (%rdx),%r14d
            ++format;
  18036f:	48 83 c3 01          	add    $0x1,%rbx
  180373:	e9 4e ff ff ff       	jmp    1802c6 <printer::vprintf(int, char const*, __va_list_tag*)+0x94>
            width = va_arg(val, int);
  180378:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  18037c:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  180380:	48 8d 42 08          	lea    0x8(%rdx),%rax
  180384:	48 89 47 08          	mov    %rax,0x8(%rdi)
  180388:	eb e2                	jmp    18036c <printer::vprintf(int, char const*, __va_list_tag*)+0x13a>
        int flags = 0;
  18038a:	c7 45 a4 00 00 00 00 	movl   $0x0,-0x5c(%rbp)
        int width = -1;
  180391:	41 be ff ff ff ff    	mov    $0xffffffff,%r14d
  180397:	e9 2a ff ff ff       	jmp    1802c6 <printer::vprintf(int, char const*, __va_list_tag*)+0x94>
            for (width = 0; *format >= '0' && *format <= '9'; ) {
  18039c:	41 be 00 00 00 00    	mov    $0x0,%r14d
  1803a2:	e9 1f ff ff ff       	jmp    1802c6 <printer::vprintf(int, char const*, __va_list_tag*)+0x94>
        int width = -1;
  1803a7:	41 be ff ff ff ff    	mov    $0xffffffff,%r14d
  1803ad:	e9 14 ff ff ff       	jmp    1802c6 <printer::vprintf(int, char const*, __va_list_tag*)+0x94>
            ++format;
  1803b2:	48 8d 53 01          	lea    0x1(%rbx),%rdx
            if (*format >= '0' && *format <= '9') {
  1803b6:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
  1803ba:	8d 48 d0             	lea    -0x30(%rax),%ecx
  1803bd:	80 f9 09             	cmp    $0x9,%cl
  1803c0:	76 13                	jbe    1803d5 <printer::vprintf(int, char const*, __va_list_tag*)+0x1a3>
            } else if (*format == '*') {
  1803c2:	3c 2a                	cmp    $0x2a,%al
  1803c4:	74 33                	je     1803f9 <printer::vprintf(int, char const*, __va_list_tag*)+0x1c7>
            ++format;
  1803c6:	48 89 d3             	mov    %rdx,%rbx
                precision = 0;
  1803c9:	c7 45 a0 00 00 00 00 	movl   $0x0,-0x60(%rbp)
  1803d0:	e9 01 ff ff ff       	jmp    1802d6 <printer::vprintf(int, char const*, __va_list_tag*)+0xa4>
                for (precision = 0; *format >= '0' && *format <= '9'; ) {
  1803d5:	b9 00 00 00 00       	mov    $0x0,%ecx
                    precision = 10 * precision + *format++ - '0';
  1803da:	48 83 c2 01          	add    $0x1,%rdx
  1803de:	8d 0c 89             	lea    (%rcx,%rcx,4),%ecx
  1803e1:	0f be c0             	movsbl %al,%eax
  1803e4:	8d 4c 48 d0          	lea    -0x30(%rax,%rcx,2),%ecx
                for (precision = 0; *format >= '0' && *format <= '9'; ) {
  1803e8:	0f b6 02             	movzbl (%rdx),%eax
  1803eb:	8d 70 d0             	lea    -0x30(%rax),%esi
  1803ee:	40 80 fe 09          	cmp    $0x9,%sil
  1803f2:	76 e6                	jbe    1803da <printer::vprintf(int, char const*, __va_list_tag*)+0x1a8>
  1803f4:	48 89 d3             	mov    %rdx,%rbx
  1803f7:	eb 1c                	jmp    180415 <printer::vprintf(int, char const*, __va_list_tag*)+0x1e3>
                precision = va_arg(val, int);
  1803f9:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1803fd:	8b 01                	mov    (%rcx),%eax
  1803ff:	83 f8 2f             	cmp    $0x2f,%eax
  180402:	77 23                	ja     180427 <printer::vprintf(int, char const*, __va_list_tag*)+0x1f5>
  180404:	89 c2                	mov    %eax,%edx
  180406:	48 03 51 10          	add    0x10(%rcx),%rdx
  18040a:	83 c0 08             	add    $0x8,%eax
  18040d:	89 01                	mov    %eax,(%rcx)
  18040f:	8b 0a                	mov    (%rdx),%ecx
                ++format;
  180411:	48 83 c3 02          	add    $0x2,%rbx
            if (precision < 0) {
  180415:	85 c9                	test   %ecx,%ecx
  180417:	b8 00 00 00 00       	mov    $0x0,%eax
  18041c:	0f 49 c1             	cmovns %ecx,%eax
  18041f:	89 45 a0             	mov    %eax,-0x60(%rbp)
  180422:	e9 af fe ff ff       	jmp    1802d6 <printer::vprintf(int, char const*, __va_list_tag*)+0xa4>
                precision = va_arg(val, int);
  180427:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  18042b:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  18042f:	48 8d 42 08          	lea    0x8(%rdx),%rax
  180433:	48 89 41 08          	mov    %rax,0x8(%rcx)
  180437:	eb d6                	jmp    18040f <printer::vprintf(int, char const*, __va_list_tag*)+0x1dd>
        switch (*format) {
  180439:	3c 74                	cmp    $0x74,%al
  18043b:	74 1b                	je     180458 <printer::vprintf(int, char const*, __va_list_tag*)+0x226>
  18043d:	3c 7a                	cmp    $0x7a,%al
  18043f:	74 17                	je     180458 <printer::vprintf(int, char const*, __va_list_tag*)+0x226>
        switch (*format) {
  180441:	8d 50 bd             	lea    -0x43(%rax),%edx
  180444:	80 fa 35             	cmp    $0x35,%dl
  180447:	0f 87 6f 06 00 00    	ja     180abc <printer::vprintf(int, char const*, __va_list_tag*)+0x88a>
  18044d:	0f b6 d2             	movzbl %dl,%edx
  180450:	3e ff 24 d5 10 0e 18 	notrack jmp *0x180e10(,%rdx,8)
  180457:	00 
            ++format;
  180458:	48 8d 43 01          	lea    0x1(%rbx),%rax
  18045c:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
        switch (*format) {
  180460:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
  180464:	8d 50 bd             	lea    -0x43(%rax),%edx
  180467:	80 fa 35             	cmp    $0x35,%dl
  18046a:	0f 87 4f 04 00 00    	ja     1808bf <printer::vprintf(int, char const*, __va_list_tag*)+0x68d>
  180470:	0f b6 d2             	movzbl %dl,%edx
  180473:	3e ff 24 d5 c0 0f 18 	notrack jmp *0x180fc0(,%rdx,8)
  18047a:	00 
  18047b:	8d 50 bd             	lea    -0x43(%rax),%edx
  18047e:	80 fa 35             	cmp    $0x35,%dl
  180481:	0f 87 34 04 00 00    	ja     1808bb <printer::vprintf(int, char const*, __va_list_tag*)+0x689>
  180487:	0f b6 d2             	movzbl %dl,%edx
  18048a:	3e ff 24 d5 70 11 18 	notrack jmp *0x181170(,%rdx,8)
  180491:	00 
            long x = length ? va_arg(val, long) : va_arg(val, int);
  180492:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  180496:	8b 07                	mov    (%rdi),%eax
  180498:	83 f8 2f             	cmp    $0x2f,%eax
  18049b:	77 38                	ja     1804d5 <printer::vprintf(int, char const*, __va_list_tag*)+0x2a3>
  18049d:	89 c2                	mov    %eax,%edx
  18049f:	48 03 57 10          	add    0x10(%rdi),%rdx
  1804a3:	83 c0 08             	add    $0x8,%eax
  1804a6:	89 07                	mov    %eax,(%rdi)
  1804a8:	48 8b 12             	mov    (%rdx),%rdx
            int negative = x < 0 ? FLAG_NEGATIVE : 0;
  1804ab:	48 89 d0             	mov    %rdx,%rax
  1804ae:	48 c1 f8 37          	sar    $0x37,%rax
            num = negative ? -x : x;
  1804b2:	49 89 d3             	mov    %rdx,%r11
  1804b5:	49 f7 db             	neg    %r11
  1804b8:	25 00 01 00 00       	and    $0x100,%eax
  1804bd:	4c 0f 44 da          	cmove  %rdx,%r11
            flags |= FLAG_NUMERIC | FLAG_SIGNED | negative;
  1804c1:	8b 7d a4             	mov    -0x5c(%rbp),%edi
  1804c4:	09 f8                	or     %edi,%eax
  1804c6:	0c c0                	or     $0xc0,%al
  1804c8:	89 45 a4             	mov    %eax,-0x5c(%rbp)
        const char* data = "";
  1804cb:	bb 51 0c 18 00       	mov    $0x180c51,%ebx
            break;
  1804d0:	e9 f4 01 00 00       	jmp    1806c9 <printer::vprintf(int, char const*, __va_list_tag*)+0x497>
            long x = length ? va_arg(val, long) : va_arg(val, int);
  1804d5:	48 8b 5d 90          	mov    -0x70(%rbp),%rbx
  1804d9:	48 8b 53 08          	mov    0x8(%rbx),%rdx
  1804dd:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1804e1:	48 89 43 08          	mov    %rax,0x8(%rbx)
  1804e5:	eb c1                	jmp    1804a8 <printer::vprintf(int, char const*, __va_list_tag*)+0x276>
        switch (*format) {
  1804e7:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  1804eb:	eb 04                	jmp    1804f1 <printer::vprintf(int, char const*, __va_list_tag*)+0x2bf>
  1804ed:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            long x = length ? va_arg(val, long) : va_arg(val, int);
  1804f1:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  1804f5:	8b 01                	mov    (%rcx),%eax
  1804f7:	83 f8 2f             	cmp    $0x2f,%eax
  1804fa:	77 10                	ja     18050c <printer::vprintf(int, char const*, __va_list_tag*)+0x2da>
  1804fc:	89 c2                	mov    %eax,%edx
  1804fe:	48 03 51 10          	add    0x10(%rcx),%rdx
  180502:	83 c0 08             	add    $0x8,%eax
  180505:	89 01                	mov    %eax,(%rcx)
  180507:	48 63 12             	movslq (%rdx),%rdx
  18050a:	eb 9f                	jmp    1804ab <printer::vprintf(int, char const*, __va_list_tag*)+0x279>
  18050c:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  180510:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  180514:	48 8d 42 08          	lea    0x8(%rdx),%rax
  180518:	48 89 47 08          	mov    %rax,0x8(%rdi)
  18051c:	eb e9                	jmp    180507 <printer::vprintf(int, char const*, __va_list_tag*)+0x2d5>
        switch (*format) {
  18051e:	b8 01 00 00 00       	mov    $0x1,%eax
  180523:	c7 45 9c 0a 00 00 00 	movl   $0xa,-0x64(%rbp)
  18052a:	e9 9d 00 00 00       	jmp    1805cc <printer::vprintf(int, char const*, __va_list_tag*)+0x39a>
  18052f:	b8 00 00 00 00       	mov    $0x0,%eax
  180534:	c7 45 9c 0a 00 00 00 	movl   $0xa,-0x64(%rbp)
  18053b:	e9 8c 00 00 00       	jmp    1805cc <printer::vprintf(int, char const*, __va_list_tag*)+0x39a>
  180540:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  180544:	b8 00 00 00 00       	mov    $0x0,%eax
  180549:	c7 45 9c 0a 00 00 00 	movl   $0xa,-0x64(%rbp)
  180550:	eb 7a                	jmp    1805cc <printer::vprintf(int, char const*, __va_list_tag*)+0x39a>
  180552:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  180556:	b8 00 00 00 00       	mov    $0x0,%eax
  18055b:	c7 45 9c 0a 00 00 00 	movl   $0xa,-0x64(%rbp)
  180562:	eb 68                	jmp    1805cc <printer::vprintf(int, char const*, __va_list_tag*)+0x39a>
            num = length ? va_arg(val, unsigned long) : va_arg(val, unsigned);
  180564:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  180568:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  18056c:	48 8d 42 08          	lea    0x8(%rdx),%rax
  180570:	48 89 47 08          	mov    %rax,0x8(%rdi)
  180574:	eb 70                	jmp    1805e6 <printer::vprintf(int, char const*, __va_list_tag*)+0x3b4>
  180576:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  18057a:	8b 01                	mov    (%rcx),%eax
  18057c:	83 f8 2f             	cmp    $0x2f,%eax
  18057f:	77 10                	ja     180591 <printer::vprintf(int, char const*, __va_list_tag*)+0x35f>
  180581:	89 c2                	mov    %eax,%edx
  180583:	48 03 51 10          	add    0x10(%rcx),%rdx
  180587:	83 c0 08             	add    $0x8,%eax
  18058a:	89 01                	mov    %eax,(%rcx)
  18058c:	44 8b 1a             	mov    (%rdx),%r11d
  18058f:	eb 58                	jmp    1805e9 <printer::vprintf(int, char const*, __va_list_tag*)+0x3b7>
  180591:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  180595:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  180599:	48 8d 42 08          	lea    0x8(%rdx),%rax
  18059d:	48 89 41 08          	mov    %rax,0x8(%rcx)
  1805a1:	eb e9                	jmp    18058c <printer::vprintf(int, char const*, __va_list_tag*)+0x35a>
        switch (*format) {
  1805a3:	b8 01 00 00 00       	mov    $0x1,%eax
  1805a8:	eb 1b                	jmp    1805c5 <printer::vprintf(int, char const*, __va_list_tag*)+0x393>
  1805aa:	b8 00 00 00 00       	mov    $0x0,%eax
  1805af:	eb 14                	jmp    1805c5 <printer::vprintf(int, char const*, __va_list_tag*)+0x393>
  1805b1:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  1805b5:	b8 00 00 00 00       	mov    $0x0,%eax
  1805ba:	eb 09                	jmp    1805c5 <printer::vprintf(int, char const*, __va_list_tag*)+0x393>
  1805bc:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  1805c0:	b8 00 00 00 00       	mov    $0x0,%eax
            base = -16;
  1805c5:	c7 45 9c f0 ff ff ff 	movl   $0xfffffff0,-0x64(%rbp)
            num = length ? va_arg(val, unsigned long) : va_arg(val, unsigned);
  1805cc:	85 c0                	test   %eax,%eax
  1805ce:	74 a6                	je     180576 <printer::vprintf(int, char const*, __va_list_tag*)+0x344>
  1805d0:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  1805d4:	8b 07                	mov    (%rdi),%eax
  1805d6:	83 f8 2f             	cmp    $0x2f,%eax
  1805d9:	77 89                	ja     180564 <printer::vprintf(int, char const*, __va_list_tag*)+0x332>
  1805db:	89 c2                	mov    %eax,%edx
  1805dd:	48 03 57 10          	add    0x10(%rdi),%rdx
  1805e1:	83 c0 08             	add    $0x8,%eax
  1805e4:	89 07                	mov    %eax,(%rdi)
  1805e6:	4c 8b 1a             	mov    (%rdx),%r11
            flags |= FLAG_NUMERIC;
  1805e9:	8b 45 a4             	mov    -0x5c(%rbp),%eax
  1805ec:	83 c8 40             	or     $0x40,%eax
    if (base < 0) {
  1805ef:	83 7d 9c 00          	cmpl   $0x0,-0x64(%rbp)
  1805f3:	0f 89 ea 02 00 00    	jns    1808e3 <printer::vprintf(int, char const*, __va_list_tag*)+0x6b1>
    *--pos = '\0';
  1805f9:	c6 45 cf 00          	movb   $0x0,-0x31(%rbp)
    if (flags & FLAG_THOUSANDS) {
  1805fd:	a8 20                	test   $0x20,%al
  1805ff:	0f 85 0d 03 00 00    	jne    180912 <printer::vprintf(int, char const*, __va_list_tag*)+0x6e0>
  180605:	89 45 a4             	mov    %eax,-0x5c(%rbp)
        digits = lower_digits;
  180608:	41 ba 20 13 18 00    	mov    $0x181320,%r10d
        base = -base;
  18060e:	41 b9 10 00 00 00    	mov    $0x10,%r9d
    if (flags & FLAG_THOUSANDS) {
  180614:	c7 45 98 40 00 00 00 	movl   $0x40,-0x68(%rbp)
        thousands_pos = nullptr;
  18061b:	bf 00 00 00 00       	mov    $0x0,%edi
  180620:	e9 0f 03 00 00       	jmp    180934 <printer::vprintf(int, char const*, __va_list_tag*)+0x702>
        switch (*format) {
  180625:	b8 01 00 00 00       	mov    $0x1,%eax
  18062a:	eb 1b                	jmp    180647 <printer::vprintf(int, char const*, __va_list_tag*)+0x415>
  18062c:	b8 00 00 00 00       	mov    $0x0,%eax
  180631:	eb 14                	jmp    180647 <printer::vprintf(int, char const*, __va_list_tag*)+0x415>
  180633:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  180637:	b8 00 00 00 00       	mov    $0x0,%eax
  18063c:	eb 09                	jmp    180647 <printer::vprintf(int, char const*, __va_list_tag*)+0x415>
  18063e:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  180642:	b8 00 00 00 00       	mov    $0x0,%eax
            base = 16;
  180647:	c7 45 9c 10 00 00 00 	movl   $0x10,-0x64(%rbp)
            goto format_unsigned;
  18064e:	e9 79 ff ff ff       	jmp    1805cc <printer::vprintf(int, char const*, __va_list_tag*)+0x39a>
        switch (*format) {
  180653:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  180657:	eb 04                	jmp    18065d <printer::vprintf(int, char const*, __va_list_tag*)+0x42b>
  180659:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            num = (uintptr_t) va_arg(val, void*);
  18065d:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  180661:	8b 01                	mov    (%rcx),%eax
  180663:	83 f8 2f             	cmp    $0x2f,%eax
  180666:	77 22                	ja     18068a <printer::vprintf(int, char const*, __va_list_tag*)+0x458>
  180668:	89 c2                	mov    %eax,%edx
  18066a:	48 03 51 10          	add    0x10(%rcx),%rdx
  18066e:	83 c0 08             	add    $0x8,%eax
  180671:	89 01                	mov    %eax,(%rcx)
  180673:	4c 8b 1a             	mov    (%rdx),%r11
            flags |= FLAG_ALT | FLAG_ALT2 | FLAG_NUMERIC;
  180676:	8b 45 a4             	mov    -0x5c(%rbp),%eax
  180679:	0d 41 02 00 00       	or     $0x241,%eax
            base = -16;
  18067e:	c7 45 9c f0 ff ff ff 	movl   $0xfffffff0,-0x64(%rbp)
  180685:	e9 6f ff ff ff       	jmp    1805f9 <printer::vprintf(int, char const*, __va_list_tag*)+0x3c7>
            num = (uintptr_t) va_arg(val, void*);
  18068a:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  18068e:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  180692:	48 8d 42 08          	lea    0x8(%rdx),%rax
  180696:	48 89 47 08          	mov    %rax,0x8(%rdi)
  18069a:	eb d7                	jmp    180673 <printer::vprintf(int, char const*, __va_list_tag*)+0x441>
        switch (*format) {
  18069c:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  1806a0:	eb 04                	jmp    1806a6 <printer::vprintf(int, char const*, __va_list_tag*)+0x474>
  1806a2:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            data = va_arg(val, char*);
  1806a6:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  1806aa:	8b 07                	mov    (%rdi),%eax
  1806ac:	83 f8 2f             	cmp    $0x2f,%eax
  1806af:	0f 87 70 01 00 00    	ja     180825 <printer::vprintf(int, char const*, __va_list_tag*)+0x5f3>
  1806b5:	89 c2                	mov    %eax,%edx
  1806b7:	48 03 57 10          	add    0x10(%rdi),%rdx
  1806bb:	83 c0 08             	add    $0x8,%eax
  1806be:	89 07                	mov    %eax,(%rdi)
  1806c0:	48 8b 1a             	mov    (%rdx),%rbx
        unsigned long num = 0;
  1806c3:	41 bb 00 00 00 00    	mov    $0x0,%r11d
        if (flags & FLAG_NUMERIC) {
  1806c9:	8b 45 a4             	mov    -0x5c(%rbp),%eax
  1806cc:	83 e0 40             	and    $0x40,%eax
  1806cf:	89 45 98             	mov    %eax,-0x68(%rbp)
        const char* prefix = "";
  1806d2:	41 bc 51 0c 18 00    	mov    $0x180c51,%r12d
        if (flags & FLAG_NUMERIC) {
  1806d8:	0f 85 f8 03 00 00    	jne    180ad6 <printer::vprintf(int, char const*, __va_list_tag*)+0x8a4>
        if (precision >= 0 && !(flags & FLAG_NUMERIC)) {
  1806de:	8b 7d a0             	mov    -0x60(%rbp),%edi
  1806e1:	89 f8                	mov    %edi,%eax
  1806e3:	f7 d0                	not    %eax
  1806e5:	c1 e8 1f             	shr    $0x1f,%eax
  1806e8:	89 45 8c             	mov    %eax,-0x74(%rbp)
  1806eb:	83 7d 98 00          	cmpl   $0x0,-0x68(%rbp)
  1806ef:	0f 85 63 03 00 00    	jne    180a58 <printer::vprintf(int, char const*, __va_list_tag*)+0x826>
  1806f5:	84 c0                	test   %al,%al
  1806f7:	0f 84 5b 03 00 00    	je     180a58 <printer::vprintf(int, char const*, __va_list_tag*)+0x826>
            datalen = strnlen(data, precision);
  1806fd:	48 63 f7             	movslq %edi,%rsi
  180700:	48 89 df             	mov    %rbx,%rdi
  180703:	e8 1a fa ff ff       	call   180122 <strnlen>
  180708:	89 45 9c             	mov    %eax,-0x64(%rbp)
                   && datalen + (int) strlen(prefix) < width) {
  18070b:	8b 45 a4             	mov    -0x5c(%rbp),%eax
  18070e:	83 e0 46             	and    $0x46,%eax
            zeros = 0;
  180711:	c7 45 a0 00 00 00 00 	movl   $0x0,-0x60(%rbp)
                   && datalen + (int) strlen(prefix) < width) {
  180718:	83 f8 42             	cmp    $0x42,%eax
  18071b:	0f 84 6f 03 00 00    	je     180a90 <printer::vprintf(int, char const*, __va_list_tag*)+0x85e>
        width -= datalen + zeros + strlen(prefix);
  180721:	4c 89 e7             	mov    %r12,%rdi
  180724:	e8 da f9 ff ff       	call   180103 <strlen>
  180729:	8b 7d a0             	mov    -0x60(%rbp),%edi
  18072c:	8b 4d 9c             	mov    -0x64(%rbp),%ecx
  18072f:	01 f9                	add    %edi,%ecx
  180731:	44 89 f2             	mov    %r14d,%edx
  180734:	29 ca                	sub    %ecx,%edx
  180736:	29 c2                	sub    %eax,%edx
  180738:	41 89 d6             	mov    %edx,%r14d
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
  18073b:	f6 45 a4 04          	testb  $0x4,-0x5c(%rbp)
  18073f:	75 32                	jne    180773 <printer::vprintf(int, char const*, __va_list_tag*)+0x541>
  180741:	85 d2                	test   %edx,%edx
  180743:	7e 2e                	jle    180773 <printer::vprintf(int, char const*, __va_list_tag*)+0x541>
        width -= datalen + zeros + strlen(prefix);
  180745:	89 55 a4             	mov    %edx,-0x5c(%rbp)
            putc(' ', color);
  180748:	49 8b 07             	mov    (%r15),%rax
  18074b:	44 89 ea             	mov    %r13d,%edx
  18074e:	be 20 00 00 00       	mov    $0x20,%esi
  180753:	4c 89 ff             	mov    %r15,%rdi
  180756:	ff 10                	call   *(%rax)
        for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width) {
  180758:	41 83 ee 01          	sub    $0x1,%r14d
  18075c:	45 85 f6             	test   %r14d,%r14d
  18075f:	7f e7                	jg     180748 <printer::vprintf(int, char const*, __va_list_tag*)+0x516>
  180761:	8b 55 a4             	mov    -0x5c(%rbp),%edx
  180764:	85 d2                	test   %edx,%edx
  180766:	b8 01 00 00 00       	mov    $0x1,%eax
  18076b:	0f 4f c2             	cmovg  %edx,%eax
  18076e:	29 c2                	sub    %eax,%edx
  180770:	41 89 d6             	mov    %edx,%r14d
        for (; *prefix; ++prefix) {
  180773:	41 0f b6 04 24       	movzbl (%r12),%eax
  180778:	84 c0                	test   %al,%al
  18077a:	74 1b                	je     180797 <printer::vprintf(int, char const*, __va_list_tag*)+0x565>
            putc(*prefix, color);
  18077c:	0f b6 f0             	movzbl %al,%esi
  18077f:	49 8b 07             	mov    (%r15),%rax
  180782:	44 89 ea             	mov    %r13d,%edx
  180785:	4c 89 ff             	mov    %r15,%rdi
  180788:	ff 10                	call   *(%rax)
        for (; *prefix; ++prefix) {
  18078a:	49 83 c4 01          	add    $0x1,%r12
  18078e:	41 0f b6 04 24       	movzbl (%r12),%eax
  180793:	84 c0                	test   %al,%al
  180795:	75 e5                	jne    18077c <printer::vprintf(int, char const*, __va_list_tag*)+0x54a>
        for (; zeros > 0; --zeros) {
  180797:	44 8b 65 a0          	mov    -0x60(%rbp),%r12d
  18079b:	45 85 e4             	test   %r12d,%r12d
  18079e:	7e 16                	jle    1807b6 <printer::vprintf(int, char const*, __va_list_tag*)+0x584>
            putc('0', color);
  1807a0:	49 8b 07             	mov    (%r15),%rax
  1807a3:	44 89 ea             	mov    %r13d,%edx
  1807a6:	be 30 00 00 00       	mov    $0x30,%esi
  1807ab:	4c 89 ff             	mov    %r15,%rdi
  1807ae:	ff 10                	call   *(%rax)
        for (; zeros > 0; --zeros) {
  1807b0:	41 83 ec 01          	sub    $0x1,%r12d
  1807b4:	75 ea                	jne    1807a0 <printer::vprintf(int, char const*, __va_list_tag*)+0x56e>
        for (; datalen > 0; ++data, --datalen) {
  1807b6:	8b 45 9c             	mov    -0x64(%rbp),%eax
  1807b9:	85 c0                	test   %eax,%eax
  1807bb:	7e 1d                	jle    1807da <printer::vprintf(int, char const*, __va_list_tag*)+0x5a8>
  1807bd:	41 89 c4             	mov    %eax,%r12d
  1807c0:	49 01 dc             	add    %rbx,%r12
            putc(*data, color);
  1807c3:	0f b6 33             	movzbl (%rbx),%esi
  1807c6:	49 8b 07             	mov    (%r15),%rax
  1807c9:	44 89 ea             	mov    %r13d,%edx
  1807cc:	4c 89 ff             	mov    %r15,%rdi
  1807cf:	ff 10                	call   *(%rax)
        for (; datalen > 0; ++data, --datalen) {
  1807d1:	48 83 c3 01          	add    $0x1,%rbx
  1807d5:	49 39 dc             	cmp    %rbx,%r12
  1807d8:	75 e9                	jne    1807c3 <printer::vprintf(int, char const*, __va_list_tag*)+0x591>
        for (; width > 0; --width) {
  1807da:	45 85 f6             	test   %r14d,%r14d
  1807dd:	7e 16                	jle    1807f5 <printer::vprintf(int, char const*, __va_list_tag*)+0x5c3>
            putc(' ', color);
  1807df:	49 8b 07             	mov    (%r15),%rax
  1807e2:	44 89 ea             	mov    %r13d,%edx
  1807e5:	be 20 00 00 00       	mov    $0x20,%esi
  1807ea:	4c 89 ff             	mov    %r15,%rdi
  1807ed:	ff 10                	call   *(%rax)
        for (; width > 0; --width) {
  1807ef:	41 83 ee 01          	sub    $0x1,%r14d
  1807f3:	75 ea                	jne    1807df <printer::vprintf(int, char const*, __va_list_tag*)+0x5ad>
    for (; *format; ++format) {
  1807f5:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  1807f9:	4c 8d 60 01          	lea    0x1(%rax),%r12
  1807fd:	0f b6 40 01          	movzbl 0x1(%rax),%eax
  180801:	84 c0                	test   %al,%al
  180803:	0f 84 56 fa ff ff    	je     18025f <printer::vprintf(int, char const*, __va_list_tag*)+0x2d>
        if (*format != '%') {
  180809:	3c 25                	cmp    $0x25,%al
  18080b:	0f 84 5d fa ff ff    	je     18026e <printer::vprintf(int, char const*, __va_list_tag*)+0x3c>
            putc(*format, color);
  180811:	0f b6 f0             	movzbl %al,%esi
  180814:	49 8b 07             	mov    (%r15),%rax
  180817:	44 89 ea             	mov    %r13d,%edx
  18081a:	4c 89 ff             	mov    %r15,%rdi
  18081d:	ff 10                	call   *(%rax)
            continue;
  18081f:	4c 89 65 a8          	mov    %r12,-0x58(%rbp)
  180823:	eb d0                	jmp    1807f5 <printer::vprintf(int, char const*, __va_list_tag*)+0x5c3>
            data = va_arg(val, char*);
  180825:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  180829:	48 8b 51 08          	mov    0x8(%rcx),%rdx
  18082d:	48 8d 42 08          	lea    0x8(%rdx),%rax
  180831:	48 89 41 08          	mov    %rax,0x8(%rcx)
  180835:	e9 86 fe ff ff       	jmp    1806c0 <printer::vprintf(int, char const*, __va_list_tag*)+0x48e>
        switch (*format) {
  18083a:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  18083e:	eb 04                	jmp    180844 <printer::vprintf(int, char const*, __va_list_tag*)+0x612>
  180840:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            color = va_arg(val, int);
  180844:	48 8b 4d 90          	mov    -0x70(%rbp),%rcx
  180848:	8b 01                	mov    (%rcx),%eax
  18084a:	83 f8 2f             	cmp    $0x2f,%eax
  18084d:	77 10                	ja     18085f <printer::vprintf(int, char const*, __va_list_tag*)+0x62d>
  18084f:	89 c2                	mov    %eax,%edx
  180851:	48 03 51 10          	add    0x10(%rcx),%rdx
  180855:	83 c0 08             	add    $0x8,%eax
  180858:	89 01                	mov    %eax,(%rcx)
  18085a:	44 8b 2a             	mov    (%rdx),%r13d
            continue;
  18085d:	eb 96                	jmp    1807f5 <printer::vprintf(int, char const*, __va_list_tag*)+0x5c3>
            color = va_arg(val, int);
  18085f:	48 8b 5d 90          	mov    -0x70(%rbp),%rbx
  180863:	48 8b 53 08          	mov    0x8(%rbx),%rdx
  180867:	48 8d 42 08          	lea    0x8(%rdx),%rax
  18086b:	48 89 43 08          	mov    %rax,0x8(%rbx)
  18086f:	eb e9                	jmp    18085a <printer::vprintf(int, char const*, __va_list_tag*)+0x628>
        switch (*format) {
  180871:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
  180875:	eb 04                	jmp    18087b <printer::vprintf(int, char const*, __va_list_tag*)+0x649>
  180877:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            numbuf[0] = va_arg(val, int);
  18087b:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  18087f:	8b 07                	mov    (%rdi),%eax
  180881:	83 f8 2f             	cmp    $0x2f,%eax
  180884:	77 23                	ja     1808a9 <printer::vprintf(int, char const*, __va_list_tag*)+0x677>
  180886:	89 c2                	mov    %eax,%edx
  180888:	48 03 57 10          	add    0x10(%rdi),%rdx
  18088c:	83 c0 08             	add    $0x8,%eax
  18088f:	89 07                	mov    %eax,(%rdi)
  180891:	8b 02                	mov    (%rdx),%eax
  180893:	88 45 b0             	mov    %al,-0x50(%rbp)
            numbuf[1] = '\0';
  180896:	c6 45 b1 00          	movb   $0x0,-0x4f(%rbp)
            data = numbuf;
  18089a:	48 8d 5d b0          	lea    -0x50(%rbp),%rbx
        unsigned long num = 0;
  18089e:	41 bb 00 00 00 00    	mov    $0x0,%r11d
            break;
  1808a4:	e9 20 fe ff ff       	jmp    1806c9 <printer::vprintf(int, char const*, __va_list_tag*)+0x497>
            numbuf[0] = va_arg(val, int);
  1808a9:	48 8b 7d 90          	mov    -0x70(%rbp),%rdi
  1808ad:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  1808b1:	48 8d 42 08          	lea    0x8(%rdx),%rax
  1808b5:	48 89 47 08          	mov    %rax,0x8(%rdi)
  1808b9:	eb d6                	jmp    180891 <printer::vprintf(int, char const*, __va_list_tag*)+0x65f>
        switch (*format) {
  1808bb:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            numbuf[0] = (*format ? *format : '%');
  1808bf:	84 c0                	test   %al,%al
  1808c1:	0f 85 f1 01 00 00    	jne    180ab8 <printer::vprintf(int, char const*, __va_list_tag*)+0x886>
  1808c7:	c6 45 b0 25          	movb   $0x25,-0x50(%rbp)
            numbuf[1] = '\0';
  1808cb:	c6 45 b1 00          	movb   $0x0,-0x4f(%rbp)
                format--;
  1808cf:	48 83 6d a8 01       	subq   $0x1,-0x58(%rbp)
            data = numbuf;
  1808d4:	48 8d 5d b0          	lea    -0x50(%rbp),%rbx
        unsigned long num = 0;
  1808d8:	41 bb 00 00 00 00    	mov    $0x0,%r11d
  1808de:	e9 e6 fd ff ff       	jmp    1806c9 <printer::vprintf(int, char const*, __va_list_tag*)+0x497>
    *--pos = '\0';
  1808e3:	c6 45 cf 00          	movb   $0x0,-0x31(%rbp)
    if (flags & FLAG_THOUSANDS) {
  1808e7:	f6 45 a4 20          	testb  $0x20,-0x5c(%rbp)
  1808eb:	74 73                	je     180960 <printer::vprintf(int, char const*, __va_list_tag*)+0x72e>
        thousands_pos = pos - (base == 10 ? 3 : 4);
  1808ed:	8b 5d 9c             	mov    -0x64(%rbp),%ebx
  1808f0:	41 89 d9             	mov    %ebx,%r9d
  1808f3:	89 45 a4             	mov    %eax,-0x5c(%rbp)
  1808f6:	41 ba 40 13 18 00    	mov    $0x181340,%r10d
  1808fc:	c7 45 98 40 00 00 00 	movl   $0x40,-0x68(%rbp)
  180903:	83 fb 0a             	cmp    $0xa,%ebx
  180906:	0f 94 c0             	sete   %al
  180909:	0f b6 c0             	movzbl %al,%eax
  18090c:	48 83 e8 04          	sub    $0x4,%rax
  180910:	eb 1d                	jmp    18092f <printer::vprintf(int, char const*, __va_list_tag*)+0x6fd>
    if (flags & FLAG_THOUSANDS) {
  180912:	89 45 a4             	mov    %eax,-0x5c(%rbp)
        digits = lower_digits;
  180915:	41 ba 20 13 18 00    	mov    $0x181320,%r10d
        base = -base;
  18091b:	41 b9 10 00 00 00    	mov    $0x10,%r9d
    if (flags & FLAG_THOUSANDS) {
  180921:	c7 45 98 40 00 00 00 	movl   $0x40,-0x68(%rbp)
        thousands_pos = pos - (base == 10 ? 3 : 4);
  180928:	48 c7 c0 fc ff ff ff 	mov    $0xfffffffffffffffc,%rax
  18092f:	48 8d 7c 05 cf       	lea    -0x31(%rbp,%rax,1),%rdi
  180934:	48 8d 4d ce          	lea    -0x32(%rbp),%rcx
        thousands_pos = nullptr;
  180938:	4c 89 d8             	mov    %r11,%rax
            *--pos = digits[val % base];
  18093b:	49 63 f1             	movslq %r9d,%rsi
    } while (val != 0 && pos != buf);
  18093e:	4c 8d 45 b0          	lea    -0x50(%rbp),%r8
  180942:	eb 57                	jmp    18099b <printer::vprintf(int, char const*, __va_list_tag*)+0x769>
    if (flags & FLAG_THOUSANDS) {
  180944:	41 ba 40 13 18 00    	mov    $0x181340,%r10d
  18094a:	41 b9 0a 00 00 00    	mov    $0xa,%r9d
  180950:	c7 45 9c 0a 00 00 00 	movl   $0xa,-0x64(%rbp)
        thousands_pos = pos - (base == 10 ? 3 : 4);
  180957:	48 c7 c0 fd ff ff ff 	mov    $0xfffffffffffffffd,%rax
  18095e:	eb cf                	jmp    18092f <printer::vprintf(int, char const*, __va_list_tag*)+0x6fd>
  180960:	44 8b 4d 9c          	mov    -0x64(%rbp),%r9d
  180964:	89 45 a4             	mov    %eax,-0x5c(%rbp)
  180967:	41 ba 40 13 18 00    	mov    $0x181340,%r10d
  18096d:	c7 45 98 40 00 00 00 	movl   $0x40,-0x68(%rbp)
        thousands_pos = nullptr;
  180974:	bf 00 00 00 00       	mov    $0x0,%edi
  180979:	eb b9                	jmp    180934 <printer::vprintf(int, char const*, __va_list_tag*)+0x702>
            *--pos = digits[val % base];
  18097b:	48 89 cb             	mov    %rcx,%rbx
  18097e:	ba 00 00 00 00       	mov    $0x0,%edx
  180983:	48 f7 f6             	div    %rsi
  180986:	41 0f b6 14 12       	movzbl (%r10,%rdx,1),%edx
  18098b:	88 11                	mov    %dl,(%rcx)
    } while (val != 0 && pos != buf);
  18098d:	48 83 e9 01          	sub    $0x1,%rcx
  180991:	48 85 c0             	test   %rax,%rax
  180994:	74 2d                	je     1809c3 <printer::vprintf(int, char const*, __va_list_tag*)+0x791>
  180996:	4c 39 c3             	cmp    %r8,%rbx
  180999:	74 28                	je     1809c3 <printer::vprintf(int, char const*, __va_list_tag*)+0x791>
        if (pos == thousands_pos) {
  18099b:	48 8d 51 01          	lea    0x1(%rcx),%rdx
  18099f:	48 39 d7             	cmp    %rdx,%rdi
  1809a2:	75 d7                	jne    18097b <printer::vprintf(int, char const*, __va_list_tag*)+0x749>
            *--pos = base == 10 ? ',' : '\'';
  1809a4:	48 89 cb             	mov    %rcx,%rbx
  1809a7:	41 83 f9 0a          	cmp    $0xa,%r9d
  1809ab:	0f 94 c2             	sete   %dl
  1809ae:	8d 54 92 27          	lea    0x27(%rdx,%rdx,4),%edx
  1809b2:	40 0f 94 c7          	sete   %dil
  1809b6:	40 0f b6 ff          	movzbl %dil,%edi
  1809ba:	88 11                	mov    %dl,(%rcx)
            thousands_pos = pos - (base == 10 ? 3 : 4);
  1809bc:	48 8d 7c 39 fc       	lea    -0x4(%rcx,%rdi,1),%rdi
  1809c1:	eb ca                	jmp    18098d <printer::vprintf(int, char const*, __va_list_tag*)+0x75b>
        if ((flags & FLAG_NUMERIC) && (flags & FLAG_SIGNED)) {
  1809c3:	8b 7d a4             	mov    -0x5c(%rbp),%edi
  1809c6:	89 f8                	mov    %edi,%eax
  1809c8:	f7 d0                	not    %eax
  1809ca:	a8 c0                	test   $0xc0,%al
  1809cc:	75 3c                	jne    180a0a <printer::vprintf(int, char const*, __va_list_tag*)+0x7d8>
                prefix = "-";
  1809ce:	41 bc 4e 0c 18 00    	mov    $0x180c4e,%r12d
            if (flags & FLAG_NEGATIVE) {
  1809d4:	f7 c7 00 01 00 00    	test   $0x100,%edi
  1809da:	0f 85 fe fc ff ff    	jne    1806de <printer::vprintf(int, char const*, __va_list_tag*)+0x4ac>
                prefix = "+";
  1809e0:	41 bc 49 0c 18 00    	mov    $0x180c49,%r12d
            } else if (flags & FLAG_PLUSPOSITIVE) {
  1809e6:	40 f6 c7 10          	test   $0x10,%dil
  1809ea:	0f 85 ee fc ff ff    	jne    1806de <printer::vprintf(int, char const*, __va_list_tag*)+0x4ac>
        const char* prefix = "";
  1809f0:	40 f6 c7 08          	test   $0x8,%dil
  1809f4:	ba 50 0c 18 00       	mov    $0x180c50,%edx
  1809f9:	b8 51 0c 18 00       	mov    $0x180c51,%eax
  1809fe:	48 0f 45 c2          	cmovne %rdx,%rax
  180a02:	49 89 c4             	mov    %rax,%r12
  180a05:	e9 d4 fc ff ff       	jmp    1806de <printer::vprintf(int, char const*, __va_list_tag*)+0x4ac>
  180a0a:	41 bc 51 0c 18 00    	mov    $0x180c51,%r12d
        } else if ((flags & FLAG_NUMERIC) && (flags & FLAG_ALT)
  180a10:	8b 4d a4             	mov    -0x5c(%rbp),%ecx
  180a13:	89 c8                	mov    %ecx,%eax
  180a15:	f7 d0                	not    %eax
  180a17:	a8 41                	test   $0x41,%al
  180a19:	0f 85 bf fc ff ff    	jne    1806de <printer::vprintf(int, char const*, __va_list_tag*)+0x4ac>
                   && (base == 16 || base == -16)
  180a1f:	8b 45 9c             	mov    -0x64(%rbp),%eax
  180a22:	83 c0 10             	add    $0x10,%eax
  180a25:	a9 df ff ff ff       	test   $0xffffffdf,%eax
  180a2a:	0f 85 ae fc ff ff    	jne    1806de <printer::vprintf(int, char const*, __va_list_tag*)+0x4ac>
                   && (num || (flags & FLAG_ALT2))) {
  180a30:	4d 85 db             	test   %r11,%r11
  180a33:	75 09                	jne    180a3e <printer::vprintf(int, char const*, __va_list_tag*)+0x80c>
  180a35:	f6 c5 02             	test   $0x2,%ch
  180a38:	0f 84 a0 fc ff ff    	je     1806de <printer::vprintf(int, char const*, __va_list_tag*)+0x4ac>
            prefix = (base == -16 ? "0x" : "0X");
  180a3e:	83 7d 9c f0          	cmpl   $0xfffffff0,-0x64(%rbp)
  180a42:	ba 4b 0c 18 00       	mov    $0x180c4b,%edx
  180a47:	b8 52 0c 18 00       	mov    $0x180c52,%eax
  180a4c:	48 0f 45 c2          	cmovne %rdx,%rax
  180a50:	49 89 c4             	mov    %rax,%r12
  180a53:	e9 86 fc ff ff       	jmp    1806de <printer::vprintf(int, char const*, __va_list_tag*)+0x4ac>
            datalen = strlen(data);
  180a58:	48 89 df             	mov    %rbx,%rdi
  180a5b:	e8 a3 f6 ff ff       	call   180103 <strlen>
  180a60:	89 45 9c             	mov    %eax,-0x64(%rbp)
            && precision >= 0) {
  180a63:	83 7d 98 00          	cmpl   $0x0,-0x68(%rbp)
  180a67:	0f 84 9e fc ff ff    	je     18070b <printer::vprintf(int, char const*, __va_list_tag*)+0x4d9>
  180a6d:	80 7d 8c 00          	cmpb   $0x0,-0x74(%rbp)
  180a71:	0f 84 94 fc ff ff    	je     18070b <printer::vprintf(int, char const*, __va_list_tag*)+0x4d9>
            zeros = precision > datalen ? precision - datalen : 0;
  180a77:	8b 7d a0             	mov    -0x60(%rbp),%edi
  180a7a:	89 fa                	mov    %edi,%edx
  180a7c:	29 c2                	sub    %eax,%edx
  180a7e:	39 c7                	cmp    %eax,%edi
  180a80:	b8 00 00 00 00       	mov    $0x0,%eax
  180a85:	0f 4f c2             	cmovg  %edx,%eax
  180a88:	89 45 a0             	mov    %eax,-0x60(%rbp)
  180a8b:	e9 91 fc ff ff       	jmp    180721 <printer::vprintf(int, char const*, __va_list_tag*)+0x4ef>
                   && datalen + (int) strlen(prefix) < width) {
  180a90:	4c 89 e7             	mov    %r12,%rdi
  180a93:	e8 6b f6 ff ff       	call   180103 <strlen>
  180a98:	8b 7d 9c             	mov    -0x64(%rbp),%edi
  180a9b:	8d 14 07             	lea    (%rdi,%rax,1),%edx
            zeros = width - datalen - strlen(prefix);
  180a9e:	44 89 f1             	mov    %r14d,%ecx
  180aa1:	29 f9                	sub    %edi,%ecx
  180aa3:	29 c1                	sub    %eax,%ecx
  180aa5:	44 39 f2             	cmp    %r14d,%edx
  180aa8:	b8 00 00 00 00       	mov    $0x0,%eax
  180aad:	0f 4c c1             	cmovl  %ecx,%eax
  180ab0:	89 45 a0             	mov    %eax,-0x60(%rbp)
  180ab3:	e9 69 fc ff ff       	jmp    180721 <printer::vprintf(int, char const*, __va_list_tag*)+0x4ef>
  180ab8:	48 8b 5d a8          	mov    -0x58(%rbp),%rbx
            numbuf[0] = (*format ? *format : '%');
  180abc:	88 45 b0             	mov    %al,-0x50(%rbp)
            numbuf[1] = '\0';
  180abf:	c6 45 b1 00          	movb   $0x0,-0x4f(%rbp)
  180ac3:	48 89 5d a8          	mov    %rbx,-0x58(%rbp)
            data = numbuf;
  180ac7:	48 8d 5d b0          	lea    -0x50(%rbp),%rbx
        unsigned long num = 0;
  180acb:	41 bb 00 00 00 00    	mov    $0x0,%r11d
  180ad1:	e9 f3 fb ff ff       	jmp    1806c9 <printer::vprintf(int, char const*, __va_list_tag*)+0x497>
    *--pos = '\0';
  180ad6:	c6 45 cf 00          	movb   $0x0,-0x31(%rbp)
    if (flags & FLAG_THOUSANDS) {
  180ada:	f6 45 a4 20          	testb  $0x20,-0x5c(%rbp)
  180ade:	0f 85 60 fe ff ff    	jne    180944 <printer::vprintf(int, char const*, __va_list_tag*)+0x712>
  180ae4:	41 ba 40 13 18 00    	mov    $0x181340,%r10d
  180aea:	41 b9 0a 00 00 00    	mov    $0xa,%r9d
  180af0:	c7 45 9c 0a 00 00 00 	movl   $0xa,-0x64(%rbp)
        thousands_pos = nullptr;
  180af7:	bf 00 00 00 00       	mov    $0x0,%edi
  180afc:	e9 33 fe ff ff       	jmp    180934 <printer::vprintf(int, char const*, __va_list_tag*)+0x702>

0000000000180b01 <vsnprintf>:
};

ssize_t vsnprintf(char* s, size_t size, const char* format, va_list val) {
  180b01:	f3 0f 1e fa          	endbr64
  180b05:	55                   	push   %rbp
  180b06:	48 89 e5             	mov    %rsp,%rbp
  180b09:	53                   	push   %rbx
  180b0a:	48 83 ec 28          	sub    $0x28,%rsp
  180b0e:	48 89 f3             	mov    %rsi,%rbx
        : s_(s), end_(s + size), n_(0) {
  180b11:	48 c7 45 d0 68 13 18 	movq   $0x181368,-0x30(%rbp)
  180b18:	00 
  180b19:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  180b1d:	48 01 f7             	add    %rsi,%rdi
  180b20:	48 89 7d e0          	mov    %rdi,-0x20(%rbp)
  180b24:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
  180b2b:	00 
    string_printer sp(s, size);
    sp.vprintf(0, format, val);
  180b2c:	be 00 00 00 00       	mov    $0x0,%esi
  180b31:	48 8d 7d d0          	lea    -0x30(%rbp),%rdi
  180b35:	e8 f8 f6 ff ff       	call   180232 <printer::vprintf(int, char const*, __va_list_tag*)>
    if (size && sp.s_ < sp.end_) {
  180b3a:	48 85 db             	test   %rbx,%rbx
  180b3d:	74 10                	je     180b4f <vsnprintf+0x4e>
  180b3f:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  180b43:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  180b47:	48 39 c2             	cmp    %rax,%rdx
  180b4a:	73 0d                	jae    180b59 <vsnprintf+0x58>
        *sp.s_ = 0;
  180b4c:	c6 02 00             	movb   $0x0,(%rdx)
    } else if (size) {
        sp.end_[-1] = 0;
    }
    return sp.n_;
}
  180b4f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  180b53:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
  180b57:	c9                   	leave
  180b58:	c3                   	ret
        sp.end_[-1] = 0;
  180b59:	c6 40 ff 00          	movb   $0x0,-0x1(%rax)
  180b5d:	eb f0                	jmp    180b4f <vsnprintf+0x4e>

0000000000180b5f <snprintf>:

ssize_t snprintf(char* s, size_t size, const char* format, ...) {
  180b5f:	f3 0f 1e fa          	endbr64
  180b63:	55                   	push   %rbp
  180b64:	48 89 e5             	mov    %rsp,%rbp
  180b67:	48 83 ec 50          	sub    $0x50,%rsp
  180b6b:	48 89 4d e8          	mov    %rcx,-0x18(%rbp)
  180b6f:	4c 89 45 f0          	mov    %r8,-0x10(%rbp)
  180b73:	4c 89 4d f8          	mov    %r9,-0x8(%rbp)
    va_list val;
    va_start(val, format);
  180b77:	c7 45 b8 18 00 00 00 	movl   $0x18,-0x48(%rbp)
  180b7e:	48 8d 45 10          	lea    0x10(%rbp),%rax
  180b82:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
  180b86:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  180b8a:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    int n = vsnprintf(s, size, format, val);
  180b8e:	48 8d 4d b8          	lea    -0x48(%rbp),%rcx
  180b92:	e8 6a ff ff ff       	call   180b01 <vsnprintf>
    va_end(val);
    return n;
  180b97:	48 98                	cltq
}
  180b99:	c9                   	leave
  180b9a:	c3                   	ret

0000000000180b9b <assert_fail(char const*, int, char const*, char const*)>:
int error_vprintf(int cpos, int color, const char* format, va_list val) {
    return console_vprintf(cpos, color, format, val);
}

void assert_fail(const char* file, int line, const char* msg,
                 const char* description) {
  180b9b:	f3 0f 1e fa          	endbr64
  180b9f:	55                   	push   %rbp
  180ba0:	48 89 e5             	mov    %rsp,%rbp
  180ba3:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
  180baa:	41 89 f0             	mov    %esi,%r8d
    cursorpos = CPOS(23, 0);
  180bad:	c7 05 45 84 f3 ff 30 	movl   $0x730,-0xc7bbb(%rip)        # b8ffc <cursorpos>
  180bb4:	07 00 00 
    char buf[240];
    if (description) {
  180bb7:	48 85 c9             	test   %rcx,%rcx
  180bba:	74 39                	je     180bf5 <assert_fail(char const*, int, char const*, char const*)+0x5a>
  180bbc:	49 89 c9             	mov    %rcx,%r9
        snprintf(buf, sizeof(buf),
  180bbf:	48 83 ec 08          	sub    $0x8,%rsp
  180bc3:	52                   	push   %rdx
  180bc4:	56                   	push   %rsi
  180bc5:	57                   	push   %rdi
  180bc6:	48 89 f9             	mov    %rdi,%rcx
  180bc9:	ba 70 13 18 00       	mov    $0x181370,%edx
  180bce:	be f0 00 00 00       	mov    $0xf0,%esi
  180bd3:	48 8d bd 10 ff ff ff 	lea    -0xf0(%rbp),%rdi
  180bda:	b0 00                	mov    $0x0,%al
  180bdc:	e8 7e ff ff ff       	call   180b5f <snprintf>
  180be1:	48 83 c4 20          	add    $0x20,%rsp
    register uintptr_t rax asm("rax") = syscallno;
  180be5:	b8 03 00 00 00       	mov    $0x3,%eax
    asm volatile ("syscall"
  180bea:	48 8d bd 10 ff ff ff 	lea    -0xf0(%rbp),%rdi
  180bf1:	0f 05                	syscall
//    Panic.
[[noreturn]] inline void sys_panic(const char* msg) {
    make_syscall(SYSCALL_PANIC, (uintptr_t) msg);

    // should never get here
    while (true) {
  180bf3:	eb fe                	jmp    180bf3 <assert_fail(char const*, int, char const*, char const*)+0x58>
                 "%s:%d: %s\n%s:%d: user assertion '%s' failed\n",
                 file, line, description, file, line, msg);
    } else {
        snprintf(buf, sizeof(buf),
  180bf5:	49 89 d1             	mov    %rdx,%r9
  180bf8:	48 89 f9             	mov    %rdi,%rcx
  180bfb:	ba a0 13 18 00       	mov    $0x1813a0,%edx
  180c00:	be f0 00 00 00       	mov    $0xf0,%esi
  180c05:	48 8d bd 10 ff ff ff 	lea    -0xf0(%rbp),%rdi
  180c0c:	b0 00                	mov    $0x0,%al
  180c0e:	e8 4c ff ff ff       	call   180b5f <snprintf>
  180c13:	eb d0                	jmp    180be5 <assert_fail(char const*, int, char const*, char const*)+0x4a>
