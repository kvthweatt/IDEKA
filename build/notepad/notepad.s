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
.LB5960:
	testq %rdx, %rdx
	je .LB5962
.LB5961:
	movb %al, (%rcx,%rsi,1)
	movb %al, 1(%rcx,%rsi,1)
	movb %al, 2(%rcx,%rsi,1)
	movb %al, 3(%rcx,%rsi,1)
	addq $4, %rsi
	decq %rdx
	jne .LB5961
.LB5962:
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
	je .LB5874
.LB5875:
	movq 16(%rax), %rcx
	movq 8(%rax), %r8
	movq (%rax), %r9
	leaq (%rcx,%rdi), %rdx
	leaq (%r9,%rcx,1), %rcx
	movq %rdx, 16(%rax)
	xorl %eax, %eax
	cmpq %r8, %rdx
	cmovbe %rcx, %rax
.LB5871:
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
.LB5874:
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
	je .LB5869
.LB5870:
	movq 16(%rax), %rcx
	leaq (%rcx,%rdi), %rdx
	movq 8(%rax), %rdi
	movq (%rax), %r8
	leaq (%r8,%rcx,1), %rcx
	movq %rdx, 16(%rax)
	xorl %eax, %eax
	cmpq %rdi, %rdx
	cmovbe %rcx, %rax
.LB5866:
	testq %rax, %rax
	je .LB1120
.LB1121:
	movq %rax, %rdi
	jmp .LB1100
.LB5869:
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
	je .LB5879
.LB5880:
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
.LB5881:
	movslq %edx, %rdi
	shlq $5, %rdi
	movq (%rax,%rdi,1), %rdi
	testq %rdi, %rdi
	je .LB5883
.LB5882:
	cmpq %rsi, %rdi
	je .LB5885
.LB5886:
	incq %rdx
	andq %rcx, %rdx
	jmp .LB5881
.LB5883:
	xorl %eax, %eax
.LB5876:
	testq %rax, %rax
	je .LB1167
.LB1168:
	movq 8(%rax), %rcx
	cmpq $1, 16(%rax)
	je .LB1188
.LB1189:
	movq $3, 16(%rax)
	cmpq $8, %rcx
	ja .LB5892
.LB5893:
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
.LB5885:
	shlq $5, %rdx
	leaq (%rax,%rdx,1), %rax
	jmp .LB5876
.LB5879:
	xorl %eax, %eax
	jmp .LB5876
.LB5892:
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
.LB5963:
	movl $1, %eax
	ret
.LB1209:
	cmpb $9, %cl
	jne .LB1214
.LB5964:
	movl $1, %eax
	ret
.LB1214:
	cmpb $10, %cl
	jne .LB1219
.LB5965:
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
.LB5966:
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
.LB5967:
	movl $1, %eax
	ret
.LB1242:
	cmpb $65, %cl
	jge .LB1246
.LB5968:
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
.LB5969:
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
.LB5970:
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
	jne .LS5972f
.LS5972l:
	addq $32, %rdx
	vpcmpeqb (%rdx), %ymm15, %ymm0
	vpmovmskb %ymm0, %r9d
	testl %r9d, %r9d
	je .LS5972l
	tzcntl %r9d, %r9d
	addq %rdx, %r9
	subq %rax, %r9
	jmp .LS5972d
.LS5972f:
	tzcntl %r9d, %r9d
.LS5972d:
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
.LB5971:
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
	jmp .LB5971
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
	jne .LS5973f
.LS5973l:
	addq $32, %rdx
	vpcmpeqb (%rdx), %ymm15, %ymm0
	vpmovmskb %ymm0, %r8d
	testl %r8d, %r8d
	je .LS5973l
	tzcntl %r8d, %r8d
	addq %rdx, %r8
	subq %rax, %r8
	jmp .LS5973d
.LS5973f:
	tzcntl %r8d, %r8d
.LS5973d:
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
	jne .LS5976f
.LS5976l:
	addq $32, %rdx
	vpcmpeqb (%rdx), %ymm15, %ymm0
	vpmovmskb %ymm0, %edi
	testl %edi, %edi
	je .LS5976l
	tzcntl %edi, %edi
	addq %rdx, %rdi
	subq %rax, %rdi
	jmp .LS5976d
.LS5976f:
	tzcntl %edi, %edi
.LS5976d:
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
	jge .LB5974
.LB5975:
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
.LB5974:
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
	jne .LS5985f
.LS5985l:
	addq $32, %rdx
	vpcmpeqb (%rdx), %ymm15, %ymm0
	vpmovmskb %ymm0, %edi
	testl %edi, %edi
	je .LS5985l
	tzcntl %edi, %edi
	addq %rdx, %rdi
	subq %rax, %rdi
	jmp .LS5985d
.LS5985f:
	tzcntl %edi, %edi
.LS5985d:
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
	jge .LB5977
.LB5978:
	movslq %r12d, %rcx
	xorl %edx, %edx
	testq %rcx, %rcx
	cmovg %rcx, %rdx
	shrq $2, %rdx
	xorl %edi, %edi
.LB5979:
	testq %rdx, %rdx
	je .LB5981
.LB5980:
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
	jne .LB5980
.LB5981:
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
.LB5977:
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
.LB5982:
	testl %ecx, %ecx
	je .LB5984
.LB5983:
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
	jne .LB5983
.LB5984:
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
	.globl standard__strings__strcpy__2__byteE1_arr__byteE1_arr__ret_byteE1_arr
	.def standard__strings__strcpy__2__byteE1_arr__byteE1_arr__ret_byteE1_arr;
	.scl 2;
	.type 32;
	.endef
standard__strings__strcpy__2__byteE1_arr__byteE1_arr__ret_byteE1_arr:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
.LB1824:
	xorl %eax, %eax
.LB1828:
	movslq %eax, %rsi
	movzbl (%rdx,%rsi,1), %esi
	testb %sil, %sil
	je .LB1830
.LB1829:
	movb %sil, (%rcx,%rax,1)
	incq %rax
	jmp .LB1828
.LB1830:
	movb $0, (%rcx,%rax,1)
	movq %rcx, %rax
	movq 0(%rsp), %rsi
	addq $16, %rsp
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
.LB1853:
	testw %cx, %cx
	je .LB1859
.LB1860:
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
.LB1881:
	testw %cx, %cx
	jle .LB1883
.LB1882:
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
	jg .LB1882
.LB1883:
	testb %al, %al
	jne .LB1903
.LB1904:
	xorl %eax, %eax
.LB1905:
	leal -1(%rsi), %ecx
.LB1914:
	testw %cx, %cx
	js .LB1916
.LB1915:
	movswl %cx, %esi
	movslq %esi, %rsi
	movzbl (%rsp,%rsi,1), %esi
	movswq %ax, %rdi
	movb %sil, (%rdx,%rdi,1)
	incl %eax
	decl %ecx
	testw %cx, %cx
	jns .LB1915
	jmp .LB1916
.LB1903:
	movb $45, (%rdx)
	movl $1, %eax
	jmp .LB1905
.LB1916:
	movswq %ax, %rcx
	movzwl %ax, %eax
	movb $0, (%rdx,%rcx,1)
	movq 16(%rsp), %rsi
	movq 8(%rsp), %rdi
	addq $32, %rsp
	ret
.LB1859:
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
.LB1936:
	testl %ecx, %ecx
	je .LB1941
.LB1942:
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
.LB1960:
	testl %ecx, %ecx
	jle .LB1962
.LB1961:
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
	jg .LB1961
.LB1962:
	cmpl $1, %edi
	je .LB1978
.LB1979:
	xorl %ecx, %ecx
.LB1980:
	decl %eax
.LB1987:
	testl %eax, %eax
	js .LB1989
.LB1988:
	movslq %eax, %rsi
	movzbl -8(%rsp,%rsi,1), %esi
	movslq %ecx, %rdi
	movb %sil, (%rdx,%rdi,1)
	incl %ecx
	decl %eax
	jns .LB1988
	jmp .LB1989
.LB1978:
	movb $45, (%rdx)
	movl $1, %ecx
	jmp .LB1980
.LB1989:
	movslq %ecx, %rax
	movb $0, (%rdx,%rax,1)
	movl %ecx, %eax
	movq 32(%rsp), %rsi
	movq 24(%rsp), %rdi
	addq $48, %rsp
	ret
.LB1941:
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
.LB2007:
	movq %rdx, %rsi
	testq %rcx, %rcx
	je .LB2013
.LB2014:
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
.LB2037:
	testq %rcx, %rcx
	jle .LB2039
.LB2038:
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
	jg .LB2038
.LB2039:
	cmpq $1, %rdi
	je .LB2061
.LB2062:
	xorl %eax, %eax
.LB2063:
	leaq -1(%r8), %rcx
.LB2072:
	testq %rcx, %rcx
	js .LB2074
.LB2073:
	movslq %ecx, %rdx
	movzbl -8(%rsp,%rdx,1), %edx
	movb %dl, (%rsi,%rax,1)
	incq %rax
	decq %rcx
	jns .LB2073
	jmp .LB2074
.LB2061:
	movb $45, (%rsi)
	movl $1, %eax
	jmp .LB2063
.LB2074:
	movb $0, (%rsi,%rax,1)
	movq 32(%rsp), %rsi
	movq 24(%rsp), %rdi
	addq $48, %rsp
	ret
.LB2013:
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
.LB2094:
	testw %cx, %cx
	je .LB2100
.LB2101:
	movq .LZERO(%rip), %r10
	movq %r10, (%rsp)
	xorl %eax, %eax
.LB2113:
	testw %cx, %cx
	jbe .LB2115
.LB2114:
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
	ja .LB2114
.LB2115:
	movq %rax, %rcx
	xorl %eax, %eax
.LB2136:
	testw %cx, %cx
	jbe .LB2138
.LB2137:
	decl %ecx
	movswl %cx, %esi
	movslq %esi, %rsi
	movzbl (%rsp,%rsi,1), %esi
	movswq %ax, %rdi
	movb %sil, (%rdx,%rdi,1)
	incl %eax
	testw %cx, %cx
	ja .LB2137
.LB2138:
	movswq %ax, %rcx
	movzwl %ax, %eax
	movb $0, (%rdx,%rcx,1)
	movq 16(%rsp), %rsi
	movq 8(%rsp), %rdi
	addq $32, %rsp
	ret
.LB2100:
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
.LB2158:
	testl %ecx, %ecx
	je .LB2163
.LB2164:
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -8(%rsp)
	vzeroupper
	xorl %eax, %eax
.LB2174:
	testl %ecx, %ecx
	jbe .LB2176
.LB2175:
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
	ja .LB2175
.LB2176:
	movq %rax, %rcx
	xorl %eax, %eax
.LB2192:
	testl %ecx, %ecx
	jbe .LB2194
.LB2193:
	decl %ecx
	movslq %ecx, %rsi
	movzbl -8(%rsp,%rsi,1), %esi
	movslq %eax, %rdi
	movb %sil, (%rdx,%rdi,1)
	incl %eax
	testl %ecx, %ecx
	ja .LB2193
.LB2194:
	movslq %eax, %rcx
	movb $0, (%rdx,%rcx,1)
	movq 32(%rsp), %rsi
	movq 24(%rsp), %rdi
	addq $48, %rsp
	ret
.LB2163:
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
.LB2212:
	movq %rdx, %rsi
	testq %rcx, %rcx
	je .LB2218
.LB2219:
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -8(%rsp)
	vzeroupper
	xorl %edi, %edi
.LB2231:
	testq %rcx, %rcx
	je .LB2233
.LB2232:
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
	jne .LB2232
.LB2233:
	xorl %eax, %eax
.LB2254:
	testq %rdi, %rdi
	je .LB2256
