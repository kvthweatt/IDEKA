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
	movzbl standard__system__cpu__g_cpuid_run(%rip), %eax
	testb %al, %al
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
.LB11142:
	testq %rdx, %rdx
	je .LB11144
.LB11143:
	movb %al, (%rcx,%rsi,1)
	movb %al, 1(%rcx,%rsi,1)
	movb %al, 2(%rcx,%rsi,1)
	movb %al, 3(%rcx,%rsi,1)
	addq $4, %rsi
	decq %rdx
	jne .LB11143
.LB11144:
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
	movq %rax, %rsi
	shlq $1, %rsi
	movq %rsi, %rdx
	shlq $5, %rdx
	movq %rdx, -88(%rbp)
	xorl %ecx, %ecx
	movl $12288, %r8d
	movl $4, %r9d
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
	cmpq %rax, %r9
	seta %bl
	movzbl %bl, %ebx
	cmpq %rdx, %r9
	setbe %r12b
	movzbl %r12b, %r12d
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
	movq %r9, standard__memory__allocators__stdheap__g_table_slab_cap(%rip)
	movq $2, 32(%rsp)
	movq %rdi, 40(%rsp)
	movq %rdi, %rcx
	movq %rsi, %rdx
	movq %rdi, %r8
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
	cmpq %rax, %r9
	seta %bl
	movzbl %bl, %ebx
	cmpq %rdx, %r9
	setbe %r12b
	movzbl %r12b, %r12d
	andl %r12d, %ebx
	xorl %r12d, %r12d
	movl $1, %r13d
	testb %bl, %bl
	cmove %r13d, %r12d
	testb %r12b, %r12b
	je .LB410
.LB409:
	movslq %edx, %r13
	shlq $5, %r13
	leaq (%rdi,%r13,1), %r13
	movq (%r13), %r15
	movslq %eax, %rax
	shlq $5, %rax
	leaq (%rdi,%rax,1), %rax
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
	movq %rcx, 32(%rsp)
	movq %rax, 40(%rsp)
	movq %rdi, %rcx
	movq %rsi, %rdx
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
	movq %rcx, standard__memory__allocators__stdheap__g_table(%rip)
	movq $1024, standard__memory__allocators__stdheap__g_table_cap(%rip)
	movq $0, standard__memory__allocators__stdheap__g_table_count(%rip)
	movq $32768, standard__memory__allocators__stdheap__g_table_slab_cap(%rip)
	movq $2, 32(%rsp)
	movq %rsi, 40(%rsp)
	movl $1024, %edx
	movq %rsi, %r8
	movl $32768, %r9d
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
	movq %rcx, %rsi
	movq %rdx, %rdi
	movq %r8, %rbx
	movq %r9, %r12
	movq standard__memory__allocators__stdheap__g_table(%rip), %rax
	testq %rax, %rax
	je .LB577
.LB576:
	movq standard__memory__allocators__stdheap__g_table_count(%rip), %rax
	shlq $1, %rax
	movq standard__memory__allocators__stdheap__g_table_cap(%rip), %rcx
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
	leaq -1(%rdx), %rdi
	andq %rdi, %rsi
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
	leaq -1(%rdx), %rdi
	andq %rdi, %rsi
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
	cmpq %rsi, %rdx
	seta %dil
	movzbl %dil, %edi
	cmpq %rax, %rdx
	setbe %dl
	movzbl %dl, %edx
	orl %edx, %edi
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
	cmpq %rsi, %rdx
	seta %dil
	movzbl %dil, %edi
	cmpq %rax, %rdx
	setbe %dl
	movzbl %dl, %edx
	andl %edx, %edi
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
	shlq $1, %rcx
	movq standard__memory__allocators__stdheap__g_slab_size_cap(%rip), %rdx
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
	addq %rdx, %rcx
	movq 8(%rax), %rsi
	movq (%rax), %rdi
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
	je .LB10990
.LB10991:
	movq 16(%rax), %rcx
	leaq (%rcx,%rdi), %rdx
	movq 8(%rax), %r8
	movq (%rax), %r9
	leaq (%r9,%rcx,1), %rcx
	movq %rdx, 16(%rax)
	xorl %eax, %eax
	cmpq %r8, %rdx
	cmovbe %rcx, %rax
.LB10987:
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
.LB10990:
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
	je .LB10985
.LB10986:
	movq 16(%rax), %rcx
	leaq (%rcx,%rdi), %rdx
	movq 8(%rax), %rdi
	movq (%rax), %r8
	leaq (%r8,%rcx,1), %rcx
	movq %rdx, 16(%rax)
	xorl %eax, %eax
	cmpq %rdi, %rdx
	cmovbe %rcx, %rax
.LB10982:
	testq %rax, %rax
	je .LB1120
.LB1121:
	movq %rax, %rdi
	jmp .LB1100
.LB10985:
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
	movq (%rax), %rcx
	leaq standard__memory__allocators__stdheap__g_bins(%rip), %rdx
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
	je .LB10995
.LB10996:
	movq standard__memory__allocators__stdheap__g_table_cap(%rip), %rcx
	movq %rsi, %rdx
	shrq $4, %rdx
	movabsq $-7046029254386353131, %rdi
	imulq %rdi, %rdx
	movq %rdx, %rdi
	shrq $32, %rdi
	xorq %rdi, %rdx
	leaq -1(%rcx), %rdi
	andq %rdi, %rdx
.LB10997:
	movslq %edx, %rdi
	shlq $5, %rdi
	movq (%rax,%rdi,1), %rdi
	testq %rdi, %rdi
	je .LB10999
.LB10998:
	cmpq %rsi, %rdi
	je .LB11001
.LB11002:
	incq %rdx
	leaq -1(%rcx), %rdi
	andq %rdi, %rdx
	jmp .LB10997
.LB10999:
	xorl %eax, %eax
.LB10992:
	testq %rax, %rax
	je .LB1167
.LB1168:
	movq 8(%rax), %rcx
	cmpq $1, 16(%rax)
	je .LB1188
.LB1189:
	movq $3, 16(%rax)
	cmpq $8, %rcx
	ja .LB11008
.LB11009:
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
.LB11001:
	shlq $5, %rdx
	leaq (%rax,%rdx,1), %rax
	jmp .LB10992
.LB10995:
	xorl %eax, %eax
	jmp .LB10992
.LB11008:
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
.LB11145:
	movl $1, %eax
	ret
.LB1209:
	cmpb $9, %cl
	jne .LB1214
.LB11146:
	movl $1, %eax
	ret
.LB1214:
	cmpb $10, %cl
	jne .LB1219
.LB11147:
	movl $1, %eax
	ret
.LB1219:
	cmpb $13, %cl
	sete %al
	movzbl %al, %eax
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
.LB11148:
	xorl %eax, %eax
	ret
.LB1228:
	cmpb $57, %cl
	setle %al
	movzbl %al, %eax
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
.LB11149:
	movl $1, %eax
	ret
.LB1242:
	cmpb $65, %cl
	jge .LB1246
.LB11150:
	xorl %eax, %eax
	ret
.LB1246:
	cmpb $90, %cl
	setle %al
	movzbl %al, %eax
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
.LB11151:
	xorl %eax, %eax
	ret
.LB1256:
	cmpb $90, %cl
	setle %al
	movzbl %al, %eax
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
.LB11152:
	xorl %eax, %eax
	ret
.LB1265:
	cmpb $122, %cl
	setle %al
	movzbl %al, %eax
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
	cmpb $9, %sil
	setbe %cl
	movzbl %cl, %ecx
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
	jne .LS11154f
.LS11154l:
	addq $32, %rdx
	vpcmpeqb (%rdx), %ymm15, %ymm0
	vpmovmskb %ymm0, %r9d
	testl %r9d, %r9d
	je .LS11154l
	tzcntl %r9d, %r9d
	addq %rdx, %r9
	subq %rax, %r9
	jmp .LS11154d
.LS11154f:
	tzcntl %r9d, %r9d
.LS11154d:
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
.LB11153:
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
	movslq %edx, %rdx
	movzbl (%rsi,%rdx,1), %edx
	movslq %ecx, %rbx
	movzbl (%rdi,%rbx,1), %ebx
	cmpb %bl, %dl
	jne .LB1407
.LB1408:
	incl %ecx
	cmpl %eax, %ecx
	jl .LB1389
	jmp .LB11153
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
	jne .LS11155f
.LS11155l:
	addq $32, %rdx
	vpcmpeqb (%rdx), %ymm15, %ymm0
	vpmovmskb %ymm0, %r8d
	testl %r8d, %r8d
	je .LS11155l
	tzcntl %r8d, %r8d
	addq %rdx, %r8
	subq %rax, %r8
	jmp .LS11155d
.LS11155f:
	tzcntl %r8d, %r8d
.LS11155d:
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
	movslq %edx, %rdx
	movzbl (%rsi,%rdx,1), %edx
	movslq %ecx, %r9
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
	jne .LS11158f
.LS11158l:
	addq $32, %rdx
	vpcmpeqb (%rdx), %ymm15, %ymm0
	vpmovmskb %ymm0, %edi
	testl %edi, %edi
	je .LS11158l
	tzcntl %edi, %edi
	addq %rdx, %rdi
	subq %rax, %rdi
	jmp .LS11158d
.LS11158f:
	tzcntl %edi, %edi
.LS11158d:
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
	jge .LB11156
.LB11157:
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
.LB11156:
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
	jne .LS11167f
.LS11167l:
	addq $32, %rdx
	vpcmpeqb (%rdx), %ymm15, %ymm0
	vpmovmskb %ymm0, %edi
	testl %edi, %edi
	je .LS11167l
	tzcntl %edi, %edi
	addq %rdx, %rdi
	subq %rax, %rdi
	jmp .LS11167d
.LS11167f:
	tzcntl %edi, %edi
.LS11167d:
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
	jge .LB11159
.LB11160:
	xorl %ecx, %ecx
	testl %r12d, %r12d
	cmovg %r12d, %ecx
	shrl $2, %ecx
	xorl %edx, %edx
.LB11161:
	testl %ecx, %ecx
	je .LB11163
.LB11162:
	movzbl (%rsi,%rdx,1), %edi
	movb %dil, (%rax,%rdx,1)
	movzbl 1(%rsi,%rdx,1), %edi
	movb %dil, 1(%rax,%rdx,1)
	movzbl 2(%rsi,%rdx,1), %edi
	movb %dil, 2(%rax,%rdx,1)
	movzbl 3(%rsi,%rdx,1), %edi
	movb %dil, 3(%rax,%rdx,1)
	addq $4, %rdx
	decl %ecx
	jne .LB11162
.LB11163:
	movslq %edx, %rcx
	movslq %r12d, %rdx
.LB1765:
	cmpq %rdx, %rcx
	jge .LB1768
.LB1766:
	movzbl (%rsi,%rcx,1), %edi
	movb %dil, (%rax,%rcx,1)
	incq %rcx
	cmpq %rdx, %rcx
	jl .LB1766
	jmp .LB1768
.LB11159:
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
.LB11164:
	testl %ecx, %ecx
	je .LB11166
.LB11165:
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
	jne .LB11165
.LB11166:
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
	movzbl (%rax), %eax
	testb %al, %al
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
	testw %cx, %cx
	sets %al
	movzbl %al, %eax
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
	movslq %edi, %r8
	movabsq $3435973837, %r9
	imulq %r8, %r9
	sarq $35, %r9
	shrq $63, %r8
	addl %r8d, %r9d
	imull $10, %r9d, %r9d
	subl %r9d, %edi
	addl $48, %edi
	movswq %si, %r8
	movb %dil, (%rsp,%r8,1)
	movswl %cx, %ecx
	movslq %ecx, %rcx
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
	movb $0, (%rdx,%rcx,1)
	movzwl %ax, %eax
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
	testl %ecx, %ecx
	sets %al
	movzbl %al, %eax
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
	addl %esi, %r8d
	imull $10, %r8d, %r8d
	movl %ecx, %esi
	subl %r8d, %esi
	addl $48, %esi
	movslq %eax, %r8
	movb %sil, -8(%rsp,%r8,1)
	movslq %ecx, %rcx
	movabsq $3435973837, %rsi
	imulq %rcx, %rsi
	sarq $35, %rsi
	shrq $63, %rcx
	addl %esi, %ecx
	incl %eax
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
	testq %rcx, %rcx
	sets %al
	movzbl %al, %eax
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
	addq %rax, %rdx
	imulq $10, %rdx, %rdx
	movq %rcx, %rax
	subq %rdx, %rax
	addq $48, %rax
	movb %al, -8(%rsp,%r8,1)
	movq %rcx, %rax
	movabsq $7378697629483820647, %rcx
	imulq %rcx
	sarq $2, %rdx
	movq %rdx, %rax
	shrq $63, %rax
	addq %rdx, %rax
	movq %rax, %rcx
	incq %r8
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
	imulq %rsi, %rdi
	shrq $35, %rdi
	imull $10, %edi, %edi
	subl %edi, %esi
	addl $48, %esi
	movswq %ax, %rdi
	movb %sil, (%rsp,%rdi,1)
	movzwl %cx, %ecx
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
	movb $0, (%rdx,%rcx,1)
	movzwl %ax, %eax
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
	imull $10, %esi, %esi
	negl %esi
	addl %ecx, %esi
	addl $48, %esi
	movslq %eax, %rdi
	movb %sil, -8(%rsp,%rdi,1)
	movabsq $3435973837, %rsi
	imulq %rsi, %rcx
	shrq $35, %rcx
	incl %eax
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
	shrq $3, %rdx
	imulq $10, %rdx, %rdx
	movq %rcx, %rax
	subq %rdx, %rax
	addq $48, %rax
	movb %al, -8(%rsp,%rdi,1)
	movq %rcx, %rax
	movabsq $-3689348814741910323, %rcx
	mulq %rcx
	movq %rdx, %rax
	shrq $3, %rax
	movq %rax, %rcx
	incq %rdi
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
	cmpb $32, %dl
	je .LB2358
.LB2366:
	cmpb $9, %dl
	je .LB2358
.LB2375:
	cmpb $10, %dl
	je .LB2358
.LB2384:
	cmpb $13, %dl
	jne .LB2359
.LB2358:
	incl %eax
	jmp .LB2357
.LB2359:
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
	cmpb $32, %dl
	je .LB2564
.LB2572:
	cmpb $9, %dl
	je .LB2564
.LB2581:
	cmpb $10, %dl
	je .LB2564
.LB2590:
	cmpb $13, %dl
	jne .LB2565
.LB2564:
	incl %eax
	jmp .LB2563
.LB2565:
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
	movzbl %cl, %ecx
	setnp %sil
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
	mulss %xmm1, %xmm0
	movabsq $1056964608, %r10
	movq %r10, %xmm1
	addss %xmm1, %xmm0
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
	addl %r9d, %ebx
	imull $10, %ebx, %ebx
	movl %esi, %r9d
	subl %ebx, %r9d
	addl $48, %r9d
	movslq %ecx, %rbx
	movb %r9b, 32(%rsp,%rbx,1)
	movslq %esi, %rsi
	movabsq $3435973837, %r9
	imulq %rsi, %r9
	sarq $35, %r9
	shrq $63, %rsi
	addl %r9d, %esi
	incl %ecx
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
	addl %esi, %r9d
	imull $10, %r9d, %r9d
	movl %edi, %esi
	subl %r9d, %esi
	addl $48, %esi
	movslq %ecx, %r9
	movb %sil, (%rsp,%r9,1)
	movslq %edi, %rsi
	movabsq $3435973837, %rdi
	imulq %rsi, %rdi
	sarq $35, %rdi
	shrq $63, %rsi
	addl %edi, %esi
	movl %esi, %edi
	incl %ecx
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
	xorl %ecx, %ecx
	testl %r8d, %r8d
	cmovg %r8d, %ecx
	shrl $2, %ecx
	leal 2(%rax), %esi
	xorl %edi, %edi
.LB11168:
	testl %ecx, %ecx
	je .LB11170
.LB11169:
	leal (%rsi,%rdi), %r9d
	movslq %r9d, %r9
	movb $48, (%rdx,%r9,1)
	leal 1(%rdi), %r9d
	addl %esi, %r9d
	movslq %r9d, %r9
	movb $48, (%rdx,%r9,1)
	leal 2(%rdi), %r9d
	addl %esi, %r9d
	movslq %r9d, %r9
	movb $48, (%rdx,%r9,1)
	leal 3(%rdi), %r9d
	addl %esi, %r9d
	movslq %r9d, %r9
	movb $48, (%rdx,%r9,1)
	addl $4, %edi
	decl %ecx
	jne .LB11169
.LB11170:
	leal 2(%rax), %ecx
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
	movslq %ecx, %rcx
	movb $0, (%rdx,%rcx,1)
	incl %eax
	addl %r8d, %eax
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
	movzbl %al, %eax
	setnp %dl
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
	mulsd %xmm1, %xmm0
	movabsq $1056964608, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	addsd %xmm1, %xmm0
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
	addq %rax, %rdx
	imulq $10, %rdx, %rdx
	movq %rbx, %rax
	subq %rdx, %rax
	addq $48, %rax
	movslq %r9d, %rdx
	movb %al, 32(%rsp,%rdx,1)
	movq %rbx, %rax
	movabsq $7378697629483820647, %rdx
	imulq %rdx
	sarq $2, %rdx
	movq %rdx, %rax
	shrq $63, %rax
	addq %rdx, %rax
	movq %rax, %rbx
	incl %r9d
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
	addq %rax, %rdx
	imulq $10, %rdx, %rdx
	movq %r9, %rax
	subq %rdx, %rax
	addq $48, %rax
	movslq %edi, %rdx
	movb %al, (%rsp,%rdx,1)
	movq %r9, %rax
	movabsq $7378697629483820647, %rdx
	imulq %rdx
	sarq $2, %rdx
	movq %rdx, %rax
	shrq $63, %rax
	addq %rdx, %rax
	movq %rax, %r9
	incl %edi
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
	xorl %eax, %eax
	testl %r8d, %r8d
	cmovg %r8d, %eax
	shrl $2, %eax
	leal 2(%rsi), %edx
	xorl %edi, %edi
.LB11175:
	testl %eax, %eax
	je .LB11177
.LB11176:
	leal (%rdx,%rdi), %r9d
	movslq %r9d, %r9
	movb $48, (%rcx,%r9,1)
	leal 1(%rdi), %r9d
	addl %edx, %r9d
	movslq %r9d, %r9
	movb $48, (%rcx,%r9,1)
	leal 2(%rdi), %r9d
	addl %edx, %r9d
	movslq %r9d, %r9
	movb $48, (%rcx,%r9,1)
	leal 3(%rdi), %r9d
	addl %edx, %r9d
	movslq %r9d, %r9
	movb $48, (%rcx,%r9,1)
	addl $4, %edi
	decl %eax
	jne .LB11176
.LB11177:
	leal 2(%rsi), %eax
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
	movslq %eax, %rax
	movb $0, (%rcx,%rax,1)
	incl %esi
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
.LB11182:
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
	jge .LB11183
.LB11184:
	xorl %ecx, %ecx
	testl %r13d, %r13d
	cmovg %r13d, %ecx
	shrl $2, %ecx
	xorl %edx, %edx
.LB11185:
	testl %ecx, %ecx
	je .LB11187
.LB11186:
	movzbl (%rbx,%rdx,1), %esi
	movb %sil, (%rax,%rdx,1)
	movzbl 1(%rbx,%rdx,1), %esi
	movb %sil, 1(%rax,%rdx,1)
	movzbl 2(%rbx,%rdx,1), %esi
	movb %sil, 2(%rax,%rdx,1)
	movzbl 3(%rbx,%rdx,1), %esi
	movb %sil, 3(%rax,%rdx,1)
	addq $4, %rdx
	decl %ecx
	jne .LB11186
.LB11187:
	movslq %edx, %rcx
	movslq %r13d, %rdx
.LB3384:
	cmpq %rdx, %rcx
	jge .LB3387
.LB3385:
	movzbl (%rbx,%rcx,1), %esi
	movb %sil, (%rax,%rcx,1)
	incq %rcx
	cmpq %rdx, %rcx
	jl .LB3385
	jmp .LB3387
.LB11183:
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
.LB11188:
	testl %ecx, %ecx
	je .LB11190
.LB11189:
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
	jne .LB11189
.LB11190:
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
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB3445:
	movq %rdx, %rsi
	movq %r8, %rdi
	movq .LZERO(%rip), %r10
	movq %r10, -24(%rbp)
	leaq -24(%rbp), %rdx
	movzwl %cx, %ecx
	callq standard__strings__i16str__2__dataE1_sbits16__byteE1_ptr1__ret_dataE1_sbits16
	movzwl %ax, %eax
	movswl %ax, %eax
	xorl %ecx, %ecx
	testl %eax, %eax
	cmovg %eax, %ecx
	shrl $2, %ecx
	xorl %edx, %edx
.LB11191:
	testl %ecx, %ecx
	je .LB11193
.LB11192:
	movzbl -24(%rbp,%rdx,1), %r8d
	movslq (%rdi), %r9
	movb %r8b, (%rsi,%r9,1)
	movl (%rdi), %r8d
	incl %r8d
	movl %r8d, (%rdi)
	movzbl -23(%rbp,%rdx,1), %r9d
	movslq %r8d, %r8
	movb %r9b, (%rsi,%r8,1)
	movl (%rdi), %r8d
	incl %r8d
	movl %r8d, (%rdi)
	movzbl -22(%rbp,%rdx,1), %r9d
	movslq %r8d, %r8
	movb %r9b, (%rsi,%r8,1)
	movl (%rdi), %r8d
	incl %r8d
	movl %r8d, (%rdi)
	movzbl -21(%rbp,%rdx,1), %r9d
	movslq %r8d, %r8
	movb %r9b, (%rsi,%r8,1)
	movl (%rdi), %r8d
	incl %r8d
	movl %r8d, (%rdi)
	addq $4, %rdx
	decl %ecx
	jne .LB11192
.LB11193:
	movslq %edx, %rcx
	movslq %eax, %rdx
.LB3456:
	cmpq %rdx, %rcx
	jge .LB3458
.LB3457:
	movzbl -24(%rbp,%rcx,1), %r8d
	movslq (%rdi), %r9
	movb %r8b, (%rsi,%r9,1)
	movl (%rdi), %r8d
	incl %r8d
	movl %r8d, (%rdi)
	incq %rcx
	cmpq %rdx, %rcx
	jl .LB3457
.LB3458:
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
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
	subq $80, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB3476:
	movq %rdx, %rsi
	movq %r8, %rdi
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -48(%rbp)
	vzeroupper
	leaq -48(%rbp), %rdx
	callq standard__strings__i32str__2__dataE1_sbits32__byteE1_ptr1__ret_dataE1_sbits32
	xorl %ecx, %ecx
	testl %eax, %eax
	cmovg %eax, %ecx
	shrl $2, %ecx
	xorl %edx, %edx
.LB11194:
	testl %ecx, %ecx
	je .LB11196
.LB11195:
	movzbl -48(%rbp,%rdx,1), %r8d
	movslq (%rdi), %r9
	movb %r8b, (%rsi,%r9,1)
	movl (%rdi), %r8d
	incl %r8d
	movl %r8d, (%rdi)
	movzbl -47(%rbp,%rdx,1), %r9d
	movslq %r8d, %r8
	movb %r9b, (%rsi,%r8,1)
	movl (%rdi), %r8d
	incl %r8d
	movl %r8d, (%rdi)
	movzbl -46(%rbp,%rdx,1), %r9d
	movslq %r8d, %r8
	movb %r9b, (%rsi,%r8,1)
	movl (%rdi), %r8d
	incl %r8d
	movl %r8d, (%rdi)
	movzbl -45(%rbp,%rdx,1), %r9d
	movslq %r8d, %r8
	movb %r9b, (%rsi,%r8,1)
	movl (%rdi), %r8d
	incl %r8d
	movl %r8d, (%rdi)
	addq $4, %rdx
	decl %ecx
	jne .LB11195
.LB11196:
	movslq %edx, %rcx
	movslq %eax, %rdx
.LB3486:
	cmpq %rdx, %rcx
	jge .LB3488
.LB3487:
	movzbl -48(%rbp,%rcx,1), %r8d
	movslq (%rdi), %r9
	movb %r8b, (%rsi,%r9,1)
	movl (%rdi), %r8d
	incl %r8d
	movl %r8d, (%rdi)
	incq %rcx
	cmpq %rdx, %rcx
	jl .LB3487
.LB3488:
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
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
	subq $80, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB3506:
	movq %rdx, %rsi
	movq %r8, %rdi
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -48(%rbp)
	vzeroupper
	leaq -48(%rbp), %rdx
	callq standard__strings__i64str__2__dataE1_sbits64__byteE1_ptr1__ret_dataE1_sbits64
	xorl %ecx, %ecx
	testl %eax, %eax
	cmovg %eax, %ecx
	shrl $2, %ecx
	xorl %edx, %edx
.LB11197:
	testl %ecx, %ecx
	je .LB11199
.LB11198:
	movzbl -48(%rbp,%rdx,1), %r8d
	movslq (%rdi), %r9
	movb %r8b, (%rsi,%r9,1)
	movl (%rdi), %r8d
	incl %r8d
	movl %r8d, (%rdi)
	movzbl -47(%rbp,%rdx,1), %r9d
	movslq %r8d, %r8
	movb %r9b, (%rsi,%r8,1)
	movl (%rdi), %r8d
	incl %r8d
	movl %r8d, (%rdi)
	movzbl -46(%rbp,%rdx,1), %r9d
	movslq %r8d, %r8
	movb %r9b, (%rsi,%r8,1)
	movl (%rdi), %r8d
	incl %r8d
	movl %r8d, (%rdi)
	movzbl -45(%rbp,%rdx,1), %r9d
	movslq %r8d, %r8
	movb %r9b, (%rsi,%r8,1)
	movl (%rdi), %r8d
	incl %r8d
	movl %r8d, (%rdi)
	addq $4, %rdx
	decl %ecx
	jne .LB11198
.LB11199:
	movslq %edx, %rcx
	movslq %eax, %rdx
.LB3517:
	cmpq %rdx, %rcx
	jge .LB3519
.LB3518:
	movzbl -48(%rbp,%rcx,1), %r8d
	movslq (%rdi), %r9
	movb %r8b, (%rsi,%r9,1)
	movl (%rdi), %r8d
	incl %r8d
	movl %r8d, (%rdi)
	incq %rcx
	cmpq %rdx, %rcx
	jl .LB3518
.LB3519:
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
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
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB3537:
	movq %rdx, %rsi
	movq %r8, %rdi
	movq .LZERO(%rip), %r10
	movq %r10, -24(%rbp)
	leaq -24(%rbp), %rdx
	movzwl %cx, %ecx
	callq standard__strings__u16str__2__dataE1_ubits16__byteE1_ptr1__ret_dataE1_ubits16
	movzwl %ax, %eax
	xorl %ecx, %ecx
	testl %eax, %eax
	cmovg %eax, %ecx
	shrl $2, %ecx
	xorl %edx, %edx
.LB11200:
	testl %ecx, %ecx
	je .LB11202
.LB11201:
	movzbl -24(%rbp,%rdx,1), %r8d
	movslq (%rdi), %r9
	movb %r8b, (%rsi,%r9,1)
	movl (%rdi), %r8d
	incl %r8d
	movl %r8d, (%rdi)
	movzbl -23(%rbp,%rdx,1), %r9d
	movslq %r8d, %r8
	movb %r9b, (%rsi,%r8,1)
	movl (%rdi), %r8d
	incl %r8d
	movl %r8d, (%rdi)
	movzbl -22(%rbp,%rdx,1), %r9d
	movslq %r8d, %r8
	movb %r9b, (%rsi,%r8,1)
	movl (%rdi), %r8d
	incl %r8d
	movl %r8d, (%rdi)
	movzbl -21(%rbp,%rdx,1), %r9d
	movslq %r8d, %r8
	movb %r9b, (%rsi,%r8,1)
	movl (%rdi), %r8d
	incl %r8d
	movl %r8d, (%rdi)
	addq $4, %rdx
	decl %ecx
	jne .LB11201
.LB11202:
	movslq %edx, %rcx
	movslq %eax, %rdx
.LB3548:
	cmpq %rdx, %rcx
	jge .LB3550
.LB3549:
	movzbl -24(%rbp,%rcx,1), %r8d
	movslq (%rdi), %r9
	movb %r8b, (%rsi,%r9,1)
	movl (%rdi), %r8d
	incl %r8d
	movl %r8d, (%rdi)
	incq %rcx
	cmpq %rdx, %rcx
	jl .LB3549
.LB3550:
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
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
	subq $80, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB3568:
	movq %rdx, %rsi
	movq %r8, %rdi
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -48(%rbp)
	vzeroupper
	leaq -48(%rbp), %rdx
	callq standard__strings__u32str__2__dataE1_ubits32__byteE1_ptr1__ret_dataE1_ubits32
	xorl %ecx, %ecx
	testl %eax, %eax
	cmovg %eax, %ecx
	shrl $2, %ecx
	xorl %edx, %edx
.LB11203:
	testl %ecx, %ecx
	je .LB11205
.LB11204:
	movzbl -48(%rbp,%rdx,1), %r8d
	movslq (%rdi), %r9
	movb %r8b, (%rsi,%r9,1)
	movl (%rdi), %r8d
	incl %r8d
	movl %r8d, (%rdi)
	movzbl -47(%rbp,%rdx,1), %r9d
	movslq %r8d, %r8
	movb %r9b, (%rsi,%r8,1)
	movl (%rdi), %r8d
	incl %r8d
	movl %r8d, (%rdi)
	movzbl -46(%rbp,%rdx,1), %r9d
	movslq %r8d, %r8
	movb %r9b, (%rsi,%r8,1)
	movl (%rdi), %r8d
	incl %r8d
	movl %r8d, (%rdi)
	movzbl -45(%rbp,%rdx,1), %r9d
	movslq %r8d, %r8
	movb %r9b, (%rsi,%r8,1)
	movl (%rdi), %r8d
	incl %r8d
	movl %r8d, (%rdi)
	addq $4, %rdx
	decl %ecx
	jne .LB11204
.LB11205:
	movslq %edx, %rcx
	movslq %eax, %rdx
.LB3578:
	cmpq %rdx, %rcx
	jge .LB3580
.LB3579:
	movzbl -48(%rbp,%rcx,1), %r8d
	movslq (%rdi), %r9
	movb %r8b, (%rsi,%r9,1)
	movl (%rdi), %r8d
	incl %r8d
	movl %r8d, (%rdi)
	incq %rcx
	cmpq %rdx, %rcx
	jl .LB3579
