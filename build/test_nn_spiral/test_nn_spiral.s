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
.LB12219:
	testq %rdx, %rdx
	je .LB12221
.LB12220:
	movb %al, (%rcx,%rsi,1)
	movb %al, 1(%rcx,%rsi,1)
	movb %al, 2(%rcx,%rsi,1)
	movb %al, 3(%rcx,%rsi,1)
	addq $4, %rsi
	decq %rdx
	jne .LB12220
.LB12221:
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
.LB12222:
	testq %rax, %rax
	je .LB12224
.LB12223:
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
	jne .LB12223
.LB12224:
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
	je .LB11981
.LB11982:
	movq 16(%rax), %rcx
	movq 8(%rax), %r8
	movq (%rax), %r9
	leaq (%rcx,%rdi), %rdx
	leaq (%r9,%rcx,1), %rcx
	movq %rdx, 16(%rax)
	xorl %eax, %eax
	cmpq %r8, %rdx
	cmovbe %rcx, %rax
.LB11978:
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
.LB11981:
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
	je .LB11976
.LB11977:
	movq 16(%rax), %rcx
	leaq (%rcx,%rdi), %rdx
	movq 8(%rax), %rdi
	movq (%rax), %r8
	leaq (%r8,%rcx,1), %rcx
	movq %rdx, 16(%rax)
	xorl %eax, %eax
	cmpq %rdi, %rdx
	cmovbe %rcx, %rax
.LB11973:
	testq %rax, %rax
	je .LB1146
.LB1147:
	movq %rax, %rdi
	jmp .LB1126
.LB11976:
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
	je .LB11986
.LB11987:
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
.LB11988:
	movslq %edx, %rdi
	shlq $5, %rdi
	movq (%rax,%rdi,1), %rdi
	testq %rdi, %rdi
	je .LB11990
.LB11989:
	cmpq %rsi, %rdi
	je .LB11992
.LB11993:
	incq %rdx
	andq %rcx, %rdx
	jmp .LB11988
.LB11990:
	xorl %eax, %eax
.LB11983:
	testq %rax, %rax
	je .LB1193
.LB1194:
	movq 8(%rax), %rcx
	cmpq $1, 16(%rax)
	je .LB1214
.LB1215:
	movq $3, 16(%rax)
	cmpq $8, %rcx
	ja .LB11999
.LB12000:
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
.LB11992:
	shlq $5, %rdx
	leaq (%rax,%rdx,1), %rax
	jmp .LB11983
.LB11986:
	xorl %eax, %eax
	jmp .LB11983
.LB11999:
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
.LB12225:
	movl $1, %eax
	ret
.LB1235:
	cmpb $9, %cl
	jne .LB1240
.LB12226:
	movl $1, %eax
	ret
.LB1240:
	cmpb $10, %cl
	jne .LB1245
.LB12227:
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
.LB12228:
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
.LB12229:
	movl $1, %eax
	ret
.LB1268:
	cmpb $65, %cl
	jge .LB1272
.LB12230:
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
.LB12231:
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
.LB12232:
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
	jne .LS12234f
.LS12234l:
	addq $32, %rdx
	vpcmpeqb (%rdx), %ymm15, %ymm0
	vpmovmskb %ymm0, %r9d
	testl %r9d, %r9d
	je .LS12234l
	tzcntl %r9d, %r9d
	addq %rdx, %r9
	subq %rax, %r9
	jmp .LS12234d
.LS12234f:
	tzcntl %r9d, %r9d
.LS12234d:
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
.LB12233:
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
	jmp .LB12233
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
	jne .LS12235f
.LS12235l:
	addq $32, %rdx
	vpcmpeqb (%rdx), %ymm15, %ymm0
	vpmovmskb %ymm0, %r8d
	testl %r8d, %r8d
	je .LS12235l
	tzcntl %r8d, %r8d
	addq %rdx, %r8
	subq %rax, %r8
	jmp .LS12235d
.LS12235f:
	tzcntl %r8d, %r8d
.LS12235d:
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
	jne .LS12238f
.LS12238l:
	addq $32, %rdx
	vpcmpeqb (%rdx), %ymm15, %ymm0
	vpmovmskb %ymm0, %edi
	testl %edi, %edi
	je .LS12238l
	tzcntl %edi, %edi
	addq %rdx, %rdi
	subq %rax, %rdi
	jmp .LS12238d
.LS12238f:
	tzcntl %edi, %edi
.LS12238d:
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
	jge .LB12236
.LB12237:
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
.LB12236:
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
	jne .LS12247f
.LS12247l:
	addq $32, %rdx
	vpcmpeqb (%rdx), %ymm15, %ymm0
	vpmovmskb %ymm0, %edi
	testl %edi, %edi
	je .LS12247l
	tzcntl %edi, %edi
	addq %rdx, %rdi
	subq %rax, %rdi
	jmp .LS12247d
.LS12247f:
	tzcntl %edi, %edi
.LS12247d:
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
	jge .LB12239
.LB12240:
	movslq %r12d, %rcx
	xorl %edx, %edx
	testq %rcx, %rcx
	cmovg %rcx, %rdx
	shrq $2, %rdx
	xorl %edi, %edi
.LB12241:
	testq %rdx, %rdx
	je .LB12243
.LB12242:
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
	jne .LB12242
.LB12243:
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
.LB12239:
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
.LB12244:
	testl %ecx, %ecx
	je .LB12246
.LB12245:
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
	jne .LB12245
.LB12246:
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
	jae .LB12248
.LB12249:
	movzbl %sil, %esi
	movl $8388627, %edi
	btq %rsi, %rdi
	jae .LB12248
.LB2384:
	incl %eax
	jmp .LB2383
.LB12248:
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
	jae .LB12250
.LB12251:
	movzbl %sil, %esi
	movl $8388627, %edi
	btq %rsi, %rdi
	jae .LB12250
.LB2590:
	incl %eax
	jmp .LB2589
.LB12250:
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
.LB12252:
	testl %esi, %esi
	je .LB12254
.LB12253:
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
	jne .LB12253
.LB12254:
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
.LB12259:
	testl %edx, %edx
	je .LB12261
.LB12260:
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
	jne .LB12260
.LB12261:
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
.LB12266:
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
	jge .LB12267
.LB12268:
	movslq %r13d, %rcx
	xorl %edx, %edx
	testq %rcx, %rcx
	cmovg %rcx, %rdx
	shrq $2, %rdx
	xorl %esi, %esi
.LB12269:
	testq %rdx, %rdx
	je .LB12271
.LB12270:
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
	jne .LB12270
.LB12271:
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
.LB12267:
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
.LB12272:
	testl %ecx, %ecx
	je .LB12274
.LB12273:
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
	jne .LB12273
.LB12274:
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
.LB12275:
	testq %rdx, %rdx
	je .LB12277
.LB12276:
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
	jne .LB12276
.LB12277:
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
.LB12278:
	testq %rdx, %rdx
	je .LB12280
.LB12279:
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
	jne .LB12279
.LB12280:
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
.LB12281:
	testq %rdx, %rdx
	je .LB12283
.LB12282:
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
	jne .LB12282
.LB12283:
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
.LB12284:
	testq %rdx, %rdx
	je .LB12286
.LB12285:
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
	jne .LB12285
.LB12286:
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
.LB12287:
	testq %rdx, %rdx
	je .LB12289
.LB12288:
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
	jne .LB12288
.LB12289:
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
.LB12290:
	testq %rdx, %rdx
	je .LB12292
.LB12291:
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
	jne .LB12291
.LB12292:
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
.LB12293:
	testq %rdx, %rdx
	je .LB12295
.LB12294:
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
	jne .LB12294
.LB12295:
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
.LB12296:
	testq %rdx, %rdx
	je .LB12298
.LB12297:
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
	jne .LB12297
.LB12298:
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
.LB12299:
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
	jmp .LB12299
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
.LB12300:
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
	jmp .LB12300
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
.LB12301:
	testl %eax, %eax
	je .LB12303
.LB12302:
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
	jne .LB12302
	jmp .LB12303
.LB4029:
	callq standard__io__console__flush__0__ret_voidE1
	jmp .LB4031
.LB12303:
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
	movl $13904, %eax
	callq __chkstk
	subq %rax, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
	movq %r14, -48(%rbp)
	movq %r15, -56(%rbp)
.LB11458:
	movl $96, %eax
	imulq $4, %rax, %rax
	addq $15, %rax
	andq $-16, %rax
	subq %rax, %rsp
	leaq 40(%rsp), %rbx
	leaq .LZERO(%rip), %rsi
	leaq -248(%rbp), %rdi
	movl $192, %ecx
	rep movsb
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -264(%rbp)
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -280(%rbp)
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -296(%rbp)
	leaq .LZERO(%rip), %rsi
	leaq -1072(%rbp), %rdi
	movl $773, %ecx
	rep movsb
	leaq .LZERO(%rip), %rsi
	leaq -1480(%rbp), %rdi
	movl $408, %ecx
	rep movsb
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -1496(%rbp)
	leaq -1496(%rbp), %rcx
	movl $512, %edx
	callq standard__autograd__Tape.__init__1__dataE1_ubits64__ret_thisE1
	leaq .LZERO(%rip), %rsi
	leaq -12824(%rbp), %rdi
	movl $11328, %ecx
	rep movsb
	xorl %esi, %esi
.LB11486:
	cmpl $24, %esi
	jge .LB11488
.LB11487:
	movss standard__math__PIF(%rip), %xmm0
	movabsq $1069547520, %r10
	movq %r10, %xmm1
	movslq %esi, %rax
	xorps %xmm2, %xmm2
	cvtsi2ssq %rax, %xmm2
	movl $24, %eax
	movslq %eax, %rax
	mulss %xmm0, %xmm1
	mulss %xmm2, %xmm1
	xorps %xmm2, %xmm2
	cvtsi2ssq %rax, %xmm2
	divss %xmm2, %xmm1
	movabsq $1069547520, %r10
	movq %r10, %xmm2
	mulss %xmm2, %xmm0
	movsd %xmm1, -13832(%rbp)
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	divss %xmm15, %xmm0
	movsd %xmm0, -13840(%rbp)
	cvtss2sd %xmm1, %xmm0
	movsd %xmm0, -13848(%rbp)
	callq standard__math__cos__1__doubleE1__ret_doubleE1
	cvtsd2ss %xmm0, %xmm0
	movsd -13840(%rbp), %xmm1
	mulss %xmm1, %xmm0
	movsd %xmm0, -13856(%rbp)
	movsd -13848(%rbp), %xmm0
	callq standard__math__sin__1__doubleE1__ret_doubleE1
	movsd -13840(%rbp), %xmm1
	movl %esi, %eax
	shll $1, %eax
	cvtsd2ss %xmm0, %xmm0
	movslq %eax, %rcx
	incl %eax
	movslq %eax, %rax
	mulss %xmm1, %xmm0
	movsd -13856(%rbp), %xmm1
	movss %xmm1, (%rbx,%rcx,4)
	movss %xmm0, (%rbx,%rax,4)
	xorps %xmm0, %xmm0
	movslq %esi, %rax
	movss %xmm0, -248(%rbp,%rax,4)
	movss standard__math__PIF(%rip), %xmm0
	movsd -13832(%rbp), %xmm1
	addss %xmm1, %xmm0
	cvtss2sd %xmm0, %xmm0
	callq standard__math__cos__1__doubleE1__ret_doubleE1
	cvtsd2ss %xmm0, %xmm0
	movsd -13840(%rbp), %xmm1
	mulss %xmm1, %xmm0
	movsd %xmm0, -13864(%rbp)
	movss standard__math__PIF(%rip), %xmm0
	movsd -13832(%rbp), %xmm1
	addss %xmm1, %xmm0
	cvtss2sd %xmm0, %xmm0
	callq standard__math__sin__1__doubleE1__ret_doubleE1
	movsd -13840(%rbp), %xmm1
	leal 24(%rsi), %eax
	cvtsd2ss %xmm0, %xmm0
	movl %eax, %ecx
	shll $1, %ecx
	movslq %eax, %rax
	movslq %ecx, %rdx
	incl %ecx
	incl %esi
	movslq %ecx, %rcx
	mulss %xmm1, %xmm0
	movsd -13864(%rbp), %xmm1
	movss %xmm1, (%rbx,%rdx,4)
	movss %xmm0, (%rbx,%rcx,4)
	movabsq $1065353216, %r10
	movq %r10, %xmm0
	movss %xmm0, -248(%rbp,%rax,4)
	cmpl $24, %esi
	jl .LB11487
