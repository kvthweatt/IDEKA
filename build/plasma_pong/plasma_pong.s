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
.LB12561:
	testq %rdx, %rdx
	je .LB12563
.LB12562:
	movb %al, (%rcx,%rsi,1)
	movb %al, 1(%rcx,%rsi,1)
	movb %al, 2(%rcx,%rsi,1)
	movb %al, 3(%rcx,%rsi,1)
	addq $4, %rsi
	decq %rdx
	jne .LB12562
.LB12563:
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
	.globl standard__memory__allocators__stdheap__heap_os_alloc__1__dataE1_ubits64__ret_dataE1_ubits64
	.def standard__memory__allocators__stdheap__heap_os_alloc__1__dataE1_ubits64__ret_dataE1_ubits64;
	.scl 2;
	.type 32;
	.endef
standard__memory__allocators__stdheap__heap_os_alloc__1__dataE1_ubits64__ret_dataE1_ubits64:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB59:
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
.LB64:
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
.LB70:
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
.LB76:
	cmpq $8, %rcx
	ja .LB82
.LB83:
	movl $16, %eax
	shlx %rcx, %rax, %rax
	ret
.LB82:
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
.LB88:
	cmpq $8, %rcx
	ja .LB95
.LB96:
	leaq standard__memory__allocators__stdheap__g_bins(%rip), %rax
	movslq %ecx, %rsi
	movq (%rax,%rsi,8), %rax
	movq %rax, (%rdx)
	leaq standard__memory__allocators__stdheap__g_bins(%rip), %rax
	movq %rdx, (%rax,%rcx,8)
	movq 0(%rsp), %rsi
	addq $16, %rsp
	ret
.LB95:
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
.LB107:
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
.LB126:
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
.LB137:
	movslq %edi, %rbx
	shlq $5, %rbx
	leaq (%rcx,%rbx,1), %rbx
	cmpq $0, (%rbx)
	je .LB139
.LB138:
	incq %rdi
	andq %rdx, %rdi
	jmp .LB137
.LB139:
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
.LB188:
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
	je .LB204
.LB205:
	movq $0, standard__memory__allocators__stdheap__g_table_count(%rip)
	xorl %ebx, %ebx
.LB211:
	movq standard__memory__allocators__stdheap__g_table_cap(%rip), %rax
	cmpq %rax, %rbx
	jae .LB213
.LB212:
	movq standard__memory__allocators__stdheap__g_table(%rip), %rax
	movslq %ebx, %rcx
	shlq $5, %rcx
	leaq (%rax,%rcx,1), %rax
	movq (%rax), %r8
	testq %r8, %r8
	jne .LB230
.LB229:
	incq %rbx
	jmp .LB211
.LB213:
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
.LB293:
	movl -128(%rbp), %r13d
	movslq %r13d, %r14
	shlq $5, %r14
	movq (%rdi,%r14,1), %r14
	testq %r14, %r14
	je .LB295
.LB294:
	movq -120(%rbp), %r15
	cmpq %r15, %r14
	je .LB322
.LB323:
	movq -64(%rbp), %r13
	movq -72(%rbp), %r10
	movq %r10, -96(%rbp)
	movq -80(%rbp), %r10
	movq %r10, -104(%rbp)
.LB321:
	testb %r9b, %r9b
	jne .LB295
.LB493:
	movq -128(%rbp), %r14
	incq %r14
	andq %rcx, %r14
	movq %r14, -128(%rbp)
	movq %r13, -64(%rbp)
	movq -96(%rbp), %r10
	movq %r10, -72(%rbp)
	movq -104(%rbp), %r10
	movq %r10, -80(%rbp)
	jmp .LB293
.LB322:
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
.LB341:
	movslq %edx, %r14
	shlq $5, %r14
	movq (%rdi,%r14,1), %r14
	testq %r14, %r14
	je .LB343
.LB342:
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
	jb .LB373
.LB374:
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
.LB372:
	testb %r12b, %r12b
	jne .LB409
.LB410:
.LB408:
	incq %rdx
	andq %rcx, %rdx
	movq %r14, %r13
	movq %r8, -112(%rbp)
	movq %r9, %r8
	movq %rsi, %r9
	movq %rbx, %r11
	movq %r12, %rbx
	movq %r11, %r12
	jmp .LB341
.LB343:
	movq %r9, -96(%rbp)
	movq -112(%rbp), %r10
	movq %r10, -104(%rbp)
	movl $1, %r9d
	testb %r9b, %r9b
	je .LB493
.LB295:
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
.LB373:
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
	je .LB410
.LB409:
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
	jmp .LB408
.LB230:
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
	jmp .LB229
.LB204:
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
.LB518:
	xorl %ecx, %ecx
	movl $32768, %edx
	movl $12288, %r8d
	movl $4, %r9d
	callq VirtualAlloc
	movq %rax, %rsi
	testq %rsi, %rsi
	je .LB532
.LB533:
	movq %rsi, %rdi
	movl $32768, %ecx
	xorl %eax, %eax
	rep stosb
.LB540:
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
.LB532:
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
.LB564:
	movq standard__memory__allocators__stdheap__g_table(%rip), %rax
	movq %rcx, %rsi
	movq %rdx, %rdi
	movq %r8, %rbx
	movq %r9, %r12
	testq %rax, %rax
	je .LB577
.LB576:
	movq standard__memory__allocators__stdheap__g_table_count(%rip), %rax
	movq standard__memory__allocators__stdheap__g_table_cap(%rip), %rcx
	shlq $1, %rax
	cmpq %rcx, %rax
	jae .LB590
.LB589:
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
.LB577:
	callq standard__memory__allocators__stdheap__table_init__0__ret_boolE1
	testb %al, %al
	je .LB582
	jmp .LB576
.LB590:
	callq standard__memory__allocators__stdheap__table_grow__0__ret_boolE1
	testb %al, %al
	jne .LB589
.LB595:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB582:
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
.LB606:
	movq standard__memory__allocators__stdheap__g_table(%rip), %rax
	testq %rax, %rax
	je .LB616
.LB617:
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
.LB624:
	movslq %esi, %rdi
	shlq $5, %rdi
	movq (%rax,%rdi,1), %rdi
	testq %rdi, %rdi
	je .LB626
.LB625:
	cmpq %rcx, %rdi
	je .LB653
.LB654:
	incq %rsi
	andq %rdx, %rsi
	jmp .LB624
.LB626:
	xorl %eax, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB653:
	shlq $5, %rsi
	leaq (%rax,%rsi,1), %rax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB616:
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
.LB667:
	movq standard__memory__allocators__stdheap__g_table(%rip), %rax
	testq %rax, %rax
	je .LB677
.LB678:
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
.LB688:
	movslq %esi, %rdi
	shlq $5, %rdi
	movq (%rax,%rdi,1), %rdi
	testq %rdi, %rdi
	je .LB690
.LB689:
	cmpq %rcx, %rdi
	je .LB716
.LB717:
	incq %rsi
	andq %rdx, %rsi
	jmp .LB688
.LB690:
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB716:
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
.LB735:
	movq standard__memory__allocators__stdheap__g_table(%rip), %rcx
	movslq %eax, %rdx
	shlq $5, %rdx
	movq (%rcx,%rdx,1), %rdx
	testq %rdx, %rdx
	je .LB737
.LB736:
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
	jb .LB766
.LB767:
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
.LB765:
	testb %dl, %dl
	jne .LB802
.LB803:
.LB801:
	incq %rax
	movq standard__memory__allocators__stdheap__g_table_cap(%rip), %rcx
	decq %rcx
	andq %rcx, %rax
	jmp .LB735
.LB737:
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB766:
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
	je .LB803
.LB802:
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
	jmp .LB801
.LB677:
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
.LB890:
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
	je .LB917
.LB918:
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
.LB917:
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
.LB956:
	movq standard__memory__allocators__stdheap__g_slab_head(%rip), %rax
	testq %rax, %rax
	je .LB971
.LB972:
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
.LB971:
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
.LB1017:
	movq %rcx, %rsi
	xorl %ecx, %ecx
	movq %rsi, %rdx
	movl $12288, %r8d
	movl $4, %r9d
	callq VirtualAlloc
	movq %rax, %rdi
	testq %rdi, %rdi
	je .LB1026
.LB1027:
	movq %rdi, %rcx
	movq %rsi, %rdx
	movl $1, %r8d
	movq %rsi, %r9
	callq standard__memory__allocators__stdheap__table_insert__4__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__ret_boolE1
	testb %al, %al
	je .LB1036
.LB1037:
	movq standard__memory__allocators__stdheap__g_large_used(%rip), %rax
	incq %rax
	movq %rax, standard__memory__allocators__stdheap__g_large_used(%rip)
	movq %rdi, %rax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB1036:
	movq %rdi, %rcx
	xorl %edx, %edx
	movl $32768, %r8d
	callq VirtualFree
	xorl %eax, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB1026:
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
.LB1044:
	testq %rcx, %rcx
	je .LB1050
.LB1051:
	cmpq $4096, %rcx
	ja .LB1057
.LB1058:
	decq %rcx
	movq %rcx, %rax
	orq $15, %rax
	bsrq %rax, %rax
	leaq -3(%rax), %rsi
	leaq standard__memory__allocators__stdheap__g_bins(%rip), %rax
	movslq %esi, %rcx
	movq (%rax,%rcx,8), %rax
	testq %rax, %rax
	jne .LB1080
.LB1081:
	movl $16, %eax
	shlx %rsi, %rax, %rax
	movl $4096, %ecx
	cmpq $8, %rsi
	movq %rax, %rdi
	cmova %rcx, %rdi
	movq standard__memory__allocators__stdheap__g_slab_head(%rip), %rax
	testq %rax, %rax
	je .LB12283
.LB12284:
	movq 16(%rax), %rcx
	movq 8(%rax), %r8
	movq (%rax), %r9
	leaq (%rcx,%rdi), %rdx
	leaq (%r9,%rcx,1), %rcx
	movq %rdx, 16(%rax)
	xorl %eax, %eax
	cmpq %r8, %rdx
	cmovbe %rcx, %rax
.LB12280:
	testq %rax, %rax
	je .LB1101
.LB1102:
	movq %rax, %rdi
.LB1100:
	movq standard__memory__allocators__stdheap__g_slab_head(%rip), %rax
	movq %rax, %r9
	movq %rdi, %rcx
	movq %rsi, %rdx
	xorl %r8d, %r8d
	callq standard__memory__allocators__stdheap__table_insert__4__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__ret_boolE1
	testb %al, %al
	je .LB1132
.LB1133:
	movq standard__memory__allocators__stdheap__g_slab_head(%rip), %rax
	movq 24(%rax), %rcx
	incq %rcx
	movq %rcx, 24(%rax)
	movq %rdi, %rax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB12283:
	xorl %eax, %eax
	testq %rax, %rax
	jne .LB1102
.LB1101:
	movq %rdi, %rcx
	callq standard__memory__allocators__stdheap__heap_new_slab__1__dataE1_ubits64__ret_SlabE1_ptr1
	testq %rax, %rax
	je .LB1111
.LB1112:
	movq standard__memory__allocators__stdheap__g_slab_head(%rip), %rax
	testq %rax, %rax
	je .LB12278
.LB12279:
	movq 16(%rax), %rcx
	leaq (%rcx,%rdi), %rdx
	movq 8(%rax), %rdi
	movq (%rax), %r8
	leaq (%r8,%rcx,1), %rcx
	movq %rdx, 16(%rax)
	xorl %eax, %eax
	cmpq %rdi, %rdx
	cmovbe %rcx, %rax
.LB12275:
	testq %rax, %rax
	je .LB1120
.LB1121:
	movq %rax, %rdi
	jmp .LB1100
.LB12278:
	xorl %eax, %eax
	testq %rax, %rax
	je .LB1120
	jmp .LB1121
.LB1132:
	xorl %eax, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB1120:
	xorl %eax, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB1111:
	xorl %eax, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB1080:
	leaq standard__memory__allocators__stdheap__g_bins(%rip), %rdx
	movq (%rax), %rcx
	movq %rcx, (%rdx,%rsi,8)
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB1057:
	callq standard__memory__allocators__stdheap__fmalloc_large__1__dataE1_ubits64__ret_dataE1_ubits64
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB1050:
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
.LB1144:
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
.LB1148:
	movq %rcx, %rsi
	testq %rsi, %rsi
	je .LB1154
.LB1155:
	movq standard__memory__allocators__stdheap__g_table(%rip), %rax
	testq %rax, %rax
	je .LB12288
.LB12289:
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
.LB12290:
	movslq %edx, %rdi
	shlq $5, %rdi
	movq (%rax,%rdi,1), %rdi
	testq %rdi, %rdi
	je .LB12292
.LB12291:
	cmpq %rsi, %rdi
	je .LB12294
.LB12295:
	incq %rdx
	andq %rcx, %rdx
	jmp .LB12290
.LB12292:
	xorl %eax, %eax
.LB12285:
	testq %rax, %rax
	je .LB1167
.LB1168:
	movq 8(%rax), %rcx
	cmpq $1, 16(%rax)
	je .LB1188
.LB1189:
	movq $3, 16(%rax)
	cmpq $8, %rcx
	ja .LB12301
.LB12302:
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
.LB12294:
	shlq $5, %rdx
	leaq (%rax,%rdx,1), %rax
	jmp .LB12285
.LB12288:
	xorl %eax, %eax
	jmp .LB12285
.LB12301:
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB1188:
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
.LB1167:
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB1154:
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
.LB1201:
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
.LB1205:
	cmpb $32, %cl
	jne .LB1209
.LB12564:
	movl $1, %eax
	ret
.LB1209:
	cmpb $9, %cl
	jne .LB1214
.LB12565:
	movl $1, %eax
	ret
.LB1214:
	cmpb $10, %cl
	jne .LB1219
.LB12566:
	movl $1, %eax
	ret
.LB1219:
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
.LB1224:
	cmpb $48, %cl
	jge .LB1228
.LB12567:
	xorl %eax, %eax
	ret
.LB1228:
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
.LB1233:
	cmpb $97, %cl
	jl .LB1242
.LB1237:
	cmpb $122, %cl
	jg .LB1242
.LB12568:
	movl $1, %eax
	ret
.LB1242:
	cmpb $65, %cl
	jge .LB1246
.LB12569:
	xorl %eax, %eax
	ret
.LB1246:
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
.LB1252:
	cmpb $65, %cl
	jge .LB1256
.LB12570:
	xorl %eax, %eax
	ret
.LB1256:
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
.LB1261:
	cmpb $97, %cl
	jge .LB1265
.LB12571:
	xorl %eax, %eax
	ret
.LB1265:
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
.LB1270:
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
.LB1279:
	cmpb $65, %cl
	jl .LB1289
.LB1283:
	cmpb $90, %cl
	jle .LB1288
.LB1289:
	movzbl %cl, %eax
	ret
.LB1288:
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
.LB1296:
	cmpb $97, %cl
	jl .LB1306
.LB1300:
	cmpb $122, %cl
	jle .LB1305
.LB1306:
	movzbl %cl, %eax
	ret
.LB1305:
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
.LB1313:
	movl %r8d, %eax
.LB1317:
	movslq %eax, %rsi
	movzbl (%rcx,%rsi,1), %esi
	testb %sil, %sil
	je .LB1320
.LB1318:
	cmpb %dl, %sil
	je .LB1335
.LB1336:
	incl %eax
	jmp .LB1317
.LB1320:
	movabsq $4294967295, %rax
	movq 0(%rsp), %rsi
	addq $16, %rsp
	ret
.LB1335:
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
.LB1342:
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
	jne .LS12573f
.LS12573l:
	addq $32, %rdx
	vpcmpeqb (%rdx), %ymm15, %ymm0
	vpmovmskb %ymm0, %r9d
	testl %r9d, %r9d
	je .LS12573l
	tzcntl %r9d, %r9d
	addq %rdx, %r9
	subq %rax, %r9
	jmp .LS12573d
.LS12573f:
	tzcntl %r9d, %r9d
.LS12573d:
	vzeroupper
.LB1351:
	xorl %eax, %eax
.LB1360:
	movslq %eax, %rcx
	cmpb $0, (%rdi,%rcx,1)
	je .LB1362
.LB1361:
	incl %eax
	jmp .LB1360
.LB1362:
	testl %eax, %eax
	je .LB1373
.LB1374:
	subl %eax, %r9d
.LB1377:
	cmpl %r9d, %r8d
	jg .LB1380
.LB1378:
	xorl %ecx, %ecx
.LB1388:
	cmpl %eax, %ecx
	jl .LB1389
.LB12572:
	movl $1, %ecx
.LB1391:
	testb %cl, %cl
	jne .LB1413
.LB1414:
	incl %r8d
	cmpl %r9d, %r8d
	jle .LB1378
.LB1380:
	movabsq $4294967295, %rax
	movq 16(%rsp), %rbx
	movq 8(%rsp), %rsi
	movq 0(%rsp), %rdi
	addq $32, %rsp
	ret
.LB1389:
	leal (%r8,%rcx), %edx
	movslq %ecx, %rbx
	movslq %edx, %rdx
	movzbl (%rsi,%rdx,1), %edx
	movzbl (%rdi,%rbx,1), %ebx
	cmpb %bl, %dl
	jne .LB1407
.LB1408:
	incl %ecx
	cmpl %eax, %ecx
	jl .LB1389
	jmp .LB12572
.LB1407:
	xorl %ecx, %ecx
	testb %cl, %cl
	je .LB1414
.LB1413:
	movl %r8d, %eax
	movq 16(%rsp), %rbx
	movq 8(%rsp), %rsi
	movq 0(%rsp), %rdi
	addq $32, %rsp
	ret
.LB1373:
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
.LB1420:
	movq %rcx, %rsi
	movq %rdx, %rdi
	xorl %ebx, %ebx
.LB1426:
	movslq %ebx, %rax
	cmpb $0, (%rsi,%rax,1)
	je .LB1428
.LB1435:
	cmpb $0, (%rdi,%rax,1)
	je .LB1428
.LB1427:
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
	jne .LB1457
.LB1458:
	incl %ebx
	jmp .LB1426
.LB1428:
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
.LB1457:
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
.LB1478:
	xorl %eax, %eax
.LB1482:
	movslq %eax, %rsi
	movzbl (%rdx,%rsi,1), %esi
	testb %sil, %sil
	je .LB1484
.LB1483:
	movslq %eax, %rdi
	movzbl (%rcx,%rdi,1), %edi
	cmpb %sil, %dil
	jne .LB1500
.LB1501:
	incl %eax
	jmp .LB1482
.LB1484:
	movl $1, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB1500:
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
.LB1505:
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
	jne .LS12574f
.LS12574l:
	addq $32, %rdx
	vpcmpeqb (%rdx), %ymm15, %ymm0
	vpmovmskb %ymm0, %r8d
	testl %r8d, %r8d
	je .LS12574l
	tzcntl %r8d, %r8d
	addq %rdx, %r8
	subq %rax, %r8
	jmp .LS12574d
.LS12574f:
	tzcntl %r8d, %r8d
.LS12574d:
	vzeroupper
.LB1512:
	xorl %eax, %eax
.LB1521:
	movslq %eax, %rcx
	cmpb $0, (%rdi,%rcx,1)
	je .LB1523
.LB1522:
	incl %eax
	jmp .LB1521
.LB1523:
	cmpl %r8d, %eax
	jg .LB1535
.LB1536:
	subl %eax, %r8d
	xorl %ecx, %ecx
.LB1542:
	cmpl %eax, %ecx
	jge .LB1545
.LB1543:
	leal (%r8,%rcx), %edx
	movslq %ecx, %r9
	movslq %edx, %rdx
	movzbl (%rsi,%rdx,1), %edx
	movzbl (%rdi,%r9,1), %r9d
	cmpb %r9b, %dl
	jne .LB1561
.LB1562:
	incl %ecx
	cmpl %eax, %ecx
	jl .LB1543
.LB1545:
	movl $1, %eax
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
.LB1535:
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
.LB1566:
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
	jne .LS12577f
.LS12577l:
	addq $32, %rdx
	vpcmpeqb (%rdx), %ymm15, %ymm0
	vpmovmskb %ymm0, %edi
	testl %edi, %edi
	je .LS12577l
	tzcntl %edi, %edi
	addq %rdx, %rdi
	subq %rax, %rdi
	jmp .LS12577d
.LS12577f:
	tzcntl %edi, %edi
.LS12577d:
	vzeroupper
.LB1571:
	leaq 1(%rdi), %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	testq %rax, %rax
	je .LB1591
.LB1592:
	movslq %edi, %rcx
	incq %rcx
	cmpq $32, %rcx
	jge .LB12575
.LB12576:
	xorl %ecx, %ecx
.LB1596:
	cmpl %edi, %ecx
	jg .LB1599
.LB1597:
	movslq %ecx, %rdx
	movzbl (%rsi,%rdx,1), %r8d
	movb %r8b, (%rax,%rdx,1)
	incl %ecx
	cmpl %edi, %ecx
	jle .LB1597
	jmp .LB1599
.LB12575:
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
.LB1599:
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB1591:
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
.LB1614:
	movq %rcx, %rsi
	movl %edx, %edi
	leaq 1(%rdi), %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	testq %rax, %rax
	je .LB1628
.LB1629:
	movslq %edi, %rcx
	xorl %edx, %edx
.LB1633:
	cmpq %rcx, %rdx
	jge .LB1636
.LB1641:
	movzbl (%rsi,%rdx,1), %r8d
	testb %r8b, %r8b
	je .LB1636
.LB1634:
	movb %r8b, (%rax,%rdx,1)
	incq %rdx
	cmpq %rcx, %rdx
	jl .LB1641
.LB1636:
	movslq %edi, %rcx
	movb $0, (%rax,%rcx,1)
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB1628:
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
.LB1664:
	movq %rcx, %rsi
	movl %edx, %edi
	movl %r8d, %ebx
	leaq 1(%rbx), %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	testq %rax, %rax
	je .LB1679
.LB1680:
	xorl %ecx, %ecx
.LB1684:
	cmpl %ebx, %ecx
	jge .LB1687
.LB1692:
	leal (%rdi,%rcx), %edx
	movslq %edx, %rdx
	cmpb $0, (%rsi,%rdx,1)
	je .LB1687
.LB1685:
	leal (%rdi,%rcx), %edx
	movslq %edx, %rdx
	movzbl (%rsi,%rdx,1), %edx
	movslq %ecx, %r8
	movb %dl, (%rax,%r8,1)
	incl %ecx
	cmpl %ebx, %ecx
	jl .LB1692
.LB1687:
	movslq %ebx, %rcx
	movb $0, (%rax,%rcx,1)
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB1679:
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
.LB1719:
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
	jne .LS12586f
.LS12586l:
	addq $32, %rdx
	vpcmpeqb (%rdx), %ymm15, %ymm0
	vpmovmskb %ymm0, %edi
	testl %edi, %edi
	je .LS12586l
	tzcntl %edi, %edi
	addq %rdx, %rdi
	subq %rax, %rdi
	jmp .LS12586d
.LS12586f:
	tzcntl %edi, %edi
.LS12586d:
	vzeroupper
	movl %edi, %r12d
.LB1725:
	xorl %r13d, %r13d
.LB1735:
	movslq %r13d, %rax
	cmpb $0, (%rbx,%rax,1)
	je .LB1737
.LB1736:
	incl %r13d
	jmp .LB1735
.LB1737:
	leaq (%r12,%r13), %rax
	leaq 1(%rax), %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	testq %rax, %rax
	je .LB1760
.LB1761:
	cmpl $32, %r12d
	jge .LB12578
.LB12579:
	movslq %r12d, %rcx
	xorl %edx, %edx
	testq %rcx, %rcx
	cmovg %rcx, %rdx
	shrq $2, %rdx
	xorl %edi, %edi
.LB12580:
	testq %rdx, %rdx
	je .LB12582
.LB12581:
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
	jne .LB12581
.LB12582:
.LB1765:
	cmpq %rcx, %rdi
	jge .LB1768
.LB1766:
	movzbl (%rsi,%rdi,1), %edx
	movb %dl, (%rax,%rdi,1)
	incq %rdi
	cmpq %rcx, %rdi
	jl .LB1766
	jmp .LB1768
.LB12578:
	movslq %r12d, %rcx
	movq %rcx, %rdx
	sarq $63, %rdx
	notq %rdx
	andq %rdx, %rcx
	movq %rax, %rdi
	rep movsb
.LB1768:
	xorl %ecx, %ecx
	testl %r13d, %r13d
	cmovg %r13d, %ecx
	shrl $2, %ecx
	xorl %edx, %edx
.LB12583:
	testl %ecx, %ecx
	je .LB12585
.LB12584:
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
	jne .LB12584
.LB12585:
.LB1782:
	cmpl %r13d, %edx
	jge .LB1785
.LB1783:
	movslq %edx, %rcx
	movzbl (%rbx,%rcx,1), %ecx
	leal (%r12,%rdx), %esi
	movslq %esi, %rsi
	movb %cl, (%rax,%rsi,1)
	incl %edx
	cmpl %r13d, %edx
	jl .LB1783
.LB1785:
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
.LB1760:
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
.LB1808:
	movq %rcx, %rax
	xorl %ecx, %ecx
.LB1812:
	leaq 1(%rax), %rdx
	cmpb $0, (%rax)
	je .LB1819
.LB1820:
	incl %ecx
	movq %rdx, %rax
	jmp .LB1812
.LB1819:
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
.LB1824:
	testw %cx, %cx
	je .LB1830
.LB1831:
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
.LB1852:
	testw %cx, %cx
	jle .LB1854
.LB1853:
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
	jg .LB1853
.LB1854:
	testb %al, %al
	jne .LB1874
.LB1875:
	xorl %eax, %eax
.LB1876:
	leal -1(%rsi), %ecx
.LB1885:
	testw %cx, %cx
	js .LB1887
.LB1886:
	movswl %cx, %esi
	movslq %esi, %rsi
	movzbl (%rsp,%rsi,1), %esi
	movswq %ax, %rdi
	movb %sil, (%rdx,%rdi,1)
	incl %eax
	decl %ecx
	testw %cx, %cx
	jns .LB1886
	jmp .LB1887
.LB1874:
	movb $45, (%rdx)
	movl $1, %eax
	jmp .LB1876
.LB1887:
	movswq %ax, %rcx
	movzwl %ax, %eax
	movb $0, (%rdx,%rcx,1)
	movq 16(%rsp), %rsi
	movq 8(%rsp), %rdi
	addq $32, %rsp
	ret
.LB1830:
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
.LB1907:
	testl %ecx, %ecx
	je .LB1912
.LB1913:
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
.LB1931:
	testl %ecx, %ecx
	jle .LB1933
.LB1932:
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
	jg .LB1932
.LB1933:
	cmpl $1, %edi
	je .LB1949
.LB1950:
	xorl %ecx, %ecx
.LB1951:
	decl %eax
.LB1958:
	testl %eax, %eax
	js .LB1960
.LB1959:
	movslq %eax, %rsi
	movzbl -8(%rsp,%rsi,1), %esi
	movslq %ecx, %rdi
	movb %sil, (%rdx,%rdi,1)
	incl %ecx
	decl %eax
	jns .LB1959
	jmp .LB1960
.LB1949:
	movb $45, (%rdx)
	movl $1, %ecx
	jmp .LB1951
.LB1960:
	movslq %ecx, %rax
	movb $0, (%rdx,%rax,1)
	movl %ecx, %eax
	movq 32(%rsp), %rsi
	movq 24(%rsp), %rdi
	addq $48, %rsp
	ret
.LB1912:
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
.LB1978:
	movq %rdx, %rsi
	testq %rcx, %rcx
	je .LB1984
.LB1985:
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
.LB2008:
	testq %rcx, %rcx
	jle .LB2010
.LB2009:
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
	jg .LB2009
.LB2010:
	cmpq $1, %rdi
	je .LB2032
.LB2033:
	xorl %eax, %eax
.LB2034:
	leaq -1(%r8), %rcx
.LB2043:
	testq %rcx, %rcx
	js .LB2045
.LB2044:
	movslq %ecx, %rdx
	movzbl -8(%rsp,%rdx,1), %edx
	movb %dl, (%rsi,%rax,1)
	incq %rax
	decq %rcx
	jns .LB2044
	jmp .LB2045
.LB2032:
	movb $45, (%rsi)
	movl $1, %eax
	jmp .LB2034
.LB2045:
	movb $0, (%rsi,%rax,1)
	movq 32(%rsp), %rsi
	movq 24(%rsp), %rdi
	addq $48, %rsp
	ret
.LB1984:
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
.LB2065:
	testw %cx, %cx
	je .LB2071
.LB2072:
	movq .LZERO(%rip), %r10
	movq %r10, (%rsp)
	xorl %eax, %eax
.LB2084:
	testw %cx, %cx
	jbe .LB2086
.LB2085:
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
	ja .LB2085
.LB2086:
	movq %rax, %rcx
	xorl %eax, %eax
.LB2107:
	testw %cx, %cx
	jbe .LB2109
.LB2108:
	decl %ecx
	movswl %cx, %esi
	movslq %esi, %rsi
	movzbl (%rsp,%rsi,1), %esi
	movswq %ax, %rdi
	movb %sil, (%rdx,%rdi,1)
	incl %eax
	testw %cx, %cx
	ja .LB2108
.LB2109:
	movswq %ax, %rcx
	movzwl %ax, %eax
	movb $0, (%rdx,%rcx,1)
	movq 16(%rsp), %rsi
	movq 8(%rsp), %rdi
	addq $32, %rsp
	ret
.LB2071:
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
.LB2129:
	testl %ecx, %ecx
	je .LB2134
.LB2135:
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -8(%rsp)
	vzeroupper
	xorl %eax, %eax
.LB2145:
	testl %ecx, %ecx
	jbe .LB2147
.LB2146:
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
	ja .LB2146
.LB2147:
	movq %rax, %rcx
	xorl %eax, %eax
.LB2163:
	testl %ecx, %ecx
	jbe .LB2165
.LB2164:
	decl %ecx
	movslq %ecx, %rsi
	movzbl -8(%rsp,%rsi,1), %esi
	movslq %eax, %rdi
	movb %sil, (%rdx,%rdi,1)
	incl %eax
	testl %ecx, %ecx
	ja .LB2164
.LB2165:
	movslq %eax, %rcx
	movb $0, (%rdx,%rcx,1)
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
	.globl standard__strings__u64str__2__dataE1_ubits64__byteE1_ptr1__ret_dataE1_ubits64
	.def standard__strings__u64str__2__dataE1_ubits64__byteE1_ptr1__ret_dataE1_ubits64;
	.scl 2;
	.type 32;
	.endef
standard__strings__u64str__2__dataE1_ubits64__byteE1_ptr1__ret_dataE1_ubits64:
	subq $48, %rsp
	movq %rsi, 32(%rsp)
	movq %rdi, 24(%rsp)
.LB2183:
	movq %rdx, %rsi
	testq %rcx, %rcx
	je .LB2189
.LB2190:
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -8(%rsp)
	vzeroupper
	xorl %edi, %edi
.LB2202:
	testq %rcx, %rcx
	je .LB2204
.LB2203:
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
	jne .LB2203
.LB2204:
	xorl %eax, %eax
.LB2225:
	testq %rdi, %rdi
	je .LB2227
.LB2226:
	decq %rdi
	movslq %edi, %rcx
	movzbl -8(%rsp,%rcx,1), %ecx
	movb %cl, (%rsi,%rax,1)
	incq %rax
	testq %rdi, %rdi
	jne .LB2226
.LB2227:
	movb $0, (%rsi,%rax,1)
	movq 32(%rsp), %rsi
	movq 24(%rsp), %rdi
	addq $48, %rsp
	ret
.LB2189:
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
.LB2247:
	xorl %eax, %eax
.LB2254:
	movslq %eax, %rdx
	movzbl (%rcx,%rdx,1), %esi
	cmpb $32, %sil
	je .LB2255
.LB2263:
	cmpb $9, %sil
	je .LB2255
.LB2272:
	cmpb $10, (%rcx,%rdx,1)
	je .LB2255
.LB2281:
	cmpb $13, (%rcx,%rdx,1)
	jne .LB2256
.LB2255:
	incl %eax
	jmp .LB2254
.LB2256:
	movzbl (%rcx,%rdx,1), %edx
	cmpb $45, %dl
	je .LB2298
.LB2299:
	cmpb $43, %dl
	je .LB2310
.LB2311:
	movl $1, %edx
.LB2300:
	movq %rax, %rsi
	xorl %eax, %eax
.LB2314:
	movslq %esi, %rdi
	movzbl (%rcx,%rdi,1), %edi
	testb %dil, %dil
	je .LB2316
.LB2315:
	cmpb $48, %dil
	jb .LB2316
.LB2330:
	cmpb $57, %dil
	ja .LB2316
.LB2336:
	movzbl %dil, %edi
	subl $48, %edi
	imull $10, %eax, %eax
	addl %edi, %eax
	incl %esi
	jmp .LB2314
.LB2310:
	incl %eax
	movl $1, %edx
	jmp .LB2300
.LB2298:
	incl %eax
	movl $4294967295, %edx
	jmp .LB2300
.LB2316:
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
.LB2351:
	xorl %eax, %eax
.LB2357:
	movslq %eax, %rdx
	movzbl (%rcx,%rdx,1), %edx
	leal -9(%rdx), %esi
	cmpb $24, %sil
	jae .LB12587
.LB12588:
	movzbl %sil, %esi
	movl $8388627, %edi
	btq %rsi, %rdi
	jae .LB12587
.LB2358:
	incl %eax
	jmp .LB2357
.LB12587:
	cmpb $45, %dl
	je .LB2401
.LB2402:
	leal 1(%rax), %esi
	cmpb $43, %dl
	cmove %esi, %eax
	movq %rax, %rdx
	xorl %eax, %eax
.LB2414:
	movslq %edx, %rsi
	movzbl (%rcx,%rsi,1), %esi
	movzbl %sil, %edi
	testb %sil, %sil
	je .LB2416
.LB2415:
	cmpb $48, %sil
	jb .LB2437
.LB2430:
	cmpb $57, %sil
	ja .LB2437
.LB2436:
	subl $48, %edi
	imull $10, %eax, %eax
	addl %edi, %eax
	incl %edx
	jmp .LB2414
.LB2437:
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB2416:
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB2401:
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
.LB2449:
	xorl %eax, %eax
.LB2457:
	movslq %eax, %rdx
	movzbl (%rcx,%rdx,1), %esi
	cmpb $32, %sil
	je .LB2458
.LB2466:
	cmpb $9, %sil
	je .LB2458
.LB2475:
	cmpb $10, (%rcx,%rdx,1)
	je .LB2458
.LB2484:
	cmpb $13, (%rcx,%rdx,1)
	jne .LB2459
.LB2458:
	incl %eax
	jmp .LB2457
.LB2459:
	movzbl (%rcx,%rdx,1), %edx
	cmpb $45, %dl
	je .LB2501
.LB2502:
	cmpb $43, %dl
	je .LB2514
.LB2515:
	movq %rax, %rdx
	movl $1, %eax
.LB2503:
	movq %rdx, %rsi
	xorl %edx, %edx
.LB2518:
	movslq %esi, %rdi
	movzbl (%rcx,%rdi,1), %edi
	testb %dil, %dil
	je .LB2520
.LB2519:
	cmpb $48, %dil
	jb .LB2520
.LB2534:
	cmpb $57, %dil
	ja .LB2520
.LB2540:
	movzbl %dil, %edi
	subl $48, %edi
	imulq $10, %rdx, %rdx
	addq %rdi, %rdx
	incl %esi
	jmp .LB2518
.LB2514:
	leal 1(%rax), %edx
	movl $1, %eax
	jmp .LB2503
.LB2501:
	leal 1(%rax), %edx
	movq $-1, %rax
	jmp .LB2503
.LB2520:
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
.LB2557:
	xorl %eax, %eax
.LB2563:
	movslq %eax, %rdx
	movzbl (%rcx,%rdx,1), %edx
	leal -9(%rdx), %esi
	cmpb $24, %sil
	jae .LB12589
.LB12590:
	movzbl %sil, %esi
	movl $8388627, %edi
	btq %rsi, %rdi
	jae .LB12589
.LB2564:
	incl %eax
	jmp .LB2563
.LB12589:
	cmpb $45, %dl
	je .LB2607
.LB2608:
	leal 1(%rax), %esi
	cmpb $43, %dl
	cmove %esi, %eax
	movq %rax, %rdx
	xorl %eax, %eax
.LB2621:
	movslq %edx, %rsi
	movzbl (%rcx,%rsi,1), %esi
	movzbl %sil, %edi
	testb %sil, %sil
	je .LB2623
.LB2622:
	cmpb $48, %sil
	jb .LB2644
.LB2637:
	cmpb $57, %sil
	ja .LB2644
.LB2643:
	leal -48(%rdi), %esi
	imulq $10, %rax, %rax
	addq %rsi, %rax
	incl %edx
	jmp .LB2621
.LB2644:
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB2623:
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB2607:
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
.LB2658:
	xorps %xmm1, %xmm1
	ucomiss %xmm0, %xmm1
	ja .LB2666
.LB2667:
	xorl %eax, %eax
.LB2668:
	xorps %xmm1, %xmm1
	ucomiss %xmm1, %xmm0
	sete %cl
	setnp %sil
	movzbl %cl, %ecx
	movzbl %sil, %esi
	andl %esi, %ecx
	testb %cl, %cl
	jne .LB2676
.LB2677:
	cvttss2siq %xmm0, %rcx
	movl %ecx, %ecx
	movslq %ecx, %rsi
	xorps %xmm1, %xmm1
	cvtsi2ssq %rsi, %xmm1
	subss %xmm1, %xmm0
	movl $1, %esi
	xorl %edi, %edi
.LB2724:
	cmpl %r8d, %edi
	jge .LB2726
.LB2725:
	imull $10, %esi, %esi
	incl %edi
	cmpl %r8d, %edi
	jl .LB2725
	jmp .LB2726
.LB2666:
	movb $45, (%rdx)
	xorps %xmm1, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subss %xmm15, %xmm0
	movl $1, %eax
	jmp .LB2668
.LB2726:
	movslq %esi, %rdi
	xorps %xmm1, %xmm1
	cvtsi2ssq %rdi, %xmm1
	movabsq $1056964608, %r10
	movq %r10, %xmm2
	vfmadd132ss %xmm1, %xmm2, %xmm0
	cvttss2siq %xmm0, %rdi
	movl %edi, %edi
	cmpl %esi, %edi
	jge .LB2746
.LB2747:
.LB2748:
	testl %ecx, %ecx
	je .LB2764
.LB2765:
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, 32(%rsp)
	vzeroupper
	movq %rcx, %rsi
	xorl %ecx, %ecx
.LB2777:
	testl %esi, %esi
	jle .LB2779
.LB2778:
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
	jg .LB2778
	jmp .LB2779
.LB2746:
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
	jne .LB2761
.LB2754:
	testl %r8d, %r8d
	jle .LB2761
.LB2761:
	xorl %edi, %edi
	testl %ecx, %ecx
	je .LB2764
	jmp .LB2765
.LB2779:
	decl %ecx
.LB2795:
	testl %ecx, %ecx
	js .LB2797
.LB2796:
	movslq %ecx, %rsi
	movzbl 32(%rsp,%rsi,1), %esi
	movslq %eax, %r9
	movb %sil, (%rdx,%r9,1)
	incl %eax
	decl %ecx
	jns .LB2796
.LB2797:
.LB2766:
	testl %r8d, %r8d
	jg .LB2812
.LB2813:
	movslq %eax, %rcx
	movb $0, (%rdx,%rcx,1)
	movq 80(%rsp), %rbx
	movq 72(%rsp), %rsi
	movq 64(%rsp), %rdi
	addq $96, %rsp
	ret
.LB2764:
	movslq %eax, %rcx
	movb $48, (%rdx,%rcx,1)
	incl %eax
	testl %r8d, %r8d
	jle .LB2813
.LB2812:
	movslq %eax, %rcx
	movb $46, (%rdx,%rcx,1)
	incl %eax
	testl %edi, %edi
	je .LB2823
.LB2824:
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, (%rsp)
	vzeroupper
	xorl %ecx, %ecx
.LB2845:
	testl %edi, %edi
	jle .LB2847
.LB2846:
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
	jg .LB2846
.LB2847:
	subl %ecx, %r8d
	xorl %esi, %esi
.LB2865:
	cmpl %r8d, %esi
	jge .LB2867
.LB2866:
	movslq %eax, %rdi
	movb $48, (%rdx,%rdi,1)
	incl %eax
	incl %esi
	cmpl %r8d, %esi
	jl .LB2866
.LB2867:
	decl %ecx
.LB2882:
	testl %ecx, %ecx
	js .LB2884
.LB2883:
	movslq %ecx, %rsi
	movzbl (%rsp,%rsi,1), %esi
	movslq %eax, %rdi
	movb %sil, (%rdx,%rdi,1)
	incl %eax
	decl %ecx
	jns .LB2883
.LB2884:
.LB2825:
	movslq %eax, %rcx
	movb $0, (%rdx,%rcx,1)
	movq 80(%rsp), %rbx
	movq 72(%rsp), %rsi
	movq 64(%rsp), %rdi
	addq $96, %rsp
	ret
.LB2823:
	xorl %ecx, %ecx
.LB2827:
	cmpl %r8d, %ecx
	jge .LB2829
.LB2828:
	movslq %eax, %rsi
	movb $48, (%rdx,%rsi,1)
	incl %eax
	incl %ecx
	cmpl %r8d, %ecx
	jl .LB2828
.LB2829:
	jmp .LB2825
.LB2676:
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
.LB12591:
	testl %esi, %esi
	je .LB12593
.LB12592:
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
	jne .LB12592
.LB12593:
.LB2688:
	cmpl %r8d, %edi
	jge .LB2690
.LB2689:
	leal (%rcx,%rdi), %esi
	movslq %esi, %rsi
	movb $48, (%rdx,%rsi,1)
	incl %edi
	cmpl %r8d, %edi
	jl .LB2689
.LB2690:
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
.LB2902:
	movq %rdx, %rcx
	xorps %xmm1, %xmm1
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm0, %xmm1
	ja .LB2910
.LB2911:
	xorl %esi, %esi
.LB2912:
	xorps %xmm1, %xmm1
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm1, %xmm0
	sete %al
	setnp %dl
	movzbl %al, %eax
	movzbl %dl, %edx
	andl %edx, %eax
	testb %al, %al
	jne .LB2920
.LB2921:
	cvttsd2siq %xmm0, %rax
	xorps %xmm1, %xmm1
	cvtsi2sdq %rax, %xmm1
	subsd %xmm1, %xmm0
	movl $1, %edx
	xorl %edi, %edi
.LB2970:
	cmpl %r8d, %edi
	jge .LB2972
.LB2971:
	imulq $10, %rdx, %rdx
	incl %edi
	cmpl %r8d, %edi
	jl .LB2971
	jmp .LB2972
.LB2910:
	movb $69, (%rcx)
	xorps %xmm1, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subsd %xmm15, %xmm0
	movl $1, %esi
	jmp .LB2912
.LB2972:
	xorps %xmm1, %xmm1
	cvtsi2sdq %rdx, %xmm1
	movabsq $1056964608, %r10
	movq %r10, %xmm2
	cvtss2sd %xmm2, %xmm2
	vfmadd132sd %xmm1, %xmm2, %xmm0
	cvttsd2siq %xmm0, %rdi
	cmpq %rdx, %rdi
	jge .LB2994
.LB2995:
.LB2996:
	testq %rax, %rax
	je .LB3017
.LB3018:
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, 32(%rsp)
	vzeroupper
	xorl %r9d, %r9d
	movq %rax, %rbx
.LB3030:
	testq %rbx, %rbx
	jle .LB3032
.LB3031:
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
	jg .LB3031
	jmp .LB3032
.LB2994:
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
	jne .LB3013
.LB3006:
	testl %r8d, %r8d
	jle .LB3013
.LB3013:
	movq %rdi, %rax
	xorl %edi, %edi
	testq %rax, %rax
	je .LB3017
	jmp .LB3018
.LB3032:
	leal -1(%r9), %eax
.LB3052:
	testl %eax, %eax
	js .LB3054
.LB3053:
	movslq %eax, %rdx
	movzbl 32(%rsp,%rdx,1), %edx
	movslq %esi, %r9
	movb %dl, (%rcx,%r9,1)
	incl %esi
	decl %eax
	jns .LB3053
.LB3054:
.LB3019:
	testl %r8d, %r8d
	jg .LB3069
.LB3070:
	movq %rsi, %rax
	movslq %eax, %rdx
	movb $0, (%rcx,%rdx,1)
	movq 80(%rsp), %rbx
	movq 72(%rsp), %rsi
	movq 64(%rsp), %rdi
	addq $96, %rsp
	ret
.LB3017:
	movslq %esi, %rax
	movb $48, (%rcx,%rax,1)
	incl %esi
	testl %r8d, %r8d
	jle .LB3070
.LB3069:
	movslq %esi, %rax
	movb $46, (%rcx,%rax,1)
	incl %esi
	testq %rdi, %rdi
	je .LB3081
.LB3082:
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, (%rsp)
	vzeroupper
	movq %rdi, %r9
	xorl %edi, %edi
.LB3103:
	testq %r9, %r9
	jle .LB3105
.LB3104:
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
	jg .LB3104
.LB3105:
	subl %edi, %r8d
	xorl %eax, %eax
.LB3127:
	cmpl %r8d, %eax
	jge .LB3129
.LB3128:
	movslq %esi, %rdx
	movb $48, (%rcx,%rdx,1)
	incl %esi
	incl %eax
	cmpl %r8d, %eax
	jl .LB3128
.LB3129:
	leal -1(%rdi), %eax
.LB3144:
	testl %eax, %eax
	js .LB3146
.LB3145:
	movslq %eax, %rdx
	movzbl (%rsp,%rdx,1), %edx
	movslq %esi, %rdi
	movb %dl, (%rcx,%rdi,1)
	incl %esi
	decl %eax
	jns .LB3145
.LB3146:
.LB3083:
	movq %rsi, %rax
	movslq %eax, %rdx
	movb $0, (%rcx,%rdx,1)
	movq 80(%rsp), %rbx
	movq 72(%rsp), %rsi
	movq 64(%rsp), %rdi
	addq $96, %rsp
	ret
.LB3081:
	xorl %eax, %eax
.LB3085:
	cmpl %r8d, %eax
	jge .LB3087
.LB3086:
	movslq %esi, %rdx
	movb $48, (%rcx,%rdx,1)
	incl %esi
	incl %eax
	cmpl %r8d, %eax
	jl .LB3086
.LB3087:
	jmp .LB3083
.LB2920:
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
.LB12598:
	testl %edx, %edx
	je .LB12600
.LB12599:
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
	jne .LB12599
.LB12600:
.LB2933:
	cmpl %r8d, %edi
	jge .LB2935
.LB2934:
	leal (%rax,%rdi), %edx
	movslq %edx, %rdx
	movb $48, (%rcx,%rdx,1)
	incl %edi
	cmpl %r8d, %edi
	jl .LB2934
.LB2935:
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
.LB3164:
	xorl %eax, %eax
	xorl %edx, %edx
.LB3167:
	movslq %edx, %rsi
	movzbl (%rcx,%rsi,1), %esi
	testb %sil, %sil
	je .LB3170
.LB3168:
	leal 1(%rax), %edi
	cmpb $10, %sil
	cmove %edi, %eax
	incl %edx
	jmp .LB3167
.LB3170:
	testl %eax, %eax
	jg .LB3200
.LB3192:
	cmpb $0, (%rcx)
	jne .LB3200
.LB3201:
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB3200:
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
.LB3206:
	xorl %eax, %eax
	xorl %esi, %esi
.LB3211:
	movslq %esi, %rdi
	movzbl (%rcx,%rdi,1), %edi
	testb %dil, %dil
	jne .LB3212
.LB12605:
	xorl %esi, %esi
.LB3214:
	cmpl %edx, %eax
	jne .LB3244
.LB3245:
	movq %rsi, %rax
.LB3251:
	movslq %eax, %rdx
	movzbl (%rcx,%rdx,1), %edx
	testb %dl, %dl
	je .LB3253
.LB3260:
	cmpb $10, %dl
	je .LB3253
.LB3252:
	incl %eax
	jmp .LB3251
.LB3212:
	cmpl %edx, %eax
	je .LB3225
.LB3226:
	leal 1(%rax), %r8d
	cmpb $10, %dil
	cmove %r8d, %eax
	incl %esi
	jmp .LB3211
.LB3225:
	cmpl %edx, %eax
	jne .LB3244
	jmp .LB3245
.LB3253:
	movl %eax, %r8d
	subl %esi, %r8d
	movq %rsi, %rdx
	callq standard__strings__manip__substring__3__byteE1_ptr1__intE1__intE1__ret_byteE1_ptr1
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB3244:
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
.LB3278:
	movq %rcx, %rsi
	xorl %edi, %edi
	xorl %ebx, %ebx
	xorl %r12d, %r12d
.LB3282:
	movslq %r12d, %rax
	movzbl (%rsi,%rax,1), %eax
	testb %al, %al
	je .LB3285
.LB3283:
	movzbl %al, %ecx
	callq standard__strings__helpers__is_whitespace__1__charE1__ret_boolE1
	testb %al, %al
	jne .LB3298
.LB3299:
	testb %bl, %bl
	je .LB3303
.LB3304:
.LB3300:
	incl %r12d
	jmp .LB3282
.LB3285:
	movl %edi, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB3303:
	incl %edi
	movl $1, %ebx
	jmp .LB3300
.LB3298:
	xorl %ebx, %ebx
	jmp .LB3300
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
.LB3310:
	movq %rcx, %rbx
	movq %rdx, %rsi
	movq %r8, %r12
	movq %rbx, %rcx
	movq %rsi, %rdx
	xorl %r8d, %r8d
	callq standard__strings__helpers__find_substring__3__byteE1_ptr1__byteE1_ptr1__intE1__ret_intE1
	movl %eax, %r13d
	cmpl $4294967295, %r13d
	je .LB3321
.LB3322:
	xorl %r14d, %r14d
.LB3327:
	movslq %r14d, %rax
	cmpb $0, (%rbx,%rax,1)
	je .LB3329
.LB3328:
	incl %r14d
	jmp .LB3327
.LB3329:
	xorl %r15d, %r15d
.LB3339:
	movslq %r15d, %rax
	cmpb $0, (%rsi,%rax,1)
	je .LB3341
.LB3340:
	incl %r15d
	jmp .LB3339
.LB3341:
	movq $0, -64(%rbp)
.LB3351:
	movq -64(%rbp), %rax
	movslq %eax, %rax
	cmpb $0, (%r12,%rax,1)
	je .LB3353
.LB3352:
	movq -64(%rbp), %rax
	incl %eax
	movq %rax, -64(%rbp)
	jmp .LB3351
.LB3353:
	movl %r14d, %eax
	subl %r15d, %eax
	movq -64(%rbp), %rcx
	addl %ecx, %eax
	leaq 1(%rax), %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	testq %rax, %rax
	je .LB3379
.LB3380:
	cmpl $32, %r13d
	jge .LB12606
.LB12607:
	movslq %r13d, %rcx
	xorl %edx, %edx
	testq %rcx, %rcx
	cmovg %rcx, %rdx
	shrq $2, %rdx
	xorl %esi, %esi
.LB12608:
	testq %rdx, %rdx
	je .LB12610
.LB12609:
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
	jne .LB12609
.LB12610:
.LB3384:
	cmpq %rcx, %rsi
	jge .LB3387
.LB3385:
	movzbl (%rbx,%rsi,1), %edx
	movb %dl, (%rax,%rsi,1)
	incq %rsi
	cmpq %rcx, %rsi
	jl .LB3385
	jmp .LB3387
.LB12606:
	movslq %r13d, %rcx
	movq %rcx, %rdx
	sarq $63, %rdx
	notq %rdx
	andq %rdx, %rcx
	movq %rax, %rdi
	movq %rbx, %rsi
	rep movsb
.LB3387:
	xorl %ecx, %ecx
	movq -64(%rbp), %rdx
	testl %edx, %edx
	cmovg %edx, %ecx
	shrl $2, %ecx
	xorl %edx, %edx
.LB12611:
	testl %ecx, %ecx
	je .LB12613
.LB12612:
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
	jne .LB12612
.LB12613:
.LB3401:
	movq -64(%rbp), %rcx
	cmpl %ecx, %edx
	jge .LB3404
.LB3402:
	movslq %edx, %rcx
	movzbl (%r12,%rcx,1), %ecx
	leal (%r13,%rdx), %esi
	movslq %esi, %rsi
	movb %cl, (%rax,%rsi,1)
	incl %edx
	jmp .LB3401
.LB3404:
	leal (%r13,%r15), %ecx
.LB3420:
	cmpl %r14d, %ecx
	jg .LB3423
.LB3421:
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
	jle .LB3421
.LB3423:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB3379:
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
.LB3321:
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
.LB3445:
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
.LB12614:
	testq %rdx, %rdx
	je .LB12616
.LB12615:
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
	jne .LB12615
.LB12616:
.LB3456:
	cmpq %rcx, %r8
	jge .LB3458
.LB3457:
	movzbl -32(%rbp,%r8,1), %edx
	movslq (%rdi), %r9
	movb %dl, (%rsi,%r9,1)
	movl (%rdi), %edx
	incl %edx
	movl %edx, (%rdi)
	incq %r8
	cmpq %rcx, %r8
	jl .LB3457
.LB3458:
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
.LB3476:
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
.LB12617:
	testq %rdx, %rdx
	je .LB12619
.LB12618:
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
	jne .LB12618
.LB12619:
.LB3486:
	cmpq %rcx, %r8
	jge .LB3488
.LB3487:
	movzbl -56(%rbp,%r8,1), %edx
	movslq (%rdi), %r9
	movb %dl, (%rsi,%r9,1)
	movl (%rdi), %edx
	incl %edx
	movl %edx, (%rdi)
	incq %r8
	cmpq %rcx, %r8
	jl .LB3487
.LB3488:
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
.LB3506:
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
.LB12620:
	testq %rdx, %rdx
	je .LB12622
.LB12621:
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
	jne .LB12621
.LB12622:
.LB3517:
	cmpq %rcx, %r8
	jge .LB3519
.LB3518:
	movzbl -56(%rbp,%r8,1), %edx
	movslq (%rdi), %r9
	movb %dl, (%rsi,%r9,1)
	movl (%rdi), %edx
	incl %edx
	movl %edx, (%rdi)
	incq %r8
	cmpq %rcx, %r8
	jl .LB3518
.LB3519:
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
.LB3537:
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
.LB12623:
	testq %rdx, %rdx
	je .LB12625
.LB12624:
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
	jne .LB12624
.LB12625:
.LB3548:
	cmpq %rcx, %r8
	jge .LB3550
.LB3549:
	movzbl -32(%rbp,%r8,1), %edx
	movslq (%rdi), %r9
	movb %dl, (%rsi,%r9,1)
	movl (%rdi), %edx
	incl %edx
	movl %edx, (%rdi)
	incq %r8
	cmpq %rcx, %r8
	jl .LB3549
.LB3550:
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
.LB3568:
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
.LB12626:
	testq %rdx, %rdx
	je .LB12628
.LB12627:
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
	jne .LB12627
.LB12628:
.LB3578:
	cmpq %rcx, %r8
	jge .LB3580
.LB3579:
	movzbl -56(%rbp,%r8,1), %edx
	movslq (%rdi), %r9
	movb %dl, (%rsi,%r9,1)
	movl (%rdi), %edx
	incl %edx
	movl %edx, (%rdi)
	incq %r8
	cmpq %rcx, %r8
	jl .LB3579
.LB3580:
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
.LB3598:
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
.LB12629:
	testq %rdx, %rdx
	je .LB12631
.LB12630:
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
	jne .LB12630
.LB12631:
.LB3609:
	cmpq %rcx, %r8
	jge .LB3611
.LB3610:
	movzbl -56(%rbp,%r8,1), %edx
	movslq (%rdi), %r9
	movb %dl, (%rsi,%r9,1)
	movl (%rdi), %edx
	incl %edx
	movl %edx, (%rdi)
	incq %r8
	cmpq %rcx, %r8
	jl .LB3610
.LB3611:
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
.LB3629:
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
.LB12632:
	testq %rdx, %rdx
	je .LB12634
.LB12633:
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
	jne .LB12633
.LB12634:
.LB3639:
	cmpq %rcx, %r8
	jge .LB3641
.LB3640:
	movzbl -56(%rbp,%r8,1), %edx
	movslq (%rdi), %r9
	movb %dl, (%rsi,%r9,1)
	movl (%rdi), %edx
	incl %edx
	movl %edx, (%rdi)
	incq %r8
	cmpq %rcx, %r8
	jl .LB3640
.LB3641:
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
.LB3659:
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
.LB12635:
	testq %rdx, %rdx
	je .LB12637
.LB12636:
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
	jne .LB12636
.LB12637:
.LB3669:
	cmpq %rcx, %r8
	jge .LB3671
.LB3670:
	movzbl -56(%rbp,%r8,1), %edx
	movslq (%rdi), %r9
	movb %dl, (%rsi,%r9,1)
	movl (%rdi), %edx
	incl %edx
	movl %edx, (%rdi)
	incq %r8
	cmpq %rcx, %r8
	jl .LB3670
.LB3671:
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
.LB3689:
	xorl %eax, %eax
.LB3694:
	movslq %eax, %rsi
	movzbl (%rcx,%rsi,1), %esi
	testb %sil, %sil
	je .LB3696
.LB3695:
	movslq (%r8), %rdi
	movb %sil, (%rdx,%rdi,1)
	movl (%r8), %esi
	incl %esi
	movl %esi, (%r8)
	incl %eax
	jmp .LB3694
.LB3696:
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
.LB3718:
	movq %rcx, %rsi
	movq %rdx, %rdi
	testq %rsi, %rsi
	je .LB3732
.LB3725:
	testq %rdi, %rdi
	je .LB3732
.LB3733:
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %ebx
	movq %rdi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	testl %eax, %eax
	je .LB3744
.LB3745:
	cmpl %ebx, %eax
	jg .LB3751
.LB3752:
	movl %ebx, %ecx
	subl %eax, %ecx
.LB3756:
	testl %ecx, %ecx
	js .LB3759
.LB3757:
	xorl %edx, %edx
.LB3766:
	cmpl %eax, %edx
	jl .LB3767
.LB12638:
	movl $1, %edx
.LB3769:
	testb %dl, %dl
	jne .LB3791
.LB3792:
	decl %ecx
	jns .LB3757
.LB3759:
	movabsq $4294967295, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB3767:
	leal (%rcx,%rdx), %r8d
	movslq %edx, %r9
	movslq %r8d, %r8
	movzbl (%rsi,%r8,1), %r8d
	movzbl (%rdi,%r9,1), %r9d
	cmpb %r9b, %r8b
	jne .LB3785
.LB3786:
	incl %edx
	cmpl %eax, %edx
	jl .LB3767
	jmp .LB12638
.LB3785:
	xorl %edx, %edx
	testb %dl, %dl
	je .LB3792
.LB3791:
	movl %ecx, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB3751:
	movabsq $4294967295, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB3744:
	movl %ebx, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB3732:
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
.LB3798:
	movq %rcx, %rsi
	movl %edx, %edi
	testq %rsi, %rsi
	je .LB3805
.LB3806:
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	decl %eax
.LB3812:
	testl %eax, %eax
	js .LB3815
.LB3813:
	movslq %eax, %rcx
	movzbl (%rsi,%rcx,1), %ecx
	cmpb %dil, %cl
	je .LB3827
.LB3828:
	decl %eax
	jns .LB3813
.LB3815:
	movabsq $4294967295, %rax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB3827:
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB3805:
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
.LB3834:
	movq %rcx, %rsi
	movq %rdx, %rdi
	testq %rsi, %rsi
	je .LB3848
.LB3841:
	testq %rdi, %rdi
	je .LB3848
.LB3849:
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %ebx
	movq %rdi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	testl %eax, %eax
	je .LB3865
.LB3859:
	cmpl %ebx, %eax
	jg .LB3865
.LB3866:
	subl %eax, %ebx
	xorl %ecx, %ecx
	xorl %edx, %edx
.LB3871:
	cmpl %ebx, %edx
	jg .LB3873
.LB3872:
	xorl %r8d, %r8d
.LB3879:
	cmpl %eax, %r8d
	jl .LB3880
.LB12639:
	movl $1, %r8d
.LB3882:
	leal 1(%rcx), %r9d
	leal (%rdx,%rax), %r12d
	incl %edx
	testb %r8b, %r8b
	cmovne %r9d, %ecx
	testb %r8b, %r8b
	cmovne %r12d, %edx
	cmpl %ebx, %edx
	jle .LB3872
.LB3873:
	movl %ecx, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB3880:
	leal (%rdx,%r8), %r9d
	movslq %r8d, %r12
	movslq %r9d, %r9
	movzbl (%rsi,%r9,1), %r9d
	movzbl (%rdi,%r12,1), %r12d
	cmpb %r12b, %r9b
	jne .LB3898
.LB3899:
	incl %r8d
	cmpl %eax, %r8d
	jl .LB3880
	jmp .LB12639
.LB3898:
	xorl %r8d, %r8d
	jmp .LB3882
.LB3865:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB3848:
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
.LB3925:
	movl standard__io__console__out_len(%rip), %edi
	testl %edi, %edi
	je .LB3930
.LB3931:
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
.LB3930:
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
.LB3935:
	movq %rcx, %rsi
	movl %edx, %edi
	testl %edi, %edi
	jle .LB3941
.LB3942:
	cmpl $8192, %edi
	jge .LB3946
.LB3947:
	movl standard__io__console__out_len(%rip), %eax
	addl %edi, %eax
	cmpl $8192, %eax
	jg .LB3955
.LB3957:
	movl %edi, %eax
	shrl $2, %eax
	xorl %ecx, %ecx
.LB12640:
	testl %eax, %eax
	je .LB12642
.LB12641:
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
	jne .LB12641
	jmp .LB12642
.LB3955:
	callq standard__io__console__flush__0__ret_voidE1
	jmp .LB3957
.LB12642:
.LB3958:
	cmpl %edi, %ecx
	jge .LB3960
.LB3959:
	movslq %ecx, %rax
	leaq standard__io__console__out_buf(%rip), %r8
	movzbl (%rsi,%rax,1), %eax
	movl standard__io__console__out_len(%rip), %edx
	addl %ecx, %edx
	incl %ecx
	movslq %edx, %rdx
	movb %al, (%r8,%rdx,1)
	cmpl %edi, %ecx
	jl .LB3959
.LB3960:
	movl standard__io__console__out_len(%rip), %eax
	addl %edi, %eax
	movl %eax, standard__io__console__out_len(%rip)
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB3946:
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
.LB3941:
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
.LB3915:
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
.LB3977:
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
.LB3982:
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
.LB3989:
	testb %cl, %cl
	jne .LB3992
.LB3993:
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
.LB3992:
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
.LB4021:
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
.LB4013:
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
.LB4010:
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
.LB4036:
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
.LB4043:
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
.LB4029:
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
.LB4050:
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
.LB4057:
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
.LB4064:
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
.LB4071:
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
.LB4078:
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
.LB4081:
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
.LB4084:
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
.LB4092:
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
.LB4107:
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
.LB4115:
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
.LB3920:
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
	subq $912, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
	movq %r14, -48(%rbp)
	movq %r15, -56(%rbp)
.LB11523:
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -104(%rbp)
	movups .LZERO+32(%rip), %xmm15
	movups %xmm15, -72(%rbp)
	vzeroupper
	movl $0, -108(%rbp)
	movl $0, -112(%rbp)
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -128(%rbp)
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -176(%rbp)
	movups .LZERO+32(%rip), %xmm15
	movups %xmm15, -144(%rbp)
	vzeroupper
	leaq -176(%rbp), %rax
	movq %rax, %rcx
	callq GetSystemInfo
	movl -144(%rbp), %eax
	movl %eax, g_num_threads(%rip)
	cmpl $1, %eax
	jl .LB11565
.LB11567:
	movl g_num_threads(%rip), %eax
	movl MAX_THREADS(%rip), %ecx
	cmpl %ecx, %eax
	jg .LB11571
.LB11573:
	movl $393216, %ecx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, g_dens(%rip)
	movl $393216, %ecx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, g_dens_prev(%rip)
	movl $393216, %ecx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, g_vx(%rip)
	movl $393216, %ecx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, g_vy(%rip)
	movl $393216, %ecx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, g_vx_prev(%rip)
	movl $393216, %ecx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, g_vy_prev(%rip)
	movl $196608, %ecx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, g_dens_tex(%rip)
	movl $393216, %ecx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, g_vel_tex(%rip)
	movl $30000, %ecx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, g_part_x(%rip)
	movl $30000, %ecx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, g_part_y(%rip)
	callq particles_init__0__ret_voidE1
	leaq g_work_sem(%rip), %rcx
	xorl %edx, %edx
	callq standard__threading__semaphore_init__2__SemaphoreE1_ptr1__dataE1_sbits32__ret_intE1
	leaq g_done_sem(%rip), %rcx
	xorl %edx, %edx
	callq standard__threading__semaphore_init__2__SemaphoreE1_ptr1__dataE1_sbits32__ret_intE1
	leaq g_work_sem2(%rip), %rcx
	xorl %edx, %edx
	callq standard__threading__semaphore_init__2__SemaphoreE1_ptr1__dataE1_sbits32__ret_intE1
	leaq g_done_sem2(%rip), %rcx
	xorl %edx, %edx
	callq standard__threading__semaphore_init__2__SemaphoreE1_ptr1__dataE1_sbits32__ret_intE1
	movl g_num_threads(%rip), %ecx
	movl $192, %eax
	cltd
	idivl %ecx
	movl %eax, g_rows_per_thread(%rip)
	cmpl $1, %eax
	jl .LB11625
.LB11627:
	leaq worker__1__voidE1_ptr1__ret_voidE1_ptr1(%rip), %rax
	movq %rax, %rsi
	leaq worker2__1__voidE1_ptr1__ret_voidE1_ptr1(%rip), %rax
	movq %rax, %rdi
	xorl %eax, %eax
.LB11628:
	movl g_num_threads(%rip), %ecx
	cmpl %ecx, %eax
	jge .LB11631
.LB11629:
	movl g_rows_per_thread(%rip), %edx
	leaq g_slices(%rip), %r9
	movslq %eax, %rbx
	movl %eax, %r8d
	imull %edx, %r8d
	imulq $152, %rbx, %r12
	decl %ecx
	movl %r8d, (%r9,%r12,1)
	leal 1(%rax), %r12d
	movl $192, %r9d
	imull %r12d, %edx
	cmpl %ecx, %eax
	leaq g_slices(%rip), %rax
	cmove %r9d, %edx
	imulq $152, %rbx, %rcx
	imulq $152, %rbx, %r9
	movl %edx, 4(%rax,%rcx,1)
	leaq g_slices(%rip), %rcx
	movl PHASE_DECAY(%rip), %eax
	movl %eax, 8(%rcx,%r9,1)
	leaq g_slices2(%rip), %rcx
	imulq $152, %rbx, %r9
	movl %r8d, (%rcx,%r9,1)
	leaq g_slices2(%rip), %rcx
	imulq $152, %rbx, %r8
	movl %edx, 4(%rcx,%r8,1)
	leaq g_slices2(%rip), %rcx
	imulq $152, %rbx, %rdx
	movl %eax, 8(%rcx,%rdx,1)
	leaq g_slices(%rip), %rax
	imulq $152, %rbx, %rcx
	leaq (%rax,%rcx,1), %rax
	leaq (%rbx,%rbx,2), %rcx
	movq %rax, %rdx
	leaq g_threads(%rip), %rax
	leaq (%rax,%rcx,4), %r8
	movq %rsi, %rcx
	callq standard__threading__thread_create__3__voidE1_ptr1__voidE1_ptr1__ThreadE1_ptr1__ret_intE1
	leaq g_slices2(%rip), %rax
	imulq $152, %rbx, %rcx
	leaq (%rax,%rcx,1), %rax
	movq %rax, %rdx
	leaq g_threads2(%rip), %rax
	leaq (%rbx,%rbx,2), %rcx
	leaq (%rax,%rcx,4), %r8
	movq %rdi, %rcx
	callq standard__threading__thread_create__3__voidE1_ptr1__voidE1_ptr1__ThreadE1_ptr1__ret_intE1
	movq %r12, %rax
	jmp .LB11628
.LB11565:
	movl $1, g_num_threads(%rip)
	jmp .LB11567
.LB11571:
	movl %ecx, g_num_threads(%rip)
	jmp .LB11573
.LB11625:
	movl $1, g_rows_per_thread(%rip)
	jmp .LB11627
.LB11631:
	xorl %ecx, %ecx
	callq GetModuleHandleA
	leaq -202(%rbp), %rsi
	movq %rax, -368(%rbp)
	leaq -185(%rbp), %rax
	movl $1769303110, -185(%rbp)
	movl $1835619172, -181(%rbp)
	movb $0, -177(%rbp)
	movq %rax, -376(%rbp)
	movl $1769303110, -202(%rbp)
	movl $1767055460, -198(%rbp)
	movl $1634497901, -194(%rbp)
	movl $1852795252, -190(%rbp)
	movb $0, -186(%rbp)
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -288(%rbp)
	vmovdqu .LZERO+32(%rip), %ymm15
	vmovdqu %ymm15, -256(%rbp)
	movups .LZERO+64(%rip), %xmm15
	movups %xmm15, -224(%rbp)
	vzeroupper
	movl $80, -288(%rbp)
	movl standard__system__windows__CS_HREDRAW(%rip), %eax
	movl standard__system__windows__CS_VREDRAW(%rip), %ecx
	orl %ecx, %eax
	movl standard__system__windows__CS_OWNDC(%rip), %ecx
	orl %ecx, %eax
	movl %eax, -284(%rbp)
	leaq FluidWindowProc__4__dataE1_ubits64__dataE1_ubits32__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64(%rip), %rax
	movq %rax, -280(%rbp)
	movl $0, -272(%rbp)
	movl $0, -268(%rbp)
	movq -368(%rbp), %rax
	movq %rax, -264(%rbp)
	xorl %ecx, %ecx
	movl $32512, %edx
	callq LoadIconA
	movq %rax, -256(%rbp)
	xorl %ecx, %ecx
	movl $32512, %edx
	callq LoadCursorA
	movq %rax, -248(%rbp)
	movl standard__system__windows__BLACK_BRUSH(%rip), %ecx
	callq GetStockObject
	leaq -288(%rbp), %rcx
	movq %rax, -240(%rbp)
	movq $0, -232(%rbp)
	movq -376(%rbp), %rax
	movq %rax, -224(%rbp)
	movq $0, -216(%rbp)
	callq RegisterClassExA
	movl standard__system__windows__WS_EX_APPWINDOW(%rip), %ecx
	movl standard__system__windows__WS_OVERLAPPEDWINDOW(%rip), %eax
	movl standard__system__windows__WS_VISIBLE(%rip), %edx
	movl %eax, %r9d
	orl %edx, %r9d
	movl WIN_W(%rip), %eax
	movl WIN_H(%rip), %edx
	movq STDLIB_GVP(%rip), %rdi
	movq $100, 32(%rsp)
	movq $100, 40(%rsp)
	movq %rax, 48(%rsp)
	movq %rdx, 56(%rsp)
	movq $0, 64(%rsp)
	movq $0, 72(%rsp)
	movq -368(%rbp), %rax
	movq %rax, 80(%rsp)
	movq %rdi, 88(%rsp)
	movq -376(%rbp), %rdx
	movq %rsi, %r8
	callq CreateWindowExA
	movq %rax, %rsi
	movq %rsi, %rcx
	callq GetDC
	movq %rax, %rcx
	movq %rcx, -808(%rbp)
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -312(%rbp)
	movq .LZERO+16(%rip), %r10
	movq %r10, -296(%rbp)
	movq %rcx, -312(%rbp)
	callq OpenGL__setup_opengl__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -304(%rbp)
	movb $0, -296(%rbp)
	callq OpenGL__gl_load_extensions__0__ret_voidE1
	movb $1, -296(%rbp)
	movq OpenGL___glCreateShader(%rip), %rax
	movq %rax, glCreateShader_fp(%rip)
	movq OpenGL___glShaderSource(%rip), %rax
	movq %rax, glShaderSource_fp(%rip)
	movq OpenGL___glCompileShader(%rip), %rax
	movq %rax, glCompileShader_fp(%rip)
	movq OpenGL___glCreateProgram(%rip), %rax
	movq %rax, glCreateProgram_fp(%rip)
	movq OpenGL___glAttachShader(%rip), %rax
	movq %rax, glAttachShader_fp(%rip)
	movq OpenGL___glLinkProgram(%rip), %rax
	movq %rax, glLinkProgram_fp(%rip)
	movq OpenGL___glUseProgram(%rip), %rax
	movq %rax, glUseProgram_fp(%rip)
	movq OpenGL___glGetUniformLocation(%rip), %rax
	movq %rax, glGetUniformLocation_fp(%rip)
	movq OpenGL___glUniform1i(%rip), %rax
	movq %rax, glUniform1i_fp(%rip)
	movq OpenGL___glUniform2f(%rip), %rax
	movq %rax, glUniform2f_fp(%rip)
	movq OpenGL___glActiveTexture(%rip), %rax
	movq %rax, glActiveTexture_fp(%rip)
	movq OpenGL___glDeleteShader(%rip), %rax
	movq %rax, glDeleteShader_fp(%rip)
	movq OpenGL___glDeleteProgram(%rip), %rax
	movq %rax, glDeleteProgram_fp(%rip)
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
	movl GL_VERTEX_SHADER(%rip), %ecx
	leaq VERT_SRC(%rip), %rdx
	callq OpenGL__compile_shader__2__intE1__byteE1_ptr1__ret_intE1
	leaq FRAG_SRC(%rip), %rdx
	movq %rax, -360(%rbp)
	movl GL_FRAGMENT_SHADER(%rip), %ecx
	callq OpenGL__compile_shader__2__intE1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rdx, -352(%rbp)
	movq -360(%rbp), %rcx
	callq OpenGL__link_program__2__intE1__intE1__ret_intE1
	leaq -319(%rbp), %rdx
	movl %eax, %edi
	movq glGetUniformLocation_fp(%rip), %rax
	movl $1701076853, -319(%rbp)
	movw $29550, -315(%rbp)
	movb $0, -313(%rbp)
	movq %rdi, %rcx
	callq *%rax
	leaq -325(%rbp), %rdx
	movl %eax, %ebx
	movq glGetUniformLocation_fp(%rip), %rax
	movl $1702256501, -325(%rbp)
	movw $108, -321(%rbp)
	movq %rdi, %rcx
	callq *%rax
	leaq -331(%rbp), %rdx
	movl %eax, %r12d
	movq glGetUniformLocation_fp(%rip), %rax
	movl $1701994357, -331(%rbp)
	movw $115, -327(%rbp)
	movq %rdi, %rcx
	callq *%rax
	leaq -341(%rbp), %rdx
	movl %eax, %r13d
	movq glGetUniformLocation_fp(%rip), %rax
	movl $1634754421, -341(%rbp)
	movl $1953785196, -337(%rbp)
	movw $101, -333(%rbp)
	movq %rdi, %rcx
	callq *%rax
	movl %eax, %r14d
	movl $0, -108(%rbp)
	leaq -108(%rbp), %rdx
	movl $1, %ecx
	callq glGenTextures
	movl GL_TEXTURE_2D(%rip), %ecx
	movl -108(%rbp), %edx
	callq glBindTexture
	movl GL_TEXTURE_2D(%rip), %ecx
	movl GL_TEXTURE_MIN_FILTER(%rip), %edx
	movl GL_LINEAR(%rip), %r8d
	callq glTexParameteri
	movl GL_TEXTURE_2D(%rip), %ecx
	movl GL_TEXTURE_MAG_FILTER(%rip), %edx
	movl GL_LINEAR(%rip), %r8d
	callq glTexParameteri
	movl GL_TEXTURE_2D(%rip), %ecx
	movl GL_TEXTURE_WRAP_S(%rip), %edx
	movl GL_CLAMP_TO_EDGE(%rip), %r8d
	callq glTexParameteri
	movl GL_TEXTURE_2D(%rip), %ecx
	movl GL_TEXTURE_WRAP_T(%rip), %edx
	movl GL_CLAMP_TO_EDGE(%rip), %r8d
	callq glTexParameteri
	movl GL_TEXTURE_2D(%rip), %ecx
	movl GL_LUMINANCE(%rip), %r8d
	movl GL_FLOAT(%rip), %eax
	movq g_dens_tex(%rip), %rdx
	movq $192, 32(%rsp)
	movq $0, 40(%rsp)
	movl $256, %r9d
	movq %r8, 48(%rsp)
	movq %rax, 56(%rsp)
	movq %rdx, 64(%rsp)
	xorl %edx, %edx
	callq glTexImage2D
	movl $0, -112(%rbp)
	leaq -112(%rbp), %rdx
	movl $1, %ecx
	callq glGenTextures
	movl GL_TEXTURE_2D(%rip), %ecx
	movl -112(%rbp), %edx
	callq glBindTexture
	movl GL_TEXTURE_2D(%rip), %ecx
	movl GL_TEXTURE_MIN_FILTER(%rip), %edx
	movl GL_LINEAR(%rip), %r8d
	callq glTexParameteri
	movl GL_TEXTURE_2D(%rip), %ecx
	movl GL_TEXTURE_MAG_FILTER(%rip), %edx
	movl GL_LINEAR(%rip), %r8d
	callq glTexParameteri
	movl GL_TEXTURE_2D(%rip), %ecx
	movl GL_TEXTURE_WRAP_S(%rip), %edx
	movl GL_CLAMP_TO_EDGE(%rip), %r8d
	callq glTexParameteri
	movl GL_TEXTURE_2D(%rip), %ecx
	movl GL_TEXTURE_WRAP_T(%rip), %edx
	movl GL_CLAMP_TO_EDGE(%rip), %r8d
	callq glTexParameteri
	movl GL_TEXTURE_2D(%rip), %ecx
	movl GL_LUMINANCE_ALPHA(%rip), %r8d
	movl GL_FLOAT(%rip), %eax
	movq g_vel_tex(%rip), %rdx
	movq $192, 32(%rsp)
	movq $0, 40(%rsp)
	movl $256, %r9d
	movq %r8, 48(%rsp)
	movq %rax, 56(%rsp)
	movq %rdx, 64(%rsp)
	xorl %edx, %edx
	callq glTexImage2D
	movl standard__system__windows__SW_SHOW(%rip), %edx
	movq %rsi, %rcx
	callq ShowWindow
	movq %rsi, %rcx
	callq UpdateWindow
	movl $1, %eax
	movq $0, -384(%rbp)
	movabsq $0, %r10
	movq %r10, -392(%rbp)
	movabsq $0, %r10
	movq %r10, -400(%rbp)
	movabsq $0, %r10
	movq %r10, -408(%rbp)
	movabsq $0, %r10
	movq %r10, -416(%rbp)
	movabsq $0, %r10
	movq %r10, -424(%rbp)
	movabsq $0, %r10
	movq %r10, -432(%rbp)
	movabsq $0, %r10
	movq %r10, -440(%rbp)
	movabsq $0, %r10
	movq %r10, -448(%rbp)
	movabsq $0, %r10
	movq %r10, -456(%rbp)
	movabsq $0, %r10
	movq %r10, -464(%rbp)
	movabsq $0, %r10
	movq %r10, -472(%rbp)
	movabsq $0, %r10
	movq %r10, -480(%rbp)
	movabsq $0, %r10
	movq %r10, -488(%rbp)
.LB11924:
	testb %al, %al
	je .LB11926
.LB11925:
	movq %rax, -496(%rbp)
.LB11928:
	movl standard__system__windows__PM_REMOVE(%rip), %eax
	leaq -104(%rbp), %rcx
	movq %rax, 32(%rsp)
	xorl %edx, %edx
	xorl %r8d, %r8d
	xorl %r9d, %r9d
	callq PeekMessageA
	testb %al, %al
	je .LB11930
.LB11929:
	movl -96(%rbp), %eax
	movl standard__system__windows__WM_QUIT(%rip), %ecx
	xorl %edx, %edx
	cmpl %ecx, %eax
	leaq -104(%rbp), %rcx
	movq -496(%rbp), %rax
	movl %eax, %r15d
	cmove %edx, %r15d
	callq TranslateMessage
	leaq -104(%rbp), %rcx
	callq DispatchMessageA
	movq %r15, -496(%rbp)
	jmp .LB11928
.LB11930:
	movq -496(%rbp), %rax
	testb %al, %al
	je .LB11926
.LB11948:
	leaq -128(%rbp), %rdx
	movq %rsi, %rcx
	callq GetClientRect
	movl -120(%rbp), %eax
	subl -128(%rbp), %eax
	movl %eax, cur_w(%rip)
	movl -116(%rbp), %ecx
	subl -124(%rbp), %ecx
	movl %ecx, cur_h(%rip)
	cmpl $1, %eax
	jl .LB11972
.LB11974:
	cmpl $1, %ecx
	jl .LB11977
.LB11979:
	movl cur_w(%rip), %r8d
	movl cur_h(%rip), %r9d
	xorl %ecx, %ecx
	xorl %edx, %edx
	callq glViewport
	cmpl $1, g_game_state(%rip)
	je .LB11984
.LB11986:
	cmpl $1, g_game_state(%rip)
	je .LB11998
.LB12000:
	callq upload_textures__0__ret_voidE1
	movq glActiveTexture_fp(%rip), %rax
	movl GL_TEXTURE0(%rip), %ecx
	callq *%rax
	movl GL_TEXTURE_2D(%rip), %ecx
	movl -108(%rbp), %edx
	callq glBindTexture
	movl GL_TEXTURE_2D(%rip), %ecx
	movl GL_LUMINANCE(%rip), %eax
	movl GL_FLOAT(%rip), %edx
	movq g_dens_tex(%rip), %r8
	movq $256, 32(%rsp)
	movq $192, 40(%rsp)
	xorl %r9d, %r9d
	movq %rax, 48(%rsp)
	movq %rdx, 56(%rsp)
	movq %r8, 64(%rsp)
	xorl %edx, %edx
	xorl %r8d, %r8d
	callq glTexSubImage2D
	movq glActiveTexture_fp(%rip), %rax
	movl GL_TEXTURE1(%rip), %ecx
	callq *%rax
	movl GL_TEXTURE_2D(%rip), %ecx
	movl -112(%rbp), %edx
	callq glBindTexture
	movl GL_TEXTURE_2D(%rip), %ecx
	movl GL_LUMINANCE_ALPHA(%rip), %eax
	movl GL_FLOAT(%rip), %edx
	movq g_vel_tex(%rip), %r8
	movq $256, 32(%rsp)
	movq $192, 40(%rsp)
	xorl %r9d, %r9d
	movq %rax, 48(%rsp)
	movq %rdx, 56(%rsp)
	movq %r8, 64(%rsp)
	xorl %edx, %edx
	xorl %r8d, %r8d
	callq glTexSubImage2D
	xorps %xmm0, %xmm0
	xorps %xmm1, %xmm1
	xorps %xmm2, %xmm2
	movabsq $1065353216, %r10
	movq %r10, %xmm3
	callq glClearColor
	movl GL_COLOR_BUFFER_BIT(%rip), %ecx
	callq glClear
	movl GL_BLEND(%rip), %ecx
	callq glEnable
	movl GL_SRC_ALPHA(%rip), %ecx
	movl GL_ONE_MINUS_SRC_ALPHA(%rip), %edx
	callq glBlendFunc
	movq glUseProgram_fp(%rip), %rax
	movq %rdi, %rcx
	callq *%rax
	movq glUniform1i_fp(%rip), %rax
	movq %rbx, %rcx
	xorl %edx, %edx
	callq *%rax
	movq glUniform1i_fp(%rip), %rax
	movq %r12, %rcx
	movl $1, %edx
	callq *%rax
	movq glUniform2f_fp(%rip), %rax
	movl $256, %ecx
	movslq %ecx, %rcx
	xorps %xmm0, %xmm0
	cvtsi2ssq %rcx, %xmm0
	movl $192, %ecx
	movslq %ecx, %rcx
	xorps %xmm2, %xmm2
	cvtsi2ssq %rcx, %xmm2
	movq %r13, %rcx
	movaps %xmm0, %xmm1
	callq *%rax
	movq glUniform1i_fp(%rip), %rax
	movl g_palette(%rip), %edx
	movq %r14, %rcx
	callq *%rax
	movl GL_TRIANGLES(%rip), %ecx
	callq glBegin
	xorps %xmm0, %xmm0
	xorps %xmm1, %xmm1
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
	movabsq $1073741824, %r10
	movq %r10, %xmm0
	xorps %xmm1, %xmm1
	callq glTexCoord2f
	xorps %xmm0, %xmm0
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	movaps %xmm1, %xmm15
	movaps %xmm0, %xmm1
	subss %xmm15, %xmm1
	movabsq $1077936128, %r10
	movq %r10, %xmm0
	callq glVertex2f
	xorps %xmm0, %xmm0
	movabsq $1073741824, %r10
	movq %r10, %xmm1
	callq glTexCoord2f
	xorps %xmm0, %xmm0
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	subss %xmm1, %xmm0
	movabsq $1077936128, %r10
	movq %r10, %xmm1
	callq glVertex2f
	callq glEnd
	movq glUseProgram_fp(%rip), %rax
	xorl %ecx, %ecx
	callq *%rax
	movl GL_BLEND(%rip), %ecx
	callq glDisable
	movq glActiveTexture_fp(%rip), %rax
	movl GL_TEXTURE0(%rip), %ecx
	callq *%rax
	movl GL_TEXTURE_2D(%rip), %ecx
	xorl %edx, %edx
	callq glBindTexture
	movq glActiveTexture_fp(%rip), %rax
	movl GL_TEXTURE1(%rip), %ecx
	callq *%rax
	movl GL_TEXTURE_2D(%rip), %ecx
	xorl %edx, %edx
	callq glBindTexture
	movq glActiveTexture_fp(%rip), %rax
	movl GL_TEXTURE0(%rip), %ecx
	callq *%rax
	movl GL_TEXTURE_2D(%rip), %ecx
	callq glDisable
	movl GL_DEPTH_TEST(%rip), %ecx
	callq glDisable
	movl GL_BLEND(%rip), %ecx
	callq glEnable
	movl GL_SRC_ALPHA(%rip), %ecx
	movl GL_ONE(%rip), %edx
	callq glBlendFunc
	movabsq $1094713344, %r10
	movq %r10, %xmm0
	cvtss2sd %xmm0, %xmm0
	movabsq $4618760256179416810, %r10
	movq %r10, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	divsd %xmm15, %xmm0
	cvtsd2ss %xmm0, %xmm0
	movsd %xmm0, -504(%rbp)
	movq -384(%rbp), %r10
	movq %r10, -512(%rbp)
	movq -392(%rbp), %r10
	movq %r10, -520(%rbp)
	movq -400(%rbp), %r10
	movq %r10, -528(%rbp)
	movq -408(%rbp), %r10
	movq %r10, -536(%rbp)
	movq -416(%rbp), %r10
	movq %r10, -544(%rbp)
	movq -424(%rbp), %r10
	movq %r10, -552(%rbp)
	movq -432(%rbp), %r10
	movq %r10, -560(%rbp)
	movq -440(%rbp), %r10
	movq %r10, -568(%rbp)
	movq -448(%rbp), %r10
	movq %r10, -576(%rbp)
	movq -456(%rbp), %r10
	movq %r10, -584(%rbp)
	movq -464(%rbp), %r10
	movq %r10, -592(%rbp)
	movq -472(%rbp), %r10
	movq %r10, -600(%rbp)
	movq -480(%rbp), %r10
	movq %r10, -608(%rbp)
	movq -488(%rbp), %r10
	movq %r10, -616(%rbp)
	movq $0, -624(%rbp)
.LB12059:
	movq -624(%rbp), %rax
	cmpq $7500, %rax
	jge .LB12062
.LB12060:
	movq g_part_x(%rip), %rax
	movq -624(%rbp), %rcx
	movabsq $1090519040, %r10
	movq %r10, %xmm1
	movss (%rax,%rcx,4), %xmm0
	movsd %xmm0, -632(%rbp)
	movq g_part_y(%rip), %rax
	movss (%rax,%rcx,4), %xmm0
	movsd %xmm0, -640(%rbp)
	movq g_dens(%rip), %rax
	cvttss2siq %xmm0, %rcx
	movsd -632(%rbp), %xmm0
	movl %ecx, %ecx
	cvttss2siq %xmm0, %rdx
	shll $8, %ecx
	movl %edx, %edx
	addl %edx, %ecx
	movslq %ecx, %rcx
	movsd (%rax,%rcx,8), %xmm0
	cvtsd2ss %xmm0, %xmm0
	movsd %xmm0, -648(%rbp)
	ucomiss %xmm1, %xmm0
	ja .LB12085
.LB12086:
	movq -512(%rbp), %rax
	movsd -536(%rbp), %xmm0
	movsd -544(%rbp), %xmm1
	movsd -552(%rbp), %xmm2
	movsd -560(%rbp), %xmm3
	movsd -568(%rbp), %xmm4
	movsd -576(%rbp), %xmm5
	movq -592(%rbp), %r10
	movq %r10, -656(%rbp)
	movq -600(%rbp), %r10
	movq %r10, -664(%rbp)
	movq -608(%rbp), %r10
	movq %r10, -672(%rbp)
	movq -616(%rbp), %r10
	movq %r10, -680(%rbp)
.LB12087:
	movq -624(%rbp), %rcx
	incq %rcx
	movq %rax, -512(%rbp)
	movq -632(%rbp), %r10
	movq %r10, -520(%rbp)
	movq -640(%rbp), %r10
	movq %r10, -528(%rbp)
	movsd %xmm0, -536(%rbp)
	movsd %xmm1, -544(%rbp)
	movsd %xmm2, -552(%rbp)
	movsd %xmm3, -560(%rbp)
	movsd %xmm4, -568(%rbp)
	movsd %xmm5, -576(%rbp)
	movq -648(%rbp), %r10
	movq %r10, -584(%rbp)
	movq -656(%rbp), %r10
	movq %r10, -592(%rbp)
	movq -664(%rbp), %r10
	movq %r10, -600(%rbp)
	movq -672(%rbp), %r10
	movq %r10, -608(%rbp)
	movq -680(%rbp), %r10
	movq %r10, -616(%rbp)
	movq %rcx, -624(%rbp)
	jmp .LB12059
.LB11972:
	movl $1, cur_w(%rip)
	cmpl $1, %ecx
	jge .LB11979
.LB11977:
	movl $1, cur_h(%rip)
	jmp .LB11979
.LB11984:
	movss g_ball_x(%rip), %xmm0
	xorps %xmm1, %xmm1
	ucomiss %xmm0, %xmm1
	ja .LB11989
.LB11991:
	callq paddle_update__0__ret_voidE1
	callq cpu_paddle_update__0__ret_voidE1
	movl cur_w(%rip), %ecx
	movl cur_h(%rip), %edx
	callq ball_update__2__intE1__intE1__ret_voidE1
	callq vel_step__0__ret_voidE1
	callq dens_step__0__ret_voidE1
	callq dispatch_decay__0__ret_voidE1
	cmpl $1, g_game_state(%rip)
	je .LB11998
	jmp .LB12000
.LB11989:
	movl cur_w(%rip), %ecx
	movl cur_h(%rip), %edx
	callq ball_reset__2__intE1__intE1__ret_voidE1
	jmp .LB11991
.LB11998:
	callq particles_update__0__ret_voidE1
	jmp .LB12000
.LB12062:
	movl GL_BLEND(%rip), %ecx
	callq glDisable
	movl GL_TEXTURE_2D(%rip), %ecx
	callq glEnable
	cmpl $1, g_game_state(%rip)
	je .LB12150
.LB12152:
	cmpl $0, g_game_state(%rip)
	je .LB12166
.LB12168:
	cmpl $2, g_game_state(%rip)
	je .LB12173
.LB12175:
	movq -312(%rbp), %rcx
	callq SwapBuffers
	movq -496(%rbp), %rax
	movq -512(%rbp), %r10
	movq %r10, -384(%rbp)
	movq -520(%rbp), %r10
	movq %r10, -392(%rbp)
	movq -528(%rbp), %r10
	movq %r10, -400(%rbp)
	movq -536(%rbp), %r10
	movq %r10, -408(%rbp)
	movq -544(%rbp), %r10
	movq %r10, -416(%rbp)
	movq -552(%rbp), %r10
	movq %r10, -424(%rbp)
	movq -560(%rbp), %r10
	movq %r10, -432(%rbp)
	movq -568(%rbp), %r10
	movq %r10, -440(%rbp)
	movq -576(%rbp), %r10
	movq %r10, -448(%rbp)
	movq -584(%rbp), %r10
	movq %r10, -456(%rbp)
	movq -592(%rbp), %r10
	movq %r10, -464(%rbp)
	movq -600(%rbp), %r10
	movq %r10, -472(%rbp)
	movq -608(%rbp), %r10
	movq %r10, -480(%rbp)
	movq -616(%rbp), %r10
	movq %r10, -488(%rbp)
	testb %al, %al
	jne .LB11925
	jmp .LB11926
.LB12150:
	movl cur_w(%rip), %ecx
	movl cur_h(%rip), %edx
	movl g_paddle_gy(%rip), %r9d
	movl $4, %r8d
	callq draw_paddle__4__intE1__intE1__intE1__intE1__ret_voidE1
	movl cur_w(%rip), %ecx
	movl cur_h(%rip), %edx
	movl g_cpu_paddle_gy(%rip), %r9d
	movl $250, %r8d
	callq draw_paddle__4__intE1__intE1__intE1__intE1__ret_voidE1
	movl cur_w(%rip), %ecx
	movl cur_h(%rip), %edx
	callq draw_ball__2__intE1__intE1__ret_voidE1
	movl cur_w(%rip), %ecx
	movl cur_h(%rip), %edx
	callq draw_hud__2__intE1__intE1__ret_voidE1
	cmpl $0, g_game_state(%rip)
	jne .LB12168
.LB12166:
	movl cur_w(%rip), %ecx
	movl cur_h(%rip), %edx
	callq draw_gui__2__intE1__intE1__ret_voidE1
	cmpl $2, g_game_state(%rip)
	jne .LB12175
.LB12173:
	movl cur_w(%rip), %ecx
	movl cur_h(%rip), %edx
	callq draw_quit_dialog__2__intE1__intE1__ret_voidE1
	jmp .LB12175
.LB12085:
	movabsq $1016296636, %r10
	movq %r10, %xmm0
	movabsq $1069547520, %r10
	movq %r10, %xmm1
	movsd -648(%rbp), %xmm2
	vfmadd132ss %xmm2, %xmm1, %xmm0
	movabsq $1085276160, %r10
	movq %r10, %xmm1
	ucomiss %xmm1, %xmm0
	ja .LB12093
.LB12094:
	movsd %xmm0, -688(%rbp)
.LB12095:
	movl $256, %eax
	movsd -632(%rbp), %xmm1
	movabsq $1065353216, %r10
	movq %r10, %xmm2
	movslq %eax, %rax
	xorps %xmm0, %xmm0
	cvtsi2ssq %rax, %xmm0
	movl $192, %eax
	movslq %eax, %rax
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	divss %xmm15, %xmm0
	movabsq $1073741824, %r10
	movq %r10, %xmm1
	vfmsub132ss %xmm1, %xmm2, %xmm0
	movabsq $1065353216, %r10
	movq %r10, %xmm2
	movsd %xmm0, -696(%rbp)
	xorps %xmm0, %xmm0
	cvtsi2ssq %rax, %xmm0
	movsd -640(%rbp), %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	divss %xmm15, %xmm0
	movabsq $1073741824, %r10
	movq %r10, %xmm1
	vfmsub132ss %xmm1, %xmm2, %xmm0
	movsd %xmm0, -704(%rbp)
	movsd -688(%rbp), %xmm1
	movslq cur_w(%rip), %rax
	movabsq $1073741824, %r10
	movq %r10, %xmm0
	mulss %xmm1, %xmm0
	xorps %xmm2, %xmm2
	cvtsi2ssq %rax, %xmm2
	divss %xmm2, %xmm0
	movsd %xmm0, -712(%rbp)
	movslq cur_h(%rip), %rax
	movabsq $1073741824, %r10
	movq %r10, %xmm0
	mulss %xmm1, %xmm0
	xorps %xmm1, %xmm1
	cvtsi2ssq %rax, %xmm1
	divss %xmm1, %xmm0
	movsd %xmm0, -720(%rbp)
	movl GL_TRIANGLE_FAN(%rip), %ecx
	callq glBegin
	movabsq $1065353216, %r10
	movq %r10, %xmm0
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	movabsq $1065353216, %r10
	movq %r10, %xmm2
	movabsq $1057803469, %r10
	movq %r10, %xmm3
	callq glColor4f
	movsd -696(%rbp), %xmm0
	movsd -704(%rbp), %xmm1
	callq glVertex2f
	movabsq $1057803469, %r10
	movq %r10, %xmm0
	movabsq $1061158912, %r10
	movq %r10, %xmm1
	movabsq $1065353216, %r10
	movq %r10, %xmm2
	xorps %xmm3, %xmm3
	callq glColor4f
	movq $0, -728(%rbp)
	movq -576(%rbp), %r10
	movq %r10, -736(%rbp)
	movq -592(%rbp), %r10
	movq %r10, -744(%rbp)
	movq -600(%rbp), %r10
	movq %r10, -752(%rbp)
	movq -608(%rbp), %r10
	movq %r10, -760(%rbp)
	movq -616(%rbp), %r10
	movq %r10, -768(%rbp)
.LB12119:
	movq -728(%rbp), %rax
	cmpl $12, %eax
	jg .LB12121
.LB12120:
	movq -728(%rbp), %rax
	movslq %eax, %rax
	xorps %xmm0, %xmm0
	cvtsi2ssq %rax, %xmm0
	movsd -504(%rbp), %xmm1
	mulss %xmm1, %xmm0
	movsd %xmm0, -776(%rbp)
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, -784(%rbp)
	callq standard__math__cos__1__doubleE1__ret_doubleE1
	cvtsd2ss %xmm0, %xmm0
	movsd -712(%rbp), %xmm1
	movsd -696(%rbp), %xmm2
	vfmadd132ss %xmm1, %xmm2, %xmm0
	movsd %xmm0, -792(%rbp)
	movsd -784(%rbp), %xmm0
	callq standard__math__sin__1__doubleE1__ret_doubleE1
	cvtsd2ss %xmm0, %xmm0
	movsd -720(%rbp), %xmm1
	movsd -704(%rbp), %xmm2
	vfmadd132ss %xmm0, %xmm2, %xmm1
	movsd %xmm1, -800(%rbp)
	movsd -792(%rbp), %xmm0
	callq glVertex2f
	movq -728(%rbp), %rax
	incl %eax
	movq %rax, -728(%rbp)
	movq -776(%rbp), %r10
	movq %r10, -736(%rbp)
	movq -792(%rbp), %r10
	movq %r10, -744(%rbp)
	movq -800(%rbp), %r10
	movq %r10, -752(%rbp)
	movq -776(%rbp), %r10
	movq %r10, -760(%rbp)
	movq -776(%rbp), %r10
	movq %r10, -768(%rbp)
	jmp .LB12119
.LB12093:
	movabsq $1085276160, %r10
	movq %r10, -688(%rbp)
	jmp .LB12095
.LB12121:
	callq glEnd
	movq -728(%rbp), %rax
	movsd -696(%rbp), %xmm0
	movsd -704(%rbp), %xmm1
	movsd -688(%rbp), %xmm2
	movsd -712(%rbp), %xmm3
	movsd -720(%rbp), %xmm4
	movsd -736(%rbp), %xmm5
	movq -744(%rbp), %r10
	movq %r10, -656(%rbp)
	movq -752(%rbp), %r10
	movq %r10, -664(%rbp)
	movq -760(%rbp), %r10
	movq %r10, -672(%rbp)
	movq -768(%rbp), %r10
	movq %r10, -680(%rbp)
	jmp .LB12087
.LB11926:
	xorl %ebx, %ebx
.LB12178:
	movl g_num_threads(%rip), %eax
	cmpl %eax, %ebx
	jge .LB12181
.LB12179:
	movl PHASE_EXIT(%rip), %eax
	leaq g_slices(%rip), %rcx
	movslq %ebx, %rdx
	imulq $152, %rdx, %r8
	movl %eax, 8(%rcx,%r8,1)
	leaq g_slices2(%rip), %rcx
	imulq $152, %rdx, %rdx
	movl %eax, 8(%rcx,%rdx,1)
	leaq g_work_sem(%rip), %rax
	movq (%rax), %rax
	movq %rax, %rcx
	movl $1, %edx
	xorl %r8d, %r8d
	callq ReleaseSemaphore
	leaq g_work_sem2(%rip), %rax
	movq (%rax), %rax
	movq %rax, %rcx
	movl $1, %edx
	xorl %r8d, %r8d
	callq ReleaseSemaphore
	incl %ebx
	jmp .LB12178
.LB12181:
	xorl %ebx, %ebx
.LB12195:
	movl g_num_threads(%rip), %eax
	cmpl %eax, %ebx
	jge .LB12198
.LB12196:
	leaq g_threads(%rip), %rax
	movslq %ebx, %r12
	leaq (%r12,%r12,2), %rcx
	leaq (%rax,%rcx,4), %rcx
	callq standard__threading__thread_join__1__ThreadE1_ptr1__ret_intE1
	leaq g_threads2(%rip), %rax
	leaq (%r12,%r12,2), %rcx
	leaq (%rax,%rcx,4), %rcx
	callq standard__threading__thread_join__1__ThreadE1_ptr1__ret_intE1
	incl %ebx
	jmp .LB12195
.LB12198:
	leaq g_work_sem(%rip), %rax
	movq (%rax), %rax
	movq %rax, %rcx
	callq CloseHandle
	leaq g_done_sem(%rip), %rax
	movq (%rax), %rax
	movq %rax, %rcx
	callq CloseHandle
	leaq g_work_sem2(%rip), %rax
	movq (%rax), %rax
	movq %rax, %rcx
	callq CloseHandle
	leaq g_done_sem2(%rip), %rax
	movq (%rax), %rax
	movq %rax, %rcx
	callq CloseHandle
	movq glDeleteShader_fp(%rip), %rax
	movq -360(%rbp), %rcx
	callq *%rax
	movq glDeleteShader_fp(%rip), %rax
	movq -352(%rbp), %rcx
	callq *%rax
	movq glDeleteProgram_fp(%rip), %rax
	movq %rdi, %rcx
	callq *%rax
	leaq -108(%rbp), %rdx
	movl $1, %ecx
	callq glDeleteTextures
	leaq -112(%rbp), %rdx
	movl $1, %ecx
	callq glDeleteTextures
	leaq -312(%rbp), %rcx
	callq OpenGL__GLContext.__exit__0__ret_voidE1
	movq %rsi, %rcx
	movq -808(%rbp), %rdx
	callq ReleaseDC
	movq -376(%rbp), %rcx
	movq -368(%rbp), %rdx
	callq UnregisterClassA
	movq g_part_y(%rip), %rax
	movq %rax, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movq g_part_x(%rip), %rax
	movq %rax, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movq g_vel_tex(%rip), %rax
	movq %rax, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movq g_dens_tex(%rip), %rax
	movq %rax, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movq g_vy_prev(%rip), %rax
	movq %rax, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movq g_vx_prev(%rip), %rax
	movq %rax, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movq g_vy(%rip), %rax
	movq %rax, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movq g_vx(%rip), %rax
	movq %rax, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movq g_dens_prev(%rip), %rax
	movq %rax, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movq g_dens(%rip), %rax
	movq %rax, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
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
	.globl main__2__intE1__byteE1_ptr2__ret_intE1
	.def main__2__intE1__byteE1_ptr2__ret_intE1;
	.scl 2;
	.type 32;
	.endef
main__2__intE1__byteE1_ptr2__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB12242:
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
.LB4131:
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
.LB4150:
	movslq %eax, %rcx
	cmpw $0, (%rsi,%rcx,2)
	je .LB4152
.LB4151:
.LB4159:
	movslq %eax, %rcx
	movzwl (%rsi,%rcx,2), %ecx
	cmpw $32, %cx
	je .LB4160
.LB4168:
	cmpw $9, %cx
	jne .LB4161
.LB4160:
	incl %eax
	jmp .LB4159
.LB4161:
	testw %cx, %cx
	je .LB4152
.LB4186:
	cmpw $34, %cx
	je .LB4194
.LB4195:
.LB4230:
	movslq %eax, %rcx
	movzwl (%rsi,%rcx,2), %ecx
	testw %cx, %cx
	je .LB4232
.LB4239:
	cmpw $32, %cx
	je .LB4232
.LB4248:
	cmpw $9, %cx
	je .LB4232
.LB4231:
	incl %eax
	jmp .LB4230
.LB4232:
.LB4196:
	incl %edi
	jmp .LB4150
.LB4194:
	incl %eax
.LB4199:
	movslq %eax, %rcx
	movzwl (%rsi,%rcx,2), %ecx
	testw %cx, %cx
	je .LB4201
.LB4208:
	cmpw $34, %cx
	je .LB4201
.LB4200:
	incl %eax
	jmp .LB4199
.LB4201:
	leal 1(%rax), %ecx
	movslq %eax, %rdx
	cmpw $34, (%rsi,%rdx,2)
	cmove %ecx, %eax
	jmp .LB4196
.LB4152:
	movq %rdi, %rcx
	shlq $3, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, %rbx
	xorl %r12d, %r12d
	xorl %eax, %eax
	xorl %ecx, %ecx
.LB4267:
	movslq %eax, %rdx
	cmpw $0, (%rsi,%rdx,2)
	je .LB4269
.LB4268:
.LB4276:
	movslq %eax, %rdx
	movzwl (%rsi,%rdx,2), %edx
	cmpw $32, %dx
	je .LB4277
.LB4285:
	cmpw $9, %dx
	jne .LB4278
.LB4277:
	incl %eax
	jmp .LB4276
.LB4278:
	testw %dx, %dx
	je .LB4269
.LB4303:
	cmpw $34, %dx
	je .LB4312
.LB4313:
	movq %rax, %rdx
	xorl %r8d, %r8d
.LB4351:
	movslq %edx, %r9
	movzwl (%rsi,%r9,2), %r9d
	testw %r9w, %r9w
	je .LB4353
.LB4360:
	cmpw $32, %r9w
	je .LB4353
.LB4369:
	cmpw $9, %r9w
	je .LB4353
.LB4352:
	incl %r8d
	incl %edx
	jmp .LB4351
.LB4353:
	movq %rdx, %r13
	movq %rax, %r14
	movq %r8, %r15
	movq %rcx, -80(%rbp)
.LB4314:
	leaq 1(%r15), %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	xorl %ecx, %ecx
	testl %r15d, %r15d
	cmovg %r15d, %ecx
	shrl $2, %ecx
	xorl %edx, %edx
.LB12647:
	testl %ecx, %ecx
	je .LB12649
.LB12648:
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
	jne .LB12648
	jmp .LB12649
.LB4312:
	incl %eax
	movq %rax, %rcx
	xorl %r15d, %r15d
.LB4318:
	movslq %ecx, %rdx
	movzwl (%rsi,%rdx,2), %edx
	testw %dx, %dx
	je .LB4320
.LB4327:
	cmpw $34, %dx
	je .LB4320
.LB4319:
	incl %r15d
	incl %ecx
	jmp .LB4318
.LB4320:
	leal 1(%rcx), %edx
	movslq %ecx, %r8
	cmpw $34, (%rsi,%r8,2)
	movl %ecx, %r13d
	cmove %edx, %r13d
	movq %rax, %r14
	movq $1, -80(%rbp)
	jmp .LB4314
.LB12649:
.LB4388:
	cmpl %r15d, %edx
	jge .LB4390
.LB4389:
	leal (%r14,%rdx), %ecx
	movslq %ecx, %rcx
	movzwl (%rsi,%rcx,2), %ecx
	movslq %edx, %r8
	movb %cl, (%rax,%r8,1)
	incl %edx
	cmpl %r15d, %edx
	jl .LB4389
.LB4390:
	movslq %r15d, %rcx
	movb $0, (%rax,%rcx,1)
	movslq %r12d, %rcx
	movq %rax, (%rbx,%rcx,8)
	incl %r12d
	movq %r13, %rax
	movq -80(%rbp), %rcx
	jmp .LB4267
.LB4269:
	cmpl $1, %edi
	jg .LB4418
.LB4419:
	callq main__0__ret_intE1
	movq %rax, %rsi
.LB4420:
	movslq %edi, %rdi
	xorl %r12d, %r12d
.LB4425:
	cmpq %rdi, %r12
	jge .LB4427
.LB4426:
	movq (%rbx,%r12,8), %rax
	movq %rax, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	incq %r12
	cmpq %rdi, %r12
	jl .LB4426
	jmp .LB4427
.LB4418:
	callq main__0__ret_intE1
	movl %eax, %esi
	jmp .LB4420
.LB4427:
	testl %esi, %esi
	jne .LB4440
.LB4442:
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
.LB4440:
	cmpl $3221225477, %esi
	jne .LB4442
.LB4446:
	movl $1179075923, -66(%rbp)
	movl $1414288705, -62(%rbp)
	movw $10, -58(%rbp)
	leaq -66(%rbp), %rdi
	movq %rdi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rdi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	jmp .LB4442
	.text
	.globl __chkstk
	.def __chkstk;
	.scl 2;
	.type 32;
	.endef
__chkstk:
.LB4130:
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
	.globl standard__math__sqrt__1__dataE1_sbits8__ret_dataE1_sbits8
	.def standard__math__sqrt__1__dataE1_sbits8__ret_dataE1_sbits8;
	.scl 2;
	.type 32;
	.endef
standard__math__sqrt__1__dataE1_sbits8__ret_dataE1_sbits8:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
	movq %rdi, -8(%rsp)
.LB4465:
	movsbl %cl, %eax
	testb %cl, %cl
	jle .LB4470
.LB4471:
	cmpb $1, %cl
	je .LB4477
.LB4478:
	movl %eax, %edx
	sarl $31, %edx
	movl %eax, %edx
	shrl $31, %edx
	addl %edx, %eax
	sarl $1, %eax
	movq %rax, %rsi
	movq %rcx, %rax
.LB4488:
	cmpb %al, %sil
	je .LB4490
.LB4494:
	cmpb %al, %sil
	jge .LB4490
.LB4489:
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
	jne .LB4494
.LB4490:
	movzbl %sil, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB4477:
	movl $1, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB4470:
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
.LB4510:
	movswl %cx, %eax
	testw %cx, %cx
	jle .LB4515
.LB4516:
	cmpw $1, %cx
	je .LB4522
.LB4523:
	movl %eax, %edx
	sarl $31, %edx
	movl %eax, %edx
	shrl $31, %edx
	addl %edx, %eax
	sarl $1, %eax
	movq %rax, %rsi
	movq %rcx, %rax
.LB4533:
	cmpw %ax, %si
	je .LB4535
.LB4539:
	cmpw %ax, %si
	jge .LB4535
.LB4534:
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
	jne .LB4539
.LB4535:
	movzwl %si, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB4522:
	movl $1, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB4515:
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
.LB4555:
	testl %ecx, %ecx
	jle .LB4559
.LB4560:
	movl %ecx, %eax
	sarl $31, %eax
	movl %ecx, %eax
	shrl $31, %eax
	addl %ecx, %eax
	sarl $1, %eax
	movq %rax, %rsi
	movq %rcx, %rax
.LB4567:
	cmpl %eax, %esi
	je .LB4569
.LB4573:
	cmpl %eax, %esi
	jge .LB4569
.LB4568:
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
	jne .LB4573
.LB4569:
	movl %esi, %eax
	movq 0(%rsp), %rsi
	addq $16, %rsp
	ret
.LB4559:
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
.LB4587:
	testq %rcx, %rcx
	jle .LB4592
.LB4593:
	cmpq $1, %rcx
	je .LB4599
.LB4600:
	movl $2, %esi
	movq %rcx, %rax
	cqto
	idivq %rsi
	movq %rax, %rsi
	movq %rcx, %rax
.LB4609:
	cmpq %rax, %rsi
	je .LB4611
.LB4615:
	cmpq %rax, %rsi
	jge .LB4611
.LB4610:
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
	jne .LB4615
.LB4611:
	movq %rsi, %rax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB4599:
	movl $1, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB4592:
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
.LB4630:
	testb %cl, %cl
	jbe .LB4635
.LB4636:
	movq %rcx, %rsi
	xorl %eax, %eax
.LB4642:
	cmpb %al, %sil
	je .LB4644
.LB4643:
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
	jne .LB4643
.LB4644:
	movzbl %sil, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB4635:
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
.LB4658:
	testw %cx, %cx
	jbe .LB4663
.LB4664:
	movq %rcx, %rsi
	xorl %eax, %eax
.LB4670:
	cmpw %ax, %si
	je .LB4672
.LB4671:
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
	jne .LB4671
.LB4672:
	movzwl %si, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB4663:
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
.LB4686:
	testl %ecx, %ecx
	jbe .LB4690
.LB4691:
	movq %rcx, %rsi
	xorl %eax, %eax
.LB4696:
	cmpl %eax, %esi
	je .LB4698
.LB4697:
	movl %ecx, %eax
	xorl %edx, %edx
	divl %esi
	addl %esi, %eax
	shrl $1, %eax
	movq %rsi, %r11
	movq %rax, %rsi
	movq %r11, %rax
	cmpl %eax, %esi
	jne .LB4697
.LB4698:
	movl %esi, %eax
	movq 0(%rsp), %rsi
	addq $16, %rsp
	ret
.LB4690:
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
.LB4710:
	testq %rcx, %rcx
	jbe .LB4715
.LB4716:
	movq %rcx, %rsi
	xorl %eax, %eax
.LB4722:
	cmpq %rax, %rsi
	je .LB4724
.LB4723:
	movq %rcx, %rax
	xorl %edx, %edx
	divq %rsi
	addq %rsi, %rax
	shrq $1, %rax
	movq %rsi, %r11
	movq %rax, %rsi
	movq %r11, %rax
	cmpq %rax, %rsi
	jne .LB4723
.LB4724:
	movq %rsi, %rax
	movq 0(%rsp), %rsi
	addq $16, %rsp
	ret
.LB4715:
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
.LB4737:
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
.LB4743:
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
.LB4749:
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
.LB4782:
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
.LB4814:
	xorps %xmm1, %xmm1
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm0, %xmm1
	ja .LB4820
.LB4821:
.LB4822:
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
.LB4820:
	xorps %xmm1, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subsd %xmm15, %xmm0
	jmp .LB4822
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
.LB4851:
	movl $0, -12(%rbp)
	xorps %xmm1, %xmm1
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm0, %xmm1
	seta %sil
	movzbl %sil, %esi
	testb %sil, %sil
	jne .LB4860
.LB4861:
.LB4862:
	movabsq $1061752795, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm0, %xmm1
	jae .LB4868
.LB4869:
	leaq -12(%rbp), %rdx
	callq standard__math___trig_reduce__2__doubleE1__dataE1_ptr1_sbits32__ret_doubleE1
	movl -12(%rbp), %eax
	andl $3, %eax
	je .LB4885
	cmpl $1, %eax
	je .LB4886
	cmpl $2, %eax
	jne .LB4888
.LB4887:
	callq standard__math___sin_kernel__1__doubleE1__ret_doubleE1
	xorps %xmm1, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subsd %xmm15, %xmm0
.LB4884:
	testb %sil, %sil
	jne .LB4900
.LB4901:
	movq -8(%rbp), %rsi
	leave
	ret
.LB4860:
	xorps %xmm1, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subsd %xmm15, %xmm0
	jmp .LB4862
.LB4886:
	callq standard__math___cos_kernel__1__doubleE1__ret_doubleE1
	testb %sil, %sil
	jne .LB4900
	jmp .LB4901
.LB4885:
	callq standard__math___sin_kernel__1__doubleE1__ret_doubleE1
	testb %sil, %sil
	jne .LB4900
	jmp .LB4901
.LB4888:
	callq standard__math___cos_kernel__1__doubleE1__ret_doubleE1
	xorps %xmm1, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subsd %xmm15, %xmm0
	testb %sil, %sil
	je .LB4901
.LB4900:
	xorps %xmm1, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subsd %xmm15, %xmm0
	movq -8(%rbp), %rsi
	leave
	ret
.LB4868:
	callq standard__math___sin_kernel__1__doubleE1__ret_doubleE1
	testb %sil, %sil
	jne .LB4874
.LB4875:
	movq -8(%rbp), %rsi
	leave
	ret
.LB4874:
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
.LB4906:
	movl $0, -4(%rbp)
	xorps %xmm1, %xmm1
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm0, %xmm1
	ja .LB4913
.LB4914:
.LB4915:
	movabsq $1061752795, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm0, %xmm1
	jae .LB4921
.LB4922:
	leaq -4(%rbp), %rdx
	callq standard__math___trig_reduce__2__doubleE1__dataE1_ptr1_sbits32__ret_doubleE1
	movl -4(%rbp), %eax
	andl $3, %eax
	je .LB4931
	cmpl $1, %eax
	je .LB4932
	cmpl $2, %eax
	jne .LB4934
.LB4933:
	callq standard__math___cos_kernel__1__doubleE1__ret_doubleE1
	xorps %xmm1, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subsd %xmm15, %xmm0
	leave
	ret
.LB4913:
	xorps %xmm1, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subsd %xmm15, %xmm0
	jmp .LB4915
.LB4932:
	callq standard__math___sin_kernel__1__doubleE1__ret_doubleE1
	xorps %xmm1, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subsd %xmm15, %xmm0
	leave
	ret
.LB4931:
	callq standard__math___cos_kernel__1__doubleE1__ret_doubleE1
	leave
	ret
.LB4934:
	callq standard__math___sin_kernel__1__doubleE1__ret_doubleE1
	leave
	ret
.LB4921:
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
.LB4946:
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
.LB4952:
	cvtss2sd %xmm0, %xmm0
	callq standard__math__cos__1__doubleE1__ret_doubleE1
	cvtsd2ss %xmm0, %xmm0
	leave
	ret
	.text
	.globl standard__math__step__2__floatE1__floatE1__ret_floatE1
	.def standard__math__step__2__floatE1__floatE1__ret_floatE1;
	.scl 2;
	.type 32;
	.endef
standard__math__step__2__floatE1__floatE1__ret_floatE1:
.LB4958:
	ucomiss %xmm0, %xmm1
	jae .LB4964
.LB4965:
	xorps %xmm0, %xmm0
	ret
.LB4964:
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
.LB4968:
	ucomisd %xmm0, %xmm1
	jae .LB4974
.LB4975:
	xorps %xmm0, %xmm0
.LB4976:
	cvtss2sd %xmm0, %xmm0
	ret
.LB4974:
	movabsq $1065353216, %r10
	movq %r10, %xmm0
	jmp .LB4976
	.text
	.globl standard__math__sign__1__dataE1_sbits8__ret_dataE1_sbits8
	.def standard__math__sign__1__dataE1_sbits8__ret_dataE1_sbits8;
	.scl 2;
	.type 32;
	.endef
standard__math__sign__1__dataE1_sbits8__ret_dataE1_sbits8:
.LB4979:
	testb %cl, %cl
	jg .LB4984
.LB4985:
	testb %cl, %cl
	js .LB4991
.LB4992:
	xorl %eax, %eax
	ret
.LB4991:
	movl $255, %eax
	ret
.LB4984:
	movl $1, %eax
	ret
	.text
	.globl standard__math__sign__1__dataE1_sbits16__ret_dataE1_sbits16
	.def standard__math__sign__1__dataE1_sbits16__ret_dataE1_sbits16;
	.scl 2;
	.type 32;
	.endef
standard__math__sign__1__dataE1_sbits16__ret_dataE1_sbits16:
.LB4997:
	testw %cx, %cx
	jg .LB5002
.LB5003:
	testw %cx, %cx
	js .LB5009
.LB5010:
	xorl %eax, %eax
	ret
.LB5009:
	movl $65535, %eax
	ret
.LB5002:
	movl $1, %eax
	ret
	.text
	.globl standard__math__sign__1__dataE1_sbits32__ret_dataE1_sbits32
	.def standard__math__sign__1__dataE1_sbits32__ret_dataE1_sbits32;
	.scl 2;
	.type 32;
	.endef
standard__math__sign__1__dataE1_sbits32__ret_dataE1_sbits32:
.LB5015:
	testl %ecx, %ecx
	jg .LB5019
.LB5020:
	testl %ecx, %ecx
	js .LB5024
.LB5025:
	xorl %eax, %eax
	ret
.LB5024:
	movabsq $4294967295, %rax
	ret
.LB5019:
	movl $1, %eax
	ret
	.text
	.globl standard__math__sign__1__dataE1_sbits64__ret_dataE1_sbits64
	.def standard__math__sign__1__dataE1_sbits64__ret_dataE1_sbits64;
	.scl 2;
	.type 32;
	.endef
standard__math__sign__1__dataE1_sbits64__ret_dataE1_sbits64:
.LB5028:
	testq %rcx, %rcx
	jg .LB5033
.LB5034:
	testq %rcx, %rcx
	js .LB5040
.LB5041:
	xorl %eax, %eax
	ret
.LB5040:
	movq $-1, %rax
	ret
.LB5033:
	movl $1, %eax
	ret
	.text
	.globl standard__math__sign__1__floatE1__ret_floatE1
	.def standard__math__sign__1__floatE1__ret_floatE1;
	.scl 2;
	.type 32;
	.endef
standard__math__sign__1__floatE1__ret_floatE1:
.LB5046:
	xorps %xmm1, %xmm1
	ucomiss %xmm1, %xmm0
	ja .LB5050
.LB5051:
	xorps %xmm1, %xmm1
	ucomiss %xmm0, %xmm1
	ja .LB5055
.LB5056:
	xorps %xmm0, %xmm0
	ret
.LB5055:
	xorps %xmm0, %xmm0
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	subss %xmm1, %xmm0
	ret
.LB5050:
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
.LB5059:
	xorps %xmm1, %xmm1
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm1, %xmm0
	ja .LB5064
.LB5065:
	xorps %xmm1, %xmm1
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm0, %xmm1
	ja .LB5071
.LB5072:
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	ret
.LB5071:
	xorps %xmm0, %xmm0
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	subss %xmm1, %xmm0
	cvtss2sd %xmm0, %xmm0
	ret
.LB5064:
	movabsq $1065353216, %r10
	movq %r10, %xmm0
	cvtss2sd %xmm0, %xmm0
	ret
	.text
	.globl standard__vectors__project__5__Vec3E1_ptr1__intE1__intE1__floatE1__floatE1__ret_POINTE1
	.def standard__vectors__project__5__Vec3E1_ptr1__intE1__intE1__floatE1__floatE1__ret_POINTE1;
	.scl 2;
	.type 32;
	.endef
standard__vectors__project__5__Vec3E1_ptr1__intE1__intE1__floatE1__floatE1__ret_POINTE1:
	subq $32, %rsp
.LB5077:
	movss 72(%rsp), %xmm0
	movss 80(%rsp), %xmm1
	movss 8(%rdx), %xmm2
	addss %xmm2, %xmm1
	movq .LZERO(%rip), %r10
	movq %r10, 16(%rsp)
	movabsq $981668463, %r10
	movq %r10, %xmm2
	ucomiss %xmm1, %xmm2
	ja .LB5093
.LB5094:
	movss (%rdx), %xmm2
	mulss %xmm0, %xmm2
	divss %xmm1, %xmm2
	cvttss2siq %xmm2, %rax
	movl %eax, %eax
	addl %eax, %r8d
	movl %r8d, 16(%rsp)
	movss 4(%rdx), %xmm2
	mulss %xmm2, %xmm0
	divss %xmm1, %xmm0
	cvttss2siq %xmm0, %rax
	movl %eax, %eax
	subl %eax, %r9d
	movl %r9d, 20(%rsp)
	movq 16(%rsp), %r10
	movq %r10, 8(%rsp)
	movq %r10, (%rcx)
	movq %rcx, %rax
	addq $32, %rsp
	ret
.LB5093:
	movl %r8d, 16(%rsp)
	movl %r9d, 20(%rsp)
	movq 16(%rsp), %r10
	movq %r10, (%rsp)
	movq %r10, (%rcx)
	movq %rcx, %rax
	addq $32, %rsp
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
.LB6305:
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
.LB6313:
	movq %rcx, %rsi
	cmpq $0, 8(%rsi)
	jne .LB6318
.LB6319:
	movq -8(%rbp), %rsi
	leave
	ret
.LB6318:
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
.LB6327:
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
.LB6329:
	movq (%rcx), %rcx
	callq SwapBuffers
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
.LB6332:
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
.LB5126:
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
.LB5163:
	callq SwapBuffers
	leave
	ret
	.text
	.globl OpenGL__compile_shader__2__intE1__byteE1_ptr1__ret_intE1
	.def OpenGL__compile_shader__2__intE1__byteE1_ptr1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
OpenGL__compile_shader__2__intE1__byteE1_ptr1__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB5167:
	movq %rdx, %rsi
	movq glCreateShader_fp(%rip), %rax
	callq *%rax
	leaq -24(%rbp), %r8
	leaq -28(%rbp), %r9
	movl %eax, %edi
	movq %rsi, -24(%rbp)
	movl $4294967295, -28(%rbp)
	movq glShaderSource_fp(%rip), %rax
	movq %rdi, %rcx
	movl $1, %edx
	callq *%rax
	movq glCompileShader_fp(%rip), %rax
	movq %rdi, %rcx
	callq *%rax
	movl %edi, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
	.text
	.globl OpenGL__link_program__2__intE1__intE1__ret_intE1
	.def OpenGL__link_program__2__intE1__intE1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
OpenGL__link_program__2__intE1__intE1__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
.LB5187:
	movl %ecx, %esi
	movl %edx, %edi
	movq glCreateProgram_fp(%rip), %rax
	callq *%rax
	movl %eax, %ebx
	movq glAttachShader_fp(%rip), %rax
	movq %rbx, %rcx
	movq %rsi, %rdx
	callq *%rax
	movq glAttachShader_fp(%rip), %rax
	movq %rbx, %rcx
	movq %rdi, %rdx
	callq *%rax
	movq glLinkProgram_fp(%rip), %rax
	movq %rbx, %rcx
	callq *%rax
	movl %ebx, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
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
.LB5202:
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
	.globl standard__atomic__load_fence__0__ret_voidE1
	.def standard__atomic__load_fence__0__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__atomic__load_fence__0__ret_voidE1:
.LB6336:
	lfence
	ret
	.text
	.globl standard__atomic__store_fence__0__ret_voidE1
	.def standard__atomic__store_fence__0__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__atomic__store_fence__0__ret_voidE1:
.LB6337:
	sfence
	ret
	.text
	.globl standard__atomic___load32__2__dataE1_ptr1_sbits32__dataE1_ptr1_sbits32__ret_voidE1
	.def standard__atomic___load32__2__dataE1_ptr1_sbits32__dataE1_ptr1_sbits32__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__atomic___load32__2__dataE1_ptr1_sbits32__dataE1_ptr1_sbits32__ret_voidE1:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
	movq %rdi, -8(%rsp)
.LB6338:
	movq %rcx, %rsi
	                movq %rdx, %rdi
	                movl (%rsi), %eax
	                movl %eax, (%rdi)
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
	.text
	.globl standard__atomic__load32__1__dataE1_ptr1_sbits32__ret_dataE1_sbits32
	.def standard__atomic__load32__1__dataE1_ptr1_sbits32__ret_dataE1_sbits32;
	.scl 2;
	.type 32;
	.endef
standard__atomic__load32__1__dataE1_ptr1_sbits32__ret_dataE1_sbits32:
	subq $32, %rsp
	movq %rsi, 16(%rsp)
	movq %rdi, 8(%rsp)
.LB6343:
	movl $0, 4(%rsp)
	leaq 4(%rsp), %rdx
	movq %rcx, %rsi
	                movq %rdx, %rdi
	                movl (%rsi), %eax
	                movl %eax, (%rdi)
	movl 4(%rsp), %eax
	movq 16(%rsp), %rsi
	movq 8(%rsp), %rdi
	addq $32, %rsp
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
.LB6348:
	movq %rcx, %rsi
	                movl %edx, %eax
	                xchgl %eax, (%rsi)
	movq 0(%rsp), %rsi
	addq $16, %rsp
	ret
	.text
	.globl standard__threading___ptr_from_bytes__1__byteE1_ptr1__ret_voidE1_ptr1
	.def standard__threading___ptr_from_bytes__1__byteE1_ptr1__ret_voidE1_ptr1;
	.scl 2;
	.type 32;
	.endef
standard__threading___ptr_from_bytes__1__byteE1_ptr1__ret_voidE1_ptr1:
.LB6353:
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
.LB6361:
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
.LB6370:
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
	je .LB6389
.LB6390:
	movq %rbx, %rcx
	movq %rax, (%rcx)
	movl THREAD_OK(%rip), %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB6389:
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
	.globl standard__threading__thread_join__1__ThreadE1_ptr1__ret_intE1
	.def standard__threading__thread_join__1__ThreadE1_ptr1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
standard__threading__thread_join__1__ThreadE1_ptr1__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
.LB6400:
	movq %rcx, %r8
	leaq 8(%r8), %rbx
	movl $0, -28(%rbp)
	leaq -28(%rbp), %rdx
	movq %rbx, %rcx
	movq %rcx, %rsi
	                movq %rdx, %rdi
	                movl (%rsi), %eax
	                movl %eax, (%rdi)
	cmpl $0, -28(%rbp)
	je .LB6406
.LB6407:
	movq %r8, %rax
	movq (%rax), %rax
	movl WIN32_INFINITE(%rip), %edx
	movq %rax, %rsi
	movq %rsi, %rcx
	callq WaitForSingleObject
	movl %eax, %edi
	movq %rsi, %rcx
	callq CloseHandle
	movq %rbx, %rcx
	xorl %edx, %edx
	movq %rcx, %rsi
	                movl %edx, %eax
	                xchgl %eax, (%rsi)
	testl %edi, %edi
	je .LB6425
.LB6426:
	movl THREAD_ERROR(%rip), %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB6425:
	movl THREAD_OK(%rip), %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB6406:
	movl THREAD_OK(%rip), %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
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
.LB6431:
	movq %rcx, %rsi
	xorl %ecx, %ecx
	movl $2147483647, %r8d
	xorl %r9d, %r9d
	callq CreateSemaphoreA
	testq %rax, %rax
	je .LB6445
.LB6446:
	movq %rsi, %rcx
	movq %rax, (%rcx)
	movl THREAD_OK(%rip), %eax
	movq -8(%rbp), %rsi
	leave
	ret
.LB6445:
	movl THREAD_ERROR(%rip), %eax
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl standard__threading__semaphore_destroy__1__SemaphoreE1_ptr1__ret_voidE1
	.def standard__threading__semaphore_destroy__1__SemaphoreE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__threading__semaphore_destroy__1__SemaphoreE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB6454:
	movq %rcx, %rax
	movq (%rax), %rax
	movq %rax, %rcx
	callq CloseHandle
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
.LB6463:
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
.LB6473:
	movq %rcx, %rax
	movq (%rax), %rax
	movq %rax, %rcx
	movl $1, %edx
	xorl %r8d, %r8d
	callq ReleaseSemaphore
	leave
	ret
	.text
	.globl btn_hit_test__4__intE1__intE1__intE1__intE1__ret_boolE1
	.def btn_hit_test__4__intE1__intE1__intE1__intE1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
btn_hit_test__4__intE1__intE1__intE1__intE1__ret_boolE1:
.LB10435:
	subl %r9d, %edx
	cmpl $4294967270, %edx
	jl .LB10461
.LB10455:
	cmpl $26, %edx
	jg .LB10461
.LB10462:
	addl $26, %edx
	subl %r8d, %ecx
	movslq %edx, %rax
	xorps %xmm0, %xmm0
	cvtsi2ssq %rax, %xmm0
	movl $52, %eax
	movslq %eax, %rax
	xorps %xmm1, %xmm1
	cvtsi2ssq %rax, %xmm1
	movl $36, %eax
	movslq %eax, %rax
	divss %xmm1, %xmm0
	movabsq $1056964608, %r10
	movq %r10, %xmm1
	subss %xmm1, %xmm0
	xorps %xmm1, %xmm1
	cvtsi2ssq %rax, %xmm1
	mulss %xmm1, %xmm0
	cvttss2siq %xmm0, %rax
	movl %eax, %eax
	subl %eax, %ecx
	cmpl $4294967186, %ecx
	jl .LB10491
.LB10485:
	cmpl $110, %ecx
	jg .LB10491
.LB10492:
	movl $1, %eax
	ret
.LB10491:
	xorl %eax, %eax
	ret
.LB10461:
	xorl %eax, %eax
	ret
	.text
	.globl btn_hit_test_ex__6__intE1__intE1__intE1__intE1__intE1__intE1__ret_boolE1
	.def btn_hit_test_ex__6__intE1__intE1__intE1__intE1__intE1__intE1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
btn_hit_test_ex__6__intE1__intE1__intE1__intE1__intE1__intE1__ret_boolE1:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
	movq %rdi, -8(%rsp)
.LB10494:
	movl 56(%rsp), %eax
	movl 64(%rsp), %esi
	xorl %edi, %edi
	subl %r9d, %edx
	subl %esi, %edi
	cmpl %edi, %edx
	jl .LB10520
.LB10514:
	cmpl %esi, %edx
	jg .LB10520
.LB10521:
	addl %esi, %edx
	shll $1, %esi
	subl %r8d, %ecx
	movslq %edx, %rdx
	xorps %xmm0, %xmm0
	cvtsi2ssq %rdx, %xmm0
	movslq %esi, %rdx
	xorps %xmm1, %xmm1
	cvtsi2ssq %rdx, %xmm1
	movl $18, %edx
	movslq %edx, %rdx
	divss %xmm1, %xmm0
	movabsq $1056964608, %r10
	movq %r10, %xmm1
	subss %xmm1, %xmm0
	xorps %xmm1, %xmm1
	cvtsi2ssq %rdx, %xmm1
	mulss %xmm1, %xmm0
	cvttss2siq %xmm0, %rdx
	movl %edx, %edx
	subl %edx, %ecx
	xorl %edx, %edx
	subl %eax, %edx
	cmpl %edx, %ecx
	jl .LB10553
.LB10547:
	cmpl %eax, %ecx
	jg .LB10553
.LB10554:
	movl $1, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB10553:
	xorl %eax, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB10520:
	xorl %eax, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
	.text
	.globl draw_parallelogram_btn__7__intE1__intE1__intE1__intE1__intE1__floatE1__floatE1__ret_voidE1
	.def draw_parallelogram_btn__7__intE1__intE1__intE1__intE1__intE1__floatE1__floatE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
draw_parallelogram_btn__7__intE1__intE1__intE1__intE1__intE1__floatE1__floatE1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $144, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
.LB11076:
	movl 48(%rbp), %eax
	movss 56(%rbp), %xmm0
	movl %ecx, %esi
	subl %r8d, %esi
	movabsq $1065353216, %r10
	movq %r10, %xmm2
	movsd %xmm0, -40(%rbp)
	movl %esi, %edi
	subl %eax, %edi
	addl %r8d, %ecx
	movss 64(%rbp), %xmm0
	movl %ecx, %ebx
	subl %eax, %ebx
	addl %eax, %esi
	leal (%rcx,%rax), %r12d
	movl %edx, %eax
	subl %r9d, %eax
	movslq %eax, %rax
	addl %r9d, %edx
	xorps %xmm1, %xmm1
	cvtsi2ssq %rax, %xmm1
	movslq %edx, %rax
	vfmsub132ss %xmm0, %xmm2, %xmm1
	movabsq $1065353216, %r10
	movq %r10, %xmm2
	movsd %xmm1, -48(%rbp)
	xorps %xmm1, %xmm1
	cvtsi2ssq %rax, %xmm1
	vfmsub132ss %xmm1, %xmm2, %xmm0
	movsd %xmm0, -56(%rbp)
	movl GL_QUADS(%rip), %ecx
	callq glBegin
	xorps %xmm0, %xmm0
	xorps %xmm1, %xmm1
	xorps %xmm2, %xmm2
	movabsq $1056964608, %r10
	movq %r10, %xmm3
	callq glColor4f
	movslq %edi, %rax
	movsd -40(%rbp), %xmm1
	xorps %xmm0, %xmm0
	cvtsi2ssq %rax, %xmm0
	mulss %xmm1, %xmm0
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	movsd %xmm0, -64(%rbp)
	subss %xmm1, %xmm0
	movabsq $1002740646, %r10
	movq %r10, %xmm1
	movsd -48(%rbp), %xmm2
	addss %xmm1, %xmm0
	movabsq $1008981770, %r10
	movq %r10, %xmm1
	movaps %xmm1, %xmm15
	movaps %xmm2, %xmm1
	subss %xmm15, %xmm1
	callq glVertex2f
	movslq %ebx, %rax
	movsd -40(%rbp), %xmm1
	xorps %xmm0, %xmm0
	cvtsi2ssq %rax, %xmm0
	mulss %xmm1, %xmm0
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	movsd %xmm0, -72(%rbp)
	subss %xmm1, %xmm0
	movabsq $1002740646, %r10
	movq %r10, %xmm1
	movsd -48(%rbp), %xmm2
	addss %xmm1, %xmm0
	movabsq $1008981770, %r10
	movq %r10, %xmm1
	movaps %xmm1, %xmm15
	movaps %xmm2, %xmm1
	subss %xmm15, %xmm1
	callq glVertex2f
	movslq %r12d, %rax
	movsd -40(%rbp), %xmm1
	xorps %xmm0, %xmm0
	cvtsi2ssq %rax, %xmm0
	mulss %xmm1, %xmm0
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	movsd %xmm0, -80(%rbp)
	subss %xmm1, %xmm0
	movabsq $1002740646, %r10
	movq %r10, %xmm1
	movsd -56(%rbp), %xmm2
	addss %xmm1, %xmm0
	movabsq $1008981770, %r10
	movq %r10, %xmm1
	movaps %xmm1, %xmm15
	movaps %xmm2, %xmm1
	subss %xmm15, %xmm1
	callq glVertex2f
	movslq %esi, %rax
	movsd -40(%rbp), %xmm1
	xorps %xmm0, %xmm0
	cvtsi2ssq %rax, %xmm0
	mulss %xmm1, %xmm0
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	movsd %xmm0, -88(%rbp)
	subss %xmm1, %xmm0
	movabsq $1002740646, %r10
	movq %r10, %xmm1
	movsd -56(%rbp), %xmm2
	addss %xmm1, %xmm0
	movabsq $1008981770, %r10
	movq %r10, %xmm1
	movaps %xmm1, %xmm15
	movaps %xmm2, %xmm1
	subss %xmm15, %xmm1
	callq glVertex2f
	callq glEnd
	movl GL_QUADS(%rip), %ecx
	callq glBegin
	movabsq $1025758986, %r10
	movq %r10, %xmm0
	movabsq $1032805417, %r10
	movq %r10, %xmm1
	movabsq $1043878380, %r10
	movq %r10, %xmm2
	movabsq $1064011039, %r10
	movq %r10, %xmm3
	callq glColor4f
	movsd -64(%rbp), %xmm1
	movabsq $1065353216, %r10
	movq %r10, %xmm0
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subss %xmm15, %xmm0
	movsd -48(%rbp), %xmm1
	callq glVertex2f
	movabsq $1025758986, %r10
	movq %r10, %xmm0
	movabsq $1032805417, %r10
	movq %r10, %xmm1
	movabsq $1043878380, %r10
	movq %r10, %xmm2
	movabsq $1064011039, %r10
	movq %r10, %xmm3
	callq glColor4f
	movsd -72(%rbp), %xmm1
	movabsq $1065353216, %r10
	movq %r10, %xmm0
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subss %xmm15, %xmm0
	movsd -48(%rbp), %xmm1
	callq glVertex2f
	movabsq $1034147594, %r10
	movq %r10, %xmm0
	movabsq $1041194025, %r10
	movq %r10, %xmm1
	movabsq $1051595899, %r10
	movq %r10, %xmm2
	movabsq $1064011039, %r10
	movq %r10, %xmm3
	callq glColor4f
	movsd -80(%rbp), %xmm1
	movabsq $1065353216, %r10
	movq %r10, %xmm0
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subss %xmm15, %xmm0
	movsd -56(%rbp), %xmm1
	callq glVertex2f
	movabsq $1034147594, %r10
	movq %r10, %xmm0
	movabsq $1041194025, %r10
	movq %r10, %xmm1
	movabsq $1051595899, %r10
	movq %r10, %xmm2
	movabsq $1064011039, %r10
	movq %r10, %xmm3
	callq glColor4f
	movsd -88(%rbp), %xmm1
	movabsq $1065353216, %r10
	movq %r10, %xmm0
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subss %xmm15, %xmm0
	movsd -56(%rbp), %xmm1
	callq glVertex2f
	callq glEnd
	movabsq $1069547520, %r10
	movq %r10, %xmm0
	callq glLineWidth
	movl GL_LINES(%rip), %ecx
	callq glBegin
	movabsq $1053609165, %r10
	movq %r10, %xmm0
	movabsq $1060320051, %r10
	movq %r10, %xmm1
	movabsq $1065353216, %r10
	movq %r10, %xmm2
	movabsq $1061997773, %r10
	movq %r10, %xmm3
	callq glColor4f
	movsd -88(%rbp), %xmm1
	movabsq $1065353216, %r10
	movq %r10, %xmm0
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subss %xmm15, %xmm0
	movsd -56(%rbp), %xmm1
	callq glVertex2f
	movsd -80(%rbp), %xmm1
	movabsq $1065353216, %r10
	movq %r10, %xmm0
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subss %xmm15, %xmm0
	movsd -56(%rbp), %xmm1
	callq glVertex2f
	callq glEnd
	movl GL_LINES(%rip), %ecx
	callq glBegin
	xorps %xmm0, %xmm0
	movabsq $1028443341, %r10
	movq %r10, %xmm1
	movabsq $1041865114, %r10
	movq %r10, %xmm2
	movabsq $1063675494, %r10
	movq %r10, %xmm3
	callq glColor4f
	movslq %edi, %rax
	movsd -40(%rbp), %xmm1
	xorps %xmm0, %xmm0
	cvtsi2ssq %rax, %xmm0
	mulss %xmm1, %xmm0
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	movsd %xmm0, -96(%rbp)
	subss %xmm1, %xmm0
	movsd -48(%rbp), %xmm1
	callq glVertex2f
	movslq %ebx, %rax
	movsd -40(%rbp), %xmm1
	xorps %xmm0, %xmm0
	cvtsi2ssq %rax, %xmm0
	mulss %xmm1, %xmm0
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	movsd %xmm0, -104(%rbp)
	subss %xmm1, %xmm0
	movsd -48(%rbp), %xmm1
	callq glVertex2f
	callq glEnd
	movabsq $1072064102, %r10
	movq %r10, %xmm0
	callq glLineWidth
	movl GL_LINE_LOOP(%rip), %ecx
	callq glBegin
	movabsq $1048576000, %r10
	movq %r10, %xmm0
	movabsq $1057803469, %r10
	movq %r10, %xmm1
	movabsq $1065353216, %r10
	movq %r10, %xmm2
	movabsq $1064514355, %r10
	movq %r10, %xmm3
	callq glColor4f
	movsd -96(%rbp), %xmm1
	movabsq $1065353216, %r10
	movq %r10, %xmm0
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subss %xmm15, %xmm0
	movsd -48(%rbp), %xmm1
	callq glVertex2f
	movsd -104(%rbp), %xmm1
	movabsq $1065353216, %r10
	movq %r10, %xmm0
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subss %xmm15, %xmm0
	movsd -48(%rbp), %xmm1
	callq glVertex2f
	movslq %r12d, %rax
	movsd -40(%rbp), %xmm2
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	xorps %xmm0, %xmm0
	cvtsi2ssq %rax, %xmm0
	vfmsub132ss %xmm2, %xmm1, %xmm0
	movsd -56(%rbp), %xmm1
	callq glVertex2f
	movslq %esi, %rax
	movsd -40(%rbp), %xmm2
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	xorps %xmm0, %xmm0
	cvtsi2ssq %rax, %xmm0
	vfmsub132ss %xmm2, %xmm1, %xmm0
	movsd -56(%rbp), %xmm1
	callq glVertex2f
	callq glEnd
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
	.text
	.globl text_width__2__byteE1_ptr1__intE1__ret_intE1
	.def text_width__2__byteE1_ptr1__intE1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
text_width__2__byteE1_ptr1__intE1__ret_intE1:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
	movq %rdi, -8(%rsp)
.LB11042:
	xorl %eax, %eax
	xorl %esi, %esi
.LB11048:
	movslq %eax, %rdi
	cmpb $0, (%rcx,%rdi,1)
	je .LB11050
.LB11059:
	incl %esi
	incl %eax
	jmp .LB11048
.LB11050:
	testl %esi, %esi
	je .LB11067
.LB11068:
	imull $6, %esi, %esi
	imull %edx, %esi
	movl %esi, %eax
	subl %edx, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB11067:
	xorl %eax, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
	.text
	.globl draw_text__6__byteE1_ptr1__intE1__intE1__intE1__floatE1__floatE1__ret_voidE1
	.def draw_text__6__byteE1_ptr1__intE1__intE1__intE1__floatE1__floatE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
draw_text__6__byteE1_ptr1__intE1__intE1__intE1__floatE1__floatE1__ret_voidE1:
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
.LB10913:
	movl %edx, %esi
	movl %r8d, %edi
	movl %r9d, %ebx
	movq %rcx, -152(%rbp)
	movss 48(%rbp), %xmm0
	movsd %xmm0, -64(%rbp)
	movss 56(%rbp), %xmm0
	movsd %xmm0, -72(%rbp)
	movl GL_QUADS(%rip), %ecx
	callq glBegin
	imull $6, %ebx, %eax
	movq %rax, -168(%rbp)
	movq $0, -176(%rbp)
	movq %rsi, -200(%rbp)
	xorl %esi, %esi
	movq $0, -80(%rbp)
	movq $0, -88(%rbp)
	movq $0, -96(%rbp)
	movq $0, -104(%rbp)
	movq $0, -112(%rbp)
	movabsq $0, %r10
	movq %r10, -120(%rbp)
	movabsq $0, %r10
	movq %r10, -128(%rbp)
	movabsq $0, %r10
	movq %r10, -136(%rbp)
	movabsq $0, %r10
	movq %r10, -144(%rbp)
.LB10937:
	movq -176(%rbp), %rax
	movq -152(%rbp), %rcx
	movslq %eax, %rax
	movzbl (%rcx,%rax,1), %eax
	movzbl %al, %ecx
	testb %al, %al
	je .LB10947
.LB10948:
	cmpb $97, %al
	jb .LB10958
.LB10952:
	cmpb $122, %al
	jbe .LB10957
.LB10958:
.LB10959:
	callq font_glyph__1__intE1__ret_dataE1_ptr1_ubits32
	movq %rax, -184(%rbp)
	movq $0, -208(%rbp)
	movq -80(%rbp), %rax
	movq -88(%rbp), %rcx
	movq -96(%rbp), %rdx
	movq -104(%rbp), %r8
	movq -112(%rbp), %r10
	movq %r10, -160(%rbp)
	movsd -120(%rbp), %xmm0
	movsd -128(%rbp), %xmm1
	movsd -136(%rbp), %xmm2
	movsd -144(%rbp), %xmm3
.LB10964:
	movq -208(%rbp), %r9
	cmpl $5, %r9d
	jge .LB10966
.LB10965:
	movq -208(%rbp), %rax
	movq -184(%rbp), %r9
	movslq %eax, %rsi
	imull %ebx, %eax
	movl (%r9,%rsi,4), %esi
	movq -200(%rbp), %r9
	leal (%r9,%rax), %r12d
	leal (%r12,%rbx), %r13d
	movq $0, -192(%rbp)
	movq -160(%rbp), %rax
.LB10973:
	movq -192(%rbp), %r9
	cmpl $7, %r9d
	jge .LB10975
.LB10974:
	movq -192(%rbp), %r9
	btl %r9d, %esi
	jb .LB10983
.LB10984:
.LB10985:
	movq -192(%rbp), %r9
	incl %r9d
	movq %r9, -192(%rbp)
	jmp .LB10973
.LB10957:
	subl $32, %ecx
	jmp .LB10959
.LB10966:
	movq -200(%rbp), %r9
	movq -168(%rbp), %r12
	addl %r12d, %r9d
	movq -176(%rbp), %r12
	incl %r12d
	movq %r12, -176(%rbp)
	movq %r9, -200(%rbp)
	movq %rax, -80(%rbp)
	movq %rcx, -88(%rbp)
	movq %rdx, -96(%rbp)
	movq %r8, -104(%rbp)
	movq -160(%rbp), %r10
	movq %r10, -112(%rbp)
	movsd %xmm0, -120(%rbp)
	movsd %xmm1, -128(%rbp)
	movsd %xmm2, -136(%rbp)
	movsd %xmm3, -144(%rbp)
	jmp .LB10937
.LB10975:
	movq -208(%rbp), %r9
	incl %r9d
	movq %r9, -208(%rbp)
	movq %rax, -160(%rbp)
	movq %rsi, %rax
	movq -192(%rbp), %rsi
	jmp .LB10964
.LB10983:
	movq -192(%rbp), %rcx
	movl $6, %eax
	movsd -64(%rbp), %xmm2
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	subl %ecx, %eax
	imull %ebx, %eax
	leal (%rdi,%rax), %r14d
	movslq %r12d, %rax
	leal (%r14,%rbx), %r15d
	xorps %xmm0, %xmm0
	cvtsi2ssq %rax, %xmm0
	movslq %r14d, %rax
	vfmsub132ss %xmm2, %xmm1, %xmm0
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	movsd %xmm0, -216(%rbp)
	xorps %xmm0, %xmm0
	cvtsi2ssq %rax, %xmm0
	movsd -72(%rbp), %xmm2
	movslq %r13d, %rax
	vfmsub132ss %xmm2, %xmm1, %xmm0
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	movsd %xmm0, -224(%rbp)
	xorps %xmm0, %xmm0
	cvtsi2ssq %rax, %xmm0
	movsd -64(%rbp), %xmm2
	movslq %r15d, %rax
	vfmsub132ss %xmm2, %xmm1, %xmm0
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	movsd %xmm0, -232(%rbp)
	xorps %xmm0, %xmm0
	cvtsi2ssq %rax, %xmm0
	movsd -72(%rbp), %xmm2
	vfmsub132ss %xmm2, %xmm1, %xmm0
	movsd %xmm0, -240(%rbp)
	movsd -216(%rbp), %xmm0
	movsd -224(%rbp), %xmm1
	callq glVertex2f
	movsd -232(%rbp), %xmm0
	movsd -224(%rbp), %xmm1
	callq glVertex2f
	movsd -232(%rbp), %xmm0
	movsd -240(%rbp), %xmm1
	callq glVertex2f
	movsd -216(%rbp), %xmm0
	movsd -240(%rbp), %xmm1
	callq glVertex2f
	movq %r12, %rcx
	movq %r14, %rdx
	movq %r13, %r8
	movq %r15, %rax
	movsd -216(%rbp), %xmm0
	movsd -224(%rbp), %xmm1
	movsd -232(%rbp), %xmm2
	movsd -240(%rbp), %xmm3
	jmp .LB10985
.LB10947:
	callq glEnd
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
	.globl draw_quit_dialog__2__intE1__intE1__ret_voidE1
	.def draw_quit_dialog__2__intE1__intE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
draw_quit_dialog__2__intE1__intE1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $192, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
	movq %r14, -48(%rbp)
.LB11303:
	movabsq $1073741824, %r10
	movq %r10, %xmm1
	movslq %ecx, %rax
	xorps %xmm0, %xmm0
	cvtsi2ssq %rax, %xmm0
	movslq %edx, %rax
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	divss %xmm15, %xmm0
	movabsq $1073741824, %r10
	movq %r10, %xmm1
	movsd %xmm0, -96(%rbp)
	xorps %xmm0, %xmm0
	cvtsi2ssq %rax, %xmm0
	movl %ecx, %eax
	sarl $31, %eax
	movl %ecx, %eax
	shrl $31, %eax
	addl %eax, %ecx
	movl %ecx, %eax
	sarl $1, %eax
	movl %eax, %esi
	movl %edx, %eax
	sarl $31, %eax
	movl %edx, %eax
	shrl $31, %eax
	addl %eax, %edx
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	divss %xmm15, %xmm0
	movl %edx, %eax
	sarl $1, %eax
	leal -210(%rsi), %ebx
	movl %eax, %edi
	leal -80(%rdi), %r12d
	leal 210(%rsi), %r13d
	leal 80(%rdi), %r14d
	movsd %xmm0, -104(%rbp)
	movl GL_TEXTURE_2D(%rip), %ecx
	callq glDisable
	movl GL_DEPTH_TEST(%rip), %ecx
	callq glDisable
	movl GL_BLEND(%rip), %ecx
	callq glEnable
	movl GL_SRC_ALPHA(%rip), %ecx
	movl GL_ONE_MINUS_SRC_ALPHA(%rip), %edx
	callq glBlendFunc
	movslq %ebx, %rax
	movsd -96(%rbp), %xmm2
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	xorps %xmm0, %xmm0
	cvtsi2ssq %rax, %xmm0
	movslq %r12d, %rax
	vfmsub132ss %xmm2, %xmm1, %xmm0
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	movsd %xmm0, -112(%rbp)
	xorps %xmm0, %xmm0
	cvtsi2ssq %rax, %xmm0
	movsd -104(%rbp), %xmm2
	movslq %r13d, %rax
	vfmsub132ss %xmm2, %xmm1, %xmm0
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	movsd %xmm0, -120(%rbp)
	xorps %xmm0, %xmm0
	cvtsi2ssq %rax, %xmm0
	movsd -96(%rbp), %xmm2
	movslq %r14d, %rax
	vfmsub132ss %xmm2, %xmm1, %xmm0
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	movsd %xmm0, -128(%rbp)
	xorps %xmm0, %xmm0
	cvtsi2ssq %rax, %xmm0
	movsd -104(%rbp), %xmm2
	vfmsub132ss %xmm2, %xmm1, %xmm0
	movsd %xmm0, -136(%rbp)
	movl GL_QUADS(%rip), %ecx
	callq glBegin
	movabsq $1017370378, %r10
	movq %r10, %xmm0
	movabsq $1025758986, %r10
	movq %r10, %xmm1
	movabsq $1039516303, %r10
	movq %r10, %xmm2
	movabsq $1064682127, %r10
	movq %r10, %xmm3
	callq glColor4f
	movsd -112(%rbp), %xmm0
	movsd -120(%rbp), %xmm1
	callq glVertex2f
	movsd -128(%rbp), %xmm0
	movsd -120(%rbp), %xmm1
	callq glVertex2f
	movsd -128(%rbp), %xmm0
	movsd -136(%rbp), %xmm1
	callq glVertex2f
	movsd -112(%rbp), %xmm0
	movsd -136(%rbp), %xmm1
	callq glVertex2f
	callq glEnd
	movabsq $1072064102, %r10
	movq %r10, %xmm0
	callq glLineWidth
	movl GL_LINE_LOOP(%rip), %ecx
	callq glBegin
	movabsq $1048576000, %r10
	movq %r10, %xmm0
	movabsq $1057803469, %r10
	movq %r10, %xmm1
	movabsq $1065353216, %r10
	movq %r10, %xmm2
	movabsq $1064514355, %r10
	movq %r10, %xmm3
	callq glColor4f
	movsd -112(%rbp), %xmm0
	movsd -120(%rbp), %xmm1
	callq glVertex2f
	movsd -128(%rbp), %xmm0
	movsd -120(%rbp), %xmm1
	callq glVertex2f
	movsd -128(%rbp), %xmm0
	movsd -136(%rbp), %xmm1
	callq glVertex2f
	movsd -112(%rbp), %xmm0
	movsd -136(%rbp), %xmm1
	callq glVertex2f
	callq glEnd
	movabsq $1065353216, %r10
	movq %r10, %xmm0
	callq glLineWidth
	movl GL_LINES(%rip), %ecx
	callq glBegin
	movabsq $1053609165, %r10
	movq %r10, %xmm0
	movabsq $1060320051, %r10
	movq %r10, %xmm1
	movabsq $1065353216, %r10
	movq %r10, %xmm2
	movabsq $1058642330, %r10
	movq %r10, %xmm3
	callq glColor4f
	movsd -112(%rbp), %xmm0
	movsd -136(%rbp), %xmm1
	callq glVertex2f
	movsd -128(%rbp), %xmm0
	movsd -136(%rbp), %xmm1
	callq glVertex2f
	callq glEnd
	leaq -79(%rbp), %rbx
	movl $541413953, -79(%rbp)
	movl $542461785, -75(%rbp)
	movl $1163023699, -71(%rbp)
	movl $1431263520, -67(%rbp)
	movl $1312904992, -63(%rbp)
	movl $1330913364, -59(%rbp)
	movl $1230328096, -55(%rbp)
	movw $16212, -51(%rbp)
	movb $0, -49(%rbp)
	movl $2, %edx
	movq %rbx, %rcx
	callq text_width__2__byteE1_ptr1__intE1__ret_intE1
	movabsq $1062836634, %r10
	movq %r10, %xmm0
	movabsq $1064011039, %r10
	movq %r10, %xmm1
	movabsq $1065353216, %r10
	movq %r10, %xmm2
	movl %eax, %ecx
	sarl $31, %ecx
	movl %eax, %ecx
	shrl $31, %ecx
	movabsq $1065353216, %r10
	movq %r10, %xmm3
	addl %ecx, %eax
	sarl $1, %eax
	movl %esi, %r12d
	subl %eax, %r12d
	leal 80(%rdi), %eax
	leal -36(%rax), %r13d
	callq glColor4f
	movsd -96(%rbp), %xmm0
	movq %rbx, %rcx
	movq %r12, %rdx
	movq %r13, %r8
	movl $2, %r9d
	movss %xmm0, 32(%rsp)
	movsd -104(%rbp), %xmm0
	movss %xmm0, 40(%rsp)
	callq draw_text__6__byteE1_ptr1__intE1__intE1__intE1__floatE1__floatE1__ret_voidE1
	movl $5457241, -83(%rbp)
	movq $9, 32(%rsp)
	movsd -96(%rbp), %xmm0
	leaq -83(%rbp), %rbx
	leal -80(%rsi), %r12d
	subl $50, %edi
	movl $55, %r8d
	movl $26, %r9d
	movq %r12, %rcx
	movq %rdi, %rdx
	movss %xmm0, 40(%rsp)
	movsd -104(%rbp), %xmm0
	movss %xmm0, 48(%rsp)
	callq draw_parallelogram_btn__7__intE1__intE1__intE1__intE1__intE1__floatE1__floatE1__ret_voidE1
	movq %rbx, %rcx
	movl $2, %edx
	callq text_width__2__byteE1_ptr1__intE1__ret_intE1
	movabsq $1061158912, %r10
	movq %r10, %xmm0
	movabsq $1063339950, %r10
	movq %r10, %xmm1
	movabsq $1065353216, %r10
	movq %r10, %xmm2
	movl %eax, %ecx
	sarl $31, %ecx
	movl %eax, %ecx
	shrl $31, %ecx
	movabsq $1065353216, %r10
	movq %r10, %xmm3
	addl %ecx, %eax
	sarl $1, %eax
	subl %eax, %r12d
	leal -7(%rdi), %r13d
	callq glColor4f
	movsd -96(%rbp), %xmm0
	movq %rbx, %rcx
	movq %r12, %rdx
	movq %r13, %r8
	movl $2, %r9d
	movss %xmm0, 32(%rsp)
	movsd -104(%rbp), %xmm0
	movss %xmm0, 40(%rsp)
	callq draw_text__6__byteE1_ptr1__intE1__intE1__intE1__floatE1__floatE1__ret_voidE1
	movw $20302, -86(%rbp)
	movb $0, -84(%rbp)
	movq $9, 32(%rsp)
	movsd -96(%rbp), %xmm0
	leaq -86(%rbp), %rbx
	addl $80, %esi
	movq %rdi, %rdx
	movl $55, %r8d
	movq %rsi, %rcx
	movl $26, %r9d
	movss %xmm0, 40(%rsp)
	movsd -104(%rbp), %xmm0
	movss %xmm0, 48(%rsp)
	callq draw_parallelogram_btn__7__intE1__intE1__intE1__intE1__intE1__floatE1__floatE1__ret_voidE1
	movq %rbx, %rcx
	movl $2, %edx
	callq text_width__2__byteE1_ptr1__intE1__ret_intE1
	movabsq $1061158912, %r10
	movq %r10, %xmm0
	movabsq $1063339950, %r10
	movq %r10, %xmm1
	movabsq $1065353216, %r10
	movq %r10, %xmm2
	movl %eax, %ecx
	sarl $31, %ecx
	movl %eax, %ecx
	shrl $31, %ecx
	movabsq $1065353216, %r10
	movq %r10, %xmm3
	addl %ecx, %eax
	sarl $1, %eax
	subl %eax, %esi
	callq glColor4f
	movsd -96(%rbp), %xmm0
	movq %rbx, %rcx
	movq %rsi, %rdx
	movq %r13, %r8
	movl $2, %r9d
	movss %xmm0, 32(%rsp)
	movsd -104(%rbp), %xmm0
	movss %xmm0, 40(%rsp)
	callq draw_text__6__byteE1_ptr1__intE1__intE1__intE1__floatE1__floatE1__ret_voidE1
	movl GL_BLEND(%rip), %ecx
	callq glDisable
	movl GL_TEXTURE_2D(%rip), %ecx
	callq glEnable
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	leave
	ret
	.text
	.globl paddle_update__0__ret_voidE1
	.def paddle_update__0__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
paddle_update__0__ret_voidE1:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
	movq %rdi, -8(%rsp)
.LB9082:
	movl cur_h(%rip), %ecx
	movl mouse_y(%rip), %edx
	leal -1(%rcx), %eax
	subl %edx, %eax
	imull $192, %eax, %eax
	cltd
	idivl %ecx
	movl $15, %edx
	cmpl $15, %eax
	cmovl %edx, %eax
	movl $176, %edx
	cmpl $176, %eax
	cmovg %edx, %eax
	movl %eax, g_paddle_gy(%rip)
	cmpb $0, g_sucking(%rip)
	jne .LB9122
.LB9123:
	movss g_suck_charge(%rip), %xmm0
	xorps %xmm1, %xmm1
	ucomiss %xmm1, %xmm0
	ja .LB9258
.LB9259:
	cmpb $0, g_jetting(%rip)
	je .LB9269
.LB9270:
	movl g_rand_seed(%rip), %ecx
	imull $1664525, %ecx, %ecx
	addl $1013904223, %ecx
	movl %ecx, g_rand_seed(%rip)
	andl $7, %ecx
	subl $3, %ecx
	addl %ecx, %eax
	leal -14(%rax), %ecx
	leal 14(%rax), %edx
	movl $1, %esi
	cmpl $1, %ecx
	cmovl %esi, %ecx
	movl $190, %esi
	cmpl $190, %edx
	cmovg %esi, %edx
.LB9298:
	cmpl %edx, %ecx
	jg .LB9301
.LB9299:
	movl %ecx, %esi
	subl %eax, %esi
	movslq %esi, %rsi
	xorps %xmm0, %xmm0
	cvtsi2sdq %rsi, %xmm0
	movl $197, %esi
	movslq %esi, %rsi
	xorps %xmm1, %xmm1
	cvtsi2sdq %rsi, %xmm1
	mulsd %xmm0, %xmm0
	divsd %xmm1, %xmm0
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subsd %xmm15, %xmm0
	xorps %xmm1, %xmm1
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm0, %xmm1
	ja .LB9322
.LB9323:
.LB9324:
	movq g_dens(%rip), %rsi
	movl %ecx, %edi
	shll $8, %edi
	movabsq $1137180672, %r10
	movq %r10, %xmm2
	addl $5, %edi
	incl %ecx
	movslq %edi, %rdi
	cvtss2sd %xmm2, %xmm2
	leaq (%rsi,%rdi,8), %rsi
	movsd (%rsi), %xmm1
	vfmadd231sd %xmm0, %xmm2, %xmm1
	movabsq $1109393408, %r10
	movq %r10, %xmm2
	cvtss2sd %xmm2, %xmm2
	movsd %xmm1, (%rsi)
	movq g_vx(%rip), %rsi
	leaq (%rsi,%rdi,8), %rsi
	movsd (%rsi), %xmm1
	vfmadd132sd %xmm2, %xmm1, %xmm0
	movsd %xmm0, (%rsi)
	cmpl %edx, %ecx
	jle .LB9299
.LB9301:
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB9322:
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	jmp .LB9324
.LB9269:
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB9258:
	movss g_ball_vx(%rip), %xmm1
	movabsq $1102053376, %r10
	movq %r10, %xmm2
	vfmadd132ss %xmm2, %xmm1, %xmm0
	movss %xmm0, g_ball_vx(%rip)
	movss g_ball_vy(%rip), %xmm0
	movabsq $1053609165, %r10
	movq %r10, %xmm1
	mulss %xmm1, %xmm0
	movss %xmm0, g_ball_vy(%rip)
	xorps %xmm0, %xmm0
	movss %xmm0, g_suck_charge(%rip)
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB9122:
	movss g_suck_charge(%rip), %xmm0
	movabsq $1016296636, %r10
	movq %r10, %xmm1
	addss %xmm1, %xmm0
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	movss %xmm0, g_suck_charge(%rip)
	ucomiss %xmm1, %xmm0
	ja .LB9129
.LB9131:
	movl cur_w(%rip), %edx
	movss g_ball_x(%rip), %xmm1
	imull $6, %edx, %edx
	movl %edx, %esi
	sarl $31, %esi
	shrl $24, %esi
	addl %esi, %edx
	sarl $8, %edx
	imull %eax, %ecx
	movslq %edx, %rdx
	xorps %xmm0, %xmm0
	cvtsi2ssq %rdx, %xmm0
	movslq %ecx, %rcx
	movabsq $2863311531, %rdx
	imulq %rcx, %rdx
	sarq $39, %rdx
	shrq $63, %rcx
	movaps %xmm0, %xmm2
	subss %xmm1, %xmm2
	addl %edx, %ecx
	movss g_ball_y(%rip), %xmm1
	movslq %ecx, %rcx
	xorps %xmm0, %xmm0
	cvtsi2ssq %rcx, %xmm0
	movaps %xmm0, %xmm3
	subss %xmm1, %xmm3
	movaps %xmm3, %xmm0
	mulss %xmm3, %xmm0
	vfmadd231ss %xmm2, %xmm2, %xmm0
	movaps %xmm0, %xmm1
	sqrtss %xmm1, %xmm0
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	ucomiss %xmm1, %xmm0
	ja .LB9157
.LB9159:
	leal -14(%rax), %ecx
	leal 14(%rax), %edx
	movl $1, %esi
	cmpl $1, %ecx
	cmovl %esi, %ecx
	movl $190, %esi
	cmpl $190, %edx
	cmovg %esi, %edx
.LB9194:
	cmpl %edx, %ecx
	jg .LB9197
.LB9195:
	movl %ecx, %esi
	subl %eax, %esi
	movslq %esi, %rsi
	xorps %xmm0, %xmm0
	cvtsi2sdq %rsi, %xmm0
	movl $197, %esi
	movslq %esi, %rsi
	xorps %xmm1, %xmm1
	cvtsi2sdq %rsi, %xmm1
	mulsd %xmm0, %xmm0
	divsd %xmm1, %xmm0
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subsd %xmm15, %xmm0
	xorps %xmm1, %xmm1
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm0, %xmm1
	ja .LB9218
.LB9219:
.LB9220:
	movq g_dens(%rip), %rsi
	movl %ecx, %edi
	shll $8, %edi
	movabsq $1137180672, %r10
	movq %r10, %xmm2
	movabsq $1053609165, %r10
	movq %r10, %xmm3
	addl $6, %edi
	incl %ecx
	movslq %edi, %rdi
	mulss %xmm3, %xmm2
	movabsq $1069547520, %r10
	movq %r10, %xmm3
	leaq (%rsi,%rdi,8), %rsi
	cvtss2sd %xmm2, %xmm2
	movsd (%rsi), %xmm1
	vfmadd231sd %xmm0, %xmm2, %xmm1
	movabsq $1109393408, %r10
	movq %r10, %xmm2
	mulss %xmm3, %xmm2
	movsd %xmm1, (%rsi)
	movq g_vx(%rip), %rsi
	cvtss2sd %xmm2, %xmm2
	leaq (%rsi,%rdi,8), %rsi
	movsd (%rsi), %xmm1
	vfnmadd132sd %xmm2, %xmm1, %xmm0
	movsd %xmm0, (%rsi)
	cmpl %edx, %ecx
	jle .LB9195
	jmp .LB9197
.LB9129:
	movabsq $1065353216, %r10
	movq %r10, %xmm0
	movss %xmm0, g_suck_charge(%rip)
	jmp .LB9131
.LB9157:
	divss %xmm0, %xmm2
	movss g_suck_charge(%rip), %xmm1
	movabsq $1067030938, %r10
	movq %r10, %xmm4
	movabsq $1058642330, %r10
	movq %r10, %xmm5
	movaps %xmm0, %xmm15
	movaps %xmm3, %xmm0
	divss %xmm15, %xmm0
	vfmadd132ss %xmm4, %xmm5, %xmm1
	movss g_ball_vx(%rip), %xmm4
	vfmadd132ss %xmm1, %xmm4, %xmm2
	movss %xmm2, g_ball_vx(%rip)
	movss g_ball_vy(%rip), %xmm2
	vfmadd132ss %xmm1, %xmm2, %xmm0
	movss %xmm0, g_ball_vy(%rip)
	jmp .LB9159
.LB9197:
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB9218:
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	jmp .LB9220
	.text
	.globl cpu_paddle_update__0__ret_voidE1
	.def cpu_paddle_update__0__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
cpu_paddle_update__0__ret_voidE1:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
	movq %rdi, -8(%rsp)
.LB9358:
	movss g_ball_y(%rip), %xmm0
	movslq cur_h(%rip), %rax
	xorl %ecx, %ecx
	xorl %edi, %edi
	xorps %xmm1, %xmm1
	cvtsi2ssq %rax, %xmm1
	movl $192, %eax
	movslq %eax, %rax
	divss %xmm1, %xmm0
	xorps %xmm1, %xmm1
	cvtsi2ssq %rax, %xmm1
	mulss %xmm1, %xmm0
	cvttss2siq %xmm0, %rax
	movabsq $1069547520, %r10
	movq %r10, %xmm0
	cvttss2siq %xmm0, %rdx
	movabsq $1069547520, %r10
	movq %r10, %xmm0
	movl %eax, %eax
	testl %eax, %eax
	cvttss2siq %xmm0, %rsi
	movabsq $1069547520, %r10
	movq %r10, %xmm0
	cmovs %ecx, %eax
	movl $192, %ecx
	cmpl $192, %eax
	movl %edx, %edx
	cmovg %ecx, %eax
	movl g_cpu_paddle_gy(%rip), %ecx
	movl %esi, %esi
	subl %ecx, %eax
	cmpl %edx, %eax
	cvttss2siq %xmm0, %rdx
	movabsq $1069547520, %r10
	movq %r10, %xmm0
	cmovg %esi, %eax
	xorl %esi, %esi
	movl %edx, %edx
	subl %edx, %esi
	cvttss2siq %xmm0, %rdx
	movl %edx, %edx
	subl %edx, %edi
	cmpl %esi, %eax
	cmovl %edi, %eax
	addl %eax, %ecx
	movl $15, %eax
	cmpl $15, %ecx
	cmovl %eax, %ecx
	movl $176, %eax
	cmpl $176, %ecx
	cmovg %eax, %ecx
	movl %ecx, g_cpu_paddle_gy(%rip)
	movl g_rand_seed(%rip), %eax
	imull $1664525, %eax, %eax
	addl $1013904223, %eax
	movl %eax, g_rand_seed(%rip)
	andl $7, %eax
	subl $3, %eax
	addl %eax, %ecx
	leal -14(%rcx), %eax
	leal 14(%rcx), %edx
	movl $1, %esi
	cmpl $1, %eax
	cmovl %esi, %eax
	movl $190, %esi
	cmpl $190, %edx
	cmovg %esi, %edx
.LB9454:
	cmpl %edx, %eax
	jg .LB9457
.LB9455:
	movl %eax, %esi
	subl %ecx, %esi
	movslq %esi, %rsi
	xorps %xmm0, %xmm0
	cvtsi2sdq %rsi, %xmm0
	movl $197, %esi
	movslq %esi, %rsi
	xorps %xmm1, %xmm1
	cvtsi2sdq %rsi, %xmm1
	mulsd %xmm0, %xmm0
	divsd %xmm1, %xmm0
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subsd %xmm15, %xmm0
	xorps %xmm1, %xmm1
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm0, %xmm1
	ja .LB9478
.LB9479:
.LB9480:
	movq g_dens(%rip), %rsi
	movl %eax, %edi
	shll $8, %edi
	movabsq $1137180672, %r10
	movq %r10, %xmm2
	addl $249, %edi
	incl %eax
	movslq %edi, %rdi
	cvtss2sd %xmm2, %xmm2
	leaq (%rsi,%rdi,8), %rsi
	movsd (%rsi), %xmm1
	vfmadd231sd %xmm0, %xmm2, %xmm1
	movabsq $1109393408, %r10
	movq %r10, %xmm2
	cvtss2sd %xmm2, %xmm2
	movsd %xmm1, (%rsi)
	movq g_vx(%rip), %rsi
	leaq (%rsi,%rdi,8), %rsi
	movsd (%rsi), %xmm1
	vfnmadd132sd %xmm2, %xmm1, %xmm0
	movsd %xmm0, (%rsi)
	cmpl %edx, %eax
	jle .LB9455
.LB9457:
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB9478:
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	jmp .LB9480
	.text
	.globl draw_paddle__4__intE1__intE1__intE1__intE1__ret_voidE1
	.def draw_paddle__4__intE1__intE1__intE1__intE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
draw_paddle__4__intE1__intE1__intE1__intE1__ret_voidE1:
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
.LB9514:
	movabsq $1073741824, %r10
	movq %r10, %xmm1
	movslq %ecx, %rax
	movabsq $2863311531, %rdi
	xorps %xmm0, %xmm0
	cvtsi2ssq %rax, %xmm0
	movslq %edx, %rax
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	divss %xmm15, %xmm0
	movabsq $1073741824, %r10
	movq %r10, %xmm1
	movsd %xmm0, -64(%rbp)
	xorps %xmm0, %xmm0
	cvtsi2ssq %rax, %xmm0
	movl %r8d, %eax
	imull %ecx, %eax
	movl %eax, %esi
	sarl $31, %esi
	shrl $24, %esi
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	divss %xmm15, %xmm0
	addl %esi, %eax
	sarl $8, %eax
	movl %eax, %esi
	leal -14(%r9), %eax
	imull %edx, %eax
	movslq %eax, %rax
	imulq %rax, %rdi
	sarq $39, %rdi
	shrq $63, %rax
	addl %edi, %eax
	addl $14, %r9d
	movl %eax, %edi
	imull %edx, %r9d
	movabsq $2863311531, %rdx
	movsd %xmm0, -72(%rbp)
	movslq %r9d, %rax
	imulq %rax, %rdx
	sarq $39, %rdx
	shrq $63, %rax
	addl %edx, %eax
	addl $2, %r8d
	imull %ecx, %r8d
	movl %r8d, %ecx
	sarl $31, %ecx
	shrl $24, %ecx
	addl %ecx, %r8d
	movl %r8d, %ecx
	sarl $8, %ecx
	subl %esi, %ecx
	subl %edi, %eax
	movslq %ecx, %rcx
	xorps %xmm0, %xmm0
	cvtsi2ssq %rcx, %xmm0
	movl $5, %ecx
	movslq %eax, %rax
	movslq %ecx, %rcx
	xorps %xmm1, %xmm1
	cvtsi2ssq %rcx, %xmm1
	divss %xmm1, %xmm0
	movsd %xmm0, -80(%rbp)
	xorps %xmm0, %xmm0
	cvtsi2ssq %rax, %xmm0
	movl $20, %eax
	movslq %eax, %rax
	xorps %xmm1, %xmm1
	cvtsi2ssq %rax, %xmm1
	divss %xmm1, %xmm0
	movsd %xmm0, -88(%rbp)
	movl GL_TEXTURE_2D(%rip), %ecx
	callq glDisable
	movl GL_DEPTH_TEST(%rip), %ecx
	callq glDisable
	movl GL_BLEND(%rip), %ecx
	callq glEnable
	movl GL_SRC_ALPHA(%rip), %ecx
	movl GL_ONE(%rip), %edx
	callq glBlendFunc
	movl $16, %eax
	movslq %eax, %rax
	xorps %xmm0, %xmm0
	cvtsi2ssq %rax, %xmm0
	cvtss2sd %xmm0, %xmm0
	movabsq $4618760256179416810, %r10
	movq %r10, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	divsd %xmm15, %xmm0
	cvtsd2ss %xmm0, %xmm0
	movsd %xmm0, -96(%rbp)
	xorl %ebx, %ebx
	xorl %eax, %eax
	xorl %ecx, %ecx
	xorl %edx, %edx
	xorps %xmm0, %xmm0
	xorps %xmm1, %xmm1
	xorps %xmm2, %xmm2
	xorps %xmm3, %xmm3
	xorps %xmm4, %xmm4
	xorps %xmm5, %xmm5
	movabsq $0, %r10
	movq %r10, -104(%rbp)
	movabsq $0, %r10
	movq %r10, -112(%rbp)
	movabsq $0, %r10
	movq %r10, -120(%rbp)
.LB9595:
	cmpl $5, %ebx
	jge .LB9597
.LB9596:
	xorl %r12d, %r12d
	movsd %xmm2, -128(%rbp)
	movsd %xmm3, -136(%rbp)
	movsd %xmm4, -144(%rbp)
	movsd -104(%rbp), %xmm2
	movq -112(%rbp), %r10
	movq %r10, -152(%rbp)
	movq -120(%rbp), %r10
	movq %r10, -160(%rbp)
.LB9601:
	cmpl $20, %r12d
	jge .LB9603
.LB9602:
	movsd -80(%rbp), %xmm2
	movabsq $1056964608, %r10
	movq %r10, %xmm1
	movslq %ebx, %rax
	xorps %xmm0, %xmm0
	cvtsi2ssq %rax, %xmm0
	mulss %xmm2, %xmm1
	vfmadd132ss %xmm2, %xmm1, %xmm0
	movsd -88(%rbp), %xmm2
	movabsq $1056964608, %r10
	movq %r10, %xmm1
	cvttss2siq %xmm0, %rax
	mulss %xmm2, %xmm1
	movl %eax, %eax
	leal (%rsi,%rax), %r13d
	movslq %r12d, %rax
	xorps %xmm0, %xmm0
	cvtsi2ssq %rax, %xmm0
	vfmadd132ss %xmm2, %xmm1, %xmm0
	movsd -64(%rbp), %xmm2
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	cvttss2siq %xmm0, %rax
	movl %eax, %eax
	leal (%rdi,%rax), %r14d
	movslq %r13d, %rax
	xorps %xmm0, %xmm0
	cvtsi2ssq %rax, %xmm0
	movslq %r14d, %rax
	vfmsub132ss %xmm2, %xmm1, %xmm0
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	movsd %xmm0, -168(%rbp)
	xorps %xmm0, %xmm0
	cvtsi2ssq %rax, %xmm0
	movsd -72(%rbp), %xmm2
	vfmsub132ss %xmm2, %xmm1, %xmm0
	movsd %xmm0, -176(%rbp)
	movsd -64(%rbp), %xmm1
	movabsq $1084227584, %r10
	movq %r10, %xmm0
	mulss %xmm1, %xmm0
	movsd %xmm0, -184(%rbp)
	movsd -72(%rbp), %xmm1
	movabsq $1084227584, %r10
	movq %r10, %xmm0
	mulss %xmm1, %xmm0
	movsd %xmm0, -192(%rbp)
	movl GL_TRIANGLE_FAN(%rip), %ecx
	callq glBegin
	movabsq $1058642330, %r10
	movq %r10, %xmm0
	movabsq $1062836634, %r10
	movq %r10, %xmm1
	movabsq $1065353216, %r10
	movq %r10, %xmm2
	movabsq $1045220557, %r10
	movq %r10, %xmm3
	callq glColor4f
	movsd -168(%rbp), %xmm0
	movsd -176(%rbp), %xmm1
	callq glVertex2f
	movabsq $1050253722, %r10
	movq %r10, %xmm0
	movabsq $1058642330, %r10
	movq %r10, %xmm1
	movabsq $1065353216, %r10
	movq %r10, %xmm2
	movabsq $1045220557, %r10
	movq %r10, %xmm3
	callq glColor4f
	xorl %r15d, %r15d
	movq -128(%rbp), %r10
	movq %r10, -200(%rbp)
	movq -136(%rbp), %r10
	movq %r10, -208(%rbp)
	movq -144(%rbp), %r10
	movq %r10, -216(%rbp)
	movq -152(%rbp), %r10
	movq %r10, -224(%rbp)
	movq -160(%rbp), %r10
	movq %r10, -232(%rbp)
.LB9646:
	cmpl $16, %r15d
	jg .LB9648
.LB9647:
	movslq %r15d, %rax
	xorps %xmm0, %xmm0
	cvtsi2ssq %rax, %xmm0
	movsd -96(%rbp), %xmm1
	mulss %xmm1, %xmm0
	movsd %xmm0, -240(%rbp)
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, -248(%rbp)
	callq standard__math__cos__1__doubleE1__ret_doubleE1
	cvtsd2ss %xmm0, %xmm0
	movsd -184(%rbp), %xmm1
	movsd -168(%rbp), %xmm2
	vfmadd132ss %xmm1, %xmm2, %xmm0
	movsd %xmm0, -256(%rbp)
	movsd -248(%rbp), %xmm0
	callq standard__math__sin__1__doubleE1__ret_doubleE1
	cvtsd2ss %xmm0, %xmm0
	movsd -192(%rbp), %xmm1
	movsd -176(%rbp), %xmm2
	vfmadd132ss %xmm0, %xmm2, %xmm1
	movsd %xmm1, -264(%rbp)
	movsd -256(%rbp), %xmm0
	callq glVertex2f
	incl %r15d
	movq -256(%rbp), %r10
	movq %r10, -200(%rbp)
	movq -264(%rbp), %r10
	movq %r10, -208(%rbp)
	movq -240(%rbp), %r10
	movq %r10, -216(%rbp)
	movq -240(%rbp), %r10
	movq %r10, -224(%rbp)
	movq -240(%rbp), %r10
	movq %r10, -232(%rbp)
	cmpl $16, %r15d
	jle .LB9647
	jmp .LB9648
.LB9597:
	movl GL_BLEND(%rip), %ecx
	callq glDisable
	movl GL_TEXTURE_2D(%rip), %ecx
	callq glEnable
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB9603:
	incl %ebx
	movsd -136(%rbp), %xmm3
	movsd -144(%rbp), %xmm4
	movsd %xmm2, -104(%rbp)
	movq -152(%rbp), %r10
	movq %r10, -112(%rbp)
	movq -160(%rbp), %r10
	movq %r10, -120(%rbp)
	movsd -128(%rbp), %xmm2
	cmpl $5, %ebx
	jl .LB9596
	jmp .LB9597
.LB9648:
	callq glEnd
	incl %r12d
	movq %r13, %rax
	movq %r14, %rcx
	movq %r15, %rdx
	movsd -184(%rbp), %xmm0
	movsd -192(%rbp), %xmm1
	movq -200(%rbp), %r10
	movq %r10, -128(%rbp)
	movq -208(%rbp), %r10
	movq %r10, -136(%rbp)
	movq -216(%rbp), %r10
	movq %r10, -144(%rbp)
	movsd -168(%rbp), %xmm5
	movsd -176(%rbp), %xmm2
	movq -224(%rbp), %r10
	movq %r10, -152(%rbp)
	movq -232(%rbp), %r10
	movq %r10, -160(%rbp)
	cmpl $20, %r12d
	jl .LB9602
	jmp .LB9603
	.text
	.globl ball_reset__2__intE1__intE1__ret_voidE1
	.def ball_reset__2__intE1__intE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
ball_reset__2__intE1__intE1__ret_voidE1:
.LB9678:
	movabsq $1056964608, %r10
	movq %r10, %xmm1
	movslq %ecx, %rax
	xorps %xmm0, %xmm0
	cvtsi2ssq %rax, %xmm0
	movslq %edx, %rax
	mulss %xmm1, %xmm0
	movabsq $1056964608, %r10
	movq %r10, %xmm1
	movss %xmm0, g_ball_x(%rip)
	xorps %xmm0, %xmm0
	cvtsi2ssq %rax, %xmm0
	mulss %xmm1, %xmm0
	movabsq $1124073472, %r10
	movq %r10, %xmm1
	movss %xmm0, g_ball_y(%rip)
	movl g_rand_seed(%rip), %eax
	movabsq $1067869798, %r10
	movq %r10, %xmm0
	imull $1664525, %eax, %eax
	addl $1013904223, %eax
	movl %eax, g_rand_seed(%rip)
	andl $255, %eax
	movss %xmm0, g_ball_vx(%rip)
	subl $128, %eax
	movslq %eax, %rax
	xorps %xmm0, %xmm0
	cvtsi2ssq %rax, %xmm0
	divss %xmm1, %xmm0
	movabsq $1067869798, %r10
	movq %r10, %xmm1
	mulss %xmm1, %xmm0
	movss %xmm0, g_ball_vy(%rip)
	xorps %xmm0, %xmm0
	movl $96, g_cpu_paddle_gy(%rip)
	movss %xmm0, g_suck_charge(%rip)
	movb $0, g_sucking(%rip)
	ret
	.text
	.globl ball_update__2__intE1__intE1__ret_voidE1
	.def ball_update__2__intE1__intE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
ball_update__2__intE1__intE1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $192, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB9697:
	movss g_ball_x(%rip), %xmm0
	movl $1, %edi
	movslq %ecx, %rax
	movslq %edx, %rsi
	movabsq $1073741824, %r10
	movq %r10, %xmm5
	xorps %xmm1, %xmm1
	cvtsi2ssq %rax, %xmm1
	movl $256, %eax
	movslq %eax, %rax
	xorps %xmm2, %xmm2
	cvtsi2ssq %rax, %xmm2
	movaps %xmm1, %xmm15
	movaps %xmm0, %xmm1
	divss %xmm15, %xmm1
	mulss %xmm2, %xmm1
	xorps %xmm2, %xmm2
	cvtsi2ssq %rsi, %xmm2
	movl $192, %esi
	movslq %esi, %rsi
	xorps %xmm3, %xmm3
	cvtsi2ssq %rsi, %xmm3
	cvttss2siq %xmm1, %rax
	movss g_ball_y(%rip), %xmm1
	movl %eax, %eax
	movaps %xmm2, %xmm15
	movaps %xmm1, %xmm2
	divss %xmm15, %xmm2
	cmpl $1, %eax
	cmovl %edi, %eax
	movl $254, %edi
	cmpl $254, %eax
	cmovg %edi, %eax
	movl $1, %edi
	mulss %xmm3, %xmm2
	cvttss2siq %xmm2, %rsi
	movl %esi, %esi
	cmpl $1, %esi
	cmovl %edi, %esi
	movl $190, %edi
	cmpl $190, %esi
	cmovg %edi, %esi
	movq g_vx(%rip), %rdi
	shll $8, %esi
	leal (%rsi,%rax), %r8d
	movslq %r8d, %r8
	movsd (%rdi,%r8,8), %xmm2
	movq g_vy(%rip), %r9
	cvtsd2ss %xmm2, %xmm2
	movsd (%r9,%r8,8), %xmm3
	movss g_ball_vx(%rip), %xmm4
	cvtsd2ss %xmm3, %xmm3
	vfmadd132ss %xmm5, %xmm4, %xmm2
	movss %xmm2, g_ball_vx(%rip)
	movss g_ball_vy(%rip), %xmm4
	movabsq $1073741824, %r10
	movq %r10, %xmm5
	leal -4(%rax), %r8d
	addl $4, %eax
	movl $1, %r9d
	cmpl $1, %r8d
	cmovl %r9d, %r8d
	movl $254, %r9d
	cmpl $254, %eax
	vfmadd132ss %xmm5, %xmm4, %xmm3
	cmovg %r9d, %eax
	addl %esi, %r8d
	movslq %r8d, %r8
	addl %eax, %esi
	movslq %esi, %rax
	movss %xmm3, g_ball_vy(%rip)
	movsd (%rdi,%r8,8), %xmm4
	movsd (%rdi,%rax,8), %xmm5
	cvtsd2ss %xmm4, %xmm4
	movsd %xmm5, -136(%rbp)
	movaps %xmm3, %xmm5
	mulss %xmm3, %xmm5
	movsd %xmm5, -24(%rbp)
	vfmadd231ss %xmm2, %xmm2, %xmm5
	movsd %xmm5, -32(%rbp)
	movabsq $1069547520, %r10
	movq %r10, %xmm5
	movsd %xmm5, -40(%rbp)
	ucomiss %xmm5, %xmm4
	jbe .LB9830
.LB9818:
	movsd -136(%rbp), %xmm4
	cvtsd2ss %xmm4, %xmm4
	xorps %xmm5, %xmm5
	movaps %xmm4, %xmm15
	movaps %xmm5, %xmm4
	subss %xmm15, %xmm4
	movabsq $1069547520, %r10
	movq %r10, %xmm5
	ucomiss %xmm5, %xmm4
	jbe .LB9830
.LB9823:
	movabsq $1082130432, %r10
	movq %r10, %xmm4
	movsd -32(%rbp), %xmm5
	ucomiss %xmm5, %xmm4
	ja .LB9828
.LB9830:
	movabsq $1065185444, %r10
	movq %r10, %xmm3
	movabsq $1065185444, %r10
	movq %r10, %xmm4
	imull $6, %ecx, %eax
	movabsq $2863311531, %rdi
	mulss %xmm3, %xmm2
	movl %eax, %esi
	sarl $31, %esi
	shrl $24, %esi
	addl %esi, %eax
	sarl $8, %eax
	movss %xmm2, g_ball_vx(%rip)
	movss g_ball_vy(%rip), %xmm3
	addss %xmm2, %xmm0
	movslq %eax, %rax
	mulss %xmm4, %xmm3
	xorps %xmm4, %xmm4
	cvtsi2ssq %rax, %xmm4
	movss %xmm3, g_ball_vy(%rip)
	addss %xmm3, %xmm1
	movss %xmm0, g_ball_x(%rip)
	movss %xmm1, g_ball_y(%rip)
	movl g_paddle_gy(%rip), %eax
	leal -14(%rax), %esi
	imull %edx, %esi
	movslq %esi, %rsi
	imulq %rsi, %rdi
	sarq $39, %rdi
	shrq $63, %rsi
	addl %edi, %esi
	addl $14, %eax
	imull %edx, %eax
	movslq %esi, %rsi
	xorps %xmm5, %xmm5
	cvtsi2ssq %rsi, %xmm5
	movabsq $2863311531, %rsi
	movslq %eax, %rax
	imulq %rax, %rsi
	movsd %xmm5, -144(%rbp)
	sarq $39, %rsi
	shrq $63, %rax
	addl %esi, %eax
	movslq %eax, %rax
	xorps %xmm5, %xmm5
	cvtsi2ssq %rax, %xmm5
	movsd %xmm5, -48(%rbp)
	movabsq $1090519040, %r10
	movq %r10, %xmm5
	movsd %xmm5, -56(%rbp)
	movaps %xmm5, %xmm15
	movaps %xmm0, %xmm5
	subss %xmm15, %xmm5
	movsd %xmm5, -64(%rbp)
	ucomiss %xmm5, %xmm4
	jbe .LB9899
.LB9876:
	movabsq $1090519040, %r10
	movq %r10, %xmm5
	movsd %xmm5, -72(%rbp)
	addss %xmm5, %xmm0
	movabsq $1082130432, %r10
	movq %r10, %xmm5
	movsd %xmm5, -80(%rbp)
	movaps %xmm5, %xmm15
	movaps %xmm4, %xmm5
	subss %xmm15, %xmm5
	movsd %xmm5, -88(%rbp)
	ucomiss %xmm5, %xmm0
	jbe .LB9899
.LB9885:
	movsd -144(%rbp), %xmm0
	ucomiss %xmm0, %xmm1
	jbe .LB9899
.LB9891:
	movsd -48(%rbp), %xmm0
	ucomiss %xmm1, %xmm0
	ja .LB9897
.LB9899:
	imull $250, %ecx, %eax
	movabsq $2863311531, %rdi
	movabsq $1090519040, %r10
	movq %r10, %xmm5
	movl %eax, %esi
	sarl $31, %esi
	shrl $24, %esi
	addl %esi, %eax
	sarl $8, %eax
	movslq %eax, %rax
	xorps %xmm0, %xmm0
	cvtsi2ssq %rax, %xmm0
	movl g_cpu_paddle_gy(%rip), %eax
	leal -14(%rax), %esi
	imull %edx, %esi
	movslq %esi, %rsi
	imulq %rsi, %rdi
	sarq $39, %rdi
	shrq $63, %rsi
	addl %edi, %esi
	addl $14, %eax
	imull %edx, %eax
	movslq %esi, %rsi
	xorps %xmm2, %xmm2
	cvtsi2ssq %rsi, %xmm2
	movabsq $2863311531, %rsi
	movslq %eax, %rax
	imulq %rax, %rsi
	movsd %xmm2, -152(%rbp)
	movss g_ball_x(%rip), %xmm4
	sarq $39, %rsi
	shrq $63, %rax
	addl %esi, %eax
	movsd %xmm5, -96(%rbp)
	movslq %eax, %rax
	xorps %xmm2, %xmm2
	cvtsi2ssq %rax, %xmm2
	addss %xmm4, %xmm5
	movsd %xmm5, -104(%rbp)
	ucomiss %xmm0, %xmm5
	jbe .LB9951
.LB9928:
	movabsq $1090519040, %r10
	movq %r10, %xmm5
	movsd %xmm5, -112(%rbp)
	subss %xmm5, %xmm4
	movabsq $1082130432, %r10
	movq %r10, %xmm5
	movsd %xmm5, -120(%rbp)
	addss %xmm0, %xmm5
	movsd %xmm5, -128(%rbp)
	ucomiss %xmm4, %xmm5
	jbe .LB9951
.LB9937:
	movsd -152(%rbp), %xmm4
	ucomiss %xmm4, %xmm1
	jbe .LB9951
.LB9943:
	ucomiss %xmm1, %xmm2
	ja .LB9949
.LB9951:
	movabsq $1090519040, %r10
	movq %r10, %xmm0
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subss %xmm15, %xmm0
	xorps %xmm1, %xmm1
	ucomiss %xmm0, %xmm1
	ja .LB9962
.LB9964:
	movss g_ball_y(%rip), %xmm0
	movabsq $1090519040, %r10
	movq %r10, %xmm1
	movslq %edx, %rax
	addss %xmm1, %xmm0
	xorps %xmm1, %xmm1
	cvtsi2ssq %rax, %xmm1
	ucomiss %xmm1, %xmm0
	ja .LB9975
.LB9977:
	movss g_ball_x(%rip), %xmm0
	movabsq $1090519040, %r10
	movq %r10, %xmm1
	movaps %xmm1, %xmm15
	movaps %xmm0, %xmm1
	subss %xmm15, %xmm1
	xorps %xmm2, %xmm2
	ucomiss %xmm1, %xmm2
	ja .LB9989
.LB9990:
	movabsq $1090519040, %r10
	movq %r10, %xmm1
	movslq %ecx, %rax
	addss %xmm1, %xmm0
	xorps %xmm1, %xmm1
	cvtsi2ssq %rax, %xmm1
	ucomiss %xmm1, %xmm0
	ja .LB10007
.LB10008:
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB9828:
	movl g_rand_seed(%rip), %eax
	imull $1664525, %eax, %eax
	addl $1013904223, %eax
	movl %eax, g_rand_seed(%rip)
	andl $1, %eax
	je .LB9837
.LB9838:
	movabsq $1085276160, %r10
	movq %r10, %xmm4
	subss %xmm4, %xmm3
	movss %xmm3, g_ball_vy(%rip)
	jmp .LB9830
.LB9837:
	movabsq $1085276160, %r10
	movq %r10, %xmm4
	addss %xmm4, %xmm3
	movss %xmm3, g_ball_vy(%rip)
	jmp .LB9830
.LB9897:
	movabsq $1090519040, %r10
	movq %r10, %xmm0
	addss %xmm4, %xmm0
	movss %xmm0, g_ball_x(%rip)
	xorps %xmm0, %xmm0
	movabsq $1060655596, %r10
	movq %r10, %xmm4
	subss %xmm4, %xmm0
	mulss %xmm2, %xmm0
	movss %xmm0, g_ball_vx(%rip)
	jmp .LB9899
.LB9949:
	movabsq $1090519040, %r10
	movq %r10, %xmm2
	movabsq $1060655596, %r10
	movq %r10, %xmm4
	subss %xmm2, %xmm0
	xorps %xmm2, %xmm2
	subss %xmm4, %xmm2
	movss %xmm0, g_ball_x(%rip)
	movss g_ball_vx(%rip), %xmm0
	mulss %xmm2, %xmm0
	movss %xmm0, g_ball_vx(%rip)
	jmp .LB9951
.LB9962:
	movabsq $1090519040, %r10
	movq %r10, %xmm0
	movss %xmm0, g_ball_y(%rip)
	xorps %xmm0, %xmm0
	movabsq $1060655596, %r10
	movq %r10, %xmm1
	subss %xmm1, %xmm0
	mulss %xmm3, %xmm0
	movss %xmm0, g_ball_vy(%rip)
	jmp .LB9964
.LB9975:
	movabsq $1090519040, %r10
	movq %r10, %xmm0
	movabsq $1060655596, %r10
	movq %r10, %xmm2
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subss %xmm15, %xmm0
	xorps %xmm1, %xmm1
	subss %xmm2, %xmm1
	movss %xmm0, g_ball_y(%rip)
	movss g_ball_vy(%rip), %xmm0
	mulss %xmm1, %xmm0
	movss %xmm0, g_ball_vy(%rip)
	jmp .LB9977
.LB10007:
	movl g_level(%rip), %eax
	incl %eax
	movl %eax, g_level(%rip)
	callq ball_reset__2__intE1__intE1__ret_voidE1
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB9989:
	movl g_lives(%rip), %eax
	decl %eax
	movl %eax, g_lives(%rip)
	cmpl $1, %eax
	jl .LB9996
.LB9998:
	callq ball_reset__2__intE1__intE1__ret_voidE1
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB9996:
	movl $3, g_lives(%rip)
	movl $1, g_level(%rip)
	movl $0, g_game_state(%rip)
	jmp .LB9998
	.text
	.globl draw_ball__2__intE1__intE1__ret_voidE1
	.def draw_ball__2__intE1__intE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
draw_ball__2__intE1__intE1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $128, %rsp
	movq %rsi, -8(%rbp)
.LB10014:
	movabsq $1073741824, %r10
	movq %r10, %xmm1
	movabsq $1073741824, %r10
	movq %r10, %xmm2
	movslq %ecx, %rax
	movabsq $1065353216, %r10
	movq %r10, %xmm3
	xorps %xmm0, %xmm0
	cvtsi2ssq %rax, %xmm0
	movslq %edx, %rax
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	divss %xmm15, %xmm0
	xorps %xmm1, %xmm1
	cvtsi2ssq %rax, %xmm1
	movl $32, %eax
	movslq %eax, %rax
	movaps %xmm1, %xmm15
	movaps %xmm2, %xmm1
	divss %xmm15, %xmm1
	movss g_ball_x(%rip), %xmm2
	vfmsub132ss %xmm0, %xmm3, %xmm2
	movabsq $1065353216, %r10
	movq %r10, %xmm3
	movsd %xmm2, -16(%rbp)
	movss g_ball_y(%rip), %xmm2
	vfmsub132ss %xmm1, %xmm3, %xmm2
	movabsq $1082130432, %r10
	movq %r10, %xmm3
	movsd %xmm2, -24(%rbp)
	movabsq $1090519040, %r10
	movq %r10, %xmm2
	addss %xmm3, %xmm2
	movaps %xmm2, %xmm3
	mulss %xmm0, %xmm3
	mulss %xmm1, %xmm2
	movsd %xmm3, -32(%rbp)
	movsd %xmm2, -40(%rbp)
	movabsq $1090519040, %r10
	movq %r10, %xmm2
	mulss %xmm2, %xmm0
	movsd %xmm0, -48(%rbp)
	movabsq $1090519040, %r10
	movq %r10, %xmm0
	mulss %xmm1, %xmm0
	movabsq $4618760256179416810, %r10
	movq %r10, %xmm1
	movsd %xmm0, -56(%rbp)
	xorps %xmm0, %xmm0
	cvtsi2ssq %rax, %xmm0
	cvtss2sd %xmm0, %xmm0
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	divsd %xmm15, %xmm0
	cvtsd2ss %xmm0, %xmm0
	movsd %xmm0, -64(%rbp)
	movl GL_TEXTURE_2D(%rip), %ecx
	callq glDisable
	movl GL_DEPTH_TEST(%rip), %ecx
	callq glDisable
	movl GL_BLEND(%rip), %ecx
	callq glDisable
	movl GL_TRIANGLE_FAN(%rip), %ecx
	callq glBegin
	movabsq $1065353216, %r10
	movq %r10, %xmm0
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	movabsq $1065353216, %r10
	movq %r10, %xmm2
	callq glColor3f
	movsd -16(%rbp), %xmm0
	movsd -24(%rbp), %xmm1
	callq glVertex2f
	xorl %esi, %esi
.LB10074:
	cmpl $32, %esi
	jg .LB10076
.LB10075:
	movslq %esi, %rax
	xorps %xmm0, %xmm0
	cvtsi2ssq %rax, %xmm0
	movsd -64(%rbp), %xmm1
	mulss %xmm1, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, -88(%rbp)
	callq standard__math__cos__1__doubleE1__ret_doubleE1
	cvtsd2ss %xmm0, %xmm0
	movsd -32(%rbp), %xmm1
	movsd -16(%rbp), %xmm2
	vfmadd132ss %xmm1, %xmm2, %xmm0
	movsd %xmm0, -96(%rbp)
	movsd -88(%rbp), %xmm0
	callq standard__math__sin__1__doubleE1__ret_doubleE1
	cvtsd2ss %xmm0, %xmm0
	movsd -40(%rbp), %xmm1
	movsd -24(%rbp), %xmm2
	vfmadd132ss %xmm0, %xmm2, %xmm1
	movsd -96(%rbp), %xmm0
	callq glVertex2f
	incl %esi
	cmpl $32, %esi
	jle .LB10075
.LB10076:
	callq glEnd
	movl GL_TRIANGLE_FAN(%rip), %ecx
	callq glBegin
	xorps %xmm0, %xmm0
	xorps %xmm1, %xmm1
	xorps %xmm2, %xmm2
	callq glColor3f
	movsd -16(%rbp), %xmm0
	movsd -24(%rbp), %xmm1
	callq glVertex2f
	xorl %esi, %esi
.LB10103:
	cmpl $32, %esi
	jg .LB10105
.LB10104:
	movslq %esi, %rax
	xorps %xmm0, %xmm0
	cvtsi2ssq %rax, %xmm0
	movsd -64(%rbp), %xmm1
	mulss %xmm1, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, -72(%rbp)
	callq standard__math__cos__1__doubleE1__ret_doubleE1
	cvtsd2ss %xmm0, %xmm0
	movsd -48(%rbp), %xmm1
	movsd -16(%rbp), %xmm2
	vfmadd132ss %xmm1, %xmm2, %xmm0
	movsd %xmm0, -80(%rbp)
	movsd -72(%rbp), %xmm0
	callq standard__math__sin__1__doubleE1__ret_doubleE1
	cvtsd2ss %xmm0, %xmm0
	movsd -56(%rbp), %xmm1
	movsd -24(%rbp), %xmm2
	vfmadd132ss %xmm0, %xmm2, %xmm1
	movsd -80(%rbp), %xmm0
	callq glVertex2f
	incl %esi
	cmpl $32, %esi
	jle .LB10104
.LB10105:
	callq glEnd
	movl GL_TEXTURE_2D(%rip), %ecx
	callq glEnable
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl draw_hud__2__intE1__intE1__ret_voidE1
	.def draw_hud__2__intE1__intE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
draw_hud__2__intE1__intE1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $256, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
.LB10203:
	movl %ecx, %esi
	movl %edx, %edi
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -56(%rbp)
	movslq %esi, %rax
	movabsq $1073741824, %r10
	movq %r10, %xmm1
	xorps %xmm0, %xmm0
	cvtsi2ssq %rax, %xmm0
	movslq %edi, %rax
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	divss %xmm15, %xmm0
	movabsq $1073741824, %r10
	movq %r10, %xmm1
	movsd %xmm0, -96(%rbp)
	xorps %xmm0, %xmm0
	cvtsi2ssq %rax, %xmm0
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	divss %xmm15, %xmm0
	movsd %xmm0, -104(%rbp)
	movl GL_TEXTURE_2D(%rip), %ecx
	callq glDisable
	movl GL_DEPTH_TEST(%rip), %ecx
	callq glDisable
	movl GL_BLEND(%rip), %ecx
	callq glEnable
	movl GL_SRC_ALPHA(%rip), %ecx
	movl GL_ONE_MINUS_SRC_ALPHA(%rip), %edx
	callq glBlendFunc
	movl g_level(%rip), %ecx
	leaq -56(%rbp), %rdx
	callq int_to_str__2__intE1__byteE1_ptr1__ret_intE1
	movl $1163281740, -63(%rbp)
	movw $8268, -59(%rbp)
	movb $0, -57(%rbp)
	leaq -63(%rbp), %rcx
	movl $2, %edx
	callq text_width__2__byteE1_ptr1__intE1__ret_intE1
	movl %eax, %ebx
	leaq -56(%rbp), %rcx
	movl $2, %edx
	callq text_width__2__byteE1_ptr1__intE1__ret_intE1
	movabsq $1058642330, %r10
	movq %r10, %xmm0
	movabsq $1061997773, %r10
	movq %r10, %xmm1
	movabsq $1065353216, %r10
	movq %r10, %xmm2
	addl %eax, %ebx
	movl %esi, %eax
	sarl $31, %eax
	movl %esi, %eax
	shrl $31, %eax
	movabsq $1063675494, %r10
	movq %r10, %xmm3
	addl %eax, %esi
	movl %esi, %eax
	sarl $1, %eax
	movl %ebx, %ecx
	sarl $31, %ecx
	movl %ebx, %ecx
	shrl $31, %ecx
	addl %ecx, %ebx
	movl %ebx, %ecx
	sarl $1, %ecx
	movl %eax, %esi
	subl %ecx, %esi
	leal -28(%rdi), %ebx
	callq glColor4f
	movl $1163281740, -70(%rbp)
	movw $8268, -66(%rbp)
	movb $0, -64(%rbp)
	movsd -96(%rbp), %xmm0
	leaq -70(%rbp), %rcx
	movq %rsi, %rdx
	movq %rbx, %r8
	movl $2, %r9d
	movss %xmm0, 32(%rsp)
	movsd -104(%rbp), %xmm0
	movss %xmm0, 40(%rsp)
	callq draw_text__6__byteE1_ptr1__intE1__intE1__intE1__floatE1__floatE1__ret_voidE1
	movl $1163281740, -77(%rbp)
	movw $8268, -73(%rbp)
	movb $0, -71(%rbp)
	leaq -77(%rbp), %rcx
	movl $2, %edx
	callq text_width__2__byteE1_ptr1__intE1__ret_intE1
	movabsq $1065353216, %r10
	movq %r10, %xmm0
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	movabsq $1065353216, %r10
	movq %r10, %xmm2
	movabsq $1065353216, %r10
	movq %r10, %xmm3
	addl %eax, %esi
	callq glColor4f
	movsd -96(%rbp), %xmm0
	leaq -56(%rbp), %rcx
	movq %rsi, %rdx
	movq %rbx, %r8
	movl $2, %r9d
	movss %xmm0, 32(%rsp)
	movsd -104(%rbp), %xmm0
	movss %xmm0, 40(%rsp)
	callq draw_text__6__byteE1_ptr1__intE1__intE1__intE1__floatE1__floatE1__ret_voidE1
	movabsq $1065353216, %r10
	movq %r10, %xmm0
	movabsq $1049582633, %r10
	movq %r10, %xmm1
	movabsq $1049582633, %r10
	movq %r10, %xmm2
	movabsq $1064514355, %r10
	movq %r10, %xmm3
	callq glColor4f
	leal -22(%rdi), %esi
	leal -7(%rsi), %ebx
	leal 7(%rsi), %r12d
	xorl %r13d, %r13d
.LB10293:
	movl g_lives(%rip), %eax
	cmpl %eax, %r13d
	jge .LB10295
.LB10294:
	imull $20, %r13d, %eax
	movsd -96(%rbp), %xmm2
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	addl $20, %eax
	movslq %eax, %rcx
	xorps %xmm0, %xmm0
	cvtsi2ssq %rcx, %xmm0
	movslq %esi, %rcx
	vfmsub132ss %xmm2, %xmm1, %xmm0
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	movsd %xmm0, -160(%rbp)
	xorps %xmm0, %xmm0
	cvtsi2ssq %rcx, %xmm0
	movsd -104(%rbp), %xmm2
	leal -7(%rax), %ecx
	movslq %ecx, %rcx
	addl $7, %eax
	movslq %eax, %rax
	vfmsub132ss %xmm2, %xmm1, %xmm0
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	movsd %xmm0, -168(%rbp)
	xorps %xmm0, %xmm0
	cvtsi2ssq %rcx, %xmm0
	movsd -96(%rbp), %xmm2
	vfmsub132ss %xmm2, %xmm1, %xmm0
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	movsd %xmm0, -176(%rbp)
	xorps %xmm0, %xmm0
	cvtsi2ssq %rax, %xmm0
	movslq %ebx, %rax
	vfmsub132ss %xmm2, %xmm1, %xmm0
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	movsd %xmm0, -184(%rbp)
	xorps %xmm0, %xmm0
	cvtsi2ssq %rax, %xmm0
	movsd -104(%rbp), %xmm2
	movslq %r12d, %rax
	vfmsub132ss %xmm2, %xmm1, %xmm0
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	movsd %xmm0, -192(%rbp)
	xorps %xmm0, %xmm0
	cvtsi2ssq %rax, %xmm0
	vfmsub132ss %xmm2, %xmm1, %xmm0
	movsd %xmm0, -200(%rbp)
	movl GL_QUADS(%rip), %ecx
	callq glBegin
	movsd -160(%rbp), %xmm0
	movsd -200(%rbp), %xmm1
	callq glVertex2f
	movsd -184(%rbp), %xmm0
	movsd -168(%rbp), %xmm1
	callq glVertex2f
	movsd -160(%rbp), %xmm0
	movsd -192(%rbp), %xmm1
	callq glVertex2f
	movsd -176(%rbp), %xmm0
	movsd -168(%rbp), %xmm1
	callq glVertex2f
	callq glEnd
	incl %r13d
	jmp .LB10293
.LB10295:
	movabsq $1056964608, %r10
	movq %r10, %xmm0
	movabsq $1041865114, %r10
	movq %r10, %xmm1
	movabsq $1041865114, %r10
	movq %r10, %xmm2
	movabsq $1058642330, %r10
	movq %r10, %xmm3
	callq glColor4f
	leal -22(%rdi), %esi
	leal -7(%rsi), %ebx
	leal 7(%rsi), %r12d
.LB10356:
	cmpl $3, %r13d
	jge .LB10358
.LB10357:
	imull $20, %r13d, %eax
	movsd -96(%rbp), %xmm2
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	addl $20, %eax
	movslq %eax, %rcx
	xorps %xmm0, %xmm0
	cvtsi2ssq %rcx, %xmm0
	movslq %esi, %rcx
	vfmsub132ss %xmm2, %xmm1, %xmm0
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	movsd %xmm0, -112(%rbp)
	xorps %xmm0, %xmm0
	cvtsi2ssq %rcx, %xmm0
	movsd -104(%rbp), %xmm2
	leal -7(%rax), %ecx
	movslq %ecx, %rcx
	addl $7, %eax
	movslq %eax, %rax
	vfmsub132ss %xmm2, %xmm1, %xmm0
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	movsd %xmm0, -120(%rbp)
	xorps %xmm0, %xmm0
	cvtsi2ssq %rcx, %xmm0
	movsd -96(%rbp), %xmm2
	vfmsub132ss %xmm2, %xmm1, %xmm0
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	movsd %xmm0, -128(%rbp)
	xorps %xmm0, %xmm0
	cvtsi2ssq %rax, %xmm0
	movslq %ebx, %rax
	vfmsub132ss %xmm2, %xmm1, %xmm0
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	movsd %xmm0, -136(%rbp)
	xorps %xmm0, %xmm0
	cvtsi2ssq %rax, %xmm0
	movsd -104(%rbp), %xmm2
	movslq %r12d, %rax
	vfmsub132ss %xmm2, %xmm1, %xmm0
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	movsd %xmm0, -144(%rbp)
	xorps %xmm0, %xmm0
	cvtsi2ssq %rax, %xmm0
	vfmsub132ss %xmm2, %xmm1, %xmm0
	movsd %xmm0, -152(%rbp)
	movabsq $1065353216, %r10
	movq %r10, %xmm0
	callq glLineWidth
	movl GL_LINE_LOOP(%rip), %ecx
	callq glBegin
	movsd -112(%rbp), %xmm0
	movsd -152(%rbp), %xmm1
	callq glVertex2f
	movsd -136(%rbp), %xmm0
	movsd -120(%rbp), %xmm1
	callq glVertex2f
	movsd -112(%rbp), %xmm0
	movsd -144(%rbp), %xmm1
	callq glVertex2f
	movsd -128(%rbp), %xmm0
	movsd -120(%rbp), %xmm1
	callq glVertex2f
	callq glEnd
	incl %r13d
	cmpl $3, %r13d
	jl .LB10357
.LB10358:
	movabsq $1058642330, %r10
	movq %r10, %xmm0
	movabsq $1061997773, %r10
	movq %r10, %xmm1
	movabsq $1065353216, %r10
	movq %r10, %xmm2
	movabsq $1060320051, %r10
	movq %r10, %xmm3
	callq glColor4f
	movl $1163282764, -83(%rbp)
	movw $83, -79(%rbp)
	movsd -96(%rbp), %xmm0
	leaq -83(%rbp), %rcx
	leal -44(%rdi), %r8d
	movl $8, %edx
	movl $2, %r9d
	movss %xmm0, 32(%rsp)
	movsd -104(%rbp), %xmm0
	movss %xmm0, 40(%rsp)
	callq draw_text__6__byteE1_ptr1__intE1__intE1__intE1__floatE1__floatE1__ret_voidE1
	movl GL_BLEND(%rip), %ecx
	callq glDisable
	movl GL_TEXTURE_2D(%rip), %ecx
	callq glEnable
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
	.text
	.globl vorticity_confinement__2__doubleE1_ptr1__doubleE1_ptr1__ret_voidE1
	.def vorticity_confinement__2__doubleE1_ptr1__doubleE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
vorticity_confinement__2__doubleE1_ptr1__doubleE1_ptr1__ret_voidE1:
	subq $224, %rsp
	movq %rbx, 208(%rsp)
	movq %rsi, 200(%rsp)
	movq %rdi, 192(%rsp)
.LB8721:
	movl $1, %eax
	xorps %xmm0, %xmm0
.LB8733:
	cmpl $191, %eax
	jge .LB8736
.LB8734:
	movl %eax, %esi
	shll $8, %esi
	movl $1, %edi
.LB8742:
	cmpl $255, %edi
	jge .LB8745
.LB8743:
	leal (%rsi,%rdi), %r8d
	leal 1(%r8), %r9d
	movslq %r9d, %r9
	movsd (%rdx,%r9,8), %xmm0
	leal -1(%r8), %r9d
	movslq %r9d, %r9
	movsd (%rdx,%r9,8), %xmm1
	leal 256(%r8), %r9d
	subl $256, %r8d
	movslq %r9d, %r9
	movslq %r8d, %r8
	subsd %xmm1, %xmm0
	movsd (%rcx,%r9,8), %xmm1
	subsd %xmm1, %xmm0
	movsd (%rcx,%r8,8), %xmm1
	addsd %xmm1, %xmm0
	movabsq $1056964608, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	mulsd %xmm1, %xmm0
	xorps %xmm1, %xmm1
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm0, %xmm1
	ja .LB8785
.LB8786:
	movaps %xmm0, %xmm1
.LB8787:
	movq g_dens_prev(%rip), %r8
	leal (%rsi,%rdi), %r9d
	movslq %r9d, %r9
	movsd %xmm1, (%r8,%r9,8)
	movq g_vx_prev(%rip), %r8
	movsd %xmm0, (%r8,%r9,8)
	incl %edi
	cmpl $255, %edi
	jl .LB8743
	jmp .LB8745
.LB8736:
	movl $1, %eax
	xorps %xmm1, %xmm1
	xorps %xmm2, %xmm2
	xorps %xmm3, %xmm3
	xorps %xmm4, %xmm4
	xorps %xmm5, %xmm5
	movabsq $0, %r10
	movq %r10, 184(%rsp)
	movabsq $0, %r10
	movq %r10, 176(%rsp)
.LB8808:
	cmpl $191, %eax
	jge .LB8811
.LB8809:
	movl %eax, %esi
	shll $8, %esi
	movl $1, %edi
	movq 184(%rsp), %r10
	movq %r10, 168(%rsp)
	movq 176(%rsp), %r10
	movq %r10, 160(%rsp)
.LB8817:
	cmpl $255, %edi
	jge .LB8820
.LB8818:
	movq g_dens_prev(%rip), %r8
	leal (%rsi,%rdi), %r9d
	leal 1(%r9), %ebx
	movslq %ebx, %rbx
	movsd (%r8,%rbx,8), %xmm0
	leal -1(%r9), %ebx
	movslq %ebx, %rbx
	movsd (%r8,%rbx,8), %xmm1
	leal 256(%r9), %ebx
	movslq %ebx, %rbx
	subsd %xmm1, %xmm0
	movabsq $1056964608, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	movaps %xmm0, %xmm2
	mulsd %xmm1, %xmm2
	movsd (%r8,%rbx,8), %xmm0
	leal -256(%r9), %ebx
	movslq %ebx, %rbx
	movsd (%r8,%rbx,8), %xmm1
	subsd %xmm1, %xmm0
	movabsq $1056964608, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	movaps %xmm0, %xmm3
	mulsd %xmm1, %xmm3
	movaps %xmm3, %xmm0
	mulsd %xmm3, %xmm0
	movaps %xmm0, %xmm4
	vfmadd231sd %xmm2, %xmm2, %xmm4
	movaps %xmm4, %xmm1
	sqrtsd %xmm1, %xmm0
	movabsq $953267991, %r10
	movq %r10, %xmm1
	movslq %r9d, %r9
	movsd %xmm0, 8(%rsp)
	cvtss2sd %xmm1, %xmm1
	addsd %xmm1, %xmm0
	movaps %xmm2, %xmm1
	divsd %xmm0, %xmm1
	movsd %xmm1, (%rsp)
	movaps %xmm3, %xmm1
	divsd %xmm0, %xmm1
	movabsq $1061997773, %r10
	movq %r10, %xmm3
	movsd %xmm1, -8(%rsp)
	movq g_vx_prev(%rip), %r8
	movsd (%r8,%r9,8), %xmm2
	leaq (%rcx,%r9,8), %r8
	mulsd %xmm2, %xmm1
	movsd %xmm1, 152(%rsp)
	xorps %xmm1, %xmm1
	movsd %xmm1, 144(%rsp)
	subss %xmm3, %xmm1
	movsd %xmm3, 136(%rsp)
	movsd %xmm1, 128(%rsp)
	cvtss2sd %xmm1, %xmm1
	movsd %xmm1, 120(%rsp)
	movsd 152(%rsp), %xmm3
	mulsd %xmm3, %xmm1
	movabsq $1061997773, %r10
	movq %r10, %xmm3
	movsd %xmm1, 112(%rsp)
	movsd (%rsp), %xmm1
	mulsd %xmm2, %xmm1
	movsd %xmm1, 104(%rsp)
	movsd %xmm3, 96(%rsp)
	cvtss2sd %xmm3, %xmm3
	movsd %xmm3, 88(%rsp)
	mulsd %xmm3, %xmm1
	movabsq $1036831949, %r10
	movq %r10, %xmm3
	movsd %xmm1, 80(%rsp)
	movsd (%r8), %xmm1
	movsd %xmm1, 72(%rsp)
	movsd %xmm3, 64(%rsp)
	cvtss2sd %xmm3, %xmm3
	movsd %xmm3, 56(%rsp)
	movsd 112(%rsp), %xmm5
	vfmadd231sd %xmm3, %xmm5, %xmm1
	movsd %xmm1, 48(%rsp)
	movsd %xmm1, (%r8)
	leaq (%rdx,%r9,8), %r8
	movsd (%r8), %xmm1
	movsd %xmm1, 40(%rsp)
	movabsq $1036831949, %r10
	movq %r10, %xmm3
	movsd %xmm3, 32(%rsp)
	cvtss2sd %xmm3, %xmm3
	movsd %xmm3, 24(%rsp)
	movsd 80(%rsp), %xmm5
	vfmadd231sd %xmm3, %xmm5, %xmm1
	movsd %xmm1, 16(%rsp)
	movsd %xmm1, (%r8)
	incl %edi
	movsd 0(%rsp), %xmm1
	movaps %xmm0, %xmm3
	movsd 80(%rsp), %xmm5
	movsd %xmm4, 168(%rsp)
	movq 8(%rsp), %r10
	movq %r10, 160(%rsp)
	movaps %xmm2, %xmm0
	movsd -8(%rsp), %xmm2
	movsd 112(%rsp), %xmm4
	cmpl $255, %edi
	jl .LB8818
	jmp .LB8820
.LB8811:
	movq 208(%rsp), %rbx
	movq 200(%rsp), %rsi
	movq 192(%rsp), %rdi
	addq $224, %rsp
	ret
.LB8820:
	incl %eax
	movq 168(%rsp), %r10
	movq %r10, 184(%rsp)
	movq 160(%rsp), %r10
	movq %r10, 176(%rsp)
	cmpl $191, %eax
	jl .LB8809
	jmp .LB8811
.LB8745:
	incl %eax
	cmpl $191, %eax
	jl .LB8734
	jmp .LB8736
.LB8785:
	xorps %xmm1, %xmm1
	cvtss2sd %xmm1, %xmm1
	subsd %xmm0, %xmm1
	jmp .LB8787
	.text
	.globl FluidWindowProc__4__dataE1_ubits64__dataE1_ubits32__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64
	.def FluidWindowProc__4__dataE1_ubits64__dataE1_ubits32__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64;
	.scl 2;
	.type 32;
	.endef
FluidWindowProc__4__dataE1_ubits64__dataE1_ubits32__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64:
	pushq %rbp
	movq %rsp, %rbp
	subq $144, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB6484:
	movl standard__system__windows__WM_CLOSE(%rip), %eax
	movq %rcx, %rsi
	cmpl %eax, %edx
	je .LB6496
.LB6497:
	movl standard__system__windows__WM_DESTROY(%rip), %eax
	cmpl %eax, %edx
	je .LB6505
.LB6506:
	movl standard__system__windows__WM_ERASEBKGND(%rip), %eax
	cmpl %eax, %edx
	je .LB6512
.LB6513:
	movl standard__system__windows__WM_PAINT(%rip), %eax
	cmpl %eax, %edx
	je .LB6519
.LB6520:
	movl standard__system__windows__WM_LBUTTONDOWN(%rip), %eax
	cmpl %eax, %edx
	je .LB6531
.LB6532:
	movl standard__system__windows__WM_LBUTTONUP(%rip), %eax
	cmpl %eax, %edx
	je .LB6609
.LB6610:
	movl standard__system__windows__WM_RBUTTONDOWN(%rip), %eax
	cmpl %eax, %edx
	je .LB6616
.LB6617:
	movl standard__system__windows__WM_RBUTTONUP(%rip), %eax
	cmpl %eax, %edx
	je .LB6628
.LB6629:
	movl standard__system__windows__WM_MOUSEMOVE(%rip), %eax
	cmpl %eax, %edx
	je .LB6635
.LB6636:
	movl standard__system__windows__WM_KEYDOWN(%rip), %eax
	cmpl %eax, %edx
	je .LB6656
.LB6657:
	movq %rsi, %rcx
	callq DefWindowProcA
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB6656:
	cmpq $27, %r8
	je .LB6662
.LB6663:
	cmpq $49, %r8
	je .LB6675
.LB6676:
	cmpq $50, %r8
	je .LB6682
.LB6683:
	cmpq $51, %r8
	je .LB6689
.LB6690:
	cmpq $52, %r8
	je .LB6696
.LB6697:
	cmpq $53, %r8
	je .LB6703
.LB6704:
	cmpq $54, %r8
	je .LB6710
.LB6711:
	cmpq $55, %r8
	je .LB6717
.LB6718:
	cmpq $56, %r8
	je .LB6724
.LB6725:
	cmpq $57, %r8
	je .LB6731
.LB6732:
	cmpq $48, %r8
	je .LB6738
.LB6739:
	xorl %eax, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB6738:
	movl $9, g_palette(%rip)
	xorl %eax, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB6731:
	movl $8, g_palette(%rip)
	xorl %eax, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB6724:
	movl $7, g_palette(%rip)
	xorl %eax, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB6717:
	movl $6, g_palette(%rip)
	xorl %eax, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB6710:
	movl $5, g_palette(%rip)
	xorl %eax, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB6703:
	movl $4, g_palette(%rip)
	xorl %eax, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB6696:
	movl $3, g_palette(%rip)
	xorl %eax, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB6689:
	movl $2, g_palette(%rip)
	xorl %eax, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB6682:
	movl $1, g_palette(%rip)
	xorl %eax, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB6675:
	movl $0, g_palette(%rip)
	xorl %eax, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB6662:
	movl g_game_state(%rip), %eax
	cmpl $2, %eax
	jne .LB6667
.LB6668:
	xorl %eax, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB6667:
	xorps %xmm0, %xmm0
	movl %eax, g_prev_state(%rip)
	movl $2, g_game_state(%rip)
	movb $0, g_jetting(%rip)
	movb $0, g_sucking(%rip)
	xorl %eax, %eax
	movss %xmm0, g_suck_charge(%rip)
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB6635:
	movl mouse_x(%rip), %edx
	movq %r9, %rax
	andq $65535, %rax
	shrq $16, %r9
	movq %r9, %rcx
	andq $65535, %rcx
	movl %edx, mouse_px(%rip)
	movl mouse_y(%rip), %edx
	movl %edx, mouse_py(%rip)
	movl %eax, mouse_x(%rip)
	movl %ecx, mouse_y(%rip)
	xorl %eax, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB6628:
	movb $0, g_sucking(%rip)
	xorl %eax, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB6616:
	cmpl $1, g_game_state(%rip)
	je .LB6621
.LB6622:
	xorl %eax, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB6621:
	movb $1, g_sucking(%rip)
	movb $0, g_jetting(%rip)
	xorps %xmm0, %xmm0
	movss %xmm0, g_suck_charge(%rip)
	xorl %eax, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB6609:
	movb $0, mouse_down(%rip)
	movb $0, g_jetting(%rip)
	xorl %eax, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB6531:
	movq %r9, %rax
	andq $65535, %rax
	shrq $16, %r9
	movl %eax, %esi
	movq %r9, %rax
	andq $65535, %rax
	movl %eax, %edi
	cmpl $0, g_game_state(%rip)
	je .LB6546
.LB6547:
	cmpl $2, g_game_state(%rip)
	je .LB6563
.LB6564:
	movb $1, mouse_down(%rip)
	cmpl $1, g_game_state(%rip)
	je .LB6598
.LB6600:
	movl %esi, mouse_px(%rip)
	movl %edi, mouse_py(%rip)
	movl %esi, mouse_x(%rip)
	movl %edi, mouse_y(%rip)
	xorl %eax, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB6598:
	movb $1, g_jetting(%rip)
	jmp .LB6600
.LB6563:
	movl cur_w(%rip), %eax
	movl %eax, %ecx
	sarl $31, %ecx
	movl %eax, %ecx
	shrl $31, %ecx
	addl %ecx, %eax
	sarl $1, %eax
	leal -80(%rax), %r8d
	movl cur_h(%rip), %eax
	movl %eax, %ecx
	sarl $31, %ecx
	movl %eax, %ecx
	shrl $31, %ecx
	addl %ecx, %eax
	sarl $1, %eax
	leal 50(%rax), %r9d
	movq $55, 32(%rsp)
	movq $26, 40(%rsp)
	movq %rsi, %rcx
	movq %rdi, %rdx
	callq btn_hit_test_ex__6__intE1__intE1__intE1__intE1__intE1__intE1__ret_boolE1
	testb %al, %al
	jne .LB6577
.LB6579:
	movl cur_w(%rip), %eax
	movl %eax, %ecx
	sarl $31, %ecx
	movl %eax, %ecx
	shrl $31, %ecx
	addl %ecx, %eax
	sarl $1, %eax
	leal 80(%rax), %r8d
	movl cur_h(%rip), %eax
	movl %eax, %ecx
	sarl $31, %ecx
	movl %eax, %ecx
	shrl $31, %ecx
	addl %ecx, %eax
	sarl $1, %eax
	leal 50(%rax), %r9d
	movq $55, 32(%rsp)
	movq $26, 40(%rsp)
	movq %rsi, %rcx
	movq %rdi, %rdx
	callq btn_hit_test_ex__6__intE1__intE1__intE1__intE1__intE1__intE1__ret_boolE1
	testb %al, %al
	jne .LB6591
.LB6592:
	xorl %eax, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB6577:
	xorl %ecx, %ecx
	callq PostQuitMessage
	jmp .LB6579
.LB6591:
	movl g_prev_state(%rip), %eax
	movl %eax, g_game_state(%rip)
	xorl %eax, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB6546:
	movl cur_w(%rip), %eax
	movl %eax, %ecx
	sarl $31, %ecx
	movl %eax, %ecx
	shrl $31, %ecx
	addl %ecx, %eax
	sarl $1, %eax
	movl %eax, %r8d
	movl cur_h(%rip), %eax
	movl %eax, %ecx
	sarl $31, %ecx
	movl %eax, %ecx
	shrl $31, %ecx
	addl %ecx, %eax
	sarl $1, %eax
	movl %eax, %r9d
	movq %rsi, %rcx
	movq %rdi, %rdx
	callq btn_hit_test__4__intE1__intE1__intE1__intE1__ret_boolE1
	testb %al, %al
	jne .LB6556
.LB6557:
	xorl %eax, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB6556:
	movl $3, g_lives(%rip)
	movl $1, g_level(%rip)
	xorps %xmm0, %xmm0
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	subss %xmm1, %xmm0
	movss %xmm0, g_ball_x(%rip)
	movl $1, g_game_state(%rip)
	xorl %eax, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB6519:
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -88(%rbp)
	vmovdqu .LZERO+32(%rip), %ymm15
	vmovdqu %ymm15, -56(%rbp)
	movq .LZERO+64(%rip), %r10
	movq %r10, -24(%rbp)
	vzeroupper
	leaq -88(%rbp), %rdx
	movq %rsi, %rcx
	callq BeginPaint
	leaq -88(%rbp), %rdx
	movq %rsi, %rcx
	callq EndPaint
	xorl %eax, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB6512:
	movl $1, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB6505:
	xorl %ecx, %ecx
	callq PostQuitMessage
	xorl %eax, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB6496:
	movq %rsi, %rcx
	callq DestroyWindow
	xorl %eax, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
	.text
	.globl IX__2__intE1__intE1__ret_intE1
	.def IX__2__intE1__intE1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
IX__2__intE1__intE1__ret_intE1:
.LB6748:
	shll $8, %edx
	leal (%rdx,%rcx), %eax
	ret
	.text
	.globl set_bnd__2__intE1__doubleE1_ptr1__ret_voidE1
	.def set_bnd__2__intE1__doubleE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
set_bnd__2__intE1__doubleE1_ptr1__ret_voidE1:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
	movq %rdi, -8(%rsp)
.LB6755:
	xorl %eax, %eax
	cmpl $1, %ecx
	sete %al
	movl $1, %esi
.LB6759:
	cmpl $191, %esi
	jge .LB6762
.LB6760:
	testb %al, %al
	jne .LB6768
.LB6769:
	movl %esi, %edi
	shll $8, %edi
	leal 1(%rdi), %r8d
	movslq %r8d, %r8
	movsd (%rdx,%r8,8), %xmm0
	movslq %edi, %r8
	addl $256, %edi
	movsd %xmm0, (%rdx,%r8,8)
	leal -2(%rdi), %r8d
	decl %edi
	movslq %r8d, %r8
	movslq %edi, %rdi
	movsd (%rdx,%r8,8), %xmm0
	movsd %xmm0, (%rdx,%rdi,8)
.LB6770:
	incl %esi
	cmpl $191, %esi
	jl .LB6760
.LB6762:
	xorl %eax, %eax
	cmpl $2, %ecx
	sete %al
	movl $1, %ecx
.LB6823:
	cmpl $255, %ecx
	jge .LB6826
.LB6824:
	testb %al, %al
	jne .LB6832
.LB6833:
	leal 256(%rcx), %esi
	movslq %esi, %rsi
	movsd (%rdx,%rsi,8), %xmm0
	movslq %ecx, %rsi
	movsd %xmm0, (%rdx,%rsi,8)
	leal 48640(%rcx), %esi
	movslq %esi, %rsi
	movsd (%rdx,%rsi,8), %xmm0
	leal 48896(%rcx), %esi
	movslq %esi, %rsi
	movsd %xmm0, (%rdx,%rsi,8)
.LB6834:
	incl %ecx
	cmpl $255, %ecx
	jl .LB6824
.LB6826:
	movsd 8(%rdx), %xmm0
	movsd 2048(%rdx), %xmm1
	addsd %xmm1, %xmm0
	movabsq $1056964608, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	mulsd %xmm1, %xmm0
	movsd %xmm0, (%rdx)
	movsd 2032(%rdx), %xmm0
	movsd 4088(%rdx), %xmm1
	addsd %xmm1, %xmm0
	movabsq $1056964608, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	mulsd %xmm1, %xmm0
	movsd %xmm0, 2040(%rdx)
	movsd 391176(%rdx), %xmm0
	movsd 389120(%rdx), %xmm1
	addsd %xmm1, %xmm0
	movabsq $1056964608, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	mulsd %xmm1, %xmm0
	movsd %xmm0, 391168(%rdx)
	movsd 393200(%rdx), %xmm0
	movsd 391160(%rdx), %xmm1
	addsd %xmm1, %xmm0
	movabsq $1056964608, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	mulsd %xmm1, %xmm0
	movsd %xmm0, 393208(%rdx)
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB6832:
	xorps %xmm1, %xmm1
	leal 256(%rcx), %esi
	movslq %esi, %rsi
	movsd (%rdx,%rsi,8), %xmm0
	movslq %ecx, %rsi
	cvtss2sd %xmm1, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subsd %xmm15, %xmm0
	xorps %xmm1, %xmm1
	cvtss2sd %xmm1, %xmm1
	movsd %xmm0, (%rdx,%rsi,8)
	leal 48640(%rcx), %esi
	movslq %esi, %rsi
	movsd (%rdx,%rsi,8), %xmm0
	leal 48896(%rcx), %esi
	movslq %esi, %rsi
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subsd %xmm15, %xmm0
	movsd %xmm0, (%rdx,%rsi,8)
	jmp .LB6834
.LB6768:
	movl %esi, %edi
	shll $8, %edi
	xorps %xmm1, %xmm1
	leal 1(%rdi), %r8d
	movslq %r8d, %r8
	movsd (%rdx,%r8,8), %xmm0
	cvtss2sd %xmm1, %xmm1
	movslq %edi, %r8
	addl $256, %edi
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subsd %xmm15, %xmm0
	xorps %xmm1, %xmm1
	cvtss2sd %xmm1, %xmm1
	movsd %xmm0, (%rdx,%r8,8)
	leal -2(%rdi), %r8d
	decl %edi
	movslq %r8d, %r8
	movslq %edi, %rdi
	movsd (%rdx,%r8,8), %xmm0
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subsd %xmm15, %xmm0
	movsd %xmm0, (%rdx,%rdi,8)
	jmp .LB6770
	.text
	.globl linsolve_band__7__intE1__intE1__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__doubleE1__ret_voidE1
	.def linsolve_band__7__intE1__intE1__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__doubleE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
linsolve_band__7__intE1__intE1__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__doubleE1__ret_voidE1:
	subq $32, %rsp
	movq %rbx, 16(%rsp)
	movq %rsi, 8(%rsp)
	movq %rdi, 0(%rsp)
	movq %r12, -8(%rsp)
.LB6950:
	movq 72(%rsp), %rax
	movsd 80(%rsp), %xmm0
	movsd 88(%rsp), %xmm1
	movl $1, %esi
	cmpl $1, %ecx
	cmovl %esi, %ecx
	movl $191, %esi
	cmpl $191, %edx
	cmovg %esi, %edx
.LB6978:
	cmpl %edx, %ecx
	jge .LB6981
.LB6979:
	movl %ecx, %esi
	shll $8, %esi
	leal (%rcx,%r8), %edi
	incl %edi
	andl $1, %edi
	incl %edi
.LB6995:
	cmpl $255, %edi
	jge .LB6997
.LB6996:
	leal (%rsi,%rdi), %ebx
	movslq %ebx, %r12
	movsd (%rax,%r12,8), %xmm2
	leal -1(%rbx), %r12d
	movslq %r12d, %r12
	movsd (%r9,%r12,8), %xmm3
	leal 1(%rbx), %r12d
	movslq %r12d, %r12
	movsd (%r9,%r12,8), %xmm4
	leal -256(%rbx), %r12d
	movslq %r12d, %r12
	addsd %xmm4, %xmm3
	movsd (%r9,%r12,8), %xmm4
	leal 256(%rbx), %r12d
	movslq %ebx, %rbx
	movslq %r12d, %r12
	addl $2, %edi
	addsd %xmm4, %xmm3
	movsd (%r9,%r12,8), %xmm4
	addsd %xmm4, %xmm3
	vfmadd231sd %xmm0, %xmm3, %xmm2
	mulsd %xmm1, %xmm2
	movsd %xmm2, (%r9,%rbx,8)
	cmpl $255, %edi
	jl .LB6996
	jmp .LB6997
.LB6981:
	movq 16(%rsp), %rbx
	movq 8(%rsp), %rsi
	movq 0(%rsp), %rdi
	movq -8(%rsp), %r12
	addq $32, %rsp
	ret
.LB6997:
	incl %ecx
	cmpl %edx, %ecx
	jl .LB6979
	jmp .LB6981
	.text
	.globl advect_band__6__intE1__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__ret_voidE1
	.def advect_band__6__intE1__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
advect_band__6__intE1__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__ret_voidE1:
	subq $320, %rsp
	movq %rbx, 304(%rsp)
	movq %rsi, 296(%rsp)
	movq %rdi, 288(%rsp)
	movq %r12, 280(%rsp)
	movq %r13, 272(%rsp)
	movq %r14, 264(%rsp)
	movq %r15, 256(%rsp)
.LB7052:
	movabsq $1036831949, %r10
	movq %r10, %xmm1
	movabsq $1036831949, %r10
	movq %r10, %xmm2
	movq %r8, 112(%rsp)
	movq 360(%rsp), %rax
	cmpl $1, %ecx
	cvtss2sd %xmm1, %xmm1
	cvtss2sd %xmm2, %xmm2
	movq %rax, (%rsp)
	movq 368(%rsp), %rax
	movq %rax, 104(%rsp)
	movl $254, %eax
	movslq %eax, %rax
	xorps %xmm0, %xmm0
	cvtsi2sdq %rax, %xmm0
	movl $190, %eax
	movslq %eax, %rax
	mulsd %xmm0, %xmm1
	movsd %xmm1, 168(%rsp)
	xorps %xmm1, %xmm1
	cvtsi2sdq %rax, %xmm1
	movl $1, %eax
	cmovge %ecx, %eax
	movl $191, %ecx
	cmpl $191, %edx
	cmovg %ecx, %edx
	mulsd %xmm1, %xmm2
	movsd %xmm2, 160(%rsp)
	movabsq $1056964608, %r10
	movq %r10, %xmm2
	cvtss2sd %xmm2, %xmm2
	addsd %xmm2, %xmm0
	movsd %xmm0, 120(%rsp)
	movabsq $1056964608, %r10
	movq %r10, %xmm0
	cvtss2sd %xmm0, %xmm0
	addsd %xmm1, %xmm0
	movsd %xmm0, 144(%rsp)
	movq %rdx, 216(%rsp)
	xorps %xmm0, %xmm0
	xorps %xmm1, %xmm1
	movabsq $0, %r10
	movq %r10, 248(%rsp)
	movabsq $0, %r10
	movq %r10, 240(%rsp)
	movabsq $0, %r10
	movq %r10, 232(%rsp)
	movabsq $0, %r10
	movq %r10, 224(%rsp)
	xorl %ecx, %ecx
	xorl %edx, %edx
	xorl %esi, %esi
	xorl %edi, %edi
	xorl %r8d, %r8d
	xorl %ebx, %ebx
.LB7110:
	movq 216(%rsp), %r12
	cmpl %r12d, %eax
	jge .LB7113
.LB7111:
	movl %eax, %r12d
	shll $8, %r12d
	movq 248(%rsp), %r10
	movq %r10, 208(%rsp)
	movq 240(%rsp), %r10
	movq %r10, 200(%rsp)
	movq 232(%rsp), %r10
	movq %r10, 192(%rsp)
	movq 224(%rsp), %r10
	movq %r10, 184(%rsp)
	movq %rbx, 176(%rsp)
	movq %r8, %rbx
	movq %rdi, %r8
	movq %rsi, %rdi
	movq %rdx, %rsi
	movq %rcx, %rdx
	movl $1, %ecx
.LB7120:
	cmpl $255, %ecx
	jge .LB7123
.LB7121:
	movq (%rsp), %rsi
	movslq %ecx, %rdx
	xorps %xmm0, %xmm0
	cvtsi2sdq %rdx, %xmm0
	leal (%r12,%rcx), %edx
	movslq %edx, %rdx
	movsd (%rsi,%rdx,8), %xmm1
	movsd 168(%rsp), %xmm2
	movslq %eax, %rsi
	vfnmadd231sd %xmm2, %xmm1, %xmm0
	xorps %xmm1, %xmm1
	cvtsi2sdq %rsi, %xmm1
	movq 104(%rsp), %rsi
	movsd (%rsi,%rdx,8), %xmm2
	movsd 160(%rsp), %xmm3
	vfnmadd231sd %xmm3, %xmm2, %xmm1
	movabsq $1056964608, %r10
	movq %r10, %xmm2
	cvtss2sd %xmm2, %xmm2
	ucomisd %xmm0, %xmm2
	ja .LB7152
.LB7153:
.LB7154:
	movsd 120(%rsp), %xmm2
	ucomisd %xmm2, %xmm0
	ja .LB7159
.LB7160:
.LB7161:
	movabsq $1056964608, %r10
	movq %r10, %xmm2
	cvtss2sd %xmm2, %xmm2
	ucomisd %xmm1, %xmm2
	ja .LB7166
.LB7167:
.LB7168:
	movsd 144(%rsp), %xmm2
	ucomisd %xmm2, %xmm1
	ja .LB7173
.LB7174:
.LB7175:
	cvttsd2siq %xmm0, %rdx
	movabsq $1065353216, %r10
	movq %r10, %xmm3
	cvttsd2siq %xmm1, %rsi
	cvtss2sd %xmm3, %xmm3
	movl %edx, %edx
	movl %esi, %esi
	leal 1(%rdx), %edi
	movslq %edx, %rbx
	leal 1(%rsi), %r8d
	xorps %xmm2, %xmm2
	cvtsi2sdq %rbx, %xmm2
	movslq %esi, %rbx
	movaps %xmm2, %xmm15
	movaps %xmm0, %xmm2
	subsd %xmm15, %xmm2
	movsd %xmm2, 8(%rsp)
	movaps %xmm2, %xmm15
	movaps %xmm3, %xmm2
	subsd %xmm15, %xmm2
	movabsq $1065353216, %r10
	movq %r10, %xmm3
	movsd %xmm2, 16(%rsp)
	xorps %xmm2, %xmm2
	cvtsi2sdq %rbx, %xmm2
	movl %esi, %ebx
	shll $8, %ebx
	movl %r8d, %r13d
	shll $8, %r13d
	leal (%rbx,%rdx), %r14d
	movslq %r14d, %r14
	movsd %xmm2, 152(%rsp)
	movsd %xmm3, 136(%rsp)
	cvtss2sd %xmm3, %xmm3
	movaps %xmm2, %xmm15
	movaps %xmm1, %xmm2
	subsd %xmm15, %xmm2
	movsd %xmm3, 128(%rsp)
	subsd %xmm2, %xmm3
	movsd %xmm3, -8(%rsp)
	movsd (%r9,%r14,8), %xmm3
	leal (%r13,%rdx), %r14d
	movslq %r14d, %r14
	movsd %xmm3, 96(%rsp)
	movsd (%r9,%r14,8), %xmm4
	leal (%rbx,%rdi), %r14d
	movslq %r14d, %r14
	movsd %xmm4, 88(%rsp)
	mulsd %xmm2, %xmm4
	movsd %xmm4, 80(%rsp)
	movsd -8(%rsp), %xmm5
	vfmadd132sd %xmm5, %xmm4, %xmm3
	movsd %xmm3, 72(%rsp)
	movsd (%r9,%r14,8), %xmm3
	leal (%r13,%rdi), %r14d
	movslq %r14d, %r14
	movsd %xmm3, 64(%rsp)
	movsd (%r9,%r14,8), %xmm4
	movsd %xmm4, 56(%rsp)
	mulsd %xmm2, %xmm4
	movsd %xmm4, 48(%rsp)
	movsd -8(%rsp), %xmm5
	leal (%r12,%rcx), %r14d
	incl %ecx
	movslq %r14d, %r14
	vfmadd132sd %xmm5, %xmm4, %xmm3
	movsd %xmm3, 40(%rsp)
	movsd 8(%rsp), %xmm4
	mulsd %xmm4, %xmm3
	movsd %xmm3, 32(%rsp)
	movsd 72(%rsp), %xmm4
	movsd 16(%rsp), %xmm5
	vfmadd231sd %xmm5, %xmm4, %xmm3
	movsd %xmm3, 24(%rsp)
	movq 112(%rsp), %r15
	movsd %xmm3, (%r15,%r14,8)
	movq 16(%rsp), %r10
	movq %r10, 208(%rsp)
	movq 8(%rsp), %r10
	movq %r10, 200(%rsp)
	movq -8(%rsp), %r10
	movq %r10, 192(%rsp)
	movsd %xmm2, 184(%rsp)
	movq %r13, 176(%rsp)
	cmpl $255, %ecx
	jl .LB7121
	jmp .LB7123
.LB7113:
	movq 304(%rsp), %rbx
	movq 296(%rsp), %rsi
	movq 288(%rsp), %rdi
	movq 280(%rsp), %r12
	movq 272(%rsp), %r13
	movq 264(%rsp), %r14
	movq 256(%rsp), %r15
	addq $320, %rsp
	ret
.LB7123:
	incl %eax
	movq 208(%rsp), %r10
	movq %r10, 248(%rsp)
	movq 200(%rsp), %r10
	movq %r10, 240(%rsp)
	movq 192(%rsp), %r10
	movq %r10, 232(%rsp)
	movq 184(%rsp), %r10
	movq %r10, 224(%rsp)
	movq %rdx, %rcx
	movq %rsi, %rdx
	movq %rdi, %rsi
	movq %r8, %rdi
	movq %rbx, %r8
	movq 176(%rsp), %rbx
	jmp .LB7110
.LB7152:
	movabsq $1056964608, %r10
	movq %r10, %xmm0
	cvtss2sd %xmm0, %xmm0
	jmp .LB7154
.LB7159:
	movsd 120(%rsp), %xmm0
	jmp .LB7161
.LB7166:
	movabsq $1056964608, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	jmp .LB7168
.LB7173:
	movsd 144(%rsp), %xmm1
	jmp .LB7175
	.text
	.globl project_div_band__8__intE1__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__doubleE1__ret_voidE1
	.def project_div_band__8__intE1__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__doubleE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
project_div_band__8__intE1__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__doubleE1__ret_voidE1:
	subq $48, %rsp
	movq %rbx, 32(%rsp)
	movq %rsi, 24(%rsp)
	movq %rdi, 16(%rsp)
	movq %r12, 8(%rsp)
	movq %r13, 0(%rsp)
.LB7251:
	movq 88(%rsp), %rax
	movq 96(%rsp), %rsi
	movsd 104(%rsp), %xmm0
	movsd 112(%rsp), %xmm1
	movl $1, %edi
	cmpl $1, %ecx
	cmovl %edi, %ecx
	movl $191, %edi
	cmpl $191, %edx
	cmovg %edi, %edx
.LB7279:
	cmpl %edx, %ecx
	jge .LB7282
.LB7280:
	movl %ecx, %edi
	shll $8, %edi
	movl $1, %ebx
.LB7289:
	cmpl $255, %ebx
	jge .LB7292
.LB7290:
	xorps %xmm2, %xmm2
	movabsq $1056964608, %r10
	movq %r10, %xmm3
	leal (%rdi,%rbx), %r12d
	leal 1(%r12), %r13d
	movslq %r13d, %r13
	subss %xmm3, %xmm2
	movsd (%r8,%r13,8), %xmm3
	leal -1(%r12), %r13d
	movslq %r13d, %r13
	movsd (%r8,%r13,8), %xmm4
	leal 256(%r12), %r13d
	movslq %r13d, %r13
	cvtss2sd %xmm2, %xmm2
	subsd %xmm4, %xmm3
	movsd (%r9,%r13,8), %xmm4
	leal -256(%r12), %r13d
	movslq %r12d, %r12
	movslq %r13d, %r13
	incl %ebx
	movsd (%r9,%r13,8), %xmm5
	subsd %xmm5, %xmm4
	mulsd %xmm1, %xmm4
	vfmadd132sd %xmm0, %xmm4, %xmm3
	mulsd %xmm3, %xmm2
	movsd %xmm2, (%rsi,%r12,8)
	xorps %xmm2, %xmm2
	cvtss2sd %xmm2, %xmm2
	movsd %xmm2, (%rax,%r12,8)
	cmpl $255, %ebx
	jl .LB7290
	jmp .LB7292
.LB7282:
	movq 32(%rsp), %rbx
	movq 24(%rsp), %rsi
	movq 16(%rsp), %rdi
	movq 8(%rsp), %r12
	movq 0(%rsp), %r13
	addq $48, %rsp
	ret
.LB7292:
	incl %ecx
	cmpl %edx, %ecx
	jl .LB7280
	jmp .LB7282
	.text
	.globl project_grad_band__7__intE1__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__doubleE1__ret_voidE1
	.def project_grad_band__7__intE1__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__doubleE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
project_grad_band__7__intE1__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__doubleE1__ret_voidE1:
	subq $48, %rsp
	movq %rbx, 32(%rsp)
	movq %rsi, 24(%rsp)
	movq %rdi, 16(%rsp)
	movq %r12, 8(%rsp)
	movq %r13, 0(%rsp)
.LB7349:
	movq 88(%rsp), %rax
	movsd 96(%rsp), %xmm0
	movsd 104(%rsp), %xmm1
	movl $1, %esi
	cmpl $1, %ecx
	cmovl %esi, %ecx
	movl $191, %esi
	cmpl $191, %edx
	cmovg %esi, %edx
.LB7376:
	cmpl %edx, %ecx
	jge .LB7379
.LB7377:
	movl %ecx, %esi
	shll $8, %esi
	movl $1, %edi
.LB7386:
	cmpl $255, %edi
	jge .LB7389
.LB7387:
	leal (%rsi,%rdi), %ebx
	movslq %ebx, %r12
	leal 1(%rbx), %r13d
	leaq (%r8,%r12,8), %r12
	movslq %r13d, %r13
	movsd (%r12), %xmm2
	movsd (%rax,%r13,8), %xmm3
	leal -1(%rbx), %r13d
	movslq %r13d, %r13
	movsd (%rax,%r13,8), %xmm4
	leal 256(%rbx), %r13d
	movslq %r13d, %r13
	subsd %xmm4, %xmm3
	movabsq $1056964608, %r10
	movq %r10, %xmm4
	cvtss2sd %xmm4, %xmm4
	mulsd %xmm4, %xmm3
	vfnmadd231sd %xmm3, %xmm0, %xmm2
	movsd %xmm2, (%r12)
	movslq %ebx, %r12
	subl $256, %ebx
	incl %edi
	leaq (%r9,%r12,8), %r12
	movslq %ebx, %rbx
	movsd (%r12), %xmm2
	movsd (%rax,%r13,8), %xmm3
	movsd (%rax,%rbx,8), %xmm4
	subsd %xmm4, %xmm3
	movabsq $1056964608, %r10
	movq %r10, %xmm4
	cvtss2sd %xmm4, %xmm4
	mulsd %xmm4, %xmm3
	vfnmadd231sd %xmm3, %xmm1, %xmm2
	movsd %xmm2, (%r12)
	cmpl $255, %edi
	jl .LB7387
	jmp .LB7389
.LB7379:
	movq 32(%rsp), %rbx
	movq 24(%rsp), %rsi
	movq 16(%rsp), %rdi
	movq 8(%rsp), %r12
	movq 0(%rsp), %r13
	addq $48, %rsp
	ret
.LB7389:
	incl %ecx
	cmpl %edx, %ecx
	jl .LB7377
	jmp .LB7379
	.text
	.globl decay_band__3__intE1__intE1__doubleE1_ptr1__ret_voidE1
	.def decay_band__3__intE1__intE1__doubleE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
decay_band__3__intE1__intE1__doubleE1_ptr1__ret_voidE1:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
	movq %rdi, -8(%rsp)
.LB7459:
	movl %ecx, %eax
	xorps %xmm0, %xmm0
.LB7467:
	cmpl %edx, %eax
	jge .LB7470
.LB7468:
	movl %eax, %ecx
	shll $8, %ecx
	xorl %esi, %esi
.LB7477:
	cmpl $256, %esi
	jge .LB7480
.LB7478:
	movabsq $1065349861, %r10
	movq %r10, %xmm1
	leal (%rcx,%rsi), %edi
	movslq %edi, %rdi
	movsd (%r8,%rdi,8), %xmm0
	cvtss2sd %xmm1, %xmm1
	mulsd %xmm1, %xmm0
	movabsq $953267991, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm0, %xmm1
	ja .LB7494
.LB7495:
.LB7496:
	leal (%rcx,%rsi), %edi
	movslq %edi, %rdi
	movsd %xmm0, (%r8,%rdi,8)
	incl %esi
	cmpl $256, %esi
	jl .LB7478
	jmp .LB7480
.LB7470:
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB7480:
	incl %eax
	cmpl %edx, %eax
	jl .LB7468
	jmp .LB7470
.LB7494:
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	jmp .LB7496
	.text
	.globl particles_init__0__ret_voidE1
	.def particles_init__0__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
particles_init__0__ret_voidE1:
.LB7508:
	xorl %eax, %eax
.LB7510:
	cmpq $7500, %rax
	jge .LB7513
.LB7511:
	movl g_rand_seed(%rip), %ecx
	imull $1664525, %ecx, %ecx
	addl $1013904223, %ecx
	movl %ecx, g_rand_seed(%rip)
	andl $2147483647, %ecx
	movslq %ecx, %rcx
	xorps %xmm0, %xmm0
	cvtsi2ssq %rcx, %xmm0
	movl $2147483647, %ecx
	movslq %ecx, %rcx
	xorps %xmm1, %xmm1
	cvtsi2ssq %rcx, %xmm1
	movl $256, %ecx
	movslq %ecx, %rcx
	xorps %xmm2, %xmm2
	cvtsi2ssq %rcx, %xmm2
	movq g_part_x(%rip), %rcx
	divss %xmm1, %xmm0
	mulss %xmm2, %xmm0
	movss %xmm0, (%rcx,%rax,4)
	movl g_rand_seed(%rip), %ecx
	imull $1664525, %ecx, %ecx
	addl $1013904223, %ecx
	movl %ecx, g_rand_seed(%rip)
	andl $2147483647, %ecx
	movslq %ecx, %rcx
	xorps %xmm0, %xmm0
	cvtsi2ssq %rcx, %xmm0
	movl $192, %ecx
	movslq %ecx, %rcx
	divss %xmm1, %xmm0
	xorps %xmm1, %xmm1
	cvtsi2ssq %rcx, %xmm1
	movq g_part_y(%rip), %rcx
	mulss %xmm1, %xmm0
	movss %xmm0, (%rcx,%rax,4)
	incq %rax
	cmpq $7500, %rax
	jl .LB7511
.LB7513:
	ret
	.text
	.globl particles_update__0__ret_voidE1
	.def particles_update__0__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
particles_update__0__ret_voidE1:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
	movq %rdi, -8(%rsp)
.LB7544:
	xorl %eax, %eax
.LB7552:
	cmpq $7500, %rax
	jge .LB7555
.LB7553:
	movq g_part_x(%rip), %rcx
	movl $1, %edi
	movabsq $1097859072, %r10
	movq %r10, %xmm3
	movabsq $1097859072, %r10
	movq %r10, %xmm4
	movabsq $981668463, %r10
	movq %r10, %xmm5
	cvtss2sd %xmm3, %xmm3
	cvtss2sd %xmm4, %xmm4
	movss (%rcx,%rax,4), %xmm0
	movq g_part_y(%rip), %rdx
	movss (%rdx,%rax,4), %xmm1
	cvttss2siq %xmm0, %rdx
	movl %edx, %edx
	cvttss2siq %xmm1, %rsi
	cmpl $1, %edx
	cmovl %edi, %edx
	movl $254, %edi
	cmpl $254, %edx
	cmovg %edi, %edx
	movl $1, %edi
	movl %esi, %esi
	cmpl $1, %esi
	cmovl %edi, %esi
	movl $190, %edi
	cmpl $190, %esi
	cmovg %edi, %esi
	movq g_vx(%rip), %rdi
	shll $8, %esi
	addl %edx, %esi
	movslq %esi, %rdx
	movsd (%rdi,%rdx,8), %xmm2
	movq g_vy(%rip), %rsi
	mulsd %xmm3, %xmm2
	movsd (%rsi,%rdx,8), %xmm3
	movl g_rand_seed(%rip), %edx
	cvtsd2ss %xmm2, %xmm2
	mulsd %xmm4, %xmm3
	imull $1664525, %edx, %edx
	addl $1013904223, %edx
	cvtsd2ss %xmm3, %xmm3
	movl %edx, %esi
	andl $255, %esi
	movl %edx, g_rand_seed(%rip)
	subl $128, %esi
	imull $1664525, %edx, %edx
	movslq %esi, %rsi
	xorps %xmm4, %xmm4
	cvtsi2ssq %rsi, %xmm4
	addl $1013904223, %edx
	movl %edx, g_rand_seed(%rip)
	vfmadd231ss %xmm4, %xmm5, %xmm2
	andl $255, %edx
	movabsq $981668463, %r10
	movq %r10, %xmm5
	addss %xmm2, %xmm0
	xorps %xmm2, %xmm2
	subl $128, %edx
	movslq %edx, %rdx
	xorps %xmm4, %xmm4
	cvtsi2ssq %rdx, %xmm4
	vfmadd231ss %xmm4, %xmm5, %xmm3
	addss %xmm3, %xmm1
	ucomiss %xmm0, %xmm2
	ja .LB7642
.LB7643:
.LB7644:
	movl $256, %edx
	movslq %edx, %rdx
	xorps %xmm2, %xmm2
	cvtsi2ssq %rdx, %xmm2
	ucomiss %xmm2, %xmm0
	jae .LB7651
.LB7652:
.LB7653:
	xorps %xmm2, %xmm2
	ucomiss %xmm1, %xmm2
	ja .LB7659
.LB7660:
.LB7661:
	movl $192, %edx
	movslq %edx, %rdx
	xorps %xmm2, %xmm2
	cvtsi2ssq %rdx, %xmm2
	ucomiss %xmm2, %xmm1
	jae .LB7668
.LB7669:
.LB7670:
	movss %xmm0, (%rcx,%rax,4)
	movq g_part_y(%rip), %rcx
	movss %xmm1, (%rcx,%rax,4)
	incq %rax
	cmpq $7500, %rax
	jl .LB7553
.LB7555:
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB7642:
	movl $256, %edx
	movslq %edx, %rdx
	xorps %xmm2, %xmm2
	cvtsi2ssq %rdx, %xmm2
	addss %xmm2, %xmm0
	jmp .LB7644
.LB7651:
	subss %xmm2, %xmm0
	jmp .LB7653
.LB7659:
	movl $192, %edx
	movslq %edx, %rdx
	xorps %xmm2, %xmm2
	cvtsi2ssq %rdx, %xmm2
	addss %xmm2, %xmm1
	jmp .LB7661
.LB7668:
	subss %xmm2, %xmm1
	jmp .LB7670
	.text
	.globl worker__1__voidE1_ptr1__ret_voidE1_ptr1
	.def worker__1__voidE1_ptr1__ret_voidE1_ptr1;
	.scl 2;
	.type 32;
	.endef
worker__1__voidE1_ptr1__ret_voidE1_ptr1:
	pushq %rbp
	movq %rsp, %rbp
	subq $80, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB7684:
	movq %rcx, %rax
	movq %rax, %rsi
.LB7689:
	leaq g_work_sem(%rip), %rax
	movq (%rax), %rax
	movl WIN32_INFINITE(%rip), %edx
	movq %rax, %rcx
	callq WaitForSingleObject
	lfence
	movl 8(%rsi), %eax
	movl PHASE_EXIT(%rip), %ecx
	cmpl %ecx, %eax
	je .LB7698
.LB7699:
	movl PHASE_LINSOLVE_RED(%rip), %ecx
	cmpl %ecx, %eax
	je .LB7718
.LB7709:
	movl PHASE_LINSOLVE_BLACK(%rip), %ecx
	cmpl %ecx, %eax
	je .LB7718
.LB7719:
	movl PHASE_ADVECT(%rip), %ecx
	cmpl %ecx, %eax
	je .LB7755
.LB7756:
	movl PHASE_PROJECT_DIV(%rip), %ecx
	cmpl %ecx, %eax
	je .LB7787
.LB7788:
	movl PHASE_PROJECT_GRAD(%rip), %ecx
	cmpl %ecx, %eax
	je .LB7827
.LB7828:
	movl PHASE_DECAY(%rip), %ecx
	cmpl %ecx, %eax
	je .LB7863
.LB7720:
	leaq g_done_sem(%rip), %rax
	movq (%rax), %rax
	movq %rax, %rcx
	movl $1, %edx
	xorl %r8d, %r8d
	callq ReleaseSemaphore
	jmp .LB7689
.LB7863:
	movl (%rsi), %ecx
	movl 4(%rsi), %edx
	movq 144(%rsi), %r8
	callq decay_band__3__intE1__intE1__doubleE1_ptr1__ret_voidE1
	jmp .LB7720
.LB7827:
	movl (%rsi), %ecx
	movl 4(%rsi), %edx
	movq 80(%rsi), %r8
	movq 88(%rsi), %r9
	movq 96(%rsi), %rax
	movsd 128(%rsi), %xmm0
	movsd 136(%rsi), %xmm1
	movq %rax, 32(%rsp)
	movsd %xmm0, 40(%rsp)
	movsd %xmm1, 48(%rsp)
	callq project_grad_band__7__intE1__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__doubleE1__ret_voidE1
	jmp .LB7720
.LB7787:
	movl (%rsi), %ecx
	movl 4(%rsi), %edx
	movq 80(%rsi), %r8
	movq 88(%rsi), %r9
	movq 96(%rsi), %rax
	movq 104(%rsi), %rdi
	movsd 112(%rsi), %xmm0
	movsd 120(%rsi), %xmm1
	movq %rax, 32(%rsp)
	movq %rdi, 40(%rsp)
	movsd %xmm0, 48(%rsp)
	movsd %xmm1, 56(%rsp)
	callq project_div_band__8__intE1__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__doubleE1__ret_voidE1
	jmp .LB7720
.LB7755:
	movl (%rsi), %ecx
	movl 4(%rsi), %edx
	movq 48(%rsi), %r8
	movq 56(%rsi), %r9
	movq 64(%rsi), %rax
	movq 72(%rsi), %rdi
	movq %rax, 32(%rsp)
	movq %rdi, 40(%rsp)
	callq advect_band__6__intE1__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__ret_voidE1
	jmp .LB7720
.LB7718:
	movl (%rsi), %ecx
	movl 4(%rsi), %edx
	movl 12(%rsi), %r8d
	movq 16(%rsi), %r9
	movq 24(%rsi), %rax
	movsd 32(%rsi), %xmm0
	movsd 40(%rsi), %xmm1
	movq %rax, 32(%rsp)
	movsd %xmm0, 40(%rsp)
	movsd %xmm1, 48(%rsp)
	callq linsolve_band__7__intE1__intE1__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__doubleE1__ret_voidE1
	jmp .LB7720
.LB7698:
	xorl %eax, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
	.text
	.globl worker2__1__voidE1_ptr1__ret_voidE1_ptr1
	.def worker2__1__voidE1_ptr1__ret_voidE1_ptr1;
	.scl 2;
	.type 32;
	.endef
worker2__1__voidE1_ptr1__ret_voidE1_ptr1:
	pushq %rbp
	movq %rsp, %rbp
	subq $80, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB7879:
	movq %rcx, %rax
	movq %rax, %rsi
.LB7884:
	leaq g_work_sem2(%rip), %rax
	movq (%rax), %rax
	movl WIN32_INFINITE(%rip), %edx
	movq %rax, %rcx
	callq WaitForSingleObject
	lfence
	movl 8(%rsi), %eax
	movl PHASE_EXIT(%rip), %ecx
	cmpl %ecx, %eax
	je .LB7893
.LB7894:
	movl PHASE_LINSOLVE_RED(%rip), %ecx
	cmpl %ecx, %eax
	je .LB7913
.LB7904:
	movl PHASE_LINSOLVE_BLACK(%rip), %ecx
	cmpl %ecx, %eax
	je .LB7913
.LB7914:
	movl PHASE_ADVECT(%rip), %ecx
	cmpl %ecx, %eax
	je .LB7950
.LB7951:
	movl PHASE_PROJECT_DIV(%rip), %ecx
	cmpl %ecx, %eax
	je .LB7982
.LB7983:
	movl PHASE_PROJECT_GRAD(%rip), %ecx
	cmpl %ecx, %eax
	je .LB8022
.LB8023:
	movl PHASE_DECAY(%rip), %ecx
	cmpl %ecx, %eax
	je .LB8058
.LB7915:
	leaq g_done_sem2(%rip), %rax
	movq (%rax), %rax
	movq %rax, %rcx
	movl $1, %edx
	xorl %r8d, %r8d
	callq ReleaseSemaphore
	jmp .LB7884
.LB8058:
	movl (%rsi), %ecx
	movl 4(%rsi), %edx
	movq 144(%rsi), %r8
	callq decay_band__3__intE1__intE1__doubleE1_ptr1__ret_voidE1
	jmp .LB7915
.LB8022:
	movl (%rsi), %ecx
	movl 4(%rsi), %edx
	movq 80(%rsi), %r8
	movq 88(%rsi), %r9
	movq 96(%rsi), %rax
	movsd 128(%rsi), %xmm0
	movsd 136(%rsi), %xmm1
	movq %rax, 32(%rsp)
	movsd %xmm0, 40(%rsp)
	movsd %xmm1, 48(%rsp)
	callq project_grad_band__7__intE1__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__doubleE1__ret_voidE1
	jmp .LB7915
.LB7982:
	movl (%rsi), %ecx
	movl 4(%rsi), %edx
	movq 80(%rsi), %r8
	movq 88(%rsi), %r9
	movq 96(%rsi), %rax
	movq 104(%rsi), %rdi
	movsd 112(%rsi), %xmm0
	movsd 120(%rsi), %xmm1
	movq %rax, 32(%rsp)
	movq %rdi, 40(%rsp)
	movsd %xmm0, 48(%rsp)
	movsd %xmm1, 56(%rsp)
	callq project_div_band__8__intE1__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__doubleE1__ret_voidE1
	jmp .LB7915
.LB7950:
	movl (%rsi), %ecx
	movl 4(%rsi), %edx
	movq 48(%rsi), %r8
	movq 56(%rsi), %r9
	movq 64(%rsi), %rax
	movq 72(%rsi), %rdi
	movq %rax, 32(%rsp)
	movq %rdi, 40(%rsp)
	callq advect_band__6__intE1__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__ret_voidE1
	jmp .LB7915
.LB7913:
	movl (%rsi), %ecx
	movl 4(%rsi), %edx
	movl 12(%rsi), %r8d
	movq 16(%rsi), %r9
	movq 24(%rsi), %rax
	movsd 32(%rsi), %xmm0
	movsd 40(%rsi), %xmm1
	movq %rax, 32(%rsp)
	movsd %xmm0, 40(%rsp)
	movsd %xmm1, 48(%rsp)
	callq linsolve_band__7__intE1__intE1__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__doubleE1__ret_voidE1
	jmp .LB7915
.LB7893:
	xorl %eax, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
	.text
	.globl dispatch_linsolve2__5__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__doubleE1__ret_voidE1
	.def dispatch_linsolve2__5__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__doubleE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
dispatch_linsolve2__5__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__doubleE1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
.LB8074:
	movsd 48(%rbp), %xmm1
	xorl %eax, %eax
	testl %ecx, %ecx
	movaps %xmm3, %xmm0
	sete %al
	xorl %esi, %esi
.LB8081:
	movl g_num_threads(%rip), %edi
	cmpl %edi, %esi
	jge .LB8084
.LB8082:
	testb %al, %al
	jne .LB8090
.LB8091:
	movl PHASE_LINSOLVE_BLACK(%rip), %edi
.LB8092:
	leaq g_slices2(%rip), %r9
	movslq %esi, %rbx
	imulq $152, %rbx, %r12
	movl %edi, 8(%r9,%r12,1)
	leaq g_slices2(%rip), %rdi
	imulq $152, %rbx, %r9
	movq %rdx, 16(%rdi,%r9,1)
	leaq g_slices2(%rip), %rdi
	imulq $152, %rbx, %r9
	movq %r8, 24(%rdi,%r9,1)
	leaq g_slices2(%rip), %rdi
	imulq $152, %rbx, %r9
	movsd %xmm0, 32(%rdi,%r9,1)
	leaq g_slices2(%rip), %rdi
	imulq $152, %rbx, %r9
	movsd %xmm1, 40(%rdi,%r9,1)
	leaq g_slices2(%rip), %rdi
	imulq $152, %rbx, %rbx
	movl %ecx, 12(%rdi,%rbx,1)
	incl %esi
	jmp .LB8081
.LB8084:
	sfence
	xorl %esi, %esi
.LB8121:
	movl g_num_threads(%rip), %eax
	cmpl %eax, %esi
	jge .LB8124
.LB8122:
	leaq g_work_sem2(%rip), %rax
	movq (%rax), %rax
	movq %rax, %rcx
	movl $1, %edx
	xorl %r8d, %r8d
	callq ReleaseSemaphore
	incl %esi
	jmp .LB8121
.LB8124:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB8090:
	movl PHASE_LINSOLVE_RED(%rip), %edi
	jmp .LB8092
	.text
	.globl collect2__0__ret_voidE1
	.def collect2__0__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
collect2__0__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
.LB8130:
	xorl %esi, %esi
.LB8132:
	movl g_num_threads(%rip), %eax
	cmpl %eax, %esi
	jge .LB8135
.LB8133:
	leaq g_done_sem2(%rip), %rax
	movq (%rax), %rax
	movl WIN32_INFINITE(%rip), %edx
	movq %rax, %rcx
	callq WaitForSingleObject
	incl %esi
	jmp .LB8132
.LB8135:
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl dispatch_linsolve_post__5__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__doubleE1__ret_voidE1
	.def dispatch_linsolve_post__5__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__doubleE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
dispatch_linsolve_post__5__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__doubleE1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
.LB8141:
	movsd 48(%rbp), %xmm1
	xorl %eax, %eax
	testl %ecx, %ecx
	movaps %xmm3, %xmm0
	sete %al
	xorl %esi, %esi
.LB8148:
	movl g_num_threads(%rip), %edi
	cmpl %edi, %esi
	jge .LB8151
.LB8149:
	testb %al, %al
	jne .LB8157
.LB8158:
	movl PHASE_LINSOLVE_BLACK(%rip), %edi
.LB8159:
	leaq g_slices(%rip), %r9
	movslq %esi, %rbx
	imulq $152, %rbx, %r12
	movl %edi, 8(%r9,%r12,1)
	leaq g_slices(%rip), %rdi
	imulq $152, %rbx, %r9
	movq %rdx, 16(%rdi,%r9,1)
	leaq g_slices(%rip), %rdi
	imulq $152, %rbx, %r9
	movq %r8, 24(%rdi,%r9,1)
	leaq g_slices(%rip), %rdi
	imulq $152, %rbx, %r9
	movsd %xmm0, 32(%rdi,%r9,1)
	leaq g_slices(%rip), %rdi
	imulq $152, %rbx, %r9
	movsd %xmm1, 40(%rdi,%r9,1)
	leaq g_slices(%rip), %rdi
	imulq $152, %rbx, %rbx
	movl %ecx, 12(%rdi,%rbx,1)
	incl %esi
	jmp .LB8148
.LB8151:
	sfence
	xorl %esi, %esi
.LB8188:
	movl g_num_threads(%rip), %eax
	cmpl %eax, %esi
	jge .LB8191
.LB8189:
	leaq g_work_sem(%rip), %rax
	movq (%rax), %rax
	movq %rax, %rcx
	movl $1, %edx
	xorl %r8d, %r8d
	callq ReleaseSemaphore
	incl %esi
	jmp .LB8188
.LB8191:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB8157:
	movl PHASE_LINSOLVE_RED(%rip), %edi
	jmp .LB8159
	.text
	.globl collect1__0__ret_voidE1
	.def collect1__0__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
collect1__0__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
.LB8197:
	xorl %esi, %esi
.LB8199:
	movl g_num_threads(%rip), %eax
	cmpl %eax, %esi
	jge .LB8202
.LB8200:
	leaq g_done_sem(%rip), %rax
	movq (%rax), %rax
	movl WIN32_INFINITE(%rip), %edx
	movq %rax, %rcx
	callq WaitForSingleObject
	incl %esi
	jmp .LB8199
.LB8202:
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl dispatch_linsolve__5__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__doubleE1__ret_voidE1
	.def dispatch_linsolve__5__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__doubleE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
dispatch_linsolve__5__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__doubleE1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
.LB8208:
	movsd 48(%rbp), %xmm1
	xorl %eax, %eax
	testl %ecx, %ecx
	movaps %xmm3, %xmm0
	sete %al
	xorl %esi, %esi
.LB8215:
	movl g_num_threads(%rip), %edi
	cmpl %edi, %esi
	jge .LB8218
.LB8216:
	testb %al, %al
	jne .LB8224
.LB8225:
	movl PHASE_LINSOLVE_BLACK(%rip), %edi
.LB8226:
	leaq g_slices(%rip), %r9
	movslq %esi, %rbx
	imulq $152, %rbx, %r12
	movl %edi, 8(%r9,%r12,1)
	leaq g_slices(%rip), %rdi
	imulq $152, %rbx, %r9
	movq %rdx, 16(%rdi,%r9,1)
	leaq g_slices(%rip), %rdi
	imulq $152, %rbx, %r9
	movq %r8, 24(%rdi,%r9,1)
	leaq g_slices(%rip), %rdi
	imulq $152, %rbx, %r9
	movsd %xmm0, 32(%rdi,%r9,1)
	leaq g_slices(%rip), %rdi
	imulq $152, %rbx, %r9
	movsd %xmm1, 40(%rdi,%r9,1)
	leaq g_slices(%rip), %rdi
	imulq $152, %rbx, %rbx
	movl %ecx, 12(%rdi,%rbx,1)
	incl %esi
	jmp .LB8215
.LB8218:
	sfence
	xorl %esi, %esi
.LB8255:
	movl g_num_threads(%rip), %eax
	cmpl %eax, %esi
	jge .LB8258
.LB8256:
	leaq g_work_sem(%rip), %rax
	movq (%rax), %rax
	movq %rax, %rcx
	movl $1, %edx
	xorl %r8d, %r8d
	callq ReleaseSemaphore
	incl %esi
	jmp .LB8255
.LB8258:
	xorl %esi, %esi
.LB8264:
	movl g_num_threads(%rip), %eax
	cmpl %eax, %esi
	jge .LB8267
.LB8265:
	leaq g_done_sem(%rip), %rax
	movq (%rax), %rax
	movl WIN32_INFINITE(%rip), %edx
	movq %rax, %rcx
	callq WaitForSingleObject
	incl %esi
	jmp .LB8264
.LB8267:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB8224:
	movl PHASE_LINSOLVE_RED(%rip), %edi
	jmp .LB8226
	.text
	.globl dispatch_advect__4__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__ret_voidE1
	.def dispatch_advect__4__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
dispatch_advect__4__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
.LB8273:
	xorl %eax, %eax
.LB8279:
	movl g_num_threads(%rip), %esi
	cmpl %esi, %eax
	jge .LB8282
.LB8280:
	movl PHASE_ADVECT(%rip), %esi
	leaq g_slices(%rip), %rdi
	movslq %eax, %rbx
	imulq $152, %rbx, %r12
	movl %esi, 8(%rdi,%r12,1)
	leaq g_slices(%rip), %rsi
	imulq $152, %rbx, %rdi
	movq %rcx, 48(%rsi,%rdi,1)
	leaq g_slices(%rip), %rsi
	imulq $152, %rbx, %rdi
	movq %rdx, 56(%rsi,%rdi,1)
	leaq g_slices(%rip), %rsi
	imulq $152, %rbx, %rdi
	movq %r8, 64(%rsi,%rdi,1)
	leaq g_slices(%rip), %rsi
	imulq $152, %rbx, %rbx
	movq %r9, 72(%rsi,%rbx,1)
	incl %eax
	jmp .LB8279
.LB8282:
	sfence
	xorl %esi, %esi
.LB8308:
	movl g_num_threads(%rip), %eax
	cmpl %eax, %esi
	jge .LB8311
.LB8309:
	leaq g_work_sem(%rip), %rax
	movq (%rax), %rax
	movq %rax, %rcx
	movl $1, %edx
	xorl %r8d, %r8d
	callq ReleaseSemaphore
	incl %esi
	jmp .LB8308
.LB8311:
	xorl %esi, %esi
.LB8317:
	movl g_num_threads(%rip), %eax
	cmpl %eax, %esi
	jge .LB8320
.LB8318:
	leaq g_done_sem(%rip), %rax
	movq (%rax), %rax
	movl WIN32_INFINITE(%rip), %edx
	movq %rax, %rcx
	callq WaitForSingleObject
	incl %esi
	jmp .LB8317
.LB8320:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
	.text
	.globl dispatch_project_div__6__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__doubleE1__ret_voidE1
	.def dispatch_project_div__6__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__doubleE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
dispatch_project_div__6__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__doubleE1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
.LB8326:
	movsd 48(%rbp), %xmm0
	movsd 56(%rbp), %xmm1
	xorl %eax, %eax
.LB8334:
	movl g_num_threads(%rip), %esi
	cmpl %esi, %eax
	jge .LB8337
.LB8335:
	movl PHASE_PROJECT_DIV(%rip), %esi
	leaq g_slices(%rip), %rdi
	movslq %eax, %rbx
	imulq $152, %rbx, %r12
	movl %esi, 8(%rdi,%r12,1)
	leaq g_slices(%rip), %rsi
	imulq $152, %rbx, %rdi
	movq %rcx, 80(%rsi,%rdi,1)
	leaq g_slices(%rip), %rsi
	imulq $152, %rbx, %rdi
	movq %rdx, 88(%rsi,%rdi,1)
	leaq g_slices(%rip), %rsi
	imulq $152, %rbx, %rdi
	movq %r8, 96(%rsi,%rdi,1)
	leaq g_slices(%rip), %rsi
	imulq $152, %rbx, %rdi
	movq %r9, 104(%rsi,%rdi,1)
	leaq g_slices(%rip), %rsi
	imulq $152, %rbx, %rdi
	movsd %xmm0, 112(%rsi,%rdi,1)
	leaq g_slices(%rip), %rsi
	imulq $152, %rbx, %rbx
	movsd %xmm1, 120(%rsi,%rbx,1)
	incl %eax
	jmp .LB8334
.LB8337:
	sfence
	xorl %esi, %esi
.LB8371:
	movl g_num_threads(%rip), %eax
	cmpl %eax, %esi
	jge .LB8374
.LB8372:
	leaq g_work_sem(%rip), %rax
	movq (%rax), %rax
	movq %rax, %rcx
	movl $1, %edx
	xorl %r8d, %r8d
	callq ReleaseSemaphore
	incl %esi
	jmp .LB8371
.LB8374:
	xorl %esi, %esi
.LB8380:
	movl g_num_threads(%rip), %eax
	cmpl %eax, %esi
	jge .LB8383
.LB8381:
	leaq g_done_sem(%rip), %rax
	movq (%rax), %rax
	movl WIN32_INFINITE(%rip), %edx
	movq %rax, %rcx
	callq WaitForSingleObject
	incl %esi
	jmp .LB8380
.LB8383:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
	.text
	.globl dispatch_project_grad__5__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__doubleE1__ret_voidE1
	.def dispatch_project_grad__5__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__doubleE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
dispatch_project_grad__5__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__doubleE1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
.LB8389:
	movsd 48(%rbp), %xmm1
	movaps %xmm3, %xmm0
	xorl %eax, %eax
.LB8396:
	movl g_num_threads(%rip), %esi
	cmpl %esi, %eax
	jge .LB8399
.LB8397:
	movl PHASE_PROJECT_GRAD(%rip), %esi
	leaq g_slices(%rip), %rdi
	movslq %eax, %r9
	imulq $152, %r9, %rbx
	movl %esi, 8(%rdi,%rbx,1)
	leaq g_slices(%rip), %rsi
	imulq $152, %r9, %rdi
	movq %rcx, 80(%rsi,%rdi,1)
	leaq g_slices(%rip), %rsi
	imulq $152, %r9, %rdi
	movq %rdx, 88(%rsi,%rdi,1)
	leaq g_slices(%rip), %rsi
	imulq $152, %r9, %rdi
	movq %r8, 96(%rsi,%rdi,1)
	leaq g_slices(%rip), %rsi
	imulq $152, %r9, %rdi
	movsd %xmm0, 128(%rsi,%rdi,1)
	leaq g_slices(%rip), %rsi
	imulq $152, %r9, %r9
	movsd %xmm1, 136(%rsi,%r9,1)
	incl %eax
	jmp .LB8396
.LB8399:
	sfence
	xorl %esi, %esi
.LB8429:
	movl g_num_threads(%rip), %eax
	cmpl %eax, %esi
	jge .LB8432
.LB8430:
	leaq g_work_sem(%rip), %rax
	movq (%rax), %rax
	movq %rax, %rcx
	movl $1, %edx
	xorl %r8d, %r8d
	callq ReleaseSemaphore
	incl %esi
	jmp .LB8429
.LB8432:
	xorl %esi, %esi
.LB8438:
	movl g_num_threads(%rip), %eax
	cmpl %eax, %esi
	jge .LB8441
.LB8439:
	leaq g_done_sem(%rip), %rax
	movq (%rax), %rax
	movl WIN32_INFINITE(%rip), %edx
	movq %rax, %rcx
	callq WaitForSingleObject
	incl %esi
	jmp .LB8438
.LB8441:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
	.text
	.globl dispatch_decay__0__ret_voidE1
	.def dispatch_decay__0__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
dispatch_decay__0__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB8447:
	xorl %eax, %eax
.LB8449:
	movl g_num_threads(%rip), %ecx
	cmpl %ecx, %eax
	jge .LB8452
.LB8450:
	movl PHASE_DECAY(%rip), %ecx
	leaq g_slices(%rip), %rdx
	movslq %eax, %rsi
	imulq $152, %rsi, %rdi
	movl %ecx, 8(%rdx,%rdi,1)
	movq g_dens(%rip), %rcx
	leaq g_slices(%rip), %rdx
	imulq $152, %rsi, %rsi
	movq %rcx, 144(%rdx,%rsi,1)
	incl %eax
	jmp .LB8449
.LB8452:
	sfence
	xorl %esi, %esi
.LB8466:
	movl g_num_threads(%rip), %eax
	cmpl %eax, %esi
	jge .LB8469
.LB8467:
	leaq g_work_sem(%rip), %rax
	movq (%rax), %rax
	movq %rax, %rcx
	movl $1, %edx
	xorl %r8d, %r8d
	callq ReleaseSemaphore
	incl %esi
	jmp .LB8466
.LB8469:
	xorl %esi, %esi
.LB8475:
	movl g_num_threads(%rip), %eax
	cmpl %eax, %esi
	jge .LB8478
.LB8476:
	leaq g_done_sem(%rip), %rax
	movq (%rax), %rax
	movl WIN32_INFINITE(%rip), %edx
	movq %rax, %rcx
	callq WaitForSingleObject
	incl %esi
	jmp .LB8475
.LB8478:
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
	.text
	.globl upload_textures__0__ret_voidE1
	.def upload_textures__0__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
upload_textures__0__ret_voidE1:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
.LB8484:
	xorl %eax, %eax
.LB8491:
	cmpl $49152, %eax
	jge .LB8494
.LB8492:
	movq g_dens(%rip), %rcx
	movslq %eax, %rdx
	movsd (%rcx,%rdx,8), %xmm0
	movabsq $4571171282956062736, %r10
	movq %r10, %xmm1
	mulsd %xmm1, %xmm0
	cvtsd2ss %xmm0, %xmm0
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	ucomiss %xmm1, %xmm0
	ja .LB8506
.LB8507:
.LB8508:
	movq g_dens_tex(%rip), %rcx
	movslq %eax, %rdx
	movabsq $1082130432, %r10
	movq %r10, %xmm1
	movabsq $1056964608, %r10
	movq %r10, %xmm2
	cvtss2sd %xmm1, %xmm1
	movss %xmm0, (%rcx,%rdx,4)
	movq g_vx(%rip), %rsi
	movl %eax, %ecx
	shll $1, %ecx
	movsd (%rsi,%rdx,8), %xmm0
	movq g_vel_tex(%rip), %rdx
	movslq %ecx, %rsi
	incl %ecx
	movslq %ecx, %rcx
	mulsd %xmm1, %xmm0
	cvtsd2ss %xmm0, %xmm0
	addss %xmm2, %xmm0
	movss %xmm0, (%rdx,%rsi,4)
	movq g_vy(%rip), %rdx
	movslq %eax, %rsi
	incl %eax
	movsd (%rdx,%rsi,8), %xmm0
	movq g_vel_tex(%rip), %rdx
	mulsd %xmm1, %xmm0
	movabsq $1056964608, %r10
	movq %r10, %xmm1
	cvtsd2ss %xmm0, %xmm0
	addss %xmm1, %xmm0
	movss %xmm0, (%rdx,%rcx,4)
	cmpl $49152, %eax
	jl .LB8492
.LB8494:
	movq 0(%rsp), %rsi
	addq $16, %rsp
	ret
.LB8506:
	movabsq $1065353216, %r10
	movq %r10, %xmm0
	jmp .LB8508
	.text
	.globl lin_solve_parallel__5__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__doubleE1__ret_voidE1
	.def lin_solve_parallel__5__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__doubleE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
lin_solve_parallel__5__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__doubleE1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $96, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
.LB8542:
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	movaps %xmm3, %xmm0
	movl %ecx, %esi
	movq %rdx, %rdi
	movsd %xmm0, -40(%rbp)
	movsd 48(%rbp), %xmm0
	movq %r8, %rbx
	cvtss2sd %xmm1, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	divsd %xmm15, %xmm0
	movsd %xmm0, -48(%rbp)
	xorl %r12d, %r12d
.LB8553:
	cmpl $20, %r12d
	jge .LB8556
.LB8554:
	movsd -48(%rbp), %xmm0
	xorl %ecx, %ecx
	movq %rdi, %rdx
	movq %rbx, %r8
	movsd %xmm0, 32(%rsp)
	movsd -40(%rbp), %xmm0
	movaps %xmm0, %xmm3
	callq dispatch_linsolve__5__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__doubleE1__ret_voidE1
	movsd -48(%rbp), %xmm0
	movl $1, %ecx
	movq %rdi, %rdx
	movq %rbx, %r8
	movsd %xmm0, 32(%rsp)
	movsd -40(%rbp), %xmm0
	movaps %xmm0, %xmm3
	callq dispatch_linsolve__5__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__doubleE1__ret_voidE1
	cmpl $19, %r12d
	je .LB8570
.LB8572:
	incl %r12d
	cmpl $20, %r12d
	jl .LB8554
.LB8556:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB8570:
	movq %rsi, %rcx
	movq %rdi, %rdx
	callq set_bnd__2__intE1__doubleE1_ptr1__ret_voidE1
	jmp .LB8572
	.text
	.globl diffuse__4__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__ret_voidE1
	.def diffuse__4__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
diffuse__4__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
.LB8577:
	movabsq $1036831949, %r10
	movq %r10, %xmm1
	movl $254, %eax
	movaps %xmm3, %xmm0
	movabsq $1065353216, %r10
	movq %r10, %xmm2
	movslq %eax, %rax
	cvtss2sd %xmm1, %xmm1
	cvtss2sd %xmm2, %xmm2
	mulsd %xmm1, %xmm0
	xorps %xmm1, %xmm1
	cvtsi2sdq %rax, %xmm1
	movl $190, %eax
	movslq %eax, %rax
	mulsd %xmm1, %xmm0
	xorps %xmm1, %xmm1
	cvtsi2sdq %rax, %xmm1
	mulsd %xmm1, %xmm0
	movabsq $1082130432, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	movaps %xmm0, %xmm3
	vfmadd132sd %xmm0, %xmm2, %xmm1
	movsd %xmm1, 32(%rsp)
	callq lin_solve_parallel__5__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__doubleE1__ret_voidE1
	leave
	ret
	.text
	.globl project__4__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__ret_voidE1
	.def project__4__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
project__4__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $96, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
.LB8601:
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	movl $254, %eax
	movabsq $1065353216, %r10
	movq %r10, %xmm2
	movq %rcx, %rsi
	movslq %eax, %rax
	movq %rdx, %rdi
	movq %r8, %rbx
	movq %r9, %r12
	xorps %xmm0, %xmm0
	cvtsi2sdq %rax, %xmm0
	movl $190, %eax
	movq %rsi, %rcx
	movq %rdi, %rdx
	cvtss2sd %xmm1, %xmm1
	movslq %eax, %rax
	cvtss2sd %xmm2, %xmm2
	movq %rbx, %r8
	movq %r12, %r9
	movsd %xmm0, -40(%rbp)
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	divsd %xmm15, %xmm0
	xorps %xmm1, %xmm1
	cvtsi2sdq %rax, %xmm1
	movsd %xmm1, -48(%rbp)
	movaps %xmm1, %xmm15
	movaps %xmm2, %xmm1
	divsd %xmm15, %xmm1
	movsd %xmm0, 32(%rsp)
	movsd %xmm1, 40(%rsp)
	callq dispatch_project_div__6__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__doubleE1__ret_voidE1
	xorl %ecx, %ecx
	movq %r12, %rdx
	callq set_bnd__2__intE1__doubleE1_ptr1__ret_voidE1
	xorl %ecx, %ecx
	movq %rbx, %rdx
	callq set_bnd__2__intE1__doubleE1_ptr1__ret_voidE1
	movabsq $1065353216, %r10
	movq %r10, %xmm0
	movabsq $1082130432, %r10
	movq %r10, %xmm1
	xorl %ecx, %ecx
	movq %rbx, %rdx
	movq %r12, %r8
	cvtss2sd %xmm0, %xmm0
	cvtss2sd %xmm1, %xmm1
	movsd %xmm1, 32(%rsp)
	movaps %xmm0, %xmm3
	callq lin_solve_parallel__5__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__doubleE1__ret_voidE1
	movsd -48(%rbp), %xmm0
	movq %rsi, %rcx
	movq %rdi, %rdx
	movq %rbx, %r8
	movsd %xmm0, 32(%rsp)
	movsd -40(%rbp), %xmm0
	movaps %xmm0, %xmm3
	callq dispatch_project_grad__5__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__doubleE1__ret_voidE1
	movl $1, %ecx
	movq %rsi, %rdx
	callq set_bnd__2__intE1__doubleE1_ptr1__ret_voidE1
	movl $2, %ecx
	movq %rdi, %rdx
	callq set_bnd__2__intE1__doubleE1_ptr1__ret_voidE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
	.text
	.globl diffuse_concurrent__8__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__ret_voidE1
	.def diffuse_concurrent__8__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
diffuse_concurrent__8__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__ret_voidE1:
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
.LB8641:
	movabsq $1036831949, %r10
	movq %r10, %xmm2
	movl $254, %eax
	movaps %xmm3, %xmm0
	movl 48(%rbp), %r12d
	movslq %eax, %rax
	movq 56(%rbp), %r13
	movq 64(%rbp), %r14
	movsd 72(%rbp), %xmm1
	movl %ecx, %esi
	movq %rdx, %rdi
	movq %r8, %rbx
	cvtss2sd %xmm2, %xmm2
	mulsd %xmm2, %xmm0
	xorps %xmm2, %xmm2
	cvtsi2sdq %rax, %xmm2
	movl $190, %eax
	movslq %eax, %rax
	xorps %xmm3, %xmm3
	cvtsi2sdq %rax, %xmm3
	mulsd %xmm2, %xmm0
	mulsd %xmm3, %xmm0
	movsd %xmm0, -64(%rbp)
	movabsq $1036831949, %r10
	movq %r10, %xmm0
	cvtss2sd %xmm0, %xmm0
	mulsd %xmm1, %xmm0
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	mulsd %xmm2, %xmm0
	mulsd %xmm3, %xmm0
	movsd %xmm0, -72(%rbp)
	movabsq $1082130432, %r10
	movq %r10, %xmm0
	movsd -64(%rbp), %xmm2
	cvtss2sd %xmm0, %xmm0
	vfmadd132sd %xmm2, %xmm1, %xmm0
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	divsd %xmm15, %xmm0
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	movsd %xmm0, -80(%rbp)
	movabsq $1082130432, %r10
	movq %r10, %xmm0
	movsd -72(%rbp), %xmm2
	cvtss2sd %xmm0, %xmm0
	vfmadd132sd %xmm2, %xmm1, %xmm0
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	divsd %xmm15, %xmm0
	movsd %xmm0, -88(%rbp)
	xorl %r15d, %r15d
.LB8687:
	cmpl $20, %r15d
	jge .LB8690
.LB8688:
	movsd -80(%rbp), %xmm0
	xorl %ecx, %ecx
	movq %rdi, %rdx
	movq %rbx, %r8
	movsd %xmm0, 32(%rsp)
	movsd -64(%rbp), %xmm0
	movaps %xmm0, %xmm3
	callq dispatch_linsolve_post__5__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__doubleE1__ret_voidE1
	movsd -88(%rbp), %xmm0
	xorl %ecx, %ecx
	movq %r13, %rdx
	movq %r14, %r8
	movsd %xmm0, 32(%rsp)
	movsd -72(%rbp), %xmm0
	movaps %xmm0, %xmm3
	callq dispatch_linsolve2__5__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__doubleE1__ret_voidE1
	callq collect1__0__ret_voidE1
	callq collect2__0__ret_voidE1
	movsd -80(%rbp), %xmm0
	movl $1, %ecx
	movq %rdi, %rdx
	movq %rbx, %r8
	movsd %xmm0, 32(%rsp)
	movsd -64(%rbp), %xmm0
	movaps %xmm0, %xmm3
	callq dispatch_linsolve_post__5__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__doubleE1__ret_voidE1
	movsd -88(%rbp), %xmm0
	movl $1, %ecx
	movq %r13, %rdx
	movq %r14, %r8
	movsd %xmm0, 32(%rsp)
	movsd -72(%rbp), %xmm0
	movaps %xmm0, %xmm3
	callq dispatch_linsolve2__5__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__doubleE1__ret_voidE1
	callq collect1__0__ret_voidE1
	callq collect2__0__ret_voidE1
	cmpl $19, %r15d
	je .LB8712
.LB8714:
	incl %r15d
	cmpl $20, %r15d
	jl .LB8688
.LB8690:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB8712:
	movq %rsi, %rcx
	movq %rdi, %rdx
	callq set_bnd__2__intE1__doubleE1_ptr1__ret_voidE1
	movq %r12, %rcx
	movq %r13, %rdx
	callq set_bnd__2__intE1__doubleE1_ptr1__ret_voidE1
	jmp .LB8714
	.text
	.globl vel_step__0__ret_voidE1
	.def vel_step__0__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
vel_step__0__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
.LB8925:
	movabsq $981668463, %r10
	movq %r10, %xmm0
	movabsq $981668463, %r10
	movq %r10, %xmm1
	movq g_vx_prev(%rip), %rdx
	movq g_vx(%rip), %r8
	movq g_vy_prev(%rip), %rax
	movq g_vy(%rip), %rcx
	movq $2, 32(%rsp)
	cvtss2sd %xmm0, %xmm0
	cvtss2sd %xmm1, %xmm1
	movq %rax, 40(%rsp)
	movq %rcx, 48(%rsp)
	movl $1, %ecx
	movsd %xmm1, 56(%rsp)
	movaps %xmm0, %xmm3
	callq diffuse_concurrent__8__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__ret_voidE1
	movq g_vx_prev(%rip), %rcx
	movq g_vy_prev(%rip), %rdx
	movq g_vx(%rip), %r8
	movq g_vy(%rip), %r9
	callq project__4__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__ret_voidE1
	movq g_vx(%rip), %rcx
	movq g_vx_prev(%rip), %r8
	movq g_vy_prev(%rip), %r9
	movq %r8, %rdx
	callq dispatch_advect__4__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__ret_voidE1
	movq g_vx(%rip), %rdx
	movl $1, %ecx
	callq set_bnd__2__intE1__doubleE1_ptr1__ret_voidE1
	movq g_vy(%rip), %rcx
	movq g_vy_prev(%rip), %r9
	movq g_vx_prev(%rip), %r8
	movq %r9, %rdx
	callq dispatch_advect__4__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__ret_voidE1
	movq g_vy(%rip), %rdx
	movl $2, %ecx
	callq set_bnd__2__intE1__doubleE1_ptr1__ret_voidE1
	movq g_vx(%rip), %rcx
	movq g_vy(%rip), %rdx
	callq vorticity_confinement__2__doubleE1_ptr1__doubleE1_ptr1__ret_voidE1
	movq g_vx(%rip), %rcx
	movq g_vy(%rip), %rdx
	movq g_vx_prev(%rip), %r8
	movq g_vy_prev(%rip), %r9
	callq project__4__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__ret_voidE1
	leave
	ret
	.text
	.globl dens_step__0__ret_voidE1
	.def dens_step__0__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
dens_step__0__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB8952:
	movq g_dens_prev(%rip), %rdx
	movq g_dens(%rip), %r8
	movabsq $953267991, %r10
	movq %r10, %xmm0
	cvtss2sd %xmm0, %xmm0
	xorl %ecx, %ecx
	movaps %xmm0, %xmm3
	callq diffuse__4__intE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1__ret_voidE1
	movq g_dens(%rip), %rcx
	movq g_dens_prev(%rip), %rdx
	movq g_vx(%rip), %r8
	movq g_vy(%rip), %r9
	callq dispatch_advect__4__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__ret_voidE1
	movq g_dens(%rip), %rdx
	xorl %ecx, %ecx
	callq set_bnd__2__intE1__doubleE1_ptr1__ret_voidE1
	xorl %eax, %eax
	xorl %ecx, %ecx
	xorl %edx, %edx
	xorps %xmm0, %xmm0
	xorps %xmm1, %xmm1
.LB8967:
	cmpl $2, %edx
	jge .LB8969
.LB8968:
	movq %rcx, %rsi
	movl $1, %ecx
.LB8972:
	cmpl $191, %ecx
	jge .LB8975
.LB8973:
	movl %ecx, %eax
	shll $8, %eax
	movl $1, %esi
.LB8981:
	cmpl $255, %esi
	jge .LB8984
.LB8982:
	movq g_dens(%rip), %rdi
	leal (%rax,%rsi), %r8d
	movabsq $1118830592, %r10
	movq %r10, %xmm3
	movslq %r8d, %r9
	cvtss2sd %xmm3, %xmm3
	leaq (%rdi,%r9,8), %rdi
	movsd (%rdi), %xmm2
	ucomisd %xmm3, %xmm2
	ja .LB8996
.LB8997:
.LB8998:
	incl %esi
	cmpl $255, %esi
	jl .LB8982
	jmp .LB8984
.LB8969:
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB8975:
	incl %edx
	movq %rsi, %rcx
	cmpl $2, %edx
	jl .LB8968
	jmp .LB8969
.LB8984:
	incl %ecx
	movq %rax, %r11
	movq %rsi, %rax
	movq %r11, %rsi
	cmpl $191, %ecx
	jl .LB8973
	jmp .LB8975
.LB8996:
	movabsq $1118830592, %r10
	movq %r10, %xmm0
	leal 1(%r8), %r9d
	movabsq $1046562734, %r10
	movq %r10, %xmm1
	movslq %r9d, %r9
	cvtss2sd %xmm0, %xmm0
	cvtss2sd %xmm1, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm2, %xmm0
	subsd %xmm15, %xmm0
	movabsq $1118830592, %r10
	movq %r10, %xmm2
	cvtss2sd %xmm2, %xmm2
	mulsd %xmm0, %xmm1
	movsd %xmm2, (%rdi)
	movq g_dens(%rip), %rdi
	leaq (%rdi,%r9,8), %rdi
	leal -1(%r8), %r9d
	movslq %r9d, %r9
	movsd (%rdi), %xmm2
	addsd %xmm1, %xmm2
	movsd %xmm2, (%rdi)
	movq g_dens(%rip), %rdi
	leaq (%rdi,%r9,8), %rdi
	leal 256(%r8), %r9d
	subl $256, %r8d
	movslq %r9d, %r9
	movslq %r8d, %r8
	movsd (%rdi), %xmm2
	addsd %xmm1, %xmm2
	movsd %xmm2, (%rdi)
	movq g_dens(%rip), %rdi
	leaq (%rdi,%r9,8), %rdi
	movsd (%rdi), %xmm2
	addsd %xmm1, %xmm2
	movsd %xmm2, (%rdi)
	movq g_dens(%rip), %rdi
	leaq (%rdi,%r8,8), %rdi
	movsd (%rdi), %xmm2
	addsd %xmm1, %xmm2
	movsd %xmm2, (%rdi)
	jmp .LB8998
	.text
	.globl int_to_str__2__intE1__byteE1_ptr1__ret_intE1
	.def int_to_str__2__intE1__byteE1_ptr1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
int_to_str__2__intE1__byteE1_ptr1__ret_intE1:
	subq $32, %rsp
	movq %rbx, 16(%rsp)
	movq %rsi, 8(%rsp)
	movq %rdi, 0(%rsp)
.LB10130:
	xorl %eax, %eax
	testl %ecx, %ecx
	cmovs %eax, %ecx
	testl %ecx, %ecx
	je .LB10145
.LB10146:
	xorl %eax, %eax
.LB10155:
	testl %ecx, %ecx
	jle .LB10157
.LB10156:
	movslq %ecx, %rsi
	movabsq $3435973837, %rdi
	imulq %rsi, %rdi
	sarq $35, %rdi
	shrq $63, %rsi
	addl %edi, %esi
	imull $10, %esi, %edi
	subl %edi, %ecx
	addl $48, %ecx
	movslq %eax, %rdi
	movb %cl, (%rdx,%rdi,1)
	incl %eax
	movq %rsi, %rcx
	testl %ecx, %ecx
	jg .LB10156
.LB10157:
	movslq %eax, %rcx
	movb $0, (%rdx,%rcx,1)
	leal -1(%rax), %ecx
	movq %rcx, %rsi
	xorl %ecx, %ecx
.LB10177:
	cmpl %esi, %ecx
	jge .LB10179
.LB10178:
	movslq %ecx, %rdi
	movslq %esi, %r9
	incl %ecx
	decl %esi
	leaq (%rdx,%rdi,1), %rdi
	leaq (%rdx,%r9,1), %r9
	movzbl (%rdi), %r8d
	movzbl (%r9), %ebx
	movb %bl, (%rdi)
	movb %r8b, (%r9)
	cmpl %esi, %ecx
	jl .LB10178
.LB10179:
	movq 16(%rsp), %rbx
	movq 8(%rsp), %rsi
	movq 0(%rsp), %rdi
	addq $32, %rsp
	ret
.LB10145:
	movw $48, (%rdx)
	movl $1, %eax
	movq 16(%rsp), %rbx
	movq 8(%rsp), %rsi
	movq 0(%rsp), %rdi
	addq $32, %rsp
	ret
	.text
	.globl font_glyph__1__intE1__ret_dataE1_ptr1_ubits32
	.def font_glyph__1__intE1__ret_dataE1_ptr1_ubits32;
	.scl 2;
	.type 32;
	.endef
font_glyph__1__intE1__ret_dataE1_ptr1_ubits32:
.LB10556:
	cmpl $32, %ecx
	je .LB10560
.LB10561:
	cmpl $33, %ecx
	je .LB10566
.LB10567:
	cmpl $34, %ecx
	je .LB10572
.LB10573:
	cmpl $35, %ecx
	je .LB10578
.LB10579:
	cmpl $36, %ecx
	je .LB10584
.LB10585:
	cmpl $37, %ecx
	je .LB10590
.LB10591:
	cmpl $38, %ecx
	je .LB10596
.LB10597:
	cmpl $39, %ecx
	je .LB10602
.LB10603:
	cmpl $40, %ecx
	je .LB10608
.LB10609:
	cmpl $41, %ecx
	je .LB10614
.LB10615:
	cmpl $42, %ecx
	je .LB10620
.LB10621:
	cmpl $43, %ecx
	je .LB10626
.LB10627:
	cmpl $44, %ecx
	je .LB10632
.LB10633:
	cmpl $45, %ecx
	je .LB10638
.LB10639:
	cmpl $46, %ecx
	je .LB10644
.LB10645:
	cmpl $47, %ecx
	je .LB10650
.LB10651:
	cmpl $48, %ecx
	je .LB10656
.LB10657:
	cmpl $49, %ecx
	je .LB10662
.LB10663:
	cmpl $50, %ecx
	je .LB10668
.LB10669:
	cmpl $51, %ecx
	je .LB10674
.LB10675:
	cmpl $52, %ecx
	je .LB10680
.LB10681:
	cmpl $53, %ecx
	je .LB10686
.LB10687:
	cmpl $54, %ecx
	je .LB10692
.LB10693:
	cmpl $55, %ecx
	je .LB10698
.LB10699:
	cmpl $56, %ecx
	je .LB10704
.LB10705:
	cmpl $57, %ecx
	je .LB10710
.LB10711:
	cmpl $58, %ecx
	je .LB10716
.LB10717:
	cmpl $59, %ecx
	je .LB10722
.LB10723:
	cmpl $60, %ecx
	je .LB10728
.LB10729:
	cmpl $61, %ecx
	je .LB10734
.LB10735:
	cmpl $62, %ecx
	je .LB10740
.LB10741:
	cmpl $63, %ecx
	je .LB10746
.LB10747:
	cmpl $64, %ecx
	je .LB10752
.LB10753:
	cmpl $65, %ecx
	je .LB10758
.LB10759:
	cmpl $66, %ecx
	je .LB10764
.LB10765:
	cmpl $67, %ecx
	je .LB10770
.LB10771:
	cmpl $68, %ecx
	je .LB10776
.LB10777:
	cmpl $69, %ecx
	je .LB10782
.LB10783:
	cmpl $70, %ecx
	je .LB10788
.LB10789:
	cmpl $71, %ecx
	je .LB10794
.LB10795:
	cmpl $72, %ecx
	je .LB10800
.LB10801:
	cmpl $73, %ecx
	je .LB10806
.LB10807:
	cmpl $74, %ecx
	je .LB10812
.LB10813:
	cmpl $75, %ecx
	je .LB10818
.LB10819:
	cmpl $76, %ecx
	je .LB10824
.LB10825:
	cmpl $77, %ecx
	je .LB10830
.LB10831:
	cmpl $78, %ecx
	je .LB10836
.LB10837:
	cmpl $79, %ecx
	je .LB10842
.LB10843:
	cmpl $80, %ecx
	je .LB10848
.LB10849:
	cmpl $81, %ecx
	je .LB10854
.LB10855:
	cmpl $82, %ecx
	je .LB10860
.LB10861:
	cmpl $83, %ecx
	je .LB10866
.LB10867:
	cmpl $84, %ecx
	je .LB10872
.LB10873:
	cmpl $85, %ecx
	je .LB10878
.LB10879:
	cmpl $86, %ecx
	je .LB10884
.LB10885:
	cmpl $87, %ecx
	je .LB10890
.LB10891:
	cmpl $88, %ecx
	je .LB10896
.LB10897:
	cmpl $89, %ecx
	je .LB10902
.LB10903:
	cmpl $90, %ecx
	je .LB10908
.LB10909:
	leaq FONT_SPACE(%rip), %rax
	ret
.LB10908:
	leaq FONT_Z(%rip), %rax
	ret
.LB10902:
	leaq FONT_Y(%rip), %rax
	ret
.LB10896:
	leaq FONT_X(%rip), %rax
	ret
.LB10890:
	leaq FONT_W(%rip), %rax
	ret
.LB10884:
	leaq FONT_V(%rip), %rax
	ret
.LB10878:
	leaq FONT_U(%rip), %rax
	ret
.LB10872:
	leaq FONT_T(%rip), %rax
	ret
.LB10866:
	leaq FONT_S(%rip), %rax
	ret
.LB10860:
	leaq FONT_R(%rip), %rax
	ret
.LB10854:
	leaq FONT_Q(%rip), %rax
	ret
.LB10848:
	leaq FONT_P(%rip), %rax
	ret
.LB10842:
	leaq FONT_O(%rip), %rax
	ret
.LB10836:
	leaq FONT_N(%rip), %rax
	ret
.LB10830:
	leaq FONT_M(%rip), %rax
	ret
.LB10824:
	leaq FONT_L(%rip), %rax
	ret
.LB10818:
	leaq FONT_K(%rip), %rax
	ret
.LB10812:
	leaq FONT_J(%rip), %rax
	ret
.LB10806:
	leaq FONT_I(%rip), %rax
	ret
.LB10800:
	leaq FONT_H(%rip), %rax
	ret
.LB10794:
	leaq FONT_G(%rip), %rax
	ret
.LB10788:
	leaq FONT_F(%rip), %rax
	ret
.LB10782:
	leaq FONT_E(%rip), %rax
	ret
.LB10776:
	leaq FONT_D(%rip), %rax
	ret
.LB10770:
	leaq FONT_C(%rip), %rax
	ret
.LB10764:
	leaq FONT_B(%rip), %rax
	ret
.LB10758:
	leaq FONT_A(%rip), %rax
	ret
.LB10752:
	leaq FONT_AT(%rip), %rax
	ret
.LB10746:
	leaq FONT_QUEST(%rip), %rax
	ret
.LB10740:
	leaq FONT_GT(%rip), %rax
	ret
.LB10734:
	leaq FONT_EQ(%rip), %rax
	ret
.LB10728:
	leaq FONT_LT(%rip), %rax
	ret
.LB10722:
	leaq FONT_SEMIC(%rip), %rax
	ret
.LB10716:
	leaq FONT_COLON(%rip), %rax
	ret
.LB10710:
	leaq FONT_9(%rip), %rax
	ret
.LB10704:
	leaq FONT_8(%rip), %rax
	ret
.LB10698:
	leaq FONT_7(%rip), %rax
	ret
.LB10692:
	leaq FONT_6(%rip), %rax
	ret
.LB10686:
	leaq FONT_5(%rip), %rax
	ret
.LB10680:
	leaq FONT_4(%rip), %rax
	ret
.LB10674:
	leaq FONT_3(%rip), %rax
	ret
.LB10668:
	leaq FONT_2(%rip), %rax
	ret
.LB10662:
	leaq FONT_1(%rip), %rax
	ret
.LB10656:
	leaq FONT_0(%rip), %rax
	ret
.LB10650:
	leaq FONT_SLASH(%rip), %rax
	ret
.LB10644:
	leaq FONT_PERIOD(%rip), %rax
	ret
.LB10638:
	leaq FONT_MINUS(%rip), %rax
	ret
.LB10632:
	leaq FONT_COMMA(%rip), %rax
	ret
.LB10626:
	leaq FONT_PLUS(%rip), %rax
	ret
.LB10620:
	leaq FONT_STAR(%rip), %rax
	ret
.LB10614:
	leaq FONT_RPAREN(%rip), %rax
	ret
.LB10608:
	leaq FONT_LPAREN(%rip), %rax
	ret
.LB10602:
	leaq FONT_APOS(%rip), %rax
	ret
.LB10596:
	leaq FONT_AMP(%rip), %rax
	ret
.LB10590:
	leaq FONT_PERC(%rip), %rax
	ret
.LB10584:
	leaq FONT_DOLL(%rip), %rax
	ret
.LB10578:
	leaq FONT_HASH(%rip), %rax
	ret
.LB10572:
	leaq FONT_QUOT(%rip), %rax
	ret
.LB10566:
	leaq FONT_EXCL(%rip), %rax
	ret
.LB10560:
	leaq FONT_SPACE(%rip), %rax
	ret
	.text
	.globl draw_gui__2__intE1__intE1__ret_voidE1
	.def draw_gui__2__intE1__intE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
draw_gui__2__intE1__intE1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $112, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
.LB11237:
	movabsq $1073741824, %r10
	movq %r10, %xmm1
	movslq %ecx, %rax
	xorps %xmm0, %xmm0
	cvtsi2ssq %rax, %xmm0
	movslq %edx, %rax
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	divss %xmm15, %xmm0
	movabsq $1073741824, %r10
	movq %r10, %xmm1
	movsd %xmm0, -48(%rbp)
	xorps %xmm0, %xmm0
	cvtsi2ssq %rax, %xmm0
	movl %ecx, %eax
	sarl $31, %eax
	movl %ecx, %eax
	shrl $31, %eax
	addl %eax, %ecx
	movl %ecx, %eax
	sarl $1, %eax
	movl %eax, %esi
	movl %edx, %eax
	sarl $31, %eax
	movl %edx, %eax
	shrl $31, %eax
	addl %eax, %edx
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	divss %xmm15, %xmm0
	movl %edx, %eax
	sarl $1, %eax
	movl %eax, %edi
	movsd %xmm0, -56(%rbp)
	movl GL_TEXTURE_2D(%rip), %ecx
	callq glDisable
	movl GL_DEPTH_TEST(%rip), %ecx
	callq glDisable
	movl GL_BLEND(%rip), %ecx
	callq glEnable
	movl GL_SRC_ALPHA(%rip), %ecx
	movl GL_ONE_MINUS_SRC_ALPHA(%rip), %edx
	callq glBlendFunc
	movq $18, 32(%rsp)
	movsd -48(%rbp), %xmm0
	movq %rsi, %rcx
	movq %rdi, %rdx
	movl $110, %r8d
	movl $26, %r9d
	movss %xmm0, 40(%rsp)
	movsd -56(%rbp), %xmm0
	movss %xmm0, 48(%rsp)
	callq draw_parallelogram_btn__7__intE1__intE1__intE1__intE1__intE1__floatE1__floatE1__ret_voidE1
	leaq -35(%rbp), %rbx
	movl $1380013139, -35(%rbp)
	movl $1095180372, -31(%rbp)
	movw $17741, -27(%rbp)
	movb $0, -25(%rbp)
	movl $2, %edx
	movq %rbx, %rcx
	callq text_width__2__byteE1_ptr1__intE1__ret_intE1
	movabsq $1061158912, %r10
	movq %r10, %xmm0
	movabsq $1063339950, %r10
	movq %r10, %xmm1
	movabsq $1065353216, %r10
	movq %r10, %xmm2
	movl %eax, %ecx
	sarl $31, %ecx
	movl %eax, %ecx
	shrl $31, %ecx
	movabsq $1065353216, %r10
	movq %r10, %xmm3
	addl %ecx, %eax
	sarl $1, %eax
	subl %eax, %esi
	subl $7, %edi
	callq glColor4f
	movsd -48(%rbp), %xmm0
	movq %rbx, %rcx
	movq %rsi, %rdx
	movq %rdi, %r8
	movl $2, %r9d
	movss %xmm0, 32(%rsp)
	movsd -56(%rbp), %xmm0
	movss %xmm0, 40(%rsp)
	callq draw_text__6__byteE1_ptr1__intE1__intE1__intE1__floatE1__floatE1__ret_voidE1
	movl GL_BLEND(%rip), %ecx
	callq glDisable
	movl GL_TEXTURE_2D(%rip), %ecx
	callq glEnable
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
standard__vectors__Vec3.TLD:
	.long 96
	.long 3
	.long 0
	.long 32
	.long 32
	.long 32
	.long 32
	.long 32
	.long 64
	.long 32
	.long 32
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
WorkSlice.TLD:
	.long 1216
	.long 21
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
	.data
	.p2align 2
standard__system__windows__SW_SHOW:
	.long 5
	.data
	.p2align 2
standard__system__windows__WM_DESTROY:
	.long 2
	.data
	.p2align 2
standard__system__windows__WM_PAINT:
	.long 15
	.data
	.p2align 2
standard__system__windows__WM_ERASEBKGND:
	.long 20
	.data
	.p2align 2
standard__system__windows__WM_CLOSE:
	.long 16
	.data
	.p2align 2
standard__system__windows__WM_QUIT:
	.long 18
	.data
	.p2align 2
standard__system__windows__WM_KEYDOWN:
	.long 256
	.data
	.p2align 2
standard__system__windows__WM_MOUSEMOVE:
	.long 512
	.data
	.p2align 2
standard__system__windows__WM_LBUTTONDOWN:
	.long 513
	.data
	.p2align 2
standard__system__windows__WM_LBUTTONUP:
	.long 514
	.data
	.p2align 2
standard__system__windows__WM_RBUTTONDOWN:
	.long 516
	.data
	.p2align 2
standard__system__windows__WM_RBUTTONUP:
	.long 517
	.data
	.p2align 2
standard__system__windows__PM_REMOVE:
	.long 1
	.data
	.p2align 2
standard__system__windows__BLACK_BRUSH:
	.long 4
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
MAX_THREADS:
	.long 64
	.bss
	.p2align 3
g_dens:
	.zero 8
	.bss
	.p2align 3
g_dens_prev:
	.zero 8
	.bss
	.p2align 3
g_vx:
	.zero 8
	.bss
	.p2align 3
g_vy:
	.zero 8
	.bss
	.p2align 3
g_vx_prev:
	.zero 8
	.bss
	.p2align 3
g_vy_prev:
	.zero 8
	.bss
	.p2align 3
g_dens_tex:
	.zero 8
	.bss
	.p2align 3
g_vel_tex:
	.zero 8
	.bss
	.p2align 3
g_part_x:
	.zero 8
	.bss
	.p2align 3
g_part_y:
	.zero 8
	.data
	.p2align 2
g_rand_seed:
	.long 12345
	.bss
	.p2align 2
PHASE_LINSOLVE_RED:
	.zero 4
	.data
	.p2align 2
PHASE_LINSOLVE_BLACK:
	.long 1
	.data
	.p2align 2
PHASE_ADVECT:
	.long 2
	.data
	.p2align 2
PHASE_PROJECT_DIV:
	.long 3
	.data
	.p2align 2
PHASE_PROJECT_GRAD:
	.long 4
	.data
	.p2align 2
PHASE_DECAY:
	.long 5
	.data
	.p2align 2
PHASE_EXIT:
	.long 6
	.bss
	.p2align 4
g_slices:
	.zero 9728
	.bss
	.p2align 4
g_slices2:
	.zero 9728
	.bss
	.p2align 4
g_threads:
	.zero 768
	.bss
	.p2align 4
g_threads2:
	.zero 768
	.bss
	.p2align 4
g_work_sem:
	.zero 32
	.bss
	.p2align 4
g_done_sem:
	.zero 32
	.bss
	.p2align 4
g_work_sem2:
	.zero 32
	.bss
	.p2align 4
g_done_sem2:
	.zero 32
	.data
	.p2align 2
g_num_threads:
	.long 1
	.data
	.p2align 2
g_rows_per_thread:
	.long 1
	.bss
	.p2align 0
mouse_down:
	.zero 1
	.bss
	.p2align 2
mouse_x:
	.zero 4
	.bss
	.p2align 2
mouse_y:
	.zero 4
	.bss
	.p2align 2
mouse_px:
	.zero 4
	.bss
	.p2align 2
mouse_py:
	.zero 4
	.data
	.p2align 2
cur_w:
	.long 1024
	.data
	.p2align 2
cur_h:
	.long 768
	.bss
	.p2align 2
g_palette:
	.zero 4
	.bss
	.p2align 2
g_game_state:
	.zero 4
	.bss
	.p2align 2
g_prev_state:
	.zero 4
	.data
	.p2align 3
g_smooth_vx:
	.quad 0
	.data
	.p2align 3
g_smooth_vy:
	.quad 0
	.data
	.p2align 2
g_paddle_gy:
	.long 96
	.data
	.p2align 2
g_cpu_paddle_gy:
	.long 96
	.bss
	.p2align 0
g_jetting:
	.zero 1
	.bss
	.p2align 0
g_sucking:
	.zero 1
	.data
	.p2align 2
g_suck_charge:
	.long 0
	.data
	.p2align 2
g_ball_x:
	.long 3212836864
	.data
	.p2align 2
g_ball_y:
	.long 0
	.data
	.p2align 2
g_ball_vx:
	.long 0
	.data
	.p2align 2
g_ball_vy:
	.long 0
	.data
	.p2align 2
g_lives:
	.long 3
	.data
	.p2align 2
g_level:
	.long 1
	.data
	.p2align 4
VERT_SRC:
	.byte 35
	.byte 118
	.byte 101
	.byte 114
	.byte 115
	.byte 105
	.byte 111
	.byte 110
	.byte 32
	.byte 49
	.byte 50
	.byte 48
	.byte 10
	.byte 118
	.byte 111
	.byte 105
	.byte 100
	.byte 32
	.byte 109
	.byte 97
	.byte 105
	.byte 110
	.byte 40
	.byte 41
	.byte 32
	.byte 123
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 103
	.byte 108
	.byte 95
	.byte 84
	.byte 101
	.byte 120
	.byte 67
	.byte 111
	.byte 111
	.byte 114
	.byte 100
	.byte 91
	.byte 48
	.byte 93
	.byte 32
	.byte 61
	.byte 32
	.byte 103
	.byte 108
	.byte 95
	.byte 77
	.byte 117
	.byte 108
	.byte 116
	.byte 105
	.byte 84
	.byte 101
	.byte 120
	.byte 67
	.byte 111
	.byte 111
	.byte 114
	.byte 100
	.byte 48
	.byte 59
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 103
	.byte 108
	.byte 95
	.byte 80
	.byte 111
	.byte 115
	.byte 105
	.byte 116
	.byte 105
	.byte 111
	.byte 110
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 61
	.byte 32
	.byte 103
	.byte 108
	.byte 95
	.byte 86
	.byte 101
	.byte 114
	.byte 116
	.byte 101
	.byte 120
	.byte 59
	.byte 10
	.byte 125
	.byte 10
	.byte 0
	.data
	.p2align 4
FRAG_SRC:
	.byte 35
	.byte 118
	.byte 101
	.byte 114
	.byte 115
	.byte 105
	.byte 111
	.byte 110
	.byte 32
	.byte 49
	.byte 50
	.byte 48
	.byte 10
	.byte 117
	.byte 110
	.byte 105
	.byte 102
	.byte 111
	.byte 114
	.byte 109
	.byte 32
	.byte 115
	.byte 97
	.byte 109
	.byte 112
	.byte 108
	.byte 101
	.byte 114
	.byte 50
	.byte 68
	.byte 32
	.byte 117
	.byte 95
	.byte 100
	.byte 101
	.byte 110
	.byte 115
	.byte 59
	.byte 10
	.byte 117
	.byte 110
	.byte 105
	.byte 102
	.byte 111
	.byte 114
	.byte 109
	.byte 32
	.byte 115
	.byte 97
	.byte 109
	.byte 112
	.byte 108
	.byte 101
	.byte 114
	.byte 50
	.byte 68
	.byte 32
	.byte 117
	.byte 95
	.byte 118
	.byte 101
	.byte 108
	.byte 59
	.byte 10
	.byte 117
	.byte 110
	.byte 105
	.byte 102
	.byte 111
	.byte 114
	.byte 109
	.byte 32
	.byte 118
	.byte 101
	.byte 99
	.byte 50
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 117
	.byte 95
	.byte 114
	.byte 101
	.byte 115
	.byte 59
	.byte 10
	.byte 117
	.byte 110
	.byte 105
	.byte 102
	.byte 111
	.byte 114
	.byte 109
	.byte 32
	.byte 105
	.byte 110
	.byte 116
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 117
	.byte 95
	.byte 112
	.byte 97
	.byte 108
	.byte 101
	.byte 116
	.byte 116
	.byte 101
	.byte 59
	.byte 10
	.byte 10
	.byte 118
	.byte 111
	.byte 105
	.byte 100
	.byte 32
	.byte 109
	.byte 97
	.byte 105
	.byte 110
	.byte 40
	.byte 41
	.byte 32
	.byte 123
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 118
	.byte 101
	.byte 99
	.byte 50
	.byte 32
	.byte 117
	.byte 118
	.byte 32
	.byte 61
	.byte 32
	.byte 103
	.byte 108
	.byte 95
	.byte 84
	.byte 101
	.byte 120
	.byte 67
	.byte 111
	.byte 111
	.byte 114
	.byte 100
	.byte 91
	.byte 48
	.byte 93
	.byte 46
	.byte 120
	.byte 121
	.byte 59
	.byte 10
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 102
	.byte 108
	.byte 111
	.byte 97
	.byte 116
	.byte 32
	.byte 100
	.byte 32
	.byte 32
	.byte 61
	.byte 32
	.byte 116
	.byte 101
	.byte 120
	.byte 116
	.byte 117
	.byte 114
	.byte 101
	.byte 50
	.byte 68
	.byte 40
	.byte 117
	.byte 95
	.byte 100
	.byte 101
	.byte 110
	.byte 115
	.byte 44
	.byte 32
	.byte 117
	.byte 118
	.byte 41
	.byte 46
	.byte 114
	.byte 59
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 118
	.byte 101
	.byte 99
	.byte 50
	.byte 32
	.byte 32
	.byte 118
	.byte 32
	.byte 32
	.byte 61
	.byte 32
	.byte 116
	.byte 101
	.byte 120
	.byte 116
	.byte 117
	.byte 114
	.byte 101
	.byte 50
	.byte 68
	.byte 40
	.byte 117
	.byte 95
	.byte 118
	.byte 101
	.byte 108
	.byte 44
	.byte 32
	.byte 32
	.byte 117
	.byte 118
	.byte 41
	.byte 46
	.byte 114
	.byte 97
	.byte 32
	.byte 45
	.byte 32
	.byte 48
	.byte 46
	.byte 53
	.byte 59
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 102
	.byte 108
	.byte 111
	.byte 97
	.byte 116
	.byte 32
	.byte 118
	.byte 109
	.byte 32
	.byte 61
	.byte 32
	.byte 108
	.byte 101
	.byte 110
	.byte 103
	.byte 116
	.byte 104
	.byte 40
	.byte 118
	.byte 41
	.byte 32
	.byte 42
	.byte 32
	.byte 50
	.byte 46
	.byte 48
	.byte 59
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 102
	.byte 108
	.byte 111
	.byte 97
	.byte 116
	.byte 32
	.byte 116
	.byte 32
	.byte 32
	.byte 61
	.byte 32
	.byte 99
	.byte 108
	.byte 97
	.byte 109
	.byte 112
	.byte 40
	.byte 100
	.byte 44
	.byte 32
	.byte 48
	.byte 46
	.byte 48
	.byte 44
	.byte 32
	.byte 49
	.byte 46
	.byte 48
	.byte 41
	.byte 59
	.byte 10
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 47
	.byte 47
	.byte 32
	.byte 87
	.byte 105
	.byte 100
	.byte 101
	.byte 32
	.byte 98
	.byte 108
	.byte 111
	.byte 111
	.byte 109
	.byte 32
	.byte 45
	.byte 32
	.byte 56
	.byte 45
	.byte 116
	.byte 97
	.byte 112
	.byte 32
	.byte 103
	.byte 97
	.byte 116
	.byte 104
	.byte 101
	.byte 114
	.byte 32
	.byte 97
	.byte 116
	.byte 32
	.byte 116
	.byte 119
	.byte 111
	.byte 32
	.byte 114
	.byte 97
	.byte 100
	.byte 105
	.byte 105
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 118
	.byte 101
	.byte 99
	.byte 50
	.byte 32
	.byte 32
	.byte 112
	.byte 120
	.byte 32
	.byte 32
	.byte 32
	.byte 61
	.byte 32
	.byte 49
	.byte 46
	.byte 48
	.byte 32
	.byte 47
	.byte 32
	.byte 117
	.byte 95
	.byte 114
	.byte 101
	.byte 115
	.byte 59
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 102
	.byte 108
	.byte 111
	.byte 97
	.byte 116
	.byte 32
	.byte 98
	.byte 108
	.byte 117
	.byte 114
	.byte 32
	.byte 61
	.byte 32
	.byte 48
	.byte 46
	.byte 48
	.byte 59
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 98
	.byte 108
	.byte 117
	.byte 114
	.byte 32
	.byte 43
	.byte 61
	.byte 32
	.byte 116
	.byte 101
	.byte 120
	.byte 116
	.byte 117
	.byte 114
	.byte 101
	.byte 50
	.byte 68
	.byte 40
	.byte 117
	.byte 95
	.byte 100
	.byte 101
	.byte 110
	.byte 115
	.byte 44
	.byte 32
	.byte 117
	.byte 118
	.byte 32
	.byte 43
	.byte 32
	.byte 118
	.byte 101
	.byte 99
	.byte 50
	.byte 40
	.byte 45
	.byte 112
	.byte 120
	.byte 46
	.byte 120
	.byte 44
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 48
	.byte 46
	.byte 48
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 41
	.byte 41
	.byte 46
	.byte 114
	.byte 59
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 98
	.byte 108
	.byte 117
	.byte 114
	.byte 32
	.byte 43
	.byte 61
	.byte 32
	.byte 116
	.byte 101
	.byte 120
	.byte 116
	.byte 117
	.byte 114
	.byte 101
	.byte 50
	.byte 68
	.byte 40
	.byte 117
	.byte 95
	.byte 100
	.byte 101
	.byte 110
	.byte 115
	.byte 44
	.byte 32
	.byte 117
	.byte 118
	.byte 32
	.byte 43
	.byte 32
	.byte 118
	.byte 101
	.byte 99
	.byte 50
	.byte 40
	.byte 32
	.byte 112
	.byte 120
	.byte 46
	.byte 120
	.byte 44
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 48
	.byte 46
	.byte 48
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 41
	.byte 41
	.byte 46
	.byte 114
	.byte 59
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 98
	.byte 108
	.byte 117
	.byte 114
	.byte 32
	.byte 43
	.byte 61
	.byte 32
	.byte 116
	.byte 101
	.byte 120
	.byte 116
	.byte 117
	.byte 114
	.byte 101
	.byte 50
	.byte 68
	.byte 40
	.byte 117
	.byte 95
	.byte 100
	.byte 101
	.byte 110
	.byte 115
	.byte 44
	.byte 32
	.byte 117
	.byte 118
	.byte 32
	.byte 43
	.byte 32
	.byte 118
	.byte 101
	.byte 99
	.byte 50
	.byte 40
	.byte 32
	.byte 48
	.byte 46
	.byte 48
	.byte 44
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 45
	.byte 112
	.byte 120
	.byte 46
	.byte 121
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 41
	.byte 41
	.byte 46
	.byte 114
	.byte 59
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 98
	.byte 108
	.byte 117
	.byte 114
	.byte 32
	.byte 43
	.byte 61
	.byte 32
	.byte 116
	.byte 101
	.byte 120
	.byte 116
	.byte 117
	.byte 114
	.byte 101
	.byte 50
	.byte 68
	.byte 40
	.byte 117
	.byte 95
	.byte 100
	.byte 101
	.byte 110
	.byte 115
	.byte 44
	.byte 32
	.byte 117
	.byte 118
	.byte 32
	.byte 43
	.byte 32
	.byte 118
	.byte 101
	.byte 99
	.byte 50
	.byte 40
	.byte 32
	.byte 48
	.byte 46
	.byte 48
	.byte 44
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 112
	.byte 120
	.byte 46
	.byte 121
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 41
	.byte 41
	.byte 46
	.byte 114
	.byte 59
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 98
	.byte 108
	.byte 117
	.byte 114
	.byte 32
	.byte 43
	.byte 61
	.byte 32
	.byte 116
	.byte 101
	.byte 120
	.byte 116
	.byte 117
	.byte 114
	.byte 101
	.byte 50
	.byte 68
	.byte 40
	.byte 117
	.byte 95
	.byte 100
	.byte 101
	.byte 110
	.byte 115
	.byte 44
	.byte 32
	.byte 117
	.byte 118
	.byte 32
	.byte 43
	.byte 32
	.byte 118
	.byte 101
	.byte 99
	.byte 50
	.byte 40
	.byte 45
	.byte 112
	.byte 120
	.byte 46
	.byte 120
	.byte 42
	.byte 50
	.byte 46
	.byte 53
	.byte 44
	.byte 32
	.byte 32
	.byte 45
	.byte 112
	.byte 120
	.byte 46
	.byte 121
	.byte 42
	.byte 50
	.byte 46
	.byte 53
	.byte 32
	.byte 41
	.byte 41
	.byte 46
	.byte 114
	.byte 59
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 98
	.byte 108
	.byte 117
	.byte 114
	.byte 32
	.byte 43
	.byte 61
	.byte 32
	.byte 116
	.byte 101
	.byte 120
	.byte 116
	.byte 117
	.byte 114
	.byte 101
	.byte 50
	.byte 68
	.byte 40
	.byte 117
	.byte 95
	.byte 100
	.byte 101
	.byte 110
	.byte 115
	.byte 44
	.byte 32
	.byte 117
	.byte 118
	.byte 32
	.byte 43
	.byte 32
	.byte 118
	.byte 101
	.byte 99
	.byte 50
	.byte 40
	.byte 32
	.byte 112
	.byte 120
	.byte 46
	.byte 120
	.byte 42
	.byte 50
	.byte 46
	.byte 53
	.byte 44
	.byte 32
	.byte 32
	.byte 45
	.byte 112
	.byte 120
	.byte 46
	.byte 121
	.byte 42
	.byte 50
	.byte 46
	.byte 53
	.byte 32
	.byte 41
	.byte 41
	.byte 46
	.byte 114
	.byte 59
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 98
	.byte 108
	.byte 117
	.byte 114
	.byte 32
	.byte 43
	.byte 61
	.byte 32
	.byte 116
	.byte 101
	.byte 120
	.byte 116
	.byte 117
	.byte 114
	.byte 101
	.byte 50
	.byte 68
	.byte 40
	.byte 117
	.byte 95
	.byte 100
	.byte 101
	.byte 110
	.byte 115
	.byte 44
	.byte 32
	.byte 117
	.byte 118
	.byte 32
	.byte 43
	.byte 32
	.byte 118
	.byte 101
	.byte 99
	.byte 50
	.byte 40
	.byte 45
	.byte 112
	.byte 120
	.byte 46
	.byte 120
	.byte 42
	.byte 50
	.byte 46
	.byte 53
	.byte 44
	.byte 32
	.byte 32
	.byte 32
	.byte 112
	.byte 120
	.byte 46
	.byte 121
	.byte 42
	.byte 50
	.byte 46
	.byte 53
	.byte 32
	.byte 41
	.byte 41
	.byte 46
	.byte 114
	.byte 59
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 98
	.byte 108
	.byte 117
	.byte 114
	.byte 32
	.byte 43
	.byte 61
	.byte 32
	.byte 116
	.byte 101
	.byte 120
	.byte 116
	.byte 117
	.byte 114
	.byte 101
	.byte 50
	.byte 68
	.byte 40
	.byte 117
	.byte 95
	.byte 100
	.byte 101
	.byte 110
	.byte 115
	.byte 44
	.byte 32
	.byte 117
	.byte 118
	.byte 32
	.byte 43
	.byte 32
	.byte 118
	.byte 101
	.byte 99
	.byte 50
	.byte 40
	.byte 32
	.byte 112
	.byte 120
	.byte 46
	.byte 120
	.byte 42
	.byte 50
	.byte 46
	.byte 53
	.byte 44
	.byte 32
	.byte 32
	.byte 32
	.byte 112
	.byte 120
	.byte 46
	.byte 121
	.byte 42
	.byte 50
	.byte 46
	.byte 53
	.byte 32
	.byte 41
	.byte 41
	.byte 46
	.byte 114
	.byte 59
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 98
	.byte 108
	.byte 117
	.byte 114
	.byte 32
	.byte 42
	.byte 61
	.byte 32
	.byte 48
	.byte 46
	.byte 49
	.byte 50
	.byte 53
	.byte 59
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 102
	.byte 108
	.byte 111
	.byte 97
	.byte 116
	.byte 32
	.byte 103
	.byte 108
	.byte 111
	.byte 119
	.byte 32
	.byte 61
	.byte 32
	.byte 99
	.byte 108
	.byte 97
	.byte 109
	.byte 112
	.byte 40
	.byte 98
	.byte 108
	.byte 117
	.byte 114
	.byte 32
	.byte 42
	.byte 32
	.byte 51
	.byte 46
	.byte 48
	.byte 32
	.byte 43
	.byte 32
	.byte 118
	.byte 109
	.byte 32
	.byte 42
	.byte 32
	.byte 116
	.byte 32
	.byte 42
	.byte 32
	.byte 48
	.byte 46
	.byte 53
	.byte 44
	.byte 32
	.byte 48
	.byte 46
	.byte 48
	.byte 44
	.byte 32
	.byte 49
	.byte 46
	.byte 48
	.byte 41
	.byte 59
	.byte 10
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 118
	.byte 101
	.byte 99
	.byte 51
	.byte 32
	.byte 99
	.byte 111
	.byte 108
	.byte 32
	.byte 61
	.byte 32
	.byte 118
	.byte 101
	.byte 99
	.byte 51
	.byte 40
	.byte 48
	.byte 46
	.byte 48
	.byte 41
	.byte 59
	.byte 10
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 47
	.byte 47
	.byte 32
	.byte 49
	.byte 58
	.byte 32
	.byte 67
	.byte 108
	.byte 97
	.byte 115
	.byte 115
	.byte 105
	.byte 99
	.byte 32
	.byte 112
	.byte 108
	.byte 97
	.byte 115
	.byte 109
	.byte 97
	.byte 32
	.byte 45
	.byte 32
	.byte 98
	.byte 108
	.byte 117
	.byte 101
	.byte 47
	.byte 99
	.byte 121
	.byte 97
	.byte 110
	.byte 47
	.byte 109
	.byte 97
	.byte 103
	.byte 101
	.byte 110
	.byte 116
	.byte 97
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 105
	.byte 102
	.byte 32
	.byte 40
	.byte 117
	.byte 95
	.byte 112
	.byte 97
	.byte 108
	.byte 101
	.byte 116
	.byte 116
	.byte 101
	.byte 32
	.byte 61
	.byte 61
	.byte 32
	.byte 48
	.byte 41
	.byte 32
	.byte 123
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 99
	.byte 111
	.byte 108
	.byte 46
	.byte 114
	.byte 32
	.byte 61
	.byte 32
	.byte 48
	.byte 46
	.byte 53
	.byte 32
	.byte 45
	.byte 32
	.byte 48
	.byte 46
	.byte 53
	.byte 32
	.byte 42
	.byte 32
	.byte 99
	.byte 111
	.byte 115
	.byte 40
	.byte 51
	.byte 46
	.byte 49
	.byte 52
	.byte 49
	.byte 53
	.byte 57
	.byte 32
	.byte 42
	.byte 32
	.byte 40
	.byte 116
	.byte 32
	.byte 42
	.byte 32
	.byte 49
	.byte 46
	.byte 50
	.byte 32
	.byte 43
	.byte 32
	.byte 48
	.byte 46
	.byte 48
	.byte 41
	.byte 41
	.byte 59
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 99
	.byte 111
	.byte 108
	.byte 46
	.byte 103
	.byte 32
	.byte 61
	.byte 32
	.byte 48
	.byte 46
	.byte 53
	.byte 32
	.byte 45
	.byte 32
	.byte 48
	.byte 46
	.byte 53
	.byte 32
	.byte 42
	.byte 32
	.byte 99
	.byte 111
	.byte 115
	.byte 40
	.byte 51
	.byte 46
	.byte 49
	.byte 52
	.byte 49
	.byte 53
	.byte 57
	.byte 32
	.byte 42
	.byte 32
	.byte 40
	.byte 116
	.byte 32
	.byte 42
	.byte 32
	.byte 49
	.byte 46
	.byte 50
	.byte 32
	.byte 43
	.byte 32
	.byte 48
	.byte 46
	.byte 52
	.byte 41
	.byte 41
	.byte 59
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 99
	.byte 111
	.byte 108
	.byte 46
	.byte 98
	.byte 32
	.byte 61
	.byte 32
	.byte 48
	.byte 46
	.byte 53
	.byte 32
	.byte 45
	.byte 32
	.byte 48
	.byte 46
	.byte 53
	.byte 32
	.byte 42
	.byte 32
	.byte 99
	.byte 111
	.byte 115
	.byte 40
	.byte 51
	.byte 46
	.byte 49
	.byte 52
	.byte 49
	.byte 53
	.byte 57
	.byte 32
	.byte 42
	.byte 32
	.byte 40
	.byte 116
	.byte 32
	.byte 42
	.byte 32
	.byte 49
	.byte 46
	.byte 50
	.byte 32
	.byte 43
	.byte 32
	.byte 48
	.byte 46
	.byte 56
	.byte 41
	.byte 41
	.byte 59
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 125
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 47
	.byte 47
	.byte 32
	.byte 50
	.byte 58
	.byte 32
	.byte 70
	.byte 105
	.byte 114
	.byte 101
	.byte 32
	.byte 45
	.byte 32
	.byte 98
	.byte 108
	.byte 97
	.byte 99
	.byte 107
	.byte 32
	.byte 45
	.byte 62
	.byte 32
	.byte 114
	.byte 101
	.byte 100
	.byte 32
	.byte 45
	.byte 62
	.byte 32
	.byte 111
	.byte 114
	.byte 97
	.byte 110
	.byte 103
	.byte 101
	.byte 32
	.byte 45
	.byte 62
	.byte 32
	.byte 121
	.byte 101
	.byte 108
	.byte 108
	.byte 111
	.byte 119
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 101
	.byte 108
	.byte 115
	.byte 101
	.byte 32
	.byte 105
	.byte 102
	.byte 32
	.byte 40
	.byte 117
	.byte 95
	.byte 112
	.byte 97
	.byte 108
	.byte 101
	.byte 116
	.byte 116
	.byte 101
	.byte 32
	.byte 61
	.byte 61
	.byte 32
	.byte 49
	.byte 41
	.byte 32
	.byte 123
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 99
	.byte 111
	.byte 108
	.byte 46
	.byte 114
	.byte 32
	.byte 61
	.byte 32
	.byte 99
	.byte 108
	.byte 97
	.byte 109
	.byte 112
	.byte 40
	.byte 116
	.byte 32
	.byte 42
	.byte 32
	.byte 51
	.byte 46
	.byte 48
	.byte 44
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 48
	.byte 46
	.byte 48
	.byte 44
	.byte 32
	.byte 49
	.byte 46
	.byte 48
	.byte 41
	.byte 59
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 99
	.byte 111
	.byte 108
	.byte 46
	.byte 103
	.byte 32
	.byte 61
	.byte 32
	.byte 99
	.byte 108
	.byte 97
	.byte 109
	.byte 112
	.byte 40
	.byte 116
	.byte 32
	.byte 42
	.byte 32
	.byte 51
	.byte 46
	.byte 48
	.byte 32
	.byte 45
	.byte 32
	.byte 49
	.byte 46
	.byte 48
	.byte 44
	.byte 32
	.byte 48
	.byte 46
	.byte 48
	.byte 44
	.byte 32
	.byte 49
	.byte 46
	.byte 48
	.byte 41
	.byte 59
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 99
	.byte 111
	.byte 108
	.byte 46
	.byte 98
	.byte 32
	.byte 61
	.byte 32
	.byte 99
	.byte 108
	.byte 97
	.byte 109
	.byte 112
	.byte 40
	.byte 116
	.byte 32
	.byte 42
	.byte 32
	.byte 51
	.byte 46
	.byte 48
	.byte 32
	.byte 45
	.byte 32
	.byte 50
	.byte 46
	.byte 48
	.byte 44
	.byte 32
	.byte 48
	.byte 46
	.byte 48
	.byte 44
	.byte 32
	.byte 49
	.byte 46
	.byte 48
	.byte 41
	.byte 59
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 125
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 47
	.byte 47
	.byte 32
	.byte 51
	.byte 58
	.byte 32
	.byte 84
	.byte 111
	.byte 120
	.byte 105
	.byte 99
	.byte 32
	.byte 45
	.byte 32
	.byte 103
	.byte 114
	.byte 101
	.byte 101
	.byte 110
	.byte 47
	.byte 121
	.byte 101
	.byte 108
	.byte 108
	.byte 111
	.byte 119
	.byte 45
	.byte 103
	.byte 114
	.byte 101
	.byte 101
	.byte 110
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 101
	.byte 108
	.byte 115
	.byte 101
	.byte 32
	.byte 105
	.byte 102
	.byte 32
	.byte 40
	.byte 117
	.byte 95
	.byte 112
	.byte 97
	.byte 108
	.byte 101
	.byte 116
	.byte 116
	.byte 101
	.byte 32
	.byte 61
	.byte 61
	.byte 32
	.byte 50
	.byte 41
	.byte 32
	.byte 123
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 99
	.byte 111
	.byte 108
	.byte 46
	.byte 114
	.byte 32
	.byte 61
	.byte 32
	.byte 48
	.byte 46
	.byte 53
	.byte 32
	.byte 45
	.byte 32
	.byte 48
	.byte 46
	.byte 53
	.byte 32
	.byte 42
	.byte 32
	.byte 99
	.byte 111
	.byte 115
	.byte 40
	.byte 51
	.byte 46
	.byte 49
	.byte 52
	.byte 49
	.byte 53
	.byte 57
	.byte 32
	.byte 42
	.byte 32
	.byte 40
	.byte 116
	.byte 32
	.byte 42
	.byte 32
	.byte 49
	.byte 46
	.byte 50
	.byte 32
	.byte 43
	.byte 32
	.byte 48
	.byte 46
	.byte 57
	.byte 41
	.byte 41
	.byte 59
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 99
	.byte 111
	.byte 108
	.byte 46
	.byte 103
	.byte 32
	.byte 61
	.byte 32
	.byte 48
	.byte 46
	.byte 53
	.byte 32
	.byte 45
	.byte 32
	.byte 48
	.byte 46
	.byte 53
	.byte 32
	.byte 42
	.byte 32
	.byte 99
	.byte 111
	.byte 115
	.byte 40
	.byte 51
	.byte 46
	.byte 49
	.byte 52
	.byte 49
	.byte 53
	.byte 57
	.byte 32
	.byte 42
	.byte 32
	.byte 40
	.byte 116
	.byte 32
	.byte 42
	.byte 32
	.byte 49
	.byte 46
	.byte 50
	.byte 32
	.byte 43
	.byte 32
	.byte 48
	.byte 46
	.byte 51
	.byte 41
	.byte 41
	.byte 59
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 99
	.byte 111
	.byte 108
	.byte 46
	.byte 98
	.byte 32
	.byte 61
	.byte 32
	.byte 48
	.byte 46
	.byte 53
	.byte 32
	.byte 45
	.byte 32
	.byte 48
	.byte 46
	.byte 53
	.byte 32
	.byte 42
	.byte 32
	.byte 99
	.byte 111
	.byte 115
	.byte 40
	.byte 51
	.byte 46
	.byte 49
	.byte 52
	.byte 49
	.byte 53
	.byte 57
	.byte 32
	.byte 42
	.byte 32
	.byte 40
	.byte 116
	.byte 32
	.byte 42
	.byte 32
	.byte 49
	.byte 46
	.byte 50
	.byte 32
	.byte 43
	.byte 32
	.byte 49
	.byte 46
	.byte 51
	.byte 41
	.byte 41
	.byte 59
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 125
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 47
	.byte 47
	.byte 32
	.byte 52
	.byte 58
	.byte 32
	.byte 73
	.byte 99
	.byte 101
	.byte 32
	.byte 45
	.byte 32
	.byte 100
	.byte 101
	.byte 101
	.byte 112
	.byte 32
	.byte 98
	.byte 108
	.byte 117
	.byte 101
	.byte 32
	.byte 45
	.byte 62
	.byte 32
	.byte 99
	.byte 121
	.byte 97
	.byte 110
	.byte 32
	.byte 45
	.byte 62
	.byte 32
	.byte 119
	.byte 104
	.byte 105
	.byte 116
	.byte 101
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 101
	.byte 108
	.byte 115
	.byte 101
	.byte 32
	.byte 105
	.byte 102
	.byte 32
	.byte 40
	.byte 117
	.byte 95
	.byte 112
	.byte 97
	.byte 108
	.byte 101
	.byte 116
	.byte 116
	.byte 101
	.byte 32
	.byte 61
	.byte 61
	.byte 32
	.byte 51
	.byte 41
	.byte 32
	.byte 123
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 99
	.byte 111
	.byte 108
	.byte 46
	.byte 114
	.byte 32
	.byte 61
	.byte 32
	.byte 48
	.byte 46
	.byte 53
	.byte 32
	.byte 45
	.byte 32
	.byte 48
	.byte 46
	.byte 53
	.byte 32
	.byte 42
	.byte 32
	.byte 99
	.byte 111
	.byte 115
	.byte 40
	.byte 51
	.byte 46
	.byte 49
	.byte 52
	.byte 49
	.byte 53
	.byte 57
	.byte 32
	.byte 42
	.byte 32
	.byte 40
	.byte 116
	.byte 32
	.byte 42
	.byte 32
	.byte 49
	.byte 46
	.byte 48
	.byte 32
	.byte 43
	.byte 32
	.byte 49
	.byte 46
	.byte 48
	.byte 41
	.byte 41
	.byte 59
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 99
	.byte 111
	.byte 108
	.byte 46
	.byte 103
	.byte 32
	.byte 61
	.byte 32
	.byte 48
	.byte 46
	.byte 53
	.byte 32
	.byte 45
	.byte 32
	.byte 48
	.byte 46
	.byte 53
	.byte 32
	.byte 42
	.byte 32
	.byte 99
	.byte 111
	.byte 115
	.byte 40
	.byte 51
	.byte 46
	.byte 49
	.byte 52
	.byte 49
	.byte 53
	.byte 57
	.byte 32
	.byte 42
	.byte 32
	.byte 40
	.byte 116
	.byte 32
	.byte 42
	.byte 32
	.byte 49
	.byte 46
	.byte 48
	.byte 32
	.byte 43
	.byte 32
	.byte 48
	.byte 46
	.byte 54
	.byte 41
	.byte 41
	.byte 59
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 99
	.byte 111
	.byte 108
	.byte 46
	.byte 98
	.byte 32
	.byte 61
	.byte 32
	.byte 48
	.byte 46
	.byte 53
	.byte 32
	.byte 45
	.byte 32
	.byte 48
	.byte 46
	.byte 53
	.byte 32
	.byte 42
	.byte 32
	.byte 99
	.byte 111
	.byte 115
	.byte 40
	.byte 51
	.byte 46
	.byte 49
	.byte 52
	.byte 49
	.byte 53
	.byte 57
	.byte 32
	.byte 42
	.byte 32
	.byte 40
	.byte 116
	.byte 32
	.byte 42
	.byte 32
	.byte 49
	.byte 46
	.byte 48
	.byte 32
	.byte 43
	.byte 32
	.byte 48
	.byte 46
	.byte 49
	.byte 41
	.byte 41
	.byte 59
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 125
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 47
	.byte 47
	.byte 32
	.byte 53
	.byte 58
	.byte 32
	.byte 83
	.byte 117
	.byte 110
	.byte 115
	.byte 101
	.byte 116
	.byte 32
	.byte 45
	.byte 32
	.byte 112
	.byte 117
	.byte 114
	.byte 112
	.byte 108
	.byte 101
	.byte 32
	.byte 45
	.byte 62
	.byte 32
	.byte 109
	.byte 97
	.byte 103
	.byte 101
	.byte 110
	.byte 116
	.byte 97
	.byte 32
	.byte 45
	.byte 62
	.byte 32
	.byte 111
	.byte 114
	.byte 97
	.byte 110
	.byte 103
	.byte 101
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 101
	.byte 108
	.byte 115
	.byte 101
	.byte 32
	.byte 105
	.byte 102
	.byte 32
	.byte 40
	.byte 117
	.byte 95
	.byte 112
	.byte 97
	.byte 108
	.byte 101
	.byte 116
	.byte 116
	.byte 101
	.byte 32
	.byte 61
	.byte 61
	.byte 32
	.byte 52
	.byte 41
	.byte 32
	.byte 123
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 99
	.byte 111
	.byte 108
	.byte 46
	.byte 114
	.byte 32
	.byte 61
	.byte 32
	.byte 48
	.byte 46
	.byte 53
	.byte 32
	.byte 45
	.byte 32
	.byte 48
	.byte 46
	.byte 53
	.byte 32
	.byte 42
	.byte 32
	.byte 99
	.byte 111
	.byte 115
	.byte 40
	.byte 51
	.byte 46
	.byte 49
	.byte 52
	.byte 49
	.byte 53
	.byte 57
	.byte 32
	.byte 42
	.byte 32
	.byte 40
	.byte 116
	.byte 32
	.byte 42
	.byte 32
	.byte 49
	.byte 46
	.byte 49
	.byte 32
	.byte 43
	.byte 32
	.byte 48
	.byte 46
	.byte 49
	.byte 41
	.byte 41
	.byte 59
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 99
	.byte 111
	.byte 108
	.byte 46
	.byte 103
	.byte 32
	.byte 61
	.byte 32
	.byte 48
	.byte 46
	.byte 53
	.byte 32
	.byte 45
	.byte 32
	.byte 48
	.byte 46
	.byte 53
	.byte 32
	.byte 42
	.byte 32
	.byte 99
	.byte 111
	.byte 115
	.byte 40
	.byte 51
	.byte 46
	.byte 49
	.byte 52
	.byte 49
	.byte 53
	.byte 57
	.byte 32
	.byte 42
	.byte 32
	.byte 40
	.byte 116
	.byte 32
	.byte 42
	.byte 32
	.byte 49
	.byte 46
	.byte 49
	.byte 32
	.byte 43
	.byte 32
	.byte 48
	.byte 46
	.byte 57
	.byte 41
	.byte 41
	.byte 59
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 99
	.byte 111
	.byte 108
	.byte 46
	.byte 98
	.byte 32
	.byte 61
	.byte 32
	.byte 48
	.byte 46
	.byte 53
	.byte 32
	.byte 45
	.byte 32
	.byte 48
	.byte 46
	.byte 53
	.byte 32
	.byte 42
	.byte 32
	.byte 99
	.byte 111
	.byte 115
	.byte 40
	.byte 51
	.byte 46
	.byte 49
	.byte 52
	.byte 49
	.byte 53
	.byte 57
	.byte 32
	.byte 42
	.byte 32
	.byte 40
	.byte 116
	.byte 32
	.byte 42
	.byte 32
	.byte 49
	.byte 46
	.byte 49
	.byte 32
	.byte 43
	.byte 32
	.byte 48
	.byte 46
	.byte 53
	.byte 41
	.byte 41
	.byte 59
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 125
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 47
	.byte 47
	.byte 32
	.byte 54
	.byte 58
	.byte 32
	.byte 68
	.byte 101
	.byte 101
	.byte 112
	.byte 32
	.byte 111
	.byte 99
	.byte 101
	.byte 97
	.byte 110
	.byte 32
	.byte 45
	.byte 32
	.byte 110
	.byte 97
	.byte 118
	.byte 121
	.byte 32
	.byte 45
	.byte 62
	.byte 32
	.byte 116
	.byte 101
	.byte 97
	.byte 108
	.byte 32
	.byte 45
	.byte 62
	.byte 32
	.byte 115
	.byte 101
	.byte 97
	.byte 102
	.byte 111
	.byte 97
	.byte 109
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 101
	.byte 108
	.byte 115
	.byte 101
	.byte 32
	.byte 105
	.byte 102
	.byte 32
	.byte 40
	.byte 117
	.byte 95
	.byte 112
	.byte 97
	.byte 108
	.byte 101
	.byte 116
	.byte 116
	.byte 101
	.byte 32
	.byte 61
	.byte 61
	.byte 32
	.byte 53
	.byte 41
	.byte 32
	.byte 123
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 99
	.byte 111
	.byte 108
	.byte 46
	.byte 114
	.byte 32
	.byte 61
	.byte 32
	.byte 48
	.byte 46
	.byte 53
	.byte 32
	.byte 45
	.byte 32
	.byte 48
	.byte 46
	.byte 53
	.byte 32
	.byte 42
	.byte 32
	.byte 99
	.byte 111
	.byte 115
	.byte 40
	.byte 51
	.byte 46
	.byte 49
	.byte 52
	.byte 49
	.byte 53
	.byte 57
	.byte 32
	.byte 42
	.byte 32
	.byte 40
	.byte 116
	.byte 32
	.byte 42
	.byte 32
	.byte 49
	.byte 46
	.byte 51
	.byte 32
	.byte 43
	.byte 32
	.byte 49
	.byte 46
	.byte 50
	.byte 41
	.byte 41
	.byte 59
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 99
	.byte 111
	.byte 108
	.byte 46
	.byte 103
	.byte 32
	.byte 61
	.byte 32
	.byte 48
	.byte 46
	.byte 53
	.byte 32
	.byte 45
	.byte 32
	.byte 48
	.byte 46
	.byte 53
	.byte 32
	.byte 42
	.byte 32
	.byte 99
	.byte 111
	.byte 115
	.byte 40
	.byte 51
	.byte 46
	.byte 49
	.byte 52
	.byte 49
	.byte 53
	.byte 57
	.byte 32
	.byte 42
	.byte 32
	.byte 40
	.byte 116
	.byte 32
	.byte 42
	.byte 32
	.byte 49
	.byte 46
	.byte 51
	.byte 32
	.byte 43
	.byte 32
	.byte 48
	.byte 46
	.byte 55
	.byte 41
	.byte 41
	.byte 59
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 99
	.byte 111
	.byte 108
	.byte 46
	.byte 98
	.byte 32
	.byte 61
	.byte 32
	.byte 48
	.byte 46
	.byte 53
	.byte 32
	.byte 45
	.byte 32
	.byte 48
	.byte 46
	.byte 53
	.byte 32
	.byte 42
	.byte 32
	.byte 99
	.byte 111
	.byte 115
	.byte 40
	.byte 51
	.byte 46
	.byte 49
	.byte 52
	.byte 49
	.byte 53
	.byte 57
	.byte 32
	.byte 42
	.byte 32
	.byte 40
	.byte 116
	.byte 32
	.byte 42
	.byte 32
	.byte 49
	.byte 46
	.byte 51
	.byte 32
	.byte 43
	.byte 32
	.byte 48
	.byte 46
	.byte 50
	.byte 41
	.byte 41
	.byte 59
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 125
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 47
	.byte 47
	.byte 32
	.byte 55
	.byte 58
	.byte 32
	.byte 78
	.byte 101
	.byte 111
	.byte 110
	.byte 32
	.byte 45
	.byte 32
	.byte 104
	.byte 111
	.byte 116
	.byte 32
	.byte 112
	.byte 105
	.byte 110
	.byte 107
	.byte 32
	.byte 45
	.byte 62
	.byte 32
	.byte 112
	.byte 117
	.byte 114
	.byte 112
	.byte 108
	.byte 101
	.byte 32
	.byte 45
	.byte 62
	.byte 32
	.byte 101
	.byte 108
	.byte 101
	.byte 99
	.byte 116
	.byte 114
	.byte 105
	.byte 99
	.byte 32
	.byte 98
	.byte 108
	.byte 117
	.byte 101
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 101
	.byte 108
	.byte 115
	.byte 101
	.byte 32
	.byte 105
	.byte 102
	.byte 32
	.byte 40
	.byte 117
	.byte 95
	.byte 112
	.byte 97
	.byte 108
	.byte 101
	.byte 116
	.byte 116
	.byte 101
	.byte 32
	.byte 61
	.byte 61
	.byte 32
	.byte 54
	.byte 41
	.byte 32
	.byte 123
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 99
	.byte 111
	.byte 108
	.byte 46
	.byte 114
	.byte 32
	.byte 61
	.byte 32
	.byte 48
	.byte 46
	.byte 53
	.byte 32
	.byte 45
	.byte 32
	.byte 48
	.byte 46
	.byte 53
	.byte 32
	.byte 42
	.byte 32
	.byte 99
	.byte 111
	.byte 115
	.byte 40
	.byte 51
	.byte 46
	.byte 49
	.byte 52
	.byte 49
	.byte 53
	.byte 57
	.byte 32
	.byte 42
	.byte 32
	.byte 40
	.byte 116
	.byte 32
	.byte 42
	.byte 32
	.byte 49
	.byte 46
	.byte 52
	.byte 32
	.byte 43
	.byte 32
	.byte 48
	.byte 46
	.byte 50
	.byte 41
	.byte 41
	.byte 59
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 99
	.byte 111
	.byte 108
	.byte 46
	.byte 103
	.byte 32
	.byte 61
	.byte 32
	.byte 48
	.byte 46
	.byte 53
	.byte 32
	.byte 45
	.byte 32
	.byte 48
	.byte 46
	.byte 53
	.byte 32
	.byte 42
	.byte 32
	.byte 99
	.byte 111
	.byte 115
	.byte 40
	.byte 51
	.byte 46
	.byte 49
	.byte 52
	.byte 49
	.byte 53
	.byte 57
	.byte 32
	.byte 42
	.byte 32
	.byte 40
	.byte 116
	.byte 32
	.byte 42
	.byte 32
	.byte 49
	.byte 46
	.byte 52
	.byte 32
	.byte 43
	.byte 32
	.byte 49
	.byte 46
	.byte 49
	.byte 41
	.byte 41
	.byte 59
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 99
	.byte 111
	.byte 108
	.byte 46
	.byte 98
	.byte 32
	.byte 61
	.byte 32
	.byte 48
	.byte 46
	.byte 53
	.byte 32
	.byte 45
	.byte 32
	.byte 48
	.byte 46
	.byte 53
	.byte 32
	.byte 42
	.byte 32
	.byte 99
	.byte 111
	.byte 115
	.byte 40
	.byte 51
	.byte 46
	.byte 49
	.byte 52
	.byte 49
	.byte 53
	.byte 57
	.byte 32
	.byte 42
	.byte 32
	.byte 40
	.byte 116
	.byte 32
	.byte 42
	.byte 32
	.byte 49
	.byte 46
	.byte 52
	.byte 32
	.byte 43
	.byte 32
	.byte 48
	.byte 46
	.byte 54
	.byte 41
	.byte 41
	.byte 59
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 125
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 47
	.byte 47
	.byte 32
	.byte 56
	.byte 58
	.byte 32
	.byte 71
	.byte 111
	.byte 108
	.byte 100
	.byte 32
	.byte 45
	.byte 32
	.byte 98
	.byte 114
	.byte 111
	.byte 119
	.byte 110
	.byte 32
	.byte 45
	.byte 62
	.byte 32
	.byte 103
	.byte 111
	.byte 108
	.byte 100
	.byte 32
	.byte 45
	.byte 62
	.byte 32
	.byte 98
	.byte 114
	.byte 105
	.byte 103
	.byte 104
	.byte 116
	.byte 32
	.byte 121
	.byte 101
	.byte 108
	.byte 108
	.byte 111
	.byte 119
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 101
	.byte 108
	.byte 115
	.byte 101
	.byte 32
	.byte 105
	.byte 102
	.byte 32
	.byte 40
	.byte 117
	.byte 95
	.byte 112
	.byte 97
	.byte 108
	.byte 101
	.byte 116
	.byte 116
	.byte 101
	.byte 32
	.byte 61
	.byte 61
	.byte 32
	.byte 55
	.byte 41
	.byte 32
	.byte 123
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 99
	.byte 111
	.byte 108
	.byte 46
	.byte 114
	.byte 32
	.byte 61
	.byte 32
	.byte 99
	.byte 108
	.byte 97
	.byte 109
	.byte 112
	.byte 40
	.byte 116
	.byte 32
	.byte 42
	.byte 32
	.byte 50
	.byte 46
	.byte 53
	.byte 44
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 48
	.byte 46
	.byte 48
	.byte 44
	.byte 32
	.byte 49
	.byte 46
	.byte 48
	.byte 41
	.byte 59
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 99
	.byte 111
	.byte 108
	.byte 46
	.byte 103
	.byte 32
	.byte 61
	.byte 32
	.byte 99
	.byte 108
	.byte 97
	.byte 109
	.byte 112
	.byte 40
	.byte 116
	.byte 32
	.byte 42
	.byte 32
	.byte 50
	.byte 46
	.byte 53
	.byte 32
	.byte 45
	.byte 32
	.byte 48
	.byte 46
	.byte 52
	.byte 44
	.byte 32
	.byte 48
	.byte 46
	.byte 48
	.byte 44
	.byte 32
	.byte 49
	.byte 46
	.byte 48
	.byte 41
	.byte 59
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 99
	.byte 111
	.byte 108
	.byte 46
	.byte 98
	.byte 32
	.byte 61
	.byte 32
	.byte 99
	.byte 108
	.byte 97
	.byte 109
	.byte 112
	.byte 40
	.byte 116
	.byte 32
	.byte 42
	.byte 32
	.byte 51
	.byte 46
	.byte 48
	.byte 32
	.byte 45
	.byte 32
	.byte 50
	.byte 46
	.byte 50
	.byte 44
	.byte 32
	.byte 48
	.byte 46
	.byte 48
	.byte 44
	.byte 32
	.byte 48
	.byte 46
	.byte 51
	.byte 41
	.byte 59
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 125
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 47
	.byte 47
	.byte 32
	.byte 57
	.byte 58
	.byte 32
	.byte 77
	.byte 111
	.byte 110
	.byte 111
	.byte 99
	.byte 104
	.byte 114
	.byte 111
	.byte 109
	.byte 101
	.byte 32
	.byte 45
	.byte 32
	.byte 119
	.byte 104
	.byte 105
	.byte 116
	.byte 101
	.byte 32
	.byte 99
	.byte 111
	.byte 114
	.byte 101
	.byte 32
	.byte 119
	.byte 105
	.byte 116
	.byte 104
	.byte 32
	.byte 115
	.byte 111
	.byte 102
	.byte 116
	.byte 32
	.byte 104
	.byte 97
	.byte 108
	.byte 111
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 101
	.byte 108
	.byte 115
	.byte 101
	.byte 32
	.byte 105
	.byte 102
	.byte 32
	.byte 40
	.byte 117
	.byte 95
	.byte 112
	.byte 97
	.byte 108
	.byte 101
	.byte 116
	.byte 116
	.byte 101
	.byte 32
	.byte 61
	.byte 61
	.byte 32
	.byte 56
	.byte 41
	.byte 32
	.byte 123
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 102
	.byte 108
	.byte 111
	.byte 97
	.byte 116
	.byte 32
	.byte 108
	.byte 117
	.byte 109
	.byte 32
	.byte 61
	.byte 32
	.byte 116
	.byte 32
	.byte 42
	.byte 32
	.byte 116
	.byte 32
	.byte 42
	.byte 32
	.byte 50
	.byte 46
	.byte 48
	.byte 59
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 99
	.byte 111
	.byte 108
	.byte 32
	.byte 61
	.byte 32
	.byte 118
	.byte 101
	.byte 99
	.byte 51
	.byte 40
	.byte 99
	.byte 108
	.byte 97
	.byte 109
	.byte 112
	.byte 40
	.byte 108
	.byte 117
	.byte 109
	.byte 44
	.byte 32
	.byte 48
	.byte 46
	.byte 48
	.byte 44
	.byte 32
	.byte 49
	.byte 46
	.byte 48
	.byte 41
	.byte 41
	.byte 59
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 125
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 47
	.byte 47
	.byte 32
	.byte 48
	.byte 58
	.byte 32
	.byte 82
	.byte 97
	.byte 105
	.byte 110
	.byte 98
	.byte 111
	.byte 119
	.byte 32
	.byte 45
	.byte 32
	.byte 102
	.byte 117
	.byte 108
	.byte 108
	.byte 32
	.byte 104
	.byte 117
	.byte 101
	.byte 32
	.byte 99
	.byte 121
	.byte 99
	.byte 108
	.byte 101
	.byte 32
	.byte 97
	.byte 99
	.byte 114
	.byte 111
	.byte 115
	.byte 115
	.byte 32
	.byte 100
	.byte 101
	.byte 110
	.byte 115
	.byte 105
	.byte 116
	.byte 121
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 101
	.byte 108
	.byte 115
	.byte 101
	.byte 32
	.byte 123
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 102
	.byte 108
	.byte 111
	.byte 97
	.byte 116
	.byte 32
	.byte 104
	.byte 32
	.byte 61
	.byte 32
	.byte 116
	.byte 32
	.byte 42
	.byte 32
	.byte 54
	.byte 46
	.byte 48
	.byte 59
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 102
	.byte 108
	.byte 111
	.byte 97
	.byte 116
	.byte 32
	.byte 102
	.byte 32
	.byte 61
	.byte 32
	.byte 99
	.byte 108
	.byte 97
	.byte 109
	.byte 112
	.byte 40
	.byte 104
	.byte 32
	.byte 45
	.byte 32
	.byte 102
	.byte 108
	.byte 111
	.byte 111
	.byte 114
	.byte 40
	.byte 104
	.byte 41
	.byte 44
	.byte 32
	.byte 48
	.byte 46
	.byte 48
	.byte 44
	.byte 32
	.byte 49
	.byte 46
	.byte 48
	.byte 41
	.byte 59
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 105
	.byte 102
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 40
	.byte 104
	.byte 32
	.byte 60
	.byte 32
	.byte 49
	.byte 46
	.byte 48
	.byte 41
	.byte 32
	.byte 123
	.byte 32
	.byte 99
	.byte 111
	.byte 108
	.byte 32
	.byte 61
	.byte 32
	.byte 118
	.byte 101
	.byte 99
	.byte 51
	.byte 40
	.byte 49
	.byte 46
	.byte 48
	.byte 44
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 102
	.byte 44
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 48
	.byte 46
	.byte 48
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 41
	.byte 59
	.byte 32
	.byte 125
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 101
	.byte 108
	.byte 115
	.byte 101
	.byte 32
	.byte 105
	.byte 102
	.byte 32
	.byte 40
	.byte 104
	.byte 32
	.byte 60
	.byte 32
	.byte 50
	.byte 46
	.byte 48
	.byte 41
	.byte 32
	.byte 123
	.byte 32
	.byte 99
	.byte 111
	.byte 108
	.byte 32
	.byte 61
	.byte 32
	.byte 118
	.byte 101
	.byte 99
	.byte 51
	.byte 40
	.byte 49
	.byte 46
	.byte 48
	.byte 45
	.byte 102
	.byte 44
	.byte 32
	.byte 32
	.byte 32
	.byte 49
	.byte 46
	.byte 48
	.byte 44
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 48
	.byte 46
	.byte 48
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 41
	.byte 59
	.byte 32
	.byte 125
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 101
	.byte 108
	.byte 115
	.byte 101
	.byte 32
	.byte 105
	.byte 102
	.byte 32
	.byte 40
	.byte 104
	.byte 32
	.byte 60
	.byte 32
	.byte 51
	.byte 46
	.byte 48
	.byte 41
	.byte 32
	.byte 123
	.byte 32
	.byte 99
	.byte 111
	.byte 108
	.byte 32
	.byte 61
	.byte 32
	.byte 118
	.byte 101
	.byte 99
	.byte 51
	.byte 40
	.byte 48
	.byte 46
	.byte 48
	.byte 44
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 49
	.byte 46
	.byte 48
	.byte 44
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 102
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 41
	.byte 59
	.byte 32
	.byte 125
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 101
	.byte 108
	.byte 115
	.byte 101
	.byte 32
	.byte 105
	.byte 102
	.byte 32
	.byte 40
	.byte 104
	.byte 32
	.byte 60
	.byte 32
	.byte 52
	.byte 46
	.byte 48
	.byte 41
	.byte 32
	.byte 123
	.byte 32
	.byte 99
	.byte 111
	.byte 108
	.byte 32
	.byte 61
	.byte 32
	.byte 118
	.byte 101
	.byte 99
	.byte 51
	.byte 40
	.byte 48
	.byte 46
	.byte 48
	.byte 44
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 49
	.byte 46
	.byte 48
	.byte 45
	.byte 102
	.byte 44
	.byte 32
	.byte 32
	.byte 32
	.byte 49
	.byte 46
	.byte 48
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 41
	.byte 59
	.byte 32
	.byte 125
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 101
	.byte 108
	.byte 115
	.byte 101
	.byte 32
	.byte 105
	.byte 102
	.byte 32
	.byte 40
	.byte 104
	.byte 32
	.byte 60
	.byte 32
	.byte 53
	.byte 46
	.byte 48
	.byte 41
	.byte 32
	.byte 123
	.byte 32
	.byte 99
	.byte 111
	.byte 108
	.byte 32
	.byte 61
	.byte 32
	.byte 118
	.byte 101
	.byte 99
	.byte 51
	.byte 40
	.byte 102
	.byte 44
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 48
	.byte 46
	.byte 48
	.byte 44
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 49
	.byte 46
	.byte 48
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 41
	.byte 59
	.byte 32
	.byte 125
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 101
	.byte 108
	.byte 115
	.byte 101
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 123
	.byte 32
	.byte 99
	.byte 111
	.byte 108
	.byte 32
	.byte 61
	.byte 32
	.byte 118
	.byte 101
	.byte 99
	.byte 51
	.byte 40
	.byte 49
	.byte 46
	.byte 48
	.byte 44
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 48
	.byte 46
	.byte 48
	.byte 44
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 49
	.byte 46
	.byte 48
	.byte 45
	.byte 102
	.byte 32
	.byte 32
	.byte 32
	.byte 41
	.byte 59
	.byte 32
	.byte 125
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 99
	.byte 111
	.byte 108
	.byte 32
	.byte 42
	.byte 61
	.byte 32
	.byte 116
	.byte 59
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 125
	.byte 10
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 47
	.byte 47
	.byte 32
	.byte 83
	.byte 97
	.byte 116
	.byte 117
	.byte 114
	.byte 97
	.byte 116
	.byte 105
	.byte 111
	.byte 110
	.byte 32
	.byte 98
	.byte 111
	.byte 111
	.byte 115
	.byte 116
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 102
	.byte 108
	.byte 111
	.byte 97
	.byte 116
	.byte 32
	.byte 103
	.byte 114
	.byte 101
	.byte 121
	.byte 32
	.byte 61
	.byte 32
	.byte 100
	.byte 111
	.byte 116
	.byte 40
	.byte 99
	.byte 111
	.byte 108
	.byte 44
	.byte 32
	.byte 118
	.byte 101
	.byte 99
	.byte 51
	.byte 40
	.byte 48
	.byte 46
	.byte 50
	.byte 57
	.byte 57
	.byte 44
	.byte 32
	.byte 48
	.byte 46
	.byte 53
	.byte 56
	.byte 55
	.byte 44
	.byte 32
	.byte 48
	.byte 46
	.byte 49
	.byte 49
	.byte 52
	.byte 41
	.byte 41
	.byte 59
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 99
	.byte 111
	.byte 108
	.byte 32
	.byte 61
	.byte 32
	.byte 109
	.byte 105
	.byte 120
	.byte 40
	.byte 118
	.byte 101
	.byte 99
	.byte 51
	.byte 40
	.byte 103
	.byte 114
	.byte 101
	.byte 121
	.byte 41
	.byte 44
	.byte 32
	.byte 99
	.byte 111
	.byte 108
	.byte 44
	.byte 32
	.byte 49
	.byte 46
	.byte 56
	.byte 41
	.byte 59
	.byte 10
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 47
	.byte 47
	.byte 32
	.byte 65
	.byte 100
	.byte 100
	.byte 105
	.byte 116
	.byte 105
	.byte 118
	.byte 101
	.byte 32
	.byte 103
	.byte 108
	.byte 111
	.byte 119
	.byte 32
	.byte 104
	.byte 97
	.byte 108
	.byte 111
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 99
	.byte 111
	.byte 108
	.byte 32
	.byte 43
	.byte 61
	.byte 32
	.byte 99
	.byte 111
	.byte 108
	.byte 32
	.byte 42
	.byte 32
	.byte 103
	.byte 108
	.byte 111
	.byte 119
	.byte 32
	.byte 42
	.byte 32
	.byte 49
	.byte 46
	.byte 52
	.byte 59
	.byte 10
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 47
	.byte 47
	.byte 32
	.byte 86
	.byte 101
	.byte 108
	.byte 111
	.byte 99
	.byte 105
	.byte 116
	.byte 121
	.byte 32
	.byte 115
	.byte 104
	.byte 105
	.byte 109
	.byte 109
	.byte 101
	.byte 114
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 99
	.byte 111
	.byte 108
	.byte 32
	.byte 43
	.byte 61
	.byte 32
	.byte 118
	.byte 101
	.byte 99
	.byte 51
	.byte 40
	.byte 48
	.byte 46
	.byte 48
	.byte 56
	.byte 44
	.byte 32
	.byte 48
	.byte 46
	.byte 50
	.byte 44
	.byte 32
	.byte 48
	.byte 46
	.byte 52
	.byte 41
	.byte 32
	.byte 42
	.byte 32
	.byte 118
	.byte 109
	.byte 32
	.byte 42
	.byte 32
	.byte 100
	.byte 32
	.byte 42
	.byte 32
	.byte 48
	.byte 46
	.byte 54
	.byte 59
	.byte 10
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 99
	.byte 111
	.byte 108
	.byte 32
	.byte 42
	.byte 61
	.byte 32
	.byte 116
	.byte 59
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 102
	.byte 108
	.byte 111
	.byte 97
	.byte 116
	.byte 32
	.byte 97
	.byte 108
	.byte 112
	.byte 104
	.byte 97
	.byte 32
	.byte 61
	.byte 32
	.byte 99
	.byte 108
	.byte 97
	.byte 109
	.byte 112
	.byte 40
	.byte 116
	.byte 32
	.byte 42
	.byte 32
	.byte 56
	.byte 46
	.byte 48
	.byte 44
	.byte 32
	.byte 48
	.byte 46
	.byte 48
	.byte 44
	.byte 32
	.byte 49
	.byte 46
	.byte 48
	.byte 41
	.byte 59
	.byte 10
	.byte 32
	.byte 32
	.byte 32
	.byte 32
	.byte 103
	.byte 108
	.byte 95
	.byte 70
	.byte 114
	.byte 97
	.byte 103
	.byte 67
	.byte 111
	.byte 108
	.byte 111
	.byte 114
	.byte 32
	.byte 61
	.byte 32
	.byte 118
	.byte 101
	.byte 99
	.byte 52
	.byte 40
	.byte 99
	.byte 111
	.byte 108
	.byte 44
	.byte 32
	.byte 97
	.byte 108
	.byte 112
	.byte 104
	.byte 97
	.byte 41
	.byte 59
	.byte 10
	.byte 125
	.byte 10
	.byte 0
	.data
	.p2align 4
FONT_SPACE:
	.long 0
	.long 0
	.long 0
	.long 0
	.long 0
	.data
	.p2align 4
FONT_EXCL:
	.long 0
	.long 0
	.long 95
	.long 0
	.long 0
	.data
	.p2align 4
FONT_QUOT:
	.long 0
	.long 7
	.long 0
	.long 7
	.long 0
	.data
	.p2align 4
FONT_HASH:
	.long 20
	.long 127
	.long 20
	.long 127
	.long 20
	.data
	.p2align 4
FONT_DOLL:
	.long 36
	.long 42
	.long 127
	.long 42
	.long 18
	.data
	.p2align 4
FONT_PERC:
	.long 35
	.long 19
	.long 8
	.long 100
	.long 98
	.data
	.p2align 4
FONT_AMP:
	.long 54
	.long 73
	.long 85
	.long 34
	.long 80
	.data
	.p2align 4
FONT_APOS:
	.long 0
	.long 5
	.long 3
	.long 0
	.long 0
	.data
	.p2align 4
FONT_LPAREN:
	.long 0
	.long 28
	.long 34
	.long 65
	.long 0
	.data
	.p2align 4
FONT_RPAREN:
	.long 0
	.long 65
	.long 34
	.long 28
	.long 0
	.data
	.p2align 4
FONT_STAR:
	.long 20
	.long 8
	.long 62
	.long 8
	.long 20
	.data
	.p2align 4
FONT_PLUS:
	.long 8
	.long 8
	.long 62
	.long 8
	.long 8
	.data
	.p2align 4
FONT_COMMA:
	.long 0
	.long 80
	.long 48
	.long 0
	.long 0
	.data
	.p2align 4
FONT_MINUS:
	.long 8
	.long 8
	.long 8
	.long 8
	.long 8
	.data
	.p2align 4
FONT_PERIOD:
	.long 0
	.long 96
	.long 96
	.long 0
	.long 0
	.data
	.p2align 4
FONT_SLASH:
	.long 32
	.long 16
	.long 8
	.long 4
	.long 2
	.data
	.p2align 4
FONT_0:
	.long 62
	.long 81
	.long 73
	.long 69
	.long 62
	.data
	.p2align 4
FONT_1:
	.long 0
	.long 66
	.long 127
	.long 64
	.long 0
	.data
	.p2align 4
FONT_2:
	.long 66
	.long 97
	.long 81
	.long 73
	.long 70
	.data
	.p2align 4
FONT_3:
	.long 33
	.long 65
	.long 69
	.long 75
	.long 49
	.data
	.p2align 4
FONT_4:
	.long 24
	.long 20
	.long 18
	.long 127
	.long 16
	.data
	.p2align 4
FONT_5:
	.long 39
	.long 69
	.long 69
	.long 69
	.long 57
	.data
	.p2align 4
FONT_6:
	.long 60
	.long 74
	.long 73
	.long 73
	.long 48
	.data
	.p2align 4
FONT_7:
	.long 1
	.long 113
	.long 9
	.long 5
	.long 3
	.data
	.p2align 4
FONT_8:
	.long 54
	.long 73
	.long 73
	.long 73
	.long 54
	.data
	.p2align 4
FONT_9:
	.long 6
	.long 73
	.long 73
	.long 41
	.long 30
	.data
	.p2align 4
FONT_COLON:
	.long 0
	.long 54
	.long 54
	.long 0
	.long 0
	.data
	.p2align 4
FONT_SEMIC:
	.long 0
	.long 86
	.long 54
	.long 0
	.long 0
	.data
	.p2align 4
FONT_LT:
	.long 8
	.long 20
	.long 34
	.long 65
	.long 0
	.data
	.p2align 4
FONT_EQ:
	.long 20
	.long 20
	.long 20
	.long 20
	.long 20
	.data
	.p2align 4
FONT_GT:
	.long 0
	.long 65
	.long 34
	.long 20
	.long 8
	.data
	.p2align 4
FONT_QUEST:
	.long 2
	.long 1
	.long 81
	.long 9
	.long 6
	.data
	.p2align 4
FONT_AT:
	.long 50
	.long 73
	.long 121
	.long 65
	.long 62
	.data
	.p2align 4
FONT_A:
	.long 126
	.long 17
	.long 17
	.long 17
	.long 126
	.data
	.p2align 4
FONT_B:
	.long 127
	.long 73
	.long 73
	.long 73
	.long 54
	.data
	.p2align 4
FONT_C:
	.long 62
	.long 65
	.long 65
	.long 65
	.long 34
	.data
	.p2align 4
FONT_D:
	.long 127
	.long 65
	.long 65
	.long 34
	.long 28
	.data
	.p2align 4
FONT_E:
	.long 127
	.long 73
	.long 73
	.long 73
	.long 65
	.data
	.p2align 4
FONT_F:
	.long 127
	.long 9
	.long 9
	.long 9
	.long 1
	.data
	.p2align 4
FONT_G:
	.long 62
	.long 65
	.long 73
	.long 73
	.long 122
	.data
	.p2align 4
FONT_H:
	.long 127
	.long 8
	.long 8
	.long 8
	.long 127
	.data
	.p2align 4
FONT_I:
	.long 0
	.long 65
	.long 127
	.long 65
	.long 0
	.data
	.p2align 4
FONT_J:
	.long 32
	.long 64
	.long 65
	.long 63
	.long 1
	.data
	.p2align 4
FONT_K:
	.long 127
	.long 8
	.long 20
	.long 34
	.long 65
	.data
	.p2align 4
FONT_L:
	.long 127
	.long 64
	.long 64
	.long 64
	.long 64
	.data
	.p2align 4
FONT_M:
	.long 127
	.long 2
	.long 12
	.long 2
	.long 127
	.data
	.p2align 4
FONT_N:
	.long 127
	.long 4
	.long 8
	.long 16
	.long 127
	.data
	.p2align 4
FONT_O:
	.long 62
	.long 65
	.long 65
	.long 65
	.long 62
	.data
	.p2align 4
FONT_P:
	.long 127
	.long 9
	.long 9
	.long 9
	.long 6
	.data
	.p2align 4
FONT_Q:
	.long 62
	.long 65
	.long 81
	.long 33
	.long 94
	.data
	.p2align 4
FONT_R:
	.long 127
	.long 9
	.long 25
	.long 41
	.long 70
	.data
	.p2align 4
FONT_S:
	.long 70
	.long 73
	.long 73
	.long 73
	.long 49
	.data
	.p2align 4
FONT_T:
	.long 1
	.long 1
	.long 127
	.long 1
	.long 1
	.data
	.p2align 4
FONT_U:
	.long 63
	.long 64
	.long 64
	.long 64
	.long 63
	.data
	.p2align 4
FONT_V:
	.long 31
	.long 32
	.long 64
	.long 32
	.long 31
	.data
	.p2align 4
FONT_W:
	.long 63
	.long 64
	.long 56
	.long 64
	.long 63
	.data
	.p2align 4
FONT_X:
	.long 99
	.long 20
	.long 8
	.long 20
	.long 99
	.data
	.p2align 4
FONT_Y:
	.long 7
	.long 8
	.long 112
	.long 8
	.long 7
	.data
	.p2align 4
FONT_Z:
	.long 97
	.long 81
	.long 73
	.long 69
	.long 67
	.section .rdata,"dr"
	.p2align 4
.LZERO:
	.zero 80
