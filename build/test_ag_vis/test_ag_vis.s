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
.LB9035:
	testq %rdx, %rdx
	je .LB9037
.LB9036:
	movb %al, (%rcx,%rsi,1)
	movb %al, 1(%rcx,%rsi,1)
	movb %al, 2(%rcx,%rsi,1)
	movb %al, 3(%rcx,%rsi,1)
	addq $4, %rsi
	decq %rdx
	jne .LB9036
.LB9037:
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
.LB9038:
	testq %rax, %rax
	je .LB9040
.LB9039:
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
	jne .LB9039
.LB9040:
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
	je .LB8925
.LB8926:
	movq 16(%rax), %rcx
	movq 8(%rax), %r8
	movq (%rax), %r9
	leaq (%rcx,%rdi), %rdx
	leaq (%r9,%rcx,1), %rcx
	movq %rdx, 16(%rax)
	xorl %eax, %eax
	cmpq %r8, %rdx
	cmovbe %rcx, %rax
.LB8922:
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
.LB8925:
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
	je .LB8920
.LB8921:
	movq 16(%rax), %rcx
	leaq (%rcx,%rdi), %rdx
	movq 8(%rax), %rdi
	movq (%rax), %r8
	leaq (%r8,%rcx,1), %rcx
	movq %rdx, 16(%rax)
	xorl %eax, %eax
	cmpq %rdi, %rdx
	cmovbe %rcx, %rax
.LB8917:
	testq %rax, %rax
	je .LB1146
.LB1147:
	movq %rax, %rdi
	jmp .LB1126
.LB8920:
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
	je .LB8930
.LB8931:
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
.LB8932:
	movslq %edx, %rdi
	shlq $5, %rdi
	movq (%rax,%rdi,1), %rdi
	testq %rdi, %rdi
	je .LB8934
.LB8933:
	cmpq %rsi, %rdi
	je .LB8936
.LB8937:
	incq %rdx
	andq %rcx, %rdx
	jmp .LB8932
.LB8934:
	xorl %eax, %eax
.LB8927:
	testq %rax, %rax
	je .LB1193
.LB1194:
	movq 8(%rax), %rcx
	cmpq $1, 16(%rax)
	je .LB1214
.LB1215:
	movq $3, 16(%rax)
	cmpq $8, %rcx
	ja .LB8943
.LB8944:
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
.LB8936:
	shlq $5, %rdx
	leaq (%rax,%rdx,1), %rax
	jmp .LB8927
.LB8930:
	xorl %eax, %eax
	jmp .LB8927
.LB8943:
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
.LB9041:
	movl $1, %eax
	ret
.LB1235:
	cmpb $9, %cl
	jne .LB1240
.LB9042:
	movl $1, %eax
	ret
.LB1240:
	cmpb $10, %cl
	jne .LB1245
.LB9043:
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
.LB9044:
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
.LB9045:
	movl $1, %eax
	ret
.LB1268:
	cmpb $65, %cl
	jge .LB1272
.LB9046:
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
.LB9047:
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
.LB9048:
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
	jne .LS9050f
.LS9050l:
	addq $32, %rdx
	vpcmpeqb (%rdx), %ymm15, %ymm0
	vpmovmskb %ymm0, %r9d
	testl %r9d, %r9d
	je .LS9050l
	tzcntl %r9d, %r9d
	addq %rdx, %r9
	subq %rax, %r9
	jmp .LS9050d
.LS9050f:
	tzcntl %r9d, %r9d
.LS9050d:
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
.LB9049:
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
	jmp .LB9049
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
	jne .LS9051f
.LS9051l:
	addq $32, %rdx
	vpcmpeqb (%rdx), %ymm15, %ymm0
	vpmovmskb %ymm0, %r8d
	testl %r8d, %r8d
	je .LS9051l
	tzcntl %r8d, %r8d
	addq %rdx, %r8
	subq %rax, %r8
	jmp .LS9051d
.LS9051f:
	tzcntl %r8d, %r8d
.LS9051d:
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
	jne .LS9054f
.LS9054l:
	addq $32, %rdx
	vpcmpeqb (%rdx), %ymm15, %ymm0
	vpmovmskb %ymm0, %edi
	testl %edi, %edi
	je .LS9054l
	tzcntl %edi, %edi
	addq %rdx, %rdi
	subq %rax, %rdi
	jmp .LS9054d
.LS9054f:
	tzcntl %edi, %edi
.LS9054d:
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
	jge .LB9052
.LB9053:
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
.LB9052:
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
	jne .LS9063f
.LS9063l:
	addq $32, %rdx
	vpcmpeqb (%rdx), %ymm15, %ymm0
	vpmovmskb %ymm0, %edi
	testl %edi, %edi
	je .LS9063l
	tzcntl %edi, %edi
	addq %rdx, %rdi
	subq %rax, %rdi
	jmp .LS9063d
.LS9063f:
	tzcntl %edi, %edi
.LS9063d:
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
	jge .LB9055
.LB9056:
	movslq %r12d, %rcx
	xorl %edx, %edx
	testq %rcx, %rcx
	cmovg %rcx, %rdx
	shrq $2, %rdx
	xorl %edi, %edi
.LB9057:
	testq %rdx, %rdx
	je .LB9059
.LB9058:
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
	jne .LB9058
.LB9059:
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
.LB9055:
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
.LB9060:
	testl %ecx, %ecx
	je .LB9062
.LB9061:
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
	jne .LB9061
.LB9062:
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
	jae .LB9064
.LB9065:
	movzbl %sil, %esi
	movl $8388627, %edi
	btq %rsi, %rdi
	jae .LB9064
.LB2384:
	incl %eax
	jmp .LB2383
.LB9064:
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
	jae .LB9066
.LB9067:
	movzbl %sil, %esi
	movl $8388627, %edi
	btq %rsi, %rdi
	jae .LB9066
.LB2590:
	incl %eax
	jmp .LB2589
.LB9066:
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
.LB9068:
	testl %esi, %esi
	je .LB9070
.LB9069:
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
	jne .LB9069
.LB9070:
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
.LB9075:
	testl %edx, %edx
	je .LB9077
.LB9076:
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
	jne .LB9076
.LB9077:
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
.LB9082:
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
	jge .LB9083
.LB9084:
	movslq %r13d, %rcx
	xorl %edx, %edx
	testq %rcx, %rcx
	cmovg %rcx, %rdx
	shrq $2, %rdx
	xorl %esi, %esi
.LB9085:
	testq %rdx, %rdx
	je .LB9087
.LB9086:
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
	jne .LB9086
.LB9087:
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
.LB9083:
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
.LB9088:
	testl %ecx, %ecx
	je .LB9090
.LB9089:
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
	jne .LB9089
.LB9090:
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
.LB9091:
	testq %rdx, %rdx
	je .LB9093
.LB9092:
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
	jne .LB9092
.LB9093:
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
.LB9094:
	testq %rdx, %rdx
	je .LB9096
.LB9095:
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
	jne .LB9095
.LB9096:
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
.LB9097:
	testq %rdx, %rdx
	je .LB9099
.LB9098:
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
	jne .LB9098
.LB9099:
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
.LB9100:
	testq %rdx, %rdx
	je .LB9102
.LB9101:
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
	jne .LB9101
.LB9102:
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
.LB9103:
	testq %rdx, %rdx
	je .LB9105
.LB9104:
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
	jne .LB9104
.LB9105:
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
.LB9106:
	testq %rdx, %rdx
	je .LB9108
.LB9107:
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
	jne .LB9107
.LB9108:
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
.LB9109:
	testq %rdx, %rdx
	je .LB9111
.LB9110:
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
	jne .LB9110
.LB9111:
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
.LB9112:
	testq %rdx, %rdx
	je .LB9114
.LB9113:
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
	jne .LB9113
.LB9114:
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
.LB9115:
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
	jmp .LB9115
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
.LB9116:
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
	jmp .LB9116
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
.LB3941:
	movq $0, -24(%rbp)
	movq $0, -32(%rbp)
	leaq -24(%rbp), %rcx
	callq QueryPerformanceCounter
	leaq -32(%rbp), %rcx
	callq QueryPerformanceFrequency
	cmpq $0, -32(%rbp)
	je .LB3949
.LB3950:
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
.LB3949:
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
.LB3966:
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
.LB3969:
	movl $1, %eax
	cmpl $1, %eax
	jne .LB3972
.LB3971:
	callq standard__time__win_time_now__0__ret_dataE1_sbits64
	leave
	ret
.LB3972:
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
.LB3975:
	movl $1, %eax
	cmpl $1, %eax
	jne .LB3979
.LB3978:
	callq Sleep
	leave
	ret
.LB3979:
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
.LB3991:
	movl standard__io__console__out_len(%rip), %edi
	testl %edi, %edi
	je .LB3996
.LB3997:
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
.LB3996:
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
.LB4001:
	movq %rcx, %rsi
	movl %edx, %edi
	testl %edi, %edi
	jle .LB4007
.LB4008:
	cmpl $8192, %edi
	jge .LB4012
.LB4013:
	movl standard__io__console__out_len(%rip), %eax
	addl %edi, %eax
	cmpl $8192, %eax
	jg .LB4021
.LB4023:
	movl %edi, %eax
	shrl $2, %eax
	xorl %ecx, %ecx
.LB9117:
	testl %eax, %eax
	je .LB9119
.LB9118:
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
	jne .LB9118
	jmp .LB9119
.LB4021:
	callq standard__io__console__flush__0__ret_voidE1
	jmp .LB4023
.LB9119:
.LB4024:
	cmpl %edi, %ecx
	jge .LB4026
.LB4025:
	movslq %ecx, %rax
	leaq standard__io__console__out_buf(%rip), %r8
	movzbl (%rsi,%rax,1), %eax
	movl standard__io__console__out_len(%rip), %edx
	addl %ecx, %edx
	incl %ecx
	movslq %edx, %rdx
	movb %al, (%r8,%rdx,1)
	cmpl %edi, %ecx
	jl .LB4025
.LB4026:
	movl standard__io__console__out_len(%rip), %eax
	addl %edi, %eax
	movl %eax, standard__io__console__out_len(%rip)
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB4012:
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
.LB4007:
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
.LB3981:
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
.LB4043:
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
.LB4048:
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
.LB4055:
	testb %cl, %cl
	jne .LB4058
.LB4059:
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
.LB4058:
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
.LB4079:
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
.LB4076:
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
.LB4102:
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
.LB4109:
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
.LB4095:
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
.LB4116:
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
.LB4123:
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
.LB4130:
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
.LB4137:
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
.LB4144:
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
.LB4147:
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
.LB4150:
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
.LB4158:
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
.LB4173:
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
.LB4181:
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
.LB3986:
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
	movl $11984, %eax
	callq __chkstk
	subq %rax, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
	movq %r14, -48(%rbp)
	movq %r15, -56(%rbp)
.LB8668:
	movabsq $1036831949, %r10
	movq %r10, %xmm0
	movss %xmm0, -104(%rbp)
	movabsq $1045220557, %r10
	movq %r10, %xmm0
	movss %xmm0, -100(%rbp)
	movabsq $1050253722, %r10
	movq %r10, %xmm0
	movss %xmm0, -96(%rbp)
	movabsq $1053609165, %r10
	movq %r10, %xmm0
	movss %xmm0, -92(%rbp)
	movabsq $1056964608, %r10
	movq %r10, %xmm0
	movss %xmm0, -88(%rbp)
	movabsq $1058642330, %r10
	movq %r10, %xmm0
	movss %xmm0, -84(%rbp)
	movabsq $1060320051, %r10
	movq %r10, %xmm0
	movss %xmm0, -80(%rbp)
	movabsq $1061997773, %r10
	movq %r10, %xmm0
	movss %xmm0, -76(%rbp)
	movabsq $1063675494, %r10
	movq %r10, %xmm0
	movss %xmm0, -72(%rbp)
	movabsq $1065353216, %r10
	movq %r10, %xmm0
	movss %xmm0, -68(%rbp)
	movabsq $1066192077, %r10
	movq %r10, %xmm0
	movss %xmm0, -64(%rbp)
	movabsq $1067030938, %r10
	movq %r10, %xmm0
	movss %xmm0, -60(%rbp)
	movabsq $1056964608, %r10
	movq %r10, %xmm0
	movss %xmm0, -136(%rbp)
	movabsq $1058642330, %r10
	movq %r10, %xmm0
	movss %xmm0, -132(%rbp)
	movabsq $1060320051, %r10
	movq %r10, %xmm0
	movss %xmm0, -128(%rbp)
	movabsq $1061997773, %r10
	movq %r10, %xmm0
	movss %xmm0, -124(%rbp)
	movabsq $1063675494, %r10
	movq %r10, %xmm0
	movss %xmm0, -120(%rbp)
	movabsq $1065353216, %r10
	movq %r10, %xmm0
	movss %xmm0, -116(%rbp)
	movabsq $1066192077, %r10
	movq %r10, %xmm0
	movss %xmm0, -112(%rbp)
	movabsq $1067030938, %r10
	movq %r10, %xmm0
	movss %xmm0, -108(%rbp)
	movabsq $1036831949, %r10
	movq %r10, %xmm0
	movss %xmm0, -184(%rbp)
	movabsq $1045220557, %r10
	movq %r10, %xmm0
	movss %xmm0, -180(%rbp)
	movabsq $1050253722, %r10
	movq %r10, %xmm0
	movss %xmm0, -176(%rbp)
	movabsq $1053609165, %r10
	movq %r10, %xmm0
	movss %xmm0, -172(%rbp)
	movabsq $1056964608, %r10
	movq %r10, %xmm0
	movss %xmm0, -168(%rbp)
	movabsq $1058642330, %r10
	movq %r10, %xmm0
	movss %xmm0, -164(%rbp)
	movabsq $1060320051, %r10
	movq %r10, %xmm0
	movss %xmm0, -160(%rbp)
	movabsq $1061997773, %r10
	movq %r10, %xmm0
	movss %xmm0, -156(%rbp)
	movabsq $1063675494, %r10
	movq %r10, %xmm0
	movss %xmm0, -152(%rbp)
	movabsq $1065353216, %r10
	movq %r10, %xmm0
	movss %xmm0, -148(%rbp)
	movabsq $1066192077, %r10
	movq %r10, %xmm0
	movss %xmm0, -144(%rbp)
	movabsq $1067030938, %r10
	movq %r10, %xmm0
	movss %xmm0, -140(%rbp)
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -200(%rbp)
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -216(%rbp)
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -232(%rbp)
	leaq .LZERO(%rip), %rsi
	leaq -11560(%rbp), %rdi
	movq $4, -200(%rbp)
	movq $3, -192(%rbp)
	movq $3, -216(%rbp)
	movq $4, -208(%rbp)
	movq $4, -232(%rbp)
	movq $2, -224(%rbp)
	movl $11328, %ecx
	rep movsb
	leaq -11596(%rbp), %r9
	leaq -11560(%rbp), %rcx
	movl $1869903169, -11596(%rbp)
	movl $1684107879, -11592(%rbp)
	movl $1936283168, -11588(%rbp)
	movl $1768710517, -11584(%rbp)
	movl $544367994, -11580(%rbp)
	movl $1766596653, -11576(%rbp)
	movl $1411409270, -11572(%rbp)
	movl $1852399986, -11568(%rbp)
	movl $6778473, -11564(%rbp)
	movl $1280, %edx
	movl $720, %r8d
	callq standard__autograd_vis__vis_init__4__AutogradVisE1_ptr1__intE1__intE1__byteE1_ptr1__ret_boolE1
	testb %al, %al
	je .LB8763