.LB11488:
	movq $48, -264(%rbp)
	movq $2, -256(%rbp)
	movq $48, -280(%rbp)
	movq $1, -272(%rbp)
	callq standard__random__get_entropy__0__ret_dataE1_ubits64
	movq %rax, %rsi
	callq standard__random__get_entropy__0__ret_dataE1_ubits64
	movq %rax, %r8
	leaq -296(%rbp), %rcx
	movq %rsi, %rdx
	callq standard__random__pcg32_seed__3__PCG32E1_ptr1__dataE1_ubits64__dataE1_ubits64__ret_voidE1
	movl $0, -304(%rbp)
	orb $128, -300(%rbp)
	leaq -1072(%rbp), %rcx
	leaq -296(%rbp), %rax
	movl $2, %edx
	movl $32, %r8d
	movl $3, %r9d
	movq %rax, 32(%rsp)
	callq standard__neuralnet__nn_seq_add_linear__5__SequentialE1_ptr1__dataE1_ubits64__dataE1_ubits64__intE1__PCG32E1_ptr1__ret_boolE1
	leaq -1072(%rbp), %rcx
	leaq -296(%rbp), %rax
	movl $32, %edx
	movl $32, %r8d
	movl $3, %r9d
	movq %rax, 32(%rsp)
	callq standard__neuralnet__nn_seq_add_linear__5__SequentialE1_ptr1__dataE1_ubits64__dataE1_ubits64__intE1__PCG32E1_ptr1__ret_boolE1
	leaq -1072(%rbp), %rcx
	leaq -296(%rbp), %rax
	movl $32, %edx
	movl $1, %r8d
	xorl %r9d, %r9d
	movq %rax, 32(%rsp)
	callq standard__neuralnet__nn_seq_add_linear__5__SequentialE1_ptr1__dataE1_ubits64__dataE1_ubits64__intE1__PCG32E1_ptr1__ret_boolE1
	movabsq $4487126258331716666, %r10
	movq %r10, %xmm0
	leaq -1480(%rbp), %rcx
	movabsq $1000593162, %r10
	movq %r10, %xmm1
	movabsq $1063675494, %r10
	movq %r10, %xmm2
	movabsq $1065336439, %r10
	movq %r10, %xmm3
	cvtsd2ss %xmm0, %xmm0
	movss %xmm0, 32(%rsp)
	callq standard__neuralnet__adam_init__5__AdamE1_ptr1__floatE1__floatE1__floatE1__floatE1__ret_voidE1
	leaq -1480(%rbp), %rcx
	leaq -1072(%rbp), %rdx
	callq standard__neuralnet__adam_register_seq__2__AdamE1_ptr1__SequentialE1_ptr1__ret_voidE1
	leaq -12864(%rbp), %r9
	leaq -12824(%rbp), %rcx
	movl $762279764, -12864(%rbp)
	movl $1919512659, -12860(%rbp)
	movl $538995809, -12856(%rbp)
	movl $1126178861, -12852(%rbp)
	movl $1970302319, -12848(%rbp)
	movl $1769234804, -12844(%rbp)
	movl $1193307759, -12840(%rbp)
	movl $1752195442, -12836(%rbp)
	movl $1277176608, -12832(%rbp)
	movl $7566191, -12828(%rbp)
	movl $1024, %edx
	movl $768, %r8d
	callq standard__autograd_vis__vis_init__4__AutogradVisE1_ptr1__intE1__intE1__byteE1_ptr1__ret_boolE1
	leaq -12928(%rbp), %rsi
	movl $762279764, -12928(%rbp)
	movl $1919512691, -12924(%rbp)
	movl $1663069281, -12920(%rbp)
	movl $1936941420, -12916(%rbp)
	movl $1667851881, -12912(%rbp)
	movl $1869182049, -12908(%rbp)
	movl $673194094, -12904(%rbp)
	movl $859712818, -12900(%rbp)
	movl $859712818, -12896(%rbp)
	movl $826158386, -12892(%rbp)
	movl $1632903212, -12888(%rbp)
	movl $539781230, -12884(%rbp)
	movl $1835099201, -12880(%rbp)
	movl $1030908960, -12876(%rbp)
	movl $808463920, -12872(%rbp)
	movl $665909, -12868(%rbp)
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	leaq -12944(%rbp), %rsi
	movl $1885697107, -12944(%rbp)
	movl $538976288, -12940(%rbp)
	movl $1867259936, -12936(%rbp)
	movl $684915, -12932(%rbp)
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	leaq -12960(%rbp), %rsi
	movl $757935405, -12960(%rbp)
	movl $538976288, -12956(%rbp)
	movl $757932064, -12952(%rbp)
	movl $666925, -12948(%rbp)
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	xorl %esi, %esi
	xorl %edi, %edi
	movq $0, -13680(%rbp)
	movq $0, -13688(%rbp)
	movq $0, -13696(%rbp)
	xorl %r12d, %r12d
	movq $0, -13624(%rbp)
	movabsq $0, %r10
	movq %r10, -13632(%rbp)
	movq $0, -13640(%rbp)
	movq $0, -13648(%rbp)
	movq $0, -13656(%rbp)
	movq $0, -13664(%rbp)
.LB11713:
	cmpl $8000, %esi
	jge .LB11715
.LB11714:
	movl $801, %ecx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, %r13
	movl $801, %ecx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	leaq -1496(%rbp), %rdx
	movq %rbx, %r8
	movq %r13, %rcx
	movq %rax, %r14
	leaq -264(%rbp), %rax
	movl $2, %r9d
	movq %rax, 32(%rsp)
	callq standard__autograd__gt_init__5__GradTensorE1_ptr1__TapeE1_ptr1__floatE1_ptr1__dataE1_ubits64__dataE1_ptr1_ubits64__ret_voidE1
	leaq -248(%rbp), %r8
	leaq -280(%rbp), %rax
	leaq -1496(%rbp), %rdx
	movq %r14, %rcx
	movl $2, %r9d
	movq %rax, 32(%rsp)
	callq standard__autograd__gt_init__5__GradTensorE1_ptr1__TapeE1_ptr1__floatE1_ptr1__dataE1_ubits64__dataE1_ptr1_ubits64__ret_voidE1
	andb $127, 100(%r13)
	andb $127, 100(%r14)
	leaq -1072(%rbp), %rcx
	leaq -1496(%rbp), %rdx
	movq %r13, %r8
	callq standard__neuralnet__nn_seq_forward__3__SequentialE1_ptr1__standard__autograd__TapeE1_ptr1__standard__autograd__GradTensorE1_ptr1__ret_standard__autograd__GradTensorE1_ptr1
	movq %rax, %rdx
	leaq -1496(%rbp), %rcx
	movq %r14, %r8
	callq standard__neuralnet__nn_loss_mse__3__standard__autograd__TapeE1_ptr1__standard__autograd__GradTensorE1_ptr1__standard__autograd__GradTensorE1_ptr1__ret_standard__autograd__GradTensorE1_ptr1
	movq %rax, %r15
	movq (%r15), %rax
	movss (%rax), %xmm0
	movsd %xmm0, -13704(%rbp)
	testb %dil, %dil
	je .LB11754
.LB11755:
	movq %rdi, -13712(%rbp)
.LB11756:
	leaq -12824(%rbp), %rcx
	movsd -13704(%rbp), %xmm0
	movaps %xmm0, %xmm1
	callq standard__autograd_vis__vis_push_loss__2__AutogradVisE1_ptr1__floatE1__ret_voidE1
	leaq -12824(%rbp), %rcx
	callq standard__autograd_vis__vis_render__1__AutogradVisE1_ptr1__ret_voidE1
	leaq -12824(%rbp), %rcx
	callq standard__autograd_vis__GLVisBackend.vis_backend_poll__0__ret_boolE1
	movslq %esi, %rax
	movabsq $2748779070, %rcx
	imulq %rax, %rcx
	sarq $41, %rcx
	shrq $63, %rax
	addl %eax, %ecx
	imull $800, %ecx, %ecx
	movl %esi, %eax
	subl %ecx, %eax
	testl %eax, %eax
	je .LB11762
.LB11763:
	movq -13680(%rbp), %rdi
	movq -13696(%rbp), %r10
	movq %r10, -13720(%rbp)
	movq %r12, -13728(%rbp)
	movq -13624(%rbp), %r10
	movq %r10, -13736(%rbp)
	movq -13632(%rbp), %r10
	movq %r10, -13744(%rbp)
	movq -13640(%rbp), %r10
	movq %r10, -13752(%rbp)
	movq -13648(%rbp), %r10
	movq %r10, -13760(%rbp)
	movq -13656(%rbp), %r10
	movq %r10, -13768(%rbp)
	movq -13664(%rbp), %r10
	movq %r10, -13776(%rbp)
	movq -13688(%rbp), %r12
.LB11764:
	leaq -1072(%rbp), %rcx
	callq standard__neuralnet__nn_seq_zero_grad__1__SequentialE1_ptr1__ret_voidE1
	leaq -1496(%rbp), %rcx
	movq %r15, %rdx
	callq standard__autograd__backward__2__TapeE1_ptr1__GradTensorE1_ptr1__ret_voidE1
	leaq -1480(%rbp), %rcx
	leaq -1072(%rbp), %rdx
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
	leaq -1072(%rbp), %rcx
	callq standard__neuralnet__nn_seq_free_intermediates__1__SequentialE1_ptr1__ret_voidE1
	movq -1496(%rbp), %rax
	movl -1484(%rbp), %ecx
	movq %rcx, %r8
	shlq $10, %r8
	movq %rax, %rcx
	xorl %edx, %edx
	callq memset
	movl $0, -1488(%rbp)
	incl %esi
	movq %rdi, -13680(%rbp)
	movq %r12, -13688(%rbp)
	movq -13720(%rbp), %r10
	movq %r10, -13696(%rbp)
	movq -13728(%rbp), %r12
	movq -13736(%rbp), %r10
	movq %r10, -13624(%rbp)
	movq -13744(%rbp), %r10
	movq %r10, -13632(%rbp)
	movq -13752(%rbp), %r10
	movq %r10, -13640(%rbp)
	movq -13760(%rbp), %r10
	movq %r10, -13648(%rbp)
	movq -13768(%rbp), %r10
	movq %r10, -13656(%rbp)
	movq -13776(%rbp), %r10
	movq %r10, -13664(%rbp)
	movq -13712(%rbp), %rdi
	cmpl $8000, %esi
	jl .LB11714
.LB11715:
	leaq -13001(%rbp), %rsi
	movl $1635140874, -13001(%rbp)
	movl $1952544108, -12997(%rbp)
	movl $543649385, -12993(%rbp)
	movl $1969447777, -12989(%rbp)
	movl $2036556146, -12985(%rbp)
	movl $544108320, -12981(%rbp)
	movl $1767993972, -12977(%rbp)
	movl $1735289198, -12973(%rbp)
	movl $1952805664, -12969(%rbp)
	movl $170798638, -12965(%rbp)
	movb $0, -12961(%rbp)
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	movl $801, %ecx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	leaq -1496(%rbp), %rdx
	movq %rbx, %r8
	movl $2, %r9d
	movq %rax, %rsi
	leaq -264(%rbp), %rax
	movq %rsi, %rcx
	movq %rax, 32(%rsp)
	callq standard__autograd__gt_init__5__GradTensorE1_ptr1__TapeE1_ptr1__floatE1_ptr1__dataE1_ubits64__dataE1_ptr1_ubits64__ret_voidE1
	andb $127, 100(%rsi)
	leaq -1072(%rbp), %rcx
	leaq -1496(%rbp), %rdx
	movq %rsi, %r8
	callq standard__neuralnet__nn_seq_forward__3__SequentialE1_ptr1__standard__autograd__TapeE1_ptr1__standard__autograd__GradTensorE1_ptr1__ret_standard__autograd__GradTensorE1_ptr1
	xorl %edi, %edi
	xorl %ecx, %ecx
.LB11846:
	cmpq $48, %rcx
	jge .LB11848
.LB11847:
	movq (%rax), %rdx
	movss (%rdx,%rcx,4), %xmm0
	movabsq $1056964608, %r10
	movq %r10, %xmm1
	ucomiss %xmm1, %xmm0
	jb .LB11868
.LB11860:
	movss -248(%rbp,%rcx,4), %xmm1
	movabsq $1056964608, %r10
	movq %r10, %xmm2
	ucomiss %xmm2, %xmm1
	jae .LB11867
.LB11868:
.LB11869:
	movabsq $1056964608, %r10
	movq %r10, %xmm1
	ucomiss %xmm0, %xmm1
	jbe .LB11882
.LB11874:
	movss -248(%rbp,%rcx,4), %xmm0
	movabsq $1056964608, %r10
	movq %r10, %xmm1
	ucomiss %xmm0, %xmm1
	ja .LB11881
.LB11882:
.LB11883:
	incq %rcx
	cmpq $48, %rcx
	jl .LB11847
.LB11848:
	movslq %edi, %rax
	leaq -13018(%rbp), %r12
	xorps %xmm0, %xmm0
	cvtsi2ssq %rax, %xmm0
	movl $48, %eax
	movslq %eax, %rax
	xorps %xmm1, %xmm1
	cvtsi2ssq %rax, %xmm1
	movq %r12, %rcx
	divss %xmm1, %xmm0
	movabsq $1120403456, %r10
	movq %r10, %xmm1
	mulss %xmm1, %xmm0
	movsd %xmm0, -13672(%rbp)
	movl $1767993940, -13018(%rbp)
	movl $1667309678, -13014(%rbp)
	movl $1634891107, -13010(%rbp)
	movl $540703075, -13006(%rbp)
	movb $0, -13002(%rbp)
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %r12, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -13039(%rbp)
	movl .LZERO+16(%rip), %r10d
	movl %r10d, -13023(%rbp)
	movb .LZERO+20(%rip), %r10b
	movb %r10b, -13019(%rbp)
	leaq -13039(%rbp), %rdx
	movq %rdi, %rcx
	callq standard__strings__i32str__2__dataE1_sbits32__byteE1_ptr1__ret_dataE1_sbits32
	leaq -13039(%rbp), %rdi
	movq %rdi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rdi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	movl $2109216, -13043(%rbp)
	leaq -13043(%rbp), %rdi
	movq %rdi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rdi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -13064(%rbp)
	movl .LZERO+16(%rip), %r10d
	movl %r10d, -13048(%rbp)
	movb .LZERO+20(%rip), %r10b
	movb %r10b, -13044(%rbp)
	leaq -13064(%rbp), %rdx
	movl $48, %ecx
	callq standard__strings__i32str__2__dataE1_sbits32__byteE1_ptr1__ret_dataE1_sbits32
	leaq -13064(%rbp), %rdi
	movq %rdi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rdi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	movl $2629664, -13068(%rbp)
	leaq -13068(%rbp), %rdi
	movq %rdi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rdi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	leaq -13324(%rbp), %rax
	movq %rax, %rdi
	xorl %eax, %eax
	movl $256, %ecx
	rep stosb
	leaq -13324(%rbp), %rdx
	movsd -13672(%rbp), %xmm0
	movl $5, %r8d
	callq standard__strings__float2str__3__floatE1__byteE1_ptr1__dataE1_sbits32__ret_dataE1_sbits32
	leaq -13324(%rbp), %rdi
	movq %rdi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rdi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	movl $665893, -13328(%rbp)
	leaq -13328(%rbp), %rdi
	movq %rdi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rdi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	movq %rsi, %rcx
	callq standard__autograd__gt_free__1__GradTensorE1_ptr1__ret_voidE1
	movq %rsi, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	leaq -1072(%rbp), %rcx
	callq standard__neuralnet__nn_seq_free_intermediates__1__SequentialE1_ptr1__ret_voidE1
	movq -1496(%rbp), %rax
	movl -1484(%rbp), %ecx
	movq %rcx, %r8
	shlq $10, %r8
	movq %rax, %rcx
	xorl %edx, %edx
	callq memset
	leaq -248(%rbp), %r9
	leaq -1072(%rbp), %rcx
	leaq -1496(%rbp), %rdx
	movq %rbx, %r8
	movl $0, -1488(%rbp)
	movq $48, 32(%rsp)
	callq plot_boundary__5__SequentialE1_ptr1__TapeE1_ptr1__floatE1_ptr1__floatE1_ptr1__intE1__ret_voidE1