.LB3580:
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
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
	subq $80, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB3598:
	movq %rdx, %rsi
	movq %r8, %rdi
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -48(%rbp)
	vzeroupper
	leaq -48(%rbp), %rdx
	callq standard__strings__u64str__2__dataE1_ubits64__byteE1_ptr1__ret_dataE1_ubits64
	xorl %ecx, %ecx
	testl %eax, %eax
	cmovg %eax, %ecx
	shrl $2, %ecx
	xorl %edx, %edx
.LB11206:
	testl %ecx, %ecx
	je .LB11208
.LB11207:
	movzbl -48(%rbp,%rdx,1), %r8d
	movslq (%rdi), %r9
	movb %r8b, (%rsi,%r9,1)
	movl (%rdi), %r8d
	incl %r8d
	movl %r8d, (%rdi)
	movzbl -47(%rbp,%rdx,1), %r9d
	movslq %r8d, %r8
	movb %r9b, (%rsi,%r8,1)
	movl (%rdi), %r8d
	incl %r8d
	movl %r8d, (%rdi)
	movzbl -46(%rbp,%rdx,1), %r9d
	movslq %r8d, %r8
	movb %r9b, (%rsi,%r8,1)
	movl (%rdi), %r8d
	incl %r8d
	movl %r8d, (%rdi)
	movzbl -45(%rbp,%rdx,1), %r9d
	movslq %r8d, %r8
	movb %r9b, (%rsi,%r8,1)
	movl (%rdi), %r8d
	incl %r8d
	movl %r8d, (%rdi)
	addq $4, %rdx
	decl %ecx
	jne .LB11207
.LB11208:
	movslq %edx, %rcx
	movslq %eax, %rdx
.LB3609:
	cmpq %rdx, %rcx
	jge .LB3611
.LB3610:
	movzbl -48(%rbp,%rcx,1), %r8d
	movslq (%rdi), %r9
	movb %r8b, (%rsi,%r9,1)
	movl (%rdi), %r8d
	incl %r8d
	movl %r8d, (%rdi)
	incq %rcx
	cmpq %rdx, %rcx
	jl .LB3610
.LB3611:
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
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
	subq $80, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB3629:
	movq %rdx, %rsi
	movq %r8, %rdi
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -48(%rbp)
	vzeroupper
	leaq -48(%rbp), %rdx
	movl $6, %r8d
	callq standard__strings__float2str__3__floatE1__byteE1_ptr1__dataE1_sbits32__ret_dataE1_sbits32
	xorl %ecx, %ecx
	testl %eax, %eax
	cmovg %eax, %ecx
	shrl $2, %ecx
	xorl %edx, %edx
.LB11209:
	testl %ecx, %ecx
	je .LB11211
.LB11210:
	movzbl -48(%rbp,%rdx,1), %r8d
	movslq (%rdi), %r9
	movb %r8b, (%rsi,%r9,1)
	movl (%rdi), %r8d
	incl %r8d
	movl %r8d, (%rdi)
	movzbl -47(%rbp,%rdx,1), %r9d
	movslq %r8d, %r8
	movb %r9b, (%rsi,%r8,1)
	movl (%rdi), %r8d
	incl %r8d
	movl %r8d, (%rdi)
	movzbl -46(%rbp,%rdx,1), %r9d
	movslq %r8d, %r8
	movb %r9b, (%rsi,%r8,1)
	movl (%rdi), %r8d
	incl %r8d
	movl %r8d, (%rdi)
	movzbl -45(%rbp,%rdx,1), %r9d
	movslq %r8d, %r8
	movb %r9b, (%rsi,%r8,1)
	movl (%rdi), %r8d
	incl %r8d
	movl %r8d, (%rdi)
	addq $4, %rdx
	decl %ecx
	jne .LB11210
.LB11211:
	movslq %edx, %rcx
	movslq %eax, %rdx
.LB3639:
	cmpq %rdx, %rcx
	jge .LB3641
.LB3640:
	movzbl -48(%rbp,%rcx,1), %r8d
	movslq (%rdi), %r9
	movb %r8b, (%rsi,%r9,1)
	movl (%rdi), %r8d
	incl %r8d
	movl %r8d, (%rdi)
	incq %rcx
	cmpq %rdx, %rcx
	jl .LB3640
.LB3641:
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
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
	subq $80, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB3659:
	movq %rdx, %rsi
	movq %r8, %rdi
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -48(%rbp)
	vzeroupper
	leaq -48(%rbp), %rdx
	movl $14, %r8d
	callq standard__strings__dbl2str__3__doubleE1__byteE1_ptr1__dataE1_sbits32__ret_dataE1_sbits32
	xorl %ecx, %ecx
	testl %eax, %eax
	cmovg %eax, %ecx
	shrl $2, %ecx
	xorl %edx, %edx
.LB11212:
	testl %ecx, %ecx
	je .LB11214
.LB11213:
	movzbl -48(%rbp,%rdx,1), %r8d
	movslq (%rdi), %r9
	movb %r8b, (%rsi,%r9,1)
	movl (%rdi), %r8d
	incl %r8d
	movl %r8d, (%rdi)
	movzbl -47(%rbp,%rdx,1), %r9d
	movslq %r8d, %r8
	movb %r9b, (%rsi,%r8,1)
	movl (%rdi), %r8d
	incl %r8d
	movl %r8d, (%rdi)
	movzbl -46(%rbp,%rdx,1), %r9d
	movslq %r8d, %r8
	movb %r9b, (%rsi,%r8,1)
	movl (%rdi), %r8d
	incl %r8d
	movl %r8d, (%rdi)
	movzbl -45(%rbp,%rdx,1), %r9d
	movslq %r8d, %r8
	movb %r9b, (%rsi,%r8,1)
	movl (%rdi), %r8d
	incl %r8d
	movl %r8d, (%rdi)
	addq $4, %rdx
	decl %ecx
	jne .LB11213
.LB11214:
	movslq %edx, %rcx
	movslq %eax, %rdx
.LB3669:
	cmpq %rdx, %rcx
	jge .LB3671
.LB3670:
	movzbl -48(%rbp,%rcx,1), %r8d
	movslq (%rdi), %r9
	movb %r8b, (%rsi,%r9,1)
	movl (%rdi), %r8d
	incl %r8d
	movl %r8d, (%rdi)
	incq %rcx
	cmpq %rdx, %rcx
	jl .LB3670
.LB3671:
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
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
.LB11215:
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
	movslq %r8d, %r8
	movzbl (%rsi,%r8,1), %r8d
	movslq %edx, %r9
	movzbl (%rdi,%r9,1), %r9d
	cmpb %r9b, %r8b
	jne .LB3785
.LB3786:
	incl %edx
	cmpl %eax, %edx
	jl .LB3767
	jmp .LB11215
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
.LB11216:
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
	movslq %r9d, %r9
	movzbl (%rsi,%r9,1), %r9d
	movslq %r8d, %r12
	movzbl (%rdi,%r12,1), %r12d
	cmpb %r12b, %r9b
	jne .LB3898
.LB3899:
	incl %r8d
	cmpl %eax, %r8d
	jl .LB3880
	jmp .LB11216
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
	subq $48, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
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
	xorl %eax, %eax
	testl %edi, %edi
	cmovg %edi, %eax
	shrl $2, %eax
	xorl %ecx, %ecx
.LB11217:
	testl %eax, %eax
	je .LB11219
.LB11218:
	movslq %ecx, %rdx
	movzbl (%rsi,%rdx,1), %edx
	movl standard__io__console__out_len(%rip), %r8d
	addl %ecx, %r8d
	leaq standard__io__console__out_buf(%rip), %r9
	movslq %r8d, %r8
	movb %dl, (%r9,%r8,1)
	leal 1(%rcx), %edx
	movslq %edx, %r8
	movzbl (%rsi,%r8,1), %r8d
	movl standard__io__console__out_len(%rip), %r9d
	addl %edx, %r9d
	leaq standard__io__console__out_buf(%rip), %rdx
	movslq %r9d, %r9
	movb %r8b, (%rdx,%r9,1)
	leal 2(%rcx), %edx
	movslq %edx, %r8
	movzbl (%rsi,%r8,1), %r8d
	movl standard__io__console__out_len(%rip), %r9d
	addl %edx, %r9d
	leaq standard__io__console__out_buf(%rip), %rdx
	movslq %r9d, %r9
	movb %r8b, (%rdx,%r9,1)
	leal 3(%rcx), %edx
	movslq %edx, %r8
	movzbl (%rsi,%r8,1), %r8d
	movl standard__io__console__out_len(%rip), %r9d
	addl %edx, %r9d
	leaq standard__io__console__out_buf(%rip), %rdx
	movslq %r9d, %r9
	movb %r8b, (%rdx,%r9,1)
	addl $4, %ecx
	decl %eax
	jne .LB11218
	jmp .LB11219
.LB3955:
	callq standard__io__console__flush__0__ret_voidE1
	jmp .LB3957
.LB11219:
.LB3958:
	cmpl %edi, %ecx
	jge .LB3960
.LB3959:
	movslq %ecx, %rax
	movzbl (%rsi,%rax,1), %eax
	movl standard__io__console__out_len(%rip), %edx
	addl %ecx, %edx
	leaq standard__io__console__out_buf(%rip), %r8
	movslq %edx, %rdx
	movb %al, (%r8,%rdx,1)
	incl %ecx
	cmpl %edi, %ecx
	jl .LB3959
.LB3960:
	movl standard__io__console__out_len(%rip), %eax
	addl %edi, %eax
	movl %eax, standard__io__console__out_len(%rip)
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
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
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB3941:
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
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
	movb %cl, -10(%rbp)
	movb $0, -9(%rbp)
	leaq -10(%rbp), %rsi
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
	movb %cl, -10(%rbp)
	movb $0, -9(%rbp)
	leaq -10(%rbp), %rsi
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
	movb %cl, -10(%rbp)
	movb $0, -9(%rbp)
	leaq -10(%rbp), %rsi
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
	movl $11440, %eax
	callq __chkstk
	subq %rax, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
	movq %r14, -48(%rbp)
	movq %r15, -56(%rbp)
.LB9929:
	movl $32, %ecx
	callq math__decimal__decimal_set_precision__1__dataE1_sbits32__ret_voidE1
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -104(%rbp)
	movups .LZERO+32(%rip), %xmm15
	movups %xmm15, -72(%rbp)
	vzeroupper
	leaq -104(%rbp), %rax
	movq %rax, %rcx
	callq GetSystemInfo
	movl -72(%rbp), %eax
	movl $1, %ecx
	cmpl $1, %eax
	cmovl %ecx, %eax
	movl MAX_THREADS(%rip), %ecx
	cmpl %ecx, %eax
	cmovg %ecx, %eax
	movq %rax, -11360(%rbp)
	movl $1768386380, -120(%rbp)
	movl $543973731, -116(%rbp)
	movl $1701998435, -112(%rbp)
	movl $2112115, -108(%rbp)
	leaq -120(%rbp), %rsi
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -141(%rbp)
	movl .LZERO+16(%rip), %r10d
	movl %r10d, -125(%rbp)
	movb .LZERO+20(%rip), %r10b
	movb %r10b, -121(%rbp)
	leaq -141(%rbp), %rdx
	movq -11360(%rbp), %rcx
	callq standard__strings__i32str__2__dataE1_sbits32__byteE1_ptr1__ret_dataE1_sbits32
	leaq -141(%rbp), %rsi
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	movw $10, -143(%rbp)
	leaq -143(%rbp), %rsi
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	movl $1768121668, -163(%rbp)
	movl $543973741, -159(%rbp)
	movl $1667592816, -155(%rbp)
	movl $1869181801, -151(%rbp)
	movl $2112110, -147(%rbp)
	leaq -163(%rbp), %rsi
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -184(%rbp)
	movl .LZERO+16(%rip), %r10d
	movl %r10d, -168(%rbp)
	movb .LZERO+20(%rip), %r10b
	movb %r10b, -164(%rbp)
	leaq -184(%rbp), %rdx
	movl $32, %ecx
	callq standard__strings__i32str__2__dataE1_sbits32__byteE1_ptr1__ret_dataE1_sbits32
	leaq -184(%rbp), %rsi
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	movl $1734960160, -193(%rbp)
	movl $175338601, -189(%rbp)
	movb $0, -185(%rbp)
	leaq -193(%rbp), %rsi
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	leaq 304, %rax
	movq %rax, %rcx
	leaq -504(%rbp), %rax
	movq %rax, %rdi
	xorl %eax, %eax
	rep stosb
	movl $1684955469, -587(%rbp)
	movl $1919052901, -583(%rbp)
	movl $1394635887, -579(%rbp)
	movl $1528853605, -575(%rbp)
	movl $1768121668, -571(%rbp)
	movl $543973741, -567(%rbp)
	movl $723530291, -563(%rbp)
	movl $1919242272, -559(%rbp)
	movl $1651668340, -555(%rbp)
	movl $1869182049, -551(%rbp)
	movl $757095790, -547(%rbp)
	movl $1395611424, -543(%rbp)
	movl $1868177466, -539(%rbp)
	movl $538996079, -535(%rbp)
	movl $977547073, -531(%rbp)
	movl $1851871264, -527(%rbp)
	movl $538990624, -523(%rbp)
	movl $1143959637, -519(%rbp)
	movl $980318063, -515(%rbp)
	movl $1851871264, -511(%rbp)
	movw $22816, -507(%rbp)
	movb $0, -505(%rbp)
	leaq -587(%rbp), %rdx
	movl WIN_W(%rip), %eax
	movl WIN_H(%rip), %ecx
	leaq -504(%rbp), %rsi
	movq %rax, 32(%rsp)
	movq %rcx, 40(%rsp)
	movq %rsi, %rcx
	movl $100, %r8d
	movl $100, %r9d
	callq standard__system__windows__Window.__init__5__byteE1_ptr1__intE1__intE1__intE1__intE1__ret_thisE1
	movq -488(%rbp), %rcx
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -616(%rbp)
	movq .LZERO+16(%rip), %r10
	movq %r10, -600(%rbp)
	movq %rcx, -616(%rbp)
	callq OpenGL__setup_opengl__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -608(%rbp)
	movb $0, -600(%rbp)
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
	movl $0, -620(%rbp)
	leaq -620(%rbp), %rdx
	movl $1, %ecx
	callq glGenTextures
	movl GL_TEXTURE_2D(%rip), %ecx
	movl -620(%rbp), %edx
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
	leaq .LZERO(%rip), %rsi
	leaq -1148(%rbp), %rdi
	movl $525, %ecx
	rep movsb
	leaq .LZERO(%rip), %rsi
	leaq -1676(%rbp), %rdi
	movl $525, %ecx
	rep movsb
	leaq .LZERO(%rip), %rsi
	leaq -2204(%rbp), %rdi
	movl $525, %ecx
	rep movsb
	leaq .LZERO(%rip), %rsi
	leaq -2732(%rbp), %rdi
	movl $525, %ecx
	rep movsb
	leaq .LZERO(%rip), %rsi
	leaq -3260(%rbp), %rdi
	movl $525, %ecx
	rep movsb
	leaq .LZERO(%rip), %rsi
	leaq -3788(%rbp), %rdi
	movl $525, %ecx
	rep movsb
	leaq .LZERO(%rip), %rsi
	leaq -4316(%rbp), %rdi
	movl $525, %ecx
	rep movsb
	leaq .LZERO(%rip), %rsi
	leaq -4844(%rbp), %rdi
	movl $525, %ecx
	rep movsb
	leaq .LZERO(%rip), %rsi
	leaq -5372(%rbp), %rdi
	movl $525, %ecx
	rep movsb
	leaq .LZERO(%rip), %rsi
	leaq -5900(%rbp), %rdi
	movl $525, %ecx
	rep movsb
	leaq .LZERO(%rip), %rsi
	leaq -6428(%rbp), %rdi
	movl $525, %ecx
	rep movsb
	leaq .LZERO(%rip), %rsi
	leaq -6956(%rbp), %rdi
	movl $525, %ecx
	rep movsb
	leaq .LZERO(%rip), %rsi
	leaq -7484(%rbp), %rdi
	movl $525, %ecx
	rep movsb
	leaq .LZERO(%rip), %rsi
	leaq -8012(%rbp), %rdi
	movl $525, %ecx
	rep movsb
	leaq .LZERO(%rip), %rsi
	leaq -8540(%rbp), %rdi
	movl $525, %ecx
	rep movsb
	leaq .LZERO(%rip), %rsi
	leaq -9068(%rbp), %rdi
	movl $525, %ecx
	rep movsb
	leaq .LZERO(%rip), %rsi
	leaq -9596(%rbp), %rdi
	movl $525, %ecx
	rep movsb
	leaq .LZERO(%rip), %rsi
	leaq -10124(%rbp), %rdi
	movl $525, %ecx
	rep movsb
	movw $49, -10126(%rbp)
	leaq -10126(%rbp), %rdx
	leaq -8012(%rbp), %rcx
	callq math__decimal__decimal_from_string__2__DecimalE1_ptr1__byteE1_ptr1__ret_voidE1
	movl $825241136, -10131(%rbp)
	movb $0, -10127(%rbp)
	leaq -10131(%rbp), %rdx
	leaq -8540(%rbp), %rcx
	callq math__decimal__decimal_from_string__2__DecimalE1_ptr1__byteE1_ptr1__ret_voidE1
	movl $808463920, -10138(%rbp)
	movw $12592, -10134(%rbp)
	movb $0, -10132(%rbp)
	leaq -10138(%rbp), %rdx
	leaq -9068(%rbp), %rcx
	callq math__decimal__decimal_from_string__2__DecimalE1_ptr1__byteE1_ptr1__ret_voidE1
	movl $808463920, -10155(%rbp)
	movl $808464432, -10151(%rbp)
	movl $808464432, -10147(%rbp)
	movl $825241648, -10143(%rbp)
	movb $0, -10139(%rbp)
	leaq -10155(%rbp), %rdx
	leaq -9596(%rbp), %rcx
	callq math__decimal__decimal_from_string__2__DecimalE1_ptr1__byteE1_ptr1__ret_voidE1
	movl $808463920, -10171(%rbp)
	movl $808464432, -10167(%rbp)
	movl $808464432, -10163(%rbp)
	movl $3223600, -10159(%rbp)
	leaq -10171(%rbp), %rdx
	leaq -10124(%rbp), %rcx
	callq math__decimal__decimal_from_string__2__DecimalE1_ptr1__byteE1_ptr1__ret_voidE1
	movl $892219437, -10176(%rbp)
	movb $0, -10172(%rbp)
	leaq -10176(%rbp), %rdx
	leaq -1148(%rbp), %rcx
	callq math__decimal__decimal_from_string__2__DecimalE1_ptr1__byteE1_ptr1__ret_voidE1
	movw $48, -10178(%rbp)
	leaq -10178(%rbp), %rdx
	leaq -1676(%rbp), %rcx
	callq math__decimal__decimal_from_string__2__DecimalE1_ptr1__byteE1_ptr1__ret_voidE1
	movw $51, -10180(%rbp)
	leaq -10180(%rbp), %rdx
	leaq -2204(%rbp), %rcx
	callq math__decimal__decimal_from_string__2__DecimalE1_ptr1__byteE1_ptr1__ret_voidE1
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -10196(%rbp)
	leaq .LZERO(%rip), %rsi
	leaq -10964(%rbp), %rdi
	movl $768, %ecx
	rep movsb
	callq GetTickCount
	movq -11360(%rbp), %rcx
	decl %ecx
	movq %rcx, -11352(%rbp)
	leaq worker__1__voidE1_ptr1__ret_voidE1_ptr1(%rip), %rcx
	movq %rcx, -11312(%rbp)
	movabsq $0, %r10
	movq %r10, -11064(%rbp)
	movabsq $0, %r10
	movq %r10, -11072(%rbp)
	movabsq $0, %r10
	movq %r10, -11080(%rbp)
	movq $0, -11192(%rbp)
	movq $1, -11088(%rbp)
	xorl %esi, %esi
	movq %rax, %rdi
.LB10259:
	leaq -504(%rbp), %rcx
	callq standard__system__windows__Window.process_messages__0__ret_boolE1
	testb %al, %al
	je .LB10261
.LB10260:
	callq GetTickCount
	movq %rax, -11112(%rbp)
	subl %edi, %eax
	movslq %eax, %rax
	xorps %xmm0, %xmm0
	cvtsi2ssq %rax, %xmm0
	movabsq $1148846080, %r10
	movq %r10, %xmm1
	divss %xmm1, %xmm0
	movabsq $1036831949, %r10
	movq %r10, %xmm1
	ucomiss %xmm1, %xmm0
	ja .LB10272
.LB10273:
	movsd %xmm0, -11096(%rbp)
.LB10274:
	movsd -11096(%rbp), %xmm0
	cvtss2sd %xmm0, %xmm0
	movabsq $1039516303, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	mulsd %xmm1, %xmm0
	movsd -11064(%rbp), %xmm1
	addsd %xmm1, %xmm0
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm1, %xmm0
	jae .LB10284
.LB10285:
	movsd %xmm0, -11104(%rbp)
.LB10286:
	movq -504(%rbp), %rcx
	leaq -10196(%rbp), %rdx
	callq GetClientRect
	movl -10188(%rbp), %eax
	movl -10196(%rbp), %ecx
	subl %ecx, %eax
	movl -10184(%rbp), %ecx
	movl -10192(%rbp), %edx
	subl %edx, %ecx
	movl $1, %edx
	cmpl $1, %eax
	movl %eax, %r8d
	cmovl %edx, %r8d
	movq %r8, -11200(%rbp)
	movl $1, %eax
	cmpl $1, %ecx
	movl %ecx, %r9d
	cmovl %eax, %r9d
	movq %r9, -11216(%rbp)
	xorl %ecx, %ecx
	xorl %edx, %edx
	callq glViewport
	movl VK_W(%rip), %ecx
	callq GetAsyncKeyState
	movzwl %ax, %eax
	movq %rax, -11120(%rbp)
	movl VK_S(%rip), %ecx
	callq GetAsyncKeyState
	movzwl %ax, %eax
	movq %rax, -11128(%rbp)
	movl VK_A(%rip), %ecx
	callq GetAsyncKeyState
	movzwl %ax, %eax
	movq %rax, -11136(%rbp)
	movl VK_D(%rip), %ecx
	callq GetAsyncKeyState
	movzwl %ax, %eax
	movq %rax, -11144(%rbp)
	movl standard__system__windows__VK_UP(%rip), %ecx
	callq GetAsyncKeyState
	movzwl %ax, %eax
	movq %rax, -11152(%rbp)
	movl standard__system__windows__VK_DOWN(%rip), %ecx
	callq GetAsyncKeyState
	movzwl %ax, %eax
	movq %rax, -11160(%rbp)
	movq -11120(%rbp), %rax
	movzwl %ax, %eax
	andl $32768, %eax
	je .LB10342
.LB11220:
	movq $1, -11168(%rbp)
.LB10371:
	movq -11168(%rbp), %rax
	movq -11088(%rbp), %rcx
	orl %eax, %ecx
	movq %rcx, -11176(%rbp)
	testb %al, %al
	jne .LB10382
.LB10383:
	movl TILE_STILL(%rip), %eax
	movq %rax, -11184(%rbp)
.LB10384:
	movq -11200(%rbp), %rax
	cltd
	movq -11184(%rbp), %rcx
	idivl %ecx
	movl %eax, %edi
	movq -11216(%rbp), %rax
	cltd
	idivl %ecx
	movl $1, %ecx
	cmpl $1, %edi
	cmovl %ecx, %edi
	movl $1, %ecx
	cmpl $1, %eax
	movl %eax, %ebx
	cmovl %ecx, %ebx
	movl -1684(%rbp), %eax
	movq %rax, -11208(%rbp)
	leaq -2204(%rbp), %rcx
	callq math__decimal__decimal_bigint_digit_count__1__BigIntE1_ptr1__ret_dataE1_sbits32
	movq -11208(%rbp), %rcx
	addl %eax, %ecx
	decl %ecx
	xorl %eax, %eax
	subl %ecx, %eax
	xorl %ecx, %ecx
	testl %eax, %eax
	cmovs %ecx, %eax
	movl $40, %ecx
	cmpl $40, %eax
	cmovg %ecx, %eax
	imull $200, %eax, %eax
	addl $128, %eax
	movl MAX_ITER(%rip), %ecx
	cmpl %ecx, %eax
	cmovg %ecx, %eax
	movl %eax, %ecx
	sarl $1, %ecx
	movq -11168(%rbp), %rdx
	testb %dl, %dl
	movl %eax, %r12d
	cmovne %ecx, %r12d
	movq -11192(%rbp), %rax
	cmpl %eax, %r12d
	setne %cl
	movzbl %cl, %ecx
	testb %cl, %cl
	cmovne %r12d, %eax
	movq %rax, -11224(%rbp)
	movq -11176(%rbp), %rax
	orl %eax, %ecx
	movq %rcx, -11232(%rbp)
	movq -11120(%rbp), %rax
	movzwl %ax, %eax
	andl $32768, %eax
	jne .LB10452
.LB10454:
	movq -11128(%rbp), %rax
	movzwl %ax, %eax
	andl $32768, %eax
	jne .LB10515
.LB10517:
	movq -11136(%rbp), %rax
	movzwl %ax, %eax
	andl $32768, %eax
	jne .LB10550
.LB10552:
	movq -11144(%rbp), %rax
	movzwl %ax, %eax
	andl $32768, %eax
	jne .LB10572
.LB10574:
	movq -11152(%rbp), %rax
	movzwl %ax, %eax
	andl $32768, %eax
	jne .LB10594
.LB10596:
	movq -11160(%rbp), %rax
	movzwl %ax, %eax
	andl $32768, %eax
	jne .LB10616
.LB10618:
	movl g_cols(%rip), %eax
	cmpl %eax, %edi
	jne .LB10643
.LB10637:
	movl g_rows(%rip), %eax
	cmpl %eax, %ebx
	jne .LB10643
.LB10644:
	movq -11232(%rbp), %rax
	xorl $1, %eax
	xorl %ecx, %ecx
	movq -11168(%rbp), %rdx
	testb %dl, %dl
	cmovne %ecx, %eax
	movq %rax, -11240(%rbp)
.LB10645:
	movl $3485232, -11052(%rbp)
	leaq -11052(%rbp), %rdx
	leaq -5372(%rbp), %rcx
	callq math__decimal__decimal_from_string__2__DecimalE1_ptr1__byteE1_ptr1__ret_voidE1
	leaq -2732(%rbp), %rcx
	leaq -2204(%rbp), %rdx
	leaq -5372(%rbp), %r8
	callq math__decimal__decimal_mul__3__DecimalE1_ptr1__DecimalE1_ptr1__DecimalE1_ptr1__ret_voidE1
	leaq -3260(%rbp), %rcx
	leaq -1148(%rbp), %rdx
	leaq -2732(%rbp), %r8
	callq math__decimal__decimal_sub__3__DecimalE1_ptr1__DecimalE1_ptr1__DecimalE1_ptr1__ret_voidE1
	movl -11216(%rbp), %edx
	leaq -5372(%rbp), %rcx
	callq math__decimal__decimal_from_i64__2__DecimalE1_ptr1__dataE1_sbits64__ret_voidE1
	movl -11200(%rbp), %edx
	leaq -5900(%rbp), %rcx
	callq math__decimal__decimal_from_i64__2__DecimalE1_ptr1__dataE1_sbits64__ret_voidE1
	leaq -6428(%rbp), %rcx
	leaq -2204(%rbp), %rdx
	leaq -5372(%rbp), %r8
	callq math__decimal__decimal_mul__3__DecimalE1_ptr1__DecimalE1_ptr1__DecimalE1_ptr1__ret_voidE1
	leaq -4844(%rbp), %rcx
	leaq -6428(%rbp), %rdx
	leaq -5900(%rbp), %r8
	callq math__decimal__decimal_div__3__DecimalE1_ptr1__DecimalE1_ptr1__DecimalE1_ptr1__ret_voidE1
	movl $3485232, -11056(%rbp)
	leaq -11056(%rbp), %rdx
	leaq -5372(%rbp), %rcx
	callq math__decimal__decimal_from_string__2__DecimalE1_ptr1__byteE1_ptr1__ret_voidE1
	leaq -5900(%rbp), %rcx
	leaq -4844(%rbp), %rdx
	leaq -5372(%rbp), %r8
	callq math__decimal__decimal_mul__3__DecimalE1_ptr1__DecimalE1_ptr1__DecimalE1_ptr1__ret_voidE1
	leaq -3788(%rbp), %rcx
	leaq -1676(%rbp), %rdx
	leaq -5900(%rbp), %r8
	callq math__decimal__decimal_sub__3__DecimalE1_ptr1__DecimalE1_ptr1__DecimalE1_ptr1__ret_voidE1
	leaq -4316(%rbp), %rcx
	leaq -2204(%rbp), %rdx
	callq math__decimal__decimal_copy__2__DecimalE1_ptr1__DecimalE1_ptr1__ret_voidE1
	testb %sil, %sil
	je .LB10707
.LB10708:
	leaq -2204(%rbp), %rcx
	leaq -10124(%rbp), %rdx
	callq math__decimal__decimal_cmp__2__DecimalE1_ptr1__DecimalE1_ptr1__ret_dataE1_sbits32
	xorl %ecx, %ecx
	testl %eax, %eax
	movl %esi, %eax
	cmovg %ecx, %eax
	movq %rax, -11256(%rbp)
.LB10709:
	movq -11256(%rbp), %rax
	cmpb %sil, %al
	setne %al
	movzbl %al, %eax
	movq -11232(%rbp), %rcx
	orl %ecx, %eax
	testb %al, %al
	je .LB10733
.LB10727:
	movq -11168(%rbp), %rcx
	testb %cl, %cl
	je .LB10732
.LB10733:
	movq -11072(%rbp), %r10
	movq %r10, -11264(%rbp)
	movq -11080(%rbp), %r10
	movq %r10, -11272(%rbp)
	movq -11240(%rbp), %rsi
	movq %rax, -11280(%rbp)
.LB10734:
	movq -11168(%rbp), %rax
	testb %al, %al
	jne .LB10759
.LB10747:
	movl g_ref_len(%rip), %eax
	testl %eax, %eax
	jle .LB10759
.LB10752:
	cmpl %r12d, %eax
	jl .LB10758
.LB10759:
	movq $0, -11304(%rbp)