.LB2255:
	decq %rdi
	movslq %edi, %rcx
	movzbl -8(%rsp,%rcx,1), %ecx
	movb %cl, (%rsi,%rax,1)
	incq %rax
	testq %rdi, %rdi
	jne .LB2255
.LB2256:
	movb $0, (%rsi,%rax,1)
	movq 32(%rsp), %rsi
	movq 24(%rsp), %rdi
	addq $48, %rsp
	ret
.LB2218:
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
.LB2276:
	xorl %eax, %eax
.LB2283:
	movslq %eax, %rdx
	movzbl (%rcx,%rdx,1), %esi
	cmpb $32, %sil
	je .LB2284
.LB2292:
	cmpb $9, %sil
	je .LB2284
.LB2301:
	cmpb $10, (%rcx,%rdx,1)
	je .LB2284
.LB2310:
	cmpb $13, (%rcx,%rdx,1)
	jne .LB2285
.LB2284:
	incl %eax
	jmp .LB2283
.LB2285:
	movzbl (%rcx,%rdx,1), %edx
	cmpb $45, %dl
	je .LB2327
.LB2328:
	cmpb $43, %dl
	je .LB2339
.LB2340:
	movl $1, %edx
.LB2329:
	movq %rax, %rsi
	xorl %eax, %eax
.LB2343:
	movslq %esi, %rdi
	movzbl (%rcx,%rdi,1), %edi
	testb %dil, %dil
	je .LB2345
.LB2344:
	cmpb $48, %dil
	jb .LB2345
.LB2359:
	cmpb $57, %dil
	ja .LB2345
.LB2365:
	movzbl %dil, %edi
	subl $48, %edi
	imull $10, %eax, %eax
	addl %edi, %eax
	incl %esi
	jmp .LB2343
.LB2339:
	incl %eax
	movl $1, %edx
	jmp .LB2329
.LB2327:
	incl %eax
	movl $4294967295, %edx
	jmp .LB2329
.LB2345:
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
.LB2380:
	xorl %eax, %eax
.LB2386:
	movslq %eax, %rdx
	movzbl (%rcx,%rdx,1), %edx
	leal -9(%rdx), %esi
	cmpb $24, %sil
	jae .LB5986
.LB5987:
	movzbl %sil, %esi
	movl $8388627, %edi
	btq %rsi, %rdi
	jae .LB5986
.LB2387:
	incl %eax
	jmp .LB2386
.LB5986:
	cmpb $45, %dl
	je .LB2430
.LB2431:
	leal 1(%rax), %esi
	cmpb $43, %dl
	cmove %esi, %eax
	movq %rax, %rdx
	xorl %eax, %eax
.LB2443:
	movslq %edx, %rsi
	movzbl (%rcx,%rsi,1), %esi
	movzbl %sil, %edi
	testb %sil, %sil
	je .LB2445
.LB2444:
	cmpb $48, %sil
	jb .LB2466
.LB2459:
	cmpb $57, %sil
	ja .LB2466
.LB2465:
	subl $48, %edi
	imull $10, %eax, %eax
	addl %edi, %eax
	incl %edx
	jmp .LB2443
.LB2466:
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB2445:
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB2430:
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
.LB2478:
	xorl %eax, %eax
.LB2486:
	movslq %eax, %rdx
	movzbl (%rcx,%rdx,1), %esi
	cmpb $32, %sil
	je .LB2487
.LB2495:
	cmpb $9, %sil
	je .LB2487
.LB2504:
	cmpb $10, (%rcx,%rdx,1)
	je .LB2487
.LB2513:
	cmpb $13, (%rcx,%rdx,1)
	jne .LB2488
.LB2487:
	incl %eax
	jmp .LB2486
.LB2488:
	movzbl (%rcx,%rdx,1), %edx
	cmpb $45, %dl
	je .LB2530
.LB2531:
	cmpb $43, %dl
	je .LB2543
.LB2544:
	movq %rax, %rdx
	movl $1, %eax
.LB2532:
	movq %rdx, %rsi
	xorl %edx, %edx
.LB2547:
	movslq %esi, %rdi
	movzbl (%rcx,%rdi,1), %edi
	testb %dil, %dil
	je .LB2549
.LB2548:
	cmpb $48, %dil
	jb .LB2549
.LB2563:
	cmpb $57, %dil
	ja .LB2549
.LB2569:
	movzbl %dil, %edi
	subl $48, %edi
	imulq $10, %rdx, %rdx
	addq %rdi, %rdx
	incl %esi
	jmp .LB2547
.LB2543:
	leal 1(%rax), %edx
	movl $1, %eax
	jmp .LB2532
.LB2530:
	leal 1(%rax), %edx
	movq $-1, %rax
	jmp .LB2532
.LB2549:
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
.LB2586:
	xorl %eax, %eax
.LB2592:
	movslq %eax, %rdx
	movzbl (%rcx,%rdx,1), %edx
	leal -9(%rdx), %esi
	cmpb $24, %sil
	jae .LB5988
.LB5989:
	movzbl %sil, %esi
	movl $8388627, %edi
	btq %rsi, %rdi
	jae .LB5988
.LB2593:
	incl %eax
	jmp .LB2592
.LB5988:
	cmpb $45, %dl
	je .LB2636
.LB2637:
	leal 1(%rax), %esi
	cmpb $43, %dl
	cmove %esi, %eax
	movq %rax, %rdx
	xorl %eax, %eax
.LB2650:
	movslq %edx, %rsi
	movzbl (%rcx,%rsi,1), %esi
	movzbl %sil, %edi
	testb %sil, %sil
	je .LB2652
.LB2651:
	cmpb $48, %sil
	jb .LB2673
.LB2666:
	cmpb $57, %sil
	ja .LB2673
.LB2672:
	leal -48(%rdi), %esi
	imulq $10, %rax, %rax
	addq %rsi, %rax
	incl %edx
	jmp .LB2650
.LB2673:
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB2652:
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB2636:
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
.LB2687:
	xorps %xmm1, %xmm1
	ucomiss %xmm0, %xmm1
	ja .LB2695
.LB2696:
	xorl %eax, %eax
.LB2697:
	xorps %xmm1, %xmm1
	ucomiss %xmm1, %xmm0
	sete %cl
	setnp %sil
	movzbl %cl, %ecx
	movzbl %sil, %esi
	andl %esi, %ecx
	testb %cl, %cl
	jne .LB2705
.LB2706:
	cvttss2siq %xmm0, %rcx
	movl %ecx, %ecx
	movslq %ecx, %rsi
	xorps %xmm1, %xmm1
	cvtsi2ssq %rsi, %xmm1
	subss %xmm1, %xmm0
	movl $1, %esi
	xorl %edi, %edi
.LB2753:
	cmpl %r8d, %edi
	jge .LB2755
.LB2754:
	imull $10, %esi, %esi
	incl %edi
	cmpl %r8d, %edi
	jl .LB2754
	jmp .LB2755
.LB2695:
	movb $45, (%rdx)
	xorps %xmm1, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subss %xmm15, %xmm0
	movl $1, %eax
	jmp .LB2697
.LB2755:
	movslq %esi, %rdi
	xorps %xmm1, %xmm1
	cvtsi2ssq %rdi, %xmm1
	movabsq $1056964608, %r10
	movq %r10, %xmm2
	vfmadd132ss %xmm1, %xmm2, %xmm0
	cvttss2siq %xmm0, %rdi
	movl %edi, %edi
	cmpl %esi, %edi
	jge .LB2775
.LB2776:
.LB2777:
	testl %ecx, %ecx
	je .LB2793
.LB2794:
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, 32(%rsp)
	vzeroupper
	movq %rcx, %rsi
	xorl %ecx, %ecx
.LB2806:
	testl %esi, %esi
	jle .LB2808
.LB2807:
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
	jg .LB2807
	jmp .LB2808
.LB2775:
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
	jne .LB2790
.LB2783:
	testl %r8d, %r8d
	jle .LB2790
.LB2790:
	xorl %edi, %edi
	testl %ecx, %ecx
	je .LB2793
	jmp .LB2794
.LB2808:
	decl %ecx
.LB2824:
	testl %ecx, %ecx
	js .LB2826
.LB2825:
	movslq %ecx, %rsi
	movzbl 32(%rsp,%rsi,1), %esi
	movslq %eax, %r9
	movb %sil, (%rdx,%r9,1)
	incl %eax
	decl %ecx
	jns .LB2825
.LB2826:
.LB2795:
	testl %r8d, %r8d
	jg .LB2841
.LB2842:
	movslq %eax, %rcx
	movb $0, (%rdx,%rcx,1)
	movq 80(%rsp), %rbx
	movq 72(%rsp), %rsi
	movq 64(%rsp), %rdi
	addq $96, %rsp
	ret
.LB2793:
	movslq %eax, %rcx
	movb $48, (%rdx,%rcx,1)
	incl %eax
	testl %r8d, %r8d
	jle .LB2842
.LB2841:
	movslq %eax, %rcx
	movb $46, (%rdx,%rcx,1)
	incl %eax
	testl %edi, %edi
	je .LB2852
.LB2853:
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, (%rsp)
	vzeroupper
	xorl %ecx, %ecx
.LB2874:
	testl %edi, %edi
	jle .LB2876
.LB2875:
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
	jg .LB2875
.LB2876:
	subl %ecx, %r8d
	xorl %esi, %esi
.LB2894:
	cmpl %r8d, %esi
	jge .LB2896
.LB2895:
	movslq %eax, %rdi
	movb $48, (%rdx,%rdi,1)
	incl %eax
	incl %esi
	cmpl %r8d, %esi
	jl .LB2895
.LB2896:
	decl %ecx
.LB2911:
	testl %ecx, %ecx
	js .LB2913
.LB2912:
	movslq %ecx, %rsi
	movzbl (%rsp,%rsi,1), %esi
	movslq %eax, %rdi
	movb %sil, (%rdx,%rdi,1)
	incl %eax
	decl %ecx
	jns .LB2912
.LB2913:
.LB2854:
	movslq %eax, %rcx
	movb $0, (%rdx,%rcx,1)
	movq 80(%rsp), %rbx
	movq 72(%rsp), %rsi
	movq 64(%rsp), %rdi
	addq $96, %rsp
	ret
.LB2852:
	xorl %ecx, %ecx
.LB2856:
	cmpl %r8d, %ecx
	jge .LB2858
.LB2857:
	movslq %eax, %rsi
	movb $48, (%rdx,%rsi,1)
	incl %eax
	incl %ecx
	cmpl %r8d, %ecx
	jl .LB2857
.LB2858:
	jmp .LB2854
.LB2705:
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
.LB5990:
	testl %esi, %esi
	je .LB5992
.LB5991:
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
	jne .LB5991
.LB5992:
.LB2717:
	cmpl %r8d, %edi
	jge .LB2719
.LB2718:
	leal (%rcx,%rdi), %esi
	movslq %esi, %rsi
	movb $48, (%rdx,%rsi,1)
	incl %edi
	cmpl %r8d, %edi
	jl .LB2718
.LB2719:
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
.LB2931:
	movq %rdx, %rcx
	xorps %xmm1, %xmm1
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm0, %xmm1
	ja .LB2939
.LB2940:
	xorl %esi, %esi
.LB2941:
	xorps %xmm1, %xmm1
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm1, %xmm0
	sete %al
	setnp %dl
	movzbl %al, %eax
	movzbl %dl, %edx
	andl %edx, %eax
	testb %al, %al
	jne .LB2949
.LB2950:
	cvttsd2siq %xmm0, %rax
	xorps %xmm1, %xmm1
	cvtsi2sdq %rax, %xmm1
	subsd %xmm1, %xmm0
	movl $1, %edx
	xorl %edi, %edi
.LB2999:
	cmpl %r8d, %edi
	jge .LB3001