.LB11936:
	leaq -12824(%rbp), %rsi
	movq %rsi, %rcx
	callq standard__autograd_vis__GLVisBackend.vis_backend_poll__0__ret_boolE1
	testb %al, %al
	je .LB11938
.LB11937:
	leaq -12824(%rbp), %rcx
	callq standard__autograd_vis__vis_render__1__AutogradVisE1_ptr1__ret_voidE1
	jmp .LB11936
.LB11938:
	movq %rsi, %rcx
	callq standard__autograd_vis__GLVisBackend.vis_backend_shutdown__0__ret_voidE1
	leaq -1480(%rbp), %rcx
	callq standard__neuralnet__adam_free__1__AdamE1_ptr1__ret_voidE1
	leaq -1072(%rbp), %rcx
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
.LB11867:
	incl %edi
	jmp .LB11869
.LB11881:
	incl %edi
	jmp .LB11883
.LB11754:
	leaq -12824(%rbp), %rcx
	leaq -1496(%rbp), %rdx
	callq standard__autograd_vis__vis_build_graph__2__AutogradVisE1_ptr1__standard__autograd__TapeE1_ptr1__ret_voidE1
	movq $1, -13712(%rbp)
	jmp .LB11756
.LB11762:
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -13349(%rbp)
	movl .LZERO+16(%rip), %r10d
	movl %r10d, -13333(%rbp)
	movb .LZERO+20(%rip), %r10b
	movb %r10b, -13329(%rbp)
	leaq -13349(%rbp), %rdx
	movq %rsi, %rcx
	callq standard__strings__i32str__2__dataE1_sbits32__byteE1_ptr1__ret_dataE1_sbits32
	leaq -13349(%rbp), %r12
	movq %r12, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rdx, -13784(%rbp)
	movq %r12, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	movl $538976288, -13356(%rbp)
	movw $8224, -13352(%rbp)
	movb $0, -13350(%rbp)
	leaq -13356(%rbp), %rcx
	movq %rcx, -13792(%rbp)
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rdx, -13800(%rbp)
	movq -13792(%rbp), %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	leaq -13612(%rbp), %rax
	movq %rax, %rdi
	xorl %eax, %eax
	movl $256, %ecx
	rep stosb
	leaq -13612(%rbp), %rdx
	movsd -13704(%rbp), %xmm0
	movl $5, %r8d
	callq standard__strings__float2str__3__floatE1__byteE1_ptr1__dataE1_sbits32__ret_dataE1_sbits32
	leaq -13612(%rbp), %rdi
	movq %rdi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rdx, -13808(%rbp)
	movq %rdi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	movw $10, -13614(%rbp)
	leaq -13614(%rbp), %rcx
	movq %rcx, -13816(%rbp)
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rdx, -13824(%rbp)
	movq -13816(%rbp), %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	movq -13784(%rbp), %r10
	movq %r10, -13720(%rbp)
	movq -13792(%rbp), %r10
	movq %r10, -13728(%rbp)
	movq -13800(%rbp), %r10
	movq %r10, -13736(%rbp)
	movq -13704(%rbp), %r10
	movq %r10, -13744(%rbp)
	movq %rdi, -13752(%rbp)
	movq -13808(%rbp), %r10
	movq %r10, -13760(%rbp)
	movq -13816(%rbp), %r10
	movq %r10, -13768(%rbp)
	movq -13824(%rbp), %r10
	movq %r10, -13776(%rbp)
	movq %rsi, %rdi
	jmp .LB11764
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
.LB11940:
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
.LB12304:
	testl %ecx, %ecx
	je .LB12306
.LB12305:
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
	jne .LB12305
	jmp .LB12306
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
.LB12306:
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
	.globl standard__math__abs__1__dataE1_sbits8__ret_dataE1_sbits8
	.def standard__math__abs__1__dataE1_sbits8__ret_dataE1_sbits8;
	.scl 2;
	.type 32;
	.endef
standard__math__abs__1__dataE1_sbits8__ret_dataE1_sbits8:
.LB4539:
	testb %cl, %cl
	js .LB4544
.LB4545:
	movzbl %cl, %eax
	ret
.LB4544:
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
.LB4550:
	testw %cx, %cx
	js .LB4555
.LB4556:
	movzwl %cx, %eax
	ret
.LB4555:
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
.LB4561:
	testl %ecx, %ecx
	js .LB4565
.LB4566:
	movl %ecx, %eax
	ret
.LB4565:
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
.LB4571:
	testq %rcx, %rcx
	js .LB4576
.LB4577:
	movq %rcx, %rax
	ret
.LB4576:
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
.LB4582:
	xorps %xmm1, %xmm1
	ucomiss %xmm0, %xmm1
	ja .LB4586
.LB4587:
	ret
.LB4586:
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
.LB4592:
	xorps %xmm1, %xmm1
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm0, %xmm1
	ja .LB4597
.LB4598:
	ret
.LB4597:
	xorps %xmm1, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subsd %xmm15, %xmm0
	ret
	.text
	.globl standard__math__min__2__dataE1_sbits8__dataE1_sbits8__ret_dataE1_sbits8
	.def standard__math__min__2__dataE1_sbits8__dataE1_sbits8__ret_dataE1_sbits8;
	.scl 2;
	.type 32;
	.endef
standard__math__min__2__dataE1_sbits8__dataE1_sbits8__ret_dataE1_sbits8:
.LB4603:
	cmpb %dl, %cl
	jl .LB4609
.LB4610:
	movzbl %dl, %eax
	ret
.LB4609:
	movzbl %cl, %eax
	ret
	.text
	.globl standard__math__min__2__dataE1_sbits16__dataE1_sbits16__ret_dataE1_sbits16
	.def standard__math__min__2__dataE1_sbits16__dataE1_sbits16__ret_dataE1_sbits16;
	.scl 2;
	.type 32;
	.endef
standard__math__min__2__dataE1_sbits16__dataE1_sbits16__ret_dataE1_sbits16:
.LB4614:
	cmpw %dx, %cx
	jl .LB4620
.LB4621:
	movzwl %dx, %eax
	ret
.LB4620:
	movzwl %cx, %eax
	ret
	.text
	.globl standard__math__min__2__dataE1_sbits32__dataE1_sbits32__ret_dataE1_sbits32
	.def standard__math__min__2__dataE1_sbits32__dataE1_sbits32__ret_dataE1_sbits32;
	.scl 2;
	.type 32;
	.endef
standard__math__min__2__dataE1_sbits32__dataE1_sbits32__ret_dataE1_sbits32:
.LB4625:
	cmpl %edx, %ecx
	jl .LB4631
.LB4632:
	movl %edx, %eax
	ret
.LB4631:
	movl %ecx, %eax
	ret
	.text
	.globl standard__math__min__2__dataE1_sbits64__dataE1_sbits64__ret_dataE1_sbits64
	.def standard__math__min__2__dataE1_sbits64__dataE1_sbits64__ret_dataE1_sbits64;
	.scl 2;
	.type 32;
	.endef
standard__math__min__2__dataE1_sbits64__dataE1_sbits64__ret_dataE1_sbits64:
.LB4636:
	cmpq %rdx, %rcx
	jl .LB4642
.LB4643:
	movq %rdx, %rax
	ret
.LB4642:
	movq %rcx, %rax
	ret
	.text
	.globl standard__math__min__2__floatE1__floatE1__ret_floatE1
	.def standard__math__min__2__floatE1__floatE1__ret_floatE1;
	.scl 2;
	.type 32;
	.endef
standard__math__min__2__floatE1__floatE1__ret_floatE1:
.LB4647:
	ucomiss %xmm0, %xmm1
	ja .LB4653
.LB4654:
	movaps %xmm1, %xmm0
	ret
.LB4653:
	ret
	.text
	.globl standard__math__min__2__doubleE1__doubleE1__ret_doubleE1
	.def standard__math__min__2__doubleE1__doubleE1__ret_doubleE1;
	.scl 2;
	.type 32;
	.endef
standard__math__min__2__doubleE1__doubleE1__ret_doubleE1:
.LB4658:
	ucomisd %xmm0, %xmm1
	ja .LB4664
.LB4665:
	movaps %xmm1, %xmm0
	ret
.LB4664:
	ret
	.text
	.globl standard__math__max__2__dataE1_sbits8__dataE1_sbits8__ret_dataE1_sbits8
	.def standard__math__max__2__dataE1_sbits8__dataE1_sbits8__ret_dataE1_sbits8;
	.scl 2;
	.type 32;
	.endef
standard__math__max__2__dataE1_sbits8__dataE1_sbits8__ret_dataE1_sbits8:
.LB4669:
	cmpb %dl, %cl
	jg .LB4675
.LB4676:
	movzbl %dl, %eax
	ret
.LB4675:
	movzbl %cl, %eax
	ret
	.text
	.globl standard__math__max__2__dataE1_sbits16__dataE1_sbits16__ret_dataE1_sbits16
	.def standard__math__max__2__dataE1_sbits16__dataE1_sbits16__ret_dataE1_sbits16;
	.scl 2;
	.type 32;
	.endef
standard__math__max__2__dataE1_sbits16__dataE1_sbits16__ret_dataE1_sbits16:
.LB4680:
	cmpw %dx, %cx
	jg .LB4686
.LB4687:
	movzwl %dx, %eax
	ret
.LB4686:
	movzwl %cx, %eax
	ret
	.text
	.globl standard__math__max__2__dataE1_sbits32__dataE1_sbits32__ret_dataE1_sbits32
	.def standard__math__max__2__dataE1_sbits32__dataE1_sbits32__ret_dataE1_sbits32;
	.scl 2;
	.type 32;
	.endef
standard__math__max__2__dataE1_sbits32__dataE1_sbits32__ret_dataE1_sbits32:
.LB4691:
	cmpl %edx, %ecx
	jg .LB4697
.LB4698:
	movl %edx, %eax
	ret
.LB4697:
	movl %ecx, %eax
	ret
	.text
	.globl standard__math__max__2__dataE1_sbits64__dataE1_sbits64__ret_dataE1_sbits64
	.def standard__math__max__2__dataE1_sbits64__dataE1_sbits64__ret_dataE1_sbits64;
	.scl 2;
	.type 32;
	.endef
standard__math__max__2__dataE1_sbits64__dataE1_sbits64__ret_dataE1_sbits64:
.LB4702:
	cmpq %rdx, %rcx
	jg .LB4708
.LB4709:
	movq %rdx, %rax
	ret
.LB4708:
	movq %rcx, %rax
	ret
	.text
	.globl standard__math__max__2__floatE1__floatE1__ret_floatE1
	.def standard__math__max__2__floatE1__floatE1__ret_floatE1;
	.scl 2;
	.type 32;
	.endef
standard__math__max__2__floatE1__floatE1__ret_floatE1:
.LB4713:
	ucomiss %xmm1, %xmm0
	ja .LB4719
.LB4720:
	movaps %xmm1, %xmm0
	ret
.LB4719:
	ret
	.text
	.globl standard__math__max__2__doubleE1__doubleE1__ret_doubleE1
	.def standard__math__max__2__doubleE1__doubleE1__ret_doubleE1;
	.scl 2;
	.type 32;
	.endef
standard__math__max__2__doubleE1__doubleE1__ret_doubleE1:
.LB4724:
	ucomisd %xmm1, %xmm0
	ja .LB4730
.LB4731:
	movaps %xmm1, %xmm0
	ret
.LB4730:
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
.LB4735:
	movsbl %cl, %eax
	testb %cl, %cl
	jle .LB4740
.LB4741:
	cmpb $1, %cl
	je .LB4747
.LB4748:
	movl %eax, %edx
	sarl $31, %edx
	movl %eax, %edx
	shrl $31, %edx
	addl %edx, %eax
	sarl $1, %eax
	movq %rax, %rsi
	movq %rcx, %rax
.LB4758:
	cmpb %al, %sil
	je .LB4760
.LB4764:
	cmpb %al, %sil
	jge .LB4760
.LB4759:
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
	jne .LB4764
.LB4760:
	movzbl %sil, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB4747:
	movl $1, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB4740:
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
.LB4780:
	movswl %cx, %eax
	testw %cx, %cx
	jle .LB4785
.LB4786:
	cmpw $1, %cx
	je .LB4792
.LB4793:
	movl %eax, %edx
	sarl $31, %edx
	movl %eax, %edx
	shrl $31, %edx
	addl %edx, %eax
	sarl $1, %eax
	movq %rax, %rsi
	movq %rcx, %rax
.LB4803:
	cmpw %ax, %si
	je .LB4805
.LB4809:
	cmpw %ax, %si
	jge .LB4805
.LB4804:
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
	jne .LB4809
.LB4805:
	movzwl %si, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB4792:
	movl $1, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB4785:
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
.LB4825:
	testl %ecx, %ecx
	jle .LB4829
.LB4830:
	movl %ecx, %eax
	sarl $31, %eax
	movl %ecx, %eax
	shrl $31, %eax
	addl %ecx, %eax
	sarl $1, %eax
	movq %rax, %rsi
	movq %rcx, %rax
.LB4837:
	cmpl %eax, %esi
	je .LB4839
.LB4843:
	cmpl %eax, %esi
	jge .LB4839
.LB4838:
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
	jne .LB4843
.LB4839:
	movl %esi, %eax
	movq 0(%rsp), %rsi
	addq $16, %rsp
	ret
.LB4829:
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
.LB4857:
	testq %rcx, %rcx
	jle .LB4862
.LB4863:
	cmpq $1, %rcx
	je .LB4869
.LB4870:
	movl $2, %esi
	movq %rcx, %rax
	cqto
	idivq %rsi
	movq %rax, %rsi
	movq %rcx, %rax
.LB4879:
	cmpq %rax, %rsi
	je .LB4881
.LB4885:
	cmpq %rax, %rsi
	jge .LB4881
.LB4880:
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
	jne .LB4885
.LB4881:
	movq %rsi, %rax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB4869:
	movl $1, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB4862:
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
.LB4900:
	testb %cl, %cl
	jbe .LB4905