.LB10760:
	movl %ebx, %eax
	cltd
	movq -11360(%rbp), %rcx
	idivl %ecx
	movl $1, %ecx
	cmpl $1, %eax
	movl %eax, %r13d
	cmovl %ecx, %r13d
	leaq -3260(%rbp), %rcx
	callq math__decimal__decimal_to_double__1__DecimalE1_ptr1__ret_doubleE1
	movsd %xmm0, -11320(%rbp)
	leaq -3788(%rbp), %rcx
	callq math__decimal__decimal_to_double__1__DecimalE1_ptr1__ret_doubleE1
	movsd %xmm0, -11328(%rbp)
	leaq -4316(%rbp), %rcx
	callq math__decimal__decimal_to_double__1__DecimalE1_ptr1__ret_doubleE1
	movsd %xmm0, -11336(%rbp)
	leaq -4844(%rbp), %rcx
	callq math__decimal__decimal_to_double__1__DecimalE1_ptr1__ret_doubleE1
	movsd %xmm0, -11344(%rbp)
	xorl %eax, %eax
.LB10774:
	movq -11360(%rbp), %rcx
	cmpl %ecx, %eax
	jge .LB10776
.LB10775:
	movl %eax, %ecx
	imull %r13d, %ecx
	leaq g_slices(%rip), %rdx
	movslq %eax, %r14
	imulq $2208, %r14, %r8
	movl %ecx, (%rdx,%r8,1)
	leal 1(%rax), %r15d
	movl %r15d, %ecx
	imull %r13d, %ecx
	movq -11352(%rbp), %rdx
	cmpl %edx, %eax
	cmove %ebx, %ecx
	leaq g_slices(%rip), %rax
	imulq $2208, %r14, %rdx
	movl %ecx, 4(%rax,%rdx,1)
	leaq g_slices(%rip), %rax
	imulq $2208, %r14, %rcx
	movl %edi, 8(%rax,%rcx,1)
	leaq g_slices(%rip), %rax
	imulq $2208, %r14, %rcx
	movl %ebx, 12(%rax,%rcx,1)
	leaq g_slices(%rip), %rax
	imulq $2208, %r14, %rcx
	movl %r12d, 16(%rax,%rcx,1)
	leaq g_slices(%rip), %rax
	imulq $2208, %r14, %rcx
	movq -11184(%rbp), %rdx
	movl %edx, 20(%rax,%rcx,1)
	movl $1, %eax
	xorl %ecx, %ecx
	testb %sil, %sil
	cmovne %eax, %ecx
	leaq g_slices(%rip), %rax
	imulq $2208, %r14, %rdx
	movl %ecx, 24(%rax,%rdx,1)
	leaq g_slices(%rip), %rax
	imulq $2208, %r14, %rcx
	movq -11304(%rbp), %rdx
	movl %edx, 28(%rax,%rcx,1)
	movl $1, %eax
	xorl %ecx, %ecx
	movq -11256(%rbp), %rdx
	testb %dl, %dl
	cmovne %eax, %ecx
	leaq g_slices(%rip), %rax
	imulq $2208, %r14, %rdx
	movl %ecx, 32(%rax,%rdx,1)
	leaq g_slices(%rip), %rax
	imulq $2208, %r14, %rcx
	leaq 36(%rax,%rcx,1), %rcx
	leaq -3260(%rbp), %rdx
	callq math__decimal__decimal_copy__2__DecimalE1_ptr1__DecimalE1_ptr1__ret_voidE1
	leaq g_slices(%rip), %rax
	imulq $2208, %r14, %rcx
	leaq 564(%rax,%rcx,1), %rcx
	leaq -3788(%rbp), %rdx
	callq math__decimal__decimal_copy__2__DecimalE1_ptr1__DecimalE1_ptr1__ret_voidE1
	leaq g_slices(%rip), %rax
	imulq $2208, %r14, %rcx
	leaq 1092(%rax,%rcx,1), %rcx
	leaq -4316(%rbp), %rdx
	callq math__decimal__decimal_copy__2__DecimalE1_ptr1__DecimalE1_ptr1__ret_voidE1
	leaq g_slices(%rip), %rax
	imulq $2208, %r14, %rcx
	leaq 1620(%rax,%rcx,1), %rcx
	leaq -4844(%rbp), %rdx
	callq math__decimal__decimal_copy__2__DecimalE1_ptr1__DecimalE1_ptr1__ret_voidE1
	leaq g_slices(%rip), %rax
	imulq $2208, %r14, %rcx
	movsd -11320(%rbp), %xmm0
	movsd %xmm0, 2168(%rax,%rcx,1)
	leaq g_slices(%rip), %rax
	imulq $2208, %r14, %rcx
	movsd -11328(%rbp), %xmm0
	movsd %xmm0, 2176(%rax,%rcx,1)
	leaq g_slices(%rip), %rax
	imulq $2208, %r14, %rcx
	movsd -11336(%rbp), %xmm0
	movsd %xmm0, 2184(%rax,%rcx,1)
	leaq g_slices(%rip), %rax
	imulq $2208, %r14, %rcx
	movsd -11344(%rbp), %xmm0
	movsd %xmm0, 2192(%rax,%rcx,1)
	leaq g_slices(%rip), %rax
	imulq $2208, %r14, %rcx
	movsd -11264(%rbp), %xmm0
	movsd %xmm0, 2152(%rax,%rcx,1)
	leaq g_slices(%rip), %rax
	imulq $2208, %r14, %rcx
	movsd -11272(%rbp), %xmm0
	movsd %xmm0, 2160(%rax,%rcx,1)
	leaq g_slices(%rip), %rax
	imulq $2208, %r14, %rcx
	movsd -11104(%rbp), %xmm0
	movsd %xmm0, 2200(%rax,%rcx,1)
	leaq g_slices(%rip), %rax
	imulq $2208, %r14, %rcx
	leaq (%rax,%rcx,1), %rax
	movq %rax, %rdx
	leaq (%r14,%r14,2), %rax
	leaq -10964(%rbp,%rax,4), %r8
	movq -11312(%rbp), %rcx
	callq standard__threading__thread_create__3__voidE1_ptr1__voidE1_ptr1__ThreadE1_ptr1__ret_intE1
	movq %r15, %rax
	jmp .LB10774
.LB10261:
	movq g_pixels(%rip), %rax
	testq %rax, %rax
	jne .LB10917
.LB10919:
	movq g_iters(%rip), %rax
	testq %rax, %rax
	jne .LB10926
.LB10928:
	movq g_ref_zr(%rip), %rax
	testq %rax, %rax
	jne .LB10935
.LB10937:
	movq g_ref_zi(%rip), %rax
	testq %rax, %rax
	jne .LB10944
.LB10946:
	leaq -620(%rbp), %rdx
	movl $1, %ecx
	callq glDeleteTextures
	leaq -616(%rbp), %rcx
	callq OpenGL__GLContext.__exit__0__ret_voidE1
	leaq -504(%rbp), %rcx
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
.LB10917:
	movq %rax, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	jmp .LB10919
.LB10926:
	movq %rax, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	jmp .LB10928
.LB10935:
	movq %rax, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	jmp .LB10937
.LB10944:
	movq %rax, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	jmp .LB10946
.LB10272:
	movabsq $1036831949, %r10
	movq %r10, -11096(%rbp)
	jmp .LB10274
.LB10284:
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	subsd %xmm1, %xmm0
	movsd %xmm0, -11104(%rbp)
	jmp .LB10286
.LB10342:
	movq -11128(%rbp), %rax
	movzwl %ax, %eax
	andl $32768, %eax
	je .LB10349
.LB11221:
	movq $1, -11168(%rbp)
	jmp .LB10371
.LB10349:
	movq -11136(%rbp), %rax
	movzwl %ax, %eax
	andl $32768, %eax
	je .LB10356
.LB11222:
	movq $1, -11168(%rbp)
	jmp .LB10371
.LB10356:
	movq -11144(%rbp), %rax
	movzwl %ax, %eax
	andl $32768, %eax
	je .LB10363
.LB11223:
	movq $1, -11168(%rbp)
	jmp .LB10371
.LB10363:
	movq -11152(%rbp), %rax
	movzwl %ax, %eax
	andl $32768, %eax
	je .LB10370
.LB11224:
	movq $1, -11168(%rbp)
	jmp .LB10371
.LB10370:
	movq -11160(%rbp), %rax
	movzwl %ax, %eax
	andl $32768, %eax
	setne %al
	movzbl %al, %eax
	movq %rax, -11168(%rbp)
	jmp .LB10371
.LB10382:
	movl TILE_MOVING(%rip), %eax
	movq %rax, -11184(%rbp)
	jmp .LB10384
.LB10452:
	movw $49, -10966(%rbp)
	leaq -10966(%rbp), %rdx
	leaq -5372(%rbp), %rcx
	callq math__decimal__decimal_from_string__2__DecimalE1_ptr1__byteE1_ptr1__ret_voidE1
	movabsq $1050253722, %r10
	movq %r10, %xmm0
	movsd -11096(%rbp), %xmm1
	mulss %xmm1, %xmm0
	movabsq $1232348160, %r10
	movq %r10, %xmm1
	mulss %xmm1, %xmm0
	cvttss2siq %xmm0, %rdx
	leaq -5900(%rbp), %rcx
	callq math__decimal__decimal_from_i64__2__DecimalE1_ptr1__dataE1_sbits64__ret_voidE1
	movl $808464433, -10974(%rbp)
	movl $3158064, -10970(%rbp)
	leaq -10974(%rbp), %rdx
	leaq -6428(%rbp), %rcx
	callq math__decimal__decimal_from_string__2__DecimalE1_ptr1__byteE1_ptr1__ret_voidE1
	leaq -6956(%rbp), %rcx
	leaq -5900(%rbp), %rdx
	leaq -6428(%rbp), %r8
	callq math__decimal__decimal_div__3__DecimalE1_ptr1__DecimalE1_ptr1__DecimalE1_ptr1__ret_voidE1
	leaq -5372(%rbp), %rcx
	leaq -2204(%rbp), %rdx
	leaq -6956(%rbp), %r8
	callq math__decimal__decimal_mul__3__DecimalE1_ptr1__DecimalE1_ptr1__DecimalE1_ptr1__ret_voidE1
	leaq -2204(%rbp), %rcx
	leaq -2204(%rbp), %rdx
	leaq -5372(%rbp), %r8
	callq math__decimal__decimal_sub__3__DecimalE1_ptr1__DecimalE1_ptr1__DecimalE1_ptr1__ret_voidE1
	movl $808463920, -11004(%rbp)
	movl $808464432, -11000(%rbp)
	movl $808464432, -10996(%rbp)
	movl $808464432, -10992(%rbp)
	movl $808464432, -10988(%rbp)
	movl $808464432, -10984(%rbp)
	movl $808464432, -10980(%rbp)
	movw $49, -10976(%rbp)
	leaq -11004(%rbp), %rdx
	leaq -5372(%rbp), %rcx
	callq math__decimal__decimal_from_string__2__DecimalE1_ptr1__byteE1_ptr1__ret_voidE1
	leaq -2204(%rbp), %rcx
	leaq -5372(%rbp), %rdx
	callq math__decimal__decimal_cmp__2__DecimalE1_ptr1__DecimalE1_ptr1__ret_dataE1_sbits32
	testl %eax, %eax
	jns .LB10454
.LB10508:
	leaq -2204(%rbp), %rcx
	leaq -5372(%rbp), %rdx
	callq math__decimal__decimal_copy__2__DecimalE1_ptr1__DecimalE1_ptr1__ret_voidE1
	jmp .LB10454
.LB10515:
	movabsq $1050253722, %r10
	movq %r10, %xmm0
	movsd -11096(%rbp), %xmm1
	mulss %xmm1, %xmm0
	movabsq $1232348160, %r10
	movq %r10, %xmm1
	mulss %xmm1, %xmm0
	cvttss2siq %xmm0, %rdx
	leaq -5900(%rbp), %rcx
	callq math__decimal__decimal_from_i64__2__DecimalE1_ptr1__dataE1_sbits64__ret_voidE1
	movl $808464433, -11012(%rbp)
	movl $3158064, -11008(%rbp)
	leaq -11012(%rbp), %rdx
	leaq -6428(%rbp), %rcx
	callq math__decimal__decimal_from_string__2__DecimalE1_ptr1__byteE1_ptr1__ret_voidE1
	leaq -6956(%rbp), %rcx
	leaq -5900(%rbp), %rdx
	leaq -6428(%rbp), %r8
	callq math__decimal__decimal_div__3__DecimalE1_ptr1__DecimalE1_ptr1__DecimalE1_ptr1__ret_voidE1
	movw $49, -11014(%rbp)
	leaq -11014(%rbp), %rdx
	leaq -5372(%rbp), %rcx
	callq math__decimal__decimal_from_string__2__DecimalE1_ptr1__byteE1_ptr1__ret_voidE1
	leaq -5372(%rbp), %rcx
	leaq -5372(%rbp), %rdx
	leaq -6956(%rbp), %r8
	callq math__decimal__decimal_sub__3__DecimalE1_ptr1__DecimalE1_ptr1__DecimalE1_ptr1__ret_voidE1
	leaq -5900(%rbp), %rcx
	leaq -2204(%rbp), %rdx
	leaq -5372(%rbp), %r8
	callq math__decimal__decimal_div__3__DecimalE1_ptr1__DecimalE1_ptr1__DecimalE1_ptr1__ret_voidE1
	leaq -2204(%rbp), %rcx
	leaq -5900(%rbp), %rdx
	callq math__decimal__decimal_copy__2__DecimalE1_ptr1__DecimalE1_ptr1__ret_voidE1
	movw $56, -11016(%rbp)
	leaq -11016(%rbp), %rdx
	leaq -5372(%rbp), %rcx
	callq math__decimal__decimal_from_string__2__DecimalE1_ptr1__byteE1_ptr1__ret_voidE1
	leaq -2204(%rbp), %rcx
	leaq -5372(%rbp), %rdx
	callq math__decimal__decimal_cmp__2__DecimalE1_ptr1__DecimalE1_ptr1__ret_dataE1_sbits32
	testl %eax, %eax
	jle .LB10517
.LB10543:
	leaq -2204(%rbp), %rcx
	leaq -5372(%rbp), %rdx
	callq math__decimal__decimal_copy__2__DecimalE1_ptr1__DecimalE1_ptr1__ret_voidE1
	jmp .LB10517
.LB10550:
	movabsq $1028443341, %r10
	movq %r10, %xmm0
	movsd -11096(%rbp), %xmm1
	mulss %xmm1, %xmm0
	movabsq $1232348160, %r10
	movq %r10, %xmm1
	mulss %xmm1, %xmm0
	cvttss2siq %xmm0, %rdx
	leaq -5900(%rbp), %rcx
	callq math__decimal__decimal_from_i64__2__DecimalE1_ptr1__dataE1_sbits64__ret_voidE1
	movl $808464433, -11024(%rbp)
	movl $3158064, -11020(%rbp)
	leaq -11024(%rbp), %rdx
	leaq -6428(%rbp), %rcx
	callq math__decimal__decimal_from_string__2__DecimalE1_ptr1__byteE1_ptr1__ret_voidE1
	leaq -7484(%rbp), %rcx
	leaq -5900(%rbp), %rdx
	leaq -6428(%rbp), %r8
	callq math__decimal__decimal_div__3__DecimalE1_ptr1__DecimalE1_ptr1__DecimalE1_ptr1__ret_voidE1
	leaq -5372(%rbp), %rcx
	leaq -2204(%rbp), %rdx
	leaq -7484(%rbp), %r8
	callq math__decimal__decimal_mul__3__DecimalE1_ptr1__DecimalE1_ptr1__DecimalE1_ptr1__ret_voidE1
	leaq -1148(%rbp), %rcx
	leaq -1148(%rbp), %rdx
	leaq -5372(%rbp), %r8
	callq math__decimal__decimal_sub__3__DecimalE1_ptr1__DecimalE1_ptr1__DecimalE1_ptr1__ret_voidE1
	jmp .LB10552
.LB10572:
	movabsq $1028443341, %r10
	movq %r10, %xmm0
	movsd -11096(%rbp), %xmm1
	mulss %xmm1, %xmm0
	movabsq $1232348160, %r10
	movq %r10, %xmm1
	mulss %xmm1, %xmm0
	cvttss2siq %xmm0, %rdx
	leaq -5900(%rbp), %rcx
	callq math__decimal__decimal_from_i64__2__DecimalE1_ptr1__dataE1_sbits64__ret_voidE1
	movl $808464433, -11032(%rbp)
	movl $3158064, -11028(%rbp)
	leaq -11032(%rbp), %rdx
	leaq -6428(%rbp), %rcx
	callq math__decimal__decimal_from_string__2__DecimalE1_ptr1__byteE1_ptr1__ret_voidE1
	leaq -7484(%rbp), %rcx
	leaq -5900(%rbp), %rdx
	leaq -6428(%rbp), %r8
	callq math__decimal__decimal_div__3__DecimalE1_ptr1__DecimalE1_ptr1__DecimalE1_ptr1__ret_voidE1
	leaq -5372(%rbp), %rcx
	leaq -2204(%rbp), %rdx
	leaq -7484(%rbp), %r8
	callq math__decimal__decimal_mul__3__DecimalE1_ptr1__DecimalE1_ptr1__DecimalE1_ptr1__ret_voidE1
	leaq -1148(%rbp), %rcx
	leaq -1148(%rbp), %rdx
	leaq -5372(%rbp), %r8
	callq math__decimal__decimal_add__3__DecimalE1_ptr1__DecimalE1_ptr1__DecimalE1_ptr1__ret_voidE1
	jmp .LB10574
.LB10594:
	movabsq $1028443341, %r10
	movq %r10, %xmm0
	movsd -11096(%rbp), %xmm1
	mulss %xmm1, %xmm0
	movabsq $1232348160, %r10
	movq %r10, %xmm1
	mulss %xmm1, %xmm0
	cvttss2siq %xmm0, %rdx
	leaq -5900(%rbp), %rcx
	callq math__decimal__decimal_from_i64__2__DecimalE1_ptr1__dataE1_sbits64__ret_voidE1
	movl $808464433, -11040(%rbp)
	movl $3158064, -11036(%rbp)
	leaq -11040(%rbp), %rdx
	leaq -6428(%rbp), %rcx
	callq math__decimal__decimal_from_string__2__DecimalE1_ptr1__byteE1_ptr1__ret_voidE1
	leaq -7484(%rbp), %rcx
	leaq -5900(%rbp), %rdx
	leaq -6428(%rbp), %r8
	callq math__decimal__decimal_div__3__DecimalE1_ptr1__DecimalE1_ptr1__DecimalE1_ptr1__ret_voidE1
	leaq -5372(%rbp), %rcx
	leaq -2204(%rbp), %rdx
	leaq -7484(%rbp), %r8
	callq math__decimal__decimal_mul__3__DecimalE1_ptr1__DecimalE1_ptr1__DecimalE1_ptr1__ret_voidE1
	leaq -1676(%rbp), %rcx
	leaq -1676(%rbp), %rdx
	leaq -5372(%rbp), %r8
	callq math__decimal__decimal_sub__3__DecimalE1_ptr1__DecimalE1_ptr1__DecimalE1_ptr1__ret_voidE1
	jmp .LB10596
.LB10616:
	movabsq $1028443341, %r10
	movq %r10, %xmm0
	movsd -11096(%rbp), %xmm1
	mulss %xmm1, %xmm0
	movabsq $1232348160, %r10
	movq %r10, %xmm1
	mulss %xmm1, %xmm0
	cvttss2siq %xmm0, %rdx
	leaq -5900(%rbp), %rcx
	callq math__decimal__decimal_from_i64__2__DecimalE1_ptr1__dataE1_sbits64__ret_voidE1
	movl $808464433, -11048(%rbp)
	movl $3158064, -11044(%rbp)
	leaq -11048(%rbp), %rdx
	leaq -6428(%rbp), %rcx
	callq math__decimal__decimal_from_string__2__DecimalE1_ptr1__byteE1_ptr1__ret_voidE1
	leaq -7484(%rbp), %rcx
	leaq -5900(%rbp), %rdx
	leaq -6428(%rbp), %r8
	callq math__decimal__decimal_div__3__DecimalE1_ptr1__DecimalE1_ptr1__DecimalE1_ptr1__ret_voidE1
	leaq -5372(%rbp), %rcx
	leaq -2204(%rbp), %rdx
	leaq -7484(%rbp), %r8
	callq math__decimal__decimal_mul__3__DecimalE1_ptr1__DecimalE1_ptr1__DecimalE1_ptr1__ret_voidE1
	leaq -1676(%rbp), %rcx
	leaq -1676(%rbp), %rdx
	leaq -5372(%rbp), %r8
	callq math__decimal__decimal_add__3__DecimalE1_ptr1__DecimalE1_ptr1__DecimalE1_ptr1__ret_voidE1
	jmp .LB10618
.LB10643:
	movq g_pixels(%rip), %rax
	testq %rax, %rax
	jne .LB10650
.LB10652:
	movq g_iters(%rip), %rax
	testq %rax, %rax
	jne .LB10659
.LB10661:
	movl %edi, %eax
	imull %ebx, %eax
	movq %rax, -11248(%rbp)
	leal (%rax,%rax,2), %eax
	shll $2, %eax
	movslq %eax, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, g_pixels(%rip)
	movq -11248(%rbp), %rax
	shll $2, %eax
	movslq %eax, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, g_iters(%rip)
	movl %edi, g_cols(%rip)
	movl %ebx, g_rows(%rip)
	movq $0, -11240(%rbp)
	jmp .LB10645
.LB10650:
	movq %rax, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	jmp .LB10652
.LB10659:
	movq %rax, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	jmp .LB10661
.LB10707:
	leaq -2204(%rbp), %rcx
	leaq -9596(%rbp), %rdx
	callq math__decimal__decimal_cmp__2__DecimalE1_ptr1__DecimalE1_ptr1__ret_dataE1_sbits32
	testl %eax, %eax
	sets %al
	movzbl %al, %eax
	orl %esi, %eax
	movq %rax, -11256(%rbp)
	jmp .LB10709
.LB10732:
	leaq -1148(%rbp), %rcx
	callq math__decimal__decimal_to_double__1__DecimalE1_ptr1__ret_doubleE1
	movsd %xmm0, -11288(%rbp)
	leaq -1676(%rbp), %rcx
	callq math__decimal__decimal_to_double__1__DecimalE1_ptr1__ret_doubleE1
	movsd %xmm0, -11296(%rbp)
	movq -11256(%rbp), %rax
	testb %al, %al
	jne .LB10738
.LB10739:
	movsd -11288(%rbp), %xmm0
	movsd -11296(%rbp), %xmm1
	movq %r12, %r8
	callq compute_reference_orbit_double__3__doubleE1__doubleE1__intE1__ret_voidE1
.LB10740:
	movq -11288(%rbp), %r10
	movq %r10, -11264(%rbp)
	movq -11296(%rbp), %r10
	movq %r10, -11272(%rbp)
	xorl %esi, %esi
	movq $0, -11280(%rbp)
	jmp .LB10734
.LB10738:
	leaq -1148(%rbp), %rcx
	leaq -1676(%rbp), %rdx
	movq %r12, %r8
	callq compute_reference_orbit__3__DecimalE1_ptr1__DecimalE1_ptr1__intE1__ret_voidE1
	jmp .LB10740
.LB10758:
	movq $1, -11304(%rbp)
	jmp .LB10760
.LB10776:
	movq -11360(%rbp), %rax
	movslq %eax, %rsi
	xorl %r12d, %r12d
.LB10887:
	cmpq %rsi, %r12
	jge .LB10889
.LB10888:
	leaq (%r12,%r12,2), %rax
	leaq -10964(%rbp,%rax,4), %rcx
	callq standard__threading__thread_join__1__ThreadE1_ptr1__ret_intE1
	incq %r12
	cmpq %rsi, %r12
	jl .LB10888
.LB10889:
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
	movl -620(%rbp), %edx
	callq glBindTexture
	movl GL_TEXTURE_2D(%rip), %ecx
	movl GL_RGB(%rip), %r8d
	movl GL_FLOAT(%rip), %eax
	movq g_pixels(%rip), %rdx
	movq %rbx, 32(%rsp)
	movq $0, 40(%rsp)
	movq %r8, 48(%rsp)
	movq %rax, 56(%rsp)
	movq %rdx, 64(%rsp)
	xorl %edx, %edx
	movq %rdi, %r9
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
	movq -616(%rbp), %rcx
	callq SwapBuffers
	movq -11104(%rbp), %r10
	movq %r10, -11064(%rbp)
	movq -11264(%rbp), %r10
	movq %r10, -11072(%rbp)
	movq -11272(%rbp), %r10
	movq %r10, -11080(%rbp)
	movq -11224(%rbp), %r10
	movq %r10, -11192(%rbp)
	movq -11280(%rbp), %r10
	movq %r10, -11088(%rbp)
	movq -11256(%rbp), %rsi
	movq -11112(%rbp), %rdi
	jmp .LB10259
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
.LB10949:
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
	movb %al, ermsb(%rip)
	movabsq $4294967285, %rcx
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
.LB11237:
	testl %ecx, %ecx
	je .LB11239
.LB11238:
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
	jne .LB11238
	jmp .LB11239
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
.LB11239:
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
	.globl standard__math__floor__1__floatE1__ret_floatE1
	.def standard__math__floor__1__floatE1__ret_floatE1;
	.scl 2;
	.type 32;
	.endef
standard__math__floor__1__floatE1__ret_floatE1:
.LB4465:
	cvttss2siq %xmm0, %rax
	xorps %xmm1, %xmm1
	ucomiss %xmm1, %xmm0
	jae .LB4479
.LB4472:
	xorps %xmm1, %xmm1
	cvtsi2ssq %rax, %xmm1
	ucomiss %xmm1, %xmm0
	sete %cl
	movzbl %cl, %ecx
	setnp %dl
	movzbl %dl, %edx
	andl %edx, %ecx
	testb %cl, %cl
	jne .LB4479
.LB4480:
	decq %rax
	xorps %xmm0, %xmm0
	cvtsi2ssq %rax, %xmm0
	ret
.LB4479:
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
.LB4488:
	cvttss2siq %xmm0, %rax
	xorps %xmm1, %xmm1
	ucomiss %xmm0, %xmm1
	jae .LB4502
.LB4495:
	xorps %xmm1, %xmm1
	cvtsi2ssq %rax, %xmm1
	ucomiss %xmm1, %xmm0
	sete %cl
	movzbl %cl, %ecx
	setnp %dl
	movzbl %dl, %edx
	andl %edx, %ecx
	testb %cl, %cl
	jne .LB4502
.LB4503:
	incq %rax
	xorps %xmm0, %xmm0
	cvtsi2ssq %rax, %xmm0
	ret
.LB4502:
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
.LB4511:
	xorps %xmm1, %xmm1
	ucomiss %xmm1, %xmm0
	jae .LB4515
.LB4516:
	movabsq $1056964608, %r10
	movq %r10, %xmm1
	subss %xmm1, %xmm0
	callq standard__math__ceil__1__floatE1__ret_floatE1
	leave
	ret
.LB4515:
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
.LB4524:
	cvttsd2siq %xmm0, %rax
	xorps %xmm1, %xmm1
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm1, %xmm0
	jae .LB4539
.LB4532:
	xorps %xmm1, %xmm1
	cvtsi2sdq %rax, %xmm1
	ucomisd %xmm1, %xmm0
	sete %cl
	movzbl %cl, %ecx
	setnp %dl
	movzbl %dl, %edx
	andl %edx, %ecx
	testb %cl, %cl
	jne .LB4539
.LB4540:
	decq %rax
	xorps %xmm0, %xmm0
	cvtsi2sdq %rax, %xmm0
	ret
.LB4539:
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
.LB4548:
	cvttsd2siq %xmm0, %rax
	xorps %xmm1, %xmm1
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm0, %xmm1
	jae .LB4563
.LB4556:
	xorps %xmm1, %xmm1
	cvtsi2sdq %rax, %xmm1
	ucomisd %xmm1, %xmm0
	sete %cl
	movzbl %cl, %ecx
	setnp %dl
	movzbl %dl, %edx
	andl %edx, %ecx
	testb %cl, %cl
	jne .LB4563
.LB4564:
	incq %rax
	xorps %xmm0, %xmm0
	cvtsi2sdq %rax, %xmm0
	ret
.LB4563:
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
.LB4572:
	xorps %xmm1, %xmm1
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm1, %xmm0
	jae .LB4577
.LB4578:
	movabsq $1056964608, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	subsd %xmm1, %xmm0
	callq standard__math__ceil__1__doubleE1__ret_doubleE1
	leave
	ret
.LB4577:
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
.LB4588:
	movzbl %cl, %eax
	ret
	.text
	.globl standard__math__floor__1__dataE1_sbits16__ret_dataE1_sbits16
	.def standard__math__floor__1__dataE1_sbits16__ret_dataE1_sbits16;
	.scl 2;
	.type 32;
	.endef
standard__math__floor__1__dataE1_sbits16__ret_dataE1_sbits16:
.LB4591:
	movzwl %cx, %eax
	ret
	.text
	.globl standard__math__floor__1__dataE1_sbits32__ret_dataE1_sbits32
	.def standard__math__floor__1__dataE1_sbits32__ret_dataE1_sbits32;
	.scl 2;
	.type 32;
	.endef
standard__math__floor__1__dataE1_sbits32__ret_dataE1_sbits32:
.LB4594:
	movl %ecx, %eax
	ret
	.text
	.globl standard__math__floor__1__dataE1_sbits64__ret_dataE1_sbits64
	.def standard__math__floor__1__dataE1_sbits64__ret_dataE1_sbits64;
	.scl 2;
	.type 32;
	.endef
standard__math__floor__1__dataE1_sbits64__ret_dataE1_sbits64:
.LB4597:
	movq %rcx, %rax
	ret
	.text
	.globl standard__math__ceil__1__dataE1_sbits8__ret_dataE1_sbits8
	.def standard__math__ceil__1__dataE1_sbits8__ret_dataE1_sbits8;
	.scl 2;
	.type 32;
	.endef
standard__math__ceil__1__dataE1_sbits8__ret_dataE1_sbits8:
.LB4600:
	movzbl %cl, %eax
	ret
	.text
	.globl standard__math__ceil__1__dataE1_sbits16__ret_dataE1_sbits16
	.def standard__math__ceil__1__dataE1_sbits16__ret_dataE1_sbits16;
	.scl 2;
	.type 32;
	.endef
standard__math__ceil__1__dataE1_sbits16__ret_dataE1_sbits16:
.LB4603:
	movzwl %cx, %eax
	ret
	.text
	.globl standard__math__ceil__1__dataE1_sbits32__ret_dataE1_sbits32
	.def standard__math__ceil__1__dataE1_sbits32__ret_dataE1_sbits32;
	.scl 2;
	.type 32;
	.endef
standard__math__ceil__1__dataE1_sbits32__ret_dataE1_sbits32:
.LB4606:
	movl %ecx, %eax
	ret
	.text
	.globl standard__math__ceil__1__dataE1_sbits64__ret_dataE1_sbits64
	.def standard__math__ceil__1__dataE1_sbits64__ret_dataE1_sbits64;
	.scl 2;
	.type 32;
	.endef