.LB8764:
	callq standard__time__time_now__0__ret_dataE1_sbits64
	movq %rax, -11936(%rbp)
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -11616(%rbp)
	leaq -11616(%rbp), %rcx
	movl $64, %edx
	callq standard__autograd__Tape.__init__1__dataE1_ubits64__ret_thisE1
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -11720(%rbp)
	vmovdqu .LZERO+32(%rip), %ymm15
	vmovdqu %ymm15, -11688(%rbp)
	vmovdqu .LZERO+64(%rip), %ymm15
	vmovdqu %ymm15, -11656(%rbp)
	movl .LZERO+96(%rip), %r10d
	movl %r10d, -11624(%rbp)
	movb .LZERO+100(%rip), %r10b
	movb %r10b, -11620(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -11824(%rbp)
	vmovdqu .LZERO+32(%rip), %ymm15
	vmovdqu %ymm15, -11792(%rbp)
	vmovdqu .LZERO+64(%rip), %ymm15
	vmovdqu %ymm15, -11760(%rbp)
	movl .LZERO+96(%rip), %r10d
	movl %r10d, -11728(%rbp)
	movb .LZERO+100(%rip), %r10b
	movb %r10b, -11724(%rbp)
	vzeroupper
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -11928(%rbp)
	vmovdqu .LZERO+32(%rip), %ymm15
	vmovdqu %ymm15, -11896(%rbp)
	vmovdqu .LZERO+64(%rip), %ymm15
	vmovdqu %ymm15, -11864(%rbp)
	movl .LZERO+96(%rip), %r10d
	movl %r10d, -11832(%rbp)
	movb .LZERO+100(%rip), %r10b
	movb %r10b, -11828(%rbp)
	vzeroupper
	xorl %esi, %esi
	xorl %edi, %edi
.LB8785:
	leaq -11560(%rbp), %rcx
	callq standard__autograd_vis__GLVisBackend.vis_backend_poll__0__ret_boolE1
	testb %al, %al
	je .LB8880
.LB8786:
	callq standard__time__time_now__0__ret_dataE1_sbits64
	movq %rax, %rbx
	leaq -184(%rbp), %r8
	leaq -200(%rbp), %rax
	leaq -11720(%rbp), %rcx
	leaq -11616(%rbp), %rdx
	movq %rax, 32(%rsp)
	movl $2, %r9d
	callq standard__autograd__gt_init__5__GradTensorE1_ptr1__TapeE1_ptr1__floatE1_ptr1__dataE1_ubits64__dataE1_ptr1_ubits64__ret_voidE1
	leaq -104(%rbp), %r8
	leaq -216(%rbp), %rax
	leaq -11824(%rbp), %rcx
	leaq -11616(%rbp), %rdx
	movl $2, %r9d
	movq %rax, 32(%rsp)
	callq standard__autograd__gt_init__5__GradTensorE1_ptr1__TapeE1_ptr1__floatE1_ptr1__dataE1_ubits64__dataE1_ptr1_ubits64__ret_voidE1
	leaq -136(%rbp), %r8
	leaq -232(%rbp), %rax
	leaq -11928(%rbp), %rcx
	leaq -11616(%rbp), %rdx
	movl $2, %r9d
	movq %rax, 32(%rsp)
	callq standard__autograd__gt_init__5__GradTensorE1_ptr1__TapeE1_ptr1__floatE1_ptr1__dataE1_ubits64__dataE1_ptr1_ubits64__ret_voidE1
	andb $127, -11620(%rbp)
	orb $128, -11724(%rbp)
	orb $128, -11828(%rbp)
	leaq -11616(%rbp), %rcx
	leaq -11720(%rbp), %rdx
	leaq -11824(%rbp), %r8
	callq standard__autograd__grad_matmul__3__TapeE1_ptr1__GradTensorE1_ptr1__GradTensorE1_ptr1__ret_GradTensorE1_ptr1
	movq %rax, %r12
	leaq -11616(%rbp), %rcx
	movq %r12, %rdx
	callq standard__autograd__grad_relu__2__TapeE1_ptr1__GradTensorE1_ptr1__ret_GradTensorE1_ptr1
	movq %rax, %r13
	leaq -11616(%rbp), %rcx
	leaq -11928(%rbp), %r8
	movq %r13, %rdx
	callq standard__autograd__grad_matmul__3__TapeE1_ptr1__GradTensorE1_ptr1__GradTensorE1_ptr1__ret_GradTensorE1_ptr1
	movq %rax, %r14
	leaq -11616(%rbp), %rcx
	movq %r14, %rdx
	callq standard__autograd__grad_sum__2__TapeE1_ptr1__GradTensorE1_ptr1__ret_GradTensorE1_ptr1
	movq %rax, %r15
	movq (%r15), %rax
	movss (%rax), %xmm0
	movsd %xmm0, -11944(%rbp)
	testb %sil, %sil
	je .LB8820
.LB8821:
.LB8822:
	leaq -11824(%rbp), %rcx
	callq standard__autograd__gt_zero_grad__1__GradTensorE1_ptr1__ret_voidE1
	leaq -11928(%rbp), %rcx
	callq standard__autograd__gt_zero_grad__1__GradTensorE1_ptr1__ret_voidE1
	leaq -11616(%rbp), %rcx
	movq %r15, %rdx
	callq standard__autograd__backward__2__TapeE1_ptr1__GradTensorE1_ptr1__ret_voidE1
	leaq -104(%rbp), %rcx
	movq -11816(%rbp), %rdx
	movq -11736(%rbp), %r8
	movabsq $981668463, %r10
	movq %r10, %xmm0
	movaps %xmm0, %xmm3
	callq sgd_step__4__floatE1_ptr1__floatE1_ptr1__dataE1_ubits64__floatE1__ret_voidE1
	leaq -136(%rbp), %rcx
	movq -11920(%rbp), %rdx
	movq -11840(%rbp), %r8
	movabsq $981668463, %r10
	movq %r10, %xmm0
	movaps %xmm0, %xmm3
	callq sgd_step__4__floatE1_ptr1__floatE1_ptr1__dataE1_ubits64__floatE1__ret_voidE1
	leaq -11560(%rbp), %rcx
	movsd -11944(%rbp), %xmm0
	movaps %xmm0, %xmm1
	callq standard__autograd_vis__vis_push_loss__2__AutogradVisE1_ptr1__floatE1__ret_voidE1
	leaq -11560(%rbp), %rcx
	callq standard__autograd_vis__vis_render__1__AutogradVisE1_ptr1__ret_voidE1
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
	movq %r12, %rcx
	callq standard__autograd__gt_free__1__GradTensorE1_ptr1__ret_voidE1
	movq %r12, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	leaq -11928(%rbp), %rcx
	callq standard__autograd__gt_free__1__GradTensorE1_ptr1__ret_voidE1
	leaq -11824(%rbp), %rcx
	callq standard__autograd__gt_free__1__GradTensorE1_ptr1__ret_voidE1
	leaq -11720(%rbp), %rcx
	callq standard__autograd__gt_free__1__GradTensorE1_ptr1__ret_voidE1
	movq -11616(%rbp), %rax
	movl -11604(%rbp), %ecx
	movq %rcx, %r8
	shlq $10, %r8
	movq %rax, %rcx
	xorl %edx, %edx
	callq memset
	movl $0, -11608(%rbp)
	incl %edi
	callq standard__time__time_now__0__ret_dataE1_sbits64
	movq -11936(%rbp), %rcx
	subq %rcx, %rax
	movabsq $10000000000, %rcx
	cmpq %rcx, %rax
	jge .LB8880
.LB8862:
	callq standard__time__time_now__0__ret_dataE1_sbits64
	subq %rbx, %rax
	cmpq $16666666, %rax
	jl .LB8871
.LB8873:
	jmp .LB8785
.LB8820:
	leaq -11560(%rbp), %rcx
	leaq -11616(%rbp), %rdx
	callq standard__autograd_vis__vis_build_graph__2__AutogradVisE1_ptr1__standard__autograd__TapeE1_ptr1__ret_voidE1
	movl $1, %esi
	jmp .LB8822
.LB8871:
	movl $16666666, %ecx
	negq %rax
	addq %rcx, %rax
	movabsq $4835703278458516699, %rcx
	imulq %rcx
	sarq $18, %rdx
	movq %rdx, %rax
	shrq $63, %rax
	addq %rdx, %rax
	movl %eax, %ecx
	callq standard__time__sleep_ms__1__dataE1_ubits32__ret_voidE1
	jmp .LB8873
.LB8880:
	leaq -11560(%rbp), %rcx
	callq standard__autograd_vis__GLVisBackend.vis_backend_poll__0__ret_boolE1
	testb %al, %al
	je .LB8882
.LB8881:
	leaq -11560(%rbp), %rcx
	callq standard__autograd_vis__vis_render__1__AutogradVisE1_ptr1__ret_voidE1
	jmp .LB8880
.LB8882:
	leaq -11560(%rbp), %rcx
	callq standard__autograd_vis__GLVisBackend.vis_backend_shutdown__0__ret_voidE1
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
.LB8763:
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
	.globl main__2__intE1__byteE1_ptr2__ret_intE1
	.def main__2__intE1__byteE1_ptr2__ret_intE1;
	.scl 2;
	.type 32;
	.endef
main__2__intE1__byteE1_ptr2__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB8884:
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
.LB4197:
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
.LB4216:
	movslq %eax, %rcx
	cmpw $0, (%rsi,%rcx,2)
	je .LB4218
.LB4217:
.LB4225:
	movslq %eax, %rcx
	movzwl (%rsi,%rcx,2), %ecx
	cmpw $32, %cx
	je .LB4226
.LB4234:
	cmpw $9, %cx
	jne .LB4227
.LB4226:
	incl %eax
	jmp .LB4225
.LB4227:
	testw %cx, %cx
	je .LB4218
.LB4252:
	cmpw $34, %cx
	je .LB4260
.LB4261:
.LB4296:
	movslq %eax, %rcx
	movzwl (%rsi,%rcx,2), %ecx
	testw %cx, %cx
	je .LB4298
.LB4305:
	cmpw $32, %cx
	je .LB4298
.LB4314:
	cmpw $9, %cx
	je .LB4298
.LB4297:
	incl %eax
	jmp .LB4296
.LB4298:
.LB4262:
	incl %edi
	jmp .LB4216
.LB4260:
	incl %eax
.LB4265:
	movslq %eax, %rcx
	movzwl (%rsi,%rcx,2), %ecx
	testw %cx, %cx
	je .LB4267
.LB4274:
	cmpw $34, %cx
	je .LB4267
.LB4266:
	incl %eax
	jmp .LB4265
.LB4267:
	leal 1(%rax), %ecx
	movslq %eax, %rdx
	cmpw $34, (%rsi,%rdx,2)
	cmove %ecx, %eax
	jmp .LB4262
.LB4218:
	movq %rdi, %rcx
	shlq $3, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, %rbx
	xorl %r12d, %r12d
	xorl %eax, %eax
	xorl %ecx, %ecx
.LB4333:
	movslq %eax, %rdx
	cmpw $0, (%rsi,%rdx,2)
	je .LB4335
.LB4334:
.LB4342:
	movslq %eax, %rdx
	movzwl (%rsi,%rdx,2), %edx
	cmpw $32, %dx
	je .LB4343
.LB4351:
	cmpw $9, %dx
	jne .LB4344
.LB4343:
	incl %eax
	jmp .LB4342
.LB4344:
	testw %dx, %dx
	je .LB4335
.LB4369:
	cmpw $34, %dx
	je .LB4378
.LB4379:
	movq %rax, %rdx
	xorl %r8d, %r8d
.LB4417:
	movslq %edx, %r9
	movzwl (%rsi,%r9,2), %r9d
	testw %r9w, %r9w
	je .LB4419
.LB4426:
	cmpw $32, %r9w
	je .LB4419
.LB4435:
	cmpw $9, %r9w
	je .LB4419
.LB4418:
	incl %r8d
	incl %edx
	jmp .LB4417
.LB4419:
	movq %rdx, %r13
	movq %rax, %r14
	movq %r8, %r15
	movq %rcx, -80(%rbp)
.LB4380:
	leaq 1(%r15), %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	xorl %ecx, %ecx
	testl %r15d, %r15d
	cmovg %r15d, %ecx
	shrl $2, %ecx
	xorl %edx, %edx
.LB9120:
	testl %ecx, %ecx
	je .LB9122
.LB9121:
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
	jne .LB9121
	jmp .LB9122
.LB4378:
	incl %eax
	movq %rax, %rcx
	xorl %r15d, %r15d
.LB4384:
	movslq %ecx, %rdx
	movzwl (%rsi,%rdx,2), %edx
	testw %dx, %dx
	je .LB4386
.LB4393:
	cmpw $34, %dx
	je .LB4386
.LB4385:
	incl %r15d
	incl %ecx
	jmp .LB4384
.LB4386:
	leal 1(%rcx), %edx
	movslq %ecx, %r8
	cmpw $34, (%rsi,%r8,2)
	movl %ecx, %r13d
	cmove %edx, %r13d
	movq %rax, %r14
	movq $1, -80(%rbp)
	jmp .LB4380
.LB9122:
.LB4454:
	cmpl %r15d, %edx
	jge .LB4456
.LB4455:
	leal (%r14,%rdx), %ecx
	movslq %ecx, %rcx
	movzwl (%rsi,%rcx,2), %ecx
	movslq %edx, %r8
	movb %cl, (%rax,%r8,1)
	incl %edx
	cmpl %r15d, %edx
	jl .LB4455
.LB4456:
	movslq %r15d, %rcx
	movb $0, (%rax,%rcx,1)
	movslq %r12d, %rcx
	movq %rax, (%rbx,%rcx,8)
	incl %r12d
	movq %r13, %rax
	movq -80(%rbp), %rcx
	jmp .LB4333
.LB4335:
	cmpl $1, %edi
	jg .LB4484
.LB4485:
	callq main__0__ret_intE1
	movq %rax, %rsi
.LB4486:
	movslq %edi, %rdi
	xorl %r12d, %r12d
.LB4491:
	cmpq %rdi, %r12
	jge .LB4493
.LB4492:
	movq (%rbx,%r12,8), %rax
	movq %rax, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	incq %r12
	cmpq %rdi, %r12
	jl .LB4492
	jmp .LB4493
.LB4484:
	callq main__0__ret_intE1
	movl %eax, %esi
	jmp .LB4486
.LB4493:
	testl %esi, %esi
	jne .LB4506
.LB4508:
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
.LB4506:
	cmpl $3221225477, %esi
	jne .LB4508
.LB4512:
	movl $1179075923, -66(%rbp)
	movl $1414288705, -62(%rbp)
	movw $10, -58(%rbp)
	leaq -66(%rbp), %rdi
	movq %rdi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rdi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	jmp .LB4508
	.text
	.globl __chkstk
	.def __chkstk;
	.scl 2;
	.type 32;
	.endef
__chkstk:
.LB4196:
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
.LB4531:
	testb %cl, %cl
	js .LB4536
.LB4537:
	movzbl %cl, %eax
	ret
.LB4536:
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
.LB4542:
	testw %cx, %cx
	js .LB4547
.LB4548:
	movzwl %cx, %eax
	ret
.LB4547:
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
.LB4553:
	testl %ecx, %ecx
	js .LB4557
.LB4558:
	movl %ecx, %eax
	ret
.LB4557:
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
.LB4563:
	testq %rcx, %rcx
	js .LB4568
.LB4569:
	movq %rcx, %rax
	ret
.LB4568:
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
.LB4574:
	xorps %xmm1, %xmm1
	ucomiss %xmm0, %xmm1
	ja .LB4578
.LB4579:
	ret
.LB4578:
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
.LB4584:
	xorps %xmm1, %xmm1
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm0, %xmm1
	ja .LB4589
.LB4590:
	ret
.LB4589:
	xorps %xmm1, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subsd %xmm15, %xmm0
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
.LB4595:
	movsbl %cl, %eax
	testb %cl, %cl
	jle .LB4600
.LB4601:
	cmpb $1, %cl
	je .LB4607
.LB4608:
	movl %eax, %edx
	sarl $31, %edx
	movl %eax, %edx
	shrl $31, %edx
	addl %edx, %eax
	sarl $1, %eax
	movq %rax, %rsi
	movq %rcx, %rax
.LB4618:
	cmpb %al, %sil
	je .LB4620
.LB4624:
	cmpb %al, %sil
	jge .LB4620
.LB4619:
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
	jne .LB4624
.LB4620:
	movzbl %sil, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB4607:
	movl $1, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB4600:
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
.LB4640:
	movswl %cx, %eax
	testw %cx, %cx
	jle .LB4645
.LB4646:
	cmpw $1, %cx
	je .LB4652
.LB4653:
	movl %eax, %edx
	sarl $31, %edx
	movl %eax, %edx
	shrl $31, %edx
	addl %edx, %eax
	sarl $1, %eax
	movq %rax, %rsi
	movq %rcx, %rax
.LB4663:
	cmpw %ax, %si
	je .LB4665
.LB4669:
	cmpw %ax, %si
	jge .LB4665
.LB4664:
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
	jne .LB4669
.LB4665:
	movzwl %si, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB4652:
	movl $1, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB4645:
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
.LB4685:
	testl %ecx, %ecx
	jle .LB4689
.LB4690:
	movl %ecx, %eax
	sarl $31, %eax
	movl %ecx, %eax
	shrl $31, %eax
	addl %ecx, %eax
	sarl $1, %eax
	movq %rax, %rsi
	movq %rcx, %rax
.LB4697:
	cmpl %eax, %esi
	je .LB4699
.LB4703:
	cmpl %eax, %esi
	jge .LB4699
.LB4698:
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
	jne .LB4703
.LB4699:
	movl %esi, %eax
	movq 0(%rsp), %rsi
	addq $16, %rsp
	ret
.LB4689:
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
.LB4717:
	testq %rcx, %rcx
	jle .LB4722
.LB4723:
	cmpq $1, %rcx
	je .LB4729
.LB4730:
	movl $2, %esi
	movq %rcx, %rax
	cqto
	idivq %rsi
	movq %rax, %rsi
	movq %rcx, %rax
.LB4739:
	cmpq %rax, %rsi
	je .LB4741
.LB4745:
	cmpq %rax, %rsi
	jge .LB4741
.LB4740:
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
	jne .LB4745
.LB4741:
	movq %rsi, %rax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB4729:
	movl $1, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB4722:
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
.LB4760:
	testb %cl, %cl
	jbe .LB4765
.LB4766:
	movq %rcx, %rsi
	xorl %eax, %eax
.LB4772:
	cmpb %al, %sil
	je .LB4774
.LB4773:
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
	jne .LB4773
.LB4774:
	movzbl %sil, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB4765:
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
.LB4788:
	testw %cx, %cx
	jbe .LB4793
.LB4794:
	movq %rcx, %rsi
	xorl %eax, %eax
.LB4800:
	cmpw %ax, %si
	je .LB4802
.LB4801:
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
	jne .LB4801
.LB4802:
	movzwl %si, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB4793:
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
.LB4816:
	testl %ecx, %ecx
	jbe .LB4820
.LB4821:
	movq %rcx, %rsi
	xorl %eax, %eax
.LB4826:
	cmpl %eax, %esi
	je .LB4828
.LB4827:
	movl %ecx, %eax
	xorl %edx, %edx
	divl %esi
	addl %esi, %eax
	shrl $1, %eax
	movq %rsi, %r11
	movq %rax, %rsi
	movq %r11, %rax
	cmpl %eax, %esi
	jne .LB4827
.LB4828:
	movl %esi, %eax
	movq 0(%rsp), %rsi
	addq $16, %rsp
	ret
.LB4820:
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
.LB4840:
	testq %rcx, %rcx
	jbe .LB4845
.LB4846:
	movq %rcx, %rsi
	xorl %eax, %eax
.LB4852:
	cmpq %rax, %rsi
	je .LB4854
.LB4853:
	movq %rcx, %rax
	xorl %edx, %edx
	divq %rsi
	addq %rsi, %rax
	shrq $1, %rax
	movq %rsi, %r11
	movq %rax, %rsi
	movq %r11, %rax
	cmpq %rax, %rsi
	jne .LB4853
.LB4854:
	movq %rsi, %rax
	movq 0(%rsp), %rsi
	addq $16, %rsp
	ret
.LB4845:
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
.LB4867:
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
.LB4873:
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
.LB4879:
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
.LB4912:
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
.LB4944:
	xorps %xmm1, %xmm1
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm0, %xmm1
	ja .LB4950
.LB4951:
.LB4952:
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
.LB4950:
	xorps %xmm1, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subsd %xmm15, %xmm0
	jmp .LB4952
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
.LB4981:
	movl $0, -12(%rbp)
	xorps %xmm1, %xmm1
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm0, %xmm1
	seta %sil
	movzbl %sil, %esi
	testb %sil, %sil
	jne .LB4990
.LB4991:
.LB4992:
	movabsq $1061752795, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm0, %xmm1
	jae .LB4998
.LB4999:
	leaq -12(%rbp), %rdx
	callq standard__math___trig_reduce__2__doubleE1__dataE1_ptr1_sbits32__ret_doubleE1
	movl -12(%rbp), %eax
	andl $3, %eax
	je .LB5015
	cmpl $1, %eax
	je .LB5016
	cmpl $2, %eax
	jne .LB5018
.LB5017:
	callq standard__math___sin_kernel__1__doubleE1__ret_doubleE1
	xorps %xmm1, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subsd %xmm15, %xmm0
.LB5014:
	testb %sil, %sil
	jne .LB5030
.LB5031:
	movq -8(%rbp), %rsi
	leave
	ret
.LB4990:
	xorps %xmm1, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subsd %xmm15, %xmm0
	jmp .LB4992
.LB5016:
	callq standard__math___cos_kernel__1__doubleE1__ret_doubleE1
	testb %sil, %sil
	jne .LB5030
	jmp .LB5031
.LB5015:
	callq standard__math___sin_kernel__1__doubleE1__ret_doubleE1
	testb %sil, %sil
	jne .LB5030
	jmp .LB5031
.LB5018:
	callq standard__math___cos_kernel__1__doubleE1__ret_doubleE1
	xorps %xmm1, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subsd %xmm15, %xmm0
	testb %sil, %sil
	je .LB5031
.LB5030:
	xorps %xmm1, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subsd %xmm15, %xmm0
	movq -8(%rbp), %rsi
	leave
	ret
.LB4998:
	callq standard__math___sin_kernel__1__doubleE1__ret_doubleE1
	testb %sil, %sil
	jne .LB5004
.LB5005:
	movq -8(%rbp), %rsi
	leave
	ret
.LB5004:
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
.LB5036:
	movl $0, -4(%rbp)
	xorps %xmm1, %xmm1
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm0, %xmm1
	ja .LB5043
.LB5044:
.LB5045:
	movabsq $1061752795, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm0, %xmm1
	jae .LB5051
.LB5052:
	leaq -4(%rbp), %rdx
	callq standard__math___trig_reduce__2__doubleE1__dataE1_ptr1_sbits32__ret_doubleE1
	movl -4(%rbp), %eax
	andl $3, %eax
	je .LB5061
	cmpl $1, %eax
	je .LB5062
	cmpl $2, %eax
	jne .LB5064
.LB5063:
	callq standard__math___cos_kernel__1__doubleE1__ret_doubleE1
	xorps %xmm1, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subsd %xmm15, %xmm0
	leave
	ret
.LB5043:
	xorps %xmm1, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subsd %xmm15, %xmm0
	jmp .LB5045
.LB5062:
	callq standard__math___sin_kernel__1__doubleE1__ret_doubleE1
	xorps %xmm1, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subsd %xmm15, %xmm0
	leave
	ret
.LB5061:
	callq standard__math___cos_kernel__1__doubleE1__ret_doubleE1
	leave
	ret
.LB5064:
	callq standard__math___sin_kernel__1__doubleE1__ret_doubleE1
	leave
	ret
.LB5051:
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
.LB5076:
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
.LB5082:
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
.LB5088:
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
	ja .LB5097
.LB5098:
	movsd -8(%rbp), %xmm0
	cvtss2sd %xmm0, %xmm0
	callq standard__math__sin__1__doubleE1__ret_doubleE1
	cvtsd2ss %xmm0, %xmm0
	movsd -16(%rbp), %xmm1
	divss %xmm1, %xmm0
	leave
	ret
.LB5097:
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
.LB5104:
	movsd %xmm0, -8(%rbp)
	callq standard__math__cos__1__doubleE1__ret_doubleE1
	movsd %xmm0, -16(%rbp)
	callq standard__math__abs__1__doubleE1__ret_doubleE1
	movabsq $4427486594234968593, %r10
	movq %r10, %xmm1
	ucomisd %xmm0, %xmm1
	ja .LB5112
.LB5113:
	movsd -8(%rbp), %xmm0
	callq standard__math__sin__1__doubleE1__ret_doubleE1
	movsd -16(%rbp), %xmm1
	divsd %xmm1, %xmm0
	leave
	ret
.LB5112:
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	leave
	ret
	.text
	.globl standard__math__step__2__floatE1__floatE1__ret_floatE1
	.def standard__math__step__2__floatE1__floatE1__ret_floatE1;
	.scl 2;
	.type 32;
	.endef
standard__math__step__2__floatE1__floatE1__ret_floatE1:
.LB5120:
	ucomiss %xmm0, %xmm1
	jae .LB5126
.LB5127:
	xorps %xmm0, %xmm0
	ret
.LB5126:
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
.LB5130:
	ucomisd %xmm0, %xmm1
	jae .LB5136
.LB5137:
	xorps %xmm0, %xmm0
.LB5138:
	cvtss2sd %xmm0, %xmm0
	ret
.LB5136:
	movabsq $1065353216, %r10
	movq %r10, %xmm0
	jmp .LB5138
	.text
	.globl standard__math__sign__1__dataE1_sbits8__ret_dataE1_sbits8
	.def standard__math__sign__1__dataE1_sbits8__ret_dataE1_sbits8;
	.scl 2;
	.type 32;
	.endef
standard__math__sign__1__dataE1_sbits8__ret_dataE1_sbits8:
.LB5141:
	testb %cl, %cl
	jg .LB5146
.LB5147:
	testb %cl, %cl
	js .LB5153
.LB5154:
	xorl %eax, %eax
	ret
.LB5153:
	movl $255, %eax
	ret
.LB5146:
	movl $1, %eax
	ret
	.text
	.globl standard__math__sign__1__dataE1_sbits16__ret_dataE1_sbits16
	.def standard__math__sign__1__dataE1_sbits16__ret_dataE1_sbits16;
	.scl 2;
	.type 32;
	.endef
standard__math__sign__1__dataE1_sbits16__ret_dataE1_sbits16:
.LB5159:
	testw %cx, %cx
	jg .LB5164
.LB5165:
	testw %cx, %cx
	js .LB5171
.LB5172:
	xorl %eax, %eax
	ret
.LB5171:
	movl $65535, %eax
	ret
.LB5164:
	movl $1, %eax
	ret
	.text
	.globl standard__math__sign__1__dataE1_sbits32__ret_dataE1_sbits32
	.def standard__math__sign__1__dataE1_sbits32__ret_dataE1_sbits32;
	.scl 2;
	.type 32;
	.endef
standard__math__sign__1__dataE1_sbits32__ret_dataE1_sbits32:
.LB5177:
	testl %ecx, %ecx
	jg .LB5181
.LB5182:
	testl %ecx, %ecx
	js .LB5186
.LB5187:
	xorl %eax, %eax
	ret
.LB5186:
	movabsq $4294967295, %rax
	ret
.LB5181:
	movl $1, %eax
	ret
	.text
	.globl standard__math__sign__1__dataE1_sbits64__ret_dataE1_sbits64
	.def standard__math__sign__1__dataE1_sbits64__ret_dataE1_sbits64;
	.scl 2;
	.type 32;
	.endef
standard__math__sign__1__dataE1_sbits64__ret_dataE1_sbits64:
.LB5190:
	testq %rcx, %rcx
	jg .LB5195
.LB5196:
	testq %rcx, %rcx
	js .LB5202
.LB5203:
	xorl %eax, %eax
	ret
.LB5202:
	movq $-1, %rax
	ret
.LB5195:
	movl $1, %eax
	ret
	.text
	.globl standard__math__sign__1__floatE1__ret_floatE1
	.def standard__math__sign__1__floatE1__ret_floatE1;
	.scl 2;
	.type 32;
	.endef
standard__math__sign__1__floatE1__ret_floatE1:
.LB5208:
	xorps %xmm1, %xmm1
	ucomiss %xmm1, %xmm0
	ja .LB5212
.LB5213:
	xorps %xmm1, %xmm1
	ucomiss %xmm0, %xmm1
	ja .LB5217
.LB5218:
	xorps %xmm0, %xmm0
	ret
.LB5217:
	xorps %xmm0, %xmm0
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	subss %xmm1, %xmm0
	ret
.LB5212:
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
.LB5221:
	xorps %xmm1, %xmm1
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm1, %xmm0
	ja .LB5226
.LB5227:
	xorps %xmm1, %xmm1
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm0, %xmm1
	ja .LB5233
.LB5234:
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	ret
.LB5233:
	xorps %xmm0, %xmm0
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	subss %xmm1, %xmm0
	cvtss2sd %xmm0, %xmm0
	ret
.LB5226:
	movabsq $1065353216, %r10
	movq %r10, %xmm0
	cvtss2sd %xmm0, %xmm0
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
.LB7273:
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
.LB7292:
	movl 8(%rcx), %eax
	cmpl 12(%rcx), %eax
	jge .LB7298
.LB7299:
	movl 8(%rcx), %eax
	leal 1(%rax), %edx
	movl %edx, 8(%rcx)
	ret
.LB7298:
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
.LB7310:
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
.LB5239:
	movl $1, %eax
	xorl %esi, %esi
.LB5245:
	cmpq %rcx, %rsi
	jae .LB5247
.LB5246:
	movslq %esi, %rdi
	imulq (%rdx,%rdi,8), %rax
	incq %rsi
	cmpq %rcx, %rsi
	jb .LB5246
.LB5247:
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
.LB5261:
	movq %rcx, %rsi
	movq %r8, %rdi
	movq 48(%rbp), %rax
	movq %r9, 16(%rsi)
	xorl %ecx, %ecx
	testq %r9, %r9
	cmova %r9, %rcx
	shrq $2, %rcx
	xorl %edx, %edx
.LB9125:
	testq %rcx, %rcx
	je .LB9127
.LB9126:
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
	jne .LB9126
.LB9127:
.LB5273:
	cmpq %r9, %rdx
	jae .LB5275
.LB5274:
	movslq %edx, %rcx
	movq (%rax,%rcx,8), %r8
	movq %r8, 24(%rsi,%rcx,8)
	incq %rdx
	cmpq %r9, %rdx
	jb .LB5274
.LB5275:
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
.LB5338:
	movq %rcx, %rsi
	movq %rdx, 16(%rsi)
	xorl %eax, %eax
	testq %rdx, %rdx
	cmova %rdx, %rax
	shrq $2, %rax
	xorl %ecx, %ecx
.LB9128:
	testq %rax, %rax
	je .LB9130
.LB9129:
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
	jne .LB9129
.LB9130:
.LB5348:
	cmpq %rdx, %rcx
	jae .LB5350
.LB5349:
	movslq %ecx, %rax
	movq (%r8,%rax,8), %rdi
	movq %rdi, 24(%rsi,%rax,8)
	incq %rcx
	cmpq %rdx, %rcx
	jb .LB5349
.LB5350:
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
.LB5411:
	movq %rcx, %rsi
	movq (%rsi), %rax
	movq STDLIB_GVP(%rip), %rcx
	cmpq %rcx, %rax
	jne .LB5422
.LB5424:
	movq 8(%rsi), %rax
	movq STDLIB_GVP(%rip), %rcx
	cmpq %rcx, %rax
	jne .LB5443
.LB5444:
	movq -8(%rbp), %rsi
	leave
	ret
.LB5422:
	movq %rax, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movq STDLIB_GVP(%rip), %rax
	movq %rax, (%rsi)
	jmp .LB5424
.LB5443:
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
.LB5455:
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
.LB5462:
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
.LB5476:
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
.LB5531:
	cmpq %rsi, %r8
	jae .LB5533
.LB5532:
	movq %r8, %r12
	imulq %rdi, %r12
	movq %r8, %r13
	imulq %rbx, %r13
	movq %r9, -144(%rbp)
	xorl %r9d, %r9d
.LB5538:
	cmpq %rbx, %r9
	jae .LB5540
.LB5539:
	movq $0, -152(%rbp)
	xorps %xmm0, %xmm0
.LB5545:
	movq -152(%rbp), %r14
	cmpq %rdi, %r14
	jae .LB5547
.LB5546:
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
	jmp .LB5545
.LB5533:
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
.LB5540:
	incq %r8
	movq -144(%rbp), %r9
	cmpq %rsi, %r8
	jb .LB5532
	jmp .LB5533
.LB5547:
	leaq (%r13,%r9), %r14
	movss %xmm0, (%rdx,%r14,4)
	incq %r9
	movq -152(%rbp), %r10
	movq %r10, -144(%rbp)
	cmpq %rbx, %r9
	jb .LB5539
	jmp .LB5540
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
.LB5678:
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
.LB5700:
	cmpq %rax, %rcx
	jae .LB5702
.LB5701:
	movq (%rdi), %rdx
	movslq %ecx, %r8
	movss (%rdx,%r8,4), %xmm0
	xorps %xmm1, %xmm1
	ucomiss %xmm1, %xmm0
	ja .LB5715
.LB5716:
	xorps %xmm0, %xmm0
.LB5717:
	movq (%rbx), %rdx
	movss %xmm0, (%rdx,%rcx,4)
	incq %rcx
	cmpq %rax, %rcx
	jb .LB5701
.LB5702:
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
.LB5715:
	jmp .LB5717
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
.LB5765:
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
.LB5786:
	cmpq %rax, %rdx
	jae .LB5788
.LB5787:
	movslq %edx, %r8
	movss (%rcx,%r8,4), %xmm1
	addss %xmm1, %xmm0
	incq %rdx
	cmpq %rax, %rdx
	jb .LB5787
.LB5788:
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
.LB5840:
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
.LB5890:
	movq -360(%rbp), %rax
	testl %eax, %eax
	js .LB5892
.LB5891:
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
	ja .LB5932
	leaq .LJT9137(%rip), %r10
	jmpq *(%r10,%r11,8)
.LB5931:
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
.LB6968:
	movq -408(%rbp), %rax
	cmpq %r13, %rax
	jae .LB6970
.LB6969:
	xorl %eax, %eax
	movabsq $0, %r10
	movq %r10, -1000(%rbp)
	movabsq $0, %r10
	movq %r10, -1008(%rbp)
	movq -472(%rbp), %rcx
.LB6979:
	cmpq %r12, %rax
	jae .LB6981
.LB6980:
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
	jb .LB6980
	jmp .LB6981
.LB5892:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB6970:
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
.LB5917:
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
	jmp .LB5890
.LB6981:
	movzbl 100(%rdi), %r8d
	shrq $7, %r8
	testb %r8b, %r8b
	jne .LB7017
.LB7019:
	movq -800(%rbp), %r8
	movq 48(%r8), %r8
	movq %r8, -792(%rbp)
	movq STDLIB_GVP(%rip), %r8
	movq -792(%rbp), %r9
	cmpq %r8, %r9
	jne .LB7049
.LB7051:
	movzbl 100(%rsi), %r8d
	shrq $7, %r8
	testb %r8b, %r8b
	jne .LB7066
.LB7067:
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
.LB7068:
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
	jmp .LB6968
.LB7017:
	movq 8(%rdi), %r8
	movl -408(%rbp), %r9d
	movslq %r9d, %r9
	movss (%r8,%r9,4), %xmm0
	movsd -1000(%rbp), %xmm1
	movq -408(%rbp), %r9
	addss %xmm1, %xmm0
	movss %xmm0, (%r8,%r9,4)
	jmp .LB7019
.LB7049:
	movl -408(%rbp), %r8d
	movq -792(%rbp), %r9
	movslq %r8d, %r8
	movss (%r9,%r8,4), %xmm0
	movsd -1008(%rbp), %xmm1
	movq -408(%rbp), %r8
	addss %xmm1, %xmm0
	movss %xmm0, (%r9,%r8,4)
	jmp .LB7051
.LB7066:
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
.LB7076:
	cmpq %r12, %r8
	jae .LB7078
.LB7077:
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
	jb .LB7077
.LB7078:
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
.LB7133:
	cmpq %r12, %r8
	jae .LB7135
.LB7134:
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
	jb .LB7134
.LB7135:
	movl -408(%rbp), %eax
	xorl %r8d, %r8d
	movsd -992(%rbp), %xmm2
	movq -512(%rbp), %r10
	movq %r10, -776(%rbp)
.LB7167:
	cmpq %r12, %r8
	jae .LB7169
.LB7168:
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
	jb .LB7168
.LB7169:
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
	jmp .LB7068
.LB5930:
	movq -800(%rbp), %rax
	movq 16(%rax), %r12
	movq 80(%rax), %rdi
	movzbl 100(%r12), %eax
	shrq $7, %rax
	testb %al, %al
	jne .LB6888
.LB6889:
	movq -144(%rbp), %rsi
.LB6890:
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
	jmp .LB5917
.LB6888:
	xorl %eax, %eax
	testq %rsi, %rsi
	cmova %rsi, %rax
	shrq $2, %rax
	xorl %ecx, %ecx
.LB9134:
	testq %rax, %rax
	je .LB9136
.LB9135:
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
	jne .LB9135
.LB9136:
.LB6892:
	cmpq %rsi, %rcx
	jae .LB6894
.LB6893:
	movq 8(%r12), %rax
	movslq %ecx, %r8
	movss (%rax,%r8,4), %xmm0
	movss (%rdx,%r8,4), %xmm1
	movss (%rdi,%r8,4), %xmm2
	vfmadd231ss %xmm1, %xmm2, %xmm0
	movss %xmm0, (%rax,%rcx,4)
	incq %rcx
	cmpq %rsi, %rcx
	jb .LB6893
.LB6894:
	movq %rcx, %rsi
	jmp .LB6890
.LB5929:
	movq -800(%rbp), %rax
	movq 16(%rax), %r12
	movzbl 100(%r12), %eax
	shrq $7, %rax
	testb %al, %al
	jne .LB6759
.LB6760:
	movq -144(%rbp), %rax
	movq -152(%rbp), %rcx
	movsd -168(%rbp), %xmm0
	movq -256(%rbp), %rdx
	movq -264(%rbp), %rsi
.LB6761:
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
	jmp .LB5917
.LB6759:
	movq 24(%rcx), %rax
	movq %rax, -888(%rbp)
	movq 32(%rcx), %rsi
	xorl %eax, %eax
	movq -152(%rbp), %rdi
	movsd -168(%rbp), %xmm0
.LB6775:
	movq -888(%rbp), %r8
	cmpq %r8, %rax
	jae .LB6777
.LB6776:
	movq %rax, %rdi
	imulq %rsi, %rdi
	xorl %r8d, %r8d
	xorps %xmm0, %xmm0
.LB6782:
	cmpq %rsi, %r8
	jae .LB6784
.LB6783:
	leaq (%rdi,%r8), %r9
	movslq %r9d, %r9
	movss (%rdx,%r9,4), %xmm1
	movq (%rcx), %rbx
	movss (%rbx,%r9,4), %xmm2
	mulss %xmm2, %xmm1
	addss %xmm1, %xmm0
	incq %r8
	cmpq %rsi, %r8
	jb .LB6783
	jmp .LB6784
.LB6777:
	movq %rdi, %rcx
	movq -888(%rbp), %rdx
	jmp .LB6761
.LB6784:
	movq %rax, %rdi
	imulq %rsi, %rdi
	xorl %r8d, %r8d
	testq %rsi, %rsi
	cmova %rsi, %r8
	shrq $2, %r8
	xorl %r9d, %r9d
.LB9131:
	testq %r8, %r8
	je .LB9133
.LB9132:
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
	jne .LB9132
.LB9133:
.LB6815:
	cmpq %rsi, %r9
	jae .LB6817
.LB6816:
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
	jb .LB6816
.LB6817:
	incq %rax
	movq %r9, %rdi
	jmp .LB6775
.LB5928:
	movq -800(%rbp), %rax
	movq 16(%rax), %r12
	xorl %r14d, %r14d
.LB6704:
	cmpq %rsi, %r14
	jae .LB6706
.LB6705:
	movzbl 100(%r12), %eax
	shrq $7, %rax
	testb %al, %al
	jne .LB6714
.LB6716:
	incq %r14
	cmpq %rsi, %r14
	jb .LB6705
.LB6706:
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
	jmp .LB5917
.LB6714:
	movq 8(%r12), %rax
	movslq %r14d, %rcx
	movss (%rax,%rcx,4), %xmm0
	movss (%rdx,%rcx,4), %xmm1
	movq (%r12), %rdi
	movss (%rdi,%rcx,4), %xmm2
	divss %xmm2, %xmm1
	addss %xmm1, %xmm0
	movss %xmm0, (%rax,%r14,4)
	jmp .LB6716
.LB5927:
	movq -800(%rbp), %rax
	movq 16(%rax), %r12
	xorl %r14d, %r14d
.LB6661:
	cmpq %rsi, %r14
	jae .LB6663
.LB6662:
	movzbl 100(%r12), %eax
	shrq $7, %rax
	testb %al, %al
	jne .LB6671
.LB6673:
	incq %r14
	cmpq %rsi, %r14
	jb .LB6662
.LB6663:
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
	jmp .LB5917
.LB6671:
	movq 8(%r12), %rax
	movslq %r14d, %rcx
	movss (%rax,%rcx,4), %xmm0
	movss (%rdx,%rcx,4), %xmm1
	subss %xmm1, %xmm0
	movss %xmm0, (%rax,%r14,4)
	jmp .LB6673
.LB5926:
	movq -800(%rbp), %rax
	movq 16(%rax), %r12
	movss 36(%rax), %xmm1
	xorl %r14d, %r14d
.LB6616:
	cmpq %rsi, %r14
	jae .LB6618
.LB6617:
	movzbl 100(%r12), %eax
	shrq $7, %rax
	testb %al, %al
	jne .LB6626
.LB6628:
	incq %r14
	cmpq %rsi, %r14
	jb .LB6617
.LB6618:
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
	jmp .LB5917
.LB6626:
	movq 8(%r12), %rax
	movslq %r14d, %rcx
	movss (%rax,%rcx,4), %xmm0
	movss (%rdx,%rcx,4), %xmm2
	vfmadd231ss %xmm2, %xmm1, %xmm0
	movss %xmm0, (%rax,%r14,4)
	jmp .LB6628
.LB5925:
	movq -800(%rbp), %rax
	movq 16(%rax), %r12
	movss (%rdx), %xmm3
	movq 88(%r12), %r13
	xorl %r14d, %r14d
.LB6573:
	cmpq %r13, %r14
	jae .LB6575
.LB6574:
	movzbl 100(%r12), %eax
	shrq $7, %rax
	testb %al, %al
	jne .LB6583
.LB6585:
	incq %r14
	cmpq %r13, %r14
	jb .LB6574
.LB6575:
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
	jmp .LB5917
.LB6583:
	movq 8(%r12), %rax
	movslq %r14d, %rcx
	movss (%rax,%rcx,4), %xmm0
	addss %xmm3, %xmm0
	movss %xmm0, (%rax,%r14,4)
	jmp .LB6585
.LB5924:
	movq -800(%rbp), %rax
	movq 16(%rax), %r12
	movsd -120(%rbp), %xmm2
	xorl %r14d, %r14d
.LB6510:
	cmpq %rsi, %r14
	jae .LB6512
.LB6511:
	movzbl 100(%r12), %eax
	shrq $7, %rax
	testb %al, %al
	jne .LB6520
.LB6521:
.LB6522:
	incq %r14
	cmpq %rsi, %r14
	jb .LB6511
.LB6512:
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
	jmp .LB5917
.LB6520:
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
	jmp .LB6522
.LB5923:
	movq -800(%rbp), %rax
	movq 16(%rax), %r12
	movsd -112(%rbp), %xmm1
	xorl %r14d, %r14d
.LB6454:
	cmpq %rsi, %r14
	jae .LB6456
.LB6455:
	movzbl 100(%r12), %eax
	shrq $7, %rax
	testb %al, %al
	jne .LB6464
.LB6465:
.LB6466:
	incq %r14
	cmpq %rsi, %r14
	jb .LB6455
.LB6456:
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
	jmp .LB5917
.LB6464:
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
	jmp .LB6466
.LB5922:
	movq -800(%rbp), %rax
	movq 16(%rax), %r12
	xorl %r14d, %r14d
.LB6398:
	cmpq %rsi, %r14
	jae .LB6400
.LB6399:
	movzbl 100(%r12), %eax
	shrq $7, %rax
	testb %al, %al
	jne .LB6408
.LB6410:
	incq %r14
	cmpq %rsi, %r14
	jb .LB6399
.LB6400:
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
	jmp .LB5917
.LB6408:
	movq 8(%r12), %rax
	movslq %r14d, %rcx
	movss (%rax,%rcx,4), %xmm0
	movq (%r12), %rax
	movss (%rax,%rcx,4), %xmm1
	xorps %xmm2, %xmm2
	ucomiss %xmm2, %xmm1
	ja .LB6428
.LB6429:
	xorps %xmm1, %xmm1
.LB6430:
	addss %xmm1, %xmm0
	movq 8(%r12), %rax
	movss %xmm0, (%rax,%r14,4)
	jmp .LB6410
.LB6428:
	movslq %r14d, %rax
	movss (%rdx,%rax,4), %xmm1
	jmp .LB6430
.LB5921:
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
	jne .LB6216
.LB6217:
	movsd -96(%rbp), %xmm0
	movq -144(%rbp), %rax
	movq -152(%rbp), %rcx
	movq -160(%rbp), %r8
.LB6218:
	movq -936(%rbp), %r9
	movzbl 100(%r9), %r9d
	shrq $7, %r9
	testb %r9b, %r9b
	jne .LB6297
.LB6298:
	movsd %xmm0, -904(%rbp)
	movq %rax, -912(%rbp)
	movq %rcx, -920(%rbp)
	movq %r8, -928(%rbp)
.LB6299:
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
	jmp .LB5917
.LB6216:
	movsd -96(%rbp), %xmm0
	movq $0, -960(%rbp)
	movq -152(%rbp), %rcx
	movq -160(%rbp), %r8
.LB6220:
	movq -960(%rbp), %rax
	cmpq %rbx, %rax
	jae .LB6222
.LB6221:
	movq -960(%rbp), %rax
	movq %rax, %r8
	imulq %r13, %r8
	imulq %r12, %rax
	movq %rax, -968(%rbp)
	xorl %eax, %eax
.LB6227:
	cmpq %r12, %rax
	jae .LB6229
.LB6228:
	movq %rax, %rcx
	imulq %r13, %rcx
	xorps %xmm0, %xmm0
	xorl %r9d, %r9d
.LB6234:
	cmpq %r13, %r9
	jae .LB6236
.LB6235:
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
	jb .LB6235
	jmp .LB6236
.LB6222:
	movq -960(%rbp), %rax
	jmp .LB6218
.LB6297:
	xorl %r8d, %r8d
.LB6301:
	cmpq %r12, %r8
	jae .LB6303
.LB6302:
	movq %r8, %rcx
	imulq %r13, %rcx
	movq %rcx, -952(%rbp)
	xorl %ecx, %ecx
.LB6308:
	cmpq %r13, %rcx
	jae .LB6310
.LB6309:
	xorps %xmm0, %xmm0
	xorl %eax, %eax
.LB6315:
	cmpq %rbx, %rax
	jae .LB6317
.LB6316:
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
	jb .LB6316
	jmp .LB6317
.LB6303:
	movsd %xmm0, -904(%rbp)
	movq %rax, -912(%rbp)
	movq %rcx, -920(%rbp)
	movq %r8, -928(%rbp)
	jmp .LB6299
.LB6310:
	incq %r8
	cmpq %r12, %r8
	jb .LB6302
	jmp .LB6303
.LB6317:
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
	jb .LB6309
	jmp .LB6310
.LB6229:
	movq -960(%rbp), %r8
	incq %r8
	movq %r8, -960(%rbp)
	movq %rax, %r8
	jmp .LB6220
.LB6236:
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
	jb .LB6228
	jmp .LB6229
.LB5920:
	movq -800(%rbp), %rax
	movq 16(%rax), %rcx
	movq 24(%rax), %rax
	xorl %r14d, %r14d
.LB6098:
	cmpq %rsi, %r14
	jae .LB6100
.LB6099:
	movzbl 100(%rcx), %edi
	shrq $7, %rdi
	testb %dil, %dil
	jne .LB6108
.LB6110:
	movzbl 100(%rax), %edi
	shrq $7, %rdi
	testb %dil, %dil
	jne .LB6146
.LB6148:
	incq %r14
	cmpq %rsi, %r14
	jb .LB6099
.LB6100:
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
	jmp .LB5917
.LB6108:
	movq 8(%rcx), %rdi
	movslq %r14d, %r8
	movss (%rdi,%r8,4), %xmm0
	movss (%rdx,%r8,4), %xmm1
	movq (%rax), %r9
	movss (%r9,%r8,4), %xmm2
	vfmadd231ss %xmm1, %xmm2, %xmm0
	movss %xmm0, (%rdi,%r14,4)
	jmp .LB6110
.LB6146:
	movq 8(%rax), %rdi
	movslq %r14d, %r8
	movss (%rdi,%r8,4), %xmm0
	movss (%rdx,%r8,4), %xmm1
	movq (%rcx), %r9
	movss (%r9,%r8,4), %xmm2
	vfmadd231ss %xmm1, %xmm2, %xmm0
	movss %xmm0, (%rdi,%r14,4)
	jmp .LB6148
.LB5919:
	movq -800(%rbp), %rax
	movq 16(%rax), %rcx
	movq 24(%rax), %rax
	xorl %r14d, %r14d
.LB6021:
	cmpq %rsi, %r14
	jae .LB6023
.LB6022:
	movzbl 100(%rcx), %edi
	shrq $7, %rdi
	testb %dil, %dil
	jne .LB6031
.LB6033:
	movzbl 100(%rax), %edi
	shrq $7, %rdi
	testb %dil, %dil
	jne .LB6060
.LB6062:
	incq %r14
	cmpq %rsi, %r14
	jb .LB6022
.LB6023:
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
	jmp .LB5917
.LB6031:
	movq 8(%rcx), %rdi
	movslq %r14d, %r8
	movss (%rdi,%r8,4), %xmm0
	movss (%rdx,%r8,4), %xmm1
	addss %xmm1, %xmm0
	movss %xmm0, (%rdi,%r14,4)
	jmp .LB6033
.LB6060:
	movq 8(%rax), %rdi
	movslq %r14d, %r8
	movss (%rdi,%r8,4), %xmm0
	movss (%rdx,%r8,4), %xmm1
	subss %xmm1, %xmm0
	movss %xmm0, (%rdi,%r14,4)
	jmp .LB6062
.LB5918:
	movq -800(%rbp), %rax
	movq 16(%rax), %rcx
	movq 24(%rax), %rax
	xorl %r14d, %r14d
.LB5944:
	cmpq %rsi, %r14
	jae .LB5946
.LB5945:
	movzbl 100(%rcx), %edi
	shrq $7, %rdi
	testb %dil, %dil
	jne .LB5954
.LB5956:
	movzbl 100(%rax), %edi
	shrq $7, %rdi
	testb %dil, %dil
	jne .LB5983
.LB5985:
	incq %r14
	cmpq %rsi, %r14
	jb .LB5945
.LB5946:
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
	jmp .LB5917
.LB5954:
	movq 8(%rcx), %rdi
	movslq %r14d, %r8
	movss (%rdi,%r8,4), %xmm0
	movss (%rdx,%r8,4), %xmm1
	addss %xmm1, %xmm0
	movss %xmm0, (%rdi,%r14,4)
	jmp .LB5956
.LB5983:
	movq 8(%rax), %rdi
	movslq %r14d, %r8
	movss (%rdi,%r8,4), %xmm0
	movss (%rdx,%r8,4), %xmm1
	addss %xmm1, %xmm0
	movss %xmm0, (%rdi,%r14,4)
	jmp .LB5985
.LB5932:
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
	jmp .LB5917
	.section .rodata
	.p2align 3
.LJT9137:
	.quad .LB5918
	.quad .LB5919
	.quad .LB5920
	.quad .LB5921
	.quad .LB5922
	.quad .LB5923
	.quad .LB5924
	.quad .LB5925
	.quad .LB5926
	.quad .LB5927
	.quad .LB5928
	.quad .LB5929
	.quad .LB5930
	.quad .LB5931
	.text
	.text
	.globl standard__autograd_vis__GLVisBackend.__init__0__ret_thisE1
	.def standard__autograd_vis__GLVisBackend.__init__0__ret_thisE1;
	.scl 2;
	.type 32;
	.endef
standard__autograd_vis__GLVisBackend.__init__0__ret_thisE1:
.LB8367:
	movq %rcx, %rax
	ret
	.text
	.globl standard__autograd_vis__GLVisBackend.vis_backend_init__3__intE1__intE1__byteE1_ptr1__ret_boolE1
	.def standard__autograd_vis__GLVisBackend.vis_backend_init__3__intE1__intE1__byteE1_ptr1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__autograd_vis__GLVisBackend.vis_backend_init__3__intE1__intE1__byteE1_ptr1__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $368, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
.LB8368:
	movabsq $1050253722, %r10
	movq %r10, %xmm0
	movq %rcx, %rsi
	movl %edx, %edi
	movl %r8d, %ebx
	movl %edi, 24(%rsi)
	movl %ebx, 28(%rsi)
	movb $1, 32(%rsi)
	movq %r9, %r12
	movss %xmm0, 36(%rsi)
	movq STDLIB_GVP(%rip), %rcx
	callq GetModuleHandleA
	movq %rax, %r13
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -120(%rbp)
	vmovdqu .LZERO+32(%rip), %ymm15
	vmovdqu %ymm15, -88(%rbp)
	movups .LZERO+64(%rip), %xmm15
	movups %xmm15, -56(%rbp)
	vzeroupper
	movl $80, -120(%rbp)
	movl $3, -116(%rbp)
	leaq DefWindowProcA(%rip), %rax
	movq %rax, -112(%rbp)
	movq %r13, -96(%rbp)
	movq STDLIB_GVP(%rip), %rax
	movq %rax, %rcx
	movl $32512, %edx
	callq LoadCursorA
	leaq -120(%rbp), %rcx
	movq %rax, -80(%rbp)
	movq STDLIB_GVP(%rip), %rax
	movq %rax, -72(%rbp)
	leaq -139(%rbp), %rax
	movl $1262830665, -139(%rbp)
	movl $1953841473, -135(%rbp)
	movl $1634879343, -131(%rbp)
	movl $1936283236, -127(%rbp)
	movw $17459, -123(%rbp)
	movb $0, -121(%rbp)
	movq %rax, -56(%rbp)
	callq RegisterClassExA
	movl $1262830665, -158(%rbp)
	movl $1953841473, -154(%rbp)
	movl $1634879343, -150(%rbp)
	movl $1936283236, -146(%rbp)
	movw $17459, -142(%rbp)
	movb $0, -140(%rbp)
	movq STDLIB_GVP(%rip), %rax
	leaq -158(%rbp), %rdx
	movabsq $2147483648, %rcx
	movabsq $2147483648, %r8
	movl $13565952, %r9d
	movq %rcx, 32(%rsp)
	movq %r8, 40(%rsp)
	movq %rdi, 48(%rsp)
	movq %rbx, 56(%rsp)
	xorl %ecx, %ecx
	movq %r12, %r8
	movq %rax, 64(%rsp)
	movq %rax, 72(%rsp)
	movq %r13, 80(%rsp)
	movq %rax, 88(%rsp)
	callq CreateWindowExA
	movq %rax, (%rsi)
	movq STDLIB_GVP(%rip), %rcx
	cmpq %rcx, %rax
	je .LB8460
.LB8461:
	movq (%rsi), %rcx
	callq GetDC
	movq %rax, 8(%rsi)
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -200(%rbp)
	movq .LZERO+32(%rip), %r10
	movq %r10, -168(%rbp)
	vzeroupper
	movw $40, -200(%rbp)
	movw $1, -198(%rbp)
	movl PFD_DRAW_TO_WINDOW(%rip), %eax
	movl PFD_SUPPORT_OPENGL(%rip), %ecx
	leaq -200(%rbp), %rdx
	orl %ecx, %eax
	movl PFD_DOUBLEBUFFER(%rip), %ecx
	orl %ecx, %eax
	movl %eax, -196(%rbp)
	movzbl PFD_TYPE_RGBA(%rip), %eax
	movb %al, -192(%rbp)
	movb $32, -191(%rbp)
	movw $2072, -177(%rbp)
	movzbl PFD_MAIN_PLANE(%rip), %eax
	movb %al, -174(%rbp)
	movq 8(%rsi), %rcx
	callq ChoosePixelFormat
	movl %eax, %edx
	movq 8(%rsi), %rcx
	leaq -200(%rbp), %r8
	callq SetPixelFormat
	movq 8(%rsi), %rcx
	callq wglCreateContext
	movq %rax, %rdx
	movq %rdx, 16(%rsi)
	movq 8(%rsi), %rcx
	callq wglMakeCurrent
	movl GL_DEPTH_TEST(%rip), %ecx
	callq glEnable
	movl GL_LESS(%rip), %ecx
	callq glDepthFunc
	movslq %edi, %rax
	xorps %xmm0, %xmm0
	cvtsi2ssq %rax, %xmm0
	movslq %ebx, %rax
	xorps %xmm1, %xmm1
	cvtsi2ssq %rax, %xmm1
	divss %xmm1, %xmm0
	movsd %xmm0, -272(%rbp)
	movabsq $1061752825, %r10
	movq %r10, %xmm0
	movabsq $1056964608, %r10
	movq %r10, %xmm1
	mulss %xmm1, %xmm0
	callq standard__math__tan__1__floatE1__ret_floatE1
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	divss %xmm15, %xmm0
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	movabsq $1167867904, %r10
	movq %r10, %xmm2
	subss %xmm2, %xmm1
	movabsq $1065353216, %r10
	movq %r10, %xmm2
	movaps %xmm1, %xmm15
	movaps %xmm2, %xmm1
	divss %xmm15, %xmm1
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -264(%rbp)
	vmovdqu .LZERO+32(%rip), %ymm15
	vmovdqu %ymm15, -232(%rbp)
	vzeroupper
	movsd -272(%rbp), %xmm2
	movaps %xmm2, %xmm15
	movaps %xmm0, %xmm2
	divss %xmm15, %xmm2
	movss %xmm2, -264(%rbp)
	xorps %xmm2, %xmm2
	movss %xmm2, -260(%rbp)
	xorps %xmm2, %xmm2
	movss %xmm2, -256(%rbp)
	xorps %xmm2, %xmm2
	movss %xmm2, -252(%rbp)
	xorps %xmm2, %xmm2
	movss %xmm2, -248(%rbp)
	movss %xmm0, -244(%rbp)
	xorps %xmm0, %xmm0
	movss %xmm0, -240(%rbp)
	xorps %xmm0, %xmm0
	movss %xmm0, -236(%rbp)
	xorps %xmm0, %xmm0
	movss %xmm0, -232(%rbp)
	xorps %xmm0, %xmm0
	movss %xmm0, -228(%rbp)
	movabsq $1167867904, %r10
	movq %r10, %xmm0
	movabsq $1065353216, %r10
	movq %r10, %xmm2
	addss %xmm2, %xmm0
	mulss %xmm1, %xmm0
	movss %xmm0, -224(%rbp)
	xorps %xmm0, %xmm0
	movabsq $1065353216, %r10
	movq %r10, %xmm2
	subss %xmm2, %xmm0
	movss %xmm0, -220(%rbp)
	xorps %xmm0, %xmm0
	movss %xmm0, -216(%rbp)
	xorps %xmm0, %xmm0
	movss %xmm0, -212(%rbp)
	movabsq $1073741824, %r10
	movq %r10, %xmm0
	movabsq $1167867904, %r10
	movq %r10, %xmm2
	mulss %xmm2, %xmm0
	movabsq $1065353216, %r10
	movq %r10, %xmm2
	mulss %xmm2, %xmm0
	mulss %xmm1, %xmm0
	movss %xmm0, -208(%rbp)
	xorps %xmm0, %xmm0
	movss %xmm0, -204(%rbp)
	movl GL_PROJECTION(%rip), %ecx
	callq glMatrixMode
	leaq -264(%rbp), %rcx
	callq glLoadMatrixf
	movl GL_MODELVIEW(%rip), %ecx
	callq glMatrixMode
	callq glLoadIdentity
	movq (%rsi), %rcx
	movl $1, %edx
	callq ShowWindow
	movq (%rsi), %rcx
	callq UpdateWindow
	movl $1, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB8460:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
	.text
	.globl standard__autograd_vis__GLVisBackend.vis_backend_begin_frame__0__ret_voidE1
	.def standard__autograd_vis__GLVisBackend.vis_backend_begin_frame__0__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__autograd_vis__GLVisBackend.vis_backend_begin_frame__0__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
.LB8569:
	movabsq $1036831949, %r10
	movq %r10, %xmm0
	movabsq $1036831949, %r10
	movq %r10, %xmm1
	movabsq $1040522936, %r10
	movq %r10, %xmm2
	movabsq $1065353216, %r10
	movq %r10, %xmm3
	movq %rcx, %rsi
	callq glClearColor
	movl GL_COLOR_BUFFER_BIT(%rip), %eax
	movl GL_DEPTH_BUFFER_BIT(%rip), %ecx
	orl %eax, %ecx
	callq glClear
	movl GL_MODELVIEW(%rip), %ecx
	callq glMatrixMode
	callq glLoadIdentity
	xorps %xmm0, %xmm0
	movabsq $1143930880, %r10
	movq %r10, %xmm1
	movaps %xmm0, %xmm2
	subss %xmm1, %xmm2
	xorps %xmm0, %xmm0
	xorps %xmm1, %xmm1
	callq glTranslatef
	xorps %xmm0, %xmm0
	movabsq $1101004800, %r10
	movq %r10, %xmm1
	subss %xmm1, %xmm0
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	xorps %xmm2, %xmm2
	xorps %xmm3, %xmm3
	callq glRotatef
	movss 36(%rsi), %xmm0
	movabsq $1113927372, %r10
	movq %r10, %xmm1
	mulss %xmm1, %xmm0
	xorps %xmm1, %xmm1
	movabsq $1065353216, %r10
	movq %r10, %xmm2
	xorps %xmm3, %xmm3
	callq glRotatef
	movss 36(%rsi), %xmm0
	movabsq $1006834287, %r10
	movq %r10, %xmm1
	addss %xmm1, %xmm0
	movabsq $1086918649, %r10
	movq %r10, %xmm1
	movss %xmm0, 36(%rsi)
	ucomiss %xmm1, %xmm0
	ja .LB8586
.LB8587:
	movq -8(%rbp), %rsi
	leave
	ret
.LB8586:
	movabsq $1086918649, %r10
	movq %r10, %xmm1
	subss %xmm1, %xmm0
	movss %xmm0, 36(%rsi)
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl standard__autograd_vis__GLVisBackend.vis_backend_end_frame__0__ret_voidE1
	.def standard__autograd_vis__GLVisBackend.vis_backend_end_frame__0__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__autograd_vis__GLVisBackend.vis_backend_end_frame__0__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB8593:
	movq 8(%rcx), %rcx
	callq SwapBuffers
	leave
	ret
	.text
	.globl standard__autograd_vis__GLVisBackend.vis_backend_poll__0__ret_boolE1
	.def standard__autograd_vis__GLVisBackend.vis_backend_poll__0__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__autograd_vis__GLVisBackend.vis_backend_poll__0__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $96, %rsp
	movq %rsi, -8(%rbp)
.LB8597:
	movq %rcx, %rsi
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -56(%rbp)
	movups .LZERO+32(%rip), %xmm15
	movups %xmm15, -24(%rbp)
	vzeroupper
.LB8599:
	movq STDLIB_GVP(%rip), %rax
	leaq -56(%rbp), %rcx
	movq $1, 32(%rsp)
	xorl %r8d, %r8d
	xorl %r9d, %r9d
	movq %rax, %rdx
	callq PeekMessageA
	movzbl %al, %eax
	testb %al, %al
	je .LB8601
.LB8600:
	cmpl $18, -48(%rbp)
	je .LB8612
.LB8613:
	leaq -56(%rbp), %rcx
	callq TranslateMessage
	leaq -56(%rbp), %rcx
	callq DispatchMessageA
	jmp .LB8599
.LB8601:
	movzbl 32(%rsi), %eax
	movq -8(%rbp), %rsi
	leave
	ret
.LB8612:
	movb $0, 32(%rsi)
	xorl %eax, %eax
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl standard__autograd_vis__GLVisBackend.vis_backend_shutdown__0__ret_voidE1
	.def standard__autograd_vis__GLVisBackend.vis_backend_shutdown__0__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__autograd_vis__GLVisBackend.vis_backend_shutdown__0__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
.LB8620:
	movq %rcx, %rsi
	movq STDLIB_GVP(%rip), %rax
	movq %rax, %rdx
	movq %rdx, %rcx
	callq wglMakeCurrent
	movq 16(%rsi), %rcx
	callq wglDeleteContext
	movq (%rsi), %rcx
	movq 8(%rsi), %rdx
	callq ReleaseDC
	movq (%rsi), %rcx
	callq DestroyWindow
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl standard__autograd_vis__AutogradVis.__init__0__ret_thisE1
	.def standard__autograd_vis__AutogradVis.__init__0__ret_thisE1;
	.scl 2;
	.type 32;
	.endef
standard__autograd_vis__AutogradVis.__init__0__ret_thisE1:
.LB8637:
	movq %rcx, %rax
	ret
	.text
	.globl standard__autograd_vis__layout_build__4__GraphLayoutE1_ptr1__standard__autograd__TapeE1_ptr1__floatE1__floatE1__ret_voidE1
	.def standard__autograd_vis__layout_build__4__GraphLayoutE1_ptr1__standard__autograd__TapeE1_ptr1__floatE1__floatE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__autograd_vis__layout_build__4__GraphLayoutE1_ptr1__standard__autograd__TapeE1_ptr1__floatE1__floatE1__ret_voidE1:
	subq $3136, %rsp
	movq %rbx, 3120(%rsp)
	movq %rsi, 3112(%rsp)
	movq %rdi, 3104(%rsp)
	movq %r12, 3096(%rsp)
	movq %r13, 3088(%rsp)
	movq %r14, 3080(%rsp)
	movq %r15, 3072(%rsp)
.LB7321:
	leaq 2048(%rsp), %rax
	movq %rcx, %rsi
	movaps %xmm2, %xmm0
	movl 8(%rdx), %r8d
	movaps %xmm3, %xmm0
	movl $1024, %ecx
	movl %r8d, 9216(%rsi)
	movq %rax, %rdi
	movl $0, 9220(%rsi)
	xorl %eax, %eax
	rep stosb
	leaq 1024(%rsp), %rax
	movq %rax, %rdi
	xorl %eax, %eax
	movl $1024, %ecx
	rep stosb
	xorl %eax, %eax
	xorl %ecx, %ecx
	xorl %r9d, %r9d
.LB7347:
	cmpl %r8d, %eax
	jge .LB7349
.LB7348:
	movq (%rdx), %rdi
	leal 1(%rcx), %ebx
	testl %eax, %eax
	movslq %eax, %r12
	cmovle %ecx, %ebx
	movq %r12, %r13
	shlq $7, %r13
	cmpl $4, (%rdi,%r13,1)
	cmove %ebx, %ecx
	movl %ecx, 2048(%rsp,%r12,4)
	movslq %ecx, %rdi
	movl 1024(%rsp,%rdi,4), %ebx
	incl %ebx
	cmpl %r9d, %ecx
	movl %ebx, 1024(%rsp,%rdi,4)
	cmovg %ecx, %r9d
	incl %eax
	cmpl %r8d, %eax
	jl .LB7348
.LB7349:
	leaq (%rsp), %rax
	movq %rax, %rdi
	xorl %eax, %eax
	movl $1024, %ecx
	rep stosb
	leal -1(%r8), %eax
	xorl %ecx, %ecx
.LB7395:
	cmpl %r8d, %ecx
	jge .LB7397
.LB7396:
	movslq %ecx, %rbx
	movq (%rdx), %rdi
	movabsq $1120403456, %r10
	movq %r10, %xmm2
	movabsq $1112539136, %r10
	movq %r10, %xmm3
	movl 2048(%rsp,%rbx,4), %ebx
	movabsq $1123024896, %r10
	movq %r10, %xmm4
	movslq %ebx, %r12
	movslq %ebx, %rbx
	movl 1024(%rsp,%r12,4), %r13d
	movl (%rsp,%r12,4), %r14d
	leal 1(%r14), %r15d
	decl %r13d
	movl %r15d, (%rsp,%r12,4)
	movslq %ecx, %r12
	xorps %xmm0, %xmm0
	cvtsi2ssq %r12, %xmm0
	movslq %eax, %r12
	xorps %xmm1, %xmm1
	cvtsi2ssq %r12, %xmm1
	movslq %r14d, %r12
	mulss %xmm2, %xmm1
	movabsq $1056964608, %r10
	movq %r10, %xmm2
	mulss %xmm2, %xmm1
	movabsq $1120403456, %r10
	movq %r10, %xmm2
	vfmsub132ss %xmm2, %xmm1, %xmm0
	xorps %xmm1, %xmm1
	cvtsi2ssq %r12, %xmm1
	movslq %r13d, %r12
	xorps %xmm2, %xmm2
	cvtsi2ssq %r12, %xmm2
	mulss %xmm3, %xmm2
	movabsq $1056964608, %r10
	movq %r10, %xmm3
	mulss %xmm3, %xmm2
	movabsq $1112539136, %r10
	movq %r10, %xmm3
	vfmsub132ss %xmm3, %xmm2, %xmm1
	xorps %xmm2, %xmm2
	cvtsi2ssq %rbx, %xmm2
	movslq %r9d, %rbx
	xorps %xmm3, %xmm3
	cvtsi2ssq %rbx, %xmm3
	movslq %ecx, %rbx
	leaq (%rbx,%rbx,4), %r12
	shlq $7, %rbx
	mulss %xmm4, %xmm3
	movabsq $1056964608, %r10
	movq %r10, %xmm4
	leaq (%rsi,%r12,4), %r12
	mulss %xmm4, %xmm3
	movabsq $1123024896, %r10
	movq %r10, %xmm4
	vfmsub132ss %xmm4, %xmm3, %xmm2
	movl %ecx, (%r12)
	movl (%rdi,%rbx,1), %edi
	movl %edi, 4(%r12)
	movss %xmm0, 8(%r12)
	movss %xmm1, 12(%r12)
	movss %xmm2, 16(%r12)
	incl %ecx
	cmpl %r8d, %ecx
	jl .LB7396
.LB7397:
	xorl %eax, %eax
	xorl %ecx, %ecx
	xorl %edi, %edi
.LB7477:
	cmpl %r8d, %eax
	jge .LB7479
.LB7478:
	movq (%rdx), %r9
	movslq %eax, %rbx
	shlq $7, %rbx
	leaq (%r9,%rbx,1), %r9
	movq %rdi, %rbx
	movq %rcx, %rdi
	xorl %ecx, %ecx
.LB7490:
	cmpl 32(%r9), %ecx
	jge .LB7492
.LB7491:
	movslq %ecx, %rdi
	movq 16(%r9,%rdi,8), %rdi
	movl 9220(%rsi), %r12d
	cmpl $512, %r12d
	jl .LB7511
.LB7512:
.LB7513:
	incl %ecx
	cmpl 32(%r9), %ecx
	jl .LB7491
	jmp .LB7492
.LB7479:
	movq 3120(%rsp), %rbx
	movq 3112(%rsp), %rsi
	movq 3104(%rsp), %rdi
	movq 3096(%rsp), %r12
	movq 3088(%rsp), %r13
	movq 3080(%rsp), %r14
	movq 3072(%rsp), %r15
	addq $3136, %rsp
	ret
.LB7492:
	incl %eax
	movq %rdi, %rcx
	movq %rbx, %rdi
	cmpl %r8d, %eax
	jl .LB7478
	jmp .LB7479
.LB7511:
	movslq %r12d, %rbx
	leaq 5120(%rsi,%rbx,8), %rbx
	movl 96(%rdi), %r12d
	movl %r12d, (%rbx)
	movl %eax, 4(%rbx)
	movl 9220(%rsi), %r12d
	incl %r12d
	movl %r12d, 9220(%rsi)
	jmp .LB7513
	.text
	.globl standard__autograd_vis__layout_node_pos__5__GraphLayoutE1_ptr1__intE1__floatE1_ptr1__floatE1_ptr1__floatE1_ptr1__ret_voidE1
	.def standard__autograd_vis__layout_node_pos__5__GraphLayoutE1_ptr1__intE1__floatE1_ptr1__floatE1_ptr1__floatE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__autograd_vis__layout_node_pos__5__GraphLayoutE1_ptr1__intE1__floatE1_ptr1__floatE1_ptr1__floatE1_ptr1__ret_voidE1:
	subq $32, %rsp
	movq %rbx, 16(%rsp)
	movq %rsi, 8(%rsp)
	movq %rdi, 0(%rsp)
	movq %r12, -8(%rsp)
.LB7544:
	movq 72(%rsp), %rax
	movslq 9216(%rcx), %rsi
	xorl %edi, %edi
.LB7551:
	cmpq %rsi, %rdi
	jge .LB7553
.LB7552:
	leaq (%rdi,%rdi,4), %rbx
	leaq (%rcx,%rbx,4), %rbx
	movl (%rbx), %r12d
	cmpl %edx, %r12d
	je .LB7573
.LB7574:
	incq %rdi
	cmpq %rsi, %rdi
	jl .LB7552
.LB7553:
	xorps %xmm0, %xmm0
	movabsq $1176255488, %r10
	movq %r10, %xmm1
	subss %xmm1, %xmm0
	movss %xmm0, (%r8)
	xorps %xmm0, %xmm0
	movss %xmm0, (%r9)
	xorps %xmm0, %xmm0
	movss %xmm0, (%rax)
	movq 16(%rsp), %rbx
	movq 8(%rsp), %rsi
	movq 0(%rsp), %rdi
	movq -8(%rsp), %r12
	addq $32, %rsp
	ret
.LB7573:
	movss 8(%rbx), %xmm0
	movss %xmm0, (%r8)
	movss 12(%rbx), %xmm0
	movss %xmm0, (%r9)
	movss 16(%rbx), %xmm0
	movss %xmm0, (%rax)
	movq 16(%rsp), %rbx
	movq 8(%rsp), %rsi
	movq 0(%rsp), %rdi
	movq -8(%rsp), %r12
	addq $32, %rsp
	ret
	.text
	.globl standard__autograd_vis__vis_init__4__AutogradVisE1_ptr1__intE1__intE1__byteE1_ptr1__ret_boolE1
	.def standard__autograd_vis__vis_init__4__AutogradVisE1_ptr1__intE1__intE1__byteE1_ptr1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__autograd_vis__vis_init__4__AutogradVisE1_ptr1__intE1__intE1__byteE1_ptr1__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB7597:
	movq %rcx, %rax
	movl %edx, 11320(%rax)
	movl %r8d, 11324(%rax)
	movq %rax, %rcx
	callq standard__autograd_vis__GLVisBackend.vis_backend_init__3__intE1__intE1__byteE1_ptr1__ret_boolE1
	movzbl %al, %eax
	leave
	ret
	.text
	.globl standard__autograd_vis__vis_build_graph__2__AutogradVisE1_ptr1__standard__autograd__TapeE1_ptr1__ret_voidE1
	.def standard__autograd_vis__vis_build_graph__2__AutogradVisE1_ptr1__standard__autograd__TapeE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__autograd_vis__vis_build_graph__2__AutogradVisE1_ptr1__standard__autograd__TapeE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB7615:
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	movabsq $1050253722, %r10
	movq %r10, %xmm2
	movslq 11320(%rcx), %rax
	subss %xmm2, %xmm1
	xorps %xmm0, %xmm0
	cvtsi2ssq %rax, %xmm0
	leaq 40(%rcx), %rax
	movslq 11324(%rcx), %rcx
	mulss %xmm1, %xmm0
	xorps %xmm1, %xmm1
	cvtsi2ssq %rcx, %xmm1
	movq %rax, %rcx
	movaps %xmm0, %xmm2
	movaps %xmm1, %xmm3
	callq standard__autograd_vis__layout_build__4__GraphLayoutE1_ptr1__standard__autograd__TapeE1_ptr1__floatE1__floatE1__ret_voidE1
	leave
	ret
	.text
	.globl standard__autograd_vis__vis_push_loss__2__AutogradVisE1_ptr1__floatE1__ret_voidE1
	.def standard__autograd_vis__vis_push_loss__2__AutogradVisE1_ptr1__floatE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__autograd_vis__vis_push_loss__2__AutogradVisE1_ptr1__floatE1__ret_voidE1:
.LB7636:
	movaps %xmm1, %xmm0
	movslq 11312(%rcx), %rax
	movss %xmm0, 9264(%rcx,%rax,4)
	movl 11312(%rcx), %eax
	incl %eax
	movl %eax, %edx
	sarl $31, %edx
	shrl $23, %edx
	addl %eax, %edx
	andl $-512, %edx
	subl %edx, %eax
	movl %eax, 11312(%rcx)
	movl 11316(%rcx), %eax
	cmpl $512, %eax
	jl .LB7660
.LB7661:
	ret
.LB7660:
	incl %eax
	movl %eax, 11316(%rcx)
	ret
	.text
	.globl standard__autograd_vis__vis_poll__1__AutogradVisE1_ptr1__ret_boolE1
	.def standard__autograd_vis__vis_poll__1__AutogradVisE1_ptr1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__autograd_vis__vis_poll__1__AutogradVisE1_ptr1__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB7670:
	movq %rcx, %rax
	movq %rax, %rcx
	callq standard__autograd_vis__GLVisBackend.vis_backend_poll__0__ret_boolE1
	movzbl %al, %eax
	leave
	ret
	.text
	.globl standard__autograd_vis___vis_draw_graph_3d__1__AutogradVisE1_ptr1__ret_voidE1
	.def standard__autograd_vis___vis_draw_graph_3d__1__AutogradVisE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__autograd_vis___vis_draw_graph_3d__1__AutogradVisE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $224, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
.LB7676:
	leaq 40(%rcx), %rsi
	xorl %edi, %edi
.LB7685:
	cmpl 9220(%rsi), %edi
	jge .LB7687
.LB7686:
	movslq %edi, %rax
	leaq 5120(%rsi,%rax,8), %rbx
	cmpl $0, (%rbx)
	jl .LB7706
.LB7707:
	xorps %xmm0, %xmm0
	leaq -28(%rbp), %r8
	leaq -32(%rbp), %r9
	leaq -36(%rbp), %rax
	movq %rsi, %rcx
	movss %xmm0, -28(%rbp)
	xorps %xmm0, %xmm0
	movss %xmm0, -32(%rbp)
	xorps %xmm0, %xmm0
	movss %xmm0, -36(%rbp)
	xorps %xmm0, %xmm0
	movss %xmm0, -40(%rbp)
	xorps %xmm0, %xmm0
	movss %xmm0, -44(%rbp)
	xorps %xmm0, %xmm0
	movss %xmm0, -48(%rbp)
	movl (%rbx), %edx
	movq %rax, 32(%rsp)
	callq standard__autograd_vis__layout_node_pos__5__GraphLayoutE1_ptr1__intE1__floatE1_ptr1__floatE1_ptr1__floatE1_ptr1__ret_voidE1
	leaq -40(%rbp), %r8
	leaq -44(%rbp), %r9
	leaq -48(%rbp), %rax
	movl 4(%rbx), %edx
	movq %rsi, %rcx
	movq %rax, 32(%rsp)
	callq standard__autograd_vis__layout_node_pos__5__GraphLayoutE1_ptr1__intE1__floatE1_ptr1__floatE1_ptr1__floatE1_ptr1__ret_voidE1
	movss -28(%rbp), %xmm0
	xorps %xmm1, %xmm1
	movabsq $1175232512, %r10
	movq %r10, %xmm2
	subss %xmm2, %xmm1
	ucomiss %xmm0, %xmm1
	ja .LB7732
.LB7733:
	movabsq $1057803469, %r10
	movq %r10, %xmm0
	movabsq $1057803469, %r10
	movq %r10, %xmm1
	movabsq $1058642330, %r10
	movq %r10, %xmm2
	callq glColor3f
	movl GL_LINES(%rip), %ecx
	callq glBegin
	movss -28(%rbp), %xmm0
	movabsq $1107296256, %r10
	movq %r10, %xmm1
	addss %xmm1, %xmm0
	movss -32(%rbp), %xmm1
	movss -36(%rbp), %xmm2
	callq glVertex3f
	movss -40(%rbp), %xmm0
	movabsq $1107296256, %r10
	movq %r10, %xmm1
	subss %xmm1, %xmm0
	movss -44(%rbp), %xmm1
	movss -48(%rbp), %xmm2
	callq glVertex3f
	callq glEnd
	incl %edi
	cmpl 9220(%rsi), %edi
	jl .LB7686
.LB7687:
	xorl %edi, %edi
.LB7750:
	cmpl 9216(%rsi), %edi
	jge .LB7752
.LB7751:
	movslq %edi, %rax
	leaq (%rax,%rax,4), %rax
	leaq (%rsi,%rax,4), %rax
	movss 8(%rax), %xmm0
	movsd %xmm0, -56(%rbp)
	movss 12(%rax), %xmm0
	movsd %xmm0, -64(%rbp)
	movss 16(%rax), %xmm0
	movsd %xmm0, -72(%rbp)
	movl 4(%rax), %eax
	testl %eax, %eax
	js .LB7793
.LB7788:
	cmpl $10, %eax
	jg .LB7793
.LB7794:
.LB7795:
	leal (%rax,%rax,2), %eax
	leaq VIS_OP_COLORS(%rip), %rcx
	movslq %eax, %rdx
	movss (%rcx,%rdx,4), %xmm0
	leaq VIS_OP_COLORS(%rip), %rdx
	leal 1(%rax), %ecx
	addl $2, %eax
	movslq %ecx, %rcx
	movslq %eax, %rax
	movsd %xmm0, -80(%rbp)
	movss (%rdx,%rcx,4), %xmm0
	leaq VIS_OP_COLORS(%rip), %rcx
	movsd %xmm0, -88(%rbp)
	movss (%rcx,%rax,4), %xmm2
	movsd %xmm2, -96(%rbp)
	movsd -80(%rbp), %xmm0
	movsd -88(%rbp), %xmm1
	callq glColor3f
	movl GL_QUADS(%rip), %ecx
	callq glBegin
	movabsq $1107296256, %r10
	movq %r10, %xmm0
	movsd -56(%rbp), %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subss %xmm15, %xmm0
	movsd %xmm0, -104(%rbp)
	movabsq $1096810496, %r10
	movq %r10, %xmm0
	movsd -64(%rbp), %xmm1
	subss %xmm0, %xmm1
	movsd %xmm1, -112(%rbp)
	movabsq $1092616192, %r10
	movq %r10, %xmm0
	movsd -72(%rbp), %xmm2
	addss %xmm0, %xmm2
	movsd %xmm2, -120(%rbp)
	movsd -104(%rbp), %xmm0
	callq glVertex3f
	movsd -56(%rbp), %xmm1
	movabsq $1107296256, %r10
	movq %r10, %xmm0
	addss %xmm1, %xmm0
	movsd %xmm0, -128(%rbp)
	movsd -112(%rbp), %xmm1
	movsd -120(%rbp), %xmm2
	callq glVertex3f
	movsd -64(%rbp), %xmm1
	movabsq $1096810496, %r10
	movq %r10, %xmm0
	addss %xmm0, %xmm1
	movsd %xmm1, -136(%rbp)
	movsd -128(%rbp), %xmm0
	movsd -120(%rbp), %xmm2
	callq glVertex3f
	movsd -104(%rbp), %xmm0
	movsd -136(%rbp), %xmm1
	movsd -120(%rbp), %xmm2
	callq glVertex3f
	callq glEnd
	movsd -80(%rbp), %xmm1
	movabsq $1058642330, %r10
	movq %r10, %xmm0
	movsd -88(%rbp), %xmm2
	movsd -96(%rbp), %xmm3
	mulss %xmm1, %xmm0
	movabsq $1058642330, %r10
	movq %r10, %xmm1
	mulss %xmm2, %xmm1
	movabsq $1058642330, %r10
	movq %r10, %xmm2
	mulss %xmm3, %xmm2
	callq glColor3f
	movl GL_QUADS(%rip), %ecx
	callq glBegin
	movsd -72(%rbp), %xmm1
	movabsq $1092616192, %r10
	movq %r10, %xmm0
	movaps %xmm1, %xmm2
	subss %xmm0, %xmm2
	movsd %xmm2, -144(%rbp)
	movsd -128(%rbp), %xmm0
	movsd -112(%rbp), %xmm1
	callq glVertex3f
	movsd -104(%rbp), %xmm0
	movsd -112(%rbp), %xmm1
	movsd -144(%rbp), %xmm2
	callq glVertex3f
	movsd -104(%rbp), %xmm0
	movsd -136(%rbp), %xmm1
	movsd -144(%rbp), %xmm2
	callq glVertex3f
	movsd -128(%rbp), %xmm0
	movsd -136(%rbp), %xmm1
	movsd -144(%rbp), %xmm2
	callq glVertex3f
	callq glEnd
	movsd -80(%rbp), %xmm1
	movabsq $1062836634, %r10
	movq %r10, %xmm0
	movsd -88(%rbp), %xmm2
	movsd -96(%rbp), %xmm3
	mulss %xmm1, %xmm0
	movabsq $1062836634, %r10
	movq %r10, %xmm1
	mulss %xmm2, %xmm1
	movabsq $1062836634, %r10
	movq %r10, %xmm2
	mulss %xmm3, %xmm2
	callq glColor3f
	movl GL_QUADS(%rip), %ecx
	callq glBegin
	movsd -104(%rbp), %xmm0
	movsd -136(%rbp), %xmm1
	movsd -144(%rbp), %xmm2
	callq glVertex3f
	movsd -128(%rbp), %xmm0
	movsd -136(%rbp), %xmm1
	movsd -144(%rbp), %xmm2
	callq glVertex3f
	movsd -128(%rbp), %xmm0
	movsd -136(%rbp), %xmm1
	movsd -120(%rbp), %xmm2
	callq glVertex3f
	movsd -104(%rbp), %xmm0
	movsd -136(%rbp), %xmm1
	movsd -120(%rbp), %xmm2
	callq glVertex3f
	callq glEnd
	movsd -80(%rbp), %xmm1
	movabsq $1056964608, %r10
	movq %r10, %xmm0
	movsd -88(%rbp), %xmm2
	movsd -96(%rbp), %xmm3
	mulss %xmm1, %xmm0
	movabsq $1056964608, %r10
	movq %r10, %xmm1
	mulss %xmm2, %xmm1
	movabsq $1056964608, %r10
	movq %r10, %xmm2
	mulss %xmm3, %xmm2
	callq glColor3f
	movl GL_QUADS(%rip), %ecx
	callq glBegin
	movsd -104(%rbp), %xmm0
	movsd -112(%rbp), %xmm1
	movsd -120(%rbp), %xmm2
	callq glVertex3f
	movsd -128(%rbp), %xmm0
	movsd -112(%rbp), %xmm1
	movsd -120(%rbp), %xmm2
	callq glVertex3f
	movsd -128(%rbp), %xmm0
	movsd -112(%rbp), %xmm1
	movsd -144(%rbp), %xmm2
	callq glVertex3f
	movsd -104(%rbp), %xmm0
	movsd -112(%rbp), %xmm1
	movsd -144(%rbp), %xmm2
	callq glVertex3f
	callq glEnd
	movsd -80(%rbp), %xmm1
	movabsq $1061158912, %r10
	movq %r10, %xmm0
	movsd -88(%rbp), %xmm2
	movsd -96(%rbp), %xmm3
	mulss %xmm1, %xmm0
	movabsq $1061158912, %r10
	movq %r10, %xmm1
	mulss %xmm2, %xmm1
	movabsq $1061158912, %r10
	movq %r10, %xmm2
	mulss %xmm3, %xmm2
	callq glColor3f
	movl GL_QUADS(%rip), %ecx
	callq glBegin
	movsd -128(%rbp), %xmm0
	movsd -112(%rbp), %xmm1
	movsd -120(%rbp), %xmm2
	callq glVertex3f
	movsd -128(%rbp), %xmm0
	movsd -112(%rbp), %xmm1
	movsd -144(%rbp), %xmm2
	callq glVertex3f
	movsd -128(%rbp), %xmm0
	movsd -136(%rbp), %xmm1
	movsd -144(%rbp), %xmm2
	callq glVertex3f
	movabsq $1107296256, %r10
	movq %r10, %xmm0
	movsd -56(%rbp), %xmm1
	addss %xmm1, %xmm0
	movsd %xmm0, -152(%rbp)
	movabsq $1092616192, %r10
	movq %r10, %xmm1
	movsd -72(%rbp), %xmm2
	addss %xmm1, %xmm2
	movsd %xmm2, -160(%rbp)
	movsd -136(%rbp), %xmm1
	callq glVertex3f
	callq glEnd
	movsd -80(%rbp), %xmm1
	movabsq $1061158912, %r10
	movq %r10, %xmm0
	movsd -88(%rbp), %xmm2
	movsd -96(%rbp), %xmm3
	mulss %xmm1, %xmm0
	movabsq $1061158912, %r10
	movq %r10, %xmm1
	mulss %xmm2, %xmm1
	movabsq $1061158912, %r10
	movq %r10, %xmm2
	mulss %xmm3, %xmm2
	callq glColor3f
	movl GL_QUADS(%rip), %ecx
	callq glBegin
	movsd -56(%rbp), %xmm1
	movabsq $1107296256, %r10
	movq %r10, %xmm0
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subss %xmm15, %xmm0
	movsd %xmm0, -168(%rbp)
	movsd -112(%rbp), %xmm1
	movsd -144(%rbp), %xmm2
	callq glVertex3f
	movsd -64(%rbp), %xmm1
	movabsq $1096810496, %r10
	movq %r10, %xmm0
	subss %xmm0, %xmm1
	movsd %xmm1, -176(%rbp)
	movsd -168(%rbp), %xmm0
	movsd -160(%rbp), %xmm2
	callq glVertex3f
	movsd -64(%rbp), %xmm1
	movabsq $1096810496, %r10
	movq %r10, %xmm0
	addss %xmm0, %xmm1
	movsd %xmm1, -184(%rbp)
	movsd -168(%rbp), %xmm0
	movsd -160(%rbp), %xmm2
	callq glVertex3f
	movsd -72(%rbp), %xmm1
	movabsq $1092616192, %r10
	movq %r10, %xmm0
	movaps %xmm1, %xmm2
	subss %xmm0, %xmm2
	movsd -168(%rbp), %xmm0
	movsd -184(%rbp), %xmm1
	callq glVertex3f
	callq glEnd
	movabsq $1064011039, %r10
	movq %r10, %xmm0
	movabsq $1064011039, %r10
	movq %r10, %xmm1
	movabsq $1064514355, %r10
	movq %r10, %xmm2
	callq glColor3f
	movl GL_LINE_LOOP(%rip), %ecx
	callq glBegin
	movsd -168(%rbp), %xmm0
	movsd -176(%rbp), %xmm1
	movsd -160(%rbp), %xmm2
	callq glVertex3f
	movsd -152(%rbp), %xmm0
	movsd -176(%rbp), %xmm1
	movsd -160(%rbp), %xmm2
	callq glVertex3f
	movsd -152(%rbp), %xmm0
	movsd -184(%rbp), %xmm1
	movsd -160(%rbp), %xmm2
	callq glVertex3f
	movsd -168(%rbp), %xmm0
	movsd -184(%rbp), %xmm1
	movsd -160(%rbp), %xmm2
	callq glVertex3f
	callq glEnd
	incl %edi
	cmpl 9216(%rsi), %edi
	jl .LB7751
.LB7752:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB7793:
	xorl %eax, %eax
	jmp .LB7795
.LB7732:
	incl %edi
	cmpl 9220(%rsi), %edi
	jl .LB7686
	jmp .LB7687
.LB7706:
	incl %edi
	cmpl 9220(%rsi), %edi
	jl .LB7686
	jmp .LB7687
	.text
	.globl standard__autograd_vis___vis_draw_loss_overlay__1__AutogradVisE1_ptr1__ret_voidE1
	.def standard__autograd_vis___vis_draw_loss_overlay__1__AutogradVisE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__autograd_vis___vis_draw_loss_overlay__1__AutogradVisE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $192, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
.LB8107:
	movq %rcx, %rsi
	movl 11316(%rsi), %edi
	movl 11312(%rsi), %ebx
	cmpl $2, %edi
	jl .LB8124
.LB8125:
	movslq 11320(%rsi), %rax
	xorps %xmm0, %xmm0
	cvtsi2ssq %rax, %xmm0
	movsd %xmm0, -40(%rbp)
	movslq 11324(%rsi), %rax
	xorps %xmm0, %xmm0
	cvtsi2ssq %rax, %xmm0
	movsd %xmm0, -48(%rbp)
	movl GL_DEPTH_TEST(%rip), %ecx
	callq glDisable
	movl GL_PROJECTION(%rip), %ecx
	callq glMatrixMode
	callq glPushMatrix
	callq glLoadIdentity
	movslq 11320(%rsi), %rax
	xorps %xmm0, %xmm0
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm3
	xorps %xmm4, %xmm4
	movabsq $4607182418800017408, %r10
	movq %r10, %xmm5
	subsd %xmm3, %xmm0
	xorps %xmm3, %xmm3
	xorps %xmm1, %xmm1
	cvtsi2sdq %rax, %xmm1
	movslq 11324(%rsi), %rax
	movsd %xmm0, 32(%rsp)
	movsd %xmm5, 40(%rsp)
	movaps %xmm3, %xmm0
	movaps %xmm4, %xmm3
	xorps %xmm2, %xmm2
	cvtsi2sdq %rax, %xmm2
	callq glOrtho
	movl GL_MODELVIEW(%rip), %ecx
	callq glMatrixMode
	callq glPushMatrix
	callq glLoadIdentity
	movabsq $1065353216, %r10
	movq %r10, %xmm0
	movabsq $1050253722, %r10
	movq %r10, %xmm1
	movl $20, %eax
	movabsq $1035489772, %r10
	movq %r10, %xmm2
	movslq %eax, %rax
	subss %xmm1, %xmm0
	movsd -40(%rbp), %xmm1
	mulss %xmm1, %xmm0
	movsd %xmm0, -56(%rbp)
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subss %xmm15, %xmm0
	movabsq $1032805417, %r10
	movq %r10, %xmm1
	movsd %xmm0, -64(%rbp)
	xorps %xmm0, %xmm0
	cvtsi2ssq %rax, %xmm0
	movsd %xmm0, -72(%rbp)
	movabsq $1032805417, %r10
	movq %r10, %xmm0
	callq glColor3f
	movl GL_QUADS(%rip), %ecx
	callq glBegin
	xorps %xmm1, %xmm1
	movsd -56(%rbp), %xmm0
	callq glVertex2f
	xorps %xmm1, %xmm1
	movsd -40(%rbp), %xmm0
	callq glVertex2f
	movsd -40(%rbp), %xmm0
	movsd -48(%rbp), %xmm1
	callq glVertex2f
	movsd -56(%rbp), %xmm0
	movsd -48(%rbp), %xmm1
	callq glVertex2f
	callq glEnd
	movabsq $1051931443, %r10
	movq %r10, %xmm0
	movabsq $1051931443, %r10
	movq %r10, %xmm1
	movabsq $1053609165, %r10
	movq %r10, %xmm2
	callq glColor3f
	movl GL_LINE_LOOP(%rip), %ecx
	callq glBegin
	movsd -56(%rbp), %xmm0
	movsd -72(%rbp), %xmm1
	addss %xmm1, %xmm0
	movsd %xmm0, -80(%rbp)
	callq glVertex2f
	movsd -40(%rbp), %xmm0
	movsd -72(%rbp), %xmm1
	subss %xmm1, %xmm0
	movsd %xmm0, -88(%rbp)
	callq glVertex2f
	movsd -48(%rbp), %xmm0
	movsd -72(%rbp), %xmm1
	movaps %xmm1, %xmm15
	movaps %xmm0, %xmm1
	subss %xmm15, %xmm1
	movsd %xmm1, -96(%rbp)
	movsd -88(%rbp), %xmm0
	callq glVertex2f
	movsd -80(%rbp), %xmm0
	movsd -96(%rbp), %xmm1
	callq glVertex2f
	callq glEnd
	movl %ebx, %eax
	subl %edi, %eax
	leal 512(%rax), %ecx
	movl %ecx, %edx
	sarl $31, %edx
	shrl $23, %edx
	addl %ecx, %edx
	andl $-512, %edx
	subl %edx, %ecx
	movslq %ecx, %rcx
	movss 9264(%rsi,%rcx,4), %xmm0
	movl $1, %ecx
	movsd %xmm0, -104(%rbp)
.LB8207:
	cmpl %edi, %ecx
	jge .LB8209
.LB8208:
	leal (%rax,%rcx), %edx
	addl $512, %edx
	movl %edx, %r8d
	sarl $31, %r8d
	shrl $23, %r8d
	addl %edx, %r8d
	andl $-512, %r8d
	subl %r8d, %edx
	movslq %edx, %rdx
	movss 9264(%rsi,%rdx,4), %xmm1
	movsd -104(%rbp), %xmm2
	ucomiss %xmm1, %xmm2
	ja .LB8231
.LB8232:
	movsd -104(%rbp), %xmm2
.LB8233:
	ucomiss %xmm0, %xmm1
	ja .LB8238
.LB8239:
.LB8240:
	incl %ecx
	movsd %xmm2, -104(%rbp)
	cmpl %edi, %ecx
	jl .LB8208
.LB8209:
	movsd -104(%rbp), %xmm1
	subss %xmm1, %xmm0
	cvtss2sd %xmm0, %xmm1
	movabsq $4517329193108106637, %r10
	movq %r10, %xmm2
	ucomisd %xmm1, %xmm2
	ja .LB8251
.LB8252:
	movsd %xmm0, -112(%rbp)
.LB8253:
	movsd -56(%rbp), %xmm0
	movsd -72(%rbp), %xmm1
	leal -1(%rdi), %eax
	subl %edi, %ebx
	movslq %eax, %rax
	addss %xmm1, %xmm0
	movsd %xmm0, -120(%rbp)
	movsd -64(%rbp), %xmm2
	movabsq $1073741824, %r10
	movq %r10, %xmm0
	movsd -48(%rbp), %xmm3
	vfnmadd132ss %xmm1, %xmm2, %xmm0
	movabsq $1073741824, %r10
	movq %r10, %xmm2
	vfnmadd132ss %xmm2, %xmm3, %xmm1
	movsd %xmm1, -128(%rbp)
	xorps %xmm1, %xmm1
	cvtsi2ssq %rax, %xmm1
	leal 512(%rbx), %eax
	movl %eax, %ecx
	sarl $31, %ecx
	shrl $23, %ecx
	addl %eax, %ecx
	andl $-512, %ecx
	divss %xmm1, %xmm0
	subl %ecx, %eax
	movslq %eax, %rax
	movsd %xmm0, -136(%rbp)
	movss 9264(%rsi,%rax,4), %xmm0
	movsd -104(%rbp), %xmm1
	subss %xmm1, %xmm0
	movsd -112(%rbp), %xmm1
	divss %xmm1, %xmm0
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subss %xmm15, %xmm0
	movsd -128(%rbp), %xmm1
	movsd -72(%rbp), %xmm2
	vfmadd132ss %xmm1, %xmm2, %xmm0
	movabsq $1063675494, %r10
	movq %r10, %xmm1
	movabsq $1055286886, %r10
	movq %r10, %xmm2
	movsd %xmm0, -144(%rbp)
	movabsq $1045220557, %r10
	movq %r10, %xmm0
	callq glColor3f
	movl GL_LINE_STRIP(%rip), %ecx
	callq glBegin
	movsd -120(%rbp), %xmm0
	movsd -144(%rbp), %xmm1
	callq glVertex2f
	movl $1, %r12d
.LB8306:
	cmpl %edi, %r12d
	jge .LB8308
.LB8307:
	leal (%rbx,%r12), %eax
	addl $512, %eax
	movl %eax, %ecx
	sarl $31, %ecx
	shrl $23, %ecx
	addl %eax, %ecx
	andl $-512, %ecx
	subl %ecx, %eax
	movslq %eax, %rax
	movss 9264(%rsi,%rax,4), %xmm0
	movslq %r12d, %rax
	xorps %xmm1, %xmm1
	cvtsi2ssq %rax, %xmm1
	movsd -136(%rbp), %xmm2
	movsd -120(%rbp), %xmm3
	vfmadd132ss %xmm2, %xmm3, %xmm1
	movsd -104(%rbp), %xmm2
	subss %xmm2, %xmm0
	movsd -112(%rbp), %xmm2
	divss %xmm2, %xmm0
	movabsq $1065353216, %r10
	movq %r10, %xmm2
	movaps %xmm0, %xmm15
	movaps %xmm2, %xmm0
	subss %xmm15, %xmm0
	movsd -128(%rbp), %xmm2
	movsd -72(%rbp), %xmm3
	vfmadd132ss %xmm0, %xmm3, %xmm2
	movaps %xmm1, %xmm0
	movaps %xmm2, %xmm1
	callq glVertex2f
	incl %r12d
	cmpl %edi, %r12d
	jl .LB8307
	jmp .LB8308
.LB8251:
	movabsq $1065353216, %r10
	movq %r10, -112(%rbp)
	jmp .LB8253
.LB8308:
	callq glEnd
	movl GL_PROJECTION(%rip), %ecx
	callq glMatrixMode
	callq glPopMatrix
	movl GL_MODELVIEW(%rip), %ecx
	callq glMatrixMode
	callq glPopMatrix
	movl GL_DEPTH_TEST(%rip), %ecx
	callq glEnable
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB8231:
	movaps %xmm1, %xmm2
	jmp .LB8233
.LB8238:
	movaps %xmm1, %xmm0
	jmp .LB8240
.LB8124:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
	.text
	.globl standard__autograd_vis__vis_render__1__AutogradVisE1_ptr1__ret_voidE1
	.def standard__autograd_vis__vis_render__1__AutogradVisE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__autograd_vis__vis_render__1__AutogradVisE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
.LB8350:
	movq %rcx, %rsi
	movq %rsi, %rcx
	callq standard__autograd_vis__GLVisBackend.vis_backend_begin_frame__0__ret_voidE1
	movq %rsi, %rcx
	callq standard__autograd_vis___vis_draw_graph_3d__1__AutogradVisE1_ptr1__ret_voidE1
	movq %rsi, %rcx
	callq standard__autograd_vis___vis_draw_loss_overlay__1__AutogradVisE1_ptr1__ret_voidE1
	movq 8(%rsi), %rcx
	callq SwapBuffers
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl standard__autograd_vis__vis_shutdown__1__AutogradVisE1_ptr1__ret_voidE1
	.def standard__autograd_vis__vis_shutdown__1__AutogradVisE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__autograd_vis__vis_shutdown__1__AutogradVisE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB8362:
	movq %rcx, %rax
	movq %rax, %rcx
	callq standard__autograd_vis__GLVisBackend.vis_backend_shutdown__0__ret_voidE1
	leave
	ret
	.text
	.globl sgd_step__4__floatE1_ptr1__floatE1_ptr1__dataE1_ubits64__floatE1__ret_voidE1
	.def sgd_step__4__floatE1_ptr1__floatE1_ptr1__dataE1_ubits64__floatE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
sgd_step__4__floatE1_ptr1__floatE1_ptr1__dataE1_ubits64__floatE1__ret_voidE1:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
	movq %rdi, -8(%rsp)
.LB8638:
	movaps %xmm3, %xmm0
	xorl %eax, %eax
	testq %r8, %r8
	cmova %r8, %rax
	shrq $2, %rax
	xorl %esi, %esi
.LB9138:
	testq %rax, %rax
	je .LB9140
.LB9139:
	movslq %esi, %rdi
	movss (%rcx,%rdi,4), %xmm1
	movss (%rdx,%rdi,4), %xmm2
	leaq 1(%rsi), %rdi
	movslq %edi, %rdi
	vfnmadd231ss %xmm0, %xmm2, %xmm1
	movss %xmm1, (%rcx,%rsi,4)
	movss (%rcx,%rdi,4), %xmm1
	movss (%rdx,%rdi,4), %xmm2
	leaq 2(%rsi), %rdi
	movslq %edi, %rdi
	vfnmadd231ss %xmm0, %xmm2, %xmm1
	movss %xmm1, 4(%rcx,%rsi,4)
	movss (%rcx,%rdi,4), %xmm1
	movss (%rdx,%rdi,4), %xmm2
	leaq 3(%rsi), %rdi
	movslq %edi, %rdi
	vfnmadd231ss %xmm0, %xmm2, %xmm1
	movss %xmm1, 8(%rcx,%rsi,4)
	movss (%rcx,%rdi,4), %xmm1
	movss (%rdx,%rdi,4), %xmm2
	vfnmadd231ss %xmm0, %xmm2, %xmm1
	movss %xmm1, 12(%rcx,%rsi,4)
	addq $4, %rsi
	decq %rax
	jne .LB9139
.LB9140:
.LB8644:
	cmpq %r8, %rsi
	jae .LB8646
.LB8645:
	movslq %esi, %rax
	movss (%rcx,%rax,4), %xmm1
	movss (%rdx,%rax,4), %xmm2
	vfnmadd231ss %xmm0, %xmm2, %xmm1
	movss %xmm1, (%rcx,%rsi,4)
	incq %rsi
	cmpq %r8, %rsi
	jb .LB8645
.LB8646:
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
standard__autograd_vis__VisNode.TLD:
	.long 160
	.long 5
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
	.section .rdata,"dr"
	.p2align 4
standard__autograd_vis__VisEdge.TLD:
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
standard__autograd_vis__GraphLayout.TLD:
	.long 73792
	.long 4
	.long 0
	.long 40960
	.long 32
	.long 40960
	.long 32768
	.long 32
	.long 73728
	.long 32
	.long 32
	.long 73760
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
	.p2align 4
global_rng:
	.zero 16
	.bss
	.p2align 0
global_rng_initialized:
	.zero 1
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
	.section .rdata,"dr"
	.p2align 0
.str.0:
	.byte 78, 79, 78, 69, 0
	.section .rdata,"dr"
	.p2align 0
.str.1:
	.byte 65, 68, 68, 0
	.section .rdata,"dr"
	.p2align 0
.str.2:
	.byte 83, 85, 66, 0
	.section .rdata,"dr"
	.p2align 0
.str.3:
	.byte 77, 85, 76, 0
	.section .rdata,"dr"
	.p2align 0
.str.4:
	.byte 77, 65, 84, 77, 85, 76, 0
	.section .rdata,"dr"
	.p2align 0
.str.5:
	.byte 82, 69, 76, 85, 0
	.section .rdata,"dr"
	.p2align 3
.str.6:
	.byte 83, 73, 71, 77, 79, 73, 68, 0
	.section .rdata,"dr"
	.p2align 0
.str.7:
	.byte 84, 65, 78, 72, 0
	.section .rdata,"dr"
	.p2align 0
.str.8:
	.byte 83, 85, 77, 0
	.section .rdata,"dr"
	.p2align 0
.str.9:
	.byte 83, 67, 65, 76, 69, 0
	.section .rdata,"dr"
	.p2align 0
.str.10:
	.byte 78, 69, 71, 0
	.data
	.p2align 4
VIS_OP_LABELS:
	.quad .str.0
	.quad .str.1
	.quad .str.2
	.quad .str.3
	.quad .str.4
	.quad .str.5
	.quad .str.6
	.quad .str.7
	.quad .str.8
	.quad .str.9
	.quad .str.10
	.data
	.p2align 4
VIS_OP_COLORS:
	.long 1050253722
	.long 1050253722
	.long 1050253722
	.long 1045220557
	.long 1057803469
	.long 1062836634
	.long 1062836634
	.long 1053609165
	.long 1045220557
	.long 1048576000
	.long 1060320051
	.long 1053609165
	.long 1060320051
	.long 1048576000
	.long 1061158912
	.long 1062836634
	.long 1045220557
	.long 1045220557
	.long 1045220557
	.long 1061158912
	.long 1061158912
	.long 1061997773
	.long 1060320051
	.long 1036831949
	.long 1056964608
	.long 1056964608
	.long 1062836634
	.long 1058642330
	.long 1061997773
	.long 1050253722
	.long 1061997773
	.long 1053609165
	.long 1058642330
	.section .rdata,"dr"
	.p2align 4
.LZERO:
	.zero 11328