.LB4906:
	movq %rcx, %rsi
	xorl %eax, %eax
.LB4912:
	cmpb %al, %sil
	je .LB4914
.LB4913:
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
	jne .LB4913
.LB4914:
	movzbl %sil, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB4905:
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
.LB4928:
	testw %cx, %cx
	jbe .LB4933
.LB4934:
	movq %rcx, %rsi
	xorl %eax, %eax
.LB4940:
	cmpw %ax, %si
	je .LB4942
.LB4941:
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
	jne .LB4941
.LB4942:
	movzwl %si, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB4933:
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
.LB4956:
	testl %ecx, %ecx
	jbe .LB4960
.LB4961:
	movq %rcx, %rsi
	xorl %eax, %eax
.LB4966:
	cmpl %eax, %esi
	je .LB4968
.LB4967:
	movl %ecx, %eax
	xorl %edx, %edx
	divl %esi
	addl %esi, %eax
	shrl $1, %eax
	movq %rsi, %r11
	movq %rax, %rsi
	movq %r11, %rax
	cmpl %eax, %esi
	jne .LB4967
.LB4968:
	movl %esi, %eax
	movq 0(%rsp), %rsi
	addq $16, %rsp
	ret
.LB4960:
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
.LB4980:
	testq %rcx, %rcx
	jbe .LB4985
.LB4986:
	movq %rcx, %rsi
	xorl %eax, %eax
.LB4992:
	cmpq %rax, %rsi
	je .LB4994
.LB4993:
	movq %rcx, %rax
	xorl %edx, %edx
	divq %rsi
	addq %rsi, %rax
	shrq $1, %rax
	movq %rsi, %r11
	movq %rax, %rsi
	movq %r11, %rax
	cmpq %rax, %rsi
	jne .LB4993
.LB4994:
	movq %rsi, %rax
	movq 0(%rsp), %rsi
	addq $16, %rsp
	ret
.LB4985:
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
.LB5007:
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
.LB5013:
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
.LB5019:
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
.LB5052:
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
.LB5084:
	xorps %xmm1, %xmm1
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm0, %xmm1
	ja .LB5090
.LB5091:
.LB5092:
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
.LB5090:
	xorps %xmm1, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subsd %xmm15, %xmm0
	jmp .LB5092
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
.LB5121:
	movl $0, -12(%rbp)
	xorps %xmm1, %xmm1
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm0, %xmm1
	seta %sil
	movzbl %sil, %esi
	testb %sil, %sil
	jne .LB5130
.LB5131:
.LB5132:
	movabsq $1061752795, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm0, %xmm1
	jae .LB5138
.LB5139:
	leaq -12(%rbp), %rdx
	callq standard__math___trig_reduce__2__doubleE1__dataE1_ptr1_sbits32__ret_doubleE1
	movl -12(%rbp), %eax
	andl $3, %eax
	je .LB5155
	cmpl $1, %eax
	je .LB5156
	cmpl $2, %eax
	jne .LB5158
.LB5157:
	callq standard__math___sin_kernel__1__doubleE1__ret_doubleE1
	xorps %xmm1, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subsd %xmm15, %xmm0
.LB5154:
	testb %sil, %sil
	jne .LB5170
.LB5171:
	movq -8(%rbp), %rsi
	leave
	ret
.LB5130:
	xorps %xmm1, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subsd %xmm15, %xmm0
	jmp .LB5132
.LB5156:
	callq standard__math___cos_kernel__1__doubleE1__ret_doubleE1
	testb %sil, %sil
	jne .LB5170
	jmp .LB5171
.LB5155:
	callq standard__math___sin_kernel__1__doubleE1__ret_doubleE1
	testb %sil, %sil
	jne .LB5170
	jmp .LB5171
.LB5158:
	callq standard__math___cos_kernel__1__doubleE1__ret_doubleE1
	xorps %xmm1, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subsd %xmm15, %xmm0
	testb %sil, %sil
	je .LB5171
.LB5170:
	xorps %xmm1, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subsd %xmm15, %xmm0
	movq -8(%rbp), %rsi
	leave
	ret
.LB5138:
	callq standard__math___sin_kernel__1__doubleE1__ret_doubleE1
	testb %sil, %sil
	jne .LB5144
.LB5145:
	movq -8(%rbp), %rsi
	leave
	ret
.LB5144:
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
.LB5176:
	movl $0, -4(%rbp)
	xorps %xmm1, %xmm1
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm0, %xmm1
	ja .LB5183
.LB5184:
.LB5185:
	movabsq $1061752795, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm0, %xmm1
	jae .LB5191
.LB5192:
	leaq -4(%rbp), %rdx
	callq standard__math___trig_reduce__2__doubleE1__dataE1_ptr1_sbits32__ret_doubleE1
	movl -4(%rbp), %eax
	andl $3, %eax
	je .LB5201
	cmpl $1, %eax
	je .LB5202
	cmpl $2, %eax
	jne .LB5204
.LB5203:
	callq standard__math___cos_kernel__1__doubleE1__ret_doubleE1
	xorps %xmm1, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subsd %xmm15, %xmm0
	leave
	ret
.LB5183:
	xorps %xmm1, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subsd %xmm15, %xmm0
	jmp .LB5185
.LB5202:
	callq standard__math___sin_kernel__1__doubleE1__ret_doubleE1
	xorps %xmm1, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subsd %xmm15, %xmm0
	leave
	ret
.LB5201:
	callq standard__math___cos_kernel__1__doubleE1__ret_doubleE1
	leave
	ret
.LB5204:
	callq standard__math___sin_kernel__1__doubleE1__ret_doubleE1
	leave
	ret
.LB5191:
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
.LB5216:
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
.LB5222:
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
.LB5228:
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
	ja .LB5237
.LB5238:
	movsd -8(%rbp), %xmm0
	cvtss2sd %xmm0, %xmm0
	callq standard__math__sin__1__doubleE1__ret_doubleE1
	cvtsd2ss %xmm0, %xmm0
	movsd -16(%rbp), %xmm1
	divss %xmm1, %xmm0
	leave
	ret
.LB5237:
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
.LB5244:
	movsd %xmm0, -8(%rbp)
	callq standard__math__cos__1__doubleE1__ret_doubleE1
	movsd %xmm0, -16(%rbp)
	callq standard__math__abs__1__doubleE1__ret_doubleE1
	movabsq $4427486594234968593, %r10
	movq %r10, %xmm1
	ucomisd %xmm0, %xmm1
	ja .LB5252
.LB5253:
	movsd -8(%rbp), %xmm0
	callq standard__math__sin__1__doubleE1__ret_doubleE1
	movsd -16(%rbp), %xmm1
	divsd %xmm1, %xmm0
	leave
	ret
.LB5252:
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
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
.LB5415:
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
.LB5285:
	movabsq $1144091160, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm1, %xmm0
	ja .LB5290
.LB5291:
	xorps %xmm1, %xmm1
	movabsq $1144670343, %r10
	movq %r10, %xmm2
	subss %xmm2, %xmm1
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm0, %xmm1
	ja .LB5297
.LB5298:
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
	jae .LB5314
.LB5315:
	movabsq $1056964608, %r10
	movq %r10, %xmm3
	cvtss2sd %xmm3, %xmm3
	subsd %xmm3, %xmm2
	cvttsd2siq %xmm2, %rax
	movl %eax, %eax
.LB5316:
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
	je .LB5378
.LB5379:
	movq $0, -8(%rsp)
	leaq (%rsp), %rcx
	movq (%rcx), %rcx
	movq %rcx, -8(%rsp)
	shrq $52, %rcx
	andq $2047, %rcx
	movslq %eax, %rax
	addq %rax, %rcx
	testq %rcx, %rcx
	jle .LB5397
.LB5398:
	cmpq $2047, %rcx
	jge .LB5404
.LB5405:
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
.LB5314:
	movabsq $1056964608, %r10
	movq %r10, %xmm3
	cvtss2sd %xmm3, %xmm3
	addsd %xmm3, %xmm2
	cvttsd2siq %xmm2, %rax
	movl %eax, %eax
	jmp .LB5316
.LB5404:
	movabsq $9218868437227405311, %r10
	movq %r10, %xmm0
	addq $16, %rsp
	ret
.LB5397:
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	addq $16, %rsp
	ret
.LB5378:
	addq $16, %rsp
	ret
.LB5297:
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	addq $16, %rsp
	ret
.LB5290:
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
.LB5538:
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
.LB5421:
	xorps %xmm1, %xmm1
	movsd %xmm0, (%rsp)
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm0, %xmm1
	jae .LB5426
.LB5427:
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
	ja .LB5450
.LB5451:
.LB5452:
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
.LB5450:
	movabsq $1073741824, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	mulsd %xmm1, %xmm0
	decl %ecx
	jmp .LB5452
.LB5426:
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
.LB5260:
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
.LB5271:
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
.LB5544:
	ucomiss %xmm0, %xmm1
	jae .LB5550
.LB5551:
	xorps %xmm0, %xmm0
	ret
.LB5550:
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
.LB5554:
	ucomisd %xmm0, %xmm1
	jae .LB5560
.LB5561:
	xorps %xmm0, %xmm0
.LB5562:
	cvtss2sd %xmm0, %xmm0
	ret
.LB5560:
	movabsq $1065353216, %r10
	movq %r10, %xmm0
	jmp .LB5562
	.text
	.globl standard__math__sign__1__dataE1_sbits8__ret_dataE1_sbits8
	.def standard__math__sign__1__dataE1_sbits8__ret_dataE1_sbits8;
	.scl 2;
	.type 32;
	.endef
standard__math__sign__1__dataE1_sbits8__ret_dataE1_sbits8:
.LB5565:
	testb %cl, %cl
	jg .LB5570
.LB5571:
	testb %cl, %cl
	js .LB5577
.LB5578:
	xorl %eax, %eax
	ret
.LB5577:
	movl $255, %eax
	ret
.LB5570:
	movl $1, %eax
	ret
	.text
	.globl standard__math__sign__1__dataE1_sbits16__ret_dataE1_sbits16
	.def standard__math__sign__1__dataE1_sbits16__ret_dataE1_sbits16;
	.scl 2;
	.type 32;
	.endef
standard__math__sign__1__dataE1_sbits16__ret_dataE1_sbits16:
.LB5583:
	testw %cx, %cx
	jg .LB5588
.LB5589:
	testw %cx, %cx
	js .LB5595
.LB5596:
	xorl %eax, %eax
	ret
.LB5595:
	movl $65535, %eax
	ret
.LB5588:
	movl $1, %eax
	ret
	.text
	.globl standard__math__sign__1__dataE1_sbits32__ret_dataE1_sbits32
	.def standard__math__sign__1__dataE1_sbits32__ret_dataE1_sbits32;
	.scl 2;
	.type 32;
	.endef
standard__math__sign__1__dataE1_sbits32__ret_dataE1_sbits32:
.LB5601:
	testl %ecx, %ecx
	jg .LB5605
.LB5606:
	testl %ecx, %ecx
	js .LB5610
.LB5611:
	xorl %eax, %eax
	ret
.LB5610:
	movabsq $4294967295, %rax
	ret
.LB5605:
	movl $1, %eax
	ret
	.text
	.globl standard__math__sign__1__dataE1_sbits64__ret_dataE1_sbits64
	.def standard__math__sign__1__dataE1_sbits64__ret_dataE1_sbits64;
	.scl 2;
	.type 32;
	.endef
standard__math__sign__1__dataE1_sbits64__ret_dataE1_sbits64:
.LB5614:
	testq %rcx, %rcx
	jg .LB5619
.LB5620:
	testq %rcx, %rcx
	js .LB5626
.LB5627:
	xorl %eax, %eax
	ret
.LB5626:
	movq $-1, %rax
	ret
.LB5619:
	movl $1, %eax
	ret
	.text
	.globl standard__math__sign__1__floatE1__ret_floatE1
	.def standard__math__sign__1__floatE1__ret_floatE1;
	.scl 2;
	.type 32;
	.endef
standard__math__sign__1__floatE1__ret_floatE1:
.LB5632:
	xorps %xmm1, %xmm1
	ucomiss %xmm1, %xmm0
	ja .LB5636
.LB5637:
	xorps %xmm1, %xmm1
	ucomiss %xmm0, %xmm1
	ja .LB5641
.LB5642:
	xorps %xmm0, %xmm0
	ret
.LB5641:
	xorps %xmm0, %xmm0
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	subss %xmm1, %xmm0
	ret
.LB5636:
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
.LB5645:
	xorps %xmm1, %xmm1
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm1, %xmm0
	ja .LB5650
.LB5651:
	xorps %xmm1, %xmm1
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm0, %xmm1
	ja .LB5657
.LB5658:
	xorps %xmm0, %xmm0
	cvtss2sd %xmm0, %xmm0
	ret
.LB5657:
	xorps %xmm0, %xmm0
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	subss %xmm1, %xmm0
	cvtss2sd %xmm0, %xmm0
	ret
.LB5650:
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
.LB5663:
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
.LB5668:
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
.LB5684:
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
.LB5732:
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
.LB5742:
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
.LB5780:
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
.LB5789:
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
.LB8342:
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
.LB8361:
	movl 8(%rcx), %eax
	cmpl 12(%rcx), %eax
	jge .LB8367
.LB8368:
	movl 8(%rcx), %eax
	leal 1(%rax), %edx
	movl %edx, 8(%rcx)
	ret
.LB8367:
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
.LB8379:
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
.LB5804:
	movl $1, %eax
	xorl %esi, %esi
.LB5810:
	cmpq %rcx, %rsi
	jae .LB5812
.LB5811:
	movslq %esi, %rdi
	imulq (%rdx,%rdi,8), %rax
	incq %rsi
	cmpq %rcx, %rsi
	jb .LB5811
.LB5812:
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
.LB5826:
	movq %rcx, %rsi
	movq %r8, %rdi
	movq 48(%rbp), %rax
	movq %r9, 16(%rsi)
	xorl %ecx, %ecx
	testq %r9, %r9
	cmova %r9, %rcx
	shrq $2, %rcx
	xorl %edx, %edx
.LB12313:
	testq %rcx, %rcx
	je .LB12315
.LB12314:
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
	jne .LB12314