standard__math__ceil__1__dataE1_sbits64__ret_dataE1_sbits64:
.LB4609:
	movq %rcx, %rax
	ret
	.text
	.globl standard__math__round__1__dataE1_sbits8__ret_dataE1_sbits8
	.def standard__math__round__1__dataE1_sbits8__ret_dataE1_sbits8;
	.scl 2;
	.type 32;
	.endef
standard__math__round__1__dataE1_sbits8__ret_dataE1_sbits8:
.LB4612:
	movzbl %cl, %eax
	ret
	.text
	.globl standard__math__round__1__dataE1_sbits16__ret_dataE1_sbits16
	.def standard__math__round__1__dataE1_sbits16__ret_dataE1_sbits16;
	.scl 2;
	.type 32;
	.endef
standard__math__round__1__dataE1_sbits16__ret_dataE1_sbits16:
.LB4615:
	movzwl %cx, %eax
	ret
	.text
	.globl standard__math__round__1__dataE1_sbits32__ret_dataE1_sbits32
	.def standard__math__round__1__dataE1_sbits32__ret_dataE1_sbits32;
	.scl 2;
	.type 32;
	.endef
standard__math__round__1__dataE1_sbits32__ret_dataE1_sbits32:
.LB4618:
	movl %ecx, %eax
	ret
	.text
	.globl standard__math__round__1__dataE1_sbits64__ret_dataE1_sbits64
	.def standard__math__round__1__dataE1_sbits64__ret_dataE1_sbits64;
	.scl 2;
	.type 32;
	.endef
standard__math__round__1__dataE1_sbits64__ret_dataE1_sbits64:
.LB4621:
	movq %rcx, %rax
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
.LB4754:
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
.LB4624:
	movabsq $1144091160, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm1, %xmm0
	ja .LB4629
.LB4630:
	xorps %xmm1, %xmm1
	movabsq $1144670343, %r10
	movq %r10, %xmm2
	subss %xmm2, %xmm1
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm0, %xmm1
	ja .LB4636
.LB4637:
	movabsq $1060205080, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	movabsq $1069066811, %r10
	movq %r10, %xmm2
	cvtss2sd %xmm2, %xmm2
	mulsd %xmm0, %xmm2
	xorps %xmm3, %xmm3
	cvtss2sd %xmm3, %xmm3
	ucomisd %xmm3, %xmm2
	jae .LB4653
.LB4654:
	movabsq $1056964608, %r10
	movq %r10, %xmm3
	cvtss2sd %xmm3, %xmm3
	subsd %xmm3, %xmm2
	cvttsd2siq %xmm2, %rax
	movl %eax, %eax
.LB4655:
	movslq %eax, %rcx
	xorps %xmm2, %xmm2
	cvtsi2sdq %rcx, %xmm2
	mulsd %xmm2, %xmm1
	subsd %xmm1, %xmm0
	movabsq $4461442080421002358, %r10
	movq %r10, %xmm1
	mulsd %xmm2, %xmm1
	subsd %xmm1, %xmm0
	movaps %xmm0, %xmm1
	mulsd %xmm0, %xmm1
	movabsq $4493081048671427931, %r10
	movq %r10, %xmm2
	mulsd %xmm1, %xmm2
	movabsq $4519165668962417596, %r10
	movq %r10, %xmm3
	addsd %xmm3, %xmm2
	mulsd %xmm1, %xmm2
	movabsq $950977342, %r10
	movq %r10, %xmm3
	cvtss2sd %xmm3, %xmm3
	addsd %xmm3, %xmm2
	mulsd %xmm1, %xmm2
	movabsq $998803593, %r10
	movq %r10, %xmm3
	cvtss2sd %xmm3, %xmm3
	addsd %xmm3, %xmm2
	mulsd %xmm1, %xmm2
	movabsq $1042983595, %r10
	movq %r10, %xmm3
	cvtss2sd %xmm3, %xmm3
	addsd %xmm3, %xmm2
	mulsd %xmm2, %xmm1
	movabsq $1065353216, %r10
	movq %r10, %xmm2
	cvtss2sd %xmm2, %xmm2
	addsd %xmm2, %xmm1
	mulsd %xmm0, %xmm1
	movaps %xmm0, %xmm2
	mulsd %xmm1, %xmm2
	movabsq $1073741824, %r10
	movq %r10, %xmm3
	cvtss2sd %xmm3, %xmm3
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
	je .LB4717
.LB4718:
	movq $0, -8(%rsp)
	leaq (%rsp), %rcx
	movq (%rcx), %rcx
	movq %rcx, -8(%rsp)
	shrq $52, %rcx
	andq $2047, %rcx
	movslq %eax, %rax
	addq %rax, %rcx
	testq %rcx, %rcx
	jle .LB4736
.LB4737:
	cmpq $2047, %rcx
	jge .LB4743
.LB4744:
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
.LB4653:
	movabsq $1056964608, %r10
	movq %r10, %xmm3
	cvtss2sd %xmm3, %xmm3
	addsd %xmm3, %xmm2
	cvttsd2siq %xmm2, %rax
	movl %eax, %eax
	jmp .LB4655
.LB4743:
	movabsq $9218868437227405311, %r10
	movq %r10, %xmm0
	addq $16, %rsp
	ret
.LB4736:
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	addq $16, %rsp
	ret
.LB4717:
	addq $16, %rsp
	ret
.LB4636:
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	addq $16, %rsp
	ret
.LB4629:
	movabsq $9218868437227405311, %r10
	movq %r10, %xmm0
	addq $16, %rsp
	ret
	.text
	.globl standard__math__step__2__floatE1__floatE1__ret_floatE1
	.def standard__math__step__2__floatE1__floatE1__ret_floatE1;
	.scl 2;
	.type 32;
	.endef
standard__math__step__2__floatE1__floatE1__ret_floatE1:
.LB4760:
	ucomiss %xmm0, %xmm1
	jae .LB4766
.LB4767:
	xorps %xmm0, %xmm0
	ret
.LB4766:
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
.LB4770:
	ucomisd %xmm0, %xmm1
	jae .LB4776
.LB4777:
	xorps %xmm0, %xmm0
.LB4778:
	cvtss2sd %xmm0, %xmm0
	ret
.LB4776:
	movabsq $1065353216, %r10
	movq %r10, %xmm0
	jmp .LB4778
	.text
	.globl standard__math__sign__1__dataE1_sbits8__ret_dataE1_sbits8
	.def standard__math__sign__1__dataE1_sbits8__ret_dataE1_sbits8;
	.scl 2;
	.type 32;
	.endef
standard__math__sign__1__dataE1_sbits8__ret_dataE1_sbits8:
.LB4781:
	testb %cl, %cl
	jg .LB4786
.LB4787:
	testb %cl, %cl
	js .LB4793
.LB4794:
	xorl %eax, %eax
	ret
.LB4793:
	movl $255, %eax
	ret
.LB4786:
	movl $1, %eax
	ret
	.text
	.globl standard__math__sign__1__dataE1_sbits16__ret_dataE1_sbits16
	.def standard__math__sign__1__dataE1_sbits16__ret_dataE1_sbits16;
	.scl 2;
	.type 32;
	.endef
standard__math__sign__1__dataE1_sbits16__ret_dataE1_sbits16:
.LB4799:
	testw %cx, %cx
	jg .LB4804
.LB4805:
	testw %cx, %cx
	js .LB4811
.LB4812:
	xorl %eax, %eax
	ret
.LB4811:
	movl $65535, %eax
	ret
.LB4804:
	movl $1, %eax
	ret
	.text
	.globl standard__math__sign__1__dataE1_sbits32__ret_dataE1_sbits32
	.def standard__math__sign__1__dataE1_sbits32__ret_dataE1_sbits32;
	.scl 2;
	.type 32;
	.endef
standard__math__sign__1__dataE1_sbits32__ret_dataE1_sbits32:
.LB4817:
	testl %ecx, %ecx
	jg .LB4821
.LB4822:
	testl %ecx, %ecx
	js .LB4826
.LB4827:
	xorl %eax, %eax
	ret
.LB4826:
	movabsq $4294967295, %rax
	ret
.LB4821:
	movl $1, %eax
	ret
	.text
	.globl standard__math__sign__1__dataE1_sbits64__ret_dataE1_sbits64
	.def standard__math__sign__1__dataE1_sbits64__ret_dataE1_sbits64;
	.scl 2;
	.type 32;
	.endef
standard__math__sign__1__dataE1_sbits64__ret_dataE1_sbits64:
.LB4830:
	testq %rcx, %rcx
	jg .LB4835
.LB4836:
	testq %rcx, %rcx
	js .LB4842
.LB4843:
	xorl %eax, %eax
	ret
.LB4842:
	movq $-1, %rax
	ret
.LB4835:
	movl $1, %eax
	ret
	.text
	.globl standard__math__sign__1__floatE1__ret_floatE1
	.def standard__math__sign__1__floatE1__ret_floatE1;
	.scl 2;
	.type 32;
	.endef
standard__math__sign__1__floatE1__ret_floatE1:
.LB4848:
	xorps %xmm1, %xmm1
	ucomiss %xmm1, %xmm0
	ja .LB4852
.LB4853:
	xorps %xmm1, %xmm1
	ucomiss %xmm0, %xmm1
	ja .LB4857
.LB4858:
	xorps %xmm0, %xmm0
	ret
.LB4857:
	xorps %xmm0, %xmm0
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	subss %xmm1, %xmm0
	ret
.LB4852:
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
.LB4861:
	xorps %xmm1, %xmm1
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm1, %xmm0
	ja .LB4866
.LB4867:
	xorps %xmm1, %xmm1
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm0, %xmm1
	ja .LB4873
.LB4874:
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	ret
.LB4873:
	xorps %xmm0, %xmm0
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	subss %xmm1, %xmm0
	cvtss2sd %xmm0, %xmm0
	ret
.LB4866:
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
.LB4879:
	movsd %xmm0, -8(%rbp)
	movaps %xmm1, %xmm0
	movsd %xmm0, -16(%rbp)
	xorps %xmm1, %xmm1
	ucomiss %xmm1, %xmm0
	sete %al
	movzbl %al, %eax
	setnp %cl
	movzbl %cl, %ecx
	andl %ecx, %eax
	testb %al, %al
	jne .LB4884
.LB4885:
	movsd -8(%rbp), %xmm0
	movsd -16(%rbp), %xmm1
	divss %xmm1, %xmm0
	callq standard__math__round__1__floatE1__ret_floatE1
	movsd -16(%rbp), %xmm1
	mulss %xmm1, %xmm0
	movsd -8(%rbp), %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subss %xmm15, %xmm0
	leave
	ret
.LB4884:
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
.LB4897:
	movsd %xmm0, -8(%rbp)
	movaps %xmm1, %xmm0
	movsd %xmm0, -16(%rbp)
	xorps %xmm1, %xmm1
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm1, %xmm0
	sete %al
	movzbl %al, %eax
	setnp %cl
	movzbl %cl, %ecx
	andl %ecx, %eax
	testb %al, %al
	jne .LB4903
.LB4904:
	movsd -8(%rbp), %xmm0
	movsd -16(%rbp), %xmm1
	divsd %xmm1, %xmm0
	callq standard__math__round__1__doubleE1__ret_doubleE1
	movsd -16(%rbp), %xmm1
	mulsd %xmm1, %xmm0
	movsd -8(%rbp), %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subsd %xmm15, %xmm0
	leave
	ret
.LB4903:
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	leave
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
.LB4917:
	movq %rcx, %rbx
	movq %rdx, -160(%rbp)
	movq %r8, -168(%rbp)
	movl %r9d, %r12d
	movl 48(%rbp), %r13d
	movl 56(%rbp), %r14d
	movl %r8d, 24(%rbx)
	movl %r12d, 28(%rbx)
	movl %r13d, 32(%rbx)
	movl %r14d, 36(%rbx)
	movb $0, 40(%rbx)
	xorl %ecx, %ecx
	callq GetModuleHandleA
	movq %rax, 8(%rbx)
	movl $1262830665, -69(%rbp)
	movl $1767317569, -65(%rbp)
	movl $2003788910, -61(%rbp)
	movb $0, -57(%rbp)
	leaq 41(%rbx), %rax
	movq %rax, %r15
	movq %r15, %rdi
	xorl %eax, %eax
	movl $256, %ecx
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
	movq %rax, -104(%rbp)
	movq $0, -96(%rbp)
	movq %r15, -88(%rbp)
	movq $0, -80(%rbp)
	leaq -152(%rbp), %rcx
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
	movq %r15, %rdx
	movq -160(%rbp), %r8
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
.LB5022:
	movq %rcx, %rsi
	movq 16(%rsi), %rdx
	testq %rdx, %rdx
	jne .LB5027
.LB5029:
	leaq 41(%rsi), %rax
	movq %rax, %rcx
	movq 8(%rsi), %rdx
	callq UnregisterClassA
	movq -8(%rbp), %rsi
	leave
	ret
.LB5027:
	movq (%rsi), %rcx
	callq ReleaseDC
	jmp .LB5029
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
.LB5040:
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -48(%rbp)
	movups .LZERO+32(%rip), %xmm15
	movups %xmm15, -16(%rbp)
	vzeroupper
.LB5042:
	movl standard__system__windows__PM_REMOVE(%rip), %eax
	leaq -48(%rbp), %rcx
	movq %rax, 32(%rsp)
	xorl %edx, %edx
	xorl %r8d, %r8d
	xorl %r9d, %r9d
	callq PeekMessageA
	testb %al, %al
	je .LB5044
.LB5043:
	movl -40(%rbp), %eax
	movl standard__system__windows__WM_QUIT(%rip), %ecx
	cmpl %ecx, %eax
	je .LB5054
.LB5055:
	leaq -48(%rbp), %rcx
	callq TranslateMessage
	leaq -48(%rbp), %rcx
	callq DispatchMessageA
	jmp .LB5042
.LB5044:
	movl $1, %eax
	leave
	ret
.LB5054:
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
.LB6203:
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
.LB6211:
	movq %rcx, %rsi
	cmpq $0, 8(%rsi)
	jne .LB6216
.LB6217:
	movq -8(%rbp), %rsi
	leave
	ret
.LB6216:
	xorl %ecx, %ecx
	xorl %edx, %edx
	callq wglMakeCurrent
	movq 8(%rsi), %rcx
	callq wglDeleteContext
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
.LB6225:
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
.LB6228:
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
.LB6237:
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
.LB5059:
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
	orl %ecx, %eax
	movl PFD_DOUBLEBUFFER(%rip), %ecx
	orl %ecx, %eax
	movl %eax, -52(%rbp)
	movzbl PFD_TYPE_RGBA(%rip), %eax
	movb %al, -48(%rbp)
	movb $32, -47(%rbp)
	movw $2072, -33(%rbp)
	movzbl PFD_MAIN_PLANE(%rip), %eax
	movb %al, -30(%rbp)
	leaq -56(%rbp), %rdx
	movq %rsi, %rcx
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
.LB5096:
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
.LB5100:
	movl $1699179623, -13(%rbp)
	movl $1718960750, -9(%rbp)
	movl $1936876902, -5(%rbp)
	movb $0, -1(%rbp)
	leaq -13(%rbp), %rcx
	callq wglGetProcAddress
	movq %rax, OpenGL___glGenBuffers(%rip)
	movl $1698983015, -29(%rbp)
	movl $1702126956, -25(%rbp)
	movl $1717990722, -21(%rbp)
	movl $7565925, -17(%rbp)
	leaq -29(%rbp), %rcx
	callq wglGetProcAddress
	movq %rax, OpenGL___glDeleteBuffers(%rip)
	movl $1765960807, -42(%rbp)
	movl $1967285358, -38(%rbp)
	movl $1919247974, -34(%rbp)
	movb $0, -30(%rbp)
	leaq -42(%rbp), %rcx
	callq wglGetProcAddress
	movq %rax, OpenGL___glBindBuffer(%rip)
	movl $1967287399, -55(%rbp)
	movl $1919247974, -51(%rbp)
	movl $1635017028, -47(%rbp)
	movb $0, -43(%rbp)
	leaq -55(%rbp), %rcx
	callq wglGetProcAddress
	movq %rax, OpenGL___glBufferData(%rip)
	movl $1967287399, -71(%rbp)
	movl $1919247974, -67(%rbp)
	movl $1147303251, -63(%rbp)
	movl $6386785, -59(%rbp)
	leaq -71(%rbp), %rcx
	callq wglGetProcAddress
	movq %rax, OpenGL___glBufferSubData(%rip)
	movl $1632463975, -83(%rbp)
	movl $1718960752, -79(%rbp)
	movl $7497062, -75(%rbp)
	leaq -83(%rbp), %rcx
	callq wglGetProcAddress
	movq %rax, OpenGL___glMapBuffer(%rip)
	movl $1851092071, -97(%rbp)
	movl $1114661229, -93(%rbp)
	movl $1701209717, -89(%rbp)
	movw $114, -85(%rbp)
	leaq -97(%rbp), %rcx
	callq wglGetProcAddress
	movq %rax, OpenGL___glUnmapBuffer(%rip)
	movl $1699179623, -115(%rbp)
	movl $1919243886, -111(%rbp)
	movl $1098409332, -107(%rbp)
	movl $2036429426, -103(%rbp)
	movw $115, -99(%rbp)
	leaq -115(%rbp), %rcx
	callq wglGetProcAddress
	movq %rax, OpenGL___glGenVertexArrays(%rip)
	movl $1698983015, -136(%rbp)
	movl $1702126956, -132(%rbp)
	movl $1953654102, -128(%rbp)
	movl $1916893285, -124(%rbp)
	movl $1937334642, -120(%rbp)
	movb $0, -116(%rbp)
	leaq -136(%rbp), %rcx
	callq wglGetProcAddress
	movq %rax, OpenGL___glDeleteVertexArrays(%rip)
	movl $1765960807, -154(%rbp)
	movl $1700160622, -150(%rbp)
	movl $2019914866, -146(%rbp)
	movl $1634890305, -142(%rbp)
	movw $121, -138(%rbp)
	leaq -154(%rbp), %rcx
	callq wglGetProcAddress
	movq %rax, OpenGL___glBindVertexArray(%rip)
	movl $1850043495, -180(%rbp)
	movl $1701601889, -176(%rbp)
	movl $1953654102, -172(%rbp)
	movl $1950447717, -168(%rbp)
	movl $1651077748, -164(%rbp)
	movl $1634890305, -160(%rbp)
	movw $121, -156(%rbp)
	leaq -180(%rbp), %rcx
	callq wglGetProcAddress
	movq %rax, OpenGL___glEnableVertexAttribArray(%rip)
	movl $1766091879, -207(%rbp)
	movl $1818386803, -203(%rbp)
	movl $1919243877, -199(%rbp)
	movl $1098409332, -195(%rbp)
	movl $1769108596, -191(%rbp)
	movl $1920090466, -187(%rbp)
	movw $31073, -183(%rbp)
	movb $0, -181(%rbp)
	leaq -207(%rbp), %rcx
	callq wglGetProcAddress
	movq %rax, OpenGL___glDisableVertexAttribArray(%rip)
	movl $1700162663, -229(%rbp)
	movl $2019914866, -225(%rbp)
	movl $1920234561, -221(%rbp)
	movl $1867539049, -217(%rbp)
	movl $1702129257, -213(%rbp)
	movw $114, -209(%rbp)
	leaq -229(%rbp), %rcx
	callq wglGetProcAddress
	movq %rax, OpenGL___glVertexAttribPointer(%rip)
	movl $1917021287, -244(%rbp)
	movl $1702125925, -240(%rbp)
	movl $1684105299, -236(%rbp)
	movw $29285, -232(%rbp)
	movb $0, -230(%rbp)
	leaq -244(%rbp), %rcx
	callq wglGetProcAddress
	movq %rax, OpenGL___glCreateShader(%rip)
	movl $1698983015, -259(%rbp)
	movl $1702126956, -255(%rbp)
	movl $1684105299, -251(%rbp)
	movw $29285, -247(%rbp)
	movb $0, -245(%rbp)
	leaq -259(%rbp), %rcx
	callq wglGetProcAddress
	movq %rax, OpenGL___glDeleteShader(%rip)
	movl $1750297703, -274(%rbp)
	movl $1919247457, -270(%rbp)
	movl $1920298835, -266(%rbp)
	movw $25955, -262(%rbp)
	movb $0, -260(%rbp)
	leaq -274(%rbp), %rcx
	callq wglGetProcAddress
	movq %rax, OpenGL___glShaderSource(%rip)
	movl $1866689639, -290(%rbp)
	movl $1818849389, -286(%rbp)
	movl $1634227045, -282(%rbp)
	movl $7497060, -278(%rbp)
	leaq -290(%rbp), %rcx
	callq wglGetProcAddress
	movq %rax, OpenGL___glCompileShader(%rip)
	movl $1699179623, -304(%rbp)
	movl $1634227060, -300(%rbp)
	movl $1769104740, -296(%rbp)
	movw $118, -292(%rbp)
	leaq -304(%rbp), %rcx
	callq wglGetProcAddress
	movq %rax, OpenGL___glGetShaderiv(%rip)
	movl $1699179623, -323(%rbp)
	movl $1634227060, -319(%rbp)
	movl $1232233828, -315(%rbp)
	movl $1282369134, -311(%rbp)
	movw $26479, -307(%rbp)
	movb $0, -305(%rbp)
	leaq -323(%rbp), %rcx
	callq wglGetProcAddress
	movq %rax, OpenGL___glGetShaderInfoLog(%rip)
	movl $1917021287, -339(%rbp)
	movl $1702125925, -335(%rbp)
	movl $1735357008, -331(%rbp)
	movl $7168370, -327(%rbp)
	leaq -339(%rbp), %rcx
	callq wglGetProcAddress
	movq %rax, OpenGL___glCreateProgram(%rip)
	movl $1698983015, -355(%rbp)
	movl $1702126956, -351(%rbp)
	movl $1735357008, -347(%rbp)
	movl $7168370, -343(%rbp)
	leaq -355(%rbp), %rcx
	callq wglGetProcAddress
	movq %rax, OpenGL___glDeleteProgram(%rip)
	movl $1950444647, -370(%rbp)
	movl $1751343476, -366(%rbp)
	movl $1684105299, -362(%rbp)
	movw $29285, -358(%rbp)
	movb $0, -356(%rbp)
	leaq -370(%rbp), %rcx
	callq wglGetProcAddress
	movq %rax, OpenGL___glAttachShader(%rip)
	movl $1698983015, -385(%rbp)
	movl $1751343476, -381(%rbp)
	movl $1684105299, -377(%rbp)
	movw $29285, -373(%rbp)
	movb $0, -371(%rbp)
	leaq -385(%rbp), %rcx
	callq wglGetProcAddress
	movq %rax, OpenGL___glDetachShader(%rip)
	movl $1766616167, -399(%rbp)
	movl $1917873006, -395(%rbp)
	movl $1634887535, -391(%rbp)
	movw $109, -387(%rbp)
	leaq -399(%rbp), %rcx
	callq wglGetProcAddress
	movq %rax, OpenGL___glLinkProgram(%rip)
	movl $1934978151, -412(%rbp)
	movl $1869762661, -408(%rbp)
	movl $1835102823, -404(%rbp)
	movb $0, -400(%rbp)
	leaq -412(%rbp), %rcx
	callq wglGetProcAddress
	movq %rax, OpenGL___glUseProgram(%rip)
	movl $1699179623, -427(%rbp)
	movl $1869762676, -423(%rbp)
	movl $1835102823, -419(%rbp)
	movw $30313, -415(%rbp)
	movb $0, -413(%rbp)
	leaq -427(%rbp), %rcx
	callq wglGetProcAddress
	movq %rax, OpenGL___glGetProgramiv(%rip)
	movl $1699179623, -447(%rbp)
	movl $1869762676, -443(%rbp)
	movl $1835102823, -439(%rbp)
	movl $1868983881, -435(%rbp)
	movl $6778700, -431(%rbp)
	leaq -447(%rbp), %rcx
	callq wglGetProcAddress
	movq %rax, OpenGL___glGetProgramInfoLog(%rip)
	movl $1765960807, -468(%rbp)
	movl $1950442606, -464(%rbp)
	movl $1651077748, -460(%rbp)
	movl $1633906508, -456(%rbp)
	movl $1852795252, -452(%rbp)
	movb $0, -448(%rbp)
	leaq -468(%rbp), %rcx
	callq wglGetProcAddress
	movq %rax, OpenGL___glBindAttribLocation(%rip)
	movl $1699179623, -489(%rbp)
	movl $1768838516, -485(%rbp)
	movl $1836216166, -481(%rbp)
	movl $1633906508, -477(%rbp)
	movl $1852795252, -473(%rbp)
	movb $0, -469(%rbp)
	leaq -489(%rbp), %rcx
	callq wglGetProcAddress
	movq %rax, OpenGL___glGetUniformLocation(%rip)
	movl $1851092071, -501(%rbp)
	movl $1919903337, -497(%rbp)
	movl $6893933, -493(%rbp)
	leaq -501(%rbp), %rcx
	callq wglGetProcAddress
	movq %rax, OpenGL___glUniform1i(%rip)
	movl $1851092071, -513(%rbp)
	movl $1919903337, -509(%rbp)
	movl $6697325, -505(%rbp)
	leaq -513(%rbp), %rcx
	callq wglGetProcAddress
	movq %rax, OpenGL___glUniform1f(%rip)
	movl $1851092071, -525(%rbp)
	movl $1919903337, -521(%rbp)
	movl $6697581, -517(%rbp)
	leaq -525(%rbp), %rcx
	callq wglGetProcAddress
	movq %rax, OpenGL___glUniform2f(%rip)
	movl $1851092071, -537(%rbp)
	movl $1919903337, -533(%rbp)
	movl $6697837, -529(%rbp)
	leaq -537(%rbp), %rcx
	callq wglGetProcAddress
	movq %rax, OpenGL___glUniform3f(%rip)
	movl $1851092071, -549(%rbp)
	movl $1919903337, -545(%rbp)
	movl $6698093, -541(%rbp)
	leaq -549(%rbp), %rcx
	callq wglGetProcAddress
	movq %rax, OpenGL___glUniform4f(%rip)
	movl $1851092071, -562(%rbp)
	movl $1919903337, -558(%rbp)
	movl $1986605421, -554(%rbp)
	movb $0, -550(%rbp)
	leaq -562(%rbp), %rcx
	callq wglGetProcAddress
	movq %rax, OpenGL___glUniform1iv(%rip)
	movl $1851092071, -575(%rbp)
	movl $1919903337, -571(%rbp)
	movl $1986409069, -567(%rbp)
	movb $0, -563(%rbp)
	leaq -575(%rbp), %rcx
	callq wglGetProcAddress
	movq %rax, OpenGL___glUniform2fv(%rip)
	movl $1851092071, -588(%rbp)
	movl $1919903337, -584(%rbp)
	movl $1986409325, -580(%rbp)
	movb $0, -576(%rbp)
	leaq -588(%rbp), %rcx
	callq wglGetProcAddress
	movq %rax, OpenGL___glUniform3fv(%rip)
	movl $1851092071, -601(%rbp)
	movl $1919903337, -597(%rbp)
	movl $1986409581, -593(%rbp)
	movb $0, -589(%rbp)
	leaq -601(%rbp), %rcx
	callq wglGetProcAddress
	movq %rax, OpenGL___glUniform4fv(%rip)
	movl $1851092071, -617(%rbp)
	movl $1919903337, -613(%rbp)
	movl $1952533869, -609(%rbp)
	movl $7759412, -605(%rbp)
	leaq -617(%rbp), %rcx
	callq wglGetProcAddress
	movq %rax, OpenGL___glUniformMat4fv(%rip)
	movl $1699179623, -635(%rbp)
	movl $1634879086, -631(%rbp)
	movl $1969382765, -627(%rbp)
	movl $1919247974, -623(%rbp)
	movw $115, -619(%rbp)
	leaq -635(%rbp), %rcx
	callq wglGetProcAddress
	movq %rax, OpenGL___glGenFramebuffers(%rip)
	movl $1698983015, -656(%rbp)
	movl $1702126956, -652(%rbp)
	movl $1835102790, -648(%rbp)
	movl $1718968933, -644(%rbp)
	movl $1936876902, -640(%rbp)
	movb $0, -636(%rbp)
	leaq -656(%rbp), %rcx
	callq wglGetProcAddress
	movq %rax, OpenGL___glDeleteFramebuffers(%rip)
	movl $1765960807, -674(%rbp)
	movl $1917215854, -670(%rbp)
	movl $1650814305, -666(%rbp)
	movl $1701209717, -662(%rbp)
	movw $114, -658(%rbp)
	leaq -674(%rbp), %rcx
	callq wglGetProcAddress
	movq %rax, OpenGL___glBindFramebuffer(%rip)
	movl $1917217895, -697(%rbp)
	movl $1650814305, -693(%rbp)
	movl $1701209717, -689(%rbp)
	movl $2019906674, -685(%rbp)
	movl $1701999988, -681(%rbp)
	movw $17458, -677(%rbp)
	movb $0, -675(%rbp)
	leaq -697(%rbp), %rcx
	callq wglGetProcAddress
	movq %rax, OpenGL___glFramebufferTexture2D(%rip)
	movl $1749249127, -722(%rbp)
	movl $1181442917, -718(%rbp)
	movl $1701667186, -714(%rbp)
	movl $1717990754, -710(%rbp)
	movl $1951625829, -706(%rbp)
	movl $1937077345, -702(%rbp)
	movb $0, -698(%rbp)
	leaq -722(%rbp), %rcx
	callq wglGetProcAddress
	movq %rax, OpenGL___glCheckFramebufferStatus(%rip)
	movl $1699179623, -741(%rbp)
	movl $1852133998, -737(%rbp)
	movl $1651664228, -733(%rbp)
	movl $1701209717, -729(%rbp)
	movw $29554, -725(%rbp)
	movb $0, -723(%rbp)
	leaq -741(%rbp), %rcx
	callq wglGetProcAddress
	movq %rax, OpenGL___glGenRenderbuffers(%rip)
	movl $1698983015, -763(%rbp)
	movl $1702126956, -759(%rbp)
	movl $1684956498, -755(%rbp)
	movl $1969386085, -751(%rbp)
	movl $1919247974, -747(%rbp)
	movw $115, -743(%rbp)
	leaq -763(%rbp), %rcx
	callq wglGetProcAddress
	movq %rax, OpenGL___glDeleteRenderbuffers(%rip)
	movl $1765960807, -782(%rbp)
	movl $1699898478, -778(%rbp)
	movl $1919247470, -774(%rbp)
	movl $1717990754, -770(%rbp)
	movw $29285, -766(%rbp)
	movb $0, -764(%rbp)
	leaq -782(%rbp), %rcx
	callq wglGetProcAddress
	movq %rax, OpenGL___glBindRenderbuffer(%rip)
	movl $1699900519, -804(%rbp)
	movl $1919247470, -800(%rbp)
	movl $1717990754, -796(%rbp)
	movl $1951625829, -792(%rbp)
	movl $1734439535, -788(%rbp)
	movw $101, -784(%rbp)
	leaq -804(%rbp), %rcx
	callq wglGetProcAddress
	movq %rax, OpenGL___glRenderbufferStorage(%rip)
	movl $1917217895, -830(%rbp)
	movl $1650814305, -826(%rbp)
	movl $1701209717, -822(%rbp)
	movl $1852134002, -818(%rbp)
	movl $1651664228, -814(%rbp)
	movl $1701209717, -810(%rbp)
	movw $114, -806(%rbp)
	leaq -830(%rbp), %rcx
	callq wglGetProcAddress
	movq %rax, OpenGL___glFramebufferRenderbuffer(%rip)
	movl $1699179623, -847(%rbp)
	movl $1634887022, -843(%rbp)
	movl $1766679924, -839(%rbp)
	movl $1885433200, -835(%rbp)
	movb $0, -831(%rbp)
	leaq -847(%rbp), %rcx
	callq wglGetProcAddress
	movq %rax, OpenGL___glGenerateMipmap(%rip)
	movl $1665231975, -863(%rbp)
	movl $1702259060, -859(%rbp)
	movl $1954047316, -855(%rbp)
	movl $6648437, -851(%rbp)
	leaq -863(%rbp), %rcx
	callq wglGetProcAddress
	movq %rax, OpenGL___glActiveTexture(%rip)
	movl $1917086823, -876(%rbp)
	movl $1916893025, -872(%rbp)
	movl $1937334642, -868(%rbp)
	movb $0, -864(%rbp)
	leaq -876(%rbp), %rcx
	callq wglGetProcAddress
	movq %rax, OpenGL___glDrawArrays(%rip)
	movl $1917086823, -891(%rbp)
	movl $1816491873, -887(%rbp)
	movl $1852140901, -883(%rbp)
	movw $29556, -879(%rbp)
	movb $0, -877(%rbp)
	leaq -891(%rbp), %rcx
	callq wglGetProcAddress
	movq %rax, OpenGL___glDrawElements(%rip)
	movl $1917086823, -913(%rbp)
	movl $1916893025, -909(%rbp)
	movl $1937334642, -905(%rbp)
	movl $1953721929, -901(%rbp)
	movl $1701015137, -897(%rbp)
	movw $100, -893(%rbp)
	leaq -913(%rbp), %rcx
	callq wglGetProcAddress
	movq %rax, OpenGL___glDrawArraysInstanced(%rip)
	movl $1917086823, -937(%rbp)
	movl $1816491873, -933(%rbp)
	movl $1852140901, -929(%rbp)
	movl $1850307444, -925(%rbp)
	movl $1851880563, -921(%rbp)
	movl $6579555, -917(%rbp)
	leaq -937(%rbp), %rcx
	callq wglGetProcAddress
	movq %rax, OpenGL___glDrawElementsInstanced(%rip)
	leave
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
.LB6241:
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
.LB6246:
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
.LB6251:
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
.LB6256:
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
.LB6264:
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
.LB6273:
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
	je .LB6292
