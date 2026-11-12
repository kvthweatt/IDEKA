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
.LB10615:
	testq %rdx, %rdx
	je .LB10617
.LB10616:
	movb %al, (%rcx,%rsi,1)
	movb %al, 1(%rcx,%rsi,1)
	movb %al, 2(%rcx,%rsi,1)
	movb %al, 3(%rcx,%rsi,1)
	addq $4, %rsi
	decq %rdx
	jne .LB10616
.LB10617:
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
.LB10618:
	testq %rax, %rax
	je .LB10620
.LB10619:
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
	jne .LB10619
.LB10620:
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
	.globl standard__memory__allocators__stdheap__heap_os_alloc__1__dataE1_ubits64__ret_dataE1_ubits64
	.def standard__memory__allocators__stdheap__heap_os_alloc__1__dataE1_ubits64__ret_dataE1_ubits64;
	.scl 2;
	.type 32;
	.endef
standard__memory__allocators__stdheap__heap_os_alloc__1__dataE1_ubits64__ret_dataE1_ubits64:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB85:
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
.LB90:
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
.LB96:
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
.LB102:
	cmpq $8, %rcx
	ja .LB108
.LB109:
	movl $16, %eax
	shlx %rcx, %rax, %rax
	ret
.LB108:
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
.LB114:
	cmpq $8, %rcx
	ja .LB121
.LB122:
	leaq standard__memory__allocators__stdheap__g_bins(%rip), %rax
	movslq %ecx, %rsi
	movq (%rax,%rsi,8), %rax
	movq %rax, (%rdx)
	leaq standard__memory__allocators__stdheap__g_bins(%rip), %rax
	movq %rdx, (%rax,%rcx,8)
	movq 0(%rsp), %rsi
	addq $16, %rsp
	ret
.LB121:
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
.LB133:
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
.LB152:
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
.LB163:
	movslq %edi, %rbx
	shlq $5, %rbx
	leaq (%rcx,%rbx,1), %rbx
	cmpq $0, (%rbx)
	je .LB165
.LB164:
	incq %rdi
	andq %rdx, %rdi
	jmp .LB163
.LB165:
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
.LB214:
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
	je .LB230
.LB231:
	movq $0, standard__memory__allocators__stdheap__g_table_count(%rip)
	xorl %ebx, %ebx
.LB237:
	movq standard__memory__allocators__stdheap__g_table_cap(%rip), %rax
	cmpq %rax, %rbx
	jae .LB239
.LB238:
	movq standard__memory__allocators__stdheap__g_table(%rip), %rax
	movslq %ebx, %rcx
	shlq $5, %rcx
	leaq (%rax,%rcx,1), %rax
	movq (%rax), %r8
	testq %r8, %r8
	jne .LB256
.LB255:
	incq %rbx
	jmp .LB237
.LB239:
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
.LB319:
	movl -128(%rbp), %r13d
	movslq %r13d, %r14
	shlq $5, %r14
	movq (%rdi,%r14,1), %r14
	testq %r14, %r14
	je .LB321
.LB320:
	movq -120(%rbp), %r15
	cmpq %r15, %r14
	je .LB348
.LB349:
	movq -64(%rbp), %r13
	movq -72(%rbp), %r10
	movq %r10, -96(%rbp)
	movq -80(%rbp), %r10
	movq %r10, -104(%rbp)
.LB347:
	testb %r9b, %r9b
	jne .LB321
.LB519:
	movq -128(%rbp), %r14
	incq %r14
	andq %rcx, %r14
	movq %r14, -128(%rbp)
	movq %r13, -64(%rbp)
	movq -96(%rbp), %r10
	movq %r10, -72(%rbp)
	movq -104(%rbp), %r10
	movq %r10, -80(%rbp)
	jmp .LB319
.LB348:
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
.LB367:
	movslq %edx, %r14
	shlq $5, %r14
	movq (%rdi,%r14,1), %r14
	testq %r14, %r14
	je .LB369
.LB368:
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
	jb .LB399
.LB400:
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
.LB398:
	testb %r12b, %r12b
	jne .LB435
.LB436:
.LB434:
	incq %rdx
	andq %rcx, %rdx
	movq %r14, %r13
	movq %r8, -112(%rbp)
	movq %r9, %r8
	movq %rsi, %r9
	movq %rbx, %r11
	movq %r12, %rbx
	movq %r11, %r12
	jmp .LB367
.LB369:
	movq %r9, -96(%rbp)
	movq -112(%rbp), %r10
	movq %r10, -104(%rbp)
	movl $1, %r9d
	testb %r9b, %r9b
	je .LB519
.LB321:
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
.LB399:
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
	je .LB436
.LB435:
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
	jmp .LB434
.LB256:
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
	jmp .LB255
.LB230:
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
.LB544:
	xorl %ecx, %ecx
	movl $32768, %edx
	movl $12288, %r8d
	movl $4, %r9d
	callq VirtualAlloc
	movq %rax, %rsi
	testq %rsi, %rsi
	je .LB558
.LB559:
	movq %rsi, %rdi
	movl $32768, %ecx
	xorl %eax, %eax
	rep stosb
.LB566:
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
.LB558:
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
.LB590:
	movq standard__memory__allocators__stdheap__g_table(%rip), %rax
	movq %rcx, %rsi
	movq %rdx, %rdi
	movq %r8, %rbx
	movq %r9, %r12
	testq %rax, %rax
	je .LB603
.LB602:
	movq standard__memory__allocators__stdheap__g_table_count(%rip), %rax
	movq standard__memory__allocators__stdheap__g_table_cap(%rip), %rcx
	shlq $1, %rax
	cmpq %rcx, %rax
	jae .LB616
.LB615:
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
.LB603:
	callq standard__memory__allocators__stdheap__table_init__0__ret_boolE1
	testb %al, %al
	je .LB608
	jmp .LB602
.LB616:
	callq standard__memory__allocators__stdheap__table_grow__0__ret_boolE1
	testb %al, %al
	jne .LB615
.LB621:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB608:
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
.LB632:
	movq standard__memory__allocators__stdheap__g_table(%rip), %rax
	testq %rax, %rax
	je .LB642
.LB643:
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
.LB650:
	movslq %esi, %rdi
	shlq $5, %rdi
	movq (%rax,%rdi,1), %rdi
	testq %rdi, %rdi
	je .LB652
.LB651:
	cmpq %rcx, %rdi
	je .LB679
.LB680:
	incq %rsi
	andq %rdx, %rsi
	jmp .LB650
.LB652:
	xorl %eax, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB679:
	shlq $5, %rsi
	leaq (%rax,%rsi,1), %rax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB642:
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
.LB693:
	movq standard__memory__allocators__stdheap__g_table(%rip), %rax
	testq %rax, %rax
	je .LB703
.LB704:
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
.LB714:
	movslq %esi, %rdi
	shlq $5, %rdi
	movq (%rax,%rdi,1), %rdi
	testq %rdi, %rdi
	je .LB716
.LB715:
	cmpq %rcx, %rdi
	je .LB742
.LB743:
	incq %rsi
	andq %rdx, %rsi
	jmp .LB714
.LB716:
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB742:
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
.LB761:
	movq standard__memory__allocators__stdheap__g_table(%rip), %rcx
	movslq %eax, %rdx
	shlq $5, %rdx
	movq (%rcx,%rdx,1), %rdx
	testq %rdx, %rdx
	je .LB763
.LB762:
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
	jb .LB792
.LB793:
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
.LB791:
	testb %dl, %dl
	jne .LB828
.LB829:
.LB827:
	incq %rax
	movq standard__memory__allocators__stdheap__g_table_cap(%rip), %rcx
	decq %rcx
	andq %rcx, %rax
	jmp .LB761
.LB763:
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB792:
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
	je .LB829
.LB828:
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
	jmp .LB827
.LB703:
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
.LB916:
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
	je .LB943
.LB944:
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
.LB943:
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
.LB982:
	movq standard__memory__allocators__stdheap__g_slab_head(%rip), %rax
	testq %rax, %rax
	je .LB997
.LB998:
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
.LB997:
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
.LB1043:
	movq %rcx, %rsi
	xorl %ecx, %ecx
	movq %rsi, %rdx
	movl $12288, %r8d
	movl $4, %r9d
	callq VirtualAlloc
	movq %rax, %rdi
	testq %rdi, %rdi
	je .LB1052
.LB1053:
	movq %rdi, %rcx
	movq %rsi, %rdx
	movl $1, %r8d
	movq %rsi, %r9
	callq standard__memory__allocators__stdheap__table_insert__4__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__ret_boolE1
	testb %al, %al
	je .LB1062
.LB1063:
	movq standard__memory__allocators__stdheap__g_large_used(%rip), %rax
	incq %rax
	movq %rax, standard__memory__allocators__stdheap__g_large_used(%rip)
	movq %rdi, %rax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB1062:
	movq %rdi, %rcx
	xorl %edx, %edx
	movl $32768, %r8d
	callq VirtualFree
	xorl %eax, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB1052:
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
.LB1070:
	testq %rcx, %rcx
	je .LB1076
.LB1077:
	cmpq $4096, %rcx
	ja .LB1083
.LB1084:
	decq %rcx
	movq %rcx, %rax
	orq $15, %rax
	bsrq %rax, %rax
	leaq -3(%rax), %rsi
	leaq standard__memory__allocators__stdheap__g_bins(%rip), %rax
	movslq %esi, %rcx
	movq (%rax,%rcx,8), %rax
	testq %rax, %rax
	jne .LB1106
.LB1107:
	movl $16, %eax
	shlx %rsi, %rax, %rax
	movl $4096, %ecx
	cmpq $8, %rsi
	movq %rax, %rdi
	cmova %rcx, %rdi
	movq standard__memory__allocators__stdheap__g_slab_head(%rip), %rax
	testq %rax, %rax
	je .LB10385
.LB10386:
	movq 16(%rax), %rcx
	movq 8(%rax), %r8
	movq (%rax), %r9
	leaq (%rcx,%rdi), %rdx
	leaq (%r9,%rcx,1), %rcx
	movq %rdx, 16(%rax)
	xorl %eax, %eax
	cmpq %r8, %rdx
	cmovbe %rcx, %rax
.LB10382:
	testq %rax, %rax
	je .LB1127
.LB1128:
	movq %rax, %rdi
.LB1126:
	movq standard__memory__allocators__stdheap__g_slab_head(%rip), %rax
	movq %rax, %r9
	movq %rdi, %rcx
	movq %rsi, %rdx
	xorl %r8d, %r8d
	callq standard__memory__allocators__stdheap__table_insert__4__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__ret_boolE1
	testb %al, %al
	je .LB1158
.LB1159:
	movq standard__memory__allocators__stdheap__g_slab_head(%rip), %rax
	movq 24(%rax), %rcx
	incq %rcx
	movq %rcx, 24(%rax)
	movq %rdi, %rax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB10385:
	xorl %eax, %eax
	testq %rax, %rax
	jne .LB1128
.LB1127:
	movq %rdi, %rcx
	callq standard__memory__allocators__stdheap__heap_new_slab__1__dataE1_ubits64__ret_SlabE1_ptr1
	testq %rax, %rax
	je .LB1137
.LB1138:
	movq standard__memory__allocators__stdheap__g_slab_head(%rip), %rax
	testq %rax, %rax
	je .LB10380
.LB10381:
	movq 16(%rax), %rcx
	leaq (%rcx,%rdi), %rdx
	movq 8(%rax), %rdi
	movq (%rax), %r8
	leaq (%r8,%rcx,1), %rcx
	movq %rdx, 16(%rax)
	xorl %eax, %eax
	cmpq %rdi, %rdx
	cmovbe %rcx, %rax
.LB10377:
	testq %rax, %rax
	je .LB1146
.LB1147:
	movq %rax, %rdi
	jmp .LB1126
.LB10380:
	xorl %eax, %eax
	testq %rax, %rax
	je .LB1146
	jmp .LB1147
.LB1158:
	xorl %eax, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB1146:
	xorl %eax, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB1137:
	xorl %eax, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB1106:
	leaq standard__memory__allocators__stdheap__g_bins(%rip), %rdx
	movq (%rax), %rcx
	movq %rcx, (%rdx,%rsi,8)
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB1083:
	callq standard__memory__allocators__stdheap__fmalloc_large__1__dataE1_ubits64__ret_dataE1_ubits64
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB1076:
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
.LB1170:
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
.LB1174:
	movq %rcx, %rsi
	testq %rsi, %rsi
	je .LB1180
.LB1181:
	movq standard__memory__allocators__stdheap__g_table(%rip), %rax
	testq %rax, %rax
	je .LB10390
.LB10391:
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
.LB10392:
	movslq %edx, %rdi
	shlq $5, %rdi
	movq (%rax,%rdi,1), %rdi
	testq %rdi, %rdi
	je .LB10394
.LB10393:
	cmpq %rsi, %rdi
	je .LB10396
.LB10397:
	incq %rdx
	andq %rcx, %rdx
	jmp .LB10392
.LB10394:
	xorl %eax, %eax
.LB10387:
	testq %rax, %rax
	je .LB1193
.LB1194:
	movq 8(%rax), %rcx
	cmpq $1, 16(%rax)
	je .LB1214
.LB1215:
	movq $3, 16(%rax)
	cmpq $8, %rcx
	ja .LB10403
.LB10404:
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
.LB10396:
	shlq $5, %rdx
	leaq (%rax,%rdx,1), %rax
	jmp .LB10387
.LB10390:
	xorl %eax, %eax
	jmp .LB10387
.LB10403:
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB1214:
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
.LB1193:
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB1180:
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
.LB1227:
	movq %rcx, %rax
	movq %rax, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	leave
	ret
	.text
	.globl standard__strings__helpers__is_whitespace__1__charE1__ret_boolE1
	.def standard__strings__helpers__is_whitespace__1__charE1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__strings__helpers__is_whitespace__1__charE1__ret_boolE1:
.LB1231:
	cmpb $32, %cl
	jne .LB1235
.LB10621:
	movl $1, %eax
	ret
.LB1235:
	cmpb $9, %cl
	jne .LB1240
.LB10622:
	movl $1, %eax
	ret
.LB1240:
	cmpb $10, %cl
	jne .LB1245
.LB10623:
	movl $1, %eax
	ret
.LB1245:
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
.LB1250:
	cmpb $48, %cl
	jge .LB1254
.LB10624:
	xorl %eax, %eax
	ret
.LB1254:
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
.LB1259:
	cmpb $97, %cl
	jl .LB1268
.LB1263:
	cmpb $122, %cl
	jg .LB1268
.LB10625:
	movl $1, %eax
	ret
.LB1268:
	cmpb $65, %cl
	jge .LB1272
.LB10626:
	xorl %eax, %eax
	ret
.LB1272:
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
.LB1278:
	cmpb $65, %cl
	jge .LB1282
.LB10627:
	xorl %eax, %eax
	ret
.LB1282:
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
.LB1287:
	cmpb $97, %cl
	jge .LB1291
.LB10628:
	xorl %eax, %eax
	ret
.LB1291:
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
.LB1296:
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
.LB1305:
	cmpb $65, %cl
	jl .LB1315
.LB1309:
	cmpb $90, %cl
	jle .LB1314
.LB1315:
	movzbl %cl, %eax
	ret
.LB1314:
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
.LB1322:
	cmpb $97, %cl
	jl .LB1332
.LB1326:
	cmpb $122, %cl
	jle .LB1331
.LB1332:
	movzbl %cl, %eax
	ret
.LB1331:
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
.LB1339:
	movl %r8d, %eax
.LB1343:
	movslq %eax, %rsi
	movzbl (%rcx,%rsi,1), %esi
	testb %sil, %sil
	je .LB1346
.LB1344:
	cmpb %dl, %sil
	je .LB1361
.LB1362:
	incl %eax
	jmp .LB1343
.LB1346:
	movabsq $4294967295, %rax
	movq 0(%rsp), %rsi
	addq $16, %rsp
	ret
.LB1361:
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
.LB1368:
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
	jne .LS10630f
.LS10630l:
	addq $32, %rdx
	vpcmpeqb (%rdx), %ymm15, %ymm0
	vpmovmskb %ymm0, %r9d
	testl %r9d, %r9d
	je .LS10630l
	tzcntl %r9d, %r9d
	addq %rdx, %r9
	subq %rax, %r9
	jmp .LS10630d
.LS10630f:
	tzcntl %r9d, %r9d
.LS10630d:
	vzeroupper
.LB1377:
	xorl %eax, %eax
.LB1386:
	movslq %eax, %rcx
	cmpb $0, (%rdi,%rcx,1)
	je .LB1388
.LB1387:
	incl %eax
	jmp .LB1386
.LB1388:
	testl %eax, %eax
	je .LB1399
.LB1400:
	subl %eax, %r9d
.LB1403:
	cmpl %r9d, %r8d
	jg .LB1406
.LB1404:
	xorl %ecx, %ecx
.LB1414:
	cmpl %eax, %ecx
	jl .LB1415
.LB10629:
	movl $1, %ecx
.LB1417:
	testb %cl, %cl
	jne .LB1439
.LB1440:
	incl %r8d
	cmpl %r9d, %r8d
	jle .LB1404
.LB1406:
	movabsq $4294967295, %rax
	movq 16(%rsp), %rbx
	movq 8(%rsp), %rsi
	movq 0(%rsp), %rdi
	addq $32, %rsp
	ret
.LB1415:
	leal (%r8,%rcx), %edx
	movslq %ecx, %rbx
	movslq %edx, %rdx
	movzbl (%rsi,%rdx,1), %edx
	movzbl (%rdi,%rbx,1), %ebx
	cmpb %bl, %dl
	jne .LB1433
.LB1434:
	incl %ecx
	cmpl %eax, %ecx
	jl .LB1415
	jmp .LB10629
.LB1433:
	xorl %ecx, %ecx
	testb %cl, %cl
	je .LB1440
.LB1439:
	movl %r8d, %eax
	movq 16(%rsp), %rbx
	movq 8(%rsp), %rsi
	movq 0(%rsp), %rdi
	addq $32, %rsp
	ret
.LB1399:
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
.LB1446:
	movq %rcx, %rsi
	movq %rdx, %rdi
	xorl %ebx, %ebx
.LB1452:
	movslq %ebx, %rax
	cmpb $0, (%rsi,%rax,1)
	je .LB1454
.LB1461:
	cmpb $0, (%rdi,%rax,1)
	je .LB1454
.LB1453:
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
	jne .LB1483
.LB1484:
	incl %ebx
	jmp .LB1452
.LB1454:
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
.LB1483:
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
.LB1504:
	xorl %eax, %eax
.LB1508:
	movslq %eax, %rsi
	movzbl (%rdx,%rsi,1), %esi
	testb %sil, %sil
	je .LB1510
.LB1509:
	movslq %eax, %rdi
	movzbl (%rcx,%rdi,1), %edi
	cmpb %sil, %dil
	jne .LB1526
.LB1527:
	incl %eax
	jmp .LB1508
.LB1510:
	movl $1, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB1526:
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
.LB1531:
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
	jne .LS10631f
.LS10631l:
	addq $32, %rdx
	vpcmpeqb (%rdx), %ymm15, %ymm0
	vpmovmskb %ymm0, %r8d
	testl %r8d, %r8d
	je .LS10631l
	tzcntl %r8d, %r8d
	addq %rdx, %r8
	subq %rax, %r8
	jmp .LS10631d
.LS10631f:
	tzcntl %r8d, %r8d
.LS10631d:
	vzeroupper
.LB1538:
	xorl %eax, %eax
.LB1547:
	movslq %eax, %rcx
	cmpb $0, (%rdi,%rcx,1)
	je .LB1549
.LB1548:
	incl %eax
	jmp .LB1547
.LB1549:
	cmpl %r8d, %eax
	jg .LB1561
.LB1562:
	subl %eax, %r8d
	xorl %ecx, %ecx
.LB1568:
	cmpl %eax, %ecx
	jge .LB1571
.LB1569:
	leal (%r8,%rcx), %edx
	movslq %ecx, %r9
	movslq %edx, %rdx
	movzbl (%rsi,%rdx,1), %edx
	movzbl (%rdi,%r9,1), %r9d
	cmpb %r9b, %dl
	jne .LB1587
.LB1588:
	incl %ecx
	cmpl %eax, %ecx
	jl .LB1569
.LB1571:
	movl $1, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB1587:
	xorl %eax, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB1561:
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
.LB1592:
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
	jne .LS10634f
.LS10634l:
	addq $32, %rdx
	vpcmpeqb (%rdx), %ymm15, %ymm0
	vpmovmskb %ymm0, %edi
	testl %edi, %edi
	je .LS10634l
	tzcntl %edi, %edi
	addq %rdx, %rdi
	subq %rax, %rdi
	jmp .LS10634d
.LS10634f:
	tzcntl %edi, %edi
.LS10634d:
	vzeroupper
.LB1597:
	leaq 1(%rdi), %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	testq %rax, %rax
	je .LB1617
.LB1618:
	movslq %edi, %rcx
	incq %rcx
	cmpq $32, %rcx
	jge .LB10632
.LB10633:
	xorl %ecx, %ecx
.LB1622:
	cmpl %edi, %ecx
	jg .LB1625
.LB1623:
	movslq %ecx, %rdx
	movzbl (%rsi,%rdx,1), %r8d
	movb %r8b, (%rax,%rdx,1)
	incl %ecx
	cmpl %edi, %ecx
	jle .LB1623
	jmp .LB1625
.LB10632:
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
.LB1625:
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB1617:
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
.LB1640:
	movq %rcx, %rsi
	movl %edx, %edi
	leaq 1(%rdi), %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	testq %rax, %rax
	je .LB1654
.LB1655:
	movslq %edi, %rcx
	xorl %edx, %edx
.LB1659:
	cmpq %rcx, %rdx
	jge .LB1662
.LB1667:
	movzbl (%rsi,%rdx,1), %r8d
	testb %r8b, %r8b
	je .LB1662
.LB1660:
	movb %r8b, (%rax,%rdx,1)
	incq %rdx
	cmpq %rcx, %rdx
	jl .LB1667
.LB1662:
	movslq %edi, %rcx
	movb $0, (%rax,%rcx,1)
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB1654:
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
.LB1690:
	movq %rcx, %rsi
	movl %edx, %edi
	movl %r8d, %ebx
	leaq 1(%rbx), %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	testq %rax, %rax
	je .LB1705
.LB1706:
	xorl %ecx, %ecx
.LB1710:
	cmpl %ebx, %ecx
	jge .LB1713
.LB1718:
	leal (%rdi,%rcx), %edx
	movslq %edx, %rdx
	cmpb $0, (%rsi,%rdx,1)
	je .LB1713
.LB1711:
	leal (%rdi,%rcx), %edx
	movslq %edx, %rdx
	movzbl (%rsi,%rdx,1), %edx
	movslq %ecx, %r8
	movb %dl, (%rax,%r8,1)
	incl %ecx
	cmpl %ebx, %ecx
	jl .LB1718
.LB1713:
	movslq %ebx, %rcx
	movb $0, (%rax,%rcx,1)
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB1705:
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
.LB1745:
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
	jne .LS10643f
.LS10643l:
	addq $32, %rdx
	vpcmpeqb (%rdx), %ymm15, %ymm0
	vpmovmskb %ymm0, %edi
	testl %edi, %edi
	je .LS10643l
	tzcntl %edi, %edi
	addq %rdx, %rdi
	subq %rax, %rdi
	jmp .LS10643d
.LS10643f:
	tzcntl %edi, %edi
.LS10643d:
	vzeroupper
	movl %edi, %r12d
.LB1751:
	xorl %r13d, %r13d
.LB1761:
	movslq %r13d, %rax
	cmpb $0, (%rbx,%rax,1)
	je .LB1763
.LB1762:
	incl %r13d
	jmp .LB1761
.LB1763:
	leaq (%r12,%r13), %rax
	leaq 1(%rax), %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	testq %rax, %rax
	je .LB1786
.LB1787:
	cmpl $32, %r12d
	jge .LB10635
.LB10636:
	movslq %r12d, %rcx
	xorl %edx, %edx
	testq %rcx, %rcx
	cmovg %rcx, %rdx
	shrq $2, %rdx
	xorl %edi, %edi
.LB10637:
	testq %rdx, %rdx
	je .LB10639
.LB10638:
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
	jne .LB10638
.LB10639:
.LB1791:
	cmpq %rcx, %rdi
	jge .LB1794
.LB1792:
	movzbl (%rsi,%rdi,1), %edx
	movb %dl, (%rax,%rdi,1)
	incq %rdi
	cmpq %rcx, %rdi
	jl .LB1792
	jmp .LB1794
.LB10635:
	movslq %r12d, %rcx
	movq %rcx, %rdx
	sarq $63, %rdx
	notq %rdx
	andq %rdx, %rcx
	movq %rax, %rdi
	rep movsb
.LB1794:
	xorl %ecx, %ecx
	testl %r13d, %r13d
	cmovg %r13d, %ecx
	shrl $2, %ecx
	xorl %edx, %edx
.LB10640:
	testl %ecx, %ecx
	je .LB10642
.LB10641:
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
	jne .LB10641
.LB10642:
.LB1808:
	cmpl %r13d, %edx
	jge .LB1811
.LB1809:
	movslq %edx, %rcx
	movzbl (%rbx,%rcx,1), %ecx
	leal (%r12,%rdx), %esi
	movslq %esi, %rsi
	movb %cl, (%rax,%rsi,1)
	incl %edx
	cmpl %r13d, %edx
	jl .LB1809
.LB1811:
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
.LB1786:
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
.LB1834:
	movq %rcx, %rax
	xorl %ecx, %ecx
.LB1838:
	leaq 1(%rax), %rdx
	cmpb $0, (%rax)
	je .LB1845
.LB1846:
	incl %ecx
	movq %rdx, %rax
	jmp .LB1838
.LB1845:
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
.LB1850:
	testw %cx, %cx
	je .LB1856
.LB1857:
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
.LB1878:
	testw %cx, %cx
	jle .LB1880
.LB1879:
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
	jg .LB1879
.LB1880:
	testb %al, %al
	jne .LB1900
.LB1901:
	xorl %eax, %eax
.LB1902:
	leal -1(%rsi), %ecx
.LB1911:
	testw %cx, %cx
	js .LB1913
.LB1912:
	movswl %cx, %esi
	movslq %esi, %rsi
	movzbl (%rsp,%rsi,1), %esi
	movswq %ax, %rdi
	movb %sil, (%rdx,%rdi,1)
	incl %eax
	decl %ecx
	testw %cx, %cx
	jns .LB1912
	jmp .LB1913
.LB1900:
	movb $45, (%rdx)
	movl $1, %eax
	jmp .LB1902
.LB1913:
	movswq %ax, %rcx
	movzwl %ax, %eax
	movb $0, (%rdx,%rcx,1)
	movq 16(%rsp), %rsi
	movq 8(%rsp), %rdi
	addq $32, %rsp
	ret
.LB1856:
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
.LB1933:
	testl %ecx, %ecx
	je .LB1938
.LB1939:
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
.LB1957:
	testl %ecx, %ecx
	jle .LB1959
.LB1958:
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
	jg .LB1958
.LB1959:
	cmpl $1, %edi
	je .LB1975
.LB1976:
	xorl %ecx, %ecx
.LB1977:
	decl %eax
.LB1984:
	testl %eax, %eax
	js .LB1986
.LB1985:
	movslq %eax, %rsi
	movzbl -8(%rsp,%rsi,1), %esi
	movslq %ecx, %rdi
	movb %sil, (%rdx,%rdi,1)
	incl %ecx
	decl %eax
	jns .LB1985
	jmp .LB1986
.LB1975:
	movb $45, (%rdx)
	movl $1, %ecx
	jmp .LB1977
.LB1986:
	movslq %ecx, %rax
	movb $0, (%rdx,%rax,1)
	movl %ecx, %eax
	movq 32(%rsp), %rsi
	movq 24(%rsp), %rdi
	addq $48, %rsp
	ret
.LB1938:
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
.LB2004:
	movq %rdx, %rsi
	testq %rcx, %rcx
	je .LB2010
.LB2011:
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
.LB2034:
	testq %rcx, %rcx
	jle .LB2036
.LB2035:
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
	jg .LB2035
.LB2036:
	cmpq $1, %rdi
	je .LB2058
.LB2059:
	xorl %eax, %eax
.LB2060:
	leaq -1(%r8), %rcx
.LB2069:
	testq %rcx, %rcx
	js .LB2071
.LB2070:
	movslq %ecx, %rdx
	movzbl -8(%rsp,%rdx,1), %edx
	movb %dl, (%rsi,%rax,1)
	incq %rax
	decq %rcx
	jns .LB2070
	jmp .LB2071
.LB2058:
	movb $45, (%rsi)
	movl $1, %eax
	jmp .LB2060
.LB2071:
	movb $0, (%rsi,%rax,1)
	movq 32(%rsp), %rsi
	movq 24(%rsp), %rdi
	addq $48, %rsp
	ret
.LB2010:
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
.LB2091:
	testw %cx, %cx
	je .LB2097
.LB2098:
	movq .LZERO(%rip), %r10
	movq %r10, (%rsp)
	xorl %eax, %eax
.LB2110:
	testw %cx, %cx
	jbe .LB2112
.LB2111:
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
	ja .LB2111
.LB2112:
	movq %rax, %rcx
	xorl %eax, %eax
.LB2133:
	testw %cx, %cx
	jbe .LB2135
.LB2134:
	decl %ecx
	movswl %cx, %esi
	movslq %esi, %rsi
	movzbl (%rsp,%rsi,1), %esi
	movswq %ax, %rdi
	movb %sil, (%rdx,%rdi,1)
	incl %eax
	testw %cx, %cx
	ja .LB2134
.LB2135:
	movswq %ax, %rcx
	movzwl %ax, %eax
	movb $0, (%rdx,%rcx,1)
	movq 16(%rsp), %rsi
	movq 8(%rsp), %rdi
	addq $32, %rsp
	ret
.LB2097:
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
.LB2155:
	testl %ecx, %ecx
	je .LB2160
.LB2161:
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -8(%rsp)
	vzeroupper
	xorl %eax, %eax
.LB2171:
	testl %ecx, %ecx
	jbe .LB2173
.LB2172:
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
	ja .LB2172
.LB2173:
	movq %rax, %rcx
	xorl %eax, %eax
.LB2189:
	testl %ecx, %ecx
	jbe .LB2191
.LB2190:
	decl %ecx
	movslq %ecx, %rsi
	movzbl -8(%rsp,%rsi,1), %esi
	movslq %eax, %rdi
	movb %sil, (%rdx,%rdi,1)
	incl %eax
	testl %ecx, %ecx
	ja .LB2190
.LB2191:
	movslq %eax, %rcx
	movb $0, (%rdx,%rcx,1)
	movq 32(%rsp), %rsi
	movq 24(%rsp), %rdi
	addq $48, %rsp
	ret
.LB2160:
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
.LB2209:
	movq %rdx, %rsi
	testq %rcx, %rcx
	je .LB2215
.LB2216:
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -8(%rsp)
	vzeroupper
	xorl %edi, %edi
.LB2228:
	testq %rcx, %rcx
	je .LB2230
.LB2229:
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
	jne .LB2229
.LB2230:
	xorl %eax, %eax
.LB2251:
	testq %rdi, %rdi
	je .LB2253
.LB2252:
	decq %rdi
	movslq %edi, %rcx
	movzbl -8(%rsp,%rcx,1), %ecx
	movb %cl, (%rsi,%rax,1)
	incq %rax
	testq %rdi, %rdi
	jne .LB2252
.LB2253:
	movb $0, (%rsi,%rax,1)
	movq 32(%rsp), %rsi
	movq 24(%rsp), %rdi
	addq $48, %rsp
	ret
.LB2215:
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
.LB2273:
	xorl %eax, %eax
.LB2280:
	movslq %eax, %rdx
	movzbl (%rcx,%rdx,1), %esi
	cmpb $32, %sil
	je .LB2281
.LB2289:
	cmpb $9, %sil
	je .LB2281
.LB2298:
	cmpb $10, (%rcx,%rdx,1)
	je .LB2281
.LB2307:
	cmpb $13, (%rcx,%rdx,1)
	jne .LB2282
.LB2281:
	incl %eax
	jmp .LB2280
.LB2282:
	movzbl (%rcx,%rdx,1), %edx
	cmpb $45, %dl
	je .LB2324
.LB2325:
	cmpb $43, %dl
	je .LB2336
.LB2337:
	movl $1, %edx
.LB2326:
	movq %rax, %rsi
	xorl %eax, %eax
.LB2340:
	movslq %esi, %rdi
	movzbl (%rcx,%rdi,1), %edi
	testb %dil, %dil
	je .LB2342
.LB2341:
	cmpb $48, %dil
	jb .LB2342
.LB2356:
	cmpb $57, %dil
	ja .LB2342
.LB2362:
	movzbl %dil, %edi
	subl $48, %edi
	imull $10, %eax, %eax
	addl %edi, %eax
	incl %esi
	jmp .LB2340
.LB2336:
	incl %eax
	movl $1, %edx
	jmp .LB2326
.LB2324:
	incl %eax
	movl $4294967295, %edx
	jmp .LB2326
.LB2342:
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
.LB2377:
	xorl %eax, %eax
.LB2383:
	movslq %eax, %rdx
	movzbl (%rcx,%rdx,1), %edx
	leal -9(%rdx), %esi
	cmpb $24, %sil
	jae .LB10644
.LB10645:
	movzbl %sil, %esi
	movl $8388627, %edi
	btq %rsi, %rdi
	jae .LB10644
.LB2384:
	incl %eax
	jmp .LB2383
.LB10644:
	cmpb $45, %dl
	je .LB2427
.LB2428:
	leal 1(%rax), %esi
	cmpb $43, %dl
	cmove %esi, %eax
	movq %rax, %rdx
	xorl %eax, %eax
.LB2440:
	movslq %edx, %rsi
	movzbl (%rcx,%rsi,1), %esi
	movzbl %sil, %edi
	testb %sil, %sil
	je .LB2442
.LB2441:
	cmpb $48, %sil
	jb .LB2463
.LB2456:
	cmpb $57, %sil
	ja .LB2463
.LB2462:
	subl $48, %edi
	imull $10, %eax, %eax
	addl %edi, %eax
	incl %edx
	jmp .LB2440
.LB2463:
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB2442:
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB2427:
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
.LB2475:
	xorl %eax, %eax
.LB2483:
	movslq %eax, %rdx
	movzbl (%rcx,%rdx,1), %esi
	cmpb $32, %sil
	je .LB2484
.LB2492:
	cmpb $9, %sil
	je .LB2484
.LB2501:
	cmpb $10, (%rcx,%rdx,1)
	je .LB2484
.LB2510:
	cmpb $13, (%rcx,%rdx,1)
	jne .LB2485
.LB2484:
	incl %eax
	jmp .LB2483
.LB2485:
	movzbl (%rcx,%rdx,1), %edx
	cmpb $45, %dl
	je .LB2527
.LB2528:
	cmpb $43, %dl
	je .LB2540
.LB2541:
	movq %rax, %rdx
	movl $1, %eax
.LB2529:
	movq %rdx, %rsi
	xorl %edx, %edx
.LB2544:
	movslq %esi, %rdi
	movzbl (%rcx,%rdi,1), %edi
	testb %dil, %dil
	je .LB2546
.LB2545:
	cmpb $48, %dil
	jb .LB2546
.LB2560:
	cmpb $57, %dil
	ja .LB2546
.LB2566:
	movzbl %dil, %edi
	subl $48, %edi
	imulq $10, %rdx, %rdx
	addq %rdi, %rdx
	incl %esi
	jmp .LB2544
.LB2540:
	leal 1(%rax), %edx
	movl $1, %eax
	jmp .LB2529
.LB2527:
	leal 1(%rax), %edx
	movq $-1, %rax
	jmp .LB2529
.LB2546:
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
.LB2583:
	xorl %eax, %eax
.LB2589:
	movslq %eax, %rdx
	movzbl (%rcx,%rdx,1), %edx
	leal -9(%rdx), %esi
	cmpb $24, %sil
	jae .LB10646
.LB10647:
	movzbl %sil, %esi
	movl $8388627, %edi
	btq %rsi, %rdi
	jae .LB10646
.LB2590:
	incl %eax
	jmp .LB2589
.LB10646:
	cmpb $45, %dl
	je .LB2633
.LB2634:
	leal 1(%rax), %esi
	cmpb $43, %dl
	cmove %esi, %eax
	movq %rax, %rdx
	xorl %eax, %eax
.LB2647:
	movslq %edx, %rsi
	movzbl (%rcx,%rsi,1), %esi
	movzbl %sil, %edi
	testb %sil, %sil
	je .LB2649
.LB2648:
	cmpb $48, %sil
	jb .LB2670
.LB2663:
	cmpb $57, %sil
	ja .LB2670
.LB2669:
	leal -48(%rdi), %esi
	imulq $10, %rax, %rax
	addq %rsi, %rax
	incl %edx
	jmp .LB2647
.LB2670:
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB2649:
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB2633:
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
.LB2684:
	xorps %xmm1, %xmm1
	ucomiss %xmm0, %xmm1
	ja .LB2692
.LB2693:
	xorl %eax, %eax