.LB12315:
.LB5838:
	cmpq %r9, %rdx
	jae .LB5840
.LB5839:
	movslq %edx, %rcx
	movq (%rax,%rcx,8), %r8
	movq %r8, 24(%rsi,%rcx,8)
	incq %rdx
	cmpq %r9, %rdx
	jb .LB5839
.LB5840:
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
.LB5903:
	movq %rcx, %rsi
	movq %rdx, 16(%rsi)
	xorl %eax, %eax
	testq %rdx, %rdx
	cmova %rdx, %rax
	shrq $2, %rax
	xorl %ecx, %ecx
.LB12316:
	testq %rax, %rax
	je .LB12318
.LB12317:
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
	jne .LB12317
.LB12318:
.LB5913:
	cmpq %rdx, %rcx
	jae .LB5915
.LB5914:
	movslq %ecx, %rax
	movq (%r8,%rax,8), %rdi
	movq %rdi, 24(%rsi,%rax,8)
	incq %rcx
	cmpq %rdx, %rcx
	jb .LB5914
.LB5915:
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
.LB5976:
	movq %rcx, %rsi
	movq (%rsi), %rax
	movq STDLIB_GVP(%rip), %rcx
	cmpq %rcx, %rax
	jne .LB5987
.LB5989:
	movq 8(%rsi), %rax
	movq STDLIB_GVP(%rip), %rcx
	cmpq %rcx, %rax
	jne .LB6008
.LB6009:
	movq -8(%rbp), %rsi
	leave
	ret
.LB5987:
	movq %rax, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movq STDLIB_GVP(%rip), %rax
	movq %rax, (%rsi)
	jmp .LB5989
.LB6008:
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
.LB6020:
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
.LB6027:
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
.LB6041:
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
.LB6048:
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
.LB12319:
	testq %rcx, %rcx
	je .LB12321
.LB12320:
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
	jne .LB12320
.LB12321:
.LB6071:
	cmpq %rax, %rdx
	jae .LB6073
.LB6072:
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
	jb .LB6072
.LB6073:
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
.LB6137:
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
.LB12322:
	testq %rcx, %rcx
	je .LB12324
.LB12323:
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
	jne .LB12323
.LB12324:
.LB6160:
	cmpq %rax, %rdx
	jae .LB6162
.LB6161:
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
	jb .LB6161
.LB6162:
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
.LB6226:
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
.LB12325:
	testq %rcx, %rcx
	je .LB12327
.LB12326:
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
	jne .LB12326
.LB12327:
.LB6249:
	cmpq %rax, %rdx
	jae .LB6251
.LB6250:
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
	jb .LB6250
.LB6251:
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
.LB6315:
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
.LB6370:
	cmpq %rsi, %r8
	jae .LB6372
.LB6371:
	movq %r8, %r12
	imulq %rdi, %r12
	movq %r8, %r13
	imulq %rbx, %r13
	movq %r9, -144(%rbp)
	xorl %r9d, %r9d
.LB6377:
	cmpq %rbx, %r9
	jae .LB6379
.LB6378:
	movq $0, -152(%rbp)
	xorps %xmm0, %xmm0
.LB6384:
	movq -152(%rbp), %r14
	cmpq %rdi, %r14
	jae .LB6386
.LB6385:
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
	jmp .LB6384
.LB6372:
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
.LB6379:
	incq %r8
	movq -144(%rbp), %r9
	cmpq %rsi, %r8
	jb .LB6371
	jmp .LB6372
.LB6386:
	leaq (%r13,%r9), %r14
	movss %xmm0, (%rdx,%r14,4)
	incq %r9
	movq -152(%rbp), %r10
	movq %r10, -144(%rbp)
	cmpq %rbx, %r9
	jb .LB6378
	jmp .LB6379
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
.LB6517:
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
.LB6539:
	cmpq %rax, %rcx
	jae .LB6541
.LB6540:
	movq (%rdi), %rdx
	movslq %ecx, %r8
	movss (%rdx,%r8,4), %xmm0
	xorps %xmm1, %xmm1
	ucomiss %xmm1, %xmm0
	ja .LB6554
.LB6555:
	xorps %xmm0, %xmm0
.LB6556:
	movq (%rbx), %rdx
	movss %xmm0, (%rdx,%rcx,4)
	incq %rcx
	cmpq %rax, %rcx
	jb .LB6540
.LB6541:
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
.LB6554:
	jmp .LB6556
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
.LB6604:
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
.LB6626:
	cmpq %r12, %r13
	jae .LB6628
.LB6627:
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
	jb .LB6627
.LB6628:
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
.LB6679:
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
.LB6701:
	cmpq %r12, %r13
	jae .LB6703
.LB6702:
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
	jb .LB6702
.LB6703:
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
.LB6754:
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
.LB6775:
	cmpq %rax, %rdx
	jae .LB6777
.LB6776:
	movslq %edx, %r8
	movss (%rcx,%r8,4), %xmm1
	addss %xmm1, %xmm0
	incq %rdx
	cmpq %rax, %rdx
	jb .LB6776
.LB6777:
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
.LB6829:
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
.LB12328:
	testq %rcx, %rcx
	je .LB12330
.LB12329:
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
	jne .LB12329
.LB12330:
.LB6852:
	cmpq %rax, %rdx
	jae .LB6854
.LB6853:
	movq (%rdi), %rcx
	movslq %edx, %r8
	movss (%rcx,%r8,4), %xmm0
	movsd -32(%rbp), %xmm1
	movq (%rbx), %rcx
	mulss %xmm1, %xmm0
	movss %xmm0, (%rcx,%rdx,4)
	incq %rdx
	cmpq %rax, %rdx
	jb .LB6853
.LB6854:
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
.LB6909:
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
.LB6959:
	movq -360(%rbp), %rax
	testl %eax, %eax
	js .LB6961
.LB6960:
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
	ja .LB7001
	leaq .LJT12337(%rip), %r10
	jmpq *(%r10,%r11,8)
.LB7000:
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
.LB8037:
	movq -408(%rbp), %rax
	cmpq %r13, %rax
	jae .LB8039
.LB8038:
	xorl %eax, %eax
	movabsq $0, %r10
	movq %r10, -1000(%rbp)
	movabsq $0, %r10
	movq %r10, -1008(%rbp)
	movq -472(%rbp), %rcx
.LB8048:
	cmpq %r12, %rax
	jae .LB8050
.LB8049:
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
	jb .LB8049
	jmp .LB8050
.LB6961:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB8039:
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
.LB6986:
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
	jmp .LB6959
.LB8050:
	movzbl 100(%rdi), %r8d
	shrq $7, %r8
	testb %r8b, %r8b
	jne .LB8086
.LB8088:
	movq -800(%rbp), %r8
	movq 48(%r8), %r8
	movq %r8, -792(%rbp)
	movq STDLIB_GVP(%rip), %r8
	movq -792(%rbp), %r9
	cmpq %r8, %r9
	jne .LB8118
.LB8120:
	movzbl 100(%rsi), %r8d
	shrq $7, %r8
	testb %r8b, %r8b
	jne .LB8135
.LB8136:
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
.LB8137:
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
	jmp .LB8037
.LB8086:
	movq 8(%rdi), %r8
	movl -408(%rbp), %r9d
	movslq %r9d, %r9
	movss (%r8,%r9,4), %xmm0
	movsd -1000(%rbp), %xmm1
	movq -408(%rbp), %r9
	addss %xmm1, %xmm0
	movss %xmm0, (%r8,%r9,4)
	jmp .LB8088
.LB8118:
	movl -408(%rbp), %r8d
	movq -792(%rbp), %r9
	movslq %r8d, %r8
	movss (%r9,%r8,4), %xmm0
	movsd -1008(%rbp), %xmm1
	movq -408(%rbp), %r8
	addss %xmm1, %xmm0
	movss %xmm0, (%r9,%r8,4)
	jmp .LB8120
.LB8135:
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
.LB8145:
	cmpq %r12, %r8
	jae .LB8147
.LB8146:
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
	jb .LB8146
.LB8147:
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
.LB8202:
	cmpq %r12, %r8
	jae .LB8204
.LB8203:
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
	jb .LB8203
.LB8204:
	movl -408(%rbp), %eax
	xorl %r8d, %r8d
	movsd -992(%rbp), %xmm2
	movq -512(%rbp), %r10
	movq %r10, -776(%rbp)
.LB8236:
	cmpq %r12, %r8
	jae .LB8238
.LB8237:
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
	jb .LB8237
.LB8238:
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
	jmp .LB8137
.LB6999:
	movq -800(%rbp), %rax
	movq 16(%rax), %r12
	movq 80(%rax), %rdi
	movzbl 100(%r12), %eax
	shrq $7, %rax
	testb %al, %al
	jne .LB7957
.LB7958:
	movq -144(%rbp), %rsi
.LB7959:
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
	jmp .LB6986
.LB7957:
	xorl %eax, %eax
	testq %rsi, %rsi
	cmova %rsi, %rax
	shrq $2, %rax
	xorl %ecx, %ecx
.LB12334:
	testq %rax, %rax
	je .LB12336
.LB12335:
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
	jne .LB12335
.LB12336:
.LB7961:
	cmpq %rsi, %rcx
	jae .LB7963
.LB7962:
	movq 8(%r12), %rax
	movslq %ecx, %r8
	movss (%rax,%r8,4), %xmm0
	movss (%rdx,%r8,4), %xmm1
	movss (%rdi,%r8,4), %xmm2
	vfmadd231ss %xmm1, %xmm2, %xmm0
	movss %xmm0, (%rax,%rcx,4)
	incq %rcx
	cmpq %rsi, %rcx
	jb .LB7962
.LB7963:
	movq %rcx, %rsi
	jmp .LB7959
.LB6998:
	movq -800(%rbp), %rax
	movq 16(%rax), %r12
	movzbl 100(%r12), %eax
	shrq $7, %rax
	testb %al, %al
	jne .LB7828
.LB7829:
	movq -144(%rbp), %rax
	movq -152(%rbp), %rcx
	movsd -168(%rbp), %xmm0
	movq -256(%rbp), %rdx
	movq -264(%rbp), %rsi
.LB7830:
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
	jmp .LB6986
.LB7828:
	movq 24(%rcx), %rax
	movq %rax, -888(%rbp)
	movq 32(%rcx), %rsi
	xorl %eax, %eax
	movq -152(%rbp), %rdi
	movsd -168(%rbp), %xmm0
.LB7844:
	movq -888(%rbp), %r8
	cmpq %r8, %rax
	jae .LB7846
.LB7845:
	movq %rax, %rdi
	imulq %rsi, %rdi
	xorl %r8d, %r8d
	xorps %xmm0, %xmm0
.LB7851:
	cmpq %rsi, %r8
	jae .LB7853
.LB7852:
	leaq (%rdi,%r8), %r9
	movslq %r9d, %r9
	movss (%rdx,%r9,4), %xmm1
	movq (%rcx), %rbx
	movss (%rbx,%r9,4), %xmm2
	mulss %xmm2, %xmm1
	addss %xmm1, %xmm0
	incq %r8
	cmpq %rsi, %r8
	jb .LB7852
	jmp .LB7853
.LB7846:
	movq %rdi, %rcx
	movq -888(%rbp), %rdx
	jmp .LB7830
.LB7853:
	movq %rax, %rdi
	imulq %rsi, %rdi
	xorl %r8d, %r8d
	testq %rsi, %rsi
	cmova %rsi, %r8
	shrq $2, %r8
	xorl %r9d, %r9d
.LB12331:
	testq %r8, %r8
	je .LB12333
.LB12332:
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
	jne .LB12332
.LB12333:
.LB7884:
	cmpq %rsi, %r9
	jae .LB7886
.LB7885:
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
	jb .LB7885
.LB7886:
	incq %rax
	movq %r9, %rdi
	jmp .LB7844
.LB6997:
	movq -800(%rbp), %rax
	movq 16(%rax), %r12
	xorl %r14d, %r14d
.LB7773:
	cmpq %rsi, %r14
	jae .LB7775
.LB7774:
	movzbl 100(%r12), %eax
	shrq $7, %rax
	testb %al, %al
	jne .LB7783
.LB7785:
	incq %r14
	cmpq %rsi, %r14
	jb .LB7774
.LB7775:
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
	jmp .LB6986
.LB7783:
	movq 8(%r12), %rax
	movslq %r14d, %rcx
	movss (%rax,%rcx,4), %xmm0
	movss (%rdx,%rcx,4), %xmm1
	movq (%r12), %rdi
	movss (%rdi,%rcx,4), %xmm2
	divss %xmm2, %xmm1
	addss %xmm1, %xmm0
	movss %xmm0, (%rax,%r14,4)
	jmp .LB7785
.LB6996:
	movq -800(%rbp), %rax
	movq 16(%rax), %r12
	xorl %r14d, %r14d
.LB7730:
	cmpq %rsi, %r14
	jae .LB7732
.LB7731:
	movzbl 100(%r12), %eax
	shrq $7, %rax
	testb %al, %al
	jne .LB7740
.LB7742:
	incq %r14
	cmpq %rsi, %r14
	jb .LB7731
.LB7732:
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
	jmp .LB6986
.LB7740:
	movq 8(%r12), %rax
	movslq %r14d, %rcx
	movss (%rax,%rcx,4), %xmm0
	movss (%rdx,%rcx,4), %xmm1
	subss %xmm1, %xmm0
	movss %xmm0, (%rax,%r14,4)
	jmp .LB7742
.LB6995:
	movq -800(%rbp), %rax
	movq 16(%rax), %r12
	movss 36(%rax), %xmm1
	xorl %r14d, %r14d
.LB7685:
	cmpq %rsi, %r14
	jae .LB7687
.LB7686:
	movzbl 100(%r12), %eax
	shrq $7, %rax
	testb %al, %al
	jne .LB7695
.LB7697:
	incq %r14
	cmpq %rsi, %r14
	jb .LB7686
.LB7687:
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
	jmp .LB6986
.LB7695:
	movq 8(%r12), %rax
	movslq %r14d, %rcx
	movss (%rax,%rcx,4), %xmm0
	movss (%rdx,%rcx,4), %xmm2
	vfmadd231ss %xmm2, %xmm1, %xmm0
	movss %xmm0, (%rax,%r14,4)
	jmp .LB7697