.LB6293:
	movq %rbx, %rcx
	movq %rax, (%rcx)
	movl THREAD_OK(%rip), %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB6292:
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
.LB6303:
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
	je .LB6309
.LB6310:
	movq %r8, %rax
	movq (%rax), %rax
	movq %rax, %rsi
	movl WIN32_INFINITE(%rip), %edx
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
	je .LB6328
.LB6329:
	movl THREAD_ERROR(%rip), %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB6328:
	movl THREAD_OK(%rip), %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB6309:
	movl THREAD_OK(%rip), %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
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
.LB7482:
	movq %rcx, %rsi
	movl %r8d, %edi
	movq %rsi, %rcx
	callq math__bigint__bigint_copy__2__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	testl %edi, %edi
	je .LB7492
.LB7493:
	movl %edi, %eax
	shrl $5, %eax
	andl $31, %edi
	testl %eax, %eax
	ja .LB7513
.LB7515:
	testl %edi, %edi
	ja .LB7565
.LB7567:
	movq %rsi, %rcx
	callq math__bigint__bigint_normalize__1__BigIntE1_ptr1__ret_voidE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB7513:
	movl 512(%rsi), %ecx
	addl %eax, %ecx
	movl $128, %edx
	cmpl $128, %ecx
	cmova %edx, %ecx
	movq %rcx, %rdx
.LB7529:
	cmpl %eax, %edx
	jbe .LB7531
.LB7530:
	decl %edx
	movl %edx, %r8d
	subl %eax, %r8d
	movslq %r8d, %r8
	movl (%rsi,%r8,4), %r8d
	movslq %edx, %r9
	movl %r8d, (%rsi,%r9,4)
	cmpl %eax, %edx
	ja .LB7530
.LB7531:
	xorl %edx, %edx
	testl %eax, %eax
	cmova %eax, %edx
	shrl $2, %edx
	xorl %r8d, %r8d
.LB11252:
	testl %edx, %edx
	je .LB11254
.LB11253:
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
	jne .LB11253
.LB11254:
.LB7547:
	cmpl %eax, %r8d
	jae .LB7550
.LB7548:
	movslq %r8d, %rdx
	movl $0, (%rsi,%rdx,4)
	incl %r8d
	cmpl %eax, %r8d
	jb .LB7548
.LB7550:
	movl %ecx, 512(%rsi)
	testl %edi, %edi
	jbe .LB7567
.LB7565:
	movl $32, %eax
	subl %edi, %eax
	xorl %ecx, %ecx
	xorl %edx, %edx
.LB7568:
	movl 512(%rsi), %r8d
	cmpl %r8d, %ecx
	jae .LB7571
.LB7569:
	movslq %ecx, %r8
	leaq (%rsi,%r8,4), %r8
	movl (%r8), %r9d
	shrx %eax, %r9d, %ebx
	shlx %edi, %r9d, %r9d
	orl %edx, %r9d
	movl %r9d, (%r8)
	incl %ecx
	movq %rbx, %rdx
	jmp .LB7568
.LB7571:
	testl %edx, %edx
	je .LB7567
.LB7601:
	cmpl $128, %r8d
	jae .LB7567
.LB7609:
	movslq %r8d, %rax
	movl %edx, (%rsi,%rax,4)
	movl 512(%rsi), %eax
	incl %eax
	movl %eax, 512(%rsi)
	jmp .LB7567
.LB7492:
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
.LB6334:
	movl 512(%rcx), %eax
	movl $1, %edx
	cmpl $1, %eax
	cmovb %edx, %eax
	xorl %edx, %edx
	testl %eax, %eax
	cmova %eax, %edx
	shrl $2, %edx
	xorl %esi, %esi
.LB11255:
	testl %edx, %edx
	je .LB11257
.LB11256:
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
	jne .LB11256
.LB11257:
.LB6351:
	cmpl %eax, %esi
	jae .LB6354
.LB6352:
	movslq %esi, %rdx
	movl $0, (%rcx,%rdx,4)
	incl %esi
	cmpl %eax, %esi
	jb .LB6352
.LB6354:
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
.LB6367:
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
.LB11258:
	testl %edx, %edx
	je .LB11260
.LB11259:
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
	jne .LB11259
.LB11260:
.LB6386:
	cmpl %eax, %esi
	jae .LB6389
.LB6387:
	movslq %esi, %rdx
	movl $0, (%rcx,%rdx,4)
	incl %esi
	cmpl %eax, %esi
	jb .LB6387
.LB6389:
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
.LB6402:
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
.LB11261:
	testl %edx, %edx
	je .LB11263
.LB11262:
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
	jne .LB11262
.LB11263:
.LB6423:
	cmpl %eax, %esi
	jae .LB6426
.LB6424:
	movslq %esi, %rdx
	movl $0, (%rcx,%rdx,4)
	incl %esi
	cmpl %eax, %esi
	jb .LB6424
.LB6426:
	movl $1, 512(%rcx)
	andb $127, 516(%rcx)
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
	.text
	.globl math__bigint__bigint_from_u64__2__BigIntE1_ptr1__dataE1_ubits64__ret_voidE1
	.def math__bigint__bigint_from_u64__2__BigIntE1_ptr1__dataE1_ubits64__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
math__bigint__bigint_from_u64__2__BigIntE1_ptr1__dataE1_ubits64__ret_voidE1:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
	movq %rdi, -8(%rsp)
.LB6439:
	movl 512(%rcx), %eax
	movl $2, %esi
	cmpl $2, %eax
	cmovb %esi, %eax
	movabsq $4294967295, %rsi
	andq %rdx, %rsi
	movl %esi, (%rcx)
	shrq $32, %rdx
	movl %edx, 4(%rcx)
	leal -2(%rax), %edx
	xorl %esi, %esi
	cmpl $2, %eax
	cmova %edx, %esi
	movl %esi, %edx
	shrl $2, %edx
	movl $2, %esi
.LB11264:
	testl %edx, %edx
	je .LB11266
.LB11265:
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
	jne .LB11265
.LB11266:
.LB6468:
	cmpl %eax, %esi
	jae .LB6471
.LB6469:
	movslq %esi, %rdx
	movl $0, (%rcx,%rdx,4)
	incl %esi
	cmpl %eax, %esi
	jb .LB6469
.LB6471:
	cmpl $0, 4(%rcx)
	jne .LB6484
.LB6485:
	movl $1, 512(%rcx)
.LB6486:
	andb $127, 516(%rcx)
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB6484:
	movl $2, 512(%rcx)
	jmp .LB6486
	.text
	.globl math__bigint__bigint_is_zero__1__BigIntE1_ptr1__ret_boolE1
	.def math__bigint__bigint_is_zero__1__BigIntE1_ptr1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
math__bigint__bigint_is_zero__1__BigIntE1_ptr1__ret_boolE1:
.LB6493:
	cmpl $1, 512(%rcx)
	je .LB6504
.LB6505:
	xorl %eax, %eax
	ret
.LB6504:
	cmpl $0, (%rcx)
	je .LB6511
.LB6512:
	xorl %eax, %eax
	ret
.LB6511:
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
.LB6514:
	movl 512(%rdx), %eax
	movl 512(%rcx), %esi
	xorl %edi, %edi
	testl %eax, %eax
	cmova %eax, %edi
	shrl $2, %edi
	xorl %r8d, %r8d
.LB11267:
	testl %edi, %edi
	je .LB11269
.LB11268:
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
	jne .LB11268
.LB11269:
.LB6536:
	cmpl %eax, %r8d
	jae .LB6539
.LB6537:
	movslq %r8d, %rdi
	movl (%rdx,%rdi,4), %r9d
	movl %r9d, (%rcx,%rdi,4)
	incl %r8d
	cmpl %eax, %r8d
	jb .LB6537
.LB6539:
	cmpl %eax, %esi
	ja .LB6555
.LB6557:
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
.LB6555:
	movl %esi, %edi
	subl %eax, %edi
	xorl %r8d, %r8d
	cmpl %esi, %eax
	cmovb %edi, %r8d
	movl %r8d, %edi
	shrl $2, %edi
	movq %rax, %r8
.LB11270:
	testl %edi, %edi
	je .LB11272
.LB11271:
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
	jne .LB11271
.LB11272:
.LB6558:
	cmpl %esi, %r8d
	jae .LB6557
.LB6559:
	movslq %r8d, %rdi
	movl $0, (%rcx,%rdi,4)
	incl %r8d
	cmpl %esi, %r8d
	jb .LB6559
	jmp .LB6557
	.text
	.globl math__bigint__bigint_normalize__1__BigIntE1_ptr1__ret_voidE1
	.def math__bigint__bigint_normalize__1__BigIntE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
math__bigint__bigint_normalize__1__BigIntE1_ptr1__ret_voidE1:
.LB6580:
.LB6587:
	movl 512(%rcx), %eax
	cmpl $1, %eax
	jbe .LB6589
.LB6588:
	decl %eax
	movslq %eax, %rdx
	cmpl $0, (%rcx,%rdx,4)
	jne .LB6589
.LB6605:
	movl %eax, 512(%rcx)
	jmp .LB6587
.LB6589:
	cmpl $1, 512(%rcx)
	je .LB6620
.LB6621:
	ret
.LB6620:
	cmpl $0, (%rcx)
	je .LB6627
.LB6629:
	ret
.LB6627:
	andb $127, 516(%rcx)
	jmp .LB6629
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
.LB6632:
	movl 512(%rcx), %eax
	movl 512(%rdx), %esi
	cmpl %esi, %eax
	ja .LB6652
.LB6653:
	movl 512(%rcx), %eax
	movl 512(%rdx), %esi
	cmpl %esi, %eax
	jb .LB6664
.LB6665:
	movl 512(%rcx), %eax
.LB6673:
	testl %eax, %eax
	jbe .LB6675
.LB6674:
	decl %eax
	movslq %eax, %rsi
	movl (%rcx,%rsi,4), %edi
	movl (%rdx,%rsi,4), %r8d
	cmpl %r8d, %edi
	ja .LB6689
.LB6690:
	movl (%rcx,%rsi,4), %edi
	movl (%rdx,%rsi,4), %esi
	cmpl %esi, %edi
	jb .LB6701
.LB6702:
	testl %eax, %eax
	ja .LB6674
.LB6675:
	xorl %eax, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB6701:
	movabsq $4294967295, %rax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB6689:
	movl $1, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB6664:
	movabsq $4294967295, %rax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB6652:
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
.LB6705:
	movq %rcx, %rax
	movq %rdx, %rcx
	movq %r8, %rdx
	movl 512(%rcx), %esi
	movl 512(%rdx), %edi
	cmpl %edi, %esi
	cmova %esi, %edi
	xorl %esi, %esi
	xorl %r8d, %r8d
.LB6746:
	cmpl %edi, %r8d
	jb .LB6758
.LB6752:
	testq %rsi, %rsi
	je .LB6748
.LB6758:
	cmpl $128, %r8d
	jae .LB6748
.LB6747:
	movl 512(%rcx), %r9d
	cmpl %r9d, %r8d
	jb .LB6770
.LB6771:
.LB6772:
	movl 512(%rdx), %r9d
	cmpl %r9d, %r8d
	jb .LB6786
.LB6787:
.LB6788:
	movabsq $4294967295, %r9
	andq %rsi, %r9
	movslq %r8d, %rbx
	movl %r9d, (%rax,%rbx,4)
	shrq $32, %rsi
	movabsq $4294967295, %r9
	andq %r9, %rsi
	incl %r8d
	cmpl %edi, %r8d
	jb .LB6758
	jmp .LB6752
.LB6748:
	movl %r8d, 512(%rax)
	movq %rax, %rcx
	callq math__bigint__bigint_normalize__1__BigIntE1_ptr1__ret_voidE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB6770:
	movslq %r8d, %r9
	movl (%rcx,%r9,4), %r9d
	addq %r9, %rsi
	jmp .LB6772
.LB6786:
	movslq %r8d, %r9
	movl (%rdx,%r9,4), %r9d
	addq %r9, %rsi
	jmp .LB6788
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
.LB6813:
	movq %rdx, %rax
	movq %r8, %rdx
	xorl %esi, %esi
	xorl %edi, %edi
.LB6833:
	movl 512(%rax), %r8d
	cmpl %r8d, %edi
	jae .LB6836
.LB6834:
	movslq %edi, %r8
	movl (%rax,%r8,4), %r8d
	subq %rsi, %r8
	movl 512(%rdx), %esi
	cmpl %esi, %edi
	jb .LB6856
.LB6857:
.LB6858:
	testq %r8, %r8
	js .LB6869
.LB6870:
	movslq %edi, %rsi
	movl %r8d, (%rcx,%rsi,4)
	xorl %esi, %esi
.LB6871:
	incl %edi
	jmp .LB6833
.LB6836:
	movl %r8d, 512(%rcx)
	callq math__bigint__bigint_normalize__1__BigIntE1_ptr1__ret_voidE1
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB6856:
	movslq %edi, %rsi
	movl (%rdx,%rsi,4), %esi
	subq %rsi, %r8
	jns .LB6870
.LB6869:
	movabsq $4294967296, %rsi
	addq %r8, %rsi
	movslq %edi, %r8
	movl %esi, (%rcx,%r8,4)
	movl $1, %esi
	jmp .LB6871
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
.LB6895:
	movq %rcx, %rsi
	movq %rdx, %rdi
	movq %r8, %rbx
	movq %rsi, %rcx
	callq math__bigint__bigint_zero__1__BigIntE1_ptr1__ret_voidE1
	movzbl 516(%rdi), %eax
	shrq $7, %rax
	movzbl 516(%rbx), %ecx
	shrq $7, %rcx
	cmpb %cl, %al
	je .LB6910
.LB6911:
	movq %rdi, %rcx
	movq %rbx, %rdx
	callq math__bigint__bigint_cmp_abs__2__BigIntE1_ptr1__BigIntE1_ptr1__ret_intE1
	testl %eax, %eax
	je .LB6933
.LB6934:
	testl %eax, %eax
	jg .LB6940
.LB6941:
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
.LB6912:
	movq %rsi, %rcx
	callq math__bigint__bigint_normalize__1__BigIntE1_ptr1__ret_voidE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB6940:
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
	jmp .LB6912
.LB6933:
	movq %rsi, %rcx
	callq math__bigint__bigint_zero__1__BigIntE1_ptr1__ret_voidE1
	jmp .LB6912
.LB6910:
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
	jmp .LB6912
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
.LB6968:
	movq %rcx, %rbx
	movq %rdx, %r12
	movq %r8, %r13
	leaq .LZERO(%rip), %rsi
	leaq -560(%rbp), %rdi
	movl $517, %ecx
	rep movsb
	leaq -560(%rbp), %rcx
	movq %r13, %rdx
	callq math__bigint__bigint_copy__2__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	leaq -560(%rbp), %rcx
	callq math__bigint__bigint_is_zero__1__BigIntE1_ptr1__ret_boolE1
	testb %al, %al
	jne .LB6976
.LB6977:
	movzbl 516(%r13), %eax
	shrq $7, %rax
	xorl $1, %eax
	andl $1, %eax
	shll $7, %eax
	andb $127, -44(%rbp)
	orb %al, -44(%rbp)
.LB6978:
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
.LB6976:
	andb $127, -44(%rbp)
	jmp .LB6978
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
.LB6990:
	movq %rcx, %rsi
	movq %rdx, %rdi
	movq %r8, %rbx
	movq %rsi, %rcx
	callq math__bigint__bigint_zero__1__BigIntE1_ptr1__ret_voidE1
	movq %rdi, %rcx
	callq math__bigint__bigint_is_zero__1__BigIntE1_ptr1__ret_boolE1
	testb %al, %al
	jne .LB7005
.LB6999:
	movq %rbx, %rcx
	callq math__bigint__bigint_is_zero__1__BigIntE1_ptr1__ret_boolE1
	testb %al, %al
	jne .LB7005
.LB7006:
	xorl %eax, %eax
	xorl %ecx, %ecx
	xorl %edx, %edx
.LB7026:
	movl 512(%rdi), %r8d
	cmpl %r8d, %eax
	jae .LB7029
.LB7027:
	xorl %r8d, %r8d
	movq %rdx, %r9
	xorl %edx, %edx
.LB7037:
	movl 512(%rbx), %r12d
	cmpl %r12d, %edx
	jae .LB7040
.LB7038:
	leal (%rax,%rdx), %r9d
	movslq %r9d, %r9
	leaq (%rsi,%r9,4), %r9
	movl (%r9), %r12d
	addq %r8, %r12
	movslq %eax, %r8
	movl (%rdi,%r8,4), %r8d
	movslq %edx, %r13
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
	jmp .LB7037
.LB7029:
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
.LB7040:
	leal (%rax,%r12), %edx
.LB7087:
	testq %r8, %r8
	je .LB7089
.LB7093:
	cmpl $128, %edx
	jae .LB7089
.LB7088:
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
	jne .LB7093
.LB7089:
	cmpl %ecx, %edx
	cmova %edx, %ecx
	incl %eax
	movq %r9, %rdx
	jmp .LB7026
.LB7005:
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
.LB7130:
	movq %rcx, %rbx
	movq %rdx, %r12
	movq %r8, %r13
	cmpl $16, 512(%r12)
	jb .LB7150
.LB7141:
	cmpl $16, 512(%r13)
	jb .LB7150
.LB7151:
	leaq .LZERO(%rip), %rsi
	leaq -560(%rbp), %rdi
	movl $517, %ecx
	rep movsb
	leaq .LZERO(%rip), %rsi
	leaq -1080(%rbp), %rdi
	movl $517, %ecx
	rep movsb
	movl 512(%r12), %eax
	movl 512(%r13), %ecx
	cmpl %ecx, %eax
	jb .LB7170
.LB7171:
	leaq -560(%rbp), %rcx
	movq %r12, %rdx
	callq math__bigint__bigint_copy__2__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	leaq -1080(%rbp), %rcx
	movq %r13, %rdx
	callq math__bigint__bigint_copy__2__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
.LB7172:
	movl -48(%rbp), %eax
	movl %eax, %r12d
	shrl $1, %r12d
	leaq .LZERO(%rip), %rsi
	leaq -1600(%rbp), %rdi
	movl $517, %ecx
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
.LB7211:
	cmpl %r12d, %edx
	jae .LB7214
.LB7212:
	movslq %edx, %rsi
	movl -560(%rbp,%rsi,4), %edi
	movl %edi, (%rax,%rsi,4)
	movl -568(%rbp), %esi
	cmpl %esi, %edx
	jb .LB7232
.LB7233:
	xorl %esi, %esi
.LB7234:
	movslq %edx, %rdi
	movl %esi, (%rcx,%rdi,4)
	incl %edx
	cmpl %r12d, %edx
	jb .LB7212
	jmp .LB7214
.LB7170:
	leaq -560(%rbp), %rcx
	movq %r13, %rdx
	callq math__bigint__bigint_copy__2__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	leaq -1080(%rbp), %rcx
	movq %r12, %rdx
	callq math__bigint__bigint_copy__2__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	jmp .LB7172
.LB7214:
	movl %r12d, -1088(%rbp)
	movl -568(%rbp), %eax
	cmpl %r12d, %eax
	cmova %r12d, %eax
	movl %eax, -2128(%rbp)
	leaq -1600(%rbp), %rcx
	callq math__bigint__bigint_normalize__1__BigIntE1_ptr1__ret_voidE1
	leaq -2640(%rbp), %rcx
	callq math__bigint__bigint_normalize__1__BigIntE1_ptr1__ret_voidE1
	movl -48(%rbp), %eax
	movl %eax, %ecx
	subl %r12d, %ecx
	xorl %edx, %edx
	cmpl %r12d, %eax
	cmova %ecx, %edx
	movl -568(%rbp), %eax
	movl %eax, %ecx
	subl %r12d, %ecx
	xorl %esi, %esi
	cmpl %r12d, %eax
	cmova %ecx, %esi
	xorl %eax, %eax
	testl %edx, %edx
	cmova %edx, %eax
	shrl $2, %eax
	xorl %ecx, %ecx
.LB11273:
	testl %eax, %eax
	je .LB11275
.LB11274:
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
	jne .LB11274
.LB11275:
.LB7297:
	cmpl %edx, %ecx
	jae .LB7300
.LB7298:
	leal (%r12,%rcx), %eax
	movslq %eax, %rax
	movl -560(%rbp,%rax,4), %eax
	movslq %ecx, %rdi
	movl %eax, -2120(%rbp,%rdi,4)
	incl %ecx
	cmpl %edx, %ecx
	jb .LB7298
.LB7300:
	xorl %eax, %eax
	testl %esi, %esi
	cmova %esi, %eax
	shrl $2, %eax
	xorl %ecx, %ecx
.LB11276:
	testl %eax, %eax
	je .LB11278
.LB11277:
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
	jne .LB11277
.LB11278:
.LB7315:
	cmpl %esi, %ecx
	jae .LB7318
.LB7316:
	leal (%r12,%rcx), %eax
	movslq %eax, %rax
	movl -1080(%rbp,%rax,4), %eax
	movslq %ecx, %rdi
	movl %eax, -3160(%rbp,%rdi,4)
	incl %ecx
	cmpl %esi, %ecx
	jb .LB7316
.LB7318:
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
	jne .LB7349
.LB7342:
	leaq -3160(%rbp), %rcx
	callq math__bigint__bigint_is_zero__1__BigIntE1_ptr1__ret_boolE1
	testb %al, %al
	je .LB7347
.LB7349:
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
.LB7347:
	leaq -4720(%rbp), %rcx
	leaq -2120(%rbp), %rdx
	leaq -3160(%rbp), %r8
	callq math__bigint__bigint_mul_karatsuba__3__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	jmp .LB7349
.LB7232:
	movslq %edx, %rsi
	movl -1080(%rbp,%rsi,4), %esi
	jmp .LB7234
.LB7150:
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
.LB7367:
	movq %rcx, %rbx
	movq %rdx, %r12
	movq %r8, %r13
	movq %rbx, %rcx
	callq math__bigint__bigint_zero__1__BigIntE1_ptr1__ret_voidE1
	movq %r12, %rcx
	callq math__bigint__bigint_is_zero__1__BigIntE1_ptr1__ret_boolE1
	testb %al, %al
	jne .LB7382
.LB7376:
	movq %r13, %rcx
	callq math__bigint__bigint_is_zero__1__BigIntE1_ptr1__ret_boolE1
	testb %al, %al
	jne .LB7382
.LB7383:
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
	shrq $7, %rax
	movzbl 516(%r13), %ecx
	shrq $7, %rcx
	cmpb %cl, %al
	je .LB7404
.LB7405:
	orb $128, 516(%rbx)
.LB7406:
	movq %rbx, %rcx
	callq math__bigint__bigint_is_zero__1__BigIntE1_ptr1__ret_boolE1
	testb %al, %al
	jne .LB7414
.LB7415:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB7404:
	andb $127, 516(%rbx)
	jmp .LB7406
.LB7414:
	andb $127, 516(%rbx)
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB7382:
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
.LB7419:
	xorl %eax, %eax
	xorl %edx, %edx
.LB7428:
	movl 512(%rcx), %esi
	cmpl %esi, %edx
	jae .LB7431
.LB7429:
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
	jmp .LB7428
.LB7431:
	testl %eax, %eax
	jne .LB7459
.LB7460:
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB7459:
	cmpl $128, %esi
	jb .LB7468
.LB7470:
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB7468:
	movslq %esi, %rdx
	movl %eax, (%rcx,%rdx,4)
	movl 512(%rcx), %eax
	incl %eax
	movl %eax, 512(%rcx)
	jmp .LB7470
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
.LB7628:
	movq %rcx, %rbx
	movq %rdx, %r12
	movq %r8, %r13
	movq %r9, %r14
	leaq .LZERO(%rip), %rsi
	leaq -576(%rbp), %rdi
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
	jne .LB7646
.LB7647:
	movq %r13, %rcx
	movq %r14, %rdx
	callq math__bigint__bigint_cmp_abs__2__BigIntE1_ptr1__BigIntE1_ptr1__ret_intE1
	testl %eax, %eax
	js .LB7655
.LB7656:
	leaq -576(%rbp), %rcx
	movq %r13, %rdx
	callq math__bigint__bigint_copy__2__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	andb $127, -60(%rbp)
	leaq -1096(%rbp), %rcx
	movq %r14, %rdx
	callq math__bigint__bigint_copy__2__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	andb $127, -580(%rbp)
	cmpl $1, -584(%rbp)
	je .LB7678
.LB7679:
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
.LB7805:
	testl %ecx, %ecx
	jbe .LB7807
.LB7806:
	btl %ecx, %eax
	jb .LB7807
.LB7816:
	decl %ecx
	testl %ecx, %ecx
	ja .LB7806
.LB7807:
	movl -64(%rbp), %eax
	decl %eax
	shll $5, %eax
	addl %ecx, %eax
	leaq -1616(%rbp), %rdi
	movq %rax, %r15
	movq $0, -3184(%rbp)
	movq $0, -3192(%rbp)
.LB7831:
	leaq -1616(%rbp), %rcx
	callq math__bigint__bigint_shift_left_1__1__BigIntE1_ptr1__ret_voidE1
	movl %r15d, %eax
	shrl $5, %eax
	movl %r15d, %ecx
	andl $31, %ecx
	movslq %eax, %rax
	movl -576(%rbp,%rax,4), %eax
	btl %ecx, %eax
	jb .LB7847
.LB7849:
	leaq -1616(%rbp), %rcx
	leaq -1096(%rbp), %rdx
	callq math__bigint__bigint_cmp_abs__2__BigIntE1_ptr1__BigIntE1_ptr1__ret_intE1
	testl %eax, %eax
	jns .LB7858
.LB7859:
	movq -3184(%rbp), %rax
	movq -3192(%rbp), %rcx
.LB7860:
	testl %r15d, %r15d
	je .LB7833
.LB7891:
	decl %r15d
	movq %rax, -3184(%rbp)
	movq %rcx, -3192(%rbp)
	jmp .LB7831
.LB7847:
	movl (%rdi), %eax
	orl $1, %eax
	movl %eax, (%rdi)
	jmp .LB7849
.LB7858:
	leaq -1616(%rbp), %rcx
	leaq -1616(%rbp), %rdx
	leaq -1096(%rbp), %r8
	callq math__bigint__bigint_sub_abs__3__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	movl %r15d, %eax
	shrl $5, %eax
	movl %r15d, %ecx
	andl $31, %ecx
	movslq %eax, %rdx
	leaq (%rsi,%rdx,4), %rdx
	movl (%rdx), %r8d
	btsl %ecx, %r8d
	movl %r8d, (%rdx)
	leal 1(%rax), %edx
	movl -1624(%rbp), %r8d
	cmpl %r8d, %edx
	ja .LB7882
.LB7884:
	testl %r15d, %r15d
	je .LB7833
	jmp .LB7891
.LB7882:
	movl %edx, -1624(%rbp)
	jmp .LB7884
.LB7833:
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
	shrq $7, %rax
	movzbl 516(%r14), %ecx
	shrq $7, %rcx
	cmpb %cl, %al
	je .LB7908
.LB7909:
	orb $128, 516(%rbx)
.LB7910:
	movzbl 516(%r13), %eax
	shrq $7, %rax
	andl $1, %eax
	shll $7, %eax
	andb $127, 516(%r12)
	orb %al, 516(%r12)
	movq %rbx, %rcx
	callq math__bigint__bigint_is_zero__1__BigIntE1_ptr1__ret_boolE1
	testb %al, %al
	jne .LB7924