.LB3000:
	imulq $10, %rdx, %rdx
	incl %edi
	cmpl %r8d, %edi
	jl .LB3000
	jmp .LB3001
.LB2939:
	movb $69, (%rcx)
	xorps %xmm1, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subsd %xmm15, %xmm0
	movl $1, %esi
	jmp .LB2941
.LB3001:
	xorps %xmm1, %xmm1
	cvtsi2sdq %rdx, %xmm1
	movabsq $1056964608, %r10
	movq %r10, %xmm2
	cvtss2sd %xmm2, %xmm2
	vfmadd132sd %xmm1, %xmm2, %xmm0
	cvttsd2siq %xmm0, %rdi
	cmpq %rdx, %rdi
	jge .LB3023
.LB3024:
.LB3025:
	testq %rax, %rax
	je .LB3046
.LB3047:
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, 32(%rsp)
	vzeroupper
	xorl %r9d, %r9d
	movq %rax, %rbx
.LB3059:
	testq %rbx, %rbx
	jle .LB3061
.LB3060:
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
	jg .LB3060
	jmp .LB3061
.LB3023:
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
	jne .LB3042
.LB3035:
	testl %r8d, %r8d
	jle .LB3042
.LB3042:
	movq %rdi, %rax
	xorl %edi, %edi
	testq %rax, %rax
	je .LB3046
	jmp .LB3047
.LB3061:
	leal -1(%r9), %eax
.LB3081:
	testl %eax, %eax
	js .LB3083
.LB3082:
	movslq %eax, %rdx
	movzbl 32(%rsp,%rdx,1), %edx
	movslq %esi, %r9
	movb %dl, (%rcx,%r9,1)
	incl %esi
	decl %eax
	jns .LB3082
.LB3083:
.LB3048:
	testl %r8d, %r8d
	jg .LB3098
.LB3099:
	movq %rsi, %rax
	movslq %eax, %rdx
	movb $0, (%rcx,%rdx,1)
	movq 80(%rsp), %rbx
	movq 72(%rsp), %rsi
	movq 64(%rsp), %rdi
	addq $96, %rsp
	ret
.LB3046:
	movslq %esi, %rax
	movb $48, (%rcx,%rax,1)
	incl %esi
	testl %r8d, %r8d
	jle .LB3099
.LB3098:
	movslq %esi, %rax
	movb $46, (%rcx,%rax,1)
	incl %esi
	testq %rdi, %rdi
	je .LB3110
.LB3111:
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, (%rsp)
	vzeroupper
	movq %rdi, %r9
	xorl %edi, %edi
.LB3132:
	testq %r9, %r9
	jle .LB3134
.LB3133:
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
	jg .LB3133
.LB3134:
	subl %edi, %r8d
	xorl %eax, %eax
.LB3156:
	cmpl %r8d, %eax
	jge .LB3158
.LB3157:
	movslq %esi, %rdx
	movb $48, (%rcx,%rdx,1)
	incl %esi
	incl %eax
	cmpl %r8d, %eax
	jl .LB3157
.LB3158:
	leal -1(%rdi), %eax
.LB3173:
	testl %eax, %eax
	js .LB3175
.LB3174:
	movslq %eax, %rdx
	movzbl (%rsp,%rdx,1), %edx
	movslq %esi, %rdi
	movb %dl, (%rcx,%rdi,1)
	incl %esi
	decl %eax
	jns .LB3174
.LB3175:
.LB3112:
	movq %rsi, %rax
	movslq %eax, %rdx
	movb $0, (%rcx,%rdx,1)
	movq 80(%rsp), %rbx
	movq 72(%rsp), %rsi
	movq 64(%rsp), %rdi
	addq $96, %rsp
	ret
.LB3110:
	xorl %eax, %eax
.LB3114:
	cmpl %r8d, %eax
	jge .LB3116
.LB3115:
	movslq %esi, %rdx
	movb $48, (%rcx,%rdx,1)
	incl %esi
	incl %eax
	cmpl %r8d, %eax
	jl .LB3115
.LB3116:
	jmp .LB3112
.LB2949:
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
.LB5997:
	testl %edx, %edx
	je .LB5999
.LB5998:
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
	jne .LB5998
.LB5999:
.LB2962:
	cmpl %r8d, %edi
	jge .LB2964
.LB2963:
	leal (%rax,%rdi), %edx
	movslq %edx, %rdx
	movb $48, (%rcx,%rdx,1)
	incl %edi
	cmpl %r8d, %edi
	jl .LB2963
.LB2964:
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
.LB3193:
	xorl %eax, %eax
	xorl %edx, %edx
.LB3196:
	movslq %edx, %rsi
	movzbl (%rcx,%rsi,1), %esi
	testb %sil, %sil
	je .LB3199
.LB3197:
	leal 1(%rax), %edi
	cmpb $10, %sil
	cmove %edi, %eax
	incl %edx
	jmp .LB3196
.LB3199:
	testl %eax, %eax
	jg .LB3229
.LB3221:
	cmpb $0, (%rcx)
	jne .LB3229
.LB3230:
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB3229:
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
.LB3235:
	xorl %eax, %eax
	xorl %esi, %esi
.LB3240:
	movslq %esi, %rdi
	movzbl (%rcx,%rdi,1), %edi
	testb %dil, %dil
	jne .LB3241
.LB6004:
	xorl %esi, %esi
.LB3243:
	cmpl %edx, %eax
	jne .LB3273
.LB3274:
	movq %rsi, %rax
.LB3280:
	movslq %eax, %rdx
	movzbl (%rcx,%rdx,1), %edx
	testb %dl, %dl
	je .LB3282
.LB3289:
	cmpb $10, %dl
	je .LB3282
.LB3281:
	incl %eax
	jmp .LB3280
.LB3241:
	cmpl %edx, %eax
	je .LB3254
.LB3255:
	leal 1(%rax), %r8d
	cmpb $10, %dil
	cmove %r8d, %eax
	incl %esi
	jmp .LB3240
.LB3254:
	cmpl %edx, %eax
	jne .LB3273
	jmp .LB3274
.LB3282:
	movl %eax, %r8d
	subl %esi, %r8d
	movq %rsi, %rdx
	callq standard__strings__manip__substring__3__byteE1_ptr1__intE1__intE1__ret_byteE1_ptr1
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB3273:
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
.LB3307:
	movq %rcx, %rsi
	xorl %edi, %edi
	xorl %ebx, %ebx
	xorl %r12d, %r12d
.LB3311:
	movslq %r12d, %rax
	movzbl (%rsi,%rax,1), %eax
	testb %al, %al
	je .LB3314
.LB3312:
	movzbl %al, %ecx
	callq standard__strings__helpers__is_whitespace__1__charE1__ret_boolE1
	testb %al, %al
	jne .LB3327
.LB3328:
	testb %bl, %bl
	je .LB3332
.LB3333:
.LB3329:
	incl %r12d
	jmp .LB3311
.LB3314:
	movl %edi, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB3332:
	incl %edi
	movl $1, %ebx
	jmp .LB3329
.LB3327:
	xorl %ebx, %ebx
	jmp .LB3329
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
.LB3339:
	movq %rcx, %rbx
	movq %rdx, %rsi
	movq %r8, %r12
	movq %rbx, %rcx
	movq %rsi, %rdx
	xorl %r8d, %r8d
	callq standard__strings__helpers__find_substring__3__byteE1_ptr1__byteE1_ptr1__intE1__ret_intE1
	movl %eax, %r13d
	cmpl $4294967295, %r13d
	je .LB3350
.LB3351:
	xorl %r14d, %r14d
.LB3356:
	movslq %r14d, %rax
	cmpb $0, (%rbx,%rax,1)
	je .LB3358
.LB3357:
	incl %r14d
	jmp .LB3356
.LB3358:
	xorl %r15d, %r15d
.LB3368:
	movslq %r15d, %rax
	cmpb $0, (%rsi,%rax,1)
	je .LB3370
.LB3369:
	incl %r15d
	jmp .LB3368
.LB3370:
	movq $0, -64(%rbp)
.LB3380:
	movq -64(%rbp), %rax
	movslq %eax, %rax
	cmpb $0, (%r12,%rax,1)
	je .LB3382
.LB3381:
	movq -64(%rbp), %rax
	incl %eax
	movq %rax, -64(%rbp)
	jmp .LB3380
.LB3382:
	movl %r14d, %eax
	subl %r15d, %eax
	movq -64(%rbp), %rcx
	addl %ecx, %eax
	leaq 1(%rax), %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	testq %rax, %rax
	je .LB3408
.LB3409:
	cmpl $32, %r13d
	jge .LB6005
.LB6006:
	movslq %r13d, %rcx
	xorl %edx, %edx
	testq %rcx, %rcx
	cmovg %rcx, %rdx
	shrq $2, %rdx
	xorl %esi, %esi
.LB6007:
	testq %rdx, %rdx
	je .LB6009
.LB6008:
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
	jne .LB6008
.LB6009:
.LB3413:
	cmpq %rcx, %rsi
	jge .LB3416
.LB3414:
	movzbl (%rbx,%rsi,1), %edx
	movb %dl, (%rax,%rsi,1)
	incq %rsi
	cmpq %rcx, %rsi
	jl .LB3414
	jmp .LB3416
.LB6005:
	movslq %r13d, %rcx
	movq %rcx, %rdx
	sarq $63, %rdx
	notq %rdx
	andq %rdx, %rcx
	movq %rax, %rdi
	movq %rbx, %rsi
	rep movsb
.LB3416:
	xorl %ecx, %ecx
	movq -64(%rbp), %rdx
	testl %edx, %edx
	cmovg %edx, %ecx
	shrl $2, %ecx
	xorl %edx, %edx
.LB6010:
	testl %ecx, %ecx
	je .LB6012
.LB6011:
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
	jne .LB6011
.LB6012:
.LB3430:
	movq -64(%rbp), %rcx
	cmpl %ecx, %edx
	jge .LB3433
.LB3431:
	movslq %edx, %rcx
	movzbl (%r12,%rcx,1), %ecx
	leal (%r13,%rdx), %esi
	movslq %esi, %rsi
	movb %cl, (%rax,%rsi,1)
	incl %edx
	jmp .LB3430
.LB3433:
	leal (%r13,%r15), %ecx
.LB3449:
	cmpl %r14d, %ecx
	jg .LB3452
.LB3450:
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
	jle .LB3450
.LB3452:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB3408:
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
.LB3350:
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
.LB3474:
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
.LB6013:
	testq %rdx, %rdx
	je .LB6015
.LB6014:
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
	jne .LB6014
.LB6015:
.LB3485:
	cmpq %rcx, %r8
	jge .LB3487
.LB3486:
	movzbl -32(%rbp,%r8,1), %edx
	movslq (%rdi), %r9
	movb %dl, (%rsi,%r9,1)
	movl (%rdi), %edx
	incl %edx
	movl %edx, (%rdi)
	incq %r8
	cmpq %rcx, %r8
	jl .LB3486
.LB3487:
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
.LB3505:
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
.LB6016:
	testq %rdx, %rdx
	je .LB6018
.LB6017:
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
	jne .LB6017
.LB6018:
.LB3515:
	cmpq %rcx, %r8
	jge .LB3517
.LB3516:
	movzbl -56(%rbp,%r8,1), %edx
	movslq (%rdi), %r9
	movb %dl, (%rsi,%r9,1)
	movl (%rdi), %edx
	incl %edx
	movl %edx, (%rdi)
	incq %r8
	cmpq %rcx, %r8
	jl .LB3516
.LB3517:
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
.LB3535:
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
.LB6019:
	testq %rdx, %rdx
	je .LB6021
.LB6020:
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
	jne .LB6020
