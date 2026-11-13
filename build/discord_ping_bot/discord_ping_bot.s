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
.LB31862:
	testq %rdx, %rdx
	je .LB31864
.LB31863:
	movb %al, (%rcx,%rsi,1)
	movb %al, 1(%rcx,%rsi,1)
	movb %al, 2(%rcx,%rsi,1)
	movb %al, 3(%rcx,%rsi,1)
	addq $4, %rsi
	decq %rdx
	jne .LB31863
.LB31864:
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
.LB31865:
	testq %rax, %rax
	je .LB31867
.LB31866:
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
	jne .LB31866
.LB31867:
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
	movq %rax, %rsi
	shlq $1, %rsi
	movq %rsi, %rcx
	shlq $5, %rcx
	movq %rcx, -88(%rbp)
	callq standard__memory__allocators__stdheap__heap_os_alloc__1__dataE1_ubits64__ret_dataE1_ubits64
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
	movq standard__memory__allocators__stdheap__g_table_slab_cap(%rip), %rdx
	movq %rax, %rcx
	callq standard__memory__allocators__stdheap__heap_os_free__2__dataE1_ubits64__dataE1_ubits64__ret_voidE1
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
	movl $32768, %ecx
	callq standard__memory__allocators__stdheap__heap_os_alloc__1__dataE1_ubits64__ret_dataE1_ubits64
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
	movq %rsi, %rcx
	callq standard__memory__allocators__stdheap__heap_os_alloc__1__dataE1_ubits64__ret_dataE1_ubits64
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
	movq %rsi, %rcx
	callq standard__memory__allocators__stdheap__heap_os_alloc__1__dataE1_ubits64__ret_dataE1_ubits64
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
	movq %rsi, %rdx
	callq standard__memory__allocators__stdheap__heap_os_free__2__dataE1_ubits64__dataE1_ubits64__ret_voidE1
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
	je .LB31786
.LB31787:
	movq 16(%rax), %rcx
	movq 8(%rax), %r8
	movq (%rax), %r9
	leaq (%rcx,%rdi), %rdx
	leaq (%r9,%rcx,1), %rcx
	movq %rdx, 16(%rax)
	xorl %eax, %eax
	cmpq %r8, %rdx
	cmovbe %rcx, %rax
.LB31783:
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
.LB31786:
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
	je .LB31781
.LB31782:
	movq 16(%rax), %rcx
	leaq (%rcx,%rdi), %rdx
	movq 8(%rax), %rdi
	movq (%rax), %r8
	leaq (%r8,%rcx,1), %rcx
	movq %rdx, 16(%rax)
	xorl %eax, %eax
	cmpq %rdi, %rdx
	cmovbe %rcx, %rax
.LB31778:
	testq %rax, %rax
	je .LB1146
.LB1147:
	movq %rax, %rdi
	jmp .LB1126
.LB31781:
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
	je .LB31791
.LB31792:
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
.LB31793:
	movslq %edx, %rdi
	shlq $5, %rdi
	movq (%rax,%rdi,1), %rdi
	testq %rdi, %rdi
	je .LB31795
.LB31794:
	cmpq %rsi, %rdi
	je .LB31797
.LB31798:
	incq %rdx
	andq %rcx, %rdx
	jmp .LB31793
.LB31795:
	xorl %eax, %eax
.LB31788:
	testq %rax, %rax
	je .LB1193
.LB1194:
	movq 8(%rax), %rcx
	cmpq $1, 16(%rax)
	je .LB1214
.LB1215:
	movq $3, 16(%rax)
	cmpq $8, %rcx
	ja .LB31804
.LB31805:
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
.LB31797:
	shlq $5, %rdx
	leaq (%rax,%rdx,1), %rax
	jmp .LB31788
.LB31791:
	xorl %eax, %eax
	jmp .LB31788
.LB31804:
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB1214:
	movq 24(%rax), %rdi
	movq %rsi, %rcx
	callq standard__memory__allocators__stdheap__table_remove__1__dataE1_ubits64__ret_voidE1
	movq standard__memory__allocators__stdheap__g_large_used(%rip), %rax
	decq %rax
	movq %rax, standard__memory__allocators__stdheap__g_large_used(%rip)
	movq %rsi, %rcx
	movq %rdi, %rdx
	callq standard__memory__allocators__stdheap__heap_os_free__2__dataE1_ubits64__dataE1_ubits64__ret_voidE1
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
.LB1231:
	movq %rcx, %rsi
	addq $32, %rdx
	movq 8(%rsi), %rax
	cmpq %rax, %rdx
	movq %rax, %rdi
	cmova %rdx, %rdi
	movq %rdi, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	testq %rax, %rax
	je .LB1258
.LB1259:
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
.LB1258:
	xorl %eax, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__memory__allocators__stdarena__arena_init_sized__2__ArenaE1_ptr1__dataE1_ubits64__ret_voidE1
	.def standard__memory__allocators__stdarena__arena_init_sized__2__ArenaE1_ptr1__dataE1_ubits64__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__memory__allocators__stdarena__arena_init_sized__2__ArenaE1_ptr1__dataE1_ubits64__ret_voidE1:
.LB1300:
	movq $0, (%rcx)
	movq %rdx, 8(%rcx)
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
.LB1313:
	movq %rcx, %rsi
	addq $7, %rdx
	movabsq $4294967288, %rax
	movq %rdx, %rdi
	andq %rax, %rdi
	movq (%rsi), %rax
	testq %rax, %rax
	jne .LB1336
.LB1335:
	movq %rsi, %rcx
	movq %rdi, %rdx
	callq standard__memory__allocators__stdarena___new_chunk__2__ArenaE1_ptr1__dataE1_ubits64__ret_boolE1
	testb %al, %al
	je .LB1372
.LB1373:
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
.LB1336:
	movq 16(%rax), %rcx
	leaq (%rcx,%rdi), %rdx
	cmpq 8(%rax), %rdx
	jbe .LB1351
	jmp .LB1335
.LB1372:
	xorl %eax, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB1351:
	addq %rax, %rcx
	movq %rdx, 16(%rax)
	movq %rcx, %rax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__memory__allocators__stdarena__arena_destroy__1__ArenaE1_ptr1__ret_voidE1
	.def standard__memory__allocators__stdarena__arena_destroy__1__ArenaE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__memory__allocators__stdarena__arena_destroy__1__ArenaE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB1398:
	movq %rcx, %rsi
	movq (%rsi), %rax
.LB1406:
	testq %rax, %rax
	je .LB1408
.LB1407:
	movq (%rax), %rdi
	movq %rax, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movq %rdi, %rax
	jmp .LB1406
.LB1408:
	movq $0, (%rsi)
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__strings__helpers__is_whitespace__1__charE1__ret_boolE1
	.def standard__strings__helpers__is_whitespace__1__charE1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__strings__helpers__is_whitespace__1__charE1__ret_boolE1:
.LB1427:
	cmpb $32, %cl
	jne .LB1431
.LB31868:
	movl $1, %eax
	ret
.LB1431:
	cmpb $9, %cl
	jne .LB1436
.LB31869:
	movl $1, %eax
	ret
.LB1436:
	cmpb $10, %cl
	jne .LB1441
.LB31870:
	movl $1, %eax
	ret
.LB1441:
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
.LB1446:
	cmpb $48, %cl
	jge .LB1450
.LB31871:
	xorl %eax, %eax
	ret
.LB1450:
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
.LB1455:
	cmpb $97, %cl
	jl .LB1464
.LB1459:
	cmpb $122, %cl
	jg .LB1464
.LB31872:
	movl $1, %eax
	ret
.LB1464:
	cmpb $65, %cl
	jge .LB1468
.LB31873:
	xorl %eax, %eax
	ret
.LB1468:
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
.LB1474:
	cmpb $65, %cl
	jge .LB1478
.LB31874:
	xorl %eax, %eax
	ret
.LB1478:
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
.LB1483:
	cmpb $97, %cl
	jge .LB1487
.LB31875:
	xorl %eax, %eax
	ret
.LB1487:
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
.LB1492:
	movl %ecx, %esi
	movzbl %sil, %ecx
	callq standard__strings__helpers__is_alpha__1__charE1__ret_boolE1
	testb %al, %al
	je .LB1496
.LB31876:
	movl $1, %eax
	movq -8(%rbp), %rsi
	leave
	ret
.LB1496:
	movzbl %sil, %ecx
	callq standard__strings__helpers__is_digit__1__charE1__ret_boolE1
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
.LB1501:
	cmpb $65, %cl
	jl .LB1511
.LB1505:
	cmpb $90, %cl
	jle .LB1510
.LB1511:
	movzbl %cl, %eax
	ret
.LB1510:
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
.LB1518:
	cmpb $97, %cl
	jl .LB1528
.LB1522:
	cmpb $122, %cl
	jle .LB1527
.LB1528:
	movzbl %cl, %eax
	ret
.LB1527:
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
.LB1535:
	movl %r8d, %eax
.LB1539:
	movslq %eax, %rsi
	movzbl (%rcx,%rsi,1), %esi
	testb %sil, %sil
	je .LB1542
.LB1540:
	cmpb %dl, %sil
	je .LB1557
.LB1558:
	incl %eax
	jmp .LB1539
.LB1542:
	movabsq $4294967295, %rax
	movq 0(%rsp), %rsi
	addq $16, %rsp
	ret
.LB1557:
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
.LB1564:
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
	jne .LS31878f
.LS31878l:
	addq $32, %rdx
	vpcmpeqb (%rdx), %ymm15, %ymm0
	vpmovmskb %ymm0, %r9d
	testl %r9d, %r9d
	je .LS31878l
	tzcntl %r9d, %r9d
	addq %rdx, %r9
	subq %rax, %r9
	jmp .LS31878d
.LS31878f:
	tzcntl %r9d, %r9d
.LS31878d:
	vzeroupper
.LB1573:
	xorl %eax, %eax
.LB1582:
	movslq %eax, %rcx
	cmpb $0, (%rdi,%rcx,1)
	je .LB1584
.LB1583:
	incl %eax
	jmp .LB1582
.LB1584:
	testl %eax, %eax
	je .LB1595
.LB1596:
	subl %eax, %r9d
.LB1599:
	cmpl %r9d, %r8d
	jg .LB1602
.LB1600:
	xorl %ecx, %ecx
.LB1610:
	cmpl %eax, %ecx
	jl .LB1611
.LB31877:
	movl $1, %ecx
.LB1613:
	testb %cl, %cl
	jne .LB1635
.LB1636:
	incl %r8d
	cmpl %r9d, %r8d
	jle .LB1600
.LB1602:
	movabsq $4294967295, %rax
	movq 16(%rsp), %rbx
	movq 8(%rsp), %rsi
	movq 0(%rsp), %rdi
	addq $32, %rsp
	ret
.LB1611:
	leal (%r8,%rcx), %edx
	movslq %ecx, %rbx
	movslq %edx, %rdx
	movzbl (%rsi,%rdx,1), %edx
	movzbl (%rdi,%rbx,1), %ebx
	cmpb %bl, %dl
	jne .LB1629
.LB1630:
	incl %ecx
	cmpl %eax, %ecx
	jl .LB1611
	jmp .LB31877
.LB1629:
	xorl %ecx, %ecx
	testb %cl, %cl
	je .LB1636
.LB1635:
	movl %r8d, %eax
	movq 16(%rsp), %rbx
	movq 8(%rsp), %rsi
	movq 0(%rsp), %rdi
	addq $32, %rsp
	ret
.LB1595:
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
.LB1642:
	movq %rcx, %rsi
	movq %rdx, %rdi
	xorl %ebx, %ebx
.LB1648:
	movslq %ebx, %rax
	cmpb $0, (%rsi,%rax,1)
	je .LB1650
.LB1657:
	cmpb $0, (%rdi,%rax,1)
	je .LB1650
.LB1649:
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
	jne .LB1679
.LB1680:
	incl %ebx
	jmp .LB1648
.LB1650:
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
.LB1679:
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
.LB1700:
	xorl %eax, %eax
.LB1704:
	movslq %eax, %rsi
	movzbl (%rdx,%rsi,1), %esi
	testb %sil, %sil
	je .LB1706
.LB1705:
	movslq %eax, %rdi
	movzbl (%rcx,%rdi,1), %edi
	cmpb %sil, %dil
	jne .LB1722
.LB1723:
	incl %eax
	jmp .LB1704
.LB1706:
	movl $1, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB1722:
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
.LB1727:
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
	jne .LS31879f
.LS31879l:
	addq $32, %rdx
	vpcmpeqb (%rdx), %ymm15, %ymm0
	vpmovmskb %ymm0, %r8d
	testl %r8d, %r8d
	je .LS31879l
	tzcntl %r8d, %r8d
	addq %rdx, %r8
	subq %rax, %r8
	jmp .LS31879d
.LS31879f:
	tzcntl %r8d, %r8d
.LS31879d:
	vzeroupper
.LB1734:
	xorl %eax, %eax
.LB1743:
	movslq %eax, %rcx
	cmpb $0, (%rdi,%rcx,1)
	je .LB1745
.LB1744:
	incl %eax
	jmp .LB1743
.LB1745:
	cmpl %r8d, %eax
	jg .LB1757
.LB1758:
	subl %eax, %r8d
	xorl %ecx, %ecx
.LB1764:
	cmpl %eax, %ecx
	jge .LB1767
.LB1765:
	leal (%r8,%rcx), %edx
	movslq %ecx, %r9
	movslq %edx, %rdx
	movzbl (%rsi,%rdx,1), %edx
	movzbl (%rdi,%r9,1), %r9d
	cmpb %r9b, %dl
	jne .LB1783
.LB1784:
	incl %ecx
	cmpl %eax, %ecx
	jl .LB1765
.LB1767:
	movl $1, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB1783:
	xorl %eax, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB1757:
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
.LB1788:
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
	jne .LS31882f
.LS31882l:
	addq $32, %rdx
	vpcmpeqb (%rdx), %ymm15, %ymm0
	vpmovmskb %ymm0, %edi
	testl %edi, %edi
	je .LS31882l
	tzcntl %edi, %edi
	addq %rdx, %rdi
	subq %rax, %rdi
	jmp .LS31882d
.LS31882f:
	tzcntl %edi, %edi
.LS31882d:
	vzeroupper
.LB1793:
	leaq 1(%rdi), %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	testq %rax, %rax
	je .LB1813
.LB1814:
	movslq %edi, %rcx
	incq %rcx
	cmpq $32, %rcx
	jge .LB31880
.LB31881:
	xorl %ecx, %ecx
.LB1818:
	cmpl %edi, %ecx
	jg .LB1821
.LB1819:
	movslq %ecx, %rdx
	movzbl (%rsi,%rdx,1), %r8d
	movb %r8b, (%rax,%rdx,1)
	incl %ecx
	cmpl %edi, %ecx
	jle .LB1819
	jmp .LB1821
.LB31880:
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
.LB1821:
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB1813:
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
.LB1836:
	movq %rcx, %rsi
	movl %edx, %edi
	leaq 1(%rdi), %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	testq %rax, %rax
	je .LB1850
.LB1851:
	movslq %edi, %rcx
	xorl %edx, %edx
.LB1855:
	cmpq %rcx, %rdx
	jge .LB1858
.LB1863:
	movzbl (%rsi,%rdx,1), %r8d
	testb %r8b, %r8b
	je .LB1858
.LB1856:
	movb %r8b, (%rax,%rdx,1)
	incq %rdx
	cmpq %rcx, %rdx
	jl .LB1863
.LB1858:
	movslq %edi, %rcx
	movb $0, (%rax,%rcx,1)
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB1850:
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
.LB1886:
	movq %rcx, %rsi
	movl %edx, %edi
	movl %r8d, %ebx
	leaq 1(%rbx), %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	testq %rax, %rax
	je .LB1901
.LB1902:
	xorl %ecx, %ecx
.LB1906:
	cmpl %ebx, %ecx
	jge .LB1909
.LB1914:
	leal (%rdi,%rcx), %edx
	movslq %edx, %rdx
	cmpb $0, (%rsi,%rdx,1)
	je .LB1909
.LB1907:
	leal (%rdi,%rcx), %edx
	movslq %edx, %rdx
	movzbl (%rsi,%rdx,1), %edx
	movslq %ecx, %r8
	movb %dl, (%rax,%r8,1)
	incl %ecx
	cmpl %ebx, %ecx
	jl .LB1914
.LB1909:
	movslq %ebx, %rcx
	movb $0, (%rax,%rcx,1)
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB1901:
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
.LB1941:
	movq %rcx, %rsi
	movq %rdx, %rbx
	movq %rsi, %rax
	movl %eax, %ecx
	movq %rax, %rdx
	andq $-32, %rdx
	vpxor %xmm15, %xmm15, %xmm15
	vpcmpeqb (%rdx), %ymm15, %ymm0
	vpmovmskb %ymm0, %r12d
	shrl %cl, %r12d
	testl %r12d, %r12d
	jne .LS31891f
.LS31891l:
	addq $32, %rdx
	vpcmpeqb (%rdx), %ymm15, %ymm0
	vpmovmskb %ymm0, %r12d
	testl %r12d, %r12d
	je .LS31891l
	tzcntl %r12d, %r12d
	addq %rdx, %r12
	subq %rax, %r12
	jmp .LS31891d
.LS31891f:
	tzcntl %r12d, %r12d
.LS31891d:
	vzeroupper
.LB1947:
	xorl %r13d, %r13d
.LB1957:
	movslq %r13d, %rax
	cmpb $0, (%rbx,%rax,1)
	je .LB1959
.LB1958:
	incl %r13d
	jmp .LB1957
.LB1959:
	leaq (%r12,%r13), %rax
	leaq 1(%rax), %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	testq %rax, %rax
	je .LB1982
.LB1983:
	cmpl $32, %r12d
	jge .LB31883
.LB31884:
	movslq %r12d, %rcx
	xorl %edx, %edx
	testq %rcx, %rcx
	cmovg %rcx, %rdx
	shrq $2, %rdx
	xorl %edi, %edi
.LB31885:
	testq %rdx, %rdx
	je .LB31887
.LB31886:
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
	jne .LB31886
.LB31887:
.LB1987:
	cmpq %rcx, %rdi
	jge .LB1990
.LB1988:
	movzbl (%rsi,%rdi,1), %edx
	movb %dl, (%rax,%rdi,1)
	incq %rdi
	cmpq %rcx, %rdi
	jl .LB1988
	jmp .LB1990
.LB31883:
	movslq %r12d, %rcx
	movq %rcx, %rdx
	sarq $63, %rdx
	notq %rdx
	andq %rdx, %rcx
	movq %rax, %rdi
	rep movsb
.LB1990:
	xorl %ecx, %ecx
	testl %r13d, %r13d
	cmovg %r13d, %ecx
	shrl $2, %ecx
	xorl %edx, %edx
.LB31888:
	testl %ecx, %ecx
	je .LB31890
.LB31889:
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
	jne .LB31889
.LB31890:
.LB2004:
	cmpl %r13d, %edx
	jge .LB2007
.LB2005:
	movslq %edx, %rcx
	movzbl (%rbx,%rcx,1), %ecx
	leal (%r12,%rdx), %esi
	movslq %esi, %rsi
	movb %cl, (%rax,%rsi,1)
	incl %edx
	cmpl %r13d, %edx
	jl .LB2005
.LB2007:
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
.LB1982:
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
.LB2030:
	movq %rcx, %rax
	xorl %ecx, %ecx
.LB2034:
	leaq 1(%rax), %rdx
	cmpb $0, (%rax)
	je .LB2041
.LB2042:
	incl %ecx
	movq %rdx, %rax
	jmp .LB2034
.LB2041:
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
.LB2046:
	testw %cx, %cx
	je .LB2052
.LB2053:
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
.LB2074:
	testw %cx, %cx
	jle .LB2076
.LB2075:
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
	jg .LB2075
.LB2076:
	testb %al, %al
	jne .LB2096
.LB2097:
	xorl %eax, %eax
.LB2098:
	leal -1(%rsi), %ecx
.LB2107:
	testw %cx, %cx
	js .LB2109
.LB2108:
	movswl %cx, %esi
	movslq %esi, %rsi
	movzbl (%rsp,%rsi,1), %esi
	movswq %ax, %rdi
	movb %sil, (%rdx,%rdi,1)
	incl %eax
	decl %ecx
	testw %cx, %cx
	jns .LB2108
	jmp .LB2109
.LB2096:
	movb $45, (%rdx)
	movl $1, %eax
	jmp .LB2098
.LB2109:
	movswq %ax, %rcx
	movzwl %ax, %eax
	movb $0, (%rdx,%rcx,1)
	movq 16(%rsp), %rsi
	movq 8(%rsp), %rdi
	addq $32, %rsp
	ret
.LB2052:
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
.LB2129:
	testl %ecx, %ecx
	je .LB2134
.LB2135:
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
.LB2153:
	testl %ecx, %ecx
	jle .LB2155
.LB2154:
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
	jg .LB2154
.LB2155:
	cmpl $1, %edi
	je .LB2171
.LB2172:
	xorl %ecx, %ecx
.LB2173:
	decl %eax
.LB2180:
	testl %eax, %eax
	js .LB2182
.LB2181:
	movslq %eax, %rsi
	movzbl -8(%rsp,%rsi,1), %esi
	movslq %ecx, %rdi
	movb %sil, (%rdx,%rdi,1)
	incl %ecx
	decl %eax
	jns .LB2181
	jmp .LB2182
.LB2171:
	movb $45, (%rdx)
	movl $1, %ecx
	jmp .LB2173
.LB2182:
	movslq %ecx, %rax
	movb $0, (%rdx,%rax,1)
	movl %ecx, %eax
	movq 32(%rsp), %rsi
	movq 24(%rsp), %rdi
	addq $48, %rsp
	ret
.LB2134:
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
.LB2200:
	movq %rdx, %rsi
	testq %rcx, %rcx
	je .LB2206
.LB2207:
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
.LB2230:
	testq %rcx, %rcx
	jle .LB2232
.LB2231:
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
	jg .LB2231
.LB2232:
	cmpq $1, %rdi
	je .LB2254
.LB2255:
	xorl %eax, %eax
.LB2256:
	leaq -1(%r8), %rcx
.LB2265:
	testq %rcx, %rcx
	js .LB2267
.LB2266:
	movslq %ecx, %rdx
	movzbl -8(%rsp,%rdx,1), %edx
	movb %dl, (%rsi,%rax,1)
	incq %rax
	decq %rcx
	jns .LB2266
	jmp .LB2267
.LB2254:
	movb $45, (%rsi)
	movl $1, %eax
	jmp .LB2256
.LB2267:
	movb $0, (%rsi,%rax,1)
	movq 32(%rsp), %rsi
	movq 24(%rsp), %rdi
	addq $48, %rsp
	ret
.LB2206:
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
.LB2287:
	testw %cx, %cx
	je .LB2293
.LB2294:
	movq .LZERO(%rip), %r10
	movq %r10, (%rsp)
	xorl %eax, %eax
.LB2306:
	testw %cx, %cx
	jbe .LB2308
.LB2307:
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
	ja .LB2307
.LB2308:
	movq %rax, %rcx
	xorl %eax, %eax
.LB2329:
	testw %cx, %cx
	jbe .LB2331
.LB2330:
	decl %ecx
	movswl %cx, %esi
	movslq %esi, %rsi
	movzbl (%rsp,%rsi,1), %esi
	movswq %ax, %rdi
	movb %sil, (%rdx,%rdi,1)
	incl %eax
	testw %cx, %cx
	ja .LB2330
.LB2331:
	movswq %ax, %rcx
	movzwl %ax, %eax
	movb $0, (%rdx,%rcx,1)
	movq 16(%rsp), %rsi
	movq 8(%rsp), %rdi
	addq $32, %rsp
	ret
.LB2293:
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
.LB2351:
	testl %ecx, %ecx
	je .LB2356
.LB2357:
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -8(%rsp)
	vzeroupper
	xorl %eax, %eax
.LB2367:
	testl %ecx, %ecx
	jbe .LB2369
.LB2368:
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
	ja .LB2368
.LB2369:
	movq %rax, %rcx
	xorl %eax, %eax
.LB2385:
	testl %ecx, %ecx
	jbe .LB2387
.LB2386:
	decl %ecx
	movslq %ecx, %rsi
	movzbl -8(%rsp,%rsi,1), %esi
	movslq %eax, %rdi
	movb %sil, (%rdx,%rdi,1)
	incl %eax
	testl %ecx, %ecx
	ja .LB2386
.LB2387:
	movslq %eax, %rcx
	movb $0, (%rdx,%rcx,1)
	movq 32(%rsp), %rsi
	movq 24(%rsp), %rdi
	addq $48, %rsp
	ret
.LB2356:
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
.LB2405:
	movq %rdx, %rsi
	testq %rcx, %rcx
	je .LB2411
.LB2412:
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -8(%rsp)
	vzeroupper
	xorl %edi, %edi
.LB2424:
	testq %rcx, %rcx
	je .LB2426
.LB2425:
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
	jne .LB2425
.LB2426:
	xorl %eax, %eax
.LB2447:
	testq %rdi, %rdi
	je .LB2449
.LB2448:
	decq %rdi
	movslq %edi, %rcx
	movzbl -8(%rsp,%rcx,1), %ecx
	movb %cl, (%rsi,%rax,1)
	incq %rax
	testq %rdi, %rdi
	jne .LB2448
.LB2449:
	movb $0, (%rsi,%rax,1)
	movq 32(%rsp), %rsi
	movq 24(%rsp), %rdi
	addq $48, %rsp
	ret
.LB2411:
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
.LB2469:
	xorl %eax, %eax
.LB2476:
	movslq %eax, %rdx
	movzbl (%rcx,%rdx,1), %esi
	cmpb $32, %sil
	je .LB2477
.LB2485:
	cmpb $9, %sil
	je .LB2477
.LB2494:
	cmpb $10, (%rcx,%rdx,1)
	je .LB2477
.LB2503:
	cmpb $13, (%rcx,%rdx,1)
	jne .LB2478
.LB2477:
	incl %eax
	jmp .LB2476
.LB2478:
	movzbl (%rcx,%rdx,1), %edx
	cmpb $45, %dl
	je .LB2520
.LB2521:
	cmpb $43, %dl
	je .LB2532
.LB2533:
	movl $1, %edx
.LB2522:
	movq %rax, %rsi
	xorl %eax, %eax
.LB2536:
	movslq %esi, %rdi
	movzbl (%rcx,%rdi,1), %edi
	testb %dil, %dil
	je .LB2538
.LB2537:
	cmpb $48, %dil
	jb .LB2538
.LB2552:
	cmpb $57, %dil
	ja .LB2538
.LB2558:
	movzbl %dil, %edi
	subl $48, %edi
	imull $10, %eax, %eax
	addl %edi, %eax
	incl %esi
	jmp .LB2536
.LB2532:
	incl %eax
	movl $1, %edx
	jmp .LB2522
.LB2520:
	incl %eax
	movl $4294967295, %edx
	jmp .LB2522
.LB2538:
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
.LB2573:
	xorl %eax, %eax
.LB2579:
	movslq %eax, %rdx
	movzbl (%rcx,%rdx,1), %edx
	leal -9(%rdx), %esi
	cmpb $24, %sil
	jae .LB31892
.LB31893:
	movzbl %sil, %esi
	movl $8388627, %edi
	btq %rsi, %rdi
	jae .LB31892
.LB2580:
	incl %eax
	jmp .LB2579
.LB31892:
	cmpb $45, %dl
	je .LB2623
.LB2624:
	leal 1(%rax), %esi
	cmpb $43, %dl
	cmove %esi, %eax
	movq %rax, %rdx
	xorl %eax, %eax
.LB2636:
	movslq %edx, %rsi
	movzbl (%rcx,%rsi,1), %esi
	movzbl %sil, %edi
	testb %sil, %sil
	je .LB2638
.LB2637:
	cmpb $48, %sil
	jb .LB2659
.LB2652:
	cmpb $57, %sil
	ja .LB2659
.LB2658:
	subl $48, %edi
	imull $10, %eax, %eax
	addl %edi, %eax
	incl %edx
	jmp .LB2636
.LB2659:
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB2638:
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB2623:
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
.LB2671:
	xorl %eax, %eax
.LB2679:
	movslq %eax, %rdx
	movzbl (%rcx,%rdx,1), %esi
	cmpb $32, %sil
	je .LB2680
.LB2688:
	cmpb $9, %sil
	je .LB2680
.LB2697:
	cmpb $10, (%rcx,%rdx,1)
	je .LB2680
.LB2706:
	cmpb $13, (%rcx,%rdx,1)
	jne .LB2681
.LB2680:
	incl %eax
	jmp .LB2679
.LB2681:
	movzbl (%rcx,%rdx,1), %edx
	cmpb $45, %dl
	je .LB2723
.LB2724:
	cmpb $43, %dl
	je .LB2736
.LB2737:
	movq %rax, %rdx
	movl $1, %eax
.LB2725:
	movq %rdx, %rsi
	xorl %edx, %edx
.LB2740:
	movslq %esi, %rdi
	movzbl (%rcx,%rdi,1), %edi
	testb %dil, %dil
	je .LB2742
.LB2741:
	cmpb $48, %dil
	jb .LB2742
.LB2756:
	cmpb $57, %dil
	ja .LB2742
.LB2762:
	movzbl %dil, %edi
	subl $48, %edi
	imulq $10, %rdx, %rdx
	addq %rdi, %rdx
	incl %esi
	jmp .LB2740
.LB2736:
	leal 1(%rax), %edx
	movl $1, %eax
	jmp .LB2725
.LB2723:
	leal 1(%rax), %edx
	movq $-1, %rax
	jmp .LB2725
.LB2742:
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
.LB2779:
	xorl %eax, %eax
.LB2785:
	movslq %eax, %rdx
	movzbl (%rcx,%rdx,1), %edx
	leal -9(%rdx), %esi
	cmpb $24, %sil
	jae .LB31894
.LB31895:
	movzbl %sil, %esi
	movl $8388627, %edi
	btq %rsi, %rdi
	jae .LB31894
.LB2786:
	incl %eax
	jmp .LB2785
.LB31894:
	cmpb $45, %dl
	je .LB2829
.LB2830:
	leal 1(%rax), %esi
	cmpb $43, %dl
	cmove %esi, %eax
	movq %rax, %rdx
	xorl %eax, %eax
.LB2843:
	movslq %edx, %rsi
	movzbl (%rcx,%rsi,1), %esi
	movzbl %sil, %edi
	testb %sil, %sil
	je .LB2845
.LB2844:
	cmpb $48, %sil
	jb .LB2866
.LB2859:
	cmpb $57, %sil
	ja .LB2866
.LB2865:
	leal -48(%rdi), %esi
	imulq $10, %rax, %rax
	addq %rsi, %rax
	incl %edx
	jmp .LB2843
.LB2866:
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB2845:
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB2829:
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
.LB2880:
	xorps %xmm1, %xmm1
	ucomiss %xmm0, %xmm1
	ja .LB2888
.LB2889:
	xorl %eax, %eax
.LB2890:
	xorps %xmm1, %xmm1
	ucomiss %xmm1, %xmm0
	sete %cl
	setnp %sil
	movzbl %cl, %ecx
	movzbl %sil, %esi
	andl %esi, %ecx
	testb %cl, %cl
	jne .LB2898
.LB2899:
	cvttss2siq %xmm0, %rcx
	movl %ecx, %ecx
	movslq %ecx, %rsi
	xorps %xmm1, %xmm1
	cvtsi2ssq %rsi, %xmm1
	subss %xmm1, %xmm0
	movl $1, %esi
	xorl %edi, %edi
.LB2946:
	cmpl %r8d, %edi
	jge .LB2948
.LB2947:
	imull $10, %esi, %esi
	incl %edi
	cmpl %r8d, %edi
	jl .LB2947
	jmp .LB2948
.LB2888:
	movb $45, (%rdx)
	xorps %xmm1, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subss %xmm15, %xmm0
	movl $1, %eax
	jmp .LB2890
.LB2948:
	movslq %esi, %rdi
	xorps %xmm1, %xmm1
	cvtsi2ssq %rdi, %xmm1
	movabsq $1056964608, %r10
	movq %r10, %xmm2
	vfmadd132ss %xmm1, %xmm2, %xmm0
	cvttss2siq %xmm0, %rdi
	movl %edi, %edi
	cmpl %esi, %edi
	jge .LB2968
.LB2969:
.LB2970:
	testl %ecx, %ecx
	je .LB2986
.LB2987:
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, 32(%rsp)
	vzeroupper
	movq %rcx, %rsi
	xorl %ecx, %ecx
.LB2999:
	testl %esi, %esi
	jle .LB3001
.LB3000:
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
	jg .LB3000
	jmp .LB3001
.LB2968:
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
	jne .LB2983
.LB2976:
	testl %r8d, %r8d
	jle .LB2983
.LB2983:
	xorl %edi, %edi
	testl %ecx, %ecx
	je .LB2986
	jmp .LB2987
.LB3001:
	decl %ecx
.LB3017:
	testl %ecx, %ecx
	js .LB3019
.LB3018:
	movslq %ecx, %rsi
	movzbl 32(%rsp,%rsi,1), %esi
	movslq %eax, %r9
	movb %sil, (%rdx,%r9,1)
	incl %eax
	decl %ecx
	jns .LB3018
.LB3019:
.LB2988:
	testl %r8d, %r8d
	jg .LB3034
.LB3035:
	movslq %eax, %rcx
	movb $0, (%rdx,%rcx,1)
	movq 80(%rsp), %rbx
	movq 72(%rsp), %rsi
	movq 64(%rsp), %rdi
	addq $96, %rsp
	ret
.LB2986:
	movslq %eax, %rcx
	movb $48, (%rdx,%rcx,1)
	incl %eax
	testl %r8d, %r8d
	jle .LB3035
.LB3034:
	movslq %eax, %rcx
	movb $46, (%rdx,%rcx,1)
	incl %eax
	testl %edi, %edi
	je .LB3045
.LB3046:
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, (%rsp)
	vzeroupper
	xorl %ecx, %ecx
.LB3067:
	testl %edi, %edi
	jle .LB3069
.LB3068:
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
	jg .LB3068
.LB3069:
	subl %ecx, %r8d
	xorl %esi, %esi
.LB3087:
	cmpl %r8d, %esi
	jge .LB3089
.LB3088:
	movslq %eax, %rdi
	movb $48, (%rdx,%rdi,1)
	incl %eax
	incl %esi
	cmpl %r8d, %esi
	jl .LB3088
.LB3089:
	decl %ecx
.LB3104:
	testl %ecx, %ecx
	js .LB3106
.LB3105:
	movslq %ecx, %rsi
	movzbl (%rsp,%rsi,1), %esi
	movslq %eax, %rdi
	movb %sil, (%rdx,%rdi,1)
	incl %eax
	decl %ecx
	jns .LB3105
.LB3106:
.LB3047:
	movslq %eax, %rcx
	movb $0, (%rdx,%rcx,1)
	movq 80(%rsp), %rbx
	movq 72(%rsp), %rsi
	movq 64(%rsp), %rdi
	addq $96, %rsp
	ret
.LB3045:
	xorl %ecx, %ecx
.LB3049:
	cmpl %r8d, %ecx
	jge .LB3051
.LB3050:
	movslq %eax, %rsi
	movb $48, (%rdx,%rsi,1)
	incl %eax
	incl %ecx
	cmpl %r8d, %ecx
	jl .LB3050
.LB3051:
	jmp .LB3047
.LB2898:
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
.LB31896:
	testl %esi, %esi
	je .LB31898
.LB31897:
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
	jne .LB31897
.LB31898:
.LB2910:
	cmpl %r8d, %edi
	jge .LB2912
.LB2911:
	leal (%rcx,%rdi), %esi
	movslq %esi, %rsi
	movb $48, (%rdx,%rsi,1)
	incl %edi
	cmpl %r8d, %edi
	jl .LB2911
.LB2912:
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
.LB3124:
	movq %rdx, %rcx
	xorps %xmm1, %xmm1
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm0, %xmm1
	ja .LB3132
.LB3133:
	xorl %esi, %esi
.LB3134:
	xorps %xmm1, %xmm1
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm1, %xmm0
	sete %al
	setnp %dl
	movzbl %al, %eax
	movzbl %dl, %edx
	andl %edx, %eax
	testb %al, %al
	jne .LB3142
.LB3143:
	cvttsd2siq %xmm0, %rax
	xorps %xmm1, %xmm1
	cvtsi2sdq %rax, %xmm1
	subsd %xmm1, %xmm0
	movl $1, %edx
	xorl %edi, %edi
.LB3192:
	cmpl %r8d, %edi
	jge .LB3194
.LB3193:
	imulq $10, %rdx, %rdx
	incl %edi
	cmpl %r8d, %edi
	jl .LB3193
	jmp .LB3194
.LB3132:
	movb $69, (%rcx)
	xorps %xmm1, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subsd %xmm15, %xmm0
	movl $1, %esi
	jmp .LB3134
.LB3194:
	xorps %xmm1, %xmm1
	cvtsi2sdq %rdx, %xmm1
	movabsq $1056964608, %r10
	movq %r10, %xmm2
	cvtss2sd %xmm2, %xmm2
	vfmadd132sd %xmm1, %xmm2, %xmm0
	cvttsd2siq %xmm0, %rdi
	cmpq %rdx, %rdi
	jge .LB3216
.LB3217:
.LB3218:
	testq %rax, %rax
	je .LB3239
.LB3240:
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, 32(%rsp)
	vzeroupper
	xorl %r9d, %r9d
	movq %rax, %rbx
.LB3252:
	testq %rbx, %rbx
	jle .LB3254
.LB3253:
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
	jg .LB3253
	jmp .LB3254
.LB3216:
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
	jne .LB3235
.LB3228:
	testl %r8d, %r8d
	jle .LB3235
.LB3235:
	movq %rdi, %rax
	xorl %edi, %edi
	testq %rax, %rax
	je .LB3239
	jmp .LB3240
.LB3254:
	leal -1(%r9), %eax
.LB3274:
	testl %eax, %eax
	js .LB3276
.LB3275:
	movslq %eax, %rdx
	movzbl 32(%rsp,%rdx,1), %edx
	movslq %esi, %r9
	movb %dl, (%rcx,%r9,1)
	incl %esi
	decl %eax
	jns .LB3275
.LB3276:
.LB3241:
	testl %r8d, %r8d
	jg .LB3291
.LB3292:
	movq %rsi, %rax
	movslq %eax, %rdx
	movb $0, (%rcx,%rdx,1)
	movq 80(%rsp), %rbx
	movq 72(%rsp), %rsi
	movq 64(%rsp), %rdi
	addq $96, %rsp
	ret
.LB3239:
	movslq %esi, %rax
	movb $48, (%rcx,%rax,1)
	incl %esi
	testl %r8d, %r8d
	jle .LB3292
.LB3291:
	movslq %esi, %rax
	movb $46, (%rcx,%rax,1)
	incl %esi
	testq %rdi, %rdi
	je .LB3303
.LB3304:
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, (%rsp)
	vzeroupper
	movq %rdi, %r9
	xorl %edi, %edi
.LB3325:
	testq %r9, %r9
	jle .LB3327
.LB3326:
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
	jg .LB3326
.LB3327:
	subl %edi, %r8d
	xorl %eax, %eax
.LB3349:
	cmpl %r8d, %eax
	jge .LB3351
.LB3350:
	movslq %esi, %rdx
	movb $48, (%rcx,%rdx,1)
	incl %esi
	incl %eax
	cmpl %r8d, %eax
	jl .LB3350
.LB3351:
	leal -1(%rdi), %eax
.LB3366:
	testl %eax, %eax
	js .LB3368
.LB3367:
	movslq %eax, %rdx
	movzbl (%rsp,%rdx,1), %edx
	movslq %esi, %rdi
	movb %dl, (%rcx,%rdi,1)
	incl %esi
	decl %eax
	jns .LB3367
.LB3368:
.LB3305:
	movq %rsi, %rax
	movslq %eax, %rdx
	movb $0, (%rcx,%rdx,1)
	movq 80(%rsp), %rbx
	movq 72(%rsp), %rsi
	movq 64(%rsp), %rdi
	addq $96, %rsp
	ret
.LB3303:
	xorl %eax, %eax
.LB3307:
	cmpl %r8d, %eax
	jge .LB3309
.LB3308:
	movslq %esi, %rdx
	movb $48, (%rcx,%rdx,1)
	incl %esi
	incl %eax
	cmpl %r8d, %eax
	jl .LB3308
.LB3309:
	jmp .LB3305
.LB3142:
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
.LB31903:
	testl %edx, %edx
	je .LB31905
.LB31904:
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
	jne .LB31904
.LB31905:
.LB3155:
	cmpl %r8d, %edi
	jge .LB3157
.LB3156:
	leal (%rax,%rdi), %edx
	movslq %edx, %rdx
	movb $48, (%rcx,%rdx,1)
	incl %edi
	cmpl %r8d, %edi
	jl .LB3156
.LB3157:
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
.LB3386:
	xorl %eax, %eax
	xorl %edx, %edx
.LB3389:
	movslq %edx, %rsi
	movzbl (%rcx,%rsi,1), %esi
	testb %sil, %sil
	je .LB3392
.LB3390:
	leal 1(%rax), %edi
	cmpb $10, %sil
	cmove %edi, %eax
	incl %edx
	jmp .LB3389
.LB3392:
	testl %eax, %eax
	jg .LB3422
.LB3414:
	cmpb $0, (%rcx)
	jne .LB3422
.LB3423:
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB3422:
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
.LB3428:
	xorl %eax, %eax
	xorl %esi, %esi
.LB3433:
	movslq %esi, %rdi
	movzbl (%rcx,%rdi,1), %edi
	testb %dil, %dil
	jne .LB3434
.LB31910:
	xorl %esi, %esi
.LB3436:
	cmpl %edx, %eax
	jne .LB3466
.LB3467:
	movq %rsi, %rax
.LB3473:
	movslq %eax, %rdx
	movzbl (%rcx,%rdx,1), %edx
	testb %dl, %dl
	je .LB3475
.LB3482:
	cmpb $10, %dl
	je .LB3475
.LB3474:
	incl %eax
	jmp .LB3473
.LB3434:
	cmpl %edx, %eax
	je .LB3447
.LB3448:
	leal 1(%rax), %r8d
	cmpb $10, %dil
	cmove %r8d, %eax
	incl %esi
	jmp .LB3433
.LB3447:
	cmpl %edx, %eax
	jne .LB3466
	jmp .LB3467
.LB3475:
	movl %eax, %r8d
	subl %esi, %r8d
	movq %rsi, %rdx
	callq standard__strings__manip__substring__3__byteE1_ptr1__intE1__intE1__ret_byteE1_ptr1
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB3466:
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
.LB3500:
	movq %rcx, %rsi
	xorl %edi, %edi
	xorl %ebx, %ebx
	xorl %r12d, %r12d
.LB3504:
	movslq %r12d, %rax
	movzbl (%rsi,%rax,1), %eax
	testb %al, %al
	je .LB3507
.LB3505:
	movzbl %al, %ecx
	callq standard__strings__helpers__is_whitespace__1__charE1__ret_boolE1
	testb %al, %al
	jne .LB3520
.LB3521:
	testb %bl, %bl
	je .LB3525
.LB3526:
.LB3522:
	incl %r12d
	jmp .LB3504
.LB3507:
	movl %edi, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB3525:
	incl %edi
	movl $1, %ebx
	jmp .LB3522
.LB3520:
	xorl %ebx, %ebx
	jmp .LB3522
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
.LB3532:
	movq %rcx, %rbx
	movq %rdx, %rsi
	movq %r8, %r12
	movq %rbx, %rcx
	movq %rsi, %rdx
	xorl %r8d, %r8d
	callq standard__strings__helpers__find_substring__3__byteE1_ptr1__byteE1_ptr1__intE1__ret_intE1
	movl %eax, %r13d
	cmpl $4294967295, %r13d
	je .LB3543
.LB3544:
	xorl %r14d, %r14d
.LB3549:
	movslq %r14d, %rax
	cmpb $0, (%rbx,%rax,1)
	je .LB3551
.LB3550:
	incl %r14d
	jmp .LB3549
.LB3551:
	xorl %r15d, %r15d
.LB3561:
	movslq %r15d, %rax
	cmpb $0, (%rsi,%rax,1)
	je .LB3563
.LB3562:
	incl %r15d
	jmp .LB3561
.LB3563:
	movq $0, -64(%rbp)
.LB3573:
	movq -64(%rbp), %rax
	movslq %eax, %rax
	cmpb $0, (%r12,%rax,1)
	je .LB3575
.LB3574:
	movq -64(%rbp), %rax
	incl %eax
	movq %rax, -64(%rbp)
	jmp .LB3573
.LB3575:
	movl %r14d, %eax
	subl %r15d, %eax
	movq -64(%rbp), %rcx
	addl %ecx, %eax
	leaq 1(%rax), %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	testq %rax, %rax
	je .LB3601
.LB3602:
	cmpl $32, %r13d
	jge .LB31911
.LB31912:
	movslq %r13d, %rcx
	xorl %edx, %edx
	testq %rcx, %rcx
	cmovg %rcx, %rdx
	shrq $2, %rdx
	xorl %esi, %esi
.LB31913:
	testq %rdx, %rdx
	je .LB31915
.LB31914:
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
	jne .LB31914
.LB31915:
.LB3606:
	cmpq %rcx, %rsi
	jge .LB3609
.LB3607:
	movzbl (%rbx,%rsi,1), %edx
	movb %dl, (%rax,%rsi,1)
	incq %rsi
	cmpq %rcx, %rsi
	jl .LB3607
	jmp .LB3609
.LB31911:
	movslq %r13d, %rcx
	movq %rcx, %rdx
	sarq $63, %rdx
	notq %rdx
	andq %rdx, %rcx
	movq %rax, %rdi
	movq %rbx, %rsi
	rep movsb
.LB3609:
	xorl %ecx, %ecx
	movq -64(%rbp), %rdx
	testl %edx, %edx
	cmovg %edx, %ecx
	shrl $2, %ecx
	xorl %edx, %edx
.LB31916:
	testl %ecx, %ecx
	je .LB31918
.LB31917:
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
	jne .LB31917
.LB31918:
.LB3623:
	movq -64(%rbp), %rcx
	cmpl %ecx, %edx
	jge .LB3626
.LB3624:
	movslq %edx, %rcx
	movzbl (%r12,%rcx,1), %ecx
	leal (%r13,%rdx), %esi
	movslq %esi, %rsi
	movb %cl, (%rax,%rsi,1)
	incl %edx
	jmp .LB3623
.LB3626:
	leal (%r13,%r15), %ecx
.LB3642:
	cmpl %r14d, %ecx
	jg .LB3645
.LB3643:
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
	jle .LB3643
.LB3645:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB3601:
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
.LB3543:
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
.LB3667:
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
.LB31919:
	testq %rdx, %rdx
	je .LB31921
.LB31920:
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
	jne .LB31920
.LB31921:
.LB3678:
	cmpq %rcx, %r8
	jge .LB3680
.LB3679:
	movzbl -32(%rbp,%r8,1), %edx
	movslq (%rdi), %r9
	movb %dl, (%rsi,%r9,1)
	movl (%rdi), %edx
	incl %edx
	movl %edx, (%rdi)
	incq %r8
	cmpq %rcx, %r8
	jl .LB3679
.LB3680:
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
.LB3698:
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
.LB31922:
	testq %rdx, %rdx
	je .LB31924
.LB31923:
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
	jne .LB31923
.LB31924:
.LB3708:
	cmpq %rcx, %r8
	jge .LB3710
.LB3709:
	movzbl -56(%rbp,%r8,1), %edx
	movslq (%rdi), %r9
	movb %dl, (%rsi,%r9,1)
	movl (%rdi), %edx
	incl %edx
	movl %edx, (%rdi)
	incq %r8
	cmpq %rcx, %r8
	jl .LB3709
.LB3710:
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
.LB3728:
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
.LB31925:
	testq %rdx, %rdx
	je .LB31927
.LB31926:
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
	jne .LB31926
.LB31927:
.LB3739:
	cmpq %rcx, %r8
	jge .LB3741
.LB3740:
	movzbl -56(%rbp,%r8,1), %edx
	movslq (%rdi), %r9
	movb %dl, (%rsi,%r9,1)
	movl (%rdi), %edx
	incl %edx
	movl %edx, (%rdi)
	incq %r8
	cmpq %rcx, %r8
	jl .LB3740
.LB3741:
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
.LB3759:
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
.LB31928:
	testq %rdx, %rdx
	je .LB31930
.LB31929:
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
	jne .LB31929
.LB31930:
.LB3770:
	cmpq %rcx, %r8
	jge .LB3772
.LB3771:
	movzbl -32(%rbp,%r8,1), %edx
	movslq (%rdi), %r9
	movb %dl, (%rsi,%r9,1)
	movl (%rdi), %edx
	incl %edx
	movl %edx, (%rdi)
	incq %r8
	cmpq %rcx, %r8
	jl .LB3771
.LB3772:
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
.LB3790:
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
.LB31931:
	testq %rdx, %rdx
	je .LB31933
.LB31932:
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
	jne .LB31932
.LB31933:
.LB3800:
	cmpq %rcx, %r8
	jge .LB3802
.LB3801:
	movzbl -56(%rbp,%r8,1), %edx
	movslq (%rdi), %r9
	movb %dl, (%rsi,%r9,1)
	movl (%rdi), %edx
	incl %edx
	movl %edx, (%rdi)
	incq %r8
	cmpq %rcx, %r8
	jl .LB3801
.LB3802:
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
.LB3820:
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
.LB31934:
	testq %rdx, %rdx
	je .LB31936
.LB31935:
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
	jne .LB31935
.LB31936:
.LB3831:
	cmpq %rcx, %r8
	jge .LB3833
.LB3832:
	movzbl -56(%rbp,%r8,1), %edx
	movslq (%rdi), %r9
	movb %dl, (%rsi,%r9,1)
	movl (%rdi), %edx
	incl %edx
	movl %edx, (%rdi)
	incq %r8
	cmpq %rcx, %r8
	jl .LB3832
.LB3833:
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
.LB3851:
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
.LB31937:
	testq %rdx, %rdx
	je .LB31939
.LB31938:
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
	jne .LB31938
.LB31939:
.LB3861:
	cmpq %rcx, %r8
	jge .LB3863
.LB3862:
	movzbl -56(%rbp,%r8,1), %edx
	movslq (%rdi), %r9
	movb %dl, (%rsi,%r9,1)
	movl (%rdi), %edx
	incl %edx
	movl %edx, (%rdi)
	incq %r8
	cmpq %rcx, %r8
	jl .LB3862
.LB3863:
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
.LB3881:
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
.LB31940:
	testq %rdx, %rdx
	je .LB31942
.LB31941:
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
	jne .LB31941
.LB31942:
.LB3891:
	cmpq %rcx, %r8
	jge .LB3893
.LB3892:
	movzbl -56(%rbp,%r8,1), %edx
	movslq (%rdi), %r9
	movb %dl, (%rsi,%r9,1)
	movl (%rdi), %edx
	incl %edx
	movl %edx, (%rdi)
	incq %r8
	cmpq %rcx, %r8
	jl .LB3892
.LB3893:
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
.LB3911:
	xorl %eax, %eax
.LB3916:
	movslq %eax, %rsi
	movzbl (%rcx,%rsi,1), %esi
	testb %sil, %sil
	je .LB3918
.LB3917:
	movslq (%r8), %rdi
	movb %sil, (%rdx,%rdi,1)
	movl (%r8), %esi
	incl %esi
	movl %esi, (%r8)
	incl %eax
	jmp .LB3916
.LB3918:
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
.LB3940:
	movq %rcx, %rsi
	movq %rdx, %rdi
	testq %rsi, %rsi
	je .LB3954
.LB3947:
	testq %rdi, %rdi
	je .LB3954
.LB3955:
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %ebx
	movq %rdi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	testl %eax, %eax
	je .LB3966
.LB3967:
	cmpl %ebx, %eax
	jg .LB3973
.LB3974:
	movl %ebx, %ecx
	subl %eax, %ecx
.LB3978:
	testl %ecx, %ecx
	js .LB3981
.LB3979:
	xorl %edx, %edx
.LB3988:
	cmpl %eax, %edx
	jl .LB3989
.LB31943:
	movl $1, %edx
.LB3991:
	testb %dl, %dl
	jne .LB4013
.LB4014:
	decl %ecx
	jns .LB3979
.LB3981:
	movabsq $4294967295, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB3989:
	leal (%rcx,%rdx), %r8d
	movslq %edx, %r9
	movslq %r8d, %r8
	movzbl (%rsi,%r8,1), %r8d
	movzbl (%rdi,%r9,1), %r9d
	cmpb %r9b, %r8b
	jne .LB4007
.LB4008:
	incl %edx
	cmpl %eax, %edx
	jl .LB3989
	jmp .LB31943
.LB4007:
	xorl %edx, %edx
	testb %dl, %dl
	je .LB4014
.LB4013:
	movl %ecx, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB3973:
	movabsq $4294967295, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB3966:
	movl %ebx, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB3954:
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
.LB4020:
	movq %rcx, %rsi
	movl %edx, %edi
	testq %rsi, %rsi
	je .LB4027
.LB4028:
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	decl %eax
.LB4034:
	testl %eax, %eax
	js .LB4037
.LB4035:
	movslq %eax, %rcx
	movzbl (%rsi,%rcx,1), %ecx
	cmpb %dil, %cl
	je .LB4049
.LB4050:
	decl %eax
	jns .LB4035
.LB4037:
	movabsq $4294967295, %rax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB4049:
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB4027:
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
.LB4056:
	movq %rcx, %rsi
	movq %rdx, %rdi
	testq %rsi, %rsi
	je .LB4070
.LB4063:
	testq %rdi, %rdi
	je .LB4070
.LB4071:
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %ebx
	movq %rdi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	testl %eax, %eax
	je .LB4087
.LB4081:
	cmpl %ebx, %eax
	jg .LB4087
.LB4088:
	subl %eax, %ebx
	xorl %ecx, %ecx
	xorl %edx, %edx
.LB4093:
	cmpl %ebx, %edx
	jg .LB4095
.LB4094:
	xorl %r8d, %r8d
.LB4101:
	cmpl %eax, %r8d
	jl .LB4102
.LB31944:
	movl $1, %r8d
.LB4104:
	leal 1(%rcx), %r9d
	leal (%rdx,%rax), %r12d
	incl %edx
	testb %r8b, %r8b
	cmovne %r9d, %ecx
	testb %r8b, %r8b
	cmovne %r12d, %edx
	cmpl %ebx, %edx
	jle .LB4094
.LB4095:
	movl %ecx, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB4102:
	leal (%rdx,%r8), %r9d
	movslq %r8d, %r12
	movslq %r9d, %r9
	movzbl (%rsi,%r9,1), %r9d
	movzbl (%rdi,%r12,1), %r12d
	cmpb %r12b, %r9b
	jne .LB4120
.LB4121:
	incl %r8d
	cmpl %eax, %r8d
	jl .LB4102
	jmp .LB31944
.LB4120:
	xorl %r8d, %r8d
	jmp .LB4104
.LB4087:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB4070:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
	.text
	.globl standard__time__win_time_now__0__ret_dataE1_sbits64
	.def standard__time__win_time_now__0__ret_dataE1_sbits64;
	.scl 2;
	.type 32;
	.endef
standard__time__win_time_now__0__ret_dataE1_sbits64:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB4137:
	movq $0, -24(%rbp)
	movq $0, -32(%rbp)
	leaq -24(%rbp), %rcx
	callq QueryPerformanceCounter
	leaq -32(%rbp), %rcx
	callq QueryPerformanceFrequency
	cmpq $0, -32(%rbp)
	je .LB4145
.LB4146:
	movq -24(%rbp), %rcx
	movq -32(%rbp), %rsi
	movq %rcx, %rax
	cqto
	idivq %rsi
	movq standard__time__TIME_NS_PER_SEC(%rip), %rdi
	movq %rax, %r8
	imulq %rdi, %r8
	movq %rcx, %rax
	cqto
	idivq %rsi
	movq %rdx, %rax
	imulq %rdi, %rax
	cqto
	idivq %rsi
	addq %r8, %rax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB4145:
	xorl %eax, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__time__win_sleep_ms__1__dataE1_ubits32__ret_voidE1
	.def standard__time__win_sleep_ms__1__dataE1_ubits32__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__time__win_sleep_ms__1__dataE1_ubits32__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB4162:
	callq Sleep
	leave
	ret
	.text
	.globl standard__time__time_now__0__ret_dataE1_sbits64
	.def standard__time__time_now__0__ret_dataE1_sbits64;
	.scl 2;
	.type 32;
	.endef
standard__time__time_now__0__ret_dataE1_sbits64:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB4165:
	movl $1, %eax
	cmpl $1, %eax
	jne .LB4168
.LB4167:
	callq standard__time__win_time_now__0__ret_dataE1_sbits64
	leave
	ret
.LB4168:
	xorl %eax, %eax
	leave
	ret
	.text
	.globl standard__time__sleep_ms__1__dataE1_ubits32__ret_voidE1
	.def standard__time__sleep_ms__1__dataE1_ubits32__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__time__sleep_ms__1__dataE1_ubits32__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB4171:
	movl $1, %eax
	cmpl $1, %eax
	jne .LB4175
.LB4174:
	callq standard__time__win_sleep_ms__1__dataE1_ubits32__ret_voidE1
	leave
	ret
.LB4175:
	leave
	ret
	.text
	.globl standard__time__ns_to_ms__1__dataE1_sbits64__ret_dataE1_sbits64
	.def standard__time__ns_to_ms__1__dataE1_sbits64__ret_dataE1_sbits64;
	.scl 2;
	.type 32;
	.endef
standard__time__ns_to_ms__1__dataE1_sbits64__ret_dataE1_sbits64:
.LB4177:
	movq %rcx, %rax
	movq standard__time__TIME_NS_PER_MS(%rip), %rcx
	cqto
	idivq %rcx
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
.LB4182:
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
.LB4193:
	movl -52(%rbp), %ecx
	cmpl %ecx, %eax
	jge .LB4196
.LB4194:
	movslq %eax, %rcx
	movzbl (%r14,%rcx,1), %ecx
	cmpb $13, %cl
	je .LB4214
.LB4206:
	cmpb $10, %cl
	je .LB4214
.LB4216:
	incl %eax
	jmp .LB4193
.LB4196:
	movl %ecx, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	leave
	ret
.LB4214:
	movslq %eax, %rcx
	movb $0, (%r14,%rcx,1)
	jmp .LB4216
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
.LB4224:
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
	subq $32, %rsp
.LB4240:
	movl standard__io__console__out_len(%rip), %edx
	testl %edx, %edx
	je .LB4245
.LB4246:
	movl $0, standard__io__console__out_len(%rip)
	leaq standard__io__console__out_buf(%rip), %rcx
	callq standard__io__console__out_raw__2__byteE1_ptr1__intE1__ret_voidE1
	leave
	ret
.LB4245:
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
.LB4250:
	movq %rcx, %rsi
	movl %edx, %edi
	testl %edi, %edi
	jle .LB4256
.LB4257:
	cmpl $8192, %edi
	jge .LB4261
.LB4262:
	movl standard__io__console__out_len(%rip), %eax
	addl %edi, %eax
	cmpl $8192, %eax
	jg .LB4270
.LB4272:
	movl %edi, %eax
	shrl $2, %eax
	xorl %ecx, %ecx
.LB31945:
	testl %eax, %eax
	je .LB31947
.LB31946:
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
	jne .LB31946
	jmp .LB31947
.LB4270:
	callq standard__io__console__flush__0__ret_voidE1
	jmp .LB4272
.LB31947:
.LB4273:
	cmpl %edi, %ecx
	jge .LB4275
.LB4274:
	movslq %ecx, %rax
	leaq standard__io__console__out_buf(%rip), %r8
	movzbl (%rsi,%rax,1), %eax
	movl standard__io__console__out_len(%rip), %edx
	addl %ecx, %edx
	incl %ecx
	movslq %edx, %rdx
	movb %al, (%r8,%rdx,1)
	cmpl %edi, %ecx
	jl .LB4274
.LB4275:
	movl standard__io__console__out_len(%rip), %eax
	addl %edi, %eax
	movl %eax, standard__io__console__out_len(%rip)
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB4261:
	callq standard__io__console__flush__0__ret_voidE1
	movq %rsi, %rcx
	movq %rdi, %rdx
	callq standard__io__console__out_raw__2__byteE1_ptr1__intE1__ret_voidE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB4256:
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
.LB4230:
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
.LB4292:
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
.LB4297:
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
	subq $48, %rsp
.LB4304:
	testb %cl, %cl
	jne .LB4307
.LB4308:
	movl $1936482630, -6(%rbp)
	movw $101, -2(%rbp)
	leaq -6(%rbp), %rcx
	callq standard__io__console__print__1__byteE1_arr__ret_voidE1
	leave
	ret
.LB4307:
	movl $1702195796, -11(%rbp)
	movb $0, -7(%rbp)
	leaq -11(%rbp), %rcx
	callq standard__io__console__print__1__byteE1_arr__ret_voidE1
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
.LB4336:
	movb %cl, -2(%rbp)
	movb $0, -1(%rbp)
	leaq -2(%rbp), %rcx
	callq standard__io__console__print__1__byteE1_arr__ret_voidE1
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
.LB4328:
	movb %cl, -2(%rbp)
	movb $0, -1(%rbp)
	leaq -2(%rbp), %rcx
	callq standard__io__console__print__1__byteE1_arr__ret_voidE1
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
	subq $32, %rsp
.LB4325:
	movzbl %cl, %ecx
	callq standard__io__console__print__1__byteE1__ret_voidE1
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
.LB4351:
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -21(%rbp)
	movl .LZERO+16(%rip), %r10d
	movl %r10d, -5(%rbp)
	movb .LZERO+20(%rip), %r10b
	movb %r10b, -1(%rbp)
	leaq -21(%rbp), %rdx
	movzwl %cx, %ecx
	callq standard__strings__i16str__2__dataE1_sbits16__byteE1_ptr1__ret_dataE1_sbits16
	leaq -21(%rbp), %rcx
	callq standard__io__console__print__1__byteE1_arr__ret_voidE1
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
.LB4358:
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -21(%rbp)
	movl .LZERO+16(%rip), %r10d
	movl %r10d, -5(%rbp)
	movb .LZERO+20(%rip), %r10b
	movb %r10b, -1(%rbp)
	leaq -21(%rbp), %rdx
	movzwl %cx, %ecx
	callq standard__strings__u16str__2__dataE1_ubits16__byteE1_ptr1__ret_dataE1_ubits16
	leaq -21(%rbp), %rcx
	callq standard__io__console__print__1__byteE1_arr__ret_voidE1
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
.LB4344:
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -21(%rbp)
	movl .LZERO+16(%rip), %r10d
	movl %r10d, -5(%rbp)
	movb .LZERO+20(%rip), %r10b
	movb %r10b, -1(%rbp)
	leaq -21(%rbp), %rdx
	callq standard__strings__i32str__2__dataE1_sbits32__byteE1_ptr1__ret_dataE1_sbits32
	leaq -21(%rbp), %rcx
	callq standard__io__console__print__1__byteE1_arr__ret_voidE1
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
.LB4365:
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -21(%rbp)
	movl .LZERO+16(%rip), %r10d
	movl %r10d, -5(%rbp)
	movb .LZERO+20(%rip), %r10b
	movb %r10b, -1(%rbp)
	leaq -21(%rbp), %rdx
	callq standard__strings__i32str__2__dataE1_sbits32__byteE1_ptr1__ret_dataE1_sbits32
	leaq -21(%rbp), %rcx
	callq standard__io__console__print__1__byteE1_arr__ret_voidE1
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
.LB4372:
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -21(%rbp)
	movl .LZERO+16(%rip), %r10d
	movl %r10d, -5(%rbp)
	movb .LZERO+20(%rip), %r10b
	movb %r10b, -1(%rbp)
	leaq -21(%rbp), %rdx
	callq standard__strings__u32str__2__dataE1_ubits32__byteE1_ptr1__ret_dataE1_ubits32
	leaq -21(%rbp), %rcx
	callq standard__io__console__print__1__byteE1_arr__ret_voidE1
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
.LB4379:
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -21(%rbp)
	movl .LZERO+16(%rip), %r10d
	movl %r10d, -5(%rbp)
	movb .LZERO+20(%rip), %r10b
	movb %r10b, -1(%rbp)
	leaq -21(%rbp), %rdx
	callq standard__strings__i64str__2__dataE1_sbits64__byteE1_ptr1__ret_dataE1_sbits64
	leaq -21(%rbp), %rcx
	callq standard__io__console__print__1__byteE1_arr__ret_voidE1
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
.LB4386:
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -21(%rbp)
	movl .LZERO+16(%rip), %r10d
	movl %r10d, -5(%rbp)
	movb .LZERO+20(%rip), %r10b
	movb %r10b, -1(%rbp)
	leaq -21(%rbp), %rdx
	callq standard__strings__u64str__2__dataE1_ubits64__byteE1_ptr1__ret_dataE1_ubits64
	leaq -21(%rbp), %rcx
	callq standard__io__console__print__1__byteE1_arr__ret_voidE1
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
	subq $32, %rsp
.LB4393:
	callq standard__io__console__print__1__dataE1_sbits64__ret_voidE1
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
	subq $32, %rsp
.LB4396:
	callq standard__io__console__print__1__dataE1_ubits64__ret_voidE1
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
	movq %rdi, -8(%rbp)
.LB4399:
	leaq -264(%rbp), %rax
	movq %rax, %rdi
	xorl %eax, %eax
	movl $256, %ecx
	rep stosb
	leaq -264(%rbp), %rdx
	movl $5, %r8d
	callq standard__strings__float2str__3__floatE1__byteE1_ptr1__dataE1_sbits32__ret_dataE1_sbits32
	leaq -264(%rbp), %rcx
	callq standard__io__console__print__1__byteE1_arr__ret_voidE1
	movq -8(%rbp), %rdi
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
	movq %rdi, -8(%rbp)
.LB4407:
	leaq -264(%rbp), %rax
	movq %rax, %rdi
	xorl %eax, %eax
	movl $256, %ecx
	rep stosb
	movl $5, %eax
	cmpl $5, %edx
	movl %edx, %r8d
	cmovg %eax, %r8d
	leaq -264(%rbp), %rdx
	callq standard__strings__float2str__3__floatE1__byteE1_ptr1__dataE1_sbits32__ret_dataE1_sbits32
	leaq -264(%rbp), %rcx
	callq standard__io__console__print__1__byteE1_arr__ret_voidE1
	movq -8(%rbp), %rdi
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
	movq %rdi, -8(%rbp)
.LB4422:
	leaq -264(%rbp), %rax
	movq %rax, %rdi
	xorl %eax, %eax
	movl $256, %ecx
	rep stosb
	leaq -264(%rbp), %rdx
	movl $14, %r8d
	callq standard__strings__dbl2str__3__doubleE1__byteE1_ptr1__dataE1_sbits32__ret_dataE1_sbits32
	leaq -264(%rbp), %rcx
	callq standard__io__console__print__1__byteE1_arr__ret_voidE1
	movq -8(%rbp), %rdi
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
	movq %rdi, -8(%rbp)
.LB4430:
	leaq -264(%rbp), %rax
	movq %rax, %rdi
	xorl %eax, %eax
	movl $256, %ecx
	rep stosb
	movl $14, %eax
	cmpl $14, %edx
	movl %edx, %r8d
	cmovg %eax, %r8d
	leaq -264(%rbp), %rdx
	callq standard__strings__dbl2str__3__doubleE1__byteE1_ptr1__dataE1_sbits32__ret_dataE1_sbits32
	leaq -264(%rbp), %rcx
	callq standard__io__console__print__1__byteE1_arr__ret_voidE1
	movq -8(%rbp), %rdi
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
	subq $32, %rsp
.LB4235:
	callq standard__io__console__win_print__2__byteE1_ptr1__intE1__ret_voidE1
	leave
	ret
	.text
	.globl standard__io__file__read_file__3__byteE1_ptr1__byteE1_arr__intE1__ret_intE1
	.def standard__io__file__read_file__3__byteE1_ptr1__byteE1_arr__intE1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__io__file__read_file__3__byteE1_ptr1__byteE1_arr__intE1__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $80, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
.LB4445:
	movq %rdx, %rsi
	leaq -35(%rbp), %rdx
	movl %r8d, %edi
	movw $25202, -35(%rbp)
	movb $0, -33(%rbp)
	callq fopen
	movq %rax, %rbx
	testq %rbx, %rbx
	je .LB4461
.LB4462:
	movq %rbx, %rcx
	xorl %edx, %edx
	movl $2, %r8d
	callq fseek
	movq %rbx, %rcx
	callq ftell
	movl %eax, %r12d
	movq %rbx, %rcx
	callq rewind
	cmpl %edi, %r12d
	movl %r12d, %r8d
	cmovg %edi, %r8d
	movq %rsi, %rcx
	movl $1, %edx
	movq %rbx, %r9
	callq fread
	movl %eax, %esi
	movq %rbx, %rcx
	callq fclose
	movl %esi, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB4461:
	movabsq $4294967295, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
	.text
	.globl standard__strings__string.__init__1__byteE1_ptr1__ret_thisE1
	.def standard__strings__string.__init__1__byteE1_ptr1__ret_thisE1;
	.scl 2;
	.type 32;
	.endef
standard__strings__string.__init__1__byteE1_ptr1__ret_thisE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
.LB4488:
	movq %rcx, %rsi
	movq %rdx, %rcx
	movq %rcx, (%rsi)
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, 16(%rsi)
	movq %rsi, %rax
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl standard__strings__string.__init__2__byteE1_ptr1__intE1__ret_thisE1
	.def standard__strings__string.__init__2__byteE1_ptr1__intE1__ret_thisE1;
	.scl 2;
	.type 32;
	.endef
standard__strings__string.__init__2__byteE1_ptr1__intE1__ret_thisE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
.LB4495:
	movq %rcx, %rsi
	movq %rdx, (%rsi)
	movl %r8d, 16(%rsi)
	movq %rsi, %rcx
	movl $10, %edx
	callq standard__strings__string.split__1__charE1__ret_byteE1_ptr2
	movq %rax, 8(%rsi)
	movq %rsi, %rcx
	callq standard__strings__string.count_lines__0__ret_intE1
	movl %eax, 20(%rsi)
	movq %rsi, %rax
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl standard__strings__string.__exit__0__ret_voidE1
	.def standard__strings__string.__exit__0__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__strings__string.__exit__0__ret_voidE1:
.LB4506:
	ret
	.text
	.globl standard__strings__string.__expr__0__ret_byteE1_ptr1
	.def standard__strings__string.__expr__0__ret_byteE1_ptr1;
	.scl 2;
	.type 32;
	.endef
standard__strings__string.__expr__0__ret_byteE1_ptr1:
.LB4507:
	movq (%rcx), %rax
	ret
	.text
	.globl standard__strings__string.val__0__ret_byteE1_ptr1
	.def standard__strings__string.val__0__ret_byteE1_ptr1;
	.scl 2;
	.type 32;
	.endef
standard__strings__string.val__0__ret_byteE1_ptr1:
.LB4510:
	movq (%rcx), %rax
	ret
	.text
	.globl standard__strings__string.len__0__ret_intE1
	.def standard__strings__string.len__0__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__strings__string.len__0__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB4513:
	movq (%rcx), %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	leave
	ret
	.text
	.globl standard__strings__string.set__1__byteE1_ptr1__ret_boolE1
	.def standard__strings__string.set__1__byteE1_ptr1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__strings__string.set__1__byteE1_ptr1__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
.LB4517:
	movq %rcx, %rsi
	movq %rdx, %rcx
	movq %rcx, (%rsi)
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, 16(%rsi)
	movl $1, %eax
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl standard__strings__string.clear__0__ret_voidE1
	.def standard__strings__string.clear__0__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__strings__string.clear__0__ret_voidE1:
.LB4532:
	movq (%rcx), %rax
	movb $0, (%rax)
	movl $0, 16(%rcx)
	ret
	.text
	.globl standard__strings__string.isempty__0__ret_boolE1
	.def standard__strings__string.isempty__0__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__strings__string.isempty__0__ret_boolE1:
.LB4539:
	xorl %eax, %eax
	cmpl $0, 16(%rcx)
	sete %al
	ret
	.text
	.globl standard__strings__string.equals__1__byteE1_ptr1__ret_boolE1
	.def standard__strings__string.equals__1__byteE1_ptr1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__strings__string.equals__1__byteE1_ptr1__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB4543:
	movq %rdx, %rax
	movq (%rcx), %rdx
	movq %rax, %rcx
	callq strcmp
	xorl %ecx, %ecx
	testl %eax, %eax
	sete %cl
	movl %ecx, %eax
	leave
	ret
	.text
	.globl standard__strings__string.compare__1__byteE1_ptr1__ret_intE1
	.def standard__strings__string.compare__1__byteE1_ptr1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__strings__string.compare__1__byteE1_ptr1__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB4550:
	movq (%rcx), %rcx
	callq strcmp
	leave
	ret
	.text
	.globl standard__strings__string.icompare__1__byteE1_ptr1__ret_intE1
	.def standard__strings__string.icompare__1__byteE1_ptr1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__strings__string.icompare__1__byteE1_ptr1__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB4556:
	movq (%rcx), %rcx
	callq standard__strings__helpers__compare_ignore_case__2__byteE1_ptr1__byteE1_ptr1__ret_intE1
	leave
	ret
	.text
	.globl standard__strings__string.contains__1__byteE1_ptr1__ret_boolE1
	.def standard__strings__string.contains__1__byteE1_ptr1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__strings__string.contains__1__byteE1_ptr1__ret_boolE1:
	subq $32, %rsp
	movq %rbx, 16(%rsp)
	movq %rsi, 8(%rsp)
	movq %rdi, 0(%rsp)
	movq %r12, -8(%rsp)
.LB4562:
	movq (%rcx), %rax
	xorl %ecx, %ecx
.LB4570:
	movslq %ecx, %rsi
	cmpb $0, (%rax,%rsi,1)
	je .LB4568
.LB4571:
	xorl %esi, %esi
	movq %rcx, %rdi
.LB4572:
	movslq %esi, %r8
	movzbl (%rdx,%r8,1), %r8d
	testb %r8b, %r8b
	je .LB4567
.LB4573:
	movslq %edi, %r9
	movzbl (%rax,%r9,1), %r9d
	xorl %ebx, %ebx
	testb %r9b, %r9b
	sete %bl
	xorl %r12d, %r12d
	cmpb %r8b, %r9b
	setne %r12b
	orl %r12d, %ebx
	incl %esi
	incl %edi
	testb %bl, %bl
	jne .LB4574
.LB31948:
	jmp .LB4572
.LB4574:
	incl %ecx
	jmp .LB4570
.LB4567:
	movl $1, %eax
	movq 16(%rsp), %rbx
	movq 8(%rsp), %rsi
	movq 0(%rsp), %rdi
	movq -8(%rsp), %r12
	addq $32, %rsp
	ret
.LB4568:
	xorl %eax, %eax
	movq 16(%rsp), %rbx
	movq 8(%rsp), %rsi
	movq 0(%rsp), %rdi
	movq -8(%rsp), %r12
	addq $32, %rsp
	ret
	.text
	.globl standard__strings__string.startswith__1__byteE1_ptr1__ret_boolE1
	.def standard__strings__string.startswith__1__byteE1_ptr1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__strings__string.startswith__1__byteE1_ptr1__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB4601:
	movq (%rcx), %rcx
	callq standard__strings__helpers__starts_with__2__byteE1_ptr1__byteE1_ptr1__ret_boolE1
	movzbl %al, %eax
	leave
	ret
	.text
	.globl standard__strings__string.endswith__1__byteE1_ptr1__ret_boolE1
	.def standard__strings__string.endswith__1__byteE1_ptr1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__strings__string.endswith__1__byteE1_ptr1__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB4607:
	movq (%rcx), %rcx
	callq standard__strings__helpers__ends_with__2__byteE1_ptr1__byteE1_ptr1__ret_boolE1
	movzbl %al, %eax
	leave
	ret
	.text
	.globl standard__strings__string.indexof__1__byteE1_ptr1__ret_intE1
	.def standard__strings__string.indexof__1__byteE1_ptr1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__strings__string.indexof__1__byteE1_ptr1__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB4613:
	movq (%rcx), %rcx
	xorl %r8d, %r8d
	callq standard__strings__helpers__find_substring__3__byteE1_ptr1__byteE1_ptr1__intE1__ret_intE1
	leave
	ret
	.text
	.globl standard__strings__string.lastindexof__1__byteE1_ptr1__ret_intE1
	.def standard__strings__string.lastindexof__1__byteE1_ptr1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__strings__string.lastindexof__1__byteE1_ptr1__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB4619:
	movq (%rcx), %rcx
	callq find_last_substring__2__byteE1_ptr1__byteE1_ptr1__ret_intE1
	leave
	ret
	.text
	.globl standard__strings__string.indexof_char__1__charE1__ret_intE1
	.def standard__strings__string.indexof_char__1__charE1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__strings__string.indexof_char__1__charE1__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB4625:
	movq (%rcx), %rcx
	movzbl %dl, %edx
	xorl %r8d, %r8d
	callq standard__strings__helpers__find_char__3__byteE1_ptr1__charE1__intE1__ret_intE1
	leave
	ret
	.text
	.globl standard__strings__string.lastindexof_char__1__charE1__ret_intE1
	.def standard__strings__string.lastindexof_char__1__charE1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__strings__string.lastindexof_char__1__charE1__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB4631:
	movq (%rcx), %rcx
	movzbl %dl, %edx
	callq find_last_char__2__byteE1_ptr1__charE1__ret_intE1
	leave
	ret
	.text
	.globl standard__strings__string.count_occurrences__1__byteE1_ptr1__ret_intE1
	.def standard__strings__string.count_occurrences__1__byteE1_ptr1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__strings__string.count_occurrences__1__byteE1_ptr1__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB4637:
	movq (%rcx), %rcx
	callq count_substring__2__byteE1_ptr1__byteE1_ptr1__ret_intE1
	leave
	ret
	.text
	.globl standard__strings__string.count_spaces__0__ret_intE1
	.def standard__strings__string.count_spaces__0__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__strings__string.count_spaces__0__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
.LB4643:
	movw $32, -2(%rbp)
	leaq -2(%rbp), %rdx
	callq standard__strings__string.count_occurrences__1__byteE1_ptr1__ret_intE1
	leave
	ret
	.text
	.globl standard__strings__string.count_lines__0__ret_intE1
	.def standard__strings__string.count_lines__0__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__strings__string.count_lines__0__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
.LB4649:
	movw $10, -2(%rbp)
	leaq -2(%rbp), %rdx
	callq standard__strings__string.count_occurrences__1__byteE1_ptr1__ret_intE1
	leave
	ret
	.text
	.globl standard__strings__string.charat__1__intE1__ret_charE1
	.def standard__strings__string.charat__1__intE1__ret_charE1;
	.scl 2;
	.type 32;
	.endef
standard__strings__string.charat__1__intE1__ret_charE1:
.LB4655:
	testl %edx, %edx
	js .LB4666
.LB4659:
	cmpl 16(%rcx), %edx
	jge .LB4666
.LB4667:
	movq (%rcx), %rax
	movslq %edx, %rcx
	movzbl (%rax,%rcx,1), %eax
	ret
.LB4666:
	xorl %eax, %eax
	ret
	.text
	.globl standard__strings__string.setat__2__intE1__charE1__ret_boolE1
	.def standard__strings__string.setat__2__intE1__charE1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__strings__string.setat__2__intE1__charE1__ret_boolE1:
.LB4675:
	testl %edx, %edx
	js .LB4687
.LB4680:
	cmpl 16(%rcx), %edx
	jge .LB4687
.LB4688:
	movq (%rcx), %rax
	movslq %edx, %rcx
	movb %r8b, (%rax,%rcx,1)
	movl $1, %eax
	ret
.LB4687:
	xorl %eax, %eax
	ret
	.text
	.globl standard__strings__string.substring__2__intE1__intE1__ret_byteE1_ptr1
	.def standard__strings__string.substring__2__intE1__intE1__ret_byteE1_ptr1;
	.scl 2;
	.type 32;
	.endef
standard__strings__string.substring__2__intE1__intE1__ret_byteE1_ptr1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB4696:
	testl %edx, %edx
	js .LB4708
.LB4701:
	cmpl 16(%rcx), %edx
	jge .LB4708
.LB4709:
	testl %r8d, %r8d
	js .LB4724
.LB4715:
	leal (%rdx,%r8), %eax
	cmpl 16(%rcx), %eax
	jg .LB4724
.LB4725:
.LB4726:
	movq (%rcx), %rax
	movslq %edx, %rcx
	leaq (%rax,%rcx,1), %rcx
	movq %r8, %rdx
	callq standard__strings__manip__copy_n__2__byteE1_ptr1__intE1__ret_byteE1_ptr1
	leave
	ret
.LB4724:
	movl 16(%rcx), %eax
	movl %eax, %r8d
	subl %edx, %r8d
	jmp .LB4726
.LB4708:
	xorl %eax, %eax
	leave
	ret
	.text
	.globl standard__strings__string.left__1__intE1__ret_byteE1_ptr1
	.def standard__strings__string.left__1__intE1__ret_byteE1_ptr1;
	.scl 2;
	.type 32;
	.endef
standard__strings__string.left__1__intE1__ret_byteE1_ptr1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB4737:
	testl %edx, %edx
	js .LB4741
.LB4742:
	movl 16(%rcx), %eax
	movq (%rcx), %rcx
	cmpl %eax, %edx
	cmovg %eax, %edx
	callq standard__strings__manip__copy_n__2__byteE1_ptr1__intE1__ret_byteE1_ptr1
	leave
	ret
.LB4741:
	xorl %eax, %eax
	leave
	ret
	.text
	.globl standard__strings__string.right__1__intE1__ret_byteE1_ptr1
	.def standard__strings__string.right__1__intE1__ret_byteE1_ptr1;
	.scl 2;
	.type 32;
	.endef
standard__strings__string.right__1__intE1__ret_byteE1_ptr1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB4759:
	testl %edx, %edx
	js .LB4763
.LB4764:
	movl 16(%rcx), %eax
	movq (%rcx), %rcx
	cmpl %eax, %edx
	cmovg %eax, %edx
	subl %edx, %eax
	movslq %eax, %rax
	leaq (%rcx,%rax,1), %rcx
	callq standard__strings__manip__copy_n__2__byteE1_ptr1__intE1__ret_byteE1_ptr1
	leave
	ret
.LB4763:
	xorl %eax, %eax
	leave
	ret
	.text
	.globl standard__strings__string.concat__1__byteE1_ptr1__ret_byteE1_ptr1
	.def standard__strings__string.concat__1__byteE1_ptr1__ret_byteE1_ptr1;
	.scl 2;
	.type 32;
	.endef
standard__strings__string.concat__1__byteE1_ptr1__ret_byteE1_ptr1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB4786:
	movq (%rcx), %rcx
	callq standard__strings__manip__concat__2__byteE1_ptr1__byteE1_ptr1__ret_byteE1_ptr1
	leave
	ret
	.text
	.globl standard__strings__string.append__1__byteE1_ptr1__ret_boolE1
	.def standard__strings__string.append__1__byteE1_ptr1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__strings__string.append__1__byteE1_ptr1__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
.LB4792:
	movq %rcx, %rsi
	movq (%rsi), %rcx
	callq standard__strings__manip__concat__2__byteE1_ptr1__byteE1_ptr1__ret_byteE1_ptr1
	testq %rax, %rax
	je .LB4809
.LB4810:
	movq %rax, (%rsi)
	movq %rax, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, 16(%rsi)
	movl $1, %eax
	movq -8(%rbp), %rsi
	leave
	ret
.LB4809:
	xorl %eax, %eax
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl standard__strings__string.prepend__1__byteE1_ptr1__ret_boolE1
	.def standard__strings__string.prepend__1__byteE1_ptr1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__strings__string.prepend__1__byteE1_ptr1__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
.LB4819:
	movq %rcx, %rsi
	movq %rdx, %rcx
	movq (%rsi), %rdx
	callq standard__strings__manip__concat__2__byteE1_ptr1__byteE1_ptr1__ret_byteE1_ptr1
	testq %rax, %rax
	je .LB4836
.LB4837:
	movq %rax, (%rsi)
	movq %rax, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, 16(%rsi)
	movl $1, %eax
	movq -8(%rbp), %rsi
	leave
	ret
.LB4836:
	xorl %eax, %eax
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl standard__strings__string.replace__2__byteE1_ptr1__byteE1_ptr1__ret_byteE1_ptr1
	.def standard__strings__string.replace__2__byteE1_ptr1__byteE1_ptr1__ret_byteE1_ptr1;
	.scl 2;
	.type 32;
	.endef
standard__strings__string.replace__2__byteE1_ptr1__byteE1_ptr1__ret_byteE1_ptr1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB4846:
	movq (%rcx), %rcx
	callq standard__strings__replace_first__3__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__ret_byteE1_ptr1
	leave
	ret
	.text
	.globl standard__strings__string.replace_all__2__byteE1_ptr1__byteE1_ptr1__ret_byteE1_ptr1
	.def standard__strings__string.replace_all__2__byteE1_ptr1__byteE1_ptr1__ret_byteE1_ptr1;
	.scl 2;
	.type 32;
	.endef
standard__strings__string.replace_all__2__byteE1_ptr1__byteE1_ptr1__ret_byteE1_ptr1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
.LB4854:
	movq %rdx, %rsi
	movq %r8, %rdi
	movq (%rcx), %rcx
	callq standard__strings__manip__copy_string__1__byteE1_ptr1__ret_byteE1_ptr1
	movq %rax, %rbx
	testq %rbx, %rbx
	je .LB4867
.LB4868:
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	testl %eax, %eax
	je .LB4877
.LB4878:
.LB4881:
	movq %rbx, %rcx
	movq %rsi, %rdx
	xorl %r8d, %r8d
	callq standard__strings__helpers__find_substring__3__byteE1_ptr1__byteE1_ptr1__intE1__ret_intE1
	cmpl $4294967295, %eax
	je .LB4890
.LB4891:
	movq %rbx, %rcx
	movq %rsi, %rdx
	movq %rdi, %r8
	callq standard__strings__replace_first__3__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__ret_byteE1_ptr1
	movq %rax, %r12
	movq %rbx, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	testq %r12, %r12
	je .LB4904
.LB4905:
	movq %r12, %rbx
	jmp .LB4881
.LB4904:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB4890:
	movq %rbx, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB4877:
	movq %rbx, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB4867:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
	.text
	.globl standard__strings__string.replace_char__2__charE1__charE1__ret_boolE1
	.def standard__strings__string.replace_char__2__charE1__charE1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__strings__string.replace_char__2__charE1__charE1__ret_boolE1:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
	movq %rdi, -8(%rsp)
.LB4910:
	xorl %eax, %eax
.LB4913:
	cmpl 16(%rcx), %eax
	jge .LB4916
.LB4914:
	movq (%rcx), %rsi
	movslq %eax, %rdi
	leaq (%rsi,%rdi,1), %rsi
	movzbl (%rsi), %edi
	cmpb %dl, %dil
	je .LB4929
.LB4931:
	incl %eax
	cmpl 16(%rcx), %eax
	jl .LB4914
.LB4916:
	movl $1, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB4929:
	movb %r8b, (%rsi)
	jmp .LB4931
	.text
	.globl standard__strings__string.insert__2__intE1__byteE1_ptr1__ret_boolE1
	.def standard__strings__string.insert__2__intE1__byteE1_ptr1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__strings__string.insert__2__intE1__byteE1_ptr1__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
.LB4940:
	movq %rcx, %rsi
	movl %edx, %edi
	movq %r8, %rbx
	testl %edi, %edi
	js .LB4952
.LB4945:
	cmpl 16(%rsi), %edi
	jg .LB4952
.LB4953:
	movq (%rsi), %rcx
	movq %rdi, %rdx
	callq standard__strings__manip__copy_n__2__byteE1_ptr1__intE1__ret_byteE1_ptr1
	movq %rax, %r12
	movq (%rsi), %rax
	movslq %edi, %rcx
	leaq (%rax,%rcx,1), %rcx
	callq standard__strings__manip__copy_string__1__byteE1_ptr1__ret_byteE1_ptr1
	movq %rax, %rdi
	testq %r12, %r12
	je .LB4977
.LB4970:
	testq %rdi, %rdi
	je .LB4977
.LB4978:
	movq %r12, %rcx
	movq %rbx, %rdx
	callq standard__strings__manip__concat__2__byteE1_ptr1__byteE1_ptr1__ret_byteE1_ptr1
	movq %rax, %rbx
	movq %r12, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	testq %rbx, %rbx
	je .LB5008
.LB5009:
	movq %rbx, %rcx
	movq %rdi, %rdx
	callq standard__strings__manip__concat__2__byteE1_ptr1__byteE1_ptr1__ret_byteE1_ptr1
	movq %rax, %r12
	movq %rbx, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movq %rdi, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	testq %r12, %r12
	je .LB5025
.LB5026:
	movq %r12, (%rsi)
	movq %r12, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, 16(%rsi)
	movl $1, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB5025:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB5008:
	movq %rdi, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB4977:
	testq %r12, %r12
	jne .LB4984
.LB4986:
	testq %rdi, %rdi
	jne .LB4993
.LB4994:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB4984:
	movq %r12, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	jmp .LB4986
.LB4993:
	movq %rdi, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB4952:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
	.text
	.globl standard__strings__string.remove__2__intE1__intE1__ret_boolE1
	.def standard__strings__string.remove__2__intE1__intE1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__strings__string.remove__2__intE1__intE1__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
.LB5033:
	movq %rcx, %rsi
	movl %edx, %edi
	testl %edi, %edi
	js .LB5045
.LB5038:
	movl 16(%rsi), %eax
	cmpl %eax, %edi
	jge .LB5045
.LB5046:
	testl %r8d, %r8d
	js .LB5050
.LB5051:
	leal (%rdi,%r8), %ecx
	movl %eax, %edx
	subl %edi, %edx
	cmpl %eax, %ecx
	movq (%rsi), %rcx
	movl %r8d, %ebx
	cmovg %edx, %ebx
	movq %rdi, %rdx
	callq standard__strings__manip__copy_n__2__byteE1_ptr1__intE1__ret_byteE1_ptr1
	movq %rax, %r12
	movq (%rsi), %rax
	movslq %edi, %rcx
	movslq %ebx, %rdx
	leaq (%rax,%rcx,1), %rax
	leaq (%rax,%rdx,1), %rcx
	callq standard__strings__manip__copy_string__1__byteE1_ptr1__ret_byteE1_ptr1
	movq %rax, %rdi
	testq %r12, %r12
	je .LB5090
.LB5083:
	testq %rdi, %rdi
	je .LB5090
.LB5091:
	movq %r12, %rcx
	movq %rdi, %rdx
	callq standard__strings__manip__concat__2__byteE1_ptr1__byteE1_ptr1__ret_byteE1_ptr1
	movq %rax, %rbx
	movq %r12, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movq %rdi, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	testq %rbx, %rbx
	je .LB5123
.LB5124:
	movq %rbx, (%rsi)
	movq %rbx, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, 16(%rsi)
	movl $1, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB5123:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB5090:
	testq %r12, %r12
	jne .LB5097
.LB5099:
	testq %rdi, %rdi
	jne .LB5106
.LB5107:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB5097:
	movq %r12, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	jmp .LB5099
.LB5106:
	movq %rdi, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB5050:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB5045:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
	.text
	.globl standard__strings__string.toupper__0__ret_boolE1
	.def standard__strings__string.toupper__0__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__strings__string.toupper__0__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
.LB5131:
	movq %rcx, %rsi
	xorl %edi, %edi
.LB5132:
	cmpl 16(%rsi), %edi
	jge .LB5135
.LB5133:
	movq (%rsi), %rax
	movslq %edi, %rbx
	movzbl (%rax,%rbx,1), %eax
	movzbl %al, %ecx
	callq standard__strings__helpers__to_upper__1__charE1__ret_charE1
	movzbl %al, %eax
	movq (%rsi), %rcx
	movb %al, (%rcx,%rbx,1)
	incl %edi
	cmpl 16(%rsi), %edi
	jl .LB5133
.LB5135:
	movl $1, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__strings__string.tolower__0__ret_boolE1
	.def standard__strings__string.tolower__0__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__strings__string.tolower__0__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
.LB5154:
	movq %rcx, %rsi
	xorl %edi, %edi
.LB5155:
	cmpl 16(%rsi), %edi
	jge .LB5158
.LB5156:
	movq (%rsi), %rax
	movslq %edi, %rbx
	movzbl (%rax,%rbx,1), %eax
	movzbl %al, %ecx
	callq standard__strings__helpers__to_lower__1__charE1__ret_charE1
	movzbl %al, %eax
	movq (%rsi), %rcx
	movb %al, (%rcx,%rbx,1)
	incl %edi
	cmpl 16(%rsi), %edi
	jl .LB5156
.LB5158:
	movl $1, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__strings__string.totitle__0__ret_boolE1
	.def standard__strings__string.totitle__0__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__strings__string.totitle__0__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $80, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
.LB5177:
	movq %rcx, %rsi
	movl $1, %edi
	xorl %ebx, %ebx
.LB5180:
	cmpl 16(%rsi), %ebx
	jge .LB5183
.LB5181:
	movq (%rsi), %rax
	movslq %ebx, %r12
	movzbl (%rax,%r12,1), %r13d
	movzbl %r13b, %ecx
	callq standard__strings__helpers__is_whitespace__1__charE1__ret_boolE1
	testb %al, %al
	jne .LB5196
.LB5197:
	testb %dil, %dil
	jne .LB5200
.LB5201:
	movzbl %r13b, %ecx
	callq standard__strings__helpers__to_lower__1__charE1__ret_charE1
	movzbl %al, %eax
	movq (%rsi), %rcx
	movb %al, (%rcx,%r12,1)
.LB5198:
	incl %ebx
	cmpl 16(%rsi), %ebx
	jl .LB5181
.LB5183:
	movl $1, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB5200:
	movzbl %r13b, %ecx
	callq standard__strings__helpers__to_upper__1__charE1__ret_charE1
	movzbl %al, %eax
	movq (%rsi), %rcx
	movslq %ebx, %rdx
	movb %al, (%rcx,%rdx,1)
	xorl %edi, %edi
	jmp .LB5198
.LB5196:
	movl $1, %edi
	jmp .LB5198
	.text
	.globl standard__strings__string.trim__0__ret_boolE1
	.def standard__strings__string.trim__0__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__strings__string.trim__0__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
.LB5218:
	movq %rcx, %rsi
	xorl %edi, %edi
.LB5222:
	cmpl 16(%rsi), %edi
	jge .LB5224
.LB5229:
	movq (%rsi), %rax
	movslq %edi, %rcx
	movzbl (%rax,%rcx,1), %eax
	movzbl %al, %ecx
	callq standard__strings__helpers__is_whitespace__1__charE1__ret_boolE1
	testb %al, %al
	je .LB5224
.LB5223:
	incl %edi
	cmpl 16(%rsi), %edi
	jl .LB5229
.LB5224:
	movl 16(%rsi), %eax
	leal -1(%rax), %ebx
.LB5243:
	cmpl %edi, %ebx
	jl .LB5245
.LB5249:
	movq (%rsi), %rax
	movslq %ebx, %rcx
	movzbl (%rax,%rcx,1), %eax
	movzbl %al, %ecx
	callq standard__strings__helpers__is_whitespace__1__charE1__ret_boolE1
	testb %al, %al
	je .LB5245
.LB5244:
	decl %ebx
	cmpl %edi, %ebx
	jge .LB5249
.LB5245:
	subl %edi, %ebx
	incl %ebx
	testl %ebx, %ebx
	jle .LB5266
.LB5267:
	movq (%rsi), %rax
	movslq %edi, %rcx
	leaq (%rax,%rcx,1), %rcx
	movq %rbx, %rdx
	callq standard__strings__manip__copy_n__2__byteE1_ptr1__intE1__ret_byteE1_ptr1
	testq %rax, %rax
	je .LB5280
.LB5281:
	movq %rax, (%rsi)
	movl %ebx, 16(%rsi)
	movl $1, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB5280:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB5266:
	movq %rsi, %rcx
	callq standard__strings__string.clear__0__ret_voidE1
	movl $1, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__strings__string.trimstart__0__ret_boolE1
	.def standard__strings__string.trimstart__0__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__strings__string.trimstart__0__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB5287:
	movq %rcx, %rsi
	xorl %edi, %edi
.LB5289:
	cmpl 16(%rsi), %edi
	jge .LB5291
.LB5296:
	movq (%rsi), %rax
	movslq %edi, %rcx
	movzbl (%rax,%rcx,1), %eax
	movzbl %al, %ecx
	callq standard__strings__helpers__is_whitespace__1__charE1__ret_boolE1
	testb %al, %al
	je .LB5291
.LB5290:
	incl %edi
	cmpl 16(%rsi), %edi
	jl .LB5296
.LB5291:
	testl %edi, %edi
	je .LB5309
.LB5310:
	movq (%rsi), %rax
	movslq %edi, %rcx
	leaq (%rax,%rcx,1), %rcx
	callq standard__strings__manip__copy_string__1__byteE1_ptr1__ret_byteE1_ptr1
	testq %rax, %rax
	je .LB5322
.LB5323:
	movq %rax, (%rsi)
	movq %rax, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, 16(%rsi)
	movl $1, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB5322:
	xorl %eax, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB5309:
	movl $1, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__strings__string.trimend__0__ret_boolE1
	.def standard__strings__string.trimend__0__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__strings__string.trimend__0__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB5330:
	movq %rcx, %rsi
	movl 16(%rsi), %eax
	leal -1(%rax), %edi
.LB5335:
	testl %edi, %edi
	js .LB5337
.LB5340:
	movq (%rsi), %rax
	movslq %edi, %rcx
	movzbl (%rax,%rcx,1), %eax
	movzbl %al, %ecx
	callq standard__strings__helpers__is_whitespace__1__charE1__ret_boolE1
	testb %al, %al
	je .LB5337
.LB5336:
	decl %edi
	jns .LB5340
.LB5337:
	movl 16(%rsi), %eax
	decl %eax
	cmpl %eax, %edi
	je .LB5356
.LB5357:
	movq (%rsi), %rax
	incl %edi
	movslq %edi, %rcx
	movb $0, (%rax,%rcx,1)
	movl %edi, 16(%rsi)
	movl $1, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB5356:
	movl $1, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__strings__string.trim_char__1__charE1__ret_boolE1
	.def standard__strings__string.trim_char__1__charE1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__strings__string.trim_char__1__charE1__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
.LB5369:
	movq %rcx, %rsi
	movl 16(%rsi), %eax
	movq (%rsi), %rcx
	xorl %edi, %edi
.LB5374:
	cmpl %eax, %edi
	jge .LB5376
.LB5381:
	movslq %edi, %r8
	movzbl (%rcx,%r8,1), %r8d
	cmpb %dl, %r8b
	jne .LB5376
.LB5375:
	incl %edi
	cmpl %eax, %edi
	jl .LB5381
.LB5376:
	movl 16(%rsi), %eax
	movq (%rsi), %rcx
	decl %eax
.LB5396:
	cmpl %edi, %eax
	jl .LB5398
.LB5402:
	movslq %eax, %r8
	movzbl (%rcx,%r8,1), %r8d
	cmpb %dl, %r8b
	jne .LB5398
.LB5397:
	decl %eax
	cmpl %edi, %eax
	jge .LB5402
.LB5398:
	subl %edi, %eax
	leal 1(%rax), %ebx
	testl %ebx, %ebx
	jle .LB5420
.LB5421:
	movq (%rsi), %rax
	movslq %edi, %rcx
	leaq (%rax,%rcx,1), %rcx
	movq %rbx, %rdx
	callq standard__strings__manip__copy_n__2__byteE1_ptr1__intE1__ret_byteE1_ptr1
	testq %rax, %rax
	je .LB5434
.LB5435:
	movq %rax, (%rsi)
	movl %ebx, 16(%rsi)
	movl $1, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB5434:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB5420:
	movq %rsi, %rcx
	callq standard__strings__string.clear__0__ret_voidE1
	movl $1, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__strings__string.isalpha__0__ret_boolE1
	.def standard__strings__string.isalpha__0__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__strings__string.isalpha__0__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB5441:
	movq %rcx, %rsi
	cmpl $0, 16(%rsi)
	je .LB5445
.LB5446:
	xorl %edi, %edi
.LB5448:
	cmpl 16(%rsi), %edi
	jge .LB5451
.LB5449:
	movq (%rsi), %rax
	movslq %edi, %rcx
	movzbl (%rax,%rcx,1), %eax
	movzbl %al, %ecx
	callq standard__strings__helpers__is_alpha__1__charE1__ret_boolE1
	testb %al, %al
	je .LB5464
.LB5465:
	incl %edi
	cmpl 16(%rsi), %edi
	jl .LB5449
.LB5451:
	movl $1, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB5464:
	xorl %eax, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB5445:
	xorl %eax, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__strings__string.isdigit__0__ret_boolE1
	.def standard__strings__string.isdigit__0__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__strings__string.isdigit__0__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB5469:
	movq %rcx, %rsi
	cmpl $0, 16(%rsi)
	je .LB5473
.LB5474:
	xorl %edi, %edi
.LB5476:
	cmpl 16(%rsi), %edi
	jge .LB5479
.LB5477:
	movq (%rsi), %rax
	movslq %edi, %rcx
	movzbl (%rax,%rcx,1), %eax
	movzbl %al, %ecx
	callq standard__strings__helpers__is_digit__1__charE1__ret_boolE1
	testb %al, %al
	je .LB5492
.LB5493:
	incl %edi
	cmpl 16(%rsi), %edi
	jl .LB5477
.LB5479:
	movl $1, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB5492:
	xorl %eax, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB5473:
	xorl %eax, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__strings__string.isalnum__0__ret_boolE1
	.def standard__strings__string.isalnum__0__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__strings__string.isalnum__0__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB5497:
	movq %rcx, %rsi
	cmpl $0, 16(%rsi)
	je .LB5501
.LB5502:
	xorl %edi, %edi
.LB5504:
	cmpl 16(%rsi), %edi
	jge .LB5507
.LB5505:
	movq (%rsi), %rax
	movslq %edi, %rcx
	movzbl (%rax,%rcx,1), %eax
	movzbl %al, %ecx
	callq standard__strings__helpers__is_alnum__1__charE1__ret_boolE1
	testb %al, %al
	je .LB5520
.LB5521:
	incl %edi
	cmpl 16(%rsi), %edi
	jl .LB5505
.LB5507:
	movl $1, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB5520:
	xorl %eax, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB5501:
	xorl %eax, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__strings__string.isupper__0__ret_boolE1
	.def standard__strings__string.isupper__0__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__strings__string.isupper__0__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
.LB5525:
	movq %rcx, %rsi
	cmpl $0, 16(%rsi)
	je .LB5529
.LB5530:
	xorl %edi, %edi
	xorl %ebx, %ebx
.LB5534:
	cmpl 16(%rsi), %ebx
	jge .LB5537
.LB5535:
	movq (%rsi), %rax
	movslq %ebx, %rcx
	movzbl (%rax,%rcx,1), %r12d
	movzbl %r12b, %ecx
	callq standard__strings__helpers__is_alpha__1__charE1__ret_boolE1
	testb %al, %al
	jne .LB5550
.LB5551:
.LB5552:
	incl %ebx
	cmpl 16(%rsi), %ebx
	jl .LB5535
.LB5537:
	movzbl %dil, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB5550:
	movzbl %r12b, %ecx
	callq standard__strings__helpers__is_upper__1__charE1__ret_boolE1
	testb %al, %al
	je .LB5556
.LB5557:
	movl $1, %edi
	jmp .LB5552
.LB5556:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB5529:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
	.text
	.globl standard__strings__string.islower__0__ret_boolE1
	.def standard__strings__string.islower__0__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__strings__string.islower__0__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
.LB5562:
	movq %rcx, %rsi
	cmpl $0, 16(%rsi)
	je .LB5566
.LB5567:
	xorl %edi, %edi
	xorl %ebx, %ebx
.LB5571:
	cmpl 16(%rsi), %ebx
	jge .LB5574
.LB5572:
	movq (%rsi), %rax
	movslq %ebx, %rcx
	movzbl (%rax,%rcx,1), %r12d
	movzbl %r12b, %ecx
	callq standard__strings__helpers__is_alpha__1__charE1__ret_boolE1
	testb %al, %al
	jne .LB5587
.LB5588:
.LB5589:
	incl %ebx
	cmpl 16(%rsi), %ebx
	jl .LB5572
.LB5574:
	movzbl %dil, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB5587:
	movzbl %r12b, %ecx
	callq standard__strings__helpers__is_lower__1__charE1__ret_boolE1
	testb %al, %al
	je .LB5593
.LB5594:
	movl $1, %edi
	jmp .LB5589
.LB5593:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB5566:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
	.text
	.globl standard__strings__string.toint__0__ret_intE1
	.def standard__strings__string.toint__0__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__strings__string.toint__0__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB5599:
	movq (%rcx), %rcx
	callq standard__strings__str2i32__1__byteE1_ptr1__ret_intE1
	leave
	ret
	.text
	.globl standard__strings__string.toi32__0__ret_dataE1_sbits32
	.def standard__strings__string.toi32__0__ret_dataE1_sbits32;
	.scl 2;
	.type 32;
	.endef
standard__strings__string.toi32__0__ret_dataE1_sbits32:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB5603:
	movq (%rcx), %rcx
	callq standard__strings__str2i32__1__byteE1_ptr1__ret_intE1
	leave
	ret
	.text
	.globl standard__strings__string.toi64__0__ret_dataE1_sbits64
	.def standard__strings__string.toi64__0__ret_dataE1_sbits64;
	.scl 2;
	.type 32;
	.endef
standard__strings__string.toi64__0__ret_dataE1_sbits64:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB5607:
	movq (%rcx), %rcx
	callq standard__strings__str2i64__1__byteE1_ptr1__ret_dataE1_sbits64
	leave
	ret
	.text
	.globl standard__strings__string.tou32__0__ret_dataE1_ubits32
	.def standard__strings__string.tou32__0__ret_dataE1_ubits32;
	.scl 2;
	.type 32;
	.endef
standard__strings__string.tou32__0__ret_dataE1_ubits32:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB5611:
	movq (%rcx), %rcx
	callq standard__strings__str2u32__1__byteE1_ptr1__ret_uintE1
	leave
	ret
	.text
	.globl standard__strings__string.tou64__0__ret_dataE1_ubits64
	.def standard__strings__string.tou64__0__ret_dataE1_ubits64;
	.scl 2;
	.type 32;
	.endef
standard__strings__string.tou64__0__ret_dataE1_ubits64:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB5615:
	movq (%rcx), %rcx
	callq standard__strings__str2u64__1__byteE1_ptr1__ret_dataE1_ubits64
	leave
	ret
	.text
	.globl standard__strings__string.fromint__1__intE1__ret_boolE1
	.def standard__strings__string.fromint__1__intE1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__strings__string.fromint__1__intE1__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $80, %rsp
	movq %rsi, -8(%rbp)
.LB5619:
	movq %rcx, %rsi
	movl %edx, %ecx
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -40(%rbp)
	vzeroupper
	leaq -40(%rbp), %rdx
	callq standard__strings__i32str__2__dataE1_sbits32__byteE1_ptr1__ret_dataE1_sbits32
	leaq -40(%rbp), %rcx
	callq standard__strings__manip__copy_string__1__byteE1_ptr1__ret_byteE1_ptr1
	movq %rax, %rdx
	movq %rsi, %rcx
	callq standard__strings__string.set__1__byteE1_ptr1__ret_boolE1
	movzbl %al, %eax
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl standard__strings__string.get_line__1__intE1__ret_byteE1_ptr1
	.def standard__strings__string.get_line__1__intE1__ret_byteE1_ptr1;
	.scl 2;
	.type 32;
	.endef
standard__strings__string.get_line__1__intE1__ret_byteE1_ptr1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB5628:
	movq (%rcx), %rcx
	callq standard__strings__get_line__2__byteE1_ptr1__intE1__ret_byteE1_ptr1
	leave
	ret
	.text
	.globl standard__strings__string.count_words__0__ret_intE1
	.def standard__strings__string.count_words__0__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__strings__string.count_words__0__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB5634:
	movq (%rcx), %rcx
	callq standard__strings__count_words__1__byteE1_ptr1__ret_intE1
	leave
	ret
	.text
	.globl standard__strings__string.split__1__charE1__ret_byteE1_ptr2
	.def standard__strings__string.split__1__charE1__ret_byteE1_ptr2;
	.scl 2;
	.type 32;
	.endef
standard__strings__string.split__1__charE1__ret_byteE1_ptr2:
	pushq %rbp
	movq %rsp, %rbp
	subq $80, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
	movq %r14, -48(%rbp)
.LB5638:
	movq %rcx, %rsi
	movl %edx, %edi
	movl 16(%rsi), %eax
	movq (%rsi), %rcx
	movslq %eax, %rax
	movl $1, %edx
	xorl %r8d, %r8d
.LB5641:
	cmpq %rax, %r8
	jge .LB5644
.LB5642:
	movzbl (%rcx,%r8,1), %r9d
	leal 1(%rdx), %ebx
	cmpb %dil, %r9b
	cmove %ebx, %edx
	incq %r8
	cmpq %rax, %r8
	jl .LB5642
.LB5644:
	leal 1(%rdx), %eax
	movq %rax, %rcx
	shlq $3, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, %rbx
	testq %rbx, %rbx
	je .LB5676
.LB5677:
	xorl %r12d, %r12d
	xorl %eax, %eax
	xorl %ecx, %ecx
	xorl %r13d, %r13d
.LB5684:
	movl 16(%rsi), %edx
	cmpl %edx, %r13d
	jg .LB5687
.LB5685:
	cmpl %edx, %r13d
	je .LB5707
.LB5697:
	movq (%rsi), %rdx
	movslq %r13d, %r8
	movzbl (%rdx,%r8,1), %edx
	cmpb %dil, %dl
	je .LB5707
.LB5708:
.LB5709:
	incl %r13d
	jmp .LB5684
.LB5687:
	movslq %r12d, %rax
	movq $0, (%rbx,%rax,8)
	movq %rbx, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	leave
	ret
.LB5707:
	movl %r13d, %r14d
	subl %eax, %r14d
	movq (%rsi), %rcx
	movslq %eax, %rax
	leaq (%rcx,%rax,1), %rcx
	movq %r14, %rdx
	callq standard__strings__manip__copy_n__2__byteE1_ptr1__intE1__ret_byteE1_ptr1
	movslq %r12d, %rcx
	movq %rax, (%rbx,%rcx,8)
	incl %r12d
	leal 1(%r13), %eax
	movq %r14, %rcx
	jmp .LB5709
.LB5676:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	leave
	ret
	.text
	.globl standard__strings__string.split_lines__0__ret_byteE1_ptr2
	.def standard__strings__string.split_lines__0__ret_byteE1_ptr2;
	.scl 2;
	.type 32;
	.endef
standard__strings__string.split_lines__0__ret_byteE1_ptr2:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB5734:
	movl $10, %edx
	callq standard__strings__string.split__1__charE1__ret_byteE1_ptr2
	leave
	ret
	.text
	.globl standard__strings__string.split_words__0__ret_byteE1_ptr2
	.def standard__strings__string.split_words__0__ret_byteE1_ptr2;
	.scl 2;
	.type 32;
	.endef
standard__strings__string.split_words__0__ret_byteE1_ptr2:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB5736:
	movl $32, %edx
	callq standard__strings__string.split__1__charE1__ret_byteE1_ptr2
	leave
	ret
	.text
	.globl standard__strings__string.reverse__0__ret_boolE1
	.def standard__strings__string.reverse__0__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__strings__string.reverse__0__ret_boolE1:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
	movq %rdi, -8(%rsp)
.LB5738:
	xorl %eax, %eax
.LB5740:
	movl 16(%rcx), %edx
	movl %edx, %esi
	sarl $31, %esi
	movl %edx, %esi
	shrl $31, %esi
	addl %edx, %esi
	sarl $1, %esi
	cmpl %esi, %eax
	jge .LB5743
.LB5741:
	movq (%rcx), %rsi
	movslq %eax, %rdi
	decl %edx
	subl %eax, %edx
	movslq %edx, %rdx
	leaq (%rsi,%rdi,1), %rdi
	movzbl (%rdi), %r8d
	movzbl (%rsi,%rdx,1), %edx
	movb %dl, (%rdi)
	movq (%rcx), %rdx
	movl 16(%rcx), %esi
	decl %esi
	subl %eax, %esi
	incl %eax
	movslq %esi, %rsi
	movb %r8b, (%rdx,%rsi,1)
	jmp .LB5740
.LB5743:
	movl $1, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
	.text
	.globl standard__strings__string.copy__0__ret_byteE1_ptr1
	.def standard__strings__string.copy__0__ret_byteE1_ptr1;
	.scl 2;
	.type 32;
	.endef
standard__strings__string.copy__0__ret_byteE1_ptr1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB5781:
	movq (%rcx), %rcx
	callq standard__strings__manip__copy_string__1__byteE1_ptr1__ret_byteE1_ptr1
	leave
	ret
	.text
	.globl standard__strings__string.hash__0__ret_intE1
	.def standard__strings__string.hash__0__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__strings__string.hash__0__ret_intE1:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
	movq %rdi, -8(%rsp)
.LB5785:
	movl 16(%rcx), %eax
	movq (%rcx), %rcx
	movslq %eax, %rax
	movl $5381, %edx
	xorl %esi, %esi
.LB5787:
	cmpq %rax, %rsi
	jge .LB5790
.LB5788:
	movl %edx, %edi
	shll $5, %edi
	addl %edx, %edi
	movzbl (%rcx,%rsi,1), %edx
	addl %edi, %edx
	incq %rsi
	cmpq %rax, %rsi
	jl .LB5788
.LB5790:
	movl %edx, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
	.text
	.globl standard__strings__string.printval__0__ret_voidE1
	.def standard__strings__string.printval__0__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__strings__string.printval__0__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB5810:
	movq (%rcx), %rax
	movl 16(%rcx), %edx
	movq %rax, %rcx
	callq standard__io__console__print__2__byteE1_arr__intE1__ret_voidE1
	leave
	ret
	.text
	.globl standard__strings__string.println__0__ret_voidE1
	.def standard__strings__string.println__0__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__strings__string.println__0__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
.LB5815:
	movq (%rcx), %rax
	movl 16(%rcx), %edx
	movq %rax, %rcx
	callq standard__io__console__print__2__byteE1_arr__intE1__ret_voidE1
	movw $10, -2(%rbp)
	leaq -2(%rbp), %rcx
	movl $2, %edx
	callq standard__io__console__print__2__byteE1_arr__intE1__ret_voidE1
	leave
	ret
	.text
	.globl standard__io__file__file.__init__2__byteE1_ptr1__byteE1_ptr1__ret_thisE1
	.def standard__io__file__file.__init__2__byteE1_ptr1__byteE1_ptr1__ret_thisE1;
	.scl 2;
	.type 32;
	.endef
standard__io__file__file.__init__2__byteE1_ptr1__byteE1_ptr1__ret_thisE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
.LB5824:
	movq %rcx, %rsi
	movq %rdx, %rcx
	movq %r8, %rdx
	movq %rcx, 16(%rsi)
	movq %rdx, 24(%rsi)
	callq fopen
	movq %rax, (%rsi)
	movl $0, 12(%rsi)
	movq %rsi, %rcx
	callq standard__io__file__file.is_open__0__ret_boolE1
	testb %al, %al
	je .LB5838
.LB5839:
	movq %rsi, %rcx
	callq standard__io__file__file.get_size__0__ret_intE1
	movl %eax, 8(%rsi)
	movq %rsi, %rax
	movq -8(%rbp), %rsi
	leave
	ret
.LB5838:
	movl $1, 12(%rsi)
	movl $4294967295, 8(%rsi)
	movq %rsi, %rax
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl standard__io__file__file.__init__4__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__intE1__ret_thisE1
	.def standard__io__file__file.__init__4__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__intE1__ret_thisE1;
	.scl 2;
	.type 32;
	.endef
standard__io__file__file.__init__4__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__intE1__ret_thisE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
.LB5846:
	movl 48(%rbp), %ebx
	movq %rcx, %rsi
	movq %rdx, %rcx
	movq %r8, %rdx
	movq %r9, %rdi
	movq %rcx, 16(%rsi)
	movq %rdx, 24(%rsi)
	callq fopen
	movq %rax, (%rsi)
	movl $0, 12(%rsi)
	movq %rsi, %rcx
	callq standard__io__file__file.is_open__0__ret_boolE1
	testb %al, %al
	je .LB5862
.LB5863:
	movq %rsi, %rcx
	callq standard__io__file__file.get_size__0__ret_intE1
	movl %eax, 8(%rsi)
	testq %rdi, %rdi
	je .LB5882
.LB5876:
	testl %ebx, %ebx
	jg .LB5881
.LB5882:
	movq %rsi, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB5881:
	leal -1(%rbx), %r8d
	movq %rsi, %rcx
	movq %rdi, %rdx
	callq standard__io__file__file.read_bytes__2__byteE1_ptr1__intE1__ret_intE1
	testl %eax, %eax
	jns .LB5891
.LB5892:
	movl $2, 12(%rsi)
.LB5893:
	movq %rsi, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB5891:
	movslq %eax, %rax
	movb $0, (%rdi,%rax,1)
	jmp .LB5893
.LB5862:
	movl $1, 12(%rsi)
	movl $4294967295, 8(%rsi)
	movq %rsi, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__io__file__file.__exit__0__ret_voidE1
	.def standard__io__file__file.__exit__0__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__io__file__file.__exit__0__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB5899:
	callq standard__io__file__file.close__0__ret_boolE1
	leave
	ret
	.text
	.globl standard__io__file__file.is_open__0__ret_boolE1
	.def standard__io__file__file.is_open__0__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__io__file__file.is_open__0__ret_boolE1:
.LB5901:
	movq (%rcx), %rax
	xorl %ecx, %ecx
	testq %rax, %rax
	setne %cl
	movl %ecx, %eax
	ret
	.text
	.globl standard__io__file__file.eof__0__ret_boolE1
	.def standard__io__file__file.eof__0__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__io__file__file.eof__0__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
.LB5909:
	movq %rcx, %rsi
	movq %rsi, %rcx
	callq standard__io__file__file.is_open__0__ret_boolE1
	testb %al, %al
	je .LB5912
.LB5913:
	movq (%rsi), %rcx
	callq feof
	xorl %ecx, %ecx
	testl %eax, %eax
	setne %cl
	movl %ecx, %eax
	movq -8(%rbp), %rsi
	leave
	ret
.LB5912:
	movl $1, %eax
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl standard__io__file__file.get_size__0__ret_intE1
	.def standard__io__file__file.get_size__0__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__io__file__file.get_size__0__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
.LB5919:
	movq %rcx, %rsi
	movq %rsi, %rcx
	callq standard__io__file__file.is_open__0__ret_boolE1
	testb %al, %al
	je .LB5922
.LB5923:
	movq (%rsi), %rcx
	callq ftell
	movl %eax, %edi
	movq (%rsi), %rcx
	movl standard__io__file__SEEK_END(%rip), %r8d
	xorl %edx, %edx
	callq fseek
	movq (%rsi), %rcx
	callq ftell
	movl %eax, %ebx
	movq (%rsi), %rcx
	movl standard__io__file__SEEK_SET(%rip), %r8d
	movq %rdi, %rdx
	callq fseek
	movl %ebx, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB5922:
	movl $1, 12(%rsi)
	movabsq $4294967295, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__io__file__file.close__0__ret_boolE1
	.def standard__io__file__file.close__0__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__io__file__file.close__0__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
.LB5945:
	movq %rcx, %rsi
	movq %rsi, %rcx
	callq standard__io__file__file.is_open__0__ret_boolE1
	testb %al, %al
	je .LB5948
.LB5949:
	movq (%rsi), %rcx
	callq fclose
	movq $0, (%rsi)
	movl $1, %eax
	movq -8(%rbp), %rsi
	leave
	ret
.LB5948:
	xorl %eax, %eax
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl standard__io__file__file.flush__0__ret_boolE1
	.def standard__io__file__file.flush__0__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__io__file__file.flush__0__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
.LB5957:
	movq %rcx, %rsi
	movq %rsi, %rcx
	callq standard__io__file__file.is_open__0__ret_boolE1
	testb %al, %al
	je .LB5960
.LB5961:
	movq (%rsi), %rcx
	callq fflush
	xorl %ecx, %ecx
	testl %eax, %eax
	sete %cl
	movl %ecx, %eax
	movq -8(%rbp), %rsi
	leave
	ret
.LB5960:
	movl $1, 12(%rsi)
	xorl %eax, %eax
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl standard__io__file__file.count_lines__0__ret_intE1
	.def standard__io__file__file.count_lines__0__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__io__file__file.count_lines__0__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
.LB5968:
	movq %rcx, %rsi
	movq %rsi, %rcx
	callq standard__io__file__file.is_open__0__ret_boolE1
	testb %al, %al
	je .LB5971
.LB5972:
	movq (%rsi), %rcx
	callq ftell
	movl %eax, %edi
	movq (%rsi), %rcx
	callq rewind
	movb .LZERO(%rip), %r10b
	movb %r10b, -25(%rbp)
	xorl %ebx, %ebx
.LB5985:
	leaq -25(%rbp), %rcx
	movq (%rsi), %r9
	movl $1, %edx
	movl $1, %r8d
	callq fread
	cmpl $1, %eax
	jne .LB5987
.LB5986:
	leal 1(%rbx), %eax
	cmpb $10, -25(%rbp)
	cmove %eax, %ebx
	jmp .LB5985
.LB5987:
	movq (%rsi), %rcx
	movl standard__io__file__SEEK_SET(%rip), %r8d
	movq %rdi, %rdx
	callq fseek
	movl %ebx, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB5971:
	movl $1, 12(%rsi)
	movabsq $4294967295, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__io__file__file.count_words__0__ret_intE1
	.def standard__io__file__file.count_words__0__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__io__file__file.count_words__0__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $80, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
.LB6007:
	movq %rcx, %rsi
	movq %rsi, %rcx
	callq standard__io__file__file.is_open__0__ret_boolE1
	testb %al, %al
	je .LB6010
.LB6011:
	movq (%rsi), %rcx
	callq ftell
	movl %eax, %edi
	movq (%rsi), %rcx
	callq rewind
	movb .LZERO(%rip), %r10b
	movb %r10b, -33(%rbp)
	xorl %ebx, %ebx
	xorl %r12d, %r12d
.LB6025:
	leaq -33(%rbp), %rcx
	movq (%rsi), %r9
	movl $1, %edx
	movl $1, %r8d
	callq fread
	cmpl $1, %eax
	jne .LB6027
.LB6026:
	cmpb $32, -33(%rbp)
	jne .LB6036
.LB31949:
	movl $1, %eax
.LB6049:
	testb %al, %al
	jne .LB6062
.LB6056:
	testb %r12b, %r12b
	je .LB6061
.LB6062:
	testb %al, %al
	jne .LB6067
.LB6068:
.LB6063:
	jmp .LB6025
.LB6027:
	movq (%rsi), %rcx
	movl standard__io__file__SEEK_SET(%rip), %r8d
	movq %rdi, %rdx
	callq fseek
	movl %ebx, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB6036:
	cmpb $9, -33(%rbp)
	jne .LB6042
.LB31950:
	movl $1, %eax
	testb %al, %al
	je .LB6056
	jmp .LB6062
.LB6042:
	cmpb $10, -33(%rbp)
	jne .LB6048
.LB31951:
	movl $1, %eax
	testb %al, %al
	je .LB6056
	jmp .LB6062
.LB6048:
	xorl %eax, %eax
	cmpb $13, -33(%rbp)
	sete %al
	testb %al, %al
	je .LB6056
	jmp .LB6062
.LB6067:
	xorl %r12d, %r12d
	jmp .LB6063
.LB6061:
	incl %ebx
	movl $1, %r12d
	jmp .LB6063
.LB6010:
	movl $1, 12(%rsi)
	movabsq $4294967295, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
	.text
	.globl standard__io__file__file.count_occurrences__1__byteE1_ptr1__ret_intE1
	.def standard__io__file__file.count_occurrences__1__byteE1_ptr1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__io__file__file.count_occurrences__1__byteE1_ptr1__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $80, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
	movq %r14, -48(%rbp)
.LB6075:
	movq %rcx, %rsi
	movq %rdx, %rdi
	movq %rsi, %rcx
	callq standard__io__file__file.is_open__0__ret_boolE1
	testb %al, %al
	je .LB6088
.LB6079:
	testq %rdi, %rdi
	je .LB6088
.LB6089:
	xorl %ebx, %ebx
.LB6094:
	movslq %ebx, %rax
	cmpb $0, (%rdi,%rax,1)
	je .LB6096
.LB6095:
	incl %ebx
	jmp .LB6094
.LB6096:
	testl %ebx, %ebx
	je .LB6107
.LB6108:
	movq (%rsi), %rcx
	callq ftell
	movl %eax, %r12d
	movq %rsi, %rcx
	callq standard__io__file__file.get_size__0__ret_intE1
	movl %eax, %r13d
	testl %r13d, %r13d
	jle .LB6118
.LB6119:
	leaq 1(%r13), %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, %r14
	testq %r14, %r14
	je .LB6139
.LB6140:
	movq (%rsi), %rcx
	callq rewind
	movq (%rsi), %r9
	movq %r14, %rcx
	movl $1, %edx
	movq %r13, %r8
	callq fread
	movl %eax, %r13d
	movslq %r13d, %rax
	movb $0, (%r14,%rax,1)
	movq (%rsi), %rcx
	movl standard__io__file__SEEK_SET(%rip), %r8d
	movq %r12, %rdx
	callq fseek
	subl %ebx, %r13d
	xorl %esi, %esi
	xorl %eax, %eax
.LB6169:
	cmpl %r13d, %eax
	jg .LB6171
.LB6170:
	xorl %ecx, %ecx
.LB6177:
	cmpl %ebx, %ecx
	jge .LB6179
.LB6178:
	leal (%rax,%rcx), %edx
	movslq %ecx, %r8
	movslq %edx, %rdx
	movzbl (%r14,%rdx,1), %edx
	movzbl (%rdi,%r8,1), %r8d
	cmpb %r8b, %dl
	jne .LB6179
.LB6195:
	incl %ecx
	cmpl %ebx, %ecx
	jl .LB6178
	jmp .LB6179
.LB6171:
	movq %r14, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__byteE1_ptr1__ret_voidE1
	movl %esi, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	leave
	ret
.LB6179:
	xorl %edx, %edx
	cmpl %ebx, %ecx
	sete %dl
	leal 1(%rsi), %ecx
	leal (%rax,%rbx), %r8d
	incl %eax
	testb %dl, %dl
	cmovne %ecx, %esi
	testb %dl, %dl
	cmovne %r8d, %eax
	cmpl %r13d, %eax
	jle .LB6170
	jmp .LB6171
.LB6139:
	movl $5, 12(%rsi)
	movq (%rsi), %rcx
	movl standard__io__file__SEEK_SET(%rip), %r8d
	movq %r12, %rdx
	callq fseek
	movabsq $4294967295, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	leave
	ret
.LB6118:
	movq (%rsi), %rcx
	movl standard__io__file__SEEK_SET(%rip), %r8d
	movq %r12, %rdx
	callq fseek
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	leave
	ret
.LB6107:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	leave
	ret
.LB6088:
	movl $1, 12(%rsi)
	movabsq $4294967295, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	leave
	ret
	.text
	.globl standard__io__file__file.read_bytes__2__byteE1_ptr1__intE1__ret_intE1
	.def standard__io__file__file.read_bytes__2__byteE1_ptr1__intE1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__io__file__file.read_bytes__2__byteE1_ptr1__intE1__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
.LB6214:
	movq %rcx, %rsi
	movq %rdx, %rdi
	movl %r8d, %ebx
	movq %rsi, %rcx
	callq standard__io__file__file.is_open__0__ret_boolE1
	testb %al, %al
	je .LB6219
.LB6220:
	testq %rdi, %rdi
	je .LB6235
.LB6230:
	testl %ebx, %ebx
	jle .LB6235
.LB6236:
	movq (%rsi), %r9
	movq %rdi, %rcx
	movl $1, %edx
	movq %rbx, %r8
	callq fread
	movl %eax, %edi
	testl %edi, %edi
	js .LB6246
.LB6247:
	movq %rsi, %rcx
	callq standard__io__file__file.eof__0__ret_boolE1
	testb %al, %al
	jne .LB6252
.LB6253:
	movl %edi, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB6252:
	movl $6, 12(%rsi)
	movl %edi, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB6246:
	movl $2, 12(%rsi)
	movabsq $4294967295, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB6235:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB6219:
	movl $1, 12(%rsi)
	movabsq $4294967295, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__io__file__file.read_from__2__intE1__intE1__ret_byteE1_ptr1
	.def standard__io__file__file.read_from__2__intE1__intE1__ret_byteE1_ptr1;
	.scl 2;
	.type 32;
	.endef
standard__io__file__file.read_from__2__intE1__intE1__ret_byteE1_ptr1:
	pushq %rbp
	movq %rsp, %rbp
	subq $80, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
.LB6257:
	movq %rcx, %rsi
	movl %edx, %edi
	movl %r8d, %ebx
	movq %rsi, %rcx
	callq standard__io__file__file.is_open__0__ret_boolE1
	testb %al, %al
	je .LB6262
.LB6263:
	testl %ebx, %ebx
	jle .LB6270
.LB6271:
	leaq 1(%rbx), %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, %r12
	testq %r12, %r12
	je .LB6288
.LB6289:
	movq (%rsi), %rcx
	callq ftell
	movl %eax, %r13d
	movq (%rsi), %rcx
	movl standard__io__file__SEEK_SET(%rip), %r8d
	movq %rdi, %rdx
	callq fseek
	movq (%rsi), %r9
	movq %r12, %rcx
	movl $1, %edx
	movq %rbx, %r8
	callq fread
	movl %eax, %edi
	movq (%rsi), %rcx
	movl standard__io__file__SEEK_SET(%rip), %r8d
	movq %r13, %rdx
	callq fseek
	testl %edi, %edi
	js .LB6316
.LB6317:
	movslq %edi, %rax
	movb $0, (%r12,%rax,1)
	movq %r12, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB6316:
	movq %r12, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__byteE1_ptr1__ret_voidE1
	movl $2, 12(%rsi)
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB6288:
	movl $5, 12(%rsi)
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB6270:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB6262:
	movl $1, 12(%rsi)
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
	.text
	.globl standard__io__file__file.find__1__byteE1_ptr1__ret_intE1
	.def standard__io__file__file.find__1__byteE1_ptr1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__io__file__file.find__1__byteE1_ptr1__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB6328:
	xorl %r8d, %r8d
	callq standard__io__file__file.find_from__2__byteE1_ptr1__intE1__ret_intE1
	leave
	ret
	.text
	.globl standard__io__file__file.find_from__2__byteE1_ptr1__intE1__ret_intE1
	.def standard__io__file__file.find_from__2__byteE1_ptr1__intE1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__io__file__file.find_from__2__byteE1_ptr1__intE1__ret_intE1:
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
.LB6332:
	movq %rcx, %rsi
	movq %rdx, %rdi
	movl %r8d, %ebx
	movq %rsi, %rcx
	callq standard__io__file__file.is_open__0__ret_boolE1
	testb %al, %al
	je .LB6346
.LB6337:
	testq %rdi, %rdi
	je .LB6346
.LB6347:
	xorl %r12d, %r12d
.LB6352:
	movslq %r12d, %rax
	cmpb $0, (%rdi,%rax,1)
	je .LB6354
.LB6353:
	incl %r12d
	jmp .LB6352
.LB6354:
	testl %r12d, %r12d
	je .LB6365
.LB6366:
	movq (%rsi), %rcx
	callq ftell
	movl %eax, %r13d
	movq %rsi, %rcx
	callq standard__io__file__file.get_size__0__ret_intE1
	movl %eax, %r14d
	testl %r14d, %r14d
	jle .LB6383
.LB6377:
	cmpl %r14d, %ebx
	jge .LB6383
.LB6384:
	leaq 1(%r14), %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, %r15
	testq %r15, %r15
	je .LB6405
.LB6406:
	movq (%rsi), %rcx
	callq rewind
	movq (%rsi), %r9
	movq %r15, %rcx
	movl $1, %edx
	movq %r14, %r8
	callq fread
	movl %eax, %r14d
	movslq %r14d, %rax
	movb $0, (%r15,%rax,1)
	movq (%rsi), %rcx
	movl standard__io__file__SEEK_SET(%rip), %r8d
	movq %r13, %rdx
	callq fseek
	subl %r12d, %r14d
.LB6437:
	cmpl %r14d, %ebx
	jle .LB6438
.LB31952:
	movl $4294967295, %ebx
.LB6439:
	movq %r15, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__byteE1_ptr1__ret_voidE1
	movl %ebx, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB6438:
	xorl %eax, %eax
.LB6445:
	cmpl %r12d, %eax
	jge .LB6447
.LB6446:
	leal (%rbx,%rax), %ecx
	movslq %eax, %rdx
	movslq %ecx, %rcx
	movzbl (%r15,%rcx,1), %ecx
	movzbl (%rdi,%rdx,1), %edx
	cmpb %dl, %cl
	jne .LB6447
.LB6463:
	incl %eax
	cmpl %r12d, %eax
	jl .LB6446
.LB6447:
	cmpl %r12d, %eax
	je .LB6470
.LB6471:
	incl %ebx
	cmpl %r14d, %ebx
	jle .LB6438
	jmp .LB31952
.LB6470:
	jmp .LB6439
.LB6405:
	movl $5, 12(%rsi)
	movq (%rsi), %rcx
	movl standard__io__file__SEEK_SET(%rip), %r8d
	movq %r13, %rdx
	callq fseek
	movabsq $4294967295, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB6383:
	movq (%rsi), %rcx
	movl standard__io__file__SEEK_SET(%rip), %r8d
	movq %r13, %rdx
	callq fseek
	movabsq $4294967295, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB6365:
	movl %ebx, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB6346:
	movl $1, 12(%rsi)
	movabsq $4294967295, %rax
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
	.globl standard__io__file__file.find_line_from__2__byteE1_ptr1__intE1__ret_intE1
	.def standard__io__file__file.find_line_from__2__byteE1_ptr1__intE1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__io__file__file.find_line_from__2__byteE1_ptr1__intE1__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	movl $4224, %eax
	callq __chkstk
	subq %rax, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
	movq %r14, -48(%rbp)
	movq %r15, -56(%rbp)
.LB6478:
	movq %rcx, %rsi
	movq %rdx, %rbx
	movl %r8d, %r12d
	movq %rsi, %rcx
	callq standard__io__file__file.is_open__0__ret_boolE1
	testb %al, %al
	je .LB6492
.LB6483:
	testq %rbx, %rbx
	je .LB6492
.LB6493:
	movq (%rsi), %rcx
	callq ftell
	movq %rax, -4184(%rbp)
	movq (%rsi), %rcx
	callq rewind
	leaq -4152(%rbp), %rax
	movq %rax, %rdi
	xorl %eax, %eax
	movl $4096, %ecx
	rep stosb
	xorl %edi, %edi
.LB6512:
	movslq %edi, %rax
	cmpb $0, (%rbx,%rax,1)
	je .LB6514
.LB6513:
	incl %edi
	jmp .LB6512
.LB6514:
	xorl %r13d, %r13d
	movl $4294967295, %r14d
	movq $0, -4160(%rbp)
	movq $0, -4168(%rbp)
	movq $0, -4176(%rbp)
.LB6523:
	leaq -4152(%rbp), %rcx
	movq (%rsi), %r8
	movl $4096, %edx
	callq fgets
	testq %rax, %rax
	jne .LB6524
.LB31953:
.LB6525:
	movq (%rsi), %rcx
	movl standard__io__file__SEEK_SET(%rip), %r8d
	movq -4184(%rbp), %rdx
	callq fseek
	movl %r14d, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB6524:
	cmpl %r12d, %r13d
	jge .LB6538
.LB6539:
	movq -4160(%rbp), %rax
	movq -4168(%rbp), %rcx
	movq -4176(%rbp), %rdx
.LB6540:
	incl %r13d
	movq %rax, -4160(%rbp)
	movq %rcx, -4168(%rbp)
	movq %rdx, -4176(%rbp)
	jmp .LB6523
.LB6538:
	xorl %eax, %eax
.LB6541:
	movslq %eax, %rcx
	cmpb $0, -4152(%rbp,%rcx,1)
	je .LB6543
.LB6542:
	incl %eax
	jmp .LB6541
.LB6543:
	movl %eax, %ecx
	subl %edi, %ecx
	xorl %edx, %edx
	movq -4176(%rbp), %r8
.LB6551:
	cmpl %ecx, %edx
	jle .LB6552
.LB31954:
.LB6553:
	testl %r14d, %r14d
	jns .LB6591
.LB6592:
	movq %rdx, %rcx
	movq %r8, %rdx
	jmp .LB6540
.LB6552:
	xorl %r8d, %r8d
.LB6559:
	cmpl %edi, %r8d
	jge .LB6561
.LB6560:
	leal (%rdx,%r8), %r9d
	movslq %r8d, %r15
	movslq %r9d, %r9
	movzbl -4152(%rbp,%r9,1), %r9d
	movzbl (%rbx,%r15,1), %r15d
	cmpb %r15b, %r9b
	jne .LB6561
.LB6576:
	incl %r8d
	cmpl %edi, %r8d
	jl .LB6560
.LB6561:
	cmpl %edi, %r8d
	je .LB6583
.LB6584:
	incl %edx
	cmpl %ecx, %edx
	jle .LB6552
	jmp .LB31954
.LB6583:
	movq %r13, %r14
	testl %r14d, %r14d
	js .LB6592
.LB6591:
	jmp .LB6525
.LB6492:
	movl $1, 12(%rsi)
	movabsq $4294967295, %rax
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
	.globl standard__io__file__file.write__1__byteE1_ptr1__ret_intE1
	.def standard__io__file__file.write__1__byteE1_ptr1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__io__file__file.write__1__byteE1_ptr1__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
.LB6602:
	movq %rcx, %rsi
	movq %rdx, %rdi
	movq %rsi, %rcx
	callq standard__io__file__file.is_open__0__ret_boolE1
	testb %al, %al
	je .LB6606
.LB6607:
	movq %rdi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %ebx
	movq (%rsi), %r9
	movq %rdi, %rcx
	movl $1, %edx
	movq %rbx, %r8
	callq fwrite
	cmpl %ebx, %eax
	jl .LB6623
.LB6624:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB6623:
	movl $3, 12(%rsi)
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB6606:
	movl $1, 12(%rsi)
	movabsq $4294967295, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__io__file__file.write_bytes__2__byteE1_ptr1__intE1__ret_intE1
	.def standard__io__file__file.write_bytes__2__byteE1_ptr1__intE1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__io__file__file.write_bytes__2__byteE1_ptr1__intE1__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
.LB6628:
	movq %rcx, %rsi
	movq %rdx, %rdi
	movl %r8d, %ebx
	movq %rsi, %rcx
	callq standard__io__file__file.is_open__0__ret_boolE1
	testb %al, %al
	je .LB6633
.LB6634:
	testq %rdi, %rdi
	je .LB6649
.LB6644:
	testl %ebx, %ebx
	jle .LB6649
.LB6650:
	movq (%rsi), %r9
	movq %rdi, %rcx
	movl $1, %edx
	movq %rbx, %r8
	callq fwrite
	cmpl %ebx, %eax
	jl .LB6661
.LB6662:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB6661:
	movl $3, 12(%rsi)
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB6649:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB6633:
	movl $1, 12(%rsi)
	movabsq $4294967295, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__io__file__file.write_line__1__byteE1_ptr1__ret_intE1
	.def standard__io__file__file.write_line__1__byteE1_ptr1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__io__file__file.write_line__1__byteE1_ptr1__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB6666:
	movq %rcx, %rsi
	movq %rsi, %rcx
	callq standard__io__file__file.write__1__byteE1_ptr1__ret_intE1
	movl %eax, %edi
	testl %edi, %edi
	js .LB6673
.LB6674:
	movw $10, -18(%rbp)
	leaq -18(%rbp), %rdx
	movq %rsi, %rcx
	movl $1, %r8d
	callq standard__io__file__file.write_bytes__2__byteE1_ptr1__intE1__ret_intE1
	testl %eax, %eax
	js .LB6685
.LB6686:
	addl %edi, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB6685:
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB6673:
	movl %edi, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__io__file__file.replace_first__2__byteE1_ptr1__byteE1_ptr1__ret_boolE1
	.def standard__io__file__file.replace_first__2__byteE1_ptr1__byteE1_ptr1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__io__file__file.replace_first__2__byteE1_ptr1__byteE1_ptr1__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $80, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
.LB6692:
	movq %rcx, %rsi
	movq %rdx, %rdi
	movq %r8, %rbx
	movq %rsi, %rcx
	callq standard__io__file__file.is_open__0__ret_boolE1
	testb %al, %al
	je .LB6707
.LB6697:
	movq 16(%rsi), %rax
	testq %rax, %rax
	je .LB6707
.LB6708:
	movq %rsi, %rcx
	callq standard__io__file__file.get_size__0__ret_intE1
	movl %eax, %r12d
	testl %r12d, %r12d
	jle .LB6715
.LB6716:
	leaq 1(%r12), %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, %r13
	testq %r13, %r13
	je .LB6731
.LB6732:
	movq (%rsi), %rcx
	callq rewind
	movq (%rsi), %r9
	movq %r13, %rcx
	movl $1, %edx
	movq %r12, %r8
	callq fread
	movslq %eax, %rax
	movb $0, (%r13,%rax,1)
	movq %r13, %rcx
	movq %rdi, %rdx
	movq %rbx, %r8
	callq standard__strings__replace_first__3__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__ret_byteE1_ptr1
	movq %rax, %rdi
	movq %r13, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__byteE1_ptr1__ret_voidE1
	testq %rdi, %rdi
	je .LB6759
.LB6760:
	xorl %ebx, %ebx
.LB6764:
	movslq %ebx, %rax
	cmpb $0, (%rdi,%rax,1)
	je .LB6766
.LB6765:
	incl %ebx
	jmp .LB6764
.LB6766:
	movq %rsi, %rcx
	callq standard__io__file__file.close__0__ret_boolE1
	movq 16(%rsi), %rcx
	movw $25207, -43(%rbp)
	movb $0, -41(%rbp)
	leaq -43(%rbp), %rdx
	callq fopen
	movq %rax, %r12
	testq %r12, %r12
	je .LB6791
.LB6792:
	movq %rdi, %rcx
	movl $1, %edx
	movq %rbx, %r8
	movq %r12, %r9
	callq fwrite
	movq %r12, %rcx
	callq fclose
	movq %rdi, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__byteE1_ptr1__ret_voidE1
	movq 16(%rsi), %rcx
	movq 24(%rsi), %rdx
	callq fopen
	movq %rax, (%rsi)
	movq %rsi, %rcx
	callq standard__io__file__file.get_size__0__ret_intE1
	movl %eax, 8(%rsi)
	movq %rsi, %rcx
	callq standard__io__file__file.is_open__0__ret_boolE1
	movzbl %al, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB6791:
	movq %rdi, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__byteE1_ptr1__ret_voidE1
	movl $3, 12(%rsi)
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB6759:
	movl $5, 12(%rsi)
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB6731:
	movl $5, 12(%rsi)
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB6715:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB6707:
	movl $1, 12(%rsi)
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
	.text
	.globl standard__io__file__file.truncate__1__intE1__ret_boolE1
	.def standard__io__file__file.truncate__1__intE1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__io__file__file.truncate__1__intE1__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $80, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
.LB6812:
	movq %rcx, %rsi
	movl %edx, %edi
	movq %rsi, %rcx
	callq standard__io__file__file.is_open__0__ret_boolE1
	testb %al, %al
	je .LB6826
.LB6816:
	movq 16(%rsi), %rax
	testq %rax, %rax
	je .LB6826
.LB6827:
	xorl %eax, %eax
	testl %edi, %edi
	cmovs %eax, %edi
	movq %rsi, %rcx
	callq standard__io__file__file.get_size__0__ret_intE1
	cmpl %eax, %edi
	jge .LB6840
.LB6841:
	leaq 1(%rdi), %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, %rbx
	testq %rbx, %rbx
	je .LB6856
.LB6857:
	movq (%rsi), %rcx
	callq rewind
	movq (%rsi), %r9
	movq %rbx, %rcx
	movl $1, %edx
	movq %rdi, %r8
	callq fread
	movl %eax, %edi
	movslq %edi, %rax
	movb $0, (%rbx,%rax,1)
	movq %rsi, %rcx
	callq standard__io__file__file.close__0__ret_boolE1
	movq 16(%rsi), %rcx
	movw $25207, -35(%rbp)
	movb $0, -33(%rbp)
	leaq -35(%rbp), %rdx
	callq fopen
	movq %rax, %r12
	testq %r12, %r12
	je .LB6888
.LB6889:
	movq %rbx, %rcx
	movl $1, %edx
	movq %rdi, %r8
	movq %r12, %r9
	callq fwrite
	movq %r12, %rcx
	callq fclose
	movq %rbx, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__byteE1_ptr1__ret_voidE1
	movq 16(%rsi), %rcx
	movq 24(%rsi), %rdx
	callq fopen
	movq %rax, (%rsi)
	movq %rsi, %rcx
	callq standard__io__file__file.get_size__0__ret_intE1
	movl %eax, 8(%rsi)
	movq %rsi, %rcx
	callq standard__io__file__file.is_open__0__ret_boolE1
	movzbl %al, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB6888:
	movq %rbx, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__byteE1_ptr1__ret_voidE1
	movl $3, 12(%rsi)
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB6856:
	movl $5, 12(%rsi)
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB6840:
	movl $1, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB6826:
	movl $1, 12(%rsi)
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
	.text
	.globl standard__io__file__file.clear__0__ret_boolE1
	.def standard__io__file__file.clear__0__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__io__file__file.clear__0__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB6909:
	xorl %edx, %edx
	callq standard__io__file__file.truncate__1__intE1__ret_boolE1
	movzbl %al, %eax
	leave
	ret
	.text
	.globl standard__io__file__file.copy_to__1__byteE1_ptr1__ret_boolE1
	.def standard__io__file__file.copy_to__1__byteE1_ptr1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__io__file__file.copy_to__1__byteE1_ptr1__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $80, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
.LB6911:
	movq %rcx, %rsi
	movq %rdx, %rdi
	movq %rsi, %rcx
	callq standard__io__file__file.is_open__0__ret_boolE1
	testb %al, %al
	je .LB6924
.LB6915:
	testq %rdi, %rdi
	je .LB6924
.LB6925:
	movq %rsi, %rcx
	callq standard__io__file__file.get_size__0__ret_intE1
	movl %eax, %ebx
	testl %ebx, %ebx
	js .LB6932
.LB6933:
	leaq 1(%rbx), %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, %r12
	testq %r12, %r12
	je .LB6948
.LB6949:
	movq (%rsi), %rcx
	callq ftell
	movl %eax, %r13d
	movq (%rsi), %rcx
	callq rewind
	movq (%rsi), %r9
	movq %r12, %rcx
	movl $1, %edx
	movq %rbx, %r8
	callq fread
	movl %eax, %ebx
	movq (%rsi), %rcx
	movl standard__io__file__SEEK_SET(%rip), %r8d
	movq %r13, %rdx
	callq fseek
	movw $25207, -43(%rbp)
	movb $0, -41(%rbp)
	leaq -43(%rbp), %rdx
	movq %rdi, %rcx
	callq fopen
	movq %rax, %rdi
	testq %rdi, %rdi
	je .LB6983
.LB6984:
	movq %r12, %rcx
	movl $1, %edx
	movq %rbx, %r8
	movq %rdi, %r9
	callq fwrite
	movl %eax, %r13d
	movq %rdi, %rcx
	callq fclose
	movq %r12, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__byteE1_ptr1__ret_voidE1
	cmpl %ebx, %r13d
	jl .LB6999
.LB7000:
	movl $1, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB6999:
	movl $9, 12(%rsi)
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB6983:
	movq %r12, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__byteE1_ptr1__ret_voidE1
	movl $9, 12(%rsi)
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB6948:
	movl $5, 12(%rsi)
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB6932:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB6924:
	movl $1, 12(%rsi)
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
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
	subq $64, %rsp
.LB31693:
	movl $1668508004, -18(%rbp)
	movl $1600418415, -14(%rbp)
	movl $1701539700, -10(%rbp)
	movl $2020879982, -6(%rbp)
	movw $116, -2(%rbp)
	movl standard__discord__INTENT_GUILD_MESSAGES(%rip), %eax
	movl standard__discord__INTENT_DIRECT_MESSAGES(%rip), %ecx
	addl %ecx, %eax
	movl standard__discord__INTENT_MESSAGE_CONTENT(%rip), %ecx
	leal (%rax,%rcx), %r8d
	leaq -18(%rbp), %rdx
	leaq g_bot(%rip), %rcx
	callq standard__discord__discord_start__3__DISCORD_BOTE1_ptr1__byteE1_ptr1__intE1__ret_intE1
	testl %eax, %eax
	jne .LB31721
.LB31724:
	leaq g_bot(%rip), %rcx
	leaq g_ev(%rip), %rdx
	callq standard__discord__discord_next__2__DISCORD_BOTE1_ptr1__DISCORD_EVENTE1_ptr1__ret_intE1
	cmpl $1, %eax
	jne .LB31726
.LB31725:
	cmpl $0, g_ev+224(%rip)
	jne .LB31724
.LB31734:
	movl $1852403745, -24(%rbp)
	movw $103, -20(%rbp)
	leaq -24(%rbp), %rdx
	leaq g_ev(%rip), %rcx
	callq standard__discord__discord_content_is__2__DISCORD_EVENTE1_ptr1__byteE1_ptr1__ret_boolE1
	testb %al, %al
	jne .LB31746
	jmp .LB31724
.LB31726:
	xorl %eax, %eax
	leave
	ret
.LB31746:
	leaq -29(%rbp), %r8
	leaq g_bot(%rip), %rcx
	leaq g_ev(%rip), %rdx
	movl $1735290736, -29(%rbp)
	movb $0, -25(%rbp)
	callq standard__discord__discord_reply__3__DISCORD_BOTE1_ptr1__DISCORD_EVENTE1_ptr1__byteE1_ptr1__ret_intE1
	jmp .LB31724
.LB31721:
	movl $1, %eax
	leave
	ret
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
.LB31757:
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
.LB7004:
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
.LB7023:
	movslq %eax, %rcx
	cmpw $0, (%rsi,%rcx,2)
	je .LB7025
.LB7024:
.LB7032:
	movslq %eax, %rcx
	movzwl (%rsi,%rcx,2), %ecx
	cmpw $32, %cx
	je .LB7033
.LB7041:
	cmpw $9, %cx
	jne .LB7034
.LB7033:
	incl %eax
	jmp .LB7032
.LB7034:
	testw %cx, %cx
	je .LB7025
.LB7059:
	cmpw $34, %cx
	je .LB7067
.LB7068:
.LB7103:
	movslq %eax, %rcx
	movzwl (%rsi,%rcx,2), %ecx
	testw %cx, %cx
	je .LB7105
.LB7112:
	cmpw $32, %cx
	je .LB7105
.LB7121:
	cmpw $9, %cx
	je .LB7105
.LB7104:
	incl %eax
	jmp .LB7103
.LB7105:
.LB7069:
	incl %edi
	jmp .LB7023
.LB7067:
	incl %eax
.LB7072:
	movslq %eax, %rcx
	movzwl (%rsi,%rcx,2), %ecx
	testw %cx, %cx
	je .LB7074
.LB7081:
	cmpw $34, %cx
	je .LB7074
.LB7073:
	incl %eax
	jmp .LB7072
.LB7074:
	leal 1(%rax), %ecx
	movslq %eax, %rdx
	cmpw $34, (%rsi,%rdx,2)
	cmove %ecx, %eax
	jmp .LB7069
.LB7025:
	movq %rdi, %rcx
	shlq $3, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, %rbx
	xorl %r12d, %r12d
	xorl %eax, %eax
	xorl %ecx, %ecx
.LB7140:
	movslq %eax, %rdx
	cmpw $0, (%rsi,%rdx,2)
	je .LB7142
.LB7141:
.LB7149:
	movslq %eax, %rdx
	movzwl (%rsi,%rdx,2), %edx
	cmpw $32, %dx
	je .LB7150
.LB7158:
	cmpw $9, %dx
	jne .LB7151
.LB7150:
	incl %eax
	jmp .LB7149
.LB7151:
	testw %dx, %dx
	je .LB7142
.LB7176:
	cmpw $34, %dx
	je .LB7185
.LB7186:
	movq %rax, %rdx
	xorl %r13d, %r13d
.LB7224:
	movslq %edx, %r8
	movzwl (%rsi,%r8,2), %r8d
	testw %r8w, %r8w
	je .LB7226
.LB7233:
	cmpw $32, %r8w
	je .LB7226
.LB7242:
	cmpw $9, %r8w
	je .LB7226
.LB7225:
	incl %r13d
	incl %edx
	jmp .LB7224
.LB7226:
	movq %rax, %r14
	movq %r13, %r15
	movq %rcx, -80(%rbp)
	movq %rdx, %r13
.LB7187:
	leaq 1(%r15), %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	xorl %ecx, %ecx
	testl %r15d, %r15d
	cmovg %r15d, %ecx
	shrl $2, %ecx
	xorl %edx, %edx
.LB31955:
	testl %ecx, %ecx
	je .LB31957
.LB31956:
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
	jne .LB31956
	jmp .LB31957
.LB7185:
	incl %eax
	movq %rax, %rcx
	xorl %r15d, %r15d
.LB7191:
	movslq %ecx, %rdx
	movzwl (%rsi,%rdx,2), %edx
	testw %dx, %dx
	je .LB7193
.LB7200:
	cmpw $34, %dx
	je .LB7193
.LB7192:
	incl %r15d
	incl %ecx
	jmp .LB7191
.LB7193:
	leal 1(%rcx), %edx
	movslq %ecx, %r8
	cmpw $34, (%rsi,%r8,2)
	movl %ecx, %r13d
	cmove %edx, %r13d
	movq %rax, %r14
	movq $1, -80(%rbp)
	jmp .LB7187
.LB31957:
.LB7261:
	cmpl %r15d, %edx
	jge .LB7263
.LB7262:
	leal (%r14,%rdx), %ecx
	movslq %ecx, %rcx
	movzwl (%rsi,%rcx,2), %ecx
	movslq %edx, %r8
	movb %cl, (%rax,%r8,1)
	incl %edx
	cmpl %r15d, %edx
	jl .LB7262
.LB7263:
	movslq %r15d, %rcx
	movb $0, (%rax,%rcx,1)
	movslq %r12d, %rcx
	movq %rax, (%rbx,%rcx,8)
	incl %r12d
	movq %r13, %rax
	movq -80(%rbp), %rcx
	jmp .LB7140
.LB7142:
	cmpl $1, %edi
	jg .LB7291
.LB7292:
	callq main__0__ret_intE1
	movl %eax, %esi
.LB7293:
	movslq %edi, %rdi
	xorl %r12d, %r12d
.LB7298:
	cmpq %rdi, %r12
	jge .LB7300
.LB7299:
	movq (%rbx,%r12,8), %rax
	movq %rax, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	incq %r12
	cmpq %rdi, %r12
	jl .LB7299
	jmp .LB7300
.LB7291:
	callq main__0__ret_intE1
	movl %eax, %esi
	jmp .LB7293
.LB7300:
	testl %esi, %esi
	jne .LB7313
.LB7315:
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
.LB7313:
	cmpl $3221225477, %esi
	jne .LB7315
.LB7319:
	movl $1179075923, -66(%rbp)
	movl $1414288705, -62(%rbp)
	movw $10, -58(%rbp)
	leaq -66(%rbp), %rcx
	callq standard__io__console__print__1__byteE1_arr__ret_voidE1
	jmp .LB7315
	.text
	.globl __chkstk
	.def __chkstk;
	.scl 2;
	.type 32;
	.endef
__chkstk:
.LB7003:
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
	.globl standard__sockets__init__0__ret_intE1
	.def standard__sockets__init__0__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__sockets__init__0__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $464, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB7338:
	leaq .LZERO(%rip), %rsi
	leaq -424(%rbp), %rdi
	movl $408, %ecx
	rep movsb
	movzwl standard__sockets__WINSOCK_VERSION(%rip), %eax
	leaq -424(%rbp), %rdx
	movzwl %ax, %ecx
	callq WSAStartup
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__sockets__tcp_socket__0__ret_intE1
	.def standard__sockets__tcp_socket__0__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__sockets__tcp_socket__0__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB7343:
	movl standard__sockets__AF_INET(%rip), %ecx
	movl standard__sockets__SOCK_STREAM(%rip), %edx
	movl standard__sockets__IPPROTO_TCP(%rip), %r8d
	callq socket
	leave
	ret
	.text
	.globl standard__sockets__sock_close__1__intE1__ret_intE1
	.def standard__sockets__sock_close__1__intE1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__sockets__sock_close__1__intE1__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB7348:
	callq closesocket
	leave
	ret
	.text
	.globl standard__sockets__sock_shutdown__1__intE1__ret_intE1
	.def standard__sockets__sock_shutdown__1__intE1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__sockets__sock_shutdown__1__intE1__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB7352:
	movl standard__sockets__SD_BOTH(%rip), %edx
	callq shutdown
	leave
	ret
	.text
	.globl standard__sockets__sock_bind__2__intE1__sockaddr_inE1_ptr1__ret_intE1
	.def standard__sockets__sock_bind__2__intE1__sockaddr_inE1_ptr1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__sockets__sock_bind__2__intE1__sockaddr_inE1_ptr1__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB7357:
	movq %rdx, %rax
	movq %rax, %rdx
	movl $16, %r8d
	callq bind
	leave
	ret
	.text
	.globl standard__sockets__sock_listen__2__intE1__intE1__ret_intE1
	.def standard__sockets__sock_listen__2__intE1__intE1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__sockets__sock_listen__2__intE1__intE1__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB7365:
	callq listen
	leave
	ret
	.text
	.globl standard__sockets__sock_accept__2__intE1__sockaddr_inE1_ptr1__ret_intE1
	.def standard__sockets__sock_accept__2__intE1__sockaddr_inE1_ptr1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__sockets__sock_accept__2__intE1__sockaddr_inE1_ptr1__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
.LB7371:
	leaq -4(%rbp), %r8
	movq %rdx, %rax
	movl $16, -4(%rbp)
	movq %rax, %rdx
	callq accept
	leave
	ret
	.text
	.globl standard__sockets__sock_connect__2__intE1__sockaddr_inE1_ptr1__ret_intE1
	.def standard__sockets__sock_connect__2__intE1__sockaddr_inE1_ptr1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__sockets__sock_connect__2__intE1__sockaddr_inE1_ptr1__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB7380:
	movq %rdx, %rax
	movq %rax, %rdx
	movl $16, %r8d
	callq connect
	leave
	ret
	.text
	.globl standard__sockets__sock_send__3__intE1__byteE1_ptr1__intE1__ret_intE1
	.def standard__sockets__sock_send__3__intE1__byteE1_ptr1__intE1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__sockets__sock_send__3__intE1__byteE1_ptr1__intE1__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB7388:
	xorl %r9d, %r9d
	callq send
	leave
	ret
	.text
	.globl standard__sockets__sock_recv__3__intE1__byteE1_ptr1__intE1__ret_intE1
	.def standard__sockets__sock_recv__3__intE1__byteE1_ptr1__intE1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__sockets__sock_recv__3__intE1__byteE1_ptr1__intE1__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB7396:
	xorl %r9d, %r9d
	callq recv
	leave
	ret
	.text
	.globl standard__sockets__sock_sendto__4__intE1__byteE1_ptr1__intE1__sockaddr_inE1_ptr1__ret_intE1
	.def standard__sockets__sock_sendto__4__intE1__byteE1_ptr1__intE1__sockaddr_inE1_ptr1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__sockets__sock_sendto__4__intE1__byteE1_ptr1__intE1__sockaddr_inE1_ptr1__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
.LB7404:
	movq %r9, %rax
	movq %rax, 32(%rsp)
	movq $16, 40(%rsp)
	xorl %r9d, %r9d
	callq sendto
	leave
	ret
	.text
	.globl standard__sockets__sock_recvfrom__4__intE1__byteE1_ptr1__intE1__sockaddr_inE1_ptr1__ret_intE1
	.def standard__sockets__sock_recvfrom__4__intE1__byteE1_ptr1__intE1__sockaddr_inE1_ptr1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__sockets__sock_recvfrom__4__intE1__byteE1_ptr1__intE1__sockaddr_inE1_ptr1__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rsi, -8(%rbp)
.LB7416:
	leaq -12(%rbp), %rsi
	movq %r9, %rax
	movl $16, -12(%rbp)
	movq %rax, 32(%rsp)
	xorl %r9d, %r9d
	movq %rsi, 40(%rsp)
	callq recvfrom
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl standard__sockets__set_nonblocking__1__intE1__ret_intE1
	.def standard__sockets__set_nonblocking__1__intE1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__sockets__set_nonblocking__1__intE1__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
.LB7429:
	movl $1, -4(%rbp)
	movl standard__sockets__FIONBIO(%rip), %edx
	leaq -4(%rbp), %r8
	callq ioctlsocket
	leave
	ret
	.text
	.globl standard__sockets__set_blocking__1__intE1__ret_intE1
	.def standard__sockets__set_blocking__1__intE1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__sockets__set_blocking__1__intE1__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
.LB7435:
	movl $0, -4(%rbp)
	movl standard__sockets__FIONBIO(%rip), %edx
	leaq -4(%rbp), %r8
	callq ioctlsocket
	leave
	ret
	.text
	.globl standard__sockets__set_reuseaddr__2__intE1__boolE1__ret_intE1
	.def standard__sockets__set_reuseaddr__2__intE1__boolE1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__sockets__set_reuseaddr__2__intE1__boolE1__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rsi, -8(%rbp)
.LB7441:
	movl $1, %eax
	xorl %esi, %esi
	testb %dl, %dl
	cmovne %eax, %esi
	leaq -12(%rbp), %rax
	movl %esi, -12(%rbp)
	movl standard__sockets__SOL_SOCKET(%rip), %edx
	movl standard__sockets__SO_REUSEADDR(%rip), %r8d
	movq $4, 32(%rsp)
	movq %rax, %r9
	callq setsockopt
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl standard__sockets__set_recv_timeout__2__intE1__intE1__ret_intE1
	.def standard__sockets__set_recv_timeout__2__intE1__intE1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__sockets__set_recv_timeout__2__intE1__intE1__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
.LB7455:
	leaq -4(%rbp), %rax
	movl %edx, -4(%rbp)
	movl standard__sockets__SOL_SOCKET(%rip), %edx
	movl standard__sockets__SO_RCVTIMEO(%rip), %r8d
	movq $4, 32(%rsp)
	movq %rax, %r9
	callq setsockopt
	leave
	ret
	.text
	.globl standard__sockets__set_send_timeout__2__intE1__intE1__ret_intE1
	.def standard__sockets__set_send_timeout__2__intE1__intE1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__sockets__set_send_timeout__2__intE1__intE1__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
.LB7463:
	leaq -4(%rbp), %rax
	movl %edx, -4(%rbp)
	movl standard__sockets__SOL_SOCKET(%rip), %edx
	movl standard__sockets__SO_SNDTIMEO(%rip), %r8d
	movq $4, 32(%rsp)
	movq %rax, %r9
	callq setsockopt
	leave
	ret
	.text
	.globl standard__sockets__port_hton__1__dataE1_ubits16__ret_dataE1_ubits16
	.def standard__sockets__port_hton__1__dataE1_ubits16__ret_dataE1_ubits16;
	.scl 2;
	.type 32;
	.endef
standard__sockets__port_hton__1__dataE1_ubits16__ret_dataE1_ubits16:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB7471:
	movzwl %cx, %ecx
	callq htons
	movzwl %ax, %eax
	leave
	ret
	.text
	.globl standard__sockets__port_ntoh__1__dataE1_ubits16__ret_dataE1_ubits16
	.def standard__sockets__port_ntoh__1__dataE1_ubits16__ret_dataE1_ubits16;
	.scl 2;
	.type 32;
	.endef
standard__sockets__port_ntoh__1__dataE1_ubits16__ret_dataE1_ubits16:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB7475:
	movzwl %cx, %ecx
	callq ntohs
	movzwl %ax, %eax
	leave
	ret
	.text
	.globl standard__sockets__ip_from_string__1__byteE1_ptr1__ret_dataE1_ubits32
	.def standard__sockets__ip_from_string__1__byteE1_ptr1__ret_dataE1_ubits32;
	.scl 2;
	.type 32;
	.endef
standard__sockets__ip_from_string__1__byteE1_ptr1__ret_dataE1_ubits32:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB7479:
	callq inet_addr
	leave
	ret
	.text
	.globl standard__sockets__ip_to_string__1__dataE1_ubits32__ret_byteE1_ptr1
	.def standard__sockets__ip_to_string__1__dataE1_ubits32__ret_byteE1_ptr1;
	.scl 2;
	.type 32;
	.endef
standard__sockets__ip_to_string__1__dataE1_ubits32__ret_byteE1_ptr1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB7483:
	callq inet_ntoa
	leave
	ret
	.text
	.globl standard__sockets__sock_wait_readable__2__intE1__intE1__ret_intE1
	.def standard__sockets__sock_wait_readable__2__intE1__intE1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__sockets__sock_wait_readable__2__intE1__intE1__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $592, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB7487:
	movl %ecx, %esi
	leaq -544(%rbp), %rax
	movq %rax, %rdi
	xorl %eax, %eax
	movl $528, %ecx
	rep stosb
	movq .LZERO(%rip), %r10
	movq %r10, -552(%rbp)
	movl $132, %eax
	xorl %ecx, %ecx
.LB31958:
	testq %rax, %rax
	je .LB31960
.LB31959:
	movb $0, -544(%rbp,%rcx,1)
	movb $0, -543(%rbp,%rcx,1)
	movb $0, -542(%rbp,%rcx,1)
	movb $0, -541(%rbp,%rcx,1)
	addq $4, %rcx
	decq %rax
	jne .LB31959
.LB31960:
.LB7498:
	cmpq $528, %rcx
	jge .LB7501
.LB7499:
	movb $0, -544(%rbp,%rcx,1)
	incq %rcx
	cmpq $528, %rcx
	jl .LB7499
.LB7501:
	movb $1, -544(%rbp)
	movabsq $2199023256, %rcx
	movq %rsi, %rax
	andq $255, %rax
	movb %al, -536(%rbp)
	movq %rsi, %rax
	shrq $8, %rax
	andq $255, %rax
	movb %al, -535(%rbp)
	movq %rsi, %rax
	shrq $16, %rax
	andq $255, %rax
	movb %al, -534(%rbp)
	movq %rsi, %rax
	shrq $24, %rax
	andq $255, %rax
	movb %al, -533(%rbp)
	movq %rsi, %rax
	shrq $32, %rax
	andq $255, %rax
	movb %al, -532(%rbp)
	movq %rsi, %rax
	shrq $40, %rax
	andq $255, %rax
	movb %al, -531(%rbp)
	movq %rsi, %rax
	shrq $48, %rax
	andq $255, %rax
	shrq $56, %rsi
	movb %al, -530(%rbp)
	movq %rsi, %rax
	andq $255, %rax
	movb %al, -529(%rbp)
	movslq %edx, %rax
	imulq %rax, %rcx
	sarq $41, %rcx
	shrq $63, %rax
	addl %ecx, %eax
	imull $1000, %eax, %ecx
	subl %ecx, %edx
	imull $1000, %edx, %edx
	movl %eax, %ecx
	andl $255, %ecx
	movb %cl, -552(%rbp)
	movl %edx, %ecx
	andl $255, %ecx
	movb %cl, -548(%rbp)
	movl %eax, %ecx
	sarl $8, %ecx
	xorl %r8d, %r8d
	xorl %r9d, %r9d
	andl $255, %ecx
	movb %cl, -551(%rbp)
	movl %edx, %ecx
	sarl $8, %ecx
	andl $255, %ecx
	movb %cl, -547(%rbp)
	movl %eax, %ecx
	sarl $16, %ecx
	andl $255, %ecx
	movb %cl, -550(%rbp)
	movl %edx, %ecx
	sarl $16, %ecx
	andl $255, %ecx
	sarl $24, %eax
	andl $255, %eax
	sarl $24, %edx
	movb %cl, -546(%rbp)
	xorl %ecx, %ecx
	movb %al, -549(%rbp)
	movl %edx, %eax
	andl $255, %eax
	leaq -544(%rbp), %rdx
	movb %al, -545(%rbp)
	leaq -552(%rbp), %rax
	movq %rax, 32(%rsp)
	callq select
	testl %eax, %eax
	jg .LB7571
.LB7572:
	testl %eax, %eax
	je .LB7576
.LB7577:
	movabsq $4294967295, %rax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB7576:
	xorl %eax, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB7571:
	movl $1, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__sockets__host_resolve_ipv4__2__byteE1_ptr1__dataE1_ptr1_ubits32__ret_boolE1
	.def standard__sockets__host_resolve_ipv4__2__byteE1_ptr1__dataE1_ptr1_ubits32__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__sockets__host_resolve_ipv4__2__byteE1_ptr1__dataE1_ptr1_ubits32__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $112, %rsp
	movq %rsi, -8(%rbp)
.LB7580:
	movq %rdx, %rsi
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -72(%rbp)
	vmovdqu .LZERO+32(%rip), %ymm15
	vmovdqu %ymm15, -40(%rbp)
	vzeroupper
	movq $0, -80(%rbp)
	movl $16, %eax
	xorl %edx, %edx
.LB31961:
	testq %rax, %rax
	je .LB31963
.LB31962:
	movb $0, -72(%rbp,%rdx,1)
	movb $0, -71(%rbp,%rdx,1)
	movb $0, -70(%rbp,%rdx,1)
	movb $0, -69(%rbp,%rdx,1)
	addq $4, %rdx
	decq %rax
	jne .LB31962
.LB31963:
.LB7592:
	cmpq $64, %rdx
	jge .LB7595
.LB7593:
	movb $0, -72(%rbp,%rdx,1)
	incq %rdx
	cmpq $64, %rdx
	jl .LB7593
.LB7595:
	movb $2, -68(%rbp)
	movb $1, -64(%rbp)
	leaq -72(%rbp), %r8
	leaq -80(%rbp), %r9
	xorl %edx, %edx
	callq getaddrinfo
	testl %eax, %eax
	jne .LB7614
.LB7615:
	movq -80(%rbp), %rax
	testq %rax, %rax
	je .LB7623
.LB7624:
	leaq 32(%rax), %rcx
	movq (%rcx), %rcx
	testq %rcx, %rcx
	je .LB7638
.LB7639:
	movzbl 4(%rcx), %eax
	movzbl 5(%rcx), %edx
	movzbl %al, %eax
	movzbl %dl, %edx
	shll $8, %edx
	orl %edx, %eax
	movzbl 6(%rcx), %edx
	movzbl 7(%rcx), %ecx
	movzbl %dl, %edx
	movzbl %cl, %ecx
	shll $16, %edx
	orl %edx, %eax
	shll $24, %ecx
	orl %ecx, %eax
	movl %eax, (%rsi)
	movq -80(%rbp), %rcx
	callq freeaddrinfo
	movl $1, %eax
	movq -8(%rbp), %rsi
	leave
	ret
.LB7638:
	movq %rax, %rcx
	callq freeaddrinfo
	xorl %eax, %eax
	movq -8(%rbp), %rsi
	leave
	ret
.LB7623:
	xorl %eax, %eax
	movq -8(%rbp), %rsi
	leave
	ret
.LB7614:
	xorl %eax, %eax
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl standard__sockets__socket.is_open__0__ret_boolE1
	.def standard__sockets__socket.is_open__0__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__sockets__socket.is_open__0__ret_boolE1:
.LB7857:
	xorl %eax, %eax
	cmpl $0, (%rcx)
	setge %al
	ret
	.text
	.globl standard__sockets__socket.close__0__ret_boolE1
	.def standard__sockets__socket.close__0__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__sockets__socket.close__0__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
.LB7861:
	movq %rcx, %rsi
	cmpl $0, (%rsi)
	jl .LB7864
.LB7865:
	cmpl $0, 4(%rsi)
	je .LB7870
.LB7871:
	movl (%rsi), %ecx
	callq standard__sockets__udp_close__1__intE1__ret_intE1
	movl $4294967295, (%rsi)
	movb $0, 13(%rsi)
	movl $1, %eax
	movq -8(%rbp), %rsi
	leave
	ret
.LB7870:
	movl (%rsi), %ecx
	callq standard__sockets__tcp_close__1__intE1__ret_intE1
	movl $4294967295, (%rsi)
	movb $0, 13(%rsi)
	movl $1, %eax
	movq -8(%rbp), %rsi
	leave
	ret
.LB7864:
	xorl %eax, %eax
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl standard__sockets__socket.bind__1__dataE1_ubits16__ret_boolE1
	.def standard__sockets__socket.bind__1__dataE1_ubits16__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__sockets__socket.bind__1__dataE1_ubits16__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
.LB7882:
	movq %rcx, %rsi
	movl %edx, %edi
	cmpl $0, (%rsi)
	jl .LB7886
.LB7887:
	movl (%rsi), %ecx
	movl $1, %edx
	callq standard__sockets__set_reuseaddr__2__intE1__boolE1__ret_intE1
	leaq 16(%rsi), %rbx
	movl standard__sockets__INADDR_ANY(%rip), %edx
	movzwl %di, %r8d
	movq %rbx, %rcx
	callq standard__sockets__init_sockaddr__3__sockaddr_inE1_ptr1__dataE1_ubits32__dataE1_ubits16__ret_voidE1
	movl (%rsi), %ecx
	movq %rbx, %rdx
	callq standard__sockets__sock_bind__2__intE1__sockaddr_inE1_ptr1__ret_intE1
	testl %eax, %eax
	js .LB7903
.LB7904:
	movb $1, 12(%rsi)
	movl $1, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB7903:
	movl $2, 8(%rsi)
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB7886:
	movl $1, 8(%rsi)
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__sockets__socket.listen__1__intE1__ret_boolE1
	.def standard__sockets__socket.listen__1__intE1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__sockets__socket.listen__1__intE1__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
.LB7908:
	movq %rcx, %rsi
	cmpl $0, (%rsi)
	jl .LB7918
.LB7912:
	cmpl $0, 4(%rsi)
	jne .LB7918
.LB7919:
	cmpb $0, 12(%rsi)
	je .LB7925
.LB7926:
	movl (%rsi), %ecx
	callq standard__sockets__sock_listen__2__intE1__intE1__ret_intE1
	testl %eax, %eax
	js .LB7936
.LB7937:
	movl $1, %eax
	movq -8(%rbp), %rsi
	leave
	ret
.LB7936:
	movl $4, 8(%rsi)
	xorl %eax, %eax
	movq -8(%rbp), %rsi
	leave
	ret
.LB7925:
	movl $4, 8(%rsi)
	xorl %eax, %eax
	movq -8(%rbp), %rsi
	leave
	ret
.LB7918:
	movl $1, 8(%rsi)
	xorl %eax, %eax
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl standard__sockets__socket.accept__0__ret_socketE1
	.def standard__sockets__socket.accept__0__ret_socketE1;
	.scl 2;
	.type 32;
	.endef
standard__sockets__socket.accept__0__ret_socketE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $368, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB7940:
	movq %rcx, %rsi
	cmpl $0, (%rdx)
	jl .LB7949
.LB7943:
	cmpl $0, 4(%rdx)
	jne .LB7949
.LB7950:
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -32(%rbp)
	movl (%rdx), %ecx
	leaq -32(%rbp), %rdx
	callq standard__sockets__tcp_server_accept__2__intE1__sockaddr_inE1_ptr1__ret_intE1
	movl %eax, %edi
	testl %edi, %edi
	js .LB7965
.LB7966:
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -80(%rbp)
	movups .LZERO+32(%rip), %xmm15
	movups %xmm15, -48(%rbp)
	vzeroupper
	leaq -80(%rbp), %rcx
	xorl %edx, %edx
	callq standard__sockets__socket.__init__1__intE1__ret_thisE1
	movl %edi, -80(%rbp)
	movb $1, -67(%rbp)
	movb $0, -68(%rbp)
	movups -32(%rbp), %xmm15
	movups %xmm15, -96(%rbp)
	movups -96(%rbp), %xmm15
	movups %xmm15, -48(%rbp)
	movl $0, -72(%rbp)
	vmovdqu -80(%rbp), %ymm15
	vmovdqu %ymm15, -144(%rbp)
	movups -48(%rbp), %xmm15
	movups %xmm15, -112(%rbp)
	vzeroupper
	vmovdqu -144(%rbp), %ymm15
	vmovdqu %ymm15, (%rsi)
	movups -112(%rbp), %xmm15
	movups %xmm15, 32(%rsi)
	vzeroupper
	movq %rsi, %rax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB7965:
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -192(%rbp)
	movups .LZERO+32(%rip), %xmm15
	movups %xmm15, -160(%rbp)
	vzeroupper
	leaq -192(%rbp), %rcx
	xorl %edx, %edx
	callq standard__sockets__socket.__init__1__intE1__ret_thisE1
	movl $4294967295, -192(%rbp)
	movl $1, -184(%rbp)
	vmovdqu -192(%rbp), %ymm15
	vmovdqu %ymm15, -240(%rbp)
	movups -160(%rbp), %xmm15
	movups %xmm15, -208(%rbp)
	vzeroupper
	vmovdqu -240(%rbp), %ymm15
	vmovdqu %ymm15, (%rsi)
	movups -208(%rbp), %xmm15
	movups %xmm15, 32(%rsi)
	vzeroupper
	movq %rsi, %rax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB7949:
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -288(%rbp)
	movups .LZERO+32(%rip), %xmm15
	movups %xmm15, -256(%rbp)
	vzeroupper
	leaq -288(%rbp), %rcx
	xorl %edx, %edx
	callq standard__sockets__socket.__init__1__intE1__ret_thisE1
	movl $4294967295, -288(%rbp)
	movl $1, -280(%rbp)
	vmovdqu -288(%rbp), %ymm15
	vmovdqu %ymm15, -336(%rbp)
	movups -256(%rbp), %xmm15
	movups %xmm15, -304(%rbp)
	vzeroupper
	vmovdqu -336(%rbp), %ymm15
	vmovdqu %ymm15, (%rsi)
	movups -304(%rbp), %xmm15
	movups %xmm15, 32(%rsi)
	vzeroupper
	movq %rsi, %rax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__sockets__socket.connect__2__byteE1_ptr1__dataE1_ubits16__ret_boolE1
	.def standard__sockets__socket.connect__2__byteE1_ptr1__dataE1_ubits16__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__sockets__socket.connect__2__byteE1_ptr1__dataE1_ubits16__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB7984:
	movq %rcx, %rsi
	cmpl $0, (%rsi)
	jl .LB7995
.LB7989:
	cmpl $0, 4(%rsi)
	jne .LB7995
.LB7996:
	leaq 32(%rsi), %rdi
	movzwl %r8w, %r8d
	movq %rdi, %rcx
	callq standard__sockets__init_sockaddr_str__3__sockaddr_inE1_ptr1__byteE1_ptr1__dataE1_ubits16__ret_voidE1
	movl (%rsi), %ecx
	movq %rdi, %rdx
	callq standard__sockets__sock_connect__2__intE1__sockaddr_inE1_ptr1__ret_intE1
	testl %eax, %eax
	js .LB8009
.LB8010:
	movb $1, 13(%rsi)
	movl $1, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB8009:
	movl $3, 8(%rsi)
	xorl %eax, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB7995:
	movl $1, 8(%rsi)
	xorl %eax, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__sockets__socket.send__2__byteE1_ptr1__intE1__ret_intE1
	.def standard__sockets__socket.send__2__byteE1_ptr1__intE1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__sockets__socket.send__2__byteE1_ptr1__intE1__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
.LB8014:
	movq %rcx, %rsi
	cmpl $0, (%rsi)
	jl .LB8019
.LB8020:
	cmpl $0, 4(%rsi)
	jne .LB8034
.LB8027:
	cmpb $0, 13(%rsi)
	je .LB8033
.LB8034:
	movl (%rsi), %ecx
	callq standard__sockets__sock_send__3__intE1__byteE1_ptr1__intE1__ret_intE1
	testl %eax, %eax
	js .LB8046
.LB8047:
	movq -8(%rbp), %rsi
	leave
	ret
.LB8046:
	movl $5, 8(%rsi)
	movq -8(%rbp), %rsi
	leave
	ret
.LB8033:
	movl $5, 8(%rsi)
	movabsq $4294967295, %rax
	movq -8(%rbp), %rsi
	leave
	ret
.LB8019:
	movl $1, 8(%rsi)
	movabsq $4294967295, %rax
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl standard__sockets__socket.recv__2__byteE1_ptr1__intE1__ret_intE1
	.def standard__sockets__socket.recv__2__byteE1_ptr1__intE1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__sockets__socket.recv__2__byteE1_ptr1__intE1__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
.LB8051:
	movq %rcx, %rsi
	cmpl $0, (%rsi)
	jl .LB8056
.LB8057:
	movl (%rsi), %ecx
	callq standard__sockets__sock_recv__3__intE1__byteE1_ptr1__intE1__ret_intE1
	testl %eax, %eax
	js .LB8069
.LB8070:
	movq -8(%rbp), %rsi
	leave
	ret
.LB8069:
	movl $6, 8(%rsi)
	movq -8(%rbp), %rsi
	leave
	ret
.LB8056:
	movl $1, 8(%rsi)
	movabsq $4294967295, %rax
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl standard__sockets__socket.sendto__4__byteE1_ptr1__intE1__byteE1_ptr1__dataE1_ubits16__ret_intE1
	.def standard__sockets__socket.sendto__4__byteE1_ptr1__intE1__byteE1_ptr1__dataE1_ubits16__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__sockets__socket.sendto__4__byteE1_ptr1__intE1__byteE1_ptr1__dataE1_ubits16__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
.LB8074:
	movq %rcx, %rsi
	movl 48(%rbp), %eax
	cmpl $0, (%rsi)
	jl .LB8087
.LB8081:
	cmpl $1, 4(%rsi)
	jne .LB8087
.LB8088:
	movl (%rsi), %ecx
	movzwl %ax, %eax
	movq %rax, 32(%rsp)
	callq standard__sockets__udp_send__5__intE1__byteE1_ptr1__intE1__byteE1_ptr1__dataE1_ubits16__ret_intE1
	testl %eax, %eax
	js .LB8102
.LB8103:
	movq -8(%rbp), %rsi
	leave
	ret
.LB8102:
	movl $5, 8(%rsi)
	movq -8(%rbp), %rsi
	leave
	ret
.LB8087:
	movl $7, 8(%rsi)
	movabsq $4294967295, %rax
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl standard__sockets__socket.recvfrom__3__byteE1_ptr1__intE1__sockaddr_inE1_ptr1__ret_intE1
	.def standard__sockets__socket.recvfrom__3__byteE1_ptr1__intE1__sockaddr_inE1_ptr1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__sockets__socket.recvfrom__3__byteE1_ptr1__intE1__sockaddr_inE1_ptr1__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
.LB8107:
	movq %rcx, %rsi
	cmpl $0, (%rsi)
	jl .LB8119
.LB8113:
	cmpl $1, 4(%rsi)
	jne .LB8119
.LB8120:
	movl (%rsi), %ecx
	callq standard__sockets__udp_recv__4__intE1__byteE1_ptr1__intE1__sockaddr_inE1_ptr1__ret_intE1
	testl %eax, %eax
	js .LB8134
.LB8135:
	movq -8(%rbp), %rsi
	leave
	ret
.LB8134:
	movl $6, 8(%rsi)
	movq -8(%rbp), %rsi
	leave
	ret
.LB8119:
	movl $7, 8(%rsi)
	movabsq $4294967295, %rax
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl standard__sockets__socket.set_nonblocking__1__boolE1__ret_boolE1
	.def standard__sockets__socket.set_nonblocking__1__boolE1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__sockets__socket.set_nonblocking__1__boolE1__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB8139:
	cmpl $0, (%rcx)
	jl .LB8143
.LB8144:
	testb %dl, %dl
	jne .LB8148
.LB8149:
	movl (%rcx), %ecx
	callq standard__sockets__set_blocking__1__intE1__ret_intE1
.LB8150:
	xorl %ecx, %ecx
	testl %eax, %eax
	sete %cl
	movl %ecx, %eax
	leave
	ret
.LB8148:
	movl (%rcx), %ecx
	callq standard__sockets__set_nonblocking__1__intE1__ret_intE1
	jmp .LB8150
.LB8143:
	xorl %eax, %eax
	leave
	ret
	.text
	.globl standard__sockets__socket.set_reuseaddr__1__boolE1__ret_boolE1
	.def standard__sockets__socket.set_reuseaddr__1__boolE1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__sockets__socket.set_reuseaddr__1__boolE1__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB8159:
	cmpl $0, (%rcx)
	jl .LB8163
.LB8164:
	movl (%rcx), %ecx
	movzbl %dl, %edx
	callq standard__sockets__set_reuseaddr__2__intE1__boolE1__ret_intE1
	xorl %ecx, %ecx
	testl %eax, %eax
	sete %cl
	movl %ecx, %eax
	leave
	ret
.LB8163:
	xorl %eax, %eax
	leave
	ret
	.text
	.globl standard__sockets__socket.set_recv_timeout__1__intE1__ret_boolE1
	.def standard__sockets__socket.set_recv_timeout__1__intE1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__sockets__socket.set_recv_timeout__1__intE1__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB8171:
	cmpl $0, (%rcx)
	jl .LB8175
.LB8176:
	movl (%rcx), %ecx
	callq standard__sockets__set_recv_timeout__2__intE1__intE1__ret_intE1
	xorl %ecx, %ecx
	testl %eax, %eax
	sete %cl
	movl %ecx, %eax
	leave
	ret
.LB8175:
	xorl %eax, %eax
	leave
	ret
	.text
	.globl standard__sockets__socket.set_send_timeout__1__intE1__ret_boolE1
	.def standard__sockets__socket.set_send_timeout__1__intE1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__sockets__socket.set_send_timeout__1__intE1__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB8183:
	cmpl $0, (%rcx)
	jl .LB8187
.LB8188:
	movl (%rcx), %ecx
	callq standard__sockets__set_send_timeout__2__intE1__intE1__ret_intE1
	xorl %ecx, %ecx
	testl %eax, %eax
	sete %cl
	movl %ecx, %eax
	leave
	ret
.LB8187:
	xorl %eax, %eax
	leave
	ret
	.text
	.globl standard__sockets__socket.__init__1__intE1__ret_thisE1
	.def standard__sockets__socket.__init__1__intE1__ret_thisE1;
	.scl 2;
	.type 32;
	.endef
standard__sockets__socket.__init__1__intE1__ret_thisE1:
.LB7850:
	movq %rcx, %rax
	movl %edx, 4(%rax)
	movw $0, 12(%rax)
	movl $0, 8(%rax)
	ret
	.text
	.globl standard__sockets__socket.__exit__0__ret_voidE1
	.def standard__sockets__socket.__exit__0__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__sockets__socket.__exit__0__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB8195:
	callq standard__sockets__socket.close__0__ret_boolE1
	leave
	ret
	.text
	.globl standard__sockets__init_sockaddr__3__sockaddr_inE1_ptr1__dataE1_ubits32__dataE1_ubits16__ret_voidE1
	.def standard__sockets__init_sockaddr__3__sockaddr_inE1_ptr1__dataE1_ubits32__dataE1_ubits16__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__sockets__init_sockaddr__3__sockaddr_inE1_ptr1__dataE1_ubits32__dataE1_ubits16__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB7666:
	movl standard__sockets__AF_INET(%rip), %eax
	movq %rcx, %rsi
	movl %edx, %edi
	movzwl %r8w, %ecx
	movw %ax, (%rsi)
	callq standard__sockets__port_hton__1__dataE1_ubits16__ret_dataE1_ubits16
	movzwl %ax, %eax
	movw %ax, 2(%rsi)
	movl %edi, 4(%rsi)
	movl $0, 8(%rsi)
	movl $0, 12(%rsi)
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__sockets__init_sockaddr_str__3__sockaddr_inE1_ptr1__byteE1_ptr1__dataE1_ubits16__ret_voidE1
	.def standard__sockets__init_sockaddr_str__3__sockaddr_inE1_ptr1__byteE1_ptr1__dataE1_ubits16__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__sockets__init_sockaddr_str__3__sockaddr_inE1_ptr1__byteE1_ptr1__dataE1_ubits16__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB7694:
	movq %rcx, %rsi
	movq %rdx, %rcx
	movl %r8d, %edi
	callq standard__sockets__ip_from_string__1__byteE1_ptr1__ret_dataE1_ubits32
	movl %eax, %edx
	movzwl %di, %r8d
	movq %rsi, %rcx
	callq standard__sockets__init_sockaddr__3__sockaddr_inE1_ptr1__dataE1_ubits32__dataE1_ubits16__ret_voidE1
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__sockets__get_ip_string__1__sockaddr_inE1_ptr1__ret_byteE1_ptr1
	.def standard__sockets__get_ip_string__1__sockaddr_inE1_ptr1__ret_byteE1_ptr1;
	.scl 2;
	.type 32;
	.endef
standard__sockets__get_ip_string__1__sockaddr_inE1_ptr1__ret_byteE1_ptr1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB7703:
	movl 4(%rcx), %ecx
	callq standard__sockets__ip_to_string__1__dataE1_ubits32__ret_byteE1_ptr1
	leave
	ret
	.text
	.globl standard__sockets__get_port__1__sockaddr_inE1_ptr1__ret_dataE1_ubits16
	.def standard__sockets__get_port__1__sockaddr_inE1_ptr1__ret_dataE1_ubits16;
	.scl 2;
	.type 32;
	.endef
standard__sockets__get_port__1__sockaddr_inE1_ptr1__ret_dataE1_ubits16:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB7710:
	movzwl 2(%rcx), %eax
	movzwl %ax, %ecx
	callq standard__sockets__port_ntoh__1__dataE1_ubits16__ret_dataE1_ubits16
	movzwl %ax, %eax
	leave
	ret
	.text
	.globl standard__sockets__tcp_server_accept__2__intE1__sockaddr_inE1_ptr1__ret_intE1
	.def standard__sockets__tcp_server_accept__2__intE1__sockaddr_inE1_ptr1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__sockets__tcp_server_accept__2__intE1__sockaddr_inE1_ptr1__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB7717:
	callq standard__sockets__sock_accept__2__intE1__sockaddr_inE1_ptr1__ret_intE1
	leave
	ret
	.text
	.globl standard__sockets__tcp_connect_host__2__byteE1_ptr1__dataE1_ubits16__ret_intE1
	.def standard__sockets__tcp_connect_host__2__byteE1_ptr1__dataE1_ubits16__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__sockets__tcp_connect_host__2__byteE1_ptr1__dataE1_ubits16__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $80, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB7724:
	movl %edx, %esi
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -32(%rbp)
	movl $0, -36(%rbp)
	leaq -36(%rbp), %rdx
	callq standard__sockets__host_resolve_ipv4__2__byteE1_ptr1__dataE1_ptr1_ubits32__ret_boolE1
	testb %al, %al
	je .LB7733
.LB7734:
	callq standard__sockets__tcp_socket__0__ret_intE1
	movl %eax, %edi
	testl %edi, %edi
	js .LB7740
.LB7741:
	movl -36(%rbp), %edx
	leaq -32(%rbp), %rcx
	movzwl %si, %r8d
	callq standard__sockets__init_sockaddr__3__sockaddr_inE1_ptr1__dataE1_ubits32__dataE1_ubits16__ret_voidE1
	leaq -32(%rbp), %rdx
	movq %rdi, %rcx
	callq standard__sockets__sock_connect__2__intE1__sockaddr_inE1_ptr1__ret_intE1
	testl %eax, %eax
	js .LB7749
.LB7750:
	movl %edi, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB7749:
	movq %rdi, %rcx
	callq standard__sockets__sock_close__1__intE1__ret_intE1
	movabsq $4294967295, %rax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB7740:
	movabsq $4294967295, %rax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB7733:
	movabsq $4294967295, %rax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__sockets__tcp_send_all__3__intE1__byteE1_ptr1__intE1__ret_intE1
	.def standard__sockets__tcp_send_all__3__intE1__byteE1_ptr1__intE1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__sockets__tcp_send_all__3__intE1__byteE1_ptr1__intE1__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
.LB7756:
	movl %ecx, %esi
	movq %rdx, %rdi
	movl %r8d, %ebx
	xorl %r12d, %r12d
.LB7762:
	cmpl %ebx, %r12d
	jge .LB7764
.LB7763:
	movslq %r12d, %rax
	leaq (%rdi,%rax,1), %rdx
	movl %ebx, %r8d
	subl %r12d, %r8d
	movq %rsi, %rcx
	callq standard__sockets__sock_send__3__intE1__byteE1_ptr1__intE1__ret_intE1
	testl %eax, %eax
	jle .LB7778
.LB7779:
	addl %eax, %r12d
	cmpl %ebx, %r12d
	jl .LB7763
.LB7764:
	movl %r12d, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB7778:
	movabsq $4294967295, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
	.text
	.globl standard__sockets__tcp_recv_all__3__intE1__byteE1_ptr1__intE1__ret_intE1
	.def standard__sockets__tcp_recv_all__3__intE1__byteE1_ptr1__intE1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__sockets__tcp_recv_all__3__intE1__byteE1_ptr1__intE1__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
.LB7786:
	movl %ecx, %esi
	movq %rdx, %rdi
	movl %r8d, %ebx
	xorl %r12d, %r12d
.LB7792:
	cmpl %ebx, %r12d
	jge .LB7794
.LB7793:
	movslq %r12d, %rax
	leaq (%rdi,%rax,1), %rdx
	movl %ebx, %r8d
	subl %r12d, %r8d
	movq %rsi, %rcx
	callq standard__sockets__sock_recv__3__intE1__byteE1_ptr1__intE1__ret_intE1
	testl %eax, %eax
	jle .LB7808
.LB7809:
	addl %eax, %r12d
	cmpl %ebx, %r12d
	jl .LB7793
.LB7794:
	movl %r12d, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB7808:
	movabsq $4294967295, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
	.text
	.globl standard__sockets__tcp_close__1__intE1__ret_intE1
	.def standard__sockets__tcp_close__1__intE1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__sockets__tcp_close__1__intE1__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
.LB7816:
	movl %ecx, %esi
	movq %rsi, %rcx
	callq standard__sockets__sock_shutdown__1__intE1__ret_intE1
	movq %rsi, %rcx
	callq standard__sockets__sock_close__1__intE1__ret_intE1
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl standard__sockets__udp_send__5__intE1__byteE1_ptr1__intE1__byteE1_ptr1__dataE1_ubits16__ret_intE1
	.def standard__sockets__udp_send__5__intE1__byteE1_ptr1__intE1__byteE1_ptr1__dataE1_ubits16__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__sockets__udp_send__5__intE1__byteE1_ptr1__intE1__byteE1_ptr1__dataE1_ubits16__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $80, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
.LB7822:
	movl 48(%rbp), %eax
	movl %ecx, %esi
	movq %rdx, %rdi
	movl %r8d, %ebx
	movq %r9, %rdx
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -40(%rbp)
	leaq -40(%rbp), %rcx
	movzwl %ax, %r8d
	callq standard__sockets__init_sockaddr_str__3__sockaddr_inE1_ptr1__byteE1_ptr1__dataE1_ubits16__ret_voidE1
	leaq -40(%rbp), %r9
	movq %rsi, %rcx
	movq %rdi, %rdx
	movq %rbx, %r8
	callq standard__sockets__sock_sendto__4__intE1__byteE1_ptr1__intE1__sockaddr_inE1_ptr1__ret_intE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__sockets__udp_recv__4__intE1__byteE1_ptr1__intE1__sockaddr_inE1_ptr1__ret_intE1
	.def standard__sockets__udp_recv__4__intE1__byteE1_ptr1__intE1__sockaddr_inE1_ptr1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__sockets__udp_recv__4__intE1__byteE1_ptr1__intE1__sockaddr_inE1_ptr1__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB7835:
	callq standard__sockets__sock_recvfrom__4__intE1__byteE1_ptr1__intE1__sockaddr_inE1_ptr1__ret_intE1
	leave
	ret
	.text
	.globl standard__sockets__udp_close__1__intE1__ret_intE1
	.def standard__sockets__udp_close__1__intE1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__sockets__udp_close__1__intE1__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB7846:
	callq standard__sockets__sock_close__1__intE1__ret_intE1
	leave
	ret
	.text
	.globl standard__math__max__2__dataE1_sbits8__dataE1_sbits8__ret_dataE1_sbits8
	.def standard__math__max__2__dataE1_sbits8__dataE1_sbits8__ret_dataE1_sbits8;
	.scl 2;
	.type 32;
	.endef
standard__math__max__2__dataE1_sbits8__dataE1_sbits8__ret_dataE1_sbits8:
.LB8197:
	cmpb %dl, %cl
	jg .LB8203
.LB8204:
	movzbl %dl, %eax
	ret
.LB8203:
	movzbl %cl, %eax
	ret
	.text
	.globl standard__math__max__2__dataE1_sbits16__dataE1_sbits16__ret_dataE1_sbits16
	.def standard__math__max__2__dataE1_sbits16__dataE1_sbits16__ret_dataE1_sbits16;
	.scl 2;
	.type 32;
	.endef
standard__math__max__2__dataE1_sbits16__dataE1_sbits16__ret_dataE1_sbits16:
.LB8208:
	cmpw %dx, %cx
	jg .LB8214
.LB8215:
	movzwl %dx, %eax
	ret
.LB8214:
	movzwl %cx, %eax
	ret
	.text
	.globl standard__math__max__2__dataE1_sbits32__dataE1_sbits32__ret_dataE1_sbits32
	.def standard__math__max__2__dataE1_sbits32__dataE1_sbits32__ret_dataE1_sbits32;
	.scl 2;
	.type 32;
	.endef
standard__math__max__2__dataE1_sbits32__dataE1_sbits32__ret_dataE1_sbits32:
.LB8219:
	cmpl %edx, %ecx
	jg .LB8225
.LB8226:
	movl %edx, %eax
	ret
.LB8225:
	movl %ecx, %eax
	ret
	.text
	.globl standard__math__max__2__dataE1_sbits64__dataE1_sbits64__ret_dataE1_sbits64
	.def standard__math__max__2__dataE1_sbits64__dataE1_sbits64__ret_dataE1_sbits64;
	.scl 2;
	.type 32;
	.endef
standard__math__max__2__dataE1_sbits64__dataE1_sbits64__ret_dataE1_sbits64:
.LB8230:
	cmpq %rdx, %rcx
	jg .LB8236
.LB8237:
	movq %rdx, %rax
	ret
.LB8236:
	movq %rcx, %rax
	ret
	.text
	.globl standard__math__max__2__floatE1__floatE1__ret_floatE1
	.def standard__math__max__2__floatE1__floatE1__ret_floatE1;
	.scl 2;
	.type 32;
	.endef
standard__math__max__2__floatE1__floatE1__ret_floatE1:
.LB8241:
	ucomiss %xmm1, %xmm0
	ja .LB8247
.LB8248:
	movaps %xmm1, %xmm0
	ret
.LB8247:
	ret
	.text
	.globl standard__math__max__2__doubleE1__doubleE1__ret_doubleE1
	.def standard__math__max__2__doubleE1__doubleE1__ret_doubleE1;
	.scl 2;
	.type 32;
	.endef
standard__math__max__2__doubleE1__doubleE1__ret_doubleE1:
.LB8252:
	ucomisd %xmm1, %xmm0
	ja .LB8258
.LB8259:
	movaps %xmm1, %xmm0
	ret
.LB8258:
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
.LB8263:
	movsbl %cl, %eax
	testb %cl, %cl
	jle .LB8268
.LB8269:
	cmpb $1, %cl
	je .LB8275
.LB8276:
	movl %eax, %edx
	sarl $31, %edx
	movl %eax, %edx
	shrl $31, %edx
	addl %edx, %eax
	sarl $1, %eax
	movl %eax, %esi
	movq %rcx, %rax
.LB8286:
	cmpb %al, %sil
	je .LB8288
.LB8292:
	cmpb %al, %sil
	jge .LB8288
.LB8287:
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
	jne .LB8292
.LB8288:
	movzbl %sil, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB8275:
	movl $1, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB8268:
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
.LB8308:
	movswl %cx, %eax
	testw %cx, %cx
	jle .LB8313
.LB8314:
	cmpw $1, %cx
	je .LB8320
.LB8321:
	movl %eax, %edx
	sarl $31, %edx
	movl %eax, %edx
	shrl $31, %edx
	addl %edx, %eax
	sarl $1, %eax
	movl %eax, %esi
	movq %rcx, %rax
.LB8331:
	cmpw %ax, %si
	je .LB8333
.LB8337:
	cmpw %ax, %si
	jge .LB8333
.LB8332:
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
	jne .LB8337
.LB8333:
	movzwl %si, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB8320:
	movl $1, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB8313:
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
.LB8353:
	testl %ecx, %ecx
	jle .LB8357
.LB8358:
	movl %ecx, %eax
	sarl $31, %eax
	movl %ecx, %eax
	shrl $31, %eax
	addl %ecx, %eax
	sarl $1, %eax
	movl %eax, %esi
	movq %rcx, %rax
.LB8365:
	cmpl %eax, %esi
	je .LB8367
.LB8371:
	cmpl %eax, %esi
	jge .LB8367
.LB8366:
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
	jne .LB8371
.LB8367:
	movl %esi, %eax
	movq 0(%rsp), %rsi
	addq $16, %rsp
	ret
.LB8357:
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
.LB8385:
	testq %rcx, %rcx
	jle .LB8390
.LB8391:
	cmpq $1, %rcx
	je .LB8397
.LB8398:
	movl $2, %esi
	movq %rcx, %rax
	cqto
	idivq %rsi
	movq %rax, %rsi
	movq %rcx, %rax
.LB8407:
	cmpq %rax, %rsi
	je .LB8409
.LB8413:
	cmpq %rax, %rsi
	jge .LB8409
.LB8408:
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
	jne .LB8413
.LB8409:
	movq %rsi, %rax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB8397:
	movl $1, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB8390:
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
.LB8428:
	testb %cl, %cl
	jbe .LB8433
.LB8434:
	movq %rcx, %rsi
	xorl %eax, %eax
.LB8440:
	cmpb %al, %sil
	je .LB8442
.LB8441:
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
	jne .LB8441
.LB8442:
	movzbl %sil, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB8433:
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
.LB8456:
	testw %cx, %cx
	jbe .LB8461
.LB8462:
	movq %rcx, %rsi
	xorl %eax, %eax
.LB8468:
	cmpw %ax, %si
	je .LB8470
.LB8469:
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
	jne .LB8469
.LB8470:
	movzwl %si, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB8461:
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
.LB8484:
	testl %ecx, %ecx
	jbe .LB8488
.LB8489:
	movq %rcx, %rsi
	xorl %eax, %eax
.LB8494:
	cmpl %eax, %esi
	je .LB8496
.LB8495:
	movl %ecx, %eax
	xorl %edx, %edx
	divl %esi
	addl %esi, %eax
	shrl $1, %eax
	movq %rsi, %r11
	movq %rax, %rsi
	movq %r11, %rax
	cmpl %eax, %esi
	jne .LB8495
.LB8496:
	movl %esi, %eax
	movq 0(%rsp), %rsi
	addq $16, %rsp
	ret
.LB8488:
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
.LB8508:
	testq %rcx, %rcx
	jbe .LB8513
.LB8514:
	movq %rcx, %rsi
	xorl %eax, %eax
.LB8520:
	cmpq %rax, %rsi
	je .LB8522
.LB8521:
	movq %rcx, %rax
	xorl %edx, %edx
	divq %rsi
	addq %rsi, %rax
	shrq $1, %rax
	movq %rsi, %r11
	movq %rax, %rsi
	movq %r11, %rax
	cmpq %rax, %rsi
	jne .LB8521
.LB8522:
	movq %rsi, %rax
	movq 0(%rsp), %rsi
	addq $16, %rsp
	ret
.LB8513:
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
.LB8535:
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
.LB8541:
	movaps %xmm0, %xmm1
	sqrtsd %xmm1, %xmm0
	ret
	.text
	.globl standard__math__floor__1__floatE1__ret_floatE1
	.def standard__math__floor__1__floatE1__ret_floatE1;
	.scl 2;
	.type 32;
	.endef
standard__math__floor__1__floatE1__ret_floatE1:
.LB8547:
	xorps %xmm1, %xmm1
	cvttss2siq %xmm0, %rax
	ucomiss %xmm1, %xmm0
	jae .LB8561
.LB8554:
	xorps %xmm1, %xmm1
	cvtsi2ssq %rax, %xmm1
	ucomiss %xmm1, %xmm0
	sete %cl
	setnp %dl
	movzbl %cl, %ecx
	movzbl %dl, %edx
	andl %edx, %ecx
	testb %cl, %cl
	jne .LB8561
.LB8562:
	decq %rax
	xorps %xmm0, %xmm0
	cvtsi2ssq %rax, %xmm0
	ret
.LB8561:
	xorps %xmm0, %xmm0
	cvtsi2ssq %rax, %xmm0
	ret
	.text
	.globl standard__math__ceil__1__floatE1__ret_floatE1
	.def standard__math__ceil__1__floatE1__ret_floatE1;
	.scl 2;
	.type 32;
	.endef
standard__math__ceil__1__floatE1__ret_floatE1:
.LB8570:
	xorps %xmm1, %xmm1
	cvttss2siq %xmm0, %rax
	ucomiss %xmm0, %xmm1
	jae .LB8584
.LB8577:
	xorps %xmm1, %xmm1
	cvtsi2ssq %rax, %xmm1
	ucomiss %xmm1, %xmm0
	sete %cl
	setnp %dl
	movzbl %cl, %ecx
	movzbl %dl, %edx
	andl %edx, %ecx
	testb %cl, %cl
	jne .LB8584
.LB8585:
	incq %rax
	xorps %xmm0, %xmm0
	cvtsi2ssq %rax, %xmm0
	ret
.LB8584:
	xorps %xmm0, %xmm0
	cvtsi2ssq %rax, %xmm0
	ret
	.text
	.globl standard__math__round__1__floatE1__ret_floatE1
	.def standard__math__round__1__floatE1__ret_floatE1;
	.scl 2;
	.type 32;
	.endef
standard__math__round__1__floatE1__ret_floatE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB8593:
	xorps %xmm1, %xmm1
	ucomiss %xmm1, %xmm0
	jae .LB8597
.LB8598:
	movabsq $1056964608, %r10
	movq %r10, %xmm1
	subss %xmm1, %xmm0
	callq standard__math__ceil__1__floatE1__ret_floatE1
	leave
	ret
.LB8597:
	movabsq $1056964608, %r10
	movq %r10, %xmm1
	addss %xmm1, %xmm0
	callq standard__math__floor__1__floatE1__ret_floatE1
	leave
	ret
	.text
	.globl standard__math__floor__1__doubleE1__ret_doubleE1
	.def standard__math__floor__1__doubleE1__ret_doubleE1;
	.scl 2;
	.type 32;
	.endef
standard__math__floor__1__doubleE1__ret_doubleE1:
.LB8606:
	xorps %xmm1, %xmm1
	cvttsd2siq %xmm0, %rax
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm1, %xmm0
	jae .LB8621
.LB8614:
	xorps %xmm1, %xmm1
	cvtsi2sdq %rax, %xmm1
	ucomisd %xmm1, %xmm0
	sete %cl
	setnp %dl
	movzbl %cl, %ecx
	movzbl %dl, %edx
	andl %edx, %ecx
	testb %cl, %cl
	jne .LB8621
.LB8622:
	decq %rax
	xorps %xmm0, %xmm0
	cvtsi2sdq %rax, %xmm0
	ret
.LB8621:
	xorps %xmm0, %xmm0
	cvtsi2sdq %rax, %xmm0
	ret
	.text
	.globl standard__math__ceil__1__doubleE1__ret_doubleE1
	.def standard__math__ceil__1__doubleE1__ret_doubleE1;
	.scl 2;
	.type 32;
	.endef
standard__math__ceil__1__doubleE1__ret_doubleE1:
.LB8630:
	xorps %xmm1, %xmm1
	cvttsd2siq %xmm0, %rax
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm0, %xmm1
	jae .LB8645
.LB8638:
	xorps %xmm1, %xmm1
	cvtsi2sdq %rax, %xmm1
	ucomisd %xmm1, %xmm0
	sete %cl
	setnp %dl
	movzbl %cl, %ecx
	movzbl %dl, %edx
	andl %edx, %ecx
	testb %cl, %cl
	jne .LB8645
.LB8646:
	incq %rax
	xorps %xmm0, %xmm0
	cvtsi2sdq %rax, %xmm0
	ret
.LB8645:
	xorps %xmm0, %xmm0
	cvtsi2sdq %rax, %xmm0
	ret
	.text
	.globl standard__math__round__1__doubleE1__ret_doubleE1
	.def standard__math__round__1__doubleE1__ret_doubleE1;
	.scl 2;
	.type 32;
	.endef
standard__math__round__1__doubleE1__ret_doubleE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB8654:
	xorps %xmm1, %xmm1
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm1, %xmm0
	jae .LB8659
.LB8660:
	movabsq $1056964608, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	subsd %xmm1, %xmm0
	callq standard__math__ceil__1__doubleE1__ret_doubleE1
	leave
	ret
.LB8659:
	movabsq $1056964608, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	addsd %xmm1, %xmm0
	callq standard__math__floor__1__doubleE1__ret_doubleE1
	leave
	ret
	.text
	.globl standard__math__floor__1__dataE1_sbits8__ret_dataE1_sbits8
	.def standard__math__floor__1__dataE1_sbits8__ret_dataE1_sbits8;
	.scl 2;
	.type 32;
	.endef
standard__math__floor__1__dataE1_sbits8__ret_dataE1_sbits8:
.LB8670:
	movzbl %cl, %eax
	ret
	.text
	.globl standard__math__floor__1__dataE1_sbits16__ret_dataE1_sbits16
	.def standard__math__floor__1__dataE1_sbits16__ret_dataE1_sbits16;
	.scl 2;
	.type 32;
	.endef
standard__math__floor__1__dataE1_sbits16__ret_dataE1_sbits16:
.LB8673:
	movzwl %cx, %eax
	ret
	.text
	.globl standard__math__floor__1__dataE1_sbits32__ret_dataE1_sbits32
	.def standard__math__floor__1__dataE1_sbits32__ret_dataE1_sbits32;
	.scl 2;
	.type 32;
	.endef
standard__math__floor__1__dataE1_sbits32__ret_dataE1_sbits32:
.LB8676:
	movl %ecx, %eax
	ret
	.text
	.globl standard__math__floor__1__dataE1_sbits64__ret_dataE1_sbits64
	.def standard__math__floor__1__dataE1_sbits64__ret_dataE1_sbits64;
	.scl 2;
	.type 32;
	.endef
standard__math__floor__1__dataE1_sbits64__ret_dataE1_sbits64:
.LB8679:
	movq %rcx, %rax
	ret
	.text
	.globl standard__math__ceil__1__dataE1_sbits8__ret_dataE1_sbits8
	.def standard__math__ceil__1__dataE1_sbits8__ret_dataE1_sbits8;
	.scl 2;
	.type 32;
	.endef
standard__math__ceil__1__dataE1_sbits8__ret_dataE1_sbits8:
.LB8682:
	movzbl %cl, %eax
	ret
	.text
	.globl standard__math__ceil__1__dataE1_sbits16__ret_dataE1_sbits16
	.def standard__math__ceil__1__dataE1_sbits16__ret_dataE1_sbits16;
	.scl 2;
	.type 32;
	.endef
standard__math__ceil__1__dataE1_sbits16__ret_dataE1_sbits16:
.LB8685:
	movzwl %cx, %eax
	ret
	.text
	.globl standard__math__ceil__1__dataE1_sbits32__ret_dataE1_sbits32
	.def standard__math__ceil__1__dataE1_sbits32__ret_dataE1_sbits32;
	.scl 2;
	.type 32;
	.endef
standard__math__ceil__1__dataE1_sbits32__ret_dataE1_sbits32:
.LB8688:
	movl %ecx, %eax
	ret
	.text
	.globl standard__math__ceil__1__dataE1_sbits64__ret_dataE1_sbits64
	.def standard__math__ceil__1__dataE1_sbits64__ret_dataE1_sbits64;
	.scl 2;
	.type 32;
	.endef
standard__math__ceil__1__dataE1_sbits64__ret_dataE1_sbits64:
.LB8691:
	movq %rcx, %rax
	ret
	.text
	.globl standard__math__round__1__dataE1_sbits8__ret_dataE1_sbits8
	.def standard__math__round__1__dataE1_sbits8__ret_dataE1_sbits8;
	.scl 2;
	.type 32;
	.endef
standard__math__round__1__dataE1_sbits8__ret_dataE1_sbits8:
.LB8694:
	movzbl %cl, %eax
	ret
	.text
	.globl standard__math__round__1__dataE1_sbits16__ret_dataE1_sbits16
	.def standard__math__round__1__dataE1_sbits16__ret_dataE1_sbits16;
	.scl 2;
	.type 32;
	.endef
standard__math__round__1__dataE1_sbits16__ret_dataE1_sbits16:
.LB8697:
	movzwl %cx, %eax
	ret
	.text
	.globl standard__math__round__1__dataE1_sbits32__ret_dataE1_sbits32
	.def standard__math__round__1__dataE1_sbits32__ret_dataE1_sbits32;
	.scl 2;
	.type 32;
	.endef
standard__math__round__1__dataE1_sbits32__ret_dataE1_sbits32:
.LB8700:
	movl %ecx, %eax
	ret
	.text
	.globl standard__math__round__1__dataE1_sbits64__ret_dataE1_sbits64
	.def standard__math__round__1__dataE1_sbits64__ret_dataE1_sbits64;
	.scl 2;
	.type 32;
	.endef
standard__math__round__1__dataE1_sbits64__ret_dataE1_sbits64:
.LB8703:
	movq %rcx, %rax
	ret
	.text
	.globl standard__math___sin_kernel__1__doubleE1__ret_doubleE1
	.def standard__math___sin_kernel__1__doubleE1__ret_doubleE1;
	.scl 2;
	.type 32;
	.endef
standard__math___sin_kernel__1__doubleE1__ret_doubleE1:
	subq $32, %rsp
.LB8706:
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
.LB8739:
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
.LB8771:
	xorps %xmm1, %xmm1
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm0, %xmm1
	ja .LB8777
.LB8778:
.LB8779:
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
.LB8777:
	xorps %xmm1, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subsd %xmm15, %xmm0
	jmp .LB8779
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
.LB8808:
	movl $0, -12(%rbp)
	xorps %xmm1, %xmm1
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm0, %xmm1
	seta %sil
	movzbl %sil, %esi
	testb %sil, %sil
	jne .LB8817
.LB8818:
.LB8819:
	movabsq $1061752795, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm0, %xmm1
	jae .LB8825
.LB8826:
	leaq -12(%rbp), %rdx
	callq standard__math___trig_reduce__2__doubleE1__dataE1_ptr1_sbits32__ret_doubleE1
	movl -12(%rbp), %eax
	andl $3, %eax
	je .LB8842
	cmpl $1, %eax
	je .LB8843
	cmpl $2, %eax
	jne .LB8845
.LB8844:
	callq standard__math___sin_kernel__1__doubleE1__ret_doubleE1
	xorps %xmm1, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subsd %xmm15, %xmm0
.LB8841:
	testb %sil, %sil
	jne .LB8857
.LB8858:
	movq -8(%rbp), %rsi
	leave
	ret
.LB8817:
	xorps %xmm1, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subsd %xmm15, %xmm0
	jmp .LB8819
.LB8843:
	callq standard__math___cos_kernel__1__doubleE1__ret_doubleE1
	testb %sil, %sil
	jne .LB8857
	jmp .LB8858
.LB8842:
	callq standard__math___sin_kernel__1__doubleE1__ret_doubleE1
	testb %sil, %sil
	jne .LB8857
	jmp .LB8858
.LB8845:
	callq standard__math___cos_kernel__1__doubleE1__ret_doubleE1
	xorps %xmm1, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subsd %xmm15, %xmm0
	testb %sil, %sil
	je .LB8858
.LB8857:
	xorps %xmm1, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subsd %xmm15, %xmm0
	movq -8(%rbp), %rsi
	leave
	ret
.LB8825:
	callq standard__math___sin_kernel__1__doubleE1__ret_doubleE1
	testb %sil, %sil
	jne .LB8831
.LB8832:
	movq -8(%rbp), %rsi
	leave
	ret
.LB8831:
	xorps %xmm1, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subsd %xmm15, %xmm0
	movq -8(%rbp), %rsi
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
.LB8863:
	cvtss2sd %xmm0, %xmm0
	callq standard__math__sin__1__doubleE1__ret_doubleE1
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
.LB8999:
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
.LB8869:
	movabsq $1144091160, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm1, %xmm0
	ja .LB8874
.LB8875:
	xorps %xmm1, %xmm1
	movabsq $1144670343, %r10
	movq %r10, %xmm2
	subss %xmm2, %xmm1
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm0, %xmm1
	ja .LB8881
.LB8882:
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
	jae .LB8898
.LB8899:
	movabsq $1056964608, %r10
	movq %r10, %xmm3
	cvtss2sd %xmm3, %xmm3
	subsd %xmm3, %xmm2
	cvttsd2siq %xmm2, %rax
	movl %eax, %eax
.LB8900:
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
	je .LB8962
.LB8963:
	movq $0, -8(%rsp)
	leaq (%rsp), %rcx
	movq (%rcx), %rcx
	movq %rcx, -8(%rsp)
	shrq $52, %rcx
	andq $2047, %rcx
	movslq %eax, %rax
	addq %rax, %rcx
	testq %rcx, %rcx
	jle .LB8981
.LB8982:
	cmpq $2047, %rcx
	jge .LB8988
.LB8989:
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
.LB8898:
	movabsq $1056964608, %r10
	movq %r10, %xmm3
	cvtss2sd %xmm3, %xmm3
	addsd %xmm3, %xmm2
	cvttsd2siq %xmm2, %rax
	movl %eax, %eax
	jmp .LB8900
.LB8988:
	movabsq $9218868437227405311, %r10
	movq %r10, %xmm0
	addq $16, %rsp
	ret
.LB8981:
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	addq $16, %rsp
	ret
.LB8962:
	addq $16, %rsp
	ret
.LB8881:
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	addq $16, %rsp
	ret
.LB8874:
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
.LB9122:
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
.LB9005:
	xorps %xmm1, %xmm1
	movsd %xmm0, (%rsp)
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm0, %xmm1
	jae .LB9010
.LB9011:
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
	ja .LB9034
.LB9035:
.LB9036:
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
.LB9034:
	movabsq $1073741824, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	mulsd %xmm1, %xmm0
	decl %ecx
	jmp .LB9036
.LB9010:
	xorps %xmm0, %xmm0
	movabsq $9218868437227405311, %r10
	movq %r10, %xmm1
	subsd %xmm1, %xmm0
	addq $16, %rsp
	ret
	.text
	.globl standard__math__pow__2__dataE1_sbits8__dataE1_sbits8__ret_dataE1_sbits8
	.def standard__math__pow__2__dataE1_sbits8__dataE1_sbits8__ret_dataE1_sbits8;
	.scl 2;
	.type 32;
	.endef
standard__math__pow__2__dataE1_sbits8__dataE1_sbits8__ret_dataE1_sbits8:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
	movq %rdi, -8(%rsp)
.LB9128:
	testb %dl, %dl
	je .LB9134
.LB9135:
	testb %dl, %dl
	js .LB9141
.LB9142:
	movl $1, %eax
.LB9147:
	testb %dl, %dl
	je .LB9149
.LB9148:
	movzbl %dl, %esi
	andl $1, %esi
	movl %eax, %edi
	imull %ecx, %edi
	testl %esi, %esi
	cmovne %edi, %eax
	imull %ecx, %ecx
	movsbl %dl, %edx
	sarl $1, %edx
	testb %dl, %dl
	jne .LB9148
.LB9149:
	movzbl %al, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB9141:
	xorl %eax, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB9134:
	movl $1, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
	.text
	.globl standard__math__pow__2__dataE1_sbits16__dataE1_sbits16__ret_dataE1_sbits16
	.def standard__math__pow__2__dataE1_sbits16__dataE1_sbits16__ret_dataE1_sbits16;
	.scl 2;
	.type 32;
	.endef
standard__math__pow__2__dataE1_sbits16__dataE1_sbits16__ret_dataE1_sbits16:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
	movq %rdi, -8(%rsp)
.LB9169:
	testw %dx, %dx
	je .LB9175
.LB9176:
	testw %dx, %dx
	js .LB9182
.LB9183:
	movl $1, %eax
.LB9188:
	testw %dx, %dx
	je .LB9190
.LB9189:
	movzwl %dx, %esi
	andl $1, %esi
	movl %eax, %edi
	imull %ecx, %edi
	testl %esi, %esi
	cmovne %edi, %eax
	imull %ecx, %ecx
	movswl %dx, %edx
	sarl $1, %edx
	testw %dx, %dx
	jne .LB9189
.LB9190:
	movzwl %ax, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB9182:
	xorl %eax, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB9175:
	movl $1, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
	.text
	.globl standard__math__pow__2__dataE1_sbits32__dataE1_sbits32__ret_dataE1_sbits32
	.def standard__math__pow__2__dataE1_sbits32__dataE1_sbits32__ret_dataE1_sbits32;
	.scl 2;
	.type 32;
	.endef
standard__math__pow__2__dataE1_sbits32__dataE1_sbits32__ret_dataE1_sbits32:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
	movq %rdi, -8(%rsp)
.LB9210:
	testl %edx, %edx
	je .LB9215
.LB9216:
	testl %edx, %edx
	js .LB9220
.LB9221:
	movl $1, %eax
.LB9224:
	testl %edx, %edx
	je .LB9226
.LB9225:
	movl %edx, %esi
	andl $1, %esi
	movl %eax, %edi
	imull %ecx, %edi
	testl %esi, %esi
	cmovne %edi, %eax
	imull %ecx, %ecx
	sarl $1, %edx
	testl %edx, %edx
	jne .LB9225
.LB9226:
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB9220:
	xorl %eax, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB9215:
	movl $1, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
	.text
	.globl standard__math__pow__2__dataE1_sbits64__dataE1_sbits64__ret_dataE1_sbits64
	.def standard__math__pow__2__dataE1_sbits64__dataE1_sbits64__ret_dataE1_sbits64;
	.scl 2;
	.type 32;
	.endef
standard__math__pow__2__dataE1_sbits64__dataE1_sbits64__ret_dataE1_sbits64:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
	movq %rdi, -8(%rsp)
.LB9244:
	testq %rdx, %rdx
	je .LB9250
.LB9251:
	testq %rdx, %rdx
	js .LB9257
.LB9258:
	movl $1, %eax
.LB9263:
	testq %rdx, %rdx
	je .LB9265
.LB9264:
	movq %rdx, %rsi
	andq $1, %rsi
	movq %rax, %rdi
	imulq %rcx, %rdi
	testq %rsi, %rsi
	cmovne %rdi, %rax
	imulq %rcx, %rcx
	sarq $1, %rdx
	testq %rdx, %rdx
	jne .LB9264
.LB9265:
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB9257:
	xorl %eax, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB9250:
	movl $1, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
	.text
	.globl standard__math__pow__2__floatE1__floatE1__ret_floatE1
	.def standard__math__pow__2__floatE1__floatE1__ret_floatE1;
	.scl 2;
	.type 32;
	.endef
standard__math__pow__2__floatE1__floatE1__ret_floatE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
.LB9285:
	movsd %xmm1, -8(%rbp)
	xorps %xmm1, %xmm1
	ucomiss %xmm1, %xmm0
	sete %al
	setnp %cl
	movzbl %al, %eax
	movzbl %cl, %ecx
	andl %ecx, %eax
	testb %al, %al
	je .LB9296
.LB9290:
	movsd -8(%rbp), %xmm2
	xorps %xmm1, %xmm1
	ucomiss %xmm1, %xmm2
	sete %al
	setnp %cl
	movzbl %al, %eax
	movzbl %cl, %ecx
	andl %ecx, %eax
	testb %al, %al
	jne .LB9295
.LB9296:
	xorps %xmm1, %xmm1
	ucomiss %xmm0, %xmm1
	jae .LB9300
.LB9301:
	callq standard__math__log__1__floatE1__ret_floatE1
	movsd -8(%rbp), %xmm1
	mulss %xmm1, %xmm0
	callq standard__math__exp__1__floatE1__ret_floatE1
	leave
	ret
.LB9300:
	xorps %xmm0, %xmm0
	leave
	ret
.LB9295:
	movabsq $1065353216, %r10
	movq %r10, %xmm0
	leave
	ret
	.text
	.globl standard__math__pow__2__doubleE1__doubleE1__ret_doubleE1
	.def standard__math__pow__2__doubleE1__doubleE1__ret_doubleE1;
	.scl 2;
	.type 32;
	.endef
standard__math__pow__2__doubleE1__doubleE1__ret_doubleE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
.LB9308:
	movsd %xmm1, -8(%rbp)
	xorps %xmm1, %xmm1
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm1, %xmm0
	sete %al
	setnp %cl
	movzbl %al, %eax
	movzbl %cl, %ecx
	andl %ecx, %eax
	testb %al, %al
	je .LB9321
.LB9314:
	xorps %xmm1, %xmm1
	movsd -8(%rbp), %xmm2
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm1, %xmm2
	sete %al
	setnp %cl
	movzbl %al, %eax
	movzbl %cl, %ecx
	andl %ecx, %eax
	testb %al, %al
	jne .LB9320
.LB9321:
	xorps %xmm1, %xmm1
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm0, %xmm1
	jae .LB9327
.LB9328:
	callq standard__math__log__1__doubleE1__ret_doubleE1
	movsd -8(%rbp), %xmm1
	mulsd %xmm1, %xmm0
	callq standard__math__exp__1__doubleE1__ret_doubleE1
	leave
	ret
.LB9327:
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	leave
	ret
.LB9320:
	movabsq $1065353216, %r10
	movq %r10, %xmm0
	cvtss2sd %xmm0, %xmm0
	leave
	ret
	.text
	.globl standard__math__tgamma__1__floatE1__ret_floatE1
	.def standard__math__tgamma__1__floatE1__ret_floatE1;
	.scl 2;
	.type 32;
	.endef
standard__math__tgamma__1__floatE1__ret_floatE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $112, %rsp
.LB9336:
	xorps %xmm1, %xmm1
	movsd %xmm0, -32(%rbp)
	ucomiss %xmm0, %xmm1
	jae .LB9340
.LB9341:
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -24(%rbp)
	movq .LZERO+16(%rip), %r10
	movq %r10, -8(%rbp)
	movabsq $1065353216, %r10
	movq %r10, %xmm0
	xorl %eax, %eax
	movslq %eax, %rax
	xorps %xmm1, %xmm1
	cvtsi2ssq %rax, %xmm1
	movl $1, %eax
	movss %xmm0, -24(%rbp)
	xorps %xmm0, %xmm0
	movslq %eax, %rax
	movss %xmm0, -20(%rbp)
	xorps %xmm0, %xmm0
	movss %xmm0, -16(%rbp)
	xorps %xmm0, %xmm0
	movss %xmm0, -12(%rbp)
	xorps %xmm0, %xmm0
	movss %xmm0, -8(%rbp)
	xorps %xmm0, %xmm0
	movss %xmm0, -4(%rbp)
	movabsq $4617025246891868160, %r10
	movq %r10, %xmm0
	cvtsd2ss %xmm0, %xmm0
	movsd %xmm0, -40(%rbp)
	movss -24(%rbp), %xmm0
	movsd -32(%rbp), %xmm2
	addss %xmm2, %xmm1
	xorps %xmm2, %xmm2
	cvtsi2ssq %rax, %xmm2
	movl $2, %eax
	movslq %eax, %rax
	divss %xmm1, %xmm0
	xorps %xmm1, %xmm1
	addss %xmm1, %xmm0
	movss -20(%rbp), %xmm1
	movsd -32(%rbp), %xmm3
	addss %xmm3, %xmm2
	divss %xmm2, %xmm1
	xorps %xmm2, %xmm2
	cvtsi2ssq %rax, %xmm2
	movl $3, %eax
	movslq %eax, %rax
	addss %xmm1, %xmm0
	movss -16(%rbp), %xmm1
	movsd -32(%rbp), %xmm3
	addss %xmm3, %xmm2
	divss %xmm2, %xmm1
	xorps %xmm2, %xmm2
	cvtsi2ssq %rax, %xmm2
	addss %xmm1, %xmm0
	movss -12(%rbp), %xmm1
	movsd -32(%rbp), %xmm3
	addss %xmm3, %xmm2
	divss %xmm2, %xmm1
	addss %xmm1, %xmm0
	movl $4, %eax
	movss -8(%rbp), %xmm1
	movsd -32(%rbp), %xmm3
	movslq %eax, %rax
	xorps %xmm2, %xmm2
	cvtsi2ssq %rax, %xmm2
	movl $5, %eax
	movslq %eax, %rax
	addss %xmm3, %xmm2
	divss %xmm2, %xmm1
	xorps %xmm2, %xmm2
	cvtsi2ssq %rax, %xmm2
	addss %xmm1, %xmm0
	movss -4(%rbp), %xmm1
	movsd -32(%rbp), %xmm3
	addss %xmm3, %xmm2
	divss %xmm2, %xmm1
	addss %xmm1, %xmm0
	movabsq $1073741824, %r10
	movq %r10, %xmm1
	movsd %xmm0, -48(%rbp)
	movss standard__math__PIF(%rip), %xmm0
	mulss %xmm1, %xmm0
	callq standard__math__sqrt__1__floatE1__ret_floatE1
	movabsq $1056964608, %r10
	movq %r10, %xmm2
	movsd %xmm0, -56(%rbp)
	movsd -32(%rbp), %xmm0
	movsd -40(%rbp), %xmm1
	addss %xmm0, %xmm1
	movsd %xmm1, -64(%rbp)
	subss %xmm2, %xmm1
	movabsq $1056964608, %r10
	movq %r10, %xmm2
	movaps %xmm2, %xmm15
	movaps %xmm0, %xmm2
	subss %xmm15, %xmm2
	movaps %xmm1, %xmm0
	movaps %xmm2, %xmm1
	callq standard__math__pow__2__floatE1__floatE1__ret_floatE1
	movsd -56(%rbp), %xmm1
	mulss %xmm1, %xmm0
	movsd %xmm0, -72(%rbp)
	movabsq $1056964608, %r10
	movq %r10, %xmm0
	movsd -64(%rbp), %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subss %xmm15, %xmm0
	xorps %xmm1, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subss %xmm15, %xmm0
	callq standard__math__exp__1__floatE1__ret_floatE1
	movsd -72(%rbp), %xmm1
	mulss %xmm1, %xmm0
	movsd -48(%rbp), %xmm1
	mulss %xmm1, %xmm0
	leave
	ret
.LB9340:
	xorps %xmm0, %xmm0
	leave
	ret
	.text
	.globl standard__math__tgamma__1__doubleE1__ret_doubleE1
	.def standard__math__tgamma__1__doubleE1__ret_doubleE1;
	.scl 2;
	.type 32;
	.endef
standard__math__tgamma__1__doubleE1__ret_doubleE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $128, %rsp
.LB9392:
	xorps %xmm1, %xmm1
	movsd %xmm0, -56(%rbp)
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm0, %xmm1
	jae .LB9397
.LB9398:
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -48(%rbp)
	movups .LZERO+32(%rip), %xmm15
	movups %xmm15, -16(%rbp)
	vzeroupper
	movabsq $1065353216, %r10
	movq %r10, %xmm0
	xorl %eax, %eax
	movslq %eax, %rax
	xorps %xmm2, %xmm2
	cvtsi2sdq %rax, %xmm2
	movl $1, %eax
	cvtss2sd %xmm0, %xmm0
	movslq %eax, %rax
	movsd %xmm0, -48(%rbp)
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, -40(%rbp)
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, -32(%rbp)
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, -24(%rbp)
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, -16(%rbp)
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, -8(%rbp)
	movsd -48(%rbp), %xmm1
	movsd -56(%rbp), %xmm3
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	addsd %xmm3, %xmm2
	divsd %xmm2, %xmm1
	xorps %xmm2, %xmm2
	cvtsi2sdq %rax, %xmm2
	movl $2, %eax
	movslq %eax, %rax
	addsd %xmm1, %xmm0
	movsd -40(%rbp), %xmm1
	movsd -56(%rbp), %xmm3
	addsd %xmm3, %xmm2
	divsd %xmm2, %xmm1
	xorps %xmm2, %xmm2
	cvtsi2sdq %rax, %xmm2
	movl $3, %eax
	movslq %eax, %rax
	addsd %xmm1, %xmm0
	movsd -32(%rbp), %xmm1
	movsd -56(%rbp), %xmm3
	addsd %xmm3, %xmm2
	divsd %xmm2, %xmm1
	xorps %xmm2, %xmm2
	cvtsi2sdq %rax, %xmm2
	addsd %xmm1, %xmm0
	movsd -24(%rbp), %xmm1
	movsd -56(%rbp), %xmm3
	movl $4, %eax
	movslq %eax, %rax
	addsd %xmm3, %xmm2
	divsd %xmm2, %xmm1
	xorps %xmm2, %xmm2
	cvtsi2sdq %rax, %xmm2
	movl $5, %eax
	movslq %eax, %rax
	addsd %xmm1, %xmm0
	movsd -16(%rbp), %xmm1
	movsd -56(%rbp), %xmm3
	addsd %xmm3, %xmm2
	divsd %xmm2, %xmm1
	xorps %xmm2, %xmm2
	cvtsi2sdq %rax, %xmm2
	addsd %xmm1, %xmm0
	movsd -8(%rbp), %xmm1
	movsd -56(%rbp), %xmm3
	addsd %xmm3, %xmm2
	divsd %xmm2, %xmm1
	addsd %xmm1, %xmm0
	movabsq $1073741824, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	movsd %xmm0, -64(%rbp)
	movsd standard__math__PID(%rip), %xmm0
	mulsd %xmm1, %xmm0
	callq standard__math__sqrt__1__doubleE1__ret_doubleE1
	movsd %xmm0, -72(%rbp)
	movsd -56(%rbp), %xmm1
	movabsq $4617025246891868160, %r10
	movq %r10, %xmm0
	addsd %xmm1, %xmm0
	movabsq $1056964608, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	movsd %xmm0, -80(%rbp)
	movsd -56(%rbp), %xmm2
	subsd %xmm1, %xmm0
	movabsq $1056964608, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	movaps %xmm1, %xmm15
	movaps %xmm2, %xmm1
	subsd %xmm15, %xmm1
	callq standard__math__pow__2__doubleE1__doubleE1__ret_doubleE1
	movsd -72(%rbp), %xmm1
	mulsd %xmm1, %xmm0
	movsd %xmm0, -88(%rbp)
	movabsq $1056964608, %r10
	movq %r10, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd -80(%rbp), %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subsd %xmm15, %xmm0
	xorps %xmm1, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subsd %xmm15, %xmm0
	callq standard__math__exp__1__doubleE1__ret_doubleE1
	movsd -88(%rbp), %xmm1
	mulsd %xmm1, %xmm0
	movsd -64(%rbp), %xmm1
	mulsd %xmm1, %xmm0
	leave
	ret
.LB9397:
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	leave
	ret
	.text
	.globl standard__math__rotr__2__dataE1_sbits8__dataE1_sbits8__ret_dataE1_sbits8
	.def standard__math__rotr__2__dataE1_sbits8__dataE1_sbits8__ret_dataE1_sbits8;
	.scl 2;
	.type 32;
	.endef
standard__math__rotr__2__dataE1_sbits8__dataE1_sbits8__ret_dataE1_sbits8:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
.LB9460:
	movzbl %dl, %eax
	andl $7, %eax
	movsbl %cl, %edx
	sarx %eax, %edx, %edx
	movsbl %al, %eax
	movl $8, %esi
	negl %eax
	addl %esi, %eax
	shlx %eax, %ecx, %ecx
	orl %ecx, %edx
	movzbl %dl, %eax
	movq 0(%rsp), %rsi
	addq $16, %rsp
	ret
	.text
	.globl standard__math__rotr__2__dataE1_sbits16__dataE1_sbits16__ret_dataE1_sbits16
	.def standard__math__rotr__2__dataE1_sbits16__dataE1_sbits16__ret_dataE1_sbits16;
	.scl 2;
	.type 32;
	.endef
standard__math__rotr__2__dataE1_sbits16__dataE1_sbits16__ret_dataE1_sbits16:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
.LB9477:
	movzwl %dx, %eax
	andl $15, %eax
	movswl %cx, %edx
	sarx %eax, %edx, %edx
	movswl %ax, %eax
	movl $16, %esi
	negl %eax
	addl %esi, %eax
	shlx %eax, %ecx, %ecx
	orl %ecx, %edx
	movzwl %dx, %eax
	movq 0(%rsp), %rsi
	addq $16, %rsp
	ret
	.text
	.globl standard__math__rotr__2__dataE1_sbits32__dataE1_sbits32__ret_dataE1_sbits32
	.def standard__math__rotr__2__dataE1_sbits32__dataE1_sbits32__ret_dataE1_sbits32;
	.scl 2;
	.type 32;
	.endef
standard__math__rotr__2__dataE1_sbits32__dataE1_sbits32__ret_dataE1_sbits32:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
.LB9494:
	andl $31, %edx
	sarx %edx, %ecx, %eax
	movl $32, %esi
	subl %edx, %esi
	shlx %esi, %ecx, %ecx
	orl %ecx, %eax
	movq 0(%rsp), %rsi
	addq $16, %rsp
	ret
	.text
	.globl standard__math__rotr__2__dataE1_sbits64__dataE1_sbits64__ret_dataE1_sbits64
	.def standard__math__rotr__2__dataE1_sbits64__dataE1_sbits64__ret_dataE1_sbits64;
	.scl 2;
	.type 32;
	.endef
standard__math__rotr__2__dataE1_sbits64__dataE1_sbits64__ret_dataE1_sbits64:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
.LB9507:
	andq $63, %rdx
	sarx %rdx, %rcx, %rax
	movl $64, %esi
	subq %rdx, %rsi
	shlx %rsi, %rcx, %rcx
	orq %rcx, %rax
	movq 0(%rsp), %rsi
	addq $16, %rsp
	ret
	.text
	.globl standard__math__sign__1__dataE1_sbits8__ret_dataE1_sbits8
	.def standard__math__sign__1__dataE1_sbits8__ret_dataE1_sbits8;
	.scl 2;
	.type 32;
	.endef
standard__math__sign__1__dataE1_sbits8__ret_dataE1_sbits8:
.LB9522:
	testb %cl, %cl
	jg .LB9527
.LB9528:
	testb %cl, %cl
	js .LB9534
.LB9535:
	xorl %eax, %eax
	ret
.LB9534:
	movl $255, %eax
	ret
.LB9527:
	movl $1, %eax
	ret
	.text
	.globl standard__math__sign__1__dataE1_sbits16__ret_dataE1_sbits16
	.def standard__math__sign__1__dataE1_sbits16__ret_dataE1_sbits16;
	.scl 2;
	.type 32;
	.endef
standard__math__sign__1__dataE1_sbits16__ret_dataE1_sbits16:
.LB9540:
	testw %cx, %cx
	jg .LB9545
.LB9546:
	testw %cx, %cx
	js .LB9552
.LB9553:
	xorl %eax, %eax
	ret
.LB9552:
	movl $65535, %eax
	ret
.LB9545:
	movl $1, %eax
	ret
	.text
	.globl standard__math__sign__1__dataE1_sbits32__ret_dataE1_sbits32
	.def standard__math__sign__1__dataE1_sbits32__ret_dataE1_sbits32;
	.scl 2;
	.type 32;
	.endef
standard__math__sign__1__dataE1_sbits32__ret_dataE1_sbits32:
.LB9558:
	testl %ecx, %ecx
	jg .LB9562
.LB9563:
	testl %ecx, %ecx
	js .LB9567
.LB9568:
	xorl %eax, %eax
	ret
.LB9567:
	movabsq $4294967295, %rax
	ret
.LB9562:
	movl $1, %eax
	ret
	.text
	.globl standard__math__sign__1__dataE1_sbits64__ret_dataE1_sbits64
	.def standard__math__sign__1__dataE1_sbits64__ret_dataE1_sbits64;
	.scl 2;
	.type 32;
	.endef
standard__math__sign__1__dataE1_sbits64__ret_dataE1_sbits64:
.LB9571:
	testq %rcx, %rcx
	jg .LB9576
.LB9577:
	testq %rcx, %rcx
	js .LB9583
.LB9584:
	xorl %eax, %eax
	ret
.LB9583:
	movq $-1, %rax
	ret
.LB9576:
	movl $1, %eax
	ret
	.text
	.globl standard__math__sign__1__floatE1__ret_floatE1
	.def standard__math__sign__1__floatE1__ret_floatE1;
	.scl 2;
	.type 32;
	.endef
standard__math__sign__1__floatE1__ret_floatE1:
.LB9589:
	xorps %xmm1, %xmm1
	ucomiss %xmm1, %xmm0
	ja .LB9593
.LB9594:
	xorps %xmm1, %xmm1
	ucomiss %xmm0, %xmm1
	ja .LB9598
.LB9599:
	xorps %xmm0, %xmm0
	ret
.LB9598:
	xorps %xmm0, %xmm0
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	subss %xmm1, %xmm0
	ret
.LB9593:
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
.LB9602:
	xorps %xmm1, %xmm1
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm1, %xmm0
	ja .LB9607
.LB9608:
	xorps %xmm1, %xmm1
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm0, %xmm1
	ja .LB9614
.LB9615:
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	ret
.LB9614:
	xorps %xmm0, %xmm0
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	subss %xmm1, %xmm0
	cvtss2sd %xmm0, %xmm0
	ret
.LB9607:
	movabsq $1065353216, %r10
	movq %r10, %xmm0
	cvtss2sd %xmm0, %xmm0
	ret
	.text
	.globl standard__math__remainder__2__floatE1__floatE1__ret_floatE1
	.def standard__math__remainder__2__floatE1__floatE1__ret_floatE1;
	.scl 2;
	.type 32;
	.endef
standard__math__remainder__2__floatE1__floatE1__ret_floatE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
.LB9620:
	movsd %xmm0, -8(%rbp)
	movaps %xmm1, %xmm0
	xorps %xmm1, %xmm1
	movsd %xmm0, -16(%rbp)
	ucomiss %xmm1, %xmm0
	sete %al
	setnp %cl
	movzbl %al, %eax
	movzbl %cl, %ecx
	andl %ecx, %eax
	testb %al, %al
	jne .LB9625
.LB9626:
	movsd -8(%rbp), %xmm0
	movsd -16(%rbp), %xmm1
	divss %xmm1, %xmm0
	callq standard__math__round__1__floatE1__ret_floatE1
	movsd -16(%rbp), %xmm1
	movsd -8(%rbp), %xmm2
	vfnmadd132ss %xmm1, %xmm2, %xmm0
	leave
	ret
.LB9625:
	xorps %xmm0, %xmm0
	leave
	ret
	.text
	.globl standard__math__remainder__2__doubleE1__doubleE1__ret_doubleE1
	.def standard__math__remainder__2__doubleE1__doubleE1__ret_doubleE1;
	.scl 2;
	.type 32;
	.endef
standard__math__remainder__2__doubleE1__doubleE1__ret_doubleE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
.LB9638:
	movsd %xmm0, -8(%rbp)
	movaps %xmm1, %xmm0
	xorps %xmm1, %xmm1
	movsd %xmm0, -16(%rbp)
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm1, %xmm0
	sete %al
	setnp %cl
	movzbl %al, %eax
	movzbl %cl, %ecx
	andl %ecx, %eax
	testb %al, %al
	jne .LB9644
.LB9645:
	movsd -8(%rbp), %xmm0
	movsd -16(%rbp), %xmm1
	divsd %xmm1, %xmm0
	callq standard__math__round__1__doubleE1__ret_doubleE1
	movsd -16(%rbp), %xmm1
	movsd -8(%rbp), %xmm2
	vfnmadd132sd %xmm1, %xmm2, %xmm0
	leave
	ret
.LB9644:
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	leave
	ret
	.text
	.globl standard__math__beta__2__floatE1__floatE1__ret_floatE1
	.def standard__math__beta__2__floatE1__floatE1__ret_floatE1;
	.scl 2;
	.type 32;
	.endef
standard__math__beta__2__floatE1__floatE1__ret_floatE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
.LB9658:
	movsd %xmm0, -8(%rbp)
	movsd %xmm1, -16(%rbp)
	callq standard__math__tgamma__1__floatE1__ret_floatE1
	movsd %xmm0, -24(%rbp)
	movsd -16(%rbp), %xmm0
	callq standard__math__tgamma__1__floatE1__ret_floatE1
	movsd -24(%rbp), %xmm1
	mulss %xmm1, %xmm0
	movsd %xmm0, -32(%rbp)
	movsd -8(%rbp), %xmm0
	movsd -16(%rbp), %xmm1
	addss %xmm1, %xmm0
	callq standard__math__tgamma__1__floatE1__ret_floatE1
	movsd -32(%rbp), %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	divss %xmm15, %xmm0
	leave
	ret
	.text
	.globl standard__math__beta__2__doubleE1__doubleE1__ret_doubleE1
	.def standard__math__beta__2__doubleE1__doubleE1__ret_doubleE1;
	.scl 2;
	.type 32;
	.endef
standard__math__beta__2__doubleE1__doubleE1__ret_doubleE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
.LB9671:
	movsd %xmm0, -8(%rbp)
	movsd %xmm1, -16(%rbp)
	callq standard__math__tgamma__1__doubleE1__ret_doubleE1
	movsd %xmm0, -24(%rbp)
	movsd -16(%rbp), %xmm0
	callq standard__math__tgamma__1__doubleE1__ret_doubleE1
	movsd -24(%rbp), %xmm1
	mulsd %xmm1, %xmm0
	movsd %xmm0, -32(%rbp)
	movsd -8(%rbp), %xmm0
	movsd -16(%rbp), %xmm1
	addsd %xmm1, %xmm0
	callq standard__math__tgamma__1__doubleE1__ret_doubleE1
	movsd -32(%rbp), %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	divsd %xmm15, %xmm0
	leave
	ret
	.text
	.globl math__bigint__bigint_shl__3__BigIntE1_ptr1__BigIntE1_ptr1__uintE1__ret_voidE1
	.def math__bigint__bigint_shl__3__BigIntE1_ptr1__BigIntE1_ptr1__uintE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
math__bigint__bigint_shl__3__BigIntE1_ptr1__BigIntE1_ptr1__uintE1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
.LB10778:
	movq %rcx, %rsi
	movl %r8d, %edi
	movq %rsi, %rcx
	callq math__bigint__bigint_copy__2__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	testl %edi, %edi
	je .LB10788
.LB10789:
	movl %edi, %eax
	shrl $5, %eax
	andl $31, %edi
	testl %eax, %eax
	ja .LB10809
.LB10811:
	testl %edi, %edi
	ja .LB10861
.LB10863:
	movq %rsi, %rcx
	callq math__bigint__bigint_normalize__1__BigIntE1_ptr1__ret_voidE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB10809:
	movl %eax, %ecx
	addl 512(%rsi), %ecx
	movl $128, %edx
	cmpl $128, %ecx
	cmova %edx, %ecx
	movq %rcx, %rdx
.LB10825:
	cmpl %eax, %edx
	jbe .LB10827
.LB10826:
	decl %edx
	movl %edx, %r8d
	subl %eax, %r8d
	movslq %r8d, %r8
	movl (%rsi,%r8,4), %r8d
	movslq %edx, %r9
	movl %r8d, (%rsi,%r9,4)
	cmpl %eax, %edx
	ja .LB10826
.LB10827:
	movl %eax, %edx
	shrl $2, %edx
	xorl %r8d, %r8d
.LB31978:
	testl %edx, %edx
	je .LB31980
.LB31979:
	movslq %r8d, %r9
	movl $0, (%rsi,%r9,4)
	leal 1(%r8), %r9d
	movslq %r9d, %r9
	movl $0, (%rsi,%r9,4)
	leal 2(%r8), %r9d
	movslq %r9d, %r9
	movl $0, (%rsi,%r9,4)
	leal 3(%r8), %r9d
	movslq %r9d, %r9
	movl $0, (%rsi,%r9,4)
	addl $4, %r8d
	decl %edx
	jne .LB31979
.LB31980:
.LB10843:
	cmpl %eax, %r8d
	jae .LB10846
.LB10844:
	movslq %r8d, %rdx
	movl $0, (%rsi,%rdx,4)
	incl %r8d
	cmpl %eax, %r8d
	jb .LB10844
.LB10846:
	movl %ecx, 512(%rsi)
	testl %edi, %edi
	jbe .LB10863
.LB10861:
	movl $32, %eax
	subl %edi, %eax
	xorl %ecx, %ecx
	xorl %edx, %edx
.LB10864:
	movl 512(%rsi), %r8d
	cmpl %r8d, %ecx
	jae .LB10867
.LB10865:
	movslq %ecx, %r8
	leaq (%rsi,%r8,4), %r8
	movl (%r8), %r9d
	shrx %eax, %r9d, %ebx
	shlx %edi, %r9d, %r9d
	orl %edx, %r9d
	movl %r9d, (%r8)
	incl %ecx
	movq %rbx, %rdx
	jmp .LB10864
.LB10867:
	testl %edx, %edx
	je .LB10863
.LB10897:
	cmpl $128, %r8d
	jae .LB10863
.LB10905:
	movslq %r8d, %rax
	movl %edx, (%rsi,%rax,4)
	movl 512(%rsi), %eax
	incl %eax
	movl %eax, 512(%rsi)
	jmp .LB10863
.LB10788:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
	.text
	.globl math__bigint__bigint_zero__1__BigIntE1_ptr1__ret_voidE1
	.def math__bigint__bigint_zero__1__BigIntE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
math__bigint__bigint_zero__1__BigIntE1_ptr1__ret_voidE1:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
	movq %rdi, -8(%rsp)
.LB9684:
	movl 512(%rcx), %eax
	movl $1, %edx
	cmpl $1, %eax
	cmovb %edx, %eax
	xorl %edx, %edx
	testl %eax, %eax
	cmova %eax, %edx
	shrl $2, %edx
	xorl %esi, %esi
.LB31981:
	testl %edx, %edx
	je .LB31983
.LB31982:
	movslq %esi, %rdi
	movl $0, (%rcx,%rdi,4)
	leal 1(%rsi), %edi
	movslq %edi, %rdi
	movl $0, (%rcx,%rdi,4)
	leal 2(%rsi), %edi
	movslq %edi, %rdi
	movl $0, (%rcx,%rdi,4)
	leal 3(%rsi), %edi
	movslq %edi, %rdi
	movl $0, (%rcx,%rdi,4)
	addl $4, %esi
	decl %edx
	jne .LB31982
.LB31983:
.LB9701:
	cmpl %eax, %esi
	jae .LB9704
.LB9702:
	movslq %esi, %rdx
	movl $0, (%rcx,%rdx,4)
	incl %esi
	cmpl %eax, %esi
	jb .LB9702
.LB9704:
	movl $1, 512(%rcx)
	andb $127, 516(%rcx)
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
	.text
	.globl math__bigint__bigint_one__1__BigIntE1_ptr1__ret_voidE1
	.def math__bigint__bigint_one__1__BigIntE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
math__bigint__bigint_one__1__BigIntE1_ptr1__ret_voidE1:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
	movq %rdi, -8(%rsp)
.LB9717:
	movl 512(%rcx), %eax
	movl $1, %edx
	cmpl $1, %eax
	cmovb %edx, %eax
	movl $1, (%rcx)
	leal -1(%rax), %edx
	xorl %esi, %esi
	cmpl $1, %eax
	cmova %edx, %esi
	movl %esi, %edx
	shrl $2, %edx
	movl $1, %esi
.LB31984:
	testl %edx, %edx
	je .LB31986
.LB31985:
	movslq %esi, %rdi
	movl $0, (%rcx,%rdi,4)
	leal 1(%rsi), %edi
	movslq %edi, %rdi
	movl $0, (%rcx,%rdi,4)
	leal 2(%rsi), %edi
	movslq %edi, %rdi
	movl $0, (%rcx,%rdi,4)
	leal 3(%rsi), %edi
	movslq %edi, %rdi
	movl $0, (%rcx,%rdi,4)
	addl $4, %esi
	decl %edx
	jne .LB31985
.LB31986:
.LB9736:
	cmpl %eax, %esi
	jae .LB9739
.LB9737:
	movslq %esi, %rdx
	movl $0, (%rcx,%rdx,4)
	incl %esi
	cmpl %eax, %esi
	jb .LB9737
.LB9739:
	movl $1, 512(%rcx)
	andb $127, 516(%rcx)
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
	.text
	.globl math__bigint__bigint_from_uint__2__BigIntE1_ptr1__uintE1__ret_voidE1
	.def math__bigint__bigint_from_uint__2__BigIntE1_ptr1__uintE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
math__bigint__bigint_from_uint__2__BigIntE1_ptr1__uintE1__ret_voidE1:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
	movq %rdi, -8(%rsp)
.LB9752:
	movl 512(%rcx), %eax
	movl $1, %esi
	cmpl $1, %eax
	cmovb %esi, %eax
	movl %edx, (%rcx)
	leal -1(%rax), %edx
	xorl %esi, %esi
	cmpl $1, %eax
	cmova %edx, %esi
	movl %esi, %edx
	shrl $2, %edx
	movl $1, %esi
.LB31987:
	testl %edx, %edx
	je .LB31989
.LB31988:
	movslq %esi, %rdi
	movl $0, (%rcx,%rdi,4)
	leal 1(%rsi), %edi
	movslq %edi, %rdi
	movl $0, (%rcx,%rdi,4)
	leal 2(%rsi), %edi
	movslq %edi, %rdi
	movl $0, (%rcx,%rdi,4)
	leal 3(%rsi), %edi
	movslq %edi, %rdi
	movl $0, (%rcx,%rdi,4)
	addl $4, %esi
	decl %edx
	jne .LB31988
.LB31989:
.LB9773:
	cmpl %eax, %esi
	jae .LB9776
.LB9774:
	movslq %esi, %rdx
	movl $0, (%rcx,%rdx,4)
	incl %esi
	cmpl %eax, %esi
	jb .LB9774
.LB9776:
	movl $1, 512(%rcx)
	andb $127, 516(%rcx)
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
	.text
	.globl math__bigint__bigint_is_zero__1__BigIntE1_ptr1__ret_boolE1
	.def math__bigint__bigint_is_zero__1__BigIntE1_ptr1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
math__bigint__bigint_is_zero__1__BigIntE1_ptr1__ret_boolE1:
.LB9789:
	cmpl $1, 512(%rcx)
	je .LB9800
.LB9801:
	xorl %eax, %eax
	ret
.LB9800:
	cmpl $0, (%rcx)
	je .LB9807
.LB9808:
	xorl %eax, %eax
	ret
.LB9807:
	movl $1, %eax
	ret
	.text
	.globl math__bigint__bigint_copy__2__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	.def math__bigint__bigint_copy__2__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
math__bigint__bigint_copy__2__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1:
	subq $32, %rsp
	movq %rbx, 16(%rsp)
	movq %rsi, 8(%rsp)
	movq %rdi, 0(%rsp)
.LB9810:
	movl 512(%rdx), %eax
	movl 512(%rcx), %esi
	xorl %edi, %edi
	testl %eax, %eax
	cmova %eax, %edi
	shrl $2, %edi
	xorl %r8d, %r8d
.LB31990:
	testl %edi, %edi
	je .LB31992
.LB31991:
	movslq %r8d, %r9
	movl (%rdx,%r9,4), %ebx
	movl %ebx, (%rcx,%r9,4)
	leal 1(%r8), %r9d
	movslq %r9d, %r9
	movl (%rdx,%r9,4), %ebx
	movl %ebx, (%rcx,%r9,4)
	leal 2(%r8), %r9d
	movslq %r9d, %r9
	movl (%rdx,%r9,4), %ebx
	movl %ebx, (%rcx,%r9,4)
	leal 3(%r8), %r9d
	movslq %r9d, %r9
	movl (%rdx,%r9,4), %ebx
	movl %ebx, (%rcx,%r9,4)
	addl $4, %r8d
	decl %edi
	jne .LB31991
.LB31992:
.LB9832:
	cmpl %eax, %r8d
	jae .LB9835
.LB9833:
	movslq %r8d, %rdi
	movl (%rdx,%rdi,4), %r9d
	movl %r9d, (%rcx,%rdi,4)
	incl %r8d
	cmpl %eax, %r8d
	jb .LB9833
.LB9835:
	cmpl %eax, %esi
	ja .LB9851
.LB9853:
	movl %eax, 512(%rcx)
	movzbl 516(%rdx), %eax
	shrq $7, %rax
	andl $1, %eax
	shll $7, %eax
	andb $127, 516(%rcx)
	orb %al, 516(%rcx)
	movq 16(%rsp), %rbx
	movq 8(%rsp), %rsi
	movq 0(%rsp), %rdi
	addq $32, %rsp
	ret
.LB9851:
	movl %esi, %edi
	subl %eax, %edi
	shrl $2, %edi
	movq %rax, %r8
.LB31993:
	testl %edi, %edi
	je .LB31995
.LB31994:
	movslq %r8d, %r9
	movl $0, (%rcx,%r9,4)
	leal 1(%r8), %r9d
	movslq %r9d, %r9
	movl $0, (%rcx,%r9,4)
	leal 2(%r8), %r9d
	movslq %r9d, %r9
	movl $0, (%rcx,%r9,4)
	leal 3(%r8), %r9d
	movslq %r9d, %r9
	movl $0, (%rcx,%r9,4)
	addl $4, %r8d
	decl %edi
	jne .LB31994
.LB31995:
.LB9854:
	cmpl %esi, %r8d
	jae .LB9853
.LB9855:
	movslq %r8d, %rdi
	movl $0, (%rcx,%rdi,4)
	incl %r8d
	cmpl %esi, %r8d
	jb .LB9855
	jmp .LB9853
	.text
	.globl math__bigint__bigint_normalize__1__BigIntE1_ptr1__ret_voidE1
	.def math__bigint__bigint_normalize__1__BigIntE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
math__bigint__bigint_normalize__1__BigIntE1_ptr1__ret_voidE1:
.LB9876:
.LB9883:
	movl 512(%rcx), %eax
	cmpl $1, %eax
	jbe .LB9885
.LB9884:
	decl %eax
	movslq %eax, %rdx
	cmpl $0, (%rcx,%rdx,4)
	jne .LB9885
.LB9901:
	movl %eax, 512(%rcx)
	jmp .LB9883
.LB9885:
	cmpl $1, 512(%rcx)
	je .LB9916
.LB9917:
	ret
.LB9916:
	cmpl $0, (%rcx)
	je .LB9923
.LB9925:
	ret
.LB9923:
	andb $127, 516(%rcx)
	jmp .LB9925
	.text
	.globl math__bigint__bigint_cmp_abs__2__BigIntE1_ptr1__BigIntE1_ptr1__ret_intE1
	.def math__bigint__bigint_cmp_abs__2__BigIntE1_ptr1__BigIntE1_ptr1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
math__bigint__bigint_cmp_abs__2__BigIntE1_ptr1__BigIntE1_ptr1__ret_intE1:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
	movq %rdi, -8(%rsp)
.LB9928:
	movl 512(%rcx), %eax
	cmpl 512(%rdx), %eax
	ja .LB9948
.LB9949:
	movl 512(%rcx), %eax
	cmpl 512(%rdx), %eax
	jb .LB9960
.LB9961:
	movl 512(%rcx), %eax
.LB9969:
	testl %eax, %eax
	jbe .LB9971
.LB9970:
	decl %eax
	movslq %eax, %rsi
	movl (%rcx,%rsi,4), %edi
	cmpl (%rdx,%rsi,4), %edi
	ja .LB9985
.LB9986:
	movl (%rcx,%rsi,4), %edi
	cmpl (%rdx,%rsi,4), %edi
	jb .LB9997
.LB9998:
	testl %eax, %eax
	ja .LB9970
.LB9971:
	xorl %eax, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB9997:
	movabsq $4294967295, %rax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB9985:
	movl $1, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB9960:
	movabsq $4294967295, %rax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB9948:
	movl $1, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
	.text
	.globl math__bigint__bigint_add_abs__3__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	.def math__bigint__bigint_add_abs__3__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
math__bigint__bigint_add_abs__3__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
.LB10001:
	movq %rcx, %rax
	movq %rdx, %rcx
	movq %r8, %rdx
	movl 512(%rcx), %esi
	movl 512(%rdx), %edi
	cmpl %edi, %esi
	cmova %esi, %edi
	xorl %esi, %esi
	xorl %r8d, %r8d
.LB10042:
	cmpl %edi, %r8d
	jb .LB10054
.LB10048:
	testq %rsi, %rsi
	je .LB10044
.LB10054:
	cmpl $128, %r8d
	jae .LB10044
.LB10043:
	cmpl 512(%rcx), %r8d
	jb .LB10066
.LB10067:
.LB10068:
	cmpl 512(%rdx), %r8d
	jb .LB10082
.LB10083:
.LB10084:
	movabsq $4294967295, %r9
	andq %rsi, %r9
	movslq %r8d, %rbx
	movl %r9d, (%rax,%rbx,4)
	shrq $32, %rsi
	movabsq $4294967295, %r9
	andq %r9, %rsi
	incl %r8d
	cmpl %edi, %r8d
	jb .LB10054
	jmp .LB10048
.LB10044:
	movl %r8d, 512(%rax)
	movq %rax, %rcx
	callq math__bigint__bigint_normalize__1__BigIntE1_ptr1__ret_voidE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB10066:
	movslq %r8d, %r9
	movl (%rcx,%r9,4), %r9d
	addq %r9, %rsi
	cmpl 512(%rdx), %r8d
	jae .LB10083
.LB10082:
	movslq %r8d, %r9
	movl (%rdx,%r9,4), %r9d
	addq %r9, %rsi
	jmp .LB10084
	.text
	.globl math__bigint__bigint_sub_abs__3__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	.def math__bigint__bigint_sub_abs__3__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
math__bigint__bigint_sub_abs__3__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB10109:
	movq %rdx, %rax
	movq %r8, %rdx
	xorl %esi, %esi
	xorl %edi, %edi
.LB10129:
	movl 512(%rax), %r8d
	cmpl %r8d, %edi
	jae .LB10132
.LB10130:
	movslq %edi, %r8
	movl (%rax,%r8,4), %r8d
	subq %rsi, %r8
	cmpl 512(%rdx), %edi
	jb .LB10152
.LB10153:
.LB10154:
	testq %r8, %r8
	js .LB10165
.LB10166:
	movslq %edi, %rsi
	movl %r8d, (%rcx,%rsi,4)
	xorl %esi, %esi
.LB10167:
	incl %edi
	jmp .LB10129
.LB10132:
	movl %r8d, 512(%rcx)
	callq math__bigint__bigint_normalize__1__BigIntE1_ptr1__ret_voidE1
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB10152:
	movslq %edi, %rsi
	movl (%rdx,%rsi,4), %esi
	subq %rsi, %r8
	jns .LB10166
.LB10165:
	movabsq $4294967296, %rsi
	addq %r8, %rsi
	movslq %edi, %r8
	movl %esi, (%rcx,%r8,4)
	movl $1, %esi
	jmp .LB10167
	.text
	.globl math__bigint__bigint_add__3__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	.def math__bigint__bigint_add__3__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
math__bigint__bigint_add__3__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
.LB10191:
	movq %rcx, %rsi
	movq %rdx, %rdi
	movq %r8, %rbx
	movq %rsi, %rcx
	callq math__bigint__bigint_zero__1__BigIntE1_ptr1__ret_voidE1
	movzbl 516(%rdi), %eax
	movzbl 516(%rbx), %ecx
	shrq $7, %rax
	shrq $7, %rcx
	cmpb %cl, %al
	je .LB10206
.LB10207:
	movq %rdi, %rcx
	movq %rbx, %rdx
	callq math__bigint__bigint_cmp_abs__2__BigIntE1_ptr1__BigIntE1_ptr1__ret_intE1
	testl %eax, %eax
	je .LB10229
.LB10230:
	testl %eax, %eax
	jg .LB10236
.LB10237:
	movq %rsi, %rcx
	movq %rbx, %rdx
	movq %rdi, %r8
	callq math__bigint__bigint_sub_abs__3__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	movzbl 516(%rbx), %eax
	shrq $7, %rax
	andl $1, %eax
	shll $7, %eax
	andb $127, 516(%rsi)
	orb %al, 516(%rsi)
.LB10208:
	movq %rsi, %rcx
	callq math__bigint__bigint_normalize__1__BigIntE1_ptr1__ret_voidE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB10236:
	movq %rsi, %rcx
	movq %rdi, %rdx
	movq %rbx, %r8
	callq math__bigint__bigint_sub_abs__3__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	movzbl 516(%rdi), %eax
	shrq $7, %rax
	andl $1, %eax
	shll $7, %eax
	andb $127, 516(%rsi)
	orb %al, 516(%rsi)
	jmp .LB10208
.LB10229:
	movq %rsi, %rcx
	callq math__bigint__bigint_zero__1__BigIntE1_ptr1__ret_voidE1
	jmp .LB10208
.LB10206:
	movq %rsi, %rcx
	movq %rdi, %rdx
	movq %rbx, %r8
	callq math__bigint__bigint_add_abs__3__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	movzbl 516(%rdi), %eax
	shrq $7, %rax
	andl $1, %eax
	shll $7, %eax
	andb $127, 516(%rsi)
	orb %al, 516(%rsi)
	jmp .LB10208
	.text
	.globl math__bigint__bigint_sub__3__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	.def math__bigint__bigint_sub__3__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
math__bigint__bigint_sub__3__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $592, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
.LB10264:
	leaq .LZERO(%rip), %rsi
	leaq -560(%rbp), %rdi
	movq %rcx, %rbx
	movq %rdx, %r12
	movq %r8, %r13
	movl $517, %ecx
	rep movsb
	leaq -560(%rbp), %rcx
	movq %r13, %rdx
	callq math__bigint__bigint_copy__2__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	leaq -560(%rbp), %rcx
	callq math__bigint__bigint_is_zero__1__BigIntE1_ptr1__ret_boolE1
	testb %al, %al
	jne .LB10272
.LB10273:
	movzbl 516(%r13), %eax
	shrq $7, %rax
	xorl $1, %eax
	andl $1, %eax
	shll $7, %eax
	andb $127, -44(%rbp)
	orb %al, -44(%rbp)
.LB10274:
	leaq -560(%rbp), %r8
	movq %rbx, %rcx
	movq %r12, %rdx
	callq math__bigint__bigint_add__3__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB10272:
	andb $127, -44(%rbp)
	jmp .LB10274
	.text
	.globl math__bigint__bigint_mul_schoolbook__3__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	.def math__bigint__bigint_mul_schoolbook__3__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
math__bigint__bigint_mul_schoolbook__3__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $80, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
.LB10286:
	movq %rcx, %rsi
	movq %rdx, %rdi
	movq %r8, %rbx
	movq %rsi, %rcx
	callq math__bigint__bigint_zero__1__BigIntE1_ptr1__ret_voidE1
	movq %rdi, %rcx
	callq math__bigint__bigint_is_zero__1__BigIntE1_ptr1__ret_boolE1
	testb %al, %al
	jne .LB10301
.LB10295:
	movq %rbx, %rcx
	callq math__bigint__bigint_is_zero__1__BigIntE1_ptr1__ret_boolE1
	testb %al, %al
	jne .LB10301
.LB10302:
	xorl %eax, %eax
	xorl %ecx, %ecx
	xorl %edx, %edx
.LB10322:
	cmpl 512(%rdi), %eax
	jae .LB10325
.LB10323:
	xorl %r8d, %r8d
	movq %rdx, %r9
	xorl %edx, %edx
.LB10333:
	movl 512(%rbx), %r12d
	cmpl %r12d, %edx
	jae .LB10336
.LB10334:
	leal (%rax,%rdx), %r9d
	movslq %edx, %r13
	movslq %r9d, %r9
	leaq (%rsi,%r9,4), %r9
	movl (%r9), %r12d
	addq %r8, %r12
	movslq %eax, %r8
	movl (%rdi,%r8,4), %r8d
	movl (%rbx,%r13,4), %r13d
	imulq %r13, %r8
	addq %r12, %r8
	movabsq $4294967295, %r12
	andq %r8, %r12
	movl %r12d, (%r9)
	movq %r8, %r9
	shrq $32, %r9
	incl %edx
	movq %r8, %r11
	movq %r9, %r8
	movq %r11, %r9
	jmp .LB10333
.LB10325:
	movl %ecx, 512(%rsi)
	movq %rsi, %rcx
	callq math__bigint__bigint_normalize__1__BigIntE1_ptr1__ret_voidE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB10336:
	leal (%rax,%r12), %edx
.LB10383:
	testq %r8, %r8
	je .LB10385
.LB10389:
	cmpl $128, %edx
	jae .LB10385
.LB10384:
	movslq %edx, %r9
	leaq (%rsi,%r9,4), %r9
	movl (%r9), %r12d
	addq %r12, %r8
	movabsq $4294967295, %r12
	andq %r8, %r12
	movl %r12d, (%r9)
	movq %r8, %r9
	shrq $32, %r9
	incl %edx
	movq %r8, %r11
	movq %r9, %r8
	movq %r11, %r9
	testq %r8, %r8
	jne .LB10389
.LB10385:
	cmpl %ecx, %edx
	cmova %edx, %ecx
	incl %eax
	movq %r9, %rdx
	cmpl 512(%rdi), %eax
	jb .LB10323
	jmp .LB10325
.LB10301:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
	.text
	.globl math__bigint__bigint_mul_karatsuba__3__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	.def math__bigint__bigint_mul_karatsuba__3__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
math__bigint__bigint_mul_karatsuba__3__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	movl $8400, %eax
	callq __chkstk
	subq %rax, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
.LB10426:
	movq %rcx, %rbx
	movq %rdx, %r12
	movq %r8, %r13
	cmpl $16, 512(%r12)
	jb .LB10446
.LB10437:
	cmpl $16, 512(%r13)
	jb .LB10446
.LB10447:
	leaq .LZERO(%rip), %rsi
	leaq -560(%rbp), %rdi
	movl $517, %ecx
	rep movsb
	leaq .LZERO(%rip), %rsi
	leaq -1080(%rbp), %rdi
	movl $517, %ecx
	rep movsb
	movl 512(%r12), %eax
	cmpl 512(%r13), %eax
	jb .LB10466
.LB10467:
	leaq -560(%rbp), %rcx
	movq %r12, %rdx
	callq math__bigint__bigint_copy__2__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	leaq -1080(%rbp), %rcx
	movq %r13, %rdx
	callq math__bigint__bigint_copy__2__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
.LB10468:
	leaq .LZERO(%rip), %rsi
	leaq -1600(%rbp), %rdi
	movl -48(%rbp), %eax
	movl $517, %ecx
	movl %eax, %r12d
	shrl $1, %r12d
	rep movsb
	leaq .LZERO(%rip), %rsi
	leaq -2120(%rbp), %rdi
	movl $517, %ecx
	rep movsb
	leaq .LZERO(%rip), %rsi
	leaq -2640(%rbp), %rdi
	movl $517, %ecx
	rep movsb
	leaq .LZERO(%rip), %rsi
	leaq -3160(%rbp), %rdi
	movl $517, %ecx
	rep movsb
	leaq -1600(%rbp), %rcx
	callq math__bigint__bigint_zero__1__BigIntE1_ptr1__ret_voidE1
	leaq -2120(%rbp), %rcx
	callq math__bigint__bigint_zero__1__BigIntE1_ptr1__ret_voidE1
	leaq -2640(%rbp), %rcx
	callq math__bigint__bigint_zero__1__BigIntE1_ptr1__ret_voidE1
	leaq -3160(%rbp), %rcx
	callq math__bigint__bigint_zero__1__BigIntE1_ptr1__ret_voidE1
	leaq -1600(%rbp), %rax
	leaq -2640(%rbp), %rcx
	xorl %edx, %edx
.LB10507:
	cmpl %r12d, %edx
	jae .LB10510
.LB10508:
	movslq %edx, %rsi
	movl -560(%rbp,%rsi,4), %edi
	movl %edi, (%rax,%rsi,4)
	cmpl -568(%rbp), %edx
	jb .LB10528
.LB10529:
	xorl %esi, %esi
.LB10530:
	movslq %edx, %rdi
	movl %esi, (%rcx,%rdi,4)
	incl %edx
	cmpl %r12d, %edx
	jb .LB10508
	jmp .LB10510
.LB10466:
	leaq -560(%rbp), %rcx
	movq %r13, %rdx
	callq math__bigint__bigint_copy__2__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	leaq -1080(%rbp), %rcx
	movq %r12, %rdx
	callq math__bigint__bigint_copy__2__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	jmp .LB10468
.LB10510:
	movl %r12d, -1088(%rbp)
	movl -568(%rbp), %eax
	leaq -1600(%rbp), %rcx
	cmpl %r12d, %eax
	cmova %r12d, %eax
	movl %eax, -2128(%rbp)
	callq math__bigint__bigint_normalize__1__BigIntE1_ptr1__ret_voidE1
	leaq -2640(%rbp), %rcx
	callq math__bigint__bigint_normalize__1__BigIntE1_ptr1__ret_voidE1
	movl -48(%rbp), %eax
	xorl %edx, %edx
	xorl %esi, %esi
	movl %eax, %ecx
	subl %r12d, %ecx
	cmpl %r12d, %eax
	movl -568(%rbp), %eax
	cmova %ecx, %edx
	movl %eax, %ecx
	subl %r12d, %ecx
	cmpl %r12d, %eax
	movl $0, %eax
	cmova %ecx, %esi
	testl %edx, %edx
	cmova %edx, %eax
	shrl $2, %eax
	xorl %ecx, %ecx
.LB31996:
	testl %eax, %eax
	je .LB31998
.LB31997:
	leal (%r12,%rcx), %edi
	movslq %edi, %rdi
	movl -560(%rbp,%rdi,4), %edi
	movslq %ecx, %r8
	movl %edi, -2120(%rbp,%r8,4)
	leal 1(%rcx), %edi
	leal (%r12,%rdi), %r8d
	movslq %r8d, %r8
	movl -560(%rbp,%r8,4), %r8d
	movslq %edi, %rdi
	movl %r8d, -2120(%rbp,%rdi,4)
	leal 2(%rcx), %edi
	leal (%r12,%rdi), %r8d
	movslq %r8d, %r8
	movl -560(%rbp,%r8,4), %r8d
	movslq %edi, %rdi
	movl %r8d, -2120(%rbp,%rdi,4)
	leal 3(%rcx), %edi
	leal (%r12,%rdi), %r8d
	movslq %r8d, %r8
	movl -560(%rbp,%r8,4), %r8d
	movslq %edi, %rdi
	movl %r8d, -2120(%rbp,%rdi,4)
	addl $4, %ecx
	decl %eax
	jne .LB31997
.LB31998:
.LB10593:
	cmpl %edx, %ecx
	jae .LB10596
.LB10594:
	leal (%r12,%rcx), %eax
	movslq %eax, %rax
	movl -560(%rbp,%rax,4), %eax
	movslq %ecx, %rdi
	movl %eax, -2120(%rbp,%rdi,4)
	incl %ecx
	cmpl %edx, %ecx
	jb .LB10594
.LB10596:
	xorl %eax, %eax
	testl %esi, %esi
	cmova %esi, %eax
	shrl $2, %eax
	xorl %ecx, %ecx
.LB31999:
	testl %eax, %eax
	je .LB32001
.LB32000:
	leal (%r12,%rcx), %edi
	movslq %edi, %rdi
	movl -1080(%rbp,%rdi,4), %edi
	movslq %ecx, %r8
	movl %edi, -3160(%rbp,%r8,4)
	leal 1(%rcx), %edi
	leal (%r12,%rdi), %r8d
	movslq %r8d, %r8
	movl -1080(%rbp,%r8,4), %r8d
	movslq %edi, %rdi
	movl %r8d, -3160(%rbp,%rdi,4)
	leal 2(%rcx), %edi
	leal (%r12,%rdi), %r8d
	movslq %r8d, %r8
	movl -1080(%rbp,%r8,4), %r8d
	movslq %edi, %rdi
	movl %r8d, -3160(%rbp,%rdi,4)
	leal 3(%rcx), %edi
	leal (%r12,%rdi), %r8d
	movslq %r8d, %r8
	movl -1080(%rbp,%r8,4), %r8d
	movslq %edi, %rdi
	movl %r8d, -3160(%rbp,%rdi,4)
	addl $4, %ecx
	decl %eax
	jne .LB32000
.LB32001:
.LB10611:
	cmpl %esi, %ecx
	jae .LB10614
.LB10612:
	leal (%r12,%rcx), %eax
	movslq %eax, %rax
	movl -1080(%rbp,%rax,4), %eax
	movslq %ecx, %rdi
	movl %eax, -3160(%rbp,%rdi,4)
	incl %ecx
	cmpl %esi, %ecx
	jb .LB10612
.LB10614:
	movl %edx, -1608(%rbp)
	movl %esi, -2648(%rbp)
	leaq -2120(%rbp), %rcx
	callq math__bigint__bigint_normalize__1__BigIntE1_ptr1__ret_voidE1
	leaq -3160(%rbp), %rcx
	callq math__bigint__bigint_normalize__1__BigIntE1_ptr1__ret_voidE1
	leaq .LZERO(%rip), %rsi
	leaq -3680(%rbp), %rdi
	movl $517, %ecx
	rep movsb
	leaq .LZERO(%rip), %rsi
	leaq -4200(%rbp), %rdi
	movl $517, %ecx
	rep movsb
	leaq .LZERO(%rip), %rsi
	leaq -4720(%rbp), %rdi
	movl $517, %ecx
	rep movsb
	leaq -3680(%rbp), %rcx
	callq math__bigint__bigint_zero__1__BigIntE1_ptr1__ret_voidE1
	leaq -4200(%rbp), %rcx
	callq math__bigint__bigint_zero__1__BigIntE1_ptr1__ret_voidE1
	leaq -4720(%rbp), %rcx
	callq math__bigint__bigint_zero__1__BigIntE1_ptr1__ret_voidE1
	leaq -3680(%rbp), %rcx
	leaq -1600(%rbp), %rdx
	leaq -2640(%rbp), %r8
	callq math__bigint__bigint_mul_karatsuba__3__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	leaq -2120(%rbp), %rcx
	callq math__bigint__bigint_is_zero__1__BigIntE1_ptr1__ret_boolE1
	testb %al, %al
	jne .LB10645
.LB10638:
	leaq -3160(%rbp), %rcx
	callq math__bigint__bigint_is_zero__1__BigIntE1_ptr1__ret_boolE1
	testb %al, %al
	je .LB10643
.LB10645:
	leaq .LZERO(%rip), %rsi
	leaq -5240(%rbp), %rdi
	movl $517, %ecx
	rep movsb
	leaq .LZERO(%rip), %rsi
	leaq -5760(%rbp), %rdi
	movl $517, %ecx
	rep movsb
	leaq -5240(%rbp), %rcx
	callq math__bigint__bigint_zero__1__BigIntE1_ptr1__ret_voidE1
	leaq -5760(%rbp), %rcx
	callq math__bigint__bigint_zero__1__BigIntE1_ptr1__ret_voidE1
	leaq -5240(%rbp), %rcx
	leaq -1600(%rbp), %rdx
	leaq -2120(%rbp), %r8
	callq math__bigint__bigint_add__3__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	leaq -5760(%rbp), %rcx
	leaq -2640(%rbp), %rdx
	leaq -3160(%rbp), %r8
	callq math__bigint__bigint_add__3__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	leaq .LZERO(%rip), %rsi
	leaq -6280(%rbp), %rdi
	movl $517, %ecx
	rep movsb
	leaq -6280(%rbp), %rcx
	callq math__bigint__bigint_zero__1__BigIntE1_ptr1__ret_voidE1
	leaq -6280(%rbp), %rcx
	leaq -5240(%rbp), %rdx
	leaq -5760(%rbp), %r8
	callq math__bigint__bigint_mul_karatsuba__3__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	leaq .LZERO(%rip), %rsi
	leaq -6800(%rbp), %rdi
	movl $517, %ecx
	rep movsb
	leaq -6800(%rbp), %rcx
	callq math__bigint__bigint_zero__1__BigIntE1_ptr1__ret_voidE1
	leaq -6800(%rbp), %rcx
	leaq -3680(%rbp), %rdx
	leaq -4720(%rbp), %r8
	callq math__bigint__bigint_add__3__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	leaq -4200(%rbp), %rcx
	leaq -6280(%rbp), %rdx
	leaq -6800(%rbp), %r8
	callq math__bigint__bigint_sub__3__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	movq %rbx, %rcx
	callq math__bigint__bigint_zero__1__BigIntE1_ptr1__ret_voidE1
	leaq .LZERO(%rip), %rsi
	leaq -7320(%rbp), %rdi
	movl $517, %ecx
	rep movsb
	leaq .LZERO(%rip), %rsi
	leaq -7840(%rbp), %rdi
	movl $517, %ecx
	rep movsb
	leaq -7320(%rbp), %rcx
	callq math__bigint__bigint_zero__1__BigIntE1_ptr1__ret_voidE1
	leaq -7840(%rbp), %rcx
	callq math__bigint__bigint_zero__1__BigIntE1_ptr1__ret_voidE1
	movl %r12d, %r8d
	shll $5, %r8d
	leaq -7320(%rbp), %rcx
	leaq -4200(%rbp), %rdx
	callq math__bigint__bigint_shl__3__BigIntE1_ptr1__BigIntE1_ptr1__uintE1__ret_voidE1
	movl %r12d, %r8d
	shll $6, %r8d
	leaq -7840(%rbp), %rcx
	leaq -4720(%rbp), %rdx
	callq math__bigint__bigint_shl__3__BigIntE1_ptr1__BigIntE1_ptr1__uintE1__ret_voidE1
	leaq .LZERO(%rip), %rsi
	leaq -8360(%rbp), %rdi
	movl $517, %ecx
	rep movsb
	leaq -8360(%rbp), %rcx
	callq math__bigint__bigint_zero__1__BigIntE1_ptr1__ret_voidE1
	leaq -8360(%rbp), %rcx
	leaq -3680(%rbp), %rdx
	leaq -7320(%rbp), %r8
	callq math__bigint__bigint_add__3__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	leaq -8360(%rbp), %rdx
	leaq -7840(%rbp), %r8
	movq %rbx, %rcx
	callq math__bigint__bigint_add__3__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	movq %rbx, %rcx
	callq math__bigint__bigint_normalize__1__BigIntE1_ptr1__ret_voidE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB10643:
	leaq -4720(%rbp), %rcx
	leaq -2120(%rbp), %rdx
	leaq -3160(%rbp), %r8
	callq math__bigint__bigint_mul_karatsuba__3__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	jmp .LB10645
.LB10528:
	movslq %edx, %rsi
	movl -1080(%rbp,%rsi,4), %esi
	jmp .LB10530
.LB10446:
	movq %rbx, %rcx
	movq %r12, %rdx
	movq %r13, %r8
	callq math__bigint__bigint_mul_schoolbook__3__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
	.text
	.globl math__bigint__bigint_mul__3__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	.def math__bigint__bigint_mul__3__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
math__bigint__bigint_mul__3__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $1120, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
.LB10663:
	movq %rcx, %rbx
	movq %rdx, %r12
	movq %r8, %r13
	movq %rbx, %rcx
	callq math__bigint__bigint_zero__1__BigIntE1_ptr1__ret_voidE1
	movq %r12, %rcx
	callq math__bigint__bigint_is_zero__1__BigIntE1_ptr1__ret_boolE1
	testb %al, %al
	jne .LB10678
.LB10672:
	movq %r13, %rcx
	callq math__bigint__bigint_is_zero__1__BigIntE1_ptr1__ret_boolE1
	testb %al, %al
	jne .LB10678
.LB10679:
	leaq .LZERO(%rip), %rsi
	leaq -560(%rbp), %rdi
	movl $517, %ecx
	rep movsb
	leaq .LZERO(%rip), %rsi
	leaq -1080(%rbp), %rdi
	movl $517, %ecx
	rep movsb
	leaq -560(%rbp), %rcx
	movq %r12, %rdx
	callq math__bigint__bigint_copy__2__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	leaq -1080(%rbp), %rcx
	movq %r13, %rdx
	callq math__bigint__bigint_copy__2__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	andb $127, -44(%rbp)
	andb $127, -564(%rbp)
	leaq -560(%rbp), %rdx
	leaq -1080(%rbp), %r8
	movq %rbx, %rcx
	callq math__bigint__bigint_mul_karatsuba__3__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	movzbl 516(%r12), %eax
	movzbl 516(%r13), %ecx
	shrq $7, %rax
	shrq $7, %rcx
	cmpb %cl, %al
	je .LB10700
.LB10701:
	orb $128, 516(%rbx)
.LB10702:
	movq %rbx, %rcx
	callq math__bigint__bigint_is_zero__1__BigIntE1_ptr1__ret_boolE1
	testb %al, %al
	jne .LB10710
.LB10711:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB10700:
	andb $127, 516(%rbx)
	jmp .LB10702
.LB10710:
	andb $127, 516(%rbx)
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB10678:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
	.text
	.globl math__bigint__bigint_shift_left_1__1__BigIntE1_ptr1__ret_voidE1
	.def math__bigint__bigint_shift_left_1__1__BigIntE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
math__bigint__bigint_shift_left_1__1__BigIntE1_ptr1__ret_voidE1:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
	movq %rdi, -8(%rsp)
.LB10715:
	xorl %eax, %eax
	xorl %edx, %edx
.LB10724:
	movl 512(%rcx), %esi
	cmpl %esi, %edx
	jae .LB10727
.LB10725:
	movslq %edx, %rsi
	leaq (%rcx,%rsi,4), %rsi
	movl (%rsi), %edi
	movl %edi, %r8d
	shrl $31, %r8d
	shll $1, %edi
	orl %eax, %edi
	movl %edi, (%rsi)
	incl %edx
	movq %r8, %rax
	jmp .LB10724
.LB10727:
	testl %eax, %eax
	jne .LB10755
.LB10756:
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB10755:
	cmpl $128, %esi
	jb .LB10764
.LB10766:
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB10764:
	movslq %esi, %rdx
	movl %eax, (%rcx,%rdx,4)
	movl 512(%rcx), %eax
	incl %eax
	movl %eax, 512(%rcx)
	jmp .LB10766
	.text
	.globl math__bigint__bigint_divmod__4__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	.def math__bigint__bigint_divmod__4__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
math__bigint__bigint_divmod__4__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $3232, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
	movq %r14, -48(%rbp)
	movq %r15, -56(%rbp)
.LB10924:
	leaq .LZERO(%rip), %rsi
	leaq -576(%rbp), %rdi
	movq %rcx, %rbx
	movq %rdx, %r12
	movq %r8, %r13
	movq %r9, %r14
	movl $517, %ecx
	rep movsb
	leaq .LZERO(%rip), %rsi
	leaq -1096(%rbp), %rdi
	movl $517, %ecx
	rep movsb
	leaq .LZERO(%rip), %rsi
	leaq -1616(%rbp), %rdi
	movl $517, %ecx
	rep movsb
	leaq .LZERO(%rip), %rsi
	leaq -2136(%rbp), %rdi
	movl $517, %ecx
	rep movsb
	leaq .LZERO(%rip), %rsi
	leaq -2656(%rbp), %rdi
	movl $517, %ecx
	rep movsb
	leaq .LZERO(%rip), %rsi
	leaq -3176(%rbp), %rdi
	movl $517, %ecx
	rep movsb
	movq %rbx, %rcx
	callq math__bigint__bigint_zero__1__BigIntE1_ptr1__ret_voidE1
	movq %r12, %rcx
	callq math__bigint__bigint_zero__1__BigIntE1_ptr1__ret_voidE1
	movq %r14, %rcx
	callq math__bigint__bigint_is_zero__1__BigIntE1_ptr1__ret_boolE1
	testb %al, %al
	jne .LB10942
.LB10943:
	movq %r13, %rcx
	movq %r14, %rdx
	callq math__bigint__bigint_cmp_abs__2__BigIntE1_ptr1__BigIntE1_ptr1__ret_intE1
	testl %eax, %eax
	js .LB10951
.LB10952:
	leaq -576(%rbp), %rcx
	movq %r13, %rdx
	callq math__bigint__bigint_copy__2__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	andb $127, -60(%rbp)
	leaq -1096(%rbp), %rcx
	movq %r14, %rdx
	callq math__bigint__bigint_copy__2__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	andb $127, -580(%rbp)
	cmpl $1, -584(%rbp)
	je .LB10974
.LB10975:
	leaq -1616(%rbp), %rcx
	callq math__bigint__bigint_zero__1__BigIntE1_ptr1__ret_voidE1
	leaq -2136(%rbp), %rcx
	callq math__bigint__bigint_zero__1__BigIntE1_ptr1__ret_voidE1
	leaq -2136(%rbp), %rsi
	movl -64(%rbp), %eax
	decl %eax
	movslq %eax, %rax
	movl -576(%rbp,%rax,4), %eax
	movl $31, %ecx
.LB11101:
	testl %ecx, %ecx
	jbe .LB11103
.LB11102:
	btl %ecx, %eax
	jb .LB11103
.LB11112:
	decl %ecx
	testl %ecx, %ecx
	ja .LB11102
.LB11103:
	movl -64(%rbp), %eax
	leaq -1616(%rbp), %r15
	decl %eax
	shll $5, %eax
	leal (%rax,%rcx), %edi
	movq $0, -3184(%rbp)
	movq $0, -3192(%rbp)
.LB11127:
	leaq -1616(%rbp), %rcx
	callq math__bigint__bigint_shift_left_1__1__BigIntE1_ptr1__ret_voidE1
	movl %edi, %eax
	shrl $5, %eax
	movl %edi, %ecx
	andl $31, %ecx
	movslq %eax, %rax
	movl -576(%rbp,%rax,4), %eax
	btl %ecx, %eax
	jb .LB11143
.LB11145:
	leaq -1616(%rbp), %rcx
	leaq -1096(%rbp), %rdx
	callq math__bigint__bigint_cmp_abs__2__BigIntE1_ptr1__BigIntE1_ptr1__ret_intE1
	testl %eax, %eax
	jns .LB11154
.LB11155:
	movq -3184(%rbp), %rax
	movq -3192(%rbp), %rcx
.LB11156:
	testl %edi, %edi
	je .LB11129
.LB11187:
	decl %edi
	movq %rax, -3184(%rbp)
	movq %rcx, -3192(%rbp)
	jmp .LB11127
.LB11143:
	movl (%r15), %eax
	orl $1, %eax
	movl %eax, (%r15)
	jmp .LB11145
.LB11154:
	leaq -1616(%rbp), %rcx
	leaq -1616(%rbp), %rdx
	leaq -1096(%rbp), %r8
	callq math__bigint__bigint_sub_abs__3__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	movl %edi, %eax
	shrl $5, %eax
	movl %edi, %ecx
	andl $31, %ecx
	movslq %eax, %rdx
	leaq (%rsi,%rdx,4), %rdx
	movl (%rdx), %r8d
	btsl %ecx, %r8d
	movl %r8d, (%rdx)
	leal 1(%rax), %edx
	cmpl -1624(%rbp), %edx
	ja .LB11178
.LB11180:
	testl %edi, %edi
	je .LB11129
	jmp .LB11187
.LB11178:
	movl %edx, -1624(%rbp)
	jmp .LB11180
.LB11129:
	leaq -2136(%rbp), %rcx
	callq math__bigint__bigint_normalize__1__BigIntE1_ptr1__ret_voidE1
	leaq -1616(%rbp), %rcx
	callq math__bigint__bigint_normalize__1__BigIntE1_ptr1__ret_voidE1
	leaq -2136(%rbp), %rdx
	movq %rbx, %rcx
	callq math__bigint__bigint_copy__2__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	leaq -1616(%rbp), %rdx
	movq %r12, %rcx
	callq math__bigint__bigint_copy__2__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	movzbl 516(%r13), %eax
	movzbl 516(%r14), %ecx
	shrq $7, %rax
	shrq $7, %rcx
	cmpb %cl, %al
	je .LB11204
.LB11205:
	orb $128, 516(%rbx)
.LB11206:
	movzbl 516(%r13), %eax
	shrq $7, %rax
	andl $1, %eax
	shll $7, %eax
	andb $127, 516(%r12)
	orb %al, 516(%r12)
	movq %rbx, %rcx
	callq math__bigint__bigint_is_zero__1__BigIntE1_ptr1__ret_boolE1
	testb %al, %al
	jne .LB11220
.LB11222:
	movq %r12, %rcx
	callq math__bigint__bigint_is_zero__1__BigIntE1_ptr1__ret_boolE1
	testb %al, %al
	jne .LB11228
.LB11229:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB11204:
	andb $127, 516(%rbx)
	jmp .LB11206
.LB11220:
	andb $127, 516(%rbx)
	jmp .LB11222
.LB11228:
	andb $127, 516(%r12)
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB10974:
	leaq -2136(%rbp), %rcx
	leaq -576(%rbp), %rsi
	leaq -2136(%rbp), %rdi
	movl -1096(%rbp), %r15d
	callq math__bigint__bigint_zero__1__BigIntE1_ptr1__ret_voidE1
	movl -64(%rbp), %eax
	movq $0, -3200(%rbp)
.LB10996:
	testl %eax, %eax
	jbe .LB10998
.LB10997:
	leal -1(%rax), %ecx
	movq -3200(%rbp), %rax
	movslq %ecx, %r8
	movl (%rsi,%r8,4), %edx
	shlq $32, %rax
	movq %rax, %r9
	orq %rdx, %r9
	xorl %edx, %edx
	movq %r9, %rax
	divq %r15
	movl %eax, (%rdi,%r8,4)
	movq %r9, %rax
	xorl %edx, %edx
	divq %r15
	movq %rdx, -3200(%rbp)
	movq %rcx, %rax
	testl %eax, %eax
	ja .LB10997
.LB10998:
	leaq -2136(%rbp), %rcx
	movl -64(%rbp), %eax
	movl %eax, -1624(%rbp)
	callq math__bigint__bigint_normalize__1__BigIntE1_ptr1__ret_voidE1
	leaq -1616(%rbp), %rcx
	callq math__bigint__bigint_zero__1__BigIntE1_ptr1__ret_voidE1
	leaq -1616(%rbp), %rcx
	movl -3200(%rbp), %eax
	movl %eax, -1616(%rbp)
	movl $1, -1104(%rbp)
	callq math__bigint__bigint_normalize__1__BigIntE1_ptr1__ret_voidE1
	leaq -2136(%rbp), %rdx
	movq %rbx, %rcx
	callq math__bigint__bigint_copy__2__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	leaq -1616(%rbp), %rdx
	movq %r12, %rcx
	callq math__bigint__bigint_copy__2__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	movzbl 516(%r13), %eax
	movzbl 516(%r14), %ecx
	shrq $7, %rax
	shrq $7, %rcx
	cmpb %cl, %al
	je .LB11047
.LB11048:
	orb $128, 516(%rbx)
.LB11049:
	movzbl 516(%r13), %eax
	shrq $7, %rax
	andl $1, %eax
	shll $7, %eax
	andb $127, 516(%r12)
	orb %al, 516(%r12)
	movq %rbx, %rcx
	callq math__bigint__bigint_is_zero__1__BigIntE1_ptr1__ret_boolE1
	testb %al, %al
	jne .LB11063
.LB11065:
	movq %r12, %rcx
	callq math__bigint__bigint_is_zero__1__BigIntE1_ptr1__ret_boolE1
	testb %al, %al
	jne .LB11071
.LB11072:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB11047:
	andb $127, 516(%rbx)
	jmp .LB11049
.LB11063:
	andb $127, 516(%rbx)
	jmp .LB11065
.LB11071:
	andb $127, 516(%r12)
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB10951:
	movq %r12, %rcx
	movq %r13, %rdx
	callq math__bigint__bigint_copy__2__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	andb $127, 516(%r12)
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB10942:
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
	.globl math__bigint__bigint_mod__3__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	.def math__bigint__bigint_mod__3__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
math__bigint__bigint_mod__3__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $576, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
.LB11233:
	leaq .LZERO(%rip), %rsi
	leaq -544(%rbp), %rdi
	movq %rcx, %rax
	movq %rdx, %r9
	movq %r8, %rbx
	movl $517, %ecx
	rep movsb
	leaq -544(%rbp), %rcx
	movq %rax, %rdx
	movq %r9, %r8
	movq %rbx, %r9
	callq math__bigint__bigint_divmod__4__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__crypto__hashing__SHA256__rotr__2__dataE1_ubits32__dataE1_ubits32__ret_dataE1_ubits32
	.def standard__crypto__hashing__SHA256__rotr__2__dataE1_ubits32__dataE1_ubits32__ret_dataE1_ubits32;
	.scl 2;
	.type 32;
	.endef
standard__crypto__hashing__SHA256__rotr__2__dataE1_ubits32__dataE1_ubits32__ret_dataE1_ubits32:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
.LB11244:
	shrx %edx, %ecx, %eax
	movl $32, %esi
	subl %edx, %esi
	shlx %esi, %ecx, %ecx
	orl %ecx, %eax
	movq 0(%rsp), %rsi
	addq $16, %rsp
	ret
	.text
	.globl standard__crypto__hashing__SHA256__ch__3__dataE1_ubits32__dataE1_ubits32__dataE1_ubits32__ret_dataE1_ubits32
	.def standard__crypto__hashing__SHA256__ch__3__dataE1_ubits32__dataE1_ubits32__dataE1_ubits32__ret_dataE1_ubits32;
	.scl 2;
	.type 32;
	.endef
standard__crypto__hashing__SHA256__ch__3__dataE1_ubits32__dataE1_ubits32__dataE1_ubits32__ret_dataE1_ubits32:
.LB11255:
	movl %ecx, %eax
	andl %edx, %eax
	andn %r8d, %ecx, %ecx
	xorl %ecx, %eax
	ret
	.text
	.globl standard__crypto__hashing__SHA256__maj__3__dataE1_ubits32__dataE1_ubits32__dataE1_ubits32__ret_dataE1_ubits32
	.def standard__crypto__hashing__SHA256__maj__3__dataE1_ubits32__dataE1_ubits32__dataE1_ubits32__ret_dataE1_ubits32;
	.scl 2;
	.type 32;
	.endef
standard__crypto__hashing__SHA256__maj__3__dataE1_ubits32__dataE1_ubits32__dataE1_ubits32__ret_dataE1_ubits32:
.LB11267:
	movl %ecx, %eax
	andl %edx, %eax
	andl %r8d, %ecx
	xorl %ecx, %eax
	andl %r8d, %edx
	xorl %edx, %eax
	ret
	.text
	.globl standard__crypto__hashing__SHA256__sigma0__1__dataE1_ubits32__ret_dataE1_ubits32
	.def standard__crypto__hashing__SHA256__sigma0__1__dataE1_ubits32__ret_dataE1_ubits32;
	.scl 2;
	.type 32;
	.endef
standard__crypto__hashing__SHA256__sigma0__1__dataE1_ubits32__ret_dataE1_ubits32:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB11282:
	movl %ecx, %esi
	movq %rsi, %rcx
	movl $2, %edx
	callq standard__crypto__hashing__SHA256__rotr__2__dataE1_ubits32__dataE1_ubits32__ret_dataE1_ubits32
	movl %eax, %edi
	movq %rsi, %rcx
	movl $13, %edx
	callq standard__crypto__hashing__SHA256__rotr__2__dataE1_ubits32__dataE1_ubits32__ret_dataE1_ubits32
	xorl %eax, %edi
	movq %rsi, %rcx
	movl $22, %edx
	callq standard__crypto__hashing__SHA256__rotr__2__dataE1_ubits32__dataE1_ubits32__ret_dataE1_ubits32
	xorl %edi, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__crypto__hashing__SHA256__sigma1__1__dataE1_ubits32__ret_dataE1_ubits32
	.def standard__crypto__hashing__SHA256__sigma1__1__dataE1_ubits32__ret_dataE1_ubits32;
	.scl 2;
	.type 32;
	.endef
standard__crypto__hashing__SHA256__sigma1__1__dataE1_ubits32__ret_dataE1_ubits32:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB11292:
	movl %ecx, %esi
	movq %rsi, %rcx
	movl $6, %edx
	callq standard__crypto__hashing__SHA256__rotr__2__dataE1_ubits32__dataE1_ubits32__ret_dataE1_ubits32
	movl %eax, %edi
	movq %rsi, %rcx
	movl $11, %edx
	callq standard__crypto__hashing__SHA256__rotr__2__dataE1_ubits32__dataE1_ubits32__ret_dataE1_ubits32
	xorl %eax, %edi
	movq %rsi, %rcx
	movl $25, %edx
	callq standard__crypto__hashing__SHA256__rotr__2__dataE1_ubits32__dataE1_ubits32__ret_dataE1_ubits32
	xorl %edi, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__crypto__hashing__SHA256__gamma0__1__dataE1_ubits32__ret_dataE1_ubits32
	.def standard__crypto__hashing__SHA256__gamma0__1__dataE1_ubits32__ret_dataE1_ubits32;
	.scl 2;
	.type 32;
	.endef
standard__crypto__hashing__SHA256__gamma0__1__dataE1_ubits32__ret_dataE1_ubits32:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB11302:
	movl %ecx, %esi
	movq %rsi, %rcx
	movl $7, %edx
	callq standard__crypto__hashing__SHA256__rotr__2__dataE1_ubits32__dataE1_ubits32__ret_dataE1_ubits32
	movl %eax, %edi
	movq %rsi, %rcx
	movl $18, %edx
	callq standard__crypto__hashing__SHA256__rotr__2__dataE1_ubits32__dataE1_ubits32__ret_dataE1_ubits32
	xorl %eax, %edi
	shrl $3, %esi
	movl %edi, %eax
	xorl %esi, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__crypto__hashing__SHA256__gamma1__1__dataE1_ubits32__ret_dataE1_ubits32
	.def standard__crypto__hashing__SHA256__gamma1__1__dataE1_ubits32__ret_dataE1_ubits32;
	.scl 2;
	.type 32;
	.endef
standard__crypto__hashing__SHA256__gamma1__1__dataE1_ubits32__ret_dataE1_ubits32:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB11312:
	movl %ecx, %esi
	movq %rsi, %rcx
	movl $17, %edx
	callq standard__crypto__hashing__SHA256__rotr__2__dataE1_ubits32__dataE1_ubits32__ret_dataE1_ubits32
	movl %eax, %edi
	movq %rsi, %rcx
	movl $19, %edx
	callq standard__crypto__hashing__SHA256__rotr__2__dataE1_ubits32__dataE1_ubits32__ret_dataE1_ubits32
	xorl %eax, %edi
	shrl $10, %esi
	movl %edi, %eax
	xorl %esi, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__crypto__hashing__SHA256__sha256_init__1__SHA256_CTXE1_ptr1__ret_voidE1
	.def standard__crypto__hashing__SHA256__sha256_init__1__SHA256_CTXE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__hashing__SHA256__sha256_init__1__SHA256_CTXE1_ptr1__ret_voidE1:
.LB11322:
	movl $1779033703, (%rcx)
	movl $3144134277, 4(%rcx)
	movl $1013904242, 8(%rcx)
	movl $2773480762, 12(%rcx)
	movl $1359893119, 16(%rcx)
	movl $2600822924, 20(%rcx)
	movl $528734635, 24(%rcx)
	movl $1541459225, 28(%rcx)
	movq $0, 96(%rcx)
	movl $0, 104(%rcx)
	ret
	.text
	.globl standard__crypto__hashing__SHA256__sha256_transform__2__SHA256_CTXE1_ptr1__byteE1_ptr1__ret_voidE1
	.def standard__crypto__hashing__SHA256__sha256_transform__2__SHA256_CTXE1_ptr1__byteE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__hashing__SHA256__sha256_transform__2__SHA256_CTXE1_ptr1__byteE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $400, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
	movq %r14, -48(%rbp)
	movq %r15, -56(%rbp)
.LB11353:
	movq %rcx, %rbx
	leaq .LZERO(%rip), %rsi
	leaq -312(%rbp), %rdi
	movl $256, %ecx
	rep movsb
	xorl %eax, %eax
.LB11368:
	cmpl $16, %eax
	jae .LB11371
.LB11369:
	movl %eax, %ecx
	shll $2, %ecx
	movslq %ecx, %rsi
	movzbl (%rdx,%rsi,1), %esi
	shll $24, %esi
	leal 1(%rcx), %edi
	movslq %edi, %rdi
	movzbl (%rdx,%rdi,1), %edi
	shll $16, %edi
	orl %edi, %esi
	leal 2(%rcx), %edi
	movslq %edi, %rdi
	movzbl (%rdx,%rdi,1), %edi
	shll $8, %edi
	orl %edi, %esi
	addl $3, %ecx
	movslq %ecx, %rcx
	movzbl (%rdx,%rcx,1), %ecx
	orl %ecx, %esi
	movslq %eax, %rcx
	movl %esi, -312(%rbp,%rcx,4)
	incl %eax
	cmpl $16, %eax
	jb .LB11369
.LB11371:
	movl $16, %esi
.LB11415:
	cmpl $64, %esi
	jae .LB11418
.LB11416:
	leal -2(%rsi), %eax
	movslq %eax, %rax
	movl -312(%rbp,%rax,4), %ecx
	callq standard__crypto__hashing__SHA256__gamma1__1__dataE1_ubits32__ret_dataE1_ubits32
	leal -7(%rsi), %ecx
	movslq %ecx, %rcx
	movl %eax, %edi
	addl -312(%rbp,%rcx,4), %edi
	leal -15(%rsi), %eax
	movslq %eax, %rax
	movl -312(%rbp,%rax,4), %ecx
	callq standard__crypto__hashing__SHA256__gamma0__1__dataE1_ubits32__ret_dataE1_ubits32
	addl %eax, %edi
	leal -16(%rsi), %eax
	movslq %eax, %rax
	addl -312(%rbp,%rax,4), %edi
	movslq %esi, %rax
	movl %edi, -312(%rbp,%rax,4)
	incl %esi
	cmpl $64, %esi
	jb .LB11416
.LB11418:
	movl (%rbx), %esi
	movl 4(%rbx), %edi
	movl 8(%rbx), %r12d
	movl 12(%rbx), %eax
	movl 16(%rbx), %r13d
	movl 20(%rbx), %r14d
	movl 24(%rbx), %ecx
	movl 28(%rbx), %edx
	movq %rax, -352(%rbp)
	movq %rcx, -320(%rbp)
	movq %rdx, -328(%rbp)
	movq $0, -336(%rbp)
.LB11486:
	movq -336(%rbp), %rax
	cmpl $64, %eax
	jae .LB11489
.LB11487:
	movq %r13, %rcx
	callq standard__crypto__hashing__SHA256__sigma1__1__dataE1_ubits32__ret_dataE1_ubits32
	movq -328(%rbp), %rcx
	addl %eax, %ecx
	movq %rcx, -344(%rbp)
	movq %r13, %rcx
	movq %r14, %rdx
	movq -320(%rbp), %r8
	callq standard__crypto__hashing__SHA256__ch__3__dataE1_ubits32__dataE1_ubits32__dataE1_ubits32__ret_dataE1_ubits32
	movq -344(%rbp), %rcx
	addl %eax, %ecx
	leaq standard__crypto__hashing__SHA256__K(%rip), %rax
	movq -336(%rbp), %rdx
	movslq %edx, %rdx
	addl (%rax,%rdx,4), %ecx
	movl %ecx, %r15d
	addl -312(%rbp,%rdx,4), %r15d
	movq %rsi, %rcx
	callq standard__crypto__hashing__SHA256__sigma0__1__dataE1_ubits32__ret_dataE1_ubits32
	movq %rax, -360(%rbp)
	movq %rsi, %rcx
	movq %rdi, %rdx
	movq %r12, %r8
	callq standard__crypto__hashing__SHA256__maj__3__dataE1_ubits32__dataE1_ubits32__dataE1_ubits32__ret_dataE1_ubits32
	movq -360(%rbp), %rcx
	addl %eax, %ecx
	movq -352(%rbp), %rax
	movq -336(%rbp), %rdx
	addl %r15d, %eax
	addl %r15d, %ecx
	incl %edx
	movq %r12, -352(%rbp)
	movq -320(%rbp), %r10
	movq %r10, -328(%rbp)
	movq %rdx, -336(%rbp)
	movq %rdi, %r12
	movq %r14, -320(%rbp)
	movq %rsi, %rdi
	movq %r13, %r14
	movq %rcx, %rsi
	movq %rax, %r13
	jmp .LB11486
.LB11489:
	addl (%rbx), %esi
	movl %esi, (%rbx)
	addl 4(%rbx), %edi
	movl %edi, 4(%rbx)
	addl 8(%rbx), %r12d
	movl %r12d, 8(%rbx)
	movq -352(%rbp), %rax
	addl 12(%rbx), %eax
	movl %eax, 12(%rbx)
	addl 16(%rbx), %r13d
	movl %r13d, 16(%rbx)
	addl 20(%rbx), %r14d
	movl %r14d, 20(%rbx)
	movq -320(%rbp), %rax
	addl 24(%rbx), %eax
	movl %eax, 24(%rbx)
	movq -328(%rbp), %rax
	addl 28(%rbx), %eax
	movl %eax, 28(%rbx)
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
	.globl standard__crypto__hashing__SHA256__sha256_update__3__SHA256_CTXE1_ptr1__byteE1_ptr1__dataE1_ubits64__ret_voidE1
	.def standard__crypto__hashing__SHA256__sha256_update__3__SHA256_CTXE1_ptr1__byteE1_ptr1__dataE1_ubits64__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__hashing__SHA256__sha256_update__3__SHA256_CTXE1_ptr1__byteE1_ptr1__dataE1_ubits64__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
.LB11610:
	movq %rcx, %rsi
	movq %rdx, %rdi
	movq %r8, %rbx
	xorl %r12d, %r12d
.LB11614:
	cmpq %rbx, %r12
	jae .LB11617
.LB11615:
	movslq %r12d, %rax
	movzbl (%rdi,%rax,1), %eax
	movslq 104(%rsi), %rcx
	movb %al, 32(%rsi,%rcx,1)
	movl 104(%rsi), %eax
	incl %eax
	movl %eax, 104(%rsi)
	cmpl $64, %eax
	je .LB11646
.LB11648:
	incq %r12
	cmpq %rbx, %r12
	jb .LB11615
.LB11617:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB11646:
	leaq 32(%rsi), %rdx
	movq %rsi, %rcx
	callq standard__crypto__hashing__SHA256__sha256_transform__2__SHA256_CTXE1_ptr1__byteE1_ptr1__ret_voidE1
	movq 96(%rsi), %rax
	addq $512, %rax
	movq %rax, 96(%rsi)
	movl $0, 104(%rsi)
	jmp .LB11648
	.text
	.globl standard__crypto__hashing__SHA256__sha256_final__2__SHA256_CTXE1_ptr1__byteE1_ptr1__ret_voidE1
	.def standard__crypto__hashing__SHA256__sha256_final__2__SHA256_CTXE1_ptr1__byteE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__hashing__SHA256__sha256_final__2__SHA256_CTXE1_ptr1__byteE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $112, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB11667:
	movq %rcx, %rsi
	movq %rdx, %rdi
	movl 104(%rsi), %eax
	movslq %eax, %rcx
	movb $128, 32(%rsi,%rcx,1)
	incl %eax
	cmpl $56, 104(%rsi)
	jb .LB11687
.LB11688:
	movl $64, %ecx
	subl %eax, %ecx
	xorl %edx, %edx
	cmpl $64, %eax
	cmovb %ecx, %edx
	movl %edx, %ecx
	shrl $2, %ecx
.LB32005:
	testl %ecx, %ecx
	je .LB32007
.LB32006:
	movslq %eax, %rdx
	movb $0, 32(%rsi,%rdx,1)
	leal 1(%rax), %edx
	movslq %edx, %rdx
	movb $0, 32(%rsi,%rdx,1)
	leal 2(%rax), %edx
	movslq %edx, %rdx
	movb $0, 32(%rsi,%rdx,1)
	leal 3(%rax), %edx
	movslq %edx, %rdx
	movb $0, 32(%rsi,%rdx,1)
	addl $4, %eax
	decl %ecx
	jne .LB32006
.LB32007:
.LB11701:
	cmpl $64, %eax
	jae .LB11703
.LB11702:
	movslq %eax, %rcx
	movb $0, 32(%rsi,%rcx,1)
	incl %eax
	cmpl $64, %eax
	jb .LB11702
.LB11703:
	leaq 32(%rsi), %rdx
	movq %rsi, %rcx
	callq standard__crypto__hashing__SHA256__sha256_transform__2__SHA256_CTXE1_ptr1__byteE1_ptr1__ret_voidE1
	movl $14, %eax
	xorl %ecx, %ecx
.LB32008:
	testl %eax, %eax
	je .LB32010
.LB32009:
	movslq %ecx, %rdx
	movb $0, 32(%rsi,%rdx,1)
	leal 1(%rcx), %edx
	movslq %edx, %rdx
	movb $0, 32(%rsi,%rdx,1)
	leal 2(%rcx), %edx
	movslq %edx, %rdx
	movb $0, 32(%rsi,%rdx,1)
	leal 3(%rcx), %edx
	movslq %edx, %rdx
	movb $0, 32(%rsi,%rdx,1)
	addl $4, %ecx
	decl %eax
	jne .LB32009
.LB32010:
.LB11718:
	cmpl $56, %ecx
	jae .LB11689
.LB11719:
	movslq %ecx, %rax
	movb $0, 32(%rsi,%rax,1)
	incl %ecx
	cmpl $56, %ecx
	jb .LB11719
.LB11689:
	movl 104(%rsi), %eax
	leaq 32(%rsi), %rdx
	shll $3, %eax
	addq 96(%rsi), %rax
	movq %rax, 96(%rsi)
	movq %rax, %rcx
	shrq $56, %rcx
	movb %cl, -25(%rbp)
	movq %rax, %rcx
	shrq $48, %rcx
	movb %cl, -24(%rbp)
	movq %rax, %rcx
	shrq $40, %rcx
	movb %cl, -23(%rbp)
	movq %rax, %rcx
	shrq $32, %rcx
	movb %cl, -22(%rbp)
	movq %rax, %rcx
	shrq $24, %rcx
	movb %cl, -21(%rbp)
	movq %rax, %rcx
	shrq $16, %rcx
	movb %cl, -20(%rbp)
	movq %rax, %rcx
	shrq $8, %rcx
	movb %cl, -19(%rbp)
	movb %al, -18(%rbp)
	movb $0, -17(%rbp)
	movzbl -25(%rbp), %eax
	movq %rsi, %rcx
	movb %al, 88(%rsi)
	movzbl -24(%rbp), %eax
	movb %al, 89(%rsi)
	movzbl -23(%rbp), %eax
	movb %al, 90(%rsi)
	movzbl -22(%rbp), %eax
	movb %al, 91(%rsi)
	movzbl -21(%rbp), %eax
	movb %al, 92(%rsi)
	movzbl -20(%rbp), %eax
	movb %al, 93(%rsi)
	movzbl -19(%rbp), %eax
	movb %al, 94(%rsi)
	movzbl -18(%rbp), %eax
	movb %al, 95(%rsi)
	callq standard__crypto__hashing__SHA256__sha256_transform__2__SHA256_CTXE1_ptr1__byteE1_ptr1__ret_voidE1
	movl (%rsi), %eax
	movl %eax, %ecx
	shrl $24, %ecx
	movb %cl, -30(%rbp)
	movl %eax, %ecx
	shrl $16, %ecx
	movb %cl, -29(%rbp)
	movl %eax, %ecx
	shrl $8, %ecx
	movb %cl, -28(%rbp)
	movb %al, -27(%rbp)
	movb $0, -26(%rbp)
	movzbl -30(%rbp), %eax
	movb %al, (%rdi)
	movzbl -29(%rbp), %eax
	movb %al, 1(%rdi)
	movzbl -28(%rbp), %eax
	movb %al, 2(%rdi)
	movzbl -27(%rbp), %eax
	movb %al, 3(%rdi)
	movl 4(%rsi), %eax
	movl %eax, %ecx
	shrl $24, %ecx
	movb %cl, -35(%rbp)
	movl %eax, %ecx
	shrl $16, %ecx
	movb %cl, -34(%rbp)
	movl %eax, %ecx
	shrl $8, %ecx
	movb %cl, -33(%rbp)
	movb %al, -32(%rbp)
	movb $0, -31(%rbp)
	movzbl -35(%rbp), %eax
	movb %al, 4(%rdi)
	movzbl -34(%rbp), %eax
	movb %al, 5(%rdi)
	movzbl -33(%rbp), %eax
	movb %al, 6(%rdi)
	movzbl -32(%rbp), %eax
	movb %al, 7(%rdi)
	movl 8(%rsi), %eax
	movl %eax, %ecx
	shrl $24, %ecx
	movb %cl, -40(%rbp)
	movl %eax, %ecx
	shrl $16, %ecx
	movb %cl, -39(%rbp)
	movl %eax, %ecx
	shrl $8, %ecx
	movb %cl, -38(%rbp)
	movb %al, -37(%rbp)
	movb $0, -36(%rbp)
	movzbl -40(%rbp), %eax
	movb %al, 8(%rdi)
	movzbl -39(%rbp), %eax
	movb %al, 9(%rdi)
	movzbl -38(%rbp), %eax
	movb %al, 10(%rdi)
	movzbl -37(%rbp), %eax
	movb %al, 11(%rdi)
	movl 12(%rsi), %eax
	movl %eax, %ecx
	shrl $24, %ecx
	movb %cl, -45(%rbp)
	movl %eax, %ecx
	shrl $16, %ecx
	movb %cl, -44(%rbp)
	movl %eax, %ecx
	shrl $8, %ecx
	movb %cl, -43(%rbp)
	movb %al, -42(%rbp)
	movb $0, -41(%rbp)
	movzbl -45(%rbp), %eax
	movb %al, 12(%rdi)
	movzbl -44(%rbp), %eax
	movb %al, 13(%rdi)
	movzbl -43(%rbp), %eax
	movb %al, 14(%rdi)
	movzbl -42(%rbp), %eax
	movb %al, 15(%rdi)
	movl 16(%rsi), %eax
	movl %eax, %ecx
	shrl $24, %ecx
	movb %cl, -50(%rbp)
	movl %eax, %ecx
	shrl $16, %ecx
	movb %cl, -49(%rbp)
	movl %eax, %ecx
	shrl $8, %ecx
	movb %cl, -48(%rbp)
	movb %al, -47(%rbp)
	movb $0, -46(%rbp)
	movzbl -50(%rbp), %eax
	movb %al, 16(%rdi)
	movzbl -49(%rbp), %eax
	movb %al, 17(%rdi)
	movzbl -48(%rbp), %eax
	movb %al, 18(%rdi)
	movzbl -47(%rbp), %eax
	movb %al, 19(%rdi)
	movl 20(%rsi), %eax
	movl %eax, %ecx
	shrl $24, %ecx
	movb %cl, -55(%rbp)
	movl %eax, %ecx
	shrl $16, %ecx
	movb %cl, -54(%rbp)
	movl %eax, %ecx
	shrl $8, %ecx
	movb %cl, -53(%rbp)
	movb %al, -52(%rbp)
	movb $0, -51(%rbp)
	movzbl -55(%rbp), %eax
	movb %al, 20(%rdi)
	movzbl -54(%rbp), %eax
	movb %al, 21(%rdi)
	movzbl -53(%rbp), %eax
	movb %al, 22(%rdi)
	movzbl -52(%rbp), %eax
	movb %al, 23(%rdi)
	movl 24(%rsi), %eax
	movl %eax, %ecx
	shrl $24, %ecx
	movb %cl, -60(%rbp)
	movl %eax, %ecx
	shrl $16, %ecx
	movb %cl, -59(%rbp)
	movl %eax, %ecx
	shrl $8, %ecx
	movb %cl, -58(%rbp)
	movb %al, -57(%rbp)
	movb $0, -56(%rbp)
	movzbl -60(%rbp), %eax
	movb %al, 24(%rdi)
	movzbl -59(%rbp), %eax
	movb %al, 25(%rdi)
	movzbl -58(%rbp), %eax
	movb %al, 26(%rdi)
	movzbl -57(%rbp), %eax
	movb %al, 27(%rdi)
	movl 28(%rsi), %eax
	movl %eax, %ecx
	shrl $24, %ecx
	movb %cl, -65(%rbp)
	movl %eax, %ecx
	shrl $16, %ecx
	movb %cl, -64(%rbp)
	movl %eax, %ecx
	shrl $8, %ecx
	movb %cl, -63(%rbp)
	movb %al, -62(%rbp)
	movb $0, -61(%rbp)
	movzbl -65(%rbp), %eax
	movb %al, 28(%rdi)
	movzbl -64(%rbp), %eax
	movb %al, 29(%rdi)
	movzbl -63(%rbp), %eax
	movb %al, 30(%rdi)
	movzbl -62(%rbp), %eax
	movb %al, 31(%rdi)
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB11687:
	movl $56, %ecx
	subl %eax, %ecx
	xorl %edx, %edx
	cmpl $56, %eax
	cmovb %ecx, %edx
	movl %edx, %ecx
	shrl $2, %ecx
.LB32002:
	testl %ecx, %ecx
	je .LB32004
.LB32003:
	movslq %eax, %rdx
	movb $0, 32(%rsi,%rdx,1)
	leal 1(%rax), %edx
	movslq %edx, %rdx
	movb $0, 32(%rsi,%rdx,1)
	leal 2(%rax), %edx
	movslq %edx, %rdx
	movb $0, 32(%rsi,%rdx,1)
	leal 3(%rax), %edx
	movslq %edx, %rdx
	movb $0, 32(%rsi,%rdx,1)
	addl $4, %eax
	decl %ecx
	jne .LB32003
.LB32004:
.LB11690:
	cmpl $56, %eax
	jae .LB11689
.LB11691:
	movslq %eax, %rcx
	movb $0, 32(%rsi,%rcx,1)
	incl %eax
	cmpl $56, %eax
	jb .LB11691
	jmp .LB11689
	.text
	.globl standard__crypto__hashing__SHA384__rotr64__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64
	.def standard__crypto__hashing__SHA384__rotr64__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64;
	.scl 2;
	.type 32;
	.endef
standard__crypto__hashing__SHA384__rotr64__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
.LB12050:
	shrx %rdx, %rcx, %rax
	movl $64, %esi
	subq %rdx, %rsi
	shlx %rsi, %rcx, %rcx
	orq %rcx, %rax
	movq 0(%rsp), %rsi
	addq $16, %rsp
	ret
	.text
	.globl standard__crypto__hashing__SHA384__ch64__3__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64
	.def standard__crypto__hashing__SHA384__ch64__3__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64;
	.scl 2;
	.type 32;
	.endef
standard__crypto__hashing__SHA384__ch64__3__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64:
.LB12062:
	movq %rcx, %rax
	andq %rdx, %rax
	andn %r8, %rcx, %rcx
	xorq %rcx, %rax
	ret
	.text
	.globl standard__crypto__hashing__SHA384__maj64__3__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64
	.def standard__crypto__hashing__SHA384__maj64__3__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64;
	.scl 2;
	.type 32;
	.endef
standard__crypto__hashing__SHA384__maj64__3__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64:
.LB12074:
	movq %rcx, %rax
	andq %rdx, %rax
	andq %r8, %rcx
	xorq %rcx, %rax
	andq %r8, %rdx
	xorq %rdx, %rax
	ret
	.text
	.globl standard__crypto__hashing__SHA384__Sigma0__1__dataE1_ubits64__ret_dataE1_ubits64
	.def standard__crypto__hashing__SHA384__Sigma0__1__dataE1_ubits64__ret_dataE1_ubits64;
	.scl 2;
	.type 32;
	.endef
standard__crypto__hashing__SHA384__Sigma0__1__dataE1_ubits64__ret_dataE1_ubits64:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB12089:
	movq %rcx, %rsi
	movq %rsi, %rcx
	movl $28, %edx
	callq standard__crypto__hashing__SHA384__rotr64__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, %rdi
	movq %rsi, %rcx
	movl $34, %edx
	callq standard__crypto__hashing__SHA384__rotr64__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64
	xorq %rax, %rdi
	movq %rsi, %rcx
	movl $39, %edx
	callq standard__crypto__hashing__SHA384__rotr64__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64
	xorq %rdi, %rax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__crypto__hashing__SHA384__Sigma1__1__dataE1_ubits64__ret_dataE1_ubits64
	.def standard__crypto__hashing__SHA384__Sigma1__1__dataE1_ubits64__ret_dataE1_ubits64;
	.scl 2;
	.type 32;
	.endef
standard__crypto__hashing__SHA384__Sigma1__1__dataE1_ubits64__ret_dataE1_ubits64:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB12102:
	movq %rcx, %rsi
	movq %rsi, %rcx
	movl $14, %edx
	callq standard__crypto__hashing__SHA384__rotr64__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, %rdi
	movq %rsi, %rcx
	movl $18, %edx
	callq standard__crypto__hashing__SHA384__rotr64__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64
	xorq %rax, %rdi
	movq %rsi, %rcx
	movl $41, %edx
	callq standard__crypto__hashing__SHA384__rotr64__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64
	xorq %rdi, %rax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__crypto__hashing__SHA384__sigma0_64__1__dataE1_ubits64__ret_dataE1_ubits64
	.def standard__crypto__hashing__SHA384__sigma0_64__1__dataE1_ubits64__ret_dataE1_ubits64;
	.scl 2;
	.type 32;
	.endef
standard__crypto__hashing__SHA384__sigma0_64__1__dataE1_ubits64__ret_dataE1_ubits64:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB12115:
	movq %rcx, %rsi
	movq %rsi, %rcx
	movl $1, %edx
	callq standard__crypto__hashing__SHA384__rotr64__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, %rdi
	movq %rsi, %rcx
	movl $8, %edx
	callq standard__crypto__hashing__SHA384__rotr64__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64
	xorq %rax, %rdi
	shrq $7, %rsi
	movq %rdi, %rax
	xorq %rsi, %rax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__crypto__hashing__SHA384__sigma1_64__1__dataE1_ubits64__ret_dataE1_ubits64
	.def standard__crypto__hashing__SHA384__sigma1_64__1__dataE1_ubits64__ret_dataE1_ubits64;
	.scl 2;
	.type 32;
	.endef
standard__crypto__hashing__SHA384__sigma1_64__1__dataE1_ubits64__ret_dataE1_ubits64:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB12128:
	movq %rcx, %rsi
	movq %rsi, %rcx
	movl $19, %edx
	callq standard__crypto__hashing__SHA384__rotr64__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, %rdi
	movq %rsi, %rcx
	movl $61, %edx
	callq standard__crypto__hashing__SHA384__rotr64__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64
	xorq %rax, %rdi
	shrq $6, %rsi
	movq %rdi, %rax
	xorq %rsi, %rax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__crypto__hashing__SHA384__sha384_init__1__SHA384_CTXE1_ptr1__ret_voidE1
	.def standard__crypto__hashing__SHA384__sha384_init__1__SHA384_CTXE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__hashing__SHA384__sha384_init__1__SHA384_CTXE1_ptr1__ret_voidE1:
	subq $64, %rsp
.LB12141:
	vmovdqu .LC32010(%rip), %ymm15
	vmovdqu %ymm15, -8(%rsp)
	vmovdqu .LC32010+32(%rip), %ymm15
	vmovdqu %ymm15, 24(%rsp)
	vzeroupper
	movabsq $-3766243637369397544, %rax
	movq %rax, (%rcx)
	movabsq $7105036623409894663, %rax
	movq %rax, 8(%rcx)
	movabsq $-7973340178411365097, %rax
	movq %rax, 16(%rcx)
	movabsq $1526699215303891257, %rax
	movq %rax, 24(%rcx)
	movabsq $7436329637833083697, %rax
	movq %rax, 32(%rcx)
	movabsq $-8163818279084223215, %rax
	movq %rax, 40(%rcx)
	movabsq $-2662702644619276377, %rax
	movq %rax, 48(%rcx)
	movabsq $5167115440072839076, %rax
	movq %rax, 56(%rcx)
	movq $0, 192(%rcx)
	movq $0, 200(%rcx)
	movl $0, 208(%rcx)
	addq $64, %rsp
	ret
	.text
	.globl standard__crypto__hashing__SHA384__sha384_transform__2__SHA384_CTXE1_ptr1__byteE1_ptr1__ret_voidE1
	.def standard__crypto__hashing__SHA384__sha384_transform__2__SHA384_CTXE1_ptr1__byteE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__hashing__SHA384__sha384_transform__2__SHA384_CTXE1_ptr1__byteE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $784, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
	movq %r14, -48(%rbp)
	movq %r15, -56(%rbp)
.LB12162:
	movq %rcx, %rsi
	leaq -696(%rbp), %rax
	movq %rax, %rdi
	xorl %eax, %eax
	movl $640, %ecx
	rep stosb
	xorl %eax, %eax
.LB12178:
	cmpl $16, %eax
	jae .LB12181
.LB12179:
	movl %eax, %ecx
	shll $3, %ecx
	movslq %ecx, %rdi
	movzbl (%rdx,%rdi,1), %edi
	shlq $56, %rdi
	leal 1(%rcx), %r8d
	movslq %r8d, %r8
	movzbl (%rdx,%r8,1), %r8d
	shlq $48, %r8
	orq %r8, %rdi
	leal 2(%rcx), %r8d
	movslq %r8d, %r8
	movzbl (%rdx,%r8,1), %r8d
	shlq $40, %r8
	orq %r8, %rdi
	leal 3(%rcx), %r8d
	movslq %r8d, %r8
	movzbl (%rdx,%r8,1), %r8d
	shlq $32, %r8
	orq %r8, %rdi
	leal 4(%rcx), %r8d
	movslq %r8d, %r8
	movzbl (%rdx,%r8,1), %r8d
	shlq $24, %r8
	orq %r8, %rdi
	leal 5(%rcx), %r8d
	movslq %r8d, %r8
	movzbl (%rdx,%r8,1), %r8d
	shlq $16, %r8
	orq %r8, %rdi
	leal 6(%rcx), %r8d
	movslq %r8d, %r8
	movzbl (%rdx,%r8,1), %r8d
	shlq $8, %r8
	orq %r8, %rdi
	addl $7, %ecx
	movslq %ecx, %rcx
	movzbl (%rdx,%rcx,1), %ecx
	orq %rcx, %rdi
	movslq %eax, %rcx
	movq %rdi, -696(%rbp,%rcx,8)
	incl %eax
	cmpl $16, %eax
	jb .LB12179
.LB12181:
	movl $16, %edi
.LB12280:
	cmpl $80, %edi
	jae .LB12283
.LB12281:
	leal -2(%rdi), %eax
	movslq %eax, %rax
	movq -696(%rbp,%rax,8), %rcx
	callq standard__crypto__hashing__SHA384__sigma1_64__1__dataE1_ubits64__ret_dataE1_ubits64
	leal -7(%rdi), %ecx
	movslq %ecx, %rcx
	movq %rax, %rbx
	addq -696(%rbp,%rcx,8), %rbx
	leal -15(%rdi), %eax
	movslq %eax, %rax
	movq -696(%rbp,%rax,8), %rcx
	callq standard__crypto__hashing__SHA384__sigma0_64__1__dataE1_ubits64__ret_dataE1_ubits64
	addq %rax, %rbx
	leal -16(%rdi), %eax
	movslq %eax, %rax
	addq -696(%rbp,%rax,8), %rbx
	movslq %edi, %rax
	movq %rbx, -696(%rbp,%rax,8)
	incl %edi
	cmpl $80, %edi
	jb .LB12281
.LB12283:
	movq (%rsi), %rdi
	movq 8(%rsi), %rbx
	movq 16(%rsi), %r12
	movq 24(%rsi), %rax
	movq 32(%rsi), %r13
	movq 40(%rsi), %r14
	movq 48(%rsi), %rcx
	movq 56(%rsi), %rdx
	movq %rax, -736(%rbp)
	movq %rcx, -704(%rbp)
	movq %rdx, -712(%rbp)
	movq $0, -720(%rbp)
.LB12351:
	movq -720(%rbp), %rax
	cmpl $80, %eax
	jae .LB12354
.LB12352:
	movq %r13, %rcx
	callq standard__crypto__hashing__SHA384__Sigma1__1__dataE1_ubits64__ret_dataE1_ubits64
	movq -712(%rbp), %rcx
	addq %rax, %rcx
	movq %rcx, -728(%rbp)
	movq %r13, %rcx
	movq %r14, %rdx
	movq -704(%rbp), %r8
	callq standard__crypto__hashing__SHA384__ch64__3__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64
	movq -728(%rbp), %rcx
	addq %rax, %rcx
	leaq standard__crypto__hashing__SHA384__K384(%rip), %rax
	movq -720(%rbp), %rdx
	movslq %edx, %rdx
	addq (%rax,%rdx,8), %rcx
	movq %rcx, %r15
	addq -696(%rbp,%rdx,8), %r15
	movq %rdi, %rcx
	callq standard__crypto__hashing__SHA384__Sigma0__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -744(%rbp)
	movq %rdi, %rcx
	movq %rbx, %rdx
	movq %r12, %r8
	callq standard__crypto__hashing__SHA384__maj64__3__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64
	movq -744(%rbp), %rcx
	addq %rax, %rcx
	movq -736(%rbp), %rax
	movq -720(%rbp), %rdx
	addq %r15, %rax
	addq %r15, %rcx
	incl %edx
	movq %r12, -736(%rbp)
	movq -704(%rbp), %r10
	movq %r10, -712(%rbp)
	movq %rdx, -720(%rbp)
	movq %rbx, %r12
	movq %r14, -704(%rbp)
	movq %rdi, %rbx
	movq %r13, %r14
	movq %rcx, %rdi
	movq %rax, %r13
	jmp .LB12351
.LB12354:
	addq (%rsi), %rdi
	movq %rdi, (%rsi)
	addq 8(%rsi), %rbx
	movq %rbx, 8(%rsi)
	addq 16(%rsi), %r12
	movq %r12, 16(%rsi)
	movq -736(%rbp), %rax
	addq 24(%rsi), %rax
	movq %rax, 24(%rsi)
	addq 32(%rsi), %r13
	movq %r13, 32(%rsi)
	addq 40(%rsi), %r14
	movq %r14, 40(%rsi)
	movq -704(%rbp), %rax
	addq 48(%rsi), %rax
	movq %rax, 48(%rsi)
	movq -712(%rbp), %rax
	addq 56(%rsi), %rax
	movq %rax, 56(%rsi)
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
	.globl standard__crypto__hashing__SHA384__sha384_update__3__SHA384_CTXE1_ptr1__byteE1_ptr1__dataE1_ubits64__ret_voidE1
	.def standard__crypto__hashing__SHA384__sha384_update__3__SHA384_CTXE1_ptr1__byteE1_ptr1__dataE1_ubits64__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__hashing__SHA384__sha384_update__3__SHA384_CTXE1_ptr1__byteE1_ptr1__dataE1_ubits64__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
.LB12475:
	movq %rcx, %rsi
	movq %rdx, %rdi
	movq %r8, %rbx
	xorl %r12d, %r12d
.LB12480:
	cmpq %rbx, %r12
	jae .LB12483
.LB12481:
	movslq %r12d, %rax
	movzbl (%rdi,%rax,1), %eax
	movslq 208(%rsi), %rcx
	movb %al, 64(%rsi,%rcx,1)
	movl 208(%rsi), %eax
	incl %eax
	movl %eax, 208(%rsi)
	cmpl $128, %eax
	je .LB12512
.LB12514:
	incq %r12
	cmpq %rbx, %r12
	jb .LB12481
.LB12483:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB12512:
	leaq 64(%rsi), %rdx
	movq %rsi, %rcx
	callq standard__crypto__hashing__SHA384__sha384_transform__2__SHA384_CTXE1_ptr1__byteE1_ptr1__ret_voidE1
	movq 192(%rsi), %rax
	addq $1024, %rax
	movq %rax, 192(%rsi)
	testq %rax, %rax
	je .LB12535
.LB12537:
	movl $0, 208(%rsi)
	jmp .LB12514
.LB12535:
	movq 200(%rsi), %rax
	incq %rax
	movq %rax, 200(%rsi)
	jmp .LB12537
	.text
	.globl standard__crypto__hashing__SHA384__sha384_final__2__SHA384_CTXE1_ptr1__byteE1_ptr1__ret_voidE1
	.def standard__crypto__hashing__SHA384__sha384_final__2__SHA384_CTXE1_ptr1__byteE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__hashing__SHA384__sha384_final__2__SHA384_CTXE1_ptr1__byteE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $128, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB12550:
	movq %rcx, %rsi
	movq %rdx, %rdi
	movl 208(%rsi), %eax
	movslq %eax, %rcx
	movb $128, 64(%rsi,%rcx,1)
	incl %eax
	cmpl $112, 208(%rsi)
	jb .LB12572
.LB12573:
	movl $128, %ecx
	subl %eax, %ecx
	xorl %edx, %edx
	cmpl $128, %eax
	cmovb %ecx, %edx
	movl %edx, %ecx
	shrl $2, %ecx
.LB32015:
	testl %ecx, %ecx
	je .LB32017
.LB32016:
	movslq %eax, %rdx
	movb $0, 64(%rsi,%rdx,1)
	leal 1(%rax), %edx
	movslq %edx, %rdx
	movb $0, 64(%rsi,%rdx,1)
	leal 2(%rax), %edx
	movslq %edx, %rdx
	movb $0, 64(%rsi,%rdx,1)
	leal 3(%rax), %edx
	movslq %edx, %rdx
	movb $0, 64(%rsi,%rdx,1)
	addl $4, %eax
	decl %ecx
	jne .LB32016
.LB32017:
.LB12587:
	cmpl $128, %eax
	jae .LB12589
.LB12588:
	movslq %eax, %rcx
	movb $0, 64(%rsi,%rcx,1)
	incl %eax
	cmpl $128, %eax
	jb .LB12588
.LB12589:
	leaq 64(%rsi), %rdx
	movq %rsi, %rcx
	callq standard__crypto__hashing__SHA384__sha384_transform__2__SHA384_CTXE1_ptr1__byteE1_ptr1__ret_voidE1
	movl $28, %eax
	xorl %ecx, %ecx
.LB32018:
	testl %eax, %eax
	je .LB32020
.LB32019:
	movslq %ecx, %rdx
	movb $0, 64(%rsi,%rdx,1)
	leal 1(%rcx), %edx
	movslq %edx, %rdx
	movb $0, 64(%rsi,%rdx,1)
	leal 2(%rcx), %edx
	movslq %edx, %rdx
	movb $0, 64(%rsi,%rdx,1)
	leal 3(%rcx), %edx
	movslq %edx, %rdx
	movb $0, 64(%rsi,%rdx,1)
	addl $4, %ecx
	decl %eax
	jne .LB32019
.LB32020:
.LB12605:
	cmpl $112, %ecx
	jae .LB12574
.LB12606:
	movslq %ecx, %rax
	movb $0, 64(%rsi,%rax,1)
	incl %ecx
	cmpl $112, %ecx
	jb .LB12606
.LB12574:
	movq 192(%rsi), %rax
	movl 208(%rsi), %ecx
	movq 200(%rsi), %rdx
	shlq $3, %rcx
	addq %rax, %rcx
	leaq 1(%rdx), %r8
	cmpq %rax, %rcx
	movq %rdx, %rax
	cmovb %r8, %rax
	movq %rax, %rdx
	shrq $56, %rdx
	movb %dl, -25(%rbp)
	movq %rax, %rdx
	shrq $48, %rdx
	movb %dl, -24(%rbp)
	movq %rax, %rdx
	shrq $40, %rdx
	movb %dl, -23(%rbp)
	movq %rax, %rdx
	shrq $32, %rdx
	movb %dl, -22(%rbp)
	movq %rax, %rdx
	shrq $24, %rdx
	movb %dl, -21(%rbp)
	movq %rax, %rdx
	shrq $16, %rdx
	movb %dl, -20(%rbp)
	movq %rax, %rdx
	shrq $8, %rdx
	movb %dl, -19(%rbp)
	movb %al, -18(%rbp)
	movb $0, -17(%rbp)
	movzbl -25(%rbp), %eax
	movb %al, 176(%rsi)
	movzbl -24(%rbp), %eax
	movb %al, 177(%rsi)
	movzbl -23(%rbp), %eax
	movb %al, 178(%rsi)
	movzbl -22(%rbp), %eax
	movb %al, 179(%rsi)
	movzbl -21(%rbp), %eax
	movb %al, 180(%rsi)
	movzbl -20(%rbp), %eax
	movb %al, 181(%rsi)
	movzbl -19(%rbp), %eax
	movb %al, 182(%rsi)
	movzbl -18(%rbp), %eax
	movb %al, 183(%rsi)
	movq %rcx, %rax
	shrq $56, %rax
	leaq 64(%rsi), %rdx
	movb %al, -34(%rbp)
	movq %rcx, %rax
	shrq $48, %rax
	movb %al, -33(%rbp)
	movq %rcx, %rax
	shrq $40, %rax
	movb %al, -32(%rbp)
	movq %rcx, %rax
	shrq $32, %rax
	movb %al, -31(%rbp)
	movq %rcx, %rax
	shrq $24, %rax
	movb %al, -30(%rbp)
	movq %rcx, %rax
	shrq $16, %rax
	movb %al, -29(%rbp)
	movq %rcx, %rax
	shrq $8, %rax
	movb %al, -28(%rbp)
	movb %cl, -27(%rbp)
	movb $0, -26(%rbp)
	movzbl -34(%rbp), %eax
	movq %rsi, %rcx
	movb %al, 184(%rsi)
	movzbl -33(%rbp), %eax
	movb %al, 185(%rsi)
	movzbl -32(%rbp), %eax
	movb %al, 186(%rsi)
	movzbl -31(%rbp), %eax
	movb %al, 187(%rsi)
	movzbl -30(%rbp), %eax
	movb %al, 188(%rsi)
	movzbl -29(%rbp), %eax
	movb %al, 189(%rsi)
	movzbl -28(%rbp), %eax
	movb %al, 190(%rsi)
	movzbl -27(%rbp), %eax
	movb %al, 191(%rsi)
	callq standard__crypto__hashing__SHA384__sha384_transform__2__SHA384_CTXE1_ptr1__byteE1_ptr1__ret_voidE1
	movq (%rsi), %rax
	movq %rax, %rcx
	shrq $56, %rcx
	movb %cl, -43(%rbp)
	movq %rax, %rcx
	shrq $48, %rcx
	movb %cl, -42(%rbp)
	movq %rax, %rcx
	shrq $40, %rcx
	movb %cl, -41(%rbp)
	movq %rax, %rcx
	shrq $32, %rcx
	movb %cl, -40(%rbp)
	movq %rax, %rcx
	shrq $24, %rcx
	movb %cl, -39(%rbp)
	movq %rax, %rcx
	shrq $16, %rcx
	movb %cl, -38(%rbp)
	movq %rax, %rcx
	shrq $8, %rcx
	movb %cl, -37(%rbp)
	movb %al, -36(%rbp)
	movb $0, -35(%rbp)
	movzbl -43(%rbp), %eax
	movb %al, (%rdi)
	movzbl -42(%rbp), %eax
	movb %al, 1(%rdi)
	movzbl -41(%rbp), %eax
	movb %al, 2(%rdi)
	movzbl -40(%rbp), %eax
	movb %al, 3(%rdi)
	movzbl -39(%rbp), %eax
	movb %al, 4(%rdi)
	movzbl -38(%rbp), %eax
	movb %al, 5(%rdi)
	movzbl -37(%rbp), %eax
	movb %al, 6(%rdi)
	movzbl -36(%rbp), %eax
	movb %al, 7(%rdi)
	movq 8(%rsi), %rax
	movq %rax, %rcx
	shrq $56, %rcx
	movb %cl, -52(%rbp)
	movq %rax, %rcx
	shrq $48, %rcx
	movb %cl, -51(%rbp)
	movq %rax, %rcx
	shrq $40, %rcx
	movb %cl, -50(%rbp)
	movq %rax, %rcx
	shrq $32, %rcx
	movb %cl, -49(%rbp)
	movq %rax, %rcx
	shrq $24, %rcx
	movb %cl, -48(%rbp)
	movq %rax, %rcx
	shrq $16, %rcx
	movb %cl, -47(%rbp)
	movq %rax, %rcx
	shrq $8, %rcx
	movb %cl, -46(%rbp)
	movb %al, -45(%rbp)
	movb $0, -44(%rbp)
	movzbl -52(%rbp), %eax
	movb %al, 8(%rdi)
	movzbl -51(%rbp), %eax
	movb %al, 9(%rdi)
	movzbl -50(%rbp), %eax
	movb %al, 10(%rdi)
	movzbl -49(%rbp), %eax
	movb %al, 11(%rdi)
	movzbl -48(%rbp), %eax
	movb %al, 12(%rdi)
	movzbl -47(%rbp), %eax
	movb %al, 13(%rdi)
	movzbl -46(%rbp), %eax
	movb %al, 14(%rdi)
	movzbl -45(%rbp), %eax
	movb %al, 15(%rdi)
	movq 16(%rsi), %rax
	movq %rax, %rcx
	shrq $56, %rcx
	movb %cl, -61(%rbp)
	movq %rax, %rcx
	shrq $48, %rcx
	movb %cl, -60(%rbp)
	movq %rax, %rcx
	shrq $40, %rcx
	movb %cl, -59(%rbp)
	movq %rax, %rcx
	shrq $32, %rcx
	movb %cl, -58(%rbp)
	movq %rax, %rcx
	shrq $24, %rcx
	movb %cl, -57(%rbp)
	movq %rax, %rcx
	shrq $16, %rcx
	movb %cl, -56(%rbp)
	movq %rax, %rcx
	shrq $8, %rcx
	movb %cl, -55(%rbp)
	movb %al, -54(%rbp)
	movb $0, -53(%rbp)
	movzbl -61(%rbp), %eax
	movb %al, 16(%rdi)
	movzbl -60(%rbp), %eax
	movb %al, 17(%rdi)
	movzbl -59(%rbp), %eax
	movb %al, 18(%rdi)
	movzbl -58(%rbp), %eax
	movb %al, 19(%rdi)
	movzbl -57(%rbp), %eax
	movb %al, 20(%rdi)
	movzbl -56(%rbp), %eax
	movb %al, 21(%rdi)
	movzbl -55(%rbp), %eax
	movb %al, 22(%rdi)
	movzbl -54(%rbp), %eax
	movb %al, 23(%rdi)
	movq 24(%rsi), %rax
	movq %rax, %rcx
	shrq $56, %rcx
	movb %cl, -70(%rbp)
	movq %rax, %rcx
	shrq $48, %rcx
	movb %cl, -69(%rbp)
	movq %rax, %rcx
	shrq $40, %rcx
	movb %cl, -68(%rbp)
	movq %rax, %rcx
	shrq $32, %rcx
	movb %cl, -67(%rbp)
	movq %rax, %rcx
	shrq $24, %rcx
	movb %cl, -66(%rbp)
	movq %rax, %rcx
	shrq $16, %rcx
	movb %cl, -65(%rbp)
	movq %rax, %rcx
	shrq $8, %rcx
	movb %cl, -64(%rbp)
	movb %al, -63(%rbp)
	movb $0, -62(%rbp)
	movzbl -70(%rbp), %eax
	movb %al, 24(%rdi)
	movzbl -69(%rbp), %eax
	movb %al, 25(%rdi)
	movzbl -68(%rbp), %eax
	movb %al, 26(%rdi)
	movzbl -67(%rbp), %eax
	movb %al, 27(%rdi)
	movzbl -66(%rbp), %eax
	movb %al, 28(%rdi)
	movzbl -65(%rbp), %eax
	movb %al, 29(%rdi)
	movzbl -64(%rbp), %eax
	movb %al, 30(%rdi)
	movzbl -63(%rbp), %eax
	movb %al, 31(%rdi)
	movq 32(%rsi), %rax
	movq %rax, %rcx
	shrq $56, %rcx
	movb %cl, -79(%rbp)
	movq %rax, %rcx
	shrq $48, %rcx
	movb %cl, -78(%rbp)
	movq %rax, %rcx
	shrq $40, %rcx
	movb %cl, -77(%rbp)
	movq %rax, %rcx
	shrq $32, %rcx
	movb %cl, -76(%rbp)
	movq %rax, %rcx
	shrq $24, %rcx
	movb %cl, -75(%rbp)
	movq %rax, %rcx
	shrq $16, %rcx
	movb %cl, -74(%rbp)
	movq %rax, %rcx
	shrq $8, %rcx
	movb %cl, -73(%rbp)
	movb %al, -72(%rbp)
	movb $0, -71(%rbp)
	movzbl -79(%rbp), %eax
	movb %al, 32(%rdi)
	movzbl -78(%rbp), %eax
	movb %al, 33(%rdi)
	movzbl -77(%rbp), %eax
	movb %al, 34(%rdi)
	movzbl -76(%rbp), %eax
	movb %al, 35(%rdi)
	movzbl -75(%rbp), %eax
	movb %al, 36(%rdi)
	movzbl -74(%rbp), %eax
	movb %al, 37(%rdi)
	movzbl -73(%rbp), %eax
	movb %al, 38(%rdi)
	movzbl -72(%rbp), %eax
	movb %al, 39(%rdi)
	movq 40(%rsi), %rax
	movq %rax, %rcx
	shrq $56, %rcx
	movb %cl, -88(%rbp)
	movq %rax, %rcx
	shrq $48, %rcx
	movb %cl, -87(%rbp)
	movq %rax, %rcx
	shrq $40, %rcx
	movb %cl, -86(%rbp)
	movq %rax, %rcx
	shrq $32, %rcx
	movb %cl, -85(%rbp)
	movq %rax, %rcx
	shrq $24, %rcx
	movb %cl, -84(%rbp)
	movq %rax, %rcx
	shrq $16, %rcx
	movb %cl, -83(%rbp)
	movq %rax, %rcx
	shrq $8, %rcx
	movb %cl, -82(%rbp)
	movb %al, -81(%rbp)
	movb $0, -80(%rbp)
	movzbl -88(%rbp), %eax
	movb %al, 40(%rdi)
	movzbl -87(%rbp), %eax
	movb %al, 41(%rdi)
	movzbl -86(%rbp), %eax
	movb %al, 42(%rdi)
	movzbl -85(%rbp), %eax
	movb %al, 43(%rdi)
	movzbl -84(%rbp), %eax
	movb %al, 44(%rdi)
	movzbl -83(%rbp), %eax
	movb %al, 45(%rdi)
	movzbl -82(%rbp), %eax
	movb %al, 46(%rdi)
	movzbl -81(%rbp), %eax
	movb %al, 47(%rdi)
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB12572:
	movl $112, %ecx
	subl %eax, %ecx
	xorl %edx, %edx
	cmpl $112, %eax
	cmovb %ecx, %edx
	movl %edx, %ecx
	shrl $2, %ecx
.LB32012:
	testl %ecx, %ecx
	je .LB32014
.LB32013:
	movslq %eax, %rdx
	movb $0, 64(%rsi,%rdx,1)
	leal 1(%rax), %edx
	movslq %edx, %rdx
	movb $0, 64(%rsi,%rdx,1)
	leal 2(%rax), %edx
	movslq %edx, %rdx
	movb $0, 64(%rsi,%rdx,1)
	leal 3(%rax), %edx
	movslq %edx, %rdx
	movb $0, 64(%rsi,%rdx,1)
	addl $4, %eax
	decl %ecx
	jne .LB32013
.LB32014:
.LB12575:
	cmpl $112, %eax
	jae .LB12574
.LB12576:
	movslq %eax, %rcx
	movb $0, 64(%rsi,%rcx,1)
	incl %eax
	cmpl $112, %eax
	jb .LB12576
	jmp .LB12574
	.text
	.globl standard__crypto__hashing__SHA384__sha512_init__1__SHA384_CTXE1_ptr1__ret_voidE1
	.def standard__crypto__hashing__SHA384__sha512_init__1__SHA384_CTXE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__hashing__SHA384__sha512_init__1__SHA384_CTXE1_ptr1__ret_voidE1:
	subq $64, %rsp
.LB13001:
	vmovdqu .LC32020(%rip), %ymm15
	vmovdqu %ymm15, -8(%rsp)
	vmovdqu .LC32020+32(%rip), %ymm15
	vmovdqu %ymm15, 24(%rsp)
	vzeroupper
	movabsq $7640891576956012808, %rax
	movq %rax, (%rcx)
	movabsq $-4942790177534073029, %rax
	movq %rax, 8(%rcx)
	movabsq $4354685564936845355, %rax
	movq %rax, 16(%rcx)
	movabsq $-6534734903238641935, %rax
	movq %rax, 24(%rcx)
	movabsq $5840696475078001361, %rax
	movq %rax, 32(%rcx)
	movabsq $-7276294671716946913, %rax
	movq %rax, 40(%rcx)
	movabsq $2270897969802886507, %rax
	movq %rax, 48(%rcx)
	movabsq $6620516959819538809, %rax
	movq %rax, 56(%rcx)
	movq $0, 192(%rcx)
	movq $0, 200(%rcx)
	movl $0, 208(%rcx)
	addq $64, %rsp
	ret
	.text
	.globl standard__crypto__hashing__SHA384__sha512_final__2__SHA384_CTXE1_ptr1__byteE1_ptr1__ret_voidE1
	.def standard__crypto__hashing__SHA384__sha512_final__2__SHA384_CTXE1_ptr1__byteE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__hashing__SHA384__sha512_final__2__SHA384_CTXE1_ptr1__byteE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $144, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB13022:
	movq %rcx, %rsi
	movq %rdx, %rdi
	movl 208(%rsi), %eax
	movslq %eax, %rcx
	movb $128, 64(%rsi,%rcx,1)
	incl %eax
	cmpl $112, 208(%rsi)
	jb .LB13044
.LB13045:
	movl $128, %ecx
	subl %eax, %ecx
	xorl %edx, %edx
	cmpl $128, %eax
	cmovb %ecx, %edx
	movl %edx, %ecx
	shrl $2, %ecx
.LB32025:
	testl %ecx, %ecx
	je .LB32027
.LB32026:
	movslq %eax, %rdx
	movb $0, 64(%rsi,%rdx,1)
	leal 1(%rax), %edx
	movslq %edx, %rdx
	movb $0, 64(%rsi,%rdx,1)
	leal 2(%rax), %edx
	movslq %edx, %rdx
	movb $0, 64(%rsi,%rdx,1)
	leal 3(%rax), %edx
	movslq %edx, %rdx
	movb $0, 64(%rsi,%rdx,1)
	addl $4, %eax
	decl %ecx
	jne .LB32026
.LB32027:
.LB13059:
	cmpl $128, %eax
	jae .LB13061
.LB13060:
	movslq %eax, %rcx
	movb $0, 64(%rsi,%rcx,1)
	incl %eax
	cmpl $128, %eax
	jb .LB13060
.LB13061:
	leaq 64(%rsi), %rdx
	movq %rsi, %rcx
	callq standard__crypto__hashing__SHA384__sha384_transform__2__SHA384_CTXE1_ptr1__byteE1_ptr1__ret_voidE1
	movl $28, %eax
	xorl %ecx, %ecx
.LB32028:
	testl %eax, %eax
	je .LB32030
.LB32029:
	movslq %ecx, %rdx
	movb $0, 64(%rsi,%rdx,1)
	leal 1(%rcx), %edx
	movslq %edx, %rdx
	movb $0, 64(%rsi,%rdx,1)
	leal 2(%rcx), %edx
	movslq %edx, %rdx
	movb $0, 64(%rsi,%rdx,1)
	leal 3(%rcx), %edx
	movslq %edx, %rdx
	movb $0, 64(%rsi,%rdx,1)
	addl $4, %ecx
	decl %eax
	jne .LB32029
.LB32030:
.LB13077:
	cmpl $112, %ecx
	jae .LB13046
.LB13078:
	movslq %ecx, %rax
	movb $0, 64(%rsi,%rax,1)
	incl %ecx
	cmpl $112, %ecx
	jb .LB13078
.LB13046:
	movq 192(%rsi), %rax
	movl 208(%rsi), %ecx
	movq 200(%rsi), %rdx
	shlq $3, %rcx
	addq %rax, %rcx
	leaq 1(%rdx), %r8
	cmpq %rax, %rcx
	movq %rdx, %rax
	cmovb %r8, %rax
	movq %rax, %rdx
	shrq $56, %rdx
	movb %dl, -25(%rbp)
	movq %rax, %rdx
	shrq $48, %rdx
	movb %dl, -24(%rbp)
	movq %rax, %rdx
	shrq $40, %rdx
	movb %dl, -23(%rbp)
	movq %rax, %rdx
	shrq $32, %rdx
	movb %dl, -22(%rbp)
	movq %rax, %rdx
	shrq $24, %rdx
	movb %dl, -21(%rbp)
	movq %rax, %rdx
	shrq $16, %rdx
	movb %dl, -20(%rbp)
	movq %rax, %rdx
	shrq $8, %rdx
	movb %dl, -19(%rbp)
	movb %al, -18(%rbp)
	movb $0, -17(%rbp)
	movzbl -25(%rbp), %eax
	movb %al, 176(%rsi)
	movzbl -24(%rbp), %eax
	movb %al, 177(%rsi)
	movzbl -23(%rbp), %eax
	movb %al, 178(%rsi)
	movzbl -22(%rbp), %eax
	movb %al, 179(%rsi)
	movzbl -21(%rbp), %eax
	movb %al, 180(%rsi)
	movzbl -20(%rbp), %eax
	movb %al, 181(%rsi)
	movzbl -19(%rbp), %eax
	movb %al, 182(%rsi)
	movzbl -18(%rbp), %eax
	movb %al, 183(%rsi)
	movq %rcx, %rax
	shrq $56, %rax
	leaq 64(%rsi), %rdx
	movb %al, -34(%rbp)
	movq %rcx, %rax
	shrq $48, %rax
	movb %al, -33(%rbp)
	movq %rcx, %rax
	shrq $40, %rax
	movb %al, -32(%rbp)
	movq %rcx, %rax
	shrq $32, %rax
	movb %al, -31(%rbp)
	movq %rcx, %rax
	shrq $24, %rax
	movb %al, -30(%rbp)
	movq %rcx, %rax
	shrq $16, %rax
	movb %al, -29(%rbp)
	movq %rcx, %rax
	shrq $8, %rax
	movb %al, -28(%rbp)
	movb %cl, -27(%rbp)
	movb $0, -26(%rbp)
	movzbl -34(%rbp), %eax
	movq %rsi, %rcx
	movb %al, 184(%rsi)
	movzbl -33(%rbp), %eax
	movb %al, 185(%rsi)
	movzbl -32(%rbp), %eax
	movb %al, 186(%rsi)
	movzbl -31(%rbp), %eax
	movb %al, 187(%rsi)
	movzbl -30(%rbp), %eax
	movb %al, 188(%rsi)
	movzbl -29(%rbp), %eax
	movb %al, 189(%rsi)
	movzbl -28(%rbp), %eax
	movb %al, 190(%rsi)
	movzbl -27(%rbp), %eax
	movb %al, 191(%rsi)
	callq standard__crypto__hashing__SHA384__sha384_transform__2__SHA384_CTXE1_ptr1__byteE1_ptr1__ret_voidE1
	movq (%rsi), %rax
	movq %rax, %rcx
	shrq $56, %rcx
	movb %cl, -43(%rbp)
	movq %rax, %rcx
	shrq $48, %rcx
	movb %cl, -42(%rbp)
	movq %rax, %rcx
	shrq $40, %rcx
	movb %cl, -41(%rbp)
	movq %rax, %rcx
	shrq $32, %rcx
	movb %cl, -40(%rbp)
	movq %rax, %rcx
	shrq $24, %rcx
	movb %cl, -39(%rbp)
	movq %rax, %rcx
	shrq $16, %rcx
	movb %cl, -38(%rbp)
	movq %rax, %rcx
	shrq $8, %rcx
	movb %cl, -37(%rbp)
	movb %al, -36(%rbp)
	movb $0, -35(%rbp)
	movzbl -43(%rbp), %eax
	movb %al, (%rdi)
	movzbl -42(%rbp), %eax
	movb %al, 1(%rdi)
	movzbl -41(%rbp), %eax
	movb %al, 2(%rdi)
	movzbl -40(%rbp), %eax
	movb %al, 3(%rdi)
	movzbl -39(%rbp), %eax
	movb %al, 4(%rdi)
	movzbl -38(%rbp), %eax
	movb %al, 5(%rdi)
	movzbl -37(%rbp), %eax
	movb %al, 6(%rdi)
	movzbl -36(%rbp), %eax
	movb %al, 7(%rdi)
	movq 8(%rsi), %rax
	movq %rax, %rcx
	shrq $56, %rcx
	movb %cl, -52(%rbp)
	movq %rax, %rcx
	shrq $48, %rcx
	movb %cl, -51(%rbp)
	movq %rax, %rcx
	shrq $40, %rcx
	movb %cl, -50(%rbp)
	movq %rax, %rcx
	shrq $32, %rcx
	movb %cl, -49(%rbp)
	movq %rax, %rcx
	shrq $24, %rcx
	movb %cl, -48(%rbp)
	movq %rax, %rcx
	shrq $16, %rcx
	movb %cl, -47(%rbp)
	movq %rax, %rcx
	shrq $8, %rcx
	movb %cl, -46(%rbp)
	movb %al, -45(%rbp)
	movb $0, -44(%rbp)
	movzbl -52(%rbp), %eax
	movb %al, 8(%rdi)
	movzbl -51(%rbp), %eax
	movb %al, 9(%rdi)
	movzbl -50(%rbp), %eax
	movb %al, 10(%rdi)
	movzbl -49(%rbp), %eax
	movb %al, 11(%rdi)
	movzbl -48(%rbp), %eax
	movb %al, 12(%rdi)
	movzbl -47(%rbp), %eax
	movb %al, 13(%rdi)
	movzbl -46(%rbp), %eax
	movb %al, 14(%rdi)
	movzbl -45(%rbp), %eax
	movb %al, 15(%rdi)
	movq 16(%rsi), %rax
	movq %rax, %rcx
	shrq $56, %rcx
	movb %cl, -61(%rbp)
	movq %rax, %rcx
	shrq $48, %rcx
	movb %cl, -60(%rbp)
	movq %rax, %rcx
	shrq $40, %rcx
	movb %cl, -59(%rbp)
	movq %rax, %rcx
	shrq $32, %rcx
	movb %cl, -58(%rbp)
	movq %rax, %rcx
	shrq $24, %rcx
	movb %cl, -57(%rbp)
	movq %rax, %rcx
	shrq $16, %rcx
	movb %cl, -56(%rbp)
	movq %rax, %rcx
	shrq $8, %rcx
	movb %cl, -55(%rbp)
	movb %al, -54(%rbp)
	movb $0, -53(%rbp)
	movzbl -61(%rbp), %eax
	movb %al, 16(%rdi)
	movzbl -60(%rbp), %eax
	movb %al, 17(%rdi)
	movzbl -59(%rbp), %eax
	movb %al, 18(%rdi)
	movzbl -58(%rbp), %eax
	movb %al, 19(%rdi)
	movzbl -57(%rbp), %eax
	movb %al, 20(%rdi)
	movzbl -56(%rbp), %eax
	movb %al, 21(%rdi)
	movzbl -55(%rbp), %eax
	movb %al, 22(%rdi)
	movzbl -54(%rbp), %eax
	movb %al, 23(%rdi)
	movq 24(%rsi), %rax
	movq %rax, %rcx
	shrq $56, %rcx
	movb %cl, -70(%rbp)
	movq %rax, %rcx
	shrq $48, %rcx
	movb %cl, -69(%rbp)
	movq %rax, %rcx
	shrq $40, %rcx
	movb %cl, -68(%rbp)
	movq %rax, %rcx
	shrq $32, %rcx
	movb %cl, -67(%rbp)
	movq %rax, %rcx
	shrq $24, %rcx
	movb %cl, -66(%rbp)
	movq %rax, %rcx
	shrq $16, %rcx
	movb %cl, -65(%rbp)
	movq %rax, %rcx
	shrq $8, %rcx
	movb %cl, -64(%rbp)
	movb %al, -63(%rbp)
	movb $0, -62(%rbp)
	movzbl -70(%rbp), %eax
	movb %al, 24(%rdi)
	movzbl -69(%rbp), %eax
	movb %al, 25(%rdi)
	movzbl -68(%rbp), %eax
	movb %al, 26(%rdi)
	movzbl -67(%rbp), %eax
	movb %al, 27(%rdi)
	movzbl -66(%rbp), %eax
	movb %al, 28(%rdi)
	movzbl -65(%rbp), %eax
	movb %al, 29(%rdi)
	movzbl -64(%rbp), %eax
	movb %al, 30(%rdi)
	movzbl -63(%rbp), %eax
	movb %al, 31(%rdi)
	movq 32(%rsi), %rax
	movq %rax, %rcx
	shrq $56, %rcx
	movb %cl, -79(%rbp)
	movq %rax, %rcx
	shrq $48, %rcx
	movb %cl, -78(%rbp)
	movq %rax, %rcx
	shrq $40, %rcx
	movb %cl, -77(%rbp)
	movq %rax, %rcx
	shrq $32, %rcx
	movb %cl, -76(%rbp)
	movq %rax, %rcx
	shrq $24, %rcx
	movb %cl, -75(%rbp)
	movq %rax, %rcx
	shrq $16, %rcx
	movb %cl, -74(%rbp)
	movq %rax, %rcx
	shrq $8, %rcx
	movb %cl, -73(%rbp)
	movb %al, -72(%rbp)
	movb $0, -71(%rbp)
	movzbl -79(%rbp), %eax
	movb %al, 32(%rdi)
	movzbl -78(%rbp), %eax
	movb %al, 33(%rdi)
	movzbl -77(%rbp), %eax
	movb %al, 34(%rdi)
	movzbl -76(%rbp), %eax
	movb %al, 35(%rdi)
	movzbl -75(%rbp), %eax
	movb %al, 36(%rdi)
	movzbl -74(%rbp), %eax
	movb %al, 37(%rdi)
	movzbl -73(%rbp), %eax
	movb %al, 38(%rdi)
	movzbl -72(%rbp), %eax
	movb %al, 39(%rdi)
	movq 40(%rsi), %rax
	movq %rax, %rcx
	shrq $56, %rcx
	movb %cl, -88(%rbp)
	movq %rax, %rcx
	shrq $48, %rcx
	movb %cl, -87(%rbp)
	movq %rax, %rcx
	shrq $40, %rcx
	movb %cl, -86(%rbp)
	movq %rax, %rcx
	shrq $32, %rcx
	movb %cl, -85(%rbp)
	movq %rax, %rcx
	shrq $24, %rcx
	movb %cl, -84(%rbp)
	movq %rax, %rcx
	shrq $16, %rcx
	movb %cl, -83(%rbp)
	movq %rax, %rcx
	shrq $8, %rcx
	movb %cl, -82(%rbp)
	movb %al, -81(%rbp)
	movb $0, -80(%rbp)
	movzbl -88(%rbp), %eax
	movb %al, 40(%rdi)
	movzbl -87(%rbp), %eax
	movb %al, 41(%rdi)
	movzbl -86(%rbp), %eax
	movb %al, 42(%rdi)
	movzbl -85(%rbp), %eax
	movb %al, 43(%rdi)
	movzbl -84(%rbp), %eax
	movb %al, 44(%rdi)
	movzbl -83(%rbp), %eax
	movb %al, 45(%rdi)
	movzbl -82(%rbp), %eax
	movb %al, 46(%rdi)
	movzbl -81(%rbp), %eax
	movb %al, 47(%rdi)
	movq 48(%rsi), %rax
	movq %rax, %rcx
	shrq $56, %rcx
	movb %cl, -97(%rbp)
	movq %rax, %rcx
	shrq $48, %rcx
	movb %cl, -96(%rbp)
	movq %rax, %rcx
	shrq $40, %rcx
	movb %cl, -95(%rbp)
	movq %rax, %rcx
	shrq $32, %rcx
	movb %cl, -94(%rbp)
	movq %rax, %rcx
	shrq $24, %rcx
	movb %cl, -93(%rbp)
	movq %rax, %rcx
	shrq $16, %rcx
	movb %cl, -92(%rbp)
	movq %rax, %rcx
	shrq $8, %rcx
	movb %cl, -91(%rbp)
	movb %al, -90(%rbp)
	movb $0, -89(%rbp)
	movzbl -97(%rbp), %eax
	movb %al, 48(%rdi)
	movzbl -96(%rbp), %eax
	movb %al, 49(%rdi)
	movzbl -95(%rbp), %eax
	movb %al, 50(%rdi)
	movzbl -94(%rbp), %eax
	movb %al, 51(%rdi)
	movzbl -93(%rbp), %eax
	movb %al, 52(%rdi)
	movzbl -92(%rbp), %eax
	movb %al, 53(%rdi)
	movzbl -91(%rbp), %eax
	movb %al, 54(%rdi)
	movzbl -90(%rbp), %eax
	movb %al, 55(%rdi)
	movq 56(%rsi), %rax
	movq %rax, %rcx
	shrq $56, %rcx
	movb %cl, -106(%rbp)
	movq %rax, %rcx
	shrq $48, %rcx
	movb %cl, -105(%rbp)
	movq %rax, %rcx
	shrq $40, %rcx
	movb %cl, -104(%rbp)
	movq %rax, %rcx
	shrq $32, %rcx
	movb %cl, -103(%rbp)
	movq %rax, %rcx
	shrq $24, %rcx
	movb %cl, -102(%rbp)
	movq %rax, %rcx
	shrq $16, %rcx
	movb %cl, -101(%rbp)
	movq %rax, %rcx
	shrq $8, %rcx
	movb %cl, -100(%rbp)
	movb %al, -99(%rbp)
	movb $0, -98(%rbp)
	movzbl -106(%rbp), %eax
	movb %al, 56(%rdi)
	movzbl -105(%rbp), %eax
	movb %al, 57(%rdi)
	movzbl -104(%rbp), %eax
	movb %al, 58(%rdi)
	movzbl -103(%rbp), %eax
	movb %al, 59(%rdi)
	movzbl -102(%rbp), %eax
	movb %al, 60(%rdi)
	movzbl -101(%rbp), %eax
	movb %al, 61(%rdi)
	movzbl -100(%rbp), %eax
	movb %al, 62(%rdi)
	movzbl -99(%rbp), %eax
	movb %al, 63(%rdi)
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB13044:
	movl $112, %ecx
	subl %eax, %ecx
	xorl %edx, %edx
	cmpl $112, %eax
	cmovb %ecx, %edx
	movl %edx, %ecx
	shrl $2, %ecx
.LB32022:
	testl %ecx, %ecx
	je .LB32024
.LB32023:
	movslq %eax, %rdx
	movb $0, 64(%rsi,%rdx,1)
	leal 1(%rax), %edx
	movslq %edx, %rdx
	movb $0, 64(%rsi,%rdx,1)
	leal 2(%rax), %edx
	movslq %edx, %rdx
	movb $0, 64(%rsi,%rdx,1)
	leal 3(%rax), %edx
	movslq %edx, %rdx
	movb $0, 64(%rsi,%rdx,1)
	addl $4, %eax
	decl %ecx
	jne .LB32023
.LB32024:
.LB13047:
	cmpl $112, %eax
	jae .LB13046
.LB13048:
	movslq %eax, %rcx
	movb $0, 64(%rsi,%rcx,1)
	incl %eax
	cmpl $112, %eax
	jb .LB13048
	jmp .LB13046
	.text
	.globl standard__crypto__hashing__SHA1__sha1_rotl__2__dataE1_ubits32__dataE1_ubits32__ret_dataE1_ubits32
	.def standard__crypto__hashing__SHA1__sha1_rotl__2__dataE1_ubits32__dataE1_ubits32__ret_dataE1_ubits32;
	.scl 2;
	.type 32;
	.endef
standard__crypto__hashing__SHA1__sha1_rotl__2__dataE1_ubits32__dataE1_ubits32__ret_dataE1_ubits32:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
.LB13561:
	shlx %edx, %ecx, %eax
	movl $32, %esi
	subl %edx, %esi
	shrx %esi, %ecx, %ecx
	orl %ecx, %eax
	movq 0(%rsp), %rsi
	addq $16, %rsp
	ret
	.text
	.globl standard__crypto__hashing__SHA1__sha1_block__2__dataE1_ptr1_ubits32__byteE1_ptr1__ret_voidE1
	.def standard__crypto__hashing__SHA1__sha1_block__2__dataE1_ptr1_ubits32__byteE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__hashing__SHA1__sha1_block__2__dataE1_ptr1_ubits32__byteE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $432, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
	movq %r14, -48(%rbp)
	movq %r15, -56(%rbp)
.LB13572:
	leaq -376(%rbp), %rax
	movq %rcx, -384(%rbp)
	movl $320, %ecx
	movq %rax, %rdi
	xorl %eax, %eax
	rep stosb
	xorl %eax, %eax
.LB13586:
	cmpl $16, %eax
	jge .LB13589
.LB13587:
	movl %eax, %ecx
	shll $2, %ecx
	movslq %ecx, %rsi
	movzbl (%rdx,%rsi,1), %esi
	shll $24, %esi
	leal 1(%rcx), %edi
	movslq %edi, %rdi
	movzbl (%rdx,%rdi,1), %edi
	shll $16, %edi
	orl %edi, %esi
	leal 2(%rcx), %edi
	movslq %edi, %rdi
	movzbl (%rdx,%rdi,1), %edi
	shll $8, %edi
	orl %edi, %esi
	addl $3, %ecx
	movslq %ecx, %rcx
	movzbl (%rdx,%rcx,1), %ecx
	orl %ecx, %esi
	movslq %eax, %rcx
	movl %esi, -376(%rbp,%rcx,4)
	incl %eax
	cmpl $16, %eax
	jl .LB13587
.LB13589:
	movl $16, %esi
.LB13629:
	cmpl $80, %esi
	jge .LB13632
.LB13630:
	leal -3(%rsi), %eax
	leal -8(%rsi), %ecx
	movl $1, %edx
	movslq %eax, %rax
	movslq %ecx, %rcx
	movl -376(%rbp,%rcx,4), %ecx
	xorl -376(%rbp,%rax,4), %ecx
	leal -14(%rsi), %eax
	movslq %eax, %rax
	xorl -376(%rbp,%rax,4), %ecx
	leal -16(%rsi), %eax
	movslq %eax, %rax
	xorl -376(%rbp,%rax,4), %ecx
	callq standard__crypto__hashing__SHA1__sha1_rotl__2__dataE1_ubits32__dataE1_ubits32__ret_dataE1_ubits32
	movslq %esi, %rcx
	movl %eax, -376(%rbp,%rcx,4)
	incl %esi
	cmpl $80, %esi
	jl .LB13630
.LB13632:
	movq -384(%rbp), %rax
	movl (%rax), %esi
	movl 4(%rax), %edi
	movl 8(%rax), %ebx
	movl 12(%rax), %r12d
	movl 16(%rax), %eax
	movq %rax, -392(%rbp)
	xorl %eax, %eax
	xorl %ecx, %ecx
	xorl %r13d, %r13d
.LB13674:
	cmpl $80, %r13d
	jge .LB13677
.LB13675:
	cmpl $20, %r13d
	jl .LB13682
.LB13683:
.LB13684:
	cmpl $20, %r13d
	jl .LB13701
.LB13695:
	cmpl $40, %r13d
	jl .LB13700
.LB13701:
.LB13702:
	cmpl $40, %r13d
	jl .LB13716
.LB13710:
	cmpl $60, %r13d
	jl .LB13715
.LB13716:
.LB13717:
	xorl %edx, %edx
	cmpl $60, %r13d
	setge %dl
	movl %edi, %r8d
	xorl %ebx, %r8d
	xorl %r12d, %r8d
	testb %dl, %dl
	movl %eax, %r14d
	cmovne %r8d, %r14d
	movabsq $3395469782, %rax
	testb %dl, %dl
	movl %ecx, %r15d
	cmovne %eax, %r15d
	movq %rsi, %rcx
	movl $5, %edx
	callq standard__crypto__hashing__SHA1__sha1_rotl__2__dataE1_ubits32__dataE1_ubits32__ret_dataE1_ubits32
	movq -392(%rbp), %rcx
	movl $30, %edx
	addl %r14d, %eax
	addl %ecx, %eax
	movslq %r13d, %rcx
	addl %r15d, %eax
	addl -376(%rbp,%rcx,4), %eax
	movq %rdi, %rcx
	movq %rax, -400(%rbp)
	callq standard__crypto__hashing__SHA1__sha1_rotl__2__dataE1_ubits32__dataE1_ubits32__ret_dataE1_ubits32
	incl %r13d
	movq %rsi, %rdi
	movq %r12, -392(%rbp)
	movq %r15, %rcx
	movq -400(%rbp), %rsi
	movq %rbx, %r12
	movq %rax, %rbx
	movq %r14, %rax
	cmpl $80, %r13d
	jl .LB13675
.LB13677:
	movq -384(%rbp), %rax
	addl (%rax), %esi
	movl %esi, (%rax)
	addl 4(%rax), %edi
	movl %edi, 4(%rax)
	addl 8(%rax), %ebx
	movl %ebx, 8(%rax)
	addl 12(%rax), %r12d
	movq -384(%rbp), %rax
	movl %r12d, 12(%rax)
	movq -392(%rbp), %rcx
	addl 16(%rax), %ecx
	movl %ecx, 16(%rax)
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB13682:
	movl %edi, %eax
	andl %ebx, %eax
	andn %r12d, %edi, %ecx
	orl %ecx, %eax
	movl $1518500249, %ecx
	cmpl $20, %r13d
	jge .LB13695
	jmp .LB13701
.LB13700:
	movl %edi, %eax
	xorl %ebx, %eax
	xorl %r12d, %eax
	movl $1859775393, %ecx
	cmpl $40, %r13d
	jge .LB13710
	jmp .LB13716
.LB13715:
	movl %edi, %eax
	andl %ebx, %eax
	movl %edi, %ecx
	andl %r12d, %ecx
	orl %ecx, %eax
	movl %ebx, %ecx
	andl %r12d, %ecx
	orl %ecx, %eax
	movl $2400959708, %ecx
	jmp .LB13717
	.text
	.globl standard__crypto__hashing__SHA1__sha1__3__byteE1_ptr1__intE1__byteE1_ptr1__ret_voidE1
	.def standard__crypto__hashing__SHA1__sha1__3__byteE1_ptr1__intE1__byteE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__hashing__SHA1__sha1__3__byteE1_ptr1__intE1__byteE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $224, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
.LB13794:
	movq %rcx, %rsi
	movl %edx, %ebx
	movq %r8, %r12
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -60(%rbp)
	movl .LZERO+16(%rip), %r10d
	movl %r10d, -44(%rbp)
	leaq -188(%rbp), %rax
	movq %rax, %rdi
	xorl %eax, %eax
	movl $128, %ecx
	rep stosb
	movl %ebx, %eax
	sarl $31, %eax
	movl $1732584193, -60(%rbp)
	movl $4023233417, -56(%rbp)
	movl $2562383102, -52(%rbp)
	shrl $26, %eax
	movl $271733878, -48(%rbp)
	movl $3285377520, -44(%rbp)
	addl %ebx, %eax
	movl %eax, %edi
	sarl $6, %edi
	xorl %r13d, %r13d
.LB13813:
	cmpl %edi, %r13d
	jge .LB13816
.LB13814:
	leaq -60(%rbp), %rcx
	movl %r13d, %eax
	shll $6, %eax
	movslq %eax, %rax
	leaq (%rsi,%rax,1), %rdx
	callq standard__crypto__hashing__SHA1__sha1_block__2__dataE1_ptr1_ubits32__byteE1_ptr1__ret_voidE1
	incl %r13d
	cmpl %edi, %r13d
	jl .LB13814
.LB13816:
	movl %edi, %eax
	shll $6, %eax
	negl %eax
	addl %ebx, %eax
	movl $32, %ecx
	xorl %edx, %edx
.LB32031:
	testq %rcx, %rcx
	je .LB32033
.LB32032:
	movb $0, -188(%rbp,%rdx,1)
	movb $0, -187(%rbp,%rdx,1)
	movb $0, -186(%rbp,%rdx,1)
	movb $0, -185(%rbp,%rdx,1)
	addq $4, %rdx
	decq %rcx
	jne .LB32032
.LB32033:
.LB13831:
	cmpq $128, %rdx
	jge .LB13834
.LB13832:
	movb $0, -188(%rbp,%rdx,1)
	incq %rdx
	cmpq $128, %rdx
	jl .LB13832
.LB13834:
	shll $6, %edi
	xorl %ecx, %ecx
	testl %eax, %eax
	cmovg %eax, %ecx
	shrl $2, %ecx
	xorl %edx, %edx
.LB32034:
	testl %ecx, %ecx
	je .LB32036
.LB32035:
	leal (%rdi,%rdx), %r8d
	movslq %r8d, %r8
	movzbl (%rsi,%r8,1), %r8d
	movslq %edx, %r9
	movb %r8b, -188(%rbp,%r9,1)
	leal 1(%rdx), %r8d
	leal (%rdi,%r8), %r9d
	movslq %r9d, %r9
	movzbl (%rsi,%r9,1), %r9d
	movslq %r8d, %r8
	movb %r9b, -188(%rbp,%r8,1)
	leal 2(%rdx), %r8d
	leal (%rdi,%r8), %r9d
	movslq %r9d, %r9
	movzbl (%rsi,%r9,1), %r9d
	movslq %r8d, %r8
	movb %r9b, -188(%rbp,%r8,1)
	leal 3(%rdx), %r8d
	leal (%rdi,%r8), %r9d
	movslq %r9d, %r9
	movzbl (%rsi,%r9,1), %r9d
	movslq %r8d, %r8
	movb %r9b, -188(%rbp,%r8,1)
	addl $4, %edx
	decl %ecx
	jne .LB32035
.LB32036:
.LB13842:
	cmpl %eax, %edx
	jge .LB13845
.LB13843:
	leal (%rdi,%rdx), %ecx
	movslq %ecx, %rcx
	movzbl (%rsi,%rcx,1), %ecx
	movslq %edx, %r8
	movb %cl, -188(%rbp,%r8,1)
	incl %edx
	cmpl %eax, %edx
	jl .LB13843
.LB13845:
	movslq %eax, %rcx
	movl $64, %edx
	cmpl $56, %eax
	movb $128, -188(%rbp,%rcx,1)
	movl $128, %ecx
	movl %edx, %esi
	cmovge %ecx, %esi
	shlq $3, %rbx
	movq %rbx, %rax
	andq $255, %rax
	leal -1(%rsi), %ecx
	movslq %ecx, %rdx
	movb %al, -188(%rbp,%rdx,1)
	movq %rbx, %rax
	shrq $8, %rax
	andq $255, %rax
	leal -1(%rcx), %edx
	movslq %edx, %rdx
	movb %al, -188(%rbp,%rdx,1)
	movq %rbx, %rax
	shrq $16, %rax
	andq $255, %rax
	leal -2(%rcx), %edx
	movslq %edx, %rdx
	movb %al, -188(%rbp,%rdx,1)
	movq %rbx, %rax
	shrq $24, %rax
	andq $255, %rax
	leal -3(%rcx), %edx
	movslq %edx, %rdx
	movb %al, -188(%rbp,%rdx,1)
	movq %rbx, %rax
	shrq $32, %rax
	andq $255, %rax
	leal -4(%rcx), %edx
	movslq %edx, %rdx
	movb %al, -188(%rbp,%rdx,1)
	movq %rbx, %rax
	shrq $40, %rax
	andq $255, %rax
	leal -5(%rcx), %edx
	movslq %edx, %rdx
	movb %al, -188(%rbp,%rdx,1)
	movq %rbx, %rax
	shrq $48, %rax
	andq $255, %rax
	leal -6(%rcx), %edx
	movslq %edx, %rdx
	shrq $56, %rbx
	movb %al, -188(%rbp,%rdx,1)
	leaq -188(%rbp), %rdx
	movq %rbx, %rax
	andq $255, %rax
	subl $7, %ecx
	movslq %ecx, %rcx
	movb %al, -188(%rbp,%rcx,1)
	leaq -60(%rbp), %rcx
	callq standard__crypto__hashing__SHA1__sha1_block__2__dataE1_ptr1_ubits32__byteE1_ptr1__ret_voidE1
	cmpl $128, %esi
	je .LB13897
.LB13899:
	movl -60(%rbp), %eax
	shrl $24, %eax
	andl $255, %eax
	movb %al, (%r12)
	movl -60(%rbp), %eax
	shrl $16, %eax
	andl $255, %eax
	movb %al, 1(%r12)
	movl -60(%rbp), %eax
	shrl $8, %eax
	andl $255, %eax
	movb %al, 2(%r12)
	movl -60(%rbp), %eax
	andl $255, %eax
	movb %al, 3(%r12)
	movl -56(%rbp), %eax
	shrl $24, %eax
	andl $255, %eax
	movb %al, 4(%r12)
	movl -56(%rbp), %eax
	shrl $16, %eax
	andl $255, %eax
	movb %al, 5(%r12)
	movl -56(%rbp), %eax
	shrl $8, %eax
	andl $255, %eax
	movb %al, 6(%r12)
	movl -56(%rbp), %eax
	andl $255, %eax
	movb %al, 7(%r12)
	movl -52(%rbp), %eax
	shrl $24, %eax
	andl $255, %eax
	movb %al, 8(%r12)
	movl -52(%rbp), %eax
	shrl $16, %eax
	andl $255, %eax
	movb %al, 9(%r12)
	movl -52(%rbp), %eax
	shrl $8, %eax
	andl $255, %eax
	movb %al, 10(%r12)
	movl -52(%rbp), %eax
	andl $255, %eax
	movb %al, 11(%r12)
	movl -48(%rbp), %eax
	shrl $24, %eax
	andl $255, %eax
	movb %al, 12(%r12)
	movl -48(%rbp), %eax
	shrl $16, %eax
	andl $255, %eax
	movb %al, 13(%r12)
	movl -48(%rbp), %eax
	shrl $8, %eax
	andl $255, %eax
	movb %al, 14(%r12)
	movl -48(%rbp), %eax
	andl $255, %eax
	movb %al, 15(%r12)
	movl -44(%rbp), %eax
	shrl $24, %eax
	andl $255, %eax
	movb %al, 16(%r12)
	movl -44(%rbp), %eax
	shrl $16, %eax
	andl $255, %eax
	movb %al, 17(%r12)
	movl -44(%rbp), %eax
	shrl $8, %eax
	andl $255, %eax
	movb %al, 18(%r12)
	movl -44(%rbp), %eax
	andl $255, %eax
	movb %al, 19(%r12)
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB13897:
	leaq -60(%rbp), %rcx
	leaq -124(%rbp), %rdx
	callq standard__crypto__hashing__SHA1__sha1_block__2__dataE1_ptr1_ubits32__byteE1_ptr1__ret_voidE1
	jmp .LB13899
	.text
	.globl standard__crypto__hashing__MD5__H__3__dataE1_ubits32__dataE1_ubits32__dataE1_ubits32__ret_dataE1_ubits32
	.def standard__crypto__hashing__MD5__H__3__dataE1_ubits32__dataE1_ubits32__dataE1_ubits32__ret_dataE1_ubits32;
	.scl 2;
	.type 32;
	.endef
standard__crypto__hashing__MD5__H__3__dataE1_ubits32__dataE1_ubits32__dataE1_ubits32__ret_dataE1_ubits32:
.LB13952:
	xorl %edx, %ecx
	movl %ecx, %eax
	xorl %r8d, %eax
	ret
	.text
	.globl standard__crypto__encryption__AES__gmul2__1__byteE1__ret_byteE1
	.def standard__crypto__encryption__AES__gmul2__1__byteE1__ret_byteE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__encryption__AES__gmul2__1__byteE1__ret_byteE1:
.LB13961:
	movzbl %cl, %eax
	andl $128, %eax
	jne .LB13967
.LB13968:
	shll $1, %ecx
	movzbl %cl, %eax
	ret
.LB13967:
	shll $1, %ecx
	movzbl %cl, %eax
	xorl $27, %eax
	movzbl %al, %eax
	ret
	.text
	.globl standard__crypto__encryption__AES__gmul3__1__byteE1__ret_byteE1
	.def standard__crypto__encryption__AES__gmul3__1__byteE1__ret_byteE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__encryption__AES__gmul3__1__byteE1__ret_byteE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
.LB13979:
	movl %ecx, %esi
	movzbl %sil, %ecx
	callq standard__crypto__encryption__AES__gmul2__1__byteE1__ret_byteE1
	movzbl %al, %eax
	xorl %esi, %eax
	movzbl %al, %eax
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl standard__crypto__encryption__AES__sub_bytes__1__byteE1_ptr1__ret_voidE1
	.def standard__crypto__encryption__AES__sub_bytes__1__byteE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__encryption__AES__sub_bytes__1__byteE1_ptr1__ret_voidE1:
.LB13985:
	leaq standard__crypto__encryption__AES__SBOX(%rip), %rdx
	movzbl (%rcx), %eax
	movslq %eax, %rax
	movzbl (%rdx,%rax,1), %eax
	leaq standard__crypto__encryption__AES__SBOX(%rip), %rdx
	movb %al, (%rcx)
	movzbl 1(%rcx), %eax
	movslq %eax, %rax
	movzbl (%rdx,%rax,1), %eax
	leaq standard__crypto__encryption__AES__SBOX(%rip), %rdx
	movb %al, 1(%rcx)
	movzbl 2(%rcx), %eax
	movslq %eax, %rax
	movzbl (%rdx,%rax,1), %eax
	leaq standard__crypto__encryption__AES__SBOX(%rip), %rdx
	movb %al, 2(%rcx)
	movzbl 3(%rcx), %eax
	movslq %eax, %rax
	movzbl (%rdx,%rax,1), %eax
	leaq standard__crypto__encryption__AES__SBOX(%rip), %rdx
	movb %al, 3(%rcx)
	movzbl 4(%rcx), %eax
	movslq %eax, %rax
	movzbl (%rdx,%rax,1), %eax
	leaq standard__crypto__encryption__AES__SBOX(%rip), %rdx
	movb %al, 4(%rcx)
	movzbl 5(%rcx), %eax
	movslq %eax, %rax
	movzbl (%rdx,%rax,1), %eax
	leaq standard__crypto__encryption__AES__SBOX(%rip), %rdx
	movb %al, 5(%rcx)
	movzbl 6(%rcx), %eax
	movslq %eax, %rax
	movzbl (%rdx,%rax,1), %eax
	leaq standard__crypto__encryption__AES__SBOX(%rip), %rdx
	movb %al, 6(%rcx)
	movzbl 7(%rcx), %eax
	movslq %eax, %rax
	movzbl (%rdx,%rax,1), %eax
	movb %al, 7(%rcx)
	movzbl 8(%rcx), %eax
	leaq standard__crypto__encryption__AES__SBOX(%rip), %rdx
	movzbl %al, %eax
	movslq %eax, %rax
	movzbl (%rdx,%rax,1), %eax
	leaq standard__crypto__encryption__AES__SBOX(%rip), %rdx
	movb %al, 8(%rcx)
	movzbl 9(%rcx), %eax
	movslq %eax, %rax
	movzbl (%rdx,%rax,1), %eax
	leaq standard__crypto__encryption__AES__SBOX(%rip), %rdx
	movb %al, 9(%rcx)
	movzbl 10(%rcx), %eax
	movslq %eax, %rax
	movzbl (%rdx,%rax,1), %eax
	leaq standard__crypto__encryption__AES__SBOX(%rip), %rdx
	movb %al, 10(%rcx)
	movzbl 11(%rcx), %eax
	movslq %eax, %rax
	movzbl (%rdx,%rax,1), %eax
	leaq standard__crypto__encryption__AES__SBOX(%rip), %rdx
	movb %al, 11(%rcx)
	movzbl 12(%rcx), %eax
	movslq %eax, %rax
	movzbl (%rdx,%rax,1), %eax
	leaq standard__crypto__encryption__AES__SBOX(%rip), %rdx
	movb %al, 12(%rcx)
	movzbl 13(%rcx), %eax
	movslq %eax, %rax
	movzbl (%rdx,%rax,1), %eax
	leaq standard__crypto__encryption__AES__SBOX(%rip), %rdx
	movb %al, 13(%rcx)
	movzbl 14(%rcx), %eax
	movslq %eax, %rax
	movzbl (%rdx,%rax,1), %eax
	leaq standard__crypto__encryption__AES__SBOX(%rip), %rdx
	movb %al, 14(%rcx)
	movzbl 15(%rcx), %eax
	movslq %eax, %rax
	movzbl (%rdx,%rax,1), %eax
	movb %al, 15(%rcx)
	ret
	.text
	.globl standard__crypto__encryption__AES__shift_rows__1__byteE1_ptr1__ret_voidE1
	.def standard__crypto__encryption__AES__shift_rows__1__byteE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__encryption__AES__shift_rows__1__byteE1_ptr1__ret_voidE1:
.LB14010:
	movzbl 1(%rcx), %eax
	movzbl 5(%rcx), %edx
	movb %dl, 1(%rcx)
	movzbl 9(%rcx), %edx
	movb %dl, 5(%rcx)
	movzbl 13(%rcx), %edx
	movb %dl, 9(%rcx)
	movb %al, 13(%rcx)
	movzbl 2(%rcx), %eax
	movzbl 10(%rcx), %edx
	movb %dl, 2(%rcx)
	movb %al, 10(%rcx)
	movzbl 6(%rcx), %eax
	movzbl 14(%rcx), %edx
	movb %dl, 6(%rcx)
	movb %al, 14(%rcx)
	movzbl 15(%rcx), %eax
	movzbl 11(%rcx), %edx
	movb %dl, 15(%rcx)
	movzbl 7(%rcx), %edx
	movb %dl, 11(%rcx)
	movzbl 3(%rcx), %edx
	movb %dl, 7(%rcx)
	movb %al, 3(%rcx)
	ret
	.text
	.globl standard__crypto__encryption__AES__mix_columns__1__byteE1_ptr1__ret_voidE1
	.def standard__crypto__encryption__AES__mix_columns__1__byteE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__encryption__AES__mix_columns__1__byteE1_ptr1__ret_voidE1:
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
.LB14077:
	movq %rcx, %rsi
	movl .LZERO(%rip), %r10d
	movl %r10d, -60(%rbp)
	xorl %edi, %edi
.LB14081:
	cmpl $4, %edi
	jae .LB14084
.LB14082:
	movl %edi, %eax
	shll $2, %eax
	movslq %eax, %rcx
	leal 1(%rax), %edx
	leal 2(%rax), %r8d
	addl $3, %eax
	movslq %edx, %rdx
	movslq %r8d, %r8
	movslq %eax, %rax
	leaq (%rsi,%rcx,1), %rbx
	leaq (%rsi,%rdx,1), %r12
	leaq (%rsi,%r8,1), %r13
	leaq (%rsi,%rax,1), %r14
	movzbl (%rbx), %ecx
	movzbl (%r12), %edx
	movzbl (%r13), %r8d
	movzbl (%r14), %eax
	movb %cl, -64(%rbp)
	movb %dl, -63(%rbp)
	movb %r8b, -62(%rbp)
	movb %al, -61(%rbp)
	movzbl -64(%rbp), %eax
	movb %al, -60(%rbp)
	movzbl -63(%rbp), %eax
	movb %al, -59(%rbp)
	movzbl -62(%rbp), %eax
	movb %al, -58(%rbp)
	movzbl -61(%rbp), %eax
	movb %al, -57(%rbp)
	movzbl -60(%rbp), %eax
	movzbl %al, %ecx
	callq standard__crypto__encryption__AES__gmul2__1__byteE1__ret_byteE1
	movzbl %al, %r15d
	movzbl -59(%rbp), %eax
	movzbl %al, %ecx
	callq standard__crypto__encryption__AES__gmul3__1__byteE1__ret_byteE1
	movzbl %al, %eax
	xorl %eax, %r15d
	movzbl -58(%rbp), %eax
	xorl %eax, %r15d
	movzbl -57(%rbp), %eax
	xorl %eax, %r15d
	movb %r15b, (%rbx)
	movzbl -60(%rbp), %ebx
	movzbl -59(%rbp), %eax
	movzbl %al, %ecx
	callq standard__crypto__encryption__AES__gmul2__1__byteE1__ret_byteE1
	movzbl %al, %eax
	xorl %eax, %ebx
	movzbl -58(%rbp), %eax
	movzbl %al, %ecx
	callq standard__crypto__encryption__AES__gmul3__1__byteE1__ret_byteE1
	movzbl %al, %eax
	xorl %eax, %ebx
	movzbl -57(%rbp), %eax
	xorl %eax, %ebx
	movb %bl, (%r12)
	movzbl -60(%rbp), %eax
	movzbl -59(%rbp), %ecx
	movl %eax, %ebx
	xorl %ecx, %ebx
	movzbl -58(%rbp), %eax
	movzbl %al, %ecx
	callq standard__crypto__encryption__AES__gmul2__1__byteE1__ret_byteE1
	movzbl %al, %eax
	xorl %eax, %ebx
	movzbl -57(%rbp), %eax
	movzbl %al, %ecx
	callq standard__crypto__encryption__AES__gmul3__1__byteE1__ret_byteE1
	movzbl %al, %eax
	xorl %eax, %ebx
	movb %bl, (%r13)
	movzbl -60(%rbp), %eax
	movzbl %al, %ecx
	callq standard__crypto__encryption__AES__gmul3__1__byteE1__ret_byteE1
	movzbl %al, %eax
	movzbl -59(%rbp), %ecx
	xorl %ecx, %eax
	movzbl -58(%rbp), %ecx
	movl %eax, %ebx
	xorl %ecx, %ebx
	movzbl -57(%rbp), %eax
	movzbl %al, %ecx
	callq standard__crypto__encryption__AES__gmul2__1__byteE1__ret_byteE1
	movzbl %al, %eax
	xorl %eax, %ebx
	movb %bl, (%r14)
	incl %edi
	cmpl $4, %edi
	jb .LB14082
.LB14084:
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
	.globl standard__crypto__encryption__AES__add_round_key__2__byteE1_ptr1__dataE1_ptr1_ubits32__ret_voidE1
	.def standard__crypto__encryption__AES__add_round_key__2__byteE1_ptr1__dataE1_ptr1_ubits32__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__encryption__AES__add_round_key__2__byteE1_ptr1__dataE1_ptr1_ubits32__ret_voidE1:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
.LB14198:
	movzbl (%rcx), %eax
	movl (%rdx), %esi
	shrl $24, %esi
	andl $255, %esi
	xorl %esi, %eax
	movb %al, (%rcx)
	movzbl 1(%rcx), %eax
	movl (%rdx), %esi
	shrl $16, %esi
	andl $255, %esi
	xorl %esi, %eax
	movb %al, 1(%rcx)
	movzbl 2(%rcx), %eax
	movl (%rdx), %esi
	shrl $8, %esi
	andl $255, %esi
	xorl %esi, %eax
	movb %al, 2(%rcx)
	movzbl 3(%rcx), %eax
	movl (%rdx), %esi
	andl $255, %esi
	xorl %esi, %eax
	movb %al, 3(%rcx)
	movzbl 4(%rcx), %eax
	movl 4(%rdx), %esi
	shrl $24, %esi
	andl $255, %esi
	xorl %esi, %eax
	movb %al, 4(%rcx)
	movzbl 5(%rcx), %eax
	movl 4(%rdx), %esi
	shrl $16, %esi
	andl $255, %esi
	xorl %esi, %eax
	movb %al, 5(%rcx)
	movzbl 6(%rcx), %eax
	movl 4(%rdx), %esi
	shrl $8, %esi
	andl $255, %esi
	xorl %esi, %eax
	movb %al, 6(%rcx)
	movzbl 7(%rcx), %eax
	movl 4(%rdx), %esi
	andl $255, %esi
	xorl %esi, %eax
	movb %al, 7(%rcx)
	movzbl 8(%rcx), %eax
	movl 8(%rdx), %esi
	shrl $24, %esi
	andl $255, %esi
	xorl %esi, %eax
	movb %al, 8(%rcx)
	movzbl 9(%rcx), %eax
	movl 8(%rdx), %esi
	shrl $16, %esi
	andl $255, %esi
	xorl %esi, %eax
	movb %al, 9(%rcx)
	movzbl 10(%rcx), %eax
	movl 8(%rdx), %esi
	shrl $8, %esi
	andl $255, %esi
	xorl %esi, %eax
	movb %al, 10(%rcx)
	movzbl 11(%rcx), %eax
	movl 8(%rdx), %esi
	andl $255, %esi
	xorl %esi, %eax
	movb %al, 11(%rcx)
	movzbl 12(%rcx), %eax
	movl 12(%rdx), %esi
	shrl $24, %esi
	andl $255, %esi
	xorl %esi, %eax
	movb %al, 12(%rcx)
	movzbl 13(%rcx), %eax
	movl 12(%rdx), %esi
	shrl $16, %esi
	andl $255, %esi
	xorl %esi, %eax
	movb %al, 13(%rcx)
	movzbl 14(%rcx), %eax
	movl 12(%rdx), %esi
	shrl $8, %esi
	andl $255, %esi
	xorl %esi, %eax
	movb %al, 14(%rcx)
	movzbl 15(%rcx), %eax
	movl 12(%rdx), %edx
	andl $255, %edx
	xorl %edx, %eax
	movb %al, 15(%rcx)
	movq 0(%rsp), %rsi
	addq $16, %rsp
	ret
	.text
	.globl standard__crypto__encryption__AES__sub_word__1__dataE1_ubits32__ret_dataE1_ubits32
	.def standard__crypto__encryption__AES__sub_word__1__dataE1_ubits32__ret_dataE1_ubits32;
	.scl 2;
	.type 32;
	.endef
standard__crypto__encryption__AES__sub_word__1__dataE1_ubits32__ret_dataE1_ubits32:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
.LB14280:
	leaq standard__crypto__encryption__AES__SBOX(%rip), %rdx
	leaq standard__crypto__encryption__AES__SBOX(%rip), %rsi
	movl %ecx, %eax
	shrl $24, %eax
	andl $255, %eax
	movslq %eax, %rax
	movzbl (%rdx,%rax,1), %eax
	shll $24, %eax
	movl %ecx, %edx
	shrl $16, %edx
	andl $255, %edx
	movslq %edx, %rdx
	movzbl (%rsi,%rdx,1), %edx
	leaq standard__crypto__encryption__AES__SBOX(%rip), %rsi
	movzbl %dl, %edx
	shll $16, %edx
	orl %edx, %eax
	movl %ecx, %edx
	shrl $8, %edx
	andl $255, %edx
	movslq %edx, %rdx
	movzbl (%rsi,%rdx,1), %edx
	shll $8, %edx
	orl %edx, %eax
	leaq standard__crypto__encryption__AES__SBOX(%rip), %rdx
	andl $255, %ecx
	movslq %ecx, %rcx
	movzbl (%rdx,%rcx,1), %ecx
	orl %ecx, %eax
	movq 0(%rsp), %rsi
	addq $16, %rsp
	ret
	.text
	.globl standard__crypto__encryption__AES__rot_word__1__dataE1_ubits32__ret_dataE1_ubits32
	.def standard__crypto__encryption__AES__rot_word__1__dataE1_ubits32__ret_dataE1_ubits32;
	.scl 2;
	.type 32;
	.endef
standard__crypto__encryption__AES__rot_word__1__dataE1_ubits32__ret_dataE1_ubits32:
.LB14315:
	rorx $24, %ecx, %eax
	ret
	.text
	.globl standard__crypto__encryption__AES__aes_key_expansion__2__AES_CTXE1_ptr1__byteE1_ptr1__ret_voidE1
	.def standard__crypto__encryption__AES__aes_key_expansion__2__AES_CTXE1_ptr1__byteE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__encryption__AES__aes_key_expansion__2__AES_CTXE1_ptr1__byteE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB14322:
	movq %rcx, %rsi
	movzbl (%rdx), %eax
	movzbl 1(%rdx), %ecx
	movzbl %al, %eax
	movzbl %cl, %ecx
	shll $24, %eax
	shll $16, %ecx
	orl %ecx, %eax
	movzbl 2(%rdx), %ecx
	shll $8, %ecx
	orl %ecx, %eax
	movzbl 3(%rdx), %ecx
	orl %ecx, %eax
	movl %eax, (%rsi)
	movzbl 4(%rdx), %eax
	movzbl 5(%rdx), %ecx
	movzbl %al, %eax
	movzbl %cl, %ecx
	shll $24, %eax
	shll $16, %ecx
	orl %ecx, %eax
	movzbl 6(%rdx), %ecx
	shll $8, %ecx
	orl %ecx, %eax
	movzbl 7(%rdx), %ecx
	orl %ecx, %eax
	movl %eax, 4(%rsi)
	movzbl 8(%rdx), %eax
	movzbl 9(%rdx), %ecx
	movzbl %al, %eax
	movzbl %cl, %ecx
	shll $24, %eax
	shll $16, %ecx
	orl %ecx, %eax
	movzbl 10(%rdx), %ecx
	shll $8, %ecx
	orl %ecx, %eax
	movzbl 11(%rdx), %ecx
	orl %ecx, %eax
	movl %eax, 8(%rsi)
	movzbl 12(%rdx), %eax
	movzbl 13(%rdx), %ecx
	movzbl %al, %eax
	shll $24, %eax
	movzbl %cl, %ecx
	shll $16, %ecx
	orl %ecx, %eax
	movzbl 14(%rdx), %ecx
	shll $8, %ecx
	orl %ecx, %eax
	movzbl 15(%rdx), %ecx
	orl %ecx, %eax
	movl %eax, 12(%rsi)
	movl $4, %edi
.LB14376:
	cmpl $44, %edi
	jae .LB14379
.LB14377:
	leal -1(%rdi), %eax
	movslq %eax, %rax
	movl (%rsi,%rax,4), %eax
	movl %edi, %ecx
	andl $3, %ecx
	je .LB14392
.LB14393:
.LB14394:
	leal -4(%rdi), %ecx
	movslq %ecx, %rcx
	xorl (%rsi,%rcx,4), %eax
	movslq %edi, %rcx
	movl %eax, (%rsi,%rcx,4)
	incl %edi
	cmpl $44, %edi
	jb .LB14377
.LB14379:
	movl $10, 176(%rsi)
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB14392:
	movq %rax, %rcx
	callq standard__crypto__encryption__AES__rot_word__1__dataE1_ubits32__ret_dataE1_ubits32
	movl %eax, %ecx
	callq standard__crypto__encryption__AES__sub_word__1__dataE1_ubits32__ret_dataE1_ubits32
	leaq standard__crypto__encryption__AES__RCON(%rip), %rdx
	movl %edi, %ecx
	shrl $2, %ecx
	decl %ecx
	movslq %ecx, %rcx
	xorl (%rdx,%rcx,4), %eax
	jmp .LB14394
	.text
	.globl standard__crypto__encryption__AES__aes_encrypt_block__3__AES_CTXE1_ptr1__byteE1_ptr1__byteE1_ptr1__ret_voidE1
	.def standard__crypto__encryption__AES__aes_encrypt_block__3__AES_CTXE1_ptr1__byteE1_ptr1__byteE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__encryption__AES__aes_encrypt_block__3__AES_CTXE1_ptr1__byteE1_ptr1__byteE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $80, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
.LB14421:
	movq %rcx, %rsi
	movq %r8, %rdi
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -40(%rbp)
	movzbl (%rdx), %eax
	leaq -40(%rbp), %rcx
	movb %al, -40(%rbp)
	movzbl 1(%rdx), %eax
	movb %al, -39(%rbp)
	movzbl 2(%rdx), %eax
	movb %al, -38(%rbp)
	movzbl 3(%rdx), %eax
	movb %al, -37(%rbp)
	movzbl 4(%rdx), %eax
	movb %al, -36(%rbp)
	movzbl 5(%rdx), %eax
	movb %al, -35(%rbp)
	movzbl 6(%rdx), %eax
	movb %al, -34(%rbp)
	movzbl 7(%rdx), %eax
	movb %al, -33(%rbp)
	movzbl 8(%rdx), %eax
	movb %al, -32(%rbp)
	movzbl 9(%rdx), %eax
	movb %al, -31(%rbp)
	movzbl 10(%rdx), %eax
	movb %al, -30(%rbp)
	movzbl 11(%rdx), %eax
	movb %al, -29(%rbp)
	movzbl 12(%rdx), %eax
	movb %al, -28(%rbp)
	movzbl 13(%rdx), %eax
	movb %al, -27(%rbp)
	movzbl 14(%rdx), %eax
	movb %al, -26(%rbp)
	movzbl 15(%rdx), %eax
	movq %rsi, %rdx
	movb %al, -25(%rbp)
	callq standard__crypto__encryption__AES__add_round_key__2__byteE1_ptr1__dataE1_ptr1_ubits32__ret_voidE1
	movl $1, %ebx
.LB14446:
	cmpl 176(%rsi), %ebx
	jae .LB14449
.LB14447:
	leaq -40(%rbp), %rcx
	callq standard__crypto__encryption__AES__sub_bytes__1__byteE1_ptr1__ret_voidE1
	leaq -40(%rbp), %rcx
	callq standard__crypto__encryption__AES__shift_rows__1__byteE1_ptr1__ret_voidE1
	leaq -40(%rbp), %rcx
	callq standard__crypto__encryption__AES__mix_columns__1__byteE1_ptr1__ret_voidE1
	movl %ebx, %eax
	shll $2, %eax
	movslq %eax, %rax
	leaq (%rsi,%rax,4), %rdx
	leaq -40(%rbp), %rcx
	callq standard__crypto__encryption__AES__add_round_key__2__byteE1_ptr1__dataE1_ptr1_ubits32__ret_voidE1
	incl %ebx
	cmpl 176(%rsi), %ebx
	jb .LB14447
.LB14449:
	leaq -40(%rbp), %rcx
	callq standard__crypto__encryption__AES__sub_bytes__1__byteE1_ptr1__ret_voidE1
	leaq -40(%rbp), %rcx
	callq standard__crypto__encryption__AES__shift_rows__1__byteE1_ptr1__ret_voidE1
	movl 176(%rsi), %eax
	shll $2, %eax
	movslq %eax, %rax
	leaq (%rsi,%rax,4), %rdx
	leaq -40(%rbp), %rcx
	callq standard__crypto__encryption__AES__add_round_key__2__byteE1_ptr1__dataE1_ptr1_ubits32__ret_voidE1
	movzbl -40(%rbp), %eax
	movb %al, (%rdi)
	movzbl -39(%rbp), %eax
	movb %al, 1(%rdi)
	movzbl -38(%rbp), %eax
	movb %al, 2(%rdi)
	movzbl -37(%rbp), %eax
	movb %al, 3(%rdi)
	movzbl -36(%rbp), %eax
	movb %al, 4(%rdi)
	movzbl -35(%rbp), %eax
	movb %al, 5(%rdi)
	movzbl -34(%rbp), %eax
	movb %al, 6(%rdi)
	movzbl -33(%rbp), %eax
	movb %al, 7(%rdi)
	movzbl -32(%rbp), %eax
	movb %al, 8(%rdi)
	movzbl -31(%rbp), %eax
	movb %al, 9(%rdi)
	movzbl -30(%rbp), %eax
	movb %al, 10(%rdi)
	movzbl -29(%rbp), %eax
	movb %al, 11(%rdi)
	movzbl -28(%rbp), %eax
	movb %al, 12(%rdi)
	movzbl -27(%rbp), %eax
	movb %al, 13(%rdi)
	movzbl -26(%rbp), %eax
	movb %al, 14(%rdi)
	movzbl -25(%rbp), %eax
	movb %al, 15(%rdi)
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__crypto__encryption__AES__ghash_mul__2__byteE1_ptr1__byteE1_ptr1__ret_voidE1
	.def standard__crypto__encryption__AES__ghash_mul__2__byteE1_ptr1__byteE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__encryption__AES__ghash_mul__2__byteE1_ptr1__byteE1_ptr1__ret_voidE1:
	subq $64, %rsp
	movq %rbx, 48(%rsp)
	movq %rsi, 40(%rsp)
	movq %rdi, 32(%rsp)
.LB14492:
	movups .LZERO(%rip), %xmm15
	movups %xmm15, 16(%rsp)
	movups .LZERO(%rip), %xmm15
	movups %xmm15, (%rsp)
	movb $0, 16(%rsp)
	movzbl (%rdx), %eax
	movb %al, (%rsp)
	movb $0, 17(%rsp)
	movzbl 1(%rdx), %eax
	movb %al, 1(%rsp)
	movb $0, 18(%rsp)
	movzbl 2(%rdx), %eax
	movb %al, 2(%rsp)
	movb $0, 19(%rsp)
	movzbl 3(%rdx), %eax
	movb %al, 3(%rsp)
	movb $0, 20(%rsp)
	movzbl 4(%rdx), %eax
	movb %al, 4(%rsp)
	movb $0, 21(%rsp)
	movzbl 5(%rdx), %eax
	movb %al, 5(%rsp)
	movb $0, 22(%rsp)
	movzbl 6(%rdx), %eax
	movb %al, 6(%rsp)
	movb $0, 23(%rsp)
	movzbl 7(%rdx), %eax
	movb %al, 7(%rsp)
	movb $0, 24(%rsp)
	movzbl 8(%rdx), %eax
	movb %al, 8(%rsp)
	movb $0, 25(%rsp)
	movzbl 9(%rdx), %eax
	movb %al, 9(%rsp)
	movb $0, 26(%rsp)
	movzbl 10(%rdx), %eax
	movb %al, 10(%rsp)
	movb $0, 27(%rsp)
	movzbl 11(%rdx), %eax
	movb %al, 11(%rsp)
	movb $0, 28(%rsp)
	movzbl 12(%rdx), %eax
	movb %al, 12(%rsp)
	movb $0, 29(%rsp)
	movzbl 13(%rdx), %eax
	movb %al, 13(%rsp)
	movb $0, 30(%rsp)
	movzbl 14(%rdx), %eax
	movb %al, 14(%rsp)
	movb $0, 31(%rsp)
	movzbl 15(%rdx), %eax
	movb %al, 15(%rsp)
	xorl %eax, %eax
	xorl %edx, %edx
	xorl %esi, %esi
.LB14517:
	cmpq $16, %rsi
	jge .LB14520
.LB14518:
	movq %rdx, %rdi
	movq %rax, %rdx
	movl $7, %eax
.LB14523:
	testl %eax, %eax
	js .LB14526
.LB14524:
	movzbl (%rcx,%rsi,1), %edx
	btl %eax, %edx
	jb .LB14539
.LB14541:
	movzbl 15(%rsp), %edx
	andl $1, %edx
	movl $15, %edi
.LB14564:
	testl %edi, %edi
	jle .LB14567
.LB14565:
	movslq %edi, %r8
	movzbl (%rsp,%r8,1), %r8d
	shrl $1, %r8d
	leal -1(%rdi), %r9d
	movslq %r9d, %rbx
	movzbl (%rsp,%rbx,1), %ebx
	andl $1, %ebx
	shll $7, %ebx
	orl %ebx, %r8d
	movslq %edi, %rdi
	movb %r8b, (%rsp,%rdi,1)
	movq %r9, %rdi
	testl %edi, %edi
	jg .LB14565
	jmp .LB14567
.LB14520:
	movzbl 16(%rsp), %eax
	movb %al, (%rcx)
	movzbl 17(%rsp), %eax
	movb %al, 1(%rcx)
	movzbl 18(%rsp), %eax
	movb %al, 2(%rcx)
	movzbl 19(%rsp), %eax
	movb %al, 3(%rcx)
	movzbl 20(%rsp), %eax
	movb %al, 4(%rcx)
	movzbl 21(%rsp), %eax
	movb %al, 5(%rcx)
	movzbl 22(%rsp), %eax
	movb %al, 6(%rcx)
	movzbl 23(%rsp), %eax
	movb %al, 7(%rcx)
	movzbl 24(%rsp), %eax
	movb %al, 8(%rcx)
	movzbl 25(%rsp), %eax
	movb %al, 9(%rcx)
	movzbl 26(%rsp), %eax
	movb %al, 10(%rcx)
	movzbl 27(%rsp), %eax
	movb %al, 11(%rcx)
	movzbl 28(%rsp), %eax
	movb %al, 12(%rcx)
	movzbl 29(%rsp), %eax
	movb %al, 13(%rcx)
	movzbl 30(%rsp), %eax
	movb %al, 14(%rcx)
	movzbl 31(%rsp), %eax
	movb %al, 15(%rcx)
	movq 48(%rsp), %rbx
	movq 40(%rsp), %rsi
	movq 32(%rsp), %rdi
	addq $64, %rsp
	ret
.LB14526:
	incq %rsi
	movq %rdx, %rax
	movq %rdi, %rdx
	cmpq $16, %rsi
	jl .LB14518
	jmp .LB14520
.LB14539:
	movzbl 16(%rsp), %edx
	movzbl (%rsp), %edi
	xorl %edi, %edx
	movb %dl, 16(%rsp)
	movzbl 17(%rsp), %edx
	movzbl 1(%rsp), %edi
	xorl %edi, %edx
	movb %dl, 17(%rsp)
	movzbl 18(%rsp), %edx
	movzbl 2(%rsp), %edi
	xorl %edi, %edx
	movb %dl, 18(%rsp)
	movzbl 19(%rsp), %edx
	movzbl 3(%rsp), %edi
	xorl %edi, %edx
	movb %dl, 19(%rsp)
	movzbl 20(%rsp), %edx
	movzbl 4(%rsp), %edi
	xorl %edi, %edx
	movb %dl, 20(%rsp)
	movzbl 21(%rsp), %edx
	movzbl 5(%rsp), %edi
	xorl %edi, %edx
	movb %dl, 21(%rsp)
	movzbl 22(%rsp), %edx
	movzbl 6(%rsp), %edi
	xorl %edi, %edx
	movb %dl, 22(%rsp)
	movzbl 23(%rsp), %edx
	movzbl 7(%rsp), %edi
	xorl %edi, %edx
	movb %dl, 23(%rsp)
	movzbl 24(%rsp), %edx
	movzbl 8(%rsp), %edi
	xorl %edi, %edx
	movb %dl, 24(%rsp)
	movzbl 25(%rsp), %edx
	movzbl 9(%rsp), %edi
	xorl %edi, %edx
	movb %dl, 25(%rsp)
	movzbl 26(%rsp), %edx
	movzbl 10(%rsp), %edi
	xorl %edi, %edx
	movb %dl, 26(%rsp)
	movzbl 27(%rsp), %edx
	movzbl 11(%rsp), %edi
	xorl %edi, %edx
	movb %dl, 27(%rsp)
	movzbl 28(%rsp), %edx
	movzbl 12(%rsp), %edi
	xorl %edi, %edx
	movb %dl, 28(%rsp)
	movzbl 29(%rsp), %edx
	movzbl 13(%rsp), %edi
	xorl %edi, %edx
	movb %dl, 29(%rsp)
	movzbl 30(%rsp), %edx
	movzbl 14(%rsp), %edi
	xorl %edi, %edx
	movb %dl, 30(%rsp)
	movzbl 31(%rsp), %edx
	movzbl 15(%rsp), %edi
	xorl %edi, %edx
	movb %dl, 31(%rsp)
	jmp .LB14541
.LB14567:
	movzbl (%rsp), %r8d
	shrl $1, %r8d
	movb %r8b, (%rsp)
	testb %dl, %dl
	jne .LB14599
.LB14601:
	decl %eax
	movq %rdx, %r11
	movq %rdi, %rdx
	movq %r11, %rdi
	testl %eax, %eax
	jns .LB14524
	jmp .LB14526
.LB14599:
	movzbl (%rsp), %r8d
	xorl $225, %r8d
	movb %r8b, (%rsp)
	jmp .LB14601
	.text
	.globl standard__crypto__encryption__AES__ghash_update__4__byteE1_ptr1__byteE1_ptr1__intE1__byteE1_ptr1__ret_voidE1
	.def standard__crypto__encryption__AES__ghash_update__4__byteE1_ptr1__byteE1_ptr1__intE1__byteE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__encryption__AES__ghash_update__4__byteE1_ptr1__byteE1_ptr1__intE1__byteE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $96, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
	movq %r14, -48(%rbp)
.LB14625:
	movq %rcx, %rsi
	movq %rdx, %rdi
	movq %r9, %rbx
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -64(%rbp)
	movl %r8d, %eax
	sarl $31, %eax
	shrl $28, %eax
	addl %r8d, %eax
	movl %eax, %r12d
	sarl $4, %r12d
	movl %r12d, %eax
	shll $4, %eax
	movl %r8d, %r13d
	subl %eax, %r13d
	xorl %r14d, %r14d
.LB14642:
	cmpl %r12d, %r14d
	jge .LB14645
.LB14643:
	movl %r14d, %eax
	shll $4, %eax
	movzbl (%rbx), %ecx
	movslq %eax, %rdx
	movzbl (%rdi,%rdx,1), %edx
	xorl %edx, %ecx
	leal 1(%rax), %edx
	movb %cl, (%rbx)
	movslq %edx, %rdx
	movzbl 1(%rbx), %ecx
	movzbl (%rdi,%rdx,1), %edx
	xorl %edx, %ecx
	leal 2(%rax), %edx
	movb %cl, 1(%rbx)
	movslq %edx, %rdx
	movzbl 2(%rbx), %ecx
	movzbl (%rdi,%rdx,1), %edx
	xorl %edx, %ecx
	leal 3(%rax), %edx
	movb %cl, 2(%rbx)
	movslq %edx, %rdx
	movzbl 3(%rbx), %ecx
	movzbl (%rdi,%rdx,1), %edx
	xorl %edx, %ecx
	leal 4(%rax), %edx
	movb %cl, 3(%rbx)
	movslq %edx, %rdx
	movzbl 4(%rbx), %ecx
	movzbl (%rdi,%rdx,1), %edx
	xorl %edx, %ecx
	leal 5(%rax), %edx
	movb %cl, 4(%rbx)
	movslq %edx, %rdx
	movzbl 5(%rbx), %ecx
	movzbl (%rdi,%rdx,1), %edx
	xorl %edx, %ecx
	leal 6(%rax), %edx
	movb %cl, 5(%rbx)
	movslq %edx, %rdx
	movzbl 6(%rbx), %ecx
	movzbl (%rdi,%rdx,1), %edx
	xorl %edx, %ecx
	leal 7(%rax), %edx
	movb %cl, 6(%rbx)
	movslq %edx, %rdx
	movzbl 7(%rbx), %ecx
	movzbl (%rdi,%rdx,1), %edx
	xorl %edx, %ecx
	movb %cl, 7(%rbx)
	leal 8(%rax), %edx
	movzbl 8(%rbx), %ecx
	movslq %edx, %rdx
	movzbl (%rdi,%rdx,1), %edx
	xorl %edx, %ecx
	leal 9(%rax), %edx
	movb %cl, 8(%rbx)
	movslq %edx, %rdx
	movzbl 9(%rbx), %ecx
	movzbl (%rdi,%rdx,1), %edx
	xorl %edx, %ecx
	leal 10(%rax), %edx
	movb %cl, 9(%rbx)
	movslq %edx, %rdx
	movzbl 10(%rbx), %ecx
	movzbl (%rdi,%rdx,1), %edx
	xorl %edx, %ecx
	leal 11(%rax), %edx
	movb %cl, 10(%rbx)
	movslq %edx, %rdx
	movzbl 11(%rbx), %ecx
	movzbl (%rdi,%rdx,1), %edx
	xorl %edx, %ecx
	leal 12(%rax), %edx
	movb %cl, 11(%rbx)
	movslq %edx, %rdx
	movzbl 12(%rbx), %ecx
	movzbl (%rdi,%rdx,1), %edx
	xorl %edx, %ecx
	leal 13(%rax), %edx
	movb %cl, 12(%rbx)
	movslq %edx, %rdx
	movzbl 13(%rbx), %ecx
	movzbl (%rdi,%rdx,1), %edx
	xorl %edx, %ecx
	leal 14(%rax), %edx
	movb %cl, 13(%rbx)
	movslq %edx, %rdx
	movzbl 14(%rbx), %ecx
	movzbl (%rdi,%rdx,1), %edx
	xorl %edx, %ecx
	addl $15, %eax
	movb %cl, 14(%rbx)
	movslq %eax, %rax
	movzbl 15(%rbx), %ecx
	movzbl (%rdi,%rax,1), %eax
	xorl %eax, %ecx
	movb %cl, 15(%rbx)
	movq %rbx, %rcx
	movq %rsi, %rdx
	callq standard__crypto__encryption__AES__ghash_mul__2__byteE1_ptr1__byteE1_ptr1__ret_voidE1
	incl %r14d
	cmpl %r12d, %r14d
	jl .LB14643
.LB14645:
	testl %r13d, %r13d
	jg .LB14679
.LB14680:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	leave
	ret
.LB14679:
	vpxor %xmm15, %xmm15, %xmm15
	vmovdqu %xmm15, -64(%rbp)
	shll $4, %r12d
	movl %r13d, %eax
	shrl $2, %eax
	xorl %ecx, %ecx
.LB32037:
	testl %eax, %eax
	je .LB32039
.LB32038:
	leal (%r12,%rcx), %edx
	movslq %edx, %rdx
	movzbl (%rdi,%rdx,1), %edx
	movslq %ecx, %r8
	movb %dl, -64(%rbp,%r8,1)
	leal 1(%rcx), %edx
	leal (%r12,%rdx), %r8d
	movslq %r8d, %r8
	movzbl (%rdi,%r8,1), %r8d
	movslq %edx, %rdx
	movb %r8b, -64(%rbp,%rdx,1)
	leal 2(%rcx), %edx
	leal (%r12,%rdx), %r8d
	movslq %r8d, %r8
	movzbl (%rdi,%r8,1), %r8d
	movslq %edx, %rdx
	movb %r8b, -64(%rbp,%rdx,1)
	leal 3(%rcx), %edx
	leal (%r12,%rdx), %r8d
	movslq %r8d, %r8
	movzbl (%rdi,%r8,1), %r8d
	movslq %edx, %rdx
	movb %r8b, -64(%rbp,%rdx,1)
	addl $4, %ecx
	decl %eax
	jne .LB32038
.LB32039:
.LB14694:
	cmpl %r13d, %ecx
	jge .LB14697
.LB14695:
	leal (%r12,%rcx), %eax
	movslq %eax, %rax
	movzbl (%rdi,%rax,1), %eax
	movslq %ecx, %rdx
	movb %al, -64(%rbp,%rdx,1)
	incl %ecx
	cmpl %r13d, %ecx
	jl .LB14695
.LB14697:
	movzbl (%rbx), %eax
	movzbl -64(%rbp), %ecx
	xorl %ecx, %eax
	movb %al, (%rbx)
	movzbl 1(%rbx), %eax
	movzbl -63(%rbp), %ecx
	xorl %ecx, %eax
	movb %al, 1(%rbx)
	movzbl 2(%rbx), %eax
	movzbl -62(%rbp), %ecx
	xorl %ecx, %eax
	movb %al, 2(%rbx)
	movzbl 3(%rbx), %eax
	movzbl -61(%rbp), %ecx
	xorl %ecx, %eax
	movb %al, 3(%rbx)
	movzbl 4(%rbx), %eax
	movzbl -60(%rbp), %ecx
	xorl %ecx, %eax
	movb %al, 4(%rbx)
	movzbl 5(%rbx), %eax
	movzbl -59(%rbp), %ecx
	xorl %ecx, %eax
	movb %al, 5(%rbx)
	movzbl 6(%rbx), %eax
	movzbl -58(%rbp), %ecx
	xorl %ecx, %eax
	movb %al, 6(%rbx)
	movzbl 7(%rbx), %eax
	movzbl -57(%rbp), %ecx
	xorl %ecx, %eax
	movb %al, 7(%rbx)
	movzbl 8(%rbx), %eax
	movzbl -56(%rbp), %ecx
	xorl %ecx, %eax
	movb %al, 8(%rbx)
	movzbl 9(%rbx), %eax
	movzbl -55(%rbp), %ecx
	xorl %ecx, %eax
	movb %al, 9(%rbx)
	movzbl 10(%rbx), %eax
	movzbl -54(%rbp), %ecx
	xorl %ecx, %eax
	movb %al, 10(%rbx)
	movzbl 11(%rbx), %eax
	movzbl -53(%rbp), %ecx
	xorl %ecx, %eax
	movb %al, 11(%rbx)
	movzbl 12(%rbx), %eax
	movzbl -52(%rbp), %ecx
	xorl %ecx, %eax
	movb %al, 12(%rbx)
	movzbl 13(%rbx), %eax
	movzbl -51(%rbp), %ecx
	xorl %ecx, %eax
	movb %al, 13(%rbx)
	movzbl 14(%rbx), %eax
	movzbl -50(%rbp), %ecx
	xorl %ecx, %eax
	movb %al, 14(%rbx)
	movzbl 15(%rbx), %eax
	movzbl -49(%rbp), %ecx
	xorl %ecx, %eax
	movb %al, 15(%rbx)
	movq %rbx, %rcx
	movq %rsi, %rdx
	callq standard__crypto__encryption__AES__ghash_mul__2__byteE1_ptr1__byteE1_ptr1__ret_voidE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	leave
	ret
	.text
	.globl standard__crypto__encryption__AES__gcm_inc32__1__byteE1_ptr1__ret_voidE1
	.def standard__crypto__encryption__AES__gcm_inc32__1__byteE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__encryption__AES__gcm_inc32__1__byteE1_ptr1__ret_voidE1:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
.LB14732:
	movl $15, %eax
.LB14735:
	cmpl $12, %eax
	jl .LB14738
.LB14736:
	movslq %eax, %rdx
	leaq (%rcx,%rdx,1), %rdx
	movzbl (%rdx), %esi
	incl %esi
	movb %sil, (%rdx)
	testb %sil, %sil
	jne .LB14756
.LB14757:
	decl %eax
	cmpl $12, %eax
	jge .LB14736
.LB14738:
	movq 0(%rsp), %rsi
	addq $16, %rsp
	ret
.LB14756:
	movq 0(%rsp), %rsi
	addq $16, %rsp
	ret
	.text
	.globl standard__crypto__encryption__AES__gcm_init__2__GCM_CTXE1_ptr1__byteE1_ptr1__ret_voidE1
	.def standard__crypto__encryption__AES__gcm_init__2__GCM_CTXE1_ptr1__byteE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__encryption__AES__gcm_init__2__GCM_CTXE1_ptr1__byteE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rsi, -8(%rbp)
.LB14761:
	movq %rcx, %rsi
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -24(%rbp)
	movq %rsi, %rcx
	callq standard__crypto__encryption__AES__aes_key_expansion__2__AES_CTXE1_ptr1__byteE1_ptr1__ret_voidE1
	vpxor %xmm15, %xmm15, %xmm15
	vmovdqu %xmm15, -24(%rbp)
	leaq -24(%rbp), %rdx
	leaq 180(%rsi), %r8
	movq %rsi, %rcx
	callq standard__crypto__encryption__AES__aes_encrypt_block__3__AES_CTXE1_ptr1__byteE1_ptr1__byteE1_ptr1__ret_voidE1
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl standard__crypto__encryption__AES__gcm_encrypt__8__GCM_CTXE1_ptr1__byteE1_ptr1__byteE1_ptr1__intE1__byteE1_ptr1__intE1__byteE1_ptr1__byteE1_ptr1__ret_voidE1
	.def standard__crypto__encryption__AES__gcm_encrypt__8__GCM_CTXE1_ptr1__byteE1_ptr1__byteE1_ptr1__intE1__byteE1_ptr1__intE1__byteE1_ptr1__byteE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__encryption__AES__gcm_encrypt__8__GCM_CTXE1_ptr1__byteE1_ptr1__byteE1_ptr1__intE1__byteE1_ptr1__intE1__byteE1_ptr1__byteE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $224, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
	movq %r14, -48(%rbp)
	movq %r15, -56(%rbp)
.LB14785:
	movq %rcx, %rsi
	movq %r8, %rdi
	movq %r9, -168(%rbp)
	movq 48(%rbp), %rbx
	movl 56(%rbp), %eax
	movq %rax, -184(%rbp)
	movq 64(%rbp), %r12
	movq 72(%rbp), %r13
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -72(%rbp)
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -88(%rbp)
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -104(%rbp)
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -120(%rbp)
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -136(%rbp)
	movzbl (%rdx), %eax
	movb %al, -72(%rbp)
	movzbl 1(%rdx), %eax
	movb %al, -71(%rbp)
	movzbl 2(%rdx), %eax
	movb %al, -70(%rbp)
	movzbl 3(%rdx), %eax
	movb %al, -69(%rbp)
	movzbl 4(%rdx), %eax
	movb %al, -68(%rbp)
	movzbl 5(%rdx), %eax
	movb %al, -67(%rbp)
	movzbl 6(%rdx), %eax
	movb %al, -66(%rbp)
	movzbl 7(%rdx), %eax
	movb %al, -65(%rbp)
	movzbl 8(%rdx), %eax
	movb %al, -64(%rbp)
	movzbl 9(%rdx), %eax
	movb %al, -63(%rbp)
	movzbl 10(%rdx), %eax
	movb %al, -62(%rbp)
	movzbl 11(%rdx), %eax
	movb %al, -61(%rbp)
	movl $16777216, -141(%rbp)
	movb $0, -137(%rbp)
	movzbl -141(%rbp), %eax
	movb %al, -60(%rbp)
	movzbl -140(%rbp), %eax
	movb %al, -59(%rbp)
	movzbl -139(%rbp), %eax
	movb %al, -58(%rbp)
	movzbl -138(%rbp), %eax
	movb %al, -57(%rbp)
	movzbl -72(%rbp), %eax
	movb %al, -88(%rbp)
	movzbl -71(%rbp), %eax
	movb %al, -87(%rbp)
	movzbl -70(%rbp), %eax
	movb %al, -86(%rbp)
	movzbl -69(%rbp), %eax
	movb %al, -85(%rbp)
	movzbl -68(%rbp), %eax
	movb %al, -84(%rbp)
	movzbl -67(%rbp), %eax
	movb %al, -83(%rbp)
	movzbl -66(%rbp), %eax
	movb %al, -82(%rbp)
	movzbl -65(%rbp), %eax
	leaq -88(%rbp), %rcx
	movb %al, -81(%rbp)
	movzbl -64(%rbp), %eax
	movb %al, -80(%rbp)
	movzbl -63(%rbp), %eax
	movb %al, -79(%rbp)
	movzbl -62(%rbp), %eax
	movb %al, -78(%rbp)
	movzbl -61(%rbp), %eax
	movb %al, -77(%rbp)
	movzbl -60(%rbp), %eax
	movb %al, -76(%rbp)
	movzbl -59(%rbp), %eax
	movb %al, -75(%rbp)
	movzbl -58(%rbp), %eax
	movb %al, -74(%rbp)
	movzbl -57(%rbp), %eax
	movb %al, -73(%rbp)
	callq standard__crypto__encryption__AES__gcm_inc32__1__byteE1_ptr1__ret_voidE1
	vpxor %xmm15, %xmm15, %xmm15
	vmovdqu %xmm15, -120(%rbp)
	movq -168(%rbp), %rax
	testl %eax, %eax
	jg .LB14865
.LB14867:
	movq -184(%rbp), %rax
	movl %eax, %ecx
	sarl $31, %ecx
	shrl $28, %ecx
	addl %eax, %ecx
	movl %ecx, %edi
	sarl $4, %edi
	movl %edi, %ecx
	shll $4, %ecx
	movl %eax, %r14d
	subl %ecx, %r14d
	movq $0, -176(%rbp)
.LB14880:
	movq -176(%rbp), %rax
	cmpl %edi, %eax
	jge .LB14883
.LB14881:
	leaq -88(%rbp), %rdx
	leaq -104(%rbp), %r8
	movq -176(%rbp), %rax
	movq %rsi, %rcx
	movl %eax, %r15d
	shll $4, %r15d
	callq standard__crypto__encryption__AES__aes_encrypt_block__3__AES_CTXE1_ptr1__byteE1_ptr1__byteE1_ptr1__ret_voidE1
	leaq -88(%rbp), %rcx
	callq standard__crypto__encryption__AES__gcm_inc32__1__byteE1_ptr1__ret_voidE1
	movslq %r15d, %rax
	movzbl (%rbx,%rax,1), %ecx
	movzbl -104(%rbp), %edx
	xorl %edx, %ecx
	movb %cl, (%r12,%rax,1)
	leal 1(%r15), %eax
	movslq %eax, %rax
	movzbl (%rbx,%rax,1), %ecx
	movzbl -103(%rbp), %edx
	xorl %edx, %ecx
	movb %cl, (%r12,%rax,1)
	leal 2(%r15), %eax
	movslq %eax, %rax
	movzbl (%rbx,%rax,1), %ecx
	movzbl -102(%rbp), %edx
	xorl %edx, %ecx
	movb %cl, (%r12,%rax,1)
	leal 3(%r15), %eax
	movslq %eax, %rax
	movzbl (%rbx,%rax,1), %ecx
	movzbl -101(%rbp), %edx
	xorl %edx, %ecx
	movb %cl, (%r12,%rax,1)
	leal 4(%r15), %eax
	movslq %eax, %rax
	movzbl (%rbx,%rax,1), %ecx
	movzbl -100(%rbp), %edx
	xorl %edx, %ecx
	movb %cl, (%r12,%rax,1)
	leal 5(%r15), %eax
	movslq %eax, %rax
	movzbl (%rbx,%rax,1), %ecx
	movzbl -99(%rbp), %edx
	xorl %edx, %ecx
	movb %cl, (%r12,%rax,1)
	leal 6(%r15), %eax
	movslq %eax, %rax
	movzbl (%rbx,%rax,1), %ecx
	movzbl -98(%rbp), %edx
	xorl %edx, %ecx
	movb %cl, (%r12,%rax,1)
	leal 7(%r15), %eax
	movslq %eax, %rax
	movzbl (%rbx,%rax,1), %ecx
	movzbl -97(%rbp), %edx
	xorl %edx, %ecx
	movb %cl, (%r12,%rax,1)
	leal 8(%r15), %eax
	movslq %eax, %rax
	movzbl (%rbx,%rax,1), %ecx
	movzbl -96(%rbp), %edx
	xorl %edx, %ecx
	movb %cl, (%r12,%rax,1)
	leal 9(%r15), %eax
	movslq %eax, %rax
	movzbl (%rbx,%rax,1), %ecx
	movzbl -95(%rbp), %edx
	xorl %edx, %ecx
	movb %cl, (%r12,%rax,1)
	leal 10(%r15), %eax
	movslq %eax, %rax
	movzbl (%rbx,%rax,1), %ecx
	movzbl -94(%rbp), %edx
	xorl %edx, %ecx
	movb %cl, (%r12,%rax,1)
	leal 11(%r15), %eax
	movslq %eax, %rax
	movzbl (%rbx,%rax,1), %ecx
	movzbl -93(%rbp), %edx
	xorl %edx, %ecx
	movb %cl, (%r12,%rax,1)
	leal 12(%r15), %eax
	movslq %eax, %rax
	movzbl (%rbx,%rax,1), %ecx
	movzbl -92(%rbp), %edx
	xorl %edx, %ecx
	movb %cl, (%r12,%rax,1)
	leal 13(%r15), %eax
	movslq %eax, %rax
	movzbl (%rbx,%rax,1), %ecx
	movzbl -91(%rbp), %edx
	xorl %edx, %ecx
	movb %cl, (%r12,%rax,1)
	leal 14(%r15), %eax
	movslq %eax, %rax
	movzbl (%rbx,%rax,1), %ecx
	movzbl -90(%rbp), %edx
	xorl %edx, %ecx
	addl $15, %r15d
	movb %cl, (%r12,%rax,1)
	movslq %r15d, %rax
	movzbl (%rbx,%rax,1), %ecx
	movzbl -89(%rbp), %edx
	xorl %edx, %ecx
	movb %cl, (%r12,%rax,1)
	movq -176(%rbp), %rax
	incl %eax
	movq %rax, -176(%rbp)
	jmp .LB14880
.LB14865:
	leaq 180(%rsi), %rcx
	leaq -120(%rbp), %r9
	movq -168(%rbp), %r8
	movq %rdi, %rdx
	callq standard__crypto__encryption__AES__ghash_update__4__byteE1_ptr1__byteE1_ptr1__intE1__byteE1_ptr1__ret_voidE1
	jmp .LB14867
.LB14883:
	testl %r14d, %r14d
	jg .LB14921
.LB14923:
	movq -184(%rbp), %rax
	testl %eax, %eax
	jg .LB14956
.LB14958:
	movl -168(%rbp), %eax
	movl -184(%rbp), %ecx
	shlq $3, %rax
	shlq $3, %rcx
	movq %rax, %rdx
	shrq $56, %rdx
	movb %dl, -150(%rbp)
	movq %rax, %rdx
	shrq $48, %rdx
	movb %dl, -149(%rbp)
	movq %rax, %rdx
	shrq $40, %rdx
	movb %dl, -148(%rbp)
	movq %rax, %rdx
	shrq $32, %rdx
	movb %dl, -147(%rbp)
	movq %rax, %rdx
	shrq $24, %rdx
	movb %dl, -146(%rbp)
	movq %rax, %rdx
	shrq $16, %rdx
	movb %dl, -145(%rbp)
	movq %rax, %rdx
	shrq $8, %rdx
	movb %dl, -144(%rbp)
	movb %al, -143(%rbp)
	movb $0, -142(%rbp)
	movzbl -150(%rbp), %eax
	movb %al, -136(%rbp)
	movzbl -149(%rbp), %eax
	movb %al, -135(%rbp)
	movzbl -148(%rbp), %eax
	movb %al, -134(%rbp)
	movzbl -147(%rbp), %eax
	movb %al, -133(%rbp)
	movzbl -146(%rbp), %eax
	movb %al, -132(%rbp)
	movzbl -145(%rbp), %eax
	movb %al, -131(%rbp)
	movzbl -144(%rbp), %eax
	movb %al, -130(%rbp)
	movzbl -143(%rbp), %eax
	movb %al, -129(%rbp)
	movq %rcx, %rax
	shrq $56, %rax
	movb %al, -159(%rbp)
	movq %rcx, %rax
	shrq $48, %rax
	movb %al, -158(%rbp)
	movq %rcx, %rax
	shrq $40, %rax
	movb %al, -157(%rbp)
	movq %rcx, %rax
	shrq $32, %rax
	movb %al, -156(%rbp)
	movq %rcx, %rax
	shrq $24, %rax
	movb %al, -155(%rbp)
	movq %rcx, %rax
	shrq $16, %rax
	movb %al, -154(%rbp)
	movq %rcx, %rax
	shrq $8, %rax
	movb %al, -153(%rbp)
	movb %cl, -152(%rbp)
	movb $0, -151(%rbp)
	movzbl -159(%rbp), %eax
	movb %al, -128(%rbp)
	movzbl -158(%rbp), %eax
	movb %al, -127(%rbp)
	movzbl -157(%rbp), %eax
	movb %al, -126(%rbp)
	movzbl -156(%rbp), %eax
	movb %al, -125(%rbp)
	movzbl -155(%rbp), %eax
	movb %al, -124(%rbp)
	movzbl -154(%rbp), %eax
	movb %al, -123(%rbp)
	movzbl -153(%rbp), %eax
	movb %al, -122(%rbp)
	movzbl -152(%rbp), %eax
	movb %al, -121(%rbp)
	movzbl -120(%rbp), %eax
	movzbl -136(%rbp), %ecx
	xorl %ecx, %eax
	movb %al, -120(%rbp)
	movzbl -119(%rbp), %eax
	movzbl -135(%rbp), %ecx
	xorl %ecx, %eax
	movb %al, -119(%rbp)
	movzbl -118(%rbp), %eax
	movzbl -134(%rbp), %ecx
	xorl %ecx, %eax
	movb %al, -118(%rbp)
	movzbl -117(%rbp), %eax
	movzbl -133(%rbp), %ecx
	xorl %ecx, %eax
	movb %al, -117(%rbp)
	movzbl -116(%rbp), %eax
	movzbl -132(%rbp), %ecx
	xorl %ecx, %eax
	movb %al, -116(%rbp)
	movzbl -115(%rbp), %eax
	movzbl -131(%rbp), %ecx
	xorl %ecx, %eax
	movb %al, -115(%rbp)
	movzbl -114(%rbp), %eax
	movzbl -130(%rbp), %ecx
	xorl %ecx, %eax
	movb %al, -114(%rbp)
	movzbl -113(%rbp), %eax
	movzbl -129(%rbp), %ecx
	xorl %ecx, %eax
	movb %al, -113(%rbp)
	movzbl -112(%rbp), %eax
	movzbl -128(%rbp), %ecx
	xorl %ecx, %eax
	movb %al, -112(%rbp)
	movzbl -111(%rbp), %eax
	movzbl -127(%rbp), %ecx
	xorl %ecx, %eax
	movb %al, -111(%rbp)
	movzbl -110(%rbp), %eax
	movzbl -126(%rbp), %ecx
	xorl %ecx, %eax
	movb %al, -110(%rbp)
	movzbl -109(%rbp), %eax
	movzbl -125(%rbp), %ecx
	xorl %ecx, %eax
	movb %al, -109(%rbp)
	movzbl -108(%rbp), %eax
	movzbl -124(%rbp), %ecx
	xorl %ecx, %eax
	movb %al, -108(%rbp)
	movzbl -107(%rbp), %eax
	movzbl -123(%rbp), %ecx
	xorl %ecx, %eax
	movb %al, -107(%rbp)
	movzbl -106(%rbp), %eax
	movzbl -122(%rbp), %ecx
	xorl %ecx, %eax
	movb %al, -106(%rbp)
	movzbl -105(%rbp), %eax
	movzbl -121(%rbp), %ecx
	leaq 180(%rsi), %rdx
	xorl %ecx, %eax
	leaq -120(%rbp), %rcx
	movb %al, -105(%rbp)
	callq standard__crypto__encryption__AES__ghash_mul__2__byteE1_ptr1__byteE1_ptr1__ret_voidE1
	movq %rsi, %rcx
	leaq -72(%rbp), %rdx
	leaq -104(%rbp), %r8
	callq standard__crypto__encryption__AES__aes_encrypt_block__3__AES_CTXE1_ptr1__byteE1_ptr1__byteE1_ptr1__ret_voidE1
	movzbl -120(%rbp), %eax
	movzbl -104(%rbp), %ecx
	xorl %ecx, %eax
	movb %al, (%r13)
	movzbl -119(%rbp), %eax
	movzbl -103(%rbp), %ecx
	xorl %ecx, %eax
	movb %al, 1(%r13)
	movzbl -118(%rbp), %eax
	movzbl -102(%rbp), %ecx
	xorl %ecx, %eax
	movb %al, 2(%r13)
	movzbl -117(%rbp), %eax
	movzbl -101(%rbp), %ecx
	xorl %ecx, %eax
	movb %al, 3(%r13)
	movzbl -116(%rbp), %eax
	movzbl -100(%rbp), %ecx
	xorl %ecx, %eax
	movb %al, 4(%r13)
	movzbl -115(%rbp), %eax
	movzbl -99(%rbp), %ecx
	xorl %ecx, %eax
	movb %al, 5(%r13)
	movzbl -114(%rbp), %eax
	movzbl -98(%rbp), %ecx
	xorl %ecx, %eax
	movb %al, 6(%r13)
	movzbl -113(%rbp), %eax
	movzbl -97(%rbp), %ecx
	xorl %ecx, %eax
	movb %al, 7(%r13)
	movzbl -112(%rbp), %eax
	movzbl -96(%rbp), %ecx
	xorl %ecx, %eax
	movb %al, 8(%r13)
	movzbl -111(%rbp), %eax
	movzbl -95(%rbp), %ecx
	xorl %ecx, %eax
	movb %al, 9(%r13)
	movzbl -110(%rbp), %eax
	movzbl -94(%rbp), %ecx
	xorl %ecx, %eax
	movb %al, 10(%r13)
	movzbl -109(%rbp), %eax
	movzbl -93(%rbp), %ecx
	xorl %ecx, %eax
	movb %al, 11(%r13)
	movzbl -108(%rbp), %eax
	movzbl -92(%rbp), %ecx
	xorl %ecx, %eax
	movb %al, 12(%r13)
	movzbl -107(%rbp), %eax
	movzbl -91(%rbp), %ecx
	xorl %ecx, %eax
	movb %al, 13(%r13)
	movzbl -106(%rbp), %eax
	movzbl -90(%rbp), %ecx
	xorl %ecx, %eax
	movb %al, 14(%r13)
	movzbl -105(%rbp), %eax
	movzbl -89(%rbp), %ecx
	xorl %ecx, %eax
	movb %al, 15(%r13)
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB14921:
	shll $4, %edi
	movq %rsi, %rcx
	leaq -88(%rbp), %rdx
	leaq -104(%rbp), %r8
	callq standard__crypto__encryption__AES__aes_encrypt_block__3__AES_CTXE1_ptr1__byteE1_ptr1__byteE1_ptr1__ret_voidE1
	movl %r14d, %eax
	shrl $2, %eax
	xorl %ecx, %ecx
.LB32040:
	testl %eax, %eax
	je .LB32042
.LB32041:
	leal (%rdi,%rcx), %edx
	movslq %ecx, %r9
	movslq %edx, %r8
	movslq %edx, %rdx
	movzbl (%rbx,%r8,1), %r8d
	movzbl -104(%rbp,%r9,1), %r9d
	xorl %r9d, %r8d
	movb %r8b, (%r12,%rdx,1)
	leal 1(%rcx), %edx
	leal (%rdi,%rdx), %r8d
	movslq %edx, %rdx
	movslq %r8d, %r9
	movzbl (%rbx,%r9,1), %r9d
	movzbl -104(%rbp,%rdx,1), %edx
	xorl %edx, %r9d
	movslq %r8d, %rdx
	movb %r9b, (%r12,%rdx,1)
	leal 2(%rcx), %edx
	leal (%rdi,%rdx), %r8d
	movslq %edx, %rdx
	movslq %r8d, %r9
	movzbl (%rbx,%r9,1), %r9d
	movzbl -104(%rbp,%rdx,1), %edx
	xorl %edx, %r9d
	movslq %r8d, %rdx
	movb %r9b, (%r12,%rdx,1)
	leal 3(%rcx), %edx
	leal (%rdi,%rdx), %r8d
	movslq %edx, %rdx
	movslq %r8d, %r9
	movzbl (%rbx,%r9,1), %r9d
	movzbl -104(%rbp,%rdx,1), %edx
	xorl %edx, %r9d
	movslq %r8d, %rdx
	addl $4, %ecx
	decl %eax
	movb %r9b, (%r12,%rdx,1)
	testl %eax, %eax
	jne .LB32041
.LB32042:
.LB14930:
	cmpl %r14d, %ecx
	jge .LB14923
.LB14931:
	leal (%rdi,%rcx), %eax
	movslq %ecx, %r8
	movslq %eax, %rdx
	movslq %eax, %rax
	movzbl (%rbx,%rdx,1), %edx
	movzbl -104(%rbp,%r8,1), %r8d
	xorl %r8d, %edx
	incl %ecx
	movb %dl, (%r12,%rax,1)
	cmpl %r14d, %ecx
	jl .LB14931
	jmp .LB14923
.LB14956:
	leaq 180(%rsi), %rcx
	leaq -120(%rbp), %r9
	movq -184(%rbp), %r8
	movq %r12, %rdx
	callq standard__crypto__encryption__AES__ghash_update__4__byteE1_ptr1__byteE1_ptr1__intE1__byteE1_ptr1__ret_voidE1
	jmp .LB14958
	.text
	.globl standard__crypto__encryption__AES__gcm_decrypt__8__GCM_CTXE1_ptr1__byteE1_ptr1__byteE1_ptr1__intE1__byteE1_ptr1__intE1__byteE1_ptr1__byteE1_ptr1__ret_intE1
	.def standard__crypto__encryption__AES__gcm_decrypt__8__GCM_CTXE1_ptr1__byteE1_ptr1__byteE1_ptr1__intE1__byteE1_ptr1__intE1__byteE1_ptr1__byteE1_ptr1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__encryption__AES__gcm_decrypt__8__GCM_CTXE1_ptr1__byteE1_ptr1__byteE1_ptr1__intE1__byteE1_ptr1__intE1__byteE1_ptr1__byteE1_ptr1__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $224, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
	movq %r14, -48(%rbp)
	movq %r15, -56(%rbp)
.LB15094:
	movq 48(%rbp), %r12
	movl 56(%rbp), %r13d
	movq 64(%rbp), %r14
	movq 72(%rbp), %r15
	movq %rcx, %rsi
	movq %r8, %rdi
	movl %r9d, %ebx
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -72(%rbp)
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -88(%rbp)
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -104(%rbp)
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -120(%rbp)
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -136(%rbp)
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -152(%rbp)
	movzbl (%rdx), %eax
	movb %al, -72(%rbp)
	movzbl 1(%rdx), %eax
	movb %al, -71(%rbp)
	movzbl 2(%rdx), %eax
	movb %al, -70(%rbp)
	movzbl 3(%rdx), %eax
	movb %al, -69(%rbp)
	movzbl 4(%rdx), %eax
	movb %al, -68(%rbp)
	movzbl 5(%rdx), %eax
	movb %al, -67(%rbp)
	movzbl 6(%rdx), %eax
	movb %al, -66(%rbp)
	movzbl 7(%rdx), %eax
	movb %al, -65(%rbp)
	movzbl 8(%rdx), %eax
	movb %al, -64(%rbp)
	movzbl 9(%rdx), %eax
	movb %al, -63(%rbp)
	movzbl 10(%rdx), %eax
	movb %al, -62(%rbp)
	movzbl 11(%rdx), %eax
	movb %al, -61(%rbp)
	movl $16777216, -157(%rbp)
	movb $0, -153(%rbp)
	movzbl -157(%rbp), %eax
	movb %al, -60(%rbp)
	movzbl -156(%rbp), %eax
	movb %al, -59(%rbp)
	movzbl -155(%rbp), %eax
	movb %al, -58(%rbp)
	movzbl -154(%rbp), %eax
	movb %al, -57(%rbp)
	movzbl -72(%rbp), %eax
	movb %al, -88(%rbp)
	movzbl -71(%rbp), %eax
	movb %al, -87(%rbp)
	movzbl -70(%rbp), %eax
	movb %al, -86(%rbp)
	movzbl -69(%rbp), %eax
	movb %al, -85(%rbp)
	movzbl -68(%rbp), %eax
	movb %al, -84(%rbp)
	movzbl -67(%rbp), %eax
	movb %al, -83(%rbp)
	movzbl -66(%rbp), %eax
	movb %al, -82(%rbp)
	movzbl -65(%rbp), %eax
	leaq -88(%rbp), %rcx
	movb %al, -81(%rbp)
	movzbl -64(%rbp), %eax
	movb %al, -80(%rbp)
	movzbl -63(%rbp), %eax
	movb %al, -79(%rbp)
	movzbl -62(%rbp), %eax
	movb %al, -78(%rbp)
	movzbl -61(%rbp), %eax
	movb %al, -77(%rbp)
	movzbl -60(%rbp), %eax
	movb %al, -76(%rbp)
	movzbl -59(%rbp), %eax
	movb %al, -75(%rbp)
	movzbl -58(%rbp), %eax
	movb %al, -74(%rbp)
	movzbl -57(%rbp), %eax
	movb %al, -73(%rbp)
	callq standard__crypto__encryption__AES__gcm_inc32__1__byteE1_ptr1__ret_voidE1
	vpxor %xmm15, %xmm15, %xmm15
	vmovdqu %xmm15, -120(%rbp)
	testl %ebx, %ebx
	jg .LB15176
.LB15178:
	testl %r13d, %r13d
	jg .LB15187
.LB15189:
	movq %rbx, %rax
	shlq $3, %rax
	movq %r13, %rcx
	shlq $3, %rcx
	movq %rax, %rdx
	shrq $56, %rdx
	movb %dl, -166(%rbp)
	movq %rax, %rdx
	shrq $48, %rdx
	movb %dl, -165(%rbp)
	movq %rax, %rdx
	shrq $40, %rdx
	movb %dl, -164(%rbp)
	movq %rax, %rdx
	shrq $32, %rdx
	movb %dl, -163(%rbp)
	movq %rax, %rdx
	shrq $24, %rdx
	movb %dl, -162(%rbp)
	movq %rax, %rdx
	shrq $16, %rdx
	movb %dl, -161(%rbp)
	movq %rax, %rdx
	shrq $8, %rdx
	movb %dl, -160(%rbp)
	movb %al, -159(%rbp)
	movb $0, -158(%rbp)
	movzbl -166(%rbp), %eax
	movb %al, -152(%rbp)
	movzbl -165(%rbp), %eax
	movb %al, -151(%rbp)
	movzbl -164(%rbp), %eax
	movb %al, -150(%rbp)
	movzbl -163(%rbp), %eax
	movb %al, -149(%rbp)
	movzbl -162(%rbp), %eax
	movb %al, -148(%rbp)
	movzbl -161(%rbp), %eax
	movb %al, -147(%rbp)
	movzbl -160(%rbp), %eax
	movb %al, -146(%rbp)
	movzbl -159(%rbp), %eax
	movb %al, -145(%rbp)
	movq %rcx, %rax
	shrq $56, %rax
	movb %al, -175(%rbp)
	movq %rcx, %rax
	shrq $48, %rax
	movb %al, -174(%rbp)
	movq %rcx, %rax
	shrq $40, %rax
	movb %al, -173(%rbp)
	movq %rcx, %rax
	shrq $32, %rax
	movb %al, -172(%rbp)
	movq %rcx, %rax
	shrq $24, %rax
	movb %al, -171(%rbp)
	movq %rcx, %rax
	shrq $16, %rax
	movb %al, -170(%rbp)
	movq %rcx, %rax
	shrq $8, %rax
	movb %al, -169(%rbp)
	movb %cl, -168(%rbp)
	movb $0, -167(%rbp)
	movzbl -175(%rbp), %eax
	movb %al, -144(%rbp)
	movzbl -174(%rbp), %eax
	movb %al, -143(%rbp)
	movzbl -173(%rbp), %eax
	movb %al, -142(%rbp)
	movzbl -172(%rbp), %eax
	movb %al, -141(%rbp)
	movzbl -171(%rbp), %eax
	movb %al, -140(%rbp)
	movzbl -170(%rbp), %eax
	movb %al, -139(%rbp)
	movzbl -169(%rbp), %eax
	movb %al, -138(%rbp)
	movzbl -168(%rbp), %eax
	movb %al, -137(%rbp)
	movzbl -120(%rbp), %eax
	movzbl -152(%rbp), %ecx
	xorl %ecx, %eax
	movb %al, -120(%rbp)
	movzbl -119(%rbp), %eax
	movzbl -151(%rbp), %ecx
	xorl %ecx, %eax
	movb %al, -119(%rbp)
	movzbl -118(%rbp), %eax
	movzbl -150(%rbp), %ecx
	xorl %ecx, %eax
	movb %al, -118(%rbp)
	movzbl -117(%rbp), %eax
	movzbl -149(%rbp), %ecx
	xorl %ecx, %eax
	movb %al, -117(%rbp)
	movzbl -116(%rbp), %eax
	movzbl -148(%rbp), %ecx
	xorl %ecx, %eax
	movb %al, -116(%rbp)
	movzbl -115(%rbp), %eax
	movzbl -147(%rbp), %ecx
	xorl %ecx, %eax
	movb %al, -115(%rbp)
	movzbl -114(%rbp), %eax
	movzbl -146(%rbp), %ecx
	xorl %ecx, %eax
	movb %al, -114(%rbp)
	movzbl -113(%rbp), %eax
	movzbl -145(%rbp), %ecx
	xorl %ecx, %eax
	movb %al, -113(%rbp)
	movzbl -112(%rbp), %eax
	movzbl -144(%rbp), %ecx
	xorl %ecx, %eax
	movb %al, -112(%rbp)
	movzbl -111(%rbp), %eax
	movzbl -143(%rbp), %ecx
	xorl %ecx, %eax
	movb %al, -111(%rbp)
	movzbl -110(%rbp), %eax
	movzbl -142(%rbp), %ecx
	xorl %ecx, %eax
	movb %al, -110(%rbp)
	movzbl -109(%rbp), %eax
	movzbl -141(%rbp), %ecx
	xorl %ecx, %eax
	movb %al, -109(%rbp)
	movzbl -108(%rbp), %eax
	movzbl -140(%rbp), %ecx
	xorl %ecx, %eax
	movb %al, -108(%rbp)
	movzbl -107(%rbp), %eax
	movzbl -139(%rbp), %ecx
	xorl %ecx, %eax
	movb %al, -107(%rbp)
	movzbl -106(%rbp), %eax
	movzbl -138(%rbp), %ecx
	xorl %ecx, %eax
	movb %al, -106(%rbp)
	movzbl -105(%rbp), %eax
	movzbl -137(%rbp), %ecx
	leaq 180(%rsi), %rdx
	xorl %ecx, %eax
	leaq -120(%rbp), %rcx
	movb %al, -105(%rbp)
	callq standard__crypto__encryption__AES__ghash_mul__2__byteE1_ptr1__byteE1_ptr1__ret_voidE1
	movq %rsi, %rcx
	leaq -72(%rbp), %rdx
	leaq -104(%rbp), %r8
	callq standard__crypto__encryption__AES__aes_encrypt_block__3__AES_CTXE1_ptr1__byteE1_ptr1__byteE1_ptr1__ret_voidE1
	movzbl -120(%rbp), %eax
	movzbl -104(%rbp), %ecx
	xorl %ecx, %eax
	movb %al, -136(%rbp)
	movzbl -119(%rbp), %eax
	movzbl -103(%rbp), %ecx
	xorl %ecx, %eax
	movb %al, -135(%rbp)
	movzbl -118(%rbp), %eax
	movzbl -102(%rbp), %ecx
	xorl %ecx, %eax
	movb %al, -134(%rbp)
	movzbl -117(%rbp), %eax
	movzbl -101(%rbp), %ecx
	xorl %ecx, %eax
	movb %al, -133(%rbp)
	movzbl -116(%rbp), %eax
	movzbl -100(%rbp), %ecx
	xorl %ecx, %eax
	movb %al, -132(%rbp)
	movzbl -115(%rbp), %eax
	movzbl -99(%rbp), %ecx
	xorl %ecx, %eax
	movb %al, -131(%rbp)
	movzbl -114(%rbp), %eax
	movzbl -98(%rbp), %ecx
	xorl %ecx, %eax
	movb %al, -130(%rbp)
	movzbl -113(%rbp), %eax
	movzbl -97(%rbp), %ecx
	xorl %ecx, %eax
	movb %al, -129(%rbp)
	movzbl -112(%rbp), %eax
	movzbl -96(%rbp), %ecx
	xorl %ecx, %eax
	movb %al, -128(%rbp)
	movzbl -111(%rbp), %eax
	movzbl -95(%rbp), %ecx
	xorl %ecx, %eax
	movb %al, -127(%rbp)
	movzbl -110(%rbp), %eax
	movzbl -94(%rbp), %ecx
	xorl %ecx, %eax
	movb %al, -126(%rbp)
	movzbl -109(%rbp), %eax
	movzbl -93(%rbp), %ecx
	xorl %ecx, %eax
	movb %al, -125(%rbp)
	movzbl -108(%rbp), %eax
	movzbl -92(%rbp), %ecx
	xorl %ecx, %eax
	movb %al, -124(%rbp)
	movzbl -107(%rbp), %eax
	movzbl -91(%rbp), %ecx
	xorl %ecx, %eax
	movb %al, -123(%rbp)
	movzbl -106(%rbp), %eax
	movzbl -90(%rbp), %ecx
	xorl %ecx, %eax
	movb %al, -122(%rbp)
	movzbl -105(%rbp), %eax
	movzbl -89(%rbp), %ecx
	xorl %ecx, %eax
	movb %al, -121(%rbp)
	movzbl -136(%rbp), %eax
	movzbl (%r15), %ecx
	xorl %ecx, %eax
	movzbl -135(%rbp), %ecx
	movzbl 1(%r15), %edx
	movzbl %al, %eax
	xorl %edx, %ecx
	movzbl %cl, %ecx
	orl %ecx, %eax
	movzbl -134(%rbp), %ecx
	movzbl 2(%r15), %edx
	xorl %edx, %ecx
	movzbl %cl, %ecx
	orl %ecx, %eax
	movzbl -133(%rbp), %ecx
	movzbl 3(%r15), %edx
	xorl %edx, %ecx
	movzbl %cl, %ecx
	orl %ecx, %eax
	movzbl -132(%rbp), %ecx
	movzbl 4(%r15), %edx
	xorl %edx, %ecx
	movzbl %cl, %ecx
	orl %ecx, %eax
	movzbl -131(%rbp), %ecx
	movzbl 5(%r15), %edx
	xorl %edx, %ecx
	movzbl %cl, %ecx
	orl %ecx, %eax
	movzbl -130(%rbp), %ecx
	movzbl 6(%r15), %edx
	xorl %edx, %ecx
	movzbl %cl, %ecx
	orl %ecx, %eax
	movzbl -129(%rbp), %ecx
	movzbl 7(%r15), %edx
	xorl %edx, %ecx
	movzbl %cl, %ecx
	orl %ecx, %eax
	movzbl -128(%rbp), %ecx
	movzbl 8(%r15), %edx
	xorl %edx, %ecx
	movzbl %cl, %ecx
	orl %ecx, %eax
	movzbl -127(%rbp), %ecx
	movzbl 9(%r15), %edx
	xorl %edx, %ecx
	movzbl %cl, %ecx
	orl %ecx, %eax
	movzbl -126(%rbp), %ecx
	movzbl 10(%r15), %edx
	xorl %edx, %ecx
	movzbl %cl, %ecx
	orl %ecx, %eax
	movzbl -125(%rbp), %ecx
	movzbl 11(%r15), %edx
	xorl %edx, %ecx
	movzbl %cl, %ecx
	orl %ecx, %eax
	movzbl -124(%rbp), %ecx
	movzbl 12(%r15), %edx
	xorl %edx, %ecx
	movzbl %cl, %ecx
	orl %ecx, %eax
	movzbl -123(%rbp), %ecx
	movzbl 13(%r15), %edx
	xorl %edx, %ecx
	movzbl %cl, %ecx
	orl %ecx, %eax
	movzbl -122(%rbp), %ecx
	movzbl 14(%r15), %edx
	xorl %edx, %ecx
	movzbl %cl, %ecx
	orl %ecx, %eax
	movzbl -121(%rbp), %ecx
	movzbl 15(%r15), %edx
	xorl %edx, %ecx
	movzbl %cl, %ecx
	orl %ecx, %eax
	movq %rax, -184(%rbp)
	movl %r13d, %eax
	sarl $31, %eax
	shrl $28, %eax
	addl %r13d, %eax
	movl %eax, %edi
	sarl $4, %edi
	movl %edi, %eax
	shll $4, %eax
	subl %eax, %r13d
	xorl %ebx, %ebx
.LB15349:
	cmpl %edi, %ebx
	jge .LB15352
.LB15350:
	movl %ebx, %r15d
	shll $4, %r15d
	movq %rsi, %rcx
	leaq -88(%rbp), %rdx
	leaq -104(%rbp), %r8
	callq standard__crypto__encryption__AES__aes_encrypt_block__3__AES_CTXE1_ptr1__byteE1_ptr1__byteE1_ptr1__ret_voidE1
	leaq -88(%rbp), %rcx
	callq standard__crypto__encryption__AES__gcm_inc32__1__byteE1_ptr1__ret_voidE1
	movslq %r15d, %rax
	movzbl (%r12,%rax,1), %ecx
	movzbl -104(%rbp), %edx
	xorl %edx, %ecx
	movb %cl, (%r14,%rax,1)
	leal 1(%r15), %eax
	movslq %eax, %rax
	movzbl (%r12,%rax,1), %ecx
	movzbl -103(%rbp), %edx
	xorl %edx, %ecx
	movb %cl, (%r14,%rax,1)
	leal 2(%r15), %eax
	movslq %eax, %rax
	movzbl (%r12,%rax,1), %ecx
	movzbl -102(%rbp), %edx
	xorl %edx, %ecx
	movb %cl, (%r14,%rax,1)
	leal 3(%r15), %eax
	movslq %eax, %rax
	movzbl (%r12,%rax,1), %ecx
	movzbl -101(%rbp), %edx
	xorl %edx, %ecx
	movb %cl, (%r14,%rax,1)
	leal 4(%r15), %eax
	movslq %eax, %rax
	movzbl (%r12,%rax,1), %ecx
	movzbl -100(%rbp), %edx
	xorl %edx, %ecx
	movb %cl, (%r14,%rax,1)
	leal 5(%r15), %eax
	movslq %eax, %rax
	movzbl (%r12,%rax,1), %ecx
	movzbl -99(%rbp), %edx
	xorl %edx, %ecx
	movb %cl, (%r14,%rax,1)
	leal 6(%r15), %eax
	movslq %eax, %rax
	movzbl (%r12,%rax,1), %ecx
	movzbl -98(%rbp), %edx
	xorl %edx, %ecx
	movb %cl, (%r14,%rax,1)
	leal 7(%r15), %eax
	movslq %eax, %rax
	movzbl (%r12,%rax,1), %ecx
	movzbl -97(%rbp), %edx
	xorl %edx, %ecx
	movb %cl, (%r14,%rax,1)
	leal 8(%r15), %eax
	movslq %eax, %rax
	movzbl (%r12,%rax,1), %ecx
	movzbl -96(%rbp), %edx
	xorl %edx, %ecx
	movb %cl, (%r14,%rax,1)
	leal 9(%r15), %eax
	movslq %eax, %rax
	movzbl (%r12,%rax,1), %ecx
	movzbl -95(%rbp), %edx
	xorl %edx, %ecx
	movb %cl, (%r14,%rax,1)
	leal 10(%r15), %eax
	movslq %eax, %rax
	movzbl (%r12,%rax,1), %ecx
	movzbl -94(%rbp), %edx
	xorl %edx, %ecx
	movb %cl, (%r14,%rax,1)
	leal 11(%r15), %eax
	movslq %eax, %rax
	movzbl (%r12,%rax,1), %ecx
	movzbl -93(%rbp), %edx
	xorl %edx, %ecx
	movb %cl, (%r14,%rax,1)
	leal 12(%r15), %eax
	movslq %eax, %rax
	movzbl (%r12,%rax,1), %ecx
	movzbl -92(%rbp), %edx
	xorl %edx, %ecx
	movb %cl, (%r14,%rax,1)
	leal 13(%r15), %eax
	movslq %eax, %rax
	movzbl (%r12,%rax,1), %ecx
	movzbl -91(%rbp), %edx
	xorl %edx, %ecx
	movb %cl, (%r14,%rax,1)
	leal 14(%r15), %eax
	movslq %eax, %rax
	movzbl (%r12,%rax,1), %ecx
	movzbl -90(%rbp), %edx
	xorl %edx, %ecx
	addl $15, %r15d
	movb %cl, (%r14,%rax,1)
	movslq %r15d, %rax
	movzbl (%r12,%rax,1), %ecx
	movzbl -89(%rbp), %edx
	xorl %edx, %ecx
	incl %ebx
	movb %cl, (%r14,%rax,1)
	cmpl %edi, %ebx
	jl .LB15350
	jmp .LB15352
.LB15176:
	leaq 180(%rsi), %rcx
	leaq -120(%rbp), %r9
	movq %rdi, %rdx
	movq %rbx, %r8
	callq standard__crypto__encryption__AES__ghash_update__4__byteE1_ptr1__byteE1_ptr1__intE1__byteE1_ptr1__ret_voidE1
	testl %r13d, %r13d
	jle .LB15189
.LB15187:
	leaq 180(%rsi), %rcx
	leaq -120(%rbp), %r9
	movq %r12, %rdx
	movq %r13, %r8
	callq standard__crypto__encryption__AES__ghash_update__4__byteE1_ptr1__byteE1_ptr1__intE1__byteE1_ptr1__ret_voidE1
	jmp .LB15189
.LB15352:
	testl %r13d, %r13d
	jg .LB15390
.LB15392:
	movq -184(%rbp), %rax
	testl %eax, %eax
	je .LB15425
.LB15426:
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
.LB15390:
	shll $4, %edi
	movq %rsi, %rcx
	leaq -88(%rbp), %rdx
	leaq -104(%rbp), %r8
	callq standard__crypto__encryption__AES__aes_encrypt_block__3__AES_CTXE1_ptr1__byteE1_ptr1__byteE1_ptr1__ret_voidE1
	movl %r13d, %eax
	shrl $2, %eax
	xorl %ecx, %ecx
.LB32043:
	testl %eax, %eax
	je .LB32045
.LB32044:
	leal (%rdi,%rcx), %edx
	movslq %ecx, %r8
	movslq %edx, %rsi
	movslq %edx, %rdx
	movzbl (%r12,%rsi,1), %esi
	movzbl -104(%rbp,%r8,1), %r8d
	xorl %r8d, %esi
	movb %sil, (%r14,%rdx,1)
	leal 1(%rcx), %edx
	leal (%rdi,%rdx), %esi
	movslq %edx, %rdx
	movslq %esi, %r8
	movzbl (%r12,%r8,1), %r8d
	movzbl -104(%rbp,%rdx,1), %edx
	xorl %edx, %r8d
	movslq %esi, %rdx
	movb %r8b, (%r14,%rdx,1)
	leal 2(%rcx), %edx
	leal (%rdi,%rdx), %esi
	movslq %edx, %rdx
	movslq %esi, %r8
	movzbl (%r12,%r8,1), %r8d
	movzbl -104(%rbp,%rdx,1), %edx
	xorl %edx, %r8d
	movslq %esi, %rdx
	movb %r8b, (%r14,%rdx,1)
	leal 3(%rcx), %edx
	leal (%rdi,%rdx), %esi
	movslq %edx, %rdx
	movslq %esi, %r8
	movzbl (%r12,%r8,1), %r8d
	movzbl -104(%rbp,%rdx,1), %edx
	xorl %edx, %r8d
	movslq %esi, %rdx
	addl $4, %ecx
	decl %eax
	movb %r8b, (%r14,%rdx,1)
	testl %eax, %eax
	jne .LB32044
.LB32045:
.LB15399:
	cmpl %r13d, %ecx
	jge .LB15392
.LB15400:
	leal (%rdi,%rcx), %eax
	movslq %ecx, %rsi
	movslq %eax, %rdx
	movslq %eax, %rax
	movzbl (%r12,%rdx,1), %edx
	movzbl -104(%rbp,%rsi,1), %esi
	xorl %esi, %edx
	incl %ecx
	movb %dl, (%r14,%rax,1)
	cmpl %r13d, %ecx
	jl .LB15400
	jmp .LB15392
.LB15425:
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
	.text
	.globl standard__crypto__ECDH__X25519__fe_from_bytes__2__BigIntE1_ptr1__byteE1_ptr1__ret_voidE1
	.def standard__crypto__ECDH__X25519__fe_from_bytes__2__BigIntE1_ptr1__byteE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__ECDH__X25519__fe_from_bytes__2__BigIntE1_ptr1__byteE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
.LB15429:
	movq %rcx, %rsi
	movq %rdx, %rax
	vpxor %xmm15, %xmm15, %xmm15
	vmovdqu %ymm15, (%rsi)
	vmovdqu %ymm15, 4(%rsi)
	vzeroupper
	movq %rax, %rcx
	movl (%rcx), %ecx
	movl %ecx, (%rsi)
	leaq 4(%rax), %rcx
	movl (%rcx), %ecx
	movl %ecx, 4(%rsi)
	leaq 8(%rax), %rcx
	movl (%rcx), %ecx
	movl %ecx, 8(%rsi)
	leaq 12(%rax), %rcx
	movl (%rcx), %ecx
	movl %ecx, 12(%rsi)
	leaq 16(%rax), %rcx
	movl (%rcx), %ecx
	movl %ecx, 16(%rsi)
	leaq 20(%rax), %rcx
	movl (%rcx), %ecx
	movl %ecx, 20(%rsi)
	leaq 24(%rax), %rcx
	leaq 28(%rax), %rax
	movl (%rcx), %ecx
	movl %ecx, 24(%rsi)
	movl (%rax), %eax
	movl %eax, 28(%rsi)
	movl $8, 512(%rsi)
	andb $127, 516(%rsi)
	movq %rsi, %rcx
	callq math__bigint__bigint_normalize__1__BigIntE1_ptr1__ret_voidE1
	cmpl $8, 512(%rsi)
	je .LB15478
.LB15480:
	movq %rsi, %rcx
	callq math__bigint__bigint_normalize__1__BigIntE1_ptr1__ret_voidE1
	movq -8(%rbp), %rsi
	leave
	ret
.LB15478:
	movl 28(%rsi), %eax
	andl $2147483647, %eax
	movl %eax, 28(%rsi)
	jmp .LB15480
	.text
	.globl standard__crypto__ECDH__X25519__fe_to_bytes__2__byteE1_ptr1__BigIntE1_ptr1__ret_voidE1
	.def standard__crypto__ECDH__X25519__fe_to_bytes__2__byteE1_ptr1__BigIntE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__ECDH__X25519__fe_to_bytes__2__byteE1_ptr1__BigIntE1_ptr1__ret_voidE1:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
	movq %rdi, -8(%rsp)
.LB15489:
	movq %rdx, %rax
	xorl %edx, %edx
.LB15499:
	cmpl $8, %edx
	jae .LB15502
.LB15500:
	movl %edx, %esi
	shll $2, %esi
	cmpl 512(%rax), %edx
	jb .LB15513
.LB15514:
	xorl %edi, %edi
.LB15515:
	movl %edi, %r8d
	andl $255, %r8d
	movslq %esi, %r9
	movb %r8b, (%rcx,%r9,1)
	movl %edi, %r8d
	shrl $8, %r8d
	andl $255, %r8d
	leal 1(%rsi), %r9d
	movslq %r9d, %r9
	movb %r8b, (%rcx,%r9,1)
	movl %edi, %r8d
	shrl $16, %r8d
	andl $255, %r8d
	leal 2(%rsi), %r9d
	shrl $24, %edi
	andl $255, %edi
	addl $3, %esi
	movslq %r9d, %r9
	movslq %esi, %rsi
	movb %r8b, (%rcx,%r9,1)
	incl %edx
	movb %dil, (%rcx,%rsi,1)
	cmpl $8, %edx
	jb .LB15500
.LB15502:
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB15513:
	movslq %edx, %rdi
	movl (%rax,%rdi,4), %edi
	jmp .LB15515
	.text
	.globl standard__crypto__ECDH__X25519__fe_set_p__1__BigIntE1_ptr1__ret_voidE1
	.def standard__crypto__ECDH__X25519__fe_set_p__1__BigIntE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__ECDH__X25519__fe_set_p__1__BigIntE1_ptr1__ret_voidE1:
	subq $48, %rsp
	movq %rsi, 32(%rsp)
	movq %rdi, 24(%rsp)
.LB15553:
	movq %rcx, %rax
	vmovdqu .LC32045(%rip), %ymm15
	vmovdqu %ymm15, -8(%rsp)
	vzeroupper
	movq %rax, %rdi
	leaq -8(%rsp), %rcx
	movq %rcx, %rsi
	movl $32, %ecx
	rep movsb
	movl $8, 512(%rax)
	andb $127, 516(%rax)
	movq 32(%rsp), %rsi
	movq 24(%rsp), %rdi
	addq $48, %rsp
	ret
	.text
	.globl standard__crypto__ECDH__X25519__fe_add__3__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	.def standard__crypto__ECDH__X25519__fe_add__3__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__ECDH__X25519__fe_add__3__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $1120, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
.LB15567:
	leaq .LZERO(%rip), %rsi
	leaq -560(%rbp), %rdi
	movq %rcx, %rbx
	movq %rdx, %r12
	movq %r8, %r13
	movl $517, %ecx
	rep movsb
	leaq .LZERO(%rip), %rsi
	leaq -1080(%rbp), %rdi
	movl $517, %ecx
	rep movsb
	leaq -560(%rbp), %rcx
	callq standard__crypto__ECDH__X25519__fe_set_p__1__BigIntE1_ptr1__ret_voidE1
	leaq -1080(%rbp), %rcx
	movq %r12, %rdx
	movq %r13, %r8
	callq math__bigint__bigint_add__3__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	leaq -1080(%rbp), %rdx
	leaq -560(%rbp), %r8
	movq %rbx, %rcx
	callq math__bigint__bigint_mod__3__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
	.text
	.globl standard__crypto__ECDH__X25519__fe_sub__3__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	.def standard__crypto__ECDH__X25519__fe_sub__3__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__ECDH__X25519__fe_sub__3__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $1120, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
.LB15579:
	leaq .LZERO(%rip), %rsi
	leaq -560(%rbp), %rdi
	movq %rcx, %rbx
	movq %rdx, %r12
	movq %r8, %r13
	movl $517, %ecx
	rep movsb
	leaq .LZERO(%rip), %rsi
	leaq -1080(%rbp), %rdi
	movl $517, %ecx
	rep movsb
	leaq -560(%rbp), %rcx
	callq standard__crypto__ECDH__X25519__fe_set_p__1__BigIntE1_ptr1__ret_voidE1
	leaq -1080(%rbp), %rcx
	movq %r12, %rdx
	movq %r13, %r8
	callq math__bigint__bigint_sub__3__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	movzbl -564(%rbp), %eax
	shrq $7, %rax
	testb %al, %al
	jne .LB15593
.LB15594:
	leaq -1080(%rbp), %rdx
	leaq -560(%rbp), %r8
	movq %rbx, %rcx
	callq math__bigint__bigint_mod__3__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB15593:
	leaq -1080(%rbp), %rdx
	leaq -560(%rbp), %r8
	movq %rbx, %rcx
	callq math__bigint__bigint_add__3__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	movzbl 516(%rbx), %eax
	shrq $7, %rax
	testb %al, %al
	jne .LB15602
.LB15604:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB15602:
	leaq -1080(%rbp), %rcx
	leaq -560(%rbp), %r8
	movq %rbx, %rdx
	callq math__bigint__bigint_add__3__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	leaq -1080(%rbp), %rdx
	movq %rbx, %rcx
	callq math__bigint__bigint_copy__2__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	jmp .LB15604
	.text
	.globl standard__crypto__ECDH__X25519__fe_mul__3__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	.def standard__crypto__ECDH__X25519__fe_mul__3__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__ECDH__X25519__fe_mul__3__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $1120, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
.LB15611:
	leaq .LZERO(%rip), %rsi
	leaq -560(%rbp), %rdi
	movq %rcx, %rbx
	movq %rdx, %r12
	movq %r8, %r13
	movl $517, %ecx
	rep movsb
	leaq .LZERO(%rip), %rsi
	leaq -1080(%rbp), %rdi
	movl $517, %ecx
	rep movsb
	leaq -560(%rbp), %rcx
	callq standard__crypto__ECDH__X25519__fe_set_p__1__BigIntE1_ptr1__ret_voidE1
	leaq -1080(%rbp), %rcx
	movq %r12, %rdx
	movq %r13, %r8
	callq math__bigint__bigint_mul__3__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	leaq -1080(%rbp), %rdx
	leaq -560(%rbp), %r8
	movq %rbx, %rcx
	callq math__bigint__bigint_mod__3__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
	.text
	.globl standard__crypto__ECDH__X25519__fe_sq__2__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	.def standard__crypto__ECDH__X25519__fe_sq__2__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__ECDH__X25519__fe_sq__2__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB15623:
	movq %rdx, %r8
	movq %r8, %rdx
	callq standard__crypto__ECDH__X25519__fe_mul__3__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	leave
	ret
	.text
	.globl standard__crypto__ECDH__X25519__fe_cswap__3__BigIntE1_ptr1__BigIntE1_ptr1__dataE1_ubits64__ret_voidE1
	.def standard__crypto__ECDH__X25519__fe_cswap__3__BigIntE1_ptr1__BigIntE1_ptr1__dataE1_ubits64__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__ECDH__X25519__fe_cswap__3__BigIntE1_ptr1__BigIntE1_ptr1__dataE1_ubits64__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $592, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
.LB15632:
	leaq .LZERO(%rip), %rsi
	leaq -552(%rbp), %rdi
	movq %rcx, %rbx
	movq %rdx, %r12
	movl $517, %ecx
	rep movsb
	testq %r8, %r8
	jne .LB15640
.LB15641:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB15640:
	leaq -552(%rbp), %rcx
	movq %rbx, %rdx
	callq math__bigint__bigint_copy__2__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	movq %rbx, %rcx
	movq %r12, %rdx
	callq math__bigint__bigint_copy__2__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	leaq -552(%rbp), %rdx
	movq %r12, %rcx
	callq math__bigint__bigint_copy__2__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
	.text
	.globl standard__crypto__ECDH__X25519__fe_invert__2__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	.def standard__crypto__ECDH__X25519__fe_invert__2__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__ECDH__X25519__fe_invert__2__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $3728, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
	movq %r14, -48(%rbp)
.LB15651:
	movq %rcx, %rbx
	movq %rdx, %r12
	leaq .LZERO(%rip), %rsi
	leaq -568(%rbp), %rdi
	movl $517, %ecx
	rep movsb
	leaq .LZERO(%rip), %rsi
	leaq -1088(%rbp), %rdi
	movl $517, %ecx
	rep movsb
	leaq .LZERO(%rip), %rsi
	leaq -1608(%rbp), %rdi
	movl $517, %ecx
	rep movsb
	leaq .LZERO(%rip), %rsi
	leaq -2128(%rbp), %rdi
	movl $517, %ecx
	rep movsb
	leaq .LZERO(%rip), %rsi
	leaq -2648(%rbp), %rdi
	movl $517, %ecx
	rep movsb
	leaq .LZERO(%rip), %rsi
	leaq -3168(%rbp), %rdi
	movl $517, %ecx
	rep movsb
	leaq .LZERO(%rip), %rsi
	leaq -3688(%rbp), %rdi
	movl $517, %ecx
	rep movsb
	leaq -568(%rbp), %rcx
	callq standard__crypto__ECDH__X25519__fe_set_p__1__BigIntE1_ptr1__ret_voidE1
	leaq -2648(%rbp), %rcx
	movl $2, %edx
	callq math__bigint__bigint_from_uint__2__BigIntE1_ptr1__uintE1__ret_voidE1
	leaq -1088(%rbp), %rcx
	leaq -568(%rbp), %rdx
	leaq -2648(%rbp), %r8
	callq math__bigint__bigint_sub__3__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	leaq -2128(%rbp), %rcx
	callq math__bigint__bigint_one__1__BigIntE1_ptr1__ret_voidE1
	leaq -1608(%rbp), %rcx
	movq %r12, %rdx
	callq math__bigint__bigint_copy__2__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	leaq -1088(%rbp), %rsi
	movl -576(%rbp), %edi
	xorl %r12d, %r12d
.LB15675:
	cmpl %edi, %r12d
	jae .LB15678
.LB15676:
	movslq %r12d, %rax
	movl (%rsi,%rax,4), %r13d
	movq %r13, %r14
	xorl %r13d, %r13d
.LB15686:
	cmpl $32, %r13d
	jae .LB15689
.LB15687:
	movl %r14d, %eax
	andl $1, %eax
	jne .LB15695
.LB15697:
	shrl $1, %r14d
	leaq -2648(%rbp), %rcx
	leaq -1608(%rbp), %rdx
	callq standard__crypto__ECDH__X25519__fe_sq__2__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	leaq -1608(%rbp), %rcx
	leaq -2648(%rbp), %rdx
	callq math__bigint__bigint_copy__2__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	incl %r13d
	cmpl $32, %r13d
	jb .LB15687
	jmp .LB15689
.LB15678:
	leaq -2128(%rbp), %rdx
	movq %rbx, %rcx
	callq math__bigint__bigint_copy__2__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	leave
	ret
.LB15689:
	incl %r12d
	cmpl %edi, %r12d
	jb .LB15676
	jmp .LB15678
.LB15695:
	leaq -2648(%rbp), %rcx
	leaq -2128(%rbp), %rdx
	leaq -1608(%rbp), %r8
	callq standard__crypto__ECDH__X25519__fe_mul__3__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	leaq -2128(%rbp), %rcx
	leaq -2648(%rbp), %rdx
	callq math__bigint__bigint_copy__2__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	jmp .LB15697
	.text
	.globl standard__crypto__ECDH__X25519__x25519__3__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__ret_voidE1
	.def standard__crypto__ECDH__X25519__x25519__3__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__ECDH__X25519__x25519__3__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	movl $8416, %eax
	callq __chkstk
	subq %rax, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
.LB15706:
	leaq .LZERO(%rip), %rsi
	leaq -552(%rbp), %rdi
	movq %rcx, %rbx
	movl $517, %ecx
	rep movsb
	leaq .LZERO(%rip), %rsi
	leaq -1072(%rbp), %rdi
	movl $517, %ecx
	rep movsb
	leaq .LZERO(%rip), %rsi
	leaq -1592(%rbp), %rdi
	movl $517, %ecx
	rep movsb
	leaq .LZERO(%rip), %rsi
	leaq -2112(%rbp), %rdi
	movl $517, %ecx
	rep movsb
	leaq .LZERO(%rip), %rsi
	leaq -2632(%rbp), %rdi
	movl $517, %ecx
	rep movsb
	leaq .LZERO(%rip), %rsi
	leaq -3152(%rbp), %rdi
	movl $517, %ecx
	rep movsb
	leaq .LZERO(%rip), %rsi
	leaq -3672(%rbp), %rdi
	movl $517, %ecx
	rep movsb
	leaq .LZERO(%rip), %rsi
	leaq -4192(%rbp), %rdi
	movl $517, %ecx
	rep movsb
	leaq .LZERO(%rip), %rsi
	leaq -4712(%rbp), %rdi
	movl $517, %ecx
	rep movsb
	leaq .LZERO(%rip), %rsi
	leaq -5232(%rbp), %rdi
	movl $517, %ecx
	rep movsb
	leaq .LZERO(%rip), %rsi
	leaq -5752(%rbp), %rdi
	movl $517, %ecx
	rep movsb
	leaq .LZERO(%rip), %rsi
	leaq -6272(%rbp), %rdi
	movl $517, %ecx
	rep movsb
	leaq .LZERO(%rip), %rsi
	leaq -6792(%rbp), %rdi
	movl $517, %ecx
	rep movsb
	leaq .LZERO(%rip), %rsi
	leaq -7312(%rbp), %rdi
	movl $517, %ecx
	rep movsb
	leaq .LZERO(%rip), %rsi
	leaq -7832(%rbp), %rdi
	movl $517, %ecx
	rep movsb
	leaq .LZERO(%rip), %rsi
	leaq -8352(%rbp), %rdi
	movl $517, %ecx
	rep movsb
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -8384(%rbp)
	vzeroupper
	movl $8, %eax
	xorl %ecx, %ecx
.LB32047:
	testl %eax, %eax
	je .LB32049
.LB32048:
	movslq %ecx, %rsi
	movzbl (%rdx,%rsi,1), %edi
	movb %dil, -8384(%rbp,%rsi,1)
	leal 1(%rcx), %esi
	movslq %esi, %rsi
	movzbl (%rdx,%rsi,1), %edi
	movb %dil, -8384(%rbp,%rsi,1)
	leal 2(%rcx), %esi
	movslq %esi, %rsi
	movzbl (%rdx,%rsi,1), %edi
	movb %dil, -8384(%rbp,%rsi,1)
	leal 3(%rcx), %esi
	movslq %esi, %rsi
	movzbl (%rdx,%rsi,1), %edi
	movb %dil, -8384(%rbp,%rsi,1)
	addl $4, %ecx
	decl %eax
	jne .LB32048
.LB32049:
.LB15731:
	cmpl $32, %ecx
	jae .LB15733
.LB15732:
	movslq %ecx, %rax
	movzbl (%rdx,%rax,1), %esi
	movb %sil, -8384(%rbp,%rax,1)
	incl %ecx
	cmpl $32, %ecx
	jb .LB15732
.LB15733:
	movzbl -8384(%rbp), %eax
	leaq -552(%rbp), %rcx
	movq %r8, %rdx
	andl $248, %eax
	movb %al, -8384(%rbp)
	movzbl -8353(%rbp), %eax
	andl $127, %eax
	movb %al, -8353(%rbp)
	movzbl -8353(%rbp), %eax
	orl $64, %eax
	movb %al, -8353(%rbp)
	callq standard__crypto__ECDH__X25519__fe_from_bytes__2__BigIntE1_ptr1__byteE1_ptr1__ret_voidE1
	leaq -1072(%rbp), %rcx
	callq math__bigint__bigint_one__1__BigIntE1_ptr1__ret_voidE1
	leaq -1592(%rbp), %rcx
	callq math__bigint__bigint_zero__1__BigIntE1_ptr1__ret_voidE1
	leaq -2112(%rbp), %rcx
	leaq -552(%rbp), %rdx
	callq math__bigint__bigint_copy__2__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	leaq -2632(%rbp), %rcx
	callq math__bigint__bigint_one__1__BigIntE1_ptr1__ret_voidE1
	leaq -8352(%rbp), %rcx
	movl $121665, %edx
	callq math__bigint__bigint_from_uint__2__BigIntE1_ptr1__uintE1__ret_voidE1
	movl $254, %esi
	xorl %edi, %edi
.LB15760:
	cmpl $254, %esi
	jbe .LB15761
.LB32050:
.LB15762:
	leaq -1072(%rbp), %rcx
	leaq -2112(%rbp), %rdx
	movq %rdi, %r8
	callq standard__crypto__ECDH__X25519__fe_cswap__3__BigIntE1_ptr1__BigIntE1_ptr1__dataE1_ubits64__ret_voidE1
	leaq -1592(%rbp), %rcx
	leaq -2632(%rbp), %rdx
	movq %rdi, %r8
	callq standard__crypto__ECDH__X25519__fe_cswap__3__BigIntE1_ptr1__BigIntE1_ptr1__dataE1_ubits64__ret_voidE1
	leaq -1592(%rbp), %rcx
	leaq -1592(%rbp), %rdx
	callq standard__crypto__ECDH__X25519__fe_invert__2__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	leaq -1072(%rbp), %rcx
	leaq -1072(%rbp), %rdx
	leaq -1592(%rbp), %r8
	callq standard__crypto__ECDH__X25519__fe_mul__3__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	leaq -1072(%rbp), %rdx
	movq %rbx, %rcx
	callq standard__crypto__ECDH__X25519__fe_to_bytes__2__byteE1_ptr1__BigIntE1_ptr1__ret_voidE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB15761:
	movl %esi, %eax
	shrl $3, %eax
	movslq %eax, %rax
	movzbl -8384(%rbp,%rax,1), %eax
	movl %esi, %ecx
	andl $7, %ecx
	movzbl %al, %eax
	shrx %ecx, %eax, %eax
	leaq -1072(%rbp), %rcx
	leaq -2112(%rbp), %rdx
	movzbl %al, %eax
	movl %eax, %r12d
	andl $1, %r12d
	xorq %r12, %rdi
	movq %rdi, %r8
	callq standard__crypto__ECDH__X25519__fe_cswap__3__BigIntE1_ptr1__BigIntE1_ptr1__dataE1_ubits64__ret_voidE1
	leaq -1592(%rbp), %rcx
	leaq -2632(%rbp), %rdx
	movq %rdi, %r8
	callq standard__crypto__ECDH__X25519__fe_cswap__3__BigIntE1_ptr1__BigIntE1_ptr1__dataE1_ubits64__ret_voidE1
	leaq -3152(%rbp), %rcx
	leaq -1072(%rbp), %rdx
	leaq -1592(%rbp), %r8
	callq standard__crypto__ECDH__X25519__fe_add__3__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	leaq -3672(%rbp), %rcx
	leaq -3152(%rbp), %rdx
	callq standard__crypto__ECDH__X25519__fe_sq__2__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	leaq -4192(%rbp), %rcx
	leaq -1072(%rbp), %rdx
	leaq -1592(%rbp), %r8
	callq standard__crypto__ECDH__X25519__fe_sub__3__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	leaq -4712(%rbp), %rcx
	leaq -4192(%rbp), %rdx
	callq standard__crypto__ECDH__X25519__fe_sq__2__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	leaq -5232(%rbp), %rcx
	leaq -3672(%rbp), %rdx
	leaq -4712(%rbp), %r8
	callq standard__crypto__ECDH__X25519__fe_sub__3__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	leaq -5752(%rbp), %rcx
	leaq -2112(%rbp), %rdx
	leaq -2632(%rbp), %r8
	callq standard__crypto__ECDH__X25519__fe_add__3__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	leaq -6272(%rbp), %rcx
	leaq -2112(%rbp), %rdx
	leaq -2632(%rbp), %r8
	callq standard__crypto__ECDH__X25519__fe_sub__3__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	leaq -6792(%rbp), %rcx
	leaq -6272(%rbp), %rdx
	leaq -3152(%rbp), %r8
	callq standard__crypto__ECDH__X25519__fe_mul__3__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	leaq -7312(%rbp), %rcx
	leaq -5752(%rbp), %rdx
	leaq -4192(%rbp), %r8
	callq standard__crypto__ECDH__X25519__fe_mul__3__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	leaq -7832(%rbp), %rcx
	leaq -6792(%rbp), %rdx
	leaq -7312(%rbp), %r8
	callq standard__crypto__ECDH__X25519__fe_add__3__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	leaq -2112(%rbp), %rcx
	leaq -7832(%rbp), %rdx
	callq standard__crypto__ECDH__X25519__fe_sq__2__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	leaq -7832(%rbp), %rcx
	leaq -6792(%rbp), %rdx
	leaq -7312(%rbp), %r8
	callq standard__crypto__ECDH__X25519__fe_sub__3__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	leaq -2632(%rbp), %rcx
	leaq -7832(%rbp), %rdx
	callq standard__crypto__ECDH__X25519__fe_sq__2__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	leaq -2632(%rbp), %rcx
	leaq -552(%rbp), %rdx
	leaq -2632(%rbp), %r8
	callq standard__crypto__ECDH__X25519__fe_mul__3__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	leaq -1072(%rbp), %rcx
	leaq -3672(%rbp), %rdx
	leaq -4712(%rbp), %r8
	callq standard__crypto__ECDH__X25519__fe_mul__3__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	leaq -7832(%rbp), %rcx
	leaq -8352(%rbp), %rdx
	leaq -5232(%rbp), %r8
	callq standard__crypto__ECDH__X25519__fe_mul__3__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	leaq -7832(%rbp), %rcx
	leaq -3672(%rbp), %rdx
	leaq -7832(%rbp), %r8
	callq standard__crypto__ECDH__X25519__fe_add__3__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	leaq -1592(%rbp), %rcx
	leaq -5232(%rbp), %rdx
	leaq -7832(%rbp), %r8
	callq standard__crypto__ECDH__X25519__fe_mul__3__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	testl %esi, %esi
	je .LB15785
.LB15786:
	decl %esi
	movq %r12, %rdi
	cmpl $254, %esi
	jbe .LB15761
	jmp .LB32050
.LB15785:
	movq %r12, %rdi
	jmp .LB15762
	.text
	.globl standard__crypto__ECDH__X25519__x25519_pubkey__2__byteE1_ptr1__byteE1_ptr1__ret_voidE1
	.def standard__crypto__ECDH__X25519__x25519_pubkey__2__byteE1_ptr1__byteE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__ECDH__X25519__x25519_pubkey__2__byteE1_ptr1__byteE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $80, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB15792:
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -48(%rbp)
	vzeroupper
	movl $8, %eax
	xorl %esi, %esi
.LB32051:
	testl %eax, %eax
	je .LB32053
.LB32052:
	movslq %esi, %rdi
	movb $0, -48(%rbp,%rdi,1)
	leal 1(%rsi), %edi
	movslq %edi, %rdi
	movb $0, -48(%rbp,%rdi,1)
	leal 2(%rsi), %edi
	movslq %edi, %rdi
	movb $0, -48(%rbp,%rdi,1)
	leal 3(%rsi), %edi
	movslq %edi, %rdi
	movb $0, -48(%rbp,%rdi,1)
	addl $4, %esi
	decl %eax
	jne .LB32052
.LB32053:
.LB15797:
	cmpl $32, %esi
	jae .LB15799
.LB15798:
	movslq %esi, %rax
	movb $0, -48(%rbp,%rax,1)
	incl %esi
	cmpl $32, %esi
	jb .LB15798
.LB15799:
	movb $9, -48(%rbp)
	leaq -48(%rbp), %r8
	callq standard__crypto__ECDH__X25519__x25519__3__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__ret_voidE1
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__crypto__KDF__HKDF__hmac_sha256__5__byteE1_ptr1__intE1__byteE1_ptr1__intE1__byteE1_ptr1__ret_voidE1
	.def standard__crypto__KDF__HKDF__hmac_sha256__5__byteE1_ptr1__intE1__byteE1_ptr1__intE1__byteE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__KDF__HKDF__hmac_sha256__5__byteE1_ptr1__intE1__byteE1_ptr1__intE1__byteE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $608, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
.LB15812:
	movq 48(%rbp), %r13
	movq %rcx, %rsi
	movl %edx, %edi
	movq %r8, %rbx
	movl %r9d, %r12d
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -104(%rbp)
	vmovdqu .LZERO+32(%rip), %ymm15
	vmovdqu %ymm15, -72(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -168(%rbp)
	vmovdqu .LZERO+32(%rip), %ymm15
	vmovdqu %ymm15, -136(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -200(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -232(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -344(%rbp)
	vmovdqu .LZERO+32(%rip), %ymm15
	vmovdqu %ymm15, -312(%rbp)
	vmovdqu .LZERO+64(%rip), %ymm15
	vmovdqu %ymm15, -280(%rbp)
	movq .LZERO+96(%rip), %r10
	movq %r10, -248(%rbp)
	movl .LZERO+104(%rip), %r10d
	movl %r10d, -240(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -456(%rbp)
	vmovdqu .LZERO+32(%rip), %ymm15
	vmovdqu %ymm15, -424(%rbp)
	vmovdqu .LZERO+64(%rip), %ymm15
	vmovdqu %ymm15, -392(%rbp)
	movq .LZERO+96(%rip), %r10
	movq %r10, -360(%rbp)
	movl .LZERO+104(%rip), %r10d
	movl %r10d, -352(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -568(%rbp)
	vmovdqu .LZERO+32(%rip), %ymm15
	vmovdqu %ymm15, -536(%rbp)
	vmovdqu .LZERO+64(%rip), %ymm15
	vmovdqu %ymm15, -504(%rbp)
	movq .LZERO+96(%rip), %r10
	movq %r10, -472(%rbp)
	movl .LZERO+104(%rip), %r10d
	movl %r10d, -464(%rbp)
	vzeroupper
	cmpl $64, %edi
	jg .LB15831
.LB15832:
.LB15833:
	xorl %eax, %eax
.LB15841:
	cmpl $64, %eax
	jge .LB15844
.LB15842:
	cmpl %edi, %eax
	jl .LB15850
.LB15851:
	xorl %ecx, %ecx
.LB15852:
	movl %ecx, %edx
	xorl $54, %edx
	movslq %eax, %r8
	xorl $92, %ecx
	incl %eax
	movb %dl, -104(%rbp,%r8,1)
	movb %cl, -168(%rbp,%r8,1)
	cmpl $64, %eax
	jl .LB15842
	jmp .LB15844
.LB15831:
	leaq -568(%rbp), %rcx
	callq standard__crypto__hashing__SHA256__sha256_init__1__SHA256_CTXE1_ptr1__ret_voidE1
	movl %edi, %r8d
	leaq -568(%rbp), %rcx
	movq %rsi, %rdx
	callq standard__crypto__hashing__SHA256__sha256_update__3__SHA256_CTXE1_ptr1__byteE1_ptr1__dataE1_ubits64__ret_voidE1
	leaq -232(%rbp), %rdx
	leaq -568(%rbp), %rcx
	callq standard__crypto__hashing__SHA256__sha256_final__2__SHA256_CTXE1_ptr1__byteE1_ptr1__ret_voidE1
	leaq -232(%rbp), %rsi
	movl $32, %edi
	jmp .LB15833
.LB15844:
	leaq -344(%rbp), %rcx
	callq standard__crypto__hashing__SHA256__sha256_init__1__SHA256_CTXE1_ptr1__ret_voidE1
	leaq -104(%rbp), %rdx
	leaq -344(%rbp), %rcx
	movl $64, %r8d
	callq standard__crypto__hashing__SHA256__sha256_update__3__SHA256_CTXE1_ptr1__byteE1_ptr1__dataE1_ubits64__ret_voidE1
	movl %r12d, %r8d
	leaq -344(%rbp), %rcx
	movq %rbx, %rdx
	callq standard__crypto__hashing__SHA256__sha256_update__3__SHA256_CTXE1_ptr1__byteE1_ptr1__dataE1_ubits64__ret_voidE1
	leaq -200(%rbp), %rdx
	leaq -344(%rbp), %rcx
	callq standard__crypto__hashing__SHA256__sha256_final__2__SHA256_CTXE1_ptr1__byteE1_ptr1__ret_voidE1
	leaq -456(%rbp), %rcx
	callq standard__crypto__hashing__SHA256__sha256_init__1__SHA256_CTXE1_ptr1__ret_voidE1
	leaq -168(%rbp), %rdx
	leaq -456(%rbp), %rcx
	movl $64, %r8d
	callq standard__crypto__hashing__SHA256__sha256_update__3__SHA256_CTXE1_ptr1__byteE1_ptr1__dataE1_ubits64__ret_voidE1
	leaq -200(%rbp), %rdx
	leaq -456(%rbp), %rcx
	movl $32, %r8d
	callq standard__crypto__hashing__SHA256__sha256_update__3__SHA256_CTXE1_ptr1__byteE1_ptr1__dataE1_ubits64__ret_voidE1
	leaq -456(%rbp), %rcx
	movq %r13, %rdx
	callq standard__crypto__hashing__SHA256__sha256_final__2__SHA256_CTXE1_ptr1__byteE1_ptr1__ret_voidE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB15850:
	movslq %eax, %rcx
	movzbl (%rsi,%rcx,1), %ecx
	jmp .LB15852
	.text
	.globl standard__crypto__KDF__HKDF__hkdf_extract__5__byteE1_ptr1__intE1__byteE1_ptr1__intE1__byteE1_ptr1__ret_voidE1
	.def standard__crypto__KDF__HKDF__hkdf_extract__5__byteE1_ptr1__intE1__byteE1_ptr1__intE1__byteE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__KDF__HKDF__hkdf_extract__5__byteE1_ptr1__intE1__byteE1_ptr1__intE1__byteE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $96, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB15882:
	movq %rcx, %rax
	movq 48(%rbp), %rcx
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -48(%rbp)
	vzeroupper
	leaq -48(%rbp), %rdi
	xorl %esi, %esi
	movq %rcx, 32(%rsp)
	testq %rax, %rax
	sete %sil
	testb %sil, %sil
	cmovne %rdi, %rax
	movl $32, %edi
	testb %sil, %sil
	cmovne %edi, %edx
	movq %rax, %rcx
	callq standard__crypto__KDF__HKDF__hmac_sha256__5__byteE1_ptr1__intE1__byteE1_ptr1__intE1__byteE1_ptr1__ret_voidE1
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__crypto__KDF__HKDF__hkdf_expand__5__byteE1_ptr1__byteE1_ptr1__intE1__byteE1_ptr1__intE1__ret_intE1
	.def standard__crypto__KDF__HKDF__hkdf_expand__5__byteE1_ptr1__byteE1_ptr1__intE1__byteE1_ptr1__intE1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__KDF__HKDF__hkdf_expand__5__byteE1_ptr1__byteE1_ptr1__intE1__byteE1_ptr1__intE1__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $512, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
	movq %r14, -48(%rbp)
	movq %r15, -56(%rbp)
.LB15908:
	movl 48(%rbp), %r14d
	movq %rcx, %rsi
	movq %rdx, %rbx
	movl %r8d, %r12d
	movq %r9, %r13
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -88(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -120(%rbp)
	vzeroupper
	leaq -440(%rbp), %rax
	movq %rax, %rdi
	xorl %eax, %eax
	movl $320, %ecx
	rep stosb
	cmpl $8160, %r14d
	jg .LB15929
.LB15930:
	leal 31(%r14), %eax
	xorl %edi, %edi
	movl %eax, %ecx
	sarl $31, %ecx
	shrl $27, %ecx
	addl %ecx, %eax
	sarl $5, %eax
	testq %rbx, %rbx
	setne %dil
	movq %rax, -464(%rbp)
	movq $1, -448(%rbp)
	movq $0, -456(%rbp)
.LB15935:
	movq -448(%rbp), %rax
	movq -464(%rbp), %rcx
	cmpl %ecx, %eax
	jg .LB15938
.LB15936:
	xorl %eax, %eax
	movl $32, %ecx
	movq -448(%rbp), %rdx
	cmpl $1, %edx
	cmove %eax, %ecx
	movslq %ecx, %rax
	xorl %ecx, %ecx
	xorl %edx, %edx
.LB15948:
	cmpq %rax, %rdx
	jge .LB15951
.LB15949:
	movzbl -88(%rbp,%rdx,1), %r8d
	movslq %ecx, %r9
	movb %r8b, -440(%rbp,%r9,1)
	incl %ecx
	incq %rdx
	cmpq %rax, %rdx
	jl .LB15949
	jmp .LB15951
.LB15938:
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
.LB15951:
	testb %dil, %dil
	jne .LB15970
.LB15971:
.LB15972:
	movl -448(%rbp), %eax
	movslq %ecx, %rdx
	leaq -440(%rbp), %r8
	leal 1(%rcx), %r9d
	movq %rsi, %rcx
	movb %al, -440(%rbp,%rdx,1)
	leaq -120(%rbp), %rax
	movl $32, %edx
	movq %rax, 32(%rsp)
	callq standard__crypto__KDF__HKDF__hmac_sha256__5__byteE1_ptr1__intE1__byteE1_ptr1__intE1__byteE1_ptr1__ret_voidE1
	movq -456(%rbp), %rax
	negl %eax
	addl %r14d, %eax
	movl $32, %ecx
	cmpl $32, %eax
	cmovg %ecx, %eax
	xorl %ecx, %ecx
	testl %eax, %eax
	cmovg %eax, %ecx
	shrl $2, %ecx
	xorl %edx, %edx
.LB32054:
	testl %ecx, %ecx
	je .LB32056
.LB32055:
	movslq %edx, %r8
	movzbl -120(%rbp,%r8,1), %r8d
	movq -456(%rbp), %r9
	leal (%r9,%rdx), %r15d
	movslq %r15d, %r15
	movb %r8b, (%r13,%r15,1)
	leal 1(%rdx), %r8d
	movslq %r8d, %r15
	movzbl -120(%rbp,%r15,1), %r15d
	addl %r8d, %r9d
	movslq %r9d, %r8
	movb %r15b, (%r13,%r8,1)
	leal 2(%rdx), %r8d
	movslq %r8d, %r9
	movzbl -120(%rbp,%r9,1), %r9d
	movq -456(%rbp), %r15
	addl %r15d, %r8d
	movslq %r8d, %r8
	movb %r9b, (%r13,%r8,1)
	leal 3(%rdx), %r8d
	movslq %r8d, %r9
	movzbl -120(%rbp,%r9,1), %r9d
	addl %r8d, %r15d
	movslq %r15d, %r8
	movb %r9b, (%r13,%r8,1)
	addl $4, %edx
	decl %ecx
	jne .LB32055
	jmp .LB32056
.LB15970:
	movslq %r12d, %rax
	xorl %edx, %edx
.LB15973:
	cmpq %rax, %rdx
	jge .LB15976
.LB15974:
	movzbl (%rbx,%rdx,1), %r8d
	movslq %ecx, %r9
	movb %r8b, -440(%rbp,%r9,1)
	incl %ecx
	incq %rdx
	cmpq %rax, %rdx
	jl .LB15974
.LB15976:
	jmp .LB15972
.LB32056:
.LB16009:
	cmpl %eax, %edx
	jge .LB16012
.LB16010:
	movslq %edx, %rcx
	movzbl -120(%rbp,%rcx,1), %ecx
	movq -456(%rbp), %r8
	addl %edx, %r8d
	movslq %r8d, %r8
	movb %cl, (%r13,%r8,1)
	incl %edx
	cmpl %eax, %edx
	jl .LB16010
.LB16012:
	movq -456(%rbp), %rcx
	addl %eax, %ecx
	movl $8, %eax
	xorl %edx, %edx
.LB32057:
	testq %rax, %rax
	je .LB32059
.LB32058:
	movzbl -120(%rbp,%rdx,1), %r8d
	movb %r8b, -88(%rbp,%rdx,1)
	movzbl -119(%rbp,%rdx,1), %r8d
	movb %r8b, -87(%rbp,%rdx,1)
	movzbl -118(%rbp,%rdx,1), %r8d
	movb %r8b, -86(%rbp,%rdx,1)
	movzbl -117(%rbp,%rdx,1), %r8d
	movb %r8b, -85(%rbp,%rdx,1)
	addq $4, %rdx
	decq %rax
	jne .LB32058
.LB32059:
.LB16029:
	cmpq $32, %rdx
	jge .LB16032
.LB16030:
	movzbl -120(%rbp,%rdx,1), %eax
	movb %al, -88(%rbp,%rdx,1)
	incq %rdx
	cmpq $32, %rdx
	jl .LB16030
.LB16032:
	movq -448(%rbp), %rax
	incl %eax
	movq %rax, -448(%rbp)
	movq %rcx, -456(%rbp)
	jmp .LB15935
.LB15929:
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
	.globl standard__crypto__RSA__rsa_be_to_limbs__4__uintE1_ptr1__intE1__byteE1_ptr1__intE1__ret_voidE1
	.def standard__crypto__RSA__rsa_be_to_limbs__4__uintE1_ptr1__intE1__byteE1_ptr1__intE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__RSA__rsa_be_to_limbs__4__uintE1_ptr1__intE1__byteE1_ptr1__intE1__ret_voidE1:
	subq $48, %rsp
	movq %rbx, 32(%rsp)
	movq %rsi, 24(%rsp)
	movq %rdi, 16(%rsp)
	movq %r12, 8(%rsp)
	movq %r13, 0(%rsp)
.LB16044:
	movq %rcx, %rsi
	cmpl $16, %edx
	jge .LB32060
.LB32061:
	movslq %edx, %rax
	xorl %ecx, %ecx
	testq %rax, %rax
	cmovg %rax, %rcx
	shrq $2, %rcx
	xorl %edi, %edi
.LB32062:
	testq %rcx, %rcx
	je .LB32064
.LB32063:
	movl $0, (%rsi,%rdi,4)
	movl $0, 4(%rsi,%rdi,4)
	movl $0, 8(%rsi,%rdi,4)
	movl $0, 12(%rsi,%rdi,4)
	addq $4, %rdi
	decq %rcx
	jne .LB32063
.LB32064:
.LB16052:
	cmpq %rax, %rdi
	jge .LB16055
.LB16053:
	movl $0, (%rsi,%rdi,4)
	incq %rdi
	cmpq %rax, %rdi
	jl .LB16053
	jmp .LB16055
.LB32060:
	movslq %edx, %rax
	movq %rax, %rcx
	sarq $63, %rcx
	notq %rcx
	andq %rcx, %rax
	movq %rax, %rcx
	shlq $2, %rcx
	movq %rsi, %rdi
	xorl %eax, %eax
	rep stosb
.LB16055:
	leal -1(%r9), %eax
	xorl %ecx, %ecx
.LB16064:
	cmpl %r9d, %ecx
	jge .LB16067
.LB16065:
	movl %ecx, %edi
	sarl $31, %edi
	shrl $30, %edi
	addl %ecx, %edi
	sarl $2, %edi
	cmpl %edx, %edi
	jl .LB16079
.LB16081:
	incl %ecx
	cmpl %r9d, %ecx
	jl .LB16065
.LB16067:
	movq 32(%rsp), %rbx
	movq 24(%rsp), %rsi
	movq 16(%rsp), %rdi
	movq 8(%rsp), %r12
	movq 0(%rsp), %r13
	addq $48, %rsp
	ret
.LB16079:
	movl %ecx, %ebx
	sarl $31, %ebx
	movslq %edi, %rdi
	shrl $30, %ebx
	leaq (%rsi,%rdi,4), %rdi
	addl %ecx, %ebx
	andl $-4, %ebx
	negl %ebx
	addl %ecx, %ebx
	shll $3, %ebx
	movl %eax, %r13d
	subl %ecx, %r13d
	movslq %r13d, %r13
	movl (%rdi), %r12d
	movzbl (%r8,%r13,1), %r13d
	shlx %ebx, %r13d, %r13d
	orl %r13d, %r12d
	movl %r12d, (%rdi)
	jmp .LB16081
	.text
	.globl standard__crypto__RSA__rsa_limbs_to_be__4__byteE1_ptr1__intE1__uintE1_ptr1__intE1__ret_voidE1
	.def standard__crypto__RSA__rsa_limbs_to_be__4__byteE1_ptr1__intE1__uintE1_ptr1__intE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__RSA__rsa_limbs_to_be__4__byteE1_ptr1__intE1__uintE1_ptr1__intE1__ret_voidE1:
	subq $32, %rsp
	movq %rbx, 16(%rsp)
	movq %rsi, 8(%rsp)
	movq %rdi, 0(%rsp)
.LB16102:
	leal -1(%rdx), %eax
	xorl %esi, %esi
.LB16110:
	cmpl %edx, %esi
	jge .LB16113
.LB16111:
	movl %esi, %edi
	sarl $31, %edi
	shrl $30, %edi
	addl %esi, %edi
	sarl $2, %edi
	cmpl %r9d, %edi
	jl .LB16125
.LB16126:
	movl %eax, %edi
	subl %esi, %edi
	movslq %edi, %rdi
	movb $0, (%rcx,%rdi,1)
.LB16127:
	incl %esi
	cmpl %edx, %esi
	jl .LB16111
.LB16113:
	movq 16(%rsp), %rbx
	movq 8(%rsp), %rsi
	movq 0(%rsp), %rdi
	addq $32, %rsp
	ret
.LB16125:
	movl %esi, %ebx
	sarl $31, %ebx
	movslq %edi, %rdi
	shrl $30, %ebx
	movl (%r8,%rdi,4), %edi
	addl %esi, %ebx
	andl $-4, %ebx
	negl %ebx
	addl %esi, %ebx
	shll $3, %ebx
	shrx %ebx, %edi, %edi
	andl $255, %edi
	movl %eax, %ebx
	subl %esi, %ebx
	movslq %ebx, %rbx
	movb %dil, (%rcx,%rbx,1)
	jmp .LB16127
	.text
	.globl standard__crypto__RSA__rsa_byte_len__2__byteE1_ptr1__intE1__ret_intE1
	.def standard__crypto__RSA__rsa_byte_len__2__byteE1_ptr1__intE1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__RSA__rsa_byte_len__2__byteE1_ptr1__intE1__ret_intE1:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
	movq %rdi, -8(%rsp)
.LB16151:
	movl %edx, %r8d
	movslq %r8d, %rax
	leaq 0(%rax), %rsi
	movq %rcx, %rdi
	movq %rcx, %rdx
	xorl %eax, %eax
	cmpq $32, %rsi
	jl .LR32065d
	movl $0, %r10d
	vmovd %r10d, %xmm14
	vpbroadcastb %xmm14, %ymm14
.LR32065l:
	leaq 32(%rax), %r11
	cmpq %rsi, %r11
	jg .LR32065e
	vpcmpeqb (%rdi,%rax), %ymm14, %ymm15
	vpmovmskb %ymm15, %r10d
	notl %r10d
	testl %r10d, %r10d
	jne .LR32065f
	movq %r11, %rax
	jmp .LR32065l
.LR32065f:
	tzcntl %r10d, %r10d
	addq %r10, %rax
.LR32065e:
	vzeroupper
.LR32065d:
	addl $0, %eax
.LB16155:
	cmpl %r8d, %eax
	jge .LB16157
.LB16161:
	movslq %eax, %rdx
	cmpb $0, (%rcx,%rdx,1)
	jne .LB16157
.LB16156:
	incl %eax
	cmpl %r8d, %eax
	jl .LB16161
.LB16157:
	negl %eax
	addl %r8d, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
	.text
	.globl standard__crypto__RSA__rsa_cmp__3__uintE1_ptr1__uintE1_ptr1__intE1__ret_intE1
	.def standard__crypto__RSA__rsa_cmp__3__uintE1_ptr1__uintE1_ptr1__intE1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__RSA__rsa_cmp__3__uintE1_ptr1__uintE1_ptr1__intE1__ret_intE1:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
	movq %rdi, -8(%rsp)
.LB16175:
	leal -1(%r8), %eax
.LB16180:
	testl %eax, %eax
	js .LB16183
.LB16181:
	movslq %eax, %rsi
	movl (%rcx,%rsi,4), %edi
	cmpl (%rdx,%rsi,4), %edi
	ja .LB16197
.LB16198:
	movl (%rcx,%rsi,4), %edi
	cmpl (%rdx,%rsi,4), %edi
	jb .LB16209
.LB16210:
	decl %eax
	jns .LB16181
.LB16183:
	xorl %eax, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB16209:
	movabsq $4294967295, %rax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB16197:
	movl $1, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
	.text
	.globl standard__crypto__RSA__rsa_sub__4__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__intE1__ret_uintE1
	.def standard__crypto__RSA__rsa_sub__4__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__intE1__ret_uintE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__RSA__rsa_sub__4__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__intE1__ret_uintE1:
	subq $32, %rsp
	movq %rbx, 16(%rsp)
	movq %rsi, 8(%rsp)
	movq %rdi, 0(%rsp)
.LB16215:
	movslq %r9d, %rax
	xorl %esi, %esi
	xorl %edi, %edi
.LB16223:
	cmpq %rax, %rdi
	jge .LB16226
.LB16224:
	movl (%rdx,%rdi,4), %r9d
	movl (%r8,%rdi,4), %ebx
	subq %rbx, %r9
	negq %rsi
	addq %r9, %rsi
	movl %esi, (%rcx,%rdi,4)
	shrq $63, %rsi
	andq $1, %rsi
	incq %rdi
	cmpq %rax, %rdi
	jl .LB16224
.LB16226:
	movl %esi, %eax
	movq 16(%rsp), %rbx
	movq 8(%rsp), %rsi
	movq 0(%rsp), %rdi
	addq $32, %rsp
	ret
	.text
	.globl standard__crypto__RSA__rsa_add__4__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__intE1__ret_uintE1
	.def standard__crypto__RSA__rsa_add__4__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__intE1__ret_uintE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__RSA__rsa_add__4__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__intE1__ret_uintE1:
	subq $32, %rsp
	movq %rbx, 16(%rsp)
	movq %rsi, 8(%rsp)
	movq %rdi, 0(%rsp)
.LB16258:
	movslq %r9d, %rax
	xorl %esi, %esi
	xorl %edi, %edi
.LB16266:
	cmpq %rax, %rdi
	jge .LB16269
.LB16267:
	movl (%rdx,%rdi,4), %r9d
	movl (%r8,%rdi,4), %ebx
	addq %rbx, %r9
	addq %r9, %rsi
	movl %esi, (%rcx,%rdi,4)
	shrq $32, %rsi
	incq %rdi
	cmpq %rax, %rdi
	jl .LB16267
.LB16269:
	movl %esi, %eax
	movq 16(%rsp), %rbx
	movq 8(%rsp), %rsi
	movq 0(%rsp), %rdi
	addq $32, %rsp
	ret
	.text
	.globl standard__crypto__RSA__rsa_mod__5__uintE1_ptr1__uintE1_ptr1__intE1__uintE1_ptr1__intE1__ret_voidE1
	.def standard__crypto__RSA__rsa_mod__5__uintE1_ptr1__uintE1_ptr1__intE1__uintE1_ptr1__intE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__RSA__rsa_mod__5__uintE1_ptr1__uintE1_ptr1__intE1__uintE1_ptr1__intE1__ret_voidE1:
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
.LB16299:
	movl 48(%rbp), %r12d
	xorl %eax, %eax
	movq %rcx, %rsi
	movq %rdx, %rdi
	movq %r9, %rbx
	testl %r12d, %r12d
	cmovg %r12d, %eax
	shrl $2, %eax
	xorl %ecx, %ecx
.LB32066:
	testl %eax, %eax
	je .LB32068
.LB32067:
	movslq %ecx, %rdx
	movl $0, (%rsi,%rdx,4)
	leal 1(%rcx), %edx
	movslq %edx, %rdx
	movl $0, (%rsi,%rdx,4)
	leal 2(%rcx), %edx
	movslq %edx, %rdx
	movl $0, (%rsi,%rdx,4)
	leal 3(%rcx), %edx
	movslq %edx, %rdx
	movl $0, (%rsi,%rdx,4)
	addl $4, %ecx
	decl %eax
	jne .LB32067
.LB32068:
.LB16311:
	cmpl %r12d, %ecx
	jge .LB16314
.LB16312:
	movslq %ecx, %rax
	movl $0, (%rsi,%rax,4)
	incl %ecx
	cmpl %r12d, %ecx
	jl .LB16312
.LB16314:
	leal -1(%r8), %r13d
	xorl %eax, %eax
	xorl %edx, %edx
	xorl %r8d, %r8d
.LB16323:
	testl %r13d, %r13d
	js .LB16326
.LB16324:
	movl $31, %r14d
.LB16331:
	testl %r14d, %r14d
	js .LB16334
.LB16332:
	movslq %r13d, %rax
	movl (%rdi,%rax,4), %eax
	shrx %r14d, %eax, %eax
	movl %eax, %r15d
	andl $1, %r15d
	movq $0, -64(%rbp)
	movq %r15, -72(%rbp)
	movq %r8, -80(%rbp)
.LB16345:
	movq -64(%rbp), %rax
	cmpl %r12d, %eax
	jge .LB16348
.LB16346:
	movq -64(%rbp), %rax
	movslq %eax, %rax
	leaq (%rsi,%rax,4), %rax
	movl (%rax), %ecx
	movq -72(%rbp), %r8
	movl %ecx, %edx
	shrl $31, %edx
	shll $1, %ecx
	orl %r8d, %ecx
	movl %ecx, (%rax)
	movq -64(%rbp), %rax
	incl %eax
	movq %rax, -64(%rbp)
	movq %rdx, -72(%rbp)
	movq %rdx, -80(%rbp)
	jmp .LB16345
.LB16326:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB16334:
	decl %r13d
	jns .LB16324
	jmp .LB16326
.LB16348:
	movq -72(%rbp), %rax
	testl %eax, %eax
	jne .LB16380
.LB16372:
	movq %rsi, %rcx
	movq %rbx, %rdx
	movq %r12, %r8
	callq standard__crypto__RSA__rsa_cmp__3__uintE1_ptr1__uintE1_ptr1__intE1__ret_intE1
	testl %eax, %eax
	jns .LB16380
.LB16382:
	decl %r14d
	movq -64(%rbp), %rcx
	movq %r15, %rax
	movq -72(%rbp), %rdx
	movq -80(%rbp), %r8
	testl %r14d, %r14d
	jns .LB16332
	jmp .LB16334
.LB16380:
	movq %rsi, %rcx
	movq %rsi, %rdx
	movq %rbx, %r8
	movq %r12, %r9
	callq standard__crypto__RSA__rsa_sub__4__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__intE1__ret_uintE1
	jmp .LB16382
	.text
	.globl standard__crypto__RSA__rsa_mont_init__3__RSA_MONTE1_ptr1__uintE1_ptr1__intE1__ret_voidE1
	.def standard__crypto__RSA__rsa_mont_init__3__RSA_MONTE1_ptr1__uintE1_ptr1__intE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__RSA__rsa_mont_init__3__RSA_MONTE1_ptr1__uintE1_ptr1__intE1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $608, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
	movq %r14, -48(%rbp)
	movq %r15, -56(%rbp)
.LB16392:
	movq %rcx, %rsi
	movq %rdx, %rbx
	movl %r8d, %r12d
	leaq -568(%rbp), %rax
	movq %rax, %rdi
	xorl %eax, %eax
	movl $512, %ecx
	rep stosb
	movl %r12d, 1540(%rsi)
	movl $32, %eax
	xorl %ecx, %ecx
.LB32069:
	testq %rax, %rax
	je .LB32071
.LB32070:
	movl $0, (%rsi,%rcx,4)
	movl $0, 512(%rsi,%rcx,4)
	movl $0, 1024(%rsi,%rcx,4)
	movl $0, 4(%rsi,%rcx,4)
	movl $0, 516(%rsi,%rcx,4)
	movl $0, 1028(%rsi,%rcx,4)
	movl $0, 8(%rsi,%rcx,4)
	movl $0, 520(%rsi,%rcx,4)
	movl $0, 1032(%rsi,%rcx,4)
	movl $0, 12(%rsi,%rcx,4)
	movl $0, 524(%rsi,%rcx,4)
	movl $0, 1036(%rsi,%rcx,4)
	addq $4, %rcx
	decq %rax
	jne .LB32070
.LB32071:
.LB16406:
	cmpq $128, %rcx
	jge .LB16409
.LB16407:
	movl $0, (%rsi,%rcx,4)
	movl $0, 512(%rsi,%rcx,4)
	movl $0, 1024(%rsi,%rcx,4)
	incq %rcx
	cmpq $128, %rcx
	jl .LB16407
.LB16409:
	movslq %r12d, %rax
	xorl %ecx, %ecx
	testq %rax, %rax
	cmovg %rax, %rcx
	shrq $2, %rcx
	xorl %edx, %edx
.LB32072:
	testq %rcx, %rcx
	je .LB32074
.LB32073:
	movl (%rbx,%rdx,4), %edi
	movl %edi, (%rsi,%rdx,4)
	movl 4(%rbx,%rdx,4), %edi
	movl %edi, 4(%rsi,%rdx,4)
	movl 8(%rbx,%rdx,4), %edi
	movl %edi, 8(%rsi,%rdx,4)
	movl 12(%rbx,%rdx,4), %edi
	movl %edi, 12(%rsi,%rdx,4)
	addq $4, %rdx
	decq %rcx
	jne .LB32073
.LB32074:
.LB16426:
	cmpq %rax, %rdx
	jge .LB16429
.LB16427:
	movl (%rbx,%rdx,4), %ecx
	movl %ecx, (%rsi,%rdx,4)
	incq %rdx
	cmpq %rax, %rdx
	jl .LB16427
.LB16429:
	movl (%rbx), %eax
	movl %eax, %ecx
	imull %eax, %ecx
	movl $2, %edx
	subl %ecx, %edx
	movl %eax, %ecx
	imull %edx, %ecx
	movl %eax, %edx
	imull %ecx, %edx
	movl $2, %edi
	subl %edx, %edi
	imull %edi, %ecx
	movl %eax, %edx
	imull %ecx, %edx
	movl $2, %edi
	subl %edx, %edi
	imull %edi, %ecx
	movl %eax, %edx
	imull %ecx, %edx
	movl $2, %edi
	subl %edx, %edi
	imull %edi, %ecx
	imull %ecx, %eax
	movl $2, %edx
	subl %eax, %edx
	imull %edx, %ecx
	xorl %eax, %eax
	subl %ecx, %eax
	movl %eax, 1536(%rsi)
	movl $32, %eax
	xorl %ecx, %ecx
.LB32075:
	testq %rax, %rax
	je .LB32077
.LB32076:
	movl $0, -568(%rbp,%rcx,4)
	movl $0, -564(%rbp,%rcx,4)
	movl $0, -560(%rbp,%rcx,4)
	movl $0, -556(%rbp,%rcx,4)
	addq $4, %rcx
	decq %rax
	jne .LB32076
.LB32077:
.LB16466:
	cmpq $128, %rcx
	jge .LB16469
.LB16467:
	movl $0, -568(%rbp,%rcx,4)
	incq %rcx
	cmpq $128, %rcx
	jl .LB16467
.LB16469:
	movl $1, -568(%rbp)
	movl %r12d, %edi
	shll $6, %edi
	movl %r12d, %eax
	shll $5, %eax
	leal -1(%rax), %r13d
	xorl %r14d, %r14d
	xorl %r15d, %r15d
.LB16477:
	cmpl %edi, %r14d
	jge .LB16480
.LB16478:
	movslq %r12d, %rax
	xorl %ecx, %ecx
	xorl %edx, %edx
.LB16485:
	cmpq %rax, %rdx
	jge .LB16488
.LB16486:
	movl -568(%rbp,%rdx,4), %r8d
	movl -568(%rbp,%rdx,4), %r9d
	shrl $31, %r8d
	shll $1, %r9d
	orl %ecx, %r9d
	movl %r9d, -568(%rbp,%rdx,4)
	incq %rdx
	movq %r8, %rcx
	movq %r8, %r15
	cmpq %rax, %rdx
	jl .LB16486
	jmp .LB16488
.LB16480:
	movslq %r12d, %rax
	xorl %ecx, %ecx
	testq %rax, %rax
	cmovg %rax, %rcx
	shrq $2, %rcx
	xorl %edx, %edx
.LB32081:
	testq %rcx, %rcx
	je .LB32083
.LB32082:
	movl -568(%rbp,%rdx,4), %edi
	movl %edi, 512(%rsi,%rdx,4)
	movl -564(%rbp,%rdx,4), %edi
	movl %edi, 516(%rsi,%rdx,4)
	movl -560(%rbp,%rdx,4), %edi
	movl %edi, 520(%rsi,%rdx,4)
	movl -556(%rbp,%rdx,4), %edi
	movl %edi, 524(%rsi,%rdx,4)
	addq $4, %rdx
	decq %rcx
	jne .LB32082
.LB32083:
.LB16551:
	cmpq %rax, %rdx
	jge .LB16554
.LB16552:
	movl -568(%rbp,%rdx,4), %ecx
	movl %ecx, 512(%rsi,%rdx,4)
	incq %rdx
	cmpq %rax, %rdx
	jl .LB16552
.LB16554:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB16488:
	testl %ecx, %ecx
	jne .LB16517
.LB16509:
	leaq -568(%rbp), %rcx
	movq %rbx, %rdx
	movq %r12, %r8
	callq standard__crypto__RSA__rsa_cmp__3__uintE1_ptr1__uintE1_ptr1__intE1__ret_intE1
	testl %eax, %eax
	jns .LB16517
.LB16519:
	cmpl %r13d, %r14d
	je .LB16530
.LB16532:
	incl %r14d
	cmpl %edi, %r14d
	jl .LB16478
	jmp .LB16480
.LB16517:
	leaq -568(%rbp), %rcx
	leaq -568(%rbp), %rdx
	movq %rbx, %r8
	movq %r12, %r9
	callq standard__crypto__RSA__rsa_sub__4__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__intE1__ret_uintE1
	cmpl %r13d, %r14d
	jne .LB16532
.LB16530:
	movslq %r12d, %rax
	xorl %ecx, %ecx
	testq %rax, %rax
	cmovg %rax, %rcx
	shrq $2, %rcx
	xorl %edx, %edx
.LB32078:
	testq %rcx, %rcx
	je .LB32080
.LB32079:
	movl -568(%rbp,%rdx,4), %r8d
	movl %r8d, 1024(%rsi,%rdx,4)
	movl -564(%rbp,%rdx,4), %r8d
	movl %r8d, 1028(%rsi,%rdx,4)
	movl -560(%rbp,%rdx,4), %r8d
	movl %r8d, 1032(%rsi,%rdx,4)
	movl -556(%rbp,%rdx,4), %r8d
	movl %r8d, 1036(%rsi,%rdx,4)
	addq $4, %rdx
	decq %rcx
	jne .LB32079
.LB32080:
.LB16533:
	cmpq %rax, %rdx
	jge .LB16532
.LB16534:
	movl -568(%rbp,%rdx,4), %ecx
	movl %ecx, 1024(%rsi,%rdx,4)
	incq %rdx
	cmpq %rax, %rdx
	jl .LB16534
	jmp .LB16532
	.text
	.globl standard__crypto__RSA__rsa_mont_mul__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	.def standard__crypto__RSA__rsa_mont_mul__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__RSA__rsa_mont_mul__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $640, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
	movq %r14, -48(%rbp)
	movq %r15, -56(%rbp)
.LB16567:
	leaq -584(%rbp), %rax
	movq %rcx, %rsi
	movq %rdx, %rbx
	movl $528, %ecx
	movq %rax, %rdi
	xorl %eax, %eax
	rep stosb
	movl 1540(%rsi), %edi
	leal 2(%rdi), %eax
	movslq %eax, %rax
	xorl %ecx, %ecx
	testq %rax, %rax
	cmovg %rax, %rcx
	shrq $2, %rcx
	xorl %edx, %edx
.LB32084:
	testq %rcx, %rcx
	je .LB32086
.LB32085:
	movl $0, -584(%rbp,%rdx,4)
	movl $0, -580(%rbp,%rdx,4)
	movl $0, -576(%rbp,%rdx,4)
	movl $0, -572(%rbp,%rdx,4)
	addq $4, %rdx
	decq %rcx
	jne .LB32085
.LB32086:
.LB16584:
	cmpq %rax, %rdx
	jge .LB16587
.LB16585:
	movl $0, -584(%rbp,%rdx,4)
	incq %rdx
	cmpq %rax, %rdx
	jl .LB16585
.LB16587:
	leal 1(%rdi), %eax
	movq %rax, -608(%rbp)
	leal -1(%rdi), %eax
	movq %rax, -600(%rbp)
	movslq %edi, %rax
	movq %rax, -592(%rbp)
	xorl %eax, %eax
.LB16596:
	movq -592(%rbp), %rcx
	cmpq %rcx, %rax
	jge .LB16599
.LB16597:
	movslq %edi, %rcx
	xorl %edx, %edx
	xorl %r12d, %r12d
.LB16604:
	cmpq %rcx, %r12
	jge .LB16607
.LB16605:
	movl -584(%rbp,%r12,4), %r13d
	movl (%r8,%r12,4), %r14d
	movl (%r9,%rax,4), %r15d
	imulq %r15, %r14
	addq %r14, %r13
	addq %r13, %rdx
	movl %edx, -584(%rbp,%r12,4)
	shrq $32, %rdx
	incq %r12
	cmpq %rcx, %r12
	jl .LB16605
	jmp .LB16607
.LB16599:
	movslq %edi, %rax
	cmpl $0, -584(%rbp,%rax,4)
	jne .LB16750
.LB16740:
	leaq -584(%rbp), %rcx
	movq %rsi, %rdx
	movq %rdi, %r8
	callq standard__crypto__RSA__rsa_cmp__3__uintE1_ptr1__uintE1_ptr1__intE1__ret_intE1
	testl %eax, %eax
	jns .LB16750
.LB16751:
	movslq %edi, %rax
	xorl %ecx, %ecx
	testq %rax, %rax
	cmovg %rax, %rcx
	shrq $2, %rcx
	xorl %edx, %edx
.LB32087:
	testq %rcx, %rcx
	je .LB32089
.LB32088:
	movl -584(%rbp,%rdx,4), %esi
	movl %esi, (%rbx,%rdx,4)
	movl -580(%rbp,%rdx,4), %esi
	movl %esi, 4(%rbx,%rdx,4)
	movl -576(%rbp,%rdx,4), %esi
	movl %esi, 8(%rbx,%rdx,4)
	movl -572(%rbp,%rdx,4), %esi
	movl %esi, 12(%rbx,%rdx,4)
	addq $4, %rdx
	decq %rcx
	jne .LB32088
.LB32089:
.LB16760:
	cmpq %rax, %rdx
	jge .LB16763
.LB16761:
	movl -584(%rbp,%rdx,4), %ecx
	movl %ecx, (%rbx,%rdx,4)
	incq %rdx
	cmpq %rax, %rdx
	jl .LB16761
.LB16763:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB16750:
	leaq -584(%rbp), %rdx
	movq %rsi, %r8
	movq %rbx, %rcx
	movq %rdi, %r9
	callq standard__crypto__RSA__rsa_sub__4__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__intE1__ret_uintE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB16607:
	movslq %edi, %rcx
	movl -584(%rbp,%rcx,4), %r12d
	addq %r12, %rdx
	movl %edx, -584(%rbp,%rcx,4)
	movq %rdx, %rcx
	shrq $32, %rcx
	movq -608(%rbp), %rdx
	movslq %edx, %rdx
	movl %ecx, -584(%rbp,%rdx,4)
	movl 1536(%rsi), %ecx
	imull -584(%rbp), %ecx
	movl -584(%rbp), %edx
	movl (%rsi), %r12d
	imulq %rcx, %r12
	addq %r12, %rdx
	shrq $32, %rdx
	movq %rdx, %r12
	movl $1, %edx
.LB16678:
	cmpl %edi, %edx
	jge .LB16681
.LB16679:
	movslq %edx, %r13
	movl -584(%rbp,%r13,4), %r14d
	movl (%rsi,%r13,4), %r13d
	imulq %rcx, %r13
	addq %r13, %r14
	addq %r14, %r12
	leal -1(%rdx), %r13d
	movslq %r13d, %r13
	movl %r12d, -584(%rbp,%r13,4)
	shrq $32, %r12
	incl %edx
	cmpl %edi, %edx
	jl .LB16679
.LB16681:
	movslq %edi, %rcx
	movl -584(%rbp,%rcx,4), %ecx
	movq -600(%rbp), %rdx
	movslq %edx, %rdx
	addq %r12, %rcx
	movl %ecx, -584(%rbp,%rdx,4)
	movq -608(%rbp), %rdx
	shrq $32, %rcx
	movslq %edx, %rdx
	addl -584(%rbp,%rdx,4), %ecx
	movslq %edi, %rdx
	incq %rax
	movl %ecx, -584(%rbp,%rdx,4)
	jmp .LB16596
	.text
	.globl standard__crypto__RSA__rsa_mont_exp__5__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__intE1__ret_voidE1
	.def standard__crypto__RSA__rsa_mont_exp__5__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__intE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__RSA__rsa_mont_exp__5__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__intE1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $1616, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
	movq %r14, -48(%rbp)
.LB16775:
	leaq -560(%rbp), %rax
	movl 48(%rbp), %r13d
	movq %rcx, %rsi
	movq %rdx, %rbx
	movq %r9, %r12
	movl $512, %ecx
	movq %rax, %rdi
	xorl %eax, %eax
	rep stosb
	leaq -1072(%rbp), %rax
	movq %rax, %rdi
	xorl %eax, %eax
	movl $512, %ecx
	rep stosb
	leaq -1584(%rbp), %rax
	movq %rax, %rdi
	xorl %eax, %eax
	movl $512, %ecx
	rep stosb
	movl 1540(%rsi), %edi
	leaq -560(%rbp), %rdx
	leaq 512(%rsi), %r9
	movq %rsi, %rcx
	callq standard__crypto__RSA__rsa_mont_mul__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	movslq %edi, %rax
	xorl %ecx, %ecx
	testq %rax, %rax
	cmovg %rax, %rcx
	shrq $2, %rcx
	xorl %edx, %edx
.LB32090:
	testq %rcx, %rcx
	je .LB32092
.LB32091:
	movl 1024(%rsi,%rdx,4), %edi
	movl %edi, -1072(%rbp,%rdx,4)
	movl $0, -1584(%rbp,%rdx,4)
	movl 1028(%rsi,%rdx,4), %edi
	movl %edi, -1068(%rbp,%rdx,4)
	movl $0, -1580(%rbp,%rdx,4)
	movl 1032(%rsi,%rdx,4), %edi
	movl %edi, -1064(%rbp,%rdx,4)
	movl $0, -1576(%rbp,%rdx,4)
	movl 1036(%rsi,%rdx,4), %edi
	movl %edi, -1060(%rbp,%rdx,4)
	movl $0, -1572(%rbp,%rdx,4)
	addq $4, %rdx
	decq %rcx
	jne .LB32091
.LB32092:
.LB16803:
	cmpq %rax, %rdx
	jge .LB16806
.LB16804:
	movl 1024(%rsi,%rdx,4), %ecx
	movl %ecx, -1072(%rbp,%rdx,4)
	movl $0, -1584(%rbp,%rdx,4)
	incq %rdx
	cmpq %rax, %rdx
	jl .LB16804
.LB16806:
	movl $1, -1584(%rbp)
	leal -1(%r13), %edi
	xorl %r13d, %r13d
.LB16823:
	testl %edi, %edi
	js .LB16826
.LB16824:
	movq %r13, %r14
	movl $31, %r13d
.LB16831:
	testl %r13d, %r13d
	js .LB16834
.LB16832:
	testb %r14b, %r14b
	jne .LB16838
.LB16840:
	movslq %edi, %rax
	movl (%r12,%rax,4), %eax
	btl %r13d, %eax
	jb .LB16854
.LB16855:
.LB16856:
	decl %r13d
	jns .LB16832
	jmp .LB16834
.LB16826:
	leaq -1072(%rbp), %r8
	leaq -1584(%rbp), %r9
	movq %rsi, %rcx
	movq %rbx, %rdx
	callq standard__crypto__RSA__rsa_mont_mul__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	leave
	ret
.LB16834:
	decl %edi
	movq %r14, %r13
	testl %edi, %edi
	jns .LB16824
	jmp .LB16826
.LB16838:
	leaq -1072(%rbp), %rdx
	leaq -1072(%rbp), %r8
	leaq -1072(%rbp), %r9
	movq %rsi, %rcx
	callq standard__crypto__RSA__rsa_mont_mul__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	jmp .LB16840
.LB16854:
	leaq -1072(%rbp), %rdx
	leaq -1072(%rbp), %r8
	leaq -560(%rbp), %r9
	movq %rsi, %rcx
	callq standard__crypto__RSA__rsa_mont_mul__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	movl $1, %r14d
	jmp .LB16856
	.text
	.globl standard__crypto__RSA__rsa_modexp_bytes__6__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__intE1__byteE1_ptr1__intE1__ret_boolE1
	.def standard__crypto__RSA__rsa_modexp_bytes__6__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__intE1__byteE1_ptr1__intE1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__RSA__rsa_modexp_bytes__6__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__intE1__byteE1_ptr1__intE1__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $3696, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
	movq %r14, -48(%rbp)
	movq %r15, -56(%rbp)
.LB16871:
	leaq .LZERO(%rip), %rsi
	leaq -1600(%rbp), %rdi
	movq %rdx, %rbx
	movq %rcx, -3656(%rbp)
	movq 48(%rbp), %r14
	movl 56(%rbp), %r15d
	movq %r8, %r12
	movl %r9d, %r13d
	movl $1544, %ecx
	rep movsb
	leaq -2112(%rbp), %rax
	movq %rax, %rdi
	xorl %eax, %eax
	movl $512, %ecx
	rep stosb
	leaq -2624(%rbp), %rax
	movq %rax, %rdi
	xorl %eax, %eax
	movl $512, %ecx
	rep stosb
	leaq -3136(%rbp), %rax
	movq %rax, %rdi
	xorl %eax, %eax
	movl $512, %ecx
	rep stosb
	leaq -3648(%rbp), %rax
	movq %rax, %rdi
	xorl %eax, %eax
	movl $512, %ecx
	rep stosb
	movq %r12, %rcx
	movq %r13, %rdx
	callq standard__crypto__RSA__rsa_byte_len__2__byteE1_ptr1__intE1__ret_intE1
	movl %eax, %esi
	cmpl $12, %esi
	jl .LB16900
.LB16895:
	cmpl $512, %esi
	jg .LB16900
.LB16901:
	leal -1(%r13), %eax
	movslq %eax, %rax
	movzbl (%r12,%rax,1), %eax
	andl $1, %eax
	testb %al, %al
	je .LB16912
.LB16913:
	leal 3(%rsi), %eax
	movl $128, %edx
	movq %rsi, %r9
	movl %eax, %ecx
	sarl $31, %ecx
	shrl $30, %ecx
	addl %ecx, %eax
	leaq -2112(%rbp), %rcx
	movl %eax, %edi
	sarl $2, %edi
	subl %esi, %r13d
	movslq %r13d, %rax
	leaq (%r12,%rax,1), %r8
	callq standard__crypto__RSA__rsa_be_to_limbs__4__uintE1_ptr1__intE1__byteE1_ptr1__intE1__ret_voidE1
	leaq -2624(%rbp), %rcx
	movl $128, %edx
	movq %rbx, %r8
	movq %rsi, %r9
	callq standard__crypto__RSA__rsa_be_to_limbs__4__uintE1_ptr1__intE1__byteE1_ptr1__intE1__ret_voidE1
	leaq -2624(%rbp), %rcx
	leaq -2112(%rbp), %rdx
	movl $128, %r8d
	callq standard__crypto__RSA__rsa_cmp__3__uintE1_ptr1__uintE1_ptr1__intE1__ret_intE1
	testl %eax, %eax
	jns .LB16932
.LB16933:
	leal 3(%r15), %eax
	movl %eax, %ecx
	sarl $31, %ecx
	shrl $30, %ecx
	addl %ecx, %eax
	movl %eax, %ebx
	sarl $2, %ebx
	cmpl $128, %ebx
	jg .LB16940
.LB16941:
	leaq -3136(%rbp), %rcx
	movl $128, %edx
	movq %r14, %r8
	movq %r15, %r9
	callq standard__crypto__RSA__rsa_be_to_limbs__4__uintE1_ptr1__intE1__byteE1_ptr1__intE1__ret_voidE1
	leaq -2112(%rbp), %rdx
	leaq -1600(%rbp), %rcx
	movq %rdi, %r8
	callq standard__crypto__RSA__rsa_mont_init__3__RSA_MONTE1_ptr1__uintE1_ptr1__intE1__ret_voidE1
	leaq -3648(%rbp), %rdx
	leaq -2624(%rbp), %r8
	leaq -3136(%rbp), %r9
	leaq -1600(%rbp), %rcx
	movq %rbx, 32(%rsp)
	callq standard__crypto__RSA__rsa_mont_exp__5__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__intE1__ret_voidE1
	leaq -3648(%rbp), %r8
	movq -3656(%rbp), %rcx
	movq %rsi, %rdx
	movq %rdi, %r9
	callq standard__crypto__RSA__rsa_limbs_to_be__4__byteE1_ptr1__intE1__uintE1_ptr1__intE1__ret_voidE1
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
.LB16940:
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
.LB16932:
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
.LB16912:
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
.LB16900:
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
	.globl standard__crypto__RSA__rsa_public_op__6__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__intE1__byteE1_ptr1__intE1__ret_boolE1
	.def standard__crypto__RSA__rsa_public_op__6__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__intE1__byteE1_ptr1__intE1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__RSA__rsa_public_op__6__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__intE1__byteE1_ptr1__intE1__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rsi, -8(%rbp)
.LB16956:
	movq 48(%rbp), %rax
	movl 56(%rbp), %esi
	movq %rax, 32(%rsp)
	movq %rsi, 40(%rsp)
	callq standard__crypto__RSA__rsa_modexp_bytes__6__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__intE1__byteE1_ptr1__intE1__ret_boolE1
	movzbl %al, %eax
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl standard__crypto__RSA__rsa_hash_len__1__intE1__ret_intE1
	.def standard__crypto__RSA__rsa_hash_len__1__intE1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__RSA__rsa_hash_len__1__intE1__ret_intE1:
.LB16970:
	cmpl $1, %ecx
	je .LB16974
.LB16975:
	cmpl $2, %ecx
	je .LB16979
.LB16980:
	cmpl $3, %ecx
	je .LB16984
.LB16985:
	xorl %eax, %eax
	ret
.LB16984:
	movl $64, %eax
	ret
.LB16979:
	movl $48, %eax
	ret
.LB16974:
	movl $32, %eax
	ret
	.text
	.globl standard__crypto__RSA__rsa_hash2__6__intE1__byteE1_ptr1__intE1__byteE1_ptr1__intE1__byteE1_ptr1__ret_voidE1
	.def standard__crypto__RSA__rsa_hash2__6__intE1__byteE1_ptr1__intE1__byteE1_ptr1__intE1__byteE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__RSA__rsa_hash2__6__intE1__byteE1_ptr1__intE1__byteE1_ptr1__intE1__byteE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $432, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
	movq %r14, -48(%rbp)
	movq %r15, -56(%rbp)
.LB16987:
	movl %ecx, %ebx
	movq %rdx, %r12
	movq %r8, -392(%rbp)
	movq %r9, %r13
	movl 48(%rbp), %r14d
	movq 56(%rbp), %r15
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -168(%rbp)
	vmovdqu .LZERO+32(%rip), %ymm15
	vmovdqu %ymm15, -136(%rbp)
	vmovdqu .LZERO+64(%rip), %ymm15
	vmovdqu %ymm15, -104(%rbp)
	movq .LZERO+96(%rip), %r10
	movq %r10, -72(%rbp)
	movl .LZERO+104(%rip), %r10d
	movl %r10d, -64(%rbp)
	vzeroupper
	leaq .LZERO(%rip), %rsi
	leaq -384(%rbp), %rdi
	movl $212, %ecx
	rep movsb
	cmpl $1, %ebx
	je .LB16998
.LB16999:
	cmpl $2, %ebx
	je .LB17019
.LB17020:
	leaq -384(%rbp), %rcx
	callq standard__crypto__hashing__SHA384__sha512_init__1__SHA384_CTXE1_ptr1__ret_voidE1
.LB17021:
	movl -392(%rbp), %r8d
	leaq -384(%rbp), %rcx
	movq %r12, %rdx
	callq standard__crypto__hashing__SHA384__sha384_update__3__SHA384_CTXE1_ptr1__byteE1_ptr1__dataE1_ubits64__ret_voidE1
	testq %r13, %r13
	jne .LB17031
.LB17033:
	cmpl $2, %ebx
	je .LB17039
.LB17040:
	leaq -384(%rbp), %rcx
	movq %r15, %rdx
	callq standard__crypto__hashing__SHA384__sha512_final__2__SHA384_CTXE1_ptr1__byteE1_ptr1__ret_voidE1
.LB17041:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB17019:
	leaq -384(%rbp), %rcx
	callq standard__crypto__hashing__SHA384__sha384_init__1__SHA384_CTXE1_ptr1__ret_voidE1
	jmp .LB17021
.LB17031:
	movl %r14d, %r8d
	leaq -384(%rbp), %rcx
	movq %r13, %rdx
	callq standard__crypto__hashing__SHA384__sha384_update__3__SHA384_CTXE1_ptr1__byteE1_ptr1__dataE1_ubits64__ret_voidE1
	cmpl $2, %ebx
	jne .LB17040
.LB17039:
	leaq -384(%rbp), %rcx
	movq %r15, %rdx
	callq standard__crypto__hashing__SHA384__sha384_final__2__SHA384_CTXE1_ptr1__byteE1_ptr1__ret_voidE1
	jmp .LB17041
.LB16998:
	leaq -168(%rbp), %rcx
	callq standard__crypto__hashing__SHA256__sha256_init__1__SHA256_CTXE1_ptr1__ret_voidE1
	movl -392(%rbp), %r8d
	leaq -168(%rbp), %rcx
	movq %r12, %rdx
	callq standard__crypto__hashing__SHA256__sha256_update__3__SHA256_CTXE1_ptr1__byteE1_ptr1__dataE1_ubits64__ret_voidE1
	testq %r13, %r13
	jne .LB17010
.LB17012:
	leaq -168(%rbp), %rcx
	movq %r15, %rdx
	callq standard__crypto__hashing__SHA256__sha256_final__2__SHA256_CTXE1_ptr1__byteE1_ptr1__ret_voidE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB17010:
	movl %r14d, %r8d
	leaq -168(%rbp), %rcx
	movq %r13, %rdx
	callq standard__crypto__hashing__SHA256__sha256_update__3__SHA256_CTXE1_ptr1__byteE1_ptr1__dataE1_ubits64__ret_voidE1
	jmp .LB17012
	.text
	.globl standard__crypto__RSA__rsa_digestinfo_prefix__2__intE1__byteE1_ptr1__ret_intE1
	.def standard__crypto__RSA__rsa_digestinfo_prefix__2__intE1__byteE1_ptr1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__RSA__rsa_digestinfo_prefix__2__intE1__byteE1_ptr1__ret_intE1:
	subq $80, %rsp
	movq %rsi, 64(%rsp)
	movq %rdi, 56(%rsp)
.LB17044:
	xorl %eax, %eax
	xorl %esi, %esi
	xorl %edi, %edi
	cmpl $1, %ecx
	movl $221262128, 37(%rsp)
	movl $-2040526586, 41(%rsp)
	sete %al
	cmpl $2, %ecx
	movl $56951112, 45(%rsp)
	movl $83952132, 49(%rsp)
	sete %sil
	cmpl $3, %ecx
	movw $1024, 53(%rsp)
	movb $32, 55(%rsp)
	movl $221266224, 18(%rsp)
	movl $-2040526586, 22(%rsp)
	movl $56951112, 26(%rsp)
	movl $84017668, 30(%rsp)
	movw $1024, 34(%rsp)
	movb $48, 36(%rsp)
	movl $221270320, -1(%rsp)
	movl $-2040526586, 3(%rsp)
	movl $56951112, 7(%rsp)
	movl $84083204, 11(%rsp)
	movw $1024, 15(%rsp)
	movb $64, 17(%rsp)
	sete %dil
	xorl %r8d, %r8d
.LB17165:
	cmpq $19, %r8
	jge .LB17168
.LB17166:
	testb %al, %al
	jne .LB17173
.LB17175:
	testb %sil, %sil
	jne .LB17184
.LB17186:
	testb %dil, %dil
	jne .LB17195
.LB17197:
	incq %r8
	cmpq $19, %r8
	jl .LB17166
.LB17168:
	cmpl $1, %ecx
	jl .LB17213
.LB17208:
	cmpl $3, %ecx
	jg .LB17213
.LB17214:
	movl $19, %eax
	movq 64(%rsp), %rsi
	movq 56(%rsp), %rdi
	addq $80, %rsp
	ret
.LB17213:
	xorl %eax, %eax
	movq 64(%rsp), %rsi
	movq 56(%rsp), %rdi
	addq $80, %rsp
	ret
.LB17173:
	movzbl 37(%rsp,%r8,1), %r9d
	movb %r9b, (%rdx,%r8,1)
	testb %sil, %sil
	je .LB17186
.LB17184:
	movzbl 18(%rsp,%r8,1), %r9d
	movb %r9b, (%rdx,%r8,1)
	testb %dil, %dil
	je .LB17197
.LB17195:
	movzbl -1(%rsp,%r8,1), %r9d
	movb %r9b, (%rdx,%r8,1)
	jmp .LB17197
	.text
	.globl standard__crypto__RSA__rsa_pkcs1_encode__4__byteE1_ptr1__intE1__intE1__byteE1_ptr1__ret_boolE1
	.def standard__crypto__RSA__rsa_pkcs1_encode__4__byteE1_ptr1__intE1__intE1__byteE1_ptr1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__RSA__rsa_pkcs1_encode__4__byteE1_ptr1__intE1__intE1__byteE1_ptr1__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $96, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
.LB17216:
	movq %rcx, %rsi
	movl %edx, %edi
	movl %r8d, %ebx
	movq %r9, %r12
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -59(%rbp)
	movw .LZERO+16(%rip), %r10w
	movw %r10w, -43(%rbp)
	movb .LZERO+18(%rip), %r10b
	movb %r10b, -41(%rbp)
	movq %rbx, %rcx
	callq standard__crypto__RSA__rsa_hash_len__1__intE1__ret_intE1
	movl %eax, %r13d
	testl %r13d, %r13d
	je .LB17229
.LB17230:
	leaq -59(%rbp), %rdx
	movq %rbx, %rcx
	callq standard__crypto__RSA__rsa_digestinfo_prefix__2__intE1__byteE1_ptr1__ret_intE1
	addl %r13d, %eax
	leal 11(%rax), %ecx
	cmpl %ecx, %edi
	jl .LB17241
.LB17242:
	movw $256, (%rsi)
	movl %edi, %ecx
	subl %eax, %ecx
	decl %ecx
	movslq %ecx, %rdx
	leaq -2(%rdx), %r8
	xorl %r9d, %r9d
	cmpq $2, %rdx
	cmovg %r8, %r9
	movq %r9, %r8
	shrq $2, %r8
	movl $2, %r9d
.LB32093:
	testq %r8, %r8
	je .LB32095
.LB32094:
	movb $255, (%rsi,%r9,1)
	movb $255, 1(%rsi,%r9,1)
	movb $255, 2(%rsi,%r9,1)
	movb $255, 3(%rsi,%r9,1)
	addq $4, %r9
	decq %r8
	jne .LB32094
.LB32095:
.LB17250:
	cmpq %rdx, %r9
	jge .LB17253
.LB17251:
	movb $255, (%rsi,%r9,1)
	incq %r9
	cmpq %rdx, %r9
	jl .LB17251
.LB17253:
	movslq %ecx, %rcx
	movb $0, (%rsi,%rcx,1)
	negl %eax
	addl %edi, %eax
	movl $4, %ecx
	xorl %edx, %edx
.LB32096:
	testl %ecx, %ecx
	je .LB32098
.LB32097:
	movslq %edx, %r8
	movzbl -59(%rbp,%r8,1), %r8d
	leal (%rax,%rdx), %r9d
	movslq %r9d, %r9
	movb %r8b, (%rsi,%r9,1)
	leal 1(%rdx), %r8d
	movslq %r8d, %r9
	movzbl -59(%rbp,%r9,1), %r9d
	addl %eax, %r8d
	movslq %r8d, %r8
	movb %r9b, (%rsi,%r8,1)
	leal 2(%rdx), %r8d
	movslq %r8d, %r9
	movzbl -59(%rbp,%r9,1), %r9d
	addl %eax, %r8d
	movslq %r8d, %r8
	movb %r9b, (%rsi,%r8,1)
	leal 3(%rdx), %r8d
	movslq %r8d, %r9
	movzbl -59(%rbp,%r9,1), %r9d
	addl %eax, %r8d
	movslq %r8d, %r8
	movb %r9b, (%rsi,%r8,1)
	addl $4, %edx
	decl %ecx
	jne .LB32097
.LB32098:
.LB17273:
	cmpl $19, %edx
	jge .LB17276
.LB17274:
	movslq %edx, %rcx
	movzbl -59(%rbp,%rcx,1), %ecx
	leal (%rax,%rdx), %r8d
	movslq %r8d, %r8
	movb %cl, (%rsi,%r8,1)
	incl %edx
	cmpl $19, %edx
	jl .LB17274
.LB17276:
	subl %r13d, %edi
	xorl %eax, %eax
	testl %r13d, %r13d
	cmovg %r13d, %eax
	shrl $2, %eax
	xorl %ecx, %ecx
.LB32099:
	testl %eax, %eax
	je .LB32101
.LB32100:
	movslq %ecx, %rdx
	movzbl (%r12,%rdx,1), %edx
	leal (%rdi,%rcx), %r8d
	movslq %r8d, %r8
	movb %dl, (%rsi,%r8,1)
	leal 1(%rcx), %edx
	movslq %edx, %r8
	movzbl (%r12,%r8,1), %r8d
	addl %edi, %edx
	movslq %edx, %rdx
	movb %r8b, (%rsi,%rdx,1)
	leal 2(%rcx), %edx
	movslq %edx, %r8
	movzbl (%r12,%r8,1), %r8d
	addl %edi, %edx
	movslq %edx, %rdx
	movb %r8b, (%rsi,%rdx,1)
	leal 3(%rcx), %edx
	movslq %edx, %r8
	movzbl (%r12,%r8,1), %r8d
	addl %edi, %edx
	movslq %edx, %rdx
	movb %r8b, (%rsi,%rdx,1)
	addl $4, %ecx
	decl %eax
	jne .LB32100
.LB32101:
.LB17291:
	cmpl %r13d, %ecx
	jge .LB17294
.LB17292:
	movslq %ecx, %rax
	movzbl (%r12,%rax,1), %eax
	leal (%rdi,%rcx), %edx
	movslq %edx, %rdx
	movb %al, (%rsi,%rdx,1)
	incl %ecx
	cmpl %r13d, %ecx
	jl .LB17292
.LB17294:
	movl $1, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB17241:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB17229:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
	.text
	.globl standard__crypto__RSA__rsa_pkcs1_verify__8__byteE1_ptr1__intE1__byteE1_ptr1__intE1__intE1__byteE1_ptr1__byteE1_ptr1__intE1__ret_boolE1
	.def standard__crypto__RSA__rsa_pkcs1_verify__8__byteE1_ptr1__intE1__byteE1_ptr1__intE1__intE1__byteE1_ptr1__byteE1_ptr1__intE1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__RSA__rsa_pkcs1_verify__8__byteE1_ptr1__intE1__byteE1_ptr1__intE1__intE1__byteE1_ptr1__byteE1_ptr1__intE1__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $1664, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
	movq %r14, -48(%rbp)
	movq %r15, -56(%rbp)
.LB17311:
	movl 48(%rbp), %r14d
	movq 56(%rbp), %r15
	movq 64(%rbp), %rax
	movq %rcx, %rsi
	movl %edx, %ebx
	movq %r8, %r12
	movl %r9d, %r13d
	movl $512, %ecx
	movq %rax, -1600(%rbp)
	movl 72(%rbp), %eax
	movq %rax, -1608(%rbp)
	leaq -568(%rbp), %rax
	movq %rax, %rdi
	xorl %eax, %eax
	rep stosb
	leaq -1080(%rbp), %rax
	movq %rax, %rdi
	xorl %eax, %eax
	movl $512, %ecx
	rep stosb
	leaq -1592(%rbp), %rax
	movq %rax, %rdi
	xorl %eax, %eax
	movl $512, %ecx
	rep stosb
	movq %rsi, %rcx
	movq %rbx, %rdx
	callq standard__crypto__RSA__rsa_byte_len__2__byteE1_ptr1__intE1__ret_intE1
	movl %eax, %edi
	cmpl $12, %edi
	jl .LB17345
.LB17334:
	cmpl $512, %edi
	jg .LB17345
.LB17339:
	movq -1608(%rbp), %rax
	cmpl %edi, %eax
	jne .LB17345
.LB17346:
	leaq -1592(%rbp), %rcx
	movq %r12, 32(%rsp)
	movq %r13, 40(%rsp)
	movq -1600(%rbp), %rdx
	movq %rsi, %r8
	movq %rbx, %r9
	callq standard__crypto__RSA__rsa_public_op__6__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__intE1__byteE1_ptr1__intE1__ret_boolE1
	testb %al, %al
	je .LB17356
.LB17357:
	leaq -1080(%rbp), %rcx
	movq %rdi, %rdx
	movq %r14, %r8
	movq %r15, %r9
	callq standard__crypto__RSA__rsa_pkcs1_encode__4__byteE1_ptr1__intE1__intE1__byteE1_ptr1__ret_boolE1
	testb %al, %al
	je .LB17365
.LB17366:
	movslq %edi, %rax
	xorl %ecx, %ecx
	testq %rax, %rax
	cmovg %rax, %rcx
	shrq $2, %rcx
	xorl %edx, %edx
	xorl %esi, %esi
	xorl %edi, %edi
	xorl %r8d, %r8d
	xorl %r9d, %r9d
.LB32102:
	testq %rcx, %rcx
	je .LB32104
.LB32103:
	movzbl -1592(%rbp,%rdx,1), %ebx
	movzbl -1080(%rbp,%rdx,1), %r12d
	xorl %r12d, %ebx
	orl %ebx, %esi
	movzbl -1591(%rbp,%rdx,1), %ebx
	movzbl -1079(%rbp,%rdx,1), %r12d
	xorl %r12d, %ebx
	orl %ebx, %edi
	movzbl -1590(%rbp,%rdx,1), %ebx
	movzbl -1078(%rbp,%rdx,1), %r12d
	xorl %r12d, %ebx
	orl %ebx, %r8d
	movzbl -1589(%rbp,%rdx,1), %ebx
	movzbl -1077(%rbp,%rdx,1), %r12d
	xorl %r12d, %ebx
	orl %ebx, %r9d
	addq $4, %rdx
	decq %rcx
	jne .LB32103
.LB32104:
	orl %edi, %esi
	orl %r9d, %r8d
	movl %esi, %ecx
	orl %r8d, %ecx
.LB17369:
	cmpq %rax, %rdx
	jge .LB17372
.LB17370:
	movzbl -1592(%rbp,%rdx,1), %esi
	movzbl -1080(%rbp,%rdx,1), %edi
	xorl %edi, %esi
	orl %esi, %ecx
	incq %rdx
	cmpq %rax, %rdx
	jl .LB17370
.LB17372:
	xorl %eax, %eax
	testb %cl, %cl
	sete %al
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB17365:
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
.LB17356:
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
.LB17345:
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
	.globl standard__crypto__RSA__rsa_mgf1__5__intE1__byteE1_ptr1__intE1__byteE1_ptr1__intE1__ret_voidE1
	.def standard__crypto__RSA__rsa_mgf1__5__intE1__byteE1_ptr1__intE1__byteE1_ptr1__intE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__RSA__rsa_mgf1__5__intE1__byteE1_ptr1__intE1__byteE1_ptr1__intE1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $1312, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
	movq %r14, -48(%rbp)
	movq %r15, -56(%rbp)
.LB17390:
	movl 48(%rbp), %r14d
	movl %ecx, %esi
	movq %rdx, %rbx
	movl %r8d, %r12d
	movq %r9, %r13
	movl .LZERO(%rip), %r10d
	movl %r10d, -60(%rbp)
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -124(%rbp)
	vmovdqu .LZERO+32(%rip), %ymm15
	vmovdqu %ymm15, -92(%rbp)
	vzeroupper
	leaq -1224(%rbp), %rax
	movq %rax, %rdi
	xorl %eax, %eax
	movl $1100, %ecx
	rep stosb
	movq %rsi, %rcx
	callq standard__crypto__RSA__rsa_hash_len__1__intE1__ret_intE1
	movl %eax, %edi
	movslq %r12d, %rax
	xorl %ecx, %ecx
	testq %rax, %rax
	cmovg %rax, %rcx
	shrq $2, %rcx
	xorl %edx, %edx
.LB32105:
	testq %rcx, %rcx
	je .LB32107
.LB32106:
	movzbl (%rbx,%rdx,1), %r8d
	movb %r8b, -1224(%rbp,%rdx,1)
	movzbl 1(%rbx,%rdx,1), %r8d
	movb %r8b, -1223(%rbp,%rdx,1)
	movzbl 2(%rbx,%rdx,1), %r8d
	movb %r8b, -1222(%rbp,%rdx,1)
	movzbl 3(%rbx,%rdx,1), %r8d
	movb %r8b, -1221(%rbp,%rdx,1)
	addq $4, %rdx
	decq %rcx
	jne .LB32106
.LB32107:
.LB17407:
	cmpq %rax, %rdx
	jge .LB17410
.LB17408:
	movzbl (%rbx,%rdx,1), %ecx
	movb %cl, -1224(%rbp,%rdx,1)
	incq %rdx
	cmpq %rax, %rdx
	jl .LB17408
.LB17410:
	leal 1(%r12), %eax
	movq %rax, -1264(%rbp)
	leal 2(%r12), %ebx
	leal 3(%r12), %eax
	movq %rax, -1232(%rbp)
	leal 4(%r12), %eax
	movq %rax, -1240(%rbp)
	movq $0, -1248(%rbp)
	movq $0, -1256(%rbp)
.LB17422:
	movq -1248(%rbp), %rax
	cmpl %r14d, %eax
	jge .LB17424
.LB17423:
	movq -1256(%rbp), %rax
	movslq %r12d, %rdx
	xorl %r9d, %r9d
	movl %eax, %ecx
	shrl $24, %ecx
	andl $255, %ecx
	shrl $16, %eax
	andl $255, %eax
	movb %cl, -1224(%rbp,%rdx,1)
	movq -1264(%rbp), %rcx
	movslq %ebx, %rdx
	movslq %ecx, %rcx
	movb %al, -1224(%rbp,%rcx,1)
	movq -1256(%rbp), %rax
	movl %eax, %ecx
	shrl $8, %ecx
	andl $255, %ecx
	andl $255, %eax
	movb %cl, -1224(%rbp,%rdx,1)
	movq -1232(%rbp), %rcx
	leaq -1224(%rbp), %rdx
	movslq %ecx, %rcx
	movb %al, -1224(%rbp,%rcx,1)
	leaq -124(%rbp), %rax
	movq $0, 32(%rsp)
	movq %rsi, %rcx
	movq %rax, 40(%rsp)
	movq -1240(%rbp), %r8
	callq standard__crypto__RSA__rsa_hash2__6__intE1__byteE1_ptr1__intE1__byteE1_ptr1__intE1__byteE1_ptr1__ret_voidE1
	movq -1248(%rbp), %rax
	negl %eax
	addl %r14d, %eax
	cmpl %edi, %eax
	cmovg %edi, %eax
	xorl %ecx, %ecx
	testl %eax, %eax
	cmovg %eax, %ecx
	shrl $2, %ecx
	xorl %edx, %edx
.LB32108:
	testl %ecx, %ecx
	je .LB32110
.LB32109:
	movslq %edx, %r8
	movzbl -124(%rbp,%r8,1), %r8d
	movq -1248(%rbp), %r9
	leal (%r9,%rdx), %r15d
	movslq %r15d, %r15
	movb %r8b, (%r13,%r15,1)
	leal 1(%rdx), %r8d
	movslq %r8d, %r15
	movzbl -124(%rbp,%r15,1), %r15d
	addl %r8d, %r9d
	movslq %r9d, %r8
	movb %r15b, (%r13,%r8,1)
	leal 2(%rdx), %r8d
	movslq %r8d, %r9
	movzbl -124(%rbp,%r9,1), %r9d
	movq -1248(%rbp), %r15
	addl %r15d, %r8d
	movslq %r8d, %r8
	movb %r9b, (%r13,%r8,1)
	leal 3(%rdx), %r8d
	movslq %r8d, %r9
	movzbl -124(%rbp,%r9,1), %r9d
	addl %r8d, %r15d
	movslq %r15d, %r8
	movb %r9b, (%r13,%r8,1)
	addl $4, %edx
	decl %ecx
	jne .LB32109
	jmp .LB32110
.LB17424:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB32110:
.LB17471:
	cmpl %eax, %edx
	jge .LB17474
.LB17472:
	movslq %edx, %rcx
	movzbl -124(%rbp,%rcx,1), %ecx
	movq -1248(%rbp), %r8
	addl %edx, %r8d
	movslq %r8d, %r8
	movb %cl, (%r13,%r8,1)
	incl %edx
	cmpl %eax, %edx
	jl .LB17472
.LB17474:
	movq -1248(%rbp), %rcx
	addl %eax, %ecx
	movq -1256(%rbp), %rax
	incl %eax
	movq %rcx, -1248(%rbp)
	movq %rax, -1256(%rbp)
	jmp .LB17422
	.text
	.globl standard__crypto__RSA__rsa_pss_verify__8__byteE1_ptr1__intE1__byteE1_ptr1__intE1__intE1__byteE1_ptr1__byteE1_ptr1__intE1__ret_boolE1
	.def standard__crypto__RSA__rsa_pss_verify__8__byteE1_ptr1__intE1__byteE1_ptr1__intE1__intE1__byteE1_ptr1__byteE1_ptr1__intE1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__RSA__rsa_pss_verify__8__byteE1_ptr1__intE1__byteE1_ptr1__intE1__intE1__byteE1_ptr1__byteE1_ptr1__intE1__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $1424, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
	movq %r14, -48(%rbp)
	movq %r15, -56(%rbp)
.LB17493:
	movq %rcx, %rsi
	movl %edx, %ebx
	movl %r9d, %r12d
	movq %r8, -1368(%rbp)
	movl 48(%rbp), %r13d
	movq 56(%rbp), %r14
	movq 64(%rbp), %rax
	movl $512, %ecx
	movq %rax, -1352(%rbp)
	movl 72(%rbp), %eax
	movq %rax, -1360(%rbp)
	leaq -568(%rbp), %rax
	movq %rax, %rdi
	xorl %eax, %eax
	rep stosb
	leaq -1080(%rbp), %rax
	movq %rax, %rdi
	xorl %eax, %eax
	movl $512, %ecx
	rep stosb
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -1144(%rbp)
	vmovdqu .LZERO+32(%rip), %ymm15
	vmovdqu %ymm15, -1112(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -1208(%rbp)
	vmovdqu .LZERO+32(%rip), %ymm15
	vmovdqu %ymm15, -1176(%rbp)
	vzeroupper
	leaq -1344(%rbp), %rax
	movq %rax, %rdi
	xorl %eax, %eax
	movl $136, %ecx
	rep stosb
	movq %r13, %rcx
	callq standard__crypto__RSA__rsa_hash_len__1__intE1__ret_intE1
	movl %eax, %edi
	testl %edi, %edi
	je .LB17527
.LB17528:
	movq %rsi, %rcx
	movq %rbx, %rdx
	callq standard__crypto__RSA__rsa_byte_len__2__byteE1_ptr1__intE1__ret_intE1
	movl %eax, %r15d
	cmpl $12, %r15d
	jl .LB17547
.LB17536:
	cmpl $512, %r15d
	jg .LB17547
.LB17541:
	movq -1360(%rbp), %rax
	cmpl %r15d, %eax
	jne .LB17547
.LB17548:
	movq -1368(%rbp), %rax
	leaq -568(%rbp), %rcx
	movq %rsi, %r8
	movq %rbx, %r9
	movq %rax, 32(%rsp)
	movq %r12, 40(%rsp)
	movq -1352(%rbp), %rdx
	callq standard__crypto__RSA__rsa_public_op__6__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__intE1__byteE1_ptr1__intE1__ret_boolE1
	testb %al, %al
	je .LB17558
.LB17559:
	movl %r15d, %eax
	shll $3, %eax
	subl %r15d, %ebx
	movslq %ebx, %rcx
	movzbl (%rsi,%rcx,1), %ecx
.LB17569:
	movl %ecx, %edx
	andl $128, %edx
	testb %dl, %dl
	jne .LB17571
.LB17570:
	shll $1, %ecx
	decl %eax
	jmp .LB17569
.LB17571:
	decl %eax
	leal 7(%rax), %ecx
	movl %ecx, %edx
	sarl $31, %edx
	shrl $29, %edx
	addl %edx, %ecx
	sarl $3, %ecx
	movl %ecx, %edx
	shll $3, %edx
	movl %edx, %esi
	subl %eax, %esi
	subl %ecx, %r15d
	movslq %r15d, %rax
	xorl %edx, %edx
.LB17591:
	cmpq %rax, %rdx
	jge .LB17594
.LB17592:
	cmpb $0, -568(%rbp,%rdx,1)
	jne .LB17605
.LB17606:
	incq %rdx
	cmpq %rax, %rdx
	jl .LB17592
.LB17594:
	movslq %r15d, %rax
	leaq -568(%rbp,%rax,1), %rbx
	leal (%rdi,%rdi), %eax
	addl $2, %eax
	cmpl %eax, %ecx
	jl .LB17620
.LB17621:
	leal -1(%rcx), %eax
	movslq %eax, %rax
	cmpb $188, (%rbx,%rax,1)
	jne .LB17630
.LB17631:
	subl %edi, %ecx
	leal -1(%rcx), %r12d
	testl %esi, %esi
	jg .LB17639
.LB17641:
	movslq %r12d, %rax
	leaq (%rbx,%rax,1), %rdx
	leaq -1080(%rbp), %r9
	movq %r12, 32(%rsp)
	movq %r13, %rcx
	movq %rdi, %r8
	callq standard__crypto__RSA__rsa_mgf1__5__intE1__byteE1_ptr1__intE1__byteE1_ptr1__intE1__ret_voidE1
	movslq %r12d, %rax
	xorl %ecx, %ecx
	testq %rax, %rax
	cmovg %rax, %rcx
	shrq $2, %rcx
	xorl %edx, %edx
.LB32111:
	testq %rcx, %rcx
	je .LB32113
.LB32112:
	movzbl -1080(%rbp,%rdx,1), %r8d
	movzbl (%rbx,%rdx,1), %r9d
	xorl %r9d, %r8d
	movb %r8b, -1080(%rbp,%rdx,1)
	movzbl -1079(%rbp,%rdx,1), %r8d
	movzbl 1(%rbx,%rdx,1), %r9d
	xorl %r9d, %r8d
	movb %r8b, -1079(%rbp,%rdx,1)
	movzbl -1078(%rbp,%rdx,1), %r8d
	movzbl 2(%rbx,%rdx,1), %r9d
	xorl %r9d, %r8d
	movb %r8b, -1078(%rbp,%rdx,1)
	movzbl -1077(%rbp,%rdx,1), %r8d
	movzbl 3(%rbx,%rdx,1), %r9d
	xorl %r9d, %r8d
	movb %r8b, -1077(%rbp,%rdx,1)
	addq $4, %rdx
	decq %rcx
	jne .LB32112
	jmp .LB32113
.LB17639:
	movzbl (%rbx), %eax
	movl $8, %ecx
	subl %esi, %ecx
	movl $255, %edx
	shlx %ecx, %edx, %ecx
	andl %ecx, %eax
	testb %al, %al
	jne .LB17652
	jmp .LB17641
.LB32113:
.LB17662:
	cmpq %rax, %rdx
	jge .LB17665
.LB17663:
	movzbl -1080(%rbp,%rdx,1), %ecx
	movzbl (%rbx,%rdx,1), %r8d
	xorl %r8d, %ecx
	movb %cl, -1080(%rbp,%rdx,1)
	incq %rdx
	cmpq %rax, %rdx
	jl .LB17663
.LB17665:
	testl %esi, %esi
	jg .LB17683
.LB17685:
	movl %r12d, %eax
	subl %edi, %eax
	decl %eax
	movslq %eax, %rcx
	xorl %edx, %edx
.LB17697:
	cmpq %rcx, %rdx
	jge .LB17700
.LB17698:
	cmpb $0, -1080(%rbp,%rdx,1)
	jne .LB17709
.LB17710:
	incq %rdx
	cmpq %rcx, %rdx
	jl .LB17698
	jmp .LB17700
.LB17683:
	movzbl -1080(%rbp), %eax
	movl $255, %ecx
	sarx %esi, %ecx, %ecx
	andl %ecx, %eax
	movb %al, -1080(%rbp)
	jmp .LB17685
.LB17700:
	movslq %eax, %rcx
	cmpb $1, -1080(%rbp,%rcx,1)
	jne .LB17719
.LB17720:
	movl $0, -1344(%rbp)
	movl $0, -1340(%rbp)
	xorl %ecx, %ecx
	testl %edi, %edi
	cmovg %edi, %ecx
	shrl $2, %ecx
	xorl %edx, %edx
.LB32114:
	testl %ecx, %ecx
	je .LB32116
.LB32115:
	movslq %edx, %rsi
	movzbl (%r14,%rsi,1), %esi
	leal 8(%rdx), %r8d
	movslq %r8d, %r8
	movb %sil, -1344(%rbp,%r8,1)
	leal 1(%rdx), %esi
	movslq %esi, %r8
	movzbl (%r14,%r8,1), %r8d
	addl $8, %esi
	movslq %esi, %rsi
	movb %r8b, -1344(%rbp,%rsi,1)
	leal 2(%rdx), %esi
	movslq %esi, %r8
	movzbl (%r14,%r8,1), %r8d
	addl $8, %esi
	movslq %esi, %rsi
	movb %r8b, -1344(%rbp,%rsi,1)
	leal 3(%rdx), %esi
	movslq %esi, %r8
	movzbl (%r14,%r8,1), %r8d
	addl $8, %esi
	movslq %esi, %rsi
	movb %r8b, -1344(%rbp,%rsi,1)
	addl $4, %edx
	decl %ecx
	jne .LB32115
.LB32116:
.LB17733:
	cmpl %edi, %edx
	jge .LB17736
.LB17734:
	movslq %edx, %rcx
	movzbl (%r14,%rcx,1), %ecx
	leal 8(%rdx), %esi
	movslq %esi, %rsi
	movb %cl, -1344(%rbp,%rsi,1)
	incl %edx
	cmpl %edi, %edx
	jl .LB17734
.LB17736:
	incl %eax
	leal 8(%rdi), %ecx
	xorl %edx, %edx
	testl %edi, %edi
	cmovg %edi, %edx
	shrl $2, %edx
	xorl %esi, %esi
.LB32117:
	testl %edx, %edx
	je .LB32119
.LB32118:
	leal (%rax,%rsi), %r8d
	movslq %r8d, %r8
	movzbl -1080(%rbp,%r8,1), %r8d
	leal (%rcx,%rsi), %r9d
	movslq %r9d, %r9
	movb %r8b, -1344(%rbp,%r9,1)
	leal 1(%rsi), %r8d
	leal (%rax,%r8), %r9d
	movslq %r9d, %r9
	movzbl -1080(%rbp,%r9,1), %r9d
	addl %ecx, %r8d
	movslq %r8d, %r8
	movb %r9b, -1344(%rbp,%r8,1)
	leal 2(%rsi), %r8d
	leal (%rax,%r8), %r9d
	movslq %r9d, %r9
	movzbl -1080(%rbp,%r9,1), %r9d
	addl %ecx, %r8d
	movslq %r8d, %r8
	movb %r9b, -1344(%rbp,%r8,1)
	leal 3(%rsi), %r8d
	leal (%rax,%r8), %r9d
	movslq %r9d, %r9
	movzbl -1080(%rbp,%r9,1), %r9d
	addl %ecx, %r8d
	movslq %r8d, %r8
	movb %r9b, -1344(%rbp,%r8,1)
	addl $4, %esi
	decl %edx
	jne .LB32118
.LB32119:
.LB17749:
	cmpl %edi, %esi
	jge .LB17752
.LB17750:
	leal (%rax,%rsi), %edx
	movslq %edx, %rdx
	movzbl -1080(%rbp,%rdx,1), %edx
	leal (%rcx,%rsi), %r8d
	movslq %r8d, %r8
	movb %dl, -1344(%rbp,%r8,1)
	incl %esi
	cmpl %edi, %esi
	jl .LB17750
.LB17752:
	leal 8(%rdi), %eax
	leaq -1344(%rbp), %rdx
	movq $0, 32(%rsp)
	movq %r13, %rcx
	leal (%rax,%rdi), %r8d
	leaq -1144(%rbp), %rax
	xorl %r9d, %r9d
	movq %rax, 40(%rsp)
	callq standard__crypto__RSA__rsa_hash2__6__intE1__byteE1_ptr1__intE1__byteE1_ptr1__intE1__byteE1_ptr1__ret_voidE1
	xorl %eax, %eax
	testl %edi, %edi
	cmovg %edi, %eax
	shrl $2, %eax
	xorl %ecx, %ecx
	xorl %edx, %edx
	xorl %esi, %esi
	xorl %r8d, %r8d
	xorl %r9d, %r9d
.LB32120:
	testl %eax, %eax
	je .LB32122
.LB32121:
	leal (%r12,%rcx), %r14d
	movslq %ecx, %r13
	movzbl -1144(%rbp,%r13,1), %r13d
	movslq %r14d, %r14
	movzbl (%rbx,%r14,1), %r14d
	xorl %r14d, %r13d
	orl %r13d, %edx
	leal 1(%rcx), %r13d
	movslq %r13d, %r14
	addl %r12d, %r13d
	movzbl -1144(%rbp,%r14,1), %r14d
	movslq %r13d, %r13
	movzbl (%rbx,%r13,1), %r13d
	xorl %r13d, %r14d
	orl %r14d, %esi
	leal 2(%rcx), %r13d
	movslq %r13d, %r14
	addl %r12d, %r13d
	movzbl -1144(%rbp,%r14,1), %r14d
	movslq %r13d, %r13
	movzbl (%rbx,%r13,1), %r13d
	xorl %r13d, %r14d
	orl %r14d, %r8d
	leal 3(%rcx), %r13d
	movslq %r13d, %r14
	addl %r12d, %r13d
	movzbl -1144(%rbp,%r14,1), %r14d
	movslq %r13d, %r13
	movzbl (%rbx,%r13,1), %r13d
	xorl %r13d, %r14d
	orl %r14d, %r9d
	addl $4, %ecx
	decl %eax
	jne .LB32121
.LB32122:
	orl %esi, %edx
	orl %r9d, %r8d
	movl %edx, %eax
	orl %r8d, %eax
.LB17779:
	cmpl %edi, %ecx
	jge .LB17782
.LB17780:
	leal (%r12,%rcx), %esi
	movslq %ecx, %rdx
	movzbl -1144(%rbp,%rdx,1), %edx
	movslq %esi, %rsi
	movzbl (%rbx,%rsi,1), %esi
	xorl %esi, %edx
	orl %edx, %eax
	incl %ecx
	cmpl %edi, %ecx
	jl .LB17780
.LB17782:
	xorl %ecx, %ecx
	testb %al, %al
	sete %cl
	movl %ecx, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB17719:
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
.LB17709:
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
.LB17652:
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
.LB17630:
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
.LB17620:
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
.LB17605:
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
.LB17558:
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
.LB17547:
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
.LB17527:
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
	.globl standard__crypto__P384__p384_fmul__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	.def standard__crypto__P384__p384_fmul__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__P384__p384_fmul__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB17803:
	movq %rcx, %rsi
	movq %rdx, %rdi
	movq %rsi, %rcx
	movq %rdi, %rdx
	callq standard__crypto__RSA__rsa_mont_mul__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	movl 1540(%rsi), %eax
	movslq %eax, %rcx
	movl $12, %edx
	subq %rcx, %rdx
	cmpq $16, %rdx
	jge .LB32123
.LB32124:
	xorl %esi, %esi
	cmpl $12, %eax
	cmovl %rdx, %rsi
	movq %rsi, %rax
	shrq $2, %rax
.LB32125:
	testq %rax, %rax
	je .LB32127
.LB32126:
	movl $0, (%rdi,%rcx,4)
	movl $0, 4(%rdi,%rcx,4)
	movl $0, 8(%rdi,%rcx,4)
	movl $0, 12(%rdi,%rcx,4)
	addq $4, %rcx
	decq %rax
	jne .LB32126
.LB32127:
.LB17814:
	cmpq $12, %rcx
	jge .LB17817
.LB17815:
	movl $0, (%rdi,%rcx,4)
	incq %rcx
	cmpq $12, %rcx
	jl .LB17815
	jmp .LB17817
.LB32123:
	leaq (%rdi,%rcx,4), %rdi
	movq %rdx, %rax
	sarq $63, %rax
	notq %rax
	andq %rax, %rdx
	movq %rdx, %rcx
	shlq $2, %rcx
	xorl %eax, %eax
	rep stosb
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB17817:
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__crypto__P384__p384_zero__1__uintE1_ptr1__ret_voidE1
	.def standard__crypto__P384__p384_zero__1__uintE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__P384__p384_zero__1__uintE1_ptr1__ret_voidE1:
.LB17829:
	vpxor %xmm15, %xmm15, %xmm15
	vmovdqu %ymm15, (%rcx)
	vmovdqu %ymm15, 16(%rcx)
	vzeroupper
	ret
	.text
	.globl standard__crypto__P384__p384_copy__2__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	.def standard__crypto__P384__p384_copy__2__uintE1_ptr1__uintE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__P384__p384_copy__2__uintE1_ptr1__uintE1_ptr1__ret_voidE1:
.LB17843:
	movl (%rdx), %eax
	movl %eax, (%rcx)
	movl 4(%rdx), %eax
	movl %eax, 4(%rcx)
	movl 8(%rdx), %eax
	movl %eax, 8(%rcx)
	movl 12(%rdx), %eax
	movl %eax, 12(%rcx)
	movl 16(%rdx), %eax
	movl %eax, 16(%rcx)
	movl 20(%rdx), %eax
	movl %eax, 20(%rcx)
	movl 24(%rdx), %eax
	movl %eax, 24(%rcx)
	movl 28(%rdx), %eax
	movl %eax, 28(%rcx)
	movl 32(%rdx), %eax
	movl %eax, 32(%rcx)
	movl 36(%rdx), %eax
	movl %eax, 36(%rcx)
	movl 40(%rdx), %eax
	movl %eax, 40(%rcx)
	movl 44(%rdx), %eax
	movl %eax, 44(%rcx)
	ret
	.text
	.globl standard__crypto__P384__p384_iszero__1__uintE1_ptr1__ret_boolE1
	.def standard__crypto__P384__p384_iszero__1__uintE1_ptr1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__P384__p384_iszero__1__uintE1_ptr1__ret_boolE1:
.LB17862:
	xorl %eax, %eax
.LB17865:
	cmpq $12, %rax
	jge .LB17868
.LB17866:
	cmpl $0, (%rcx,%rax,4)
	jne .LB17876
.LB17877:
	incq %rax
	cmpq $12, %rax
	jl .LB17866
.LB17868:
	movl $1, %eax
	ret
.LB17876:
	xorl %eax, %eax
	ret
	.text
	.globl standard__crypto__P384__p384_addmod__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	.def standard__crypto__P384__p384_addmod__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__P384__p384_addmod__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB17881:
	movq %rcx, %rsi
	movq %rdx, %rdi
	movq %r8, %rdx
	movq %r9, %r8
	movq %rdi, %rcx
	movl $12, %r9d
	callq standard__crypto__RSA__rsa_add__4__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__intE1__ret_uintE1
	testl %eax, %eax
	jne .LB17902
.LB17893:
	movq %rsi, %rdx
	movq %rdi, %rcx
	movl $12, %r8d
	callq standard__crypto__RSA__rsa_cmp__3__uintE1_ptr1__uintE1_ptr1__intE1__ret_intE1
	testl %eax, %eax
	jns .LB17902
.LB17903:
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB17902:
	movq %rsi, %r8
	movq %rdi, %rcx
	movq %rdi, %rdx
	movl $12, %r9d
	callq standard__crypto__RSA__rsa_sub__4__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__intE1__ret_uintE1
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__crypto__P384__p384_submod__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	.def standard__crypto__P384__p384_submod__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__P384__p384_submod__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB17911:
	movq %rcx, %rsi
	movq %rdx, %rdi
	movq %r8, %rdx
	movq %r9, %r8
	movq %rdi, %rcx
	movl $12, %r9d
	callq standard__crypto__RSA__rsa_sub__4__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__intE1__ret_uintE1
	testl %eax, %eax
	jne .LB17923
.LB17924:
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB17923:
	movq %rsi, %r8
	movq %rdi, %rcx
	movq %rdi, %rdx
	movl $12, %r9d
	callq standard__crypto__RSA__rsa_add__4__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__intE1__ret_uintE1
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__crypto__P384__p384_nmul__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	.def standard__crypto__P384__p384_nmul__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__P384__p384_nmul__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $112, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
.LB17932:
	movq %rcx, %rsi
	movq %rdx, %rdi
	movq %r9, %rbx
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -72(%rbp)
	movups .LZERO+32(%rip), %xmm15
	movups %xmm15, -40(%rbp)
	vzeroupper
	leaq -72(%rbp), %rdx
	leaq 512(%rsi), %r9
	movq %rsi, %rcx
	callq standard__crypto__P384__p384_fmul__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	leaq -72(%rbp), %r8
	movq %rsi, %rcx
	movq %rdi, %rdx
	movq %rbx, %r9
	callq standard__crypto__P384__p384_fmul__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__crypto__P384__p384_inv__3__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	.def standard__crypto__P384__p384_inv__3__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__P384__p384_inv__3__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $160, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
.LB17950:
	movq %rcx, %rsi
	movq %rdx, %rdi
	movq %r8, %rbx
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -72(%rbp)
	movups .LZERO+32(%rip), %xmm15
	movups %xmm15, -40(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -120(%rbp)
	movups .LZERO+32(%rip), %xmm15
	movups %xmm15, -88(%rbp)
	vzeroupper
	leaq -120(%rbp), %rcx
	callq standard__crypto__P384__p384_zero__1__uintE1_ptr1__ret_voidE1
	movl $2, -120(%rbp)
	leaq -72(%rbp), %rcx
	movq %rsi, %rdx
	leaq -120(%rbp), %r8
	movl $12, %r9d
	callq standard__crypto__RSA__rsa_sub__4__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__intE1__ret_uintE1
	leaq -72(%rbp), %r9
	movq $12, 32(%rsp)
	movq %rsi, %rcx
	movq %rdi, %rdx
	movq %rbx, %r8
	callq standard__crypto__RSA__rsa_mont_exp__5__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__intE1__ret_voidE1
	movl 1540(%rsi), %eax
	movslq %eax, %rcx
	movl $12, %edx
	subq %rcx, %rdx
	cmpq $16, %rdx
	jge .LB32128
.LB32129:
	xorl %esi, %esi
	cmpl $12, %eax
	cmovl %rdx, %rsi
	movq %rsi, %rax
	shrq $2, %rax
.LB32130:
	testq %rax, %rax
	je .LB32132
.LB32131:
	movl $0, (%rdi,%rcx,4)
	movl $0, 4(%rdi,%rcx,4)
	movl $0, 8(%rdi,%rcx,4)
	movl $0, 12(%rdi,%rcx,4)
	addq $4, %rcx
	decq %rax
	jne .LB32131
.LB32132:
.LB17970:
	cmpq $12, %rcx
	jge .LB17973
.LB17971:
	movl $0, (%rdi,%rcx,4)
	incq %rcx
	cmpq $12, %rcx
	jl .LB17971
	jmp .LB17973
.LB32128:
	leaq (%rdi,%rcx,4), %rdi
	movq %rdx, %rax
	sarq $63, %rax
	notq %rax
	andq %rax, %rdx
	movq %rdx, %rcx
	shlq $2, %rcx
	xorl %eax, %eax
	rep stosb
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB17973:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__crypto__P384__p384_to_mont__3__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	.def standard__crypto__P384__p384_to_mont__3__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__P384__p384_to_mont__3__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB17985:
	leaq 512(%rcx), %r9
	callq standard__crypto__P384__p384_fmul__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	leave
	ret
	.text
	.globl standard__crypto__P384__p384_from_mont__3__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	.def standard__crypto__P384__p384_from_mont__3__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__P384__p384_from_mont__3__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $112, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
.LB17996:
	movq %rcx, %rsi
	movq %rdx, %rdi
	movq %r8, %rbx
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -72(%rbp)
	movups .LZERO+32(%rip), %xmm15
	movups %xmm15, -40(%rbp)
	vzeroupper
	leaq -72(%rbp), %rcx
	callq standard__crypto__P384__p384_zero__1__uintE1_ptr1__ret_voidE1
	movl $1, -72(%rbp)
	leaq -72(%rbp), %r9
	movq %rsi, %rcx
	movq %rdi, %rdx
	movq %rbx, %r8
	callq standard__crypto__P384__p384_fmul__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__crypto__P384__p384_set_inf__1__P384_PTE1_ptr1__ret_voidE1
	.def standard__crypto__P384__p384_set_inf__1__P384_PTE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__P384__p384_set_inf__1__P384_PTE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
.LB18008:
	movq %rcx, %rsi
	movq %rsi, %rcx
	callq standard__crypto__P384__p384_zero__1__uintE1_ptr1__ret_voidE1
	leaq 48(%rsi), %rcx
	callq standard__crypto__P384__p384_zero__1__uintE1_ptr1__ret_voidE1
	leaq 96(%rsi), %rcx
	callq standard__crypto__P384__p384_zero__1__uintE1_ptr1__ret_voidE1
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl standard__crypto__P384__p384_dbl__3__RSA_MONTE1_ptr1__P384_PTE1_ptr1__P384_PTE1_ptr1__ret_voidE1
	.def standard__crypto__P384__p384_dbl__3__RSA_MONTE1_ptr1__P384_PTE1_ptr1__P384_PTE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__P384__p384_dbl__3__RSA_MONTE1_ptr1__P384_PTE1_ptr1__P384_PTE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $736, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
.LB18019:
	movq %rcx, %rsi
	movq %rdx, %rdi
	movq %r8, %rbx
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -72(%rbp)
	movups .LZERO+32(%rip), %xmm15
	movups %xmm15, -40(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -120(%rbp)
	movups .LZERO+32(%rip), %xmm15
	movups %xmm15, -88(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -168(%rbp)
	movups .LZERO+32(%rip), %xmm15
	movups %xmm15, -136(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -216(%rbp)
	movups .LZERO+32(%rip), %xmm15
	movups %xmm15, -184(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -264(%rbp)
	movups .LZERO+32(%rip), %xmm15
	movups %xmm15, -232(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -312(%rbp)
	movups .LZERO+32(%rip), %xmm15
	movups %xmm15, -280(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -360(%rbp)
	movups .LZERO+32(%rip), %xmm15
	movups %xmm15, -328(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -408(%rbp)
	movups .LZERO+32(%rip), %xmm15
	movups %xmm15, -376(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -456(%rbp)
	movups .LZERO+32(%rip), %xmm15
	movups %xmm15, -424(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -504(%rbp)
	movups .LZERO+32(%rip), %xmm15
	movups %xmm15, -472(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -552(%rbp)
	movups .LZERO+32(%rip), %xmm15
	movups %xmm15, -520(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -600(%rbp)
	movups .LZERO+32(%rip), %xmm15
	movups %xmm15, -568(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -648(%rbp)
	movups .LZERO+32(%rip), %xmm15
	movups %xmm15, -616(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -696(%rbp)
	movups .LZERO+32(%rip), %xmm15
	movups %xmm15, -664(%rbp)
	vzeroupper
	leaq 96(%rbx), %rcx
	callq standard__crypto__P384__p384_iszero__1__uintE1_ptr1__ret_boolE1
	testb %al, %al
	jne .LB18052
.LB18045:
	leaq 48(%rbx), %rcx
	callq standard__crypto__P384__p384_iszero__1__uintE1_ptr1__ret_boolE1
	testb %al, %al
	jne .LB18052
.LB18053:
	leaq -72(%rbp), %rdx
	leaq 96(%rbx), %r8
	leaq 96(%rbx), %r9
	movq %rsi, %rcx
	callq standard__crypto__P384__p384_fmul__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	leaq -120(%rbp), %rdx
	leaq 48(%rbx), %r8
	leaq 48(%rbx), %r9
	movq %rsi, %rcx
	callq standard__crypto__P384__p384_fmul__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	leaq -168(%rbp), %rdx
	movq %rbx, %r8
	leaq -120(%rbp), %r9
	movq %rsi, %rcx
	callq standard__crypto__P384__p384_fmul__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	leaq -216(%rbp), %rdx
	movq %rbx, %r8
	leaq -72(%rbp), %r9
	movq %rsi, %rcx
	callq standard__crypto__P384__p384_submod__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	leaq -264(%rbp), %rdx
	movq %rbx, %r8
	leaq -72(%rbp), %r9
	movq %rsi, %rcx
	callq standard__crypto__P384__p384_addmod__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	leaq -312(%rbp), %rdx
	leaq -216(%rbp), %r8
	leaq -264(%rbp), %r9
	movq %rsi, %rcx
	callq standard__crypto__P384__p384_fmul__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	leaq -360(%rbp), %rdx
	leaq -312(%rbp), %r8
	leaq -312(%rbp), %r9
	movq %rsi, %rcx
	callq standard__crypto__P384__p384_addmod__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	leaq -360(%rbp), %rdx
	leaq -360(%rbp), %r8
	leaq -312(%rbp), %r9
	movq %rsi, %rcx
	callq standard__crypto__P384__p384_addmod__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	leaq -408(%rbp), %rdx
	leaq -168(%rbp), %r8
	leaq -168(%rbp), %r9
	movq %rsi, %rcx
	callq standard__crypto__P384__p384_addmod__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	leaq -456(%rbp), %rdx
	leaq -408(%rbp), %r8
	leaq -408(%rbp), %r9
	movq %rsi, %rcx
	callq standard__crypto__P384__p384_addmod__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	leaq -504(%rbp), %rdx
	leaq -456(%rbp), %r8
	leaq -456(%rbp), %r9
	movq %rsi, %rcx
	callq standard__crypto__P384__p384_addmod__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	leaq -552(%rbp), %rdx
	leaq -360(%rbp), %r8
	leaq -360(%rbp), %r9
	movq %rsi, %rcx
	callq standard__crypto__P384__p384_fmul__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	leaq -552(%rbp), %rdx
	leaq -552(%rbp), %r8
	leaq -504(%rbp), %r9
	movq %rsi, %rcx
	callq standard__crypto__P384__p384_submod__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	leaq -216(%rbp), %rdx
	leaq 48(%rbx), %r8
	leaq 96(%rbx), %r9
	movq %rsi, %rcx
	callq standard__crypto__P384__p384_addmod__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	leaq -648(%rbp), %rdx
	leaq -216(%rbp), %r8
	leaq -216(%rbp), %r9
	movq %rsi, %rcx
	callq standard__crypto__P384__p384_fmul__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	leaq -648(%rbp), %rdx
	leaq -648(%rbp), %r8
	leaq -120(%rbp), %r9
	movq %rsi, %rcx
	callq standard__crypto__P384__p384_submod__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	leaq -648(%rbp), %rdx
	leaq -648(%rbp), %r8
	leaq -72(%rbp), %r9
	movq %rsi, %rcx
	callq standard__crypto__P384__p384_submod__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	leaq -216(%rbp), %rdx
	leaq -456(%rbp), %r8
	leaq -552(%rbp), %r9
	movq %rsi, %rcx
	callq standard__crypto__P384__p384_submod__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	leaq -600(%rbp), %rdx
	leaq -360(%rbp), %r8
	leaq -216(%rbp), %r9
	movq %rsi, %rcx
	callq standard__crypto__P384__p384_fmul__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	leaq -696(%rbp), %rdx
	leaq -120(%rbp), %r8
	leaq -120(%rbp), %r9
	movq %rsi, %rcx
	callq standard__crypto__P384__p384_fmul__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	leaq -696(%rbp), %rdx
	leaq -696(%rbp), %r8
	leaq -696(%rbp), %r9
	movq %rsi, %rcx
	callq standard__crypto__P384__p384_addmod__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	leaq -696(%rbp), %rdx
	leaq -696(%rbp), %r8
	leaq -696(%rbp), %r9
	movq %rsi, %rcx
	callq standard__crypto__P384__p384_addmod__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	leaq -696(%rbp), %rdx
	leaq -696(%rbp), %r8
	leaq -696(%rbp), %r9
	movq %rsi, %rcx
	callq standard__crypto__P384__p384_addmod__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	leaq -600(%rbp), %rdx
	leaq -600(%rbp), %r8
	leaq -696(%rbp), %r9
	movq %rsi, %rcx
	callq standard__crypto__P384__p384_submod__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	movq %rdi, %rcx
	leaq -552(%rbp), %rdx
	callq standard__crypto__P384__p384_copy__2__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	leaq 48(%rdi), %rcx
	leaq -600(%rbp), %rdx
	callq standard__crypto__P384__p384_copy__2__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	leaq 96(%rdi), %rcx
	leaq -648(%rbp), %rdx
	callq standard__crypto__P384__p384_copy__2__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB18052:
	movq %rdi, %rcx
	callq standard__crypto__P384__p384_set_inf__1__P384_PTE1_ptr1__ret_voidE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__crypto__P384__p384_add__4__RSA_MONTE1_ptr1__P384_PTE1_ptr1__P384_PTE1_ptr1__P384_PTE1_ptr1__ret_voidE1
	.def standard__crypto__P384__p384_add__4__RSA_MONTE1_ptr1__P384_PTE1_ptr1__P384_PTE1_ptr1__P384_PTE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__P384__p384_add__4__RSA_MONTE1_ptr1__P384_PTE1_ptr1__P384_PTE1_ptr1__P384_PTE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $832, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
.LB18207:
	movq %rcx, %rsi
	movq %rdx, %rdi
	movq %r8, %rbx
	movq %r9, %r12
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -80(%rbp)
	movups .LZERO+32(%rip), %xmm15
	movups %xmm15, -48(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -128(%rbp)
	movups .LZERO+32(%rip), %xmm15
	movups %xmm15, -96(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -176(%rbp)
	movups .LZERO+32(%rip), %xmm15
	movups %xmm15, -144(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -224(%rbp)
	movups .LZERO+32(%rip), %xmm15
	movups %xmm15, -192(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -272(%rbp)
	movups .LZERO+32(%rip), %xmm15
	movups %xmm15, -240(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -320(%rbp)
	movups .LZERO+32(%rip), %xmm15
	movups %xmm15, -288(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -368(%rbp)
	movups .LZERO+32(%rip), %xmm15
	movups %xmm15, -336(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -416(%rbp)
	movups .LZERO+32(%rip), %xmm15
	movups %xmm15, -384(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -464(%rbp)
	movups .LZERO+32(%rip), %xmm15
	movups %xmm15, -432(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -512(%rbp)
	movups .LZERO+32(%rip), %xmm15
	movups %xmm15, -480(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -560(%rbp)
	movups .LZERO+32(%rip), %xmm15
	movups %xmm15, -528(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -608(%rbp)
	movups .LZERO+32(%rip), %xmm15
	movups %xmm15, -576(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -656(%rbp)
	movups .LZERO+32(%rip), %xmm15
	movups %xmm15, -624(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -704(%rbp)
	movups .LZERO+32(%rip), %xmm15
	movups %xmm15, -672(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -752(%rbp)
	movups .LZERO+32(%rip), %xmm15
	movups %xmm15, -720(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -800(%rbp)
	movups .LZERO+32(%rip), %xmm15
	movups %xmm15, -768(%rbp)
	vzeroupper
	leaq 96(%rbx), %rcx
	callq standard__crypto__P384__p384_iszero__1__uintE1_ptr1__ret_boolE1
	testb %al, %al
	jne .LB18232
.LB18233:
	leaq 96(%r12), %rcx
	callq standard__crypto__P384__p384_iszero__1__uintE1_ptr1__ret_boolE1
	testb %al, %al
	jne .LB18257
.LB18258:
	leaq -80(%rbp), %rdx
	leaq 96(%rbx), %r8
	leaq 96(%rbx), %r9
	movq %rsi, %rcx
	callq standard__crypto__P384__p384_fmul__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	leaq -128(%rbp), %rdx
	leaq 96(%r12), %r8
	leaq 96(%r12), %r9
	movq %rsi, %rcx
	callq standard__crypto__P384__p384_fmul__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	leaq -176(%rbp), %rdx
	movq %rbx, %r8
	leaq -128(%rbp), %r9
	movq %rsi, %rcx
	callq standard__crypto__P384__p384_fmul__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	leaq -224(%rbp), %rdx
	movq %r12, %r8
	leaq -80(%rbp), %r9
	movq %rsi, %rcx
	callq standard__crypto__P384__p384_fmul__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	leaq -752(%rbp), %rdx
	leaq 96(%r12), %r8
	leaq -128(%rbp), %r9
	movq %rsi, %rcx
	callq standard__crypto__P384__p384_fmul__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	leaq -272(%rbp), %rdx
	leaq 48(%rbx), %r8
	leaq -752(%rbp), %r9
	movq %rsi, %rcx
	callq standard__crypto__P384__p384_fmul__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	leaq -752(%rbp), %rdx
	leaq 96(%rbx), %r8
	leaq -80(%rbp), %r9
	movq %rsi, %rcx
	callq standard__crypto__P384__p384_fmul__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	leaq -320(%rbp), %rdx
	leaq 48(%r12), %r8
	leaq -752(%rbp), %r9
	movq %rsi, %rcx
	callq standard__crypto__P384__p384_fmul__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	leaq -368(%rbp), %rdx
	leaq -224(%rbp), %r8
	leaq -176(%rbp), %r9
	movq %rsi, %rcx
	callq standard__crypto__P384__p384_submod__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	leaq -416(%rbp), %rdx
	leaq -320(%rbp), %r8
	leaq -272(%rbp), %r9
	movq %rsi, %rcx
	callq standard__crypto__P384__p384_submod__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	leaq -368(%rbp), %rcx
	callq standard__crypto__P384__p384_iszero__1__uintE1_ptr1__ret_boolE1
	testb %al, %al
	jne .LB18350
.LB18351:
	leaq -416(%rbp), %rdx
	leaq -416(%rbp), %r8
	leaq -416(%rbp), %r9
	movq %rsi, %rcx
	callq standard__crypto__P384__p384_addmod__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	leaq -752(%rbp), %rdx
	leaq -368(%rbp), %r8
	leaq -368(%rbp), %r9
	movq %rsi, %rcx
	callq standard__crypto__P384__p384_addmod__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	leaq -464(%rbp), %rdx
	leaq -752(%rbp), %r8
	leaq -752(%rbp), %r9
	movq %rsi, %rcx
	callq standard__crypto__P384__p384_fmul__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	leaq -512(%rbp), %rdx
	leaq -368(%rbp), %r8
	leaq -464(%rbp), %r9
	movq %rsi, %rcx
	callq standard__crypto__P384__p384_fmul__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	leaq -560(%rbp), %rdx
	leaq -176(%rbp), %r8
	leaq -464(%rbp), %r9
	movq %rsi, %rcx
	callq standard__crypto__P384__p384_fmul__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	leaq -608(%rbp), %rdx
	leaq -416(%rbp), %r8
	leaq -416(%rbp), %r9
	movq %rsi, %rcx
	callq standard__crypto__P384__p384_fmul__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	leaq -608(%rbp), %rdx
	leaq -608(%rbp), %r8
	leaq -512(%rbp), %r9
	movq %rsi, %rcx
	callq standard__crypto__P384__p384_submod__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	leaq -608(%rbp), %rdx
	leaq -608(%rbp), %r8
	leaq -560(%rbp), %r9
	movq %rsi, %rcx
	callq standard__crypto__P384__p384_submod__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	leaq -608(%rbp), %rdx
	leaq -608(%rbp), %r8
	leaq -560(%rbp), %r9
	movq %rsi, %rcx
	callq standard__crypto__P384__p384_submod__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	leaq -752(%rbp), %rdx
	leaq -560(%rbp), %r8
	leaq -608(%rbp), %r9
	movq %rsi, %rcx
	callq standard__crypto__P384__p384_submod__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	leaq -656(%rbp), %rdx
	leaq -416(%rbp), %r8
	leaq -752(%rbp), %r9
	movq %rsi, %rcx
	callq standard__crypto__P384__p384_fmul__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	leaq -800(%rbp), %rdx
	leaq -272(%rbp), %r8
	leaq -512(%rbp), %r9
	movq %rsi, %rcx
	callq standard__crypto__P384__p384_fmul__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	leaq -800(%rbp), %rdx
	leaq -800(%rbp), %r8
	leaq -800(%rbp), %r9
	movq %rsi, %rcx
	callq standard__crypto__P384__p384_addmod__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	leaq -656(%rbp), %rdx
	leaq -656(%rbp), %r8
	leaq -800(%rbp), %r9
	movq %rsi, %rcx
	callq standard__crypto__P384__p384_submod__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	leaq -752(%rbp), %rdx
	leaq 96(%rbx), %r8
	leaq 96(%r12), %r9
	movq %rsi, %rcx
	callq standard__crypto__P384__p384_addmod__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	leaq -704(%rbp), %rdx
	leaq -752(%rbp), %r8
	leaq -752(%rbp), %r9
	movq %rsi, %rcx
	callq standard__crypto__P384__p384_fmul__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	leaq -704(%rbp), %rdx
	leaq -704(%rbp), %r8
	leaq -80(%rbp), %r9
	movq %rsi, %rcx
	callq standard__crypto__P384__p384_submod__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	leaq -704(%rbp), %rdx
	leaq -704(%rbp), %r8
	leaq -128(%rbp), %r9
	movq %rsi, %rcx
	callq standard__crypto__P384__p384_submod__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	leaq -704(%rbp), %rdx
	leaq -704(%rbp), %r8
	leaq -368(%rbp), %r9
	movq %rsi, %rcx
	callq standard__crypto__P384__p384_fmul__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	movq %rdi, %rcx
	leaq -608(%rbp), %rdx
	callq standard__crypto__P384__p384_copy__2__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	leaq 48(%rdi), %rcx
	leaq -656(%rbp), %rdx
	callq standard__crypto__P384__p384_copy__2__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	leaq 96(%rdi), %rcx
	leaq -704(%rbp), %rdx
	callq standard__crypto__P384__p384_copy__2__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB18350:
	leaq -416(%rbp), %rcx
	callq standard__crypto__P384__p384_iszero__1__uintE1_ptr1__ret_boolE1
	testb %al, %al
	jne .LB18355
.LB18356:
	movq %rdi, %rcx
	callq standard__crypto__P384__p384_set_inf__1__P384_PTE1_ptr1__ret_voidE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB18355:
	movq %rsi, %rcx
	movq %rdi, %rdx
	movq %rbx, %r8
	callq standard__crypto__P384__p384_dbl__3__RSA_MONTE1_ptr1__P384_PTE1_ptr1__P384_PTE1_ptr1__ret_voidE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB18257:
	movq %rdi, %rcx
	movq %rbx, %rdx
	callq standard__crypto__P384__p384_copy__2__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	leaq 48(%rdi), %rcx
	leaq 48(%rbx), %rdx
	callq standard__crypto__P384__p384_copy__2__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	leaq 96(%rdi), %rcx
	leaq 96(%rbx), %rdx
	callq standard__crypto__P384__p384_copy__2__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB18232:
	movq %rdi, %rcx
	movq %r12, %rdx
	callq standard__crypto__P384__p384_copy__2__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	leaq 48(%rdi), %rcx
	leaq 48(%r12), %rdx
	callq standard__crypto__P384__p384_copy__2__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	leaq 96(%rdi), %rcx
	leaq 96(%r12), %rdx
	callq standard__crypto__P384__p384_copy__2__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
	.text
	.globl standard__crypto__P384__p384_mul__5__RSA_MONTE1_ptr1__P384_PTE1_ptr1__byteE1_ptr1__intE1__P384_PTE1_ptr1__ret_voidE1
	.def standard__crypto__P384__p384_mul__5__RSA_MONTE1_ptr1__P384_PTE1_ptr1__byteE1_ptr1__intE1__P384_PTE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__P384__p384_mul__5__RSA_MONTE1_ptr1__P384_PTE1_ptr1__byteE1_ptr1__intE1__P384_PTE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $384, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
	movq %r14, -48(%rbp)
	movq %r15, -56(%rbp)
.LB18477:
	leaq .LZERO(%rip), %rsi
	leaq -200(%rbp), %rdi
	movq 48(%rbp), %r15
	movq %rcx, %rbx
	movq %rdx, %r12
	movq %r8, %r13
	movl %r9d, %r14d
	movl $144, %ecx
	rep movsb
	leaq .LZERO(%rip), %rsi
	leaq -344(%rbp), %rdi
	movl $144, %ecx
	rep movsb
	leaq -344(%rbp), %rcx
	movq %r15, %rdx
	callq standard__crypto__P384__p384_copy__2__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	leaq -296(%rbp), %rcx
	leaq 48(%r15), %rdx
	callq standard__crypto__P384__p384_copy__2__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	leaq -248(%rbp), %rcx
	leaq 96(%r15), %rdx
	callq standard__crypto__P384__p384_copy__2__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	leaq -200(%rbp), %rcx
	callq standard__crypto__P384__p384_set_inf__1__P384_PTE1_ptr1__ret_voidE1
	movslq %r14d, %rsi
	xorl %edi, %edi
.LB18502:
	cmpq %rsi, %rdi
	jge .LB18505
.LB18503:
	movl $7, %r14d
.LB18509:
	testl %r14d, %r14d
	js .LB18512
.LB18510:
	leaq -200(%rbp), %rdx
	leaq -200(%rbp), %r8
	movq %rbx, %rcx
	callq standard__crypto__P384__p384_dbl__3__RSA_MONTE1_ptr1__P384_PTE1_ptr1__P384_PTE1_ptr1__ret_voidE1
	movzbl (%r13,%rdi,1), %eax
	movzbl %al, %eax
	shrx %r14d, %eax, %eax
	andl $1, %eax
	testb %al, %al
	jne .LB18528
.LB18530:
	decl %r14d
	jns .LB18510
	jmp .LB18512
.LB18505:
	movq %r12, %rcx
	leaq -200(%rbp), %rdx
	callq standard__crypto__P384__p384_copy__2__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	leaq 48(%r12), %rcx
	leaq -152(%rbp), %rdx
	callq standard__crypto__P384__p384_copy__2__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	leaq 96(%r12), %rcx
	leaq -104(%rbp), %rdx
	callq standard__crypto__P384__p384_copy__2__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB18512:
	incq %rdi
	cmpq %rsi, %rdi
	jl .LB18503
	jmp .LB18505
.LB18528:
	leaq -200(%rbp), %rdx
	leaq -200(%rbp), %r8
	leaq -344(%rbp), %r9
	movq %rbx, %rcx
	callq standard__crypto__P384__p384_add__4__RSA_MONTE1_ptr1__P384_PTE1_ptr1__P384_PTE1_ptr1__P384_PTE1_ptr1__ret_voidE1
	jmp .LB18530
	.text
	.globl standard__crypto__P384__p384_to_affine__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__P384_PTE1_ptr1__ret_boolE1
	.def standard__crypto__P384__p384_to_affine__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__P384_PTE1_ptr1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__P384__p384_to_affine__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__P384_PTE1_ptr1__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $400, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
.LB18552:
	movq %rcx, %rsi
	movq %rdx, %rdi
	movq %r8, %rbx
	movq %r9, %r12
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -80(%rbp)
	movups .LZERO+32(%rip), %xmm15
	movups %xmm15, -48(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -128(%rbp)
	movups .LZERO+32(%rip), %xmm15
	movups %xmm15, -96(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -176(%rbp)
	movups .LZERO+32(%rip), %xmm15
	movups %xmm15, -144(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -224(%rbp)
	movups .LZERO+32(%rip), %xmm15
	movups %xmm15, -192(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -272(%rbp)
	movups .LZERO+32(%rip), %xmm15
	movups %xmm15, -240(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -320(%rbp)
	movups .LZERO+32(%rip), %xmm15
	movups %xmm15, -288(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -368(%rbp)
	movups .LZERO+32(%rip), %xmm15
	movups %xmm15, -336(%rbp)
	vzeroupper
	leaq 96(%r12), %rcx
	callq standard__crypto__P384__p384_iszero__1__uintE1_ptr1__ret_boolE1
	testb %al, %al
	jne .LB18568
.LB18569:
	leaq -80(%rbp), %rdx
	leaq 96(%r12), %r8
	movq %rsi, %rcx
	callq standard__crypto__P384__p384_from_mont__3__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	leaq -128(%rbp), %rdx
	leaq -80(%rbp), %r8
	movq %rsi, %rcx
	callq standard__crypto__P384__p384_inv__3__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	leaq -176(%rbp), %rdx
	leaq -128(%rbp), %r8
	movq %rsi, %rcx
	callq standard__crypto__P384__p384_to_mont__3__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	leaq -224(%rbp), %rdx
	leaq -176(%rbp), %r8
	leaq -176(%rbp), %r9
	movq %rsi, %rcx
	callq standard__crypto__P384__p384_fmul__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	leaq -272(%rbp), %rdx
	leaq -224(%rbp), %r8
	leaq -176(%rbp), %r9
	movq %rsi, %rcx
	callq standard__crypto__P384__p384_fmul__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	leaq -320(%rbp), %rdx
	movq %r12, %r8
	leaq -224(%rbp), %r9
	movq %rsi, %rcx
	callq standard__crypto__P384__p384_fmul__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	leaq -368(%rbp), %rdx
	leaq 48(%r12), %r8
	leaq -272(%rbp), %r9
	movq %rsi, %rcx
	callq standard__crypto__P384__p384_fmul__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	leaq -320(%rbp), %r8
	movq %rsi, %rcx
	movq %rdi, %rdx
	callq standard__crypto__P384__p384_from_mont__3__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	leaq -368(%rbp), %r8
	movq %rsi, %rcx
	movq %rbx, %rdx
	callq standard__crypto__P384__p384_from_mont__3__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	movl $1, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB18568:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
	.text
	.globl standard__crypto__P384__p384_from_affine__4__RSA_MONTE1_ptr1__P384_PTE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	.def standard__crypto__P384__p384_from_affine__4__RSA_MONTE1_ptr1__P384_PTE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__P384__p384_from_affine__4__RSA_MONTE1_ptr1__P384_PTE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
.LB18617:
	movq %rcx, %rsi
	movq %rdx, %rdi
	movq %r9, %rbx
	movq %rdi, %rdx
	movq %rsi, %rcx
	callq standard__crypto__P384__p384_to_mont__3__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	leaq 48(%rdi), %rdx
	movq %rsi, %rcx
	movq %rbx, %r8
	callq standard__crypto__P384__p384_to_mont__3__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	leaq 96(%rdi), %rcx
	leaq 1024(%rsi), %rdx
	callq standard__crypto__P384__p384_copy__2__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__crypto__P384__p384_on_curve__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_boolE1
	.def standard__crypto__P384__p384_on_curve__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__P384__p384_on_curve__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $448, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
.LB18640:
	movq %rcx, %rsi
	movq %rdx, %rdi
	movq %r8, %rbx
	movq %r9, %r12
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -80(%rbp)
	movups .LZERO+32(%rip), %xmm15
	movups %xmm15, -48(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -128(%rbp)
	movups .LZERO+32(%rip), %xmm15
	movups %xmm15, -96(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -176(%rbp)
	movups .LZERO+32(%rip), %xmm15
	movups %xmm15, -144(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -224(%rbp)
	movups .LZERO+32(%rip), %xmm15
	movups %xmm15, -192(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -272(%rbp)
	movups .LZERO+32(%rip), %xmm15
	movups %xmm15, -240(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -320(%rbp)
	movups .LZERO+32(%rip), %xmm15
	movups %xmm15, -288(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -368(%rbp)
	movups .LZERO+32(%rip), %xmm15
	movups %xmm15, -336(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -416(%rbp)
	movups .LZERO+32(%rip), %xmm15
	movups %xmm15, -384(%rbp)
	vzeroupper
	movq %rsi, %rdx
	movq %rdi, %rcx
	movl $12, %r8d
	callq standard__crypto__RSA__rsa_cmp__3__uintE1_ptr1__uintE1_ptr1__intE1__ret_intE1
	testl %eax, %eax
	jns .LB18659
.LB18660:
	movq %rsi, %rdx
	movq %rbx, %rcx
	movl $12, %r8d
	callq standard__crypto__RSA__rsa_cmp__3__uintE1_ptr1__uintE1_ptr1__intE1__ret_intE1
	testl %eax, %eax
	jns .LB18668
.LB18669:
	leaq -80(%rbp), %rdx
	movq %rsi, %rcx
	movq %rdi, %r8
	callq standard__crypto__P384__p384_to_mont__3__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	leaq -128(%rbp), %rdx
	movq %rsi, %rcx
	movq %rbx, %r8
	callq standard__crypto__P384__p384_to_mont__3__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	leaq -368(%rbp), %rdx
	movq %rsi, %rcx
	movq %r12, %r8
	callq standard__crypto__P384__p384_to_mont__3__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	leaq -176(%rbp), %rdx
	leaq -128(%rbp), %r8
	leaq -128(%rbp), %r9
	movq %rsi, %rcx
	callq standard__crypto__P384__p384_fmul__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	leaq -224(%rbp), %rdx
	leaq -80(%rbp), %r8
	leaq -80(%rbp), %r9
	movq %rsi, %rcx
	callq standard__crypto__P384__p384_fmul__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	leaq -272(%rbp), %rdx
	leaq -224(%rbp), %r8
	leaq -80(%rbp), %r9
	movq %rsi, %rcx
	callq standard__crypto__P384__p384_fmul__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	leaq -320(%rbp), %rdx
	leaq -80(%rbp), %r8
	leaq -80(%rbp), %r9
	movq %rsi, %rcx
	callq standard__crypto__P384__p384_addmod__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	leaq -320(%rbp), %rdx
	leaq -320(%rbp), %r8
	leaq -80(%rbp), %r9
	movq %rsi, %rcx
	callq standard__crypto__P384__p384_addmod__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	leaq -416(%rbp), %rdx
	leaq -272(%rbp), %r8
	leaq -320(%rbp), %r9
	movq %rsi, %rcx
	callq standard__crypto__P384__p384_submod__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	leaq -416(%rbp), %rdx
	leaq -416(%rbp), %r8
	leaq -368(%rbp), %r9
	movq %rsi, %rcx
	callq standard__crypto__P384__p384_addmod__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	leaq -176(%rbp), %rcx
	leaq -416(%rbp), %rdx
	movl $12, %r8d
	callq standard__crypto__RSA__rsa_cmp__3__uintE1_ptr1__uintE1_ptr1__intE1__ret_intE1
	xorl %ecx, %ecx
	testl %eax, %eax
	sete %cl
	movl %ecx, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB18668:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB18659:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
	.text
	.globl standard__crypto__P384__p384_load__3__uintE1_ptr1__byteE1_ptr1__intE1__ret_voidE1
	.def standard__crypto__P384__p384_load__3__uintE1_ptr1__byteE1_ptr1__intE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__P384__p384_load__3__uintE1_ptr1__byteE1_ptr1__intE1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB18722:
	movq %rdx, %rax
	movl %r8d, %r9d
	movl $12, %edx
	movq %rax, %r8
	callq standard__crypto__RSA__rsa_be_to_limbs__4__uintE1_ptr1__intE1__byteE1_ptr1__intE1__ret_voidE1
	leave
	ret
	.text
	.globl standard__crypto__P384__p384_store__3__byteE1_ptr1__uintE1_ptr1__intE1__ret_voidE1
	.def standard__crypto__P384__p384_store__3__byteE1_ptr1__uintE1_ptr1__intE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__P384__p384_store__3__byteE1_ptr1__uintE1_ptr1__intE1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB18729:
	movq %rdx, %rax
	movl %r8d, %edx
	movq %rax, %r8
	movl $12, %r9d
	callq standard__crypto__RSA__rsa_limbs_to_be__4__byteE1_ptr1__intE1__uintE1_ptr1__intE1__ret_voidE1
	leave
	ret
	.text
	.globl standard__crypto__P384__p384_hash_to_scalar__5__RSA_MONTE1_ptr1__uintE1_ptr1__byteE1_ptr1__intE1__intE1__ret_voidE1
	.def standard__crypto__P384__p384_hash_to_scalar__5__RSA_MONTE1_ptr1__uintE1_ptr1__byteE1_ptr1__intE1__intE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__P384__p384_hash_to_scalar__5__RSA_MONTE1_ptr1__uintE1_ptr1__byteE1_ptr1__intE1__intE1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $176, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
.LB18736:
	movl 48(%rbp), %eax
	movq %rcx, %rsi
	movq %rdx, %rdi
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -88(%rbp)
	movups .LZERO+32(%rip), %xmm15
	movups %xmm15, -56(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -136(%rbp)
	movups .LZERO+32(%rip), %xmm15
	movups %xmm15, -104(%rbp)
	vzeroupper
	cmpl %eax, %r9d
	cmovg %eax, %r9d
	movl $12, %ecx
	xorl %edx, %edx
.LB32133:
	testq %rcx, %rcx
	je .LB32135
.LB32134:
	movb $0, -88(%rbp,%rdx,1)
	movb $0, -87(%rbp,%rdx,1)
	movb $0, -86(%rbp,%rdx,1)
	movb $0, -85(%rbp,%rdx,1)
	addq $4, %rdx
	decq %rcx
	jne .LB32134
.LB32135:
.LB18754:
	cmpq $48, %rdx
	jge .LB18757
.LB18755:
	movb $0, -88(%rbp,%rdx,1)
	incq %rdx
	cmpq $48, %rdx
	jl .LB18755
.LB18757:
	movl %eax, %ecx
	subl %r9d, %ecx
	xorl %edx, %edx
	testl %r9d, %r9d
	cmovg %r9d, %edx
	shrl $2, %edx
	xorl %ebx, %ebx
.LB32136:
	testl %edx, %edx
	je .LB32138
.LB32137:
	movslq %ebx, %r12
	movzbl (%r8,%r12,1), %r12d
	leal (%rcx,%rbx), %r13d
	movslq %r13d, %r13
	movb %r12b, -88(%rbp,%r13,1)
	leal 1(%rbx), %r12d
	movslq %r12d, %r13
	movzbl (%r8,%r13,1), %r13d
	addl %ecx, %r12d
	movslq %r12d, %r12
	movb %r13b, -88(%rbp,%r12,1)
	leal 2(%rbx), %r12d
	movslq %r12d, %r13
	movzbl (%r8,%r13,1), %r13d
	addl %ecx, %r12d
	movslq %r12d, %r12
	movb %r13b, -88(%rbp,%r12,1)
	leal 3(%rbx), %r12d
	movslq %r12d, %r13
	movzbl (%r8,%r13,1), %r13d
	addl %ecx, %r12d
	movslq %r12d, %r12
	movb %r13b, -88(%rbp,%r12,1)
	addl $4, %ebx
	decl %edx
	jne .LB32137
.LB32138:
.LB18765:
	cmpl %r9d, %ebx
	jge .LB18768
.LB18766:
	movslq %ebx, %rdx
	movzbl (%r8,%rdx,1), %edx
	leal (%rcx,%rbx), %r12d
	movslq %r12d, %r12
	movb %dl, -88(%rbp,%r12,1)
	incl %ebx
	cmpl %r9d, %ebx
	jl .LB18766
.LB18768:
	leaq -136(%rbp), %rcx
	leaq -88(%rbp), %rdx
	movq %rax, %r8
	callq standard__crypto__P384__p384_load__3__uintE1_ptr1__byteE1_ptr1__intE1__ret_voidE1
	leaq -136(%rbp), %rdx
	movq %rsi, %r9
	movq $12, 32(%rsp)
	movq %rdi, %rcx
	movl $12, %r8d
	callq standard__crypto__RSA__rsa_mod__5__uintE1_ptr1__uintE1_ptr1__intE1__uintE1_ptr1__intE1__ret_voidE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
	.text
	.globl standard__crypto__P384__p3_verify__13__intE1__intE1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__intE1__ret_boolE1
	.def standard__crypto__P384__p3_verify__13__intE1__intE1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__intE1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__P384__p3_verify__13__intE1__intE1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__intE1__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	movl $4592, %eax
	callq __chkstk
	subq %rax, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
	movq %r14, -48(%rbp)
	movq %r15, -56(%rbp)
.LB18792:
	movq 48(%rbp), %r14
	movq 56(%rbp), %r15
	movq 64(%rbp), %rax
	leaq .LZERO(%rip), %rsi
	leaq -1600(%rbp), %rdi
	movl %ecx, %ebx
	movl %edx, %r12d
	movq %r8, %rdx
	movq %r9, %r13
	movl $1544, %ecx
	movq %rax, -4496(%rbp)
	movq 72(%rbp), %rax
	movq %rax, -4504(%rbp)
	movq 80(%rbp), %rax
	movq %rax, -4512(%rbp)
	movq 88(%rbp), %rax
	movq %rax, -4520(%rbp)
	movq 96(%rbp), %rax
	movq %rax, -4528(%rbp)
	movq 104(%rbp), %rax
	movq %rax, -4536(%rbp)
	movl 112(%rbp), %eax
	movq %rax, -4544(%rbp)
	rep movsb
	leaq .LZERO(%rip), %rsi
	leaq -3144(%rbp), %rdi
	movl $1544, %ecx
	rep movsb
	leaq .LZERO(%rip), %rsi
	leaq -3288(%rbp), %rdi
	movl $144, %ecx
	rep movsb
	leaq .LZERO(%rip), %rsi
	leaq -3432(%rbp), %rdi
	movl $144, %ecx
	rep movsb
	leaq .LZERO(%rip), %rsi
	leaq -3576(%rbp), %rdi
	movl $144, %ecx
	rep movsb
	leaq .LZERO(%rip), %rsi
	leaq -3720(%rbp), %rdi
	movl $144, %ecx
	rep movsb
	leaq .LZERO(%rip), %rsi
	leaq -3864(%rbp), %rdi
	movl $144, %ecx
	rep movsb
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -3912(%rbp)
	movups .LZERO+32(%rip), %xmm15
	movups %xmm15, -3880(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -3960(%rbp)
	movups .LZERO+32(%rip), %xmm15
	movups %xmm15, -3928(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -4008(%rbp)
	movups .LZERO+32(%rip), %xmm15
	movups %xmm15, -3976(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -4056(%rbp)
	movups .LZERO+32(%rip), %xmm15
	movups %xmm15, -4024(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -4104(%rbp)
	movups .LZERO+32(%rip), %xmm15
	movups %xmm15, -4072(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -4152(%rbp)
	movups .LZERO+32(%rip), %xmm15
	movups %xmm15, -4120(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -4200(%rbp)
	movups .LZERO+32(%rip), %xmm15
	movups %xmm15, -4168(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -4248(%rbp)
	movups .LZERO+32(%rip), %xmm15
	movups %xmm15, -4216(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -4296(%rbp)
	movups .LZERO+32(%rip), %xmm15
	movups %xmm15, -4264(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -4344(%rbp)
	movups .LZERO+32(%rip), %xmm15
	movups %xmm15, -4312(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -4392(%rbp)
	movups .LZERO+32(%rip), %xmm15
	movups %xmm15, -4360(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -4440(%rbp)
	movups .LZERO+32(%rip), %xmm15
	movups %xmm15, -4408(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -4488(%rbp)
	movups .LZERO+32(%rip), %xmm15
	movups %xmm15, -4456(%rbp)
	vzeroupper
	leaq -1600(%rbp), %rcx
	movq %rbx, %r8
	callq standard__crypto__RSA__rsa_mont_init__3__RSA_MONTE1_ptr1__uintE1_ptr1__intE1__ret_voidE1
	leaq -3144(%rbp), %rcx
	movq %r13, %rdx
	movq %rbx, %r8
	callq standard__crypto__RSA__rsa_mont_init__3__RSA_MONTE1_ptr1__uintE1_ptr1__intE1__ret_voidE1
	leaq -3912(%rbp), %rcx
	movq -4504(%rbp), %rdx
	movq %r12, %r8
	callq standard__crypto__P384__p384_load__3__uintE1_ptr1__byteE1_ptr1__intE1__ret_voidE1
	leaq -3960(%rbp), %rcx
	movq -4512(%rbp), %rdx
	movq %r12, %r8
	callq standard__crypto__P384__p384_load__3__uintE1_ptr1__byteE1_ptr1__intE1__ret_voidE1
	leaq -3912(%rbp), %rcx
	callq standard__crypto__P384__p384_iszero__1__uintE1_ptr1__ret_boolE1
	testb %al, %al
	jne .LB18846
.LB18838:
	leaq -3912(%rbp), %rcx
	leaq -3144(%rbp), %rdx
	movl $12, %r8d
	callq standard__crypto__RSA__rsa_cmp__3__uintE1_ptr1__uintE1_ptr1__intE1__ret_intE1
	testl %eax, %eax
	jns .LB18846
.LB18847:
	leaq -3960(%rbp), %rcx
	callq standard__crypto__P384__p384_iszero__1__uintE1_ptr1__ret_boolE1
	testb %al, %al
	jne .LB18859
.LB18851:
	leaq -3960(%rbp), %rcx
	leaq -3144(%rbp), %rdx
	movl $12, %r8d
	callq standard__crypto__RSA__rsa_cmp__3__uintE1_ptr1__uintE1_ptr1__intE1__ret_intE1
	testl %eax, %eax
	jns .LB18859
.LB18860:
	leaq -4200(%rbp), %rcx
	movq -4520(%rbp), %rdx
	movq %r12, %r8
	callq standard__crypto__P384__p384_load__3__uintE1_ptr1__byteE1_ptr1__intE1__ret_voidE1
	leaq -4248(%rbp), %rcx
	movq -4528(%rbp), %rdx
	movq %r12, %r8
	callq standard__crypto__P384__p384_load__3__uintE1_ptr1__byteE1_ptr1__intE1__ret_voidE1
	leaq -4200(%rbp), %rdx
	leaq -4248(%rbp), %r8
	leaq -1600(%rbp), %rcx
	movq %r14, %r9
	callq standard__crypto__P384__p384_on_curve__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_boolE1
	testb %al, %al
	je .LB18873
.LB18874:
	leaq -4008(%rbp), %rdx
	leaq -3144(%rbp), %rcx
	movq %r12, 32(%rsp)
	movq -4536(%rbp), %r8
	movq -4544(%rbp), %r9
	callq standard__crypto__P384__p384_hash_to_scalar__5__RSA_MONTE1_ptr1__uintE1_ptr1__byteE1_ptr1__intE1__intE1__ret_voidE1
	leaq -4056(%rbp), %rdx
	leaq -3960(%rbp), %r8
	leaq -3144(%rbp), %rcx
	callq standard__crypto__P384__p384_inv__3__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	leaq -4104(%rbp), %rdx
	leaq -4008(%rbp), %r8
	leaq -4056(%rbp), %r9
	leaq -3144(%rbp), %rcx
	callq standard__crypto__P384__p384_nmul__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	leaq -4152(%rbp), %rdx
	leaq -3912(%rbp), %r8
	leaq -4056(%rbp), %r9
	leaq -3144(%rbp), %rcx
	callq standard__crypto__P384__p384_nmul__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	leaq -4440(%rbp), %rcx
	leaq -4104(%rbp), %rdx
	movq %r12, %r8
	callq standard__crypto__P384__p384_store__3__byteE1_ptr1__uintE1_ptr1__intE1__ret_voidE1
	leaq -4488(%rbp), %rcx
	leaq -4152(%rbp), %rdx
	movq %r12, %r8
	callq standard__crypto__P384__p384_store__3__byteE1_ptr1__uintE1_ptr1__intE1__ret_voidE1
	leaq -1600(%rbp), %rcx
	leaq -3288(%rbp), %rdx
	movq -4496(%rbp), %r9
	movq %r15, %r8
	callq standard__crypto__P384__p384_from_affine__4__RSA_MONTE1_ptr1__P384_PTE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	leaq -4200(%rbp), %r8
	leaq -4248(%rbp), %r9
	leaq -1600(%rbp), %rcx
	leaq -3432(%rbp), %rdx
	callq standard__crypto__P384__p384_from_affine__4__RSA_MONTE1_ptr1__P384_PTE1_ptr1__uintE1_ptr1__uintE1_ptr1__ret_voidE1
	leaq -4440(%rbp), %r8
	leaq -1600(%rbp), %rcx
	leaq -3576(%rbp), %rdx
	leaq -3288(%rbp), %rax
	movq %r12, %r9
	movq %rax, 32(%rsp)
	callq standard__crypto__P384__p384_mul__5__RSA_MONTE1_ptr1__P384_PTE1_ptr1__byteE1_ptr1__intE1__P384_PTE1_ptr1__ret_voidE1
	leaq -4488(%rbp), %r8
	leaq -1600(%rbp), %rcx
	leaq -3720(%rbp), %rdx
	leaq -3432(%rbp), %rax
	movq %r12, %r9
	movq %rax, 32(%rsp)
	callq standard__crypto__P384__p384_mul__5__RSA_MONTE1_ptr1__P384_PTE1_ptr1__byteE1_ptr1__intE1__P384_PTE1_ptr1__ret_voidE1
	leaq -1600(%rbp), %rcx
	leaq -3864(%rbp), %rdx
	leaq -3576(%rbp), %r8
	leaq -3720(%rbp), %r9
	callq standard__crypto__P384__p384_add__4__RSA_MONTE1_ptr1__P384_PTE1_ptr1__P384_PTE1_ptr1__P384_PTE1_ptr1__ret_voidE1
	leaq -4296(%rbp), %rdx
	leaq -4344(%rbp), %r8
	leaq -1600(%rbp), %rcx
	leaq -3864(%rbp), %r9
	callq standard__crypto__P384__p384_to_affine__4__RSA_MONTE1_ptr1__uintE1_ptr1__uintE1_ptr1__P384_PTE1_ptr1__ret_boolE1
	testb %al, %al
	je .LB18906
.LB18907:
	leaq -4392(%rbp), %rcx
	leaq -4296(%rbp), %rdx
	leaq -3144(%rbp), %r9
	movq $12, 32(%rsp)
	movl $12, %r8d
	callq standard__crypto__RSA__rsa_mod__5__uintE1_ptr1__uintE1_ptr1__intE1__uintE1_ptr1__intE1__ret_voidE1
	leaq -4392(%rbp), %rcx
	leaq -3912(%rbp), %rdx
	movl $12, %r8d
	callq standard__crypto__RSA__rsa_cmp__3__uintE1_ptr1__uintE1_ptr1__intE1__ret_intE1
	xorl %ecx, %ecx
	testl %eax, %eax
	sete %cl
	movl %ecx, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB18906:
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
.LB18873:
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
.LB18859:
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
.LB18846:
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
	.globl standard__crypto__P384__ecdsa_p384_verify__6__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__intE1__ret_boolE1
	.def standard__crypto__P384__ecdsa_p384_verify__6__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__intE1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__P384__ecdsa_p384_verify__6__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__intE1__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $160, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
	movq %r14, -48(%rbp)
.LB18917:
	leaq standard__crypto__P384__P384_P(%rip), %rdi
	leaq standard__crypto__P384__P384_N(%rip), %rbx
	leaq standard__crypto__P384__P384_B(%rip), %r12
	leaq standard__crypto__P384__P384_GX(%rip), %r13
	leaq standard__crypto__P384__P384_GY(%rip), %r14
	movq 48(%rbp), %rax
	movl 56(%rbp), %esi
	movq %r12, 32(%rsp)
	movq %r13, 40(%rsp)
	movq %r14, 48(%rsp)
	movq %rcx, 56(%rsp)
	movq %rdx, 64(%rsp)
	movq %r8, 72(%rsp)
	movq %r9, 80(%rsp)
	movq %rax, 88(%rsp)
	movq %rsi, 96(%rsp)
	movl $12, %ecx
	movl $48, %edx
	movq %rdi, %r8
	movq %rbx, %r9
	callq standard__crypto__P384__p3_verify__13__intE1__intE1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__intE1__ret_boolE1
	movzbl %al, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	leave
	ret
	.text
	.globl standard__crypto__P384__ecdsa_p256n_verify__6__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__intE1__ret_boolE1
	.def standard__crypto__P384__ecdsa_p256n_verify__6__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__intE1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__P384__ecdsa_p256n_verify__6__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__intE1__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $160, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
	movq %r14, -48(%rbp)
.LB18936:
	leaq standard__crypto__P384__P256N_P(%rip), %rdi
	leaq standard__crypto__P384__P256N_N(%rip), %rbx
	leaq standard__crypto__P384__P256N_B(%rip), %r12
	leaq standard__crypto__P384__P256N_GX(%rip), %r13
	leaq standard__crypto__P384__P256N_GY(%rip), %r14
	movq 48(%rbp), %rax
	movl 56(%rbp), %esi
	movq %r12, 32(%rsp)
	movq %r13, 40(%rsp)
	movq %r14, 48(%rsp)
	movq %rcx, 56(%rsp)
	movq %rdx, 64(%rsp)
	movq %r8, 72(%rsp)
	movq %r9, 80(%rsp)
	movq %rax, 88(%rsp)
	movq %rsi, 96(%rsp)
	movl $8, %ecx
	movl $32, %edx
	movq %rdi, %r8
	movq %rbx, %r9
	callq standard__crypto__P384__p3_verify__13__intE1__intE1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__uintE1_ptr1__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__intE1__ret_boolE1
	movzbl %al, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	leave
	ret
	.text
	.globl standard__crypto__P384__ecdsa_der_get_int__5__byteE1_ptr1__intE1__byteE1_ptr1__intE1__intE1_ptr1__ret_boolE1
	.def standard__crypto__P384__ecdsa_der_get_int__5__byteE1_ptr1__intE1__byteE1_ptr1__intE1__intE1_ptr1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__P384__ecdsa_der_get_int__5__byteE1_ptr1__intE1__byteE1_ptr1__intE1__intE1_ptr1__ret_boolE1:
	subq $64, %rsp
	movq %rbx, 48(%rsp)
	movq %rsi, 40(%rsp)
	movq %rdi, 32(%rsp)
	movq %r12, 24(%rsp)
	movq %r13, 16(%rsp)
	movq %r14, 8(%rsp)
	movq %r15, 0(%rsp)
.LB18955:
	movq 104(%rsp), %rbx
	movq %rcx, %rsi
	movl (%rbx), %eax
	leal 2(%rax), %r12d
	cmpl %r9d, %r12d
	jg .LB18971
.LB18972:
	movslq %eax, %rcx
	cmpb $2, (%r8,%rcx,1)
	jne .LB18980
.LB18981:
	incl %eax
	movslq %eax, %rax
	movzbl (%r8,%rax,1), %eax
	movzbl %al, %r13d
	testb %al, %al
	je .LB19006
.LB18993:
	cmpb $128, %al
	jae .LB19006
.LB18998:
	leal (%r12,%r13), %eax
	cmpl %r9d, %eax
	jg .LB19006
.LB19007:
	movslq %r12d, %rax
	movzbl (%r8,%rax,1), %eax
	andl $128, %eax
	testb %al, %al
	jne .LB19017
.LB19018:
	leal -1(%r13), %eax
	xorl %r9d, %r9d
.LB19020:
	cmpl %eax, %r9d
	jge .LB19022
.LB19027:
	leal (%r12,%r9), %ecx
	movslq %ecx, %rcx
	cmpb $0, (%r8,%rcx,1)
	jne .LB19022
.LB19021:
	incl %r9d
	cmpl %eax, %r9d
	jl .LB19027
.LB19022:
	movl %r13d, %eax
	subl %r9d, %eax
	cmpl %edx, %eax
	jg .LB19045
.LB19046:
	cmpl $32, %edx
	jge .LB32139
.LB32140:
	movslq %edx, %rax
	xorl %ecx, %ecx
	testq %rax, %rax
	cmovg %rax, %rcx
	shrq $2, %rcx
	xorl %edi, %edi
.LB32141:
	testq %rcx, %rcx
	je .LB32143
.LB32142:
	movb $0, (%rsi,%rdi,1)
	movb $0, 1(%rsi,%rdi,1)
	movb $0, 2(%rsi,%rdi,1)
	movb $0, 3(%rsi,%rdi,1)
	addq $4, %rdi
	decq %rcx
	jne .LB32142
.LB32143:
.LB19048:
	cmpq %rax, %rdi
	jge .LB19051
.LB19049:
	movb $0, (%rsi,%rdi,1)
	incq %rdi
	cmpq %rax, %rdi
	jl .LB19049
	jmp .LB19051
.LB32139:
	movslq %edx, %rax
	movq %rax, %rcx
	sarq $63, %rcx
	notq %rcx
	andq %rax, %rcx
	movq %rsi, %rdi
	xorl %eax, %eax
	rep stosb
.LB19051:
	movl %r13d, %eax
	subl %r9d, %eax
	leal (%r12,%r9), %ecx
	subl %eax, %edx
	xorl %edi, %edi
	testl %eax, %eax
	cmovg %eax, %edi
	shrl $2, %edi
	xorl %r9d, %r9d
.LB32144:
	testl %edi, %edi
	je .LB32146
.LB32145:
	leal (%rcx,%r9), %r14d
	movslq %r14d, %r14
	movzbl (%r8,%r14,1), %r14d
	leal (%rdx,%r9), %r15d
	movslq %r15d, %r15
	movb %r14b, (%rsi,%r15,1)
	leal 1(%r9), %r14d
	leal (%rcx,%r14), %r15d
	movslq %r15d, %r15
	movzbl (%r8,%r15,1), %r15d
	addl %edx, %r14d
	movslq %r14d, %r14
	movb %r15b, (%rsi,%r14,1)
	leal 2(%r9), %r14d
	leal (%rcx,%r14), %r15d
	movslq %r15d, %r15
	movzbl (%r8,%r15,1), %r15d
	addl %edx, %r14d
	movslq %r14d, %r14
	movb %r15b, (%rsi,%r14,1)
	leal 3(%r9), %r14d
	leal (%rcx,%r14), %r15d
	movslq %r15d, %r15
	movzbl (%r8,%r15,1), %r15d
	addl %edx, %r14d
	movslq %r14d, %r14
	movb %r15b, (%rsi,%r14,1)
	addl $4, %r9d
	decl %edi
	jne .LB32145
.LB32146:
.LB19061:
	cmpl %eax, %r9d
	jge .LB19064
.LB19062:
	leal (%rcx,%r9), %edi
	movslq %edi, %rdi
	movzbl (%r8,%rdi,1), %edi
	leal (%rdx,%r9), %r14d
	movslq %r14d, %r14
	movb %dil, (%rsi,%r14,1)
	incl %r9d
	cmpl %eax, %r9d
	jl .LB19062
.LB19064:
	addl %r13d, %r12d
	movl %r12d, (%rbx)
	movl $1, %eax
	movq 48(%rsp), %rbx
	movq 40(%rsp), %rsi
	movq 32(%rsp), %rdi
	movq 24(%rsp), %r12
	movq 16(%rsp), %r13
	movq 8(%rsp), %r14
	movq 0(%rsp), %r15
	addq $64, %rsp
	ret
.LB19045:
	xorl %eax, %eax
	movq 48(%rsp), %rbx
	movq 40(%rsp), %rsi
	movq 32(%rsp), %rdi
	movq 24(%rsp), %r12
	movq 16(%rsp), %r13
	movq 8(%rsp), %r14
	movq 0(%rsp), %r15
	addq $64, %rsp
	ret
.LB19017:
	xorl %eax, %eax
	movq 48(%rsp), %rbx
	movq 40(%rsp), %rsi
	movq 32(%rsp), %rdi
	movq 24(%rsp), %r12
	movq 16(%rsp), %r13
	movq 8(%rsp), %r14
	movq 0(%rsp), %r15
	addq $64, %rsp
	ret
.LB19006:
	xorl %eax, %eax
	movq 48(%rsp), %rbx
	movq 40(%rsp), %rsi
	movq 32(%rsp), %rdi
	movq 24(%rsp), %r12
	movq 16(%rsp), %r13
	movq 8(%rsp), %r14
	movq 0(%rsp), %r15
	addq $64, %rsp
	ret
.LB18980:
	xorl %eax, %eax
	movq 48(%rsp), %rbx
	movq 40(%rsp), %rsi
	movq 32(%rsp), %rdi
	movq 24(%rsp), %r12
	movq 16(%rsp), %r13
	movq 8(%rsp), %r14
	movq 0(%rsp), %r15
	addq $64, %rsp
	ret
.LB18971:
	xorl %eax, %eax
	movq 48(%rsp), %rbx
	movq 40(%rsp), %rsi
	movq 32(%rsp), %rdi
	movq 24(%rsp), %r12
	movq 16(%rsp), %r13
	movq 8(%rsp), %r14
	movq 0(%rsp), %r15
	addq $64, %rsp
	ret
	.text
	.globl standard__crypto__P384__ecdsa_der_decode_n__5__byteE1_ptr1__byteE1_ptr1__intE1__byteE1_ptr1__intE1__ret_boolE1
	.def standard__crypto__P384__ecdsa_der_decode_n__5__byteE1_ptr1__byteE1_ptr1__intE1__byteE1_ptr1__intE1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__P384__ecdsa_der_decode_n__5__byteE1_ptr1__byteE1_ptr1__intE1__byteE1_ptr1__intE1__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $80, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
.LB19093:
	movl 48(%rbp), %r12d
	movq %rdx, %rsi
	movl %r8d, %edi
	movq %r9, %rbx
	movl $0, -36(%rbp)
	cmpl $8, %r12d
	jl .LB19111
.LB19103:
	cmpb $48, (%rbx)
	jne .LB19111
.LB19112:
	movl $2, -36(%rbp)
	movzbl 1(%rbx), %eax
	movzbl %al, %edx
	cmpb $129, %al
	je .LB19120
.LB19121:
	cmpb $128, %al
	jae .LB19129
.LB19130:
.LB19122:
	addl -36(%rbp), %edx
	cmpl %r12d, %edx
	jne .LB19137
.LB19138:
	leaq -36(%rbp), %rax
	movq %rdi, %rdx
	movq %rbx, %r8
	movq %r12, %r9
	movq %rax, 32(%rsp)
	callq standard__crypto__P384__ecdsa_der_get_int__5__byteE1_ptr1__intE1__byteE1_ptr1__intE1__intE1_ptr1__ret_boolE1
	testb %al, %al
	je .LB19146
.LB19147:
	leaq -36(%rbp), %rax
	movq %rsi, %rcx
	movq %rdi, %rdx
	movq %rbx, %r8
	movq %r12, %r9
	movq %rax, 32(%rsp)
	callq standard__crypto__P384__ecdsa_der_get_int__5__byteE1_ptr1__intE1__byteE1_ptr1__intE1__intE1_ptr1__ret_boolE1
	testb %al, %al
	je .LB19155
.LB19156:
	movl -36(%rbp), %eax
	xorl %ecx, %ecx
	cmpl %r12d, %eax
	sete %cl
	movl %ecx, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB19129:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB19120:
	movzbl 2(%rbx), %eax
	movzbl %al, %edx
	movl $3, -36(%rbp)
	jmp .LB19122
.LB19155:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB19146:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB19137:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB19111:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
	.text
	.globl standard__crypto__X509__asn1_hdr__6__byteE1_ptr1__intE1__intE1__intE1_ptr1__intE1_ptr1__intE1_ptr1__ret_boolE1
	.def standard__crypto__X509__asn1_hdr__6__byteE1_ptr1__intE1__intE1__intE1_ptr1__intE1_ptr1__intE1_ptr1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__X509__asn1_hdr__6__byteE1_ptr1__intE1__intE1__intE1_ptr1__intE1_ptr1__intE1_ptr1__ret_boolE1:
	subq $32, %rsp
	movq %rbx, 16(%rsp)
	movq %rsi, 8(%rsp)
	movq %rdi, 0(%rsp)
	movq %r12, -8(%rsp)
.LB19161:
	movq 72(%rsp), %rax
	movq 80(%rsp), %rsi
	testl %r8d, %r8d
	js .LB19181
.LB19174:
	leal 2(%r8), %edi
	cmpl %edx, %edi
	jg .LB19181
.LB19182:
	movslq %r8d, %rdi
	movzbl (%rcx,%rdi,1), %edi
	movl %edi, %ebx
	andl $31, %ebx
	cmpl $31, %ebx
	je .LB19191
.LB19192:
	movl %edi, (%r9)
	leal 1(%r8), %edi
	movslq %edi, %rdi
	movzbl (%rcx,%rdi,1), %edi
	addl $2, %r8d
	movl %edi, %r9d
	andl $128, %r9d
	jne .LB19211
.LB19212:
.LB19213:
	testl %edi, %edi
	js .LB19266
.LB19258:
	leal (%r8,%rdi), %ecx
	cmpl %edx, %ecx
	jg .LB19266
.LB19267:
	movl %r8d, (%rax)
	movl %edi, (%rsi)
	movl $1, %eax
	movq 16(%rsp), %rbx
	movq 8(%rsp), %rsi
	movq 0(%rsp), %rdi
	movq -8(%rsp), %r12
	addq $32, %rsp
	ret
.LB19211:
	andl $127, %edi
	je .LB19231
.LB19218:
	cmpl $3, %edi
	jg .LB19231
.LB19223:
	leal (%r8,%rdi), %r9d
	cmpl %edx, %r9d
	jg .LB19231
.LB19232:
	xorl %r9d, %r9d
	xorl %ebx, %ebx
.LB19234:
	cmpl %edi, %ebx
	jge .LB19237
.LB19235:
	shll $8, %r9d
	leal (%r8,%rbx), %r12d
	movslq %r12d, %r12
	movzbl (%rcx,%r12,1), %r12d
	addl %r12d, %r9d
	incl %ebx
	cmpl %edi, %ebx
	jl .LB19235
.LB19237:
	addl %edi, %r8d
	movq %r9, %rdi
	testl %edi, %edi
	jns .LB19258
.LB19266:
	xorl %eax, %eax
	movq 16(%rsp), %rbx
	movq 8(%rsp), %rsi
	movq 0(%rsp), %rdi
	movq -8(%rsp), %r12
	addq $32, %rsp
	ret
.LB19231:
	xorl %eax, %eax
	movq 16(%rsp), %rbx
	movq 8(%rsp), %rsi
	movq 0(%rsp), %rdi
	movq -8(%rsp), %r12
	addq $32, %rsp
	ret
.LB19191:
	xorl %eax, %eax
	movq 16(%rsp), %rbx
	movq 8(%rsp), %rsi
	movq 0(%rsp), %rdi
	movq -8(%rsp), %r12
	addq $32, %rsp
	ret
.LB19181:
	xorl %eax, %eax
	movq 16(%rsp), %rbx
	movq 8(%rsp), %rsi
	movq 0(%rsp), %rdi
	movq -8(%rsp), %r12
	addq $32, %rsp
	ret
	.text
	.globl standard__crypto__X509__x509_oid_is__5__byteE1_ptr1__intE1__intE1__byteE1_ptr1__intE1__ret_boolE1
	.def standard__crypto__X509__x509_oid_is__5__byteE1_ptr1__intE1__intE1__byteE1_ptr1__intE1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__X509__x509_oid_is__5__byteE1_ptr1__intE1__intE1__byteE1_ptr1__intE1__ret_boolE1:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
	movq %rdi, -8(%rsp)
.LB19273:
	movl 56(%rsp), %eax
	cmpl %eax, %r8d
	jne .LB19283
.LB19284:
	xorl %esi, %esi
.LB19286:
	cmpl %eax, %esi
	jge .LB19289
.LB19287:
	leal (%rdx,%rsi), %edi
	movslq %esi, %r8
	movslq %edi, %rdi
	movzbl (%rcx,%rdi,1), %edi
	movzbl (%r9,%r8,1), %r8d
	cmpb %r8b, %dil
	jne .LB19304
.LB19305:
	incl %esi
	cmpl %eax, %esi
	jl .LB19287
.LB19289:
	movl $1, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB19304:
	xorl %eax, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB19283:
	xorl %eax, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
	.text
	.globl standard__crypto__X509__x509_days_from_civil__3__intE1__intE1__intE1__ret_dataE1_sbits64
	.def standard__crypto__X509__x509_days_from_civil__3__intE1__intE1__intE1__ret_dataE1_sbits64;
	.scl 2;
	.type 32;
	.endef
standard__crypto__X509__x509_days_from_civil__3__intE1__intE1__intE1__ret_dataE1_sbits64:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
	movq %rdi, -8(%rsp)
.LB19309:
	movabsq $2748779070, %rsi
	leal -1(%rcx), %eax
	cmpl $2, %edx
	cmovle %eax, %ecx
	movslq %ecx, %rax
	imulq %rax, %rsi
	sarq $40, %rsi
	shrq $63, %rax
	addl %esi, %eax
	imull $400, %eax, %esi
	subl %esi, %ecx
	leal 9(%rdx), %esi
	leal -3(%rdx), %edi
	cmpl $2, %edx
	cmovg %edi, %esi
	imull $153, %esi, %esi
	addl $2, %esi
	movslq %esi, %rdx
	movabsq $3435973837, %rsi
	imulq %rdx, %rsi
	sarq $34, %rsi
	shrq $63, %rdx
	addl %esi, %edx
	addl %r8d, %edx
	decl %edx
	imull $365, %ecx, %esi
	movl %ecx, %edi
	sarl $31, %edi
	shrl $30, %edi
	addl %ecx, %edi
	movslq %ecx, %rcx
	sarl $2, %edi
	addl %edi, %esi
	movabsq $2748779070, %rdi
	imulq %rcx, %rdi
	sarq $38, %rdi
	shrq $63, %rcx
	addl %edi, %ecx
	subl %ecx, %esi
	leal (%rsi,%rdx), %ecx
	imulq $146097, %rax, %rax
	addq %rcx, %rax
	subq $719468, %rax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
	.text
	.globl standard__crypto__X509__x509_digits__3__byteE1_ptr1__intE1__intE1__ret_intE1
	.def standard__crypto__X509__x509_digits__3__byteE1_ptr1__intE1__intE1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__X509__x509_digits__3__byteE1_ptr1__intE1__intE1__ret_intE1:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
	movq %rdi, -8(%rsp)
.LB19366:
	xorl %eax, %eax
	xorl %esi, %esi
.LB19372:
	cmpl %r8d, %eax
	jge .LB19375
.LB19373:
	imull $10, %esi, %esi
	leal (%rdx,%rax), %edi
	movslq %edi, %rdi
	movzbl (%rcx,%rdi,1), %edi
	subl $48, %edi
	addl %edi, %esi
	incl %eax
	cmpl %r8d, %eax
	jl .LB19373
.LB19375:
	movl %esi, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
	.text
	.globl standard__crypto__X509__x509_parse_time__5__byteE1_ptr1__intE1__intE1__intE1__dataE1_ptr1_sbits64__ret_boolE1
	.def standard__crypto__X509__x509_parse_time__5__byteE1_ptr1__intE1__intE1__intE1__dataE1_ptr1_sbits64__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__X509__x509_parse_time__5__byteE1_ptr1__intE1__intE1__intE1__dataE1_ptr1_sbits64__ret_boolE1:
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
.LB19393:
	movq 48(%rbp), %rbx
	movq %rcx, %rsi
	movl %edx, %edi
	cmpl $23, %r9d
	je .LB19408
.LB19409:
	cmpl $15, %r8d
	jne .LB19432
.LB19433:
	movq %rsi, %rcx
	movq %rdi, %rdx
	movl $4, %r8d
	callq standard__crypto__X509__x509_digits__3__byteE1_ptr1__intE1__intE1__ret_intE1
	movl %eax, %r12d
	addl $4, %edi
.LB19410:
	movq %rsi, %rcx
	movq %rdi, %rdx
	movl $2, %r8d
	callq standard__crypto__X509__x509_digits__3__byteE1_ptr1__intE1__intE1__ret_intE1
	movl %eax, %r13d
	leal 2(%rdi), %edx
	movq %rsi, %rcx
	movl $2, %r8d
	callq standard__crypto__X509__x509_digits__3__byteE1_ptr1__intE1__intE1__ret_intE1
	movl %eax, %r14d
	leal 4(%rdi), %edx
	movq %rsi, %rcx
	movl $2, %r8d
	callq standard__crypto__X509__x509_digits__3__byteE1_ptr1__intE1__intE1__ret_intE1
	movl %eax, %r15d
	leal 6(%rdi), %edx
	movq %rsi, %rcx
	movl $2, %r8d
	callq standard__crypto__X509__x509_digits__3__byteE1_ptr1__intE1__intE1__ret_intE1
	leal 8(%rdi), %edx
	movq %rsi, %rcx
	movl $2, %r8d
	movq %rax, -64(%rbp)
	callq standard__crypto__X509__x509_digits__3__byteE1_ptr1__intE1__intE1__ret_intE1
	movl %eax, %esi
	movq %r12, %rcx
	movq %r13, %rdx
	movq %r14, %r8
	callq standard__crypto__X509__x509_days_from_civil__3__intE1__intE1__intE1__ret_dataE1_sbits64
	movq -64(%rbp), %rcx
	imulq $86400, %rax, %rax
	imull $3600, %r15d, %r15d
	imull $60, %ecx, %ecx
	addl %ecx, %r15d
	addl %esi, %r15d
	movslq %r15d, %rcx
	addq %rcx, %rax
	movq %rax, (%rbx)
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
.LB19432:
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
.LB19408:
	cmpl $13, %r8d
	jne .LB19413
.LB19414:
	movq %rsi, %rcx
	movq %rdi, %rdx
	movl $2, %r8d
	callq standard__crypto__X509__x509_digits__3__byteE1_ptr1__intE1__intE1__ret_intE1
	leal 2000(%rax), %ecx
	leal 1900(%rax), %edx
	cmpl $50, %eax
	movl %edx, %r12d
	cmovl %ecx, %r12d
	addl $2, %edi
	jmp .LB19410
.LB19413:
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
	.globl standard__crypto__X509__x509_sig_alg__3__byteE1_ptr1__intE1__intE1__ret_intE1
	.def standard__crypto__X509__x509_sig_alg__3__byteE1_ptr1__intE1__intE1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__X509__x509_sig_alg__3__byteE1_ptr1__intE1__intE1__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
.LB19475:
	movq %rcx, %rsi
	movl %edx, %edi
	movl %r8d, %ebx
	leaq standard__crypto__X509__X509_OID_SHA256_RSA(%rip), %r9
	movq $9, 32(%rsp)
	movq %rsi, %rcx
	movq %rdi, %rdx
	movq %rbx, %r8
	callq standard__crypto__X509__x509_oid_is__5__byteE1_ptr1__intE1__intE1__byteE1_ptr1__intE1__ret_boolE1
	testb %al, %al
	jne .LB19484
.LB19485:
	leaq standard__crypto__X509__X509_OID_SHA384_RSA(%rip), %r9
	movq $9, 32(%rsp)
	movq %rsi, %rcx
	movq %rdi, %rdx
	movq %rbx, %r8
	callq standard__crypto__X509__x509_oid_is__5__byteE1_ptr1__intE1__intE1__byteE1_ptr1__intE1__ret_boolE1
	testb %al, %al
	jne .LB19492
.LB19493:
	leaq standard__crypto__X509__X509_OID_SHA512_RSA(%rip), %r9
	movq $9, 32(%rsp)
	movq %rsi, %rcx
	movq %rdi, %rdx
	movq %rbx, %r8
	callq standard__crypto__X509__x509_oid_is__5__byteE1_ptr1__intE1__intE1__byteE1_ptr1__intE1__ret_boolE1
	testb %al, %al
	jne .LB19500
.LB19501:
	leaq standard__crypto__X509__X509_OID_ECDSA_SHA256(%rip), %r9
	movq $8, 32(%rsp)
	movq %rsi, %rcx
	movq %rdi, %rdx
	movq %rbx, %r8
	callq standard__crypto__X509__x509_oid_is__5__byteE1_ptr1__intE1__intE1__byteE1_ptr1__intE1__ret_boolE1
	testb %al, %al
	jne .LB19508
.LB19509:
	leaq standard__crypto__X509__X509_OID_ECDSA_SHA384(%rip), %r9
	movq $8, 32(%rsp)
	movq %rsi, %rcx
	movq %rdi, %rdx
	movq %rbx, %r8
	callq standard__crypto__X509__x509_oid_is__5__byteE1_ptr1__intE1__intE1__byteE1_ptr1__intE1__ret_boolE1
	testb %al, %al
	jne .LB19516
.LB19517:
	leaq standard__crypto__X509__X509_OID_ECDSA_SHA512(%rip), %r9
	movq $8, 32(%rsp)
	movq %rsi, %rcx
	movq %rdi, %rdx
	movq %rbx, %r8
	callq standard__crypto__X509__x509_oid_is__5__byteE1_ptr1__intE1__intE1__byteE1_ptr1__intE1__ret_boolE1
	testb %al, %al
	jne .LB19524
.LB19525:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB19524:
	movl $6, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB19516:
	movl $5, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB19508:
	movl $4, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB19500:
	movl $3, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB19492:
	movl $2, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB19484:
	movl $1, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__crypto__X509__x509_parse_extensions__4__X509_CERTE1_ptr1__byteE1_ptr1__intE1__intE1__ret_voidE1
	.def standard__crypto__X509__x509_parse_extensions__4__X509_CERTE1_ptr1__byteE1_ptr1__intE1__intE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__X509__x509_parse_extensions__4__X509_CERTE1_ptr1__byteE1_ptr1__intE1__intE1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $144, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
.LB19527:
	movq %rcx, %rsi
	movq %rdx, %rdi
	movl %r8d, %eax
	movl $0, -44(%rbp)
	movl $0, -48(%rbp)
	movl $0, -52(%rbp)
	movl $0, -56(%rbp)
	movl $0, -60(%rbp)
	movl $0, -64(%rbp)
	movl $0, -68(%rbp)
	movl $0, -72(%rbp)
	movl $0, -76(%rbp)
	movl $0, -80(%rbp)
	movl $0, -84(%rbp)
	movl $0, -88(%rbp)
	leal (%rax,%r9), %ebx
	xorl %r12d, %r12d
.LB19553:
	cmpl %ebx, %eax
	jge .LB19555
.LB19554:
	leaq -44(%rbp), %r9
	leaq -48(%rbp), %rcx
	leaq -52(%rbp), %rdx
	movq %rcx, 32(%rsp)
	movq %rdx, 40(%rsp)
	movq %rdi, %rcx
	movq %rbx, %rdx
	movq %rax, %r8
	callq standard__crypto__X509__asn1_hdr__6__byteE1_ptr1__intE1__intE1__intE1_ptr1__intE1_ptr1__intE1_ptr1__ret_boolE1
	testb %al, %al
	je .LB19564
.LB19565:
	movl -48(%rbp), %r8d
	movl %r8d, %r13d
	addl -52(%rbp), %r13d
	cmpl $48, -44(%rbp)
	jne .LB19576
.LB19577:
	leaq -44(%rbp), %r9
	leaq -56(%rbp), %rax
	leaq -60(%rbp), %rcx
	movq %r13, %rdx
	movq %rax, 32(%rsp)
	movq %rcx, 40(%rsp)
	movq %rdi, %rcx
	callq standard__crypto__X509__asn1_hdr__6__byteE1_ptr1__intE1__intE1__intE1_ptr1__intE1_ptr1__intE1_ptr1__ret_boolE1
	testb %al, %al
	je .LB19584
.LB19585:
	movl -60(%rbp), %eax
	addl -56(%rbp), %eax
	cmpl %r13d, %eax
	jl .LB19593
.LB19594:
.LB19595:
	leaq -72(%rbp), %r9
	leaq -64(%rbp), %rcx
	leaq -68(%rbp), %rdx
	movq %rcx, 32(%rsp)
	movq %rdx, 40(%rsp)
	movq %rdi, %rcx
	movq %r13, %rdx
	movq %rax, %r8
	callq standard__crypto__X509__asn1_hdr__6__byteE1_ptr1__intE1__intE1__intE1_ptr1__intE1_ptr1__intE1_ptr1__ret_boolE1
	testb %al, %al
	je .LB19621
.LB19622:
	cmpl $4, -72(%rbp)
	jne .LB19626
.LB19627:
	movl -56(%rbp), %edx
	movl -60(%rbp), %r8d
	leaq standard__crypto__X509__X509_OID_BASIC(%rip), %r9
	movq $3, 32(%rsp)
	movq %rdi, %rcx
	callq standard__crypto__X509__x509_oid_is__5__byteE1_ptr1__intE1__intE1__byteE1_ptr1__intE1__ret_boolE1
	testb %al, %al
	jne .LB19634
.LB19635:
.LB19636:
	movl -56(%rbp), %edx
	movl -60(%rbp), %r8d
	leaq standard__crypto__X509__X509_OID_KEYUSE(%rip), %r9
	movq $3, 32(%rsp)
	movq %rdi, %rcx
	callq standard__crypto__X509__x509_oid_is__5__byteE1_ptr1__intE1__intE1__byteE1_ptr1__intE1__ret_boolE1
	testb %al, %al
	jne .LB19742
.LB19744:
	movl -56(%rbp), %edx
	movl -60(%rbp), %r8d
	leaq standard__crypto__X509__X509_OID_SAN(%rip), %r9
	movq $3, 32(%rsp)
	movq %rdi, %rcx
	callq standard__crypto__X509__x509_oid_is__5__byteE1_ptr1__intE1__intE1__byteE1_ptr1__intE1__ret_boolE1
	testb %al, %al
	jne .LB19779
.LB19781:
	movq %r13, %rax
	cmpl %ebx, %eax
	jl .LB19554
.LB19555:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB19593:
	movslq %eax, %rcx
	cmpb $1, (%rdi,%rcx,1)
	je .LB19602
.LB19603:
.LB19604:
	jmp .LB19595
.LB19602:
	leaq -72(%rbp), %r9
	leaq -76(%rbp), %rcx
	leaq -80(%rbp), %rdx
	movq %rcx, 32(%rsp)
	movq %rdx, 40(%rsp)
	movq %rdi, %rcx
	movq %r13, %rdx
	movq %rax, %r8
	callq standard__crypto__X509__asn1_hdr__6__byteE1_ptr1__intE1__intE1__intE1_ptr1__intE1_ptr1__intE1_ptr1__ret_boolE1
	testb %al, %al
	je .LB19610
.LB19611:
	movl -80(%rbp), %eax
	addl -76(%rbp), %eax
	jmp .LB19604
.LB19634:
	orb $128, 172(%rsi)
	andb $191, 172(%rsi)
	movl $4294967295, 176(%rsi)
	movl -64(%rbp), %r8d
	leaq -72(%rbp), %r9
	leaq -76(%rbp), %rax
	leaq -80(%rbp), %rcx
	movl %r8d, %edx
	addl -68(%rbp), %edx
	movq %rax, 32(%rsp)
	movq %rcx, 40(%rsp)
	movq %rdi, %rcx
	callq standard__crypto__X509__asn1_hdr__6__byteE1_ptr1__intE1__intE1__intE1_ptr1__intE1_ptr1__intE1_ptr1__ret_boolE1
	testb %al, %al
	jne .LB19650
.LB19651:
.LB19652:
	jmp .LB19636
.LB19650:
	movl -76(%rbp), %r12d
	movl %r12d, %eax
	addl -80(%rbp), %eax
	cmpl %eax, %r12d
	jl .LB19659
.LB19660:
.LB19661:
	movl -80(%rbp), %eax
	addl -76(%rbp), %eax
	cmpl %eax, %r12d
	jl .LB19704
.LB19706:
	jmp .LB19652
.LB19659:
	movslq %r12d, %rcx
	cmpb $1, (%rdi,%rcx,1)
	je .LB19668
.LB19669:
.LB19670:
	jmp .LB19661
.LB19668:
	leaq -72(%rbp), %r9
	leaq -84(%rbp), %rcx
	leaq -88(%rbp), %rdx
	movq %rcx, 32(%rsp)
	movq %rdx, 40(%rsp)
	movq %rdi, %rcx
	movq %rax, %rdx
	movq %r12, %r8
	callq standard__crypto__X509__asn1_hdr__6__byteE1_ptr1__intE1__intE1__intE1_ptr1__intE1_ptr1__intE1_ptr1__ret_boolE1
	testb %al, %al
	jne .LB19677
.LB19678:
.LB19679:
	jmp .LB19670
.LB19677:
	cmpl $1, -88(%rbp)
	jne .LB19693
.LB19682:
	movslq -84(%rbp), %rax
	cmpb $0, (%rdi,%rax,1)
	jne .LB19691
.LB19693:
	movl -88(%rbp), %eax
	movl %eax, %r12d
	addl -84(%rbp), %r12d
	jmp .LB19679
.LB19691:
	orb $64, 172(%rsi)
	jmp .LB19693
.LB19704:
	movslq %r12d, %rcx
	cmpb $2, (%rdi,%rcx,1)
	jne .LB19706
.LB19713:
	leaq -72(%rbp), %r9
	leaq -84(%rbp), %rcx
	leaq -88(%rbp), %rdx
	movq %rcx, 32(%rsp)
	movq %rdx, 40(%rsp)
	movq %rdi, %rcx
	movq %rax, %rdx
	movq %r12, %r8
	callq standard__crypto__X509__asn1_hdr__6__byteE1_ptr1__intE1__intE1__intE1_ptr1__intE1_ptr1__intE1_ptr1__ret_boolE1
	testb %al, %al
	je .LB19706
.LB19722:
	cmpl $1, -88(%rbp)
	jne .LB19706
.LB19727:
	movslq -84(%rbp), %rax
	movzbl (%rdi,%rax,1), %eax
	movl %eax, 176(%rsi)
	jmp .LB19706
.LB19742:
	movl -64(%rbp), %r8d
	leaq -72(%rbp), %r9
	leaq -76(%rbp), %rax
	leaq -80(%rbp), %rcx
	movl %r8d, %edx
	addl -68(%rbp), %edx
	movq %rax, 32(%rsp)
	movq %rcx, 40(%rsp)
	movq %rdi, %rcx
	callq standard__crypto__X509__asn1_hdr__6__byteE1_ptr1__intE1__intE1__intE1_ptr1__intE1_ptr1__intE1_ptr1__ret_boolE1
	testb %al, %al
	je .LB19744
.LB19751:
	cmpl $3, -72(%rbp)
	jne .LB19744
.LB19756:
	cmpl $2, -80(%rbp)
	jl .LB19744
.LB19761:
	orb $128, 180(%rsi)
	movl -76(%rbp), %eax
	incl %eax
	movslq %eax, %rax
	movzbl (%rdi,%rax,1), %eax
	movl %eax, 184(%rsi)
	jmp .LB19744
.LB19779:
	movl -64(%rbp), %r8d
	leaq -72(%rbp), %r9
	leaq -76(%rbp), %rax
	leaq -80(%rbp), %rcx
	movl %r8d, %edx
	addl -68(%rbp), %edx
	movq %rax, 32(%rsp)
	movq %rcx, 40(%rsp)
	movq %rdi, %rcx
	callq standard__crypto__X509__asn1_hdr__6__byteE1_ptr1__intE1__intE1__intE1_ptr1__intE1_ptr1__intE1_ptr1__ret_boolE1
	testb %al, %al
	je .LB19781
.LB19788:
	movslq -76(%rbp), %rax
	leaq (%rdi,%rax,1), %rax
	movq %rax, 144(%rsi)
	movl -80(%rbp), %eax
	movl %eax, 152(%rsi)
	jmp .LB19781
.LB19626:
	movq %r13, %rax
	cmpl %ebx, %eax
	jl .LB19554
	jmp .LB19555
.LB19621:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB19610:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB19584:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB19576:
	movq %r13, %rax
	jmp .LB19553
.LB19564:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
	.text
	.globl standard__crypto__X509__x509_find_cn__4__X509_CERTE1_ptr1__byteE1_ptr1__intE1__intE1__ret_voidE1
	.def standard__crypto__X509__x509_find_cn__4__X509_CERTE1_ptr1__byteE1_ptr1__intE1__intE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__X509__x509_find_cn__4__X509_CERTE1_ptr1__byteE1_ptr1__intE1__intE1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $144, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
	movq %r14, -48(%rbp)
.LB19799:
	movq %rcx, %rsi
	movq %rdx, %rdi
	movl %r8d, %eax
	movl $0, -52(%rbp)
	movl $0, -56(%rbp)
	movl $0, -60(%rbp)
	movl $0, -64(%rbp)
	movl $0, -68(%rbp)
	movl $0, -72(%rbp)
	movl $0, -76(%rbp)
	movl $0, -80(%rbp)
	movl $0, -84(%rbp)
	movl $0, -88(%rbp)
	leal (%rax,%r9), %ebx
	xorl %r12d, %r12d
	xorl %r13d, %r13d
.LB19824:
	cmpl %ebx, %eax
	jge .LB19826
.LB19825:
	leaq -52(%rbp), %r9
	leaq -56(%rbp), %rcx
	leaq -60(%rbp), %rdx
	movq %rcx, 32(%rsp)
	movq %rdx, 40(%rsp)
	movq %rdi, %rcx
	movq %rbx, %rdx
	movq %rax, %r8
	callq standard__crypto__X509__asn1_hdr__6__byteE1_ptr1__intE1__intE1__intE1_ptr1__intE1_ptr1__intE1_ptr1__ret_boolE1
	testb %al, %al
	je .LB19835
.LB19836:
	movl -56(%rbp), %eax
	movl %eax, %r14d
	addl -60(%rbp), %r14d
.LB19845:
	cmpl %r14d, %eax
	jge .LB19847
.LB19846:
	leaq -52(%rbp), %r9
	leaq -64(%rbp), %rcx
	leaq -68(%rbp), %rdx
	movq %rcx, 32(%rsp)
	movq %rdx, 40(%rsp)
	movq %rdi, %rcx
	movq %r14, %rdx
	movq %rax, %r8
	callq standard__crypto__X509__asn1_hdr__6__byteE1_ptr1__intE1__intE1__intE1_ptr1__intE1_ptr1__intE1_ptr1__ret_boolE1
	testb %al, %al
	je .LB19856
.LB19857:
	movl -64(%rbp), %r8d
	leaq -52(%rbp), %r9
	leaq -72(%rbp), %rax
	leaq -76(%rbp), %rcx
	movl %r8d, %r12d
	addl -68(%rbp), %r12d
	movq %rax, 32(%rsp)
	movq %rcx, 40(%rsp)
	movq %rdi, %rcx
	movq %r12, %rdx
	callq standard__crypto__X509__asn1_hdr__6__byteE1_ptr1__intE1__intE1__intE1_ptr1__intE1_ptr1__intE1_ptr1__ret_boolE1
	testb %al, %al
	je .LB19871
.LB19872:
	movl -76(%rbp), %eax
	leaq -88(%rbp), %r9
	leaq -84(%rbp), %rcx
	movq %r12, %rdx
	movl %eax, %r13d
	addl -72(%rbp), %r13d
	leaq -80(%rbp), %rax
	movq %rax, 32(%rsp)
	movq %rcx, 40(%rsp)
	movq %rdi, %rcx
	movq %r13, %r8
	callq standard__crypto__X509__asn1_hdr__6__byteE1_ptr1__intE1__intE1__intE1_ptr1__intE1_ptr1__intE1_ptr1__ret_boolE1
	testb %al, %al
	je .LB19882
.LB19883:
	movl -72(%rbp), %edx
	movl -76(%rbp), %r8d
	leaq standard__crypto__X509__X509_OID_CN(%rip), %r9
	movq $3, 32(%rsp)
	movq %rdi, %rcx
	callq standard__crypto__X509__x509_oid_is__5__byteE1_ptr1__intE1__intE1__byteE1_ptr1__intE1__ret_boolE1
	testb %al, %al
	jne .LB19890
.LB19892:
	movq %r12, %rax
	movq %r12, %r11
	movq %r13, %r12
	movq %r11, %r13
	cmpl %r14d, %eax
	jl .LB19846
	jmp .LB19847
.LB19826:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	leave
	ret
.LB19847:
	movq %r14, %rax
	cmpl %ebx, %eax
	jl .LB19825
	jmp .LB19826
.LB19890:
	movslq -80(%rbp), %rax
	leaq (%rdi,%rax,1), %rax
	movq %rax, 160(%rsi)
	movl -84(%rbp), %eax
	movl %eax, 168(%rsi)
	jmp .LB19892
.LB19882:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	leave
	ret
.LB19871:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	leave
	ret
.LB19856:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	leave
	ret
.LB19835:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	leave
	ret
	.text
	.globl standard__crypto__X509__x509_parse__3__X509_CERTE1_ptr1__byteE1_ptr1__intE1__ret_boolE1
	.def standard__crypto__X509__x509_parse__3__X509_CERTE1_ptr1__byteE1_ptr1__intE1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__X509__x509_parse__3__X509_CERTE1_ptr1__byteE1_ptr1__intE1__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $160, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
.LB19901:
	movq %rcx, %rsi
	movq %rdx, %rdi
	movl %r8d, %edx
	movl $0, -44(%rbp)
	movl $0, -48(%rbp)
	movl $0, -52(%rbp)
	movl $0, -56(%rbp)
	movl $0, -60(%rbp)
	movl $0, -64(%rbp)
	movl $0, -68(%rbp)
	movl $0, -72(%rbp)
	movl $0, -76(%rbp)
	movl $0, -80(%rbp)
	movl $0, -84(%rbp)
	movl $0, -88(%rbp)
	movl $0, -92(%rbp)
	movl $0, -96(%rbp)
	movl $0, -100(%rbp)
	movq %rdi, (%rsi)
	movl %edx, 8(%rsi)
	movl $0, 28(%rsi)
	movl $0, 92(%rsi)
	movq $0, 144(%rsi)
	movl $0, 152(%rsi)
	movq $0, 160(%rsi)
	movl $0, 168(%rsi)
	andb $127, 172(%rsi)
	andb $191, 172(%rsi)
	movl $4294967295, 176(%rsi)
	andb $127, 180(%rsi)
	leaq -44(%rbp), %r9
	leaq -48(%rbp), %rax
	leaq -52(%rbp), %rcx
	movl $0, 184(%rsi)
	movq $0, 96(%rsi)
	movq $0, 112(%rsi)
	movq $0, 128(%rsi)
	xorl %r8d, %r8d
	movq %rax, 32(%rsp)
	movq %rcx, 40(%rsp)
	movq %rdi, %rcx
	callq standard__crypto__X509__asn1_hdr__6__byteE1_ptr1__intE1__intE1__intE1_ptr1__intE1_ptr1__intE1_ptr1__ret_boolE1
	testb %al, %al
	je .LB19984
.LB19979:
	cmpl $48, -44(%rbp)
	jne .LB19984
.LB19985:
	movl -48(%rbp), %ebx
	leaq -44(%rbp), %r9
	leaq -56(%rbp), %rax
	leaq -60(%rbp), %rcx
	movl %ebx, %r12d
	addl -52(%rbp), %r12d
	movq %rbx, %r8
	movq %rax, 32(%rsp)
	movq %rcx, 40(%rsp)
	movq %rdi, %rcx
	movq %r12, %rdx
	callq standard__crypto__X509__asn1_hdr__6__byteE1_ptr1__intE1__intE1__intE1_ptr1__intE1_ptr1__intE1_ptr1__ret_boolE1
	testb %al, %al
	je .LB20001
.LB19996:
	cmpl $48, -44(%rbp)
	jne .LB20001
.LB20002:
	movslq %ebx, %rax
	leaq -44(%rbp), %r9
	leaq -72(%rbp), %rcx
	movq %r12, %rdx
	leaq (%rdi,%rax,1), %rax
	movq %rax, 16(%rsi)
	movl -60(%rbp), %eax
	addl -56(%rbp), %eax
	subl %ebx, %eax
	movl %eax, 24(%rsi)
	movl -60(%rbp), %eax
	movl %eax, %r8d
	addl -56(%rbp), %r8d
	leaq -68(%rbp), %rax
	movq %rax, 32(%rsp)
	movq %rcx, 40(%rsp)
	movq %rdi, %rcx
	callq standard__crypto__X509__asn1_hdr__6__byteE1_ptr1__intE1__intE1__intE1_ptr1__intE1_ptr1__intE1_ptr1__ret_boolE1
	testb %al, %al
	je .LB20029
.LB20024:
	cmpl $48, -44(%rbp)
	jne .LB20029
.LB20030:
	movl -68(%rbp), %r8d
	leaq -64(%rbp), %r9
	leaq -76(%rbp), %rax
	leaq -80(%rbp), %rcx
	movl %r8d, %edx
	addl -72(%rbp), %edx
	movq %rax, 32(%rsp)
	movq %rcx, 40(%rsp)
	movq %rdi, %rcx
	callq standard__crypto__X509__asn1_hdr__6__byteE1_ptr1__intE1__intE1__intE1_ptr1__intE1_ptr1__intE1_ptr1__ret_boolE1
	testb %al, %al
	jne .LB20038
.LB20040:
	movl -72(%rbp), %eax
	leaq -44(%rbp), %r9
	leaq -72(%rbp), %rcx
	movq %r12, %rdx
	movl %eax, %r8d
	addl -68(%rbp), %r8d
	leaq -68(%rbp), %rax
	movq %rax, 32(%rsp)
	movq %rcx, 40(%rsp)
	movq %rdi, %rcx
	callq standard__crypto__X509__asn1_hdr__6__byteE1_ptr1__intE1__intE1__intE1_ptr1__intE1_ptr1__intE1_ptr1__ret_boolE1
	testb %al, %al
	je .LB20065
.LB20055:
	cmpl $3, -44(%rbp)
	jne .LB20065
.LB20060:
	cmpl $1, -72(%rbp)
	jl .LB20065
.LB20066:
	movslq -68(%rbp), %rax
	leaq 1(%rdi,%rax,1), %rax
	movq %rax, 32(%rsi)
	movl -72(%rbp), %eax
	decl %eax
	movl %eax, 40(%rsi)
	movl -56(%rbp), %eax
	movl %eax, %ebx
	addl -60(%rbp), %ebx
	cmpl %ebx, %eax
	jl .LB20085
.LB20086:
.LB20087:
	leaq -44(%rbp), %r9
	leaq -48(%rbp), %rcx
	leaq -52(%rbp), %rdx
	movq %rcx, 32(%rsp)
	movq %rdx, 40(%rsp)
	movq %rdi, %rcx
	movq %rbx, %rdx
	movq %rax, %r8
	callq standard__crypto__X509__asn1_hdr__6__byteE1_ptr1__intE1__intE1__intE1_ptr1__intE1_ptr1__intE1_ptr1__ret_boolE1
	testb %al, %al
	je .LB20118
.LB20113:
	cmpl $2, -44(%rbp)
	jne .LB20118
.LB20119:
	movl -52(%rbp), %eax
	leaq -44(%rbp), %r9
	leaq -52(%rbp), %rcx
	movq %rbx, %rdx
	movl %eax, %r8d
	addl -48(%rbp), %r8d
	leaq -48(%rbp), %rax
	movq %rax, 32(%rsp)
	movq %rcx, 40(%rsp)
	movq %rdi, %rcx
	callq standard__crypto__X509__asn1_hdr__6__byteE1_ptr1__intE1__intE1__intE1_ptr1__intE1_ptr1__intE1_ptr1__ret_boolE1
	testb %al, %al
	je .LB20134
.LB20129:
	cmpl $48, -44(%rbp)
	jne .LB20134
.LB20135:
	movl -52(%rbp), %eax
	leaq -44(%rbp), %r9
	leaq -52(%rbp), %rcx
	movq %rbx, %rdx
	movl %eax, %r12d
	addl -48(%rbp), %r12d
	leaq -48(%rbp), %rax
	movq %rax, 32(%rsp)
	movq %rcx, 40(%rsp)
	movq %rdi, %rcx
	movq %r12, %r8
	callq standard__crypto__X509__asn1_hdr__6__byteE1_ptr1__intE1__intE1__intE1_ptr1__intE1_ptr1__intE1_ptr1__ret_boolE1
	testb %al, %al
	je .LB20150
.LB20145:
	cmpl $48, -44(%rbp)
	jne .LB20150
.LB20151:
	movslq %r12d, %rax
	leaq -44(%rbp), %r9
	leaq -52(%rbp), %rcx
	movq %rbx, %rdx
	leaq (%rdi,%rax,1), %rax
	movq %rax, 48(%rsi)
	movl -52(%rbp), %eax
	addl -48(%rbp), %eax
	subl %r12d, %eax
	movl %eax, 56(%rsi)
	movl -52(%rbp), %eax
	movl %eax, %r8d
	addl -48(%rbp), %r8d
	leaq -48(%rbp), %rax
	movq %rax, 32(%rsp)
	movq %rcx, 40(%rsp)
	movq %rdi, %rcx
	callq standard__crypto__X509__asn1_hdr__6__byteE1_ptr1__intE1__intE1__intE1_ptr1__intE1_ptr1__intE1_ptr1__ret_boolE1
	testb %al, %al
	je .LB20178
.LB20173:
	cmpl $48, -44(%rbp)
	jne .LB20178
.LB20179:
	movl -48(%rbp), %r8d
	leaq -92(%rbp), %r9
	leaq -96(%rbp), %rax
	leaq -100(%rbp), %rcx
	movl %r8d, %edx
	addl -52(%rbp), %edx
	movq %rax, 32(%rsp)
	movq %rcx, 40(%rsp)
	movq %rdi, %rcx
	callq standard__crypto__X509__asn1_hdr__6__byteE1_ptr1__intE1__intE1__intE1_ptr1__intE1_ptr1__intE1_ptr1__ret_boolE1
	testb %al, %al
	je .LB20189
.LB20190:
	leaq 76(%rsi), %rax
	movl -96(%rbp), %edx
	movl -100(%rbp), %r8d
	movl -92(%rbp), %r9d
	movq %rdi, %rcx
	movq %rax, 32(%rsp)
	callq standard__crypto__X509__x509_parse_time__5__byteE1_ptr1__intE1__intE1__intE1__dataE1_ptr1_sbits64__ret_boolE1
	testb %al, %al
	je .LB20200
.LB20201:
	movl -100(%rbp), %eax
	leaq -92(%rbp), %r9
	leaq -100(%rbp), %rcx
	movl %eax, %r8d
	addl -96(%rbp), %r8d
	movl -52(%rbp), %eax
	movl %eax, %edx
	addl -48(%rbp), %edx
	leaq -96(%rbp), %rax
	movq %rax, 32(%rsp)
	movq %rcx, 40(%rsp)
	movq %rdi, %rcx
	callq standard__crypto__X509__asn1_hdr__6__byteE1_ptr1__intE1__intE1__intE1_ptr1__intE1_ptr1__intE1_ptr1__ret_boolE1
	testb %al, %al
	je .LB20213
.LB20214:
	leaq 84(%rsi), %rax
	movl -96(%rbp), %edx
	movl -100(%rbp), %r8d
	movl -92(%rbp), %r9d
	movq %rdi, %rcx
	movq %rax, 32(%rsp)
	callq standard__crypto__X509__x509_parse_time__5__byteE1_ptr1__intE1__intE1__intE1__dataE1_ptr1_sbits64__ret_boolE1
	testb %al, %al
	je .LB20224
.LB20225:
	movl -52(%rbp), %eax
	leaq -44(%rbp), %r9
	leaq -52(%rbp), %rcx
	movq %rbx, %rdx
	movl %eax, %r12d
	addl -48(%rbp), %r12d
	leaq -48(%rbp), %rax
	movq %rax, 32(%rsp)
	movq %rcx, 40(%rsp)
	movq %rdi, %rcx
	movq %r12, %r8
	callq standard__crypto__X509__asn1_hdr__6__byteE1_ptr1__intE1__intE1__intE1_ptr1__intE1_ptr1__intE1_ptr1__ret_boolE1
	testb %al, %al
	je .LB20240
.LB20235:
	cmpl $48, -44(%rbp)
	jne .LB20240
.LB20241:
	movslq %r12d, %rax
	leaq (%rdi,%rax,1), %rax
	movq %rax, 64(%rsi)
	movl -52(%rbp), %eax
	addl -48(%rbp), %eax
	subl %r12d, %eax
	movl %eax, 72(%rsi)
	movl -48(%rbp), %r8d
	movl -52(%rbp), %r9d
	movq %rsi, %rcx
	movq %rdi, %rdx
	callq standard__crypto__X509__x509_find_cn__4__X509_CERTE1_ptr1__byteE1_ptr1__intE1__intE1__ret_voidE1
	movl -52(%rbp), %eax
	leaq -44(%rbp), %r9
	leaq -52(%rbp), %rcx
	movq %rbx, %rdx
	movl %eax, %r8d
	addl -48(%rbp), %r8d
	leaq -48(%rbp), %rax
	movq %rax, 32(%rsp)
	movq %rcx, 40(%rsp)
	movq %rdi, %rcx
	callq standard__crypto__X509__asn1_hdr__6__byteE1_ptr1__intE1__intE1__intE1_ptr1__intE1_ptr1__intE1_ptr1__ret_boolE1
	testb %al, %al
	je .LB20273
.LB20268:
	cmpl $48, -44(%rbp)
	jne .LB20273
.LB20274:
	movl -48(%rbp), %r8d
	leaq -44(%rbp), %r9
	leaq -68(%rbp), %rax
	leaq -72(%rbp), %rcx
	movl %r8d, %r12d
	addl -52(%rbp), %r12d
	movq %rax, 32(%rsp)
	movq %rcx, 40(%rsp)
	movq %rdi, %rcx
	movq %r12, %rdx
	callq standard__crypto__X509__asn1_hdr__6__byteE1_ptr1__intE1__intE1__intE1_ptr1__intE1_ptr1__intE1_ptr1__ret_boolE1
	testb %al, %al
	je .LB20293
.LB20288:
	cmpl $48, -44(%rbp)
	jne .LB20293
.LB20294:
	movl -68(%rbp), %r8d
	leaq -64(%rbp), %r9
	leaq -84(%rbp), %rax
	leaq -88(%rbp), %rcx
	movl %r8d, %edx
	addl -72(%rbp), %edx
	movq %rax, 32(%rsp)
	movq %rcx, 40(%rsp)
	movq %rdi, %rcx
	callq standard__crypto__X509__asn1_hdr__6__byteE1_ptr1__intE1__intE1__intE1_ptr1__intE1_ptr1__intE1_ptr1__ret_boolE1
	testb %al, %al
	je .LB20308
.LB20303:
	cmpl $6, -64(%rbp)
	jne .LB20308
.LB20309:
	movl -88(%rbp), %eax
	leaq -44(%rbp), %r9
	leaq -80(%rbp), %rcx
	movq %r12, %rdx
	movl %eax, %r13d
	addl -84(%rbp), %r13d
	movl -72(%rbp), %eax
	movl %eax, %r8d
	addl -68(%rbp), %r8d
	leaq -76(%rbp), %rax
	movq %rax, 32(%rsp)
	movq %rcx, 40(%rsp)
	movq %rdi, %rcx
	callq standard__crypto__X509__asn1_hdr__6__byteE1_ptr1__intE1__intE1__intE1_ptr1__intE1_ptr1__intE1_ptr1__ret_boolE1
	testb %al, %al
	je .LB20332
.LB20322:
	cmpl $3, -44(%rbp)
	jne .LB20332
.LB20327:
	cmpl $2, -80(%rbp)
	jl .LB20332
.LB20333:
	movl -84(%rbp), %edx
	movl -88(%rbp), %r8d
	leaq standard__crypto__X509__X509_OID_RSA(%rip), %r9
	movq $9, 32(%rsp)
	movq %rdi, %rcx
	callq standard__crypto__X509__x509_oid_is__5__byteE1_ptr1__intE1__intE1__byteE1_ptr1__intE1__ret_boolE1
	testb %al, %al
	jne .LB20340
.LB20342:
	movl -84(%rbp), %edx
	movl -88(%rbp), %r8d
	leaq standard__crypto__X509__X509_OID_EC_KEY(%rip), %r9
	movq $7, 32(%rsp)
	movq %rdi, %rcx
	callq standard__crypto__X509__x509_oid_is__5__byteE1_ptr1__intE1__intE1__byteE1_ptr1__intE1__ret_boolE1
	testb %al, %al
	jne .LB20416
.LB20418:
.LB20494:
	cmpl %ebx, %r12d
	jge .LB20496
.LB20495:
	leaq -44(%rbp), %r9
	leaq -48(%rbp), %rax
	leaq -52(%rbp), %rcx
	movq %rbx, %rdx
	movq %r12, %r8
	movq %rax, 32(%rsp)
	movq %rcx, 40(%rsp)
	movq %rdi, %rcx
	callq standard__crypto__X509__asn1_hdr__6__byteE1_ptr1__intE1__intE1__intE1_ptr1__intE1_ptr1__intE1_ptr1__ret_boolE1
	testb %al, %al
	je .LB20505
.LB20506:
	cmpl $163, -44(%rbp)
	je .LB20510
.LB20512:
	movl -52(%rbp), %eax
	movl %eax, %r12d
	addl -48(%rbp), %r12d
	cmpl %ebx, %r12d
	jl .LB20495
	jmp .LB20496
.LB20038:
	movl -76(%rbp), %edx
	movl -80(%rbp), %r8d
	movq %rdi, %rcx
	callq standard__crypto__X509__x509_sig_alg__3__byteE1_ptr1__intE1__intE1__ret_intE1
	movl %eax, 28(%rsi)
	jmp .LB20040
.LB20085:
	movslq %eax, %rcx
	cmpb $160, (%rdi,%rcx,1)
	je .LB20094
.LB20095:
.LB20096:
	jmp .LB20087
.LB20094:
	leaq -44(%rbp), %r9
	leaq -48(%rbp), %rcx
	leaq -52(%rbp), %rdx
	movq %rcx, 32(%rsp)
	movq %rdx, 40(%rsp)
	movq %rdi, %rcx
	movq %rbx, %rdx
	movq %rax, %r8
	callq standard__crypto__X509__asn1_hdr__6__byteE1_ptr1__intE1__intE1__intE1_ptr1__intE1_ptr1__intE1_ptr1__ret_boolE1
	testb %al, %al
	je .LB20102
.LB20103:
	movl -52(%rbp), %eax
	addl -48(%rbp), %eax
	jmp .LB20096
.LB20340:
	movl -76(%rbp), %eax
	leaq -44(%rbp), %r9
	leaq -52(%rbp), %rcx
	movl %eax, %edx
	addl -80(%rbp), %edx
	leal 1(%rax), %r8d
	leaq -48(%rbp), %rax
	movq %rax, 32(%rsp)
	movq %rcx, 40(%rsp)
	movq %rdi, %rcx
	callq standard__crypto__X509__asn1_hdr__6__byteE1_ptr1__intE1__intE1__intE1_ptr1__intE1_ptr1__intE1_ptr1__ret_boolE1
	testb %al, %al
	je .LB20356
.LB20351:
	cmpl $48, -44(%rbp)
	jne .LB20356
.LB20357:
	movl -48(%rbp), %r8d
	leaq -92(%rbp), %r9
	leaq -96(%rbp), %rax
	leaq -100(%rbp), %rcx
	movl %r8d, %edx
	addl -52(%rbp), %edx
	movq %rax, 32(%rsp)
	movq %rcx, 40(%rsp)
	movq %rdi, %rcx
	callq standard__crypto__X509__asn1_hdr__6__byteE1_ptr1__intE1__intE1__intE1_ptr1__intE1_ptr1__intE1_ptr1__ret_boolE1
	testb %al, %al
	je .LB20372
.LB20367:
	cmpl $2, -92(%rbp)
	jne .LB20372
.LB20373:
	movslq -96(%rbp), %rax
	leaq -92(%rbp), %r9
	leaq -100(%rbp), %rcx
	leaq (%rdi,%rax,1), %rax
	movq %rax, 96(%rsi)
	movl -100(%rbp), %eax
	movl %eax, 104(%rsi)
	movl -100(%rbp), %eax
	movl %eax, %r8d
	addl -96(%rbp), %r8d
	movl -52(%rbp), %eax
	movl %eax, %edx
	addl -48(%rbp), %edx
	leaq -96(%rbp), %rax
	movq %rax, 32(%rsp)
	movq %rcx, 40(%rsp)
	movq %rdi, %rcx
	callq standard__crypto__X509__asn1_hdr__6__byteE1_ptr1__intE1__intE1__intE1_ptr1__intE1_ptr1__intE1_ptr1__ret_boolE1
	testb %al, %al
	je .LB20398
.LB20393:
	cmpl $2, -92(%rbp)
	jne .LB20398
.LB20399:
	movslq -96(%rbp), %rax
	leaq (%rdi,%rax,1), %rax
	movq %rax, 112(%rsi)
	movl -100(%rbp), %eax
	movl %eax, 120(%rsi)
	movl $1, 92(%rsi)
	jmp .LB20342
.LB20416:
	movl -72(%rbp), %eax
	leaq -44(%rbp), %r9
	leaq -52(%rbp), %rcx
	movq %r13, %r8
	movl %eax, %edx
	addl -68(%rbp), %edx
	leaq -48(%rbp), %rax
	movq %rax, 32(%rsp)
	movq %rcx, 40(%rsp)
	movq %rdi, %rcx
	callq standard__crypto__X509__asn1_hdr__6__byteE1_ptr1__intE1__intE1__intE1_ptr1__intE1_ptr1__intE1_ptr1__ret_boolE1
	testb %al, %al
	je .LB20431
.LB20426:
	cmpl $6, -44(%rbp)
	jne .LB20431
.LB20432:
	movl -48(%rbp), %edx
	movl -52(%rbp), %r8d
	leaq standard__crypto__X509__X509_OID_P256(%rip), %r9
	movq $8, 32(%rsp)
	movq %rdi, %rcx
	callq standard__crypto__X509__x509_oid_is__5__byteE1_ptr1__intE1__intE1__byteE1_ptr1__intE1__ret_boolE1
	testb %al, %al
	je .LB20446
.LB20439:
	cmpl $66, -80(%rbp)
	je .LB20444
.LB20446:
	movl -48(%rbp), %edx
	movl -52(%rbp), %r8d
	leaq standard__crypto__X509__X509_OID_P384(%rip), %r9
	movq $5, 32(%rsp)
	movq %rdi, %rcx
	callq standard__crypto__X509__x509_oid_is__5__byteE1_ptr1__intE1__intE1__byteE1_ptr1__intE1__ret_boolE1
	testb %al, %al
	je .LB20461
.LB20454:
	cmpl $98, -80(%rbp)
	je .LB20459
.LB20461:
	movslq -76(%rbp), %rax
	leaq 1(%rdi,%rax,1), %rax
	movq %rax, 128(%rsi)
	movl -80(%rbp), %eax
	decl %eax
	movl %eax, 136(%rsi)
	cmpl $0, 92(%rsi)
	je .LB20418
.LB20479:
	movl -76(%rbp), %eax
	incl %eax
	movslq %eax, %rax
	cmpb $4, (%rdi,%rax,1)
	jne .LB20489
	jmp .LB20418
.LB20444:
	movl $2, 92(%rsi)
	jmp .LB20446
.LB20459:
	movl $3, 92(%rsi)
	jmp .LB20461
.LB20489:
	movl $0, 92(%rsi)
	jmp .LB20418
.LB20496:
	movl $1, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB20510:
	movl -48(%rbp), %r8d
	leaq -92(%rbp), %r9
	leaq -96(%rbp), %rax
	leaq -100(%rbp), %rcx
	movl %r8d, %edx
	addl -52(%rbp), %edx
	movq %rax, 32(%rsp)
	movq %rcx, 40(%rsp)
	movq %rdi, %rcx
	callq standard__crypto__X509__asn1_hdr__6__byteE1_ptr1__intE1__intE1__intE1_ptr1__intE1_ptr1__intE1_ptr1__ret_boolE1
	testb %al, %al
	je .LB20512
.LB20519:
	movl -96(%rbp), %r8d
	movl -100(%rbp), %r9d
	movq %rsi, %rcx
	movq %rdi, %rdx
	callq standard__crypto__X509__x509_parse_extensions__4__X509_CERTE1_ptr1__byteE1_ptr1__intE1__intE1__ret_voidE1
	jmp .LB20512
.LB20505:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB20431:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB20398:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB20372:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB20356:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB20332:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB20308:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB20293:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB20273:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB20240:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB20224:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB20213:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB20200:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB20189:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB20178:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB20150:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB20134:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB20118:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB20102:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB20065:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB20029:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB20001:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB19984:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
	.text
	.globl standard__crypto__X509__x509_b64val__1__byteE1__ret_intE1
	.def standard__crypto__X509__x509_b64val__1__byteE1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__X509__x509_b64val__1__byteE1__ret_intE1:
.LB20530:
	cmpb $65, %cl
	jb .LB20542
.LB20535:
	cmpb $90, %cl
	jbe .LB20541
.LB20542:
	cmpb $97, %cl
	jb .LB20557
.LB20550:
	cmpb $122, %cl
	jbe .LB20556
.LB20557:
	cmpb $48, %cl
	jb .LB20572
.LB20565:
	cmpb $57, %cl
	jbe .LB20571
.LB20572:
	cmpb $43, %cl
	je .LB20580
.LB20581:
	cmpb $47, %cl
	je .LB20586
.LB20587:
	movabsq $4294967295, %rax
	ret
.LB20586:
	movl $63, %eax
	ret
.LB20580:
	movl $62, %eax
	ret
.LB20571:
	movzbl %cl, %eax
	addl $4, %eax
	ret
.LB20556:
	movzbl %cl, %eax
	subl $71, %eax
	ret
.LB20541:
	movzbl %cl, %eax
	subl $65, %eax
	ret
	.text
	.globl standard__crypto__X509__x509_match_at__4__byteE1_ptr1__intE1__intE1__byteE1_ptr1__ret_boolE1
	.def standard__crypto__X509__x509_match_at__4__byteE1_ptr1__intE1__intE1__byteE1_ptr1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__X509__x509_match_at__4__byteE1_ptr1__intE1__intE1__byteE1_ptr1__ret_boolE1:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
	movq %rdi, -8(%rsp)
.LB20590:
	xorl %eax, %eax
.LB20596:
	movslq %eax, %rsi
	cmpb $0, (%r9,%rsi,1)
	je .LB20598
.LB20597:
	leal (%r8,%rax), %esi
	cmpl %edx, %esi
	jge .LB20610
.LB20611:
	leal (%r8,%rax), %esi
	movslq %eax, %rdi
	movslq %esi, %rsi
	movzbl (%rcx,%rsi,1), %esi
	movzbl (%r9,%rdi,1), %edi
	cmpb %dil, %sil
	jne .LB20624
.LB20625:
	incl %eax
	jmp .LB20596
.LB20598:
	movl $1, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB20624:
	xorl %eax, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB20610:
	xorl %eax, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
	.text
	.globl standard__crypto__X509__x509_load_pem_bundle__6__byteE1_ptr1__intE1__byteE1_ptr1__intE1__X509_CERTE1_ptr1__intE1__ret_intE1
	.def standard__crypto__X509__x509_load_pem_bundle__6__byteE1_ptr1__intE1__byteE1_ptr1__intE1__X509_CERTE1_ptr1__intE1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__X509__x509_load_pem_bundle__6__byteE1_ptr1__intE1__byteE1_ptr1__intE1__X509_CERTE1_ptr1__intE1__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $304, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
	movq %r14, -48(%rbp)
	movq %r15, -56(%rbp)
.LB20629:
	leaq -110(%rbp), %r12
	movq %rcx, %rsi
	movl %edx, %edi
	movq %r9, -264(%rbp)
	movq 48(%rbp), %rax
	movq %r8, %rbx
	movq %rax, -120(%rbp)
	movl 56(%rbp), %eax
	movq %rax, -248(%rbp)
	leaq -84(%rbp), %rax
	movl $757935405, -84(%rbp)
	movl $1195721261, -80(%rbp)
	movl $1126190665, -76(%rbp)
	movl $1230262853, -72(%rbp)
	movl $1094928710, -68(%rbp)
	movl $757941588, -64(%rbp)
	movl $2960685, -60(%rbp)
	movq %rax, -256(%rbp)
	movl $757935405, -110(%rbp)
	movl $1145980205, -106(%rbp)
	movl $1380270880, -102(%rbp)
	movl $1229343060, -98(%rbp)
	movl $1163149635, -94(%rbp)
	movl $757935405, -90(%rbp)
	movw $45, -86(%rbp)
	movq $0, -128(%rbp)
	movq $0, -136(%rbp)
	movq $0, -144(%rbp)
	movq $0, -152(%rbp)
	movq $0, -160(%rbp)
	movq $0, -168(%rbp)
	movq $0, -176(%rbp)
	movq $0, -184(%rbp)
	movq $0, -192(%rbp)
.LB20705:
	movq -128(%rbp), %rax
	cmpl %edi, %eax
	jge .LB20707
.LB20711:
	movq -136(%rbp), %rax
	movq -248(%rbp), %rcx
	cmpl %ecx, %eax
	jge .LB20707
.LB20706:
	movq -128(%rbp), %r8
	movq -256(%rbp), %r9
	movq %rsi, %rcx
	movq %rdi, %rdx
	callq standard__crypto__X509__x509_match_at__4__byteE1_ptr1__intE1__intE1__byteE1_ptr1__ret_boolE1
	testb %al, %al
	je .LB20723
.LB20724:
	movq -128(%rbp), %rax
	addl $27, %eax
	movq %rax, -200(%rbp)
	movq $0, -208(%rbp)
	movq $0, -216(%rbp)
	movq -176(%rbp), %r10
	movq %r10, -224(%rbp)
	movq -144(%rbp), %r10
	movq %r10, -232(%rbp)
	movq -192(%rbp), %r10
	movq %r10, -240(%rbp)
.LB20732:
	movq -200(%rbp), %rax
	cmpl %edi, %eax
	jge .LB20734
.LB20738:
	movq %rsi, %rcx
	movq %rdi, %rdx
	movq -200(%rbp), %r8
	movq %r12, %r9
	callq standard__crypto__X509__x509_match_at__4__byteE1_ptr1__intE1__intE1__byteE1_ptr1__ret_boolE1
	testb %al, %al
	jne .LB20734
.LB20733:
	movq -200(%rbp), %rax
	movslq %eax, %rcx
	movzbl (%rsi,%rcx,1), %r13d
	leal 1(%rax), %r14d
	movzbl %r13b, %ecx
	callq standard__crypto__X509__x509_b64val__1__byteE1__ret_intE1
	testl %eax, %eax
	js .LB20757
.LB20758:
	movq -208(%rbp), %rcx
	movq -216(%rbp), %rdx
	shll $6, %ecx
	orl %eax, %ecx
	addl $6, %edx
	cmpl $8, %edx
	jge .LB20768
.LB20769:
	movq -232(%rbp), %r8
.LB20770:
	movq %r14, -200(%rbp)
	movq %rcx, -208(%rbp)
	movq %rdx, -216(%rbp)
	movq %rax, -224(%rbp)
	movq %r8, -232(%rbp)
	movq %r13, -240(%rbp)
	jmp .LB20732
.LB20707:
	movq -136(%rbp), %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB20734:
	movq -136(%rbp), %rax
	movq -120(%rbp), %rcx
	movslq %eax, %rax
	imulq $188, %rax, %rax
	leaq (%rcx,%rax,1), %rcx
	movq -144(%rbp), %rax
	movq -232(%rbp), %r8
	movslq %eax, %rdx
	subl %eax, %r8d
	leaq (%rbx,%rdx,1), %rdx
	callq standard__crypto__X509__x509_parse__3__X509_CERTE1_ptr1__byteE1_ptr1__intE1__ret_boolE1
	movzbl %al, %eax
	movq -136(%rbp), %rcx
	leal 1(%rcx), %edx
	testb %al, %al
	cmovne %edx, %ecx
	movq -200(%rbp), %r10
	movq %r10, -128(%rbp)
	movq %rcx, -136(%rbp)
	movq -144(%rbp), %r10
	movq %r10, -152(%rbp)
	movq -208(%rbp), %r10
	movq %r10, -160(%rbp)
	movq -216(%rbp), %r10
	movq %r10, -168(%rbp)
	movq -224(%rbp), %r10
	movq %r10, -176(%rbp)
	movq -232(%rbp), %r10
	movq %r10, -184(%rbp)
	movq -240(%rbp), %r10
	movq %r10, -192(%rbp)
	movq -232(%rbp), %r10
	movq %r10, -144(%rbp)
	jmp .LB20705
.LB20768:
	subl $8, %edx
	movq -232(%rbp), %r8
	movq -264(%rbp), %r9
	cmpl %r9d, %r8d
	jge .LB20776
.LB20777:
	sarx %edx, %ecx, %r8d
	movq -232(%rbp), %r9
	andl $255, %r8d
	movslq %r9d, %r15
	movb %r8b, (%rbx,%r15,1)
	leal 1(%r9), %r8d
	bzhi %edx, %ecx, %ecx
	jmp .LB20770
.LB20776:
	movq -136(%rbp), %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB20757:
	movq %r14, -200(%rbp)
	movq %rax, -224(%rbp)
	movq %r13, -240(%rbp)
	jmp .LB20732
.LB20723:
	movq -128(%rbp), %rax
	incl %eax
	movq %rax, -128(%rbp)
	jmp .LB20705
	.text
	.globl standard__crypto__X509__x509_check_sig__2__X509_CERTE1_ptr1__X509_CERTE1_ptr1__ret_intE1
	.def standard__crypto__X509__x509_check_sig__2__X509_CERTE1_ptr1__X509_CERTE1_ptr1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__X509__x509_check_sig__2__X509_CERTE1_ptr1__X509_CERTE1_ptr1__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $256, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
.LB20812:
	movq %rcx, %rsi
	movq %rdx, %rdi
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -96(%rbp)
	vmovdqu .LZERO+32(%rip), %ymm15
	vmovdqu %ymm15, -64(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -144(%rbp)
	movups .LZERO+32(%rip), %xmm15
	movups %xmm15, -112(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -192(%rbp)
	movups .LZERO+32(%rip), %xmm15
	movups %xmm15, -160(%rbp)
	vzeroupper
	cmpl $0, 28(%rsi)
	je .LB20827
.LB20828:
	movl 28(%rsi), %eax
	decl %eax
	movslq %eax, %rcx
	movabsq $2863311531, %rdx
	imulq %rcx, %rdx
	sarq $33, %rdx
	shrq $63, %rcx
	addl %ecx, %edx
	imull $3, %edx, %edx
	subl %edx, %eax
	leal 1(%rax), %ebx
	movq %rbx, %rcx
	callq standard__crypto__RSA__rsa_hash_len__1__intE1__ret_intE1
	movl %eax, %r12d
	leaq -96(%rbp), %rax
	movq 16(%rsi), %rdx
	movl 24(%rsi), %r8d
	movq $0, 32(%rsp)
	movq %rbx, %rcx
	xorl %r9d, %r9d
	movq %rax, 40(%rsp)
	callq standard__crypto__RSA__rsa_hash2__6__intE1__byteE1_ptr1__intE1__byteE1_ptr1__intE1__byteE1_ptr1__ret_voidE1
	cmpl $3, 28(%rsi)
	jle .LB20856
.LB20857:
	cmpl $2, 92(%rdi)
	je .LB20903
.LB20904:
	cmpl $3, 92(%rdi)
	je .LB20946
.LB20947:
	movl $3, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB20946:
	leaq -144(%rbp), %rcx
	leaq -192(%rbp), %rdx
	movq 32(%rsi), %r9
	movl 40(%rsi), %eax
	movq %rax, 32(%rsp)
	movl $48, %r8d
	callq standard__crypto__P384__ecdsa_der_decode_n__5__byteE1_ptr1__byteE1_ptr1__intE1__byteE1_ptr1__intE1__ret_boolE1
	testb %al, %al
	je .LB20962
.LB20963:
	movq 128(%rdi), %rax
	leaq -144(%rbp), %rcx
	leaq -192(%rbp), %rdx
	leaq 1(%rax), %r8
	leaq 49(%rax), %r9
	leaq -96(%rbp), %rax
	movq %rax, 32(%rsp)
	movq %r12, 40(%rsp)
	callq standard__crypto__P384__ecdsa_p384_verify__6__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__intE1__ret_boolE1
	testb %al, %al
	jne .LB20981
.LB20982:
	movl $3, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB20981:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB20962:
	movl $3, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB20903:
	leaq -144(%rbp), %rcx
	leaq -192(%rbp), %rdx
	movq 32(%rsi), %r9
	movl 40(%rsi), %eax
	movq %rax, 32(%rsp)
	movl $32, %r8d
	callq standard__crypto__P384__ecdsa_der_decode_n__5__byteE1_ptr1__byteE1_ptr1__intE1__byteE1_ptr1__intE1__ret_boolE1
	testb %al, %al
	je .LB20919
.LB20920:
	movq 128(%rdi), %rax
	leaq -144(%rbp), %rcx
	leaq -192(%rbp), %rdx
	leaq 1(%rax), %r8
	leaq 33(%rax), %r9
	leaq -96(%rbp), %rax
	movq %rax, 32(%rsp)
	movq %r12, 40(%rsp)
	callq standard__crypto__P384__ecdsa_p256n_verify__6__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__intE1__ret_boolE1
	testb %al, %al
	jne .LB20938
.LB20939:
	movl $3, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB20938:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB20919:
	movl $3, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB20856:
	cmpl $1, 92(%rdi)
	jne .LB20864
.LB20865:
	leaq -96(%rbp), %rax
	movq 96(%rdi), %rcx
	movl 104(%rdi), %edx
	movq 112(%rdi), %r8
	movl 120(%rdi), %r9d
	movq 32(%rsi), %rdi
	movl 40(%rsi), %esi
	movq %rbx, 32(%rsp)
	movq %rax, 40(%rsp)
	movq %rdi, 48(%rsp)
	movq %rsi, 56(%rsp)
	callq standard__crypto__RSA__rsa_pkcs1_verify__8__byteE1_ptr1__intE1__byteE1_ptr1__intE1__intE1__byteE1_ptr1__byteE1_ptr1__intE1__ret_boolE1
	testb %al, %al
	jne .LB20895
.LB20896:
	movl $3, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB20895:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB20864:
	movl $3, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB20827:
	movl $7, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
	.text
	.globl standard__crypto__X509__x509_lower__1__byteE1__ret_byteE1
	.def standard__crypto__X509__x509_lower__1__byteE1__ret_byteE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__X509__x509_lower__1__byteE1__ret_byteE1:
.LB20984:
	cmpb $65, %cl
	jb .LB20996
.LB20989:
	cmpb $90, %cl
	jbe .LB20995
.LB20996:
	movzbl %cl, %eax
	ret
.LB20995:
	addl $32, %ecx
	movzbl %cl, %eax
	ret
	.text
	.globl standard__crypto__X509__x509_host_matches__4__byteE1_ptr1__intE1__byteE1_ptr1__intE1__ret_boolE1
	.def standard__crypto__X509__x509_host_matches__4__byteE1_ptr1__intE1__byteE1_ptr1__intE1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__X509__x509_host_matches__4__byteE1_ptr1__intE1__byteE1_ptr1__intE1__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $80, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
	movq %r14, -48(%rbp)
.LB21002:
	movq %rcx, %rbx
	movl %edx, %ecx
	movq %r8, %r12
	cmpl $2, %ecx
	jle .LB21029
.LB21012:
	cmpb $42, (%rbx)
	jne .LB21029
.LB21020:
	cmpb $46, 1(%rbx)
	je .LB21028
.LB21029:
	cmpl %r9d, %ecx
	jne .LB21099
.LB21100:
	movslq %ecx, %rsi
	xorl %edi, %edi
.LB21102:
	cmpq %rsi, %rdi
	jge .LB21105
.LB21103:
	movzbl (%rbx,%rdi,1), %eax
	movzbl %al, %ecx
	callq standard__crypto__X509__x509_lower__1__byteE1__ret_byteE1
	movzbl %al, %r13d
	movzbl (%r12,%rdi,1), %eax
	movzbl %al, %ecx
	callq standard__crypto__X509__x509_lower__1__byteE1__ret_byteE1
	movzbl %al, %eax
	cmpb %al, %r13b
	jne .LB21120
.LB21121:
	incq %rdi
	cmpq %rsi, %rdi
	jl .LB21103
.LB21105:
	movl $1, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	leave
	ret
.LB21120:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	leave
	ret
.LB21099:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	leave
	ret
.LB21028:
	movslq %r9d, %rsi
	movq %r12, %rdi
	movq %r12, %rdx
	xorl %eax, %eax
	cmpq $32, %rsi
	jl .LR32147d
	movl $46, %r10d
	vmovd %r10d, %xmm14
	vpbroadcastb %xmm14, %ymm14
.LR32147l:
	leaq 32(%rax), %r11
	cmpq %rsi, %r11
	jg .LR32147e
	vpcmpeqb (%rdi,%rax), %ymm14, %ymm15
	vpmovmskb %ymm15, %r10d
	testl %r10d, %r10d
	jne .LR32147f
	movq %r11, %rax
	jmp .LR32147l
.LR32147f:
	tzcntl %r10d, %r10d
	addq %r10, %rax
.LR32147e:
	vzeroupper
.LR32147d:
	movl %eax, %esi
.LB21031:
	cmpl %r9d, %esi
	jge .LB21033
.LB21037:
	movslq %esi, %rax
	cmpb $46, (%r12,%rax,1)
	je .LB21033
.LB21032:
	incl %esi
	cmpl %r9d, %esi
	jl .LB21037
.LB21033:
	testl %esi, %esi
	je .LB21056
.LB21050:
	cmpl %r9d, %esi
	jge .LB21056
.LB21057:
	subl %esi, %r9d
	leal -1(%rcx), %edi
	cmpl %edi, %r9d
	jne .LB21066
.LB21067:
	xorl %r13d, %r13d
.LB21069:
	cmpl %edi, %r13d
	jge .LB21072
.LB21070:
	leal 1(%r13), %eax
	movslq %eax, %rax
	movzbl (%rbx,%rax,1), %eax
	movzbl %al, %ecx
	callq standard__crypto__X509__x509_lower__1__byteE1__ret_byteE1
	movzbl %al, %r14d
	leal (%rsi,%r13), %eax
	movslq %eax, %rax
	movzbl (%r12,%rax,1), %eax
	movzbl %al, %ecx
	callq standard__crypto__X509__x509_lower__1__byteE1__ret_byteE1
	movzbl %al, %eax
	cmpb %al, %r14b
	jne .LB21091
.LB21092:
	incl %r13d
	cmpl %edi, %r13d
	jl .LB21070
.LB21072:
	movl $1, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	leave
	ret
.LB21091:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	leave
	ret
.LB21066:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	leave
	ret
.LB21056:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	leave
	ret
	.text
	.globl standard__crypto__X509__x509_match_host__3__X509_CERTE1_ptr1__byteE1_ptr1__intE1__ret_boolE1
	.def standard__crypto__X509__x509_match_host__3__X509_CERTE1_ptr1__byteE1_ptr1__intE1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__X509__x509_match_host__3__X509_CERTE1_ptr1__byteE1_ptr1__intE1__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $112, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
.LB21125:
	movq %rcx, %rsi
	movq %rdx, %rdi
	movl %r8d, %ebx
	movl $0, -44(%rbp)
	movl $0, -48(%rbp)
	movl $0, -52(%rbp)
	cmpl $0, 152(%rsi)
	jg .LB21139
.LB21140:
	xorl %r12d, %r12d
.LB21141:
	testb %r12b, %r12b
	jne .LB21187
.LB21188:
	movl 168(%rsi), %edx
	testl %edx, %edx
	jg .LB21195
.LB21196:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB21139:
	xorl %r8d, %r8d
	xorl %r12d, %r12d
.LB21142:
	movl 152(%rsi), %edx
	cmpl %edx, %r8d
	jge .LB21144
.LB21143:
	leaq -44(%rbp), %r9
	leaq -48(%rbp), %rax
	leaq -52(%rbp), %r13
	movq 144(%rsi), %rcx
	movq %rax, 32(%rsp)
	movq %r13, 40(%rsp)
	callq standard__crypto__X509__asn1_hdr__6__byteE1_ptr1__intE1__intE1__intE1_ptr1__intE1_ptr1__intE1_ptr1__ret_boolE1
	testb %al, %al
	je .LB21144
.LB21163:
	movl -48(%rbp), %eax
	movl -52(%rbp), %edx
	leal (%rax,%rdx), %r13d
	cmpl $130, -44(%rbp)
	je .LB21170
.LB21171:
.LB21172:
	movq %r13, %r8
	jmp .LB21142
.LB21170:
	movq 144(%rsi), %rcx
	movslq %eax, %rax
	leaq (%rcx,%rax,1), %rcx
	movq %rdi, %r8
	movq %rbx, %r9
	callq standard__crypto__X509__x509_host_matches__4__byteE1_ptr1__intE1__byteE1_ptr1__intE1__ret_boolE1
	testb %al, %al
	jne .LB21183
.LB21184:
	movl $1, %r12d
	jmp .LB21172
.LB21183:
	movl $1, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB21144:
	testb %r12b, %r12b
	jne .LB21187
	jmp .LB21188
.LB21195:
	movq 160(%rsi), %rcx
	movq %rdi, %r8
	movq %rbx, %r9
	callq standard__crypto__X509__x509_host_matches__4__byteE1_ptr1__intE1__byteE1_ptr1__intE1__ret_boolE1
	movzbl %al, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB21187:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
	.text
	.globl standard__crypto__X509__x509_bytes_eq__4__byteE1_ptr1__intE1__byteE1_ptr1__intE1__ret_boolE1
	.def standard__crypto__X509__x509_bytes_eq__4__byteE1_ptr1__intE1__byteE1_ptr1__intE1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__X509__x509_bytes_eq__4__byteE1_ptr1__intE1__byteE1_ptr1__intE1__ret_boolE1:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
	movq %rdi, -8(%rsp)
.LB21209:
	cmpl %r9d, %edx
	jne .LB21218
.LB21219:
	movslq %edx, %r9
	movq %rcx, %rdi
	movq %r9, %rsi
	movq %r8, %rdx
	xorl %eax, %eax
	cmpq $32, %rsi
	jl .LR32148d
.LR32148l:
	leaq 32(%rax), %r11
	cmpq %rsi, %r11
	jg .LR32148e
	vmovdqu (%rdi,%rax), %ymm15
	vpcmpeqb (%rdx,%rax), %ymm15, %ymm15
	vpmovmskb %ymm15, %r10d
	notl %r10d
	testl %r10d, %r10d
	jne .LR32148f
	movq %r11, %rax
	jmp .LR32148l
.LR32148f:
	tzcntl %r10d, %r10d
	addq %r10, %rax
.LR32148e:
	vzeroupper
.LR32148d:
	movslq %eax, %rax
.LB21221:
	cmpq %r9, %rax
	jge .LB21224
.LB21222:
	movzbl (%rcx,%rax,1), %edx
	movzbl (%r8,%rax,1), %esi
	cmpb %sil, %dl
	jne .LB21237
.LB21238:
	incq %rax
	cmpq %r9, %rax
	jl .LB21222
.LB21224:
	movl $1, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB21237:
	xorl %eax, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB21218:
	xorl %eax, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
	.text
	.globl standard__crypto__X509__x509_valid_at__2__X509_CERTE1_ptr1__dataE1_sbits64__ret_boolE1
	.def standard__crypto__X509__x509_valid_at__2__X509_CERTE1_ptr1__dataE1_sbits64__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__X509__x509_valid_at__2__X509_CERTE1_ptr1__dataE1_sbits64__ret_boolE1:
.LB21242:
	cmpq 76(%rcx), %rdx
	jge .LB21251
.LB32149:
	xorl %eax, %eax
	ret
.LB21251:
	xorl %eax, %eax
	cmpq 84(%rcx), %rdx
	setle %al
	ret
	.text
	.globl standard__crypto__X509__x509_ca_ok__1__X509_CERTE1_ptr1__ret_intE1
	.def standard__crypto__X509__x509_ca_ok__1__X509_CERTE1_ptr1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__X509__x509_ca_ok__1__X509_CERTE1_ptr1__ret_intE1:
.LB21260:
	movzbl 172(%rcx), %eax
	shrq $7, %rax
	testb %al, %al
	je .LB21275
.LB21267:
	movzbl 172(%rcx), %eax
	shrq $6, %rax
	andq $1, %rax
	testb %al, %al
	je .LB21275
.LB21276:
	movzbl 180(%rcx), %eax
	shrq $7, %rax
	testb %al, %al
	jne .LB21282
.LB21283:
	xorl %eax, %eax
	ret
.LB21282:
	movl 184(%rcx), %eax
	andl $4, %eax
	je .LB21291
.LB21292:
	xorl %eax, %eax
	ret
.LB21291:
	movl $9, %eax
	ret
.LB21275:
	movl $4, %eax
	ret
	.text
	.globl standard__crypto__X509__x509_verify_chain__7__X509_CERTE1_ptr1__intE1__X509_CERTE1_ptr1__intE1__dataE1_sbits64__byteE1_ptr1__intE1__ret_intE1
	.def standard__crypto__X509__x509_verify_chain__7__X509_CERTE1_ptr1__intE1__X509_CERTE1_ptr1__intE1__dataE1_sbits64__byteE1_ptr1__intE1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__X509__x509_verify_chain__7__X509_CERTE1_ptr1__intE1__X509_CERTE1_ptr1__intE1__dataE1_sbits64__byteE1_ptr1__intE1__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $144, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
	movq %r14, -48(%rbp)
	movq %r15, -56(%rbp)
.LB21294:
	movq %rcx, %rsi
	movq %rdx, -104(%rbp)
	movq %r8, -88(%rbp)
	movq %r9, -64(%rbp)
	movq 48(%rbp), %rdi
	movq 56(%rbp), %rax
	movl 64(%rbp), %r8d
	movq -104(%rbp), %rcx
	cmpl $1, %ecx
	jl .LB21309
.LB21310:
	testq %rax, %rax
	jne .LB21318
.LB21320:
	xorl %ebx, %ebx
.LB21330:
	movq -104(%rbp), %rax
	cmpl %eax, %ebx
	jge .LB21333
.LB21331:
	movslq %ebx, %rax
	imulq $188, %rax, %rax
	leaq (%rsi,%rax,1), %r12
	movq %r12, %rcx
	movq %rdi, %rdx
	callq standard__crypto__X509__x509_valid_at__2__X509_CERTE1_ptr1__dataE1_sbits64__ret_boolE1
	testb %al, %al
	je .LB21343
.LB21344:
	movq -64(%rbp), %rax
	movslq %eax, %r13
	movq $0, -72(%rbp)
	movq -88(%rbp), %r10
	movq %r10, -80(%rbp)
.LB21349:
	movq -72(%rbp), %rax
	cmpq %r13, %rax
	jge .LB21352
.LB21350:
	movq (%r12), %rcx
	movl 8(%r12), %edx
	movq -80(%rbp), %r14
	movq (%r14), %r8
	movl 8(%r14), %r9d
	callq standard__crypto__X509__x509_bytes_eq__4__byteE1_ptr1__intE1__byteE1_ptr1__intE1__ret_boolE1
	testb %al, %al
	jne .LB21381
.LB21382:
	movq -72(%rbp), %rax
	movq -80(%rbp), %rcx
	incq %rax
	leaq 188(%rcx), %rcx
	movq %rax, -72(%rbp)
	movq %rcx, -80(%rbp)
	jmp .LB21349
.LB21318:
	movq %rsi, %rcx
	movq %rax, %rdx
	callq standard__crypto__X509__x509_match_host__3__X509_CERTE1_ptr1__byteE1_ptr1__intE1__ret_boolE1
	testb %al, %al
	je .LB21327
	jmp .LB21320
.LB21333:
	movl $5, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB21381:
	movq %r14, %rcx
	movq %rdi, %rdx
	callq standard__crypto__X509__x509_valid_at__2__X509_CERTE1_ptr1__dataE1_sbits64__ret_boolE1
	testb %al, %al
	jne .LB21389
.LB21352:
	movq -64(%rbp), %rax
	movslq %eax, %r13
	xorl %r14d, %r14d
	movq -88(%rbp), %r10
	movq %r10, -96(%rbp)
.LB21394:
	cmpq %r13, %r14
	jge .LB21397
.LB21395:
	movq 48(%r12), %rcx
	movl 56(%r12), %edx
	movq -96(%rbp), %r15
	movq 64(%r15), %r8
	movl 72(%r15), %r9d
	callq standard__crypto__X509__x509_bytes_eq__4__byteE1_ptr1__intE1__byteE1_ptr1__intE1__ret_boolE1
	testb %al, %al
	je .LB21396
.LB21428:
	movq %r15, %rcx
	movq %rdi, %rdx
	callq standard__crypto__X509__x509_valid_at__2__X509_CERTE1_ptr1__dataE1_sbits64__ret_boolE1
	testb %al, %al
	je .LB21396
.LB21437:
	movq %r15, %rcx
	callq standard__crypto__X509__x509_ca_ok__1__X509_CERTE1_ptr1__ret_intE1
	testl %eax, %eax
	jne .LB21396
.LB21445:
	movq %r12, %rcx
	movq %r15, %rdx
	callq standard__crypto__X509__x509_check_sig__2__X509_CERTE1_ptr1__X509_CERTE1_ptr1__ret_intE1
	testl %eax, %eax
	je .LB21454
.LB21396:
	incq %r14
	movq -96(%rbp), %rax
	leaq 188(%rax), %rax
	movq %rax, -96(%rbp)
	cmpq %r13, %r14
	jl .LB21395
.LB21397:
	leal 1(%rbx), %eax
	movq -104(%rbp), %rcx
	cmpl %ecx, %eax
	jge .LB21463
.LB21464:
	movslq %ebx, %rcx
	movslq %eax, %rax
	imulq $188, %rcx, %rcx
	imulq $188, %rax, %rax
	leaq (%rsi,%rcx,1), %rcx
	leaq (%rsi,%rax,1), %r12
	movq 48(%rcx), %rdx
	movl 56(%rcx), %r8d
	movq 64(%r12), %rax
	movl 72(%r12), %r9d
	movq %rdx, %rcx
	movq %r8, %rdx
	movq %rax, %r8
	callq standard__crypto__X509__x509_bytes_eq__4__byteE1_ptr1__intE1__byteE1_ptr1__intE1__ret_boolE1
	testb %al, %al
	je .LB21504
.LB21505:
	movq %r12, %rcx
	callq standard__crypto__X509__x509_ca_ok__1__X509_CERTE1_ptr1__ret_intE1
	testl %eax, %eax
	jne .LB21514
.LB21515:
	movl 176(%r12), %eax
	testl %eax, %eax
	jns .LB21529
.LB21531:
	movslq %ebx, %rax
	imulq $188, %rax, %rax
	incl %ebx
	leaq (%rsi,%rax,1), %rcx
	movslq %ebx, %rax
	imulq $188, %rax, %rax
	leaq (%rsi,%rax,1), %rdx
	callq standard__crypto__X509__x509_check_sig__2__X509_CERTE1_ptr1__X509_CERTE1_ptr1__ret_intE1
	testl %eax, %eax
	jne .LB21557
.LB21558:
	jmp .LB21330
.LB21529:
	cmpl %eax, %ebx
	jg .LB21544
	jmp .LB21531
.LB21557:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB21544:
	movl $8, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB21514:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB21504:
	movl $5, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB21463:
	movl $5, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB21454:
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
.LB21389:
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
.LB21343:
	movl $2, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB21327:
	movl $6, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB21309:
	movl $5, %eax
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
	.globl standard__crypto__CSPRNG__random_bytes__2__byteE1_ptr1__intE1__ret_boolE1
	.def standard__crypto__CSPRNG__random_bytes__2__byteE1_ptr1__intE1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__crypto__CSPRNG__random_bytes__2__byteE1_ptr1__intE1__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB21563:
	movq %rcx, %rax
	movl %edx, %r8d
	xorl %ecx, %ecx
	movq %rax, %rdx
	movl $2, %r9d
	callq BCryptGenRandom
	xorl %ecx, %ecx
	testl %eax, %eax
	sete %cl
	movl %ecx, %eax
	leave
	ret
	.text
	.globl standard__tls__ecdsa__EcKey.__init__0__ret_thisE1
	.def standard__tls__ecdsa__EcKey.__init__0__ret_thisE1;
	.scl 2;
	.type 32;
	.endef
standard__tls__ecdsa__EcKey.__init__0__ret_thisE1:
.LB21670:
	movq %rcx, %rax
	movl $256, 20(%rax)
	ret
	.text
	.globl standard__tls__ecdsa__EcKey.__exit__0__ret_voidE1
	.def standard__tls__ecdsa__EcKey.__exit__0__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__tls__ecdsa__EcKey.__exit__0__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
.LB21672:
	movq %rcx, %rsi
	movq (%rsi), %rcx
	testq %rcx, %rcx
	jne .LB21677
.LB21679:
	movq 8(%rsi), %rcx
	testq %rcx, %rcx
	jne .LB21689
.LB21690:
	movq -8(%rbp), %rsi
	leave
	ret
.LB21677:
	callq BCryptDestroyKey
	movq $0, (%rsi)
	jmp .LB21679
.LB21689:
	xorl %edx, %edx
	callq BCryptCloseAlgorithmProvider
	movq $0, 8(%rsi)
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl standard__tls__ecdsa__sign__5__EcKeyE1_ptr1__byteE1_ptr1__dataE1_ubits32__byteE1_ptr1__dataE1_ptr1_ubits32__ret_boolE1
	.def standard__tls__ecdsa__sign__5__EcKeyE1_ptr1__byteE1_ptr1__dataE1_ubits32__byteE1_ptr1__dataE1_ptr1_ubits32__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__tls__ecdsa__sign__5__EcKeyE1_ptr1__byteE1_ptr1__dataE1_ubits32__byteE1_ptr1__dataE1_ptr1_ubits32__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $128, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
	movq %r14, -48(%rbp)
.LB21572:
	movq %rcx, %rsi
	movq %rdx, %rdi
	movl %r8d, %ebx
	movq %r9, %r12
	movq 48(%rbp), %r13
	cmpb $0, 16(%rsi)
	je .LB21583
.LB21584:
	leaq -52(%rbp), %rax
	movl $0, -52(%rbp)
	movq (%rsi), %rcx
	movq $0, 32(%rsp)
	movq $0, 40(%rsp)
	xorl %edx, %edx
	movq %rdi, %r8
	movq %rbx, %r9
	movq %rax, 48(%rsp)
	movq $0, 56(%rsp)
	callq BCryptSignHash
	movl SEC_E_OK(%rip), %ecx
	cmpl %ecx, %eax
	jne .LB21602
.LB21603:
	movl -52(%rbp), %eax
	movl %eax, %ecx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, %r14
	testq %r14, %r14
	je .LB21616
.LB21617:
	leaq -56(%rbp), %rdx
	movl $0, -56(%rbp)
	movq (%rsi), %rcx
	movl -52(%rbp), %eax
	movq %r14, 32(%rsp)
	movq %rdi, %r8
	movq %rbx, %r9
	movq %rax, 40(%rsp)
	movq %rdx, 48(%rsp)
	movq $0, 56(%rsp)
	xorl %edx, %edx
	callq BCryptSignHash
	movl %eax, %esi
	movl SEC_E_OK(%rip), %eax
	cmpl %eax, %esi
	je .LB21634
.LB21636:
	movq %r14, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movl SEC_E_OK(%rip), %eax
	xorl %ecx, %ecx
	cmpl %eax, %esi
	sete %cl
	movl %ecx, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	leave
	ret
.LB21634:
	movl -56(%rbp), %eax
	movl %eax, %r8d
	movq %r12, %rcx
	movq %r14, %rdx
	callq memcpy
	movl -56(%rbp), %eax
	movl %eax, (%r13)
	jmp .LB21636
.LB21616:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	leave
	ret
.LB21602:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	leave
	ret
.LB21583:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	leave
	ret
	.text
	.globl standard__tls__ecdsa__verify__5__EcKeyE1_ptr1__byteE1_ptr1__dataE1_ubits32__byteE1_ptr1__dataE1_ubits32__ret_boolE1
	.def standard__tls__ecdsa__verify__5__EcKeyE1_ptr1__byteE1_ptr1__dataE1_ubits32__byteE1_ptr1__dataE1_ubits32__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__tls__ecdsa__verify__5__EcKeyE1_ptr1__byteE1_ptr1__dataE1_ubits32__byteE1_ptr1__dataE1_ubits32__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rsi, -8(%rbp)
.LB21649:
	movq %rdx, %rax
	movl 48(%rbp), %edx
	movl %r8d, %esi
	movq (%rcx), %rcx
	movq %rax, %r8
	movq %r9, 32(%rsp)
	movq %rsi, %r9
	movq %rdx, 40(%rsp)
	movq $0, 48(%rsp)
	xorl %edx, %edx
	callq BCryptVerifySignature
	movl SEC_E_OK(%rip), %ecx
	xorl %edx, %edx
	cmpl %ecx, %eax
	sete %dl
	movl %edx, %eax
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl standard__tls13__t_p8__3__byteE1_ptr1__intE1_ptr1__intE1__ret_voidE1
	.def standard__tls13__t_p8__3__byteE1_ptr1__intE1_ptr1__intE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__tls13__t_p8__3__byteE1_ptr1__intE1_ptr1__intE1__ret_voidE1:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
.LB21697:
	movl %r8d, %eax
	andl $255, %eax
	movslq (%rdx), %rsi
	movb %al, (%rcx,%rsi,1)
	movl (%rdx), %eax
	incl %eax
	movl %eax, (%rdx)
	movq 0(%rsp), %rsi
	addq $16, %rsp
	ret
	.text
	.globl standard__tls13__t_p16__3__byteE1_ptr1__intE1_ptr1__intE1__ret_voidE1
	.def standard__tls13__t_p16__3__byteE1_ptr1__intE1_ptr1__intE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__tls13__t_p16__3__byteE1_ptr1__intE1_ptr1__intE1__ret_voidE1:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
.LB21712:
	movl %r8d, %eax
	sarl $8, %eax
	movslq (%rdx), %rsi
	andl $255, %eax
	movb %al, (%rcx,%rsi,1)
	movl (%rdx), %esi
	movl %r8d, %eax
	andl $255, %eax
	incl %esi
	movslq %esi, %rsi
	movb %al, (%rcx,%rsi,1)
	movl (%rdx), %eax
	addl $2, %eax
	movl %eax, (%rdx)
	movq 0(%rsp), %rsi
	addq $16, %rsp
	ret
	.text
	.globl standard__tls13__t_p24__3__byteE1_ptr1__intE1_ptr1__intE1__ret_voidE1
	.def standard__tls13__t_p24__3__byteE1_ptr1__intE1_ptr1__intE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__tls13__t_p24__3__byteE1_ptr1__intE1_ptr1__intE1__ret_voidE1:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
.LB21736:
	movl %r8d, %eax
	sarl $16, %eax
	movslq (%rdx), %rsi
	andl $255, %eax
	movb %al, (%rcx,%rsi,1)
	movl (%rdx), %esi
	movl %r8d, %eax
	sarl $8, %eax
	andl $255, %eax
	incl %esi
	movslq %esi, %rsi
	movb %al, (%rcx,%rsi,1)
	movl (%rdx), %esi
	movl %r8d, %eax
	andl $255, %eax
	addl $2, %esi
	movslq %esi, %rsi
	movb %al, (%rcx,%rsi,1)
	movl (%rdx), %eax
	addl $3, %eax
	movl %eax, (%rdx)
	movq 0(%rsp), %rsi
	addq $16, %rsp
	ret
	.text
	.globl standard__tls13__t_pbytes__4__byteE1_ptr1__intE1_ptr1__byteE1_ptr1__intE1__ret_voidE1
	.def standard__tls13__t_pbytes__4__byteE1_ptr1__intE1_ptr1__byteE1_ptr1__intE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__tls13__t_pbytes__4__byteE1_ptr1__intE1_ptr1__byteE1_ptr1__intE1__ret_voidE1:
	subq $48, %rsp
	movq %rbx, 32(%rsp)
	movq %rsi, 24(%rsp)
	movq %rdi, 16(%rsp)
	movq %r12, 8(%rsp)
	movq %r13, 0(%rsp)
.LB21769:
	movslq %r9d, %rax
	cmpl $32, %r9d
	jl .LB32152
.LB32150:
	movl (%rdx), %esi
	movabsq $2147483648, %r12
	xorl %r13d, %r13d
	movslq %esi, %rdi
	movslq %esi, %rsi
	leaq (%rcx,%rdi,1), %rdi
	leaq (%rdi,%rax), %rbx
	addq %rax, %rsi
	cmpq %r12, %rsi
	movl $0, %esi
	movl $0, %r12d
	setle %r13b
	cmpq %rdx, %rbx
	setbe %sil
	leaq 4(%rdx), %rbx
	cmpq %rdi, %rbx
	setbe %r12b
	orl %r12d, %esi
	andl %esi, %r13d
	testb %r13b, %r13b
	jne .LB32151
.LB32152:
	xorl %eax, %eax
	testl %r9d, %r9d
	cmovg %r9d, %eax
	shrl $2, %eax
	xorl %esi, %esi
.LB32153:
	testl %eax, %eax
	je .LB32155
.LB32154:
	movslq %esi, %rdi
	movzbl (%r8,%rdi,1), %edi
	movl %esi, %ebx
	addl (%rdx), %ebx
	movslq %ebx, %rbx
	movb %dil, (%rcx,%rbx,1)
	leal 1(%rsi), %edi
	movslq %edi, %rbx
	movzbl (%r8,%rbx,1), %ebx
	addl (%rdx), %edi
	movslq %edi, %rdi
	movb %bl, (%rcx,%rdi,1)
	leal 2(%rsi), %edi
	movslq %edi, %rbx
	movzbl (%r8,%rbx,1), %ebx
	addl (%rdx), %edi
	movslq %edi, %rdi
	movb %bl, (%rcx,%rdi,1)
	leal 3(%rsi), %edi
	movslq %edi, %rbx
	movzbl (%r8,%rbx,1), %ebx
	addl (%rdx), %edi
	movslq %edi, %rdi
	movb %bl, (%rcx,%rdi,1)
	addl $4, %esi
	decl %eax
	jne .LB32154
.LB32155:
.LB21775:
	cmpl %r9d, %esi
	jge .LB21778
.LB21776:
	movslq %esi, %rax
	movzbl (%r8,%rax,1), %eax
	movl %esi, %edi
	addl (%rdx), %edi
	movslq %edi, %rdi
	movb %al, (%rcx,%rdi,1)
	incl %esi
	cmpl %r9d, %esi
	jl .LB21776
	jmp .LB21778
.LB32151:
	movq %r8, %rsi
	movq %rax, %rcx
	rep movsb
.LB21778:
	addl (%rdx), %r9d
	movl %r9d, (%rdx)
	movq 32(%rsp), %rbx
	movq 24(%rsp), %rsi
	movq 16(%rsp), %rdi
	movq 8(%rsp), %r12
	movq 0(%rsp), %r13
	addq $48, %rsp
	ret
	.text
	.globl standard__tls13__t_g16__2__byteE1_ptr1__intE1__ret_intE1
	.def standard__tls13__t_g16__2__byteE1_ptr1__intE1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__tls13__t_g16__2__byteE1_ptr1__intE1__ret_intE1:
.LB21799:
	movslq %edx, %rax
	movzbl (%rcx,%rax,1), %eax
	shll $8, %eax
	incl %edx
	movslq %edx, %rdx
	movzbl (%rcx,%rdx,1), %ecx
	orl %ecx, %eax
	ret
	.text
	.globl standard__tls13__t_g24__2__byteE1_ptr1__intE1__ret_intE1
	.def standard__tls13__t_g24__2__byteE1_ptr1__intE1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__tls13__t_g24__2__byteE1_ptr1__intE1__ret_intE1:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
.LB21815:
	movslq %edx, %rax
	movzbl (%rcx,%rax,1), %eax
	shll $16, %eax
	leal 1(%rdx), %esi
	movslq %esi, %rsi
	movzbl (%rcx,%rsi,1), %esi
	shll $8, %esi
	orl %esi, %eax
	addl $2, %edx
	movslq %edx, %rdx
	movzbl (%rcx,%rdx,1), %ecx
	orl %ecx, %eax
	movq 0(%rsp), %rsi
	addq $16, %rsp
	ret
	.text
	.globl standard__tls13__t_strlen__1__byteE1_ptr1__ret_intE1
	.def standard__tls13__t_strlen__1__byteE1_ptr1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__tls13__t_strlen__1__byteE1_ptr1__ret_intE1:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
.LB21839:
	movq %rcx, %rax
	movl %eax, %ecx
	movq %rax, %rdx
	andq $-32, %rdx
	vpxor %xmm15, %xmm15, %xmm15
	vpcmpeqb (%rdx), %ymm15, %ymm0
	vpmovmskb %ymm0, %esi
	shrl %cl, %esi
	testl %esi, %esi
	jne .LS32156f
.LS32156l:
	addq $32, %rdx
	vpcmpeqb (%rdx), %ymm15, %ymm0
	vpmovmskb %ymm0, %esi
	testl %esi, %esi
	je .LS32156l
	tzcntl %esi, %esi
	addq %rdx, %rsi
	subq %rax, %rsi
	jmp .LS32156d
.LS32156f:
	tzcntl %esi, %esi
.LS32156d:
	vzeroupper
.LB21842:
	movl %esi, %eax
	movq 0(%rsp), %rsi
	addq $16, %rsp
	ret
	.text
	.globl standard__tls13__t_sha256__3__byteE1_ptr1__intE1__byteE1_ptr1__ret_voidE1
	.def standard__tls13__t_sha256__3__byteE1_ptr1__intE1__byteE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__tls13__t_sha256__3__byteE1_ptr1__intE1__byteE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $176, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
.LB21854:
	movq %rcx, %rsi
	movl %edx, %edi
	movq %r8, %rbx
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -136(%rbp)
	vmovdqu .LZERO+32(%rip), %ymm15
	vmovdqu %ymm15, -104(%rbp)
	vmovdqu .LZERO+64(%rip), %ymm15
	vmovdqu %ymm15, -72(%rbp)
	movq .LZERO+96(%rip), %r10
	movq %r10, -40(%rbp)
	movl .LZERO+104(%rip), %r10d
	movl %r10d, -32(%rbp)
	vzeroupper
	leaq -136(%rbp), %rcx
	callq standard__crypto__hashing__SHA256__sha256_init__1__SHA256_CTXE1_ptr1__ret_voidE1
	movl %edi, %r8d
	leaq -136(%rbp), %rcx
	movq %rsi, %rdx
	callq standard__crypto__hashing__SHA256__sha256_update__3__SHA256_CTXE1_ptr1__byteE1_ptr1__dataE1_ubits64__ret_voidE1
	leaq -136(%rbp), %rcx
	movq %rbx, %rdx
	callq standard__crypto__hashing__SHA256__sha256_final__2__SHA256_CTXE1_ptr1__byteE1_ptr1__ret_voidE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__tls13__t_expand_label__6__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__intE1__byteE1_ptr1__intE1__ret_voidE1
	.def standard__tls13__t_expand_label__6__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__intE1__byteE1_ptr1__intE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__tls13__t_expand_label__6__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__intE1__byteE1_ptr1__intE1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $192, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
	movq %r14, -48(%rbp)
	movq %r15, -56(%rbp)
.LB21863:
	leaq -136(%rbp), %rax
	movq 48(%rbp), %r14
	movl 56(%rbp), %r15d
	movq %rcx, %rsi
	movq %rdx, %rbx
	movq %r8, %r12
	movl %r9d, %r13d
	movl $80, %ecx
	movq %rax, %rdi
	xorl %eax, %eax
	rep stosb
	movl $0, -140(%rbp)
	movq %rbx, %rcx
	callq standard__tls13__t_strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edi
	leaq -136(%rbp), %rcx
	leaq -140(%rbp), %rdx
	movq %r15, %r8
	callq standard__tls13__t_p16__3__byteE1_ptr1__intE1_ptr1__intE1__ret_voidE1
	leaq -136(%rbp), %rcx
	leal 6(%rdi), %r8d
	leaq -140(%rbp), %rdx
	callq standard__tls13__t_p8__3__byteE1_ptr1__intE1_ptr1__intE1__ret_voidE1
	movl -140(%rbp), %eax
	movslq %eax, %rcx
	movb $116, -136(%rbp,%rcx,1)
	leal 1(%rax), %ecx
	movslq %ecx, %rcx
	movb $108, -136(%rbp,%rcx,1)
	leal 2(%rax), %ecx
	movslq %ecx, %rcx
	movb $115, -136(%rbp,%rcx,1)
	leal 3(%rax), %ecx
	movslq %ecx, %rcx
	movb $49, -136(%rbp,%rcx,1)
	leal 4(%rax), %ecx
	movslq %ecx, %rcx
	movb $51, -136(%rbp,%rcx,1)
	leal 5(%rax), %ecx
	addl $6, %eax
	testl %edi, %edi
	movslq %ecx, %rcx
	movb $32, -136(%rbp,%rcx,1)
	movl $0, %ecx
	movl %eax, -140(%rbp)
	cmovg %edi, %ecx
	shrl $2, %ecx
	xorl %edx, %edx
.LB32157:
	testl %ecx, %ecx
	je .LB32159
.LB32158:
	movslq %edx, %r8
	movzbl (%rbx,%r8,1), %r8d
	leal (%rax,%rdx), %r9d
	movslq %r9d, %r9
	movb %r8b, -136(%rbp,%r9,1)
	leal 1(%rdx), %r8d
	movslq %r8d, %r9
	movzbl (%rbx,%r9,1), %r9d
	addl %eax, %r8d
	movslq %r8d, %r8
	movb %r9b, -136(%rbp,%r8,1)
	leal 2(%rdx), %r8d
	movslq %r8d, %r9
	movzbl (%rbx,%r9,1), %r9d
	addl %eax, %r8d
	movslq %r8d, %r8
	movb %r9b, -136(%rbp,%r8,1)
	leal 3(%rdx), %r8d
	movslq %r8d, %r9
	movzbl (%rbx,%r9,1), %r9d
	addl %eax, %r8d
	movslq %r8d, %r8
	movb %r9b, -136(%rbp,%r8,1)
	addl $4, %edx
	decl %ecx
	jne .LB32158
.LB32159:
.LB21907:
	cmpl %edi, %edx
	jge .LB21910
.LB21908:
	movslq %edx, %rcx
	movzbl (%rbx,%rcx,1), %ecx
	leal (%rax,%rdx), %r8d
	movslq %r8d, %r8
	movb %cl, -136(%rbp,%r8,1)
	incl %edx
	cmpl %edi, %edx
	jl .LB21908
.LB21910:
	leaq -136(%rbp), %rcx
	leaq -140(%rbp), %rdx
	addl %edi, %eax
	movq %r13, %r8
	movl %eax, -140(%rbp)
	callq standard__tls13__t_p8__3__byteE1_ptr1__intE1_ptr1__intE1__ret_voidE1
	xorl %eax, %eax
	testl %r13d, %r13d
	cmovg %r13d, %eax
	shrl $2, %eax
	xorl %ecx, %ecx
.LB32160:
	testl %eax, %eax
	je .LB32162
.LB32161:
	movslq %ecx, %rdx
	movzbl (%r12,%rdx,1), %edx
	movl %ecx, %edi
	addl -140(%rbp), %edi
	movslq %edi, %rdi
	movb %dl, -136(%rbp,%rdi,1)
	leal 1(%rcx), %edx
	movslq %edx, %rdi
	movzbl (%r12,%rdi,1), %edi
	addl -140(%rbp), %edx
	movslq %edx, %rdx
	movb %dil, -136(%rbp,%rdx,1)
	leal 2(%rcx), %edx
	movslq %edx, %rdi
	movzbl (%r12,%rdi,1), %edi
	addl -140(%rbp), %edx
	movslq %edx, %rdx
	movb %dil, -136(%rbp,%rdx,1)
	leal 3(%rcx), %edx
	movslq %edx, %rdi
	movzbl (%r12,%rdi,1), %edi
	addl -140(%rbp), %edx
	movslq %edx, %rdx
	movb %dil, -136(%rbp,%rdx,1)
	addl $4, %ecx
	decl %eax
	jne .LB32161
.LB32162:
.LB21929:
	cmpl %r13d, %ecx
	jge .LB21932
.LB21930:
	movslq %ecx, %rax
	movzbl (%r12,%rax,1), %eax
	movl %ecx, %edx
	addl -140(%rbp), %edx
	movslq %edx, %rdx
	movb %al, -136(%rbp,%rdx,1)
	incl %ecx
	cmpl %r13d, %ecx
	jl .LB21930
.LB21932:
	movl %r13d, %r8d
	addl -140(%rbp), %r8d
	leaq -136(%rbp), %rdx
	movq %rsi, %rcx
	movq %r14, %r9
	movl %r8d, -140(%rbp)
	movq %r15, 32(%rsp)
	callq standard__crypto__KDF__HKDF__hkdf_expand__5__byteE1_ptr1__byteE1_ptr1__intE1__byteE1_ptr1__intE1__ret_intE1
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
	.globl standard__tls13__t_derive__4__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__ret_voidE1
	.def standard__tls13__t_derive__4__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__tls13__t_derive__4__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
.LB21955:
	movq %r9, 32(%rsp)
	movq $32, 40(%rsp)
	movl $32, %r9d
	callq standard__tls13__t_expand_label__6__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__intE1__byteE1_ptr1__intE1__ret_voidE1
	leave
	ret
	.text
	.globl standard__tls13__t_set_write_keys__2__TLS13_CONNE1_ptr1__byteE1_ptr1__ret_voidE1
	.def standard__tls13__t_set_write_keys__2__TLS13_CONNE1_ptr1__byteE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__tls13__t_set_write_keys__2__TLS13_CONNE1_ptr1__byteE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $80, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB21964:
	movq %rcx, %rsi
	movq %rdx, %rdi
	movl $8, %eax
	xorl %ecx, %ecx
.LB32163:
	testq %rax, %rax
	je .LB32165
.LB32164:
	movzbl (%rdi,%rcx,1), %edx
	movb %dl, 100(%rsi,%rcx,1)
	movzbl 1(%rdi,%rcx,1), %edx
	movb %dl, 101(%rsi,%rcx,1)
	movzbl 2(%rdi,%rcx,1), %edx
	movb %dl, 102(%rsi,%rcx,1)
	movzbl 3(%rdi,%rcx,1), %edx
	movb %dl, 103(%rsi,%rcx,1)
	addq $4, %rcx
	decq %rax
	jne .LB32164
.LB32165:
.LB21968:
	cmpq $32, %rcx
	jge .LB21971
.LB21969:
	movzbl (%rdi,%rcx,1), %eax
	movb %al, 100(%rsi,%rcx,1)
	incq %rcx
	cmpq $32, %rcx
	jl .LB21969
.LB21971:
	leaq 44(%rsi), %rax
	leaq -20(%rbp), %rdx
	movl $7955819, -20(%rbp)
	movq %rdi, %rcx
	xorl %r8d, %r8d
	xorl %r9d, %r9d
	movq %rax, 32(%rsp)
	movq $16, 40(%rsp)
	callq standard__tls13__t_expand_label__6__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__intE1__byteE1_ptr1__intE1__ret_voidE1
	leaq 76(%rsi), %rax
	leaq -23(%rbp), %rdx
	movw $30313, -23(%rbp)
	movb $0, -21(%rbp)
	movq %rdi, %rcx
	xorl %r8d, %r8d
	xorl %r9d, %r9d
	movq %rax, 32(%rsp)
	movq $12, 40(%rsp)
	callq standard__tls13__t_expand_label__6__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__intE1__byteE1_ptr1__intE1__ret_voidE1
	leaq 164(%rsi), %rcx
	leaq 44(%rsi), %rdx
	callq standard__crypto__encryption__AES__gcm_init__2__GCM_CTXE1_ptr1__byteE1_ptr1__ret_voidE1
	movq $0, 28(%rsi)
	movl $1, 20(%rsi)
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__tls13__t_set_read_keys__2__TLS13_CONNE1_ptr1__byteE1_ptr1__ret_voidE1
	.def standard__tls13__t_set_read_keys__2__TLS13_CONNE1_ptr1__byteE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__tls13__t_set_read_keys__2__TLS13_CONNE1_ptr1__byteE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $80, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB22017:
	movq %rcx, %rsi
	movq %rdx, %rdi
	movl $8, %eax
	xorl %ecx, %ecx
.LB32166:
	testq %rax, %rax
	je .LB32168
.LB32167:
	movzbl (%rdi,%rcx,1), %edx
	movb %dl, 132(%rsi,%rcx,1)
	movzbl 1(%rdi,%rcx,1), %edx
	movb %dl, 133(%rsi,%rcx,1)
	movzbl 2(%rdi,%rcx,1), %edx
	movb %dl, 134(%rsi,%rcx,1)
	movzbl 3(%rdi,%rcx,1), %edx
	movb %dl, 135(%rsi,%rcx,1)
	addq $4, %rcx
	decq %rax
	jne .LB32167
.LB32168:
.LB22021:
	cmpq $32, %rcx
	jge .LB22024
.LB22022:
	movzbl (%rdi,%rcx,1), %eax
	movb %al, 132(%rsi,%rcx,1)
	incq %rcx
	cmpq $32, %rcx
	jl .LB22022
.LB22024:
	leaq 60(%rsi), %rax
	leaq -20(%rbp), %rdx
	movl $7955819, -20(%rbp)
	movq %rdi, %rcx
	xorl %r8d, %r8d
	xorl %r9d, %r9d
	movq %rax, 32(%rsp)
	movq $16, 40(%rsp)
	callq standard__tls13__t_expand_label__6__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__intE1__byteE1_ptr1__intE1__ret_voidE1
	leaq 88(%rsi), %rax
	leaq -23(%rbp), %rdx
	movw $30313, -23(%rbp)
	movb $0, -21(%rbp)
	movq %rdi, %rcx
	xorl %r8d, %r8d
	xorl %r9d, %r9d
	movq %rax, 32(%rsp)
	movq $12, 40(%rsp)
	callq standard__tls13__t_expand_label__6__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__intE1__byteE1_ptr1__intE1__ret_voidE1
	leaq 360(%rsi), %rcx
	leaq 60(%rsi), %rdx
	callq standard__crypto__encryption__AES__gcm_init__2__GCM_CTXE1_ptr1__byteE1_ptr1__ret_voidE1
	movq $0, 36(%rsi)
	movl $1, 24(%rsi)
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__tls13__t_nonce__3__byteE1_ptr1__dataE1_ubits64__byteE1_ptr1__ret_voidE1
	.def standard__tls13__t_nonce__3__byteE1_ptr1__dataE1_ubits64__byteE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__tls13__t_nonce__3__byteE1_ptr1__dataE1_ubits64__byteE1_ptr1__ret_voidE1:
	subq $48, %rsp
	movq %rbx, 32(%rsp)
	movq %rsi, 24(%rsp)
	movq %rdi, 16(%rsp)
	movq %r12, 8(%rsp)
	movq %r13, 0(%rsp)
	movq %r14, -8(%rsp)
.LB22070:
	movzbl (%rcx), %eax
	movq %rdx, %r14
	shrq $56, %r14
	andq $255, %r14
	movb %al, (%r8)
	movzbl 1(%rcx), %eax
	movb %al, 1(%r8)
	movzbl 2(%rcx), %eax
	movb %al, 2(%r8)
	movzbl 3(%rcx), %eax
	movb %al, 3(%r8)
	movzbl 4(%rcx), %eax
	movb %al, 4(%r8)
	movzbl 5(%rcx), %esi
	xorl %r14d, %eax
	movb %sil, 5(%r8)
	movzbl 6(%rcx), %edi
	movb %dil, 6(%r8)
	movzbl 7(%rcx), %r9d
	movb %r9b, 7(%r8)
	movzbl 8(%rcx), %ebx
	movb %bl, 8(%r8)
	movzbl 9(%rcx), %r12d
	movb %r12b, 9(%r8)
	movzbl 10(%rcx), %r13d
	movb %r13b, 10(%r8)
	movzbl 11(%rcx), %ecx
	movb %cl, 11(%r8)
	movb %al, 4(%r8)
	movq %rdx, %rax
	shrq $48, %rax
	andq $255, %rax
	xorl %eax, %esi
	movq %rdx, %rax
	shrq $40, %rax
	movb %sil, 5(%r8)
	andq $255, %rax
	xorl %eax, %edi
	movq %rdx, %rax
	shrq $32, %rax
	movb %dil, 6(%r8)
	andq $255, %rax
	xorl %eax, %r9d
	movq %rdx, %rax
	shrq $24, %rax
	movb %r9b, 7(%r8)
	andq $255, %rax
	xorl %eax, %ebx
	movq %rdx, %rax
	shrq $16, %rax
	movb %bl, 8(%r8)
	andq $255, %rax
	xorl %eax, %r12d
	movq %rdx, %rax
	shrq $8, %rax
	movb %r12b, 9(%r8)
	andq $255, %rax
	xorl %eax, %r13d
	movq %rdx, %rax
	andq $255, %rax
	movb %r13b, 10(%r8)
	xorl %eax, %ecx
	movb %cl, 11(%r8)
	movq 32(%rsp), %rbx
	movq 24(%rsp), %rsi
	movq 16(%rsp), %rdi
	movq 8(%rsp), %r12
	movq 0(%rsp), %r13
	movq -8(%rsp), %r14
	addq $48, %rsp
	ret
	.text
	.globl standard__tls13__t_fail__2__TLS13_CONNE1_ptr1__intE1__ret_intE1
	.def standard__tls13__t_fail__2__TLS13_CONNE1_ptr1__intE1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__tls13__t_fail__2__TLS13_CONNE1_ptr1__intE1__ret_intE1:
.LB22117:
	movl %edx, %eax
	movl %eax, 8(%rcx)
	ret
	.text
	.globl standard__tls13__t_send_record__4__TLS13_CONNE1_ptr1__intE1__byteE1_ptr1__intE1__ret_intE1
	.def standard__tls13__t_send_record__4__TLS13_CONNE1_ptr1__intE1__byteE1_ptr1__intE1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__tls13__t_send_record__4__TLS13_CONNE1_ptr1__intE1__byteE1_ptr1__intE1__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $144, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
.LB22124:
	movq %rcx, %rsi
	movl %edx, %eax
	movq %r8, %rdi
	movl %r9d, %ebx
	movq .LZERO(%rip), %r10
	movq %r10, -52(%rbp)
	movl .LZERO+8(%rip), %r10d
	movl %r10d, -44(%rbp)
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -68(%rbp)
	movl .LZERO(%rip), %r10d
	movl %r10d, -73(%rbp)
	movb .LZERO+4(%rip), %r10b
	movb %r10b, -69(%rbp)
	movl $0, -80(%rbp)
	cmpl $0, 20(%rsi)
	je .LB22140
.LB22141:
	movslq %ebx, %rcx
	xorl %edx, %edx
	testq %rcx, %rcx
	cmovg %rcx, %rdx
	shrq $2, %rdx
	xorl %r8d, %r8d
.LB32172:
	testq %rdx, %rdx
	je .LB32174
.LB32173:
	movzbl (%rdi,%r8,1), %r9d
	movb %r9b, 17196(%rsi,%r8,1)
	movzbl 1(%rdi,%r8,1), %r9d
	movb %r9b, 17197(%rsi,%r8,1)
	movzbl 2(%rdi,%r8,1), %r9d
	movb %r9b, 17198(%rsi,%r8,1)
	movzbl 3(%rdi,%r8,1), %r9d
	movb %r9b, 17199(%rsi,%r8,1)
	addq $4, %r8
	decq %rdx
	jne .LB32173
.LB32174:
.LB22189:
	cmpq %rcx, %r8
	jge .LB22192
.LB22190:
	movzbl (%rdi,%r8,1), %edx
	movb %dl, 17196(%rsi,%r8,1)
	incq %r8
	cmpq %rcx, %r8
	jl .LB22190
.LB22192:
	leal 1(%rbx), %edi
	movslq %ebx, %rcx
	leaq -52(%rbp), %r8
	leal 16(%rdi), %r12d
	movb %al, 17196(%rsi,%rcx,1)
	movw $791, -73(%rbp)
	movb $3, -71(%rbp)
	movl %r12d, %eax
	sarl $8, %eax
	leaq 76(%rsi), %rcx
	andl $255, %eax
	movb %al, -70(%rbp)
	movl %r12d, %eax
	andl $255, %eax
	movb %al, -69(%rbp)
	movq 28(%rsi), %rdx
	callq standard__tls13__t_nonce__3__byteE1_ptr1__dataE1_ubits64__byteE1_ptr1__ret_voidE1
	leaq 164(%rsi), %rcx
	leaq -52(%rbp), %rdx
	leaq -73(%rbp), %r8
	leaq 17196(%rsi), %rax
	leaq 33841(%rsi), %r9
	leaq -68(%rbp), %r13
	movq %rax, 32(%rsp)
	movq %rdi, 40(%rsp)
	movq %r9, 48(%rsp)
	movq %r13, 56(%rsp)
	movl $5, %r9d
	callq standard__crypto__encryption__AES__gcm_encrypt__8__GCM_CTXE1_ptr1__byteE1_ptr1__byteE1_ptr1__intE1__byteE1_ptr1__intE1__byteE1_ptr1__byteE1_ptr1__ret_voidE1
	movzbl -68(%rbp), %eax
	leal 5(%rbx), %ecx
	incl %ecx
	movslq %ecx, %rdx
	movb %al, 33836(%rsi,%rdx,1)
	movzbl -67(%rbp), %eax
	leal 1(%rcx), %edx
	movslq %edx, %rdx
	movb %al, 33836(%rsi,%rdx,1)
	movzbl -66(%rbp), %eax
	leal 2(%rcx), %edx
	movslq %edx, %rdx
	movb %al, 33836(%rsi,%rdx,1)
	movzbl -65(%rbp), %eax
	leal 3(%rcx), %edx
	movslq %edx, %rdx
	movb %al, 33836(%rsi,%rdx,1)
	movzbl -64(%rbp), %eax
	leal 4(%rcx), %edx
	movslq %edx, %rdx
	movb %al, 33836(%rsi,%rdx,1)
	movzbl -63(%rbp), %eax
	leal 5(%rcx), %edx
	movslq %edx, %rdx
	movb %al, 33836(%rsi,%rdx,1)
	movzbl -62(%rbp), %eax
	leal 6(%rcx), %edx
	movslq %edx, %rdx
	movb %al, 33836(%rsi,%rdx,1)
	movzbl -61(%rbp), %eax
	leal 7(%rcx), %edx
	movslq %edx, %rdx
	movb %al, 33836(%rsi,%rdx,1)
	movzbl -60(%rbp), %eax
	leal 8(%rcx), %edx
	movslq %edx, %rdx
	movb %al, 33836(%rsi,%rdx,1)
	movzbl -59(%rbp), %eax
	leal 9(%rcx), %edx
	movslq %edx, %rdx
	movb %al, 33836(%rsi,%rdx,1)
	movzbl -58(%rbp), %eax
	leal 10(%rcx), %edx
	movslq %edx, %rdx
	movb %al, 33836(%rsi,%rdx,1)
	movzbl -57(%rbp), %eax
	addl $11, %ecx
	movslq %ecx, %rcx
	movb %al, 33836(%rsi,%rcx,1)
	movzbl -56(%rbp), %eax
	addl $5, %ebx
	leaq 33836(%rsi), %rdx
	incl %ebx
	leal 12(%rbx), %ecx
	movslq %ecx, %rcx
	movb %al, 33836(%rsi,%rcx,1)
	movzbl -55(%rbp), %eax
	leal 13(%rbx), %ecx
	movslq %ecx, %rcx
	movb %al, 33836(%rsi,%rcx,1)
	movzbl -54(%rbp), %eax
	leal 14(%rbx), %ecx
	addl $15, %ebx
	movslq %ecx, %rcx
	movb %al, 33836(%rsi,%rcx,1)
	movzbl -53(%rbp), %eax
	movslq %ebx, %rcx
	movb %al, 33836(%rsi,%rcx,1)
	movzbl -73(%rbp), %eax
	movb %al, 33836(%rsi)
	movzbl -72(%rbp), %eax
	movb %al, 33837(%rsi)
	movzbl -71(%rbp), %eax
	movb %al, 33838(%rsi)
	movzbl -70(%rbp), %eax
	movb %al, 33839(%rsi)
	movzbl -69(%rbp), %eax
	movb %al, 33840(%rsi)
	movq 28(%rsi), %rax
	incq %rax
	leal 5(%r12), %r8d
	movq %rax, 28(%rsi)
	movl (%rsi), %ecx
	callq standard__sockets__tcp_send_all__3__intE1__byteE1_ptr1__intE1__ret_intE1
	testl %eax, %eax
	js .LB22304
.LB22305:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB22304:
	movq %rsi, %rcx
	movl $1, %edx
	callq standard__tls13__t_fail__2__TLS13_CONNE1_ptr1__intE1__ret_intE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB22140:
	leaq 33836(%rsi), %rcx
	leaq -80(%rbp), %rdx
	movq %rax, %r8
	callq standard__tls13__t_p8__3__byteE1_ptr1__intE1_ptr1__intE1__ret_voidE1
	leaq 33836(%rsi), %rcx
	leaq -80(%rbp), %rdx
	movl $771, %r8d
	callq standard__tls13__t_p16__3__byteE1_ptr1__intE1_ptr1__intE1__ret_voidE1
	leaq 33836(%rsi), %rcx
	leaq -80(%rbp), %rdx
	movq %rbx, %r8
	callq standard__tls13__t_p16__3__byteE1_ptr1__intE1_ptr1__intE1__ret_voidE1
	xorl %eax, %eax
	testl %ebx, %ebx
	cmovg %ebx, %eax
	shrl $2, %eax
	xorl %ecx, %ecx
.LB32169:
	testl %eax, %eax
	je .LB32171
.LB32170:
	movslq %ecx, %rdx
	movzbl (%rdi,%rdx,1), %edx
	leal 5(%rcx), %r8d
	movslq %r8d, %r8
	movb %dl, 33836(%rsi,%r8,1)
	leal 1(%rcx), %edx
	movslq %edx, %r8
	movzbl (%rdi,%r8,1), %r8d
	addl $5, %edx
	movslq %edx, %rdx
	movb %r8b, 33836(%rsi,%rdx,1)
	leal 2(%rcx), %edx
	movslq %edx, %r8
	movzbl (%rdi,%r8,1), %r8d
	addl $5, %edx
	movslq %edx, %rdx
	movb %r8b, 33836(%rsi,%rdx,1)
	leal 3(%rcx), %edx
	movslq %edx, %r8
	movzbl (%rdi,%r8,1), %r8d
	addl $5, %edx
	movslq %edx, %rdx
	movb %r8b, 33836(%rsi,%rdx,1)
	addl $4, %ecx
	decl %eax
	jne .LB32170
.LB32171:
.LB22154:
	cmpl %ebx, %ecx
	jge .LB22157
.LB22155:
	movslq %ecx, %rax
	movzbl (%rdi,%rax,1), %eax
	leal 5(%rcx), %edx
	movslq %edx, %rdx
	movb %al, 33836(%rsi,%rdx,1)
	incl %ecx
	cmpl %ebx, %ecx
	jl .LB22155
.LB22157:
	movl (%rsi), %ecx
	leaq 33836(%rsi), %rdx
	leal 5(%rbx), %r8d
	callq standard__sockets__tcp_send_all__3__intE1__byteE1_ptr1__intE1__ret_intE1
	testl %eax, %eax
	js .LB22183
.LB22184:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB22183:
	movq %rsi, %rcx
	movl $1, %edx
	callq standard__tls13__t_fail__2__TLS13_CONNE1_ptr1__intE1__ret_intE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
	.text
	.globl standard__tls13__t_read_record__3__TLS13_CONNE1_ptr1__intE1_ptr1__intE1_ptr1__ret_intE1
	.def standard__tls13__t_read_record__3__TLS13_CONNE1_ptr1__intE1_ptr1__intE1_ptr1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__tls13__t_read_record__3__TLS13_CONNE1_ptr1__intE1_ptr1__intE1_ptr1__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $128, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
.LB22310:
	movq %rcx, %rsi
	movq %rdx, %rdi
	movq %r8, %rbx
	movq .LZERO(%rip), %r10
	movq %r10, -52(%rbp)
	movl .LZERO+8(%rip), %r10d
	movl %r10d, -44(%rbp)
	movl .LZERO(%rip), %r10d
	movl %r10d, -57(%rbp)
	movb .LZERO+4(%rip), %r10b
	movb %r10b, -53(%rbp)
	movl (%rsi), %ecx
	leaq 556(%rsi), %rdx
	movl $5, %r8d
	callq standard__sockets__tcp_recv_all__3__intE1__byteE1_ptr1__intE1__ret_intE1
	testl %eax, %eax
	js .LB22330
.LB22331:
	leaq 556(%rsi), %rcx
	movl $3, %edx
	callq standard__tls13__t_g16__2__byteE1_ptr1__intE1__ret_intE1
	movl %eax, %r12d
	cmpl $16635, %r12d
	jg .LB22343
.LB22344:
	movl (%rsi), %ecx
	leaq 561(%rsi), %rdx
	movq %r12, %r8
	callq standard__sockets__tcp_recv_all__3__intE1__byteE1_ptr1__intE1__ret_intE1
	testl %eax, %eax
	js .LB22359
.LB22360:
	cmpb $23, 556(%rsi)
	jne .LB22381
.LB22372:
	cmpl $0, 24(%rsi)
	jne .LB22380
.LB22381:
	movzbl 556(%rsi), %eax
	movl %eax, (%rdi)
	xorl %eax, %eax
	testl %r12d, %r12d
	cmovg %r12d, %eax
	shrl $2, %eax
	xorl %ecx, %ecx
.LB32175:
	testl %eax, %eax
	je .LB32177
.LB32176:
	leal 5(%rcx), %edx
	movslq %edx, %rdx
	movzbl 556(%rsi,%rdx,1), %edx
	movslq %ecx, %rdi
	movb %dl, 17196(%rsi,%rdi,1)
	leal 1(%rcx), %edx
	leal 5(%rdx), %edi
	movslq %edi, %rdi
	movzbl 556(%rsi,%rdi,1), %edi
	movslq %edx, %rdx
	movb %dil, 17196(%rsi,%rdx,1)
	leal 2(%rcx), %edx
	leal 5(%rdx), %edi
	movslq %edi, %rdi
	movzbl 556(%rsi,%rdi,1), %edi
	movslq %edx, %rdx
	movb %dil, 17196(%rsi,%rdx,1)
	leal 3(%rcx), %edx
	leal 5(%rdx), %edi
	movslq %edi, %rdi
	movzbl 556(%rsi,%rdi,1), %edi
	movslq %edx, %rdx
	movb %dil, 17196(%rsi,%rdx,1)
	addl $4, %ecx
	decl %eax
	jne .LB32176
.LB32177:
.LB22499:
	cmpl %r12d, %ecx
	jge .LB22502
.LB22500:
	leal 5(%rcx), %eax
	movslq %eax, %rax
	movzbl 556(%rsi,%rax,1), %eax
	movslq %ecx, %rdx
	movb %al, 17196(%rsi,%rdx,1)
	incl %ecx
	cmpl %r12d, %ecx
	jl .LB22500
.LB22502:
	movl %r12d, (%rbx)
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB22380:
	cmpl $17, %r12d
	jl .LB22385
.LB22386:
	movzbl 556(%rsi), %eax
	leaq 88(%rsi), %rcx
	leaq -52(%rbp), %r8
	movb %al, -57(%rbp)
	movzbl 557(%rsi), %eax
	movb %al, -56(%rbp)
	movzbl 558(%rsi), %eax
	movb %al, -55(%rbp)
	movzbl 559(%rsi), %eax
	movb %al, -54(%rbp)
	movzbl 560(%rsi), %eax
	movb %al, -53(%rbp)
	movq 36(%rsi), %rdx
	callq standard__tls13__t_nonce__3__byteE1_ptr1__dataE1_ubits64__byteE1_ptr1__ret_voidE1
	leal -16(%r12), %r13d
	addl $5, %r12d
	leaq 360(%rsi), %rcx
	leaq -52(%rbp), %rdx
	subl $16, %r12d
	leaq -57(%rbp), %r8
	leaq 561(%rsi), %rax
	leaq 17196(%rsi), %r9
	movslq %r12d, %r12
	leaq 556(%rsi,%r12,1), %r12
	movq %rax, 32(%rsp)
	movq %r13, 40(%rsp)
	movq %r9, 48(%rsp)
	movl $5, %r9d
	movq %r12, 56(%rsp)
	callq standard__crypto__encryption__AES__gcm_decrypt__8__GCM_CTXE1_ptr1__byteE1_ptr1__byteE1_ptr1__intE1__byteE1_ptr1__intE1__byteE1_ptr1__byteE1_ptr1__ret_intE1
	testl %eax, %eax
	je .LB22436
.LB22437:
	movq 36(%rsi), %rax
	incq %rax
	movq %rax, 36(%rsi)
.LB22452:
	testl %r13d, %r13d
	jle .LB22454
.LB22457:
	leal -1(%r13), %eax
	movslq %eax, %rcx
	cmpb $0, 17196(%rsi,%rcx,1)
	jne .LB22454
.LB22453:
	movq %rax, %r13
	testl %r13d, %r13d
	jg .LB22457
.LB22454:
	testl %r13d, %r13d
	je .LB22473
.LB22474:
	decl %r13d
	movslq %r13d, %rax
	movzbl 17196(%rsi,%rax,1), %eax
	movl %eax, (%rdi)
	movl %r13d, (%rbx)
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB22473:
	movq %rsi, %rcx
	movl $2, %edx
	callq standard__tls13__t_fail__2__TLS13_CONNE1_ptr1__intE1__ret_intE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB22436:
	movq %rsi, %rcx
	movl $2, %edx
	callq standard__tls13__t_fail__2__TLS13_CONNE1_ptr1__intE1__ret_intE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB22385:
	movq %rsi, %rcx
	movl $2, %edx
	callq standard__tls13__t_fail__2__TLS13_CONNE1_ptr1__intE1__ret_intE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB22359:
	movq %rsi, %rcx
	movl $1, %edx
	callq standard__tls13__t_fail__2__TLS13_CONNE1_ptr1__intE1__ret_intE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB22343:
	movq %rsi, %rcx
	movl $2, %edx
	callq standard__tls13__t_fail__2__TLS13_CONNE1_ptr1__intE1__ret_intE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB22330:
	movq %rsi, %rcx
	movl $1, %edx
	callq standard__tls13__t_fail__2__TLS13_CONNE1_ptr1__intE1__ret_intE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
	.text
	.globl standard__tls13__t_tr_add__3__TLS13_CONNE1_ptr1__byteE1_ptr1__intE1__ret_voidE1
	.def standard__tls13__t_tr_add__3__TLS13_CONNE1_ptr1__byteE1_ptr1__intE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__tls13__t_tr_add__3__TLS13_CONNE1_ptr1__byteE1_ptr1__intE1__ret_voidE1:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
	movq %rdi, -8(%rsp)
.LB22521:
	xorl %eax, %eax
	testl %r8d, %r8d
	cmovg %r8d, %eax
	shrl $2, %eax
	xorl %esi, %esi
.LB32178:
	testl %eax, %eax
	je .LB32180
.LB32179:
	movslq %esi, %rdi
	movzbl (%rdx,%rdi,1), %edi
	movl %esi, %r9d
	addl 130540(%rcx), %r9d
	movslq %r9d, %r9
	movb %dil, 90540(%rcx,%r9,1)
	leal 1(%rsi), %edi
	movslq %edi, %r9
	movzbl (%rdx,%r9,1), %r9d
	addl 130540(%rcx), %edi
	movslq %edi, %rdi
	movb %r9b, 90540(%rcx,%rdi,1)
	leal 2(%rsi), %edi
	movslq %edi, %r9
	movzbl (%rdx,%r9,1), %r9d
	addl 130540(%rcx), %edi
	movslq %edi, %rdi
	movb %r9b, 90540(%rcx,%rdi,1)
	leal 3(%rsi), %edi
	movslq %edi, %r9
	movzbl (%rdx,%r9,1), %r9d
	addl 130540(%rcx), %edi
	movslq %edi, %rdi
	movb %r9b, 90540(%rcx,%rdi,1)
	addl $4, %esi
	decl %eax
	jne .LB32179
.LB32180:
.LB22526:
	cmpl %r8d, %esi
	jge .LB22529
.LB22527:
	movslq %esi, %rax
	movzbl (%rdx,%rax,1), %eax
	movl %esi, %edi
	addl 130540(%rcx), %edi
	movslq %edi, %rdi
	movb %al, 90540(%rcx,%rdi,1)
	incl %esi
	cmpl %r8d, %esi
	jl .LB22527
.LB22529:
	addl 130540(%rcx), %r8d
	movl %r8d, 130540(%rcx)
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
	.text
	.globl standard__tls13__t_tr_hash__2__TLS13_CONNE1_ptr1__byteE1_ptr1__ret_voidE1
	.def standard__tls13__t_tr_hash__2__TLS13_CONNE1_ptr1__byteE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__tls13__t_tr_hash__2__TLS13_CONNE1_ptr1__byteE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB22556:
	movq %rdx, %r8
	leaq 90540(%rcx), %rax
	movl 130540(%rcx), %edx
	movq %rax, %rcx
	callq standard__tls13__t_sha256__3__byteE1_ptr1__intE1__byteE1_ptr1__ret_voidE1
	leave
	ret
	.text
	.globl standard__tls13__t_send_hs__3__TLS13_CONNE1_ptr1__byteE1_ptr1__intE1__ret_intE1
	.def standard__tls13__t_send_hs__3__TLS13_CONNE1_ptr1__byteE1_ptr1__intE1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__tls13__t_send_hs__3__TLS13_CONNE1_ptr1__byteE1_ptr1__intE1__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
.LB22567:
	movq %rcx, %rsi
	movq %rdx, %rdi
	movl %r8d, %ebx
	movq %rsi, %rcx
	movq %rdi, %rdx
	movq %rbx, %r8
	callq standard__tls13__t_tr_add__3__TLS13_CONNE1_ptr1__byteE1_ptr1__intE1__ret_voidE1
	movq %rsi, %rcx
	movl $22, %edx
	movq %rdi, %r8
	movq %rbx, %r9
	callq standard__tls13__t_send_record__4__TLS13_CONNE1_ptr1__intE1__byteE1_ptr1__intE1__ret_intE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__tls13__t_next_hs__2__TLS13_CONNE1_ptr1__intE1_ptr1__ret_intE1
	.def standard__tls13__t_next_hs__2__TLS13_CONNE1_ptr1__intE1_ptr1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__tls13__t_next_hs__2__TLS13_CONNE1_ptr1__intE1_ptr1__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $80, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
.LB22580:
	movq %rcx, %rsi
	movq %rdx, %rdi
	movl $0, -36(%rbp)
	movl $0, -40(%rbp)
	xorl %ebx, %ebx
	xorl %r12d, %r12d
.LB22587:
	cmpl $4, 90536(%rsi)
	jge .LB22595
.LB22596:
.LB22597:
	leaq -36(%rbp), %rdx
	leaq -40(%rbp), %r8
	movq %rsi, %rcx
	callq standard__tls13__t_read_record__3__TLS13_CONNE1_ptr1__intE1_ptr1__intE1_ptr1__ret_intE1
	testl %eax, %eax
	jne .LB22633
.LB22634:
	cmpl $20, -36(%rbp)
	je .LB22639
.LB22640:
	cmpl $21, -36(%rbp)
	je .LB22644
.LB22645:
	cmpl $22, -36(%rbp)
	jne .LB22669
.LB22670:
	movl -40(%rbp), %eax
	addl 90536(%rsi), %eax
	cmpl $40000, %eax
	jg .LB22683
.LB22684:
	xorl %ebx, %ebx
.LB22690:
	movl -40(%rbp), %eax
	cmpl %eax, %ebx
	jge .LB22693
.LB22691:
	movslq %ebx, %rax
	movzbl 17196(%rsi,%rax,1), %eax
	movl %ebx, %ecx
	addl 90536(%rsi), %ecx
	movslq %ecx, %rcx
	movb %al, 50536(%rsi,%rcx,1)
	incl %ebx
	jmp .LB22690
.LB22595:
	leaq 50536(%rsi), %rcx
	movl $1, %edx
	callq standard__tls13__t_g24__2__byteE1_ptr1__intE1__ret_intE1
	addl $4, %eax
	cmpl $40000, %eax
	jg .LB22605
.LB22606:
	movl 90536(%rsi), %ecx
	cmpl %eax, %ecx
	jge .LB22618
.LB22619:
	movq %rax, %r12
	jmp .LB22597
.LB22693:
	addl 90536(%rsi), %eax
	movl %eax, 90536(%rsi)
	cmpl $4, 90536(%rsi)
	jge .LB22595
	jmp .LB22596
.LB22683:
	movq %rsi, %rcx
	movl $2, %edx
	callq standard__tls13__t_fail__2__TLS13_CONNE1_ptr1__intE1__ret_intE1
	movabsq $4294967295, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB22669:
	movq %rsi, %rcx
	movl $2, %edx
	callq standard__tls13__t_fail__2__TLS13_CONNE1_ptr1__intE1__ret_intE1
	movabsq $4294967295, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB22644:
	movl $7, 8(%rsi)
	cmpl $2, -40(%rbp)
	jge .LB22651
.LB22653:
	movabsq $4294967295, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB22651:
	cmpb $0, 17197(%rsi)
	jne .LB22653
.LB22661:
	movl $1, 16(%rsi)
	jmp .LB22653
.LB22639:
	cmpl $4, 90536(%rsi)
	jge .LB22595
	jmp .LB22596
.LB22633:
	movabsq $4294967295, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB22618:
	movl %eax, (%rdi)
	movzbl 50536(%rsi), %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB22605:
	movq %rsi, %rcx
	movl $2, %edx
	callq standard__tls13__t_fail__2__TLS13_CONNE1_ptr1__intE1__ret_intE1
	movabsq $4294967295, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
	.text
	.globl standard__tls13__t_consume_hs__2__TLS13_CONNE1_ptr1__intE1__ret_voidE1
	.def standard__tls13__t_consume_hs__2__TLS13_CONNE1_ptr1__intE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__tls13__t_consume_hs__2__TLS13_CONNE1_ptr1__intE1__ret_voidE1:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
	movq %rdi, -8(%rsp)
.LB22723:
	xorl %eax, %eax
.LB22727:
	movl 90536(%rcx), %esi
	subl %edx, %esi
	cmpl %esi, %eax
	jge .LB22730
.LB22728:
	leal (%rdx,%rax), %esi
	movslq %esi, %rsi
	movzbl 50536(%rcx,%rsi,1), %esi
	movslq %eax, %rdi
	movb %sil, 50536(%rcx,%rdi,1)
	incl %eax
	jmp .LB22727
.LB22730:
	movl %esi, 90536(%rcx)
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
	.text
	.globl standard__tls13__t_finished_data__3__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__ret_voidE1
	.def standard__tls13__t_finished_data__3__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__tls13__t_finished_data__3__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $112, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB22761:
	movq %rdx, %rsi
	movq %r8, %rdi
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -48(%rbp)
	vzeroupper
	leaq -48(%rbp), %rax
	leaq -57(%rbp), %rdx
	movl $1768843622, -57(%rbp)
	movl $1684367475, -53(%rbp)
	movb $0, -49(%rbp)
	xorl %r8d, %r8d
	xorl %r9d, %r9d
	movq %rax, 32(%rsp)
	movq $32, 40(%rsp)
	callq standard__tls13__t_expand_label__6__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__intE1__byteE1_ptr1__intE1__ret_voidE1
	leaq -48(%rbp), %rcx
	movq %rdi, 32(%rsp)
	movl $32, %edx
	movq %rsi, %r8
	movl $32, %r9d
	callq standard__crypto__KDF__HKDF__hmac_sha256__5__byteE1_ptr1__intE1__byteE1_ptr1__intE1__byteE1_ptr1__ret_voidE1
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__tls13__t_const_eq__3__byteE1_ptr1__byteE1_ptr1__intE1__ret_boolE1
	.def standard__tls13__t_const_eq__3__byteE1_ptr1__byteE1_ptr1__intE1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__tls13__t_const_eq__3__byteE1_ptr1__byteE1_ptr1__intE1__ret_boolE1:
	subq $48, %rsp
	movq %rbx, 32(%rsp)
	movq %rsi, 24(%rsp)
	movq %rdi, 16(%rsp)
	movq %r12, 8(%rsp)
	movq %r13, 0(%rsp)
	movq %r14, -8(%rsp)
.LB22784:
	movslq %r8d, %rax
	xorl %esi, %esi
	testq %rax, %rax
	cmovg %rax, %rsi
	shrq $2, %rsi
	xorl %edi, %edi
	xorl %r8d, %r8d
	xorl %r9d, %r9d
	xorl %ebx, %ebx
	xorl %r12d, %r12d
.LB32181:
	testq %rsi, %rsi
	je .LB32183
.LB32182:
	movzbl (%rcx,%rdi,1), %r13d
	movzbl (%rdx,%rdi,1), %r14d
	xorl %r14d, %r13d
	orl %r13d, %r8d
	movzbl 1(%rcx,%rdi,1), %r13d
	movzbl 1(%rdx,%rdi,1), %r14d
	xorl %r14d, %r13d
	orl %r13d, %r9d
	movzbl 2(%rcx,%rdi,1), %r13d
	movzbl 2(%rdx,%rdi,1), %r14d
	xorl %r14d, %r13d
	orl %r13d, %ebx
	movzbl 3(%rcx,%rdi,1), %r13d
	movzbl 3(%rdx,%rdi,1), %r14d
	xorl %r14d, %r13d
	orl %r13d, %r12d
	addq $4, %rdi
	decq %rsi
	jne .LB32182
.LB32183:
	orl %r9d, %r8d
	orl %r12d, %ebx
	movl %r8d, %esi
	orl %ebx, %esi
.LB22791:
	cmpq %rax, %rdi
	jge .LB22794
.LB22792:
	movzbl (%rcx,%rdi,1), %r8d
	movzbl (%rdx,%rdi,1), %r9d
	xorl %r9d, %r8d
	orl %r8d, %esi
	incq %rdi
	cmpq %rax, %rdi
	jl .LB22792
.LB22794:
	xorl %eax, %eax
	testb %sil, %sil
	sete %al
	movq 32(%rsp), %rbx
	movq 24(%rsp), %rsi
	movq 16(%rsp), %rdi
	movq 8(%rsp), %r12
	movq 0(%rsp), %r13
	movq -8(%rsp), %r14
	addq $48, %rsp
	ret
	.text
	.globl standard__tls13__t_cv_content__3__byteE1_ptr1__intE1__byteE1_ptr1__ret_intE1
	.def standard__tls13__t_cv_content__3__byteE1_ptr1__intE1__byteE1_ptr1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__tls13__t_cv_content__3__byteE1_ptr1__intE1__byteE1_ptr1__ret_intE1:
	subq $96, %rsp
	movq %rbx, 80(%rsp)
	movq %rsi, 72(%rsp)
	movq %rdi, 64(%rsp)
.LB22814:
	leaq 30(%rsp), %r9
	leaq -4(%rsp), %rbx
	movl $64, %eax
	movq %rcx, %rsi
	movslq %eax, %rax
	movl $542329940, 30(%rsp)
	movq %rax, %rcx
	sarq $63, %rcx
	movl $741551665, 34(%rsp)
	movl $1919251232, 38(%rsp)
	movl $544367990, 42(%rsp)
	notq %rcx
	movl $1953654083, 46(%rsp)
	movl $1667851881, 50(%rsp)
	movl $1449489505, 54(%rsp)
	andq %rax, %rcx
	movl $1718186597, 58(%rsp)
	movw $121, 62(%rsp)
	movl $542329940, -4(%rsp)
	movl $741551665, (%rsp)
	movl $1768710944, 4(%rsp)
	movl $544501349, 8(%rsp)
	movl $1953654083, 12(%rsp)
	movl $1667851881, 16(%rsp)
	movl $1449489505, 20(%rsp)
	movl $1718186597, 24(%rsp)
	movw $121, 28(%rsp)
	movq %rsi, %rdi
	movl $32, %eax
	rep stosb
	testl %edx, %edx
	cmovne %r9, %rbx
	movl $8, %eax
	xorl %ecx, %ecx
.LB32184:
	testl %eax, %eax
	je .LB32186
.LB32185:
	movslq %ecx, %rdx
	movzbl (%rbx,%rdx,1), %edx
	leal 64(%rcx), %edi
	movslq %edi, %rdi
	movb %dl, (%rsi,%rdi,1)
	leal 1(%rcx), %edx
	movslq %edx, %rdi
	movzbl (%rbx,%rdi,1), %edi
	addl $64, %edx
	movslq %edx, %rdx
	movb %dil, (%rsi,%rdx,1)
	leal 2(%rcx), %edx
	movslq %edx, %rdi
	movzbl (%rbx,%rdi,1), %edi
	addl $64, %edx
	movslq %edx, %rdx
	movb %dil, (%rsi,%rdx,1)
	leal 3(%rcx), %edx
	movslq %edx, %rdi
	movzbl (%rbx,%rdi,1), %edi
	addl $64, %edx
	movslq %edx, %rdx
	movb %dil, (%rsi,%rdx,1)
	addl $4, %ecx
	decl %eax
	jne .LB32185
.LB32186:
.LB22914:
	cmpl $33, %ecx
	jge .LB22917
.LB22915:
	movslq %ecx, %rax
	movzbl (%rbx,%rax,1), %eax
	leal 64(%rcx), %edx
	movslq %edx, %rdx
	movb %al, (%rsi,%rdx,1)
	incl %ecx
	cmpl $33, %ecx
	jl .LB22915
.LB22917:
	movb $0, 97(%rsi)
	movl $8, %eax
	xorl %ecx, %ecx
.LB32187:
	testl %eax, %eax
	je .LB32189
.LB32188:
	movslq %ecx, %rdx
	movzbl (%r8,%rdx,1), %edx
	leal 98(%rcx), %edi
	movslq %edi, %rdi
	movb %dl, (%rsi,%rdi,1)
	leal 1(%rcx), %edx
	movslq %edx, %rdi
	movzbl (%r8,%rdi,1), %edi
	addl $98, %edx
	movslq %edx, %rdx
	movb %dil, (%rsi,%rdx,1)
	leal 2(%rcx), %edx
	movslq %edx, %rdi
	movzbl (%r8,%rdi,1), %edi
	addl $98, %edx
	movslq %edx, %rdx
	movb %dil, (%rsi,%rdx,1)
	leal 3(%rcx), %edx
	movslq %edx, %rdi
	movzbl (%r8,%rdi,1), %edi
	addl $98, %edx
	movslq %edx, %rdx
	movb %dil, (%rsi,%rdx,1)
	addl $4, %ecx
	decl %eax
	jne .LB32188
.LB32189:
.LB22939:
	cmpl $32, %ecx
	jge .LB22942
.LB22940:
	movslq %ecx, %rax
	movzbl (%r8,%rax,1), %eax
	leal 98(%rcx), %edx
	movslq %edx, %rdx
	movb %al, (%rsi,%rdx,1)
	incl %ecx
	cmpl $32, %ecx
	jl .LB22940
.LB22942:
	movl $130, %eax
	movq 80(%rsp), %rbx
	movq 72(%rsp), %rsi
	movq 64(%rsp), %rdi
	addq $96, %rsp
	ret
	.text
	.globl standard__tls13__t_verify_cv__6__X509_CERTE1_ptr1__intE1__byteE1_ptr1__intE1__byteE1_ptr1__intE1__ret_boolE1
	.def standard__tls13__t_verify_cv__6__X509_CERTE1_ptr1__intE1__byteE1_ptr1__intE1__byteE1_ptr1__intE1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__tls13__t_verify_cv__6__X509_CERTE1_ptr1__intE1__byteE1_ptr1__intE1__byteE1_ptr1__intE1__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $256, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
.LB22958:
	movq 48(%rbp), %rdi
	movl 56(%rbp), %ebx
	movq %rcx, %rsi
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -96(%rbp)
	vmovdqu .LZERO+32(%rip), %ymm15
	vmovdqu %ymm15, -64(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -144(%rbp)
	movups .LZERO+32(%rip), %xmm15
	movups %xmm15, -112(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -192(%rbp)
	movups .LZERO+32(%rip), %xmm15
	movups %xmm15, -160(%rbp)
	vzeroupper
	cmpl $1027, %edx
	je .LB22971
.LB22972:
	cmpl $1283, %edx
	je .LB23012
.LB23013:
	cmpl $2052, %edx
	jl .LB23059
.LB23053:
	cmpl $2054, %edx
	jle .LB23058
.LB23059:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB23058:
	cmpl $1, 92(%rsi)
	jne .LB23066
.LB23067:
	leaq -96(%rbp), %rax
	leal -2051(%rdx), %r12d
	movq $0, 32(%rsp)
	movq %r8, %rdx
	movq %r12, %rcx
	movq %r9, %r8
	xorl %r9d, %r9d
	movq %rax, 40(%rsp)
	callq standard__crypto__RSA__rsa_hash2__6__intE1__byteE1_ptr1__intE1__byteE1_ptr1__intE1__byteE1_ptr1__ret_voidE1
	leaq -96(%rbp), %rax
	movq 96(%rsi), %rcx
	movl 104(%rsi), %edx
	movq 112(%rsi), %r8
	movl 120(%rsi), %r9d
	movq %r12, 32(%rsp)
	movq %rax, 40(%rsp)
	movq %rdi, 48(%rsp)
	movq %rbx, 56(%rsp)
	callq standard__crypto__RSA__rsa_pss_verify__8__byteE1_ptr1__intE1__byteE1_ptr1__intE1__intE1__byteE1_ptr1__byteE1_ptr1__intE1__ret_boolE1
	movzbl %al, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB23066:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB23012:
	cmpl $3, 92(%rsi)
	jne .LB23020
.LB23021:
	leaq -96(%rbp), %rax
	movq $0, 32(%rsp)
	movl $2, %ecx
	movq %r8, %rdx
	movq %r9, %r8
	xorl %r9d, %r9d
	movq %rax, 40(%rsp)
	callq standard__crypto__RSA__rsa_hash2__6__intE1__byteE1_ptr1__intE1__byteE1_ptr1__intE1__byteE1_ptr1__ret_voidE1
	leaq -144(%rbp), %rcx
	leaq -192(%rbp), %rdx
	movq %rbx, 32(%rsp)
	movl $48, %r8d
	movq %rdi, %r9
	callq standard__crypto__P384__ecdsa_der_decode_n__5__byteE1_ptr1__byteE1_ptr1__intE1__byteE1_ptr1__intE1__ret_boolE1
	testb %al, %al
	je .LB23034
.LB23035:
	movq 128(%rsi), %rax
	leaq -144(%rbp), %rcx
	leaq -192(%rbp), %rdx
	leaq 1(%rax), %r8
	leaq 49(%rax), %r9
	leaq -96(%rbp), %rax
	movq %rax, 32(%rsp)
	movq $48, 40(%rsp)
	callq standard__crypto__P384__ecdsa_p384_verify__6__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__intE1__ret_boolE1
	movzbl %al, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB23034:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB23020:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB22971:
	cmpl $2, 92(%rsi)
	jne .LB22979
.LB22980:
	leaq -96(%rbp), %rax
	movq $0, 32(%rsp)
	movl $1, %ecx
	movq %r8, %rdx
	movq %r9, %r8
	xorl %r9d, %r9d
	movq %rax, 40(%rsp)
	callq standard__crypto__RSA__rsa_hash2__6__intE1__byteE1_ptr1__intE1__byteE1_ptr1__intE1__byteE1_ptr1__ret_voidE1
	leaq -144(%rbp), %rcx
	leaq -192(%rbp), %rdx
	movq %rbx, 32(%rsp)
	movl $32, %r8d
	movq %rdi, %r9
	callq standard__crypto__P384__ecdsa_der_decode_n__5__byteE1_ptr1__byteE1_ptr1__intE1__byteE1_ptr1__intE1__ret_boolE1
	testb %al, %al
	je .LB22993
.LB22994:
	movq 128(%rsi), %rax
	leaq -144(%rbp), %rcx
	leaq -192(%rbp), %rdx
	leaq 1(%rax), %r8
	leaq 33(%rax), %r9
	leaq -96(%rbp), %rax
	movq %rax, 32(%rsp)
	movq $32, 40(%rsp)
	callq standard__crypto__P384__ecdsa_p256n_verify__6__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__intE1__ret_boolE1
	movzbl %al, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB22993:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB22979:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
	.text
	.globl standard__tls13__t_hs_keys__5__TLS13_CONNE1_ptr1__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__ret_voidE1
	.def standard__tls13__t_hs_keys__5__TLS13_CONNE1_ptr1__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__tls13__t_hs_keys__5__TLS13_CONNE1_ptr1__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $288, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
.LB23098:
	movq 48(%rbp), %r13
	movq %rcx, %rsi
	movq %rdx, %rdi
	movq %r8, %rbx
	movq %r9, %r12
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -72(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -104(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -136(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -168(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -200(%rbp)
	vzeroupper
	movl $8, %eax
	xorl %ecx, %ecx
.LB32190:
	testq %rax, %rax
	je .LB32192
.LB32191:
	movb $0, -72(%rbp,%rcx,1)
	movb $0, -71(%rbp,%rcx,1)
	movb $0, -70(%rbp,%rcx,1)
	movb $0, -69(%rbp,%rcx,1)
	addq $4, %rcx
	decq %rax
	jne .LB32191
.LB32192:
.LB23110:
	cmpq $32, %rcx
	jge .LB23113
.LB23111:
	movb $0, -72(%rbp,%rcx,1)
	incq %rcx
	cmpq $32, %rcx
	jl .LB23111
.LB23113:
	leaq -72(%rbp), %rcx
	leaq -72(%rbp), %r8
	leaq -104(%rbp), %rax
	movl $32, %edx
	movl $32, %r9d
	movq %rax, 32(%rsp)
	callq standard__crypto__KDF__HKDF__hkdf_extract__5__byteE1_ptr1__intE1__byteE1_ptr1__intE1__byteE1_ptr1__ret_voidE1
	leaq -200(%rbp), %r8
	xorl %ecx, %ecx
	xorl %edx, %edx
	callq standard__tls13__t_sha256__3__byteE1_ptr1__intE1__byteE1_ptr1__ret_voidE1
	leaq -104(%rbp), %rcx
	leaq -200(%rbp), %r8
	leaq -136(%rbp), %r9
	leaq -208(%rbp), %rdx
	movl $1769104740, -208(%rbp)
	movl $6579574, -204(%rbp)
	callq standard__tls13__t_derive__4__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__ret_voidE1
	leaq -136(%rbp), %rcx
	movq %rbx, 32(%rsp)
	movl $32, %edx
	movq %rdi, %r8
	movl $32, %r9d
	callq standard__crypto__KDF__HKDF__hkdf_extract__5__byteE1_ptr1__intE1__byteE1_ptr1__intE1__byteE1_ptr1__ret_voidE1
	leaq -168(%rbp), %rdx
	movq %rsi, %rcx
	callq standard__tls13__t_tr_hash__2__TLS13_CONNE1_ptr1__byteE1_ptr1__ret_voidE1
	leaq -168(%rbp), %r8
	leaq -221(%rbp), %rdx
	movl $1936203875, -221(%rbp)
	movl $1634890784, -217(%rbp)
	movl $1667851878, -213(%rbp)
	movb $0, -209(%rbp)
	movq %rbx, %rcx
	movq %r12, %r9
	callq standard__tls13__t_derive__4__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__ret_voidE1
	leaq -168(%rbp), %r8
	leaq -234(%rbp), %rdx
	movl $1936203891, -234(%rbp)
	movl $1634890784, -230(%rbp)
	movl $1667851878, -226(%rbp)
	movb $0, -222(%rbp)
	movq %rbx, %rcx
	movq %r13, %r9
	callq standard__tls13__t_derive__4__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__ret_voidE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
	.text
	.globl standard__tls13__t_app_keys__4__TLS13_CONNE1_ptr1__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__ret_voidE1
	.def standard__tls13__t_app_keys__4__TLS13_CONNE1_ptr1__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__tls13__t_app_keys__4__TLS13_CONNE1_ptr1__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $272, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
.LB23182:
	movq %rcx, %rsi
	movq %rdx, %rdi
	movq %r8, %rbx
	movq %r9, %r12
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -64(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -96(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -128(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -160(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -192(%rbp)
	vzeroupper
	movl $8, %eax
	xorl %ecx, %ecx
.LB32193:
	testq %rax, %rax
	je .LB32195
.LB32194:
	movb $0, -64(%rbp,%rcx,1)
	movb $0, -63(%rbp,%rcx,1)
	movb $0, -62(%rbp,%rcx,1)
	movb $0, -61(%rbp,%rcx,1)
	addq $4, %rcx
	decq %rax
	jne .LB32194
.LB32195:
.LB23193:
	cmpq $32, %rcx
	jge .LB23196
.LB23194:
	movb $0, -64(%rbp,%rcx,1)
	incq %rcx
	cmpq $32, %rcx
	jl .LB23194
.LB23196:
	leaq -192(%rbp), %r8
	xorl %ecx, %ecx
	xorl %edx, %edx
	callq standard__tls13__t_sha256__3__byteE1_ptr1__intE1__byteE1_ptr1__ret_voidE1
	leaq -192(%rbp), %r8
	leaq -96(%rbp), %r9
	leaq -200(%rbp), %rdx
	movl $1769104740, -200(%rbp)
	movl $6579574, -196(%rbp)
	movq %rdi, %rcx
	callq standard__tls13__t_derive__4__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__ret_voidE1
	leaq -96(%rbp), %rcx
	leaq -64(%rbp), %r8
	leaq -128(%rbp), %rax
	movl $32, %edx
	movl $32, %r9d
	movq %rax, 32(%rsp)
	callq standard__crypto__KDF__HKDF__hkdf_extract__5__byteE1_ptr1__intE1__byteE1_ptr1__intE1__byteE1_ptr1__ret_voidE1
	leaq -160(%rbp), %rdx
	movq %rsi, %rcx
	callq standard__tls13__t_tr_hash__2__TLS13_CONNE1_ptr1__byteE1_ptr1__ret_voidE1
	leaq -128(%rbp), %rcx
	leaq -160(%rbp), %r8
	leaq -213(%rbp), %rdx
	movl $1885413475, -213(%rbp)
	movl $1634890784, -209(%rbp)
	movl $1667851878, -205(%rbp)
	movb $0, -201(%rbp)
	movq %rbx, %r9
	callq standard__tls13__t_derive__4__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__ret_voidE1
	leaq -128(%rbp), %rcx
	leaq -160(%rbp), %r8
	leaq -226(%rbp), %rdx
	movl $1885413491, -226(%rbp)
	movl $1634890784, -222(%rbp)
	movl $1667851878, -218(%rbp)
	movb $0, -214(%rbp)
	movq %r12, %r9
	callq standard__tls13__t_derive__4__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__ret_voidE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
	.text
	.globl standard__tls13__t_parse_certificate__3__TLS13_CONNE1_ptr1__byteE1_ptr1__intE1__ret_boolE1
	.def standard__tls13__t_parse_certificate__3__TLS13_CONNE1_ptr1__byteE1_ptr1__intE1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__tls13__t_parse_certificate__3__TLS13_CONNE1_ptr1__byteE1_ptr1__intE1__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $80, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
	movq %r14, -48(%rbp)
.LB23262:
	movq %rcx, %rsi
	movq %rdx, %rdi
	movl %r8d, %ebx
	movzbl 4(%rdi), %eax
	addl $5, %eax
	leal 3(%rax), %r12d
	cmpl %ebx, %r12d
	jg .LB23286
.LB23287:
	movq %rdi, %rcx
	movq %rax, %rdx
	callq standard__tls13__t_g24__2__byteE1_ptr1__intE1__ret_intE1
	leal (%r12,%rax), %r13d
	cmpl %ebx, %r13d
	jg .LB23300
.LB23301:
	movl $0, 180440(%rsi)
	xorl %ebx, %ebx
.LB23305:
	cmpl %r13d, %r12d
	jge .LB23307
.LB23311:
	cmpl $8, 180440(%rsi)
	jge .LB23307
.LB23306:
	leal 3(%r12), %r14d
	cmpl %r13d, %r14d
	jg .LB23323
.LB23324:
	movq %rdi, %rcx
	movq %r12, %rdx
	callq standard__tls13__t_g24__2__byteE1_ptr1__intE1__ret_intE1
	movl %eax, %r12d
	leal (%r14,%r12), %eax
	cmpl %r13d, %eax
	jg .LB23343
.LB23336:
	leal (%rbx,%r12), %eax
	cmpl $32000, %eax
	jg .LB23343
.LB23344:
	xorl %eax, %eax
	testl %r12d, %r12d
	cmovg %r12d, %eax
	shrl $2, %eax
	xorl %ecx, %ecx
.LB32196:
	testl %eax, %eax
	je .LB32198
.LB32197:
	leal (%r14,%rcx), %edx
	movslq %edx, %rdx
	movzbl (%rdi,%rdx,1), %edx
	leal (%rbx,%rcx), %r8d
	movslq %r8d, %r8
	movb %dl, 146936(%rsi,%r8,1)
	leal 1(%rcx), %edx
	leal (%r14,%rdx), %r8d
	movslq %r8d, %r8
	movzbl (%rdi,%r8,1), %r8d
	addl %ebx, %edx
	movslq %edx, %rdx
	movb %r8b, 146936(%rsi,%rdx,1)
	leal 2(%rcx), %edx
	leal (%r14,%rdx), %r8d
	movslq %r8d, %r8
	movzbl (%rdi,%r8,1), %r8d
	addl %ebx, %edx
	movslq %edx, %rdx
	movb %r8b, 146936(%rsi,%rdx,1)
	leal 3(%rcx), %edx
	leal (%r14,%rdx), %r8d
	movslq %r8d, %r8
	movzbl (%rdi,%r8,1), %r8d
	addl %ebx, %edx
	movslq %edx, %rdx
	movb %r8b, 146936(%rsi,%rdx,1)
	addl $4, %ecx
	decl %eax
	jne .LB32197
	jmp .LB32198
.LB23307:
	xorl %eax, %eax
	cmpl $0, 180440(%rsi)
	setg %al
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	leave
	ret
.LB32198:
.LB23347:
	cmpl %r12d, %ecx
	jge .LB23350
.LB23348:
	leal (%r14,%rcx), %eax
	movslq %eax, %rax
	movzbl (%rdi,%rax,1), %eax
	leal (%rbx,%rcx), %edx
	movslq %edx, %rdx
	movb %al, 146936(%rsi,%rdx,1)
	incl %ecx
	cmpl %r12d, %ecx
	jl .LB23348
.LB23350:
	movslq 180440(%rsi), %rax
	imulq $188, %rax, %rax
	leaq 178936(%rsi,%rax,1), %rcx
	movslq %ebx, %rax
	leaq 146936(%rsi,%rax,1), %rdx
	movq %r12, %r8
	callq standard__crypto__X509__x509_parse__3__X509_CERTE1_ptr1__byteE1_ptr1__intE1__ret_boolE1
	testb %al, %al
	je .LB23382
.LB23383:
	addl %r12d, %ebx
	addl %r12d, %r14d
	leal 2(%r14), %r12d
	cmpl %r13d, %r12d
	jg .LB23395
.LB23396:
	movq %rdi, %rcx
	movq %r14, %rdx
	callq standard__tls13__t_g16__2__byteE1_ptr1__intE1__ret_intE1
	addl %eax, %r12d
	movl 180440(%rsi), %eax
	incl %eax
	movl %eax, 180440(%rsi)
	cmpl %r13d, %r12d
	jl .LB23311
	jmp .LB23307
.LB23395:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	leave
	ret
.LB23382:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	leave
	ret
.LB23343:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	leave
	ret
.LB23323:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	leave
	ret
.LB23300:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	leave
	ret
.LB23286:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	leave
	ret
	.text
	.globl standard__tls13__tls13_client_connect__8__TLS13_CONNE1_ptr1__intE1__byteE1_ptr1__intE1__X509_CERTE1_ptr1__intE1__intE1__dataE1_sbits64__ret_intE1
	.def standard__tls13__tls13_client_connect__8__TLS13_CONNE1_ptr1__intE1__byteE1_ptr1__intE1__X509_CERTE1_ptr1__intE1__intE1__dataE1_sbits64__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__tls13__tls13_client_connect__8__TLS13_CONNE1_ptr1__intE1__byteE1_ptr1__intE1__X509_CERTE1_ptr1__intE1__intE1__dataE1_sbits64__ret_intE1:
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
.LB23417:
	movq %rcx, %rsi
	movq %r8, -1336(%rbp)
	movl %r9d, %ebx
	movq 48(%rbp), %rax
	movq %rax, -1272(%rbp)
	movl 56(%rbp), %eax
	movq %rax, -1328(%rbp)
	movl 64(%rbp), %eax
	movq %rax, -1352(%rbp)
	movq 72(%rbp), %rax
	movq %rax, -1264(%rbp)
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
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -280(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -312(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -344(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -376(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -408(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -440(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -472(%rbp)
	vzeroupper
	leaq -1072(%rbp), %rax
	movq %rax, %rdi
	xorl %eax, %eax
	movl $600, %ecx
	rep stosb
	leaq -1202(%rbp), %rax
	movq %rax, %rdi
	xorl %eax, %eax
	movl $130, %ecx
	rep stosb
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -1238(%rbp)
	movl .LZERO+32(%rip), %r10d
	movl %r10d, -1206(%rbp)
	vzeroupper
	movl $0, -1244(%rbp)
	movl $0, -1248(%rbp)
	movl $0, -1252(%rbp)
	movb .LZERO(%rip), %r10b
	movb %r10b, -1253(%rbp)
	leaq -88(%rbp), %rcx
	movl %edx, (%rsi)
	movl $0, 4(%rsi)
	movl $0, 8(%rsi)
	movl $0, 16(%rsi)
	movl $0, 20(%rsi)
	movl $0, 24(%rsi)
	movl $0, 90536(%rsi)
	movl $0, 130540(%rsi)
	movl $0, 146928(%rsi)
	movl $0, 146932(%rsi)
	movl $0, 180440(%rsi)
	movl $0, 12(%rsi)
	movl $32, %edx
	callq standard__crypto__CSPRNG__random_bytes__2__byteE1_ptr1__intE1__ret_boolE1
	testb %al, %al
	je .LB23493
.LB23494:
	leaq -184(%rbp), %rcx
	movl $32, %edx
	callq standard__crypto__CSPRNG__random_bytes__2__byteE1_ptr1__intE1__ret_boolE1
	testb %al, %al
	je .LB23502
.LB23503:
	leaq -216(%rbp), %rcx
	movl $32, %edx
	callq standard__crypto__CSPRNG__random_bytes__2__byteE1_ptr1__intE1__ret_boolE1
	testb %al, %al
	je .LB23511
.LB23512:
	leaq -120(%rbp), %rcx
	leaq -88(%rbp), %rdx
	callq standard__crypto__ECDH__X25519__x25519_pubkey__2__byteE1_ptr1__byteE1_ptr1__ret_voidE1
	movl $0, -1244(%rbp)
	leaq -1072(%rbp), %rcx
	leaq -1244(%rbp), %rdx
	movl $1, %r8d
	callq standard__tls13__t_p8__3__byteE1_ptr1__intE1_ptr1__intE1__ret_voidE1
	leaq -1072(%rbp), %rcx
	leaq -1244(%rbp), %rdx
	xorl %r8d, %r8d
	callq standard__tls13__t_p24__3__byteE1_ptr1__intE1_ptr1__intE1__ret_voidE1
	leaq -1072(%rbp), %rcx
	leaq -1244(%rbp), %rdx
	movl $771, %r8d
	callq standard__tls13__t_p16__3__byteE1_ptr1__intE1_ptr1__intE1__ret_voidE1
	leaq -1072(%rbp), %rcx
	leaq -184(%rbp), %r8
	leaq -1244(%rbp), %rdx
	movl $32, %r9d
	callq standard__tls13__t_pbytes__4__byteE1_ptr1__intE1_ptr1__byteE1_ptr1__intE1__ret_voidE1
	leaq -1072(%rbp), %rcx
	leaq -1244(%rbp), %rdx
	movl $32, %r8d
	callq standard__tls13__t_p8__3__byteE1_ptr1__intE1_ptr1__intE1__ret_voidE1
	leaq -1072(%rbp), %rcx
	leaq -216(%rbp), %r8
	leaq -1244(%rbp), %rdx
	movl $32, %r9d
	callq standard__tls13__t_pbytes__4__byteE1_ptr1__intE1_ptr1__byteE1_ptr1__intE1__ret_voidE1
	leaq -1072(%rbp), %rcx
	leaq -1244(%rbp), %rdx
	movl $2, %r8d
	callq standard__tls13__t_p16__3__byteE1_ptr1__intE1_ptr1__intE1__ret_voidE1
	leaq -1072(%rbp), %rcx
	leaq -1244(%rbp), %rdx
	movl $4865, %r8d
	callq standard__tls13__t_p16__3__byteE1_ptr1__intE1_ptr1__intE1__ret_voidE1
	leaq -1072(%rbp), %rcx
	leaq -1244(%rbp), %rdx
	movl $1, %r8d
	callq standard__tls13__t_p8__3__byteE1_ptr1__intE1_ptr1__intE1__ret_voidE1
	leaq -1072(%rbp), %rcx
	leaq -1244(%rbp), %rdx
	xorl %r8d, %r8d
	callq standard__tls13__t_p8__3__byteE1_ptr1__intE1_ptr1__intE1__ret_voidE1
	movl -1244(%rbp), %edi
	leaq -1072(%rbp), %rcx
	leaq -1244(%rbp), %rdx
	xorl %r8d, %r8d
	callq standard__tls13__t_p16__3__byteE1_ptr1__intE1_ptr1__intE1__ret_voidE1
	testl %ebx, %ebx
	jg .LB23535
.LB23537:
	leaq -1072(%rbp), %rcx
	leaq -1244(%rbp), %rdx
	movl $10, %r8d
	callq standard__tls13__t_p16__3__byteE1_ptr1__intE1_ptr1__intE1__ret_voidE1
	leaq -1072(%rbp), %rcx
	leaq -1244(%rbp), %rdx
	movl $4, %r8d
	callq standard__tls13__t_p16__3__byteE1_ptr1__intE1_ptr1__intE1__ret_voidE1
	leaq -1072(%rbp), %rcx
	leaq -1244(%rbp), %rdx
	movl $2, %r8d
	callq standard__tls13__t_p16__3__byteE1_ptr1__intE1_ptr1__intE1__ret_voidE1
	leaq -1072(%rbp), %rcx
	leaq -1244(%rbp), %rdx
	movl $29, %r8d
	callq standard__tls13__t_p16__3__byteE1_ptr1__intE1_ptr1__intE1__ret_voidE1
	leaq -1072(%rbp), %rcx
	leaq -1244(%rbp), %rdx
	movl $13, %r8d
	callq standard__tls13__t_p16__3__byteE1_ptr1__intE1_ptr1__intE1__ret_voidE1
	leaq -1072(%rbp), %rcx
	leaq -1244(%rbp), %rdx
	movl $18, %r8d
	callq standard__tls13__t_p16__3__byteE1_ptr1__intE1_ptr1__intE1__ret_voidE1
	leaq -1072(%rbp), %rcx
	leaq -1244(%rbp), %rdx
	movl $16, %r8d
	callq standard__tls13__t_p16__3__byteE1_ptr1__intE1_ptr1__intE1__ret_voidE1
	leaq -1072(%rbp), %rcx
	leaq -1244(%rbp), %rdx
	movl $1027, %r8d
	callq standard__tls13__t_p16__3__byteE1_ptr1__intE1_ptr1__intE1__ret_voidE1
	leaq -1072(%rbp), %rcx
	leaq -1244(%rbp), %rdx
	movl $1283, %r8d
	callq standard__tls13__t_p16__3__byteE1_ptr1__intE1_ptr1__intE1__ret_voidE1
	leaq -1072(%rbp), %rcx
	leaq -1244(%rbp), %rdx
	movl $2052, %r8d
	callq standard__tls13__t_p16__3__byteE1_ptr1__intE1_ptr1__intE1__ret_voidE1
	leaq -1072(%rbp), %rcx
	leaq -1244(%rbp), %rdx
	movl $2053, %r8d
	callq standard__tls13__t_p16__3__byteE1_ptr1__intE1_ptr1__intE1__ret_voidE1
	leaq -1072(%rbp), %rcx
	leaq -1244(%rbp), %rdx
	movl $2054, %r8d
	callq standard__tls13__t_p16__3__byteE1_ptr1__intE1_ptr1__intE1__ret_voidE1
	leaq -1072(%rbp), %rcx
	leaq -1244(%rbp), %rdx
	movl $1025, %r8d
	callq standard__tls13__t_p16__3__byteE1_ptr1__intE1_ptr1__intE1__ret_voidE1
	leaq -1072(%rbp), %rcx
	leaq -1244(%rbp), %rdx
	movl $1281, %r8d
	callq standard__tls13__t_p16__3__byteE1_ptr1__intE1_ptr1__intE1__ret_voidE1
	leaq -1072(%rbp), %rcx
	leaq -1244(%rbp), %rdx
	movl $1537, %r8d
	callq standard__tls13__t_p16__3__byteE1_ptr1__intE1_ptr1__intE1__ret_voidE1
	leaq -1072(%rbp), %rcx
	leaq -1244(%rbp), %rdx
	movl $43, %r8d
	callq standard__tls13__t_p16__3__byteE1_ptr1__intE1_ptr1__intE1__ret_voidE1
	leaq -1072(%rbp), %rcx
	leaq -1244(%rbp), %rdx
	movl $3, %r8d
	callq standard__tls13__t_p16__3__byteE1_ptr1__intE1_ptr1__intE1__ret_voidE1
	leaq -1072(%rbp), %rcx
	leaq -1244(%rbp), %rdx
	movl $2, %r8d
	callq standard__tls13__t_p8__3__byteE1_ptr1__intE1_ptr1__intE1__ret_voidE1
	leaq -1072(%rbp), %rcx
	leaq -1244(%rbp), %rdx
	movl $772, %r8d
	callq standard__tls13__t_p16__3__byteE1_ptr1__intE1_ptr1__intE1__ret_voidE1
	leaq -1072(%rbp), %rcx
	leaq -1244(%rbp), %rdx
	movl $51, %r8d
	callq standard__tls13__t_p16__3__byteE1_ptr1__intE1_ptr1__intE1__ret_voidE1
	leaq -1072(%rbp), %rcx
	leaq -1244(%rbp), %rdx
	movl $38, %r8d
	callq standard__tls13__t_p16__3__byteE1_ptr1__intE1_ptr1__intE1__ret_voidE1
	leaq -1072(%rbp), %rcx
	leaq -1244(%rbp), %rdx
	movl $36, %r8d
	callq standard__tls13__t_p16__3__byteE1_ptr1__intE1_ptr1__intE1__ret_voidE1
	leaq -1072(%rbp), %rcx
	leaq -1244(%rbp), %rdx
	movl $29, %r8d
	callq standard__tls13__t_p16__3__byteE1_ptr1__intE1_ptr1__intE1__ret_voidE1
	leaq -1072(%rbp), %rcx
	leaq -1244(%rbp), %rdx
	movl $32, %r8d
	callq standard__tls13__t_p16__3__byteE1_ptr1__intE1_ptr1__intE1__ret_voidE1
	leaq -1072(%rbp), %rcx
	leaq -120(%rbp), %r8
	leaq -1244(%rbp), %rdx
	movl $32, %r9d
	callq standard__tls13__t_pbytes__4__byteE1_ptr1__intE1_ptr1__byteE1_ptr1__intE1__ret_voidE1
	movl %edi, -1252(%rbp)
	movl -1244(%rbp), %eax
	leaq -1072(%rbp), %rcx
	leaq -1252(%rbp), %rdx
	subl %edi, %eax
	leal -2(%rax), %r8d
	callq standard__tls13__t_p16__3__byteE1_ptr1__intE1_ptr1__intE1__ret_voidE1
	movl $1, -1252(%rbp)
	leaq -1072(%rbp), %rcx
	movl -1244(%rbp), %eax
	leaq -1252(%rbp), %rdx
	leal -4(%rax), %r8d
	callq standard__tls13__t_p24__3__byteE1_ptr1__intE1_ptr1__intE1__ret_voidE1
	leaq -1072(%rbp), %rdx
	movl -1244(%rbp), %r8d
	movq %rsi, %rcx
	callq standard__tls13__t_send_hs__3__TLS13_CONNE1_ptr1__byteE1_ptr1__intE1__ret_intE1
	testl %eax, %eax
	jne .LB23592
.LB23593:
	leaq -1248(%rbp), %rdx
	movq %rsi, %rcx
	callq standard__tls13__t_next_hs__2__TLS13_CONNE1_ptr1__intE1_ptr1__ret_intE1
	testl %eax, %eax
	js .LB23604
.LB23605:
	cmpl $2, %eax
	jne .LB23613
.LB23614:
	leaq 50536(%rsi), %rdi
	movq %rdi, %rcx
	movl $4, %edx
	callq standard__tls13__t_g16__2__byteE1_ptr1__intE1__ret_intE1
	cmpl $771, %eax
	jne .LB23625
.LB23626:
	cmpb $207, 6(%rdi)
	jne .LB23661
.LB23636:
	cmpb $33, 7(%rdi)
	jne .LB23661
.LB23644:
	cmpb $173, 8(%rdi)
	jne .LB23661
.LB23652:
	cmpb $116, 9(%rdi)
	je .LB23660
.LB23661:
	movzbl 38(%rdi), %eax
	leal 39(%rax), %r12d
	movq %rdi, %rcx
	movq %r12, %rdx
	callq standard__tls13__t_g16__2__byteE1_ptr1__intE1__ret_intE1
	cmpl $4865, %eax
	jne .LB23684
.LB23685:
	addl $2, %r12d
	incl %r12d
	movq %rdi, %rcx
	movq %r12, %rdx
	callq standard__tls13__t_g16__2__byteE1_ptr1__intE1__ret_intE1
	addl $2, %r12d
	movq $0, -1280(%rbp)
	movq %r12, -1288(%rbp)
	movq $0, -1296(%rbp)
	xorl %r12d, %r12d
.LB23695:
	movl -1248(%rbp), %r8d
	movq -1288(%rbp), %rcx
	leal -4(%r8), %eax
	addl $4, %eax
	cmpl %eax, %ecx
	jge .LB23697
.LB23703:
	movq -1288(%rbp), %rax
	addl $4, %eax
	cmpl %r8d, %eax
	jg .LB23697
.LB23696:
	movq %rdi, %rcx
	movq -1288(%rbp), %rdx
	callq standard__tls13__t_g16__2__byteE1_ptr1__intE1__ret_intE1
	movl %eax, %r13d
	movq -1288(%rbp), %rax
	leal 2(%rax), %edx
	movq %rdi, %rcx
	callq standard__tls13__t_g16__2__byteE1_ptr1__intE1__ret_intE1
	movl %eax, %r14d
	movq -1288(%rbp), %rax
	leal 4(%rax), %r15d
	cmpl $43, %r13d
	je .LB23721
.LB23722:
.LB23723:
	cmpl $51, %r13d
	je .LB23729
.LB23730:
	movq -1280(%rbp), %r13
	movq -1296(%rbp), %rax
.LB23731:
	addl %r14d, %r15d
	movq %r13, -1280(%rbp)
	movq %r15, -1288(%rbp)
	movq %rax, -1296(%rbp)
	jmp .LB23695
.LB23535:
	leaq -1072(%rbp), %rcx
	leaq -1244(%rbp), %rdx
	xorl %r8d, %r8d
	callq standard__tls13__t_p16__3__byteE1_ptr1__intE1_ptr1__intE1__ret_voidE1
	leaq -1072(%rbp), %rcx
	leal 5(%rbx), %r8d
	leaq -1244(%rbp), %rdx
	callq standard__tls13__t_p16__3__byteE1_ptr1__intE1_ptr1__intE1__ret_voidE1
	leaq -1072(%rbp), %rcx
	leal 3(%rbx), %r8d
	leaq -1244(%rbp), %rdx
	callq standard__tls13__t_p16__3__byteE1_ptr1__intE1_ptr1__intE1__ret_voidE1
	leaq -1072(%rbp), %rcx
	leaq -1244(%rbp), %rdx
	xorl %r8d, %r8d
	callq standard__tls13__t_p8__3__byteE1_ptr1__intE1_ptr1__intE1__ret_voidE1
	leaq -1072(%rbp), %rcx
	leaq -1244(%rbp), %rdx
	movq %rbx, %r8
	callq standard__tls13__t_p16__3__byteE1_ptr1__intE1_ptr1__intE1__ret_voidE1
	leaq -1072(%rbp), %rcx
	leaq -1244(%rbp), %rdx
	movq -1336(%rbp), %r8
	movq %rbx, %r9
	callq standard__tls13__t_pbytes__4__byteE1_ptr1__intE1_ptr1__byteE1_ptr1__intE1__ret_voidE1
	jmp .LB23537
.LB23697:
	cmpl $772, %r12d
	jne .LB23767
.LB23762:
	movq -1296(%rbp), %rax
	testl %eax, %eax
	je .LB23767
.LB23768:
	movq %rsi, %rcx
	movq %rdi, %rdx
	callq standard__tls13__t_tr_add__3__TLS13_CONNE1_ptr1__byteE1_ptr1__intE1__ret_voidE1
	movl -1248(%rbp), %edx
	movq %rsi, %rcx
	callq standard__tls13__t_consume_hs__2__TLS13_CONNE1_ptr1__intE1__ret_voidE1
	leaq -152(%rbp), %rdx
	leaq -248(%rbp), %r8
	leaq -280(%rbp), %r9
	leaq -312(%rbp), %rax
	movq %rsi, %rcx
	movq %rax, 32(%rsp)
	callq standard__tls13__t_hs_keys__5__TLS13_CONNE1_ptr1__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__ret_voidE1
	leaq -312(%rbp), %rdx
	movq %rsi, %rcx
	callq standard__tls13__t_set_read_keys__2__TLS13_CONNE1_ptr1__byteE1_ptr1__ret_voidE1
	movb $1, -1253(%rbp)
	leaq -1253(%rbp), %r8
	movq %rsi, %rcx
	movl $20, %edx
	movl $1, %r9d
	callq standard__tls13__t_send_record__4__TLS13_CONNE1_ptr1__intE1__byteE1_ptr1__intE1__ret_intE1
	testl %eax, %eax
	jne .LB23796
.LB23797:
	leaq -280(%rbp), %rdx
	movq %rsi, %rcx
	callq standard__tls13__t_set_write_keys__2__TLS13_CONNE1_ptr1__byteE1_ptr1__ret_voidE1
	xorl %edi, %edi
	xorl %r12d, %r12d
	movq $0, -1304(%rbp)
	movq $0, -1312(%rbp)
	movq $0, -1320(%rbp)
.LB23806:
	leaq -1248(%rbp), %rdx
	movq %rsi, %rcx
	callq standard__tls13__t_next_hs__2__TLS13_CONNE1_ptr1__intE1_ptr1__ret_intE1
	testl %eax, %eax
	js .LB23814
.LB23815:
	leaq 50536(%rsi), %r13
	cmpl $8, %eax
	je .LB23826
.LB23827:
	cmpl $11, %eax
	je .LB23835
.LB23836:
	cmpl $15, %eax
	jne .LB23859
.LB23858:
	movq -1304(%rbp), %rax
	testl %eax, %eax
	je .LB23867
.LB23862:
	cmpl $8, -1248(%rbp)
	jl .LB23867
.LB23868:
	movq %r13, %rcx
	movl $4, %edx
	callq standard__tls13__t_g16__2__byteE1_ptr1__intE1__ret_intE1
	movl %eax, %edi
	movq %r13, %rcx
	movl $6, %edx
	callq standard__tls13__t_g16__2__byteE1_ptr1__intE1__ret_intE1
	movl %eax, %r12d
	leal 8(%r12), %eax
	cmpl -1248(%rbp), %eax
	jg .LB23881
.LB23882:
	leaq -408(%rbp), %rdx
	movq %rsi, %rcx
	callq standard__tls13__t_tr_hash__2__TLS13_CONNE1_ptr1__byteE1_ptr1__ret_voidE1
	leaq -1202(%rbp), %rcx
	leaq -408(%rbp), %r8
	movl $1, %edx
	callq standard__tls13__t_cv_content__3__byteE1_ptr1__intE1__byteE1_ptr1__ret_intE1
	movl %eax, %r14d
	leaq 178936(%rsi), %rcx
	leaq -1202(%rbp), %r8
	leaq 8(%r13), %rax
	movq %rdi, %rdx
	movq %r14, %r9
	movq %rax, 32(%rsp)
	movq %r12, 40(%rsp)
	callq standard__tls13__t_verify_cv__6__X509_CERTE1_ptr1__intE1__byteE1_ptr1__intE1__byteE1_ptr1__intE1__ret_boolE1
	testb %al, %al
	je .LB23904
.LB23905:
	movl -1248(%rbp), %r8d
	movq %rsi, %rcx
	movq %r13, %rdx
	callq standard__tls13__t_tr_add__3__TLS13_CONNE1_ptr1__byteE1_ptr1__intE1__ret_voidE1
	movq -1304(%rbp), %r13
	movq %r14, -1344(%rbp)
	movl $1, %r14d
.LB23828:
	movl -1248(%rbp), %edx
	movq %rsi, %rcx
	callq standard__tls13__t_consume_hs__2__TLS13_CONNE1_ptr1__intE1__ret_voidE1
	movq %r13, -1304(%rbp)
	movq %r14, -1312(%rbp)
	movq -1344(%rbp), %r10
	movq %r10, -1320(%rbp)
	jmp .LB23806
.LB23859:
	cmpl $20, %eax
	je .LB23916
.LB23917:
	movq %rsi, %rcx
	movl $3, %edx
	callq standard__tls13__t_fail__2__TLS13_CONNE1_ptr1__intE1__ret_intE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB23916:
	cmpl $36, -1248(%rbp)
	jne .LB23920
.LB23921:
	leaq -408(%rbp), %rdx
	movq %rsi, %rcx
	callq standard__tls13__t_tr_hash__2__TLS13_CONNE1_ptr1__byteE1_ptr1__ret_voidE1
	leaq -312(%rbp), %rcx
	leaq -408(%rbp), %rdx
	leaq -472(%rbp), %r8
	callq standard__tls13__t_finished_data__3__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__ret_voidE1
	leaq -472(%rbp), %rcx
	leaq 4(%r13), %rdx
	movl $32, %r8d
	callq standard__tls13__t_const_eq__3__byteE1_ptr1__byteE1_ptr1__intE1__ret_boolE1
	testb %al, %al
	je .LB23937
.LB23938:
	movl -1248(%rbp), %r8d
	movq %rsi, %rcx
	movq %r13, %rdx
	callq standard__tls13__t_tr_add__3__TLS13_CONNE1_ptr1__byteE1_ptr1__intE1__ret_voidE1
	movl -1248(%rbp), %edx
	movq %rsi, %rcx
	callq standard__tls13__t_consume_hs__2__TLS13_CONNE1_ptr1__intE1__ret_voidE1
	movq -1304(%rbp), %rax
	testl %eax, %eax
	je .LB23963
.LB23958:
	movq -1312(%rbp), %rax
	testl %eax, %eax
	je .LB23963
.LB23964:
	movq -1352(%rbp), %rax
	testl %eax, %eax
	jne .LB23971
.LB23973:
	leaq -248(%rbp), %rdx
	leaq -344(%rbp), %r8
	leaq -376(%rbp), %r9
	movq %rsi, %rcx
	callq standard__tls13__t_app_keys__4__TLS13_CONNE1_ptr1__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__ret_voidE1
	leaq -408(%rbp), %rdx
	movq %rsi, %rcx
	callq standard__tls13__t_tr_hash__2__TLS13_CONNE1_ptr1__byteE1_ptr1__ret_voidE1
	leaq -280(%rbp), %rcx
	leaq -408(%rbp), %rdx
	leaq -440(%rbp), %r8
	callq standard__tls13__t_finished_data__3__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__ret_voidE1
	movl $536870932, -1072(%rbp)
	movl $0, -1252(%rbp)
.LB24019:
	movl -1252(%rbp), %eax
	cmpl $32, %eax
	jge .LB24022
.LB24020:
	movslq %eax, %rcx
	leal 4(%rax), %edx
	incl %eax
	movzbl -440(%rbp,%rcx,1), %ecx
	movslq %edx, %rdx
	movb %cl, -1072(%rbp,%rdx,1)
	movl %eax, -1252(%rbp)
	jmp .LB24019
.LB23971:
	movl 180440(%rsi), %edx
	movq -1264(%rbp), %rax
	leaq 178936(%rsi), %rcx
	movq %rax, 32(%rsp)
	movq -1336(%rbp), %rax
	movq %rax, 40(%rsp)
	movq %rbx, 48(%rsp)
	movq -1272(%rbp), %r8
	movq -1328(%rbp), %r9
	callq standard__crypto__X509__x509_verify_chain__7__X509_CERTE1_ptr1__intE1__X509_CERTE1_ptr1__intE1__dataE1_sbits64__byteE1_ptr1__intE1__ret_intE1
	movl %eax, 12(%rsi)
	testl %eax, %eax
	jne .LB23994
	jmp .LB23973
.LB24022:
	leaq -1072(%rbp), %rdx
	movq %rsi, %rcx
	movl $36, %r8d
	callq standard__tls13__t_send_hs__3__TLS13_CONNE1_ptr1__byteE1_ptr1__intE1__ret_intE1
	testl %eax, %eax
	jne .LB24038
.LB24039:
	leaq -344(%rbp), %rdx
	movq %rsi, %rcx
	callq standard__tls13__t_set_write_keys__2__TLS13_CONNE1_ptr1__byteE1_ptr1__ret_voidE1
	leaq -376(%rbp), %rdx
	movq %rsi, %rcx
	callq standard__tls13__t_set_read_keys__2__TLS13_CONNE1_ptr1__byteE1_ptr1__ret_voidE1
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
.LB24038:
	movl 8(%rsi), %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB23994:
	movq %rsi, %rcx
	movl $4, %edx
	callq standard__tls13__t_fail__2__TLS13_CONNE1_ptr1__intE1__ret_intE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB23963:
	movq %rsi, %rcx
	movl $2, %edx
	callq standard__tls13__t_fail__2__TLS13_CONNE1_ptr1__intE1__ret_intE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB23937:
	movq %rsi, %rcx
	movl $6, %edx
	callq standard__tls13__t_fail__2__TLS13_CONNE1_ptr1__intE1__ret_intE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB23920:
	movq %rsi, %rcx
	movl $2, %edx
	callq standard__tls13__t_fail__2__TLS13_CONNE1_ptr1__intE1__ret_intE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB23904:
	movq %rsi, %rcx
	movl $5, %edx
	callq standard__tls13__t_fail__2__TLS13_CONNE1_ptr1__intE1__ret_intE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB23881:
	movq %rsi, %rcx
	movl $2, %edx
	callq standard__tls13__t_fail__2__TLS13_CONNE1_ptr1__intE1__ret_intE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB23867:
	movq %rsi, %rcx
	movl $2, %edx
	callq standard__tls13__t_fail__2__TLS13_CONNE1_ptr1__intE1__ret_intE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB23835:
	movl -1248(%rbp), %r8d
	movq %rsi, %rcx
	movq %r13, %rdx
	callq standard__tls13__t_parse_certificate__3__TLS13_CONNE1_ptr1__byteE1_ptr1__intE1__ret_boolE1
	testb %al, %al
	je .LB23843
.LB23844:
	movl -1248(%rbp), %r8d
	movq %rsi, %rcx
	movq %r13, %rdx
	callq standard__tls13__t_tr_add__3__TLS13_CONNE1_ptr1__byteE1_ptr1__intE1__ret_voidE1
	movl $1, %r13d
	movq -1312(%rbp), %r14
	movq -1320(%rbp), %r10
	movq %r10, -1344(%rbp)
	jmp .LB23828
.LB23843:
	movl $4294967295, 12(%rsi)
	movq %rsi, %rcx
	movl $4, %edx
	callq standard__tls13__t_fail__2__TLS13_CONNE1_ptr1__intE1__ret_intE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB23826:
	movl -1248(%rbp), %r8d
	movq %rsi, %rcx
	movq %r13, %rdx
	callq standard__tls13__t_tr_add__3__TLS13_CONNE1_ptr1__byteE1_ptr1__intE1__ret_voidE1
	movq -1304(%rbp), %r13
	movq -1312(%rbp), %r14
	movq -1320(%rbp), %r10
	movq %r10, -1344(%rbp)
	jmp .LB23828
.LB23814:
	movl 8(%rsi), %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB23796:
	movl 8(%rsi), %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB23767:
	movq %rsi, %rcx
	movl $2, %edx
	callq standard__tls13__t_fail__2__TLS13_CONNE1_ptr1__intE1__ret_intE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB23721:
	movq %rdi, %rcx
	movq %r15, %rdx
	callq standard__tls13__t_g16__2__byteE1_ptr1__intE1__ret_intE1
	movl %eax, %r12d
	cmpl $51, %r13d
	jne .LB23730
.LB23729:
	movq %rdi, %rcx
	movq %r15, %rdx
	callq standard__tls13__t_g16__2__byteE1_ptr1__intE1__ret_intE1
	movl %eax, %r13d
	cmpl $29, %r13d
	jne .LB23745
.LB23737:
	leal 2(%r15), %edx
	movq %rdi, %rcx
	callq standard__tls13__t_g16__2__byteE1_ptr1__intE1__ret_intE1
	cmpl $32, %eax
	jne .LB23745
.LB23746:
	leaq -152(%rbp), %rcx
	leaq -88(%rbp), %rdx
	movslq %r15d, %rax
	leaq 4(%rdi,%rax,1), %r8
	callq standard__crypto__ECDH__X25519__x25519__3__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__ret_voidE1
	movl $1, %eax
	jmp .LB23731
.LB23745:
	movq %rsi, %rcx
	movl $3, %edx
	callq standard__tls13__t_fail__2__TLS13_CONNE1_ptr1__intE1__ret_intE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB23684:
	movq %rsi, %rcx
	movl $3, %edx
	callq standard__tls13__t_fail__2__TLS13_CONNE1_ptr1__intE1__ret_intE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB23660:
	movq %rsi, %rcx
	movl $3, %edx
	callq standard__tls13__t_fail__2__TLS13_CONNE1_ptr1__intE1__ret_intE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB23625:
	movq %rsi, %rcx
	movl $2, %edx
	callq standard__tls13__t_fail__2__TLS13_CONNE1_ptr1__intE1__ret_intE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB23613:
	movq %rsi, %rcx
	movl $2, %edx
	callq standard__tls13__t_fail__2__TLS13_CONNE1_ptr1__intE1__ret_intE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB23604:
	movl 8(%rsi), %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB23592:
	movl 8(%rsi), %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB23511:
	movq %rsi, %rcx
	movl $8, %edx
	callq standard__tls13__t_fail__2__TLS13_CONNE1_ptr1__intE1__ret_intE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB23502:
	movq %rsi, %rcx
	movl $8, %edx
	callq standard__tls13__t_fail__2__TLS13_CONNE1_ptr1__intE1__ret_intE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB23493:
	movq %rsi, %rcx
	movl $8, %edx
	callq standard__tls13__t_fail__2__TLS13_CONNE1_ptr1__intE1__ret_intE1
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
	.globl standard__tls13__t_key_update_write__1__TLS13_CONNE1_ptr1__ret_voidE1
	.def standard__tls13__t_key_update_write__1__TLS13_CONNE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__tls13__t_key_update_write__1__TLS13_CONNE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $112, %rsp
	movq %rsi, -8(%rbp)
.LB24051:
	movq %rcx, %rsi
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -40(%rbp)
	vzeroupper
	leaq 100(%rsi), %rcx
	leaq -40(%rbp), %rax
	leaq -52(%rbp), %rdx
	movl $1717662324, -52(%rbp)
	movl $543385958, -48(%rbp)
	movl $6582389, -44(%rbp)
	xorl %r8d, %r8d
	xorl %r9d, %r9d
	movq %rax, 32(%rsp)
	movq $32, 40(%rsp)
	callq standard__tls13__t_expand_label__6__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__intE1__byteE1_ptr1__intE1__ret_voidE1
	leaq -40(%rbp), %rdx
	movq %rsi, %rcx
	callq standard__tls13__t_set_write_keys__2__TLS13_CONNE1_ptr1__byteE1_ptr1__ret_voidE1
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl standard__tls13__t_key_update_read__1__TLS13_CONNE1_ptr1__ret_voidE1
	.def standard__tls13__t_key_update_read__1__TLS13_CONNE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__tls13__t_key_update_read__1__TLS13_CONNE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $112, %rsp
	movq %rsi, -8(%rbp)
.LB24077:
	movq %rcx, %rsi
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -40(%rbp)
	vzeroupper
	leaq 132(%rsi), %rcx
	leaq -40(%rbp), %rax
	leaq -52(%rbp), %rdx
	movl $1717662324, -52(%rbp)
	movl $543385958, -48(%rbp)
	movl $6582389, -44(%rbp)
	xorl %r8d, %r8d
	xorl %r9d, %r9d
	movq %rax, 32(%rsp)
	movq $32, 40(%rsp)
	callq standard__tls13__t_expand_label__6__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__intE1__byteE1_ptr1__intE1__ret_voidE1
	leaq -40(%rbp), %rdx
	movq %rsi, %rcx
	callq standard__tls13__t_set_read_keys__2__TLS13_CONNE1_ptr1__byteE1_ptr1__ret_voidE1
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl standard__tls13__tls13_send__3__TLS13_CONNE1_ptr1__byteE1_ptr1__intE1__ret_intE1
	.def standard__tls13__tls13_send__3__TLS13_CONNE1_ptr1__byteE1_ptr1__intE1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__tls13__tls13_send__3__TLS13_CONNE1_ptr1__byteE1_ptr1__intE1__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $80, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
.LB24103:
	movq %rcx, %rsi
	movq %rdx, %rdi
	movl %r8d, %ebx
	xorl %r12d, %r12d
.LB24109:
	cmpl %ebx, %r12d
	jge .LB24111
.LB24110:
	movl %ebx, %eax
	subl %r12d, %eax
	movl $16384, %ecx
	cmpl $16384, %eax
	movl %eax, %r13d
	cmovg %ecx, %r13d
	movslq %r12d, %rax
	leaq (%rdi,%rax,1), %r8
	movq %rsi, %rcx
	movl $23, %edx
	movq %r13, %r9
	callq standard__tls13__t_send_record__4__TLS13_CONNE1_ptr1__intE1__byteE1_ptr1__intE1__ret_intE1
	testl %eax, %eax
	jne .LB24131
.LB24132:
	addl %r13d, %r12d
	cmpl %ebx, %r12d
	jl .LB24110
.LB24111:
	movl %ebx, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB24131:
	movabsq $4294967295, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
	.text
	.globl standard__tls13__tls13_recv__3__TLS13_CONNE1_ptr1__byteE1_ptr1__intE1__ret_intE1
	.def standard__tls13__tls13_recv__3__TLS13_CONNE1_ptr1__byteE1_ptr1__intE1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__tls13__tls13_recv__3__TLS13_CONNE1_ptr1__byteE1_ptr1__intE1__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $96, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
	movq %r14, -48(%rbp)
.LB24139:
	movq %rcx, %rsi
	movq %rdx, %rdi
	movl %r8d, %ebx
	movl $0, -52(%rbp)
	movl $0, -56(%rbp)
	movl .LZERO(%rip), %r10d
	movl %r10d, -61(%rbp)
	movb .LZERO+4(%rip), %r10b
	movb %r10b, -57(%rbp)
	xorl %r12d, %r12d
	xorl %r13d, %r13d
	xorl %r14d, %r14d
.LB24150:
	movl 146932(%rsi), %eax
	movl 146928(%rsi), %ecx
	cmpl %ecx, %eax
	jl .LB24152
.LB24151:
	cmpl $0, 16(%rsi)
	jne .LB24167
.LB24168:
	leaq -52(%rbp), %rdx
	leaq -56(%rbp), %r8
	movq %rsi, %rcx
	callq standard__tls13__t_read_record__3__TLS13_CONNE1_ptr1__intE1_ptr1__intE1_ptr1__ret_intE1
	testl %eax, %eax
	jne .LB24174
.LB24175:
	movl -52(%rbp), %eax
	cmpl $23, %eax
	je .LB24180
.LB24181:
	cmpl $21, %eax
	je .LB24209
.LB24210:
	cmpl $22, %eax
	je .LB24233
.LB24234:
	cmpl $20, %eax
	jne .LB24287
.LB24286:
	xorl %r14d, %r14d
.LB24182:
	jmp .LB24150
.LB24152:
	subl %eax, %ecx
	cmpl %ebx, %ecx
	cmovg %ebx, %ecx
	xorl %eax, %eax
	testl %ecx, %ecx
	cmovg %ecx, %eax
	shrl $2, %eax
	xorl %edx, %edx
.LB32199:
	testl %eax, %eax
	je .LB32201
.LB32200:
	movl %edx, %r8d
	addl 146932(%rsi), %r8d
	movslq %r8d, %r8
	movzbl 130544(%rsi,%r8,1), %r8d
	movslq %edx, %r9
	movb %r8b, (%rdi,%r9,1)
	leal 1(%rdx), %r8d
	movl %r8d, %r9d
	addl 146932(%rsi), %r9d
	movslq %r9d, %r9
	movzbl 130544(%rsi,%r9,1), %r9d
	movslq %r8d, %r8
	movb %r9b, (%rdi,%r8,1)
	leal 2(%rdx), %r8d
	movl %r8d, %r9d
	addl 146932(%rsi), %r9d
	movslq %r9d, %r9
	movzbl 130544(%rsi,%r9,1), %r9d
	movslq %r8d, %r8
	movb %r9b, (%rdi,%r8,1)
	leal 3(%rdx), %r8d
	movl %r8d, %r9d
	addl 146932(%rsi), %r9d
	movslq %r9d, %r9
	movzbl 130544(%rsi,%r9,1), %r9d
	movslq %r8d, %r8
	movb %r9b, (%rdi,%r8,1)
	addl $4, %edx
	decl %eax
	jne .LB32200
.LB32201:
.LB24307:
	cmpl %ecx, %edx
	jge .LB24310
.LB24308:
	movl %edx, %eax
	addl 146932(%rsi), %eax
	movslq %eax, %rax
	movzbl 130544(%rsi,%rax,1), %eax
	movslq %edx, %r8
	movb %al, (%rdi,%r8,1)
	incl %edx
	cmpl %ecx, %edx
	jl .LB24308
.LB24310:
	movl %ecx, %eax
	addl 146932(%rsi), %eax
	movl %eax, 146932(%rsi)
	movl %ecx, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	leave
	ret
.LB24287:
	movl $2, 8(%rsi)
	movabsq $4294967295, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	leave
	ret
.LB24233:
	movzbl 17196(%rsi), %eax
	movzbl %al, %r13d
	cmpb $24, %al
	je .LB24243
.LB24245:
	jmp .LB24182
.LB24243:
	movq %rsi, %rcx
	callq standard__tls13__t_key_update_read__1__TLS13_CONNE1_ptr1__ret_voidE1
	cmpl $5, -56(%rbp)
	jl .LB24245
.LB24250:
	cmpb $1, 17200(%rsi)
	jne .LB24245
.LB24260:
	movl $16777240, -61(%rbp)
	movb $0, -57(%rbp)
	leaq -61(%rbp), %r8
	movq %rsi, %rcx
	movl $22, %edx
	movl $5, %r9d
	callq standard__tls13__t_send_record__4__TLS13_CONNE1_ptr1__intE1__byteE1_ptr1__intE1__ret_intE1
	testl %eax, %eax
	jne .LB24278
.LB24279:
	movq %rsi, %rcx
	callq standard__tls13__t_key_update_write__1__TLS13_CONNE1_ptr1__ret_voidE1
	jmp .LB24245
.LB24278:
	movabsq $4294967295, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	leave
	ret
.LB24209:
	cmpl $2, -56(%rbp)
	jge .LB24213
.LB24215:
	movl $7, 8(%rsi)
	movabsq $4294967295, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	leave
	ret
.LB24213:
	cmpb $0, 17197(%rsi)
	jne .LB24215
.LB24223:
	movl $1, 16(%rsi)
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	leave
	ret
.LB24180:
	xorl %r12d, %r12d
.LB24183:
	movl -56(%rbp), %eax
	cmpl %eax, %r12d
	jge .LB24186
.LB24184:
	movslq %r12d, %rax
	movzbl 17196(%rsi,%rax,1), %ecx
	movb %cl, 130544(%rsi,%rax,1)
	incl %r12d
	jmp .LB24183
.LB24186:
	movl %eax, 146928(%rsi)
	movl $0, 146932(%rsi)
	jmp .LB24182
.LB24174:
	movabsq $4294967295, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	leave
	ret
.LB24167:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	leave
	ret
	.text
	.globl standard__tls13__tls13_close__1__TLS13_CONNE1_ptr1__ret_voidE1
	.def standard__tls13__tls13_close__1__TLS13_CONNE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__tls13__tls13_close__1__TLS13_CONNE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
.LB24339:
	movq %rcx, %rsi
	movw .LZERO(%rip), %r10w
	movw %r10w, -10(%rbp)
	movw $1, -10(%rbp)
	leaq -10(%rbp), %r8
	movq %rsi, %rcx
	movl $21, %edx
	movl $2, %r9d
	callq standard__tls13__t_send_record__4__TLS13_CONNE1_ptr1__intE1__byteE1_ptr1__intE1__ret_intE1
	movl $1, 16(%rsi)
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl standard__web__w_strlen__1__byteE1_ptr1__ret_intE1
	.def standard__web__w_strlen__1__byteE1_ptr1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__web__w_strlen__1__byteE1_ptr1__ret_intE1:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
.LB24352:
	movq %rcx, %rax
	movl %eax, %ecx
	movq %rax, %rdx
	andq $-32, %rdx
	vpxor %xmm15, %xmm15, %xmm15
	vpcmpeqb (%rdx), %ymm15, %ymm0
	vpmovmskb %ymm0, %esi
	shrl %cl, %esi
	testl %esi, %esi
	jne .LS32202f
.LS32202l:
	addq $32, %rdx
	vpcmpeqb (%rdx), %ymm15, %ymm0
	vpmovmskb %ymm0, %esi
	testl %esi, %esi
	je .LS32202l
	tzcntl %esi, %esi
	addq %rdx, %rsi
	subq %rax, %rsi
	jmp .LS32202d
.LS32202f:
	tzcntl %esi, %esi
.LS32202d:
	vzeroupper
.LB24355:
	movl %esi, %eax
	movq 0(%rsp), %rsi
	addq $16, %rsp
	ret
	.text
	.globl standard__web__w_lower__1__byteE1__ret_byteE1
	.def standard__web__w_lower__1__byteE1__ret_byteE1;
	.scl 2;
	.type 32;
	.endef
standard__web__w_lower__1__byteE1__ret_byteE1:
.LB24367:
	cmpb $65, %cl
	jb .LB24379
.LB24372:
	cmpb $90, %cl
	jbe .LB24378
.LB24379:
	movzbl %cl, %eax
	ret
.LB24378:
	addl $32, %ecx
	movzbl %cl, %eax
	ret
	.text
	.globl standard__web__web_send_all__3__WEB_STREAME1_ptr1__byteE1_ptr1__intE1__ret_boolE1
	.def standard__web__web_send_all__3__WEB_STREAME1_ptr1__byteE1_ptr1__intE1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__web__web_send_all__3__WEB_STREAME1_ptr1__byteE1_ptr1__intE1__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
.LB24385:
	movl %r8d, %esi
	cmpl $0, 4(%rcx)
	jne .LB24394
.LB24395:
	movl (%rcx), %ecx
	movq %rsi, %r8
	callq standard__sockets__tcp_send_all__3__intE1__byteE1_ptr1__intE1__ret_intE1
	xorl %ecx, %ecx
	testl %eax, %eax
	setns %cl
	movl %ecx, %eax
	movq -8(%rbp), %rsi
	leave
	ret
.LB24394:
	movq 8(%rcx), %rcx
	movq %rsi, %r8
	callq standard__tls13__tls13_send__3__TLS13_CONNE1_ptr1__byteE1_ptr1__intE1__ret_intE1
	xorl %ecx, %ecx
	cmpl %esi, %eax
	sete %cl
	movl %ecx, %eax
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl standard__web__w_raw_recv__3__WEB_STREAME1_ptr1__byteE1_ptr1__intE1__ret_intE1
	.def standard__web__w_raw_recv__3__WEB_STREAME1_ptr1__byteE1_ptr1__intE1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__web__w_raw_recv__3__WEB_STREAME1_ptr1__byteE1_ptr1__intE1__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB24414:
	cmpl $0, 4(%rcx)
	jne .LB24423
.LB24424:
	movl (%rcx), %ecx
	callq standard__sockets__sock_recv__3__intE1__byteE1_ptr1__intE1__ret_intE1
	leave
	ret
.LB24423:
	movq 8(%rcx), %rcx
	callq standard__tls13__tls13_recv__3__TLS13_CONNE1_ptr1__byteE1_ptr1__intE1__ret_intE1
	leave
	ret
	.text
	.globl standard__web__w_getc__1__WEB_STREAME1_ptr1__ret_intE1
	.def standard__web__w_getc__1__WEB_STREAME1_ptr1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__web__w_getc__1__WEB_STREAME1_ptr1__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
.LB24440:
	movq %rcx, %rsi
	movl 4112(%rsi), %eax
	cmpl 4116(%rsi), %eax
	jge .LB24452
.LB24454:
	movl 4112(%rsi), %eax
	movslq %eax, %rcx
	movzbl 16(%rsi,%rcx,1), %ecx
	incl %eax
	movl %eax, 4112(%rsi)
	movl %ecx, %eax
	movq -8(%rbp), %rsi
	leave
	ret
.LB24452:
	cmpl $0, 4120(%rsi)
	jne .LB24460
.LB24461:
	leaq 16(%rsi), %rdx
	movq %rsi, %rcx
	movl $4096, %r8d
	callq standard__web__w_raw_recv__3__WEB_STREAME1_ptr1__byteE1_ptr1__intE1__ret_intE1
	testl %eax, %eax
	jle .LB24472
.LB24473:
	movl %eax, 4116(%rsi)
	movl $0, 4112(%rsi)
	jmp .LB24454
.LB24472:
	movl $1, 4120(%rsi)
	movabsq $4294967295, %rax
	movq -8(%rbp), %rsi
	leave
	ret
.LB24460:
	movabsq $4294967295, %rax
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl standard__web__w_readn__3__WEB_STREAME1_ptr1__byteE1_ptr1__intE1__ret_boolE1
	.def standard__web__w_readn__3__WEB_STREAME1_ptr1__byteE1_ptr1__intE1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__web__w_readn__3__WEB_STREAME1_ptr1__byteE1_ptr1__intE1__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
.LB24501:
	movq %rcx, %rsi
	movq %rdx, %rdi
	movslq %r8d, %rbx
	xorl %r12d, %r12d
.LB24507:
	cmpq %rbx, %r12
	jge .LB24510
.LB24508:
	movq %rsi, %rcx
	callq standard__web__w_getc__1__WEB_STREAME1_ptr1__ret_intE1
	testl %eax, %eax
	js .LB24519
.LB24520:
	movb %al, (%rdi,%r12,1)
	incq %r12
	cmpq %rbx, %r12
	jl .LB24508
.LB24510:
	movl $1, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB24519:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
	.text
	.globl standard__web__w_readline__3__WEB_STREAME1_ptr1__byteE1_ptr1__intE1__ret_intE1
	.def standard__web__w_readline__3__WEB_STREAME1_ptr1__byteE1_ptr1__intE1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__web__w_readline__3__WEB_STREAME1_ptr1__byteE1_ptr1__intE1__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
.LB24529:
	movq %rcx, %rsi
	movq %rdx, %rdi
	leal -1(%r8), %ebx
	xorl %r12d, %r12d
.LB24535:
	movq %rsi, %rcx
	callq standard__web__w_getc__1__WEB_STREAME1_ptr1__ret_intE1
	testl %eax, %eax
	js .LB24543
.LB24544:
	cmpl $10, %eax
	je .LB24549
.LB24550:
	cmpl $13, %eax
	je .LB24562
.LB24554:
	cmpl %ebx, %r12d
	jl .LB24561
.LB24562:
.LB24563:
	jmp .LB24535
.LB24561:
	movslq %r12d, %rcx
	movb %al, (%rdi,%rcx,1)
	incl %r12d
	jmp .LB24563
.LB24549:
	movslq %r12d, %rax
	movb $0, (%rdi,%rax,1)
	movl %r12d, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB24543:
	movabsq $4294967295, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
	.text
	.globl standard__web__web_wait_readable__2__WEB_STREAME1_ptr1__intE1__ret_intE1
	.def standard__web__web_wait_readable__2__WEB_STREAME1_ptr1__intE1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__web__web_wait_readable__2__WEB_STREAME1_ptr1__intE1__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
.LB24576:
	movl 4112(%rcx), %eax
	cmpl 4116(%rcx), %eax
	jl .LB24588
.LB24589:
	cmpl $0, 4(%rcx)
	jne .LB24596
.LB24598:
	movl (%rcx), %ecx
	callq standard__sockets__sock_wait_readable__2__intE1__intE1__ret_intE1
	movq -8(%rbp), %rsi
	leave
	ret
.LB24596:
	movq 8(%rcx), %rax
	movl 146932(%rax), %esi
	cmpl 146928(%rax), %esi
	jl .LB24620
.LB24621:
	movq 8(%rcx), %rax
	cmpl $0, 16(%rax)
	je .LB24598
.LB24634:
	movl $1, %eax
	movq -8(%rbp), %rsi
	leave
	ret
.LB24620:
	movl $1, %eax
	movq -8(%rbp), %rsi
	leave
	ret
.LB24588:
	movl $1, %eax
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl standard__web__web_connect__9__WEB_STREAME1_ptr1__TLS13_CONNE1_ptr1__byteE1_ptr1__dataE1_ubits16__intE1__X509_CERTE1_ptr1__intE1__intE1__dataE1_sbits64__ret_intE1
	.def standard__web__web_connect__9__WEB_STREAME1_ptr1__TLS13_CONNE1_ptr1__byteE1_ptr1__dataE1_ubits16__intE1__X509_CERTE1_ptr1__intE1__intE1__dataE1_sbits64__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__web__web_connect__9__WEB_STREAME1_ptr1__TLS13_CONNE1_ptr1__byteE1_ptr1__dataE1_ubits16__intE1__X509_CERTE1_ptr1__intE1__intE1__dataE1_sbits64__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $128, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
	movq %r14, -48(%rbp)
	movq %r15, -56(%rbp)
.LB24643:
	movl 48(%rbp), %r12d
	movq 56(%rbp), %r13
	movl 64(%rbp), %r14d
	movl 72(%rbp), %r15d
	movq 80(%rbp), %rax
	movq %rcx, %rsi
	movq %rdx, %rdi
	movq %r8, %rbx
	movzwl %r9w, %edx
	movq %rbx, %rcx
	movq %rax, -64(%rbp)
	movl %r12d, 4(%rsi)
	movq %rdi, 8(%rsi)
	movl $0, 4112(%rsi)
	movl $0, 4116(%rsi)
	movl $0, 4120(%rsi)
	callq standard__sockets__tcp_connect_host__2__byteE1_ptr1__dataE1_ubits16__ret_intE1
	movl %eax, (%rsi)
	testl %eax, %eax
	js .LB24677
.LB24678:
	testl %r12d, %r12d
	jne .LB24682
.LB24683:
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
.LB24682:
	movl (%rsi), %r12d
	movq %rbx, %rcx
	callq standard__web__w_strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %r9d
	movq %r13, 32(%rsp)
	movq %r14, 40(%rsp)
	movq %r15, 48(%rsp)
	movq -64(%rbp), %rax
	movq %rdi, %rcx
	movq %r12, %rdx
	movq %rbx, %r8
	movq %rax, 56(%rsp)
	callq standard__tls13__tls13_client_connect__8__TLS13_CONNE1_ptr1__intE1__byteE1_ptr1__intE1__X509_CERTE1_ptr1__intE1__intE1__dataE1_sbits64__ret_intE1
	movl %eax, %edi
	testl %edi, %edi
	jne .LB24702
.LB24703:
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
.LB24702:
	movl (%rsi), %ecx
	callq standard__sockets__sock_close__1__intE1__ret_intE1
	leal 100(%rdi), %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB24677:
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
	.text
	.globl standard__web__web_close__1__WEB_STREAME1_ptr1__ret_voidE1
	.def standard__web__web_close__1__WEB_STREAME1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__web__web_close__1__WEB_STREAME1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
.LB24712:
	movq %rcx, %rsi
	cmpl $0, 4(%rsi)
	jne .LB24719
.LB24721:
	movl (%rsi), %ecx
	callq standard__sockets__sock_close__1__intE1__ret_intE1
	movq -8(%rbp), %rsi
	leave
	ret
.LB24719:
	movq 8(%rsi), %rcx
	callq standard__tls13__tls13_close__1__TLS13_CONNE1_ptr1__ret_voidE1
	jmp .LB24721
	.text
	.globl standard__web__w_cat__4__byteE1_ptr1__intE1_ptr1__intE1__byteE1_ptr1__ret_voidE1
	.def standard__web__w_cat__4__byteE1_ptr1__intE1_ptr1__intE1__byteE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__web__w_cat__4__byteE1_ptr1__intE1_ptr1__intE1__byteE1_ptr1__ret_voidE1:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
	movq %rdi, -8(%rsp)
.LB24731:
	decl %r8d
	xorl %eax, %eax
.LB24737:
	movslq %eax, %rsi
	movzbl (%r9,%rsi,1), %esi
	testb %sil, %sil
	je .LB24739
.LB24746:
	movl (%rdx), %edi
	cmpl %r8d, %edi
	jge .LB24739
.LB24738:
	movslq %edi, %rdi
	movb %sil, (%rcx,%rdi,1)
	movl (%rdx), %esi
	incl %esi
	movl %esi, (%rdx)
	incl %eax
	jmp .LB24737
.LB24739:
	movslq (%rdx), %rax
	movb $0, (%rcx,%rax,1)
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
	.text
	.globl standard__web__w_starts__2__byteE1_ptr1__byteE1_ptr1__ret_boolE1
	.def standard__web__w_starts__2__byteE1_ptr1__byteE1_ptr1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__web__w_starts__2__byteE1_ptr1__byteE1_ptr1__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $80, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
.LB24773:
	movq %rcx, %rsi
	movq %rdx, %rdi
	xorl %ebx, %ebx
.LB24777:
	movslq %ebx, %rax
	leaq (%rdi,%rax,1), %r12
	cmpb $0, (%r12)
	je .LB24779
.LB24778:
	movslq %ebx, %rax
	movzbl (%rsi,%rax,1), %eax
	movzbl %al, %ecx
	callq standard__web__w_lower__1__byteE1__ret_byteE1
	movzbl %al, %r13d
	movzbl (%r12), %eax
	movzbl %al, %ecx
	callq standard__web__w_lower__1__byteE1__ret_byteE1
	movzbl %al, %eax
	cmpb %al, %r13b
	jne .LB24797
.LB24798:
	incl %ebx
	jmp .LB24777
.LB24779:
	movl $1, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB24797:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
	.text
	.globl standard__web__w_atoi__1__byteE1_ptr1__ret_intE1
	.def standard__web__w_atoi__1__byteE1_ptr1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__web__w_atoi__1__byteE1_ptr1__ret_intE1:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
.LB24802:
	xorl %eax, %eax
.LB24806:
	movslq %eax, %rdx
	cmpb $32, (%rcx,%rdx,1)
	jne .LB24808
.LB24807:
	incl %eax
	jmp .LB24806
.LB24808:
	movq %rax, %rdx
	xorl %eax, %eax
.LB24817:
	movslq %edx, %rsi
	movzbl (%rcx,%rsi,1), %esi
	cmpb $48, %sil
	jb .LB24819
.LB24826:
	cmpb $57, %sil
	ja .LB24819
.LB24818:
	imull $10, %eax, %eax
	movslq %edx, %rsi
	movzbl (%rcx,%rsi,1), %esi
	subl $48, %esi
	addl %esi, %eax
	incl %edx
	jmp .LB24817
.LB24819:
	movq 0(%rsp), %rsi
	addq $16, %rsp
	ret
	.text
	.globl standard__web__w_hexval__1__byteE1_ptr1__ret_intE1
	.def standard__web__w_hexval__1__byteE1_ptr1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__web__w_hexval__1__byteE1_ptr1__ret_intE1:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
	movq %rdi, -8(%rsp)
.LB24847:
	xorl %eax, %eax
	xorl %edx, %edx
.LB24852:
	movslq %edx, %rsi
	movzbl (%rcx,%rsi,1), %esi
	cmpb $48, %sil
	jb .LB24872
.LB24862:
	cmpb $57, %sil
	jbe .LB24871
.LB24872:
	movl $4294967295, %esi
.LB24873:
	movslq %edx, %rdi
	movzbl (%rcx,%rdi,1), %edi
	cmpb $97, %dil
	jb .LB24896
.LB24886:
	cmpb $102, %dil
	jbe .LB24895
.LB24896:
.LB24897:
	movslq %edx, %rdi
	movzbl (%rcx,%rdi,1), %edi
	cmpb $65, %dil
	jb .LB24920
.LB24910:
	cmpb $70, %dil
	jbe .LB24919
.LB24920:
.LB24921:
	testl %esi, %esi
	js .LB24930
.LB24931:
	shll $4, %eax
	addl %esi, %eax
	incl %edx
	jmp .LB24852
.LB24871:
	movslq %edx, %rsi
	movzbl (%rcx,%rsi,1), %esi
	subl $48, %esi
	jmp .LB24873
.LB24895:
	movslq %edx, %rsi
	movzbl (%rcx,%rsi,1), %esi
	subl $87, %esi
	jmp .LB24897
.LB24919:
	movslq %edx, %rsi
	movzbl (%rcx,%rsi,1), %esi
	subl $55, %esi
	jns .LB24931
.LB24930:
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
	.text
	.globl standard__web__w_contains__2__byteE1_ptr1__byteE1_ptr1__ret_boolE1
	.def standard__web__w_contains__2__byteE1_ptr1__byteE1_ptr1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__web__w_contains__2__byteE1_ptr1__byteE1_ptr1__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
.LB24940:
	movq %rcx, %rsi
	movq %rdx, %rdi
	xorl %ebx, %ebx
.LB24944:
	movslq %ebx, %rax
	leaq (%rsi,%rax,1), %rcx
	cmpb $0, (%rcx)
	je .LB24946
.LB24945:
	movq %rdi, %rdx
	callq standard__web__w_starts__2__byteE1_ptr1__byteE1_ptr1__ret_boolE1
	testb %al, %al
	jne .LB24958
.LB24959:
	incl %ebx
	jmp .LB24944
.LB24946:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB24958:
	movl $1, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__web__http_request__10__WEB_STREAME1_ptr1__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__intE1__byteE1_ptr1__intE1__intE1_ptr1__ret_intE1
	.def standard__web__http_request__10__WEB_STREAME1_ptr1__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__intE1__byteE1_ptr1__intE1__intE1_ptr1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__web__http_request__10__WEB_STREAME1_ptr1__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__intE1__byteE1_ptr1__intE1__intE1_ptr1__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	movl $7488, %eax
	callq __chkstk
	subq %rax, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
	movq %r14, -48(%rbp)
	movq %r15, -56(%rbp)
.LB24963:
	movq %rcx, %rsi
	movq %rdx, %rbx
	movq %r8, -7440(%rbp)
	movq %r9, -7432(%rbp)
	movq 48(%rbp), %r12
	movq 56(%rbp), %rax
	movl $6144, %ecx
	movq %rax, -7424(%rbp)
	movl 64(%rbp), %r13d
	movq 72(%rbp), %r14
	movl 80(%rbp), %r15d
	movq 88(%rbp), %rax
	movq %rax, -7448(%rbp)
	leaq -6200(%rbp), %rax
	movq %rax, %rdi
	xorl %eax, %eax
	rep stosb
	leaq -7224(%rbp), %rax
	movq %rax, %rdi
	xorl %eax, %eax
	movl $1024, %ecx
	rep stosb
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -7240(%rbp)
	movl $0, -7244(%rbp)
	leaq -6200(%rbp), %rcx
	leaq -7244(%rbp), %rdx
	movl $6144, %r8d
	movq %rbx, %r9
	callq standard__web__w_cat__4__byteE1_ptr1__intE1_ptr1__intE1__byteE1_ptr1__ret_voidE1
	leaq -6200(%rbp), %rcx
	movw $32, -7246(%rbp)
	leaq -7246(%rbp), %r9
	leaq -7244(%rbp), %rdx
	movl $6144, %r8d
	callq standard__web__w_cat__4__byteE1_ptr1__intE1_ptr1__intE1__byteE1_ptr1__ret_voidE1
	leaq -6200(%rbp), %rcx
	leaq -7244(%rbp), %rdx
	movq -7432(%rbp), %r9
	movl $6144, %r8d
	callq standard__web__w_cat__4__byteE1_ptr1__intE1_ptr1__intE1__byteE1_ptr1__ret_voidE1
	leaq -6200(%rbp), %rcx
	leaq -7264(%rbp), %r9
	leaq -7244(%rbp), %rdx
	movl $1414809632, -7264(%rbp)
	movl $774975312, -7260(%rbp)
	movl $1208618289, -7256(%rbp)
	movl $980710255, -7252(%rbp)
	movw $32, -7248(%rbp)
	movl $6144, %r8d
	callq standard__web__w_cat__4__byteE1_ptr1__intE1_ptr1__intE1__byteE1_ptr1__ret_voidE1
	leaq -6200(%rbp), %rcx
	leaq -7244(%rbp), %rdx
	movq -7440(%rbp), %r9
	movl $6144, %r8d
	callq standard__web__w_cat__4__byteE1_ptr1__intE1_ptr1__intE1__byteE1_ptr1__ret_voidE1
	leaq -6200(%rbp), %rcx
	leaq -7280(%rbp), %r9
	leaq -7244(%rbp), %rdx
	movl $1665206797, -7280(%rbp)
	movl $1953523043, -7276(%rbp)
	movl $791289914, -7272(%rbp)
	movl $658730, -7268(%rbp)
	movl $6144, %r8d
	callq standard__web__w_cat__4__byteE1_ptr1__intE1_ptr1__intE1__byteE1_ptr1__ret_voidE1
	testq %r12, %r12
	je .LB25046
.LB25047:
	movl $1919251317, -7292(%rbp)
	movl $1701273901, -7288(%rbp)
	movl $3830894, -7284(%rbp)
	leaq -7292(%rbp), %rdx
	movq %r12, %rcx
	callq standard__web__w_contains__2__byteE1_ptr1__byteE1_ptr1__ret_boolE1
	testb %al, %al
	je .LB25089
.LB25048:
	testq %r12, %r12
	jne .LB25120
.LB25122:
	testl %r13d, %r13d
	jg .LB25163
.LB25127:
	movl $1414745936, -7337(%rbp)
	movb $0, -7333(%rbp)
	leaq -7337(%rbp), %rdx
	movq %rbx, %rcx
	callq standard__web__w_starts__2__byteE1_ptr1__byteE1_ptr1__ret_boolE1
	testb %al, %al
	jne .LB25163
.LB25139:
	movl $5526864, -7341(%rbp)
	leaq -7341(%rbp), %rdx
	movq %rbx, %rcx
	callq standard__web__w_starts__2__byteE1_ptr1__byteE1_ptr1__ret_boolE1
	testb %al, %al
	jne .LB25163
.LB25150:
	movl $1129595216, -7347(%rbp)
	movw $72, -7343(%rbp)
	leaq -7347(%rbp), %rdx
	movq %rbx, %rcx
	callq standard__web__w_starts__2__byteE1_ptr1__byteE1_ptr1__ret_boolE1
	testb %al, %al
	jne .LB25163
.LB25165:
	leaq -6200(%rbp), %rcx
	leaq -7370(%rbp), %r9
	leaq -7244(%rbp), %rdx
	movw $2573, -7370(%rbp)
	movb $0, -7368(%rbp)
	movl $6144, %r8d
	callq standard__web__w_cat__4__byteE1_ptr1__intE1_ptr1__intE1__byteE1_ptr1__ret_voidE1
	leaq -6200(%rbp), %rdx
	movl -7244(%rbp), %r8d
	movq %rsi, %rcx
	callq standard__web__web_send_all__3__WEB_STREAME1_ptr1__byteE1_ptr1__intE1__ret_boolE1
	testb %al, %al
	je .LB25244
.LB25245:
	testl %r13d, %r13d
	jg .LB25250
.LB25252:
	leaq -7224(%rbp), %rdx
	movq %rsi, %rcx
	movl $1024, %r8d
	callq standard__web__w_readline__3__WEB_STREAME1_ptr1__byteE1_ptr1__intE1__ret_intE1
	cmpl $12, %eax
	jl .LB25268
.LB25269:
	leaq -7215(%rbp), %rcx
	callq standard__web__w_atoi__1__byteE1_ptr1__ret_intE1
	movq -7448(%rbp), %rcx
	movl %eax, (%rcx)
	movl $4294967295, %edi
	xorl %ebx, %ebx
.LB25276:
	leaq -7224(%rbp), %rdx
	movq %rsi, %rcx
	movl $1024, %r8d
	callq standard__web__w_readline__3__WEB_STREAME1_ptr1__byteE1_ptr1__intE1__ret_intE1
	testl %eax, %eax
	js .LB25285
.LB25286:
	testl %eax, %eax
	je .LB25291
.LB25292:
	leaq -7224(%rbp), %rcx
	leaq -7386(%rbp), %rdx
	movl $1953394531, -7386(%rbp)
	movl $762605157, -7382(%rbp)
	movl $1735288172, -7378(%rbp)
	movl $3827828, -7374(%rbp)
	callq standard__web__w_starts__2__byteE1_ptr1__byteE1_ptr1__ret_boolE1
	testb %al, %al
	jne .LB25314
.LB25315:
.LB25316:
	leaq -7224(%rbp), %rcx
	leaq -7405(%rbp), %rdx
	movl $1851880052, -7405(%rbp)
	movl $1919247987, -7401(%rbp)
	movl $1668179245, -7397(%rbp)
	movl $1852400751, -7393(%rbp)
	movw $14951, -7389(%rbp)
	movb $0, -7387(%rbp)
	callq standard__web__w_starts__2__byteE1_ptr1__byteE1_ptr1__ret_boolE1
	testb %al, %al
	jne .LB25342
.LB25343:
.LB25344:
	jmp .LB25276
.LB25089:
	leaq -6200(%rbp), %rcx
	leaq -7312(%rbp), %r9
	leaq -7244(%rbp), %rdx
	movl $1919251285, -7312(%rbp)
	movl $1701265709, -7308(%rbp)
	movl $540701806, -7304(%rbp)
	movl $1262830665, -7300(%rbp)
	movl $658753, -7296(%rbp)
	movl $6144, %r8d
	callq standard__web__w_cat__4__byteE1_ptr1__intE1_ptr1__intE1__byteE1_ptr1__ret_voidE1
	jmp .LB25048
.LB25046:
	leaq -6200(%rbp), %rcx
	leaq -7332(%rbp), %r9
	leaq -7244(%rbp), %rdx
	movl $1919251285, -7332(%rbp)
	movl $1701265709, -7328(%rbp)
	movl $540701806, -7324(%rbp)
	movl $1262830665, -7320(%rbp)
	movl $658753, -7316(%rbp)
	movl $6144, %r8d
	callq standard__web__w_cat__4__byteE1_ptr1__intE1_ptr1__intE1__byteE1_ptr1__ret_voidE1
	jmp .LB25048
.LB25120:
	leaq -6200(%rbp), %rcx
	leaq -7244(%rbp), %rdx
	movl $6144, %r8d
	movq %r12, %r9
	callq standard__web__w_cat__4__byteE1_ptr1__intE1_ptr1__intE1__byteE1_ptr1__ret_voidE1
	testl %r13d, %r13d
	jle .LB25127
.LB25163:
	leaq -6200(%rbp), %rcx
	leaq -7364(%rbp), %r9
	leaq -7244(%rbp), %rdx
	movl $1953394499, -7364(%rbp)
	movl $762605157, -7360(%rbp)
	movl $1735288140, -7356(%rbp)
	movl $540698740, -7352(%rbp)
	movb $0, -7348(%rbp)
	movl $6144, %r8d
	callq standard__web__w_cat__4__byteE1_ptr1__intE1_ptr1__intE1__byteE1_ptr1__ret_voidE1
	testl %r13d, %r13d
	je .LB25189
.LB25190:
	xorl %eax, %eax
.LB25191:
	movq %rax, %rcx
	movq %r13, %rax
.LB25194:
	testl %eax, %eax
	jle .LB25196
.LB25195:
	movslq %eax, %rdx
	movabsq $3435973837, %rdi
	imulq %rdx, %rdi
	sarq $35, %rdi
	shrq $63, %rdx
	addl %edi, %edx
	imull $10, %edx, %edi
	subl %edi, %eax
	addl $48, %eax
	movslq %ecx, %rdi
	movb %al, -7240(%rbp,%rdi,1)
	incl %ecx
	movq %rdx, %rax
	testl %eax, %eax
	jg .LB25195
	jmp .LB25196
.LB25189:
	movb $48, -7240(%rbp)
	movl $1, %eax
	jmp .LB25191
.LB25196:
.LB25209:
	testl %ecx, %ecx
	jle .LB25211
.LB25210:
	decl %ecx
	movslq %ecx, %rax
	movzbl -7240(%rbp,%rax,1), %eax
	movl -7244(%rbp), %edx
	movslq %edx, %rdi
	incl %edx
	movb %al, -6200(%rbp,%rdi,1)
	movl %edx, -7244(%rbp)
	testl %ecx, %ecx
	jg .LB25210
.LB25211:
	leaq -6200(%rbp), %rcx
	leaq -7367(%rbp), %r9
	leaq -7244(%rbp), %rdx
	movslq -7244(%rbp), %rax
	movl $6144, %r8d
	movb $0, -6200(%rbp,%rax,1)
	movw $2573, -7367(%rbp)
	movb $0, -7365(%rbp)
	callq standard__web__w_cat__4__byteE1_ptr1__intE1_ptr1__intE1__byteE1_ptr1__ret_voidE1
	jmp .LB25165
.LB25250:
	movq %rsi, %rcx
	movq -7424(%rbp), %rdx
	movq %r13, %r8
	callq standard__web__web_send_all__3__WEB_STREAME1_ptr1__byteE1_ptr1__intE1__ret_boolE1
	testb %al, %al
	je .LB25259
	jmp .LB25252
.LB25314:
	leaq -7209(%rbp), %rcx
	callq standard__web__w_atoi__1__byteE1_ptr1__ret_intE1
	movl %eax, %edi
	jmp .LB25316
.LB25342:
	leaq -7224(%rbp), %rcx
	movl $1853188195, -7413(%rbp)
	movl $6579563, -7409(%rbp)
	leaq -7413(%rbp), %rdx
	callq standard__web__w_contains__2__byteE1_ptr1__byteE1_ptr1__ret_boolE1
	movzbl %al, %eax
	movl $1, %ecx
	testb %al, %al
	cmovne %ecx, %ebx
	jmp .LB25344
.LB25291:
	testl %ebx, %ebx
	jne .LB25362
.LB25363:
	testl %edi, %edi
	jns .LB25435
.LB25436:
	xorl %edi, %edi
.LB25470:
	movq %rsi, %rcx
	callq standard__web__w_getc__1__WEB_STREAME1_ptr1__ret_intE1
	testl %eax, %eax
	js .LB25478
.LB25479:
	cmpl %r15d, %edi
	jl .LB25484
.LB25485:
.LB25486:
	jmp .LB25470
.LB25484:
	movslq %edi, %rcx
	movb %al, (%r14,%rcx,1)
	incl %edi
	jmp .LB25486
.LB25478:
	movl %edi, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB25435:
	xorl %ebx, %ebx
	xorl %r12d, %r12d
.LB25438:
	cmpl %edi, %r12d
	jge .LB25441
.LB25439:
	movq %rsi, %rcx
	callq standard__web__w_getc__1__WEB_STREAME1_ptr1__ret_intE1
	testl %eax, %eax
	js .LB25450
.LB25451:
	cmpl %r15d, %ebx
	jl .LB25457
.LB25458:
.LB25459:
	incl %r12d
	cmpl %edi, %r12d
	jl .LB25439
.LB25441:
	movl %ebx, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB25457:
	movslq %ebx, %rcx
	movb %al, (%r14,%rcx,1)
	incl %ebx
	jmp .LB25459
.LB25450:
	movabsq $4294967295, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB25362:
	xorl %edi, %edi
	xorl %ebx, %ebx
.LB25365:
	leaq -7224(%rbp), %rdx
	movq %rsi, %rcx
	movl $1024, %r8d
	callq standard__web__w_readline__3__WEB_STREAME1_ptr1__byteE1_ptr1__intE1__ret_intE1
	testl %eax, %eax
	js .LB25374
.LB25375:
	leaq -7224(%rbp), %rcx
	callq standard__web__w_hexval__1__byteE1_ptr1__ret_intE1
	movl %eax, %r12d
	testl %r12d, %r12d
	je .LB25385
.LB25383:
	movq %rbx, %r13
	xorl %ebx, %ebx
.LB25397:
	cmpl %r12d, %ebx
	jge .LB25400
.LB25398:
	movq %rsi, %rcx
	callq standard__web__w_getc__1__WEB_STREAME1_ptr1__ret_intE1
	testl %eax, %eax
	js .LB25409
.LB25410:
	cmpl %r15d, %edi
	jl .LB25416
.LB25417:
.LB25418:
	incl %ebx
	movq %rax, %r13
	cmpl %r12d, %ebx
	jl .LB25398
.LB25400:
	leaq -7224(%rbp), %rdx
	movq %rsi, %rcx
	movl $1024, %r8d
	callq standard__web__w_readline__3__WEB_STREAME1_ptr1__byteE1_ptr1__intE1__ret_intE1
	movq %r13, %rbx
	jmp .LB25365
.LB25416:
	movslq %edi, %rcx
	movb %al, (%r14,%rcx,1)
	incl %edi
	jmp .LB25418
.LB25409:
	movabsq $4294967295, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB25385:
	leaq -7224(%rbp), %rdx
	movq %rsi, %rcx
	movl $1024, %r8d
	callq standard__web__w_readline__3__WEB_STREAME1_ptr1__byteE1_ptr1__intE1__ret_intE1
	testl %eax, %eax
	jg .LB25385
.LB25394:
	movl %edi, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB25374:
	movabsq $4294967295, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB25285:
	movabsq $4294967295, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB25268:
	movabsq $4294967295, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB25259:
	movabsq $4294967295, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB25244:
	movabsq $4294967295, %rax
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
	.globl standard__web__w_b64__3__byteE1_ptr1__intE1__byteE1_ptr1__ret_intE1
	.def standard__web__w_b64__3__byteE1_ptr1__intE1__byteE1_ptr1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__web__w_b64__3__byteE1_ptr1__intE1__byteE1_ptr1__ret_intE1:
	subq $96, %rsp
	movq %rbx, 80(%rsp)
	movq %rsi, 72(%rsp)
	movq %rdi, 64(%rsp)
.LB25495:
	movl $1145258561, -1(%rsp)
	movl $1212630597, 3(%rsp)
	movl $1280002633, 7(%rsp)
	movl $1347374669, 11(%rsp)
	movl $1414746705, 15(%rsp)
	movl $1482118741, 19(%rsp)
	movl $1650547289, 23(%rsp)
	movl $1717920867, 27(%rsp)
	movl $1785292903, 31(%rsp)
	movl $1852664939, 35(%rsp)
	movl $1920036975, 39(%rsp)
	movl $1987409011, 43(%rsp)
	movl $2054781047, 47(%rsp)
	movl $858927408, 51(%rsp)
	movl $926299444, 55(%rsp)
	movl $791361848, 59(%rsp)
	movb $0, 63(%rsp)
	xorl %eax, %eax
	xorl %esi, %esi
.LB25570:
	leal 2(%rax), %edi
	cmpl %edx, %edi
	jge .LB25572
.LB25571:
	movslq %eax, %r9
	movslq %edi, %rdi
	movzbl (%rcx,%r9,1), %r9d
	shll $16, %r9d
	leal 1(%rax), %ebx
	movslq %ebx, %rbx
	movzbl (%rcx,%rbx,1), %ebx
	movzbl (%rcx,%rdi,1), %edi
	movzbl %bl, %ebx
	movzbl %dil, %edi
	shll $8, %ebx
	orl %ebx, %r9d
	movslq %esi, %rbx
	orl %edi, %r9d
	movl %r9d, %edi
	sarl $18, %edi
	andl $63, %edi
	movslq %edi, %rdi
	movzbl -1(%rsp,%rdi,1), %edi
	movb %dil, (%r8,%rbx,1)
	movl %r9d, %edi
	sarl $12, %edi
	andl $63, %edi
	leal 1(%rsi), %ebx
	movslq %edi, %rdi
	movslq %ebx, %rbx
	movzbl -1(%rsp,%rdi,1), %edi
	movb %dil, (%r8,%rbx,1)
	movl %r9d, %edi
	sarl $6, %edi
	andl $63, %edi
	leal 2(%rsi), %ebx
	andl $63, %r9d
	movslq %edi, %rdi
	movslq %ebx, %rbx
	movzbl -1(%rsp,%rdi,1), %edi
	movb %dil, (%r8,%rbx,1)
	movslq %r9d, %rdi
	leal 3(%rsi), %r9d
	addl $3, %eax
	movzbl -1(%rsp,%rdi,1), %edi
	movslq %r9d, %r9
	addl $4, %esi
	movb %dil, (%r8,%r9,1)
	jmp .LB25570
.LB25572:
	movl %edx, %edi
	subl %eax, %edi
	cmpl $1, %edi
	je .LB25644
.LB25645:
.LB25646:
	subl %eax, %edx
	cmpl $2, %edx
	je .LB25688
.LB25689:
	movq %rsi, %rax
	movslq %eax, %rcx
	movb $0, (%r8,%rcx,1)
	movq 80(%rsp), %rbx
	movq 72(%rsp), %rsi
	movq 64(%rsp), %rdi
	addq $96, %rsp
	ret
.LB25644:
	movslq %eax, %rdi
	movslq %esi, %rbx
	movzbl (%rcx,%rdi,1), %edi
	shll $16, %edi
	movl %edi, %r9d
	sarl $18, %r9d
	andl $63, %r9d
	sarl $12, %edi
	movslq %r9d, %r9
	andl $63, %edi
	movzbl -1(%rsp,%r9,1), %r9d
	movslq %edi, %rdi
	movb %r9b, (%r8,%rbx,1)
	movzbl -1(%rsp,%rdi,1), %edi
	leal 1(%rsi), %r9d
	movslq %r9d, %r9
	movb %dil, (%r8,%r9,1)
	leal 2(%rsi), %edi
	movslq %edi, %rdi
	movb $61, (%r8,%rdi,1)
	leal 3(%rsi), %edi
	addl $4, %esi
	movslq %edi, %rdi
	movb $61, (%r8,%rdi,1)
	jmp .LB25646
.LB25688:
	movslq %eax, %rdx
	movzbl (%rcx,%rdx,1), %edx
	shll $16, %edx
	incl %eax
	movslq %eax, %rax
	movzbl (%rcx,%rax,1), %eax
	movslq %esi, %rcx
	movzbl %al, %eax
	shll $8, %eax
	orl %eax, %edx
	movl %edx, %eax
	sarl $18, %eax
	andl $63, %eax
	movslq %eax, %rax
	movzbl -1(%rsp,%rax,1), %eax
	movb %al, (%r8,%rcx,1)
	movl %edx, %eax
	sarl $12, %eax
	andl $63, %eax
	leal 1(%rsi), %ecx
	sarl $6, %edx
	movslq %eax, %rax
	movslq %ecx, %rcx
	andl $63, %edx
	movzbl -1(%rsp,%rax,1), %eax
	movb %al, (%r8,%rcx,1)
	movslq %edx, %rax
	leal 2(%rsi), %ecx
	movzbl -1(%rsp,%rax,1), %eax
	movslq %ecx, %rcx
	movb %al, (%r8,%rcx,1)
	leal 3(%rsi), %eax
	movslq %eax, %rax
	movb $61, (%r8,%rax,1)
	leal 4(%rsi), %eax
	movslq %eax, %rcx
	movb $0, (%r8,%rcx,1)
	movq 80(%rsp), %rbx
	movq 72(%rsp), %rsi
	movq 64(%rsp), %rdi
	addq $96, %rsp
	ret
	.text
	.globl standard__web__ws_handshake__4__WEB_STREAME1_ptr1__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__ret_boolE1
	.def standard__web__ws_handshake__4__WEB_STREAME1_ptr1__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__web__ws_handshake__4__WEB_STREAME1_ptr1__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	movl $7648, %eax
	callq __chkstk
	subq %rax, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
.LB25746:
	leaq -6184(%rbp), %rax
	movq %rcx, %rsi
	movq %rdx, %rbx
	movq %r8, %r12
	movq %r9, %r13
	movl $6144, %ecx
	movq %rax, %rdi
	xorl %eax, %eax
	rep stosb
	leaq -7208(%rbp), %rax
	movq %rax, %rdi
	xorl %eax, %eax
	movl $1024, %ecx
	rep stosb
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -7224(%rbp)
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -7264(%rbp)
	movq .LZERO+32(%rip), %r10
	movq %r10, -7232(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -7304(%rbp)
	movq .LZERO+32(%rip), %r10
	movq %r10, -7272(%rbp)
	vzeroupper
	leaq -7384(%rbp), %rax
	movq %rax, %rdi
	xorl %eax, %eax
	movl $80, %ecx
	rep stosb
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -7404(%rbp)
	movl .LZERO+16(%rip), %r10d
	movl %r10d, -7388(%rbp)
	movl $0, -7408(%rbp)
	movl $0, -7412(%rbp)
	leaq -7224(%rbp), %rcx
	movl $16, %edx
	callq standard__crypto__CSPRNG__random_bytes__2__byteE1_ptr1__intE1__ret_boolE1
	testb %al, %al
	je .LB25772
.LB25773:
	leaq -7224(%rbp), %rcx
	leaq -7264(%rbp), %r8
	movl $16, %edx
	callq standard__web__w_b64__3__byteE1_ptr1__intE1__byteE1_ptr1__ret_intE1
	leaq -6184(%rbp), %rcx
	leaq -7417(%rbp), %r9
	leaq -7408(%rbp), %rdx
	movl %eax, %edi
	movl $542393671, -7417(%rbp)
	movb $0, -7413(%rbp)
	movl $6144, %r8d
	callq standard__web__w_cat__4__byteE1_ptr1__intE1_ptr1__intE1__byteE1_ptr1__ret_voidE1
	leaq -6184(%rbp), %rcx
	leaq -7408(%rbp), %rdx
	movl $6144, %r8d
	movq %r12, %r9
	callq standard__web__w_cat__4__byteE1_ptr1__intE1_ptr1__intE1__byteE1_ptr1__ret_voidE1
	leaq -6184(%rbp), %rcx
	leaq -7435(%rbp), %r9
	leaq -7408(%rbp), %rdx
	movl $1414809632, -7435(%rbp)
	movl $774975312, -7431(%rbp)
	movl $1208618289, -7427(%rbp)
	movl $980710255, -7423(%rbp)
	movw $32, -7419(%rbp)
	movl $6144, %r8d
	callq standard__web__w_cat__4__byteE1_ptr1__intE1_ptr1__intE1__byteE1_ptr1__ret_voidE1
	leaq -6184(%rbp), %rcx
	leaq -7408(%rbp), %rdx
	movl $6144, %r8d
	movq %rbx, %r9
	callq standard__web__w_cat__4__byteE1_ptr1__intE1_ptr1__intE1__byteE1_ptr1__ret_voidE1
	leaq -6184(%rbp), %rcx
	leaq -7525(%rbp), %r9
	leaq -7408(%rbp), %rdx
	movl $1884621325, -7525(%rbp)
	movl $1684107879, -7521(%rbp)
	movl $1998600805, -7517(%rbp)
	movl $1869832805, -7513(%rbp)
	movl $1952803683, -7509(%rbp)
	movl $1866664461, -7505(%rbp)
	movl $1667591790, -7501(%rbp)
	movl $1852795252, -7497(%rbp)
	movl $1884627002, -7493(%rbp)
	movl $1684107879, -7489(%rbp)
	movl $1393167717, -7485(%rbp)
	movl $1462592357, -7481(%rbp)
	movl $1867735653, -7477(%rbp)
	movl $1952803683, -7473(%rbp)
	movl $1919243821, -7469(%rbp)
	movl $1852795251, -7465(%rbp)
	movl $858857530, -7461(%rbp)
	movl $1699940877, -7457(%rbp)
	movl $1700212067, -7453(%rbp)
	movl $1668240226, -7449(%rbp)
	movl $762602859, -7445(%rbp)
	movl $981034315, -7441(%rbp)
	movw $32, -7437(%rbp)
	movl $6144, %r8d
	callq standard__web__w_cat__4__byteE1_ptr1__intE1_ptr1__intE1__byteE1_ptr1__ret_voidE1
	leaq -6184(%rbp), %rcx
	leaq -7264(%rbp), %r9
	leaq -7408(%rbp), %rdx
	movl $6144, %r8d
	callq standard__web__w_cat__4__byteE1_ptr1__intE1_ptr1__intE1__byteE1_ptr1__ret_voidE1
	leaq -6184(%rbp), %rcx
	leaq -7528(%rbp), %r9
	leaq -7408(%rbp), %rdx
	movw $2573, -7528(%rbp)
	movb $0, -7526(%rbp)
	movl $6144, %r8d
	callq standard__web__w_cat__4__byteE1_ptr1__intE1_ptr1__intE1__byteE1_ptr1__ret_voidE1
	testq %r13, %r13
	jne .LB25918
.LB25920:
	leaq -6184(%rbp), %rcx
	leaq -7531(%rbp), %r9
	leaq -7408(%rbp), %rdx
	movw $2573, -7531(%rbp)
	movb $0, -7529(%rbp)
	movl $6144, %r8d
	callq standard__web__w_cat__4__byteE1_ptr1__intE1_ptr1__intE1__byteE1_ptr1__ret_voidE1
	leaq -6184(%rbp), %rdx
	movl -7408(%rbp), %r8d
	movq %rsi, %rcx
	callq standard__web__web_send_all__3__WEB_STREAME1_ptr1__byteE1_ptr1__intE1__ret_boolE1
	testb %al, %al
	je .LB25935
.LB25936:
	movslq %edi, %rax
	xorl %ecx, %ecx
	testq %rax, %rax
	cmovg %rax, %rcx
	shrq $2, %rcx
	xorl %edx, %edx
.LB32203:
	testq %rcx, %rcx
	je .LB32205
.LB32204:
	movzbl -7264(%rbp,%rdx,1), %r8d
	movb %r8b, -7384(%rbp,%rdx,1)
	movzbl -7263(%rbp,%rdx,1), %r8d
	movb %r8b, -7383(%rbp,%rdx,1)
	movzbl -7262(%rbp,%rdx,1), %r8d
	movb %r8b, -7382(%rbp,%rdx,1)
	movzbl -7261(%rbp,%rdx,1), %r8d
	movb %r8b, -7381(%rbp,%rdx,1)
	addq $4, %rdx
	decq %rcx
	jne .LB32204
	jmp .LB32205
.LB25918:
	leaq -6184(%rbp), %rcx
	leaq -7408(%rbp), %rdx
	movl $6144, %r8d
	movq %r13, %r9
	callq standard__web__w_cat__4__byteE1_ptr1__intE1_ptr1__intE1__byteE1_ptr1__ret_voidE1
	jmp .LB25920
.LB32205:
.LB25938:
	cmpq %rax, %rdx
	jge .LB25941
.LB25939:
	movzbl -7264(%rbp,%rdx,1), %ecx
	movb %cl, -7384(%rbp,%rdx,1)
	incq %rdx
	cmpq %rax, %rdx
	jl .LB25939
.LB25941:
	movl $9, %eax
	xorl %ebx, %ebx
.LB32206:
	testl %eax, %eax
	je .LB32208
.LB32207:
	leaq standard__web__WS_GUID(%rip), %rcx
	movslq %ebx, %rdx
	movzbl (%rcx,%rdx,1), %ecx
	leal (%rdi,%rbx), %edx
	movslq %edx, %rdx
	movb %cl, -7384(%rbp,%rdx,1)
	leal 1(%rbx), %ecx
	leaq standard__web__WS_GUID(%rip), %rdx
	movslq %ecx, %r8
	movzbl (%rdx,%r8,1), %edx
	addl %edi, %ecx
	movslq %ecx, %rcx
	movb %dl, -7384(%rbp,%rcx,1)
	leal 2(%rbx), %ecx
	leaq standard__web__WS_GUID(%rip), %rdx
	movslq %ecx, %r8
	movzbl (%rdx,%r8,1), %edx
	addl %edi, %ecx
	movslq %ecx, %rcx
	movb %dl, -7384(%rbp,%rcx,1)
	leal 3(%rbx), %ecx
	leaq standard__web__WS_GUID(%rip), %rdx
	movslq %ecx, %r8
	movzbl (%rdx,%r8,1), %edx
	addl %edi, %ecx
	movslq %ecx, %rcx
	movb %dl, -7384(%rbp,%rcx,1)
	addl $4, %ebx
	decl %eax
	jne .LB32207
.LB32208:
.LB25952:
	cmpl $36, %ebx
	jge .LB25955
.LB25953:
	leaq standard__web__WS_GUID(%rip), %rax
	movslq %ebx, %rcx
	movzbl (%rax,%rcx,1), %eax
	leal (%rdi,%rbx), %ecx
	movslq %ecx, %rcx
	movb %al, -7384(%rbp,%rcx,1)
	incl %ebx
	cmpl $36, %ebx
	jl .LB25953
.LB25955:
	leaq -7384(%rbp), %rcx
	leal 36(%rdi), %edx
	leaq -7404(%rbp), %r8
	callq standard__crypto__hashing__SHA1__sha1__3__byteE1_ptr1__intE1__byteE1_ptr1__ret_voidE1
	leaq -7404(%rbp), %rcx
	leaq -7304(%rbp), %r8
	movl $20, %edx
	callq standard__web__w_b64__3__byteE1_ptr1__intE1__byteE1_ptr1__ret_intE1
	movl $0, -7412(%rbp)
	movb $0, 4124(%rsi)
	leaq -7208(%rbp), %rdx
	movq %rsi, %rcx
	movl $1024, %r8d
	callq standard__web__w_readline__3__WEB_STREAME1_ptr1__byteE1_ptr1__intE1__ret_intE1
	movl %eax, %edi
	leaq 4124(%rsi), %rcx
	leaq -7208(%rbp), %r9
	leaq -7412(%rbp), %rdx
	movl $1000, %r8d
	callq standard__web__w_cat__4__byteE1_ptr1__intE1_ptr1__intE1__byteE1_ptr1__ret_voidE1
	cmpl $12, %edi
	jl .LB25988
.LB25989:
	leaq -7199(%rbp), %rcx
	callq standard__web__w_atoi__1__byteE1_ptr1__ret_intE1
	cmpl $101, %eax
	jne .LB25995
.LB25996:
	xorl %edi, %edi
	xorl %r12d, %r12d
.LB25998:
	leaq -7208(%rbp), %rdx
	movq %rsi, %rcx
	movl $1024, %r8d
	callq standard__web__w_readline__3__WEB_STREAME1_ptr1__byteE1_ptr1__intE1__ret_intE1
	testl %eax, %eax
	js .LB26007
.LB26008:
	testl %eax, %eax
	je .LB26012
.LB26013:
	leaq -7208(%rbp), %rcx
	leaq -7540(%rbp), %rdx
	movl $1919381621, -7540(%rbp)
	movl $979723361, -7536(%rbp)
	movb $0, -7532(%rbp)
	callq standard__web__w_starts__2__byteE1_ptr1__byteE1_ptr1__ret_boolE1
	testb %al, %al
	jne .LB26049
.LB26028:
	leaq -7208(%rbp), %rcx
	leaq -7554(%rbp), %rdx
	movl $761488755, -7554(%rbp)
	movl $1935828343, -7550(%rbp)
	movl $1701536623, -7546(%rbp)
	movw $116, -7542(%rbp)
	callq standard__web__w_starts__2__byteE1_ptr1__byteE1_ptr1__ret_boolE1
	testb %al, %al
	jne .LB26049
.LB26051:
	leaq -7208(%rbp), %rcx
	leaq -7565(%rbp), %rdx
	movl $1919381621, -7565(%rbp)
	movl $979723361, -7561(%rbp)
	movb $0, -7557(%rbp)
	callq standard__web__w_starts__2__byteE1_ptr1__byteE1_ptr1__ret_boolE1
	testb %al, %al
	jne .LB26076
.LB26077:
.LB26078:
	leaq -7208(%rbp), %rcx
	leaq -7597(%rbp), %rdx
	movl $761488755, -7597(%rbp)
	movl $1935828343, -7593(%rbp)
	movl $1701536623, -7589(%rbp)
	movl $1667313012, -7585(%rbp)
	movl $1953523043, -7581(%rbp)
	movw $58, -7577(%rbp)
	callq standard__web__w_starts__2__byteE1_ptr1__byteE1_ptr1__ret_boolE1
	testb %al, %al
	jne .LB26122
.LB26123:
.LB26124:
	jmp .LB25998
.LB26049:
	leaq 4124(%rsi), %rcx
	movw $124, -7556(%rbp)
	leaq -7556(%rbp), %r9
	leaq -7412(%rbp), %rdx
	movl $1000, %r8d
	callq standard__web__w_cat__4__byteE1_ptr1__intE1_ptr1__intE1__byteE1_ptr1__ret_voidE1
	leaq 4124(%rsi), %rcx
	leaq -7208(%rbp), %r9
	leaq -7412(%rbp), %rdx
	movl $1000, %r8d
	callq standard__web__w_cat__4__byteE1_ptr1__intE1_ptr1__intE1__byteE1_ptr1__ret_voidE1
	jmp .LB26051
.LB26076:
	leaq -7208(%rbp), %rcx
	leaq -7575(%rbp), %rdx
	movl $1935828343, -7575(%rbp)
	movl $1701536623, -7571(%rbp)
	movw $116, -7567(%rbp)
	callq standard__web__w_contains__2__byteE1_ptr1__byteE1_ptr1__ret_boolE1
	movzbl %al, %eax
	movl $1, %ecx
	testb %al, %al
	cmovne %ecx, %edi
	jmp .LB26078
.LB26122:
	movl $21, %ebx
.LB26125:
	movslq %ebx, %rax
	cmpb $32, -7208(%rbp,%rax,1)
	jne .LB26127
.LB26126:
	incl %ebx
	jmp .LB26125
.LB26127:
	leaq -7208(%rbp,%rax,1), %rcx
	leaq -7304(%rbp), %rdx
	callq standard__web__w_starts__2__byteE1_ptr1__byteE1_ptr1__ret_boolE1
	movzbl %al, %eax
	movl $1, %ecx
	testb %al, %al
	cmovne %ecx, %r12d
	jmp .LB26124
.LB26012:
	leaq 4124(%rsi), %rcx
	leaq -7603(%rbp), %r9
	leaq -7412(%rbp), %rdx
	movl $2036689788, -7603(%rbp)
	movw $32, -7599(%rbp)
	movl $1000, %r8d
	callq standard__web__w_cat__4__byteE1_ptr1__intE1_ptr1__intE1__byteE1_ptr1__ret_voidE1
	leaq 4124(%rsi), %rcx
	leaq -7264(%rbp), %r9
	leaq -7412(%rbp), %rdx
	movl $1000, %r8d
	callq standard__web__w_cat__4__byteE1_ptr1__intE1_ptr1__intE1__byteE1_ptr1__ret_voidE1
	leaq 4124(%rsi), %rcx
	leaq -7614(%rbp), %r9
	leaq -7412(%rbp), %rdx
	movl $1886938492, -7614(%rbp)
	movl $1702126437, -7610(%rbp)
	movw $8292, -7606(%rbp)
	movb $0, -7604(%rbp)
	movl $1000, %r8d
	callq standard__web__w_cat__4__byteE1_ptr1__intE1_ptr1__intE1__byteE1_ptr1__ret_voidE1
	leaq 4124(%rsi), %rcx
	leaq -7304(%rbp), %r9
	leaq -7412(%rbp), %rdx
	movl $1000, %r8d
	callq standard__web__w_cat__4__byteE1_ptr1__intE1_ptr1__intE1__byteE1_ptr1__ret_voidE1
	cmpl $1, %edi
	je .LB26179
.LB26180:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB26179:
	xorl %eax, %eax
	cmpl $1, %r12d
	sete %al
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB26007:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB25995:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB25988:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB25935:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB25772:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
	.text
	.globl standard__web__ws_send__4__WEB_STREAME1_ptr1__intE1__byteE1_ptr1__intE1__ret_boolE1
	.def standard__web__ws_send__4__WEB_STREAME1_ptr1__intE1__byteE1_ptr1__intE1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__web__ws_send__4__WEB_STREAME1_ptr1__intE1__byteE1_ptr1__intE1__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $1120, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
.LB26184:
	movq %rcx, %rsi
	movl %edx, %ebx
	movq %r8, %r12
	movl %r9d, %r13d
	movq .LZERO(%rip), %r10
	movq %r10, -54(%rbp)
	movl .LZERO+8(%rip), %r10d
	movl %r10d, -46(%rbp)
	movw .LZERO+12(%rip), %r10w
	movw %r10w, -42(%rbp)
	leaq -1078(%rbp), %rax
	movq %rax, %rdi
	xorl %eax, %eax
	movl $1024, %ecx
	rep stosb
	movl .LZERO(%rip), %r10d
	movl %r10d, -1082(%rbp)
	leaq -1082(%rbp), %rcx
	movl $4, %edx
	callq standard__crypto__CSPRNG__random_bytes__2__byteE1_ptr1__intE1__ret_boolE1
	testb %al, %al
	je .LB26200
.LB26201:
	movl %ebx, %eax
	orl $128, %eax
	movb %al, -54(%rbp)
	cmpl $126, %r13d
	jl .LB26209
.LB26210:
	cmpl $65536, %r13d
	jl .LB26218
.LB26219:
	movb $255, -53(%rbp)
	movq %r13, %rax
	shrq $56, %rax
	andq $255, %rax
	movb %al, -52(%rbp)
	movq %r13, %rax
	shrq $48, %rax
	andq $255, %rax
	movb %al, -51(%rbp)
	movq %r13, %rax
	shrq $40, %rax
	andq $255, %rax
	movb %al, -50(%rbp)
	movq %r13, %rax
	shrq $32, %rax
	andq $255, %rax
	movb %al, -49(%rbp)
	movq %r13, %rax
	shrq $24, %rax
	andq $255, %rax
	movb %al, -48(%rbp)
	movq %r13, %rax
	shrq $16, %rax
	andq $255, %rax
	movb %al, -47(%rbp)
	movq %r13, %rax
	shrq $8, %rax
	andq $255, %rax
	movb %al, -46(%rbp)
	movq %r13, %rax
	andq $255, %rax
	movb %al, -45(%rbp)
	movl $10, %eax
.LB26211:
	movzbl -1082(%rbp), %ecx
	movslq %eax, %rdx
	movb %cl, -54(%rbp,%rdx,1)
	movzbl -1081(%rbp), %ecx
	leal 1(%rax), %edx
	movslq %edx, %rdx
	movb %cl, -54(%rbp,%rdx,1)
	movzbl -1080(%rbp), %ecx
	leal 2(%rax), %edx
	movslq %edx, %rdx
	movb %cl, -54(%rbp,%rdx,1)
	movzbl -1079(%rbp), %ecx
	leal 3(%rax), %edx
	movslq %edx, %rdx
	movb %cl, -54(%rbp,%rdx,1)
	leal 4(%rax), %r8d
	leaq -54(%rbp), %rdx
	movq %rsi, %rcx
	callq standard__web__web_send_all__3__WEB_STREAME1_ptr1__byteE1_ptr1__intE1__ret_boolE1
	testb %al, %al
	je .LB26279
.LB26280:
	xorl %edi, %edi
.LB26282:
	cmpl %r13d, %edi
	jge .LB26284
.LB26283:
	movl %r13d, %eax
	subl %edi, %eax
	movl $1024, %ecx
	cmpl $1024, %eax
	movl %eax, %ebx
	cmovg %ecx, %ebx
	xorl %eax, %eax
	testl %ebx, %ebx
	cmovg %ebx, %eax
	shrl $2, %eax
	xorl %ecx, %ecx
.LB32209:
	testl %eax, %eax
	je .LB32211
.LB32210:
	leal (%rdi,%rcx), %edx
	movslq %edx, %r8
	andl $3, %edx
	movzbl (%r12,%r8,1), %r8d
	movslq %edx, %rdx
	movzbl -1082(%rbp,%rdx,1), %edx
	xorl %edx, %r8d
	movslq %ecx, %rdx
	movb %r8b, -1078(%rbp,%rdx,1)
	leal 1(%rcx), %edx
	leal (%rdi,%rdx), %r8d
	movslq %edx, %rdx
	movslq %r8d, %r9
	andl $3, %r8d
	movzbl (%r12,%r9,1), %r9d
	movslq %r8d, %r8
	movzbl -1082(%rbp,%r8,1), %r8d
	xorl %r8d, %r9d
	movb %r9b, -1078(%rbp,%rdx,1)
	leal 2(%rcx), %edx
	leal (%rdi,%rdx), %r8d
	movslq %edx, %rdx
	movslq %r8d, %r9
	andl $3, %r8d
	movzbl (%r12,%r9,1), %r9d
	movslq %r8d, %r8
	movzbl -1082(%rbp,%r8,1), %r8d
	xorl %r8d, %r9d
	movb %r9b, -1078(%rbp,%rdx,1)
	leal 3(%rcx), %edx
	leal (%rdi,%rdx), %r8d
	movslq %edx, %rdx
	movslq %r8d, %r9
	andl $3, %r8d
	movzbl (%r12,%r9,1), %r9d
	movslq %r8d, %r8
	movzbl -1082(%rbp,%r8,1), %r8d
	xorl %r8d, %r9d
	addl $4, %ecx
	decl %eax
	movb %r9b, -1078(%rbp,%rdx,1)
	testl %eax, %eax
	jne .LB32210
	jmp .LB32211
.LB26218:
	movb $254, -53(%rbp)
	movl %r13d, %eax
	sarl $8, %eax
	andl $255, %eax
	movb %al, -52(%rbp)
	movl %r13d, %eax
	andl $255, %eax
	movb %al, -51(%rbp)
	movl $4, %eax
	jmp .LB26211
.LB26209:
	movl %r13d, %eax
	orl $128, %eax
	movb %al, -53(%rbp)
	movl $2, %eax
	jmp .LB26211
.LB26284:
	movl $1, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB32211:
.LB26296:
	cmpl %ebx, %ecx
	jge .LB26299
.LB26297:
	leal (%rdi,%rcx), %eax
	movslq %eax, %rdx
	andl $3, %eax
	movzbl (%r12,%rdx,1), %edx
	movslq %eax, %rax
	movzbl -1082(%rbp,%rax,1), %eax
	xorl %eax, %edx
	movslq %ecx, %rax
	incl %ecx
	movb %dl, -1078(%rbp,%rax,1)
	cmpl %ebx, %ecx
	jl .LB26297
.LB26299:
	leaq -1078(%rbp), %rdx
	movq %rsi, %rcx
	movq %rbx, %r8
	callq standard__web__web_send_all__3__WEB_STREAME1_ptr1__byteE1_ptr1__intE1__ret_boolE1
	testb %al, %al
	je .LB26326
.LB26327:
	addl %ebx, %edi
	cmpl %r13d, %edi
	jl .LB26283
	jmp .LB26284
.LB26326:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB26279:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB26200:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
	.text
	.globl standard__web__ws_recv__4__WEB_STREAME1_ptr1__byteE1_ptr1__intE1__intE1_ptr1__ret_intE1
	.def standard__web__ws_recv__4__WEB_STREAME1_ptr1__byteE1_ptr1__intE1__intE1_ptr1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__web__ws_recv__4__WEB_STREAME1_ptr1__byteE1_ptr1__intE1__intE1_ptr1__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $304, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
	movq %r14, -48(%rbp)
	movq %r15, -56(%rbp)
.LB26332:
	movq %rcx, %rsi
	movq %rdx, %rbx
	movl %r8d, %r12d
	movq %r9, -224(%rbp)
	movq .LZERO(%rip), %r10
	movq %r10, -64(%rbp)
	movl .LZERO(%rip), %r10d
	movl %r10d, -68(%rbp)
	leaq -196(%rbp), %rax
	movq %rax, %rdi
	xorl %eax, %eax
	movl $128, %ecx
	rep stosb
	movq $0, -232(%rbp)
	movq $1, -240(%rbp)
	xorl %edi, %edi
	movq $0, -208(%rbp)
	movq $0, -216(%rbp)
.LB26351:
	leaq -64(%rbp), %rdx
	movq %rsi, %rcx
	movl $2, %r8d
	callq standard__web__w_readn__3__WEB_STREAME1_ptr1__byteE1_ptr1__intE1__ret_boolE1
	testb %al, %al
	je .LB26359
.LB26360:
	movzbl -64(%rbp), %eax
	sarl $7, %eax
	movl %eax, %r13d
	andl $1, %r13d
	movzbl -64(%rbp), %eax
	movl %eax, %r14d
	andl $15, %r14d
	movzbl -63(%rbp), %eax
	sarl $7, %eax
	movl %eax, %r15d
	andl $1, %r15d
	movzbl -63(%rbp), %eax
	andl $127, %eax
	cmpl $126, %eax
	je .LB26385
.LB26386:
.LB26387:
	cmpq $127, %rax
	je .LB26409
.LB26410:
	movq %rax, -248(%rbp)
.LB26411:
	testl %r15d, %r15d
	jne .LB26440
.LB26442:
	cmpl $8, %r14d
	jl .LB26455
.LB26454:
	movq -248(%rbp), %rax
	cmpq $125, %rax
	ja .LB26460
.LB26461:
	leaq -196(%rbp), %rdx
	movl -248(%rbp), %r13d
	movq %rsi, %rcx
	movq %r13, %r8
	callq standard__web__w_readn__3__WEB_STREAME1_ptr1__byteE1_ptr1__intE1__ret_boolE1
	testb %al, %al
	je .LB26471
.LB26472:
	testl %r15d, %r15d
	jne .LB26477
.LB26478:
.LB26479:
	cmpl $9, %r14d
	je .LB26502
.LB26503:
	cmpl $10, %r14d
	jne .LB26514
.LB26513:
	jmp .LB26351
.LB26385:
	leaq -64(%rbp), %rdx
	movq %rsi, %rcx
	movl $2, %r8d
	callq standard__web__w_readn__3__WEB_STREAME1_ptr1__byteE1_ptr1__intE1__ret_boolE1
	testb %al, %al
	je .LB26393
.LB26394:
	movzbl -64(%rbp), %eax
	movzbl -63(%rbp), %ecx
	movzbl %al, %eax
	movzbl %cl, %ecx
	shll $8, %eax
	orl %ecx, %eax
	cmpq $127, %rax
	jne .LB26410
.LB26409:
	leaq -64(%rbp), %rdx
	movq %rsi, %rcx
	movl $8, %r8d
	callq standard__web__w_readn__3__WEB_STREAME1_ptr1__byteE1_ptr1__intE1__ret_boolE1
	testb %al, %al
	je .LB26417
.LB26418:
	movzbl -64(%rbp), %eax
	movzbl -63(%rbp), %ecx
	movzbl %al, %eax
	movzbl %cl, %ecx
	shlq $8, %rax
	orq %rcx, %rax
	movzbl -62(%rbp), %ecx
	shlq $8, %rax
	movzbl %cl, %ecx
	orq %rcx, %rax
	movzbl -61(%rbp), %ecx
	shlq $8, %rax
	movzbl %cl, %ecx
	orq %rcx, %rax
	movzbl -60(%rbp), %ecx
	shlq $8, %rax
	movzbl %cl, %ecx
	orq %rcx, %rax
	movzbl -59(%rbp), %ecx
	shlq $8, %rax
	movzbl %cl, %ecx
	orq %rcx, %rax
	movzbl -58(%rbp), %ecx
	shlq $8, %rax
	movzbl %cl, %ecx
	orq %rcx, %rax
	movzbl -57(%rbp), %ecx
	shlq $8, %rax
	movzbl %cl, %ecx
	orq %rcx, %rax
	movl $8, %edi
	movq %rax, -248(%rbp)
	testl %r15d, %r15d
	je .LB26442
.LB26440:
	leaq -68(%rbp), %rdx
	movq %rsi, %rcx
	movl $4, %r8d
	callq standard__web__w_readn__3__WEB_STREAME1_ptr1__byteE1_ptr1__intE1__ret_boolE1
	testb %al, %al
	je .LB26448
	cmpl $8, %r14d
	jge .LB26454
.LB26455:
	movq -240(%rbp), %rax
	testl %eax, %eax
	jne .LB26551
.LB26552:
	movq -240(%rbp), %rdi
.LB26553:
	movl -248(%rbp), %r14d
	xorl %eax, %eax
	movq %rax, -256(%rbp)
	testl %r15d, %r15d
	setne %al
	movq %rax, -256(%rbp)
	movq -232(%rbp), %r15
	movq $0, -264(%rbp)
	movq -208(%rbp), %rax
	movq -216(%rbp), %r10
	movq %r10, -272(%rbp)
.LB26556:
	movq -264(%rbp), %rcx
	cmpl %r14d, %ecx
	jge .LB26559
.LB26557:
	movq %rsi, %rcx
	callq standard__web__w_getc__1__WEB_STREAME1_ptr1__ret_intE1
	testl %eax, %eax
	js .LB26569
.LB26570:
	movq -256(%rbp), %rcx
	testb %cl, %cl
	jne .LB26575
.LB26576:
.LB26577:
	cmpl %r12d, %r15d
	jl .LB26588
.LB26589:
	movl $1, %ecx
.LB26590:
	movq -264(%rbp), %rdx
	incl %edx
	movq %rdx, -264(%rbp)
	movq %rcx, -272(%rbp)
	jmp .LB26556
.LB26551:
	movq -224(%rbp), %rax
	movl %r14d, (%rax)
	xorl %edi, %edi
	jmp .LB26553
.LB26559:
	testl %r13d, %r13d
	jne .LB26602
.LB26603:
	movq %r15, -232(%rbp)
	movq %rdi, -240(%rbp)
	movq -264(%rbp), %rdi
	movq %rax, -208(%rbp)
	movq -272(%rbp), %r10
	movq %r10, -216(%rbp)
	jmp .LB26351
.LB26602:
	movq -272(%rbp), %rax
	testl %eax, %eax
	jne .LB26607
.LB26608:
	movl %r15d, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB26607:
	movabsq $4294967293, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB26575:
	movq -264(%rbp), %rcx
	andl $3, %ecx
	movslq %ecx, %rcx
	movzbl -68(%rbp,%rcx,1), %ecx
	xorl %ecx, %eax
	cmpl %r12d, %r15d
	jge .LB26589
.LB26588:
	movslq %r15d, %rcx
	movb %al, (%rbx,%rcx,1)
	incl %r15d
	movq -272(%rbp), %rcx
	jmp .LB26590
.LB26569:
	movabsq $4294967295, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB26477:
	xorl %eax, %eax
	testl %r13d, %r13d
	cmovg %r13d, %eax
	shrl $2, %eax
	xorl %ecx, %ecx
.LB32212:
	testl %eax, %eax
	je .LB32214
.LB32213:
	movl %ecx, %edi
	andl $3, %edi
	movslq %ecx, %rdx
	movzbl -196(%rbp,%rdx,1), %edx
	movslq %edi, %rdi
	movzbl -68(%rbp,%rdi,1), %edi
	xorl %edi, %edx
	movslq %ecx, %rdi
	movb %dl, -196(%rbp,%rdi,1)
	leal 1(%rcx), %edx
	movslq %edx, %rdi
	movl %edx, %r8d
	andl $3, %r8d
	movslq %edx, %rdx
	movzbl -196(%rbp,%rdi,1), %edi
	movslq %r8d, %r8
	movzbl -68(%rbp,%r8,1), %r8d
	xorl %r8d, %edi
	movb %dil, -196(%rbp,%rdx,1)
	leal 2(%rcx), %edx
	movslq %edx, %rdi
	movl %edx, %r8d
	andl $3, %r8d
	movslq %edx, %rdx
	movzbl -196(%rbp,%rdi,1), %edi
	movslq %r8d, %r8
	movzbl -68(%rbp,%r8,1), %r8d
	xorl %r8d, %edi
	movb %dil, -196(%rbp,%rdx,1)
	leal 3(%rcx), %edx
	movslq %edx, %rdi
	movl %edx, %r8d
	andl $3, %r8d
	movslq %edx, %rdx
	movzbl -196(%rbp,%rdi,1), %edi
	movslq %r8d, %r8
	movzbl -68(%rbp,%r8,1), %r8d
	xorl %r8d, %edi
	addl $4, %ecx
	decl %eax
	movb %dil, -196(%rbp,%rdx,1)
	testl %eax, %eax
	jne .LB32213
.LB32214:
.LB26480:
	cmpl %r13d, %ecx
	jge .LB26483
.LB26481:
	movl %ecx, %edx
	andl $3, %edx
	movslq %ecx, %rax
	movzbl -196(%rbp,%rax,1), %eax
	movslq %edx, %rdx
	movzbl -68(%rbp,%rdx,1), %edx
	xorl %edx, %eax
	movslq %ecx, %rdx
	incl %ecx
	movb %al, -196(%rbp,%rdx,1)
	cmpl %r13d, %ecx
	jl .LB26481
.LB26483:
	movq %rcx, %rdi
	cmpl $9, %r14d
	je .LB26502
	jmp .LB26503
.LB26514:
	cmpl $8, %r14d
	je .LB26518
.LB26519:
	movabsq $4294967295, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB26518:
	movq -224(%rbp), %rax
	movl $8, (%rax)
	movw $0, (%rbx)
	movq -248(%rbp), %rax
	cmpq $2, %rax
	jb .LB26538
.LB26531:
	cmpl $2, %r12d
	jge .LB26536
.LB26538:
	movabsq $4294967294, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB26536:
	movzbl -196(%rbp), %eax
	movb %al, (%rbx)
	movzbl -195(%rbp), %eax
	movb %al, 1(%rbx)
	jmp .LB26538
.LB26502:
	leaq -196(%rbp), %r8
	movl -248(%rbp), %r9d
	movq %rsi, %rcx
	movl $10, %edx
	callq standard__web__ws_send__4__WEB_STREAME1_ptr1__intE1__byteE1_ptr1__intE1__ret_boolE1
	jmp .LB26351
.LB26471:
	movabsq $4294967295, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB26460:
	movabsq $4294967295, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB26448:
	movabsq $4294967295, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB26417:
	movabsq $4294967295, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB26393:
	movabsq $4294967295, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB26359:
	movabsq $4294967295, %rax
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
	.globl standard__web__ws_close__2__WEB_STREAME1_ptr1__intE1__ret_voidE1
	.def standard__web__ws_close__2__WEB_STREAME1_ptr1__intE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__web__ws_close__2__WEB_STREAME1_ptr1__intE1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
.LB26613:
	movw .LZERO(%rip), %r10w
	movw %r10w, -2(%rbp)
	leaq -2(%rbp), %r8
	movl %edx, %eax
	sarl $8, %eax
	movl $2, %r9d
	andl $255, %eax
	movb %al, -2(%rbp)
	movl %edx, %eax
	andl $255, %eax
	movl $8, %edx
	movb %al, -1(%rbp)
	callq standard__web__ws_send__4__WEB_STREAME1_ptr1__intE1__byteE1_ptr1__intE1__ret_boolE1
	leave
	ret
	.text
	.globl json__JSONArray.__init__0__ret_thisE1
	.def json__JSONArray.__init__0__ret_thisE1;
	.scl 2;
	.type 32;
	.endef
json__JSONArray.__init__0__ret_thisE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
.LB27086:
	movq %rcx, %rsi
	movq $8, 16(%rsi)
	movq $0, 8(%rsi)
	movq 16(%rsi), %rax
	movq %rax, %rcx
	shlq $3, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, (%rsi)
	movq %rsi, %rax
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl json__JSONArray.__exit__0__ret_voidE1
	.def json__JSONArray.__exit__0__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
json__JSONArray.__exit__0__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
.LB27098:
	movq %rcx, %rsi
	movq (%rsi), %rax
	testq %rax, %rax
	jne .LB27105
.LB27106:
	movq -8(%rbp), %rsi
	leave
	ret
.LB27105:
	movq %rax, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movq $0, (%rsi)
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl json__JSONArray._grow__0__ret_boolE1
	.def json__JSONArray._grow__0__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
json__JSONArray._grow__0__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
.LB27113:
	movq %rcx, %rsi
	movq 16(%rsi), %rax
	movq %rax, %rdi
	shlq $1, %rdi
	movq %rdi, %rcx
	shlq $3, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, %rbx
	testq %rbx, %rbx
	je .LB27130
.LB27131:
	movq (%rsi), %rdx
	movq 16(%rsi), %rax
	movq %rax, %r8
	shlq $3, %r8
	movq %rbx, %rcx
	callq memcpy
	movq (%rsi), %rax
	movq %rax, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movq %rbx, (%rsi)
	movq %rdi, 16(%rsi)
	movl $1, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB27130:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
	.text
	.globl json__JSONArray._init_arena__1__standard__memory__allocators__stdarena__ArenaE1_ptr1__ret_voidE1
	.def json__JSONArray._init_arena__1__standard__memory__allocators__stdarena__ArenaE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
json__JSONArray._init_arena__1__standard__memory__allocators__stdarena__ArenaE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
.LB27147:
	movq %rcx, %rsi
	movq %rdx, %rcx
	movq $8, 16(%rsi)
	movq $0, 8(%rsi)
	movq 16(%rsi), %rax
	movq %rax, %rdx
	shlq $3, %rdx
	callq standard__memory__allocators__stdarena__alloc__2__ArenaE1_ptr1__dataE1_ubits64__ret_voidE1_ptr1
	movq %rax, (%rsi)
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl json__JSONArray._grow_arena__1__standard__memory__allocators__stdarena__ArenaE1_ptr1__ret_boolE1
	.def json__JSONArray._grow_arena__1__standard__memory__allocators__stdarena__ArenaE1_ptr1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
json__JSONArray._grow_arena__1__standard__memory__allocators__stdarena__ArenaE1_ptr1__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
.LB27161:
	movq %rcx, %rsi
	movq %rdx, %rcx
	movq 16(%rsi), %rax
	movq %rax, %rdi
	shlq $1, %rdi
	movq %rdi, %rdx
	shlq $3, %rdx
	callq standard__memory__allocators__stdarena__alloc__2__ArenaE1_ptr1__dataE1_ubits64__ret_voidE1_ptr1
	movq %rax, %rbx
	testq %rbx, %rbx
	je .LB27180
.LB27181:
	movq (%rsi), %rdx
	movq 16(%rsi), %rax
	movq %rax, %r8
	shlq $3, %r8
	movq %rbx, %rcx
	callq memcpy
	movq %rbx, (%rsi)
	movq %rdi, 16(%rsi)
	movl $1, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB27180:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
	.text
	.globl json__JSONArray.push_arena__2__voidE1_ptr1__standard__memory__allocators__stdarena__ArenaE1_ptr1__ret_boolE1
	.def json__JSONArray.push_arena__2__voidE1_ptr1__standard__memory__allocators__stdarena__ArenaE1_ptr1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
json__JSONArray.push_arena__2__voidE1_ptr1__standard__memory__allocators__stdarena__ArenaE1_ptr1__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB27194:
	movq %rcx, %rsi
	movq %rdx, %rdi
	movq 8(%rsi), %rax
	cmpq 16(%rsi), %rax
	jae .LB27204
.LB27203:
	movq (%rsi), %rax
	movq 8(%rsi), %rcx
	movq %rdi, (%rax,%rcx,8)
	movq 8(%rsi), %rax
	incq %rax
	movq %rax, 8(%rsi)
	movl $1, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB27204:
	movq %rsi, %rcx
	movq %r8, %rdx
	callq json__JSONArray._grow_arena__1__standard__memory__allocators__stdarena__ArenaE1_ptr1__ret_boolE1
	testb %al, %al
	jne .LB27203
.LB27211:
	xorl %eax, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
	.text
	.globl json__JSONArray.push__1__voidE1_ptr1__ret_boolE1
	.def json__JSONArray.push__1__voidE1_ptr1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
json__JSONArray.push__1__voidE1_ptr1__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB27225:
	movq %rcx, %rsi
	movq %rdx, %rdi
	movq 8(%rsi), %rax
	cmpq 16(%rsi), %rax
	jae .LB27234
.LB27233:
	movq (%rsi), %rax
	movq 8(%rsi), %rcx
	movq %rdi, (%rax,%rcx,8)
	movq 8(%rsi), %rax
	incq %rax
	movq %rax, 8(%rsi)
	movl $1, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB27234:
	movq %rsi, %rcx
	callq json__JSONArray._grow__0__ret_boolE1
	testb %al, %al
	jne .LB27233
.LB27239:
	xorl %eax, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
	.text
	.globl json__JSONArray.get__1__dataE1_ubits64__ret_voidE1_ptr1
	.def json__JSONArray.get__1__dataE1_ubits64__ret_voidE1_ptr1;
	.scl 2;
	.type 32;
	.endef
json__JSONArray.get__1__dataE1_ubits64__ret_voidE1_ptr1:
.LB27253:
	cmpq 8(%rcx), %rdx
	jae .LB27261
.LB27262:
	movq (%rcx), %rax
	movq (%rax,%rdx,8), %rax
	ret
.LB27261:
	xorl %eax, %eax
	ret
	.text
	.globl json__JSONObject.__init__0__ret_thisE1
	.def json__JSONObject.__init__0__ret_thisE1;
	.scl 2;
	.type 32;
	.endef
json__JSONObject.__init__0__ret_thisE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
.LB27272:
	movq %rcx, %rsi
	movq $8, 32(%rsi)
	movq $0, 24(%rsi)
	movq 32(%rsi), %rax
	movq %rax, %rcx
	shlq $3, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, (%rsi)
	movq 32(%rsi), %rax
	movq %rax, %rcx
	shlq $3, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, 8(%rsi)
	movq 32(%rsi), %rax
	movq %rax, %rcx
	shlq $3, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, 16(%rsi)
	movq %rsi, %rax
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl json__JSONObject.__exit__0__ret_voidE1
	.def json__JSONObject.__exit__0__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
json__JSONObject.__exit__0__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
.LB27299:
	movq %rcx, %rsi
	movq (%rsi), %rax
	testq %rax, %rax
	jne .LB27309
.LB27308:
	movq 8(%rsi), %rax
	testq %rax, %rax
	jne .LB27354
.LB27353:
	movq 16(%rsi), %rax
	testq %rax, %rax
	jne .LB27368
.LB27369:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB27309:
	movq %rax, %rdi
	xorl %ebx, %ebx
.LB27314:
	cmpq 24(%rsi), %rbx
	jae .LB27322
.LB27321:
	movslq %ebx, %rax
	movq (%rdi,%rax,8), %rax
	testq %rax, %rax
	jne .LB27332
.LB27331:
	incq %rbx
	cmpq 24(%rsi), %rbx
	jb .LB27321
.LB27322:
	movq (%rsi), %rax
	movq %rax, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movq $0, (%rsi)
	jmp .LB27308
.LB27354:
	movq %rax, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movq $0, 8(%rsi)
	jmp .LB27353
.LB27368:
	movq %rax, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movq $0, 16(%rsi)
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB27332:
	movq %rax, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	jmp .LB27331
	.text
	.globl json__JSONObject._grow__0__ret_boolE1
	.def json__JSONObject._grow__0__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
json__JSONObject._grow__0__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $80, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
.LB27376:
	movq %rcx, %rsi
	movq 32(%rsi), %rax
	movq %rax, %rdi
	shlq $1, %rdi
	movq %rdi, %rcx
	shlq $3, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, %rbx
	testq %rbx, %rbx
	je .LB27395
.LB27396:
	movq %rdi, %rcx
	shlq $3, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, %r12
	testq %r12, %r12
	je .LB27407
.LB27408:
	movq %rdi, %rcx
	shlq $3, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, %r13
	testq %r13, %r13
	je .LB27422
.LB27423:
	movq (%rsi), %rdx
	movq 32(%rsi), %rax
	movq %rax, %r8
	shlq $3, %r8
	movq %rbx, %rcx
	callq memcpy
	movq 8(%rsi), %rdx
	movq 32(%rsi), %rax
	movq %rax, %r8
	shlq $3, %r8
	movq %r12, %rcx
	callq memcpy
	movq 16(%rsi), %rdx
	movq 32(%rsi), %rax
	movq %rax, %r8
	shlq $3, %r8
	movq %r13, %rcx
	callq memcpy
	movq (%rsi), %rax
	movq %rax, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movq 8(%rsi), %rax
	movq %rax, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movq 16(%rsi), %rax
	movq %rax, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movq %rbx, (%rsi)
	movq %r12, 8(%rsi)
	movq %r13, 16(%rsi)
	movq %rdi, 32(%rsi)
	movl $1, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB27422:
	movq %rbx, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movq %r12, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB27407:
	movq %rbx, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB27395:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
	.text
	.globl json__JSONObject._init_arena__1__standard__memory__allocators__stdarena__ArenaE1_ptr1__ret_voidE1
	.def json__JSONObject._init_arena__1__standard__memory__allocators__stdarena__ArenaE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
json__JSONObject._init_arena__1__standard__memory__allocators__stdarena__ArenaE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB27470:
	movq %rcx, %rsi
	movq %rdx, %rdi
	movq $8, 32(%rsi)
	movq $0, 24(%rsi)
	movq 32(%rsi), %rax
	movq %rax, %rdx
	shlq $3, %rdx
	movq %rdi, %rcx
	callq standard__memory__allocators__stdarena__alloc__2__ArenaE1_ptr1__dataE1_ubits64__ret_voidE1_ptr1
	movq %rax, (%rsi)
	movq 32(%rsi), %rax
	movq %rax, %rdx
	shlq $3, %rdx
	movq %rdi, %rcx
	callq standard__memory__allocators__stdarena__alloc__2__ArenaE1_ptr1__dataE1_ubits64__ret_voidE1_ptr1
	movq %rax, 8(%rsi)
	movq 32(%rsi), %rax
	movq %rax, %rdx
	shlq $3, %rdx
	movq %rdi, %rcx
	callq standard__memory__allocators__stdarena__alloc__2__ArenaE1_ptr1__dataE1_ubits64__ret_voidE1_ptr1
	movq %rax, 16(%rsi)
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
	.text
	.globl json__JSONObject._grow_arena__1__standard__memory__allocators__stdarena__ArenaE1_ptr1__ret_boolE1
	.def json__JSONObject._grow_arena__1__standard__memory__allocators__stdarena__ArenaE1_ptr1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
json__JSONObject._grow_arena__1__standard__memory__allocators__stdarena__ArenaE1_ptr1__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $80, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
.LB27501:
	movq %rcx, %rsi
	movq %rdx, %rdi
	movq 32(%rsi), %rax
	movq %rax, %rbx
	shlq $1, %rbx
	movq %rbx, %rdx
	shlq $3, %rdx
	movq %rdi, %rcx
	callq standard__memory__allocators__stdarena__alloc__2__ArenaE1_ptr1__dataE1_ubits64__ret_voidE1_ptr1
	movq %rax, %r12
	testq %r12, %r12
	je .LB27522
.LB27523:
	movq %rbx, %rdx
	shlq $3, %rdx
	movq %rdi, %rcx
	callq standard__memory__allocators__stdarena__alloc__2__ArenaE1_ptr1__dataE1_ubits64__ret_voidE1_ptr1
	movq %rax, %r13
	testq %r13, %r13
	je .LB27535
.LB27536:
	movq %rbx, %rdx
	shlq $3, %rdx
	movq %rdi, %rcx
	callq standard__memory__allocators__stdarena__alloc__2__ArenaE1_ptr1__dataE1_ubits64__ret_voidE1_ptr1
	movq %rax, %rdi
	testq %rdi, %rdi
	je .LB27549
.LB27550:
	movq (%rsi), %rdx
	movq 32(%rsi), %rax
	movq %rax, %r8
	shlq $3, %r8
	movq %r12, %rcx
	callq memcpy
	movq 8(%rsi), %rdx
	movq 32(%rsi), %rax
	movq %rax, %r8
	shlq $3, %r8
	movq %r13, %rcx
	callq memcpy
	movq 16(%rsi), %rdx
	movq 32(%rsi), %rax
	movq %rax, %r8
	shlq $3, %r8
	movq %rdi, %rcx
	callq memcpy
	movq %r12, (%rsi)
	movq %r13, 8(%rsi)
	movq %rdi, 16(%rsi)
	movq %rbx, 32(%rsi)
	movl $1, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB27549:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB27535:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB27522:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
	.text
	.globl json__JSONObject.arena_set__3__byteE1_ptr1__voidE1_ptr1__standard__memory__allocators__stdarena__ArenaE1_ptr1__ret_boolE1
	.def json__JSONObject.arena_set__3__byteE1_ptr1__voidE1_ptr1__standard__memory__allocators__stdarena__ArenaE1_ptr1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
json__JSONObject.arena_set__3__byteE1_ptr1__voidE1_ptr1__standard__memory__allocators__stdarena__ArenaE1_ptr1__ret_boolE1:
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
.LB27584:
	movq %rcx, %rbx
	movq %rdx, %rsi
	movq %r9, %rdi
	movq %r8, -64(%rbp)
	movq (%rbx), %r12
	movq 8(%rbx), %rax
	movq %rsi, %rcx
	movq %rax, -72(%rbp)
	movq 16(%rbx), %r13
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %r14d
	movq 24(%rbx), %rax
	xorl %ecx, %ecx
	xorl %edx, %edx
.LB27609:
	cmpq %rax, %rcx
	jae .LB27617
.LB27616:
	movslq %ecx, %r8
	movq (%r13,%r8,8), %r8
	xorl %r9d, %r9d
	cmpq %r14, %r8
	sete %r9b
	testb %r9b, %r9b
	jne .LB27627
.LB27628:
.LB27626:
	testb %r9b, %r9b
	jne .LB27658
.LB27659:
	incq %rcx
	cmpq %rax, %rcx
	jb .LB27616
.LB27617:
	movq 24(%rbx), %rax
	cmpq 32(%rbx), %rax
	jae .LB27672
.LB27673:
	movq %r13, %r15
	movq -72(%rbp), %r13
.LB27671:
	leaq 1(%r14), %rdx
	movq %rdi, %rcx
	callq standard__memory__allocators__stdarena__alloc__2__ArenaE1_ptr1__dataE1_ubits64__ret_voidE1_ptr1
	testq %rax, %rax
	je .LB27701
.LB27702:
	movslq %r14d, %rcx
	incq %rcx
	cmpq $32, %rcx
	jge .LB32215
.LB32216:
	xorl %ecx, %ecx
.LB27703:
	cmpl %r14d, %ecx
	jg .LB27711
.LB27710:
	movslq %ecx, %rdx
	movzbl (%rsi,%rdx,1), %edi
	movb %dil, (%rax,%rdx,1)
	incl %ecx
	cmpl %r14d, %ecx
	jle .LB27710
	jmp .LB27711
.LB27672:
	movq %rbx, %rcx
	movq %rdi, %rdx
	callq json__JSONObject._grow_arena__1__standard__memory__allocators__stdarena__ArenaE1_ptr1__ret_boolE1
	testb %al, %al
	je .LB27679
.LB27680:
	movq (%rbx), %rax
	movq %rax, %r12
	movq 8(%rbx), %rax
	movq %rax, %r13
	movq 16(%rbx), %rax
	movq %rax, %r15
	jmp .LB27671
.LB32215:
	movq %rcx, %rdx
	sarq $63, %rdx
	notq %rdx
	andq %rdx, %rcx
	movq %rax, %rdi
	rep movsb
.LB27711:
	movq 24(%rbx), %rcx
	movq %rax, (%r12,%rcx,8)
	movq 24(%rbx), %rax
	movq -64(%rbp), %rcx
	movq %rcx, (%r13,%rax,8)
	movq 24(%rbx), %rax
	movq %r14, (%r15,%rax,8)
	movq 24(%rbx), %rax
	incq %rax
	movq %rax, 24(%rbx)
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
.LB27701:
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
.LB27679:
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
.LB27627:
	xorl %edx, %edx
.LB27629:
	cmpl %r14d, %edx
	jge .LB27637
.LB27636:
	movslq %ecx, %r8
	movq (%r12,%r8,8), %r8
	movslq %edx, %r15
	movzbl (%r8,%r15,1), %r8d
	movzbl (%rsi,%r15,1), %r15d
	cmpb %r15b, %r8b
	jne .LB27652
.LB27653:
	incl %edx
	cmpl %r14d, %edx
	jl .LB27636
.LB27637:
.LB27630:
	testb %r9b, %r9b
	jne .LB27658
	jmp .LB27659
.LB27652:
	xorl %r9d, %r9d
	jmp .LB27630
.LB27658:
	movq -64(%rbp), %rax
	movq -72(%rbp), %rdx
	movq %rax, (%rdx,%rcx,8)
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
	.text
	.globl json__JSONObject.set__2__byteE1_ptr1__voidE1_ptr1__ret_boolE1
	.def json__JSONObject.set__2__byteE1_ptr1__voidE1_ptr1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
json__JSONObject.set__2__byteE1_ptr1__voidE1_ptr1__ret_boolE1:
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
.LB27740:
	movq %rcx, %rbx
	movq %rdx, %rsi
	movq %r8, %r12
	movq (%rbx), %rdi
	movq 8(%rbx), %rax
	movq %rsi, %rcx
	movq %rax, -72(%rbp)
	movq 16(%rbx), %r13
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %r14d
	movq 24(%rbx), %rax
	xorl %ecx, %ecx
	xorl %edx, %edx
.LB27764:
	cmpq %rax, %rcx
	jae .LB27772
.LB27771:
	movslq %ecx, %r8
	movq (%r13,%r8,8), %r8
	xorl %r9d, %r9d
	cmpq %r14, %r8
	sete %r9b
	testb %r9b, %r9b
	jne .LB27782
.LB27783:
.LB27781:
	testb %r9b, %r9b
	jne .LB27813
.LB27814:
	incq %rcx
	cmpq %rax, %rcx
	jb .LB27771
.LB27772:
	movq 24(%rbx), %rax
	cmpq 32(%rbx), %rax
	jae .LB27827
.LB27828:
	movq -72(%rbp), %r15
	movq %r13, -64(%rbp)
	movq %rdi, %r13
.LB27826:
	leaq 1(%r14), %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	testq %rax, %rax
	je .LB27853
.LB27854:
	movslq %r14d, %rcx
	incq %rcx
	cmpq $32, %rcx
	jge .LB32217
.LB32218:
	xorl %ecx, %ecx
.LB27855:
	cmpl %r14d, %ecx
	jg .LB27863
.LB27862:
	movslq %ecx, %rdx
	movzbl (%rsi,%rdx,1), %edi
	movb %dil, (%rax,%rdx,1)
	incl %ecx
	cmpl %r14d, %ecx
	jle .LB27862
	jmp .LB27863
.LB27827:
	movq %rbx, %rcx
	callq json__JSONObject._grow__0__ret_boolE1
	testb %al, %al
	je .LB27832
.LB27833:
	movq (%rbx), %rax
	movq %rax, %r13
	movq 8(%rbx), %rax
	movq %rax, %r15
	movq 16(%rbx), %rax
	movq %rax, -64(%rbp)
	jmp .LB27826
.LB32217:
	movq %rcx, %rdx
	sarq $63, %rdx
	notq %rdx
	andq %rdx, %rcx
	movq %rax, %rdi
	rep movsb
.LB27863:
	movq 24(%rbx), %rcx
	movq %rax, (%r13,%rcx,8)
	movq 24(%rbx), %rax
	movq %r12, (%r15,%rax,8)
	movq 24(%rbx), %rax
	movq -64(%rbp), %rcx
	movq %r14, (%rcx,%rax,8)
	movq 24(%rbx), %rax
	incq %rax
	movq %rax, 24(%rbx)
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
.LB27853:
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
.LB27832:
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
.LB27782:
	xorl %edx, %edx
.LB27784:
	cmpl %r14d, %edx
	jge .LB27792
.LB27791:
	movslq %ecx, %r8
	movq (%rdi,%r8,8), %r8
	movslq %edx, %r15
	movzbl (%r8,%r15,1), %r8d
	movzbl (%rsi,%r15,1), %r15d
	cmpb %r15b, %r8b
	jne .LB27807
.LB27808:
	incl %edx
	cmpl %r14d, %edx
	jl .LB27791
.LB27792:
.LB27785:
	testb %r9b, %r9b
	jne .LB27813
	jmp .LB27814
.LB27807:
	xorl %r9d, %r9d
	jmp .LB27785
.LB27813:
	movq -72(%rbp), %rax
	movq %r12, (%rax,%rcx,8)
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
	.text
	.globl json__JSONObject.get__1__byteE1_ptr1__ret_voidE1_ptr1
	.def json__JSONObject.get__1__byteE1_ptr1__ret_voidE1_ptr1;
	.scl 2;
	.type 32;
	.endef
json__JSONObject.get__1__byteE1_ptr1__ret_voidE1_ptr1:
	pushq %rbp
	movq %rsp, %rbp
	subq $80, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
	movq %r14, -48(%rbp)
.LB27892:
	movq %rcx, %rsi
	movq %rdx, %rdi
	movq (%rsi), %rbx
	movq 8(%rsi), %r12
	movq 16(%rsi), %r13
	movq %rdi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movq 24(%rsi), %rcx
	xorl %edx, %edx
	xorl %esi, %esi
.LB27914:
	cmpq %rcx, %rdx
	jae .LB27922
.LB27921:
	movslq %edx, %r8
	movq (%r13,%r8,8), %r8
	xorl %r9d, %r9d
	cmpq %rax, %r8
	sete %r9b
	testb %r9b, %r9b
	jne .LB27932
.LB27933:
.LB27931:
	testb %r9b, %r9b
	jne .LB27963
.LB27964:
	incq %rdx
	cmpq %rcx, %rdx
	jb .LB27921
.LB27922:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	leave
	ret
.LB27932:
	xorl %esi, %esi
.LB27934:
	cmpl %eax, %esi
	jge .LB27942
.LB27941:
	movslq %edx, %r8
	movq (%rbx,%r8,8), %r8
	movslq %esi, %r14
	movzbl (%r8,%r14,1), %r8d
	movzbl (%rdi,%r14,1), %r14d
	cmpb %r14b, %r8b
	jne .LB27957
.LB27958:
	incl %esi
	cmpl %eax, %esi
	jl .LB27941
.LB27942:
.LB27935:
	testb %r9b, %r9b
	jne .LB27963
	jmp .LB27964
.LB27957:
	xorl %r9d, %r9d
	jmp .LB27935
.LB27963:
	movslq %edx, %rax
	movq (%r12,%rax,8), %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	leave
	ret
	.text
	.globl json__JSONObject.haskey__1__byteE1_ptr1__ret_boolE1
	.def json__JSONObject.haskey__1__byteE1_ptr1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
json__JSONObject.haskey__1__byteE1_ptr1__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB27974:
	callq json__JSONObject.get__1__byteE1_ptr1__ret_voidE1_ptr1
	testq %rax, %rax
	jne .LB27982
.LB27983:
	xorl %eax, %eax
	leave
	ret
.LB27982:
	movl $1, %eax
	leave
	ret
	.text
	.globl json__JSONObject.key_at__1__dataE1_ubits64__ret_byteE1_ptr1
	.def json__JSONObject.key_at__1__dataE1_ubits64__ret_byteE1_ptr1;
	.scl 2;
	.type 32;
	.endef
json__JSONObject.key_at__1__dataE1_ubits64__ret_byteE1_ptr1:
.LB27984:
	cmpq 24(%rcx), %rdx
	jae .LB27992
.LB27993:
	movq (%rcx), %rax
	movslq %edx, %rcx
	movq (%rax,%rcx,8), %rax
	ret
.LB27992:
	xorl %eax, %eax
	ret
	.text
	.globl json__JSONObject.val_at__1__dataE1_ubits64__ret_voidE1_ptr1
	.def json__JSONObject.val_at__1__dataE1_ubits64__ret_voidE1_ptr1;
	.scl 2;
	.type 32;
	.endef
json__JSONObject.val_at__1__dataE1_ubits64__ret_voidE1_ptr1:
.LB28004:
	cmpq 24(%rcx), %rdx
	jae .LB28012
.LB28013:
	movq 8(%rcx), %rax
	movslq %edx, %rcx
	movq (%rax,%rcx,8), %rax
	ret
.LB28012:
	xorl %eax, %eax
	ret
	.text
	.globl json__JSONNode.__init__0__ret_thisE1
	.def json__JSONNode.__init__0__ret_thisE1;
	.scl 2;
	.type 32;
	.endef
json__JSONNode.__init__0__ret_thisE1:
.LB28024:
	xorps %xmm0, %xmm0
	movq %rcx, %rax
	movl json__JSON_NULL(%rip), %ecx
	cvtss2sd %xmm0, %xmm0
	movl %ecx, (%rax)
	movw $0, 4(%rax)
	movq $0, 8(%rax)
	movsd %xmm0, 16(%rax)
	movq $0, 24(%rax)
	movl $0, 32(%rax)
	ret
	.text
	.globl json__JSONNode.__exit__0__ret_voidE1
	.def json__JSONNode.__exit__0__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
json__JSONNode.__exit__0__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
.LB28037:
	movq %rcx, %rsi
	movl (%rsi), %eax
	cmpl $4, %eax
	je .LB28045
	cmpl $5, %eax
	je .LB28046
	cmpl $6, %eax
	jne .LB28048
.LB28047:
	movq 88(%rsi), %rdi
	xorl %ebx, %ebx
.LB28098:
	cmpq %rdi, %rbx
	jae .LB28105
.LB28104:
	leaq 64(%rsi), %rcx
	movq %rbx, %rdx
	callq json__JSONObject.val_at__1__dataE1_ubits64__ret_voidE1_ptr1
	testq %rax, %rax
	jne .LB28114
.LB28113:
	incq %rbx
	cmpq %rdi, %rbx
	jb .LB28104
.LB28105:
	leaq 64(%rsi), %rcx
	callq json__JSONObject.__exit__0__ret_voidE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB28114:
	movq %rax, %rcx
	callq json__node_free__1__voidE1_ptr1__ret_voidE1
	jmp .LB28113
.LB28046:
	movq 48(%rsi), %rdi
	xorl %ebx, %ebx
.LB28072:
	cmpq %rdi, %rbx
	jae .LB28079
.LB28078:
	leaq 40(%rsi), %rcx
	movq %rbx, %rdx
	callq json__JSONArray.get__1__dataE1_ubits64__ret_voidE1_ptr1
	testq %rax, %rax
	jne .LB28088
.LB28087:
	incq %rbx
	cmpq %rdi, %rbx
	jb .LB28078
.LB28079:
	leaq 40(%rsi), %rcx
	callq json__JSONArray.__exit__0__ret_voidE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB28088:
	movq %rax, %rcx
	callq json__node_free__1__voidE1_ptr1__ret_voidE1
	jmp .LB28087
.LB28045:
	cmpb $0, 5(%rsi)
	je .LB28059
.LB28051:
	movq 24(%rsi), %rax
	testq %rax, %rax
	jne .LB28060
.LB28059:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB28060:
	movq 24(%rsi), %rax
	movq %rax, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movq $0, 24(%rsi)
	jmp .LB28059
.LB28048:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
	.text
	.globl json__JSONNode.is_bool__0__ret_boolE1
	.def json__JSONNode.is_bool__0__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
json__JSONNode.is_bool__0__ret_boolE1:
.LB28120:
	movl (%rcx), %eax
	movl json__JSON_BOOL(%rip), %ecx
	cmpl %ecx, %eax
	je .LB28126
.LB28127:
	xorl %eax, %eax
	ret
.LB28126:
	movl $1, %eax
	ret
	.text
	.globl json__JSONNode.is_int__0__ret_boolE1
	.def json__JSONNode.is_int__0__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
json__JSONNode.is_int__0__ret_boolE1:
.LB28128:
	movl (%rcx), %eax
	movl json__JSON_INT(%rip), %ecx
	cmpl %ecx, %eax
	je .LB28134
.LB28135:
	xorl %eax, %eax
	ret
.LB28134:
	movl $1, %eax
	ret
	.text
	.globl json__JSONNode.is_float__0__ret_boolE1
	.def json__JSONNode.is_float__0__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
json__JSONNode.is_float__0__ret_boolE1:
.LB28136:
	movl (%rcx), %eax
	movl json__JSON_FLOAT(%rip), %ecx
	cmpl %ecx, %eax
	je .LB28142
.LB28143:
	xorl %eax, %eax
	ret
.LB28142:
	movl $1, %eax
	ret
	.text
	.globl json__JSONNode.set_null__0__ret_voidE1
	.def json__JSONNode.set_null__0__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
json__JSONNode.set_null__0__ret_voidE1:
.LB28144:
	movl json__JSON_NULL(%rip), %eax
	movl %eax, (%rcx)
	ret
	.text
	.globl json__JSONNode.set_bool__1__boolE1__ret_voidE1
	.def json__JSONNode.set_bool__1__boolE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
json__JSONNode.set_bool__1__boolE1__ret_voidE1:
.LB28147:
	movl json__JSON_BOOL(%rip), %eax
	movl %eax, (%rcx)
	movb %dl, 4(%rcx)
	ret
	.text
	.globl json__JSONNode.set_int__1__dataE1_sbits64__ret_voidE1
	.def json__JSONNode.set_int__1__dataE1_sbits64__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
json__JSONNode.set_int__1__dataE1_sbits64__ret_voidE1:
.LB28153:
	movl json__JSON_INT(%rip), %eax
	movl %eax, (%rcx)
	movq %rdx, 8(%rcx)
	ret
	.text
	.globl json__JSONNode.set_float__1__doubleE1__ret_voidE1
	.def json__JSONNode.set_float__1__doubleE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
json__JSONNode.set_float__1__doubleE1__ret_voidE1:
.LB28159:
	movaps %xmm1, %xmm0
	movl json__JSON_FLOAT(%rip), %eax
	movl %eax, (%rcx)
	movsd %xmm0, 16(%rcx)
	ret
	.text
	.globl json__JSONNode.set_string__1__byteE1_ptr1__ret_boolE1
	.def json__JSONNode.set_string__1__byteE1_ptr1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
json__JSONNode.set_string__1__byteE1_ptr1__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $80, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
.LB28165:
	movq %rcx, %rbx
	movq %rdx, %rsi
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %r12d
	leal 1(%r12), %eax
	movl %eax, %ecx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, %r13
	testq %r13, %r13
	je .LB28182
.LB28183:
	movslq %r12d, %rax
	incq %rax
	cmpq $32, %rax
	jge .LB32219
.LB32220:
	xorl %eax, %eax
.LB28184:
	cmpl %r12d, %eax
	jg .LB28191
.LB28190:
	movslq %eax, %rcx
	movzbl (%rsi,%rcx,1), %edx
	movb %dl, (%r13,%rcx,1)
	incl %eax
	cmpl %r12d, %eax
	jle .LB28190
	jmp .LB28191
.LB32219:
	movq %rax, %rcx
	sarq $63, %rcx
	notq %rcx
	andq %rax, %rcx
	movq %r13, %rdi
	rep movsb
.LB28191:
	cmpb $0, 5(%rbx)
	je .LB28211
.LB28203:
	movq 24(%rbx), %rax
	testq %rax, %rax
	jne .LB28212
.LB28211:
	movq %r13, 24(%rbx)
	movl %r12d, 32(%rbx)
	movb $1, 5(%rbx)
	movl json__JSON_STRING(%rip), %eax
	movl %eax, (%rbx)
	movl $1, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB28212:
	movq 24(%rbx), %rax
	movq %rax, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	jmp .LB28211
.LB28182:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
	.text
	.globl json__JSONNode.set_object__0__ret_voidE1
	.def json__JSONNode.set_object__0__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
json__JSONNode.set_object__0__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB28224:
	movl json__JSON_OBJECT(%rip), %eax
	movl %eax, (%rcx)
	leaq 64(%rcx), %rcx
	callq json__JSONObject.__init__0__ret_thisE1
	leave
	ret
	.text
	.globl json__JSONNode.set_array_arena__1__standard__memory__allocators__stdarena__ArenaE1_ptr1__ret_voidE1
	.def json__JSONNode.set_array_arena__1__standard__memory__allocators__stdarena__ArenaE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
json__JSONNode.set_array_arena__1__standard__memory__allocators__stdarena__ArenaE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB28229:
	movl json__JSON_ARRAY(%rip), %eax
	movl %eax, (%rcx)
	leaq 40(%rcx), %rcx
	callq json__JSONArray._init_arena__1__standard__memory__allocators__stdarena__ArenaE1_ptr1__ret_voidE1
	leave
	ret
	.text
	.globl json__JSONNode.set_object_arena__1__standard__memory__allocators__stdarena__ArenaE1_ptr1__ret_voidE1
	.def json__JSONNode.set_object_arena__1__standard__memory__allocators__stdarena__ArenaE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
json__JSONNode.set_object_arena__1__standard__memory__allocators__stdarena__ArenaE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB28236:
	movl json__JSON_OBJECT(%rip), %eax
	movl %eax, (%rcx)
	leaq 64(%rcx), %rcx
	callq json__JSONObject._init_arena__1__standard__memory__allocators__stdarena__ArenaE1_ptr1__ret_voidE1
	leave
	ret
	.text
	.globl json__JSONNode.as_bool__0__ret_boolE1
	.def json__JSONNode.as_bool__0__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
json__JSONNode.as_bool__0__ret_boolE1:
.LB28243:
	movl (%rcx), %eax
	cmpl $1, %eax
	je .LB28247
	cmpl $2, %eax
	jne .LB28249
.LB28248:
	xorl %eax, %eax
	cmpq $0, 8(%rcx)
	setne %al
	ret
.LB28247:
	movzbl 4(%rcx), %eax
	ret
.LB28249:
	xorl %eax, %eax
	ret
	.text
	.globl json__JSONNode.as_int__0__ret_dataE1_sbits64
	.def json__JSONNode.as_int__0__ret_dataE1_sbits64;
	.scl 2;
	.type 32;
	.endef
json__JSONNode.as_int__0__ret_dataE1_sbits64:
.LB28256:
	movl (%rcx), %eax
	cmpl $2, %eax
	je .LB28260
	cmpl $3, %eax
	je .LB28261
	cmpl $1, %eax
	jne .LB28263
.LB28262:
	cmpb $0, 4(%rcx)
	jne .LB28272
.LB28273:
	xorl %eax, %eax
	ret
.LB28272:
	movl $1, %eax
	ret
.LB28261:
	movsd 16(%rcx), %xmm0
	cvttsd2siq %xmm0, %rax
	ret
.LB28260:
	movq 8(%rcx), %rax
	ret
.LB28263:
	xorl %eax, %eax
	ret
	.text
	.globl json__JSONNode.as_string_view__2__byteE1_ptr2__intE1_ptr1__ret_boolE1
	.def json__JSONNode.as_string_view__2__byteE1_ptr2__intE1_ptr1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
json__JSONNode.as_string_view__2__byteE1_ptr2__intE1_ptr1__ret_boolE1:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
.LB28277:
	movl (%rcx), %eax
	movl json__JSON_STRING(%rip), %esi
	cmpl %esi, %eax
	jne .LB28285
.LB28286:
	movq 24(%rcx), %rax
	movq %rax, (%rdx)
	movl 32(%rcx), %eax
	movl %eax, (%r8)
	movl $1, %eax
	movq 0(%rsp), %rsi
	addq $16, %rsp
	ret
.LB28285:
	xorl %eax, %eax
	movq 0(%rsp), %rsi
	addq $16, %rsp
	ret
	.text
	.globl json__JSONNode.object_set_new__1__byteE1_ptr1__ret_voidE1_ptr1
	.def json__JSONNode.object_set_new__1__byteE1_ptr1__ret_voidE1_ptr1;
	.scl 2;
	.type 32;
	.endef
json__JSONNode.object_set_new__1__byteE1_ptr1__ret_voidE1_ptr1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
.LB28293:
	movq %rcx, %rsi
	movq %rdx, %rdi
	movl (%rsi), %eax
	movl json__JSON_OBJECT(%rip), %ecx
	cmpl %ecx, %eax
	jne .LB28301
.LB28302:
	movl $104, %ecx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, %rbx
	testq %rbx, %rbx
	je .LB28314
.LB28315:
	movq %rbx, %rcx
	callq json__JSONNode.__init__0__ret_thisE1
	leaq 64(%rsi), %rcx
	movq %rdi, %rdx
	movq %rbx, %r8
	callq json__JSONObject.set__2__byteE1_ptr1__voidE1_ptr1__ret_boolE1
	testb %al, %al
	je .LB28327
.LB28328:
	movq %rbx, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB28327:
	movq %rbx, %rcx
	callq json__JSONNode.__exit__0__ret_voidE1
	movq %rbx, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB28314:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB28301:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
	.text
	.globl json__JSONNode.object_get__1__byteE1_ptr1__ret_voidE1_ptr1
	.def json__JSONNode.object_get__1__byteE1_ptr1__ret_voidE1_ptr1;
	.scl 2;
	.type 32;
	.endef
json__JSONNode.object_get__1__byteE1_ptr1__ret_voidE1_ptr1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
.LB28336:
	movl (%rcx), %eax
	movl json__JSON_OBJECT(%rip), %esi
	cmpl %esi, %eax
	jne .LB28343
.LB28344:
	leaq 64(%rcx), %rcx
	callq json__JSONObject.get__1__byteE1_ptr1__ret_voidE1_ptr1
	movq -8(%rbp), %rsi
	leave
	ret
.LB28343:
	xorl %eax, %eax
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl json__JSONParser.__init__3__byteE1_ptr1__intE1__standard__memory__allocators__stdarena__ArenaE1_ptr1__ret_thisE1
	.def json__JSONParser.__init__3__byteE1_ptr1__intE1__standard__memory__allocators__stdarena__ArenaE1_ptr1__ret_thisE1;
	.scl 2;
	.type 32;
	.endef
json__JSONParser.__init__3__byteE1_ptr1__intE1__standard__memory__allocators__stdarena__ArenaE1_ptr1__ret_thisE1:
.LB28350:
	movq %rcx, %rax
	movq %rdx, (%rax)
	movl %r8d, 12(%rax)
	movq %r9, 24(%rax)
	ret
	.text
	.globl json__JSONParser.__exit__0__ret_voidE1
	.def json__JSONParser.__exit__0__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
json__JSONParser.__exit__0__ret_voidE1:
.LB28361:
	ret
	.text
	.globl json__JSONParser.ok__0__ret_boolE1
	.def json__JSONParser.ok__0__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
json__JSONParser.ok__0__ret_boolE1:
.LB28362:
	cmpl $0, 16(%rcx)
	je .LB28367
.LB28368:
	xorl %eax, %eax
	ret
.LB28367:
	movl $1, %eax
	ret
	.text
	.globl json__JSONParser._skip_ws__0__ret_voidE1
	.def json__JSONParser._skip_ws__0__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
json__JSONParser._skip_ws__0__ret_voidE1:
.LB28369:
.LB28371:
	movl 8(%rcx), %eax
	cmpl 12(%rcx), %eax
	jge .LB28380
.LB28379:
	movq (%rcx), %rdx
	movslq %eax, %rax
	movzbl (%rdx,%rax,1), %eax
	cmpb $32, %al
	je .LB28388
	cmpb $9, %al
	je .LB28388
	cmpb $10, %al
	je .LB28388
	cmpb $13, %al
	jne .LB28393
.LB28388:
	movl 8(%rcx), %eax
	incl %eax
	movl %eax, 8(%rcx)
	jmp .LB28371
.LB28380:
	ret
.LB28393:
	ret
	.text
	.globl json__JSONParser._peek__0__ret_charE1
	.def json__JSONParser._peek__0__ret_charE1;
	.scl 2;
	.type 32;
	.endef
json__JSONParser._peek__0__ret_charE1:
.LB28398:
	movl 8(%rcx), %eax
	cmpl 12(%rcx), %eax
	jge .LB28405
.LB28406:
	movq (%rcx), %rcx
	movslq %eax, %rax
	movzbl (%rcx,%rax,1), %eax
	ret
.LB28405:
	xorl %eax, %eax
	ret
	.text
	.globl json__JSONParser._adv__0__ret_charE1
	.def json__JSONParser._adv__0__ret_charE1;
	.scl 2;
	.type 32;
	.endef
json__JSONParser._adv__0__ret_charE1:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
.LB28413:
	movl 8(%rcx), %eax
	cmpl 12(%rcx), %eax
	jge .LB28421
.LB28422:
	movq (%rcx), %rax
	movl 8(%rcx), %edx
	movslq %edx, %rsi
	movzbl (%rax,%rsi,1), %eax
	incl %edx
	movl %edx, 8(%rcx)
	movzbl %al, %eax
	movq 0(%rsp), %rsi
	addq $16, %rsp
	ret
.LB28421:
	xorl %eax, %eax
	movq 0(%rsp), %rsi
	addq $16, %rsp
	ret
	.text
	.globl json__JSONParser._parse_string__1__JSONNodeE1_ptr1__ret_boolE1
	.def json__JSONParser._parse_string__1__JSONNodeE1_ptr1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
json__JSONParser._parse_string__1__JSONNodeE1_ptr1__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $80, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
.LB28434:
	movq %rcx, %rsi
	movq %rdx, %rdi
	movq %rsi, %rcx
	callq json__JSONParser._adv__0__ret_charE1
	movl 8(%rsi), %ebx
	xorl %r12d, %r12d
	xorl %r13d, %r13d
.LB28445:
	movl 8(%rsi), %eax
	cmpl 12(%rsi), %eax
	jge .LB28446
.LB28453:
	movq (%rsi), %rcx
	movslq %eax, %rdx
	movzbl (%rcx,%rdx,1), %ecx
	cmpb $34, %cl
	je .LB28446
	cmpb $92, %cl
	jne .LB28465
.LB28464:
	incl %eax
	movl %eax, 8(%rsi)
	movl $1, %r13d
.LB28462:
	movl 8(%rsi), %eax
	incl %eax
	movl %eax, 8(%rsi)
	incl %r12d
	jmp .LB28445
.LB28446:
	movq %rsi, %rcx
	callq json__JSONParser._peek__0__ret_charE1
	movzbl %al, %eax
	cmpb $34, %al
	jne .LB28479
.LB28480:
	movq %rsi, %rcx
	callq json__JSONParser._adv__0__ret_charE1
	testb %r13b, %r13b
	je .LB28486
.LB28487:
	movq 24(%rsi), %rcx
	leal 1(%r12), %eax
	movl %eax, %edx
	callq standard__memory__allocators__stdarena__alloc__2__ArenaE1_ptr1__dataE1_ubits64__ret_voidE1_ptr1
	movq %rax, %r12
	testq %r12, %r12
	je .LB28513
.LB28514:
	movl %ebx, 8(%rsi)
	xorl %ebx, %ebx
.LB28518:
	movl 8(%rsi), %eax
	cmpl 12(%rsi), %eax
	jge .LB28519
.LB28526:
	movq (%rsi), %rcx
	movslq %eax, %rdx
	movzbl (%rcx,%rdx,1), %ecx
	cmpb $34, %cl
	je .LB28519
	cmpb $92, %cl
	jne .LB28538
.LB28537:
	incl %eax
	movl %eax, 8(%rsi)
	movq (%rsi), %rcx
	movslq %eax, %rax
	movzbl (%rcx,%rax,1), %eax
	movzbl %al, %ecx
	leaq .LJT32223(%rip), %r10
	jmpq *(%r10,%rcx,8)
.LB28555:
	movslq %ebx, %rax
	movb $9, (%r12,%rax,1)
.LB28535:
	movl 8(%rsi), %eax
	incl %eax
	movl %eax, 8(%rsi)
	incl %ebx
	jmp .LB28518
.LB28519:
	movslq %ebx, %rax
	movb $0, (%r12,%rax,1)
	movq %rsi, %rcx
	callq json__JSONParser._adv__0__ret_charE1
	movq %r12, 24(%rdi)
	movl %ebx, 32(%rdi)
	movb $0, 5(%rdi)
	movl json__JSON_STRING(%rip), %eax
	movl %eax, (%rdi)
	movl $1, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB28554:
	movslq %ebx, %rax
	movb $13, (%r12,%rax,1)
	jmp .LB28535
.LB28553:
	movslq %ebx, %rax
	movb $10, (%r12,%rax,1)
	jmp .LB28535
.LB28552:
	movslq %ebx, %rax
	movb $92, (%r12,%rax,1)
	jmp .LB28535
.LB28551:
	movslq %ebx, %rax
	movb $34, (%r12,%rax,1)
	jmp .LB28535
.LB28556:
	movslq %ebx, %rcx
	movb %al, (%r12,%rcx,1)
	jmp .LB28535
.LB28538:
	movslq %ebx, %rax
	movb %cl, (%r12,%rax,1)
	jmp .LB28535
.LB28513:
	movl $2, 16(%rsi)
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB28486:
	movq (%rsi), %rax
	movslq %ebx, %rcx
	leaq (%rax,%rcx,1), %rax
	movq %rax, 24(%rdi)
	movl %r12d, 32(%rdi)
	movb $0, 5(%rdi)
	movl json__JSON_STRING(%rip), %eax
	movl %eax, (%rdi)
	movl $1, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB28479:
	movl $1, 16(%rsi)
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB28465:
	jmp .LB28462
	.section .rodata
	.p2align 3
.LJT32223:
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28551
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28552
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28553
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28554
	.quad .LB28556
	.quad .LB28555
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.quad .LB28556
	.text
	.text
	.globl json__JSONParser._parse_number__1__JSONNodeE1_ptr1__ret_boolE1
	.def json__JSONParser._parse_number__1__JSONNodeE1_ptr1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
json__JSONParser._parse_number__1__JSONNodeE1_ptr1__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $80, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
.LB28601:
	movq %rcx, %rsi
	movq %rdx, %rdi
	movq %rsi, %rcx
	callq json__JSONParser._peek__0__ret_charE1
	movzbl %al, %eax
	cmpb $45, %al
	je .LB28613
.LB28614:
	xorl %ebx, %ebx
.LB28612:
	xorl %r12d, %r12d
.LB28616:
	movl 8(%rsi), %eax
	cmpl 12(%rsi), %eax
	jge .LB28617
.LB28624:
	movq (%rsi), %rcx
	movslq %eax, %rdx
	movzbl (%rcx,%rdx,1), %ecx
	cmpb $48, %cl
	jl .LB28617
.LB28634:
	cmpb $57, %cl
	jg .LB28617
.LB28640:
	imulq $10, %r12, %r12
	subl $48, %ecx
	movsbq %cl, %rcx
	addq %rcx, %r12
	incl %eax
	movl %eax, 8(%rsi)
	jmp .LB28616
.LB28613:
	movq %rsi, %rcx
	callq json__JSONParser._adv__0__ret_charE1
	movl $1, %ebx
	jmp .LB28612
.LB28617:
	movq %rsi, %rcx
	callq json__JSONParser._peek__0__ret_charE1
	movzbl %al, %eax
	cmpb $46, %al
	je .LB28656
.LB28657:
	xorl %eax, %eax
	xorps %xmm0, %xmm0
.LB28655:
	testb %al, %al
	jne .LB28704
.LB28705:
	xorl %eax, %eax
	subq %r12, %rax
	testb %bl, %bl
	movq %r12, %rdx
	cmovne %rax, %rdx
	movq %rdi, %rcx
	callq json__JSONNode.set_int__1__dataE1_sbits64__ret_voidE1
	movl $1, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB28656:
	movabsq $1065353216, %r10
	movq %r10, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, -40(%rbp)
	xorps %xmm0, %xmm0
	cvtsi2sdq %r12, %xmm0
	movsd %xmm0, -48(%rbp)
	movq %rsi, %rcx
	callq json__JSONParser._adv__0__ret_charE1
	movsd -48(%rbp), %xmm0
	movsd -40(%rbp), %xmm1
.LB28662:
	movl 8(%rsi), %eax
	cmpl 12(%rsi), %eax
	jge .LB28663
.LB28670:
	movq (%rsi), %rcx
	movslq %eax, %rdx
	movzbl (%rcx,%rdx,1), %ecx
	cmpb $48, %cl
	jl .LB28663
.LB28680:
	cmpb $57, %cl
	jg .LB28663
.LB28686:
	movabsq $1092616192, %r10
	movq %r10, %xmm2
	subl $48, %ecx
	incl %eax
	movsbq %cl, %rcx
	movl %eax, 8(%rsi)
	cvtss2sd %xmm2, %xmm2
	mulsd %xmm2, %xmm1
	xorps %xmm2, %xmm2
	cvtsi2sdq %rcx, %xmm2
	divsd %xmm1, %xmm2
	addsd %xmm2, %xmm0
	jmp .LB28662
.LB28663:
	movl $1, %eax
	testb %al, %al
	je .LB28705
.LB28704:
	testb %bl, %bl
	jne .LB28708
.LB28709:
.LB28710:
	movq %rdi, %rcx
	movaps %xmm0, %xmm1
	callq json__JSONNode.set_float__1__doubleE1__ret_voidE1
	movl $1, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB28708:
	xorps %xmm1, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subsd %xmm15, %xmm0
	jmp .LB28710
	.text
	.globl json__JSONParser._parse_value__1__JSONNodeE1_ptr1__ret_boolE1
	.def json__JSONParser._parse_value__1__JSONNodeE1_ptr1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
json__JSONParser._parse_value__1__JSONNodeE1_ptr1__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB29218:
	movq %rcx, %rsi
	movq %rdx, %rdi
	movq %rsi, %rcx
	callq json__JSONParser._skip_ws__0__ret_voidE1
	movq %rsi, %rcx
	callq json__JSONParser._peek__0__ret_charE1
	movzbl %al, %eax
	leaq .LJT32224(%rip), %r10
	jmpq *(%r10,%rax,8)
.LB29240:
.LB29223:
	movq %rsi, %rcx
	movq %rdi, %rdx
	callq json__JSONParser._parse_number__1__JSONNodeE1_ptr1__ret_boolE1
	movzbl %al, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB29239:
	jmp .LB29223
.LB29238:
	jmp .LB29223
.LB29237:
	jmp .LB29223
.LB29236:
	jmp .LB29223
.LB29235:
	jmp .LB29223
.LB29234:
	jmp .LB29223
.LB29233:
	jmp .LB29223
.LB29232:
	jmp .LB29223
.LB29231:
	jmp .LB29223
.LB29230:
	jmp .LB29223
.LB29229:
	movl 8(%rsi), %eax
	addl $4, %eax
	movl %eax, 8(%rsi)
	movl json__JSON_NULL(%rip), %eax
	movl %eax, (%rdi)
	movl $1, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB29228:
	movl 8(%rsi), %eax
	addl $5, %eax
	movl %eax, 8(%rsi)
	movq %rdi, %rcx
	xorl %edx, %edx
	callq json__JSONNode.set_bool__1__boolE1__ret_voidE1
	movl $1, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB29227:
	movl 8(%rsi), %eax
	addl $4, %eax
	movl %eax, 8(%rsi)
	movq %rdi, %rcx
	movl $1, %edx
	callq json__JSONNode.set_bool__1__boolE1__ret_voidE1
	movl $1, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB29226:
	movq %rsi, %rcx
	movq %rdi, %rdx
	callq json__JSONParser._parse_object__1__JSONNodeE1_ptr1__ret_boolE1
	movzbl %al, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB29225:
	movq %rsi, %rcx
	movq %rdi, %rdx
	callq json__JSONParser._parse_array__1__JSONNodeE1_ptr1__ret_boolE1
	movzbl %al, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB29224:
	movq %rsi, %rcx
	movq %rdi, %rdx
	callq json__JSONParser._parse_string__1__JSONNodeE1_ptr1__ret_boolE1
	movzbl %al, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB29241:
	movl $1, 16(%rsi)
	xorl %eax, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
	.section .rodata
	.p2align 3
.LJT32224:
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29224
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29230
	.quad .LB29241
	.quad .LB29241
	.quad .LB29231
	.quad .LB29232
	.quad .LB29233
	.quad .LB29234
	.quad .LB29235
	.quad .LB29236
	.quad .LB29237
	.quad .LB29238
	.quad .LB29239
	.quad .LB29240
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29225
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29228
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29229
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29227
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29226
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.quad .LB29241
	.text
	.text
	.globl json__JSONParser._alloc_child__0__ret_JSONNodeE1_ptr1
	.def json__JSONParser._alloc_child__0__ret_JSONNodeE1_ptr1;
	.scl 2;
	.type 32;
	.endef
json__JSONParser._alloc_child__0__ret_JSONNodeE1_ptr1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
.LB28724:
	movq %rcx, %rsi
	cmpl $0, 40(%rsi)
	je .LB28731
.LB28730:
	movq 32(%rsi), %rax
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	leaq 104(%rax), %rcx
	movq %rcx, 32(%rsi)
	movl 40(%rsi), %ecx
	decl %ecx
	movl %ecx, 40(%rsi)
	movl json__JSON_NULL(%rip), %ecx
	movl %ecx, (%rax)
	movw $0, 4(%rax)
	movq $0, 8(%rax)
	movsd %xmm0, 16(%rax)
	movq $0, 24(%rax)
	movl $0, 32(%rax)
	vpxor %xmm15, %xmm15, %xmm15
	vmovdqu %ymm15, 40(%rax)
	vmovdqu %ymm15, 72(%rax)
	vzeroupper
	movq -8(%rbp), %rsi
	leave
	ret
.LB28731:
	movq 24(%rsi), %rcx
	movl $6656, %edx
	callq standard__memory__allocators__stdarena__alloc__2__ArenaE1_ptr1__dataE1_ubits64__ret_voidE1_ptr1
	movq %rax, 32(%rsi)
	testq %rax, %rax
	je .LB28749
.LB28750:
	movl $64, 40(%rsi)
	jmp .LB28730
.LB28749:
	movl $2, 16(%rsi)
	xorl %eax, %eax
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl json__JSONParser._parse_array__1__JSONNodeE1_ptr1__ret_boolE1
	.def json__JSONParser._parse_array__1__JSONNodeE1_ptr1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
json__JSONParser._parse_array__1__JSONNodeE1_ptr1__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
.LB28826:
	movq %rcx, %rsi
	movq %rdx, %rdi
	movq 24(%rsi), %rdx
	movq %rdi, %rcx
	callq json__JSONNode.set_array_arena__1__standard__memory__allocators__stdarena__ArenaE1_ptr1__ret_voidE1
	movq %rsi, %rcx
	callq json__JSONParser._adv__0__ret_charE1
	movq %rsi, %rcx
	callq json__JSONParser._skip_ws__0__ret_voidE1
	movq %rsi, %rcx
	callq json__JSONParser._peek__0__ret_charE1
	movzbl %al, %eax
	cmpb $93, %al
	je .LB28836
.LB28839:
	movl 8(%rsi), %eax
	cmpl 12(%rsi), %eax
	jge .LB28848
.LB28847:
	movq %rsi, %rcx
	callq json__JSONParser._alloc_child__0__ret_JSONNodeE1_ptr1
	movq %rax, %rbx
	testq %rbx, %rbx
	je .LB28856
.LB28857:
	leaq 40(%rdi), %rcx
	movq %rbx, %rdx
	movq 24(%rsi), %r8
	callq json__JSONArray.push_arena__2__voidE1_ptr1__standard__memory__allocators__stdarena__ArenaE1_ptr1__ret_boolE1
	testb %al, %al
	je .LB28869
.LB28870:
	movq %rsi, %rcx
	movq %rbx, %rdx
	callq json__JSONParser._parse_value__1__JSONNodeE1_ptr1__ret_boolE1
	testb %al, %al
	je .LB28877
.LB28878:
	movq %rsi, %rcx
	callq json__JSONParser._skip_ws__0__ret_voidE1
	movq %rsi, %rcx
	callq json__JSONParser._peek__0__ret_charE1
	movzbl %al, %eax
	cmpb $93, %al
	je .LB28882
.LB28883:
	movq %rsi, %rcx
	callq json__JSONParser._peek__0__ret_charE1
	movzbl %al, %eax
	cmpb $44, %al
	jne .LB28888
.LB28889:
	movq %rsi, %rcx
	callq json__JSONParser._adv__0__ret_charE1
	movq %rsi, %rcx
	callq json__JSONParser._skip_ws__0__ret_voidE1
	jmp .LB28839
.LB28848:
	movl $1, 16(%rsi)
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB28888:
	movl $1, 16(%rsi)
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB28882:
	movq %rsi, %rcx
	callq json__JSONParser._adv__0__ret_charE1
	movl $1, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB28877:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB28869:
	movl $2, 16(%rsi)
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB28856:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB28836:
	movq %rsi, %rcx
	callq json__JSONParser._adv__0__ret_charE1
	movl $1, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
	.text
	.globl json__JSONParser._parse_object__1__JSONNodeE1_ptr1__ret_boolE1
	.def json__JSONParser._parse_object__1__JSONNodeE1_ptr1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
json__JSONParser._parse_object__1__JSONNodeE1_ptr1__ret_boolE1:
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
.LB28893:
	movq %rcx, %rsi
	movq %rdx, %rdi
	movq 24(%rsi), %rdx
	movq %rdi, %rcx
	callq json__JSONNode.set_object_arena__1__standard__memory__allocators__stdarena__ArenaE1_ptr1__ret_voidE1
	movq %rsi, %rcx
	callq json__JSONParser._adv__0__ret_charE1
	movq %rsi, %rcx
	callq json__JSONParser._skip_ws__0__ret_voidE1
	movq %rsi, %rcx
	callq json__JSONParser._peek__0__ret_charE1
	movzbl %al, %eax
	cmpb $125, %al
	je .LB28913
.LB28914:
	movq $0, -72(%rbp)
	xorl %ebx, %ebx
.LB28916:
	movl 8(%rsi), %eax
	cmpl 12(%rsi), %eax
	jge .LB28925
.LB28924:
	movq %rsi, %rcx
	callq json__JSONParser._skip_ws__0__ret_voidE1
	movq %rsi, %rcx
	callq json__JSONParser._peek__0__ret_charE1
	movzbl %al, %eax
	cmpb $34, %al
	jne .LB28929
.LB28930:
	movq %rsi, %rcx
	callq json__JSONParser._adv__0__ret_charE1
	movl 8(%rsi), %r12d
	xorl %r13d, %r13d
	movq %rbx, %rax
	xorl %ebx, %ebx
.LB28935:
	movl 8(%rsi), %ecx
	cmpl 12(%rsi), %ecx
	jge .LB28944
.LB28943:
	movq (%rsi), %rax
	movslq %ecx, %rdx
	movzbl (%rax,%rdx,1), %r14d
	cmpb $34, %r14b
	je .LB28953
	cmpb $92, %r14b
	jne .LB28955
.LB28954:
	incl %ecx
	movl %ecx, 8(%rsi)
	movl $1, %r13d
.LB28952:
	movl 8(%rsi), %eax
	incl %eax
	movl %eax, 8(%rsi)
	incl %ebx
	movq %r14, %rax
	jmp .LB28935
.LB28925:
	movl $1, 16(%rsi)
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
.LB28944:
	movq %rax, %r14
.LB28936:
	movq %rsi, %rcx
	callq json__JSONParser._peek__0__ret_charE1
	movzbl %al, %eax
	cmpb $34, %al
	jne .LB28969
.LB28970:
	movq %rsi, %rcx
	callq json__JSONParser._adv__0__ret_charE1
	movq %rsi, %rcx
	callq json__JSONParser._skip_ws__0__ret_voidE1
	movq %rsi, %rcx
	callq json__JSONParser._peek__0__ret_charE1
	movzbl %al, %eax
	cmpb $58, %al
	jne .LB28976
.LB28977:
	movq %rsi, %rcx
	callq json__JSONParser._adv__0__ret_charE1
	movq %rsi, %rcx
	callq json__JSONParser._skip_ws__0__ret_voidE1
	movl 8(%rsi), %eax
	movq %rax, -64(%rbp)
	movq %rsi, %rcx
	callq json__JSONParser._alloc_child__0__ret_JSONNodeE1_ptr1
	movq %rax, %r15
	testq %r15, %r15
	je .LB28989
.LB28990:
	testb %r13b, %r13b
	je .LB28994
.LB28995:
	movq 24(%rsi), %rcx
	leal 1(%rbx), %eax
	movl %eax, %edx
	callq standard__memory__allocators__stdarena__alloc__2__ArenaE1_ptr1__dataE1_ubits64__ret_voidE1_ptr1
	testq %rax, %rax
	je .LB29011
.LB29012:
	movl %r12d, 8(%rsi)
	xorl %ebx, %ebx
.LB29016:
	movl 8(%rsi), %ecx
	cmpl 12(%rsi), %ecx
	jge .LB29025
.LB29024:
	movq (%rsi), %rdx
	movslq %ecx, %r8
	movzbl (%rdx,%r8,1), %r14d
	cmpb $34, %r14b
	je .LB29034
	cmpb $92, %r14b
	jne .LB29036
.LB29035:
	incl %ecx
	movl %ecx, 8(%rsi)
	movq (%rsi), %rdx
	movslq %ecx, %rcx
	movzbl (%rdx,%rcx,1), %ecx
	movzbl %cl, %edx
	leaq .LJT32225(%rip), %r10
	jmpq *(%r10,%rdx,8)
.LB29053:
	movslq %ebx, %rdx
	movb $9, (%rax,%rdx,1)
.LB29048:
.LB29033:
	movl 8(%rsi), %edx
	incl %edx
	movl %edx, 8(%rsi)
	incl %ebx
	movq %rcx, %r14
	jmp .LB29016
.LB28953:
	jmp .LB28936
.LB29025:
.LB29017:
	movslq %ebx, %rcx
	movb $0, (%rax,%rcx,1)
	movq -64(%rbp), %rcx
	movl %ecx, 8(%rsi)
	movq %rbx, %r12
	movq %rbx, %r13
	movq %rax, %rbx
.LB28993:
	leaq 64(%rdi), %rcx
	movq 24(%rcx), %rax
	cmpq 32(%rcx), %rax
	jae .LB29108
.LB29107:
	movq 64(%rdi), %rax
	movq 72(%rdi), %rcx
	movq 80(%rdi), %rdx
	movq 88(%rdi), %r8
	movq %rbx, (%rax,%r8,8)
	movq 88(%rdi), %rax
	movq %r15, (%rcx,%rax,8)
	movq 88(%rdi), %rax
	movq %rsi, %rcx
	movq %r12, (%rdx,%rax,8)
	movq 88(%rdi), %rax
	movq %r15, %rdx
	incq %rax
	movq %rax, 88(%rdi)
	callq json__JSONParser._parse_value__1__JSONNodeE1_ptr1__ret_boolE1
	testb %al, %al
	je .LB29202
.LB29203:
	movq %rsi, %rcx
	callq json__JSONParser._skip_ws__0__ret_voidE1
	movq %rsi, %rcx
	callq json__JSONParser._peek__0__ret_charE1
	movzbl %al, %eax
	cmpb $125, %al
	je .LB29207
.LB29208:
	movq %rsi, %rcx
	callq json__JSONParser._peek__0__ret_charE1
	movzbl %al, %eax
	cmpb $44, %al
	jne .LB29213
.LB29214:
	movq %rsi, %rcx
	callq json__JSONParser._adv__0__ret_charE1
	movq %r13, -72(%rbp)
	movq %r14, %rbx
	jmp .LB28916
.LB29052:
	movslq %ebx, %rdx
	movb $13, (%rax,%rdx,1)
	jmp .LB29048
.LB29051:
	movslq %ebx, %rdx
	movb $10, (%rax,%rdx,1)
	jmp .LB29048
.LB29050:
	movslq %ebx, %rdx
	movb $92, (%rax,%rdx,1)
	jmp .LB29048
.LB29049:
	movslq %ebx, %rdx
	movb $34, (%rax,%rdx,1)
	jmp .LB29048
.LB29054:
	movslq %ebx, %rdx
	movb %cl, (%rax,%rdx,1)
	jmp .LB29048
.LB29034:
	jmp .LB29017
.LB29036:
	movslq %ebx, %rcx
	movb %r14b, (%rax,%rcx,1)
	movq %r14, %rcx
	jmp .LB29033
.LB29011:
	movl $2, 16(%rsi)
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
.LB28994:
	movq (%rsi), %rax
	movslq %r12d, %rcx
	leaq (%rax,%rcx,1), %rax
	movq %rbx, %r12
	movq -72(%rbp), %r13
	movq %rax, %rbx
	jmp .LB28993
.LB29108:
	movq 24(%rsi), %rdx
	callq json__JSONObject._grow_arena__1__standard__memory__allocators__stdarena__ArenaE1_ptr1__ret_boolE1
	testb %al, %al
	je .LB29118
	jmp .LB29107
.LB29213:
	movl $1, 16(%rsi)
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
.LB29207:
	movq %rsi, %rcx
	callq json__JSONParser._adv__0__ret_charE1
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
.LB29202:
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
.LB29118:
	movl $2, 16(%rsi)
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
.LB28989:
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
.LB28976:
	movl $1, 16(%rsi)
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
.LB28969:
	movl $1, 16(%rsi)
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
.LB28955:
	jmp .LB28952
.LB28929:
	movl $1, 16(%rsi)
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
.LB28913:
	movq %rsi, %rcx
	callq json__JSONParser._adv__0__ret_charE1
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
	.section .rodata
	.p2align 3
.LJT32225:
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29049
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29050
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29051
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29052
	.quad .LB29054
	.quad .LB29053
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.quad .LB29054
	.text
	.text
	.globl json__JSONParser.parse__1__JSONNodeE1_ptr1__ret_boolE1
	.def json__JSONParser.parse__1__JSONNodeE1_ptr1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
json__JSONParser.parse__1__JSONNodeE1_ptr1__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB29270:
	callq json__JSONParser._parse_value__1__JSONNodeE1_ptr1__ret_boolE1
	movzbl %al, %eax
	leave
	ret
	.text
	.globl json__node_free__1__voidE1_ptr1__ret_voidE1
	.def json__node_free__1__voidE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
json__node_free__1__voidE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
.LB26630:
	movq %rcx, %rsi
	movq %rsi, %rcx
	callq json__JSONNode.__exit__0__ret_voidE1
	movq %rsi, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl json___wc__4__byteE1_ptr1__intE1__intE1__charE1__ret_intE1
	.def json___wc__4__byteE1_ptr1__intE1__intE1__charE1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
json___wc__4__byteE1_ptr1__intE1__intE1__charE1__ret_intE1:
.LB26638:
	decl %r8d
	cmpl %r8d, %edx
	jl .LB26648
.LB26649:
	movq %rdx, %rax
	movslq %eax, %rdx
	movb $0, (%rcx,%rdx,1)
	ret
.LB26648:
	movslq %edx, %rax
	movb %r9b, (%rcx,%rax,1)
	leal 1(%rdx), %eax
	movslq %eax, %rdx
	movb $0, (%rcx,%rdx,1)
	ret
	.text
	.globl json___ws__4__byteE1_ptr1__intE1__intE1__byteE1_ptr1__ret_intE1
	.def json___ws__4__byteE1_ptr1__intE1__intE1__byteE1_ptr1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
json___ws__4__byteE1_ptr1__intE1__intE1__byteE1_ptr1__ret_intE1:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
	movq %rdi, -8(%rsp)
.LB26660:
	movl %edx, %eax
	decl %r8d
	xorl %edx, %edx
.LB26666:
	movslq %edx, %rsi
	movzbl (%r9,%rsi,1), %esi
	testb %sil, %sil
	je .LB26682
.LB26673:
	cmpl %r8d, %eax
	jge .LB26682
.LB26681:
	movslq %eax, %rdi
	movb %sil, (%rcx,%rdi,1)
	incl %eax
	incl %edx
	jmp .LB26666
.LB26682:
	movslq %eax, %rdx
	movb $0, (%rcx,%rdx,1)
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
	.text
	.globl json___we__4__byteE1_ptr1__intE1__intE1__byteE1_ptr1__ret_intE1
	.def json___we__4__byteE1_ptr1__intE1__intE1__byteE1_ptr1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
json___we__4__byteE1_ptr1__intE1__intE1__byteE1_ptr1__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $96, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
.LB26698:
	movq %rcx, %rsi
	movl %edx, %eax
	movl %r8d, %edi
	movq %r9, %rbx
	movl $858927408, -57(%rbp)
	movl $926299444, -53(%rbp)
	movl $1650538808, -49(%rbp)
	movl $1717920867, -45(%rbp)
	movb $0, -41(%rbp)
	xorl %r12d, %r12d
.LB26725:
	movslq %r12d, %rcx
	movzbl (%rbx,%rcx,1), %ecx
	testb %cl, %cl
	je .LB26734
.LB26733:
	movzbl %cl, %edx
	leaq .LJT32226(%rip), %r10
	jmpq *(%r10,%rdx,8)
.LB26745:
	movq %rsi, %rcx
	movq %rax, %rdx
	movq %rdi, %r8
	movl $92, %r9d
	callq json___wc__4__byteE1_ptr1__intE1__intE1__charE1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	movq %rdi, %r8
	movl $116, %r9d
	callq json___wc__4__byteE1_ptr1__intE1__intE1__charE1__ret_intE1
.LB26740:
	incl %r12d
	jmp .LB26725
.LB26734:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB26744:
	movq %rsi, %rcx
	movq %rax, %rdx
	movq %rdi, %r8
	movl $92, %r9d
	callq json___wc__4__byteE1_ptr1__intE1__intE1__charE1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	movq %rdi, %r8
	movl $114, %r9d
	callq json___wc__4__byteE1_ptr1__intE1__intE1__charE1__ret_intE1
	jmp .LB26740
.LB26743:
	movq %rsi, %rcx
	movq %rax, %rdx
	movq %rdi, %r8
	movl $92, %r9d
	callq json___wc__4__byteE1_ptr1__intE1__intE1__charE1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	movq %rdi, %r8
	movl $110, %r9d
	callq json___wc__4__byteE1_ptr1__intE1__intE1__charE1__ret_intE1
	jmp .LB26740
.LB26742:
	movq %rsi, %rcx
	movq %rax, %rdx
	movq %rdi, %r8
	movl $92, %r9d
	callq json___wc__4__byteE1_ptr1__intE1__intE1__charE1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	movq %rdi, %r8
	movl $92, %r9d
	callq json___wc__4__byteE1_ptr1__intE1__intE1__charE1__ret_intE1
	jmp .LB26740
.LB26741:
	movq %rsi, %rcx
	movq %rax, %rdx
	movq %rdi, %r8
	movl $92, %r9d
	callq json___wc__4__byteE1_ptr1__intE1__intE1__charE1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	movq %rdi, %r8
	movl $34, %r9d
	callq json___wc__4__byteE1_ptr1__intE1__intE1__charE1__ret_intE1
	jmp .LB26740
.LB26746:
	movslq %r12d, %rdx
	leaq (%rbx,%rdx,1), %r13
	cmpb $32, (%r13)
	jb .LB26794
.LB26795:
	movzbl %cl, %r9d
	movq %rsi, %rcx
	movq %rax, %rdx
	movq %rdi, %r8
	callq json___wc__4__byteE1_ptr1__intE1__intE1__charE1__ret_intE1
.LB26793:
	jmp .LB26740
.LB26794:
	movq %rsi, %rcx
	movq %rax, %rdx
	movq %rdi, %r8
	movl $92, %r9d
	callq json___wc__4__byteE1_ptr1__intE1__intE1__charE1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	movq %rdi, %r8
	movl $117, %r9d
	callq json___wc__4__byteE1_ptr1__intE1__intE1__charE1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	movq %rdi, %r8
	movl $48, %r9d
	callq json___wc__4__byteE1_ptr1__intE1__intE1__charE1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	movq %rdi, %r8
	movl $48, %r9d
	callq json___wc__4__byteE1_ptr1__intE1__intE1__charE1__ret_intE1
	movl %eax, %edx
	movzbl (%r13), %eax
	sarl $4, %eax
	andl $15, %eax
	movslq %eax, %rax
	movzbl -57(%rbp,%rax,1), %eax
	movzbl %al, %r9d
	movq %rsi, %rcx
	movq %rdi, %r8
	callq json___wc__4__byteE1_ptr1__intE1__intE1__charE1__ret_intE1
	movl %eax, %edx
	movzbl (%r13), %eax
	andl $15, %eax
	movslq %eax, %rax
	movzbl -57(%rbp,%rax,1), %eax
	movzbl %al, %r9d
	movq %rsi, %rcx
	movq %rdi, %r8
	callq json___wc__4__byteE1_ptr1__intE1__intE1__charE1__ret_intE1
	jmp .LB26793
	.section .rodata
	.p2align 3
.LJT32226:
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26745
	.quad .LB26743
	.quad .LB26746
	.quad .LB26746
	.quad .LB26744
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26741
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26742
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.quad .LB26746
	.text
	.text
	.globl json__serialize__4__JSONNodeE1_ptr1__byteE1_ptr1__intE1__intE1__ret_intE1
	.def json__serialize__4__JSONNodeE1_ptr1__byteE1_ptr1__intE1__intE1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
json__serialize__4__JSONNodeE1_ptr1__byteE1_ptr1__intE1__intE1__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $144, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
	movq %r14, -48(%rbp)
	movq %r15, -56(%rbp)
.LB26847:
	movq %rcx, %rsi
	movq %rdx, %rdi
	movl %r8d, %ebx
	movl %r9d, %r12d
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -88(%rbp)
	vzeroupper
	testq %rsi, %rsi
	je .LB26863
.LB26864:
	movl (%rsi), %eax
	movq %rax, %r11
	cmpq $6, %r11
	ja .LB26888
	leaq .LJT32227(%rip), %r10
	jmpq *(%r10,%r11,8)
.LB26887:
	movq 88(%rsi), %r13
	movq %rdi, %rcx
	movq %rbx, %rdx
	movq %r12, %r8
	movl $123, %r9d
	callq json___wc__4__byteE1_ptr1__intE1__intE1__charE1__ret_intE1
	xorl %ebx, %ebx
.LB27028:
	cmpq %r13, %rbx
	jae .LB27035
.LB27034:
	testq %rbx, %rbx
	ja .LB27040
.LB27041:
.LB27039:
	movq %rdi, %rcx
	movq %rax, %rdx
	movq %r12, %r8
	movl $34, %r9d
	callq json___wc__4__byteE1_ptr1__intE1__intE1__charE1__ret_intE1
	movl %eax, %r14d
	leaq 64(%rsi), %r15
	movq %r15, %rcx
	movq %rbx, %rdx
	callq json__JSONObject.key_at__1__dataE1_ubits64__ret_byteE1_ptr1
	movq %rax, %r9
	movq %rdi, %rcx
	movq %r14, %rdx
	movq %r12, %r8
	callq json___we__4__byteE1_ptr1__intE1__intE1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rdi, %rcx
	movq %r12, %r8
	movl $34, %r9d
	callq json___wc__4__byteE1_ptr1__intE1__intE1__charE1__ret_intE1
	movl %eax, %edx
	movq %rdi, %rcx
	movq %r12, %r8
	movl $58, %r9d
	callq json___wc__4__byteE1_ptr1__intE1__intE1__charE1__ret_intE1
	movl %eax, %r14d
	movq %r15, %rcx
	movq %rbx, %rdx
	callq json__JSONObject.val_at__1__dataE1_ubits64__ret_voidE1_ptr1
	movq %rax, %rcx
	movq %rdi, %rdx
	movq %r14, %r8
	movq %r12, %r9
	callq json__serialize__4__JSONNodeE1_ptr1__byteE1_ptr1__intE1__intE1__ret_intE1
	incq %rbx
	cmpq %r13, %rbx
	jb .LB27034
.LB27035:
	movq %rdi, %rcx
	movq %rax, %rdx
	movq %r12, %r8
	movl $125, %r9d
	callq json___wc__4__byteE1_ptr1__intE1__intE1__charE1__ret_intE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB27040:
	movq %rdi, %rcx
	movq %rax, %rdx
	movq %r12, %r8
	movl $44, %r9d
	callq json___wc__4__byteE1_ptr1__intE1__intE1__charE1__ret_intE1
	jmp .LB27039
.LB26886:
	movq 48(%rsi), %r13
	movq %rdi, %rcx
	movq %rbx, %rdx
	movq %r12, %r8
	movl $91, %r9d
	callq json___wc__4__byteE1_ptr1__intE1__intE1__charE1__ret_intE1
	xorl %ebx, %ebx
.LB26980:
	cmpq %r13, %rbx
	jae .LB26987
.LB26986:
	testq %rbx, %rbx
	ja .LB26992
.LB26993:
	movq %rax, %r14
.LB26991:
	leaq 40(%rsi), %rcx
	movq %rbx, %rdx
	callq json__JSONArray.get__1__dataE1_ubits64__ret_voidE1_ptr1
	movq %rax, %rcx
	movq %rdi, %rdx
	movq %r14, %r8
	movq %r12, %r9
	callq json__serialize__4__JSONNodeE1_ptr1__byteE1_ptr1__intE1__intE1__ret_intE1
	incq %rbx
	cmpq %r13, %rbx
	jb .LB26986
.LB26987:
	movq %rdi, %rcx
	movq %rax, %rdx
	movq %r12, %r8
	movl $93, %r9d
	callq json___wc__4__byteE1_ptr1__intE1__intE1__charE1__ret_intE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB26992:
	movq %rdi, %rcx
	movq %rax, %rdx
	movq %r12, %r8
	movl $44, %r9d
	callq json___wc__4__byteE1_ptr1__intE1__intE1__charE1__ret_intE1
	movl %eax, %r14d
	jmp .LB26991
.LB26885:
	movq %rdi, %rcx
	movq %rbx, %rdx
	movq %r12, %r8
	movl $34, %r9d
	callq json___wc__4__byteE1_ptr1__intE1__intE1__charE1__ret_intE1
	movl %eax, %edx
	movq 24(%rsi), %r9
	movq %rdi, %rcx
	movq %r12, %r8
	callq json___we__4__byteE1_ptr1__intE1__intE1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rdi, %rcx
	movq %r12, %r8
	movl $34, %r9d
	callq json___wc__4__byteE1_ptr1__intE1__intE1__charE1__ret_intE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB26884:
	movsd 16(%rsi), %xmm0
	leaq -88(%rbp), %rdx
	movl $6, %r8d
	callq standard__strings__dbl2str__3__doubleE1__byteE1_ptr1__dataE1_sbits32__ret_dataE1_sbits32
	leaq -88(%rbp), %r9
	movq %rdi, %rcx
	movq %rbx, %rdx
	movq %r12, %r8
	callq json___ws__4__byteE1_ptr1__intE1__intE1__byteE1_ptr1__ret_intE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB26883:
	movq 8(%rsi), %rcx
	leaq -88(%rbp), %rdx
	callq standard__strings__i64str__2__dataE1_sbits64__byteE1_ptr1__ret_dataE1_sbits64
	leaq -88(%rbp), %r9
	movq %rdi, %rcx
	movq %rbx, %rdx
	movq %r12, %r8
	callq json___ws__4__byteE1_ptr1__intE1__intE1__byteE1_ptr1__ret_intE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB26882:
	cmpb $0, 4(%rsi)
	jne .LB26905
.LB26906:
	movl $1936482662, -94(%rbp)
	movw $101, -90(%rbp)
	leaq -94(%rbp), %r9
	movq %rdi, %rcx
	movq %rbx, %rdx
	movq %r12, %r8
	callq json___ws__4__byteE1_ptr1__intE1__intE1__byteE1_ptr1__ret_intE1
.LB26904:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB26905:
	movl $1702195828, -99(%rbp)
	movb $0, -95(%rbp)
	leaq -99(%rbp), %r9
	movq %rdi, %rcx
	movq %rbx, %rdx
	movq %r12, %r8
	callq json___ws__4__byteE1_ptr1__intE1__intE1__byteE1_ptr1__ret_intE1
	jmp .LB26904
.LB26881:
	movl $1819047278, -104(%rbp)
	movb $0, -100(%rbp)
	leaq -104(%rbp), %r9
	movq %rdi, %rcx
	movq %rbx, %rdx
	movq %r12, %r8
	callq json___ws__4__byteE1_ptr1__intE1__intE1__byteE1_ptr1__ret_intE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB26888:
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
.LB26863:
	movl $1819047278, -109(%rbp)
	movb $0, -105(%rbp)
	leaq -109(%rbp), %r9
	movq %rdi, %rcx
	movq %rbx, %rdx
	movq %r12, %r8
	callq json___ws__4__byteE1_ptr1__intE1__intE1__byteE1_ptr1__ret_intE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
	.section .rodata
	.p2align 3
.LJT32227:
	.quad .LB26881
	.quad .LB26882
	.quad .LB26883
	.quad .LB26884
	.quad .LB26885
	.quad .LB26886
	.quad .LB26887
	.text
	.text
	.globl standard__datetime___days_in_month_table__2__intE1__boolE1__ret_intE1
	.def standard__datetime___days_in_month_table__2__intE1__boolE1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__datetime___days_in_month_table__2__intE1__boolE1__ret_intE1:
	subq $112, %rsp
.LB29275:
	movl $0, 52(%rsp)
	movl $31, 56(%rsp)
	movl $28, 60(%rsp)
	movl $31, 64(%rsp)
	movl $30, 68(%rsp)
	movl $31, 72(%rsp)
	movl $30, 76(%rsp)
	movl $31, 80(%rsp)
	movl $31, 84(%rsp)
	movl $30, 88(%rsp)
	movl $31, 92(%rsp)
	movl $30, 96(%rsp)
	movl $31, 100(%rsp)
	movl $0, (%rsp)
	movl $31, 4(%rsp)
	movl $29, 8(%rsp)
	movl $31, 12(%rsp)
	movl $30, 16(%rsp)
	movl $31, 20(%rsp)
	movl $30, 24(%rsp)
	movl $31, 28(%rsp)
	movl $31, 32(%rsp)
	movl $30, 36(%rsp)
	movl $31, 40(%rsp)
	movl $30, 44(%rsp)
	movl $31, 48(%rsp)
	cmpl $1, %ecx
	jl .LB29313
.LB29308:
	cmpl $12, %ecx
	jg .LB29313
.LB29314:
	testb %dl, %dl
	jne .LB29317
.LB29318:
	movslq %ecx, %rax
	movl 52(%rsp,%rax,4), %eax
	addq $112, %rsp
	ret
.LB29317:
	movslq %ecx, %rax
	movl (%rsp,%rax,4), %eax
	addq $112, %rsp
	ret
.LB29313:
	xorl %eax, %eax
	addq $112, %rsp
	ret
	.text
	.globl standard__datetime__dt_is_leap__1__intE1__ret_boolE1
	.def standard__datetime__dt_is_leap__1__intE1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__datetime__dt_is_leap__1__intE1__ret_boolE1:
.LB29326:
	movl %ecx, %eax
	sarl $31, %eax
	shrl $30, %eax
	addl %ecx, %eax
	andl $-4, %eax
	negl %eax
	addl %ecx, %eax
	testl %eax, %eax
	jne .LB29337
.LB29331:
	movslq %ecx, %rax
	movabsq $2748779070, %rdx
	imulq %rax, %rdx
	sarq $38, %rdx
	shrq $63, %rax
	addl %eax, %edx
	imull $100, %edx, %edx
	movl %ecx, %eax
	subl %edx, %eax
	testl %eax, %eax
	je .LB29337
.LB32228:
	movl $1, %eax
	ret
.LB29337:
	movslq %ecx, %rax
	movabsq $2748779070, %rdx
	imulq %rax, %rdx
	sarq $40, %rdx
	shrq $63, %rax
	addl %eax, %edx
	imull $400, %edx, %edx
	subl %edx, %ecx
	xorl %eax, %eax
	testl %ecx, %ecx
	sete %al
	ret
	.text
	.globl standard__datetime___days_to_year__1__intE1__ret_dataE1_sbits64
	.def standard__datetime___days_to_year__1__intE1__ret_dataE1_sbits64;
	.scl 2;
	.type 32;
	.endef
standard__datetime___days_to_year__1__intE1__ret_dataE1_sbits64:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
.LB29343:
	decl %ecx
	movslq %ecx, %rcx
	imulq $365, %rcx, %rax
	movq %rcx, %rdx
	sarq $63, %rdx
	shrq $62, %rdx
	addq %rcx, %rdx
	sarq $2, %rdx
	leaq (%rax,%rdx), %rsi
	movq %rcx, %rax
	movabsq $-6640827866535438581, %rdx
	imulq %rdx
	addq %rcx, %rdx
	sarq $6, %rdx
	movq %rdx, %rax
	shrq $63, %rax
	addq %rdx, %rax
	subq %rax, %rsi
	movq %rcx, %rax
	movabsq $-6640827866535438581, %rdx
	imulq %rdx
	addq %rcx, %rdx
	sarq $8, %rdx
	movq %rdx, %rax
	shrq $63, %rax
	addq %rdx, %rax
	addq %rax, %rsi
	leaq -719162(%rsi), %rax
	movq 0(%rsp), %rsi
	addq $16, %rsp
	ret
	.text
	.globl standard__datetime___dt_to_days__1__DateTimeE1_ptr1__ret_dataE1_sbits64
	.def standard__datetime___dt_to_days__1__DateTimeE1_ptr1__ret_dataE1_sbits64;
	.scl 2;
	.type 32;
	.endef
standard__datetime___dt_to_days__1__DateTimeE1_ptr1__ret_dataE1_sbits64:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
.LB29377:
	movq %rcx, %rsi
	movl (%rsi), %ecx
	callq standard__datetime___days_to_year__1__intE1__ret_dataE1_sbits64
	movq %rax, %rdi
	movl $1, %ebx
.LB29386:
	cmpl 4(%rsi), %ebx
	jge .LB29388
.LB29387:
	movl (%rsi), %ecx
	callq standard__datetime__dt_is_leap__1__intE1__ret_boolE1
	movzbl %al, %eax
	movzbl %al, %edx
	movq %rbx, %rcx
	callq standard__datetime___days_in_month_table__2__intE1__boolE1__ret_intE1
	movl (%rsi), %ecx
	callq standard__datetime__dt_is_leap__1__intE1__ret_boolE1
	movzbl %al, %eax
	movzbl %al, %edx
	movq %rbx, %rcx
	callq standard__datetime___days_in_month_table__2__intE1__boolE1__ret_intE1
	movslq %eax, %rax
	addq %rax, %rdi
	incl %ebx
	cmpl 4(%rsi), %ebx
	jl .LB29387
.LB29388:
	movl 8(%rsi), %eax
	decl %eax
	movslq %eax, %rax
	addq %rdi, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__datetime__dt_from_unix_ms__1__dataE1_sbits64__ret_DateTimeE1
	.def standard__datetime__dt_from_unix_ms__1__dataE1_sbits64__ret_DateTimeE1;
	.scl 2;
	.type 32;
	.endef
standard__datetime__dt_from_unix_ms__1__dataE1_sbits64__ret_DateTimeE1:
	subq $96, %rsp
	movq %rbx, 80(%rsp)
	movq %rsi, 72(%rsp)
	movq %rdi, 64(%rsp)
	movq %r12, 56(%rsp)
.LB29432:
	movq %rdx, %rsi
	movups .LZERO(%rip), %xmm15
	movups %xmm15, 28(%rsp)
	movq .LZERO+16(%rip), %r10
	movq %r10, 44(%rsp)
	movl .LZERO+24(%rip), %r10d
	movl %r10d, 52(%rsp)
	testq %rsi, %rsi
	jns .LB29447
.LB29448:
	leaq -86399999(%rsi), %rax
	movabsq $7164004856975580295, %rdx
	imulq %rdx
	sarq $25, %rdx
	movq %rdx, %rax
	shrq $63, %rax
	addq %rdx, %rax
	imulq $86400000, %rax, %rdx
	subq %rdx, %rsi
.LB29449:
	leaq 719468(%rax), %rdi
	movq %rdi, %rax
	movabsq $4137408090565272301, %rdx
	imulq %rdx
	sarq $15, %rdx
	movq %rdx, %rax
	shrq $63, %rax
	addq %rdx, %rax
	imulq $146097, %rax, %rdx
	subq %rdx, %rdi
	xorl %edx, %edx
	testq %rdi, %rdi
	sets %dl
	leaq 146097(%rdi), %r8
	leaq -1(%rax), %r9
	testb %dl, %dl
	cmove %rax, %r9
	testb %dl, %dl
	cmovne %r8, %rdi
	movq %rdi, %rax
	movabsq $-1896998432287073591, %rdx
	imulq %rdx
	addq %rdi, %rdx
	sarq $15, %rdx
	movq %rdx, %rax
	shrq $63, %rax
	addq %rdx, %rax
	movl $3, %edx
	cmpq $4, %rax
	movq %rax, %r8
	cmove %rdx, %r8
	imulq $36524, %r8, %rax
	subq %rax, %rdi
	movq %rdi, %rax
	movabsq $-5517609281458640695, %rdx
	imulq %rdx
	addq %rdi, %rdx
	sarq $10, %rdx
	movq %rdx, %rax
	shrq $63, %rax
	leaq (%rdx,%rax), %rbx
	imulq $1461, %rbx, %rax
	subq %rax, %rdi
	movq %rdi, %rax
	movabsq $3234497591006606311, %rdx
	imulq %rdx
	sarq $6, %rdx
	movq %rdx, %rax
	shrq $63, %rax
	addq %rdx, %rax
	movl $3, %edx
	cmpq $4, %rax
	cmove %rdx, %rax
	imulq $365, %rax, %rdx
	subq %rdx, %rdi
	imulq $400, %r9, %r9
	imulq $100, %r8, %r8
	movabsq $3858142551364089227, %rdx
	addq %r8, %r9
	shlq $2, %rbx
	addq %rbx, %r9
	leaq (%r9,%rax), %r8
	leaq (%rdi,%rdi,4), %rax
	addq $2, %rax
	imulq %rdx
	sarq $5, %rdx
	movq %rdx, %rax
	shrq $63, %rax
	addq %rdx, %rax
	leal 3(%rax), %edx
	xorl %r9d, %r9d
	cmpl $12, %edx
	setg %r9b
	leal -12(%rdx), %ebx
	leal 1(%r8), %r12d
	testb %r9b, %r9b
	cmovne %r12d, %r8d
	testb %r9b, %r9b
	movl %edx, %r9d
	cmovne %ebx, %r9d
	imulq $153, %rax, %rax
	addq $2, %rax
	movabsq $7378697629483820647, %rdx
	imulq %rdx
	sarq $1, %rdx
	movq %rdx, %rax
	shrq $63, %rax
	addq %rdx, %rax
	negq %rax
	addq %rdi, %rax
	incl %eax
	movl %r8d, 28(%rsp)
	movl %r9d, 32(%rsp)
	movl %eax, 36(%rsp)
	movq %rsi, %rax
	movabsq $2361183241434822607, %rdx
	imulq %rdx
	sarq $7, %rdx
	movq %rdx, %rax
	shrq $63, %rax
	leaq (%rdx,%rax), %rdi
	imulq $1000, %rdi, %rax
	negq %rax
	addq %rsi, %rax
	movl %eax, 52(%rsp)
	movq %rdi, %rax
	movabsq $-8608480567731124087, %rdx
	imulq %rdx
	addq %rdi, %rdx
	sarq $5, %rdx
	movq %rdx, %rax
	shrq $63, %rax
	leaq (%rdx,%rax), %rsi
	imulq $60, %rsi, %rax
	negq %rax
	addq %rdi, %rax
	movl %eax, 48(%rsp)
	movq %rsi, %rax
	movabsq $-8608480567731124087, %rdx
	imulq %rdx
	addq %rsi, %rdx
	sarq $5, %rdx
	movq %rdx, %rax
	shrq $63, %rax
	addq %rax, %rdx
	imulq $60, %rdx, %rdx
	movq %rsi, %rax
	subq %rdx, %rax
	movl %eax, 44(%rsp)
	movq %rdi, %rax
	movabsq $5247073869855161349, %rdx
	imulq %rdx
	sarq $10, %rdx
	movq %rdx, %rax
	shrq $63, %rax
	addq %rdx, %rax
	movl %eax, 40(%rsp)
	movups 28(%rsp), %xmm15
	movups %xmm15, (%rsp)
	movq 44(%rsp), %r10
	movq %r10, 16(%rsp)
	movl 52(%rsp), %r10d
	movl %r10d, 24(%rsp)
	movups (%rsp), %xmm15
	movups %xmm15, (%rcx)
	movq 16(%rsp), %r10
	movq %r10, 16(%rcx)
	movl 24(%rsp), %r10d
	movl %r10d, 24(%rcx)
	movq %rcx, %rax
	movq 80(%rsp), %rbx
	movq 72(%rsp), %rsi
	movq 64(%rsp), %rdi
	movq 56(%rsp), %r12
	addq $96, %rsp
	ret
.LB29447:
	movq %rsi, %rax
	movabsq $7164004856975580295, %rdx
	imulq %rdx
	sarq $25, %rdx
	movq %rdx, %rax
	shrq $63, %rax
	addq %rdx, %rax
	imulq $86400000, %rax, %rdx
	subq %rdx, %rsi
	jmp .LB29449
	.text
	.globl standard__datetime__dt_to_unix_ms__1__DateTimeE1_ptr1__ret_dataE1_sbits64
	.def standard__datetime__dt_to_unix_ms__1__DateTimeE1_ptr1__ret_dataE1_sbits64;
	.scl 2;
	.type 32;
	.endef
standard__datetime__dt_to_unix_ms__1__DateTimeE1_ptr1__ret_dataE1_sbits64:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
.LB29608:
	movq %rcx, %rsi
	movq %rsi, %rcx
	callq standard__datetime___dt_to_days__1__DateTimeE1_ptr1__ret_dataE1_sbits64
	movslq 12(%rsi), %rcx
	imulq $86400, %rax, %rax
	imulq $3600, %rcx, %rcx
	addq %rcx, %rax
	movslq 16(%rsi), %rcx
	imulq $60, %rcx, %rcx
	addq %rcx, %rax
	movslq 20(%rsi), %rcx
	addq %rcx, %rax
	movslq 24(%rsi), %rcx
	imulq $1000, %rax, %rax
	addq %rcx, %rax
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl standard__datetime__dt_to_unix_sec__1__DateTimeE1_ptr1__ret_dataE1_sbits64
	.def standard__datetime__dt_to_unix_sec__1__DateTimeE1_ptr1__ret_dataE1_sbits64;
	.scl 2;
	.type 32;
	.endef
standard__datetime__dt_to_unix_sec__1__DateTimeE1_ptr1__ret_dataE1_sbits64:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB29649:
	callq standard__datetime__dt_to_unix_ms__1__DateTimeE1_ptr1__ret_dataE1_sbits64
	movabsq $2361183241434822607, %rcx
	imulq %rcx
	sarq $7, %rdx
	movq %rdx, %rax
	shrq $63, %rax
	addq %rdx, %rax
	leave
	ret
	.text
	.globl standard__datetime__dt_now_utc__0__ret_DateTimeE1
	.def standard__datetime__dt_now_utc__0__ret_DateTimeE1;
	.scl 2;
	.type 32;
	.endef
standard__datetime__dt_now_utc__0__ret_DateTimeE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $80, %rsp
	movq %rsi, -8(%rbp)
.LB29656:
	movq %rcx, %rsi
	movq $0, -16(%rbp)
	leaq -16(%rbp), %rcx
	callq GetSystemTimeAsFileTime
	movq -16(%rbp), %rax
	movabsq $116444736000000000, %rcx
	subq %rcx, %rax
	movabsq $3777893186295716171, %rcx
	mulq %rcx
	leaq -44(%rbp), %rcx
	movq %rdx, %rax
	shrq $11, %rax
	movq %rax, %rdx
	callq standard__datetime__dt_from_unix_ms__1__dataE1_sbits64__ret_DateTimeE1
	movups -44(%rbp), %xmm15
	movups %xmm15, (%rsi)
	movq -28(%rbp), %r10
	movq %r10, 16(%rsi)
	movl -20(%rbp), %r10d
	movl %r10d, 24(%rsi)
	movq %rsi, %rax
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl standard__discord__d_len__1__byteE1_ptr1__ret_intE1
	.def standard__discord__d_len__1__byteE1_ptr1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__discord__d_len__1__byteE1_ptr1__ret_intE1:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
.LB29665:
	movq %rcx, %rax
	movl %eax, %ecx
	movq %rax, %rdx
	andq $-32, %rdx
	vpxor %xmm15, %xmm15, %xmm15
	vpcmpeqb (%rdx), %ymm15, %ymm0
	vpmovmskb %ymm0, %esi
	shrl %cl, %esi
	testl %esi, %esi
	jne .LS32229f
.LS32229l:
	addq $32, %rdx
	vpcmpeqb (%rdx), %ymm15, %ymm0
	vpmovmskb %ymm0, %esi
	testl %esi, %esi
	je .LS32229l
	tzcntl %esi, %esi
	addq %rdx, %rsi
	subq %rax, %rsi
	jmp .LS32229d
.LS32229f:
	tzcntl %esi, %esi
.LS32229d:
	vzeroupper
.LB29668:
	movl %esi, %eax
	movq 0(%rsp), %rsi
	addq $16, %rsp
	ret
	.text
	.globl standard__discord__d_copy_str__3__byteE1_ptr1__intE1__byteE1_ptr1__ret_voidE1
	.def standard__discord__d_copy_str__3__byteE1_ptr1__intE1__byteE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__discord__d_copy_str__3__byteE1_ptr1__intE1__byteE1_ptr1__ret_voidE1:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
	movq %rdi, -8(%rsp)
.LB29680:
	decl %edx
	xorl %eax, %eax
.LB29685:
	movslq %eax, %rsi
	movzbl (%r8,%rsi,1), %esi
	testb %sil, %sil
	je .LB29687
.LB29694:
	cmpl %edx, %eax
	jge .LB29687
.LB29686:
	movslq %eax, %rdi
	movb %sil, (%rcx,%rdi,1)
	incl %eax
	jmp .LB29685
.LB29687:
	movslq %eax, %rax
	movb $0, (%rcx,%rax,1)
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
	.text
	.globl standard__discord__d_now_ms__0__ret_dataE1_sbits64
	.def standard__discord__d_now_ms__0__ret_dataE1_sbits64;
	.scl 2;
	.type 32;
	.endef
standard__discord__d_now_ms__0__ret_dataE1_sbits64:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB29714:
	callq standard__time__time_now__0__ret_dataE1_sbits64
	movq %rax, %rcx
	callq standard__time__ns_to_ms__1__dataE1_sbits64__ret_dataE1_sbits64
	leave
	ret
	.text
	.globl standard__discord__d_unix_now__0__ret_dataE1_sbits64
	.def standard__discord__d_unix_now__0__ret_dataE1_sbits64;
	.scl 2;
	.type 32;
	.endef
standard__discord__d_unix_now__0__ret_dataE1_sbits64:
	pushq %rbp
	movq %rsp, %rbp
	subq $96, %rsp
.LB29717:
	leaq -56(%rbp), %rcx
	callq standard__datetime__dt_now_utc__0__ret_DateTimeE1
	movups -56(%rbp), %xmm15
	movups %xmm15, -28(%rbp)
	movq -40(%rbp), %r10
	movq %r10, -12(%rbp)
	movl -32(%rbp), %r10d
	movl %r10d, -4(%rbp)
	leaq -28(%rbp), %rcx
	callq standard__datetime__dt_to_unix_sec__1__DateTimeE1_ptr1__ret_dataE1_sbits64
	leave
	ret
	.text
	.globl standard__discord__d_get_str__3__JSONNodeE1_ptr1__byteE1_ptr1__intE1__ret_intE1
	.def standard__discord__d_get_str__3__JSONNodeE1_ptr1__byteE1_ptr1__intE1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__discord__d_get_str__3__JSONNodeE1_ptr1__byteE1_ptr1__intE1__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB29721:
	movq %rcx, %rax
	movq %rdx, %rsi
	movl %r8d, %edi
	movq $0, -24(%rbp)
	movl $0, -28(%rbp)
	movb $0, (%rsi)
	testq %rax, %rax
	je .LB29737
.LB29738:
	leaq -24(%rbp), %rdx
	leaq -28(%rbp), %r8
	movq %rax, %rcx
	callq json__JSONNode.as_string_view__2__byteE1_ptr2__intE1_ptr1__ret_boolE1
	testb %al, %al
	je .LB29743
.LB29744:
	movl -28(%rbp), %eax
	decl %edi
	cmpl %edi, %eax
	cmovg %edi, %eax
	movslq %eax, %rcx
	xorl %edx, %edx
	testq %rcx, %rcx
	cmovg %rcx, %rdx
	shrq $2, %rdx
	xorl %edi, %edi
.LB32230:
	testq %rdx, %rdx
	je .LB32232
.LB32231:
	movq -24(%rbp), %r8
	movzbl (%r8,%rdi,1), %r8d
	movb %r8b, (%rsi,%rdi,1)
	movq -24(%rbp), %r8
	movzbl 1(%r8,%rdi,1), %r8d
	movb %r8b, 1(%rsi,%rdi,1)
	movq -24(%rbp), %r8
	movzbl 2(%r8,%rdi,1), %r8d
	movb %r8b, 2(%rsi,%rdi,1)
	movq -24(%rbp), %r8
	movzbl 3(%r8,%rdi,1), %r8d
	movb %r8b, 3(%rsi,%rdi,1)
	addq $4, %rdi
	decq %rdx
	jne .LB32231
.LB32232:
.LB29756:
	cmpq %rcx, %rdi
	jge .LB29759
.LB29757:
	movq -24(%rbp), %rdx
	movzbl (%rdx,%rdi,1), %edx
	movb %dl, (%rsi,%rdi,1)
	incq %rdi
	cmpq %rcx, %rdi
	jl .LB29757
.LB29759:
	movslq %eax, %rcx
	movb $0, (%rsi,%rcx,1)
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB29743:
	xorl %eax, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB29737:
	xorl %eax, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__discord__d_send_json__2__DISCORD_BOTE1_ptr1__JSONNodeE1_ptr1__ret_boolE1
	.def standard__discord__d_send_json__2__DISCORD_BOTE1_ptr1__JSONNodeE1_ptr1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__discord__d_send_json__2__DISCORD_BOTE1_ptr1__JSONNodeE1_ptr1__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	movl $8240, %eax
	callq __chkstk
	subq %rax, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB29777:
	movq %rcx, %rsi
	leaq -8208(%rbp), %rax
	movq %rax, %rdi
	xorl %eax, %eax
	movl $8192, %ecx
	rep stosb
	leaq -8208(%rbp), %rax
	movq %rdx, %rcx
	movq %rax, %rdx
	xorl %r8d, %r8d
	movl $8192, %r9d
	callq json__serialize__4__JSONNodeE1_ptr1__byteE1_ptr1__intE1__intE1__ret_intE1
	testl %eax, %eax
	jle .LB29789
.LB29790:
	leaq 544(%rsi), %rcx
	leaq -8208(%rbp), %r8
	movl $1, %edx
	movq %rax, %r9
	callq standard__web__ws_send__4__WEB_STREAME1_ptr1__intE1__byteE1_ptr1__intE1__ret_boolE1
	movzbl %al, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB29789:
	xorl %eax, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__discord__d_send_heartbeat__1__DISCORD_BOTE1_ptr1__ret_boolE1
	.def standard__discord__d_send_heartbeat__1__DISCORD_BOTE1_ptr1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__discord__d_send_heartbeat__1__DISCORD_BOTE1_ptr1__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $160, %rsp
	movq %rsi, -8(%rbp)
.LB29797:
	movq %rcx, %rsi
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -112(%rbp)
	vmovdqu .LZERO+32(%rip), %ymm15
	vmovdqu %ymm15, -80(%rbp)
	vmovdqu .LZERO+64(%rip), %ymm15
	vmovdqu %ymm15, -48(%rbp)
	movq .LZERO+96(%rip), %r10
	movq %r10, -16(%rbp)
	vzeroupper
	leaq -112(%rbp), %rcx
	callq json__JSONNode.__init__0__ret_thisE1
	leaq -112(%rbp), %rcx
	callq json__JSONNode.set_object__0__ret_voidE1
	movw $28783, -115(%rbp)
	movb $0, -113(%rbp)
	leaq -115(%rbp), %rdx
	leaq -112(%rbp), %rcx
	callq json__JSONNode.object_set_new__1__byteE1_ptr1__ret_voidE1_ptr1
	movq %rax, %rcx
	movl $1, %edx
	callq json__JSONNode.set_int__1__dataE1_sbits64__ret_voidE1
	movw $100, -117(%rbp)
	leaq -117(%rbp), %rdx
	leaq -112(%rbp), %rcx
	callq json__JSONNode.object_set_new__1__byteE1_ptr1__ret_voidE1_ptr1
	cmpl $0, 441756(%rsi)
	jne .LB29823
.LB29824:
	movl json__JSON_NULL(%rip), %ecx
	movl %ecx, (%rax)
.LB29825:
	leaq -112(%rbp), %rdx
	movq %rsi, %rcx
	callq standard__discord__d_send_json__2__DISCORD_BOTE1_ptr1__JSONNodeE1_ptr1__ret_boolE1
	movzbl %al, %esi
	leaq -112(%rbp), %rcx
	callq json__JSONNode.__exit__0__ret_voidE1
	movl json__JSON_NULL(%rip), %eax
	movl %eax, -112(%rbp)
	movzbl %sil, %eax
	movq -8(%rbp), %rsi
	leave
	ret
.LB29823:
	movq 441748(%rsi), %rdx
	movq %rax, %rcx
	callq json__JSONNode.set_int__1__dataE1_sbits64__ret_voidE1
	jmp .LB29825
	.text
	.globl standard__discord__d_send_identify__1__DISCORD_BOTE1_ptr1__ret_boolE1
	.def standard__discord__d_send_identify__1__DISCORD_BOTE1_ptr1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__discord__d_send_identify__1__DISCORD_BOTE1_ptr1__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $224, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB29836:
	movq %rcx, %rsi
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -120(%rbp)
	vmovdqu .LZERO+32(%rip), %ymm15
	vmovdqu %ymm15, -88(%rbp)
	vmovdqu .LZERO+64(%rip), %ymm15
	vmovdqu %ymm15, -56(%rbp)
	movq .LZERO+96(%rip), %r10
	movq %r10, -24(%rbp)
	vzeroupper
	leaq -120(%rbp), %rcx
	callq json__JSONNode.__init__0__ret_thisE1
	leaq -120(%rbp), %rcx
	callq json__JSONNode.set_object__0__ret_voidE1
	movw $28783, -123(%rbp)
	movb $0, -121(%rbp)
	leaq -123(%rbp), %rdx
	leaq -120(%rbp), %rcx
	callq json__JSONNode.object_set_new__1__byteE1_ptr1__ret_voidE1_ptr1
	movq %rax, %rcx
	movl $2, %edx
	callq json__JSONNode.set_int__1__dataE1_sbits64__ret_voidE1
	movw $100, -125(%rbp)
	leaq -125(%rbp), %rdx
	leaq -120(%rbp), %rcx
	callq json__JSONNode.object_set_new__1__byteE1_ptr1__ret_voidE1_ptr1
	movq %rax, %rdi
	movq %rdi, %rcx
	callq json__JSONNode.set_object__0__ret_voidE1
	movl $1701539700, -131(%rbp)
	movw $110, -127(%rbp)
	leaq -131(%rbp), %rdx
	movq %rdi, %rcx
	callq json__JSONNode.object_set_new__1__byteE1_ptr1__ret_voidE1_ptr1
	movq %rax, %rcx
	movq %rsi, %rdx
	callq json__JSONNode.set_string__1__byteE1_ptr1__ret_boolE1
	movl $1702129257, -139(%rbp)
	movl $7566446, -135(%rbp)
	leaq -139(%rbp), %rdx
	movq %rdi, %rcx
	callq json__JSONNode.object_set_new__1__byteE1_ptr1__ret_voidE1_ptr1
	movslq 128(%rsi), %rdx
	movq %rax, %rcx
	callq json__JSONNode.set_int__1__dataE1_sbits64__ret_voidE1
	leaq -150(%rbp), %rdx
	movl $1886351984, -150(%rbp)
	movl $1769239141, -146(%rbp)
	movw $29541, -142(%rbp)
	movb $0, -140(%rbp)
	movq %rdi, %rcx
	callq json__JSONNode.object_set_new__1__byteE1_ptr1__ret_voidE1_ptr1
	movq %rax, %rdi
	movq %rdi, %rcx
	callq json__JSONNode.set_object__0__ret_voidE1
	movw $29551, -153(%rbp)
	movb $0, -151(%rbp)
	leaq -153(%rbp), %rdx
	movq %rdi, %rcx
	callq json__JSONNode.object_set_new__1__byteE1_ptr1__ret_voidE1_ptr1
	leaq -159(%rbp), %rdx
	movl $1801806953, -159(%rbp)
	movw $97, -155(%rbp)
	movq %rax, %rcx
	callq json__JSONNode.set_string__1__byteE1_ptr1__ret_boolE1
	movl $2003792482, -167(%rbp)
	movl $7497075, -163(%rbp)
	leaq -167(%rbp), %rdx
	movq %rdi, %rcx
	callq json__JSONNode.object_set_new__1__byteE1_ptr1__ret_voidE1_ptr1
	leaq -173(%rbp), %rdx
	movl $1801806953, -173(%rbp)
	movw $97, -169(%rbp)
	movq %rax, %rcx
	callq json__JSONNode.set_string__1__byteE1_ptr1__ret_boolE1
	movl $1769366884, -180(%rbp)
	movw $25955, -176(%rbp)
	movb $0, -174(%rbp)
	leaq -180(%rbp), %rdx
	movq %rdi, %rcx
	callq json__JSONNode.object_set_new__1__byteE1_ptr1__ret_voidE1_ptr1
	leaq -186(%rbp), %rdx
	movl $1801806953, -186(%rbp)
	movw $97, -182(%rbp)
	movq %rax, %rcx
	callq json__JSONNode.set_string__1__byteE1_ptr1__ret_boolE1
	leaq -120(%rbp), %rdx
	movq %rsi, %rcx
	callq standard__discord__d_send_json__2__DISCORD_BOTE1_ptr1__JSONNodeE1_ptr1__ret_boolE1
	movzbl %al, %esi
	leaq -120(%rbp), %rcx
	callq json__JSONNode.__exit__0__ret_voidE1
	movl json__JSON_NULL(%rip), %eax
	movl %eax, -120(%rbp)
	movzbl %sil, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__discord__d_release__2__JSONNodeE1_ptr1__ArenaE1_ptr1__ret_voidE1
	.def standard__discord__d_release__2__JSONNodeE1_ptr1__ArenaE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__discord__d_release__2__JSONNodeE1_ptr1__ArenaE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB29979:
	movq %rdx, %rax
	movl json__JSON_NULL(%rip), %edx
	movl %edx, (%rcx)
	movq %rax, %rcx
	callq standard__memory__allocators__stdarena__arena_destroy__1__ArenaE1_ptr1__ret_voidE1
	leave
	ret
	.text
	.globl standard__discord__d_parse__4__byteE1_ptr1__intE1__JSONNodeE1_ptr1__ArenaE1_ptr1__ret_boolE1
	.def standard__discord__d_parse__4__byteE1_ptr1__intE1__JSONNodeE1_ptr1__ArenaE1_ptr1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__discord__d_parse__4__byteE1_ptr1__intE1__JSONNodeE1_ptr1__ArenaE1_ptr1__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $112, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
.LB29985:
	movq %rcx, %rax
	movl %edx, %esi
	movq %r8, %rdi
	movq %r9, %rbx
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -72(%rbp)
	movups .LZERO+32(%rip), %xmm15
	movups %xmm15, -40(%rbp)
	vzeroupper
	leaq -72(%rbp), %rcx
	movq %rax, %rdx
	movq %rsi, %r8
	movq %rbx, %r9
	callq json__JSONParser.__init__3__byteE1_ptr1__intE1__standard__memory__allocators__stdarena__ArenaE1_ptr1__ret_thisE1
	movslq %esi, %rax
	movabsq $2863311531, %rcx
	imulq %rax, %rcx
	sarq $33, %rcx
	shrq $63, %rax
	addl %ecx, %eax
	incl %eax
	imull $104, %eax, %eax
	shll $1, %eax
	addq %rsi, %rax
	leaq 1(%rax), %rdx
	movq %rbx, %rcx
	callq standard__memory__allocators__stdarena__arena_init_sized__2__ArenaE1_ptr1__dataE1_ubits64__ret_voidE1
	leaq -72(%rbp), %rcx
	movq %rdi, %rdx
	callq json__JSONParser.parse__1__JSONNodeE1_ptr1__ret_boolE1
	leaq -72(%rbp), %rcx
	callq json__JSONParser.ok__0__ret_boolE1
	movzbl %al, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__discord__d_fill_event__2__JSONNodeE1_ptr1__DISCORD_EVENTE1_ptr1__ret_voidE1
	.def standard__discord__d_fill_event__2__JSONNodeE1_ptr1__DISCORD_EVENTE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__discord__d_fill_event__2__JSONNodeE1_ptr1__DISCORD_EVENTE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $112, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB30016:
	movq %rdx, %rdi
	leaq -25(%rbp), %rdx
	movq %rcx, %rsi
	movl $1818850663, -25(%rbp)
	movl $1684627300, -21(%rbp)
	movb $0, -17(%rbp)
	movq %rsi, %rcx
	callq json__JSONNode.object_get__1__byteE1_ptr1__ret_voidE1_ptr1
	movq %rax, %rcx
	movq %rdi, %rdx
	movl $32, %r8d
	callq standard__discord__d_get_str__3__JSONNodeE1_ptr1__byteE1_ptr1__intE1__ret_intE1
	leaq -36(%rbp), %rdx
	movl $1851877475, -36(%rbp)
	movl $1600939374, -32(%rbp)
	movw $25705, -28(%rbp)
	movb $0, -26(%rbp)
	movq %rsi, %rcx
	callq json__JSONNode.object_get__1__byteE1_ptr1__ret_voidE1_ptr1
	leaq 32(%rdi), %rdx
	movl $32, %r8d
	movq %rax, %rcx
	callq standard__discord__d_get_str__3__JSONNodeE1_ptr1__byteE1_ptr1__intE1__ret_intE1
	movw $25705, -39(%rbp)
	movb $0, -37(%rbp)
	leaq -39(%rbp), %rdx
	movq %rsi, %rcx
	callq json__JSONNode.object_get__1__byteE1_ptr1__ret_voidE1_ptr1
	leaq 64(%rdi), %rdx
	movl $32, %r8d
	movq %rax, %rcx
	callq standard__discord__d_get_str__3__JSONNodeE1_ptr1__byteE1_ptr1__intE1__ret_intE1
	movl $1953394531, -47(%rbp)
	movl $7630437, -43(%rbp)
	leaq -47(%rbp), %rdx
	movq %rsi, %rcx
	callq json__JSONNode.object_get__1__byteE1_ptr1__ret_voidE1_ptr1
	leaq 232(%rdi), %rdx
	movl $4100, %r8d
	movq %rax, %rcx
	callq standard__discord__d_get_str__3__JSONNodeE1_ptr1__byteE1_ptr1__intE1__ret_intE1
	leaq -54(%rbp), %rdx
	movq %rsi, %rcx
	movl %eax, 228(%rdi)
	movl $0, 224(%rdi)
	movb $0, 96(%rdi)
	movb $0, 128(%rdi)
	movl $1752462689, -54(%rbp)
	movw $29295, -50(%rbp)
	movb $0, -48(%rbp)
	callq json__JSONNode.object_get__1__byteE1_ptr1__ret_voidE1_ptr1
	movq %rax, %rsi
	testq %rsi, %rsi
	jne .LB30117
.LB30118:
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB30117:
	movw $25705, -57(%rbp)
	movb $0, -55(%rbp)
	leaq -57(%rbp), %rdx
	movq %rsi, %rcx
	callq json__JSONNode.object_get__1__byteE1_ptr1__ret_voidE1_ptr1
	leaq 96(%rdi), %rdx
	movl $32, %r8d
	movq %rax, %rcx
	callq standard__discord__d_get_str__3__JSONNodeE1_ptr1__byteE1_ptr1__intE1__ret_intE1
	movl $1919251317, -66(%rbp)
	movl $1701667182, -62(%rbp)
	movb $0, -58(%rbp)
	leaq -66(%rbp), %rdx
	movq %rsi, %rcx
	callq json__JSONNode.object_get__1__byteE1_ptr1__ret_voidE1_ptr1
	leaq 128(%rdi), %rdx
	movl $96, %r8d
	movq %rax, %rcx
	callq standard__discord__d_get_str__3__JSONNodeE1_ptr1__byteE1_ptr1__intE1__ret_intE1
	movl $7630690, -70(%rbp)
	leaq -70(%rbp), %rdx
	movq %rsi, %rcx
	callq json__JSONNode.object_get__1__byteE1_ptr1__ret_voidE1_ptr1
	movq %rax, %rsi
	testq %rsi, %rsi
	jne .LB30164
.LB30166:
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB30164:
	movq %rsi, %rcx
	callq json__JSONNode.is_bool__0__ret_boolE1
	testb %al, %al
	je .LB30166
.LB30169:
	movq %rsi, %rcx
	callq json__JSONNode.as_bool__0__ret_boolE1
	testb %al, %al
	je .LB30166
.LB30174:
	movl $1, 224(%rdi)
	jmp .LB30166
	.text
	.globl standard__discord__discord_close__1__DISCORD_BOTE1_ptr1__ret_voidE1
	.def standard__discord__discord_close__1__DISCORD_BOTE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__discord__discord_close__1__DISCORD_BOTE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB30179:
	movq %rcx, %rsi
	cmpl $0, 186140(%rsi)
	jne .LB30186
.LB30187:
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB30186:
	leaq 544(%rsi), %rdi
	movq %rdi, %rcx
	movl $1000, %edx
	callq standard__web__ws_close__2__WEB_STREAME1_ptr1__intE1__ret_voidE1
	movq %rdi, %rcx
	callq standard__web__web_close__1__WEB_STREAME1_ptr1__ret_voidE1
	movl $0, 186140(%rsi)
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__discord__discord_connect__1__DISCORD_BOTE1_ptr1__ret_intE1
	.def standard__discord__discord_connect__1__DISCORD_BOTE1_ptr1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__discord__discord_connect__1__DISCORD_BOTE1_ptr1__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $304, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
	movq %r14, -48(%rbp)
	movq %r15, -56(%rbp)
.LB30195:
	movq %rcx, %rsi
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -80(%rbp)
	movq .LZERO+16(%rip), %r10
	movq %r10, -64(%rbp)
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -184(%rbp)
	vmovdqu .LZERO+32(%rip), %ymm15
	vmovdqu %ymm15, -152(%rbp)
	vmovdqu .LZERO+64(%rip), %ymm15
	vmovdqu %ymm15, -120(%rbp)
	movq .LZERO+96(%rip), %r10
	movq %r10, -88(%rbp)
	vzeroupper
	leaq -184(%rbp), %rcx
	callq json__JSONNode.__init__0__ret_thisE1
	movl $0, -188(%rbp)
	movq %rsi, %rcx
	callq standard__discord__discord_close__1__DISCORD_BOTE1_ptr1__ret_voidE1
	movl $0, 186144(%rsi)
	movl $0, 441756(%rsi)
	movq $0, 441748(%rsi)
	leaq 544(%rsi), %rdi
	leaq 5696(%rsi), %rbx
	leaq 148(%rsi), %r12
	movl 532(%rsi), %r13d
	movl 540(%rsi), %r14d
	movq 136(%rsi), %r15
	movl 144(%rsi), %eax
	movq %rax, -224(%rbp)
	callq standard__discord__d_unix_now__0__ret_dataE1_sbits64
	movq %r14, 32(%rsp)
	movq %r15, 40(%rsp)
	movq -224(%rbp), %rcx
	movzwl %r13w, %r9d
	movq %rbx, %rdx
	movq %r12, %r8
	movq %rcx, 48(%rsp)
	movq $1, 56(%rsp)
	movq %rax, 64(%rsp)
	movq %rdi, %rcx
	callq standard__web__web_connect__9__WEB_STREAME1_ptr1__TLS13_CONNE1_ptr1__byteE1_ptr1__dataE1_ubits16__intE1__X509_CERTE1_ptr1__intE1__intE1__dataE1_sbits64__ret_intE1
	testl %eax, %eax
	jne .LB30243
.LB30244:
	leaq 544(%rsi), %rdi
	leaq 148(%rsi), %rdx
	leaq 340(%rsi), %r8
	movq %rdi, %rcx
	xorl %r9d, %r9d
	callq standard__web__ws_handshake__4__WEB_STREAME1_ptr1__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__ret_boolE1
	testb %al, %al
	je .LB30259
.LB30260:
	movl $1, 186140(%rsi)
	leaq 544(%rsi), %rcx
	leaq 371748(%rsi), %rdx
	leaq -188(%rbp), %r9
	movl $70000, %r8d
	callq standard__web__ws_recv__4__WEB_STREAME1_ptr1__byteE1_ptr1__intE1__intE1_ptr1__ret_intE1
	testl %eax, %eax
	jle .LB30274
.LB30275:
	leaq 371748(%rsi), %rcx
	leaq -184(%rbp), %r8
	leaq -80(%rbp), %r9
	movq %rax, %rdx
	callq standard__discord__d_parse__4__byteE1_ptr1__intE1__JSONNodeE1_ptr1__ArenaE1_ptr1__ret_boolE1
	testb %al, %al
	je .LB30285
.LB30286:
	movw $28783, -191(%rbp)
	movb $0, -189(%rbp)
	leaq -191(%rbp), %rdx
	leaq -184(%rbp), %rcx
	callq json__JSONNode.object_get__1__byteE1_ptr1__ret_voidE1_ptr1
	testq %rax, %rax
	je .LB30302
.LB30303:
	movq %rax, %rcx
	callq json__JSONNode.as_int__0__ret_dataE1_sbits64
	cmpq $10, %rax
	jne .LB30311
.LB30312:
	movw $100, -193(%rbp)
	leaq -193(%rbp), %rdx
	leaq -184(%rbp), %rcx
	callq json__JSONNode.object_get__1__byteE1_ptr1__ret_voidE1_ptr1
	testq %rax, %rax
	jne .LB30328
.LB30329:
	movl $41250, %edi
.LB30330:
	leaq -184(%rbp), %rcx
	leaq -80(%rbp), %rdx
	callq standard__discord__d_release__2__JSONNodeE1_ptr1__ArenaE1_ptr1__ret_voidE1
	movq %rdi, 441760(%rsi)
	callq standard__time__time_now__0__ret_dataE1_sbits64
	movq %rax, %rcx
	callq standard__time__ns_to_ms__1__dataE1_sbits64__ret_dataE1_sbits64
	addq %rdi, %rax
	movq %rax, 441768(%rsi)
	movq %rsi, %rcx
	callq standard__discord__d_send_identify__1__DISCORD_BOTE1_ptr1__ret_boolE1
	testb %al, %al
	je .LB30377
.LB30378:
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
.LB30328:
	leaq -212(%rbp), %rdx
	movl $1918985576, -212(%rbp)
	movl $1634034292, -208(%rbp)
	movl $1852399476, -204(%rbp)
	movl $1987208564, -200(%rbp)
	movw $27745, -196(%rbp)
	movb $0, -194(%rbp)
	movq %rax, %rcx
	callq json__JSONNode.object_get__1__byteE1_ptr1__ret_voidE1_ptr1
	testq %rax, %rax
	jne .LB30360
.LB30361:
	movl $41250, %eax
.LB30362:
	movq %rax, %rdi
	jmp .LB30330
.LB30360:
	movq %rax, %rcx
	callq json__JSONNode.as_int__0__ret_dataE1_sbits64
	jmp .LB30362
.LB30377:
	movq %rsi, %rcx
	callq standard__discord__discord_close__1__DISCORD_BOTE1_ptr1__ret_voidE1
	movl $203, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB30311:
	leaq -184(%rbp), %rcx
	leaq -80(%rbp), %rdx
	callq standard__discord__d_release__2__JSONNodeE1_ptr1__ArenaE1_ptr1__ret_voidE1
	movq %rsi, %rcx
	callq standard__discord__discord_close__1__DISCORD_BOTE1_ptr1__ret_voidE1
	movl $202, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB30302:
	leaq -184(%rbp), %rcx
	leaq -80(%rbp), %rdx
	callq standard__discord__d_release__2__JSONNodeE1_ptr1__ArenaE1_ptr1__ret_voidE1
	movq %rsi, %rcx
	callq standard__discord__discord_close__1__DISCORD_BOTE1_ptr1__ret_voidE1
	movl $202, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB30285:
	leaq -184(%rbp), %rcx
	leaq -80(%rbp), %rdx
	callq standard__discord__d_release__2__JSONNodeE1_ptr1__ArenaE1_ptr1__ret_voidE1
	movq %rsi, %rcx
	callq standard__discord__discord_close__1__DISCORD_BOTE1_ptr1__ret_voidE1
	movl $202, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB30274:
	movq %rsi, %rcx
	callq standard__discord__discord_close__1__DISCORD_BOTE1_ptr1__ret_voidE1
	movl $201, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB30259:
	movq %rdi, %rcx
	callq standard__web__web_close__1__WEB_STREAME1_ptr1__ret_voidE1
	movl $200, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB30243:
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
	.globl standard__discord__discord_poll__3__DISCORD_BOTE1_ptr1__DISCORD_EVENTE1_ptr1__intE1__ret_intE1
	.def standard__discord__discord_poll__3__DISCORD_BOTE1_ptr1__DISCORD_EVENTE1_ptr1__intE1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__discord__discord_poll__3__DISCORD_BOTE1_ptr1__DISCORD_EVENTE1_ptr1__intE1__ret_intE1:
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
.LB30382:
	movq %rcx, %rsi
	movq %rdx, %rdi
	movl %r8d, %ebx
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -80(%rbp)
	movq .LZERO+16(%rip), %r10
	movq %r10, -64(%rbp)
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -184(%rbp)
	vmovdqu .LZERO+32(%rip), %ymm15
	vmovdqu %ymm15, -152(%rbp)
	vmovdqu .LZERO+64(%rip), %ymm15
	vmovdqu %ymm15, -120(%rbp)
	movq .LZERO+96(%rip), %r10
	movq %r10, -88(%rbp)
	vzeroupper
	leaq -184(%rbp), %rcx
	callq json__JSONNode.__init__0__ret_thisE1
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -224(%rbp)
	movq .LZERO+32(%rip), %r10
	movq %r10, -192(%rbp)
	vzeroupper
	movl $0, -228(%rbp)
	cmpl $0, 186140(%rsi)
	je .LB30404
.LB30405:
	callq standard__time__time_now__0__ret_dataE1_sbits64
	movq %rax, %rcx
	callq standard__time__ns_to_ms__1__dataE1_sbits64__ret_dataE1_sbits64
	addq %rax, %rbx
	xorl %r12d, %r12d
	xorl %r13d, %r13d
	xorl %r14d, %r14d
.LB30412:
	callq standard__time__time_now__0__ret_dataE1_sbits64
	movq %rax, %rcx
	callq standard__time__ns_to_ms__1__dataE1_sbits64__ret_dataE1_sbits64
	movq %rax, %r15
	cmpq 441768(%rsi), %r15
	jge .LB30422
.LB30424:
	movq 441768(%rsi), %rax
	subq %r15, %rax
	movq %rbx, %rcx
	subq %r15, %rcx
	leaq 544(%rsi), %r15
	cmpq %rax, %rcx
	cmovl %rcx, %rax
	xorl %ecx, %ecx
	testq %rax, %rax
	cmovs %rcx, %rax
	movl %eax, %edx
	movq %r15, %rcx
	callq standard__web__web_wait_readable__2__WEB_STREAME1_ptr1__intE1__ret_intE1
	testl %eax, %eax
	js .LB30472
.LB30473:
	testl %eax, %eax
	je .LB30478
.LB30479:
	leaq 371748(%rsi), %rdx
	leaq -228(%rbp), %r9
	movq %r15, %rcx
	movl $70000, %r8d
	callq standard__web__ws_recv__4__WEB_STREAME1_ptr1__byteE1_ptr1__intE1__intE1_ptr1__ret_intE1
	movl %eax, %r13d
	cmpl $4294967293, %r13d
	je .LB30496
.LB30497:
	testl %r13d, %r13d
	js .LB30501
.LB30502:
	leaq 371748(%rsi), %rcx
	leaq -184(%rbp), %r8
	leaq -80(%rbp), %r9
	movl json__JSON_NULL(%rip), %eax
	movq %r13, %rdx
	movl %eax, -184(%rbp)
	callq standard__discord__d_parse__4__byteE1_ptr1__intE1__JSONNodeE1_ptr1__ArenaE1_ptr1__ret_boolE1
	testb %al, %al
	je .LB30538
.LB30539:
	movw $28783, -231(%rbp)
	movb $0, -229(%rbp)
	leaq -231(%rbp), %rdx
	leaq -184(%rbp), %rcx
	callq json__JSONNode.object_get__1__byteE1_ptr1__ret_voidE1_ptr1
	movq %rax, %r12
	testq %r12, %r12
	jne .LB30554
.LB30555:
	movl $4294967295, %r14d
.LB30556:
	cmpl $1, %r14d
	je .LB30562
.LB30563:
	cmpl $7, %r14d
	je .LB30575
.LB30570:
	cmpl $9, %r14d
	je .LB30575
.LB30576:
	testl %r14d, %r14d
	je .LB30583
.LB30584:
.LB30585:
	leaq -184(%rbp), %rcx
	leaq -80(%rbp), %rdx
	callq standard__discord__d_release__2__JSONNodeE1_ptr1__ArenaE1_ptr1__ret_voidE1
	jmp .LB30412
.LB30422:
	movq %rsi, %rcx
	callq standard__discord__d_send_heartbeat__1__DISCORD_BOTE1_ptr1__ret_boolE1
	testb %al, %al
	je .LB30429
.LB30430:
	movq %r15, %rax
	addq 441760(%rsi), %rax
	movq %rax, 441768(%rsi)
	jmp .LB30424
.LB30554:
	movq %r12, %rcx
	callq json__JSONNode.as_int__0__ret_dataE1_sbits64
	movl %eax, %r14d
	cmpl $1, %r14d
	je .LB30562
	jmp .LB30563
.LB30583:
	movw $115, -233(%rbp)
	leaq -233(%rbp), %rdx
	leaq -184(%rbp), %rcx
	callq json__JSONNode.object_get__1__byteE1_ptr1__ret_voidE1_ptr1
	movq %rax, %r12
	testq %r12, %r12
	jne .LB30597
.LB30599:
	movw $116, -235(%rbp)
	leaq -235(%rbp), %rdx
	leaq -184(%rbp), %rcx
	callq json__JSONNode.object_get__1__byteE1_ptr1__ret_voidE1_ptr1
	leaq -224(%rbp), %rdx
	movq %rax, %r12
	movl $40, %r8d
	movq %r12, %rcx
	callq standard__discord__d_get_str__3__JSONNodeE1_ptr1__byteE1_ptr1__intE1__ret_intE1
	cmpb $77, -224(%rbp)
	jne .LB30696
.LB30625:
	cmpb $69, -223(%rbp)
	jne .LB30696
.LB30632:
	cmpb $83, -222(%rbp)
	jne .LB30696
.LB30639:
	cmpb $83, -221(%rbp)
	jne .LB30696
.LB30646:
	cmpb $65, -220(%rbp)
	jne .LB30696
.LB30653:
	cmpb $71, -219(%rbp)
	jne .LB30696
.LB30660:
	cmpb $69, -218(%rbp)
	jne .LB30696
.LB30667:
	cmpb $95, -217(%rbp)
	jne .LB30696
.LB30674:
	cmpb $67, -216(%rbp)
	jne .LB30696
.LB30681:
	cmpb $69, -211(%rbp)
	jne .LB30696
.LB30688:
	cmpb $0, -210(%rbp)
	je .LB30695
.LB30696:
	jmp .LB30585
.LB30597:
	movq %r12, %rcx
	callq json__JSONNode.is_int__0__ret_boolE1
	testb %al, %al
	je .LB30599
.LB30602:
	movq %r12, %rcx
	callq json__JSONNode.as_int__0__ret_dataE1_sbits64
	movq %rax, 441748(%rsi)
	movl $1, 441756(%rsi)
	jmp .LB30599
.LB30695:
	movw $100, -237(%rbp)
	leaq -237(%rbp), %rdx
	leaq -184(%rbp), %rcx
	callq json__JSONNode.object_get__1__byteE1_ptr1__ret_voidE1_ptr1
	testq %rax, %rax
	jne .LB30709
.LB30711:
	leaq -184(%rbp), %rcx
	leaq -80(%rbp), %rdx
	callq standard__discord__d_release__2__JSONNodeE1_ptr1__ArenaE1_ptr1__ret_voidE1
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
.LB30709:
	movq %rax, %rcx
	movq %rdi, %rdx
	callq standard__discord__d_fill_event__2__JSONNodeE1_ptr1__DISCORD_EVENTE1_ptr1__ret_voidE1
	jmp .LB30711
.LB30575:
	leaq -184(%rbp), %rcx
	leaq -80(%rbp), %rdx
	callq standard__discord__d_release__2__JSONNodeE1_ptr1__ArenaE1_ptr1__ret_voidE1
	movq %rsi, %rcx
	callq standard__discord__discord_close__1__DISCORD_BOTE1_ptr1__ret_voidE1
	movabsq $4294967295, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB30562:
	leaq -184(%rbp), %rcx
	leaq -80(%rbp), %rdx
	callq standard__discord__d_release__2__JSONNodeE1_ptr1__ArenaE1_ptr1__ret_voidE1
	movq %rsi, %rcx
	callq standard__discord__d_send_heartbeat__1__DISCORD_BOTE1_ptr1__ret_boolE1
	jmp .LB30412
.LB30538:
	leaq -184(%rbp), %rcx
	leaq -80(%rbp), %rdx
	callq standard__discord__d_release__2__JSONNodeE1_ptr1__ArenaE1_ptr1__ret_voidE1
	jmp .LB30412
.LB30501:
	movl $4294967295, 186144(%rsi)
	cmpl $4294967294, %r13d
	je .LB30510
.LB30512:
	movq %rsi, %rcx
	callq standard__discord__discord_close__1__DISCORD_BOTE1_ptr1__ret_voidE1
	movabsq $4294967295, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB30510:
	movzbl 371748(%rsi), %eax
	movzbl 371749(%rsi), %ecx
	movzbl %al, %eax
	movzbl %cl, %ecx
	shll $8, %eax
	orl %ecx, %eax
	movl %eax, 186144(%rsi)
	jmp .LB30512
.LB30496:
	jmp .LB30412
.LB30478:
	callq standard__time__time_now__0__ret_dataE1_sbits64
	movq %rax, %rcx
	callq standard__time__ns_to_ms__1__dataE1_sbits64__ret_dataE1_sbits64
	cmpq %rbx, %rax
	jge .LB30484
.LB30485:
	jmp .LB30412
.LB30484:
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
.LB30472:
	movabsq $4294967295, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB30429:
	movabsq $4294967295, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB30404:
	movabsq $4294967295, %rax
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
	.globl standard__discord__discord_send_message__3__DISCORD_BOTE1_ptr1__byteE1_ptr1__byteE1_ptr1__ret_intE1
	.def standard__discord__discord_send_message__3__DISCORD_BOTE1_ptr1__byteE1_ptr1__byteE1_ptr1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__discord__discord_send_message__3__DISCORD_BOTE1_ptr1__byteE1_ptr1__byteE1_ptr1__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	movl $19440, %eax
	callq __chkstk
	subq %rax, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
	movq %r14, -48(%rbp)
	movq %r15, -56(%rbp)
.LB30716:
	movq %rcx, %rsi
	movq %rdx, %rbx
	movq %r8, %r12
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -160(%rbp)
	vmovdqu .LZERO+32(%rip), %ymm15
	vmovdqu %ymm15, -128(%rbp)
	vmovdqu .LZERO+64(%rip), %ymm15
	vmovdqu %ymm15, -96(%rbp)
	movq .LZERO+96(%rip), %r10
	movq %r10, -64(%rbp)
	vzeroupper
	leaq -160(%rbp), %rcx
	callq json__JSONNode.__init__0__ret_thisE1
	leaq -16544(%rbp), %rax
	movq %rax, %rdi
	xorl %eax, %eax
	movl $16384, %ecx
	rep stosb
	leaq -16704(%rbp), %rax
	movq %rax, %rdi
	xorl %eax, %eax
	movl $160, %ecx
	rep stosb
	leaq -17104(%rbp), %rax
	movq %rax, %rdi
	xorl %eax, %eax
	movl $400, %ecx
	rep stosb
	leaq -19152(%rbp), %rax
	movq %rax, %rdi
	xorl %eax, %eax
	movl $2048, %ecx
	rep stosb
	leaq -160(%rbp), %rcx
	leaq -19166(%rbp), %rdi
	leaq -19177(%rbp), %r13
	movl $0, -19156(%rbp)
	movl $1936026927, -19166(%rbp)
	movl $1701273971, -19162(%rbp)
	movw $115, -19158(%rbp)
	movl $1634231087, -19177(%rbp)
	movl $1818586734, -19173(%rbp)
	movw $12147, -19169(%rbp)
	movb $0, -19167(%rbp)
	callq json__JSONNode.set_object__0__ret_voidE1
	movl $1953394531, -19185(%rbp)
	movl $7630437, -19181(%rbp)
	leaq -19185(%rbp), %rdx
	leaq -160(%rbp), %rcx
	callq json__JSONNode.object_set_new__1__byteE1_ptr1__ret_voidE1_ptr1
	movq %rax, %rcx
	movq %r12, %rdx
	callq json__JSONNode.set_string__1__byteE1_ptr1__ret_boolE1
	leaq -16544(%rbp), %rdx
	leaq -160(%rbp), %rcx
	xorl %r8d, %r8d
	movl $16384, %r9d
	callq json__serialize__4__JSONNodeE1_ptr1__byteE1_ptr1__intE1__intE1__ret_intE1
	movl %eax, %r12d
	leaq -160(%rbp), %rcx
	callq json__JSONNode.__exit__0__ret_voidE1
	movl json__JSON_NULL(%rip), %eax
	movl %eax, -160(%rbp)
	testl %r12d, %r12d
	jle .LB30783
.LB30784:
	leaq -16704(%rbp), %rcx
	leaq 436(%rsi), %r8
	movl $160, %edx
	callq standard__discord__d_copy_str__3__byteE1_ptr1__intE1__byteE1_ptr1__ret_voidE1
	leaq -16704(%rbp), %rcx
	callq standard__discord__d_len__1__byteE1_ptr1__ret_intE1
	xorl %ecx, %ecx
.LB30793:
	movslq %ecx, %rdx
	movzbl (%r13,%rdx,1), %edx
	testb %dl, %dl
	je .LB30796
.LB30794:
	movslq %eax, %r8
	movb %dl, -16704(%rbp,%r8,1)
	incl %eax
	incl %ecx
	jmp .LB30793
.LB30796:
	xorl %ecx, %ecx
.LB30813:
	movslq %ecx, %rdx
	cmpb $0, (%rbx,%rdx,1)
	je .LB30816
.LB30823:
	cmpl $140, %eax
	jge .LB30816
.LB30814:
	movslq %ecx, %rdx
	movzbl (%rbx,%rdx,1), %edx
	movslq %eax, %r8
	movb %dl, -16704(%rbp,%r8,1)
	incl %eax
	incl %ecx
	jmp .LB30813
.LB30816:
	xorl %ecx, %ecx
.LB30838:
	movslq %ecx, %rdx
	movzbl (%rdi,%rdx,1), %edx
	testb %dl, %dl
	je .LB30841
.LB30839:
	movslq %eax, %r8
	movb %dl, -16704(%rbp,%r8,1)
	incl %eax
	incl %ecx
	jmp .LB30838
.LB30841:
	movslq %eax, %rax
	leaq -19324(%rbp), %rcx
	movb $0, -16704(%rbp,%rax,1)
	leaq -19205(%rbp), %rax
	movl $1752462657, -19205(%rbp)
	movl $2053730927, -19201(%rbp)
	movl $1869182049, -19197(%rbp)
	movl $1109408366, -19193(%rbp)
	movl $2126959, -19189(%rbp)
	movl $1866664461, -19324(%rbp)
	movl $1852142702, -19320(%rbp)
	movl $2035559796, -19316(%rbp)
	movl $540697968, -19312(%rbp)
	movl $1819308129, -19308(%rbp)
	movl $1952539497, -19304(%rbp)
	movl $795766633, -19300(%rbp)
	movl $1852797802, -19296(%rbp)
	movl $1934952973, -19292(%rbp)
	movl $1093497445, -19288(%rbp)
	movl $1953391975, -19284(%rbp)
	movl $1766072378, -19280(%rbp)
	movl $1919902579, -19276(%rbp)
	movl $1953448548, -19272(%rbp)
	movl $1952983072, -19268(%rbp)
	movl $980643956, -19264(%rbp)
	movl $1768369967, -19260(%rbp)
	movl $1651861620, -19256(%rbp)
	movl $1836016430, -19252(%rbp)
	movl $1953917743, -19248(%rbp)
	movl $1634039656, -19244(%rbp)
	movl $1714386036, -19240(%rbp)
	movl $746091884, -19236(%rbp)
	movl $825110560, -19232(%rbp)
	movl $1124732201, -19228(%rbp)
	movl $1701736047, -19224(%rbp)
	movl $1869182051, -19220(%rbp)
	movl $1663056494, -19216(%rbp)
	movl $1702063980, -19212(%rbp)
	movw $2573, -19208(%rbp)
	movb $0, -19206(%rbp)
	xorl %edx, %edx
	xorl %edi, %edi
.LB31006:
	movslq %edi, %r8
	movzbl (%rax,%r8,1), %r8d
	testb %r8b, %r8b
	je .LB31009
.LB31007:
	movslq %edx, %r9
	movb %r8b, -17104(%rbp,%r9,1)
	incl %edx
	incl %edi
	jmp .LB31006
.LB31009:
	xorl %eax, %eax
.LB31026:
	movslq %eax, %rdi
	cmpb $0, (%rsi,%rdi,1)
	je .LB31029
.LB31038:
	cmpl $200, %edx
	jge .LB31029
.LB31027:
	movslq %eax, %rdi
	movzbl (%rsi,%rdi,1), %edi
	movslq %edx, %r8
	movb %dil, -17104(%rbp,%r8,1)
	incl %edx
	incl %eax
	jmp .LB31026
.LB31029:
	xorl %eax, %eax
.LB31055:
	movslq %eax, %rdi
	movzbl (%rcx,%rdi,1), %edi
	testb %dil, %dil
	je .LB31058
.LB31056:
	movslq %edx, %r8
	movb %dil, -17104(%rbp,%r8,1)
	incl %edx
	incl %eax
	jmp .LB31055
.LB31058:
	movslq %edx, %rax
	leaq 186152(%rsi), %rdi
	leaq 191304(%rsi), %rbx
	leaq 244(%rsi), %r13
	movb $0, -17104(%rbp,%rax,1)
	movl 536(%rsi), %r14d
	movl 540(%rsi), %r15d
	movq 136(%rsi), %rax
	movq %rax, -19344(%rbp)
	movl 144(%rsi), %eax
	movq %rax, -19352(%rbp)
	callq standard__discord__d_unix_now__0__ret_dataE1_sbits64
	movq %r15, 32(%rsp)
	movq -19344(%rbp), %rcx
	movzwl %r14w, %r9d
	movq %rbx, %rdx
	movq %r13, %r8
	movq %rcx, 40(%rsp)
	movq -19352(%rbp), %rcx
	movq %rcx, 48(%rsp)
	movq $1, 56(%rsp)
	movq %rax, 64(%rsp)
	movq %rdi, %rcx
	callq standard__web__web_connect__9__WEB_STREAME1_ptr1__TLS13_CONNE1_ptr1__byteE1_ptr1__dataE1_ubits16__intE1__X509_CERTE1_ptr1__intE1__intE1__dataE1_sbits64__ret_intE1
	testl %eax, %eax
	jne .LB31106
.LB31107:
	leaq 244(%rsi), %r8
	leaq -16704(%rbp), %r9
	leaq -17104(%rbp), %rax
	leaq -16544(%rbp), %rcx
	leaq -19152(%rbp), %rdx
	leaq -19329(%rbp), %rsi
	leaq -19156(%rbp), %rbx
	movl $0, -19156(%rbp)
	movl $1414745936, -19329(%rbp)
	movb $0, -19325(%rbp)
	movq %rax, 32(%rsp)
	movq %rcx, 40(%rsp)
	movq %r12, 48(%rsp)
	movq %rdi, %rcx
	movq %rdx, 56(%rsp)
	movq $2047, 64(%rsp)
	movq %rbx, 72(%rsp)
	movq %rsi, %rdx
	callq standard__web__http_request__10__WEB_STREAME1_ptr1__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__intE1__byteE1_ptr1__intE1__intE1_ptr1__ret_intE1
	movl %eax, %esi
	movq %rdi, %rcx
	callq standard__web__web_close__1__WEB_STREAME1_ptr1__ret_voidE1
	testl %esi, %esi
	js .LB31132
.LB31133:
	movl -19156(%rbp), %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB31132:
	movabsq $4294967295, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB31106:
	movabsq $4294967295, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB30783:
	movabsq $4294967295, %rax
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
	.globl standard__discord__d_load_token__2__DISCORD_BOTE1_ptr1__byteE1_ptr1__ret_intE1
	.def standard__discord__d_load_token__2__DISCORD_BOTE1_ptr1__byteE1_ptr1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__discord__d_load_token__2__DISCORD_BOTE1_ptr1__byteE1_ptr1__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $96, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB31137:
	movq %rcx, %rsi
	movq %rdx, %rcx
	movq %rsi, %rdx
	movl $127, %r8d
	callq standard__io__file__read_file__3__byteE1_ptr1__byteE1_arr__intE1__ret_intE1
	movl %eax, %edi
	testl %edi, %edi
	jle .LB31150
.LB31151:
	movslq %edi, %rax
	movb $0, (%rsi,%rax,1)
	movslq %edi, %rax
	xorl %ecx, %ecx
.LB31206:
	cmpq %rax, %rcx
	jge .LB31209
.LB31207:
	cmpb $10, (%rsi,%rcx,1)
	je .LB31232
.LB31221:
	cmpb $13, (%rsi,%rcx,1)
	je .LB31232
.LB31233:
	incq %rcx
	cmpq %rax, %rcx
	jl .LB31207
	jmp .LB31209
.LB31232:
	movb $0, (%rsi,%rcx,1)
	movl %edi, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB31209:
	movl %edi, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB31150:
	leaq -54(%rbp), %rcx
	movl $1668508004, -54(%rbp)
	movl $979661423, -50(%rbp)
	movl $1802466336, -46(%rbp)
	movl $1713401445, -42(%rbp)
	movl $543517801, -38(%rbp)
	movl $1936943469, -34(%rbp)
	movl $543649385, -30(%rbp)
	movl $1696625263, -26(%rbp)
	movl $2037674093, -22(%rbp)
	movw $10, -18(%rbp)
	callq standard__io__console__print__1__byteE1_arr__ret_voidE1
	callq standard__io__console__flush__0__ret_voidE1
	movl %edi, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__discord__d_load_roots__0__ret_intE1
	.def standard__discord__d_load_roots__0__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__discord__d_load_roots__0__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $304, %rsp
	movq %rsi, -8(%rbp)
.LB31290:
	leaq -43(%rbp), %rcx
	leaq standard__discord__d_pem(%rip), %rdx
	movl $1668572463, -43(%rbp)
	movl $1819505455, -39(%rbp)
	movl $1919247151, -35(%rbp)
	movl $1664054132, -31(%rbp)
	movl $1700998497, -27(%rbp)
	movl $1718187122, -23(%rbp)
	movl $1952539497, -19(%rbp)
	movl $1663988581, -15(%rbp)
	movw $29810, -11(%rbp)
	movb $0, -9(%rbp)
	movl $400000, %r8d
	callq standard__io__file__read_file__3__byteE1_ptr1__byteE1_arr__intE1__ret_intE1
	testl %eax, %eax
	jle .LB31333
.LB31334:
.LB31335:
	testl %eax, %eax
	jle .LB31353
.LB31354:
	leaq standard__discord__d_pem(%rip), %rcx
	leaq standard__discord__d_der(%rip), %r8
	leaq standard__discord__d_roots(%rip), %rdx
	movq %rdx, 32(%rsp)
	movq $200, 40(%rsp)
	movq %rax, %rdx
	movl $400000, %r9d
	callq standard__crypto__X509__x509_load_pem_bundle__6__byteE1_ptr1__intE1__byteE1_ptr1__intE1__X509_CERTE1_ptr1__intE1__ret_intE1
	movl %eax, %esi
	testl %esi, %esi
	jle .LB31474
.LB31475:
	movl %esi, %eax
	movq -8(%rbp), %rsi
	leave
	ret
.LB31333:
	leaq -54(%rbp), %rcx
	leaq standard__discord__d_pem(%rip), %rdx
	movl $1701011811, -54(%rbp)
	movl $1882092658, -50(%rbp)
	movw $28005, -46(%rbp)
	movb $0, -44(%rbp)
	movl $400000, %r8d
	callq standard__io__file__read_file__3__byteE1_ptr1__byteE1_arr__intE1__ret_intE1
	testl %eax, %eax
	jle .LB31353
	jmp .LB31354
.LB31474:
	leaq -154(%rbp), %rcx
	movl $1668508004, -154(%rbp)
	movl $979661423, -150(%rbp)
	movl $544173600, -146(%rbp)
	movl $1937076852, -142(%rbp)
	movl $543450484, -138(%rbp)
	movl $1953460082, -134(%rbp)
	movl $1881156723, -130(%rbp)
	movl $1663071349, -126(%rbp)
	movl $1919247201, -122(%rbp)
	movl $1701850740, -118(%rbp)
	movl $1747460205, -114(%rbp)
	movl $1936749684, -110(%rbp)
	movl $1664036666, -106(%rbp)
	movl $778859125, -102(%rbp)
	movl $1664050547, -98(%rbp)
	movl $1633890145, -94(%rbp)
	movl $1953654115, -90(%rbp)
	movl $1835364398, -86(%rbp)
	movl $1852383273, -82(%rbp)
	movl $1701344288, -78(%rbp)
	movl $1919907616, -74(%rbp)
	movl $1735289195, -70(%rbp)
	movl $1919509536, -66(%rbp)
	movl $1869898597, -62(%rbp)
	movl $686450, -58(%rbp)
	callq standard__io__console__print__1__byteE1_arr__ret_voidE1
	callq standard__io__console__flush__0__ret_voidE1
	movl %esi, %eax
	movq -8(%rbp), %rsi
	leave
	ret
.LB31353:
	leaq -254(%rbp), %rcx
	movl $1668508004, -254(%rbp)
	movl $979661423, -250(%rbp)
	movl $544173600, -246(%rbp)
	movl $1937076852, -242(%rbp)
	movl $543450484, -238(%rbp)
	movl $1953460082, -234(%rbp)
	movl $1881156723, -230(%rbp)
	movl $1663071349, -226(%rbp)
	movl $1919247201, -222(%rbp)
	movl $1701850740, -218(%rbp)
	movl $1747460205, -214(%rbp)
	movl $1936749684, -210(%rbp)
	movl $1664036666, -206(%rbp)
	movl $778859125, -202(%rbp)
	movl $1664050547, -198(%rbp)
	movl $1633890145, -194(%rbp)
	movl $1953654115, -190(%rbp)
	movl $1835364398, -186(%rbp)
	movl $1852383273, -182(%rbp)
	movl $1701344288, -178(%rbp)
	movl $1919907616, -174(%rbp)
	movl $1735289195, -170(%rbp)
	movl $1919509536, -166(%rbp)
	movl $1869898597, -162(%rbp)
	movl $686450, -158(%rbp)
	callq standard__io__console__print__1__byteE1_arr__ret_voidE1
	callq standard__io__console__flush__0__ret_voidE1
	xorl %eax, %eax
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl standard__discord__discord_start__3__DISCORD_BOTE1_ptr1__byteE1_ptr1__intE1__ret_intE1
	.def standard__discord__discord_start__3__DISCORD_BOTE1_ptr1__byteE1_ptr1__intE1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__discord__discord_start__3__DISCORD_BOTE1_ptr1__byteE1_ptr1__intE1__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB31580:
	movq %rcx, %rsi
	movl %r8d, %edi
	movq %rsi, %rcx
	callq standard__discord__d_load_token__2__DISCORD_BOTE1_ptr1__byteE1_ptr1__ret_intE1
	testl %eax, %eax
	jle .LB31590
.LB31591:
	callq standard__discord__d_load_roots__0__ret_intE1
	testl %eax, %eax
	jle .LB31596
.LB31597:
	movl %edi, 128(%rsi)
	leaq standard__discord__d_roots(%rip), %rcx
	movq %rcx, 136(%rsi)
	movl %eax, 144(%rsi)
	xorl %eax, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB31596:
	movl $1, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB31590:
	movl $1, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
	.text
	.globl standard__discord__discord_next__2__DISCORD_BOTE1_ptr1__DISCORD_EVENTE1_ptr1__ret_intE1
	.def standard__discord__discord_next__2__DISCORD_BOTE1_ptr1__DISCORD_EVENTE1_ptr1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__discord__discord_next__2__DISCORD_BOTE1_ptr1__DISCORD_EVENTE1_ptr1__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
.LB31608:
	movq %rcx, %rsi
	movq %rdx, %rdi
	xorl %ebx, %ebx
	xorl %r12d, %r12d
.LB31613:
	cmpl $0, 186140(%rsi)
	jne .LB31622
.LB31621:
	movq %rsi, %rcx
	callq standard__discord__discord_connect__1__DISCORD_BOTE1_ptr1__ret_intE1
	movl %eax, %ebx
	testl %ebx, %ebx
	jne .LB31629
.LB31630:
.LB31623:
	movq %rsi, %rcx
	movq %rdi, %rdx
	movl $30000, %r8d
	callq standard__discord__discord_poll__3__DISCORD_BOTE1_ptr1__DISCORD_EVENTE1_ptr1__intE1__ret_intE1
	cmpl $1, %eax
	je .LB31639
.LB31640:
	movq %rax, %r12
	cmpl $0, 186140(%rsi)
	je .LB31621
.LB31622:
	jmp .LB31623
.LB31639:
	movl $1, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB31629:
	movl $5000, %ecx
	callq standard__time__sleep_ms__1__dataE1_ubits32__ret_voidE1
	cmpl $0, 186140(%rsi)
	je .LB31621
	jmp .LB31622
	.text
	.globl standard__discord__discord_reply__3__DISCORD_BOTE1_ptr1__DISCORD_EVENTE1_ptr1__byteE1_ptr1__ret_intE1
	.def standard__discord__discord_reply__3__DISCORD_BOTE1_ptr1__DISCORD_EVENTE1_ptr1__byteE1_ptr1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__discord__discord_reply__3__DISCORD_BOTE1_ptr1__DISCORD_EVENTE1_ptr1__byteE1_ptr1__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB31642:
	leaq 32(%rdx), %rdx
	callq standard__discord__discord_send_message__3__DISCORD_BOTE1_ptr1__byteE1_ptr1__byteE1_ptr1__ret_intE1
	leave
	ret
	.text
	.globl standard__discord__discord_content_is__2__DISCORD_EVENTE1_ptr1__byteE1_ptr1__ret_boolE1
	.def standard__discord__discord_content_is__2__DISCORD_EVENTE1_ptr1__byteE1_ptr1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__discord__discord_content_is__2__DISCORD_EVENTE1_ptr1__byteE1_ptr1__ret_boolE1:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
	movq %rdi, -8(%rsp)
.LB31653:
	xorl %eax, %eax
.LB31657:
	movslq %eax, %rsi
	cmpb $0, (%rdx,%rsi,1)
	jne .LB31658
.LB31666:
	cmpb $0, 232(%rcx,%rsi,1)
	je .LB31659
.LB31658:
	movslq %eax, %rsi
	movzbl (%rdx,%rsi,1), %edi
	movzbl 232(%rcx,%rsi,1), %esi
	cmpb %sil, %dil
	jne .LB31688
.LB31689:
	incl %eax
	jmp .LB31657
.LB31659:
	movl $1, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB31688:
	xorl %eax, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
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
	.bss
	.p2align 2
	.globl standard__io__file__file_error_state.GOOD
standard__io__file__file_error_state.GOOD:
	.zero 4
	.section .rdata,"dr"
	.p2align 2
	.globl standard__io__file__file_error_state.NOT_OPEN
standard__io__file__file_error_state.NOT_OPEN:
	.long 1
	.section .rdata,"dr"
	.p2align 2
	.globl standard__io__file__file_error_state.READ_ERROR
standard__io__file__file_error_state.READ_ERROR:
	.long 2
	.section .rdata,"dr"
	.p2align 2
	.globl standard__io__file__file_error_state.WRITE_ERROR
standard__io__file__file_error_state.WRITE_ERROR:
	.long 3
	.section .rdata,"dr"
	.p2align 2
	.globl standard__io__file__file_error_state.SEEK_ERROR
standard__io__file__file_error_state.SEEK_ERROR:
	.long 4
	.section .rdata,"dr"
	.p2align 2
	.globl standard__io__file__file_error_state.ALLOC_ERROR
standard__io__file__file_error_state.ALLOC_ERROR:
	.long 5
	.section .rdata,"dr"
	.p2align 2
	.globl standard__io__file__file_error_state.EOF_REACHED
standard__io__file__file_error_state.EOF_REACHED:
	.long 6
	.section .rdata,"dr"
	.p2align 2
	.globl standard__io__file__file_error_state.DELETE_ERROR
standard__io__file__file_error_state.DELETE_ERROR:
	.long 7
	.section .rdata,"dr"
	.p2align 2
	.globl standard__io__file__file_error_state.RENAME_ERROR
standard__io__file__file_error_state.RENAME_ERROR:
	.long 8
	.section .rdata,"dr"
	.p2align 2
	.globl standard__io__file__file_error_state.COPY_ERROR
standard__io__file__file_error_state.COPY_ERROR:
	.long 9
	.section .rdata,"dr"
	.p2align 4
sockaddr_in.TLD:
	.long 128
	.long 4
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
	.long 64
	.long 8
	.section .rdata,"dr"
	.p2align 4
sockaddr.TLD:
	.long 128
	.long 2
	.long 0
	.long 16
	.long 1
	.long 16
	.long 112
	.long 8
	.bss
	.p2align 2
	.globl socket_type.TCP
socket_type.TCP:
	.zero 4
	.section .rdata,"dr"
	.p2align 2
	.globl socket_type.UDP
socket_type.UDP:
	.long 1
	.bss
	.p2align 2
	.globl socket_error.OK
socket_error.OK:
	.zero 4
	.section .rdata,"dr"
	.p2align 2
	.globl socket_error.NOT_OPEN
socket_error.NOT_OPEN:
	.long 1
	.section .rdata,"dr"
	.p2align 2
	.globl socket_error.BIND_FAILED
socket_error.BIND_FAILED:
	.long 2
	.section .rdata,"dr"
	.p2align 2
	.globl socket_error.CONNECT_FAILED
socket_error.CONNECT_FAILED:
	.long 3
	.section .rdata,"dr"
	.p2align 2
	.globl socket_error.LISTEN_FAILED
socket_error.LISTEN_FAILED:
	.long 4
	.section .rdata,"dr"
	.p2align 2
	.globl socket_error.SEND_FAILED
socket_error.SEND_FAILED:
	.long 5
	.section .rdata,"dr"
	.p2align 2
	.globl socket_error.RECV_FAILED
socket_error.RECV_FAILED:
	.long 6
	.section .rdata,"dr"
	.p2align 2
	.globl socket_error.INVALID_TYPE
socket_error.INVALID_TYPE:
	.long 7
	.section .rdata,"dr"
	.p2align 4
timeval.TLD:
	.long 64
	.long 2
	.long 0
	.long 32
	.long 1
	.long 32
	.long 32
	.long 1
	.section .rdata,"dr"
	.p2align 4
WSAData.TLD:
	.long 3264
	.long 7
	.long 0
	.long 16
	.long 1
	.long 16
	.long 16
	.long 1
	.long 32
	.long 2056
	.long 8
	.long 2088
	.long 1032
	.long 8
	.long 3120
	.long 16
	.long 1
	.long 3136
	.long 16
	.long 1
	.long 3200
	.long 64
	.long 64
	.section .rdata,"dr"
	.p2align 4
BigInt.TLD:
	.long 4129
	.long 3
	.long 0
	.long 4096
	.long 32
	.long 4096
	.long 32
	.long 32
	.long 4128
	.long 1
	.long 1
	.section .rdata,"dr"
	.p2align 4
standard__crypto__hashing__SHA256__SHA256_CTX.TLD:
	.long 864
	.long 4
	.long 0
	.long 256
	.long 1
	.long 256
	.long 512
	.long 8
	.long 768
	.long 64
	.long 1
	.long 832
	.long 32
	.long 1
	.section .rdata,"dr"
	.p2align 4
standard__crypto__hashing__SHA384__SHA384_CTX.TLD:
	.long 1696
	.long 5
	.long 0
	.long 512
	.long 1
	.long 512
	.long 1024
	.long 8
	.long 1536
	.long 64
	.long 1
	.long 1600
	.long 64
	.long 1
	.long 1664
	.long 32
	.long 1
	.section .rdata,"dr"
	.p2align 4
standard__crypto__encryption__AES__AES_CTX.TLD:
	.long 1440
	.long 2
	.long 0
	.long 1408
	.long 1
	.long 1408
	.long 32
	.long 1
	.section .rdata,"dr"
	.p2align 4
standard__crypto__encryption__AES__GCM_CTX.TLD:
	.long 1568
	.long 2
	.long 0
	.long 1440
	.long 1
	.long 1440
	.long 128
	.long 8
	.section .rdata,"dr"
	.p2align 4
standard__crypto__RSA__RSA_MONT.TLD:
	.long 12352
	.long 5
	.long 0
	.long 4096
	.long 32
	.long 4096
	.long 4096
	.long 32
	.long 8192
	.long 4096
	.long 32
	.long 12288
	.long 32
	.long 32
	.long 12320
	.long 32
	.long 32
	.section .rdata,"dr"
	.p2align 4
standard__crypto__P384__P384_PT.TLD:
	.long 1152
	.long 3
	.long 0
	.long 384
	.long 32
	.long 384
	.long 384
	.long 32
	.long 768
	.long 384
	.long 32
	.section .rdata,"dr"
	.p2align 4
standard__crypto__X509__X509_CERT.TLD:
	.long 1504
	.long 29
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
	.long 32
	.long 32
	.long 224
	.long 32
	.long 32
	.long 256
	.long 64
	.long 64
	.long 320
	.long 32
	.long 32
	.long 384
	.long 64
	.long 64
	.long 448
	.long 32
	.long 32
	.long 512
	.long 64
	.long 64
	.long 576
	.long 32
	.long 32
	.long 608
	.long 64
	.long 1
	.long 672
	.long 64
	.long 1
	.long 736
	.long 32
	.long 32
	.long 768
	.long 64
	.long 64
	.long 832
	.long 32
	.long 32
	.long 896
	.long 64
	.long 64
	.long 960
	.long 32
	.long 32
	.long 1024
	.long 64
	.long 64
	.long 1088
	.long 32
	.long 32
	.long 1152
	.long 64
	.long 64
	.long 1216
	.long 32
	.long 32
	.long 1280
	.long 64
	.long 64
	.long 1344
	.long 32
	.long 32
	.long 1376
	.long 1
	.long 1
	.long 1377
	.long 1
	.long 1
	.long 1408
	.long 32
	.long 32
	.long 1440
	.long 1
	.long 1
	.long 1472
	.long 32
	.long 32
	.section .rdata,"dr"
	.p2align 4
TimeStamp.TLD:
	.long 64
	.long 2
	.long 0
	.long 32
	.long 1
	.long 32
	.long 32
	.long 1
	.section .rdata,"dr"
	.p2align 4
SecHandle.TLD:
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
SecBuffer.TLD:
	.long 128
	.long 3
	.long 0
	.long 32
	.long 1
	.long 32
	.long 32
	.long 1
	.long 64
	.long 64
	.long 64
	.section .rdata,"dr"
	.p2align 4
SecBufferDesc.TLD:
	.long 128
	.long 3
	.long 0
	.long 32
	.long 1
	.long 32
	.long 32
	.long 1
	.long 64
	.long 64
	.long 64
	.section .rdata,"dr"
	.p2align 4
SCHANNEL_CRED.TLD:
	.long 640
	.long 14
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
	.long 1
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
	.long 480
	.long 32
	.long 1
	.long 512
	.long 32
	.long 1
	.long 544
	.long 32
	.long 1
	.long 576
	.long 32
	.long 1
	.long 608
	.long 32
	.long 1
	.section .rdata,"dr"
	.p2align 4
TLS_PARAMETERS.TLD:
	.long 288
	.long 6
	.long 0
	.long 32
	.long 1
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
	.long 32
	.long 1
	.section .rdata,"dr"
	.p2align 4
SCH_CREDENTIALS.TLD:
	.long 576
	.long 11
	.long 0
	.long 32
	.long 1
	.long 32
	.long 32
	.long 1
	.long 64
	.long 32
	.long 1
	.long 128
	.long 64
	.long 64
	.long 192
	.long 64
	.long 1
	.long 256
	.long 32
	.long 1
	.long 320
	.long 64
	.long 64
	.long 384
	.long 32
	.long 1
	.long 416
	.long 32
	.long 1
	.long 448
	.long 32
	.long 1
	.long 512
	.long 64
	.long 64
	.section .rdata,"dr"
	.p2align 4
SecPkgContext_StreamSizes.TLD:
	.long 160
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
	.long 32
	.long 1
	.section .rdata,"dr"
	.p2align 4
CERT_CONTEXT.TLD:
	.long 320
	.long 5
	.long 0
	.long 32
	.long 1
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
	.section .rdata,"dr"
	.p2align 4
CRYPT_BLOB.TLD:
	.long 128
	.long 2
	.long 0
	.long 32
	.long 1
	.long 64
	.long 64
	.long 64
	.section .rdata,"dr"
	.p2align 4
CERT_PUBLIC_KEY_INFO.TLD:
	.long 256
	.long 2
	.long 0
	.long 128
	.long 64
	.long 128
	.long 128
	.long 64
	.section .rdata,"dr"
	.p2align 4
CRYPT_BIT_BLOB.TLD:
	.long 160
	.long 3
	.long 0
	.long 32
	.long 1
	.long 64
	.long 64
	.long 64
	.long 128
	.long 32
	.long 1
	.section .rdata,"dr"
	.p2align 4
BCRYPT_KEY_BLOB.TLD:
	.long 32
	.long 1
	.long 0
	.long 32
	.long 1
	.section .rdata,"dr"
	.p2align 4
BCRYPT_ECCKEY_BLOB.TLD:
	.long 64
	.long 2
	.long 0
	.long 32
	.long 1
	.long 32
	.long 32
	.long 1
	.section .rdata,"dr"
	.p2align 4
BCRYPT_RSAKEY_BLOB.TLD:
	.long 192
	.long 6
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
	.long 32
	.long 1
	.long 160
	.long 32
	.long 1
	.section .rdata,"dr"
	.p2align 4
CertContextArray.TLD:
	.long 64
	.long 1
	.long 0
	.long 64
	.long 64
	.section .rdata,"dr"
	.p2align 4
NCryptBuffer.TLD:
	.long 128
	.long 3
	.long 0
	.long 32
	.long 1
	.long 32
	.long 32
	.long 1
	.long 64
	.long 64
	.long 64
	.section .rdata,"dr"
	.p2align 4
NCryptBufferDesc.TLD:
	.long 128
	.long 3
	.long 0
	.long 32
	.long 1
	.long 32
	.long 32
	.long 1
	.long 64
	.long 64
	.long 64
	.section .rdata,"dr"
	.p2align 4
CRYPT_KEY_PROV_INFO.TLD:
	.long 352
	.long 7
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
	.long 256
	.long 64
	.long 64
	.long 320
	.long 32
	.long 1
	.bss
	.p2align 2
	.globl tls_error.TLS_OK
tls_error.TLS_OK:
	.zero 4
	.section .rdata,"dr"
	.p2align 2
	.globl tls_error.TLS_ERR_CRED
tls_error.TLS_ERR_CRED:
	.long 1
	.section .rdata,"dr"
	.p2align 2
	.globl tls_error.TLS_ERR_HANDSHAKE
tls_error.TLS_ERR_HANDSHAKE:
	.long 2
	.section .rdata,"dr"
	.p2align 2
	.globl tls_error.TLS_ERR_ENCRYPT
tls_error.TLS_ERR_ENCRYPT:
	.long 3
	.section .rdata,"dr"
	.p2align 2
	.globl tls_error.TLS_ERR_DECRYPT
tls_error.TLS_ERR_DECRYPT:
	.long 4
	.section .rdata,"dr"
	.p2align 2
	.globl tls_error.TLS_ERR_SEND
tls_error.TLS_ERR_SEND:
	.long 5
	.section .rdata,"dr"
	.p2align 2
	.globl tls_error.TLS_ERR_RECV
tls_error.TLS_ERR_RECV:
	.long 6
	.section .rdata,"dr"
	.p2align 2
	.globl tls_error.TLS_ERR_CERT
tls_error.TLS_ERR_CERT:
	.long 7
	.section .rdata,"dr"
	.p2align 2
	.globl tls_error.TLS_ERR_KEY
tls_error.TLS_ERR_KEY:
	.long 8
	.section .rdata,"dr"
	.p2align 2
	.globl tls_error.TLS_ERR_ALLOC
tls_error.TLS_ERR_ALLOC:
	.long 9
	.section .rdata,"dr"
	.p2align 2
	.globl tls_error.TLS_ERR_SHUTDOWN
tls_error.TLS_ERR_SHUTDOWN:
	.long 10
	.section .rdata,"dr"
	.p2align 4
standard__tls13__TLS13_CONN.TLD:
	.long 1443552
	.long 30
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
	.long 32
	.long 32
	.long 160
	.long 32
	.long 32
	.long 192
	.long 32
	.long 32
	.long 224
	.long 64
	.long 1
	.long 288
	.long 64
	.long 1
	.long 352
	.long 128
	.long 8
	.long 480
	.long 128
	.long 8
	.long 608
	.long 96
	.long 8
	.long 704
	.long 96
	.long 8
	.long 800
	.long 256
	.long 8
	.long 1056
	.long 256
	.long 8
	.long 1312
	.long 1568
	.long 8
	.long 2880
	.long 1568
	.long 8
	.long 4448
	.long 133120
	.long 8
	.long 137568
	.long 133120
	.long 8
	.long 270688
	.long 133600
	.long 8
	.long 404288
	.long 320000
	.long 8
	.long 724288
	.long 32
	.long 32
	.long 724320
	.long 320000
	.long 8
	.long 1044320
	.long 32
	.long 32
	.long 1044352
	.long 131072
	.long 8
	.long 1175424
	.long 32
	.long 32
	.long 1175456
	.long 32
	.long 32
	.long 1175488
	.long 256000
	.long 8
	.long 1431488
	.long 12032
	.long 64
	.long 1443520
	.long 32
	.long 32
	.section .rdata,"dr"
	.p2align 4
standard__web__WEB_STREAM.TLD:
	.long 41184
	.long 8
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
	.long 32768
	.long 8
	.long 32896
	.long 32
	.long 32
	.long 32928
	.long 32
	.long 32
	.long 32960
	.long 32
	.long 32
	.long 32992
	.long 8192
	.long 8
	.section .rdata,"dr"
	.p2align 4
SYSTEMTIME.TLD:
	.long 128
	.long 8
	.long 0
	.long 16
	.long 1
	.long 16
	.long 16
	.long 1
	.long 32
	.long 16
	.long 1
	.long 48
	.long 16
	.long 1
	.long 64
	.long 16
	.long 1
	.long 80
	.long 16
	.long 1
	.long 96
	.long 16
	.long 1
	.long 112
	.long 16
	.long 1
	.section .rdata,"dr"
	.p2align 4
standard__datetime__DateTime.TLD:
	.long 224
	.long 7
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
	.long 32
	.long 1
	.long 160
	.long 32
	.long 1
	.long 192
	.long 32
	.long 1
	.section .rdata,"dr"
	.p2align 4
standard__discord__DISCORD_EVENT.TLD:
	.long 34656
	.long 8
	.long 0
	.long 256
	.long 8
	.long 256
	.long 256
	.long 8
	.long 512
	.long 256
	.long 8
	.long 768
	.long 256
	.long 8
	.long 1024
	.long 768
	.long 8
	.long 1792
	.long 32
	.long 32
	.long 1824
	.long 32
	.long 32
	.long 1856
	.long 32800
	.long 8
	.section .rdata,"dr"
	.p2align 4
standard__discord__DISCORD_BOT.TLD:
	.long 3534208
	.long 22
	.long 0
	.long 1024
	.long 8
	.long 1024
	.long 32
	.long 32
	.long 1088
	.long 64
	.long 64
	.long 1152
	.long 32
	.long 32
	.long 1184
	.long 768
	.long 8
	.long 1952
	.long 768
	.long 8
	.long 2720
	.long 768
	.long 8
	.long 3488
	.long 768
	.long 8
	.long 4256
	.long 32
	.long 32
	.long 4288
	.long 32
	.long 32
	.long 4320
	.long 32
	.long 32
	.long 4352
	.long 41184
	.long 64
	.long 45568
	.long 1443552
	.long 64
	.long 1489120
	.long 32
	.long 32
	.long 1489152
	.long 32
	.long 32
	.long 1489216
	.long 41184
	.long 64
	.long 1530432
	.long 1443552
	.long 64
	.long 2973984
	.long 560000
	.long 8
	.long 3533984
	.long 64
	.long 1
	.long 3534048
	.long 32
	.long 32
	.long 3534080
	.long 64
	.long 1
	.long 3534144
	.long 64
	.long 1
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
	.data
	.p2align 3
standard__time__TIME_NS_PER_MS:
	.quad 1000000
	.data
	.p2align 3
standard__time__TIME_NS_PER_SEC:
	.quad 1000000000
	.bss
	.p2align 4
standard__io__console__out_buf:
	.zero 8192
	.bss
	.p2align 2
standard__io__console__out_len:
	.zero 4
	.bss
	.p2align 2
standard__io__file__SEEK_SET:
	.zero 4
	.data
	.p2align 2
standard__io__file__SEEK_END:
	.long 2
	.data
	.p2align 2
standard__sockets__AF_INET:
	.long 2
	.data
	.p2align 2
standard__sockets__SOCK_STREAM:
	.long 1
	.data
	.p2align 2
standard__sockets__IPPROTO_TCP:
	.long 6
	.bss
	.p2align 2
standard__sockets__INADDR_ANY:
	.zero 4
	.data
	.p2align 2
standard__sockets__SOL_SOCKET:
	.long 65535
	.data
	.p2align 2
standard__sockets__SO_REUSEADDR:
	.long 4
	.data
	.p2align 2
standard__sockets__SO_RCVTIMEO:
	.long 4102
	.data
	.p2align 2
standard__sockets__SO_SNDTIMEO:
	.long 4101
	.data
	.p2align 2
standard__sockets__SD_BOTH:
	.long 2
	.data
	.p2align 2
standard__sockets__FIONBIO:
	.long 2147772030
	.data
	.p2align 1
standard__sockets__WINSOCK_VERSION:
	.short 514
	.data
	.p2align 2
standard__math__PIF:
	.long 1078530011
	.data
	.p2align 3
standard__math__PID:
	.quad 4614256656552045848
	.data
	.p2align 4
standard__crypto__hashing__SHA256__K:
	.long 1116352408
	.long 1899447441
	.long 3049323471
	.long 3921009573
	.long 961987163
	.long 1508970993
	.long 2453635748
	.long 2870763221
	.long 3624381080
	.long 310598401
	.long 607225278
	.long 1426881987
	.long 1925078388
	.long 2162078206
	.long 2614888103
	.long 3248222580
	.long 3835390401
	.long 4022224774
	.long 264347078
	.long 604807628
	.long 770255983
	.long 1249150122
	.long 1555081692
	.long 1996064986
	.long 2554220882
	.long 2821834349
	.long 2952996808
	.long 3210313671
	.long 3336571891
	.long 3584528711
	.long 113926993
	.long 338241895
	.long 666307205
	.long 773529912
	.long 1294757372
	.long 1396182291
	.long 1695183700
	.long 1986661051
	.long 2177026350
	.long 2456956037
	.long 2730485921
	.long 2820302411
	.long 3259730800
	.long 3345764771
	.long 3516065817
	.long 3600352804
	.long 4094571909
	.long 275423344
	.long 430227734
	.long 506948616
	.long 659060556
	.long 883997877
	.long 958139571
	.long 1322822218
	.long 1537002063
	.long 1747873779
	.long 1955562222
	.long 2024104815
	.long 2227730452
	.long 2361852424
	.long 2428436474
	.long 2756734187
	.long 3204031479
	.long 3329325298
	.data
	.p2align 4
standard__crypto__hashing__SHA384__K384:
	.quad 4794697086780616226
	.quad 8158064640168781261
	.quad 13096744586834688815
	.quad 16840607885511220156
	.quad 4131703408338449720
	.quad 6480981068601479193
	.quad 10538285296894168987
	.quad 12329834152419229976
	.quad 15566598209576043074
	.quad 1334009975649890238
	.quad 2608012711638119052
	.quad 6128411473006802146
	.quad 8268148722764581231
	.quad 9286055187155687089
	.quad 11230858885718282805
	.quad 13951009754708518548
	.quad 16472876342353939154
	.quad 17275323862435702243
	.quad 1135362057144423861
	.quad 2597628984639134821
	.quad 3308224258029322869
	.quad 5365058923640841347
	.quad 6679025012923562964
	.quad 8573033837759648693
	.quad 10970295158949994411
	.quad 12119686244451234320
	.quad 12683024718118986047
	.quad 13788192230050041572
	.quad 14330467153632333762
	.quad 15395433587784984357
	.quad 489312712824947311
	.quad 1452737877330783856
	.quad 2861767655752347644
	.quad 3322285676063803686
	.quad 5560940570517711597
	.quad 5996557281743188959
	.quad 7280758554555802590
	.quad 8532644243296465576
	.quad 9350256976987008742
	.quad 10552545826968843579
	.quad 11727347734174303076
	.quad 12113106623233404929
	.quad 14000437183269869457
	.quad 14369950271660146224
	.quad 15101387698204529176
	.quad 15463397548674623760
	.quad 17586052441742319658
	.quad 1182934255886127544
	.quad 1847814050463011016
	.quad 2177327727835720531
	.quad 2830643537854262169
	.quad 3796741975233480872
	.quad 4115178125766777443
	.quad 5681478168544905931
	.quad 6601373596472566643
	.quad 7507060721942968483
	.quad 8399075790359081724
	.quad 8693463985226723168
	.quad 9568029438360202098
	.quad 10144078919501101548
	.quad 10430055236837252648
	.quad 11840083180663258601
	.quad 13761210420658862357
	.quad 14299343276471374635
	.quad 14566680578165727644
	.quad 15097957966210449927
	.quad 16922976911328602910
	.quad 17689382322260857208
	.quad 500013540394364858
	.quad 748580250866718886
	.quad 1242879168328830382
	.quad 1977374033974150939
	.quad 2944078676154940804
	.quad 3659926193048069267
	.quad 4368137639120453308
	.quad 4836135668995329356
	.quad 5532061633213252278
	.quad 6448918945643986474
	.quad 6902733635092675308
	.quad 7801388544844847127
	.data
	.p2align 4
standard__crypto__encryption__AES__SBOX:
	.byte 99
	.byte 124
	.byte 119
	.byte 123
	.byte 242
	.byte 107
	.byte 111
	.byte 197
	.byte 48
	.byte 1
	.byte 103
	.byte 43
	.byte 254
	.byte 215
	.byte 171
	.byte 118
	.byte 202
	.byte 130
	.byte 201
	.byte 125
	.byte 250
	.byte 89
	.byte 71
	.byte 240
	.byte 173
	.byte 212
	.byte 162
	.byte 175
	.byte 156
	.byte 164
	.byte 114
	.byte 192
	.byte 183
	.byte 253
	.byte 147
	.byte 38
	.byte 54
	.byte 63
	.byte 247
	.byte 204
	.byte 52
	.byte 165
	.byte 229
	.byte 241
	.byte 113
	.byte 216
	.byte 49
	.byte 21
	.byte 4
	.byte 199
	.byte 35
	.byte 195
	.byte 24
	.byte 150
	.byte 5
	.byte 154
	.byte 7
	.byte 18
	.byte 128
	.byte 226
	.byte 235
	.byte 39
	.byte 178
	.byte 117
	.byte 9
	.byte 131
	.byte 44
	.byte 26
	.byte 27
	.byte 110
	.byte 90
	.byte 160
	.byte 82
	.byte 59
	.byte 214
	.byte 179
	.byte 41
	.byte 227
	.byte 47
	.byte 132
	.byte 83
	.byte 209
	.byte 0
	.byte 237
	.byte 32
	.byte 252
	.byte 177
	.byte 91
	.byte 106
	.byte 203
	.byte 190
	.byte 57
	.byte 74
	.byte 76
	.byte 88
	.byte 207
	.byte 208
	.byte 239
	.byte 170
	.byte 251
	.byte 67
	.byte 77
	.byte 51
	.byte 133
	.byte 69
	.byte 249
	.byte 2
	.byte 127
	.byte 80
	.byte 60
	.byte 159
	.byte 168
	.byte 81
	.byte 163
	.byte 64
	.byte 143
	.byte 146
	.byte 157
	.byte 56
	.byte 245
	.byte 188
	.byte 182
	.byte 218
	.byte 33
	.byte 16
	.byte 255
	.byte 243
	.byte 210
	.byte 205
	.byte 12
	.byte 19
	.byte 236
	.byte 95
	.byte 151
	.byte 68
	.byte 23
	.byte 196
	.byte 167
	.byte 126
	.byte 61
	.byte 100
	.byte 93
	.byte 25
	.byte 115
	.byte 96
	.byte 129
	.byte 79
	.byte 220
	.byte 34
	.byte 42
	.byte 144
	.byte 136
	.byte 70
	.byte 238
	.byte 184
	.byte 20
	.byte 222
	.byte 94
	.byte 11
	.byte 219
	.byte 224
	.byte 50
	.byte 58
	.byte 10
	.byte 73
	.byte 6
	.byte 36
	.byte 92
	.byte 194
	.byte 211
	.byte 172
	.byte 98
	.byte 145
	.byte 149
	.byte 228
	.byte 121
	.byte 231
	.byte 200
	.byte 55
	.byte 109
	.byte 141
	.byte 213
	.byte 78
	.byte 169
	.byte 108
	.byte 86
	.byte 244
	.byte 234
	.byte 101
	.byte 122
	.byte 174
	.byte 8
	.byte 186
	.byte 120
	.byte 37
	.byte 46
	.byte 28
	.byte 166
	.byte 180
	.byte 198
	.byte 232
	.byte 221
	.byte 116
	.byte 31
	.byte 75
	.byte 189
	.byte 139
	.byte 138
	.byte 112
	.byte 62
	.byte 181
	.byte 102
	.byte 72
	.byte 3
	.byte 246
	.byte 14
	.byte 97
	.byte 53
	.byte 87
	.byte 185
	.byte 134
	.byte 193
	.byte 29
	.byte 158
	.byte 225
	.byte 248
	.byte 152
	.byte 17
	.byte 105
	.byte 217
	.byte 142
	.byte 148
	.byte 155
	.byte 30
	.byte 135
	.byte 233
	.byte 206
	.byte 85
	.byte 40
	.byte 223
	.byte 140
	.byte 161
	.byte 137
	.byte 13
	.byte 191
	.byte 230
	.byte 66
	.byte 104
	.byte 65
	.byte 153
	.byte 45
	.byte 15
	.byte 176
	.byte 84
	.byte 187
	.byte 22
	.data
	.p2align 4
standard__crypto__encryption__AES__RCON:
	.long 16777216
	.long 33554432
	.long 67108864
	.long 134217728
	.long 268435456
	.long 536870912
	.long 1073741824
	.long 2147483648
	.long 452984832
	.long 905969664
	.data
	.p2align 4
standard__crypto__P384__P384_P:
	.long 4294967295
	.long 0
	.long 0
	.long 4294967295
	.long 4294967294
	.long 4294967295
	.long 4294967295
	.long 4294967295
	.long 4294967295
	.long 4294967295
	.long 4294967295
	.long 4294967295
	.data
	.p2align 4
standard__crypto__P384__P384_N:
	.long 3435473267
	.long 3974895978
	.long 1219536762
	.long 1478102450
	.long 4097256927
	.long 3345173889
	.long 4294967295
	.long 4294967295
	.long 4294967295
	.long 4294967295
	.long 4294967295
	.long 4294967295
	.data
	.p2align 4
standard__crypto__P384__P384_B:
	.long 3555470063
	.long 713410797
	.long 2318324125
	.long 3327539597
	.long 1343457114
	.long 51644559
	.long 4269883666
	.long 404593774
	.long 3824692505
	.long 2559444331
	.long 3795773412
	.long 3006345127
	.data
	.p2align 4
standard__crypto__P384__P384_GX:
	.long 1920338615
	.long 978607672
	.long 3210029420
	.long 1426256477
	.long 2186553912
	.long 1509376480
	.long 2343017368
	.long 1847409506
	.long 4079005044
	.long 2394015518
	.long 3196781879
	.long 2861025826
	.data
	.p2align 4
standard__crypto__P384__P384_GY:
	.long 2431258207
	.long 2051218812
	.long 494829981
	.long 174109134
	.long 3052452032
	.long 3923390739
	.long 681186428
	.long 4176747965
	.long 2459098153
	.long 1570674879
	.long 2519084143
	.long 907533898
	.data
	.p2align 4
standard__crypto__P384__P256N_P:
	.long 4294967295
	.long 4294967295
	.long 4294967295
	.long 0
	.long 0
	.long 0
	.long 1
	.long 4294967295
	.long 0
	.long 0
	.long 0
	.long 0
	.data
	.p2align 4
standard__crypto__P384__P256N_N:
	.long 4234356049
	.long 4089039554
	.long 2803342980
	.long 3169254061
	.long 4294967295
	.long 4294967295
	.long 0
	.long 4294967295
	.long 0
	.long 0
	.long 0
	.long 0
	.data
	.p2align 4
standard__crypto__P384__P256N_B:
	.long 668098635
	.long 1003371582
	.long 3428036854
	.long 1696401072
	.long 1989707452
	.long 3018571093
	.long 2855965671
	.long 1522939352
	.long 0
	.long 0
	.long 0
	.long 0
	.data
	.p2align 4
standard__crypto__P384__P256N_GX:
	.long 3633889942
	.long 4104206661
	.long 770388896
	.long 1996717441
	.long 1671708914
	.long 4173129445
	.long 3777774151
	.long 1796723186
	.long 0
	.long 0
	.long 0
	.long 0
	.data
	.p2align 4
standard__crypto__P384__P256N_GY:
	.long 935285237
	.long 3417718888
	.long 1798397646
	.long 734933847
	.long 2081398294
	.long 2397563722
	.long 4263149467
	.long 1340293858
	.long 0
	.long 0
	.long 0
	.long 0
	.data
	.p2align 3
standard__crypto__X509__X509_OID_RSA:
	.byte 42
	.byte 134
	.byte 72
	.byte 134
	.byte 247
	.byte 13
	.byte 1
	.byte 1
	.byte 1
	.data
	.p2align 3
standard__crypto__X509__X509_OID_SHA256_RSA:
	.byte 42
	.byte 134
	.byte 72
	.byte 134
	.byte 247
	.byte 13
	.byte 1
	.byte 1
	.byte 11
	.data
	.p2align 3
standard__crypto__X509__X509_OID_SHA384_RSA:
	.byte 42
	.byte 134
	.byte 72
	.byte 134
	.byte 247
	.byte 13
	.byte 1
	.byte 1
	.byte 12
	.data
	.p2align 3
standard__crypto__X509__X509_OID_SHA512_RSA:
	.byte 42
	.byte 134
	.byte 72
	.byte 134
	.byte 247
	.byte 13
	.byte 1
	.byte 1
	.byte 13
	.data
	.p2align 3
standard__crypto__X509__X509_OID_ECDSA_SHA256:
	.byte 42
	.byte 134
	.byte 72
	.byte 206
	.byte 61
	.byte 4
	.byte 3
	.byte 2
	.data
	.p2align 3
standard__crypto__X509__X509_OID_ECDSA_SHA384:
	.byte 42
	.byte 134
	.byte 72
	.byte 206
	.byte 61
	.byte 4
	.byte 3
	.byte 3
	.data
	.p2align 3
standard__crypto__X509__X509_OID_ECDSA_SHA512:
	.byte 42
	.byte 134
	.byte 72
	.byte 206
	.byte 61
	.byte 4
	.byte 3
	.byte 4
	.data
	.p2align 0
standard__crypto__X509__X509_OID_EC_KEY:
	.byte 42
	.byte 134
	.byte 72
	.byte 206
	.byte 61
	.byte 2
	.byte 1
	.data
	.p2align 3
standard__crypto__X509__X509_OID_P256:
	.byte 42
	.byte 134
	.byte 72
	.byte 206
	.byte 61
	.byte 3
	.byte 1
	.byte 7
	.data
	.p2align 0
standard__crypto__X509__X509_OID_P384:
	.byte 43
	.byte 129
	.byte 4
	.byte 0
	.byte 34
	.data
	.p2align 0
standard__crypto__X509__X509_OID_BASIC:
	.byte 85
	.byte 29
	.byte 19
	.data
	.p2align 0
standard__crypto__X509__X509_OID_KEYUSE:
	.byte 85
	.byte 29
	.byte 15
	.data
	.p2align 0
standard__crypto__X509__X509_OID_SAN:
	.byte 85
	.byte 29
	.byte 17
	.data
	.p2align 0
standard__crypto__X509__X509_OID_CN:
	.byte 85
	.byte 4
	.byte 3
	.data
	.p2align 2
SCHANNEL_CRED_VERSION:
	.long 4
	.data
	.p2align 2
SCH_CREDENTIALS_VERSION:
	.long 5
	.data
	.p2align 2
SP_PROT_TLS1_2_CLIENT:
	.long 2048
	.data
	.p2align 2
SP_PROT_TLS1_2_SERVER:
	.long 1024
	.data
	.p2align 2
SP_PROT_TLS1_3_CLIENT:
	.long 8192
	.data
	.p2align 2
SP_PROT_TLS1_3_SERVER:
	.long 4096
	.data
	.p2align 2
SCH_CRED_NO_DEFAULT_CREDS:
	.long 16
	.data
	.p2align 2
SCH_CRED_MANUAL_CRED_VALIDATION:
	.long 8
	.data
	.p2align 2
SCH_SEND_ROOT_CERT:
	.long 262144
	.data
	.p2align 2
SCH_USE_STRONG_CRYPTO:
	.long 4194304
	.data
	.p2align 2
ISC_REQ_SEQUENCE_DETECT:
	.long 8
	.data
	.p2align 2
ISC_REQ_REPLAY_DETECT:
	.long 4
	.data
	.p2align 2
ISC_REQ_CONFIDENTIALITY:
	.long 16
	.data
	.p2align 2
ISC_REQ_EXTENDED_ERROR:
	.long 16384
	.data
	.p2align 2
ISC_REQ_ALLOCATE_MEMORY:
	.long 256
	.data
	.p2align 2
ISC_REQ_STREAM:
	.long 32768
	.data
	.p2align 2
ISC_REQ_MANUAL_CRED_VALIDATION:
	.long 524288
	.data
	.p2align 2
ASC_REQ_SEQUENCE_DETECT:
	.long 8
	.data
	.p2align 2
ASC_REQ_REPLAY_DETECT:
	.long 4
	.data
	.p2align 2
ASC_REQ_CONFIDENTIALITY:
	.long 16
	.data
	.p2align 2
ASC_REQ_EXTENDED_ERROR:
	.long 512
	.data
	.p2align 2
ASC_REQ_ALLOCATE_MEMORY:
	.long 256
	.data
	.p2align 2
ASC_REQ_STREAM:
	.long 65536
	.bss
	.p2align 2
SEC_E_OK:
	.zero 4
	.data
	.p2align 2
SEC_I_CONTINUE_NEEDED:
	.long 590610
	.data
	.p2align 2
SEC_I_COMPLETE_NEEDED:
	.long 590611
	.data
	.p2align 2
SEC_I_COMPLETE_AND_CONTINUE:
	.long 590612
	.data
	.p2align 2
SEC_E_INCOMPLETE_MESSAGE:
	.long 2148074264
	.data
	.p2align 2
SEC_E_CONTEXT_EXPIRED:
	.long 2148074263
	.data
	.p2align 2
SEC_I_RENEGOTIATE:
	.long 590625
	.bss
	.p2align 2
SECBUFFER_VERSION:
	.zero 4
	.bss
	.p2align 2
SECBUFFER_EMPTY:
	.zero 4
	.data
	.p2align 2
SECBUFFER_DATA:
	.long 1
	.data
	.p2align 2
SECBUFFER_TOKEN:
	.long 2
	.data
	.p2align 2
SECBUFFER_PKG_PARAMS:
	.long 3
	.data
	.p2align 2
SECBUFFER_MISSING:
	.long 4
	.data
	.p2align 2
SECBUFFER_EXTRA:
	.long 5
	.data
	.p2align 2
SECBUFFER_STREAM_TRAILER:
	.long 6
	.data
	.p2align 2
SECBUFFER_STREAM_HEADER:
	.long 7
	.data
	.p2align 2
SECBUFFER_ALERT:
	.long 17
	.data
	.p2align 2
SECBUFFER_STREAM:
	.long 10
	.data
	.p2align 2
SECBUFFER_READONLY_WITH_CHECKSUM:
	.long 268435456
	.data
	.p2align 2
SECPKG_ATTR_STREAM_SIZES:
	.long 4
	.data
	.p2align 2
SECPKG_ATTR_REMOTE_CERT_CONTEXT:
	.long 83
	.data
	.p2align 2
X509_ASN_ENCODING:
	.long 1
	.data
	.p2align 2
PKCS_7_ASN_ENCODING:
	.long 65536
	.data
	.p2align 2
CERT_FIND_SUBJECT_STR_W:
	.long 524295
	.bss
	.p2align 2
CERT_FIND_ANY:
	.zero 4
	.data
	.p2align 2
CERT_STORE_ADD_REPLACE_EXISTING:
	.long 3
	.data
	.p2align 2
CERT_CLOSE_STORE_CHECK_FLAG:
	.long 2
	.data
	.p2align 4
BCRYPT_ECDSA_P256_ALGORITHM:
	.byte 69
	.byte 0
	.byte 67
	.byte 0
	.byte 68
	.byte 0
	.byte 83
	.byte 0
	.byte 65
	.byte 0
	.byte 95
	.byte 0
	.byte 80
	.byte 0
	.byte 50
	.byte 0
	.byte 53
	.byte 0
	.byte 54
	.byte 0
	.byte 0
	.byte 0
	.data
	.p2align 4
BCRYPT_ECDSA_P384_ALGORITHM:
	.byte 69
	.byte 0
	.byte 67
	.byte 0
	.byte 68
	.byte 0
	.byte 83
	.byte 0
	.byte 65
	.byte 0
	.byte 95
	.byte 0
	.byte 80
	.byte 0
	.byte 51
	.byte 0
	.byte 56
	.byte 0
	.byte 52
	.byte 0
	.byte 0
	.byte 0
	.data
	.p2align 3
BCRYPT_RSA_ALGORITHM:
	.byte 82
	.byte 0
	.byte 83
	.byte 0
	.byte 65
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.data
	.p2align 4
BCRYPT_SHA256_ALGORITHM:
	.byte 83
	.byte 0
	.byte 72
	.byte 0
	.byte 65
	.byte 0
	.byte 50
	.byte 0
	.byte 53
	.byte 0
	.byte 54
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.data
	.p2align 2
BCRYPT_ECDSA_PUBLIC_P256_MAGIC:
	.long 827540293
	.data
	.p2align 2
BCRYPT_ECDSA_PRIVATE_P256_MAGIC:
	.long 844317509
	.data
	.p2align 2
BCRYPT_ECDSA_PUBLIC_P384_MAGIC:
	.long 861094725
	.data
	.p2align 2
BCRYPT_ECDSA_PRIVATE_P384_MAGIC:
	.long 877871941
	.data
	.p2align 2
BCRYPT_RSAPUBLIC_MAGIC:
	.long 826364754
	.data
	.p2align 2
BCRYPT_RSAPRIVATE_MAGIC:
	.long 843141970
	.data
	.p2align 2
BCRYPT_RSAFULLPRIVATE_MAGIC:
	.long 859919186
	.data
	.p2align 2
BCRYPT_HASH_REUSABLE_FLAG:
	.long 32
	.data
	.p2align 2
BCRYPT_NO_KEY_VALIDATION:
	.long 8
	.data
	.p2align 2
BCRYPT_PAD_PKCS1:
	.long 2
	.data
	.p2align 2
BCRYPT_PAD_PSS:
	.long 8
	.data
	.p2align 2
BCRYPT_PAD_OAEP:
	.long 4
	.data
	.p2align 4
MS_KEY_STORAGE_PROVIDER:
	.byte 77
	.byte 0
	.byte 105
	.byte 0
	.byte 99
	.byte 0
	.byte 114
	.byte 0
	.byte 111
	.byte 0
	.byte 115
	.byte 0
	.byte 111
	.byte 0
	.byte 102
	.byte 0
	.byte 116
	.byte 0
	.byte 32
	.byte 0
	.byte 83
	.byte 0
	.byte 111
	.byte 0
	.byte 102
	.byte 0
	.byte 116
	.byte 0
	.byte 119
	.byte 0
	.byte 97
	.byte 0
	.byte 114
	.byte 0
	.byte 101
	.byte 0
	.byte 32
	.byte 0
	.byte 75
	.byte 0
	.byte 101
	.byte 0
	.byte 121
	.byte 0
	.byte 32
	.byte 0
	.byte 83
	.byte 0
	.byte 116
	.byte 0
	.byte 111
	.byte 0
	.byte 114
	.byte 0
	.byte 97
	.byte 0
	.byte 103
	.byte 0
	.byte 101
	.byte 0
	.byte 32
	.byte 0
	.byte 80
	.byte 0
	.byte 114
	.byte 0
	.byte 111
	.byte 0
	.byte 118
	.byte 0
	.byte 105
	.byte 0
	.byte 100
	.byte 0
	.byte 101
	.byte 0
	.byte 114
	.byte 0
	.byte 0
	.byte 0
	.data
	.p2align 4
BLOB_TYPE_ECCPUBLIC:
	.byte 66
	.byte 0
	.byte 67
	.byte 0
	.byte 82
	.byte 0
	.byte 89
	.byte 0
	.byte 80
	.byte 0
	.byte 84
	.byte 0
	.byte 95
	.byte 0
	.byte 69
	.byte 0
	.byte 67
	.byte 0
	.byte 67
	.byte 0
	.byte 80
	.byte 0
	.byte 85
	.byte 0
	.byte 66
	.byte 0
	.byte 76
	.byte 0
	.byte 73
	.byte 0
	.byte 67
	.byte 0
	.byte 95
	.byte 0
	.byte 66
	.byte 0
	.byte 76
	.byte 0
	.byte 79
	.byte 0
	.byte 66
	.byte 0
	.byte 0
	.byte 0
	.data
	.p2align 4
BLOB_TYPE_ECCPRIVATE:
	.byte 66
	.byte 0
	.byte 67
	.byte 0
	.byte 82
	.byte 0
	.byte 89
	.byte 0
	.byte 80
	.byte 0
	.byte 84
	.byte 0
	.byte 95
	.byte 0
	.byte 69
	.byte 0
	.byte 67
	.byte 0
	.byte 67
	.byte 0
	.byte 80
	.byte 0
	.byte 82
	.byte 0
	.byte 73
	.byte 0
	.byte 86
	.byte 0
	.byte 65
	.byte 0
	.byte 84
	.byte 0
	.byte 69
	.byte 0
	.byte 95
	.byte 0
	.byte 66
	.byte 0
	.byte 76
	.byte 0
	.byte 79
	.byte 0
	.byte 66
	.byte 0
	.byte 0
	.byte 0
	.data
	.p2align 4
BLOB_TYPE_RSAPUBLIC:
	.byte 82
	.byte 0
	.byte 83
	.byte 0
	.byte 65
	.byte 0
	.byte 80
	.byte 0
	.byte 85
	.byte 0
	.byte 66
	.byte 0
	.byte 76
	.byte 0
	.byte 73
	.byte 0
	.byte 67
	.byte 0
	.byte 66
	.byte 0
	.byte 76
	.byte 0
	.byte 79
	.byte 0
	.byte 66
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.data
	.p2align 4
BLOB_TYPE_RSAPRIVATE:
	.byte 82
	.byte 0
	.byte 83
	.byte 0
	.byte 65
	.byte 0
	.byte 80
	.byte 0
	.byte 82
	.byte 0
	.byte 73
	.byte 0
	.byte 86
	.byte 0
	.byte 65
	.byte 0
	.byte 84
	.byte 0
	.byte 69
	.byte 0
	.byte 66
	.byte 0
	.byte 76
	.byte 0
	.byte 79
	.byte 0
	.byte 66
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.data
	.p2align 4
BLOB_TYPE_RSAFULLPRIVATE:
	.byte 82
	.byte 0
	.byte 83
	.byte 0
	.byte 65
	.byte 0
	.byte 70
	.byte 0
	.byte 85
	.byte 0
	.byte 76
	.byte 0
	.byte 76
	.byte 0
	.byte 80
	.byte 0
	.byte 82
	.byte 0
	.byte 73
	.byte 0
	.byte 86
	.byte 0
	.byte 65
	.byte 0
	.byte 84
	.byte 0
	.byte 69
	.byte 0
	.byte 66
	.byte 0
	.byte 76
	.byte 0
	.byte 79
	.byte 0
	.byte 66
	.byte 0
	.byte 0
	.byte 0
	.data
	.p2align 4
BLOB_TYPE_LEGACY_RSAPRIVATE:
	.byte 76
	.byte 0
	.byte 69
	.byte 0
	.byte 71
	.byte 0
	.byte 65
	.byte 0
	.byte 67
	.byte 0
	.byte 89
	.byte 0
	.byte 95
	.byte 0
	.byte 82
	.byte 0
	.byte 83
	.byte 0
	.byte 65
	.byte 0
	.byte 80
	.byte 0
	.byte 82
	.byte 0
	.byte 73
	.byte 0
	.byte 86
	.byte 0
	.byte 65
	.byte 0
	.byte 84
	.byte 0
	.byte 69
	.byte 0
	.byte 66
	.byte 0
	.byte 76
	.byte 0
	.byte 79
	.byte 0
	.byte 66
	.byte 0
	.byte 0
	.byte 0
	.data
	.p2align 4
NCRYPT_EPHEMERAL_KEY_NAME:
	.byte 102
	.byte 0
	.byte 108
	.byte 0
	.byte 117
	.byte 0
	.byte 120
	.byte 0
	.byte 95
	.byte 0
	.byte 116
	.byte 0
	.byte 108
	.byte 0
	.byte 115
	.byte 0
	.byte 95
	.byte 0
	.byte 101
	.byte 0
	.byte 112
	.byte 0
	.byte 104
	.byte 0
	.byte 101
	.byte 0
	.byte 109
	.byte 0
	.byte 101
	.byte 0
	.byte 114
	.byte 0
	.byte 97
	.byte 0
	.byte 108
	.byte 0
	.byte 0
	.byte 0
	.data
	.p2align 4
SCHANNEL_NAME_W:
	.byte 83
	.byte 0
	.byte 99
	.byte 0
	.byte 104
	.byte 0
	.byte 97
	.byte 0
	.byte 110
	.byte 0
	.byte 110
	.byte 0
	.byte 101
	.byte 0
	.byte 108
	.byte 0
	.byte 0
	.byte 0
	.data
	.p2align 2
SECPKG_CRED_OUTBOUND:
	.long 2
	.data
	.p2align 2
SECPKG_CRED_INBOUND:
	.long 1
	.data
	.p2align 2
SCHANNEL_SHUTDOWN:
	.long 1
	.data
	.p2align 2
CERT_X500_NAME_STR:
	.long 3
	.data
	.p2align 2
CERT_NAME_STR_NO_PLUS:
	.long 536870912
	.data
	.p2align 2
CERT_KEY_PROV_HANDLE_PROP_ID:
	.long 1
	.data
	.p2align 2
CERT_KEY_PROV_INFO_PROP_ID:
	.long 2
	.data
	.p2align 2
CERT_NCRYPT_KEY_HANDLE_PROP_ID:
	.long 78
	.data
	.p2align 2
CERT_STORE_NO_CRYPT_RELEASE_FLAG:
	.long 1
	.data
	.p2align 2
NCRYPT_OVERWRITE_KEY_FLAG:
	.long 128
	.data
	.p2align 2
NCRYPT_SILENT_FLAG:
	.long 64
	.data
	.p2align 2
NCRYPT_DO_NOT_FINALIZE_FLAG:
	.long 1024
	.data
	.p2align 2
NCRYPT_ALLOW_DECRYPT_FLAG:
	.long 1
	.data
	.p2align 2
NCRYPT_ALLOW_SIGNING_FLAG:
	.long 2
	.data
	.p2align 2
NCRYPT_ALLOW_KEY_AGREEMENT_FLAG:
	.long 4
	.data
	.p2align 2
NCRYPT_ALLOW_ALL_USAGES:
	.long 16777215
	.data
	.p2align 4
NCRYPT_KEY_USAGE_PROPERTY:
	.byte 75
	.byte 0
	.byte 101
	.byte 0
	.byte 121
	.byte 0
	.byte 32
	.byte 0
	.byte 85
	.byte 0
	.byte 115
	.byte 0
	.byte 97
	.byte 0
	.byte 103
	.byte 0
	.byte 101
	.byte 0
	.byte 0
	.byte 0
	.data
	.p2align 2
NCRYPTBUFFER_PKCS_KEY_NAME:
	.long 45
	.data
	.p2align 2
NCRYPT_ALLOW_EXPORT_FLAG:
	.long 1
	.data
	.p2align 2
NCRYPT_ALLOW_PLAINTEXT_EXPORT_FLAG:
	.long 2
	.data
	.p2align 4
NCRYPT_EXPORT_POLICY_PROPERTY:
	.byte 69
	.byte 0
	.byte 120
	.byte 0
	.byte 112
	.byte 0
	.byte 111
	.byte 0
	.byte 114
	.byte 0
	.byte 116
	.byte 0
	.byte 32
	.byte 0
	.byte 80
	.byte 0
	.byte 111
	.byte 0
	.byte 108
	.byte 0
	.byte 105
	.byte 0
	.byte 99
	.byte 0
	.byte 121
	.byte 0
	.byte 0
	.byte 0
	.data
	.p2align 3
CERT_STORE_PROV_MEMORY:
	.quad 2
	.data
	.p2align 2
CRYPT_DECODE_ALLOC_FLAG:
	.long 32768
	.data
	.p2align 4
standard__web__WS_GUID:
	.byte 50
	.byte 53
	.byte 56
	.byte 69
	.byte 65
	.byte 70
	.byte 65
	.byte 53
	.byte 45
	.byte 69
	.byte 57
	.byte 49
	.byte 52
	.byte 45
	.byte 52
	.byte 55
	.byte 68
	.byte 65
	.byte 45
	.byte 57
	.byte 53
	.byte 67
	.byte 65
	.byte 45
	.byte 67
	.byte 53
	.byte 65
	.byte 66
	.byte 48
	.byte 68
	.byte 67
	.byte 56
	.byte 53
	.byte 66
	.byte 49
	.byte 49
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0
	.bss
	.p2align 2
json__JSON_NULL:
	.zero 4
	.data
	.p2align 2
json__JSON_BOOL:
	.long 1
	.data
	.p2align 2
json__JSON_INT:
	.long 2
	.data
	.p2align 2
json__JSON_FLOAT:
	.long 3
	.data
	.p2align 2
json__JSON_STRING:
	.long 4
	.data
	.p2align 2
json__JSON_ARRAY:
	.long 5
	.data
	.p2align 2
json__JSON_OBJECT:
	.long 6
	.data
	.p2align 2
standard__discord__INTENT_GUILD_MESSAGES:
	.long 512
	.data
	.p2align 2
standard__discord__INTENT_DIRECT_MESSAGES:
	.long 4096
	.data
	.p2align 2
standard__discord__INTENT_MESSAGE_CONTENT:
	.long 32768
	.bss
	.p2align 4
standard__discord__d_pem:
	.zero 400000
	.bss
	.p2align 4
standard__discord__d_der:
	.zero 400000
	.bss
	.p2align 4
standard__discord__d_roots:
	.zero 37600
	.bss
	.p2align 4
g_bot:
	.zero 441776
	.bss
	.p2align 4
g_ev:
	.zero 4332
	.section .rdata,"dr"
	.p2align 4
.LC32010:
	.quad 14680500436340154072
	.quad 7105036623409894663
	.quad 10473403895298186519
	.quad 1526699215303891257
	.quad 7436329637833083697
	.quad 10282925794625328401
	.quad 15784041429090275239
	.quad 5167115440072839076
	.section .rdata,"dr"
	.p2align 4
.LC32020:
	.quad 7640891576956012808
	.quad 13503953896175478587
	.quad 4354685564936845355
	.quad 11912009170470909681
	.quad 5840696475078001361
	.quad 11170449401992604703
	.quad 2270897969802886507
	.quad 6620516959819538809
	.section .rdata,"dr"
	.p2align 4
.LC32045:
	.long 4294967277
	.long 4294967295
	.long 4294967295
	.long 4294967295
	.long 4294967295
	.long 4294967295
	.long 4294967295
	.long 2147483647
	.section .rdata,"dr"
	.p2align 4
.LZERO:
	.zero 1544