.LB7926:
	movq %r12, %rcx
	callq math__bigint__bigint_is_zero__1__BigIntE1_ptr1__ret_boolE1
	testb %al, %al
	jne .LB7932
.LB7933:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB7908:
	andb $127, 516(%rbx)
	jmp .LB7910
.LB7924:
	andb $127, 516(%rbx)
	jmp .LB7926
.LB7932:
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
.LB7678:
	leaq -576(%rbp), %rsi
	leaq -2136(%rbp), %rdi
	movl -1096(%rbp), %eax
	movl %eax, %r15d
	leaq -2136(%rbp), %rcx
	callq math__bigint__bigint_zero__1__BigIntE1_ptr1__ret_voidE1
	movl -64(%rbp), %eax
	movq $0, -3200(%rbp)
.LB7700:
	testl %eax, %eax
	jbe .LB7702
.LB7701:
	leal -1(%rax), %ecx
	movq -3200(%rbp), %rax
	shlq $32, %rax
	movslq %ecx, %r8
	movl (%rsi,%r8,4), %edx
	movq %rax, %r9
	orq %rdx, %r9
	movq %r9, %rax
	xorl %edx, %edx
	divq %r15
	movl %eax, (%rdi,%r8,4)
	movq %r9, %rax
	xorl %edx, %edx
	divq %r15
	movq %rdx, -3200(%rbp)
	movq %rcx, %rax
	testl %eax, %eax
	ja .LB7701
.LB7702:
	movl -64(%rbp), %eax
	movl %eax, -1624(%rbp)
	leaq -2136(%rbp), %rcx
	callq math__bigint__bigint_normalize__1__BigIntE1_ptr1__ret_voidE1
	leaq -1616(%rbp), %rcx
	callq math__bigint__bigint_zero__1__BigIntE1_ptr1__ret_voidE1
	movl -3200(%rbp), %eax
	movl %eax, -1616(%rbp)
	movl $1, -1104(%rbp)
	leaq -1616(%rbp), %rcx
	callq math__bigint__bigint_normalize__1__BigIntE1_ptr1__ret_voidE1
	leaq -2136(%rbp), %rdx
	movq %rbx, %rcx
	callq math__bigint__bigint_copy__2__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	leaq -1616(%rbp), %rdx
	movq %r12, %rcx
	callq math__bigint__bigint_copy__2__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	movzbl 516(%r13), %eax
	shrq $7, %rax
	movzbl 516(%r14), %ecx
	shrq $7, %rcx
	cmpb %cl, %al
	je .LB7751
.LB7752:
	orb $128, 516(%rbx)
.LB7753:
	movzbl 516(%r13), %eax
	shrq $7, %rax
	andl $1, %eax
	shll $7, %eax
	andb $127, 516(%r12)
	orb %al, 516(%r12)
	movq %rbx, %rcx
	callq math__bigint__bigint_is_zero__1__BigIntE1_ptr1__ret_boolE1
	testb %al, %al
	jne .LB7767
.LB7769:
	movq %r12, %rcx
	callq math__bigint__bigint_is_zero__1__BigIntE1_ptr1__ret_boolE1
	testb %al, %al
	jne .LB7775
.LB7776:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB7751:
	andb $127, 516(%rbx)
	jmp .LB7753
.LB7767:
	andb $127, 516(%rbx)
	jmp .LB7769
.LB7775:
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
.LB7655:
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
.LB7646:
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
	.globl math__bigint__bigint_pow_uint__3__BigIntE1_ptr1__BigIntE1_ptr1__uintE1__ret_voidE1
	.def math__bigint__bigint_pow_uint__3__BigIntE1_ptr1__BigIntE1_ptr1__uintE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
math__bigint__bigint_pow_uint__3__BigIntE1_ptr1__BigIntE1_ptr1__uintE1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $1104, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
.LB7937:
	movq %rcx, %rbx
	movl %r8d, %r12d
	leaq .LZERO(%rip), %rsi
	leaq -552(%rbp), %rdi
	movl $517, %ecx
	rep movsb
	leaq .LZERO(%rip), %rsi
	leaq -1072(%rbp), %rdi
	movl $517, %ecx
	rep movsb
	leaq -552(%rbp), %rcx
	callq math__bigint__bigint_copy__2__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	movq %rbx, %rcx
	callq math__bigint__bigint_one__1__BigIntE1_ptr1__ret_voidE1
	testl %r12d, %r12d
	je .LB7949
.LB7950:
.LB7954:
	testl %r12d, %r12d
	jbe .LB7956
.LB7955:
	movl %r12d, %eax
	andl $1, %eax
	testl %eax, %eax
	jne .LB7962
.LB7964:
	shrl $1, %r12d
	testl %r12d, %r12d
	ja .LB7973
.LB7975:
	testl %r12d, %r12d
	ja .LB7955
.LB7956:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB7962:
	leaq -1072(%rbp), %rcx
	leaq -552(%rbp), %r8
	movq %rbx, %rdx
	callq math__bigint__bigint_mul__3__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	leaq -1072(%rbp), %rdx
	movq %rbx, %rcx
	callq math__bigint__bigint_copy__2__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	jmp .LB7964
.LB7973:
	leaq -1072(%rbp), %rcx
	leaq -552(%rbp), %rdx
	leaq -552(%rbp), %r8
	callq math__bigint__bigint_mul__3__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	leaq -552(%rbp), %rcx
	leaq -1072(%rbp), %rdx
	callq math__bigint__bigint_copy__2__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	jmp .LB7975
.LB7949:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
	.text
	.globl math__decimal__decimal_set_precision__1__dataE1_sbits32__ret_voidE1
	.def math__decimal__decimal_set_precision__1__dataE1_sbits32__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
math__decimal__decimal_set_precision__1__dataE1_sbits32__ret_voidE1:
.LB7976:
	movl $1, %eax
	cmpl $1, %ecx
	cmovl %eax, %ecx
	movl %ecx, DECIMAL_PRECISION(%rip)
	ret
	.text
	.globl math__decimal__decimal_bigint_digit_count__1__BigIntE1_ptr1__ret_dataE1_sbits32
	.def math__decimal__decimal_bigint_digit_count__1__BigIntE1_ptr1__ret_dataE1_sbits32;
	.scl 2;
	.type 32;
	.endef
math__decimal__decimal_bigint_digit_count__1__BigIntE1_ptr1__ret_dataE1_sbits32:
	pushq %rbp
	movq %rsp, %rbp
	subq $2144, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
.LB7984:
	movq %rcx, %rbx
	movq %rbx, %rcx
	callq math__bigint__bigint_is_zero__1__BigIntE1_ptr1__ret_boolE1
	testb %al, %al
	jne .LB7989
.LB7990:
	leaq .LZERO(%rip), %rsi
	leaq -552(%rbp), %rdi
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
	leaq -552(%rbp), %rcx
	movq %rbx, %rdx
	callq math__bigint__bigint_copy__2__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	andb $127, -36(%rbp)
	leaq -1072(%rbp), %rcx
	movl $1000000000, %edx
	callq math__bigint__bigint_from_uint__2__BigIntE1_ptr1__uintE1__ret_voidE1
	leaq -2112(%rbp), %rsi
	xorl %edi, %edi
	xorl %ebx, %ebx
	movl $1, %r12d
.LB8005:
	leaq -552(%rbp), %rcx
	callq math__bigint__bigint_is_zero__1__BigIntE1_ptr1__ret_boolE1
	testb %al, %al
	jne .LB8007
.LB8006:
	leaq -1592(%rbp), %rcx
	leaq -2112(%rbp), %rdx
	leaq -552(%rbp), %r8
	leaq -1072(%rbp), %r9
	callq math__bigint__bigint_divmod__4__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	movl (%rsi), %ebx
	leaq -552(%rbp), %rcx
	leaq -1592(%rbp), %rdx
	callq math__bigint__bigint_copy__2__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	addl $9, %edi
	xorl %r12d, %r12d
	jmp .LB8005
.LB8007:
	testb %r12b, %r12b
	jne .LB8016
.LB8017:
	subl $9, %edi
	testl %ebx, %ebx
	je .LB8023
.LB8024:
.LB8030:
	testl %ebx, %ebx
	jbe .LB8032
.LB8031:
	incl %edi
	movabsq $3435973837, %rax
	imulq %rax, %rbx
	movq %rbx, %rax
	shrq $35, %rax
	movl %eax, %ebx
	testl %ebx, %ebx
	ja .LB8031
.LB8032:
.LB8025:
	cmpl $1, %edi
	jl .LB8041
.LB8042:
	movl %edi, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB8023:
	incl %edi
	cmpl $1, %edi
	jge .LB8042
.LB8041:
	movl $1, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB8016:
	movl $1, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB7989:
	movl $1, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
	.text
	.globl math__decimal__decimal_coeff_scale_up__2__BigIntE1_ptr1__dataE1_sbits32__ret_voidE1
	.def math__decimal__decimal_coeff_scale_up__2__BigIntE1_ptr1__dataE1_sbits32__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
math__decimal__decimal_coeff_scale_up__2__BigIntE1_ptr1__dataE1_sbits32__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $1632, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
.LB8045:
	movq %rcx, %rbx
	movl %edx, %r12d
	testl %r12d, %r12d
	jle .LB8050
.LB8051:
	leaq .LZERO(%rip), %rsi
	leaq -552(%rbp), %rdi
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
	leaq -552(%rbp), %rcx
	movl $10, %edx
	callq math__bigint__bigint_from_uint__2__BigIntE1_ptr1__uintE1__ret_voidE1
	leaq -1072(%rbp), %rcx
	leaq -552(%rbp), %rdx
	movq %r12, %r8
	callq math__bigint__bigint_pow_uint__3__BigIntE1_ptr1__BigIntE1_ptr1__uintE1__ret_voidE1
	leaq -1592(%rbp), %rcx
	leaq -1072(%rbp), %r8
	movq %rbx, %rdx
	callq math__bigint__bigint_mul__3__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	leaq -1592(%rbp), %rdx
	movq %rbx, %rcx
	callq math__bigint__bigint_copy__2__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB8050:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
	.text
	.globl math__decimal__decimal_coeff_scale_down__2__BigIntE1_ptr1__dataE1_sbits32__ret_voidE1
	.def math__decimal__decimal_coeff_scale_down__2__BigIntE1_ptr1__dataE1_sbits32__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
math__decimal__decimal_coeff_scale_down__2__BigIntE1_ptr1__dataE1_sbits32__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	movl $4224, %eax
	callq __chkstk
	subq %rax, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
.LB8061:
	movq %rcx, %rbx
	movl %edx, %r12d
	testl %r12d, %r12d
	jle .LB8066
.LB8067:
	leaq .LZERO(%rip), %rsi
	leaq -552(%rbp), %rdi
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
	leaq -552(%rbp), %rcx
	movl $10, %edx
	callq math__bigint__bigint_from_uint__2__BigIntE1_ptr1__uintE1__ret_voidE1
	leaq -1072(%rbp), %rcx
	leaq -552(%rbp), %rdx
	movq %r12, %r8
	callq math__bigint__bigint_pow_uint__3__BigIntE1_ptr1__BigIntE1_ptr1__uintE1__ret_voidE1
	leaq -1592(%rbp), %rcx
	leaq -2112(%rbp), %rdx
	leaq -1072(%rbp), %r9
	movq %rbx, %r8
	callq math__bigint__bigint_divmod__4__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	leaq -3152(%rbp), %rcx
	movl $2, %edx
	callq math__bigint__bigint_from_uint__2__BigIntE1_ptr1__uintE1__ret_voidE1
	leaq -2632(%rbp), %rcx
	leaq -2112(%rbp), %rdx
	leaq -3152(%rbp), %r8
	callq math__bigint__bigint_mul__3__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	leaq -2632(%rbp), %rcx
	leaq -1072(%rbp), %rdx
	callq math__bigint__bigint_cmp_abs__2__BigIntE1_ptr1__BigIntE1_ptr1__ret_intE1
	testl %eax, %eax
	jns .LB8082
.LB8083:
	leaq -1592(%rbp), %rdx
	movq %rbx, %rcx
	callq math__bigint__bigint_copy__2__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB8082:
	leaq -3672(%rbp), %rcx
	callq math__bigint__bigint_one__1__BigIntE1_ptr1__ret_voidE1
	leaq -4192(%rbp), %rcx
	leaq -1592(%rbp), %rdx
	leaq -3672(%rbp), %r8
	callq math__bigint__bigint_add__3__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	leaq -4192(%rbp), %rdx
	movq %rbx, %rcx
	callq math__bigint__bigint_copy__2__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB8066:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
	.text
	.globl math__decimal__decimal_apply_precision__1__DecimalE1_ptr1__ret_voidE1
	.def math__decimal__decimal_apply_precision__1__DecimalE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
math__decimal__decimal_apply_precision__1__DecimalE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB8089:
	movq %rcx, %rsi
	movl 512(%rsi), %eax
	imull $10, %eax, %eax
	movl DECIMAL_PRECISION(%rip), %ecx
	cmpl %ecx, %eax
	jle .LB8106
.LB8107:
	movq %rsi, %rcx
	callq math__decimal__decimal_bigint_digit_count__1__BigIntE1_ptr1__ret_dataE1_sbits32
	movl DECIMAL_PRECISION(%rip), %ecx
	movl %eax, %edi
	subl %ecx, %edi
	testl %edi, %edi
	jg .LB8119
.LB8121:
	movq %rsi, %rcx
	callq math__bigint__bigint_is_zero__1__BigIntE1_ptr1__ret_boolE1
	testb %al, %al
	jne .LB8136
.LB8137:
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB8119:
	movq %rsi, %rcx
	movq %rdi, %rdx
	callq math__decimal__decimal_coeff_scale_down__2__BigIntE1_ptr1__dataE1_sbits32__ret_voidE1
	movl 520(%rsi), %eax
	addl %edi, %eax
	movl %eax, 520(%rsi)
	jmp .LB8121
.LB8136:
	andb $127, 524(%rsi)
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB8106:
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
	.text
	.globl math__decimal__decimal_align__2__DecimalE1_ptr1__DecimalE1_ptr1__ret_voidE1
	.def math__decimal__decimal_align__2__DecimalE1_ptr1__DecimalE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
math__decimal__decimal_align__2__DecimalE1_ptr1__DecimalE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
.LB8141:
	movq %rcx, %rsi
	movq %rdx, %rdi
	movl 520(%rsi), %eax
	movl 520(%rdi), %ecx
	cmpl %ecx, %eax
	je .LB8153
.LB8154:
	movl 520(%rsi), %eax
	movl 520(%rdi), %ecx
	cmpl %ecx, %eax
	jg .LB8166
.LB8167:
	movl %ecx, %ebx
	subl %eax, %ebx
	movq %rdi, %rcx
	callq math__decimal__decimal_bigint_digit_count__1__BigIntE1_ptr1__ret_dataE1_sbits32
	movl $1152, %ecx
	movl %ecx, %r12d
	subl %eax, %r12d
	cmpl %r12d, %ebx
	jle .LB8258
.LB8259:
	testl %r12d, %r12d
	jg .LB8272
.LB8274:
	movl 520(%rdi), %eax
	movl 520(%rsi), %ecx
	movl %eax, %edx
	subl %ecx, %edx
	movq %rsi, %rcx
	callq math__decimal__decimal_coeff_scale_down__2__BigIntE1_ptr1__dataE1_sbits32__ret_voidE1
	movl 520(%rdi), %eax
	movl %eax, 520(%rsi)
.LB8260:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB8272:
	movq %rdi, %rcx
	movq %r12, %rdx
	callq math__decimal__decimal_coeff_scale_up__2__BigIntE1_ptr1__dataE1_sbits32__ret_voidE1
	movl 520(%rdi), %eax
	subl %r12d, %eax
	movl %eax, 520(%rdi)
	jmp .LB8274
.LB8258:
	movq %rdi, %rcx
	movq %rbx, %rdx
	callq math__decimal__decimal_coeff_scale_up__2__BigIntE1_ptr1__dataE1_sbits32__ret_voidE1
	movl 520(%rsi), %eax
	movl %eax, 520(%rdi)
	jmp .LB8260
.LB8166:
	movl %eax, %ebx
	subl %ecx, %ebx
	movq %rsi, %rcx
	callq math__decimal__decimal_bigint_digit_count__1__BigIntE1_ptr1__ret_dataE1_sbits32
	movl $1152, %ecx
	movl %ecx, %r12d
	subl %eax, %r12d
	cmpl %r12d, %ebx
	jle .LB8190
.LB8191:
	testl %r12d, %r12d
	jg .LB8204
.LB8206:
	movl 520(%rsi), %eax
	movl 520(%rdi), %ecx
	movl %eax, %edx
	subl %ecx, %edx
	movq %rdi, %rcx
	callq math__decimal__decimal_coeff_scale_down__2__BigIntE1_ptr1__dataE1_sbits32__ret_voidE1
	movl 520(%rsi), %eax
	movl %eax, 520(%rdi)
.LB8192:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB8204:
	movq %rsi, %rcx
	movq %r12, %rdx
	callq math__decimal__decimal_coeff_scale_up__2__BigIntE1_ptr1__dataE1_sbits32__ret_voidE1
	movl 520(%rsi), %eax
	subl %r12d, %eax
	movl %eax, 520(%rsi)
	jmp .LB8206
.LB8190:
	movq %rsi, %rcx
	movq %rbx, %rdx
	callq math__decimal__decimal_coeff_scale_up__2__BigIntE1_ptr1__dataE1_sbits32__ret_voidE1
	movl 520(%rdi), %eax
	movl %eax, 520(%rsi)
	jmp .LB8192
.LB8153:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
	.text
	.globl math__decimal__decimal_zero__1__DecimalE1_ptr1__ret_voidE1
	.def math__decimal__decimal_zero__1__DecimalE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
math__decimal__decimal_zero__1__DecimalE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
.LB8305:
	movq %rcx, %rsi
	movq %rsi, %rcx
	callq math__bigint__bigint_zero__1__BigIntE1_ptr1__ret_voidE1
	movl $0, 520(%rsi)
	andb $127, 524(%rsi)
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl math__decimal__decimal_copy__2__DecimalE1_ptr1__DecimalE1_ptr1__ret_voidE1
	.def math__decimal__decimal_copy__2__DecimalE1_ptr1__DecimalE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
math__decimal__decimal_copy__2__DecimalE1_ptr1__DecimalE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB8313:
	movq %rcx, %rsi
	movq %rdx, %rdi
	movq %rsi, %rcx
	movq %rdi, %rdx
	callq math__bigint__bigint_copy__2__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	movl 520(%rdi), %eax
	movl %eax, 520(%rsi)
	movzbl 524(%rdi), %eax
	shrq $7, %rax
	andl $1, %eax
	shll $7, %eax
	andb $127, 524(%rsi)
	orb %al, 524(%rsi)
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
	.text
	.globl math__decimal__decimal_from_i64__2__DecimalE1_ptr1__dataE1_sbits64__ret_voidE1
	.def math__decimal__decimal_from_i64__2__DecimalE1_ptr1__dataE1_sbits64__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
math__decimal__decimal_from_i64__2__DecimalE1_ptr1__dataE1_sbits64__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
.LB8332:
	movq %rcx, %rsi
	testq %rdx, %rdx
	js .LB8338
.LB8339:
	andb $127, 524(%rsi)
	movq %rsi, %rcx
	callq math__bigint__bigint_from_u64__2__BigIntE1_ptr1__dataE1_ubits64__ret_voidE1
	movl $0, 520(%rsi)
	movq -8(%rbp), %rsi
	leave
	ret
.LB8338:
	orb $128, 524(%rsi)
	incq %rdx
	xorl %eax, %eax
	subq %rdx, %rax
	leaq 1(%rax), %rdx
	movq %rsi, %rcx
	callq math__bigint__bigint_from_u64__2__BigIntE1_ptr1__dataE1_ubits64__ret_voidE1
	movl $0, 520(%rsi)
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl math__decimal__decimal_from_string__2__DecimalE1_ptr1__byteE1_ptr1__ret_voidE1
	.def math__decimal__decimal_from_string__2__DecimalE1_ptr1__byteE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
math__decimal__decimal_from_string__2__DecimalE1_ptr1__byteE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $1648, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
	movq %r14, -48(%rbp)
	movq %r15, -56(%rbp)
.LB8360:
	movq %rcx, %rbx
	movq %rdx, %r12
	movq %rbx, %rcx
	callq math__bigint__bigint_zero__1__BigIntE1_ptr1__ret_voidE1
	movl $0, 520(%rbx)
	andb $127, 524(%rbx)
	movzbl (%r12), %eax
	cmpb $45, %al
	je .LB8372
.LB8373:
	cmpb $43, %al
	je .LB8382
.LB8383:
	xorl %r13d, %r13d
	xorl %r14d, %r14d
.LB8374:
	leaq .LZERO(%rip), %rsi
	leaq -576(%rbp), %rdi
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
	movq %rbx, %rcx
	callq math__bigint__bigint_zero__1__BigIntE1_ptr1__ret_voidE1
	xorl %esi, %esi
	xorl %edi, %edi
	xorl %eax, %eax
	movq %r13, %r15
	xorl %r13d, %r13d
.LB8396:
	movslq %r15d, %rcx
	movzbl (%r12,%rcx,1), %ecx
	testb %cl, %cl
	je .LB8398
.LB8405:
	cmpb $101, %cl
	je .LB8398
.LB8413:
	cmpb $69, %cl
	je .LB8398
.LB8397:
	cmpb $46, %cl
	je .LB8427
.LB8428:
	cmpb $48, %cl
	jb .LB8398
.LB8434:
	cmpb $57, %cl
	ja .LB8398
.LB8440:
	imull $10, %r13d, %r13d
	subl $48, %ecx
	movzbl %cl, %ecx
	addl %ecx, %r13d
	incl %eax
	leal 1(%rsi), %ecx
	testb %dil, %dil
	cmovne %ecx, %esi
	cmpl $9, %eax
	je .LB8458
.LB8459:
.LB8460:
	incl %r15d
	jmp .LB8396
.LB8382:
	movl $1, %r13d
	xorl %r14d, %r14d
	jmp .LB8374
.LB8372:
	movl $1, %r13d
	movl $1, %r14d
	jmp .LB8374
.LB8458:
	leaq -576(%rbp), %rcx
	movl $1000000000, %edx
	callq math__bigint__bigint_from_uint__2__BigIntE1_ptr1__uintE1__ret_voidE1
	leaq -1616(%rbp), %rcx
	leaq -576(%rbp), %r8
	movq %rbx, %rdx
	callq math__bigint__bigint_mul__3__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	leaq -1096(%rbp), %rcx
	movq %r13, %rdx
	callq math__bigint__bigint_from_uint__2__BigIntE1_ptr1__uintE1__ret_voidE1
	leaq -1616(%rbp), %rdx
	leaq -1096(%rbp), %r8
	movq %rbx, %rcx
	callq math__bigint__bigint_add__3__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	xorl %r13d, %r13d
	xorl %eax, %eax
	jmp .LB8460
.LB8398:
	testl %eax, %eax
	jg .LB8470
.LB8472:
	xorl %eax, %eax
	subl %esi, %eax
	movl %eax, 520(%rbx)
	movslq %r15d, %rax
	movzbl (%r12,%rax,1), %eax
	cmpb $101, %al
	je .LB8509
.LB8501:
	cmpb $69, %al
	je .LB8509
.LB8511:
	movq %rbx, %rcx
	callq math__bigint__bigint_is_zero__1__BigIntE1_ptr1__ret_boolE1
	testb %al, %al
	jne .LB8589
.LB8590:
	movq %r14, %rax
	andl $1, %eax
	shll $7, %eax
	andb $127, 524(%rbx)
	orb %al, 524(%rbx)
.LB8591:
	movq %rbx, %rcx
	callq math__decimal__decimal_apply_precision__1__DecimalE1_ptr1__ret_voidE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB8470:
	movl $1, %edx
	xorl %ecx, %ecx
.LB8475:
	cmpl %eax, %ecx
	jge .LB8478
.LB8476:
	imull $10, %edx, %edx
	incl %ecx
	cmpl %eax, %ecx
	jl .LB8476
.LB8478:
	leaq -576(%rbp), %rcx
	callq math__bigint__bigint_from_uint__2__BigIntE1_ptr1__uintE1__ret_voidE1
	movq %rbx, %rdi
	leaq -1616(%rbp), %rcx
	leaq -576(%rbp), %r8
	movq %rdi, %rdx
	callq math__bigint__bigint_mul__3__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	leaq -1096(%rbp), %rcx
	movq %r13, %rdx
	callq math__bigint__bigint_from_uint__2__BigIntE1_ptr1__uintE1__ret_voidE1
	leaq -1616(%rbp), %rdx
	leaq -1096(%rbp), %r8
	movq %rdi, %rcx
	callq math__bigint__bigint_add__3__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	jmp .LB8472
.LB8509:
	incl %r15d
	movslq %r15d, %rax
	movzbl (%r12,%rax,1), %eax
	cmpb $45, %al
	je .LB8520
.LB8521:
	cmpb $43, %al
	je .LB8530
.LB8531:
	xorl %eax, %eax
.LB8522:
	xorl %ecx, %ecx
.LB8535:
	movslq %r15d, %rdx
	movzbl (%r12,%rdx,1), %edx
	testb %dl, %dl
	je .LB8537
.LB8536:
	cmpb $48, %dl
	jb .LB8537
.LB8550:
	cmpb $57, %dl
	ja .LB8537
.LB8556:
	imull $10, %ecx, %ecx
	subl $48, %edx
	movzbl %dl, %edx
	addl %edx, %ecx
	incl %r15d
	jmp .LB8535
.LB8530:
	incl %r15d
	xorl %eax, %eax
	jmp .LB8522
.LB8520:
	incl %r15d
	movl $1, %eax
	jmp .LB8522
.LB8537:
	testb %al, %al
	jne .LB8567
.LB8568:
	movl 520(%rbx), %eax
	addl %ecx, %eax
	movl %eax, 520(%rbx)
	jmp .LB8511
.LB8567:
	movl 520(%rbx), %eax
	subl %ecx, %eax
	movl %eax, 520(%rbx)
	jmp .LB8511
.LB8589:
	andb $127, 524(%rbx)
	jmp .LB8591
.LB8427:
	incl %r15d
	movl $1, %edi
	jmp .LB8396
	.text
	.globl math__decimal__decimal_is_zero__1__DecimalE1_ptr1__ret_boolE1
	.def math__decimal__decimal_is_zero__1__DecimalE1_ptr1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
math__decimal__decimal_is_zero__1__DecimalE1_ptr1__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB8599:
	movq %rcx, %rax
	movq %rax, %rcx
	callq math__bigint__bigint_is_zero__1__BigIntE1_ptr1__ret_boolE1
	movzbl %al, %eax
	leave
	ret
	.text
	.globl math__decimal__decimal_cmp_abs__2__DecimalE1_ptr1__DecimalE1_ptr1__ret_dataE1_sbits32
	.def math__decimal__decimal_cmp_abs__2__DecimalE1_ptr1__DecimalE1_ptr1__ret_dataE1_sbits32;
	.scl 2;
	.type 32;
	.endef
math__decimal__decimal_cmp_abs__2__DecimalE1_ptr1__DecimalE1_ptr1__ret_dataE1_sbits32:
	pushq %rbp
	movq %rsp, %rbp
	subq $1120, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
.LB8604:
	movq %rcx, %rax
	movq %rdx, %rbx
	leaq .LZERO(%rip), %rsi
	leaq -552(%rbp), %rdi
	movl $525, %ecx
	rep movsb
	leaq .LZERO(%rip), %rsi
	leaq -1080(%rbp), %rdi
	movl $525, %ecx
	rep movsb
	leaq -552(%rbp), %rcx
	movq %rax, %rdx
	callq math__decimal__decimal_copy__2__DecimalE1_ptr1__DecimalE1_ptr1__ret_voidE1
	leaq -1080(%rbp), %rcx
	movq %rbx, %rdx
	callq math__decimal__decimal_copy__2__DecimalE1_ptr1__DecimalE1_ptr1__ret_voidE1
	leaq -552(%rbp), %rcx
	leaq -1080(%rbp), %rdx
	callq math__decimal__decimal_align__2__DecimalE1_ptr1__DecimalE1_ptr1__ret_voidE1
	leaq -552(%rbp), %rcx
	leaq -1080(%rbp), %rdx
	callq math__bigint__bigint_cmp_abs__2__BigIntE1_ptr1__BigIntE1_ptr1__ret_intE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
	.text
	.globl math__decimal__decimal_cmp__2__DecimalE1_ptr1__DecimalE1_ptr1__ret_dataE1_sbits32
	.def math__decimal__decimal_cmp__2__DecimalE1_ptr1__DecimalE1_ptr1__ret_dataE1_sbits32;
	.scl 2;
	.type 32;
	.endef
math__decimal__decimal_cmp__2__DecimalE1_ptr1__DecimalE1_ptr1__ret_dataE1_sbits32:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
.LB8616:
	movq %rcx, %rsi
	movq %rdx, %rdi
	movq %rsi, %rcx
	callq math__bigint__bigint_is_zero__1__BigIntE1_ptr1__ret_boolE1
	movl %eax, %ebx
	movq %rdi, %rcx
	callq math__bigint__bigint_is_zero__1__BigIntE1_ptr1__ret_boolE1
	testb %bl, %bl
	je .LB8633
.LB8628:
	testb %al, %al
	jne .LB8632
.LB8633:
	movzbl 524(%rsi), %eax
	shrq $7, %rax
	testb %al, %al
	je .LB8648
.LB8639:
	movzbl 524(%rdi), %eax
	shrq $7, %rax
	testb %al, %al
	je .LB8647
.LB8648:
	movzbl 524(%rsi), %eax
	shrq $7, %rax
	testb %al, %al
	jne .LB8664
.LB8656:
	movzbl 524(%rdi), %eax
	shrq $7, %rax
	testb %al, %al
	jne .LB8663
.LB8664:
	movq %rsi, %rcx
	movq %rdi, %rdx
	callq math__decimal__decimal_cmp_abs__2__DecimalE1_ptr1__DecimalE1_ptr1__ret_dataE1_sbits32
	movzbl 524(%rsi), %ecx
	shrq $7, %rcx
	testb %cl, %cl
	je .LB8677
.LB8678:
	xorl %ecx, %ecx
	negl %eax
	addl %ecx, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB8677:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB8663:
	movl $1, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB8647:
	movabsq $4294967295, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB8632:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
	.text
	.globl math__decimal__decimal_add__3__DecimalE1_ptr1__DecimalE1_ptr1__DecimalE1_ptr1__ret_voidE1
	.def math__decimal__decimal_add__3__DecimalE1_ptr1__DecimalE1_ptr1__DecimalE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