.LB6021:
.LB3546:
	cmpq %rcx, %r8
	jge .LB3548
.LB3547:
	movzbl -56(%rbp,%r8,1), %edx
	movslq (%rdi), %r9
	movb %dl, (%rsi,%r9,1)
	movl (%rdi), %edx
	incl %edx
	movl %edx, (%rdi)
	incq %r8
	cmpq %rcx, %r8
	jl .LB3547
.LB3548:
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
.LB3566:
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
.LB6022:
	testq %rdx, %rdx
	je .LB6024
.LB6023:
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
	jne .LB6023
.LB6024:
.LB3577:
	cmpq %rcx, %r8
	jge .LB3579
.LB3578:
	movzbl -32(%rbp,%r8,1), %edx
	movslq (%rdi), %r9
	movb %dl, (%rsi,%r9,1)
	movl (%rdi), %edx
	incl %edx
	movl %edx, (%rdi)
	incq %r8
	cmpq %rcx, %r8
	jl .LB3578
.LB3579:
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
.LB3597:
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
.LB6025:
	testq %rdx, %rdx
	je .LB6027
.LB6026:
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
	jne .LB6026
.LB6027:
.LB3607:
	cmpq %rcx, %r8
	jge .LB3609
.LB3608:
	movzbl -56(%rbp,%r8,1), %edx
	movslq (%rdi), %r9
	movb %dl, (%rsi,%r9,1)
	movl (%rdi), %edx
	incl %edx
	movl %edx, (%rdi)
	incq %r8
	cmpq %rcx, %r8
	jl .LB3608
.LB3609:
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
.LB3627:
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
.LB6028:
	testq %rdx, %rdx
	je .LB6030
.LB6029:
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
	jne .LB6029
.LB6030:
.LB3638:
	cmpq %rcx, %r8
	jge .LB3640
.LB3639:
	movzbl -56(%rbp,%r8,1), %edx
	movslq (%rdi), %r9
	movb %dl, (%rsi,%r9,1)
	movl (%rdi), %edx
	incl %edx
	movl %edx, (%rdi)
	incq %r8
	cmpq %rcx, %r8
	jl .LB3639
.LB3640:
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
.LB3658:
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
.LB6031:
	testq %rdx, %rdx
	je .LB6033
.LB6032:
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
	jne .LB6032
.LB6033:
.LB3668:
	cmpq %rcx, %r8
	jge .LB3670
.LB3669:
	movzbl -56(%rbp,%r8,1), %edx
	movslq (%rdi), %r9
	movb %dl, (%rsi,%r9,1)
	movl (%rdi), %edx
	incl %edx
	movl %edx, (%rdi)
	incq %r8
	cmpq %rcx, %r8
	jl .LB3669
.LB3670:
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
.LB3688:
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
.LB6034:
	testq %rdx, %rdx
	je .LB6036
.LB6035:
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
	jne .LB6035
.LB6036:
.LB3698:
	cmpq %rcx, %r8
	jge .LB3700
.LB3699:
	movzbl -56(%rbp,%r8,1), %edx
	movslq (%rdi), %r9
	movb %dl, (%rsi,%r9,1)
	movl (%rdi), %edx
	incl %edx
	movl %edx, (%rdi)
	incq %r8
	cmpq %rcx, %r8
	jl .LB3699
.LB3700:
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
.LB3718:
	xorl %eax, %eax
.LB3723:
	movslq %eax, %rsi
	movzbl (%rcx,%rsi,1), %esi
	testb %sil, %sil
	je .LB3725
.LB3724:
	movslq (%r8), %rdi
	movb %sil, (%rdx,%rdi,1)
	movl (%r8), %esi
	incl %esi
	movl %esi, (%r8)
	incl %eax
	jmp .LB3723
.LB3725:
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
.LB3747:
	movq %rcx, %rsi
	movq %rdx, %rdi
	testq %rsi, %rsi
	je .LB3761
.LB3754:
	testq %rdi, %rdi
	je .LB3761
.LB3762:
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %ebx
	movq %rdi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	testl %eax, %eax
	je .LB3773
.LB3774:
	cmpl %ebx, %eax
	jg .LB3780
.LB3781:
	movl %ebx, %ecx
	subl %eax, %ecx
.LB3785:
	testl %ecx, %ecx
	js .LB3788
.LB3786:
	xorl %edx, %edx
.LB3795:
	cmpl %eax, %edx
	jl .LB3796
.LB6037:
	movl $1, %edx
.LB3798:
	testb %dl, %dl
	jne .LB3820
.LB3821:
	decl %ecx
	jns .LB3786
.LB3788:
	movabsq $4294967295, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB3796:
	leal (%rcx,%rdx), %r8d
	movslq %edx, %r9
	movslq %r8d, %r8
	movzbl (%rsi,%r8,1), %r8d
	movzbl (%rdi,%r9,1), %r9d
	cmpb %r9b, %r8b
	jne .LB3814
.LB3815:
	incl %edx
	cmpl %eax, %edx
	jl .LB3796
	jmp .LB6037
.LB3814:
	xorl %edx, %edx
	testb %dl, %dl
	je .LB3821
.LB3820:
	movl %ecx, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB3780:
	movabsq $4294967295, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB3773:
	movl %ebx, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB3761:
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
.LB3827:
	movq %rcx, %rsi
	movl %edx, %edi
	testq %rsi, %rsi
	je .LB3834
.LB3835:
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	decl %eax
.LB3841:
	testl %eax, %eax
	js .LB3844
.LB3842:
	movslq %eax, %rcx
	movzbl (%rsi,%rcx,1), %ecx
	cmpb %dil, %cl
	je .LB3856
.LB3857:
	decl %eax
	jns .LB3842
.LB3844:
	movabsq $4294967295, %rax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB3856:
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB3834:
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
.LB3863:
	movq %rcx, %rsi
	movq %rdx, %rdi
	testq %rsi, %rsi
	je .LB3877
.LB3870:
	testq %rdi, %rdi
	je .LB3877
.LB3878:
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %ebx
	movq %rdi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	testl %eax, %eax
	je .LB3894
.LB3888:
	cmpl %ebx, %eax
	jg .LB3894
.LB3895:
	subl %eax, %ebx
	xorl %ecx, %ecx
	xorl %edx, %edx
.LB3900:
	cmpl %ebx, %edx
	jg .LB3902
.LB3901:
	xorl %r8d, %r8d
.LB3908:
	cmpl %eax, %r8d
	jl .LB3909
.LB6038:
	movl $1, %r8d
.LB3911:
	leal 1(%rcx), %r9d
	leal (%rdx,%rax), %r12d
	incl %edx
	testb %r8b, %r8b
	cmovne %r9d, %ecx
	testb %r8b, %r8b
	cmovne %r12d, %edx
	cmpl %ebx, %edx
	jle .LB3901
.LB3902:
	movl %ecx, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB3909:
	leal (%rdx,%r8), %r9d
	movslq %r8d, %r12
	movslq %r9d, %r9
	movzbl (%rsi,%r9,1), %r9d
	movzbl (%rdi,%r12,1), %r12d
	cmpb %r12b, %r9b
	jne .LB3927
.LB3928:
	incl %r8d
	cmpl %eax, %r8d
	jl .LB3909
	jmp .LB6038
.LB3927:
	xorl %r8d, %r8d
	jmp .LB3911
.LB3894:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB3877:
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
.LB3954:
	movl standard__io__console__out_len(%rip), %edi
	testl %edi, %edi
	je .LB3959
.LB3960:
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
.LB3959:
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
.LB3964:
	movq %rcx, %rsi
	movl %edx, %edi
	testl %edi, %edi
	jle .LB3970
.LB3971:
	cmpl $8192, %edi
	jge .LB3975
.LB3976:
	movl standard__io__console__out_len(%rip), %eax
	addl %edi, %eax
	cmpl $8192, %eax
	jg .LB3984
.LB3986:
	movl %edi, %eax
	shrl $2, %eax
	xorl %ecx, %ecx
.LB6039:
	testl %eax, %eax
	je .LB6041
.LB6040:
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
	jne .LB6040
	jmp .LB6041
.LB3984:
	callq standard__io__console__flush__0__ret_voidE1
	jmp .LB3986
.LB6041:
.LB3987:
	cmpl %edi, %ecx
	jge .LB3989
.LB3988:
	movslq %ecx, %rax
	leaq standard__io__console__out_buf(%rip), %r8
	movzbl (%rsi,%rax,1), %eax
	movl standard__io__console__out_len(%rip), %edx
	addl %ecx, %edx
	incl %ecx
	movslq %edx, %rdx
	movb %al, (%r8,%rdx,1)
	cmpl %edi, %ecx
	jl .LB3988
.LB3989:
	movl standard__io__console__out_len(%rip), %eax
	addl %edi, %eax
	movl %eax, standard__io__console__out_len(%rip)
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB3975:
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
.LB3970:
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
.LB3944:
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
.LB4006:
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
.LB4011:
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
.LB4018:
	testb %cl, %cl
	jne .LB4021
.LB4022:
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
.LB4021:
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
.LB4050:
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
.LB4042:
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
.LB4039:
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
.LB4065:
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
.LB4072:
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
.LB4058:
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
.LB4079:
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
.LB4086:
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
.LB4093:
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
.LB4100:
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
.LB4107:
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
.LB4110:
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
.LB4113:
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
.LB4121:
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
.LB4136:
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
.LB4144:
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
.LB3949:
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
	subq $272, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB5696:
	callq FreeConsole
	xorl %ecx, %ecx
	callq GetModuleHandleA
	movq %rax, %rsi
	movl $1262830665, -29(%rbp)
	movl $1953451585, -25(%rbp)
	movl $1684107365, -21(%rbp)
	movb $0, -17(%rbp)
	movl $1702129486, -48(%rbp)
	movl $543449456, -44(%rbp)
	movl $1851072557, -40(%rbp)
	movl $1819568500, -36(%rbp)
	movw $25701, -32(%rbp)
	movb $0, -30(%rbp)
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -128(%rbp)
	vmovdqu .LZERO+32(%rip), %ymm15
	vmovdqu %ymm15, -96(%rbp)
	movups .LZERO+64(%rip), %xmm15
	movups %xmm15, -64(%rbp)
	vzeroupper
	movl $80, -128(%rbp)
	movl standard__system__windows__CS_HREDRAW(%rip), %eax
	movl standard__system__windows__CS_VREDRAW(%rip), %ecx
	movl $32512, %edx
	orl %ecx, %eax
	xorl %ecx, %ecx
	movl %eax, -124(%rbp)
	leaq NotepadWndProc__4__dataE1_ubits64__dataE1_ubits32__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64(%rip), %rax
	movq %rax, -120(%rbp)
	movl $0, -112(%rbp)
	movl $0, -108(%rbp)
	movq %rsi, -104(%rbp)
	callq LoadIconA
	movq %rax, -96(%rbp)
	xorl %ecx, %ecx
	movl $32512, %edx
	callq LoadCursorA
	movq %rax, -88(%rbp)
	movl standard__system__windows__WHITE_BRUSH(%rip), %ecx
	callq GetStockObject
	leaq -128(%rbp), %rcx
	movq %rax, -80(%rbp)
	leaq -29(%rbp), %rax
	movq $0, -72(%rbp)
	movq %rax, %rdi
	movq %rdi, -64(%rbp)
	movq $0, -56(%rbp)
	callq RegisterClassExA
	leaq -48(%rbp), %rax
	movq %rax, %r8
	movl standard__system__windows__WS_OVERLAPPEDWINDOW(%rip), %eax
	movl standard__system__windows__WS_VISIBLE(%rip), %ecx
	movl %eax, %r9d
	orl %ecx, %r9d
	movl standard__system__windows__CW_USEDEFAULT(%rip), %eax
	movq STDLIB_GVP(%rip), %rcx
	movq %rax, 32(%rsp)
	movq %rax, 40(%rsp)
	movq $800, 48(%rsp)
	movq $600, 56(%rsp)
	movq $0, 64(%rsp)
	movq $0, 72(%rsp)
	movq %rsi, 80(%rsp)
	movq %rcx, 88(%rsp)
	xorl %ecx, %ecx
	movq %rdi, %rdx
	callq CreateWindowExA
	movq %rax, %rsi
	movl standard__system__windows__SW_SHOW(%rip), %edx
	movq %rsi, %rcx
	callq ShowWindow
	movq %rsi, %rcx
	callq UpdateWindow
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -176(%rbp)
	movups .LZERO+32(%rip), %xmm15
	movups %xmm15, -144(%rbp)
	vzeroupper