.LB2694:
	xorps %xmm1, %xmm1
	ucomiss %xmm1, %xmm0
	sete %cl
	setnp %sil
	movzbl %cl, %ecx
	movzbl %sil, %esi
	andl %esi, %ecx
	testb %cl, %cl
	jne .LB2702
.LB2703:
	cvttss2siq %xmm0, %rcx
	movl %ecx, %ecx
	movslq %ecx, %rsi
	xorps %xmm1, %xmm1
	cvtsi2ssq %rsi, %xmm1
	subss %xmm1, %xmm0
	movl $1, %esi
	xorl %edi, %edi
.LB2750:
	cmpl %r8d, %edi
	jge .LB2752
.LB2751:
	imull $10, %esi, %esi
	incl %edi
	cmpl %r8d, %edi
	jl .LB2751
	jmp .LB2752
.LB2692:
	movb $45, (%rdx)
	xorps %xmm1, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subss %xmm15, %xmm0
	movl $1, %eax
	jmp .LB2694
.LB2752:
	movslq %esi, %rdi
	xorps %xmm1, %xmm1
	cvtsi2ssq %rdi, %xmm1
	movabsq $1056964608, %r10
	movq %r10, %xmm2
	vfmadd132ss %xmm1, %xmm2, %xmm0
	cvttss2siq %xmm0, %rdi
	movl %edi, %edi
	cmpl %esi, %edi
	jge .LB2772
.LB2773:
.LB2774:
	testl %ecx, %ecx
	je .LB2790
.LB2791:
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, 32(%rsp)
	vzeroupper
	movq %rcx, %rsi
	xorl %ecx, %ecx
.LB2803:
	testl %esi, %esi
	jle .LB2805
.LB2804:
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
	jg .LB2804
	jmp .LB2805
.LB2772:
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
	jne .LB2787
.LB2780:
	testl %r8d, %r8d
	jle .LB2787
.LB2787:
	xorl %edi, %edi
	testl %ecx, %ecx
	je .LB2790
	jmp .LB2791
.LB2805:
	decl %ecx
.LB2821:
	testl %ecx, %ecx
	js .LB2823
.LB2822:
	movslq %ecx, %rsi
	movzbl 32(%rsp,%rsi,1), %esi
	movslq %eax, %r9
	movb %sil, (%rdx,%r9,1)
	incl %eax
	decl %ecx
	jns .LB2822
.LB2823:
.LB2792:
	testl %r8d, %r8d
	jg .LB2838
.LB2839:
	movslq %eax, %rcx
	movb $0, (%rdx,%rcx,1)
	movq 80(%rsp), %rbx
	movq 72(%rsp), %rsi
	movq 64(%rsp), %rdi
	addq $96, %rsp
	ret
.LB2790:
	movslq %eax, %rcx
	movb $48, (%rdx,%rcx,1)
	incl %eax
	testl %r8d, %r8d
	jle .LB2839
.LB2838:
	movslq %eax, %rcx
	movb $46, (%rdx,%rcx,1)
	incl %eax
	testl %edi, %edi
	je .LB2849
.LB2850:
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, (%rsp)
	vzeroupper
	xorl %ecx, %ecx
.LB2871:
	testl %edi, %edi
	jle .LB2873
.LB2872:
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
	jg .LB2872
.LB2873:
	subl %ecx, %r8d
	xorl %esi, %esi
.LB2891:
	cmpl %r8d, %esi
	jge .LB2893
.LB2892:
	movslq %eax, %rdi
	movb $48, (%rdx,%rdi,1)
	incl %eax
	incl %esi
	cmpl %r8d, %esi
	jl .LB2892
.LB2893:
	decl %ecx
.LB2908:
	testl %ecx, %ecx
	js .LB2910
.LB2909:
	movslq %ecx, %rsi
	movzbl (%rsp,%rsi,1), %esi
	movslq %eax, %rdi
	movb %sil, (%rdx,%rdi,1)
	incl %eax
	decl %ecx
	jns .LB2909
.LB2910:
.LB2851:
	movslq %eax, %rcx
	movb $0, (%rdx,%rcx,1)
	movq 80(%rsp), %rbx
	movq 72(%rsp), %rsi
	movq 64(%rsp), %rdi
	addq $96, %rsp
	ret
.LB2849:
	xorl %ecx, %ecx
.LB2853:
	cmpl %r8d, %ecx
	jge .LB2855
.LB2854:
	movslq %eax, %rsi
	movb $48, (%rdx,%rsi,1)
	incl %eax
	incl %ecx
	cmpl %r8d, %ecx
	jl .LB2854
.LB2855:
	jmp .LB2851
.LB2702:
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
.LB10648:
	testl %esi, %esi
	je .LB10650
.LB10649:
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
	jne .LB10649
.LB10650:
.LB2714:
	cmpl %r8d, %edi
	jge .LB2716
.LB2715:
	leal (%rcx,%rdi), %esi
	movslq %esi, %rsi
	movb $48, (%rdx,%rsi,1)
	incl %edi
	cmpl %r8d, %edi
	jl .LB2715
.LB2716:
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
.LB2928:
	movq %rdx, %rcx
	xorps %xmm1, %xmm1
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm0, %xmm1
	ja .LB2936
.LB2937:
	xorl %esi, %esi
.LB2938:
	xorps %xmm1, %xmm1
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm1, %xmm0
	sete %al
	setnp %dl
	movzbl %al, %eax
	movzbl %dl, %edx
	andl %edx, %eax
	testb %al, %al
	jne .LB2946
.LB2947:
	cvttsd2siq %xmm0, %rax
	xorps %xmm1, %xmm1
	cvtsi2sdq %rax, %xmm1
	subsd %xmm1, %xmm0
	movl $1, %edx
	xorl %edi, %edi
.LB2996:
	cmpl %r8d, %edi
	jge .LB2998
.LB2997:
	imulq $10, %rdx, %rdx
	incl %edi
	cmpl %r8d, %edi
	jl .LB2997
	jmp .LB2998
.LB2936:
	movb $69, (%rcx)
	xorps %xmm1, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subsd %xmm15, %xmm0
	movl $1, %esi
	jmp .LB2938
.LB2998:
	xorps %xmm1, %xmm1
	cvtsi2sdq %rdx, %xmm1
	movabsq $1056964608, %r10
	movq %r10, %xmm2
	cvtss2sd %xmm2, %xmm2
	vfmadd132sd %xmm1, %xmm2, %xmm0
	cvttsd2siq %xmm0, %rdi
	cmpq %rdx, %rdi
	jge .LB3020
.LB3021:
.LB3022:
	testq %rax, %rax
	je .LB3043
.LB3044:
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, 32(%rsp)
	vzeroupper
	xorl %r9d, %r9d
	movq %rax, %rbx
.LB3056:
	testq %rbx, %rbx
	jle .LB3058
.LB3057:
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
	jg .LB3057
	jmp .LB3058
.LB3020:
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
	jne .LB3039
.LB3032:
	testl %r8d, %r8d
	jle .LB3039
.LB3039:
	movq %rdi, %rax
	xorl %edi, %edi
	testq %rax, %rax
	je .LB3043
	jmp .LB3044
.LB3058:
	leal -1(%r9), %eax
.LB3078:
	testl %eax, %eax
	js .LB3080
.LB3079:
	movslq %eax, %rdx
	movzbl 32(%rsp,%rdx,1), %edx
	movslq %esi, %r9
	movb %dl, (%rcx,%r9,1)
	incl %esi
	decl %eax
	jns .LB3079
.LB3080:
.LB3045:
	testl %r8d, %r8d
	jg .LB3095
.LB3096:
	movq %rsi, %rax
	movslq %eax, %rdx
	movb $0, (%rcx,%rdx,1)
	movq 80(%rsp), %rbx
	movq 72(%rsp), %rsi
	movq 64(%rsp), %rdi
	addq $96, %rsp
	ret
.LB3043:
	movslq %esi, %rax
	movb $48, (%rcx,%rax,1)
	incl %esi
	testl %r8d, %r8d
	jle .LB3096
.LB3095:
	movslq %esi, %rax
	movb $46, (%rcx,%rax,1)
	incl %esi
	testq %rdi, %rdi
	je .LB3107
.LB3108:
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, (%rsp)
	vzeroupper
	movq %rdi, %r9
	xorl %edi, %edi
.LB3129:
	testq %r9, %r9
	jle .LB3131
.LB3130:
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
	jg .LB3130
.LB3131:
	subl %edi, %r8d
	xorl %eax, %eax
.LB3153:
	cmpl %r8d, %eax
	jge .LB3155
.LB3154:
	movslq %esi, %rdx
	movb $48, (%rcx,%rdx,1)
	incl %esi
	incl %eax
	cmpl %r8d, %eax
	jl .LB3154
.LB3155:
	leal -1(%rdi), %eax
.LB3170:
	testl %eax, %eax
	js .LB3172
.LB3171:
	movslq %eax, %rdx
	movzbl (%rsp,%rdx,1), %edx
	movslq %esi, %rdi
	movb %dl, (%rcx,%rdi,1)
	incl %esi
	decl %eax
	jns .LB3171
.LB3172:
.LB3109:
	movq %rsi, %rax
	movslq %eax, %rdx
	movb $0, (%rcx,%rdx,1)
	movq 80(%rsp), %rbx
	movq 72(%rsp), %rsi
	movq 64(%rsp), %rdi
	addq $96, %rsp
	ret
.LB3107:
	xorl %eax, %eax
.LB3111:
	cmpl %r8d, %eax
	jge .LB3113
.LB3112:
	movslq %esi, %rdx
	movb $48, (%rcx,%rdx,1)
	incl %esi
	incl %eax
	cmpl %r8d, %eax
	jl .LB3112
.LB3113:
	jmp .LB3109
.LB2946:
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
.LB10655:
	testl %edx, %edx
	je .LB10657
.LB10656:
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
	jne .LB10656
.LB10657:
.LB2959:
	cmpl %r8d, %edi
	jge .LB2961
.LB2960:
	leal (%rax,%rdi), %edx
	movslq %edx, %rdx
	movb $48, (%rcx,%rdx,1)
	incl %edi
	cmpl %r8d, %edi
	jl .LB2960
.LB2961:
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
.LB3190:
	xorl %eax, %eax
	xorl %edx, %edx
.LB3193:
	movslq %edx, %rsi
	movzbl (%rcx,%rsi,1), %esi
	testb %sil, %sil
	je .LB3196
.LB3194:
	leal 1(%rax), %edi
	cmpb $10, %sil
	cmove %edi, %eax
	incl %edx
	jmp .LB3193
.LB3196:
	testl %eax, %eax
	jg .LB3226
.LB3218:
	cmpb $0, (%rcx)
	jne .LB3226
.LB3227:
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB3226:
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
.LB3232:
	xorl %eax, %eax
	xorl %esi, %esi
.LB3237:
	movslq %esi, %rdi
	movzbl (%rcx,%rdi,1), %edi
	testb %dil, %dil
	jne .LB3238
.LB10662:
	xorl %esi, %esi
.LB3240:
	cmpl %edx, %eax
	jne .LB3270
.LB3271:
	movq %rsi, %rax
.LB3277:
	movslq %eax, %rdx
	movzbl (%rcx,%rdx,1), %edx
	testb %dl, %dl
	je .LB3279
.LB3286:
	cmpb $10, %dl
	je .LB3279
.LB3278:
	incl %eax
	jmp .LB3277
.LB3238:
	cmpl %edx, %eax
	je .LB3251
.LB3252:
	leal 1(%rax), %r8d
	cmpb $10, %dil
	cmove %r8d, %eax
	incl %esi
	jmp .LB3237
.LB3251:
	cmpl %edx, %eax
	jne .LB3270
	jmp .LB3271
.LB3279:
	movl %eax, %r8d
	subl %esi, %r8d
	movq %rsi, %rdx
	callq standard__strings__manip__substring__3__byteE1_ptr1__intE1__intE1__ret_byteE1_ptr1
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB3270:
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
.LB3304:
	movq %rcx, %rsi
	xorl %edi, %edi
	xorl %ebx, %ebx
	xorl %r12d, %r12d
.LB3308:
	movslq %r12d, %rax
	movzbl (%rsi,%rax,1), %eax
	testb %al, %al
	je .LB3311
.LB3309:
	movzbl %al, %ecx
	callq standard__strings__helpers__is_whitespace__1__charE1__ret_boolE1
	testb %al, %al
	jne .LB3324
.LB3325:
	testb %bl, %bl
	je .LB3329
.LB3330:
.LB3326:
	incl %r12d
	jmp .LB3308
.LB3311:
	movl %edi, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB3329:
	incl %edi
	movl $1, %ebx
	jmp .LB3326
.LB3324:
	xorl %ebx, %ebx
	jmp .LB3326
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
.LB3336:
	movq %rcx, %rbx
	movq %rdx, %rsi
	movq %r8, %r12
	movq %rbx, %rcx
	movq %rsi, %rdx
	xorl %r8d, %r8d
	callq standard__strings__helpers__find_substring__3__byteE1_ptr1__byteE1_ptr1__intE1__ret_intE1
	movl %eax, %r13d
	cmpl $4294967295, %r13d
	je .LB3347
.LB3348:
	xorl %r14d, %r14d
.LB3353:
	movslq %r14d, %rax
	cmpb $0, (%rbx,%rax,1)
	je .LB3355
.LB3354:
	incl %r14d
	jmp .LB3353
.LB3355:
	xorl %r15d, %r15d
.LB3365:
	movslq %r15d, %rax
	cmpb $0, (%rsi,%rax,1)
	je .LB3367
.LB3366:
	incl %r15d
	jmp .LB3365
.LB3367:
	movq $0, -64(%rbp)
.LB3377:
	movq -64(%rbp), %rax
	movslq %eax, %rax
	cmpb $0, (%r12,%rax,1)
	je .LB3379
.LB3378:
	movq -64(%rbp), %rax
	incl %eax
	movq %rax, -64(%rbp)
	jmp .LB3377
.LB3379:
	movl %r14d, %eax
	subl %r15d, %eax
	movq -64(%rbp), %rcx
	addl %ecx, %eax
	leaq 1(%rax), %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	testq %rax, %rax
	je .LB3405
.LB3406:
	cmpl $32, %r13d
	jge .LB10663
.LB10664:
	movslq %r13d, %rcx
	xorl %edx, %edx
	testq %rcx, %rcx
	cmovg %rcx, %rdx
	shrq $2, %rdx
	xorl %esi, %esi
.LB10665:
	testq %rdx, %rdx
	je .LB10667
.LB10666:
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
	jne .LB10666
.LB10667:
.LB3410:
	cmpq %rcx, %rsi
	jge .LB3413
.LB3411:
	movzbl (%rbx,%rsi,1), %edx
	movb %dl, (%rax,%rsi,1)
	incq %rsi
	cmpq %rcx, %rsi
	jl .LB3411
	jmp .LB3413
.LB10663:
	movslq %r13d, %rcx
	movq %rcx, %rdx
	sarq $63, %rdx
	notq %rdx
	andq %rdx, %rcx
	movq %rax, %rdi
	movq %rbx, %rsi
	rep movsb
.LB3413:
	xorl %ecx, %ecx
	movq -64(%rbp), %rdx
	testl %edx, %edx
	cmovg %edx, %ecx
	shrl $2, %ecx
	xorl %edx, %edx
.LB10668:
	testl %ecx, %ecx
	je .LB10670
.LB10669:
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
	jne .LB10669
.LB10670:
.LB3427:
	movq -64(%rbp), %rcx
	cmpl %ecx, %edx
	jge .LB3430
.LB3428:
	movslq %edx, %rcx
	movzbl (%r12,%rcx,1), %ecx
	leal (%r13,%rdx), %esi
	movslq %esi, %rsi
	movb %cl, (%rax,%rsi,1)
	incl %edx
	jmp .LB3427
.LB3430:
	leal (%r13,%r15), %ecx
.LB3446:
	cmpl %r14d, %ecx
	jg .LB3449
.LB3447:
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
	jle .LB3447
.LB3449:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB3405:
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
.LB3347:
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
.LB3471:
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
.LB10671:
	testq %rdx, %rdx
	je .LB10673
.LB10672:
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
	jne .LB10672
.LB10673:
.LB3482:
	cmpq %rcx, %r8
	jge .LB3484
.LB3483:
	movzbl -32(%rbp,%r8,1), %edx
	movslq (%rdi), %r9
	movb %dl, (%rsi,%r9,1)
	movl (%rdi), %edx
	incl %edx
	movl %edx, (%rdi)
	incq %r8
	cmpq %rcx, %r8
	jl .LB3483
.LB3484:
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
.LB3502:
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
.LB10674:
	testq %rdx, %rdx
	je .LB10676
.LB10675:
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
	jne .LB10675
.LB10676:
.LB3512:
	cmpq %rcx, %r8
	jge .LB3514
.LB3513:
	movzbl -56(%rbp,%r8,1), %edx
	movslq (%rdi), %r9
	movb %dl, (%rsi,%r9,1)
	movl (%rdi), %edx
	incl %edx
	movl %edx, (%rdi)
	incq %r8
	cmpq %rcx, %r8
	jl .LB3513
.LB3514:
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
.LB3532:
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
.LB10677:
	testq %rdx, %rdx
	je .LB10679
.LB10678:
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
	jne .LB10678
.LB10679:
.LB3543:
	cmpq %rcx, %r8
	jge .LB3545
.LB3544:
	movzbl -56(%rbp,%r8,1), %edx
	movslq (%rdi), %r9
	movb %dl, (%rsi,%r9,1)
	movl (%rdi), %edx
	incl %edx
	movl %edx, (%rdi)
	incq %r8
	cmpq %rcx, %r8
	jl .LB3544
.LB3545:
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
.LB3563:
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
.LB10680:
	testq %rdx, %rdx
	je .LB10682
.LB10681:
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
	jne .LB10681
.LB10682:
.LB3574:
	cmpq %rcx, %r8
	jge .LB3576
.LB3575:
	movzbl -32(%rbp,%r8,1), %edx
	movslq (%rdi), %r9
	movb %dl, (%rsi,%r9,1)
	movl (%rdi), %edx
	incl %edx
	movl %edx, (%rdi)
	incq %r8
	cmpq %rcx, %r8
	jl .LB3575
.LB3576:
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
.LB3594:
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
.LB10683:
	testq %rdx, %rdx
	je .LB10685
.LB10684:
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
	jne .LB10684
.LB10685:
.LB3604:
	cmpq %rcx, %r8
	jge .LB3606
.LB3605:
	movzbl -56(%rbp,%r8,1), %edx
	movslq (%rdi), %r9
	movb %dl, (%rsi,%r9,1)
	movl (%rdi), %edx
	incl %edx
	movl %edx, (%rdi)
	incq %r8
	cmpq %rcx, %r8
	jl .LB3605
.LB3606:
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
.LB3624:
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
.LB10686:
	testq %rdx, %rdx
	je .LB10688
.LB10687:
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
	jne .LB10687
.LB10688:
.LB3635:
	cmpq %rcx, %r8
	jge .LB3637
.LB3636:
	movzbl -56(%rbp,%r8,1), %edx
	movslq (%rdi), %r9
	movb %dl, (%rsi,%r9,1)
	movl (%rdi), %edx
	incl %edx
	movl %edx, (%rdi)
	incq %r8
	cmpq %rcx, %r8
	jl .LB3636
.LB3637:
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
.LB3655:
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
.LB10689:
	testq %rdx, %rdx
	je .LB10691
.LB10690:
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
	jne .LB10690
.LB10691:
.LB3665:
	cmpq %rcx, %r8
	jge .LB3667
.LB3666:
	movzbl -56(%rbp,%r8,1), %edx
	movslq (%rdi), %r9
	movb %dl, (%rsi,%r9,1)
	movl (%rdi), %edx
	incl %edx
	movl %edx, (%rdi)
	incq %r8
	cmpq %rcx, %r8
	jl .LB3666
.LB3667:
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
.LB3685:
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
.LB10692:
	testq %rdx, %rdx
	je .LB10694
.LB10693:
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
	jne .LB10693
.LB10694:
.LB3695:
	cmpq %rcx, %r8
	jge .LB3697
.LB3696:
	movzbl -56(%rbp,%r8,1), %edx
	movslq (%rdi), %r9
	movb %dl, (%rsi,%r9,1)
	movl (%rdi), %edx
	incl %edx
	movl %edx, (%rdi)
	incq %r8
	cmpq %rcx, %r8
	jl .LB3696
.LB3697:
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
.LB3715:
	xorl %eax, %eax
.LB3720:
	movslq %eax, %rsi
	movzbl (%rcx,%rsi,1), %esi
	testb %sil, %sil
	je .LB3722
.LB3721:
	movslq (%r8), %rdi
	movb %sil, (%rdx,%rdi,1)
	movl (%r8), %esi
	incl %esi
	movl %esi, (%r8)
	incl %eax
	jmp .LB3720
.LB3722:
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
.LB3744:
	movq %rcx, %rsi
	movq %rdx, %rdi
	testq %rsi, %rsi
	je .LB3758
.LB3751:
	testq %rdi, %rdi
	je .LB3758
.LB3759:
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %ebx
	movq %rdi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	testl %eax, %eax
	je .LB3770
.LB3771:
	cmpl %ebx, %eax
	jg .LB3777
.LB3778:
	movl %ebx, %ecx
	subl %eax, %ecx
.LB3782:
	testl %ecx, %ecx
	js .LB3785
.LB3783:
	xorl %edx, %edx
.LB3792:
	cmpl %eax, %edx
	jl .LB3793
.LB10695:
	movl $1, %edx
.LB3795:
	testb %dl, %dl
	jne .LB3817
.LB3818:
	decl %ecx
	jns .LB3783
.LB3785:
	movabsq $4294967295, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB3793:
	leal (%rcx,%rdx), %r8d
	movslq %edx, %r9
	movslq %r8d, %r8
	movzbl (%rsi,%r8,1), %r8d
	movzbl (%rdi,%r9,1), %r9d
	cmpb %r9b, %r8b
	jne .LB3811
.LB3812:
	incl %edx
	cmpl %eax, %edx
	jl .LB3793
	jmp .LB10695
.LB3811:
	xorl %edx, %edx
	testb %dl, %dl
	je .LB3818
.LB3817:
	movl %ecx, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB3777:
	movabsq $4294967295, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB3770:
	movl %ebx, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB3758:
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
.LB3824:
	movq %rcx, %rsi
	movl %edx, %edi
	testq %rsi, %rsi
	je .LB3831
.LB3832:
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	decl %eax
.LB3838:
	testl %eax, %eax
	js .LB3841
.LB3839:
	movslq %eax, %rcx
	movzbl (%rsi,%rcx,1), %ecx
	cmpb %dil, %cl
	je .LB3853
.LB3854:
	decl %eax
	jns .LB3839
.LB3841:
	movabsq $4294967295, %rax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB3853:
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB3831:
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
.LB3860:
	movq %rcx, %rsi
	movq %rdx, %rdi
	testq %rsi, %rsi
	je .LB3874
.LB3867:
	testq %rdi, %rdi
	je .LB3874
.LB3875:
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %ebx
	movq %rdi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	testl %eax, %eax
	je .LB3891
.LB3885:
	cmpl %ebx, %eax
	jg .LB3891
.LB3892:
	subl %eax, %ebx
	xorl %ecx, %ecx
	xorl %edx, %edx
.LB3897:
	cmpl %ebx, %edx
	jg .LB3899
.LB3898:
	xorl %r8d, %r8d
.LB3905:
	cmpl %eax, %r8d
	jl .LB3906
.LB10696:
	movl $1, %r8d
.LB3908:
	leal 1(%rcx), %r9d
	leal (%rdx,%rax), %r12d
	incl %edx
	testb %r8b, %r8b
	cmovne %r9d, %ecx
	testb %r8b, %r8b
	cmovne %r12d, %edx
	cmpl %ebx, %edx
	jle .LB3898
.LB3899:
	movl %ecx, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB3906:
	leal (%rdx,%r8), %r9d
	movslq %r8d, %r12
	movslq %r9d, %r9
	movzbl (%rsi,%r9,1), %r9d
	movzbl (%rdi,%r12,1), %r12d
	cmpb %r12b, %r9b
	jne .LB3924
.LB3925:
	incl %r8d
	cmpl %eax, %r8d
	jl .LB3906
	jmp .LB10696
.LB3924:
	xorl %r8d, %r8d
	jmp .LB3908
.LB3891:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB3874:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
	.text
	.globl standard__io__console__win_input__2__byteE1_arr__intE1__ret_intE1
	.def standard__io__console__win_input__2__byteE1_arr__intE1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__io__console__win_input__2__byteE1_arr__intE1__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
	movq %r14, -48(%rbp)
.LB3941:
	leaq -52(%rbp), %rbx
	leaq -56(%rbp), %r13
	movq %rcx, %r14
	movl %edx, %edi
	movl $0, -52(%rbp)
	movl $0, -56(%rbp)
	movq %r14, %rsi
	movq $-10, %rcx
	                    subq $32, %rsp
	                    call GetStdHandle
	                    addq $32, %rsp
	                    movq %rax, %r12
	                    movq %rax, %rcx
	                    movq %r13, %rdx
	                    subq $32, %rsp
	                    call GetConsoleMode
	                    addq $32, %rsp
	                    movq %r12, %rcx
	                    movq $0x001F, %rdx
	                    subq $32, %rsp
	                    call SetConsoleMode
	                    addq $32, %rsp
	                    movq %r12, %rcx
	                    movq %rsi, %rdx           
	                    movl %edi, %r8d           
	                    movq %rbx, %r9            
	                    subq $40, %rsp
	                    movq $0, 32(%rsp)
	                    call ReadFile
	                    addq $40, %rsp
	                    movq %r12, %rcx
	                    movl (%r13), %edx
	                    subq $32, %rsp
	                    call SetConsoleMode
	                    addq $32, %rsp
	                    movl (%rbx), %eax
	xorl %eax, %eax
.LB3952:
	movl -52(%rbp), %ecx
	cmpl %ecx, %eax
	jge .LB3955
.LB3953:
	movslq %eax, %rcx
	movzbl (%r14,%rcx,1), %ecx
	cmpb $13, %cl
	je .LB3973
.LB3965:
	cmpb $10, %cl
	je .LB3973
.LB3975:
	incl %eax
	jmp .LB3952
.LB3955:
	movl %ecx, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	leave
	ret
.LB3973:
	movslq %eax, %rcx
	movb $0, (%r14,%rcx,1)
	jmp .LB3975
	.text
	.globl standard__io__console__input__2__byteE1_arr__intE1__ret_intE1
	.def standard__io__console__input__2__byteE1_arr__intE1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__io__console__input__2__byteE1_arr__intE1__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB3983:
	movq %rcx, %rsi
	movl %edx, %edi
	callq standard__io__console__flush__0__ret_voidE1
	movq %rsi, %rcx
	movq %rdi, %rdx
	callq standard__io__console__win_input__2__byteE1_arr__intE1__ret_intE1
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
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
.LB3999:
	movl standard__io__console__out_len(%rip), %edi
	testl %edi, %edi
	je .LB4004
.LB4005:
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
.LB4004:
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
.LB4009:
	movq %rcx, %rsi
	movl %edx, %edi
	testl %edi, %edi
	jle .LB4015
.LB4016:
	cmpl $8192, %edi
	jge .LB4020
.LB4021:
	movl standard__io__console__out_len(%rip), %eax
	addl %edi, %eax
	cmpl $8192, %eax
	jg .LB4029
.LB4031:
	movl %edi, %eax
	shrl $2, %eax
	xorl %ecx, %ecx
.LB10697:
	testl %eax, %eax
	je .LB10699
.LB10698:
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
	jne .LB10698
	jmp .LB10699
.LB4029:
	callq standard__io__console__flush__0__ret_voidE1
	jmp .LB4031
.LB10699:
.LB4032:
	cmpl %edi, %ecx
	jge .LB4034
.LB4033:
	movslq %ecx, %rax
	leaq standard__io__console__out_buf(%rip), %r8
	movzbl (%rsi,%rax,1), %eax
	movl standard__io__console__out_len(%rip), %edx
	addl %ecx, %edx
	incl %ecx
	movslq %edx, %rdx
	movb %al, (%r8,%rdx,1)
	cmpl %edi, %ecx
	jl .LB4033
.LB4034:
	movl standard__io__console__out_len(%rip), %eax
	addl %edi, %eax
	movl %eax, standard__io__console__out_len(%rip)
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB4020:
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
.LB4015:
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
.LB3989:
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
.LB4051:
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
.LB4056:
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
.LB4063:
	testb %cl, %cl
	jne .LB4066
.LB4067:
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
.LB4066:
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
.LB4095:
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
.LB4087:
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
.LB4084:
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
.LB4110:
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
.LB4117:
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
.LB4103:
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
.LB4124:
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
.LB4131:
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
.LB4138:
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
.LB4145:
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
.LB4152:
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
.LB4155:
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
.LB4158:
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
.LB4166:
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
.LB4181:
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
.LB4189:
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
.LB3994:
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
	subq $3680, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
	movq %r14, -48(%rbp)
	movq %r15, -56(%rbp)
