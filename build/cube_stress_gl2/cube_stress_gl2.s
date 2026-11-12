	.file "IDEKA_module"
	.text
	.globl standard__system__cpu__cpuid_query__0__ret_voidE1
	.def standard__system__cpu__cpuid_query__0__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__system__cpu__cpuid_query__0__ret_voidE1:
	subq $64, %rsp
	movq %rbx, 48(%rsp)
	movq %rsi, 40(%rsp)
	movq %rdi, 32(%rsp)
.LB3:
	cmpb $0, standard__system__cpu__g_cpuid_run(%rip)
	jne .LB6
.LB7:
	movq $7,  %rax
	                    xorq %rcx, %rcx
	                    cpuid
	                    movq %rax, %rsi
	                    movq %rbx, %rdi
	                    movq %rcx, %r8
	                    movq %rdx, %r9
	movq %rsi, (%rsp)
	movq %rdi, 8(%rsp)
	movq %r8, 16(%rsp)
	movq %r9, 24(%rsp)
	movq 8(%rsp), %rax
	sarq $9, %rax
	andq $1, %rax
	andl $1, %eax
	movb %al, standard__system__cpu__g_ermsb(%rip)
	movq $0x80000006, %rax
	                    cpuid
	                    movq %rcx, %rsi
	sarq $16, %rsi
	andq $65535, %rsi
	shlq $10, %rsi
	movq %rsi, standard__system__cpu__g_l2_bytes(%rip)
	testq %rsi, %rsi
	je .LB32
.LB33:
	movb $1, standard__system__cpu__g_cpuid_run(%rip)
	movq 48(%rsp), %rbx
	movq 40(%rsp), %rsi
	movq 32(%rsp), %rdi
	addq $64, %rsp
	ret
.LB32:
	movq $262144, standard__system__cpu__g_l2_bytes(%rip)
	movb $1, standard__system__cpu__g_cpuid_run(%rip)
	movq 48(%rsp), %rbx
	movq 40(%rsp), %rsi
	movq 32(%rsp), %rdi
	addq $64, %rsp
	ret
.LB6:
	movq 48(%rsp), %rbx
	movq 40(%rsp), %rsi
	movq 32(%rsp), %rdi
	addq $64, %rsp
	ret
	.text
	.globl standard__system__cpu__l2_bytes__0__ret_ulongE1
	.def standard__system__cpu__l2_bytes__0__ret_ulongE1;
	.scl 2;
	.type 32;
	.endef
standard__system__cpu__l2_bytes__0__ret_ulongE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB34:
	callq standard__system__cpu__cpuid_query__0__ret_voidE1
	movq standard__system__cpu__g_l2_bytes(%rip), %rax
	leave
	ret
	.text
	.globl standard__system__cpu__ermsb__0__ret_boolE1
	.def standard__system__cpu__ermsb__0__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__system__cpu__ermsb__0__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB36:
	callq standard__system__cpu__cpuid_query__0__ret_voidE1
	movzbl standard__system__cpu__g_ermsb(%rip), %eax
	leave
	ret
	.text
	.globl memset
	.def memset;
	.scl 2;
	.type 32;
	.endef
memset:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
.LB38:
	movl %edx, %eax
	xorl %edx, %edx
	testq %r8, %r8
	cmova %r8, %rdx
	shrq $2, %rdx
	xorl %esi, %esi
.LB25010:
	testq %rdx, %rdx
	je .LB25012
.LB25011:
	movb %al, (%rcx,%rsi,1)
	movb %al, 1(%rcx,%rsi,1)
	movb %al, 2(%rcx,%rsi,1)
	movb %al, 3(%rcx,%rsi,1)
	addq $4, %rsi
	decq %rdx
	jne .LB25011
.LB25012:
.LB45:
	cmpq %r8, %rsi
	jae .LB47
.LB46:
	movb %al, (%rcx,%rsi,1)
	incq %rsi
	cmpq %r8, %rsi
	jb .LB46
.LB47:
	movq %rcx, %rax
	movq 0(%rsp), %rsi
	addq $16, %rsp
	ret
	.text
	.globl memcpy
	.def memcpy;
	.scl 2;
	.type 32;
	.endef
memcpy:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
	movq %rdi, -8(%rsp)
.LB59:
	xorl %eax, %eax
	testq %r8, %r8
	cmova %r8, %rax
	shrq $2, %rax
	xorl %esi, %esi
.LB25013:
	testq %rax, %rax
	je .LB25015
.LB25014:
	movslq %esi, %rdi
	movzbl (%rdx,%rdi,1), %edi
	movb %dil, (%rcx,%rsi,1)
	leaq 1(%rsi), %rdi
	movslq %edi, %rdi
	movzbl (%rdx,%rdi,1), %edi
	movb %dil, 1(%rcx,%rsi,1)
	leaq 2(%rsi), %rdi
	movslq %edi, %rdi
	movzbl (%rdx,%rdi,1), %edi
	movb %dil, 2(%rcx,%rsi,1)
	leaq 3(%rsi), %rdi
	movslq %edi, %rdi
	movzbl (%rdx,%rdi,1), %edi
	movb %dil, 3(%rcx,%rsi,1)
	addq $4, %rsi
	decq %rax
	jne .LB25014
.LB25015:
.LB68:
	cmpq %r8, %rsi
	jae .LB70
.LB69:
	movslq %esi, %rax
	movzbl (%rdx,%rax,1), %eax
	movb %al, (%rcx,%rsi,1)
	incq %rsi
	cmpq %r8, %rsi
	jb .LB69
.LB70:
	movq %rcx, %rax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
	.text
	.globl mem_fill__3__voidE1_ptr1__byteE1__dataE1_ubits64__ret_voidE1
	.def mem_fill__3__voidE1_ptr1__byteE1__dataE1_ubits64__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
mem_fill__3__voidE1_ptr1__byteE1__dataE1_ubits64__ret_voidE1:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
	movq %rdi, -8(%rsp)
.LB85:
	movq %rcx, %rax
	movzbl %dl, %ecx
	movq %rcx, %rsi
	shlq $8, %rsi
	orq %rcx, %rsi
	movq %rcx, %rdi
	shlq $16, %rdi
	orq %rdi, %rsi
	movq %rcx, %rdi
	shlq $24, %rdi
	orq %rdi, %rsi
	movq %rcx, %rdi
	shlq $32, %rdi
	orq %rdi, %rsi
	movq %rcx, %rdi
	shlq $40, %rdi
	orq %rdi, %rsi
	movq %rcx, %rdi
	shlq $48, %rdi
	orq %rdi, %rsi
	shlq $56, %rcx
	orq %rcx, %rsi
	movq %rax, %rcx
	andq $7, %rcx
	jne .LB136
.LB137:
.LB138:
	movq %r8, %rcx
	shrq $3, %rcx
	xorl %edi, %edi
	testq %rcx, %rcx
	cmova %rcx, %rdi
	shrq $2, %rdi
	xorl %r9d, %r9d
.LB25021:
	testq %rdi, %rdi
	je .LB25023
.LB25022:
	movq %rsi, (%rax,%r9,8)
	movq %rsi, 8(%rax,%r9,8)
	movq %rsi, 16(%rax,%r9,8)
	movq %rsi, 24(%rax,%r9,8)
	addq $4, %r9
	decq %rdi
	jne .LB25022
	jmp .LB25023
.LB136:
	movl $8, %edi
	subq %rcx, %rdi
	cmpq %r8, %rdi
	cmova %r8, %rdi
	xorl %ecx, %ecx
	testq %rdi, %rdi
	cmova %rdi, %rcx
	shrq $2, %rcx
	xorl %r9d, %r9d
.LB25018:
	testq %rcx, %rcx
	je .LB25020
.LB25019:
	movb %dl, (%rax,%r9,1)
	movb %dl, 1(%rax,%r9,1)
	movb %dl, 2(%rax,%r9,1)
	movb %dl, 3(%rax,%r9,1)
	addq $4, %r9
	decq %rcx
	jne .LB25019
.LB25020:
.LB150:
	cmpq %rdi, %r9
	jae .LB152
.LB151:
	movb %dl, (%rax,%r9,1)
	incq %r9
	cmpq %rdi, %r9
	jb .LB151
.LB152:
	addq %rdi, %rax
	subq %rdi, %r8
	jmp .LB138
.LB25023:
.LB176:
	cmpq %rcx, %r9
	jae .LB178
.LB177:
	movq %rsi, (%rax,%r9,8)
	incq %r9
	cmpq %rcx, %r9
	jb .LB177
.LB178:
	shlq $3, %rcx
	addq %rcx, %rax
	subq %rcx, %r8
	cmpq $32, %r8
	jge .LB25016
.LB25017:
	xorl %ecx, %ecx
	testq %r8, %r8
	cmova %r8, %rcx
	shrq $2, %rcx
	xorl %esi, %esi
.LB25024:
	testq %rcx, %rcx
	je .LB25026
.LB25025:
	movb %dl, (%rax,%rsi,1)
	movb %dl, 1(%rax,%rsi,1)
	movb %dl, 2(%rax,%rsi,1)
	movb %dl, 3(%rax,%rsi,1)
	addq $4, %rsi
	decq %rcx
	jne .LB25025
.LB25026:
.LB202:
	cmpq %r8, %rsi
	jae .LB204
.LB203:
	movb %dl, (%rax,%rsi,1)
	incq %rsi
	cmpq %r8, %rsi
	jb .LB203
	jmp .LB204
.LB25016:
	movq %rax, %rdi
	movq %r8, %rcx
	movl %edx, %eax
	rep stosb
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB204:
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
	.text
	.globl standard__memory__mem_fill__3__voidE1_ptr1__byteE1__dataE1_ubits64__ret_voidE1
	.def standard__memory__mem_fill__3__voidE1_ptr1__byteE1__dataE1_ubits64__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__memory__mem_fill__3__voidE1_ptr1__byteE1__dataE1_ubits64__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB214:
	movzbl %dl, %edx
	callq memset
	leave
	ret
	.text
	.globl standard__memory__allocators__stdheap__heap_os_alloc__1__dataE1_ubits64__ret_dataE1_ubits64
	.def standard__memory__allocators__stdheap__heap_os_alloc__1__dataE1_ubits64__ret_dataE1_ubits64;
	.scl 2;
	.type 32;
	.endef
standard__memory__allocators__stdheap__heap_os_alloc__1__dataE1_ubits64__ret_dataE1_ubits64:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB223:
	movq %rcx, %rdx
	xorl %ecx, %ecx
	movl $12288, %r8d
	movl $4, %r9d
	callq VirtualAlloc
	leave
	ret
	.text
	.globl standard__memory__allocators__stdheap__heap_os_free__2__dataE1_ubits64__dataE1_ubits64__ret_voidE1
	.def standard__memory__allocators__stdheap__heap_os_free__2__dataE1_ubits64__dataE1_ubits64__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__memory__allocators__stdheap__heap_os_free__2__dataE1_ubits64__dataE1_ubits64__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB228:
	xorl %edx, %edx
	movl $32768, %r8d
	callq VirtualFree
	leave
	ret
	.text
	.globl standard__memory__allocators__stdheap__bit_scan_rev__1__dataE1_ubits64__ret_dataE1_ubits64
	.def standard__memory__allocators__stdheap__bit_scan_rev__1__dataE1_ubits64__ret_dataE1_ubits64;
	.scl 2;
	.type 32;
	.endef
standard__memory__allocators__stdheap__bit_scan_rev__1__dataE1_ubits64__ret_dataE1_ubits64:
.LB234:
	movq %rcx, %rax
	bsrq %rax, %rax
	ret
	.text
	.globl standard__memory__allocators__stdheap__class_block_size__1__dataE1_ubits64__ret_dataE1_ubits64
	.def standard__memory__allocators__stdheap__class_block_size__1__dataE1_ubits64__ret_dataE1_ubits64;
	.scl 2;
	.type 32;
	.endef
standard__memory__allocators__stdheap__class_block_size__1__dataE1_ubits64__ret_dataE1_ubits64:
.LB240:
	cmpq $8, %rcx
	ja .LB246
.LB247:
	movl $16, %eax
	shlx %rcx, %rax, %rax
	ret
.LB246:
	movl $4096, %eax
	ret
	.text
	.globl standard__memory__allocators__stdheap__bin_push__2__dataE1_ubits64__FreeNodeE1_ptr1__ret_voidE1
	.def standard__memory__allocators__stdheap__bin_push__2__dataE1_ubits64__FreeNodeE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__memory__allocators__stdheap__bin_push__2__dataE1_ubits64__FreeNodeE1_ptr1__ret_voidE1:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
.LB252:
	cmpq $8, %rcx
	ja .LB259
.LB260:
	leaq standard__memory__allocators__stdheap__g_bins(%rip), %rax
	movslq %ecx, %rsi
	movq (%rax,%rsi,8), %rax
	movq %rax, (%rdx)
	leaq standard__memory__allocators__stdheap__g_bins(%rip), %rax
	movq %rdx, (%rax,%rcx,8)
	movq 0(%rsp), %rsi
	addq $16, %rsp
	ret
.LB259:
	movq 0(%rsp), %rsi
	addq $16, %rsp
	ret
	.text
	.globl standard__memory__allocators__stdheap__table_hash__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64
	.def standard__memory__allocators__stdheap__table_hash__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64;
	.scl 2;
	.type 32;
	.endef
standard__memory__allocators__stdheap__table_hash__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64:
.LB271:
	shrq $4, %rcx
	movabsq $-7046029254386353131, %rax
	imulq %rax, %rcx
	movq %rcx, %rax
	shrq $32, %rax
	xorq %rax, %rcx
	decq %rdx
	movq %rcx, %rax
	andq %rdx, %rax
	ret
	.text
	.globl standard__memory__allocators__stdheap__table_raw_insert__6__BlockEntryE1_ptr1__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__ret_voidE1
	.def standard__memory__allocators__stdheap__table_raw_insert__6__BlockEntryE1_ptr1__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__memory__allocators__stdheap__table_raw_insert__6__BlockEntryE1_ptr1__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__ret_voidE1:
	subq $32, %rsp
	movq %rbx, 16(%rsp)
	movq %rsi, 8(%rsp)
	movq %rdi, 0(%rsp)
.LB290:
	movq 72(%rsp), %rax
	movq 80(%rsp), %rsi
	movq %r8, %rdi
	shrq $4, %rdi
	movabsq $-7046029254386353131, %rbx
	imulq %rbx, %rdi
	movq %rdi, %rbx
	shrq $32, %rbx
	xorq %rbx, %rdi
	decq %rdx
	andq %rdx, %rdi
.LB301:
	movslq %edi, %rbx
	shlq $5, %rbx
	leaq (%rcx,%rbx,1), %rbx
	cmpq $0, (%rbx)
	je .LB303
.LB302:
	incq %rdi
	andq %rdx, %rdi
	jmp .LB301
.LB303:
	movq %r8, (%rbx)
	movq %r9, 8(%rbx)
	movq %rax, 16(%rbx)
	movq %rsi, 24(%rbx)
	movq 16(%rsp), %rbx
	movq 8(%rsp), %rsi
	movq 0(%rsp), %rdi
	addq $32, %rsp
	ret
	.text
	.globl standard__memory__allocators__stdheap__table_grow__0__ret_boolE1
	.def standard__memory__allocators__stdheap__table_grow__0__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__memory__allocators__stdheap__table_grow__0__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $176, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
	movq %r14, -48(%rbp)
	movq %r15, -56(%rbp)
.LB352:
	movq standard__memory__allocators__stdheap__g_table_cap(%rip), %rax
	xorl %ecx, %ecx
	movl $12288, %r8d
	movl $4, %r9d
	movq %rax, %rsi
	shlq $1, %rsi
	movq %rsi, %rdx
	shlq $5, %rdx
	movq %rdx, -88(%rbp)
	callq VirtualAlloc
	movq %rax, %rdi
	testq %rdi, %rdi
	je .LB368
.LB369:
	movq $0, standard__memory__allocators__stdheap__g_table_count(%rip)
	xorl %ebx, %ebx
.LB375:
	movq standard__memory__allocators__stdheap__g_table_cap(%rip), %rax
	cmpq %rax, %rbx
	jae .LB377
.LB376:
	movq standard__memory__allocators__stdheap__g_table(%rip), %rax
	movslq %ebx, %rcx
	shlq $5, %rcx
	leaq (%rax,%rcx,1), %rax
	movq (%rax), %r8
	testq %r8, %r8
	jne .LB394
.LB393:
	incq %rbx
	jmp .LB375
.LB377:
	movq standard__memory__allocators__stdheap__g_table(%rip), %rax
	movq %rax, -120(%rbp)
	movq -120(%rbp), %rax
	shrq $4, %rax
	movabsq $-7046029254386353131, %rcx
	imulq %rcx, %rax
	movq %rax, %rcx
	shrq $32, %rcx
	xorq %rcx, %rax
	leaq -1(%rsi), %rcx
	andq %rcx, %rax
	movq %rax, -128(%rbp)
	xorl %eax, %eax
	xorl %edx, %edx
	xorl %r8d, %r8d
	xorl %r9d, %r9d
	xorl %ebx, %ebx
	xorl %r12d, %r12d
	movq $0, -64(%rbp)
	movq $0, -72(%rbp)
	movq $0, -80(%rbp)
.LB457:
	movl -128(%rbp), %r13d
	movslq %r13d, %r14
	shlq $5, %r14
	movq (%rdi,%r14,1), %r14
	testq %r14, %r14
	je .LB459
.LB458:
	movq -120(%rbp), %r15
	cmpq %r15, %r14
	je .LB486
.LB487:
	movq -64(%rbp), %r13
	movq -72(%rbp), %r10
	movq %r10, -96(%rbp)
	movq -80(%rbp), %r10
	movq %r10, -104(%rbp)
.LB485:
	testb %r9b, %r9b
	jne .LB459
.LB657:
	movq -128(%rbp), %r14
	incq %r14
	andq %rcx, %r14
	movq %r14, -128(%rbp)
	movq %r13, -64(%rbp)
	movq -96(%rbp), %r10
	movq %r10, -72(%rbp)
	movq -104(%rbp), %r10
	movq %r10, -80(%rbp)
	jmp .LB457
.LB486:
	movslq %r13d, %rax
	shlq $5, %rax
	movq $0, (%rdi,%rax,1)
	movq standard__memory__allocators__stdheap__g_table_count(%rip), %rax
	decq %rax
	movq %rax, standard__memory__allocators__stdheap__g_table_count(%rip)
	movq -128(%rbp), %rax
	incq %rax
	andq %rcx, %rax
	movq %rax, %rdx
	movq -64(%rbp), %r13
	movq -72(%rbp), %r9
	movq -80(%rbp), %r10
	movq %r10, -112(%rbp)
	movq -128(%rbp), %rax
.LB505:
	movslq %edx, %r14
	shlq $5, %r14
	movq (%rdi,%r14,1), %r14
	testq %r14, %r14
	je .LB507
.LB506:
	movq %r14, %r8
	shrq $4, %r8
	movabsq $-7046029254386353131, %r9
	imulq %r9, %r8
	movq %r8, %r9
	shrq $32, %r9
	xorq %r9, %r8
	movq %r8, %r9
	andq %rcx, %r9
	cmpq %rdx, %rax
	jb .LB537
.LB538:
	xorl %ebx, %ebx
	cmpq %rax, %r9
	seta %bl
	xorl %r12d, %r12d
	cmpq %rdx, %r9
	setbe %r12b
	orl %r12d, %ebx
	xorl %r12d, %r12d
	movl $1, %r13d
	testb %bl, %bl
	cmove %r13d, %r12d
.LB536:
	testb %r12b, %r12b
	jne .LB573
.LB574:
.LB572:
	incq %rdx
	andq %rcx, %rdx
	movq %r14, %r13
	movq %r8, -112(%rbp)
	movq %r9, %r8
	movq %rsi, %r9
	movq %rbx, %r11
	movq %r12, %rbx
	movq %r11, %r12
	jmp .LB505
.LB507:
	movq %r9, -96(%rbp)
	movq -112(%rbp), %r10
	movq %r10, -104(%rbp)
	movl $1, %r9d
	testb %r9b, %r9b
	je .LB657
.LB459:
	movq standard__memory__allocators__stdheap__g_table(%rip), %rax
	movq %rax, %rcx
	xorl %edx, %edx
	movl $32768, %r8d
	callq VirtualFree
	movq %rdi, standard__memory__allocators__stdheap__g_table(%rip)
	movq %rsi, standard__memory__allocators__stdheap__g_table_cap(%rip)
	movq -88(%rbp), %r9
	movq %rdi, %rcx
	movq %rsi, %rdx
	movq %rdi, %r8
	movq %r9, standard__memory__allocators__stdheap__g_table_slab_cap(%rip)
	movq $2, 32(%rsp)
	movq %rdi, 40(%rsp)
	callq standard__memory__allocators__stdheap__table_raw_insert__6__BlockEntryE1_ptr1__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__ret_voidE1
	movq standard__memory__allocators__stdheap__g_table_count(%rip), %rax
	incq %rax
	movq %rax, standard__memory__allocators__stdheap__g_table_count(%rip)
	movl $1, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB537:
	xorl %ebx, %ebx
	cmpq %rax, %r9
	seta %bl
	xorl %r12d, %r12d
	cmpq %rdx, %r9
	setbe %r12b
	andl %r12d, %ebx
	xorl %r12d, %r12d
	movl $1, %r13d
	testb %bl, %bl
	cmove %r13d, %r12d
	testb %r12b, %r12b
	je .LB574
.LB573:
	movslq %edx, %r13
	movslq %eax, %rax
	shlq $5, %r13
	shlq $5, %rax
	leaq (%rdi,%r13,1), %r13
	leaq (%rdi,%rax,1), %rax
	movq (%r13), %r15
	movq %r15, (%rax)
	movq 8(%r13), %r15
	movq %r15, 8(%rax)
	movq 16(%r13), %r15
	movq %r15, 16(%rax)
	movq 24(%r13), %r15
	movq %r15, 24(%rax)
	movq $0, (%r13)
	movq %rdx, %rax
	jmp .LB572
.LB394:
	movq 8(%rax), %r9
	movq 16(%rax), %rcx
	movq 24(%rax), %rax
	movq %rsi, %rdx
	movq %rcx, 32(%rsp)
	movq %rax, 40(%rsp)
	movq %rdi, %rcx
	callq standard__memory__allocators__stdheap__table_raw_insert__6__BlockEntryE1_ptr1__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__ret_voidE1
	movq standard__memory__allocators__stdheap__g_table_count(%rip), %rax
	incq %rax
	movq %rax, standard__memory__allocators__stdheap__g_table_count(%rip)
	jmp .LB393
.LB368:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
	.text
	.globl standard__memory__allocators__stdheap__table_init__0__ret_boolE1
	.def standard__memory__allocators__stdheap__table_init__0__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__memory__allocators__stdheap__table_init__0__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB682:
	xorl %ecx, %ecx
	movl $32768, %edx
	movl $12288, %r8d
	movl $4, %r9d
	callq VirtualAlloc
	movq %rax, %rsi
	testq %rsi, %rsi
	je .LB696
.LB697:
	movq %rsi, %rdi
	movl $32768, %ecx
	xorl %eax, %eax
	rep stosb
.LB704:
	movq %rsi, %rcx
	movl $1024, %edx
	movq %rsi, %r8
	movl $32768, %r9d
	movq %rcx, standard__memory__allocators__stdheap__g_table(%rip)
	movq $1024, standard__memory__allocators__stdheap__g_table_cap(%rip)
	movq $0, standard__memory__allocators__stdheap__g_table_count(%rip)
	movq $32768, standard__memory__allocators__stdheap__g_table_slab_cap(%rip)
	movq $2, 32(%rsp)
	movq %rsi, 40(%rsp)
	callq standard__memory__allocators__stdheap__table_raw_insert__6__BlockEntryE1_ptr1__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__ret_voidE1
	movq standard__memory__allocators__stdheap__g_table_count(%rip), %rax
	incq %rax
	movq %rax, standard__memory__allocators__stdheap__g_table_count(%rip)
	movl $1, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB696:
	xorl %eax, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__memory__allocators__stdheap__table_insert__4__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__ret_boolE1
	.def standard__memory__allocators__stdheap__table_insert__4__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__memory__allocators__stdheap__table_insert__4__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $80, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
.LB728:
	movq standard__memory__allocators__stdheap__g_table(%rip), %rax
	movq %rcx, %rsi
	movq %rdx, %rdi
	movq %r8, %rbx
	movq %r9, %r12
	testq %rax, %rax
	je .LB741
.LB740:
	movq standard__memory__allocators__stdheap__g_table_count(%rip), %rax
	movq standard__memory__allocators__stdheap__g_table_cap(%rip), %rcx
	shlq $1, %rax
	cmpq %rcx, %rax
	jae .LB754
.LB753:
	movq standard__memory__allocators__stdheap__g_table(%rip), %rcx
	movq standard__memory__allocators__stdheap__g_table_cap(%rip), %rdx
	movq %rbx, 32(%rsp)
	movq %r12, 40(%rsp)
	movq %rsi, %r8
	movq %rdi, %r9
	callq standard__memory__allocators__stdheap__table_raw_insert__6__BlockEntryE1_ptr1__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__ret_voidE1
	movq standard__memory__allocators__stdheap__g_table_count(%rip), %rax
	incq %rax
	movq %rax, standard__memory__allocators__stdheap__g_table_count(%rip)
	movl $1, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB741:
	callq standard__memory__allocators__stdheap__table_init__0__ret_boolE1
	testb %al, %al
	je .LB746
	jmp .LB740
.LB754:
	callq standard__memory__allocators__stdheap__table_grow__0__ret_boolE1
	testb %al, %al
	jne .LB753
.LB759:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB746:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
	.text
	.globl standard__memory__allocators__stdheap__table_find__1__dataE1_ubits64__ret_BlockEntryE1_ptr1
	.def standard__memory__allocators__stdheap__table_find__1__dataE1_ubits64__ret_BlockEntryE1_ptr1;
	.scl 2;
	.type 32;
	.endef
standard__memory__allocators__stdheap__table_find__1__dataE1_ubits64__ret_BlockEntryE1_ptr1:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
	movq %rdi, -8(%rsp)
.LB770:
	movq standard__memory__allocators__stdheap__g_table(%rip), %rax
	testq %rax, %rax
	je .LB780
.LB781:
	movq standard__memory__allocators__stdheap__g_table_cap(%rip), %rdx
	movq %rcx, %rsi
	shrq $4, %rsi
	movabsq $-7046029254386353131, %rdi
	imulq %rdi, %rsi
	movq %rsi, %rdi
	shrq $32, %rdi
	xorq %rdi, %rsi
	decq %rdx
	andq %rdx, %rsi
.LB788:
	movslq %esi, %rdi
	shlq $5, %rdi
	movq (%rax,%rdi,1), %rdi
	testq %rdi, %rdi
	je .LB790
.LB789:
	cmpq %rcx, %rdi
	je .LB817
.LB818:
	incq %rsi
	andq %rdx, %rsi
	jmp .LB788
.LB790:
	xorl %eax, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB817:
	shlq $5, %rsi
	leaq (%rax,%rsi,1), %rax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB780:
	xorl %eax, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
	.text
	.globl standard__memory__allocators__stdheap__table_remove__1__dataE1_ubits64__ret_voidE1
	.def standard__memory__allocators__stdheap__table_remove__1__dataE1_ubits64__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__memory__allocators__stdheap__table_remove__1__dataE1_ubits64__ret_voidE1:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
	movq %rdi, -8(%rsp)
.LB831:
	movq standard__memory__allocators__stdheap__g_table(%rip), %rax
	testq %rax, %rax
	je .LB841
.LB842:
	movq standard__memory__allocators__stdheap__g_table_cap(%rip), %rdx
	movq %rcx, %rsi
	shrq $4, %rsi
	movabsq $-7046029254386353131, %rdi
	imulq %rdi, %rsi
	movq %rsi, %rdi
	shrq $32, %rdi
	xorq %rdi, %rsi
	decq %rdx
	andq %rdx, %rsi
.LB852:
	movslq %esi, %rdi
	shlq $5, %rdi
	movq (%rax,%rdi,1), %rdi
	testq %rdi, %rdi
	je .LB854
.LB853:
	cmpq %rcx, %rdi
	je .LB880
.LB881:
	incq %rsi
	andq %rdx, %rsi
	jmp .LB852
.LB854:
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB880:
	movslq %esi, %rcx
	shlq $5, %rcx
	movq $0, (%rax,%rcx,1)
	movq standard__memory__allocators__stdheap__g_table_count(%rip), %rax
	decq %rax
	movq %rax, standard__memory__allocators__stdheap__g_table_count(%rip)
	leaq 1(%rsi), %rax
	movq standard__memory__allocators__stdheap__g_table_cap(%rip), %rcx
	decq %rcx
	andq %rcx, %rax
.LB899:
	movq standard__memory__allocators__stdheap__g_table(%rip), %rcx
	movslq %eax, %rdx
	shlq $5, %rdx
	movq (%rcx,%rdx,1), %rdx
	testq %rdx, %rdx
	je .LB901
.LB900:
	movq standard__memory__allocators__stdheap__g_table_cap(%rip), %rdi
	shrq $4, %rdx
	movabsq $-7046029254386353131, %r8
	imulq %r8, %rdx
	movq %rdx, %r8
	shrq $32, %r8
	xorq %r8, %rdx
	decq %rdi
	andq %rdi, %rdx
	cmpq %rax, %rsi
	jb .LB930
.LB931:
	xorl %edi, %edi
	cmpq %rsi, %rdx
	seta %dil
	xorl %r8d, %r8d
	cmpq %rax, %rdx
	setbe %r8b
	orl %r8d, %edi
	xorl %edx, %edx
	movl $1, %r8d
	testb %dil, %dil
	cmove %r8d, %edx
.LB929:
	testb %dl, %dl
	jne .LB966
.LB967:
.LB965:
	incq %rax
	movq standard__memory__allocators__stdheap__g_table_cap(%rip), %rcx
	decq %rcx
	andq %rcx, %rax
	jmp .LB899
.LB901:
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB930:
	xorl %edi, %edi
	cmpq %rsi, %rdx
	seta %dil
	xorl %r8d, %r8d
	cmpq %rax, %rdx
	setbe %r8b
	andl %r8d, %edi
	xorl %edx, %edx
	movl $1, %r8d
	testb %dil, %dil
	cmove %r8d, %edx
	testb %dl, %dl
	je .LB967
.LB966:
	movslq %eax, %rdx
	shlq $5, %rdx
	movq (%rcx,%rdx,1), %rdx
	movslq %esi, %rdi
	shlq $5, %rdi
	movq %rdx, (%rcx,%rdi,1)
	movq standard__memory__allocators__stdheap__g_table(%rip), %rcx
	movslq %eax, %rdx
	shlq $5, %rdx
	movq 8(%rcx,%rdx,1), %rdx
	movslq %esi, %rdi
	shlq $5, %rdi
	movq %rdx, 8(%rcx,%rdi,1)
	movq standard__memory__allocators__stdheap__g_table(%rip), %rcx
	movslq %eax, %rdx
	shlq $5, %rdx
	movq 16(%rcx,%rdx,1), %rdx
	movslq %esi, %rdi
	shlq $5, %rdi
	movq %rdx, 16(%rcx,%rdi,1)
	movq standard__memory__allocators__stdheap__g_table(%rip), %rcx
	movslq %eax, %rdx
	shlq $5, %rdx
	movq 24(%rcx,%rdx,1), %rdx
	movslq %esi, %rsi
	shlq $5, %rsi
	movq %rdx, 24(%rcx,%rsi,1)
	movq standard__memory__allocators__stdheap__g_table(%rip), %rcx
	movslq %eax, %rdx
	shlq $5, %rdx
	movq $0, (%rcx,%rdx,1)
	movq %rax, %rsi
	jmp .LB965
.LB841:
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
	.text
	.globl standard__memory__allocators__stdheap__heap_new_slab__1__dataE1_ubits64__ret_SlabE1_ptr1
	.def standard__memory__allocators__stdheap__heap_new_slab__1__dataE1_ubits64__ret_SlabE1_ptr1;
	.scl 2;
	.type 32;
	.endef
standard__memory__allocators__stdheap__heap_new_slab__1__dataE1_ubits64__ret_SlabE1_ptr1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
.LB1054:
	movq standard__memory__allocators__stdheap__g_next_slab_size(%rip), %rax
	addq $48, %rcx
	cmpq %rax, %rcx
	movq %rax, %rsi
	cmova %rcx, %rsi
	xorl %ecx, %ecx
	movq %rsi, %rdx
	movl $12288, %r8d
	movl $4, %r9d
	callq VirtualAlloc
	testq %rax, %rax
	je .LB1081
.LB1082:
	movq %rax, (%rax)
	movq %rsi, 8(%rax)
	movq $48, 16(%rax)
	movq $0, 24(%rax)
	movq standard__memory__allocators__stdheap__g_slab_head(%rip), %rcx
	movq %rcx, 32(%rax)
	movq %rax, standard__memory__allocators__stdheap__g_slab_head(%rip)
	movq standard__memory__allocators__stdheap__g_next_slab_size(%rip), %rcx
	movq standard__memory__allocators__stdheap__g_slab_size_cap(%rip), %rdx
	shlq $1, %rcx
	cmpq %rdx, %rcx
	cmova %rdx, %rcx
	movq %rcx, standard__memory__allocators__stdheap__g_next_slab_size(%rip)
	movq -8(%rbp), %rsi
	leave
	ret
.LB1081:
	xorl %eax, %eax
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl standard__memory__allocators__stdheap__bump_alloc__1__dataE1_ubits64__ret_dataE1_ubits64
	.def standard__memory__allocators__stdheap__bump_alloc__1__dataE1_ubits64__ret_dataE1_ubits64;
	.scl 2;
	.type 32;
	.endef
standard__memory__allocators__stdheap__bump_alloc__1__dataE1_ubits64__ret_dataE1_ubits64:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
	movq %rdi, -8(%rsp)
.LB1120:
	movq standard__memory__allocators__stdheap__g_slab_head(%rip), %rax
	testq %rax, %rax
	je .LB1135
.LB1136:
	movq 16(%rax), %rdx
	movq 8(%rax), %rsi
	movq (%rax), %rdi
	addq %rdx, %rcx
	leaq (%rdi,%rdx,1), %rdx
	movq %rcx, 16(%rax)
	xorl %eax, %eax
	cmpq %rsi, %rcx
	cmovbe %rdx, %rax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB1135:
	xorl %eax, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
	.text
	.globl standard__memory__allocators__stdheap__fmalloc_large__1__dataE1_ubits64__ret_dataE1_ubits64
	.def standard__memory__allocators__stdheap__fmalloc_large__1__dataE1_ubits64__ret_dataE1_ubits64;
	.scl 2;
	.type 32;
	.endef
standard__memory__allocators__stdheap__fmalloc_large__1__dataE1_ubits64__ret_dataE1_ubits64:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB1181:
	movq %rcx, %rsi
	xorl %ecx, %ecx
	movq %rsi, %rdx
	movl $12288, %r8d
	movl $4, %r9d
	callq VirtualAlloc
	movq %rax, %rdi
	testq %rdi, %rdi
	je .LB1190
.LB1191:
	movq %rdi, %rcx
	movq %rsi, %rdx
	movl $1, %r8d
	movq %rsi, %r9
	callq standard__memory__allocators__stdheap__table_insert__4__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__ret_boolE1
	testb %al, %al
	je .LB1200
.LB1201:
	movq standard__memory__allocators__stdheap__g_large_used(%rip), %rax
	incq %rax
	movq %rax, standard__memory__allocators__stdheap__g_large_used(%rip)
	movq %rdi, %rax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB1200:
	movq %rdi, %rcx
	xorl %edx, %edx
	movl $32768, %r8d
	callq VirtualFree
	xorl %eax, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB1190:
	xorl %eax, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	.def standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64;
	.scl 2;
	.type 32;
	.endef
standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB1208:
	testq %rcx, %rcx
	je .LB1214
.LB1215:
	cmpq $4096, %rcx
	ja .LB1221
.LB1222:
	decq %rcx
	movq %rcx, %rax
	orq $15, %rax
	bsrq %rax, %rax
	leaq -3(%rax), %rsi
	leaq standard__memory__allocators__stdheap__g_bins(%rip), %rax
	movslq %esi, %rcx
	movq (%rax,%rcx,8), %rax
	testq %rax, %rax
	jne .LB1244
.LB1245:
	movl $16, %eax
	shlx %rsi, %rax, %rax
	movl $4096, %ecx
	cmpq $8, %rsi
	movq %rax, %rdi
	cmova %rcx, %rdi
	movq standard__memory__allocators__stdheap__g_slab_head(%rip), %rax
	testq %rax, %rax
	je .LB24817
.LB24818:
	movq 16(%rax), %rcx
	movq 8(%rax), %r8
	movq (%rax), %r9
	leaq (%rcx,%rdi), %rdx
	leaq (%r9,%rcx,1), %rcx
	movq %rdx, 16(%rax)
	xorl %eax, %eax
	cmpq %r8, %rdx
	cmovbe %rcx, %rax
.LB24814:
	testq %rax, %rax
	je .LB1265
.LB1266:
	movq %rax, %rdi
.LB1264:
	movq standard__memory__allocators__stdheap__g_slab_head(%rip), %rax
	movq %rax, %r9
	movq %rdi, %rcx
	movq %rsi, %rdx
	xorl %r8d, %r8d
	callq standard__memory__allocators__stdheap__table_insert__4__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__ret_boolE1
	testb %al, %al
	je .LB1296
.LB1297:
	movq standard__memory__allocators__stdheap__g_slab_head(%rip), %rax
	movq 24(%rax), %rcx
	incq %rcx
	movq %rcx, 24(%rax)
	movq %rdi, %rax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB24817:
	xorl %eax, %eax
	testq %rax, %rax
	jne .LB1266
.LB1265:
	movq %rdi, %rcx
	callq standard__memory__allocators__stdheap__heap_new_slab__1__dataE1_ubits64__ret_SlabE1_ptr1
	testq %rax, %rax
	je .LB1275
.LB1276:
	movq standard__memory__allocators__stdheap__g_slab_head(%rip), %rax
	testq %rax, %rax
	je .LB24812
.LB24813:
	movq 16(%rax), %rcx
	leaq (%rcx,%rdi), %rdx
	movq 8(%rax), %rdi
	movq (%rax), %r8
	leaq (%r8,%rcx,1), %rcx
	movq %rdx, 16(%rax)
	xorl %eax, %eax
	cmpq %rdi, %rdx
	cmovbe %rcx, %rax
.LB24809:
	testq %rax, %rax
	je .LB1284
.LB1285:
	movq %rax, %rdi
	jmp .LB1264
.LB24812:
	xorl %eax, %eax
	testq %rax, %rax
	je .LB1284
	jmp .LB1285
.LB1296:
	xorl %eax, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB1284:
	xorl %eax, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB1275:
	xorl %eax, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB1244:
	leaq standard__memory__allocators__stdheap__g_bins(%rip), %rdx
	movq (%rax), %rcx
	movq %rcx, (%rdx,%rsi,8)
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB1221:
	callq standard__memory__allocators__stdheap__fmalloc_large__1__dataE1_ubits64__ret_dataE1_ubits64
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB1214:
	movq %rcx, %rax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__memory__allocators__stdheap__fmalloc__1__ulongE1__ret_dataE1_ubits64
	.def standard__memory__allocators__stdheap__fmalloc__1__ulongE1__ret_dataE1_ubits64;
	.scl 2;
	.type 32;
	.endef
standard__memory__allocators__stdheap__fmalloc__1__ulongE1__ret_dataE1_ubits64:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB1308:
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	leave
	ret
	.text
	.globl standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	.def standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB1312:
	movq %rcx, %rsi
	testq %rsi, %rsi
	je .LB1318
.LB1319:
	movq standard__memory__allocators__stdheap__g_table(%rip), %rax
	testq %rax, %rax
	je .LB24822
.LB24823:
	movq standard__memory__allocators__stdheap__g_table_cap(%rip), %rcx
	movq %rsi, %rdx
	shrq $4, %rdx
	movabsq $-7046029254386353131, %rdi
	imulq %rdi, %rdx
	movq %rdx, %rdi
	shrq $32, %rdi
	xorq %rdi, %rdx
	decq %rcx
	andq %rcx, %rdx
.LB24824:
	movslq %edx, %rdi
	shlq $5, %rdi
	movq (%rax,%rdi,1), %rdi
	testq %rdi, %rdi
	je .LB24826
.LB24825:
	cmpq %rsi, %rdi
	je .LB24828
.LB24829:
	incq %rdx
	andq %rcx, %rdx
	jmp .LB24824
.LB24826:
	xorl %eax, %eax
.LB24819:
	testq %rax, %rax
	je .LB1331
.LB1332:
	movq 8(%rax), %rcx
	cmpq $1, 16(%rax)
	je .LB1352
.LB1353:
	movq $3, 16(%rax)
	cmpq $8, %rcx
	ja .LB24835
.LB24836:
	leaq standard__memory__allocators__stdheap__g_bins(%rip), %rax
	movslq %ecx, %rdx
	movq (%rax,%rdx,8), %rax
	movq %rax, (%rsi)
	leaq standard__memory__allocators__stdheap__g_bins(%rip), %rax
	movq %rsi, (%rax,%rcx,8)
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB24828:
	shlq $5, %rdx
	leaq (%rax,%rdx,1), %rax
	jmp .LB24819
.LB24822:
	xorl %eax, %eax
	jmp .LB24819
.LB24835:
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB1352:
	movq %rsi, %rcx
	callq standard__memory__allocators__stdheap__table_remove__1__dataE1_ubits64__ret_voidE1
	movq standard__memory__allocators__stdheap__g_large_used(%rip), %rax
	decq %rax
	movq %rax, standard__memory__allocators__stdheap__g_large_used(%rip)
	movq %rsi, %rcx
	xorl %edx, %edx
	movl $32768, %r8d
	callq VirtualFree
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB1331:
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB1318:
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__memory__allocators__stdheap__ffree__1__byteE1_ptr1__ret_voidE1
	.def standard__memory__allocators__stdheap__ffree__1__byteE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__memory__allocators__stdheap__ffree__1__byteE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB1365:
	movq %rcx, %rax
	movq %rax, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	leave
	ret
	.text
	.globl standard__memory__allocators__stdarena___new_chunk__2__ArenaE1_ptr1__dataE1_ubits64__ret_boolE1
	.def standard__memory__allocators__stdarena___new_chunk__2__ArenaE1_ptr1__dataE1_ubits64__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__memory__allocators__stdarena___new_chunk__2__ArenaE1_ptr1__dataE1_ubits64__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB1369:
	movq %rcx, %rsi
	addq $32, %rdx
	movq 8(%rsi), %rax
	cmpq %rax, %rdx
	movq %rax, %rdi
	cmova %rdx, %rdi
	movq %rdi, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	testq %rax, %rax
	je .LB1396
.LB1397:
	movq (%rsi), %rcx
	movq %rcx, (%rax)
	movq %rdi, 8(%rax)
	movq $32, 16(%rax)
	movq %rax, (%rsi)
	movq 8(%rsi), %rax
	movq 16(%rsi), %rcx
	shlq $1, %rax
	cmpq %rcx, %rax
	cmova %rcx, %rax
	movq %rax, 8(%rsi)
	movl $1, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB1396:
	xorl %eax, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__memory__allocators__stdarena__arena_init__1__ArenaE1_ptr1__ret_voidE1
	.def standard__memory__allocators__stdarena__arena_init__1__ArenaE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__memory__allocators__stdarena__arena_init__1__ArenaE1_ptr1__ret_voidE1:
.LB1438:
	movq $0, (%rcx)
	movq $1048576, 8(%rcx)
	movq $67108864, 16(%rcx)
	ret
	.text
	.globl standard__memory__allocators__stdarena__alloc__2__ArenaE1_ptr1__dataE1_ubits64__ret_voidE1_ptr1
	.def standard__memory__allocators__stdarena__alloc__2__ArenaE1_ptr1__dataE1_ubits64__ret_voidE1_ptr1;
	.scl 2;
	.type 32;
	.endef
standard__memory__allocators__stdarena__alloc__2__ArenaE1_ptr1__dataE1_ubits64__ret_voidE1_ptr1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB1450:
	movq %rcx, %rsi
	addq $7, %rdx
	movabsq $4294967288, %rax
	movq %rdx, %rdi
	andq %rax, %rdi
	movq (%rsi), %rax
	testq %rax, %rax
	jne .LB1473
.LB1472:
	movq %rsi, %rcx
	movq %rdi, %rdx
	callq standard__memory__allocators__stdarena___new_chunk__2__ArenaE1_ptr1__dataE1_ubits64__ret_boolE1
	testb %al, %al
	je .LB1509
.LB1510:
	movq (%rsi), %rax
	movq 16(%rax), %rcx
	leaq (%rax,%rcx), %rdx
	addq %rdi, %rcx
	movq %rcx, 16(%rax)
	movq %rdx, %rax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB1473:
	movq 16(%rax), %rcx
	leaq (%rcx,%rdi), %rdx
	cmpq 8(%rax), %rdx
	jbe .LB1488
	jmp .LB1472
.LB1509:
	xorl %eax, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB1488:
	addq %rax, %rcx
	movq %rdx, 16(%rax)
	movq %rcx, %rax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__memory__allocators__stdarena__arena_reset__1__ArenaE1_ptr1__ret_voidE1
	.def standard__memory__allocators__stdarena__arena_reset__1__ArenaE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__memory__allocators__stdarena__arena_reset__1__ArenaE1_ptr1__ret_voidE1:
.LB1535:
	movq (%rcx), %rax
.LB1542:
	testq %rax, %rax
	je .LB1544
.LB1543:
	movq $32, 16(%rax)
	movq (%rax), %rax
	jmp .LB1542
.LB1544:
	ret
	.text
	.globl standard__strings__helpers__is_whitespace__1__charE1__ret_boolE1
	.def standard__strings__helpers__is_whitespace__1__charE1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__strings__helpers__is_whitespace__1__charE1__ret_boolE1:
.LB1557:
	cmpb $32, %cl
	jne .LB1561
.LB25027:
	movl $1, %eax
	ret
.LB1561:
	cmpb $9, %cl
	jne .LB1566
.LB25028:
	movl $1, %eax
	ret
.LB1566:
	cmpb $10, %cl
	jne .LB1571
.LB25029:
	movl $1, %eax
	ret
.LB1571:
	xorl %eax, %eax
	cmpb $13, %cl
	sete %al
	ret
	.text
	.globl standard__strings__helpers__is_digit__1__charE1__ret_boolE1
	.def standard__strings__helpers__is_digit__1__charE1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__strings__helpers__is_digit__1__charE1__ret_boolE1:
.LB1576:
	cmpb $48, %cl
	jge .LB1580
.LB25030:
	xorl %eax, %eax
	ret
.LB1580:
	xorl %eax, %eax
	cmpb $57, %cl
	setle %al
	ret
	.text
	.globl standard__strings__helpers__is_alpha__1__charE1__ret_boolE1
	.def standard__strings__helpers__is_alpha__1__charE1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__strings__helpers__is_alpha__1__charE1__ret_boolE1:
.LB1585:
	cmpb $97, %cl
	jl .LB1594
.LB1589:
	cmpb $122, %cl
	jg .LB1594
.LB25031:
	movl $1, %eax
	ret
.LB1594:
	cmpb $65, %cl
	jge .LB1598
.LB25032:
	xorl %eax, %eax
	ret
.LB1598:
	xorl %eax, %eax
	cmpb $90, %cl
	setle %al
	ret
	.text
	.globl standard__strings__helpers__is_upper__1__charE1__ret_boolE1
	.def standard__strings__helpers__is_upper__1__charE1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__strings__helpers__is_upper__1__charE1__ret_boolE1:
.LB1604:
	cmpb $65, %cl
	jge .LB1608
.LB25033:
	xorl %eax, %eax
	ret
.LB1608:
	xorl %eax, %eax
	cmpb $90, %cl
	setle %al
	ret
	.text
	.globl standard__strings__helpers__is_lower__1__charE1__ret_boolE1
	.def standard__strings__helpers__is_lower__1__charE1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__strings__helpers__is_lower__1__charE1__ret_boolE1:
.LB1613:
	cmpb $97, %cl
	jge .LB1617
.LB25034:
	xorl %eax, %eax
	ret
.LB1617:
	xorl %eax, %eax
	cmpb $122, %cl
	setle %al
	ret
	.text
	.globl standard__strings__helpers__is_alnum__1__charE1__ret_boolE1
	.def standard__strings__helpers__is_alnum__1__charE1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__strings__helpers__is_alnum__1__charE1__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
.LB1622:
	movl %ecx, %esi
	movzbl %sil, %ecx
	callq standard__strings__helpers__is_alpha__1__charE1__ret_boolE1
	movzbl %al, %eax
	subl $48, %esi
	xorl %ecx, %ecx
	cmpb $9, %sil
	setbe %cl
	orl %ecx, %eax
	movzbl %al, %eax
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl standard__strings__helpers__to_lower__1__charE1__ret_charE1
	.def standard__strings__helpers__to_lower__1__charE1__ret_charE1;
	.scl 2;
	.type 32;
	.endef
standard__strings__helpers__to_lower__1__charE1__ret_charE1:
.LB1631:
	cmpb $65, %cl
	jl .LB1641
.LB1635:
	cmpb $90, %cl
	jle .LB1640
.LB1641:
	movzbl %cl, %eax
	ret
.LB1640:
	movsbl %cl, %eax
	addl $32, %eax
	movzbl %al, %eax
	ret
	.text
	.globl standard__strings__helpers__to_upper__1__charE1__ret_charE1
	.def standard__strings__helpers__to_upper__1__charE1__ret_charE1;
	.scl 2;
	.type 32;
	.endef
standard__strings__helpers__to_upper__1__charE1__ret_charE1:
.LB1648:
	cmpb $97, %cl
	jl .LB1658
.LB1652:
	cmpb $122, %cl
	jle .LB1657
.LB1658:
	movzbl %cl, %eax
	ret
.LB1657:
	movsbl %cl, %eax
	subl $32, %eax
	movzbl %al, %eax
	ret
	.text
	.globl standard__strings__helpers__find_char__3__byteE1_ptr1__charE1__intE1__ret_intE1
	.def standard__strings__helpers__find_char__3__byteE1_ptr1__charE1__intE1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__strings__helpers__find_char__3__byteE1_ptr1__charE1__intE1__ret_intE1:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
.LB1665:
	movl %r8d, %eax
.LB1669:
	movslq %eax, %rsi
	movzbl (%rcx,%rsi,1), %esi
	testb %sil, %sil
	je .LB1672
.LB1670:
	cmpb %dl, %sil
	je .LB1687
.LB1688:
	incl %eax
	jmp .LB1669
.LB1672:
	movabsq $4294967295, %rax
	movq 0(%rsp), %rsi
	addq $16, %rsp
	ret
.LB1687:
	movq 0(%rsp), %rsi
	addq $16, %rsp
	ret
	.text
	.globl standard__strings__helpers__find_substring__3__byteE1_ptr1__byteE1_ptr1__intE1__ret_intE1
	.def standard__strings__helpers__find_substring__3__byteE1_ptr1__byteE1_ptr1__intE1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__strings__helpers__find_substring__3__byteE1_ptr1__byteE1_ptr1__intE1__ret_intE1:
	subq $32, %rsp
	movq %rbx, 16(%rsp)
	movq %rsi, 8(%rsp)
	movq %rdi, 0(%rsp)
.LB1694:
	movq %rcx, %rsi
	movq %rdx, %rdi
	movq %rsi, %rax
	movl %eax, %ecx
	movq %rax, %rdx
	andq $-32, %rdx
	vpxor %xmm15, %xmm15, %xmm15
	vpcmpeqb (%rdx), %ymm15, %ymm0
	vpmovmskb %ymm0, %r9d
	shrl %cl, %r9d
	testl %r9d, %r9d
	jne .LS25036f
.LS25036l:
	addq $32, %rdx
	vpcmpeqb (%rdx), %ymm15, %ymm0
	vpmovmskb %ymm0, %r9d
	testl %r9d, %r9d
	je .LS25036l
	tzcntl %r9d, %r9d
	addq %rdx, %r9
	subq %rax, %r9
	jmp .LS25036d
.LS25036f:
	tzcntl %r9d, %r9d
.LS25036d:
	vzeroupper
.LB1703:
	xorl %eax, %eax
.LB1712:
	movslq %eax, %rcx
	cmpb $0, (%rdi,%rcx,1)
	je .LB1714
.LB1713:
	incl %eax
	jmp .LB1712
.LB1714:
	testl %eax, %eax
	je .LB1725
.LB1726:
	subl %eax, %r9d
.LB1729:
	cmpl %r9d, %r8d
	jg .LB1732
.LB1730:
	xorl %ecx, %ecx
.LB1740:
	cmpl %eax, %ecx
	jl .LB1741
.LB25035:
	movl $1, %ecx
.LB1743:
	testb %cl, %cl
	jne .LB1765
.LB1766:
	incl %r8d
	cmpl %r9d, %r8d
	jle .LB1730
.LB1732:
	movabsq $4294967295, %rax
	movq 16(%rsp), %rbx
	movq 8(%rsp), %rsi
	movq 0(%rsp), %rdi
	addq $32, %rsp
	ret
.LB1741:
	leal (%r8,%rcx), %edx
	movslq %ecx, %rbx
	movslq %edx, %rdx
	movzbl (%rsi,%rdx,1), %edx
	movzbl (%rdi,%rbx,1), %ebx
	cmpb %bl, %dl
	jne .LB1759
.LB1760:
	incl %ecx
	cmpl %eax, %ecx
	jl .LB1741
	jmp .LB25035
.LB1759:
	xorl %ecx, %ecx
	testb %cl, %cl
	je .LB1766
.LB1765:
	movl %r8d, %eax
	movq 16(%rsp), %rbx
	movq 8(%rsp), %rsi
	movq 0(%rsp), %rdi
	addq $32, %rsp
	ret
.LB1725:
	movl %r8d, %eax
	movq 16(%rsp), %rbx
	movq 8(%rsp), %rsi
	movq 0(%rsp), %rdi
	addq $32, %rsp
	ret
	.text
	.globl standard__strings__helpers__compare_ignore_case__2__byteE1_ptr1__byteE1_ptr1__ret_intE1
	.def standard__strings__helpers__compare_ignore_case__2__byteE1_ptr1__byteE1_ptr1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__strings__helpers__compare_ignore_case__2__byteE1_ptr1__byteE1_ptr1__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $80, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
.LB1772:
	movq %rcx, %rsi
	movq %rdx, %rdi
	xorl %ebx, %ebx
.LB1778:
	movslq %ebx, %rax
	cmpb $0, (%rsi,%rax,1)
	je .LB1780
.LB1787:
	cmpb $0, (%rdi,%rax,1)
	je .LB1780
.LB1779:
	movslq %ebx, %r12
	movzbl (%rsi,%r12,1), %eax
	movzbl %al, %ecx
	callq standard__strings__helpers__to_lower__1__charE1__ret_charE1
	movzbl %al, %r13d
	movzbl (%rdi,%r12,1), %eax
	movzbl %al, %ecx
	callq standard__strings__helpers__to_lower__1__charE1__ret_charE1
	movzbl %al, %eax
	cmpb %al, %r13b
	jne .LB1809
.LB1810:
	incl %ebx
	jmp .LB1778
.LB1780:
	movslq %ebx, %rbx
	movzbl (%rsi,%rbx,1), %eax
	movzbl %al, %ecx
	callq standard__strings__helpers__to_lower__1__charE1__ret_charE1
	movzbl %al, %esi
	movzbl (%rdi,%rbx,1), %eax
	movzbl %al, %ecx
	callq standard__strings__helpers__to_lower__1__charE1__ret_charE1
	movzbl %al, %eax
	subl %eax, %esi
	movsbl %sil, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB1809:
	subl %eax, %r13d
	movsbl %r13b, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
	.text
	.globl standard__strings__helpers__starts_with__2__byteE1_ptr1__byteE1_ptr1__ret_boolE1
	.def standard__strings__helpers__starts_with__2__byteE1_ptr1__byteE1_ptr1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__strings__helpers__starts_with__2__byteE1_ptr1__byteE1_ptr1__ret_boolE1:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
	movq %rdi, -8(%rsp)
.LB1830:
	xorl %eax, %eax
.LB1834:
	movslq %eax, %rsi
	movzbl (%rdx,%rsi,1), %esi
	testb %sil, %sil
	je .LB1836
.LB1835:
	movslq %eax, %rdi
	movzbl (%rcx,%rdi,1), %edi
	cmpb %sil, %dil
	jne .LB1852
.LB1853:
	incl %eax
	jmp .LB1834
.LB1836:
	movl $1, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB1852:
	xorl %eax, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
	.text
	.globl standard__strings__helpers__ends_with__2__byteE1_ptr1__byteE1_ptr1__ret_boolE1
	.def standard__strings__helpers__ends_with__2__byteE1_ptr1__byteE1_ptr1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__strings__helpers__ends_with__2__byteE1_ptr1__byteE1_ptr1__ret_boolE1:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
	movq %rdi, -8(%rsp)
.LB1857:
	movq %rcx, %rsi
	movq %rdx, %rdi
	movq %rsi, %rax
	movl %eax, %ecx
	movq %rax, %rdx
	andq $-32, %rdx
	vpxor %xmm15, %xmm15, %xmm15
	vpcmpeqb (%rdx), %ymm15, %ymm0
	vpmovmskb %ymm0, %r8d
	shrl %cl, %r8d
	testl %r8d, %r8d
	jne .LS25037f
.LS25037l:
	addq $32, %rdx
	vpcmpeqb (%rdx), %ymm15, %ymm0
	vpmovmskb %ymm0, %r8d
	testl %r8d, %r8d
	je .LS25037l
	tzcntl %r8d, %r8d
	addq %rdx, %r8
	subq %rax, %r8
	jmp .LS25037d
.LS25037f:
	tzcntl %r8d, %r8d
.LS25037d:
	vzeroupper
.LB1864:
	xorl %eax, %eax
.LB1873:
	movslq %eax, %rcx
	cmpb $0, (%rdi,%rcx,1)
	je .LB1875
.LB1874:
	incl %eax
	jmp .LB1873
.LB1875:
	cmpl %r8d, %eax
	jg .LB1887
.LB1888:
	subl %eax, %r8d
	xorl %ecx, %ecx
.LB1894:
	cmpl %eax, %ecx
	jge .LB1897
.LB1895:
	leal (%r8,%rcx), %edx
	movslq %ecx, %r9
	movslq %edx, %rdx
	movzbl (%rsi,%rdx,1), %edx
	movzbl (%rdi,%r9,1), %r9d
	cmpb %r9b, %dl
	jne .LB1913
.LB1914:
	incl %ecx
	cmpl %eax, %ecx
	jl .LB1895
.LB1897:
	movl $1, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB1913:
	xorl %eax, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB1887:
	xorl %eax, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
	.text
	.globl standard__strings__manip__copy_string__1__byteE1_ptr1__ret_byteE1_ptr1
	.def standard__strings__manip__copy_string__1__byteE1_ptr1__ret_byteE1_ptr1;
	.scl 2;
	.type 32;
	.endef
standard__strings__manip__copy_string__1__byteE1_ptr1__ret_byteE1_ptr1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB1918:
	movq %rcx, %rsi
	movq %rsi, %rax
	movl %eax, %ecx
	movq %rax, %rdx
	andq $-32, %rdx
	vpxor %xmm15, %xmm15, %xmm15
	vpcmpeqb (%rdx), %ymm15, %ymm0
	vpmovmskb %ymm0, %edi
	shrl %cl, %edi
	testl %edi, %edi
	jne .LS25040f
.LS25040l:
	addq $32, %rdx
	vpcmpeqb (%rdx), %ymm15, %ymm0
	vpmovmskb %ymm0, %edi
	testl %edi, %edi
	je .LS25040l
	tzcntl %edi, %edi
	addq %rdx, %rdi
	subq %rax, %rdi
	jmp .LS25040d
.LS25040f:
	tzcntl %edi, %edi
.LS25040d:
	vzeroupper
.LB1923:
	leaq 1(%rdi), %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	testq %rax, %rax
	je .LB1943
.LB1944:
	movslq %edi, %rcx
	incq %rcx
	cmpq $32, %rcx
	jge .LB25038
.LB25039:
	xorl %ecx, %ecx
.LB1948:
	cmpl %edi, %ecx
	jg .LB1951
.LB1949:
	movslq %ecx, %rdx
	movzbl (%rsi,%rdx,1), %r8d
	movb %r8b, (%rax,%rdx,1)
	incl %ecx
	cmpl %edi, %ecx
	jle .LB1949
	jmp .LB1951
.LB25038:
	movq %rcx, %rdx
	sarq $63, %rdx
	notq %rdx
	andq %rdx, %rcx
	movq %rax, %rdi
	rep movsb
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB1951:
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB1943:
	xorl %eax, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__strings__manip__copy_n__2__byteE1_ptr1__intE1__ret_byteE1_ptr1
	.def standard__strings__manip__copy_n__2__byteE1_ptr1__intE1__ret_byteE1_ptr1;
	.scl 2;
	.type 32;
	.endef
standard__strings__manip__copy_n__2__byteE1_ptr1__intE1__ret_byteE1_ptr1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB1966:
	movq %rcx, %rsi
	movl %edx, %edi
	leaq 1(%rdi), %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	testq %rax, %rax
	je .LB1980
.LB1981:
	movslq %edi, %rcx
	xorl %edx, %edx
.LB1985:
	cmpq %rcx, %rdx
	jge .LB1988
.LB1993:
	movzbl (%rsi,%rdx,1), %r8d
	testb %r8b, %r8b
	je .LB1988
.LB1986:
	movb %r8b, (%rax,%rdx,1)
	incq %rdx
	cmpq %rcx, %rdx
	jl .LB1993
.LB1988:
	movslq %edi, %rcx
	movb $0, (%rax,%rcx,1)
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB1980:
	xorl %eax, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__strings__manip__substring__3__byteE1_ptr1__intE1__intE1__ret_byteE1_ptr1
	.def standard__strings__manip__substring__3__byteE1_ptr1__intE1__intE1__ret_byteE1_ptr1;
	.scl 2;
	.type 32;
	.endef
standard__strings__manip__substring__3__byteE1_ptr1__intE1__intE1__ret_byteE1_ptr1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
.LB2016:
	movq %rcx, %rsi
	movl %edx, %edi
	movl %r8d, %ebx
	leaq 1(%rbx), %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	testq %rax, %rax
	je .LB2031
.LB2032:
	xorl %ecx, %ecx
.LB2036:
	cmpl %ebx, %ecx
	jge .LB2039
.LB2044:
	leal (%rdi,%rcx), %edx
	movslq %edx, %rdx
	cmpb $0, (%rsi,%rdx,1)
	je .LB2039
.LB2037:
	leal (%rdi,%rcx), %edx
	movslq %edx, %rdx
	movzbl (%rsi,%rdx,1), %edx
	movslq %ecx, %r8
	movb %dl, (%rax,%r8,1)
	incl %ecx
	cmpl %ebx, %ecx
	jl .LB2044
.LB2039:
	movslq %ebx, %rcx
	movb $0, (%rax,%rcx,1)
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB2031:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__strings__manip__concat__2__byteE1_ptr1__byteE1_ptr1__ret_byteE1_ptr1
	.def standard__strings__manip__concat__2__byteE1_ptr1__byteE1_ptr1__ret_byteE1_ptr1;
	.scl 2;
	.type 32;
	.endef
standard__strings__manip__concat__2__byteE1_ptr1__byteE1_ptr1__ret_byteE1_ptr1:
	pushq %rbp
	movq %rsp, %rbp
	subq $80, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
.LB2071:
	movq %rcx, %rsi
	movq %rdx, %rbx
	movq %rsi, %rax
	movl %eax, %ecx
	movq %rax, %rdx
	andq $-32, %rdx
	vpxor %xmm15, %xmm15, %xmm15
	vpcmpeqb (%rdx), %ymm15, %ymm0
	vpmovmskb %ymm0, %edi
	shrl %cl, %edi
	testl %edi, %edi
	jne .LS25049f
.LS25049l:
	addq $32, %rdx
	vpcmpeqb (%rdx), %ymm15, %ymm0
	vpmovmskb %ymm0, %edi
	testl %edi, %edi
	je .LS25049l
	tzcntl %edi, %edi
	addq %rdx, %rdi
	subq %rax, %rdi
	jmp .LS25049d
.LS25049f:
	tzcntl %edi, %edi
.LS25049d:
	vzeroupper
	movl %edi, %r12d
.LB2077:
	xorl %r13d, %r13d
.LB2087:
	movslq %r13d, %rax
	cmpb $0, (%rbx,%rax,1)
	je .LB2089
.LB2088:
	incl %r13d
	jmp .LB2087
.LB2089:
	leaq (%r12,%r13), %rax
	leaq 1(%rax), %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	testq %rax, %rax
	je .LB2112
.LB2113:
	cmpl $32, %r12d
	jge .LB25041
.LB25042:
	movslq %r12d, %rcx
	xorl %edx, %edx
	testq %rcx, %rcx
	cmovg %rcx, %rdx
	shrq $2, %rdx
	xorl %edi, %edi
.LB25043:
	testq %rdx, %rdx
	je .LB25045
.LB25044:
	movzbl (%rsi,%rdi,1), %r8d
	movb %r8b, (%rax,%rdi,1)
	movzbl 1(%rsi,%rdi,1), %r8d
	movb %r8b, 1(%rax,%rdi,1)
	movzbl 2(%rsi,%rdi,1), %r8d
	movb %r8b, 2(%rax,%rdi,1)
	movzbl 3(%rsi,%rdi,1), %r8d
	movb %r8b, 3(%rax,%rdi,1)
	addq $4, %rdi
	decq %rdx
	jne .LB25044
.LB25045:
.LB2117:
	cmpq %rcx, %rdi
	jge .LB2120
.LB2118:
	movzbl (%rsi,%rdi,1), %edx
	movb %dl, (%rax,%rdi,1)
	incq %rdi
	cmpq %rcx, %rdi
	jl .LB2118
	jmp .LB2120
.LB25041:
	movslq %r12d, %rcx
	movq %rcx, %rdx
	sarq $63, %rdx
	notq %rdx
	andq %rdx, %rcx
	movq %rax, %rdi
	rep movsb
.LB2120:
	xorl %ecx, %ecx
	testl %r13d, %r13d
	cmovg %r13d, %ecx
	shrl $2, %ecx
	xorl %edx, %edx
.LB25046:
	testl %ecx, %ecx
	je .LB25048
.LB25047:
	movslq %edx, %rsi
	movzbl (%rbx,%rsi,1), %esi
	leal (%r12,%rdx), %edi
	movslq %edi, %rdi
	movb %sil, (%rax,%rdi,1)
	leal 1(%rdx), %esi
	movslq %esi, %rdi
	movzbl (%rbx,%rdi,1), %edi
	addl %r12d, %esi
	movslq %esi, %rsi
	movb %dil, (%rax,%rsi,1)
	leal 2(%rdx), %esi
	movslq %esi, %rdi
	movzbl (%rbx,%rdi,1), %edi
	addl %r12d, %esi
	movslq %esi, %rsi
	movb %dil, (%rax,%rsi,1)
	leal 3(%rdx), %esi
	movslq %esi, %rdi
	movzbl (%rbx,%rdi,1), %edi
	addl %r12d, %esi
	movslq %esi, %rsi
	movb %dil, (%rax,%rsi,1)
	addl $4, %edx
	decl %ecx
	jne .LB25047
.LB25048:
.LB2134:
	cmpl %r13d, %edx
	jge .LB2137
.LB2135:
	movslq %edx, %rcx
	movzbl (%rbx,%rcx,1), %ecx
	leal (%r12,%rdx), %esi
	movslq %esi, %rsi
	movb %cl, (%rax,%rsi,1)
	incl %edx
	cmpl %r13d, %edx
	jl .LB2135
.LB2137:
	addl %r13d, %r12d
	movslq %r12d, %rcx
	movb $0, (%rax,%rcx,1)
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB2112:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
	.text
	.globl standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	.def standard__strings__strlen__1__byteE1_ptr1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__strings__strlen__1__byteE1_ptr1__ret_intE1:
.LB2160:
	movq %rcx, %rax
	xorl %ecx, %ecx
.LB2164:
	leaq 1(%rax), %rdx
	cmpb $0, (%rax)
	je .LB2171
.LB2172:
	incl %ecx
	movq %rdx, %rax
	jmp .LB2164
.LB2171:
	movl %ecx, %eax
	ret
	.text
	.globl standard__strings__i16str__2__dataE1_sbits16__byteE1_ptr1__ret_dataE1_sbits16
	.def standard__strings__i16str__2__dataE1_sbits16__byteE1_ptr1__ret_dataE1_sbits16;
	.scl 2;
	.type 32;
	.endef
standard__strings__i16str__2__dataE1_sbits16__byteE1_ptr1__ret_dataE1_sbits16:
	subq $32, %rsp
	movq %rsi, 16(%rsp)
	movq %rdi, 8(%rsp)
.LB2176:
	testw %cx, %cx
	je .LB2182
.LB2183:
	xorl %eax, %eax
	testw %cx, %cx
	sets %al
	xorl %esi, %esi
	subl %ecx, %esi
	testb %al, %al
	cmovne %esi, %ecx
	movq .LZERO(%rip), %r10
	movq %r10, (%rsp)
	xorl %esi, %esi
.LB2204:
	testw %cx, %cx
	jle .LB2206
.LB2205:
	movswl %cx, %edi
	movabsq $3435973837, %r9
	movswl %cx, %ecx
	movslq %edi, %r8
	movslq %ecx, %rcx
	imulq %r8, %r9
	sarq $35, %r9
	shrq $63, %r8
	addl %r8d, %r9d
	movswq %si, %r8
	imull $10, %r9d, %r9d
	subl %r9d, %edi
	addl $48, %edi
	movb %dil, (%rsp,%r8,1)
	movabsq $3435973837, %rdi
	imulq %rcx, %rdi
	sarq $35, %rdi
	shrq $63, %rcx
	addl %edi, %ecx
	incl %esi
	testw %cx, %cx
	jg .LB2205
.LB2206:
	testb %al, %al
	jne .LB2226
.LB2227:
	xorl %eax, %eax
.LB2228:
	leal -1(%rsi), %ecx
.LB2237:
	testw %cx, %cx
	js .LB2239
.LB2238:
	movswl %cx, %esi
	movslq %esi, %rsi
	movzbl (%rsp,%rsi,1), %esi
	movswq %ax, %rdi
	movb %sil, (%rdx,%rdi,1)
	incl %eax
	decl %ecx
	testw %cx, %cx
	jns .LB2238
	jmp .LB2239
.LB2226:
	movb $45, (%rdx)
	movl $1, %eax
	jmp .LB2228
.LB2239:
	movswq %ax, %rcx
	movzwl %ax, %eax
	movb $0, (%rdx,%rcx,1)
	movq 16(%rsp), %rsi
	movq 8(%rsp), %rdi
	addq $32, %rsp
	ret
.LB2182:
	movw $48, (%rdx)
	movl $1, %eax
	movq 16(%rsp), %rsi
	movq 8(%rsp), %rdi
	addq $32, %rsp
	ret
	.text
	.globl standard__strings__i32str__2__dataE1_sbits32__byteE1_ptr1__ret_dataE1_sbits32
	.def standard__strings__i32str__2__dataE1_sbits32__byteE1_ptr1__ret_dataE1_sbits32;
	.scl 2;
	.type 32;
	.endef
standard__strings__i32str__2__dataE1_sbits32__byteE1_ptr1__ret_dataE1_sbits32:
	subq $48, %rsp
	movq %rsi, 32(%rsp)
	movq %rdi, 24(%rsp)
.LB2259:
	testl %ecx, %ecx
	je .LB2264
.LB2265:
	xorl %eax, %eax
	testl %ecx, %ecx
	sets %al
	xorl %esi, %esi
	subl %ecx, %esi
	testb %al, %al
	cmovne %esi, %ecx
	movl $1, %esi
	xorl %edi, %edi
	testb %al, %al
	cmovne %esi, %edi
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -8(%rsp)
	vzeroupper
	xorl %eax, %eax
.LB2283:
	testl %ecx, %ecx
	jle .LB2285
.LB2284:
	movslq %ecx, %rsi
	movabsq $3435973837, %r8
	imulq %rsi, %r8
	sarq $35, %r8
	shrq $63, %rsi
	addl %r8d, %esi
	imull $10, %esi, %r8d
	subl %r8d, %ecx
	addl $48, %ecx
	movslq %eax, %r8
	movb %cl, -8(%rsp,%r8,1)
	incl %eax
	movq %rsi, %rcx
	testl %ecx, %ecx
	jg .LB2284
.LB2285:
	cmpl $1, %edi
	je .LB2301
.LB2302:
	xorl %ecx, %ecx
.LB2303:
	decl %eax
.LB2310:
	testl %eax, %eax
	js .LB2312
.LB2311:
	movslq %eax, %rsi
	movzbl -8(%rsp,%rsi,1), %esi
	movslq %ecx, %rdi
	movb %sil, (%rdx,%rdi,1)
	incl %ecx
	decl %eax
	jns .LB2311
	jmp .LB2312
.LB2301:
	movb $45, (%rdx)
	movl $1, %ecx
	jmp .LB2303
.LB2312:
	movslq %ecx, %rax
	movb $0, (%rdx,%rax,1)
	movl %ecx, %eax
	movq 32(%rsp), %rsi
	movq 24(%rsp), %rdi
	addq $48, %rsp
	ret
.LB2264:
	movw $48, (%rdx)
	movl $1, %eax
	movq 32(%rsp), %rsi
	movq 24(%rsp), %rdi
	addq $48, %rsp
	ret
	.text
	.globl standard__strings__i64str__2__dataE1_sbits64__byteE1_ptr1__ret_dataE1_sbits64
	.def standard__strings__i64str__2__dataE1_sbits64__byteE1_ptr1__ret_dataE1_sbits64;
	.scl 2;
	.type 32;
	.endef
standard__strings__i64str__2__dataE1_sbits64__byteE1_ptr1__ret_dataE1_sbits64:
	subq $48, %rsp
	movq %rsi, 32(%rsp)
	movq %rdi, 24(%rsp)
.LB2330:
	movq %rdx, %rsi
	testq %rcx, %rcx
	je .LB2336
.LB2337:
	xorl %eax, %eax
	testq %rcx, %rcx
	sets %al
	xorl %edx, %edx
	subq %rcx, %rdx
	testb %al, %al
	cmovne %rdx, %rcx
	movl $1, %edx
	xorl %edi, %edi
	testb %al, %al
	cmovne %rdx, %rdi
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -8(%rsp)
	vzeroupper
	xorl %r8d, %r8d
.LB2360:
	testq %rcx, %rcx
	jle .LB2362
.LB2361:
	movq %rcx, %rax
	movabsq $7378697629483820647, %rdx
	imulq %rdx
	sarq $2, %rdx
	movq %rdx, %rax
	shrq $63, %rax
	addq %rdx, %rax
	imulq $10, %rax, %rdx
	subq %rdx, %rcx
	addq $48, %rcx
	movb %cl, -8(%rsp,%r8,1)
	incq %r8
	movq %rax, %rcx
	testq %rcx, %rcx
	jg .LB2361
.LB2362:
	cmpq $1, %rdi
	je .LB2384
.LB2385:
	xorl %eax, %eax
.LB2386:
	leaq -1(%r8), %rcx
.LB2395:
	testq %rcx, %rcx
	js .LB2397
.LB2396:
	movslq %ecx, %rdx
	movzbl -8(%rsp,%rdx,1), %edx
	movb %dl, (%rsi,%rax,1)
	incq %rax
	decq %rcx
	jns .LB2396
	jmp .LB2397
.LB2384:
	movb $45, (%rsi)
	movl $1, %eax
	jmp .LB2386
.LB2397:
	movb $0, (%rsi,%rax,1)
	movq 32(%rsp), %rsi
	movq 24(%rsp), %rdi
	addq $48, %rsp
	ret
.LB2336:
	movw $48, (%rsi)
	movl $1, %eax
	movq 32(%rsp), %rsi
	movq 24(%rsp), %rdi
	addq $48, %rsp
	ret
	.text
	.globl standard__strings__u16str__2__dataE1_ubits16__byteE1_ptr1__ret_dataE1_ubits16
	.def standard__strings__u16str__2__dataE1_ubits16__byteE1_ptr1__ret_dataE1_ubits16;
	.scl 2;
	.type 32;
	.endef
standard__strings__u16str__2__dataE1_ubits16__byteE1_ptr1__ret_dataE1_ubits16:
	subq $32, %rsp
	movq %rsi, 16(%rsp)
	movq %rdi, 8(%rsp)
.LB2417:
	testw %cx, %cx
	je .LB2423
.LB2424:
	movq .LZERO(%rip), %r10
	movq %r10, (%rsp)
	xorl %eax, %eax
.LB2436:
	testw %cx, %cx
	jbe .LB2438
.LB2437:
	movzwl %cx, %esi
	movabsq $3435973837, %rdi
	movzwl %cx, %ecx
	imulq %rsi, %rdi
	shrq $35, %rdi
	imull $10, %edi, %edi
	subl %edi, %esi
	movswq %ax, %rdi
	addl $48, %esi
	movb %sil, (%rsp,%rdi,1)
	movabsq $3435973837, %rsi
	imulq %rsi, %rcx
	shrq $35, %rcx
	incl %eax
	testw %cx, %cx
	ja .LB2437
.LB2438:
	movq %rax, %rcx
	xorl %eax, %eax
.LB2459:
	testw %cx, %cx
	jbe .LB2461
.LB2460:
	decl %ecx
	movswl %cx, %esi
	movslq %esi, %rsi
	movzbl (%rsp,%rsi,1), %esi
	movswq %ax, %rdi
	movb %sil, (%rdx,%rdi,1)
	incl %eax
	testw %cx, %cx
	ja .LB2460
.LB2461:
	movswq %ax, %rcx
	movzwl %ax, %eax
	movb $0, (%rdx,%rcx,1)
	movq 16(%rsp), %rsi
	movq 8(%rsp), %rdi
	addq $32, %rsp
	ret
.LB2423:
	movw $48, (%rdx)
	movl $1, %eax
	movq 16(%rsp), %rsi
	movq 8(%rsp), %rdi
	addq $32, %rsp
	ret
	.text
	.globl standard__strings__u32str__2__dataE1_ubits32__byteE1_ptr1__ret_dataE1_ubits32
	.def standard__strings__u32str__2__dataE1_ubits32__byteE1_ptr1__ret_dataE1_ubits32;
	.scl 2;
	.type 32;
	.endef
standard__strings__u32str__2__dataE1_ubits32__byteE1_ptr1__ret_dataE1_ubits32:
	subq $48, %rsp
	movq %rsi, 32(%rsp)
	movq %rdi, 24(%rsp)
.LB2481:
	testl %ecx, %ecx
	je .LB2486
.LB2487:
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -8(%rsp)
	vzeroupper
	xorl %eax, %eax
.LB2497:
	testl %ecx, %ecx
	jbe .LB2499
.LB2498:
	movabsq $3435973837, %rsi
	imulq %rcx, %rsi
	shrq $35, %rsi
	imull $10, %esi, %edi
	subl %edi, %ecx
	addl $48, %ecx
	movslq %eax, %rdi
	movb %cl, -8(%rsp,%rdi,1)
	incl %eax
	movq %rsi, %rcx
	testl %ecx, %ecx
	ja .LB2498
.LB2499:
	movq %rax, %rcx
	xorl %eax, %eax
.LB2515:
	testl %ecx, %ecx
	jbe .LB2517
.LB2516:
	decl %ecx
	movslq %ecx, %rsi
	movzbl -8(%rsp,%rsi,1), %esi
	movslq %eax, %rdi
	movb %sil, (%rdx,%rdi,1)
	incl %eax
	testl %ecx, %ecx
	ja .LB2516
.LB2517:
	movslq %eax, %rcx
	movb $0, (%rdx,%rcx,1)
	movq 32(%rsp), %rsi
	movq 24(%rsp), %rdi
	addq $48, %rsp
	ret
.LB2486:
	movw $48, (%rdx)
	movl $1, %eax
	movq 32(%rsp), %rsi
	movq 24(%rsp), %rdi
	addq $48, %rsp
	ret
	.text
	.globl standard__strings__u64str__2__dataE1_ubits64__byteE1_ptr1__ret_dataE1_ubits64
	.def standard__strings__u64str__2__dataE1_ubits64__byteE1_ptr1__ret_dataE1_ubits64;
	.scl 2;
	.type 32;
	.endef
standard__strings__u64str__2__dataE1_ubits64__byteE1_ptr1__ret_dataE1_ubits64:
	subq $48, %rsp
	movq %rsi, 32(%rsp)
	movq %rdi, 24(%rsp)
.LB2535:
	movq %rdx, %rsi
	testq %rcx, %rcx
	je .LB2541
.LB2542:
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -8(%rsp)
	vzeroupper
	xorl %edi, %edi
.LB2554:
	testq %rcx, %rcx
	je .LB2556
.LB2555:
	movq %rcx, %rax
	movabsq $-3689348814741910323, %rdx
	mulq %rdx
	movq %rdx, %rax
	shrq $3, %rax
	imulq $10, %rax, %rdx
	subq %rdx, %rcx
	addq $48, %rcx
	movb %cl, -8(%rsp,%rdi,1)
	incq %rdi
	movq %rax, %rcx
	testq %rcx, %rcx
	jne .LB2555
.LB2556:
	xorl %eax, %eax
.LB2577:
	testq %rdi, %rdi
	je .LB2579
.LB2578:
	decq %rdi
	movslq %edi, %rcx
	movzbl -8(%rsp,%rcx,1), %ecx
	movb %cl, (%rsi,%rax,1)
	incq %rax
	testq %rdi, %rdi
	jne .LB2578
.LB2579:
	movb $0, (%rsi,%rax,1)
	movq 32(%rsp), %rsi
	movq 24(%rsp), %rdi
	addq $48, %rsp
	ret
.LB2541:
	movw $48, (%rsi)
	movl $1, %eax
	movq 32(%rsp), %rsi
	movq 24(%rsp), %rdi
	addq $48, %rsp
	ret
	.text
	.globl standard__strings__str2i32__1__byteE1_ptr1__ret_intE1
	.def standard__strings__str2i32__1__byteE1_ptr1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__strings__str2i32__1__byteE1_ptr1__ret_intE1:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
	movq %rdi, -8(%rsp)
.LB2599:
	xorl %eax, %eax
.LB2606:
	movslq %eax, %rdx
	movzbl (%rcx,%rdx,1), %esi
	cmpb $32, %sil
	je .LB2607
.LB2615:
	cmpb $9, %sil
	je .LB2607
.LB2624:
	cmpb $10, (%rcx,%rdx,1)
	je .LB2607
.LB2633:
	cmpb $13, (%rcx,%rdx,1)
	jne .LB2608
.LB2607:
	incl %eax
	jmp .LB2606
.LB2608:
	movzbl (%rcx,%rdx,1), %edx
	cmpb $45, %dl
	je .LB2650
.LB2651:
	cmpb $43, %dl
	je .LB2662
.LB2663:
	movl $1, %edx
.LB2652:
	movq %rax, %rsi
	xorl %eax, %eax
.LB2666:
	movslq %esi, %rdi
	movzbl (%rcx,%rdi,1), %edi
	testb %dil, %dil
	je .LB2668
.LB2667:
	cmpb $48, %dil
	jb .LB2668
.LB2682:
	cmpb $57, %dil
	ja .LB2668
.LB2688:
	movzbl %dil, %edi
	subl $48, %edi
	imull $10, %eax, %eax
	addl %edi, %eax
	incl %esi
	jmp .LB2666
.LB2662:
	incl %eax
	movl $1, %edx
	jmp .LB2652
.LB2650:
	incl %eax
	movl $4294967295, %edx
	jmp .LB2652
.LB2668:
	imull %edx, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
	.text
	.globl standard__strings__str2u32__1__byteE1_ptr1__ret_uintE1
	.def standard__strings__str2u32__1__byteE1_ptr1__ret_uintE1;
	.scl 2;
	.type 32;
	.endef
standard__strings__str2u32__1__byteE1_ptr1__ret_uintE1:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
	movq %rdi, -8(%rsp)
.LB2703:
	xorl %eax, %eax
.LB2709:
	movslq %eax, %rdx
	movzbl (%rcx,%rdx,1), %edx
	leal -9(%rdx), %esi
	cmpb $24, %sil
	jae .LB25050
.LB25051:
	movzbl %sil, %esi
	movl $8388627, %edi
	btq %rsi, %rdi
	jae .LB25050
.LB2710:
	incl %eax
	jmp .LB2709
.LB25050:
	cmpb $45, %dl
	je .LB2753
.LB2754:
	leal 1(%rax), %esi
	cmpb $43, %dl
	cmove %esi, %eax
	movq %rax, %rdx
	xorl %eax, %eax
.LB2766:
	movslq %edx, %rsi
	movzbl (%rcx,%rsi,1), %esi
	movzbl %sil, %edi
	testb %sil, %sil
	je .LB2768
.LB2767:
	cmpb $48, %sil
	jb .LB2789
.LB2782:
	cmpb $57, %sil
	ja .LB2789
.LB2788:
	subl $48, %edi
	imull $10, %eax, %eax
	addl %edi, %eax
	incl %edx
	jmp .LB2766
.LB2789:
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB2768:
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB2753:
	xorl %eax, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
	.text
	.globl standard__strings__str2i64__1__byteE1_ptr1__ret_dataE1_sbits64
	.def standard__strings__str2i64__1__byteE1_ptr1__ret_dataE1_sbits64;
	.scl 2;
	.type 32;
	.endef
standard__strings__str2i64__1__byteE1_ptr1__ret_dataE1_sbits64:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
	movq %rdi, -8(%rsp)
.LB2801:
	xorl %eax, %eax
.LB2809:
	movslq %eax, %rdx
	movzbl (%rcx,%rdx,1), %esi
	cmpb $32, %sil
	je .LB2810
.LB2818:
	cmpb $9, %sil
	je .LB2810
.LB2827:
	cmpb $10, (%rcx,%rdx,1)
	je .LB2810
.LB2836:
	cmpb $13, (%rcx,%rdx,1)
	jne .LB2811
.LB2810:
	incl %eax
	jmp .LB2809
.LB2811:
	movzbl (%rcx,%rdx,1), %edx
	cmpb $45, %dl
	je .LB2853
.LB2854:
	cmpb $43, %dl
	je .LB2866
.LB2867:
	movq %rax, %rdx
	movl $1, %eax
.LB2855:
	movq %rdx, %rsi
	xorl %edx, %edx
.LB2870:
	movslq %esi, %rdi
	movzbl (%rcx,%rdi,1), %edi
	testb %dil, %dil
	je .LB2872
.LB2871:
	cmpb $48, %dil
	jb .LB2872
.LB2886:
	cmpb $57, %dil
	ja .LB2872
.LB2892:
	movzbl %dil, %edi
	subl $48, %edi
	imulq $10, %rdx, %rdx
	addq %rdi, %rdx
	incl %esi
	jmp .LB2870
.LB2866:
	leal 1(%rax), %edx
	movl $1, %eax
	jmp .LB2855
.LB2853:
	leal 1(%rax), %edx
	movq $-1, %rax
	jmp .LB2855
.LB2872:
	imulq %rdx, %rax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
	.text
	.globl standard__strings__str2u64__1__byteE1_ptr1__ret_dataE1_ubits64
	.def standard__strings__str2u64__1__byteE1_ptr1__ret_dataE1_ubits64;
	.scl 2;
	.type 32;
	.endef
standard__strings__str2u64__1__byteE1_ptr1__ret_dataE1_ubits64:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
	movq %rdi, -8(%rsp)
.LB2909:
	xorl %eax, %eax
.LB2915:
	movslq %eax, %rdx
	movzbl (%rcx,%rdx,1), %edx
	leal -9(%rdx), %esi
	cmpb $24, %sil
	jae .LB25052
.LB25053:
	movzbl %sil, %esi
	movl $8388627, %edi
	btq %rsi, %rdi
	jae .LB25052
.LB2916:
	incl %eax
	jmp .LB2915
.LB25052:
	cmpb $45, %dl
	je .LB2959
.LB2960:
	leal 1(%rax), %esi
	cmpb $43, %dl
	cmove %esi, %eax
	movq %rax, %rdx
	xorl %eax, %eax
.LB2973:
	movslq %edx, %rsi
	movzbl (%rcx,%rsi,1), %esi
	movzbl %sil, %edi
	testb %sil, %sil
	je .LB2975
.LB2974:
	cmpb $48, %sil
	jb .LB2996
.LB2989:
	cmpb $57, %sil
	ja .LB2996
.LB2995:
	leal -48(%rdi), %esi
	imulq $10, %rax, %rax
	addq %rsi, %rax
	incl %edx
	jmp .LB2973
.LB2996:
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB2975:
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB2959:
	xorl %eax, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
	.text
	.globl standard__strings__float2str__3__floatE1__byteE1_ptr1__dataE1_sbits32__ret_dataE1_sbits32
	.def standard__strings__float2str__3__floatE1__byteE1_ptr1__dataE1_sbits32__ret_dataE1_sbits32;
	.scl 2;
	.type 32;
	.endef
standard__strings__float2str__3__floatE1__byteE1_ptr1__dataE1_sbits32__ret_dataE1_sbits32:
	subq $96, %rsp
	movq %rbx, 80(%rsp)
	movq %rsi, 72(%rsp)
	movq %rdi, 64(%rsp)
.LB3010:
	xorps %xmm1, %xmm1
	ucomiss %xmm0, %xmm1
	ja .LB3018
.LB3019:
	xorl %eax, %eax
.LB3020:
	xorps %xmm1, %xmm1
	ucomiss %xmm1, %xmm0
	sete %cl
	setnp %sil
	movzbl %cl, %ecx
	movzbl %sil, %esi
	andl %esi, %ecx
	testb %cl, %cl
	jne .LB3028
.LB3029:
	cvttss2siq %xmm0, %rcx
	movl %ecx, %ecx
	movslq %ecx, %rsi
	xorps %xmm1, %xmm1
	cvtsi2ssq %rsi, %xmm1
	subss %xmm1, %xmm0
	movl $1, %esi
	xorl %edi, %edi
.LB3076:
	cmpl %r8d, %edi
	jge .LB3078
.LB3077:
	imull $10, %esi, %esi
	incl %edi
	cmpl %r8d, %edi
	jl .LB3077
	jmp .LB3078
.LB3018:
	movb $45, (%rdx)
	xorps %xmm1, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subss %xmm15, %xmm0
	movl $1, %eax
	jmp .LB3020
.LB3078:
	movslq %esi, %rdi
	xorps %xmm1, %xmm1
	cvtsi2ssq %rdi, %xmm1
	movabsq $1056964608, %r10
	movq %r10, %xmm2
	vfmadd132ss %xmm1, %xmm2, %xmm0
	cvttss2siq %xmm0, %rdi
	movl %edi, %edi
	cmpl %esi, %edi
	jge .LB3098
.LB3099:
.LB3100:
	testl %ecx, %ecx
	je .LB3116
.LB3117:
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, 32(%rsp)
	vzeroupper
	movq %rcx, %rsi
	xorl %ecx, %ecx
.LB3129:
	testl %esi, %esi
	jle .LB3131
.LB3130:
	movslq %esi, %r9
	movabsq $3435973837, %rbx
	imulq %r9, %rbx
	sarq $35, %rbx
	shrq $63, %r9
	addl %ebx, %r9d
	imull $10, %r9d, %ebx
	subl %ebx, %esi
	addl $48, %esi
	movslq %ecx, %rbx
	movb %sil, 32(%rsp,%rbx,1)
	incl %ecx
	movq %r9, %rsi
	testl %esi, %esi
	jg .LB3130
	jmp .LB3131
.LB3098:
	incl %ecx
	movslq %ecx, %rsi
	movabsq $3435973837, %rdi
	imulq %rsi, %rdi
	sarq $35, %rdi
	shrq $63, %rsi
	addl %esi, %edi
	imull $10, %edi, %edi
	movl %ecx, %esi
	subl %edi, %esi
	testl %esi, %esi
	jne .LB3113
.LB3106:
	testl %r8d, %r8d
	jle .LB3113
.LB3113:
	xorl %edi, %edi
	testl %ecx, %ecx
	je .LB3116
	jmp .LB3117
.LB3131:
	decl %ecx
.LB3147:
	testl %ecx, %ecx
	js .LB3149
.LB3148:
	movslq %ecx, %rsi
	movzbl 32(%rsp,%rsi,1), %esi
	movslq %eax, %r9
	movb %sil, (%rdx,%r9,1)
	incl %eax
	decl %ecx
	jns .LB3148
.LB3149:
.LB3118:
	testl %r8d, %r8d
	jg .LB3164
.LB3165:
	movslq %eax, %rcx
	movb $0, (%rdx,%rcx,1)
	movq 80(%rsp), %rbx
	movq 72(%rsp), %rsi
	movq 64(%rsp), %rdi
	addq $96, %rsp
	ret
.LB3116:
	movslq %eax, %rcx
	movb $48, (%rdx,%rcx,1)
	incl %eax
	testl %r8d, %r8d
	jle .LB3165
.LB3164:
	movslq %eax, %rcx
	movb $46, (%rdx,%rcx,1)
	incl %eax
	testl %edi, %edi
	je .LB3175
.LB3176:
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, (%rsp)
	vzeroupper
	xorl %ecx, %ecx
.LB3197:
	testl %edi, %edi
	jle .LB3199
.LB3198:
	movslq %edi, %rsi
	movabsq $3435973837, %r9
	imulq %rsi, %r9
	sarq $35, %r9
	shrq $63, %rsi
	addl %r9d, %esi
	imull $10, %esi, %r9d
	subl %r9d, %edi
	addl $48, %edi
	movslq %ecx, %r9
	movb %dil, (%rsp,%r9,1)
	incl %ecx
	movq %rsi, %rdi
	testl %edi, %edi
	jg .LB3198
.LB3199:
	subl %ecx, %r8d
	xorl %esi, %esi
.LB3217:
	cmpl %r8d, %esi
	jge .LB3219
.LB3218:
	movslq %eax, %rdi
	movb $48, (%rdx,%rdi,1)
	incl %eax
	incl %esi
	cmpl %r8d, %esi
	jl .LB3218
.LB3219:
	decl %ecx
.LB3234:
	testl %ecx, %ecx
	js .LB3236
.LB3235:
	movslq %ecx, %rsi
	movzbl (%rsp,%rsi,1), %esi
	movslq %eax, %rdi
	movb %sil, (%rdx,%rdi,1)
	incl %eax
	decl %ecx
	jns .LB3235
.LB3236:
.LB3177:
	movslq %eax, %rcx
	movb $0, (%rdx,%rcx,1)
	movq 80(%rsp), %rbx
	movq 72(%rsp), %rsi
	movq 64(%rsp), %rdi
	addq $96, %rsp
	ret
.LB3175:
	xorl %ecx, %ecx
.LB3179:
	cmpl %r8d, %ecx
	jge .LB3181
.LB3180:
	movslq %eax, %rsi
	movb $48, (%rdx,%rsi,1)
	incl %eax
	incl %ecx
	cmpl %r8d, %ecx
	jl .LB3180
.LB3181:
	jmp .LB3177
.LB3028:
	movslq %eax, %rcx
	movb $48, (%rdx,%rcx,1)
	leal 1(%rax), %ecx
	movslq %ecx, %rcx
	movb $46, (%rdx,%rcx,1)
	leal 2(%rax), %ecx
	xorl %esi, %esi
	testl %r8d, %r8d
	cmovg %r8d, %esi
	shrl $2, %esi
	xorl %edi, %edi
.LB25054:
	testl %esi, %esi
	je .LB25056
.LB25055:
	leal (%rcx,%rdi), %r9d
	movslq %r9d, %r9
	movb $48, (%rdx,%r9,1)
	leal 1(%rdi), %r9d
	addl %ecx, %r9d
	movslq %r9d, %r9
	movb $48, (%rdx,%r9,1)
	leal 2(%rdi), %r9d
	addl %ecx, %r9d
	movslq %r9d, %r9
	movb $48, (%rdx,%r9,1)
	leal 3(%rdi), %r9d
	addl %ecx, %r9d
	movslq %r9d, %r9
	movb $48, (%rdx,%r9,1)
	addl $4, %edi
	decl %esi
	jne .LB25055
.LB25056:
.LB3040:
	cmpl %r8d, %edi
	jge .LB3042
.LB3041:
	leal (%rcx,%rdi), %esi
	movslq %esi, %rsi
	movb $48, (%rdx,%rsi,1)
	incl %edi
	cmpl %r8d, %edi
	jl .LB3041
.LB3042:
	leal 2(%rax), %ecx
	addl %r8d, %ecx
	incl %eax
	movslq %ecx, %rcx
	addl %r8d, %eax
	movb $0, (%rdx,%rcx,1)
	movq 80(%rsp), %rbx
	movq 72(%rsp), %rsi
	movq 64(%rsp), %rdi
	addq $96, %rsp
	ret
	.text
	.globl standard__strings__dbl2str__3__doubleE1__byteE1_ptr1__dataE1_sbits32__ret_dataE1_sbits32
	.def standard__strings__dbl2str__3__doubleE1__byteE1_ptr1__dataE1_sbits32__ret_dataE1_sbits32;
	.scl 2;
	.type 32;
	.endef
standard__strings__dbl2str__3__doubleE1__byteE1_ptr1__dataE1_sbits32__ret_dataE1_sbits32:
	subq $96, %rsp
	movq %rbx, 80(%rsp)
	movq %rsi, 72(%rsp)
	movq %rdi, 64(%rsp)
.LB3254:
	movq %rdx, %rcx
	xorps %xmm1, %xmm1
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm0, %xmm1
	ja .LB3262
.LB3263:
	xorl %esi, %esi
.LB3264:
	xorps %xmm1, %xmm1
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm1, %xmm0
	sete %al
	setnp %dl
	movzbl %al, %eax
	movzbl %dl, %edx
	andl %edx, %eax
	testb %al, %al
	jne .LB3272
.LB3273:
	cvttsd2siq %xmm0, %rax
	xorps %xmm1, %xmm1
	cvtsi2sdq %rax, %xmm1
	subsd %xmm1, %xmm0
	movl $1, %edx
	xorl %edi, %edi
.LB3322:
	cmpl %r8d, %edi
	jge .LB3324
.LB3323:
	imulq $10, %rdx, %rdx
	incl %edi
	cmpl %r8d, %edi
	jl .LB3323
	jmp .LB3324
.LB3262:
	movb $69, (%rcx)
	xorps %xmm1, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subsd %xmm15, %xmm0
	movl $1, %esi
	jmp .LB3264
.LB3324:
	xorps %xmm1, %xmm1
	cvtsi2sdq %rdx, %xmm1
	movabsq $1056964608, %r10
	movq %r10, %xmm2
	cvtss2sd %xmm2, %xmm2
	vfmadd132sd %xmm1, %xmm2, %xmm0
	cvttsd2siq %xmm0, %rdi
	cmpq %rdx, %rdi
	jge .LB3346
.LB3347:
.LB3348:
	testq %rax, %rax
	je .LB3369
.LB3370:
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, 32(%rsp)
	vzeroupper
	xorl %r9d, %r9d
	movq %rax, %rbx
.LB3382:
	testq %rbx, %rbx
	jle .LB3384
.LB3383:
	movq %rbx, %rax
	movabsq $7378697629483820647, %rdx
	imulq %rdx
	sarq $2, %rdx
	movq %rdx, %rax
	shrq $63, %rax
	addq %rdx, %rax
	imulq $10, %rax, %rdx
	subq %rdx, %rbx
	leaq 48(%rbx), %rdx
	movslq %r9d, %rbx
	movb %dl, 32(%rsp,%rbx,1)
	incl %r9d
	movq %rax, %rbx
	testq %rbx, %rbx
	jg .LB3383
	jmp .LB3384
.LB3346:
	leaq 1(%rax), %rdi
	movq %rdi, %rax
	movabsq $7378697629483820647, %rdx
	imulq %rdx
	sarq $2, %rdx
	movq %rdx, %rax
	shrq $63, %rax
	addq %rax, %rdx
	imulq $10, %rdx, %rdx
	movq %rdi, %rax
	subq %rdx, %rax
	testq %rax, %rax
	jne .LB3365
.LB3358:
	testl %r8d, %r8d
	jle .LB3365
.LB3365:
	movq %rdi, %rax
	xorl %edi, %edi
	testq %rax, %rax
	je .LB3369
	jmp .LB3370
.LB3384:
	leal -1(%r9), %eax
.LB3404:
	testl %eax, %eax
	js .LB3406
.LB3405:
	movslq %eax, %rdx
	movzbl 32(%rsp,%rdx,1), %edx
	movslq %esi, %r9
	movb %dl, (%rcx,%r9,1)
	incl %esi
	decl %eax
	jns .LB3405
.LB3406:
.LB3371:
	testl %r8d, %r8d
	jg .LB3421
.LB3422:
	movq %rsi, %rax
	movslq %eax, %rdx
	movb $0, (%rcx,%rdx,1)
	movq 80(%rsp), %rbx
	movq 72(%rsp), %rsi
	movq 64(%rsp), %rdi
	addq $96, %rsp
	ret
.LB3369:
	movslq %esi, %rax
	movb $48, (%rcx,%rax,1)
	incl %esi
	testl %r8d, %r8d
	jle .LB3422
.LB3421:
	movslq %esi, %rax
	movb $46, (%rcx,%rax,1)
	incl %esi
	testq %rdi, %rdi
	je .LB3433
.LB3434:
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, (%rsp)
	vzeroupper
	movq %rdi, %r9
	xorl %edi, %edi
.LB3455:
	testq %r9, %r9
	jle .LB3457
.LB3456:
	movq %r9, %rax
	movabsq $7378697629483820647, %rdx
	imulq %rdx
	sarq $2, %rdx
	movq %rdx, %rax
	shrq $63, %rax
	addq %rdx, %rax
	imulq $10, %rax, %rdx
	subq %rdx, %r9
	leaq 48(%r9), %rdx
	movslq %edi, %r9
	movb %dl, (%rsp,%r9,1)
	incl %edi
	movq %rax, %r9
	testq %r9, %r9
	jg .LB3456
.LB3457:
	subl %edi, %r8d
	xorl %eax, %eax
.LB3479:
	cmpl %r8d, %eax
	jge .LB3481
.LB3480:
	movslq %esi, %rdx
	movb $48, (%rcx,%rdx,1)
	incl %esi
	incl %eax
	cmpl %r8d, %eax
	jl .LB3480
.LB3481:
	leal -1(%rdi), %eax
.LB3496:
	testl %eax, %eax
	js .LB3498
.LB3497:
	movslq %eax, %rdx
	movzbl (%rsp,%rdx,1), %edx
	movslq %esi, %rdi
	movb %dl, (%rcx,%rdi,1)
	incl %esi
	decl %eax
	jns .LB3497
.LB3498:
.LB3435:
	movq %rsi, %rax
	movslq %eax, %rdx
	movb $0, (%rcx,%rdx,1)
	movq 80(%rsp), %rbx
	movq 72(%rsp), %rsi
	movq 64(%rsp), %rdi
	addq $96, %rsp
	ret
.LB3433:
	xorl %eax, %eax
.LB3437:
	cmpl %r8d, %eax
	jge .LB3439
.LB3438:
	movslq %esi, %rdx
	movb $48, (%rcx,%rdx,1)
	incl %esi
	incl %eax
	cmpl %r8d, %eax
	jl .LB3438
.LB3439:
	jmp .LB3435
.LB3272:
	movslq %esi, %rax
	movb $48, (%rcx,%rax,1)
	leal 1(%rsi), %eax
	movslq %eax, %rax
	movb $46, (%rcx,%rax,1)
	leal 2(%rsi), %eax
	xorl %edx, %edx
	testl %r8d, %r8d
	cmovg %r8d, %edx
	shrl $2, %edx
	xorl %edi, %edi
.LB25061:
	testl %edx, %edx
	je .LB25063
.LB25062:
	leal (%rax,%rdi), %r9d
	movslq %r9d, %r9
	movb $48, (%rcx,%r9,1)
	leal 1(%rdi), %r9d
	addl %eax, %r9d
	movslq %r9d, %r9
	movb $48, (%rcx,%r9,1)
	leal 2(%rdi), %r9d
	addl %eax, %r9d
	movslq %r9d, %r9
	movb $48, (%rcx,%r9,1)
	leal 3(%rdi), %r9d
	addl %eax, %r9d
	movslq %r9d, %r9
	movb $48, (%rcx,%r9,1)
	addl $4, %edi
	decl %edx
	jne .LB25062
.LB25063:
.LB3285:
	cmpl %r8d, %edi
	jge .LB3287
.LB3286:
	leal (%rax,%rdi), %edx
	movslq %edx, %rdx
	movb $48, (%rcx,%rdx,1)
	incl %edi
	cmpl %r8d, %edi
	jl .LB3286
.LB3287:
	leal 2(%rsi), %eax
	addl %r8d, %eax
	incl %esi
	movslq %eax, %rax
	movb $0, (%rcx,%rax,1)
	leal (%rsi,%r8), %eax
	movq 80(%rsp), %rbx
	movq 72(%rsp), %rsi
	movq 64(%rsp), %rdi
	addq $96, %rsp
	ret
	.text
	.globl standard__strings__count_lines__1__byteE1_ptr1__ret_intE1
	.def standard__strings__count_lines__1__byteE1_ptr1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__strings__count_lines__1__byteE1_ptr1__ret_intE1:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
	movq %rdi, -8(%rsp)
.LB3516:
	xorl %eax, %eax
	xorl %edx, %edx
.LB3519:
	movslq %edx, %rsi
	movzbl (%rcx,%rsi,1), %esi
	testb %sil, %sil
	je .LB3522
.LB3520:
	leal 1(%rax), %edi
	cmpb $10, %sil
	cmove %edi, %eax
	incl %edx
	jmp .LB3519
.LB3522:
	testl %eax, %eax
	jg .LB3552
.LB3544:
	cmpb $0, (%rcx)
	jne .LB3552
.LB3553:
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB3552:
	incl %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
	.text
	.globl standard__strings__get_line__2__byteE1_ptr1__intE1__ret_byteE1_ptr1
	.def standard__strings__get_line__2__byteE1_ptr1__intE1__ret_byteE1_ptr1;
	.scl 2;
	.type 32;
	.endef
standard__strings__get_line__2__byteE1_ptr1__intE1__ret_byteE1_ptr1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB3558:
	xorl %eax, %eax
	xorl %esi, %esi
.LB3563:
	movslq %esi, %rdi
	movzbl (%rcx,%rdi,1), %edi
	testb %dil, %dil
	jne .LB3564
.LB25068:
	xorl %esi, %esi
.LB3566:
	cmpl %edx, %eax
	jne .LB3596
.LB3597:
	movq %rsi, %rax
.LB3603:
	movslq %eax, %rdx
	movzbl (%rcx,%rdx,1), %edx
	testb %dl, %dl
	je .LB3605
.LB3612:
	cmpb $10, %dl
	je .LB3605
.LB3604:
	incl %eax
	jmp .LB3603
.LB3564:
	cmpl %edx, %eax
	je .LB3577
.LB3578:
	leal 1(%rax), %r8d
	cmpb $10, %dil
	cmove %r8d, %eax
	incl %esi
	jmp .LB3563
.LB3577:
	cmpl %edx, %eax
	jne .LB3596
	jmp .LB3597
.LB3605:
	movl %eax, %r8d
	subl %esi, %r8d
	movq %rsi, %rdx
	callq standard__strings__manip__substring__3__byteE1_ptr1__intE1__intE1__ret_byteE1_ptr1
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB3596:
	xorl %eax, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__strings__count_words__1__byteE1_ptr1__ret_intE1
	.def standard__strings__count_words__1__byteE1_ptr1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__strings__count_words__1__byteE1_ptr1__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
.LB3630:
	movq %rcx, %rsi
	xorl %edi, %edi
	xorl %ebx, %ebx
	xorl %r12d, %r12d
.LB3634:
	movslq %r12d, %rax
	movzbl (%rsi,%rax,1), %eax
	testb %al, %al
	je .LB3637
.LB3635:
	movzbl %al, %ecx
	callq standard__strings__helpers__is_whitespace__1__charE1__ret_boolE1
	testb %al, %al
	jne .LB3650
.LB3651:
	testb %bl, %bl
	je .LB3655
.LB3656:
.LB3652:
	incl %r12d
	jmp .LB3634
.LB3637:
	movl %edi, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB3655:
	incl %edi
	movl $1, %ebx
	jmp .LB3652
.LB3650:
	xorl %ebx, %ebx
	jmp .LB3652
	.text
	.globl standard__strings__replace_first__3__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__ret_byteE1_ptr1
	.def standard__strings__replace_first__3__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__ret_byteE1_ptr1;
	.scl 2;
	.type 32;
	.endef
standard__strings__replace_first__3__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__ret_byteE1_ptr1:
	pushq %rbp
	movq %rsp, %rbp
	subq $96, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
	movq %r14, -48(%rbp)
	movq %r15, -56(%rbp)
.LB3662:
	movq %rcx, %rbx
	movq %rdx, %rsi
	movq %r8, %r12
	movq %rbx, %rcx
	movq %rsi, %rdx
	xorl %r8d, %r8d
	callq standard__strings__helpers__find_substring__3__byteE1_ptr1__byteE1_ptr1__intE1__ret_intE1
	movl %eax, %r13d
	cmpl $4294967295, %r13d
	je .LB3673
.LB3674:
	xorl %r14d, %r14d
.LB3679:
	movslq %r14d, %rax
	cmpb $0, (%rbx,%rax,1)
	je .LB3681
.LB3680:
	incl %r14d
	jmp .LB3679
.LB3681:
	xorl %r15d, %r15d
.LB3691:
	movslq %r15d, %rax
	cmpb $0, (%rsi,%rax,1)
	je .LB3693
.LB3692:
	incl %r15d
	jmp .LB3691
.LB3693:
	movq $0, -64(%rbp)
.LB3703:
	movq -64(%rbp), %rax
	movslq %eax, %rax
	cmpb $0, (%r12,%rax,1)
	je .LB3705
.LB3704:
	movq -64(%rbp), %rax
	incl %eax
	movq %rax, -64(%rbp)
	jmp .LB3703
.LB3705:
	movl %r14d, %eax
	subl %r15d, %eax
	movq -64(%rbp), %rcx
	addl %ecx, %eax
	leaq 1(%rax), %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	testq %rax, %rax
	je .LB3731
.LB3732:
	cmpl $32, %r13d
	jge .LB25069
.LB25070:
	movslq %r13d, %rcx
	xorl %edx, %edx
	testq %rcx, %rcx
	cmovg %rcx, %rdx
	shrq $2, %rdx
	xorl %esi, %esi
.LB25071:
	testq %rdx, %rdx
	je .LB25073
.LB25072:
	movzbl (%rbx,%rsi,1), %edi
	movb %dil, (%rax,%rsi,1)
	movzbl 1(%rbx,%rsi,1), %edi
	movb %dil, 1(%rax,%rsi,1)
	movzbl 2(%rbx,%rsi,1), %edi
	movb %dil, 2(%rax,%rsi,1)
	movzbl 3(%rbx,%rsi,1), %edi
	movb %dil, 3(%rax,%rsi,1)
	addq $4, %rsi
	decq %rdx
	jne .LB25072
.LB25073:
.LB3736:
	cmpq %rcx, %rsi
	jge .LB3739
.LB3737:
	movzbl (%rbx,%rsi,1), %edx
	movb %dl, (%rax,%rsi,1)
	incq %rsi
	cmpq %rcx, %rsi
	jl .LB3737
	jmp .LB3739
.LB25069:
	movslq %r13d, %rcx
	movq %rcx, %rdx
	sarq $63, %rdx
	notq %rdx
	andq %rdx, %rcx
	movq %rax, %rdi
	movq %rbx, %rsi
	rep movsb
.LB3739:
	xorl %ecx, %ecx
	movq -64(%rbp), %rdx
	testl %edx, %edx
	cmovg %edx, %ecx
	shrl $2, %ecx
	xorl %edx, %edx
.LB25074:
	testl %ecx, %ecx
	je .LB25076
.LB25075:
	movslq %edx, %rsi
	movzbl (%r12,%rsi,1), %esi
	leal (%r13,%rdx), %edi
	movslq %edi, %rdi
	movb %sil, (%rax,%rdi,1)
	leal 1(%rdx), %esi
	movslq %esi, %rdi
	movzbl (%r12,%rdi,1), %edi
	addl %r13d, %esi
	movslq %esi, %rsi
	movb %dil, (%rax,%rsi,1)
	leal 2(%rdx), %esi
	movslq %esi, %rdi
	movzbl (%r12,%rdi,1), %edi
	addl %r13d, %esi
	movslq %esi, %rsi
	movb %dil, (%rax,%rsi,1)
	leal 3(%rdx), %esi
	movslq %esi, %rdi
	movzbl (%r12,%rdi,1), %edi
	addl %r13d, %esi
	movslq %esi, %rsi
	movb %dil, (%rax,%rsi,1)
	addl $4, %edx
	decl %ecx
	jne .LB25075
.LB25076:
.LB3753:
	movq -64(%rbp), %rcx
	cmpl %ecx, %edx
	jge .LB3756
.LB3754:
	movslq %edx, %rcx
	movzbl (%r12,%rcx,1), %ecx
	leal (%r13,%rdx), %esi
	movslq %esi, %rsi
	movb %cl, (%rax,%rsi,1)
	incl %edx
	jmp .LB3753
.LB3756:
	leal (%r13,%r15), %ecx
.LB3772:
	cmpl %r14d, %ecx
	jg .LB3775
.LB3773:
	movslq %ecx, %rdx
	movzbl (%rbx,%rdx,1), %edx
	movl %ecx, %esi
	subl %r15d, %esi
	movq -64(%rbp), %rdi
	addl %edi, %esi
	movslq %esi, %rsi
	movb %dl, (%rax,%rsi,1)
	incl %ecx
	cmpl %r14d, %ecx
	jle .LB3773
.LB3775:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB3731:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB3673:
	movq %rbx, %rcx
	callq standard__strings__manip__copy_string__1__byteE1_ptr1__ret_byteE1_ptr1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
	.text
	.globl standard__strings__fstr_append__3__dataE1_sbits16__byteE1_ptr1__intE1_ptr1__ret_intE1
	.def standard__strings__fstr_append__3__dataE1_sbits16__byteE1_ptr1__intE1_ptr1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__strings__fstr_append__3__dataE1_sbits16__byteE1_ptr1__intE1_ptr1__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
.LB3797:
	movq %rdx, %rsi
	movq %r8, %rdi
	movq .LZERO(%rip), %r10
	movq %r10, -32(%rbp)
	leaq -32(%rbp), %rdx
	movzwl %cx, %ecx
	callq standard__strings__i16str__2__dataE1_sbits16__byteE1_ptr1__ret_dataE1_sbits16
	movzwl %ax, %eax
	movswl %ax, %eax
	movslq %eax, %rcx
	xorl %edx, %edx
	testq %rcx, %rcx
	cmovg %rcx, %rdx
	shrq $2, %rdx
	xorl %r8d, %r8d
.LB25077:
	testq %rdx, %rdx
	je .LB25079
.LB25078:
	movzbl -32(%rbp,%r8,1), %r9d
	movslq (%rdi), %rbx
	movb %r9b, (%rsi,%rbx,1)
	movl (%rdi), %r9d
	incl %r9d
	movl %r9d, (%rdi)
	movzbl -31(%rbp,%r8,1), %r9d
	movslq (%rdi), %rbx
	movb %r9b, (%rsi,%rbx,1)
	movl (%rdi), %r9d
	incl %r9d
	movl %r9d, (%rdi)
	movzbl -30(%rbp,%r8,1), %r9d
	movslq (%rdi), %rbx
	movb %r9b, (%rsi,%rbx,1)
	movl (%rdi), %r9d
	incl %r9d
	movl %r9d, (%rdi)
	movzbl -29(%rbp,%r8,1), %r9d
	movslq (%rdi), %rbx
	movb %r9b, (%rsi,%rbx,1)
	movl (%rdi), %r9d
	incl %r9d
	movl %r9d, (%rdi)
	addq $4, %r8
	decq %rdx
	jne .LB25078
.LB25079:
.LB3808:
	cmpq %rcx, %r8
	jge .LB3810
.LB3809:
	movzbl -32(%rbp,%r8,1), %edx
	movslq (%rdi), %r9
	movb %dl, (%rsi,%r9,1)
	movl (%rdi), %edx
	incl %edx
	movl %edx, (%rdi)
	incq %r8
	cmpq %rcx, %r8
	jl .LB3809
.LB3810:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__strings__fstr_append__3__dataE1_sbits32__byteE1_ptr1__intE1_ptr1__ret_intE1
	.def standard__strings__fstr_append__3__dataE1_sbits32__byteE1_ptr1__intE1_ptr1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__strings__fstr_append__3__dataE1_sbits32__byteE1_ptr1__intE1_ptr1__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $96, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
.LB3828:
	movq %rdx, %rsi
	movq %r8, %rdi
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -56(%rbp)
	vzeroupper
	leaq -56(%rbp), %rdx
	callq standard__strings__i32str__2__dataE1_sbits32__byteE1_ptr1__ret_dataE1_sbits32
	movslq %eax, %rcx
	xorl %edx, %edx
	testq %rcx, %rcx
	cmovg %rcx, %rdx
	shrq $2, %rdx
	xorl %r8d, %r8d
.LB25080:
	testq %rdx, %rdx
	je .LB25082
.LB25081:
	movzbl -56(%rbp,%r8,1), %r9d
	movslq (%rdi), %rbx
	movb %r9b, (%rsi,%rbx,1)
	movl (%rdi), %r9d
	incl %r9d
	movl %r9d, (%rdi)
	movzbl -55(%rbp,%r8,1), %r9d
	movslq (%rdi), %rbx
	movb %r9b, (%rsi,%rbx,1)
	movl (%rdi), %r9d
	incl %r9d
	movl %r9d, (%rdi)
	movzbl -54(%rbp,%r8,1), %r9d
	movslq (%rdi), %rbx
	movb %r9b, (%rsi,%rbx,1)
	movl (%rdi), %r9d
	incl %r9d
	movl %r9d, (%rdi)
	movzbl -53(%rbp,%r8,1), %r9d
	movslq (%rdi), %rbx
	movb %r9b, (%rsi,%rbx,1)
	movl (%rdi), %r9d
	incl %r9d
	movl %r9d, (%rdi)
	addq $4, %r8
	decq %rdx
	jne .LB25081
.LB25082:
.LB3838:
	cmpq %rcx, %r8
	jge .LB3840
.LB3839:
	movzbl -56(%rbp,%r8,1), %edx
	movslq (%rdi), %r9
	movb %dl, (%rsi,%r9,1)
	movl (%rdi), %edx
	incl %edx
	movl %edx, (%rdi)
	incq %r8
	cmpq %rcx, %r8
	jl .LB3839
.LB3840:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__strings__fstr_append__3__dataE1_sbits64__byteE1_ptr1__intE1_ptr1__ret_intE1
	.def standard__strings__fstr_append__3__dataE1_sbits64__byteE1_ptr1__intE1_ptr1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__strings__fstr_append__3__dataE1_sbits64__byteE1_ptr1__intE1_ptr1__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $96, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
.LB3858:
	movq %rdx, %rsi
	movq %r8, %rdi
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -56(%rbp)
	vzeroupper
	leaq -56(%rbp), %rdx
	callq standard__strings__i64str__2__dataE1_sbits64__byteE1_ptr1__ret_dataE1_sbits64
	movslq %eax, %rcx
	xorl %edx, %edx
	testq %rcx, %rcx
	cmovg %rcx, %rdx
	shrq $2, %rdx
	xorl %r8d, %r8d
.LB25083:
	testq %rdx, %rdx
	je .LB25085
.LB25084:
	movzbl -56(%rbp,%r8,1), %r9d
	movslq (%rdi), %rbx
	movb %r9b, (%rsi,%rbx,1)
	movl (%rdi), %r9d
	incl %r9d
	movl %r9d, (%rdi)
	movzbl -55(%rbp,%r8,1), %r9d
	movslq (%rdi), %rbx
	movb %r9b, (%rsi,%rbx,1)
	movl (%rdi), %r9d
	incl %r9d
	movl %r9d, (%rdi)
	movzbl -54(%rbp,%r8,1), %r9d
	movslq (%rdi), %rbx
	movb %r9b, (%rsi,%rbx,1)
	movl (%rdi), %r9d
	incl %r9d
	movl %r9d, (%rdi)
	movzbl -53(%rbp,%r8,1), %r9d
	movslq (%rdi), %rbx
	movb %r9b, (%rsi,%rbx,1)
	movl (%rdi), %r9d
	incl %r9d
	movl %r9d, (%rdi)
	addq $4, %r8
	decq %rdx
	jne .LB25084
.LB25085:
.LB3869:
	cmpq %rcx, %r8
	jge .LB3871
.LB3870:
	movzbl -56(%rbp,%r8,1), %edx
	movslq (%rdi), %r9
	movb %dl, (%rsi,%r9,1)
	movl (%rdi), %edx
	incl %edx
	movl %edx, (%rdi)
	incq %r8
	cmpq %rcx, %r8
	jl .LB3870
.LB3871:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__strings__fstr_append__3__dataE1_ubits16__byteE1_ptr1__intE1_ptr1__ret_intE1
	.def standard__strings__fstr_append__3__dataE1_ubits16__byteE1_ptr1__intE1_ptr1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__strings__fstr_append__3__dataE1_ubits16__byteE1_ptr1__intE1_ptr1__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
.LB3889:
	movq %rdx, %rsi
	movq %r8, %rdi
	movq .LZERO(%rip), %r10
	movq %r10, -32(%rbp)
	leaq -32(%rbp), %rdx
	movzwl %cx, %ecx
	callq standard__strings__u16str__2__dataE1_ubits16__byteE1_ptr1__ret_dataE1_ubits16
	movzwl %ax, %eax
	movslq %eax, %rcx
	xorl %edx, %edx
	testq %rcx, %rcx
	cmovg %rcx, %rdx
	shrq $2, %rdx
	xorl %r8d, %r8d
.LB25086:
	testq %rdx, %rdx
	je .LB25088
.LB25087:
	movzbl -32(%rbp,%r8,1), %r9d
	movslq (%rdi), %rbx
	movb %r9b, (%rsi,%rbx,1)
	movl (%rdi), %r9d
	incl %r9d
	movl %r9d, (%rdi)
	movzbl -31(%rbp,%r8,1), %r9d
	movslq (%rdi), %rbx
	movb %r9b, (%rsi,%rbx,1)
	movl (%rdi), %r9d
	incl %r9d
	movl %r9d, (%rdi)
	movzbl -30(%rbp,%r8,1), %r9d
	movslq (%rdi), %rbx
	movb %r9b, (%rsi,%rbx,1)
	movl (%rdi), %r9d
	incl %r9d
	movl %r9d, (%rdi)
	movzbl -29(%rbp,%r8,1), %r9d
	movslq (%rdi), %rbx
	movb %r9b, (%rsi,%rbx,1)
	movl (%rdi), %r9d
	incl %r9d
	movl %r9d, (%rdi)
	addq $4, %r8
	decq %rdx
	jne .LB25087
.LB25088:
.LB3900:
	cmpq %rcx, %r8
	jge .LB3902
.LB3901:
	movzbl -32(%rbp,%r8,1), %edx
	movslq (%rdi), %r9
	movb %dl, (%rsi,%r9,1)
	movl (%rdi), %edx
	incl %edx
	movl %edx, (%rdi)
	incq %r8
	cmpq %rcx, %r8
	jl .LB3901
.LB3902:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__strings__fstr_append__3__dataE1_ubits32__byteE1_ptr1__intE1_ptr1__ret_intE1
	.def standard__strings__fstr_append__3__dataE1_ubits32__byteE1_ptr1__intE1_ptr1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__strings__fstr_append__3__dataE1_ubits32__byteE1_ptr1__intE1_ptr1__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $96, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
.LB3920:
	movq %rdx, %rsi
	movq %r8, %rdi
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -56(%rbp)
	vzeroupper
	leaq -56(%rbp), %rdx
	callq standard__strings__u32str__2__dataE1_ubits32__byteE1_ptr1__ret_dataE1_ubits32
	movslq %eax, %rcx
	xorl %edx, %edx
	testq %rcx, %rcx
	cmovg %rcx, %rdx
	shrq $2, %rdx
	xorl %r8d, %r8d
.LB25089:
	testq %rdx, %rdx
	je .LB25091
.LB25090:
	movzbl -56(%rbp,%r8,1), %r9d
	movslq (%rdi), %rbx
	movb %r9b, (%rsi,%rbx,1)
	movl (%rdi), %r9d
	incl %r9d
	movl %r9d, (%rdi)
	movzbl -55(%rbp,%r8,1), %r9d
	movslq (%rdi), %rbx
	movb %r9b, (%rsi,%rbx,1)
	movl (%rdi), %r9d
	incl %r9d
	movl %r9d, (%rdi)
	movzbl -54(%rbp,%r8,1), %r9d
	movslq (%rdi), %rbx
	movb %r9b, (%rsi,%rbx,1)
	movl (%rdi), %r9d
	incl %r9d
	movl %r9d, (%rdi)
	movzbl -53(%rbp,%r8,1), %r9d
	movslq (%rdi), %rbx
	movb %r9b, (%rsi,%rbx,1)
	movl (%rdi), %r9d
	incl %r9d
	movl %r9d, (%rdi)
	addq $4, %r8
	decq %rdx
	jne .LB25090
.LB25091:
.LB3930:
	cmpq %rcx, %r8
	jge .LB3932
.LB3931:
	movzbl -56(%rbp,%r8,1), %edx
	movslq (%rdi), %r9
	movb %dl, (%rsi,%r9,1)
	movl (%rdi), %edx
	incl %edx
	movl %edx, (%rdi)
	incq %r8
	cmpq %rcx, %r8
	jl .LB3931
.LB3932:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__strings__fstr_append__3__dataE1_ubits64__byteE1_ptr1__intE1_ptr1__ret_intE1
	.def standard__strings__fstr_append__3__dataE1_ubits64__byteE1_ptr1__intE1_ptr1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__strings__fstr_append__3__dataE1_ubits64__byteE1_ptr1__intE1_ptr1__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $96, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
.LB3950:
	movq %rdx, %rsi
	movq %r8, %rdi
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -56(%rbp)
	vzeroupper
	leaq -56(%rbp), %rdx
	callq standard__strings__u64str__2__dataE1_ubits64__byteE1_ptr1__ret_dataE1_ubits64
	movslq %eax, %rcx
	xorl %edx, %edx
	testq %rcx, %rcx
	cmovg %rcx, %rdx
	shrq $2, %rdx
	xorl %r8d, %r8d
.LB25092:
	testq %rdx, %rdx
	je .LB25094
.LB25093:
	movzbl -56(%rbp,%r8,1), %r9d
	movslq (%rdi), %rbx
	movb %r9b, (%rsi,%rbx,1)
	movl (%rdi), %r9d
	incl %r9d
	movl %r9d, (%rdi)
	movzbl -55(%rbp,%r8,1), %r9d
	movslq (%rdi), %rbx
	movb %r9b, (%rsi,%rbx,1)
	movl (%rdi), %r9d
	incl %r9d
	movl %r9d, (%rdi)
	movzbl -54(%rbp,%r8,1), %r9d
	movslq (%rdi), %rbx
	movb %r9b, (%rsi,%rbx,1)
	movl (%rdi), %r9d
	incl %r9d
	movl %r9d, (%rdi)
	movzbl -53(%rbp,%r8,1), %r9d
	movslq (%rdi), %rbx
	movb %r9b, (%rsi,%rbx,1)
	movl (%rdi), %r9d
	incl %r9d
	movl %r9d, (%rdi)
	addq $4, %r8
	decq %rdx
	jne .LB25093
.LB25094:
.LB3961:
	cmpq %rcx, %r8
	jge .LB3963
.LB3962:
	movzbl -56(%rbp,%r8,1), %edx
	movslq (%rdi), %r9
	movb %dl, (%rsi,%r9,1)
	movl (%rdi), %edx
	incl %edx
	movl %edx, (%rdi)
	incq %r8
	cmpq %rcx, %r8
	jl .LB3962
.LB3963:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__strings__fstr_append__3__floatE1__byteE1_ptr1__intE1_ptr1__ret_intE1
	.def standard__strings__fstr_append__3__floatE1__byteE1_ptr1__intE1_ptr1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__strings__fstr_append__3__floatE1__byteE1_ptr1__intE1_ptr1__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $96, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
.LB3981:
	movq %rdx, %rsi
	movq %r8, %rdi
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -56(%rbp)
	vzeroupper
	leaq -56(%rbp), %rdx
	movl $6, %r8d
	callq standard__strings__float2str__3__floatE1__byteE1_ptr1__dataE1_sbits32__ret_dataE1_sbits32
	movslq %eax, %rcx
	xorl %edx, %edx
	testq %rcx, %rcx
	cmovg %rcx, %rdx
	shrq $2, %rdx
	xorl %r8d, %r8d
.LB25095:
	testq %rdx, %rdx
	je .LB25097
.LB25096:
	movzbl -56(%rbp,%r8,1), %r9d
	movslq (%rdi), %rbx
	movb %r9b, (%rsi,%rbx,1)
	movl (%rdi), %r9d
	incl %r9d
	movl %r9d, (%rdi)
	movzbl -55(%rbp,%r8,1), %r9d
	movslq (%rdi), %rbx
	movb %r9b, (%rsi,%rbx,1)
	movl (%rdi), %r9d
	incl %r9d
	movl %r9d, (%rdi)
	movzbl -54(%rbp,%r8,1), %r9d
	movslq (%rdi), %rbx
	movb %r9b, (%rsi,%rbx,1)
	movl (%rdi), %r9d
	incl %r9d
	movl %r9d, (%rdi)
	movzbl -53(%rbp,%r8,1), %r9d
	movslq (%rdi), %rbx
	movb %r9b, (%rsi,%rbx,1)
	movl (%rdi), %r9d
	incl %r9d
	movl %r9d, (%rdi)
	addq $4, %r8
	decq %rdx
	jne .LB25096
.LB25097:
.LB3991:
	cmpq %rcx, %r8
	jge .LB3993
.LB3992:
	movzbl -56(%rbp,%r8,1), %edx
	movslq (%rdi), %r9
	movb %dl, (%rsi,%r9,1)
	movl (%rdi), %edx
	incl %edx
	movl %edx, (%rdi)
	incq %r8
	cmpq %rcx, %r8
	jl .LB3992
.LB3993:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__strings__fstr_append__3__doubleE1__byteE1_ptr1__intE1_ptr1__ret_intE1
	.def standard__strings__fstr_append__3__doubleE1__byteE1_ptr1__intE1_ptr1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__strings__fstr_append__3__doubleE1__byteE1_ptr1__intE1_ptr1__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $96, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
.LB4011:
	movq %rdx, %rsi
	movq %r8, %rdi
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -56(%rbp)
	vzeroupper
	leaq -56(%rbp), %rdx
	movl $14, %r8d
	callq standard__strings__dbl2str__3__doubleE1__byteE1_ptr1__dataE1_sbits32__ret_dataE1_sbits32
	movslq %eax, %rcx
	xorl %edx, %edx
	testq %rcx, %rcx
	cmovg %rcx, %rdx
	shrq $2, %rdx
	xorl %r8d, %r8d
.LB25098:
	testq %rdx, %rdx
	je .LB25100
.LB25099:
	movzbl -56(%rbp,%r8,1), %r9d
	movslq (%rdi), %rbx
	movb %r9b, (%rsi,%rbx,1)
	movl (%rdi), %r9d
	incl %r9d
	movl %r9d, (%rdi)
	movzbl -55(%rbp,%r8,1), %r9d
	movslq (%rdi), %rbx
	movb %r9b, (%rsi,%rbx,1)
	movl (%rdi), %r9d
	incl %r9d
	movl %r9d, (%rdi)
	movzbl -54(%rbp,%r8,1), %r9d
	movslq (%rdi), %rbx
	movb %r9b, (%rsi,%rbx,1)
	movl (%rdi), %r9d
	incl %r9d
	movl %r9d, (%rdi)
	movzbl -53(%rbp,%r8,1), %r9d
	movslq (%rdi), %rbx
	movb %r9b, (%rsi,%rbx,1)
	movl (%rdi), %r9d
	incl %r9d
	movl %r9d, (%rdi)
	addq $4, %r8
	decq %rdx
	jne .LB25099
.LB25100:
.LB4021:
	cmpq %rcx, %r8
	jge .LB4023
.LB4022:
	movzbl -56(%rbp,%r8,1), %edx
	movslq (%rdi), %r9
	movb %dl, (%rsi,%r9,1)
	movl (%rdi), %edx
	incl %edx
	movl %edx, (%rdi)
	incq %r8
	cmpq %rcx, %r8
	jl .LB4022
.LB4023:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__strings__fstr_append__3__byteE1_ptr1__byteE1_ptr1__intE1_ptr1__ret_intE1
	.def standard__strings__fstr_append__3__byteE1_ptr1__byteE1_ptr1__intE1_ptr1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__strings__fstr_append__3__byteE1_ptr1__byteE1_ptr1__intE1_ptr1__ret_intE1:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
	movq %rdi, -8(%rsp)
.LB4041:
	xorl %eax, %eax
.LB4046:
	movslq %eax, %rsi
	movzbl (%rcx,%rsi,1), %esi
	testb %sil, %sil
	je .LB4048
.LB4047:
	movslq (%r8), %rdi
	movb %sil, (%rdx,%rdi,1)
	movl (%r8), %esi
	incl %esi
	movl %esi, (%r8)
	incl %eax
	jmp .LB4046
.LB4048:
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
	.text
	.globl find_last_substring__2__byteE1_ptr1__byteE1_ptr1__ret_intE1
	.def find_last_substring__2__byteE1_ptr1__byteE1_ptr1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
find_last_substring__2__byteE1_ptr1__byteE1_ptr1__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
.LB4070:
	movq %rcx, %rsi
	movq %rdx, %rdi
	testq %rsi, %rsi
	je .LB4084
.LB4077:
	testq %rdi, %rdi
	je .LB4084
.LB4085:
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %ebx
	movq %rdi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	testl %eax, %eax
	je .LB4096
.LB4097:
	cmpl %ebx, %eax
	jg .LB4103
.LB4104:
	movl %ebx, %ecx
	subl %eax, %ecx
.LB4108:
	testl %ecx, %ecx
	js .LB4111
.LB4109:
	xorl %edx, %edx
.LB4118:
	cmpl %eax, %edx
	jl .LB4119
.LB25101:
	movl $1, %edx
.LB4121:
	testb %dl, %dl
	jne .LB4143
.LB4144:
	decl %ecx
	jns .LB4109
.LB4111:
	movabsq $4294967295, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB4119:
	leal (%rcx,%rdx), %r8d
	movslq %edx, %r9
	movslq %r8d, %r8
	movzbl (%rsi,%r8,1), %r8d
	movzbl (%rdi,%r9,1), %r9d
	cmpb %r9b, %r8b
	jne .LB4137
.LB4138:
	incl %edx
	cmpl %eax, %edx
	jl .LB4119
	jmp .LB25101
.LB4137:
	xorl %edx, %edx
	testb %dl, %dl
	je .LB4144
.LB4143:
	movl %ecx, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB4103:
	movabsq $4294967295, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB4096:
	movl %ebx, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB4084:
	movabsq $4294967295, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
	.text
	.globl find_last_char__2__byteE1_ptr1__charE1__ret_intE1
	.def find_last_char__2__byteE1_ptr1__charE1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
find_last_char__2__byteE1_ptr1__charE1__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB4150:
	movq %rcx, %rsi
	movl %edx, %edi
	testq %rsi, %rsi
	je .LB4157
.LB4158:
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	decl %eax
.LB4164:
	testl %eax, %eax
	js .LB4167
.LB4165:
	movslq %eax, %rcx
	movzbl (%rsi,%rcx,1), %ecx
	cmpb %dil, %cl
	je .LB4179
.LB4180:
	decl %eax
	jns .LB4165
.LB4167:
	movabsq $4294967295, %rax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB4179:
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB4157:
	movabsq $4294967295, %rax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
	.text
	.globl count_substring__2__byteE1_ptr1__byteE1_ptr1__ret_intE1
	.def count_substring__2__byteE1_ptr1__byteE1_ptr1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
count_substring__2__byteE1_ptr1__byteE1_ptr1__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
.LB4186:
	movq %rcx, %rsi
	movq %rdx, %rdi
	testq %rsi, %rsi
	je .LB4200
.LB4193:
	testq %rdi, %rdi
	je .LB4200
.LB4201:
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %ebx
	movq %rdi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	testl %eax, %eax
	je .LB4217
.LB4211:
	cmpl %ebx, %eax
	jg .LB4217
.LB4218:
	subl %eax, %ebx
	xorl %ecx, %ecx
	xorl %edx, %edx
.LB4223:
	cmpl %ebx, %edx
	jg .LB4225
.LB4224:
	xorl %r8d, %r8d
.LB4231:
	cmpl %eax, %r8d
	jl .LB4232
.LB25102:
	movl $1, %r8d
.LB4234:
	leal 1(%rcx), %r9d
	leal (%rdx,%rax), %r12d
	incl %edx
	testb %r8b, %r8b
	cmovne %r9d, %ecx
	testb %r8b, %r8b
	cmovne %r12d, %edx
	cmpl %ebx, %edx
	jle .LB4224
.LB4225:
	movl %ecx, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB4232:
	leal (%rdx,%r8), %r9d
	movslq %r8d, %r12
	movslq %r9d, %r9
	movzbl (%rsi,%r9,1), %r9d
	movzbl (%rdi,%r12,1), %r12d
	cmpb %r12b, %r9b
	jne .LB4250
.LB4251:
	incl %r8d
	cmpl %eax, %r8d
	jl .LB4232
	jmp .LB25102
.LB4250:
	xorl %r8d, %r8d
	jmp .LB4234
.LB4217:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB4200:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
	.text
	.globl standard__io__console__flush__0__ret_voidE1
	.def standard__io__console__flush__0__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__io__console__flush__0__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB4277:
	movl standard__io__console__out_len(%rip), %edi
	testl %edi, %edi
	je .LB4282
.LB4283:
	movl $0, standard__io__console__out_len(%rip)
	leaq standard__io__console__out_buf(%rip), %rsi
	movq $-11, %rcx        
	                    subq $32, %rsp
	                    call GetStdHandle
	                    addq $32, %rsp
	                    movq %rax, %rcx         
	                    movq %rsi, %rdx           
	                    movl %edi, %r8d           
	                    xorq %r9, %r9           
	                    subq $40, %rsp         
	                    movq %r9, 32(%rsp)      
	                    call WriteFile
	                    addq $40, %rsp
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB4282:
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	.def standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
.LB4287:
	movq %rcx, %rsi
	movl %edx, %edi
	testl %edi, %edi
	jle .LB4293
.LB4294:
	cmpl $8192, %edi
	jge .LB4298
.LB4299:
	movl standard__io__console__out_len(%rip), %eax
	addl %edi, %eax
	cmpl $8192, %eax
	jg .LB4307
.LB4309:
	movl %edi, %eax
	shrl $2, %eax
	xorl %ecx, %ecx
.LB25103:
	testl %eax, %eax
	je .LB25105
.LB25104:
	movslq %ecx, %rdx
	leaq standard__io__console__out_buf(%rip), %rbx
	movzbl (%rsi,%rdx,1), %edx
	movl standard__io__console__out_len(%rip), %r8d
	leal (%r8,%rcx), %r9d
	movslq %r9d, %r9
	movb %dl, (%rbx,%r9,1)
	leal 1(%rcx), %edx
	leaq standard__io__console__out_buf(%rip), %rbx
	movslq %edx, %r9
	addl %r8d, %edx
	movzbl (%rsi,%r9,1), %r9d
	movslq %edx, %rdx
	movb %r9b, (%rbx,%rdx,1)
	leal 2(%rcx), %edx
	leaq standard__io__console__out_buf(%rip), %rbx
	movslq %edx, %r9
	addl %r8d, %edx
	movzbl (%rsi,%r9,1), %r9d
	movslq %edx, %rdx
	movb %r9b, (%rbx,%rdx,1)
	leal 3(%rcx), %edx
	movslq %edx, %r9
	addl %edx, %r8d
	leaq standard__io__console__out_buf(%rip), %rdx
	addl $4, %ecx
	movzbl (%rsi,%r9,1), %r9d
	movslq %r8d, %r8
	decl %eax
	movb %r9b, (%rdx,%r8,1)
	testl %eax, %eax
	jne .LB25104
	jmp .LB25105
.LB4307:
	callq standard__io__console__flush__0__ret_voidE1
	jmp .LB4309
.LB25105:
.LB4310:
	cmpl %edi, %ecx
	jge .LB4312
.LB4311:
	movslq %ecx, %rax
	leaq standard__io__console__out_buf(%rip), %r8
	movzbl (%rsi,%rax,1), %eax
	movl standard__io__console__out_len(%rip), %edx
	addl %ecx, %edx
	incl %ecx
	movslq %edx, %rdx
	movb %al, (%r8,%rdx,1)
	cmpl %edi, %ecx
	jl .LB4311
.LB4312:
	movl standard__io__console__out_len(%rip), %eax
	addl %edi, %eax
	movl %eax, standard__io__console__out_len(%rip)
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB4298:
	callq standard__io__console__flush__0__ret_voidE1
	movq $-11, %rcx        
	                    subq $32, %rsp
	                    call GetStdHandle
	                    addq $32, %rsp
	                    movq %rax, %rcx         
	                    movq %rsi, %rdx           
	                    movl %edi, %r8d           
	                    xorq %r9, %r9           
	                    subq $40, %rsp         
	                    movq %r9, 32(%rsp)      
	                    call WriteFile
	                    addq $40, %rsp
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB4293:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__io__console__win_print__2__byteE1_ptr1__intE1__ret_voidE1
	.def standard__io__console__win_print__2__byteE1_ptr1__intE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__io__console__win_print__2__byteE1_ptr1__intE1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB4267:
	movq %rcx, %rsi
	movl %edx, %edi
	movq $-11, %rcx        
	                    subq $32, %rsp
	                    call GetStdHandle
	                    addq $32, %rsp
	                    movq %rax, %rcx         
	                    movq %rsi, %rdx           
	                    movl %edi, %r8d           
	                    xorq %r9, %r9           
	                    subq $40, %rsp         
	                    movq %r9, 32(%rsp)      
	                    call WriteFile
	                    addq $40, %rsp
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__io__console__print__2__byteE1_arr__intE1__ret_voidE1
	.def standard__io__console__print__2__byteE1_arr__intE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__io__console__print__2__byteE1_arr__intE1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB4329:
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	leave
	ret
	.text
	.globl standard__io__console__print__1__byteE1_arr__ret_voidE1
	.def standard__io__console__print__1__byteE1_arr__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__io__console__print__1__byteE1_arr__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
.LB4334:
	movq %rcx, %rsi
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl standard__io__console__print__1__boolE1__ret_voidE1
	.def standard__io__console__print__1__boolE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__io__console__print__1__boolE1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rsi, -8(%rbp)
.LB4341:
	testb %cl, %cl
	jne .LB4344
.LB4345:
	movl $1936482630, -14(%rbp)
	movw $101, -10(%rbp)
	leaq -14(%rbp), %rsi
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	movq -8(%rbp), %rsi
	leave
	ret
.LB4344:
	movl $1702195796, -19(%rbp)
	movb $0, -15(%rbp)
	leaq -19(%rbp), %rsi
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl standard__io__console__print__1__charE1__ret_voidE1
	.def standard__io__console__print__1__charE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__io__console__print__1__charE1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
.LB4373:
	leaq -10(%rbp), %rsi
	movb %cl, -10(%rbp)
	movb $0, -9(%rbp)
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl standard__io__console__print__1__byteE1__ret_voidE1
	.def standard__io__console__print__1__byteE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__io__console__print__1__byteE1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
.LB4365:
	leaq -10(%rbp), %rsi
	movb %cl, -10(%rbp)
	movb $0, -9(%rbp)
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl standard__io__console__print__1__dataE1_sbits8__ret_voidE1
	.def standard__io__console__print__1__dataE1_sbits8__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__io__console__print__1__dataE1_sbits8__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
.LB4362:
	leaq -10(%rbp), %rsi
	movb %cl, -10(%rbp)
	movb $0, -9(%rbp)
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl standard__io__console__print__1__dataE1_sbits16__ret_voidE1
	.def standard__io__console__print__1__dataE1_sbits16__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__io__console__print__1__dataE1_sbits16__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rsi, -8(%rbp)
.LB4388:
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -29(%rbp)
	movl .LZERO+16(%rip), %r10d
	movl %r10d, -13(%rbp)
	movb .LZERO+20(%rip), %r10b
	movb %r10b, -9(%rbp)
	leaq -29(%rbp), %rdx
	movzwl %cx, %ecx
	callq standard__strings__i16str__2__dataE1_sbits16__byteE1_ptr1__ret_dataE1_sbits16
	leaq -29(%rbp), %rsi
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl standard__io__console__print__1__dataE1_ubits16__ret_voidE1
	.def standard__io__console__print__1__dataE1_ubits16__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__io__console__print__1__dataE1_ubits16__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rsi, -8(%rbp)
.LB4395:
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -29(%rbp)
	movl .LZERO+16(%rip), %r10d
	movl %r10d, -13(%rbp)
	movb .LZERO+20(%rip), %r10b
	movb %r10b, -9(%rbp)
	leaq -29(%rbp), %rdx
	movzwl %cx, %ecx
	callq standard__strings__u16str__2__dataE1_ubits16__byteE1_ptr1__ret_dataE1_ubits16
	leaq -29(%rbp), %rsi
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl standard__io__console__print__1__intE1__ret_voidE1
	.def standard__io__console__print__1__intE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__io__console__print__1__intE1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rsi, -8(%rbp)
.LB4381:
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -29(%rbp)
	movl .LZERO+16(%rip), %r10d
	movl %r10d, -13(%rbp)
	movb .LZERO+20(%rip), %r10b
	movb %r10b, -9(%rbp)
	leaq -29(%rbp), %rdx
	callq standard__strings__i32str__2__dataE1_sbits32__byteE1_ptr1__ret_dataE1_sbits32
	leaq -29(%rbp), %rsi
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl standard__io__console__print__1__dataE1_sbits32__ret_voidE1
	.def standard__io__console__print__1__dataE1_sbits32__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__io__console__print__1__dataE1_sbits32__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rsi, -8(%rbp)
.LB4402:
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -29(%rbp)
	movl .LZERO+16(%rip), %r10d
	movl %r10d, -13(%rbp)
	movb .LZERO+20(%rip), %r10b
	movb %r10b, -9(%rbp)
	leaq -29(%rbp), %rdx
	callq standard__strings__i32str__2__dataE1_sbits32__byteE1_ptr1__ret_dataE1_sbits32
	leaq -29(%rbp), %rsi
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl standard__io__console__print__1__dataE1_ubits32__ret_voidE1
	.def standard__io__console__print__1__dataE1_ubits32__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__io__console__print__1__dataE1_ubits32__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rsi, -8(%rbp)
.LB4409:
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -29(%rbp)
	movl .LZERO+16(%rip), %r10d
	movl %r10d, -13(%rbp)
	movb .LZERO+20(%rip), %r10b
	movb %r10b, -9(%rbp)
	leaq -29(%rbp), %rdx
	callq standard__strings__u32str__2__dataE1_ubits32__byteE1_ptr1__ret_dataE1_ubits32
	leaq -29(%rbp), %rsi
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl standard__io__console__print__1__dataE1_sbits64__ret_voidE1
	.def standard__io__console__print__1__dataE1_sbits64__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__io__console__print__1__dataE1_sbits64__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rsi, -8(%rbp)
.LB4416:
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -29(%rbp)
	movl .LZERO+16(%rip), %r10d
	movl %r10d, -13(%rbp)
	movb .LZERO+20(%rip), %r10b
	movb %r10b, -9(%rbp)
	leaq -29(%rbp), %rdx
	callq standard__strings__i64str__2__dataE1_sbits64__byteE1_ptr1__ret_dataE1_sbits64
	leaq -29(%rbp), %rsi
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl standard__io__console__print__1__dataE1_ubits64__ret_voidE1
	.def standard__io__console__print__1__dataE1_ubits64__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__io__console__print__1__dataE1_ubits64__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rsi, -8(%rbp)
.LB4423:
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -29(%rbp)
	movl .LZERO+16(%rip), %r10d
	movl %r10d, -13(%rbp)
	movb .LZERO+20(%rip), %r10b
	movb %r10b, -9(%rbp)
	leaq -29(%rbp), %rdx
	callq standard__strings__u64str__2__dataE1_ubits64__byteE1_ptr1__ret_dataE1_ubits64
	leaq -29(%rbp), %rsi
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl standard__io__console__print__1__longE1__ret_voidE1
	.def standard__io__console__print__1__longE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__io__console__print__1__longE1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rsi, -8(%rbp)
.LB4430:
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -29(%rbp)
	movl .LZERO+16(%rip), %r10d
	movl %r10d, -13(%rbp)
	movb .LZERO+20(%rip), %r10b
	movb %r10b, -9(%rbp)
	leaq -29(%rbp), %rdx
	callq standard__strings__i64str__2__dataE1_sbits64__byteE1_ptr1__ret_dataE1_sbits64
	leaq -29(%rbp), %rsi
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl standard__io__console__print__1__ulongE1__ret_voidE1
	.def standard__io__console__print__1__ulongE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__io__console__print__1__ulongE1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rsi, -8(%rbp)
.LB4433:
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -29(%rbp)
	movl .LZERO+16(%rip), %r10d
	movl %r10d, -13(%rbp)
	movb .LZERO+20(%rip), %r10b
	movb %r10b, -9(%rbp)
	leaq -29(%rbp), %rdx
	callq standard__strings__u64str__2__dataE1_ubits64__byteE1_ptr1__ret_dataE1_ubits64
	leaq -29(%rbp), %rsi
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl standard__io__console__print__1__floatE1__ret_voidE1
	.def standard__io__console__print__1__floatE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__io__console__print__1__floatE1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $304, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB4436:
	leaq -272(%rbp), %rax
	movq %rax, %rdi
	xorl %eax, %eax
	movl $256, %ecx
	rep stosb
	leaq -272(%rbp), %rdx
	movl $5, %r8d
	callq standard__strings__float2str__3__floatE1__byteE1_ptr1__dataE1_sbits32__ret_dataE1_sbits32
	leaq -272(%rbp), %rsi
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__io__console__print__2__floatE1__intE1__ret_voidE1
	.def standard__io__console__print__2__floatE1__intE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__io__console__print__2__floatE1__intE1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $304, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB4444:
	leaq -272(%rbp), %rax
	movq %rax, %rdi
	xorl %eax, %eax
	movl $256, %ecx
	rep stosb
	movl $5, %eax
	cmpl $5, %edx
	movl %edx, %r8d
	cmovg %eax, %r8d
	leaq -272(%rbp), %rdx
	callq standard__strings__float2str__3__floatE1__byteE1_ptr1__dataE1_sbits32__ret_dataE1_sbits32
	leaq -272(%rbp), %rsi
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__io__console__print__1__doubleE1__ret_voidE1
	.def standard__io__console__print__1__doubleE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__io__console__print__1__doubleE1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $304, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB4459:
	leaq -272(%rbp), %rax
	movq %rax, %rdi
	xorl %eax, %eax
	movl $256, %ecx
	rep stosb
	leaq -272(%rbp), %rdx
	movl $14, %r8d
	callq standard__strings__dbl2str__3__doubleE1__byteE1_ptr1__dataE1_sbits32__ret_dataE1_sbits32
	leaq -272(%rbp), %rsi
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__io__console__print__2__doubleE1__intE1__ret_voidE1
	.def standard__io__console__print__2__doubleE1__intE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__io__console__print__2__doubleE1__intE1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $304, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB4467:
	leaq -272(%rbp), %rax
	movq %rax, %rdi
	xorl %eax, %eax
	movl $256, %ecx
	rep stosb
	movl $14, %eax
	cmpl $14, %edx
	movl %edx, %r8d
	cmovg %eax, %r8d
	leaq -272(%rbp), %rdx
	callq standard__strings__dbl2str__3__doubleE1__byteE1_ptr1__dataE1_sbits32__ret_dataE1_sbits32
	leaq -272(%rbp), %rsi
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__io__console__out_raw__2__byteE1_ptr1__intE1__ret_voidE1
	.def standard__io__console__out_raw__2__byteE1_ptr1__intE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__io__console__out_raw__2__byteE1_ptr1__intE1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB4272:
	movq %rcx, %rsi
	movl %edx, %edi
	movq $-11, %rcx        
	                    subq $32, %rsp
	                    call GetStdHandle
	                    addq $32, %rsp
	                    movq %rax, %rcx         
	                    movq %rsi, %rdx           
	                    movl %edi, %r8d           
	                    xorq %r9, %r9           
	                    subq $40, %rsp         
	                    movq %r9, 32(%rsp)      
	                    call WriteFile
	                    addq $40, %rsp
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
	.text
	.globl main__0__ret_intE1
	.def main__0__ret_intE1;
	.scl 2;
	.type 32;
	.endef
main__0__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	movl $18064, %eax
	callq __chkstk
	subq %rax, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
	movq %r14, -48(%rbp)
	movq %r15, -56(%rbp)
.LB23936:
	leaq 304, %rax
	movq %rax, %rcx
	leaq -360(%rbp), %rax
	movq %rax, %rdi
	xorl %eax, %eax
	rep stosb
	leaq -463(%rbp), %rdx
	leaq -360(%rbp), %rsi
	movl $1700951363, -463(%rbp)
	movl $1920226080, -459(%rbp)
	movl $544437093, -455(%rbp)
	movl $794239021, -451(%rbp)
	movl $1713388115, -447(%rbp)
	movl $538999148, -443(%rbp)
	movl $977547073, -439(%rbp)
	movl $1920234272, -435(%rbp)
	movl $543516257, -431(%rbp)
	movl $1160728864, -427(%rbp)
	movl $1886724154, -423(%rbp)
	movl $544105519, -419(%rbp)
	movl $1920090400, -415(%rbp)
	movl $980645743, -411(%rbp)
	movl $1869573152, -407(%rbp)
	movl $1377837163, -403(%rbp)
	movl $1701978170, -399(%rbp)
	movl $544499059, -395(%rbp)
	movl $540694048, -391(%rbp)
	movl $1853453174, -387(%rbp)
	movl $1176510563, -383(%rbp)
	movl $1868963898, -379(%rbp)
	movl $1277173863, -375(%rbp)
	movl $1768693818, -371(%rbp)
	movl $1769236583, -367(%rbp)
	movw $26478, -363(%rbp)
	movb $0, -361(%rbp)
	movl WIN_W(%rip), %eax
	movl WIN_H(%rip), %ecx
	movl $100, %r8d
	movl $100, %r9d
	movq %rax, 32(%rsp)
	movq %rcx, 40(%rsp)
	movq %rsi, %rcx
	callq standard__system__windows__Window.__init__5__byteE1_ptr1__intE1__intE1__intE1__intE1__ret_thisE1
	movq -344(%rbp), %rcx
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -488(%rbp)
	movq .LZERO+16(%rip), %r10
	movq %r10, -472(%rbp)
	movq %rcx, -488(%rbp)
	callq OpenGL__setup_opengl__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -480(%rbp)
	movb $0, -472(%rbp)
	callq OpenGL__gl_load_extensions__0__ret_voidE1
	leaq -507(%rbp), %rcx
	movb $1, -472(%rbp)
	movl $1399613303, -507(%rbp)
	movl $1232101751, -503(%rbp)
	movl $1919251566, -499(%rbp)
	movl $1164730742, -495(%rbp)
	movw $21592, -491(%rbp)
	movb $0, -489(%rbp)
	callq wglGetProcAddress
	movq %rax, -17640(%rbp)
	movl GL_PROJECTION(%rip), %ecx
	callq glMatrixMode
	callq glLoadIdentity
	movl GL_MODELVIEW(%rip), %ecx
	callq glMatrixMode
	callq glLoadIdentity
	movl GL_DEPTH_TEST(%rip), %ecx
	callq glDisable
	movl GL_TEXTURE_2D(%rip), %ecx
	callq glEnable
	movl $0, -512(%rbp)
	leaq -512(%rbp), %rdx
	movl $1, %ecx
	callq glGenTextures
	movl GL_TEXTURE_2D(%rip), %ecx
	movl -512(%rbp), %edx
	callq glBindTexture
	movl GL_TEXTURE_2D(%rip), %ecx
	movl GL_TEXTURE_MIN_FILTER(%rip), %edx
	movl GL_NEAREST(%rip), %r8d
	callq glTexParameteri
	movl GL_TEXTURE_2D(%rip), %ecx
	movl GL_TEXTURE_MAG_FILTER(%rip), %edx
	movl GL_NEAREST(%rip), %r8d
	callq glTexParameteri
	movl GL_TEXTURE_2D(%rip), %ecx
	movl GL_TEXTURE_WRAP_S(%rip), %edx
	movl GL_CLAMP_TO_EDGE(%rip), %r8d
	callq glTexParameteri
	movl GL_TEXTURE_2D(%rip), %ecx
	movl GL_TEXTURE_WRAP_T(%rip), %edx
	movl GL_CLAMP_TO_EDGE(%rip), %r8d
	callq glTexParameteri
	movl WIN_W(%rip), %eax
	movl WIN_H(%rip), %ecx
	imull %ecx, %eax
	shll $3, %eax
	movslq %eax, %rsi
	movq %rsi, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, %rbx
	movq %rsi, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -17728(%rbp)
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -528(%rbp)
	leaq -528(%rbp), %rcx
	movl $4, %edx
	callq raycaster__rc_palette_init__2__RCTexturePaletteE1_ptr1__dataE1_sbits32__ret_voidE1
	leaq -528(%rbp), %rcx
	callq make_metal_texture__1__RCTexturePaletteE1_ptr1__ret_voidE1
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -592(%rbp)
	vmovdqu .LZERO+32(%rip), %ymm15
	vmovdqu %ymm15, -560(%rbp)
	vzeroupper
	leaq -592(%rbp), %rcx
	callq build_cube_mesh__1__R3DMeshE1_ptr1__ret_voidE1
	movl NUM_CUBES(%rip), %eax
	imull $96, %eax, %ecx
	shll $3, %eax
	movl %eax, %esi
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, %r12
	movq %rsi, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -17776(%rbp)
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -624(%rbp)
	vzeroupper
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm0
	movabsq $4603129179135383962, %r10
	movq %r10, %xmm1
	movabsq $4603129179135383962, %r10
	movq %r10, %xmm2
	callq raycaster__color64_pack__3__doubleE1__doubleE1__doubleE1__ret_dataE1_ubits64
	movabsq $4603129179135383962, %r10
	movq %r10, %xmm0
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm1
	movabsq $4603129179135383962, %r10
	movq %r10, %xmm2
	movq %rax, -616(%rbp)
	callq raycaster__color64_pack__3__doubleE1__doubleE1__doubleE1__ret_dataE1_ubits64
	movabsq $4603129179135383962, %r10
	movq %r10, %xmm0
	movabsq $4604930618986332160, %r10
	movq %r10, %xmm1
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm2
	movq %rax, -608(%rbp)
	callq raycaster__color64_pack__3__doubleE1__doubleE1__doubleE1__ret_dataE1_ubits64
	movq %rax, -600(%rbp)
	movabsq $-2401053092289724194, %rax
	movq %rax, -632(%rbp)
	xorl %esi, %esi
.LB24159:
	movl NUM_CUBES(%rip), %eax
	cmpl %eax, %esi
	jge .LB24161
.LB24160:
	movslq %esi, %rax
	imulq $92, %rax, %rax
	leaq (%r12,%rax,1), %rdi
	leaq -592(%rbp), %rdx
	movq %rdi, %rcx
	callq raycaster__r3d_inst_init__2__R3DMeshInstE1_ptr1__R3DMeshE1_ptr1__ret_voidE1
	xorps %xmm0, %xmm0
	movabsq $4630826316843712512, %r10
	movq %r10, %xmm1
	leaq -632(%rbp), %rcx
	movabsq $4630826316843712512, %r10
	movq %r10, %xmm2
	subsd %xmm1, %xmm0
	movaps %xmm0, %xmm1
	callq lcg_range__3__dataE1_ptr1_ubits64__doubleE1__doubleE1__ret_doubleE1
	movabsq $4624633867356078080, %r10
	movq %r10, %xmm1
	leaq -632(%rbp), %rcx
	movabsq $4624633867356078080, %r10
	movq %r10, %xmm2
	movsd %xmm0, 8(%rdi)
	xorps %xmm0, %xmm0
	subsd %xmm1, %xmm0
	movaps %xmm0, %xmm1
	callq lcg_range__3__dataE1_ptr1_ubits64__doubleE1__doubleE1__ret_doubleE1
	movabsq $4630826316843712512, %r10
	movq %r10, %xmm1
	leaq -632(%rbp), %rcx
	movabsq $4630826316843712512, %r10
	movq %r10, %xmm2
	movsd %xmm0, 16(%rdi)
	xorps %xmm0, %xmm0
	subsd %xmm1, %xmm0
	movaps %xmm0, %xmm1
	callq lcg_range__3__dataE1_ptr1_ubits64__doubleE1__doubleE1__ret_doubleE1
	leaq -632(%rbp), %rcx
	movabsq $4612811918334230528, %r10
	movq %r10, %xmm2
	movsd %xmm0, 24(%rdi)
	movabsq $4600877379321698714, %r10
	movq %r10, %xmm0
	movaps %xmm0, %xmm1
	callq lcg_range__3__dataE1_ptr1_ubits64__doubleE1__doubleE1__ret_doubleE1
	leaq -632(%rbp), %rcx
	movabsq $4618760256171332849, %r10
	movq %r10, %xmm2
	movsd %xmm0, 56(%rdi)
	movsd %xmm0, 64(%rdi)
	movsd %xmm0, 72(%rdi)
	xorps %xmm0, %xmm0
	movaps %xmm0, %xmm1
	callq lcg_range__3__dataE1_ptr1_ubits64__doubleE1__doubleE1__ret_doubleE1
	leaq -632(%rbp), %rcx
	movabsq $4618760256171332849, %r10
	movq %r10, %xmm2
	movsd %xmm0, 32(%rdi)
	xorps %xmm0, %xmm0
	movaps %xmm0, %xmm1
	callq lcg_range__3__dataE1_ptr1_ubits64__doubleE1__doubleE1__ret_doubleE1
	leaq -632(%rbp), %rcx
	movabsq $4618760256171332849, %r10
	movq %r10, %xmm2
	movsd %xmm0, 40(%rdi)
	xorps %xmm0, %xmm0
	movaps %xmm0, %xmm1
	callq lcg_range__3__dataE1_ptr1_ubits64__doubleE1__doubleE1__ret_doubleE1
	movl %esi, %eax
	sarl $31, %eax
	movsd %xmm0, 48(%rdi)
	shrl $30, %eax
	addl %esi, %eax
	andl $-4, %eax
	negl %eax
	addl %esi, %eax
	movslq %eax, %rax
	movq -624(%rbp,%rax,8), %rax
	movq %rax, 84(%rdi)
	movl $0, 80(%rdi)
	movq -17776(%rbp), %rcx
	movslq %esi, %rax
	incl %esi
	movq %rdi, (%rcx,%rax,8)
	jmp .LB24159
.LB24161:
	movabsq $-3819410105021108211, %rax
	movq %rax, -640(%rbp)
	movl $3960, %ecx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	xorps %xmm0, %xmm0
	movabsq $1058642330, %r10
	movq %r10, %xmm1
	movabsq $1061997773, %r10
	movq %r10, %xmm2
	movabsq $1053609165, %r10
	movq %r10, %xmm3
	movabsq $1062836634, %r10
	movq %r10, %xmm4
	movabsq $1050253722, %r10
	movq %r10, %xmm5
	movq %rax, -17488(%rbp)
	movq -17488(%rbp), %rcx
	subss %xmm1, %xmm0
	xorps %xmm1, %xmm1
	cvtss2sd %xmm4, %xmm4
	subss %xmm2, %xmm1
	xorps %xmm2, %xmm2
	cvtss2sd %xmm0, %xmm0
	subss %xmm3, %xmm2
	cvtss2sd %xmm1, %xmm3
	cvtss2sd %xmm2, %xmm1
	movabsq $1064514355, %r10
	movq %r10, %xmm2
	cvtss2sd %xmm2, %xmm2
	movsd %xmm1, -17960(%rbp)
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	movsd %xmm5, -17496(%rbp)
	cvtss2sd %xmm5, %xmm5
	cvtss2sd %xmm1, %xmm1
	movsd %xmm5, -17504(%rbp)
	movsd %xmm1, 32(%rsp)
	movsd %xmm2, 40(%rsp)
	movsd %xmm4, 48(%rsp)
	movsd %xmm5, 56(%rsp)
	movaps %xmm0, %xmm1
	movsd -17960(%rbp), %xmm0
	movaps %xmm3, %xmm2
	movaps %xmm0, %xmm3
	callq raycaster__r3d_light_directional__8__R3DLightE1_ptr1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__ret_voidE1
	movq -17488(%rbp), %rax
	leaq 120(%rax), %rax
	movl $1, %esi
	movq %rax, %rdi
.LB24269:
	cmpq $33, %rsi
	jge .LB24271
.LB24270:
	xorps %xmm0, %xmm0
	movabsq $4630826316843712512, %r10
	movq %r10, %xmm1
	leaq -640(%rbp), %rcx
	movabsq $4630826316843712512, %r10
	movq %r10, %xmm2
	subsd %xmm1, %xmm0
	movaps %xmm0, %xmm1
	callq lcg_range__3__dataE1_ptr1_ubits64__doubleE1__doubleE1__ret_doubleE1
	movabsq $4624633867356078080, %r10
	movq %r10, %xmm1
	leaq -640(%rbp), %rcx
	movabsq $4624633867356078080, %r10
	movq %r10, %xmm2
	movsd %xmm0, -17920(%rbp)
	xorps %xmm0, %xmm0
	subsd %xmm1, %xmm0
	movaps %xmm0, %xmm1
	callq lcg_range__3__dataE1_ptr1_ubits64__doubleE1__doubleE1__ret_doubleE1
	movabsq $4630826316843712512, %r10
	movq %r10, %xmm1
	leaq -640(%rbp), %rcx
	movabsq $4630826316843712512, %r10
	movq %r10, %xmm2
	movsd %xmm0, -17928(%rbp)
	xorps %xmm0, %xmm0
	subsd %xmm1, %xmm0
	movaps %xmm0, %xmm1
	callq lcg_range__3__dataE1_ptr1_ubits64__doubleE1__doubleE1__ret_doubleE1
	leaq -640(%rbp), %rcx
	movsd %xmm0, -17936(%rbp)
	callq lcg_next__1__dataE1_ptr1_ubits64__ret_intE1
	movslq %eax, %rcx
	movabsq $2863311531, %rdx
	imulq %rcx, %rdx
	sarq $34, %rdx
	shrq $63, %rcx
	addl %ecx, %edx
	imull $6, %edx, %edx
	subl %edx, %eax
	movq %rax, %r11
	cmpq $4, %r11
	ja .LB24290
	leaq .LJT25109(%rip), %r10
	jmpq *(%r10,%r11,8)
.LB24289:
	movabsq $4603579539098121011, %r10
	movq %r10, %xmm0
	movabsq $4596373779694328218, %r10
	movq %r10, %xmm1
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm2
.LB24284:
	movabsq $1035489772, %r10
	movq %r10, %xmm5
	movabsq $1063675494, %r10
	movq %r10, %xmm3
	movabsq $1065353216, %r10
	movq %r10, %xmm4
	movq %rdi, %rcx
	cvtss2sd %xmm3, %xmm3
	cvtss2sd %xmm5, %xmm5
	cvtss2sd %xmm4, %xmm4
	movsd %xmm5, -17976(%rbp)
	movabsq $1023611503, %r10
	movq %r10, %xmm5
	movsd %xmm5, -17944(%rbp)
	cvtss2sd %xmm5, %xmm5
	movsd %xmm5, -17952(%rbp)
	movsd %xmm0, 32(%rsp)
	movsd %xmm1, 40(%rsp)
	movsd %xmm2, 48(%rsp)
	movsd %xmm3, 56(%rsp)
	movsd %xmm4, 64(%rsp)
	movsd -17976(%rbp), %xmm0
	movsd %xmm0, 72(%rsp)
	movsd %xmm5, 80(%rsp)
	movsd -17920(%rbp), %xmm0
	movaps %xmm0, %xmm1
	movsd -17928(%rbp), %xmm0
	movaps %xmm0, %xmm2
	movsd -17936(%rbp), %xmm0
	movaps %xmm0, %xmm3
	callq raycaster__r3d_light_point__11__R3DLightE1_ptr1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__ret_voidE1
	incq %rsi
	leaq 120(%rdi), %rdi
	cmpq $33, %rsi
	jl .LB24270
.LB24271:
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -656(%rbp)
	movabsq $4585925428558828667, %r10
	movq %r10, %xmm0
	movabsq $4585925428558828667, %r10
	movq %r10, %xmm1
	movabsq $4587366580439587226, %r10
	movq %r10, %xmm2
	callq raycaster__color64_pack__3__doubleE1__doubleE1__doubleE1__ret_dataE1_ubits64
	movabsq $4594572339843380019, %r10
	movq %r10, %xmm0
	movabsq $4594572339843380019, %r10
	movq %r10, %xmm1
	movabsq $4594572339843380019, %r10
	movq %r10, %xmm2
	movq %rax, -656(%rbp)
	callq raycaster__color64_pack__3__doubleE1__doubleE1__doubleE1__ret_dataE1_ubits64
	leaq .LZERO(%rip), %rsi
	leaq -1192(%rbp), %rdi
	movl $536, %ecx
	movq %rax, -648(%rbp)
	rep movsb
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -1256(%rbp)
	vmovdqu .LZERO+32(%rip), %ymm15
	vmovdqu %ymm15, -1224(%rbp)
	vzeroupper
	movl WIN_W(%rip), %r8d
	movl WIN_H(%rip), %r9d
	leaq -1192(%rbp), %rcx
	movabsq $4634626229029306368, %r10
	movq %r10, %xmm0
	movabsq $4587366580439587226, %r10
	movq %r10, %xmm1
	movabsq $4641240890982006784, %r10
	movq %r10, %xmm2
	movsd %xmm1, 32(%rsp)
	movsd %xmm2, 40(%rsp)
	movaps %xmm0, %xmm1
	callq raycaster__r3d_camera_init__6__R3DCameraE1_ptr1__doubleE1__dataE1_sbits32__dataE1_sbits32__doubleE1__doubleE1__ret_voidE1
	leaq -1256(%rbp), %rcx
	xorps %xmm0, %xmm0
	xorps %xmm2, %xmm2
	xorps %xmm3, %xmm3
	movaps %xmm0, %xmm1
	callq raycaster__r3d_player_init__4__R3DPlayerE1_ptr1__doubleE1__doubleE1__doubleE1__ret_voidE1
	xorps %xmm0, %xmm0
	leaq .LZERO(%rip), %rsi
	leaq -17064(%rbp), %rdi
	movl $15808, %ecx
	movsd %xmm0, -1232(%rbp)
	xorps %xmm0, %xmm0
	movsd %xmm0, -1224(%rbp)
	rep movsb
	leaq -17064(%rbp), %rcx
	leaq -1192(%rbp), %rdx
	leaq -1256(%rbp), %r8
	leaq -528(%rbp), %r9
	leaq -656(%rbp), %rax
	movq %rax, 32(%rsp)
	callq raycaster__r3d_scene_init__5__R3DSceneE1_ptr1__R3DCameraE1_ptr1__R3DPlayerE1_ptr1__RCTexturePaletteE1_ptr1__RCSkyE1_ptr1__ret_voidE1
	leaq -17064(%rbp), %rcx
	movl NUM_CUBES(%rip), %r8d
	movq -17776(%rbp), %rdx
	callq raycaster__r3d_scene_set_insts__3__R3DSceneE1_ptr1__R3DMeshInstE1_ptr2__dataE1_sbits32__ret_voidE1
	movq -17488(%rbp), %rdx
	leaq -17064(%rbp), %rcx
	movl $33, %r8d
	callq raycaster__r3d_scene_set_lights__3__R3DSceneE1_ptr1__R3DLightE1_ptr1__dataE1_sbits32__ret_voidE1
	leaq -17064(%rbp), %rcx
	movabsq $4566758108544739836, %r10
	movq %r10, %xmm0
	movabsq $4566758108544739836, %r10
	movq %r10, %xmm2
	movabsq $4571261708172110332, %r10
	movq %r10, %xmm3
	movaps %xmm0, %xmm1
	callq raycaster__r3d_scene_set_ambient__4__R3DSceneE1_ptr1__doubleE1__doubleE1__doubleE1__ret_voidE1
	leaq -17064(%rbp), %rcx
	xorps %xmm0, %xmm0
	xorps %xmm2, %xmm2
	movabsq $4594572339843380019, %r10
	movq %r10, %xmm3
	movabsq $4594572339843380019, %r10
	movq %r10, %xmm1
	movabsq $4594572339843380019, %r10
	movq %r10, %xmm4
	movsd %xmm1, 32(%rsp)
	movsd %xmm4, 40(%rsp)
	movaps %xmm0, %xmm1
	callq raycaster__r3d_scene_set_fog__6__R3DSceneE1_ptr1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__ret_voidE1
	xorps %xmm0, %xmm0
	movabsq $4617315517961601024, %r10
	movq %r10, %xmm1
	leaq -17064(%rbp), %rcx
	movabsq $4600877379321698714, %r10
	movq %r10, %xmm2
	movabsq $4591870180066957722, %r10
	movq %r10, %xmm3
	movabsq $4591870180066957722, %r10
	movq %r10, %xmm4
	movabsq $4593311331947716280, %r10
	movq %r10, %xmm5
	subsd %xmm1, %xmm0
	movabsq $4578071150808694522, %r10
	movq %r10, %xmm1
	movsd %xmm3, 32(%rsp)
	movsd %xmm4, 40(%rsp)
	movsd %xmm5, 48(%rsp)
	movaps %xmm0, %xmm3
	callq raycaster__r3d_scene_set_vol_fog__7__R3DSceneE1_ptr1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__ret_voidE1
	movl $112, -16960(%rbp)
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -17080(%rbp)
	leaq .LZERO(%rip), %rsi
	leaq -17320(%rbp), %rdi
	movl $240, %ecx
	rep movsb
	leaq -17480(%rbp), %rax
	movq %rax, %rdi
	xorl %eax, %eax
	movl $160, %ecx
	rep stosb
	callq GetTickCount
	movq %rax, -17736(%rbp)
	movq -17736(%rbp), %rsi
	movabsq $0, %r10
	movq %r10, -17512(%rbp)
	movabsq $0, %r10
	movq %r10, -17520(%rbp)
	movq $0, -17528(%rbp)
	movq $0, -17536(%rbp)
	movq $0, -17544(%rbp)
	movq $0, -17552(%rbp)
	movq $0, -17560(%rbp)
	movq $0, -17568(%rbp)
	movq $0, -17576(%rbp)
	movq $0, -17584(%rbp)
	movq $0, -17592(%rbp)
	movabsq $0, %r10
	movq %r10, -17600(%rbp)
	movabsq $0, %r10
	movq %r10, -17608(%rbp)
	movq $0, -17616(%rbp)
	movq $1, -17624(%rbp)
	movq $1, -17632(%rbp)
.LB24365:
	leaq -360(%rbp), %rcx
	callq standard__system__windows__Window.process_messages__0__ret_boolE1
	testb %al, %al
	je .LB24367
.LB24366:
	callq GetTickCount
	movl %eax, %edi
	movabsq $4652007308841189376, %r10
	movq %r10, %xmm1
	movl %edi, %eax
	subl %esi, %eax
	movslq %eax, %rax
	xorps %xmm0, %xmm0
	cvtsi2sdq %rax, %xmm0
	divsd %xmm1, %xmm0
	movsd %xmm0, -17648(%rbp)
	movq -17552(%rbp), %rax
	movsd -17600(%rbp), %xmm1
	leal 1(%rax), %esi
	addsd %xmm1, %xmm0
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm1
	ucomisd %xmm1, %xmm0
	jae .LB24383
.LB24384:
	movq -17560(%rbp), %r10
	movq %r10, -17656(%rbp)
	movq -17568(%rbp), %r10
	movq %r10, -17664(%rbp)
	movq -17576(%rbp), %r10
	movq %r10, -17672(%rbp)
	movq -17584(%rbp), %r10
	movq %r10, -17680(%rbp)
	movq -17592(%rbp), %r10
	movq %r10, -17688(%rbp)
	movsd %xmm0, -17696(%rbp)
	movq -17608(%rbp), %r10
	movq %r10, -17704(%rbp)
	movq -17616(%rbp), %r10
	movq %r10, -17712(%rbp)
.LB24385:
	movabsq $4591870180066957722, %r10
	movq %r10, %xmm0
	movsd -17648(%rbp), %xmm1
	ucomisd %xmm0, %xmm1
	ja .LB24448
.LB24449:
	movq -17648(%rbp), %r10
	movq %r10, -17784(%rbp)
.LB24450:
	movl standard__system__windows__VK_LEFT(%rip), %ecx
	callq GetAsyncKeyState
	movzwl %ax, %eax
	movq %rax, -17872(%rbp)
	movl standard__system__windows__VK_RIGHT(%rip), %ecx
	callq GetAsyncKeyState
	movzwl %ax, %eax
	movq %rax, -17856(%rbp)
	movl standard__system__windows__VK_UP(%rip), %ecx
	callq GetAsyncKeyState
	movzwl %ax, %eax
	movq %rax, -17864(%rbp)
	movl standard__system__windows__VK_DOWN(%rip), %ecx
	callq GetAsyncKeyState
	movzwl %ax, %eax
	movq %rax, -17792(%rbp)
	movl VK_W(%rip), %ecx
	callq GetAsyncKeyState
	movzwl %ax, %eax
	movq %rax, -17800(%rbp)
	movl VK_S(%rip), %ecx
	callq GetAsyncKeyState
	movzwl %ax, %eax
	movq %rax, -17808(%rbp)
	movl VK_A(%rip), %ecx
	callq GetAsyncKeyState
	movzwl %ax, %eax
	movq %rax, -17816(%rbp)
	movl VK_D(%rip), %ecx
	callq GetAsyncKeyState
	movzwl %ax, %eax
	movq %rax, -17824(%rbp)
	movl VK_Q(%rip), %ecx
	callq GetAsyncKeyState
	movzwl %ax, %eax
	movq %rax, -17832(%rbp)
	movl VK_E(%rip), %ecx
	callq GetAsyncKeyState
	movzwl %ax, %eax
	movq %rax, -17840(%rbp)
	movl VK_R(%rip), %ecx
	callq GetAsyncKeyState
	movzwl %ax, %eax
	movq %rax, -17848(%rbp)
	movl VK_V(%rip), %ecx
	callq GetAsyncKeyState
	movzwl %ax, %r13d
	movl VK_F(%rip), %ecx
	callq GetAsyncKeyState
	movzwl %ax, %r14d
	movl VK_L(%rip), %ecx
	callq GetAsyncKeyState
	movzwl %ax, %r15d
	movq -17872(%rbp), %rax
	movzwl %ax, %eax
	andl $32768, %eax
	jne .LB24483
.LB24485:
	movq -17856(%rbp), %rax
	movzwl %ax, %eax
	andl $32768, %eax
	jne .LB24493
.LB24495:
	movq -17864(%rbp), %rax
	movzwl %ax, %eax
	andl $32768, %eax
	jne .LB24502
.LB24504:
	movq -17792(%rbp), %rax
	movzwl %ax, %eax
	andl $32768, %eax
	jne .LB24511
.LB24513:
	movq -17800(%rbp), %rax
	movzwl %ax, %eax
	andl $32768, %eax
	jne .LB24521
.LB24523:
	movq -17808(%rbp), %rax
	movzwl %ax, %eax
	andl $32768, %eax
	jne .LB24530
.LB24532:
	movq -17816(%rbp), %rax
	movzwl %ax, %eax
	andl $32768, %eax
	jne .LB24540
.LB24542:
	movq -17824(%rbp), %rax
	movzwl %ax, %eax
	andl $32768, %eax
	jne .LB24550
.LB24552:
	movq -17832(%rbp), %rax
	movzwl %ax, %eax
	andl $32768, %eax
	jne .LB24559
.LB24561:
	movq -17840(%rbp), %rax
	movzwl %ax, %eax
	andl $32768, %eax
	jne .LB24568
.LB24570:
	movq -17848(%rbp), %rax
	movzwl %ax, %eax
	andl $32768, %eax
	jne .LB24578
.LB24580:
	movzwl %r13w, %eax
	andl $32768, %eax
	je .LB24598
.LB24590:
	movq -17528(%rbp), %rax
	movzwl %ax, %eax
	andl $32768, %eax
	je .LB24597
.LB24598:
	movq -17624(%rbp), %r10
	movq %r10, -17880(%rbp)
.LB24599:
	movzwl %r14w, %eax
	andl $32768, %eax
	je .LB24622
.LB24613:
	movq -17536(%rbp), %rax
	movzwl %ax, %eax
	andl $32768, %eax
	je .LB24620
.LB24622:
	movzwl %r15w, %eax
	andl $32768, %eax
	je .LB24655
.LB24647:
	movq -17544(%rbp), %rax
	movzwl %ax, %eax
	andl $32768, %eax
	je .LB24654
.LB24655:
	movq -17632(%rbp), %r10
	movq %r10, -17896(%rbp)
.LB24656:
	movq -17736(%rbp), %rax
	negl %eax
	addl %edi, %eax
	movslq %eax, %rax
	xorps %xmm0, %xmm0
	cvtsi2sdq %rax, %xmm0
	movabsq $4652007308841189376, %r10
	movq %r10, %xmm1
	divsd %xmm1, %xmm0
	movq -17512(%rbp), %r10
	movq %r10, -17904(%rbp)
	movq -17520(%rbp), %r10
	movq %r10, -17912(%rbp)
	xorl %eax, %eax
.LB24671:
	movl NUM_CUBES(%rip), %ecx
	cmpl %ecx, %eax
	jge .LB24673
.LB24672:
	movslq %eax, %rcx
	movabsq $4042322161, %rdx
	movabsq $4581421828931458171, %r10
	movq %r10, %xmm2
	movabsq $4599075939470750515, %r10
	movq %r10, %xmm3
	imulq %rcx, %rdx
	movabsq $4594572339843380019, %r10
	movq %r10, %xmm4
	sarq $36, %rdx
	shrq $63, %rcx
	addl %ecx, %edx
	imull $17, %edx, %edx
	movl %eax, %ecx
	subl %edx, %ecx
	movabsq $3123612579, %rdx
	movslq %ecx, %rcx
	xorps %xmm1, %xmm1
	cvtsi2sdq %rcx, %xmm1
	movslq %eax, %rcx
	imulq %rcx, %rdx
	sarq $35, %rdx
	shrq $63, %rcx
	vfmadd132sd %xmm2, %xmm3, %xmm1
	addl %ecx, %edx
	movabsq $4580845368179154747, %r10
	movq %r10, %xmm3
	imull $11, %edx, %edx
	movl %eax, %ecx
	subl %edx, %ecx
	movslq %ecx, %rcx
	xorps %xmm2, %xmm2
	cvtsi2sdq %rcx, %xmm2
	movslq %eax, %rcx
	vfmadd132sd %xmm3, %xmm4, %xmm2
	xorps %xmm3, %xmm3
	cvtsi2sdq %rcx, %xmm3
	movabsq $4600336947366414254, %r10
	movq %r10, %xmm4
	movslq %eax, %rcx
	imulq $92, %rcx, %rcx
	incl %eax
	leaq (%r12,%rcx,1), %rcx
	mulsd %xmm3, %xmm4
	vfmadd231sd %xmm0, %xmm1, %xmm4
	movsd %xmm4, 40(%rcx)
	movabsq $4596734067664517857, %r10
	movq %r10, %xmm4
	mulsd %xmm4, %xmm3
	vfmadd231sd %xmm0, %xmm2, %xmm3
	movsd %xmm3, 32(%rcx)
	movsd %xmm1, -17904(%rbp)
	movsd %xmm2, -17912(%rbp)
	jmp .LB24671
.LB24367:
	leaq -592(%rbp), %rcx
	callq raycaster__r3d_mesh_free__1__R3DMeshE1_ptr1__ret_voidE1
	leaq -528(%rbp), %rcx
	callq raycaster__rc_palette_free__1__RCTexturePaletteE1_ptr1__ret_voidE1
	movq %r12, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movq -17776(%rbp), %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movq -17488(%rbp), %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movq %rbx, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movq -17728(%rbp), %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	leaq -512(%rbp), %rdx
	movl $1, %ecx
	callq glDeleteTextures
	leaq -488(%rbp), %rcx
	callq OpenGL__GLContext.__exit__0__ret_voidE1
	leaq -360(%rbp), %rcx
	callq standard__system__windows__Window.__exit__0__ret_voidE1
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB24383:
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm1
	subsd %xmm1, %xmm0
	movsd %xmm0, -17720(%rbp)
	movq -17576(%rbp), %rax
	movslq %eax, %rcx
	incl %eax
	movl %esi, -17320(%rbp,%rcx,4)
	xorl %ecx, %ecx
	cmpl $60, %eax
	cmovge %ecx, %eax
	movq %rax, -17968(%rbp)
	movq -17568(%rbp), %rax
	leal 1(%rax), %ecx
	cmpl $60, %eax
	movl %eax, %r13d
	cmovl %ecx, %r13d
	xorl %eax, %eax
	testl %r13d, %r13d
	cmovg %r13d, %eax
	shrl $2, %eax
	xorl %ecx, %ecx
	xorl %edx, %edx
	xorl %r8d, %r8d
	xorl %r9d, %r9d
	movq $0, -17744(%rbp)
.LB25106:
	testl %eax, %eax
	je .LB25108
.LB25107:
	movslq %ecx, %r14
	addl -17320(%rbp,%r14,4), %edx
	leal 1(%rcx), %r14d
	movslq %r14d, %r14
	addl -17320(%rbp,%r14,4), %r8d
	leal 2(%rcx), %r14d
	movslq %r14d, %r14
	addl -17320(%rbp,%r14,4), %r9d
	movq -17744(%rbp), %r15
	leal 3(%rcx), %r14d
	movslq %r14d, %r14
	addl -17320(%rbp,%r14,4), %r15d
	addl $4, %ecx
	decl %eax
	movq %r15, -17744(%rbp)
	testl %eax, %eax
	jne .LB25107
.LB25108:
	addl %r8d, %edx
	movq -17744(%rbp), %rax
	addl %eax, %r9d
	addl %r9d, %edx
	movq %rcx, -17752(%rbp)
	movq %rdx, -17760(%rbp)
.LB24406:
	movq -17752(%rbp), %rax
	cmpl %r13d, %eax
	jge .LB24408
.LB24407:
	movq -17752(%rbp), %rax
	movq -17760(%rbp), %rdx
	movslq %eax, %rcx
	addl -17320(%rbp,%rcx,4), %edx
	incl %eax
	movq %rax, -17752(%rbp)
	movq %rdx, -17760(%rbp)
	jmp .LB24406
.LB24408:
	testl %r13d, %r13d
	jg .LB24421
.LB24422:
	movabsq $0, %r10
	movq %r10, -17768(%rbp)
.LB24423:
	movsd -11576(%rbp), %xmm0
	movsd -11552(%rbp), %xmm1
	movsd -11544(%rbp), %xmm2
	leaq -17480(%rbp), %rcx
	movq %rsi, %rdx
	movsd %xmm0, 32(%rsp)
	movsd %xmm1, 40(%rsp)
	movsd %xmm2, 48(%rsp)
	movsd -17768(%rbp), %xmm0
	movq -17624(%rbp), %r9
	movaps %xmm0, %xmm2
	callq build_fps_title__7__byteE1_ptr1__intE1__doubleE1__intE1__doubleE1__doubleE1__doubleE1__ret_voidE1
	leaq -17480(%rbp), %r14
	movq -360(%rbp), %rcx
	movq %r14, %rdx
	callq SetWindowTextA
	movq %rsi, -17656(%rbp)
	movq %r13, -17664(%rbp)
	movq -17968(%rbp), %r10
	movq %r10, -17672(%rbp)
	movq -17752(%rbp), %r10
	movq %r10, -17680(%rbp)
	movq -17760(%rbp), %r10
	movq %r10, -17688(%rbp)
	movq -17720(%rbp), %r10
	movq %r10, -17696(%rbp)
	movq -17768(%rbp), %r10
	movq %r10, -17704(%rbp)
	movq %r14, -17712(%rbp)
	xorl %esi, %esi
	jmp .LB24385
.LB24421:
	movq -17760(%rbp), %rax
	movslq %eax, %rax
	xorps %xmm0, %xmm0
	cvtsi2sdq %rax, %xmm0
	movslq %r13d, %rax
	xorps %xmm1, %xmm1
	cvtsi2sdq %rax, %xmm1
	divsd %xmm1, %xmm0
	movsd %xmm0, -17768(%rbp)
	jmp .LB24423
.LB24448:
	movabsq $4591870180066957722, %r10
	movq %r10, -17784(%rbp)
	jmp .LB24450
.LB24483:
	movsd -17784(%rbp), %xmm1
	xorps %xmm0, %xmm0
	leaq -1256(%rbp), %rcx
	xorps %xmm2, %xmm2
	subsd %xmm1, %xmm0
	movabsq $4609434218613702656, %r10
	movq %r10, %xmm1
	mulsd %xmm1, %xmm0
	movaps %xmm0, %xmm1
	callq raycaster__r3d_player_turn__3__R3DPlayerE1_ptr1__doubleE1__doubleE1__ret_voidE1
	jmp .LB24485
.LB24493:
	movsd -17784(%rbp), %xmm1
	movabsq $4609434218613702656, %r10
	movq %r10, %xmm0
	leaq -1256(%rbp), %rcx
	xorps %xmm2, %xmm2
	mulsd %xmm1, %xmm0
	movaps %xmm0, %xmm1
	callq raycaster__r3d_player_turn__3__R3DPlayerE1_ptr1__doubleE1__doubleE1__ret_voidE1
	jmp .LB24495
.LB24502:
	movsd -17784(%rbp), %xmm1
	movabsq $4608083138725491507, %r10
	movq %r10, %xmm0
	leaq -1256(%rbp), %rcx
	mulsd %xmm1, %xmm0
	xorps %xmm1, %xmm1
	movaps %xmm0, %xmm2
	callq raycaster__r3d_player_turn__3__R3DPlayerE1_ptr1__doubleE1__doubleE1__ret_voidE1
	jmp .LB24504
.LB24511:
	movsd -17784(%rbp), %xmm1
	xorps %xmm0, %xmm0
	leaq -1256(%rbp), %rcx
	subsd %xmm1, %xmm0
	movabsq $4608083138725491507, %r10
	movq %r10, %xmm1
	mulsd %xmm1, %xmm0
	xorps %xmm1, %xmm1
	movaps %xmm0, %xmm2
	callq raycaster__r3d_player_turn__3__R3DPlayerE1_ptr1__doubleE1__doubleE1__ret_voidE1
	jmp .LB24513
.LB24521:
	movsd -17784(%rbp), %xmm1
	movabsq $4620693217682128896, %r10
	movq %r10, %xmm0
	leaq -1256(%rbp), %rcx
	xorps %xmm3, %xmm3
	mulsd %xmm1, %xmm0
	xorps %xmm1, %xmm1
	movaps %xmm0, %xmm2
	callq raycaster__r3d_player_move__4__R3DPlayerE1_ptr1__doubleE1__doubleE1__doubleE1__ret_voidE1
	jmp .LB24523
.LB24530:
	movsd -17784(%rbp), %xmm1
	xorps %xmm0, %xmm0
	leaq -1256(%rbp), %rcx
	xorps %xmm3, %xmm3
	subsd %xmm1, %xmm0
	movabsq $4620693217682128896, %r10
	movq %r10, %xmm1
	mulsd %xmm1, %xmm0
	xorps %xmm1, %xmm1
	movaps %xmm0, %xmm2
	callq raycaster__r3d_player_move__4__R3DPlayerE1_ptr1__doubleE1__doubleE1__doubleE1__ret_voidE1
	jmp .LB24532
.LB24540:
	movsd -17784(%rbp), %xmm1
	xorps %xmm0, %xmm0
	leaq -1256(%rbp), %rcx
	xorps %xmm2, %xmm2
	xorps %xmm3, %xmm3
	subsd %xmm1, %xmm0
	movabsq $4620693217682128896, %r10
	movq %r10, %xmm1
	mulsd %xmm1, %xmm0
	movaps %xmm0, %xmm1
	callq raycaster__r3d_player_move__4__R3DPlayerE1_ptr1__doubleE1__doubleE1__doubleE1__ret_voidE1
	jmp .LB24542
.LB24550:
	movsd -17784(%rbp), %xmm1
	movabsq $4620693217682128896, %r10
	movq %r10, %xmm0
	leaq -1256(%rbp), %rcx
	xorps %xmm2, %xmm2
	xorps %xmm3, %xmm3
	mulsd %xmm1, %xmm0
	movaps %xmm0, %xmm1
	callq raycaster__r3d_player_move__4__R3DPlayerE1_ptr1__doubleE1__doubleE1__doubleE1__ret_voidE1
	jmp .LB24552
.LB24559:
	movsd -17784(%rbp), %xmm1
	movabsq $4620693217682128896, %r10
	movq %r10, %xmm0
	leaq -1256(%rbp), %rcx
	xorps %xmm2, %xmm2
	mulsd %xmm1, %xmm0
	xorps %xmm1, %xmm1
	movaps %xmm0, %xmm3
	callq raycaster__r3d_player_move__4__R3DPlayerE1_ptr1__doubleE1__doubleE1__doubleE1__ret_voidE1
	jmp .LB24561
.LB24568:
	movsd -17784(%rbp), %xmm1
	xorps %xmm0, %xmm0
	leaq -1256(%rbp), %rcx
	xorps %xmm2, %xmm2
	subsd %xmm1, %xmm0
	movabsq $4620693217682128896, %r10
	movq %r10, %xmm1
	mulsd %xmm1, %xmm0
	xorps %xmm1, %xmm1
	movaps %xmm0, %xmm3
	callq raycaster__r3d_player_move__4__R3DPlayerE1_ptr1__doubleE1__doubleE1__doubleE1__ret_voidE1
	jmp .LB24570
.LB24578:
	xorps %xmm0, %xmm0
	movsd %xmm0, -1256(%rbp)
	xorps %xmm0, %xmm0
	movsd %xmm0, -1248(%rbp)
	xorps %xmm0, %xmm0
	movsd %xmm0, -1240(%rbp)
	xorps %xmm0, %xmm0
	movsd %xmm0, -1232(%rbp)
	xorps %xmm0, %xmm0
	movsd %xmm0, -1224(%rbp)
	jmp .LB24580
.LB24597:
	xorl %eax, %eax
	movl $1, %ecx
	movq -17624(%rbp), %rdx
	cmpl $1, %edx
	cmove %eax, %ecx
	movq %rcx, -17888(%rbp)
	movq -17640(%rbp), %rax
	callq *%rax
	movq -17888(%rbp), %r10
	movq %r10, -17880(%rbp)
	jmp .LB24599
.LB24620:
	movsd -16944(%rbp), %xmm0
	xorps %xmm1, %xmm1
	ucomisd %xmm1, %xmm0
	ja .LB24636
.LB24628:
	movsd -16912(%rbp), %xmm0
	xorps %xmm1, %xmm1
	ucomisd %xmm1, %xmm0
	ja .LB24636
.LB24637:
	leaq -17064(%rbp), %rcx
	xorps %xmm0, %xmm0
	xorps %xmm2, %xmm2
	movabsq $4594572339843380019, %r10
	movq %r10, %xmm3
	movabsq $4594572339843380019, %r10
	movq %r10, %xmm1
	movabsq $4594572339843380019, %r10
	movq %r10, %xmm4
	movsd %xmm1, 32(%rsp)
	movsd %xmm4, 40(%rsp)
	movaps %xmm0, %xmm1
	callq raycaster__r3d_scene_set_fog__6__R3DSceneE1_ptr1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__ret_voidE1
	xorps %xmm0, %xmm0
	movabsq $4617315517961601024, %r10
	movq %r10, %xmm1
	leaq -17064(%rbp), %rcx
	movabsq $4600877379321698714, %r10
	movq %r10, %xmm2
	movabsq $4591870180066957722, %r10
	movq %r10, %xmm3
	movabsq $4591870180066957722, %r10
	movq %r10, %xmm4
	movabsq $4593311331947716280, %r10
	movq %r10, %xmm5
	subsd %xmm1, %xmm0
	movabsq $4578071150808694522, %r10
	movq %r10, %xmm1
	movsd %xmm3, 32(%rsp)
	movsd %xmm4, 40(%rsp)
	movsd %xmm5, 48(%rsp)
	movaps %xmm0, %xmm3
	callq raycaster__r3d_scene_set_vol_fog__7__R3DSceneE1_ptr1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__ret_voidE1
	jmp .LB24622
.LB24636:
	xorps %xmm0, %xmm0
	movsd %xmm0, -16944(%rbp)
	xorps %xmm0, %xmm0
	movsd %xmm0, -16912(%rbp)
	jmp .LB24622
.LB24654:
	movq -17632(%rbp), %rax
	cmpl $1, %eax
	je .LB24659
.LB24660:
	movl $33, -17008(%rbp)
	movl $1, %eax
.LB24661:
	movq %rax, -17896(%rbp)
	jmp .LB24656
.LB24659:
	movl $0, -17008(%rbp)
	xorl %eax, %eax
	jmp .LB24661
.LB24673:
	movq -360(%rbp), %rcx
	leaq -17080(%rbp), %rdx
	callq GetClientRect
	movl -17072(%rbp), %eax
	subl -17080(%rbp), %eax
	movl -17068(%rbp), %ecx
	subl -17076(%rbp), %ecx
	movl $1, %edx
	cmpl $1, %eax
	movl %eax, %r8d
	cmovl %edx, %r8d
	movl $1, %eax
	cmpl $1, %ecx
	movl %ecx, %r9d
	cmovl %eax, %r9d
	xorl %ecx, %ecx
	xorl %edx, %edx
	callq glViewport
	leaq -1192(%rbp), %rcx
	leaq -1256(%rbp), %rdx
	callq raycaster__r3d_camera_sync__2__R3DCameraE1_ptr1__R3DPlayerE1_ptr1__ret_voidE1
	leaq -17064(%rbp), %rcx
	movq -17728(%rbp), %r8
	movq %rbx, %rdx
	callq raycaster__r3d_render__3__R3DSceneE1_ptr1__dataE1_ptr1_ubits64__doubleE1_ptr1__ret_voidE1
	xorps %xmm0, %xmm0
	xorps %xmm1, %xmm1
	xorps %xmm2, %xmm2
	movabsq $1065353216, %r10
	movq %r10, %xmm3
	callq glClearColor
	movl GL_COLOR_BUFFER_BIT(%rip), %eax
	movl GL_DEPTH_BUFFER_BIT(%rip), %ecx
	orl %eax, %ecx
	callq glClear
	movl GL_TEXTURE_2D(%rip), %ecx
	movl -512(%rbp), %edx
	callq glBindTexture
	movl GL_TEXTURE_2D(%rip), %ecx
	movl GL_RGBA(%rip), %r8d
	movl WIN_W(%rip), %r9d
	movl WIN_H(%rip), %eax
	xorl %edx, %edx
	movq %rax, 32(%rsp)
	movq $0, 40(%rsp)
	movq %r8, 48(%rsp)
	movq $5123, 56(%rsp)
	movq %rbx, 64(%rsp)
	callq glTexImage2D
	movl GL_QUADS(%rip), %ecx
	callq glBegin
	xorps %xmm0, %xmm0
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	callq glTexCoord2f
	xorps %xmm0, %xmm0
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	subss %xmm1, %xmm0
	xorps %xmm1, %xmm1
	movabsq $1065353216, %r10
	movq %r10, %xmm2
	subss %xmm2, %xmm1
	callq glVertex2f
	movabsq $1065353216, %r10
	movq %r10, %xmm0
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	callq glTexCoord2f
	xorps %xmm0, %xmm0
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	movaps %xmm1, %xmm15
	movaps %xmm0, %xmm1
	subss %xmm15, %xmm1
	movabsq $1065353216, %r10
	movq %r10, %xmm0
	callq glVertex2f
	movabsq $1065353216, %r10
	movq %r10, %xmm0
	xorps %xmm1, %xmm1
	callq glTexCoord2f
	movabsq $1065353216, %r10
	movq %r10, %xmm0
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	callq glVertex2f
	xorps %xmm0, %xmm0
	xorps %xmm1, %xmm1
	callq glTexCoord2f
	xorps %xmm0, %xmm0
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	subss %xmm1, %xmm0
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	callq glVertex2f
	callq glEnd
	movq -488(%rbp), %rcx
	callq SwapBuffers
	movq -17904(%rbp), %r10
	movq %r10, -17512(%rbp)
	movq -17912(%rbp), %r10
	movq %r10, -17520(%rbp)
	movq %r13, -17528(%rbp)
	movq %r14, -17536(%rbp)
	movq %r15, -17544(%rbp)
	movq %rsi, -17552(%rbp)
	movq -17656(%rbp), %r10
	movq %r10, -17560(%rbp)
	movq -17664(%rbp), %r10
	movq %r10, -17568(%rbp)
	movq -17672(%rbp), %r10
	movq %r10, -17576(%rbp)
	movq -17680(%rbp), %r10
	movq %r10, -17584(%rbp)
	movq -17688(%rbp), %r10
	movq %r10, -17592(%rbp)
	movq -17696(%rbp), %r10
	movq %r10, -17600(%rbp)
	movq -17704(%rbp), %r10
	movq %r10, -17608(%rbp)
	movq -17712(%rbp), %r10
	movq %r10, -17616(%rbp)
	movq -17880(%rbp), %r10
	movq %r10, -17624(%rbp)
	movq -17896(%rbp), %r10
	movq %r10, -17632(%rbp)
	movq %rdi, %rsi
	jmp .LB24365
.LB24288:
	movabsq $4591870180066957722, %r10
	movq %r10, %xmm0
	movabsq $4604480259023595110, %r10
	movq %r10, %xmm1
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm2
	jmp .LB24284
.LB24287:
	movabsq $4596373779694328218, %r10
	movq %r10, %xmm0
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm1
	movabsq $4599075939470750515, %r10
	movq %r10, %xmm2
	jmp .LB24284
.LB24286:
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm0
	movabsq $4603579539098121011, %r10
	movq %r10, %xmm1
	movabsq $4591870180066957722, %r10
	movq %r10, %xmm2
	jmp .LB24284
.LB24285:
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm0
	movabsq $4599075939470750515, %r10
	movq %r10, %xmm1
	movabsq $4596373779694328218, %r10
	movq %r10, %xmm2
	jmp .LB24284
.LB24290:
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm0
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm1
	movabsq $4603579539098121011, %r10
	movq %r10, %xmm2
	jmp .LB24284
	.section .rodata
	.p2align 3
.LJT25109:
	.quad .LB24285
	.quad .LB24286
	.quad .LB24287
	.quad .LB24288
	.quad .LB24289
	.text
	.text
	.globl main__2__intE1__byteE1_ptr2__ret_intE1
	.def main__2__intE1__byteE1_ptr2__ret_intE1;
	.scl 2;
	.type 32;
	.endef
main__2__intE1__byteE1_ptr2__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB24776:
	callq main__0__ret_intE1
	leave
	ret
	.text
	.globl FRTStartup
	.def FRTStartup;
	.scl 2;
	.type 32;
	.endef
FRTStartup:
	pushq %rbp
	movq %rsp, %rbp
	subq $112, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
	movq %r14, -48(%rbp)
	movq %r15, -56(%rbp)
.LB4483:
	callq standard__system__cpu__cpuid_query__0__ret_voidE1
	movq standard__system__cpu__g_l2_bytes(%rip), %rax
	movq %rax, nt_threshold(%rip)
	callq standard__system__cpu__cpuid_query__0__ret_voidE1
	movzbl standard__system__cpu__g_ermsb(%rip), %eax
	movabsq $4294967285, %rcx
	movb %al, ermsb(%rip)
	callq GetStdHandle
	movq %rax, WIN_STDOUT_HANDLE(%rip)
	callq standard__memory__allocators__stdheap__table_init__0__ret_boolE1
	callq GetCommandLineW
	movq %rax, %rsi
	xorl %edi, %edi
	xorl %eax, %eax
.LB4502:
	movslq %eax, %rcx
	cmpw $0, (%rsi,%rcx,2)
	je .LB4504
.LB4503:
.LB4511:
	movslq %eax, %rcx
	movzwl (%rsi,%rcx,2), %ecx
	cmpw $32, %cx
	je .LB4512
.LB4520:
	cmpw $9, %cx
	jne .LB4513
.LB4512:
	incl %eax
	jmp .LB4511
.LB4513:
	testw %cx, %cx
	je .LB4504
.LB4538:
	cmpw $34, %cx
	je .LB4546
.LB4547:
.LB4582:
	movslq %eax, %rcx
	movzwl (%rsi,%rcx,2), %ecx
	testw %cx, %cx
	je .LB4584
.LB4591:
	cmpw $32, %cx
	je .LB4584
.LB4600:
	cmpw $9, %cx
	je .LB4584
.LB4583:
	incl %eax
	jmp .LB4582
.LB4584:
.LB4548:
	incl %edi
	jmp .LB4502
.LB4546:
	incl %eax
.LB4551:
	movslq %eax, %rcx
	movzwl (%rsi,%rcx,2), %ecx
	testw %cx, %cx
	je .LB4553
.LB4560:
	cmpw $34, %cx
	je .LB4553
.LB4552:
	incl %eax
	jmp .LB4551
.LB4553:
	leal 1(%rax), %ecx
	movslq %eax, %rdx
	cmpw $34, (%rsi,%rdx,2)
	cmove %ecx, %eax
	jmp .LB4548
.LB4504:
	movq %rdi, %rcx
	shlq $3, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, %rbx
	xorl %r12d, %r12d
	xorl %eax, %eax
	xorl %ecx, %ecx
.LB4619:
	movslq %eax, %rdx
	cmpw $0, (%rsi,%rdx,2)
	je .LB4621
.LB4620:
.LB4628:
	movslq %eax, %rdx
	movzwl (%rsi,%rdx,2), %edx
	cmpw $32, %dx
	je .LB4629
.LB4637:
	cmpw $9, %dx
	jne .LB4630
.LB4629:
	incl %eax
	jmp .LB4628
.LB4630:
	testw %dx, %dx
	je .LB4621
.LB4655:
	cmpw $34, %dx
	je .LB4664
.LB4665:
	movq %rax, %rdx
	xorl %r8d, %r8d
.LB4703:
	movslq %edx, %r9
	movzwl (%rsi,%r9,2), %r9d
	testw %r9w, %r9w
	je .LB4705
.LB4712:
	cmpw $32, %r9w
	je .LB4705
.LB4721:
	cmpw $9, %r9w
	je .LB4705
.LB4704:
	incl %r8d
	incl %edx
	jmp .LB4703
.LB4705:
	movq %rdx, %r13
	movq %rax, %r14
	movq %r8, %r15
	movq %rcx, -80(%rbp)
.LB4666:
	leaq 1(%r15), %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	xorl %ecx, %ecx
	testl %r15d, %r15d
	cmovg %r15d, %ecx
	shrl $2, %ecx
	xorl %edx, %edx
.LB25110:
	testl %ecx, %ecx
	je .LB25112
.LB25111:
	leal (%r14,%rdx), %r8d
	movslq %r8d, %r8
	movzwl (%rsi,%r8,2), %r8d
	movslq %edx, %r9
	movb %r8b, (%rax,%r9,1)
	leal 1(%rdx), %r8d
	leal (%r14,%r8), %r9d
	movslq %r9d, %r9
	movzwl (%rsi,%r9,2), %r9d
	movslq %r8d, %r8
	movb %r9b, (%rax,%r8,1)
	leal 2(%rdx), %r8d
	leal (%r14,%r8), %r9d
	movslq %r9d, %r9
	movzwl (%rsi,%r9,2), %r9d
	movslq %r8d, %r8
	movb %r9b, (%rax,%r8,1)
	leal 3(%rdx), %r8d
	leal (%r14,%r8), %r9d
	movslq %r9d, %r9
	movzwl (%rsi,%r9,2), %r9d
	movslq %r8d, %r8
	movb %r9b, (%rax,%r8,1)
	addl $4, %edx
	decl %ecx
	jne .LB25111
	jmp .LB25112
.LB4664:
	incl %eax
	movq %rax, %rcx
	xorl %r15d, %r15d
.LB4670:
	movslq %ecx, %rdx
	movzwl (%rsi,%rdx,2), %edx
	testw %dx, %dx
	je .LB4672
.LB4679:
	cmpw $34, %dx
	je .LB4672
.LB4671:
	incl %r15d
	incl %ecx
	jmp .LB4670
.LB4672:
	leal 1(%rcx), %edx
	movslq %ecx, %r8
	cmpw $34, (%rsi,%r8,2)
	movl %ecx, %r13d
	cmove %edx, %r13d
	movq %rax, %r14
	movq $1, -80(%rbp)
	jmp .LB4666
.LB25112:
.LB4740:
	cmpl %r15d, %edx
	jge .LB4742
.LB4741:
	leal (%r14,%rdx), %ecx
	movslq %ecx, %rcx
	movzwl (%rsi,%rcx,2), %ecx
	movslq %edx, %r8
	movb %cl, (%rax,%r8,1)
	incl %edx
	cmpl %r15d, %edx
	jl .LB4741
.LB4742:
	movslq %r15d, %rcx
	movb $0, (%rax,%rcx,1)
	movslq %r12d, %rcx
	movq %rax, (%rbx,%rcx,8)
	incl %r12d
	movq %r13, %rax
	movq -80(%rbp), %rcx
	jmp .LB4619
.LB4621:
	cmpl $1, %edi
	jg .LB4770
.LB4771:
	callq main__0__ret_intE1
	movq %rax, %rsi
.LB4772:
	movslq %edi, %rdi
	xorl %r12d, %r12d
.LB4777:
	cmpq %rdi, %r12
	jge .LB4779
.LB4778:
	movq (%rbx,%r12,8), %rax
	movq %rax, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	incq %r12
	cmpq %rdi, %r12
	jl .LB4778
	jmp .LB4779
.LB4770:
	callq main__0__ret_intE1
	movl %eax, %esi
	jmp .LB4772
.LB4779:
	testl %esi, %esi
	jne .LB4792
.LB4794:
	callq standard__io__console__flush__0__ret_voidE1
	movq %rsi, %rcx
	callq RtlExitUserProcess
	movq %rbx, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movl %esi, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB4792:
	cmpl $3221225477, %esi
	jne .LB4794
.LB4798:
	movl $1179075923, -66(%rbp)
	movl $1414288705, -62(%rbp)
	movw $10, -58(%rbp)
	leaq -66(%rbp), %rdi
	movq %rdi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rdi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	jmp .LB4794
	.text
	.globl __chkstk
	.def __chkstk;
	.scl 2;
	.type 32;
	.endef
__chkstk:
.LB4482:
	subq $16, %rsp
	movq %r10, (%rsp)
	movq %r11, 8(%rsp)
	xorq %r11, %r11
	leaq 24(%rsp), %r10
	subq %rax, %r10
	cmovbq %r11, %r10
	movq %gs:16, %r11
	cmpq %r11, %r10
	jae .Lchkstk_done
	andw $-4096, %r10w
	.Lchkstk_probe:
	leaq -4096(%r11), %r11
	movb $0, (%r11)
	cmpq %r11, %r10
	jne .Lchkstk_probe
	.Lchkstk_done:
	movq (%rsp), %r10
	movq 8(%rsp), %r11
	addq $16, %rsp
	retq
	ud2
	.text
	.globl standard__math__abs__1__dataE1_sbits8__ret_dataE1_sbits8
	.def standard__math__abs__1__dataE1_sbits8__ret_dataE1_sbits8;
	.scl 2;
	.type 32;
	.endef
standard__math__abs__1__dataE1_sbits8__ret_dataE1_sbits8:
.LB4817:
	testb %cl, %cl
	js .LB4822
.LB4823:
	movzbl %cl, %eax
	ret
.LB4822:
	xorl %eax, %eax
	subl %ecx, %eax
	movzbl %al, %eax
	ret
	.text
	.globl standard__math__abs__1__dataE1_sbits16__ret_dataE1_sbits16
	.def standard__math__abs__1__dataE1_sbits16__ret_dataE1_sbits16;
	.scl 2;
	.type 32;
	.endef
standard__math__abs__1__dataE1_sbits16__ret_dataE1_sbits16:
.LB4828:
	testw %cx, %cx
	js .LB4833
.LB4834:
	movzwl %cx, %eax
	ret
.LB4833:
	xorl %eax, %eax
	subl %ecx, %eax
	movzwl %ax, %eax
	ret
	.text
	.globl standard__math__abs__1__dataE1_sbits32__ret_dataE1_sbits32
	.def standard__math__abs__1__dataE1_sbits32__ret_dataE1_sbits32;
	.scl 2;
	.type 32;
	.endef
standard__math__abs__1__dataE1_sbits32__ret_dataE1_sbits32:
.LB4839:
	testl %ecx, %ecx
	js .LB4843
.LB4844:
	movl %ecx, %eax
	ret
.LB4843:
	xorl %eax, %eax
	subl %ecx, %eax
	ret
	.text
	.globl standard__math__abs__1__dataE1_sbits64__ret_dataE1_sbits64
	.def standard__math__abs__1__dataE1_sbits64__ret_dataE1_sbits64;
	.scl 2;
	.type 32;
	.endef
standard__math__abs__1__dataE1_sbits64__ret_dataE1_sbits64:
.LB4849:
	testq %rcx, %rcx
	js .LB4854
.LB4855:
	movq %rcx, %rax
	ret
.LB4854:
	xorl %eax, %eax
	subq %rcx, %rax
	ret
	.text
	.globl standard__math__abs__1__floatE1__ret_floatE1
	.def standard__math__abs__1__floatE1__ret_floatE1;
	.scl 2;
	.type 32;
	.endef
standard__math__abs__1__floatE1__ret_floatE1:
.LB4860:
	xorps %xmm1, %xmm1
	ucomiss %xmm0, %xmm1
	ja .LB4864
.LB4865:
	ret
.LB4864:
	xorps %xmm1, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subss %xmm15, %xmm0
	ret
	.text
	.globl standard__math__abs__1__doubleE1__ret_doubleE1
	.def standard__math__abs__1__doubleE1__ret_doubleE1;
	.scl 2;
	.type 32;
	.endef
standard__math__abs__1__doubleE1__ret_doubleE1:
.LB4870:
	xorps %xmm1, %xmm1
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm0, %xmm1
	ja .LB4875
.LB4876:
	ret
.LB4875:
	xorps %xmm1, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subsd %xmm15, %xmm0
	ret
	.text
	.globl standard__math__clamp__3__dataE1_sbits8__dataE1_sbits8__dataE1_sbits8__ret_dataE1_sbits8
	.def standard__math__clamp__3__dataE1_sbits8__dataE1_sbits8__dataE1_sbits8__ret_dataE1_sbits8;
	.scl 2;
	.type 32;
	.endef
standard__math__clamp__3__dataE1_sbits8__dataE1_sbits8__dataE1_sbits8__ret_dataE1_sbits8:
.LB4881:
	cmpb %dl, %cl
	jl .LB4888
.LB4889:
	cmpb %r8b, %cl
	jg .LB4895
.LB4896:
	movzbl %cl, %eax
	ret
.LB4895:
	movzbl %r8b, %eax
	ret
.LB4888:
	movzbl %dl, %eax
	ret
	.text
	.globl standard__math__clamp__3__dataE1_sbits16__dataE1_sbits16__dataE1_sbits16__ret_dataE1_sbits16
	.def standard__math__clamp__3__dataE1_sbits16__dataE1_sbits16__dataE1_sbits16__ret_dataE1_sbits16;
	.scl 2;
	.type 32;
	.endef
standard__math__clamp__3__dataE1_sbits16__dataE1_sbits16__dataE1_sbits16__ret_dataE1_sbits16:
.LB4900:
	cmpw %dx, %cx
	jl .LB4907
.LB4908:
	cmpw %r8w, %cx
	jg .LB4914
.LB4915:
	movzwl %cx, %eax
	ret
.LB4914:
	movzwl %r8w, %eax
	ret
.LB4907:
	movzwl %dx, %eax
	ret
	.text
	.globl standard__math__clamp__3__dataE1_sbits32__dataE1_sbits32__dataE1_sbits32__ret_dataE1_sbits32
	.def standard__math__clamp__3__dataE1_sbits32__dataE1_sbits32__dataE1_sbits32__ret_dataE1_sbits32;
	.scl 2;
	.type 32;
	.endef
standard__math__clamp__3__dataE1_sbits32__dataE1_sbits32__dataE1_sbits32__ret_dataE1_sbits32:
.LB4919:
	cmpl %edx, %ecx
	jl .LB4926
.LB4927:
	cmpl %r8d, %ecx
	jg .LB4933
.LB4934:
	movl %ecx, %eax
	ret
.LB4933:
	movl %r8d, %eax
	ret
.LB4926:
	movl %edx, %eax
	ret
	.text
	.globl standard__math__clamp__3__dataE1_sbits64__dataE1_sbits64__dataE1_sbits64__ret_dataE1_sbits64
	.def standard__math__clamp__3__dataE1_sbits64__dataE1_sbits64__dataE1_sbits64__ret_dataE1_sbits64;
	.scl 2;
	.type 32;
	.endef
standard__math__clamp__3__dataE1_sbits64__dataE1_sbits64__dataE1_sbits64__ret_dataE1_sbits64:
.LB4938:
	cmpq %rdx, %rcx
	jl .LB4945
.LB4946:
	cmpq %r8, %rcx
	jg .LB4952
.LB4953:
	movq %rcx, %rax
	ret
.LB4952:
	movq %r8, %rax
	ret
.LB4945:
	movq %rdx, %rax
	ret
	.text
	.globl standard__math__clamp__3__floatE1__floatE1__floatE1__ret_floatE1
	.def standard__math__clamp__3__floatE1__floatE1__floatE1__ret_floatE1;
	.scl 2;
	.type 32;
	.endef
standard__math__clamp__3__floatE1__floatE1__floatE1__ret_floatE1:
.LB4957:
	ucomiss %xmm0, %xmm1
	ja .LB4964
.LB4965:
	ucomiss %xmm2, %xmm0
	ja .LB4971
.LB4972:
	ret
.LB4971:
	movaps %xmm2, %xmm0
	ret
.LB4964:
	movaps %xmm1, %xmm0
	ret
	.text
	.globl standard__math__clamp__3__doubleE1__doubleE1__doubleE1__ret_doubleE1
	.def standard__math__clamp__3__doubleE1__doubleE1__doubleE1__ret_doubleE1;
	.scl 2;
	.type 32;
	.endef
standard__math__clamp__3__doubleE1__doubleE1__doubleE1__ret_doubleE1:
.LB4976:
	ucomisd %xmm0, %xmm1
	ja .LB4983
.LB4984:
	ucomisd %xmm2, %xmm0
	ja .LB4990
.LB4991:
	ret
.LB4990:
	movaps %xmm2, %xmm0
	ret
.LB4983:
	movaps %xmm1, %xmm0
	ret
	.text
	.globl standard__math__sqrt__1__dataE1_sbits8__ret_dataE1_sbits8
	.def standard__math__sqrt__1__dataE1_sbits8__ret_dataE1_sbits8;
	.scl 2;
	.type 32;
	.endef
standard__math__sqrt__1__dataE1_sbits8__ret_dataE1_sbits8:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
	movq %rdi, -8(%rsp)
.LB4995:
	movsbl %cl, %eax
	testb %cl, %cl
	jle .LB5000
.LB5001:
	cmpb $1, %cl
	je .LB5007
.LB5008:
	movl %eax, %edx
	sarl $31, %edx
	movl %eax, %edx
	shrl $31, %edx
	addl %edx, %eax
	sarl $1, %eax
	movq %rax, %rsi
	movq %rcx, %rax
.LB5018:
	cmpb %al, %sil
	je .LB5020
.LB5024:
	cmpb %al, %sil
	jge .LB5020
.LB5019:
	movsbl %cl, %eax
	movsbl %sil, %edi
	cltd
	idivl %edi
	addl %esi, %eax
	movsbl %al, %eax
	movl %eax, %edx
	sarl $31, %edx
	movl %eax, %edx
	shrl $31, %edx
	addl %edx, %eax
	sarl $1, %eax
	movq %rsi, %r11
	movq %rax, %rsi
	movq %r11, %rax
	cmpb %al, %sil
	jne .LB5024
.LB5020:
	movzbl %sil, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB5007:
	movl $1, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB5000:
	xorl %eax, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
	.text
	.globl standard__math__sqrt__1__dataE1_sbits16__ret_dataE1_sbits16
	.def standard__math__sqrt__1__dataE1_sbits16__ret_dataE1_sbits16;
	.scl 2;
	.type 32;
	.endef
standard__math__sqrt__1__dataE1_sbits16__ret_dataE1_sbits16:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
	movq %rdi, -8(%rsp)
.LB5040:
	movswl %cx, %eax
	testw %cx, %cx
	jle .LB5045
.LB5046:
	cmpw $1, %cx
	je .LB5052
.LB5053:
	movl %eax, %edx
	sarl $31, %edx
	movl %eax, %edx
	shrl $31, %edx
	addl %edx, %eax
	sarl $1, %eax
	movq %rax, %rsi
	movq %rcx, %rax
.LB5063:
	cmpw %ax, %si
	je .LB5065
.LB5069:
	cmpw %ax, %si
	jge .LB5065
.LB5064:
	movswl %cx, %eax
	movswl %si, %edi
	cltd
	idivl %edi
	addl %esi, %eax
	movswl %ax, %eax
	movl %eax, %edx
	sarl $31, %edx
	movl %eax, %edx
	shrl $31, %edx
	addl %edx, %eax
	sarl $1, %eax
	movq %rsi, %r11
	movq %rax, %rsi
	movq %r11, %rax
	cmpw %ax, %si
	jne .LB5069
.LB5065:
	movzwl %si, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB5052:
	movl $1, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB5045:
	xorl %eax, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
	.text
	.globl standard__math__sqrt__1__dataE1_sbits32__ret_dataE1_sbits32
	.def standard__math__sqrt__1__dataE1_sbits32__ret_dataE1_sbits32;
	.scl 2;
	.type 32;
	.endef
standard__math__sqrt__1__dataE1_sbits32__ret_dataE1_sbits32:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
.LB5085:
	testl %ecx, %ecx
	jle .LB5089
.LB5090:
	movl %ecx, %eax
	sarl $31, %eax
	movl %ecx, %eax
	shrl $31, %eax
	addl %ecx, %eax
	sarl $1, %eax
	movq %rax, %rsi
	movq %rcx, %rax
.LB5097:
	cmpl %eax, %esi
	je .LB5099
.LB5103:
	cmpl %eax, %esi
	jge .LB5099
.LB5098:
	movl %ecx, %eax
	cltd
	idivl %esi
	addl %esi, %eax
	movl %eax, %edx
	sarl $31, %edx
	movl %eax, %edx
	shrl $31, %edx
	addl %edx, %eax
	sarl $1, %eax
	movq %rsi, %r11
	movq %rax, %rsi
	movq %r11, %rax
	cmpl %eax, %esi
	jne .LB5103
.LB5099:
	movl %esi, %eax
	movq 0(%rsp), %rsi
	addq $16, %rsp
	ret
.LB5089:
	xorl %eax, %eax
	movq 0(%rsp), %rsi
	addq $16, %rsp
	ret
	.text
	.globl standard__math__sqrt__1__dataE1_sbits64__ret_dataE1_sbits64
	.def standard__math__sqrt__1__dataE1_sbits64__ret_dataE1_sbits64;
	.scl 2;
	.type 32;
	.endef
standard__math__sqrt__1__dataE1_sbits64__ret_dataE1_sbits64:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
	movq %rdi, -8(%rsp)
.LB5117:
	testq %rcx, %rcx
	jle .LB5122
.LB5123:
	cmpq $1, %rcx
	je .LB5129
.LB5130:
	movl $2, %esi
	movq %rcx, %rax
	cqto
	idivq %rsi
	movq %rax, %rsi
	movq %rcx, %rax
.LB5139:
	cmpq %rax, %rsi
	je .LB5141
.LB5145:
	cmpq %rax, %rsi
	jge .LB5141
.LB5140:
	movq %rcx, %rax
	cqto
	idivq %rsi
	addq %rsi, %rax
	movl $2, %edi
	cqto
	idivq %rdi
	movq %rsi, %r11
	movq %rax, %rsi
	movq %r11, %rax
	cmpq %rax, %rsi
	jne .LB5145
.LB5141:
	movq %rsi, %rax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB5129:
	movl $1, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB5122:
	xorl %eax, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
	.text
	.globl standard__math__sqrt__1__byteE1__ret_byteE1
	.def standard__math__sqrt__1__byteE1__ret_byteE1;
	.scl 2;
	.type 32;
	.endef
standard__math__sqrt__1__byteE1__ret_byteE1:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
	movq %rdi, -8(%rsp)
.LB5160:
	testb %cl, %cl
	jbe .LB5165
.LB5166:
	movq %rcx, %rsi
	xorl %eax, %eax
.LB5172:
	cmpb %al, %sil
	je .LB5174
.LB5173:
	movzbl %cl, %eax
	movzbl %sil, %edi
	xorl %edx, %edx
	divl %edi
	addl %esi, %eax
	movzbl %al, %eax
	shrl $1, %eax
	movq %rsi, %r11
	movq %rax, %rsi
	movq %r11, %rax
	cmpb %al, %sil
	jne .LB5173
.LB5174:
	movzbl %sil, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB5165:
	xorl %eax, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
	.text
	.globl standard__math__sqrt__1__dataE1_ubits16__ret_dataE1_ubits16
	.def standard__math__sqrt__1__dataE1_ubits16__ret_dataE1_ubits16;
	.scl 2;
	.type 32;
	.endef
standard__math__sqrt__1__dataE1_ubits16__ret_dataE1_ubits16:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
	movq %rdi, -8(%rsp)
.LB5188:
	testw %cx, %cx
	jbe .LB5193
.LB5194:
	movq %rcx, %rsi
	xorl %eax, %eax
.LB5200:
	cmpw %ax, %si
	je .LB5202
.LB5201:
	movzwl %cx, %eax
	movzwl %si, %edi
	xorl %edx, %edx
	divl %edi
	addl %esi, %eax
	movzwl %ax, %eax
	shrl $1, %eax
	movq %rsi, %r11
	movq %rax, %rsi
	movq %r11, %rax
	cmpw %ax, %si
	jne .LB5201
.LB5202:
	movzwl %si, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB5193:
	xorl %eax, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
	.text
	.globl standard__math__sqrt__1__dataE1_ubits32__ret_dataE1_ubits32
	.def standard__math__sqrt__1__dataE1_ubits32__ret_dataE1_ubits32;
	.scl 2;
	.type 32;
	.endef
standard__math__sqrt__1__dataE1_ubits32__ret_dataE1_ubits32:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
.LB5216:
	testl %ecx, %ecx
	jbe .LB5220
.LB5221:
	movq %rcx, %rsi
	xorl %eax, %eax
.LB5226:
	cmpl %eax, %esi
	je .LB5228
.LB5227:
	movl %ecx, %eax
	xorl %edx, %edx
	divl %esi
	addl %esi, %eax
	shrl $1, %eax
	movq %rsi, %r11
	movq %rax, %rsi
	movq %r11, %rax
	cmpl %eax, %esi
	jne .LB5227
.LB5228:
	movl %esi, %eax
	movq 0(%rsp), %rsi
	addq $16, %rsp
	ret
.LB5220:
	xorl %eax, %eax
	movq 0(%rsp), %rsi
	addq $16, %rsp
	ret
	.text
	.globl standard__math__sqrt__1__dataE1_ubits64__ret_dataE1_ubits64
	.def standard__math__sqrt__1__dataE1_ubits64__ret_dataE1_ubits64;
	.scl 2;
	.type 32;
	.endef
standard__math__sqrt__1__dataE1_ubits64__ret_dataE1_ubits64:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
.LB5240:
	testq %rcx, %rcx
	jbe .LB5245
.LB5246:
	movq %rcx, %rsi
	xorl %eax, %eax
.LB5252:
	cmpq %rax, %rsi
	je .LB5254
.LB5253:
	movq %rcx, %rax
	xorl %edx, %edx
	divq %rsi
	addq %rsi, %rax
	shrq $1, %rax
	movq %rsi, %r11
	movq %rax, %rsi
	movq %r11, %rax
	cmpq %rax, %rsi
	jne .LB5253
.LB5254:
	movq %rsi, %rax
	movq 0(%rsp), %rsi
	addq $16, %rsp
	ret
.LB5245:
	xorl %eax, %eax
	movq 0(%rsp), %rsi
	addq $16, %rsp
	ret
	.text
	.globl standard__math__sqrt__1__floatE1__ret_floatE1
	.def standard__math__sqrt__1__floatE1__ret_floatE1;
	.scl 2;
	.type 32;
	.endef
standard__math__sqrt__1__floatE1__ret_floatE1:
.LB5267:
	movaps %xmm0, %xmm1
	sqrtss %xmm1, %xmm0
	ret
	.text
	.globl standard__math__sqrt__1__doubleE1__ret_doubleE1
	.def standard__math__sqrt__1__doubleE1__ret_doubleE1;
	.scl 2;
	.type 32;
	.endef
standard__math__sqrt__1__doubleE1__ret_doubleE1:
.LB5273:
	movaps %xmm0, %xmm1
	sqrtsd %xmm1, %xmm0
	ret
	.text
	.globl standard__math__fisr__1__floatE1__ret_floatE1
	.def standard__math__fisr__1__floatE1__ret_floatE1;
	.scl 2;
	.type 32;
	.endef
standard__math__fisr__1__floatE1__ret_floatE1:
	subq $16, %rsp
.LB5279:
	leaq 4(%rsp), %rax
	xorps %xmm1, %xmm1
	movl $1597463007, %ecx
	movabsq $1069547520, %r10
	movq %r10, %xmm2
	movss %xmm1, 4(%rsp)
	movl $0, (%rsp)
	movss %xmm0, 4(%rsp)
	movabsq $1056964608, %r10
	movq %r10, %xmm1
	mulss %xmm0, %xmm1
	movl (%rax), %eax
	movl %eax, (%rsp)
	shrl $1, %eax
	subl %eax, %ecx
	leaq (%rsp), %rax
	movl %ecx, (%rsp)
	movss (%rax), %xmm0
	movss %xmm0, 4(%rsp)
	mulss %xmm0, %xmm1
	vfnmadd132ss %xmm0, %xmm2, %xmm1
	mulss %xmm1, %xmm0
	movss %xmm0, 4(%rsp)
	addq $16, %rsp
	ret
	.text
	.globl standard__math___sin_kernel__1__doubleE1__ret_doubleE1
	.def standard__math___sin_kernel__1__doubleE1__ret_doubleE1;
	.scl 2;
	.type 32;
	.endef
standard__math___sin_kernel__1__doubleE1__ret_doubleE1:
	subq $32, %rsp
.LB5303:
	movabsq $1042983595, %r10
	movq %r10, %xmm3
	movabsq $961547521, %r10
	movq %r10, %xmm4
	movabsq $4493156356578846802, %r10
	movq %r10, %xmm5
	movaps %xmm0, %xmm1
	mulsd %xmm0, %xmm1
	movaps %xmm0, %xmm2
	mulsd %xmm1, %xmm2
	movsd %xmm2, -8(%rsp)
	xorps %xmm2, %xmm2
	movsd %xmm5, 16(%rsp)
	subss %xmm3, %xmm2
	xorps %xmm3, %xmm3
	subss %xmm4, %xmm3
	xorps %xmm4, %xmm4
	cvtss2sd %xmm2, %xmm2
	subsd %xmm5, %xmm4
	movabsq $4460209850635244924, %r10
	movq %r10, %xmm5
	cvtss2sd %xmm3, %xmm3
	movsd %xmm5, 8(%rsp)
	vfmadd231sd %xmm1, %xmm5, %xmm4
	movabsq $4523617212983017081, %r10
	movq %r10, %xmm5
	movsd %xmm5, (%rsp)
	vfmadd132sd %xmm1, %xmm5, %xmm4
	vfmadd231sd %xmm1, %xmm4, %xmm3
	movabsq $1007192201, %r10
	movq %r10, %xmm4
	cvtss2sd %xmm4, %xmm4
	vfmadd132sd %xmm1, %xmm4, %xmm3
	vfmadd132sd %xmm3, %xmm2, %xmm1
	movsd -8(%rsp), %xmm2
	vfmadd231sd %xmm2, %xmm1, %xmm0
	addq $32, %rsp
	ret
	.text
	.globl standard__math___cos_kernel__1__doubleE1__ret_doubleE1
	.def standard__math___cos_kernel__1__doubleE1__ret_doubleE1;
	.scl 2;
	.type 32;
	.endef
standard__math___cos_kernel__1__doubleE1__ret_doubleE1:
.LB5336:
	mulsd %xmm0, %xmm0
	movabsq $4443076914231916756, %r10
	movq %r10, %xmm1
	movabsq $4477121870137962957, %r10
	movq %r10, %xmm2
	vfnmadd132sd %xmm0, %xmm2, %xmm1
	movabsq $4508805056876532397, %r10
	movq %r10, %xmm2
	vfnmadd132sd %xmm0, %xmm2, %xmm1
	movabsq $936381697, %r10
	movq %r10, %xmm2
	cvtss2sd %xmm2, %xmm2
	vfnmadd132sd %xmm0, %xmm2, %xmm1
	movabsq $985008993, %r10
	movq %r10, %xmm2
	cvtss2sd %xmm2, %xmm2
	vfnmadd132sd %xmm0, %xmm2, %xmm1
	movabsq $1026206379, %r10
	movq %r10, %xmm2
	cvtss2sd %xmm2, %xmm2
	vfnmadd132sd %xmm0, %xmm2, %xmm1
	movabsq $1056964608, %r10
	movq %r10, %xmm2
	cvtss2sd %xmm2, %xmm2
	vfnmadd132sd %xmm0, %xmm2, %xmm1
	movabsq $1065353216, %r10
	movq %r10, %xmm2
	cvtss2sd %xmm2, %xmm2
	vfnmadd132sd %xmm1, %xmm2, %xmm0
	ret
	.text
	.globl standard__math___trig_reduce__2__doubleE1__dataE1_ptr1_sbits32__ret_doubleE1
	.def standard__math___trig_reduce__2__doubleE1__dataE1_ptr1_sbits32__ret_doubleE1;
	.scl 2;
	.type 32;
	.endef
standard__math___trig_reduce__2__doubleE1__dataE1_ptr1_sbits32__ret_doubleE1:
.LB5368:
	xorps %xmm1, %xmm1
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm0, %xmm1
	ja .LB5374
.LB5375:
.LB5376:
	movabsq $1056964608, %r10
	movq %r10, %xmm1
	movabsq $4603909380684499075, %r10
	movq %r10, %xmm2
	cvtss2sd %xmm1, %xmm1
	vfmadd231sd %xmm0, %xmm2, %xmm1
	movabsq $1070141403, %r10
	movq %r10, %xmm2
	cvtss2sd %xmm2, %xmm2
	cvttsd2siq %xmm1, %rax
	movl %eax, %eax
	movslq %eax, %rcx
	movl %eax, (%rdx)
	xorps %xmm1, %xmm1
	cvtsi2sdq %rcx, %xmm1
	vfnmadd231sd %xmm1, %xmm2, %xmm0
	movabsq $4454258360616903473, %r10
	movq %r10, %xmm2
	vfnmadd231sd %xmm1, %xmm2, %xmm0
	movabsq $4289434584870841891, %r10
	movq %r10, %xmm2
	vfnmadd231sd %xmm1, %xmm2, %xmm0
	ret
.LB5374:
	xorps %xmm1, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subsd %xmm15, %xmm0
	jmp .LB5376
	.text
	.globl standard__math__sin__1__doubleE1__ret_doubleE1
	.def standard__math__sin__1__doubleE1__ret_doubleE1;
	.scl 2;
	.type 32;
	.endef
standard__math__sin__1__doubleE1__ret_doubleE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
.LB5405:
	movl $0, -12(%rbp)
	xorps %xmm1, %xmm1
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm0, %xmm1
	seta %sil
	movzbl %sil, %esi
	testb %sil, %sil
	jne .LB5414
.LB5415:
.LB5416:
	movabsq $1061752795, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm0, %xmm1
	jae .LB5422
.LB5423:
	leaq -12(%rbp), %rdx
	callq standard__math___trig_reduce__2__doubleE1__dataE1_ptr1_sbits32__ret_doubleE1
	movl -12(%rbp), %eax
	andl $3, %eax
	je .LB5439
	cmpl $1, %eax
	je .LB5440
	cmpl $2, %eax
	jne .LB5442
.LB5441:
	callq standard__math___sin_kernel__1__doubleE1__ret_doubleE1
	xorps %xmm1, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subsd %xmm15, %xmm0
.LB5438:
	testb %sil, %sil
	jne .LB5454
.LB5455:
	movq -8(%rbp), %rsi
	leave
	ret
.LB5414:
	xorps %xmm1, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subsd %xmm15, %xmm0
	jmp .LB5416
.LB5440:
	callq standard__math___cos_kernel__1__doubleE1__ret_doubleE1
	testb %sil, %sil
	jne .LB5454
	jmp .LB5455
.LB5439:
	callq standard__math___sin_kernel__1__doubleE1__ret_doubleE1
	testb %sil, %sil
	jne .LB5454
	jmp .LB5455
.LB5442:
	callq standard__math___cos_kernel__1__doubleE1__ret_doubleE1
	xorps %xmm1, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subsd %xmm15, %xmm0
	testb %sil, %sil
	je .LB5455
.LB5454:
	xorps %xmm1, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subsd %xmm15, %xmm0
	movq -8(%rbp), %rsi
	leave
	ret
.LB5422:
	callq standard__math___sin_kernel__1__doubleE1__ret_doubleE1
	testb %sil, %sil
	jne .LB5428
.LB5429:
	movq -8(%rbp), %rsi
	leave
	ret
.LB5428:
	xorps %xmm1, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subsd %xmm15, %xmm0
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl standard__math__cos__1__doubleE1__ret_doubleE1
	.def standard__math__cos__1__doubleE1__ret_doubleE1;
	.scl 2;
	.type 32;
	.endef
standard__math__cos__1__doubleE1__ret_doubleE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
.LB5460:
	movl $0, -4(%rbp)
	xorps %xmm1, %xmm1
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm0, %xmm1
	ja .LB5467
.LB5468:
.LB5469:
	movabsq $1061752795, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm0, %xmm1
	jae .LB5475
.LB5476:
	leaq -4(%rbp), %rdx
	callq standard__math___trig_reduce__2__doubleE1__dataE1_ptr1_sbits32__ret_doubleE1
	movl -4(%rbp), %eax
	andl $3, %eax
	je .LB5485
	cmpl $1, %eax
	je .LB5486
	cmpl $2, %eax
	jne .LB5488
.LB5487:
	callq standard__math___cos_kernel__1__doubleE1__ret_doubleE1
	xorps %xmm1, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subsd %xmm15, %xmm0
	leave
	ret
.LB5467:
	xorps %xmm1, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subsd %xmm15, %xmm0
	jmp .LB5469
.LB5486:
	callq standard__math___sin_kernel__1__doubleE1__ret_doubleE1
	xorps %xmm1, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subsd %xmm15, %xmm0
	leave
	ret
.LB5485:
	callq standard__math___cos_kernel__1__doubleE1__ret_doubleE1
	leave
	ret
.LB5488:
	callq standard__math___sin_kernel__1__doubleE1__ret_doubleE1
	leave
	ret
.LB5475:
	callq standard__math___cos_kernel__1__doubleE1__ret_doubleE1
	leave
	ret
	.text
	.globl standard__math__sin__1__floatE1__ret_floatE1
	.def standard__math__sin__1__floatE1__ret_floatE1;
	.scl 2;
	.type 32;
	.endef
standard__math__sin__1__floatE1__ret_floatE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB5500:
	cvtss2sd %xmm0, %xmm0
	callq standard__math__sin__1__doubleE1__ret_doubleE1
	cvtsd2ss %xmm0, %xmm0
	leave
	ret
	.text
	.globl standard__math__cos__1__floatE1__ret_floatE1
	.def standard__math__cos__1__floatE1__ret_floatE1;
	.scl 2;
	.type 32;
	.endef
standard__math__cos__1__floatE1__ret_floatE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB5506:
	cvtss2sd %xmm0, %xmm0
	callq standard__math__cos__1__doubleE1__ret_doubleE1
	cvtsd2ss %xmm0, %xmm0
	leave
	ret
	.text
	.globl standard__math__tan__1__floatE1__ret_floatE1
	.def standard__math__tan__1__floatE1__ret_floatE1;
	.scl 2;
	.type 32;
	.endef
standard__math__tan__1__floatE1__ret_floatE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
.LB5512:
	movsd %xmm0, -8(%rbp)
	cvtss2sd %xmm0, %xmm0
	callq standard__math__cos__1__doubleE1__ret_doubleE1
	cvtsd2ss %xmm0, %xmm0
	movsd %xmm0, -16(%rbp)
	callq standard__math__abs__1__floatE1__ret_floatE1
	cvtss2sd %xmm0, %xmm0
	movabsq $4517329193108106637, %r10
	movq %r10, %xmm1
	ucomisd %xmm0, %xmm1
	ja .LB5521
.LB5522:
	movsd -8(%rbp), %xmm0
	cvtss2sd %xmm0, %xmm0
	callq standard__math__sin__1__doubleE1__ret_doubleE1
	cvtsd2ss %xmm0, %xmm0
	movsd -16(%rbp), %xmm1
	divss %xmm1, %xmm0
	leave
	ret
.LB5521:
	xorps %xmm0, %xmm0
	leave
	ret
	.text
	.globl standard__math__tan__1__doubleE1__ret_doubleE1
	.def standard__math__tan__1__doubleE1__ret_doubleE1;
	.scl 2;
	.type 32;
	.endef
standard__math__tan__1__doubleE1__ret_doubleE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
.LB5528:
	movsd %xmm0, -8(%rbp)
	callq standard__math__cos__1__doubleE1__ret_doubleE1
	movsd %xmm0, -16(%rbp)
	callq standard__math__abs__1__doubleE1__ret_doubleE1
	movabsq $4427486594234968593, %r10
	movq %r10, %xmm1
	ucomisd %xmm0, %xmm1
	ja .LB5536
.LB5537:
	movsd -8(%rbp), %xmm0
	callq standard__math__sin__1__doubleE1__ret_doubleE1
	movsd -16(%rbp), %xmm1
	divsd %xmm1, %xmm0
	leave
	ret
.LB5536:
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	leave
	ret
	.text
	.globl standard__math__atan__1__doubleE1__ret_doubleE1
	.def standard__math__atan__1__doubleE1__ret_doubleE1;
	.scl 2;
	.type 32;
	.endef
standard__math__atan__1__doubleE1__ret_doubleE1:
	subq $192, %rsp
.LB5544:
	xorps %xmm1, %xmm1
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm0, %xmm1
	seta %al
	movzbl %al, %eax
	testb %al, %al
	jne .LB5552
.LB5553:
.LB5554:
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm1, %xmm0
	seta %cl
	movzbl %cl, %ecx
	testb %cl, %cl
	jne .LB5561
.LB5562:
.LB5563:
	xorps %xmm2, %xmm2
	movabsq $1051372203, %r10
	movq %r10, %xmm3
	movabsq $1032350517, %r10
	movq %r10, %xmm4
	movabsq $1027804201, %r10
	movq %r10, %xmm5
	movaps %xmm0, %xmm1
	mulsd %xmm0, %xmm1
	subss %xmm3, %xmm2
	movabsq $1041385765, %r10
	movq %r10, %xmm3
	movsd %xmm2, 8(%rsp)
	xorps %xmm2, %xmm2
	subss %xmm3, %xmm2
	movabsq $1035611758, %r10
	movq %r10, %xmm3
	movsd %xmm2, (%rsp)
	xorps %xmm2, %xmm2
	movsd %xmm4, 176(%rsp)
	subss %xmm3, %xmm2
	xorps %xmm3, %xmm3
	subss %xmm4, %xmm3
	xorps %xmm4, %xmm4
	movsd %xmm4, 168(%rsp)
	subss %xmm5, %xmm4
	movsd %xmm5, 160(%rsp)
	movabsq $1018443406, %r10
	movq %r10, %xmm5
	movsd %xmm4, 152(%rsp)
	xorps %xmm4, %xmm4
	movsd %xmm4, 144(%rsp)
	subss %xmm5, %xmm4
	movsd %xmm5, 136(%rsp)
	movabsq $1007363965, %r10
	movq %r10, %xmm5
	movsd %xmm4, 128(%rsp)
	movsd %xmm5, 120(%rsp)
	cvtss2sd %xmm5, %xmm5
	cvtss2sd %xmm4, %xmm4
	movsd %xmm5, 112(%rsp)
	movsd %xmm4, 104(%rsp)
	vfmadd231sd %xmm1, %xmm5, %xmm4
	movabsq $1024818854, %r10
	movq %r10, %xmm5
	movsd %xmm4, 96(%rsp)
	movsd %xmm5, 88(%rsp)
	cvtss2sd %xmm5, %xmm5
	movsd %xmm5, 80(%rsp)
	vfmadd132sd %xmm1, %xmm5, %xmm4
	movsd %xmm4, 72(%rsp)
	movsd 152(%rsp), %xmm5
	cvtss2sd %xmm5, %xmm5
	movsd %xmm5, 64(%rsp)
	vfmadd132sd %xmm1, %xmm5, %xmm4
	movabsq $1030680939, %r10
	movq %r10, %xmm5
	movsd %xmm4, 56(%rsp)
	movsd %xmm5, 48(%rsp)
	cvtss2sd %xmm5, %xmm5
	cvtss2sd %xmm3, %xmm3
	cvtss2sd %xmm2, %xmm2
	movsd %xmm5, 40(%rsp)
	vfmadd132sd %xmm1, %xmm5, %xmm4
	movsd %xmm4, 32(%rsp)
	vfmadd231sd %xmm1, %xmm4, %xmm3
	movabsq $1033734037, %r10
	movq %r10, %xmm4
	movsd %xmm4, 24(%rsp)
	cvtss2sd %xmm4, %xmm4
	movsd %xmm4, 16(%rsp)
	vfmadd132sd %xmm1, %xmm4, %xmm3
	vfmadd231sd %xmm1, %xmm3, %xmm2
	movabsq $1038323256, %r10
	movq %r10, %xmm3
	cvtss2sd %xmm3, %xmm3
	vfmadd132sd %xmm1, %xmm3, %xmm2
	movsd (%rsp), %xmm3
	cvtss2sd %xmm3, %xmm3
	vfmadd132sd %xmm1, %xmm3, %xmm2
	movabsq $1045220557, %r10
	movq %r10, %xmm3
	cvtss2sd %xmm3, %xmm3
	vfmadd132sd %xmm1, %xmm3, %xmm2
	movsd 8(%rsp), %xmm3
	cvtss2sd %xmm3, %xmm3
	vfmadd132sd %xmm1, %xmm3, %xmm2
	movabsq $1065353216, %r10
	movq %r10, %xmm3
	cvtss2sd %xmm3, %xmm3
	vfmadd132sd %xmm2, %xmm3, %xmm1
	mulsd %xmm1, %xmm0
	testb %cl, %cl
	jne .LB5630
.LB5631:
.LB5632:
	testb %al, %al
	jne .LB5636
.LB5637:
	addq $192, %rsp
	ret
.LB5552:
	xorps %xmm1, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subsd %xmm15, %xmm0
	jmp .LB5554
.LB5561:
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	divsd %xmm15, %xmm0
	jmp .LB5563
.LB5630:
	movabsq $4609753056924675352, %r10
	movq %r10, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subsd %xmm15, %xmm0
	testb %al, %al
	je .LB5637
.LB5636:
	xorps %xmm1, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subsd %xmm15, %xmm0
	addq $192, %rsp
	ret
	.text
	.globl standard__math__atan__1__floatE1__ret_floatE1
	.def standard__math__atan__1__floatE1__ret_floatE1;
	.scl 2;
	.type 32;
	.endef
standard__math__atan__1__floatE1__ret_floatE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB5642:
	cvtss2sd %xmm0, %xmm0
	callq standard__math__atan__1__doubleE1__ret_doubleE1
	cvtsd2ss %xmm0, %xmm0
	leave
	ret
	.text
	.globl standard__math__sign__1__dataE1_sbits8__ret_dataE1_sbits8
	.def standard__math__sign__1__dataE1_sbits8__ret_dataE1_sbits8;
	.scl 2;
	.type 32;
	.endef
standard__math__sign__1__dataE1_sbits8__ret_dataE1_sbits8:
.LB5648:
	testb %cl, %cl
	jg .LB5653
.LB5654:
	testb %cl, %cl
	js .LB5660
.LB5661:
	xorl %eax, %eax
	ret
.LB5660:
	movl $255, %eax
	ret
.LB5653:
	movl $1, %eax
	ret
	.text
	.globl standard__math__sign__1__dataE1_sbits16__ret_dataE1_sbits16
	.def standard__math__sign__1__dataE1_sbits16__ret_dataE1_sbits16;
	.scl 2;
	.type 32;
	.endef
standard__math__sign__1__dataE1_sbits16__ret_dataE1_sbits16:
.LB5666:
	testw %cx, %cx
	jg .LB5671
.LB5672:
	testw %cx, %cx
	js .LB5678
.LB5679:
	xorl %eax, %eax
	ret
.LB5678:
	movl $65535, %eax
	ret
.LB5671:
	movl $1, %eax
	ret
	.text
	.globl standard__math__sign__1__dataE1_sbits32__ret_dataE1_sbits32
	.def standard__math__sign__1__dataE1_sbits32__ret_dataE1_sbits32;
	.scl 2;
	.type 32;
	.endef
standard__math__sign__1__dataE1_sbits32__ret_dataE1_sbits32:
.LB5684:
	testl %ecx, %ecx
	jg .LB5688
.LB5689:
	testl %ecx, %ecx
	js .LB5693
.LB5694:
	xorl %eax, %eax
	ret
.LB5693:
	movabsq $4294967295, %rax
	ret
.LB5688:
	movl $1, %eax
	ret
	.text
	.globl standard__math__sign__1__dataE1_sbits64__ret_dataE1_sbits64
	.def standard__math__sign__1__dataE1_sbits64__ret_dataE1_sbits64;
	.scl 2;
	.type 32;
	.endef
standard__math__sign__1__dataE1_sbits64__ret_dataE1_sbits64:
.LB5697:
	testq %rcx, %rcx
	jg .LB5702
.LB5703:
	testq %rcx, %rcx
	js .LB5709
.LB5710:
	xorl %eax, %eax
	ret
.LB5709:
	movq $-1, %rax
	ret
.LB5702:
	movl $1, %eax
	ret
	.text
	.globl standard__math__sign__1__floatE1__ret_floatE1
	.def standard__math__sign__1__floatE1__ret_floatE1;
	.scl 2;
	.type 32;
	.endef
standard__math__sign__1__floatE1__ret_floatE1:
.LB5715:
	xorps %xmm1, %xmm1
	ucomiss %xmm1, %xmm0
	ja .LB5719
.LB5720:
	xorps %xmm1, %xmm1
	ucomiss %xmm0, %xmm1
	ja .LB5724
.LB5725:
	xorps %xmm0, %xmm0
	ret
.LB5724:
	xorps %xmm0, %xmm0
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	subss %xmm1, %xmm0
	ret
.LB5719:
	movabsq $1065353216, %r10
	movq %r10, %xmm0
	ret
	.text
	.globl standard__math__sign__1__doubleE1__ret_doubleE1
	.def standard__math__sign__1__doubleE1__ret_doubleE1;
	.scl 2;
	.type 32;
	.endef
standard__math__sign__1__doubleE1__ret_doubleE1:
.LB5728:
	xorps %xmm1, %xmm1
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm1, %xmm0
	ja .LB5733
.LB5734:
	xorps %xmm1, %xmm1
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm0, %xmm1
	ja .LB5740
.LB5741:
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	ret
.LB5740:
	xorps %xmm0, %xmm0
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	subss %xmm1, %xmm0
	cvtss2sd %xmm0, %xmm0
	ret
.LB5733:
	movabsq $1065353216, %r10
	movq %r10, %xmm0
	cvtss2sd %xmm0, %xmm0
	ret
	.text
	.globl standard__system__windows__Window.__init__5__byteE1_ptr1__intE1__intE1__intE1__intE1__ret_thisE1
	.def standard__system__windows__Window.__init__5__byteE1_ptr1__intE1__intE1__intE1__intE1__ret_thisE1;
	.scl 2;
	.type 32;
	.endef
standard__system__windows__Window.__init__5__byteE1_ptr1__intE1__intE1__intE1__intE1__ret_thisE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $272, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
	movq %r14, -48(%rbp)
	movq %r15, -56(%rbp)
.LB5746:
	movq %rcx, %rbx
	movl %r9d, %r12d
	movq %rdx, -160(%rbp)
	movq %r8, -168(%rbp)
	movl 48(%rbp), %r13d
	movl 56(%rbp), %r14d
	movl %r8d, 24(%rbx)
	movl %r12d, 28(%rbx)
	xorl %ecx, %ecx
	movl %r13d, 32(%rbx)
	movl %r14d, 36(%rbx)
	movb $0, 40(%rbx)
	callq GetModuleHandleA
	movl $256, %ecx
	movq %rax, 8(%rbx)
	leaq 41(%rbx), %rax
	movl $1262830665, -69(%rbp)
	movl $1767317569, -65(%rbp)
	movl $2003788910, -61(%rbp)
	movb $0, -57(%rbp)
	movq %rax, %r15
	xorl %eax, %eax
	movq %r15, %rdi
	rep stosb
	leaq -69(%rbp), %rax
	movq %rax, %rsi
	movq %r15, %rdi
	movl $13, %ecx
	rep movsb
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -152(%rbp)
	vmovdqu .LZERO+32(%rip), %ymm15
	vmovdqu %ymm15, -120(%rbp)
	movups .LZERO+64(%rip), %xmm15
	movups %xmm15, -88(%rbp)
	vzeroupper
	movl $80, -152(%rbp)
	movl standard__system__windows__CS_HREDRAW(%rip), %eax
	movl standard__system__windows__CS_VREDRAW(%rip), %ecx
	orl %ecx, %eax
	movl standard__system__windows__CS_OWNDC(%rip), %ecx
	orl %ecx, %eax
	movl %eax, -148(%rbp)
	leaq DefWindowProcA(%rip), %rax
	movq %rax, -144(%rbp)
	movl $0, -136(%rbp)
	movl $0, -132(%rbp)
	movq 8(%rbx), %rax
	movq %rax, -128(%rbp)
	xorl %ecx, %ecx
	movl $32512, %edx
	callq LoadIconA
	movq %rax, -120(%rbp)
	xorl %ecx, %ecx
	movl $32512, %edx
	callq LoadCursorA
	movq %rax, -112(%rbp)
	movl standard__system__windows__BLACK_BRUSH(%rip), %ecx
	callq GetStockObject
	leaq -152(%rbp), %rcx
	movq %rax, -104(%rbp)
	movq $0, -96(%rbp)
	movq %r15, -88(%rbp)
	movq $0, -80(%rbp)
	callq RegisterClassExA
	movl standard__system__windows__WS_EX_APPWINDOW(%rip), %ecx
	movl standard__system__windows__WS_OVERLAPPEDWINDOW(%rip), %eax
	movl standard__system__windows__WS_VISIBLE(%rip), %edx
	movl %eax, %r9d
	orl %edx, %r9d
	movq 8(%rbx), %rax
	movq STDLIB_GVP(%rip), %rdx
	movq %r13, 32(%rsp)
	movq %r14, 40(%rsp)
	movq -168(%rbp), %rsi
	movq %rsi, 48(%rsp)
	movq %r12, 56(%rsp)
	movq $0, 64(%rsp)
	movq $0, 72(%rsp)
	movq %rax, 80(%rsp)
	movq %rdx, 88(%rsp)
	movq -160(%rbp), %r8
	movq %r15, %rdx
	callq CreateWindowExA
	movq %rax, %rcx
	movq %rcx, (%rbx)
	callq GetDC
	movq %rax, 16(%rbx)
	movq (%rbx), %rcx
	movl standard__system__windows__SW_SHOW(%rip), %edx
	callq ShowWindow
	movq (%rbx), %rcx
	callq UpdateWindow
	movb $1, 40(%rbx)
	movq %rbx, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
	.text
	.globl standard__system__windows__Window.__exit__0__ret_voidE1
	.def standard__system__windows__Window.__exit__0__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__system__windows__Window.__exit__0__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
.LB5851:
	movq %rcx, %rsi
	movq 16(%rsi), %rdx
	testq %rdx, %rdx
	jne .LB5856
.LB5858:
	leaq 41(%rsi), %rax
	movq 8(%rsi), %rdx
	movq %rax, %rcx
	callq UnregisterClassA
	movq -8(%rbp), %rsi
	leave
	ret
.LB5856:
	movq (%rsi), %rcx
	callq ReleaseDC
	jmp .LB5858
	.text
	.globl standard__system__windows__Window.set_title__1__byteE1_ptr1__ret_voidE1
	.def standard__system__windows__Window.set_title__1__byteE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__system__windows__Window.set_title__1__byteE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB5869:
	movq (%rcx), %rcx
	callq SetWindowTextA
	leave
	ret
	.text
	.globl standard__system__windows__Window.process_messages__0__ret_boolE1
	.def standard__system__windows__Window.process_messages__0__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__system__windows__Window.process_messages__0__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $96, %rsp
.LB5875:
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -48(%rbp)
	movups .LZERO+32(%rip), %xmm15
	movups %xmm15, -16(%rbp)
	vzeroupper
.LB5877:
	movl standard__system__windows__PM_REMOVE(%rip), %eax
	leaq -48(%rbp), %rcx
	movq %rax, 32(%rsp)
	xorl %edx, %edx
	xorl %r8d, %r8d
	xorl %r9d, %r9d
	callq PeekMessageA
	testb %al, %al
	je .LB5879
.LB5878:
	movl -40(%rbp), %eax
	movl standard__system__windows__WM_QUIT(%rip), %ecx
	cmpl %ecx, %eax
	je .LB5889
.LB5890:
	leaq -48(%rbp), %rcx
	callq TranslateMessage
	leaq -48(%rbp), %rcx
	callq DispatchMessageA
	jmp .LB5877
.LB5879:
	movl $1, %eax
	leave
	ret
.LB5889:
	xorl %eax, %eax
	leave
	ret
	.text
	.globl OpenGL__GLContext.__init__1__dataE1_ubits64__ret_thisE1
	.def OpenGL__GLContext.__init__1__dataE1_ubits64__ret_thisE1;
	.scl 2;
	.type 32;
	.endef
OpenGL__GLContext.__init__1__dataE1_ubits64__ret_thisE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
.LB7038:
	movq %rcx, %rsi
	movq %rdx, %rcx
	movq %rcx, (%rsi)
	callq OpenGL__setup_opengl__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, 8(%rsi)
	movb $0, 16(%rsi)
	movq %rsi, %rax
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl OpenGL__GLContext.__exit__0__ret_voidE1
	.def OpenGL__GLContext.__exit__0__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
OpenGL__GLContext.__exit__0__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
.LB7046:
	movq %rcx, %rsi
	cmpq $0, 8(%rsi)
	jne .LB7051
.LB7052:
	movq -8(%rbp), %rsi
	leave
	ret
.LB7051:
	xorl %ecx, %ecx
	xorl %edx, %edx
	callq wglMakeCurrent
	movq 8(%rsi), %rcx
	callq wglDeleteContext
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl OpenGL__GLContext.load_extensions__0__ret_voidE1
	.def OpenGL__GLContext.load_extensions__0__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
OpenGL__GLContext.load_extensions__0__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
.LB7060:
	movq %rcx, %rsi
	callq OpenGL__gl_load_extensions__0__ret_voidE1
	movb $1, 16(%rsi)
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl OpenGL__GLContext.present__0__ret_voidE1
	.def OpenGL__GLContext.present__0__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
OpenGL__GLContext.present__0__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB7062:
	movq (%rcx), %rcx
	callq SwapBuffers
	leave
	ret
	.text
	.globl OpenGL__GLContext.set_clear_color__4__floatE1__floatE1__floatE1__floatE1__ret_voidE1
	.def OpenGL__GLContext.set_clear_color__4__floatE1__floatE1__floatE1__floatE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
OpenGL__GLContext.set_clear_color__4__floatE1__floatE1__floatE1__floatE1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB7065:
	movaps %xmm1, %xmm0
	movaps %xmm2, %xmm1
	movaps %xmm3, %xmm2
	movss 48(%rbp), %xmm3
	callq glClearColor
	leave
	ret
	.text
	.globl OpenGL__GLContext.clear__0__ret_voidE1
	.def OpenGL__GLContext.clear__0__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
OpenGL__GLContext.clear__0__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB7074:
	movl GL_COLOR_BUFFER_BIT(%rip), %eax
	movl GL_DEPTH_BUFFER_BIT(%rip), %ecx
	orl %eax, %ecx
	callq glClear
	leave
	ret
	.text
	.globl OpenGL__setup_opengl__1__dataE1_ubits64__ret_dataE1_ubits64
	.def OpenGL__setup_opengl__1__dataE1_ubits64__ret_dataE1_ubits64;
	.scl 2;
	.type 32;
	.endef
OpenGL__setup_opengl__1__dataE1_ubits64__ret_dataE1_ubits64:
	pushq %rbp
	movq %rsp, %rbp
	subq $96, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB5894:
	movq %rcx, %rsi
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -56(%rbp)
	movq .LZERO+32(%rip), %r10
	movq %r10, -24(%rbp)
	vzeroupper
	movw $40, -56(%rbp)
	movw $1, -54(%rbp)
	movl PFD_DRAW_TO_WINDOW(%rip), %eax
	movl PFD_SUPPORT_OPENGL(%rip), %ecx
	leaq -56(%rbp), %rdx
	orl %ecx, %eax
	movl PFD_DOUBLEBUFFER(%rip), %ecx
	orl %ecx, %eax
	movq %rsi, %rcx
	movl %eax, -52(%rbp)
	movzbl PFD_TYPE_RGBA(%rip), %eax
	movb %al, -48(%rbp)
	movb $32, -47(%rbp)
	movw $2072, -33(%rbp)
	movzbl PFD_MAIN_PLANE(%rip), %eax
	movb %al, -30(%rbp)
	callq ChoosePixelFormat
	movl %eax, %edx
	leaq -56(%rbp), %r8
	movq %rsi, %rcx
	callq SetPixelFormat
	movq %rsi, %rcx
	callq wglCreateContext
	movq %rax, %rdi
	movq %rsi, %rcx
	movq %rdi, %rdx
	callq wglMakeCurrent
	movq %rdi, %rax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
	.text
	.globl OpenGL__swap_buffers__1__dataE1_ubits64__ret_voidE1
	.def OpenGL__swap_buffers__1__dataE1_ubits64__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
OpenGL__swap_buffers__1__dataE1_ubits64__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB5931:
	callq SwapBuffers
	leave
	ret
	.text
	.globl OpenGL__gl_load_extensions__0__ret_voidE1
	.def OpenGL__gl_load_extensions__0__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
OpenGL__gl_load_extensions__0__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $976, %rsp
.LB5935:
	leaq -13(%rbp), %rcx
	movl $1699179623, -13(%rbp)
	movl $1718960750, -9(%rbp)
	movl $1936876902, -5(%rbp)
	movb $0, -1(%rbp)
	callq wglGetProcAddress
	leaq -29(%rbp), %rcx
	movq %rax, OpenGL___glGenBuffers(%rip)
	movl $1698983015, -29(%rbp)
	movl $1702126956, -25(%rbp)
	movl $1717990722, -21(%rbp)
	movl $7565925, -17(%rbp)
	callq wglGetProcAddress
	leaq -42(%rbp), %rcx
	movq %rax, OpenGL___glDeleteBuffers(%rip)
	movl $1765960807, -42(%rbp)
	movl $1967285358, -38(%rbp)
	movl $1919247974, -34(%rbp)
	movb $0, -30(%rbp)
	callq wglGetProcAddress
	leaq -55(%rbp), %rcx
	movq %rax, OpenGL___glBindBuffer(%rip)
	movl $1967287399, -55(%rbp)
	movl $1919247974, -51(%rbp)
	movl $1635017028, -47(%rbp)
	movb $0, -43(%rbp)
	callq wglGetProcAddress
	leaq -71(%rbp), %rcx
	movq %rax, OpenGL___glBufferData(%rip)
	movl $1967287399, -71(%rbp)
	movl $1919247974, -67(%rbp)
	movl $1147303251, -63(%rbp)
	movl $6386785, -59(%rbp)
	callq wglGetProcAddress
	leaq -83(%rbp), %rcx
	movq %rax, OpenGL___glBufferSubData(%rip)
	movl $1632463975, -83(%rbp)
	movl $1718960752, -79(%rbp)
	movl $7497062, -75(%rbp)
	callq wglGetProcAddress
	leaq -97(%rbp), %rcx
	movq %rax, OpenGL___glMapBuffer(%rip)
	movl $1851092071, -97(%rbp)
	movl $1114661229, -93(%rbp)
	movl $1701209717, -89(%rbp)
	movw $114, -85(%rbp)
	callq wglGetProcAddress
	leaq -115(%rbp), %rcx
	movq %rax, OpenGL___glUnmapBuffer(%rip)
	movl $1699179623, -115(%rbp)
	movl $1919243886, -111(%rbp)
	movl $1098409332, -107(%rbp)
	movl $2036429426, -103(%rbp)
	movw $115, -99(%rbp)
	callq wglGetProcAddress
	leaq -136(%rbp), %rcx
	movq %rax, OpenGL___glGenVertexArrays(%rip)
	movl $1698983015, -136(%rbp)
	movl $1702126956, -132(%rbp)
	movl $1953654102, -128(%rbp)
	movl $1916893285, -124(%rbp)
	movl $1937334642, -120(%rbp)
	movb $0, -116(%rbp)
	callq wglGetProcAddress
	leaq -154(%rbp), %rcx
	movq %rax, OpenGL___glDeleteVertexArrays(%rip)
	movl $1765960807, -154(%rbp)
	movl $1700160622, -150(%rbp)
	movl $2019914866, -146(%rbp)
	movl $1634890305, -142(%rbp)
	movw $121, -138(%rbp)
	callq wglGetProcAddress
	leaq -180(%rbp), %rcx
	movq %rax, OpenGL___glBindVertexArray(%rip)
	movl $1850043495, -180(%rbp)
	movl $1701601889, -176(%rbp)
	movl $1953654102, -172(%rbp)
	movl $1950447717, -168(%rbp)
	movl $1651077748, -164(%rbp)
	movl $1634890305, -160(%rbp)
	movw $121, -156(%rbp)
	callq wglGetProcAddress
	leaq -207(%rbp), %rcx
	movq %rax, OpenGL___glEnableVertexAttribArray(%rip)
	movl $1766091879, -207(%rbp)
	movl $1818386803, -203(%rbp)
	movl $1919243877, -199(%rbp)
	movl $1098409332, -195(%rbp)
	movl $1769108596, -191(%rbp)
	movl $1920090466, -187(%rbp)
	movw $31073, -183(%rbp)
	movb $0, -181(%rbp)
	callq wglGetProcAddress
	leaq -229(%rbp), %rcx
	movq %rax, OpenGL___glDisableVertexAttribArray(%rip)
	movl $1700162663, -229(%rbp)
	movl $2019914866, -225(%rbp)
	movl $1920234561, -221(%rbp)
	movl $1867539049, -217(%rbp)
	movl $1702129257, -213(%rbp)
	movw $114, -209(%rbp)
	callq wglGetProcAddress
	leaq -244(%rbp), %rcx
	movq %rax, OpenGL___glVertexAttribPointer(%rip)
	movl $1917021287, -244(%rbp)
	movl $1702125925, -240(%rbp)
	movl $1684105299, -236(%rbp)
	movw $29285, -232(%rbp)
	movb $0, -230(%rbp)
	callq wglGetProcAddress
	leaq -259(%rbp), %rcx
	movq %rax, OpenGL___glCreateShader(%rip)
	movl $1698983015, -259(%rbp)
	movl $1702126956, -255(%rbp)
	movl $1684105299, -251(%rbp)
	movw $29285, -247(%rbp)
	movb $0, -245(%rbp)
	callq wglGetProcAddress
	leaq -274(%rbp), %rcx
	movq %rax, OpenGL___glDeleteShader(%rip)
	movl $1750297703, -274(%rbp)
	movl $1919247457, -270(%rbp)
	movl $1920298835, -266(%rbp)
	movw $25955, -262(%rbp)
	movb $0, -260(%rbp)
	callq wglGetProcAddress
	leaq -290(%rbp), %rcx
	movq %rax, OpenGL___glShaderSource(%rip)
	movl $1866689639, -290(%rbp)
	movl $1818849389, -286(%rbp)
	movl $1634227045, -282(%rbp)
	movl $7497060, -278(%rbp)
	callq wglGetProcAddress
	leaq -304(%rbp), %rcx
	movq %rax, OpenGL___glCompileShader(%rip)
	movl $1699179623, -304(%rbp)
	movl $1634227060, -300(%rbp)
	movl $1769104740, -296(%rbp)
	movw $118, -292(%rbp)
	callq wglGetProcAddress
	leaq -323(%rbp), %rcx
	movq %rax, OpenGL___glGetShaderiv(%rip)
	movl $1699179623, -323(%rbp)
	movl $1634227060, -319(%rbp)
	movl $1232233828, -315(%rbp)
	movl $1282369134, -311(%rbp)
	movw $26479, -307(%rbp)
	movb $0, -305(%rbp)
	callq wglGetProcAddress
	leaq -339(%rbp), %rcx
	movq %rax, OpenGL___glGetShaderInfoLog(%rip)
	movl $1917021287, -339(%rbp)
	movl $1702125925, -335(%rbp)
	movl $1735357008, -331(%rbp)
	movl $7168370, -327(%rbp)
	callq wglGetProcAddress
	leaq -355(%rbp), %rcx
	movq %rax, OpenGL___glCreateProgram(%rip)
	movl $1698983015, -355(%rbp)
	movl $1702126956, -351(%rbp)
	movl $1735357008, -347(%rbp)
	movl $7168370, -343(%rbp)
	callq wglGetProcAddress
	leaq -370(%rbp), %rcx
	movq %rax, OpenGL___glDeleteProgram(%rip)
	movl $1950444647, -370(%rbp)
	movl $1751343476, -366(%rbp)
	movl $1684105299, -362(%rbp)
	movw $29285, -358(%rbp)
	movb $0, -356(%rbp)
	callq wglGetProcAddress
	leaq -385(%rbp), %rcx
	movq %rax, OpenGL___glAttachShader(%rip)
	movl $1698983015, -385(%rbp)
	movl $1751343476, -381(%rbp)
	movl $1684105299, -377(%rbp)
	movw $29285, -373(%rbp)
	movb $0, -371(%rbp)
	callq wglGetProcAddress
	leaq -399(%rbp), %rcx
	movq %rax, OpenGL___glDetachShader(%rip)
	movl $1766616167, -399(%rbp)
	movl $1917873006, -395(%rbp)
	movl $1634887535, -391(%rbp)
	movw $109, -387(%rbp)
	callq wglGetProcAddress
	leaq -412(%rbp), %rcx
	movq %rax, OpenGL___glLinkProgram(%rip)
	movl $1934978151, -412(%rbp)
	movl $1869762661, -408(%rbp)
	movl $1835102823, -404(%rbp)
	movb $0, -400(%rbp)
	callq wglGetProcAddress
	leaq -427(%rbp), %rcx
	movq %rax, OpenGL___glUseProgram(%rip)
	movl $1699179623, -427(%rbp)
	movl $1869762676, -423(%rbp)
	movl $1835102823, -419(%rbp)
	movw $30313, -415(%rbp)
	movb $0, -413(%rbp)
	callq wglGetProcAddress
	leaq -447(%rbp), %rcx
	movq %rax, OpenGL___glGetProgramiv(%rip)
	movl $1699179623, -447(%rbp)
	movl $1869762676, -443(%rbp)
	movl $1835102823, -439(%rbp)
	movl $1868983881, -435(%rbp)
	movl $6778700, -431(%rbp)
	callq wglGetProcAddress
	leaq -468(%rbp), %rcx
	movq %rax, OpenGL___glGetProgramInfoLog(%rip)
	movl $1765960807, -468(%rbp)
	movl $1950442606, -464(%rbp)
	movl $1651077748, -460(%rbp)
	movl $1633906508, -456(%rbp)
	movl $1852795252, -452(%rbp)
	movb $0, -448(%rbp)
	callq wglGetProcAddress
	leaq -489(%rbp), %rcx
	movq %rax, OpenGL___glBindAttribLocation(%rip)
	movl $1699179623, -489(%rbp)
	movl $1768838516, -485(%rbp)
	movl $1836216166, -481(%rbp)
	movl $1633906508, -477(%rbp)
	movl $1852795252, -473(%rbp)
	movb $0, -469(%rbp)
	callq wglGetProcAddress
	leaq -501(%rbp), %rcx
	movq %rax, OpenGL___glGetUniformLocation(%rip)
	movl $1851092071, -501(%rbp)
	movl $1919903337, -497(%rbp)
	movl $6893933, -493(%rbp)
	callq wglGetProcAddress
	leaq -513(%rbp), %rcx
	movq %rax, OpenGL___glUniform1i(%rip)
	movl $1851092071, -513(%rbp)
	movl $1919903337, -509(%rbp)
	movl $6697325, -505(%rbp)
	callq wglGetProcAddress
	leaq -525(%rbp), %rcx
	movq %rax, OpenGL___glUniform1f(%rip)
	movl $1851092071, -525(%rbp)
	movl $1919903337, -521(%rbp)
	movl $6697581, -517(%rbp)
	callq wglGetProcAddress
	leaq -537(%rbp), %rcx
	movq %rax, OpenGL___glUniform2f(%rip)
	movl $1851092071, -537(%rbp)
	movl $1919903337, -533(%rbp)
	movl $6697837, -529(%rbp)
	callq wglGetProcAddress
	leaq -549(%rbp), %rcx
	movq %rax, OpenGL___glUniform3f(%rip)
	movl $1851092071, -549(%rbp)
	movl $1919903337, -545(%rbp)
	movl $6698093, -541(%rbp)
	callq wglGetProcAddress
	leaq -562(%rbp), %rcx
	movq %rax, OpenGL___glUniform4f(%rip)
	movl $1851092071, -562(%rbp)
	movl $1919903337, -558(%rbp)
	movl $1986605421, -554(%rbp)
	movb $0, -550(%rbp)
	callq wglGetProcAddress
	leaq -575(%rbp), %rcx
	movq %rax, OpenGL___glUniform1iv(%rip)
	movl $1851092071, -575(%rbp)
	movl $1919903337, -571(%rbp)
	movl $1986409069, -567(%rbp)
	movb $0, -563(%rbp)
	callq wglGetProcAddress
	leaq -588(%rbp), %rcx
	movq %rax, OpenGL___glUniform2fv(%rip)
	movl $1851092071, -588(%rbp)
	movl $1919903337, -584(%rbp)
	movl $1986409325, -580(%rbp)
	movb $0, -576(%rbp)
	callq wglGetProcAddress
	leaq -601(%rbp), %rcx
	movq %rax, OpenGL___glUniform3fv(%rip)
	movl $1851092071, -601(%rbp)
	movl $1919903337, -597(%rbp)
	movl $1986409581, -593(%rbp)
	movb $0, -589(%rbp)
	callq wglGetProcAddress
	leaq -617(%rbp), %rcx
	movq %rax, OpenGL___glUniform4fv(%rip)
	movl $1851092071, -617(%rbp)
	movl $1919903337, -613(%rbp)
	movl $1952533869, -609(%rbp)
	movl $7759412, -605(%rbp)
	callq wglGetProcAddress
	leaq -635(%rbp), %rcx
	movq %rax, OpenGL___glUniformMat4fv(%rip)
	movl $1699179623, -635(%rbp)
	movl $1634879086, -631(%rbp)
	movl $1969382765, -627(%rbp)
	movl $1919247974, -623(%rbp)
	movw $115, -619(%rbp)
	callq wglGetProcAddress
	leaq -656(%rbp), %rcx
	movq %rax, OpenGL___glGenFramebuffers(%rip)
	movl $1698983015, -656(%rbp)
	movl $1702126956, -652(%rbp)
	movl $1835102790, -648(%rbp)
	movl $1718968933, -644(%rbp)
	movl $1936876902, -640(%rbp)
	movb $0, -636(%rbp)
	callq wglGetProcAddress
	leaq -674(%rbp), %rcx
	movq %rax, OpenGL___glDeleteFramebuffers(%rip)
	movl $1765960807, -674(%rbp)
	movl $1917215854, -670(%rbp)
	movl $1650814305, -666(%rbp)
	movl $1701209717, -662(%rbp)
	movw $114, -658(%rbp)
	callq wglGetProcAddress
	leaq -697(%rbp), %rcx
	movq %rax, OpenGL___glBindFramebuffer(%rip)
	movl $1917217895, -697(%rbp)
	movl $1650814305, -693(%rbp)
	movl $1701209717, -689(%rbp)
	movl $2019906674, -685(%rbp)
	movl $1701999988, -681(%rbp)
	movw $17458, -677(%rbp)
	movb $0, -675(%rbp)
	callq wglGetProcAddress
	leaq -722(%rbp), %rcx
	movq %rax, OpenGL___glFramebufferTexture2D(%rip)
	movl $1749249127, -722(%rbp)
	movl $1181442917, -718(%rbp)
	movl $1701667186, -714(%rbp)
	movl $1717990754, -710(%rbp)
	movl $1951625829, -706(%rbp)
	movl $1937077345, -702(%rbp)
	movb $0, -698(%rbp)
	callq wglGetProcAddress
	leaq -741(%rbp), %rcx
	movq %rax, OpenGL___glCheckFramebufferStatus(%rip)
	movl $1699179623, -741(%rbp)
	movl $1852133998, -737(%rbp)
	movl $1651664228, -733(%rbp)
	movl $1701209717, -729(%rbp)
	movw $29554, -725(%rbp)
	movb $0, -723(%rbp)
	callq wglGetProcAddress
	leaq -763(%rbp), %rcx
	movq %rax, OpenGL___glGenRenderbuffers(%rip)
	movl $1698983015, -763(%rbp)
	movl $1702126956, -759(%rbp)
	movl $1684956498, -755(%rbp)
	movl $1969386085, -751(%rbp)
	movl $1919247974, -747(%rbp)
	movw $115, -743(%rbp)
	callq wglGetProcAddress
	leaq -782(%rbp), %rcx
	movq %rax, OpenGL___glDeleteRenderbuffers(%rip)
	movl $1765960807, -782(%rbp)
	movl $1699898478, -778(%rbp)
	movl $1919247470, -774(%rbp)
	movl $1717990754, -770(%rbp)
	movw $29285, -766(%rbp)
	movb $0, -764(%rbp)
	callq wglGetProcAddress
	leaq -804(%rbp), %rcx
	movq %rax, OpenGL___glBindRenderbuffer(%rip)
	movl $1699900519, -804(%rbp)
	movl $1919247470, -800(%rbp)
	movl $1717990754, -796(%rbp)
	movl $1951625829, -792(%rbp)
	movl $1734439535, -788(%rbp)
	movw $101, -784(%rbp)
	callq wglGetProcAddress
	leaq -830(%rbp), %rcx
	movq %rax, OpenGL___glRenderbufferStorage(%rip)
	movl $1917217895, -830(%rbp)
	movl $1650814305, -826(%rbp)
	movl $1701209717, -822(%rbp)
	movl $1852134002, -818(%rbp)
	movl $1651664228, -814(%rbp)
	movl $1701209717, -810(%rbp)
	movw $114, -806(%rbp)
	callq wglGetProcAddress
	leaq -847(%rbp), %rcx
	movq %rax, OpenGL___glFramebufferRenderbuffer(%rip)
	movl $1699179623, -847(%rbp)
	movl $1634887022, -843(%rbp)
	movl $1766679924, -839(%rbp)
	movl $1885433200, -835(%rbp)
	movb $0, -831(%rbp)
	callq wglGetProcAddress
	leaq -863(%rbp), %rcx
	movq %rax, OpenGL___glGenerateMipmap(%rip)
	movl $1665231975, -863(%rbp)
	movl $1702259060, -859(%rbp)
	movl $1954047316, -855(%rbp)
	movl $6648437, -851(%rbp)
	callq wglGetProcAddress
	leaq -876(%rbp), %rcx
	movq %rax, OpenGL___glActiveTexture(%rip)
	movl $1917086823, -876(%rbp)
	movl $1916893025, -872(%rbp)
	movl $1937334642, -868(%rbp)
	movb $0, -864(%rbp)
	callq wglGetProcAddress
	leaq -891(%rbp), %rcx
	movq %rax, OpenGL___glDrawArrays(%rip)
	movl $1917086823, -891(%rbp)
	movl $1816491873, -887(%rbp)
	movl $1852140901, -883(%rbp)
	movw $29556, -879(%rbp)
	movb $0, -877(%rbp)
	callq wglGetProcAddress
	leaq -913(%rbp), %rcx
	movq %rax, OpenGL___glDrawElements(%rip)
	movl $1917086823, -913(%rbp)
	movl $1916893025, -909(%rbp)
	movl $1937334642, -905(%rbp)
	movl $1953721929, -901(%rbp)
	movl $1701015137, -897(%rbp)
	movw $100, -893(%rbp)
	callq wglGetProcAddress
	leaq -937(%rbp), %rcx
	movq %rax, OpenGL___glDrawArraysInstanced(%rip)
	movl $1917086823, -937(%rbp)
	movl $1816491873, -933(%rbp)
	movl $1852140901, -929(%rbp)
	movl $1850307444, -925(%rbp)
	movl $1851880563, -921(%rbp)
	movl $6579555, -917(%rbp)
	callq wglGetProcAddress
	movq %rax, OpenGL___glDrawElementsInstanced(%rip)
	leave
	ret
	.text
	.globl standard__atomic__store32__2__dataE1_ptr1_sbits32__dataE1_sbits32__ret_voidE1
	.def standard__atomic__store32__2__dataE1_ptr1_sbits32__dataE1_sbits32__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__atomic__store32__2__dataE1_ptr1_sbits32__dataE1_sbits32__ret_voidE1:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
.LB7078:
	movq %rcx, %rsi
	                movl %edx, %eax
	                xchgl %eax, (%rsi)
	movq 0(%rsp), %rsi
	addq $16, %rsp
	ret
	.text
	.globl standard__atomic___fetch_add32__3__dataE1_ptr1_sbits32__dataE1_sbits32__dataE1_ptr1_sbits32__ret_voidE1
	.def standard__atomic___fetch_add32__3__dataE1_ptr1_sbits32__dataE1_sbits32__dataE1_ptr1_sbits32__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__atomic___fetch_add32__3__dataE1_ptr1_sbits32__dataE1_sbits32__dataE1_ptr1_sbits32__ret_voidE1:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
	movq %rdi, -8(%rsp)
.LB7083:
	movq %rcx, %rsi
	                movq %r8, %rdi
	                movl %edx, %eax
	                lock xaddl %eax, (%rsi)
	                movl %eax, (%rdi)
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
	.text
	.globl standard__atomic__fetch_add32__2__dataE1_ptr1_sbits32__dataE1_sbits32__ret_dataE1_sbits32
	.def standard__atomic__fetch_add32__2__dataE1_ptr1_sbits32__dataE1_sbits32__ret_dataE1_sbits32;
	.scl 2;
	.type 32;
	.endef
standard__atomic__fetch_add32__2__dataE1_ptr1_sbits32__dataE1_sbits32__ret_dataE1_sbits32:
	subq $32, %rsp
	movq %rsi, 16(%rsp)
	movq %rdi, 8(%rsp)
.LB7090:
	movl $0, 4(%rsp)
	leaq 4(%rsp), %r8
	movq %rcx, %rsi
	                movq %r8, %rdi
	                movl %edx, %eax
	                lock xaddl %eax, (%rsi)
	                movl %eax, (%rdi)
	movl 4(%rsp), %eax
	movq 16(%rsp), %rsi
	movq 8(%rsp), %rdi
	addq $32, %rsp
	ret
	.text
	.globl standard__atomic__fetch_sub32__2__dataE1_ptr1_sbits32__dataE1_sbits32__ret_dataE1_sbits32
	.def standard__atomic__fetch_sub32__2__dataE1_ptr1_sbits32__dataE1_sbits32__ret_dataE1_sbits32;
	.scl 2;
	.type 32;
	.endef
standard__atomic__fetch_sub32__2__dataE1_ptr1_sbits32__dataE1_sbits32__ret_dataE1_sbits32:
	subq $32, %rsp
	movq %rsi, 16(%rsp)
	movq %rdi, 8(%rsp)
.LB7097:
	leaq 4(%rsp), %r8
	xorl %eax, %eax
	negl %edx
	addl %eax, %edx
	movl $0, 4(%rsp)
	movq %rcx, %rsi
	                movq %r8, %rdi
	                movl %edx, %eax
	                lock xaddl %eax, (%rsi)
	                movl %eax, (%rdi)
	movl 4(%rsp), %eax
	movq 16(%rsp), %rsi
	movq 8(%rsp), %rdi
	addq $32, %rsp
	ret
	.text
	.globl standard__threading___ptr_from_bytes__1__byteE1_ptr1__ret_voidE1_ptr1
	.def standard__threading___ptr_from_bytes__1__byteE1_ptr1__ret_voidE1_ptr1;
	.scl 2;
	.type 32;
	.endef
standard__threading___ptr_from_bytes__1__byteE1_ptr1__ret_voidE1_ptr1:
.LB7104:
	movq %rcx, %rax
	movq (%rax), %rax
	ret
	.text
	.globl standard__threading___store_ptr__2__byteE1_ptr1__voidE1_ptr1__ret_voidE1
	.def standard__threading___store_ptr__2__byteE1_ptr1__voidE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__threading___store_ptr__2__byteE1_ptr1__voidE1_ptr1__ret_voidE1:
.LB7112:
	movq %rcx, %rax
	movq %rdx, %rcx
	movq %rcx, (%rax)
	ret
	.text
	.globl standard__threading__thread_create__3__voidE1_ptr1__voidE1_ptr1__ThreadE1_ptr1__ret_intE1
	.def standard__threading__thread_create__3__voidE1_ptr1__voidE1_ptr1__ThreadE1_ptr1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__threading__thread_create__3__voidE1_ptr1__voidE1_ptr1__ThreadE1_ptr1__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $80, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
.LB7121:
	movq %rcx, %rdi
	movq %rdx, %r9
	movq %r8, %rbx
	leaq 8(%rbx), %r12
	movq %r12, %rcx
	movl $1, %edx
	movq %rcx, %rsi
	                movl %edx, %eax
	                xchgl %eax, (%rsi)
	movq $0, 32(%rsp)
	movq $0, 40(%rsp)
	xorl %ecx, %ecx
	xorl %edx, %edx
	movq %rdi, %r8
	callq CreateThread
	testq %rax, %rax
	je .LB7140
.LB7141:
	movq %rbx, %rcx
	movq %rax, (%rcx)
	movl THREAD_OK(%rip), %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB7140:
	movq %r12, %rcx
	xorl %edx, %edx
	movq %rcx, %rsi
	                movl %edx, %eax
	                xchgl %eax, (%rsi)
	movl THREAD_ERROR(%rip), %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
	.text
	.globl standard__threading__thread_id__0__ret_dataE1_ubits64
	.def standard__threading__thread_id__0__ret_dataE1_ubits64;
	.scl 2;
	.type 32;
	.endef
standard__threading__thread_id__0__ret_dataE1_ubits64:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB7151:
	callq GetCurrentThreadId
	leave
	ret
	.text
	.globl standard__threading__semaphore_init__2__SemaphoreE1_ptr1__dataE1_sbits32__ret_intE1
	.def standard__threading__semaphore_init__2__SemaphoreE1_ptr1__dataE1_sbits32__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__threading__semaphore_init__2__SemaphoreE1_ptr1__dataE1_sbits32__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
.LB7154:
	movq %rcx, %rsi
	xorl %ecx, %ecx
	movl $2147483647, %r8d
	xorl %r9d, %r9d
	callq CreateSemaphoreA
	testq %rax, %rax
	je .LB7168
.LB7169:
	movq %rsi, %rcx
	movq %rax, (%rcx)
	movl THREAD_OK(%rip), %eax
	movq -8(%rbp), %rsi
	leave
	ret
.LB7168:
	movl THREAD_ERROR(%rip), %eax
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl standard__threading__semaphore_wait__1__SemaphoreE1_ptr1__ret_voidE1
	.def standard__threading__semaphore_wait__1__SemaphoreE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__threading__semaphore_wait__1__SemaphoreE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB7177:
	movq %rcx, %rax
	movq (%rax), %rax
	movl WIN32_INFINITE(%rip), %edx
	movq %rax, %rcx
	callq WaitForSingleObject
	leave
	ret
	.text
	.globl standard__threading__semaphore_post__1__SemaphoreE1_ptr1__ret_voidE1
	.def standard__threading__semaphore_post__1__SemaphoreE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__threading__semaphore_post__1__SemaphoreE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB7187:
	movq %rcx, %rax
	movq (%rax), %rax
	movq %rax, %rcx
	movl $1, %edx
	xorl %r8d, %r8d
	callq ReleaseSemaphore
	leave
	ret
	.text
	.globl raycaster__color64_pack__3__doubleE1__doubleE1__doubleE1__ret_dataE1_ubits64
	.def raycaster__color64_pack__3__doubleE1__doubleE1__doubleE1__ret_dataE1_ubits64;
	.scl 2;
	.type 32;
	.endef
raycaster__color64_pack__3__doubleE1__doubleE1__doubleE1__ret_dataE1_ubits64:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB7198:
	movsd %xmm1, -24(%rbp)
	movaps %xmm2, %xmm1
	movsd %xmm1, -32(%rbp)
	xorps %xmm1, %xmm1
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm2
	callq standard__math__clamp__3__doubleE1__doubleE1__doubleE1__ret_doubleE1
	movabsq $4679239875398991872, %r10
	movq %r10, %xmm1
	mulsd %xmm1, %xmm0
	cvttsd2siq %xmm0, %rsi
	xorps %xmm1, %xmm1
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm2
	movsd -24(%rbp), %xmm0
	callq standard__math__clamp__3__doubleE1__doubleE1__doubleE1__ret_doubleE1
	movabsq $4679239875398991872, %r10
	movq %r10, %xmm1
	mulsd %xmm1, %xmm0
	cvttsd2siq %xmm0, %rdi
	xorps %xmm1, %xmm1
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm2
	movsd -32(%rbp), %xmm0
	callq standard__math__clamp__3__doubleE1__doubleE1__doubleE1__ret_doubleE1
	movabsq $4679239875398991872, %r10
	movq %r10, %xmm1
	mulsd %xmm1, %xmm0
	cvttsd2siq %xmm0, %rax
	shlq $32, %rsi
	movabsq $-281474976710656, %rcx
	orq %rcx, %rsi
	shlq $16, %rdi
	orq %rdi, %rsi
	orq %rsi, %rax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
	.text
	.globl raycaster__color64_unpack__4__dataE1_ubits64__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__ret_voidE1
	.def raycaster__color64_unpack__4__dataE1_ubits64__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
raycaster__color64_unpack__4__dataE1_ubits64__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__ret_voidE1:
.LB7227:
	movabsq $1199570688, %r10
	movq %r10, %xmm1
	movq %rcx, %rax
	shrq $32, %rax
	andq $65535, %rax
	xorps %xmm0, %xmm0
	cvtsi2sdq %rax, %xmm0
	cvtss2sd %xmm1, %xmm1
	movq %rcx, %rax
	shrq $16, %rax
	andq $65535, %rax
	andq $65535, %rcx
	divsd %xmm1, %xmm0
	movabsq $1199570688, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	movsd %xmm0, (%rdx)
	xorps %xmm0, %xmm0
	cvtsi2sdq %rax, %xmm0
	divsd %xmm1, %xmm0
	movabsq $1199570688, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	movsd %xmm0, (%r8)
	xorps %xmm0, %xmm0
	cvtsi2sdq %rcx, %xmm0
	divsd %xmm1, %xmm0
	movsd %xmm0, (%r9)
	ret
	.text
	.globl raycaster__color64_lerp__3__dataE1_ubits64__dataE1_ubits64__doubleE1__ret_dataE1_ubits64
	.def raycaster__color64_lerp__3__dataE1_ubits64__dataE1_ubits64__doubleE1__ret_dataE1_ubits64;
	.scl 2;
	.type 32;
	.endef
raycaster__color64_lerp__3__dataE1_ubits64__dataE1_ubits64__doubleE1__ret_dataE1_ubits64:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
	movq %rdi, -8(%rsp)
.LB7257:
	movaps %xmm2, %xmm0
	movabsq $4679240012837945344, %r10
	movq %r10, %xmm1
	mulsd %xmm1, %xmm0
	cvttsd2siq %xmm0, %rax
	movl $65536, %esi
	cmpq $65536, %rax
	cmova %rsi, %rax
	movl $65536, %esi
	subq %rax, %rsi
	movq %rcx, %rdi
	shrq $32, %rdi
	andq $65535, %rdi
	imulq %rsi, %rdi
	movq %rdx, %r8
	shrq $32, %r8
	andq $65535, %r8
	imulq %rax, %r8
	addq %r8, %rdi
	shrq $16, %rdi
	movq %rcx, %r8
	shrq $16, %r8
	andq $65535, %r8
	imulq %rsi, %r8
	movq %rdx, %r9
	shrq $16, %r9
	andq $65535, %r9
	imulq %rax, %r9
	addq %r9, %r8
	shrq $16, %r8
	andq $65535, %rcx
	imulq %rsi, %rcx
	andq $65535, %rdx
	imulq %rax, %rdx
	addq %rdx, %rcx
	shrq $16, %rcx
	shlq $32, %rdi
	movabsq $-281474976710656, %rax
	orq %rax, %rdi
	shlq $16, %r8
	orq %r8, %rdi
	movq %rdi, %rax
	orq %rcx, %rax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
	.text
	.globl raycaster__color64_tint__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64
	.def raycaster__color64_tint__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64;
	.scl 2;
	.type 32;
	.endef
raycaster__color64_tint__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
	movq %rdi, -8(%rsp)
.LB7336:
	movq %rdx, %rax
	shrq $48, %rax
	andq $65535, %rax
	je .LB7352
.LB7353:
	movl $65535, %esi
	subq %rax, %rsi
	movq %rcx, %rdi
	shrq $32, %rdi
	andq $65535, %rdi
	imulq %rsi, %rdi
	movq %rdx, %r8
	shrq $32, %r8
	andq $65535, %r8
	imulq %rax, %r8
	addq %r8, %rdi
	shrq $16, %rdi
	movq %rcx, %r8
	shrq $16, %r8
	andq $65535, %r8
	imulq %rsi, %r8
	movq %rdx, %r9
	shrq $16, %r9
	andq $65535, %r9
	imulq %rax, %r9
	addq %r9, %r8
	shrq $16, %r8
	andq $65535, %rcx
	imulq %rsi, %rcx
	andq $65535, %rdx
	imulq %rax, %rdx
	addq %rdx, %rcx
	shrq $16, %rcx
	shlq $32, %rdi
	movabsq $-281474976710656, %rax
	orq %rax, %rdi
	shlq $16, %r8
	orq %r8, %rdi
	movq %rdi, %rax
	orq %rcx, %rax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB7352:
	movq %rcx, %rax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
	.text
	.globl raycaster__color64_luma__1__dataE1_ubits64__ret_dataE1_ubits64
	.def raycaster__color64_luma__1__dataE1_ubits64__ret_dataE1_ubits64;
	.scl 2;
	.type 32;
	.endef
raycaster__color64_luma__1__dataE1_ubits64__ret_dataE1_ubits64:
.LB7416:
	movq %rcx, %rax
	shrq $32, %rax
	andq $65535, %rax
	imulq $19595, %rax, %rax
	movq %rcx, %rdx
	shrq $16, %rdx
	andq $65535, %rdx
	imulq $38470, %rdx, %rdx
	addq %rdx, %rax
	andq $65535, %rcx
	imulq $7471, %rcx, %rcx
	addq %rcx, %rax
	shrq $16, %rax
	ret
	.text
	.globl raycaster__dvec3_cross__2__DVec3E1__DVec3E1__ret_DVec3E1
	.def raycaster__dvec3_cross__2__DVec3E1__DVec3E1__ret_DVec3E1;
	.scl 2;
	.type 32;
	.endef
raycaster__dvec3_cross__2__DVec3E1__DVec3E1__ret_DVec3E1:
	subq $144, %rsp
.LB7441:
	movq %rcx, %rax
	movups (%rdx), %xmm15
	movups %xmm15, 112(%rsp)
	movq 16(%rdx), %r10
	movq %r10, 128(%rsp)
	movups (%r8), %xmm15
	movups %xmm15, 88(%rsp)
	movq 16(%r8), %r10
	movq %r10, 104(%rsp)
	movups 112(%rsp), %xmm15
	movups %xmm15, 64(%rsp)
	movq 128(%rsp), %r10
	movq %r10, 80(%rsp)
	movups 88(%rsp), %xmm15
	movups %xmm15, 40(%rsp)
	movq 104(%rsp), %r10
	movq %r10, 56(%rsp)
	movups .LZERO(%rip), %xmm15
	movups %xmm15, 16(%rsp)
	movq .LZERO+16(%rip), %r10
	movq %r10, 32(%rsp)
	movsd 72(%rsp), %xmm0
	movsd 56(%rsp), %xmm1
	movsd 80(%rsp), %xmm2
	movsd 48(%rsp), %xmm3
	movaps %xmm2, %xmm4
	mulsd %xmm3, %xmm4
	vfmsub231sd %xmm0, %xmm1, %xmm4
	movsd %xmm4, 16(%rsp)
	movsd 40(%rsp), %xmm4
	movsd 64(%rsp), %xmm5
	mulsd %xmm5, %xmm1
	mulsd %xmm4, %xmm0
	vfmsub231sd %xmm2, %xmm4, %xmm1
	vfmsub231sd %xmm5, %xmm3, %xmm0
	movsd %xmm1, 24(%rsp)
	movsd %xmm0, 32(%rsp)
	movups 16(%rsp), %xmm15
	movups %xmm15, -8(%rsp)
	movq 32(%rsp), %r10
	movq %r10, 8(%rsp)
	movups -8(%rsp), %xmm15
	movups %xmm15, (%rax)
	movq 8(%rsp), %r10
	movq %r10, 16(%rax)
	addq $144, %rsp
	ret
	.text
	.globl raycaster__dvec3_length__1__DVec3E1__ret_doubleE1
	.def raycaster__dvec3_length__1__DVec3E1__ret_doubleE1;
	.scl 2;
	.type 32;
	.endef
raycaster__dvec3_length__1__DVec3E1__ret_doubleE1:
	subq $48, %rsp
.LB7506:
	movups (%rcx), %xmm15
	movups %xmm15, 16(%rsp)
	movq 16(%rcx), %r10
	movq %r10, 32(%rsp)
	movups 16(%rsp), %xmm15
	movups %xmm15, -8(%rsp)
	movq 32(%rsp), %r10
	movq %r10, 8(%rsp)
	movsd -8(%rsp), %xmm0
	movsd (%rsp), %xmm1
	mulsd %xmm1, %xmm1
	vfmadd132sd %xmm0, %xmm1, %xmm0
	movsd 8(%rsp), %xmm1
	vfmadd231sd %xmm1, %xmm1, %xmm0
	movaps %xmm0, %xmm1
	sqrtsd %xmm1, %xmm0
	addq $48, %rsp
	ret
	.text
	.globl raycaster__dvec3_normalize__1__DVec3E1__ret_DVec3E1
	.def raycaster__dvec3_normalize__1__DVec3E1__ret_DVec3E1;
	.scl 2;
	.type 32;
	.endef
raycaster__dvec3_normalize__1__DVec3E1__ret_DVec3E1:
	pushq %rbp
	movq %rsp, %rbp
	subq $192, %rsp
	movq %rsi, -8(%rbp)
.LB7538:
	movq %rcx, %rsi
	movups (%rdx), %xmm15
	movups %xmm15, -32(%rbp)
	movq 16(%rdx), %r10
	movq %r10, -16(%rbp)
	movups -32(%rbp), %xmm15
	movups %xmm15, -56(%rbp)
	movq -16(%rbp), %r10
	movq %r10, -40(%rbp)
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -80(%rbp)
	movq .LZERO+16(%rip), %r10
	movq %r10, -64(%rbp)
	movups -32(%rbp), %xmm15
	movups %xmm15, -104(%rbp)
	movq -16(%rbp), %r10
	movq %r10, -88(%rbp)
	leaq -104(%rbp), %rcx
	callq raycaster__dvec3_length__1__DVec3E1__ret_doubleE1
	movabsq $4517329193108106637, %r10
	movq %r10, %xmm1
	ucomisd %xmm0, %xmm1
	ja .LB7546
.LB7547:
	movsd -56(%rbp), %xmm1
	divsd %xmm0, %xmm1
	movsd %xmm1, -80(%rbp)
	movsd -48(%rbp), %xmm1
	divsd %xmm0, %xmm1
	movsd %xmm1, -72(%rbp)
	movsd -40(%rbp), %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	divsd %xmm15, %xmm0
	movsd %xmm0, -64(%rbp)
	movups -80(%rbp), %xmm15
	movups %xmm15, -128(%rbp)
	movq -64(%rbp), %r10
	movq %r10, -112(%rbp)
	movups -128(%rbp), %xmm15
	movups %xmm15, (%rsi)
	movq -112(%rbp), %r10
	movq %r10, 16(%rsi)
	movq %rsi, %rax
	movq -8(%rbp), %rsi
	leave
	ret
.LB7546:
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, -80(%rbp)
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, -72(%rbp)
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, -64(%rbp)
	movups -80(%rbp), %xmm15
	movups %xmm15, -152(%rbp)
	movq -64(%rbp), %r10
	movq %r10, -136(%rbp)
	movups -152(%rbp), %xmm15
	movups %xmm15, (%rsi)
	movq -136(%rbp), %r10
	movq %r10, 16(%rsi)
	movq %rsi, %rax
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl raycaster__dmat4_identity__0__ret_DMat4E1
	.def raycaster__dmat4_identity__0__ret_DMat4E1;
	.scl 2;
	.type 32;
	.endef
raycaster__dmat4_identity__0__ret_DMat4E1:
	subq $256, %rsp
.LB7578:
	movq %rcx, %rax
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, 120(%rsp)
	vmovdqu .LZERO+32(%rip), %ymm15
	vmovdqu %ymm15, 152(%rsp)
	vmovdqu .LZERO+64(%rip), %ymm15
	vmovdqu %ymm15, 184(%rsp)
	vmovdqu .LZERO+96(%rip), %ymm15
	vmovdqu %ymm15, 216(%rsp)
	vzeroupper
	movabsq $1065353216, %r10
	movq %r10, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 120(%rsp)
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 128(%rsp)
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 136(%rsp)
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 144(%rsp)
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 152(%rsp)
	movabsq $1065353216, %r10
	movq %r10, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 160(%rsp)
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 168(%rsp)
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 176(%rsp)
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 184(%rsp)
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 192(%rsp)
	movabsq $1065353216, %r10
	movq %r10, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 200(%rsp)
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 208(%rsp)
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 216(%rsp)
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 224(%rsp)
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 232(%rsp)
	movabsq $1065353216, %r10
	movq %r10, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 240(%rsp)
	vmovdqu 120(%rsp), %ymm15
	vmovdqu %ymm15, -8(%rsp)
	vmovdqu 152(%rsp), %ymm15
	vmovdqu %ymm15, 24(%rsp)
	vmovdqu 184(%rsp), %ymm15
	vmovdqu %ymm15, 56(%rsp)
	vmovdqu 216(%rsp), %ymm15
	vmovdqu %ymm15, 88(%rsp)
	vzeroupper
	vmovdqu -8(%rsp), %ymm15
	vmovdqu %ymm15, (%rax)
	vmovdqu 24(%rsp), %ymm15
	vmovdqu %ymm15, 32(%rax)
	vmovdqu 56(%rsp), %ymm15
	vmovdqu %ymm15, 64(%rax)
	vmovdqu 88(%rsp), %ymm15
	vmovdqu %ymm15, 96(%rax)
	vzeroupper
	addq $256, %rsp
	ret
	.text
	.globl raycaster__dmat4_mul__2__DMat4E1__DMat4E1__ret_DMat4E1
	.def raycaster__dmat4_mul__2__DMat4E1__DMat4E1__ret_DMat4E1;
	.scl 2;
	.type 32;
	.endef
raycaster__dmat4_mul__2__DMat4E1__DMat4E1__ret_DMat4E1:
	subq $768, %rsp
.LB7613:
	movq %rcx, %rax
	vmovdqu (%rdx), %ymm15
	vmovdqu %ymm15, 632(%rsp)
	vmovdqu 32(%rdx), %ymm15
	vmovdqu %ymm15, 664(%rsp)
	vmovdqu 64(%rdx), %ymm15
	vmovdqu %ymm15, 696(%rsp)
	vmovdqu 96(%rdx), %ymm15
	vmovdqu %ymm15, 728(%rsp)
	vzeroupper
	vmovdqu (%r8), %ymm15
	vmovdqu %ymm15, 504(%rsp)
	vmovdqu 32(%r8), %ymm15
	vmovdqu %ymm15, 536(%rsp)
	vmovdqu 64(%r8), %ymm15
	vmovdqu %ymm15, 568(%rsp)
	vmovdqu 96(%r8), %ymm15
	vmovdqu %ymm15, 600(%rsp)
	vzeroupper
	vmovdqu 632(%rsp), %ymm15
	vmovdqu %ymm15, 376(%rsp)
	vmovdqu 664(%rsp), %ymm15
	vmovdqu %ymm15, 408(%rsp)
	vmovdqu 696(%rsp), %ymm15
	vmovdqu %ymm15, 440(%rsp)
	vmovdqu 728(%rsp), %ymm15
	vmovdqu %ymm15, 472(%rsp)
	vzeroupper
	vmovdqu 504(%rsp), %ymm15
	vmovdqu %ymm15, 248(%rsp)
	vmovdqu 536(%rsp), %ymm15
	vmovdqu %ymm15, 280(%rsp)
	vmovdqu 568(%rsp), %ymm15
	vmovdqu %ymm15, 312(%rsp)
	vmovdqu 600(%rsp), %ymm15
	vmovdqu %ymm15, 344(%rsp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, 120(%rsp)
	vmovdqu .LZERO+32(%rip), %ymm15
	vmovdqu %ymm15, 152(%rsp)
	vmovdqu .LZERO+64(%rip), %ymm15
	vmovdqu %ymm15, 184(%rsp)
	vmovdqu .LZERO+96(%rip), %ymm15
	vmovdqu %ymm15, 216(%rsp)
	vzeroupper
	movsd 376(%rsp), %xmm0
	movsd 248(%rsp), %xmm1
	movsd 384(%rsp), %xmm2
	movsd 280(%rsp), %xmm3
	mulsd %xmm2, %xmm3
	vfmadd132sd %xmm0, %xmm3, %xmm1
	movsd 392(%rsp), %xmm3
	movsd 312(%rsp), %xmm4
	vfmadd231sd %xmm3, %xmm4, %xmm1
	movsd 400(%rsp), %xmm4
	movsd 344(%rsp), %xmm5
	vfmadd231sd %xmm4, %xmm5, %xmm1
	movsd %xmm1, 120(%rsp)
	movsd 256(%rsp), %xmm1
	movsd 288(%rsp), %xmm5
	mulsd %xmm2, %xmm5
	vfmadd132sd %xmm0, %xmm5, %xmm1
	movsd 320(%rsp), %xmm5
	vfmadd231sd %xmm3, %xmm5, %xmm1
	movsd 352(%rsp), %xmm5
	vfmadd231sd %xmm4, %xmm5, %xmm1
	movsd %xmm1, 128(%rsp)
	movsd 264(%rsp), %xmm1
	movsd 296(%rsp), %xmm5
	mulsd %xmm2, %xmm5
	vfmadd132sd %xmm0, %xmm5, %xmm1
	movsd 328(%rsp), %xmm5
	vfmadd231sd %xmm3, %xmm5, %xmm1
	movsd 360(%rsp), %xmm5
	vfmadd231sd %xmm4, %xmm5, %xmm1
	movsd %xmm1, 136(%rsp)
	movsd 272(%rsp), %xmm1
	movsd 304(%rsp), %xmm5
	mulsd %xmm5, %xmm2
	vfmadd132sd %xmm1, %xmm2, %xmm0
	movsd 336(%rsp), %xmm1
	vfmadd231sd %xmm3, %xmm1, %xmm0
	movsd 368(%rsp), %xmm1
	vfmadd231sd %xmm4, %xmm1, %xmm0
	movsd %xmm0, 144(%rsp)
	movsd 408(%rsp), %xmm0
	movsd 248(%rsp), %xmm1
	movsd 416(%rsp), %xmm2
	movsd 280(%rsp), %xmm3
	mulsd %xmm2, %xmm3
	vfmadd132sd %xmm0, %xmm3, %xmm1
	movsd 424(%rsp), %xmm3
	movsd 312(%rsp), %xmm4
	vfmadd231sd %xmm3, %xmm4, %xmm1
	movsd 432(%rsp), %xmm4
	movsd 344(%rsp), %xmm5
	vfmadd231sd %xmm4, %xmm5, %xmm1
	movsd %xmm1, 152(%rsp)
	movsd 256(%rsp), %xmm1
	movsd 288(%rsp), %xmm5
	mulsd %xmm2, %xmm5
	vfmadd132sd %xmm0, %xmm5, %xmm1
	movsd 320(%rsp), %xmm5
	vfmadd231sd %xmm3, %xmm5, %xmm1
	movsd 352(%rsp), %xmm5
	vfmadd231sd %xmm4, %xmm5, %xmm1
	movsd %xmm1, 160(%rsp)
	movsd 264(%rsp), %xmm1
	movsd 296(%rsp), %xmm5
	mulsd %xmm2, %xmm5
	vfmadd132sd %xmm0, %xmm5, %xmm1
	movsd 328(%rsp), %xmm5
	vfmadd231sd %xmm3, %xmm5, %xmm1
	movsd 360(%rsp), %xmm5
	vfmadd231sd %xmm4, %xmm5, %xmm1
	movsd %xmm1, 168(%rsp)
	movsd 272(%rsp), %xmm1
	movsd 304(%rsp), %xmm5
	mulsd %xmm5, %xmm2
	vfmadd132sd %xmm1, %xmm2, %xmm0
	movsd 336(%rsp), %xmm1
	vfmadd231sd %xmm3, %xmm1, %xmm0
	movsd 368(%rsp), %xmm1
	vfmadd231sd %xmm4, %xmm1, %xmm0
	movsd %xmm0, 176(%rsp)
	movsd 440(%rsp), %xmm0
	movsd 248(%rsp), %xmm1
	movsd 448(%rsp), %xmm2
	movsd 280(%rsp), %xmm3
	mulsd %xmm2, %xmm3
	vfmadd132sd %xmm0, %xmm3, %xmm1
	movsd 456(%rsp), %xmm3
	movsd 312(%rsp), %xmm4
	vfmadd231sd %xmm3, %xmm4, %xmm1
	movsd 464(%rsp), %xmm4
	movsd 344(%rsp), %xmm5
	vfmadd231sd %xmm4, %xmm5, %xmm1
	movsd %xmm1, 184(%rsp)
	movsd 256(%rsp), %xmm1
	movsd 288(%rsp), %xmm5
	mulsd %xmm2, %xmm5
	vfmadd132sd %xmm0, %xmm5, %xmm1
	movsd 320(%rsp), %xmm5
	vfmadd231sd %xmm3, %xmm5, %xmm1
	movsd 352(%rsp), %xmm5
	vfmadd231sd %xmm4, %xmm5, %xmm1
	movsd %xmm1, 192(%rsp)
	movsd 264(%rsp), %xmm1
	movsd 296(%rsp), %xmm5
	mulsd %xmm2, %xmm5
	vfmadd132sd %xmm0, %xmm5, %xmm1
	movsd 328(%rsp), %xmm5
	vfmadd231sd %xmm3, %xmm5, %xmm1
	movsd 360(%rsp), %xmm5
	vfmadd231sd %xmm4, %xmm5, %xmm1
	movsd %xmm1, 200(%rsp)
	movsd 272(%rsp), %xmm1
	movsd 304(%rsp), %xmm5
	mulsd %xmm5, %xmm2
	vfmadd132sd %xmm1, %xmm2, %xmm0
	movsd 336(%rsp), %xmm1
	vfmadd231sd %xmm3, %xmm1, %xmm0
	movsd 368(%rsp), %xmm1
	vfmadd231sd %xmm4, %xmm1, %xmm0
	movsd %xmm0, 208(%rsp)
	movsd 472(%rsp), %xmm0
	movsd 248(%rsp), %xmm1
	movsd 480(%rsp), %xmm2
	movsd 280(%rsp), %xmm3
	mulsd %xmm2, %xmm3
	vfmadd132sd %xmm0, %xmm3, %xmm1
	movsd 488(%rsp), %xmm3
	movsd 312(%rsp), %xmm4
	vfmadd231sd %xmm3, %xmm4, %xmm1
	movsd 496(%rsp), %xmm4
	movsd 344(%rsp), %xmm5
	vfmadd231sd %xmm4, %xmm5, %xmm1
	movsd %xmm1, 216(%rsp)
	movsd 256(%rsp), %xmm1
	movsd 288(%rsp), %xmm5
	mulsd %xmm2, %xmm5
	vfmadd132sd %xmm0, %xmm5, %xmm1
	movsd 320(%rsp), %xmm5
	vfmadd231sd %xmm3, %xmm5, %xmm1
	movsd 352(%rsp), %xmm5
	vfmadd231sd %xmm4, %xmm5, %xmm1
	movsd %xmm1, 224(%rsp)
	movsd 264(%rsp), %xmm1
	movsd 296(%rsp), %xmm5
	mulsd %xmm2, %xmm5
	vfmadd132sd %xmm0, %xmm5, %xmm1
	movsd 328(%rsp), %xmm5
	vfmadd231sd %xmm3, %xmm5, %xmm1
	movsd 360(%rsp), %xmm5
	vfmadd231sd %xmm4, %xmm5, %xmm1
	movsd %xmm1, 232(%rsp)
	movsd 272(%rsp), %xmm1
	movsd 304(%rsp), %xmm5
	mulsd %xmm5, %xmm2
	vfmadd132sd %xmm1, %xmm2, %xmm0
	movsd 336(%rsp), %xmm1
	vfmadd231sd %xmm3, %xmm1, %xmm0
	movsd 368(%rsp), %xmm1
	vfmadd231sd %xmm4, %xmm1, %xmm0
	movsd %xmm0, 240(%rsp)
	vmovdqu 120(%rsp), %ymm15
	vmovdqu %ymm15, -8(%rsp)
	vmovdqu 152(%rsp), %ymm15
	vmovdqu %ymm15, 24(%rsp)
	vmovdqu 184(%rsp), %ymm15
	vmovdqu %ymm15, 56(%rsp)
	vmovdqu 216(%rsp), %ymm15
	vmovdqu %ymm15, 88(%rsp)
	vzeroupper
	vmovdqu -8(%rsp), %ymm15
	vmovdqu %ymm15, (%rax)
	vmovdqu 24(%rsp), %ymm15
	vmovdqu %ymm15, 32(%rax)
	vmovdqu 56(%rsp), %ymm15
	vmovdqu %ymm15, 64(%rax)
	vmovdqu 88(%rsp), %ymm15
	vmovdqu %ymm15, 96(%rax)
	vzeroupper
	addq $768, %rsp
	ret
	.text
	.globl raycaster__dmat4_mul_vec4__2__DMat4E1__DVec4E1__ret_DVec4E1
	.def raycaster__dmat4_mul_vec4__2__DMat4E1__DVec4E1__ret_DVec4E1;
	.scl 2;
	.type 32;
	.endef
raycaster__dmat4_mul_vec4__2__DMat4E1__DVec4E1__ret_DVec4E1:
	subq $384, %rsp
.LB8258:
	movq %rcx, %rax
	vmovdqu (%rdx), %ymm15
	vmovdqu %ymm15, 248(%rsp)
	vmovdqu 32(%rdx), %ymm15
	vmovdqu %ymm15, 280(%rsp)
	vmovdqu 64(%rdx), %ymm15
	vmovdqu %ymm15, 312(%rsp)
	vmovdqu 96(%rdx), %ymm15
	vmovdqu %ymm15, 344(%rsp)
	vzeroupper
	vmovdqu (%r8), %ymm15
	vmovdqu %ymm15, 216(%rsp)
	vzeroupper
	vmovdqu 248(%rsp), %ymm15
	vmovdqu %ymm15, 88(%rsp)
	vmovdqu 280(%rsp), %ymm15
	vmovdqu %ymm15, 120(%rsp)
	vmovdqu 312(%rsp), %ymm15
	vmovdqu %ymm15, 152(%rsp)
	vmovdqu 344(%rsp), %ymm15
	vmovdqu %ymm15, 184(%rsp)
	vzeroupper
	vmovdqu 216(%rsp), %ymm15
	vmovdqu %ymm15, 56(%rsp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, 24(%rsp)
	vzeroupper
	movsd 88(%rsp), %xmm0
	movsd 56(%rsp), %xmm1
	movsd 96(%rsp), %xmm2
	movsd 64(%rsp), %xmm3
	mulsd %xmm3, %xmm2
	vfmadd132sd %xmm1, %xmm2, %xmm0
	movsd 104(%rsp), %xmm2
	movsd 72(%rsp), %xmm4
	vfmadd231sd %xmm2, %xmm4, %xmm0
	movsd 112(%rsp), %xmm2
	movsd 80(%rsp), %xmm5
	vfmadd231sd %xmm2, %xmm5, %xmm0
	movsd %xmm0, 24(%rsp)
	movsd 120(%rsp), %xmm0
	movsd 128(%rsp), %xmm2
	mulsd %xmm3, %xmm2
	vfmadd132sd %xmm1, %xmm2, %xmm0
	movsd 136(%rsp), %xmm2
	vfmadd231sd %xmm2, %xmm4, %xmm0
	movsd 144(%rsp), %xmm2
	vfmadd231sd %xmm2, %xmm5, %xmm0
	movsd %xmm0, 32(%rsp)
	movsd 152(%rsp), %xmm0
	movsd 160(%rsp), %xmm2
	mulsd %xmm3, %xmm2
	vfmadd132sd %xmm1, %xmm2, %xmm0
	movsd 168(%rsp), %xmm2
	vfmadd231sd %xmm2, %xmm4, %xmm0
	movsd 176(%rsp), %xmm2
	vfmadd231sd %xmm2, %xmm5, %xmm0
	movsd %xmm0, 40(%rsp)
	movsd 184(%rsp), %xmm0
	movsd 192(%rsp), %xmm2
	mulsd %xmm3, %xmm2
	vfmadd132sd %xmm1, %xmm2, %xmm0
	movsd 200(%rsp), %xmm1
	vfmadd231sd %xmm1, %xmm4, %xmm0
	movsd 208(%rsp), %xmm1
	vfmadd231sd %xmm1, %xmm5, %xmm0
	movsd %xmm0, 48(%rsp)
	vmovdqu 24(%rsp), %ymm15
	vmovdqu %ymm15, -8(%rsp)
	vzeroupper
	vmovdqu -8(%rsp), %ymm15
	vmovdqu %ymm15, (%rax)
	vzeroupper
	addq $384, %rsp
	ret
	.text
	.globl raycaster__dmat4_lookat__3__DVec3E1__DVec3E1__DVec3E1__ret_DMat4E1
	.def raycaster__dmat4_lookat__3__DVec3E1__DVec3E1__DVec3E1__ret_DMat4E1;
	.scl 2;
	.type 32;
	.endef
raycaster__dmat4_lookat__3__DVec3E1__DVec3E1__DVec3E1__ret_DMat4E1:
	pushq %rbp
	movq %rsp, %rbp
	subq $832, %rsp
	movq %rsi, -8(%rbp)
.LB8423:
	movq %rcx, %rsi
	movups (%rdx), %xmm15
	movups %xmm15, -32(%rbp)
	movq 16(%rdx), %r10
	movq %r10, -16(%rbp)
	movups (%r8), %xmm15
	movups %xmm15, -56(%rbp)
	movq 16(%r8), %r10
	movq %r10, -40(%rbp)
	movups (%r9), %xmm15
	movups %xmm15, -80(%rbp)
	movq 16(%r9), %r10
	movq %r10, -64(%rbp)
	movups -32(%rbp), %xmm15
	movups %xmm15, -104(%rbp)
	movq -16(%rbp), %r10
	movq %r10, -88(%rbp)
	movups -56(%rbp), %xmm15
	movups %xmm15, -128(%rbp)
	movq -40(%rbp), %r10
	movq %r10, -112(%rbp)
	movups -80(%rbp), %xmm15
	movups %xmm15, -152(%rbp)
	movq -64(%rbp), %r10
	movq %r10, -136(%rbp)
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -176(%rbp)
	movq .LZERO+16(%rip), %r10
	movq %r10, -160(%rbp)
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -200(%rbp)
	movq .LZERO+16(%rip), %r10
	movq %r10, -184(%rbp)
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -224(%rbp)
	movq .LZERO+16(%rip), %r10
	movq %r10, -208(%rbp)
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -352(%rbp)
	vmovdqu .LZERO+32(%rip), %ymm15
	vmovdqu %ymm15, -320(%rbp)
	vmovdqu .LZERO+64(%rip), %ymm15
	vmovdqu %ymm15, -288(%rbp)
	vmovdqu .LZERO+96(%rip), %ymm15
	vmovdqu %ymm15, -256(%rbp)
	vzeroupper
	movsd -128(%rbp), %xmm0
	movsd -104(%rbp), %xmm1
	movsd %xmm1, -752(%rbp)
	subsd %xmm1, %xmm0
	movsd %xmm0, -176(%rbp)
	movsd -120(%rbp), %xmm0
	movsd -96(%rbp), %xmm1
	movsd %xmm1, -760(%rbp)
	subsd %xmm1, %xmm0
	movsd %xmm0, -168(%rbp)
	movsd -112(%rbp), %xmm0
	movsd -88(%rbp), %xmm1
	movsd %xmm1, -768(%rbp)
	subsd %xmm1, %xmm0
	movsd %xmm0, -160(%rbp)
	movups -176(%rbp), %xmm15
	movups %xmm15, -376(%rbp)
	movq -160(%rbp), %r10
	movq %r10, -360(%rbp)
	movups -376(%rbp), %xmm15
	movups %xmm15, -424(%rbp)
	movq -360(%rbp), %r10
	movq %r10, -408(%rbp)
	leaq -424(%rbp), %rdx
	leaq -400(%rbp), %rcx
	callq raycaster__dvec3_normalize__1__DVec3E1__ret_DVec3E1
	movups -400(%rbp), %xmm15
	movups %xmm15, -176(%rbp)
	movq -384(%rbp), %r10
	movq %r10, -160(%rbp)
	movups -400(%rbp), %xmm15
	movups %xmm15, -472(%rbp)
	movq -384(%rbp), %r10
	movq %r10, -456(%rbp)
	leaq -472(%rbp), %rdx
	movups -80(%rbp), %xmm15
	movups %xmm15, -496(%rbp)
	movq -64(%rbp), %r10
	movq %r10, -480(%rbp)
	leaq -496(%rbp), %r8
	leaq -448(%rbp), %rcx
	callq raycaster__dvec3_cross__2__DVec3E1__DVec3E1__ret_DVec3E1
	movups -448(%rbp), %xmm15
	movups %xmm15, -200(%rbp)
	movq -432(%rbp), %r10
	movq %r10, -184(%rbp)
	movups -448(%rbp), %xmm15
	movups %xmm15, -544(%rbp)
	movq -432(%rbp), %r10
	movq %r10, -528(%rbp)
	leaq -544(%rbp), %rdx
	leaq -520(%rbp), %rcx
	callq raycaster__dvec3_normalize__1__DVec3E1__ret_DVec3E1
	movups -520(%rbp), %xmm15
	movups %xmm15, -200(%rbp)
	movq -504(%rbp), %r10
	movq %r10, -184(%rbp)
	movups -520(%rbp), %xmm15
	movups %xmm15, -592(%rbp)
	movq -504(%rbp), %r10
	movq %r10, -576(%rbp)
	leaq -592(%rbp), %rdx
	movups -400(%rbp), %xmm15
	movups %xmm15, -616(%rbp)
	movq -384(%rbp), %r10
	movq %r10, -600(%rbp)
	leaq -616(%rbp), %r8
	leaq -568(%rbp), %rcx
	callq raycaster__dvec3_cross__2__DVec3E1__DVec3E1__ret_DVec3E1
	movups -568(%rbp), %xmm15
	movups %xmm15, -224(%rbp)
	movq -552(%rbp), %r10
	movq %r10, -208(%rbp)
	movsd -200(%rbp), %xmm0
	xorps %xmm5, %xmm5
	movsd %xmm0, -352(%rbp)
	movsd -192(%rbp), %xmm1
	movsd %xmm1, -344(%rbp)
	movsd -184(%rbp), %xmm2
	movsd %xmm2, -336(%rbp)
	movsd -760(%rbp), %xmm3
	mulsd %xmm3, %xmm1
	movsd -752(%rbp), %xmm3
	vfmadd132sd %xmm3, %xmm1, %xmm0
	movsd -768(%rbp), %xmm1
	vfmadd231sd %xmm2, %xmm1, %xmm0
	xorps %xmm1, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subsd %xmm15, %xmm0
	movsd %xmm0, -328(%rbp)
	movsd -224(%rbp), %xmm0
	movsd %xmm0, -320(%rbp)
	movsd -216(%rbp), %xmm1
	movsd %xmm1, -312(%rbp)
	movsd -208(%rbp), %xmm2
	movsd %xmm2, -304(%rbp)
	movsd -104(%rbp), %xmm3
	movsd -96(%rbp), %xmm4
	mulsd %xmm4, %xmm1
	vfmadd132sd %xmm3, %xmm1, %xmm0
	movsd -88(%rbp), %xmm1
	movsd %xmm1, -800(%rbp)
	vfmadd231sd %xmm2, %xmm1, %xmm0
	xorps %xmm1, %xmm1
	xorps %xmm2, %xmm2
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subsd %xmm15, %xmm0
	xorps %xmm1, %xmm1
	movsd %xmm0, -296(%rbp)
	movsd -176(%rbp), %xmm0
	subsd %xmm0, %xmm1
	movsd %xmm1, -288(%rbp)
	movsd -168(%rbp), %xmm1
	subsd %xmm1, %xmm2
	mulsd %xmm4, %xmm1
	movsd %xmm2, -280(%rbp)
	movsd -160(%rbp), %xmm2
	vfmadd132sd %xmm3, %xmm1, %xmm0
	movsd %xmm2, -792(%rbp)
	movaps %xmm2, %xmm15
	movaps %xmm5, %xmm2
	subsd %xmm15, %xmm2
	movsd %xmm5, -776(%rbp)
	movsd %xmm2, -784(%rbp)
	movsd %xmm2, -272(%rbp)
	movsd -792(%rbp), %xmm1
	movsd -800(%rbp), %xmm2
	vfmadd231sd %xmm1, %xmm2, %xmm0
	movsd %xmm0, -264(%rbp)
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, -256(%rbp)
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, -248(%rbp)
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, -240(%rbp)
	movabsq $1065353216, %r10
	movq %r10, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, -232(%rbp)
	vmovdqu -352(%rbp), %ymm15
	vmovdqu %ymm15, -744(%rbp)
	vmovdqu -320(%rbp), %ymm15
	vmovdqu %ymm15, -712(%rbp)
	vmovdqu -288(%rbp), %ymm15
	vmovdqu %ymm15, -680(%rbp)
	vmovdqu -256(%rbp), %ymm15
	vmovdqu %ymm15, -648(%rbp)
	vzeroupper
	vmovdqu -744(%rbp), %ymm15
	vmovdqu %ymm15, (%rsi)
	vmovdqu -712(%rbp), %ymm15
	vmovdqu %ymm15, 32(%rsi)
	vmovdqu -680(%rbp), %ymm15
	vmovdqu %ymm15, 64(%rsi)
	vmovdqu -648(%rbp), %ymm15
	vmovdqu %ymm15, 96(%rsi)
	vzeroupper
	movq %rsi, %rax
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl raycaster__dmat4_perspective__4__doubleE1__doubleE1__doubleE1__doubleE1__ret_DMat4E1
	.def raycaster__dmat4_perspective__4__doubleE1__doubleE1__doubleE1__doubleE1__ret_DMat4E1;
	.scl 2;
	.type 32;
	.endef
raycaster__dmat4_perspective__4__doubleE1__doubleE1__doubleE1__doubleE1__ret_DMat4E1:
	pushq %rbp
	movq %rsp, %rbp
	subq $320, %rsp
	movq %rsi, -8(%rbp)
.LB8620:
	movq %rcx, %rsi
	movaps %xmm1, %xmm0
	movaps %xmm2, %xmm1
	movsd %xmm1, -272(%rbp)
	movaps %xmm3, %xmm1
	movsd %xmm1, -280(%rbp)
	movsd 48(%rbp), %xmm1
	movsd %xmm1, -288(%rbp)
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -136(%rbp)
	vmovdqu .LZERO+32(%rip), %ymm15
	vmovdqu %ymm15, -104(%rbp)
	vmovdqu .LZERO+64(%rip), %ymm15
	vmovdqu %ymm15, -72(%rbp)
	vmovdqu .LZERO+96(%rip), %ymm15
	vmovdqu %ymm15, -40(%rbp)
	vzeroupper
	movabsq $1056964608, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	mulsd %xmm1, %xmm0
	callq standard__math__tan__1__doubleE1__ret_doubleE1
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	divsd %xmm15, %xmm0
	movsd -280(%rbp), %xmm1
	movsd -288(%rbp), %xmm2
	subsd %xmm2, %xmm1
	movabsq $1065353216, %r10
	movq %r10, %xmm2
	cvtss2sd %xmm2, %xmm2
	movaps %xmm1, %xmm15
	movaps %xmm2, %xmm1
	divsd %xmm15, %xmm1
	movsd -272(%rbp), %xmm2
	movaps %xmm2, %xmm15
	movaps %xmm0, %xmm2
	divsd %xmm15, %xmm2
	movsd %xmm2, -136(%rbp)
	xorps %xmm2, %xmm2
	cvtss2sd %xmm2, %xmm2
	movsd %xmm2, -128(%rbp)
	xorps %xmm2, %xmm2
	cvtss2sd %xmm2, %xmm2
	movsd %xmm2, -120(%rbp)
	xorps %xmm2, %xmm2
	cvtss2sd %xmm2, %xmm2
	movsd %xmm2, -112(%rbp)
	xorps %xmm2, %xmm2
	cvtss2sd %xmm2, %xmm2
	movsd %xmm2, -104(%rbp)
	movsd %xmm0, -96(%rbp)
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, -88(%rbp)
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, -80(%rbp)
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, -72(%rbp)
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, -64(%rbp)
	movsd -288(%rbp), %xmm0
	movsd -280(%rbp), %xmm2
	movaps %xmm0, %xmm3
	addsd %xmm2, %xmm3
	mulsd %xmm1, %xmm3
	movsd %xmm3, -56(%rbp)
	movabsq $1073741824, %r10
	movq %r10, %xmm3
	cvtss2sd %xmm3, %xmm3
	mulsd %xmm3, %xmm0
	mulsd %xmm2, %xmm0
	mulsd %xmm1, %xmm0
	movsd %xmm0, -48(%rbp)
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, -40(%rbp)
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, -32(%rbp)
	xorps %xmm0, %xmm0
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	subss %xmm1, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, -24(%rbp)
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, -16(%rbp)
	vmovdqu -136(%rbp), %ymm15
	vmovdqu %ymm15, -264(%rbp)
	vmovdqu -104(%rbp), %ymm15
	vmovdqu %ymm15, -232(%rbp)
	vmovdqu -72(%rbp), %ymm15
	vmovdqu %ymm15, -200(%rbp)
	vmovdqu -40(%rbp), %ymm15
	vmovdqu %ymm15, -168(%rbp)
	vzeroupper
	vmovdqu -264(%rbp), %ymm15
	vmovdqu %ymm15, (%rsi)
	vmovdqu -232(%rbp), %ymm15
	vmovdqu %ymm15, 32(%rsi)
	vmovdqu -200(%rbp), %ymm15
	vmovdqu %ymm15, 64(%rsi)
	vmovdqu -168(%rbp), %ymm15
	vmovdqu %ymm15, 96(%rsi)
	vzeroupper
	movq %rsi, %rax
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl raycaster___sincos__3__doubleE1__doubleE1_ptr1__doubleE1_ptr1__ret_voidE1
	.def raycaster___sincos__3__doubleE1__doubleE1_ptr1__doubleE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
raycaster___sincos__3__doubleE1__doubleE1_ptr1__doubleE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $80, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
.LB8685:
	xorps %xmm1, %xmm1
	movq %rdx, %rsi
	movq %r8, %rdi
	movl $0, -28(%rbp)
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm0, %xmm1
	seta %bl
	movzbl %bl, %ebx
	testb %bl, %bl
	jne .LB8696
.LB8697:
	movsd %xmm0, -40(%rbp)
.LB8698:
	movabsq $1061752795, %r10
	movq %r10, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd -40(%rbp), %xmm1
	ucomisd %xmm1, %xmm0
	jae .LB8704
.LB8705:
	leaq -28(%rbp), %rdx
	movsd -40(%rbp), %xmm0
	callq standard__math___trig_reduce__2__doubleE1__dataE1_ptr1_sbits32__ret_doubleE1
	movsd %xmm0, -48(%rbp)
	movl -28(%rbp), %eax
	andl $3, %eax
	je .LB8726
	cmpl $1, %eax
	je .LB8727
	cmpl $2, %eax
	jne .LB8729
.LB8728:
	movsd -48(%rbp), %xmm0
	callq standard__math___sin_kernel__1__doubleE1__ret_doubleE1
	xorps %xmm1, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subsd %xmm15, %xmm0
	movsd %xmm0, (%rsi)
	movsd -48(%rbp), %xmm0
	callq standard__math___cos_kernel__1__doubleE1__ret_doubleE1
	xorps %xmm1, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subsd %xmm15, %xmm0
	movsd %xmm0, (%rdi)
.LB8725:
	testb %bl, %bl
	jne .LB8759
.LB8760:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB8696:
	xorps %xmm1, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subsd %xmm15, %xmm0
	movsd %xmm0, -40(%rbp)
	jmp .LB8698
.LB8727:
	movsd -48(%rbp), %xmm0
	callq standard__math___cos_kernel__1__doubleE1__ret_doubleE1
	movsd %xmm0, (%rsi)
	movsd -48(%rbp), %xmm0
	callq standard__math___sin_kernel__1__doubleE1__ret_doubleE1
	xorps %xmm1, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subsd %xmm15, %xmm0
	movsd %xmm0, (%rdi)
	testb %bl, %bl
	jne .LB8759
	jmp .LB8760
.LB8726:
	movsd -48(%rbp), %xmm0
	callq standard__math___sin_kernel__1__doubleE1__ret_doubleE1
	movsd %xmm0, (%rsi)
	movsd -48(%rbp), %xmm0
	callq standard__math___cos_kernel__1__doubleE1__ret_doubleE1
	movsd %xmm0, (%rdi)
	testb %bl, %bl
	jne .LB8759
	jmp .LB8760
.LB8729:
	movsd -48(%rbp), %xmm0
	callq standard__math___cos_kernel__1__doubleE1__ret_doubleE1
	xorps %xmm1, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subsd %xmm15, %xmm0
	movsd %xmm0, (%rsi)
	movsd -48(%rbp), %xmm0
	callq standard__math___sin_kernel__1__doubleE1__ret_doubleE1
	movsd %xmm0, (%rdi)
	testb %bl, %bl
	je .LB8760
.LB8759:
	movsd (%rsi), %xmm0
	xorps %xmm1, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subsd %xmm15, %xmm0
	movsd %xmm0, (%rsi)
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB8704:
	movsd -40(%rbp), %xmm0
	callq standard__math___sin_kernel__1__doubleE1__ret_doubleE1
	movsd %xmm0, (%rsi)
	movsd -40(%rbp), %xmm0
	callq standard__math___cos_kernel__1__doubleE1__ret_doubleE1
	movsd %xmm0, (%rdi)
	testb %bl, %bl
	jne .LB8714
.LB8715:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB8714:
	movsd (%rsi), %xmm0
	xorps %xmm1, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subsd %xmm15, %xmm0
	movsd %xmm0, (%rsi)
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
	.text
	.globl raycaster__dmat4_trs__9__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__ret_DMat4E1
	.def raycaster__dmat4_trs__9__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__ret_DMat4E1;
	.scl 2;
	.type 32;
	.endef
raycaster__dmat4_trs__9__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__ret_DMat4E1:
	pushq %rbp
	movq %rsp, %rbp
	subq $592, %rsp
	movq %rsi, -8(%rbp)
.LB8766:
	movaps %xmm1, %xmm0
	leaq -24(%rbp), %rdx
	leaq -16(%rbp), %r8
	movq %rcx, %rsi
	movsd %xmm0, -320(%rbp)
	movaps %xmm2, %xmm0
	movsd %xmm0, -328(%rbp)
	movaps %xmm3, %xmm0
	movsd %xmm0, -336(%rbp)
	movsd 48(%rbp), %xmm0
	movsd 56(%rbp), %xmm1
	movsd %xmm1, -344(%rbp)
	movsd 64(%rbp), %xmm1
	movsd %xmm1, -352(%rbp)
	movsd 72(%rbp), %xmm1
	movsd %xmm1, -360(%rbp)
	movsd 80(%rbp), %xmm1
	movsd %xmm1, -368(%rbp)
	movsd 88(%rbp), %xmm1
	movsd %xmm1, -376(%rbp)
	xorps %xmm1, %xmm1
	movsd %xmm1, -16(%rbp)
	xorps %xmm1, %xmm1
	movsd %xmm1, -24(%rbp)
	xorps %xmm1, %xmm1
	movsd %xmm1, -32(%rbp)
	xorps %xmm1, %xmm1
	movsd %xmm1, -40(%rbp)
	xorps %xmm1, %xmm1
	movsd %xmm1, -48(%rbp)
	xorps %xmm1, %xmm1
	movsd %xmm1, -56(%rbp)
	callq raycaster___sincos__3__doubleE1__doubleE1_ptr1__doubleE1_ptr1__ret_voidE1
	leaq -40(%rbp), %rdx
	leaq -32(%rbp), %r8
	movsd -344(%rbp), %xmm0
	callq raycaster___sincos__3__doubleE1__doubleE1_ptr1__doubleE1_ptr1__ret_voidE1
	leaq -56(%rbp), %rdx
	leaq -48(%rbp), %r8
	movsd -352(%rbp), %xmm0
	callq raycaster___sincos__3__doubleE1__doubleE1_ptr1__doubleE1_ptr1__ret_voidE1
	movsd -40(%rbp), %xmm0
	movsd -24(%rbp), %xmm1
	movsd %xmm1, -552(%rbp)
	movaps %xmm0, %xmm2
	mulsd %xmm1, %xmm2
	movsd %xmm2, -416(%rbp)
	movsd -32(%rbp), %xmm3
	movsd %xmm3, -560(%rbp)
	mulsd %xmm3, %xmm1
	movsd %xmm1, -384(%rbp)
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -184(%rbp)
	vmovdqu .LZERO+32(%rip), %ymm15
	vmovdqu %ymm15, -152(%rbp)
	vmovdqu .LZERO+64(%rip), %ymm15
	vmovdqu %ymm15, -120(%rbp)
	vmovdqu .LZERO+96(%rip), %ymm15
	vmovdqu %ymm15, -88(%rbp)
	vzeroupper
	movsd -48(%rbp), %xmm1
	movsd -56(%rbp), %xmm3
	mulsd %xmm3, %xmm2
	movsd %xmm2, -392(%rbp)
	movsd -560(%rbp), %xmm4
	vfmadd231sd %xmm4, %xmm1, %xmm2
	movsd %xmm2, -400(%rbp)
	movsd -360(%rbp), %xmm4
	mulsd %xmm4, %xmm2
	movsd %xmm2, -408(%rbp)
	movsd %xmm2, -184(%rbp)
	movsd -16(%rbp), %xmm2
	movaps %xmm2, %xmm5
	mulsd %xmm3, %xmm5
	movsd %xmm5, -424(%rbp)
	mulsd %xmm5, %xmm4
	movsd %xmm4, -432(%rbp)
	movsd %xmm4, -152(%rbp)
	xorps %xmm4, %xmm4
	movsd %xmm4, -440(%rbp)
	subsd %xmm0, %xmm4
	movsd %xmm4, -448(%rbp)
	movsd -384(%rbp), %xmm5
	mulsd %xmm3, %xmm5
	movsd %xmm5, -456(%rbp)
	vfmadd132sd %xmm1, %xmm5, %xmm4
	movsd %xmm4, -464(%rbp)
	movsd -360(%rbp), %xmm5
	mulsd %xmm5, %xmm4
	movsd %xmm4, -472(%rbp)
	movsd %xmm4, -120(%rbp)
	xorps %xmm4, %xmm4
	movsd %xmm4, -480(%rbp)
	cvtss2sd %xmm4, %xmm4
	movsd %xmm4, -488(%rbp)
	movsd %xmm4, -88(%rbp)
	xorps %xmm4, %xmm4
	movsd %xmm4, -496(%rbp)
	movsd -560(%rbp), %xmm5
	subsd %xmm5, %xmm4
	movsd %xmm4, -504(%rbp)
	movsd -416(%rbp), %xmm5
	mulsd %xmm1, %xmm5
	movsd %xmm5, -512(%rbp)
	vfmadd132sd %xmm3, %xmm5, %xmm4
	movsd %xmm4, -520(%rbp)
	movsd -368(%rbp), %xmm5
	mulsd %xmm5, %xmm4
	movsd %xmm4, -528(%rbp)
	movsd %xmm4, -176(%rbp)
	movaps %xmm2, %xmm4
	mulsd %xmm1, %xmm4
	movsd %xmm4, -536(%rbp)
	mulsd %xmm5, %xmm4
	movsd %xmm4, -544(%rbp)
	movsd %xmm4, -144(%rbp)
	movsd -384(%rbp), %xmm4
	mulsd %xmm4, %xmm1
	vfmadd231sd %xmm0, %xmm3, %xmm1
	movsd -368(%rbp), %xmm3
	mulsd %xmm2, %xmm0
	mulsd %xmm3, %xmm1
	movsd %xmm1, -112(%rbp)
	xorps %xmm1, %xmm1
	cvtss2sd %xmm1, %xmm1
	movsd %xmm1, -80(%rbp)
	movsd -376(%rbp), %xmm1
	mulsd %xmm1, %xmm0
	movsd %xmm0, -168(%rbp)
	movsd -552(%rbp), %xmm3
	xorps %xmm0, %xmm0
	subsd %xmm3, %xmm0
	mulsd %xmm1, %xmm0
	movsd %xmm0, -136(%rbp)
	movsd -560(%rbp), %xmm0
	movsd -376(%rbp), %xmm1
	mulsd %xmm2, %xmm0
	mulsd %xmm1, %xmm0
	movsd %xmm0, -104(%rbp)
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, -72(%rbp)
	movsd -320(%rbp), %xmm0
	movsd %xmm0, -160(%rbp)
	movsd -328(%rbp), %xmm0
	movsd %xmm0, -128(%rbp)
	movsd -336(%rbp), %xmm0
	movsd %xmm0, -96(%rbp)
	movabsq $1065353216, %r10
	movq %r10, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, -64(%rbp)
	vmovdqu -184(%rbp), %ymm15
	vmovdqu %ymm15, -312(%rbp)
	vmovdqu -152(%rbp), %ymm15
	vmovdqu %ymm15, -280(%rbp)
	vmovdqu -120(%rbp), %ymm15
	vmovdqu %ymm15, -248(%rbp)
	vmovdqu -88(%rbp), %ymm15
	vmovdqu %ymm15, -216(%rbp)
	vzeroupper
	vmovdqu -312(%rbp), %ymm15
	vmovdqu %ymm15, (%rsi)
	vmovdqu -280(%rbp), %ymm15
	vmovdqu %ymm15, 32(%rsi)
	vmovdqu -248(%rbp), %ymm15
	vmovdqu %ymm15, 64(%rsi)
	vmovdqu -216(%rbp), %ymm15
	vmovdqu %ymm15, 96(%rsi)
	vzeroupper
	movq %rsi, %rax
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl raycaster__dmat4_normal_mat__2__DMat4E1__DMat4E1_ptr1__ret_voidE1
	.def raycaster__dmat4_normal_mat__2__DMat4E1__DMat4E1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
raycaster__dmat4_normal_mat__2__DMat4E1__DMat4E1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $512, %rsp
	movq %rsi, -8(%rbp)
.LB8880:
	movq %rdx, %rsi
	vmovdqu (%rcx), %ymm15
	vmovdqu %ymm15, -136(%rbp)
	vmovdqu 32(%rcx), %ymm15
	vmovdqu %ymm15, -104(%rbp)
	vmovdqu 64(%rcx), %ymm15
	vmovdqu %ymm15, -72(%rbp)
	vmovdqu 96(%rcx), %ymm15
	vmovdqu %ymm15, -40(%rbp)
	vzeroupper
	vmovdqu -136(%rbp), %ymm15
	vmovdqu %ymm15, -264(%rbp)
	vmovdqu -104(%rbp), %ymm15
	vmovdqu %ymm15, -232(%rbp)
	vmovdqu -72(%rbp), %ymm15
	vmovdqu %ymm15, -200(%rbp)
	vmovdqu -40(%rbp), %ymm15
	vmovdqu %ymm15, -168(%rbp)
	vzeroupper
	movsd -264(%rbp), %xmm0
	movsd %xmm0, -400(%rbp)
	movsd -256(%rbp), %xmm0
	movsd %xmm0, -408(%rbp)
	movsd -248(%rbp), %xmm0
	movsd %xmm0, -416(%rbp)
	movsd -232(%rbp), %xmm0
	movsd %xmm0, -424(%rbp)
	movsd -224(%rbp), %xmm0
	movsd %xmm0, -432(%rbp)
	movsd -216(%rbp), %xmm0
	movsd %xmm0, -440(%rbp)
	movsd -200(%rbp), %xmm1
	movsd %xmm1, -448(%rbp)
	movsd -192(%rbp), %xmm1
	movsd %xmm1, -456(%rbp)
	movsd -184(%rbp), %xmm2
	movsd %xmm2, -464(%rbp)
	mulsd %xmm1, %xmm0
	movsd -432(%rbp), %xmm1
	vfmsub231sd %xmm1, %xmm2, %xmm0
	movsd -440(%rbp), %xmm1
	movsd -448(%rbp), %xmm2
	mulsd %xmm2, %xmm1
	movsd -424(%rbp), %xmm2
	movsd -464(%rbp), %xmm3
	vfmsub231sd %xmm2, %xmm3, %xmm1
	movsd -408(%rbp), %xmm2
	mulsd %xmm2, %xmm1
	movsd -400(%rbp), %xmm2
	vfmsub132sd %xmm2, %xmm1, %xmm0
	movsd -432(%rbp), %xmm1
	movsd -448(%rbp), %xmm2
	mulsd %xmm2, %xmm1
	movsd -424(%rbp), %xmm2
	movsd -456(%rbp), %xmm3
	vfmsub231sd %xmm2, %xmm3, %xmm1
	movsd -416(%rbp), %xmm2
	vfmadd231sd %xmm2, %xmm1, %xmm0
	movsd %xmm0, -472(%rbp)
	callq standard__math__abs__1__doubleE1__ret_doubleE1
	movabsq $4517329193108106637, %r10
	movq %r10, %xmm1
	ucomisd %xmm0, %xmm1
	ja .LB8962
.LB8963:
	movabsq $1065353216, %r10
	movq %r10, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd -472(%rbp), %xmm1
	divsd %xmm1, %xmm0
	movsd -440(%rbp), %xmm1
	movsd -456(%rbp), %xmm2
	mulsd %xmm2, %xmm1
	movsd -432(%rbp), %xmm2
	movsd -464(%rbp), %xmm3
	vfmsub231sd %xmm2, %xmm3, %xmm1
	mulsd %xmm0, %xmm1
	movsd %xmm1, (%rsi)
	movsd -440(%rbp), %xmm1
	movsd -448(%rbp), %xmm2
	mulsd %xmm2, %xmm1
	movsd -424(%rbp), %xmm2
	movsd -464(%rbp), %xmm3
	vfmsub231sd %xmm2, %xmm3, %xmm1
	xorps %xmm2, %xmm2
	movaps %xmm1, %xmm15
	movaps %xmm2, %xmm1
	subsd %xmm15, %xmm1
	mulsd %xmm0, %xmm1
	movsd %xmm1, 8(%rsi)
	movsd -432(%rbp), %xmm1
	movsd -448(%rbp), %xmm2
	mulsd %xmm2, %xmm1
	movsd -424(%rbp), %xmm2
	movsd -456(%rbp), %xmm3
	vfmsub231sd %xmm2, %xmm3, %xmm1
	mulsd %xmm0, %xmm1
	movsd %xmm1, 16(%rsi)
	movsd -416(%rbp), %xmm1
	mulsd %xmm3, %xmm1
	movsd -408(%rbp), %xmm2
	movsd -464(%rbp), %xmm3
	vfmsub231sd %xmm2, %xmm3, %xmm1
	xorps %xmm2, %xmm2
	movaps %xmm1, %xmm15
	movaps %xmm2, %xmm1
	subsd %xmm15, %xmm1
	mulsd %xmm0, %xmm1
	movsd %xmm1, 32(%rsi)
	movsd -416(%rbp), %xmm1
	movsd -448(%rbp), %xmm2
	mulsd %xmm2, %xmm1
	movsd -400(%rbp), %xmm2
	movsd -464(%rbp), %xmm3
	vfmsub231sd %xmm2, %xmm3, %xmm1
	mulsd %xmm0, %xmm1
	movsd %xmm1, 40(%rsi)
	movsd -408(%rbp), %xmm1
	movsd -448(%rbp), %xmm2
	mulsd %xmm2, %xmm1
	movsd -400(%rbp), %xmm2
	movsd -456(%rbp), %xmm3
	vfmsub231sd %xmm2, %xmm3, %xmm1
	xorps %xmm2, %xmm2
	movaps %xmm1, %xmm15
	movaps %xmm2, %xmm1
	subsd %xmm15, %xmm1
	mulsd %xmm0, %xmm1
	movsd %xmm1, 48(%rsi)
	movsd -416(%rbp), %xmm1
	movsd -432(%rbp), %xmm2
	mulsd %xmm2, %xmm1
	movsd -408(%rbp), %xmm2
	movsd -440(%rbp), %xmm3
	vfmsub231sd %xmm2, %xmm3, %xmm1
	mulsd %xmm0, %xmm1
	movsd %xmm1, 64(%rsi)
	movsd -416(%rbp), %xmm1
	movsd -424(%rbp), %xmm2
	mulsd %xmm2, %xmm1
	movsd -400(%rbp), %xmm2
	movsd -440(%rbp), %xmm3
	vfmsub231sd %xmm2, %xmm3, %xmm1
	xorps %xmm2, %xmm2
	movaps %xmm1, %xmm15
	movaps %xmm2, %xmm1
	subsd %xmm15, %xmm1
	mulsd %xmm0, %xmm1
	movsd %xmm1, 72(%rsi)
	movsd -408(%rbp), %xmm1
	movsd -424(%rbp), %xmm2
	mulsd %xmm2, %xmm1
	movsd -400(%rbp), %xmm2
	movsd -432(%rbp), %xmm3
	vfmsub231sd %xmm2, %xmm3, %xmm1
	mulsd %xmm1, %xmm0
	movsd %xmm0, 80(%rsi)
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 24(%rsi)
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 56(%rsi)
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 88(%rsi)
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 96(%rsi)
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 104(%rsi)
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 112(%rsi)
	movabsq $1065353216, %r10
	movq %r10, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 120(%rsi)
	movq -8(%rbp), %rsi
	leave
	ret
.LB8962:
	leaq -392(%rbp), %rcx
	callq raycaster__dmat4_identity__0__ret_DMat4E1
	vmovdqu -392(%rbp), %ymm15
	vmovdqu %ymm15, (%rsi)
	vmovdqu -360(%rbp), %ymm15
	vmovdqu %ymm15, 32(%rsi)
	vmovdqu -328(%rbp), %ymm15
	vmovdqu %ymm15, 64(%rsi)
	vmovdqu -296(%rbp), %ymm15
	vmovdqu %ymm15, 96(%rsi)
	vzeroupper
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl raycaster__rc_tex_build_mips__1__RCTextureE1_ptr1__ret_voidE1
	.def raycaster__rc_tex_build_mips__1__RCTextureE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
raycaster__rc_tex_build_mips__1__RCTextureE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $256, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
	movq %r14, -48(%rbp)
	movq %r15, -56(%rbp)
.LB9095:
	xorps %xmm0, %xmm0
	movq %rcx, -184(%rbp)
	movsd %xmm0, -64(%rbp)
	xorps %xmm0, %xmm0
	movsd %xmm0, -72(%rbp)
	xorps %xmm0, %xmm0
	movsd %xmm0, -80(%rbp)
	xorps %xmm0, %xmm0
	movsd %xmm0, -88(%rbp)
	xorps %xmm0, %xmm0
	movsd %xmm0, -96(%rbp)
	xorps %xmm0, %xmm0
	movsd %xmm0, -104(%rbp)
	xorps %xmm0, %xmm0
	movsd %xmm0, -112(%rbp)
	xorps %xmm0, %xmm0
	movsd %xmm0, -120(%rbp)
	xorps %xmm0, %xmm0
	movsd %xmm0, -128(%rbp)
	xorps %xmm0, %xmm0
	movsd %xmm0, -136(%rbp)
	xorps %xmm0, %xmm0
	movsd %xmm0, -144(%rbp)
	xorps %xmm0, %xmm0
	movsd %xmm0, -152(%rbp)
	movq -184(%rbp), %rax
	movq (%rax), %rcx
	movq %rcx, 16(%rax)
	movl 8(%rax), %ecx
	movl %ecx, 112(%rax)
	movl 12(%rax), %ecx
	movl %ecx, 160(%rax)
	movl $1, 208(%rax)
	movq -184(%rbp), %rax
	movl 8(%rax), %ecx
	movl 12(%rax), %eax
	movq $1, -176(%rbp)
	movq %rcx, -208(%rbp)
	movq $0, -160(%rbp)
.LB9150:
	movq -176(%rbp), %rcx
	cmpl $12, %ecx
	jge .LB9152
.LB9151:
	movq -208(%rbp), %rcx
	movl %ecx, %edx
	sarl $31, %edx
	movl %ecx, %edx
	shrl $31, %edx
	addl %edx, %ecx
	sarl $1, %ecx
	movl %ecx, %esi
	movl %eax, %ecx
	sarl $31, %ecx
	movl %eax, %ecx
	shrl $31, %ecx
	addl %ecx, %eax
	sarl $1, %eax
	movq %rax, -192(%rbp)
	cmpl $1, %esi
	jl .LB9166
.LB9161:
	movq -192(%rbp), %rax
	cmpl $1, %eax
	jl .LB9166
.LB9167:
	movq -192(%rbp), %rax
	imull %esi, %eax
	movq %rax, %rcx
	shlq $3, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -216(%rbp)
	movq -176(%rbp), %rax
	movq -184(%rbp), %rcx
	decl %eax
	movslq %eax, %rax
	movq 16(%rcx,%rax,8), %rdi
	movq -160(%rbp), %rax
	movq $0, -168(%rbp)
.LB9185:
	movq -168(%rbp), %rcx
	movq -192(%rbp), %rdx
	cmpl %edx, %ecx
	jge .LB9187
.LB9186:
	movq -168(%rbp), %rax
	movq -208(%rbp), %rdx
	movl %eax, %ecx
	shll $1, %ecx
	movl %ecx, %ebx
	imull %edx, %ebx
	incl %ecx
	movl %ecx, %r12d
	imull %edx, %r12d
	movl %eax, %r13d
	imull %esi, %r13d
	movq $0, -200(%rbp)
.LB9191:
	movq -200(%rbp), %rax
	cmpl %esi, %eax
	jge .LB9193
.LB9192:
	movq -200(%rbp), %rax
	leaq -64(%rbp), %rdx
	leaq -72(%rbp), %r8
	leaq -80(%rbp), %r9
	movl %eax, %r14d
	shll $1, %r14d
	leal (%rbx,%r14), %eax
	movslq %eax, %rax
	movq (%rdi,%rax,8), %rcx
	callq raycaster__color64_unpack__4__dataE1_ubits64__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__ret_voidE1
	leal 1(%r14), %r15d
	leaq -88(%rbp), %rdx
	leaq -96(%rbp), %r8
	leaq -104(%rbp), %r9
	leal (%rbx,%r15), %eax
	movslq %eax, %rax
	movq (%rdi,%rax,8), %rcx
	callq raycaster__color64_unpack__4__dataE1_ubits64__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__ret_voidE1
	leal (%r12,%r14), %eax
	leaq -112(%rbp), %rdx
	leaq -120(%rbp), %r8
	leaq -128(%rbp), %r9
	movslq %eax, %rax
	movq (%rdi,%rax,8), %rcx
	callq raycaster__color64_unpack__4__dataE1_ubits64__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__ret_voidE1
	leal (%r12,%r15), %eax
	leaq -136(%rbp), %rdx
	leaq -144(%rbp), %r8
	leaq -152(%rbp), %r9
	movslq %eax, %rax
	movq (%rdi,%rax,8), %rcx
	callq raycaster__color64_unpack__4__dataE1_ubits64__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__ret_voidE1
	movsd -64(%rbp), %xmm0
	movsd -88(%rbp), %xmm1
	addsd %xmm1, %xmm0
	movsd -112(%rbp), %xmm1
	addsd %xmm1, %xmm0
	movsd -136(%rbp), %xmm1
	addsd %xmm1, %xmm0
	movabsq $4598175219545276416, %r10
	movq %r10, %xmm1
	mulsd %xmm1, %xmm0
	movsd -72(%rbp), %xmm1
	movsd -96(%rbp), %xmm2
	addsd %xmm2, %xmm1
	movsd -120(%rbp), %xmm2
	addsd %xmm2, %xmm1
	movsd -144(%rbp), %xmm2
	addsd %xmm2, %xmm1
	movabsq $4598175219545276416, %r10
	movq %r10, %xmm2
	mulsd %xmm2, %xmm1
	movsd -80(%rbp), %xmm2
	movsd -104(%rbp), %xmm3
	addsd %xmm3, %xmm2
	movsd -128(%rbp), %xmm3
	addsd %xmm3, %xmm2
	movsd -152(%rbp), %xmm3
	addsd %xmm3, %xmm2
	movabsq $4598175219545276416, %r10
	movq %r10, %xmm3
	mulsd %xmm3, %xmm2
	callq raycaster__color64_pack__3__doubleE1__doubleE1__doubleE1__ret_dataE1_ubits64
	movq -200(%rbp), %rcx
	movq -216(%rbp), %r8
	leal (%r13,%rcx), %edx
	incl %ecx
	movslq %edx, %rdx
	movq %rax, (%r8,%rdx,8)
	movq %rcx, -200(%rbp)
	jmp .LB9191
.LB9187:
	movq -176(%rbp), %rcx
	movq -216(%rbp), %rdx
	movq -184(%rbp), %rdi
	movslq %ecx, %rcx
	movq %rdx, 16(%rdi,%rcx,8)
	movl %esi, 112(%rdi,%rcx,4)
	movq -192(%rbp), %rdx
	movl %edx, 160(%rdi,%rcx,4)
	movq -176(%rbp), %rcx
	incl %ecx
	movl %ecx, 208(%rdi)
	movq %rcx, -176(%rbp)
	movq %rsi, -208(%rbp)
	movq %rax, -160(%rbp)
	movq -192(%rbp), %rax
	jmp .LB9150
.LB9193:
	movq -168(%rbp), %rax
	incl %eax
	movq %rax, -168(%rbp)
	movq -200(%rbp), %rax
	jmp .LB9185
.LB9166:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB9152:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
	.text
	.globl raycaster__rc_tex_free_mips__1__RCTextureE1_ptr1__ret_voidE1
	.def raycaster__rc_tex_free_mips__1__RCTextureE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
raycaster__rc_tex_free_mips__1__RCTextureE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
.LB9300:
	movq %rcx, %rsi
	movl $1, %edi
.LB9303:
	cmpl 208(%rsi), %edi
	jge .LB9305
.LB9304:
	movslq %edi, %rax
	movq 16(%rsi,%rax,8), %rax
	testq %rax, %rax
	jne .LB9321
.LB9323:
	incl %edi
	cmpl 208(%rsi), %edi
	jl .LB9304
.LB9305:
	movl $1, 208(%rsi)
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB9321:
	movslq %edi, %rbx
	movq 16(%rsi,%rbx,8), %rax
	movq %rax, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movq $0, 16(%rsi,%rbx,8)
	jmp .LB9323
	.text
	.globl raycaster__rc_tex_bilinear_level__5__dataE1_ptr1_ubits64__dataE1_sbits32__dataE1_sbits32__doubleE1__doubleE1__ret_dataE1_ubits64
	.def raycaster__rc_tex_bilinear_level__5__dataE1_ptr1_ubits64__dataE1_sbits32__dataE1_sbits32__doubleE1__doubleE1__ret_dataE1_ubits64;
	.scl 2;
	.type 32;
	.endef
raycaster__rc_tex_bilinear_level__5__dataE1_ptr1_ubits64__dataE1_sbits32__dataE1_sbits32__doubleE1__doubleE1__ret_dataE1_ubits64:
	subq $48, %rsp
	movq %rbx, 32(%rsp)
	movq %rsi, 24(%rsp)
	movq %rdi, 16(%rsp)
	movq %r12, 8(%rsp)
	movq %r13, 0(%rsp)
	movq %r14, -8(%rsp)
.LB9341:
	movaps %xmm3, %xmm0
	movsd 88(%rsp), %xmm1
	leal -1(%rdx), %eax
	movl $65536, %r13d
	movslq %eax, %rsi
	xorps %xmm2, %xmm2
	cvtsi2sdq %rsi, %xmm2
	leal -1(%r8), %esi
	movslq %esi, %rdi
	mulsd %xmm2, %xmm0
	xorps %xmm2, %xmm2
	cvtsi2sdq %rdi, %xmm2
	cvttsd2siq %xmm0, %rdi
	mulsd %xmm2, %xmm1
	movl %edi, %edi
	cvttsd2siq %xmm1, %r9
	leal 1(%rdi), %ebx
	movl %r9d, %r9d
	leal 1(%r9), %r12d
	cmpl %edx, %ebx
	cmovge %eax, %ebx
	movslq %edi, %rax
	cmpl %r8d, %r12d
	movl $65536, %r8d
	xorps %xmm2, %xmm2
	cvtsi2sdq %rax, %xmm2
	cmovge %esi, %r12d
	movslq %r9d, %rsi
	subsd %xmm2, %xmm0
	movabsq $4679240012837945344, %r10
	movq %r10, %xmm2
	mulsd %xmm2, %xmm0
	cvttsd2siq %xmm0, %rax
	xorps %xmm0, %xmm0
	cvtsi2sdq %rsi, %xmm0
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subsd %xmm15, %xmm0
	movabsq $4679240012837945344, %r10
	movq %r10, %xmm1
	cmpq $65536, %rax
	cmova %r8, %rax
	movl $65536, %r8d
	mulsd %xmm1, %xmm0
	cvttsd2siq %xmm0, %rsi
	cmpq $65536, %rsi
	cmova %r8, %rsi
	movl $65536, %r8d
	subq %rax, %r8
	subq %rsi, %r13
	imull %edx, %r9d
	leal (%r9,%rdi), %r14d
	movslq %r14d, %r14
	movq (%rcx,%r14,8), %r14
	addl %ebx, %r9d
	imull %edx, %r12d
	movslq %r9d, %r9
	movq (%rcx,%r9,8), %r9
	leal (%r12,%rdi), %edx
	addl %ebx, %r12d
	movslq %edx, %rdx
	movslq %r12d, %rdi
	movq (%rcx,%rdx,8), %rdx
	movq (%rcx,%rdi,8), %rcx
	movq %r14, %rdi
	shrq $32, %rdi
	andq $65535, %rdi
	imulq %r8, %rdi
	imulq %r13, %rdi
	movq %r9, %rbx
	shrq $32, %rbx
	andq $65535, %rbx
	imulq %rax, %rbx
	imulq %r13, %rbx
	addq %rbx, %rdi
	movq %rdx, %rbx
	shrq $32, %rbx
	andq $65535, %rbx
	imulq %r8, %rbx
	imulq %rsi, %rbx
	addq %rbx, %rdi
	movq %rcx, %rbx
	shrq $32, %rbx
	andq $65535, %rbx
	imulq %rax, %rbx
	imulq %rsi, %rbx
	addq %rbx, %rdi
	shrq $32, %rdi
	movq %r14, %rbx
	shrq $16, %rbx
	andq $65535, %rbx
	imulq %r8, %rbx
	imulq %r13, %rbx
	movq %r9, %r12
	shrq $16, %r12
	andq $65535, %r12
	imulq %rax, %r12
	imulq %r13, %r12
	addq %r12, %rbx
	movq %rdx, %r12
	shrq $16, %r12
	andq $65535, %r12
	imulq %r8, %r12
	imulq %rsi, %r12
	addq %r12, %rbx
	movq %rcx, %r12
	shrq $16, %r12
	andq $65535, %r12
	imulq %rax, %r12
	imulq %rsi, %r12
	addq %r12, %rbx
	shrq $32, %rbx
	andq $65535, %r14
	imulq %r8, %r14
	imulq %r13, %r14
	andq $65535, %r9
	imulq %rax, %r9
	imulq %r13, %r9
	addq %r9, %r14
	andq $65535, %rdx
	imulq %r8, %rdx
	imulq %rsi, %rdx
	addq %rdx, %r14
	andq $65535, %rcx
	imulq %rax, %rcx
	imulq %rsi, %rcx
	addq %rcx, %r14
	shrq $32, %r14
	shlq $32, %rdi
	movabsq $-281474976710656, %rax
	orq %rax, %rdi
	shlq $16, %rbx
	orq %rbx, %rdi
	movq %rdi, %rax
	orq %r14, %rax
	movq 32(%rsp), %rbx
	movq 24(%rsp), %rsi
	movq 16(%rsp), %rdi
	movq 8(%rsp), %r12
	movq 0(%rsp), %r13
	movq -8(%rsp), %r14
	addq $48, %rsp
	ret
	.text
	.globl raycaster__rc_tex_select_lod__5__RCTextureE1_ptr1__doubleE1__dataE1_ptr1_sbits32__dataE1_ptr1_sbits32__doubleE1_ptr1__ret_voidE1
	.def raycaster__rc_tex_select_lod__5__RCTextureE1_ptr1__doubleE1__dataE1_ptr1_sbits32__dataE1_ptr1_sbits32__doubleE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
raycaster__rc_tex_select_lod__5__RCTextureE1_ptr1__doubleE1__dataE1_ptr1_sbits32__dataE1_ptr1_sbits32__doubleE1_ptr1__ret_voidE1:
.LB9587:
	movaps %xmm1, %xmm0
	movabsq $4611686018427387904, %r10
	movq %r10, %xmm1
	movq 40(%rsp), %rax
	ucomisd %xmm0, %xmm1
	ja .LB9595
.LB9596:
	movaps %xmm0, %xmm1
	xorps %xmm0, %xmm0
.LB9604:
	movabsq $4611686018427387904, %r10
	movq %r10, %xmm2
	ucomisd %xmm2, %xmm1
	jbe .LB9606
.LB9609:
	movl 208(%rcx), %edx
	subl $2, %edx
	movslq %edx, %rdx
	xorps %xmm2, %xmm2
	cvtsi2sdq %rdx, %xmm2
	ucomisd %xmm0, %xmm2
	jbe .LB9606
.LB9605:
	movabsq $4602678819172646912, %r10
	movq %r10, %xmm2
	mulsd %xmm2, %xmm1
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm2
	addsd %xmm2, %xmm0
	jmp .LB9604
.LB9606:
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm2
	subsd %xmm2, %xmm1
	xorps %xmm2, %xmm2
	movsd %xmm1, (%rax)
	ucomisd %xmm1, %xmm2
	ja .LB9631
.LB9633:
	movsd (%rax), %xmm1
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm2
	ucomisd %xmm2, %xmm1
	ja .LB9638
.LB9640:
	cvttsd2siq %xmm0, %rax
	movl %eax, %eax
	movl %eax, (%r8)
	incl %eax
	movl %eax, (%r9)
	movl (%r8), %eax
	movl 208(%rcx), %edx
	cmpl %edx, %eax
	jge .LB9656
.LB9658:
	movl (%r9), %eax
	movl 208(%rcx), %ecx
	cmpl %ecx, %eax
	jge .LB9672
.LB9673:
	ret
.LB9631:
	xorps %xmm1, %xmm1
	movsd %xmm1, (%rax)
	jmp .LB9633
.LB9638:
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm1
	movsd %xmm1, (%rax)
	jmp .LB9640
.LB9656:
	decl %edx
	movl %edx, (%r8)
	jmp .LB9658
.LB9672:
	decl %ecx
	movl %ecx, (%r9)
	ret
.LB9595:
	movl $0, (%r8)
	movl $0, (%r9)
	xorps %xmm0, %xmm0
	movsd %xmm0, (%rax)
	ret
	.text
	.globl raycaster__rc_tex_sample_lod__6__RCTextureE1_ptr1__doubleE1__doubleE1__dataE1_sbits32__dataE1_sbits32__doubleE1__ret_dataE1_ubits64
	.def raycaster__rc_tex_sample_lod__6__RCTextureE1_ptr1__doubleE1__doubleE1__dataE1_sbits32__dataE1_sbits32__doubleE1__ret_dataE1_ubits64;
	.scl 2;
	.type 32;
	.endef
raycaster__rc_tex_sample_lod__6__RCTextureE1_ptr1__doubleE1__doubleE1__dataE1_sbits32__dataE1_sbits32__doubleE1__ret_dataE1_ubits64:
	pushq %rbp
	movq %rsp, %rbp
	subq $96, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
.LB9681:
	movaps %xmm1, %xmm0
	movl %r9d, %edi
	movq %rcx, %rsi
	movsd %xmm0, -40(%rbp)
	movaps %xmm2, %xmm0
	movslq %edi, %rax
	movsd %xmm0, -48(%rbp)
	movl 48(%rbp), %ebx
	movsd 56(%rbp), %xmm0
	movsd %xmm0, -56(%rbp)
	movq 16(%rsi,%rax,8), %rcx
	movl 112(%rsi,%rax,4), %edx
	movl 160(%rsi,%rax,4), %r8d
	movsd -48(%rbp), %xmm0
	movsd %xmm0, 32(%rsp)
	movsd -40(%rbp), %xmm0
	movaps %xmm0, %xmm3
	callq raycaster__rc_tex_bilinear_level__5__dataE1_ptr1_ubits64__dataE1_sbits32__dataE1_sbits32__doubleE1__doubleE1__ret_dataE1_ubits64
	movq %rax, %r12
	cmpl %edi, %ebx
	je .LB9726
.LB9721:
	movabsq $4562254508917369340, %r10
	movq %r10, %xmm0
	movsd -56(%rbp), %xmm1
	ucomisd %xmm1, %xmm0
	ja .LB9726
.LB9727:
	movslq %ebx, %rax
	movq 16(%rsi,%rax,8), %rcx
	movl 112(%rsi,%rax,4), %edx
	movl 160(%rsi,%rax,4), %r8d
	movsd -48(%rbp), %xmm0
	movsd %xmm0, 32(%rsp)
	movsd -40(%rbp), %xmm0
	movaps %xmm0, %xmm3
	callq raycaster__rc_tex_bilinear_level__5__dataE1_ptr1_ubits64__dataE1_sbits32__dataE1_sbits32__doubleE1__doubleE1__ret_dataE1_ubits64
	movabsq $4679240012837945344, %r10
	movq %r10, %xmm0
	movsd -56(%rbp), %xmm1
	mulsd %xmm1, %xmm0
	cvttsd2siq %xmm0, %rcx
	movl $65536, %edx
	cmpq $65536, %rcx
	cmova %rdx, %rcx
	movl $65536, %edx
	subq %rcx, %rdx
	movq %r12, %rsi
	shrq $32, %rsi
	andq $65535, %rsi
	movq %rax, %rdi
	shrq $32, %rdi
	andq $65535, %rdi
	movq %r12, %r8
	shrq $16, %r8
	andq $65535, %r8
	movq %rax, %r9
	shrq $16, %r9
	andq $65535, %r9
	andq $65535, %r12
	andq $65535, %rax
	imulq %rdx, %rsi
	imulq %rcx, %rdi
	addq %rdi, %rsi
	shrq $16, %rsi
	imulq %rdx, %r8
	imulq %rcx, %r9
	addq %r9, %r8
	shrq $16, %r8
	imulq %rdx, %r12
	imulq %rcx, %rax
	addq %rax, %r12
	shrq $16, %r12
	shlq $32, %rsi
	movabsq $-281474976710656, %rax
	orq %rax, %rsi
	shlq $16, %r8
	orq %r8, %rsi
	movq %rsi, %rax
	orq %r12, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB9726:
	movq %r12, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
	.text
	.globl raycaster__rc_tex_sample_mip__4__RCTextureE1_ptr1__doubleE1__doubleE1__doubleE1__ret_dataE1_ubits64
	.def raycaster__rc_tex_sample_mip__4__RCTextureE1_ptr1__doubleE1__doubleE1__doubleE1__ret_dataE1_ubits64;
	.scl 2;
	.type 32;
	.endef
raycaster__rc_tex_sample_mip__4__RCTextureE1_ptr1__doubleE1__doubleE1__doubleE1__ret_dataE1_ubits64:
	pushq %rbp
	movq %rsp, %rbp
	subq $96, %rsp
	movq %rsi, -8(%rbp)
.LB9831:
	movaps %xmm1, %xmm0
	movaps %xmm2, %xmm1
	movaps %xmm3, %xmm2
	xorps %xmm3, %xmm3
	cvttsd2siq %xmm0, %rax
	movl $0, -12(%rbp)
	movl $0, -16(%rbp)
	movq %rcx, %rsi
	movsd %xmm3, -24(%rbp)
	movl %eax, %eax
	movslq %eax, %rax
	xorps %xmm3, %xmm3
	cvtsi2sdq %rax, %xmm3
	cvttsd2siq %xmm1, %rax
	subsd %xmm3, %xmm0
	movl %eax, %eax
	movslq %eax, %rax
	xorps %xmm3, %xmm3
	cvtsi2sdq %rax, %xmm3
	subsd %xmm3, %xmm1
	xorps %xmm3, %xmm3
	ucomisd %xmm0, %xmm3
	ja .LB9853
.LB9854:
	movsd %xmm0, -32(%rbp)
.LB9855:
	xorps %xmm0, %xmm0
	ucomisd %xmm1, %xmm0
	ja .LB9861
.LB9862:
	movsd %xmm1, -40(%rbp)
.LB9863:
	cmpl $1, 208(%rsi)
	jle .LB9872
.LB9873:
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm0
	ucomisd %xmm2, %xmm0
	ja .LB9892
.LB9893:
	leaq -12(%rbp), %r8
	leaq -16(%rbp), %r9
	leaq -24(%rbp), %rax
	movq %rsi, %rcx
	movaps %xmm2, %xmm1
	movq %rax, 32(%rsp)
	callq raycaster__rc_tex_select_lod__5__RCTextureE1_ptr1__doubleE1__dataE1_ptr1_sbits32__dataE1_ptr1_sbits32__doubleE1_ptr1__ret_voidE1
	movl -12(%rbp), %r9d
	movl -16(%rbp), %eax
	movsd -24(%rbp), %xmm0
	movq %rax, 32(%rsp)
	movsd %xmm0, 40(%rsp)
	movq %rsi, %rcx
	movsd -32(%rbp), %xmm0
	movaps %xmm0, %xmm1
	movsd -40(%rbp), %xmm0
	movaps %xmm0, %xmm2
	callq raycaster__rc_tex_sample_lod__6__RCTextureE1_ptr1__doubleE1__doubleE1__dataE1_sbits32__dataE1_sbits32__doubleE1__ret_dataE1_ubits64
	movq -8(%rbp), %rsi
	leave
	ret
.LB9853:
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm3
	addsd %xmm3, %xmm0
	movsd %xmm0, -32(%rbp)
	jmp .LB9855
.LB9861:
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm0
	addsd %xmm1, %xmm0
	movsd %xmm0, -40(%rbp)
	cmpl $1, 208(%rsi)
	jle .LB9872
	jmp .LB9873
.LB9892:
	movslq 112(%rsi), %rax
	movsd -32(%rbp), %xmm1
	movslq 160(%rsi), %rcx
	xorps %xmm0, %xmm0
	cvtsi2sdq %rax, %xmm0
	mulsd %xmm1, %xmm0
	movsd -40(%rbp), %xmm1
	cvttsd2siq %xmm0, %rax
	xorps %xmm0, %xmm0
	cvtsi2sdq %rcx, %xmm0
	movl %eax, %eax
	mulsd %xmm1, %xmm0
	cvttsd2siq %xmm0, %rcx
	movl %ecx, %ecx
	cmpl 112(%rsi), %eax
	jae .LB9922
.LB9923:
.LB9924:
	cmpl 160(%rsi), %ecx
	jae .LB9938
.LB9939:
.LB9940:
	movq 16(%rsi), %rdx
	imull 112(%rsi), %ecx
	addl %eax, %ecx
	movslq %ecx, %rax
	movq (%rdx,%rax,8), %rax
	movq -8(%rbp), %rsi
	leave
	ret
.LB9922:
	movl 112(%rsi), %eax
	decl %eax
	cmpl 160(%rsi), %ecx
	jb .LB9939
.LB9938:
	movl 160(%rsi), %ecx
	decl %ecx
	jmp .LB9940
.LB9872:
	movq (%rsi), %rcx
	movl 8(%rsi), %edx
	movl 12(%rsi), %r8d
	movsd -40(%rbp), %xmm0
	movsd %xmm0, 32(%rsp)
	movsd -32(%rbp), %xmm0
	movaps %xmm0, %xmm3
	callq raycaster__rc_tex_bilinear_level__5__dataE1_ptr1_ubits64__dataE1_sbits32__dataE1_sbits32__doubleE1__doubleE1__ret_dataE1_ubits64
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl raycaster__rc_palette_init__2__RCTexturePaletteE1_ptr1__dataE1_sbits32__ret_voidE1
	.def raycaster__rc_palette_init__2__RCTexturePaletteE1_ptr1__dataE1_sbits32__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
raycaster__rc_palette_init__2__RCTexturePaletteE1_ptr1__dataE1_sbits32__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB9974:
	movq %rcx, %rsi
	movl %edx, %edi
	imull $212, %edi, %eax
	movl %eax, %ecx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, (%rsi)
	movl $0, 8(%rsi)
	movl %edi, 12(%rsi)
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
	.text
	.globl raycaster__rc_palette_free__1__RCTexturePaletteE1_ptr1__ret_voidE1
	.def raycaster__rc_palette_free__1__RCTexturePaletteE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
raycaster__rc_palette_free__1__RCTexturePaletteE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
.LB9992:
	movq %rcx, %rsi
	xorl %edi, %edi
.LB9995:
	cmpl 8(%rsi), %edi
	jge .LB9997
.LB9996:
	movq (%rsi), %rax
	movslq %edi, %rbx
	imulq $212, %rbx, %rcx
	leaq (%rax,%rcx,1), %rcx
	callq raycaster__rc_tex_free_mips__1__RCTextureE1_ptr1__ret_voidE1
	movq (%rsi), %rax
	imulq $212, %rbx, %rbx
	movq (%rax,%rbx,1), %rax
	testq %rax, %rax
	jne .LB10026
.LB10028:
	incl %edi
	cmpl 8(%rsi), %edi
	jl .LB9996
.LB9997:
	movq (%rsi), %rax
	movq %rax, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movq $0, (%rsi)
	movl $0, 8(%rsi)
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB10026:
	movq %rax, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	jmp .LB10028
	.text
	.globl raycaster__rc_palette_add__4__RCTexturePaletteE1_ptr1__dataE1_ptr1_ubits64__dataE1_sbits32__dataE1_sbits32__ret_dataE1_sbits32
	.def raycaster__rc_palette_add__4__RCTexturePaletteE1_ptr1__dataE1_ptr1_ubits64__dataE1_sbits32__dataE1_sbits32__ret_dataE1_sbits32;
	.scl 2;
	.type 32;
	.endef
raycaster__rc_palette_add__4__RCTexturePaletteE1_ptr1__dataE1_ptr1_ubits64__dataE1_sbits32__dataE1_sbits32__ret_dataE1_sbits32:
	pushq %rbp
	movq %rsp, %rbp
	subq $80, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
.LB10057:
	movq %rcx, %rsi
	movq %rdx, %rdi
	movl %r8d, %ebx
	movl %r9d, %r12d
	movl 8(%rsi), %eax
	movl 12(%rsi), %ecx
	cmpl %ecx, %eax
	jge .LB10074
.LB10076:
	movl 8(%rsi), %r13d
	movq (%rsi), %rax
	movslq %r13d, %rcx
	imulq $212, %rcx, %rdx
	movq %rdi, (%rax,%rdx,1)
	movq (%rsi), %rax
	imulq $212, %rcx, %rdx
	movl %ebx, 8(%rax,%rdx,1)
	movq (%rsi), %rax
	imulq $212, %rcx, %rdx
	movl %r12d, 12(%rax,%rdx,1)
	movq (%rsi), %rax
	imulq $212, %rcx, %rdx
	movl $1, 208(%rax,%rdx,1)
	movq (%rsi), %rax
	imulq $212, %rcx, %rcx
	leaq (%rax,%rcx,1), %rcx
	callq raycaster__rc_tex_build_mips__1__RCTextureE1_ptr1__ret_voidE1
	movl 8(%rsi), %eax
	incl %eax
	movl %eax, 8(%rsi)
	movl %r13d, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB10074:
	shll $1, %ecx
	movl %ecx, 12(%rsi)
	imull $212, %ecx, %eax
	movl %eax, %ecx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, %r13
	movq (%rsi), %rax
	movq %r13, %rcx
	movq %rax, %rdx
	movl 8(%rsi), %eax
	imull $212, %eax, %eax
	movl %eax, %r8d
	callq memcpy
	movq (%rsi), %rax
	movq %rax, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movq %r13, (%rsi)
	jmp .LB10076
	.text
	.globl raycaster__r3d_player_init__4__R3DPlayerE1_ptr1__doubleE1__doubleE1__doubleE1__ret_voidE1
	.def raycaster__r3d_player_init__4__R3DPlayerE1_ptr1__doubleE1__doubleE1__doubleE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
raycaster__r3d_player_init__4__R3DPlayerE1_ptr1__doubleE1__doubleE1__doubleE1__ret_voidE1:
.LB10167:
	movaps %xmm1, %xmm0
	movaps %xmm2, %xmm1
	movaps %xmm3, %xmm2
	movsd %xmm0, (%rcx)
	movsd %xmm1, 8(%rcx)
	movsd %xmm2, 16(%rcx)
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 24(%rcx)
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 32(%rcx)
	movabsq $1036831949, %r10
	movq %r10, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 40(%rcx)
	movabsq $990057071, %r10
	movq %r10, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 48(%rcx)
	movabsq $990057071, %r10
	movq %r10, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 56(%rcx)
	ret
	.text
	.globl raycaster__r3d_player_move__4__R3DPlayerE1_ptr1__doubleE1__doubleE1__doubleE1__ret_voidE1
	.def raycaster__r3d_player_move__4__R3DPlayerE1_ptr1__doubleE1__doubleE1__doubleE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
raycaster__r3d_player_move__4__R3DPlayerE1_ptr1__doubleE1__doubleE1__doubleE1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $80, %rsp
	movq %rsi, -8(%rbp)
.LB10196:
	movq %rcx, %rsi
	movaps %xmm1, %xmm0
	movsd %xmm0, -16(%rbp)
	movaps %xmm2, %xmm0
	movsd %xmm0, -24(%rbp)
	movaps %xmm3, %xmm0
	movsd %xmm0, -32(%rbp)
	movsd 24(%rsi), %xmm0
	callq standard__math__cos__1__doubleE1__ret_doubleE1
	movsd %xmm0, -40(%rbp)
	movsd 24(%rsi), %xmm0
	callq standard__math__sin__1__doubleE1__ret_doubleE1
	movsd (%rsi), %xmm1
	movsd -24(%rbp), %xmm2
	movsd -40(%rbp), %xmm3
	movsd -16(%rbp), %xmm4
	mulsd %xmm0, %xmm2
	vfmadd231sd %xmm3, %xmm4, %xmm2
	addsd %xmm2, %xmm1
	movsd %xmm1, (%rsi)
	movsd 8(%rsi), %xmm1
	movsd -32(%rbp), %xmm2
	addsd %xmm2, %xmm1
	movsd %xmm1, 8(%rsi)
	movsd 16(%rsi), %xmm1
	movsd -40(%rbp), %xmm2
	movsd -24(%rbp), %xmm3
	mulsd %xmm3, %xmm2
	movsd -16(%rbp), %xmm3
	vfmsub132sd %xmm3, %xmm2, %xmm0
	addsd %xmm1, %xmm0
	movsd %xmm0, 16(%rsi)
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl raycaster__r3d_player_turn__3__R3DPlayerE1_ptr1__doubleE1__doubleE1__ret_voidE1
	.def raycaster__r3d_player_turn__3__R3DPlayerE1_ptr1__doubleE1__doubleE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
raycaster__r3d_player_turn__3__R3DPlayerE1_ptr1__doubleE1__doubleE1__ret_voidE1:
.LB10249:
	movaps %xmm1, %xmm0
	movaps %xmm2, %xmm1
	movsd 24(%rcx), %xmm2
	addsd %xmm2, %xmm0
	movsd %xmm0, 24(%rcx)
.LB10262:
	movsd 24(%rcx), %xmm0
	movabsq $4618760256179416344, %r10
	movq %r10, %xmm2
	ucomisd %xmm2, %xmm0
	jb .LB10277
.LB10263:
	movabsq $4618760256179416344, %r10
	movq %r10, %xmm2
	subsd %xmm2, %xmm0
	movsd %xmm0, 24(%rcx)
	jmp .LB10262
.LB10277:
	movsd 24(%rcx), %xmm0
	xorps %xmm2, %xmm2
	cvtss2sd %xmm2, %xmm2
	ucomisd %xmm0, %xmm2
	jbe .LB10279
.LB10278:
	movabsq $4618760256179416344, %r10
	movq %r10, %xmm2
	addsd %xmm2, %xmm0
	movsd %xmm0, 24(%rcx)
	jmp .LB10277
.LB10279:
	movsd 32(%rcx), %xmm0
	movabsq $4609753056924675352, %r10
	movq %r10, %xmm2
	addsd %xmm1, %xmm0
	movabsq $1065185444, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	movsd %xmm0, 32(%rcx)
	mulsd %xmm2, %xmm1
	ucomisd %xmm1, %xmm0
	ja .LB10309
.LB10311:
	movsd 32(%rcx), %xmm0
	xorps %xmm2, %xmm2
	subsd %xmm1, %xmm2
	ucomisd %xmm0, %xmm2
	ja .LB10322
.LB10323:
	ret
.LB10309:
	movsd %xmm1, 32(%rcx)
	jmp .LB10311
.LB10322:
	xorps %xmm0, %xmm0
	subsd %xmm1, %xmm0
	movsd %xmm0, 32(%rcx)
	ret
	.text
	.globl raycaster__r3d_camera_init__6__R3DCameraE1_ptr1__doubleE1__dataE1_sbits32__dataE1_sbits32__doubleE1__doubleE1__ret_voidE1
	.def raycaster__r3d_camera_init__6__R3DCameraE1_ptr1__doubleE1__dataE1_sbits32__dataE1_sbits32__doubleE1__doubleE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
raycaster__r3d_camera_init__6__R3DCameraE1_ptr1__doubleE1__dataE1_sbits32__dataE1_sbits32__doubleE1__doubleE1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $352, %rsp
	movq %rsi, -8(%rbp)
.LB10329:
	movaps %xmm1, %xmm0
	movsd 48(%rbp), %xmm1
	movq %rcx, %rsi
	movslq %r8d, %rax
	movsd %xmm1, -272(%rbp)
	movsd 56(%rbp), %xmm2
	movsd %xmm2, -280(%rbp)
	movl %r8d, 16(%rsi)
	movl %r9d, 20(%rsi)
	movsd %xmm1, 24(%rsi)
	xorps %xmm1, %xmm1
	cvtsi2sdq %rax, %xmm1
	movslq %r9d, %rax
	movsd %xmm2, 32(%rsi)
	xorps %xmm2, %xmm2
	cvtsi2sdq %rax, %xmm2
	movsd %xmm1, -288(%rbp)
	divsd %xmm2, %xmm1
	movsd %xmm1, 40(%rsi)
	movabsq $4580687790476533049, %r10
	movq %r10, %xmm1
	mulsd %xmm1, %xmm0
	movabsq $1056964608, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	movsd %xmm0, (%rsi)
	mulsd %xmm1, %xmm0
	movsd %xmm0, -296(%rbp)
	callq standard__math__tan__1__doubleE1__ret_doubleE1
	movsd 40(%rsi), %xmm1
	divsd %xmm1, %xmm0
	callq standard__math__atan__1__doubleE1__ret_doubleE1
	movabsq $1073741824, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	mulsd %xmm1, %xmm0
	movsd %xmm0, 8(%rsi)
	movabsq $1056964608, %r10
	movq %r10, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd -288(%rbp), %xmm1
	mulsd %xmm1, %xmm0
	movsd %xmm0, -304(%rbp)
	movsd -296(%rbp), %xmm0
	callq standard__math__tan__1__doubleE1__ret_doubleE1
	movsd -304(%rbp), %xmm1
	leaq -136(%rbp), %rcx
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	divsd %xmm15, %xmm0
	movsd %xmm0, 48(%rsi)
	callq raycaster__dmat4_identity__0__ret_DMat4E1
	vmovdqu -136(%rbp), %ymm15
	vmovdqu %ymm15, 56(%rsi)
	vmovdqu -104(%rbp), %ymm15
	vmovdqu %ymm15, 88(%rsi)
	vmovdqu -72(%rbp), %ymm15
	vmovdqu %ymm15, 120(%rsi)
	vmovdqu -40(%rbp), %ymm15
	vmovdqu %ymm15, 152(%rsi)
	vzeroupper
	movsd 8(%rsi), %xmm0
	movsd 40(%rsi), %xmm2
	movsd -280(%rbp), %xmm1
	leaq -264(%rbp), %rcx
	movsd %xmm1, 32(%rsp)
	movaps %xmm0, %xmm1
	movsd -272(%rbp), %xmm0
	movaps %xmm0, %xmm3
	callq raycaster__dmat4_perspective__4__doubleE1__doubleE1__doubleE1__doubleE1__ret_DMat4E1
	vmovdqu -264(%rbp), %ymm15
	vmovdqu %ymm15, 184(%rsi)
	vmovdqu -232(%rbp), %ymm15
	vmovdqu %ymm15, 216(%rsi)
	vmovdqu -200(%rbp), %ymm15
	vmovdqu %ymm15, 248(%rsi)
	vmovdqu -168(%rbp), %ymm15
	vmovdqu %ymm15, 280(%rsi)
	vzeroupper
	vmovdqu -264(%rbp), %ymm15
	vmovdqu %ymm15, 312(%rsi)
	vmovdqu -232(%rbp), %ymm15
	vmovdqu %ymm15, 344(%rsi)
	vmovdqu -200(%rbp), %ymm15
	vmovdqu %ymm15, 376(%rsi)
	vmovdqu -168(%rbp), %ymm15
	vmovdqu %ymm15, 408(%rsi)
	vzeroupper
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 512(%rsi)
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 520(%rsi)
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 528(%rsi)
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 488(%rsi)
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 496(%rsi)
	xorps %xmm0, %xmm0
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	subss %xmm1, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 504(%rsi)
	movabsq $1065353216, %r10
	movq %r10, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 440(%rsi)
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 448(%rsi)
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 456(%rsi)
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 464(%rsi)
	movabsq $1065353216, %r10
	movq %r10, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 472(%rsi)
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 480(%rsi)
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl raycaster__r3d_camera_sync__2__R3DCameraE1_ptr1__R3DPlayerE1_ptr1__ret_voidE1
	.def raycaster__r3d_camera_sync__2__R3DCameraE1_ptr1__R3DPlayerE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
raycaster__r3d_camera_sync__2__R3DCameraE1_ptr1__R3DPlayerE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $960, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB10447:
	movq %rcx, %rsi
	movq %rdx, %rdi
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -40(%rbp)
	movq .LZERO+16(%rip), %r10
	movq %r10, -24(%rbp)
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -64(%rbp)
	movq .LZERO+16(%rip), %r10
	movq %r10, -48(%rbp)
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -88(%rbp)
	movq .LZERO+16(%rip), %r10
	movq %r10, -72(%rbp)
	movsd 24(%rdi), %xmm0
	callq standard__math__cos__1__doubleE1__ret_doubleE1
	movsd %xmm0, -880(%rbp)
	movsd 24(%rdi), %xmm0
	callq standard__math__sin__1__doubleE1__ret_doubleE1
	movsd %xmm0, -888(%rbp)
	movsd 32(%rdi), %xmm0
	callq standard__math__cos__1__doubleE1__ret_doubleE1
	movsd %xmm0, -896(%rbp)
	movsd 32(%rdi), %xmm0
	callq standard__math__sin__1__doubleE1__ret_doubleE1
	movsd %xmm0, -904(%rbp)
	movsd -888(%rbp), %xmm0
	movsd -896(%rbp), %xmm1
	mulsd %xmm1, %xmm0
	movsd %xmm0, -912(%rbp)
	xorps %xmm0, %xmm0
	movsd -880(%rbp), %xmm2
	subsd %xmm2, %xmm0
	mulsd %xmm1, %xmm0
	movsd %xmm0, -920(%rbp)
	movsd (%rdi), %xmm0
	movsd %xmm0, -40(%rbp)
	movsd 8(%rdi), %xmm0
	movsd %xmm0, -32(%rbp)
	movsd 16(%rdi), %xmm0
	movsd %xmm0, -24(%rbp)
	movups -40(%rbp), %xmm15
	movups %xmm15, -112(%rbp)
	movq -24(%rbp), %r10
	movq %r10, -96(%rbp)
	movsd -40(%rbp), %xmm1
	movsd -912(%rbp), %xmm2
	addsd %xmm2, %xmm1
	movsd %xmm1, -64(%rbp)
	movsd -32(%rbp), %xmm1
	movsd -904(%rbp), %xmm2
	addsd %xmm2, %xmm1
	movsd %xmm1, -56(%rbp)
	movsd -920(%rbp), %xmm1
	addsd %xmm1, %xmm0
	movsd %xmm0, -48(%rbp)
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, -88(%rbp)
	movabsq $1065353216, %r10
	movq %r10, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, -80(%rbp)
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, -72(%rbp)
	movups -64(%rbp), %xmm15
	movups %xmm15, -136(%rbp)
	movq -48(%rbp), %r10
	movq %r10, -120(%rbp)
	movups -88(%rbp), %xmm15
	movups %xmm15, -160(%rbp)
	movq -72(%rbp), %r10
	movq %r10, -144(%rbp)
	movups -112(%rbp), %xmm15
	movups %xmm15, -312(%rbp)
	movq -96(%rbp), %r10
	movq %r10, -296(%rbp)
	leaq -312(%rbp), %rdx
	movups -136(%rbp), %xmm15
	movups %xmm15, -336(%rbp)
	movq -120(%rbp), %r10
	movq %r10, -320(%rbp)
	leaq -336(%rbp), %r8
	movups -160(%rbp), %xmm15
	movups %xmm15, -360(%rbp)
	movq -144(%rbp), %r10
	movq %r10, -344(%rbp)
	leaq -360(%rbp), %r9
	leaq -288(%rbp), %rcx
	callq raycaster__dmat4_lookat__3__DVec3E1__DVec3E1__DVec3E1__ret_DMat4E1
	vmovdqu -288(%rbp), %ymm15
	vmovdqu %ymm15, 56(%rsi)
	vmovdqu -256(%rbp), %ymm15
	vmovdqu %ymm15, 88(%rsi)
	vmovdqu -224(%rbp), %ymm15
	vmovdqu %ymm15, 120(%rsi)
	vmovdqu -192(%rbp), %ymm15
	vmovdqu %ymm15, 152(%rsi)
	vzeroupper
	vmovdqu 184(%rsi), %ymm15
	vmovdqu %ymm15, -488(%rbp)
	vmovdqu 216(%rsi), %ymm15
	vmovdqu %ymm15, -456(%rbp)
	vmovdqu 248(%rsi), %ymm15
	vmovdqu %ymm15, -424(%rbp)
	vmovdqu 280(%rsi), %ymm15
	vmovdqu %ymm15, -392(%rbp)
	vzeroupper
	vmovdqu -488(%rbp), %ymm15
	vmovdqu %ymm15, -744(%rbp)
	vmovdqu -456(%rbp), %ymm15
	vmovdqu %ymm15, -712(%rbp)
	vmovdqu -424(%rbp), %ymm15
	vmovdqu %ymm15, -680(%rbp)
	vmovdqu -392(%rbp), %ymm15
	vmovdqu %ymm15, -648(%rbp)
	vzeroupper
	leaq -744(%rbp), %rdx
	vmovdqu -288(%rbp), %ymm15
	vmovdqu %ymm15, -872(%rbp)
	vmovdqu -256(%rbp), %ymm15
	vmovdqu %ymm15, -840(%rbp)
	vmovdqu -224(%rbp), %ymm15
	vmovdqu %ymm15, -808(%rbp)
	vmovdqu -192(%rbp), %ymm15
	vmovdqu %ymm15, -776(%rbp)
	vzeroupper
	leaq -872(%rbp), %r8
	leaq -616(%rbp), %rcx
	callq raycaster__dmat4_mul__2__DMat4E1__DMat4E1__ret_DMat4E1
	vmovdqu -616(%rbp), %ymm15
	vmovdqu %ymm15, 312(%rsi)
	vmovdqu -584(%rbp), %ymm15
	vmovdqu %ymm15, 344(%rsi)
	vmovdqu -552(%rbp), %ymm15
	vmovdqu %ymm15, 376(%rsi)
	vmovdqu -520(%rbp), %ymm15
	vmovdqu %ymm15, 408(%rsi)
	vzeroupper
	movsd (%rdi), %xmm0
	movsd %xmm0, 512(%rsi)
	movsd 8(%rdi), %xmm0
	movsd %xmm0, 520(%rsi)
	movsd 16(%rdi), %xmm0
	movsd %xmm0, 528(%rsi)
	movsd -912(%rbp), %xmm0
	movsd %xmm0, 488(%rsi)
	movsd -904(%rbp), %xmm0
	movsd %xmm0, 496(%rsi)
	movsd -920(%rbp), %xmm0
	movsd %xmm0, 504(%rsi)
	movsd -880(%rbp), %xmm0
	movsd -896(%rbp), %xmm1
	mulsd %xmm1, %xmm0
	movsd %xmm0, 440(%rsi)
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 448(%rsi)
	movsd -888(%rbp), %xmm0
	mulsd %xmm1, %xmm0
	movsd %xmm0, 456(%rsi)
	movsd 440(%rsi), %xmm1
	mulsd %xmm0, %xmm0
	vfmadd231sd %xmm1, %xmm1, %xmm0
	movaps %xmm0, %xmm1
	sqrtsd %xmm1, %xmm0
	movabsq $4517329193108106637, %r10
	movq %r10, %xmm1
	ucomisd %xmm1, %xmm0
	ja .LB10610
.LB10612:
	movsd 448(%rsi), %xmm0
	movsd 456(%rsi), %xmm1
	movsd -904(%rbp), %xmm2
	mulsd %xmm2, %xmm1
	movsd -920(%rbp), %xmm2
	vfmsub132sd %xmm2, %xmm1, %xmm0
	movsd %xmm0, 464(%rsi)
	movsd 456(%rsi), %xmm0
	movsd 440(%rsi), %xmm1
	mulsd %xmm2, %xmm1
	movsd -912(%rbp), %xmm2
	vfmsub132sd %xmm2, %xmm1, %xmm0
	movsd %xmm0, 472(%rsi)
	movsd 440(%rsi), %xmm0
	movsd 448(%rsi), %xmm1
	mulsd %xmm2, %xmm1
	movsd -904(%rbp), %xmm2
	vfmsub132sd %xmm2, %xmm1, %xmm0
	movsd %xmm0, 480(%rsi)
	movsd 464(%rsi), %xmm1
	movsd 472(%rsi), %xmm2
	mulsd %xmm2, %xmm2
	vfmadd132sd %xmm1, %xmm2, %xmm1
	vfmadd132sd %xmm0, %xmm1, %xmm0
	movaps %xmm0, %xmm1
	sqrtsd %xmm1, %xmm0
	movabsq $4517329193108106637, %r10
	movq %r10, %xmm1
	ucomisd %xmm1, %xmm0
	ja .LB10707
.LB10708:
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB10610:
	movsd 440(%rsi), %xmm1
	divsd %xmm0, %xmm1
	movsd %xmm1, 440(%rsi)
	movsd 456(%rsi), %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	divsd %xmm15, %xmm0
	movsd %xmm0, 456(%rsi)
	jmp .LB10612
.LB10707:
	movsd 464(%rsi), %xmm1
	divsd %xmm0, %xmm1
	movsd %xmm1, 464(%rsi)
	movsd 472(%rsi), %xmm1
	divsd %xmm0, %xmm1
	movsd %xmm1, 472(%rsi)
	movsd 480(%rsi), %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	divsd %xmm15, %xmm0
	movsd %xmm0, 480(%rsi)
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
	.text
	.globl raycaster__r3d_mesh_init__4__R3DMeshE1_ptr1__dataE1_sbits32__dataE1_sbits32__dataE1_sbits32__ret_voidE1
	.def raycaster__r3d_mesh_init__4__R3DMeshE1_ptr1__dataE1_sbits32__dataE1_sbits32__dataE1_sbits32__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
raycaster__r3d_mesh_init__4__R3DMeshE1_ptr1__dataE1_sbits32__dataE1_sbits32__dataE1_sbits32__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $80, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
.LB10734:
	movq %rcx, %rsi
	movl %edx, %edi
	movl %r8d, %ebx
	movl %r9d, %r12d
	movl %edi, %eax
	shll $6, %eax
	movl %eax, %ecx
	imull $12, %ebx, %eax
	movl %eax, %r13d
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, (%rsi)
	movq %r13, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, 16(%rsi)
	movl %edi, 8(%rsi)
	movl %ebx, 24(%rsi)
	movl %r12d, 28(%rsi)
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
	.text
	.globl raycaster__r3d_mesh_free__1__R3DMeshE1_ptr1__ret_voidE1
	.def raycaster__r3d_mesh_free__1__R3DMeshE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
raycaster__r3d_mesh_free__1__R3DMeshE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
.LB10768:
	movq %rcx, %rsi
	movq (%rsi), %rax
	movq %rax, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movq 16(%rsi), %rax
	movq %rax, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movq $0, (%rsi)
	movq $0, 16(%rsi)
	movl $0, 8(%rsi)
	movl $0, 24(%rsi)
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl raycaster__r3d_mesh_compute_normals__1__R3DMeshE1_ptr1__ret_voidE1
	.def raycaster__r3d_mesh_compute_normals__1__R3DMeshE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
raycaster__r3d_mesh_compute_normals__1__R3DMeshE1_ptr1__ret_voidE1:
	subq $96, %rsp
	movq %rsi, 80(%rsp)
	movq %rdi, 72(%rsp)
.LB10792:
	xorl %eax, %eax
.LB10817:
	cmpl 8(%rcx), %eax
	jge .LB10819
.LB10818:
	movq (%rcx), %rdx
	movslq %eax, %rsi
	xorps %xmm0, %xmm0
	shlq $6, %rsi
	incl %eax
	cvtss2sd %xmm0, %xmm0
	leaq (%rdx,%rsi,1), %rdx
	movsd %xmm0, 24(%rdx)
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 32(%rdx)
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 40(%rdx)
	cmpl 8(%rcx), %eax
	jl .LB10818
.LB10819:
	xorl %eax, %eax
.LB10842:
	cmpl 24(%rcx), %eax
	jge .LB10844
.LB10843:
	movslq %eax, %rsi
	movq 16(%rcx), %rdx
	leaq (%rsi,%rsi,2), %rsi
	leaq (%rdx,%rsi,4), %rdx
	movl (%rdx), %esi
	movq (%rcx), %rdi
	movslq 4(%rdx), %r8
	movslq 8(%rdx), %rdx
	movslq %esi, %rsi
	shlq $6, %rsi
	shlq $6, %r8
	shlq $6, %rdx
	leaq (%rdi,%rsi,1), %rsi
	leaq (%rdi,%r8,1), %r8
	leaq (%rdi,%rdx,1), %rdx
	movsd (%r8), %xmm0
	movsd (%rsi), %xmm1
	subsd %xmm1, %xmm0
	movsd %xmm0, (%rsp)
	movsd 8(%r8), %xmm0
	movsd 8(%rsi), %xmm2
	movsd 16(%r8), %xmm3
	movsd 16(%rsi), %xmm4
	subsd %xmm2, %xmm0
	subsd %xmm4, %xmm3
	movsd %xmm3, 16(%rsp)
	movsd (%rdx), %xmm3
	movsd %xmm3, 56(%rsp)
	movaps %xmm1, %xmm15
	movaps %xmm3, %xmm1
	subsd %xmm15, %xmm1
	movsd %xmm1, 24(%rsp)
	movsd 8(%rdx), %xmm1
	movsd %xmm1, 48(%rsp)
	subsd %xmm2, %xmm1
	movsd %xmm1, -8(%rsp)
	movsd 16(%rdx), %xmm2
	movsd %xmm2, 40(%rsp)
	movsd 16(%rsp), %xmm3
	subsd %xmm4, %xmm2
	mulsd %xmm3, %xmm1
	movsd %xmm1, 32(%rsp)
	movsd (%rsp), %xmm4
	vfmsub231sd %xmm0, %xmm2, %xmm1
	mulsd %xmm4, %xmm2
	movsd %xmm2, 8(%rsp)
	movsd 24(%rsp), %xmm5
	vfmsub231sd %xmm3, %xmm5, %xmm2
	movsd -8(%rsp), %xmm3
	mulsd %xmm5, %xmm0
	vfmsub231sd %xmm4, %xmm3, %xmm0
	movsd 24(%rsi), %xmm3
	addsd %xmm1, %xmm3
	movsd %xmm3, 24(%rsi)
	movsd 32(%rsi), %xmm3
	addsd %xmm2, %xmm3
	movsd %xmm3, 32(%rsi)
	movsd 40(%rsi), %xmm3
	addsd %xmm0, %xmm3
	movsd %xmm3, 40(%rsi)
	movsd 24(%r8), %xmm3
	addsd %xmm1, %xmm3
	movsd %xmm3, 24(%r8)
	movsd 32(%r8), %xmm3
	addsd %xmm2, %xmm3
	movsd %xmm3, 32(%r8)
	movsd 40(%r8), %xmm3
	addsd %xmm0, %xmm3
	movsd %xmm3, 40(%r8)
	movsd 24(%rdx), %xmm3
	addsd %xmm3, %xmm1
	movsd %xmm1, 24(%rdx)
	movsd 32(%rdx), %xmm1
	addsd %xmm2, %xmm1
	movsd %xmm1, 32(%rdx)
	movsd 40(%rdx), %xmm1
	addsd %xmm1, %xmm0
	movsd %xmm0, 40(%rdx)
	incl %eax
	cmpl 24(%rcx), %eax
	jl .LB10843
.LB10844:
	xorl %eax, %eax
.LB11054:
	movl 8(%rcx), %edx
	cmpl %edx, %eax
	jge .LB11056
.LB11055:
	movq (%rcx), %rdx
	movslq %eax, %rsi
	shlq $6, %rsi
	leaq (%rdx,%rsi,1), %rdx
	movsd 24(%rdx), %xmm0
	movsd 32(%rdx), %xmm1
	mulsd %xmm1, %xmm1
	vfmadd132sd %xmm0, %xmm1, %xmm0
	movsd 40(%rdx), %xmm1
	vfmadd231sd %xmm1, %xmm1, %xmm0
	movaps %xmm0, %xmm1
	sqrtsd %xmm1, %xmm0
	movabsq $4517329193108106637, %r10
	movq %r10, %xmm1
	ucomisd %xmm1, %xmm0
	ja .LB11100
.LB11102:
	incl %eax
	jmp .LB11054
.LB11056:
	xorps %xmm0, %xmm0
	xorps %xmm1, %xmm1
	xorps %xmm2, %xmm2
	movq (%rcx), %rax
	movslq %edx, %rsi
	cvtss2sd %xmm0, %xmm0
	cvtss2sd %xmm1, %xmm1
	cvtss2sd %xmm2, %xmm2
	movq %rax, %rdi
	xorl %eax, %eax
.LB11140:
	cmpq %rsi, %rax
	jge .LB11142
.LB11141:
	movsd (%rdi), %xmm3
	incq %rax
	addsd %xmm3, %xmm0
	movsd 8(%rdi), %xmm3
	addsd %xmm3, %xmm1
	movsd 16(%rdi), %xmm3
	leaq 64(%rdi), %rdi
	addsd %xmm3, %xmm2
	cmpq %rsi, %rax
	jl .LB11141
.LB11142:
	testl %edx, %edx
	jg .LB11249
.LB11250:
	movsd %xmm0, 64(%rsp)
.LB11251:
	xorps %xmm0, %xmm0
	movl 8(%rcx), %eax
	movq (%rcx), %rdx
	cvtss2sd %xmm0, %xmm0
	movslq %eax, %rax
	movq %rdx, %rsi
	xorl %edx, %edx
.LB11269:
	cmpq %rax, %rdx
	jge .LB11271
.LB11270:
	movsd (%rsi), %xmm3
	movsd 64(%rsp), %xmm4
	subsd %xmm4, %xmm3
	movsd 8(%rsi), %xmm4
	movsd 16(%rsi), %xmm5
	subsd %xmm1, %xmm4
	subsd %xmm2, %xmm5
	mulsd %xmm4, %xmm4
	vfmadd132sd %xmm3, %xmm4, %xmm3
	vfmadd231sd %xmm5, %xmm5, %xmm3
	ucomisd %xmm0, %xmm3
	ja .LB11340
.LB11341:
.LB11342:
	incq %rdx
	leaq 64(%rsi), %rsi
	cmpq %rax, %rdx
	jl .LB11270
	jmp .LB11271
.LB11249:
	movslq %edx, %rax
	xorps %xmm3, %xmm3
	cvtsi2sdq %rax, %xmm3
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm4
	movaps %xmm3, %xmm15
	movaps %xmm4, %xmm3
	divsd %xmm15, %xmm3
	mulsd %xmm3, %xmm0
	mulsd %xmm3, %xmm1
	mulsd %xmm3, %xmm2
	movsd %xmm0, 64(%rsp)
	jmp .LB11251
.LB11271:
	movsd 64(%rsp), %xmm3
	movsd %xmm3, 32(%rcx)
	movsd %xmm1, 40(%rcx)
	movsd %xmm2, 48(%rcx)
	movaps %xmm0, %xmm1
	sqrtsd %xmm1, %xmm0
	movsd %xmm0, 56(%rcx)
	movq 80(%rsp), %rsi
	movq 72(%rsp), %rdi
	addq $96, %rsp
	ret
.LB11340:
	movaps %xmm3, %xmm0
	jmp .LB11342
.LB11100:
	movsd 24(%rdx), %xmm1
	divsd %xmm0, %xmm1
	movsd %xmm1, 24(%rdx)
	movsd 32(%rdx), %xmm1
	divsd %xmm0, %xmm1
	movsd %xmm1, 32(%rdx)
	movsd 40(%rdx), %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	divsd %xmm15, %xmm0
	movsd %xmm0, 40(%rdx)
	jmp .LB11102
	.text
	.globl raycaster__r3d_inst_init__2__R3DMeshInstE1_ptr1__R3DMeshE1_ptr1__ret_voidE1
	.def raycaster__r3d_inst_init__2__R3DMeshInstE1_ptr1__R3DMeshE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
raycaster__r3d_inst_init__2__R3DMeshInstE1_ptr1__R3DMeshE1_ptr1__ret_voidE1:
.LB11359:
	xorps %xmm0, %xmm0
	movq %rdx, (%rcx)
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 8(%rcx)
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 16(%rcx)
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 24(%rcx)
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 32(%rcx)
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 40(%rcx)
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 48(%rcx)
	movabsq $1065353216, %r10
	movq %r10, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 56(%rcx)
	movabsq $1065353216, %r10
	movq %r10, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 64(%rcx)
	movabsq $1065353216, %r10
	movq %r10, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 72(%rcx)
	movl $1, 80(%rcx)
	movq $0, 84(%rcx)
	ret
	.text
	.globl raycaster__r3d_light_directional__8__R3DLightE1_ptr1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__ret_voidE1
	.def raycaster__r3d_light_directional__8__R3DLightE1_ptr1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
raycaster__r3d_light_directional__8__R3DLightE1_ptr1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__ret_voidE1:
	subq $32, %rsp
.LB11398:
	movsd 72(%rsp), %xmm5
	movsd 80(%rsp), %xmm0
	movaps %xmm1, %xmm4
	movsd %xmm0, 16(%rsp)
	movsd 88(%rsp), %xmm0
	movsd %xmm0, 8(%rsp)
	movsd 96(%rsp), %xmm0
	movsd %xmm0, (%rsp)
	movaps %xmm2, %xmm0
	mulsd %xmm2, %xmm0
	movl $0, (%rcx)
	vfmadd231sd %xmm4, %xmm4, %xmm0
	vfmadd231sd %xmm3, %xmm3, %xmm0
	movaps %xmm0, %xmm1
	sqrtsd %xmm1, %xmm0
	movabsq $4517329193108106637, %r10
	movq %r10, %xmm1
	ucomisd %xmm1, %xmm0
	ja .LB11424
.LB11425:
.LB11426:
	movsd %xmm4, 8(%rcx)
	movsd %xmm2, 16(%rcx)
	movsd %xmm3, 24(%rcx)
	movsd %xmm5, 56(%rcx)
	movsd 16(%rsp), %xmm0
	movsd %xmm0, 64(%rcx)
	movsd 8(%rsp), %xmm0
	movsd %xmm0, 72(%rcx)
	movsd (%rsp), %xmm0
	movsd %xmm0, 80(%rcx)
	movabsq $1065353216, %r10
	movq %r10, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 88(%rcx)
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 96(%rcx)
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 104(%rcx)
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 112(%rcx)
	addq $32, %rsp
	ret
.LB11424:
	divsd %xmm0, %xmm4
	divsd %xmm0, %xmm2
	divsd %xmm0, %xmm3
	jmp .LB11426
	.text
	.globl raycaster__r3d_light_point__11__R3DLightE1_ptr1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__ret_voidE1
	.def raycaster__r3d_light_point__11__R3DLightE1_ptr1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
raycaster__r3d_light_point__11__R3DLightE1_ptr1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__ret_voidE1:
	subq $64, %rsp
.LB11469:
	movaps %xmm1, %xmm0
	movsd %xmm0, 40(%rsp)
	movaps %xmm2, %xmm0
	movsd %xmm0, 48(%rsp)
	movsd 104(%rsp), %xmm1
	movaps %xmm3, %xmm0
	movsd %xmm1, 8(%rsp)
	movsd 112(%rsp), %xmm1
	movsd %xmm1, 24(%rsp)
	movsd 120(%rsp), %xmm1
	movsd %xmm1, 32(%rsp)
	movsd 128(%rsp), %xmm1
	movsd 136(%rsp), %xmm2
	movsd 144(%rsp), %xmm3
	movsd 152(%rsp), %xmm4
	movl $1, (%rcx)
	movsd 40(%rsp), %xmm5
	movsd %xmm5, 32(%rcx)
	movsd 48(%rsp), %xmm5
	movsd %xmm5, 40(%rcx)
	movsd %xmm0, 48(%rcx)
	movsd 8(%rsp), %xmm0
	xorps %xmm5, %xmm5
	cvtss2sd %xmm5, %xmm5
	movsd %xmm0, 56(%rcx)
	movsd 24(%rsp), %xmm0
	movsd %xmm0, 64(%rcx)
	movsd 32(%rsp), %xmm0
	movsd %xmm0, 72(%rcx)
	movabsq $998445679, %r10
	movq %r10, %xmm0
	movsd %xmm1, 80(%rcx)
	movsd %xmm2, 88(%rcx)
	movsd %xmm3, 96(%rcx)
	movsd %xmm4, 104(%rcx)
	movsd %xmm5, (%rsp)
	movabsq $4517329193108106637, %r10
	movq %r10, %xmm5
	cvtss2sd %xmm0, %xmm0
	movsd %xmm5, 16(%rsp)
	ucomisd %xmm5, %xmm4
	ja .LB11519
.LB11520:
	movabsq $4517329193108106637, %r10
	movq %r10, %xmm4
	ucomisd %xmm4, %xmm3
	ja .LB11530
.LB11531:
	movabsq $4517329193108106637, %r10
	movq %r10, %xmm3
	ucomisd %xmm3, %xmm2
	ja .LB11539
.LB11540:
	movsd 0(%rsp), %xmm0
.LB11521:
	movabsq $1067030938, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	mulsd %xmm1, %xmm0
	mulsd %xmm0, %xmm0
	movsd %xmm0, 112(%rcx)
	addq $64, %rsp
	ret
.LB11539:
	divsd %xmm2, %xmm1
	ucomisd %xmm0, %xmm1
	ja .LB11546
.LB11547:
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
.LB11548:
	jmp .LB11521
.LB11546:
	movabsq $4741671816366391296, %r10
	movq %r10, %xmm0
	jmp .LB11548
.LB11530:
	mulsd %xmm3, %xmm0
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	divsd %xmm15, %xmm0
	jmp .LB11521
.LB11519:
	mulsd %xmm4, %xmm0
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	divsd %xmm15, %xmm0
	movaps %xmm0, %xmm1
	sqrtsd %xmm1, %xmm0
	jmp .LB11521
	.text
	.globl raycaster__r3d_clip_lerp__4__R3DClipVertE1_ptr1__R3DClipVertE1_ptr1__doubleE1__R3DClipVertE1_ptr1__ret_voidE1
	.def raycaster__r3d_clip_lerp__4__R3DClipVertE1_ptr1__R3DClipVertE1_ptr1__doubleE1__R3DClipVertE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
raycaster__r3d_clip_lerp__4__R3DClipVertE1_ptr1__R3DClipVertE1_ptr1__doubleE1__R3DClipVertE1_ptr1__ret_voidE1:
.LB11558:
	movaps %xmm2, %xmm0
	movsd (%rcx), %xmm1
	movsd (%rdx), %xmm2
	subsd %xmm1, %xmm2
	vfmadd231sd %xmm2, %xmm0, %xmm1
	movsd %xmm1, (%r9)
	movsd 8(%rcx), %xmm1
	movsd 8(%rdx), %xmm2
	subsd %xmm1, %xmm2
	vfmadd231sd %xmm2, %xmm0, %xmm1
	movsd %xmm1, 8(%r9)
	movsd 16(%rcx), %xmm1
	movsd 16(%rdx), %xmm2
	subsd %xmm1, %xmm2
	vfmadd231sd %xmm2, %xmm0, %xmm1
	movsd %xmm1, 16(%r9)
	movsd 24(%rcx), %xmm1
	movsd 24(%rdx), %xmm2
	subsd %xmm1, %xmm2
	vfmadd231sd %xmm2, %xmm0, %xmm1
	movsd %xmm1, 24(%r9)
	movsd 32(%rcx), %xmm1
	movsd 32(%rdx), %xmm2
	subsd %xmm1, %xmm2
	vfmadd231sd %xmm2, %xmm0, %xmm1
	movsd %xmm1, 32(%r9)
	movsd 40(%rcx), %xmm1
	movsd 40(%rdx), %xmm2
	subsd %xmm1, %xmm2
	vfmadd231sd %xmm2, %xmm0, %xmm1
	movsd %xmm1, 40(%r9)
	movsd 48(%rcx), %xmm1
	movsd 48(%rdx), %xmm2
	subsd %xmm1, %xmm2
	vfmadd231sd %xmm2, %xmm0, %xmm1
	movsd %xmm1, 48(%r9)
	movsd 56(%rcx), %xmm1
	movsd 56(%rdx), %xmm2
	subsd %xmm1, %xmm2
	vfmadd231sd %xmm2, %xmm0, %xmm1
	movsd %xmm1, 56(%r9)
	movsd 64(%rcx), %xmm1
	movsd 64(%rdx), %xmm2
	subsd %xmm1, %xmm2
	vfmadd231sd %xmm2, %xmm0, %xmm1
	movsd %xmm1, 64(%r9)
	movsd 80(%rcx), %xmm1
	movsd 80(%rdx), %xmm2
	subsd %xmm1, %xmm2
	vfmadd231sd %xmm2, %xmm0, %xmm1
	movsd %xmm1, 80(%r9)
	movsd 88(%rcx), %xmm1
	movsd 88(%rdx), %xmm2
	subsd %xmm1, %xmm2
	vfmadd231sd %xmm2, %xmm0, %xmm1
	movsd %xmm1, 88(%r9)
	movsd 96(%rcx), %xmm1
	movsd 96(%rdx), %xmm2
	subsd %xmm1, %xmm2
	vfmadd132sd %xmm2, %xmm1, %xmm0
	movsd %xmm0, 96(%r9)
	movsd 24(%r9), %xmm0
	movabsq $4517329193108106637, %r10
	movq %r10, %xmm1
	ucomisd %xmm1, %xmm0
	ja .LB11784
.LB11785:
	xorps %xmm0, %xmm0
	movsd %xmm0, 72(%r9)
	ret
.LB11784:
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	divsd %xmm15, %xmm0
	movsd %xmm0, 72(%r9)
	ret
	.text
	.globl raycaster__r3d_clip_frustum__4__R3DClipVertE1_ptr1__dataE1_sbits32__doubleE1__R3DClipVertE1_ptr1__ret_dataE1_sbits32
	.def raycaster__r3d_clip_frustum__4__R3DClipVertE1_ptr1__dataE1_sbits32__doubleE1__R3DClipVertE1_ptr1__ret_dataE1_sbits32;
	.scl 2;
	.type 32;
	.endef
raycaster__r3d_clip_frustum__4__R3DClipVertE1_ptr1__dataE1_sbits32__doubleE1__R3DClipVertE1_ptr1__ret_dataE1_sbits32:
	pushq %rbp
	movq %rsp, %rbp
	subq $2240, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
	movq %r14, -48(%rbp)
	movq %r15, -56(%rbp)
.LB11795:
	movaps %xmm2, %xmm0
	movq %rcx, %rax
	movsd %xmm0, -2144(%rbp)
	movq %r9, -2152(%rbp)
	xorl %ecx, %ecx
	movl $1, %esi
.LB11803:
	cmpl %edx, %ecx
	jge .LB11805
.LB11804:
	movslq %ecx, %rdi
	imulq $104, %rdi, %rdi
	leaq (%rax,%rdi,1), %rdi
	movsd 24(%rdi), %xmm0
	movsd -2144(%rbp), %xmm1
	ucomisd %xmm0, %xmm1
	ja .LB11880
.LB11818:
	movsd 16(%rdi), %xmm1
	ucomisd %xmm0, %xmm1
	ja .LB11880
.LB11830:
	movsd (%rdi), %xmm1
	xorps %xmm2, %xmm2
	subsd %xmm0, %xmm2
	ucomisd %xmm1, %xmm2
	ja .LB11880
.LB11843:
	ucomisd %xmm0, %xmm1
	ja .LB11880
.LB11855:
	movsd 8(%rdi), %xmm1
	xorps %xmm2, %xmm2
	subsd %xmm0, %xmm2
	ucomisd %xmm1, %xmm2
	ja .LB11880
.LB11868:
	ucomisd %xmm0, %xmm1
	ja .LB11880
.LB11881:
	incl %ecx
	cmpl %edx, %ecx
	jl .LB11804
.LB11805:
	testb %sil, %sil
	jne .LB11887
.LB11888:
	leaq .LZERO(%rip), %rsi
	leaq -992(%rbp), %rdi
	movl $936, %ecx
	rep movsb
	leaq .LZERO(%rip), %rsi
	leaq -1928(%rbp), %rdi
	movl $936, %ecx
	rep movsb
	xorl %ecx, %ecx
	movq %rdx, -2168(%rbp)
	xorl %esi, %esi
	movq $0, -2160(%rbp)
	xorps %xmm0, %xmm0
	xorps %xmm1, %xmm1
	xorps %xmm2, %xmm2
	xorl %edi, %edi
	xorl %r8d, %r8d
	xorl %edx, %edx
.LB11926:
	movq -2160(%rbp), %r9
	cmpl $6, %r9d
	jge .LB11928
.LB11927:
	movq -2168(%rbp), %r9
	cmpl $3, %r9d
	jl .LB11933
.LB11934:
	movq -2160(%rbp), %r9
	cmpl $5, %r9d
	je .LB11938
.LB11939:
	movq -2160(%rbp), %r9
	testl %r9d, %r9d
	je .LB11946
.LB11947:
	movq -2160(%rbp), %rax
	leaq -1928(%rbp), %rbx
	xorl %r9d, %r9d
	leaq -992(%rbp), %r12
	andl $1, %eax
	leaq -992(%rbp), %rax
	setne %r9b
	testb %r9b, %r9b
	cmove %rbx, %rax
	leaq -1928(%rbp), %rbx
	testb %r9b, %r9b
	movq %r12, %r9
	cmovne %rbx, %r9
	movq %r9, %rbx
	movq %rax, %r12
.LB11940:
	movq %rsi, %rax
	movq %r8, %r9
	xorl %esi, %esi
	movq %rdi, %r8
	xorl %edi, %edi
.LB11967:
	movq -2168(%rbp), %r13
	cmpl %r13d, %edi
	jge .LB11969
.LB11968:
	leal 1(%rdi), %eax
	cltd
	movq -2168(%rbp), %rcx
	idivl %ecx
	movl %edx, %r13d
	movslq %edi, %rax
	imulq $104, %rax, %rax
	leaq (%rbx,%rax,1), %r14
	movslq %r13d, %rax
	imulq $104, %rax, %rax
	leaq (%rbx,%rax,1), %r15
	movq -2160(%rbp), %rax
	movq %rax, %r11
	cmpq $4, %r11
	ja .LB11990
	leaq .LJT25143(%rip), %r10
	jmpq *(%r10,%r11,8)
.LB11989:
	movsd 8(%r14), %xmm0
	movsd 24(%r14), %xmm1
	addsd %xmm1, %xmm0
	movsd 8(%r15), %xmm1
	movsd 24(%r15), %xmm3
	addsd %xmm3, %xmm1
	movsd %xmm0, -2176(%rbp)
	movsd %xmm1, -2184(%rbp)
.LB11984:
	xorps %xmm0, %xmm0
	movsd -2176(%rbp), %xmm1
	ucomisd %xmm0, %xmm1
	setae %al
	movq %rax, -2192(%rbp)
	movzbl %al, %eax
	movq %rax, -2192(%rbp)
	xorps %xmm0, %xmm0
	movsd -2184(%rbp), %xmm1
	ucomisd %xmm0, %xmm1
	setae %al
	movq %rax, -2200(%rbp)
	movzbl %al, %eax
	movq %rax, -2200(%rbp)
	movq -2192(%rbp), %rax
	testb %al, %al
	jne .LB12098
.LB12099:
.LB12100:
	movq -2192(%rbp), %rax
	movq -2200(%rbp), %rcx
	cmpb %cl, %al
	jne .LB12113
.LB12114:
.LB12115:
	incl %edi
	movq %r14, %rcx
	movq %r15, %rdx
	movq %r13, %rax
	movsd -2176(%rbp), %xmm0
	movsd -2184(%rbp), %xmm1
	movq -2192(%rbp), %r8
	movq -2200(%rbp), %r9
	jmp .LB11967
.LB11928:
	movq -2168(%rbp), %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB11946:
	leaq -1928(%rbp), %r12
	movq %rax, %rbx
	jmp .LB11940
.LB11938:
	leaq -1928(%rbp), %rbx
	movq -2152(%rbp), %r12
	jmp .LB11940
.LB11969:
	movq -2160(%rbp), %rdi
	incl %edi
	movq %rsi, -2168(%rbp)
	movq %rax, %rsi
	movq %rdi, -2160(%rbp)
	movq %r8, %rdi
	movq %r9, %r8
	movq %rbx, %rax
	jmp .LB11926
.LB11988:
	movsd 24(%r14), %xmm0
	movsd (%r14), %xmm1
	subsd %xmm1, %xmm0
	movsd 24(%r15), %xmm1
	movsd (%r15), %xmm3
	subsd %xmm3, %xmm1
	movsd %xmm0, -2176(%rbp)
	movsd %xmm1, -2184(%rbp)
	jmp .LB11984
.LB11987:
	movsd (%r14), %xmm0
	movsd 24(%r14), %xmm1
	addsd %xmm1, %xmm0
	movsd (%r15), %xmm1
	movsd 24(%r15), %xmm3
	addsd %xmm3, %xmm1
	movsd %xmm0, -2176(%rbp)
	movsd %xmm1, -2184(%rbp)
	jmp .LB11984
.LB11986:
	movsd 24(%r14), %xmm0
	movsd 16(%r14), %xmm1
	subsd %xmm1, %xmm0
	movsd 24(%r15), %xmm1
	movsd 16(%r15), %xmm3
	subsd %xmm3, %xmm1
	movsd %xmm0, -2176(%rbp)
	movsd %xmm1, -2184(%rbp)
	jmp .LB11984
.LB11985:
	movsd 24(%r14), %xmm0
	movsd -2144(%rbp), %xmm1
	movsd 24(%r15), %xmm3
	subsd %xmm1, %xmm0
	movaps %xmm1, %xmm15
	movaps %xmm3, %xmm1
	subsd %xmm15, %xmm1
	movsd %xmm0, -2176(%rbp)
	movsd %xmm1, -2184(%rbp)
	jmp .LB11984
.LB11990:
	movsd 24(%r14), %xmm0
	movsd 8(%r14), %xmm1
	subsd %xmm1, %xmm0
	movsd 24(%r15), %xmm1
	movsd 8(%r15), %xmm3
	subsd %xmm3, %xmm1
	movsd %xmm0, -2176(%rbp)
	movsd %xmm1, -2184(%rbp)
	jmp .LB11984
.LB12098:
	vmovdqu (%r14), %ymm15
	vmovdqu %ymm15, -2032(%rbp)
	vmovdqu 32(%r14), %ymm15
	vmovdqu %ymm15, -2000(%rbp)
	vmovdqu 64(%r14), %ymm15
	vmovdqu %ymm15, -1968(%rbp)
	movq 96(%r14), %r10
	movq %r10, -1936(%rbp)
	vzeroupper
	movslq %esi, %rax
	imulq $104, %rax, %rax
	vmovdqu -2032(%rbp), %ymm15
	vmovdqu %ymm15, (%r12,%rax,1)
	vmovdqu -2000(%rbp), %ymm15
	vmovdqu %ymm15, 32(%r12,%rax,1)
	vmovdqu -1968(%rbp), %ymm15
	vmovdqu %ymm15, 64(%r12,%rax,1)
	movq -1936(%rbp), %r10
	movq %r10, 96(%r12,%rax,1)
	vzeroupper
	incl %esi
	jmp .LB12100
.LB12113:
	movsd -2176(%rbp), %xmm0
	movsd -2184(%rbp), %xmm1
	movslq %esi, %rax
	movq %r14, %rcx
	imulq $104, %rax, %rax
	movq %r15, %rdx
	leaq (%r12,%rax,1), %r9
	movaps %xmm1, %xmm15
	movaps %xmm0, %xmm1
	subsd %xmm15, %xmm1
	divsd %xmm1, %xmm0
	movsd %xmm0, -2208(%rbp)
	movaps %xmm0, %xmm2
	callq raycaster__r3d_clip_lerp__4__R3DClipVertE1_ptr1__R3DClipVertE1_ptr1__doubleE1__R3DClipVertE1_ptr1__ret_voidE1
	incl %esi
	movsd -2208(%rbp), %xmm2
	jmp .LB12115
.LB11933:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB11887:
	movslq %edx, %rcx
	movq %rax, %rsi
	xorl %eax, %eax
.LB11890:
	cmpq %rcx, %rax
	jge .LB11892
.LB11891:
	vmovdqu (%rsi), %ymm15
	vmovdqu %ymm15, -2136(%rbp)
	vmovdqu 32(%rsi), %ymm15
	vmovdqu %ymm15, -2104(%rbp)
	vmovdqu 64(%rsi), %ymm15
	vmovdqu %ymm15, -2072(%rbp)
	movq 96(%rsi), %r10
	movq %r10, -2040(%rbp)
	vzeroupper
	imulq $104, %rax, %rdi
	movq -2152(%rbp), %r8
	vmovdqu -2136(%rbp), %ymm15
	vmovdqu %ymm15, (%r8,%rdi,1)
	vmovdqu -2104(%rbp), %ymm15
	vmovdqu %ymm15, 32(%r8,%rdi,1)
	vmovdqu -2072(%rbp), %ymm15
	vmovdqu %ymm15, 64(%r8,%rdi,1)
	movq -2040(%rbp), %r10
	movq %r10, 96(%r8,%rdi,1)
	vzeroupper
	incq %rax
	leaq 104(%rsi), %rsi
	cmpq %rcx, %rax
	jl .LB11891
.LB11892:
	movl %edx, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB11880:
	movq %rdx, %rcx
	xorl %esi, %esi
	cmpl %edx, %ecx
	jl .LB11804
	jmp .LB11805
	.section .rodata
	.p2align 3
.LJT25143:
	.quad .LB11985
	.quad .LB11986
	.quad .LB11987
	.quad .LB11988
	.quad .LB11989
	.text
	.text
	.globl raycaster__r3d_draw_triangle__48__dataE1_sbits32__dataE1_sbits32__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__RCTextureE1_ptr1__dataE1_ubits64__dataE1_sbits32__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1_ptr1__R3DGBufPixelE1_ptr1__dataE1_sbits32__dataE1_sbits32__ret_voidE1
	.def raycaster__r3d_draw_triangle__48__dataE1_sbits32__dataE1_sbits32__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__RCTextureE1_ptr1__dataE1_ubits64__dataE1_sbits32__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1_ptr1__R3DGBufPixelE1_ptr1__dataE1_sbits32__dataE1_sbits32__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
raycaster__r3d_draw_triangle__48__dataE1_sbits32__dataE1_sbits32__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__RCTextureE1_ptr1__dataE1_ubits64__dataE1_sbits32__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1_ptr1__R3DGBufPixelE1_ptr1__dataE1_sbits32__dataE1_sbits32__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $3008, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
	movq %r14, -48(%rbp)
	movq %r15, -56(%rbp)
.LB12137:
	movl %ecx, %esi
	movaps %xmm2, %xmm0
	movsd %xmm0, -80(%rbp)
	movaps %xmm3, %xmm0
	movsd %xmm0, -2848(%rbp)
	movsd 48(%rbp), %xmm0
	movsd 56(%rbp), %xmm0
	movsd %xmm0, -88(%rbp)
	movsd 64(%rbp), %xmm0
	movsd %xmm0, -104(%rbp)
	movsd 72(%rbp), %xmm0
	movsd %xmm0, -176(%rbp)
	movsd 80(%rbp), %xmm0
	movsd 88(%rbp), %xmm1
	movsd 96(%rbp), %xmm2
	movsd 104(%rbp), %xmm3
	movsd %xmm3, -96(%rbp)
	movsd 112(%rbp), %xmm3
	movsd 120(%rbp), %xmm4
	movsd %xmm4, -112(%rbp)
	movsd 128(%rbp), %xmm4
	movsd %xmm4, -120(%rbp)
	movsd 136(%rbp), %xmm4
	movsd %xmm4, -128(%rbp)
	movsd 144(%rbp), %xmm4
	movsd %xmm4, -136(%rbp)
	movsd 152(%rbp), %xmm4
	movsd %xmm4, -144(%rbp)
	movsd 160(%rbp), %xmm4
	movsd %xmm4, -152(%rbp)
	movsd 168(%rbp), %xmm4
	movsd %xmm4, -160(%rbp)
	movsd 176(%rbp), %xmm4
	movsd %xmm4, -168(%rbp)
	movsd 184(%rbp), %xmm4
	movsd 192(%rbp), %xmm5
	movsd %xmm5, -184(%rbp)
	movsd 200(%rbp), %xmm5
	movsd %xmm5, -192(%rbp)
	movsd 208(%rbp), %xmm5
	movsd %xmm5, -200(%rbp)
	movsd 216(%rbp), %xmm5
	movsd %xmm5, -208(%rbp)
	movsd 224(%rbp), %xmm5
	movsd %xmm5, -216(%rbp)
	movsd 232(%rbp), %xmm5
	movsd %xmm5, -224(%rbp)
	movsd 240(%rbp), %xmm5
	movsd %xmm5, -232(%rbp)
	movq 248(%rbp), %rdi
	movq 256(%rbp), %rax
	movq %rax, -2960(%rbp)
	movl 264(%rbp), %eax
	movsd 272(%rbp), %xmm5
	movsd %xmm5, -240(%rbp)
	movsd 280(%rbp), %xmm5
	movsd %xmm5, -248(%rbp)
	movsd 288(%rbp), %xmm5
	movsd %xmm5, -256(%rbp)
	movsd 296(%rbp), %xmm5
	movsd %xmm5, -264(%rbp)
	movsd 304(%rbp), %xmm5
	movsd %xmm5, -272(%rbp)
	movsd 312(%rbp), %xmm5
	movsd %xmm5, -280(%rbp)
	movsd 320(%rbp), %xmm5
	movsd %xmm5, -288(%rbp)
	movsd 328(%rbp), %xmm5
	movsd %xmm5, -296(%rbp)
	movsd 336(%rbp), %xmm5
	movsd %xmm5, -304(%rbp)
	movsd 344(%rbp), %xmm5
	movsd %xmm5, -312(%rbp)
	movsd 352(%rbp), %xmm5
	movsd %xmm5, -320(%rbp)
	movsd 360(%rbp), %xmm5
	movsd %xmm5, -328(%rbp)
	movq 368(%rbp), %rbx
	movq 376(%rbp), %rcx
	movq %rcx, -2216(%rbp)
	movl 384(%rbp), %ecx
	movq %rcx, -880(%rbp)
	movl 392(%rbp), %ecx
	movq %rcx, -1416(%rbp)
	movsd -2848(%rbp), %xmm5
	ucomisd %xmm3, %xmm5
	ja .LB12205
.LB12206:
	movsd -2848(%rbp), %xmm5
	movq -88(%rbp), %r10
	movq %r10, -336(%rbp)
	movq -104(%rbp), %r10
	movq %r10, -344(%rbp)
	movq -176(%rbp), %r10
	movq %r10, -352(%rbp)
	movsd %xmm0, -360(%rbp)
	movsd %xmm1, -368(%rbp)
	movsd %xmm2, -376(%rbp)
	movq -96(%rbp), %r10
	movq %r10, -384(%rbp)
	movsd %xmm3, -392(%rbp)
	movq -120(%rbp), %r10
	movq %r10, -400(%rbp)
	movq -128(%rbp), %r10
	movq %r10, -408(%rbp)
	movq -136(%rbp), %r10
	movq %r10, -416(%rbp)
	movq -144(%rbp), %r10
	movq %r10, -424(%rbp)
	movq -152(%rbp), %r10
	movq %r10, -432(%rbp)
	movq -160(%rbp), %r10
	movq %r10, -440(%rbp)
	movq -264(%rbp), %r10
	movq %r10, -448(%rbp)
	movq -272(%rbp), %r10
	movq %r10, -456(%rbp)
	movq -280(%rbp), %r10
	movq %r10, -464(%rbp)
	movq -288(%rbp), %r10
	movq %r10, -472(%rbp)
	movq -296(%rbp), %r10
	movq %r10, -480(%rbp)
	movq -304(%rbp), %r10
	movq %r10, -488(%rbp)
	movsd -80(%rbp), %xmm3
.LB12207:
	ucomisd %xmm4, %xmm5
	ja .LB12247
.LB12248:
	movsd %xmm3, -496(%rbp)
	movsd %xmm5, -504(%rbp)
	movq -336(%rbp), %r10
	movq %r10, -512(%rbp)
	movq -344(%rbp), %r10
	movq %r10, -2864(%rbp)
	movsd -352(%rbp), %xmm3
	movq -360(%rbp), %r10
	movq %r10, -2856(%rbp)
	movq -368(%rbp), %r10
	movq %r10, -520(%rbp)
	movq -376(%rbp), %r10
	movq %r10, -528(%rbp)
	movq -168(%rbp), %r10
	movq %r10, -536(%rbp)
	movsd %xmm4, -544(%rbp)
	movq -192(%rbp), %r10
	movq %r10, -552(%rbp)
	movq -200(%rbp), %r10
	movq %r10, -560(%rbp)
	movq -208(%rbp), %r10
	movq %r10, -568(%rbp)
	movq -216(%rbp), %r10
	movq %r10, -576(%rbp)
	movq -224(%rbp), %r10
	movq %r10, -584(%rbp)
	movq -232(%rbp), %r10
	movq %r10, -592(%rbp)
	movq -448(%rbp), %r10
	movq %r10, -600(%rbp)
	movq -456(%rbp), %r10
	movq %r10, -608(%rbp)
	movq -464(%rbp), %r10
	movq %r10, -616(%rbp)
	movq -312(%rbp), %r10
	movq %r10, -624(%rbp)
	movq -320(%rbp), %r10
	movq %r10, -632(%rbp)
	movq -328(%rbp), %r10
	movq %r10, -640(%rbp)
.LB12249:
	movsd -392(%rbp), %xmm4
	movsd -544(%rbp), %xmm5
	ucomisd %xmm5, %xmm4
	ja .LB12289
.LB12290:
	movq -384(%rbp), %r10
	movq %r10, -648(%rbp)
	movq -392(%rbp), %r10
	movq %r10, -656(%rbp)
	movq -400(%rbp), %r10
	movq %r10, -664(%rbp)
	movq -408(%rbp), %r10
	movq %r10, -672(%rbp)
	movq -416(%rbp), %r10
	movq %r10, -680(%rbp)
	movq -424(%rbp), %r10
	movq %r10, -688(%rbp)
	movq -432(%rbp), %r10
	movq %r10, -696(%rbp)
	movq -440(%rbp), %r10
	movq %r10, -704(%rbp)
	movq -536(%rbp), %r10
	movq %r10, -712(%rbp)
	movq -544(%rbp), %r10
	movq %r10, -720(%rbp)
	movq -552(%rbp), %r10
	movq %r10, -728(%rbp)
	movq -560(%rbp), %r10
	movq %r10, -736(%rbp)
	movq -568(%rbp), %r10
	movq %r10, -744(%rbp)
	movq -576(%rbp), %r10
	movq %r10, -752(%rbp)
	movq -584(%rbp), %r10
	movq %r10, -760(%rbp)
	movq -592(%rbp), %r10
	movq %r10, -768(%rbp)
	movq -472(%rbp), %r10
	movq %r10, -776(%rbp)
	movq -480(%rbp), %r10
	movq %r10, -784(%rbp)
	movq -488(%rbp), %r10
	movq %r10, -792(%rbp)
	movq -624(%rbp), %r10
	movq %r10, -800(%rbp)
	movq -632(%rbp), %r10
	movq %r10, -808(%rbp)
	movq -640(%rbp), %r10
	movq %r10, -816(%rbp)
.LB12291:
	movabsq $4602678819172646912, %r10
	movq %r10, %xmm4
	xorl %r9d, %r9d
	movsd %xmm4, -824(%rbp)
	movsd -504(%rbp), %xmm5
	addsd %xmm5, %xmm4
	movsd %xmm4, -832(%rbp)
	cvttsd2siq %xmm4, %rcx
	movabsq $4602678819172646912, %r10
	movq %r10, %xmm4
	movsd %xmm4, -840(%rbp)
	movsd -656(%rbp), %xmm5
	movl %ecx, %ecx
	addsd %xmm5, %xmm4
	movsd %xmm4, -848(%rbp)
	cvttsd2siq %xmm4, %r8
	movabsq $4602678819172646912, %r10
	movq %r10, %xmm4
	movq %r8, -856(%rbp)
	movl %r8d, %r8d
	movq %r8, -856(%rbp)
	movsd %xmm4, -864(%rbp)
	movsd -720(%rbp), %xmm5
	addsd %xmm5, %xmm4
	movsd %xmm4, -872(%rbp)
	cvttsd2siq %xmm4, %r8
	movl %r8d, %r8d
	decl %r8d
	testl %ecx, %ecx
	cmovs %r9d, %ecx
	leal -1(%rdx), %r9d
	cmpl %edx, %r8d
	movq %rcx, -888(%rbp)
	cmovge %r9d, %r8d
	movq %r8, -2584(%rbp)
	cmpl %r8d, %ecx
	jg .LB12354
.LB12355:
	testl %eax, %eax
	je .LB12368
.LB12369:
	movsd -2856(%rbp), %xmm0
	movsd -520(%rbp), %xmm1
	movsd -528(%rbp), %xmm2
	movsd -688(%rbp), %xmm4
	movq -696(%rbp), %r10
	movq %r10, -896(%rbp)
	movq -704(%rbp), %r10
	movq %r10, -904(%rbp)
	movq -752(%rbp), %r10
	movq %r10, -912(%rbp)
	movq -760(%rbp), %r10
	movq %r10, -920(%rbp)
	movq -768(%rbp), %r10
	movq %r10, -928(%rbp)
.LB12370:
	movsd -512(%rbp), %xmm5
	mulsd %xmm5, %xmm0
	movsd %xmm0, -936(%rbp)
	movaps %xmm1, %xmm0
	mulsd %xmm5, %xmm0
	movsd %xmm0, -944(%rbp)
	movaps %xmm2, %xmm0
	mulsd %xmm5, %xmm0
	movsd %xmm0, -952(%rbp)
	movsd -664(%rbp), %xmm0
	movaps %xmm4, %xmm1
	mulsd %xmm0, %xmm1
	movsd %xmm1, -960(%rbp)
	movsd -896(%rbp), %xmm1
	mulsd %xmm0, %xmm1
	movsd %xmm1, -968(%rbp)
	movsd -904(%rbp), %xmm1
	mulsd %xmm1, %xmm0
	movsd %xmm0, -976(%rbp)
	movsd -912(%rbp), %xmm0
	movsd -728(%rbp), %xmm1
	mulsd %xmm1, %xmm0
	movsd %xmm0, -984(%rbp)
	movsd -920(%rbp), %xmm0
	mulsd %xmm1, %xmm0
	movsd %xmm0, -992(%rbp)
	movsd -928(%rbp), %xmm0
	mulsd %xmm1, %xmm0
	movsd %xmm0, -1000(%rbp)
	movsd -512(%rbp), %xmm0
	movsd -2864(%rbp), %xmm1
	mulsd %xmm0, %xmm1
	mulsd %xmm3, %xmm0
	movsd %xmm1, -1008(%rbp)
	movsd %xmm0, -1016(%rbp)
	movsd -672(%rbp), %xmm0
	movsd -664(%rbp), %xmm1
	mulsd %xmm1, %xmm0
	movsd %xmm0, -1024(%rbp)
	movsd -680(%rbp), %xmm0
	mulsd %xmm1, %xmm0
	movsd %xmm0, -1032(%rbp)
	movsd -736(%rbp), %xmm0
	movsd -728(%rbp), %xmm1
	mulsd %xmm1, %xmm0
	movsd %xmm0, -1040(%rbp)
	movsd -744(%rbp), %xmm0
	mulsd %xmm1, %xmm0
	movsd %xmm0, -1048(%rbp)
	movsd -600(%rbp), %xmm0
	movsd -512(%rbp), %xmm1
	mulsd %xmm1, %xmm0
	movsd %xmm0, -1056(%rbp)
	movsd -608(%rbp), %xmm0
	mulsd %xmm1, %xmm0
	movsd %xmm0, -1064(%rbp)
	movsd -616(%rbp), %xmm0
	mulsd %xmm1, %xmm0
	movsd %xmm0, -1072(%rbp)
	movsd -776(%rbp), %xmm0
	movsd -664(%rbp), %xmm1
	mulsd %xmm1, %xmm0
	movsd %xmm0, -1080(%rbp)
	movsd -784(%rbp), %xmm0
	mulsd %xmm1, %xmm0
	movsd %xmm0, -1088(%rbp)
	movsd -792(%rbp), %xmm0
	mulsd %xmm1, %xmm0
	movsd %xmm0, -1096(%rbp)
	movsd -800(%rbp), %xmm0
	movsd -728(%rbp), %xmm1
	mulsd %xmm1, %xmm0
	movsd %xmm0, -1104(%rbp)
	movsd -808(%rbp), %xmm0
	mulsd %xmm1, %xmm0
	movsd %xmm0, -1112(%rbp)
	movsd -816(%rbp), %xmm0
	mulsd %xmm1, %xmm0
	movsd %xmm0, -1120(%rbp)
	movsd -720(%rbp), %xmm0
	movsd -504(%rbp), %xmm1
	movaps %xmm0, %xmm2
	subsd %xmm1, %xmm2
	movsd %xmm2, -1128(%rbp)
	movsd -656(%rbp), %xmm3
	movaps %xmm1, %xmm15
	movaps %xmm3, %xmm1
	subsd %xmm15, %xmm1
	subsd %xmm3, %xmm0
	movsd %xmm1, -1136(%rbp)
	movsd %xmm0, -1144(%rbp)
	movaps %xmm2, %xmm0
	callq standard__math__abs__1__doubleE1__ret_doubleE1
	movabsq $4517329193108106637, %r10
	movq %r10, %xmm1
	ucomisd %xmm0, %xmm1
	ja .LB12482
.LB12483:
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm0
	movsd -1128(%rbp), %xmm1
	divsd %xmm1, %xmm0
	movsd %xmm0, -1152(%rbp)
	movsd -1136(%rbp), %xmm0
	callq standard__math__abs__1__doubleE1__ret_doubleE1
	movabsq $4602678819172646912, %r10
	movq %r10, %xmm1
	ucomisd %xmm1, %xmm0
	ja .LB12493
.LB12494:
	movabsq $0, %r10
	movq %r10, -1160(%rbp)
.LB12495:
	movsd -1144(%rbp), %xmm0
	callq standard__math__abs__1__doubleE1__ret_doubleE1
	movabsq $4602678819172646912, %r10
	movq %r10, %xmm1
	ucomisd %xmm1, %xmm0
	ja .LB12502
.LB12503:
	xorps %xmm0, %xmm0
.LB12504:
	movsd -712(%rbp), %xmm1
	movsd -496(%rbp), %xmm2
	subsd %xmm2, %xmm1
	movsd -1152(%rbp), %xmm2
	mulsd %xmm2, %xmm1
	movsd %xmm1, -1168(%rbp)
	movsd -728(%rbp), %xmm1
	movsd -512(%rbp), %xmm3
	subsd %xmm3, %xmm1
	mulsd %xmm2, %xmm1
	movsd %xmm1, -1176(%rbp)
	movsd -1040(%rbp), %xmm1
	movsd -1008(%rbp), %xmm2
	subsd %xmm2, %xmm1
	movsd -1152(%rbp), %xmm2
	mulsd %xmm2, %xmm1
	movsd %xmm1, -1184(%rbp)
	movsd -1048(%rbp), %xmm1
	movsd -1016(%rbp), %xmm3
	subsd %xmm3, %xmm1
	mulsd %xmm2, %xmm1
	movsd %xmm1, -1192(%rbp)
	movsd -984(%rbp), %xmm1
	movsd -936(%rbp), %xmm2
	subsd %xmm2, %xmm1
	movsd -1152(%rbp), %xmm2
	mulsd %xmm2, %xmm1
	movsd %xmm1, -1200(%rbp)
	movsd -992(%rbp), %xmm1
	movsd -944(%rbp), %xmm3
	subsd %xmm3, %xmm1
	mulsd %xmm2, %xmm1
	movsd %xmm1, -1208(%rbp)
	movsd -1000(%rbp), %xmm1
	movsd -952(%rbp), %xmm2
	subsd %xmm2, %xmm1
	movsd -1152(%rbp), %xmm2
	mulsd %xmm2, %xmm1
	movsd %xmm1, -1216(%rbp)
	movsd -1104(%rbp), %xmm1
	movsd -1056(%rbp), %xmm3
	subsd %xmm3, %xmm1
	mulsd %xmm2, %xmm1
	movsd %xmm1, -1224(%rbp)
	movsd -1112(%rbp), %xmm1
	movsd -1064(%rbp), %xmm2
	subsd %xmm2, %xmm1
	movsd -1152(%rbp), %xmm2
	mulsd %xmm2, %xmm1
	movsd %xmm1, -1232(%rbp)
	movsd -1120(%rbp), %xmm1
	movsd -1072(%rbp), %xmm3
	subsd %xmm3, %xmm1
	mulsd %xmm2, %xmm1
	movsd %xmm1, -1240(%rbp)
	movsd -648(%rbp), %xmm1
	movsd -496(%rbp), %xmm2
	subsd %xmm2, %xmm1
	movsd -1160(%rbp), %xmm2
	mulsd %xmm2, %xmm1
	movsd %xmm1, -1248(%rbp)
	movsd -664(%rbp), %xmm1
	movsd -512(%rbp), %xmm3
	subsd %xmm3, %xmm1
	mulsd %xmm2, %xmm1
	movsd %xmm1, -1256(%rbp)
	movsd -1024(%rbp), %xmm1
	movsd -1008(%rbp), %xmm2
	subsd %xmm2, %xmm1
	movsd -1160(%rbp), %xmm2
	mulsd %xmm2, %xmm1
	movsd %xmm1, -1264(%rbp)
	movsd -1032(%rbp), %xmm1
	movsd -1016(%rbp), %xmm3
	subsd %xmm3, %xmm1
	mulsd %xmm2, %xmm1
	movsd %xmm1, -1272(%rbp)
	movsd -960(%rbp), %xmm1
	movsd -936(%rbp), %xmm2
	subsd %xmm2, %xmm1
	movsd -1160(%rbp), %xmm2
	mulsd %xmm2, %xmm1
	movsd %xmm1, -1280(%rbp)
	movsd -968(%rbp), %xmm1
	movsd -944(%rbp), %xmm3
	subsd %xmm3, %xmm1
	mulsd %xmm2, %xmm1
	movsd %xmm1, -1288(%rbp)
	movsd -976(%rbp), %xmm1
	movsd -952(%rbp), %xmm2
	subsd %xmm2, %xmm1
	movsd -1160(%rbp), %xmm2
	mulsd %xmm2, %xmm1
	movsd %xmm1, -1296(%rbp)
	movsd -1080(%rbp), %xmm1
	movsd -1056(%rbp), %xmm3
	subsd %xmm3, %xmm1
	mulsd %xmm2, %xmm1
	movsd %xmm1, -1304(%rbp)
	movsd -1088(%rbp), %xmm1
	movsd -1064(%rbp), %xmm2
	subsd %xmm2, %xmm1
	movsd -1160(%rbp), %xmm2
	mulsd %xmm2, %xmm1
	movsd %xmm1, -1312(%rbp)
	movsd -1096(%rbp), %xmm1
	movsd -1072(%rbp), %xmm3
	subsd %xmm3, %xmm1
	mulsd %xmm2, %xmm1
	movsd %xmm1, -1320(%rbp)
	movsd -712(%rbp), %xmm1
	movsd -648(%rbp), %xmm2
	subsd %xmm2, %xmm1
	mulsd %xmm0, %xmm1
	movsd %xmm1, -1328(%rbp)
	movsd -728(%rbp), %xmm1
	movsd -664(%rbp), %xmm2
	subsd %xmm2, %xmm1
	mulsd %xmm0, %xmm1
	movsd %xmm1, -1336(%rbp)
	movsd -1040(%rbp), %xmm1
	movsd -1024(%rbp), %xmm2
	subsd %xmm2, %xmm1
	mulsd %xmm0, %xmm1
	movsd %xmm1, -1344(%rbp)
	movsd -1048(%rbp), %xmm1
	movsd -1032(%rbp), %xmm2
	subsd %xmm2, %xmm1
	mulsd %xmm0, %xmm1
	movsd %xmm1, -1352(%rbp)
	movsd -984(%rbp), %xmm1
	movsd -960(%rbp), %xmm2
	subsd %xmm2, %xmm1
	mulsd %xmm0, %xmm1
	movsd %xmm1, -1360(%rbp)
	movsd -992(%rbp), %xmm1
	movsd -968(%rbp), %xmm2
	subsd %xmm2, %xmm1
	mulsd %xmm0, %xmm1
	movsd %xmm1, -1368(%rbp)
	movsd -1000(%rbp), %xmm1
	movsd -976(%rbp), %xmm2
	subsd %xmm2, %xmm1
	mulsd %xmm0, %xmm1
	movsd %xmm1, -1376(%rbp)
	movsd -1104(%rbp), %xmm1
	movsd -1080(%rbp), %xmm2
	subsd %xmm2, %xmm1
	mulsd %xmm0, %xmm1
	movsd %xmm1, -1384(%rbp)
	movsd -1112(%rbp), %xmm1
	movsd -1088(%rbp), %xmm2
	subsd %xmm2, %xmm1
	mulsd %xmm0, %xmm1
	movsd %xmm1, -1392(%rbp)
	movsd -1120(%rbp), %xmm1
	movsd -1096(%rbp), %xmm2
	subsd %xmm2, %xmm1
	mulsd %xmm1, %xmm0
	movsd %xmm0, -1400(%rbp)
	movsd -1136(%rbp), %xmm0
	callq standard__math__abs__1__doubleE1__ret_doubleE1
	movabsq $4602678819172646912, %r10
	movq %r10, %xmm1
	ucomisd %xmm1, %xmm0
	ja .LB12692
.LB12693:
	movsd -496(%rbp), %xmm0
	movsd -648(%rbp), %xmm1
	ucomisd %xmm1, %xmm0
	seta %al
	movzbl %al, %eax
	movq %rax, -1408(%rbp)
.LB12694:
	movl $0, -60(%rbp)
	movl $0, -64(%rbp)
	xorps %xmm0, %xmm0
	movsd %xmm0, -72(%rbp)
	movq -888(%rbp), %rax
	cltd
	movq -1416(%rbp), %rcx
	idivl %ecx
	movq -880(%rbp), %rax
	cmpl %eax, %edx
	jle .LB12807
.LB12808:
	movq -1416(%rbp), %rax
	movq -880(%rbp), %rcx
	subl %edx, %eax
	addl %ecx, %eax
	movq -888(%rbp), %rcx
	addl %ecx, %eax
.LB12809:
	movq -2584(%rbp), %rcx
	cmpl %ecx, %eax
	jg .LB12825
.LB12826:
	leal -1(%rsi), %ecx
	movq %rcx, -2208(%rbp)
	xorl %ecx, %ecx
	testq %rdi, %rdi
	movq %rcx, -1424(%rbp)
	setne %cl
	movq %rcx, -1424(%rbp)
	xorl %ecx, %ecx
	movq %rcx, -1432(%rbp)
	movq -2960(%rbp), %rdx
	testq %rdx, %rdx
	setne %cl
	movq %rcx, -1432(%rbp)
	movq %rax, -1440(%rbp)
	xorl %eax, %eax
	xorl %ecx, %ecx
	movabsq $0, %r10
	movq %r10, -1704(%rbp)
	movabsq $0, %r10
	movq %r10, -1448(%rbp)
	movabsq $0, %r10
	movq %r10, -1456(%rbp)
	movabsq $0, %r10
	movq %r10, -1464(%rbp)
	movabsq $0, %r10
	movq %r10, -1472(%rbp)
	movq $0, -1480(%rbp)
	movq $0, -1488(%rbp)
	movq $0, -1496(%rbp)
	movabsq $0, %r10
	movq %r10, -1712(%rbp)
	movabsq $0, %r10
	movq %r10, -1720(%rbp)
	movabsq $0, %r10
	movq %r10, -1728(%rbp)
	movabsq $0, %r10
	movq %r10, -1736(%rbp)
	movabsq $0, %r10
	movq %r10, -1744(%rbp)
	movabsq $0, %r10
	movq %r10, -1504(%rbp)
	movabsq $0, %r10
	movq %r10, -1512(%rbp)
	movabsq $0, %r10
	movq %r10, -1520(%rbp)
	movabsq $0, %r10
	movq %r10, -1528(%rbp)
	movabsq $0, %r10
	movq %r10, -1536(%rbp)
	movabsq $0, %r10
	movq %r10, -1544(%rbp)
	movabsq $0, %r10
	movq %r10, -1552(%rbp)
	movabsq $0, %r10
	movq %r10, -1560(%rbp)
	movabsq $0, %r10
	movq %r10, -1568(%rbp)
	movabsq $0, %r10
	movq %r10, -1576(%rbp)
	movabsq $0, %r10
	movq %r10, -1584(%rbp)
	movabsq $0, %r10
	movq %r10, -1592(%rbp)
	movq $0, -1600(%rbp)
	movabsq $0, %r10
	movq %r10, -1608(%rbp)
	movabsq $0, %r10
	movq %r10, -1616(%rbp)
	movabsq $0, %r10
	movq %r10, -1624(%rbp)
	movabsq $0, %r10
	movq %r10, -1632(%rbp)
	movabsq $0, %r10
	movq %r10, -1640(%rbp)
	movabsq $0, %r10
	movq %r10, -1648(%rbp)
	movabsq $0, %r10
	movq %r10, -1656(%rbp)
	movabsq $0, %r10
	movq %r10, -1664(%rbp)
	movabsq $0, %r10
	movq %r10, -1672(%rbp)
	movabsq $0, %r10
	movq %r10, -1680(%rbp)
	movabsq $0, %r10
	movq %r10, -1688(%rbp)
	movabsq $0, %r10
	movq %r10, -1696(%rbp)
.LB12829:
	movq -1440(%rbp), %rdx
	movq -2584(%rbp), %r8
	cmpl %r8d, %edx
	jg .LB12831
.LB12830:
	movq -1440(%rbp), %rdx
	movabsq $4602678819172646912, %r10
	movq %r10, %xmm1
	movslq %edx, %rdx
	xorps %xmm0, %xmm0
	cvtsi2sdq %rdx, %xmm0
	movsd %xmm0, -1752(%rbp)
	addsd %xmm1, %xmm0
	movsd -504(%rbp), %xmm1
	subsd %xmm1, %xmm0
	movsd -1168(%rbp), %xmm1
	movsd -496(%rbp), %xmm2
	vfmadd132sd %xmm0, %xmm2, %xmm1
	movsd %xmm1, -1760(%rbp)
	movsd -1176(%rbp), %xmm1
	movsd -512(%rbp), %xmm2
	vfmadd132sd %xmm0, %xmm2, %xmm1
	movsd %xmm1, -1768(%rbp)
	movsd -1184(%rbp), %xmm1
	movsd -1008(%rbp), %xmm2
	vfmadd132sd %xmm0, %xmm2, %xmm1
	movsd %xmm1, -2872(%rbp)
	movsd -1192(%rbp), %xmm1
	movsd -1016(%rbp), %xmm2
	vfmadd132sd %xmm0, %xmm2, %xmm1
	movsd %xmm1, -2880(%rbp)
	movsd -1200(%rbp), %xmm1
	movsd -936(%rbp), %xmm2
	vfmadd132sd %xmm0, %xmm2, %xmm1
	movsd -1208(%rbp), %xmm2
	movsd -944(%rbp), %xmm3
	vfmadd132sd %xmm0, %xmm3, %xmm2
	movsd -1216(%rbp), %xmm3
	movsd -952(%rbp), %xmm4
	vfmadd132sd %xmm0, %xmm4, %xmm3
	movsd -1224(%rbp), %xmm4
	movsd -1056(%rbp), %xmm5
	vfmadd132sd %xmm0, %xmm5, %xmm4
	movsd %xmm4, -1776(%rbp)
	movsd -1232(%rbp), %xmm4
	movsd -1064(%rbp), %xmm5
	vfmadd132sd %xmm0, %xmm5, %xmm4
	movsd %xmm4, -1784(%rbp)
	movsd -1240(%rbp), %xmm4
	movsd -1072(%rbp), %xmm5
	vfmadd132sd %xmm0, %xmm5, %xmm4
	movsd %xmm4, -1792(%rbp)
	movq -1440(%rbp), %rdx
	movq -856(%rbp), %r8
	cmpl %r8d, %edx
	jl .LB12893
.LB12894:
	movabsq $4602678819172646912, %r10
	movq %r10, %xmm0
	movsd -1752(%rbp), %xmm4
	addsd %xmm4, %xmm0
	movsd -656(%rbp), %xmm4
	subsd %xmm4, %xmm0
	movsd -1328(%rbp), %xmm4
	movsd -648(%rbp), %xmm5
	vfmadd132sd %xmm0, %xmm5, %xmm4
	movsd %xmm4, -1800(%rbp)
	movsd -1336(%rbp), %xmm4
	movsd -664(%rbp), %xmm5
	vfmadd132sd %xmm0, %xmm5, %xmm4
	movsd %xmm4, -1808(%rbp)
	movsd -1344(%rbp), %xmm4
	movsd -1024(%rbp), %xmm5
	vfmadd132sd %xmm0, %xmm5, %xmm4
	movsd %xmm4, -1816(%rbp)
	movsd -1352(%rbp), %xmm4
	movsd -1032(%rbp), %xmm5
	vfmadd132sd %xmm0, %xmm5, %xmm4
	movsd %xmm4, -1824(%rbp)
	movsd -1360(%rbp), %xmm4
	movsd -960(%rbp), %xmm5
	vfmadd132sd %xmm0, %xmm5, %xmm4
	movsd %xmm4, -1832(%rbp)
	movsd -1368(%rbp), %xmm4
	movsd -968(%rbp), %xmm5
	vfmadd132sd %xmm0, %xmm5, %xmm4
	movsd %xmm4, -1840(%rbp)
	movsd -1376(%rbp), %xmm4
	movsd -976(%rbp), %xmm5
	vfmadd132sd %xmm0, %xmm5, %xmm4
	movsd %xmm4, -1848(%rbp)
	movsd -1384(%rbp), %xmm4
	movsd -1080(%rbp), %xmm5
	vfmadd132sd %xmm0, %xmm5, %xmm4
	movsd %xmm4, -1856(%rbp)
	movsd -1392(%rbp), %xmm4
	movsd -1088(%rbp), %xmm5
	vfmadd132sd %xmm0, %xmm5, %xmm4
	movsd %xmm4, -1864(%rbp)
	movsd -1400(%rbp), %xmm4
	movsd -1096(%rbp), %xmm5
	vfmadd132sd %xmm4, %xmm5, %xmm0
	movq -1808(%rbp), %r10
	movq %r10, -1872(%rbp)
	movq -1816(%rbp), %r10
	movq %r10, -1880(%rbp)
	movq -1824(%rbp), %r10
	movq %r10, -1888(%rbp)
	movq -1832(%rbp), %r10
	movq %r10, -1896(%rbp)
	movq -1840(%rbp), %r10
	movq %r10, -1904(%rbp)
	movq -1848(%rbp), %r10
	movq %r10, -1912(%rbp)
	movq -1856(%rbp), %r10
	movq %r10, -1920(%rbp)
	movq -1864(%rbp), %r10
	movq %r10, -1928(%rbp)
	movsd %xmm0, -1936(%rbp)
	movsd -1800(%rbp), %xmm0
.LB12895:
	movq -1408(%rbp), %rdx
	testb %dl, %dl
	jne .LB13002
.LB13003:
	movq -1760(%rbp), %r10
	movq %r10, -2016(%rbp)
	movq -1768(%rbp), %r10
	movq %r10, -2024(%rbp)
	movq -2872(%rbp), %r10
	movq %r10, -2032(%rbp)
	movq -1880(%rbp), %r10
	movq %r10, -2888(%rbp)
	movq -2880(%rbp), %r10
	movq %r10, -2040(%rbp)
	movq -1888(%rbp), %r10
	movq %r10, -2896(%rbp)
	movsd %xmm1, -2048(%rbp)
	movsd %xmm2, -2056(%rbp)
	movsd %xmm3, -2064(%rbp)
	movq -1912(%rbp), %r10
	movq %r10, -2072(%rbp)
	movsd %xmm1, -2080(%rbp)
	movq -1896(%rbp), %r10
	movq %r10, -2088(%rbp)
	movsd %xmm2, -2096(%rbp)
	movq -1904(%rbp), %r10
	movq %r10, -2104(%rbp)
	movsd %xmm3, -2112(%rbp)
	movq -1912(%rbp), %r10
	movq %r10, -2120(%rbp)
	movq -1776(%rbp), %r10
	movq %r10, -2128(%rbp)
	movq -1920(%rbp), %r10
	movq %r10, -2136(%rbp)
	movq -1784(%rbp), %r10
	movq %r10, -2144(%rbp)
	movq -1928(%rbp), %r10
	movq %r10, -2152(%rbp)
	movq -1792(%rbp), %r10
	movq %r10, -2160(%rbp)
	movq -1936(%rbp), %r10
	movq %r10, -2168(%rbp)
	movsd -1872(%rbp), %xmm1
	movsd -1896(%rbp), %xmm2
	movsd -1904(%rbp), %xmm3
.LB13004:
	movabsq $4602678819172646912, %r10
	movq %r10, %xmm4
	xorl %r9d, %r9d
	movsd %xmm4, -2176(%rbp)
	movsd -2016(%rbp), %xmm5
	addsd %xmm5, %xmm4
	movsd %xmm4, -2184(%rbp)
	cvttsd2siq %xmm4, %rdx
	movabsq $4602678819172646912, %r10
	movq %r10, %xmm4
	movsd %xmm4, -2192(%rbp)
	movaps %xmm4, %xmm15
	movaps %xmm0, %xmm4
	subsd %xmm15, %xmm4
	movl %edx, %edx
	testl %edx, %edx
	movsd %xmm4, -2200(%rbp)
	cvttsd2siq %xmm4, %r8
	movl %edx, %r12d
	cmovs %r9d, %r12d
	movq -2208(%rbp), %rdx
	movsd -2016(%rbp), %xmm4
	movl %r8d, %r8d
	cmpl %esi, %r8d
	subsd %xmm4, %xmm0
	movabsq $4602678819172646912, %r10
	movq %r10, %xmm4
	movl %r8d, %r13d
	cmovge %edx, %r13d
	movsd %xmm4, -2224(%rbp)
	ucomisd %xmm0, %xmm4
	ja .LB13081
.LB13082:
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm4
	movsd %xmm4, -2232(%rbp)
	movaps %xmm0, %xmm15
	movaps %xmm4, %xmm0
	divsd %xmm15, %xmm0
	movsd %xmm0, -2240(%rbp)
	movsd -2024(%rbp), %xmm4
	movaps %xmm4, %xmm15
	movaps %xmm1, %xmm4
	subsd %xmm15, %xmm4
	mulsd %xmm0, %xmm4
	movsd %xmm4, -2248(%rbp)
	movsd -2032(%rbp), %xmm4
	movsd -2888(%rbp), %xmm5
	movaps %xmm4, %xmm15
	movaps %xmm5, %xmm4
	subsd %xmm15, %xmm4
	mulsd %xmm4, %xmm0
	movsd %xmm0, -2256(%rbp)
	movsd -2040(%rbp), %xmm0
	movsd -2896(%rbp), %xmm4
	movaps %xmm0, %xmm15
	movaps %xmm4, %xmm0
	subsd %xmm15, %xmm0
	movsd -2240(%rbp), %xmm4
	mulsd %xmm4, %xmm0
	movsd %xmm0, -2264(%rbp)
	movsd -2048(%rbp), %xmm0
	movaps %xmm0, %xmm15
	movaps %xmm2, %xmm0
	subsd %xmm15, %xmm0
	mulsd %xmm4, %xmm0
	movsd %xmm0, -2272(%rbp)
	movsd -2056(%rbp), %xmm0
	movsd -2240(%rbp), %xmm2
	movaps %xmm0, %xmm15
	movaps %xmm3, %xmm0
	subsd %xmm15, %xmm0
	mulsd %xmm2, %xmm0
	movsd %xmm0, -2280(%rbp)
	movsd -2072(%rbp), %xmm0
	movsd -2064(%rbp), %xmm3
	subsd %xmm3, %xmm0
	mulsd %xmm2, %xmm0
	movsd %xmm0, -2288(%rbp)
	movsd -2088(%rbp), %xmm0
	movsd -2080(%rbp), %xmm2
	subsd %xmm2, %xmm0
	movsd -2240(%rbp), %xmm2
	mulsd %xmm2, %xmm0
	movsd %xmm0, -2296(%rbp)
	movsd -2104(%rbp), %xmm0
	movsd -2096(%rbp), %xmm3
	subsd %xmm3, %xmm0
	mulsd %xmm2, %xmm0
	movsd %xmm0, -2304(%rbp)
	movsd -2120(%rbp), %xmm0
	movsd -2112(%rbp), %xmm2
	subsd %xmm2, %xmm0
	movsd -2240(%rbp), %xmm2
	mulsd %xmm2, %xmm0
	movsd %xmm0, -2312(%rbp)
	movsd -2136(%rbp), %xmm0
	movsd -2128(%rbp), %xmm3
	subsd %xmm3, %xmm0
	mulsd %xmm2, %xmm0
	movsd %xmm0, -2320(%rbp)
	movsd -2152(%rbp), %xmm0
	movsd -2144(%rbp), %xmm2
	subsd %xmm2, %xmm0
	movsd -2240(%rbp), %xmm2
	mulsd %xmm2, %xmm0
	movsd %xmm0, -2328(%rbp)
	movsd -2168(%rbp), %xmm0
	movsd -2160(%rbp), %xmm3
	subsd %xmm3, %xmm0
	mulsd %xmm2, %xmm0
	movsd %xmm0, -2336(%rbp)
	movsd -2024(%rbp), %xmm0
	addsd %xmm1, %xmm0
	movabsq $4602678819172646912, %r10
	movq %r10, %xmm1
	mulsd %xmm1, %xmm0
	movabsq $4517329193108106637, %r10
	movq %r10, %xmm1
	ucomisd %xmm0, %xmm1
	ja .LB13157
.LB13158:
.LB13159:
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	divsd %xmm15, %xmm0
	movsd %xmm0, -2344(%rbp)
	movsd -2256(%rbp), %xmm1
	movsd -2264(%rbp), %xmm2
	mulsd %xmm0, %xmm1
	mulsd %xmm2, %xmm0
	xorps %xmm2, %xmm2
	ucomisd %xmm1, %xmm2
	ja .LB13170
.LB13171:
.LB13172:
	xorps %xmm2, %xmm2
	ucomisd %xmm0, %xmm2
	ja .LB13177
.LB13178:
.LB13179:
	movq -1424(%rbp), %rax
	testb %al, %al
	jne .LB13189
.LB13190:
	movsd %xmm1, -2352(%rbp)
	movsd %xmm0, -2360(%rbp)
.LB13191:
	movsd -2352(%rbp), %xmm0
	movsd -2360(%rbp), %xmm1
	ucomisd %xmm1, %xmm0
	ja .LB13209
.LB13210:
	movq -2360(%rbp), %r10
	movq %r10, -2368(%rbp)
.LB13211:
	movq -1424(%rbp), %rax
	testb %al, %al
	je .LB13228
.LB13222:
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm0
	movsd -2368(%rbp), %xmm1
	ucomisd %xmm0, %xmm1
	jae .LB13227
.LB13228:
	movl $0, -60(%rbp)
	movl $0, -64(%rbp)
	xorps %xmm0, %xmm0
	movsd %xmm0, -72(%rbp)
.LB13229:
	movslq %r12d, %rax
	xorps %xmm0, %xmm0
	cvtsi2sdq %rax, %xmm0
	movabsq $4602678819172646912, %r10
	movq %r10, %xmm1
	addsd %xmm1, %xmm0
	movsd -2016(%rbp), %xmm1
	subsd %xmm1, %xmm0
	movsd -2240(%rbp), %xmm1
	mulsd %xmm1, %xmm0
	xorps %xmm1, %xmm1
	ucomisd %xmm0, %xmm1
	ja .LB13242
.LB13243:
.LB13244:
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm1
	ucomisd %xmm1, %xmm0
	ja .LB13247
.LB13248:
	movsd %xmm0, -2376(%rbp)
.LB13249:
	movslq %r12d, %rax
	movabsq $4602678819172646912, %r10
	movq %r10, %xmm1
	movsd -2016(%rbp), %xmm2
	movsd -2248(%rbp), %xmm3
	xorps %xmm0, %xmm0
	cvtsi2sdq %rax, %xmm0
	movsd -2024(%rbp), %xmm4
	addsd %xmm0, %xmm1
	subsd %xmm2, %xmm1
	vfmadd132sd %xmm3, %xmm4, %xmm1
	movsd %xmm1, -2904(%rbp)
	movabsq $4602678819172646912, %r10
	movq %r10, %xmm1
	addsd %xmm0, %xmm1
	subsd %xmm2, %xmm1
	movsd -2256(%rbp), %xmm2
	movsd -2032(%rbp), %xmm3
	vfmadd132sd %xmm2, %xmm3, %xmm1
	movsd %xmm1, -2912(%rbp)
	movabsq $4602678819172646912, %r10
	movq %r10, %xmm1
	movsd -2016(%rbp), %xmm2
	movsd -2264(%rbp), %xmm3
	movsd -2040(%rbp), %xmm4
	addsd %xmm0, %xmm1
	subsd %xmm2, %xmm1
	vfmadd132sd %xmm3, %xmm4, %xmm1
	movabsq $4602678819172646912, %r10
	movq %r10, %xmm3
	addsd %xmm0, %xmm3
	movaps %xmm2, %xmm15
	movaps %xmm3, %xmm2
	subsd %xmm15, %xmm2
	movsd -2272(%rbp), %xmm3
	movsd -2048(%rbp), %xmm4
	vfmadd132sd %xmm3, %xmm4, %xmm2
	movabsq $4602678819172646912, %r10
	movq %r10, %xmm3
	movsd -2016(%rbp), %xmm4
	addsd %xmm0, %xmm3
	subsd %xmm4, %xmm3
	movsd -2280(%rbp), %xmm4
	movsd -2056(%rbp), %xmm5
	vfmadd132sd %xmm4, %xmm5, %xmm3
	movsd %xmm3, -2920(%rbp)
	movabsq $4602678819172646912, %r10
	movq %r10, %xmm3
	movsd %xmm3, -2384(%rbp)
	addsd %xmm0, %xmm3
	movsd %xmm3, -2392(%rbp)
	movsd -2016(%rbp), %xmm4
	subsd %xmm4, %xmm3
	movsd %xmm3, -2400(%rbp)
	movsd -2288(%rbp), %xmm4
	movsd -2064(%rbp), %xmm5
	vfmadd132sd %xmm4, %xmm5, %xmm3
	movsd %xmm3, -2408(%rbp)
	movabsq $4602678819172646912, %r10
	movq %r10, %xmm3
	movsd %xmm3, -2416(%rbp)
	addsd %xmm0, %xmm3
	movsd %xmm3, -2424(%rbp)
	movsd -2016(%rbp), %xmm4
	subsd %xmm4, %xmm3
	movsd %xmm3, -2432(%rbp)
	movsd -2296(%rbp), %xmm4
	movsd -2080(%rbp), %xmm5
	vfmadd132sd %xmm4, %xmm5, %xmm3
	movsd %xmm3, -2440(%rbp)
	movabsq $4602678819172646912, %r10
	movq %r10, %xmm3
	movsd %xmm3, -2448(%rbp)
	addsd %xmm0, %xmm3
	movsd %xmm3, -2456(%rbp)
	movsd -2016(%rbp), %xmm4
	subsd %xmm4, %xmm3
	movsd %xmm3, -2464(%rbp)
	movsd -2304(%rbp), %xmm4
	movsd -2096(%rbp), %xmm5
	vfmadd132sd %xmm4, %xmm5, %xmm3
	movsd %xmm3, -2472(%rbp)
	movabsq $4602678819172646912, %r10
	movq %r10, %xmm3
	movsd %xmm3, -2480(%rbp)
	addsd %xmm0, %xmm3
	movsd %xmm3, -2488(%rbp)
	movsd -2016(%rbp), %xmm4
	subsd %xmm4, %xmm3
	movsd %xmm3, -2496(%rbp)
	movsd -2312(%rbp), %xmm4
	movsd -2112(%rbp), %xmm5
	vfmadd132sd %xmm4, %xmm5, %xmm3
	movsd %xmm3, -2504(%rbp)
	movabsq $4602678819172646912, %r10
	movq %r10, %xmm3
	movsd %xmm3, -2512(%rbp)
	addsd %xmm0, %xmm3
	movsd %xmm3, -2520(%rbp)
	movsd -2016(%rbp), %xmm4
	subsd %xmm4, %xmm3
	movsd %xmm3, -2528(%rbp)
	movsd -2320(%rbp), %xmm4
	movsd -2128(%rbp), %xmm5
	vfmadd132sd %xmm4, %xmm5, %xmm3
	movsd %xmm3, -2536(%rbp)
	movabsq $4602678819172646912, %r10
	movq %r10, %xmm3
	movsd %xmm3, -2544(%rbp)
	addsd %xmm0, %xmm3
	movsd %xmm3, -2552(%rbp)
	movsd -2016(%rbp), %xmm4
	subsd %xmm4, %xmm3
	movsd %xmm3, -2560(%rbp)
	movsd -2328(%rbp), %xmm4
	movsd -2144(%rbp), %xmm5
	vfmadd132sd %xmm4, %xmm5, %xmm3
	movsd %xmm3, -2568(%rbp)
	movabsq $4602678819172646912, %r10
	movq %r10, %xmm3
	movsd %xmm3, -2576(%rbp)
	addsd %xmm3, %xmm0
	movsd -2016(%rbp), %xmm3
	subsd %xmm3, %xmm0
	movsd -2336(%rbp), %xmm3
	movsd -2160(%rbp), %xmm4
	movq -1440(%rbp), %rax
	vfmadd132sd %xmm3, %xmm4, %xmm0
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm3
	movl %eax, %r14d
	imull %esi, %r14d
	movsd %xmm3, -2592(%rbp)
	movsd -2368(%rbp), %xmm4
	ucomisd %xmm4, %xmm3
	seta %al
	movq %rax, -2600(%rbp)
	movzbl %al, %eax
	movq %rax, -2600(%rbp)
	movsd -1472(%rbp), %xmm3
	movq -1480(%rbp), %rax
	movq -1488(%rbp), %r10
	movq %r10, -2608(%rbp)
	movq -1496(%rbp), %r10
	movq %r10, -2616(%rbp)
	movq -2904(%rbp), %r10
	movq %r10, -2624(%rbp)
	movq -2912(%rbp), %r10
	movq %r10, -2632(%rbp)
	movsd %xmm1, -2640(%rbp)
	movsd %xmm2, -2648(%rbp)
	movq -2920(%rbp), %r10
	movq %r10, -2656(%rbp)
	movq -2408(%rbp), %r10
	movq %r10, -2664(%rbp)
	movq -1600(%rbp), %rcx
	movq -2440(%rbp), %r10
	movq %r10, -2672(%rbp)
	movq -2472(%rbp), %r10
	movq %r10, -2680(%rbp)
	movq -2504(%rbp), %r10
	movq %r10, -2688(%rbp)
	movq -2536(%rbp), %r10
	movq %r10, -2696(%rbp)
	movq -2568(%rbp), %r10
	movq %r10, -2704(%rbp)
	movsd %xmm0, -2712(%rbp)
	movsd -1448(%rbp), %xmm0
	movsd -1456(%rbp), %xmm1
	movsd -1464(%rbp), %xmm2
.LB13362:
	cmpl %r13d, %r12d
	jg .LB13364
.LB13363:
	movabsq $4517329193108106637, %r10
	movq %r10, %xmm0
	movsd -2624(%rbp), %xmm4
	ucomisd %xmm0, %xmm4
	jae .LB13371
.LB13372:
	movq -2616(%rbp), %rdx
	movq %rcx, %r8
	movq -2608(%rbp), %rcx
.LB13373:
	incl %r12d
	movsd -2624(%rbp), %xmm0
	movsd -2248(%rbp), %xmm4
	addsd %xmm4, %xmm0
	movsd %xmm0, -2936(%rbp)
	movsd -2632(%rbp), %xmm0
	movsd -2256(%rbp), %xmm4
	addsd %xmm4, %xmm0
	movsd %xmm0, -2944(%rbp)
	movsd -2640(%rbp), %xmm0
	movsd -2264(%rbp), %xmm4
	addsd %xmm4, %xmm0
	movsd -2648(%rbp), %xmm4
	movsd -2272(%rbp), %xmm5
	addsd %xmm5, %xmm4
	movsd %xmm4, -2776(%rbp)
	movsd -2656(%rbp), %xmm4
	movsd -2280(%rbp), %xmm5
	addsd %xmm5, %xmm4
	movsd %xmm4, -2784(%rbp)
	movsd -2664(%rbp), %xmm4
	movsd -2288(%rbp), %xmm5
	addsd %xmm5, %xmm4
	movsd %xmm4, -2792(%rbp)
	movsd -2672(%rbp), %xmm4
	movsd -2296(%rbp), %xmm5
	addsd %xmm5, %xmm4
	movsd %xmm4, -2800(%rbp)
	movsd -2680(%rbp), %xmm4
	movsd -2304(%rbp), %xmm5
	addsd %xmm5, %xmm4
	movsd %xmm4, -2808(%rbp)
	movsd -2688(%rbp), %xmm4
	movsd -2312(%rbp), %xmm5
	addsd %xmm5, %xmm4
	movsd %xmm4, -2816(%rbp)
	movsd -2696(%rbp), %xmm4
	movsd -2320(%rbp), %xmm5
	addsd %xmm5, %xmm4
	movsd %xmm4, -2824(%rbp)
	movsd -2704(%rbp), %xmm4
	movsd -2328(%rbp), %xmm5
	addsd %xmm5, %xmm4
	movsd %xmm4, -2832(%rbp)
	movsd -2712(%rbp), %xmm4
	movsd -2336(%rbp), %xmm5
	addsd %xmm5, %xmm4
	movsd %xmm4, -2840(%rbp)
	movq %rcx, -2608(%rbp)
	movq %rdx, -2616(%rbp)
	movq -2944(%rbp), %r10
	movq %r10, -2632(%rbp)
	movsd %xmm0, -2640(%rbp)
	movq -2776(%rbp), %r10
	movq %r10, -2648(%rbp)
	movq -2784(%rbp), %r10
	movq %r10, -2656(%rbp)
	movq -2792(%rbp), %r10
	movq %r10, -2664(%rbp)
	movq %r8, %rcx
	movq -2800(%rbp), %r10
	movq %r10, -2672(%rbp)
	movq -2808(%rbp), %r10
	movq %r10, -2680(%rbp)
	movq -2816(%rbp), %r10
	movq %r10, -2688(%rbp)
	movq -2824(%rbp), %r10
	movq %r10, -2696(%rbp)
	movq -2832(%rbp), %r10
	movq %r10, -2704(%rbp)
	movq -2840(%rbp), %r10
	movq %r10, -2712(%rbp)
	movsd -2624(%rbp), %xmm0
	movq -2936(%rbp), %r10
	movq %r10, -2624(%rbp)
	cmpl %r13d, %r12d
	jle .LB13363
	jmp .LB13364
.LB12205:
	movaps %xmm3, %xmm5
	movq -120(%rbp), %r10
	movq %r10, -336(%rbp)
	movq -128(%rbp), %r10
	movq %r10, -344(%rbp)
	movq -136(%rbp), %r10
	movq %r10, -352(%rbp)
	movq -144(%rbp), %r10
	movq %r10, -360(%rbp)
	movq -152(%rbp), %r10
	movq %r10, -368(%rbp)
	movq -160(%rbp), %r10
	movq %r10, -376(%rbp)
	movq -80(%rbp), %r10
	movq %r10, -384(%rbp)
	movq -2848(%rbp), %r10
	movq %r10, -392(%rbp)
	movq -88(%rbp), %r10
	movq %r10, -400(%rbp)
	movq -104(%rbp), %r10
	movq %r10, -408(%rbp)
	movq -176(%rbp), %r10
	movq %r10, -416(%rbp)
	movsd %xmm0, -424(%rbp)
	movsd %xmm1, -432(%rbp)
	movsd %xmm2, -440(%rbp)
	movq -288(%rbp), %r10
	movq %r10, -448(%rbp)
	movq -296(%rbp), %r10
	movq %r10, -456(%rbp)
	movq -304(%rbp), %r10
	movq %r10, -464(%rbp)
	movq -264(%rbp), %r10
	movq %r10, -472(%rbp)
	movq -272(%rbp), %r10
	movq %r10, -480(%rbp)
	movq -280(%rbp), %r10
	movq %r10, -488(%rbp)
	movsd -96(%rbp), %xmm3
	jmp .LB12207
.LB12247:
	movq -168(%rbp), %r10
	movq %r10, -496(%rbp)
	movsd %xmm4, -504(%rbp)
	movq -192(%rbp), %r10
	movq %r10, -512(%rbp)
	movq -200(%rbp), %r10
	movq %r10, -2864(%rbp)
	movq -216(%rbp), %r10
	movq %r10, -2856(%rbp)
	movq -224(%rbp), %r10
	movq %r10, -520(%rbp)
	movq -232(%rbp), %r10
	movq %r10, -528(%rbp)
	movsd %xmm3, -536(%rbp)
	movsd %xmm5, -544(%rbp)
	movq -336(%rbp), %r10
	movq %r10, -552(%rbp)
	movq -344(%rbp), %r10
	movq %r10, -560(%rbp)
	movq -352(%rbp), %r10
	movq %r10, -568(%rbp)
	movq -360(%rbp), %r10
	movq %r10, -576(%rbp)
	movq -368(%rbp), %r10
	movq %r10, -584(%rbp)
	movq -376(%rbp), %r10
	movq %r10, -592(%rbp)
	movq -312(%rbp), %r10
	movq %r10, -600(%rbp)
	movq -320(%rbp), %r10
	movq %r10, -608(%rbp)
	movq -328(%rbp), %r10
	movq %r10, -616(%rbp)
	movq -448(%rbp), %r10
	movq %r10, -624(%rbp)
	movq -456(%rbp), %r10
	movq %r10, -632(%rbp)
	movq -464(%rbp), %r10
	movq %r10, -640(%rbp)
	movsd -208(%rbp), %xmm3
	jmp .LB12249
.LB12289:
	movq -536(%rbp), %r10
	movq %r10, -648(%rbp)
	movq -544(%rbp), %r10
	movq %r10, -656(%rbp)
	movq -552(%rbp), %r10
	movq %r10, -664(%rbp)
	movq -560(%rbp), %r10
	movq %r10, -672(%rbp)
	movq -568(%rbp), %r10
	movq %r10, -680(%rbp)
	movq -576(%rbp), %r10
	movq %r10, -688(%rbp)
	movq -584(%rbp), %r10
	movq %r10, -696(%rbp)
	movq -592(%rbp), %r10
	movq %r10, -704(%rbp)
	movq -384(%rbp), %r10
	movq %r10, -712(%rbp)
	movq -392(%rbp), %r10
	movq %r10, -720(%rbp)
	movq -400(%rbp), %r10
	movq %r10, -728(%rbp)
	movq -408(%rbp), %r10
	movq %r10, -736(%rbp)
	movq -416(%rbp), %r10
	movq %r10, -744(%rbp)
	movq -424(%rbp), %r10
	movq %r10, -752(%rbp)
	movq -432(%rbp), %r10
	movq %r10, -760(%rbp)
	movq -440(%rbp), %r10
	movq %r10, -768(%rbp)
	movq -624(%rbp), %r10
	movq %r10, -776(%rbp)
	movq -632(%rbp), %r10
	movq %r10, -784(%rbp)
	movq -640(%rbp), %r10
	movq %r10, -792(%rbp)
	movq -472(%rbp), %r10
	movq %r10, -800(%rbp)
	movq -480(%rbp), %r10
	movq %r10, -808(%rbp)
	movq -488(%rbp), %r10
	movq %r10, -816(%rbp)
	jmp .LB12291
.LB12368:
	movaps %xmm0, %xmm4
	movsd %xmm1, -896(%rbp)
	movsd %xmm2, -904(%rbp)
	movsd %xmm0, -912(%rbp)
	movsd %xmm1, -920(%rbp)
	movsd %xmm2, -928(%rbp)
	jmp .LB12370
.LB12493:
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm0
	movsd -1136(%rbp), %xmm1
	divsd %xmm1, %xmm0
	movsd %xmm0, -1160(%rbp)
	jmp .LB12495
.LB12502:
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm0
	movsd -1144(%rbp), %xmm1
	divsd %xmm1, %xmm0
	jmp .LB12504
.LB12692:
	movsd -1168(%rbp), %xmm0
	movsd -1136(%rbp), %xmm1
	movsd -496(%rbp), %xmm2
	vfmadd132sd %xmm1, %xmm2, %xmm0
	movsd -648(%rbp), %xmm1
	ucomisd %xmm1, %xmm0
	seta %al
	movzbl %al, %eax
	movq %rax, -1408(%rbp)
	jmp .LB12694
.LB12807:
	movq -880(%rbp), %rax
	movq -888(%rbp), %rcx
	subl %edx, %eax
	addl %ecx, %eax
	jmp .LB12809
.LB12831:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB12893:
	movsd -1248(%rbp), %xmm4
	movsd -496(%rbp), %xmm5
	vfmadd132sd %xmm0, %xmm5, %xmm4
	movsd %xmm4, -1944(%rbp)
	movsd -1256(%rbp), %xmm4
	movsd -512(%rbp), %xmm5
	vfmadd132sd %xmm0, %xmm5, %xmm4
	movsd %xmm4, -1952(%rbp)
	movsd -1264(%rbp), %xmm4
	movsd -1008(%rbp), %xmm5
	vfmadd132sd %xmm0, %xmm5, %xmm4
	movsd %xmm4, -1960(%rbp)
	movsd -1272(%rbp), %xmm4
	movsd -1016(%rbp), %xmm5
	vfmadd132sd %xmm0, %xmm5, %xmm4
	movsd %xmm4, -1968(%rbp)
	movsd -1280(%rbp), %xmm4
	movsd -936(%rbp), %xmm5
	vfmadd132sd %xmm0, %xmm5, %xmm4
	movsd %xmm4, -1976(%rbp)
	movsd -1288(%rbp), %xmm4
	movsd -944(%rbp), %xmm5
	vfmadd132sd %xmm0, %xmm5, %xmm4
	movsd %xmm4, -1984(%rbp)
	movsd -1296(%rbp), %xmm4
	movsd -952(%rbp), %xmm5
	vfmadd132sd %xmm0, %xmm5, %xmm4
	movsd %xmm4, -1992(%rbp)
	movsd -1304(%rbp), %xmm4
	movsd -1056(%rbp), %xmm5
	vfmadd132sd %xmm0, %xmm5, %xmm4
	movsd %xmm4, -2000(%rbp)
	movsd -1312(%rbp), %xmm4
	movsd -1064(%rbp), %xmm5
	vfmadd132sd %xmm0, %xmm5, %xmm4
	movsd %xmm4, -2008(%rbp)
	movsd -1320(%rbp), %xmm4
	movsd -1072(%rbp), %xmm5
	vfmadd132sd %xmm4, %xmm5, %xmm0
	movq -1952(%rbp), %r10
	movq %r10, -1872(%rbp)
	movq -1960(%rbp), %r10
	movq %r10, -1880(%rbp)
	movq -1968(%rbp), %r10
	movq %r10, -1888(%rbp)
	movq -1976(%rbp), %r10
	movq %r10, -1896(%rbp)
	movq -1984(%rbp), %r10
	movq %r10, -1904(%rbp)
	movq -1992(%rbp), %r10
	movq %r10, -1912(%rbp)
	movq -2000(%rbp), %r10
	movq %r10, -1920(%rbp)
	movq -2008(%rbp), %r10
	movq %r10, -1928(%rbp)
	movsd %xmm0, -1936(%rbp)
	movsd -1944(%rbp), %xmm0
	jmp .LB12895
.LB13002:
	movsd %xmm0, -2016(%rbp)
	movsd -1760(%rbp), %xmm0
	movq -1872(%rbp), %r10
	movq %r10, -2024(%rbp)
	movq -1880(%rbp), %r10
	movq %r10, -2032(%rbp)
	movq -2872(%rbp), %r10
	movq %r10, -2888(%rbp)
	movq -1888(%rbp), %r10
	movq %r10, -2040(%rbp)
	movq -2880(%rbp), %r10
	movq %r10, -2896(%rbp)
	movq -1896(%rbp), %r10
	movq %r10, -2048(%rbp)
	movq -1904(%rbp), %r10
	movq %r10, -2056(%rbp)
	movq -1912(%rbp), %r10
	movq %r10, -2064(%rbp)
	movsd %xmm3, -2072(%rbp)
	movq -1896(%rbp), %r10
	movq %r10, -2080(%rbp)
	movsd %xmm1, -2088(%rbp)
	movq -1904(%rbp), %r10
	movq %r10, -2096(%rbp)
	movsd %xmm2, -2104(%rbp)
	movq -1912(%rbp), %r10
	movq %r10, -2112(%rbp)
	movsd %xmm3, -2120(%rbp)
	movq -1920(%rbp), %r10
	movq %r10, -2128(%rbp)
	movq -1776(%rbp), %r10
	movq %r10, -2136(%rbp)
	movq -1928(%rbp), %r10
	movq %r10, -2144(%rbp)
	movq -1784(%rbp), %r10
	movq %r10, -2152(%rbp)
	movq -1936(%rbp), %r10
	movq %r10, -2160(%rbp)
	movq -1792(%rbp), %r10
	movq %r10, -2168(%rbp)
	movaps %xmm2, %xmm3
	movaps %xmm1, %xmm2
	movsd -1768(%rbp), %xmm1
	jmp .LB13004
.LB13157:
	movabsq $4517329193108106637, %r10
	movq %r10, %xmm0
	jmp .LB13159
.LB13170:
	xorps %xmm2, %xmm2
	movaps %xmm1, %xmm15
	movaps %xmm2, %xmm1
	subsd %xmm15, %xmm1
	jmp .LB13172
.LB13177:
	xorps %xmm2, %xmm2
	movaps %xmm0, %xmm15
	movaps %xmm2, %xmm0
	subsd %xmm15, %xmm0
	jmp .LB13179
.LB13189:
	movslq 8(%rdi), %rax
	xorps %xmm2, %xmm2
	cvtsi2sdq %rax, %xmm2
	movslq 12(%rdi), %rax
	mulsd %xmm2, %xmm1
	xorps %xmm2, %xmm2
	cvtsi2sdq %rax, %xmm2
	mulsd %xmm2, %xmm0
	movsd %xmm1, -2352(%rbp)
	movsd %xmm0, -2360(%rbp)
	jmp .LB13191
.LB13209:
	movq -2352(%rbp), %r10
	movq %r10, -2368(%rbp)
	jmp .LB13211
.LB13227:
	leaq -60(%rbp), %r8
	leaq -64(%rbp), %r9
	leaq -72(%rbp), %rax
	movq %rax, 32(%rsp)
	movq %rdi, %rcx
	movsd -2368(%rbp), %xmm0
	movaps %xmm0, %xmm1
	callq raycaster__rc_tex_select_lod__5__RCTextureE1_ptr1__doubleE1__dataE1_ptr1_sbits32__dataE1_ptr1_sbits32__doubleE1_ptr1__ret_voidE1
	jmp .LB13229
.LB13242:
	xorps %xmm0, %xmm0
	jmp .LB13244
.LB13247:
	movabsq $4607182418800017408, %r10
	movq %r10, -2376(%rbp)
	jmp .LB13249
.LB13364:
	movq -1440(%rbp), %rdx
	movq -1416(%rbp), %r8
	addl %r8d, %edx
	movq %rdx, -1440(%rbp)
	movq -2240(%rbp), %r10
	movq %r10, -1704(%rbp)
	movsd %xmm0, -1448(%rbp)
	movsd %xmm1, -1456(%rbp)
	movsd %xmm2, -1464(%rbp)
	movsd %xmm3, -1472(%rbp)
	movq %rax, -1480(%rbp)
	movq -2608(%rbp), %r10
	movq %r10, -1488(%rbp)
	movq -2616(%rbp), %r10
	movq %r10, -1496(%rbp)
	movq -2248(%rbp), %r10
	movq %r10, -1712(%rbp)
	movq -2256(%rbp), %r10
	movq %r10, -1720(%rbp)
	movq -2264(%rbp), %r10
	movq %r10, -1728(%rbp)
	movq -2272(%rbp), %r10
	movq %r10, -1736(%rbp)
	movq -2280(%rbp), %r10
	movq %r10, -1744(%rbp)
	movq -2288(%rbp), %r10
	movq %r10, -1504(%rbp)
	movq -2368(%rbp), %r10
	movq %r10, -1512(%rbp)
	movq -2344(%rbp), %r10
	movq %r10, -1520(%rbp)
	movq -2352(%rbp), %r10
	movq %r10, -1528(%rbp)
	movq -2360(%rbp), %r10
	movq %r10, -1536(%rbp)
	movq -2376(%rbp), %r10
	movq %r10, -1544(%rbp)
	movq -2624(%rbp), %r10
	movq %r10, -1552(%rbp)
	movq -2632(%rbp), %r10
	movq %r10, -1560(%rbp)
	movq -2640(%rbp), %r10
	movq %r10, -1568(%rbp)
	movq -2648(%rbp), %r10
	movq %r10, -1576(%rbp)
	movq -2656(%rbp), %r10
	movq %r10, -1584(%rbp)
	movq -2664(%rbp), %r10
	movq %r10, -1592(%rbp)
	movq %rcx, -1600(%rbp)
	movq -2296(%rbp), %r10
	movq %r10, -1608(%rbp)
	movq -2304(%rbp), %r10
	movq %r10, -1616(%rbp)
	movq -2312(%rbp), %r10
	movq %r10, -1624(%rbp)
	movq -2320(%rbp), %r10
	movq %r10, -1632(%rbp)
	movq -2328(%rbp), %r10
	movq %r10, -1640(%rbp)
	movq -2336(%rbp), %r10
	movq %r10, -1648(%rbp)
	movq -2672(%rbp), %r10
	movq %r10, -1656(%rbp)
	movq -2680(%rbp), %r10
	movq %r10, -1664(%rbp)
	movq -2688(%rbp), %r10
	movq %r10, -1672(%rbp)
	movq -2696(%rbp), %r10
	movq %r10, -1680(%rbp)
	movq -2704(%rbp), %r10
	movq %r10, -1688(%rbp)
	movq -2712(%rbp), %r10
	movq %r10, -1696(%rbp)
	movq %r12, %rax
	movq %r14, %rcx
	jmp .LB12829
.LB13371:
	leal (%r14,%r12), %edx
	movslq %edx, %rdx
	movsd (%rbx,%rdx,8), %xmm0
	movsd -2624(%rbp), %xmm4
	ucomisd %xmm0, %xmm4
	ja .LB13382
.LB13383:
	movq -2616(%rbp), %rdx
	movq %rcx, %r8
	movq -2608(%rbp), %rcx
.LB13384:
	jmp .LB13373
.LB13382:
	movsd -2624(%rbp), %xmm1
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm0
	divsd %xmm1, %xmm0
	movsd %xmm0, -2720(%rbp)
	movsd -2632(%rbp), %xmm1
	movsd -2640(%rbp), %xmm2
	mulsd %xmm0, %xmm1
	mulsd %xmm2, %xmm0
	cvttsd2siq %xmm1, %rax
	movl %eax, %eax
	movslq %eax, %rax
	xorps %xmm2, %xmm2
	cvtsi2sdq %rax, %xmm2
	subsd %xmm2, %xmm1
	xorps %xmm2, %xmm2
	ucomisd %xmm1, %xmm2
	ja .LB13400
.LB13401:
	movsd %xmm1, -2728(%rbp)
.LB13402:
	cvttsd2siq %xmm0, %rax
	movl %eax, %eax
	movslq %eax, %rax
	xorps %xmm1, %xmm1
	cvtsi2sdq %rax, %xmm1
	subsd %xmm1, %xmm0
	xorps %xmm1, %xmm1
	ucomisd %xmm0, %xmm1
	ja .LB13413
.LB13414:
	movsd %xmm0, -2736(%rbp)
.LB13415:
	movq -1424(%rbp), %rax
	testb %al, %al
	jne .LB13426
.LB13427:
	movq $0, -2744(%rbp)
	movq -2608(%rbp), %r10
	movq %r10, -2752(%rbp)
	movq -2616(%rbp), %r10
	movq %r10, -2760(%rbp)
	movq $-1, %rax
.LB13428:
	movq -2744(%rbp), %rcx
	testb %cl, %cl
	je .LB13516
.LB13517:
.LB13518:
	movsd -2720(%rbp), %xmm1
	movsd -2728(%rbp), %xmm2
	movsd -2736(%rbp), %xmm3
	movq -2752(%rbp), %rcx
	movq -2760(%rbp), %rdx
	movq %rax, %r8
	movq -2744(%rbp), %rax
	jmp .LB13384
.LB13400:
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm2
	addsd %xmm2, %xmm1
	movsd %xmm1, -2728(%rbp)
	jmp .LB13402
.LB13413:
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm1
	addsd %xmm1, %xmm0
	movsd %xmm0, -2736(%rbp)
	jmp .LB13415
.LB13426:
	movq -2600(%rbp), %rax
	testb %al, %al
	jne .LB13431
.LB13432:
	movl -60(%rbp), %r9d
	movl -64(%rbp), %eax
	movsd -72(%rbp), %xmm0
	movq %rax, 32(%rsp)
	movsd %xmm0, 40(%rsp)
	movq %rdi, %rcx
	movsd -2728(%rbp), %xmm0
	movaps %xmm0, %xmm1
	movsd -2736(%rbp), %xmm0
	movaps %xmm0, %xmm2
	callq raycaster__rc_tex_sample_lod__6__RCTextureE1_ptr1__doubleE1__doubleE1__dataE1_sbits32__dataE1_sbits32__doubleE1__ret_dataE1_ubits64
	movq -2616(%rbp), %rcx
	movq %rax, %rdx
	movq -2608(%rbp), %rax
.LB13433:
	movabsq $281474976710655, %r8
	movabsq $281470681808895, %r9
	xorl %r15d, %r15d
	andq %rdx, %r8
	movq %r8, -2768(%rbp)
	cmpq %r9, %r8
	movq %r9, -2928(%rbp)
	movq %r15, -2952(%rbp)
	sete %r8b
	movq %r8, -2952(%rbp)
	movq -2952(%rbp), %r10
	movq %r10, -2744(%rbp)
	movq %rax, -2752(%rbp)
	movq %rcx, -2760(%rbp)
	movq %rdx, %rax
	jmp .LB13428
.LB13431:
	movslq 112(%rdi), %rax
	movsd -2728(%rbp), %xmm1
	movslq 160(%rdi), %rcx
	xorps %xmm0, %xmm0
	cvtsi2sdq %rax, %xmm0
	mulsd %xmm1, %xmm0
	movsd -2736(%rbp), %xmm1
	cvttsd2siq %xmm0, %rax
	xorps %xmm0, %xmm0
	cvtsi2sdq %rcx, %xmm0
	movl %eax, %eax
	mulsd %xmm1, %xmm0
	cvttsd2siq %xmm0, %rcx
	movl %ecx, %ecx
	cmpl 112(%rdi), %eax
	jae .LB13459
.LB13460:
.LB13461:
	cmpl 160(%rdi), %ecx
	jae .LB13475
.LB13476:
.LB13477:
	movq 16(%rdi), %rdx
	movl %ecx, %r8d
	imull 112(%rdi), %r8d
	addl %eax, %r8d
	movslq %r8d, %r8
	movq (%rdx,%r8,8), %rdx
	jmp .LB13433
.LB13459:
	movl 112(%rdi), %eax
	decl %eax
	cmpl 160(%rdi), %ecx
	jb .LB13476
.LB13475:
	movl 160(%rdi), %ecx
	decl %ecx
	jmp .LB13477
.LB13516:
	movq -1432(%rbp), %rcx
	testb %cl, %cl
	jne .LB13522
.LB13523:
.LB13524:
	leal (%r14,%r12), %ecx
	movq -2216(%rbp), %r8
	movslq %ecx, %rcx
	imulq $56, %rcx, %rdx
	leaq (%r8,%rdx,1), %rdx
	movq %rax, (%rdx)
	movsd -2672(%rbp), %xmm0
	movsd -2720(%rbp), %xmm1
	mulsd %xmm1, %xmm0
	movsd %xmm0, 8(%rdx)
	movsd -2680(%rbp), %xmm0
	mulsd %xmm1, %xmm0
	movsd %xmm0, 16(%rdx)
	movsd -2688(%rbp), %xmm0
	mulsd %xmm1, %xmm0
	movsd %xmm0, 24(%rdx)
	movsd -2696(%rbp), %xmm0
	movsd -2720(%rbp), %xmm1
	mulsd %xmm1, %xmm0
	movsd %xmm0, 32(%rdx)
	movsd -2704(%rbp), %xmm0
	mulsd %xmm1, %xmm0
	movsd %xmm0, 40(%rdx)
	movsd -2712(%rbp), %xmm0
	mulsd %xmm1, %xmm0
	movsd %xmm0, 48(%rdx)
	movsd -2624(%rbp), %xmm0
	movsd %xmm0, (%rbx,%rcx,8)
	jmp .LB13518
.LB13522:
	movq %rax, %rcx
	movq -2960(%rbp), %rdx
	callq raycaster__color64_tint__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64
	jmp .LB13524
.LB13081:
	movq -1440(%rbp), %rdx
	movq -1416(%rbp), %r8
	addl %r8d, %edx
	movq %rdx, -1440(%rbp)
	jmp .LB12829
.LB12825:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB12482:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB12354:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
	.text
	.globl raycaster__r3d_inst_cull__2__R3DMeshInstE1_ptr1__R3DCameraE1_ptr1__ret_boolE1
	.def raycaster__r3d_inst_cull__2__R3DMeshInstE1_ptr1__R3DCameraE1_ptr1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
raycaster__r3d_inst_cull__2__R3DMeshInstE1_ptr1__R3DCameraE1_ptr1__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $480, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
.LB13669:
	movq %rcx, %rsi
	movq %rdx, %rdi
	movq (%rsi), %rbx
	testq %rbx, %rbx
	je .LB13684
.LB13685:
	movsd 56(%rsi), %xmm0
	movsd 64(%rsi), %xmm1
	ucomisd %xmm0, %xmm1
	ja .LB13702
.LB13703:
.LB13704:
	movsd 72(%rsi), %xmm1
	ucomisd %xmm0, %xmm1
	ja .LB13715
.LB13716:
	movsd %xmm0, -80(%rbp)
.LB13717:
	xorps %xmm0, %xmm0
	leaq -40(%rbp), %rdx
	leaq -32(%rbp), %r8
	movsd %xmm0, -32(%rbp)
	xorps %xmm0, %xmm0
	movsd %xmm0, -40(%rbp)
	xorps %xmm0, %xmm0
	movsd %xmm0, -48(%rbp)
	xorps %xmm0, %xmm0
	movsd %xmm0, -56(%rbp)
	xorps %xmm0, %xmm0
	movsd %xmm0, -64(%rbp)
	xorps %xmm0, %xmm0
	movsd %xmm0, -72(%rbp)
	movsd 32(%rsi), %xmm0
	callq raycaster___sincos__3__doubleE1__doubleE1_ptr1__doubleE1_ptr1__ret_voidE1
	movsd 40(%rsi), %xmm0
	leaq -56(%rbp), %rdx
	leaq -48(%rbp), %r8
	callq raycaster___sincos__3__doubleE1__doubleE1_ptr1__doubleE1_ptr1__ret_voidE1
	movsd 48(%rsi), %xmm0
	leaq -72(%rbp), %rdx
	leaq -64(%rbp), %r8
	callq raycaster___sincos__3__doubleE1__doubleE1_ptr1__doubleE1_ptr1__ret_voidE1
	movsd -56(%rbp), %xmm0
	movsd %xmm0, -440(%rbp)
	movsd -40(%rbp), %xmm1
	movsd %xmm1, -152(%rbp)
	mulsd %xmm1, %xmm0
	movsd %xmm0, -136(%rbp)
	movsd -48(%rbp), %xmm0
	movsd %xmm0, -424(%rbp)
	mulsd %xmm1, %xmm0
	movsd %xmm0, -112(%rbp)
	movsd 32(%rbx), %xmm0
	movsd 56(%rsi), %xmm1
	movsd %xmm1, -88(%rbp)
	mulsd %xmm1, %xmm0
	movsd %xmm0, -160(%rbp)
	movsd 40(%rbx), %xmm0
	movsd %xmm0, -96(%rbp)
	movsd 64(%rsi), %xmm1
	movsd %xmm1, -104(%rbp)
	mulsd %xmm1, %xmm0
	movsd %xmm0, -416(%rbp)
	movsd 48(%rbx), %xmm0
	movsd %xmm0, -120(%rbp)
	movsd 72(%rsi), %xmm1
	movsd %xmm1, -128(%rbp)
	mulsd %xmm1, %xmm0
	movsd %xmm0, -232(%rbp)
	movsd 8(%rsi), %xmm0
	movsd %xmm0, -144(%rbp)
	movsd -64(%rbp), %xmm0
	movsd -72(%rbp), %xmm1
	movsd -136(%rbp), %xmm2
	mulsd %xmm1, %xmm2
	movsd %xmm2, -168(%rbp)
	movsd -424(%rbp), %xmm3
	vfmadd231sd %xmm3, %xmm0, %xmm2
	movsd %xmm2, -176(%rbp)
	movsd -160(%rbp), %xmm3
	movsd -144(%rbp), %xmm4
	vfmadd132sd %xmm3, %xmm4, %xmm2
	movsd %xmm2, -184(%rbp)
	xorps %xmm2, %xmm2
	movsd %xmm2, -192(%rbp)
	movsd -424(%rbp), %xmm3
	subsd %xmm3, %xmm2
	movsd %xmm2, -200(%rbp)
	movsd -136(%rbp), %xmm3
	mulsd %xmm0, %xmm3
	vfmadd132sd %xmm1, %xmm3, %xmm2
	movsd %xmm3, -208(%rbp)
	movsd %xmm2, -216(%rbp)
	movsd -184(%rbp), %xmm3
	movsd -416(%rbp), %xmm4
	vfmadd132sd %xmm4, %xmm3, %xmm2
	movsd %xmm2, -224(%rbp)
	movsd -32(%rbp), %xmm3
	movsd %xmm3, -432(%rbp)
	movsd -440(%rbp), %xmm4
	mulsd %xmm4, %xmm3
	movsd %xmm3, -240(%rbp)
	movsd -232(%rbp), %xmm4
	vfmadd231sd %xmm3, %xmm4, %xmm2
	movsd %xmm2, -248(%rbp)
	movsd 16(%rsi), %xmm2
	movsd %xmm2, -256(%rbp)
	movsd -432(%rbp), %xmm3
	movaps %xmm3, %xmm4
	mulsd %xmm1, %xmm4
	mulsd %xmm0, %xmm3
	movsd %xmm4, -264(%rbp)
	movsd -160(%rbp), %xmm5
	vfmadd231sd %xmm4, %xmm5, %xmm2
	movsd %xmm2, -272(%rbp)
	movsd %xmm3, -280(%rbp)
	movsd -416(%rbp), %xmm4
	vfmadd231sd %xmm3, %xmm4, %xmm2
	xorps %xmm3, %xmm3
	movsd %xmm2, -288(%rbp)
	movsd %xmm3, -296(%rbp)
	movsd -152(%rbp), %xmm4
	subsd %xmm4, %xmm3
	movsd %xmm3, -304(%rbp)
	movsd -232(%rbp), %xmm4
	vfmadd231sd %xmm3, %xmm4, %xmm2
	movsd %xmm2, -312(%rbp)
	movsd 24(%rsi), %xmm2
	movsd %xmm2, -320(%rbp)
	xorps %xmm2, %xmm2
	movsd %xmm2, -328(%rbp)
	movsd -440(%rbp), %xmm3
	subsd %xmm3, %xmm2
	movsd %xmm2, -336(%rbp)
	movsd -112(%rbp), %xmm3
	mulsd %xmm1, %xmm3
	movsd %xmm3, -344(%rbp)
	vfmadd132sd %xmm0, %xmm3, %xmm2
	movsd %xmm2, -352(%rbp)
	movsd -160(%rbp), %xmm3
	movsd -320(%rbp), %xmm4
	vfmadd132sd %xmm3, %xmm4, %xmm2
	movsd %xmm2, -360(%rbp)
	movsd -112(%rbp), %xmm3
	mulsd %xmm3, %xmm0
	movsd -440(%rbp), %xmm3
	vfmadd231sd %xmm3, %xmm1, %xmm0
	movsd -416(%rbp), %xmm1
	vfmadd132sd %xmm1, %xmm2, %xmm0
	movsd -424(%rbp), %xmm1
	movsd -432(%rbp), %xmm2
	mulsd %xmm2, %xmm1
	movsd -232(%rbp), %xmm2
	vfmadd231sd %xmm1, %xmm2, %xmm0
	movsd 56(%rbx), %xmm1
	movsd -80(%rbp), %xmm2
	mulsd %xmm2, %xmm1
	movsd %xmm1, -368(%rbp)
	movsd 312(%rdi), %xmm1
	movsd 320(%rdi), %xmm2
	movsd -312(%rbp), %xmm3
	mulsd %xmm3, %xmm2
	movsd -248(%rbp), %xmm3
	vfmadd132sd %xmm3, %xmm2, %xmm1
	movsd 328(%rdi), %xmm2
	vfmadd231sd %xmm2, %xmm0, %xmm1
	movsd 336(%rdi), %xmm2
	addsd %xmm2, %xmm1
	movsd %xmm1, -376(%rbp)
	movsd 344(%rdi), %xmm1
	movsd 352(%rdi), %xmm2
	movsd -312(%rbp), %xmm3
	mulsd %xmm3, %xmm2
	movsd -248(%rbp), %xmm3
	vfmadd132sd %xmm3, %xmm2, %xmm1
	movsd 360(%rdi), %xmm2
	vfmadd231sd %xmm2, %xmm0, %xmm1
	movsd 368(%rdi), %xmm2
	addsd %xmm2, %xmm1
	movsd %xmm1, -384(%rbp)
	movsd 408(%rdi), %xmm1
	movsd 416(%rdi), %xmm2
	movsd -312(%rbp), %xmm3
	mulsd %xmm3, %xmm2
	movsd -248(%rbp), %xmm3
	vfmadd231sd %xmm1, %xmm3, %xmm2
	movsd 424(%rdi), %xmm3
	vfmadd132sd %xmm3, %xmm2, %xmm0
	movsd 432(%rdi), %xmm2
	addsd %xmm2, %xmm0
	movsd %xmm0, -392(%rbp)
	movaps %xmm1, %xmm0
	callq standard__math__abs__1__doubleE1__ret_doubleE1
	movsd %xmm0, -400(%rbp)
	movsd 416(%rdi), %xmm0
	callq standard__math__abs__1__doubleE1__ret_doubleE1
	movsd -400(%rbp), %xmm1
	addsd %xmm1, %xmm0
	movsd %xmm0, -408(%rbp)
	movsd 424(%rdi), %xmm0
	callq standard__math__abs__1__doubleE1__ret_doubleE1
	movsd -408(%rbp), %xmm1
	addsd %xmm1, %xmm0
	movsd -368(%rbp), %xmm1
	mulsd %xmm1, %xmm0
	movsd -392(%rbp), %xmm1
	movsd 24(%rdi), %xmm2
	addsd %xmm0, %xmm1
	ucomisd %xmm1, %xmm2
	ja .LB14002
.LB14003:
	movsd -376(%rbp), %xmm1
	movsd -392(%rbp), %xmm2
	xorps %xmm3, %xmm3
	addsd %xmm0, %xmm1
	addsd %xmm0, %xmm2
	movaps %xmm2, %xmm15
	movaps %xmm3, %xmm2
	subsd %xmm15, %xmm2
	ucomisd %xmm1, %xmm2
	ja .LB14013
.LB14014:
	movsd -376(%rbp), %xmm1
	movsd -392(%rbp), %xmm2
	subsd %xmm0, %xmm1
	addsd %xmm0, %xmm2
	ucomisd %xmm2, %xmm1
	ja .LB14023
.LB14024:
	movsd -384(%rbp), %xmm1
	movsd -392(%rbp), %xmm2
	xorps %xmm3, %xmm3
	addsd %xmm0, %xmm1
	addsd %xmm0, %xmm2
	movaps %xmm2, %xmm15
	movaps %xmm3, %xmm2
	subsd %xmm15, %xmm2
	ucomisd %xmm1, %xmm2
	ja .LB14034
.LB14035:
	movsd -384(%rbp), %xmm1
	movsd -392(%rbp), %xmm2
	subsd %xmm0, %xmm1
	addsd %xmm2, %xmm0
	ucomisd %xmm0, %xmm1
	ja .LB14044
.LB14045:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB13702:
	movaps %xmm1, %xmm0
	jmp .LB13704
.LB13715:
	movsd %xmm1, -80(%rbp)
	jmp .LB13717
.LB14044:
	movl $1, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB14034:
	movl $1, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB14023:
	movl $1, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB14013:
	movl $1, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB14002:
	movl $1, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB13684:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
	.text
	.globl raycaster__r3d_draw_mesh_inst__9__R3DMeshInstE1_ptr1__DMat4E1_ptr1__R3DCameraE1_ptr1__RCTexturePaletteE1_ptr1__ArenaE1_ptr1__doubleE1_ptr1__R3DGBufPixelE1_ptr1__dataE1_sbits32__dataE1_sbits32__ret_voidE1
	.def raycaster__r3d_draw_mesh_inst__9__R3DMeshInstE1_ptr1__DMat4E1_ptr1__R3DCameraE1_ptr1__RCTexturePaletteE1_ptr1__ArenaE1_ptr1__doubleE1_ptr1__R3DGBufPixelE1_ptr1__dataE1_sbits32__dataE1_sbits32__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
raycaster__r3d_draw_mesh_inst__9__R3DMeshInstE1_ptr1__DMat4E1_ptr1__R3DCameraE1_ptr1__RCTexturePaletteE1_ptr1__ArenaE1_ptr1__doubleE1_ptr1__R3DGBufPixelE1_ptr1__dataE1_sbits32__dataE1_sbits32__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	movl $4432, %eax
	callq __chkstk
	subq %rax, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
	movq %r14, -48(%rbp)
	movq %r15, -56(%rbp)
.LB14047:
	movq %r8, %rbx
	movq %r9, %rsi
	movq %rcx, -3744(%rbp)
	movq 48(%rbp), %rax
	movq %rax, -3312(%rbp)
	movq 56(%rbp), %rax
	movq %rax, -3304(%rbp)
	movq 64(%rbp), %rax
	movq %rax, -3328(%rbp)
	movl 72(%rbp), %eax
	movq %rax, -3528(%rbp)
	movl 80(%rbp), %eax
	movq %rax, -3296(%rbp)
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -184(%rbp)
	vmovdqu .LZERO+32(%rip), %ymm15
	vmovdqu %ymm15, -152(%rbp)
	vmovdqu .LZERO+64(%rip), %ymm15
	vmovdqu %ymm15, -120(%rbp)
	vmovdqu .LZERO+96(%rip), %ymm15
	vmovdqu %ymm15, -88(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -312(%rbp)
	vmovdqu .LZERO+32(%rip), %ymm15
	vmovdqu %ymm15, -280(%rbp)
	vmovdqu .LZERO+64(%rip), %ymm15
	vmovdqu %ymm15, -248(%rbp)
	vmovdqu .LZERO+96(%rip), %ymm15
	vmovdqu %ymm15, -216(%rbp)
	vzeroupper
	movq -3744(%rbp), %rax
	movq (%rax), %r12
	testq %r12, %r12
	je .LB14074
.LB14075:
	vmovdqu (%rdx), %ymm15
	vmovdqu %ymm15, -440(%rbp)
	vmovdqu 32(%rdx), %ymm15
	vmovdqu %ymm15, -408(%rbp)
	vmovdqu 64(%rdx), %ymm15
	vmovdqu %ymm15, -376(%rbp)
	vmovdqu 96(%rdx), %ymm15
	vmovdqu %ymm15, -344(%rbp)
	vzeroupper
	vmovdqu -440(%rbp), %ymm15
	vmovdqu %ymm15, -184(%rbp)
	vmovdqu -408(%rbp), %ymm15
	vmovdqu %ymm15, -152(%rbp)
	vmovdqu -376(%rbp), %ymm15
	vmovdqu %ymm15, -120(%rbp)
	vmovdqu -344(%rbp), %ymm15
	vmovdqu %ymm15, -88(%rbp)
	vzeroupper
	movq -3744(%rbp), %rax
	movsd 56(%rax), %xmm0
	movsd 64(%rax), %xmm1
	movsd 72(%rax), %xmm2
	subsd %xmm1, %xmm0
	subsd %xmm2, %xmm1
	xorps %xmm2, %xmm2
	ucomisd %xmm0, %xmm2
	ja .LB14103
.LB14104:
.LB14105:
	xorps %xmm2, %xmm2
	ucomisd %xmm1, %xmm2
	ja .LB14110
.LB14111:
.LB14112:
	movabsq $4517329193108106637, %r10
	movq %r10, %xmm2
	ucomisd %xmm0, %xmm2
	movabsq $4517329193108106637, %r10
	movq %r10, %xmm0
	seta %al
	ucomisd %xmm1, %xmm0
	movzbl %al, %eax
	seta %cl
	movzbl %cl, %ecx
	movl %eax, %edi
	andl %ecx, %edi
	testb %dil, %dil
	jne .LB14123
.LB14124:
	vmovdqu -440(%rbp), %ymm15
	vmovdqu %ymm15, -568(%rbp)
	vmovdqu -408(%rbp), %ymm15
	vmovdqu %ymm15, -536(%rbp)
	vmovdqu -376(%rbp), %ymm15
	vmovdqu %ymm15, -504(%rbp)
	vmovdqu -344(%rbp), %ymm15
	vmovdqu %ymm15, -472(%rbp)
	vzeroupper
	leaq -568(%rbp), %rcx
	leaq -312(%rbp), %rdx
	callq raycaster__dmat4_normal_mat__2__DMat4E1__DMat4E1_ptr1__ret_voidE1
.LB14125:
	testq %rsi, %rsi
	je .LB14272
.LB14251:
	movl 28(%r12), %eax
	testl %eax, %eax
	jle .LB14272
.LB14259:
	cmpl 8(%rsi), %eax
	jle .LB14271
.LB14272:
	movq $0, -3320(%rbp)
.LB14273:
	movl 8(%r12), %esi
	movq -3312(%rbp), %rcx
	imulq $80, %rsi, %rdx
	callq standard__memory__allocators__stdarena__alloc__2__ArenaE1_ptr1__dataE1_ubits64__ret_voidE1_ptr1
	movq %rax, %r13
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -600(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -632(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -664(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -696(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -728(%rbp)
	vzeroupper
	movslq %esi, %rsi
	movabsq $0, %r10
	movq %r10, -3336(%rbp)
	movabsq $0, %r10
	movq %r10, -3344(%rbp)
	movabsq $0, %r10
	movq %r10, -3352(%rbp)
	movq $0, -3360(%rbp)
	movq %r13, -3368(%rbp)
.LB14306:
	movq -3360(%rbp), %rax
	cmpq %rsi, %rax
	jge .LB14308
.LB14307:
	movq (%r12), %rax
	movq -3360(%rbp), %rcx
	shlq $6, %rcx
	leaq (%rax,%rcx,1), %r14
	movsd (%r14), %xmm0
	movsd %xmm0, -600(%rbp)
	movsd 8(%r14), %xmm0
	movsd %xmm0, -592(%rbp)
	movsd 16(%r14), %xmm0
	movsd %xmm0, -584(%rbp)
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm0
	movsd %xmm0, -576(%rbp)
	vmovdqu -184(%rbp), %ymm15
	vmovdqu %ymm15, -2392(%rbp)
	vmovdqu -152(%rbp), %ymm15
	vmovdqu %ymm15, -2360(%rbp)
	vmovdqu -120(%rbp), %ymm15
	vmovdqu %ymm15, -2328(%rbp)
	vmovdqu -88(%rbp), %ymm15
	vmovdqu %ymm15, -2296(%rbp)
	vzeroupper
	vmovdqu -600(%rbp), %ymm15
	vmovdqu %ymm15, -2424(%rbp)
	vzeroupper
	vmovdqu -2392(%rbp), %ymm15
	vmovdqu %ymm15, -2584(%rbp)
	vmovdqu -2360(%rbp), %ymm15
	vmovdqu %ymm15, -2552(%rbp)
	vmovdqu -2328(%rbp), %ymm15
	vmovdqu %ymm15, -2520(%rbp)
	vmovdqu -2296(%rbp), %ymm15
	vmovdqu %ymm15, -2488(%rbp)
	vzeroupper
	leaq -2584(%rbp), %rdx
	vmovdqu -2424(%rbp), %ymm15
	vmovdqu %ymm15, -2616(%rbp)
	vzeroupper
	leaq -2616(%rbp), %r8
	leaq -2456(%rbp), %rcx
	callq raycaster__dmat4_mul_vec4__2__DMat4E1__DVec4E1__ret_DVec4E1
	vmovdqu -2456(%rbp), %ymm15
	vmovdqu %ymm15, -632(%rbp)
	vzeroupper
	movsd -632(%rbp), %xmm0
	movq -3368(%rbp), %rax
	movsd %xmm0, (%rax)
	movsd -624(%rbp), %xmm0
	movsd %xmm0, 8(%rax)
	movsd -616(%rbp), %xmm0
	movsd %xmm0, 16(%rax)
	movsd 24(%r14), %xmm0
	movsd %xmm0, -664(%rbp)
	movsd 32(%r14), %xmm0
	movsd %xmm0, -656(%rbp)
	movsd 40(%r14), %xmm0
	movsd %xmm0, -648(%rbp)
	xorps %xmm0, %xmm0
	movsd %xmm0, -640(%rbp)
	vmovdqu -312(%rbp), %ymm15
	vmovdqu %ymm15, -2744(%rbp)
	vmovdqu -280(%rbp), %ymm15
	vmovdqu %ymm15, -2712(%rbp)
	vmovdqu -248(%rbp), %ymm15
	vmovdqu %ymm15, -2680(%rbp)
	vmovdqu -216(%rbp), %ymm15
	vmovdqu %ymm15, -2648(%rbp)
	vzeroupper
	vmovdqu -664(%rbp), %ymm15
	vmovdqu %ymm15, -2776(%rbp)
	vzeroupper
	vmovdqu -2744(%rbp), %ymm15
	vmovdqu %ymm15, -2936(%rbp)
	vmovdqu -2712(%rbp), %ymm15
	vmovdqu %ymm15, -2904(%rbp)
	vmovdqu -2680(%rbp), %ymm15
	vmovdqu %ymm15, -2872(%rbp)
	vmovdqu -2648(%rbp), %ymm15
	vmovdqu %ymm15, -2840(%rbp)
	vzeroupper
	leaq -2936(%rbp), %rdx
	vmovdqu -2776(%rbp), %ymm15
	vmovdqu %ymm15, -2968(%rbp)
	vzeroupper
	leaq -2968(%rbp), %r8
	leaq -2808(%rbp), %rcx
	callq raycaster__dmat4_mul_vec4__2__DMat4E1__DVec4E1__ret_DVec4E1
	vmovdqu -2808(%rbp), %ymm15
	vmovdqu %ymm15, -696(%rbp)
	vzeroupper
	testb %dil, %dil
	je .LB14378
.LB14379:
	movq -3336(%rbp), %r10
	movq %r10, -4000(%rbp)
	movq -3344(%rbp), %r10
	movq %r10, -4008(%rbp)
	movq -3352(%rbp), %r10
	movq %r10, -4016(%rbp)
.LB14380:
	movsd -696(%rbp), %xmm0
	movq -3368(%rbp), %rax
	movsd %xmm0, 24(%rax)
	movsd -688(%rbp), %xmm0
	movsd %xmm0, 32(%rax)
	movsd -680(%rbp), %xmm0
	movsd %xmm0, 40(%rax)
	vmovdqu 312(%rbx), %ymm15
	vmovdqu %ymm15, -3096(%rbp)
	vmovdqu 344(%rbx), %ymm15
	vmovdqu %ymm15, -3064(%rbp)
	vmovdqu 376(%rbx), %ymm15
	vmovdqu %ymm15, -3032(%rbp)
	vmovdqu 408(%rbx), %ymm15
	vmovdqu %ymm15, -3000(%rbp)
	vzeroupper
	vmovdqu -3096(%rbp), %ymm15
	vmovdqu %ymm15, -3256(%rbp)
	vmovdqu -3064(%rbp), %ymm15
	vmovdqu %ymm15, -3224(%rbp)
	vmovdqu -3032(%rbp), %ymm15
	vmovdqu %ymm15, -3192(%rbp)
	vmovdqu -3000(%rbp), %ymm15
	vmovdqu %ymm15, -3160(%rbp)
	vzeroupper
	leaq -3256(%rbp), %rdx
	vmovdqu -2456(%rbp), %ymm15
	vmovdqu %ymm15, -3288(%rbp)
	vzeroupper
	leaq -3288(%rbp), %r8
	leaq -3128(%rbp), %rcx
	callq raycaster__dmat4_mul_vec4__2__DMat4E1__DVec4E1__ret_DVec4E1
	vmovdqu -3128(%rbp), %ymm15
	vmovdqu %ymm15, -728(%rbp)
	vzeroupper
	movsd -728(%rbp), %xmm0
	movq -3368(%rbp), %rax
	movsd %xmm0, 48(%rax)
	movsd -720(%rbp), %xmm0
	movsd %xmm0, 56(%rax)
	movsd -712(%rbp), %xmm0
	movsd %xmm0, 64(%rax)
	movsd -704(%rbp), %xmm0
	movsd %xmm0, 72(%rax)
	movq -3360(%rbp), %rax
	movq -3368(%rbp), %rcx
	incq %rax
	leaq 80(%rcx), %rcx
	movq -4000(%rbp), %r10
	movq %r10, -3336(%rbp)
	movq -4008(%rbp), %r10
	movq %r10, -3344(%rbp)
	movq -4016(%rbp), %r10
	movq %r10, -3352(%rbp)
	movq %rax, -3360(%rbp)
	movq %rcx, -3368(%rbp)
	jmp .LB14306
.LB14103:
	xorps %xmm2, %xmm2
	movaps %xmm0, %xmm15
	movaps %xmm2, %xmm0
	subsd %xmm15, %xmm0
	jmp .LB14105
.LB14110:
	xorps %xmm2, %xmm2
	movaps %xmm1, %xmm15
	movaps %xmm2, %xmm1
	subsd %xmm15, %xmm1
	jmp .LB14112
.LB14123:
	movq -3744(%rbp), %rax
	movsd 56(%rax), %xmm0
	movabsq $4517329193108106637, %r10
	movq %r10, %xmm1
	ucomisd %xmm1, %xmm0
	ja .LB14134
.LB14135:
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm0
.LB14136:
	movq -3744(%rbp), %rax
	movsd 64(%rax), %xmm1
	movabsq $4517329193108106637, %r10
	movq %r10, %xmm2
	ucomisd %xmm2, %xmm1
	ja .LB14148
.LB14149:
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm1
.LB14150:
	movq -3744(%rbp), %rax
	movsd 72(%rax), %xmm2
	movabsq $4517329193108106637, %r10
	movq %r10, %xmm3
	ucomisd %xmm3, %xmm2
	ja .LB14162
.LB14163:
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm2
.LB14164:
	movsd -184(%rbp), %xmm3
	mulsd %xmm0, %xmm3
	movsd %xmm3, -312(%rbp)
	movsd -176(%rbp), %xmm3
	mulsd %xmm0, %xmm3
	movsd %xmm3, -304(%rbp)
	movsd -168(%rbp), %xmm3
	mulsd %xmm3, %xmm0
	movsd %xmm0, -296(%rbp)
	movsd -152(%rbp), %xmm0
	mulsd %xmm1, %xmm0
	movsd %xmm0, -280(%rbp)
	movsd -144(%rbp), %xmm0
	mulsd %xmm1, %xmm0
	movsd %xmm0, -272(%rbp)
	movsd -136(%rbp), %xmm0
	mulsd %xmm1, %xmm0
	movsd %xmm0, -264(%rbp)
	movsd -120(%rbp), %xmm0
	mulsd %xmm2, %xmm0
	movsd %xmm0, -248(%rbp)
	movsd -112(%rbp), %xmm0
	mulsd %xmm2, %xmm0
	movsd %xmm0, -240(%rbp)
	movsd -104(%rbp), %xmm0
	mulsd %xmm2, %xmm0
	movsd %xmm0, -232(%rbp)
	xorps %xmm0, %xmm0
	movsd %xmm0, -288(%rbp)
	xorps %xmm0, %xmm0
	movsd %xmm0, -256(%rbp)
	xorps %xmm0, %xmm0
	movsd %xmm0, -224(%rbp)
	xorps %xmm0, %xmm0
	movsd %xmm0, -216(%rbp)
	xorps %xmm0, %xmm0
	movsd %xmm0, -208(%rbp)
	xorps %xmm0, %xmm0
	movsd %xmm0, -200(%rbp)
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm0
	movsd %xmm0, -192(%rbp)
	jmp .LB14125
.LB14134:
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	divsd %xmm15, %xmm0
	jmp .LB14136
.LB14148:
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm2
	movaps %xmm1, %xmm15
	movaps %xmm2, %xmm1
	divsd %xmm15, %xmm1
	jmp .LB14150
.LB14162:
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm3
	movaps %xmm2, %xmm15
	movaps %xmm3, %xmm2
	divsd %xmm15, %xmm2
	jmp .LB14164
.LB14271:
	decl %eax
	movq (%rsi), %rcx
	movslq %eax, %rax
	imulq $212, %rax, %rax
	leaq (%rcx,%rax,1), %rax
	movq %rax, -3320(%rbp)
	jmp .LB14273
.LB14308:
	movslq 16(%rbx), %rax
	xorps %xmm0, %xmm0
	cvtsi2sdq %rax, %xmm0
	movabsq $4602678819172646912, %r10
	movq %r10, %xmm1
	mulsd %xmm1, %xmm0
	movsd %xmm0, -3376(%rbp)
	movslq 20(%rbx), %rax
	xorps %xmm0, %xmm0
	cvtsi2sdq %rax, %xmm0
	movabsq $4602678819172646912, %r10
	movq %r10, %xmm1
	mulsd %xmm1, %xmm0
	movsd %xmm0, -3384(%rbp)
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -760(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -792(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -824(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -856(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -888(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -920(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -952(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -984(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -1016(%rbp)
	vzeroupper
	leaq .LZERO(%rip), %rsi
	leaq -1328(%rbp), %rdi
	movl $312, %ecx
	rep movsb
	leaq .LZERO(%rip), %rsi
	leaq -2264(%rbp), %rdi
	movl $936, %ecx
	rep movsb
	xorl %esi, %esi
	movq $0, -3512(%rbp)
	movq $0, -3520(%rbp)
	movq $0, -3392(%rbp)
	movq $0, -3400(%rbp)
	movq $0, -3408(%rbp)
	movabsq $0, %r10
	movq %r10, -3416(%rbp)
	movabsq $0, %r10
	movq %r10, -3424(%rbp)
	movabsq $0, %r10
	movq %r10, -3432(%rbp)
	movabsq $0, %r10
	movq %r10, -3440(%rbp)
	movabsq $0, %r10
	movq %r10, -3448(%rbp)
	movabsq $0, %r10
	movq %r10, -3456(%rbp)
	movabsq $0, %r10
	movq %r10, -3464(%rbp)
	movabsq $0, %r10
	movq %r10, -3472(%rbp)
	movabsq $0, %r10
	movq %r10, -3480(%rbp)
	movabsq $0, %r10
	movq %r10, -3488(%rbp)
	movabsq $0, %r10
	movq %r10, -3496(%rbp)
	movabsq $0, %r10
	movq %r10, -3504(%rbp)
	movabsq $0, %r10
	movq %r10, -3536(%rbp)
	movabsq $0, %r10
	movq %r10, -3544(%rbp)
	movabsq $0, %r10
	movq %r10, -3552(%rbp)
.LB14552:
	cmpl 24(%r12), %esi
	jge .LB14554
.LB14553:
	movslq %esi, %rcx
	movq 16(%r12), %rax
	leaq (%rcx,%rcx,2), %rcx
	leaq (%rax,%rcx,4), %rax
	movl (%rax), %ecx
	movl 4(%rax), %edx
	movl 8(%rax), %eax
	movq (%r12), %rdi
	movslq %ecx, %r8
	movslq %edx, %r9
	movslq %eax, %r14
	movslq %ecx, %rcx
	shlq $6, %r8
	shlq $6, %r9
	shlq $6, %r14
	imulq $80, %rcx, %rcx
	movslq %edx, %rdx
	movslq %eax, %rax
	leaq (%rdi,%r8,1), %r8
	leaq (%rdi,%r9,1), %r9
	imulq $80, %rdx, %rdx
	imulq $80, %rax, %rax
	leaq (%rdi,%r14,1), %rdi
	leaq (%r13,%rcx,1), %rcx
	leaq (%r13,%rdx,1), %rdx
	leaq (%r13,%rax,1), %rax
	movsd (%rcx), %xmm0
	movsd %xmm0, -760(%rbp)
	movsd 8(%rcx), %xmm0
	movsd %xmm0, -752(%rbp)
	movsd 16(%rcx), %xmm0
	movsd %xmm0, -744(%rbp)
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm0
	movsd %xmm0, -736(%rbp)
	movsd (%rdx), %xmm0
	movsd %xmm0, -792(%rbp)
	movsd 8(%rdx), %xmm0
	movsd %xmm0, -784(%rbp)
	movsd 16(%rdx), %xmm0
	movsd %xmm0, -776(%rbp)
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm0
	movsd %xmm0, -768(%rbp)
	movsd (%rax), %xmm0
	movsd %xmm0, -824(%rbp)
	movsd 8(%rax), %xmm0
	movsd %xmm0, -816(%rbp)
	movsd 16(%rax), %xmm0
	movsd %xmm0, -808(%rbp)
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm0
	movsd %xmm0, -800(%rbp)
	movsd 48(%rcx), %xmm0
	movsd %xmm0, -856(%rbp)
	movsd 56(%rcx), %xmm0
	movsd %xmm0, -848(%rbp)
	movsd 64(%rcx), %xmm0
	movsd %xmm0, -840(%rbp)
	movsd 72(%rcx), %xmm0
	movsd %xmm0, -832(%rbp)
	movsd 48(%rdx), %xmm0
	movsd %xmm0, -888(%rbp)
	movsd 56(%rdx), %xmm0
	movsd %xmm0, -880(%rbp)
	movsd 64(%rdx), %xmm0
	movsd %xmm0, -872(%rbp)
	movsd 72(%rdx), %xmm0
	movsd %xmm0, -864(%rbp)
	movsd 48(%rax), %xmm0
	movsd %xmm0, -920(%rbp)
	movsd 56(%rax), %xmm0
	movsd %xmm0, -912(%rbp)
	movsd 64(%rax), %xmm0
	movsd %xmm0, -904(%rbp)
	movsd 72(%rax), %xmm0
	movsd %xmm0, -896(%rbp)
	movsd 24(%rcx), %xmm0
	movsd %xmm0, -952(%rbp)
	movsd 32(%rcx), %xmm0
	movsd %xmm0, -944(%rbp)
	movsd 40(%rcx), %xmm0
	movsd %xmm0, -936(%rbp)
	xorps %xmm0, %xmm0
	movsd %xmm0, -928(%rbp)
	movsd 24(%rdx), %xmm0
	movsd %xmm0, -984(%rbp)
	movsd 32(%rdx), %xmm0
	movsd %xmm0, -976(%rbp)
	movsd 40(%rdx), %xmm0
	movsd %xmm0, -968(%rbp)
	xorps %xmm0, %xmm0
	movsd %xmm0, -960(%rbp)
	movsd 24(%rax), %xmm0
	movsd %xmm0, -1016(%rbp)
	movsd 32(%rax), %xmm0
	movsd %xmm0, -1008(%rbp)
	movsd 40(%rax), %xmm0
	movsd %xmm0, -1000(%rbp)
	xorps %xmm0, %xmm0
	movsd %xmm0, -992(%rbp)
	movsd -792(%rbp), %xmm0
	movsd -760(%rbp), %xmm1
	subsd %xmm1, %xmm0
	movsd %xmm0, -4024(%rbp)
	movsd -784(%rbp), %xmm0
	movsd -752(%rbp), %xmm2
	subsd %xmm2, %xmm0
	movsd %xmm0, -4032(%rbp)
	movsd -776(%rbp), %xmm0
	movsd -744(%rbp), %xmm3
	subsd %xmm3, %xmm0
	movsd %xmm0, -4048(%rbp)
	movsd -824(%rbp), %xmm0
	movsd %xmm0, -3560(%rbp)
	subsd %xmm1, %xmm0
	movsd %xmm0, -3568(%rbp)
	movsd -816(%rbp), %xmm0
	movsd %xmm0, -3576(%rbp)
	subsd %xmm2, %xmm0
	movsd %xmm0, -3584(%rbp)
	movsd -808(%rbp), %xmm4
	movsd %xmm4, -3592(%rbp)
	subsd %xmm3, %xmm4
	movsd %xmm4, -3600(%rbp)
	movsd -4048(%rbp), %xmm5
	mulsd %xmm5, %xmm0
	movsd %xmm0, -3608(%rbp)
	movsd -4032(%rbp), %xmm5
	vfmsub231sd %xmm5, %xmm4, %xmm0
	movsd %xmm0, -3616(%rbp)
	movsd -4024(%rbp), %xmm0
	mulsd %xmm4, %xmm0
	movsd %xmm0, -3624(%rbp)
	movsd -3568(%rbp), %xmm4
	movsd -4048(%rbp), %xmm5
	vfmsub231sd %xmm5, %xmm4, %xmm0
	movsd %xmm0, -3632(%rbp)
	movsd -4032(%rbp), %xmm0
	mulsd %xmm4, %xmm0
	movsd -3584(%rbp), %xmm4
	movsd -4024(%rbp), %xmm5
	vfmsub132sd %xmm5, %xmm0, %xmm4
	movsd 512(%rbx), %xmm0
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subsd %xmm15, %xmm0
	movsd 520(%rbx), %xmm1
	movaps %xmm1, %xmm15
	movaps %xmm2, %xmm1
	subsd %xmm15, %xmm1
	movsd 528(%rbx), %xmm2
	movaps %xmm2, %xmm15
	movaps %xmm3, %xmm2
	subsd %xmm15, %xmm2
	movsd -3632(%rbp), %xmm3
	mulsd %xmm3, %xmm1
	movsd -3616(%rbp), %xmm3
	vfmadd132sd %xmm3, %xmm1, %xmm0
	vfmadd231sd %xmm4, %xmm2, %xmm0
	xorps %xmm1, %xmm1
	ucomisd %xmm1, %xmm0
	jae .LB14898
.LB14899:
	movsd -3632(%rbp), %xmm0
	movsd -3616(%rbp), %xmm1
	mulsd %xmm0, %xmm0
	vfmadd231sd %xmm1, %xmm1, %xmm0
	vfmadd231sd %xmm4, %xmm4, %xmm0
	movsd %xmm0, -3640(%rbp)
	movaps %xmm0, %xmm1
	sqrtsd %xmm1, %xmm0
	movabsq $4517329193108106637, %r10
	movq %r10, %xmm1
	movsd %xmm0, -3648(%rbp)
	ucomisd %xmm1, %xmm0
	ja .LB14917
.LB14918:
	movq -3616(%rbp), %r10
	movq %r10, -3656(%rbp)
	movq -3632(%rbp), %r10
	movq %r10, -3664(%rbp)
	movsd %xmm4, -3672(%rbp)
.LB14919:
	movsd -856(%rbp), %xmm0
	movsd %xmm0, -1328(%rbp)
	movsd -848(%rbp), %xmm0
	movsd %xmm0, -1320(%rbp)
	movsd -840(%rbp), %xmm0
	movsd %xmm0, -1312(%rbp)
	movsd -832(%rbp), %xmm0
	movsd %xmm0, -1304(%rbp)
	movsd -952(%rbp), %xmm1
	movsd %xmm1, -1296(%rbp)
	movsd -944(%rbp), %xmm1
	movsd %xmm1, -1288(%rbp)
	movsd -936(%rbp), %xmm1
	movsd %xmm1, -1280(%rbp)
	movsd 48(%r8), %xmm1
	movsd %xmm1, -1272(%rbp)
	movsd 56(%r8), %xmm1
	movsd %xmm1, -1264(%rbp)
	movsd (%rcx), %xmm1
	movsd %xmm1, -1248(%rbp)
	movsd 8(%rcx), %xmm1
	movsd %xmm1, -1240(%rbp)
	movsd 16(%rcx), %xmm1
	movsd %xmm1, -1232(%rbp)
	movsd 24(%rbx), %xmm1
	ucomisd %xmm1, %xmm0
	ja .LB15010
.LB15011:
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm0
	divsd %xmm1, %xmm0
.LB15012:
	movsd %xmm0, -1256(%rbp)
	movsd -888(%rbp), %xmm0
	movsd %xmm0, -1224(%rbp)
	movsd -880(%rbp), %xmm0
	movsd %xmm0, -1216(%rbp)
	movsd -872(%rbp), %xmm0
	movsd %xmm0, -1208(%rbp)
	movsd -864(%rbp), %xmm0
	movsd %xmm0, -1200(%rbp)
	movsd -984(%rbp), %xmm1
	movsd %xmm1, -1192(%rbp)
	movsd -976(%rbp), %xmm1
	movsd %xmm1, -1184(%rbp)
	movsd -968(%rbp), %xmm1
	movsd %xmm1, -1176(%rbp)
	movsd 48(%r9), %xmm1
	movsd %xmm1, -1168(%rbp)
	movsd 56(%r9), %xmm1
	movsd %xmm1, -1160(%rbp)
	movsd (%rdx), %xmm1
	movsd %xmm1, -1144(%rbp)
	movsd 8(%rdx), %xmm1
	movsd %xmm1, -1136(%rbp)
	movsd 16(%rdx), %xmm1
	movsd %xmm1, -1128(%rbp)
	movsd 24(%rbx), %xmm1
	ucomisd %xmm1, %xmm0
	ja .LB15107
.LB15108:
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm0
	divsd %xmm1, %xmm0
.LB15109:
	movsd %xmm0, -1152(%rbp)
	movsd -920(%rbp), %xmm0
	movsd %xmm0, -1120(%rbp)
	movsd -912(%rbp), %xmm0
	movsd %xmm0, -1112(%rbp)
	movsd -904(%rbp), %xmm0
	movsd %xmm0, -1104(%rbp)
	movsd -896(%rbp), %xmm0
	movsd %xmm0, -1096(%rbp)
	movsd -1016(%rbp), %xmm1
	movsd %xmm1, -1088(%rbp)
	movsd -1008(%rbp), %xmm1
	movsd %xmm1, -1080(%rbp)
	movsd -1000(%rbp), %xmm1
	movsd %xmm1, -1072(%rbp)
	movsd 48(%rdi), %xmm1
	movsd %xmm1, -1064(%rbp)
	movsd 56(%rdi), %xmm1
	movsd %xmm1, -1056(%rbp)
	movsd (%rax), %xmm1
	movsd %xmm1, -1040(%rbp)
	movsd 8(%rax), %xmm1
	movsd %xmm1, -1032(%rbp)
	movsd 16(%rax), %xmm1
	movsd %xmm1, -1024(%rbp)
	movsd 24(%rbx), %xmm1
	ucomisd %xmm1, %xmm0
	ja .LB15204
.LB15205:
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm0
	divsd %xmm1, %xmm0
.LB15206:
	movsd %xmm0, -1048(%rbp)
	leaq -1328(%rbp), %rcx
	movsd 24(%rbx), %xmm0
	leaq -2264(%rbp), %r9
	movl $3, %edx
	movaps %xmm0, %xmm2
	callq raycaster__r3d_clip_frustum__4__R3DClipVertE1_ptr1__dataE1_sbits32__doubleE1__R3DClipVertE1_ptr1__ret_dataE1_sbits32
	movq %rax, -3752(%rbp)
	cmpl $3, %eax
	jl .LB15229
.LB15230:
	movq -3752(%rbp), %rax
	decl %eax
	movq %rax, -3736(%rbp)
	movq $1, -3680(%rbp)
	movq -3392(%rbp), %rax
	movq -3400(%rbp), %rcx
	movq -3408(%rbp), %rdx
	movsd -3416(%rbp), %xmm0
	movsd -3424(%rbp), %xmm1
	movsd -3432(%rbp), %xmm2
	movsd -3440(%rbp), %xmm3
	movsd -3448(%rbp), %xmm4
	movsd -3456(%rbp), %xmm5
	movq -3464(%rbp), %r10
	movq %r10, -3688(%rbp)
	movq -3472(%rbp), %r10
	movq %r10, -3696(%rbp)
	movq -3480(%rbp), %r10
	movq %r10, -3704(%rbp)
	movq -3488(%rbp), %r10
	movq %r10, -3712(%rbp)
	movq -3496(%rbp), %r10
	movq %r10, -3720(%rbp)
	movq -3504(%rbp), %r10
	movq %r10, -3728(%rbp)
.LB15234:
	movq -3680(%rbp), %rdi
	movq -3736(%rbp), %r8
	cmpl %r8d, %edi
	jge .LB15236
.LB15235:
	movq -3680(%rbp), %rax
	leaq -2264(%rbp), %rdi
	movslq %eax, %rcx
	imulq $104, %rcx, %rcx
	incl %eax
	movsd 24(%rdi), %xmm0
	movsd 24(%rbx), %xmm1
	movslq %eax, %rax
	imulq $104, %rax, %rax
	leaq -2264(%rbp,%rcx,1), %r14
	leaq -2264(%rbp,%rax,1), %r15
	ucomisd %xmm1, %xmm0
	ja .LB15256
.LB15257:
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm0
	divsd %xmm1, %xmm0
	movsd %xmm0, -3760(%rbp)
.LB15258:
	movsd 24(%r14), %xmm0
	movsd 24(%rbx), %xmm1
	ucomisd %xmm1, %xmm0
	ja .LB15279
.LB15280:
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm0
	divsd %xmm1, %xmm0
	movsd %xmm0, -3768(%rbp)
.LB15281:
	movsd 24(%r15), %xmm0
	movsd 24(%rbx), %xmm1
	ucomisd %xmm1, %xmm0
	ja .LB15302
.LB15303:
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm0
	divsd %xmm1, %xmm0
	movsd %xmm0, -3776(%rbp)
.LB15304:
	movsd (%rdi), %xmm0
	movsd -3760(%rbp), %xmm2
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm1
	vfmadd132sd %xmm2, %xmm1, %xmm0
	movsd -3376(%rbp), %xmm1
	mulsd %xmm1, %xmm0
	xorps %xmm1, %xmm1
	movsd %xmm0, -3784(%rbp)
	movsd 8(%rdi), %xmm0
	movsd -3760(%rbp), %xmm2
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subsd %xmm15, %xmm0
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm1
	vfmadd132sd %xmm2, %xmm1, %xmm0
	movsd -3384(%rbp), %xmm1
	mulsd %xmm1, %xmm0
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm1
	movsd %xmm0, -3792(%rbp)
	movsd 16(%rdi), %xmm0
	mulsd %xmm2, %xmm0
	movsd %xmm0, -3800(%rbp)
	movsd (%r14), %xmm0
	movsd -3768(%rbp), %xmm2
	vfmadd132sd %xmm2, %xmm1, %xmm0
	movsd -3376(%rbp), %xmm1
	mulsd %xmm1, %xmm0
	xorps %xmm1, %xmm1
	movsd %xmm0, -3808(%rbp)
	movsd 8(%r14), %xmm0
	movsd -3768(%rbp), %xmm2
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subsd %xmm15, %xmm0
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm1
	vfmadd132sd %xmm2, %xmm1, %xmm0
	movsd -3384(%rbp), %xmm1
	mulsd %xmm1, %xmm0
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm1
	movsd %xmm0, -3816(%rbp)
	movsd 16(%r14), %xmm0
	mulsd %xmm2, %xmm0
	movsd %xmm0, -3824(%rbp)
	movsd (%r15), %xmm0
	movsd -3776(%rbp), %xmm2
	vfmadd132sd %xmm2, %xmm1, %xmm0
	movsd -3376(%rbp), %xmm1
	mulsd %xmm1, %xmm0
	xorps %xmm1, %xmm1
	movsd %xmm0, -3832(%rbp)
	movsd 8(%r15), %xmm0
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subsd %xmm15, %xmm0
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm1
	movsd -3776(%rbp), %xmm2
	vfmadd132sd %xmm2, %xmm1, %xmm0
	movsd -3384(%rbp), %xmm1
	mulsd %xmm1, %xmm0
	movsd %xmm0, -3840(%rbp)
	movsd 16(%r15), %xmm0
	mulsd %xmm2, %xmm0
	movsd %xmm0, -3848(%rbp)
	movl 16(%rbx), %ecx
	movl 20(%rbx), %edx
	movsd 56(%rdi), %xmm0
	movsd %xmm0, -4040(%rbp)
	movsd 64(%rdi), %xmm0
	movsd 32(%rdi), %xmm1
	movsd 40(%rdi), %xmm2
	movsd 48(%rdi), %xmm3
	movsd 56(%r14), %xmm4
	movsd 64(%r14), %xmm5
	movsd %xmm5, -3856(%rbp)
	movsd 32(%r14), %xmm5
	movsd %xmm5, -3864(%rbp)
	movsd 40(%r14), %xmm5
	movsd %xmm5, -3872(%rbp)
	movsd 48(%r14), %xmm5
	movsd %xmm5, -3880(%rbp)
	movsd 56(%r15), %xmm5
	movsd %xmm5, -3888(%rbp)
	movsd 64(%r15), %xmm5
	movsd %xmm5, -3896(%rbp)
	movsd 32(%r15), %xmm5
	movsd %xmm5, -3904(%rbp)
	movsd 40(%r15), %xmm5
	movsd %xmm5, -3912(%rbp)
	movsd 48(%r15), %xmm5
	movsd %xmm5, -3920(%rbp)
	movq -3744(%rbp), %rax
	movq 84(%rax), %r8
	movl 80(%rax), %eax
	movsd 80(%rdi), %xmm5
	movsd %xmm5, -3928(%rbp)
	movsd 88(%rdi), %xmm5
	movsd %xmm5, -3936(%rbp)
	movsd 96(%rdi), %xmm5
	movsd %xmm5, -3944(%rbp)
	movsd 80(%r14), %xmm5
	movsd %xmm5, -3952(%rbp)
	movsd 88(%r14), %xmm5
	movsd %xmm5, -3960(%rbp)
	movsd 96(%r14), %xmm5
	movsd %xmm5, -3968(%rbp)
	movsd 80(%r15), %xmm5
	movsd %xmm5, -3976(%rbp)
	movsd 88(%r15), %xmm5
	movsd %xmm5, -3984(%rbp)
	movsd 96(%r15), %xmm5
	movsd %xmm5, -3992(%rbp)
	movsd -3800(%rbp), %xmm5
	movsd %xmm5, 32(%rsp)
	movsd -3760(%rbp), %xmm5
	movsd %xmm5, 40(%rsp)
	movsd -4040(%rbp), %xmm5
	movsd %xmm5, 48(%rsp)
	movsd %xmm0, 56(%rsp)
	movsd %xmm1, 64(%rsp)
	movsd %xmm2, 72(%rsp)
	movsd %xmm3, 80(%rsp)
	movsd -3808(%rbp), %xmm0
	movsd %xmm0, 88(%rsp)
	movsd -3816(%rbp), %xmm0
	movsd %xmm0, 96(%rsp)
	movsd -3824(%rbp), %xmm0
	movsd %xmm0, 104(%rsp)
	movsd -3768(%rbp), %xmm0
	movsd %xmm0, 112(%rsp)
	movsd %xmm4, 120(%rsp)
	movsd -3856(%rbp), %xmm0
	movsd %xmm0, 128(%rsp)
	movsd -3864(%rbp), %xmm0
	movsd %xmm0, 136(%rsp)
	movsd -3872(%rbp), %xmm0
	movsd %xmm0, 144(%rsp)
	movsd -3880(%rbp), %xmm0
	movsd %xmm0, 152(%rsp)
	movsd -3832(%rbp), %xmm0
	movsd %xmm0, 160(%rsp)
	movsd -3840(%rbp), %xmm0
	movsd %xmm0, 168(%rsp)
	movsd -3848(%rbp), %xmm0
	movsd %xmm0, 176(%rsp)
	movsd -3776(%rbp), %xmm0
	movsd %xmm0, 184(%rsp)
	movsd -3888(%rbp), %xmm0
	movsd %xmm0, 192(%rsp)
	movsd -3896(%rbp), %xmm0
	movsd %xmm0, 200(%rsp)
	movsd -3904(%rbp), %xmm0
	movsd %xmm0, 208(%rsp)
	movsd -3912(%rbp), %xmm0
	movsd %xmm0, 216(%rsp)
	movsd -3920(%rbp), %xmm0
	movsd %xmm0, 224(%rsp)
	movq -3320(%rbp), %r9
	movq %r9, 232(%rsp)
	movq %r8, 240(%rsp)
	movq %rax, 248(%rsp)
	movsd -3656(%rbp), %xmm0
	movsd %xmm0, 256(%rsp)
	movsd -3664(%rbp), %xmm0
	movsd %xmm0, 264(%rsp)
	movsd -3672(%rbp), %xmm0
	movsd %xmm0, 272(%rsp)
	movsd -3928(%rbp), %xmm0
	movsd %xmm0, 280(%rsp)
	movsd -3936(%rbp), %xmm0
	movsd %xmm0, 288(%rsp)
	movsd -3944(%rbp), %xmm0
	movsd %xmm0, 296(%rsp)
	movsd -3952(%rbp), %xmm0
	movsd %xmm0, 304(%rsp)
	movsd -3960(%rbp), %xmm0
	movsd %xmm0, 312(%rsp)
	movsd -3968(%rbp), %xmm0
	movsd %xmm0, 320(%rsp)
	movsd -3976(%rbp), %xmm0
	movsd %xmm0, 328(%rsp)
	movsd -3984(%rbp), %xmm0
	movsd %xmm0, 336(%rsp)
	movsd -3992(%rbp), %xmm0
	movsd %xmm0, 344(%rsp)
	movq -3304(%rbp), %rax
	movq %rax, 352(%rsp)
	movq -3328(%rbp), %rax
	movq %rax, 360(%rsp)
	movq -3528(%rbp), %rax
	movq %rax, 368(%rsp)
	movq -3296(%rbp), %rax
	movq %rax, 376(%rsp)
	movsd -3784(%rbp), %xmm0
	movaps %xmm0, %xmm2
	movsd -3792(%rbp), %xmm0
	movaps %xmm0, %xmm3
	callq raycaster__r3d_draw_triangle__48__dataE1_sbits32__dataE1_sbits32__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__RCTextureE1_ptr1__dataE1_ubits64__dataE1_sbits32__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1_ptr1__R3DGBufPixelE1_ptr1__dataE1_sbits32__dataE1_sbits32__ret_voidE1
	movq -3680(%rbp), %rax
	incl %eax
	movq %rax, -3680(%rbp)
	movq %rdi, %rax
	movq %r14, %rcx
	movq %r15, %rdx
	movsd -3760(%rbp), %xmm0
	movsd -3768(%rbp), %xmm1
	movsd -3776(%rbp), %xmm2
	movsd -3784(%rbp), %xmm3
	movsd -3792(%rbp), %xmm4
	movsd -3800(%rbp), %xmm5
	movq -3808(%rbp), %r10
	movq %r10, -3688(%rbp)
	movq -3816(%rbp), %r10
	movq %r10, -3696(%rbp)
	movq -3824(%rbp), %r10
	movq %r10, -3704(%rbp)
	movq -3832(%rbp), %r10
	movq %r10, -3712(%rbp)
	movq -3840(%rbp), %r10
	movq %r10, -3720(%rbp)
	movq -3848(%rbp), %r10
	movq %r10, -3728(%rbp)
	jmp .LB15234
.LB14554:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB14917:
	movsd -3616(%rbp), %xmm0
	movsd -3648(%rbp), %xmm1
	movsd -3632(%rbp), %xmm2
	divsd %xmm1, %xmm0
	divsd %xmm1, %xmm2
	movaps %xmm1, %xmm15
	movaps %xmm4, %xmm1
	divsd %xmm15, %xmm1
	movsd %xmm0, -3656(%rbp)
	movsd %xmm2, -3664(%rbp)
	movsd %xmm1, -3672(%rbp)
	jmp .LB14919
.LB15010:
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	divsd %xmm15, %xmm0
	jmp .LB15012
.LB15107:
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	divsd %xmm15, %xmm0
	jmp .LB15109
.LB15204:
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	divsd %xmm15, %xmm0
	jmp .LB15206
.LB15236:
	incl %esi
	movq -3752(%rbp), %r10
	movq %r10, -3512(%rbp)
	movq -3680(%rbp), %r10
	movq %r10, -3520(%rbp)
	movq %rax, -3392(%rbp)
	movq %rcx, -3400(%rbp)
	movq %rdx, -3408(%rbp)
	movsd %xmm0, -3416(%rbp)
	movsd %xmm1, -3424(%rbp)
	movsd %xmm2, -3432(%rbp)
	movsd %xmm3, -3440(%rbp)
	movsd %xmm4, -3448(%rbp)
	movsd %xmm5, -3456(%rbp)
	movq -3688(%rbp), %r10
	movq %r10, -3464(%rbp)
	movq -3696(%rbp), %r10
	movq %r10, -3472(%rbp)
	movq -3704(%rbp), %r10
	movq %r10, -3480(%rbp)
	movq -3712(%rbp), %r10
	movq %r10, -3488(%rbp)
	movq -3720(%rbp), %r10
	movq %r10, -3496(%rbp)
	movq -3728(%rbp), %r10
	movq %r10, -3504(%rbp)
	movq -3648(%rbp), %r10
	movq %r10, -3536(%rbp)
	movq -3640(%rbp), %r10
	movq %r10, -3544(%rbp)
	movq -3648(%rbp), %r10
	movq %r10, -3552(%rbp)
	cmpl 24(%r12), %esi
	jl .LB14553
	jmp .LB14554
.LB15256:
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	divsd %xmm15, %xmm0
	movsd %xmm0, -3760(%rbp)
	jmp .LB15258
.LB15279:
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	divsd %xmm15, %xmm0
	movsd %xmm0, -3768(%rbp)
	jmp .LB15281
.LB15302:
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	divsd %xmm15, %xmm0
	movsd %xmm0, -3776(%rbp)
	jmp .LB15304
.LB15229:
	incl %esi
	movq -3752(%rbp), %r10
	movq %r10, -3512(%rbp)
	movq -3648(%rbp), %r10
	movq %r10, -3536(%rbp)
	movq -3640(%rbp), %r10
	movq %r10, -3544(%rbp)
	movq -3648(%rbp), %r10
	movq %r10, -3552(%rbp)
	cmpl 24(%r12), %esi
	jl .LB14553
	jmp .LB14554
.LB14898:
	incl %esi
	cmpl 24(%r12), %esi
	jl .LB14553
	jmp .LB14554
.LB14378:
	movsd -696(%rbp), %xmm2
	movsd -688(%rbp), %xmm0
	movsd -680(%rbp), %xmm1
	mulsd %xmm0, %xmm0
	vfmadd231sd %xmm2, %xmm2, %xmm0
	movaps %xmm0, %xmm3
	vfmadd231sd %xmm1, %xmm1, %xmm3
	movaps %xmm3, %xmm1
	sqrtsd %xmm1, %xmm0
	movabsq $4517329193108106637, %r10
	movq %r10, %xmm1
	ucomisd %xmm1, %xmm0
	ja .LB14413
.LB14415:
	movsd %xmm0, -4000(%rbp)
	movsd %xmm3, -4008(%rbp)
	movsd %xmm0, -4016(%rbp)
	jmp .LB14380
.LB14413:
	movaps %xmm2, %xmm1
	divsd %xmm0, %xmm1
	movsd %xmm1, -696(%rbp)
	movsd -688(%rbp), %xmm1
	divsd %xmm0, %xmm1
	movsd %xmm1, -688(%rbp)
	movsd -680(%rbp), %xmm1
	divsd %xmm0, %xmm1
	movsd %xmm1, -680(%rbp)
	jmp .LB14415
.LB14074:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
	.text
	.globl raycaster__r3d_sprite_sort__3__R3DSpriteE1_ptr1__dataE1_sbits32__R3DCameraE1_ptr1__ret_dataE1_ptr1_sbits32
	.def raycaster__r3d_sprite_sort__3__R3DSpriteE1_ptr1__dataE1_sbits32__R3DCameraE1_ptr1__ret_dataE1_ptr1_sbits32;
	.scl 2;
	.type 32;
	.endef
raycaster__r3d_sprite_sort__3__R3DSpriteE1_ptr1__dataE1_sbits32__R3DCameraE1_ptr1__ret_dataE1_ptr1_sbits32:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
.LB15529:
	movq %rcx, %rsi
	movl %edx, %edi
	movslq %edi, %rax
	xorl %ecx, %ecx
	movq %rsi, %rdx
.LB15539:
	cmpq %rax, %rcx
	jge .LB15541
.LB15540:
	movsd (%rdx), %xmm0
	movsd 512(%r8), %xmm1
	incq %rcx
	subsd %xmm1, %xmm0
	movsd 8(%rdx), %xmm1
	movsd 520(%r8), %xmm2
	subsd %xmm2, %xmm1
	movsd 16(%rdx), %xmm2
	movsd 528(%r8), %xmm3
	mulsd %xmm1, %xmm1
	subsd %xmm3, %xmm2
	vfmadd132sd %xmm0, %xmm1, %xmm0
	vfmadd231sd %xmm2, %xmm2, %xmm0
	movsd %xmm0, 64(%rdx)
	leaq 72(%rdx), %rdx
	cmpq %rax, %rcx
	jl .LB15540
.LB15541:
	movl %edi, %eax
	shll $2, %eax
	movl %eax, %ecx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	xorl %ecx, %ecx
	testl %edi, %edi
	cmovg %edi, %ecx
	shrl $2, %ecx
	xorl %edx, %edx
.LB25162:
	testl %ecx, %ecx
	je .LB25164
.LB25163:
	movslq %edx, %r8
	movl %edx, (%rax,%r8,4)
	leal 1(%rdx), %r8d
	movslq %r8d, %r9
	movl %r8d, (%rax,%r9,4)
	leal 2(%rdx), %r8d
	movslq %r8d, %r9
	movl %r8d, (%rax,%r9,4)
	leal 3(%rdx), %r8d
	movslq %r8d, %r9
	movl %r8d, (%rax,%r9,4)
	addl $4, %edx
	decl %ecx
	jne .LB25163
.LB25164:
.LB15608:
	cmpl %edi, %edx
	jge .LB15610
.LB15609:
	movslq %edx, %rcx
	movl %edx, (%rax,%rcx,4)
	incl %edx
	cmpl %edi, %edx
	jl .LB15609
.LB15610:
	movl $1, %ecx
.LB15620:
	cmpl %edi, %ecx
	jge .LB15622
.LB15621:
	movslq %ecx, %rdx
	movl (%rax,%rdx,4), %edx
	leal -1(%rcx), %r8d
.LB15632:
	testl %r8d, %r8d
	js .LB15634
.LB15637:
	movslq %r8d, %r9
	movl (%rax,%r9,4), %r9d
	movslq %r9d, %rbx
	leaq (%rbx,%rbx,8), %rbx
	movsd 64(%rsi,%rbx,8), %xmm0
	movslq %edx, %rbx
	leaq (%rbx,%rbx,8), %rbx
	movsd 64(%rsi,%rbx,8), %xmm1
	ucomisd %xmm0, %xmm1
	jbe .LB15634
.LB15633:
	leal 1(%r8), %ebx
	movslq %ebx, %rbx
	movl %r9d, (%rax,%rbx,4)
	decl %r8d
	jns .LB15637
	jmp .LB15634
.LB15622:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB15634:
	incl %r8d
	movslq %r8d, %r8
	movl %edx, (%rax,%r8,4)
	incl %ecx
	cmpl %edi, %ecx
	jl .LB15621
	jmp .LB15622
	.text
	.globl raycaster__r3d_draw_sprites__6__R3DCameraE1_ptr1__R3DSpriteE1_ptr1__dataE1_sbits32__RCTexturePaletteE1_ptr1__doubleE1_ptr1__dataE1_ptr1_ubits64__ret_voidE1
	.def raycaster__r3d_draw_sprites__6__R3DCameraE1_ptr1__R3DSpriteE1_ptr1__dataE1_sbits32__RCTexturePaletteE1_ptr1__doubleE1_ptr1__dataE1_ptr1_ubits64__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
raycaster__r3d_draw_sprites__6__R3DCameraE1_ptr1__R3DSpriteE1_ptr1__dataE1_sbits32__RCTexturePaletteE1_ptr1__doubleE1_ptr1__dataE1_ptr1_ubits64__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $1024, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
	movq %r14, -48(%rbp)
	movq %r15, -56(%rbp)
.LB15681:
	movq %rcx, %rsi
	movq %rdx, -928(%rbp)
	movq %r8, -880(%rbp)
	movq %r9, -792(%rbp)
	movq 48(%rbp), %rdi
	movq 56(%rbp), %rax
	movabsq $1056964608, %r10
	movq %r10, %xmm1
	movq %rsi, %r8
	cvtss2sd %xmm1, %xmm1
	movq %rax, -872(%rbp)
	movslq 16(%rsi), %rax
	xorps %xmm0, %xmm0
	cvtsi2sdq %rax, %xmm0
	mulsd %xmm1, %xmm0
	movabsq $1056964608, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	movsd %xmm0, -608(%rbp)
	movslq 20(%rsi), %rax
	xorps %xmm0, %xmm0
	cvtsi2sdq %rax, %xmm0
	mulsd %xmm1, %xmm0
	movsd %xmm0, -616(%rbp)
	movq -928(%rbp), %rcx
	movq -880(%rbp), %rdx
	callq raycaster__r3d_sprite_sort__3__R3DSpriteE1_ptr1__dataE1_sbits32__R3DCameraE1_ptr1__ret_dataE1_ptr1_sbits32
	movq %rax, -920(%rbp)
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -88(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -120(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -152(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -184(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -216(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -248(%rbp)
	vzeroupper
	movq -792(%rbp), %rax
	xorl %ecx, %ecx
	movq %rcx, -624(%rbp)
	testq %rax, %rax
	setne %al
	movq %rax, -624(%rbp)
	movq $0, -632(%rbp)
	movabsq $0, %r10
	movq %r10, -640(%rbp)
	movabsq $0, %r10
	movq %r10, -648(%rbp)
	movabsq $0, %r10
	movq %r10, -656(%rbp)
	movabsq $0, %r10
	movq %r10, -664(%rbp)
	movabsq $0, %r10
	movq %r10, -672(%rbp)
	movabsq $0, %r10
	movq %r10, -680(%rbp)
	movabsq $0, %r10
	movq %r10, -688(%rbp)
	movq $0, -696(%rbp)
	movq $0, -704(%rbp)
	movq $0, -712(%rbp)
	movq $0, -720(%rbp)
	movabsq $0, %r10
	movq %r10, -728(%rbp)
	movq $0, -736(%rbp)
	movq $0, -744(%rbp)
	movq $0, -752(%rbp)
	movabsq $0, %r10
	movq %r10, -760(%rbp)
	movabsq $0, %r10
	movq %r10, -768(%rbp)
	movabsq $0, %r10
	movq %r10, -776(%rbp)
	movq $0, -784(%rbp)
.LB15741:
	movq -632(%rbp), %rax
	movq -880(%rbp), %rcx
	cmpl %ecx, %eax
	jge .LB15743
.LB15742:
	movq -632(%rbp), %rax
	movq -920(%rbp), %rcx
	movslq %eax, %rax
	movslq (%rcx,%rax,4), %rax
	movq -928(%rbp), %rcx
	leaq (%rax,%rax,8), %rax
	leaq (%rcx,%rax,8), %rbx
	movsd (%rbx), %xmm0
	movsd 8(%rbx), %xmm1
	movsd 24(%rbx), %xmm2
	addsd %xmm2, %xmm1
	movsd 16(%rbx), %xmm2
	movsd %xmm0, -88(%rbp)
	movabsq $1065353216, %r10
	movq %r10, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm1, -80(%rbp)
	movsd %xmm2, -72(%rbp)
	movsd %xmm0, -64(%rbp)
	vmovdqu -88(%rbp), %ymm15
	vmovdqu %ymm15, -280(%rbp)
	vzeroupper
	vmovdqu 312(%rsi), %ymm15
	vmovdqu %ymm15, -408(%rbp)
	vmovdqu 344(%rsi), %ymm15
	vmovdqu %ymm15, -376(%rbp)
	vmovdqu 376(%rsi), %ymm15
	vmovdqu %ymm15, -344(%rbp)
	vmovdqu 408(%rsi), %ymm15
	vmovdqu %ymm15, -312(%rbp)
	vzeroupper
	vmovdqu -408(%rbp), %ymm15
	vmovdqu %ymm15, -568(%rbp)
	vmovdqu -376(%rbp), %ymm15
	vmovdqu %ymm15, -536(%rbp)
	vmovdqu -344(%rbp), %ymm15
	vmovdqu %ymm15, -504(%rbp)
	vmovdqu -312(%rbp), %ymm15
	vmovdqu %ymm15, -472(%rbp)
	vzeroupper
	leaq -568(%rbp), %rdx
	vmovdqu -280(%rbp), %ymm15
	vmovdqu %ymm15, -600(%rbp)
	vzeroupper
	leaq -600(%rbp), %r8
	leaq -440(%rbp), %rcx
	callq raycaster__dmat4_mul_vec4__2__DMat4E1__DVec4E1__ret_DVec4E1
	vmovdqu -440(%rbp), %ymm15
	vmovdqu %ymm15, -120(%rbp)
	vzeroupper
	movsd -96(%rbp), %xmm0
	movsd 24(%rsi), %xmm1
	ucomisd %xmm0, %xmm1
	ja .LB15793
.LB15794:
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	movabsq $1065353216, %r10
	movq %r10, %xmm2
	cvtss2sd %xmm1, %xmm1
	cvtss2sd %xmm2, %xmm2
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	divsd %xmm15, %xmm0
	movsd %xmm0, -800(%rbp)
	movsd -120(%rbp), %xmm1
	vfmadd132sd %xmm1, %xmm2, %xmm0
	movsd -608(%rbp), %xmm1
	mulsd %xmm1, %xmm0
	xorps %xmm1, %xmm1
	movsd %xmm0, -808(%rbp)
	movsd -112(%rbp), %xmm0
	movsd -800(%rbp), %xmm2
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subsd %xmm15, %xmm0
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	vfmadd132sd %xmm2, %xmm1, %xmm0
	movsd -616(%rbp), %xmm1
	movabsq $1056964608, %r10
	movq %r10, %xmm2
	cvtss2sd %xmm2, %xmm2
	mulsd %xmm1, %xmm0
	movabsq $1056964608, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	movsd %xmm0, -816(%rbp)
	movsd 32(%rbx), %xmm0
	mulsd %xmm1, %xmm0
	movsd %xmm0, -824(%rbp)
	movsd 40(%rbx), %xmm1
	mulsd %xmm2, %xmm1
	movsd %xmm1, -832(%rbp)
	movsd 48(%rsi), %xmm2
	movsd -800(%rbp), %xmm3
	mulsd %xmm2, %xmm0
	mulsd %xmm2, %xmm1
	mulsd %xmm3, %xmm0
	mulsd %xmm3, %xmm1
	movsd %xmm0, -840(%rbp)
	movsd %xmm1, -848(%rbp)
	movsd -808(%rbp), %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subsd %xmm15, %xmm0
	cvttsd2siq %xmm0, %rax
	movsd -840(%rbp), %xmm0
	movl %eax, %eax
	addsd %xmm1, %xmm0
	cvttsd2siq %xmm0, %rcx
	movsd -816(%rbp), %xmm0
	movl %ecx, %ecx
	movsd -848(%rbp), %xmm1
	movaps %xmm0, %xmm2
	subsd %xmm1, %xmm2
	addsd %xmm1, %xmm0
	cvttsd2siq %xmm2, %rdx
	cvttsd2siq %xmm0, %r8
	movl %edx, %edx
	movl %r8d, %r8d
	testl %ecx, %ecx
	jle .LB15880
.LB15871:
	movl 16(%rsi), %r9d
	cmpl %r9d, %eax
	jge .LB15880
.LB15881:
	testl %r8d, %r8d
	jle .LB15896
.LB15887:
	movl 20(%rsi), %r12d
	movq %r12, -856(%rbp)
	cmpl %r12d, %edx
	jge .LB15896
.LB15897:
	xorl %r12d, %r12d
	testl %eax, %eax
	movabsq $1065353216, %r10
	movq %r10, %xmm0
	movq %r12, -864(%rbp)
	cmovns %eax, %r12d
	leal -1(%r9), %eax
	cmpl %r9d, %ecx
	movl %ecx, %r13d
	cmovge %eax, %r13d
	xorl %eax, %eax
	testl %edx, %edx
	cmovs %eax, %edx
	cvtss2sd %xmm0, %xmm0
	movq %rdx, -888(%rbp)
	movq -856(%rbp), %rax
	leal -1(%rax), %ecx
	cmpl %eax, %r8d
	cmovge %ecx, %r8d
	movq %r8, -896(%rbp)
	movsd -800(%rbp), %xmm1
	divsd %xmm1, %xmm0
	movsd %xmm0, -904(%rbp)
	movq -624(%rbp), %rax
	testb %al, %al
	je .LB15972
.LB15951:
	movl 48(%rbx), %eax
	testl %eax, %eax
	jle .LB15972
.LB15959:
	movq -792(%rbp), %rcx
	cmpl 8(%rcx), %eax
	jle .LB15971
.LB15972:
	movq $0, -912(%rbp)
.LB15973:
	movl %r13d, %eax
	subl %r12d, %eax
	leal 1(%rax), %r14d
	movq -896(%rbp), %rax
	movq -888(%rbp), %rcx
	subl %ecx, %eax
	incl %eax
	movq %rax, -952(%rbp)
	movq -912(%rbp), %rax
	xorl %ecx, %ecx
	movq %rcx, -936(%rbp)
	testq %rax, %rax
	setne %al
	movq %rax, -936(%rbp)
	movq -744(%rbp), %rax
	movq -888(%rbp), %r10
	movq %r10, -944(%rbp)
	movsd -760(%rbp), %xmm0
	movsd -768(%rbp), %xmm1
	movsd -776(%rbp), %xmm2
	movq -784(%rbp), %rcx
.LB15984:
	movq -944(%rbp), %rdx
	movq -896(%rbp), %r8
	cmpl %r8d, %edx
	jg .LB15986
.LB15985:
	movq -944(%rbp), %rax
	movq -888(%rbp), %rdx
	movl %eax, %r15d
	subl %edx, %r15d
	movq %r12, -960(%rbp)
.LB15991:
	movq -960(%rbp), %rax
	cmpl %r13d, %eax
	jg .LB15993
.LB15992:
	movq -944(%rbp), %rax
	imull 16(%rsi), %eax
	movq -960(%rbp), %rdx
	addl %edx, %eax
	movslq %eax, %rax
	movsd (%rdi,%rax,8), %xmm3
	movsd -800(%rbp), %xmm4
	ucomisd %xmm4, %xmm3
	jae .LB16010
.LB16011:
	movq -960(%rbp), %rax
	subl %r12d, %eax
	movslq %eax, %rax
	xorps %xmm0, %xmm0
	cvtsi2sdq %rax, %xmm0
	movslq %r14d, %rax
	xorps %xmm1, %xmm1
	cvtsi2sdq %rax, %xmm1
	movslq %r15d, %rax
	divsd %xmm1, %xmm0
	movsd %xmm0, -968(%rbp)
	xorps %xmm0, %xmm0
	cvtsi2sdq %rax, %xmm0
	movq -952(%rbp), %rax
	movslq %eax, %rax
	xorps %xmm1, %xmm1
	cvtsi2sdq %rax, %xmm1
	divsd %xmm1, %xmm0
	movsd %xmm0, -976(%rbp)
	movq -936(%rbp), %rax
	testb %al, %al
	je .LB16043
.LB16042:
	movq -912(%rbp), %rax
	movslq 8(%rax), %rax
	movsd -904(%rbp), %xmm1
	xorps %xmm0, %xmm0
	cvtsi2sdq %rax, %xmm0
	mulsd %xmm1, %xmm0
	movsd 48(%rsi), %xmm1
	divsd %xmm1, %xmm0
	movsd %xmm0, -992(%rbp)
	movq -912(%rbp), %rcx
	movsd -968(%rbp), %xmm1
	movsd -976(%rbp), %xmm2
	movaps %xmm0, %xmm3
	callq raycaster__rc_tex_sample_mip__4__RCTextureE1_ptr1__doubleE1__doubleE1__doubleE1__ret_dataE1_ubits64
	movabsq $281474976710655, %rcx
	andq %rax, %rcx
	movabsq $281470681808895, %rdx
	cmpq %rdx, %rcx
	je .LB16066
.LB16067:
	movq -992(%rbp), %r10
	movq %r10, -984(%rbp)
.LB16044:
	movq 52(%rbx), %rdx
	testq %rdx, %rdx
	je .LB16102
.LB16091:
	movq -936(%rbp), %rcx
	testb %cl, %cl
	jne .LB16101
.LB16102:
.LB16103:
	movq -944(%rbp), %rcx
	movl %ecx, %edx
	imull 16(%rsi), %edx
	movq -960(%rbp), %r8
	movq -872(%rbp), %r9
	addl %r8d, %edx
	movslq %edx, %rdx
	movq %rax, (%r9,%rdx,8)
	imull 16(%rsi), %ecx
	movsd -800(%rbp), %xmm0
	addl %r8d, %ecx
	movslq %ecx, %rcx
	movsd %xmm0, (%rdi,%rcx,8)
	movq -960(%rbp), %rcx
	incl %ecx
	movq %rcx, -960(%rbp)
	movsd -968(%rbp), %xmm0
	movsd -976(%rbp), %xmm1
	movsd -984(%rbp), %xmm2
	movq %rax, %rcx
	jmp .LB15991
.LB15743:
	movq -920(%rbp), %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB15971:
	decl %eax
	movq -792(%rbp), %rcx
	movq (%rcx), %rcx
	movslq %eax, %rax
	imulq $212, %rax, %rax
	leaq (%rcx,%rax,1), %rax
	movq %rax, -912(%rbp)
	jmp .LB15973
.LB15986:
	movq -632(%rbp), %rdx
	incl %edx
	movq %rdx, -632(%rbp)
	movq -800(%rbp), %r10
	movq %r10, -640(%rbp)
	movq -808(%rbp), %r10
	movq %r10, -648(%rbp)
	movq -816(%rbp), %r10
	movq %r10, -656(%rbp)
	movq -824(%rbp), %r10
	movq %r10, -664(%rbp)
	movq -832(%rbp), %r10
	movq %r10, -672(%rbp)
	movq -840(%rbp), %r10
	movq %r10, -680(%rbp)
	movq -848(%rbp), %r10
	movq %r10, -688(%rbp)
	movq %r12, -696(%rbp)
	movq %r13, -704(%rbp)
	movq -888(%rbp), %r10
	movq %r10, -712(%rbp)
	movq -896(%rbp), %r10
	movq %r10, -720(%rbp)
	movq -904(%rbp), %r10
	movq %r10, -728(%rbp)
	movq -912(%rbp), %r10
	movq %r10, -736(%rbp)
	movq %rax, -744(%rbp)
	movq -944(%rbp), %r10
	movq %r10, -752(%rbp)
	movsd %xmm0, -760(%rbp)
	movsd %xmm1, -768(%rbp)
	movsd %xmm2, -776(%rbp)
	movq %rcx, -784(%rbp)
	jmp .LB15741
.LB15993:
	movq -944(%rbp), %rax
	incl %eax
	movq %rax, -944(%rbp)
	movq -960(%rbp), %rax
	jmp .LB15984
.LB16043:
	movq 52(%rbx), %rax
	movq $-1, %rcx
	testq %rax, %rax
	cmove %rcx, %rax
	movsd %xmm2, -984(%rbp)
	jmp .LB16044
.LB16101:
	movq %rax, %rcx
	callq raycaster__color64_tint__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64
	jmp .LB16103
.LB16066:
	movq -960(%rbp), %rcx
	incl %ecx
	movq %rcx, -960(%rbp)
	movsd -968(%rbp), %xmm0
	movsd -976(%rbp), %xmm1
	movsd -992(%rbp), %xmm2
	movq %rax, %rcx
	jmp .LB15991
.LB16010:
	movq -960(%rbp), %rax
	incl %eax
	movq %rax, -960(%rbp)
	jmp .LB15991
.LB15896:
	movq -632(%rbp), %r9
	incl %r9d
	movq %r9, -632(%rbp)
	movq -800(%rbp), %r10
	movq %r10, -640(%rbp)
	movq -808(%rbp), %r10
	movq %r10, -648(%rbp)
	movq -816(%rbp), %r10
	movq %r10, -656(%rbp)
	movq -824(%rbp), %r10
	movq %r10, -664(%rbp)
	movq -832(%rbp), %r10
	movq %r10, -672(%rbp)
	movq -840(%rbp), %r10
	movq %r10, -680(%rbp)
	movq -848(%rbp), %r10
	movq %r10, -688(%rbp)
	movq %rax, -696(%rbp)
	movq %rcx, -704(%rbp)
	movq %rdx, -712(%rbp)
	movq %r8, -720(%rbp)
	jmp .LB15741
.LB15880:
	movq -632(%rbp), %r9
	incl %r9d
	movq %r9, -632(%rbp)
	movq -800(%rbp), %r10
	movq %r10, -640(%rbp)
	movq -808(%rbp), %r10
	movq %r10, -648(%rbp)
	movq -816(%rbp), %r10
	movq %r10, -656(%rbp)
	movq -824(%rbp), %r10
	movq %r10, -664(%rbp)
	movq -832(%rbp), %r10
	movq %r10, -672(%rbp)
	movq -840(%rbp), %r10
	movq %r10, -680(%rbp)
	movq -848(%rbp), %r10
	movq %r10, -688(%rbp)
	movq %rax, -696(%rbp)
	movq %rcx, -704(%rbp)
	movq %rdx, -712(%rbp)
	movq %r8, -720(%rbp)
	jmp .LB15741
.LB15793:
	movq -632(%rbp), %rax
	incl %eax
	movq %rax, -632(%rbp)
	jmp .LB15741
	.text
	.globl raycaster__r3d_draw_sky__4__RCSkyE1_ptr1__R3DCameraE1_ptr1__R3DPlayerE1_ptr1__dataE1_ptr1_ubits64__ret_voidE1
	.def raycaster__r3d_draw_sky__4__RCSkyE1_ptr1__R3DCameraE1_ptr1__R3DPlayerE1_ptr1__dataE1_ptr1_ubits64__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
raycaster__r3d_draw_sky__4__RCSkyE1_ptr1__R3DCameraE1_ptr1__R3DPlayerE1_ptr1__dataE1_ptr1_ubits64__ret_voidE1:
	subq $80, %rsp
	movq %rbx, 64(%rsp)
	movq %rsi, 56(%rsp)
	movq %rdi, 48(%rsp)
	movq %r12, 40(%rsp)
	movq %r13, 32(%rsp)
	movq %r14, 24(%rsp)
	movq %r15, 16(%rsp)
.LB16140:
	movabsq $1056964608, %r10
	movq %r10, %xmm2
	movq %rcx, (%rsp)
	movsd 32(%r8), %xmm0
	movsd 8(%rdx), %xmm1
	movabsq $1056964608, %r10
	movq %r10, %xmm3
	movslq 20(%rdx), %rax
	cvtss2sd %xmm2, %xmm2
	cvtss2sd %xmm3, %xmm3
	mulsd %xmm2, %xmm1
	movabsq $1056964608, %r10
	movq %r10, %xmm2
	cvtss2sd %xmm2, %xmm2
	divsd %xmm1, %xmm0
	xorps %xmm1, %xmm1
	cvtsi2sdq %rax, %xmm1
	vfmadd132sd %xmm2, %xmm3, %xmm0
	mulsd %xmm1, %xmm0
	xorl %eax, %eax
	xorl %ecx, %ecx
	xorps %xmm1, %xmm1
	xorl %esi, %esi
	xorl %edi, %edi
	xorl %r8d, %r8d
	xorps %xmm2, %xmm2
	xorl %ebx, %ebx
	xorl %r12d, %r12d
	xorl %r13d, %r13d
	xorl %r14d, %r14d
	movq $0, 8(%rsp)
.LB16174:
	cmpl 20(%rdx), %eax
	jge .LB16176
.LB16175:
	movslq %eax, %r15
	xorps %xmm3, %xmm3
	cvtsi2sdq %r15, %xmm3
	ucomisd %xmm0, %xmm3
	jae .LB16187
.LB16188:
	movaps %xmm3, %xmm1
	divsd %xmm0, %xmm1
	movabsq $4679240012837945344, %r10
	movq %r10, %xmm2
	movq (%rsp), %rcx
	movl $65536, %esi
	movabsq $-281474976710656, %r14
	movq (%rcx), %rdi
	movq 8(%rcx), %r8
	mulsd %xmm1, %xmm2
	cvttsd2siq %xmm2, %rcx
	cmpq $65536, %rcx
	cmova %rsi, %rcx
	movl $65536, %esi
	subq %rcx, %rsi
	movq %rdi, %rbx
	shrq $32, %rbx
	andq $65535, %rbx
	imulq %rsi, %rbx
	movq %r8, %r12
	shrq $32, %r12
	andq $65535, %r12
	imulq %rcx, %r12
	addq %r12, %rbx
	shrq $16, %rbx
	movq %rbx, -8(%rsp)
	movq %rdi, %rbx
	shrq $16, %rbx
	andq $65535, %rbx
	imulq %rsi, %rbx
	movq %r8, %r12
	shrq $16, %r12
	andq $65535, %r12
	imulq %rcx, %r12
	addq %r12, %rbx
	shrq $16, %rbx
	movq %rdi, %r12
	andq $65535, %r12
	imulq %rsi, %r12
	movq %r8, %r13
	andq $65535, %r13
	imulq %rcx, %r13
	addq %r13, %r12
	movq -8(%rsp), %r13
	shrq $16, %r12
	shlq $32, %r13
	orq %r14, %r13
	movq %rbx, %r14
	shlq $16, %r14
	orq %r14, %r13
	orq %r12, %r13
	xorl %r14d, %r14d
.LB16206:
	movl 16(%rdx), %r15d
	cmpl %r15d, %r14d
	jge .LB16208
.LB16207:
	imull %eax, %r15d
	addl %r14d, %r15d
	movslq %r15d, %r15
	movq %r13, (%r9,%r15,8)
	incl %r14d
	jmp .LB16206
.LB16176:
	movq 64(%rsp), %rbx
	movq 56(%rsp), %rsi
	movq 48(%rsp), %rdi
	movq 40(%rsp), %r12
	movq 32(%rsp), %r13
	movq 24(%rsp), %r14
	movq 16(%rsp), %r15
	addq $80, %rsp
	ret
.LB16208:
	incl %eax
	movaps %xmm1, %xmm2
	movq %r12, 8(%rsp)
	movq %rsi, %r12
	movq %r13, %rsi
	movq -8(%rsp), %r13
	movq %rcx, %r11
	movq %r14, %rcx
	movq %rbx, %r14
	movq %r11, %rbx
	cmpl 20(%rdx), %eax
	jl .LB16175
	jmp .LB16176
.LB16187:
	incl %eax
	cmpl 20(%rdx), %eax
	jl .LB16175
	jmp .LB16176
	.text
	.globl raycaster__r3d_fxaa__3__dataE1_ptr1_ubits64__dataE1_sbits32__dataE1_sbits32__ret_voidE1
	.def raycaster__r3d_fxaa__3__dataE1_ptr1_ubits64__dataE1_sbits32__dataE1_sbits32__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
raycaster__r3d_fxaa__3__dataE1_ptr1_ubits64__dataE1_sbits32__dataE1_sbits32__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $2096, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
	movq %r14, -48(%rbp)
	movq %r15, -56(%rbp)
.LB20831:
	movl %r8d, %esi
	movq %rcx, -344(%rbp)
	movl %edx, %edi
	imull %esi, %edi
	movq %rdx, -336(%rbp)
	movq %rdi, %rcx
	shlq $3, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, %rbx
	movslq %edi, %rdi
	xorl %r12d, %r12d
.LB20849:
	cmpq %rdi, %r12
	jge .LB20851
.LB20850:
	movq -344(%rbp), %rax
	movq (%rax,%r12,8), %rcx
	callq raycaster__color64_luma__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, (%rbx,%r12,8)
	incq %r12
	cmpq %rdi, %r12
	jl .LB20850
.LB20851:
	decl %esi
	movq %rsi, -312(%rbp)
	movq -336(%rbp), %rax
	decl %eax
	movq %rax, -680(%rbp)
	movq $1, -664(%rbp)
	movq $0, -320(%rbp)
	xorl %eax, %eax
	movq $0, -272(%rbp)
	movq $0, -280(%rbp)
	movq $0, -288(%rbp)
	movq $0, -296(%rbp)
	movq $0, -64(%rbp)
	movq $0, -72(%rbp)
	movq $0, -80(%rbp)
	movq $0, -88(%rbp)
	movq $0, -96(%rbp)
	movq $0, -104(%rbp)
	movq $0, -112(%rbp)
	movq $0, -120(%rbp)
	movq $0, -128(%rbp)
	movq $0, -136(%rbp)
	movq $0, -144(%rbp)
	movq $0, -152(%rbp)
	movq $0, -160(%rbp)
	movq $0, -168(%rbp)
	movq $0, -176(%rbp)
	movq $0, -184(%rbp)
	movq $0, -192(%rbp)
	movq $0, -200(%rbp)
	movq $0, -208(%rbp)
	movq $0, -216(%rbp)
	movq $0, -224(%rbp)
	movq $0, -232(%rbp)
	movq $0, -240(%rbp)
	movq $0, -248(%rbp)
	movq $0, -256(%rbp)
	movq $0, -264(%rbp)
.LB20900:
	movq -664(%rbp), %rcx
	movq -312(%rbp), %rdx
	cmpl %edx, %ecx
	jge .LB20902
.LB20901:
	movq -664(%rbp), %rcx
	movq -336(%rbp), %rdx
	imull %edx, %ecx
	movq %rcx, -672(%rbp)
	movl %ecx, %esi
	subl %edx, %esi
	addl %edx, %ecx
	xorl %edx, %edx
	movq %rsi, -688(%rbp)
	movq %rcx, -696(%rbp)
	movq -664(%rbp), %rcx
	decl %ecx
	movq %rcx, -648(%rbp)
	cmpl $1, %ecx
	movq %rdx, -304(%rbp)
	setge %dl
	movq %rdx, -304(%rbp)
	movq -336(%rbp), %rdx
	imull %edx, %ecx
	xorl %edx, %edx
	movq %rcx, -640(%rbp)
	movq -664(%rbp), %rcx
	movq %rdx, -328(%rbp)
	subl $2, %ecx
	cmpl $1, %ecx
	setge %dl
	movq %rdx, -328(%rbp)
	movq -336(%rbp), %rdx
	imull %edx, %ecx
	xorl %edx, %edx
	movq %rcx, -632(%rbp)
	movq -664(%rbp), %rcx
	incl %ecx
	movq %rcx, -656(%rbp)
	movq %rdx, -352(%rbp)
	movq -312(%rbp), %rsi
	cmpl %esi, %ecx
	setl %dl
	movq %rdx, -352(%rbp)
	movq -336(%rbp), %rdx
	imull %edx, %ecx
	xorl %edx, %edx
	movq %rcx, -360(%rbp)
	movq -664(%rbp), %rcx
	movq %rdx, -368(%rbp)
	movq -312(%rbp), %rsi
	addl $2, %ecx
	cmpl %esi, %ecx
	setl %dl
	movq %rdx, -368(%rbp)
	movq -336(%rbp), %rdx
	imull %edx, %ecx
	movq %rcx, -376(%rbp)
	movq $1, -384(%rbp)
	movq %rax, %rcx
	movq -272(%rbp), %r10
	movq %r10, -392(%rbp)
	movq -280(%rbp), %r10
	movq %r10, -400(%rbp)
	movq -288(%rbp), %r10
	movq %r10, -408(%rbp)
	movq -296(%rbp), %r10
	movq %r10, -416(%rbp)
	movq -64(%rbp), %r10
	movq %r10, -424(%rbp)
	movq -72(%rbp), %r10
	movq %r10, -432(%rbp)
	movq -80(%rbp), %r10
	movq %r10, -440(%rbp)
	movq -88(%rbp), %r10
	movq %r10, -448(%rbp)
	movq -96(%rbp), %r10
	movq %r10, -456(%rbp)
	movq -104(%rbp), %r10
	movq %r10, -464(%rbp)
	movq -112(%rbp), %r10
	movq %r10, -472(%rbp)
	movq -120(%rbp), %r10
	movq %r10, -480(%rbp)
	movq -128(%rbp), %r10
	movq %r10, -488(%rbp)
	movq -136(%rbp), %r10
	movq %r10, -496(%rbp)
	movq -144(%rbp), %r10
	movq %r10, -504(%rbp)
	movq -152(%rbp), %r10
	movq %r10, -512(%rbp)
	movq -160(%rbp), %r10
	movq %r10, -520(%rbp)
	movq -168(%rbp), %r10
	movq %r10, -528(%rbp)
	movq -176(%rbp), %r10
	movq %r10, -536(%rbp)
	movq -184(%rbp), %r10
	movq %r10, -544(%rbp)
	movq -192(%rbp), %r10
	movq %r10, -552(%rbp)
	movq -200(%rbp), %r10
	movq %r10, -560(%rbp)
	movq -208(%rbp), %r10
	movq %r10, -568(%rbp)
	movq -216(%rbp), %r10
	movq %r10, -576(%rbp)
	movq -224(%rbp), %r10
	movq %r10, -584(%rbp)
	movq -232(%rbp), %r10
	movq %r10, -592(%rbp)
	movq -240(%rbp), %r10
	movq %r10, -600(%rbp)
	movq -248(%rbp), %r10
	movq %r10, -608(%rbp)
	movq -256(%rbp), %r10
	movq %r10, -616(%rbp)
	movq -264(%rbp), %r10
	movq %r10, -624(%rbp)
	movq -320(%rbp), %rax
.LB20910:
	movq -384(%rbp), %rdx
	movq -680(%rbp), %rsi
	cmpl %esi, %edx
	jge .LB20912
.LB20911:
	movq -672(%rbp), %rax
	movq -384(%rbp), %rcx
	addl %ecx, %eax
	movslq %eax, %rdx
	movq (%rbx,%rdx,8), %rsi
	movq -688(%rbp), %rdx
	addl %ecx, %edx
	movslq %edx, %rcx
	movq (%rbx,%rcx,8), %rcx
	movq -696(%rbp), %rdi
	movq -384(%rbp), %r8
	addl %r8d, %edi
	leal -1(%rax), %r9d
	incl %eax
	movslq %edi, %r8
	movslq %r9d, %r9
	movslq %eax, %rax
	movq (%rbx,%r8,8), %r8
	movq (%rbx,%r9,8), %r9
	movq (%rbx,%rax,8), %r12
	leal -1(%rdx), %eax
	movslq %eax, %rax
	incl %edx
	movq (%rbx,%rax,8), %rax
	movq %rax, -704(%rbp)
	movslq %edx, %rax
	movq (%rbx,%rax,8), %rax
	movq %rax, -720(%rbp)
	leal -1(%rdi), %eax
	incl %edi
	cmpq %rcx, %r9
	movslq %eax, %rax
	movq (%rbx,%rax,8), %rax
	movq %rax, -712(%rbp)
	movslq %edi, %rax
	movq (%rbx,%rax,8), %rax
	movq %rax, -2024(%rbp)
	movq %rcx, %rax
	cmovb %r9, %rax
	cmpq %rax, %rsi
	cmovb %rsi, %rax
	cmpq %rax, %r12
	cmovb %r12, %rax
	cmpq %rax, %r8
	cmovb %r8, %rax
	cmpq %rcx, %r9
	movq %rax, -2032(%rbp)
	movq %rcx, %rax
	cmova %r9, %rax
	cmpq %rax, %rsi
	cmova %rsi, %rax
	cmpq %rax, %r12
	cmova %r12, %rax
	cmpq %rax, %r8
	movq %rax, %rdi
	cmova %r8, %rdi
	movq -2032(%rbp), %rax
	movq %rdi, %r13
	subq %rax, %r13
	cmpq $3277, %r13
	jb .LB21053
.LB21054:
	imulq $6, %r13, %rax
	cmpq %rdi, %rax
	jb .LB21063
.LB21064:
	movq -704(%rbp), %rax
	movq -712(%rbp), %rdx
	movq %rax, %r14
	subq %rdx, %r14
	movq %rdx, %r15
	subq %rax, %r15
	cmpq %rdx, %rax
	movq %r14, -1992(%rbp)
	movq %r15, -2000(%rbp)
	cmova %r14, %r15
	movq %rcx, %rax
	subq %r8, %rax
	movq %r8, %rdx
	subq %rcx, %rdx
	cmpq %r8, %rcx
	movq %r15, -2008(%rbp)
	movq %rdx, -728(%rbp)
	cmova %rax, %rdx
	movq %rdx, -2016(%rbp)
	shlq $1, %rdx
	movq %rdx, -736(%rbp)
	movq -2008(%rbp), %rax
	addq %rdx, %rax
	movq %rax, -760(%rbp)
	movq -720(%rbp), %rax
	movq -2024(%rbp), %rdx
	movq %rax, %r14
	subq %rdx, %r14
	movq %rdx, %r15
	subq %rax, %r15
	cmpq %rdx, %rax
	movq %r14, -744(%rbp)
	movq %r15, -752(%rbp)
	cmova %r14, %r15
	movq %r15, -816(%rbp)
	movq -760(%rbp), %rax
	addq %r15, %rax
	movq %rax, -768(%rbp)
	movq -704(%rbp), %rax
	movq -720(%rbp), %rdx
	movq %rax, %r14
	subq %rdx, %r14
	movq %rdx, %r15
	subq %rax, %r15
	cmpq %rdx, %rax
	movq %r14, -776(%rbp)
	movq %r15, -784(%rbp)
	cmova %r14, %r15
	movq %r9, %rax
	subq %r12, %rax
	movq %r12, %rdx
	subq %r9, %rdx
	cmpq %r12, %r9
	movq %r15, -792(%rbp)
	movq %rax, -800(%rbp)
	movq %rdx, -808(%rbp)
	cmova %rax, %rdx
	movq %rdx, -2048(%rbp)
	shlq $1, %rdx
	movq %rdx, -824(%rbp)
	movq -792(%rbp), %rax
	addq %rdx, %rax
	movq %rax, -832(%rbp)
	movq -712(%rbp), %rax
	movq -2024(%rbp), %rdx
	movq %rax, %r14
	subq %rdx, %r14
	movq %rdx, %r15
	subq %rax, %r15
	cmpq %rdx, %rax
	movl $0, %edx
	movq %r14, -840(%rbp)
	movq %r15, -848(%rbp)
	cmova %r14, %r15
	movq %r15, -856(%rbp)
	movq -832(%rbp), %rax
	addq %r15, %rax
	movq %rax, -864(%rbp)
	movq %rdx, -872(%rbp)
	movq -768(%rbp), %r14
	cmpq %rax, %r14
	setae %al
	movq %rax, -872(%rbp)
	testb %al, %al
	jne .LB21158
.LB21159:
	movq -2048(%rbp), %rax
	shrq $1, %rax
	movq %rax, -2040(%rbp)
	movq -304(%rbp), %rax
	testb %al, %al
	jne .LB21504
.LB21505:
	movq -2048(%rbp), %r10
	movq %r10, -880(%rbp)
.LB21506:
	movq -328(%rbp), %rax
	testb %al, %al
	jne .LB21578
.LB21579:
	movq -2048(%rbp), %r10
	movq %r10, -968(%rbp)
.LB21580:
	movq -352(%rbp), %rax
	testb %al, %al
	jne .LB21654
.LB21655:
	movq -2048(%rbp), %r10
	movq %r10, -1056(%rbp)
.LB21656:
	movq -368(%rbp), %rax
	testb %al, %al
	jne .LB21730
.LB21731:
	movq -2048(%rbp), %r10
	movq %r10, -1144(%rbp)
.LB21732:
	movq -880(%rbp), %rax
	movq -2040(%rbp), %rdx
	cmpq %rdx, %rax
	jae .LB21804
.LB25175:
	movq $0, -1232(%rbp)
.LB21817:
	movq -384(%rbp), %rax
	leal -1(%rax), %edx
	incl %eax
	cmpq %r12, %r9
	movq %rdx, -1248(%rbp)
	movq %rax, -1256(%rbp)
	cmova %edx, %eax
	movq %rax, -1264(%rbp)
	movq -1264(%rbp), %r10
	movq %r10, -1272(%rbp)
	movq -664(%rbp), %r10
	movq %r10, -1280(%rbp)
	movq -2048(%rbp), %r10
	movq %r10, -1288(%rbp)
	movq -2040(%rbp), %r10
	movq %r10, -1296(%rbp)
	movq -880(%rbp), %r10
	movq %r10, -1304(%rbp)
	movq -968(%rbp), %r10
	movq %r10, -1312(%rbp)
	movq -1056(%rbp), %r10
	movq %r10, -1320(%rbp)
	movq -1144(%rbp), %r10
	movq %r10, -1328(%rbp)
	movq -1232(%rbp), %r10
	movq %r10, -1336(%rbp)
.LB21160:
	movq -1336(%rbp), %rax
	testb %al, %al
	je .LB21835
.LB21836:
	leaq -3277(%r13), %rax
	movq %rax, -1696(%rbp)
	shlq $16, %rax
	movabsq $360265981299179525, %rdx
	mulq %rdx
	movq %rdx, %rax
	shrq $8, %rax
	movl $32768, %edx
	cmpq $32768, %rax
	cmova %rdx, %rax
	movq -672(%rbp), %rdx
	movq -384(%rbp), %r14
	addl %r14d, %edx
	movq -344(%rbp), %r14
	movslq %edx, %rdx
	leaq (%r14,%rdx,8), %rdx
	movq %rdx, -1704(%rbp)
	movq (%rdx), %rdx
	movq -1280(%rbp), %r14
	movq -336(%rbp), %r15
	imull %r15d, %r14d
	movq %r14, -1712(%rbp)
	movq -1272(%rbp), %r15
	addl %r15d, %r14d
	movq %r14, -1720(%rbp)
	movslq %r14d, %r14
	movq %r14, -1728(%rbp)
	movq -344(%rbp), %r15
	movq (%r15,%r14,8), %r14
	movq %r14, -1736(%rbp)
	movl $65536, %r14d
	movq %r14, -1744(%rbp)
	subq %rax, %r14
	movq %rdx, %r15
	shrq $32, %r15
	movq %r14, -1752(%rbp)
	movq %r15, -1760(%rbp)
	andq $65535, %r15
	movq %r15, -1768(%rbp)
	imulq %r14, %r15
	movq %r15, -1776(%rbp)
	movq -1736(%rbp), %r14
	shrq $32, %r14
	movq %r14, -1784(%rbp)
	andq $65535, %r14
	movq %r14, -1792(%rbp)
	imulq %rax, %r14
	movq %r14, -1800(%rbp)
	movq -1776(%rbp), %r15
	addq %r14, %r15
	movq %r15, -1808(%rbp)
	shrq $16, %r15
	movq %r15, -1816(%rbp)
	movq %rdx, %r14
	shrq $16, %r14
	movq %r14, -1824(%rbp)
	andq $65535, %r14
	movq %r14, -1832(%rbp)
	movq -1752(%rbp), %r15
	imulq %r15, %r14
	movq %r14, -1840(%rbp)
	movq -1736(%rbp), %r14
	shrq $16, %r14
	movq %r14, -1848(%rbp)
	andq $65535, %r14
	movq %r14, -1856(%rbp)
	imulq %rax, %r14
	movq %r14, -1864(%rbp)
	movq -1840(%rbp), %r15
	addq %r14, %r15
	movq %r15, -1872(%rbp)
	shrq $16, %r15
	movq %rdx, %r14
	andq $65535, %r14
	movq %r15, -1880(%rbp)
	movq %r14, -1888(%rbp)
	movq -1752(%rbp), %r15
	imulq %r15, %r14
	movq %r14, -1896(%rbp)
	movq -1736(%rbp), %r15
	andq $65535, %r15
	movq %r15, -1904(%rbp)
	imulq %rax, %r15
	movq %r15, -1912(%rbp)
	addq %r15, %r14
	movabsq $-281474976710656, %r15
	movq %r14, -1920(%rbp)
	shrq $16, %r14
	movq %r14, -1928(%rbp)
	movq -1816(%rbp), %r14
	shlq $32, %r14
	movq %r14, -1936(%rbp)
	orq %r15, %r14
	movq %r15, -1944(%rbp)
	movq %r14, -1952(%rbp)
	movq -1880(%rbp), %r15
	shlq $16, %r15
	movq %r15, -1960(%rbp)
	orq %r15, %r14
	movq %r14, -1968(%rbp)
	movq -1928(%rbp), %r15
	orq %r15, %r14
	movq %r14, -1976(%rbp)
	movq -1704(%rbp), %r15
	movq %r14, (%r15)
	movq -384(%rbp), %r14
	incl %r14d
	movq %r14, -1984(%rbp)
	movq -1984(%rbp), %r10
	movq %r10, -384(%rbp)
	movq -720(%rbp), %r10
	movq %r10, -392(%rbp)
	movq %r9, -400(%rbp)
	movq %rsi, -408(%rbp)
	movq %r12, -416(%rbp)
	movq -712(%rbp), %r10
	movq %r10, -424(%rbp)
	movq %r8, -432(%rbp)
	movq -2024(%rbp), %r10
	movq %r10, -440(%rbp)
	movq -2032(%rbp), %r10
	movq %r10, -448(%rbp)
	movq %rdi, -456(%rbp)
	movq %r13, -464(%rbp)
	movq -768(%rbp), %r10
	movq %r10, -472(%rbp)
	movq -864(%rbp), %r10
	movq %r10, -480(%rbp)
	movq -1816(%rbp), %r10
	movq %r10, -488(%rbp)
	movq -1880(%rbp), %r10
	movq %r10, -496(%rbp)
	movq -1928(%rbp), %r10
	movq %r10, -504(%rbp)
	movq %rdx, -512(%rbp)
	movq -1736(%rbp), %r10
	movq %r10, -520(%rbp)
	movq -872(%rbp), %r10
	movq %r10, -528(%rbp)
	movq -1272(%rbp), %r10
	movq %r10, -536(%rbp)
	movq -1280(%rbp), %r10
	movq %r10, -544(%rbp)
	movq -1288(%rbp), %r10
	movq %r10, -552(%rbp)
	movq -1296(%rbp), %r10
	movq %r10, -560(%rbp)
	movq -1304(%rbp), %r10
	movq %r10, -568(%rbp)
	movq -1312(%rbp), %r10
	movq %r10, -576(%rbp)
	movq -1320(%rbp), %r10
	movq %r10, -584(%rbp)
	movq -1328(%rbp), %r10
	movq %r10, -592(%rbp)
	movq -1336(%rbp), %r10
	movq %r10, -600(%rbp)
	movq %rax, -608(%rbp)
	movq -1752(%rbp), %r10
	movq %r10, -616(%rbp)
	movq -1696(%rbp), %r10
	movq %r10, -624(%rbp)
	movq -704(%rbp), %rax
	jmp .LB20910
.LB20902:
	movq %rbx, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB20912:
	movq -664(%rbp), %rdx
	incl %edx
	movq %rdx, -664(%rbp)
	movq %rax, -320(%rbp)
	movq %rcx, %rax
	movq -392(%rbp), %r10
	movq %r10, -272(%rbp)
	movq -400(%rbp), %r10
	movq %r10, -280(%rbp)
	movq -408(%rbp), %r10
	movq %r10, -288(%rbp)
	movq -416(%rbp), %r10
	movq %r10, -296(%rbp)
	movq -424(%rbp), %r10
	movq %r10, -64(%rbp)
	movq -432(%rbp), %r10
	movq %r10, -72(%rbp)
	movq -440(%rbp), %r10
	movq %r10, -80(%rbp)
	movq -448(%rbp), %r10
	movq %r10, -88(%rbp)
	movq -456(%rbp), %r10
	movq %r10, -96(%rbp)
	movq -464(%rbp), %r10
	movq %r10, -104(%rbp)
	movq -472(%rbp), %r10
	movq %r10, -112(%rbp)
	movq -480(%rbp), %r10
	movq %r10, -120(%rbp)
	movq -488(%rbp), %r10
	movq %r10, -128(%rbp)
	movq -496(%rbp), %r10
	movq %r10, -136(%rbp)
	movq -504(%rbp), %r10
	movq %r10, -144(%rbp)
	movq -512(%rbp), %r10
	movq %r10, -152(%rbp)
	movq -520(%rbp), %r10
	movq %r10, -160(%rbp)
	movq -528(%rbp), %r10
	movq %r10, -168(%rbp)
	movq -536(%rbp), %r10
	movq %r10, -176(%rbp)
	movq -544(%rbp), %r10
	movq %r10, -184(%rbp)
	movq -552(%rbp), %r10
	movq %r10, -192(%rbp)
	movq -560(%rbp), %r10
	movq %r10, -200(%rbp)
	movq -568(%rbp), %r10
	movq %r10, -208(%rbp)
	movq -576(%rbp), %r10
	movq %r10, -216(%rbp)
	movq -584(%rbp), %r10
	movq %r10, -224(%rbp)
	movq -592(%rbp), %r10
	movq %r10, -232(%rbp)
	movq -600(%rbp), %r10
	movq %r10, -240(%rbp)
	movq -608(%rbp), %r10
	movq %r10, -248(%rbp)
	movq -616(%rbp), %r10
	movq %r10, -256(%rbp)
	movq -624(%rbp), %r10
	movq %r10, -264(%rbp)
	jmp .LB20900
.LB21504:
	movq -640(%rbp), %rax
	movq -384(%rbp), %rdx
	addl %edx, %eax
	movq %rax, -888(%rbp)
	leal -1(%rax), %edx
	incl %eax
	movq %rdx, -896(%rbp)
	movslq %edx, %rdx
	movq %rdx, -904(%rbp)
	movq (%rbx,%rdx,8), %rdx
	movq %rdx, -912(%rbp)
	movq %rax, -920(%rbp)
	movslq %eax, %rax
	movq %rax, -928(%rbp)
	movq (%rbx,%rax,8), %rax
	movq %rax, -936(%rbp)
	subq %rax, %rdx
	movq %rdx, -944(%rbp)
	movq -912(%rbp), %r14
	movq %rax, %r15
	subq %r14, %r15
	cmpq %rax, %r14
	movq %r15, -952(%rbp)
	cmova %rdx, %r15
	movq %r15, -960(%rbp)
	movq -960(%rbp), %r10
	movq %r10, -880(%rbp)
	jmp .LB21506
.LB21578:
	movq -632(%rbp), %rax
	movq -384(%rbp), %rdx
	addl %edx, %eax
	movq %rax, -976(%rbp)
	leal -1(%rax), %edx
	incl %eax
	movq %rdx, -984(%rbp)
	movslq %edx, %rdx
	movq %rdx, -992(%rbp)
	movq (%rbx,%rdx,8), %rdx
	movq %rdx, -1000(%rbp)
	movq %rax, -1008(%rbp)
	movslq %eax, %rax
	movq %rax, -1016(%rbp)
	movq (%rbx,%rax,8), %rax
	movq %rax, -1024(%rbp)
	subq %rax, %rdx
	movq %rdx, -1032(%rbp)
	movq -1000(%rbp), %r14
	movq %rax, %r15
	subq %r14, %r15
	cmpq %rax, %r14
	movq %r15, -1040(%rbp)
	cmova %rdx, %r15
	movq %r15, -1048(%rbp)
	movq -1048(%rbp), %r10
	movq %r10, -968(%rbp)
	jmp .LB21580
.LB21654:
	movq -360(%rbp), %rax
	movq -384(%rbp), %rdx
	addl %edx, %eax
	movq %rax, -1064(%rbp)
	leal -1(%rax), %edx
	incl %eax
	movq %rdx, -1072(%rbp)
	movslq %edx, %rdx
	movq %rdx, -1080(%rbp)
	movq (%rbx,%rdx,8), %rdx
	movq %rdx, -1088(%rbp)
	movq %rax, -1096(%rbp)
	movslq %eax, %rax
	movq %rax, -1104(%rbp)
	movq (%rbx,%rax,8), %rax
	movq %rax, -1112(%rbp)
	subq %rax, %rdx
	movq %rdx, -1120(%rbp)
	movq -1088(%rbp), %r14
	movq %rax, %r15
	subq %r14, %r15
	cmpq %rax, %r14
	movq %r15, -1128(%rbp)
	cmova %rdx, %r15
	movq %r15, -1136(%rbp)
	movq -1136(%rbp), %r10
	movq %r10, -1056(%rbp)
	jmp .LB21656
.LB21730:
	movq -376(%rbp), %rax
	movq -384(%rbp), %rdx
	addl %edx, %eax
	movq %rax, -1152(%rbp)
	leal -1(%rax), %edx
	incl %eax
	movq %rdx, -1160(%rbp)
	movslq %edx, %rdx
	movq %rdx, -1168(%rbp)
	movq (%rbx,%rdx,8), %rdx
	movq %rdx, -1176(%rbp)
	movq %rax, -1184(%rbp)
	movslq %eax, %rax
	movq %rax, -1192(%rbp)
	movq (%rbx,%rax,8), %rax
	movq %rax, -1200(%rbp)
	subq %rax, %rdx
	movq %rdx, -1208(%rbp)
	movq -1176(%rbp), %r14
	movq %rax, %r15
	subq %r14, %r15
	cmpq %rax, %r14
	movq %r15, -1216(%rbp)
	cmova %rdx, %r15
	movq %r15, -1224(%rbp)
	movq -1224(%rbp), %r10
	movq %r10, -1144(%rbp)
	jmp .LB21732
.LB21804:
	movq -968(%rbp), %rax
	movq -2040(%rbp), %rdx
	cmpq %rdx, %rax
	jae .LB21810
.LB25176:
	movq $0, -1232(%rbp)
	jmp .LB21817
.LB21810:
	movq -1056(%rbp), %rax
	movq -2040(%rbp), %rdx
	cmpq %rdx, %rax
	jae .LB21816
.LB25177:
	movq $0, -1232(%rbp)
	jmp .LB21817
.LB21816:
	xorl %eax, %eax
	movq %rax, -1240(%rbp)
	movq -1144(%rbp), %rdx
	movq -2040(%rbp), %r14
	cmpq %r14, %rdx
	setae %al
	movq %rax, -1240(%rbp)
	movq -1240(%rbp), %r10
	movq %r10, -1232(%rbp)
	jmp .LB21817
.LB21158:
	movq -2016(%rbp), %rax
	shrq $1, %rax
	movq %rax, -2056(%rbp)
	movq -384(%rbp), %rax
	incl %eax
	movq %rax, -1344(%rbp)
	movq -680(%rbp), %rdx
	cmpl %edx, %eax
	jl .LB21182
.LB21183:
	movq -2016(%rbp), %r10
	movq %r10, -1352(%rbp)
.LB21184:
	movq -384(%rbp), %rax
	addl $2, %eax
	movq %rax, -1360(%rbp)
	movq -680(%rbp), %rdx
	cmpl %edx, %eax
	jl .LB21252
.LB21253:
	movq -2016(%rbp), %r10
	movq %r10, -1368(%rbp)
.LB21254:
	movq -384(%rbp), %rax
	decl %eax
	movq %rax, -1464(%rbp)
	cmpl $1, %eax
	jge .LB21320
.LB21321:
	movq -2016(%rbp), %r10
	movq %r10, -1472(%rbp)
.LB21322:
	movq -384(%rbp), %rax
	subl $2, %eax
	movq %rax, -1568(%rbp)
	cmpl $1, %eax
	jge .LB21388
.LB21389:
	movq -2016(%rbp), %r10
	movq %r10, -1576(%rbp)
.LB21390:
	movq -1352(%rbp), %rax
	movq -2056(%rbp), %rdx
	cmpq %rdx, %rax
	jae .LB21456
.LB25178:
	movq $0, -1672(%rbp)
.LB21469:
	cmpq %r8, %rcx
	movq -648(%rbp), %rax
	movq -656(%rbp), %rdx
	cmova %eax, %edx
	movq %rdx, -1688(%rbp)
	movq -384(%rbp), %r10
	movq %r10, -1272(%rbp)
	movq -1688(%rbp), %r10
	movq %r10, -1280(%rbp)
	movq -2016(%rbp), %r10
	movq %r10, -1288(%rbp)
	movq -2056(%rbp), %r10
	movq %r10, -1296(%rbp)
	movq -1352(%rbp), %r10
	movq %r10, -1304(%rbp)
	movq -1368(%rbp), %r10
	movq %r10, -1312(%rbp)
	movq -1472(%rbp), %r10
	movq %r10, -1320(%rbp)
	movq -1576(%rbp), %r10
	movq %r10, -1328(%rbp)
	movq -1672(%rbp), %r10
	movq %r10, -1336(%rbp)
	jmp .LB21160
.LB21182:
	movq -816(%rbp), %r10
	movq %r10, -1352(%rbp)
	jmp .LB21184
.LB21252:
	movq -688(%rbp), %rax
	movq -384(%rbp), %rdx
	addl %edx, %eax
	movq %rax, -1376(%rbp)
	addl $2, %eax
	movq %rax, -1384(%rbp)
	movslq %eax, %rax
	movq %rax, -1392(%rbp)
	movq (%rbx,%rax,8), %rax
	movq %rax, -1400(%rbp)
	movq -696(%rbp), %rax
	movq -384(%rbp), %rdx
	addl %edx, %eax
	movq %rax, -1408(%rbp)
	addl $2, %eax
	movq %rax, -1416(%rbp)
	movslq %eax, %rax
	movq %rax, -1424(%rbp)
	movq (%rbx,%rax,8), %rax
	movq %rax, -1432(%rbp)
	movq -1400(%rbp), %rdx
	movq %rdx, %r14
	subq %rax, %r14
	movq %rax, %r15
	subq %rdx, %r15
	cmpq %rax, %rdx
	movq %r14, -1440(%rbp)
	movq %r15, -1448(%rbp)
	cmova %r14, %r15
	movq %r15, -1456(%rbp)
	movq -1456(%rbp), %r10
	movq %r10, -1368(%rbp)
	jmp .LB21254
.LB21320:
	movq -688(%rbp), %rax
	movq -384(%rbp), %rdx
	addl %edx, %eax
	movq %rax, -1480(%rbp)
	decl %eax
	movq %rax, -1488(%rbp)
	movslq %eax, %rax
	movq %rax, -1496(%rbp)
	movq (%rbx,%rax,8), %rax
	movq %rax, -1504(%rbp)
	movq -696(%rbp), %rax
	movq -384(%rbp), %rdx
	addl %edx, %eax
	movq %rax, -1512(%rbp)
	decl %eax
	movq %rax, -1520(%rbp)
	movslq %eax, %rax
	movq %rax, -1528(%rbp)
	movq (%rbx,%rax,8), %rax
	movq %rax, -1536(%rbp)
	movq -1504(%rbp), %rdx
	movq %rdx, %r14
	subq %rax, %r14
	movq %rax, %r15
	subq %rdx, %r15
	cmpq %rax, %rdx
	movq %r14, -1544(%rbp)
	movq %r15, -1552(%rbp)
	cmova %r14, %r15
	movq %r15, -1560(%rbp)
	movq -1560(%rbp), %r10
	movq %r10, -1472(%rbp)
	jmp .LB21322
.LB21388:
	movq -688(%rbp), %rax
	movq -384(%rbp), %rdx
	addl %edx, %eax
	movq %rax, -1584(%rbp)
	subl $2, %eax
	movq %rax, -1592(%rbp)
	movslq %eax, %rax
	movq %rax, -1600(%rbp)
	movq (%rbx,%rax,8), %rax
	movq %rax, -1608(%rbp)
	movq -696(%rbp), %rax
	movq -384(%rbp), %rdx
	addl %edx, %eax
	movq %rax, -1616(%rbp)
	subl $2, %eax
	movq %rax, -1624(%rbp)
	movslq %eax, %rax
	movq %rax, -1632(%rbp)
	movq (%rbx,%rax,8), %rax
	movq %rax, -1640(%rbp)
	movq -1608(%rbp), %rdx
	movq %rdx, %r14
	subq %rax, %r14
	movq %rax, %r15
	subq %rdx, %r15
	cmpq %rax, %rdx
	movq %r14, -1648(%rbp)
	movq %r15, -1656(%rbp)
	cmova %r14, %r15
	movq %r15, -1664(%rbp)
	movq -1664(%rbp), %r10
	movq %r10, -1576(%rbp)
	jmp .LB21390
.LB21456:
	movq -1368(%rbp), %rax
	movq -2056(%rbp), %rdx
	cmpq %rdx, %rax
	jae .LB21462
.LB25179:
	movq $0, -1672(%rbp)
	jmp .LB21469
.LB21462:
	movq -1472(%rbp), %rax
	movq -2056(%rbp), %rdx
	cmpq %rdx, %rax
	jae .LB21468
.LB25180:
	movq $0, -1672(%rbp)
	jmp .LB21469
.LB21468:
	xorl %eax, %eax
	movq %rax, -1680(%rbp)
	movq -1576(%rbp), %rdx
	movq -2056(%rbp), %r14
	cmpq %r14, %rdx
	setae %al
	movq %rax, -1680(%rbp)
	movq -1680(%rbp), %r10
	movq %r10, -1672(%rbp)
	jmp .LB21469
.LB21835:
	movq -384(%rbp), %rax
	incl %eax
	movq %rax, -384(%rbp)
	movq -704(%rbp), %rax
	movq -720(%rbp), %r10
	movq %r10, -392(%rbp)
	movq %r9, -400(%rbp)
	movq %rsi, -408(%rbp)
	movq %r12, -416(%rbp)
	movq -712(%rbp), %r10
	movq %r10, -424(%rbp)
	movq %r8, -432(%rbp)
	movq -2024(%rbp), %r10
	movq %r10, -440(%rbp)
	movq -2032(%rbp), %r10
	movq %r10, -448(%rbp)
	movq %rdi, -456(%rbp)
	movq %r13, -464(%rbp)
	movq -768(%rbp), %r10
	movq %r10, -472(%rbp)
	movq -864(%rbp), %r10
	movq %r10, -480(%rbp)
	movq -872(%rbp), %r10
	movq %r10, -528(%rbp)
	movq -1272(%rbp), %r10
	movq %r10, -536(%rbp)
	movq -1280(%rbp), %r10
	movq %r10, -544(%rbp)
	movq -1288(%rbp), %r10
	movq %r10, -552(%rbp)
	movq -1296(%rbp), %r10
	movq %r10, -560(%rbp)
	movq -1304(%rbp), %r10
	movq %r10, -568(%rbp)
	movq -1312(%rbp), %r10
	movq %r10, -576(%rbp)
	movq -1320(%rbp), %r10
	movq %r10, -584(%rbp)
	movq -1328(%rbp), %r10
	movq %r10, -592(%rbp)
	movq -1336(%rbp), %r10
	movq %r10, -600(%rbp)
	jmp .LB20910
.LB21063:
	movq -384(%rbp), %rax
	incl %eax
	movq %rax, -384(%rbp)
	movq -704(%rbp), %rax
	movq -720(%rbp), %r10
	movq %r10, -392(%rbp)
	movq %r9, -400(%rbp)
	movq %rsi, -408(%rbp)
	movq %r12, -416(%rbp)
	movq -712(%rbp), %r10
	movq %r10, -424(%rbp)
	movq %r8, -432(%rbp)
	movq -2024(%rbp), %r10
	movq %r10, -440(%rbp)
	movq -2032(%rbp), %r10
	movq %r10, -448(%rbp)
	movq %rdi, -456(%rbp)
	movq %r13, -464(%rbp)
	jmp .LB20910
.LB21053:
	movq -384(%rbp), %rax
	incl %eax
	movq %rax, -384(%rbp)
	movq -704(%rbp), %rax
	movq -720(%rbp), %r10
	movq %r10, -392(%rbp)
	movq %r9, -400(%rbp)
	movq %rsi, -408(%rbp)
	movq %r12, -416(%rbp)
	movq -712(%rbp), %r10
	movq %r10, -424(%rbp)
	movq %r8, -432(%rbp)
	movq -2024(%rbp), %r10
	movq %r10, -440(%rbp)
	movq -2032(%rbp), %r10
	movq %r10, -448(%rbp)
	movq %rdi, -456(%rbp)
	movq %r13, -464(%rbp)
	jmp .LB20910
	.text
	.globl raycaster__r3d_vol_scatter_rows__3__R3DSceneE1_ptr1__dataE1_sbits32__dataE1_sbits32__ret_voidE1
	.def raycaster__r3d_vol_scatter_rows__3__R3DSceneE1_ptr1__dataE1_sbits32__dataE1_sbits32__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
raycaster__r3d_vol_scatter_rows__3__R3DSceneE1_ptr1__dataE1_sbits32__dataE1_sbits32__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $1248, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
	movq %r14, -48(%rbp)
	movq %r15, -56(%rbp)
.LB16514:
	movq %rcx, %rsi
	movq %r8, -288(%rbp)
	movl 224(%rsi), %edi
	movl 228(%rsi), %eax
	movq %rax, -296(%rbp)
	movl 232(%rsi), %ecx
	movq %rcx, -280(%rbp)
	movl 376(%rsi), %ebx
	cmpl %eax, %edx
	jge .LB16580
.LB16581:
	movq %rdx, %r12
	xorl %eax, %eax
	xorl %ecx, %ecx
	xorl %edx, %edx
	movabsq $0, %r10
	movq %r10, -224(%rbp)
	xorps %xmm0, %xmm0
	xorps %xmm1, %xmm1
	movabsq $0, %r10
	movq %r10, -1168(%rbp)
	movabsq $0, %r10
	movq %r10, -1160(%rbp)
	xorps %xmm2, %xmm2
	movabsq $0, %r10
	movq %r10, -64(%rbp)
	movabsq $0, %r10
	movq %r10, -72(%rbp)
	movabsq $0, %r10
	movq %r10, -80(%rbp)
	movabsq $0, %r10
	movq %r10, -88(%rbp)
	movabsq $0, %r10
	movq %r10, -96(%rbp)
	movabsq $0, %r10
	movq %r10, -104(%rbp)
	movabsq $0, %r10
	movq %r10, -112(%rbp)
	movabsq $0, %r10
	movq %r10, -120(%rbp)
	movabsq $0, %r10
	movq %r10, -128(%rbp)
	movabsq $0, %r10
	movq %r10, -136(%rbp)
	movabsq $0, %r10
	movq %r10, -144(%rbp)
	movabsq $0, %r10
	movq %r10, -152(%rbp)
	movabsq $0, %r10
	movq %r10, -160(%rbp)
	movabsq $0, %r10
	movq %r10, -168(%rbp)
	movabsq $0, %r10
	movq %r10, -176(%rbp)
	movabsq $0, %r10
	movq %r10, -184(%rbp)
	movabsq $0, %r10
	movq %r10, -192(%rbp)
	movabsq $0, %r10
	movq %r10, -200(%rbp)
.LB16584:
	movq -296(%rbp), %r8
	cmpl %r8d, %r12d
	jge .LB16586
.LB16585:
	movsd 304(%rsi), %xmm3
	movslq %r12d, %r8
	movl %r12d, %r13d
	imull %edi, %r13d
	movl %r12d, %r14d
	shll $1, %r14d
	xorps %xmm5, %xmm5
	cvtsi2sdq %r8, %xmm5
	movsd %xmm3, -208(%rbp)
	movsd 352(%rsi), %xmm4
	movsd %xmm4, -216(%rbp)
	vfmadd231sd %xmm4, %xmm5, %xmm3
	movsd %xmm3, -232(%rbp)
	movsd 312(%rsi), %xmm3
	movsd %xmm3, -240(%rbp)
	movsd 360(%rsi), %xmm4
	movsd %xmm4, -248(%rbp)
	vfmadd231sd %xmm4, %xmm5, %xmm3
	movsd %xmm3, -256(%rbp)
	movsd 320(%rsi), %xmm3
	movsd %xmm3, -264(%rbp)
	movsd 368(%rsi), %xmm4
	movsd %xmm4, -272(%rbp)
	movq -280(%rbp), %r8
	vfmadd231sd %xmm4, %xmm5, %xmm3
	movl %r14d, %r15d
	imull %r8d, %r15d
	movq $0, -304(%rbp)
	movq -232(%rbp), %r10
	movq %r10, -312(%rbp)
	movq -256(%rbp), %r10
	movq %r10, -320(%rbp)
	movsd %xmm3, -328(%rbp)
	movsd -1168(%rbp), %xmm3
	movsd -1160(%rbp), %xmm4
	movaps %xmm2, %xmm5
	movq -64(%rbp), %r10
	movq %r10, -336(%rbp)
	movq -72(%rbp), %r10
	movq %r10, -344(%rbp)
	movq -80(%rbp), %r10
	movq %r10, -352(%rbp)
	movq -88(%rbp), %r10
	movq %r10, -360(%rbp)
	movq -96(%rbp), %r10
	movq %r10, -368(%rbp)
	movq -104(%rbp), %r10
	movq %r10, -376(%rbp)
	movq -112(%rbp), %r10
	movq %r10, -384(%rbp)
	movq -120(%rbp), %r10
	movq %r10, -392(%rbp)
	movq -128(%rbp), %r10
	movq %r10, -400(%rbp)
	movq -136(%rbp), %r10
	movq %r10, -408(%rbp)
	movq -144(%rbp), %r10
	movq %r10, -416(%rbp)
	movq -152(%rbp), %r10
	movq %r10, -424(%rbp)
	movq -160(%rbp), %r10
	movq %r10, -432(%rbp)
	movq -168(%rbp), %r10
	movq %r10, -440(%rbp)
	movq -176(%rbp), %r10
	movq %r10, -448(%rbp)
	movq -184(%rbp), %r10
	movq %r10, -456(%rbp)
	movq -192(%rbp), %r10
	movq %r10, -464(%rbp)
	movq -200(%rbp), %r10
	movq %r10, -472(%rbp)
	movaps %xmm1, %xmm2
	movaps %xmm0, %xmm1
	movsd -224(%rbp), %xmm0
.LB16632:
	movq -304(%rbp), %r8
	cmpl %edi, %r8d
	jge .LB16634
.LB16633:
	movsd -320(%rbp), %xmm0
	movsd -312(%rbp), %xmm1
	mulsd %xmm0, %xmm0
	vfmadd231sd %xmm1, %xmm1, %xmm0
	movsd -328(%rbp), %xmm1
	vfmadd231sd %xmm1, %xmm1, %xmm0
	cvtsd2ss %xmm0, %xmm0
	callq standard__math__fisr__1__floatE1__ret_floatE1
	movsd %xmm0, -560(%rbp)
	cvtss2sd %xmm0, %xmm0
	movsd -312(%rbp), %xmm1
	mulsd %xmm0, %xmm1
	movsd %xmm1, -840(%rbp)
	movsd -320(%rbp), %xmm1
	mulsd %xmm0, %xmm1
	movsd %xmm1, -808(%rbp)
	movsd -328(%rbp), %xmm2
	mulsd %xmm1, %xmm1
	mulsd %xmm2, %xmm0
	movsd %xmm0, -848(%rbp)
	movsd -840(%rbp), %xmm2
	vfmadd231sd %xmm2, %xmm2, %xmm1
	vfmadd132sd %xmm0, %xmm1, %xmm0
	xorps %xmm1, %xmm1
	movsd %xmm0, -784(%rbp)
	movq -304(%rbp), %rax
	movq 4992(%rsi), %rcx
	shll $1, %eax
	leal (%r15,%rax), %edx
	movslq %edx, %rdx
	movsd (%rcx,%rdx,8), %xmm0
	movsd %xmm0, -768(%rbp)
	movsd %xmm1, -480(%rbp)
	ucomisd %xmm1, %xmm0
	ja .LB16691
.LB16692:
	movsd 288(%rsi), %xmm0
	movsd %xmm0, -488(%rbp)
	movq -488(%rbp), %r10
	movq %r10, -496(%rbp)
.LB16693:
	movsd 264(%rsi), %xmm0
	movsd %xmm0, -520(%rbp)
	movsd 272(%rsi), %xmm1
	movsd %xmm1, -528(%rbp)
	movsd -808(%rbp), %xmm2
	mulsd %xmm2, %xmm1
	movsd %xmm1, -536(%rbp)
	movsd -840(%rbp), %xmm2
	vfmadd132sd %xmm2, %xmm1, %xmm0
	movsd %xmm0, -544(%rbp)
	movsd 280(%rsi), %xmm1
	movsd %xmm1, -552(%rbp)
	movsd -848(%rbp), %xmm2
	vfmadd231sd %xmm2, %xmm1, %xmm0
	movabsq $4547007122018943789, %r10
	movq %r10, %xmm1
	movsd %xmm0, -776(%rbp)
	movsd %xmm1, -568(%rbp)
	ucomisd %xmm1, %xmm0
	ja .LB16723
.LB16724:
	movq -496(%rbp), %r10
	movq %r10, -576(%rbp)
.LB16725:
	xorl %edx, %edx
	movabsq $0, %r10
	movq %r10, -592(%rbp)
	movabsq $0, %r10
	movq %r10, -600(%rbp)
	movabsq $0, %r10
	movq %r10, -608(%rbp)
	movq -368(%rbp), %r10
	movq %r10, -616(%rbp)
	movq -376(%rbp), %r10
	movq %r10, -624(%rbp)
	movq -384(%rbp), %r10
	movq %r10, -632(%rbp)
	movq -392(%rbp), %r10
	movq %r10, -640(%rbp)
	movq -400(%rbp), %r10
	movq %r10, -648(%rbp)
	movq -408(%rbp), %r10
	movq %r10, -656(%rbp)
	movq -416(%rbp), %r10
	movq %r10, -664(%rbp)
	movq -424(%rbp), %r10
	movq %r10, -672(%rbp)
	movq -432(%rbp), %r10
	movq %r10, -680(%rbp)
	movq -440(%rbp), %r10
	movq %r10, -688(%rbp)
	movq -456(%rbp), %r10
	movq %r10, -696(%rbp)
	movq -464(%rbp), %r10
	movq %r10, -704(%rbp)
	movq -472(%rbp), %r10
	movq %r10, -712(%rbp)
.LB16729:
	cmpl %ebx, %edx
	jge .LB16731
.LB16730:
	movslq %edx, %rcx
	movsd 384(%rsi,%rcx,8), %xmm0
	movsd %xmm0, -1208(%rbp)
	movsd 896(%rsi,%rcx,8), %xmm1
	movsd 1408(%rsi,%rcx,8), %xmm2
	movsd -808(%rbp), %xmm3
	mulsd %xmm1, %xmm3
	movsd %xmm3, -792(%rbp)
	movsd -840(%rbp), %xmm4
	vfmadd132sd %xmm4, %xmm3, %xmm0
	movsd %xmm0, -800(%rbp)
	movsd -848(%rbp), %xmm3
	vfmadd231sd %xmm2, %xmm3, %xmm0
	xorps %xmm3, %xmm3
	movsd %xmm3, -816(%rbp)
	ucomisd %xmm0, %xmm3
	ja .LB16767
.LB16768:
	movsd %xmm0, -824(%rbp)
.LB16769:
	movsd -824(%rbp), %xmm3
	movsd -576(%rbp), %xmm4
	ucomisd %xmm4, %xmm3
	ja .LB16773
.LB16774:
	movq -824(%rbp), %r10
	movq %r10, -832(%rbp)
.LB16775:
	movsd -832(%rbp), %xmm3
	ucomisd %xmm0, %xmm3
	sete %cl
	setnp %r8b
	movzbl %cl, %ecx
	movzbl %r8b, %r8d
	andl %r8d, %ecx
	testb %cl, %cl
	jne .LB16780
.LB16781:
	movsd -832(%rbp), %xmm3
	movsd -840(%rbp), %xmm4
	mulsd %xmm3, %xmm4
	movsd %xmm4, -1176(%rbp)
	movsd -808(%rbp), %xmm4
	mulsd %xmm3, %xmm4
	movsd %xmm4, -1184(%rbp)
	movsd -848(%rbp), %xmm4
	mulsd %xmm4, %xmm3
	movsd %xmm3, -856(%rbp)
	movsd -1208(%rbp), %xmm3
	movsd -1176(%rbp), %xmm4
	subsd %xmm4, %xmm3
	movsd %xmm3, -864(%rbp)
	movsd -1184(%rbp), %xmm4
	movaps %xmm4, %xmm15
	movaps %xmm1, %xmm4
	subsd %xmm15, %xmm4
	movsd %xmm4, -872(%rbp)
	mulsd %xmm4, %xmm4
	movsd %xmm4, -880(%rbp)
	vfmadd132sd %xmm3, %xmm4, %xmm3
	movsd %xmm3, -888(%rbp)
	movsd -856(%rbp), %xmm4
	movaps %xmm4, %xmm15
	movaps %xmm2, %xmm4
	subsd %xmm15, %xmm4
	movsd %xmm4, -896(%rbp)
	vfmadd231sd %xmm4, %xmm4, %xmm3
	movsd %xmm3, -904(%rbp)
	movq -1176(%rbp), %r10
	movq %r10, -992(%rbp)
	movq -1184(%rbp), %r10
	movq %r10, -1016(%rbp)
	movq -856(%rbp), %r10
	movq %r10, -912(%rbp)
	movq -904(%rbp), %r10
	movq %r10, -920(%rbp)
.LB16782:
	movslq %edx, %rcx
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm4
	movsd 3456(%rsi,%rcx,8), %xmm3
	movsd %xmm3, -944(%rbp)
	movabsq $4605380978949069210, %r10
	movq %r10, %xmm3
	movsd %xmm3, -952(%rbp)
	movsd %xmm4, -960(%rbp)
	movsd -920(%rbp), %xmm5
	vfmadd132sd %xmm5, %xmm4, %xmm3
	movsd %xmm3, -968(%rbp)
	movsd -944(%rbp), %xmm4
	movaps %xmm3, %xmm15
	movaps %xmm4, %xmm3
	divsd %xmm15, %xmm3
	movabsq $4611686018427387904, %r10
	movq %r10, %xmm4
	movsd %xmm3, -976(%rbp)
	mulsd %xmm4, %xmm3
	movsd %xmm4, -984(%rbp)
	movabsq $4557750909289998844, %r10
	movq %r10, %xmm4
	movsd %xmm4, -1000(%rbp)
	ucomisd %xmm3, %xmm4
	ja .LB16847
.LB16848:
	movsd 296(%rsi), %xmm4
	movsd %xmm4, -1008(%rbp)
	movsd -832(%rbp), %xmm5
	mulsd %xmm5, %xmm4
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm5
	movsd %xmm5, -1024(%rbp)
	addsd %xmm4, %xmm5
	movsd %xmm5, -1032(%rbp)
	divsd %xmm5, %xmm4
	movsd %xmm4, -1040(%rbp)
	movsd 3968(%rsi,%rcx,8), %xmm5
	movsd %xmm5, -1216(%rbp)
	ucomisd %xmm4, %xmm5
	ja .LB16875
.LB16876:
	movq -1040(%rbp), %r10
	movq %r10, -1048(%rbp)
.LB16877:
	movsd -1048(%rbp), %xmm4
	movabsq $4557750909289998844, %r10
	movq %r10, %xmm5
	mulsd %xmm3, %xmm4
	movsd %xmm4, -1056(%rbp)
	movsd %xmm5, -1064(%rbp)
	ucomisd %xmm4, %xmm5
	ja .LB16884
.LB16885:
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm4
	movsd %xmm4, -1072(%rbp)
	movsd -1056(%rbp), %xmm5
	ucomisd %xmm4, %xmm5
	ja .LB16891
.LB16892:
	movq -1056(%rbp), %r10
	movq %r10, -1080(%rbp)
.LB16893:
	movslq %edx, %rcx
	movsd 1920(%rsi,%rcx,8), %xmm4
	movsd %xmm4, -1088(%rbp)
	movsd -1080(%rbp), %xmm5
	mulsd %xmm5, %xmm4
	movsd %xmm4, -1096(%rbp)
	movsd -592(%rbp), %xmm5
	addsd %xmm5, %xmm4
	movsd %xmm4, -1104(%rbp)
	movsd 2432(%rsi,%rcx,8), %xmm4
	movsd %xmm4, -1112(%rbp)
	movsd -1080(%rbp), %xmm5
	mulsd %xmm5, %xmm4
	movsd %xmm4, -1120(%rbp)
	movsd -600(%rbp), %xmm5
	addsd %xmm5, %xmm4
	movsd %xmm4, -1128(%rbp)
	movsd 2944(%rsi,%rcx,8), %xmm4
	movsd %xmm4, -1136(%rbp)
	movsd -1080(%rbp), %xmm5
	mulsd %xmm5, %xmm4
	movsd %xmm4, -1144(%rbp)
	movsd -608(%rbp), %xmm5
	addsd %xmm5, %xmm4
	movsd %xmm4, -1152(%rbp)
	incl %edx
	movq -1104(%rbp), %r10
	movq %r10, -592(%rbp)
	movq -1128(%rbp), %r10
	movq %r10, -600(%rbp)
	movq -1152(%rbp), %r10
	movq %r10, -608(%rbp)
	movq -1208(%rbp), %r10
	movq %r10, -616(%rbp)
	movsd %xmm1, -624(%rbp)
	movsd %xmm2, -632(%rbp)
	movq -832(%rbp), %r10
	movq %r10, -640(%rbp)
	movsd %xmm0, -648(%rbp)
	movq -992(%rbp), %r10
	movq %r10, -656(%rbp)
	movq -1016(%rbp), %r10
	movq %r10, -664(%rbp)
	movq -912(%rbp), %r10
	movq %r10, -672(%rbp)
	movq -920(%rbp), %r10
	movq %r10, -680(%rbp)
	movq -1080(%rbp), %r10
	movq %r10, -688(%rbp)
	movq -1216(%rbp), %r10
	movq %r10, -696(%rbp)
	movq -1048(%rbp), %r10
	movq %r10, -704(%rbp)
	movsd %xmm3, -712(%rbp)
	cmpl %ebx, %edx
	jl .LB16730
	jmp .LB16731
.LB16586:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB16634:
	movq -288(%rbp), %r8
	addl %r8d, %r12d
	movsd %xmm0, -224(%rbp)
	movaps %xmm1, %xmm0
	movaps %xmm2, %xmm1
	movsd %xmm3, -1168(%rbp)
	movsd %xmm4, -1160(%rbp)
	movaps %xmm5, %xmm2
	movq -336(%rbp), %r10
	movq %r10, -64(%rbp)
	movq -344(%rbp), %r10
	movq %r10, -72(%rbp)
	movq -352(%rbp), %r10
	movq %r10, -80(%rbp)
	movq -360(%rbp), %r10
	movq %r10, -88(%rbp)
	movq -368(%rbp), %r10
	movq %r10, -96(%rbp)
	movq -376(%rbp), %r10
	movq %r10, -104(%rbp)
	movq -384(%rbp), %r10
	movq %r10, -112(%rbp)
	movq -392(%rbp), %r10
	movq %r10, -120(%rbp)
	movq -400(%rbp), %r10
	movq %r10, -128(%rbp)
	movq -408(%rbp), %r10
	movq %r10, -136(%rbp)
	movq -416(%rbp), %r10
	movq %r10, -144(%rbp)
	movq -424(%rbp), %r10
	movq %r10, -152(%rbp)
	movq -432(%rbp), %r10
	movq %r10, -160(%rbp)
	movq -440(%rbp), %r10
	movq %r10, -168(%rbp)
	movq -448(%rbp), %r10
	movq %r10, -176(%rbp)
	movq -456(%rbp), %r10
	movq %r10, -184(%rbp)
	movq -464(%rbp), %r10
	movq %r10, -192(%rbp)
	movq -472(%rbp), %r10
	movq %r10, -200(%rbp)
	jmp .LB16584
.LB16691:
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm0
	movsd %xmm0, -504(%rbp)
	movsd -768(%rbp), %xmm1
	divsd %xmm1, %xmm0
	movsd %xmm0, -512(%rbp)
	movq -512(%rbp), %r10
	movq %r10, -496(%rbp)
	jmp .LB16693
.LB16723:
	movsd -496(%rbp), %xmm0
	movsd -776(%rbp), %xmm1
	divsd %xmm1, %xmm0
	movsd %xmm0, -584(%rbp)
	movq -584(%rbp), %r10
	movq %r10, -576(%rbp)
	jmp .LB16725
.LB16731:
	movq 5008(%rsi), %rcx
	movq -304(%rbp), %r8
	movsd -592(%rbp), %xmm0
	addl %r13d, %r8d
	movslq %r8d, %r8
	movsd %xmm0, (%rcx,%r8,8)
	movq 5016(%rsi), %rcx
	movsd -600(%rbp), %xmm0
	movsd %xmm0, (%rcx,%r8,8)
	movq 5024(%rsi), %rcx
	movsd -608(%rbp), %xmm0
	movsd %xmm0, (%rcx,%r8,8)
	movq 5032(%rsi), %rcx
	movsd -576(%rbp), %xmm0
	movsd %xmm0, (%rcx,%r8,8)
	movsd 328(%rsi), %xmm0
	movsd %xmm0, -720(%rbp)
	movsd -312(%rbp), %xmm1
	addsd %xmm1, %xmm0
	movsd %xmm0, -728(%rbp)
	movsd 336(%rsi), %xmm0
	movsd %xmm0, -736(%rbp)
	movsd -320(%rbp), %xmm1
	addsd %xmm1, %xmm0
	movsd %xmm0, -744(%rbp)
	movsd 344(%rsi), %xmm0
	movsd %xmm0, -752(%rbp)
	movsd -328(%rbp), %xmm1
	addsd %xmm1, %xmm0
	movsd %xmm0, -760(%rbp)
	movq -304(%rbp), %rcx
	incl %ecx
	movq %rcx, -304(%rbp)
	movq %rax, %rcx
	movq -728(%rbp), %r10
	movq %r10, -312(%rbp)
	movq -744(%rbp), %r10
	movq %r10, -320(%rbp)
	movq -760(%rbp), %r10
	movq %r10, -328(%rbp)
	movsd -840(%rbp), %xmm0
	movsd -808(%rbp), %xmm1
	movsd -848(%rbp), %xmm2
	movsd -560(%rbp), %xmm3
	movsd -592(%rbp), %xmm4
	movsd -600(%rbp), %xmm5
	movq -608(%rbp), %r10
	movq %r10, -336(%rbp)
	movq -576(%rbp), %r10
	movq %r10, -344(%rbp)
	movq -776(%rbp), %r10
	movq %r10, -352(%rbp)
	movq -784(%rbp), %r10
	movq %r10, -360(%rbp)
	movq -616(%rbp), %r10
	movq %r10, -368(%rbp)
	movq -624(%rbp), %r10
	movq %r10, -376(%rbp)
	movq -632(%rbp), %r10
	movq %r10, -384(%rbp)
	movq -640(%rbp), %r10
	movq %r10, -392(%rbp)
	movq -648(%rbp), %r10
	movq %r10, -400(%rbp)
	movq -656(%rbp), %r10
	movq %r10, -408(%rbp)
	movq -664(%rbp), %r10
	movq %r10, -416(%rbp)
	movq -672(%rbp), %r10
	movq %r10, -424(%rbp)
	movq -680(%rbp), %r10
	movq %r10, -432(%rbp)
	movq -688(%rbp), %r10
	movq %r10, -440(%rbp)
	movq -768(%rbp), %r10
	movq %r10, -448(%rbp)
	movq -696(%rbp), %r10
	movq %r10, -456(%rbp)
	movq -704(%rbp), %r10
	movq %r10, -464(%rbp)
	movq -712(%rbp), %r10
	movq %r10, -472(%rbp)
	movq %r14, %rax
	jmp .LB16632
.LB16767:
	movabsq $0, %r10
	movq %r10, -824(%rbp)
	jmp .LB16769
.LB16773:
	movq -576(%rbp), %r10
	movq %r10, -832(%rbp)
	jmp .LB16775
.LB16780:
	movslq %edx, %rcx
	movabsq $4611686018427387904, %r10
	movq %r10, %xmm4
	movsd 4480(%rsi,%rcx,8), %xmm3
	movsd %xmm3, -1200(%rbp)
	movsd -832(%rbp), %xmm3
	mulsd %xmm3, %xmm3
	movsd %xmm3, -1192(%rbp)
	movsd %xmm4, -928(%rbp)
	movsd -784(%rbp), %xmm5
	subsd %xmm5, %xmm4
	movsd %xmm4, -936(%rbp)
	movsd -1200(%rbp), %xmm5
	vfnmadd132sd %xmm4, %xmm5, %xmm3
	xorps %xmm4, %xmm4
	ucomisd %xmm3, %xmm4
	ja .LB16798
.LB16799:
.LB16800:
	movq -656(%rbp), %r10
	movq %r10, -992(%rbp)
	movq -664(%rbp), %r10
	movq %r10, -1016(%rbp)
	movq -672(%rbp), %r10
	movq %r10, -912(%rbp)
	movsd %xmm3, -920(%rbp)
	jmp .LB16782
.LB16798:
	xorps %xmm3, %xmm3
	jmp .LB16800
.LB16875:
	movq -1216(%rbp), %r10
	movq %r10, -1048(%rbp)
	jmp .LB16877
.LB16891:
	movabsq $4607182418800017408, %r10
	movq %r10, -1080(%rbp)
	jmp .LB16893
.LB16884:
	incl %edx
	movq -1208(%rbp), %r10
	movq %r10, -616(%rbp)
	movsd %xmm1, -624(%rbp)
	movsd %xmm2, -632(%rbp)
	movq -832(%rbp), %r10
	movq %r10, -640(%rbp)
	movsd %xmm0, -648(%rbp)
	movq -992(%rbp), %r10
	movq %r10, -656(%rbp)
	movq -1016(%rbp), %r10
	movq %r10, -664(%rbp)
	movq -912(%rbp), %r10
	movq %r10, -672(%rbp)
	movq -920(%rbp), %r10
	movq %r10, -680(%rbp)
	movq -1056(%rbp), %r10
	movq %r10, -688(%rbp)
	movq -1216(%rbp), %r10
	movq %r10, -696(%rbp)
	movq -1048(%rbp), %r10
	movq %r10, -704(%rbp)
	movsd %xmm3, -712(%rbp)
	cmpl %ebx, %edx
	jl .LB16730
	jmp .LB16731
.LB16847:
	incl %edx
	movq -1208(%rbp), %r10
	movq %r10, -616(%rbp)
	movsd %xmm1, -624(%rbp)
	movsd %xmm2, -632(%rbp)
	movq -832(%rbp), %r10
	movq %r10, -640(%rbp)
	movsd %xmm0, -648(%rbp)
	movq -992(%rbp), %r10
	movq %r10, -656(%rbp)
	movq -1016(%rbp), %r10
	movq %r10, -664(%rbp)
	movq -912(%rbp), %r10
	movq %r10, -672(%rbp)
	movq -920(%rbp), %r10
	movq %r10, -680(%rbp)
	movq -976(%rbp), %r10
	movq %r10, -688(%rbp)
	movsd %xmm3, -712(%rbp)
	cmpl %ebx, %edx
	jl .LB16730
	jmp .LB16731
.LB16580:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
	.text
	.globl raycaster__r3d_fog_blend_rows__3__R3DSceneE1_ptr1__dataE1_sbits32__dataE1_sbits32__ret_voidE1
	.def raycaster__r3d_fog_blend_rows__3__R3DSceneE1_ptr1__dataE1_sbits32__dataE1_sbits32__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
raycaster__r3d_fog_blend_rows__3__R3DSceneE1_ptr1__dataE1_sbits32__dataE1_sbits32__ret_voidE1:
	subq $1168, %rsp
	movq %rbx, 1152(%rsp)
	movq %rsi, 1144(%rsp)
	movq %rdi, 1136(%rsp)
	movq %r12, 1128(%rsp)
	movq %r13, 1120(%rsp)
	movq %r14, 1112(%rsp)
	movq %r15, 1104(%rsp)
.LB17037:
	movq %r8, 952(%rsp)
	movl 5048(%rcx), %eax
	movl 5052(%rcx), %esi
	movq %rsi, 1024(%rsp)
	movsd 5056(%rcx), %xmm0
	movsd %xmm0, 296(%rsp)
	movsd 5064(%rcx), %xmm0
	movsd %xmm0, 320(%rsp)
	movsd 5072(%rcx), %xmm0
	movsd %xmm0, 352(%rsp)
	movsd 5080(%rcx), %xmm0
	movsd %xmm0, (%rsp)
	movq 5096(%rcx), %rsi
	movq 5104(%rcx), %rdi
	movq 5112(%rcx), %r8
	movq 5120(%rcx), %r9
	movq %r9, 24(%rsp)
	movq 5128(%rcx), %r9
	movl 5040(%rcx), %ecx
	testl %ecx, %ecx
	je .LB17119
.LB17120:
	cmpl $1, %ecx
	je .LB17265
.LB17266:
	movq %rdx, 944(%rsp)
	xorps %xmm0, %xmm0
	xorps %xmm1, %xmm1
	xorps %xmm2, %xmm2
	xorps %xmm3, %xmm3
	xorl %ecx, %ecx
	xorl %edx, %edx
	xorl %ebx, %ebx
	movq $0, 1096(%rsp)
	movq $0, 1088(%rsp)
	movq $0, 1080(%rsp)
.LB17381:
	movq 944(%rsp), %r12
	movq 1024(%rsp), %r13
	cmpl %r13d, %r12d
	jge .LB17383
.LB17382:
	movq 944(%rsp), %r12
	imull %eax, %r12d
	movq %r12, 1072(%rsp)
	movq %rdx, 1064(%rsp)
	movq %rbx, 1056(%rsp)
	movq 1096(%rsp), %r10
	movq %r10, 1048(%rsp)
	movq 1088(%rsp), %r10
	movq %r10, 1040(%rsp)
	movq 1080(%rsp), %r10
	movq %r10, 1032(%rsp)
	movq 1072(%rsp), %rdx
	movq %rcx, %rbx
	xorl %ecx, %ecx
.LB17390:
	cmpl %eax, %ecx
	jge .LB17392
.LB17391:
	movslq %edx, %r12
	movq 24(%rsp), %r13
	movsd (%r13,%r12,8), %xmm3
	xorps %xmm0, %xmm0
	ucomisd %xmm0, %xmm3
	ja .LB17402
.LB17403:
	movsd 0(%rsp), %xmm0
.LB17404:
	movsd 352(%rsp), %xmm1
	movaps %xmm1, %xmm2
	mulsd %xmm0, %xmm2
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm1
	addsd %xmm2, %xmm1
	movaps %xmm1, %xmm15
	movaps %xmm2, %xmm1
	divsd %xmm15, %xmm1
	movabsq $4562254508917369340, %r10
	movq %r10, %xmm4
	movsd %xmm4, 1016(%rsp)
	ucomisd %xmm4, %xmm1
	ja .LB17418
.LB17419:
	movq 1064(%rsp), %r12
	movq 1056(%rsp), %r10
	movq %r10, 1008(%rsp)
	movq 1048(%rsp), %r10
	movq %r10, 1000(%rsp)
	movq 1040(%rsp), %r10
	movq %r10, 992(%rsp)
	movq 1032(%rsp), %r10
	movq %r10, 984(%rsp)
.LB17420:
	incl %edx
	incl %ecx
	movq %r12, 1064(%rsp)
	movq 1008(%rsp), %r10
	movq %r10, 1056(%rsp)
	movq 1000(%rsp), %r10
	movq %r10, 1048(%rsp)
	movq 992(%rsp), %r10
	movq %r10, 1040(%rsp)
	movq 984(%rsp), %r10
	movq %r10, 1032(%rsp)
	cmpl %eax, %ecx
	jl .LB17391
	jmp .LB17392
.LB17383:
	movq 1152(%rsp), %rbx
	movq 1144(%rsp), %rsi
	movq 1136(%rsp), %rdi
	movq 1128(%rsp), %r12
	movq 1120(%rsp), %r13
	movq 1112(%rsp), %r14
	movq 1104(%rsp), %r15
	addq $1168, %rsp
	ret
.LB17392:
	movq 944(%rsp), %rcx
	movq 952(%rsp), %rdx
	addl %edx, %ecx
	movq %rcx, 944(%rsp)
	movq %rbx, %rcx
	movq 1064(%rsp), %rdx
	movq 1056(%rsp), %rbx
	movq 1048(%rsp), %r10
	movq %r10, 1096(%rsp)
	movq 1040(%rsp), %r10
	movq %r10, 1088(%rsp)
	movq 1032(%rsp), %r10
	movq %r10, 1080(%rsp)
	jmp .LB17381
.LB17402:
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm0
	divsd %xmm3, %xmm0
	jmp .LB17404
.LB17418:
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm4
	movsd %xmm4, 976(%rsp)
	ucomisd %xmm4, %xmm1
	ja .LB17423
.LB17424:
.LB17425:
	movabsq $4679240012837945344, %r10
	movq %r10, %xmm4
	movslq %edx, %r13
	movl $65536, %r12d
	leaq (%r9,%r13,8), %r13
	movsd %xmm4, 968(%rsp)
	mulsd %xmm1, %xmm4
	movsd %xmm4, 960(%rsp)
	cvttsd2siq %xmm4, %rbx
	movq %r13, 32(%rsp)
	movq (%r13), %r13
	subq %rbx, %r12
	movq %r13, %r14
	shrq $32, %r14
	movq %r14, 936(%rsp)
	andq $65535, %r14
	movq %r14, 928(%rsp)
	imulq %r12, %r14
	movq %rsi, %r15
	imulq %rbx, %r15
	movq %r14, 920(%rsp)
	addq %r15, %r14
	movq %r15, 912(%rsp)
	movq %r14, 904(%rsp)
	shrq $16, %r14
	movq %r14, 896(%rsp)
	movq %r13, %r14
	shrq $16, %r14
	movq %r14, 888(%rsp)
	andq $65535, %r14
	movq %r14, 880(%rsp)
	imulq %r12, %r14
	movq %rdi, %r15
	imulq %rbx, %r15
	movq %r14, 872(%rsp)
	addq %r15, %r14
	movq %r15, 864(%rsp)
	movq %r14, 856(%rsp)
	shrq $16, %r14
	movq %r14, 848(%rsp)
	movq %r13, %r14
	andq $65535, %r14
	movq %r14, 840(%rsp)
	imulq %r12, %r14
	movq %r8, %r15
	imulq %rbx, %r15
	movq %r14, 832(%rsp)
	addq %r15, %r14
	movq %r15, 824(%rsp)
	movq %r14, 816(%rsp)
	shrq $16, %r14
	movq %r14, 808(%rsp)
	movq 896(%rsp), %r14
	shlq $32, %r14
	movq %r14, 800(%rsp)
	movabsq $-281474976710656, %r15
	movq %r15, 792(%rsp)
	orq %r15, %r14
	movq %r14, 784(%rsp)
	movq 848(%rsp), %r15
	shlq $16, %r15
	movq %r15, 776(%rsp)
	orq %r15, %r14
	movq %r14, 768(%rsp)
	movq 808(%rsp), %r15
	orq %r15, %r14
	movq %r14, 760(%rsp)
	movq 32(%rsp), %r15
	movq %r14, (%r15)
	movq %r13, 1008(%rsp)
	movq 896(%rsp), %r10
	movq %r10, 1000(%rsp)
	movq 848(%rsp), %r10
	movq %r10, 992(%rsp)
	movq 808(%rsp), %r10
	movq %r10, 984(%rsp)
	jmp .LB17420
.LB17423:
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm1
	jmp .LB17425
.LB17265:
	movq %rdx, 712(%rsp)
	xorps %xmm0, %xmm0
	xorps %xmm1, %xmm1
	xorps %xmm2, %xmm2
	xorl %ecx, %ecx
	xorl %edx, %edx
	xorl %ebx, %ebx
	xorl %r12d, %r12d
	xorl %r13d, %r13d
	movq $0, 752(%rsp)
.LB17268:
	movq 712(%rsp), %r14
	movq 1024(%rsp), %r15
	cmpl %r15d, %r14d
	jge .LB17270
.LB17269:
	movq 712(%rsp), %r14
	imull %eax, %r14d
	movq %r14, 744(%rsp)
	movq %r12, 736(%rsp)
	movq %r13, 728(%rsp)
	movq 752(%rsp), %r10
	movq %r10, 720(%rsp)
	movq %rdx, %r12
	movq %rbx, %r13
	movq 744(%rsp), %rdx
	movq %rcx, %rbx
	xorl %ecx, %ecx
.LB17277:
	cmpl %eax, %ecx
	jge .LB17279
.LB17278:
	movslq %edx, %r14
	movq 24(%rsp), %r15
	movsd (%r15,%r14,8), %xmm2
	xorps %xmm0, %xmm0
	ucomisd %xmm0, %xmm2
	ja .LB17289
.LB17290:
	movsd 0(%rsp), %xmm0
.LB17291:
	movsd 320(%rsp), %xmm1
	movsd 296(%rsp), %xmm3
	movaps %xmm1, %xmm15
	movaps %xmm0, %xmm1
	subsd %xmm15, %xmm1
	mulsd %xmm3, %xmm1
	movabsq $4562254508917369340, %r10
	movq %r10, %xmm3
	movsd %xmm3, 704(%rsp)
	ucomisd %xmm3, %xmm1
	ja .LB17303
.LB17304:
	movq 736(%rsp), %r14
	movq 728(%rsp), %r10
	movq %r10, 696(%rsp)
	movq 720(%rsp), %r10
	movq %r10, 688(%rsp)
.LB17305:
	incl %edx
	incl %ecx
	movq %r14, 736(%rsp)
	movq 696(%rsp), %r10
	movq %r10, 728(%rsp)
	movq 688(%rsp), %r10
	movq %r10, 720(%rsp)
	cmpl %eax, %ecx
	jl .LB17278
	jmp .LB17279
.LB17270:
	movq 1152(%rsp), %rbx
	movq 1144(%rsp), %rsi
	movq 1136(%rsp), %rdi
	movq 1128(%rsp), %r12
	movq 1120(%rsp), %r13
	movq 1112(%rsp), %r14
	movq 1104(%rsp), %r15
	addq $1168, %rsp
	ret
.LB17279:
	movq 712(%rsp), %rcx
	movq 952(%rsp), %rdx
	addl %edx, %ecx
	movq %rcx, 712(%rsp)
	movq %rbx, %rcx
	movq %r12, %rdx
	movq %r13, %rbx
	movq 736(%rsp), %r12
	movq 728(%rsp), %r13
	movq 720(%rsp), %r10
	movq %r10, 752(%rsp)
	jmp .LB17268
.LB17289:
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm0
	divsd %xmm2, %xmm0
	jmp .LB17291
.LB17303:
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm3
	movsd %xmm3, 680(%rsp)
	ucomisd %xmm3, %xmm1
	ja .LB17308
.LB17309:
.LB17310:
	movabsq $4679240012837945344, %r10
	movq %r10, %xmm3
	movslq %edx, %r13
	movl $65536, %r12d
	leaq (%r9,%r13,8), %r13
	movsd %xmm3, 672(%rsp)
	mulsd %xmm1, %xmm3
	movsd %xmm3, 664(%rsp)
	cvttsd2siq %xmm3, %rbx
	movq %r13, 16(%rsp)
	movq (%r13), %r13
	subq %rbx, %r12
	movq %r13, %r14
	shrq $32, %r14
	movq %r14, 656(%rsp)
	andq $65535, %r14
	movq %r14, 648(%rsp)
	imulq %r12, %r14
	movq %rsi, %r15
	imulq %rbx, %r15
	movq %r14, 640(%rsp)
	addq %r15, %r14
	movq %r15, 632(%rsp)
	movq %r14, 624(%rsp)
	shrq $16, %r14
	movq %r14, 616(%rsp)
	movq %r13, %r14
	shrq $16, %r14
	movq %r14, 608(%rsp)
	andq $65535, %r14
	movq %r14, 600(%rsp)
	imulq %r12, %r14
	movq %rdi, %r15
	imulq %rbx, %r15
	movq %r14, 592(%rsp)
	addq %r15, %r14
	movq %r15, 584(%rsp)
	movq %r14, 576(%rsp)
	shrq $16, %r14
	movq %r14, 568(%rsp)
	movq %r13, %r14
	andq $65535, %r14
	movq %r14, 560(%rsp)
	imulq %r12, %r14
	movq %r8, %r15
	imulq %rbx, %r15
	movq %r14, 552(%rsp)
	addq %r15, %r14
	movq %r15, 544(%rsp)
	movq %r14, 536(%rsp)
	shrq $16, %r14
	movq %r14, 528(%rsp)
	movq 616(%rsp), %r14
	shlq $32, %r14
	movq %r14, 520(%rsp)
	movabsq $-281474976710656, %r15
	movq %r15, 512(%rsp)
	orq %r15, %r14
	movq %r14, 504(%rsp)
	movq 568(%rsp), %r15
	shlq $16, %r15
	movq %r15, 496(%rsp)
	orq %r15, %r14
	movq %r14, 488(%rsp)
	movq 528(%rsp), %r15
	orq %r15, %r14
	movq %r14, 480(%rsp)
	movq 16(%rsp), %r15
	movq %r14, (%r15)
	movq 616(%rsp), %r14
	movq 568(%rsp), %r10
	movq %r10, 696(%rsp)
	movq 528(%rsp), %r10
	movq %r10, 688(%rsp)
	jmp .LB17305
.LB17308:
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm1
	jmp .LB17310
.LB17119:
	movq %rdx, 368(%rsp)
	xorps %xmm0, %xmm0
	xorps %xmm1, %xmm1
	movabsq $0, %r10
	movq %r10, 472(%rsp)
	movabsq $0, %r10
	movq %r10, 464(%rsp)
	movabsq $0, %r10
	movq %r10, 456(%rsp)
	movabsq $0, %r10
	movq %r10, 448(%rsp)
	xorl %ecx, %ecx
	xorl %edx, %edx
	xorl %ebx, %ebx
	xorl %r12d, %r12d
	xorl %r13d, %r13d
	movq $0, 440(%rsp)
.LB17123:
	movq 368(%rsp), %r14
	movq 1024(%rsp), %r15
	cmpl %r15d, %r14d
	jge .LB17125
.LB17124:
	movq 368(%rsp), %r14
	imull %eax, %r14d
	movq %r14, 432(%rsp)
	movq 472(%rsp), %r10
	movq %r10, 424(%rsp)
	movq 464(%rsp), %r10
	movq %r10, 416(%rsp)
	movq 456(%rsp), %r10
	movq %r10, 408(%rsp)
	movq 448(%rsp), %r10
	movq %r10, 400(%rsp)
	movq %r12, 392(%rsp)
	movq %r13, 384(%rsp)
	movq 440(%rsp), %r10
	movq %r10, 376(%rsp)
	movq %rdx, %r12
	movq %rbx, %r13
	movq 432(%rsp), %rdx
	movq %rcx, %rbx
	xorl %ecx, %ecx
.LB17132:
	cmpl %eax, %ecx
	jge .LB17134
.LB17133:
	movslq %edx, %r14
	movq 24(%rsp), %r15
	movsd (%r15,%r14,8), %xmm0
	xorps %xmm1, %xmm1
	ucomisd %xmm1, %xmm0
	ja .LB17144
.LB17145:
	movsd 0(%rsp), %xmm1
.LB17146:
	movsd 320(%rsp), %xmm2
	movaps %xmm2, %xmm15
	movaps %xmm1, %xmm2
	subsd %xmm15, %xmm2
	movsd %xmm2, 360(%rsp)
	movsd 296(%rsp), %xmm3
	mulsd %xmm3, %xmm2
	xorps %xmm3, %xmm3
	movsd %xmm3, 344(%rsp)
	ucomisd %xmm3, %xmm2
	ja .LB17158
.LB17159:
	movsd %xmm2, 8(%rsp)
	movabsq $0, %r10
	movq %r10, 336(%rsp)
.LB17160:
	movsd 352(%rsp), %xmm2
	mulsd %xmm1, %xmm2
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm3
	movsd %xmm3, 312(%rsp)
	addsd %xmm2, %xmm3
	movsd %xmm3, 304(%rsp)
	movaps %xmm3, %xmm15
	movaps %xmm2, %xmm3
	divsd %xmm15, %xmm3
	movsd 336(%rsp), %xmm4
	ucomisd %xmm4, %xmm3
	ja .LB17177
.LB17178:
	movq 336(%rsp), %r10
	movq %r10, 288(%rsp)
.LB17179:
	movabsq $4562254508917369340, %r10
	movq %r10, %xmm4
	movsd %xmm4, 280(%rsp)
	movsd 288(%rsp), %xmm5
	ucomisd %xmm4, %xmm5
	ja .LB17183
.LB17184:
	movq 288(%rsp), %r10
	movq %r10, 272(%rsp)
	movq 392(%rsp), %r14
	movq 384(%rsp), %r10
	movq %r10, 264(%rsp)
	movq 376(%rsp), %r10
	movq %r10, 256(%rsp)
.LB17185:
	incl %edx
	incl %ecx
	movsd %xmm3, 424(%rsp)
	movq 272(%rsp), %r10
	movq %r10, 416(%rsp)
	movsd %xmm2, 408(%rsp)
	movsd %xmm0, 400(%rsp)
	movq %r14, 392(%rsp)
	movq 264(%rsp), %r10
	movq %r10, 384(%rsp)
	movq 256(%rsp), %r10
	movq %r10, 376(%rsp)
	movaps %xmm1, %xmm0
	movsd 8(%rsp), %xmm1
	cmpl %eax, %ecx
	jl .LB17133
	jmp .LB17134
.LB17125:
	movq 1152(%rsp), %rbx
	movq 1144(%rsp), %rsi
	movq 1136(%rsp), %rdi
	movq 1128(%rsp), %r12
	movq 1120(%rsp), %r13
	movq 1112(%rsp), %r14
	movq 1104(%rsp), %r15
	addq $1168, %rsp
	ret
.LB17134:
	movq 368(%rsp), %rcx
	movq 952(%rsp), %rdx
	addl %edx, %ecx
	movq %rcx, 368(%rsp)
	movq 424(%rsp), %r10
	movq %r10, 472(%rsp)
	movq 416(%rsp), %r10
	movq %r10, 464(%rsp)
	movq 408(%rsp), %r10
	movq %r10, 456(%rsp)
	movq 400(%rsp), %r10
	movq %r10, 448(%rsp)
	movq %rbx, %rcx
	movq %r12, %rdx
	movq %r13, %rbx
	movq 392(%rsp), %r12
	movq 384(%rsp), %r13
	movq 376(%rsp), %r10
	movq %r10, 440(%rsp)
	jmp .LB17123
.LB17144:
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm1
	divsd %xmm0, %xmm1
	jmp .LB17146
.LB17158:
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm3
	movsd %xmm3, 328(%rsp)
	ucomisd %xmm3, %xmm2
	ja .LB17163
.LB17164:
.LB17165:
	movsd %xmm2, 8(%rsp)
	movsd %xmm2, 336(%rsp)
	jmp .LB17160
.LB17163:
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm2
	jmp .LB17165
.LB17177:
	movsd %xmm3, 288(%rsp)
	jmp .LB17179
.LB17183:
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm4
	movsd %xmm4, 248(%rsp)
	movsd 288(%rsp), %xmm5
	ucomisd %xmm4, %xmm5
	ja .LB17188
.LB17189:
	movq 288(%rsp), %r10
	movq %r10, 240(%rsp)
.LB17190:
	movabsq $4679240012837945344, %r10
	movq %r10, %xmm4
	movslq %edx, %r13
	movl $65536, %r12d
	leaq (%r9,%r13,8), %r13
	movsd %xmm4, 232(%rsp)
	movsd 240(%rsp), %xmm5
	mulsd %xmm5, %xmm4
	movsd %xmm4, 224(%rsp)
	cvttsd2siq %xmm4, %rbx
	movq %r13, -8(%rsp)
	movq (%r13), %r13
	subq %rbx, %r12
	movq %r13, %r14
	shrq $32, %r14
	movq %r14, 216(%rsp)
	andq $65535, %r14
	movq %r14, 208(%rsp)
	imulq %r12, %r14
	movq %rsi, %r15
	imulq %rbx, %r15
	movq %r14, 200(%rsp)
	addq %r15, %r14
	movq %r15, 192(%rsp)
	movq %r14, 184(%rsp)
	shrq $16, %r14
	movq %r14, 176(%rsp)
	movq %r13, %r14
	shrq $16, %r14
	movq %r14, 168(%rsp)
	andq $65535, %r14
	movq %r14, 160(%rsp)
	imulq %r12, %r14
	movq %rdi, %r15
	imulq %rbx, %r15
	movq %r14, 152(%rsp)
	addq %r15, %r14
	movq %r15, 144(%rsp)
	movq %r14, 136(%rsp)
	shrq $16, %r14
	movq %r14, 128(%rsp)
	movq %r13, %r14
	andq $65535, %r14
	movq %r14, 120(%rsp)
	imulq %r12, %r14
	movq %r8, %r15
	imulq %rbx, %r15
	movq %r14, 112(%rsp)
	addq %r15, %r14
	movq %r15, 104(%rsp)
	movq %r14, 96(%rsp)
	shrq $16, %r14
	movq %r14, 88(%rsp)
	movq 176(%rsp), %r14
	shlq $32, %r14
	movq %r14, 80(%rsp)
	movabsq $-281474976710656, %r15
	movq %r15, 72(%rsp)
	orq %r15, %r14
	movq %r14, 64(%rsp)
	movq 128(%rsp), %r15
	shlq $16, %r15
	movq %r15, 56(%rsp)
	orq %r15, %r14
	movq %r14, 48(%rsp)
	movq 88(%rsp), %r15
	orq %r15, %r14
	movq %r14, 40(%rsp)
	movq -8(%rsp), %r15
	movq %r14, (%r15)
	movq 240(%rsp), %r10
	movq %r10, 272(%rsp)
	movq 176(%rsp), %r14
	movq 128(%rsp), %r10
	movq %r10, 264(%rsp)
	movq 88(%rsp), %r10
	movq %r10, 256(%rsp)
	jmp .LB17185
.LB17188:
	movabsq $4607182418800017408, %r10
	movq %r10, 240(%rsp)
	jmp .LB17190
	.text
	.globl raycaster__r3d_vol_upsample_rows__3__R3DSceneE1_ptr1__dataE1_sbits32__dataE1_sbits32__ret_voidE1
	.def raycaster__r3d_vol_upsample_rows__3__R3DSceneE1_ptr1__dataE1_sbits32__dataE1_sbits32__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
raycaster__r3d_vol_upsample_rows__3__R3DSceneE1_ptr1__dataE1_sbits32__dataE1_sbits32__ret_voidE1:
	subq $1552, %rsp
	movq %rbx, 1536(%rsp)
	movq %rsi, 1528(%rsp)
	movq %rdi, 1520(%rsp)
	movq %r12, 1512(%rsp)
	movq %r13, 1504(%rsp)
	movq %r14, 1496(%rsp)
	movq %r15, 1488(%rsp)
.LB17495:
	movq %rdx, 1480(%rsp)
	movq %r8, 1264(%rsp)
	movl 224(%rcx), %eax
	movq %rax, 952(%rsp)
	movl 228(%rcx), %eax
	movq %rax, 1256(%rsp)
	movl 232(%rcx), %eax
	movq %rax, 960(%rsp)
	movl 236(%rcx), %eax
	movq %rax, 1248(%rsp)
	movsd 288(%rcx), %xmm0
	movsd %xmm0, 984(%rsp)
	movq 4992(%rcx), %rax
	movq %rax, 1000(%rsp)
	movq 5000(%rcx), %rax
	movq %rax, 1008(%rsp)
	movq 5008(%rcx), %rax
	movq 5016(%rcx), %rdx
	movq 5024(%rcx), %rsi
	movq 5032(%rcx), %rcx
	movq %rcx, 976(%rsp)
	movq 1480(%rsp), %rcx
	movq 1248(%rsp), %rdi
	cmpl %edi, %ecx
	jge .LB17597
.LB17598:
	movq 1256(%rsp), %rcx
	decl %ecx
	movq %rcx, 1472(%rsp)
	movq 952(%rsp), %rcx
	decl %ecx
	movq %rcx, 968(%rsp)
	movq 1480(%rsp), %r10
	movq %r10, 1464(%rsp)
	movq $0, 1456(%rsp)
	movq $0, 1448(%rsp)
	movq $0, 1440(%rsp)
	movq $0, 1432(%rsp)
	movq $0, 1424(%rsp)
	movq $0, 1416(%rsp)
	movq $0, 1408(%rsp)
	movabsq $0, %r10
	movq %r10, 1224(%rsp)
	xorps %xmm0, %xmm0
	xorps %xmm1, %xmm1
	xorps %xmm2, %xmm2
	xorps %xmm3, %xmm3
	movabsq $0, %r10
	movq %r10, 1400(%rsp)
	movabsq $0, %r10
	movq %r10, 1392(%rsp)
	movabsq $0, %r10
	movq %r10, 1384(%rsp)
	movabsq $0, %r10
	movq %r10, 1376(%rsp)
	movabsq $0, %r10
	movq %r10, 1368(%rsp)
	movabsq $0, %r10
	movq %r10, 1360(%rsp)
	movabsq $0, %r10
	movq %r10, 1352(%rsp)
	movabsq $0, %r10
	movq %r10, 1344(%rsp)
	movabsq $0, %r10
	movq %r10, 1336(%rsp)
	movabsq $0, %r10
	movq %r10, 1328(%rsp)
	movabsq $0, %r10
	movq %r10, 1320(%rsp)
	movabsq $0, %r10
	movq %r10, 1312(%rsp)
	movabsq $0, %r10
	movq %r10, 1304(%rsp)
	movq $0, 1296(%rsp)
	movq $0, 1288(%rsp)
	movq $0, 1280(%rsp)
	movq $0, 1272(%rsp)
.LB17601:
	movq 1464(%rsp), %rcx
	movq 1248(%rsp), %rdi
	cmpl %edi, %ecx
	jge .LB17603
.LB17602:
	movq 1464(%rsp), %rcx
	movq 1256(%rsp), %r9
	movabsq $4602678819172646912, %r10
	movq %r10, %xmm5
	movl %ecx, %edi
	sarl $1, %edi
	leal 1(%rdi), %r8d
	cmpl %r9d, %r8d
	movq 1472(%rsp), %r9
	cmovge %r9d, %r8d
	andl $1, %ecx
	movslq %ecx, %rcx
	xorps %xmm4, %xmm4
	cvtsi2sdq %rcx, %xmm4
	movsd %xmm4, 1240(%rsp)
	mulsd %xmm5, %xmm4
	movsd %xmm5, 1232(%rsp)
	movsd %xmm4, 568(%rsp)
	movq 952(%rsp), %rcx
	imull %ecx, %edi
	imull %ecx, %r8d
	movq %rdi, 24(%rsp)
	movq 1464(%rsp), %rcx
	movq 960(%rsp), %rdi
	imull %edi, %ecx
	movq %rcx, 992(%rsp)
	movq $0, 1216(%rsp)
	movq 1456(%rsp), %r10
	movq %r10, 1208(%rsp)
	movq 1448(%rsp), %r10
	movq %r10, 1200(%rsp)
	movq 1440(%rsp), %r10
	movq %r10, 1192(%rsp)
	movq 1432(%rsp), %r10
	movq %r10, 1184(%rsp)
	movq 1424(%rsp), %r10
	movq %r10, 1176(%rsp)
	movq 1416(%rsp), %r10
	movq %r10, 1168(%rsp)
	movq 1408(%rsp), %r10
	movq %r10, 1160(%rsp)
	movsd %xmm0, 944(%rsp)
	movsd %xmm3, 1152(%rsp)
	movq 1400(%rsp), %r10
	movq %r10, 1144(%rsp)
	movq 1392(%rsp), %r10
	movq %r10, 1136(%rsp)
	movq 1384(%rsp), %r10
	movq %r10, 1128(%rsp)
	movq 1376(%rsp), %r10
	movq %r10, 1120(%rsp)
	movq 1368(%rsp), %r10
	movq %r10, 1112(%rsp)
	movq 1360(%rsp), %r10
	movq %r10, 1104(%rsp)
	movq 1352(%rsp), %r10
	movq %r10, 1096(%rsp)
	movq 1344(%rsp), %r10
	movq %r10, 1088(%rsp)
	movq 1336(%rsp), %r10
	movq %r10, 1080(%rsp)
	movq 1328(%rsp), %r10
	movq %r10, 1072(%rsp)
	movq 1320(%rsp), %r10
	movq %r10, 1064(%rsp)
	movq 1312(%rsp), %r10
	movq %r10, 1056(%rsp)
	movq 1304(%rsp), %r10
	movq %r10, 1048(%rsp)
	movq 1296(%rsp), %r10
	movq %r10, 1040(%rsp)
	movq 1288(%rsp), %r10
	movq %r10, 1032(%rsp)
	movq 1280(%rsp), %r10
	movq %r10, 1024(%rsp)
	movq 1272(%rsp), %r10
	movq %r10, 1016(%rsp)
	movsd 1224(%rsp), %xmm0
.LB17632:
	movq 1216(%rsp), %rcx
	movq 960(%rsp), %rdi
	cmpl %edi, %ecx
	jge .LB17634
.LB17633:
	movq 1216(%rsp), %rcx
	movq 952(%rsp), %rbx
	movabsq $4602678819172646912, %r10
	movq %r10, %xmm3
	movabsq $4562254508917369340, %r10
	movq %r10, %xmm4
	movl %ecx, %edi
	sarl $1, %edi
	leal 1(%rdi), %r9d
	cmpl %ebx, %r9d
	movq 968(%rsp), %rbx
	cmovge %ebx, %r9d
	andl $1, %ecx
	movslq %ecx, %rcx
	xorps %xmm0, %xmm0
	cvtsi2sdq %rcx, %xmm0
	movq 24(%rsp), %rcx
	mulsd %xmm3, %xmm0
	leal (%rcx,%rdi), %ebx
	addl %r9d, %ecx
	leal (%r8,%rdi), %r12d
	movslq %ebx, %r14
	leal (%r8,%r9), %r13d
	movsd (%rax,%r14,8), %xmm3
	ucomisd %xmm3, %xmm4
	jb .LB17760
.LB17671:
	movslq %ecx, %r14
	movsd (%rax,%r14,8), %xmm3
	movabsq $4562254508917369340, %r10
	movq %r10, %xmm4
	ucomisd %xmm3, %xmm4
	jb .LB17760
.LB17679:
	movslq %r12d, %r14
	movsd (%rax,%r14,8), %xmm3
	movabsq $4562254508917369340, %r10
	movq %r10, %xmm4
	ucomisd %xmm3, %xmm4
	jb .LB17760
.LB17687:
	movslq %r13d, %r14
	movsd (%rax,%r14,8), %xmm3
	movabsq $4562254508917369340, %r10
	movq %r10, %xmm4
	ucomisd %xmm3, %xmm4
	jb .LB17760
.LB17695:
	movslq %ebx, %r14
	movsd (%rdx,%r14,8), %xmm3
	movabsq $4562254508917369340, %r10
	movq %r10, %xmm4
	ucomisd %xmm3, %xmm4
	jb .LB17760
.LB17703:
	movslq %ecx, %r14
	movsd (%rdx,%r14,8), %xmm3
	movabsq $4562254508917369340, %r10
	movq %r10, %xmm4
	ucomisd %xmm3, %xmm4
	jb .LB17760
.LB17711:
	movslq %r12d, %r14
	movsd (%rdx,%r14,8), %xmm3
	movabsq $4562254508917369340, %r10
	movq %r10, %xmm4
	ucomisd %xmm3, %xmm4
	jb .LB17760
.LB17719:
	movslq %r13d, %r14
	movsd (%rdx,%r14,8), %xmm3
	movabsq $4562254508917369340, %r10
	movq %r10, %xmm4
	ucomisd %xmm3, %xmm4
	jb .LB17760
.LB17727:
	movslq %ebx, %r14
	movsd (%rsi,%r14,8), %xmm3
	movabsq $4562254508917369340, %r10
	movq %r10, %xmm4
	ucomisd %xmm3, %xmm4
	jb .LB17760
.LB17735:
	movslq %ecx, %r14
	movsd (%rsi,%r14,8), %xmm3
	movabsq $4562254508917369340, %r10
	movq %r10, %xmm4
	ucomisd %xmm3, %xmm4
	jb .LB17760
.LB17743:
	movslq %r12d, %r14
	movsd (%rsi,%r14,8), %xmm3
	movabsq $4562254508917369340, %r10
	movq %r10, %xmm4
	ucomisd %xmm3, %xmm4
	jb .LB17760
.LB17751:
	movslq %r13d, %r14
	movsd (%rsi,%r14,8), %xmm3
	movabsq $4562254508917369340, %r10
	movq %r10, %xmm4
	ucomisd %xmm3, %xmm4
	jae .LB17759
.LB17760:
	movsd 568(%rsp), %xmm3
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm1
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm2
	subsd %xmm0, %xmm1
	subsd %xmm3, %xmm2
	mulsd %xmm2, %xmm1
	movsd %xmm1, 936(%rsp)
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm1
	subsd %xmm3, %xmm1
	mulsd %xmm0, %xmm1
	movsd %xmm1, 848(%rsp)
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm1
	movsd 568(%rsp), %xmm2
	subsd %xmm0, %xmm1
	mulsd %xmm2, %xmm1
	movsd %xmm1, 792(%rsp)
	movaps %xmm0, %xmm1
	mulsd %xmm2, %xmm1
	xorps %xmm2, %xmm2
	movsd %xmm1, 736(%rsp)
	movq 992(%rsp), %r14
	movq 1216(%rsp), %r15
	addl %r15d, %r14d
	movq 1000(%rsp), %r15
	movslq %r14d, %r14
	movsd (%r15,%r14,8), %xmm1
	movsd %xmm1, 680(%rsp)
	movsd %xmm2, 928(%rsp)
	ucomisd %xmm2, %xmm1
	ja .LB17788
.LB17789:
	movq 984(%rsp), %r10
	movq %r10, 920(%rsp)
.LB17790:
	movq 976(%rsp), %r15
	movslq %ebx, %r14
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm3
	movsd (%r15,%r14,8), %xmm1
	movslq %ecx, %r14
	movsd %xmm1, 896(%rsp)
	movsd 920(%rsp), %xmm2
	subsd %xmm2, %xmm1
	movabsq $4598175219545276416, %r10
	movq %r10, %xmm2
	movsd %xmm1, 888(%rsp)
	mulsd %xmm1, %xmm1
	movsd %xmm1, 880(%rsp)
	vfmadd132sd %xmm2, %xmm3, %xmm1
	movsd %xmm2, 872(%rsp)
	movsd %xmm3, 864(%rsp)
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm3
	movsd %xmm1, 856(%rsp)
	movsd 936(%rsp), %xmm2
	movaps %xmm1, %xmm15
	movaps %xmm2, %xmm1
	divsd %xmm15, %xmm1
	movsd %xmm1, -8(%rsp)
	movq 976(%rsp), %r15
	movsd (%r15,%r14,8), %xmm1
	movslq %r12d, %r14
	movsd %xmm1, 840(%rsp)
	movsd 920(%rsp), %xmm2
	subsd %xmm2, %xmm1
	movabsq $4598175219545276416, %r10
	movq %r10, %xmm2
	movsd %xmm1, 832(%rsp)
	mulsd %xmm1, %xmm1
	movsd %xmm1, 824(%rsp)
	vfmadd132sd %xmm2, %xmm3, %xmm1
	movsd %xmm2, 816(%rsp)
	movsd %xmm3, 808(%rsp)
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm3
	movsd %xmm1, 800(%rsp)
	movsd 848(%rsp), %xmm2
	movaps %xmm1, %xmm15
	movaps %xmm2, %xmm1
	divsd %xmm15, %xmm1
	movsd %xmm1, 16(%rsp)
	movq 976(%rsp), %r15
	movsd (%r15,%r14,8), %xmm1
	movsd %xmm1, 784(%rsp)
	movsd 920(%rsp), %xmm2
	subsd %xmm2, %xmm1
	movabsq $4598175219545276416, %r10
	movq %r10, %xmm2
	movsd %xmm1, 776(%rsp)
	mulsd %xmm1, %xmm1
	movsd %xmm1, 768(%rsp)
	movsd %xmm2, 760(%rsp)
	vfmadd132sd %xmm2, %xmm3, %xmm1
	movsd %xmm3, 752(%rsp)
	movslq %r13d, %r14
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm4
	movsd %xmm1, 744(%rsp)
	movsd 792(%rsp), %xmm2
	movq 976(%rsp), %r15
	movaps %xmm1, %xmm15
	movaps %xmm2, %xmm1
	divsd %xmm15, %xmm1
	movsd (%r15,%r14,8), %xmm2
	movsd %xmm2, 728(%rsp)
	movsd 920(%rsp), %xmm3
	subsd %xmm3, %xmm2
	movabsq $4598175219545276416, %r10
	movq %r10, %xmm3
	movsd %xmm2, 720(%rsp)
	mulsd %xmm2, %xmm2
	movsd %xmm2, 712(%rsp)
	vfmadd132sd %xmm3, %xmm4, %xmm2
	movsd %xmm3, 704(%rsp)
	movsd %xmm4, 696(%rsp)
	movsd %xmm2, 688(%rsp)
	movsd 736(%rsp), %xmm3
	movaps %xmm2, %xmm15
	movaps %xmm3, %xmm2
	divsd %xmm15, %xmm2
	movsd 16(%rsp), %xmm3
	movsd -8(%rsp), %xmm4
	addsd %xmm4, %xmm3
	movabsq $4547007122018943789, %r10
	movq %r10, %xmm4
	movsd %xmm3, 672(%rsp)
	addsd %xmm1, %xmm3
	movsd %xmm3, 664(%rsp)
	addsd %xmm2, %xmm3
	movsd %xmm3, 656(%rsp)
	movsd %xmm4, 648(%rsp)
	ucomisd %xmm4, %xmm3
	ja .LB17860
.LB17861:
	movq 1208(%rsp), %r14
	movq 1080(%rsp), %r10
	movq %r10, 640(%rsp)
	movq 1064(%rsp), %r10
	movq %r10, 632(%rsp)
	movq 1056(%rsp), %r10
	movq %r10, 624(%rsp)
	movq 1048(%rsp), %r10
	movq %r10, 616(%rsp)
	movq 1040(%rsp), %r10
	movq %r10, 608(%rsp)
	movq 1032(%rsp), %r10
	movq %r10, 600(%rsp)
	movq 1024(%rsp), %r10
	movq %r10, 592(%rsp)
	movq 1016(%rsp), %r10
	movq %r10, 584(%rsp)
.LB17862:
	movq 1216(%rsp), %r15
	incl %r15d
	movq %r15, 32(%rsp)
	movq 32(%rsp), %r10
	movq %r10, 1216(%rsp)
	movq %r14, 1208(%rsp)
	movq %rdi, 1200(%rsp)
	movq %r9, 1192(%rsp)
	movq %rbx, 1184(%rsp)
	movq %rcx, 1176(%rsp)
	movq %r12, 1168(%rsp)
	movq %r13, 1160(%rsp)
	movq 936(%rsp), %r10
	movq %r10, 944(%rsp)
	movq 736(%rsp), %r10
	movq %r10, 1152(%rsp)
	movq 920(%rsp), %r10
	movq %r10, 1144(%rsp)
	movq 720(%rsp), %r10
	movq %r10, 1136(%rsp)
	movabsq $4598175219545276416, %r10
	movq %r10, 1128(%rsp)
	movq -8(%rsp), %r10
	movq %r10, 1120(%rsp)
	movq 16(%rsp), %r10
	movq %r10, 1112(%rsp)
	movsd %xmm1, 1104(%rsp)
	movsd %xmm2, 1096(%rsp)
	movq 656(%rsp), %r10
	movq %r10, 1088(%rsp)
	movq 640(%rsp), %r10
	movq %r10, 1080(%rsp)
	movq 680(%rsp), %r10
	movq %r10, 1072(%rsp)
	movq 632(%rsp), %r10
	movq %r10, 1064(%rsp)
	movq 624(%rsp), %r10
	movq %r10, 1056(%rsp)
	movq 616(%rsp), %r10
	movq %r10, 1048(%rsp)
	movq 608(%rsp), %r10
	movq %r10, 1040(%rsp)
	movq 600(%rsp), %r10
	movq %r10, 1032(%rsp)
	movq 592(%rsp), %r10
	movq %r10, 1024(%rsp)
	movq 584(%rsp), %r10
	movq %r10, 1016(%rsp)
	movsd 848(%rsp), %xmm1
	movsd 792(%rsp), %xmm2
	jmp .LB17632
.LB17603:
	movq 1536(%rsp), %rbx
	movq 1528(%rsp), %rsi
	movq 1520(%rsp), %rdi
	movq 1512(%rsp), %r12
	movq 1504(%rsp), %r13
	movq 1496(%rsp), %r14
	movq 1488(%rsp), %r15
	addq $1552, %rsp
	ret
.LB17634:
	movq 1464(%rsp), %rcx
	movq 1264(%rsp), %rdi
	addl %edi, %ecx
	movq %rcx, 1464(%rsp)
	movq 1208(%rsp), %r10
	movq %r10, 1456(%rsp)
	movq 1200(%rsp), %r10
	movq %r10, 1448(%rsp)
	movq 1192(%rsp), %r10
	movq %r10, 1440(%rsp)
	movq 1184(%rsp), %r10
	movq %r10, 1432(%rsp)
	movq 1176(%rsp), %r10
	movq %r10, 1424(%rsp)
	movq 1168(%rsp), %r10
	movq %r10, 1416(%rsp)
	movq 1160(%rsp), %r10
	movq %r10, 1408(%rsp)
	movsd %xmm0, 1224(%rsp)
	movsd 944(%rsp), %xmm0
	movsd 1152(%rsp), %xmm3
	movq 1144(%rsp), %r10
	movq %r10, 1400(%rsp)
	movq 1136(%rsp), %r10
	movq %r10, 1392(%rsp)
	movq 1128(%rsp), %r10
	movq %r10, 1384(%rsp)
	movq 1120(%rsp), %r10
	movq %r10, 1376(%rsp)
	movq 1112(%rsp), %r10
	movq %r10, 1368(%rsp)
	movq 1104(%rsp), %r10
	movq %r10, 1360(%rsp)
	movq 1096(%rsp), %r10
	movq %r10, 1352(%rsp)
	movq 1088(%rsp), %r10
	movq %r10, 1344(%rsp)
	movq 1080(%rsp), %r10
	movq %r10, 1336(%rsp)
	movq 1072(%rsp), %r10
	movq %r10, 1328(%rsp)
	movq 1064(%rsp), %r10
	movq %r10, 1320(%rsp)
	movq 1056(%rsp), %r10
	movq %r10, 1312(%rsp)
	movq 1048(%rsp), %r10
	movq %r10, 1304(%rsp)
	movq 1040(%rsp), %r10
	movq %r10, 1296(%rsp)
	movq 1032(%rsp), %r10
	movq %r10, 1288(%rsp)
	movq 1024(%rsp), %r10
	movq %r10, 1280(%rsp)
	movq 1016(%rsp), %r10
	movq %r10, 1272(%rsp)
	jmp .LB17601
.LB17788:
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm1
	movsd %xmm1, 912(%rsp)
	movsd 680(%rsp), %xmm2
	divsd %xmm2, %xmm1
	movsd %xmm1, 904(%rsp)
	movq 904(%rsp), %r10
	movq %r10, 920(%rsp)
	jmp .LB17790
.LB17860:
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm3
	movslq %ebx, %r14
	movsd %xmm3, 576(%rsp)
	movsd 656(%rsp), %xmm4
	divsd %xmm4, %xmm3
	movsd %xmm3, 8(%rsp)
	movsd (%rax,%r14,8), %xmm3
	movslq %ecx, %r14
	movsd %xmm3, 560(%rsp)
	movsd (%rax,%r14,8), %xmm4
	movslq %r12d, %r14
	movsd %xmm4, 552(%rsp)
	movsd 16(%rsp), %xmm5
	mulsd %xmm5, %xmm4
	movsd %xmm4, 544(%rsp)
	movsd -8(%rsp), %xmm5
	vfmadd132sd %xmm5, %xmm4, %xmm3
	movsd %xmm3, 536(%rsp)
	movsd (%rax,%r14,8), %xmm4
	movslq %r13d, %r14
	movsd %xmm4, 528(%rsp)
	vfmadd231sd %xmm4, %xmm1, %xmm3
	movsd %xmm3, 520(%rsp)
	movsd (%rax,%r14,8), %xmm4
	movslq %ebx, %r14
	movsd %xmm4, 512(%rsp)
	vfmadd231sd %xmm4, %xmm2, %xmm3
	movsd %xmm3, 504(%rsp)
	movsd 8(%rsp), %xmm4
	mulsd %xmm4, %xmm3
	movsd %xmm3, 496(%rsp)
	movsd (%rdx,%r14,8), %xmm3
	movslq %ecx, %r14
	movsd %xmm3, 488(%rsp)
	movsd (%rdx,%r14,8), %xmm4
	movslq %r12d, %r14
	movsd %xmm4, 480(%rsp)
	movsd 16(%rsp), %xmm5
	mulsd %xmm5, %xmm4
	movsd %xmm4, 472(%rsp)
	movsd -8(%rsp), %xmm5
	vfmadd132sd %xmm5, %xmm4, %xmm3
	movsd %xmm3, 464(%rsp)
	movsd (%rdx,%r14,8), %xmm4
	movslq %r13d, %r14
	movsd %xmm4, 456(%rsp)
	vfmadd231sd %xmm4, %xmm1, %xmm3
	movsd %xmm3, 448(%rsp)
	movsd (%rdx,%r14,8), %xmm4
	movslq %ebx, %r14
	movsd %xmm4, 440(%rsp)
	vfmadd231sd %xmm4, %xmm2, %xmm3
	movsd %xmm3, 432(%rsp)
	movsd 8(%rsp), %xmm4
	mulsd %xmm4, %xmm3
	movsd %xmm3, 424(%rsp)
	movsd (%rsi,%r14,8), %xmm3
	movslq %ecx, %r14
	movsd %xmm3, 416(%rsp)
	movsd (%rsi,%r14,8), %xmm4
	movslq %r12d, %r14
	movsd %xmm4, 408(%rsp)
	movsd 16(%rsp), %xmm5
	mulsd %xmm5, %xmm4
	movsd %xmm4, 400(%rsp)
	movsd -8(%rsp), %xmm5
	vfmadd132sd %xmm5, %xmm4, %xmm3
	movsd %xmm3, 392(%rsp)
	movsd (%rsi,%r14,8), %xmm4
	movslq %r13d, %r14
	movsd %xmm4, 384(%rsp)
	vfmadd231sd %xmm4, %xmm1, %xmm3
	movsd %xmm3, 376(%rsp)
	movsd (%rsi,%r14,8), %xmm4
	movsd %xmm4, 368(%rsp)
	vfmadd231sd %xmm4, %xmm2, %xmm3
	movsd %xmm3, 360(%rsp)
	movsd 8(%rsp), %xmm4
	mulsd %xmm4, %xmm3
	movsd %xmm3, 352(%rsp)
	movabsq $4562254508917369340, %r10
	movq %r10, %xmm3
	movsd %xmm3, 344(%rsp)
	movsd 496(%rsp), %xmm4
	ucomisd %xmm3, %xmm4
	ja .LB17964
.LB17954:
	movabsq $4562254508917369340, %r10
	movq %r10, %xmm3
	movsd %xmm3, 336(%rsp)
	movsd 424(%rsp), %xmm4
	ucomisd %xmm3, %xmm4
	ja .LB17964
.LB17959:
	movabsq $4562254508917369340, %r10
	movq %r10, %xmm3
	movsd %xmm3, 328(%rsp)
	movsd 352(%rsp), %xmm4
	ucomisd %xmm3, %xmm4
	ja .LB17964
.LB17965:
	movq 1208(%rsp), %r14
	movq 1040(%rsp), %r10
	movq %r10, 320(%rsp)
	movq 1032(%rsp), %r10
	movq %r10, 312(%rsp)
	movq 1024(%rsp), %r10
	movq %r10, 304(%rsp)
	movq 1016(%rsp), %r10
	movq %r10, 296(%rsp)
.LB17966:
	movq 8(%rsp), %r10
	movq %r10, 640(%rsp)
	movq 496(%rsp), %r10
	movq %r10, 632(%rsp)
	movq 424(%rsp), %r10
	movq %r10, 624(%rsp)
	movq 352(%rsp), %r10
	movq %r10, 616(%rsp)
	movq 320(%rsp), %r10
	movq %r10, 608(%rsp)
	movq 312(%rsp), %r10
	movq %r10, 600(%rsp)
	movq 304(%rsp), %r10
	movq %r10, 592(%rsp)
	movq 296(%rsp), %r10
	movq %r10, 584(%rsp)
	jmp .LB17862
.LB17964:
	movq 992(%rsp), %r14
	movq 1216(%rsp), %r15
	movabsq $4679239875398991872, %r10
	movq %r10, %xmm3
	addl %r15d, %r14d
	movq %r14, 272(%rsp)
	movslq %r14d, %r14
	movq %r14, 288(%rsp)
	movq 1008(%rsp), %r15
	leaq (%r15,%r14,8), %r14
	movq %r14, 280(%rsp)
	movq (%r14), %r14
	movq %r14, (%rsp)
	shrq $32, %r14
	movq %r14, 264(%rsp)
	andq $65535, %r14
	movq %r14, 256(%rsp)
	movsd %xmm3, 248(%rsp)
	movsd 496(%rsp), %xmm4
	mulsd %xmm4, %xmm3
	movsd %xmm3, 240(%rsp)
	cvttsd2siq %xmm3, %r14
	movabsq $4679239875398991872, %r10
	movq %r10, %xmm3
	movq %r14, 232(%rsp)
	movq 256(%rsp), %r15
	addq %r14, %r15
	movq %r15, 224(%rsp)
	movq (%rsp), %r14
	shrq $16, %r14
	movq %r14, 216(%rsp)
	andq $65535, %r14
	movq %r14, 208(%rsp)
	movsd %xmm3, 200(%rsp)
	movsd 424(%rsp), %xmm4
	mulsd %xmm4, %xmm3
	movsd %xmm3, 192(%rsp)
	cvttsd2siq %xmm3, %r14
	movabsq $4679239875398991872, %r10
	movq %r10, %xmm3
	movq %r14, 184(%rsp)
	movq 208(%rsp), %r15
	addq %r14, %r15
	movq %r15, 176(%rsp)
	movq (%rsp), %r14
	andq $65535, %r14
	movq %r14, 168(%rsp)
	movsd %xmm3, 160(%rsp)
	movsd 352(%rsp), %xmm4
	mulsd %xmm4, %xmm3
	movsd %xmm3, 152(%rsp)
	cvttsd2siq %xmm3, %r14
	movq %r14, 144(%rsp)
	movq 168(%rsp), %r15
	addq %r14, %r15
	movl $65535, %r14d
	movq %r15, 136(%rsp)
	movq %r14, 128(%rsp)
	movq 224(%rsp), %r15
	cmpq $65535, %r15
	cmova %r14, %r15
	movl $65535, %r14d
	movq %r15, 120(%rsp)
	movq %r14, 112(%rsp)
	movq 176(%rsp), %r15
	cmpq $65535, %r15
	cmova %r14, %r15
	movl $65535, %r14d
	movq %r15, 104(%rsp)
	movq %r14, 96(%rsp)
	movq 136(%rsp), %r15
	cmpq $65535, %r15
	cmova %r14, %r15
	movq %r15, 88(%rsp)
	movq 120(%rsp), %r14
	movabsq $-281474976710656, %r15
	shlq $32, %r14
	movq %r14, 80(%rsp)
	orq %r15, %r14
	movq %r15, 72(%rsp)
	movq %r14, 64(%rsp)
	movq 104(%rsp), %r15
	shlq $16, %r15
	movq %r15, 56(%rsp)
	orq %r15, %r14
	movq %r14, 48(%rsp)
	movq 88(%rsp), %r15
	orq %r15, %r14
	movq %r14, 40(%rsp)
	movq 280(%rsp), %r15
	movq %r14, (%r15)
	movq 272(%rsp), %r14
	movq 0(%rsp), %r10
	movq %r10, 320(%rsp)
	movq 120(%rsp), %r10
	movq %r10, 312(%rsp)
	movq 104(%rsp), %r10
	movq %r10, 304(%rsp)
	movq 88(%rsp), %r10
	movq %r10, 296(%rsp)
	jmp .LB17966
.LB17759:
	movq 1216(%rsp), %r14
	incl %r14d
	movq %r14, 1216(%rsp)
	movq %rdi, 1200(%rsp)
	movq %r9, 1192(%rsp)
	movq %rbx, 1184(%rsp)
	movq %rcx, 1176(%rsp)
	movq %r12, 1168(%rsp)
	movq %r13, 1160(%rsp)
	jmp .LB17632
.LB17597:
	movq 1536(%rsp), %rbx
	movq 1528(%rsp), %rsi
	movq 1520(%rsp), %rdi
	movq 1512(%rsp), %r12
	movq 1504(%rsp), %r13
	movq 1496(%rsp), %r14
	movq 1488(%rsp), %r15
	addq $1552, %rsp
	ret
	.text
	.globl raycaster__r3d_lighting_rows__3__R3DSceneE1_ptr1__dataE1_sbits32__dataE1_sbits32__ret_voidE1
	.def raycaster__r3d_lighting_rows__3__R3DSceneE1_ptr1__dataE1_sbits32__dataE1_sbits32__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
raycaster__r3d_lighting_rows__3__R3DSceneE1_ptr1__dataE1_sbits32__dataE1_sbits32__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $1408, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
	movq %r14, -48(%rbp)
	movq %r15, -56(%rbp)
.LB20142:
	movq %rcx, %rsi
	movq %r8, -96(%rbp)
	movsd 64(%rsi), %xmm0
	movsd %xmm0, -64(%rbp)
	movsd 72(%rsi), %xmm0
	movsd %xmm0, -72(%rbp)
	movsd 80(%rsi), %xmm0
	movsd %xmm0, -80(%rbp)
	movq 48(%rsi), %rdi
	movl 5448(%rsi), %ebx
	movq (%rsi), %rax
	movl 16(%rax), %ecx
	movq %rcx, -800(%rbp)
	movl 20(%rax), %eax
	movq %rax, -88(%rbp)
	movq 5176(%rsi), %rax
	movq %rax, -576(%rbp)
	movq 6344(%rsi), %rax
	movq %rax, -416(%rbp)
	movq 6352(%rsi), %rax
	movq %rax, -256(%rbp)
	movq %rdx, -104(%rbp)
	xorl %eax, %eax
	xorl %ecx, %ecx
	xorl %edx, %edx
	xorl %r8d, %r8d
	xorl %r9d, %r9d
	movq $0, -112(%rbp)
	movq $0, -120(%rbp)
	movq $0, -128(%rbp)
	movq $0, -136(%rbp)
	movq $0, -144(%rbp)
	xorps %xmm0, %xmm0
	xorps %xmm1, %xmm1
	xorps %xmm2, %xmm2
	xorps %xmm3, %xmm3
	xorps %xmm4, %xmm4
	xorps %xmm5, %xmm5
	movabsq $0, %r10
	movq %r10, -152(%rbp)
	movabsq $0, %r10
	movq %r10, -160(%rbp)
	movabsq $0, %r10
	movq %r10, -168(%rbp)
	movabsq $0, %r10
	movq %r10, -176(%rbp)
	movabsq $0, %r10
	movq %r10, -184(%rbp)
	movabsq $0, %r10
	movq %r10, -192(%rbp)
	movabsq $0, %r10
	movq %r10, -200(%rbp)
	movabsq $0, %r10
	movq %r10, -208(%rbp)
	movabsq $0, %r10
	movq %r10, -216(%rbp)
	movabsq $0, %r10
	movq %r10, -224(%rbp)
	movabsq $0, %r10
	movq %r10, -232(%rbp)
	movabsq $0, %r10
	movq %r10, -240(%rbp)
	movabsq $0, %r10
	movq %r10, -248(%rbp)
.LB20252:
	movq -104(%rbp), %r12
	movq -88(%rbp), %r13
	cmpl %r13d, %r12d
	jge .LB20254
.LB20253:
	movq -104(%rbp), %r12
	movq -800(%rbp), %r13
	imull %r13d, %r12d
	movq %r12, -792(%rbp)
	movq $0, -264(%rbp)
	movq -112(%rbp), %r10
	movq %r10, -272(%rbp)
	movq -120(%rbp), %r10
	movq %r10, -280(%rbp)
	movq -128(%rbp), %r10
	movq %r10, -288(%rbp)
	movq -136(%rbp), %r10
	movq %r10, -296(%rbp)
	movq -144(%rbp), %r10
	movq %r10, -304(%rbp)
	movsd %xmm0, -1280(%rbp)
	movsd %xmm1, -1288(%rbp)
	movq -152(%rbp), %r10
	movq %r10, -312(%rbp)
	movq -160(%rbp), %r10
	movq %r10, -320(%rbp)
	movq -168(%rbp), %r10
	movq %r10, -328(%rbp)
	movq -176(%rbp), %r10
	movq %r10, -336(%rbp)
	movq -184(%rbp), %r10
	movq %r10, -344(%rbp)
	movq -192(%rbp), %r10
	movq %r10, -352(%rbp)
	movq -200(%rbp), %r10
	movq %r10, -360(%rbp)
	movq -208(%rbp), %r10
	movq %r10, -368(%rbp)
	movq -216(%rbp), %r10
	movq %r10, -376(%rbp)
	movq -224(%rbp), %r10
	movq %r10, -384(%rbp)
	movq -232(%rbp), %r10
	movq %r10, -392(%rbp)
	movq -240(%rbp), %r10
	movq %r10, -400(%rbp)
	movq -248(%rbp), %r10
	movq %r10, -408(%rbp)
.LB20258:
	movq -264(%rbp), %r12
	movq -800(%rbp), %r13
	cmpl %r13d, %r12d
	jge .LB20260
.LB20259:
	movq -792(%rbp), %rax
	movq -264(%rbp), %r12
	movq -416(%rbp), %r13
	movabsq $4517329193108106637, %r10
	movq %r10, %xmm1
	addl %eax, %r12d
	movslq %r12d, %rax
	movsd (%r13,%rax,8), %xmm0
	movsd %xmm0, -424(%rbp)
	movsd %xmm1, -432(%rbp)
	ucomisd %xmm1, %xmm0
	ja .LB20274
.LB20275:
	movq -272(%rbp), %rax
	movq -280(%rbp), %r10
	movq %r10, -440(%rbp)
	movq -288(%rbp), %r10
	movq %r10, -448(%rbp)
	movq -296(%rbp), %r10
	movq %r10, -456(%rbp)
	movq -304(%rbp), %r10
	movq %r10, -464(%rbp)
	movsd -1280(%rbp), %xmm0
	movsd -1288(%rbp), %xmm1
	movq -312(%rbp), %r10
	movq %r10, -472(%rbp)
	movq -320(%rbp), %r10
	movq %r10, -480(%rbp)
	movq -328(%rbp), %r10
	movq %r10, -488(%rbp)
	movq -336(%rbp), %r10
	movq %r10, -496(%rbp)
	movq -344(%rbp), %r10
	movq %r10, -504(%rbp)
	movq -352(%rbp), %r10
	movq %r10, -512(%rbp)
	movq -360(%rbp), %r10
	movq %r10, -520(%rbp)
	movq -368(%rbp), %r10
	movq %r10, -528(%rbp)
	movq -376(%rbp), %r10
	movq %r10, -536(%rbp)
	movq -384(%rbp), %r10
	movq %r10, -544(%rbp)
	movq -392(%rbp), %r10
	movq %r10, -552(%rbp)
	movq -400(%rbp), %r10
	movq %r10, -560(%rbp)
	movq -408(%rbp), %r10
	movq %r10, -568(%rbp)
.LB20276:
	movq -264(%rbp), %r13
	incl %r13d
	movq %r13, -264(%rbp)
	movq %rax, -272(%rbp)
	movq -440(%rbp), %r10
	movq %r10, -280(%rbp)
	movq -448(%rbp), %r10
	movq %r10, -288(%rbp)
	movq -456(%rbp), %r10
	movq %r10, -296(%rbp)
	movq -464(%rbp), %r10
	movq %r10, -304(%rbp)
	movsd %xmm0, -1280(%rbp)
	movsd %xmm1, -1288(%rbp)
	movq -472(%rbp), %r10
	movq %r10, -312(%rbp)
	movq -480(%rbp), %r10
	movq %r10, -320(%rbp)
	movq -488(%rbp), %r10
	movq %r10, -328(%rbp)
	movq -496(%rbp), %r10
	movq %r10, -336(%rbp)
	movq -504(%rbp), %r10
	movq %r10, -344(%rbp)
	movq -512(%rbp), %r10
	movq %r10, -352(%rbp)
	movq -520(%rbp), %r10
	movq %r10, -360(%rbp)
	movq -528(%rbp), %r10
	movq %r10, -368(%rbp)
	movq -536(%rbp), %r10
	movq %r10, -376(%rbp)
	movq -544(%rbp), %r10
	movq %r10, -384(%rbp)
	movq -552(%rbp), %r10
	movq %r10, -392(%rbp)
	movq -560(%rbp), %r10
	movq %r10, -400(%rbp)
	movq -568(%rbp), %r10
	movq %r10, -408(%rbp)
	movq %r12, %rax
	jmp .LB20258
.LB20254:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB20260:
	movq -104(%rbp), %r12
	movq -96(%rbp), %r13
	addl %r13d, %r12d
	movq %r12, -104(%rbp)
	movq -272(%rbp), %r10
	movq %r10, -112(%rbp)
	movq -280(%rbp), %r10
	movq %r10, -120(%rbp)
	movq -288(%rbp), %r10
	movq %r10, -128(%rbp)
	movq -296(%rbp), %r10
	movq %r10, -136(%rbp)
	movq -304(%rbp), %r10
	movq %r10, -144(%rbp)
	movsd -1280(%rbp), %xmm0
	movsd -1288(%rbp), %xmm1
	movq -312(%rbp), %r10
	movq %r10, -152(%rbp)
	movq -320(%rbp), %r10
	movq %r10, -160(%rbp)
	movq -328(%rbp), %r10
	movq %r10, -168(%rbp)
	movq -336(%rbp), %r10
	movq %r10, -176(%rbp)
	movq -344(%rbp), %r10
	movq %r10, -184(%rbp)
	movq -352(%rbp), %r10
	movq %r10, -192(%rbp)
	movq -360(%rbp), %r10
	movq %r10, -200(%rbp)
	movq -368(%rbp), %r10
	movq %r10, -208(%rbp)
	movq -376(%rbp), %r10
	movq %r10, -216(%rbp)
	movq -384(%rbp), %r10
	movq %r10, -224(%rbp)
	movq -392(%rbp), %r10
	movq %r10, -232(%rbp)
	movq -400(%rbp), %r10
	movq %r10, -240(%rbp)
	movq -408(%rbp), %r10
	movq %r10, -248(%rbp)
	jmp .LB20252
.LB20274:
	movq -576(%rbp), %rcx
	movslq %r12d, %rax
	imulq $56, %rax, %rax
	leaq (%rcx,%rax,1), %rax
	movq (%rax), %r13
	movsd 8(%rax), %xmm0
	movsd %xmm0, -584(%rbp)
	movsd 16(%rax), %xmm0
	movsd %xmm0, -592(%rbp)
	movsd 24(%rax), %xmm0
	movsd %xmm0, -600(%rbp)
	movsd 32(%rax), %xmm0
	movsd %xmm0, -608(%rbp)
	movsd 40(%rax), %xmm0
	movsd %xmm0, -616(%rbp)
	movsd 48(%rax), %xmm0
	movsd %xmm0, -624(%rbp)
	movq $0, -632(%rbp)
	movq -64(%rbp), %r10
	movq %r10, -640(%rbp)
	movq -72(%rbp), %r10
	movq %r10, -648(%rbp)
	movq -80(%rbp), %r10
	movq %r10, -656(%rbp)
	movq -336(%rbp), %r10
	movq %r10, -664(%rbp)
	movq -344(%rbp), %r10
	movq %r10, -672(%rbp)
	movq -352(%rbp), %r10
	movq %r10, -1296(%rbp)
	movq -360(%rbp), %r10
	movq %r10, -1304(%rbp)
	movq -368(%rbp), %r10
	movq %r10, -1368(%rbp)
	movsd -376(%rbp), %xmm0
	movq -384(%rbp), %r10
	movq %r10, -680(%rbp)
	movsd -392(%rbp), %xmm1
	movq -400(%rbp), %r10
	movq %r10, -688(%rbp)
	movsd -408(%rbp), %xmm2
.LB20336:
	movq -632(%rbp), %rax
	cmpl %ebx, %eax
	jge .LB20338
.LB20337:
	movq -632(%rbp), %rax
	movslq %eax, %rax
	movl 5192(%rsi,%rax,4), %r14d
	movslq %r14d, %rax
	imulq $120, %rax, %rax
	leaq (%rdi,%rax,1), %rax
	movl (%rax), %ecx
	testl %ecx, %ecx
	je .LB20357
.LB20358:
	cmpl $1, %ecx
	jne .LB20492
.LB20491:
	movsd 32(%rax), %xmm0
	movsd -608(%rbp), %xmm3
	subsd %xmm3, %xmm0
	movsd %xmm0, -944(%rbp)
	movsd 40(%rax), %xmm0
	movsd -616(%rbp), %xmm3
	subsd %xmm3, %xmm0
	movsd %xmm0, -952(%rbp)
	movsd 48(%rax), %xmm3
	movsd -624(%rbp), %xmm4
	subsd %xmm4, %xmm3
	movsd %xmm3, -960(%rbp)
	mulsd %xmm0, %xmm0
	movsd -944(%rbp), %xmm4
	vfmadd231sd %xmm4, %xmm4, %xmm0
	vfmadd231sd %xmm3, %xmm3, %xmm0
	movsd %xmm0, -968(%rbp)
	movsd 112(%rax), %xmm0
	movabsq $4517329193108106637, %r10
	movq %r10, %xmm3
	ucomisd %xmm3, %xmm0
	jbe .LB20557
.LB20543:
	movsd -968(%rbp), %xmm3
	ucomisd %xmm0, %xmm3
	ja .LB20556
.LB20557:
	movsd -968(%rbp), %xmm0
	cvtsd2ss %xmm0, %xmm0
	callq standard__math__fisr__1__floatE1__ret_floatE1
	movaps %xmm0, %xmm2
	cvtss2sd %xmm2, %xmm1
	movabsq $4517329193108106637, %r10
	movq %r10, %xmm0
	ucomisd %xmm1, %xmm0
	ja .LB20568
.LB20569:
	movsd -952(%rbp), %xmm0
	movsd -592(%rbp), %xmm3
	mulsd %xmm3, %xmm0
	movsd -944(%rbp), %xmm3
	movsd -584(%rbp), %xmm4
	vfmadd231sd %xmm3, %xmm4, %xmm0
	movsd -960(%rbp), %xmm3
	movsd -600(%rbp), %xmm4
	vfmadd231sd %xmm3, %xmm4, %xmm0
	xorps %xmm3, %xmm3
	mulsd %xmm1, %xmm0
	movsd %xmm0, -1360(%rbp)
	ucomisd %xmm3, %xmm0
	ja .LB20588
.LB20589:
	movsd -640(%rbp), %xmm0
	movsd -648(%rbp), %xmm3
	movsd -656(%rbp), %xmm4
	movq -672(%rbp), %r10
	movq %r10, -976(%rbp)
	movq -680(%rbp), %r10
	movq %r10, -984(%rbp)
	movq -688(%rbp), %r10
	movq %r10, -992(%rbp)
.LB20590:
	movsd -944(%rbp), %xmm5
	movq -952(%rbp), %r10
	movq %r10, -888(%rbp)
	movq -960(%rbp), %r10
	movq %r10, -896(%rbp)
	movq -968(%rbp), %r10
	movq %r10, -904(%rbp)
	movq -984(%rbp), %r10
	movq %r10, -912(%rbp)
	movsd %xmm1, -920(%rbp)
	movq -992(%rbp), %r10
	movq %r10, -928(%rbp)
	movsd %xmm2, -936(%rbp)
	movaps %xmm3, %xmm1
	movaps %xmm4, %xmm2
	movsd -1360(%rbp), %xmm3
	movsd -976(%rbp), %xmm4
.LB20359:
	movq -632(%rbp), %rax
	incl %eax
	movq %rax, -632(%rbp)
	movq %r14, %rdx
	movsd %xmm0, -640(%rbp)
	movsd %xmm1, -648(%rbp)
	movsd %xmm2, -656(%rbp)
	movsd %xmm3, -664(%rbp)
	movsd %xmm4, -672(%rbp)
	movsd %xmm5, -1296(%rbp)
	movq -888(%rbp), %r10
	movq %r10, -1304(%rbp)
	movq -896(%rbp), %r10
	movq %r10, -1368(%rbp)
	movsd -904(%rbp), %xmm0
	movq -912(%rbp), %r10
	movq %r10, -680(%rbp)
	movsd -920(%rbp), %xmm1
	movq -928(%rbp), %r10
	movq %r10, -688(%rbp)
	movsd -936(%rbp), %xmm2
	jmp .LB20336
.LB20338:
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm3
	movsd %xmm3, -696(%rbp)
	movsd -640(%rbp), %xmm4
	ucomisd %xmm3, %xmm4
	ja .LB20722
.LB20723:
	movq -640(%rbp), %r10
	movq %r10, -704(%rbp)
.LB20724:
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm3
	movsd %xmm3, -712(%rbp)
	movsd -648(%rbp), %xmm4
	ucomisd %xmm3, %xmm4
	ja .LB20727
.LB20728:
	movq -648(%rbp), %r10
	movq %r10, -720(%rbp)
.LB20729:
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm3
	movsd %xmm3, -728(%rbp)
	movsd -656(%rbp), %xmm4
	ucomisd %xmm3, %xmm4
	ja .LB20732
.LB20733:
	movq -656(%rbp), %r10
	movq %r10, -736(%rbp)
.LB20734:
	movabsq $4679240012837945344, %r10
	movq %r10, %xmm3
	movl $65536, %ecx
	movl $65536, %r8d
	movl $65536, %r9d
	movl $65535, %r15d
	movsd %xmm3, -744(%rbp)
	movsd -704(%rbp), %xmm4
	mulsd %xmm4, %xmm3
	movsd %xmm3, -752(%rbp)
	cvttsd2siq %xmm3, %rax
	movabsq $4679240012837945344, %r10
	movq %r10, %xmm3
	movsd %xmm3, -760(%rbp)
	movsd -720(%rbp), %xmm4
	cmpq $65536, %rax
	cmova %rcx, %rax
	mulsd %xmm4, %xmm3
	movsd %xmm3, -768(%rbp)
	cvttsd2siq %xmm3, %rcx
	movabsq $4679240012837945344, %r10
	movq %r10, %xmm3
	movsd %xmm3, -776(%rbp)
	movsd -736(%rbp), %xmm4
	cmpq $65536, %rcx
	cmova %r8, %rcx
	mulsd %xmm4, %xmm3
	movsd %xmm3, -784(%rbp)
	cvttsd2siq %xmm3, %r8
	cmpq $65536, %r8
	cmova %r9, %r8
	movq %r13, %r9
	shrq $32, %r9
	andq $65535, %r9
	imulq %rax, %r9
	shrq $16, %r9
	movq %r13, %r14
	shrq $16, %r14
	andq $65535, %r14
	imulq %rcx, %r14
	shrq $16, %r14
	movq %r14, -1312(%rbp)
	movq %r13, %r14
	andq $65535, %r14
	movq %r15, -808(%rbp)
	imulq %r8, %r14
	shrq $16, %r14
	cmpq $65535, %r9
	cmova %r15, %r9
	movq %r9, -1320(%rbp)
	movl $65535, %r9d
	movq %r9, -816(%rbp)
	movq -1312(%rbp), %r15
	cmpq $65535, %r15
	cmova %r9, %r15
	movl $65535, %r9d
	cmpq $65535, %r14
	movq %r15, -1328(%rbp)
	cmova %r9, %r14
	movq %r9, -824(%rbp)
	movq %r14, -1336(%rbp)
	movq -1320(%rbp), %r9
	movabsq $-281474976710656, %r14
	shlq $32, %r9
	movq %r9, -832(%rbp)
	orq %r14, %r9
	movq %r14, -840(%rbp)
	movq %r9, -848(%rbp)
	movq -1328(%rbp), %r14
	shlq $16, %r14
	movq %r14, -856(%rbp)
	orq %r14, %r9
	movq %r9, -864(%rbp)
	movq -1336(%rbp), %r14
	orq %r14, %r9
	movslq %r12d, %r14
	movq %r9, -872(%rbp)
	movq %r14, -880(%rbp)
	movq -256(%rbp), %r15
	movq %r9, (%r15,%r14,8)
	movq -1320(%rbp), %r9
	movq -1336(%rbp), %r10
	movq %r10, -440(%rbp)
	movq %rax, -448(%rbp)
	movq %rcx, -456(%rbp)
	movq %r8, -464(%rbp)
	movsd -584(%rbp), %xmm3
	movsd -592(%rbp), %xmm4
	movsd -600(%rbp), %xmm5
	movq -608(%rbp), %r10
	movq %r10, -472(%rbp)
	movq -616(%rbp), %r10
	movq %r10, -480(%rbp)
	movq -624(%rbp), %r10
	movq %r10, -488(%rbp)
	movq -664(%rbp), %r10
	movq %r10, -496(%rbp)
	movq -672(%rbp), %r10
	movq %r10, -504(%rbp)
	movq -1296(%rbp), %r10
	movq %r10, -512(%rbp)
	movq -1304(%rbp), %r10
	movq %r10, -520(%rbp)
	movq -1368(%rbp), %r10
	movq %r10, -528(%rbp)
	movsd %xmm0, -536(%rbp)
	movq -680(%rbp), %r10
	movq %r10, -544(%rbp)
	movsd %xmm1, -552(%rbp)
	movq -688(%rbp), %r10
	movq %r10, -560(%rbp)
	movsd %xmm2, -568(%rbp)
	movq -632(%rbp), %rcx
	movq %r13, %r8
	movq -1328(%rbp), %rax
	movsd -704(%rbp), %xmm0
	movsd -720(%rbp), %xmm1
	movsd -736(%rbp), %xmm2
	jmp .LB20276
.LB20722:
	movabsq $4607182418800017408, %r10
	movq %r10, -704(%rbp)
	jmp .LB20724
.LB20727:
	movabsq $4607182418800017408, %r10
	movq %r10, -720(%rbp)
	jmp .LB20729
.LB20732:
	movabsq $4607182418800017408, %r10
	movq %r10, -736(%rbp)
	jmp .LB20734
.LB20492:
	movsd -664(%rbp), %xmm3
	movsd -672(%rbp), %xmm4
	movsd -1296(%rbp), %xmm5
	movq -1304(%rbp), %r10
	movq %r10, -888(%rbp)
	movq -1368(%rbp), %r10
	movq %r10, -896(%rbp)
	movsd %xmm0, -904(%rbp)
	movq -680(%rbp), %r10
	movq %r10, -912(%rbp)
	movsd %xmm1, -920(%rbp)
	movq -688(%rbp), %r10
	movq %r10, -928(%rbp)
	movsd %xmm2, -936(%rbp)
	movsd -640(%rbp), %xmm0
	movsd -648(%rbp), %xmm1
	movsd -656(%rbp), %xmm2
	jmp .LB20359
.LB20588:
	movslq %r14d, %rax
	movaps %xmm1, %xmm0
	mulsd %xmm1, %xmm0
	imulq $120, %rax, %rax
	leaq (%rdi,%rax,1), %rax
	movsd 88(%rax), %xmm3
	movsd 96(%rax), %xmm4
	mulsd %xmm1, %xmm4
	vfmadd132sd %xmm0, %xmm4, %xmm3
	movsd 104(%rax), %xmm4
	addsd %xmm4, %xmm3
	movaps %xmm3, %xmm15
	movaps %xmm0, %xmm3
	divsd %xmm15, %xmm3
	movsd %xmm3, -1352(%rbp)
	movsd 80(%rax), %xmm4
	movsd -1360(%rbp), %xmm5
	mulsd %xmm5, %xmm4
	mulsd %xmm4, %xmm3
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm4
	movsd %xmm3, -1344(%rbp)
	movsd %xmm4, -1000(%rbp)
	ucomisd %xmm4, %xmm3
	ja .LB20640
.LB20641:
	movsd -1344(%rbp), %xmm3
.LB20642:
	movabsq $998445679, %r10
	movq %r10, %xmm4
	movsd %xmm4, -1008(%rbp)
	cvtss2sd %xmm4, %xmm4
	movsd %xmm4, -1016(%rbp)
	ucomisd %xmm4, %xmm3
	ja .LB20646
.LB20647:
	movq -640(%rbp), %r10
	movq %r10, -1024(%rbp)
	movq -648(%rbp), %r10
	movq %r10, -1032(%rbp)
	movq -656(%rbp), %r10
	movq %r10, -1040(%rbp)
.LB20648:
	movsd -1040(%rbp), %xmm4
	movq -1352(%rbp), %r10
	movq %r10, -976(%rbp)
	movsd %xmm3, -984(%rbp)
	movsd %xmm0, -992(%rbp)
	movsd -1024(%rbp), %xmm0
	movsd -1032(%rbp), %xmm3
	jmp .LB20590
.LB20640:
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm3
	jmp .LB20642
.LB20646:
	movslq %r14d, %rax
	imulq $120, %rax, %rax
	leaq (%rdi,%rax,1), %rax
	movsd 56(%rax), %xmm4
	movsd %xmm4, -1048(%rbp)
	movsd -640(%rbp), %xmm5
	vfmadd132sd %xmm3, %xmm5, %xmm4
	movsd %xmm4, -1056(%rbp)
	movsd 64(%rax), %xmm4
	movsd %xmm4, -1064(%rbp)
	movsd -648(%rbp), %xmm5
	vfmadd132sd %xmm3, %xmm5, %xmm4
	movsd %xmm4, -1072(%rbp)
	movsd 72(%rax), %xmm4
	movsd %xmm4, -1080(%rbp)
	movsd -656(%rbp), %xmm5
	vfmadd132sd %xmm3, %xmm5, %xmm4
	movsd %xmm4, -1088(%rbp)
	movq -1056(%rbp), %r10
	movq %r10, -1024(%rbp)
	movq -1072(%rbp), %r10
	movq %r10, -1032(%rbp)
	movq -1088(%rbp), %r10
	movq %r10, -1040(%rbp)
	jmp .LB20648
.LB20568:
	movq -632(%rbp), %rax
	incl %eax
	movq %rax, -632(%rbp)
	movq %r14, %rdx
	movq -944(%rbp), %r10
	movq %r10, -1296(%rbp)
	movq -952(%rbp), %r10
	movq %r10, -1304(%rbp)
	movq -960(%rbp), %r10
	movq %r10, -1368(%rbp)
	movsd -968(%rbp), %xmm0
	jmp .LB20336
.LB20556:
	movq -632(%rbp), %rax
	incl %eax
	movq %rax, -632(%rbp)
	movq %r14, %rdx
	movq -944(%rbp), %r10
	movq %r10, -1296(%rbp)
	movq -952(%rbp), %r10
	movq %r10, -1304(%rbp)
	movq -960(%rbp), %r10
	movq %r10, -1368(%rbp)
	movsd -968(%rbp), %xmm0
	jmp .LB20336
.LB20357:
	movsd 8(%rax), %xmm3
	movsd %xmm3, -1096(%rbp)
	movsd 16(%rax), %xmm4
	movsd %xmm4, -1104(%rbp)
	movsd -592(%rbp), %xmm5
	mulsd %xmm5, %xmm4
	movsd %xmm4, -1112(%rbp)
	movsd -584(%rbp), %xmm5
	vfmadd132sd %xmm5, %xmm4, %xmm3
	movsd %xmm3, -1120(%rbp)
	movsd 24(%rax), %xmm4
	movsd %xmm4, -1128(%rbp)
	movsd -600(%rbp), %xmm5
	vfmadd231sd %xmm4, %xmm5, %xmm3
	xorps %xmm4, %xmm4
	movsd %xmm3, -1136(%rbp)
	movaps %xmm3, %xmm15
	movaps %xmm4, %xmm3
	subsd %xmm15, %xmm3
	movsd %xmm4, -1144(%rbp)
	xorps %xmm4, %xmm4
	movsd %xmm3, -1152(%rbp)
	movsd %xmm4, -1160(%rbp)
	ucomisd %xmm4, %xmm3
	ja .LB20395
.LB20396:
	movq -640(%rbp), %r10
	movq %r10, -1168(%rbp)
	movq -648(%rbp), %r10
	movq %r10, -1176(%rbp)
	movq -656(%rbp), %r10
	movq %r10, -1184(%rbp)
	movq -680(%rbp), %r10
	movq %r10, -1192(%rbp)
.LB20397:
	movsd -1152(%rbp), %xmm3
	movsd -672(%rbp), %xmm4
	movsd -1296(%rbp), %xmm5
	movq -1304(%rbp), %r10
	movq %r10, -888(%rbp)
	movq -1368(%rbp), %r10
	movq %r10, -896(%rbp)
	movsd %xmm0, -904(%rbp)
	movq -1192(%rbp), %r10
	movq %r10, -912(%rbp)
	movsd %xmm1, -920(%rbp)
	movq -688(%rbp), %r10
	movq %r10, -928(%rbp)
	movsd %xmm2, -936(%rbp)
	movsd -1168(%rbp), %xmm0
	movsd -1176(%rbp), %xmm1
	movsd -1184(%rbp), %xmm2
	jmp .LB20359
.LB20395:
	movsd 80(%rax), %xmm3
	movsd %xmm3, -1200(%rbp)
	movsd -1152(%rbp), %xmm4
	mulsd %xmm4, %xmm3
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm4
	movsd %xmm3, -1208(%rbp)
	movsd %xmm4, -1216(%rbp)
	ucomisd %xmm4, %xmm3
	ja .LB20410
.LB20411:
	movq -1208(%rbp), %r10
	movq %r10, -1224(%rbp)
.LB20412:
	movslq %r14d, %rax
	imulq $120, %rax, %rax
	leaq (%rdi,%rax,1), %rax
	movsd 56(%rax), %xmm3
	movsd %xmm3, -1232(%rbp)
	movsd -1224(%rbp), %xmm4
	movsd -640(%rbp), %xmm5
	vfmadd132sd %xmm4, %xmm5, %xmm3
	movsd %xmm3, -1240(%rbp)
	movsd 64(%rax), %xmm3
	movsd %xmm3, -1248(%rbp)
	movsd -648(%rbp), %xmm5
	vfmadd132sd %xmm4, %xmm5, %xmm3
	movsd %xmm3, -1256(%rbp)
	movsd 72(%rax), %xmm3
	movsd %xmm3, -1264(%rbp)
	movsd -1224(%rbp), %xmm4
	movsd -656(%rbp), %xmm5
	vfmadd132sd %xmm4, %xmm5, %xmm3
	movsd %xmm3, -1272(%rbp)
	movq -1240(%rbp), %r10
	movq %r10, -1168(%rbp)
	movq -1256(%rbp), %r10
	movq %r10, -1176(%rbp)
	movq -1272(%rbp), %r10
	movq %r10, -1184(%rbp)
	movq -1224(%rbp), %r10
	movq %r10, -1192(%rbp)
	jmp .LB20397
.LB20410:
	movabsq $4607182418800017408, %r10
	movq %r10, -1224(%rbp)
	jmp .LB20412
	.text
	.globl raycaster__r3d_mesh_worker__1__voidE1_ptr1__ret_voidE1_ptr1
	.def raycaster__r3d_mesh_worker__1__voidE1_ptr1__ret_voidE1_ptr1;
	.scl 2;
	.type 32;
	.endef
raycaster__r3d_mesh_worker__1__voidE1_ptr1__ret_voidE1_ptr1:
	pushq %rbp
	movq %rsp, %rbp
	subq $176, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
	movq %r14, -48(%rbp)
	movq %r15, -56(%rbp)
.LB16230:
	movq %rcx, %rax
	movq %rax, %rbx
	xorl %esi, %esi
	movq $0, -88(%rbp)
	movq $0, -96(%rbp)
	movq $0, -104(%rbp)
	movq $0, -80(%rbp)
.LB16237:
	leaq 56(%rbx), %rax
	movq (%rax), %rax
	movl WIN32_INFINITE(%rip), %edx
	movq %rax, %rcx
	callq WaitForSingleObject
	cmpl $0, 120(%rbx)
	je .LB16247
.LB16248:
	movq (%rbx), %rdi
	movl 48(%rbx), %eax
	cmpl $1, %eax
	je .LB16261
.LB16262:
	cmpl $2, %eax
	je .LB16279
.LB16280:
	cmpl $4, %eax
	je .LB16296
.LB16297:
	cmpl $3, %eax
	je .LB16323
.LB16324:
	cmpl $5, %eax
	je .LB16340
.LB16341:
	cmpl $6, %eax
	je .LB16357
.LB16358:
	movq 32(%rbx), %rcx
	callq standard__memory__allocators__stdarena__arena_reset__1__ArenaE1_ptr1__ret_voidE1
	xorl %esi, %esi
.LB16437:
	cmpl 5552(%rdi), %esi
	jge .LB16439
.LB16438:
	movq 5544(%rdi), %rax
	movslq %esi, %rcx
	imulq $136, %rcx, %rcx
	leaq (%rax,%rcx,1), %rax
	movq (%rax), %rcx
	leaq 8(%rax), %rdx
	movq (%rdi), %r8
	movq 88(%rdi), %r9
	movq 32(%rbx), %rax
	movq 8(%rbx), %r12
	movq 24(%rbx), %r13
	movl 40(%rbx), %r14d
	movl 44(%rbx), %r15d
	movq %rax, 32(%rsp)
	movq %r12, 40(%rsp)
	movq %r13, 48(%rsp)
	movq %r14, 56(%rsp)
	movq %r15, 64(%rsp)
	callq raycaster__r3d_draw_mesh_inst__9__R3DMeshInstE1_ptr1__DMat4E1_ptr1__R3DCameraE1_ptr1__RCTexturePaletteE1_ptr1__ArenaE1_ptr1__doubleE1_ptr1__R3DGBufPixelE1_ptr1__dataE1_sbits32__dataE1_sbits32__ret_voidE1
	incl %esi
	cmpl 5552(%rdi), %esi
	jl .LB16438
.LB16439:
	movq %rsi, -72(%rbp)
.LB16263:
	movq (%rbx), %rax
	leaq 5484(%rax), %rcx
	movl $0, -60(%rbp)
	movabsq $4294967295, %rdx
	leaq -60(%rbp), %r8
	movq %rcx, %rsi
	                movq %r8, %rdi
	                movl %edx, %eax
	                lock xaddl %eax, (%rsi)
	                movl %eax, (%rdi)
	cmpl $1, -60(%rbp)
	je .LB16504
.LB16505:
	movq -88(%rbp), %rax
	movq -96(%rbp), %rcx
	movq -104(%rbp), %rdx
	movq -80(%rbp), %rsi
.LB16506:
	movq %rax, -88(%rbp)
	movq %rcx, -96(%rbp)
	movq %rdx, -104(%rbp)
	movq %rsi, -80(%rbp)
	movq -72(%rbp), %rsi
	jmp .LB16237
.LB16357:
	movq 32(%rbx), %rcx
	callq standard__memory__allocators__stdarena__arena_reset__1__ArenaE1_ptr1__ret_voidE1
	xorl %esi, %esi
.LB16363:
	cmpl 5552(%rdi), %esi
	jge .LB16365
.LB16364:
	movq 5544(%rdi), %rax
	movslq %esi, %rcx
	imulq $136, %rcx, %rcx
	leaq (%rax,%rcx,1), %rax
	movq (%rax), %rcx
	leaq 8(%rax), %rdx
	movq (%rdi), %r8
	movq 88(%rdi), %r9
	movq 32(%rbx), %rax
	movq 8(%rbx), %r12
	movq 24(%rbx), %r13
	movl 40(%rbx), %r14d
	movl 44(%rbx), %r15d
	movq %rax, 32(%rsp)
	movq %r12, 40(%rsp)
	movq %r13, 48(%rsp)
	movq %r14, 56(%rsp)
	movq %r15, 64(%rsp)
	callq raycaster__r3d_draw_mesh_inst__9__R3DMeshInstE1_ptr1__DMat4E1_ptr1__R3DCameraE1_ptr1__RCTexturePaletteE1_ptr1__ArenaE1_ptr1__doubleE1_ptr1__R3DGBufPixelE1_ptr1__dataE1_sbits32__dataE1_sbits32__ret_voidE1
	incl %esi
	cmpl 5552(%rdi), %esi
	jl .LB16364
.LB16365:
	movl 40(%rbx), %edx
	movl 44(%rbx), %r8d
	movq %rdi, %rcx
	callq raycaster__r3d_lighting_rows__3__R3DSceneE1_ptr1__dataE1_sbits32__dataE1_sbits32__ret_voidE1
	movq %rsi, -72(%rbp)
	jmp .LB16263
.LB16340:
	movl 40(%rbx), %edx
	movl 44(%rbx), %r8d
	movq %rdi, %rcx
	callq raycaster__r3d_lighting_rows__3__R3DSceneE1_ptr1__dataE1_sbits32__dataE1_sbits32__ret_voidE1
	movq %rsi, -72(%rbp)
	jmp .LB16263
.LB16323:
	movl 40(%rbx), %edx
	movl 44(%rbx), %r8d
	movq %rdi, %rcx
	callq raycaster__r3d_vol_upsample_rows__3__R3DSceneE1_ptr1__dataE1_sbits32__dataE1_sbits32__ret_voidE1
	movq %rsi, -72(%rbp)
	jmp .LB16263
.LB16296:
	movl 40(%rbx), %edx
	movl 44(%rbx), %r8d
	movq %rdi, %rcx
	callq raycaster__r3d_fog_blend_rows__3__R3DSceneE1_ptr1__dataE1_sbits32__dataE1_sbits32__ret_voidE1
	movl 40(%rbx), %edx
	movl 44(%rbx), %r8d
	movq %rdi, %rcx
	callq raycaster__r3d_vol_scatter_rows__3__R3DSceneE1_ptr1__dataE1_sbits32__dataE1_sbits32__ret_voidE1
	movq %rsi, -72(%rbp)
	jmp .LB16263
.LB16279:
	movl 40(%rbx), %edx
	movl 44(%rbx), %r8d
	movq %rdi, %rcx
	callq raycaster__r3d_fog_blend_rows__3__R3DSceneE1_ptr1__dataE1_sbits32__dataE1_sbits32__ret_voidE1
	movq %rsi, -72(%rbp)
	jmp .LB16263
.LB16261:
	movl 40(%rbx), %edx
	movl 44(%rbx), %r8d
	movq %rdi, %rcx
	callq raycaster__r3d_vol_scatter_rows__3__R3DSceneE1_ptr1__dataE1_sbits32__dataE1_sbits32__ret_voidE1
	movq %rsi, -72(%rbp)
	jmp .LB16263
.LB16504:
	movq (%rbx), %rax
	leaq 5452(%rax), %rsi
	movq %rsi, %rdi
	movq (%rdi), %rax
	movq %rax, %r12
	movq %r12, %rcx
	movl $1, %edx
	xorl %r8d, %r8d
	callq ReleaseSemaphore
	movq %rsi, %rax
	movq %r12, %rcx
	movq %rsi, %rdx
	movq %rdi, %rsi
	jmp .LB16506
.LB16247:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
	.text
	.globl raycaster__r3d_render__3__R3DSceneE1_ptr1__dataE1_ptr1_ubits64__doubleE1_ptr1__ret_voidE1
	.def raycaster__r3d_render__3__R3DSceneE1_ptr1__dataE1_ptr1_ubits64__doubleE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
raycaster__r3d_render__3__R3DSceneE1_ptr1__dataE1_ptr1_ubits64__doubleE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $1440, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
	movq %r14, -48(%rbp)
	movq %r15, -56(%rbp)
.LB18040:
	movq %rcx, %rbx
	movq %rdx, %r12
	movq %r8, %r13
	leaq 200(%rbx), %rcx
	callq standard__memory__allocators__stdarena__arena_reset__1__ArenaE1_ptr1__ret_voidE1
	callq GetTickCount
	movl %eax, %esi
	movq (%rbx), %rax
	movl 20(%rax), %ecx
	imull 16(%rax), %ecx
	movq %rcx, -1296(%rbp)
	movq %r12, %rcx
	movl -1296(%rbp), %eax
	movq %rax, %rdi
	shlq $3, %rdi
	xorl %edx, %edx
	movq %rdi, %r8
	callq mem_fill__3__voidE1_ptr1__byteE1__dataE1_ubits64__ret_voidE1
	movq %r13, %rcx
	xorl %edx, %edx
	movq %rdi, %r8
	callq mem_fill__3__voidE1_ptr1__byteE1__dataE1_ubits64__ret_voidE1
	callq GetTickCount
	movl %eax, %edi
	movl %edi, %eax
	subl %esi, %eax
	movslq %eax, %rax
	xorps %xmm0, %xmm0
	cvtsi2sdq %rax, %xmm0
	movsd %xmm0, 5488(%rbx)
	movq 96(%rbx), %rax
	testq %rax, %rax
	jne .LB18106
.LB18108:
	callq GetTickCount
	movq %rax, -1304(%rbp)
	subl %edi, %eax
	movslq %eax, %rax
	xorps %xmm0, %xmm0
	cvtsi2sdq %rax, %xmm0
	movsd %xmm0, 5496(%rbx)
	movl 104(%rbx), %eax
	andl $16, %eax
	jne .LB18135
.LB18136:
	movq $0, -608(%rbp)
.LB18137:
	movl 104(%rbx), %eax
	movq 32(%rbx), %rdx
	movl 40(%rbx), %r8d
	xorl %ecx, %ecx
	andl $32, %eax
	testq %rdx, %rdx
	setne %cl
	andl %ecx, %eax
	xorl %ecx, %ecx
	testl %r8d, %r8d
	setg %cl
	andl %ecx, %eax
	jne .LB18962
.LB18964:
	movsd 120(%rbx), %xmm0
	movsd 112(%rbx), %xmm1
	ucomisd %xmm1, %xmm0
	movsd 152(%rbx), %xmm0
	xorps %xmm1, %xmm1
	seta %sil
	movzbl %sil, %esi
	ucomisd %xmm1, %xmm0
	seta %dil
	movzbl %dil, %edi
	testb %dil, %dil
	jne .LB19008
.LB25199:
	movq $0, -536(%rbp)
.LB19009:
	testb %sil, %sil
	jne .LB19021
.LB19017:
	testb %dil, %dil
	jne .LB19021
.LB19023:
	movq -536(%rbp), %rax
	testb %al, %al
	jne .LB20060
.LB20062:
	movl 104(%rbx), %eax
	andl $128, %eax
	jne .LB20108
.LB20110:
	callq GetTickCount
	movq -608(%rbp), %rcx
	subl %ecx, %eax
	movslq %eax, %rax
	xorps %xmm0, %xmm0
	cvtsi2sdq %rax, %xmm0
	movsd %xmm0, 5528(%rbx)
	xorps %xmm0, %xmm0
	movsd %xmm0, 5536(%rbx)
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB18106:
	movq (%rbx), %rdx
	movq 8(%rbx), %r8
	movq %rax, %rcx
	movq %r12, %r9
	callq raycaster__r3d_draw_sky__4__RCSkyE1_ptr1__R3DCameraE1_ptr1__R3DPlayerE1_ptr1__dataE1_ptr1_ubits64__ret_voidE1
	jmp .LB18108
.LB18135:
	movq (%rbx), %rax
	movl 16(%rax), %esi
	movl 20(%rax), %edi
	movq 5176(%rbx), %rax
	testq %rax, %rax
	je .LB18187
.LB18169:
	movl 5184(%rbx), %eax
	cmpl %esi, %eax
	jne .LB18187
.LB18178:
	movl 5188(%rbx), %eax
	cmpl %edi, %eax
	jne .LB18187
.LB18189:
	movl $0, 5552(%rbx)
	xorl %esi, %esi
.LB18229:
	cmpl 24(%rbx), %esi
	jge .LB18231
.LB18230:
	movq 16(%rbx), %rax
	movslq %esi, %rcx
	movq (%rax,%rcx,8), %rdi
	testq %rdi, %rdi
	je .LB18265
.LB18252:
	movq (%rbx), %rdx
	movq %rdi, %rcx
	callq raycaster__r3d_inst_cull__2__R3DMeshInstE1_ptr1__R3DCameraE1_ptr1__ret_boolE1
	testb %al, %al
	jne .LB18265
.LB18263:
	movq 5544(%rbx), %rax
	movslq 5552(%rbx), %rcx
	imulq $136, %rcx, %rcx
	movq %rdi, (%rax,%rcx,1)
	movsd 8(%rdi), %xmm0
	movsd 16(%rdi), %xmm2
	movsd 24(%rdi), %xmm1
	leaq -440(%rbp), %rcx
	movsd %xmm1, -1360(%rbp)
	movsd 32(%rdi), %xmm1
	movsd 40(%rdi), %xmm3
	movsd 48(%rdi), %xmm4
	movsd 56(%rdi), %xmm5
	movsd %xmm5, -1312(%rbp)
	movsd 64(%rdi), %xmm5
	movsd %xmm5, -1320(%rbp)
	movsd 72(%rdi), %xmm5
	movsd %xmm5, -1328(%rbp)
	movsd %xmm1, 32(%rsp)
	movsd %xmm3, 40(%rsp)
	movsd %xmm4, 48(%rsp)
	movsd -1312(%rbp), %xmm1
	movsd %xmm1, 56(%rsp)
	movsd -1320(%rbp), %xmm1
	movsd %xmm1, 64(%rsp)
	movsd -1328(%rbp), %xmm1
	movsd %xmm1, 72(%rsp)
	movaps %xmm0, %xmm1
	movsd -1360(%rbp), %xmm0
	movaps %xmm0, %xmm3
	callq raycaster__dmat4_trs__9__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__ret_DMat4E1
	movq 5544(%rbx), %rax
	movslq 5552(%rbx), %rcx
	imulq $136, %rcx, %rcx
	vmovdqu -440(%rbp), %ymm15
	vmovdqu %ymm15, 8(%rax,%rcx,1)
	vmovdqu -408(%rbp), %ymm15
	vmovdqu %ymm15, 40(%rax,%rcx,1)
	vmovdqu -376(%rbp), %ymm15
	vmovdqu %ymm15, 72(%rax,%rcx,1)
	vmovdqu -344(%rbp), %ymm15
	vmovdqu %ymm15, 104(%rax,%rcx,1)
	vzeroupper
	movl 5552(%rbx), %eax
	incl %eax
	movl %eax, 5552(%rbx)
	cmpl 5556(%rbx), %eax
	jge .LB18341
.LB18265:
	incl %esi
	cmpl 24(%rbx), %esi
	jl .LB18230
	jmp .LB18231
.LB18187:
	movq 5176(%rbx), %rax
	testq %rax, %rax
	jne .LB18199
.LB18201:
	movq %rsi, %rax
	imulq %rdi, %rax
	imulq $56, %rax, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, 5176(%rbx)
	movl %esi, 5184(%rbx)
	movl %edi, 5188(%rbx)
	jmp .LB18189
.LB18199:
	movq %rax, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	jmp .LB18201
.LB18231:
	leaq 5484(%rbx), %rcx
	movl 5560(%rbx), %eax
	leal -1(%rax), %edx
	movq %rcx, %rsi
	                movl %edx, %eax
	                xchgl %eax, (%rsi)
	xorl %esi, %esi
.LB18357:
	movl 5560(%rbx), %eax
	leal -1(%rax), %edi
	cmpl %edi, %esi
	jge .LB18359
.LB18358:
	movslq %esi, %rax
	xorl %r8d, %r8d
	imulq $124, %rax, %rcx
	movq %rbx, 6336(%rbx,%rcx,1)
	imulq $124, %rax, %rcx
	movq %r13, 6344(%rbx,%rcx,1)
	imulq $124, %rax, %rcx
	imulq $124, %rax, %rdx
	movq %r12, 6352(%rbx,%rcx,1)
	movq 5176(%rbx), %rcx
	movq %rcx, 6360(%rbx,%rdx,1)
	imulq $124, %rax, %rcx
	imulq $124, %rax, %rax
	movl $1, %edx
	movl $6, 6384(%rbx,%rcx,1)
	leaq 6392(%rbx,%rax,1), %rax
	movq (%rax), %rax
	movq %rax, %rcx
	callq ReleaseSemaphore
	incl %esi
	jmp .LB18357
.LB18359:
	movslq %edi, %rax
	imulq $124, %rax, %rcx
	movq %rbx, 6336(%rbx,%rcx,1)
	imulq $124, %rax, %rcx
	movq %r13, 6344(%rbx,%rcx,1)
	imulq $124, %rax, %rcx
	imulq $124, %rax, %rdx
	imulq $124, %rax, %rax
	movq %r12, 6352(%rbx,%rcx,1)
	movq 5176(%rbx), %rcx
	movq %rcx, 6360(%rbx,%rdx,1)
	movq 6368(%rbx,%rax,1), %rcx
	callq standard__memory__allocators__stdarena__arena_reset__1__ArenaE1_ptr1__ret_voidE1
	xorl %esi, %esi
.LB18466:
	cmpl 5552(%rbx), %esi
	jge .LB18468
.LB18467:
	movq 5544(%rbx), %rax
	movslq %esi, %rcx
	imulq $136, %rcx, %rcx
	leaq (%rax,%rcx,1), %rax
	movq (%rax), %rcx
	leaq 8(%rax), %rdx
	movslq %edi, %rax
	movq (%rbx), %r8
	imulq $124, %rax, %rax
	movq 88(%rbx), %r9
	movq 6368(%rbx,%rax,1), %rax
	movq 5176(%rbx), %r14
	movl 5560(%rbx), %r15d
	movq %rax, 32(%rsp)
	movq %r13, 40(%rsp)
	movq %r14, 48(%rsp)
	movq %rdi, 56(%rsp)
	movq %r15, 64(%rsp)
	callq raycaster__r3d_draw_mesh_inst__9__R3DMeshInstE1_ptr1__DMat4E1_ptr1__R3DCameraE1_ptr1__RCTexturePaletteE1_ptr1__ArenaE1_ptr1__doubleE1_ptr1__R3DGBufPixelE1_ptr1__dataE1_sbits32__dataE1_sbits32__ret_voidE1
	incl %esi
	cmpl 5552(%rbx), %esi
	jl .LB18467
.LB18468:
	callq GetTickCount
	movl %eax, %esi
	movl 5560(%rbx), %r8d
	movq %rbx, %rcx
	movq %rdi, %rdx
	callq raycaster__r3d_lighting_rows__3__R3DSceneE1_ptr1__dataE1_sbits32__dataE1_sbits32__ret_voidE1
	callq GetTickCount
	movq -1304(%rbp), %rcx
	negl %ecx
	addl %esi, %ecx
	subl %esi, %eax
	movslq %ecx, %rcx
	movslq %eax, %rax
	xorps %xmm0, %xmm0
	cvtsi2sdq %rcx, %xmm0
	movsd %xmm0, 5512(%rbx)
	xorps %xmm0, %xmm0
	cvtsi2sdq %rax, %xmm0
	leaq 5452(%rbx), %rax
	movsd %xmm0, 5520(%rbx)
	movq (%rax), %rax
	movl WIN32_INFINITE(%rip), %edx
	movq %rax, %rcx
	callq WaitForSingleObject
	movq (%rbx), %rax
	movl 20(%rax), %ecx
	imull 16(%rax), %ecx
	movq 5176(%rbx), %rax
	movabsq $0, %r10
	movq %r10, -1224(%rbp)
	movabsq $0, %r10
	movq %r10, -1232(%rbp)
	movabsq $0, %r10
	movq %r10, -1240(%rbp)
	movabsq $0, %r10
	movq %r10, -1352(%rbp)
	xorps %xmm0, %xmm0
	xorps %xmm1, %xmm1
	movabsq $0, %r10
	movq %r10, -448(%rbp)
	movabsq $0, %r10
	movq %r10, -456(%rbp)
	movabsq $0, %r10
	movq %r10, -464(%rbp)
	xorl %edx, %edx
	movl $1, %esi
.LB18597:
	cmpl %ecx, %edx
	jge .LB18599
.LB18598:
	movslq %edx, %rdi
	movabsq $4517329193108106637, %r10
	movq %r10, %xmm3
	movsd (%r13,%rdi,8), %xmm2
	movsd %xmm2, -1184(%rbp)
	movsd %xmm3, -1192(%rbp)
	ucomisd %xmm3, %xmm2
	ja .LB18608
.LB18609:
	movsd -1240(%rbp), %xmm2
	movsd -1352(%rbp), %xmm3
	movaps %xmm0, %xmm4
	movaps %xmm1, %xmm5
	movq -448(%rbp), %r10
	movq %r10, -1200(%rbp)
	movq -456(%rbp), %r10
	movq %r10, -1208(%rbp)
	movq -464(%rbp), %r10
	movq %r10, -1216(%rbp)
	movsd -1224(%rbp), %xmm0
	movsd -1232(%rbp), %xmm1
.LB18610:
	addl $8, %edx
	movsd %xmm0, -1224(%rbp)
	movsd %xmm1, -1232(%rbp)
	movsd %xmm2, -1240(%rbp)
	movsd %xmm3, -1352(%rbp)
	movaps %xmm4, %xmm0
	movaps %xmm5, %xmm1
	movq -1200(%rbp), %r10
	movq %r10, -448(%rbp)
	movq -1208(%rbp), %r10
	movq %r10, -456(%rbp)
	movq -1216(%rbp), %r10
	movq %r10, -464(%rbp)
	cmpl %ecx, %edx
	jl .LB18598
.LB18599:
	movl $0, 5448(%rbx)
	movabsq $0, %r10
	movq %r10, -472(%rbp)
	movabsq $0, %r10
	movq %r10, -480(%rbp)
	movabsq $0, %r10
	movq %r10, -488(%rbp)
	movabsq $0, %r10
	movq %r10, -496(%rbp)
	movabsq $0, %r10
	movq %r10, -504(%rbp)
	movabsq $0, %r10
	movq %r10, -512(%rbp)
	movabsq $0, %r10
	movq %r10, -520(%rbp)
	movabsq $0, %r10
	movq %r10, -528(%rbp)
	xorl %eax, %eax
.LB18707:
	cmpl 56(%rbx), %eax
	jge .LB18709
.LB18708:
	movq 48(%rbx), %rcx
	movslq %eax, %rdx
	imulq $120, %rdx, %rdx
	leaq (%rcx,%rdx,1), %rcx
	movl (%rcx), %edx
	testl %edx, %edx
	je .LB18731
.LB18732:
	cmpl $1, %edx
	jne .LB18770
.LB18764:
	testb %sil, %sil
	je .LB18769
.LB18770:
	movq -472(%rbp), %r10
	movq %r10, -984(%rbp)
	movq -480(%rbp), %r10
	movq %r10, -992(%rbp)
	movq -488(%rbp), %r10
	movq %r10, -1000(%rbp)
	movq -496(%rbp), %r10
	movq %r10, -1008(%rbp)
	movq -504(%rbp), %r10
	movq %r10, -1016(%rbp)
	movq -512(%rbp), %r10
	movq %r10, -1024(%rbp)
	movq -520(%rbp), %r10
	movq %r10, -1032(%rbp)
	movq -528(%rbp), %r10
	movq %r10, -1040(%rbp)
.LB18733:
	incl %eax
	movq -984(%rbp), %r10
	movq %r10, -472(%rbp)
	movq -992(%rbp), %r10
	movq %r10, -480(%rbp)
	movq -1000(%rbp), %r10
	movq %r10, -488(%rbp)
	movq -1008(%rbp), %r10
	movq %r10, -496(%rbp)
	movq -1016(%rbp), %r10
	movq %r10, -504(%rbp)
	movq -1024(%rbp), %r10
	movq %r10, -512(%rbp)
	movq -1032(%rbp), %r10
	movq %r10, -520(%rbp)
	movq -1040(%rbp), %r10
	movq %r10, -528(%rbp)
	cmpl 56(%rbx), %eax
	jl .LB18708
.LB18709:
	callq GetTickCount
	movslq 5448(%rbx), %rcx
	xorps %xmm0, %xmm0
	cvtsi2sdq %rcx, %xmm0
	movsd %xmm0, 5504(%rbx)
	movq %rax, -608(%rbp)
	jmp .LB18137
.LB18962:
	movq (%rbx), %rcx
	movq 88(%rbx), %r9
	movq %r13, 32(%rsp)
	movq %r12, 40(%rsp)
	callq raycaster__r3d_draw_sprites__6__R3DCameraE1_ptr1__R3DSpriteE1_ptr1__dataE1_sbits32__RCTexturePaletteE1_ptr1__doubleE1_ptr1__dataE1_ptr1_ubits64__ret_voidE1
	jmp .LB18964
.LB19008:
	xorl %eax, %eax
	cmpl $0, 56(%rbx)
	setg %al
	movq %rax, -536(%rbp)
	testb %sil, %sil
	je .LB19017
.LB19021:
	movsd 128(%rbx), %xmm0
	movsd 136(%rbx), %xmm1
	movsd 144(%rbx), %xmm2
	callq raycaster__color64_pack__3__doubleE1__doubleE1__doubleE1__ret_dataE1_ubits64
	movq %rax, -544(%rbp)
	movsd 176(%rbx), %xmm0
	movsd 184(%rbx), %xmm1
	movsd 192(%rbx), %xmm2
	callq raycaster__color64_pack__3__doubleE1__doubleE1__doubleE1__ret_dataE1_ubits64
	movsd 120(%rbx), %xmm0
	movsd 112(%rbx), %xmm1
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm2
	testb %dil, %dil
	subsd %xmm1, %xmm0
	movaps %xmm0, %xmm15
	movaps %xmm2, %xmm0
	divsd %xmm15, %xmm0
	movsd 152(%rbx), %xmm2
	movq (%rbx), %rcx
	movsd 32(%rcx), %xmm3
	movq -544(%rbp), %rcx
	cmovne %rax, %rcx
	movq -1296(%rbp), %rax
	movl %eax, 5044(%rbx)
	movq (%rbx), %rax
	movl 16(%rax), %eax
	movl %eax, 5048(%rbx)
	movq (%rbx), %rax
	movl 20(%rax), %eax
	movl %eax, 5052(%rbx)
	movq %rcx, %rax
	shrq $32, %rax
	movsd %xmm0, 5056(%rbx)
	movsd %xmm1, 5064(%rbx)
	andq $65535, %rax
	movsd %xmm2, 5072(%rbx)
	movsd %xmm3, 5080(%rbx)
	movq %rcx, 5088(%rbx)
	movq %rax, 5096(%rbx)
	movq %rcx, %rax
	shrq $16, %rax
	andq $65535, %rax
	andq $65535, %rcx
	movq %rax, 5104(%rbx)
	movq %rcx, 5112(%rbx)
	movq %r13, 5120(%rbx)
	movq %r12, 5128(%rbx)
	testb %sil, %sil
	je .LB19171
.LB19166:
	testb %dil, %dil
	jne .LB19170
.LB19171:
	testb %sil, %sil
	jne .LB19177
.LB19178:
	movl $2, 5040(%rbx)
.LB19172:
	movq -536(%rbp), %rax
	testb %al, %al
	jne .LB19186
.LB19188:
	leaq 5484(%rbx), %rcx
	movl 5560(%rbx), %edx
	movq %rcx, %rsi
	                movl %edx, %eax
	                xchgl %eax, (%rsi)
	xorl %esi, %esi
.LB20021:
	cmpl 5560(%rbx), %esi
	jge .LB20023
.LB20022:
	movslq %esi, %rax
	movl $2, %edx
	xorl %r8d, %r8d
	imulq $124, %rax, %rcx
	movq %rbx, 6336(%rbx,%rcx,1)
	movq -536(%rbp), %rdi
	movl $4, %ecx
	testb %dil, %dil
	cmovne %ecx, %edx
	imulq $124, %rax, %rcx
	imulq $124, %rax, %rax
	movl %edx, 6384(%rbx,%rcx,1)
	leaq 6392(%rbx,%rax,1), %rax
	movl $1, %edx
	movq (%rax), %rax
	movq %rax, %rcx
	callq ReleaseSemaphore
	incl %esi
	cmpl 5560(%rbx), %esi
	jl .LB20022
	jmp .LB20023
.LB19177:
	movl $1, 5040(%rbx)
	jmp .LB19172
.LB19170:
	movl $0, 5040(%rbx)
	jmp .LB19172
.LB19186:
	leaq .LZERO(%rip), %rsi
	leaq -312(%rbp), %rdi
	movl $256, %ecx
	rep movsb
	movq (%rbx), %rax
	movabsq $4602678819172646912, %r10
	movq %r10, %xmm1
	movl 16(%rax), %ecx
	movq %rcx, -616(%rbp)
	movslq %ecx, %rcx
	movl 20(%rax), %esi
	xorps %xmm0, %xmm0
	cvtsi2sdq %rcx, %xmm0
	movslq %esi, %rcx
	mulsd %xmm1, %xmm0
	movabsq $4602678819172646912, %r10
	movq %r10, %xmm1
	movsd %xmm0, -552(%rbp)
	xorps %xmm0, %xmm0
	cvtsi2sdq %rcx, %xmm0
	mulsd %xmm1, %xmm0
	movabsq $4602678819172646912, %r10
	movq %r10, %xmm1
	movsd %xmm0, -560(%rbp)
	movsd 512(%rax), %xmm0
	movsd %xmm0, -568(%rbp)
	movsd 520(%rax), %xmm0
	movsd %xmm0, -576(%rbp)
	movsd 528(%rax), %xmm0
	movsd %xmm0, -584(%rbp)
	movsd 8(%rax), %xmm0
	mulsd %xmm1, %xmm0
	callq standard__math__tan__1__doubleE1__ret_doubleE1
	movsd %xmm0, -592(%rbp)
	movq (%rbx), %rax
	movsd (%rax), %xmm0
	movabsq $4602678819172646912, %r10
	movq %r10, %xmm1
	mulsd %xmm1, %xmm0
	callq standard__math__tan__1__doubleE1__ret_doubleE1
	movsd %xmm0, -600(%rbp)
	movq -616(%rbp), %rax
	incl %eax
	movl %eax, %ecx
	sarl $31, %ecx
	movl %eax, %ecx
	shrl $31, %ecx
	addl %ecx, %eax
	sarl $1, %eax
	movl %eax, %edi
	leal 1(%rsi), %eax
	movl %eax, %ecx
	sarl $31, %ecx
	movl %eax, %ecx
	shrl $31, %ecx
	addl %ecx, %eax
	sarl $1, %eax
	movl %eax, %r14d
	movl 5168(%rbx), %eax
	cmpl %edi, %eax
	jne .LB19313
.LB19304:
	movl 5172(%rbx), %eax
	cmpl %r14d, %eax
	jne .LB19313
.LB19315:
	xorl %eax, %eax
	xorl %ecx, %ecx
.LB19395:
	cmpl 56(%rbx), %ecx
	jge .LB19397
.LB19404:
	cmpl $64, %eax
	jge .LB19397
.LB19396:
	movq 48(%rbx), %rdx
	movslq %ecx, %r8
	imulq $120, %r8, %r8
	leaq (%rdx,%r8,1), %rdx
	cmpl $1, (%rdx)
	je .LB19424
.LB19425:
.LB19426:
	incl %ecx
	cmpl 56(%rbx), %ecx
	jl .LB19404
	jmp .LB19397
.LB19313:
	movq 5136(%rbx), %rax
	testq %rax, %rax
	jne .LB19325
.LB19327:
	movl %edi, %eax
	imull %r14d, %eax
	movq %rax, %r15
	shlq $3, %r15
	movq %r15, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, 5136(%rbx)
	movq %r15, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, 5144(%rbx)
	movq %r15, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, 5152(%rbx)
	movq %r15, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, 5160(%rbx)
	movl %edi, 5168(%rbx)
	movl %r14d, 5172(%rbx)
	jmp .LB19315
.LB19325:
	movq %rax, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movq 5144(%rbx), %rax
	movq %rax, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movq 5152(%rbx), %rax
	movq %rax, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movq 5160(%rbx), %rax
	movq %rax, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	jmp .LB19327
.LB19397:
	movq (%rbx), %rcx
	movabsq $4611686018427387904, %r10
	movq %r10, %xmm4
	movsd 440(%rcx), %xmm0
	movsd -600(%rbp), %xmm1
	movsd -552(%rbp), %xmm3
	movaps %xmm0, %xmm2
	mulsd %xmm1, %xmm2
	divsd %xmm3, %xmm2
	mulsd %xmm4, %xmm2
	movsd 448(%rcx), %xmm4
	mulsd %xmm4, %xmm1
	divsd %xmm3, %xmm1
	movabsq $4611686018427387904, %r10
	movq %r10, %xmm3
	mulsd %xmm3, %xmm1
	movsd %xmm1, -1344(%rbp)
	movsd 456(%rcx), %xmm1
	movsd -600(%rbp), %xmm3
	mulsd %xmm3, %xmm1
	movsd -552(%rbp), %xmm3
	divsd %xmm3, %xmm1
	movabsq $4611686018427387904, %r10
	movq %r10, %xmm3
	mulsd %xmm3, %xmm1
	xorps %xmm3, %xmm3
	movsd %xmm1, -1336(%rbp)
	movsd 464(%rcx), %xmm1
	movsd %xmm3, -624(%rbp)
	subsd %xmm1, %xmm3
	movsd %xmm3, -632(%rbp)
	movsd -592(%rbp), %xmm5
	mulsd %xmm5, %xmm3
	movsd %xmm3, -640(%rbp)
	movsd -560(%rbp), %xmm5
	divsd %xmm5, %xmm3
	movabsq $4611686018427387904, %r10
	movq %r10, %xmm5
	movsd %xmm3, -648(%rbp)
	mulsd %xmm5, %xmm3
	movsd %xmm5, -656(%rbp)
	xorps %xmm5, %xmm5
	movsd %xmm3, -664(%rbp)
	movsd 472(%rcx), %xmm3
	movsd %xmm3, -672(%rbp)
	movaps %xmm3, %xmm15
	movaps %xmm5, %xmm3
	subsd %xmm15, %xmm3
	movsd %xmm5, -680(%rbp)
	movsd %xmm3, -688(%rbp)
	movsd -592(%rbp), %xmm5
	mulsd %xmm5, %xmm3
	movsd %xmm3, -696(%rbp)
	movsd -560(%rbp), %xmm5
	divsd %xmm5, %xmm3
	movabsq $4611686018427387904, %r10
	movq %r10, %xmm5
	movsd %xmm3, -704(%rbp)
	movsd %xmm5, -712(%rbp)
	mulsd %xmm5, %xmm3
	xorps %xmm5, %xmm5
	movsd %xmm3, -720(%rbp)
	movsd 480(%rcx), %xmm3
	movsd %xmm3, -728(%rbp)
	movaps %xmm3, %xmm15
	movaps %xmm5, %xmm3
	subsd %xmm15, %xmm3
	movsd %xmm5, -736(%rbp)
	movsd %xmm3, -744(%rbp)
	movsd -592(%rbp), %xmm5
	mulsd %xmm5, %xmm3
	movsd %xmm3, -752(%rbp)
	movsd -560(%rbp), %xmm5
	divsd %xmm5, %xmm3
	movabsq $4611686018427387904, %r10
	movq %r10, %xmm5
	movsd %xmm3, -760(%rbp)
	mulsd %xmm5, %xmm3
	movsd %xmm5, -768(%rbp)
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm5
	movsd %xmm3, -776(%rbp)
	movsd 488(%rcx), %xmm3
	movsd %xmm3, -784(%rbp)
	xorps %xmm3, %xmm3
	movsd %xmm3, -792(%rbp)
	subsd %xmm5, %xmm3
	movsd %xmm5, -800(%rbp)
	movsd %xmm3, -808(%rbp)
	mulsd %xmm3, %xmm0
	movsd -600(%rbp), %xmm3
	movsd -784(%rbp), %xmm5
	vfmadd132sd %xmm3, %xmm5, %xmm0
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm3
	movsd %xmm3, -816(%rbp)
	mulsd %xmm3, %xmm1
	movsd -592(%rbp), %xmm3
	vfmadd231sd %xmm1, %xmm3, %xmm0
	xorps %xmm1, %xmm1
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm3
	movsd %xmm0, -960(%rbp)
	movsd 496(%rcx), %xmm0
	movsd %xmm1, -824(%rbp)
	subsd %xmm3, %xmm1
	movsd %xmm3, -832(%rbp)
	movsd %xmm1, -840(%rbp)
	movsd -600(%rbp), %xmm3
	mulsd %xmm4, %xmm1
	movq (%rbx), %rcx
	vfmadd231sd %xmm1, %xmm3, %xmm0
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm3
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm4
	movsd 472(%rcx), %xmm1
	movsd %xmm3, -848(%rbp)
	mulsd %xmm3, %xmm1
	movsd -592(%rbp), %xmm3
	vfmadd231sd %xmm1, %xmm3, %xmm0
	xorps %xmm3, %xmm3
	movsd %xmm0, -968(%rbp)
	movsd 504(%rcx), %xmm0
	movsd 456(%rcx), %xmm1
	movsd %xmm1, -856(%rbp)
	movsd %xmm3, -864(%rbp)
	subsd %xmm4, %xmm3
	movsd %xmm4, -872(%rbp)
	movsd %xmm3, -880(%rbp)
	mulsd %xmm3, %xmm1
	movsd %xmm1, -888(%rbp)
	movsd -600(%rbp), %xmm3
	vfmadd231sd %xmm1, %xmm3, %xmm0
	movsd 480(%rcx), %xmm1
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm3
	movslq %eax, %rcx
	movsd %xmm1, -896(%rbp)
	mulsd %xmm3, %xmm1
	movsd %xmm3, -904(%rbp)
	movsd %xmm1, -912(%rbp)
	movsd -592(%rbp), %xmm3
	vfmadd231sd %xmm1, %xmm3, %xmm0
	movsd %xmm0, -976(%rbp)
	xorl %edx, %edx
.LB19715:
	cmpq %rcx, %rdx
	jge .LB19717
.LB19716:
	movl -312(%rbp,%rdx,4), %r8d
	movq 48(%rbx), %r9
	movslq %r8d, %r8
	imulq $120, %r8, %r15
	movsd 56(%r9,%r15,1), %xmm0
	movsd %xmm0, 1920(%rbx,%rdx,8)
	movq 48(%rbx), %r9
	imulq $120, %r8, %r15
	movsd 64(%r9,%r15,1), %xmm0
	movsd %xmm0, 2432(%rbx,%rdx,8)
	movq 48(%rbx), %r9
	imulq $120, %r8, %r15
	movsd 72(%r9,%r15,1), %xmm0
	movsd %xmm0, 2944(%rbx,%rdx,8)
	movq 48(%rbx), %r9
	imulq $120, %r8, %r8
	movsd 80(%r9,%r8,1), %xmm0
	movsd %xmm0, 3456(%rbx,%rdx,8)
	movsd 384(%rbx,%rdx,8), %xmm0
	movsd 896(%rbx,%rdx,8), %xmm1
	movsd 1408(%rbx,%rdx,8), %xmm3
	mulsd %xmm1, %xmm1
	vfmadd132sd %xmm0, %xmm1, %xmm0
	vfmadd231sd %xmm3, %xmm3, %xmm0
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm1
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm3
	vfmadd132sd %xmm0, %xmm3, %xmm1
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm3
	movaps %xmm1, %xmm15
	movaps %xmm3, %xmm1
	divsd %xmm15, %xmm1
	movsd %xmm1, 3968(%rbx,%rdx,8)
	movsd %xmm0, 4480(%rbx,%rdx,8)
	incq %rdx
	cmpq %rcx, %rdx
	jl .LB19716
.LB19717:
	movl %edi, 224(%rbx)
	movl %r14d, 228(%rbx)
	movq -616(%rbp), %rcx
	movl %ecx, 232(%rbx)
	movl %esi, 236(%rbx)
	movq (%rbx), %rcx
	movsd 488(%rcx), %xmm0
	movsd %xmm0, -920(%rbp)
	movsd %xmm0, 264(%rbx)
	movq (%rbx), %rcx
	movsd 496(%rcx), %xmm0
	movsd %xmm0, -928(%rbp)
	movsd %xmm0, 272(%rbx)
	movq (%rbx), %rcx
	movsd 504(%rcx), %xmm0
	movsd %xmm0, -936(%rbp)
	movsd %xmm0, 280(%rbx)
	movq (%rbx), %rcx
	movsd 32(%rcx), %xmm0
	movsd %xmm0, -944(%rbp)
	movsd %xmm0, 288(%rbx)
	movsd 152(%rbx), %xmm0
	movsd %xmm0, -952(%rbp)
	movsd %xmm0, 296(%rbx)
	movsd -960(%rbp), %xmm0
	movsd %xmm0, 304(%rbx)
	movsd -968(%rbp), %xmm0
	movsd %xmm0, 312(%rbx)
	movsd -976(%rbp), %xmm0
	movsd %xmm0, 320(%rbx)
	movsd %xmm2, 328(%rbx)
	movsd -1344(%rbp), %xmm0
	movsd %xmm0, 336(%rbx)
	movsd -1336(%rbp), %xmm0
	movsd %xmm0, 344(%rbx)
	movsd -664(%rbp), %xmm0
	movsd %xmm0, 352(%rbx)
	movsd -720(%rbp), %xmm0
	movsd %xmm0, 360(%rbx)
	movsd -776(%rbp), %xmm0
	movsd %xmm0, 368(%rbx)
	movl %eax, 376(%rbx)
	movq %r13, 4992(%rbx)
	movq %r12, 5000(%rbx)
	movq 5136(%rbx), %rax
	movq %rax, 5008(%rbx)
	movq 5144(%rbx), %rax
	movq %rax, 5016(%rbx)
	movq 5152(%rbx), %rax
	movq %rax, 5024(%rbx)
	movq 5160(%rbx), %rax
	movq %rax, 5032(%rbx)
	jmp .LB19188
.LB20023:
	leaq 5452(%rbx), %rax
	movq (%rax), %rax
	movl WIN32_INFINITE(%rip), %edx
	movq %rax, %rcx
	callq WaitForSingleObject
	jmp .LB19023
.LB20060:
	leaq 5484(%rbx), %rcx
	movl 5560(%rbx), %edx
	movq %rcx, %rsi
	                movl %edx, %eax
	                xchgl %eax, (%rsi)
	xorl %esi, %esi
.LB20069:
	cmpl 5560(%rbx), %esi
	jge .LB20071
.LB20070:
	movslq %esi, %rax
	movl $1, %edx
	xorl %r8d, %r8d
	imulq $124, %rax, %rcx
	movq %rbx, 6336(%rbx,%rcx,1)
	imulq $124, %rax, %rcx
	imulq $124, %rax, %rax
	movl $3, 6384(%rbx,%rcx,1)
	leaq 6392(%rbx,%rax,1), %rax
	movq (%rax), %rax
	movq %rax, %rcx
	callq ReleaseSemaphore
	incl %esi
	cmpl 5560(%rbx), %esi
	jl .LB20070
.LB20071:
	leaq 5452(%rbx), %rax
	movq (%rax), %rax
	movl WIN32_INFINITE(%rip), %edx
	movq %rax, %rcx
	callq WaitForSingleObject
	jmp .LB20062
.LB20108:
	movq (%rbx), %rax
	movl 16(%rax), %edx
	movl 20(%rax), %r8d
	movq %r12, %rcx
	callq raycaster__r3d_fxaa__3__dataE1_ptr1_ubits64__dataE1_sbits32__dataE1_sbits32__ret_voidE1
	jmp .LB20110
.LB19424:
	movsd 32(%rdx), %xmm0
	movsd -568(%rbp), %xmm1
	subsd %xmm1, %xmm0
	movslq %eax, %rdx
	movsd %xmm0, 384(%rbx,%rdx,8)
	movq 48(%rbx), %rdx
	movslq %ecx, %r8
	imulq $120, %r8, %r8
	movsd 40(%rdx,%r8,1), %xmm0
	movsd -576(%rbp), %xmm1
	subsd %xmm1, %xmm0
	movslq %eax, %rdx
	movsd %xmm0, 896(%rbx,%rdx,8)
	movq 48(%rbx), %rdx
	movslq %ecx, %r8
	imulq $120, %r8, %r8
	movsd 48(%rdx,%r8,1), %xmm0
	movsd -584(%rbp), %xmm1
	subsd %xmm1, %xmm0
	movslq %eax, %rdx
	movsd %xmm0, 1408(%rbx,%rdx,8)
	movl %ecx, -312(%rbp,%rdx,4)
	incl %eax
	jmp .LB19426
.LB18769:
	movsd 32(%rcx), %xmm2
	movsd %xmm2, -1048(%rbp)
	movsd 40(%rcx), %xmm2
	movsd %xmm2, -1056(%rbp)
	movsd 48(%rcx), %xmm2
	movsd %xmm2, -1064(%rbp)
	movsd 112(%rcx), %xmm2
	movsd %xmm2, -1072(%rbp)
	movsd -1224(%rbp), %xmm2
	movsd -1048(%rbp), %xmm3
	ucomisd %xmm3, %xmm2
	ja .LB18830
.LB18831:
	movsd -1048(%rbp), %xmm2
	movsd -1232(%rbp), %xmm3
	ucomisd %xmm3, %xmm2
	ja .LB18837
.LB18838:
	movq -1048(%rbp), %r10
	movq %r10, -1080(%rbp)
.LB18839:
	movq -1080(%rbp), %r10
	movq %r10, -1088(%rbp)
.LB18832:
	movsd -1240(%rbp), %xmm2
	movsd -1056(%rbp), %xmm3
	ucomisd %xmm3, %xmm2
	ja .LB18847
.LB18848:
	movsd -1056(%rbp), %xmm2
	movsd -1352(%rbp), %xmm3
	ucomisd %xmm3, %xmm2
	ja .LB18854
.LB18855:
	movq -1056(%rbp), %r10
	movq %r10, -1096(%rbp)
.LB18856:
	movq -1096(%rbp), %r10
	movq %r10, -1104(%rbp)
.LB18849:
	movsd -1064(%rbp), %xmm2
	ucomisd %xmm2, %xmm0
	ja .LB18864
.LB18865:
	movsd -1064(%rbp), %xmm2
	ucomisd %xmm1, %xmm2
	ja .LB18871
.LB18872:
	movq -1064(%rbp), %r10
	movq %r10, -1112(%rbp)
.LB18873:
	movq -1112(%rbp), %r10
	movq %r10, -1120(%rbp)
.LB18866:
	movsd -1048(%rbp), %xmm2
	movsd -1088(%rbp), %xmm3
	subsd %xmm3, %xmm2
	movsd %xmm2, -1128(%rbp)
	movsd -1056(%rbp), %xmm3
	movsd -1104(%rbp), %xmm4
	subsd %xmm4, %xmm3
	movsd %xmm3, -1136(%rbp)
	mulsd %xmm3, %xmm3
	movsd %xmm3, -1144(%rbp)
	vfmadd132sd %xmm2, %xmm3, %xmm2
	movsd %xmm2, -1152(%rbp)
	movsd -1064(%rbp), %xmm3
	movsd -1120(%rbp), %xmm4
	subsd %xmm4, %xmm3
	movsd %xmm3, -1160(%rbp)
	vfmadd231sd %xmm3, %xmm3, %xmm2
	movsd %xmm2, -1168(%rbp)
	movabsq $4517329193108106637, %r10
	movq %r10, %xmm2
	movsd %xmm2, -1176(%rbp)
	movsd -1072(%rbp), %xmm3
	ucomisd %xmm3, %xmm2
	ja .LB18909
.LB18903:
	movsd -1072(%rbp), %xmm2
	movsd -1168(%rbp), %xmm3
	ucomisd %xmm3, %xmm2
	jae .LB18909
.LB18911:
	movq -1048(%rbp), %r10
	movq %r10, -984(%rbp)
	movq -1056(%rbp), %r10
	movq %r10, -992(%rbp)
	movq -1064(%rbp), %r10
	movq %r10, -1000(%rbp)
	movq -1072(%rbp), %r10
	movq %r10, -1008(%rbp)
	movq -1088(%rbp), %r10
	movq %r10, -1016(%rbp)
	movq -1104(%rbp), %r10
	movq %r10, -1024(%rbp)
	movq -1120(%rbp), %r10
	movq %r10, -1032(%rbp)
	movq -1168(%rbp), %r10
	movq %r10, -1040(%rbp)
	jmp .LB18733
.LB18837:
	movq -1232(%rbp), %r10
	movq %r10, -1080(%rbp)
	jmp .LB18839
.LB18830:
	movq -1224(%rbp), %r10
	movq %r10, -1088(%rbp)
	jmp .LB18832
.LB18854:
	movq -1352(%rbp), %r10
	movq %r10, -1096(%rbp)
	jmp .LB18856
.LB18847:
	movq -1240(%rbp), %r10
	movq %r10, -1104(%rbp)
	jmp .LB18849
.LB18871:
	movsd %xmm1, -1112(%rbp)
	jmp .LB18873
.LB18864:
	movsd %xmm0, -1120(%rbp)
	jmp .LB18866
.LB18909:
	movslq 5448(%rbx), %rcx
	movl %eax, 5192(%rbx,%rcx,4)
	movl 5448(%rbx), %ecx
	incl %ecx
	movl %ecx, 5448(%rbx)
	jmp .LB18911
.LB18731:
	movslq 5448(%rbx), %rcx
	movl %eax, 5192(%rbx,%rcx,4)
	movl 5448(%rbx), %ecx
	incl %ecx
	movl %ecx, 5448(%rbx)
	movq -472(%rbp), %r10
	movq %r10, -984(%rbp)
	movq -480(%rbp), %r10
	movq %r10, -992(%rbp)
	movq -488(%rbp), %r10
	movq %r10, -1000(%rbp)
	movq -496(%rbp), %r10
	movq %r10, -1008(%rbp)
	movq -504(%rbp), %r10
	movq %r10, -1016(%rbp)
	movq -512(%rbp), %r10
	movq %r10, -1024(%rbp)
	movq -520(%rbp), %r10
	movq %r10, -1032(%rbp)
	movq -528(%rbp), %r10
	movq %r10, -1040(%rbp)
	jmp .LB18733
.LB18608:
	movslq %edx, %rdi
	imulq $56, %rdi, %rdi
	leaq (%rax,%rdi,1), %rdi
	movsd 32(%rdi), %xmm2
	movsd 40(%rdi), %xmm3
	movsd 48(%rdi), %xmm4
	testb %sil, %sil
	jne .LB18654
.LB18655:
	movsd -1224(%rbp), %xmm5
	ucomisd %xmm2, %xmm5
	ja .LB18666
.LB18667:
	movsd -1232(%rbp), %xmm5
	ucomisd %xmm5, %xmm2
	ja .LB18673
.LB18674:
	movq -1224(%rbp), %r10
	movq %r10, -1248(%rbp)
	movq -1232(%rbp), %r10
	movq %r10, -1256(%rbp)
.LB18668:
	movsd -1240(%rbp), %xmm5
	ucomisd %xmm3, %xmm5
	ja .LB18679
.LB18680:
	movsd -1352(%rbp), %xmm5
	ucomisd %xmm5, %xmm3
	ja .LB18686
.LB18687:
	movsd -1240(%rbp), %xmm5
	movq -1352(%rbp), %r10
	movq %r10, -1264(%rbp)
.LB18681:
	ucomisd %xmm4, %xmm0
	ja .LB18692
.LB18693:
	ucomisd %xmm1, %xmm4
	ja .LB18699
.LB18700:
.LB18694:
	movq -1264(%rbp), %r10
	movq %r10, -1272(%rbp)
	movsd %xmm0, -1280(%rbp)
	movsd %xmm1, -1288(%rbp)
	movsd -1248(%rbp), %xmm0
	movsd -1256(%rbp), %xmm1
.LB18656:
	movsd %xmm2, -1200(%rbp)
	movsd %xmm3, -1208(%rbp)
	movsd %xmm4, -1216(%rbp)
	movaps %xmm5, %xmm2
	movsd -1272(%rbp), %xmm3
	movsd -1280(%rbp), %xmm4
	movsd -1288(%rbp), %xmm5
	jmp .LB18610
.LB18673:
	movq -1224(%rbp), %r10
	movq %r10, -1248(%rbp)
	movsd %xmm2, -1256(%rbp)
	jmp .LB18668
.LB18666:
	movsd %xmm2, -1248(%rbp)
	movq -1232(%rbp), %r10
	movq %r10, -1256(%rbp)
	jmp .LB18668
.LB18686:
	movsd -1240(%rbp), %xmm5
	movsd %xmm3, -1264(%rbp)
	jmp .LB18681
.LB18679:
	movaps %xmm3, %xmm5
	movq -1352(%rbp), %r10
	movq %r10, -1264(%rbp)
	jmp .LB18681
.LB18699:
	movaps %xmm4, %xmm1
	jmp .LB18694
.LB18692:
	movaps %xmm4, %xmm0
	jmp .LB18694
.LB18654:
	movaps %xmm2, %xmm0
	movaps %xmm2, %xmm1
	movaps %xmm3, %xmm5
	movsd %xmm3, -1272(%rbp)
	movsd %xmm4, -1280(%rbp)
	movsd %xmm4, -1288(%rbp)
	xorl %esi, %esi
	jmp .LB18656
.LB18341:
	movl 24(%rbx), %esi
	jmp .LB18229
	.text
	.globl raycaster__r3d_scene_init__5__R3DSceneE1_ptr1__R3DCameraE1_ptr1__R3DPlayerE1_ptr1__RCTexturePaletteE1_ptr1__RCSkyE1_ptr1__ret_voidE1
	.def raycaster__r3d_scene_init__5__R3DSceneE1_ptr1__R3DCameraE1_ptr1__R3DPlayerE1_ptr1__RCTexturePaletteE1_ptr1__RCSkyE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
raycaster__r3d_scene_init__5__R3DSceneE1_ptr1__R3DCameraE1_ptr1__R3DPlayerE1_ptr1__RCTexturePaletteE1_ptr1__RCSkyE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $112, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
.LB21942:
	movabsq $1008981770, %r10
	movq %r10, %xmm0
	movq %rcx, %rsi
	movq 48(%rbp), %rax
	movq %rdx, (%rsi)
	movq %r8, 8(%rsi)
	movq $0, 16(%rsi)
	movl $0, 24(%rsi)
	movq $0, 32(%rsi)
	movl $0, 40(%rsi)
	movq $0, 48(%rsi)
	cvtss2sd %xmm0, %xmm0
	movl $0, 56(%rsi)
	movsd %xmm0, 64(%rsi)
	movabsq $1008981770, %r10
	movq %r10, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 72(%rsi)
	movabsq $1017370378, %r10
	movq %r10, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 80(%rsi)
	xorps %xmm0, %xmm0
	movq %r9, 88(%rsi)
	movq %rax, 96(%rsi)
	movl $112, 104(%rsi)
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 112(%rsi)
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 120(%rsi)
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 128(%rsi)
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 136(%rsi)
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 144(%rsi)
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 152(%rsi)
	movabsq $1065353216, %r10
	movq %r10, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 160(%rsi)
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 168(%rsi)
	movabsq $1041865114, %r10
	movq %r10, %xmm0
	leaq 200(%rsi), %rcx
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 176(%rsi)
	movabsq $1041865114, %r10
	movq %r10, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 184(%rsi)
	movabsq $1041865114, %r10
	movq %r10, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 192(%rsi)
	callq standard__memory__allocators__stdarena__arena_init__1__ArenaE1_ptr1__ret_voidE1
	vpxor %xmm15, %xmm15, %xmm15
	vmovdqu %ymm15, 5136(%rsi)
	vmovdqu %ymm15, 5144(%rsi)
	vzeroupper
	movl $0, 5484(%rsi)
	leaq 5452(%rsi), %rcx
	xorl %edx, %edx
	callq standard__threading__semaphore_init__2__SemaphoreE1_ptr1__dataE1_sbits32__ret_intE1
	xorps %xmm0, %xmm0
	movsd %xmm0, 5488(%rsi)
	xorps %xmm0, %xmm0
	movsd %xmm0, 5496(%rsi)
	xorps %xmm0, %xmm0
	movsd %xmm0, 5504(%rsi)
	xorps %xmm0, %xmm0
	movsd %xmm0, 5512(%rsi)
	xorps %xmm0, %xmm0
	movsd %xmm0, 5520(%rsi)
	xorps %xmm0, %xmm0
	movsd %xmm0, 5528(%rsi)
	xorps %xmm0, %xmm0
	movsd %xmm0, 5536(%rsi)
	vpxor %xmm15, %xmm15, %xmm15
	vmovdqu %xmm15, 5176(%rsi)
	movl $557056, %ecx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, 5544(%rsi)
	movl $0, 5552(%rsi)
	movl $4096, 5556(%rsi)
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -80(%rbp)
	movups .LZERO+32(%rip), %xmm15
	movups %xmm15, -48(%rbp)
	vzeroupper
	leaq -80(%rbp), %rax
	movq %rax, %rcx
	callq GetSystemInfo
	movl -48(%rbp), %eax
	movl %eax, 5560(%rsi)
	cmpl $1, %eax
	jl .LB22100
.LB22102:
	cmpl $64, 5560(%rsi)
	jg .LB22110
.LB22112:
	leaq raycaster__r3d_mesh_worker__1__voidE1_ptr1__ret_voidE1_ptr1(%rip), %rax
	movq %rax, %rdi
	xorl %ebx, %ebx
.LB22116:
	cmpl 5560(%rsi), %ebx
	jge .LB22118
.LB22117:
	movslq %ebx, %r12
	leaq (%r12,%r12,2), %rax
	leaq 14272(%rsi,%rax,8), %rcx
	callq standard__memory__allocators__stdarena__arena_init__1__ArenaE1_ptr1__ret_voidE1
	imulq $124, %r12, %rax
	movl %ebx, 6376(%rsi,%rax,1)
	movl 5560(%rsi), %eax
	imulq $124, %r12, %rcx
	movl %eax, 6380(%rsi,%rcx,1)
	leaq (%r12,%r12,2), %rax
	leaq 14272(%rsi,%rax,8), %rax
	imulq $124, %r12, %rcx
	movq %rax, 6368(%rsi,%rcx,1)
	imulq $124, %r12, %rax
	movl $1, 6456(%rsi,%rax,1)
	imulq $124, %r12, %rax
	movl $0, 6388(%rsi,%rax,1)
	imulq $124, %r12, %rax
	leaq 6392(%rsi,%rax,1), %rcx
	xorl %edx, %edx
	callq standard__threading__semaphore_init__2__SemaphoreE1_ptr1__dataE1_sbits32__ret_intE1
	imulq $124, %r12, %rax
	leaq 6424(%rsi,%rax,1), %rcx
	xorl %edx, %edx
	callq standard__threading__semaphore_init__2__SemaphoreE1_ptr1__dataE1_sbits32__ret_intE1
	imulq $124, %r12, %rax
	leaq 6336(%rsi,%rax,1), %rax
	movq %rax, %rdx
	leaq (%r12,%r12,2), %rax
	leaq 5564(%rsi,%rax,4), %r8
	movq %rdi, %rcx
	callq standard__threading__thread_create__3__voidE1_ptr1__voidE1_ptr1__ThreadE1_ptr1__ret_intE1
	incl %ebx
	cmpl 5560(%rsi), %ebx
	jl .LB22117
	jmp .LB22118
.LB22100:
	movl $1, 5560(%rsi)
	cmpl $64, 5560(%rsi)
	jle .LB22112
.LB22110:
	movl $64, 5560(%rsi)
	jmp .LB22112
.LB22118:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
	.text
	.globl raycaster__r3d_scene_set_insts__3__R3DSceneE1_ptr1__R3DMeshInstE1_ptr2__dataE1_sbits32__ret_voidE1
	.def raycaster__r3d_scene_set_insts__3__R3DSceneE1_ptr1__R3DMeshInstE1_ptr2__dataE1_sbits32__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
raycaster__r3d_scene_set_insts__3__R3DSceneE1_ptr1__R3DMeshInstE1_ptr2__dataE1_sbits32__ret_voidE1:
.LB22195:
	movq %rdx, 16(%rcx)
	movl %r8d, 24(%rcx)
	ret
	.text
	.globl raycaster__r3d_scene_set_lights__3__R3DSceneE1_ptr1__R3DLightE1_ptr1__dataE1_sbits32__ret_voidE1
	.def raycaster__r3d_scene_set_lights__3__R3DSceneE1_ptr1__R3DLightE1_ptr1__dataE1_sbits32__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
raycaster__r3d_scene_set_lights__3__R3DSceneE1_ptr1__R3DLightE1_ptr1__dataE1_sbits32__ret_voidE1:
.LB22205:
	movq %rdx, 48(%rcx)
	movl %r8d, 56(%rcx)
	ret
	.text
	.globl raycaster__r3d_scene_set_ambient__4__R3DSceneE1_ptr1__doubleE1__doubleE1__doubleE1__ret_voidE1
	.def raycaster__r3d_scene_set_ambient__4__R3DSceneE1_ptr1__doubleE1__doubleE1__doubleE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
raycaster__r3d_scene_set_ambient__4__R3DSceneE1_ptr1__doubleE1__doubleE1__doubleE1__ret_voidE1:
.LB22216:
	movaps %xmm1, %xmm0
	movaps %xmm2, %xmm1
	movaps %xmm3, %xmm2
	movsd %xmm0, 64(%rcx)
	movsd %xmm1, 72(%rcx)
	movsd %xmm2, 80(%rcx)
	ret
	.text
	.globl raycaster__r3d_scene_set_fog__6__R3DSceneE1_ptr1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__ret_voidE1
	.def raycaster__r3d_scene_set_fog__6__R3DSceneE1_ptr1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
raycaster__r3d_scene_set_fog__6__R3DSceneE1_ptr1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__ret_voidE1:
.LB22230:
	movaps %xmm1, %xmm0
	movaps %xmm2, %xmm1
	movaps %xmm3, %xmm2
	movsd 40(%rsp), %xmm3
	movsd 48(%rsp), %xmm4
	movsd %xmm0, 112(%rcx)
	movsd %xmm1, 120(%rcx)
	movsd %xmm2, 128(%rcx)
	movsd %xmm3, 136(%rcx)
	movsd %xmm4, 144(%rcx)
	ret
	.text
	.globl raycaster__r3d_scene_set_vol_fog__7__R3DSceneE1_ptr1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__ret_voidE1
	.def raycaster__r3d_scene_set_vol_fog__7__R3DSceneE1_ptr1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
raycaster__r3d_scene_set_vol_fog__7__R3DSceneE1_ptr1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__doubleE1__ret_voidE1:
.LB22252:
	movaps %xmm1, %xmm0
	movaps %xmm2, %xmm1
	movaps %xmm3, %xmm2
	movsd 40(%rsp), %xmm3
	movsd 48(%rsp), %xmm4
	movsd 56(%rsp), %xmm5
	movsd %xmm0, 152(%rcx)
	movsd %xmm1, 160(%rcx)
	movsd %xmm2, 168(%rcx)
	movsd %xmm3, 176(%rcx)
	movsd %xmm4, 184(%rcx)
	movsd %xmm5, 192(%rcx)
	ret
	.text
	.globl build_cube_mesh__1__R3DMeshE1_ptr1__ret_voidE1
	.def build_cube_mesh__1__R3DMeshE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
build_cube_mesh__1__R3DMeshE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
.LB22278:
	movq %rcx, %rsi
	movq %rsi, %rcx
	movl $24, %edx
	movl $12, %r8d
	movl $1, %r9d
	callq raycaster__r3d_mesh_init__4__R3DMeshE1_ptr1__dataE1_sbits32__dataE1_sbits32__dataE1_sbits32__ret_voidE1
	xorps %xmm0, %xmm0
	movabsq $1056964608, %r10
	movq %r10, %xmm1
	subss %xmm1, %xmm0
	movq (%rsi), %rax
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, (%rax)
	xorps %xmm0, %xmm0
	movabsq $1056964608, %r10
	movq %r10, %xmm1
	subss %xmm1, %xmm0
	movq (%rsi), %rax
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 8(%rax)
	movq (%rsi), %rax
	movabsq $1056964608, %r10
	movq %r10, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 16(%rax)
	movq (%rsi), %rax
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 48(%rax)
	movq (%rsi), %rax
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 56(%rax)
	movq (%rsi), %rax
	movabsq $1056964608, %r10
	movq %r10, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 64(%rax)
	xorps %xmm0, %xmm0
	movabsq $1056964608, %r10
	movq %r10, %xmm1
	subss %xmm1, %xmm0
	movq (%rsi), %rax
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 72(%rax)
	movq (%rsi), %rax
	movabsq $1056964608, %r10
	movq %r10, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 80(%rax)
	movq (%rsi), %rax
	movabsq $1090519040, %r10
	movq %r10, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 112(%rax)
	movq (%rsi), %rax
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 120(%rax)
	movq (%rsi), %rax
	movabsq $1056964608, %r10
	movq %r10, %xmm0
	cvtss2sd %xmm0, %xmm0
	movabsq $1056964608, %r10
	movq %r10, %xmm1
	movsd %xmm0, 128(%rax)
	movabsq $1056964608, %r10
	movq %r10, %xmm0
	movq (%rsi), %rax
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 136(%rax)
	movabsq $1056964608, %r10
	movq %r10, %xmm0
	movq (%rsi), %rax
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 144(%rax)
	movabsq $1090519040, %r10
	movq %r10, %xmm0
	movq (%rsi), %rax
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 176(%rax)
	movabsq $1090519040, %r10
	movq %r10, %xmm0
	movq (%rsi), %rax
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 184(%rax)
	xorps %xmm0, %xmm0
	movq (%rsi), %rax
	subss %xmm1, %xmm0
	movabsq $1056964608, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 192(%rax)
	movabsq $1056964608, %r10
	movq %r10, %xmm0
	movq (%rsi), %rax
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 200(%rax)
	movabsq $1056964608, %r10
	movq %r10, %xmm0
	movq (%rsi), %rax
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 208(%rax)
	xorps %xmm0, %xmm0
	movq (%rsi), %rax
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 240(%rax)
	movabsq $1090519040, %r10
	movq %r10, %xmm0
	movq (%rsi), %rax
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 248(%rax)
	movabsq $1056964608, %r10
	movq %r10, %xmm0
	movq (%rsi), %rax
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 256(%rax)
	xorps %xmm0, %xmm0
	movq (%rsi), %rax
	subss %xmm1, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 264(%rax)
	xorps %xmm0, %xmm0
	movabsq $1056964608, %r10
	movq %r10, %xmm1
	subss %xmm1, %xmm0
	movq (%rsi), %rax
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 272(%rax)
	movq (%rsi), %rax
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 304(%rax)
	movq (%rsi), %rax
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 312(%rax)
	xorps %xmm0, %xmm0
	movabsq $1056964608, %r10
	movq %r10, %xmm1
	subss %xmm1, %xmm0
	movq (%rsi), %rax
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 320(%rax)
	xorps %xmm0, %xmm0
	movabsq $1056964608, %r10
	movq %r10, %xmm1
	subss %xmm1, %xmm0
	movq (%rsi), %rax
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 328(%rax)
	xorps %xmm0, %xmm0
	movabsq $1056964608, %r10
	movq %r10, %xmm1
	subss %xmm1, %xmm0
	movq (%rsi), %rax
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 336(%rax)
	movq (%rsi), %rax
	movabsq $1090519040, %r10
	movq %r10, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 368(%rax)
	movq (%rsi), %rax
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 376(%rax)
	xorps %xmm0, %xmm0
	movabsq $1056964608, %r10
	movq %r10, %xmm1
	subss %xmm1, %xmm0
	movq (%rsi), %rax
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 384(%rax)
	movabsq $1056964608, %r10
	movq %r10, %xmm0
	movq (%rsi), %rax
	movabsq $1056964608, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 392(%rax)
	xorps %xmm0, %xmm0
	movq (%rsi), %rax
	subss %xmm1, %xmm0
	movabsq $1056964608, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 400(%rax)
	movabsq $1090519040, %r10
	movq %r10, %xmm0
	movq (%rsi), %rax
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 432(%rax)
	movabsq $1090519040, %r10
	movq %r10, %xmm0
	movq (%rsi), %rax
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 440(%rax)
	movabsq $1056964608, %r10
	movq %r10, %xmm0
	movq (%rsi), %rax
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 448(%rax)
	movabsq $1056964608, %r10
	movq %r10, %xmm0
	movq (%rsi), %rax
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 456(%rax)
	xorps %xmm0, %xmm0
	movq (%rsi), %rax
	subss %xmm1, %xmm0
	movabsq $1056964608, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 464(%rax)
	xorps %xmm0, %xmm0
	movq (%rsi), %rax
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 496(%rax)
	movabsq $1090519040, %r10
	movq %r10, %xmm0
	movq (%rsi), %rax
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 504(%rax)
	movabsq $1056964608, %r10
	movq %r10, %xmm0
	movq (%rsi), %rax
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 512(%rax)
	xorps %xmm0, %xmm0
	movq (%rsi), %rax
	subss %xmm1, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 520(%rax)
	movq (%rsi), %rax
	movabsq $1056964608, %r10
	movq %r10, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 528(%rax)
	movq (%rsi), %rax
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 560(%rax)
	movq (%rsi), %rax
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 568(%rax)
	movq (%rsi), %rax
	movabsq $1056964608, %r10
	movq %r10, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 576(%rax)
	xorps %xmm0, %xmm0
	movabsq $1056964608, %r10
	movq %r10, %xmm1
	subss %xmm1, %xmm0
	movq (%rsi), %rax
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 584(%rax)
	xorps %xmm0, %xmm0
	movabsq $1056964608, %r10
	movq %r10, %xmm1
	subss %xmm1, %xmm0
	movq (%rsi), %rax
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 592(%rax)
	movq (%rsi), %rax
	movabsq $1090519040, %r10
	movq %r10, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 624(%rax)
	movq (%rsi), %rax
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 632(%rax)
	movq (%rsi), %rax
	movabsq $1056964608, %r10
	movq %r10, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 640(%rax)
	movq (%rsi), %rax
	movabsq $1056964608, %r10
	movq %r10, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 648(%rax)
	xorps %xmm0, %xmm0
	movabsq $1056964608, %r10
	movq %r10, %xmm1
	subss %xmm1, %xmm0
	movq (%rsi), %rax
	movabsq $1056964608, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 656(%rax)
	movabsq $1090519040, %r10
	movq %r10, %xmm0
	movq (%rsi), %rax
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 688(%rax)
	movabsq $1090519040, %r10
	movq %r10, %xmm0
	movq (%rsi), %rax
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 696(%rax)
	movabsq $1056964608, %r10
	movq %r10, %xmm0
	movq (%rsi), %rax
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 704(%rax)
	movabsq $1056964608, %r10
	movq %r10, %xmm0
	movq (%rsi), %rax
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 712(%rax)
	movabsq $1056964608, %r10
	movq %r10, %xmm0
	movq (%rsi), %rax
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 720(%rax)
	xorps %xmm0, %xmm0
	movq (%rsi), %rax
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 752(%rax)
	movabsq $1090519040, %r10
	movq %r10, %xmm0
	movq (%rsi), %rax
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 760(%rax)
	xorps %xmm0, %xmm0
	movq (%rsi), %rax
	subss %xmm1, %xmm0
	movabsq $1056964608, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 768(%rax)
	xorps %xmm0, %xmm0
	movq (%rsi), %rax
	subss %xmm1, %xmm0
	movabsq $1056964608, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 776(%rax)
	xorps %xmm0, %xmm0
	movq (%rsi), %rax
	subss %xmm1, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 784(%rax)
	movq (%rsi), %rax
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 816(%rax)
	movq (%rsi), %rax
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 824(%rax)
	xorps %xmm0, %xmm0
	movabsq $1056964608, %r10
	movq %r10, %xmm1
	subss %xmm1, %xmm0
	movq (%rsi), %rax
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 832(%rax)
	xorps %xmm0, %xmm0
	movabsq $1056964608, %r10
	movq %r10, %xmm1
	subss %xmm1, %xmm0
	movq (%rsi), %rax
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 840(%rax)
	movq (%rsi), %rax
	movabsq $1056964608, %r10
	movq %r10, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 848(%rax)
	movq (%rsi), %rax
	movabsq $1090519040, %r10
	movq %r10, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 880(%rax)
	movq (%rsi), %rax
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 888(%rax)
	xorps %xmm0, %xmm0
	movabsq $1056964608, %r10
	movq %r10, %xmm1
	subss %xmm1, %xmm0
	movq (%rsi), %rax
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 896(%rax)
	movq (%rsi), %rax
	movabsq $1056964608, %r10
	movq %r10, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 904(%rax)
	movq (%rsi), %rax
	movabsq $1056964608, %r10
	movq %r10, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 912(%rax)
	movq (%rsi), %rax
	movabsq $1090519040, %r10
	movq %r10, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 944(%rax)
	movq (%rsi), %rax
	movabsq $1090519040, %r10
	movq %r10, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 952(%rax)
	xorps %xmm0, %xmm0
	movabsq $1056964608, %r10
	movq %r10, %xmm1
	subss %xmm1, %xmm0
	movq (%rsi), %rax
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 960(%rax)
	movq (%rsi), %rax
	movabsq $1056964608, %r10
	movq %r10, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 968(%rax)
	xorps %xmm0, %xmm0
	movabsq $1056964608, %r10
	movq %r10, %xmm1
	subss %xmm1, %xmm0
	movq (%rsi), %rax
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 976(%rax)
	movq (%rsi), %rax
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 1008(%rax)
	movq (%rsi), %rax
	movabsq $1090519040, %r10
	movq %r10, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 1016(%rax)
	xorps %xmm0, %xmm0
	movabsq $1056964608, %r10
	movq %r10, %xmm1
	subss %xmm1, %xmm0
	movq (%rsi), %rax
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 1024(%rax)
	movq (%rsi), %rax
	movabsq $1056964608, %r10
	movq %r10, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 1032(%rax)
	movq (%rsi), %rax
	movabsq $1056964608, %r10
	movq %r10, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 1040(%rax)
	movq (%rsi), %rax
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 1072(%rax)
	movq (%rsi), %rax
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 1080(%rax)
	movq (%rsi), %rax
	movabsq $1056964608, %r10
	movq %r10, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 1088(%rax)
	movq (%rsi), %rax
	movabsq $1056964608, %r10
	movq %r10, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 1096(%rax)
	movq (%rsi), %rax
	movabsq $1056964608, %r10
	movq %r10, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 1104(%rax)
	movq (%rsi), %rax
	movabsq $1090519040, %r10
	movq %r10, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 1136(%rax)
	movq (%rsi), %rax
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 1144(%rax)
	movq (%rsi), %rax
	movabsq $1056964608, %r10
	movq %r10, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 1152(%rax)
	movq (%rsi), %rax
	movabsq $1056964608, %r10
	movq %r10, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 1160(%rax)
	xorps %xmm0, %xmm0
	movabsq $1056964608, %r10
	movq %r10, %xmm1
	subss %xmm1, %xmm0
	movq (%rsi), %rax
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 1168(%rax)
	movq (%rsi), %rax
	movabsq $1090519040, %r10
	movq %r10, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 1200(%rax)
	movq (%rsi), %rax
	movabsq $1090519040, %r10
	movq %r10, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 1208(%rax)
	xorps %xmm0, %xmm0
	movabsq $1056964608, %r10
	movq %r10, %xmm1
	subss %xmm1, %xmm0
	movq (%rsi), %rax
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 1216(%rax)
	movq (%rsi), %rax
	movabsq $1056964608, %r10
	movq %r10, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 1224(%rax)
	xorps %xmm0, %xmm0
	movabsq $1056964608, %r10
	movq %r10, %xmm1
	subss %xmm1, %xmm0
	movq (%rsi), %rax
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 1232(%rax)
	movq (%rsi), %rax
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 1264(%rax)
	movq (%rsi), %rax
	movabsq $1090519040, %r10
	movq %r10, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 1272(%rax)
	xorps %xmm0, %xmm0
	movabsq $1056964608, %r10
	movq %r10, %xmm1
	subss %xmm1, %xmm0
	movq (%rsi), %rax
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 1280(%rax)
	xorps %xmm0, %xmm0
	movabsq $1056964608, %r10
	movq %r10, %xmm1
	subss %xmm1, %xmm0
	movq (%rsi), %rax
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 1288(%rax)
	xorps %xmm0, %xmm0
	movabsq $1056964608, %r10
	movq %r10, %xmm1
	subss %xmm1, %xmm0
	movq (%rsi), %rax
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 1296(%rax)
	movq (%rsi), %rax
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 1328(%rax)
	movq (%rsi), %rax
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 1336(%rax)
	movq (%rsi), %rax
	movabsq $1056964608, %r10
	movq %r10, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 1344(%rax)
	xorps %xmm0, %xmm0
	movabsq $1056964608, %r10
	movq %r10, %xmm1
	subss %xmm1, %xmm0
	movq (%rsi), %rax
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 1352(%rax)
	xorps %xmm0, %xmm0
	movabsq $1056964608, %r10
	movq %r10, %xmm1
	subss %xmm1, %xmm0
	movq (%rsi), %rax
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 1360(%rax)
	movq (%rsi), %rax
	movabsq $1090519040, %r10
	movq %r10, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 1392(%rax)
	movq (%rsi), %rax
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 1400(%rax)
	movq (%rsi), %rax
	movabsq $1056964608, %r10
	movq %r10, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 1408(%rax)
	xorps %xmm0, %xmm0
	movabsq $1056964608, %r10
	movq %r10, %xmm1
	subss %xmm1, %xmm0
	movq (%rsi), %rax
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 1416(%rax)
	movq (%rsi), %rax
	movabsq $1056964608, %r10
	movq %r10, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 1424(%rax)
	movq (%rsi), %rax
	movabsq $1090519040, %r10
	movq %r10, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 1456(%rax)
	movq (%rsi), %rax
	movabsq $1090519040, %r10
	movq %r10, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 1464(%rax)
	xorps %xmm0, %xmm0
	movabsq $1056964608, %r10
	movq %r10, %xmm1
	subss %xmm1, %xmm0
	movq (%rsi), %rax
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 1472(%rax)
	xorps %xmm0, %xmm0
	movabsq $1056964608, %r10
	movq %r10, %xmm1
	subss %xmm1, %xmm0
	movq (%rsi), %rax
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 1480(%rax)
	movq (%rsi), %rax
	movabsq $1056964608, %r10
	movq %r10, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 1488(%rax)
	movq (%rsi), %rax
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 1520(%rax)
	movq (%rsi), %rax
	movabsq $1090519040, %r10
	movq %r10, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, 1528(%rax)
	movq 16(%rsi), %rax
	movl $0, (%rax)
	movq 16(%rsi), %rax
	movl $1, 4(%rax)
	movq 16(%rsi), %rax
	movl $2, 8(%rax)
	movq 16(%rsi), %rax
	movl $0, 12(%rax)
	movq 16(%rsi), %rax
	movl $2, 16(%rax)
	movq 16(%rsi), %rax
	movl $3, 20(%rax)
	movq 16(%rsi), %rax
	movl $4, 24(%rax)
	movq 16(%rsi), %rax
	movl $5, 28(%rax)
	movq 16(%rsi), %rax
	movl $6, 32(%rax)
	movq 16(%rsi), %rax
	movl $4, 36(%rax)
	movq 16(%rsi), %rax
	movl $6, 40(%rax)
	movq 16(%rsi), %rax
	movl $7, 44(%rax)
	movq 16(%rsi), %rax
	movl $8, 48(%rax)
	movq 16(%rsi), %rax
	movl $9, 52(%rax)
	movq 16(%rsi), %rax
	movl $10, 56(%rax)
	movq 16(%rsi), %rax
	movl $8, 60(%rax)
	movq 16(%rsi), %rax
	movl $10, 64(%rax)
	movq 16(%rsi), %rax
	movl $11, 68(%rax)
	movq 16(%rsi), %rax
	movl $12, 72(%rax)
	movq 16(%rsi), %rax
	movl $13, 76(%rax)
	movq 16(%rsi), %rax
	movl $14, 80(%rax)
	movq 16(%rsi), %rax
	movl $12, 84(%rax)
	movq 16(%rsi), %rax
	movl $14, 88(%rax)
	movq 16(%rsi), %rax
	movl $15, 92(%rax)
	movq 16(%rsi), %rax
	movl $16, 96(%rax)
	movq 16(%rsi), %rax
	movl $17, 100(%rax)
	movq 16(%rsi), %rax
	movl $18, 104(%rax)
	movq 16(%rsi), %rax
	movl $16, 108(%rax)
	movq 16(%rsi), %rax
	movl $18, 112(%rax)
	movq 16(%rsi), %rax
	movl $19, 116(%rax)
	movq 16(%rsi), %rax
	movl $20, 120(%rax)
	movq 16(%rsi), %rax
	movl $21, 124(%rax)
	movq 16(%rsi), %rax
	movl $22, 128(%rax)
	movq 16(%rsi), %rax
	movl $20, 132(%rax)
	movq 16(%rsi), %rax
	movl $22, 136(%rax)
	movq 16(%rsi), %rax
	movl $23, 140(%rax)
	movq %rsi, %rcx
	callq raycaster__r3d_mesh_compute_normals__1__R3DMeshE1_ptr1__ret_voidE1
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl make_metal_texture__1__RCTexturePaletteE1_ptr1__ret_voidE1
	.def make_metal_texture__1__RCTexturePaletteE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
make_metal_texture__1__RCTexturePaletteE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $128, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
	movq %r14, -48(%rbp)
.LB23376:
	movq %rcx, %rsi
	movl $32, %ecx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, %rdi
	xorl %ebx, %ebx
	xorl %eax, %eax
	xorps %xmm0, %xmm0
	xorps %xmm1, %xmm1
	xorps %xmm2, %xmm2
	xorps %xmm3, %xmm3
	xorps %xmm4, %xmm4
.LB23399:
	cmpl $2, %ebx
	jge .LB23401
.LB23400:
	movl %ebx, %r12d
	shll $1, %r12d
	xorl %r13d, %r13d
.LB23405:
	cmpl $2, %r13d
	jge .LB23407
.LB23406:
	xorps %xmm0, %xmm0
	leal (%r13,%rbx), %eax
	movl %eax, %ecx
	sarl $31, %ecx
	movl %eax, %ecx
	shrl $31, %ecx
	addl %eax, %ecx
	andl $-2, %ecx
	cvtss2sd %xmm0, %xmm0
	movl %eax, %r14d
	subl %ecx, %r14d
	movsd %xmm0, -56(%rbp)
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, -64(%rbp)
	testl %r14d, %r14d
	je .LB23419
.LB23420:
	movabsq $1060655596, %r10
	movq %r10, %xmm0
	movabsq $1061158912, %r10
	movq %r10, %xmm3
	movsd -56(%rbp), %xmm1
	movsd -64(%rbp), %xmm2
	cvtss2sd %xmm0, %xmm0
	cvtss2sd %xmm3, %xmm3
	addsd %xmm1, %xmm0
	addsd %xmm3, %xmm1
	movsd -56(%rbp), %xmm3
	subsd %xmm2, %xmm0
	subsd %xmm2, %xmm1
	movabsq $1062333317, %r10
	movq %r10, %xmm2
	cvtss2sd %xmm2, %xmm2
	addsd %xmm3, %xmm2
	movsd -64(%rbp), %xmm3
	subsd %xmm3, %xmm2
.LB23421:
	xorps %xmm3, %xmm3
	cvtss2sd %xmm3, %xmm3
	ucomisd %xmm0, %xmm3
	ja .LB23455
.LB23456:
	movabsq $1065353216, %r10
	movq %r10, %xmm3
	cvtss2sd %xmm3, %xmm3
	ucomisd %xmm3, %xmm0
	ja .LB23462
.LB23463:
	movsd %xmm0, -72(%rbp)
.LB23457:
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	ucomisd %xmm1, %xmm0
	ja .LB23468
.LB23469:
	movabsq $1065353216, %r10
	movq %r10, %xmm0
	cvtss2sd %xmm0, %xmm0
	ucomisd %xmm0, %xmm1
	ja .LB23475
.LB23476:
	movsd %xmm1, -80(%rbp)
.LB23470:
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	ucomisd %xmm2, %xmm0
	ja .LB23481
.LB23482:
	movabsq $1065353216, %r10
	movq %r10, %xmm0
	cvtss2sd %xmm0, %xmm0
	ucomisd %xmm0, %xmm2
	ja .LB23488
.LB23489:
	movsd %xmm2, -88(%rbp)
.LB23483:
	movsd -72(%rbp), %xmm0
	movsd -80(%rbp), %xmm1
	movsd -88(%rbp), %xmm2
	callq raycaster__color64_pack__3__doubleE1__doubleE1__doubleE1__ret_dataE1_ubits64
	leal (%r12,%r13), %ecx
	movslq %ecx, %rcx
	movq %rax, (%rdi,%rcx,8)
	incl %r13d
	movq %r14, %rax
	movsd -72(%rbp), %xmm0
	movsd -80(%rbp), %xmm1
	movsd -88(%rbp), %xmm2
	movsd -56(%rbp), %xmm3
	movsd -64(%rbp), %xmm4
	cmpl $2, %r13d
	jl .LB23406
	jmp .LB23407
.LB23401:
	movq %rsi, %rcx
	movq %rdi, %rdx
	movl $2, %r8d
	movl $2, %r9d
	callq raycaster__rc_palette_add__4__RCTexturePaletteE1_ptr1__dataE1_ptr1_ubits64__dataE1_sbits32__dataE1_sbits32__ret_dataE1_sbits32
	movl 8(%rsi), %eax
	decl %eax
	movq (%rsi), %rcx
	movslq %eax, %rax
	imulq $212, %rax, %rax
	leaq (%rcx,%rax,1), %rcx
	callq raycaster__rc_tex_build_mips__1__RCTextureE1_ptr1__ret_voidE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	leave
	ret
.LB23407:
	incl %ebx
	cmpl $2, %ebx
	jl .LB23400
	jmp .LB23401
.LB23419:
	movabsq $1043878380, %r10
	movq %r10, %xmm0
	movabsq $1043878380, %r10
	movq %r10, %xmm3
	movsd -56(%rbp), %xmm1
	movsd -64(%rbp), %xmm2
	cvtss2sd %xmm0, %xmm0
	cvtss2sd %xmm3, %xmm3
	addsd %xmm1, %xmm0
	addsd %xmm3, %xmm1
	movsd -56(%rbp), %xmm3
	subsd %xmm2, %xmm0
	subsd %xmm2, %xmm1
	movabsq $1046562734, %r10
	movq %r10, %xmm2
	cvtss2sd %xmm2, %xmm2
	addsd %xmm3, %xmm2
	movsd -64(%rbp), %xmm3
	subsd %xmm3, %xmm2
	jmp .LB23421
.LB23462:
	movabsq $1065353216, %r10
	movq %r10, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, -72(%rbp)
	jmp .LB23457
.LB23455:
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, -72(%rbp)
	jmp .LB23457
.LB23475:
	movabsq $1065353216, %r10
	movq %r10, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, -80(%rbp)
	jmp .LB23470
.LB23468:
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, -80(%rbp)
	jmp .LB23470
.LB23488:
	movabsq $1065353216, %r10
	movq %r10, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, -88(%rbp)
	jmp .LB23483
.LB23481:
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, -88(%rbp)
	jmp .LB23483
	.text
	.globl lcg_next__1__dataE1_ptr1_ubits64__ret_intE1
	.def lcg_next__1__dataE1_ptr1_ubits64__ret_intE1;
	.scl 2;
	.type 32;
	.endef
lcg_next__1__dataE1_ptr1_ubits64__ret_intE1:
.LB23521:
	movq (%rcx), %rax
	imulq $1664525, %rax, %rax
	addq $1013904223, %rax
	movq %rax, (%rcx)
	shrq $17, %rax
	andq $32767, %rax
	ret
	.text
	.globl lcg_double__1__dataE1_ptr1_ubits64__ret_doubleE1
	.def lcg_double__1__dataE1_ptr1_ubits64__ret_doubleE1;
	.scl 2;
	.type 32;
	.endef
lcg_double__1__dataE1_ptr1_ubits64__ret_doubleE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB23537:
	callq lcg_next__1__dataE1_ptr1_ubits64__ret_intE1
	movslq %eax, %rax
	xorps %xmm0, %xmm0
	cvtsi2sdq %rax, %xmm0
	movabsq $4674736413210574848, %r10
	movq %r10, %xmm1
	divsd %xmm1, %xmm0
	leave
	ret
	.text
	.globl lcg_range__3__dataE1_ptr1_ubits64__doubleE1__doubleE1__ret_doubleE1
	.def lcg_range__3__dataE1_ptr1_ubits64__doubleE1__doubleE1__ret_doubleE1;
	.scl 2;
	.type 32;
	.endef
lcg_range__3__dataE1_ptr1_ubits64__doubleE1__doubleE1__ret_doubleE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
.LB23543:
	movaps %xmm1, %xmm0
	movsd %xmm0, -8(%rbp)
	movaps %xmm2, %xmm0
	movsd %xmm0, -16(%rbp)
	callq lcg_next__1__dataE1_ptr1_ubits64__ret_intE1
	movslq %eax, %rax
	xorps %xmm0, %xmm0
	cvtsi2sdq %rax, %xmm0
	movabsq $4674736413210574848, %r10
	movq %r10, %xmm1
	divsd %xmm1, %xmm0
	movsd -16(%rbp), %xmm1
	movsd -8(%rbp), %xmm2
	subsd %xmm2, %xmm1
	vfmadd132sd %xmm1, %xmm2, %xmm0
	leave
	ret
	.text
	.globl build_fps_title__7__byteE1_ptr1__intE1__doubleE1__intE1__doubleE1__doubleE1__doubleE1__ret_voidE1
	.def build_fps_title__7__byteE1_ptr1__intE1__doubleE1__intE1__doubleE1__doubleE1__doubleE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
build_fps_title__7__byteE1_ptr1__intE1__doubleE1__intE1__doubleE1__doubleE1__doubleE1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $224, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
.LB23555:
	movq %rcx, %rsi
	movaps %xmm2, %xmm0
	movsd %xmm0, -168(%rbp)
	movl %r9d, %edi
	movsd 48(%rbp), %xmm0
	movsd %xmm0, -176(%rbp)
	movsd 56(%rbp), %xmm0
	movsd %xmm0, -184(%rbp)
	movsd 64(%rbp), %xmm0
	movsd %xmm0, -192(%rbp)
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -88(%rbp)
	vmovdqu .LZERO+32(%rip), %ymm15
	vmovdqu %ymm15, -56(%rbp)
	vzeroupper
	leaq -108(%rbp), %rax
	movl $1700951363, -108(%rbp)
	movl $1920226080, -104(%rbp)
	movl $544437093, -100(%rbp)
	movl $1346773116, -96(%rbp)
	movl $2112083, -92(%rbp)
	xorl %ebx, %ebx
	xorl %ecx, %ecx
.LB23590:
	movslq %ecx, %r8
	movzbl (%rax,%r8,1), %r8d
	testb %r8b, %r8b
	je .LB23592
.LB23591:
	movslq %ebx, %r9
	movb %r8b, (%rsi,%r9,1)
	incl %ebx
	incl %ecx
	jmp .LB23590
.LB23592:
	leaq -88(%rbp), %rax
	movq %rdx, %rcx
	movq %rax, %rdx
	callq standard__strings__i32str__2__dataE1_sbits32__byteE1_ptr1__ret_dataE1_sbits32
	movslq %eax, %rax
	xorl %ecx, %ecx
.LB23613:
	cmpq %rax, %rcx
	jge .LB23615
.LB23614:
	movzbl -88(%rbp,%rcx,1), %edx
	movslq %ebx, %r8
	movb %dl, (%rsi,%r8,1)
	incl %ebx
	incq %rcx
	cmpq %rax, %rcx
	jl .LB23614
.LB23615:
	movl $1092647968, -117(%rbp)
	movl $540698486, -113(%rbp)
	movb $0, -109(%rbp)
	leaq -117(%rbp), %rax
	xorl %ecx, %ecx
.LB23641:
	movslq %ecx, %rdx
	movzbl (%rax,%rdx,1), %edx
	testb %dl, %dl
	je .LB23643
.LB23642:
	movslq %ebx, %r8
	movb %dl, (%rsi,%r8,1)
	incl %ebx
	incl %ecx
	jmp .LB23641
.LB23643:
	leaq -88(%rbp), %rdx
	movsd -168(%rbp), %xmm0
	movl $1, %r8d
	callq standard__strings__dbl2str__3__doubleE1__byteE1_ptr1__dataE1_sbits32__ret_dataE1_sbits32
	movslq %eax, %rax
	xorl %ecx, %ecx
.LB23664:
	cmpq %rax, %rcx
	jge .LB23666
.LB23665:
	movzbl -88(%rbp,%rcx,1), %edx
	movslq %ebx, %r8
	movb %dl, (%rsi,%r8,1)
	incl %ebx
	incq %rcx
	cmpq %rax, %rcx
	jl .LB23665
.LB23666:
	movl $1663073312, -125(%rbp)
	movl $3830380, -121(%rbp)
	leaq -125(%rbp), %rax
	xorl %ecx, %ecx
.LB23691:
	movslq %ecx, %rdx
	movzbl (%rax,%rdx,1), %edx
	testb %dl, %dl
	je .LB23693
.LB23692:
	movslq %ebx, %r8
	movb %dl, (%rsi,%r8,1)
	incl %ebx
	incl %ecx
	jmp .LB23691
.LB23693:
	leaq -88(%rbp), %rdx
	movsd -176(%rbp), %xmm0
	xorl %r8d, %r8d
	callq standard__strings__dbl2str__3__doubleE1__byteE1_ptr1__dataE1_sbits32__ret_dataE1_sbits32
	movslq %eax, %rax
	xorl %ecx, %ecx
.LB23714:
	cmpq %rax, %rcx
	jge .LB23716
.LB23715:
	movzbl -88(%rbp,%rcx,1), %edx
	movslq %ebx, %r8
	movb %dl, (%rsi,%r8,1)
	incl %ebx
	incq %rcx
	cmpq %rax, %rcx
	jl .LB23715
.LB23716:
	movl $1730179949, -133(%rbp)
	movl $3829605, -129(%rbp)
	leaq -133(%rbp), %rax
	xorl %ecx, %ecx
.LB23741:
	movslq %ecx, %rdx
	movzbl (%rax,%rdx,1), %edx
	testb %dl, %dl
	je .LB23743
.LB23742:
	movslq %ebx, %r8
	movb %dl, (%rsi,%r8,1)
	incl %ebx
	incl %ecx
	jmp .LB23741
.LB23743:
	leaq -88(%rbp), %rdx
	movsd -184(%rbp), %xmm0
	xorl %r8d, %r8d
	callq standard__strings__dbl2str__3__doubleE1__byteE1_ptr1__dataE1_sbits32__ret_dataE1_sbits32
	movslq %eax, %rax
	xorl %ecx, %ecx
.LB23764:
	cmpq %rax, %rcx
	jge .LB23766
.LB23765:
	movzbl -88(%rbp,%rcx,1), %edx
	movslq %ebx, %r8
	movb %dl, (%rsi,%r8,1)
	incl %ebx
	incq %rcx
	cmpq %rax, %rcx
	jl .LB23765
.LB23766:
	movl $1814066029, -141(%rbp)
	movl $3830889, -137(%rbp)
	leaq -141(%rbp), %rax
	xorl %ecx, %ecx
.LB23791:
	movslq %ecx, %rdx
	movzbl (%rax,%rdx,1), %edx
	testb %dl, %dl
	je .LB23793
.LB23792:
	movslq %ebx, %r8
	movb %dl, (%rsi,%r8,1)
	incl %ebx
	incl %ecx
	jmp .LB23791
.LB23793:
	leaq -88(%rbp), %rdx
	movsd -192(%rbp), %xmm0
	xorl %r8d, %r8d
	callq standard__strings__dbl2str__3__doubleE1__byteE1_ptr1__dataE1_sbits32__ret_dataE1_sbits32
	movslq %eax, %rax
	xorl %ecx, %ecx
.LB23814:
	cmpq %rax, %rcx
	jge .LB23816
.LB23815:
	movzbl -88(%rbp,%rcx,1), %edx
	movslq %ebx, %r8
	movb %dl, (%rsi,%r8,1)
	incl %ebx
	incq %rcx
	cmpq %rax, %rcx
	jl .LB23815
.LB23816:
	leaq -152(%rbp), %rcx
	movslq %ebx, %rax
	incl %ebx
	movb $109, (%rsi,%rax,1)
	movslq %ebx, %rax
	movb $115, (%rsi,%rax,1)
	leal 1(%rbx), %eax
	movl $1444969504, -152(%rbp)
	movl $1668184403, -148(%rbp)
	movw $8250, -144(%rbp)
	movb $0, -142(%rbp)
	xorl %edx, %edx
.LB23854:
	movslq %edx, %r8
	movzbl (%rcx,%r8,1), %r8d
	testb %r8b, %r8b
	je .LB23856
.LB23855:
	movslq %eax, %r9
	movb %r8b, (%rsi,%r9,1)
	incl %eax
	incl %edx
	jmp .LB23854
.LB23856:
	testl %edi, %edi
	jne .LB23876
.LB23877:
	movl $4605519, -156(%rbp)
	leaq -156(%rbp), %rcx
	xorl %edx, %edx
.LB23912:
	movslq %edx, %rdi
	movzbl (%rcx,%rdi,1), %edi
	testb %dil, %dil
	je .LB23914
.LB23913:
	movslq %eax, %r8
	movb %dil, (%rsi,%r8,1)
	incl %eax
	incl %edx
	jmp .LB23912
.LB23914:
	movslq %eax, %rax
	movb $0, (%rsi,%rax,1)
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB23876:
	movw $20047, -159(%rbp)
	movb $0, -157(%rbp)
	leaq -159(%rbp), %rcx
	xorl %edx, %edx
.LB23885:
	movslq %edx, %rdi
	movzbl (%rcx,%rdi,1), %edi
	testb %dil, %dil
	je .LB23887
.LB23886:
	movslq %eax, %r8
	movb %dil, (%rsi,%r8,1)
	incl %eax
	incl %edx
	jmp .LB23885
.LB23887:
	movslq %eax, %rax
	movb $0, (%rsi,%rax,1)
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
	.text
	.globl __static_init
	.def __static_init;
	.scl 2;
	.type 32;
	.endef
__static_init:
.LB1:
	ret
	.section .rdata,"dr"
	.p2align 4
IDKC_TYPESYS.TLD:
	.long 640
	.long 17
	.long 0
	.long 64
	.long 64
	.long 64
	.long 64
	.long 64
	.long 128
	.long 1
	.long 1
	.long 129
	.long 1
	.long 1
	.long 130
	.long 1
	.long 1
	.long 131
	.long 1
	.long 1
	.long 132
	.long 1
	.long 1
	.long 160
	.long 32
	.long 32
	.long 192
	.long 1
	.long 1
	.long 224
	.long 32
	.long 32
	.long 256
	.long 32
	.long 32
	.long 288
	.long 32
	.long 32
	.long 320
	.long 32
	.long 32
	.long 384
	.long 64
	.long 64
	.long 448
	.long 1
	.long 1
	.long 512
	.long 64
	.long 64
	.long 576
	.long 64
	.long 64
	.section .rdata,"dr"
	.p2align 4
IDKC_PARAM.TLD:
	.long 704
	.long 2
	.long 0
	.long 64
	.long 64
	.long 64
	.long 640
	.long 64
	.section .rdata,"dr"
	.p2align 4
IDKC_FUNCINFO.TLD:
	.long 928
	.long 12
	.long 0
	.long 32
	.long 32
	.long 64
	.long 64
	.long 64
	.long 128
	.long 640
	.long 64
	.long 768
	.long 64
	.long 64
	.long 832
	.long 1
	.long 1
	.long 833
	.long 1
	.long 1
	.long 834
	.long 1
	.long 1
	.long 835
	.long 1
	.long 1
	.long 836
	.long 1
	.long 1
	.long 837
	.long 1
	.long 1
	.long 864
	.long 32
	.long 32
	.long 896
	.long 32
	.long 32
	.section .rdata,"dr"
	.p2align 4
PtrVec.TLD:
	.long 128
	.long 3
	.long 0
	.long 64
	.long 64
	.long 64
	.long 32
	.long 32
	.long 96
	.long 32
	.long 32
	.section .rdata,"dr"
	.p2align 4
NameMap.TLD:
	.long 288
	.long 6
	.long 0
	.long 64
	.long 64
	.long 64
	.long 64
	.long 64
	.long 128
	.long 64
	.long 64
	.long 192
	.long 32
	.long 32
	.long 224
	.long 32
	.long 32
	.long 256
	.long 32
	.long 32
	.section .rdata,"dr"
	.p2align 4
IDKC_SYMENTRY.TLD:
	.long 1024
	.long 8
	.long 0
	.long 64
	.long 64
	.long 64
	.long 64
	.long 64
	.long 128
	.long 640
	.long 64
	.long 768
	.long 64
	.long 64
	.long 832
	.long 32
	.long 32
	.long 864
	.long 32
	.long 32
	.long 896
	.long 64
	.long 64
	.long 960
	.long 64
	.long 64
	.section .rdata,"dr"
	.p2align 4
IDKC_SYMTABLE.TLD:
	.long 768
	.long 12
	.long 0
	.long 32
	.long 32
	.long 64
	.long 64
	.long 64
	.long 128
	.long 64
	.long 64
	.long 192
	.long 64
	.long 64
	.long 256
	.long 64
	.long 64
	.long 320
	.long 64
	.long 64
	.long 384
	.long 64
	.long 64
	.long 448
	.long 64
	.long 64
	.long 512
	.long 64
	.long 64
	.long 576
	.long 64
	.long 64
	.long 640
	.long 64
	.long 64
	.long 704
	.long 64
	.long 64
	.section .rdata,"dr"
	.p2align 4
SYSTEM_INFO_PARTIAL.TLD:
	.long 384
	.long 10
	.long 0
	.long 32
	.long 1
	.long 32
	.long 32
	.long 1
	.long 64
	.long 64
	.long 64
	.long 128
	.long 64
	.long 64
	.long 192
	.long 64
	.long 1
	.long 256
	.long 32
	.long 1
	.long 288
	.long 32
	.long 1
	.long 320
	.long 32
	.long 1
	.long 352
	.long 16
	.long 1
	.long 368
	.long 16
	.long 1
	.section .rdata,"dr"
	.p2align 4
BlockEntry.TLD:
	.long 256
	.long 4
	.long 0
	.long 64
	.long 1
	.long 64
	.long 64
	.long 1
	.long 128
	.long 64
	.long 1
	.long 192
	.long 64
	.long 1
	.section .rdata,"dr"
	.p2align 4
Slab.TLD:
	.long 320
	.long 5
	.long 0
	.long 64
	.long 1
	.long 64
	.long 64
	.long 1
	.long 128
	.long 64
	.long 1
	.long 192
	.long 64
	.long 1
	.long 256
	.long 64
	.long 64
	.section .rdata,"dr"
	.p2align 4
FreeNode.TLD:
	.long 64
	.long 1
	.long 0
	.long 64
	.long 64
	.section .rdata,"dr"
	.p2align 4
RingAllocResult.TLD:
	.long 65
	.long 2
	.long 0
	.long 64
	.long 64
	.long 64
	.long 1
	.long 1
	.section .rdata,"dr"
	.p2align 4
standard__memory__allocators__stdarena__ArenaChunk.TLD:
	.long 192
	.long 3
	.long 0
	.long 64
	.long 64
	.long 64
	.long 64
	.long 1
	.long 128
	.long 64
	.long 1
	.section .rdata,"dr"
	.p2align 4
standard__memory__allocators__stdarena__Arena.TLD:
	.long 192
	.long 3
	.long 0
	.long 64
	.long 64
	.long 64
	.long 64
	.long 1
	.long 128
	.long 64
	.long 1
	.section .rdata,"dr"
	.p2align 4
ExceptionState.TLD:
	.long 1152
	.long 18
	.long 0
	.long 64
	.long 1
	.long 64
	.long 64
	.long 1
	.long 128
	.long 64
	.long 1
	.long 192
	.long 64
	.long 1
	.long 256
	.long 64
	.long 1
	.long 320
	.long 64
	.long 1
	.long 384
	.long 64
	.long 1
	.long 448
	.long 64
	.long 1
	.long 512
	.long 64
	.long 1
	.long 576
	.long 64
	.long 1
	.long 640
	.long 64
	.long 1
	.long 704
	.long 64
	.long 1
	.long 768
	.long 64
	.long 1
	.long 832
	.long 64
	.long 1
	.long 896
	.long 64
	.long 1
	.long 960
	.long 64
	.long 1
	.long 1024
	.long 64
	.long 1
	.long 1088
	.long 64
	.long 1
	.section .rdata,"dr"
	.p2align 4
Exception.TLD:
	.long 1248
	.long 3
	.long 0
	.long 64
	.long 64
	.long 64
	.long 32
	.long 1
	.long 96
	.long 1152
	.long 1
	.section .rdata,"dr"
	.p2align 4
WinExceptionRecord.TLD:
	.long 1184
	.long 6
	.long 0
	.long 32
	.long 1
	.long 32
	.long 32
	.long 1
	.long 64
	.long 64
	.long 64
	.long 128
	.long 64
	.long 64
	.long 192
	.long 32
	.long 1
	.long 224
	.long 960
	.long 1
	.section .rdata,"dr"
	.p2align 4
WinContext.TLD:
	.long 2048
	.long 38
	.long 0
	.long 64
	.long 1
	.long 64
	.long 64
	.long 1
	.long 128
	.long 64
	.long 1
	.long 192
	.long 64
	.long 1
	.long 256
	.long 64
	.long 1
	.long 320
	.long 64
	.long 1
	.long 384
	.long 32
	.long 1
	.long 416
	.long 32
	.long 1
	.long 448
	.long 16
	.long 1
	.long 464
	.long 16
	.long 1
	.long 480
	.long 16
	.long 1
	.long 496
	.long 16
	.long 1
	.long 512
	.long 16
	.long 1
	.long 528
	.long 16
	.long 1
	.long 544
	.long 32
	.long 1
	.long 576
	.long 64
	.long 1
	.long 640
	.long 64
	.long 1
	.long 704
	.long 64
	.long 1
	.long 768
	.long 64
	.long 1
	.long 832
	.long 64
	.long 1
	.long 896
	.long 64
	.long 1
	.long 960
	.long 64
	.long 1
	.long 1024
	.long 64
	.long 1
	.long 1088
	.long 64
	.long 1
	.long 1152
	.long 64
	.long 1
	.long 1216
	.long 64
	.long 1
	.long 1280
	.long 64
	.long 1
	.long 1344
	.long 64
	.long 1
	.long 1408
	.long 64
	.long 1
	.long 1472
	.long 64
	.long 1
	.long 1536
	.long 64
	.long 1
	.long 1600
	.long 64
	.long 1
	.long 1664
	.long 64
	.long 1
	.long 1728
	.long 64
	.long 1
	.long 1792
	.long 64
	.long 1
	.long 1856
	.long 64
	.long 1
	.long 1920
	.long 64
	.long 1
	.long 1984
	.long 64
	.long 1
	.section .rdata,"dr"
	.p2align 4
WinExceptionPointers.TLD:
	.long 128
	.long 2
	.long 0
	.long 64
	.long 64
	.long 64
	.long 64
	.long 64
	.section .rdata,"dr"
	.p2align 4
IDEKAJmpBuf.TLD:
	.long 768
	.long 12
	.long 0
	.long 64
	.long 1
	.long 64
	.long 64
	.long 1
	.long 128
	.long 64
	.long 1
	.long 192
	.long 64
	.long 1
	.long 256
	.long 64
	.long 1
	.long 320
	.long 64
	.long 1
	.long 384
	.long 64
	.long 1
	.long 448
	.long 64
	.long 1
	.long 512
	.long 64
	.long 64
	.long 576
	.long 64
	.long 64
	.long 640
	.long 64
	.long 64
	.long 704
	.long 64
	.long 64
	.section .rdata,"dr"
	.p2align 4
timespec.TLD:
	.long 128
	.long 2
	.long 0
	.long 64
	.long 1
	.long 64
	.long 64
	.long 1
	.section .rdata,"dr"
	.p2align 4
standard__math__POINT.TLD:
	.long 64
	.long 2
	.long 0
	.long 32
	.long 32
	.long 32
	.long 32
	.long 32
	.section .rdata,"dr"
	.p2align 4
standard__system__windows__MSG.TLD:
	.long 384
	.long 6
	.long 0
	.long 64
	.long 64
	.long 64
	.long 32
	.long 32
	.long 128
	.long 64
	.long 64
	.long 192
	.long 64
	.long 64
	.long 256
	.long 32
	.long 32
	.long 288
	.long 64
	.long 32
	.section .rdata,"dr"
	.p2align 4
standard__system__windows__WNDCLASSEXA.TLD:
	.long 640
	.long 12
	.long 0
	.long 32
	.long 32
	.long 32
	.long 32
	.long 32
	.long 64
	.long 64
	.long 64
	.long 128
	.long 32
	.long 32
	.long 160
	.long 32
	.long 32
	.long 192
	.long 64
	.long 64
	.long 256
	.long 64
	.long 64
	.long 320
	.long 64
	.long 64
	.long 384
	.long 64
	.long 64
	.long 448
	.long 64
	.long 64
	.long 512
	.long 64
	.long 64
	.long 576
	.long 64
	.long 64
	.section .rdata,"dr"
	.p2align 4
standard__system__windows__RECT.TLD:
	.long 128
	.long 4
	.long 0
	.long 32
	.long 32
	.long 32
	.long 32
	.long 32
	.long 64
	.long 32
	.long 32
	.long 96
	.long 32
	.long 32
	.section .rdata,"dr"
	.p2align 4
standard__system__windows__PAINTSTRUCT.TLD:
	.long 576
	.long 6
	.long 0
	.long 64
	.long 64
	.long 64
	.long 32
	.long 32
	.long 96
	.long 128
	.long 32
	.long 224
	.long 32
	.long 32
	.long 256
	.long 32
	.long 32
	.long 288
	.long 256
	.long 8
	.section .rdata,"dr"
	.p2align 4
PIXELFORMATDESCRIPTOR.TLD:
	.long 320
	.long 26
	.long 0
	.long 16
	.long 1
	.long 16
	.long 16
	.long 1
	.long 32
	.long 32
	.long 1
	.long 64
	.long 8
	.long 1
	.long 72
	.long 8
	.long 1
	.long 80
	.long 8
	.long 1
	.long 88
	.long 8
	.long 1
	.long 96
	.long 8
	.long 1
	.long 104
	.long 8
	.long 1
	.long 112
	.long 8
	.long 1
	.long 120
	.long 8
	.long 1
	.long 128
	.long 8
	.long 1
	.long 136
	.long 8
	.long 1
	.long 144
	.long 8
	.long 1
	.long 152
	.long 8
	.long 1
	.long 160
	.long 8
	.long 1
	.long 168
	.long 8
	.long 1
	.long 176
	.long 8
	.long 1
	.long 184
	.long 8
	.long 1
	.long 192
	.long 8
	.long 1
	.long 200
	.long 8
	.long 1
	.long 208
	.long 8
	.long 1
	.long 216
	.long 8
	.long 1
	.long 224
	.long 32
	.long 1
	.long 256
	.long 32
	.long 1
	.long 288
	.long 32
	.long 1
	.section .rdata,"dr"
	.p2align 4
Thread.TLD:
	.long 96
	.long 2
	.long 0
	.long 64
	.long 8
	.long 64
	.long 32
	.long 1
	.section .rdata,"dr"
	.p2align 4
Mutex.TLD:
	.long 512
	.long 1
	.long 0
	.long 512
	.long 8
	.section .rdata,"dr"
	.p2align 4
RWLock.TLD:
	.long 512
	.long 1
	.long 0
	.long 512
	.long 8
	.section .rdata,"dr"
	.p2align 4
CondVar.TLD:
	.long 512
	.long 1
	.long 0
	.long 512
	.long 8
	.section .rdata,"dr"
	.p2align 4
Semaphore.TLD:
	.long 256
	.long 1
	.long 0
	.long 256
	.long 8
	.section .rdata,"dr"
	.p2align 4
Barrier.TLD:
	.long 128
	.long 4
	.long 0
	.long 32
	.long 1
	.long 32
	.long 32
	.long 1
	.long 64
	.long 32
	.long 1
	.long 96
	.long 32
	.long 1
	.section .rdata,"dr"
	.p2align 4
TLSKey.TLD:
	.long 64
	.long 1
	.long 0
	.long 64
	.long 8
	.section .rdata,"dr"
	.p2align 4
DVec2.TLD:
	.long 128
	.long 2
	.long 0
	.long 64
	.long 64
	.long 64
	.long 64
	.long 64
	.section .rdata,"dr"
	.p2align 4
DVec3.TLD:
	.long 192
	.long 3
	.long 0
	.long 64
	.long 64
	.long 64
	.long 64
	.long 64
	.long 128
	.long 64
	.long 64
	.section .rdata,"dr"
	.p2align 4
DVec4.TLD:
	.long 256
	.long 4
	.long 0
	.long 64
	.long 64
	.long 64
	.long 64
	.long 64
	.long 128
	.long 64
	.long 64
	.long 192
	.long 64
	.long 64
	.section .rdata,"dr"
	.p2align 4
DMat4.TLD:
	.long 1024
	.long 16
	.long 0
	.long 64
	.long 64
	.long 64
	.long 64
	.long 64
	.long 128
	.long 64
	.long 64
	.long 192
	.long 64
	.long 64
	.long 256
	.long 64
	.long 64
	.long 320
	.long 64
	.long 64
	.long 384
	.long 64
	.long 64
	.long 448
	.long 64
	.long 64
	.long 512
	.long 64
	.long 64
	.long 576
	.long 64
	.long 64
	.long 640
	.long 64
	.long 64
	.long 704
	.long 64
	.long 64
	.long 768
	.long 64
	.long 64
	.long 832
	.long 64
	.long 64
	.long 896
	.long 64
	.long 64
	.long 960
	.long 64
	.long 64
	.section .rdata,"dr"
	.p2align 4
RCTile.TLD:
	.long 192
	.long 5
	.long 0
	.long 32
	.long 1
	.long 32
	.long 32
	.long 1
	.long 64
	.long 32
	.long 1
	.long 96
	.long 32
	.long 1
	.long 128
	.long 64
	.long 1
	.section .rdata,"dr"
	.p2align 4
RCMap.TLD:
	.long 256
	.long 5
	.long 0
	.long 64
	.long 64
	.long 64
	.long 32
	.long 1
	.long 96
	.long 32
	.long 1
	.long 128
	.long 64
	.long 1
	.long 192
	.long 64
	.long 1
	.section .rdata,"dr"
	.p2align 4
RCTexture.TLD:
	.long 1696
	.long 7
	.long 0
	.long 64
	.long 64
	.long 64
	.long 32
	.long 1
	.long 96
	.long 32
	.long 1
	.long 128
	.long 768
	.long 64
	.long 896
	.long 384
	.long 1
	.long 1280
	.long 384
	.long 1
	.long 1664
	.long 32
	.long 1
	.section .rdata,"dr"
	.p2align 4
RCTexturePalette.TLD:
	.long 128
	.long 3
	.long 0
	.long 64
	.long 64
	.long 64
	.long 32
	.long 1
	.long 96
	.long 32
	.long 1
	.section .rdata,"dr"
	.p2align 4
RCPlayer.TLD:
	.long 320
	.long 5
	.long 0
	.long 64
	.long 64
	.long 64
	.long 64
	.long 64
	.long 128
	.long 64
	.long 64
	.long 192
	.long 64
	.long 64
	.long 256
	.long 64
	.long 64
	.section .rdata,"dr"
	.p2align 4
RCCamera.TLD:
	.long 576
	.long 10
	.long 0
	.long 64
	.long 64
	.long 64
	.long 32
	.long 1
	.long 96
	.long 32
	.long 1
	.long 128
	.long 64
	.long 64
	.long 192
	.long 64
	.long 64
	.long 256
	.long 64
	.long 64
	.long 320
	.long 64
	.long 64
	.long 384
	.long 64
	.long 64
	.long 448
	.long 64
	.long 64
	.long 512
	.long 64
	.long 64
	.section .rdata,"dr"
	.p2align 4
RCWallHit.TLD:
	.long 384
	.long 9
	.long 0
	.long 64
	.long 64
	.long 64
	.long 64
	.long 64
	.long 128
	.long 32
	.long 1
	.long 160
	.long 32
	.long 1
	.long 192
	.long 32
	.long 1
	.long 224
	.long 32
	.long 1
	.long 256
	.long 32
	.long 1
	.long 288
	.long 32
	.long 1
	.long 320
	.long 64
	.long 1
	.section .rdata,"dr"
	.p2align 4
RCSprite.TLD:
	.long 384
	.long 6
	.long 0
	.long 64
	.long 64
	.long 64
	.long 64
	.long 64
	.long 128
	.long 32
	.long 1
	.long 192
	.long 64
	.long 64
	.long 256
	.long 64
	.long 1
	.long 320
	.long 64
	.long 64
	.section .rdata,"dr"
	.p2align 4
RCSky.TLD:
	.long 128
	.long 2
	.long 0
	.long 64
	.long 1
	.long 64
	.long 64
	.long 1
	.section .rdata,"dr"
	.p2align 4
RCScene.TLD:
	.long 480
	.long 8
	.long 0
	.long 64
	.long 64
	.long 64
	.long 64
	.long 64
	.long 128
	.long 64
	.long 64
	.long 192
	.long 64
	.long 64
	.long 256
	.long 64
	.long 64
	.long 320
	.long 32
	.long 1
	.long 384
	.long 64
	.long 64
	.long 448
	.long 32
	.long 1
	.section .rdata,"dr"
	.p2align 4
R3DVertex.TLD:
	.long 512
	.long 8
	.long 0
	.long 64
	.long 64
	.long 64
	.long 64
	.long 64
	.long 128
	.long 64
	.long 64
	.long 192
	.long 64
	.long 64
	.long 256
	.long 64
	.long 64
	.long 320
	.long 64
	.long 64
	.long 384
	.long 64
	.long 64
	.long 448
	.long 64
	.long 64
	.section .rdata,"dr"
	.p2align 4
R3DTriangle.TLD:
	.long 96
	.long 3
	.long 0
	.long 32
	.long 1
	.long 32
	.long 32
	.long 1
	.long 64
	.long 32
	.long 1
	.section .rdata,"dr"
	.p2align 4
R3DMesh.TLD:
	.long 512
	.long 9
	.long 0
	.long 64
	.long 64
	.long 64
	.long 32
	.long 1
	.long 128
	.long 64
	.long 64
	.long 192
	.long 32
	.long 1
	.long 224
	.long 32
	.long 1
	.long 256
	.long 64
	.long 64
	.long 320
	.long 64
	.long 64
	.long 384
	.long 64
	.long 64
	.long 448
	.long 64
	.long 64
	.section .rdata,"dr"
	.p2align 4
R3DMeshInst.TLD:
	.long 736
	.long 12
	.long 0
	.long 64
	.long 64
	.long 64
	.long 64
	.long 64
	.long 128
	.long 64
	.long 64
	.long 192
	.long 64
	.long 64
	.long 256
	.long 64
	.long 64
	.long 320
	.long 64
	.long 64
	.long 384
	.long 64
	.long 64
	.long 448
	.long 64
	.long 64
	.long 512
	.long 64
	.long 64
	.long 576
	.long 64
	.long 64
	.long 640
	.long 32
	.long 1
	.long 672
	.long 64
	.long 1
	.section .rdata,"dr"
	.p2align 4
R3DLight.TLD:
	.long 960
	.long 15
	.long 0
	.long 32
	.long 1
	.long 64
	.long 64
	.long 64
	.long 128
	.long 64
	.long 64
	.long 192
	.long 64
	.long 64
	.long 256
	.long 64
	.long 64
	.long 320
	.long 64
	.long 64
	.long 384
	.long 64
	.long 64
	.long 448
	.long 64
	.long 64
	.long 512
	.long 64
	.long 64
	.long 576
	.long 64
	.long 64
	.long 640
	.long 64
	.long 64
	.long 704
	.long 64
	.long 64
	.long 768
	.long 64
	.long 64
	.long 832
	.long 64
	.long 64
	.long 896
	.long 64
	.long 64
	.section .rdata,"dr"
	.p2align 4
R3DPlayer.TLD:
	.long 512
	.long 8
	.long 0
	.long 64
	.long 64
	.long 64
	.long 64
	.long 64
	.long 128
	.long 64
	.long 64
	.long 192
	.long 64
	.long 64
	.long 256
	.long 64
	.long 64
	.long 320
	.long 64
	.long 64
	.long 384
	.long 64
	.long 64
	.long 448
	.long 64
	.long 64
	.section .rdata,"dr"
	.p2align 4
R3DCamera.TLD:
	.long 4288
	.long 23
	.long 0
	.long 64
	.long 64
	.long 64
	.long 64
	.long 64
	.long 128
	.long 32
	.long 1
	.long 160
	.long 32
	.long 1
	.long 192
	.long 64
	.long 64
	.long 256
	.long 64
	.long 64
	.long 320
	.long 64
	.long 64
	.long 384
	.long 64
	.long 64
	.long 448
	.long 1024
	.long 64
	.long 1472
	.long 1024
	.long 64
	.long 2496
	.long 1024
	.long 64
	.long 3520
	.long 64
	.long 64
	.long 3584
	.long 64
	.long 64
	.long 3648
	.long 64
	.long 64
	.long 3712
	.long 64
	.long 64
	.long 3776
	.long 64
	.long 64
	.long 3840
	.long 64
	.long 64
	.long 3904
	.long 64
	.long 64
	.long 3968
	.long 64
	.long 64
	.long 4032
	.long 64
	.long 64
	.long 4096
	.long 64
	.long 64
	.long 4160
	.long 64
	.long 64
	.long 4224
	.long 64
	.long 64
	.section .rdata,"dr"
	.p2align 4
R3DSprite.TLD:
	.long 576
	.long 9
	.long 0
	.long 64
	.long 64
	.long 64
	.long 64
	.long 64
	.long 128
	.long 64
	.long 64
	.long 192
	.long 64
	.long 64
	.long 256
	.long 64
	.long 64
	.long 320
	.long 64
	.long 64
	.long 384
	.long 32
	.long 1
	.long 416
	.long 64
	.long 1
	.long 512
	.long 64
	.long 64
	.section .rdata,"dr"
	.p2align 4
R3DVolScatterFrame.TLD:
	.long 38528
	.long 37
	.long 0
	.long 32
	.long 1
	.long 32
	.long 32
	.long 1
	.long 64
	.long 32
	.long 1
	.long 96
	.long 32
	.long 1
	.long 128
	.long 64
	.long 64
	.long 192
	.long 64
	.long 64
	.long 256
	.long 64
	.long 64
	.long 320
	.long 64
	.long 64
	.long 384
	.long 64
	.long 64
	.long 448
	.long 64
	.long 64
	.long 512
	.long 64
	.long 64
	.long 576
	.long 64
	.long 64
	.long 640
	.long 64
	.long 64
	.long 704
	.long 64
	.long 64
	.long 768
	.long 64
	.long 64
	.long 832
	.long 64
	.long 64
	.long 896
	.long 64
	.long 64
	.long 960
	.long 64
	.long 64
	.long 1024
	.long 64
	.long 64
	.long 1088
	.long 64
	.long 64
	.long 1152
	.long 64
	.long 64
	.long 1216
	.long 32
	.long 1
	.long 1280
	.long 4096
	.long 64
	.long 5376
	.long 4096
	.long 64
	.long 9472
	.long 4096
	.long 64
	.long 13568
	.long 4096
	.long 64
	.long 17664
	.long 4096
	.long 64
	.long 21760
	.long 4096
	.long 64
	.long 25856
	.long 4096
	.long 64
	.long 29952
	.long 4096
	.long 64
	.long 34048
	.long 4096
	.long 64
	.long 38144
	.long 64
	.long 64
	.long 38208
	.long 64
	.long 64
	.long 38272
	.long 64
	.long 64
	.long 38336
	.long 64
	.long 64
	.long 38400
	.long 64
	.long 64
	.long 38464
	.long 64
	.long 64
	.section .rdata,"dr"
	.p2align 4
R3DFogBlendFrame.TLD:
	.long 768
	.long 14
	.long 0
	.long 32
	.long 1
	.long 32
	.long 32
	.long 1
	.long 64
	.long 32
	.long 1
	.long 96
	.long 32
	.long 1
	.long 128
	.long 64
	.long 64
	.long 192
	.long 64
	.long 64
	.long 256
	.long 64
	.long 64
	.long 320
	.long 64
	.long 64
	.long 384
	.long 64
	.long 1
	.long 448
	.long 64
	.long 1
	.long 512
	.long 64
	.long 1
	.long 576
	.long 64
	.long 1
	.long 640
	.long 64
	.long 64
	.long 704
	.long 64
	.long 64
	.section .rdata,"dr"
	.p2align 4
R3DCullEntry.TLD:
	.long 1088
	.long 2
	.long 0
	.long 64
	.long 64
	.long 64
	.long 1024
	.long 64
	.section .rdata,"dr"
	.p2align 4
R3DMeshWorkSlice.TLD:
	.long 992
	.long 12
	.long 0
	.long 64
	.long 64
	.long 64
	.long 64
	.long 64
	.long 128
	.long 64
	.long 64
	.long 192
	.long 64
	.long 64
	.long 256
	.long 64
	.long 64
	.long 320
	.long 32
	.long 1
	.long 352
	.long 32
	.long 1
	.long 384
	.long 32
	.long 1
	.long 416
	.long 32
	.long 1
	.long 448
	.long 256
	.long 8
	.long 704
	.long 256
	.long 8
	.long 960
	.long 32
	.long 1
	.section .rdata,"dr"
	.p2align 4
R3DGBufPixel.TLD:
	.long 448
	.long 7
	.long 0
	.long 64
	.long 1
	.long 64
	.long 64
	.long 64
	.long 128
	.long 64
	.long 64
	.long 192
	.long 64
	.long 64
	.long 256
	.long 64
	.long 64
	.long 320
	.long 64
	.long 64
	.long 384
	.long 64
	.long 64
	.section .rdata,"dr"
	.p2align 4
R3DClipVert.TLD:
	.long 832
	.long 13
	.long 0
	.long 64
	.long 64
	.long 64
	.long 64
	.long 64
	.long 128
	.long 64
	.long 64
	.long 192
	.long 64
	.long 64
	.long 256
	.long 64
	.long 64
	.long 320
	.long 64
	.long 64
	.long 384
	.long 64
	.long 64
	.long 448
	.long 64
	.long 64
	.long 512
	.long 64
	.long 64
	.long 576
	.long 64
	.long 64
	.long 640
	.long 64
	.long 64
	.long 704
	.long 64
	.long 64
	.long 768
	.long 64
	.long 64
	.section .rdata,"dr"
	.p2align 4
R3DXVert.TLD:
	.long 640
	.long 10
	.long 0
	.long 64
	.long 64
	.long 64
	.long 64
	.long 64
	.long 128
	.long 64
	.long 64
	.long 192
	.long 64
	.long 64
	.long 256
	.long 64
	.long 64
	.long 320
	.long 64
	.long 64
	.long 384
	.long 64
	.long 64
	.long 448
	.long 64
	.long 64
	.long 512
	.long 64
	.long 64
	.long 576
	.long 64
	.long 64
	.section .rdata,"dr"
	.p2align 4
R3DScene.TLD:
	.long 126464
	.long 55
	.long 0
	.long 64
	.long 64
	.long 64
	.long 64
	.long 64
	.long 128
	.long 64
	.long 64
	.long 192
	.long 32
	.long 1
	.long 256
	.long 64
	.long 64
	.long 320
	.long 32
	.long 1
	.long 384
	.long 64
	.long 64
	.long 448
	.long 32
	.long 1
	.long 512
	.long 64
	.long 64
	.long 576
	.long 64
	.long 64
	.long 640
	.long 64
	.long 64
	.long 704
	.long 64
	.long 64
	.long 768
	.long 64
	.long 64
	.long 832
	.long 32
	.long 1
	.long 896
	.long 64
	.long 64
	.long 960
	.long 64
	.long 64
	.long 1024
	.long 64
	.long 64
	.long 1088
	.long 64
	.long 64
	.long 1152
	.long 64
	.long 64
	.long 1216
	.long 64
	.long 64
	.long 1280
	.long 64
	.long 64
	.long 1344
	.long 64
	.long 64
	.long 1408
	.long 64
	.long 64
	.long 1472
	.long 64
	.long 64
	.long 1536
	.long 64
	.long 64
	.long 1600
	.long 192
	.long 64
	.long 1792
	.long 38528
	.long 64
	.long 40320
	.long 768
	.long 64
	.long 41088
	.long 64
	.long 64
	.long 41152
	.long 64
	.long 64
	.long 41216
	.long 64
	.long 64
	.long 41280
	.long 64
	.long 64
	.long 41344
	.long 32
	.long 1
	.long 41376
	.long 32
	.long 1
	.long 41408
	.long 64
	.long 64
	.long 41472
	.long 32
	.long 1
	.long 41504
	.long 32
	.long 1
	.long 41536
	.long 2048
	.long 1
	.long 43584
	.long 32
	.long 1
	.long 43616
	.long 256
	.long 8
	.long 43872
	.long 32
	.long 1
	.long 43904
	.long 64
	.long 64
	.long 43968
	.long 64
	.long 64
	.long 44032
	.long 64
	.long 64
	.long 44096
	.long 64
	.long 64
	.long 44160
	.long 64
	.long 64
	.long 44224
	.long 64
	.long 64
	.long 44288
	.long 64
	.long 64
	.long 44352
	.long 64
	.long 64
	.long 44416
	.long 32
	.long 1
	.long 44448
	.long 32
	.long 1
	.long 44480
	.long 32
	.long 1
	.long 44512
	.long 6144
	.long 8
	.long 50688
	.long 63488
	.long 64
	.long 114176
	.long 12288
	.long 64
	.bss
	.p2align 3
STDLIB_GVP:
	.zero 8
	.data
	.p2align 3
U64MAXVAL:
	.quad 18446744073709551615
	.data
	.p2align 0
_fltused:
	.byte 1
	.bss
	.p2align 3
nt_threshold:
	.zero 8
	.bss
	.p2align 0
ermsb:
	.zero 1
	.bss
	.p2align 3
WIN_STDOUT_HANDLE:
	.zero 8
	.bss
	.p2align 3
standard__system__cpu__g_l2_bytes:
	.zero 8
	.bss
	.p2align 0
standard__system__cpu__g_ermsb:
	.zero 1
	.bss
	.p2align 0
standard__system__cpu__g_cpuid_run:
	.zero 1
	.bss
	.p2align 3
standard__memory__allocators__stdheap__g_slab_head:
	.zero 8
	.data
	.p2align 3
standard__memory__allocators__stdheap__g_next_slab_size:
	.quad 4194304
	.data
	.p2align 3
standard__memory__allocators__stdheap__g_slab_size_cap:
	.quad 67108864
	.bss
	.p2align 3
standard__memory__allocators__stdheap__g_large_used:
	.zero 8
	.bss
	.p2align 3
standard__memory__allocators__stdheap__g_table:
	.zero 8
	.bss
	.p2align 3
standard__memory__allocators__stdheap__g_table_cap:
	.zero 8
	.bss
	.p2align 3
standard__memory__allocators__stdheap__g_table_count:
	.zero 8
	.bss
	.p2align 3
standard__memory__allocators__stdheap__g_table_slab_cap:
	.zero 8
	.bss
	.p2align 4
standard__memory__allocators__stdheap__g_bins:
	.zero 72
	.bss
	.p2align 2
EC_NONE:
	.zero 4
	.data
	.p2align 2
EC_NULLPTR:
	.long 1
	.data
	.p2align 2
EC_WILDPTR:
	.long 2
	.data
	.p2align 2
EC_PROTFAULT:
	.long 3
	.data
	.p2align 2
EC_STACKOVERFLOW:
	.long 4
	.data
	.p2align 2
EC_ILLEGALINSTR:
	.long 5
	.data
	.p2align 2
EC_DIVBYZERO:
	.long 6
	.data
	.p2align 2
EC_INTOVERFLOW:
	.long 7
	.data
	.p2align 2
EC_ALIGNFAULT:
	.long 8
	.data
	.p2align 2
EC_PRIVINSTR:
	.long 9
	.data
	.p2align 2
WIN_EXCEPTION_ACCESS_VIOLATION:
	.long 3221225477
	.data
	.p2align 2
WIN_EXCEPTION_DATATYPE_MISALIGNMENT:
	.long 2147483650
	.data
	.p2align 2
WIN_EXCEPTION_ILLEGAL_INSTRUCTION:
	.long 3221225501
	.data
	.p2align 2
WIN_EXCEPTION_INT_DIVIDE_BY_ZERO:
	.long 3221225620
	.data
	.p2align 2
WIN_EXCEPTION_INT_OVERFLOW:
	.long 3221225621
	.data
	.p2align 2
WIN_EXCEPTION_PRIV_INSTRUCTION:
	.long 3221225622
	.data
	.p2align 2
WIN_EXCEPTION_STACK_OVERFLOW:
	.long 3221225725
	.data
	.p2align 2
WIN_EXCEPTION_CONTINUE_EXECUTION:
	.long 4294967295
	.bss
	.p2align 2
WIN_EXCEPTION_CONTINUE_SEARCH:
	.zero 4
	.data
	.p2align 2
FEXC_MEM_COMMIT_RESERVE:
	.long 12288
	.data
	.p2align 2
FEXC_PAGE_READWRITE:
	.long 4
	.data
	.p2align 2
FEXC_STACK_GUARANTEE_BYTES:
	.long 65536
	.data
	.p2align 3
FEXC_JMPSTACK_CAPACITY:
	.quad 64
	.bss
	.p2align 3
FEXC_JMPSTACK_BASE:
	.zero 8
	.bss
	.p2align 3
FEXC_JMPSTACK_TOP:
	.zero 8
	.bss
	.p2align 0
FEXC_INITIALIZED:
	.zero 1
	.bss
	.p2align 4
FEXC_PENDING:
	.zero 156
	.bss
	.p2align 4
standard__io__console__out_buf:
	.zero 8192
	.bss
	.p2align 2
standard__io__console__out_len:
	.zero 4
	.data
	.p2align 2
standard__system__windows__WS_VISIBLE:
	.long 268435456
	.data
	.p2align 2
standard__system__windows__WS_OVERLAPPEDWINDOW:
	.long 13565952
	.data
	.p2align 2
standard__system__windows__WS_EX_APPWINDOW:
	.long 262144
	.data
	.p2align 2
standard__system__windows__CS_VREDRAW:
	.long 1
	.data
	.p2align 2
standard__system__windows__CS_HREDRAW:
	.long 2
	.data
	.p2align 2
standard__system__windows__CS_OWNDC:
	.long 32
	.bss
	.p2align 2
standard__system__windows__SW_HIDE:
	.zero 4
	.data
	.p2align 2
standard__system__windows__SW_SHOW:
	.long 5
	.data
	.p2align 2
standard__system__windows__WM_QUIT:
	.long 18
	.data
	.p2align 2
standard__system__windows__PM_REMOVE:
	.long 1
	.data
	.p2align 2
standard__system__windows__BLACK_BRUSH:
	.long 4
	.data
	.p2align 2
standard__system__windows__VK_LEFT:
	.long 37
	.data
	.p2align 2
standard__system__windows__VK_RIGHT:
	.long 39
	.data
	.p2align 2
standard__system__windows__VK_UP:
	.long 38
	.data
	.p2align 2
standard__system__windows__VK_DOWN:
	.long 40
	.bss
	.p2align 3
glCreateShader_fp:
	.zero 8
	.bss
	.p2align 3
glShaderSource_fp:
	.zero 8
	.bss
	.p2align 3
glCompileShader_fp:
	.zero 8
	.bss
	.p2align 3
glCreateProgram_fp:
	.zero 8
	.bss
	.p2align 3
glAttachShader_fp:
	.zero 8
	.bss
	.p2align 3
glLinkProgram_fp:
	.zero 8
	.bss
	.p2align 3
glUseProgram_fp:
	.zero 8
	.bss
	.p2align 3
glGetUniformLocation_fp:
	.zero 8
	.bss
	.p2align 3
glUniform1i_fp:
	.zero 8
	.bss
	.p2align 3
glUniform2f_fp:
	.zero 8
	.bss
	.p2align 3
glActiveTexture_fp:
	.zero 8
	.bss
	.p2align 3
glDeleteShader_fp:
	.zero 8
	.bss
	.p2align 3
glDeleteProgram_fp:
	.zero 8
	.data
	.p2align 2
PFD_DRAW_TO_WINDOW:
	.long 4
	.data
	.p2align 2
PFD_SUPPORT_OPENGL:
	.long 32
	.data
	.p2align 2
PFD_DOUBLEBUFFER:
	.long 1
	.bss
	.p2align 0
PFD_TYPE_RGBA:
	.zero 1
	.bss
	.p2align 0
PFD_MAIN_PLANE:
	.zero 1
	.bss
	.p2align 0
GL_FALSE:
	.zero 1
	.data
	.p2align 0
GL_TRUE:
	.byte 1
	.bss
	.p2align 0
GL_NO_ERROR:
	.zero 1
	.bss
	.p2align 0
GL_INVALID_ENUM:
	.zero 1
	.bss
	.p2align 0
GL_INVALID_VALUE:
	.zero 1
	.bss
	.p2align 0
GL_INVALID_OPERATION:
	.zero 1
	.bss
	.p2align 0
GL_OUT_OF_MEMORY:
	.zero 1
	.bss
	.p2align 2
GL_NO_ERROR_INT:
	.zero 4
	.data
	.p2align 2
GL_INVALID_ENUM_INT:
	.long 1280
	.data
	.p2align 2
GL_INVALID_VALUE_INT:
	.long 1281
	.data
	.p2align 2
GL_INVALID_OPERATION_INT:
	.long 1282
	.data
	.p2align 2
GL_STACK_OVERFLOW_INT:
	.long 1283
	.data
	.p2align 2
GL_STACK_UNDERFLOW_INT:
	.long 1284
	.data
	.p2align 2
GL_OUT_OF_MEMORY_INT:
	.long 1285
	.data
	.p2align 2
GL_COLOR_BUFFER_BIT:
	.long 16384
	.data
	.p2align 2
GL_DEPTH_BUFFER_BIT:
	.long 256
	.data
	.p2align 2
GL_STENCIL_BUFFER_BIT:
	.long 1024
	.data
	.p2align 2
GL_ACCUM_BUFFER_BIT:
	.long 512
	.bss
	.p2align 2
GL_POINTS:
	.zero 4
	.data
	.p2align 2
GL_LINES:
	.long 1
	.data
	.p2align 2
GL_LINE_LOOP:
	.long 2
	.data
	.p2align 2
GL_LINE_STRIP:
	.long 3
	.data
	.p2align 2
GL_TRIANGLES:
	.long 4
	.data
	.p2align 2
GL_TRIANGLE_STRIP:
	.long 5
	.data
	.p2align 2
GL_TRIANGLE_FAN:
	.long 6
	.data
	.p2align 2
GL_QUADS:
	.long 7
	.data
	.p2align 2
GL_QUAD_STRIP:
	.long 8
	.data
	.p2align 2
GL_POLYGON:
	.long 9
	.data
	.p2align 2
GL_BYTE:
	.long 5120
	.data
	.p2align 2
GL_UNSIGNED_BYTE:
	.long 5121
	.data
	.p2align 2
GL_SHORT:
	.long 5122
	.data
	.p2align 2
GL_UNSIGNED_SHORT:
	.long 5123
	.data
	.p2align 2
GL_INT:
	.long 5124
	.data
	.p2align 2
GL_UNSIGNED_INT:
	.long 5125
	.data
	.p2align 2
GL_FLOAT:
	.long 5126
	.data
	.p2align 2
GL_DOUBLE:
	.long 5130
	.data
	.p2align 2
GL_MODELVIEW:
	.long 5888
	.data
	.p2align 2
GL_PROJECTION:
	.long 5889
	.data
	.p2align 2
GL_TEXTURE:
	.long 5890
	.data
	.p2align 2
GL_NEVER:
	.long 512
	.data
	.p2align 2
GL_LESS:
	.long 513
	.data
	.p2align 2
GL_EQUAL:
	.long 514
	.data
	.p2align 2
GL_LEQUAL:
	.long 515
	.data
	.p2align 2
GL_GREATER:
	.long 516
	.data
	.p2align 2
GL_NOTEQUAL:
	.long 517
	.data
	.p2align 2
GL_GEQUAL:
	.long 518
	.data
	.p2align 2
GL_ALWAYS:
	.long 519
	.bss
	.p2align 2
GL_ZERO:
	.zero 4
	.data
	.p2align 2
GL_ONE:
	.long 1
	.data
	.p2align 2
GL_SRC_COLOR:
	.long 768
	.data
	.p2align 2
GL_ONE_MINUS_SRC_COLOR:
	.long 769
	.data
	.p2align 2
GL_SRC_ALPHA:
	.long 770
	.data
	.p2align 2
GL_ONE_MINUS_SRC_ALPHA:
	.long 771
	.data
	.p2align 2
GL_DST_ALPHA:
	.long 772
	.data
	.p2align 2
GL_ONE_MINUS_DST_ALPHA:
	.long 773
	.data
	.p2align 2
GL_DST_COLOR:
	.long 774
	.data
	.p2align 2
GL_ONE_MINUS_DST_COLOR:
	.long 775
	.data
	.p2align 2
GL_DEPTH_TEST:
	.long 2929
	.data
	.p2align 2
GL_BLEND:
	.long 3042
	.data
	.p2align 2
GL_CULL_FACE:
	.long 2884
	.data
	.p2align 2
GL_LIGHTING:
	.long 2896
	.data
	.p2align 2
GL_TEXTURE_2D:
	.long 3553
	.data
	.p2align 2
GL_SCISSOR_TEST:
	.long 3089
	.data
	.p2align 2
GL_LINE_SMOOTH:
	.long 2848
	.data
	.p2align 2
GL_POINT_SMOOTH:
	.long 2832
	.data
	.p2align 2
GL_NORMALIZE:
	.long 2977
	.data
	.p2align 2
GL_FOG:
	.long 2912
	.data
	.p2align 2
GL_STENCIL_TEST:
	.long 2960
	.data
	.p2align 2
GL_ALPHA_TEST:
	.long 3008
	.data
	.p2align 2
GL_COLOR_LOGIC_OP:
	.long 3058
	.data
	.p2align 2
GL_POLYGON_OFFSET_FILL:
	.long 32823
	.data
	.p2align 2
GL_MULTISAMPLE:
	.long 32925
	.data
	.p2align 2
GL_FRONT:
	.long 1028
	.data
	.p2align 2
GL_BACK:
	.long 1029
	.data
	.p2align 2
GL_FRONT_AND_BACK:
	.long 1032
	.data
	.p2align 2
GL_CW:
	.long 2304
	.data
	.p2align 2
GL_CCW:
	.long 2305
	.data
	.p2align 2
GL_POINT:
	.long 6912
	.data
	.p2align 2
GL_LINE:
	.long 6913
	.data
	.p2align 2
GL_FILL:
	.long 6914
	.data
	.p2align 2
GL_FLAT:
	.long 7424
	.data
	.p2align 2
GL_SMOOTH:
	.long 7425
	.data
	.p2align 2
GL_TEXTURE_MAG_FILTER:
	.long 10240
	.data
	.p2align 2
GL_TEXTURE_MIN_FILTER:
	.long 10241
	.data
	.p2align 2
GL_TEXTURE_WRAP_S:
	.long 10242
	.data
	.p2align 2
GL_TEXTURE_WRAP_T:
	.long 10243
	.data
	.p2align 2
GL_NEAREST:
	.long 9728
	.data
	.p2align 2
GL_LINEAR:
	.long 9729
	.data
	.p2align 2
GL_NEAREST_MIPMAP_NEAREST:
	.long 9984
	.data
	.p2align 2
GL_LINEAR_MIPMAP_NEAREST:
	.long 9985
	.data
	.p2align 2
GL_NEAREST_MIPMAP_LINEAR:
	.long 9986
	.data
	.p2align 2
GL_LINEAR_MIPMAP_LINEAR:
	.long 9987
	.data
	.p2align 2
GL_CLAMP:
	.long 10496
	.data
	.p2align 2
GL_REPEAT:
	.long 10497
	.data
	.p2align 2
GL_CLAMP_TO_EDGE:
	.long 33071
	.data
	.p2align 2
GL_RGB:
	.long 6407
	.data
	.p2align 2
GL_RGBA:
	.long 6408
	.data
	.p2align 2
GL_LUMINANCE:
	.long 6409
	.data
	.p2align 2
GL_LUMINANCE_ALPHA:
	.long 6410
	.data
	.p2align 2
GL_DEPTH_COMPONENT:
	.long 6402
	.data
	.p2align 2
GL_ALPHA:
	.long 6406
	.data
	.p2align 2
GL_RGB8:
	.long 32849
	.data
	.p2align 2
GL_RGBA8:
	.long 32856
	.data
	.p2align 2
GL_DEPTH_COMPONENT16:
	.long 33189
	.data
	.p2align 2
GL_DEPTH_COMPONENT24:
	.long 33190
	.data
	.p2align 2
GL_ARRAY_BUFFER:
	.long 34962
	.data
	.p2align 2
GL_ELEMENT_ARRAY_BUFFER:
	.long 34963
	.data
	.p2align 2
GL_UNIFORM_BUFFER:
	.long 35345
	.data
	.p2align 2
GL_STREAM_DRAW:
	.long 35040
	.data
	.p2align 2
GL_STREAM_READ:
	.long 35041
	.data
	.p2align 2
GL_STATIC_DRAW:
	.long 35044
	.data
	.p2align 2
GL_STATIC_READ:
	.long 35045
	.data
	.p2align 2
GL_DYNAMIC_DRAW:
	.long 35048
	.data
	.p2align 2
GL_DYNAMIC_READ:
	.long 35049
	.data
	.p2align 2
GL_FRAGMENT_SHADER:
	.long 35632
	.data
	.p2align 2
GL_VERTEX_SHADER:
	.long 35633
	.data
	.p2align 2
GL_GEOMETRY_SHADER:
	.long 36313
	.data
	.p2align 2
GL_COMPILE_STATUS:
	.long 35713
	.data
	.p2align 2
GL_LINK_STATUS:
	.long 35714
	.data
	.p2align 2
GL_INFO_LOG_LENGTH:
	.long 35716
	.data
	.p2align 2
GL_SHADER_TYPE:
	.long 35663
	.data
	.p2align 2
GL_DELETE_STATUS:
	.long 35712
	.data
	.p2align 2
GL_FRAMEBUFFER:
	.long 36160
	.data
	.p2align 2
GL_RENDERBUFFER:
	.long 36161
	.data
	.p2align 2
GL_COLOR_ATTACHMENT0:
	.long 36064
	.data
	.p2align 2
GL_DEPTH_ATTACHMENT:
	.long 36096
	.data
	.p2align 2
GL_STENCIL_ATTACHMENT:
	.long 36128
	.data
	.p2align 2
GL_FRAMEBUFFER_COMPLETE:
	.long 36053
	.data
	.p2align 2
GL_FRAMEBUFFER_INCOMPLETE_ATTACHMENT:
	.long 36054
	.data
	.p2align 2
GL_FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT:
	.long 36055
	.data
	.p2align 2
GL_FRAMEBUFFER_UNSUPPORTED:
	.long 36061
	.data
	.p2align 2
GL_VENDOR:
	.long 7936
	.data
	.p2align 2
GL_RENDERER:
	.long 7937
	.data
	.p2align 2
GL_VERSION:
	.long 7938
	.data
	.p2align 2
GL_EXTENSIONS:
	.long 7939
	.data
	.p2align 2
GL_TEXTURE0:
	.long 33984
	.data
	.p2align 2
GL_TEXTURE1:
	.long 33985
	.data
	.p2align 2
GL_TEXTURE2:
	.long 33986
	.data
	.p2align 2
GL_TEXTURE3:
	.long 33987
	.data
	.p2align 2
GL_TEXTURE4:
	.long 33988
	.data
	.p2align 2
GL_TEXTURE5:
	.long 33989
	.data
	.p2align 2
GL_TEXTURE6:
	.long 33990
	.data
	.p2align 2
GL_TEXTURE7:
	.long 33991
	.data
	.p2align 2
GL_LIGHT0:
	.long 16384
	.data
	.p2align 2
GL_LIGHT1:
	.long 16385
	.data
	.p2align 2
GL_LIGHT2:
	.long 16386
	.data
	.p2align 2
GL_LIGHT3:
	.long 16387
	.data
	.p2align 2
GL_AMBIENT:
	.long 4608
	.data
	.p2align 2
GL_DIFFUSE:
	.long 4609
	.data
	.p2align 2
GL_SPECULAR:
	.long 4610
	.data
	.p2align 2
GL_POSITION:
	.long 4611
	.data
	.p2align 2
GL_SHININESS:
	.long 5633
	.data
	.p2align 2
GL_EMISSION:
	.long 5632
	.data
	.p2align 2
GL_VIEWPORT:
	.long 2978
	.data
	.p2align 2
GL_MAX_TEXTURE_SIZE:
	.long 3379
	.data
	.p2align 2
GL_MAX_VIEWPORT_DIMS:
	.long 3386
	.bss
	.p2align 3
OpenGL___glGenBuffers:
	.zero 8
	.bss
	.p2align 3
OpenGL___glDeleteBuffers:
	.zero 8
	.bss
	.p2align 3
OpenGL___glBindBuffer:
	.zero 8
	.bss
	.p2align 3
OpenGL___glBufferData:
	.zero 8
	.bss
	.p2align 3
OpenGL___glBufferSubData:
	.zero 8
	.bss
	.p2align 3
OpenGL___glMapBuffer:
	.zero 8
	.bss
	.p2align 3
OpenGL___glUnmapBuffer:
	.zero 8
	.bss
	.p2align 3
OpenGL___glGenVertexArrays:
	.zero 8
	.bss
	.p2align 3
OpenGL___glDeleteVertexArrays:
	.zero 8
	.bss
	.p2align 3
OpenGL___glBindVertexArray:
	.zero 8
	.bss
	.p2align 3
OpenGL___glEnableVertexAttribArray:
	.zero 8
	.bss
	.p2align 3
OpenGL___glDisableVertexAttribArray:
	.zero 8
	.bss
	.p2align 3
OpenGL___glVertexAttribPointer:
	.zero 8
	.bss
	.p2align 3
OpenGL___glCreateShader:
	.zero 8
	.bss
	.p2align 3
OpenGL___glDeleteShader:
	.zero 8
	.bss
	.p2align 3
OpenGL___glShaderSource:
	.zero 8
	.bss
	.p2align 3
OpenGL___glCompileShader:
	.zero 8
	.bss
	.p2align 3
OpenGL___glGetShaderiv:
	.zero 8
	.bss
	.p2align 3
OpenGL___glGetShaderInfoLog:
	.zero 8
	.bss
	.p2align 3
OpenGL___glCreateProgram:
	.zero 8
	.bss
	.p2align 3
OpenGL___glDeleteProgram:
	.zero 8
	.bss
	.p2align 3
OpenGL___glAttachShader:
	.zero 8
	.bss
	.p2align 3
OpenGL___glDetachShader:
	.zero 8
	.bss
	.p2align 3
OpenGL___glLinkProgram:
	.zero 8
	.bss
	.p2align 3
OpenGL___glUseProgram:
	.zero 8
	.bss
	.p2align 3
OpenGL___glGetProgramiv:
	.zero 8
	.bss
	.p2align 3
OpenGL___glGetProgramInfoLog:
	.zero 8
	.bss
	.p2align 3
OpenGL___glBindAttribLocation:
	.zero 8
	.bss
	.p2align 3
OpenGL___glGetUniformLocation:
	.zero 8
	.bss
	.p2align 3
OpenGL___glUniform1i:
	.zero 8
	.bss
	.p2align 3
OpenGL___glUniform1f:
	.zero 8
	.bss
	.p2align 3
OpenGL___glUniform2f:
	.zero 8
	.bss
	.p2align 3
OpenGL___glUniform3f:
	.zero 8
	.bss
	.p2align 3
OpenGL___glUniform4f:
	.zero 8
	.bss
	.p2align 3
OpenGL___glUniform1iv:
	.zero 8
	.bss
	.p2align 3
OpenGL___glUniform2fv:
	.zero 8
	.bss
	.p2align 3
OpenGL___glUniform3fv:
	.zero 8
	.bss
	.p2align 3
OpenGL___glUniform4fv:
	.zero 8
	.bss
	.p2align 3
OpenGL___glUniformMat4fv:
	.zero 8
	.bss
	.p2align 3
OpenGL___glGenFramebuffers:
	.zero 8
	.bss
	.p2align 3
OpenGL___glDeleteFramebuffers:
	.zero 8
	.bss
	.p2align 3
OpenGL___glBindFramebuffer:
	.zero 8
	.bss
	.p2align 3
OpenGL___glFramebufferTexture2D:
	.zero 8
	.bss
	.p2align 3
OpenGL___glCheckFramebufferStatus:
	.zero 8
	.bss
	.p2align 3
OpenGL___glGenRenderbuffers:
	.zero 8
	.bss
	.p2align 3
OpenGL___glDeleteRenderbuffers:
	.zero 8
	.bss
	.p2align 3
OpenGL___glBindRenderbuffer:
	.zero 8
	.bss
	.p2align 3
OpenGL___glRenderbufferStorage:
	.zero 8
	.bss
	.p2align 3
OpenGL___glFramebufferRenderbuffer:
	.zero 8
	.bss
	.p2align 3
OpenGL___glGenerateMipmap:
	.zero 8
	.bss
	.p2align 3
OpenGL___glActiveTexture:
	.zero 8
	.bss
	.p2align 3
OpenGL___glDrawArrays:
	.zero 8
	.bss
	.p2align 3
OpenGL___glDrawElements:
	.zero 8
	.bss
	.p2align 3
OpenGL___glDrawArraysInstanced:
	.zero 8
	.bss
	.p2align 3
OpenGL___glDrawElementsInstanced:
	.zero 8
	.bss
	.p2align 2
ATOMIC_RELAXED:
	.zero 4
	.data
	.p2align 2
ATOMIC_ACQUIRE:
	.long 2
	.data
	.p2align 2
ATOMIC_RELEASE:
	.long 3
	.data
	.p2align 2
ATOMIC_ACQ_REL:
	.long 4
	.data
	.p2align 2
ATOMIC_SEQ_CST:
	.long 5
	.data
	.p2align 2
WIN32_INFINITE:
	.long 4294967295
	.data
	.p2align 2
THREAD_OPAQUE_BYTES:
	.long 8
	.data
	.p2align 2
MUTEX_OPAQUE_BYTES:
	.long 64
	.data
	.p2align 2
RWLOCK_OPAQUE_BYTES:
	.long 64
	.data
	.p2align 2
COND_OPAQUE_BYTES:
	.long 64
	.data
	.p2align 2
SEM_OPAQUE_BYTES:
	.long 32
	.data
	.p2align 2
TLS_KEY_OPAQUE_BYTES:
	.long 8
	.bss
	.p2align 2
THREAD_OK:
	.zero 4
	.data
	.p2align 2
THREAD_ERROR:
	.long 4294967295
	.data
	.p2align 2
THREAD_TIMEOUT:
	.long 4294967294
	.data
	.p2align 2
WIN_W:
	.long 1024
	.data
	.p2align 2
WIN_H:
	.long 768
	.data
	.p2align 2
NUM_CUBES:
	.long 300
	.data
	.p2align 2
VK_W:
	.long 87
	.data
	.p2align 2
VK_S:
	.long 83
	.data
	.p2align 2
VK_A:
	.long 65
	.data
	.p2align 2
VK_D:
	.long 68
	.data
	.p2align 2
VK_Q:
	.long 81
	.data
	.p2align 2
VK_E:
	.long 69
	.data
	.p2align 2
VK_R:
	.long 82
	.data
	.p2align 2
VK_V:
	.long 86
	.data
	.p2align 2
VK_F:
	.long 70
	.data
	.p2align 2
VK_L:
	.long 76
	.section .rdata,"dr"
	.p2align 4
.LZERO:
	.zero 15808