.LB5789:
	leaq -176(%rbp), %rcx
	xorl %edx, %edx
	xorl %r8d, %r8d
	xorl %r9d, %r9d
	callq GetMessageA
	testb %al, %al
	je .LB5791
.LB5790:
	movl -168(%rbp), %eax
	movl standard__system__windows__WM_KEYDOWN(%rip), %ecx
	cmpl %ecx, %eax
	jne .LB5818
.LB5800:
	cmpq $65, -160(%rbp)
	jne .LB5818
.LB5809:
	movl standard__system__windows__VK_CONTROL(%rip), %ecx
	callq GetAsyncKeyState
	movzwl %ax, %eax
	andl $32768, %eax
	jne .LB5817
.LB5818:
	leaq -176(%rbp), %rcx
	callq TranslateMessage
	leaq -176(%rbp), %rcx
	callq DispatchMessageA
	jmp .LB5789
.LB5791:
	movq -160(%rbp), %rax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB5817:
	movq g_hwnd_edit(%rip), %rcx
	movl standard__system__windows__EM_SETSEL(%rip), %edx
	xorl %r8d, %r8d
	movq $-1, %r9
	callq SendMessageA
	jmp .LB5789
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
.LB5833:
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
.LB4160:
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
.LB4179:
	movslq %eax, %rcx
	cmpw $0, (%rsi,%rcx,2)
	je .LB4181
.LB4180:
.LB4188:
	movslq %eax, %rcx
	movzwl (%rsi,%rcx,2), %ecx
	cmpw $32, %cx
	je .LB4189
.LB4197:
	cmpw $9, %cx
	jne .LB4190
.LB4189:
	incl %eax
	jmp .LB4188
.LB4190:
	testw %cx, %cx
	je .LB4181
.LB4215:
	cmpw $34, %cx
	je .LB4223
.LB4224:
.LB4259:
	movslq %eax, %rcx
	movzwl (%rsi,%rcx,2), %ecx
	testw %cx, %cx
	je .LB4261
.LB4268:
	cmpw $32, %cx
	je .LB4261
.LB4277:
	cmpw $9, %cx
	je .LB4261
.LB4260:
	incl %eax
	jmp .LB4259
.LB4261:
.LB4225:
	incl %edi
	jmp .LB4179
.LB4223:
	incl %eax
.LB4228:
	movslq %eax, %rcx
	movzwl (%rsi,%rcx,2), %ecx
	testw %cx, %cx
	je .LB4230
.LB4237:
	cmpw $34, %cx
	je .LB4230
.LB4229:
	incl %eax
	jmp .LB4228
.LB4230:
	leal 1(%rax), %ecx
	movslq %eax, %rdx
	cmpw $34, (%rsi,%rdx,2)
	cmove %ecx, %eax
	jmp .LB4225
.LB4181:
	movq %rdi, %rcx
	shlq $3, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, %rbx
	xorl %r12d, %r12d
	xorl %eax, %eax
	xorl %ecx, %ecx
.LB4296:
	movslq %eax, %rdx
	cmpw $0, (%rsi,%rdx,2)
	je .LB4298
.LB4297:
.LB4305:
	movslq %eax, %rdx
	movzwl (%rsi,%rdx,2), %edx
	cmpw $32, %dx
	je .LB4306
.LB4314:
	cmpw $9, %dx
	jne .LB4307
.LB4306:
	incl %eax
	jmp .LB4305
.LB4307:
	testw %dx, %dx
	je .LB4298
.LB4332:
	cmpw $34, %dx
	je .LB4341
.LB4342:
	movq %rax, %rdx
	xorl %r8d, %r8d
.LB4380:
	movslq %edx, %r9
	movzwl (%rsi,%r9,2), %r9d
	testw %r9w, %r9w
	je .LB4382
.LB4389:
	cmpw $32, %r9w
	je .LB4382
.LB4398:
	cmpw $9, %r9w
	je .LB4382
.LB4381:
	incl %r8d
	incl %edx
	jmp .LB4380
.LB4382:
	movq %rdx, %r13
	movq %rax, %r14
	movq %r8, %r15
	movq %rcx, -80(%rbp)
.LB4343:
	leaq 1(%r15), %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	xorl %ecx, %ecx
	testl %r15d, %r15d
	cmovg %r15d, %ecx
	shrl $2, %ecx
	xorl %edx, %edx
.LB6042:
	testl %ecx, %ecx
	je .LB6044
.LB6043:
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
	jne .LB6043
	jmp .LB6044
.LB4341:
	incl %eax
	movq %rax, %rcx
	xorl %r15d, %r15d
.LB4347:
	movslq %ecx, %rdx
	movzwl (%rsi,%rdx,2), %edx
	testw %dx, %dx
	je .LB4349
.LB4356:
	cmpw $34, %dx
	je .LB4349
.LB4348:
	incl %r15d
	incl %ecx
	jmp .LB4347
.LB4349:
	leal 1(%rcx), %edx
	movslq %ecx, %r8
	cmpw $34, (%rsi,%r8,2)
	movl %ecx, %r13d
	cmove %edx, %r13d
	movq %rax, %r14
	movq $1, -80(%rbp)
	jmp .LB4343
.LB6044:
.LB4417:
	cmpl %r15d, %edx
	jge .LB4419
.LB4418:
	leal (%r14,%rdx), %ecx
	movslq %ecx, %rcx
	movzwl (%rsi,%rcx,2), %ecx
	movslq %edx, %r8
	movb %cl, (%rax,%r8,1)
	incl %edx
	cmpl %r15d, %edx
	jl .LB4418
.LB4419:
	movslq %r15d, %rcx
	movb $0, (%rax,%rcx,1)
	movslq %r12d, %rcx
	movq %rax, (%rbx,%rcx,8)
	incl %r12d
	movq %r13, %rax
	movq -80(%rbp), %rcx
	jmp .LB4296
.LB4298:
	cmpl $1, %edi
	jg .LB4447
.LB4448:
	callq main__0__ret_intE1
	movq %rax, %rsi
.LB4449:
	movslq %edi, %rdi
	xorl %r12d, %r12d
.LB4454:
	cmpq %rdi, %r12
	jge .LB4456
.LB4455:
	movq (%rbx,%r12,8), %rax
	movq %rax, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	incq %r12
	cmpq %rdi, %r12
	jl .LB4455
	jmp .LB4456
.LB4447:
	callq main__0__ret_intE1
	movl %eax, %esi
	jmp .LB4449
.LB4456:
	testl %esi, %esi
	jne .LB4469
.LB4471:
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
.LB4469:
	cmpl $3221225477, %esi
	jne .LB4471
.LB4475:
	movl $1179075923, -66(%rbp)
	movl $1414288705, -62(%rbp)
	movw $10, -58(%rbp)
	leaq -66(%rbp), %rdi
	movq %rdi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rdi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	jmp .LB4471
	.text
	.globl __chkstk
	.def __chkstk;
	.scl 2;
	.type 32;
	.endef
__chkstk:
.LB4159:
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
	.globl standard__math__sign__1__dataE1_sbits8__ret_dataE1_sbits8
	.def standard__math__sign__1__dataE1_sbits8__ret_dataE1_sbits8;
	.scl 2;
	.type 32;
	.endef
standard__math__sign__1__dataE1_sbits8__ret_dataE1_sbits8:
.LB4494:
	testb %cl, %cl
	jg .LB4499
.LB4500:
	testb %cl, %cl
	js .LB4506
.LB4507:
	xorl %eax, %eax
	ret
.LB4506:
	movl $255, %eax
	ret
.LB4499:
	movl $1, %eax
	ret
	.text
	.globl standard__math__sign__1__dataE1_sbits16__ret_dataE1_sbits16
	.def standard__math__sign__1__dataE1_sbits16__ret_dataE1_sbits16;
	.scl 2;
	.type 32;
	.endef
standard__math__sign__1__dataE1_sbits16__ret_dataE1_sbits16:
.LB4512:
	testw %cx, %cx
	jg .LB4517
.LB4518:
	testw %cx, %cx
	js .LB4524
.LB4525:
	xorl %eax, %eax
	ret
.LB4524:
	movl $65535, %eax
	ret
.LB4517:
	movl $1, %eax
	ret
	.text
	.globl standard__math__sign__1__dataE1_sbits32__ret_dataE1_sbits32
	.def standard__math__sign__1__dataE1_sbits32__ret_dataE1_sbits32;
	.scl 2;
	.type 32;
	.endef
standard__math__sign__1__dataE1_sbits32__ret_dataE1_sbits32:
.LB4530:
	testl %ecx, %ecx
	jg .LB4534
.LB4535:
	testl %ecx, %ecx
	js .LB4539
.LB4540:
	xorl %eax, %eax
	ret
.LB4539:
	movabsq $4294967295, %rax
	ret
.LB4534:
	movl $1, %eax
	ret
	.text
	.globl standard__math__sign__1__dataE1_sbits64__ret_dataE1_sbits64
	.def standard__math__sign__1__dataE1_sbits64__ret_dataE1_sbits64;
	.scl 2;
	.type 32;
	.endef
standard__math__sign__1__dataE1_sbits64__ret_dataE1_sbits64:
.LB4543:
	testq %rcx, %rcx
	jg .LB4548
.LB4549:
	testq %rcx, %rcx
	js .LB4555
.LB4556:
	xorl %eax, %eax
	ret
.LB4555:
	movq $-1, %rax
	ret
.LB4548:
	movl $1, %eax
	ret
	.text
	.globl standard__math__sign__1__floatE1__ret_floatE1
	.def standard__math__sign__1__floatE1__ret_floatE1;
	.scl 2;
	.type 32;
	.endef
standard__math__sign__1__floatE1__ret_floatE1:
.LB4561:
	xorps %xmm1, %xmm1
	ucomiss %xmm1, %xmm0
	ja .LB4565
.LB4566:
	xorps %xmm1, %xmm1
	ucomiss %xmm0, %xmm1
	ja .LB4570
.LB4571:
	xorps %xmm0, %xmm0
	ret
.LB4570:
	xorps %xmm0, %xmm0
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	subss %xmm1, %xmm0
	ret
.LB4565:
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
.LB4574:
	xorps %xmm1, %xmm1
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm1, %xmm0
	ja .LB4579
.LB4580:
	xorps %xmm1, %xmm1
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm0, %xmm1
	ja .LB4586
.LB4587:
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	ret
.LB4586:
	xorps %xmm0, %xmm0
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	subss %xmm1, %xmm0
	cvtss2sd %xmm0, %xmm0
	ret
.LB4579:
	movabsq $1065353216, %r10
	movq %r10, %xmm0
	cvtss2sd %xmm0, %xmm0
	ret
	.text
	.globl update_title__1__dataE1_ubits64__ret_voidE1
	.def update_title__1__dataE1_ubits64__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