math__decimal__decimal_add__3__DecimalE1_ptr1__DecimalE1_ptr1__DecimalE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $1120, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
.LB8683:
	movq %rcx, %rbx
	movq %r8, %r12
	leaq .LZERO(%rip), %rsi
	leaq -560(%rbp), %rdi
	movl $525, %ecx
	rep movsb
	leaq .LZERO(%rip), %rsi
	leaq -1088(%rbp), %rdi
	movl $525, %ecx
	rep movsb
	leaq -560(%rbp), %rcx
	callq math__decimal__decimal_copy__2__DecimalE1_ptr1__DecimalE1_ptr1__ret_voidE1
	leaq -1088(%rbp), %rcx
	movq %r12, %rdx
	callq math__decimal__decimal_copy__2__DecimalE1_ptr1__DecimalE1_ptr1__ret_voidE1
	leaq -560(%rbp), %rcx
	leaq -1088(%rbp), %rdx
	callq math__decimal__decimal_align__2__DecimalE1_ptr1__DecimalE1_ptr1__ret_voidE1
	movq %rbx, %rsi
	movq %rsi, %rcx
	callq math__bigint__bigint_zero__1__BigIntE1_ptr1__ret_voidE1
	movl $0, 520(%rbx)
	andb $127, 524(%rbx)
	movl -40(%rbp), %eax
	movl %eax, 520(%rbx)
	movzbl -36(%rbp), %eax
	shrq $7, %rax
	movzbl -564(%rbp), %ecx
	shrq $7, %rcx
	cmpb %cl, %al
	je .LB8710
.LB8711:
	leaq -560(%rbp), %rdi
	leaq -1088(%rbp), %r12
	movq %rdi, %rcx
	movq %r12, %rdx
	callq math__bigint__bigint_cmp_abs__2__BigIntE1_ptr1__BigIntE1_ptr1__ret_intE1
	testl %eax, %eax
	je .LB8729
.LB8730:
	testl %eax, %eax
	jg .LB8738
.LB8739:
	movq %rsi, %rcx
	movq %r12, %rdx
	movq %rdi, %r8
	callq math__bigint__bigint_sub_abs__3__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	movzbl -564(%rbp), %eax
	shrq $7, %rax
	andl $1, %eax
	shll $7, %eax
	andb $127, 524(%rbx)
	orb %al, 524(%rbx)
.LB8712:
	movq %rbx, %rcx
	callq math__bigint__bigint_is_zero__1__BigIntE1_ptr1__ret_boolE1
	testb %al, %al
	jne .LB8763
.LB8765:
	movq %rbx, %rcx
	callq math__decimal__decimal_apply_precision__1__DecimalE1_ptr1__ret_voidE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB8738:
	movq %rsi, %rcx
	movq %rdi, %rdx
	movq %r12, %r8
	callq math__bigint__bigint_sub_abs__3__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	movzbl -36(%rbp), %eax
	shrq $7, %rax
	andl $1, %eax
	shll $7, %eax
	andb $127, 524(%rbx)
	orb %al, 524(%rbx)
	jmp .LB8712
.LB8729:
	movq %rsi, %rcx
	callq math__bigint__bigint_zero__1__BigIntE1_ptr1__ret_voidE1
	andb $127, 524(%rbx)
	jmp .LB8712
.LB8710:
	leaq -560(%rbp), %rdx
	leaq -1088(%rbp), %r8
	movq %rsi, %rcx
	callq math__bigint__bigint_add_abs__3__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	movzbl -36(%rbp), %eax
	shrq $7, %rax
	andl $1, %eax
	shll $7, %eax
	andb $127, 524(%rbx)
	orb %al, 524(%rbx)
	jmp .LB8712
.LB8763:
	andb $127, 524(%rbx)
	jmp .LB8765
	.text
	.globl math__decimal__decimal_sub__3__DecimalE1_ptr1__DecimalE1_ptr1__DecimalE1_ptr1__ret_voidE1
	.def math__decimal__decimal_sub__3__DecimalE1_ptr1__DecimalE1_ptr1__DecimalE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
math__decimal__decimal_sub__3__DecimalE1_ptr1__DecimalE1_ptr1__DecimalE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $608, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
.LB8770:
	movq %rcx, %rbx
	movq %rdx, %r12
	movq %r8, %r13
	leaq .LZERO(%rip), %rsi
	leaq -568(%rbp), %rdi
	movl $525, %ecx
	rep movsb
	leaq -568(%rbp), %rcx
	movq %r13, %rdx
	callq math__decimal__decimal_copy__2__DecimalE1_ptr1__DecimalE1_ptr1__ret_voidE1
	leaq -568(%rbp), %rcx
	callq math__bigint__bigint_is_zero__1__BigIntE1_ptr1__ret_boolE1
	testb %al, %al
	je .LB8779
.LB8781:
	leaq -568(%rbp), %r8
	movq %rbx, %rcx
	movq %r12, %rdx
	callq math__decimal__decimal_add__3__DecimalE1_ptr1__DecimalE1_ptr1__DecimalE1_ptr1__ret_voidE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB8779:
	movzbl 524(%r13), %eax
	shrq $7, %rax
	xorl $1, %eax
	andl $1, %eax
	shll $7, %eax
	andb $127, -44(%rbp)
	orb %al, -44(%rbp)
	jmp .LB8781
	.text
	.globl math__decimal__decimal_mul__3__DecimalE1_ptr1__DecimalE1_ptr1__DecimalE1_ptr1__ret_voidE1
	.def math__decimal__decimal_mul__3__DecimalE1_ptr1__DecimalE1_ptr1__DecimalE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
math__decimal__decimal_mul__3__DecimalE1_ptr1__DecimalE1_ptr1__DecimalE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
.LB8792:
	movq %rcx, %rsi
	movq %rdx, %rdi
	movq %r8, %rbx
	movq %rsi, %rcx
	callq math__bigint__bigint_zero__1__BigIntE1_ptr1__ret_voidE1
	movl $0, 520(%rsi)
	andb $127, 524(%rsi)
	movl 520(%rdi), %eax
	movl 520(%rbx), %ecx
	addl %ecx, %eax
	movl %eax, 520(%rsi)
	movq %rdi, %rdx
	movq %rbx, %r8
	movq %rsi, %rcx
	callq math__bigint__bigint_mul__3__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	movzbl 524(%rdi), %eax
	shrq $7, %rax
	movzbl 524(%rbx), %ecx
	shrq $7, %rcx
	cmpb %cl, %al
	je .LB8824
.LB8825:
	orb $128, 524(%rsi)
.LB8826:
	movq %rsi, %rcx
	callq math__bigint__bigint_is_zero__1__BigIntE1_ptr1__ret_boolE1
	testb %al, %al
	jne .LB8834
.LB8836:
	movq %rsi, %rcx
	callq math__decimal__decimal_apply_precision__1__DecimalE1_ptr1__ret_voidE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB8824:
	andb $127, 524(%rsi)
	jmp .LB8826
.LB8834:
	andb $127, 524(%rsi)
	jmp .LB8836
	.text
	.globl math__decimal__decimal_div__3__DecimalE1_ptr1__DecimalE1_ptr1__DecimalE1_ptr1__ret_voidE1
	.def math__decimal__decimal_div__3__DecimalE1_ptr1__DecimalE1_ptr1__DecimalE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
math__decimal__decimal_div__3__DecimalE1_ptr1__DecimalE1_ptr1__DecimalE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $3728, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
.LB8841:
	movq %rcx, %rbx
	movq %rdx, %r12
	movq %r8, %r13
	movq %rbx, %rcx
	callq math__bigint__bigint_zero__1__BigIntE1_ptr1__ret_voidE1
	movl $0, 520(%rbx)
	andb $127, 524(%rbx)
	movq %r13, %rcx
	callq math__bigint__bigint_is_zero__1__BigIntE1_ptr1__ret_boolE1
	testb %al, %al
	jne .LB8850
.LB8851:
	movq %r12, %rcx
	callq math__bigint__bigint_is_zero__1__BigIntE1_ptr1__ret_boolE1
	testb %al, %al
	jne .LB8856
.LB8857:
	leaq .LZERO(%rip), %rsi
	leaq -568(%rbp), %rdi
	movl $525, %ecx
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
	movq %r12, %rcx
	callq math__decimal__decimal_bigint_digit_count__1__BigIntE1_ptr1__ret_dataE1_sbits32
	movl %eax, %esi
	movq %r13, %rcx
	callq math__decimal__decimal_bigint_digit_count__1__BigIntE1_ptr1__ret_dataE1_sbits32
	movl DECIMAL_PRECISION(%rip), %ecx
	addl $4, %ecx
	subl %esi, %ecx
	addl %eax, %ecx
	movl $1152, %eax
	subl %esi, %eax
	cmpl %eax, %ecx
	cmovg %eax, %ecx
	xorl %eax, %eax
	testl %ecx, %ecx
	movl %ecx, %esi
	cmovs %eax, %esi
	leaq -568(%rbp), %rcx
	movq %r12, %rdx
	callq math__decimal__decimal_copy__2__DecimalE1_ptr1__DecimalE1_ptr1__ret_voidE1
	leaq -568(%rbp), %rdi
	movq %rdi, %rcx
	movq %rsi, %rdx
	callq math__decimal__decimal_coeff_scale_up__2__BigIntE1_ptr1__dataE1_sbits32__ret_voidE1
	movl 520(%r12), %eax
	movl 520(%r13), %ecx
	subl %ecx, %eax
	negl %esi
	addl %eax, %esi
	leaq -1088(%rbp), %rcx
	leaq -1608(%rbp), %rdx
	movq %rdi, %r8
	movq %r13, %r9
	callq math__bigint__bigint_divmod__4__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	leaq -2648(%rbp), %rcx
	movl $2, %edx
	callq math__bigint__bigint_from_uint__2__BigIntE1_ptr1__uintE1__ret_voidE1
	leaq -2128(%rbp), %rcx
	leaq -1608(%rbp), %rdx
	leaq -2648(%rbp), %r8
	callq math__bigint__bigint_mul__3__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	leaq -2128(%rbp), %rcx
	movq %r13, %rdx
	callq math__bigint__bigint_cmp_abs__2__BigIntE1_ptr1__BigIntE1_ptr1__ret_intE1
	testl %eax, %eax
	jns .LB8923
.LB8925:
	movq %rbx, %rcx
	leaq -1088(%rbp), %rdx
	callq math__bigint__bigint_copy__2__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	movl %esi, 520(%rbx)
	movzbl 524(%r12), %eax
	shrq $7, %rax
	movzbl 524(%r13), %ecx
	shrq $7, %rcx
	cmpb %cl, %al
	je .LB8940
.LB8941:
	orb $128, 524(%rbx)
.LB8942:
	movq %rbx, %rcx
	callq math__bigint__bigint_is_zero__1__BigIntE1_ptr1__ret_boolE1
	testb %al, %al
	jne .LB8950
.LB8952:
	movq %rbx, %rcx
	callq math__decimal__decimal_apply_precision__1__DecimalE1_ptr1__ret_voidE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB8923:
	leaq -3168(%rbp), %rcx
	callq math__bigint__bigint_one__1__BigIntE1_ptr1__ret_voidE1
	leaq -3688(%rbp), %rcx
	leaq -1088(%rbp), %rdx
	leaq -3168(%rbp), %r8
	callq math__bigint__bigint_add__3__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	leaq -1088(%rbp), %rcx
	leaq -3688(%rbp), %rdx
	callq math__bigint__bigint_copy__2__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	jmp .LB8925
.LB8940:
	andb $127, 524(%rbx)
	jmp .LB8942
.LB8950:
	andb $127, 524(%rbx)
	jmp .LB8952
.LB8856:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB8850:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
	.text
	.globl math__decimal__decimal_to_double__1__DecimalE1_ptr1__ret_doubleE1
	.def math__decimal__decimal_to_double__1__DecimalE1_ptr1__ret_doubleE1;
	.scl 2;
	.type 32;
	.endef
math__decimal__decimal_to_double__1__DecimalE1_ptr1__ret_doubleE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $2160, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
.LB8957:
	movq %rcx, %rbx
	movq %rbx, %rcx
	callq math__bigint__bigint_is_zero__1__BigIntE1_ptr1__ret_boolE1
	testb %al, %al
	jne .LB8962
.LB8963:
	leaq .LZERO(%rip), %rsi
	leaq -544(%rbp), %rdi
	movl $517, %ecx
	rep movsb
	leaq .LZERO(%rip), %rsi
	leaq -1064(%rbp), %rdi
	movl $517, %ecx
	rep movsb
	leaq .LZERO(%rip), %rsi
	leaq -1584(%rbp), %rdi
	movl $517, %ecx
	rep movsb
	leaq .LZERO(%rip), %rsi
	leaq -2104(%rbp), %rdi
	movl $517, %ecx
	rep movsb
	leaq -544(%rbp), %rcx
	movq %rbx, %rdx
	callq math__bigint__bigint_copy__2__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	andb $127, -28(%rbp)
	leaq -1064(%rbp), %rcx
	movl $1000000000, %edx
	callq math__bigint__bigint_from_uint__2__BigIntE1_ptr1__uintE1__ret_voidE1
	leaq -2104(%rbp), %rsi
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -2120(%rbp)
	xorl %edi, %edi
.LB8978:
	leaq -544(%rbp), %rcx
	callq math__bigint__bigint_is_zero__1__BigIntE1_ptr1__ret_boolE1
	testb %al, %al
	jne .LB8980
.LB8983:
	cmpl $4, %edi
	jge .LB8980
.LB8979:
	leaq -1584(%rbp), %rcx
	leaq -2104(%rbp), %rdx
	leaq -544(%rbp), %r8
	leaq -1064(%rbp), %r9
	callq math__bigint__bigint_divmod__4__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	movl (%rsi), %eax
	movslq %edi, %rcx
	movl %eax, -2120(%rbp,%rcx,4)
	incl %edi
	leaq -544(%rbp), %rcx
	leaq -1584(%rbp), %rdx
	callq math__bigint__bigint_copy__2__BigIntE1_ptr1__BigIntE1_ptr1__ret_voidE1
	jmp .LB8978
.LB8980:
	testl %edi, %edi
	je .LB8997
.LB8998:
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movabsq $1315859240, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
.LB9007:
	testl %edi, %edi
	jle .LB9009
.LB9008:
	decl %edi
	mulsd %xmm1, %xmm0
	movslq %edi, %rax
	movslq -2120(%rbp,%rax,4), %rax
	xorps %xmm2, %xmm2
	cvtsi2sdq %rax, %xmm2
	addsd %xmm2, %xmm0
	testl %edi, %edi
	jg .LB9008
.LB9009:
	movl 520(%rbx), %eax
	movl $308, %ecx
	cmpl $308, %eax
	cmovg %ecx, %eax
	movabsq $4294966988, %rcx
	cmpl $4294966988, %eax
	cmovl %ecx, %eax
	testl %eax, %eax
	jg .LB9044
.LB9045:
	testl %eax, %eax
	js .LB9103
.LB9104:
.LB9046:
	movzbl 524(%rbx), %eax
	shrq $7, %rax
	testb %al, %al
	jne .LB9164
.LB9165:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB9103:
	xorl %ecx, %ecx
	negl %eax
	addl %ecx, %eax
.LB9107:
	testl %eax, %eax
	jle .LB9109
.LB9108:
	cmpl $9, %eax
	jge .LB9114
.LB9115:
	cmpl $8, %eax
	jge .LB9120
.LB9121:
	cmpl $7, %eax
	jge .LB9125
.LB9126:
	cmpl $6, %eax
	jge .LB9130
.LB9131:
	cmpl $5, %eax
	jge .LB9135
.LB9136:
	cmpl $4, %eax
	jge .LB9140
.LB9141:
	cmpl $3, %eax
	jge .LB9145
.LB9146:
	cmpl $2, %eax
	jge .LB9150
.LB9151:
	movabsq $1092616192, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	movl $1, %ecx
.LB9116:
	divsd %xmm1, %xmm0
	subl %ecx, %eax
	testl %eax, %eax
	jg .LB9108
.LB9109:
	jmp .LB9046
.LB9150:
	movabsq $1120403456, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	movl $2, %ecx
	jmp .LB9116
.LB9145:
	movabsq $1148846080, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	movl $3, %ecx
	jmp .LB9116
.LB9140:
	movabsq $1176256512, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	movl $4, %ecx
	jmp .LB9116
.LB9135:
	movabsq $1203982336, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	movl $5, %ecx
	jmp .LB9116
.LB9130:
	movabsq $1232348160, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	movl $6, %ecx
	jmp .LB9116
.LB9125:
	movabsq $1259902592, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	movl $7, %ecx
	jmp .LB9116
.LB9120:
	movabsq $1287568416, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	movl $8, %ecx
	jmp .LB9116
.LB9114:
	movabsq $1315859240, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	movl $9, %ecx
	jmp .LB9116
.LB9044:
.LB9048:
	testl %eax, %eax
	jle .LB9050
.LB9049:
	cmpl $9, %eax
	jge .LB9055
.LB9056:
	cmpl $8, %eax
	jge .LB9061
.LB9062:
	cmpl $7, %eax
	jge .LB9066
.LB9067:
	cmpl $6, %eax
	jge .LB9071
.LB9072:
	cmpl $5, %eax
	jge .LB9076
.LB9077:
	cmpl $4, %eax
	jge .LB9081
.LB9082:
	cmpl $3, %eax
	jge .LB9086
.LB9087:
	cmpl $2, %eax
	jge .LB9091
.LB9092:
	movabsq $1092616192, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	movl $1, %ecx
.LB9057:
	mulsd %xmm1, %xmm0
	subl %ecx, %eax
	testl %eax, %eax
	jg .LB9049
.LB9050:
	jmp .LB9046
.LB9164:
	xorps %xmm1, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subsd %xmm15, %xmm0
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB9091:
	movabsq $1120403456, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	movl $2, %ecx
	jmp .LB9057
.LB9086:
	movabsq $1148846080, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	movl $3, %ecx
	jmp .LB9057
.LB9081:
	movabsq $1176256512, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	movl $4, %ecx
	jmp .LB9057
.LB9076:
	movabsq $1203982336, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	movl $5, %ecx
	jmp .LB9057
.LB9071:
	movabsq $1232348160, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	movl $6, %ecx
	jmp .LB9057
.LB9066:
	movabsq $1259902592, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	movl $7, %ecx
	jmp .LB9057
.LB9061:
	movabsq $1287568416, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	movl $8, %ecx
	jmp .LB9057
.LB9055:
	movabsq $1315859240, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	movl $9, %ecx
	jmp .LB9057
.LB8997:
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB8962:
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
	.text
	.globl mandelbrot_double__3__doubleE1__doubleE1__intE1__ret_intE1
	.def mandelbrot_double__3__doubleE1__doubleE1__intE1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
mandelbrot_double__3__doubleE1__doubleE1__intE1__ret_intE1:
	subq $16, %rsp
.LB9170:
	movsd %xmm0, (%rsp)
	movsd %xmm1, -8(%rsp)
	movabsq $1048576000, %r10
	movq %r10, %xmm2
	cvtss2sd %xmm2, %xmm2
	subsd %xmm2, %xmm0
	movaps %xmm0, %xmm2
	mulsd %xmm0, %xmm2
	mulsd %xmm1, %xmm1
	addsd %xmm1, %xmm2
	addsd %xmm2, %xmm0
	mulsd %xmm2, %xmm0
	movabsq $1048576000, %r10
	movq %r10, %xmm2
	cvtss2sd %xmm2, %xmm2
	mulsd %xmm2, %xmm1
	ucomisd %xmm0, %xmm1
	ja .LB9205
.LB9206:
	movabsq $1065353216, %r10
	movq %r10, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd (%rsp), %xmm1
	addsd %xmm1, %xmm0
	mulsd %xmm0, %xmm0
	movsd -8(%rsp), %xmm1
	mulsd %xmm1, %xmm1
	addsd %xmm1, %xmm0
	movabsq $1031798784, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm0, %xmm1
	ja .LB9221
.LB9222:
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	xorps %xmm1, %xmm1
	cvtss2sd %xmm1, %xmm1
	xorl %eax, %eax
.LB9227:
	cmpl %r8d, %eax
	jge .LB9229
.LB9228:
	movaps %xmm0, %xmm2
	mulsd %xmm0, %xmm2
	movaps %xmm1, %xmm3
	mulsd %xmm1, %xmm3
	movaps %xmm2, %xmm4
	addsd %xmm3, %xmm4
	movabsq $1082130432, %r10
	movq %r10, %xmm5
	cvtss2sd %xmm5, %xmm5
	ucomisd %xmm5, %xmm4
	ja .LB9244
.LB9245:
	subsd %xmm3, %xmm2
	movsd (%rsp), %xmm3
	addsd %xmm3, %xmm2
	movabsq $1073741824, %r10
	movq %r10, %xmm3
	cvtss2sd %xmm3, %xmm3
	mulsd %xmm3, %xmm0
	mulsd %xmm1, %xmm0
	movsd -8(%rsp), %xmm1
	addsd %xmm0, %xmm1
	incl %eax
	movaps %xmm2, %xmm0
	cmpl %r8d, %eax
	jl .LB9228
.LB9229:
	addq $16, %rsp
	ret
.LB9244:
	addq $16, %rsp
	ret
.LB9221:
	movl %r8d, %eax
	addq $16, %rsp
	ret
.LB9205:
	movl %r8d, %eax
	addq $16, %rsp
	ret
	.text
	.globl compute_reference_orbit_double__3__doubleE1__doubleE1__intE1__ret_voidE1
	.def compute_reference_orbit_double__3__doubleE1__doubleE1__intE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
compute_reference_orbit_double__3__doubleE1__doubleE1__intE1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB9264:
	movsd %xmm0, -24(%rbp)
	movaps %xmm1, %xmm0
	movsd %xmm0, -32(%rbp)
	movl %r8d, %esi
	movq g_ref_zr(%rip), %rax
	testq %rax, %rax
	jne .LB9272
.LB9274:
	movq g_ref_zi(%rip), %rax
	testq %rax, %rax
	jne .LB9281
.LB9283:
	movl %esi, %eax
	shll $3, %eax
	movl %eax, %edi
	movq %rdi, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, g_ref_zr(%rip)
	movq %rdi, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, g_ref_zi(%rip)
	movl $0, g_ref_len(%rip)
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	xorps %xmm1, %xmm1
	cvtss2sd %xmm1, %xmm1
	xorl %eax, %eax
.LB9304:
	cmpl %esi, %eax
	jge .LB9306
.LB9305:
	movq g_ref_zr(%rip), %rcx
	movslq %eax, %rdx
	movsd %xmm0, (%rcx,%rdx,8)
	movq g_ref_zi(%rip), %rcx
	movsd %xmm1, (%rcx,%rdx,8)
	movaps %xmm0, %xmm2
	mulsd %xmm0, %xmm2
	movaps %xmm1, %xmm3
	mulsd %xmm1, %xmm3
	movaps %xmm2, %xmm4
	addsd %xmm3, %xmm4
	movabsq $1082130432, %r10
	movq %r10, %xmm5
	cvtss2sd %xmm5, %xmm5
	ucomisd %xmm5, %xmm4
	ja .LB9329
.LB9330:
	subsd %xmm3, %xmm2
	movsd -24(%rbp), %xmm3
	addsd %xmm3, %xmm2
	movabsq $1073741824, %r10
	movq %r10, %xmm3
	cvtss2sd %xmm3, %xmm3
	mulsd %xmm3, %xmm0
	mulsd %xmm1, %xmm0
	movsd -32(%rbp), %xmm1
	addsd %xmm0, %xmm1
	incl %eax
	movaps %xmm2, %xmm0
	cmpl %esi, %eax
	jl .LB9305
	jmp .LB9306
.LB9272:
	movq %rax, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	jmp .LB9274
.LB9281:
	movq %rax, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	jmp .LB9283
.LB9306:
	movl %esi, g_ref_len(%rip)
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB9329:
	movl %eax, g_ref_len(%rip)
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
	.text
	.globl compute_reference_orbit__3__DecimalE1_ptr1__DecimalE1_ptr1__intE1__ret_voidE1
	.def compute_reference_orbit__3__DecimalE1_ptr1__DecimalE1_ptr1__intE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
compute_reference_orbit__3__DecimalE1_ptr1__DecimalE1_ptr1__intE1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $3776, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
.LB9349:
	movq %rcx, %rbx
	movq %rdx, %r12
	movl %r8d, %r13d
	movq g_ref_zr(%rip), %rax
	testq %rax, %rax
	jne .LB9357
.LB9359:
	movq g_ref_zi(%rip), %rax
	testq %rax, %rax
	jne .LB9366
.LB9368:
	movl %r13d, %eax
	shll $3, %eax
	movl %eax, %esi
	movq %rsi, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, g_ref_zr(%rip)
	movq %rsi, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, g_ref_zi(%rip)
	movl $0, g_ref_len(%rip)
	leaq .LZERO(%rip), %rsi
	leaq -568(%rbp), %rdi
	movl $525, %ecx
	rep movsb
	leaq .LZERO(%rip), %rsi
	leaq -1096(%rbp), %rdi
	movl $525, %ecx
	rep movsb
	leaq .LZERO(%rip), %rsi
	leaq -1624(%rbp), %rdi
	movl $525, %ecx
	rep movsb
	leaq .LZERO(%rip), %rsi
	leaq -2152(%rbp), %rdi
	movl $525, %ecx
	rep movsb
	leaq .LZERO(%rip), %rsi
	leaq -2680(%rbp), %rdi
	movl $525, %ecx
	rep movsb
	leaq .LZERO(%rip), %rsi
	leaq -3208(%rbp), %rdi
	movl $525, %ecx
	rep movsb
	leaq .LZERO(%rip), %rsi
	leaq -3736(%rbp), %rdi
	movl $525, %ecx
	rep movsb
	leaq -568(%rbp), %rcx
	callq math__bigint__bigint_zero__1__BigIntE1_ptr1__ret_voidE1
	movl $0, -48(%rbp)
	andb $127, -44(%rbp)
	leaq -1096(%rbp), %rcx
	callq math__bigint__bigint_zero__1__BigIntE1_ptr1__ret_voidE1
	movl $0, -576(%rbp)
	andb $127, -572(%rbp)
	movw $52, -3738(%rbp)
	leaq -3738(%rbp), %rdx
	leaq -3736(%rbp), %rcx
	callq math__decimal__decimal_from_string__2__DecimalE1_ptr1__byteE1_ptr1__ret_voidE1
	xorl %esi, %esi
.LB9393:
	cmpl %r13d, %esi
	jge .LB9395
.LB9394:
	leaq -568(%rbp), %rcx
	callq math__decimal__decimal_to_double__1__DecimalE1_ptr1__ret_doubleE1
	movq g_ref_zr(%rip), %rax
	movslq %esi, %rdi
	movsd %xmm0, (%rax,%rdi,8)
	leaq -1096(%rbp), %rcx
	callq math__decimal__decimal_to_double__1__DecimalE1_ptr1__ret_doubleE1
	movq g_ref_zi(%rip), %rax
	movsd %xmm0, (%rax,%rdi,8)
	leaq -1624(%rbp), %rcx
	leaq -568(%rbp), %rdx
	leaq -568(%rbp), %r8
	callq math__decimal__decimal_mul__3__DecimalE1_ptr1__DecimalE1_ptr1__DecimalE1_ptr1__ret_voidE1
	leaq -2152(%rbp), %rcx
	leaq -1096(%rbp), %rdx
	leaq -1096(%rbp), %r8
	callq math__decimal__decimal_mul__3__DecimalE1_ptr1__DecimalE1_ptr1__DecimalE1_ptr1__ret_voidE1
	leaq -3208(%rbp), %rcx
	leaq -1624(%rbp), %rdx
	leaq -2152(%rbp), %r8
	callq math__decimal__decimal_add__3__DecimalE1_ptr1__DecimalE1_ptr1__DecimalE1_ptr1__ret_voidE1
	leaq -3208(%rbp), %rcx
	leaq -3736(%rbp), %rdx
	callq math__decimal__decimal_cmp__2__DecimalE1_ptr1__DecimalE1_ptr1__ret_dataE1_sbits32
	testl %eax, %eax
	jg .LB9409
.LB9410:
	leaq -3208(%rbp), %rcx
	leaq -1624(%rbp), %rdx
	leaq -2152(%rbp), %r8
	callq math__decimal__decimal_sub__3__DecimalE1_ptr1__DecimalE1_ptr1__DecimalE1_ptr1__ret_voidE1
	leaq -2680(%rbp), %rcx
	leaq -3208(%rbp), %rdx
	movq %rbx, %r8
	callq math__decimal__decimal_add__3__DecimalE1_ptr1__DecimalE1_ptr1__DecimalE1_ptr1__ret_voidE1
	leaq -3208(%rbp), %rcx
	leaq -568(%rbp), %rdx
	leaq -1096(%rbp), %r8
	callq math__decimal__decimal_mul__3__DecimalE1_ptr1__DecimalE1_ptr1__DecimalE1_ptr1__ret_voidE1
	leaq -1096(%rbp), %rcx
	leaq -3208(%rbp), %rdx
	leaq -3208(%rbp), %r8
	callq math__decimal__decimal_add__3__DecimalE1_ptr1__DecimalE1_ptr1__DecimalE1_ptr1__ret_voidE1
	leaq -1096(%rbp), %rcx
	leaq -1096(%rbp), %rdx
	movq %r12, %r8
	callq math__decimal__decimal_add__3__DecimalE1_ptr1__DecimalE1_ptr1__DecimalE1_ptr1__ret_voidE1
	leaq -568(%rbp), %rcx
	leaq -2680(%rbp), %rdx
	callq math__decimal__decimal_copy__2__DecimalE1_ptr1__DecimalE1_ptr1__ret_voidE1
	incl %esi
	cmpl %r13d, %esi
	jl .LB9394
	jmp .LB9395
.LB9357:
	movq %rax, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	jmp .LB9359
.LB9366:
	movq %rax, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	jmp .LB9368
.LB9395:
	movl %r13d, g_ref_len(%rip)
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB9409:
	movl %esi, g_ref_len(%rip)
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
	.text
	.globl mandelbrot_perturb__5__doubleE1__doubleE1__doubleE1__doubleE1__intE1__ret_intE1
	.def mandelbrot_perturb__5__doubleE1__doubleE1__doubleE1__doubleE1__intE1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
mandelbrot_perturb__5__doubleE1__doubleE1__doubleE1__doubleE1__intE1__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $144, %rsp
	movq %rsi, -8(%rbp)