.LB6994:
	movq -800(%rbp), %rax
	movq 16(%rax), %r12
	movss (%rdx), %xmm3
	movq 88(%r12), %r13
	xorl %r14d, %r14d
.LB7642:
	cmpq %r13, %r14
	jae .LB7644
.LB7643:
	movzbl 100(%r12), %eax
	shrq $7, %rax
	testb %al, %al
	jne .LB7652
.LB7654:
	incq %r14
	cmpq %r13, %r14
	jb .LB7643
.LB7644:
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
	jmp .LB6986
.LB7652:
	movq 8(%r12), %rax
	movslq %r14d, %rcx
	movss (%rax,%rcx,4), %xmm0
	addss %xmm3, %xmm0
	movss %xmm0, (%rax,%r14,4)
	jmp .LB7654
.LB6993:
	movq -800(%rbp), %rax
	movq 16(%rax), %r12
	movsd -120(%rbp), %xmm2
	xorl %r14d, %r14d
.LB7579:
	cmpq %rsi, %r14
	jae .LB7581
.LB7580:
	movzbl 100(%r12), %eax
	shrq $7, %rax
	testb %al, %al
	jne .LB7589
.LB7590:
.LB7591:
	incq %r14
	cmpq %rsi, %r14
	jb .LB7580
.LB7581:
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
	jmp .LB6986
.LB7589:
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
	jmp .LB7591
.LB6992:
	movq -800(%rbp), %rax
	movq 16(%rax), %r12
	movsd -112(%rbp), %xmm1
	xorl %r14d, %r14d
.LB7523:
	cmpq %rsi, %r14
	jae .LB7525
.LB7524:
	movzbl 100(%r12), %eax
	shrq $7, %rax
	testb %al, %al
	jne .LB7533
.LB7534:
.LB7535:
	incq %r14
	cmpq %rsi, %r14
	jb .LB7524
.LB7525:
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
	jmp .LB6986
.LB7533:
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
	jmp .LB7535
.LB6991:
	movq -800(%rbp), %rax
	movq 16(%rax), %r12
	xorl %r14d, %r14d
.LB7467:
	cmpq %rsi, %r14
	jae .LB7469
.LB7468:
	movzbl 100(%r12), %eax
	shrq $7, %rax
	testb %al, %al
	jne .LB7477
.LB7479:
	incq %r14
	cmpq %rsi, %r14
	jb .LB7468
.LB7469:
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
	jmp .LB6986
.LB7477:
	movq 8(%r12), %rax
	movslq %r14d, %rcx
	movss (%rax,%rcx,4), %xmm0
	movq (%r12), %rax
	movss (%rax,%rcx,4), %xmm1
	xorps %xmm2, %xmm2
	ucomiss %xmm2, %xmm1
	ja .LB7497
.LB7498:
	xorps %xmm1, %xmm1
.LB7499:
	addss %xmm1, %xmm0
	movq 8(%r12), %rax
	movss %xmm0, (%rax,%r14,4)
	jmp .LB7479
.LB7497:
	movslq %r14d, %rax
	movss (%rdx,%rax,4), %xmm1
	jmp .LB7499
.LB6990:
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
	jne .LB7285
.LB7286:
	movsd -96(%rbp), %xmm0
	movq -144(%rbp), %rax
	movq -152(%rbp), %rcx
	movq -160(%rbp), %r8
.LB7287:
	movq -936(%rbp), %r9
	movzbl 100(%r9), %r9d
	shrq $7, %r9
	testb %r9b, %r9b
	jne .LB7366
.LB7367:
	movsd %xmm0, -904(%rbp)
	movq %rax, -912(%rbp)
	movq %rcx, -920(%rbp)
	movq %r8, -928(%rbp)
.LB7368:
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
	jmp .LB6986
.LB7285:
	movsd -96(%rbp), %xmm0
	movq $0, -960(%rbp)
	movq -152(%rbp), %rcx
	movq -160(%rbp), %r8
.LB7289:
	movq -960(%rbp), %rax
	cmpq %rbx, %rax
	jae .LB7291
.LB7290:
	movq -960(%rbp), %rax
	movq %rax, %r8
	imulq %r13, %r8
	imulq %r12, %rax
	movq %rax, -968(%rbp)
	xorl %eax, %eax
.LB7296:
	cmpq %r12, %rax
	jae .LB7298
.LB7297:
	movq %rax, %rcx
	imulq %r13, %rcx
	xorps %xmm0, %xmm0
	xorl %r9d, %r9d
.LB7303:
	cmpq %r13, %r9
	jae .LB7305
.LB7304:
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
	jb .LB7304
	jmp .LB7305
.LB7291:
	movq -960(%rbp), %rax
	jmp .LB7287
.LB7366:
	xorl %r8d, %r8d
.LB7370:
	cmpq %r12, %r8
	jae .LB7372
.LB7371:
	movq %r8, %rcx
	imulq %r13, %rcx
	movq %rcx, -952(%rbp)
	xorl %ecx, %ecx
.LB7377:
	cmpq %r13, %rcx
	jae .LB7379
.LB7378:
	xorps %xmm0, %xmm0
	xorl %eax, %eax
.LB7384:
	cmpq %rbx, %rax
	jae .LB7386
.LB7385:
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
	jb .LB7385
	jmp .LB7386
.LB7372:
	movsd %xmm0, -904(%rbp)
	movq %rax, -912(%rbp)
	movq %rcx, -920(%rbp)
	movq %r8, -928(%rbp)
	jmp .LB7368
.LB7379:
	incq %r8
	cmpq %r12, %r8
	jb .LB7371
	jmp .LB7372
.LB7386:
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
	jb .LB7378
	jmp .LB7379
.LB7298:
	movq -960(%rbp), %r8
	incq %r8
	movq %r8, -960(%rbp)
	movq %rax, %r8
	jmp .LB7289
.LB7305:
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
	jb .LB7297
	jmp .LB7298
.LB6989:
	movq -800(%rbp), %rax
	movq 16(%rax), %rcx
	movq 24(%rax), %rax
	xorl %r14d, %r14d
.LB7167:
	cmpq %rsi, %r14
	jae .LB7169
.LB7168:
	movzbl 100(%rcx), %edi
	shrq $7, %rdi
	testb %dil, %dil
	jne .LB7177
.LB7179:
	movzbl 100(%rax), %edi
	shrq $7, %rdi
	testb %dil, %dil
	jne .LB7215
.LB7217:
	incq %r14
	cmpq %rsi, %r14
	jb .LB7168
.LB7169:
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
	jmp .LB6986
.LB7177:
	movq 8(%rcx), %rdi
	movslq %r14d, %r8
	movss (%rdi,%r8,4), %xmm0
	movss (%rdx,%r8,4), %xmm1
	movq (%rax), %r9
	movss (%r9,%r8,4), %xmm2
	vfmadd231ss %xmm1, %xmm2, %xmm0
	movss %xmm0, (%rdi,%r14,4)
	jmp .LB7179
.LB7215:
	movq 8(%rax), %rdi
	movslq %r14d, %r8
	movss (%rdi,%r8,4), %xmm0
	movss (%rdx,%r8,4), %xmm1
	movq (%rcx), %r9
	movss (%r9,%r8,4), %xmm2
	vfmadd231ss %xmm1, %xmm2, %xmm0
	movss %xmm0, (%rdi,%r14,4)
	jmp .LB7217
.LB6988:
	movq -800(%rbp), %rax
	movq 16(%rax), %rcx
	movq 24(%rax), %rax
	xorl %r14d, %r14d
.LB7090:
	cmpq %rsi, %r14
	jae .LB7092
.LB7091:
	movzbl 100(%rcx), %edi
	shrq $7, %rdi
	testb %dil, %dil
	jne .LB7100
.LB7102:
	movzbl 100(%rax), %edi
	shrq $7, %rdi
	testb %dil, %dil
	jne .LB7129
.LB7131:
	incq %r14
	cmpq %rsi, %r14
	jb .LB7091
.LB7092:
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
	jmp .LB6986
.LB7100:
	movq 8(%rcx), %rdi
	movslq %r14d, %r8
	movss (%rdi,%r8,4), %xmm0
	movss (%rdx,%r8,4), %xmm1
	addss %xmm1, %xmm0
	movss %xmm0, (%rdi,%r14,4)
	jmp .LB7102
.LB7129:
	movq 8(%rax), %rdi
	movslq %r14d, %r8
	movss (%rdi,%r8,4), %xmm0
	movss (%rdx,%r8,4), %xmm1
	subss %xmm1, %xmm0
	movss %xmm0, (%rdi,%r14,4)
	jmp .LB7131
.LB6987:
	movq -800(%rbp), %rax
	movq 16(%rax), %rcx
	movq 24(%rax), %rax
	xorl %r14d, %r14d
.LB7013:
	cmpq %rsi, %r14
	jae .LB7015
.LB7014:
	movzbl 100(%rcx), %edi
	shrq $7, %rdi
	testb %dil, %dil
	jne .LB7023
.LB7025:
	movzbl 100(%rax), %edi
	shrq $7, %rdi
	testb %dil, %dil
	jne .LB7052
.LB7054:
	incq %r14
	cmpq %rsi, %r14
	jb .LB7014
.LB7015:
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
	jmp .LB6986
.LB7023:
	movq 8(%rcx), %rdi
	movslq %r14d, %r8
	movss (%rdi,%r8,4), %xmm0
	movss (%rdx,%r8,4), %xmm1
	addss %xmm1, %xmm0
	movss %xmm0, (%rdi,%r14,4)
	jmp .LB7025
.LB7052:
	movq 8(%rax), %rdi
	movslq %r14d, %r8
	movss (%rdi,%r8,4), %xmm0
	movss (%rdx,%r8,4), %xmm1
	addss %xmm1, %xmm0
	movss %xmm0, (%rdi,%r14,4)
	jmp .LB7054
.LB7001:
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
	jmp .LB6986
	.section .rodata
	.p2align 3
.LJT12337:
	.quad .LB6987
	.quad .LB6988
	.quad .LB6989
	.quad .LB6990
	.quad .LB6991
	.quad .LB6992
	.quad .LB6993
	.quad .LB6994
	.quad .LB6995
	.quad .LB6996
	.quad .LB6997
	.quad .LB6998
	.quad .LB6999
	.quad .LB7000
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
.LB8390:
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
.LB8401:
	cmpq %rdi, %r12
	jae .LB8403
.LB8402:
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
	ja .LB8418
.LB8419:
	movsd -48(%rbp), %xmm0
.LB8420:
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
	jb .LB8402
.LB8403:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB8418:
	movabsq $4502148214488346440, %r10
	movq %r10, %xmm0
	cvtsd2ss %xmm0, %xmm0
	jmp .LB8420
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
.LB8443:
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
.LB8457:
	cmpq %rdi, %r12
	jae .LB8459
.LB8458:
	xorps %xmm0, %xmm0
	movsd -40(%rbp), %xmm2
	subss %xmm2, %xmm0
	movq %rbx, %rcx
	movaps %xmm0, %xmm1
	callq standard__random__random_range_float__3__PCG32E1_ptr1__floatE1__floatE1__ret_floatE1
	movss %xmm0, (%rsi,%r12,4)
	incq %r12
	cmpq %rdi, %r12
	jb .LB8458
.LB8459:
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
.LB8474:
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
.LB8483:
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
	je .LB8518
.LB8519:
	testl %r12d, %r12d
	je .LB8531
.LB8532:
	movq (%rsi), %rcx
	movq %r13, 32(%rsp)
	movq %r14, %rdx
	movq %rdi, %r8
	movq %rbx, %r9
	callq standard__neuralnet__nn_init_xavier__5__floatE1_ptr1__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__PCG32E1_ptr1__ret_voidE1
.LB8520:
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
.LB8531:
	xorl %edi, %edi
.LB8534:
	cmpq %r14, %rdi
	jae .LB8520
.LB8535:
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
	jb .LB8535
	jmp .LB8520
.LB8518:
	movq (%rsi), %rcx
	movq %r14, %rdx
	movq %rdi, %r8
	movq %r13, %r9
	callq standard__neuralnet__nn_init_he__4__floatE1_ptr1__dataE1_ubits64__dataE1_ubits64__PCG32E1_ptr1__ret_voidE1
	jmp .LB8520
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
.LB8568:
	movq %rcx, %rsi
	movq (%rsi), %rax
	movq STDLIB_GVP(%rip), %rcx
	cmpq %rcx, %rax
	jne .LB8579
.LB8581:
	movq 8(%rsi), %rax
	movq STDLIB_GVP(%rip), %rcx
	cmpq %rcx, %rax
	jne .LB8600
.LB8601:
	movq -8(%rbp), %rsi
	leave
	ret
.LB8579:
	movq %rax, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movq STDLIB_GVP(%rip), %rax
	movq %rax, (%rsi)
	jmp .LB8581
.LB8600:
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
.LB8612:
	movq %rcx, %rsi
	movq 80(%rsi), %rax
	movq 72(%rsi), %rcx
	cmpq %rcx, %rax
	je .LB8639
.LB8625:
	movq STDLIB_GVP(%rip), %rcx
	cmpq %rcx, %rax
	jne .LB8637
.LB8639:
	movq 72(%rsi), %rax
	movq STDLIB_GVP(%rip), %rcx
	movq %rax, %rdi
	cmpq %rcx, %rdi
	jne .LB8657
.LB8659:
	movq 64(%rsi), %rax
	movq STDLIB_GVP(%rip), %rcx
	movq %rax, %rdi
	cmpq %rcx, %rdi
	jne .LB8677
.LB8679:
	movq 56(%rsi), %rax
	movq STDLIB_GVP(%rip), %rcx
	movq %rax, %rdi
	cmpq %rcx, %rdi
	jne .LB8697
.LB8699:
	movq 40(%rsi), %rax
	movq STDLIB_GVP(%rip), %rcx
	movq %rax, %rdi
	cmpq %rcx, %rdi
	jne .LB8717
.LB8719:
	movq 48(%rsi), %rax
	movq STDLIB_GVP(%rip), %rcx
	movq %rax, %rdi
	cmpq %rcx, %rdi
	jne .LB8737