update_title__1__dataE1_ubits64__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $384, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB4592:
	movq %rcx, %rsi
	leaq -316(%rbp), %rax
	movq %rax, %rdi
	xorl %eax, %eax
	movl $300, %ecx
	rep stosb
	leaq -316(%rbp), %rcx
	leaq -327(%rbp), %rdx
	movl $1702129486, -327(%rbp)
	movl $543449456, -323(%rbp)
	movw $8237, -319(%rbp)
	movb $0, -317(%rbp)
	movl $1769238101, -336(%rbp)
	movl $1684368500, -332(%rbp)
	movb $0, -328(%rbp)
	movw $10784, -339(%rbp)
	movb $0, -337(%rbp)
	callq standard__strings__strcpy__2__byteE1_arr__byteE1_arr__ret_byteE1_arr
	leaq g_filename(%rip), %rax
	leaq -336(%rbp), %rcx
	cmpb $0, g_filename(%rip)
	movq %rcx, %rdx
	cmovne %rax, %rdx
	leaq -316(%rbp), %rcx
	callq strcat
	cmpb $0, g_modified(%rip)
	jne .LB4638
.LB4640:
	leaq -316(%rbp), %rax
	movq %rax, %rdx
	movq %rsi, %rcx
	callq SetWindowTextA
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB4638:
	leaq -316(%rbp), %rcx
	leaq -339(%rbp), %rdx
	callq strcat
	jmp .LB4640
	.text
	.globl ask_save__1__dataE1_ubits64__ret_intE1
	.def ask_save__1__dataE1_ubits64__ret_intE1;
	.scl 2;
	.type 32;
	.endef
ask_save__1__dataE1_ubits64__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $80, %rsp
	movq %rsi, -8(%rbp)
.LB4647:
	leaq -37(%rbp), %rax
	movl $2032168772, -37(%rbp)
	movl $1998615919, -33(%rbp)
	movl $544501345, -29(%rbp)
	movl $1931505524, -25(%rbp)
	movl $543520353, -21(%rbp)
	movl $1851877475, -17(%rbp)
	movl $1064527207, -13(%rbp)
	movb $0, -9(%rbp)
	movl $1702129486, -45(%rbp)
	movl $6578544, -41(%rbp)
	movq %rax, %rdx
	leaq -45(%rbp), %rax
	movq %rax, %r8
	movl standard__system__windows__MB_YESNOCANCEL(%rip), %eax
	movl standard__system__windows__MB_ICONQUESTION(%rip), %esi
	movl %eax, %r9d
	orl %esi, %r9d
	callq MessageBoxA
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl do_save__2__dataE1_ubits64__boolE1__ret_boolE1
	.def do_save__2__dataE1_ubits64__boolE1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
do_save__2__dataE1_ubits64__boolE1__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $560, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
.LB4695:
	movq %rcx, %rbx
	leaq -292(%rbp), %rax
	movq %rax, %rdi
	xorl %eax, %eax
	movl $260, %ecx
	rep stosb
	leaq .LZERO(%rip), %rsi
	leaq -448(%rbp), %rdi
	movl $152, %ecx
	rep movsb
	movl $0, -452(%rbp)
	movl $1954047316, -484(%rbp)
	movl $1818838560, -480(%rbp)
	movl $704672613, -476(%rbp)
	movl $1954051118, -472(%rbp)
	movl $1819033856, -468(%rbp)
	movl $1818838560, -464(%rbp)
	movl $704672613, -460(%rbp)
	movl $10798, -456(%rbp)
	movl $7633012, -488(%rbp)
	movl $1702256979, -496(%rbp)
	movl $7553312, -492(%rbp)
	cmpb $0, g_filename(%rip)
	je .LB4757
.LB4753:
	testb %dl, %dl
	jne .LB4757
.LB4759:
	movq g_hwnd_edit(%rip), %rcx
	callq GetWindowTextLengthA
	leal 1(%rax), %esi
	movl %esi, %ecx
	callq malloc
	movq %rax, %rdi
	movq STDLIB_GVP(%rip), %rax
	cmpq %rax, %rdi
	je .LB4815
.LB4816:
	movq g_hwnd_edit(%rip), %rcx
	movq %rdi, %rdx
	movq %rsi, %r8
	callq GetWindowTextA
	leaq g_filename(%rip), %rax
	movq STDLIB_GVP(%rip), %r9
	movq $2, 32(%rsp)
	movq $128, 40(%rsp)
	movq $0, 48(%rsp)
	movl $1073741824, %edx
	xorl %r8d, %r8d
	movq %rax, %rcx
	callq CreateFileA
	movq %rax, %r12
	cmpq $-1, %r12
	je .LB4829
.LB4830:
	leal -1(%rsi), %r8d
	movq STDLIB_GVP(%rip), %rax
	leaq -452(%rbp), %r9
	movq %rax, 32(%rsp)
	movq %r12, %rcx
	movq %rdi, %rdx
	callq WriteFile
	movq %r12, %rcx
	callq CloseHandle
	movq %rdi, %rcx
	callq free
	movb $0, g_modified(%rip)
	movq %rbx, %rcx
	callq update_title__1__dataE1_ubits64__ret_voidE1
	movl $1, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB4757:
	movb $0, -292(%rbp)
	cmpb $0, g_filename(%rip)
	jne .LB4766
.LB4768:
	leaq -448(%rbp), %rax
	movq %rax, %rsi
	movq %rsi, %rcx
	xorl %edx, %edx
	movl $152, %r8d
	callq memset
	movl $152, -448(%rbp)
	movq %rbx, -440(%rbp)
	leaq -484(%rbp), %rax
	movq %rax, -424(%rbp)
	leaq -292(%rbp), %rax
	movq %rax, -400(%rbp)
	movl $260, -392(%rbp)
	leaq -488(%rbp), %rax
	movq %rax, -344(%rbp)
	leaq -496(%rbp), %rax
	movq %rax, -360(%rbp)
	movl standard__system__windows__OFN_OVERWRITEPROMPT(%rip), %eax
	movl standard__system__windows__OFN_HIDEREADONLY(%rip), %ecx
	orl %ecx, %eax
	movl %eax, -352(%rbp)
	movq %rsi, %rcx
	callq GetSaveFileNameA
	testb %al, %al
	je .LB4796
.LB4797:
	leaq g_filename(%rip), %rcx
	leaq -292(%rbp), %rdx
	callq standard__strings__strcpy__2__byteE1_arr__byteE1_arr__ret_byteE1_arr
	jmp .LB4759
.LB4766:
	leaq -292(%rbp), %rcx
	leaq g_filename(%rip), %rdx
	callq standard__strings__strcpy__2__byteE1_arr__byteE1_arr__ret_byteE1_arr
	jmp .LB4768
.LB4829:
	movq %rdi, %rcx
	callq free
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB4815:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB4796:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
	.text
	.globl do_open__1__dataE1_ubits64__ret_voidE1
	.def do_open__1__dataE1_ubits64__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
do_open__1__dataE1_ubits64__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $560, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
.LB4843:
	movq %rcx, %rbx
	leaq -284(%rbp), %rax
	movq %rax, %rdi
	xorl %eax, %eax
	movl $260, %ecx
	rep stosb
	leaq .LZERO(%rip), %rsi
	leaq -440(%rbp), %rdi
	movl $152, %ecx
	rep movsb
	leaq -440(%rbp), %rax
	movl $0, -444(%rbp)
	movq $0, -456(%rbp)
	movl $1954047316, -488(%rbp)
	movl $1818838560, -484(%rbp)
	movl $704672613, -480(%rbp)
	movl $1954051118, -476(%rbp)
	movl $1819033856, -472(%rbp)
	movl $1818838560, -468(%rbp)
	movl $704672613, -464(%rbp)
	movl $10798, -460(%rbp)
	movl $1852141647, -493(%rbp)
	movb $0, -489(%rbp)
	movb $0, -284(%rbp)
	xorl %edx, %edx
	movl $152, %r8d
	movq %rax, %rsi
	movq %rsi, %rcx
	callq memset
	movl $152, -440(%rbp)
	movq %rbx, -432(%rbp)
	leaq -488(%rbp), %rax
	movq %rax, -416(%rbp)
	leaq -284(%rbp), %rax
	movq %rax, -392(%rbp)
	movl $260, -384(%rbp)
	leaq -493(%rbp), %rax
	movq %rax, -352(%rbp)
	movl standard__system__windows__OFN_FILEMUSTEXIST(%rip), %eax
	movl standard__system__windows__OFN_PATHMUSTEXIST(%rip), %ecx
	orl %ecx, %eax
	movl standard__system__windows__OFN_HIDEREADONLY(%rip), %ecx
	orl %ecx, %eax
	movl %eax, -344(%rbp)
	movq %rsi, %rcx
	callq GetOpenFileNameA
	testb %al, %al
	je .LB4915
.LB4916:
	leaq -284(%rbp), %rax
	movq STDLIB_GVP(%rip), %r9
	movabsq $2147483648, %rdx
	movq $3, 32(%rsp)
	movq $128, 40(%rsp)
	movq $0, 48(%rsp)
	movl $1, %r8d
	movq %rax, %rcx
	callq CreateFileA
	movq %rax, %rsi
	cmpq $-1, %rsi
	je .LB4926
.LB4927:
	leaq -456(%rbp), %rdx
	movq %rsi, %rcx
	callq GetFileSizeEx
	movq -456(%rbp), %rax
	leaq 1(%rax), %rcx
	callq malloc
	movq %rax, %rdi
	movq STDLIB_GVP(%rip), %rax
	cmpq %rax, %rdi
	je .LB4941
.LB4942:
	movq -456(%rbp), %rax
	leaq -444(%rbp), %r9
	movq %rsi, %rcx
	movq %rdi, %rdx
	movl %eax, %r8d
	movq STDLIB_GVP(%rip), %rax
	movq %rax, 32(%rsp)
	callq ReadFile
	movq %rsi, %rcx
	callq CloseHandle
	movq -456(%rbp), %rax
	movb $0, (%rdi,%rax,1)
	movq g_hwnd_edit(%rip), %rcx
	movq %rdi, %rdx
	callq SetWindowTextA
	movq %rdi, %rcx
	callq free
	leaq g_filename(%rip), %rcx
	leaq -284(%rbp), %rdx
	callq standard__strings__strcpy__2__byteE1_arr__byteE1_arr__ret_byteE1_arr
	movb $0, g_modified(%rip)
	movq %rbx, %rcx
	callq update_title__1__dataE1_ubits64__ret_voidE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB4941:
	movq %rsi, %rcx
	callq CloseHandle
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB4926:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB4915:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
	.text
	.globl do_new__1__dataE1_ubits64__ret_voidE1
	.def do_new__1__dataE1_ubits64__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
do_new__1__dataE1_ubits64__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
.LB4966:
	movq %rcx, %rsi
	cmpb $0, g_modified(%rip)
	jne .LB4970
.LB4972:
	movq g_hwnd_edit(%rip), %rcx
	movb $0, -9(%rbp)
	leaq -9(%rbp), %rax
	movq %rax, %rdx
	callq SetWindowTextA
	movb $0, g_filename(%rip)
	movb $0, g_modified(%rip)
	movq %rsi, %rcx
	callq update_title__1__dataE1_ubits64__ret_voidE1
	movq -8(%rbp), %rsi
	leave
	ret
.LB4970:
	movq %rsi, %rcx
	callq ask_save__1__dataE1_ubits64__ret_intE1
	movl standard__system__windows__IDCANCEL(%rip), %ecx
	cmpl %ecx, %eax
	je .LB4978
.LB4979:
	movl standard__system__windows__IDYES(%rip), %ecx
	cmpl %ecx, %eax
	jne .LB4972
.LB4984:
	movq %rsi, %rcx
	xorl %edx, %edx
	callq do_save__2__dataE1_ubits64__boolE1__ret_boolE1
	jmp .LB4972