.LB9420:
	movsd %xmm0, -32(%rbp)
	movaps %xmm1, %xmm0
	movsd %xmm0, -40(%rbp)
	movaps %xmm2, %xmm0
	movsd %xmm0, -64(%rbp)
	movaps %xmm3, %xmm0
	movsd %xmm0, -72(%rbp)
	movl 48(%rbp), %r8d
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	xorps %xmm1, %xmm1
	cvtss2sd %xmm1, %xmm1
	movl g_ref_len(%rip), %eax
	movabsq $0, %r10
	movq %r10, -16(%rbp)
	movabsq $0, %r10
	movq %r10, -24(%rbp)
	xorl %ecx, %ecx
.LB9439:
	cmpl %eax, %ecx
	jge .LB9441
.LB9440:
	movq g_ref_zr(%rip), %rdx
	movslq %ecx, %rsi
	movsd (%rdx,%rsi,8), %xmm2
	movsd %xmm2, -104(%rbp)
	movq g_ref_zi(%rip), %rdx
	movsd (%rdx,%rsi,8), %xmm2
	testl %ecx, %ecx
	jg .LB9455
.LB9456:
	movq -16(%rbp), %r10
	movq %r10, -48(%rbp)
	movq -24(%rbp), %r10
	movq %r10, -56(%rbp)
.LB9457:
	movsd -104(%rbp), %xmm3
	addsd %xmm0, %xmm3
	movaps %xmm2, %xmm4
	addsd %xmm1, %xmm4
	mulsd %xmm3, %xmm3
	mulsd %xmm4, %xmm4
	addsd %xmm4, %xmm3
	movabsq $1082130432, %r10
	movq %r10, %xmm4
	cvtss2sd %xmm4, %xmm4
	ucomisd %xmm4, %xmm3
	ja .LB9501
.LB9502:
	movabsq $1073741824, %r10
	movq %r10, %xmm3
	cvtss2sd %xmm3, %xmm3
	movsd -104(%rbp), %xmm4
	mulsd %xmm4, %xmm3
	addsd %xmm0, %xmm3
	movabsq $1073741824, %r10
	movq %r10, %xmm4
	cvtss2sd %xmm4, %xmm4
	mulsd %xmm4, %xmm2
	addsd %xmm1, %xmm2
	movaps %xmm3, %xmm4
	mulsd %xmm0, %xmm4
	movaps %xmm2, %xmm5
	mulsd %xmm1, %xmm5
	subsd %xmm5, %xmm4
	movsd -64(%rbp), %xmm5
	addsd %xmm5, %xmm4
	mulsd %xmm3, %xmm1
	mulsd %xmm2, %xmm0
	addsd %xmm1, %xmm0
	movsd -72(%rbp), %xmm1
	addsd %xmm0, %xmm1
	incl %ecx
	movaps %xmm4, %xmm0
	movq -48(%rbp), %r10
	movq %r10, -16(%rbp)
	movq -56(%rbp), %r10
	movq %r10, -24(%rbp)
	cmpl %eax, %ecx
	jl .LB9440
.LB9441:
	movsd -32(%rbp), %xmm0
	movsd -64(%rbp), %xmm1
	addsd %xmm1, %xmm0
	movsd -40(%rbp), %xmm1
	movsd -72(%rbp), %xmm2
	addsd %xmm2, %xmm1
	callq mandelbrot_double__3__doubleE1__doubleE1__intE1__ret_intE1
	movq -8(%rbp), %rsi
	leave
	ret
.LB9455:
	movsd -104(%rbp), %xmm3
	mulsd %xmm3, %xmm3
	movaps %xmm2, %xmm4
	mulsd %xmm2, %xmm4
	addsd %xmm4, %xmm3
	movsd %xmm3, -96(%rbp)
	movaps %xmm0, %xmm4
	mulsd %xmm0, %xmm4
	movsd %xmm4, -88(%rbp)
	movaps %xmm1, %xmm5
	mulsd %xmm1, %xmm5
	movsd %xmm5, -80(%rbp)
	addsd %xmm5, %xmm4
	ucomisd %xmm3, %xmm4
	jae .LB9475
.LB9476:
	movq -96(%rbp), %r10
	movq %r10, -48(%rbp)
	movsd %xmm4, -56(%rbp)
	jmp .LB9457
.LB9501:
	movl %ecx, %eax
	movq -8(%rbp), %rsi
	leave
	ret
.LB9475:
	movsd -32(%rbp), %xmm0
	movsd -64(%rbp), %xmm1
	addsd %xmm1, %xmm0
	movsd -40(%rbp), %xmm1
	movsd -72(%rbp), %xmm2
	addsd %xmm2, %xmm1
	callq mandelbrot_double__3__doubleE1__doubleE1__intE1__ret_intE1
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl iter_to_color__6__intE1__intE1__doubleE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__ret_voidE1
	.def iter_to_color__6__intE1__intE1__doubleE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
iter_to_color__6__intE1__intE1__doubleE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__ret_voidE1:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
.LB9545:
	movaps %xmm2, %xmm0
	movq 56(%rsp), %rax
	movq 64(%rsp), %rsi
	cmpl %edx, %ecx
	je .LB9557
.LB9558:
	movl %ecx, %edx
	sarl $31, %edx
	shrl $24, %edx
	addl %ecx, %edx
	andl $-256, %edx
	subl %edx, %ecx
	movslq %ecx, %rcx
	xorps %xmm1, %xmm1
	cvtsi2sdq %rcx, %xmm1
	movabsq $1132396544, %r10
	movq %r10, %xmm2
	cvtss2sd %xmm2, %xmm2
	divsd %xmm2, %xmm1
	addsd %xmm1, %xmm0
	cvttsd2siq %xmm0, %rcx
	movl %ecx, %ecx
	movslq %ecx, %rcx
	xorps %xmm1, %xmm1
	cvtsi2sdq %rcx, %xmm1
	subsd %xmm1, %xmm0
	movabsq $1045220557, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm0, %xmm1
	ja .LB9581
.LB9582:
	movabsq $1055286886, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm0, %xmm1
	ja .LB9600
.LB9601:
	movabsq $1059481190, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm0, %xmm1
	ja .LB9626
.LB9627:
	movabsq $1062836634, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm0, %xmm1
	ja .LB9646
.LB9647:
	movabsq $1062836634, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	subsd %xmm1, %xmm0
	movabsq $1041865114, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	divsd %xmm1, %xmm0
	movabsq $1063675494, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	mulsd %xmm0, %xmm1
	movabsq $1063675494, %r10
	movq %r10, %xmm2
	cvtss2sd %xmm2, %xmm2
	movaps %xmm1, %xmm15
	movaps %xmm2, %xmm1
	subsd %xmm15, %xmm1
	movsd %xmm1, (%r9)
	movabsq $1053609165, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	mulsd %xmm1, %xmm0
	movabsq $1053609165, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subsd %xmm15, %xmm0
	movsd %xmm0, (%rax)
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, (%rsi)
	movq 0(%rsp), %rsi
	addq $16, %rsp
	ret
.LB9646:
	movabsq $1059481190, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	subsd %xmm1, %xmm0
	movabsq $1045220557, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	divsd %xmm1, %xmm0
	movabsq $1062836634, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	mulsd %xmm0, %xmm1
	movabsq $1028443341, %r10
	movq %r10, %xmm2
	cvtss2sd %xmm2, %xmm2
	addsd %xmm2, %xmm1
	movsd %xmm1, (%r9)
	movabsq $1056964608, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	mulsd %xmm0, %xmm1
	movabsq $1063675494, %r10
	movq %r10, %xmm2
	cvtss2sd %xmm2, %xmm2
	movaps %xmm1, %xmm15
	movaps %xmm2, %xmm1
	subsd %xmm15, %xmm1
	movsd %xmm1, (%rax)
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	mulsd %xmm1, %xmm0
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subsd %xmm15, %xmm0
	movsd %xmm0, (%rsi)
	movq 0(%rsp), %rsi
	addq $16, %rsp
	ret
.LB9626:
	movabsq $1055286886, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	subsd %xmm1, %xmm0
	movabsq $1045220557, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	divsd %xmm1, %xmm0
	movabsq $1028443341, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	mulsd %xmm0, %xmm1
	movsd %xmm1, (%r9)
	movabsq $1063675494, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	mulsd %xmm1, %xmm0
	movsd %xmm0, (%rax)
	movabsq $1065353216, %r10
	movq %r10, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, (%rsi)
	movq 0(%rsp), %rsi
	addq $16, %rsp
	ret
.LB9600:
	movabsq $1045220557, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	subsd %xmm1, %xmm0
	movabsq $1048576000, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	divsd %xmm1, %xmm0
	movabsq $1055286886, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	mulsd %xmm0, %xmm1
	movabsq $1055286886, %r10
	movq %r10, %xmm2
	cvtss2sd %xmm2, %xmm2
	movaps %xmm1, %xmm15
	movaps %xmm2, %xmm1
	subsd %xmm15, %xmm1
	movsd %xmm1, (%r9)
	movabsq $1028443341, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	mulsd %xmm0, %xmm1
	movsd %xmm1, (%rax)
	movabsq $1053609165, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	mulsd %xmm1, %xmm0
	movabsq $1058642330, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	addsd %xmm1, %xmm0
	movsd %xmm0, (%rsi)
	movq 0(%rsp), %rsi
	addq $16, %rsp
	ret
.LB9581:
	movabsq $1045220557, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	divsd %xmm1, %xmm0
	movabsq $1055286886, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	mulsd %xmm0, %xmm1
	movsd %xmm1, (%r9)
	xorps %xmm1, %xmm1
	cvtss2sd %xmm1, %xmm1
	movsd %xmm1, (%rax)
	movabsq $1058642330, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	mulsd %xmm1, %xmm0
	movsd %xmm0, (%rsi)
	movq 0(%rsp), %rsi
	addq $16, %rsp
	ret
.LB9557:
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, (%r9)
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, (%rax)
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	movsd %xmm0, (%rsi)
	movq 0(%rsp), %rsi
	addq $16, %rsp
	ret
	.text
	.globl worker__1__voidE1_ptr1__ret_voidE1_ptr1
	.def worker__1__voidE1_ptr1__ret_voidE1_ptr1;
	.scl 2;
	.type 32;
	.endef
worker__1__voidE1_ptr1__ret_voidE1_ptr1:
	pushq %rbp
	movq %rsp, %rbp
	subq $160, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
.LB9690:
	movq %rcx, %rax
	movq %rax, %rbx
	xorps %xmm0, %xmm0
	movsd %xmm0, -48(%rbp)
	xorps %xmm0, %xmm0
	movsd %xmm0, -56(%rbp)
	xorps %xmm0, %xmm0
	movsd %xmm0, -64(%rbp)
	movzbl __singinit_guard__worker__1__voidE1_ptr1__ret_voidE1_ptr1__fx(%rip), %eax
	testb %al, %al
	jne .LB9705
.LB9704:
	leaq .LZERO(%rip), %rsi
	leaq __singinit__worker__1__voidE1_ptr1__ret_voidE1_ptr1__fx(%rip), %rdi
	movl $525, %ecx
	rep movsb
	movb $1, __singinit_guard__worker__1__voidE1_ptr1__ret_voidE1_ptr1__fx(%rip)
.LB9705:
	movzbl __singinit_guard__worker__1__voidE1_ptr1__ret_voidE1_ptr1__fy(%rip), %eax
	testb %al, %al
	jne .LB9708
.LB9707:
	leaq .LZERO(%rip), %rsi
	leaq __singinit__worker__1__voidE1_ptr1__ret_voidE1_ptr1__fy(%rip), %rdi
	movl $525, %ecx
	rep movsb
	movb $1, __singinit_guard__worker__1__voidE1_ptr1__ret_voidE1_ptr1__fy(%rip)
.LB9708:
	movzbl __singinit_guard__worker__1__voidE1_ptr1__ret_voidE1_ptr1__col_d(%rip), %eax
	testb %al, %al
	jne .LB9711
.LB9710:
	leaq .LZERO(%rip), %rsi
	leaq __singinit__worker__1__voidE1_ptr1__ret_voidE1_ptr1__col_d(%rip), %rdi
	movl $525, %ecx
	rep movsb
	movb $1, __singinit_guard__worker__1__voidE1_ptr1__ret_voidE1_ptr1__col_d(%rip)
.LB9711:
	movzbl __singinit_guard__worker__1__voidE1_ptr1__ret_voidE1_ptr1__row_d(%rip), %eax
	testb %al, %al
	jne .LB9714
.LB9713:
	leaq .LZERO(%rip), %rsi
	leaq __singinit__worker__1__voidE1_ptr1__ret_voidE1_ptr1__row_d(%rip), %rdi
	movl $525, %ecx
	rep movsb
	movb $1, __singinit_guard__worker__1__voidE1_ptr1__ret_voidE1_ptr1__row_d(%rip)
.LB9714:
	movzbl __singinit_guard__worker__1__voidE1_ptr1__ret_voidE1_ptr1__cols_d(%rip), %eax
	testb %al, %al
	jne .LB9717
.LB9716:
	leaq .LZERO(%rip), %rsi
	leaq __singinit__worker__1__voidE1_ptr1__ret_voidE1_ptr1__cols_d(%rip), %rdi
	movl $525, %ecx
	rep movsb
	movb $1, __singinit_guard__worker__1__voidE1_ptr1__ret_voidE1_ptr1__cols_d(%rip)
.LB9717:
	movzbl __singinit_guard__worker__1__voidE1_ptr1__ret_voidE1_ptr1__rows_d(%rip), %eax
	testb %al, %al
	jne .LB9720
.LB9719:
	leaq .LZERO(%rip), %rsi
	leaq __singinit__worker__1__voidE1_ptr1__ret_voidE1_ptr1__rows_d(%rip), %rdi
	movl $525, %ecx
	rep movsb
	movb $1, __singinit_guard__worker__1__voidE1_ptr1__ret_voidE1_ptr1__rows_d(%rip)
.LB9720:
	movzbl __singinit_guard__worker__1__voidE1_ptr1__ret_voidE1_ptr1__half(%rip), %eax
	testb %al, %al
	jne .LB9723
.LB9722:
	leaq .LZERO(%rip), %rsi
	leaq __singinit__worker__1__voidE1_ptr1__ret_voidE1_ptr1__half(%rip), %rdi
	movl $525, %ecx
	rep movsb
	movb $1, __singinit_guard__worker__1__voidE1_ptr1__ret_voidE1_ptr1__half(%rip)
.LB9723:
	movzbl __singinit_guard__worker__1__voidE1_ptr1__ret_voidE1_ptr1__tmp(%rip), %eax
	testb %al, %al
	jne .LB9726
.LB9725:
	leaq .LZERO(%rip), %rsi
	leaq __singinit__worker__1__voidE1_ptr1__ret_voidE1_ptr1__tmp(%rip), %rdi
	movl $525, %ecx
	rep movsb
	movb $1, __singinit_guard__worker__1__voidE1_ptr1__ret_voidE1_ptr1__tmp(%rip)
.LB9726:
	movzbl __singinit_guard__worker__1__voidE1_ptr1__ret_voidE1_ptr1__tmp2(%rip), %eax
	testb %al, %al
	jne .LB9729
.LB9728:
	leaq .LZERO(%rip), %rsi
	leaq __singinit__worker__1__voidE1_ptr1__ret_voidE1_ptr1__tmp2(%rip), %rdi
	movl $525, %ecx
	rep movsb
	movb $1, __singinit_guard__worker__1__voidE1_ptr1__ret_voidE1_ptr1__tmp2(%rip)
.LB9729:
	movl $3485232, -68(%rbp)
	leaq -68(%rbp), %rdx
	leaq __singinit__worker__1__voidE1_ptr1__ret_voidE1_ptr1__half(%rip), %rcx
	callq math__decimal__decimal_from_string__2__DecimalE1_ptr1__byteE1_ptr1__ret_voidE1
	movslq 8(%rbx), %rdx
	leaq __singinit__worker__1__voidE1_ptr1__ret_voidE1_ptr1__cols_d(%rip), %rcx
	callq math__decimal__decimal_from_i64__2__DecimalE1_ptr1__dataE1_sbits64__ret_voidE1
	movslq 12(%rbx), %rdx
	leaq __singinit__worker__1__voidE1_ptr1__ret_voidE1_ptr1__rows_d(%rip), %rcx
	callq math__decimal__decimal_from_i64__2__DecimalE1_ptr1__dataE1_sbits64__ret_voidE1
	movl (%rbx), %eax
	movq %rax, %rsi
	xorl %eax, %eax
	xorl %ecx, %ecx
	xorps %xmm0, %xmm0
	xorps %xmm1, %xmm1
.LB9751:
	movl 4(%rbx), %edx
	cmpl %edx, %esi
	jge .LB9753
.LB9752:
	xorl %edi, %edi
.LB9760:
	movl 8(%rbx), %edx
	cmpl %edx, %edi
	jge .LB9762
.LB9761:
	movl %esi, %eax
	imull %edx, %eax
	leal (%rax,%rdi), %r12d
	cmpl $0, 24(%rbx)
	je .LB9782
.LB9783:
	movq g_iters(%rip), %rax
	movslq %r12d, %rcx
	movl (%rax,%rcx,4), %eax
	movq %rax, %r13
	movsd %xmm0, -80(%rbp)
	movsd %xmm1, -88(%rbp)
.LB9784:
	movl 16(%rbx), %edx
	movsd 2200(%rbx), %xmm0
	leaq -48(%rbp), %r9
	leaq -56(%rbp), %rax
	leaq -64(%rbp), %rcx
	movq %rax, 32(%rsp)
	movq %rcx, 40(%rsp)
	movq %r13, %rcx
	movaps %xmm0, %xmm2
	callq iter_to_color__6__intE1__intE1__doubleE1__doubleE1_ptr1__doubleE1_ptr1__doubleE1_ptr1__ret_voidE1
	leal (%r12,%r12,2), %ecx
	movsd -48(%rbp), %xmm0
	cvtsd2ss %xmm0, %xmm0
	movq g_pixels(%rip), %rax
	movslq %ecx, %rdx
	movss %xmm0, (%rax,%rdx,4)
	movsd -56(%rbp), %xmm0
	cvtsd2ss %xmm0, %xmm0
	movq g_pixels(%rip), %rax
	leal 1(%rcx), %edx
	movslq %edx, %rdx
	movss %xmm0, (%rax,%rdx,4)
	movsd -64(%rbp), %xmm0
	cvtsd2ss %xmm0, %xmm0
	movq g_pixels(%rip), %rax
	leal 2(%rcx), %edx
	movslq %edx, %rdx
	movss %xmm0, (%rax,%rdx,4)
	incl %edi
	movq %r13, %rax
	movsd -80(%rbp), %xmm0
	movsd -88(%rbp), %xmm1
	jmp .LB9760
.LB9753:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB9762:
	incl %esi
	jmp .LB9751
.LB9782:
	cmpl $0, 32(%rbx)
	je .LB9790
.LB9791:
	movl %edi, %edx
	leaq __singinit__worker__1__voidE1_ptr1__ret_voidE1_ptr1__col_d(%rip), %rcx
	callq math__decimal__decimal_from_i64__2__DecimalE1_ptr1__dataE1_sbits64__ret_voidE1
	leaq __singinit__worker__1__voidE1_ptr1__ret_voidE1_ptr1__tmp(%rip), %rcx
	leaq __singinit__worker__1__voidE1_ptr1__ret_voidE1_ptr1__col_d(%rip), %rdx
	leaq __singinit__worker__1__voidE1_ptr1__ret_voidE1_ptr1__half(%rip), %r8
	callq math__decimal__decimal_add__3__DecimalE1_ptr1__DecimalE1_ptr1__DecimalE1_ptr1__ret_voidE1
	leaq 1092(%rbx), %rdx
	leaq __singinit__worker__1__voidE1_ptr1__ret_voidE1_ptr1__tmp2(%rip), %rcx
	leaq __singinit__worker__1__voidE1_ptr1__ret_voidE1_ptr1__tmp(%rip), %r8
	callq math__decimal__decimal_mul__3__DecimalE1_ptr1__DecimalE1_ptr1__DecimalE1_ptr1__ret_voidE1
	leaq __singinit__worker__1__voidE1_ptr1__ret_voidE1_ptr1__tmp(%rip), %rcx
	leaq __singinit__worker__1__voidE1_ptr1__ret_voidE1_ptr1__tmp2(%rip), %rdx
	leaq __singinit__worker__1__voidE1_ptr1__ret_voidE1_ptr1__cols_d(%rip), %r8
	callq math__decimal__decimal_div__3__DecimalE1_ptr1__DecimalE1_ptr1__DecimalE1_ptr1__ret_voidE1
	leaq 36(%rbx), %rdx
	leaq __singinit__worker__1__voidE1_ptr1__ret_voidE1_ptr1__fx(%rip), %rcx
	leaq __singinit__worker__1__voidE1_ptr1__ret_voidE1_ptr1__tmp(%rip), %r8
	callq math__decimal__decimal_add__3__DecimalE1_ptr1__DecimalE1_ptr1__DecimalE1_ptr1__ret_voidE1
	leaq __singinit__worker__1__voidE1_ptr1__ret_voidE1_ptr1__row_d(%rip), %rcx
	movq %rsi, %rdx
	callq math__decimal__decimal_from_i64__2__DecimalE1_ptr1__dataE1_sbits64__ret_voidE1
	leaq __singinit__worker__1__voidE1_ptr1__ret_voidE1_ptr1__tmp(%rip), %rcx
	leaq __singinit__worker__1__voidE1_ptr1__ret_voidE1_ptr1__row_d(%rip), %rdx
	leaq __singinit__worker__1__voidE1_ptr1__ret_voidE1_ptr1__half(%rip), %r8
	callq math__decimal__decimal_add__3__DecimalE1_ptr1__DecimalE1_ptr1__DecimalE1_ptr1__ret_voidE1
	leaq 1620(%rbx), %rdx
	leaq __singinit__worker__1__voidE1_ptr1__ret_voidE1_ptr1__tmp2(%rip), %rcx
	leaq __singinit__worker__1__voidE1_ptr1__ret_voidE1_ptr1__tmp(%rip), %r8
	callq math__decimal__decimal_mul__3__DecimalE1_ptr1__DecimalE1_ptr1__DecimalE1_ptr1__ret_voidE1
	leaq __singinit__worker__1__voidE1_ptr1__ret_voidE1_ptr1__tmp(%rip), %rcx
	leaq __singinit__worker__1__voidE1_ptr1__ret_voidE1_ptr1__tmp2(%rip), %rdx
	leaq __singinit__worker__1__voidE1_ptr1__ret_voidE1_ptr1__rows_d(%rip), %r8
	callq math__decimal__decimal_div__3__DecimalE1_ptr1__DecimalE1_ptr1__DecimalE1_ptr1__ret_voidE1
	leaq 564(%rbx), %rdx
	leaq __singinit__worker__1__voidE1_ptr1__ret_voidE1_ptr1__fy(%rip), %rcx
	leaq __singinit__worker__1__voidE1_ptr1__ret_voidE1_ptr1__tmp(%rip), %r8
	callq math__decimal__decimal_add__3__DecimalE1_ptr1__DecimalE1_ptr1__DecimalE1_ptr1__ret_voidE1
	leaq __singinit__worker__1__voidE1_ptr1__ret_voidE1_ptr1__fx(%rip), %rcx
	callq math__decimal__decimal_to_double__1__DecimalE1_ptr1__ret_doubleE1
	movsd %xmm0, -96(%rbp)
	leaq __singinit__worker__1__voidE1_ptr1__ret_voidE1_ptr1__fy(%rip), %rcx
	callq math__decimal__decimal_to_double__1__DecimalE1_ptr1__ret_doubleE1
	movq -96(%rbp), %r10
	movq %r10, -104(%rbp)
	movsd %xmm0, -112(%rbp)
.LB9792:
	cmpl $1, 28(%rbx)
	je .LB9852
.LB9853:
	movl 16(%rbx), %r8d
	movsd -104(%rbp), %xmm0
	movsd -112(%rbp), %xmm1
	callq mandelbrot_double__3__doubleE1__doubleE1__intE1__ret_intE1
.LB9854:
	movq g_iters(%rip), %rcx
	movslq %r12d, %rdx
	movl %eax, (%rcx,%rdx,4)
	movq %rax, %r13
	movq -104(%rbp), %r10
	movq %r10, -80(%rbp)
	movq -112(%rbp), %r10
	movq %r10, -88(%rbp)
	jmp .LB9784
.LB9790:
	movsd 2168(%rbx), %xmm0
	movsd 2184(%rbx), %xmm1
	movslq %edi, %rax
	xorps %xmm2, %xmm2
	cvtsi2sdq %rax, %xmm2
	movabsq $1056964608, %r10
	movq %r10, %xmm3
	cvtss2sd %xmm3, %xmm3
	addsd %xmm3, %xmm2
	mulsd %xmm2, %xmm1
	movslq %edx, %rax
	xorps %xmm2, %xmm2
	cvtsi2sdq %rax, %xmm2
	divsd %xmm2, %xmm1
	addsd %xmm1, %xmm0
	movsd 2176(%rbx), %xmm1
	movsd 2192(%rbx), %xmm2
	movslq %esi, %rax
	xorps %xmm3, %xmm3
	cvtsi2sdq %rax, %xmm3
	movabsq $1056964608, %r10
	movq %r10, %xmm4
	cvtss2sd %xmm4, %xmm4
	addsd %xmm4, %xmm3
	mulsd %xmm3, %xmm2
	movslq 12(%rbx), %rax
	xorps %xmm3, %xmm3
	cvtsi2sdq %rax, %xmm3
	divsd %xmm3, %xmm2
	addsd %xmm2, %xmm1
	movsd %xmm0, -104(%rbp)
	movsd %xmm1, -112(%rbp)
	cmpl $1, 28(%rbx)
	jne .LB9853
.LB9852:
	movsd 2152(%rbx), %xmm0
	movsd 2160(%rbx), %xmm1
	movsd -104(%rbp), %xmm2
	subsd %xmm0, %xmm2
	movsd -112(%rbp), %xmm3
	subsd %xmm1, %xmm3
	movl 16(%rbx), %eax
	movq %rax, 32(%rsp)
	callq mandelbrot_perturb__5__doubleE1__doubleE1__doubleE1__doubleE1__intE1__ret_intE1
	jmp .LB9854
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
Decimal.TLD:
	.long 4193
	.long 3
	.long 0
	.long 4129
	.long 32
	.long 4160
	.long 32
	.long 32
	.long 4192
	.long 1
	.long 1
	.section .rdata,"dr"
	.p2align 4
WorkSlice.TLD:
	.long 17664
	.long 20
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
	.long 32
	.long 32
	.long 256
	.long 32
	.long 32
	.long 288
	.long 4193
	.long 32
	.long 4512
	.long 4193
	.long 32
	.long 8736
	.long 4193
	.long 32
	.long 12960
	.long 4193
	.long 32
	.long 17216
	.long 64
	.long 64
	.long 17280
	.long 64
	.long 64
	.long 17344
	.long 64
	.long 64
	.long 17408
	.long 64
	.long 64
	.long 17472
	.long 64
	.long 64
	.long 17536
	.long 64
	.long 64
	.long 17600
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
DECIMAL_PRECISION:
	.long 28
	.data
	.p2align 2
WIN_W:
	.long 900
	.data
	.p2align 2
WIN_H:
	.long 900
	.data
	.p2align 2
MAX_ITER:
	.long 32768
	.data
	.p2align 2
TILE_STILL:
	.long 1
	.data
	.p2align 2
TILE_MOVING:
	.long 4
	.data
	.p2align 2
MAX_THREADS:
	.long 64
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
	.bss
	.p2align 3
g_ref_zr:
	.zero 8
	.bss
	.p2align 3
g_ref_zi:
	.zero 8
	.bss
	.p2align 2
g_ref_len:
	.zero 4
	.bss
	.p2align 3
g_pixels:
	.zero 8
	.bss
	.p2align 3
g_iters:
	.zero 8
	.bss
	.p2align 2
g_cols:
	.zero 4
	.bss
	.p2align 2
g_rows:
	.zero 4
	.bss
	.p2align 4
g_slices:
	.zero 141312
	.bss
	.p2align 4
__singinit__worker__1__voidE1_ptr1__ret_voidE1_ptr1__fx:
	.zero 525
	.bss
	.p2align 0
__singinit_guard__worker__1__voidE1_ptr1__ret_voidE1_ptr1__fx:
	.zero 1
	.bss
	.p2align 4
__singinit__worker__1__voidE1_ptr1__ret_voidE1_ptr1__fy:
	.zero 525
	.bss
	.p2align 0
__singinit_guard__worker__1__voidE1_ptr1__ret_voidE1_ptr1__fy:
	.zero 1
	.bss
	.p2align 4
__singinit__worker__1__voidE1_ptr1__ret_voidE1_ptr1__col_d:
	.zero 525
	.bss
	.p2align 0
__singinit_guard__worker__1__voidE1_ptr1__ret_voidE1_ptr1__col_d:
	.zero 1
	.bss
	.p2align 4
__singinit__worker__1__voidE1_ptr1__ret_voidE1_ptr1__row_d:
	.zero 525
	.bss
	.p2align 0
__singinit_guard__worker__1__voidE1_ptr1__ret_voidE1_ptr1__row_d:
	.zero 1
	.bss
	.p2align 4
__singinit__worker__1__voidE1_ptr1__ret_voidE1_ptr1__cols_d:
	.zero 525
	.bss
	.p2align 0
__singinit_guard__worker__1__voidE1_ptr1__ret_voidE1_ptr1__cols_d:
	.zero 1
	.bss
	.p2align 4
__singinit__worker__1__voidE1_ptr1__ret_voidE1_ptr1__rows_d:
	.zero 525
	.bss
	.p2align 0
__singinit_guard__worker__1__voidE1_ptr1__ret_voidE1_ptr1__rows_d:
	.zero 1
	.bss
	.p2align 4
__singinit__worker__1__voidE1_ptr1__ret_voidE1_ptr1__half:
	.zero 525
	.bss
	.p2align 0
__singinit_guard__worker__1__voidE1_ptr1__ret_voidE1_ptr1__half:
	.zero 1
	.bss
	.p2align 4
__singinit__worker__1__voidE1_ptr1__ret_voidE1_ptr1__tmp:
	.zero 525
	.bss
	.p2align 0
__singinit_guard__worker__1__voidE1_ptr1__ret_voidE1_ptr1__tmp:
	.zero 1
	.bss
	.p2align 4
__singinit__worker__1__voidE1_ptr1__ret_voidE1_ptr1__tmp2:
	.zero 525
	.bss
	.p2align 0
__singinit_guard__worker__1__voidE1_ptr1__ret_voidE1_ptr1__tmp2:
	.zero 1
	.section .rdata,"dr"
	.p2align 4
.LZERO:
	.zero 768