.LB8738:
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB8637:
	movq 80(%rsi), %rdi
	movq %rdi, %rcx
	callq standard__autograd__gt_free__1__GradTensorE1_ptr1__ret_voidE1
	movq %rdi, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movq STDLIB_GVP(%rip), %rax
	movq %rax, 80(%rsi)
	jmp .LB8639
.LB8657:
	movq %rax, %rcx
	callq standard__autograd__gt_free__1__GradTensorE1_ptr1__ret_voidE1
	movq %rdi, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movq STDLIB_GVP(%rip), %rax
	movq %rax, 72(%rsi)
	jmp .LB8659
.LB8677:
	movq %rax, %rcx
	callq standard__autograd__gt_free__1__GradTensorE1_ptr1__ret_voidE1
	movq %rdi, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movq STDLIB_GVP(%rip), %rax
	movq %rax, 64(%rsi)
	jmp .LB8679
.LB8697:
	movq %rax, %rcx
	callq standard__autograd__gt_free__1__GradTensorE1_ptr1__ret_voidE1
	movq %rdi, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movq STDLIB_GVP(%rip), %rax
	movq %rax, 56(%rsi)
	jmp .LB8699
.LB8717:
	movq %rax, %rcx
	callq standard__autograd__gt_free__1__GradTensorE1_ptr1__ret_voidE1
	movq %rdi, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movq STDLIB_GVP(%rip), %rax
	movq %rax, 40(%rsi)
	jmp .LB8719
.LB8737:
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
.LB8748:
	movq %rcx, %rsi
	movq 40(%rsi), %rax
	movq STDLIB_GVP(%rip), %rcx
	cmpq %rcx, %rax
	jne .LB8759
.LB8761:
	movq 48(%rsi), %rax
	movq STDLIB_GVP(%rip), %rcx
	cmpq %rcx, %rax
	jne .LB8775
.LB8776:
	movq -8(%rbp), %rsi
	leave
	ret
.LB8759:
	movq %rax, %rcx
	callq standard__autograd__gt_zero_grad__1__GradTensorE1_ptr1__ret_voidE1
	jmp .LB8761
.LB8775:
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
.LB8782:
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
.LB8818:
	cmpq %r12, %rax
	jae .LB8820
.LB8819:
	movq %rax, %rcx
	imulq %rbx, %rcx
	xorl %edx, %edx
	testq %rbx, %rbx
	cmova %rbx, %rdx
	shrq $2, %rdx
	xorl %r8d, %r8d
.LB12338:
	testq %rdx, %rdx
	je .LB12340
.LB12339:
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
	jne .LB12339
	jmp .LB12340
.LB8820:
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
.LB8916:
	cmpq %rdi, %rax
	jae .LB8918
.LB8917:
	movq %rax, %rcx
	imulq %r12, %rcx
	xorl %edx, %edx
	testq %r12, %r12
	cmova %r12, %rdx
	shrq $2, %rdx
	xorl %r8d, %r8d
.LB12341:
	testq %rdx, %rdx
	je .LB12343
.LB12342:
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
	jne .LB12342
	jmp .LB12343
.LB8918:
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
	je .LB8987
.LB8988:
	cmpl $2, %ecx
	je .LB9004
.LB9005:
	cmpl $3, %ecx
	je .LB9020
.LB9021:
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
.LB9020:
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
.LB9004:
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
.LB8987:
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
.LB12343:
.LB8923:
	cmpq %r12, %r8
	jae .LB8925
.LB8924:
	movq 8(%rsi), %rdx
	movslq %r8d, %r9
	movss (%rdx,%r9,4), %xmm0
	leaq (%rcx,%r8), %rdx
	movss %xmm0, (%rbx,%rdx,4)
	incq %r8
	cmpq %r12, %r8
	jb .LB8924
.LB8925:
	incq %rax
	cmpq %rdi, %rax
	jb .LB8917
	jmp .LB8918
.LB12340:
.LB8825:
	cmpq %rbx, %r8
	jae .LB8827
.LB8826:
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
	jb .LB8826
.LB8827:
	incq %rax
	cmpq %r12, %rax
	jb .LB8819
	jmp .LB8820
	.text
	.globl standard__neuralnet__nn_seq_init__1__SequentialE1_ptr1__ret_voidE1
	.def standard__neuralnet__nn_seq_init__1__SequentialE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__neuralnet__nn_seq_init__1__SequentialE1_ptr1__ret_voidE1:
.LB9041:
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
.LB9047:
	movq %rcx, %rsi
	movq 48(%rbp), %rax
	cmpl $8, 768(%rsi)
	jge .LB9058
.LB9059:
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
.LB9058:
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
.LB9085:
	movq %rcx, %rsi
	movq %rdx, %rdi
	movq %r8, %rax
	xorl %ebx, %ebx
.LB9093:
	cmpl 768(%rsi), %ebx
	jge .LB9095
.LB9094:
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
	jl .LB9094
.LB9095:
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
.LB9124:
	movq %rcx, %rsi
	xorl %edi, %edi
.LB9127:
	cmpl 768(%rsi), %edi
	jge .LB9129
.LB9128:
	movslq %edi, %rax
	imulq $96, %rax, %rax
	leaq (%rsi,%rax,1), %rcx
	callq standard__neuralnet__nn_linear_zero_grad__1__LinearE1_ptr1__ret_voidE1
	incl %edi
	cmpl 768(%rsi), %edi
	jl .LB9128
.LB9129:
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
.LB9144:
	movq %rcx, %rsi
	xorl %edi, %edi
.LB9147:
	cmpl 768(%rsi), %edi
	jge .LB9149
.LB9148:
	movslq %edi, %rax
	imulq $96, %rax, %rax
	leaq (%rsi,%rax,1), %rcx
	callq standard__neuralnet__nn_linear_free_intermediates__1__LinearE1_ptr1__ret_voidE1
	incl %edi
	cmpl 768(%rsi), %edi
	jl .LB9148
.LB9149:
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
.LB9164:
	movq %rcx, %rsi
	xorl %edi, %edi
.LB9167:
	cmpl 768(%rsi), %edi
	jge .LB9169
.LB9168:
	movslq %edi, %rax
	imulq $96, %rax, %rax
	leaq (%rsi,%rax,1), %rcx
	callq standard__neuralnet__nn_linear_free__1__LinearE1_ptr1__ret_voidE1
	incl %edi
	cmpl 768(%rsi), %edi
	jl .LB9168
.LB9169:
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
.LB9184:
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
.LB9228:
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
.LB9248:
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
.LB9255:
	movq %rcx, %rsi
	movq %rdx, %rdi
	cmpl $16, 400(%rsi)
	jge .LB9263
.LB9264:
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
.LB9263:
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
.LB9323:
	movq %rcx, %rsi
	movq %rdx, %rdi
	xorl %ebx, %ebx
.LB9327:
	cmpl 768(%rdi), %ebx
	jge .LB9329
.LB9328:
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
	jl .LB9328
.LB9329:
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
.LB9362:
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
.LB9401:
	cmpl %eax, %edx
	jge .LB9403
.LB9402:
	movsd 16(%rsp), %xmm2
	mulss %xmm2, %xmm0
	movsd 8(%rsp), %xmm2
	mulss %xmm2, %xmm1
	incl %edx
	cmpl %eax, %edx
	jl .LB9402
.LB9403:
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
.LB9427:
	movq 32(%rsp), %rbx
	movq 384(%rsp), %r12
	cmpl 768(%r12), %ebx
	jge .LB9429
.LB9428:
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
	jne .LB9452
.LB9453:
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
.LB9454:
	movq 40(%rsp), %rax
	incl %eax
	movq %rax, 192(%rsp)
	movq 48(%rbx), %rax
	movq STDLIB_GVP(%rip), %rdx
	movq %rdx, 272(%rsp)
	movq %rdx, 264(%rsp)
	movq %rdx, 256(%rsp)
	cmpq %rdx, %rax
	jne .LB9610
.LB9611:
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
.LB9612:
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
	jmp .LB9427
.LB9429:
	movq 592(%rsp), %rbx
	movq 584(%rsp), %rsi
	movq 576(%rsp), %rdi
	movq 568(%rsp), %r12
	movq 560(%rsp), %r13
	movq 552(%rsp), %r14
	movq 544(%rsp), %r15
	addq $608, %rsp
	ret
.LB9452:
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
.LB9484:
	cmpq 24(%rbx), %rax
	jae .LB9486
.LB9485:
	xorl %r8d, %r8d
	movq 304(%rsp), %r10
	movq %r10, 72(%rsp)
	movq 296(%rsp), %r10
	movq %r10, 64(%rsp)
	movq 288(%rsp), %r10
	movq %r10, 56(%rsp)
.LB9494:
	movq 16(%rbx), %r13
	cmpq %r13, %r8
	jae .LB9496
.LB9495:
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
	jmp .LB9494
.LB9486:
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
	jmp .LB9454
.LB9610:
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
.LB9647:
	movq 168(%rsp), %r12
	cmpq %rdi, %r12
	jae .LB9649
.LB9648:
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
	jmp .LB9647
.LB9649:
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
	jmp .LB9612
.LB9496:
	incq %rax
	movq 72(%rsp), %r10
	movq %r10, 304(%rsp)
	movq 64(%rsp), %r10
	movq %r10, 296(%rsp)
	movq 56(%rsp), %r10
	movq %r10, 288(%rsp)
	cmpq 24(%rbx), %rax
	jb .LB9485
	jmp .LB9486
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
.LB9733:
	movq %rcx, %rsi
	xorl %edi, %edi
.LB9736:
	cmpl 400(%rsi), %edi
	jge .LB9738
.LB9737:
	movslq %edi, %rax
	movq 16(%rsi,%rax,8), %rax
	movq STDLIB_GVP(%rip), %rcx
	cmpq %rcx, %rax
	jne .LB9756
.LB9758:
	movslq %edi, %rax
	movq 144(%rsi,%rax,8), %rax
	movq STDLIB_GVP(%rip), %rcx
	cmpq %rcx, %rax
	jne .LB9783
.LB9785:
	incl %edi
	cmpl 400(%rsi), %edi
	jl .LB9737
.LB9738:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB9756:
	movslq %edi, %rbx
	movq 16(%rsi,%rbx,8), %rax
	movq %rax, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movq STDLIB_GVP(%rip), %rax
	movq %rax, 16(%rsi,%rbx,8)
	jmp .LB9758
.LB9783:
	movslq %edi, %rbx
	movq 144(%rsi,%rbx,8), %rax
	movq %rax, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movq STDLIB_GVP(%rip), %rax
	movq %rax, 144(%rsi,%rbx,8)
	jmp .LB9785
	.text
	.globl standard__autograd_vis__GLVisBackend.__init__0__ret_thisE1
	.def standard__autograd_vis__GLVisBackend.__init__0__ret_thisE1;
	.scl 2;
	.type 32;
	.endef
standard__autograd_vis__GLVisBackend.__init__0__ret_thisE1:
.LB10847:
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
.LB10848:
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
	je .LB10940
.LB10941:
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
.LB10940:
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
.LB11049:
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
	ja .LB11066
.LB11067:
	movq -8(%rbp), %rsi
	leave
	ret
.LB11066:
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
.LB11073:
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
.LB11077:
	movq %rcx, %rsi
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -56(%rbp)
	movups .LZERO+32(%rip), %xmm15
	movups %xmm15, -24(%rbp)
	vzeroupper
.LB11079:
	movq STDLIB_GVP(%rip), %rax
	leaq -56(%rbp), %rcx
	movq $1, 32(%rsp)
	xorl %r8d, %r8d
	xorl %r9d, %r9d
	movq %rax, %rdx
	callq PeekMessageA
	movzbl %al, %eax
	testb %al, %al
	je .LB11081
.LB11080:
	cmpl $18, -48(%rbp)
	je .LB11092
.LB11093:
	leaq -56(%rbp), %rcx
	callq TranslateMessage
	leaq -56(%rbp), %rcx
	callq DispatchMessageA
	jmp .LB11079
.LB11081:
	movzbl 32(%rsi), %eax
	movq -8(%rbp), %rsi
	leave
	ret
.LB11092:
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
.LB11100:
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
.LB11117:
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
.LB9801:
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
.LB9827:
	cmpl %r8d, %eax
	jge .LB9829
.LB9828:
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
	jl .LB9828
.LB9829:
	leaq (%rsp), %rax
	movq %rax, %rdi
	xorl %eax, %eax
	movl $1024, %ecx
	rep stosb
	leal -1(%r8), %eax
	xorl %ecx, %ecx
.LB9875:
	cmpl %r8d, %ecx
	jge .LB9877
.LB9876:
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
	jl .LB9876
.LB9877:
	xorl %eax, %eax
	xorl %ecx, %ecx
	xorl %edi, %edi
.LB9957:
	cmpl %r8d, %eax
	jge .LB9959
.LB9958:
	movq (%rdx), %r9
	movslq %eax, %rbx
	shlq $7, %rbx
	leaq (%r9,%rbx,1), %r9
	movq %rdi, %rbx
	movq %rcx, %rdi
	xorl %ecx, %ecx
.LB9970:
	cmpl 32(%r9), %ecx
	jge .LB9972
.LB9971:
	movslq %ecx, %rdi
	movq 16(%r9,%rdi,8), %rdi
	movl 9220(%rsi), %r12d
	cmpl $512, %r12d
	jl .LB9991
.LB9992:
.LB9993:
	incl %ecx
	cmpl 32(%r9), %ecx
	jl .LB9971
	jmp .LB9972
.LB9959:
	movq 3120(%rsp), %rbx
	movq 3112(%rsp), %rsi
	movq 3104(%rsp), %rdi
	movq 3096(%rsp), %r12
	movq 3088(%rsp), %r13
	movq 3080(%rsp), %r14
	movq 3072(%rsp), %r15
	addq $3136, %rsp
	ret
.LB9972:
	incl %eax
	movq %rdi, %rcx
	movq %rbx, %rdi
	cmpl %r8d, %eax
	jl .LB9958
	jmp .LB9959
.LB9991:
	movslq %r12d, %rbx
	leaq 5120(%rsi,%rbx,8), %rbx
	movl 96(%rdi), %r12d
	movl %r12d, (%rbx)
	movl %eax, 4(%rbx)
	movl 9220(%rsi), %r12d
	incl %r12d
	movl %r12d, 9220(%rsi)
	jmp .LB9993
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
.LB10024:
	movq 72(%rsp), %rax
	movslq 9216(%rcx), %rsi
	xorl %edi, %edi