.LB4978:
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl NotepadWndProc__4__dataE1_ubits64__dataE1_ubits32__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64
	.def NotepadWndProc__4__dataE1_ubits64__dataE1_ubits32__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64;
	.scl 2;
	.type 32;
	.endef
NotepadWndProc__4__dataE1_ubits64__dataE1_ubits32__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64:
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
.LB4997:
	movq %rcx, %rsi
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -72(%rbp)
	movl standard__system__windows__WM_CREATE(%rip), %eax
	cmpl %eax, %edx
	je .LB5008
.LB5009:
	movl standard__system__windows__WM_SIZE(%rip), %eax
	cmpl %eax, %edx
	je .LB5348
.LB5349:
	movl standard__system__windows__WM_COMMAND(%rip), %eax
	cmpl %eax, %edx
	je .LB5377
.LB5379:
	movl standard__system__windows__WM_CLOSE(%rip), %eax
	cmpl %eax, %edx
	je .LB5657
.LB5658:
	movl standard__system__windows__WM_DESTROY(%rip), %eax
	cmpl %eax, %edx
	je .LB5687
.LB5688:
	movq %rsi, %rcx
	callq DefWindowProcA
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB5377:
	movl standard__system__windows__IDM_EDIT_CTRL(%rip), %ecx
	movq %r8, %rax
	andq $65535, %rax
	cmpl %ecx, %eax
	jne .LB5399
.LB5387:
	movl standard__system__windows__EN_CHANGE(%rip), %edi
	movq %r8, %rcx
	shrq $16, %rcx
	andq $65535, %rcx
	cmpl %edi, %ecx
	je .LB5398
.LB5399:
	movl standard__system__windows__IDM_NEW(%rip), %ecx
	cmpl %ecx, %eax
	je .LB5406
.LB5407:
	movl standard__system__windows__IDM_SAVE(%rip), %ecx
	cmpl %ecx, %eax
	je .LB5414
.LB5415:
	movl standard__system__windows__IDM_SAVEAS(%rip), %ecx
	cmpl %ecx, %eax
	je .LB5423
.LB5424:
	movl standard__system__windows__IDM_UNDO(%rip), %ecx
	cmpl %ecx, %eax
	je .LB5432
.LB5433:
	movl standard__system__windows__IDM_CUT(%rip), %ecx
	cmpl %ecx, %eax
	je .LB5444
.LB5445:
	movl standard__system__windows__IDM_COPY(%rip), %ecx
	cmpl %ecx, %eax
	je .LB5456
.LB5457:
	movl standard__system__windows__IDM_PASTE(%rip), %ecx
	cmpl %ecx, %eax
	je .LB5468
.LB5469:
	movl standard__system__windows__IDM_SELECTALL(%rip), %ecx
	cmpl %ecx, %eax
	je .LB5480
.LB5481:
	movl standard__system__windows__IDM_ABOUT(%rip), %ecx
	cmpl %ecx, %eax
	je .LB5493
.LB5494:
	movl standard__system__windows__IDM_OPEN(%rip), %ecx
	cmpl %ecx, %eax
	je .LB5598
.LB5599:
	movl standard__system__windows__IDM_EXIT(%rip), %ecx
	cmpl %ecx, %eax
	je .LB5627
	jmp .LB5379
.LB5687:
	xorl %ecx, %ecx
	callq PostQuitMessage
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
.LB5657:
	cmpb $0, g_modified(%rip)
	jne .LB5661
.LB5663:
	movq %rsi, %rcx
	callq DestroyWindow
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
.LB5661:
	movq %rsi, %rcx
	callq ask_save__1__dataE1_ubits64__ret_intE1
	movl standard__system__windows__IDCANCEL(%rip), %ecx
	cmpl %ecx, %eax
	je .LB5669
.LB5670:
	movl standard__system__windows__IDYES(%rip), %ecx
	cmpl %ecx, %eax
	jne .LB5663
.LB5676:
	movq %rsi, %rcx
	xorl %edx, %edx
	callq do_save__2__dataE1_ubits64__boolE1__ret_boolE1
	jmp .LB5663
.LB5669:
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
.LB5627:
	cmpb $0, g_modified(%rip)
	jne .LB5631
.LB5633:
	movq %rsi, %rcx
	callq DestroyWindow
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
.LB5631:
	movq %rsi, %rcx
	callq ask_save__1__dataE1_ubits64__ret_intE1
	movl standard__system__windows__IDCANCEL(%rip), %ecx
	cmpl %ecx, %eax
	je .LB5639
.LB5640:
	movl standard__system__windows__IDYES(%rip), %ecx
	cmpl %ecx, %eax
	jne .LB5633
.LB5646:
	movq %rsi, %rcx
	xorl %edx, %edx
	callq do_save__2__dataE1_ubits64__boolE1__ret_boolE1
	jmp .LB5633
.LB5639:
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
.LB5598:
	cmpb $0, g_modified(%rip)
	jne .LB5602
.LB5604:
	movq %rsi, %rcx
	callq do_open__1__dataE1_ubits64__ret_voidE1
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
.LB5602:
	movq %rsi, %rcx
	callq ask_save__1__dataE1_ubits64__ret_intE1
	movl standard__system__windows__IDCANCEL(%rip), %ecx
	cmpl %ecx, %eax
	je .LB5610
.LB5611:
	movl standard__system__windows__IDYES(%rip), %ecx
	cmpl %ecx, %eax
	jne .LB5604
.LB5617:
	movq %rsi, %rcx
	xorl %edx, %edx
	callq do_save__2__dataE1_ubits64__boolE1__ret_boolE1
	jmp .LB5604