.LB9841:
	leaq .LZERO(%rip), %rsi
	leaq -216(%rbp), %rdi
	movl $160, %ecx
	rep movsb
	leaq .LZERO(%rip), %rsi
	leaq -376(%rbp), %rdi
	movl $160, %ecx
	rep movsb
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -456(%rbp)
	vmovdqu .LZERO+32(%rip), %ymm15
	vmovdqu %ymm15, -424(%rbp)
	movups .LZERO+64(%rip), %xmm15
	movups %xmm15, -392(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -536(%rbp)
	vmovdqu .LZERO+32(%rip), %ymm15
	vmovdqu %ymm15, -504(%rbp)
	movups .LZERO+64(%rip), %xmm15
	movups %xmm15, -472(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -616(%rbp)
	vmovdqu .LZERO+32(%rip), %ymm15
	vmovdqu %ymm15, -584(%rbp)
	movups .LZERO+64(%rip), %xmm15
	movups %xmm15, -552(%rbp)
	vzeroupper
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -632(%rbp)
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -648(%rbp)
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -664(%rbp)
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -680(%rbp)
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -696(%rbp)
	leaq .LZERO(%rip), %rsi
	leaq -1472(%rbp), %rdi
	movl $773, %ecx
	rep movsb
	leaq .LZERO(%rip), %rsi
	leaq -1880(%rbp), %rdi
	movl $408, %ecx
	rep movsb
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -1896(%rbp)
	leaq -1896(%rbp), %rcx
	movl $256, %edx
	callq standard__autograd__Tape.__init__1__dataE1_ubits64__ret_thisE1
	xorl %eax, %eax
.LB9867:
	cmpl $40, %eax
	jge .LB9869
.LB9868:
	xorps %xmm0, %xmm0
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	movslq %eax, %rcx
	movabsq $1073741824, %r10
	movq %r10, %xmm2
	subss %xmm1, %xmm0
	xorps %xmm1, %xmm1
	cvtsi2ssq %rcx, %xmm1
	movl $40, %ecx
	movslq %ecx, %rcx
	mulss %xmm2, %xmm1
	xorps %xmm2, %xmm2
	cvtsi2ssq %rcx, %xmm2
	movslq %eax, %rcx
	divss %xmm2, %xmm1
	addss %xmm1, %xmm0
	xorps %xmm1, %xmm1
	movss %xmm0, -216(%rbp,%rcx,4)
	ucomiss %xmm0, %xmm1
	ja .LB9884
.LB9885:
.LB9886:
	movslq %eax, %rcx
	movss %xmm0, -376(%rbp,%rcx,4)
	incl %eax
	cmpl $40, %eax
	jl .LB9868
.LB9869:
	xorl %eax, %eax
.LB9895:
	cmpl $20, %eax
	jge .LB9897
.LB9896:
	xorps %xmm0, %xmm0
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	movslq %eax, %rcx
	movabsq $1056964608, %r10
	movq %r10, %xmm2
	subss %xmm1, %xmm0
	xorps %xmm1, %xmm1
	cvtsi2ssq %rcx, %xmm1
	movl $40, %ecx
	movslq %ecx, %rcx
	addss %xmm2, %xmm1
	movabsq $1073741824, %r10
	movq %r10, %xmm2
	mulss %xmm2, %xmm1
	xorps %xmm2, %xmm2
	cvtsi2ssq %rcx, %xmm2
	movslq %eax, %rcx
	divss %xmm2, %xmm1
	addss %xmm1, %xmm0
	xorps %xmm1, %xmm1
	movss %xmm0, -456(%rbp,%rcx,4)
	ucomiss %xmm0, %xmm1
	ja .LB9913
.LB9914:
.LB9915:
	movslq %eax, %rcx
	movss %xmm0, -536(%rbp,%rcx,4)
	incl %eax
	cmpl $20, %eax
	jl .LB9896
.LB9897:
	movq $40, -632(%rbp)
	movq $1, -624(%rbp)
	movq $40, -648(%rbp)
	movq $1, -640(%rbp)
	movq $20, -664(%rbp)
	movq $1, -656(%rbp)
	movq $20, -680(%rbp)
	movq $1, -672(%rbp)
	callq standard__random__get_entropy__0__ret_dataE1_ubits64
	movq %rax, %rsi
	callq standard__random__get_entropy__0__ret_dataE1_ubits64
	movq %rax, %r8
	leaq -696(%rbp), %rcx
	movq %rsi, %rdx
	callq standard__random__pcg32_seed__3__PCG32E1_ptr1__dataE1_ubits64__dataE1_ubits64__ret_voidE1
	movl $0, -704(%rbp)
	orb $128, -700(%rbp)
	leaq -1472(%rbp), %rcx
	leaq -696(%rbp), %rax
	movl $1, %edx
	movl $32, %r8d
	movl $1, %r9d
	movq %rax, 32(%rsp)
	callq standard__neuralnet__nn_seq_add_linear__5__SequentialE1_ptr1__dataE1_ubits64__dataE1_ubits64__intE1__PCG32E1_ptr1__ret_boolE1
	leaq -1472(%rbp), %rcx
	leaq -696(%rbp), %rax
	movl $32, %edx
	movl $32, %r8d
	movl $1, %r9d
	movq %rax, 32(%rsp)
	callq standard__neuralnet__nn_seq_add_linear__5__SequentialE1_ptr1__dataE1_ubits64__dataE1_ubits64__intE1__PCG32E1_ptr1__ret_boolE1
	leaq -1472(%rbp), %rcx
	leaq -696(%rbp), %rax
	movl $32, %edx
	movl $1, %r8d
	xorl %r9d, %r9d
	movq %rax, 32(%rsp)
	callq standard__neuralnet__nn_seq_add_linear__5__SequentialE1_ptr1__dataE1_ubits64__dataE1_ubits64__intE1__PCG32E1_ptr1__ret_boolE1
	movabsq $4487126258331716666, %r10
	movq %r10, %xmm0
	leaq -1880(%rbp), %rcx
	movabsq $994352038, %r10
	movq %r10, %xmm1
	movabsq $1063675494, %r10
	movq %r10, %xmm2
	movabsq $1065336439, %r10
	movq %r10, %xmm3
	cvtsd2ss %xmm0, %xmm0
	movss %xmm0, 32(%rsp)
	callq standard__neuralnet__adam_init__5__AdamE1_ptr1__floatE1__floatE1__floatE1__floatE1__ret_voidE1
	leaq -1880(%rbp), %rcx
	leaq -1472(%rbp), %rdx
	callq standard__neuralnet__adam_register_seq__2__AdamE1_ptr1__SequentialE1_ptr1__ret_voidE1
	leaq -1960(%rbp), %rsi
	movl $1869832769, -1960(%rbp)
	movl $1702131052, -1956(%rbp)
	movl $1818326560, -1952(%rbp)
	movl $1914725749, -1948(%rbp)
	movl $1701996389, -1944(%rbp)
	movl $1869181811, -1940(%rbp)
	movl $673194094, -1936(%rbp)
	movl $859712817, -1932(%rbp)
	movl $859712818, -1928(%rbp)
	movl $826158386, -1924(%rbp)
	movl $1699881004, -1920(%rbp)
	movl $539776332, -1916(%rbp)
	movl $1835099201, -1912(%rbp)
	movl $1030908960, -1908(%rbp)
	movl $808463920, -1904(%rbp)
	movl $665907, -1900(%rbp)
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	leaq -1976(%rbp), %rsi
	movl $1885697107, -1976(%rbp)
	movl $538976288, -1972(%rbp)
	movl $1867259936, -1968(%rbp)
	movl $684915, -1964(%rbp)
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	leaq -1992(%rbp), %rsi
	movl $757935405, -1992(%rbp)
	movl $538976288, -1988(%rbp)
	movl $757932064, -1984(%rbp)
	movl $666925, -1980(%rbp)
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	xorl %esi, %esi
	xorl %edi, %edi
	movq $0, -3512(%rbp)
	movq $0, -3520(%rbp)
	movq $0, -3528(%rbp)
	xorl %ebx, %ebx
	movabsq $0, %r10
	movq %r10, -3472(%rbp)
	xorl %r12d, %r12d
	movq $0, -3480(%rbp)
	movq $0, -3488(%rbp)
	movq $0, -3496(%rbp)
.LB10051:
	cmpl $3000, %esi
	jge .LB10053
.LB10052:
	movl $801, %ecx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, %r13
	movl $801, %ecx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	leaq -216(%rbp), %r8
	leaq -1896(%rbp), %rdx
	movq %r13, %rcx
	movq %rax, %r14
	leaq -632(%rbp), %rax
	movl $2, %r9d
	movq %rax, 32(%rsp)
	callq standard__autograd__gt_init__5__GradTensorE1_ptr1__TapeE1_ptr1__floatE1_ptr1__dataE1_ubits64__dataE1_ptr1_ubits64__ret_voidE1
	leaq -376(%rbp), %r8
	leaq -648(%rbp), %rax
	leaq -1896(%rbp), %rdx
	movq %r14, %rcx
	movl $2, %r9d
	movq %rax, 32(%rsp)
	callq standard__autograd__gt_init__5__GradTensorE1_ptr1__TapeE1_ptr1__floatE1_ptr1__dataE1_ubits64__dataE1_ptr1_ubits64__ret_voidE1
	andb $127, 100(%r13)
	andb $127, 100(%r14)
	leaq -1472(%rbp), %rcx
	leaq -1896(%rbp), %rdx
	movq %r13, %r8
	callq standard__neuralnet__nn_seq_forward__3__SequentialE1_ptr1__standard__autograd__TapeE1_ptr1__standard__autograd__GradTensorE1_ptr1__ret_standard__autograd__GradTensorE1_ptr1
	movq %rax, %rdx
	leaq -1896(%rbp), %rcx
	movq %r14, %r8
	callq standard__neuralnet__nn_loss_mse__3__standard__autograd__TapeE1_ptr1__standard__autograd__GradTensorE1_ptr1__standard__autograd__GradTensorE1_ptr1__ret_standard__autograd__GradTensorE1_ptr1
	movq %rax, %r15
	movabsq $3665038760, %rcx
	movq (%r15), %rax
	movss (%rax), %xmm0
	movslq %esi, %rax
	imulq %rax, %rcx
	sarq $40, %rcx
	shrq $63, %rax
	movsd %xmm0, -3536(%rbp)
	addl %eax, %ecx
	imull $300, %ecx, %ecx
	movl %esi, %eax
	subl %ecx, %eax
	testl %eax, %eax
	je .LB10093
.LB10094:
	movq -3528(%rbp), %r10
	movq %r10, -3544(%rbp)
	movq %rbx, -3552(%rbp)
	movq -3472(%rbp), %r10
	movq %r10, -3560(%rbp)
	movq %r12, -3568(%rbp)
	movq -3480(%rbp), %r10
	movq %r10, -3576(%rbp)
	movq -3488(%rbp), %r10
	movq %r10, -3584(%rbp)
	movq -3496(%rbp), %r10
	movq %r10, -3592(%rbp)
	movq -3512(%rbp), %rbx
	movq -3520(%rbp), %r12
.LB10095:
	leaq -1472(%rbp), %rcx
	callq standard__neuralnet__nn_seq_zero_grad__1__SequentialE1_ptr1__ret_voidE1
	leaq -1896(%rbp), %rcx
	movq %r15, %rdx
	callq standard__autograd__backward__2__TapeE1_ptr1__GradTensorE1_ptr1__ret_voidE1
	leaq -1880(%rbp), %rcx
	leaq -1472(%rbp), %rdx
	callq standard__neuralnet__adam_step__2__AdamE1_ptr1__SequentialE1_ptr1__ret_voidE1
	movq %r15, %rcx
	callq standard__autograd__gt_free__1__GradTensorE1_ptr1__ret_voidE1
	movq %r15, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movq %r14, %rcx
	callq standard__autograd__gt_free__1__GradTensorE1_ptr1__ret_voidE1
	movq %r14, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movq %r13, %rcx
	callq standard__autograd__gt_free__1__GradTensorE1_ptr1__ret_voidE1
	movq %r13, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	leaq -1472(%rbp), %rcx
	callq standard__neuralnet__nn_seq_free_intermediates__1__SequentialE1_ptr1__ret_voidE1
	movq -1896(%rbp), %rax
	movl -1884(%rbp), %ecx
	movq %rcx, %r8
	shlq $10, %r8
	movq %rax, %rcx
	xorl %edx, %edx
	callq memset
	movl $0, -1888(%rbp)
	incl %esi
	movq %rbx, -3512(%rbp)
	movq %r12, -3520(%rbp)
	movq -3544(%rbp), %r10
	movq %r10, -3528(%rbp)
	movq -3552(%rbp), %rbx
	movq -3560(%rbp), %r10
	movq %r10, -3472(%rbp)
	movq -3568(%rbp), %r12
	movq -3576(%rbp), %r10
	movq %r10, -3480(%rbp)
	movq -3584(%rbp), %r10
	movq %r10, -3488(%rbp)
	movq -3592(%rbp), %r10
	movq %r10, -3496(%rbp)
	cmpl $3000, %esi
	jl .LB10052
.LB10053:
	leaq -2008(%rbp), %rsi
	movl $1635140874, -2008(%rbp)
	movl $1952544108, -2004(%rbp)
	movl $543649385, -2000(%rbp)
	movl $2125423, -1996(%rbp)
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -2029(%rbp)
	movl .LZERO+16(%rip), %r10d
	movl %r10d, -2013(%rbp)
	movb .LZERO+20(%rip), %r10b
	movb %r10b, -2009(%rbp)
	leaq -2029(%rbp), %rdx
	movl $20, %ecx
	callq standard__strings__i32str__2__dataE1_sbits32__byteE1_ptr1__ret_dataE1_sbits32
	leaq -2029(%rbp), %rsi
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	leaq -2056(%rbp), %rsi
	movl $1818585120, -2056(%rbp)
	movl $1970220388, -2052(%rbp)
	movl $1702109300, -2048(%rbp)
	movl $1881175155, -2044(%rbp)
	movl $1953393007, -2040(%rbp)
	movl $774778483, -2036(%rbp)
	movw $2570, -2032(%rbp)
	movb $0, -2030(%rbp)
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	movl $801, %ecx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	leaq -456(%rbp), %r8
	leaq -1896(%rbp), %rdx
	movl $2, %r9d
	movq %rax, %rsi
	leaq -664(%rbp), %rax
	movq %rsi, %rcx
	movq %rax, 32(%rsp)
	callq standard__autograd__gt_init__5__GradTensorE1_ptr1__TapeE1_ptr1__floatE1_ptr1__dataE1_ubits64__dataE1_ptr1_ubits64__ret_voidE1
	andb $127, 100(%rsi)
	leaq -1472(%rbp), %rcx
	leaq -1896(%rbp), %rdx
	movq %rsi, %r8
	callq standard__neuralnet__nn_seq_forward__3__SequentialE1_ptr1__standard__autograd__TapeE1_ptr1__standard__autograd__GradTensorE1_ptr1__ret_standard__autograd__GradTensorE1_ptr1
	movq %rax, %rbx
	xorps %xmm0, %xmm0
	xorl %eax, %eax
.LB10181:
	cmpq $20, %rax
	jge .LB10183
.LB10182:
	movq (%rbx), %rcx
	movss (%rcx,%rax,4), %xmm1
	movss %xmm1, -616(%rbp,%rax,4)
	movq (%rbx), %rcx
	movss (%rcx,%rax,4), %xmm1
	movss -536(%rbp,%rax,4), %xmm2
	subss %xmm2, %xmm1
	mulss %xmm1, %xmm1
	addss %xmm1, %xmm0
	incq %rax
	cmpq $20, %rax
	jl .LB10182
.LB10183:
	movl $20, %eax
	leaq -2067(%rbp), %rdi
	movslq %eax, %rax
	xorps %xmm1, %xmm1
	cvtsi2ssq %rax, %xmm1
	movq %rdi, %rcx
	divss %xmm1, %xmm0
	movsd %xmm0, -3504(%rbp)
	movl $1953719636, -2067(%rbp)
	movl $1163087136, -2063(%rbp)
	movw $8250, -2059(%rbp)
	movb $0, -2057(%rbp)
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rdi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	leaq -2323(%rbp), %rax
	movq %rax, %rdi
	xorl %eax, %eax
	movl $256, %ecx
	rep stosb
	leaq -2323(%rbp), %rdx
	movsd -3504(%rbp), %xmm0
	movl $5, %r8d
	callq standard__strings__float2str__3__floatE1__byteE1_ptr1__dataE1_sbits32__ret_dataE1_sbits32
	leaq -2323(%rbp), %rdi
	movq %rdi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rdi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	movw $10, -2325(%rbp)
	leaq -2325(%rbp), %rdi
	movq %rdi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rdi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	leaq -2359(%rbp), %rdi
	movl $538976266, -2359(%rbp)
	movl $538976288, -2355(%rbp)
	movl $538976376, -2351(%rbp)
	movl $538976288, -2347(%rbp)
	movl $1920213024, -2343(%rbp)
	movl $538994037, -2339(%rbp)
	movl $538976288, -2335(%rbp)
	movl $1684370032, -2331(%rbp)
	movw $10, -2327(%rbp)
	movq %rdi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rdi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	leaq -2393(%rbp), %rdi
	movl $757935405, -2393(%rbp)
	movl $757935405, -2389(%rbp)
	movl $757083437, -2385(%rbp)
	movl $757935405, -2381(%rbp)
	movl $757935405, -2377(%rbp)
	movl $757932077, -2373(%rbp)
	movl $757935405, -2369(%rbp)
	movl $757935405, -2365(%rbp)
	movw $10, -2361(%rbp)
	movq %rdi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rdi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	xorl %r12d, %r12d
.LB10306:
	cmpq $8, %r12
	jge .LB10308
.LB10307:
	movss -456(%rbp,%r12,4), %xmm0
	leaq -2649(%rbp), %rax
	movq %rax, %rdi
	xorl %eax, %eax
	movl $256, %ecx
	rep stosb
	leaq -2649(%rbp), %rdx
	movl $5, %r8d
	callq standard__strings__float2str__3__floatE1__byteE1_ptr1__dataE1_sbits32__ret_dataE1_sbits32
	leaq -2649(%rbp), %rdi
	movq %rdi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rdi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	movl $2105376, -2653(%rbp)
	leaq -2653(%rbp), %rdi
	movq %rdi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rdi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	movss -536(%rbp,%r12,4), %xmm0
	leaq -2909(%rbp), %rax
	movq %rax, %rdi
	xorl %eax, %eax
	movl $256, %ecx
	rep stosb
	leaq -2909(%rbp), %rdx
	movl $5, %r8d
	callq standard__strings__float2str__3__floatE1__byteE1_ptr1__dataE1_sbits32__ret_dataE1_sbits32
	leaq -2909(%rbp), %rdi
	movq %rdi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rdi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	movl $2105376, -2913(%rbp)
	leaq -2913(%rbp), %rdi
	movq %rdi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rdi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	movss -616(%rbp,%r12,4), %xmm0
	leaq -3169(%rbp), %rax
	movq %rax, %rdi
	xorl %eax, %eax
	movl $256, %ecx
	rep stosb
	leaq -3169(%rbp), %rdx
	movl $5, %r8d
	callq standard__strings__float2str__3__floatE1__byteE1_ptr1__dataE1_sbits32__ret_dataE1_sbits32
	leaq -3169(%rbp), %rdi
	movq %rdi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rdi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	movw $10, -3171(%rbp)
	leaq -3171(%rbp), %rdi
	movq %rdi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rdi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	incq %r12
	cmpq $8, %r12
	jl .LB10307
.LB10308:
	leaq -536(%rbp), %rcx
	leaq -616(%rbp), %rdx
	movl $20, %r8d
	callq plot_results__3__floatE1_ptr1__floatE1_ptr1__intE1__ret_voidE1
	movq %rbx, %rcx
	callq standard__autograd__gt_free__1__GradTensorE1_ptr1__ret_voidE1
	movq %rbx, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movq %rsi, %rcx
	callq standard__autograd__gt_free__1__GradTensorE1_ptr1__ret_voidE1
	movq %rsi, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	leaq -1472(%rbp), %rcx
	callq standard__neuralnet__nn_seq_free_intermediates__1__SequentialE1_ptr1__ret_voidE1
	movq -1896(%rbp), %rax
	movl -1884(%rbp), %ecx
	movq %rcx, %r8
	shlq $10, %r8
	movq %rax, %rcx
	xorl %edx, %edx
	callq memset
	movl $0, -1888(%rbp)
	leaq -1880(%rbp), %rcx
	callq standard__neuralnet__adam_free__1__AdamE1_ptr1__ret_voidE1
	leaq -1472(%rbp), %rcx
	callq standard__neuralnet__nn_seq_free__1__SequentialE1_ptr1__ret_voidE1
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
.LB10093:
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -3192(%rbp)
	movl .LZERO+16(%rip), %r10d
	movl %r10d, -3176(%rbp)
	movb .LZERO+20(%rip), %r10b
	movb %r10b, -3172(%rbp)
	leaq -3192(%rbp), %rdx
	movq %rsi, %rcx
	callq standard__strings__i32str__2__dataE1_sbits32__byteE1_ptr1__ret_dataE1_sbits32
	leaq -3192(%rbp), %rbx
	movq %rbx, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rdx, -3600(%rbp)
	movq %rbx, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	movl $538976288, -3199(%rbp)
	movw $8224, -3195(%rbp)
	movb $0, -3193(%rbp)
	leaq -3199(%rbp), %r12
	movq %r12, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rdx, -3608(%rbp)
	movq %r12, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	leaq -3455(%rbp), %rax
	movq %rax, %rdi
	xorl %eax, %eax
	movl $256, %ecx
	rep stosb
	leaq -3455(%rbp), %rdx
	movsd -3536(%rbp), %xmm0
	movl $5, %r8d
	callq standard__strings__float2str__3__floatE1__byteE1_ptr1__dataE1_sbits32__ret_dataE1_sbits32
	leaq -3455(%rbp), %rdi
	movq %rdi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rdx, -3616(%rbp)
	movq %rdi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	movw $10, -3457(%rbp)
	leaq -3457(%rbp), %rcx
	movq %rcx, -3624(%rbp)
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rdx, -3632(%rbp)
	movq -3624(%rbp), %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	movq %r12, -3544(%rbp)
	movq -3608(%rbp), %r10
	movq %r10, -3552(%rbp)
	movq -3536(%rbp), %r10
	movq %r10, -3560(%rbp)
	movq %rdi, -3568(%rbp)
	movq -3616(%rbp), %r10
	movq %r10, -3576(%rbp)
	movq -3624(%rbp), %r10
	movq %r10, -3584(%rbp)
	movq -3632(%rbp), %r10
	movq %r10, -3592(%rbp)
	movq %rsi, %rdi
	movq -3600(%rbp), %r12
	jmp .LB10095
.LB9913:
	xorps %xmm1, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subss %xmm15, %xmm0
	jmp .LB9915
.LB9884:
	xorps %xmm1, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subss %xmm15, %xmm0
	jmp .LB9886
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
.LB10344:
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
.LB4205:
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
.LB4224:
	movslq %eax, %rcx
	cmpw $0, (%rsi,%rcx,2)
	je .LB4226
.LB4225:
.LB4233:
	movslq %eax, %rcx
	movzwl (%rsi,%rcx,2), %ecx
	cmpw $32, %cx
	je .LB4234
.LB4242:
	cmpw $9, %cx
	jne .LB4235
.LB4234:
	incl %eax
	jmp .LB4233
.LB4235:
	testw %cx, %cx
	je .LB4226
.LB4260:
	cmpw $34, %cx
	je .LB4268
.LB4269:
.LB4304:
	movslq %eax, %rcx
	movzwl (%rsi,%rcx,2), %ecx
	testw %cx, %cx
	je .LB4306
.LB4313:
	cmpw $32, %cx
	je .LB4306
.LB4322:
	cmpw $9, %cx
	je .LB4306
.LB4305:
	incl %eax
	jmp .LB4304
.LB4306:
.LB4270:
	incl %edi
	jmp .LB4224
.LB4268:
	incl %eax
.LB4273:
	movslq %eax, %rcx
	movzwl (%rsi,%rcx,2), %ecx
	testw %cx, %cx
	je .LB4275
.LB4282:
	cmpw $34, %cx
	je .LB4275
.LB4274:
	incl %eax
	jmp .LB4273
.LB4275:
	leal 1(%rax), %ecx
	movslq %eax, %rdx
	cmpw $34, (%rsi,%rdx,2)
	cmove %ecx, %eax
	jmp .LB4270
.LB4226:
	movq %rdi, %rcx
	shlq $3, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, %rbx
	xorl %r12d, %r12d
	xorl %eax, %eax
	xorl %ecx, %ecx
.LB4341:
	movslq %eax, %rdx
	cmpw $0, (%rsi,%rdx,2)
	je .LB4343
.LB4342:
.LB4350:
	movslq %eax, %rdx
	movzwl (%rsi,%rdx,2), %edx
	cmpw $32, %dx
	je .LB4351
.LB4359:
	cmpw $9, %dx
	jne .LB4352
.LB4351:
	incl %eax
	jmp .LB4350
.LB4352:
	testw %dx, %dx
	je .LB4343
.LB4377:
	cmpw $34, %dx
	je .LB4386
.LB4387:
	movq %rax, %rdx
	xorl %r8d, %r8d
.LB4425:
	movslq %edx, %r9
	movzwl (%rsi,%r9,2), %r9d
	testw %r9w, %r9w
	je .LB4427
.LB4434:
	cmpw $32, %r9w
	je .LB4427
.LB4443:
	cmpw $9, %r9w
	je .LB4427
.LB4426:
	incl %r8d
	incl %edx
	jmp .LB4425
.LB4427:
	movq %rdx, %r13
	movq %rax, %r14
	movq %r8, %r15
	movq %rcx, -80(%rbp)
.LB4388:
	leaq 1(%r15), %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	xorl %ecx, %ecx
	testl %r15d, %r15d
	cmovg %r15d, %ecx
	shrl $2, %ecx
	xorl %edx, %edx
.LB10700:
	testl %ecx, %ecx
	je .LB10702
.LB10701:
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
	jne .LB10701
	jmp .LB10702
.LB4386:
	incl %eax
	movq %rax, %rcx
	xorl %r15d, %r15d
.LB4392:
	movslq %ecx, %rdx
	movzwl (%rsi,%rdx,2), %edx
	testw %dx, %dx
	je .LB4394
.LB4401:
	cmpw $34, %dx
	je .LB4394
.LB4393:
	incl %r15d
	incl %ecx
	jmp .LB4392
.LB4394:
	leal 1(%rcx), %edx
	movslq %ecx, %r8
	cmpw $34, (%rsi,%r8,2)
	movl %ecx, %r13d
	cmove %edx, %r13d
	movq %rax, %r14
	movq $1, -80(%rbp)
	jmp .LB4388
.LB10702:
.LB4462:
	cmpl %r15d, %edx
	jge .LB4464
.LB4463:
	leal (%r14,%rdx), %ecx
	movslq %ecx, %rcx
	movzwl (%rsi,%rcx,2), %ecx
	movslq %edx, %r8
	movb %cl, (%rax,%r8,1)
	incl %edx
	cmpl %r15d, %edx
	jl .LB4463
.LB4464:
	movslq %r15d, %rcx
	movb $0, (%rax,%rcx,1)
	movslq %r12d, %rcx
	movq %rax, (%rbx,%rcx,8)
	incl %r12d
	movq %r13, %rax
	movq -80(%rbp), %rcx
	jmp .LB4341
.LB4343:
	cmpl $1, %edi
	jg .LB4492
.LB4493:
	callq main__0__ret_intE1
	movq %rax, %rsi
.LB4494:
	movslq %edi, %rdi
	xorl %r12d, %r12d
.LB4499:
	cmpq %rdi, %r12
	jge .LB4501
.LB4500:
	movq (%rbx,%r12,8), %rax
	movq %rax, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	incq %r12
	cmpq %rdi, %r12
	jl .LB4500
	jmp .LB4501
.LB4492:
	callq main__0__ret_intE1
	movl %eax, %esi
	jmp .LB4494
.LB4501:
	testl %esi, %esi
	jne .LB4514
.LB4516:
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
.LB4514:
	cmpl $3221225477, %esi
	jne .LB4516
.LB4520:
	movl $1179075923, -66(%rbp)
	movl $1414288705, -62(%rbp)
	movw $10, -58(%rbp)
	leaq -66(%rbp), %rdi
	movq %rdi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rdi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	jmp .LB4516
	.text
	.globl __chkstk
	.def __chkstk;
	.scl 2;
	.type 32;
	.endef
__chkstk:
.LB4204:
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
	.globl standard__math__min__2__dataE1_sbits8__dataE1_sbits8__ret_dataE1_sbits8
	.def standard__math__min__2__dataE1_sbits8__dataE1_sbits8__ret_dataE1_sbits8;
	.scl 2;
	.type 32;
	.endef
standard__math__min__2__dataE1_sbits8__dataE1_sbits8__ret_dataE1_sbits8:
.LB4539:
	cmpb %dl, %cl
	jl .LB4545
.LB4546:
	movzbl %dl, %eax
	ret
.LB4545:
	movzbl %cl, %eax
	ret
	.text
	.globl standard__math__min__2__dataE1_sbits16__dataE1_sbits16__ret_dataE1_sbits16
	.def standard__math__min__2__dataE1_sbits16__dataE1_sbits16__ret_dataE1_sbits16;
	.scl 2;
	.type 32;
	.endef
standard__math__min__2__dataE1_sbits16__dataE1_sbits16__ret_dataE1_sbits16:
.LB4550:
	cmpw %dx, %cx
	jl .LB4556
.LB4557:
	movzwl %dx, %eax
	ret
.LB4556:
	movzwl %cx, %eax
	ret
	.text
	.globl standard__math__min__2__dataE1_sbits32__dataE1_sbits32__ret_dataE1_sbits32
	.def standard__math__min__2__dataE1_sbits32__dataE1_sbits32__ret_dataE1_sbits32;
	.scl 2;
	.type 32;
	.endef
standard__math__min__2__dataE1_sbits32__dataE1_sbits32__ret_dataE1_sbits32:
.LB4561:
	cmpl %edx, %ecx
	jl .LB4567
.LB4568:
	movl %edx, %eax
	ret
.LB4567:
	movl %ecx, %eax
	ret
	.text
	.globl standard__math__min__2__dataE1_sbits64__dataE1_sbits64__ret_dataE1_sbits64
	.def standard__math__min__2__dataE1_sbits64__dataE1_sbits64__ret_dataE1_sbits64;
	.scl 2;
	.type 32;
	.endef
standard__math__min__2__dataE1_sbits64__dataE1_sbits64__ret_dataE1_sbits64:
.LB4572:
	cmpq %rdx, %rcx
	jl .LB4578
.LB4579:
	movq %rdx, %rax
	ret
.LB4578:
	movq %rcx, %rax
	ret
	.text
	.globl standard__math__min__2__floatE1__floatE1__ret_floatE1
	.def standard__math__min__2__floatE1__floatE1__ret_floatE1;
	.scl 2;
	.type 32;
	.endef
standard__math__min__2__floatE1__floatE1__ret_floatE1:
.LB4583:
	ucomiss %xmm0, %xmm1
	ja .LB4589
.LB4590:
	movaps %xmm1, %xmm0
	ret
.LB4589:
	ret
	.text
	.globl standard__math__min__2__doubleE1__doubleE1__ret_doubleE1
	.def standard__math__min__2__doubleE1__doubleE1__ret_doubleE1;
	.scl 2;
	.type 32;
	.endef
standard__math__min__2__doubleE1__doubleE1__ret_doubleE1:
.LB4594:
	ucomisd %xmm0, %xmm1
	ja .LB4600
.LB4601:
	movaps %xmm1, %xmm0
	ret
.LB4600:
	ret
	.text
	.globl standard__math__max__2__dataE1_sbits8__dataE1_sbits8__ret_dataE1_sbits8
	.def standard__math__max__2__dataE1_sbits8__dataE1_sbits8__ret_dataE1_sbits8;
	.scl 2;
	.type 32;
	.endef
standard__math__max__2__dataE1_sbits8__dataE1_sbits8__ret_dataE1_sbits8:
.LB4605:
	cmpb %dl, %cl
	jg .LB4611
.LB4612:
	movzbl %dl, %eax
	ret
.LB4611:
	movzbl %cl, %eax
	ret
	.text
	.globl standard__math__max__2__dataE1_sbits16__dataE1_sbits16__ret_dataE1_sbits16
	.def standard__math__max__2__dataE1_sbits16__dataE1_sbits16__ret_dataE1_sbits16;
	.scl 2;
	.type 32;
	.endef
standard__math__max__2__dataE1_sbits16__dataE1_sbits16__ret_dataE1_sbits16:
.LB4616:
	cmpw %dx, %cx
	jg .LB4622
.LB4623:
	movzwl %dx, %eax
	ret
.LB4622:
	movzwl %cx, %eax
	ret
	.text
	.globl standard__math__max__2__dataE1_sbits32__dataE1_sbits32__ret_dataE1_sbits32
	.def standard__math__max__2__dataE1_sbits32__dataE1_sbits32__ret_dataE1_sbits32;
	.scl 2;
	.type 32;
	.endef
standard__math__max__2__dataE1_sbits32__dataE1_sbits32__ret_dataE1_sbits32:
.LB4627:
	cmpl %edx, %ecx
	jg .LB4633
.LB4634:
	movl %edx, %eax
	ret
.LB4633:
	movl %ecx, %eax
	ret
	.text
	.globl standard__math__max__2__dataE1_sbits64__dataE1_sbits64__ret_dataE1_sbits64
	.def standard__math__max__2__dataE1_sbits64__dataE1_sbits64__ret_dataE1_sbits64;
	.scl 2;
	.type 32;
	.endef
standard__math__max__2__dataE1_sbits64__dataE1_sbits64__ret_dataE1_sbits64:
.LB4638:
	cmpq %rdx, %rcx
	jg .LB4644
.LB4645:
	movq %rdx, %rax
	ret
.LB4644:
	movq %rcx, %rax
	ret
	.text
	.globl standard__math__max__2__floatE1__floatE1__ret_floatE1
	.def standard__math__max__2__floatE1__floatE1__ret_floatE1;
	.scl 2;
	.type 32;
	.endef
standard__math__max__2__floatE1__floatE1__ret_floatE1:
.LB4649:
	ucomiss %xmm1, %xmm0
	ja .LB4655
.LB4656:
	movaps %xmm1, %xmm0
	ret
.LB4655:
	ret
	.text
	.globl standard__math__max__2__doubleE1__doubleE1__ret_doubleE1
	.def standard__math__max__2__doubleE1__doubleE1__ret_doubleE1;
	.scl 2;
	.type 32;
	.endef
standard__math__max__2__doubleE1__doubleE1__ret_doubleE1:
.LB4660:
	ucomisd %xmm1, %xmm0
	ja .LB4666
.LB4667:
	movaps %xmm1, %xmm0
	ret
.LB4666:
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
.LB4671:
	movsbl %cl, %eax
	testb %cl, %cl
	jle .LB4676
.LB4677:
	cmpb $1, %cl
	je .LB4683
.LB4684:
	movl %eax, %edx
	sarl $31, %edx
	movl %eax, %edx
	shrl $31, %edx
	addl %edx, %eax
	sarl $1, %eax
	movq %rax, %rsi
	movq %rcx, %rax
.LB4694:
	cmpb %al, %sil
	je .LB4696
.LB4700:
	cmpb %al, %sil
	jge .LB4696
.LB4695:
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
	jne .LB4700
.LB4696:
	movzbl %sil, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB4683:
	movl $1, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB4676:
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
.LB4716:
	movswl %cx, %eax
	testw %cx, %cx
	jle .LB4721
.LB4722:
	cmpw $1, %cx
	je .LB4728
.LB4729:
	movl %eax, %edx
	sarl $31, %edx
	movl %eax, %edx
	shrl $31, %edx
	addl %edx, %eax
	sarl $1, %eax
	movq %rax, %rsi
	movq %rcx, %rax
.LB4739:
	cmpw %ax, %si
	je .LB4741
.LB4745:
	cmpw %ax, %si
	jge .LB4741
.LB4740:
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
	jne .LB4745
.LB4741:
	movzwl %si, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB4728:
	movl $1, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB4721:
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
.LB4761:
	testl %ecx, %ecx
	jle .LB4765
.LB4766:
	movl %ecx, %eax
	sarl $31, %eax
	movl %ecx, %eax
	shrl $31, %eax
	addl %ecx, %eax
	sarl $1, %eax
	movq %rax, %rsi
	movq %rcx, %rax
.LB4773:
	cmpl %eax, %esi
	je .LB4775
.LB4779:
	cmpl %eax, %esi
	jge .LB4775
.LB4774:
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
	jne .LB4779
.LB4775:
	movl %esi, %eax
	movq 0(%rsp), %rsi
	addq $16, %rsp
	ret
.LB4765:
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
.LB4793:
	testq %rcx, %rcx
	jle .LB4798
.LB4799:
	cmpq $1, %rcx
	je .LB4805
.LB4806:
	movl $2, %esi
	movq %rcx, %rax
	cqto
	idivq %rsi
	movq %rax, %rsi
	movq %rcx, %rax
.LB4815:
	cmpq %rax, %rsi
	je .LB4817
.LB4821:
	cmpq %rax, %rsi
	jge .LB4817
.LB4816:
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
	jne .LB4821
.LB4817:
	movq %rsi, %rax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB4805:
	movl $1, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB4798:
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
.LB4836:
	testb %cl, %cl
	jbe .LB4841
.LB4842:
	movq %rcx, %rsi
	xorl %eax, %eax
.LB4848:
	cmpb %al, %sil
	je .LB4850
.LB4849:
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
	jne .LB4849
.LB4850:
	movzbl %sil, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB4841:
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
.LB4864:
	testw %cx, %cx
	jbe .LB4869
.LB4870:
	movq %rcx, %rsi
	xorl %eax, %eax
.LB4876:
	cmpw %ax, %si
	je .LB4878
.LB4877:
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
	jne .LB4877
.LB4878:
	movzwl %si, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB4869:
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
.LB4892:
	testl %ecx, %ecx
	jbe .LB4896
.LB4897:
	movq %rcx, %rsi
	xorl %eax, %eax
.LB4902:
	cmpl %eax, %esi
	je .LB4904
.LB4903:
	movl %ecx, %eax
	xorl %edx, %edx
	divl %esi
	addl %esi, %eax
	shrl $1, %eax
	movq %rsi, %r11
	movq %rax, %rsi
	movq %r11, %rax
	cmpl %eax, %esi
	jne .LB4903
.LB4904:
	movl %esi, %eax
	movq 0(%rsp), %rsi
	addq $16, %rsp
	ret
.LB4896:
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
.LB4916:
	testq %rcx, %rcx
	jbe .LB4921
.LB4922:
	movq %rcx, %rsi
	xorl %eax, %eax
.LB4928:
	cmpq %rax, %rsi
	je .LB4930
.LB4929:
	movq %rcx, %rax
	xorl %edx, %edx
	divq %rsi
	addq %rsi, %rax
	shrq $1, %rax
	movq %rsi, %r11
	movq %rax, %rsi
	movq %r11, %rax
	cmpq %rax, %rsi
	jne .LB4929
.LB4930:
	movq %rsi, %rax
	movq 0(%rsp), %rsi
	addq $16, %rsp
	ret
.LB4921:
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
.LB4943:
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
.LB4949:
	movaps %xmm0, %xmm1
	sqrtsd %xmm1, %xmm0
	ret
	.text
	.globl standard__math___sin_kernel__1__doubleE1__ret_doubleE1
	.def standard__math___sin_kernel__1__doubleE1__ret_doubleE1;
	.scl 2;
	.type 32;
	.endef
standard__math___sin_kernel__1__doubleE1__ret_doubleE1:
	subq $32, %rsp
.LB4955:
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
.LB4988:
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
.LB5020:
	xorps %xmm1, %xmm1
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm0, %xmm1
	ja .LB5026
.LB5027:
.LB5028:
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
.LB5026:
	xorps %xmm1, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subsd %xmm15, %xmm0
	jmp .LB5028
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
.LB5057:
	movl $0, -4(%rbp)
	xorps %xmm1, %xmm1
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm0, %xmm1
	ja .LB5064
.LB5065:
.LB5066:
	movabsq $1061752795, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm0, %xmm1
	jae .LB5072
.LB5073:
	leaq -4(%rbp), %rdx
	callq standard__math___trig_reduce__2__doubleE1__dataE1_ptr1_sbits32__ret_doubleE1
	movl -4(%rbp), %eax
	andl $3, %eax
	je .LB5082
	cmpl $1, %eax
	je .LB5083
	cmpl $2, %eax
	jne .LB5085
.LB5084:
	callq standard__math___cos_kernel__1__doubleE1__ret_doubleE1
	xorps %xmm1, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subsd %xmm15, %xmm0
	leave
	ret
.LB5064:
	xorps %xmm1, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subsd %xmm15, %xmm0
	jmp .LB5066
.LB5083:
	callq standard__math___sin_kernel__1__doubleE1__ret_doubleE1
	xorps %xmm1, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subsd %xmm15, %xmm0
	leave
	ret
.LB5082:
	callq standard__math___cos_kernel__1__doubleE1__ret_doubleE1
	leave
	ret
.LB5085:
	callq standard__math___sin_kernel__1__doubleE1__ret_doubleE1
	leave
	ret
.LB5072:
	callq standard__math___cos_kernel__1__doubleE1__ret_doubleE1
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
.LB5097:
	cvtss2sd %xmm0, %xmm0
	callq standard__math__cos__1__doubleE1__ret_doubleE1
	cvtsd2ss %xmm0, %xmm0
	leave
	ret
	.text
	.globl standard__math__exp__1__floatE1__ret_floatE1
	.def standard__math__exp__1__floatE1__ret_floatE1;
	.scl 2;
	.type 32;
	.endef
standard__math__exp__1__floatE1__ret_floatE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB5258:
	cvtss2sd %xmm0, %xmm0
	callq standard__math__exp__1__doubleE1__ret_doubleE1
	cvtsd2ss %xmm0, %xmm0
	leave
	ret
	.text
	.globl standard__math__exp__1__doubleE1__ret_doubleE1
	.def standard__math__exp__1__doubleE1__ret_doubleE1;
	.scl 2;
	.type 32;
	.endef
standard__math__exp__1__doubleE1__ret_doubleE1:
	subq $16, %rsp
.LB5128:
	movabsq $1144091160, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm1, %xmm0
	ja .LB5133
.LB5134:
	xorps %xmm1, %xmm1
	movabsq $1144670343, %r10
	movq %r10, %xmm2
	subss %xmm2, %xmm1
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm0, %xmm1
	ja .LB5140
.LB5141:
	movabsq $1069066811, %r10
	movq %r10, %xmm2
	xorps %xmm3, %xmm3
	movabsq $1060205080, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	cvtss2sd %xmm2, %xmm2
	cvtss2sd %xmm3, %xmm3
	mulsd %xmm0, %xmm2
	ucomisd %xmm3, %xmm2
	jae .LB5157
.LB5158:
	movabsq $1056964608, %r10
	movq %r10, %xmm3
	cvtss2sd %xmm3, %xmm3
	subsd %xmm3, %xmm2
	cvttsd2siq %xmm2, %rax
	movl %eax, %eax
.LB5159:
	movslq %eax, %rcx
	movabsq $4519165668962417596, %r10
	movq %r10, %xmm3
	xorps %xmm2, %xmm2
	cvtsi2sdq %rcx, %xmm2
	vfnmadd231sd %xmm2, %xmm1, %xmm0
	movabsq $4461442080421002358, %r10
	movq %r10, %xmm1
	vfnmadd231sd %xmm2, %xmm1, %xmm0
	movabsq $4493081048671427931, %r10
	movq %r10, %xmm2
	movaps %xmm0, %xmm1
	mulsd %xmm0, %xmm1
	vfmadd132sd %xmm1, %xmm3, %xmm2
	movabsq $950977342, %r10
	movq %r10, %xmm3
	cvtss2sd %xmm3, %xmm3
	vfmadd132sd %xmm1, %xmm3, %xmm2
	movabsq $998803593, %r10
	movq %r10, %xmm3
	cvtss2sd %xmm3, %xmm3
	vfmadd132sd %xmm1, %xmm3, %xmm2
	movabsq $1042983595, %r10
	movq %r10, %xmm3
	cvtss2sd %xmm3, %xmm3
	vfmadd132sd %xmm1, %xmm3, %xmm2
	movabsq $1065353216, %r10
	movq %r10, %xmm3
	cvtss2sd %xmm3, %xmm3
	vfmadd132sd %xmm2, %xmm3, %xmm1
	movabsq $1073741824, %r10
	movq %r10, %xmm3
	cvtss2sd %xmm3, %xmm3
	mulsd %xmm0, %xmm1
	movaps %xmm0, %xmm2
	mulsd %xmm1, %xmm2
	movaps %xmm1, %xmm15
	movaps %xmm3, %xmm1
	subsd %xmm15, %xmm1
	movaps %xmm1, %xmm15
	movaps %xmm2, %xmm1
	divsd %xmm15, %xmm1
	addsd %xmm1, %xmm0
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	addsd %xmm1, %xmm0
	movsd %xmm0, (%rsp)
	testl %eax, %eax
	je .LB5221
.LB5222:
	movq $0, -8(%rsp)
	leaq (%rsp), %rcx
	movq (%rcx), %rcx
	movq %rcx, -8(%rsp)
	shrq $52, %rcx
	andq $2047, %rcx
	movslq %eax, %rax
	addq %rax, %rcx
	testq %rcx, %rcx
	jle .LB5240
.LB5241:
	cmpq $2047, %rcx
	jge .LB5247
.LB5248:
	movq -8(%rsp), %rax
	movabsq $-9218868437227405313, %rdx
	andq %rdx, %rax
	shlq $52, %rcx
	orq %rcx, %rax
	movq %rax, -8(%rsp)
	leaq -8(%rsp), %rax
	movsd (%rax), %xmm0
	addq $16, %rsp
	ret
.LB5157:
	movabsq $1056964608, %r10
	movq %r10, %xmm3
	cvtss2sd %xmm3, %xmm3
	addsd %xmm3, %xmm2
	cvttsd2siq %xmm2, %rax
	movl %eax, %eax
	jmp .LB5159
.LB5247:
	movabsq $9218868437227405311, %r10
	movq %r10, %xmm0
	addq $16, %rsp
	ret
.LB5240:
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	addq $16, %rsp
	ret
.LB5221:
	addq $16, %rsp
	ret
.LB5140:
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	addq $16, %rsp
	ret
.LB5133:
	movabsq $9218868437227405311, %r10
	movq %r10, %xmm0
	addq $16, %rsp
	ret
	.text
	.globl standard__math__log__1__floatE1__ret_floatE1
	.def standard__math__log__1__floatE1__ret_floatE1;
	.scl 2;
	.type 32;
	.endef
standard__math__log__1__floatE1__ret_floatE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB5381:
	cvtss2sd %xmm0, %xmm0
	callq standard__math__log__1__doubleE1__ret_doubleE1
	cvtsd2ss %xmm0, %xmm0
	leave
	ret
	.text
	.globl standard__math__log__1__doubleE1__ret_doubleE1
	.def standard__math__log__1__doubleE1__ret_doubleE1;
	.scl 2;
	.type 32;
	.endef
standard__math__log__1__doubleE1__ret_doubleE1:
	subq $16, %rsp
.LB5264:
	xorps %xmm1, %xmm1
	movsd %xmm0, (%rsp)
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm0, %xmm1
	jae .LB5269
.LB5270:
	leaq (%rsp), %rax
	movabsq $-9218868437227405313, %rdx
	movabsq $1060439283, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	movq (%rax), %rax
	movq %rax, -8(%rsp)
	movq %rax, %rcx
	shrq $52, %rcx
	andq $2047, %rcx
	subl $1023, %ecx
	andq %rdx, %rax
	movabsq $4607182418800017408, %rdx
	orq %rdx, %rax
	movq %rax, -8(%rsp)
	leaq -8(%rsp), %rax
	movsd (%rax), %xmm0
	ucomisd %xmm0, %xmm1
	ja .LB5293
.LB5294:
.LB5295:
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	movabsq $1065353216, %r10
	movq %r10, %xmm2
	movabsq $1041278143, %r10
	movq %r10, %xmm3
	movabsq $1044000396, %r10
	movq %r10, %xmm4
	movabsq $1046711863, %r10
	movq %r10, %xmm5
	movslq %ecx, %rax
	cvtss2sd %xmm1, %xmm1
	cvtss2sd %xmm2, %xmm2
	cvtss2sd %xmm3, %xmm3
	cvtss2sd %xmm4, %xmm4
	cvtss2sd %xmm5, %xmm5
	movaps %xmm1, %xmm15
	movaps %xmm0, %xmm1
	subsd %xmm15, %xmm1
	addsd %xmm2, %xmm0
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	divsd %xmm15, %xmm0
	movaps %xmm0, %xmm1
	mulsd %xmm0, %xmm1
	movaps %xmm1, %xmm2
	mulsd %xmm1, %xmm2
	vfmadd132sd %xmm2, %xmm4, %xmm3
	movabsq $1049774373, %r10
	movq %r10, %xmm4
	cvtss2sd %xmm4, %xmm4
	vfmadd132sd %xmm2, %xmm4, %xmm3
	movabsq $1059760811, %r10
	movq %r10, %xmm4
	cvtss2sd %xmm4, %xmm4
	vfmadd132sd %xmm2, %xmm4, %xmm3
	movabsq $1042123230, %r10
	movq %r10, %xmm4
	cvtss2sd %xmm4, %xmm4
	vfmadd132sd %xmm2, %xmm5, %xmm4
	movabsq $1053609165, %r10
	movq %r10, %xmm5
	cvtss2sd %xmm5, %xmm5
	vfmadd132sd %xmm2, %xmm5, %xmm4
	mulsd %xmm3, %xmm2
	movabsq $1065353216, %r10
	movq %r10, %xmm3
	cvtss2sd %xmm3, %xmm3
	vfmadd132sd %xmm4, %xmm2, %xmm1
	movabsq $1056964608, %r10
	movq %r10, %xmm2
	movabsq $4461442080421002358, %r10
	movq %r10, %xmm4
	cvtss2sd %xmm2, %xmm2
	mulsd %xmm0, %xmm2
	vfnmadd132sd %xmm0, %xmm3, %xmm2
	xorps %xmm3, %xmm3
	cvtsi2sdq %rax, %xmm3
	addsd %xmm2, %xmm1
	movabsq $1060205080, %r10
	movq %r10, %xmm2
	mulsd %xmm3, %xmm4
	cvtss2sd %xmm2, %xmm2
	mulsd %xmm1, %xmm0
	movabsq $1073741824, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	vfmadd132sd %xmm1, %xmm4, %xmm0
	vfmadd231sd %xmm3, %xmm2, %xmm0
	addq $16, %rsp
	ret
.LB5293:
	movabsq $1073741824, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	mulsd %xmm1, %xmm0
	decl %ecx
	jmp .LB5295
.LB5269:
	xorps %xmm0, %xmm0
	movabsq $9218868437227405311, %r10
	movq %r10, %xmm1
	subsd %xmm1, %xmm0
	addq $16, %rsp
	ret
	.text
	.globl standard__math__tanh__1__floatE1__ret_floatE1
	.def standard__math__tanh__1__floatE1__ret_floatE1;
	.scl 2;
	.type 32;
	.endef
standard__math__tanh__1__floatE1__ret_floatE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB5103:
	movabsq $1073741824, %r10
	movq %r10, %xmm1
	mulss %xmm1, %xmm0
	cvtss2sd %xmm0, %xmm0
	callq standard__math__exp__1__doubleE1__ret_doubleE1
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	movabsq $1065353216, %r10
	movq %r10, %xmm2
	cvtsd2ss %xmm0, %xmm0
	movaps %xmm1, %xmm15
	movaps %xmm0, %xmm1
	subss %xmm15, %xmm1
	addss %xmm2, %xmm0
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	divss %xmm15, %xmm0
	leave
	ret
	.text
	.globl standard__math__tanh__1__doubleE1__ret_doubleE1
	.def standard__math__tanh__1__doubleE1__ret_doubleE1;
	.scl 2;
	.type 32;
	.endef
standard__math__tanh__1__doubleE1__ret_doubleE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB5114:
	movabsq $1073741824, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	mulsd %xmm1, %xmm0
	callq standard__math__exp__1__doubleE1__ret_doubleE1
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	movabsq $1065353216, %r10
	movq %r10, %xmm2
	cvtss2sd %xmm1, %xmm1
	cvtss2sd %xmm2, %xmm2
	movaps %xmm1, %xmm15
	movaps %xmm0, %xmm1
	subsd %xmm15, %xmm1
	addsd %xmm2, %xmm0
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	divsd %xmm15, %xmm0
	leave
	ret
	.text
	.globl standard__math__step__2__floatE1__floatE1__ret_floatE1
	.def standard__math__step__2__floatE1__floatE1__ret_floatE1;
	.scl 2;
	.type 32;
	.endef
standard__math__step__2__floatE1__floatE1__ret_floatE1:
.LB5387:
	ucomiss %xmm0, %xmm1
	jae .LB5393
.LB5394:
	xorps %xmm0, %xmm0
	ret
.LB5393:
	movabsq $1065353216, %r10
	movq %r10, %xmm0
	ret
	.text
	.globl standard__math__step__2__doubleE1__doubleE1__ret_doubleE1
	.def standard__math__step__2__doubleE1__doubleE1__ret_doubleE1;
	.scl 2;
	.type 32;
	.endef
standard__math__step__2__doubleE1__doubleE1__ret_doubleE1:
.LB5397:
	ucomisd %xmm0, %xmm1
	jae .LB5403
.LB5404:
	xorps %xmm0, %xmm0
.LB5405:
	cvtss2sd %xmm0, %xmm0
	ret
.LB5403:
	movabsq $1065353216, %r10
	movq %r10, %xmm0
	jmp .LB5405
	.text
	.globl standard__math__sign__1__dataE1_sbits8__ret_dataE1_sbits8
	.def standard__math__sign__1__dataE1_sbits8__ret_dataE1_sbits8;
	.scl 2;
	.type 32;
	.endef
standard__math__sign__1__dataE1_sbits8__ret_dataE1_sbits8:
.LB5408:
	testb %cl, %cl
	jg .LB5413
.LB5414:
	testb %cl, %cl
	js .LB5420
.LB5421:
	xorl %eax, %eax
	ret
.LB5420:
	movl $255, %eax
	ret
.LB5413:
	movl $1, %eax
	ret
	.text
	.globl standard__math__sign__1__dataE1_sbits16__ret_dataE1_sbits16
	.def standard__math__sign__1__dataE1_sbits16__ret_dataE1_sbits16;
	.scl 2;
	.type 32;
	.endef
standard__math__sign__1__dataE1_sbits16__ret_dataE1_sbits16:
.LB5426:
	testw %cx, %cx
	jg .LB5431
.LB5432:
	testw %cx, %cx
	js .LB5438
.LB5439:
	xorl %eax, %eax
	ret
.LB5438:
	movl $65535, %eax
	ret
.LB5431:
	movl $1, %eax
	ret
	.text
	.globl standard__math__sign__1__dataE1_sbits32__ret_dataE1_sbits32
	.def standard__math__sign__1__dataE1_sbits32__ret_dataE1_sbits32;
	.scl 2;
	.type 32;
	.endef
standard__math__sign__1__dataE1_sbits32__ret_dataE1_sbits32:
.LB5444:
	testl %ecx, %ecx
	jg .LB5448
.LB5449:
	testl %ecx, %ecx
	js .LB5453
.LB5454:
	xorl %eax, %eax
	ret
.LB5453:
	movabsq $4294967295, %rax
	ret
.LB5448:
	movl $1, %eax
	ret
	.text
	.globl standard__math__sign__1__dataE1_sbits64__ret_dataE1_sbits64
	.def standard__math__sign__1__dataE1_sbits64__ret_dataE1_sbits64;
	.scl 2;
	.type 32;
	.endef
standard__math__sign__1__dataE1_sbits64__ret_dataE1_sbits64:
.LB5457:
	testq %rcx, %rcx
	jg .LB5462
.LB5463:
	testq %rcx, %rcx
	js .LB5469
.LB5470:
	xorl %eax, %eax
	ret
.LB5469:
	movq $-1, %rax
	ret
.LB5462:
	movl $1, %eax
	ret
	.text
	.globl standard__math__sign__1__floatE1__ret_floatE1
	.def standard__math__sign__1__floatE1__ret_floatE1;
	.scl 2;
	.type 32;
	.endef
standard__math__sign__1__floatE1__ret_floatE1:
.LB5475:
	xorps %xmm1, %xmm1
	ucomiss %xmm1, %xmm0
	ja .LB5479
.LB5480:
	xorps %xmm1, %xmm1
	ucomiss %xmm0, %xmm1
	ja .LB5484
.LB5485:
	xorps %xmm0, %xmm0
	ret
.LB5484:
	xorps %xmm0, %xmm0
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	subss %xmm1, %xmm0
	ret
.LB5479:
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
.LB5488:
	xorps %xmm1, %xmm1
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm1, %xmm0
	ja .LB5493
.LB5494:
	xorps %xmm1, %xmm1
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm0, %xmm1
	ja .LB5500
.LB5501:
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	ret
.LB5500:
	xorps %xmm0, %xmm0
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	subss %xmm1, %xmm0
	cvtss2sd %xmm0, %xmm0
	ret
.LB5493:
	movabsq $1065353216, %r10
	movq %r10, %xmm0
	cvtss2sd %xmm0, %xmm0
	ret
	.text
	.globl standard__random__get_rdtsc__0__ret_dataE1_ubits64
	.def standard__random__get_rdtsc__0__ret_dataE1_ubits64;
	.scl 2;
	.type 32;
	.endef
standard__random__get_rdtsc__0__ret_dataE1_ubits64:
.LB5506:
	rdtsc                    
	                shlq $32, %rdx          
	                orq %rdx, %rax
	ret
	.text
	.globl standard__random__get_entropy__0__ret_dataE1_ubits64
	.def standard__random__get_entropy__0__ret_dataE1_ubits64;
	.scl 2;
	.type 32;
	.endef
standard__random__get_entropy__0__ret_dataE1_ubits64:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
.LB5511:
	rdtsc                    
	                shlq $32, %rdx          
	                orq %rdx, %rax
	movq %rax, %rcx
	rdtsc                    
	                shlq $32, %rdx          
	                orq %rdx, %rax
	movq %rax, %rsi
	rdtsc                    
	                shlq $32, %rdx          
	                orq %rdx, %rax
	shlq $21, %rsi
	xorq %rsi, %rcx
	shrq $17, %rax
	xorq %rcx, %rax
	movq 0(%rsp), %rsi
	addq $16, %rsp
	ret
	.text
	.globl standard__random__pcg32_seed__3__PCG32E1_ptr1__dataE1_ubits64__dataE1_ubits64__ret_voidE1
	.def standard__random__pcg32_seed__3__PCG32E1_ptr1__dataE1_ubits64__dataE1_ubits64__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__random__pcg32_seed__3__PCG32E1_ptr1__dataE1_ubits64__dataE1_ubits64__ret_voidE1:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
.LB5527:
	movabsq $6364136223846793005, %rsi
	shlq $1, %r8
	movq $0, (%rcx)
	orq $1, %r8
	movq %r8, 8(%rcx)
	movq (%rcx), %rax
	imulq %rsi, %rax
	addq %r8, %rax
	movq %rax, (%rcx)
	addq %rdx, %rax
	movabsq $6364136223846793005, %rdx
	movq %rax, (%rcx)
	imulq %rdx, %rax
	addq 8(%rcx), %rax
	movq %rax, (%rcx)
	movq 0(%rsp), %rsi
	addq $16, %rsp
	ret
	.text
	.globl standard__random__pcg32_init__1__PCG32E1_ptr1__ret_voidE1
	.def standard__random__pcg32_init__1__PCG32E1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__random__pcg32_init__1__PCG32E1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB5575:
	movq %rcx, %rsi
	callq standard__random__get_entropy__0__ret_dataE1_ubits64
	movq %rax, %rdi
	callq standard__random__get_entropy__0__ret_dataE1_ubits64
	movq %rax, %r8
	movq %rsi, %rcx
	movq %rdi, %rdx
	callq standard__random__pcg32_seed__3__PCG32E1_ptr1__dataE1_ubits64__dataE1_ubits64__ret_voidE1
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__random__pcg32_next__1__PCG32E1_ptr1__ret_dataE1_ubits32
	.def standard__random__pcg32_next__1__PCG32E1_ptr1__ret_dataE1_ubits32;
	.scl 2;
	.type 32;
	.endef
standard__random__pcg32_next__1__PCG32E1_ptr1__ret_dataE1_ubits32:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
.LB5585:
	movabsq $6364136223846793005, %rdx
	movq (%rcx), %rax
	imulq %rax, %rdx
	addq 8(%rcx), %rdx
	movq %rdx, (%rcx)
	movq %rax, %rcx
	shrq $18, %rcx
	xorq %rax, %rcx
	shrq $27, %rcx
	shrq $59, %rax
	shrx %eax, %ecx, %edx
	xorl %esi, %esi
	subl %eax, %esi
	shlx %esi, %ecx, %ecx
	movl %edx, %eax
	orl %ecx, %eax
	movq 0(%rsp), %rsi
	addq $16, %rsp
	ret
	.text
	.globl standard__random__random_float__1__PCG32E1_ptr1__ret_floatE1
	.def standard__random__random_float__1__PCG32E1_ptr1__ret_floatE1;
	.scl 2;
	.type 32;
	.endef
standard__random__random_float__1__PCG32E1_ptr1__ret_floatE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB5623:
	callq standard__random__pcg32_next__1__PCG32E1_ptr1__ret_dataE1_ubits32
	movslq %eax, %rax
	xorps %xmm0, %xmm0
	cvtsi2ssq %rax, %xmm0
	movabsq $1333788672, %r10
	movq %r10, %xmm1
	divss %xmm1, %xmm0
	leave
	ret
	.text
	.globl standard__random__random_range_float__3__PCG32E1_ptr1__floatE1__floatE1__ret_floatE1
	.def standard__random__random_range_float__3__PCG32E1_ptr1__floatE1__floatE1__ret_floatE1;
	.scl 2;
	.type 32;
	.endef
standard__random__random_range_float__3__PCG32E1_ptr1__floatE1__floatE1__ret_floatE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
.LB5632:
	movaps %xmm1, %xmm0
	movsd %xmm0, -8(%rbp)
	movaps %xmm2, %xmm0
	movsd %xmm0, -16(%rbp)
	callq standard__random__pcg32_next__1__PCG32E1_ptr1__ret_dataE1_ubits32
	movslq %eax, %rax
	xorps %xmm0, %xmm0
	cvtsi2ssq %rax, %xmm0
	movabsq $1333788672, %r10
	movq %r10, %xmm1
	divss %xmm1, %xmm0
	movsd -16(%rbp), %xmm1
	movsd -8(%rbp), %xmm2
	subss %xmm2, %xmm1
	vfmadd132ss %xmm1, %xmm2, %xmm0
	leave
	ret
	.text
	.globl standard__autograd__Tape.__init__1__dataE1_ubits64__ret_thisE1
	.def standard__autograd__Tape.__init__1__dataE1_ubits64__ret_thisE1;
	.scl 2;
	.type 32;
	.endef
standard__autograd__Tape.__init__1__dataE1_ubits64__ret_thisE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
.LB8185:
	movq %rcx, %rsi
	movq %rdx, %rdi
	movq %rdi, %rbx
	shlq $10, %rbx
	movq %rbx, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	xorl %edx, %edx
	movq %rbx, %r8
	movq %rax, (%rsi)
	movl $0, 8(%rsi)
	movl %edi, 12(%rsi)
	movq (%rsi), %rax
	movq %rax, %rcx
	callq memset
	movq %rsi, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__autograd__Tape.push__0__ret_intE1
	.def standard__autograd__Tape.push__0__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__autograd__Tape.push__0__ret_intE1:
.LB8204:
	movl 8(%rcx), %eax
	cmpl 12(%rcx), %eax
	jge .LB8210
.LB8211:
	movl 8(%rcx), %eax
	leal 1(%rax), %edx
	movl %edx, 8(%rcx)
	ret
.LB8210:
	movabsq $4294967295, %rax
	ret
	.text
	.globl standard__autograd__Tape.reset__0__ret_voidE1
	.def standard__autograd__Tape.reset__0__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__autograd__Tape.reset__0__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
.LB8222:
	movq %rcx, %rsi
	movq (%rsi), %rax
	movl 12(%rsi), %ecx
	movq %rcx, %r8
	shlq $10, %r8
	movq %rax, %rcx
	xorl %edx, %edx
	callq memset
	movl $0, 8(%rsi)
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl standard__autograd__gt_numel__2__dataE1_ubits64__dataE1_ptr1_ubits64__ret_dataE1_ubits64
	.def standard__autograd__gt_numel__2__dataE1_ubits64__dataE1_ptr1_ubits64__ret_dataE1_ubits64;
	.scl 2;
	.type 32;
	.endef
standard__autograd__gt_numel__2__dataE1_ubits64__dataE1_ptr1_ubits64__ret_dataE1_ubits64:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
	movq %rdi, -8(%rsp)
.LB5647:
	movl $1, %eax
	xorl %esi, %esi
.LB5653:
	cmpq %rcx, %rsi
	jae .LB5655
.LB5654:
	movslq %esi, %rdi
	imulq (%rdx,%rdi,8), %rax
	incq %rsi
	cmpq %rcx, %rsi
	jb .LB5654
.LB5655:
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
	.text
	.globl standard__autograd__gt_init__5__GradTensorE1_ptr1__TapeE1_ptr1__floatE1_ptr1__dataE1_ubits64__dataE1_ptr1_ubits64__ret_voidE1
	.def standard__autograd__gt_init__5__GradTensorE1_ptr1__TapeE1_ptr1__floatE1_ptr1__dataE1_ubits64__dataE1_ptr1_ubits64__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__autograd__gt_init__5__GradTensorE1_ptr1__TapeE1_ptr1__floatE1_ptr1__dataE1_ubits64__dataE1_ptr1_ubits64__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
.LB5669:
	movq %rcx, %rsi
	movq %r8, %rdi
	movq 48(%rbp), %rax
	movq %r9, 16(%rsi)
	xorl %ecx, %ecx
	testq %r9, %r9
	cmova %r9, %rcx
	shrq $2, %rcx
	xorl %edx, %edx
.LB10709:
	testq %rcx, %rcx
	je .LB10711
.LB10710:
	movslq %edx, %r8
	movq (%rax,%r8,8), %rbx
	movq %rbx, 24(%rsi,%r8,8)
	leaq 1(%rdx), %r8
	movslq %r8d, %r8
	movq (%rax,%r8,8), %rbx
	movq %rbx, 24(%rsi,%r8,8)
	leaq 2(%rdx), %r8
	movslq %r8d, %r8
	movq (%rax,%r8,8), %rbx
	movq %rbx, 24(%rsi,%r8,8)
	leaq 3(%rdx), %r8
	movslq %r8d, %r8
	movq (%rax,%r8,8), %rbx
	movq %rbx, 24(%rsi,%r8,8)
	addq $4, %rdx
	decq %rcx
	jne .LB10710
.LB10711:
.LB5681:
	cmpq %r9, %rdx
	jae .LB5683
.LB5682:
	movslq %edx, %rcx
	movq (%rax,%rcx,8), %r8
	movq %r8, 24(%rsi,%rcx,8)
	incq %rdx
	cmpq %r9, %rdx
	jb .LB5682
.LB5683:
	leaq 24(%rsi), %rdx
	movq %r9, %rcx
	callq standard__autograd__gt_numel__2__dataE1_ubits64__dataE1_ptr1_ubits64__ret_dataE1_ubits64
	movq %rax, 88(%rsi)
	movq %rax, %rbx
	shlq $5, %rbx
	movq %rbx, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, (%rsi)
	movq %rbx, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, 8(%rsi)
	movq (%rsi), %rax
	movq %rax, %rcx
	movq %rdi, %rdx
	movq %rbx, %r8
	callq memcpy
	movq 8(%rsi), %rax
	movq %rax, %rcx
	xorl %edx, %edx
	movq %rbx, %r8
	callq memset
	movl $4294967295, 96(%rsi)
	orb $128, 100(%rsi)
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__autograd__gt_init_zero__3__GradTensorE1_ptr1__dataE1_ubits64__dataE1_ptr1_ubits64__ret_voidE1
	.def standard__autograd__gt_init_zero__3__GradTensorE1_ptr1__dataE1_ubits64__dataE1_ptr1_ubits64__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__autograd__gt_init_zero__3__GradTensorE1_ptr1__dataE1_ubits64__dataE1_ptr1_ubits64__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB5746:
	movq %rcx, %rsi
	movq %rdx, 16(%rsi)
	xorl %eax, %eax
	testq %rdx, %rdx
	cmova %rdx, %rax
	shrq $2, %rax
	xorl %ecx, %ecx
.LB10712:
	testq %rax, %rax
	je .LB10714
.LB10713:
	movslq %ecx, %rdi
	movq (%r8,%rdi,8), %r9
	movq %r9, 24(%rsi,%rdi,8)
	leaq 1(%rcx), %rdi
	movslq %edi, %rdi
	movq (%r8,%rdi,8), %r9
	movq %r9, 24(%rsi,%rdi,8)
	leaq 2(%rcx), %rdi
	movslq %edi, %rdi
	movq (%r8,%rdi,8), %r9
	movq %r9, 24(%rsi,%rdi,8)
	leaq 3(%rcx), %rdi
	movslq %edi, %rdi
	movq (%r8,%rdi,8), %r9
	movq %r9, 24(%rsi,%rdi,8)
	addq $4, %rcx
	decq %rax
	jne .LB10713
.LB10714:
.LB5756:
	cmpq %rdx, %rcx
	jae .LB5758
.LB5757:
	movslq %ecx, %rax
	movq (%r8,%rax,8), %rdi
	movq %rdi, 24(%rsi,%rax,8)
	incq %rcx
	cmpq %rdx, %rcx
	jb .LB5757
.LB5758:
	leaq 24(%rsi), %rax
	movq %rdx, %rcx
	movq %rax, %rdx
	callq standard__autograd__gt_numel__2__dataE1_ubits64__dataE1_ptr1_ubits64__ret_dataE1_ubits64
	movq %rax, 88(%rsi)
	movq %rax, %rdi
	shlq $5, %rdi
	movq %rdi, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, (%rsi)
	movq %rdi, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, 8(%rsi)
	movq (%rsi), %rax
	movq %rax, %rcx
	xorl %edx, %edx
	movq %rdi, %r8
	callq memset
	movq 8(%rsi), %rax
	movq %rax, %rcx
	xorl %edx, %edx
	movq %rdi, %r8
	callq memset
	movl $4294967295, 96(%rsi)
	orb $128, 100(%rsi)
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__autograd__gt_free__1__GradTensorE1_ptr1__ret_voidE1
	.def standard__autograd__gt_free__1__GradTensorE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__autograd__gt_free__1__GradTensorE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
.LB5819:
	movq %rcx, %rsi
	movq (%rsi), %rax
	movq STDLIB_GVP(%rip), %rcx
	cmpq %rcx, %rax
	jne .LB5830
.LB5832:
	movq 8(%rsi), %rax
	movq STDLIB_GVP(%rip), %rcx
	cmpq %rcx, %rax
	jne .LB5851
.LB5852:
	movq -8(%rbp), %rsi
	leave
	ret
.LB5830:
	movq %rax, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movq STDLIB_GVP(%rip), %rax
	movq %rax, (%rsi)
	jmp .LB5832
.LB5851:
	movq %rax, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movq STDLIB_GVP(%rip), %rax
	movq %rax, 8(%rsi)
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl standard__autograd__gt_free_heap__1__GradTensorE1_ptr1__ret_voidE1
	.def standard__autograd__gt_free_heap__1__GradTensorE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__autograd__gt_free_heap__1__GradTensorE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
.LB5863:
	movq %rcx, %rsi
	movq %rsi, %rcx
	callq standard__autograd__gt_free__1__GradTensorE1_ptr1__ret_voidE1
	movq %rsi, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl standard__autograd__gt_zero_grad__1__GradTensorE1_ptr1__ret_voidE1
	.def standard__autograd__gt_zero_grad__1__GradTensorE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__autograd__gt_zero_grad__1__GradTensorE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB5870:
	movq 8(%rcx), %rax
	movq 88(%rcx), %rcx
	movq %rcx, %r8
	shlq $5, %r8
	movq %rax, %rcx
	xorl %edx, %edx
	callq memset
	leave
	ret
	.text
	.globl standard__autograd___sigmoid__1__floatE1__ret_floatE1
	.def standard__autograd___sigmoid__1__floatE1__ret_floatE1;
	.scl 2;
	.type 32;
	.endef
standard__autograd___sigmoid__1__floatE1__ret_floatE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB5884:
	xorps %xmm1, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subss %xmm15, %xmm0
	cvtss2sd %xmm0, %xmm0
	callq standard__math__exp__1__doubleE1__ret_doubleE1
	cvtsd2ss %xmm0, %xmm0
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	addss %xmm1, %xmm0
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	divss %xmm15, %xmm0
	leave
	ret
	.text
	.globl standard__autograd__grad_add__3__TapeE1_ptr1__GradTensorE1_ptr1__GradTensorE1_ptr1__ret_GradTensorE1_ptr1
	.def standard__autograd__grad_add__3__TapeE1_ptr1__GradTensorE1_ptr1__GradTensorE1_ptr1__ret_GradTensorE1_ptr1;
	.scl 2;
	.type 32;
	.endef
standard__autograd__grad_add__3__TapeE1_ptr1__GradTensorE1_ptr1__GradTensorE1_ptr1__ret_GradTensorE1_ptr1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
.LB5891:
	movq %rcx, %rsi
	movq %rdx, %rdi
	movq %r8, %rbx
	movl $801, %ecx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	leaq 24(%rdi), %r8
	movq 16(%rdi), %rdx
	movq %rax, %r12
	movq %r12, %rcx
	callq standard__autograd__gt_init_zero__3__GradTensorE1_ptr1__dataE1_ubits64__dataE1_ptr1_ubits64__ret_voidE1
	movq 88(%rdi), %rax
	xorl %ecx, %ecx
	testq %rax, %rax
	cmova %rax, %rcx
	shrq $2, %rcx
	xorl %edx, %edx
.LB10715:
	testq %rcx, %rcx
	je .LB10717
.LB10716:
	movq (%rdi), %r8
	movslq %edx, %r9
	movss (%r8,%r9,4), %xmm0
	movq (%rbx), %r8
	movss (%r8,%r9,4), %xmm1
	movq (%r12), %r8
	addss %xmm1, %xmm0
	movss %xmm0, (%r8,%rdx,4)
	movq (%rdi), %r9
	leaq 1(%rdx), %r8
	movslq %r8d, %r8
	movss (%r9,%r8,4), %xmm0
	movq (%rbx), %r9
	movss (%r9,%r8,4), %xmm1
	movq (%r12), %r8
	addss %xmm1, %xmm0
	movss %xmm0, 4(%r8,%rdx,4)
	movq (%rdi), %r9
	leaq 2(%rdx), %r8
	movslq %r8d, %r8
	movss (%r9,%r8,4), %xmm0
	movq (%rbx), %r9
	movss (%r9,%r8,4), %xmm1
	movq (%r12), %r8
	addss %xmm1, %xmm0
	movss %xmm0, 8(%r8,%rdx,4)
	movq (%rdi), %r9
	leaq 3(%rdx), %r8
	movslq %r8d, %r8
	movss (%r9,%r8,4), %xmm0
	movq (%rbx), %r9
	movss (%r9,%r8,4), %xmm1
	movq (%r12), %r8
	addss %xmm1, %xmm0
	movss %xmm0, 12(%r8,%rdx,4)
	addq $4, %rdx
	decq %rcx
	jne .LB10716
.LB10717:
.LB5914:
	cmpq %rax, %rdx
	jae .LB5916
.LB5915:
	movq (%rdi), %rcx
	movslq %edx, %r8
	movss (%rcx,%r8,4), %xmm0
	movq (%rbx), %rcx
	movss (%rcx,%r8,4), %xmm1
	movq (%r12), %rcx
	addss %xmm1, %xmm0
	movss %xmm0, (%rcx,%rdx,4)
	incq %rdx
	cmpq %rax, %rdx
	jb .LB5915
.LB5916:
	movq %rsi, %rcx
	callq standard__autograd__Tape.push__0__ret_intE1
	movl %eax, 96(%r12)
	movq (%rsi), %rcx
	movslq %eax, %rax
	shlq $7, %rax
	leaq (%rcx,%rax,1), %rax
	movl $1, (%rax)
	movq %r12, 8(%rax)
	movq %rdi, 16(%rax)
	movq %rbx, 24(%rax)
	movl $2, 32(%rax)
	movq %r12, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
	.text
	.globl standard__autograd__grad_sub__3__TapeE1_ptr1__GradTensorE1_ptr1__GradTensorE1_ptr1__ret_GradTensorE1_ptr1
	.def standard__autograd__grad_sub__3__TapeE1_ptr1__GradTensorE1_ptr1__GradTensorE1_ptr1__ret_GradTensorE1_ptr1;
	.scl 2;
	.type 32;
	.endef
standard__autograd__grad_sub__3__TapeE1_ptr1__GradTensorE1_ptr1__GradTensorE1_ptr1__ret_GradTensorE1_ptr1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
.LB5980:
	movq %rcx, %rsi
	movq %rdx, %rdi
	movq %r8, %rbx
	movl $801, %ecx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	leaq 24(%rdi), %r8
	movq 16(%rdi), %rdx
	movq %rax, %r12
	movq %r12, %rcx
	callq standard__autograd__gt_init_zero__3__GradTensorE1_ptr1__dataE1_ubits64__dataE1_ptr1_ubits64__ret_voidE1
	movq 88(%rdi), %rax
	xorl %ecx, %ecx
	testq %rax, %rax
	cmova %rax, %rcx
	shrq $2, %rcx
	xorl %edx, %edx
.LB10718:
	testq %rcx, %rcx
	je .LB10720
.LB10719:
	movq (%rdi), %r8
	movslq %edx, %r9
	movss (%r8,%r9,4), %xmm0
	movq (%rbx), %r8
	movss (%r8,%r9,4), %xmm1
	movq (%r12), %r8
	subss %xmm1, %xmm0
	movss %xmm0, (%r8,%rdx,4)
	movq (%rdi), %r9
	leaq 1(%rdx), %r8
	movslq %r8d, %r8
	movss (%r9,%r8,4), %xmm0
	movq (%rbx), %r9
	movss (%r9,%r8,4), %xmm1
	movq (%r12), %r8
	subss %xmm1, %xmm0
	movss %xmm0, 4(%r8,%rdx,4)
	movq (%rdi), %r9
	leaq 2(%rdx), %r8
	movslq %r8d, %r8
	movss (%r9,%r8,4), %xmm0
	movq (%rbx), %r9
	movss (%r9,%r8,4), %xmm1
	movq (%r12), %r8
	subss %xmm1, %xmm0
	movss %xmm0, 8(%r8,%rdx,4)
	movq (%rdi), %r9
	leaq 3(%rdx), %r8
	movslq %r8d, %r8
	movss (%r9,%r8,4), %xmm0
	movq (%rbx), %r9
	movss (%r9,%r8,4), %xmm1
	movq (%r12), %r8
	subss %xmm1, %xmm0
	movss %xmm0, 12(%r8,%rdx,4)
	addq $4, %rdx
	decq %rcx
	jne .LB10719
.LB10720:
.LB6003:
	cmpq %rax, %rdx
	jae .LB6005
.LB6004:
	movq (%rdi), %rcx
	movslq %edx, %r8
	movss (%rcx,%r8,4), %xmm0
	movq (%rbx), %rcx
	movss (%rcx,%r8,4), %xmm1
	movq (%r12), %rcx
	subss %xmm1, %xmm0
	movss %xmm0, (%rcx,%rdx,4)
	incq %rdx
	cmpq %rax, %rdx
	jb .LB6004
.LB6005:
	movq %rsi, %rcx
	callq standard__autograd__Tape.push__0__ret_intE1
	movl %eax, 96(%r12)
	movq (%rsi), %rcx
	movslq %eax, %rax
	shlq $7, %rax
	leaq (%rcx,%rax,1), %rax
	movl $2, (%rax)
	movq %r12, 8(%rax)
	movq %rdi, 16(%rax)
	movq %rbx, 24(%rax)
	movl $2, 32(%rax)
	movq %r12, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
	.text
	.globl standard__autograd__grad_mul__3__TapeE1_ptr1__GradTensorE1_ptr1__GradTensorE1_ptr1__ret_GradTensorE1_ptr1
	.def standard__autograd__grad_mul__3__TapeE1_ptr1__GradTensorE1_ptr1__GradTensorE1_ptr1__ret_GradTensorE1_ptr1;
	.scl 2;
	.type 32;
	.endef
standard__autograd__grad_mul__3__TapeE1_ptr1__GradTensorE1_ptr1__GradTensorE1_ptr1__ret_GradTensorE1_ptr1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
.LB6069:
	movq %rcx, %rsi
	movq %rdx, %rdi
	movq %r8, %rbx
	movl $801, %ecx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	leaq 24(%rdi), %r8
	movq 16(%rdi), %rdx
	movq %rax, %r12
	movq %r12, %rcx
	callq standard__autograd__gt_init_zero__3__GradTensorE1_ptr1__dataE1_ubits64__dataE1_ptr1_ubits64__ret_voidE1
	movq 88(%rdi), %rax
	xorl %ecx, %ecx
	testq %rax, %rax
	cmova %rax, %rcx
	shrq $2, %rcx
	xorl %edx, %edx
.LB10721:
	testq %rcx, %rcx
	je .LB10723
.LB10722:
	movq (%rdi), %r8
	movslq %edx, %r9
	movss (%r8,%r9,4), %xmm0
	movq (%rbx), %r8
	movss (%r8,%r9,4), %xmm1
	movq (%r12), %r8
	mulss %xmm1, %xmm0
	movss %xmm0, (%r8,%rdx,4)
	movq (%rdi), %r9
	leaq 1(%rdx), %r8
	movslq %r8d, %r8
	movss (%r9,%r8,4), %xmm0
	movq (%rbx), %r9
	movss (%r9,%r8,4), %xmm1
	movq (%r12), %r8
	mulss %xmm1, %xmm0
	movss %xmm0, 4(%r8,%rdx,4)
	movq (%rdi), %r9
	leaq 2(%rdx), %r8
	movslq %r8d, %r8
	movss (%r9,%r8,4), %xmm0
	movq (%rbx), %r9
	movss (%r9,%r8,4), %xmm1
	movq (%r12), %r8
	mulss %xmm1, %xmm0
	movss %xmm0, 8(%r8,%rdx,4)
	movq (%rdi), %r9
	leaq 3(%rdx), %r8
	movslq %r8d, %r8
	movss (%r9,%r8,4), %xmm0
	movq (%rbx), %r9
	movss (%r9,%r8,4), %xmm1
	movq (%r12), %r8
	mulss %xmm1, %xmm0
	movss %xmm0, 12(%r8,%rdx,4)
	addq $4, %rdx
	decq %rcx
	jne .LB10722
.LB10723:
.LB6092:
	cmpq %rax, %rdx
	jae .LB6094
.LB6093:
	movq (%rdi), %rcx
	movslq %edx, %r8
	movss (%rcx,%r8,4), %xmm0
	movq (%rbx), %rcx
	movss (%rcx,%r8,4), %xmm1
	movq (%r12), %rcx
	mulss %xmm1, %xmm0
	movss %xmm0, (%rcx,%rdx,4)
	incq %rdx
	cmpq %rax, %rdx
	jb .LB6093
.LB6094:
	movq %rsi, %rcx
	callq standard__autograd__Tape.push__0__ret_intE1
	movl %eax, 96(%r12)
	movq (%rsi), %rcx
	movslq %eax, %rax
	shlq $7, %rax
	leaq (%rcx,%rax,1), %rax
	movl $3, (%rax)
	movq %r12, 8(%rax)
	movq %rdi, 16(%rax)
	movq %rbx, 24(%rax)
	movl $2, 32(%rax)
	movq %r12, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
	.text
	.globl standard__autograd__grad_matmul__3__TapeE1_ptr1__GradTensorE1_ptr1__GradTensorE1_ptr1__ret_GradTensorE1_ptr1
	.def standard__autograd__grad_matmul__3__TapeE1_ptr1__GradTensorE1_ptr1__GradTensorE1_ptr1__ret_GradTensorE1_ptr1;
	.scl 2;
	.type 32;
	.endef
standard__autograd__grad_matmul__3__TapeE1_ptr1__GradTensorE1_ptr1__GradTensorE1_ptr1__ret_GradTensorE1_ptr1:
	pushq %rbp
	movq %rsp, %rbp
	subq $208, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
	movq %r14, -48(%rbp)
	movq %r15, -56(%rbp)
.LB6158:
	movq %rcx, -128(%rbp)
	movq %rdx, -168(%rbp)
	movq %r8, -136(%rbp)
	movq 24(%rdx), %rsi
	movq 32(%rdx), %rdi
	movq 32(%r8), %rbx
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -120(%rbp)
	vmovdqu .LZERO+32(%rip), %ymm15
	vmovdqu %ymm15, -88(%rbp)
	vzeroupper
	movq %rsi, -120(%rbp)
	movq %rbx, -112(%rbp)
	movl $801, %ecx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	leaq -120(%rbp), %r8
	movl $2, %edx
	movq %rax, -160(%rbp)
	movq -160(%rbp), %rcx
	callq standard__autograd__gt_init_zero__3__GradTensorE1_ptr1__dataE1_ubits64__dataE1_ptr1_ubits64__ret_voidE1
	movq -168(%rbp), %rax
	movq (%rax), %rax
	movq -136(%rbp), %rcx
	movq (%rcx), %rcx
	movq -160(%rbp), %rdx
	movq (%rdx), %rdx
	xorl %r8d, %r8d
	xorl %r9d, %r9d
	xorps %xmm0, %xmm0
.LB6213:
	cmpq %rsi, %r8
	jae .LB6215
.LB6214:
	movq %r8, %r12
	imulq %rdi, %r12
	movq %r8, %r13
	imulq %rbx, %r13
	movq %r9, -144(%rbp)
	xorl %r9d, %r9d
.LB6220:
	cmpq %rbx, %r9
	jae .LB6222
.LB6221:
	movq $0, -152(%rbp)
	xorps %xmm0, %xmm0
.LB6227:
	movq -152(%rbp), %r14
	cmpq %rdi, %r14
	jae .LB6229
.LB6228:
	movq -152(%rbp), %r14
	leaq (%r12,%r14), %r15
	imulq %rbx, %r14
	movslq %r15d, %r15
	movss (%rax,%r15,4), %xmm1
	addq %r9, %r14
	movslq %r14d, %r14
	movss (%rcx,%r14,4), %xmm2
	movq -152(%rbp), %r14
	mulss %xmm2, %xmm1
	incq %r14
	addss %xmm1, %xmm0
	movq %r14, -152(%rbp)
	jmp .LB6227
.LB6215:
	movq -128(%rbp), %rcx
	callq standard__autograd__Tape.push__0__ret_intE1
	movq -160(%rbp), %rcx
	movl %eax, 96(%rcx)
	movq -128(%rbp), %rcx
	movslq %eax, %rax
	shlq $7, %rax
	movq (%rcx), %rcx
	leaq (%rcx,%rax,1), %r12
	movl $4, (%r12)
	movq -160(%rbp), %rax
	movq %rax, 8(%r12)
	movq -168(%rbp), %rax
	movq %rax, 16(%r12)
	movq -136(%rbp), %rax
	movq %rax, 24(%r12)
	movl $2, 32(%r12)
	movq %rsi, 56(%r12)
	imulq %rdi, %rsi
	movq %rdi, 64(%r12)
	movq %rbx, 72(%r12)
	shlq $5, %rsi
	movq %rsi, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	imulq %rbx, %rdi
	movq %rax, 40(%r12)
	shlq $5, %rdi
	movq %rdi, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, 48(%r12)
	movq 40(%r12), %rax
	movq -168(%rbp), %rcx
	movq (%rcx), %rcx
	movq %rcx, %rdx
	movq %rax, %rcx
	movq %rsi, %r8
	callq memcpy
	movq 48(%r12), %rax
	movq -136(%rbp), %rcx
	movq (%rcx), %rcx
	movq %rcx, %rdx
	movq %rax, %rcx
	movq %rdi, %r8
	callq memcpy
	movq -160(%rbp), %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB6222:
	incq %r8
	movq -144(%rbp), %r9
	cmpq %rsi, %r8
	jb .LB6214
	jmp .LB6215
.LB6229:
	leaq (%r13,%r9), %r14
	movss %xmm0, (%rdx,%r14,4)
	incq %r9
	movq -152(%rbp), %r10
	movq %r10, -144(%rbp)
	cmpq %rbx, %r9
	jb .LB6221
	jmp .LB6222
	.text
	.globl standard__autograd__grad_relu__2__TapeE1_ptr1__GradTensorE1_ptr1__ret_GradTensorE1_ptr1
	.def standard__autograd__grad_relu__2__TapeE1_ptr1__GradTensorE1_ptr1__ret_GradTensorE1_ptr1;
	.scl 2;
	.type 32;
	.endef
standard__autograd__grad_relu__2__TapeE1_ptr1__GradTensorE1_ptr1__ret_GradTensorE1_ptr1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
.LB6360:
	movq %rcx, %rsi
	movq %rdx, %rdi
	movl $801, %ecx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	leaq 24(%rdi), %r8
	movq 16(%rdi), %rdx
	movq %rax, %rbx
	movq %rbx, %rcx
	callq standard__autograd__gt_init_zero__3__GradTensorE1_ptr1__dataE1_ubits64__dataE1_ptr1_ubits64__ret_voidE1
	movq 88(%rdi), %rax
	xorl %ecx, %ecx
.LB6382:
	cmpq %rax, %rcx
	jae .LB6384
.LB6383:
	movq (%rdi), %rdx
	movslq %ecx, %r8
	movss (%rdx,%r8,4), %xmm0
	xorps %xmm1, %xmm1
	ucomiss %xmm1, %xmm0
	ja .LB6397
.LB6398:
	xorps %xmm0, %xmm0
.LB6399:
	movq (%rbx), %rdx
	movss %xmm0, (%rdx,%rcx,4)
	incq %rcx
	cmpq %rax, %rcx
	jb .LB6383
.LB6384:
	movq %rsi, %rcx
	callq standard__autograd__Tape.push__0__ret_intE1
	movl %eax, 96(%rbx)
	movq (%rsi), %rcx
	movslq %eax, %rax
	shlq $7, %rax
	leaq (%rcx,%rax,1), %rax
	movl $5, (%rax)
	movq %rbx, 8(%rax)
	movq %rdi, 16(%rax)
	movl $1, 32(%rax)
	movq %rbx, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB6397:
	jmp .LB6399
	.text
	.globl standard__autograd__grad_sigmoid__2__TapeE1_ptr1__GradTensorE1_ptr1__ret_GradTensorE1_ptr1
	.def standard__autograd__grad_sigmoid__2__TapeE1_ptr1__GradTensorE1_ptr1__ret_GradTensorE1_ptr1;
	.scl 2;
	.type 32;
	.endef
standard__autograd__grad_sigmoid__2__TapeE1_ptr1__GradTensorE1_ptr1__ret_GradTensorE1_ptr1:
	pushq %rbp
	movq %rsp, %rbp
	subq $80, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
.LB6447:
	movq %rcx, %rsi
	movq %rdx, %rdi
	movl $801, %ecx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	leaq 24(%rdi), %r8
	movq 16(%rdi), %rdx
	movq %rax, %rbx
	movq %rbx, %rcx
	callq standard__autograd__gt_init_zero__3__GradTensorE1_ptr1__dataE1_ubits64__dataE1_ptr1_ubits64__ret_voidE1
	movq 88(%rdi), %r12
	xorl %r13d, %r13d
.LB6469:
	cmpq %r12, %r13
	jae .LB6471
.LB6470:
	movq (%rdi), %rax
	movslq %r13d, %rcx
	movss (%rax,%rcx,4), %xmm0
	xorps %xmm1, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subss %xmm15, %xmm0
	cvtss2sd %xmm0, %xmm0
	callq standard__math__exp__1__doubleE1__ret_doubleE1
	cvtsd2ss %xmm0, %xmm0
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	addss %xmm1, %xmm0
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	divss %xmm15, %xmm0
	movq (%rbx), %rax
	movss %xmm0, (%rax,%r13,4)
	incq %r13
	cmpq %r12, %r13
	jb .LB6470
.LB6471:
	movq %rsi, %rcx
	callq standard__autograd__Tape.push__0__ret_intE1
	movl %eax, 96(%rbx)
	movq (%rsi), %rcx
	movslq %eax, %rax
	shlq $7, %rax
	leaq (%rcx,%rax,1), %rax
	movl $6, (%rax)
	movq %rbx, 8(%rax)
	movq %rdi, 16(%rax)
	movl $1, 32(%rax)
	movq %rbx, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
	.text
	.globl standard__autograd__grad_tanh_act__2__TapeE1_ptr1__GradTensorE1_ptr1__ret_GradTensorE1_ptr1
	.def standard__autograd__grad_tanh_act__2__TapeE1_ptr1__GradTensorE1_ptr1__ret_GradTensorE1_ptr1;
	.scl 2;
	.type 32;
	.endef
standard__autograd__grad_tanh_act__2__TapeE1_ptr1__GradTensorE1_ptr1__ret_GradTensorE1_ptr1:
	pushq %rbp
	movq %rsp, %rbp
	subq $80, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
.LB6522:
	movq %rcx, %rsi
	movq %rdx, %rdi
	movl $801, %ecx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	leaq 24(%rdi), %r8
	movq 16(%rdi), %rdx
	movq %rax, %rbx
	movq %rbx, %rcx
	callq standard__autograd__gt_init_zero__3__GradTensorE1_ptr1__dataE1_ubits64__dataE1_ptr1_ubits64__ret_voidE1
	movq 88(%rdi), %r12
	xorl %r13d, %r13d
.LB6544:
	cmpq %r12, %r13
	jae .LB6546
.LB6545:
	movq (%rdi), %rax
	movslq %r13d, %rcx
	movss (%rax,%rcx,4), %xmm0
	movabsq $1073741824, %r10
	movq %r10, %xmm1
	mulss %xmm1, %xmm0
	cvtss2sd %xmm0, %xmm0
	callq standard__math__exp__1__doubleE1__ret_doubleE1
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	movabsq $1065353216, %r10
	movq %r10, %xmm2
	movq (%rbx), %rax
	cvtsd2ss %xmm0, %xmm0
	movaps %xmm1, %xmm15
	movaps %xmm0, %xmm1
	subss %xmm15, %xmm1
	addss %xmm2, %xmm0
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	divss %xmm15, %xmm0
	movss %xmm0, (%rax,%r13,4)
	incq %r13
	cmpq %r12, %r13
	jb .LB6545
.LB6546:
	movq %rsi, %rcx
	callq standard__autograd__Tape.push__0__ret_intE1
	movl %eax, 96(%rbx)
	movq (%rsi), %rcx
	movslq %eax, %rax
	shlq $7, %rax
	leaq (%rcx,%rax,1), %rax
	movl $7, (%rax)
	movq %rbx, 8(%rax)
	movq %rdi, 16(%rax)
	movl $1, 32(%rax)
	movq %rbx, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
	.text
	.globl standard__autograd__grad_sum__2__TapeE1_ptr1__GradTensorE1_ptr1__ret_GradTensorE1_ptr1
	.def standard__autograd__grad_sum__2__TapeE1_ptr1__GradTensorE1_ptr1__ret_GradTensorE1_ptr1;
	.scl 2;
	.type 32;
	.endef
standard__autograd__grad_sum__2__TapeE1_ptr1__GradTensorE1_ptr1__ret_GradTensorE1_ptr1:
	pushq %rbp
	movq %rsp, %rbp
	subq $128, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
.LB6597:
	movq %rcx, %rsi
	movq %rdx, %rdi
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -88(%rbp)
	vmovdqu .LZERO+32(%rip), %ymm15
	vmovdqu %ymm15, -56(%rbp)
	vzeroupper
	movq $1, -88(%rbp)
	movl $801, %ecx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	leaq -88(%rbp), %r8
	movl $1, %edx
	movq %rax, %rbx
	movq %rbx, %rcx
	callq standard__autograd__gt_init_zero__3__GradTensorE1_ptr1__dataE1_ubits64__dataE1_ptr1_ubits64__ret_voidE1
	movq 88(%rdi), %rax
	movq (%rdi), %rcx
	xorl %edx, %edx
	xorps %xmm0, %xmm0
.LB6618:
	cmpq %rax, %rdx
	jae .LB6620
.LB6619:
	movslq %edx, %r8
	movss (%rcx,%r8,4), %xmm1
	addss %xmm1, %xmm0
	incq %rdx
	cmpq %rax, %rdx
	jb .LB6619
.LB6620:
	movq (%rbx), %rax
	movss %xmm0, (%rax)
	movq %rsi, %rcx
	callq standard__autograd__Tape.push__0__ret_intE1
	movl %eax, 96(%rbx)
	movq (%rsi), %rcx
	movslq %eax, %rax
	shlq $7, %rax
	leaq (%rcx,%rax,1), %rax
	movl $8, (%rax)
	movq %rbx, 8(%rax)
	movq %rdi, 16(%rax)
	movl $1, 32(%rax)
	movq %rbx, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__autograd__grad_scale__3__TapeE1_ptr1__GradTensorE1_ptr1__floatE1__ret_GradTensorE1_ptr1
	.def standard__autograd__grad_scale__3__TapeE1_ptr1__GradTensorE1_ptr1__floatE1__ret_GradTensorE1_ptr1;
	.scl 2;
	.type 32;
	.endef
standard__autograd__grad_scale__3__TapeE1_ptr1__GradTensorE1_ptr1__floatE1__ret_GradTensorE1_ptr1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
.LB6672:
	movq %rcx, %rsi
	movq %rdx, %rdi
	movaps %xmm2, %xmm0
	movsd %xmm0, -32(%rbp)
	movl $801, %ecx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	leaq 24(%rdi), %r8
	movq 16(%rdi), %rdx
	movq %rax, %rbx
	movq %rbx, %rcx
	callq standard__autograd__gt_init_zero__3__GradTensorE1_ptr1__dataE1_ubits64__dataE1_ptr1_ubits64__ret_voidE1
	movq 88(%rdi), %rax
	xorl %ecx, %ecx
	testq %rax, %rax
	cmova %rax, %rcx
	shrq $2, %rcx
	xorl %edx, %edx
.LB10724:
	testq %rcx, %rcx
	je .LB10726
.LB10725:
	movq (%rdi), %r8
	movslq %edx, %r9
	movss (%r8,%r9,4), %xmm0
	movsd -32(%rbp), %xmm1
	movq (%rbx), %r8
	mulss %xmm1, %xmm0
	movss %xmm0, (%r8,%rdx,4)
	movq (%rdi), %r9
	leaq 1(%rdx), %r8
	movslq %r8d, %r8
	movss (%r9,%r8,4), %xmm0
	movsd -32(%rbp), %xmm1
	movq (%rbx), %r8
	mulss %xmm1, %xmm0
	movss %xmm0, 4(%r8,%rdx,4)
	movq (%rdi), %r9
	leaq 2(%rdx), %r8
	movslq %r8d, %r8
	movss (%r9,%r8,4), %xmm0
	movsd -32(%rbp), %xmm1
	movq (%rbx), %r8
	mulss %xmm1, %xmm0
	movss %xmm0, 8(%r8,%rdx,4)
	movq (%rdi), %r9
	leaq 3(%rdx), %r8
	movslq %r8d, %r8
	movss (%r9,%r8,4), %xmm0
	movsd -32(%rbp), %xmm1
	movq (%rbx), %r8
	mulss %xmm1, %xmm0
	movss %xmm0, 12(%r8,%rdx,4)
	addq $4, %rdx
	decq %rcx
	jne .LB10725
.LB10726:
.LB6695:
	cmpq %rax, %rdx
	jae .LB6697
.LB6696:
	movq (%rdi), %rcx
	movslq %edx, %r8
	movss (%rcx,%r8,4), %xmm0
	movsd -32(%rbp), %xmm1
	movq (%rbx), %rcx
	mulss %xmm1, %xmm0
	movss %xmm0, (%rcx,%rdx,4)
	incq %rdx
	cmpq %rax, %rdx
	jb .LB6696
.LB6697:
	movq %rsi, %rcx
	callq standard__autograd__Tape.push__0__ret_intE1
	movl %eax, 96(%rbx)
	movq (%rsi), %rcx
	movslq %eax, %rax
	shlq $7, %rax
	leaq (%rcx,%rax,1), %rax
	movl $9, (%rax)
	movq %rbx, 8(%rax)
	movq %rdi, 16(%rax)
	movl $1, 32(%rax)
	movsd -32(%rbp), %xmm0
	movss %xmm0, 36(%rax)
	movq %rbx, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__autograd__backward__2__TapeE1_ptr1__GradTensorE1_ptr1__ret_voidE1
	.def standard__autograd__backward__2__TapeE1_ptr1__GradTensorE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__autograd__backward__2__TapeE1_ptr1__GradTensorE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $1056, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
	movq %r14, -48(%rbp)
	movq %r15, -56(%rbp)
.LB6752:
	movabsq $1065353216, %r10
	movq %r10, %xmm0
	movq %rcx, -352(%rbp)
	movq 8(%rdx), %rax
	movss %xmm0, (%rax)
	movl 8(%rcx), %eax
	decl %eax
	movq %rax, -360(%rbp)
	movq $0, -896(%rbp)
	movq $0, -368(%rbp)
	movq $0, -384(%rbp)
	movq $0, -392(%rbp)
	movq $0, -400(%rbp)
	movq $0, -64(%rbp)
	movq $0, -72(%rbp)
	movq $0, -80(%rbp)
	movq $0, -88(%rbp)
	movabsq $0, %r10
	movq %r10, -96(%rbp)
	movq $0, -104(%rbp)
	movabsq $0, %r10
	movq %r10, -112(%rbp)
	movabsq $0, %r10
	movq %r10, -120(%rbp)
	movabsq $0, %r10
	movq %r10, -128(%rbp)
	movq $0, -136(%rbp)
	movq $0, -144(%rbp)
	movq $0, -152(%rbp)
	movq $0, -160(%rbp)
	movabsq $0, %r10
	movq %r10, -168(%rbp)
	movq $0, -176(%rbp)
	movq $0, -184(%rbp)
	movq $0, -192(%rbp)
	movq $0, -200(%rbp)
	movq $0, -208(%rbp)
	movq $0, -216(%rbp)
	movq $0, -224(%rbp)
	movabsq $0, %r10
	movq %r10, -232(%rbp)
	movabsq $0, %r10
	movq %r10, -240(%rbp)
	movq $0, -248(%rbp)
	movq $0, -256(%rbp)
	movq $0, -264(%rbp)
	movabsq $0, %r10
	movq %r10, -272(%rbp)
	movabsq $0, %r10
	movq %r10, -280(%rbp)
	movabsq $0, %r10
	movq %r10, -288(%rbp)
	movabsq $0, %r10
	movq %r10, -296(%rbp)
	movq $0, -304(%rbp)
	movq $0, -312(%rbp)
	movabsq $0, %r10
	movq %r10, -320(%rbp)
	movq $0, -328(%rbp)
	movq $0, -336(%rbp)
	movq $0, -344(%rbp)
.LB6802:
	movq -360(%rbp), %rax
	testl %eax, %eax
	js .LB6804
.LB6803:
	movq -352(%rbp), %rax
	movq (%rax), %rax
	movq -360(%rbp), %rcx
	movslq %ecx, %rcx
	shlq $7, %rcx
	leaq (%rax,%rcx,1), %rax
	movq %rax, -800(%rbp)
	movq 8(%rax), %rcx
	movq 8(%rcx), %rdx
	movq 88(%rcx), %rsi
	movl (%rax), %eax
	movq %rax, %r11
	subq $1, %r11
	cmpq $13, %r11
	ja .LB6844
	leaq .LJT10733(%rip), %r10
	jmpq *(%r10,%r11,8)
.LB6843:
	movq -800(%rbp), %rax
	movq 16(%rax), %rsi
	movq 24(%rax), %rdi
	movq 88(%rax), %rbx
	movq 96(%rax), %rcx
	movq %rcx, -376(%rbp)
	movq 104(%rax), %rax
	movq %rax, -808(%rbp)
	movq -800(%rbp), %rax
	movq 120(%rax), %r12
	movq 112(%rax), %r13
	movq $0, -408(%rbp)
	movq -224(%rbp), %r10
	movq %r10, -416(%rbp)
	movq -232(%rbp), %r10
	movq %r10, -424(%rbp)
	movq -240(%rbp), %r10
	movq %r10, -432(%rbp)
	movq -272(%rbp), %r10
	movq %r10, -440(%rbp)
	movq -280(%rbp), %r10
	movq %r10, -448(%rbp)
	movq -288(%rbp), %r10
	movq %r10, -456(%rbp)
	movq -296(%rbp), %r10
	movq %r10, -464(%rbp)
	movq -304(%rbp), %r10
	movq %r10, -472(%rbp)
	movq -312(%rbp), %r10
	movq %r10, -480(%rbp)
	movq -320(%rbp), %r10
	movq %r10, -488(%rbp)
	movq -328(%rbp), %r10
	movq %r10, -496(%rbp)
	movq -336(%rbp), %r10
	movq %r10, -504(%rbp)
	movq -344(%rbp), %r10
	movq %r10, -512(%rbp)
.LB7880:
	movq -408(%rbp), %rax
	cmpq %r13, %rax
	jae .LB7882
.LB7881:
	xorl %eax, %eax
	movabsq $0, %r10
	movq %r10, -1000(%rbp)
	movabsq $0, %r10
	movq %r10, -1008(%rbp)
	movq -472(%rbp), %rcx
.LB7891:
	cmpq %r12, %rax
	jae .LB7893
.LB7892:
	movq -408(%rbp), %r8
	movq %rax, %rcx
	imulq %r13, %rcx
	addq %r8, %rcx
	incq %rax
	movslq %ecx, %r8
	movss (%rdx,%r8,4), %xmm0
	movq -808(%rbp), %r9
	movss (%r9,%r8,4), %xmm1
	movsd -1000(%rbp), %xmm2
	mulss %xmm0, %xmm1
	addss %xmm2, %xmm1
	movsd -1008(%rbp), %xmm2
	addss %xmm2, %xmm0
	movsd %xmm1, -1000(%rbp)
	movsd %xmm0, -1008(%rbp)
	cmpq %r12, %rax
	jb .LB7892
	jmp .LB7893
.LB6804:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB7882:
	movq -800(%rbp), %rax
	movq 88(%rax), %rax
	movq %rax, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movq -800(%rbp), %rax
	movq 96(%rax), %rax
	movq %rax, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movq -800(%rbp), %rax
	movq 104(%rax), %rax
	movq %rax, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movq STDLIB_GVP(%rip), %rax
	movq -800(%rbp), %rcx
	movq %rax, 88(%rcx)
	movq STDLIB_GVP(%rip), %rax
	movq %rax, 96(%rcx)
	movq STDLIB_GVP(%rip), %rax
	movq %rax, 104(%rcx)
	movq %rdi, -1016(%rbp)
	movq -368(%rbp), %rax
	movq -384(%rbp), %rcx
	movq -392(%rbp), %rdx
	movq -64(%rbp), %rdi
	movq -72(%rbp), %r8
	movq -80(%rbp), %r9
	movsd -96(%rbp), %xmm0
	movsd -112(%rbp), %xmm1
	movsd -120(%rbp), %xmm2
	movsd -128(%rbp), %xmm3
	movq -144(%rbp), %r14
	movq -152(%rbp), %r10
	movq %r10, -520(%rbp)
	movq -160(%rbp), %r10
	movq %r10, -528(%rbp)
	movsd -168(%rbp), %xmm4
	movq %rbx, -536(%rbp)
	movq -376(%rbp), %r10
	movq %r10, -544(%rbp)
	movq -808(%rbp), %r10
	movq %r10, -552(%rbp)
	movq %r12, -560(%rbp)
	movq %r13, -568(%rbp)
	movq -408(%rbp), %r10
	movq %r10, -576(%rbp)
	movq -416(%rbp), %r10
	movq %r10, -584(%rbp)
	movsd -424(%rbp), %xmm5
	movq -432(%rbp), %r10
	movq %r10, -592(%rbp)
	movq -248(%rbp), %r10
	movq %r10, -600(%rbp)
	movq -256(%rbp), %r10
	movq %r10, -608(%rbp)
	movq -264(%rbp), %r10
	movq %r10, -616(%rbp)
	movq -440(%rbp), %r10
	movq %r10, -624(%rbp)
	movq -448(%rbp), %r10
	movq %r10, -632(%rbp)
	movq -456(%rbp), %r10
	movq %r10, -640(%rbp)
	movq -464(%rbp), %r10
	movq %r10, -648(%rbp)
	movq -472(%rbp), %r10
	movq %r10, -656(%rbp)
	movq -480(%rbp), %r10
	movq %r10, -664(%rbp)
	movq -488(%rbp), %r10
	movq %r10, -672(%rbp)
	movq -496(%rbp), %r10
	movq %r10, -680(%rbp)
	movq -504(%rbp), %r10
	movq %r10, -688(%rbp)
	movq -512(%rbp), %r10
	movq %r10, -696(%rbp)
	movq -88(%rbp), %rbx
	movq %rsi, %r12
	movq -136(%rbp), %r13
	movq -400(%rbp), %rsi
.LB6829:
	movq -360(%rbp), %r15
	decl %r15d
	movq %r15, -976(%rbp)
	movq -976(%rbp), %r10
	movq %r10, -360(%rbp)
	movq -1016(%rbp), %r10
	movq %r10, -896(%rbp)
	movq %rax, -368(%rbp)
	movq %rcx, -384(%rbp)
	movq %rdx, -392(%rbp)
	movq %rsi, -400(%rbp)
	movq %rdi, -64(%rbp)
	movq %r8, -72(%rbp)
	movq %r9, -80(%rbp)
	movq %rbx, -88(%rbp)
	movsd %xmm0, -96(%rbp)
	movq %r12, -104(%rbp)
	movsd %xmm1, -112(%rbp)
	movsd %xmm2, -120(%rbp)
	movsd %xmm3, -128(%rbp)
	movq %r13, -136(%rbp)
	movq %r14, -144(%rbp)
	movq -520(%rbp), %r10
	movq %r10, -152(%rbp)
	movq -528(%rbp), %r10
	movq %r10, -160(%rbp)
	movsd %xmm4, -168(%rbp)
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
	movsd %xmm5, -232(%rbp)
	movq -592(%rbp), %r10
	movq %r10, -240(%rbp)
	movq -600(%rbp), %r10
	movq %r10, -248(%rbp)
	movq -608(%rbp), %r10
	movq %r10, -256(%rbp)
	movq -616(%rbp), %r10
	movq %r10, -264(%rbp)
	movq -624(%rbp), %r10
	movq %r10, -272(%rbp)
	movq -632(%rbp), %r10
	movq %r10, -280(%rbp)
	movq -640(%rbp), %r10
	movq %r10, -288(%rbp)
	movq -648(%rbp), %r10
	movq %r10, -296(%rbp)
	movq -656(%rbp), %r10
	movq %r10, -304(%rbp)
	movq -664(%rbp), %r10
	movq %r10, -312(%rbp)
	movq -672(%rbp), %r10
	movq %r10, -320(%rbp)
	movq -680(%rbp), %r10
	movq %r10, -328(%rbp)
	movq -688(%rbp), %r10
	movq %r10, -336(%rbp)
	movq -696(%rbp), %r10
	movq %r10, -344(%rbp)
	jmp .LB6802
.LB7893:
	movzbl 100(%rdi), %r8d
	shrq $7, %r8
	testb %r8b, %r8b
	jne .LB7929
.LB7931:
	movq -800(%rbp), %r8
	movq 48(%r8), %r8
	movq %r8, -792(%rbp)
	movq STDLIB_GVP(%rip), %r8
	movq -792(%rbp), %r9
	cmpq %r8, %r9
	jne .LB7961
.LB7963:
	movzbl 100(%rsi), %r8d
	shrq $7, %r8
	testb %r8b, %r8b
	jne .LB7978
.LB7979:
	movsd -424(%rbp), %xmm0
	movsd -432(%rbp), %xmm1
	xorps %xmm2, %xmm2
	xorps %xmm3, %xmm3
	movq -488(%rbp), %r10
	movq %r10, -704(%rbp)
	movq -496(%rbp), %r8
	movq -504(%rbp), %r10
	movq %r10, -712(%rbp)
	movq -512(%rbp), %r10
	movq %r10, -720(%rbp)
.LB7980:
	movq -408(%rbp), %r9
	incq %r9
	movq %r9, -784(%rbp)
	movq -784(%rbp), %r10
	movq %r10, -408(%rbp)
	movq %rax, -416(%rbp)
	movsd %xmm0, -424(%rbp)
	movsd %xmm1, -432(%rbp)
	movq -1000(%rbp), %r10
	movq %r10, -440(%rbp)
	movq -1008(%rbp), %r10
	movq %r10, -448(%rbp)
	movsd %xmm2, -456(%rbp)
	movsd %xmm3, -464(%rbp)
	movq %rcx, -472(%rbp)
	movq -792(%rbp), %r10
	movq %r10, -480(%rbp)
	movq -704(%rbp), %r10
	movq %r10, -488(%rbp)
	movq %r8, -496(%rbp)
	movq -712(%rbp), %r10
	movq %r10, -504(%rbp)
	movq -720(%rbp), %r10
	movq %r10, -512(%rbp)
	jmp .LB7880
.LB7929:
	movq 8(%rdi), %r8
	movl -408(%rbp), %r9d
	movslq %r9d, %r9
	movss (%r8,%r9,4), %xmm0
	movsd -1000(%rbp), %xmm1
	movq -408(%rbp), %r9
	addss %xmm1, %xmm0
	movss %xmm0, (%r8,%r9,4)
	jmp .LB7931
.LB7961:
	movl -408(%rbp), %r8d
	movq -792(%rbp), %r9
	movslq %r8d, %r8
	movss (%r9,%r8,4), %xmm0
	movsd -1008(%rbp), %xmm1
	movq -408(%rbp), %r8
	addss %xmm1, %xmm0
	movss %xmm0, (%r9,%r8,4)
	jmp .LB7963
.LB7978:
	movl -408(%rbp), %eax
	movq -376(%rbp), %r9
	movslq %eax, %r8
	movss (%r9,%r8,4), %xmm0
	xorl %r8d, %r8d
	movq -424(%rbp), %r10
	movq %r10, -984(%rbp)
	movq -432(%rbp), %r10
	movq %r10, -992(%rbp)
	xorps %xmm1, %xmm1
	movq -496(%rbp), %r10
	movq %r10, -728(%rbp)
.LB7988:
	cmpq %r12, %r8
	jae .LB7990
.LB7989:
	movq -408(%rbp), %r14
	movq %r8, %r9
	imulq %r13, %r9
	movslq %eax, %r15
	addq %r14, %r9
	incq %r8
	movslq %r9d, %r14
	movss (%rdx,%r14,4), %xmm2
	movq (%rdi), %r14
	movss (%r14,%r15,4), %xmm3
	movq (%rsi), %r14
	movslq %r9d, %r15
	mulss %xmm3, %xmm2
	movss (%r14,%r15,4), %xmm3
	movslq %eax, %r14
	movss (%rbx,%r14,4), %xmm4
	movsd %xmm4, -872(%rbp)
	subss %xmm4, %xmm3
	movaps %xmm2, %xmm4
	mulss %xmm3, %xmm4
	movsd %xmm4, -880(%rbp)
	addss %xmm4, %xmm1
	movsd %xmm2, -984(%rbp)
	movsd %xmm3, -992(%rbp)
	movq %r9, -728(%rbp)
	cmpq %r12, %r8
	jb .LB7989
.LB7990:
	xorps %xmm2, %xmm2
	movabsq $1056964608, %r10
	movq %r10, %xmm3
	movsd %xmm2, -736(%rbp)
	subss %xmm3, %xmm2
	movsd %xmm3, -744(%rbp)
	movsd %xmm2, -752(%rbp)
	mulss %xmm2, %xmm1
	mulss %xmm0, %xmm1
	mulss %xmm0, %xmm1
	mulss %xmm0, %xmm1
	movsd %xmm1, -816(%rbp)
	movl -408(%rbp), %eax
	xorl %r8d, %r8d
	movsd -984(%rbp), %xmm1
	movabsq $0, %r10
	movq %r10, -760(%rbp)
	movq -504(%rbp), %r10
	movq %r10, -768(%rbp)
.LB8045:
	cmpq %r12, %r8
	jae .LB8047
.LB8046:
	movq -408(%rbp), %r14
	movq %r8, %r9
	imulq %r13, %r9
	movslq %eax, %r15
	addq %r14, %r9
	incq %r8
	movslq %r9d, %r14
	movss (%rdx,%r14,4), %xmm1
	movq (%rdi), %r14
	movss (%r14,%r15,4), %xmm2
	movsd -760(%rbp), %xmm3
	mulss %xmm2, %xmm1
	movaps %xmm1, %xmm2
	mulss %xmm0, %xmm2
	movaps %xmm2, %xmm15
	movaps %xmm3, %xmm2
	subss %xmm15, %xmm2
	movsd %xmm2, -760(%rbp)
	movq %r9, -768(%rbp)
	cmpq %r12, %r8
	jb .LB8046
.LB8047:
	movl -408(%rbp), %eax
	xorl %r8d, %r8d
	movsd -992(%rbp), %xmm2
	movq -512(%rbp), %r10
	movq %r10, -776(%rbp)
.LB8079:
	cmpq %r12, %r8
	jae .LB8081
.LB8080:
	movq -408(%rbp), %r14
	movq %r8, %r9
	imulq %r13, %r9
	movslq %eax, %r15
	addq %r14, %r9
	incq %r8
	movslq %r9d, %r14
	movss (%rdx,%r14,4), %xmm1
	movq (%rdi), %r14
	movss (%r14,%r15,4), %xmm2
	movq (%rsi), %r14
	movslq %r9d, %r15
	mulss %xmm2, %xmm1
	movss (%r14,%r15,4), %xmm2
	movslq %eax, %r14
	movslq %r9d, %r15
	movss (%rbx,%r14,4), %xmm3
	movq 8(%rsi), %r14
	subss %xmm3, %xmm2
	movss (%r14,%r15,4), %xmm3
	vfmadd231ss %xmm1, %xmm0, %xmm3
	movsd %xmm3, -848(%rbp)
	movabsq $1073741824, %r10
	movq %r10, %xmm3
	movsd %xmm3, -824(%rbp)
	movsd -816(%rbp), %xmm4
	mulss %xmm4, %xmm3
	xorps %xmm4, %xmm4
	cvtsi2ssq %r12, %xmm4
	movsd %xmm3, -832(%rbp)
	mulss %xmm2, %xmm3
	movsd %xmm3, -840(%rbp)
	divss %xmm4, %xmm3
	movsd %xmm3, -856(%rbp)
	movsd -848(%rbp), %xmm5
	addss %xmm5, %xmm3
	movsd %xmm3, -864(%rbp)
	movsd -760(%rbp), %xmm5
	movaps %xmm4, %xmm15
	movaps %xmm5, %xmm4
	divss %xmm15, %xmm4
	addss %xmm4, %xmm3
	movss %xmm3, (%r14,%r9,4)
	movq %r9, -776(%rbp)
	cmpq %r12, %r8
	jb .LB8080
.LB8081:
	movq %r8, %rax
	movsd -760(%rbp), %xmm3
	movsd %xmm0, -704(%rbp)
	movq -728(%rbp), %r8
	movq -768(%rbp), %r10
	movq %r10, -712(%rbp)
	movq -776(%rbp), %r10
	movq %r10, -720(%rbp)
	movaps %xmm1, %xmm0
	movaps %xmm2, %xmm1
	movsd -816(%rbp), %xmm2
	jmp .LB7980
.LB6842:
	movq -800(%rbp), %rax
	movq 16(%rax), %r12
	movq 80(%rax), %rdi
	movzbl 100(%r12), %eax
	shrq $7, %rax
	testb %al, %al
	jne .LB7800
.LB7801:
	movq -144(%rbp), %rsi
.LB7802:
	movq -800(%rbp), %rax
	movq 80(%rax), %rax
	movq %rax, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movq STDLIB_GVP(%rip), %rax
	movq -800(%rbp), %rcx
	movq %rax, 80(%rcx)
	movq -896(%rbp), %r10
	movq %r10, -1016(%rbp)
	movq -368(%rbp), %rax
	movq -384(%rbp), %rcx
	movq -392(%rbp), %rdx
	movq -72(%rbp), %r8
	movq -80(%rbp), %r9
	movq -88(%rbp), %rbx
	movsd -96(%rbp), %xmm0
	movsd -112(%rbp), %xmm1
	movsd -120(%rbp), %xmm2
	movsd -128(%rbp), %xmm3
	movq -136(%rbp), %r13
	movq %rsi, %r14
	movq -152(%rbp), %r10
	movq %r10, -520(%rbp)
	movq -160(%rbp), %r10
	movq %r10, -528(%rbp)
	movsd -168(%rbp), %xmm4
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
	movsd -232(%rbp), %xmm5
	movq -240(%rbp), %r10
	movq %r10, -592(%rbp)
	movq %rdi, -600(%rbp)
	movq -256(%rbp), %r10
	movq %r10, -608(%rbp)
	movq -264(%rbp), %r10
	movq %r10, -616(%rbp)
	movq -272(%rbp), %r10
	movq %r10, -624(%rbp)
	movq -280(%rbp), %r10
	movq %r10, -632(%rbp)
	movq -288(%rbp), %r10
	movq %r10, -640(%rbp)
	movq -296(%rbp), %r10
	movq %r10, -648(%rbp)
	movq -304(%rbp), %r10
	movq %r10, -656(%rbp)
	movq -312(%rbp), %r10
	movq %r10, -664(%rbp)
	movq -320(%rbp), %r10
	movq %r10, -672(%rbp)
	movq -328(%rbp), %r10
	movq %r10, -680(%rbp)
	movq -336(%rbp), %r10
	movq %r10, -688(%rbp)
	movq -344(%rbp), %r10
	movq %r10, -696(%rbp)
	movq -400(%rbp), %rsi
	movq -64(%rbp), %rdi
	jmp .LB6829
.LB7800:
	xorl %eax, %eax
	testq %rsi, %rsi
	cmova %rsi, %rax
	shrq $2, %rax
	xorl %ecx, %ecx
.LB10730:
	testq %rax, %rax
	je .LB10732
.LB10731:
	movq 8(%r12), %r8
	movslq %ecx, %r9
	movss (%r8,%r9,4), %xmm0
	movss (%rdx,%r9,4), %xmm1
	movss (%rdi,%r9,4), %xmm2
	vfmadd231ss %xmm1, %xmm2, %xmm0
	movss %xmm0, (%r8,%rcx,4)
	leaq 1(%rcx), %r8
	movq 8(%r12), %r9
	movslq %r8d, %r8
	movss (%r9,%r8,4), %xmm0
	movss (%rdx,%r8,4), %xmm1
	movss (%rdi,%r8,4), %xmm2
	vfmadd231ss %xmm1, %xmm2, %xmm0
	movss %xmm0, 4(%r9,%rcx,4)
	leaq 2(%rcx), %r8
	movq 8(%r12), %r9
	movslq %r8d, %r8
	movss (%r9,%r8,4), %xmm0
	movss (%rdx,%r8,4), %xmm1
	movss (%rdi,%r8,4), %xmm2
	vfmadd231ss %xmm1, %xmm2, %xmm0
	movss %xmm0, 8(%r9,%rcx,4)
	leaq 3(%rcx), %r8
	movq 8(%r12), %r9
	movslq %r8d, %r8
	movss (%r9,%r8,4), %xmm0
	movss (%rdx,%r8,4), %xmm1
	movss (%rdi,%r8,4), %xmm2
	vfmadd231ss %xmm1, %xmm2, %xmm0
	movss %xmm0, 12(%r9,%rcx,4)
	addq $4, %rcx
	decq %rax
	jne .LB10731
.LB10732:
.LB7804:
	cmpq %rsi, %rcx
	jae .LB7806
.LB7805:
	movq 8(%r12), %rax
	movslq %ecx, %r8
	movss (%rax,%r8,4), %xmm0
	movss (%rdx,%r8,4), %xmm1
	movss (%rdi,%r8,4), %xmm2
	vfmadd231ss %xmm1, %xmm2, %xmm0
	movss %xmm0, (%rax,%rcx,4)
	incq %rcx
	cmpq %rsi, %rcx
	jb .LB7805
.LB7806:
	movq %rcx, %rsi
	jmp .LB7802
.LB6841:
	movq -800(%rbp), %rax
	movq 16(%rax), %r12
	movzbl 100(%r12), %eax
	shrq $7, %rax
	testb %al, %al
	jne .LB7671
.LB7672:
	movq -144(%rbp), %rax
	movq -152(%rbp), %rcx
	movsd -168(%rbp), %xmm0
	movq -256(%rbp), %rdx
	movq -264(%rbp), %rsi
.LB7673:
	movq -896(%rbp), %r10
	movq %r10, -1016(%rbp)
	movq -64(%rbp), %rdi
	movq -72(%rbp), %r8
	movq -80(%rbp), %r9
	movq -88(%rbp), %rbx
	movsd -112(%rbp), %xmm1
	movsd -120(%rbp), %xmm2
	movsd -128(%rbp), %xmm3
	movq -136(%rbp), %r13
	movq %rax, %r14
	movq %rcx, -520(%rbp)
	movq -160(%rbp), %r10
	movq %r10, -528(%rbp)
	movaps %xmm0, %xmm4
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
	movsd -232(%rbp), %xmm5
	movq -240(%rbp), %r10
	movq %r10, -592(%rbp)
	movq -248(%rbp), %r10
	movq %r10, -600(%rbp)
	movq %rdx, -608(%rbp)
	movq %rsi, -616(%rbp)
	movq -272(%rbp), %r10
	movq %r10, -624(%rbp)
	movq -280(%rbp), %r10
	movq %r10, -632(%rbp)
	movq -288(%rbp), %r10
	movq %r10, -640(%rbp)
	movq -296(%rbp), %r10
	movq %r10, -648(%rbp)
	movq -304(%rbp), %r10
	movq %r10, -656(%rbp)
	movq -312(%rbp), %r10
	movq %r10, -664(%rbp)
	movq -320(%rbp), %r10
	movq %r10, -672(%rbp)
	movq -328(%rbp), %r10
	movq %r10, -680(%rbp)
	movq -336(%rbp), %r10
	movq %r10, -688(%rbp)
	movq -344(%rbp), %r10
	movq %r10, -696(%rbp)
	movq -368(%rbp), %rax
	movq -384(%rbp), %rcx
	movq -392(%rbp), %rdx
	movq -400(%rbp), %rsi
	movsd -96(%rbp), %xmm0
	jmp .LB6829
.LB7671:
	movq 24(%rcx), %rax
	movq %rax, -888(%rbp)
	movq 32(%rcx), %rsi
	xorl %eax, %eax
	movq -152(%rbp), %rdi
	movsd -168(%rbp), %xmm0
.LB7687:
	movq -888(%rbp), %r8
	cmpq %r8, %rax
	jae .LB7689
.LB7688:
	movq %rax, %rdi
	imulq %rsi, %rdi
	xorl %r8d, %r8d
	xorps %xmm0, %xmm0
.LB7694:
	cmpq %rsi, %r8
	jae .LB7696
.LB7695:
	leaq (%rdi,%r8), %r9
	movslq %r9d, %r9
	movss (%rdx,%r9,4), %xmm1
	movq (%rcx), %rbx
	movss (%rbx,%r9,4), %xmm2
	mulss %xmm2, %xmm1
	addss %xmm1, %xmm0
	incq %r8
	cmpq %rsi, %r8
	jb .LB7695
	jmp .LB7696
.LB7689:
	movq %rdi, %rcx
	movq -888(%rbp), %rdx
	jmp .LB7673
.LB7696:
	movq %rax, %rdi
	imulq %rsi, %rdi
	xorl %r8d, %r8d
	testq %rsi, %rsi
	cmova %rsi, %r8
	shrq $2, %r8
	xorl %r9d, %r9d
.LB10727:
	testq %r8, %r8
	je .LB10729
.LB10728:
	movq 8(%r12), %rbx
	leaq (%rdi,%r9), %r13
	movslq %r13d, %r14
	movss (%rbx,%r14,4), %xmm1
	movq (%rcx), %r15
	movss (%r15,%r14,4), %xmm2
	movss (%rdx,%r14,4), %xmm3
	subss %xmm0, %xmm3
	vfmadd231ss %xmm2, %xmm3, %xmm1
	movss %xmm1, (%rbx,%r13,4)
	leaq 1(%r9), %rbx
	movq 8(%r12), %r13
	addq %rdi, %rbx
	movslq %ebx, %r14
	movss (%r13,%r14,4), %xmm1
	movq (%rcx), %r15
	movss (%r15,%r14,4), %xmm2
	movss (%rdx,%r14,4), %xmm3
	subss %xmm0, %xmm3
	vfmadd231ss %xmm2, %xmm3, %xmm1
	movss %xmm1, (%r13,%rbx,4)
	leaq 2(%r9), %rbx
	movq 8(%r12), %r13
	addq %rdi, %rbx
	movslq %ebx, %r14
	movss (%r13,%r14,4), %xmm1
	movq (%rcx), %r15
	movss (%r15,%r14,4), %xmm2
	movss (%rdx,%r14,4), %xmm3
	subss %xmm0, %xmm3
	vfmadd231ss %xmm2, %xmm3, %xmm1
	movss %xmm1, (%r13,%rbx,4)
	leaq 3(%r9), %rbx
	movq 8(%r12), %r13
	addq %rdi, %rbx
	movslq %ebx, %r14
	movss (%r13,%r14,4), %xmm1
	movq (%rcx), %r15
	movss (%r15,%r14,4), %xmm2
	movss (%rdx,%r14,4), %xmm3
	subss %xmm0, %xmm3
	vfmadd231ss %xmm2, %xmm3, %xmm1
	movss %xmm1, (%r13,%rbx,4)
	addq $4, %r9
	decq %r8
	jne .LB10728
.LB10729:
.LB7727:
	cmpq %rsi, %r9
	jae .LB7729
.LB7728:
	movq 8(%r12), %r8
	leaq (%rdi,%r9), %rbx
	movslq %ebx, %r13
	movss (%r8,%r13,4), %xmm1
	movq (%rcx), %r14
	movss (%r14,%r13,4), %xmm2
	movss (%rdx,%r13,4), %xmm3
	subss %xmm0, %xmm3
	vfmadd231ss %xmm2, %xmm3, %xmm1
	movss %xmm1, (%r8,%rbx,4)
	incq %r9
	cmpq %rsi, %r9
	jb .LB7728
.LB7729:
	incq %rax
	movq %r9, %rdi
	jmp .LB7687
.LB6840:
	movq -800(%rbp), %rax
	movq 16(%rax), %r12
	xorl %r14d, %r14d
.LB7616:
	cmpq %rsi, %r14
	jae .LB7618
.LB7617:
	movzbl 100(%r12), %eax
	shrq $7, %rax
	testb %al, %al
	jne .LB7626
.LB7628:
	incq %r14
	cmpq %rsi, %r14
	jb .LB7617
.LB7618:
	movq -896(%rbp), %r10
	movq %r10, -1016(%rbp)
	movq -368(%rbp), %rax
	movq -384(%rbp), %rcx
	movq -392(%rbp), %rdx
	movq -400(%rbp), %rsi
	movq -64(%rbp), %rdi
	movq -72(%rbp), %r8
	movq -80(%rbp), %r9
	movq -88(%rbp), %rbx
	movsd -96(%rbp), %xmm0
	movsd -112(%rbp), %xmm1
	movsd -120(%rbp), %xmm2
	movsd -128(%rbp), %xmm3
	movq -136(%rbp), %r13
	movq -152(%rbp), %r10
	movq %r10, -520(%rbp)
	movq -160(%rbp), %r10
	movq %r10, -528(%rbp)
	movsd -168(%rbp), %xmm4
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
	movsd -232(%rbp), %xmm5
	movq -240(%rbp), %r10
	movq %r10, -592(%rbp)
	movq -248(%rbp), %r10
	movq %r10, -600(%rbp)
	movq -256(%rbp), %r10
	movq %r10, -608(%rbp)
	movq -264(%rbp), %r10
	movq %r10, -616(%rbp)
	movq -272(%rbp), %r10
	movq %r10, -624(%rbp)
	movq -280(%rbp), %r10
	movq %r10, -632(%rbp)
	movq -288(%rbp), %r10
	movq %r10, -640(%rbp)
	movq -296(%rbp), %r10
	movq %r10, -648(%rbp)
	movq -304(%rbp), %r10
	movq %r10, -656(%rbp)
	movq -312(%rbp), %r10
	movq %r10, -664(%rbp)
	movq -320(%rbp), %r10
	movq %r10, -672(%rbp)
	movq -328(%rbp), %r10
	movq %r10, -680(%rbp)
	movq -336(%rbp), %r10
	movq %r10, -688(%rbp)
	movq -344(%rbp), %r10
	movq %r10, -696(%rbp)
	jmp .LB6829
.LB7626:
	movq 8(%r12), %rax
	movslq %r14d, %rcx
	movss (%rax,%rcx,4), %xmm0
	movss (%rdx,%rcx,4), %xmm1
	movq (%r12), %rdi
	movss (%rdi,%rcx,4), %xmm2
	divss %xmm2, %xmm1
	addss %xmm1, %xmm0
	movss %xmm0, (%rax,%r14,4)
	jmp .LB7628
.LB6839:
	movq -800(%rbp), %rax
	movq 16(%rax), %r12
	xorl %r14d, %r14d
.LB7573:
	cmpq %rsi, %r14
	jae .LB7575
.LB7574:
	movzbl 100(%r12), %eax
	shrq $7, %rax
	testb %al, %al
	jne .LB7583
.LB7585:
	incq %r14
	cmpq %rsi, %r14
	jb .LB7574
.LB7575:
	movq -896(%rbp), %r10
	movq %r10, -1016(%rbp)
	movq -368(%rbp), %rax
	movq -384(%rbp), %rcx
	movq -392(%rbp), %rdx
	movq -400(%rbp), %rsi
	movq -64(%rbp), %rdi
	movq -72(%rbp), %r8
	movq -80(%rbp), %r9
	movq -88(%rbp), %rbx
	movsd -96(%rbp), %xmm0
	movsd -112(%rbp), %xmm1
	movsd -120(%rbp), %xmm2
	movsd -128(%rbp), %xmm3
	movq -136(%rbp), %r13
	movq -152(%rbp), %r10
	movq %r10, -520(%rbp)
	movq -160(%rbp), %r10
	movq %r10, -528(%rbp)
	movsd -168(%rbp), %xmm4
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
	movsd -232(%rbp), %xmm5
	movq -240(%rbp), %r10
	movq %r10, -592(%rbp)
	movq -248(%rbp), %r10
	movq %r10, -600(%rbp)
	movq -256(%rbp), %r10
	movq %r10, -608(%rbp)
	movq -264(%rbp), %r10
	movq %r10, -616(%rbp)
	movq -272(%rbp), %r10
	movq %r10, -624(%rbp)
	movq -280(%rbp), %r10
	movq %r10, -632(%rbp)
	movq -288(%rbp), %r10
	movq %r10, -640(%rbp)
	movq -296(%rbp), %r10
	movq %r10, -648(%rbp)
	movq -304(%rbp), %r10
	movq %r10, -656(%rbp)
	movq -312(%rbp), %r10
	movq %r10, -664(%rbp)
	movq -320(%rbp), %r10
	movq %r10, -672(%rbp)
	movq -328(%rbp), %r10
	movq %r10, -680(%rbp)
	movq -336(%rbp), %r10
	movq %r10, -688(%rbp)
	movq -344(%rbp), %r10
	movq %r10, -696(%rbp)
	jmp .LB6829
.LB7583:
	movq 8(%r12), %rax
	movslq %r14d, %rcx
	movss (%rax,%rcx,4), %xmm0
	movss (%rdx,%rcx,4), %xmm1
	subss %xmm1, %xmm0
	movss %xmm0, (%rax,%r14,4)
	jmp .LB7585
.LB6838:
	movq -800(%rbp), %rax
	movq 16(%rax), %r12
	movss 36(%rax), %xmm1
	xorl %r14d, %r14d
.LB7528:
	cmpq %rsi, %r14
	jae .LB7530
.LB7529:
	movzbl 100(%r12), %eax
	shrq $7, %rax
	testb %al, %al
	jne .LB7538
.LB7540:
	incq %r14
	cmpq %rsi, %r14
	jb .LB7529
.LB7530:
	movq -896(%rbp), %r10
	movq %r10, -1016(%rbp)
	movq -368(%rbp), %rax
	movq -384(%rbp), %rcx
	movq -392(%rbp), %rdx
	movq -400(%rbp), %rsi
	movq -64(%rbp), %rdi
	movq -72(%rbp), %r8
	movq -80(%rbp), %r9
	movq -88(%rbp), %rbx
	movsd -96(%rbp), %xmm0
	movsd -120(%rbp), %xmm2
	movsd -128(%rbp), %xmm3
	movq -136(%rbp), %r13
	movq -152(%rbp), %r10
	movq %r10, -520(%rbp)
	movq -160(%rbp), %r10
	movq %r10, -528(%rbp)
	movsd -168(%rbp), %xmm4
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
	movsd -232(%rbp), %xmm5
	movq -240(%rbp), %r10
	movq %r10, -592(%rbp)
	movq -248(%rbp), %r10
	movq %r10, -600(%rbp)
	movq -256(%rbp), %r10
	movq %r10, -608(%rbp)
	movq -264(%rbp), %r10
	movq %r10, -616(%rbp)
	movq -272(%rbp), %r10
	movq %r10, -624(%rbp)
	movq -280(%rbp), %r10
	movq %r10, -632(%rbp)
	movq -288(%rbp), %r10
	movq %r10, -640(%rbp)
	movq -296(%rbp), %r10
	movq %r10, -648(%rbp)
	movq -304(%rbp), %r10
	movq %r10, -656(%rbp)
	movq -312(%rbp), %r10
	movq %r10, -664(%rbp)
	movq -320(%rbp), %r10
	movq %r10, -672(%rbp)
	movq -328(%rbp), %r10
	movq %r10, -680(%rbp)
	movq -336(%rbp), %r10
	movq %r10, -688(%rbp)
	movq -344(%rbp), %r10
	movq %r10, -696(%rbp)
	jmp .LB6829
.LB7538:
	movq 8(%r12), %rax
	movslq %r14d, %rcx
	movss (%rax,%rcx,4), %xmm0
	movss (%rdx,%rcx,4), %xmm2
	vfmadd231ss %xmm2, %xmm1, %xmm0
	movss %xmm0, (%rax,%r14,4)
	jmp .LB7540
.LB6837:
	movq -800(%rbp), %rax
	movq 16(%rax), %r12
	movss (%rdx), %xmm3
	movq 88(%r12), %r13
	xorl %r14d, %r14d
.LB7485:
	cmpq %r13, %r14
	jae .LB7487
.LB7486:
	movzbl 100(%r12), %eax
	shrq $7, %rax
	testb %al, %al
	jne .LB7495
.LB7497:
	incq %r14
	cmpq %r13, %r14
	jb .LB7486
.LB7487:
	movq -896(%rbp), %r10
	movq %r10, -1016(%rbp)
	movq -368(%rbp), %rax
	movq -384(%rbp), %rcx
	movq -392(%rbp), %rdx
	movq -400(%rbp), %rsi
	movq -64(%rbp), %rdi
	movq -72(%rbp), %r8
	movq -80(%rbp), %r9
	movq -88(%rbp), %rbx
	movsd -96(%rbp), %xmm0
	movsd -112(%rbp), %xmm1
	movsd -120(%rbp), %xmm2
	movq -152(%rbp), %r10
	movq %r10, -520(%rbp)
	movq -160(%rbp), %r10
	movq %r10, -528(%rbp)
	movsd -168(%rbp), %xmm4
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
	movsd -232(%rbp), %xmm5
	movq -240(%rbp), %r10
	movq %r10, -592(%rbp)
	movq -248(%rbp), %r10
	movq %r10, -600(%rbp)
	movq -256(%rbp), %r10
	movq %r10, -608(%rbp)
	movq -264(%rbp), %r10
	movq %r10, -616(%rbp)
	movq -272(%rbp), %r10
	movq %r10, -624(%rbp)
	movq -280(%rbp), %r10
	movq %r10, -632(%rbp)
	movq -288(%rbp), %r10
	movq %r10, -640(%rbp)
	movq -296(%rbp), %r10
	movq %r10, -648(%rbp)
	movq -304(%rbp), %r10
	movq %r10, -656(%rbp)
	movq -312(%rbp), %r10
	movq %r10, -664(%rbp)
	movq -320(%rbp), %r10
	movq %r10, -672(%rbp)
	movq -328(%rbp), %r10
	movq %r10, -680(%rbp)
	movq -336(%rbp), %r10
	movq %r10, -688(%rbp)
	movq -344(%rbp), %r10
	movq %r10, -696(%rbp)
	jmp .LB6829
.LB7495:
	movq 8(%r12), %rax
	movslq %r14d, %rcx
	movss (%rax,%rcx,4), %xmm0
	addss %xmm3, %xmm0
	movss %xmm0, (%rax,%r14,4)
	jmp .LB7497
.LB6836:
	movq -800(%rbp), %rax
	movq 16(%rax), %r12
	movsd -120(%rbp), %xmm2
	xorl %r14d, %r14d
.LB7422:
	cmpq %rsi, %r14
	jae .LB7424
.LB7423:
	movzbl 100(%r12), %eax
	shrq $7, %rax
	testb %al, %al
	jne .LB7432
.LB7433:
.LB7434:
	incq %r14
	cmpq %rsi, %r14
	jb .LB7423
.LB7424:
	movq -896(%rbp), %r10
	movq %r10, -1016(%rbp)
	movq -368(%rbp), %rax
	movq -384(%rbp), %rcx
	movq -392(%rbp), %rdx
	movq -400(%rbp), %rsi
	movq -64(%rbp), %rdi
	movq -72(%rbp), %r8
	movq -80(%rbp), %r9
	movq -88(%rbp), %rbx
	movsd -96(%rbp), %xmm0
	movsd -112(%rbp), %xmm1
	movsd -128(%rbp), %xmm3
	movq -136(%rbp), %r13
	movq -152(%rbp), %r10
	movq %r10, -520(%rbp)
	movq -160(%rbp), %r10
	movq %r10, -528(%rbp)
	movsd -168(%rbp), %xmm4
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
	movsd -232(%rbp), %xmm5
	movq -240(%rbp), %r10
	movq %r10, -592(%rbp)
	movq -248(%rbp), %r10
	movq %r10, -600(%rbp)
	movq -256(%rbp), %r10
	movq %r10, -608(%rbp)
	movq -264(%rbp), %r10
	movq %r10, -616(%rbp)
	movq -272(%rbp), %r10
	movq %r10, -624(%rbp)
	movq -280(%rbp), %r10
	movq %r10, -632(%rbp)
	movq -288(%rbp), %r10
	movq %r10, -640(%rbp)
	movq -296(%rbp), %r10
	movq %r10, -648(%rbp)
	movq -304(%rbp), %r10
	movq %r10, -656(%rbp)
	movq -312(%rbp), %r10
	movq %r10, -664(%rbp)
	movq -320(%rbp), %r10
	movq %r10, -672(%rbp)
	movq -328(%rbp), %r10
	movq %r10, -680(%rbp)
	movq -336(%rbp), %r10
	movq %r10, -688(%rbp)
	movq -344(%rbp), %r10
	movq %r10, -696(%rbp)
	jmp .LB6829
.LB7432:
	movq (%rcx), %rax
	movabsq $1065353216, %r10
	movq %r10, %xmm3
	movslq %r14d, %rdi
	movss (%rax,%rdi,4), %xmm2
	movq 8(%r12), %rax
	movss (%rax,%rdi,4), %xmm0
	movss (%rdx,%rdi,4), %xmm1
	vfnmadd231ss %xmm2, %xmm2, %xmm3
	vfmadd231ss %xmm1, %xmm3, %xmm0
	movss %xmm0, (%rax,%r14,4)
	jmp .LB7434
.LB6835:
	movq -800(%rbp), %rax
	movq 16(%rax), %r12
	movsd -112(%rbp), %xmm1
	xorl %r14d, %r14d
.LB7366:
	cmpq %rsi, %r14
	jae .LB7368
.LB7367:
	movzbl 100(%r12), %eax
	shrq $7, %rax
	testb %al, %al
	jne .LB7376
.LB7377:
.LB7378:
	incq %r14
	cmpq %rsi, %r14
	jb .LB7367
.LB7368:
	movq -896(%rbp), %r10
	movq %r10, -1016(%rbp)
	movq -368(%rbp), %rax
	movq -384(%rbp), %rcx
	movq -392(%rbp), %rdx
	movq -400(%rbp), %rsi
	movq -64(%rbp), %rdi
	movq -72(%rbp), %r8
	movq -80(%rbp), %r9
	movq -88(%rbp), %rbx
	movsd -96(%rbp), %xmm0
	movsd -120(%rbp), %xmm2
	movsd -128(%rbp), %xmm3
	movq -136(%rbp), %r13
	movq -152(%rbp), %r10
	movq %r10, -520(%rbp)
	movq -160(%rbp), %r10
	movq %r10, -528(%rbp)
	movsd -168(%rbp), %xmm4
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
	movsd -232(%rbp), %xmm5
	movq -240(%rbp), %r10
	movq %r10, -592(%rbp)
	movq -248(%rbp), %r10
	movq %r10, -600(%rbp)
	movq -256(%rbp), %r10
	movq %r10, -608(%rbp)
	movq -264(%rbp), %r10
	movq %r10, -616(%rbp)
	movq -272(%rbp), %r10
	movq %r10, -624(%rbp)
	movq -280(%rbp), %r10
	movq %r10, -632(%rbp)
	movq -288(%rbp), %r10
	movq %r10, -640(%rbp)
	movq -296(%rbp), %r10
	movq %r10, -648(%rbp)
	movq -304(%rbp), %r10
	movq %r10, -656(%rbp)
	movq -312(%rbp), %r10
	movq %r10, -664(%rbp)
	movq -320(%rbp), %r10
	movq %r10, -672(%rbp)
	movq -328(%rbp), %r10
	movq %r10, -680(%rbp)
	movq -336(%rbp), %r10
	movq %r10, -688(%rbp)
	movq -344(%rbp), %r10
	movq %r10, -696(%rbp)
	jmp .LB6829
.LB7376:
	movq (%rcx), %rax
	movabsq $1065353216, %r10
	movq %r10, %xmm3
	movslq %r14d, %rdi
	movss (%rax,%rdi,4), %xmm1
	movq 8(%r12), %rax
	movss (%rax,%rdi,4), %xmm0
	movss (%rdx,%rdi,4), %xmm2
	subss %xmm1, %xmm3
	mulss %xmm1, %xmm2
	vfmadd231ss %xmm2, %xmm3, %xmm0
	movss %xmm0, (%rax,%r14,4)
	jmp .LB7378
.LB6834:
	movq -800(%rbp), %rax
	movq 16(%rax), %r12
	xorl %r14d, %r14d
.LB7310:
	cmpq %rsi, %r14
	jae .LB7312
.LB7311:
	movzbl 100(%r12), %eax
	shrq $7, %rax
	testb %al, %al
	jne .LB7320
.LB7322:
	incq %r14
	cmpq %rsi, %r14
	jb .LB7311
.LB7312:
	movq -896(%rbp), %r10
	movq %r10, -1016(%rbp)
	movq -368(%rbp), %rax
	movq -384(%rbp), %rcx
	movq -392(%rbp), %rdx
	movq -400(%rbp), %rsi
	movq -64(%rbp), %rdi
	movq -72(%rbp), %r8
	movq -80(%rbp), %r9
	movq -88(%rbp), %rbx
	movsd -96(%rbp), %xmm0
	movsd -112(%rbp), %xmm1
	movsd -120(%rbp), %xmm2
	movsd -128(%rbp), %xmm3
	movq -136(%rbp), %r13
	movq -152(%rbp), %r10
	movq %r10, -520(%rbp)
	movq -160(%rbp), %r10
	movq %r10, -528(%rbp)
	movsd -168(%rbp), %xmm4
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
	movsd -232(%rbp), %xmm5
	movq -240(%rbp), %r10
	movq %r10, -592(%rbp)
	movq -248(%rbp), %r10
	movq %r10, -600(%rbp)
	movq -256(%rbp), %r10
	movq %r10, -608(%rbp)
	movq -264(%rbp), %r10
	movq %r10, -616(%rbp)
	movq -272(%rbp), %r10
	movq %r10, -624(%rbp)
	movq -280(%rbp), %r10
	movq %r10, -632(%rbp)
	movq -288(%rbp), %r10
	movq %r10, -640(%rbp)
	movq -296(%rbp), %r10
	movq %r10, -648(%rbp)
	movq -304(%rbp), %r10
	movq %r10, -656(%rbp)
	movq -312(%rbp), %r10
	movq %r10, -664(%rbp)
	movq -320(%rbp), %r10
	movq %r10, -672(%rbp)
	movq -328(%rbp), %r10
	movq %r10, -680(%rbp)
	movq -336(%rbp), %r10
	movq %r10, -688(%rbp)
	movq -344(%rbp), %r10
	movq %r10, -696(%rbp)
	jmp .LB6829
.LB7320:
	movq 8(%r12), %rax
	movslq %r14d, %rcx
	movss (%rax,%rcx,4), %xmm0
	movq (%r12), %rax
	movss (%rax,%rcx,4), %xmm1
	xorps %xmm2, %xmm2
	ucomiss %xmm2, %xmm1
	ja .LB7340
.LB7341:
	xorps %xmm1, %xmm1
.LB7342:
	addss %xmm1, %xmm0
	movq 8(%r12), %rax
	movss %xmm0, (%rax,%r14,4)
	jmp .LB7322
.LB7340:
	movslq %r14d, %rax
	movss (%rdx,%rax,4), %xmm1
	jmp .LB7342
.LB6833:
	movq -800(%rbp), %rax
	movq 16(%rax), %rcx
	movq %rcx, -944(%rbp)
	movq 24(%rax), %rcx
	movq %rcx, -936(%rbp)
	movq 40(%rax), %rsi
	movq 48(%rax), %rdi
	movq 56(%rax), %rbx
	movq -800(%rbp), %rax
	movq 64(%rax), %r12
	movq 72(%rax), %r13
	movq -944(%rbp), %rax
	movzbl 100(%rax), %eax
	shrq $7, %rax
	testb %al, %al
	jne .LB7128
.LB7129:
	movsd -96(%rbp), %xmm0
	movq -144(%rbp), %rax
	movq -152(%rbp), %rcx
	movq -160(%rbp), %r8
.LB7130:
	movq -936(%rbp), %r9
	movzbl 100(%r9), %r9d
	shrq $7, %r9
	testb %r9b, %r9b
	jne .LB7209
.LB7210:
	movsd %xmm0, -904(%rbp)
	movq %rax, -912(%rbp)
	movq %rcx, -920(%rbp)
	movq %r8, -928(%rbp)
.LB7211:
	movq -800(%rbp), %rax
	movq 40(%rax), %rax
	movq %rax, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movq -800(%rbp), %rax
	movq 48(%rax), %rax
	movq %rax, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movq STDLIB_GVP(%rip), %rax
	movq -800(%rbp), %rcx
	movq %rax, 40(%rcx)
	movq STDLIB_GVP(%rip), %rax
	movq %rax, 48(%rcx)
	movq -896(%rbp), %r10
	movq %r10, -1016(%rbp)
	movq -368(%rbp), %rax
	movq -944(%rbp), %rcx
	movq -936(%rbp), %rdx
	movq %rbx, %r8
	movq %r12, %r9
	movq %r13, %rbx
	movsd -904(%rbp), %xmm0
	movq -104(%rbp), %r12
	movsd -112(%rbp), %xmm1
	movsd -120(%rbp), %xmm2
	movsd -128(%rbp), %xmm3
	movq -136(%rbp), %r13
	movq -912(%rbp), %r14
	movq -920(%rbp), %r10
	movq %r10, -520(%rbp)
	movq -928(%rbp), %r10
	movq %r10, -528(%rbp)
	movsd -168(%rbp), %xmm4
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
	movsd -232(%rbp), %xmm5
	movq -240(%rbp), %r10
	movq %r10, -592(%rbp)
	movq -248(%rbp), %r10
	movq %r10, -600(%rbp)
	movq -256(%rbp), %r10
	movq %r10, -608(%rbp)
	movq -264(%rbp), %r10
	movq %r10, -616(%rbp)
	movq -272(%rbp), %r10
	movq %r10, -624(%rbp)
	movq -280(%rbp), %r10
	movq %r10, -632(%rbp)
	movq -288(%rbp), %r10
	movq %r10, -640(%rbp)
	movq -296(%rbp), %r10
	movq %r10, -648(%rbp)
	movq -304(%rbp), %r10
	movq %r10, -656(%rbp)
	movq -312(%rbp), %r10
	movq %r10, -664(%rbp)
	movq -320(%rbp), %r10
	movq %r10, -672(%rbp)
	movq -328(%rbp), %r10
	movq %r10, -680(%rbp)
	movq -336(%rbp), %r10
	movq %r10, -688(%rbp)
	movq -344(%rbp), %r10
	movq %r10, -696(%rbp)
	jmp .LB6829
.LB7128:
	movsd -96(%rbp), %xmm0
	movq $0, -960(%rbp)
	movq -152(%rbp), %rcx
	movq -160(%rbp), %r8
.LB7132:
	movq -960(%rbp), %rax
	cmpq %rbx, %rax
	jae .LB7134
.LB7133:
	movq -960(%rbp), %rax
	movq %rax, %r8
	imulq %r13, %r8
	imulq %r12, %rax
	movq %rax, -968(%rbp)
	xorl %eax, %eax
.LB7139:
	cmpq %r12, %rax
	jae .LB7141
.LB7140:
	movq %rax, %rcx
	imulq %r13, %rcx
	xorps %xmm0, %xmm0
	xorl %r9d, %r9d
.LB7146:
	cmpq %r13, %r9
	jae .LB7148
.LB7147:
	leaq (%r8,%r9), %r14
	movslq %r14d, %r14
	movss (%rdx,%r14,4), %xmm1
	leaq (%rcx,%r9), %r14
	movslq %r14d, %r14
	movss (%rdi,%r14,4), %xmm2
	mulss %xmm2, %xmm1
	addss %xmm1, %xmm0
	incq %r9
	cmpq %r13, %r9
	jb .LB7147
	jmp .LB7148
.LB7134:
	movq -960(%rbp), %rax
	jmp .LB7130
.LB7209:
	xorl %r8d, %r8d
.LB7213:
	cmpq %r12, %r8
	jae .LB7215
.LB7214:
	movq %r8, %rcx
	imulq %r13, %rcx
	movq %rcx, -952(%rbp)
	xorl %ecx, %ecx
.LB7220:
	cmpq %r13, %rcx
	jae .LB7222
.LB7221:
	xorps %xmm0, %xmm0
	xorl %eax, %eax
.LB7227:
	cmpq %rbx, %rax
	jae .LB7229
.LB7228:
	movq %rax, %r9
	imulq %r12, %r9
	addq %r8, %r9
	movslq %r9d, %r9
	movss (%rsi,%r9,4), %xmm1
	movq %rax, %r9
	imulq %r13, %r9
	addq %rcx, %r9
	movslq %r9d, %r9
	movss (%rdx,%r9,4), %xmm2
	mulss %xmm2, %xmm1
	addss %xmm1, %xmm0
	incq %rax
	cmpq %rbx, %rax
	jb .LB7228
	jmp .LB7229
.LB7215:
	movsd %xmm0, -904(%rbp)
	movq %rax, -912(%rbp)
	movq %rcx, -920(%rbp)
	movq %r8, -928(%rbp)
	jmp .LB7211
.LB7222:
	incq %r8
	cmpq %r12, %r8
	jb .LB7214
	jmp .LB7215
.LB7229:
	movq -936(%rbp), %r9
	movq 8(%r9), %r9
	movq -952(%rbp), %r14
	addq %rcx, %r14
	movslq %r14d, %r15
	movss (%r9,%r15,4), %xmm1
	addss %xmm0, %xmm1
	movss %xmm1, (%r9,%r14,4)
	incq %rcx
	cmpq %r13, %rcx
	jb .LB7221
	jmp .LB7222
.LB7141:
	movq -960(%rbp), %r8
	incq %r8
	movq %r8, -960(%rbp)
	movq %rax, %r8
	jmp .LB7132
.LB7148:
	movq -944(%rbp), %rcx
	movq 8(%rcx), %rcx
	movq -968(%rbp), %r14
	addq %rax, %r14
	movslq %r14d, %r15
	movss (%rcx,%r15,4), %xmm1
	addss %xmm0, %xmm1
	movss %xmm1, (%rcx,%r14,4)
	incq %rax
	movq %r9, %rcx
	cmpq %r12, %rax
	jb .LB7140
	jmp .LB7141
.LB6832:
	movq -800(%rbp), %rax
	movq 16(%rax), %rcx
	movq 24(%rax), %rax
	xorl %r14d, %r14d
.LB7010:
	cmpq %rsi, %r14
	jae .LB7012
.LB7011:
	movzbl 100(%rcx), %edi
	shrq $7, %rdi
	testb %dil, %dil
	jne .LB7020
.LB7022:
	movzbl 100(%rax), %edi
	shrq $7, %rdi
	testb %dil, %dil
	jne .LB7058
.LB7060:
	incq %r14
	cmpq %rsi, %r14
	jb .LB7011
.LB7012:
	movq %rcx, -1016(%rbp)
	movq -384(%rbp), %rcx
	movq -392(%rbp), %rdx
	movq -400(%rbp), %rsi
	movq -64(%rbp), %rdi
	movq -72(%rbp), %r8
	movq -80(%rbp), %r9
	movq -88(%rbp), %rbx
	movsd -96(%rbp), %xmm0
	movq -104(%rbp), %r12
	movsd -112(%rbp), %xmm1
	movsd -120(%rbp), %xmm2
	movsd -128(%rbp), %xmm3
	movq -136(%rbp), %r13
	movq -152(%rbp), %r10
	movq %r10, -520(%rbp)
	movq -160(%rbp), %r10
	movq %r10, -528(%rbp)
	movsd -168(%rbp), %xmm4
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
	movsd -232(%rbp), %xmm5
	movq -240(%rbp), %r10
	movq %r10, -592(%rbp)
	movq -248(%rbp), %r10
	movq %r10, -600(%rbp)
	movq -256(%rbp), %r10
	movq %r10, -608(%rbp)
	movq -264(%rbp), %r10
	movq %r10, -616(%rbp)
	movq -272(%rbp), %r10
	movq %r10, -624(%rbp)
	movq -280(%rbp), %r10
	movq %r10, -632(%rbp)
	movq -288(%rbp), %r10
	movq %r10, -640(%rbp)
	movq -296(%rbp), %r10
	movq %r10, -648(%rbp)
	movq -304(%rbp), %r10
	movq %r10, -656(%rbp)
	movq -312(%rbp), %r10
	movq %r10, -664(%rbp)
	movq -320(%rbp), %r10
	movq %r10, -672(%rbp)
	movq -328(%rbp), %r10
	movq %r10, -680(%rbp)
	movq -336(%rbp), %r10
	movq %r10, -688(%rbp)
	movq -344(%rbp), %r10
	movq %r10, -696(%rbp)
	jmp .LB6829
.LB7020:
	movq 8(%rcx), %rdi
	movslq %r14d, %r8
	movss (%rdi,%r8,4), %xmm0
	movss (%rdx,%r8,4), %xmm1
	movq (%rax), %r9
	movss (%r9,%r8,4), %xmm2
	vfmadd231ss %xmm1, %xmm2, %xmm0
	movss %xmm0, (%rdi,%r14,4)
	jmp .LB7022
.LB7058:
	movq 8(%rax), %rdi
	movslq %r14d, %r8
	movss (%rdi,%r8,4), %xmm0
	movss (%rdx,%r8,4), %xmm1
	movq (%rcx), %r9
	movss (%r9,%r8,4), %xmm2
	vfmadd231ss %xmm1, %xmm2, %xmm0
	movss %xmm0, (%rdi,%r14,4)
	jmp .LB7060
.LB6831:
	movq -800(%rbp), %rax
	movq 16(%rax), %rcx
	movq 24(%rax), %rax
	xorl %r14d, %r14d
.LB6933:
	cmpq %rsi, %r14
	jae .LB6935
.LB6934:
	movzbl 100(%rcx), %edi
	shrq $7, %rdi
	testb %dil, %dil
	jne .LB6943
.LB6945:
	movzbl 100(%rax), %edi
	shrq $7, %rdi
	testb %dil, %dil
	jne .LB6972
.LB6974:
	incq %r14
	cmpq %rsi, %r14
	jb .LB6934
.LB6935:
	movq %rcx, -1016(%rbp)
	movq -384(%rbp), %rcx
	movq -392(%rbp), %rdx
	movq -400(%rbp), %rsi
	movq -64(%rbp), %rdi
	movq -72(%rbp), %r8
	movq -80(%rbp), %r9
	movq -88(%rbp), %rbx
	movsd -96(%rbp), %xmm0
	movq -104(%rbp), %r12
	movsd -112(%rbp), %xmm1
	movsd -120(%rbp), %xmm2
	movsd -128(%rbp), %xmm3
	movq -136(%rbp), %r13
	movq -152(%rbp), %r10
	movq %r10, -520(%rbp)
	movq -160(%rbp), %r10
	movq %r10, -528(%rbp)
	movsd -168(%rbp), %xmm4
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
	movsd -232(%rbp), %xmm5
	movq -240(%rbp), %r10
	movq %r10, -592(%rbp)
	movq -248(%rbp), %r10
	movq %r10, -600(%rbp)
	movq -256(%rbp), %r10
	movq %r10, -608(%rbp)
	movq -264(%rbp), %r10
	movq %r10, -616(%rbp)
	movq -272(%rbp), %r10
	movq %r10, -624(%rbp)
	movq -280(%rbp), %r10
	movq %r10, -632(%rbp)
	movq -288(%rbp), %r10
	movq %r10, -640(%rbp)
	movq -296(%rbp), %r10
	movq %r10, -648(%rbp)
	movq -304(%rbp), %r10
	movq %r10, -656(%rbp)
	movq -312(%rbp), %r10
	movq %r10, -664(%rbp)
	movq -320(%rbp), %r10
	movq %r10, -672(%rbp)
	movq -328(%rbp), %r10
	movq %r10, -680(%rbp)
	movq -336(%rbp), %r10
	movq %r10, -688(%rbp)
	movq -344(%rbp), %r10
	movq %r10, -696(%rbp)
	jmp .LB6829
.LB6943:
	movq 8(%rcx), %rdi
	movslq %r14d, %r8
	movss (%rdi,%r8,4), %xmm0
	movss (%rdx,%r8,4), %xmm1
	addss %xmm1, %xmm0
	movss %xmm0, (%rdi,%r14,4)
	jmp .LB6945
.LB6972:
	movq 8(%rax), %rdi
	movslq %r14d, %r8
	movss (%rdi,%r8,4), %xmm0
	movss (%rdx,%r8,4), %xmm1
	subss %xmm1, %xmm0
	movss %xmm0, (%rdi,%r14,4)
	jmp .LB6974
.LB6830:
	movq -800(%rbp), %rax
	movq 16(%rax), %rcx
	movq 24(%rax), %rax
	xorl %r14d, %r14d
.LB6856:
	cmpq %rsi, %r14
	jae .LB6858
.LB6857:
	movzbl 100(%rcx), %edi
	shrq $7, %rdi
	testb %dil, %dil
	jne .LB6866
.LB6868:
	movzbl 100(%rax), %edi
	shrq $7, %rdi
	testb %dil, %dil
	jne .LB6895
.LB6897:
	incq %r14
	cmpq %rsi, %r14
	jb .LB6857
.LB6858:
	movq %rcx, -1016(%rbp)
	movq -384(%rbp), %rcx
	movq -392(%rbp), %rdx
	movq -400(%rbp), %rsi
	movq -64(%rbp), %rdi
	movq -72(%rbp), %r8
	movq -80(%rbp), %r9
	movq -88(%rbp), %rbx
	movsd -96(%rbp), %xmm0
	movq -104(%rbp), %r12
	movsd -112(%rbp), %xmm1
	movsd -120(%rbp), %xmm2
	movsd -128(%rbp), %xmm3
	movq -136(%rbp), %r13
	movq -152(%rbp), %r10
	movq %r10, -520(%rbp)
	movq -160(%rbp), %r10
	movq %r10, -528(%rbp)
	movsd -168(%rbp), %xmm4
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
	movsd -232(%rbp), %xmm5
	movq -240(%rbp), %r10
	movq %r10, -592(%rbp)
	movq -248(%rbp), %r10
	movq %r10, -600(%rbp)
	movq -256(%rbp), %r10
	movq %r10, -608(%rbp)
	movq -264(%rbp), %r10
	movq %r10, -616(%rbp)
	movq -272(%rbp), %r10
	movq %r10, -624(%rbp)
	movq -280(%rbp), %r10
	movq %r10, -632(%rbp)
	movq -288(%rbp), %r10
	movq %r10, -640(%rbp)
	movq -296(%rbp), %r10
	movq %r10, -648(%rbp)
	movq -304(%rbp), %r10
	movq %r10, -656(%rbp)
	movq -312(%rbp), %r10
	movq %r10, -664(%rbp)
	movq -320(%rbp), %r10
	movq %r10, -672(%rbp)
	movq -328(%rbp), %r10
	movq %r10, -680(%rbp)
	movq -336(%rbp), %r10
	movq %r10, -688(%rbp)
	movq -344(%rbp), %r10
	movq %r10, -696(%rbp)
	jmp .LB6829
.LB6866:
	movq 8(%rcx), %rdi
	movslq %r14d, %r8
	movss (%rdi,%r8,4), %xmm0
	movss (%rdx,%r8,4), %xmm1
	addss %xmm1, %xmm0
	movss %xmm0, (%rdi,%r14,4)
	jmp .LB6868
.LB6895:
	movq 8(%rax), %rdi
	movslq %r14d, %r8
	movss (%rdi,%r8,4), %xmm0
	movss (%rdx,%r8,4), %xmm1
	addss %xmm1, %xmm0
	movss %xmm0, (%rdi,%r14,4)
	jmp .LB6897
.LB6844:
	movq -896(%rbp), %r10
	movq %r10, -1016(%rbp)
	movq -368(%rbp), %rax
	movq -384(%rbp), %rcx
	movq -392(%rbp), %rdx
	movq -400(%rbp), %rsi
	movq -64(%rbp), %rdi
	movq -72(%rbp), %r8
	movq -80(%rbp), %r9
	movq -88(%rbp), %rbx
	movsd -96(%rbp), %xmm0
	movq -104(%rbp), %r12
	movsd -112(%rbp), %xmm1
	movsd -120(%rbp), %xmm2
	movsd -128(%rbp), %xmm3
	movq -136(%rbp), %r13
	movq -144(%rbp), %r14
	movq -152(%rbp), %r10
	movq %r10, -520(%rbp)
	movq -160(%rbp), %r10
	movq %r10, -528(%rbp)
	movsd -168(%rbp), %xmm4
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
	movsd -232(%rbp), %xmm5
	movq -240(%rbp), %r10
	movq %r10, -592(%rbp)
	movq -248(%rbp), %r10
	movq %r10, -600(%rbp)
	movq -256(%rbp), %r10
	movq %r10, -608(%rbp)
	movq -264(%rbp), %r10
	movq %r10, -616(%rbp)
	movq -272(%rbp), %r10
	movq %r10, -624(%rbp)
	movq -280(%rbp), %r10
	movq %r10, -632(%rbp)
	movq -288(%rbp), %r10
	movq %r10, -640(%rbp)
	movq -296(%rbp), %r10
	movq %r10, -648(%rbp)
	movq -304(%rbp), %r10
	movq %r10, -656(%rbp)
	movq -312(%rbp), %r10
	movq %r10, -664(%rbp)
	movq -320(%rbp), %r10
	movq %r10, -672(%rbp)
	movq -328(%rbp), %r10
	movq %r10, -680(%rbp)
	movq -336(%rbp), %r10
	movq %r10, -688(%rbp)
	movq -344(%rbp), %r10
	movq %r10, -696(%rbp)
	jmp .LB6829
	.section .rodata
	.p2align 3
.LJT10733:
	.quad .LB6830
	.quad .LB6831
	.quad .LB6832
	.quad .LB6833
	.quad .LB6834
	.quad .LB6835
	.quad .LB6836
	.quad .LB6837
	.quad .LB6838
	.quad .LB6839
	.quad .LB6840
	.quad .LB6841
	.quad .LB6842
	.quad .LB6843
	.text
	.text
	.globl standard__neuralnet__nn_init_he__4__floatE1_ptr1__dataE1_ubits64__dataE1_ubits64__PCG32E1_ptr1__ret_voidE1
	.def standard__neuralnet__nn_init_he__4__floatE1_ptr1__dataE1_ubits64__dataE1_ubits64__PCG32E1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__neuralnet__nn_init_he__4__floatE1_ptr1__dataE1_ubits64__dataE1_ubits64__PCG32E1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $112, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
.LB8233:
	movq %rcx, %rsi
	movq %rdx, %rdi
	movq %r9, %rbx
	xorps %xmm0, %xmm0
	cvtsi2ssq %r8, %xmm0
	movabsq $1073741824, %r10
	movq %r10, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	divss %xmm15, %xmm0
	movaps %xmm0, %xmm1
	sqrtss %xmm1, %xmm0
	movsd %xmm0, -40(%rbp)
	xorl %r12d, %r12d
.LB8244:
	cmpq %rdi, %r12
	jae .LB8246
.LB8245:
	movq %rbx, %rcx
	callq standard__random__pcg32_next__1__PCG32E1_ptr1__ret_dataE1_ubits32
	movslq %eax, %rax
	xorps %xmm0, %xmm0
	cvtsi2ssq %rax, %xmm0
	movabsq $1333788672, %r10
	movq %r10, %xmm1
	divss %xmm1, %xmm0
	movsd %xmm0, -48(%rbp)
	movq %rbx, %rcx
	callq standard__random__pcg32_next__1__PCG32E1_ptr1__ret_dataE1_ubits32
	movslq %eax, %rax
	xorps %xmm0, %xmm0
	cvtsi2ssq %rax, %xmm0
	movabsq $1333788672, %r10
	movq %r10, %xmm1
	divss %xmm1, %xmm0
	movsd %xmm0, -56(%rbp)
	movsd -48(%rbp), %xmm0
	cvtss2sd %xmm0, %xmm0
	movabsq $4502148214488346440, %r10
	movq %r10, %xmm1
	ucomisd %xmm0, %xmm1
	ja .LB8261
.LB8262:
	movsd -48(%rbp), %xmm0
.LB8263:
	xorps %xmm1, %xmm1
	movabsq $1073741824, %r10
	movq %r10, %xmm2
	cvtss2sd %xmm0, %xmm0
	subss %xmm2, %xmm1
	movsd %xmm1, -64(%rbp)
	callq standard__math__log__1__doubleE1__ret_doubleE1
	cvtsd2ss %xmm0, %xmm0
	movsd -64(%rbp), %xmm1
	mulss %xmm1, %xmm0
	movaps %xmm0, %xmm1
	sqrtss %xmm1, %xmm0
	movsd %xmm0, -72(%rbp)
	movsd -56(%rbp), %xmm0
	cvtss2sd %xmm0, %xmm0
	movabsq $4618760256179416810, %r10
	movq %r10, %xmm1
	mulsd %xmm1, %xmm0
	callq standard__math__cos__1__doubleE1__ret_doubleE1
	movsd -72(%rbp), %xmm1
	cvtss2sd %xmm1, %xmm1
	mulsd %xmm1, %xmm0
	cvtsd2ss %xmm0, %xmm0
	movsd -40(%rbp), %xmm1
	mulss %xmm1, %xmm0
	movss %xmm0, (%rsi,%r12,4)
	incq %r12
	cmpq %rdi, %r12
	jb .LB8245
.LB8246:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB8261:
	movabsq $4502148214488346440, %r10
	movq %r10, %xmm0
	cvtsd2ss %xmm0, %xmm0
	jmp .LB8263
	.text
	.globl standard__neuralnet__nn_init_xavier__5__floatE1_ptr1__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__PCG32E1_ptr1__ret_voidE1
	.def standard__neuralnet__nn_init_xavier__5__floatE1_ptr1__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__PCG32E1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__neuralnet__nn_init_xavier__5__floatE1_ptr1__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__PCG32E1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $80, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
.LB8286:
	movq %rcx, %rsi
	movq %rdx, %rdi
	movq 48(%rbp), %rbx
	addq %r9, %r8
	xorps %xmm0, %xmm0
	cvtsi2ssq %r8, %xmm0
	movabsq $1086324736, %r10
	movq %r10, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	divss %xmm15, %xmm0
	movaps %xmm0, %xmm1
	sqrtss %xmm1, %xmm0
	movsd %xmm0, -40(%rbp)
	xorl %r12d, %r12d
.LB8300:
	cmpq %rdi, %r12
	jae .LB8302
.LB8301:
	xorps %xmm0, %xmm0
	movsd -40(%rbp), %xmm2
	subss %xmm2, %xmm0
	movq %rbx, %rcx
	movaps %xmm0, %xmm1
	callq standard__random__random_range_float__3__PCG32E1_ptr1__floatE1__floatE1__ret_floatE1
	movss %xmm0, (%rsi,%r12,4)
	incq %r12
	cmpq %rdi, %r12
	jb .LB8301
.LB8302:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
	.text
	.globl standard__neuralnet__nn_init_zeros__2__floatE1_ptr1__dataE1_ubits64__ret_voidE1
	.def standard__neuralnet__nn_init_zeros__2__floatE1_ptr1__dataE1_ubits64__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__neuralnet__nn_init_zeros__2__floatE1_ptr1__dataE1_ubits64__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB8317:
	movq %rcx, %rax
	movq %rdx, %r8
	shlq $5, %r8
	movq %rax, %rcx
	xorl %edx, %edx
	callq memset
	leave
	ret
	.text
	.globl standard__neuralnet__nn_linear_init__5__LinearE1_ptr1__dataE1_ubits64__dataE1_ubits64__intE1__PCG32E1_ptr1__ret_voidE1
	.def standard__neuralnet__nn_linear_init__5__LinearE1_ptr1__dataE1_ubits64__dataE1_ubits64__intE1__PCG32E1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__neuralnet__nn_linear_init__5__LinearE1_ptr1__dataE1_ubits64__dataE1_ubits64__intE1__PCG32E1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $96, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
	movq %r14, -48(%rbp)
.LB8326:
	movq %rdx, %rdi
	movq %r8, %rbx
	movq 48(%rbp), %r13
	movq %rcx, %rsi
	movq %rbx, %r14
	imulq %rdi, %r14
	movl %r9d, %r12d
	movq %rdi, 16(%rsi)
	movq %rbx, 24(%rsi)
	movl %r12d, 32(%rsi)
	movq %r14, %rcx
	shlq $5, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rbx, %rcx
	shlq $5, %rcx
	movq %rax, (%rsi)
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, 8(%rsi)
	cmpl $1, %r12d
	je .LB8361
.LB8362:
	testl %r12d, %r12d
	je .LB8374
.LB8375:
	movq (%rsi), %rcx
	movq %r13, 32(%rsp)
	movq %r14, %rdx
	movq %rdi, %r8
	movq %rbx, %r9
	callq standard__neuralnet__nn_init_xavier__5__floatE1_ptr1__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__PCG32E1_ptr1__ret_voidE1
.LB8363:
	movq 8(%rsi), %rax
	movq %rbx, %r8
	shlq $5, %r8
	movq %rax, %rcx
	xorl %edx, %edx
	callq memset
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	leave
	ret
.LB8374:
	xorl %edi, %edi
.LB8377:
	cmpq %r14, %rdi
	jae .LB8363
.LB8378:
	xorps %xmm0, %xmm0
	movabsq $1036831949, %r10
	movq %r10, %xmm1
	subss %xmm1, %xmm0
	movabsq $1036831949, %r10
	movq %r10, %xmm2
	movq %r13, %rcx
	movaps %xmm0, %xmm1
	callq standard__random__random_range_float__3__PCG32E1_ptr1__floatE1__floatE1__ret_floatE1
	movq (%rsi), %rax
	movss %xmm0, (%rax,%rdi,4)
	incq %rdi
	cmpq %r14, %rdi
	jb .LB8378
	jmp .LB8363
.LB8361:
	movq (%rsi), %rcx
	movq %r14, %rdx
	movq %rdi, %r8
	movq %r13, %r9
	callq standard__neuralnet__nn_init_he__4__floatE1_ptr1__dataE1_ubits64__dataE1_ubits64__PCG32E1_ptr1__ret_voidE1
	jmp .LB8363
	.text
	.globl standard__neuralnet__nn_linear_free__1__LinearE1_ptr1__ret_voidE1
	.def standard__neuralnet__nn_linear_free__1__LinearE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__neuralnet__nn_linear_free__1__LinearE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
.LB8411:
	movq %rcx, %rsi
	movq (%rsi), %rax
	movq STDLIB_GVP(%rip), %rcx
	cmpq %rcx, %rax
	jne .LB8422
.LB8424:
	movq 8(%rsi), %rax
	movq STDLIB_GVP(%rip), %rcx
	cmpq %rcx, %rax
	jne .LB8443
.LB8444:
	movq -8(%rbp), %rsi
	leave
	ret
.LB8422:
	movq %rax, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movq STDLIB_GVP(%rip), %rax
	movq %rax, (%rsi)
	jmp .LB8424
.LB8443:
	movq %rax, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movq STDLIB_GVP(%rip), %rax
	movq %rax, 8(%rsi)
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl standard__neuralnet__nn_linear_free_intermediates__1__LinearE1_ptr1__ret_voidE1
	.def standard__neuralnet__nn_linear_free_intermediates__1__LinearE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__neuralnet__nn_linear_free_intermediates__1__LinearE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB8455:
	movq %rcx, %rsi
	movq 80(%rsi), %rax
	movq 72(%rsi), %rcx
	cmpq %rcx, %rax
	je .LB8482
.LB8468:
	movq STDLIB_GVP(%rip), %rcx
	cmpq %rcx, %rax
	jne .LB8480
.LB8482:
	movq 72(%rsi), %rax
	movq STDLIB_GVP(%rip), %rcx
	movq %rax, %rdi
	cmpq %rcx, %rdi
	jne .LB8500
.LB8502:
	movq 64(%rsi), %rax
	movq STDLIB_GVP(%rip), %rcx
	movq %rax, %rdi
	cmpq %rcx, %rdi
	jne .LB8520
.LB8522:
	movq 56(%rsi), %rax
	movq STDLIB_GVP(%rip), %rcx
	movq %rax, %rdi
	cmpq %rcx, %rdi
	jne .LB8540
.LB8542:
	movq 40(%rsi), %rax
	movq STDLIB_GVP(%rip), %rcx
	movq %rax, %rdi
	cmpq %rcx, %rdi
	jne .LB8560
.LB8562:
	movq 48(%rsi), %rax
	movq STDLIB_GVP(%rip), %rcx
	movq %rax, %rdi
	cmpq %rcx, %rdi
	jne .LB8580
.LB8581:
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB8480:
	movq 80(%rsi), %rdi
	movq %rdi, %rcx
	callq standard__autograd__gt_free__1__GradTensorE1_ptr1__ret_voidE1
	movq %rdi, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movq STDLIB_GVP(%rip), %rax
	movq %rax, 80(%rsi)
	jmp .LB8482
.LB8500:
	movq %rax, %rcx
	callq standard__autograd__gt_free__1__GradTensorE1_ptr1__ret_voidE1
	movq %rdi, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movq STDLIB_GVP(%rip), %rax
	movq %rax, 72(%rsi)
	jmp .LB8502
.LB8520:
	movq %rax, %rcx
	callq standard__autograd__gt_free__1__GradTensorE1_ptr1__ret_voidE1
	movq %rdi, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movq STDLIB_GVP(%rip), %rax
	movq %rax, 64(%rsi)
	jmp .LB8522
.LB8540:
	movq %rax, %rcx
	callq standard__autograd__gt_free__1__GradTensorE1_ptr1__ret_voidE1
	movq %rdi, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movq STDLIB_GVP(%rip), %rax
	movq %rax, 56(%rsi)
	jmp .LB8542
.LB8560:
	movq %rax, %rcx
	callq standard__autograd__gt_free__1__GradTensorE1_ptr1__ret_voidE1
	movq %rdi, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movq STDLIB_GVP(%rip), %rax
	movq %rax, 40(%rsi)
	jmp .LB8562
.LB8580:
	movq %rax, %rcx
	callq standard__autograd__gt_free__1__GradTensorE1_ptr1__ret_voidE1
	movq %rdi, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movq STDLIB_GVP(%rip), %rax
	movq %rax, 48(%rsi)
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__neuralnet__nn_linear_zero_grad__1__LinearE1_ptr1__ret_voidE1
	.def standard__neuralnet__nn_linear_zero_grad__1__LinearE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__neuralnet__nn_linear_zero_grad__1__LinearE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
.LB8591:
	movq %rcx, %rsi
	movq 40(%rsi), %rax
	movq STDLIB_GVP(%rip), %rcx
	cmpq %rcx, %rax
	jne .LB8602
.LB8604:
	movq 48(%rsi), %rax
	movq STDLIB_GVP(%rip), %rcx
	cmpq %rcx, %rax
	jne .LB8618
.LB8619:
	movq -8(%rbp), %rsi
	leave
	ret
.LB8602:
	movq %rax, %rcx
	callq standard__autograd__gt_zero_grad__1__GradTensorE1_ptr1__ret_voidE1
	jmp .LB8604
.LB8618:
	movq %rax, %rcx
	callq standard__autograd__gt_zero_grad__1__GradTensorE1_ptr1__ret_voidE1
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl standard__neuralnet__nn_linear_forward__4__LinearE1_ptr1__standard__autograd__TapeE1_ptr1__standard__autograd__GradTensorE1_ptr1__boolE1__ret_standard__autograd__GradTensorE1_ptr1
	.def standard__neuralnet__nn_linear_forward__4__LinearE1_ptr1__standard__autograd__TapeE1_ptr1__standard__autograd__GradTensorE1_ptr1__boolE1__ret_standard__autograd__GradTensorE1_ptr1;
	.scl 2;
	.type 32;
	.endef
standard__neuralnet__nn_linear_forward__4__LinearE1_ptr1__standard__autograd__TapeE1_ptr1__standard__autograd__GradTensorE1_ptr1__boolE1__ret_standard__autograd__GradTensorE1_ptr1:
	pushq %rbp
	movq %rsp, %rbp
	subq $160, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
	movq %r14, -48(%rbp)
	movq %r15, -56(%rbp)
.LB8625:
	movq %rcx, %rsi
	movq %rdx, -120(%rbp)
	movq %r8, -112(%rbp)
	movq 24(%r8), %rdi
	movq 16(%rsi), %rbx
	movq 24(%rsi), %r12
	movq %rdi, 88(%rsi)
	movq %rbx, %rax
	imulq %r12, %rax
	movq %rax, %rcx
	shlq $5, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, %r13
	xorl %eax, %eax
.LB8661:
	cmpq %r12, %rax
	jae .LB8663
.LB8662:
	movq %rax, %rcx
	imulq %rbx, %rcx
	xorl %edx, %edx
	testq %rbx, %rbx
	cmova %rbx, %rdx
	shrq $2, %rdx
	xorl %r8d, %r8d
.LB10734:
	testq %rdx, %rdx
	je .LB10736
.LB10735:
	movq (%rsi), %r9
	leaq (%rcx,%r8), %r14
	movslq %r14d, %r14
	movss (%r9,%r14,4), %xmm0
	movq %r8, %r9
	imulq %r12, %r9
	addq %rax, %r9
	movss %xmm0, (%r13,%r9,4)
	leaq 1(%r8), %r9
	movq (%rsi), %r14
	leaq (%rcx,%r9), %r15
	movslq %r15d, %r15
	movss (%r14,%r15,4), %xmm0
	imulq %r12, %r9
	addq %rax, %r9
	movss %xmm0, (%r13,%r9,4)
	leaq 2(%r8), %r9
	movq (%rsi), %r14
	leaq (%rcx,%r9), %r15
	movslq %r15d, %r15
	movss (%r14,%r15,4), %xmm0
	imulq %r12, %r9
	addq %rax, %r9
	movss %xmm0, (%r13,%r9,4)
	leaq 3(%r8), %r9
	movq (%rsi), %r14
	leaq (%rcx,%r9), %r15
	movslq %r15d, %r15
	movss (%r14,%r15,4), %xmm0
	imulq %r12, %r9
	addq %rax, %r9
	movss %xmm0, (%r13,%r9,4)
	addq $4, %r8
	decq %rdx
	jne .LB10735
	jmp .LB10736
.LB8663:
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -72(%rbp)
	movq %rbx, -72(%rbp)
	movq %r12, -64(%rbp)
	movl $801, %ecx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %r13, %r8
	movl $2, %r9d
	movq %rax, %rcx
	leaq -72(%rbp), %rax
	movq %rcx, 40(%rsi)
	movq %rax, 32(%rsp)
	movq -120(%rbp), %rdx
	callq standard__autograd__gt_init__5__GradTensorE1_ptr1__TapeE1_ptr1__floatE1_ptr1__dataE1_ubits64__dataE1_ptr1_ubits64__ret_voidE1
	movq %r13, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -88(%rbp)
	movq $1, -88(%rbp)
	movq %r12, -80(%rbp)
	movl $801, %ecx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movl $2, %r9d
	movq %rax, %rcx
	leaq -88(%rbp), %rax
	movq %rcx, 48(%rsi)
	movq 8(%rsi), %r8
	movq %rax, 32(%rsp)
	movq -120(%rbp), %rdx
	callq standard__autograd__gt_init__5__GradTensorE1_ptr1__TapeE1_ptr1__floatE1_ptr1__dataE1_ubits64__dataE1_ptr1_ubits64__ret_voidE1
	movq 40(%rsi), %r8
	movq -120(%rbp), %rcx
	movq -112(%rbp), %rdx
	callq standard__autograd__grad_matmul__3__TapeE1_ptr1__GradTensorE1_ptr1__GradTensorE1_ptr1__ret_GradTensorE1_ptr1
	movq %rax, 56(%rsi)
	movq %rdi, %rax
	imulq %r12, %rax
	movq %rax, %rcx
	shlq $5, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, %rbx
	xorl %eax, %eax
.LB8759:
	cmpq %rdi, %rax
	jae .LB8761
.LB8760:
	movq %rax, %rcx
	imulq %r12, %rcx
	xorl %edx, %edx
	testq %r12, %r12
	cmova %r12, %rdx
	shrq $2, %rdx
	xorl %r8d, %r8d
.LB10737:
	testq %rdx, %rdx
	je .LB10739
.LB10738:
	movq 8(%rsi), %r9
	movslq %r8d, %r13
	movss (%r9,%r13,4), %xmm0
	leaq (%rcx,%r8), %r9
	movss %xmm0, (%rbx,%r9,4)
	leaq 1(%r8), %r9
	movq 8(%rsi), %r13
	movslq %r9d, %r14
	movss (%r13,%r14,4), %xmm0
	addq %rcx, %r9
	movss %xmm0, (%rbx,%r9,4)
	leaq 2(%r8), %r9
	movq 8(%rsi), %r13
	movslq %r9d, %r14
	movss (%r13,%r14,4), %xmm0
	addq %rcx, %r9
	movss %xmm0, (%rbx,%r9,4)
	leaq 3(%r8), %r9
	movq 8(%rsi), %r13
	movslq %r9d, %r14
	movss (%r13,%r14,4), %xmm0
	addq %rcx, %r9
	movss %xmm0, (%rbx,%r9,4)
	addq $4, %r8
	decq %rdx
	jne .LB10738
	jmp .LB10739
.LB8761:
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -104(%rbp)
	movq %rdi, -104(%rbp)
	movq %r12, -96(%rbp)
	movl $801, %ecx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rbx, %r8
	movl $2, %r9d
	movq %rax, %rcx
	leaq -104(%rbp), %rax
	movq %rcx, 64(%rsi)
	movq %rax, 32(%rsp)
	movq -120(%rbp), %rdx
	callq standard__autograd__gt_init__5__GradTensorE1_ptr1__TapeE1_ptr1__floatE1_ptr1__dataE1_ubits64__dataE1_ptr1_ubits64__ret_voidE1
	movq %rbx, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movq 56(%rsi), %rdx
	movq 64(%rsi), %r8
	movq -120(%rbp), %rcx
	callq standard__autograd__grad_add__3__TapeE1_ptr1__GradTensorE1_ptr1__GradTensorE1_ptr1__ret_GradTensorE1_ptr1
	movq %rax, 72(%rsi)
	movl 32(%rsi), %ecx
	cmpl $1, %ecx
	je .LB8830
.LB8831:
	cmpl $2, %ecx
	je .LB8847
.LB8848:
	cmpl $3, %ecx
	je .LB8863
.LB8864:
	movq %rax, 80(%rsi)
	movq 80(%rsi), %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB8863:
	movq -120(%rbp), %rcx
	movq %rax, %rdx
	callq standard__autograd__grad_tanh_act__2__TapeE1_ptr1__GradTensorE1_ptr1__ret_GradTensorE1_ptr1
	movq %rax, 80(%rsi)
	movq 80(%rsi), %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB8847:
	movq -120(%rbp), %rcx
	movq %rax, %rdx
	callq standard__autograd__grad_sigmoid__2__TapeE1_ptr1__GradTensorE1_ptr1__ret_GradTensorE1_ptr1
	movq %rax, 80(%rsi)
	movq 80(%rsi), %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB8830:
	movq -120(%rbp), %rcx
	movq %rax, %rdx
	callq standard__autograd__grad_relu__2__TapeE1_ptr1__GradTensorE1_ptr1__ret_GradTensorE1_ptr1
	movq %rax, 80(%rsi)
	movq 80(%rsi), %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB10739:
.LB8766:
	cmpq %r12, %r8
	jae .LB8768
.LB8767:
	movq 8(%rsi), %rdx
	movslq %r8d, %r9
	movss (%rdx,%r9,4), %xmm0
	leaq (%rcx,%r8), %rdx
	movss %xmm0, (%rbx,%rdx,4)
	incq %r8
	cmpq %r12, %r8
	jb .LB8767
.LB8768:
	incq %rax
	cmpq %rdi, %rax
	jb .LB8760
	jmp .LB8761
.LB10736:
.LB8668:
	cmpq %rbx, %r8
	jae .LB8670
.LB8669:
	movq (%rsi), %rdx
	leaq (%rcx,%r8), %r9
	movslq %r9d, %r9
	movss (%rdx,%r9,4), %xmm0
	movq %r8, %rdx
	imulq %r12, %rdx
	addq %rax, %rdx
	movss %xmm0, (%r13,%rdx,4)
	incq %r8
	cmpq %rbx, %r8
	jb .LB8669
.LB8670:
	incq %rax
	cmpq %r12, %rax
	jb .LB8662
	jmp .LB8663
	.text
	.globl standard__neuralnet__nn_seq_init__1__SequentialE1_ptr1__ret_voidE1
	.def standard__neuralnet__nn_seq_init__1__SequentialE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__neuralnet__nn_seq_init__1__SequentialE1_ptr1__ret_voidE1:
.LB8884:
	movl $0, 768(%rcx)
	orb $128, 772(%rcx)
	ret
	.text
	.globl standard__neuralnet__nn_seq_add_linear__5__SequentialE1_ptr1__dataE1_ubits64__dataE1_ubits64__intE1__PCG32E1_ptr1__ret_boolE1
	.def standard__neuralnet__nn_seq_add_linear__5__SequentialE1_ptr1__dataE1_ubits64__dataE1_ubits64__intE1__PCG32E1_ptr1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__neuralnet__nn_seq_add_linear__5__SequentialE1_ptr1__dataE1_ubits64__dataE1_ubits64__intE1__PCG32E1_ptr1__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
.LB8890:
	movq %rcx, %rsi
	movq 48(%rbp), %rax
	cmpl $8, 768(%rsi)
	jge .LB8901
.LB8902:
	movslq 768(%rsi), %rcx
	imulq $96, %rcx, %rcx
	leaq (%rsi,%rcx,1), %rcx
	movq %rax, 32(%rsp)
	callq standard__neuralnet__nn_linear_init__5__LinearE1_ptr1__dataE1_ubits64__dataE1_ubits64__intE1__PCG32E1_ptr1__ret_voidE1
	movl 768(%rsi), %eax
	incl %eax
	movl %eax, 768(%rsi)
	movl $1, %eax
	movq -8(%rbp), %rsi
	leave
	ret
.LB8901:
	xorl %eax, %eax
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl standard__neuralnet__nn_seq_forward__3__SequentialE1_ptr1__standard__autograd__TapeE1_ptr1__standard__autograd__GradTensorE1_ptr1__ret_standard__autograd__GradTensorE1_ptr1
	.def standard__neuralnet__nn_seq_forward__3__SequentialE1_ptr1__standard__autograd__TapeE1_ptr1__standard__autograd__GradTensorE1_ptr1__ret_standard__autograd__GradTensorE1_ptr1;
	.scl 2;
	.type 32;
	.endef
standard__neuralnet__nn_seq_forward__3__SequentialE1_ptr1__standard__autograd__TapeE1_ptr1__standard__autograd__GradTensorE1_ptr1__ret_standard__autograd__GradTensorE1_ptr1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
.LB8928:
	movq %rcx, %rsi
	movq %rdx, %rdi
	movq %r8, %rax
	xorl %ebx, %ebx
.LB8936:
	cmpl 768(%rsi), %ebx
	jge .LB8938
.LB8937:
	movslq %ebx, %rcx
	movzbl 772(%rsi), %edx
	movq %rax, %r8
	imulq $96, %rcx, %rcx
	leaq (%rsi,%rcx,1), %rcx
	shrq $7, %rdx
	movzbl %dl, %r9d
	movq %rdi, %rdx
	callq standard__neuralnet__nn_linear_forward__4__LinearE1_ptr1__standard__autograd__TapeE1_ptr1__standard__autograd__GradTensorE1_ptr1__boolE1__ret_standard__autograd__GradTensorE1_ptr1
	incl %ebx
	cmpl 768(%rsi), %ebx
	jl .LB8937
.LB8938:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__neuralnet__nn_seq_zero_grad__1__SequentialE1_ptr1__ret_voidE1
	.def standard__neuralnet__nn_seq_zero_grad__1__SequentialE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__neuralnet__nn_seq_zero_grad__1__SequentialE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB8967:
	movq %rcx, %rsi
	xorl %edi, %edi
.LB8970:
	cmpl 768(%rsi), %edi
	jge .LB8972
.LB8971:
	movslq %edi, %rax
	imulq $96, %rax, %rax
	leaq (%rsi,%rax,1), %rcx
	callq standard__neuralnet__nn_linear_zero_grad__1__LinearE1_ptr1__ret_voidE1
	incl %edi
	cmpl 768(%rsi), %edi
	jl .LB8971
.LB8972:
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__neuralnet__nn_seq_free_intermediates__1__SequentialE1_ptr1__ret_voidE1
	.def standard__neuralnet__nn_seq_free_intermediates__1__SequentialE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__neuralnet__nn_seq_free_intermediates__1__SequentialE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB8987:
	movq %rcx, %rsi
	xorl %edi, %edi
.LB8990:
	cmpl 768(%rsi), %edi
	jge .LB8992
.LB8991:
	movslq %edi, %rax
	imulq $96, %rax, %rax
	leaq (%rsi,%rax,1), %rcx
	callq standard__neuralnet__nn_linear_free_intermediates__1__LinearE1_ptr1__ret_voidE1
	incl %edi
	cmpl 768(%rsi), %edi
	jl .LB8991
.LB8992:
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__neuralnet__nn_seq_free__1__SequentialE1_ptr1__ret_voidE1
	.def standard__neuralnet__nn_seq_free__1__SequentialE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__neuralnet__nn_seq_free__1__SequentialE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB9007:
	movq %rcx, %rsi
	xorl %edi, %edi
.LB9010:
	cmpl 768(%rsi), %edi
	jge .LB9012
.LB9011:
	movslq %edi, %rax
	imulq $96, %rax, %rax
	leaq (%rsi,%rax,1), %rcx
	callq standard__neuralnet__nn_linear_free__1__LinearE1_ptr1__ret_voidE1
	incl %edi
	cmpl 768(%rsi), %edi
	jl .LB9011
.LB9012:
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__neuralnet__nn_loss_mse__3__standard__autograd__TapeE1_ptr1__standard__autograd__GradTensorE1_ptr1__standard__autograd__GradTensorE1_ptr1__ret_standard__autograd__GradTensorE1_ptr1
	.def standard__neuralnet__nn_loss_mse__3__standard__autograd__TapeE1_ptr1__standard__autograd__GradTensorE1_ptr1__standard__autograd__GradTensorE1_ptr1__ret_standard__autograd__GradTensorE1_ptr1;
	.scl 2;
	.type 32;
	.endef
standard__neuralnet__nn_loss_mse__3__standard__autograd__TapeE1_ptr1__standard__autograd__GradTensorE1_ptr1__standard__autograd__GradTensorE1_ptr1__ret_standard__autograd__GradTensorE1_ptr1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB9027:
	movq %rcx, %rsi
	movq %rdx, %rdi
	andb $127, 100(%r8)
	movq %rsi, %rcx
	movq %rdi, %rdx
	callq standard__autograd__grad_sub__3__TapeE1_ptr1__GradTensorE1_ptr1__GradTensorE1_ptr1__ret_GradTensorE1_ptr1
	movq %rax, %r8
	movq %rsi, %rcx
	movq %r8, %rdx
	callq standard__autograd__grad_mul__3__TapeE1_ptr1__GradTensorE1_ptr1__GradTensorE1_ptr1__ret_GradTensorE1_ptr1
	movq %rax, %rdx
	movq %rsi, %rcx
	callq standard__autograd__grad_sum__2__TapeE1_ptr1__GradTensorE1_ptr1__ret_GradTensorE1_ptr1
	movq %rax, %rdx
	movq 88(%rdi), %rax
	xorps %xmm0, %xmm0
	cvtsi2ssq %rax, %xmm0
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	divss %xmm15, %xmm0
	movq %rsi, %rcx
	movaps %xmm0, %xmm2
	callq standard__autograd__grad_scale__3__TapeE1_ptr1__GradTensorE1_ptr1__floatE1__ret_GradTensorE1_ptr1
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__neuralnet__adam_init__5__AdamE1_ptr1__floatE1__floatE1__floatE1__floatE1__ret_voidE1
	.def standard__neuralnet__adam_init__5__AdamE1_ptr1__floatE1__floatE1__floatE1__floatE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__neuralnet__adam_init__5__AdamE1_ptr1__floatE1__floatE1__floatE1__floatE1__ret_voidE1:
.LB9071:
	movaps %xmm1, %xmm0
	movaps %xmm2, %xmm1
	movaps %xmm3, %xmm2
	movss 40(%rsp), %xmm3
	movss %xmm0, (%rcx)
	movss %xmm1, 4(%rcx)
	movss %xmm2, 8(%rcx)
	movss %xmm3, 12(%rcx)
	movl $0, 404(%rcx)
	ret
	.text
	.globl standard__neuralnet__adam_init_default__2__AdamE1_ptr1__floatE1__ret_voidE1
	.def standard__neuralnet__adam_init_default__2__AdamE1_ptr1__floatE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__neuralnet__adam_init_default__2__AdamE1_ptr1__floatE1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
.LB9091:
	movaps %xmm1, %xmm0
	movabsq $4487126258331716666, %r10
	movq %r10, %xmm1
	movabsq $1063675494, %r10
	movq %r10, %xmm2
	movabsq $1065336439, %r10
	movq %r10, %xmm3
	cvtsd2ss %xmm1, %xmm1
	movss %xmm1, 32(%rsp)
	movaps %xmm0, %xmm1
	callq standard__neuralnet__adam_init__5__AdamE1_ptr1__floatE1__floatE1__floatE1__floatE1__ret_voidE1
	leave
	ret
	.text
	.globl standard__neuralnet__adam_register__2__AdamE1_ptr1__dataE1_ubits64__ret_voidE1
	.def standard__neuralnet__adam_register__2__AdamE1_ptr1__dataE1_ubits64__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__neuralnet__adam_register__2__AdamE1_ptr1__dataE1_ubits64__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
.LB9098:
	movq %rcx, %rsi
	movq %rdx, %rdi
	cmpl $16, 400(%rsi)
	jge .LB9106
.LB9107:
	movl 400(%rsi), %ebx
	movq %rdi, %r12
	shlq $5, %r12
	movq %r12, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movslq %ebx, %rbx
	movq %rax, 16(%rsi,%rbx,8)
	movq %r12, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, 144(%rsi,%rbx,8)
	movq 16(%rsi,%rbx,8), %rax
	movq %rax, %rcx
	xorl %edx, %edx
	movq %r12, %r8
	callq memset
	movq 144(%rsi,%rbx,8), %rax
	movq %rax, %rcx
	xorl %edx, %edx
	movq %r12, %r8
	callq memset
	movq %rdi, 272(%rsi,%rbx,8)
	movl 400(%rsi), %eax
	incl %eax
	movl %eax, 400(%rsi)
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB9106:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
	.text
	.globl standard__neuralnet__adam_register_seq__2__AdamE1_ptr1__SequentialE1_ptr1__ret_voidE1
	.def standard__neuralnet__adam_register_seq__2__AdamE1_ptr1__SequentialE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__neuralnet__adam_register_seq__2__AdamE1_ptr1__SequentialE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
.LB9166:
	movq %rcx, %rsi
	movq %rdx, %rdi
	xorl %ebx, %ebx
.LB9170:
	cmpl 768(%rdi), %ebx
	jge .LB9172
.LB9171:
	movslq %ebx, %rax
	imulq $96, %rax, %rax
	leaq (%rdi,%rax,1), %r12
	movq 16(%r12), %rax
	movq %rax, %rdx
	imulq 24(%r12), %rdx
	movq %rsi, %rcx
	callq standard__neuralnet__adam_register__2__AdamE1_ptr1__dataE1_ubits64__ret_voidE1
	movq 24(%r12), %rdx
	movq %rsi, %rcx
	callq standard__neuralnet__adam_register__2__AdamE1_ptr1__dataE1_ubits64__ret_voidE1
	incl %ebx
	cmpl 768(%rdi), %ebx
	jl .LB9171
.LB9172:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
	.text
	.globl standard__neuralnet__adam_step__2__AdamE1_ptr1__SequentialE1_ptr1__ret_voidE1
	.def standard__neuralnet__adam_step__2__AdamE1_ptr1__SequentialE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__neuralnet__adam_step__2__AdamE1_ptr1__SequentialE1_ptr1__ret_voidE1:
	subq $608, %rsp
	movq %rbx, 592(%rsp)
	movq %rsi, 584(%rsp)
	movq %rdi, 576(%rsp)
	movq %r12, 568(%rsp)
	movq %r13, 560(%rsp)
	movq %r14, 552(%rsp)
	movq %r15, 544(%rsp)
.LB9205:
	movq %rdx, 384(%rsp)
	movl 404(%rcx), %eax
	incl %eax
	movl %eax, 404(%rcx)
	movss (%rcx), %xmm0
	movsd %xmm0, 48(%rsp)
	movss 4(%rcx), %xmm0
	movsd %xmm0, 16(%rsp)
	movss 8(%rcx), %xmm1
	movsd %xmm1, 8(%rsp)
	movss 12(%rcx), %xmm2
	movsd %xmm2, 24(%rsp)
	movabsq $1065353216, %r10
	movq %r10, %xmm2
	movaps %xmm0, %xmm15
	movaps %xmm2, %xmm0
	subss %xmm15, %xmm0
	movsd %xmm0, 536(%rsp)
	movabsq $1065353216, %r10
	movq %r10, %xmm0
	subss %xmm1, %xmm0
	movsd %xmm0, 528(%rsp)
	movabsq $1065353216, %r10
	movq %r10, %xmm0
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	xorl %edx, %edx
.LB9244:
	cmpl %eax, %edx
	jge .LB9246
.LB9245:
	movsd 16(%rsp), %xmm2
	mulss %xmm2, %xmm0
	movsd 8(%rsp), %xmm2
	mulss %xmm2, %xmm1
	incl %edx
	cmpl %eax, %edx
	jl .LB9245
.LB9246:
	movabsq $1065353216, %r10
	movq %r10, %xmm2
	movsd %xmm2, 520(%rsp)
	movaps %xmm0, %xmm15
	movaps %xmm2, %xmm0
	subss %xmm15, %xmm0
	movsd %xmm0, 512(%rsp)
	movabsq $1065353216, %r10
	movq %r10, %xmm0
	subss %xmm1, %xmm0
	movsd %xmm0, 504(%rsp)
	movq $0, 32(%rsp)
	movq $0, 40(%rsp)
	movq $0, 280(%rsp)
	movq $0, 376(%rsp)
	xorl %eax, %eax
	xorl %edx, %edx
	xorl %esi, %esi
	xorl %edi, %edi
	xorps %xmm0, %xmm0
	xorps %xmm1, %xmm1
	movabsq $0, %r10
	movq %r10, 496(%rsp)
	xorl %r8d, %r8d
	xorl %r9d, %r9d
	movq $0, 488(%rsp)
	movq $0, 480(%rsp)
	movq $0, 472(%rsp)
	movq $0, 464(%rsp)
	movabsq $0, %r10
	movq %r10, 456(%rsp)
	movabsq $0, %r10
	movq %r10, 448(%rsp)
	movabsq $0, %r10
	movq %r10, 440(%rsp)
	movabsq $0, %r10
	movq %r10, 432(%rsp)
	movabsq $0, %r10
	movq %r10, 424(%rsp)
	movabsq $0, %r10
	movq %r10, 416(%rsp)
	movabsq $0, %r10
	movq %r10, 408(%rsp)
.LB9270:
	movq 32(%rsp), %rbx
	movq 384(%rsp), %r12
	cmpl 768(%r12), %ebx
	jge .LB9272
.LB9271:
	movq 32(%rsp), %rbx
	movslq %ebx, %rbx
	movq %rbx, 400(%rsp)
	imulq $96, %rbx, %rbx
	movq %rbx, 392(%rsp)
	movq 384(%rsp), %r12
	leaq (%r12,%rbx,1), %rbx
	movq 40(%rbx), %r12
	movq STDLIB_GVP(%rip), %r13
	movq %r13, 368(%rsp)
	movq %r13, 360(%rsp)
	movq %r13, 352(%rsp)
	cmpq %r13, %r12
	jne .LB9295
.LB9296:
	movq 376(%rsp), %r10
	movq %r10, 184(%rsp)
	movq %rax, 176(%rsp)
	movq %rdx, 136(%rsp)
	movq %rsi, 120(%rsp)
	movq %rdi, 112(%rsp)
	movsd %xmm0, 344(%rsp)
	movsd %xmm1, 336(%rsp)
	movq 496(%rsp), %r10
	movq %r10, 328(%rsp)
	movq 432(%rsp), %r10
	movq %r10, 320(%rsp)
	movq 424(%rsp), %r10
	movq %r10, 312(%rsp)
.LB9297:
	movq 40(%rsp), %rax
	incl %eax
	movq %rax, 192(%rsp)
	movq 48(%rbx), %rax
	movq STDLIB_GVP(%rip), %rdx
	movq %rdx, 272(%rsp)
	movq %rdx, 264(%rsp)
	movq %rdx, 256(%rsp)
	cmpq %rdx, %rax
	jne .LB9453
.LB9454:
	movq 280(%rsp), %rax
	movq 488(%rsp), %rdx
	movq 480(%rsp), %r10
	movq %r10, 248(%rsp)
	movq 472(%rsp), %r10
	movq %r10, 240(%rsp)
	movq 464(%rsp), %r10
	movq %r10, 232(%rsp)
	movsd 456(%rsp), %xmm0
	movsd 448(%rsp), %xmm1
	movq 440(%rsp), %r10
	movq %r10, 224(%rsp)
	movq 416(%rsp), %r10
	movq %r10, 216(%rsp)
	movq 408(%rsp), %r10
	movq %r10, 208(%rsp)
.LB9455:
	movq 192(%rsp), %rsi
	movq 32(%rsp), %rdi
	incl %esi
	incl %edi
	movq %rdi, 32(%rsp)
	movq %rsi, 40(%rsp)
	movq %rax, 280(%rsp)
	movq 184(%rsp), %r10
	movq %r10, 376(%rsp)
	movq 176(%rsp), %rax
	movq 120(%rsp), %rsi
	movq 112(%rsp), %rdi
	movq 328(%rsp), %r10
	movq %r10, 496(%rsp)
	movq %rdx, 488(%rsp)
	movq 248(%rsp), %r10
	movq %r10, 480(%rsp)
	movq 240(%rsp), %r10
	movq %r10, 472(%rsp)
	movq 232(%rsp), %r10
	movq %r10, 464(%rsp)
	movsd %xmm0, 456(%rsp)
	movsd %xmm1, 448(%rsp)
	movq 224(%rsp), %r10
	movq %r10, 440(%rsp)
	movq 320(%rsp), %r10
	movq %r10, 432(%rsp)
	movq 312(%rsp), %r10
	movq %r10, 424(%rsp)
	movq 216(%rsp), %r10
	movq %r10, 416(%rsp)
	movq 208(%rsp), %r10
	movq %r10, 408(%rsp)
	movq 136(%rsp), %rdx
	movsd 344(%rsp), %xmm0
	movsd 336(%rsp), %xmm1
	jmp .LB9270
.LB9272:
	movq 592(%rsp), %rbx
	movq 584(%rsp), %rsi
	movq 576(%rsp), %rdi
	movq 568(%rsp), %r12
	movq 560(%rsp), %r13
	movq 552(%rsp), %r14
	movq 544(%rsp), %r15
	addq $608, %rsp
	ret
.LB9295:
	movq 40(%rsp), %rdx
	movslq %edx, %rdx
	movq 16(%rcx,%rdx,8), %rsi
	movq 144(%rcx,%rdx,8), %rdx
	movq 8(%r12), %rdi
	xorps %xmm0, %xmm0
	xorps %xmm1, %xmm1
	movabsq $0, %r10
	movq %r10, 304(%rsp)
	movq %r9, %r12
	movq 432(%rsp), %r10
	movq %r10, 296(%rsp)
	movq 424(%rsp), %r10
	movq %r10, 288(%rsp)
	movq %r8, %r9
	movq %rax, %r8
	xorl %eax, %eax
.LB9327:
	cmpq 24(%rbx), %rax
	jae .LB9329
.LB9328:
	xorl %r8d, %r8d
	movq 304(%rsp), %r10
	movq %r10, 72(%rsp)
	movq 296(%rsp), %r10
	movq %r10, 64(%rsp)
	movq 288(%rsp), %r10
	movq %r10, 56(%rsp)
.LB9337:
	movq 16(%rbx), %r13
	cmpq %r13, %r8
	jae .LB9339
.LB9338:
	movq %rax, %r9
	imulq %r13, %r9
	addq %r8, %r9
	movq %r8, %r12
	imulq 24(%rbx), %r12
	addq %rax, %r12
	movslq %r12d, %r13
	movss (%rdi,%r13,4), %xmm2
	movslq %r9d, %r13
	leaq (%rsi,%r13,4), %r14
	leaq (%rdx,%r13,4), %r15
	movss (%r14), %xmm0
	movsd 536(%rsp), %xmm1
	movsd 16(%rsp), %xmm3
	mulss %xmm2, %xmm1
	vfmadd132ss %xmm3, %xmm1, %xmm0
	movss %xmm0, (%rsi,%r9,4)
	movss (%r15), %xmm0
	movsd 528(%rsp), %xmm1
	movsd 8(%rsp), %xmm3
	mulss %xmm2, %xmm1
	mulss %xmm2, %xmm1
	vfmadd132ss %xmm3, %xmm1, %xmm0
	movss %xmm0, (%rdx,%r9,4)
	movss (%r14), %xmm0
	movsd 512(%rsp), %xmm1
	movaps %xmm0, %xmm3
	divss %xmm1, %xmm3
	movss (%r15), %xmm0
	movsd 504(%rsp), %xmm1
	movq (%rbx), %r14
	movaps %xmm0, %xmm4
	divss %xmm1, %xmm4
	movss (%r14,%r13,4), %xmm0
	movsd %xmm0, -8(%rsp)
	movsd 48(%rsp), %xmm0
	mulss %xmm3, %xmm0
	movaps %xmm4, %xmm1
	movsd %xmm0, (%rsp)
	sqrtss %xmm1, %xmm0
	movsd 24(%rsp), %xmm1
	movsd (%rsp), %xmm5
	incq %r8
	addss %xmm0, %xmm1
	movaps %xmm1, %xmm15
	movaps %xmm5, %xmm1
	divss %xmm15, %xmm1
	movsd -8(%rsp), %xmm5
	movq (%rbx), %r13
	movaps %xmm1, %xmm15
	movaps %xmm5, %xmm1
	subss %xmm15, %xmm1
	movss %xmm1, (%r13,%r9,4)
	movaps %xmm3, %xmm1
	movsd %xmm4, 72(%rsp)
	movsd %xmm4, 64(%rsp)
	movsd %xmm0, 56(%rsp)
	movaps %xmm2, %xmm0
	jmp .LB9337
.LB9329:
	movq %rax, 184(%rsp)
	movq %r8, 176(%rsp)
	movq %rsi, 136(%rsp)
	movq %rdx, 120(%rsp)
	movq %rdi, 112(%rsp)
	movsd %xmm0, 344(%rsp)
	movsd %xmm1, 336(%rsp)
	movq 304(%rsp), %r10
	movq %r10, 328(%rsp)
	movq %r9, %r8
	movq %r12, %r9
	movq 296(%rsp), %r10
	movq %r10, 320(%rsp)
	movq 288(%rsp), %r10
	movq %r10, 312(%rsp)
	jmp .LB9297
.LB9453:
	movq 192(%rsp), %rdx
	movslq %edx, %rdx
	movq %rdx, 200(%rsp)
	movq 16(%rcx,%rdx,8), %rsi
	movq 144(%rcx,%rdx,8), %rdx
	movq 8(%rax), %rax
	movq 24(%rbx), %rdi
	movq $0, 168(%rsp)
	xorps %xmm0, %xmm0
	xorps %xmm1, %xmm1
	movabsq $0, %r10
	movq %r10, 160(%rsp)
	movq 416(%rsp), %r10
	movq %r10, 152(%rsp)
	movq 408(%rsp), %r10
	movq %r10, 144(%rsp)
.LB9490:
	movq 168(%rsp), %r12
	cmpq %rdi, %r12
	jae .LB9492
.LB9491:
	movl 168(%rsp), %r12d
	movslq %r12d, %r12
	movss (%rax,%r12,4), %xmm0
	leaq (%rsi,%r12,4), %r13
	movsd %xmm0, 128(%rsp)
	movss (%r13), %xmm1
	movsd 536(%rsp), %xmm2
	mulss %xmm2, %xmm0
	movsd 16(%rsp), %xmm2
	movq 168(%rsp), %r14
	vfmadd231ss %xmm2, %xmm1, %xmm0
	movss %xmm0, (%rsi,%r14,4)
	leaq (%rdx,%r12,4), %r14
	movss (%r14), %xmm0
	movsd 528(%rsp), %xmm1
	movsd 128(%rsp), %xmm2
	mulss %xmm2, %xmm1
	mulss %xmm2, %xmm1
	movsd 8(%rsp), %xmm2
	movq 168(%rsp), %r15
	vfmadd132ss %xmm2, %xmm1, %xmm0
	movss %xmm0, (%rdx,%r15,4)
	movss (%r13), %xmm0
	movsd 512(%rsp), %xmm1
	divss %xmm1, %xmm0
	movsd %xmm0, 104(%rsp)
	movss (%r14), %xmm0
	movsd 504(%rsp), %xmm1
	divss %xmm1, %xmm0
	movsd %xmm0, 96(%rsp)
	movq 8(%rbx), %r13
	movss (%r13,%r12,4), %xmm0
	movsd %xmm0, 88(%rsp)
	movsd 48(%rsp), %xmm0
	movsd 104(%rsp), %xmm1
	mulss %xmm1, %xmm0
	movsd %xmm0, 80(%rsp)
	movsd 96(%rsp), %xmm0
	movaps %xmm0, %xmm1
	sqrtss %xmm1, %xmm0
	movsd 24(%rsp), %xmm1
	movsd 80(%rsp), %xmm2
	addss %xmm0, %xmm1
	movaps %xmm1, %xmm15
	movaps %xmm2, %xmm1
	divss %xmm15, %xmm1
	movsd 88(%rsp), %xmm2
	movq 8(%rbx), %r12
	movq 168(%rsp), %r13
	movaps %xmm1, %xmm15
	movaps %xmm2, %xmm1
	subss %xmm15, %xmm1
	movss %xmm1, (%r12,%r13,4)
	incq %r13
	movq %r13, 168(%rsp)
	movsd 104(%rsp), %xmm1
	movq 96(%rsp), %r10
	movq %r10, 160(%rsp)
	movq 96(%rsp), %r10
	movq %r10, 152(%rsp)
	movsd %xmm0, 144(%rsp)
	movsd 128(%rsp), %xmm0
	jmp .LB9490
.LB9492:
	movq %rdx, 248(%rsp)
	movq %rax, 240(%rsp)
	movq %rdi, 232(%rsp)
	movq 160(%rsp), %r10
	movq %r10, 224(%rsp)
	movq 152(%rsp), %r10
	movq %r10, 216(%rsp)
	movq 144(%rsp), %r10
	movq %r10, 208(%rsp)
	movq 168(%rsp), %rax
	movq %rsi, %rdx
	jmp .LB9455
.LB9339:
	incq %rax
	movq 72(%rsp), %r10
	movq %r10, 304(%rsp)
	movq 64(%rsp), %r10
	movq %r10, 296(%rsp)
	movq 56(%rsp), %r10
	movq %r10, 288(%rsp)
	cmpq 24(%rbx), %rax
	jb .LB9328
	jmp .LB9329
	.text
	.globl standard__neuralnet__adam_free__1__AdamE1_ptr1__ret_voidE1
	.def standard__neuralnet__adam_free__1__AdamE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__neuralnet__adam_free__1__AdamE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
.LB9576:
	movq %rcx, %rsi
	xorl %edi, %edi
.LB9579:
	cmpl 400(%rsi), %edi
	jge .LB9581
.LB9580:
	movslq %edi, %rax
	movq 16(%rsi,%rax,8), %rax
	movq STDLIB_GVP(%rip), %rcx
	cmpq %rcx, %rax
	jne .LB9599
.LB9601:
	movslq %edi, %rax
	movq 144(%rsi,%rax,8), %rax
	movq STDLIB_GVP(%rip), %rcx
	cmpq %rcx, %rax
	jne .LB9626
.LB9628:
	incl %edi
	cmpl 400(%rsi), %edi
	jl .LB9580
.LB9581:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB9599:
	movslq %edi, %rbx
	movq 16(%rsi,%rbx,8), %rax
	movq %rax, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movq STDLIB_GVP(%rip), %rax
	movq %rax, 16(%rsi,%rbx,8)
	jmp .LB9601
.LB9626:
	movslq %edi, %rbx
	movq 144(%rsi,%rbx,8), %rax
	movq %rax, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movq STDLIB_GVP(%rip), %rax
	movq %rax, 144(%rsi,%rbx,8)
	jmp .LB9628
	.text
	.globl plot_results__3__floatE1_ptr1__floatE1_ptr1__intE1__ret_voidE1
	.def plot_results__3__floatE1_ptr1__floatE1_ptr1__intE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
plot_results__3__floatE1_ptr1__floatE1_ptr1__intE1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $1152, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
.LB9644:
	leaq .LZERO(%rip), %rsi
	leaq -1064(%rbp), %rdi
	movq %rcx, %rax
	movl $1024, %ecx
	rep movsb
	xorl %ecx, %ecx
.LB9659:
	cmpq $16, %rcx
	jge .LB9661
.LB9660:
	movl $16, %esi
	xorl %edi, %edi
.LB10740:
	testq %rsi, %rsi
	je .LB10742
.LB10741:
	movq %rcx, %r9
	shlq $6, %r9
	leaq -1064(%rbp,%r9,1), %r9
	movb $32, (%r9,%rdi,1)
	leaq 1(%rdi), %r9
	movq %rcx, %rbx
	shlq $6, %rbx
	leaq -1064(%rbp,%rbx,1), %rbx
	movb $32, (%rbx,%r9,1)
	leaq 2(%rdi), %r9
	movq %rcx, %rbx
	shlq $6, %rbx
	leaq -1064(%rbp,%rbx,1), %rbx
	movb $32, (%rbx,%r9,1)
	leaq 3(%rdi), %r9
	movq %rcx, %rbx
	shlq $6, %rbx
	leaq -1064(%rbp,%rbx,1), %rbx
	movb $32, (%rbx,%r9,1)
	addq $4, %rdi
	decq %rsi
	jne .LB10741
	jmp .LB10742
.LB9661:
	xorps %xmm0, %xmm0
	movabsq $1036831949, %r10
	movq %r10, %xmm1
	subss %xmm1, %xmm0
	movabsq $1066192077, %r10
	movq %r10, %xmm1
	subss %xmm0, %xmm1
	xorl %ecx, %ecx
.LB9681:
	cmpl %r8d, %ecx
	jge .LB9683
.LB9682:
	movslq %ecx, %rsi
	movslq %ecx, %rdi
	movabsq $1065353216, %r10
	movq %r10, %xmm4
	xorl %ebx, %ebx
	xorps %xmm2, %xmm2
	cvtsi2ssq %rsi, %xmm2
	movslq %r8d, %rsi
	xorps %xmm3, %xmm3
	cvtsi2ssq %rsi, %xmm3
	movl $64, %esi
	movslq %esi, %rsi
	divss %xmm3, %xmm2
	xorps %xmm3, %xmm3
	cvtsi2ssq %rsi, %xmm3
	mulss %xmm3, %xmm2
	cvttss2siq %xmm2, %rsi
	movss (%rax,%rdi,4), %xmm2
	movss (%rdx,%rdi,4), %xmm3
	movl $15, %edi
	movslq %edi, %rdi
	movl %esi, %esi
	subss %xmm0, %xmm2
	divss %xmm1, %xmm2
	movaps %xmm2, %xmm15
	movaps %xmm4, %xmm2
	subss %xmm15, %xmm2
	xorps %xmm4, %xmm4
	cvtsi2ssq %rdi, %xmm4
	mulss %xmm4, %xmm2
	cvttss2siq %xmm2, %rdi
	movaps %xmm3, %xmm2
	subss %xmm0, %xmm2
	movabsq $1065353216, %r10
	movq %r10, %xmm3
	divss %xmm1, %xmm2
	movl %edi, %edi
	testl %edi, %edi
	cmovs %ebx, %edi
	movl $15, %ebx
	cmpl $16, %edi
	cmovge %ebx, %edi
	xorl %ebx, %ebx
	movaps %xmm2, %xmm15
	movaps %xmm3, %xmm2
	subss %xmm15, %xmm2
	mulss %xmm4, %xmm2
	cvttss2siq %xmm2, %r9
	movl %r9d, %r9d
	testl %r9d, %r9d
	cmovs %ebx, %r9d
	movl $15, %ebx
	cmpl $16, %r9d
	cmovge %ebx, %r9d
	cmpl %r9d, %edi
	je .LB9748
.LB9749:
	movslq %edi, %rdi
	shlq $6, %rdi
	movslq %esi, %rbx
	leaq -1064(%rbp,%rdi,1), %rdi
	movb $42, (%rdi,%rbx,1)
	movslq %r9d, %rdi
	shlq $6, %rdi
	movslq %esi, %rsi
	leaq -1064(%rbp,%rdi,1), %rdi
	movb $111, (%rdi,%rsi,1)
.LB9750:
	incl %ecx
	cmpl %r8d, %ecx
	jl .LB9682
.LB9683:
	leaq -1090(%rbp), %rsi
	movl $1411391498, -1090(%rbp)
	movl $1030059378, -1086(%rbp)
	movl $1917853738, -1082(%rbp)
	movl $1866294373, -1078(%rbp)
	movl $1953448480, -1074(%rbp)
	movl $170605928, -1070(%rbp)
	movw $10, -1066(%rbp)
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	xorl %esi, %esi
	xorl %edi, %edi
	xorl %ebx, %ebx
	xorl %r12d, %r12d
.LB9793:
	cmpq $16, %r12
	jge .LB9795
.LB9794:
	movl $8134688, -1103(%rbp)
	leaq -1103(%rbp), %r13
	movq %r13, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %r13, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	xorl %r13d, %r13d
.LB9804:
	cmpq $64, %r13
	jge .LB9806
.LB9805:
	movq %r12, %rax
	shlq $6, %rax
	leaq -1108(%rbp), %rdi
	leaq -1064(%rbp,%rax,1), %rax
	movq %rdi, %rcx
	movzbl (%rax,%r13,1), %esi
	movb %sil, -1108(%rbp)
	movb $0, -1107(%rbp)
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %ebx
	movq %rdi, %rcx
	movq %rbx, %rdx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	incq %r13
	cmpq $64, %r13
	jl .LB9805
	jmp .LB9806
.LB9795:
	movl $2826272, -1094(%rbp)
	leaq -1094(%rbp), %rsi
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	xorl %esi, %esi
.LB9829:
	cmpl $64, %esi
	jge .LB9831
.LB9830:
	movw $45, -1099(%rbp)
	leaq -1099(%rbp), %rdi
	movq %rdi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rdi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	incl %esi
	cmpl $64, %esi
	jl .LB9830
.LB9831:
	movw $2603, -1097(%rbp)
	movb $0, -1095(%rbp)
	leaq -1097(%rbp), %rsi
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB9806:
	movw $2684, -1106(%rbp)
	movb $0, -1104(%rbp)
	leaq -1106(%rbp), %r13
	movq %r13, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %r13, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	incq %r12
	cmpq $16, %r12
	jl .LB9794
	jmp .LB9795
.LB9748:
	movslq %edi, %rdi
	shlq $6, %rdi
	movslq %esi, %rsi
	leaq -1064(%rbp,%rdi,1), %rdi
	movb $43, (%rdi,%rsi,1)
	jmp .LB9750
.LB10742:
.LB9664:
	cmpq $64, %rdi
	jge .LB9666
.LB9665:
	movq %rcx, %rsi
	shlq $6, %rsi
	leaq -1064(%rbp,%rsi,1), %rsi
	movb $32, (%rsi,%rdi,1)
	incq %rdi
	cmpq $64, %rdi
	jl .LB9665
.LB9666:
	incq %rcx
	cmpq $16, %rcx
	jl .LB9660
	jmp .LB9661
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
PCG32.TLD:
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
standard__autograd__GradTensor.TLD:
	.long 801
	.long 7
	.long 0
	.long 64
	.long 64
	.long 64
	.long 64
	.long 64
	.long 128
	.long 64
	.long 1
	.long 192
	.long 512
	.long 1
	.long 704
	.long 64
	.long 1
	.long 768
	.long 32
	.long 32
	.long 800
	.long 1
	.long 1
	.section .rdata,"dr"
	.p2align 4
standard__autograd__GradNode.TLD:
	.long 1024
	.long 16
	.long 0
	.long 32
	.long 32
	.long 64
	.long 64
	.long 64
	.long 128
	.long 128
	.long 64
	.long 256
	.long 32
	.long 32
	.long 288
	.long 32
	.long 32
	.long 320
	.long 64
	.long 64
	.long 384
	.long 64
	.long 64
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
	.long 768
	.long 64
	.long 64
	.long 832
	.long 64
	.long 64
	.long 896
	.long 64
	.long 1
	.long 960
	.long 64
	.long 1
	.section .rdata,"dr"
	.p2align 4
standard__neuralnet__Linear.TLD:
	.long 768
	.long 12
	.long 0
	.long 64
	.long 64
	.long 64
	.long 64
	.long 64
	.long 128
	.long 64
	.long 1
	.long 192
	.long 64
	.long 1
	.long 256
	.long 32
	.long 32
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
	.long 1
	.section .rdata,"dr"
	.p2align 4
standard__neuralnet__Sequential.TLD:
	.long 6177
	.long 3
	.long 0
	.long 6144
	.long 64
	.long 6144
	.long 32
	.long 32
	.long 6176
	.long 1
	.long 1
	.section .rdata,"dr"
	.p2align 4
standard__neuralnet__Adam.TLD:
	.long 3264
	.long 9
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
	.long 128
	.long 1024
	.long 64
	.long 1152
	.long 1024
	.long 64
	.long 2176
	.long 1024
	.long 1
	.long 3200
	.long 32
	.long 32
	.long 3232
	.long 32
	.long 32
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
	.bss
	.p2align 4
global_rng:
	.zero 16
	.bss
	.p2align 0
global_rng_initialized:
	.zero 1
	.section .rdata,"dr"
	.p2align 4
.LZERO:
	.zero 1024