.LB10031:
	cmpq %rsi, %rdi
	jge .LB10033
.LB10032:
	leaq (%rdi,%rdi,4), %rbx
	leaq (%rcx,%rbx,4), %rbx
	movl (%rbx), %r12d
	cmpl %edx, %r12d
	je .LB10053
.LB10054:
	incq %rdi
	cmpq %rsi, %rdi
	jl .LB10032
.LB10033:
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
.LB10053:
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
.LB10077:
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
.LB10095:
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
.LB10116:
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
	jl .LB10140
.LB10141:
	ret
.LB10140:
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
.LB10150:
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
.LB10156:
	leaq 40(%rcx), %rsi
	xorl %edi, %edi
.LB10165:
	cmpl 9220(%rsi), %edi
	jge .LB10167
.LB10166:
	movslq %edi, %rax
	leaq 5120(%rsi,%rax,8), %rbx
	cmpl $0, (%rbx)
	jl .LB10186
.LB10187:
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
	ja .LB10212
.LB10213:
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
	jl .LB10166
.LB10167:
	xorl %edi, %edi
.LB10230:
	cmpl 9216(%rsi), %edi
	jge .LB10232
.LB10231:
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
	js .LB10273
.LB10268:
	cmpl $10, %eax
	jg .LB10273
.LB10274:
.LB10275:
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
	jl .LB10231
.LB10232:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB10273:
	xorl %eax, %eax
	jmp .LB10275
.LB10212:
	incl %edi
	cmpl 9220(%rsi), %edi
	jl .LB10166
	jmp .LB10167
.LB10186:
	incl %edi
	cmpl 9220(%rsi), %edi
	jl .LB10166
	jmp .LB10167
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
.LB10587:
	movq %rcx, %rsi
	movl 11316(%rsi), %edi
	movl 11312(%rsi), %ebx
	cmpl $2, %edi
	jl .LB10604
.LB10605:
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
.LB10687:
	cmpl %edi, %ecx
	jge .LB10689
.LB10688:
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
	ja .LB10711
.LB10712:
	movsd -104(%rbp), %xmm2
.LB10713:
	ucomiss %xmm0, %xmm1
	ja .LB10718
.LB10719:
.LB10720:
	incl %ecx
	movsd %xmm2, -104(%rbp)
	cmpl %edi, %ecx
	jl .LB10688
.LB10689:
	movsd -104(%rbp), %xmm1
	subss %xmm1, %xmm0
	cvtss2sd %xmm0, %xmm1
	movabsq $4517329193108106637, %r10
	movq %r10, %xmm2
	ucomisd %xmm1, %xmm2
	ja .LB10731
.LB10732:
	movsd %xmm0, -112(%rbp)
.LB10733:
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
.LB10786:
	cmpl %edi, %r12d
	jge .LB10788
.LB10787:
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
	jl .LB10787
	jmp .LB10788
.LB10731:
	movabsq $1065353216, %r10
	movq %r10, -112(%rbp)
	jmp .LB10733
.LB10788:
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
.LB10711:
	movaps %xmm1, %xmm2
	jmp .LB10713
.LB10718:
	movaps %xmm1, %xmm0
	jmp .LB10720
.LB10604:
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
.LB10830:
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
.LB10842:
	movq %rcx, %rax
	movq %rax, %rcx
	callq standard__autograd_vis__GLVisBackend.vis_backend_shutdown__0__ret_voidE1
	leave
	ret
	.text
	.globl plot_boundary__5__SequentialE1_ptr1__TapeE1_ptr1__floatE1_ptr1__floatE1_ptr1__intE1__ret_voidE1
	.def plot_boundary__5__SequentialE1_ptr1__TapeE1_ptr1__floatE1_ptr1__floatE1_ptr1__intE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
plot_boundary__5__SequentialE1_ptr1__TapeE1_ptr1__floatE1_ptr1__floatE1_ptr1__intE1__ret_voidE1:
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
.LB11118:
	movq %r8, %rsi
	movq %r9, %rdi
	movq %rcx, -168(%rbp)
	movq %rdx, -176(%rbp)
	movl 48(%rbp), %ebx
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -72(%rbp)
	movl $1152, %ecx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, %r12
	movl $73728, %ecx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movabsq $1075419546, %r10
	movq %r10, %xmm1
	movabsq $1075419546, %r10
	movq %r10, %xmm2
	movq %rax, %r13
	movl $48, %eax
	movslq %eax, %rax
	xorps %xmm0, %xmm0
	cvtsi2ssq %rax, %xmm0
	movl $24, %eax
	movslq %eax, %rax
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	divss %xmm15, %xmm0
	xorps %xmm1, %xmm1
	cvtsi2ssq %rax, %xmm1
	movaps %xmm1, %xmm15
	movaps %xmm2, %xmm1
	divss %xmm15, %xmm1
	xorps %xmm2, %xmm2
	xorl %eax, %eax
	xorl %ecx, %ecx
.LB11152:
	cmpl $24, %eax
	jge .LB11154
.LB11153:
	movslq %eax, %rdx
	xorps %xmm3, %xmm3
	cvtsi2ssq %rdx, %xmm3
	movabsq $1067030938, %r10
	movq %r10, %xmm4
	vfnmadd132ss %xmm1, %xmm4, %xmm3
	movq %rcx, %rdx
	xorl %ecx, %ecx
.LB11162:
	cmpl $48, %ecx
	jge .LB11164
.LB11163:
	xorps %xmm2, %xmm2
	movabsq $1067030938, %r10
	movq %r10, %xmm4
	movslq %ecx, %r8
	subss %xmm4, %xmm2
	xorps %xmm4, %xmm4
	cvtsi2ssq %r8, %xmm4
	movl %edx, %r8d
	shll $1, %r8d
	movslq %r8d, %r9
	incl %r8d
	incl %edx
	incl %ecx
	movslq %r8d, %r8
	vfmadd231ss %xmm4, %xmm0, %xmm2
	movss %xmm2, (%r13,%r9,4)
	movss %xmm3, (%r13,%r8,4)
	cmpl $48, %ecx
	jl .LB11163
	jmp .LB11164
.LB11154:
	movq $1152, -72(%rbp)
	movq $2, -64(%rbp)
	movl $801, %ecx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, %r14
	leaq -72(%rbp), %rax
	movq %rax, 32(%rsp)
	movq %r14, %rcx
	movq -176(%rbp), %rdx
	movq %r13, %r8
	movl $2, %r9d
	callq standard__autograd__gt_init__5__GradTensorE1_ptr1__TapeE1_ptr1__floatE1_ptr1__dataE1_ubits64__dataE1_ptr1_ubits64__ret_voidE1
	andb $127, 100(%r14)
	movq %r13, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movq -168(%rbp), %rcx
	movq -176(%rbp), %rdx
	movq %r14, %r8
	callq standard__neuralnet__nn_seq_forward__3__SequentialE1_ptr1__standard__autograd__TapeE1_ptr1__standard__autograd__GradTensorE1_ptr1__ret_standard__autograd__GradTensorE1_ptr1
	movq %rax, %r13
	xorps %xmm0, %xmm0
	xorl %eax, %eax
	xorl %ecx, %ecx
.LB11217:
	cmpl $24, %eax
	jge .LB11219
.LB11218:
	imull $48, %eax, %edx
	movq %rcx, %r8
	xorl %ecx, %ecx
.LB11222:
	cmpl $48, %ecx
	jge .LB11224
.LB11223:
	movq (%r13), %r9
	movslq %r8d, %r15
	movss (%r9,%r15,4), %xmm0
	movabsq $1056964608, %r10
	movq %r10, %xmm1
	ucomiss %xmm1, %xmm0
	jae .LB11236
.LB11237:
	leal (%rdx,%rcx), %r9d
	movslq %r9d, %r9
	movb $46, (%r12,%r9,1)
.LB11238:
	incl %r8d
	incl %ecx
	cmpl $48, %ecx
	jl .LB11223
	jmp .LB11224
.LB11219:
	movq %r13, %rcx
	callq standard__autograd__gt_free__1__GradTensorE1_ptr1__ret_voidE1
	movq %r13, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movq %r14, %rcx
	callq standard__autograd__gt_free__1__GradTensorE1_ptr1__ret_voidE1
	movq %r14, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movq -168(%rbp), %rcx
	callq standard__neuralnet__nn_seq_free_intermediates__1__SequentialE1_ptr1__ret_voidE1
	movq -176(%rbp), %rax
	movq (%rax), %rcx
	movl 12(%rax), %eax
	movq %rax, %r8
	shlq $10, %r8
	xorl %edx, %edx
	callq memset
	movq -176(%rbp), %rax
	movl $0, 8(%rax)
	xorl %eax, %eax
.LB11264:
	cmpl %ebx, %eax
	jge .LB11266
.LB11265:
	movl %eax, %ecx
	shll $1, %ecx
	movabsq $1067030938, %r10
	movq %r10, %xmm1
	xorl %r8d, %r8d
	movslq %ecx, %rdx
	incl %ecx
	movss (%rsi,%rdx,4), %xmm0
	movl $48, %edx
	movslq %ecx, %rcx
	movslq %edx, %rdx
	addss %xmm1, %xmm0
	movabsq $1075419546, %r10
	movq %r10, %xmm1
	divss %xmm1, %xmm0
	xorps %xmm1, %xmm1
	cvtsi2ssq %rdx, %xmm1
	mulss %xmm1, %xmm0
	movabsq $1067030938, %r10
	movq %r10, %xmm1
	cvttss2siq %xmm0, %rdx
	movss (%rsi,%rcx,4), %xmm0
	movl $24, %ecx
	movslq %ecx, %rcx
	movl %edx, %edx
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subss %xmm15, %xmm0
	movabsq $1075419546, %r10
	movq %r10, %xmm1
	testl %edx, %edx
	cmovs %r8d, %edx
	movl $47, %r8d
	cmpl $48, %edx
	divss %xmm1, %xmm0
	xorps %xmm1, %xmm1
	cvtsi2ssq %rcx, %xmm1
	cmovge %r8d, %edx
	xorl %r8d, %r8d
	mulss %xmm1, %xmm0
	movabsq $1056964608, %r10
	movq %r10, %xmm1
	cvttss2siq %xmm0, %rcx
	movl %ecx, %ecx
	testl %ecx, %ecx
	cmovs %r8d, %ecx
	movl $23, %r8d
	cmpl $24, %ecx
	cmovge %r8d, %ecx
	movslq %eax, %r8
	movss (%rdi,%r8,4), %xmm0
	ucomiss %xmm0, %xmm1
	ja .LB11319
.LB11320:
	imull $48, %ecx, %ecx
	addl %edx, %ecx
	movslq %ecx, %rcx
	movb $49, (%r12,%rcx,1)
.LB11321:
	incl %eax
	cmpl %ebx, %eax
	jl .LB11265
.LB11266:
	leaq -140(%rbp), %rsi
	movl $1142956042, -140(%rbp)
	movl $1936286565, -136(%rbp)
	movl $544108393, -132(%rbp)
	movl $1853189986, -128(%rbp)
	movl $2037539172, -124(%rbp)
	movl $724049952, -120(%rbp)
	movl $1818435645, -116(%rbp)
	movl $544437089, -112(%rbp)
	movl $773857329, -108(%rbp)
	movl $1818435645, -104(%rbp)
	movl $544437089, -100(%rbp)
	movl $807411760, -96(%rbp)
	movl $540881199, -92(%rbp)
	movl $1767993972, -88(%rbp)
	movl $1735289198, -84(%rbp)
	movl $1937010720, -80(%rbp)
	movl $657961, -76(%rbp)
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	xorl %esi, %esi
	xorl %edi, %edi
	xorl %ebx, %ebx
	xorl %r13d, %r13d
.LB11406:
	cmpl $24, %esi
	jge .LB11408
.LB11407:
	movl $8134688, -153(%rbp)
	leaq -153(%rbp), %r14
	movq %r14, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %r14, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	imull $48, %esi, %r14d
	movq %r13, %r15
	movq %rbx, %r13
	movq %rdi, %rbx
	xorl %edi, %edi
.LB11417:
	cmpl $48, %edi
	jge .LB11419
.LB11418:
	leal (%r14,%rdi), %eax
	leaq -158(%rbp), %r13
	movslq %eax, %rax
	movzbl (%r12,%rax,1), %ebx
	movq %r13, %rcx
	movb %bl, -158(%rbp)
	movb $0, -157(%rbp)
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %r15d
	movq %r13, %rcx
	movq %r15, %rdx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	incl %edi
	cmpl $48, %edi
	jl .LB11418
	jmp .LB11419
.LB11408:
	movl $2826272, -144(%rbp)
	leaq -144(%rbp), %rsi
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	xorl %esi, %esi
.LB11444:
	cmpl $48, %esi
	jge .LB11446
.LB11445:
	movw $45, -149(%rbp)
	leaq -149(%rbp), %rdi
	movq %rdi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rdi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	incl %esi
	cmpl $48, %esi
	jl .LB11445
.LB11446:
	movw $2603, -147(%rbp)
	movb $0, -145(%rbp)
	leaq -147(%rbp), %rsi
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	movq %r12, %rcx
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
.LB11419:
	movw $2684, -156(%rbp)
	movb $0, -154(%rbp)
	leaq -156(%rbp), %rdi
	movq %rdi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rdi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	incl %esi
	movq %rbx, %rdi
	movq %r13, %rbx
	movq %r15, %r13
	cmpl $24, %esi
	jl .LB11407
	jmp .LB11408
.LB11319:
	imull $48, %ecx, %ecx
	addl %edx, %ecx
	movslq %ecx, %rcx
	movb $48, (%r12,%rcx,1)
	jmp .LB11321
.LB11224:
	incl %eax
	movq %r8, %rcx
	cmpl $24, %eax
	jl .LB11218
	jmp .LB11219
.LB11236:
	leal (%rdx,%rcx), %r9d
	movslq %r9d, %r9
	movb $43, (%r12,%r9,1)
	jmp .LB11238
.LB11164:
	incl %eax
	movq %rdx, %rcx
	cmpl $24, %eax
	jl .LB11153
	jmp .LB11154
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
standard__math__PIF:
	.long 1078530011
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