.LB5610:
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
.LB5493:
	leaq -158(%rbp), %rax
	movl $1702129486, -158(%rbp)
	movl $174350704, -154(%rbp)
	movl $1953067607, -150(%rbp)
	movl $544105844, -146(%rbp)
	movl $1226862185, -142(%rbp)
	movl $1095451972, -138(%rbp)
	movl $1967196718, -134(%rbp)
	movl $1919903860, -130(%rbp)
	movl $1632313402, -126(%rbp)
	movl $543383922, -122(%rbp)
	movl $1411395158, -118(%rbp)
	movl $1634039656, -114(%rbp)
	movl $168457332, -110(%rbp)
	movl $1701080909, -106(%rbp)
	movl $543450476, -102(%rbp)
	movl $1702127201, -98(%rbp)
	movl $1766662258, -94(%rbp)
	movl $1936683619, -90(%rbp)
	movl $544239468, -86(%rbp)
	movl $1634692162, -82(%rbp)
	movl $1684107380, -78(%rbp)
	movw $46, -74(%rbp)
	movl $1970233921, -164(%rbp)
	movq %rax, %rdx
	leaq -164(%rbp), %rax
	movw $116, -160(%rbp)
	movq %rsi, %rcx
	xorl %r9d, %r9d
	movq %rax, %r8
	callq MessageBoxA
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
.LB5480:
	movq g_hwnd_edit(%rip), %rcx
	movl standard__system__windows__EM_SETSEL(%rip), %edx
	xorl %r8d, %r8d
	movq $-1, %r9
	callq SendMessageA
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
.LB5468:
	movq g_hwnd_edit(%rip), %rcx
	movl standard__system__windows__WM_PASTE(%rip), %edx
	xorl %r8d, %r8d
	xorl %r9d, %r9d
	callq SendMessageA
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
.LB5456:
	movq g_hwnd_edit(%rip), %rcx
	movl standard__system__windows__WM_COPY(%rip), %edx
	xorl %r8d, %r8d
	xorl %r9d, %r9d
	callq SendMessageA
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
.LB5444:
	movq g_hwnd_edit(%rip), %rcx
	movl standard__system__windows__WM_CUT(%rip), %edx
	xorl %r8d, %r8d
	xorl %r9d, %r9d
	callq SendMessageA
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
.LB5432:
	movq g_hwnd_edit(%rip), %rcx
	movl standard__system__windows__WM_UNDO(%rip), %edx
	xorl %r8d, %r8d
	xorl %r9d, %r9d
	callq SendMessageA
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
.LB5423:
	movq %rsi, %rcx
	movl $1, %edx
	callq do_save__2__dataE1_ubits64__boolE1__ret_boolE1
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
.LB5414:
	movq %rsi, %rcx
	xorl %edx, %edx
	callq do_save__2__dataE1_ubits64__boolE1__ret_boolE1
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
.LB5406:
	movq %rsi, %rcx
	callq do_new__1__dataE1_ubits64__ret_voidE1
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
.LB5398:
	movb $1, g_modified(%rip)
	movq %rsi, %rcx
	callq update_title__1__dataE1_ubits64__ret_voidE1
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
.LB5348:
	leaq -72(%rbp), %rdx
	movq %rsi, %rcx
	callq GetClientRect
	movq g_hwnd_edit(%rip), %rcx
	movl -64(%rbp), %eax
	xorl %edx, %edx
	xorl %r8d, %r8d
	movl %eax, %r9d
	subl -72(%rbp), %r9d
	movl -60(%rbp), %eax
	subl -68(%rbp), %eax
	movq %rax, 32(%rsp)
	movq $1, 40(%rsp)
	callq MoveWindow
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
.LB5008:
	callq CreateMenu
	movq %rax, %rdi
	callq CreatePopupMenu
	movq %rax, %rbx
	callq CreatePopupMenu
	movq %rax, %r12
	callq CreatePopupMenu
	movq %rax, %r13
	movl $2003127846, -176(%rbp)
	movl $1920221961, -172(%rbp)
	movl $5122924, -168(%rbp)
	movl $1701859110, -192(%rbp)
	movl $774778478, -188(%rbp)
	movl $1920221961, -184(%rbp)
	movl $5188460, -180(%rbp)
	movl $1986089766, -205(%rbp)
	movl $1950550373, -201(%rbp)
	movl $1395354738, -197(%rbp)
	movb $0, -193(%rbp)
	movl $1702256979, -217(%rbp)
	movl $1933649440, -213(%rbp)
	movl $3026478, -209(%rbp)
	movl $1769481797, -223(%rbp)
	movw $116, -219(%rbp)
	movl $1684952358, -236(%rbp)
	movl $1950550383, -232(%rbp)
	movl $1512795250, -228(%rbp)
	movb $0, -224(%rbp)
	movl $1948677443, -248(%rbp)
	movl $1920221961, -244(%rbp)
	movl $5778284, -240(%rbp)
	movl $1886339878, -261(%rbp)
	movl $1950550393, -257(%rbp)
	movl $1126919282, -253(%rbp)
	movb $0, -249(%rbp)
	movl $1935757350, -275(%rbp)
	movl $1124689268, -271(%rbp)
	movl $728527476, -267(%rbp)
	movw $86, -263(%rbp)
	movl $1701602643, -294(%rbp)
	movl $639661155, -290(%rbp)
	movl $158100545, -286(%rbp)
	movl $1819440195, -282(%rbp)
	movw $16683, -278(%rbp)
	movb $0, -276(%rbp)
	movl $1868710182, -301(%rbp)
	movw $29813, -297(%rbp)
	movb $0, -295(%rbp)
	movl $1818838566, -307(%rbp)
	movw $101, -303(%rbp)
	movl $1768178982, -313(%rbp)
	movw $116, -309(%rbp)
	movl $1818576934, -319(%rbp)
	movw $112, -315(%rbp)
	movl standard__system__windows__MF_STRING(%rip), %edx
	movl standard__system__windows__IDM_NEW(%rip), %eax
	movl %eax, %r8d
	leaq -176(%rbp), %rax
	movq %rax, %r9
	movq %rbx, %rcx
	callq AppendMenuA
	movl standard__system__windows__MF_STRING(%rip), %edx
	movl standard__system__windows__IDM_OPEN(%rip), %eax
	movl %eax, %r8d
	leaq -192(%rbp), %rax
	movq %rax, %r9
	movq %rbx, %rcx
	callq AppendMenuA
	movl standard__system__windows__MF_STRING(%rip), %edx
	movl standard__system__windows__IDM_SAVE(%rip), %eax
	movl %eax, %r8d
	leaq -205(%rbp), %rax
	movq %rax, %r9
	movq %rbx, %rcx
	callq AppendMenuA
	movl standard__system__windows__MF_STRING(%rip), %edx
	movl standard__system__windows__IDM_SAVEAS(%rip), %eax
	movl %eax, %r8d
	leaq -217(%rbp), %rax
	movq %rax, %r9
	movq %rbx, %rcx
	callq AppendMenuA
	movl standard__system__windows__MF_SEPARATOR(%rip), %edx
	movq STDLIB_GVP(%rip), %r9
	movq %rbx, %rcx
	xorl %r8d, %r8d
	callq AppendMenuA
	movl standard__system__windows__MF_STRING(%rip), %edx
	movl standard__system__windows__IDM_EXIT(%rip), %eax
	movl %eax, %r8d
	leaq -223(%rbp), %rax
	movq %rax, %r9
	movq %rbx, %rcx
	callq AppendMenuA
	movl standard__system__windows__MF_STRING(%rip), %edx
	movl standard__system__windows__IDM_UNDO(%rip), %eax
	movl %eax, %r8d
	leaq -236(%rbp), %rax
	movq %rax, %r9
	movq %r12, %rcx
	callq AppendMenuA
	movl standard__system__windows__MF_SEPARATOR(%rip), %edx
	movq STDLIB_GVP(%rip), %r9
	movq %r12, %rcx
	xorl %r8d, %r8d
	callq AppendMenuA
	movl standard__system__windows__MF_STRING(%rip), %edx
	movl standard__system__windows__IDM_CUT(%rip), %eax
	movl %eax, %r8d
	leaq -248(%rbp), %rax
	movq %rax, %r9
	movq %r12, %rcx
	callq AppendMenuA
	movl standard__system__windows__MF_STRING(%rip), %edx
	movl standard__system__windows__IDM_COPY(%rip), %eax
	movl %eax, %r8d
	leaq -261(%rbp), %rax
	movq %rax, %r9
	movq %r12, %rcx
	callq AppendMenuA
	movl standard__system__windows__MF_STRING(%rip), %edx
	movl standard__system__windows__IDM_PASTE(%rip), %eax
	movl %eax, %r8d
	leaq -275(%rbp), %rax
	movq %rax, %r9
	movq %r12, %rcx
	callq AppendMenuA
	movl standard__system__windows__MF_SEPARATOR(%rip), %edx
	movq STDLIB_GVP(%rip), %r9
	movq %r12, %rcx
	xorl %r8d, %r8d
	callq AppendMenuA
	movl standard__system__windows__MF_STRING(%rip), %edx
	movl standard__system__windows__IDM_SELECTALL(%rip), %eax
	movl %eax, %r8d
	leaq -294(%rbp), %rax
	movq %rax, %r9
	movq %r12, %rcx
	callq AppendMenuA
	movl standard__system__windows__MF_STRING(%rip), %edx
	movl standard__system__windows__IDM_ABOUT(%rip), %eax
	movl %eax, %r8d
	leaq -301(%rbp), %rax
	movq %rax, %r9
	movq %r13, %rcx
	callq AppendMenuA
	movl standard__system__windows__MF_POPUP(%rip), %edx
	leaq -307(%rbp), %rax
	movq %rax, %r9
	movq %rdi, %rcx
	movq %rbx, %r8
	callq AppendMenuA
	movl standard__system__windows__MF_POPUP(%rip), %edx
	leaq -313(%rbp), %rax
	movq %rax, %r9
	movq %rdi, %rcx
	movq %r12, %r8
	callq AppendMenuA
	movl standard__system__windows__MF_POPUP(%rip), %edx
	leaq -319(%rbp), %rax
	movq %rax, %r9
	movq %rdi, %rcx
	movq %r13, %r8
	callq AppendMenuA
	movq %rsi, %rcx
	movq %rdi, %rdx
	callq SetMenu
	movl $1414087749, -324(%rbp)
	movb $0, -320(%rbp)
	leaq -72(%rbp), %rdx
	movq %rsi, %rcx
	callq GetClientRect
	leaq -324(%rbp), %rax
	movq %rax, %rdi
	movb $0, -325(%rbp)
	leaq -325(%rbp), %rax
	movq %rax, %rbx
	movl standard__system__windows__WS_CHILD(%rip), %eax
	movl standard__system__windows__WS_VISIBLE(%rip), %ecx
	orl %ecx, %eax
	movl standard__system__windows__WS_VSCROLL(%rip), %ecx
	orl %ecx, %eax
	movl standard__system__windows__WS_HSCROLL(%rip), %ecx
	orl %ecx, %eax
	movl standard__system__windows__ES_MULTILINE(%rip), %ecx
	orl %ecx, %eax
	movl standard__system__windows__ES_AUTOVSCROLL(%rip), %ecx
	orl %ecx, %eax
	movl standard__system__windows__ES_AUTOHSCROLL(%rip), %ecx
	orl %ecx, %eax
	movl standard__system__windows__ES_NOHIDESEL(%rip), %ecx
	orl %ecx, %eax
	movl standard__system__windows__ES_WANTRETURN(%rip), %ecx
	movl %eax, %r12d
	orl %ecx, %r12d
	movl -64(%rbp), %eax
	movl %eax, %r13d
	subl -72(%rbp), %r13d
	movl -60(%rbp), %eax
	movl %eax, %r14d
	subl -68(%rbp), %r14d
	movl standard__system__windows__IDM_EDIT_CTRL(%rip), %eax
	movl %eax, %r15d
	xorl %ecx, %ecx
	callq GetModuleHandleA
	movq STDLIB_GVP(%rip), %rcx
	movq $0, 32(%rsp)
	movq $0, 40(%rsp)
	movq %r13, 48(%rsp)
	movq %r14, 56(%rsp)
	movq %rsi, 64(%rsp)
	movq %r15, 72(%rsp)
	movq %rax, 80(%rsp)
	movq %rdi, %rdx
	movq %rbx, %r8
	movq %r12, %r9
	movq %rcx, 88(%rsp)
	xorl %ecx, %ecx
	callq CreateWindowExA
	movq %rax, %rcx
	movq %rcx, g_hwnd_edit(%rip)
	callq SetFocus
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
standard__system__windows__OPENFILENAMEA.TLD:
	.long 1216
	.long 23
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
	.long 32
	.long 32
	.long 352
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
	.long 640
	.long 64
	.long 64
	.long 704
	.long 64
	.long 64
	.long 768
	.long 32
	.long 32
	.long 800
	.long 16
	.long 16
	.long 816
	.long 16
	.long 16
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
	.long 32
	.long 32
	.long 1184
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
	.data
	.p2align 2
standard__system__windows__WS_CHILD:
	.long 1073741824
	.data
	.p2align 2
standard__system__windows__WS_VISIBLE:
	.long 268435456
	.data
	.p2align 2
standard__system__windows__WS_VSCROLL:
	.long 2097152
	.data
	.p2align 2
standard__system__windows__WS_HSCROLL:
	.long 1048576
	.data
	.p2align 2
standard__system__windows__WS_OVERLAPPEDWINDOW:
	.long 13565952
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
standard__system__windows__SW_SHOW:
	.long 5
	.data
	.p2align 2
standard__system__windows__WM_CREATE:
	.long 1
	.data
	.p2align 2
standard__system__windows__WM_DESTROY:
	.long 2
	.data
	.p2align 2
standard__system__windows__WM_SIZE:
	.long 5
	.data
	.p2align 2
standard__system__windows__WM_CLOSE:
	.long 16
	.data
	.p2align 2
standard__system__windows__WM_KEYDOWN:
	.long 256
	.bss
	.p2align 2
standard__system__windows__WHITE_BRUSH:
	.zero 4
	.data
	.p2align 2
standard__system__windows__CW_USEDEFAULT:
	.long 2147483648
	.data
	.p2align 2
standard__system__windows__VK_CONTROL:
	.long 17
	.data
	.p2align 2
standard__system__windows__ES_MULTILINE:
	.long 4
	.data
	.p2align 2
standard__system__windows__ES_AUTOVSCROLL:
	.long 64
	.data
	.p2align 2
standard__system__windows__ES_AUTOHSCROLL:
	.long 128
	.data
	.p2align 2
standard__system__windows__ES_NOHIDESEL:
	.long 256
	.data
	.p2align 2
standard__system__windows__ES_WANTRETURN:
	.long 4096
	.data
	.p2align 2
standard__system__windows__OFN_FILEMUSTEXIST:
	.long 4096
	.data
	.p2align 2
standard__system__windows__OFN_PATHMUSTEXIST:
	.long 2048
	.data
	.p2align 2
standard__system__windows__OFN_OVERWRITEPROMPT:
	.long 2
	.data
	.p2align 2
standard__system__windows__OFN_HIDEREADONLY:
	.long 4
	.data
	.p2align 2
standard__system__windows__WM_COMMAND:
	.long 273
	.data
	.p2align 2
standard__system__windows__WM_CUT:
	.long 768
	.data
	.p2align 2
standard__system__windows__WM_COPY:
	.long 769
	.data
	.p2align 2
standard__system__windows__WM_PASTE:
	.long 770
	.data
	.p2align 2
standard__system__windows__WM_UNDO:
	.long 772
	.data
	.p2align 2
standard__system__windows__EN_CHANGE:
	.long 768
	.data
	.p2align 2
standard__system__windows__EM_SETSEL:
	.long 177
	.bss
	.p2align 2
standard__system__windows__MF_STRING:
	.zero 4
	.data
	.p2align 2
standard__system__windows__MF_SEPARATOR:
	.long 2048
	.data
	.p2align 2
standard__system__windows__MF_POPUP:
	.long 16
	.data
	.p2align 2
standard__system__windows__MB_YESNOCANCEL:
	.long 3
	.data
	.p2align 2
standard__system__windows__MB_ICONQUESTION:
	.long 32
	.data
	.p2align 2
standard__system__windows__IDM_NEW:
	.long 1001
	.data
	.p2align 2
standard__system__windows__IDM_OPEN:
	.long 1002
	.data
	.p2align 2
standard__system__windows__IDM_SAVE:
	.long 1003
	.data
	.p2align 2
standard__system__windows__IDM_SAVEAS:
	.long 1004
	.data
	.p2align 2
standard__system__windows__IDM_EXIT:
	.long 1005
	.data
	.p2align 2
standard__system__windows__IDM_UNDO:
	.long 2001
	.data
	.p2align 2
standard__system__windows__IDM_CUT:
	.long 2002
	.data
	.p2align 2
standard__system__windows__IDM_COPY:
	.long 2003
	.data
	.p2align 2
standard__system__windows__IDM_PASTE:
	.long 2004
	.data
	.p2align 2
standard__system__windows__IDM_SELECTALL:
	.long 2005
	.data
	.p2align 2
standard__system__windows__IDM_ABOUT:
	.long 3001
	.data
	.p2align 2
standard__system__windows__IDM_EDIT_CTRL:
	.long 100
	.data
	.p2align 2
standard__system__windows__IDYES:
	.long 6
	.data
	.p2align 2
standard__system__windows__IDCANCEL:
	.long 2
	.bss
	.p2align 3
g_hwnd_edit:
	.zero 8
	.bss
	.p2align 4
g_filename:
	.zero 260
	.bss
	.p2align 0
g_modified:
	.zero 1
	.section .rdata,"dr"
	.p2align 4
.LZERO:
	.zero 152
