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
	cmpq $0, %r8
	cmova %r8, %rdx
	shrq $2, %rdx
	xorl %esi, %esi
.LB22315:
	testq %rdx, %rdx
	je .LB22317
.LB22316:
	movb %al, (%rcx,%rsi,1)
	movb %al, 1(%rcx,%rsi,1)
	movb %al, 2(%rcx,%rsi,1)
	movb %al, 3(%rcx,%rsi,1)
	addq $4, %rsi
	decq %rdx
	jne .LB22316
.LB22317:
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
	movq $12288, %r8
	movq $4, %r9
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
	movq $32768, %r8
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
	.globl standard__memory__allocators__stdheap__size_class__1__dataE1_ubits64__ret_dataE1_ubits64
	.def standard__memory__allocators__stdheap__size_class__1__dataE1_ubits64__ret_dataE1_ubits64;
	.scl 2;
	.type 32;
	.endef
standard__memory__allocators__stdheap__size_class__1__dataE1_ubits64__ret_dataE1_ubits64:
.LB76:
	cmpq $4096, %rcx
	ja .LB82
.LB83:
	cmpq $16, %rcx
	jbe .LB89
.LB90:
	leaq -1(%rcx), %rax
	bsrq %rax, %rax
	subq $3, %rax
	ret
.LB89:
	xorl %eax, %eax
	ret
.LB82:
	movq $9, %rax
	ret
	.text
	.globl standard__memory__allocators__stdheap__class_block_size__1__dataE1_ubits64__ret_dataE1_ubits64
	.def standard__memory__allocators__stdheap__class_block_size__1__dataE1_ubits64__ret_dataE1_ubits64;
	.scl 2;
	.type 32;
	.endef
standard__memory__allocators__stdheap__class_block_size__1__dataE1_ubits64__ret_dataE1_ubits64:
.LB98:
	cmpq $8, %rcx
	ja .LB104
.LB105:
	movq $16, %rax
	shlx %rcx, %rax, %rax
	ret
.LB104:
	movq $4096, %rax
	ret
	.text
	.globl standard__memory__allocators__stdheap__bin_pop__1__dataE1_ubits64__ret_FreeNodeE1_ptr1
	.def standard__memory__allocators__stdheap__bin_pop__1__dataE1_ubits64__ret_FreeNodeE1_ptr1;
	.scl 2;
	.type 32;
	.endef
standard__memory__allocators__stdheap__bin_pop__1__dataE1_ubits64__ret_FreeNodeE1_ptr1:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
.LB110:
	cmpq $8, %rcx
	ja .LB116
.LB117:
	leaq standard__memory__allocators__stdheap__g_bins(%rip), %rax
	movslq %ecx, %rdx
	movq (%rax,%rdx,8), %rax
	testq %rax, %rax
	jne .LB130
.LB131:
	movq 0(%rsp), %rsi
	addq $16, %rsp
	ret
.LB130:
	movq (%rax), %rdx
	leaq standard__memory__allocators__stdheap__g_bins(%rip), %rsi
	movq %rdx, (%rsi,%rcx,8)
	movq 0(%rsp), %rsi
	addq $16, %rsp
	ret
.LB116:
	xorl %eax, %eax
	movq 0(%rsp), %rsi
	addq $16, %rsp
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
.LB140:
	cmpq $8, %rcx
	ja .LB147
.LB148:
	leaq standard__memory__allocators__stdheap__g_bins(%rip), %rax
	movslq %ecx, %rsi
	movq (%rax,%rsi,8), %rax
	movq %rax, (%rdx)
	leaq standard__memory__allocators__stdheap__g_bins(%rip), %rax
	movq %rdx, (%rax,%rcx,8)
	movq 0(%rsp), %rsi
	addq $16, %rsp
	ret
.LB147:
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
.LB159:
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
	movq %r12, -8(%rsp)
.LB178:
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
.LB189:
	movslq %edi, %rbx
	shlq $5, %rbx
	leaq (%rcx,%rbx,1), %rbx
	movq (%rbx), %r12
	testq %r12, %r12
	je .LB191
.LB190:
	incq %rdi
	andq %rdx, %rdi
	jmp .LB189
.LB191:
	movq %r8, (%rbx)
	movq %r9, 8(%rbx)
	movq %rax, 16(%rbx)
	movq %rsi, 24(%rbx)
	movq 16(%rsp), %rbx
	movq 8(%rsp), %rsi
	movq 0(%rsp), %rdi
	movq -8(%rsp), %r12
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
.LB240:
	movq standard__memory__allocators__stdheap__g_table_cap(%rip), %rax
	movq %rax, %rsi
	shlq $1, %rsi
	movq %rsi, %rcx
	shlq $5, %rcx
	movq %rcx, -88(%rbp)
	callq standard__memory__allocators__stdheap__heap_os_alloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, %rdi
	testq %rdi, %rdi
	je .LB256
.LB257:
	movq $0, standard__memory__allocators__stdheap__g_table_count(%rip)
	xorl %ebx, %ebx
.LB263:
	movq standard__memory__allocators__stdheap__g_table_cap(%rip), %rax
	cmpq %rax, %rbx
	jae .LB265
.LB264:
	movq standard__memory__allocators__stdheap__g_table(%rip), %rax
	movslq %ebx, %rcx
	shlq $5, %rcx
	leaq (%rax,%rcx,1), %rax
	movq (%rax), %r8
	testq %r8, %r8
	jne .LB282
.LB281:
	incq %rbx
	jmp .LB263
.LB265:
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
.LB345:
	movl -128(%rbp), %r13d
	movslq %r13d, %r14
	shlq $5, %r14
	movq (%rdi,%r14,1), %r14
	testq %r14, %r14
	je .LB347
.LB346:
	movq -120(%rbp), %r15
	cmpq %r15, %r14
	je .LB374
.LB375:
	movq -64(%rbp), %r13
	movq -72(%rbp), %r10
	movq %r10, -96(%rbp)
	movq -80(%rbp), %r10
	movq %r10, -104(%rbp)
.LB373:
	testb %r9b, %r9b
	jne .LB347
.LB545:
	movq -128(%rbp), %r14
	incq %r14
	andq %rcx, %r14
	movq %r14, -128(%rbp)
	movq %r13, -64(%rbp)
	movq -96(%rbp), %r10
	movq %r10, -72(%rbp)
	movq -104(%rbp), %r10
	movq %r10, -80(%rbp)
	jmp .LB345
.LB374:
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
.LB393:
	movslq %edx, %r14
	shlq $5, %r14
	movq (%rdi,%r14,1), %r14
	testq %r14, %r14
	je .LB395
.LB394:
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
	jb .LB425
.LB426:
	cmpq %rax, %r9
	seta %bl
	movzbl %bl, %ebx
	cmpq %rdx, %r9
	setbe %r12b
	movzbl %r12b, %r12d
	orl %r12d, %ebx
	xorl %r12d, %r12d
	movq $1, %r13
	testb %bl, %bl
	cmove %r13d, %r12d
.LB424:
	testb %r12b, %r12b
	jne .LB461
.LB462:
.LB460:
	incq %rdx
	andq %rcx, %rdx
	movq %r14, %r13
	movq %r8, -112(%rbp)
	movq %r9, %r8
	movq %rsi, %r9
	movq %rbx, %r11
	movq %r12, %rbx
	movq %r11, %r12
	jmp .LB393
.LB395:
	movq %r9, -96(%rbp)
	movq -112(%rbp), %r10
	movq %r10, -104(%rbp)
	movl $1, %r9d
	testb %r9b, %r9b
	je .LB545
.LB347:
	movq standard__memory__allocators__stdheap__g_table(%rip), %rax
	movq %rax, %rcx
	movq standard__memory__allocators__stdheap__g_table_slab_cap(%rip), %rdx
	callq standard__memory__allocators__stdheap__heap_os_free__2__dataE1_ubits64__dataE1_ubits64__ret_voidE1
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
.LB425:
	cmpq %rax, %r9
	seta %bl
	movzbl %bl, %ebx
	cmpq %rdx, %r9
	setbe %r12b
	movzbl %r12b, %r12d
	andl %r12d, %ebx
	xorl %r12d, %r12d
	movq $1, %r13
	testb %bl, %bl
	cmove %r13d, %r12d
	testb %r12b, %r12b
	je .LB462
.LB461:
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
	jmp .LB460
.LB282:
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
	jmp .LB281
.LB256:
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
.LB570:
	movq $32768, %rcx
	callq standard__memory__allocators__stdheap__heap_os_alloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, %rsi
	testq %rsi, %rsi
	je .LB584
.LB585:
	movq %rsi, %rdi
	movq $32768, %rcx
	xorl %eax, %eax
	rep stosb
.LB592:
	movq %rsi, %rcx
	movq %rcx, standard__memory__allocators__stdheap__g_table(%rip)
	movq $1024, standard__memory__allocators__stdheap__g_table_cap(%rip)
	movq $0, standard__memory__allocators__stdheap__g_table_count(%rip)
	movq $32768, standard__memory__allocators__stdheap__g_table_slab_cap(%rip)
	movq $2, 32(%rsp)
	movq %rsi, 40(%rsp)
	movq $1024, %rdx
	movq %rsi, %r8
	movq $32768, %r9
	callq standard__memory__allocators__stdheap__table_raw_insert__6__BlockEntryE1_ptr1__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__ret_voidE1
	movq standard__memory__allocators__stdheap__g_table_count(%rip), %rax
	incq %rax
	movq %rax, standard__memory__allocators__stdheap__g_table_count(%rip)
	movl $1, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB584:
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
.LB616:
	movq %rcx, %rsi
	movq %rdx, %rdi
	movq %r8, %rbx
	movq %r9, %r12
	movq standard__memory__allocators__stdheap__g_table(%rip), %rax
	testq %rax, %rax
	je .LB629
.LB628:
	movq standard__memory__allocators__stdheap__g_table_count(%rip), %rax
	shlq $1, %rax
	movq standard__memory__allocators__stdheap__g_table_cap(%rip), %rcx
	cmpq %rcx, %rax
	jae .LB642
.LB641:
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
.LB629:
	callq standard__memory__allocators__stdheap__table_init__0__ret_boolE1
	testb %al, %al
	je .LB634
	jmp .LB628
.LB642:
	callq standard__memory__allocators__stdheap__table_grow__0__ret_boolE1
	testb %al, %al
	jne .LB641
.LB647:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB634:
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
.LB658:
	movq standard__memory__allocators__stdheap__g_table(%rip), %rax
	testq %rax, %rax
	je .LB668
.LB669:
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
.LB676:
	movslq %esi, %rdi
	shlq $5, %rdi
	movq (%rax,%rdi,1), %rdi
	testq %rdi, %rdi
	je .LB678
.LB677:
	cmpq %rcx, %rdi
	je .LB705
.LB706:
	incq %rsi
	leaq -1(%rdx), %rdi
	andq %rdi, %rsi
	jmp .LB676
.LB678:
	xorl %eax, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB705:
	shlq $5, %rsi
	leaq (%rax,%rsi,1), %rax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB668:
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
.LB719:
	movq standard__memory__allocators__stdheap__g_table(%rip), %rax
	testq %rax, %rax
	je .LB729
.LB730:
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
.LB740:
	movslq %esi, %rdi
	shlq $5, %rdi
	movq (%rax,%rdi,1), %rdi
	testq %rdi, %rdi
	je .LB742
.LB741:
	cmpq %rcx, %rdi
	je .LB768
.LB769:
	incq %rsi
	andq %rdx, %rsi
	jmp .LB740
.LB742:
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB768:
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
.LB787:
	movq standard__memory__allocators__stdheap__g_table(%rip), %rcx
	movslq %eax, %rdx
	shlq $5, %rdx
	movq (%rcx,%rdx,1), %rdx
	testq %rdx, %rdx
	je .LB789
.LB788:
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
	jb .LB818
.LB819:
	cmpq %rsi, %rdx
	seta %dil
	movzbl %dil, %edi
	cmpq %rax, %rdx
	setbe %dl
	movzbl %dl, %edx
	orl %edx, %edi
	xorl %edx, %edx
	movq $1, %r8
	testb %dil, %dil
	cmove %r8d, %edx
.LB817:
	testb %dl, %dl
	jne .LB854
.LB855:
.LB853:
	incq %rax
	movq standard__memory__allocators__stdheap__g_table_cap(%rip), %rcx
	decq %rcx
	andq %rcx, %rax
	jmp .LB787
.LB789:
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB818:
	cmpq %rsi, %rdx
	seta %dil
	movzbl %dil, %edi
	cmpq %rax, %rdx
	setbe %dl
	movzbl %dl, %edx
	andl %edx, %edi
	xorl %edx, %edx
	movq $1, %r8
	testb %dil, %dil
	cmove %r8d, %edx
	testb %dl, %dl
	je .LB855
.LB854:
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
	jmp .LB853
.LB729:
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
.LB942:
	movq standard__memory__allocators__stdheap__g_next_slab_size(%rip), %rax
	addq $48, %rcx
	cmpq %rax, %rcx
	movq %rax, %rsi
	cmova %rcx, %rsi
	movq %rsi, %rcx
	callq standard__memory__allocators__stdheap__heap_os_alloc__1__dataE1_ubits64__ret_dataE1_ubits64
	testq %rax, %rax
	je .LB969
.LB970:
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
.LB969:
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
.LB1008:
	movq standard__memory__allocators__stdheap__g_slab_head(%rip), %rax
	testq %rax, %rax
	je .LB1023
.LB1024:
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
.LB1023:
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
.LB1069:
	movq %rcx, %rsi
	movq %rsi, %rcx
	callq standard__memory__allocators__stdheap__heap_os_alloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, %rdi
	testq %rdi, %rdi
	je .LB1078
.LB1079:
	movq %rdi, %rcx
	movq %rsi, %rdx
	movq $1, %r8
	movq %rsi, %r9
	callq standard__memory__allocators__stdheap__table_insert__4__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__ret_boolE1
	testb %al, %al
	je .LB1088
.LB1089:
	movq standard__memory__allocators__stdheap__g_large_used(%rip), %rax
	incq %rax
	movq %rax, standard__memory__allocators__stdheap__g_large_used(%rip)
	movq %rdi, %rax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB1088:
	movq %rdi, %rcx
	movq %rsi, %rdx
	callq standard__memory__allocators__stdheap__heap_os_free__2__dataE1_ubits64__dataE1_ubits64__ret_voidE1
	xorl %eax, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB1078:
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
.LB1096:
	testq %rcx, %rcx
	je .LB1102
.LB1103:
	cmpq $4096, %rcx
	ja .LB1109
.LB1110:
	decq %rcx
	movq %rcx, %rax
	orq $15, %rax
	bsrq %rax, %rax
	leaq -3(%rax), %rsi
	leaq standard__memory__allocators__stdheap__g_bins(%rip), %rax
	movslq %esi, %rcx
	movq (%rax,%rcx,8), %rax
	testq %rax, %rax
	jne .LB1132
.LB1133:
	movq $16, %rax
	shlx %rsi, %rax, %rax
	movq $4096, %rcx
	cmpq $8, %rsi
	movq %rax, %rdi
	cmova %rcx, %rdi
	movq standard__memory__allocators__stdheap__g_slab_head(%rip), %rax
	testq %rax, %rax
	je .LB22241
.LB22242:
	movq 16(%rax), %rcx
	leaq (%rcx,%rdi), %rdx
	movq 8(%rax), %r8
	movq (%rax), %r9
	leaq (%r9,%rcx,1), %rcx
	movq %rdx, 16(%rax)
	xorl %eax, %eax
	cmpq %r8, %rdx
	cmovbe %rcx, %rax
.LB22238:
	testq %rax, %rax
	je .LB1153
.LB1154:
	movq %rax, %rdi
.LB1152:
	movq standard__memory__allocators__stdheap__g_slab_head(%rip), %rax
	movq %rax, %r9
	movq %rdi, %rcx
	movq %rsi, %rdx
	xorl %r8d, %r8d
	callq standard__memory__allocators__stdheap__table_insert__4__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__dataE1_ubits64__ret_boolE1
	testb %al, %al
	je .LB1184
.LB1185:
	movq standard__memory__allocators__stdheap__g_slab_head(%rip), %rax
	movq 24(%rax), %rcx
	incq %rcx
	movq %rcx, 24(%rax)
	movq %rdi, %rax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB22241:
	xorl %eax, %eax
	testq %rax, %rax
	jne .LB1154
.LB1153:
	movq %rdi, %rcx
	callq standard__memory__allocators__stdheap__heap_new_slab__1__dataE1_ubits64__ret_SlabE1_ptr1
	testq %rax, %rax
	je .LB1163
.LB1164:
	movq standard__memory__allocators__stdheap__g_slab_head(%rip), %rax
	testq %rax, %rax
	je .LB22236
.LB22237:
	movq 16(%rax), %rcx
	leaq (%rcx,%rdi), %rdx
	movq 8(%rax), %rdi
	movq (%rax), %r8
	leaq (%r8,%rcx,1), %rcx
	movq %rdx, 16(%rax)
	xorl %eax, %eax
	cmpq %rdi, %rdx
	cmovbe %rcx, %rax
.LB22233:
	testq %rax, %rax
	je .LB1172
.LB1173:
	movq %rax, %rdi
	jmp .LB1152
.LB22236:
	xorl %eax, %eax
	testq %rax, %rax
	je .LB1172
	jmp .LB1173
.LB1184:
	xorl %eax, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB1172:
	xorl %eax, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB1163:
	xorl %eax, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB1132:
	movq (%rax), %rcx
	leaq standard__memory__allocators__stdheap__g_bins(%rip), %rdx
	movq %rcx, (%rdx,%rsi,8)
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB1109:
	callq standard__memory__allocators__stdheap__fmalloc_large__1__dataE1_ubits64__ret_dataE1_ubits64
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB1102:
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
.LB1196:
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
.LB1200:
	movq %rcx, %rsi
	testq %rsi, %rsi
	je .LB1206
.LB1207:
	movq standard__memory__allocators__stdheap__g_table(%rip), %rax
	testq %rax, %rax
	je .LB22246
.LB22247:
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
.LB22248:
	movslq %edx, %rdi
	shlq $5, %rdi
	movq (%rax,%rdi,1), %rdi
	testq %rdi, %rdi
	je .LB22250
.LB22249:
	cmpq %rsi, %rdi
	je .LB22252
.LB22253:
	incq %rdx
	leaq -1(%rcx), %rdi
	andq %rdi, %rdx
	jmp .LB22248
.LB22250:
	xorl %eax, %eax
.LB22243:
	testq %rax, %rax
	je .LB1219
.LB1220:
	movq 16(%rax), %rcx
	movq 8(%rax), %rdx
	cmpq $1, %rcx
	je .LB1240
.LB1241:
	movq $3, 16(%rax)
	cmpq $8, %rdx
	ja .LB22259
.LB22260:
	leaq standard__memory__allocators__stdheap__g_bins(%rip), %rax
	movslq %edx, %rcx
	movq (%rax,%rcx,8), %rax
	movq %rax, (%rsi)
	leaq standard__memory__allocators__stdheap__g_bins(%rip), %rax
	movq %rsi, (%rax,%rdx,8)
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB22252:
	shlq $5, %rdx
	leaq (%rax,%rdx,1), %rax
	jmp .LB22243
.LB22246:
	xorl %eax, %eax
	jmp .LB22243
.LB22259:
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB1240:
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
.LB1219:
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB1206:
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
.LB1253:
	movq %rcx, %rax
	movq %rax, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	leave
	ret
	.text
	.globl standard__memory__allocators__stdheap__frealloc__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64
	.def standard__memory__allocators__stdheap__frealloc__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64;
	.scl 2;
	.type 32;
	.endef
standard__memory__allocators__stdheap__frealloc__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64:
	pushq %rbp
	movq %rsp, %rbp
	subq $80, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
.LB1257:
	movq %rcx, %rsi
	movq %rdx, %rdi
	testq %rsi, %rsi
	je .LB1264
.LB1265:
	testq %rdi, %rdi
	je .LB1272
.LB1273:
	movq standard__memory__allocators__stdheap__g_table(%rip), %rax
	testq %rax, %rax
	je .LB22264
.LB22265:
	movq standard__memory__allocators__stdheap__g_table_cap(%rip), %rcx
	movq %rsi, %rdx
	shrq $4, %rdx
	movabsq $-7046029254386353131, %r8
	imulq %r8, %rdx
	movq %rdx, %r8
	shrq $32, %r8
	xorq %r8, %rdx
	decq %rcx
	andq %rcx, %rdx
.LB22266:
	movslq %edx, %r8
	shlq $5, %r8
	movq (%rax,%r8,1), %r8
	testq %r8, %r8
	je .LB22268
.LB22267:
	cmpq %rsi, %r8
	je .LB22270
.LB22271:
	incq %rdx
	andq %rcx, %rdx
	jmp .LB22266
.LB22268:
	xorl %ecx, %ecx
.LB22261:
	testq %rcx, %rcx
	je .LB1287
.LB1288:
	movq 16(%rcx), %rax
	movq 8(%rcx), %rbx
	cmpq $1, %rax
	je .LB1316
.LB1317:
	cmpq $4096, %rdi
	ja .LB22277
.LB22278:
	cmpq $16, %rdi
	jbe .LB22280
.LB22281:
	leaq -1(%rdi), %rax
	bsrq %rax, %rax
	subq $3, %rax
.LB22274:
	cmpq %rbx, %rax
	je .LB1336
.LB1337:
	cmpq %rbx, %rax
	jb .LB1344
.LB1345:
	movq $16, %rdx
	shlx %rbx, %rdx, %rdx
	movq $4096, %r8
	cmpq $8, %rbx
	cmova %r8, %rdx
	cmpq %rdx, %rdi
	movq %rdx, %r12
	cmovb %rdi, %r12
	cmpq $8, %rax
	ja .LB22292
.LB22293:
	leaq standard__memory__allocators__stdheap__g_bins(%rip), %rdx
	movslq %eax, %r8
	movq (%rdx,%r8,8), %rdx
	testq %rdx, %rdx
	jne .LB22295
.LB22294:
.LB22289:
	testq %rdx, %rdx
	jne .LB1365
.LB1366:
	movq %rdi, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, %rdi
	testq %rdi, %rdi
	je .LB1466
.LB1467:
	xorl %eax, %eax
	cmpq $0, %r12
	cmova %r12, %rax
	shrq $2, %rax
	xorl %ecx, %ecx
.LB22321:
	testq %rax, %rax
	je .LB22323
.LB22322:
	movslq %ecx, %rdx
	movzbl (%rsi,%rdx,1), %edx
	movb %dl, (%rdi,%rcx,1)
	leaq 1(%rcx), %rdx
	movslq %edx, %rdx
	movzbl (%rsi,%rdx,1), %edx
	movb %dl, 1(%rdi,%rcx,1)
	leaq 2(%rcx), %rdx
	movslq %edx, %rdx
	movzbl (%rsi,%rdx,1), %edx
	movb %dl, 2(%rdi,%rcx,1)
	leaq 3(%rcx), %rdx
	movslq %edx, %rdx
	movzbl (%rsi,%rdx,1), %edx
	movb %dl, 3(%rdi,%rcx,1)
	addq $4, %rcx
	decq %rax
	jne .LB22322
	jmp .LB22323
.LB22270:
	shlq $5, %rdx
	leaq (%rax,%rdx,1), %rcx
	jmp .LB22261
.LB22264:
	xorl %ecx, %ecx
	jmp .LB22261
.LB22280:
	xorl %eax, %eax
	cmpq %rbx, %rax
	je .LB1336
	jmp .LB1337
.LB22277:
	movl $9, %eax
	cmpq %rbx, %rax
	je .LB1336
	jmp .LB1337
.LB22295:
	movq (%rdx), %r8
	leaq standard__memory__allocators__stdheap__g_bins(%rip), %r9
	movq %r8, (%r9,%rax,8)
	jmp .LB22294
.LB22292:
	xorl %edx, %edx
	testq %rdx, %rdx
	jne .LB1365
	jmp .LB1366
.LB22323:
.LB1474:
	cmpq %r12, %rcx
	jae .LB1476
.LB1475:
	movslq %ecx, %rax
	movzbl (%rsi,%rax,1), %eax
	movb %al, (%rdi,%rcx,1)
	incq %rcx
	cmpq %r12, %rcx
	jb .LB1475
.LB1476:
	movq %rsi, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movq %rdi, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB1466:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB1365:
	movq standard__memory__allocators__stdheap__g_table(%rip), %rdi
	testq %rdi, %rdi
	je .LB22300
.LB22301:
	movq standard__memory__allocators__stdheap__g_table_cap(%rip), %r8
	movq %rdx, %r9
	shrq $4, %r9
	movabsq $-7046029254386353131, %r13
	imulq %r13, %r9
	movq %r9, %r13
	shrq $32, %r13
	xorq %r13, %r9
	decq %r8
	andq %r8, %r9
.LB22302:
	movslq %r9d, %r13
	shlq $5, %r13
	movq (%rdi,%r13,1), %r13
	testq %r13, %r13
	je .LB22304
.LB22303:
	cmpq %rdx, %r13
	je .LB22306
.LB22307:
	incq %r9
	andq %r8, %r9
	jmp .LB22302
.LB22304:
	xorl %edi, %edi
.LB22297:
	testq %rdi, %rdi
	jne .LB1378
.LB1377:
	xorl %eax, %eax
	cmpq $0, %r12
	cmova %r12, %rax
	shrq $2, %rax
	xorl %edi, %edi
.LB22318:
	testq %rax, %rax
	je .LB22320
.LB22319:
	movslq %edi, %r8
	movzbl (%rsi,%r8,1), %r8d
	movb %r8b, (%rdx,%rdi,1)
	leaq 1(%rdi), %r8
	movslq %r8d, %r8
	movzbl (%rsi,%r8,1), %r8d
	movb %r8b, 1(%rdx,%rdi,1)
	leaq 2(%rdi), %r8
	movslq %r8d, %r8
	movzbl (%rsi,%r8,1), %r8d
	movb %r8b, 2(%rdx,%rdi,1)
	leaq 3(%rdi), %r8
	movslq %r8d, %r8
	movzbl (%rsi,%r8,1), %r8d
	movb %r8b, 3(%rdx,%rdi,1)
	addq $4, %rdi
	decq %rax
	jne .LB22319
	jmp .LB22320
.LB22306:
	shlq $5, %r9
	leaq (%rdi,%r9,1), %rdi
	testq %rdi, %rdi
	jne .LB1378
	jmp .LB1377
.LB22300:
	xorl %edi, %edi
	testq %rdi, %rdi
	je .LB1377
.LB1378:
	movq 24(%rdi), %r8
	movq %rax, 8(%rdi)
	movq $0, 16(%rdi)
	testq %r8, %r8
	je .LB1377
.LB1396:
	movq 24(%r8), %rax
	incq %rax
	movq %rax, 24(%r8)
	jmp .LB1377
.LB22320:
.LB1409:
	cmpq %r12, %rdi
	jae .LB1411
.LB1410:
	movslq %edi, %rax
	movzbl (%rsi,%rax,1), %eax
	movb %al, (%rdx,%rdi,1)
	incq %rdi
	cmpq %r12, %rdi
	jb .LB1410
.LB1411:
	movq 24(%rcx), %rax
	testq %rax, %rax
	jne .LB1435
.LB1434:
	movq $3, 16(%rcx)
	cmpq $8, %rbx
	ja .LB22313
.LB22314:
	leaq standard__memory__allocators__stdheap__g_bins(%rip), %rax
	movslq %ebx, %rcx
	movq (%rax,%rcx,8), %rax
	movq %rax, (%rsi)
	leaq standard__memory__allocators__stdheap__g_bins(%rip), %rax
	movq %rsi, (%rax,%rbx,8)
	movq %rdx, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB1435:
	movq 24(%rax), %rdi
	cmpq $0, %rdi
	jbe .LB1434
.LB1444:
	decq %rdi
	movq %rdi, 24(%rax)
	jmp .LB1434
.LB22313:
	movq %rdx, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB1344:
	movq %rsi, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB1336:
	movq %rsi, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB1316:
	cmpq %rdi, %rbx
	je .LB1323
.LB1324:
	movq %rdi, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, %r12
	testq %r12, %r12
	je .LB1498
.LB1499:
	cmpq %rbx, %rdi
	cmovb %rdi, %rbx
	xorl %eax, %eax
	cmpq $0, %rbx
	cmova %rbx, %rax
	shrq $2, %rax
	xorl %ecx, %ecx
.LB22324:
	testq %rax, %rax
	je .LB22326
.LB22325:
	movslq %ecx, %rdx
	movzbl (%rsi,%rdx,1), %edx
	movb %dl, (%r12,%rcx,1)
	leaq 1(%rcx), %rdx
	movslq %edx, %rdx
	movzbl (%rsi,%rdx,1), %edx
	movb %dl, 1(%r12,%rcx,1)
	leaq 2(%rcx), %rdx
	movslq %edx, %rdx
	movzbl (%rsi,%rdx,1), %edx
	movb %dl, 2(%r12,%rcx,1)
	leaq 3(%rcx), %rdx
	movslq %edx, %rdx
	movzbl (%rsi,%rdx,1), %edx
	movb %dl, 3(%r12,%rcx,1)
	addq $4, %rcx
	decq %rax
	jne .LB22325
.LB22326:
.LB1514:
	cmpq %rbx, %rcx
	jae .LB1516
.LB1515:
	movslq %ecx, %rax
	movzbl (%rsi,%rax,1), %eax
	movb %al, (%r12,%rcx,1)
	incq %rcx
	cmpq %rbx, %rcx
	jb .LB1515
.LB1516:
	movq %rsi, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movq %r12, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB1498:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB1323:
	movq %rsi, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB1287:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB1272:
	movq %rsi, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB1264:
	movq %rdi, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
	.text
	.globl standard__strings__helpers__is_whitespace__1__charE1__ret_boolE1
	.def standard__strings__helpers__is_whitespace__1__charE1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__strings__helpers__is_whitespace__1__charE1__ret_boolE1:
.LB1532:
	cmpb $32, %cl
	jne .LB1536
.LB22327:
	movl $1, %eax
	ret
.LB1536:
	cmpb $9, %cl
	jne .LB1541
.LB22328:
	movl $1, %eax
	ret
.LB1541:
	cmpb $10, %cl
	jne .LB1546
.LB22329:
	movl $1, %eax
	ret
.LB1546:
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
.LB1551:
	cmpb $48, %cl
	jge .LB1555
.LB22330:
	xorl %eax, %eax
	ret
.LB1555:
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
.LB1560:
	cmpb $97, %cl
	jl .LB1569
.LB1564:
	cmpb $122, %cl
	jg .LB1569
.LB22331:
	movl $1, %eax
	ret
.LB1569:
	cmpb $65, %cl
	jge .LB1573
.LB22332:
	xorl %eax, %eax
	ret
.LB1573:
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
.LB1579:
	cmpb $65, %cl
	jge .LB1583
.LB22333:
	xorl %eax, %eax
	ret
.LB1583:
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
.LB1588:
	cmpb $97, %cl
	jge .LB1592
.LB22334:
	xorl %eax, %eax
	ret
.LB1592:
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
.LB1597:
	movl %ecx, %esi
	movzbl %sil, %ecx
	callq standard__strings__helpers__is_alpha__1__charE1__ret_boolE1
	testb %al, %al
	je .LB1601
.LB22335:
	movl $1, %eax
	movq -8(%rbp), %rsi
	leave
	ret
.LB1601:
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
.LB1606:
	cmpb $65, %cl
	jl .LB1616
.LB1610:
	cmpb $90, %cl
	jle .LB1615
.LB1616:
	movzbl %cl, %eax
	ret
.LB1615:
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
.LB1623:
	cmpb $97, %cl
	jl .LB1633
.LB1627:
	cmpb $122, %cl
	jle .LB1632
.LB1633:
	movzbl %cl, %eax
	ret
.LB1632:
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
	movq %rdi, -8(%rsp)
.LB1640:
	movl %r8d, %eax
.LB1644:
	movslq %eax, %rsi
	movzbl (%rcx,%rsi,1), %esi
	movzbl %sil, %edi
	testl %edi, %edi
	je .LB1647
.LB1645:
	cmpb %dl, %sil
	je .LB1662
.LB1663:
	incl %eax
	jmp .LB1644
.LB1647:
	movabsq $4294967295, %rax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB1662:
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
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
.LB1669:
	xorl %eax, %eax
.LB1676:
	movslq %eax, %rsi
	movzbl (%rcx,%rsi,1), %esi
	testl %esi, %esi
	je .LB1678
.LB1677:
	incl %eax
	jmp .LB1676
.LB1678:
	xorl %esi, %esi
.LB1687:
	movslq %esi, %rdi
	movzbl (%rdx,%rdi,1), %edi
	testl %edi, %edi
	je .LB1689
.LB1688:
	incl %esi
	jmp .LB1687
.LB1689:
	testl %esi, %esi
	je .LB1700
.LB1701:
	subl %esi, %eax
.LB1704:
	cmpl %eax, %r8d
	jg .LB1707
.LB1705:
	xorl %edi, %edi
.LB1715:
	cmpl %esi, %edi
	jl .LB1716
.LB22336:
	movl $1, %edi
.LB1718:
	testb %dil, %dil
	jne .LB1740
.LB1741:
	incl %r8d
	cmpl %eax, %r8d
	jle .LB1705
.LB1707:
	movabsq $4294967295, %rax
	movq 16(%rsp), %rbx
	movq 8(%rsp), %rsi
	movq 0(%rsp), %rdi
	addq $32, %rsp
	ret
.LB1716:
	leal (%r8,%rdi), %r9d
	movslq %r9d, %r9
	movzbl (%rcx,%r9,1), %r9d
	movslq %edi, %rbx
	movzbl (%rdx,%rbx,1), %ebx
	cmpb %bl, %r9b
	jne .LB1734
.LB1735:
	incl %edi
	cmpl %esi, %edi
	jl .LB1716
	jmp .LB22336
.LB1734:
	xorl %edi, %edi
	testb %dil, %dil
	je .LB1741
.LB1740:
	movl %r8d, %eax
	movq 16(%rsp), %rbx
	movq 8(%rsp), %rsi
	movq 0(%rsp), %rdi
	addq $32, %rsp
	ret
.LB1700:
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
.LB1747:
	movq %rcx, %rsi
	movq %rdx, %rdi
	xorl %ebx, %ebx
.LB1753:
	movslq %ebx, %rax
	movzbl (%rsi,%rax,1), %ecx
	testl %ecx, %ecx
	je .LB1755
.LB1762:
	movzbl (%rdi,%rax,1), %eax
	testl %eax, %eax
	je .LB1755
.LB1754:
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
	jne .LB1784
.LB1785:
	incl %ebx
	jmp .LB1753
.LB1755:
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
.LB1784:
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
.LB1805:
	xorl %eax, %eax
.LB1809:
	movslq %eax, %rsi
	movzbl (%rdx,%rsi,1), %esi
	movzbl %sil, %edi
	testl %edi, %edi
	je .LB1811
.LB1810:
	movslq %eax, %rdi
	movzbl (%rcx,%rdi,1), %edi
	cmpb %sil, %dil
	jne .LB1827
.LB1828:
	incl %eax
	jmp .LB1809
.LB1811:
	movl $1, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB1827:
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
.LB1832:
	xorl %eax, %eax
.LB1837:
	movslq %eax, %rsi
	movzbl (%rcx,%rsi,1), %esi
	testl %esi, %esi
	je .LB1839
.LB1838:
	incl %eax
	jmp .LB1837
.LB1839:
	xorl %esi, %esi
.LB1848:
	movslq %esi, %rdi
	movzbl (%rdx,%rdi,1), %edi
	testl %edi, %edi
	je .LB1850
.LB1849:
	incl %esi
	jmp .LB1848
.LB1850:
	cmpl %eax, %esi
	jg .LB1862
.LB1863:
	subl %esi, %eax
	xorl %edi, %edi
.LB1869:
	cmpl %esi, %edi
	jge .LB1872
.LB1870:
	leal (%rax,%rdi), %r8d
	movslq %r8d, %r8
	movzbl (%rcx,%r8,1), %r8d
	movslq %edi, %r9
	movzbl (%rdx,%r9,1), %r9d
	cmpb %r9b, %r8b
	jne .LB1888
.LB1889:
	incl %edi
	cmpl %esi, %edi
	jl .LB1870
.LB1872:
	movl $1, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB1888:
	xorl %eax, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB1862:
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
.LB1893:
	movq %rcx, %rsi
	xorl %edi, %edi
.LB1896:
	movslq %edi, %rax
	movzbl (%rsi,%rax,1), %eax
	testl %eax, %eax
	je .LB1898
.LB1897:
	incl %edi
	jmp .LB1896
.LB1898:
	leaq 1(%rdi), %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	testq %rax, %rax
	je .LB1918
.LB1919:
	movslq %edi, %rcx
	incq %rcx
	cmpq $32, %rcx
	jge .LB22337
.LB22338:
	xorl %ecx, %ecx
.LB1923:
	cmpl %edi, %ecx
	jg .LB1926
.LB1924:
	movslq %ecx, %rdx
	movzbl (%rsi,%rdx,1), %r8d
	movb %r8b, (%rax,%rdx,1)
	incl %ecx
	cmpl %edi, %ecx
	jle .LB1924
	jmp .LB1926
.LB22337:
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
.LB1926:
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB1918:
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
.LB1941:
	movq %rcx, %rsi
	movl %edx, %edi
	leaq 1(%rdi), %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	testq %rax, %rax
	je .LB1955
.LB1956:
	movslq %edi, %rcx
	xorl %edx, %edx
.LB1960:
	cmpq %rcx, %rdx
	jge .LB1963
.LB1968:
	movzbl (%rsi,%rdx,1), %r8d
	movzbl %r8b, %r9d
	testl %r9d, %r9d
	je .LB1963
.LB1961:
	movb %r8b, (%rax,%rdx,1)
	incq %rdx
	cmpq %rcx, %rdx
	jl .LB1968
.LB1963:
	movslq %edi, %rcx
	movb $0, (%rax,%rcx,1)
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB1955:
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
.LB1991:
	movq %rcx, %rsi
	movl %edx, %edi
	movl %r8d, %ebx
	leaq 1(%rbx), %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	testq %rax, %rax
	je .LB2006
.LB2007:
	xorl %ecx, %ecx
.LB2011:
	cmpl %ebx, %ecx
	jge .LB2014
.LB2019:
	leal (%rdi,%rcx), %edx
	movslq %edx, %rdx
	movzbl (%rsi,%rdx,1), %edx
	testl %edx, %edx
	je .LB2014
.LB2012:
	leal (%rdi,%rcx), %edx
	movslq %edx, %rdx
	movzbl (%rsi,%rdx,1), %edx
	movslq %ecx, %r8
	movb %dl, (%rax,%r8,1)
	incl %ecx
	cmpl %ebx, %ecx
	jl .LB2019
.LB2014:
	movslq %ebx, %rcx
	movb $0, (%rax,%rcx,1)
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB2006:
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
.LB2046:
	movq %rcx, %rsi
	movq %rdx, %rbx
	xorl %r12d, %r12d
.LB2050:
	movslq %r12d, %rax
	movzbl (%rsi,%rax,1), %eax
	testl %eax, %eax
	je .LB2052
.LB2051:
	incl %r12d
	jmp .LB2050
.LB2052:
	xorl %r13d, %r13d
.LB2062:
	movslq %r13d, %rax
	movzbl (%rbx,%rax,1), %eax
	testl %eax, %eax
	je .LB2064
.LB2063:
	incl %r13d
	jmp .LB2062
.LB2064:
	leaq (%r12,%r13), %rax
	leaq 1(%rax), %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	testq %rax, %rax
	je .LB2087
.LB2088:
	cmpl $32, %r12d
	jge .LB22339
.LB22340:
	xorl %ecx, %ecx
	cmpl $0, %r12d
	cmovg %r12d, %ecx
	shrl $2, %ecx
	xorl %edx, %edx
.LB22341:
	testl %ecx, %ecx
	je .LB22343
.LB22342:
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
	jne .LB22342
.LB22343:
	movslq %edx, %rcx
	movslq %r12d, %rdx
.LB2092:
	cmpq %rdx, %rcx
	jge .LB2095
.LB2093:
	movzbl (%rsi,%rcx,1), %edi
	movb %dil, (%rax,%rcx,1)
	incq %rcx
	cmpq %rdx, %rcx
	jl .LB2093
	jmp .LB2095
.LB22339:
	movslq %r12d, %rcx
	movq %rcx, %rdx
	sarq $63, %rdx
	notq %rdx
	andq %rdx, %rcx
	movq %rax, %rdi
	rep movsb
.LB2095:
	xorl %ecx, %ecx
	cmpl $0, %r13d
	cmovg %r13d, %ecx
	shrl $2, %ecx
	xorl %edx, %edx
.LB22344:
	testl %ecx, %ecx
	je .LB22346
.LB22345:
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
	jne .LB22345
.LB22346:
.LB2109:
	cmpl %r13d, %edx
	jge .LB2112
.LB2110:
	movslq %edx, %rcx
	movzbl (%rbx,%rcx,1), %ecx
	leal (%r12,%rdx), %esi
	movslq %esi, %rsi
	movb %cl, (%rax,%rsi,1)
	incl %edx
	cmpl %r13d, %edx
	jl .LB2110
.LB2112:
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
.LB2087:
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
.LB2135:
	movq %rcx, %rax
	xorl %ecx, %ecx
.LB2139:
	leaq 1(%rax), %rdx
	movzbl (%rax), %eax
	testb %al, %al
	je .LB2146
.LB2147:
	incl %ecx
	movq %rdx, %rax
	jmp .LB2139
.LB2146:
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
.LB2151:
	movswl %cx, %eax
	testl %eax, %eax
	je .LB2157
.LB2158:
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
.LB2179:
	cmpw $0, %cx
	jle .LB2181
.LB2180:
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
	cmpw $0, %cx
	jg .LB2180
.LB2181:
	testb %al, %al
	jne .LB2201
.LB2202:
	xorl %eax, %eax
.LB2203:
	leal -1(%rsi), %ecx
.LB2212:
	testw %cx, %cx
	js .LB2214
.LB2213:
	movswl %cx, %esi
	movslq %esi, %rsi
	movzbl (%rsp,%rsi,1), %esi
	movswq %ax, %rdi
	movb %sil, (%rdx,%rdi,1)
	incl %eax
	decl %ecx
	testw %cx, %cx
	jns .LB2213
	jmp .LB2214
.LB2201:
	movb $45, (%rdx)
	movl $1, %eax
	jmp .LB2203
.LB2214:
	movswq %ax, %rcx
	movb $0, (%rdx,%rcx,1)
	movzwl %ax, %eax
	movq 16(%rsp), %rsi
	movq 8(%rsp), %rdi
	addq $32, %rsp
	ret
.LB2157:
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
.LB2234:
	testl %ecx, %ecx
	je .LB2239
.LB2240:
	testl %ecx, %ecx
	sets %al
	movzbl %al, %eax
	xorl %esi, %esi
	subl %ecx, %esi
	testb %al, %al
	cmovne %esi, %ecx
	movq $1, %rsi
	xorl %edi, %edi
	testb %al, %al
	cmovne %esi, %edi
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -8(%rsp)
	movups .LZERO+16(%rip), %xmm15
	movups %xmm15, 8(%rsp)
	xorl %eax, %eax
.LB2258:
	cmpl $0, %ecx
	jle .LB2260
.LB2259:
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
	cmpl $0, %ecx
	jg .LB2259
.LB2260:
	cmpl $1, %edi
	je .LB2276
.LB2277:
	xorl %ecx, %ecx
.LB2278:
	decl %eax
.LB2285:
	testl %eax, %eax
	js .LB2287
.LB2286:
	movslq %eax, %rsi
	movzbl -8(%rsp,%rsi,1), %esi
	movslq %ecx, %rdi
	movb %sil, (%rdx,%rdi,1)
	incl %ecx
	decl %eax
	jns .LB2286
	jmp .LB2287
.LB2276:
	movb $45, (%rdx)
	movl $1, %ecx
	jmp .LB2278
.LB2287:
	movslq %ecx, %rax
	movb $0, (%rdx,%rax,1)
	movl %ecx, %eax
	movq 32(%rsp), %rsi
	movq 24(%rsp), %rdi
	addq $48, %rsp
	ret
.LB2239:
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
.LB2305:
	movq %rdx, %rsi
	testq %rcx, %rcx
	je .LB2311
.LB2312:
	testq %rcx, %rcx
	sets %al
	movzbl %al, %eax
	xorl %edx, %edx
	subq %rcx, %rdx
	testb %al, %al
	cmovne %rdx, %rcx
	movq $1, %rdx
	xorl %edi, %edi
	testb %al, %al
	cmovne %rdx, %rdi
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -8(%rsp)
	movups .LZERO+16(%rip), %xmm15
	movups %xmm15, 8(%rsp)
	xorl %r8d, %r8d
.LB2335:
	cmpq $0, %rcx
	jle .LB2337
.LB2336:
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
	cmpq $0, %rcx
	jg .LB2336
.LB2337:
	cmpq $1, %rdi
	je .LB2359
.LB2360:
	xorl %eax, %eax
.LB2361:
	leaq -1(%r8), %rcx
.LB2370:
	testq %rcx, %rcx
	js .LB2372
.LB2371:
	movslq %ecx, %rdx
	movzbl -8(%rsp,%rdx,1), %edx
	movb %dl, (%rsi,%rax,1)
	incq %rax
	decq %rcx
	jns .LB2371
	jmp .LB2372
.LB2359:
	movb $45, (%rsi)
	movl $1, %eax
	jmp .LB2361
.LB2372:
	movb $0, (%rsi,%rax,1)
	movq 32(%rsp), %rsi
	movq 24(%rsp), %rdi
	addq $48, %rsp
	ret
.LB2311:
	movw $48, (%rsi)
	movq $1, %rax
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
.LB2392:
	testw %cx, %cx
	je .LB2398
.LB2399:
	movq .LZERO(%rip), %r10
	movq %r10, (%rsp)
	xorl %eax, %eax
.LB2411:
	cmpw $0, %cx
	jbe .LB2413
.LB2412:
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
	cmpw $0, %cx
	ja .LB2412
.LB2413:
	movq %rax, %rcx
	xorl %eax, %eax
.LB2434:
	cmpw $0, %cx
	jbe .LB2436
.LB2435:
	decl %ecx
	movswl %cx, %esi
	movslq %esi, %rsi
	movzbl (%rsp,%rsi,1), %esi
	movswq %ax, %rdi
	movb %sil, (%rdx,%rdi,1)
	incl %eax
	cmpw $0, %cx
	ja .LB2435
.LB2436:
	movswq %ax, %rcx
	movb $0, (%rdx,%rcx,1)
	movzwl %ax, %eax
	movq 16(%rsp), %rsi
	movq 8(%rsp), %rdi
	addq $32, %rsp
	ret
.LB2398:
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
.LB2456:
	testl %ecx, %ecx
	je .LB2461
.LB2462:
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -8(%rsp)
	movups .LZERO+16(%rip), %xmm15
	movups %xmm15, 8(%rsp)
	xorl %eax, %eax
.LB2472:
	cmpl $0, %ecx
	jbe .LB2474
.LB2473:
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
	cmpl $0, %ecx
	ja .LB2473
.LB2474:
	movq %rax, %rcx
	xorl %eax, %eax
.LB2490:
	cmpl $0, %ecx
	jbe .LB2492
.LB2491:
	decl %ecx
	movslq %ecx, %rsi
	movzbl -8(%rsp,%rsi,1), %esi
	movslq %eax, %rdi
	movb %sil, (%rdx,%rdi,1)
	incl %eax
	cmpl $0, %ecx
	ja .LB2491
.LB2492:
	movslq %eax, %rcx
	movb $0, (%rdx,%rcx,1)
	movq 32(%rsp), %rsi
	movq 24(%rsp), %rdi
	addq $48, %rsp
	ret
.LB2461:
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
.LB2510:
	movq %rdx, %rsi
	testq %rcx, %rcx
	je .LB2516
.LB2517:
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -8(%rsp)
	movups .LZERO+16(%rip), %xmm15
	movups %xmm15, 8(%rsp)
	xorl %edi, %edi
.LB2529:
	testq %rcx, %rcx
	je .LB2531
.LB2530:
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
	jne .LB2530
.LB2531:
	xorl %eax, %eax
.LB2552:
	testq %rdi, %rdi
	je .LB2554
.LB2553:
	decq %rdi
	movslq %edi, %rcx
	movzbl -8(%rsp,%rcx,1), %ecx
	movb %cl, (%rsi,%rax,1)
	incq %rax
	testq %rdi, %rdi
	jne .LB2553
.LB2554:
	movb $0, (%rsi,%rax,1)
	movq 32(%rsp), %rsi
	movq 24(%rsp), %rdi
	addq $48, %rsp
	ret
.LB2516:
	movw $48, (%rsi)
	movq $1, %rax
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
.LB2574:
	xorl %eax, %eax
.LB2581:
	movslq %eax, %rdx
	movzbl (%rcx,%rdx,1), %esi
	cmpl $32, %esi
	je .LB2582
.LB2590:
	cmpl $9, %esi
	je .LB2582
.LB2599:
	movzbl (%rcx,%rdx,1), %esi
	cmpl $10, %esi
	je .LB2582
.LB2608:
	movzbl (%rcx,%rdx,1), %esi
	cmpl $13, %esi
	jne .LB2583
.LB2582:
	incl %eax
	jmp .LB2581
.LB2583:
	movzbl (%rcx,%rdx,1), %edx
	cmpl $45, %edx
	je .LB2625
.LB2626:
	cmpl $43, %edx
	je .LB2637
.LB2638:
	movl $1, %edx
.LB2627:
	movq %rax, %rsi
	xorl %eax, %eax
.LB2641:
	movslq %esi, %rdi
	movzbl (%rcx,%rdi,1), %edi
	movzbl %dil, %r8d
	testl %r8d, %r8d
	je .LB2643
.LB2642:
	cmpl $48, %r8d
	jb .LB2643
.LB2657:
	cmpl $57, %r8d
	ja .LB2643
.LB2663:
	movzbl %dil, %edi
	subl $48, %edi
	imull $10, %eax, %eax
	addl %edi, %eax
	incl %esi
	jmp .LB2641
.LB2637:
	incl %eax
	movl $1, %edx
	jmp .LB2627
.LB2625:
	incl %eax
	movl $4294967295, %edx
	jmp .LB2627
.LB2643:
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
.LB2678:
	xorl %eax, %eax
.LB2684:
	movslq %eax, %rdx
	movzbl (%rcx,%rdx,1), %edx
	cmpl $32, %edx
	je .LB2685
.LB2693:
	cmpl $9, %edx
	je .LB2685
.LB2702:
	cmpl $10, %edx
	je .LB2685
.LB2711:
	cmpl $13, %edx
	jne .LB2686
.LB2685:
	incl %eax
	jmp .LB2684
.LB2686:
	cmpl $45, %edx
	je .LB2728
.LB2729:
	leal 1(%rax), %esi
	cmpl $43, %edx
	cmove %esi, %eax
	movq %rax, %rdx
	xorl %eax, %eax
.LB2741:
	movslq %edx, %rsi
	movzbl (%rcx,%rsi,1), %esi
	testl %esi, %esi
	je .LB2743
.LB2742:
	cmpl $48, %esi
	jb .LB2764
.LB2757:
	cmpl $57, %esi
	ja .LB2764
.LB2763:
	subl $48, %esi
	imull $10, %eax, %eax
	addl %esi, %eax
	incl %edx
	jmp .LB2741
.LB2764:
	movq 0(%rsp), %rsi
	addq $16, %rsp
	ret
.LB2743:
	movq 0(%rsp), %rsi
	addq $16, %rsp
	ret
.LB2728:
	xorl %eax, %eax
	movq 0(%rsp), %rsi
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
.LB2776:
	xorl %eax, %eax
.LB2784:
	movslq %eax, %rdx
	movzbl (%rcx,%rdx,1), %esi
	cmpl $32, %esi
	je .LB2785
.LB2793:
	cmpl $9, %esi
	je .LB2785
.LB2802:
	movzbl (%rcx,%rdx,1), %esi
	cmpl $10, %esi
	je .LB2785
.LB2811:
	movzbl (%rcx,%rdx,1), %esi
	cmpl $13, %esi
	jne .LB2786
.LB2785:
	incl %eax
	jmp .LB2784
.LB2786:
	movzbl (%rcx,%rdx,1), %edx
	cmpl $45, %edx
	je .LB2828
.LB2829:
	cmpl $43, %edx
	je .LB2841
.LB2842:
	movq %rax, %rdx
	movl $1, %eax
.LB2830:
	movq %rdx, %rsi
	xorl %edx, %edx
.LB2845:
	movslq %esi, %rdi
	movzbl (%rcx,%rdi,1), %edi
	movzbl %dil, %r8d
	testl %r8d, %r8d
	je .LB2847
.LB2846:
	cmpl $48, %r8d
	jb .LB2847
.LB2861:
	cmpl $57, %r8d
	ja .LB2847
.LB2867:
	movzbl %dil, %edi
	subl $48, %edi
	imulq $10, %rdx, %rdx
	addq %rdi, %rdx
	incl %esi
	jmp .LB2845
.LB2841:
	leal 1(%rax), %edx
	movl $1, %eax
	jmp .LB2830
.LB2828:
	leal 1(%rax), %edx
	movq $-1, %rax
	jmp .LB2830
.LB2847:
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
.LB2884:
	xorl %eax, %eax
.LB2890:
	movslq %eax, %rdx
	movzbl (%rcx,%rdx,1), %edx
	cmpl $32, %edx
	je .LB2891
.LB2899:
	cmpl $9, %edx
	je .LB2891
.LB2908:
	cmpl $10, %edx
	je .LB2891
.LB2917:
	cmpl $13, %edx
	jne .LB2892
.LB2891:
	incl %eax
	jmp .LB2890
.LB2892:
	cmpl $45, %edx
	je .LB2934
.LB2935:
	leal 1(%rax), %esi
	cmpl $43, %edx
	cmove %esi, %eax
	movq %rax, %rdx
	xorl %eax, %eax
.LB2948:
	movslq %edx, %rsi
	movzbl (%rcx,%rsi,1), %esi
	testl %esi, %esi
	je .LB2950
.LB2949:
	cmpl $48, %esi
	jb .LB2971
.LB2964:
	cmpl $57, %esi
	ja .LB2971
.LB2970:
	subl $48, %esi
	imulq $10, %rax, %rax
	addq %rsi, %rax
	incl %edx
	jmp .LB2948
.LB2971:
	movq 0(%rsp), %rsi
	addq $16, %rsp
	ret
.LB2950:
	movq 0(%rsp), %rsi
	addq $16, %rsp
	ret
.LB2934:
	xorl %eax, %eax
	movq 0(%rsp), %rsi
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
.LB2985:
	xorps %xmm1, %xmm1
	ucomiss %xmm0, %xmm1
	ja .LB2993
.LB2994:
	xorl %eax, %eax
.LB2995:
	xorps %xmm1, %xmm1
	ucomiss %xmm1, %xmm0
	sete %cl
	movzbl %cl, %ecx
	setnp %sil
	movzbl %sil, %esi
	andl %esi, %ecx
	testb %cl, %cl
	jne .LB3003
.LB3004:
	cvttss2siq %xmm0, %rcx
	movl %ecx, %ecx
	movslq %ecx, %rsi
	xorps %xmm1, %xmm1
	cvtsi2ssq %rsi, %xmm1
	subss %xmm1, %xmm0
	movl $1, %esi
	xorl %edi, %edi
.LB3051:
	cmpl %r8d, %edi
	jge .LB3053
.LB3052:
	imull $10, %esi, %esi
	incl %edi
	cmpl %r8d, %edi
	jl .LB3052
	jmp .LB3053
.LB2993:
	movb $45, (%rdx)
	xorps %xmm1, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subss %xmm15, %xmm0
	movl $1, %eax
	jmp .LB2995
.LB3053:
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
	jge .LB3073
.LB3074:
.LB3075:
	testl %ecx, %ecx
	je .LB3091
.LB3092:
	movups .LZERO(%rip), %xmm15
	movups %xmm15, 32(%rsp)
	movups .LZERO+16(%rip), %xmm15
	movups %xmm15, 48(%rsp)
	movq %rcx, %rsi
	xorl %ecx, %ecx
.LB3104:
	cmpl $0, %esi
	jle .LB3106
.LB3105:
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
	cmpl $0, %esi
	jg .LB3105
	jmp .LB3106
.LB3073:
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
	jne .LB3088
.LB3081:
	cmpl $0, %r8d
	jle .LB3088
.LB3088:
	xorl %edi, %edi
	testl %ecx, %ecx
	je .LB3091
	jmp .LB3092
.LB3106:
	decl %ecx
.LB3122:
	testl %ecx, %ecx
	js .LB3124
.LB3123:
	movslq %ecx, %rsi
	movzbl 32(%rsp,%rsi,1), %esi
	movslq %eax, %r9
	movb %sil, (%rdx,%r9,1)
	incl %eax
	decl %ecx
	jns .LB3123
.LB3124:
.LB3093:
	cmpl $0, %r8d
	jg .LB3139
.LB3140:
	movslq %eax, %rcx
	movb $0, (%rdx,%rcx,1)
	movq 80(%rsp), %rbx
	movq 72(%rsp), %rsi
	movq 64(%rsp), %rdi
	addq $96, %rsp
	ret
.LB3091:
	movslq %eax, %rcx
	movb $48, (%rdx,%rcx,1)
	incl %eax
	cmpl $0, %r8d
	jle .LB3140
.LB3139:
	movslq %eax, %rcx
	movb $46, (%rdx,%rcx,1)
	incl %eax
	testl %edi, %edi
	je .LB3150
.LB3151:
	movups .LZERO(%rip), %xmm15
	movups %xmm15, (%rsp)
	movups .LZERO+16(%rip), %xmm15
	movups %xmm15, 16(%rsp)
	xorl %ecx, %ecx
.LB3172:
	cmpl $0, %edi
	jle .LB3174
.LB3173:
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
	cmpl $0, %edi
	jg .LB3173
.LB3174:
	subl %ecx, %r8d
	xorl %esi, %esi
.LB3192:
	cmpl %r8d, %esi
	jge .LB3194
.LB3193:
	movslq %eax, %rdi
	movb $48, (%rdx,%rdi,1)
	incl %eax
	incl %esi
	cmpl %r8d, %esi
	jl .LB3193
.LB3194:
	decl %ecx
.LB3209:
	testl %ecx, %ecx
	js .LB3211
.LB3210:
	movslq %ecx, %rsi
	movzbl (%rsp,%rsi,1), %esi
	movslq %eax, %rdi
	movb %sil, (%rdx,%rdi,1)
	incl %eax
	decl %ecx
	jns .LB3210
.LB3211:
.LB3152:
	movslq %eax, %rcx
	movb $0, (%rdx,%rcx,1)
	movq 80(%rsp), %rbx
	movq 72(%rsp), %rsi
	movq 64(%rsp), %rdi
	addq $96, %rsp
	ret
.LB3150:
	xorl %ecx, %ecx
.LB3154:
	cmpl %r8d, %ecx
	jge .LB3156
.LB3155:
	movslq %eax, %rsi
	movb $48, (%rdx,%rsi,1)
	incl %eax
	incl %ecx
	cmpl %r8d, %ecx
	jl .LB3155
.LB3156:
	jmp .LB3152
.LB3003:
	movslq %eax, %rcx
	movb $48, (%rdx,%rcx,1)
	leal 1(%rax), %ecx
	movslq %ecx, %rcx
	movb $46, (%rdx,%rcx,1)
	xorl %ecx, %ecx
	cmpl $0, %r8d
	cmovg %r8d, %ecx
	shrl $2, %ecx
	leal 2(%rax), %esi
	xorl %edi, %edi
.LB22347:
	testl %ecx, %ecx
	je .LB22349
.LB22348:
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
	jne .LB22348
.LB22349:
	leal 2(%rax), %ecx
.LB3015:
	cmpl %r8d, %edi
	jge .LB3017
.LB3016:
	leal (%rcx,%rdi), %esi
	movslq %esi, %rsi
	movb $48, (%rdx,%rsi,1)
	incl %edi
	cmpl %r8d, %edi
	jl .LB3016
.LB3017:
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
.LB3229:
	movq %rdx, %rcx
	xorps %xmm1, %xmm1
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm0, %xmm1
	ja .LB3237
.LB3238:
	xorl %esi, %esi
.LB3239:
	xorps %xmm1, %xmm1
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm1, %xmm0
	sete %al
	movzbl %al, %eax
	setnp %dl
	movzbl %dl, %edx
	andl %edx, %eax
	testb %al, %al
	jne .LB3247
.LB3248:
	cvttsd2siq %xmm0, %rax
	xorps %xmm1, %xmm1
	cvtsi2sdq %rax, %xmm1
	subsd %xmm1, %xmm0
	movl $1, %edx
	xorl %edi, %edi
.LB3297:
	cmpl %r8d, %edi
	jge .LB3299
.LB3298:
	imulq $10, %rdx, %rdx
	incl %edi
	cmpl %r8d, %edi
	jl .LB3298
	jmp .LB3299
.LB3237:
	movb $69, (%rcx)
	xorps %xmm1, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subsd %xmm15, %xmm0
	movl $1, %esi
	jmp .LB3239
.LB3299:
	xorps %xmm1, %xmm1
	cvtsi2sdq %rdx, %xmm1
	mulsd %xmm1, %xmm0
	movabsq $1056964608, %r10
	movq %r10, %xmm1
	cvtss2sd %xmm1, %xmm1
	addsd %xmm1, %xmm0
	cvttsd2siq %xmm0, %rdi
	cmpq %rdx, %rdi
	jge .LB3321
.LB3322:
.LB3323:
	testq %rax, %rax
	je .LB3344
.LB3345:
	movups .LZERO(%rip), %xmm15
	movups %xmm15, 32(%rsp)
	movups .LZERO+16(%rip), %xmm15
	movups %xmm15, 48(%rsp)
	xorl %r9d, %r9d
	movq %rax, %rbx
.LB3357:
	cmpq $0, %rbx
	jle .LB3359
.LB3358:
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
	cmpq $0, %rbx
	jg .LB3358
	jmp .LB3359
.LB3321:
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
	jne .LB3340
.LB3333:
	cmpl $0, %r8d
	jle .LB3340
.LB3340:
	movq %rdi, %rax
	xorl %edi, %edi
	testq %rax, %rax
	je .LB3344
	jmp .LB3345
.LB3359:
	leal -1(%r9), %eax
.LB3379:
	testl %eax, %eax
	js .LB3381
.LB3380:
	movslq %eax, %rdx
	movzbl 32(%rsp,%rdx,1), %edx
	movslq %esi, %r9
	movb %dl, (%rcx,%r9,1)
	incl %esi
	decl %eax
	jns .LB3380
.LB3381:
.LB3346:
	cmpl $0, %r8d
	jg .LB3396
.LB3397:
	movq %rsi, %rax
	movslq %eax, %rdx
	movb $0, (%rcx,%rdx,1)
	movq 80(%rsp), %rbx
	movq 72(%rsp), %rsi
	movq 64(%rsp), %rdi
	addq $96, %rsp
	ret
.LB3344:
	movslq %esi, %rax
	movb $48, (%rcx,%rax,1)
	incl %esi
	cmpl $0, %r8d
	jle .LB3397
.LB3396:
	movslq %esi, %rax
	movb $46, (%rcx,%rax,1)
	incl %esi
	testq %rdi, %rdi
	je .LB3408
.LB3409:
	movups .LZERO(%rip), %xmm15
	movups %xmm15, (%rsp)
	movups .LZERO+16(%rip), %xmm15
	movups %xmm15, 16(%rsp)
	movq %rdi, %r9
	xorl %edi, %edi
.LB3430:
	cmpq $0, %r9
	jle .LB3432
.LB3431:
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
	cmpq $0, %r9
	jg .LB3431
.LB3432:
	subl %edi, %r8d
	xorl %eax, %eax
.LB3454:
	cmpl %r8d, %eax
	jge .LB3456
.LB3455:
	movslq %esi, %rdx
	movb $48, (%rcx,%rdx,1)
	incl %esi
	incl %eax
	cmpl %r8d, %eax
	jl .LB3455
.LB3456:
	leal -1(%rdi), %eax
.LB3471:
	testl %eax, %eax
	js .LB3473
.LB3472:
	movslq %eax, %rdx
	movzbl (%rsp,%rdx,1), %edx
	movslq %esi, %rdi
	movb %dl, (%rcx,%rdi,1)
	incl %esi
	decl %eax
	jns .LB3472
.LB3473:
.LB3410:
	movq %rsi, %rax
	movslq %eax, %rdx
	movb $0, (%rcx,%rdx,1)
	movq 80(%rsp), %rbx
	movq 72(%rsp), %rsi
	movq 64(%rsp), %rdi
	addq $96, %rsp
	ret
.LB3408:
	xorl %eax, %eax
.LB3412:
	cmpl %r8d, %eax
	jge .LB3414
.LB3413:
	movslq %esi, %rdx
	movb $48, (%rcx,%rdx,1)
	incl %esi
	incl %eax
	cmpl %r8d, %eax
	jl .LB3413
.LB3414:
	jmp .LB3410
.LB3247:
	movslq %esi, %rax
	movb $48, (%rcx,%rax,1)
	leal 1(%rsi), %eax
	movslq %eax, %rax
	movb $46, (%rcx,%rax,1)
	xorl %eax, %eax
	cmpl $0, %r8d
	cmovg %r8d, %eax
	shrl $2, %eax
	leal 2(%rsi), %edx
	xorl %edi, %edi
.LB22354:
	testl %eax, %eax
	je .LB22356
.LB22355:
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
	jne .LB22355
.LB22356:
	leal 2(%rsi), %eax
.LB3260:
	cmpl %r8d, %edi
	jge .LB3262
.LB3261:
	leal (%rax,%rdi), %edx
	movslq %edx, %rdx
	movb $48, (%rcx,%rdx,1)
	incl %edi
	cmpl %r8d, %edi
	jl .LB3261
.LB3262:
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
.LB3491:
	xorl %eax, %eax
	xorl %edx, %edx
.LB3494:
	movslq %edx, %rsi
	movzbl (%rcx,%rsi,1), %esi
	movzbl %sil, %edi
	testl %edi, %edi
	je .LB3497
.LB3495:
	leal 1(%rax), %edi
	cmpb $10, %sil
	cmove %edi, %eax
	incl %edx
	jmp .LB3494
.LB3497:
	cmpl $0, %eax
	jg .LB3527
.LB3519:
	movzbl (%rcx), %ecx
	testl %ecx, %ecx
	jne .LB3527
.LB3528:
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB3527:
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
.LB3533:
	xorl %eax, %eax
	xorl %esi, %esi
.LB3538:
	movslq %esi, %rdi
	movzbl (%rcx,%rdi,1), %edi
	movzbl %dil, %r8d
	testl %r8d, %r8d
	jne .LB3539
.LB22361:
	xorl %esi, %esi
.LB3541:
	cmpl %edx, %eax
	jne .LB3571
.LB3572:
	movq %rsi, %rax
.LB3578:
	movslq %eax, %rdx
	movzbl (%rcx,%rdx,1), %edx
	movzbl %dl, %edi
	testl %edi, %edi
	je .LB3580
.LB3587:
	cmpb $10, %dl
	je .LB3580
.LB3579:
	incl %eax
	jmp .LB3578
.LB3539:
	cmpl %edx, %eax
	je .LB3552
.LB3553:
	leal 1(%rax), %r8d
	cmpb $10, %dil
	cmove %r8d, %eax
	incl %esi
	jmp .LB3538
.LB3552:
	cmpl %edx, %eax
	jne .LB3571
	jmp .LB3572
.LB3580:
	movl %eax, %r8d
	subl %esi, %r8d
	movq %rsi, %rdx
	callq standard__strings__manip__substring__3__byteE1_ptr1__intE1__intE1__ret_byteE1_ptr1
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB3571:
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
.LB3605:
	movq %rcx, %rsi
	xorl %edi, %edi
	xorl %ebx, %ebx
	xorl %r12d, %r12d
.LB3609:
	movslq %r12d, %rax
	movzbl (%rsi,%rax,1), %eax
	movzbl %al, %ecx
	testl %ecx, %ecx
	je .LB3612
.LB3610:
	movzbl %al, %ecx
	callq standard__strings__helpers__is_whitespace__1__charE1__ret_boolE1
	testb %al, %al
	jne .LB3625
.LB3626:
	testb %bl, %bl
	je .LB3630
.LB3631:
.LB3627:
	incl %r12d
	jmp .LB3609
.LB3612:
	movl %edi, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB3630:
	incl %edi
	movl $1, %ebx
	jmp .LB3627
.LB3625:
	xorl %ebx, %ebx
	jmp .LB3627
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
.LB3637:
	movq %rcx, %rbx
	movq %rdx, %rsi
	movq %r8, %r12
	movq %rbx, %rcx
	movq %rsi, %rdx
	xorl %r8d, %r8d
	callq standard__strings__helpers__find_substring__3__byteE1_ptr1__byteE1_ptr1__intE1__ret_intE1
	movl %eax, %r13d
	cmpl $4294967295, %r13d
	je .LB3648
.LB3649:
	xorl %r14d, %r14d
.LB3654:
	movslq %r14d, %rax
	movzbl (%rbx,%rax,1), %eax
	testl %eax, %eax
	je .LB3656
.LB3655:
	incl %r14d
	jmp .LB3654
.LB3656:
	xorl %r15d, %r15d
.LB3666:
	movslq %r15d, %rax
	movzbl (%rsi,%rax,1), %eax
	testl %eax, %eax
	je .LB3668
.LB3667:
	incl %r15d
	jmp .LB3666
.LB3668:
	movq $0, -64(%rbp)
.LB3678:
	movq -64(%rbp), %rax
	movslq %eax, %rax
	movzbl (%r12,%rax,1), %eax
	testl %eax, %eax
	je .LB3680
.LB3679:
	movq -64(%rbp), %rax
	incl %eax
	movq %rax, -64(%rbp)
	jmp .LB3678
.LB3680:
	movl %r14d, %eax
	subl %r15d, %eax
	movq -64(%rbp), %rcx
	addl %ecx, %eax
	leaq 1(%rax), %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	testq %rax, %rax
	je .LB3706
.LB3707:
	cmpl $32, %r13d
	jge .LB22362
.LB22363:
	xorl %ecx, %ecx
	cmpl $0, %r13d
	cmovg %r13d, %ecx
	shrl $2, %ecx
	xorl %edx, %edx
.LB22364:
	testl %ecx, %ecx
	je .LB22366
.LB22365:
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
	jne .LB22365
.LB22366:
	movslq %edx, %rcx
	movslq %r13d, %rdx
.LB3711:
	cmpq %rdx, %rcx
	jge .LB3714
.LB3712:
	movzbl (%rbx,%rcx,1), %esi
	movb %sil, (%rax,%rcx,1)
	incq %rcx
	cmpq %rdx, %rcx
	jl .LB3712
	jmp .LB3714
.LB22362:
	movslq %r13d, %rcx
	movq %rcx, %rdx
	sarq $63, %rdx
	notq %rdx
	andq %rdx, %rcx
	movq %rax, %rdi
	movq %rbx, %rsi
	rep movsb
.LB3714:
	xorl %ecx, %ecx
	movq -64(%rbp), %rdx
	cmpl $0, %edx
	cmovg %edx, %ecx
	shrl $2, %ecx
	xorl %edx, %edx
.LB22367:
	testl %ecx, %ecx
	je .LB22369
.LB22368:
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
	jne .LB22368
.LB22369:
.LB3728:
	movq -64(%rbp), %rcx
	cmpl %ecx, %edx
	jge .LB3731
.LB3729:
	movslq %edx, %rcx
	movzbl (%r12,%rcx,1), %ecx
	leal (%r13,%rdx), %esi
	movslq %esi, %rsi
	movb %cl, (%rax,%rsi,1)
	incl %edx
	jmp .LB3728
.LB3731:
	leal (%r13,%r15), %ecx
.LB3747:
	cmpl %r14d, %ecx
	jg .LB3750
.LB3748:
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
	jle .LB3748
.LB3750:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB3706:
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
.LB3648:
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
.LB3772:
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
	cmpl $0, %eax
	cmovg %eax, %ecx
	shrl $2, %ecx
	xorl %edx, %edx
.LB22370:
	testl %ecx, %ecx
	je .LB22372
.LB22371:
	movzbl -24(%rbp,%rdx,1), %r8d
	movl (%rdi), %r9d
	movslq %r9d, %r9
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
	jne .LB22371
.LB22372:
	movslq %edx, %rcx
	movslq %eax, %rdx
.LB3783:
	cmpq %rdx, %rcx
	jge .LB3785
.LB3784:
	movzbl -24(%rbp,%rcx,1), %r8d
	movl (%rdi), %r9d
	movslq %r9d, %r9
	movb %r8b, (%rsi,%r9,1)
	movl (%rdi), %r8d
	incl %r8d
	movl %r8d, (%rdi)
	incq %rcx
	cmpq %rdx, %rcx
	jl .LB3784
.LB3785:
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
.LB3803:
	movq %rdx, %rsi
	movq %r8, %rdi
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -48(%rbp)
	movups .LZERO+16(%rip), %xmm15
	movups %xmm15, -32(%rbp)
	leaq -48(%rbp), %rdx
	callq standard__strings__i32str__2__dataE1_sbits32__byteE1_ptr1__ret_dataE1_sbits32
	xorl %ecx, %ecx
	cmpl $0, %eax
	cmovg %eax, %ecx
	shrl $2, %ecx
	xorl %edx, %edx
.LB22373:
	testl %ecx, %ecx
	je .LB22375
.LB22374:
	movzbl -48(%rbp,%rdx,1), %r8d
	movl (%rdi), %r9d
	movslq %r9d, %r9
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
	jne .LB22374
.LB22375:
	movslq %edx, %rcx
	movslq %eax, %rdx
.LB3813:
	cmpq %rdx, %rcx
	jge .LB3815
.LB3814:
	movzbl -48(%rbp,%rcx,1), %r8d
	movl (%rdi), %r9d
	movslq %r9d, %r9
	movb %r8b, (%rsi,%r9,1)
	movl (%rdi), %r8d
	incl %r8d
	movl %r8d, (%rdi)
	incq %rcx
	cmpq %rdx, %rcx
	jl .LB3814
.LB3815:
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
.LB3833:
	movq %rdx, %rsi
	movq %r8, %rdi
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -48(%rbp)
	movups .LZERO+16(%rip), %xmm15
	movups %xmm15, -32(%rbp)
	leaq -48(%rbp), %rdx
	callq standard__strings__i64str__2__dataE1_sbits64__byteE1_ptr1__ret_dataE1_sbits64
	xorl %ecx, %ecx
	cmpl $0, %eax
	cmovg %eax, %ecx
	shrl $2, %ecx
	xorl %edx, %edx
.LB22376:
	testl %ecx, %ecx
	je .LB22378
.LB22377:
	movzbl -48(%rbp,%rdx,1), %r8d
	movl (%rdi), %r9d
	movslq %r9d, %r9
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
	jne .LB22377
.LB22378:
	movslq %edx, %rcx
	movslq %eax, %rdx
.LB3844:
	cmpq %rdx, %rcx
	jge .LB3846
.LB3845:
	movzbl -48(%rbp,%rcx,1), %r8d
	movl (%rdi), %r9d
	movslq %r9d, %r9
	movb %r8b, (%rsi,%r9,1)
	movl (%rdi), %r8d
	incl %r8d
	movl %r8d, (%rdi)
	incq %rcx
	cmpq %rdx, %rcx
	jl .LB3845
.LB3846:
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
.LB3864:
	movq %rdx, %rsi
	movq %r8, %rdi
	movq .LZERO(%rip), %r10
	movq %r10, -24(%rbp)
	leaq -24(%rbp), %rdx
	movzwl %cx, %ecx
	callq standard__strings__u16str__2__dataE1_ubits16__byteE1_ptr1__ret_dataE1_ubits16
	movzwl %ax, %eax
	xorl %ecx, %ecx
	cmpl $0, %eax
	cmovg %eax, %ecx
	shrl $2, %ecx
	xorl %edx, %edx
.LB22379:
	testl %ecx, %ecx
	je .LB22381
.LB22380:
	movzbl -24(%rbp,%rdx,1), %r8d
	movl (%rdi), %r9d
	movslq %r9d, %r9
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
	jne .LB22380
.LB22381:
	movslq %edx, %rcx
	movslq %eax, %rdx
.LB3875:
	cmpq %rdx, %rcx
	jge .LB3877
.LB3876:
	movzbl -24(%rbp,%rcx,1), %r8d
	movl (%rdi), %r9d
	movslq %r9d, %r9
	movb %r8b, (%rsi,%r9,1)
	movl (%rdi), %r8d
	incl %r8d
	movl %r8d, (%rdi)
	incq %rcx
	cmpq %rdx, %rcx
	jl .LB3876
.LB3877:
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
.LB3895:
	movq %rdx, %rsi
	movq %r8, %rdi
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -48(%rbp)
	movups .LZERO+16(%rip), %xmm15
	movups %xmm15, -32(%rbp)
	leaq -48(%rbp), %rdx
	callq standard__strings__u32str__2__dataE1_ubits32__byteE1_ptr1__ret_dataE1_ubits32
	xorl %ecx, %ecx
	cmpl $0, %eax
	cmovg %eax, %ecx
	shrl $2, %ecx
	xorl %edx, %edx
.LB22382:
	testl %ecx, %ecx
	je .LB22384
.LB22383:
	movzbl -48(%rbp,%rdx,1), %r8d
	movl (%rdi), %r9d
	movslq %r9d, %r9
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
	jne .LB22383
.LB22384:
	movslq %edx, %rcx
	movslq %eax, %rdx
.LB3905:
	cmpq %rdx, %rcx
	jge .LB3907
.LB3906:
	movzbl -48(%rbp,%rcx,1), %r8d
	movl (%rdi), %r9d
	movslq %r9d, %r9
	movb %r8b, (%rsi,%r9,1)
	movl (%rdi), %r8d
	incl %r8d
	movl %r8d, (%rdi)
	incq %rcx
	cmpq %rdx, %rcx
	jl .LB3906
.LB3907:
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
.LB3925:
	movq %rdx, %rsi
	movq %r8, %rdi
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -48(%rbp)
	movups .LZERO+16(%rip), %xmm15
	movups %xmm15, -32(%rbp)
	leaq -48(%rbp), %rdx
	callq standard__strings__u64str__2__dataE1_ubits64__byteE1_ptr1__ret_dataE1_ubits64
	xorl %ecx, %ecx
	cmpl $0, %eax
	cmovg %eax, %ecx
	shrl $2, %ecx
	xorl %edx, %edx
.LB22385:
	testl %ecx, %ecx
	je .LB22387
.LB22386:
	movzbl -48(%rbp,%rdx,1), %r8d
	movl (%rdi), %r9d
	movslq %r9d, %r9
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
	jne .LB22386
.LB22387:
	movslq %edx, %rcx
	movslq %eax, %rdx
.LB3936:
	cmpq %rdx, %rcx
	jge .LB3938
.LB3937:
	movzbl -48(%rbp,%rcx,1), %r8d
	movl (%rdi), %r9d
	movslq %r9d, %r9
	movb %r8b, (%rsi,%r9,1)
	movl (%rdi), %r8d
	incl %r8d
	movl %r8d, (%rdi)
	incq %rcx
	cmpq %rdx, %rcx
	jl .LB3937
.LB3938:
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
.LB3956:
	movq %rdx, %rsi
	movq %r8, %rdi
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -48(%rbp)
	movups .LZERO+16(%rip), %xmm15
	movups %xmm15, -32(%rbp)
	leaq -48(%rbp), %rdx
	movq $6, %r8
	callq standard__strings__float2str__3__floatE1__byteE1_ptr1__dataE1_sbits32__ret_dataE1_sbits32
	xorl %ecx, %ecx
	cmpl $0, %eax
	cmovg %eax, %ecx
	shrl $2, %ecx
	xorl %edx, %edx
.LB22388:
	testl %ecx, %ecx
	je .LB22390
.LB22389:
	movzbl -48(%rbp,%rdx,1), %r8d
	movl (%rdi), %r9d
	movslq %r9d, %r9
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
	jne .LB22389
.LB22390:
	movslq %edx, %rcx
	movslq %eax, %rdx
.LB3966:
	cmpq %rdx, %rcx
	jge .LB3968
.LB3967:
	movzbl -48(%rbp,%rcx,1), %r8d
	movl (%rdi), %r9d
	movslq %r9d, %r9
	movb %r8b, (%rsi,%r9,1)
	movl (%rdi), %r8d
	incl %r8d
	movl %r8d, (%rdi)
	incq %rcx
	cmpq %rdx, %rcx
	jl .LB3967
.LB3968:
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
.LB3986:
	movq %rdx, %rsi
	movq %r8, %rdi
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -48(%rbp)
	movups .LZERO+16(%rip), %xmm15
	movups %xmm15, -32(%rbp)
	leaq -48(%rbp), %rdx
	movq $14, %r8
	callq standard__strings__dbl2str__3__doubleE1__byteE1_ptr1__dataE1_sbits32__ret_dataE1_sbits32
	xorl %ecx, %ecx
	cmpl $0, %eax
	cmovg %eax, %ecx
	shrl $2, %ecx
	xorl %edx, %edx
.LB22391:
	testl %ecx, %ecx
	je .LB22393
.LB22392:
	movzbl -48(%rbp,%rdx,1), %r8d
	movl (%rdi), %r9d
	movslq %r9d, %r9
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
	jne .LB22392
.LB22393:
	movslq %edx, %rcx
	movslq %eax, %rdx
.LB3996:
	cmpq %rdx, %rcx
	jge .LB3998
.LB3997:
	movzbl -48(%rbp,%rcx,1), %r8d
	movl (%rdi), %r9d
	movslq %r9d, %r9
	movb %r8b, (%rsi,%r9,1)
	movl (%rdi), %r8d
	incl %r8d
	movl %r8d, (%rdi)
	incq %rcx
	cmpq %rdx, %rcx
	jl .LB3997
.LB3998:
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
.LB4016:
	xorl %eax, %eax
.LB4021:
	movslq %eax, %rsi
	movzbl (%rcx,%rsi,1), %esi
	movzbl %sil, %edi
	testl %edi, %edi
	je .LB4023
.LB4022:
	movl (%r8), %edi
	movslq %edi, %rdi
	movb %sil, (%rdx,%rdi,1)
	movl (%r8), %esi
	incl %esi
	movl %esi, (%r8)
	incl %eax
	jmp .LB4021
.LB4023:
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
.LB4045:
	movq %rcx, %rsi
	movq %rdx, %rdi
	testq %rsi, %rsi
	je .LB4059
.LB4052:
	testq %rdi, %rdi
	je .LB4059
.LB4060:
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %ebx
	movq %rdi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	testl %eax, %eax
	je .LB4071
.LB4072:
	cmpl %ebx, %eax
	jg .LB4078
.LB4079:
	movl %ebx, %ecx
	subl %eax, %ecx
.LB4083:
	testl %ecx, %ecx
	js .LB4086
.LB4084:
	xorl %edx, %edx
.LB4093:
	cmpl %eax, %edx
	jl .LB4094
.LB22394:
	movl $1, %edx
.LB4096:
	testb %dl, %dl
	jne .LB4118
.LB4119:
	decl %ecx
	jns .LB4084
.LB4086:
	movabsq $4294967295, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB4094:
	leal (%rcx,%rdx), %r8d
	movslq %r8d, %r8
	movzbl (%rsi,%r8,1), %r8d
	movslq %edx, %r9
	movzbl (%rdi,%r9,1), %r9d
	cmpb %r9b, %r8b
	jne .LB4112
.LB4113:
	incl %edx
	cmpl %eax, %edx
	jl .LB4094
	jmp .LB22394
.LB4112:
	xorl %edx, %edx
	testb %dl, %dl
	je .LB4119
.LB4118:
	movl %ecx, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB4078:
	movabsq $4294967295, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB4071:
	movl %ebx, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB4059:
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
.LB4125:
	movq %rcx, %rsi
	movl %edx, %edi
	testq %rsi, %rsi
	je .LB4132
.LB4133:
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	decl %eax
.LB4139:
	testl %eax, %eax
	js .LB4142
.LB4140:
	movslq %eax, %rcx
	movzbl (%rsi,%rcx,1), %ecx
	cmpb %dil, %cl
	je .LB4154
.LB4155:
	decl %eax
	jns .LB4140
.LB4142:
	movabsq $4294967295, %rax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB4154:
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB4132:
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
.LB4161:
	movq %rcx, %rsi
	movq %rdx, %rdi
	testq %rsi, %rsi
	je .LB4175
.LB4168:
	testq %rdi, %rdi
	je .LB4175
.LB4176:
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %ebx
	movq %rdi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	testl %eax, %eax
	je .LB4192
.LB4186:
	cmpl %ebx, %eax
	jg .LB4192
.LB4193:
	subl %eax, %ebx
	xorl %ecx, %ecx
	xorl %edx, %edx
.LB4198:
	cmpl %ebx, %edx
	jg .LB4200
.LB4199:
	xorl %r8d, %r8d
.LB4206:
	cmpl %eax, %r8d
	jl .LB4207
.LB22395:
	movl $1, %r8d
.LB4209:
	leal 1(%rcx), %r9d
	leal (%rdx,%rax), %r12d
	incl %edx
	testb %r8b, %r8b
	cmovne %r9d, %ecx
	testb %r8b, %r8b
	cmovne %r12d, %edx
	cmpl %ebx, %edx
	jle .LB4199
.LB4200:
	movl %ecx, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB4207:
	leal (%rdx,%r8), %r9d
	movslq %r9d, %r9
	movzbl (%rsi,%r9,1), %r9d
	movslq %r8d, %r12
	movzbl (%rdi,%r12,1), %r12d
	cmpb %r12b, %r9b
	jne .LB4225
.LB4226:
	incl %r8d
	cmpl %eax, %r8d
	jl .LB4207
	jmp .LB22395
.LB4225:
	xorl %r8d, %r8d
	jmp .LB4209
.LB4192:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB4175:
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
	subq $32, %rsp
.LB4252:
	movl standard__io__console__out_len(%rip), %edx
	testl %edx, %edx
	je .LB4257
.LB4258:
	movl $0, standard__io__console__out_len(%rip)
	leaq standard__io__console__out_buf(%rip), %rcx
	callq standard__io__console__out_raw__2__byteE1_ptr1__intE1__ret_voidE1
	leave
	ret
.LB4257:
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
.LB4262:
	movq %rcx, %rsi
	movl %edx, %edi
	cmpl $0, %edi
	jle .LB4268
.LB4269:
	cmpl $8192, %edi
	jge .LB4273
.LB4274:
	movl standard__io__console__out_len(%rip), %eax
	addl %edi, %eax
	cmpl $8192, %eax
	jg .LB4282
.LB4284:
	xorl %eax, %eax
	cmpl $0, %edi
	cmovg %edi, %eax
	shrl $2, %eax
	xorl %ecx, %ecx
.LB22396:
	testl %eax, %eax
	je .LB22398
.LB22397:
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
	jne .LB22397
	jmp .LB22398
.LB4282:
	callq standard__io__console__flush__0__ret_voidE1
	jmp .LB4284
.LB22398:
.LB4285:
	cmpl %edi, %ecx
	jge .LB4287
.LB4286:
	movslq %ecx, %rax
	movzbl (%rsi,%rax,1), %eax
	movl standard__io__console__out_len(%rip), %edx
	addl %ecx, %edx
	leaq standard__io__console__out_buf(%rip), %r8
	movslq %edx, %rdx
	movb %al, (%r8,%rdx,1)
	incl %ecx
	cmpl %edi, %ecx
	jl .LB4286
.LB4287:
	movl standard__io__console__out_len(%rip), %eax
	addl %edi, %eax
	movl %eax, standard__io__console__out_len(%rip)
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB4273:
	callq standard__io__console__flush__0__ret_voidE1
	movq %rsi, %rcx
	movq %rdi, %rdx
	callq standard__io__console__out_raw__2__byteE1_ptr1__intE1__ret_voidE1
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB4268:
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
.LB4242:
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
	.globl standard__io__console__print__0__ret_voidE1
	.def standard__io__console__print__0__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__io__console__print__0__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
.LB4502:
	movw $2573, -3(%rbp)
	movb $0, -1(%rbp)
	leaq -3(%rbp), %rcx
	movq $2, %rdx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	callq standard__io__console__flush__0__ret_voidE1
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
.LB4304:
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
.LB4309:
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
.LB4316:
	testb %cl, %cl
	jne .LB4319
.LB4320:
	movl $1936482630, -6(%rbp)
	movw $101, -2(%rbp)
	leaq -6(%rbp), %rcx
	callq standard__io__console__print__1__byteE1_arr__ret_voidE1
	leave
	ret
.LB4319:
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
.LB4348:
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
.LB4340:
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
.LB4337:
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
.LB4363:
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
.LB4370:
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
.LB4356:
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
.LB4377:
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
.LB4384:
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
.LB4391:
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
.LB4398:
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
.LB4405:
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
.LB4408:
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
.LB4411:
	leaq -264(%rbp), %rax
	movq %rax, %rdi
	xorl %eax, %eax
	movq $256, %rcx
	rep stosb
	leaq -264(%rbp), %rdx
	movq $5, %r8
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
.LB4419:
	leaq -264(%rbp), %rax
	movq %rax, %rdi
	xorl %eax, %eax
	movq $256, %rcx
	rep stosb
	movq $5, %rax
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
.LB4434:
	leaq -264(%rbp), %rax
	movq %rax, %rdi
	xorl %eax, %eax
	movq $256, %rcx
	rep stosb
	leaq -264(%rbp), %rdx
	movq $14, %r8
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
.LB4442:
	leaq -264(%rbp), %rax
	movq %rax, %rdi
	xorl %eax, %eax
	movq $256, %rcx
	rep stosb
	movq $14, %rax
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
	.globl standard__io__console__println__1__byteE1_arr__ret_voidE1
	.def standard__io__console__println__1__byteE1_arr__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__io__console__println__1__byteE1_arr__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB4457:
	callq standard__io__console__print__1__byteE1_arr__ret_voidE1
	callq standard__io__console__print__0__ret_voidE1
	leave
	ret
	.text
	.globl standard__io__console__println__1__byteE1__ret_voidE1
	.def standard__io__console__println__1__byteE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__io__console__println__1__byteE1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
.LB4460:
	movb %cl, -1(%rbp)
	leaq -1(%rbp), %rcx
	callq standard__io__console__print__1__byteE1_arr__ret_voidE1
	callq standard__io__console__print__0__ret_voidE1
	leave
	ret
	.text
	.globl standard__io__console__println__1__charE1__ret_voidE1
	.def standard__io__console__println__1__charE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__io__console__println__1__charE1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
.LB4463:
	movb %cl, -1(%rbp)
	leaq -1(%rbp), %rcx
	callq standard__io__console__print__1__byteE1_arr__ret_voidE1
	callq standard__io__console__print__0__ret_voidE1
	leave
	ret
	.text
	.globl standard__io__console__println__1__boolE1__ret_voidE1
	.def standard__io__console__println__1__boolE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__io__console__println__1__boolE1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB4466:
	movzbl %cl, %ecx
	callq standard__io__console__print__1__boolE1__ret_voidE1
	callq standard__io__console__print__0__ret_voidE1
	leave
	ret
	.text
	.globl standard__io__console__println__1__dataE1_sbits8__ret_voidE1
	.def standard__io__console__println__1__dataE1_sbits8__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__io__console__println__1__dataE1_sbits8__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
.LB4469:
	movb %cl, -1(%rbp)
	leaq -1(%rbp), %rcx
	callq standard__io__console__print__1__byteE1_arr__ret_voidE1
	callq standard__io__console__print__0__ret_voidE1
	leave
	ret
	.text
	.globl standard__io__console__println__1__dataE1_sbits16__ret_voidE1
	.def standard__io__console__println__1__dataE1_sbits16__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__io__console__println__1__dataE1_sbits16__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB4472:
	movzwl %cx, %ecx
	callq standard__io__console__print__1__dataE1_sbits16__ret_voidE1
	callq standard__io__console__print__0__ret_voidE1
	leave
	ret
	.text
	.globl standard__io__console__println__1__dataE1_ubits16__ret_voidE1
	.def standard__io__console__println__1__dataE1_ubits16__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__io__console__println__1__dataE1_ubits16__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB4475:
	movzwl %cx, %ecx
	callq standard__io__console__print__1__dataE1_ubits16__ret_voidE1
	callq standard__io__console__print__0__ret_voidE1
	leave
	ret
	.text
	.globl standard__io__console__println__1__intE1__ret_voidE1
	.def standard__io__console__println__1__intE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__io__console__println__1__intE1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB4478:
	callq standard__io__console__print__1__intE1__ret_voidE1
	callq standard__io__console__print__0__ret_voidE1
	leave
	ret
	.text
	.globl standard__io__console__println__1__uintE1__ret_voidE1
	.def standard__io__console__println__1__uintE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__io__console__println__1__uintE1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB4484:
	callq standard__io__console__print__1__intE1__ret_voidE1
	callq standard__io__console__print__0__ret_voidE1
	leave
	ret
	.text
	.globl standard__io__console__println__1__longE1__ret_voidE1
	.def standard__io__console__println__1__longE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__io__console__println__1__longE1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB4490:
	callq standard__io__console__print__1__dataE1_ubits64__ret_voidE1
	callq standard__io__console__print__0__ret_voidE1
	leave
	ret
	.text
	.globl standard__io__console__println__1__ulongE1__ret_voidE1
	.def standard__io__console__println__1__ulongE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__io__console__println__1__ulongE1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB4493:
	callq standard__io__console__print__1__dataE1_ubits64__ret_voidE1
	callq standard__io__console__print__0__ret_voidE1
	leave
	ret
	.text
	.globl standard__io__console__println__1__floatE1__ret_voidE1
	.def standard__io__console__println__1__floatE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__io__console__println__1__floatE1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB4496:
	callq standard__io__console__print__1__floatE1__ret_voidE1
	callq standard__io__console__print__0__ret_voidE1
	leave
	ret
	.text
	.globl standard__io__console__println__1__doubleE1__ret_voidE1
	.def standard__io__console__println__1__doubleE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__io__console__println__1__doubleE1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB4499:
	callq standard__io__console__print__1__doubleE1__ret_voidE1
	callq standard__io__console__print__0__ret_voidE1
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
.LB4247:
	callq standard__io__console__win_print__2__byteE1_ptr1__intE1__ret_voidE1
	leave
	ret
	.text
	.globl standard__io__console__println__1__dataE1_sbits32__ret_voidE1
	.def standard__io__console__println__1__dataE1_sbits32__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__io__console__println__1__dataE1_sbits32__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB4481:
	callq standard__io__console__print__1__dataE1_sbits32__ret_voidE1
	callq standard__io__console__print__0__ret_voidE1
	leave
	ret
	.text
	.globl standard__io__console__println__1__dataE1_ubits32__ret_voidE1
	.def standard__io__console__println__1__dataE1_ubits32__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__io__console__println__1__dataE1_ubits32__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB4487:
	callq standard__io__console__print__1__intE1__ret_voidE1
	callq standard__io__console__print__0__ret_voidE1
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
	subq $32, %rsp
.LB22202:
	movq $1, %rcx
	xorl %edx, %edx
	callq ilink_run__2__intE1__byteE1_ptr2__ret_intE1
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
.LB22206:
	callq ilink_run__2__intE1__byteE1_ptr2__ret_intE1
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
.LB4509:
	callq standard__system__cpu__l2_bytes__0__ret_ulongE1
	movq %rax, nt_threshold(%rip)
	callq standard__system__cpu__ermsb__0__ret_boolE1
	movzbl %al, %eax
	movb %al, ermsb(%rip)
	movabsq $4294967285, %rcx
	callq GetStdHandle
	movq %rax, WIN_STDOUT_HANDLE(%rip)
	callq standard__memory__allocators__stdheap__table_init__0__ret_boolE1
	callq GetCommandLineW
	movq %rax, %rsi
	xorl %edi, %edi
	xorl %eax, %eax
.LB4528:
	movslq %eax, %rcx
	movzwl (%rsi,%rcx,2), %ecx
	testw %cx, %cx
	je .LB4530
.LB4529:
.LB4537:
	movslq %eax, %rcx
	movzwl (%rsi,%rcx,2), %ecx
	cmpw $32, %cx
	je .LB4538
.LB4546:
	cmpw $9, %cx
	jne .LB4539
.LB4538:
	incl %eax
	jmp .LB4537
.LB4539:
	testw %cx, %cx
	je .LB4530
.LB4564:
	cmpw $34, %cx
	je .LB4572
.LB4573:
.LB4608:
	movslq %eax, %rcx
	movzwl (%rsi,%rcx,2), %ecx
	testw %cx, %cx
	je .LB4610
.LB4617:
	cmpw $32, %cx
	je .LB4610
.LB4626:
	cmpw $9, %cx
	je .LB4610
.LB4609:
	incl %eax
	jmp .LB4608
.LB4610:
.LB4574:
	incl %edi
	jmp .LB4528
.LB4572:
	incl %eax
.LB4577:
	movslq %eax, %rcx
	movzwl (%rsi,%rcx,2), %ecx
	testw %cx, %cx
	je .LB4579
.LB4586:
	cmpw $34, %cx
	je .LB4579
.LB4578:
	incl %eax
	jmp .LB4577
.LB4579:
	movslq %eax, %rcx
	movzwl (%rsi,%rcx,2), %ecx
	leal 1(%rax), %edx
	cmpw $34, %cx
	cmove %edx, %eax
	jmp .LB4574
.LB4530:
	movq %rdi, %rcx
	shlq $3, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, %rbx
	xorl %r12d, %r12d
	xorl %eax, %eax
	xorl %ecx, %ecx
.LB4645:
	movslq %eax, %rdx
	movzwl (%rsi,%rdx,2), %edx
	testw %dx, %dx
	je .LB4647
.LB4646:
.LB4654:
	movslq %eax, %rdx
	movzwl (%rsi,%rdx,2), %edx
	cmpw $32, %dx
	je .LB4655
.LB4663:
	cmpw $9, %dx
	jne .LB4656
.LB4655:
	incl %eax
	jmp .LB4654
.LB4656:
	testw %dx, %dx
	je .LB4647
.LB4681:
	cmpw $34, %dx
	je .LB4690
.LB4691:
	movq %rax, %rdx
	xorl %r8d, %r8d
.LB4729:
	movslq %edx, %r9
	movzwl (%rsi,%r9,2), %r9d
	testw %r9w, %r9w
	je .LB4731
.LB4738:
	cmpw $32, %r9w
	je .LB4731
.LB4747:
	cmpw $9, %r9w
	je .LB4731
.LB4730:
	incl %r8d
	incl %edx
	jmp .LB4729
.LB4731:
	movq %rdx, %r13
	movq %rax, %r14
	movq %r8, %r15
	movq %rcx, -80(%rbp)
.LB4692:
	leaq 1(%r15), %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	xorl %ecx, %ecx
	cmpl $0, %r15d
	cmovg %r15d, %ecx
	shrl $2, %ecx
	xorl %edx, %edx
.LB22399:
	testl %ecx, %ecx
	je .LB22401
.LB22400:
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
	jne .LB22400
	jmp .LB22401
.LB4690:
	incl %eax
	movq %rax, %rcx
	xorl %r15d, %r15d
.LB4696:
	movslq %ecx, %rdx
	movzwl (%rsi,%rdx,2), %edx
	testw %dx, %dx
	je .LB4698
.LB4705:
	cmpw $34, %dx
	je .LB4698
.LB4697:
	incl %r15d
	incl %ecx
	jmp .LB4696
.LB4698:
	movslq %ecx, %rdx
	movzwl (%rsi,%rdx,2), %edx
	leal 1(%rcx), %r8d
	cmpw $34, %dx
	movl %ecx, %r13d
	cmove %r8d, %r13d
	movq %rax, %r14
	movq $1, -80(%rbp)
	jmp .LB4692
.LB22401:
.LB4766:
	cmpl %r15d, %edx
	jge .LB4768
.LB4767:
	leal (%r14,%rdx), %ecx
	movslq %ecx, %rcx
	movzwl (%rsi,%rcx,2), %ecx
	movslq %edx, %r8
	movb %cl, (%rax,%r8,1)
	incl %edx
	cmpl %r15d, %edx
	jl .LB4767
.LB4768:
	movslq %r15d, %rcx
	movb $0, (%rax,%rcx,1)
	movslq %r12d, %rcx
	movq %rax, (%rbx,%rcx,8)
	incl %r12d
	movq %r13, %rax
	movq -80(%rbp), %rcx
	jmp .LB4645
.LB4647:
	cmpl $1, %edi
	jg .LB4796
.LB4797:
	callq main__0__ret_intE1
	movq %rax, %rsi
.LB4798:
	movslq %edi, %rdi
	xorl %r12d, %r12d
.LB4803:
	cmpq %rdi, %r12
	jge .LB4805
.LB4804:
	movq (%rbx,%r12,8), %rax
	movq %rax, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	incq %r12
	cmpq %rdi, %r12
	jl .LB4804
	jmp .LB4805
.LB4796:
	movq %rdi, %rcx
	movq %rbx, %rdx
	callq main__2__intE1__byteE1_ptr2__ret_intE1
	movl %eax, %esi
	jmp .LB4798
.LB4805:
	testl %esi, %esi
	jne .LB4818
.LB4820:
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
.LB4818:
	cmpl $3221225477, %esi
	jne .LB4820
.LB4824:
	movl $1179075923, -66(%rbp)
	movl $1414288705, -62(%rbp)
	movw $10, -58(%rbp)
	leaq -66(%rbp), %rcx
	callq standard__io__console__print__1__byteE1_arr__ret_voidE1
	jmp .LB4820
	.text
	.globl __chkstk
	.def __chkstk;
	.scl 2;
	.type 32;
	.endef
__chkstk:
.LB4508:
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
	.globl IDEKA__ilink__lk_strlen__1__byteE1_ptr1__ret_intE1
	.def IDEKA__ilink__lk_strlen__1__byteE1_ptr1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
IDEKA__ilink__lk_strlen__1__byteE1_ptr1__ret_intE1:
.LB4843:
	xorl %eax, %eax
.LB4846:
	movslq %eax, %rdx
	movzbl (%rcx,%rdx,1), %edx
	testl %edx, %edx
	je .LB4848
.LB4847:
	incl %eax
	jmp .LB4846
.LB4848:
	ret
	.text
	.globl IDEKA__ilink__lk_streq__2__byteE1_ptr1__byteE1_ptr1__ret_boolE1
	.def IDEKA__ilink__lk_streq__2__byteE1_ptr1__byteE1_ptr1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
IDEKA__ilink__lk_streq__2__byteE1_ptr1__byteE1_ptr1__ret_boolE1:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
	movq %rdi, -8(%rsp)
.LB4858:
	xorl %eax, %eax
.LB4862:
	movslq %eax, %rsi
	movzbl (%rcx,%rsi,1), %edi
	testl %edi, %edi
	je .LB4864
.LB4871:
	movzbl (%rdx,%rsi,1), %esi
	testl %esi, %esi
	je .LB4864
.LB4863:
	movslq %eax, %rsi
	movzbl (%rcx,%rsi,1), %edi
	movzbl (%rdx,%rsi,1), %esi
	cmpb %sil, %dil
	jne .LB4889
.LB4890:
	incl %eax
	jmp .LB4862
.LB4864:
	movslq %eax, %rax
	movzbl (%rcx,%rax,1), %ecx
	movzbl (%rdx,%rax,1), %eax
	cmpb %al, %cl
	sete %al
	movzbl %al, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB4889:
	xorl %eax, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
	.text
	.globl IDEKA__ilink__lk_dup__1__byteE1_ptr1__ret_byteE1_ptr1
	.def IDEKA__ilink__lk_dup__1__byteE1_ptr1__ret_byteE1_ptr1;
	.scl 2;
	.type 32;
	.endef
IDEKA__ilink__lk_dup__1__byteE1_ptr1__ret_byteE1_ptr1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
.LB4903:
	movq %rcx, %rsi
	movq %rsi, %rcx
	callq IDEKA__ilink__lk_strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %ebx
	leal 1(%rbx), %eax
	movslq %eax, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	testq %rax, %rax
	je .LB4919
.LB4920:
	cmpl $32, %ebx
	jge .LB22402
.LB22403:
	xorl %ecx, %ecx
	cmpl $0, %ebx
	cmovg %ebx, %ecx
	shrl $2, %ecx
	xorl %edx, %edx
.LB22404:
	testl %ecx, %ecx
	je .LB22406
.LB22405:
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
	jne .LB22405
.LB22406:
	movslq %edx, %rcx
	movslq %ebx, %rdx
.LB4923:
	cmpq %rdx, %rcx
	jge .LB4925
.LB4924:
	movzbl (%rsi,%rcx,1), %edi
	movb %dil, (%rax,%rcx,1)
	incq %rcx
	cmpq %rdx, %rcx
	jl .LB4924
	jmp .LB4925
.LB22402:
	movslq %ebx, %rcx
	movq %rcx, %rdx
	sarq $63, %rdx
	notq %rdx
	andq %rdx, %rcx
	movq %rax, %rdi
	rep movsb
	movslq %ebx, %rcx
	movb $0, (%rax,%rcx,1)
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB4925:
	movslq %ebx, %rcx
	movb $0, (%rax,%rcx,1)
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB4919:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
	.text
	.globl IDEKA__ilink__lk_cat2__2__byteE1_ptr1__byteE1_ptr1__ret_byteE1_ptr1
	.def IDEKA__ilink__lk_cat2__2__byteE1_ptr1__byteE1_ptr1__ret_byteE1_ptr1;
	.scl 2;
	.type 32;
	.endef
IDEKA__ilink__lk_cat2__2__byteE1_ptr1__byteE1_ptr1__ret_byteE1_ptr1:
	pushq %rbp
	movq %rsp, %rbp
	subq $80, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
.LB4943:
	movq %rcx, %rsi
	movq %rdx, %rbx
	movq %rsi, %rcx
	callq IDEKA__ilink__lk_strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %r12d
	movq %rbx, %rcx
	callq IDEKA__ilink__lk_strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %r13d
	leal (%r12,%r13), %eax
	incl %eax
	movslq %eax, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	cmpl $32, %r12d
	jge .LB22407
.LB22408:
	xorl %ecx, %ecx
	cmpl $0, %r12d
	cmovg %r12d, %ecx
	shrl $2, %ecx
	xorl %edx, %edx
.LB22409:
	testl %ecx, %ecx
	je .LB22411
.LB22410:
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
	jne .LB22410
.LB22411:
	movslq %edx, %rcx
	movslq %r12d, %rdx
.LB4961:
	cmpq %rdx, %rcx
	jge .LB4963
.LB4962:
	movzbl (%rsi,%rcx,1), %edi
	movb %dil, (%rax,%rcx,1)
	incq %rcx
	cmpq %rdx, %rcx
	jl .LB4962
	jmp .LB4963
.LB22407:
	movslq %r12d, %rcx
	movq %rcx, %rdx
	sarq $63, %rdx
	notq %rdx
	andq %rdx, %rcx
	movq %rax, %rdi
	rep movsb
.LB4963:
	xorl %ecx, %ecx
	cmpl $0, %r13d
	cmovg %r13d, %ecx
	shrl $2, %ecx
	xorl %edx, %edx
.LB22412:
	testl %ecx, %ecx
	je .LB22414
.LB22413:
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
	jne .LB22413
.LB22414:
.LB4976:
	cmpl %r13d, %edx
	jge .LB4978
.LB4977:
	movslq %edx, %rcx
	movzbl (%rbx,%rcx,1), %ecx
	leal (%r12,%rdx), %esi
	movslq %esi, %rsi
	movb %cl, (%rax,%rsi,1)
	incl %edx
	cmpl %r13d, %edx
	jl .LB4977
.LB4978:
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
	.text
	.globl IDEKA__ilink__lk_zero__2__byteE1_ptr1__intE1__ret_voidE1
	.def IDEKA__ilink__lk_zero__2__byteE1_ptr1__intE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
IDEKA__ilink__lk_zero__2__byteE1_ptr1__intE1__ret_voidE1:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
	movq %rdi, -8(%rsp)
.LB5000:
	cmpl $32, %edx
	jge .LB22415
.LB22416:
	xorl %eax, %eax
	cmpl $0, %edx
	cmovg %edx, %eax
	shrl $2, %eax
	xorl %esi, %esi
.LB22417:
	testl %eax, %eax
	je .LB22419
.LB22418:
	movb $0, (%rcx,%rsi,1)
	movb $0, 1(%rcx,%rsi,1)
	movb $0, 2(%rcx,%rsi,1)
	movb $0, 3(%rcx,%rsi,1)
	addq $4, %rsi
	decl %eax
	jne .LB22418
.LB22419:
	movslq %esi, %rax
	movslq %edx, %rdx
.LB5004:
	cmpq %rdx, %rax
	jge .LB5006
.LB5005:
	movb $0, (%rcx,%rax,1)
	incq %rax
	cmpq %rdx, %rax
	jl .LB5005
	jmp .LB5006
.LB22415:
	movslq %edx, %rax
	movq %rax, %rdx
	sarq $63, %rdx
	notq %rdx
	andq %rdx, %rax
	movq %rcx, %rdi
	movq %rax, %rcx
	xorl %eax, %eax
	rep stosb
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB5006:
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
	.text
	.globl IDEKA__ilink__lk_grow__2__byteE1_ptr1__intE1__ret_byteE1_ptr1
	.def IDEKA__ilink__lk_grow__2__byteE1_ptr1__intE1__ret_byteE1_ptr1;
	.scl 2;
	.type 32;
	.endef
IDEKA__ilink__lk_grow__2__byteE1_ptr1__intE1__ret_byteE1_ptr1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB5016:
	movq %rcx, %rax
	testq %rax, %rax
	je .LB5024
.LB5025:
	movslq %edx, %rdx
	movq %rax, %rcx
	callq standard__memory__allocators__stdheap__frealloc__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64
	leave
	ret
.LB5024:
	movslq %edx, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	leave
	ret
	.text
	.globl IDEKA__ilink__lk_r8__2__byteE1_ptr1__intE1__ret_intE1
	.def IDEKA__ilink__lk_r8__2__byteE1_ptr1__intE1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
IDEKA__ilink__lk_r8__2__byteE1_ptr1__intE1__ret_intE1:
.LB5037:
	movslq %edx, %rax
	movzbl (%rcx,%rax,1), %eax
	ret
	.text
	.globl IDEKA__ilink__lk_r16__2__byteE1_ptr1__intE1__ret_intE1
	.def IDEKA__ilink__lk_r16__2__byteE1_ptr1__intE1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
IDEKA__ilink__lk_r16__2__byteE1_ptr1__intE1__ret_intE1:
.LB5046:
	movslq %edx, %rax
	movzbl (%rcx,%rax,1), %eax
	incl %edx
	movslq %edx, %rdx
	movzbl (%rcx,%rdx,1), %ecx
	shll $8, %ecx
	orl %ecx, %eax
	ret
	.text
	.globl IDEKA__ilink__lk_r32__2__byteE1_ptr1__intE1__ret_dataE1_sbits64
	.def IDEKA__ilink__lk_r32__2__byteE1_ptr1__intE1__ret_dataE1_sbits64;
	.scl 2;
	.type 32;
	.endef
IDEKA__ilink__lk_r32__2__byteE1_ptr1__intE1__ret_dataE1_sbits64:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
.LB5064:
	leal 3(%rdx), %eax
	movslq %eax, %rax
	movzbl (%rcx,%rax,1), %eax
	shlq $8, %rax
	leal 2(%rdx), %esi
	movslq %esi, %rsi
	movzbl (%rcx,%rsi,1), %esi
	orq %rsi, %rax
	shlq $8, %rax
	leal 1(%rdx), %esi
	movslq %esi, %rsi
	movzbl (%rcx,%rsi,1), %esi
	orq %rsi, %rax
	shlq $8, %rax
	movslq %edx, %rdx
	movzbl (%rcx,%rdx,1), %ecx
	orq %rcx, %rax
	movq 0(%rsp), %rsi
	addq $16, %rsp
	ret
	.text
	.globl IDEKA__ilink__lk_r64__2__byteE1_ptr1__intE1__ret_dataE1_sbits64
	.def IDEKA__ilink__lk_r64__2__byteE1_ptr1__intE1__ret_dataE1_sbits64;
	.scl 2;
	.type 32;
	.endef
IDEKA__ilink__lk_r64__2__byteE1_ptr1__intE1__ret_dataE1_sbits64:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
.LB5112:
	movq %rcx, %rsi
	movl %edx, %edi
	leal 4(%rdi), %edx
	movq %rsi, %rcx
	callq IDEKA__ilink__lk_r32__2__byteE1_ptr1__intE1__ret_dataE1_sbits64
	movq %rax, %rbx
	movq %rsi, %rcx
	movq %rdi, %rdx
	callq IDEKA__ilink__lk_r32__2__byteE1_ptr1__intE1__ret_dataE1_sbits64
	shlq $32, %rbx
	orq %rbx, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
	.text
	.globl IDEKA__ilink__lk_r32s__2__byteE1_ptr1__intE1__ret_dataE1_sbits64
	.def IDEKA__ilink__lk_r32s__2__byteE1_ptr1__intE1__ret_dataE1_sbits64;
	.scl 2;
	.type 32;
	.endef
IDEKA__ilink__lk_r32s__2__byteE1_ptr1__intE1__ret_dataE1_sbits64:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB5129:
	callq IDEKA__ilink__lk_r32__2__byteE1_ptr1__intE1__ret_dataE1_sbits64
	movabsq $2147483648, %rcx
	cmpq %rcx, %rax
	jge .LB5138
.LB5139:
	leave
	ret
.LB5138:
	movabsq $4294967296, %rcx
	subq %rcx, %rax
	leave
	ret
	.text
	.globl IDEKA__ilink__lk_w8__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	.def IDEKA__ilink__lk_w8__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
IDEKA__ilink__lk_w8__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1:
.LB5144:
	movq %r8, %rax
	andq $255, %rax
	movslq %edx, %rdx
	movb %al, (%rcx,%rdx,1)
	ret
	.text
	.globl IDEKA__ilink__lk_w16__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	.def IDEKA__ilink__lk_w16__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
IDEKA__ilink__lk_w16__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
.LB5155:
	movq %rcx, %rsi
	movl %edx, %edi
	movq %r8, %rbx
	movq %rsi, %rcx
	movq %rdi, %rdx
	movq %rbx, %r8
	callq IDEKA__ilink__lk_w8__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	leal 1(%rdi), %edx
	movq %rbx, %r8
	sarq $8, %r8
	movq %rsi, %rcx
	callq IDEKA__ilink__lk_w8__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
	.text
	.globl IDEKA__ilink__lk_w32__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	.def IDEKA__ilink__lk_w32__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
IDEKA__ilink__lk_w32__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
.LB5168:
	movq %rcx, %rsi
	movl %edx, %edi
	movq %r8, %rbx
	movq %rsi, %rcx
	movq %rdi, %rdx
	movq %rbx, %r8
	callq IDEKA__ilink__lk_w16__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	leal 2(%rdi), %edx
	movq %rbx, %r8
	sarq $16, %r8
	movq %rsi, %rcx
	callq IDEKA__ilink__lk_w16__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
	.text
	.globl IDEKA__ilink__lk_w64__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	.def IDEKA__ilink__lk_w64__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
IDEKA__ilink__lk_w64__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
.LB5181:
	movq %rcx, %rsi
	movl %edx, %edi
	movq %r8, %rbx
	movq %rsi, %rcx
	movq %rdi, %rdx
	movq %rbx, %r8
	callq IDEKA__ilink__lk_w32__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	leal 4(%rdi), %edx
	movq %rbx, %r8
	sarq $32, %r8
	movq %rsi, %rcx
	callq IDEKA__ilink__lk_w32__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
	.text
	.globl IDEKA__ilink__lb_init__1__LkBufE1_ptr1__ret_voidE1
	.def IDEKA__ilink__lb_init__1__LkBufE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
IDEKA__ilink__lb_init__1__LkBufE1_ptr1__ret_voidE1:
.LB5194:
	movq $0, (%rcx)
	movl $0, 8(%rcx)
	movl $0, 12(%rcx)
	orb $128, 16(%rcx)
	ret
	.text
	.globl IDEKA__ilink__lb_reserve__2__LkBufE1_ptr1__intE1__ret_voidE1
	.def IDEKA__ilink__lb_reserve__2__LkBufE1_ptr1__intE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
IDEKA__ilink__lb_reserve__2__LkBufE1_ptr1__intE1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB5206:
	movq %rcx, %rsi
	movl 8(%rsi), %eax
	addl %edx, %eax
	movl 12(%rsi), %ecx
	cmpl %ecx, %eax
	jle .LB5221
.LB5222:
	shll $1, %ecx
	movq $4096, %rax
	cmpl $4096, %ecx
	cmovge %ecx, %eax
	movq %rax, %rdi
.LB5234:
	movl 8(%rsi), %eax
	addl %edx, %eax
	cmpl %eax, %edi
	jge .LB5236
.LB5235:
	shll $1, %edi
	jmp .LB5234
.LB5236:
	movq (%rsi), %rcx
	movq %rdi, %rdx
	callq IDEKA__ilink__lk_grow__2__byteE1_ptr1__intE1__ret_byteE1_ptr1
	movq %rax, (%rsi)
	testq %rax, %rax
	je .LB5262
.LB5263:
	movl %edi, 12(%rsi)
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB5262:
	andb $127, 16(%rsi)
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB5221:
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
	.text
	.globl IDEKA__ilink__lb_put8__2__LkBufE1_ptr1__intE1__ret_voidE1
	.def IDEKA__ilink__lb_put8__2__LkBufE1_ptr1__intE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
IDEKA__ilink__lb_put8__2__LkBufE1_ptr1__intE1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB5270:
	movq %rcx, %rsi
	movl %edx, %edi
	movq %rsi, %rcx
	movq $1, %rdx
	callq IDEKA__ilink__lb_reserve__2__LkBufE1_ptr1__intE1__ret_voidE1
	movzbl 16(%rsi), %eax
	shrq $7, %rax
	testb %al, %al
	je .LB5280
.LB5281:
	movq (%rsi), %rax
	movl 8(%rsi), %ecx
	movslq %ecx, %rcx
	movb %dil, (%rax,%rcx,1)
	movl 8(%rsi), %eax
	incl %eax
	movl %eax, 8(%rsi)
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB5280:
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
	.text
	.globl IDEKA__ilink__lb_put16__2__LkBufE1_ptr1__dataE1_sbits64__ret_voidE1
	.def IDEKA__ilink__lb_put16__2__LkBufE1_ptr1__dataE1_sbits64__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
IDEKA__ilink__lb_put16__2__LkBufE1_ptr1__dataE1_sbits64__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB5303:
	movq %rcx, %rsi
	movq %rdx, %rdi
	movq %rdi, %rax
	andq $255, %rax
	movl %eax, %edx
	movq %rsi, %rcx
	callq IDEKA__ilink__lb_put8__2__LkBufE1_ptr1__intE1__ret_voidE1
	sarq $8, %rdi
	movq %rdi, %rax
	andq $255, %rax
	movl %eax, %edx
	movq %rsi, %rcx
	callq IDEKA__ilink__lb_put8__2__LkBufE1_ptr1__intE1__ret_voidE1
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
	.text
	.globl IDEKA__ilink__lb_put32__2__LkBufE1_ptr1__dataE1_sbits64__ret_voidE1
	.def IDEKA__ilink__lb_put32__2__LkBufE1_ptr1__dataE1_sbits64__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
IDEKA__ilink__lb_put32__2__LkBufE1_ptr1__dataE1_sbits64__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB5320:
	movq %rcx, %rsi
	movq %rdx, %rdi
	movq %rsi, %rcx
	movq %rdi, %rdx
	callq IDEKA__ilink__lb_put16__2__LkBufE1_ptr1__dataE1_sbits64__ret_voidE1
	movq %rdi, %rdx
	sarq $16, %rdx
	movq %rsi, %rcx
	callq IDEKA__ilink__lb_put16__2__LkBufE1_ptr1__dataE1_sbits64__ret_voidE1
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
	.text
	.globl IDEKA__ilink__lb_put_n__3__LkBufE1_ptr1__byteE1_ptr1__intE1__ret_voidE1
	.def IDEKA__ilink__lb_put_n__3__LkBufE1_ptr1__byteE1_ptr1__intE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
IDEKA__ilink__lb_put_n__3__LkBufE1_ptr1__byteE1_ptr1__intE1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
.LB5331:
	movq %rcx, %rsi
	movq %rdx, %rdi
	movl %r8d, %ebx
	movq %rsi, %rcx
	movq %rbx, %rdx
	callq IDEKA__ilink__lb_reserve__2__LkBufE1_ptr1__intE1__ret_voidE1
	movzbl 16(%rsi), %eax
	shrq $7, %rax
	testb %al, %al
	je .LB5344
.LB5345:
	xorl %eax, %eax
	cmpl $0, %ebx
	cmovg %ebx, %eax
	shrl $2, %eax
	xorl %ecx, %ecx
.LB22420:
	testl %eax, %eax
	je .LB22422
.LB22421:
	movslq %ecx, %rdx
	movzbl (%rdi,%rdx,1), %edx
	movq (%rsi), %r8
	movl 8(%rsi), %r9d
	addl %ecx, %r9d
	movslq %r9d, %r9
	movb %dl, (%r8,%r9,1)
	leal 1(%rcx), %edx
	movslq %edx, %r8
	movzbl (%rdi,%r8,1), %r8d
	movq (%rsi), %r9
	movl 8(%rsi), %r12d
	addl %edx, %r12d
	movslq %r12d, %rdx
	movb %r8b, (%r9,%rdx,1)
	leal 2(%rcx), %edx
	movslq %edx, %r8
	movzbl (%rdi,%r8,1), %r8d
	movq (%rsi), %r9
	movl 8(%rsi), %r12d
	addl %edx, %r12d
	movslq %r12d, %rdx
	movb %r8b, (%r9,%rdx,1)
	leal 3(%rcx), %edx
	movslq %edx, %r8
	movzbl (%rdi,%r8,1), %r8d
	movq (%rsi), %r9
	movl 8(%rsi), %r12d
	addl %edx, %r12d
	movslq %r12d, %rdx
	movb %r8b, (%r9,%rdx,1)
	addl $4, %ecx
	decl %eax
	jne .LB22421
.LB22422:
.LB5347:
	cmpl %ebx, %ecx
	jge .LB5349
.LB5348:
	movslq %ecx, %rax
	movzbl (%rdi,%rax,1), %eax
	movq (%rsi), %rdx
	movl 8(%rsi), %r8d
	addl %ecx, %r8d
	movslq %r8d, %r8
	movb %al, (%rdx,%r8,1)
	incl %ecx
	cmpl %ebx, %ecx
	jl .LB5348
.LB5349:
	movl 8(%rsi), %eax
	addl %ebx, %eax
	movl %eax, 8(%rsi)
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB5344:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
	.text
	.globl IDEKA__ilink__lb_put_str__2__LkBufE1_ptr1__byteE1_ptr1__ret_intE1
	.def IDEKA__ilink__lb_put_str__2__LkBufE1_ptr1__byteE1_ptr1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
IDEKA__ilink__lb_put_str__2__LkBufE1_ptr1__byteE1_ptr1__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
.LB5380:
	movq %rcx, %rsi
	movq %rdx, %rdi
	movl 8(%rsi), %ebx
	movq %rdi, %rcx
	callq IDEKA__ilink__lk_strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %r8d
	movq %rsi, %rcx
	movq %rdi, %rdx
	callq IDEKA__ilink__lb_put_n__3__LkBufE1_ptr1__byteE1_ptr1__intE1__ret_voidE1
	movq %rsi, %rcx
	xorl %edx, %edx
	callq IDEKA__ilink__lb_put8__2__LkBufE1_ptr1__intE1__ret_voidE1
	movl %ebx, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
	.text
	.globl IDEKA__ilink__lb_pad_to__2__LkBufE1_ptr1__intE1__ret_voidE1
	.def IDEKA__ilink__lb_pad_to__2__LkBufE1_ptr1__intE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
IDEKA__ilink__lb_pad_to__2__LkBufE1_ptr1__intE1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB5396:
	movq %rcx, %rsi
	movl %edx, %edi
.LB5399:
	movl 8(%rsi), %eax
	cmpl %edi, %eax
	jge .LB5401
.LB5400:
	movq %rsi, %rcx
	xorl %edx, %edx
	callq IDEKA__ilink__lb_put8__2__LkBufE1_ptr1__intE1__ret_voidE1
	jmp .LB5399
.LB5401:
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
	.text
	.globl IDEKA__ilink__lk_read_file__2__byteE1_ptr1__intE1_ptr1__ret_byteE1_ptr1
	.def IDEKA__ilink__lk_read_file__2__byteE1_ptr1__intE1_ptr1__ret_byteE1_ptr1;
	.scl 2;
	.type 32;
	.endef
IDEKA__ilink__lk_read_file__2__byteE1_ptr1__intE1_ptr1__ret_byteE1_ptr1:
	pushq %rbp
	movq %rsp, %rbp
	subq $80, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
.LB5410:
	movq %rdx, %rsi
	leaq .str.0(%rip), %rdx
	callq fopen
	movq %rax, %rdi
	testq %rdi, %rdi
	je .LB5426
.LB5427:
	movq %rdi, %rcx
	xorl %edx, %edx
	movq $2, %r8
	callq fseek
	movq %rdi, %rcx
	callq ftell
	movl %eax, %ebx
	movq %rdi, %rcx
	callq rewind
	leal 16(%rbx), %eax
	movslq %eax, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, %r12
	testq %r12, %r12
	je .LB5445
.LB5446:
	movq %r12, %rcx
	movq $1, %rdx
	movq %rbx, %r8
	movq %rdi, %r9
	callq fread
	movl %eax, %r13d
	movq %rdi, %rcx
	callq fclose
	cmpl %ebx, %r13d
	jne .LB5461
.LB5462:
	movslq %ebx, %rax
	leaq (%r12,%rax,1), %rcx
	movq $16, %rdx
	callq IDEKA__ilink__lk_zero__2__byteE1_ptr1__intE1__ret_voidE1
	movl %ebx, (%rsi)
	movq %r12, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB5461:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB5445:
	movq %rdi, %rcx
	callq fclose
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB5426:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
	.text
	.globl IDEKA__ilink__lk_write_file__3__byteE1_ptr1__byteE1_ptr1__intE1__ret_boolE1
	.def IDEKA__ilink__lk_write_file__3__byteE1_ptr1__byteE1_ptr1__intE1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
IDEKA__ilink__lk_write_file__3__byteE1_ptr1__byteE1_ptr1__intE1__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
.LB5472:
	movq %rdx, %rsi
	movl %r8d, %edi
	leaq .str.1(%rip), %rdx
	callq fopen
	movq %rax, %rbx
	testq %rbx, %rbx
	je .LB5487
.LB5488:
	movq %rsi, %rcx
	movq $1, %rdx
	movq %rdi, %r8
	movq %rbx, %r9
	callq fwrite
	movl %eax, %esi
	movq %rbx, %rcx
	callq fclose
	cmpl %edi, %esi
	sete %al
	movzbl %al, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB5487:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
	.text
	.globl IDEKA__ilink__lk_make_exec__1__byteE1_ptr1__ret_voidE1
	.def IDEKA__ilink__lk_make_exec__1__byteE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
IDEKA__ilink__lk_make_exec__1__byteE1_ptr1__ret_voidE1:
.LB5499:
	ret
	.text
	.globl IDEKA__ilink__lk_hash__1__byteE1_ptr1__ret_intE1
	.def IDEKA__ilink__lk_hash__1__byteE1_ptr1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
IDEKA__ilink__lk_hash__1__byteE1_ptr1__ret_intE1:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
.LB5501:
	movl $5381, %eax
	xorl %edx, %edx
.LB5505:
	movslq %edx, %rsi
	movzbl (%rcx,%rsi,1), %esi
	testl %esi, %esi
	je .LB5507
.LB5506:
	imull $33, %eax, %eax
	addl %esi, %eax
	incl %edx
	jmp .LB5505
.LB5507:
	xorl %ecx, %ecx
	subl %eax, %ecx
	testl %eax, %eax
	cmovs %ecx, %eax
	testl %eax, %eax
	js .LB5534
.LB5535:
	movq 0(%rsp), %rsi
	addq $16, %rsp
	ret
.LB5534:
	xorl %eax, %eax
	movq 0(%rsp), %rsi
	addq $16, %rsp
	ret
	.text
	.globl IDEKA__ilink__lm_init__2__LkMapE1_ptr1__intE1__ret_voidE1
	.def IDEKA__ilink__lm_init__2__LkMapE1_ptr1__intE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
IDEKA__ilink__lm_init__2__LkMapE1_ptr1__intE1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
.LB5538:
	movq %rcx, %rsi
	shll $1, %edx
	movl $64, %edi
.LB5542:
	cmpl %edx, %edi
	jge .LB5544
.LB5543:
	shll $1, %edi
	cmpl %edx, %edi
	jl .LB5543
.LB5544:
	movl %edi, 16(%rsi)
	movl $0, 20(%rsi)
	movl %edi, %ebx
	shll $3, %ebx
	movslq %ebx, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, (%rsi)
	shll $2, %edi
	movslq %edi, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, 8(%rsi)
	movq (%rsi), %rax
	movq %rax, %rcx
	movq %rbx, %rdx
	callq IDEKA__ilink__lk_zero__2__byteE1_ptr1__intE1__ret_voidE1
	movq 8(%rsi), %rax
	movq %rax, %rcx
	movq %rdi, %rdx
	callq IDEKA__ilink__lk_zero__2__byteE1_ptr1__intE1__ret_voidE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
	.text
	.globl IDEKA__ilink__lm_get__2__LkMapE1_ptr1__byteE1_ptr1__ret_intE1
	.def IDEKA__ilink__lm_get__2__LkMapE1_ptr1__byteE1_ptr1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
IDEKA__ilink__lm_get__2__LkMapE1_ptr1__byteE1_ptr1__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
.LB5584:
	movq %rcx, %rsi
	movq %rdx, %rdi
	movq %rdi, %rcx
	callq IDEKA__ilink__lk_hash__1__byteE1_ptr1__ret_intE1
	movl 16(%rsi), %ecx
	cltd
	idivl %ecx
	movl %edx, %eax
	movq %rax, %rbx
.LB5595:
	movq 8(%rsi), %rax
	movslq %ebx, %rcx
	movl (%rax,%rcx,4), %eax
	testl %eax, %eax
	je .LB5597
.LB5596:
	movq (%rsi), %rax
	movslq %ebx, %rcx
	movq (%rax,%rcx,8), %rcx
	movq %rdi, %rdx
	callq IDEKA__ilink__lk_streq__2__byteE1_ptr1__byteE1_ptr1__ret_boolE1
	testb %al, %al
	jne .LB5615
.LB5616:
	leal 1(%rbx), %eax
	movl 16(%rsi), %ecx
	cltd
	idivl %ecx
	movl %edx, %ebx
	jmp .LB5595
.LB5597:
	movabsq $4294967295, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB5615:
	movq 8(%rsi), %rax
	movslq %ebx, %rcx
	movl (%rax,%rcx,4), %eax
	decl %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
	.text
	.globl IDEKA__ilink__lm_grow__1__LkMapE1_ptr1__ret_voidE1
	.def IDEKA__ilink__lm_grow__1__LkMapE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
IDEKA__ilink__lm_grow__1__LkMapE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $80, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
.LB5634:
	movq %rcx, %rsi
	movl 16(%rsi), %edi
	movq (%rsi), %rbx
	movq 8(%rsi), %r12
	movl %edi, %eax
	shll $1, %eax
	movl %eax, 16(%rsi)
	shll $3, %eax
	movslq %eax, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, (%rsi)
	movl 16(%rsi), %eax
	shll $2, %eax
	movslq %eax, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, 8(%rsi)
	movq (%rsi), %rax
	movq %rax, %rcx
	movl 16(%rsi), %eax
	movl %eax, %edx
	shll $3, %edx
	callq IDEKA__ilink__lk_zero__2__byteE1_ptr1__intE1__ret_voidE1
	movq 8(%rsi), %rax
	movq %rax, %rcx
	movl 16(%rsi), %eax
	movl %eax, %edx
	shll $2, %edx
	callq IDEKA__ilink__lk_zero__2__byteE1_ptr1__intE1__ret_voidE1
	movslq %edi, %rdi
	xorl %eax, %eax
	xorl %r13d, %r13d
.LB5697:
	cmpq %rdi, %r13
	jge .LB5699
.LB5698:
	movl (%r12,%r13,4), %ecx
	testl %ecx, %ecx
	jne .LB5708
.LB5709:
.LB5710:
	incq %r13
	cmpq %rdi, %r13
	jl .LB5698
.LB5699:
	movq %rbx, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__byteE1_ptr1__ret_voidE1
	movq %r12, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__byteE1_ptr1__ret_voidE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB5708:
	movq (%rbx,%r13,8), %rcx
	callq IDEKA__ilink__lk_hash__1__byteE1_ptr1__ret_intE1
	movl 16(%rsi), %ecx
	cltd
	idivl %ecx
	movl %edx, %eax
.LB5721:
	movq 8(%rsi), %rcx
	movslq %eax, %rdx
	movl (%rcx,%rdx,4), %ecx
	testl %ecx, %ecx
	je .LB5723
.LB5722:
	incl %eax
	movl 16(%rsi), %ecx
	cltd
	idivl %ecx
	movl %edx, %eax
	jmp .LB5721
.LB5723:
	movq (%rbx,%r13,8), %rcx
	movq (%rsi), %r8
	movq %rcx, (%r8,%rdx,8)
	movl (%r12,%r13,4), %ecx
	movq 8(%rsi), %r8
	movl %ecx, (%r8,%rdx,4)
	jmp .LB5710
	.text
	.globl IDEKA__ilink__lm_put__3__LkMapE1_ptr1__byteE1_ptr1__intE1__ret_boolE1
	.def IDEKA__ilink__lm_put__3__LkMapE1_ptr1__byteE1_ptr1__intE1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
IDEKA__ilink__lm_put__3__LkMapE1_ptr1__byteE1_ptr1__intE1__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
.LB5769:
	movq %rcx, %rsi
	movq %rdx, %rdi
	movl %r8d, %ebx
	movl 20(%rsi), %eax
	incl %eax
	shll $1, %eax
	movl 16(%rsi), %ecx
	cmpl %ecx, %eax
	jg .LB5785
.LB5787:
	movq %rdi, %rcx
	callq IDEKA__ilink__lk_hash__1__byteE1_ptr1__ret_intE1
	movl 16(%rsi), %ecx
	cltd
	idivl %ecx
	movl %edx, %eax
	movq %rax, %r12
.LB5797:
	movq 8(%rsi), %rax
	movslq %r12d, %rcx
	movl (%rax,%rcx,4), %eax
	testl %eax, %eax
	je .LB5799
.LB5798:
	movq (%rsi), %rax
	movslq %r12d, %rcx
	movq (%rax,%rcx,8), %rcx
	movq %rdi, %rdx
	callq IDEKA__ilink__lk_streq__2__byteE1_ptr1__byteE1_ptr1__ret_boolE1
	testb %al, %al
	jne .LB5817
.LB5818:
	leal 1(%r12), %eax
	movl 16(%rsi), %ecx
	cltd
	idivl %ecx
	movl %edx, %r12d
	jmp .LB5797
.LB5785:
	movq %rsi, %rcx
	callq IDEKA__ilink__lm_grow__1__LkMapE1_ptr1__ret_voidE1
	jmp .LB5787
.LB5799:
	movq (%rsi), %rax
	movq %rdi, (%rax,%rcx,8)
	incl %ebx
	movq 8(%rsi), %rax
	movl %ebx, (%rax,%rcx,4)
	movl 20(%rsi), %eax
	incl %eax
	movl %eax, 20(%rsi)
	movl $1, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB5817:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
	.text
	.globl IDEKA__ilink__lk_align_up__2__dataE1_sbits64__dataE1_sbits64__ret_dataE1_sbits64
	.def IDEKA__ilink__lk_align_up__2__dataE1_sbits64__dataE1_sbits64__ret_dataE1_sbits64;
	.scl 2;
	.type 32;
	.endef
IDEKA__ilink__lk_align_up__2__dataE1_sbits64__dataE1_sbits64__ret_dataE1_sbits64:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
.LB5853:
	movq %rdx, %rsi
	cmpq $1, %rsi
	jle .LB5859
.LB5860:
	addq %rsi, %rcx
	leaq -1(%rcx), %rax
	cqto
	idivq %rsi
	imulq %rsi, %rax
	movq 0(%rsp), %rsi
	addq $16, %rsp
	ret
.LB5859:
	movq %rcx, %rax
	movq 0(%rsp), %rsi
	addq $16, %rsp
	ret
	.text
	.globl IDEKA__ilink__le_fail__2__ElfLinkE1_ptr1__byteE1_ptr1__ret_boolE1
	.def IDEKA__ilink__le_fail__2__ElfLinkE1_ptr1__byteE1_ptr1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
IDEKA__ilink__le_fail__2__ElfLinkE1_ptr1__byteE1_ptr1__ret_boolE1:
.LB5872:
	movq (%rcx), %rax
	testq %rax, %rax
	je .LB5884
.LB5885:
	xorl %eax, %eax
	ret
.LB5884:
	movq %rdx, (%rcx)
	xorl %eax, %eax
	ret
	.text
	.globl IDEKA__ilink__le_group__2__dataE1_sbits64__intE1__ret_intE1
	.def IDEKA__ilink__le_group__2__dataE1_sbits64__intE1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
IDEKA__ilink__le_group__2__dataE1_sbits64__intE1__ret_intE1:
.LB5890:
	movq %rcx, %rax
	andq $2, %rax
	testq %rax, %rax
	je .LB5898
.LB5899:
	movq %rcx, %rax
	andq $4, %rax
	testq %rax, %rax
	jne .LB5907
.LB5908:
	cmpl $8, %edx
	je .LB5912
.LB5913:
	andq $1, %rcx
	jne .LB5920
.LB5921:
	movl $1, %eax
	ret
.LB5920:
	movl $2, %eax
	ret
.LB5912:
	movl $3, %eax
	ret
.LB5907:
	xorl %eax, %eax
	ret
.LB5898:
	movabsq $4294967295, %rax
	ret
	.text
	.globl IDEKA__ilink__le_count_obj__2__ElfLinkE1_ptr1__intE1__ret_boolE1
	.def IDEKA__ilink__le_count_obj__2__ElfLinkE1_ptr1__intE1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
IDEKA__ilink__le_count_obj__2__ElfLinkE1_ptr1__intE1__ret_boolE1:
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
.LB5923:
	movq %rcx, %rsi
	movl %edx, %edi
	movq 24(%rsi), %rax
	movslq %edi, %rbx
	movq (%rax,%rbx,8), %r12
	movq 32(%rsi), %rax
	movl (%rax,%rbx,4), %r13d
	cmpl $64, %r13d
	jl .LB5948
.LB5949:
	movzbl (%r12), %eax
	cmpl $127, %eax
	jne .LB6007
.LB5983:
	movzbl 1(%r12), %eax
	cmpl $69, %eax
	jne .LB6007
.LB5991:
	movzbl 2(%r12), %eax
	cmpl $76, %eax
	jne .LB6007
.LB5999:
	movzbl 3(%r12), %eax
	cmpl $70, %eax
	jne .LB6007
.LB6008:
	movzbl 4(%r12), %eax
	cmpl $2, %eax
	jne .LB6053
.LB6045:
	movzbl 5(%r12), %eax
	cmpl $1, %eax
	jne .LB6053
.LB6054:
	movq %r12, %rcx
	movq $16, %rdx
	callq IDEKA__ilink__lk_r16__2__byteE1_ptr1__intE1__ret_intE1
	cmpl $1, %eax
	jne .LB6104
.LB6105:
	movq %r12, %rcx
	movq $18, %rdx
	callq IDEKA__ilink__lk_r16__2__byteE1_ptr1__intE1__ret_intE1
	cmpl $62, %eax
	jne .LB6149
.LB6150:
	movq %r12, %rcx
	movq $40, %rdx
	callq IDEKA__ilink__lk_r64__2__byteE1_ptr1__intE1__ret_dataE1_sbits64
	movl %eax, %r14d
	movq %r12, %rcx
	movq $60, %rdx
	callq IDEKA__ilink__lk_r16__2__byteE1_ptr1__intE1__ret_intE1
	movl %eax, %r15d
	cmpl $0, %r14d
	jle .LB6203
.LB6194:
	movl %r15d, %eax
	shll $6, %eax
	addl %r14d, %eax
	cmpl %r13d, %eax
	jg .LB6203
.LB6204:
	movq 48(%rsi), %rax
	movl %r15d, (%rax,%rbx,4)
	movq 64(%rsi), %rax
	movl $0, (%rax,%rbx,4)
	xorl %ebx, %ebx
.LB6253:
	cmpl %r15d, %ebx
	jge .LB6255
.LB6254:
	movl %ebx, %eax
	shll $6, %eax
	leal (%r14,%rax), %r13d
	leal 4(%r13), %edx
	movq %r12, %rcx
	callq IDEKA__ilink__lk_r32__2__byteE1_ptr1__intE1__ret_dataE1_sbits64
	cmpl $2, %eax
	je .LB6269
.LB6271:
	incl %ebx
	cmpl %r15d, %ebx
	jl .LB6254
.LB6255:
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
.LB6269:
	leal 32(%r13), %edx
	movq %r12, %rcx
	callq IDEKA__ilink__lk_r64__2__byteE1_ptr1__intE1__ret_dataE1_sbits64
	movabsq $3074457345618258603, %rcx
	imulq %rcx
	sarq $2, %rdx
	movq %rdx, %rax
	shrq $63, %rax
	addq %rdx, %rax
	movq 64(%rsi), %rcx
	movslq %edi, %rdx
	movl %eax, (%rcx,%rdx,4)
	jmp .LB6271
.LB6203:
	movl $543449442, -81(%rbp)
	movl $1952671091, -77(%rbp)
	movl $544108393, -73(%rbp)
	movl $1684104552, -69(%rbp)
	movl $1948283493, -65(%rbp)
	movl $1701601889, -61(%rbp)
	movb $0, -57(%rbp)
	leaq -81(%rbp), %rdx
	movq %rsi, %rcx
	callq IDEKA__ilink__le_fail__2__ElfLinkE1_ptr1__byteE1_ptr1__ret_boolE1
	movzbl %al, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB6149:
	movl $1970302569, -111(%rbp)
	movl $1936269428, -107(%rbp)
	movl $1953459744, -103(%rbp)
	movl $544104736, -99(%rbp)
	movl $758528120, -95(%rbp)
	movl $1864381494, -91(%rbp)
	movl $1667590754, -87(%rbp)
	movw $116, -83(%rbp)
	leaq -111(%rbp), %rdx
	movq %rsi, %rcx
	callq IDEKA__ilink__le_fail__2__ElfLinkE1_ptr1__byteE1_ptr1__ret_boolE1
	movzbl %al, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB6104:
	movl $1970302569, -145(%rbp)
	movl $1936269428, -141(%rbp)
	movl $1953459744, -137(%rbp)
	movl $1914724640, -133(%rbp)
	movl $1668246629, -129(%rbp)
	movl $1650553953, -125(%rbp)
	movl $1864394092, -121(%rbp)
	movl $1667590754, -117(%rbp)
	movw $116, -113(%rbp)
	leaq -145(%rbp), %rdx
	movq %rsi, %rcx
	callq IDEKA__ilink__le_fail__2__ElfLinkE1_ptr1__byteE1_ptr1__ret_boolE1
	movzbl %al, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB6053:
	movl $1970302569, -185(%rbp)
	movl $1936269428, -181(%rbp)
	movl $1953459744, -177(%rbp)
	movl $1814061344, -173(%rbp)
	movl $1819571305, -169(%rbp)
	movl $1852121189, -165(%rbp)
	movl $1851877732, -161(%rbp)
	movl $1179403552, -157(%rbp)
	movl $1713386550, -153(%rbp)
	movl $6646889, -149(%rbp)
	leaq -185(%rbp), %rdx
	movq %rsi, %rcx
	callq IDEKA__ilink__le_fail__2__ElfLinkE1_ptr1__byteE1_ptr1__ret_boolE1
	movzbl %al, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB6007:
	movl $1970302569, -210(%rbp)
	movl $1936269428, -206(%rbp)
	movl $1953459744, -202(%rbp)
	movl $544104736, -198(%rbp)
	movl $541477957, -194(%rbp)
	movl $1701603686, -190(%rbp)
	movb $0, -186(%rbp)
	leaq -210(%rbp), %rdx
	movq %rsi, %rcx
	callq IDEKA__ilink__le_fail__2__ElfLinkE1_ptr1__byteE1_ptr1__ret_boolE1
	movzbl %al, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB5948:
	movl $1701470831, -232(%rbp)
	movl $1713402979, -228(%rbp)
	movl $543517801, -224(%rbp)
	movl $544173940, -220(%rbp)
	movl $1818324339, -216(%rbp)
	movw $108, -212(%rbp)
	leaq -232(%rbp), %rdx
	movq %rsi, %rcx
	callq IDEKA__ilink__le_fail__2__ElfLinkE1_ptr1__byteE1_ptr1__ret_boolE1
	movzbl %al, %eax
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
	.globl IDEKA__ilink__le_load_obj__2__ElfLinkE1_ptr1__intE1__ret_boolE1
	.def IDEKA__ilink__le_load_obj__2__ElfLinkE1_ptr1__intE1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
IDEKA__ilink__le_load_obj__2__ElfLinkE1_ptr1__intE1__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $320, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
	movq %r14, -48(%rbp)
	movq %r15, -56(%rbp)
.LB6292:
	movq %rcx, %rsi
	movl %edx, %edi
	movq 24(%rsi), %rax
	movslq %edi, %rbx
	movq (%rax,%rbx,8), %r12
	movq %r12, %rcx
	movq $40, %rdx
	callq IDEKA__ilink__lk_r64__2__byteE1_ptr1__intE1__ret_dataE1_sbits64
	movq %rax, -240(%rbp)
	movq 48(%rsi), %rax
	movl (%rax,%rbx,4), %eax
	movq %rax, -224(%rbp)
	movq %r12, %rcx
	movq $62, %rdx
	callq IDEKA__ilink__lk_r16__2__byteE1_ptr1__intE1__ret_intE1
	movq -224(%rbp), %rcx
	cmpl %ecx, %eax
	jge .LB6334
.LB6335:
	shll $6, %eax
	movq -240(%rbp), %rcx
	addl %eax, %ecx
	leal 24(%rcx), %edx
	movq %r12, %rcx
	callq IDEKA__ilink__lk_r64__2__byteE1_ptr1__intE1__ret_dataE1_sbits64
	movq %rax, -216(%rbp)
	movq $0, -232(%rbp)
	movq $0, -152(%rbp)
	movq $0, -160(%rbp)
	movq $0, -168(%rbp)
	movq $0, -176(%rbp)
	movq $0, -184(%rbp)
	movq $0, -192(%rbp)
	movq $0, -200(%rbp)
	movq $0, -208(%rbp)
.LB6373:
	movq -152(%rbp), %rax
	movq -224(%rbp), %rcx
	cmpl %ecx, %eax
	jge .LB6375
.LB6374:
	movq -152(%rbp), %rax
	movl %eax, %ecx
	shll $6, %ecx
	movq -240(%rbp), %rdx
	leal (%rdx,%rcx), %ebx
	movq 40(%rsi), %rcx
	movslq %edi, %rdx
	movl (%rcx,%rdx,4), %ecx
	leal (%rcx,%rax), %r13d
	movq 80(%rsi), %rax
	movslq %r13d, %rcx
	movl %edi, (%rax,%rcx,4)
	movq %r12, %rcx
	movq %rbx, %rdx
	callq IDEKA__ilink__lk_r32__2__byteE1_ptr1__intE1__ret_dataE1_sbits64
	movq -216(%rbp), %rcx
	movslq %ecx, %rcx
	movslq %eax, %rax
	leaq (%r12,%rcx,1), %rcx
	leaq (%rcx,%rax,1), %rax
	movq 88(%rsi), %rcx
	movslq %r13d, %r14
	movq %rax, (%rcx,%r14,8)
	leal 4(%rbx), %edx
	movq %r12, %rcx
	callq IDEKA__ilink__lk_r32__2__byteE1_ptr1__intE1__ret_dataE1_sbits64
	movl %eax, %r15d
	movq 96(%rsi), %rax
	movl %r15d, (%rax,%r14,4)
	leal 8(%rbx), %edx
	movq %r12, %rcx
	callq IDEKA__ilink__lk_r64__2__byteE1_ptr1__intE1__ret_dataE1_sbits64
	movq 104(%rsi), %rcx
	movq %rax, (%rcx,%r14,8)
	leal 24(%rbx), %edx
	movq %r12, %rcx
	callq IDEKA__ilink__lk_r64__2__byteE1_ptr1__intE1__ret_dataE1_sbits64
	movq 112(%rsi), %rcx
	movl %eax, (%rcx,%r14,4)
	leal 32(%rbx), %edx
	movq %r12, %rcx
	callq IDEKA__ilink__lk_r64__2__byteE1_ptr1__intE1__ret_dataE1_sbits64
	movq 120(%rsi), %rcx
	movl %eax, (%rcx,%r14,4)
	leal 48(%rbx), %edx
	movq %r12, %rcx
	callq IDEKA__ilink__lk_r64__2__byteE1_ptr1__intE1__ret_dataE1_sbits64
	movq 128(%rsi), %rcx
	movl %eax, (%rcx,%r14,4)
	movq 128(%rsi), %rax
	leaq (%rax,%r14,4), %rax
	movl (%rax), %ecx
	cmpl $1, %ecx
	jl .LB6490
.LB6492:
	leal 44(%rbx), %edx
	movq %r12, %rcx
	callq IDEKA__ilink__lk_r32__2__byteE1_ptr1__intE1__ret_dataE1_sbits64
	movq 152(%rsi), %rcx
	movslq %r13d, %r14
	movl %eax, (%rcx,%r14,4)
	movq 104(%rsi), %rax
	movq (%rax,%r14,8), %rcx
	movq %r15, %rdx
	callq IDEKA__ilink__le_group__2__dataE1_sbits64__intE1__ret_intE1
	movq 136(%rsi), %rcx
	movl %eax, (%rcx,%r14,4)
	movq 144(%rsi), %rax
	movq $0, (%rax,%r14,8)
	movq 160(%rsi), %rax
	movl $0, (%rax,%r14,4)
	movq 104(%rsi), %rax
	movq (%rax,%r14,8), %rax
	andq $1024, %rax
	jne .LB6559
.LB6560:
	cmpl $8, %r15d
	je .LB6639
.LB6607:
	testl %r15d, %r15d
	je .LB6639
.LB6612:
	movq 112(%rsi), %rax
	movl (%rax,%r14,4), %eax
	movq 120(%rsi), %rcx
	movl (%rcx,%r14,4), %ecx
	addl %ecx, %eax
	movq 32(%rsi), %rcx
	movslq %edi, %rdx
	movl (%rcx,%rdx,4), %ecx
	cmpl %ecx, %eax
	jg .LB6638
.LB6639:
	cmpl $2, %r15d
	je .LB6673
.LB6674:
	movq -232(%rbp), %rax
	movq -160(%rbp), %rcx
	movq -168(%rbp), %rdx
	movq -176(%rbp), %r8
	movq -184(%rbp), %r9
	movq -192(%rbp), %rbx
	movq -200(%rbp), %r13
	movq -208(%rbp), %r14
.LB6675:
	movq -152(%rbp), %r15
	incl %r15d
	movq %rax, -232(%rbp)
	movq %r15, -152(%rbp)
	movq %rcx, -160(%rbp)
	movq %rdx, -168(%rbp)
	movq %r8, -176(%rbp)
	movq %r9, -184(%rbp)
	movq %rbx, -192(%rbp)
	movq %r13, -200(%rbp)
	movq %r14, -208(%rbp)
	jmp .LB6373
.LB6375:
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
.LB6490:
	movl $1, (%rax)
	jmp .LB6492
.LB6673:
	leal 40(%rbx), %edx
	movq %r12, %rcx
	callq IDEKA__ilink__lk_r32__2__byteE1_ptr1__intE1__ret_dataE1_sbits64
	movq %rax, -256(%rbp)
	shll $6, %eax
	movq -240(%rbp), %rcx
	addl %eax, %ecx
	leal 24(%rcx), %edx
	movq %r12, %rcx
	callq IDEKA__ilink__lk_r64__2__byteE1_ptr1__intE1__ret_dataE1_sbits64
	movq 72(%rsi), %rcx
	movslq %edi, %rdx
	movl %eax, (%rcx,%rdx,4)
	movq 72(%rsi), %rax
	movl (%rax,%rdx,4), %eax
	movq %rax, -280(%rbp)
	movq 120(%rsi), %rax
	movslq %r13d, %rcx
	movl (%rax,%rcx,4), %eax
	movslq %eax, %rax
	movabsq $2863311531, %rdx
	imulq %rax, %rdx
	sarq $36, %rdx
	shrq $63, %rax
	addl %edx, %eax
	movq %rax, -272(%rbp)
	movq 112(%rsi), %rax
	movl (%rax,%rcx,4), %eax
	movq %rax, -264(%rbp)
	movq -184(%rbp), %r9
	movq $0, -248(%rbp)
	movq -208(%rbp), %r14
.LB6720:
	movq -248(%rbp), %rax
	movq -272(%rbp), %rcx
	cmpl %ecx, %eax
	jge .LB6722
.LB6721:
	movq 56(%rsi), %rax
	movslq %edi, %rcx
	movl (%rax,%rcx,4), %eax
	movq -248(%rbp), %rcx
	leal (%rax,%rcx), %ebx
	movq 168(%rsi), %rax
	movslq %ebx, %rdx
	movl %edi, (%rax,%rdx,4)
	imull $24, %ecx, %ecx
	movq -264(%rbp), %rax
	leal (%rax,%rcx), %r13d
	movq %r12, %rcx
	movq %r13, %rdx
	callq IDEKA__ilink__lk_r32__2__byteE1_ptr1__intE1__ret_dataE1_sbits64
	movq -280(%rbp), %rcx
	movslq %ecx, %rcx
	movslq %eax, %rax
	leaq (%r12,%rcx,1), %rcx
	leaq (%rcx,%rax,1), %rax
	movq 176(%rsi), %rcx
	movslq %ebx, %r14
	movq %rax, (%rcx,%r14,8)
	leal 4(%r13), %edx
	movq %r12, %rcx
	callq IDEKA__ilink__lk_r8__2__byteE1_ptr1__intE1__ret_intE1
	movl %eax, %r15d
	movq 184(%rsi), %rax
	movl %r15d, (%rax,%r14,4)
	leal 6(%r13), %edx
	movq %r12, %rcx
	callq IDEKA__ilink__lk_r16__2__byteE1_ptr1__intE1__ret_intE1
	movq 192(%rsi), %rcx
	movl %eax, (%rcx,%r14,4)
	leal 8(%r13), %edx
	movq %r12, %rcx
	callq IDEKA__ilink__lk_r64__2__byteE1_ptr1__intE1__ret_dataE1_sbits64
	movq 200(%rsi), %rcx
	movq %rax, (%rcx,%r14,8)
	leal 16(%r13), %edx
	movq %r12, %rcx
	callq IDEKA__ilink__lk_r64__2__byteE1_ptr1__intE1__ret_dataE1_sbits64
	movq 208(%rsi), %rcx
	movq %rax, (%rcx,%r14,8)
	movq 216(%rsi), %rax
	movl $4294967295, (%rax,%r14,4)
	movq 224(%rsi), %rax
	movl $4294967295, (%rax,%r14,4)
	movq 232(%rsi), %rax
	movl $4294967295, (%rax,%r14,4)
	movq 240(%rsi), %rax
	movq $0, (%rax,%r14,8)
	movq -248(%rbp), %rax
	incl %eax
	movq %rbx, %r9
	movq %rax, -248(%rbp)
	movq %r15, %r14
	jmp .LB6720
.LB6722:
	movq -280(%rbp), %rax
	movq -152(%rbp), %rcx
	movq -256(%rbp), %rdx
	movq -272(%rbp), %r8
	movq -248(%rbp), %rbx
	movq -264(%rbp), %r13
	jmp .LB6675
.LB6638:
	movl $1952671091, -81(%rbp)
	movl $544108393, -77(%rbp)
	movl $1937012079, -73(%rbp)
	movl $543515753, -69(%rbp)
	movl $543516788, -65(%rbp)
	movl $1701603686, -61(%rbp)
	movb $0, -57(%rbp)
	leaq -81(%rbp), %rdx
	movq %rsi, %rcx
	callq IDEKA__ilink__le_fail__2__ElfLinkE1_ptr1__byteE1_ptr1__ret_boolE1
	movzbl %al, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB6559:
	movl $1701996660, -119(%rbp)
	movl $1814062177, -115(%rbp)
	movl $1818321775, -111(%rbp)
	movl $1869902624, -107(%rbp)
	movl $1701273970, -103(%rbp)
	movl $544434464, -99(%rbp)
	movl $544501614, -95(%rbp)
	movl $1886418291, -91(%rbp)
	movl $1702130287, -87(%rbp)
	movw $100, -83(%rbp)
	leaq -119(%rbp), %rdx
	movq %rsi, %rcx
	callq IDEKA__ilink__le_fail__2__ElfLinkE1_ptr1__byteE1_ptr1__ret_boolE1
	movzbl %al, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB6334:
	movl $543449442, -142(%rbp)
	movl $1952671091, -138(%rbp)
	movl $544108393, -134(%rbp)
	movl $1701667182, -130(%rbp)
	movl $1650553888, -126(%rbp)
	movw $25964, -122(%rbp)
	movb $0, -120(%rbp)
	leaq -142(%rbp), %rdx
	movq %rsi, %rcx
	callq IDEKA__ilink__le_fail__2__ElfLinkE1_ptr1__byteE1_ptr1__ret_boolE1
	movzbl %al, %eax
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
	.globl IDEKA__ilink__le_open_lib__4__ElfLinkE1_ptr1__byteE1_ptr1__byteE1_ptr2__intE1__ret_boolE1
	.def IDEKA__ilink__le_open_lib__4__ElfLinkE1_ptr1__byteE1_ptr1__byteE1_ptr2__intE1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
IDEKA__ilink__le_open_lib__4__ElfLinkE1_ptr1__byteE1_ptr1__byteE1_ptr2__intE1__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $336, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
	movq %r14, -48(%rbp)
	movq %r15, -56(%rbp)
.LB6864:
	movq %rcx, -288(%rbp)
	movq %rdx, -280(%rbp)
	movq %r8, %rsi
	movl 248(%rcx), %eax
	movq %rax, -232(%rbp)
	movl $0, -60(%rbp)
	movslq %r9d, %rdi
	xorl %ebx, %ebx
	xorl %r12d, %r12d
.LB6895:
	cmpq %rdi, %r12
	jge .LB6897
.LB6901:
	testq %rbx, %rbx
	jne .LB6897
.LB6896:
	movq (%rsi,%r12,8), %rcx
	movw $47, -163(%rbp)
	leaq -163(%rbp), %rdx
	callq IDEKA__ilink__lk_cat2__2__byteE1_ptr1__byteE1_ptr1__ret_byteE1_ptr1
	movq %rax, %rbx
	movq %rbx, %rcx
	movq -280(%rbp), %rdx
	callq IDEKA__ilink__lk_cat2__2__byteE1_ptr1__byteE1_ptr1__ret_byteE1_ptr1
	movq %rax, %r13
	leaq -60(%rbp), %rdx
	movq %r13, %rcx
	callq IDEKA__ilink__lk_read_file__2__byteE1_ptr1__intE1_ptr1__ret_byteE1_ptr1
	movq %rax, %r14
	movq %rbx, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__byteE1_ptr1__ret_voidE1
	movq %r13, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__byteE1_ptr1__ret_voidE1
	incq %r12
	movq %r14, %rbx
	cmpq %rdi, %r12
	jl .LB6901
.LB6897:
	testq %rbx, %rbx
	je .LB6934
.LB6935:
	movl -60(%rbp), %eax
	cmpl $64, %eax
	jl .LB7011
.LB6973:
	movzbl (%rbx), %eax
	cmpl $127, %eax
	jne .LB7011
.LB6981:
	movzbl 1(%rbx), %eax
	cmpl $69, %eax
	jne .LB7011
.LB6989:
	movzbl 2(%rbx), %eax
	cmpl $76, %eax
	jne .LB7011
.LB6997:
	movzbl 3(%rbx), %eax
	cmpl $70, %eax
	jne .LB7011
.LB7005:
	movq %rbx, %rcx
	movq $16, %rdx
	callq IDEKA__ilink__lk_r16__2__byteE1_ptr1__intE1__ret_intE1
	cmpl $3, %eax
	jne .LB7011
.LB7012:
	movq %rbx, %rcx
	movq $40, %rdx
	callq IDEKA__ilink__lk_r64__2__byteE1_ptr1__intE1__ret_dataE1_sbits64
	movl %eax, %esi
	movq %rbx, %rcx
	movq $60, %rdx
	callq IDEKA__ilink__lk_r16__2__byteE1_ptr1__intE1__ret_intE1
	movq %rax, -240(%rbp)
	xorl %edi, %edi
	movq $0, -176(%rbp)
	movl $4294967295, %r10d
	movq %r10, -184(%rbp)
	movq $0, -192(%rbp)
	movl $4294967295, %r10d
	movq %r10, -200(%rbp)
	movl $4294967295, %r10d
	movq %r10, -208(%rbp)
	movq $0, -216(%rbp)
	movq $0, -224(%rbp)
.LB7060:
	movq -240(%rbp), %rax
	cmpl %eax, %edi
	jge .LB7062
.LB7061:
	movl %edi, %eax
	shll $6, %eax
	leal (%rsi,%rax), %r12d
	leal 4(%r12), %edx
	movq %rbx, %rcx
	callq IDEKA__ilink__lk_r32__2__byteE1_ptr1__intE1__ret_dataE1_sbits64
	movl %eax, %r13d
	cmpl $11, %r13d
	je .LB7077
.LB7078:
	movq -176(%rbp), %r10
	movq %r10, -248(%rbp)
	movq -184(%rbp), %r10
	movq %r10, -256(%rbp)
	movq -192(%rbp), %r10
	movq %r10, -264(%rbp)
	movq -224(%rbp), %r10
	movq %r10, -272(%rbp)
.LB7079:
	cmpl $1879048191, %r13d
	je .LB7107
.LB7108:
	movq -200(%rbp), %r14
.LB7109:
	cmpl $1879048189, %r13d
	je .LB7117
.LB7118:
	movq -208(%rbp), %rax
	movq -216(%rbp), %rcx
.LB7119:
	incl %edi
	movq -248(%rbp), %r10
	movq %r10, -176(%rbp)
	movq -256(%rbp), %r10
	movq %r10, -184(%rbp)
	movq -264(%rbp), %r10
	movq %r10, -192(%rbp)
	movq %r14, -200(%rbp)
	movq %rax, -208(%rbp)
	movq %rcx, -216(%rbp)
	movq -272(%rbp), %r10
	movq %r10, -224(%rbp)
	jmp .LB7060
.LB7062:
	movq -184(%rbp), %rax
	testl %eax, %eax
	js .LB7134
.LB7135:
	movq -288(%rbp), %rax
	movq 256(%rax), %rcx
	movq -232(%rbp), %rdx
	movslq %edx, %rdx
	movq -280(%rbp), %rsi
	movq %rsi, (%rcx,%rdx,8)
	movq 264(%rax), %rax
	movq %rbx, (%rax,%rdx,8)
	movl -60(%rbp), %eax
	movq -288(%rbp), %rcx
	movq 272(%rcx), %rsi
	movl %eax, (%rsi,%rdx,4)
	movq 280(%rcx), %rax
	movq -184(%rbp), %rsi
	movl %esi, (%rax,%rdx,4)
	movq 288(%rcx), %rax
	movq -224(%rbp), %rcx
	movl %ecx, (%rax,%rdx,4)
	movq -288(%rbp), %rax
	movq 296(%rax), %rcx
	movq -192(%rbp), %rsi
	movl %esi, (%rcx,%rdx,4)
	movq 304(%rax), %rcx
	movq -200(%rbp), %rsi
	movl %esi, (%rcx,%rdx,4)
	movq 312(%rax), %rax
	movq -208(%rbp), %rcx
	movl %ecx, (%rax,%rdx,4)
	movq -288(%rbp), %rax
	movq 320(%rax), %rcx
	movq -216(%rbp), %rsi
	movl %esi, (%rcx,%rdx,4)
	movq 328(%rax), %rcx
	movl $0, (%rcx,%rdx,4)
	movl 248(%rax), %eax
	incl %eax
	movq -288(%rbp), %rcx
	movl %eax, 248(%rcx)
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
.LB7134:
	movl $1919052140, -96(%rbp)
	movl $544830049, -92(%rbp)
	movl $544432488, -88(%rbp)
	movl $1679847278, -84(%rbp)
	movl $1835101817, -80(%rbp)
	movl $1931502441, -76(%rbp)
	movl $1868721529, -72(%rbp)
	movl $1635000428, -68(%rbp)
	movl $6646882, -64(%rbp)
	leaq -96(%rbp), %rdx
	movq -288(%rbp), %rcx
	callq IDEKA__ilink__le_fail__2__ElfLinkE1_ptr1__byteE1_ptr1__ret_boolE1
	movzbl %al, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB7077:
	leal 24(%r12), %edx
	movq %rbx, %rcx
	callq IDEKA__ilink__lk_r64__2__byteE1_ptr1__intE1__ret_dataE1_sbits64
	movq %rax, -296(%rbp)
	leal 32(%r12), %edx
	movq %rbx, %rcx
	callq IDEKA__ilink__lk_r64__2__byteE1_ptr1__intE1__ret_dataE1_sbits64
	movabsq $3074457345618258603, %rcx
	imulq %rcx
	sarq $2, %rdx
	movq %rdx, %rax
	shrq $63, %rax
	addq %rdx, %rax
	movl %eax, %r14d
	leal 40(%r12), %edx
	movq %rbx, %rcx
	callq IDEKA__ilink__lk_r32__2__byteE1_ptr1__intE1__ret_dataE1_sbits64
	movl %eax, %r15d
	movl %r15d, %eax
	shll $6, %eax
	addl %esi, %eax
	leal 24(%rax), %edx
	movq %rbx, %rcx
	callq IDEKA__ilink__lk_r64__2__byteE1_ptr1__intE1__ret_dataE1_sbits64
	movq %r15, -248(%rbp)
	movq -296(%rbp), %r10
	movq %r10, -256(%rbp)
	movq %rax, -264(%rbp)
	movq %r14, -272(%rbp)
	cmpl $1879048191, %r13d
	jne .LB7108
.LB7107:
	leal 24(%r12), %edx
	movq %rbx, %rcx
	callq IDEKA__ilink__lk_r64__2__byteE1_ptr1__intE1__ret_dataE1_sbits64
	movl %eax, %r14d
	cmpl $1879048189, %r13d
	jne .LB7118
.LB7117:
	leal 24(%r12), %edx
	movq %rbx, %rcx
	callq IDEKA__ilink__lk_r64__2__byteE1_ptr1__intE1__ret_dataE1_sbits64
	movl %eax, %r13d
	leal 44(%r12), %edx
	movq %rbx, %rcx
	callq IDEKA__ilink__lk_r32__2__byteE1_ptr1__intE1__ret_dataE1_sbits64
	movl %eax, %ecx
	movq %r13, %rax
	jmp .LB7119
.LB7011:
	movl $1919052140, -132(%rbp)
	movl $544830049, -128(%rbp)
	movl $1847620457, -124(%rbp)
	movl $1629516911, -120(%rbp)
	movl $1279598702, -116(%rbp)
	movl $1752375366, -112(%rbp)
	movl $1684370017, -108(%rbp)
	movl $1784835872, -104(%rbp)
	movl $7627621, -100(%rbp)
	leaq -132(%rbp), %rdx
	movq -288(%rbp), %rcx
	callq IDEKA__ilink__le_fail__2__ElfLinkE1_ptr1__byteE1_ptr1__ret_boolE1
	movzbl %al, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB6934:
	movl $1852727651, -161(%rbp)
	movl $1713402991, -157(%rbp)
	movl $543452777, -153(%rbp)
	movl $1752375393, -149(%rbp)
	movl $1684370017, -145(%rbp)
	movl $1651076128, -141(%rbp)
	movl $2037539186, -137(%rbp)
	movb $0, -133(%rbp)
	leaq -161(%rbp), %rdx
	movq -288(%rbp), %rcx
	callq IDEKA__ilink__le_fail__2__ElfLinkE1_ptr1__byteE1_ptr1__ret_boolE1
	movzbl %al, %eax
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
	.globl IDEKA__ilink__le_verdef_name__4__ElfLinkE1_ptr1__intE1__intE1__dataE1_ptr1_sbits64__ret_byteE1_ptr1
	.def IDEKA__ilink__le_verdef_name__4__ElfLinkE1_ptr1__intE1__intE1__dataE1_ptr1_sbits64__ret_byteE1_ptr1;
	.scl 2;
	.type 32;
	.endef
IDEKA__ilink__le_verdef_name__4__ElfLinkE1_ptr1__intE1__intE1__dataE1_ptr1_sbits64__ret_byteE1_ptr1:
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
.LB7274:
	movq %rcx, %rsi
	movl %edx, %edi
	movl %r8d, %ebx
	movq %r9, -64(%rbp)
	movq 264(%rsi), %rax
	movslq %edi, %rcx
	movq (%rax,%rcx,8), %r12
	movq 312(%rsi), %rax
	movl (%rax,%rcx,4), %eax
	testl %eax, %eax
	js .LB7301
.LB7302:
	movq %rax, %r13
	xorl %r14d, %r14d
.LB7306:
	movq 320(%rsi), %rax
	movslq %edi, %rcx
	movl (%rax,%rcx,4), %eax
	incl %eax
	cmpl %eax, %r14d
	jge .LB7308
.LB7307:
	leal 4(%r13), %edx
	movq %r12, %rcx
	callq IDEKA__ilink__lk_r16__2__byteE1_ptr1__intE1__ret_intE1
	movl %eax, %r15d
	leal 12(%r13), %edx
	movq %r12, %rcx
	callq IDEKA__ilink__lk_r32__2__byteE1_ptr1__intE1__ret_dataE1_sbits64
	movq %rax, -72(%rbp)
	leal 16(%r13), %edx
	movq %r12, %rcx
	callq IDEKA__ilink__lk_r32__2__byteE1_ptr1__intE1__ret_dataE1_sbits64
	cmpl %ebx, %r15d
	je .LB7336
.LB7337:
	testl %eax, %eax
	je .LB7362
.LB7363:
	addl %eax, %r13d
	incl %r14d
	jmp .LB7306
.LB7308:
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
.LB7362:
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
.LB7336:
	movl -72(%rbp), %ebx
	leal 8(%r13), %edx
	movq %r12, %rcx
	callq IDEKA__ilink__lk_r32__2__byteE1_ptr1__intE1__ret_dataE1_sbits64
	movq -64(%rbp), %rcx
	movq %rax, (%rcx)
	movq 296(%rsi), %rax
	movslq %edi, %rcx
	movl (%rax,%rcx,4), %esi
	leal (%r13,%rbx), %edx
	movq %r12, %rcx
	callq IDEKA__ilink__lk_r32__2__byteE1_ptr1__intE1__ret_dataE1_sbits64
	movslq %esi, %rcx
	movslq %eax, %rax
	leaq (%r12,%rcx,1), %rcx
	leaq (%rcx,%rax,1), %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB7301:
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
	.globl IDEKA__ilink__le_find_import__2__ElfLinkE1_ptr1__byteE1_ptr1__ret_intE1
	.def IDEKA__ilink__le_find_import__2__ElfLinkE1_ptr1__byteE1_ptr1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
IDEKA__ilink__le_find_import__2__ElfLinkE1_ptr1__byteE1_ptr1__ret_intE1:
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
.LB7374:
	movq %rcx, %rsi
	movq %rdx, -80(%rbp)
	leaq 560(%rsi), %rcx
	callq IDEKA__ilink__lm_get__2__LkMapE1_ptr1__byteE1_ptr1__ret_intE1
	movq $0, -64(%rbp)
	testl %eax, %eax
	jns .LB7399
.LB7400:
	movq $0, -88(%rbp)
	xorl %eax, %eax
	xorl %ecx, %ecx
	xorl %edx, %edx
	xorl %edi, %edi
	xorl %r8d, %r8d
.LB7403:
	movl 248(%rsi), %r9d
	movq -88(%rbp), %rbx
	cmpl %r9d, %ebx
	jge .LB7405
.LB7404:
	movq 264(%rsi), %r9
	movq -88(%rbp), %rbx
	movslq %ebx, %rbx
	movq (%r9,%rbx,8), %rbx
	movq %rax, %r12
	movq %rdi, %rax
	movl $4294967295, %r13d
	movq $0, -72(%rbp)
	movl $1, %edi
.LB7420:
	movq 288(%rsi), %r9
	movq -88(%rbp), %r14
	movslq %r14d, %r14
	movl (%r9,%r14,4), %r9d
	cmpl %r9d, %edi
	jl .LB7421
.LB22423:
	movq -72(%rbp), %rdi
.LB7422:
	testl %r13d, %r13d
	jns .LB7533
.LB7534:
	movq -88(%rbp), %rdi
	incl %edi
	movq %rdi, -88(%rbp)
	movq %rax, %rdi
	movq %r12, %rax
	jmp .LB7403
.LB7405:
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
.LB7421:
	movq 280(%rsi), %rax
	movl (%rax,%r14,4), %eax
	imull $24, %edi, %ecx
	leal (%rax,%rcx), %r15d
	movq 296(%rsi), %rax
	movl (%rax,%r14,4), %r14d
	movq %rbx, %rcx
	movq %r15, %rdx
	callq IDEKA__ilink__lk_r32__2__byteE1_ptr1__intE1__ret_dataE1_sbits64
	addl %eax, %r14d
	leal 4(%r15), %edx
	movq %rbx, %rcx
	callq IDEKA__ilink__lk_r8__2__byteE1_ptr1__intE1__ret_intE1
	movq %rax, -96(%rbp)
	sarl $4, %eax
	movq %rax, -104(%rbp)
	leal 6(%r15), %edx
	movq %rbx, %rcx
	callq IDEKA__ilink__lk_r16__2__byteE1_ptr1__intE1__ret_intE1
	testl %eax, %eax
	je .LB7484
.LB7465:
	movq -104(%rbp), %rax
	decl %eax
	cmpl $1, %eax
	ja .LB7484
.LB7475:
	movslq %r14d, %rax
	leaq (%rbx,%rax,1), %rcx
	movq -80(%rbp), %rdx
	callq IDEKA__ilink__lk_streq__2__byteE1_ptr1__byteE1_ptr1__ret_boolE1
	testb %al, %al
	jne .LB7483
.LB7484:
	movq -72(%rbp), %rax
.LB7485:
	incl %edi
	movq -96(%rbp), %rcx
	movq -104(%rbp), %rdx
	movq %r14, %r8
	movq %rax, -72(%rbp)
	movq %r15, %rax
	jmp .LB7420
.LB7483:
	movq 304(%rsi), %rax
	movq -88(%rbp), %rcx
	movslq %ecx, %rcx
	movl (%rax,%rcx,4), %eax
	testl %eax, %eax
	jns .LB7494
.LB7495:
	movl $1, %eax
.LB7496:
	movl %eax, %ecx
	andl $32768, %ecx
	testl %ecx, %ecx
	je .LB7517
.LB7512:
	testl %r13d, %r13d
	js .LB7517
.LB7518:
	movq -72(%rbp), %rcx
.LB7519:
	movq %rax, %r12
	movq %rcx, %rax
	jmp .LB7485
.LB7494:
	movl %edi, %ecx
	shll $1, %ecx
	leal (%rax,%rcx), %edx
	movq %rbx, %rcx
	callq IDEKA__ilink__lk_r16__2__byteE1_ptr1__intE1__ret_intE1
	jmp .LB7496
.LB7517:
	movl %eax, %ecx
	andl $32767, %ecx
	movl %eax, %edx
	andl $32768, %edx
	testl %edx, %edx
	je .LB7526
.LB7527:
	movq %rdi, %r13
	jmp .LB7519
.LB7526:
	movq %rax, %r12
	movq -104(%rbp), %rdx
	movq %r15, %rax
	movq %r14, %r8
	movq %rdi, %r13
	movq %rcx, %rdi
	movq -96(%rbp), %rcx
	testl %r13d, %r13d
	js .LB7534
.LB7533:
	movq 280(%rsi), %rax
	movq -88(%rbp), %rcx
	movslq %ecx, %rcx
	movl (%rax,%rcx,4), %eax
	imull $24, %r13d, %r13d
	leal (%rax,%r13), %r12d
	leal 4(%r12), %edx
	movq %rbx, %rcx
	callq IDEKA__ilink__lk_r8__2__byteE1_ptr1__intE1__ret_intE1
	movl 336(%rsi), %r13d
	movq 344(%rsi), %rcx
	movslq %r13d, %rdx
	movq -80(%rbp), %r8
	movq %r8, (%rcx,%rdx,8)
	movq 352(%rsi), %rcx
	movq -88(%rbp), %r8
	movl %r8d, (%rcx,%rdx,4)
	andl $15, %eax
	cmpl $2, %eax
	je .LB7581
.LB7576:
	cmpl $10, %eax
	je .LB7581
.LB7582:
	movq 360(%rsi), %rax
	movl $1, (%rax,%rdx,4)
.LB7583:
	leal 16(%r12), %edx
	movq %rbx, %rcx
	callq IDEKA__ilink__lk_r64__2__byteE1_ptr1__intE1__ret_dataE1_sbits64
	movq 368(%rsi), %rcx
	movslq %r13d, %rdx
	movq %rax, (%rcx,%rdx,8)
	movq 376(%rsi), %rax
	movl %edi, (%rax,%rdx,4)
	movq 384(%rsi), %rax
	movl $1, (%rax,%rdx,4)
	movq 392(%rsi), %rax
	movl $4294967295, (%rax,%rdx,4)
	movq 400(%rsi), %rax
	movl $4294967295, (%rax,%rdx,4)
	movq 408(%rsi), %rax
	movl $0, (%rax,%rdx,4)
	movq 416(%rsi), %rax
	movq $0, (%rax,%rdx,8)
	movq 424(%rsi), %rax
	movq $0, (%rax,%rdx,8)
	movq 432(%rsi), %rax
	movq $0, (%rax,%rdx,8)
	movq 328(%rsi), %rax
	movq -88(%rbp), %rcx
	movslq %ecx, %rcx
	movl $1, (%rax,%rcx,4)
	cmpl $2, %edi
	jge .LB7692
.LB7694:
	leaq 560(%rsi), %rcx
	movq -80(%rbp), %rdx
	movq %r13, %r8
	callq IDEKA__ilink__lm_put__3__LkMapE1_ptr1__byteE1_ptr1__intE1__ret_boolE1
	movl 336(%rsi), %eax
	incl %eax
	movl %eax, 336(%rsi)
	movl %r13d, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB7581:
	movq 360(%rsi), %rax
	movslq %r13d, %rcx
	movl $2, (%rax,%rcx,4)
	jmp .LB7583
.LB7692:
	leaq -64(%rbp), %r9
	movq %rsi, %rcx
	movq -88(%rbp), %rdx
	movq %rdi, %r8
	callq IDEKA__ilink__le_verdef_name__4__ElfLinkE1_ptr1__intE1__intE1__dataE1_ptr1_sbits64__ret_byteE1_ptr1
	testq %rax, %rax
	je .LB7694
.LB7706:
	xorl %ecx, %ecx
	xorl %edx, %edx
.LB7709:
	movl 448(%rsi), %r8d
	cmpl %r8d, %ecx
	jge .LB7711
.LB7710:
	movq 456(%rsi), %r8
	movslq %ecx, %r9
	movl (%r8,%r9,4), %r8d
	movq -88(%rbp), %rbx
	cmpl %ebx, %r8d
	jne .LB7740
.LB7727:
	movq 480(%rsi), %r8
	movl (%r8,%r9,4), %r8d
	cmpl %edi, %r8d
	je .LB7739
.LB7740:
.LB7741:
	incl %ecx
	jmp .LB7709
.LB7711:
	testl %edx, %edx
	je .LB7748
.LB7749:
.LB7750:
	movq 384(%rsi), %rax
	movslq %r13d, %rcx
	movl %edx, (%rax,%rcx,4)
	jmp .LB7694
.LB7748:
	movq 456(%rsi), %rcx
	movslq %r8d, %rdx
	movq -88(%rbp), %r8
	movl %r8d, (%rcx,%rdx,4)
	movq 464(%rsi), %rcx
	movl 448(%rsi), %edx
	movslq %edx, %rdx
	movq %rax, (%rcx,%rdx,8)
	movq -64(%rbp), %rax
	movq 472(%rsi), %rcx
	movl 448(%rsi), %edx
	movslq %edx, %rdx
	movq %rax, (%rcx,%rdx,8)
	movq 480(%rsi), %rax
	movl 448(%rsi), %ecx
	movslq %ecx, %rcx
	movl %edi, (%rax,%rcx,4)
	movl 448(%rsi), %eax
	leal 2(%rax), %edx
	incl %eax
	movl %eax, 448(%rsi)
	jmp .LB7750
.LB7739:
	leal 2(%rcx), %edx
	jmp .LB7741
.LB7399:
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
	.globl IDEKA__ilink__le_resolve_names__1__ElfLinkE1_ptr1__ret_boolE1
	.def IDEKA__ilink__le_resolve_names__1__ElfLinkE1_ptr1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
IDEKA__ilink__le_resolve_names__1__ElfLinkE1_ptr1__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $96, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
.LB7836:
	movq %rcx, %rsi
	leaq 536(%rsi), %rcx
	movl 16(%rsi), %edx
	callq IDEKA__ilink__lm_init__2__LkMapE1_ptr1__intE1__ret_voidE1
	xorl %edi, %edi
.LB7848:
	movl 16(%rsi), %eax
	cmpl %eax, %edi
	jge .LB7850
.LB7849:
	movq 184(%rsi), %rax
	movslq %edi, %rcx
	movl (%rax,%rcx,4), %eax
	sarl $4, %eax
	movq 192(%rsi), %rdx
	movl (%rdx,%rcx,4), %edx
	cmpl $1, %eax
	jne .LB7900
.LB7874:
	testl %edx, %edx
	je .LB7900
.LB7879:
	cmpl $65522, %edx
	je .LB7900
.LB7884:
	movq 176(%rsi), %rax
	movq (%rax,%rcx,8), %rax
	movzbl (%rax), %eax
	testl %eax, %eax
	jne .LB7898
.LB7900:
	incl %edi
	jmp .LB7848
.LB7850:
	xorl %edi, %edi
.LB7951:
	movl 16(%rsi), %eax
	cmpl %eax, %edi
	jge .LB7953
.LB7952:
	movq 184(%rsi), %rax
	movslq %edi, %rcx
	movl (%rax,%rcx,4), %eax
	sarl $4, %eax
	movq 192(%rsi), %rdx
	movl (%rdx,%rcx,4), %edx
	cmpl $2, %eax
	jne .LB8003
.LB7977:
	testl %edx, %edx
	je .LB8003
.LB7982:
	cmpl $65522, %edx
	je .LB8003
.LB7987:
	movq 176(%rsi), %rax
	movq (%rax,%rcx,8), %rax
	movzbl (%rax), %eax
	testl %eax, %eax
	jne .LB8001
.LB8003:
	incl %edi
	jmp .LB7951
.LB7953:
	xorl %edi, %edi
	xorl %eax, %eax
.LB8017:
	movl 16(%rsi), %ecx
	cmpl %ecx, %edi
	jge .LB8019
.LB8018:
	movq 192(%rsi), %rcx
	movslq %edi, %rdx
	movl (%rcx,%rdx,4), %ecx
	cmpl $65522, %ecx
	jne .LB8049
.LB8034:
	movq 176(%rsi), %rcx
	movq (%rcx,%rdx,8), %rcx
	movzbl (%rcx), %ecx
	testl %ecx, %ecx
	jne .LB8048
.LB8049:
.LB8050:
	incl %edi
	jmp .LB8017
.LB8019:
	xorl %edi, %edi
.LB8122:
	movl 16(%rsi), %ecx
	cmpl %ecx, %edi
	jge .LB8124
.LB8123:
	movq 184(%rsi), %rcx
	movslq %edi, %rbx
	movl (%rcx,%rbx,4), %ecx
	sarl $4, %ecx
	testl %ecx, %ecx
	je .LB8155
.LB8141:
	movq 176(%rsi), %rcx
	movq (%rcx,%rbx,8), %rcx
	movzbl (%rcx), %ecx
	testl %ecx, %ecx
	je .LB8155
.LB8156:
	leaq 536(%rsi), %rcx
	movq 176(%rsi), %rax
	movq (%rax,%rbx,8), %rdx
	callq IDEKA__ilink__lm_get__2__LkMapE1_ptr1__byteE1_ptr1__ret_intE1
	movq 216(%rsi), %rcx
	movl %eax, (%rcx,%rbx,4)
.LB8157:
	incl %edi
	jmp .LB8122
.LB8124:
	movl $1, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB8155:
	movq 192(%rsi), %rcx
	movslq %edi, %rdx
	movl (%rcx,%rdx,4), %ecx
	testl %ecx, %ecx
	jne .LB8166
.LB8168:
	jmp .LB8157
.LB8166:
	movq 216(%rsi), %rcx
	movslq %edi, %rdx
	movl %edi, (%rcx,%rdx,4)
	jmp .LB8168
.LB8048:
	leaq 536(%rsi), %rbx
	movq 176(%rsi), %rax
	movslq %edi, %rcx
	movq (%rax,%rcx,8), %rdx
	movq %rbx, %rcx
	callq IDEKA__ilink__lm_get__2__LkMapE1_ptr1__byteE1_ptr1__ret_intE1
	movl %eax, %r12d
	testl %r12d, %r12d
	js .LB8063
.LB8064:
	movq 192(%rsi), %rax
	movslq %r12d, %rcx
	movl (%rax,%rcx,4), %eax
	cmpl $65522, %eax
	jne .LB8065
.LB8085:
	movq 208(%rsi), %rax
	movslq %edi, %rcx
	movq (%rax,%rcx,8), %rcx
	movslq %r12d, %rdx
	movq (%rax,%rdx,8), %rax
	cmpq %rax, %rcx
	jg .LB8103
.LB8065:
	movq %r12, %rax
	jmp .LB8050
.LB8103:
	movq 208(%rsi), %rax
	movslq %edi, %rcx
	movq (%rax,%rcx,8), %rcx
	movslq %r12d, %rdx
	movq %rcx, (%rax,%rdx,8)
	jmp .LB8065
.LB8063:
	movq 176(%rsi), %rax
	movslq %edi, %rcx
	movq (%rax,%rcx,8), %rdx
	movq %rbx, %rcx
	movq %rdi, %r8
	callq IDEKA__ilink__lm_put__3__LkMapE1_ptr1__byteE1_ptr1__intE1__ret_boolE1
	jmp .LB8065
.LB8001:
	leaq 536(%rsi), %rcx
	movq 176(%rsi), %rax
	movslq %edi, %rdx
	movq (%rax,%rdx,8), %rdx
	movq %rdi, %r8
	callq IDEKA__ilink__lm_put__3__LkMapE1_ptr1__byteE1_ptr1__intE1__ret_boolE1
	jmp .LB8003
.LB7898:
	leaq 536(%rsi), %rcx
	movq 176(%rsi), %rax
	movslq %edi, %rdx
	movq (%rax,%rdx,8), %rdx
	movq %rdi, %r8
	callq IDEKA__ilink__lm_put__3__LkMapE1_ptr1__byteE1_ptr1__intE1__ret_boolE1
	testb %al, %al
	jne .LB7900
.LB7913:
	movl $1819309412, -60(%rbp)
	movl $1952539497, -56(%rbp)
	movl $2037588069, -52(%rbp)
	movl $1819239021, -48(%rbp)
	movl $1717920800, -44(%rbp)
	movl $1953066601, -40(%rbp)
	movl $7237481, -36(%rbp)
	leaq -60(%rbp), %rdx
	movq %rsi, %rcx
	callq IDEKA__ilink__le_fail__2__ElfLinkE1_ptr1__byteE1_ptr1__ret_boolE1
	movzbl %al, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
	.text
	.globl IDEKA__ilink__le_use_symbol__2__ElfLinkE1_ptr1__intE1__ret_boolE1
	.def IDEKA__ilink__le_use_symbol__2__ElfLinkE1_ptr1__intE1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
IDEKA__ilink__le_use_symbol__2__ElfLinkE1_ptr1__intE1__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
.LB8199:
	movq %rcx, %rsi
	movl %edx, %edi
	movq 216(%rsi), %rax
	movslq %edi, %rbx
	movl (%rax,%rbx,4), %eax
	testl %eax, %eax
	jns .LB8224
.LB8212:
	movq 224(%rsi), %rax
	movl (%rax,%rbx,4), %eax
	cmpl $4294967295, %eax
	jne .LB8224
.LB8225:
	movq 184(%rsi), %rax
	movl (%rax,%rbx,4), %r12d
	movq 176(%rsi), %rax
	movq (%rax,%rbx,8), %rdx
	movq %rsi, %rcx
	callq IDEKA__ilink__le_find_import__2__ElfLinkE1_ptr1__byteE1_ptr1__ret_intE1
	testl %eax, %eax
	jns .LB8247
.LB8248:
	sarl $4, %r12d
	cmpl $2, %r12d
	je .LB8261
.LB8262:
	movq 176(%rsi), %rax
	movq (%rax,%rbx,8), %rdx
	movq %rsi, %rcx
	callq IDEKA__ilink__le_fail__2__ElfLinkE1_ptr1__byteE1_ptr1__ret_boolE1
	movzbl %al, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB8261:
	movq 224(%rsi), %rax
	movslq %edi, %rcx
	movl $4294967294, (%rax,%rcx,4)
	movl $1, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB8247:
	movq 224(%rsi), %rcx
	movslq %edi, %rdx
	movl %eax, (%rcx,%rdx,4)
	movl $1, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB8224:
	movl $1, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
	.text
	.globl IDEKA__ilink__le_scan_relocs__1__ElfLinkE1_ptr1__ret_boolE1
	.def IDEKA__ilink__le_scan_relocs__1__ElfLinkE1_ptr1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
IDEKA__ilink__le_scan_relocs__1__ElfLinkE1_ptr1__ret_boolE1:
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
.LB8283:
	movq %rcx, %rsi
	movq $0, -224(%rbp)
	xorl %eax, %eax
	xorl %ecx, %ecx
	xorl %edx, %edx
	xorl %edi, %edi
	xorl %r8d, %r8d
	movq $0, -88(%rbp)
	xorl %r9d, %r9d
	xorl %ebx, %ebx
	xorl %r12d, %r12d
	xorl %r13d, %r13d
.LB8298:
	movl 8(%rsi), %r14d
	movq %r14, -64(%rbp)
	movq -224(%rbp), %r15
	cmpl %r14d, %r15d
	jge .LB8300
.LB8299:
	movq 24(%rsi), %r14
	movq %r14, -72(%rbp)
	movq -224(%rbp), %r15
	movslq %r15d, %r15
	movq %r15, -80(%rbp)
	movq (%r14,%r15,8), %r14
	movq %r14, -208(%rbp)
	movq $0, -136(%rbp)
	movq %rdx, -112(%rbp)
	movq -88(%rbp), %r10
	movq %r10, -192(%rbp)
	movq %r12, -96(%rbp)
	movq %r13, -104(%rbp)
.LB8314:
	movq 48(%rsi), %rdx
	movq -224(%rbp), %r12
	movslq %r12d, %r12
	movq %r12, -120(%rbp)
	movl (%rdx,%r12,4), %edx
	movq -136(%rbp), %r12
	cmpl %edx, %r12d
	jge .LB8316
.LB8315:
	movq 40(%rsi), %rdx
	movq -224(%rbp), %r12
	movslq %r12d, %r12
	movq %r12, -128(%rbp)
	movl (%rdx,%r12,4), %edx
	movq -136(%rbp), %r12
	addl %edx, %r12d
	movq 96(%rsi), %r13
	movq %r13, -144(%rbp)
	movslq %r12d, %r14
	movq %r14, -152(%rbp)
	movl (%r13,%r14,4), %r13d
	movq %r13, -160(%rbp)
	cmpl $4, %r13d
	je .LB8343
.LB8344:
	movq -192(%rbp), %rdx
	movq -96(%rbp), %r13
	movq -104(%rbp), %r10
	movq %r10, -168(%rbp)
.LB8345:
	movq -136(%rbp), %r14
	incl %r14d
	movq %r14, -200(%rbp)
	movq -200(%rbp), %r10
	movq %r10, -136(%rbp)
	movq %r12, -112(%rbp)
	movq %rdx, -192(%rbp)
	movq %r13, -96(%rbp)
	movq -168(%rbp), %r10
	movq %r10, -104(%rbp)
	jmp .LB8314
.LB8300:
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
.LB8316:
	movq -224(%rbp), %rdx
	incl %edx
	movq %rdx, -224(%rbp)
	movq -112(%rbp), %rdx
	movq -192(%rbp), %r10
	movq %r10, -88(%rbp)
	movq -96(%rbp), %r12
	movq -104(%rbp), %r13
	jmp .LB8298
.LB8343:
	movq 152(%rsi), %rdi
	movslq %r12d, %r13
	movq %r13, -176(%rbp)
	movl (%rdi,%r13,4), %edi
	addl %edi, %edx
	movq %rdx, -184(%rbp)
	movq 136(%rsi), %rdi
	movslq %edx, %rdx
	movl (%rdi,%rdx,4), %edx
	testl %edx, %edx
	jns .LB8369
.LB8370:
	movq -192(%rbp), %rdx
	movq -96(%rbp), %rdi
	movq -104(%rbp), %r13
.LB8371:
	movq %r13, -168(%rbp)
	movq %rdi, %r13
	movq -184(%rbp), %rdi
	jmp .LB8345
.LB8369:
	movq 120(%rsi), %rax
	movslq %r12d, %rcx
	movl (%rax,%rcx,4), %eax
	movslq %eax, %rax
	movabsq $2863311531, %rcx
	imulq %rax, %rcx
	sarq $36, %rcx
	shrq $63, %rax
	addl %ecx, %eax
	movq %rax, -216(%rbp)
	xorl %edi, %edi
	movq -192(%rbp), %rdx
	movq -96(%rbp), %rax
	movq -104(%rbp), %r13
.LB8380:
	movq -216(%rbp), %rcx
	cmpl %ecx, %edi
	jge .LB8382
.LB8381:
	movq 112(%rsi), %rax
	movslq %r12d, %rcx
	movl (%rax,%rcx,4), %eax
	imull $24, %edi, %ecx
	leal (%rax,%rcx), %ebx
	leal 8(%rbx), %edx
	movq -208(%rbp), %rcx
	callq IDEKA__ilink__lk_r64__2__byteE1_ptr1__intE1__ret_dataE1_sbits64
	movq %rax, %r13
	movq 56(%rsi), %rax
	movq -224(%rbp), %rcx
	movslq %ecx, %rcx
	movl (%rax,%rcx,4), %eax
	movq %r13, %rcx
	sarq $32, %rcx
	leal (%rax,%rcx), %r14d
	movabsq $4294967295, %rax
	andq %r13, %rax
	movl %eax, %r15d
	movq %rsi, %rcx
	movq %r14, %rdx
	callq IDEKA__ilink__le_use_symbol__2__ElfLinkE1_ptr1__intE1__ret_boolE1
	testb %al, %al
	je .LB8420
.LB8421:
	movq 216(%rsi), %rax
	movslq %r14d, %rcx
	movl (%rax,%rcx,4), %r9d
	movq 224(%rsi), %rax
	movl (%rax,%rcx,4), %eax
	testl %r9d, %r9d
	jns .LB8445
.LB8439:
	testl %eax, %eax
	jns .LB8444
.LB8445:
	testl %r9d, %r9d
	js .LB8446
.LB8648:
	cmpl $9, %r15d
	jne .LB8652
.LB22424:
	movl $1, %ecx
.LB8658:
	testb %cl, %cl
	jne .LB8663
.LB8446:
	incl %edi
	movq %r14, %r8
	movq %r15, %rdx
	movq %rbx, %r11
	movq %rax, %rbx
	movq %r11, %rax
	jmp .LB8380
.LB8382:
	movq -216(%rbp), %rcx
	movq %rax, %r11
	movq %rdi, %rax
	movq %r11, %rdi
	jmp .LB8371
.LB8652:
	cmpl $41, %r15d
	jne .LB8657
.LB22425:
	movl $1, %ecx
	testb %cl, %cl
	jne .LB8663
	jmp .LB8446
.LB8657:
	cmpl $42, %r15d
	sete %cl
	movzbl %cl, %ecx
	testb %cl, %cl
	je .LB8446
.LB8663:
	movq 232(%rsi), %rcx
	movslq %r9d, %rdx
	movl (%rcx,%rdx,4), %ecx
	testl %ecx, %ecx
	jns .LB8446
.LB8673:
	movq 496(%rsi), %rcx
	movl 488(%rsi), %edx
	movslq %edx, %rdx
	movl $1, (%rcx,%rdx,4)
	movq 504(%rsi), %rcx
	movl 488(%rsi), %edx
	movslq %edx, %rdx
	movl %r9d, (%rcx,%rdx,4)
	movl 488(%rsi), %ecx
	movq 232(%rsi), %rdx
	movslq %r9d, %r8
	movl %ecx, (%rdx,%r8,4)
	movl 488(%rsi), %ecx
	incl %ecx
	movl %ecx, 488(%rsi)
	jmp .LB8446
.LB8444:
	cmpl $9, %r15d
	je .LB8459
.LB8449:
	cmpl $41, %r15d
	je .LB8459
.LB8454:
	cmpl $42, %r15d
	je .LB8459
.LB8460:
	movq 360(%rsi), %rcx
	movslq %eax, %rdx
	movl (%rcx,%rdx,4), %ecx
	cmpl $2, %ecx
	je .LB8523
.LB8524:
	movq 408(%rsi), %rcx
	leaq (%rcx,%rdx,4), %rcx
	movl (%rcx), %edx
	testl %edx, %edx
	jne .LB8446
.LB8628:
	movl $1, (%rcx)
	movl 528(%rsi), %ecx
	incl %ecx
	movl %ecx, 528(%rsi)
	jmp .LB8446
.LB8523:
	movq 400(%rsi), %rcx
	movslq %eax, %rdx
	leaq (%rcx,%rdx,4), %rcx
	movl (%rcx), %edx
	testl %edx, %edx
	jns .LB8446
.LB8533:
	movl 512(%rsi), %edx
	movl %edx, (%rcx)
	movq 520(%rsi), %rcx
	movl 512(%rsi), %edx
	movslq %edx, %rdx
	movl %eax, (%rcx,%rdx,4)
	movl 512(%rsi), %ecx
	incl %ecx
	movl %ecx, 512(%rsi)
	movq 392(%rsi), %rcx
	movslq %eax, %rdx
	movl (%rcx,%rdx,4), %ecx
	testl %ecx, %ecx
	jns .LB8446
.LB8575:
	movq 496(%rsi), %rcx
	movl 488(%rsi), %edx
	movslq %edx, %rdx
	movl $0, (%rcx,%rdx,4)
	movq 504(%rsi), %rcx
	movl 488(%rsi), %edx
	movslq %edx, %rdx
	movl %eax, (%rcx,%rdx,4)
	movl 488(%rsi), %ecx
	movq 392(%rsi), %rdx
	movslq %eax, %r8
	movl %ecx, (%rdx,%r8,4)
	movl 488(%rsi), %ecx
	incl %ecx
	movl %ecx, 488(%rsi)
	jmp .LB8446
.LB8459:
	movq 392(%rsi), %rcx
	movslq %eax, %rdx
	movl (%rcx,%rdx,4), %ecx
	testl %ecx, %ecx
	jns .LB8446
.LB8470:
	movq 496(%rsi), %rcx
	movl 488(%rsi), %edx
	movslq %edx, %rdx
	movl $0, (%rcx,%rdx,4)
	movq 504(%rsi), %rcx
	movl 488(%rsi), %edx
	movslq %edx, %rdx
	movl %eax, (%rcx,%rdx,4)
	movl 488(%rsi), %ecx
	movq 392(%rsi), %rdx
	movslq %eax, %r8
	movl %ecx, (%rdx,%r8,4)
	movl 488(%rsi), %ecx
	incl %ecx
	movl %ecx, 488(%rsi)
	jmp .LB8446
.LB8420:
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
	.globl IDEKA__ilink__le_elfhash__1__byteE1_ptr1__ret_dataE1_sbits64
	.def IDEKA__ilink__le_elfhash__1__byteE1_ptr1__ret_dataE1_sbits64;
	.scl 2;
	.type 32;
	.endef
IDEKA__ilink__le_elfhash__1__byteE1_ptr1__ret_dataE1_sbits64:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
	movq %rdi, -8(%rsp)
.LB8724:
	xorl %eax, %eax
	xorl %edx, %edx
.LB8730:
	movslq %edx, %rsi
	movzbl (%rcx,%rsi,1), %esi
	testl %esi, %esi
	je .LB8732
.LB8731:
	shlq $4, %rax
	addq %rsi, %rax
	movabsq $4026531840, %rsi
	andq %rax, %rsi
	movq %rsi, %rdi
	sarq $24, %rdi
	xorq %rax, %rdi
	testq %rsi, %rsi
	cmovne %rdi, %rax
	movabsq $4294967295, %rdi
	subq %rsi, %rdi
	andq %rdi, %rax
	incl %edx
	jmp .LB8730
.LB8732:
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
	.text
	.globl IDEKA__ilink__le_symaddr__2__ElfLinkE1_ptr1__intE1__ret_dataE1_sbits64
	.def IDEKA__ilink__le_symaddr__2__ElfLinkE1_ptr1__intE1__ret_dataE1_sbits64;
	.scl 2;
	.type 32;
	.endef
IDEKA__ilink__le_symaddr__2__ElfLinkE1_ptr1__intE1__ret_dataE1_sbits64:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
	movq %rdi, -8(%rsp)
.LB8770:
	movq 192(%rcx), %rax
	movslq %edx, %rsi
	movl (%rax,%rsi,4), %eax
	cmpl $65521, %eax
	je .LB8784
.LB8785:
	cmpl $65522, %eax
	je .LB8796
.LB8797:
	movq 40(%rcx), %rdi
	movq 168(%rcx), %r8
	movl (%r8,%rsi,4), %esi
	movslq %esi, %rsi
	movl (%rdi,%rsi,4), %esi
	addl %eax, %esi
	movq 144(%rcx), %rax
	movslq %esi, %rsi
	movq (%rax,%rsi,8), %rax
	movq 200(%rcx), %rcx
	movslq %edx, %rdx
	movq (%rcx,%rdx,8), %rcx
	addq %rcx, %rax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB8796:
	movq 240(%rcx), %rax
	movslq %edx, %rcx
	movq (%rax,%rcx,8), %rax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB8784:
	movq 200(%rcx), %rax
	movslq %edx, %rcx
	movq (%rax,%rcx,8), %rax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
	.text
	.globl IDEKA__ilink__le_link_all__4__ElfLinkE1_ptr1__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__ret_boolE1
	.def IDEKA__ilink__le_link_all__4__ElfLinkE1_ptr1__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
IDEKA__ilink__le_link_all__4__ElfLinkE1_ptr1__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__ret_boolE1:
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
.LB8836:
	movq %rcx, %rsi
	movq %rdx, -472(%rbp)
	movq %r8, -632(%rbp)
	movq %r9, -448(%rbp)
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -80(%rbp)
	movb .LZERO+16(%rip), %r10b
	movb %r10b, -64(%rbp)
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -104(%rbp)
	movb .LZERO+16(%rip), %r10b
	movb %r10b, -88(%rbp)
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -120(%rbp)
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -136(%rbp)
	movl $0, -120(%rbp)
	movl $16, -136(%rbp)
	movl $0, -116(%rbp)
	movl $16, -132(%rbp)
	movl $0, -112(%rbp)
	movl $16, -128(%rbp)
	movl $0, -108(%rbp)
	movl $16, -124(%rbp)
	xorl %edi, %edi
.LB8912:
	movl 12(%rsi), %eax
	cmpl %eax, %edi
	jge .LB8914
.LB8913:
	movq 136(%rsi), %rax
	movslq %edi, %rcx
	movl (%rax,%rcx,4), %ebx
	testl %ebx, %ebx
	js .LB8943
.LB8930:
	movq 120(%rsi), %rax
	movl (%rax,%rcx,4), %eax
	cmpl $0, %eax
	jg .LB8941
.LB8943:
	incl %edi
	jmp .LB8912
.LB8914:
	xorl %eax, %eax
	xorl %edi, %edi
.LB9008:
	movl 16(%rsi), %ecx
	cmpl %ecx, %edi
	jge .LB9010
.LB9009:
	movq 192(%rsi), %rcx
	movslq %edi, %rdx
	movl (%rcx,%rdx,4), %ecx
	cmpl $65522, %ecx
	jne .LB9038
.LB9025:
	movq 216(%rsi), %rcx
	movl (%rcx,%rdx,4), %ecx
	cmpl %edi, %ecx
	je .LB9037
.LB9038:
.LB9039:
	incl %edi
	jmp .LB9008
.LB9010:
	xorl %edi, %edi
.LB9098:
	movl 336(%rsi), %ecx
	cmpl %ecx, %edi
	jge .LB9100
.LB9099:
	movq 408(%rsi), %rcx
	movslq %edi, %rdx
	movl (%rcx,%rdx,4), %ecx
	testl %ecx, %ecx
	jne .LB9115
.LB9116:
.LB9117:
	incl %edi
	jmp .LB9098
.LB9100:
	movq $1, %rax
	xorl %edx, %edx
	cmpl $0, %ecx
	cmovg %eax, %edx
	movq %rdx, -456(%rbp)
	leaq -104(%rbp), %rcx
	callq IDEKA__ilink__lb_init__1__LkBufE1_ptr1__ret_voidE1
	leaq -104(%rbp), %rcx
	xorl %edx, %edx
	callq IDEKA__ilink__lb_put8__2__LkBufE1_ptr1__intE1__ret_voidE1
	movl 248(%rsi), %eax
	addl $2, %eax
	shll $2, %eax
	movslq %eax, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -976(%rbp)
	movl 248(%rsi), %eax
	addl $2, %eax
	shll $2, %eax
	movslq %eax, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -1088(%rbp)
	movq $0, -424(%rbp)
	movq $0, -432(%rbp)
.LB9191:
	movl 248(%rsi), %eax
	movq -424(%rbp), %rcx
	cmpl %eax, %ecx
	jge .LB9193
.LB9192:
	movq -424(%rbp), %rax
	movslq %eax, %rax
	movq -976(%rbp), %rcx
	leaq (%rcx,%rax,4), %rdi
	movl $4294967295, (%rdi)
	movq 328(%rsi), %rcx
	movl (%rcx,%rax,4), %eax
	testl %eax, %eax
	jne .LB9212
.LB9213:
	movq -432(%rbp), %rax
.LB9214:
	movq -424(%rbp), %rcx
	incl %ecx
	movq %rcx, -424(%rbp)
	movq %rax, -432(%rbp)
	jmp .LB9191
.LB9193:
	movq $0, -440(%rbp)
.LB9230:
	movl 336(%rsi), %eax
	movq -440(%rbp), %rcx
	cmpl %eax, %ecx
	jge .LB9232
.LB9231:
	movq 344(%rsi), %rax
	movq -440(%rbp), %rcx
	movslq %ecx, %rdi
	movq (%rax,%rdi,8), %rdx
	leaq -104(%rbp), %rcx
	callq IDEKA__ilink__lb_put_str__2__LkBufE1_ptr1__byteE1_ptr1__ret_intE1
	movq 440(%rsi), %rcx
	movl %eax, (%rcx,%rdi,4)
	movq -440(%rbp), %rax
	incl %eax
	movq %rax, -440(%rbp)
	jmp .LB9230
.LB9232:
	incl %eax
	movq %rax, -1072(%rbp)
	movq $1, %rcx
	cmpl $1, %eax
	cmovl %ecx, %eax
	movq %rax, -720(%rbp)
	movl 488(%rsi), %eax
	movl 528(%rsi), %ecx
	addl %ecx, %eax
	movq %rax, -464(%rbp)
	movl 448(%rsi), %eax
	addl $2, %eax
	shll $2, %eax
	movslq %eax, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -1080(%rbp)
	movq $0, -480(%rbp)
.LB9290:
	movl 448(%rsi), %eax
	movq -480(%rbp), %rcx
	cmpl %eax, %ecx
	jge .LB9292
.LB9291:
	movq 464(%rsi), %rax
	movq -480(%rbp), %rcx
	movslq %ecx, %rdi
	movq (%rax,%rdi,8), %rdx
	leaq -104(%rbp), %rcx
	callq IDEKA__ilink__lb_put_str__2__LkBufE1_ptr1__byteE1_ptr1__ret_intE1
	movq -1080(%rbp), %rcx
	movl %eax, (%rcx,%rdi,4)
	movq -480(%rbp), %rax
	incl %eax
	movq %rax, -480(%rbp)
	jmp .LB9290
.LB9292:
	movq -456(%rbp), %rax
	cmpl $1, %eax
	je .LB9314
.LB9315:
	movl $400, %eax
	movq $0, -488(%rbp)
	movq $0, -496(%rbp)
	movq $0, -504(%rbp)
	movq $0, -512(%rbp)
	movq $0, -520(%rbp)
	movq $0, -528(%rbp)
	movq $0, -536(%rbp)
	movq $0, -544(%rbp)
.LB9316:
	movl -136(%rbp), %ecx
	movslq %ecx, %rdx
	movq %rax, %rcx
	callq IDEKA__ilink__lk_align_up__2__dataE1_sbits64__dataE1_sbits64__ret_dataE1_sbits64
	movq %rax, -600(%rbp)
	movl -120(%rbp), %ecx
	movslq %ecx, %rcx
	addq %rax, %rcx
	movl -132(%rbp), %eax
	movslq %eax, %rdx
	callq IDEKA__ilink__lk_align_up__2__dataE1_sbits64__dataE1_sbits64__ret_dataE1_sbits64
	movq %rax, -608(%rbp)
	movl -116(%rbp), %ecx
	movslq %ecx, %rcx
	addq %rax, %rcx
	movq $4096, %rdx
	callq IDEKA__ilink__lk_align_up__2__dataE1_sbits64__dataE1_sbits64__ret_dataE1_sbits64
	movq %rax, -616(%rbp)
	movq -456(%rbp), %rcx
	cmpl $1, %ecx
	je .LB9483
.LB9484:
	movq $0, -624(%rbp)
.LB9485:
	movq %rax, %rcx
	movq $8, %rdx
	callq IDEKA__ilink__lk_align_up__2__dataE1_sbits64__dataE1_sbits64__ret_dataE1_sbits64
	movq %rax, -656(%rbp)
	movl 488(%rsi), %ecx
	shll $3, %ecx
	movslq %ecx, %rcx
	addq %rax, %rcx
	movl -128(%rbp), %eax
	movslq %eax, %rdx
	callq IDEKA__ilink__lk_align_up__2__dataE1_sbits64__dataE1_sbits64__ret_dataE1_sbits64
	movq %rax, -640(%rbp)
	movl -112(%rbp), %ecx
	movslq %ecx, %rcx
	addq %rax, %rcx
	movl -124(%rbp), %eax
	movslq %eax, %rdx
	callq IDEKA__ilink__lk_align_up__2__dataE1_sbits64__dataE1_sbits64__ret_dataE1_sbits64
	movq %rax, -648(%rbp)
	addq $4194304, %rax
	movq %rax, -984(%rbp)
	movq -640(%rbp), %rax
	movslq %eax, %rax
	addq $4194304, %rax
	movq -608(%rbp), %rcx
	movslq %ecx, %rcx
	addq $4194304, %rcx
	movq -600(%rbp), %rdx
	movslq %edx, %rdx
	addq $4194304, %rdx
	xorl %edi, %edi
.LB9526:
	movl 12(%rsi), %r8d
	cmpl %r8d, %edi
	jge .LB9528
.LB9527:
	movq 136(%rsi), %r8
	movslq %edi, %r9
	movl (%r8,%r9,4), %r8d
	testl %r8d, %r8d
	jns .LB9544
.LB9546:
	incl %edi
	jmp .LB9526
.LB9314:
	movq -632(%rbp), %rcx
	callq IDEKA__ilink__lk_strlen__1__byteE1_ptr1__ret_intE1
	movslq %eax, %rax
	addq $400, %rax
	leaq 1(%rax), %rcx
	movq $8, %rdx
	callq IDEKA__ilink__lk_align_up__2__dataE1_sbits64__dataE1_sbits64__ret_dataE1_sbits64
	movq %rax, -552(%rbp)
	movq -720(%rbp), %rcx
	addl $2, %ecx
	movq -1072(%rbp), %rdx
	addl %edx, %ecx
	shll $2, %ecx
	movslq %ecx, %rcx
	addq %rax, %rcx
	movq $8, %rdx
	callq IDEKA__ilink__lk_align_up__2__dataE1_sbits64__dataE1_sbits64__ret_dataE1_sbits64
	movq %rax, -560(%rbp)
	movq -1072(%rbp), %rcx
	imull $24, %ecx, %ecx
	movslq %ecx, %rcx
	addq %rcx, %rax
	movq %rax, -568(%rbp)
	movl -96(%rbp), %ecx
	movslq %ecx, %rcx
	addq %rax, %rcx
	movq $8, %rdx
	callq IDEKA__ilink__lk_align_up__2__dataE1_sbits64__dataE1_sbits64__ret_dataE1_sbits64
	movq %rax, -576(%rbp)
	movq -1072(%rbp), %rcx
	shll $1, %ecx
	movslq %ecx, %rcx
	addq %rax, %rcx
	movq $8, %rdx
	callq IDEKA__ilink__lk_align_up__2__dataE1_sbits64__dataE1_sbits64__ret_dataE1_sbits64
	movq %rax, -584(%rbp)
	xorl %ecx, %ecx
	xorl %edx, %edx
.LB9373:
	movl 248(%rsi), %edi
	cmpl %edi, %ecx
	jge .LB9375
.LB9374:
	xorl %edi, %edi
	xorl %r8d, %r8d
.LB9382:
	movl 448(%rsi), %r9d
	cmpl %r9d, %edi
	jge .LB9384
.LB9383:
	movq 456(%rsi), %r9
	movslq %edi, %rbx
	movl (%r9,%rbx,4), %r9d
	leal 1(%r8), %ebx
	cmpl %ecx, %r9d
	cmove %ebx, %r8d
	incl %edi
	jmp .LB9382
.LB9375:
	movslq %edx, %rcx
	addq %rax, %rcx
	movq $8, %rdx
	callq IDEKA__ilink__lk_align_up__2__dataE1_sbits64__dataE1_sbits64__ret_dataE1_sbits64
	movq %rax, -592(%rbp)
	movq -464(%rbp), %rcx
	imull $24, %ecx, %ecx
	movslq %ecx, %rcx
	addq %rax, %rcx
	movq $16, %rdx
	callq IDEKA__ilink__lk_align_up__2__dataE1_sbits64__dataE1_sbits64__ret_dataE1_sbits64
	movl 512(%rsi), %ecx
	shll $4, %ecx
	movslq %ecx, %rcx
	addq %rax, %rcx
	movq $400, -488(%rbp)
	movq -552(%rbp), %r10
	movq %r10, -496(%rbp)
	movq -560(%rbp), %r10
	movq %r10, -504(%rbp)
	movq -568(%rbp), %r10
	movq %r10, -512(%rbp)
	movq -576(%rbp), %r10
	movq %r10, -520(%rbp)
	movq -584(%rbp), %r10
	movq %r10, -528(%rbp)
	movq -592(%rbp), %r10
	movq %r10, -536(%rbp)
	movq %rax, -544(%rbp)
	movq %rcx, %rax
	jmp .LB9316
.LB9483:
	movq -432(%rbp), %rcx
	addl $16, %ecx
	movl %ecx, %edx
	shll $4, %edx
	movslq %edx, %rdx
	addq %rdx, %rax
	movq %rcx, -624(%rbp)
	jmp .LB9485
.LB9528:
	xorl %eax, %eax
.LB9694:
	movl 16(%rsi), %ecx
	cmpl %ecx, %eax
	jge .LB9696
.LB9695:
	movq 192(%rsi), %rcx
	movslq %eax, %rdx
	movl (%rcx,%rdx,4), %ecx
	cmpl $65522, %ecx
	jne .LB9725
.LB9711:
	movq 216(%rsi), %rcx
	movl (%rcx,%rdx,4), %ecx
	cmpl %eax, %ecx
	je .LB9723
.LB9725:
	incl %eax
	jmp .LB9694
.LB9696:
	movq -544(%rbp), %rax
	movslq %eax, %rax
	addq $4194304, %rax
	movq -656(%rbp), %rcx
	movslq %ecx, %rcx
	addq $4194304, %rcx
	movq $0, -664(%rbp)
.LB9745:
	movl 336(%rsi), %edx
	movq -664(%rbp), %rdi
	cmpl %edx, %edi
	jge .LB9747
.LB9746:
	movq 408(%rsi), %rdx
	movq -664(%rbp), %rdi
	movslq %edi, %rdi
	movl (%rdx,%rdi,4), %edx
	testl %edx, %edx
	jne .LB9762
.LB9764:
	movq 400(%rsi), %rdx
	movq -664(%rbp), %rdi
	movslq %edi, %rdi
	movl (%rdx,%rdi,4), %edx
	testl %edx, %edx
	jns .LB9790
.LB9792:
	movq 392(%rsi), %rdx
	movq -664(%rbp), %rdi
	movslq %edi, %rdi
	movl (%rdx,%rdi,4), %edx
	testl %edx, %edx
	jns .LB9823
.LB9825:
	movq -664(%rbp), %rdx
	incl %edx
	movq %rdx, -664(%rbp)
	jmp .LB9745
.LB9747:
	movq $0, -672(%rbp)
	movl $4294967295, %r10d
	movq %r10, -680(%rbp)
.LB9851:
	movl 16(%rsi), %eax
	movq -672(%rbp), %rcx
	cmpl %eax, %ecx
	jge .LB9853
.LB9860:
	movq -680(%rbp), %rax
	testl %eax, %eax
	jns .LB9853
.LB9852:
	movq 216(%rsi), %rax
	movq -672(%rbp), %rcx
	movslq %ecx, %rdx
	movl (%rax,%rdx,4), %eax
	cmpl %ecx, %eax
	jne .LB9898
.LB9874:
	movq 192(%rsi), %rax
	movl (%rax,%rdx,4), %eax
	testl %eax, %eax
	je .LB9898
.LB9885:
	movq 176(%rsi), %rax
	movq (%rax,%rdx,8), %rcx
	movq -472(%rbp), %rdx
	callq IDEKA__ilink__lk_streq__2__byteE1_ptr1__byteE1_ptr1__ret_boolE1
	testb %al, %al
	jne .LB9897
.LB9898:
	movq -680(%rbp), %rax
.LB9899:
	movq -672(%rbp), %rcx
	incl %ecx
	movq %rcx, -672(%rbp)
	movq %rax, -680(%rbp)
	jmp .LB9851
.LB9853:
	movq -680(%rbp), %rax
	testl %eax, %eax
	js .LB9905
.LB9906:
	movq %rsi, %rcx
	movq -680(%rbp), %rdx
	callq IDEKA__ilink__le_symaddr__2__ElfLinkE1_ptr1__intE1__ret_dataE1_sbits64
	movq %rax, -688(%rbp)
	leaq -80(%rbp), %rcx
	callq IDEKA__ilink__lb_init__1__LkBufE1_ptr1__ret_voidE1
	movq -648(%rbp), %rax
	movl %eax, %edx
	movq %rdx, -696(%rbp)
	leaq -80(%rbp), %rcx
	callq IDEKA__ilink__lb_pad_to__2__LkBufE1_ptr1__intE1__ret_voidE1
	movzbl -64(%rbp), %eax
	shrq $7, %rax
	testb %al, %al
	je .LB9958
.LB9959:
	movq -80(%rbp), %rcx
	movq -696(%rbp), %rdx
	callq IDEKA__ilink__lk_zero__2__byteE1_ptr1__intE1__ret_voidE1
	movq -664(%rbp), %rax
	movq $0, -704(%rbp)
	xorl %ecx, %ecx
.LB9986:
	movl 12(%rsi), %edx
	movq -704(%rbp), %rdi
	cmpl %edx, %edi
	jge .LB9988
.LB9987:
	movq 136(%rsi), %rdx
	movq -704(%rbp), %rdi
	movslq %edi, %rdi
	movl (%rdx,%rdi,4), %edx
	testl %edx, %edx
	js .LB10037
.LB10003:
	cmpl $3, %edx
	je .LB10037
.LB10014:
	movq 120(%rsi), %rdx
	movl (%rdx,%rdi,4), %edx
	cmpl $0, %edx
	jle .LB10037
.LB10025:
	movq 96(%rsi), %rdx
	movl (%rdx,%rdi,4), %edx
	cmpl $8, %edx
	jne .LB10036
.LB10037:
.LB10038:
	movq -704(%rbp), %rdx
	incl %edx
	movq %rdx, -704(%rbp)
	jmp .LB9986
.LB9988:
	movq $0, -712(%rbp)
.LB10095:
	movl 488(%rsi), %eax
	movq -712(%rbp), %rcx
	cmpl %eax, %ecx
	jge .LB10097
.LB10096:
	movq 496(%rsi), %rax
	movq -712(%rbp), %rcx
	movslq %ecx, %rcx
	movl (%rax,%rcx,4), %eax
	cmpl $1, %eax
	je .LB10112
.LB10114:
	movq -712(%rbp), %rax
	incl %eax
	movq %rax, -712(%rbp)
	jmp .LB10095
.LB10097:
	movq -656(%rbp), %rax
	movslq %eax, %rax
	addq $4194304, %rax
	movq %rax, -1224(%rbp)
	xorl %eax, %eax
	movq $0, -728(%rbp)
	movq -672(%rbp), %rcx
	movq -704(%rbp), %rdx
	xorl %edi, %edi
	xorl %r8d, %r8d
	movq $0, -736(%rbp)
	movq $0, -744(%rbp)
	movq $0, -752(%rbp)
	movq $0, -760(%rbp)
	movq $0, -768(%rbp)
	movq $0, -776(%rbp)
	movq $0, -784(%rbp)
	movq $0, -792(%rbp)
	movq $0, -800(%rbp)
	movq $0, -808(%rbp)
.LB10135:
	movl 8(%rsi), %r9d
	movq %r9, -816(%rbp)
	movq -728(%rbp), %rbx
	cmpl %r9d, %ebx
	jge .LB10137
.LB10136:
	movq 24(%rsi), %r9
	movq -728(%rbp), %rbx
	movslq %ebx, %rbx
	movq (%r9,%rbx,8), %r9
	movq %r9, -1296(%rbp)
	movq $0, -1216(%rbp)
	movq -736(%rbp), %r10
	movq %r10, -992(%rbp)
	movq -744(%rbp), %r10
	movq %r10, -1000(%rbp)
	movq -752(%rbp), %r10
	movq %r10, -1008(%rbp)
	movq -760(%rbp), %r10
	movq %r10, -1016(%rbp)
	movq -768(%rbp), %r10
	movq %r10, -1024(%rbp)
	movq -776(%rbp), %r10
	movq %r10, -1032(%rbp)
	movq -784(%rbp), %r10
	movq %r10, -1040(%rbp)
	movq -792(%rbp), %r10
	movq %r10, -1048(%rbp)
	movq -800(%rbp), %r10
	movq %r10, -1056(%rbp)
	movq -808(%rbp), %r10
	movq %r10, -1064(%rbp)
.LB10151:
	movq 48(%rsi), %r9
	movq -728(%rbp), %rbx
	movslq %ebx, %rbx
	movl (%r9,%rbx,4), %r9d
	movq -1216(%rbp), %rbx
	cmpl %r9d, %ebx
	jge .LB10153
.LB10152:
	movq 40(%rsi), %rdx
	movq -728(%rbp), %r9
	movslq %r9d, %r9
	movl (%rdx,%r9,4), %edx
	movq -1216(%rbp), %r9
	addl %edx, %r9d
	movq %r9, -1248(%rbp)
	movq 96(%rsi), %rbx
	movslq %r9d, %r9
	movl (%rbx,%r9,4), %ebx
	cmpl $4, %ebx
	jne .LB10206
.LB10180:
	movq 136(%rsi), %rbx
	movq 152(%rsi), %r12
	movq %r12, -1096(%rbp)
	movl (%r12,%r9,4), %r9d
	addl %r9d, %edx
	movq %rdx, -1240(%rbp)
	movslq %edx, %rdx
	movl (%rbx,%rdx,4), %edx
	testl %edx, %edx
	jns .LB10205
.LB10206:
	movq -992(%rbp), %rdx
	movq -1000(%rbp), %r9
	movq -1008(%rbp), %rbx
	movq -1016(%rbp), %r10
	movq %r10, -1104(%rbp)
	movq -1024(%rbp), %r10
	movq %r10, -1112(%rbp)
	movq -1032(%rbp), %r10
	movq %r10, -1120(%rbp)
	movq -1040(%rbp), %r10
	movq %r10, -1128(%rbp)
	movq -1048(%rbp), %r10
	movq %r10, -1136(%rbp)
	movq -1056(%rbp), %r10
	movq %r10, -1144(%rbp)
	movq -1064(%rbp), %r10
	movq %r10, -1152(%rbp)
.LB10207:
	movq -1216(%rbp), %r12
	incl %r12d
	movq %r12, -1216(%rbp)
	movq %rdx, -992(%rbp)
	movq %r9, -1000(%rbp)
	movq %rbx, -1008(%rbp)
	movq -1104(%rbp), %r10
	movq %r10, -1016(%rbp)
	movq -1112(%rbp), %r10
	movq %r10, -1024(%rbp)
	movq -1120(%rbp), %r10
	movq %r10, -1032(%rbp)
	movq -1128(%rbp), %r10
	movq %r10, -1040(%rbp)
	movq -1136(%rbp), %r10
	movq %r10, -1048(%rbp)
	movq -1144(%rbp), %r10
	movq %r10, -1056(%rbp)
	movq -1152(%rbp), %r10
	movq %r10, -1064(%rbp)
	movq -1248(%rbp), %rdx
	jmp .LB10151
.LB10137:
	xorl %edi, %edi
	movq %rax, -824(%rbp)
.LB10848:
	movl 512(%rsi), %eax
	cmpl %eax, %edi
	jge .LB10850
.LB10849:
	movq 520(%rsi), %rax
	movslq %edi, %rcx
	movl (%rax,%rcx,4), %eax
	movl %edi, %ecx
	shll $4, %ecx
	movq -544(%rbp), %rdx
	leal (%rdx,%rcx), %ebx
	movq -80(%rbp), %rcx
	movslq %ebx, %rdx
	movb $255, (%rcx,%rdx,1)
	movq -80(%rbp), %rcx
	leal 1(%rbx), %edx
	movslq %edx, %rdx
	movb $37, (%rcx,%rdx,1)
	movq -80(%rbp), %rcx
	leal 2(%rbx), %edx
	movq 424(%rsi), %r8
	movslq %eax, %rax
	movq (%r8,%rax,8), %rax
	movslq %ebx, %r8
	addq $4194304, %r8
	addq $6, %r8
	negq %r8
	addq %rax, %r8
	callq IDEKA__ilink__lk_w32__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rax
	leal 6(%rbx), %ecx
	movslq %ecx, %rcx
	movb $204, (%rax,%rcx,1)
	movq -80(%rbp), %rax
	leal 7(%rbx), %ecx
	movslq %ecx, %rcx
	movb $204, (%rax,%rcx,1)
	movq -80(%rbp), %rax
	leal 8(%rbx), %ecx
	movslq %ecx, %rcx
	movb $204, (%rax,%rcx,1)
	movq -80(%rbp), %rax
	leal 9(%rbx), %ecx
	movslq %ecx, %rcx
	movb $204, (%rax,%rcx,1)
	movq -80(%rbp), %rax
	leal 10(%rbx), %ecx
	movslq %ecx, %rcx
	movb $204, (%rax,%rcx,1)
	movq -80(%rbp), %rax
	leal 11(%rbx), %ecx
	movslq %ecx, %rcx
	movb $204, (%rax,%rcx,1)
	movq -80(%rbp), %rax
	leal 12(%rbx), %ecx
	movslq %ecx, %rcx
	movb $204, (%rax,%rcx,1)
	movq -80(%rbp), %rax
	leal 13(%rbx), %ecx
	movslq %ecx, %rcx
	movb $204, (%rax,%rcx,1)
	movq -80(%rbp), %rax
	leal 14(%rbx), %ecx
	movslq %ecx, %rcx
	movb $204, (%rax,%rcx,1)
	movq -80(%rbp), %rax
	addl $15, %ebx
	movslq %ebx, %rcx
	movb $204, (%rax,%rcx,1)
	incl %edi
	movq $16, -824(%rbp)
	jmp .LB10848
.LB10850:
	movq -456(%rbp), %rax
	cmpl $1, %eax
	je .LB10926
.LB10928:
	movq -80(%rbp), %rax
	movb $127, (%rax)
	movq -80(%rbp), %rax
	movb $69, 1(%rax)
	movq -80(%rbp), %rax
	movb $76, 2(%rax)
	movq -80(%rbp), %rax
	movb $70, 3(%rax)
	movq -80(%rbp), %rax
	movb $2, 4(%rax)
	movq -80(%rbp), %rax
	movb $1, 5(%rax)
	movq -80(%rbp), %rax
	movb $1, 6(%rax)
	movq -80(%rbp), %rcx
	movq $16, %rdx
	movq $2, %r8
	callq IDEKA__ilink__lk_w16__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	movq $18, %rdx
	movq $62, %r8
	callq IDEKA__ilink__lk_w16__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	movq $20, %rdx
	movq $1, %r8
	callq IDEKA__ilink__lk_w32__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	movq $24, %rdx
	movq -688(%rbp), %r8
	callq IDEKA__ilink__lk_w64__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	movq $32, %rdx
	movq $64, %r8
	callq IDEKA__ilink__lk_w64__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	movq $40, %rdx
	xorl %r8d, %r8d
	callq IDEKA__ilink__lk_w64__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	movq $48, %rdx
	xorl %r8d, %r8d
	callq IDEKA__ilink__lk_w32__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	movq $52, %rdx
	movq $64, %r8
	callq IDEKA__ilink__lk_w16__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	movq $54, %rdx
	movq $56, %r8
	callq IDEKA__ilink__lk_w16__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -456(%rbp), %rax
	cmpl $1, %eax
	je .LB11942
.LB11943:
	movq -80(%rbp), %rcx
	movq $56, %rdx
	movq $3, %r8
	callq IDEKA__ilink__lk_w16__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
.LB11944:
	movq -80(%rbp), %rcx
	movq $58, %rdx
	movq $64, %r8
	callq IDEKA__ilink__lk_w16__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	movq $60, %rdx
	xorl %r8d, %r8d
	callq IDEKA__ilink__lk_w16__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	movq $62, %rdx
	xorl %r8d, %r8d
	callq IDEKA__ilink__lk_w16__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -456(%rbp), %rax
	cmpl $1, %eax
	je .LB11972
.LB11973:
	movl $64, %edi
.LB11974:
	movq -80(%rbp), %rcx
	movq %rdi, %rdx
	movq $1, %r8
	callq IDEKA__ilink__lk_w32__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	leal 4(%rdi), %edx
	movq $5, %r8
	callq IDEKA__ilink__lk_w32__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	leal 8(%rdi), %edx
	xorl %r8d, %r8d
	callq IDEKA__ilink__lk_w64__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	leal 16(%rdi), %edx
	movq $4194304, %r8
	callq IDEKA__ilink__lk_w64__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	leal 24(%rdi), %edx
	movq $4194304, %r8
	callq IDEKA__ilink__lk_w64__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	leal 32(%rdi), %edx
	movl -116(%rbp), %eax
	movq -608(%rbp), %r8
	addl %eax, %r8d
	movslq %r8d, %r8
	callq IDEKA__ilink__lk_w64__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	leal 40(%rdi), %edx
	movl -116(%rbp), %eax
	movq -608(%rbp), %r8
	addl %eax, %r8d
	movslq %r8d, %r8
	callq IDEKA__ilink__lk_w64__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	leal 48(%rdi), %edx
	movq $4096, %r8
	callq IDEKA__ilink__lk_w64__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	addl $56, %edi
	movq -80(%rbp), %rcx
	movq %rdi, %rdx
	movq $1, %r8
	callq IDEKA__ilink__lk_w32__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	leal 4(%rdi), %edx
	movq $6, %r8
	callq IDEKA__ilink__lk_w32__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	leal 8(%rdi), %edx
	movq -616(%rbp), %rax
	movslq %eax, %rbx
	movq %rbx, %r8
	callq IDEKA__ilink__lk_w64__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	leal 16(%rdi), %edx
	leaq 4194304(%rbx), %r12
	movq %r12, %r8
	callq IDEKA__ilink__lk_w64__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	leal 24(%rdi), %edx
	movq %r12, %r8
	callq IDEKA__ilink__lk_w64__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	leal 32(%rdi), %edx
	movl -112(%rbp), %eax
	movq -640(%rbp), %r8
	addl %eax, %r8d
	movq -616(%rbp), %rax
	subl %eax, %r8d
	movslq %r8d, %r8
	callq IDEKA__ilink__lk_w64__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	leal 40(%rdi), %edx
	movq -984(%rbp), %rax
	subq $4194304, %rax
	movl -108(%rbp), %r8d
	movslq %r8d, %r8
	addq %r8, %rax
	movq %rax, %r8
	subq %rbx, %r8
	callq IDEKA__ilink__lk_w64__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	leal 48(%rdi), %edx
	movq $4096, %r8
	callq IDEKA__ilink__lk_w64__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	addl $56, %edi
	movq -456(%rbp), %rax
	cmpl $1, %eax
	je .LB12254
.LB12255:
.LB12256:
	movq -80(%rbp), %rcx
	movq %rdi, %rdx
	movq $1685382481, %r8
	callq IDEKA__ilink__lk_w32__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	leal 4(%rdi), %edx
	movq $6, %r8
	callq IDEKA__ilink__lk_w32__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	leal 8(%rdi), %edx
	xorl %r8d, %r8d
	callq IDEKA__ilink__lk_w64__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	leal 16(%rdi), %edx
	xorl %r8d, %r8d
	callq IDEKA__ilink__lk_w64__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	leal 24(%rdi), %edx
	xorl %r8d, %r8d
	callq IDEKA__ilink__lk_w64__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	leal 32(%rdi), %edx
	xorl %r8d, %r8d
	callq IDEKA__ilink__lk_w64__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	leal 40(%rdi), %edx
	xorl %r8d, %r8d
	callq IDEKA__ilink__lk_w64__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	leal 48(%rdi), %edx
	movq $16, %r8
	callq IDEKA__ilink__lk_w64__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movl -112(%rbp), %eax
	movq -640(%rbp), %rcx
	addl %eax, %ecx
	movl %ecx, -72(%rbp)
	movl 488(%rsi), %eax
	shll $3, %eax
	movq -656(%rbp), %rdx
	addl %eax, %edx
	cmpl %edx, %ecx
	jl .LB12397
.LB12399:
	movq -456(%rbp), %rax
	cmpl $1, %eax
	jne .LB12424
.LB12410:
	movl -72(%rbp), %eax
	movq -624(%rbp), %rcx
	shll $4, %ecx
	movq -616(%rbp), %rdx
	addl %ecx, %edx
	cmpl %edx, %eax
	jl .LB12422
.LB12424:
	movq -80(%rbp), %rdx
	movl -72(%rbp), %r8d
	movq -448(%rbp), %rcx
	callq IDEKA__ilink__lk_write_file__3__byteE1_ptr1__byteE1_ptr1__intE1__ret_boolE1
	testb %al, %al
	je .LB12441
.LB12442:
	movq -448(%rbp), %rcx
	callq IDEKA__ilink__lk_make_exec__1__byteE1_ptr1__ret_voidE1
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
.LB10926:
	xorl %edi, %edi
.LB10929:
	movslq %edi, %rax
	movq -632(%rbp), %rcx
	movzbl (%rcx,%rax,1), %eax
	movzbl %al, %ecx
	testl %ecx, %ecx
	je .LB10931
.LB10930:
	movq -80(%rbp), %rcx
	movq -488(%rbp), %rdx
	addl %edi, %edx
	movslq %edx, %rdx
	movb %al, (%rcx,%rdx,1)
	incl %edi
	jmp .LB10929
.LB10931:
	movq $0, -832(%rbp)
.LB10953:
	movl 336(%rsi), %eax
	movq -832(%rbp), %rcx
	cmpl %eax, %ecx
	jge .LB10955
.LB10954:
	movq -832(%rbp), %rax
	leal 1(%rax), %ecx
	imull $24, %ecx, %ecx
	movq -504(%rbp), %rdx
	leal (%rdx,%rcx), %ebx
	movq -80(%rbp), %rcx
	movq 440(%rsi), %rdx
	movslq %eax, %r12
	movl (%rdx,%r12,4), %eax
	movslq %eax, %r8
	movq %rbx, %rdx
	callq IDEKA__ilink__lk_w32__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq 408(%rsi), %rax
	movl (%rax,%r12,4), %eax
	testl %eax, %eax
	jne .LB10988
.LB10989:
	movq 360(%rsi), %rax
	movl (%rax,%r12,4), %eax
	addl $16, %eax
	movq -80(%rbp), %rcx
	leal 4(%rbx), %edx
	movslq %edx, %rdx
	movb %al, (%rcx,%rdx,1)
	movq -80(%rbp), %rcx
	leal 6(%rbx), %edx
	xorl %r8d, %r8d
	callq IDEKA__ilink__lk_w16__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
.LB10990:
	movq -80(%rbp), %rcx
	movq -832(%rbp), %rax
	leal 1(%rax), %ebx
	movl %ebx, %edx
	shll $1, %edx
	movq -520(%rbp), %r8
	addl %r8d, %edx
	movq 384(%rsi), %r8
	movslq %eax, %rax
	movl (%r8,%rax,4), %eax
	movslq %eax, %r8
	callq IDEKA__ilink__lk_w16__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq %rbx, -832(%rbp)
	jmp .LB10953
.LB10955:
	xorl %eax, %eax
.LB11076:
	movl -96(%rbp), %ecx
	cmpl %ecx, %eax
	jge .LB11078
.LB11077:
	movq -104(%rbp), %rcx
	movslq %eax, %rdx
	movzbl (%rcx,%rdx,1), %ecx
	movq -80(%rbp), %rdx
	movq -512(%rbp), %r8
	addl %eax, %r8d
	movslq %r8d, %r8
	movb %cl, (%rdx,%r8,1)
	incl %eax
	jmp .LB11076
.LB11078:
	movq -720(%rbp), %rax
	addl $2, %eax
	shll $2, %eax
	movq %rax, -840(%rbp)
	movslq %eax, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -848(%rbp)
	movq -1072(%rbp), %rax
	addl $2, %eax
	shll $2, %eax
	movq %rax, -856(%rbp)
	movslq %eax, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -864(%rbp)
	movq -848(%rbp), %rcx
	movq -840(%rbp), %rdx
	callq IDEKA__ilink__lk_zero__2__byteE1_ptr1__intE1__ret_voidE1
	movq -864(%rbp), %rcx
	movq -856(%rbp), %rdx
	callq IDEKA__ilink__lk_zero__2__byteE1_ptr1__intE1__ret_voidE1
	movq -720(%rbp), %rax
	movslq %eax, %rax
	movq %rax, -872(%rbp)
	movq $1, -880(%rbp)
.LB11125:
	movq -880(%rbp), %rax
	movq -1072(%rbp), %rcx
	cmpl %ecx, %eax
	jge .LB11127
.LB11126:
	movq 344(%rsi), %rax
	movq -880(%rbp), %rcx
	decl %ecx
	movslq %ecx, %rcx
	movq (%rax,%rcx,8), %rcx
	callq IDEKA__ilink__le_elfhash__1__byteE1_ptr1__ret_dataE1_sbits64
	cqto
	movq -872(%rbp), %rcx
	idivq %rcx
	movq %rdx, %rax
	movslq %eax, %rax
	movq -848(%rbp), %rcx
	leaq (%rcx,%rax,4), %rax
	movl (%rax), %ecx
	movq -880(%rbp), %rdx
	movslq %edx, %r8
	movq -864(%rbp), %r9
	movl %ecx, (%r9,%r8,4)
	movl %edx, (%rax)
	incl %edx
	movq %rdx, -880(%rbp)
	jmp .LB11125
.LB11127:
	movq -80(%rbp), %rcx
	movq -720(%rbp), %rax
	movslq %eax, %r8
	movq -496(%rbp), %rdx
	callq IDEKA__ilink__lk_w32__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	movq -496(%rbp), %rax
	leal 4(%rax), %edx
	movq -1072(%rbp), %rax
	movslq %eax, %r8
	callq IDEKA__ilink__lk_w32__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -496(%rbp), %rax
	addl $8, %eax
	movq %rax, -888(%rbp)
	movq $0, -896(%rbp)
.LB11172:
	movq -896(%rbp), %rax
	movq -720(%rbp), %rcx
	cmpl %ecx, %eax
	jge .LB11174
.LB11173:
	movq -80(%rbp), %rcx
	movq -896(%rbp), %rax
	movl %eax, %edx
	shll $2, %edx
	movq -888(%rbp), %r8
	addl %r8d, %edx
	movslq %eax, %rax
	movq -848(%rbp), %r8
	movl (%r8,%rax,4), %eax
	movslq %eax, %r8
	callq IDEKA__ilink__lk_w32__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -896(%rbp), %rax
	incl %eax
	movq %rax, -896(%rbp)
	jmp .LB11172
.LB11174:
	movq -496(%rbp), %rax
	addl $8, %eax
	movq -720(%rbp), %rcx
	shll $2, %ecx
	addl %ecx, %eax
	movq %rax, -904(%rbp)
	movq $0, -912(%rbp)
.LB11194:
	movq -912(%rbp), %rax
	movq -1072(%rbp), %rcx
	cmpl %ecx, %eax
	jge .LB11196
.LB11195:
	movq -80(%rbp), %rcx
	movq -912(%rbp), %rax
	movl %eax, %edx
	shll $2, %edx
	movq -904(%rbp), %r8
	addl %r8d, %edx
	movslq %eax, %rax
	movq -864(%rbp), %r8
	movl (%r8,%rax,4), %eax
	movslq %eax, %r8
	callq IDEKA__ilink__lk_w32__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -912(%rbp), %rax
	incl %eax
	movq %rax, -912(%rbp)
	jmp .LB11194
.LB11196:
	movq -824(%rbp), %rax
	movq %rdi, -936(%rbp)
	movq -528(%rbp), %r10
	movq %r10, -920(%rbp)
	xorl %ecx, %ecx
	movq $0, -928(%rbp)
	xorl %edi, %edi
.LB11220:
	movl 248(%rsi), %edx
	cmpl %edx, %edi
	jge .LB11222
.LB11221:
	movslq %edi, %rdx
	movq -1088(%rbp), %r8
	leaq (%r8,%rdx,4), %rbx
	movl (%rbx), %edx
	cmpl $0, %edx
	jg .LB11234
.LB11235:
	movq -920(%rbp), %rdx
	movq %rcx, %r8
	movq -928(%rbp), %r9
	movq -936(%rbp), %rcx
.LB11236:
	incl %edi
	movq %rcx, -936(%rbp)
	movq %rdx, -920(%rbp)
	movq %r8, %rcx
	movq %r9, -928(%rbp)
	jmp .LB11220
.LB11222:
	xorl %edi, %edi
	xorl %eax, %eax
	movq -528(%rbp), %rbx
.LB11387:
	movl 248(%rsi), %ecx
	cmpl %ecx, %edi
	jge .LB11389
.LB11388:
	movslq %edi, %rcx
	movq -1088(%rbp), %rdx
	movl (%rdx,%rcx,4), %ecx
	cmpl $0, %ecx
	jg .LB11401
.LB11402:
.LB11403:
	incl %edi
	jmp .LB11387
.LB11389:
	movq -656(%rbp), %rax
	movslq %eax, %rax
	leaq 4194304(%rax), %rdi
	xorl %ebx, %ebx
	movq -536(%rbp), %r12
.LB11436:
	movl 488(%rsi), %eax
	cmpl %eax, %ebx
	jge .LB11438
.LB11437:
	movq 496(%rsi), %rax
	movslq %ebx, %rcx
	movl (%rax,%rcx,4), %eax
	testl %eax, %eax
	je .LB11453
.LB11454:
.LB11455:
	incl %ebx
	jmp .LB11436
.LB11438:
	xorl %edi, %edi
.LB11499:
	movl 336(%rsi), %eax
	cmpl %eax, %edi
	jge .LB11501
.LB11500:
	movq 408(%rsi), %rax
	movslq %edi, %rcx
	movl (%rax,%rcx,4), %eax
	testl %eax, %eax
	jne .LB11516
.LB11517:
.LB11518:
	incl %edi
	jmp .LB11499
.LB11501:
	movq -536(%rbp), %rax
	subl %eax, %r12d
	movslq %r12d, %rax
	movabsq $2863311531, %rcx
	imulq %rax, %rcx
	sarq $36, %rcx
	shrq $63, %rax
	addl %ecx, %eax
	movl %eax, %edi
	xorl %ebx, %ebx
	movq -616(%rbp), %r12
.LB11560:
	movl 248(%rsi), %eax
	cmpl %eax, %ebx
	jge .LB11562
.LB11561:
	movslq %ebx, %rax
	movq -976(%rbp), %rcx
	leaq (%rcx,%rax,4), %r13
	movl (%r13), %eax
	testl %eax, %eax
	jns .LB11574
.LB11575:
.LB11576:
	incl %ebx
	jmp .LB11560
.LB11562:
	movq -80(%rbp), %rcx
	movq %r12, %rdx
	movq $4, %r8
	callq IDEKA__ilink__lk_w64__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	leal 8(%r12), %edx
	movq -496(%rbp), %rax
	movslq %eax, %rax
	leaq 4194304(%rax), %r8
	callq IDEKA__ilink__lk_w64__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	leal 16(%r12), %ebx
	movq -80(%rbp), %rcx
	movq %rbx, %rdx
	movq $5, %r8
	callq IDEKA__ilink__lk_w64__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	leal 8(%rbx), %edx
	movq -512(%rbp), %rax
	movslq %eax, %rax
	leaq 4194304(%rax), %r8
	callq IDEKA__ilink__lk_w64__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	addl $16, %ebx
	movq -80(%rbp), %rcx
	movq %rbx, %rdx
	movq $6, %r8
	callq IDEKA__ilink__lk_w64__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	leal 8(%rbx), %edx
	movq -504(%rbp), %rax
	movslq %eax, %rax
	leaq 4194304(%rax), %r8
	callq IDEKA__ilink__lk_w64__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	addl $16, %ebx
	movq -80(%rbp), %rcx
	movq %rbx, %rdx
	movq $10, %r8
	callq IDEKA__ilink__lk_w64__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	leal 8(%rbx), %edx
	movl -96(%rbp), %eax
	movslq %eax, %r8
	callq IDEKA__ilink__lk_w64__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	addl $16, %ebx
	movq -80(%rbp), %rcx
	movq %rbx, %rdx
	movq $11, %r8
	callq IDEKA__ilink__lk_w64__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	leal 8(%rbx), %edx
	movq $24, %r8
	callq IDEKA__ilink__lk_w64__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	addl $16, %ebx
	movq -80(%rbp), %rcx
	movq %rbx, %rdx
	movq $21, %r8
	callq IDEKA__ilink__lk_w64__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	leal 8(%rbx), %edx
	xorl %r8d, %r8d
	callq IDEKA__ilink__lk_w64__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	addl $16, %ebx
	movq -80(%rbp), %rcx
	movq %rbx, %rdx
	movq $7, %r8
	callq IDEKA__ilink__lk_w64__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	leal 8(%rbx), %edx
	movq -536(%rbp), %rax
	movslq %eax, %rax
	leaq 4194304(%rax), %r8
	callq IDEKA__ilink__lk_w64__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	addl $16, %ebx
	movq -80(%rbp), %rcx
	movq %rbx, %rdx
	movq $8, %r8
	callq IDEKA__ilink__lk_w64__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	leal 8(%rbx), %edx
	imull $24, %edi, %edi
	movslq %edi, %r8
	callq IDEKA__ilink__lk_w64__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	leal 16(%rbx), %edi
	movq -80(%rbp), %rcx
	movq %rdi, %rdx
	movq $9, %r8
	callq IDEKA__ilink__lk_w64__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	leal 8(%rdi), %edx
	movq $24, %r8
	callq IDEKA__ilink__lk_w64__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	addl $16, %edi
	movq -80(%rbp), %rcx
	movq %rdi, %rdx
	movq $30, %r8
	callq IDEKA__ilink__lk_w64__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	leal 8(%rdi), %edx
	movq $8, %r8
	callq IDEKA__ilink__lk_w64__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	addl $16, %edi
	movq -80(%rbp), %rcx
	movq %rdi, %rdx
	movq $1879048187, %r8
	callq IDEKA__ilink__lk_w64__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	leal 8(%rdi), %edx
	movq $1, %r8
	callq IDEKA__ilink__lk_w64__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	addl $16, %edi
	movq -80(%rbp), %rcx
	movq %rdi, %rdx
	movq $1879048176, %r8
	callq IDEKA__ilink__lk_w64__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	leal 8(%rdi), %edx
	movq -520(%rbp), %rax
	movslq %eax, %rax
	leaq 4194304(%rax), %r8
	callq IDEKA__ilink__lk_w64__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	addl $16, %edi
	movq -80(%rbp), %rcx
	movq %rdi, %rdx
	movq $1879048190, %r8
	callq IDEKA__ilink__lk_w64__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	leal 8(%rdi), %edx
	movq -528(%rbp), %rax
	movslq %eax, %rax
	leaq 4194304(%rax), %r8
	callq IDEKA__ilink__lk_w64__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	addl $16, %edi
	movq -80(%rbp), %rcx
	movq %rdi, %rdx
	movq $1879048191, %r8
	callq IDEKA__ilink__lk_w64__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	leal 8(%rdi), %edx
	movq -928(%rbp), %rax
	movslq %eax, %r8
	callq IDEKA__ilink__lk_w64__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	addl $16, %edi
	movq -80(%rbp), %rcx
	movq %rdi, %rdx
	xorl %r8d, %r8d
	callq IDEKA__ilink__lk_w64__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	leal 8(%rdi), %edx
	xorl %r8d, %r8d
	callq IDEKA__ilink__lk_w64__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	jmp .LB10928
.LB11942:
	movq -80(%rbp), %rcx
	movq $56, %rdx
	movq $6, %r8
	callq IDEKA__ilink__lk_w16__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	jmp .LB11944
.LB11972:
	movq -80(%rbp), %rcx
	movq $64, %rdx
	movq $6, %r8
	callq IDEKA__ilink__lk_w32__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	movq $68, %rdx
	movq $4, %r8
	callq IDEKA__ilink__lk_w32__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	movq $72, %rdx
	movq $64, %r8
	callq IDEKA__ilink__lk_w64__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	movq $80, %rdx
	movq $4194368, %r8
	callq IDEKA__ilink__lk_w64__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	movq $88, %rdx
	movq $4194368, %r8
	callq IDEKA__ilink__lk_w64__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	movq $96, %rdx
	movq $336, %r8
	callq IDEKA__ilink__lk_w64__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	movq $104, %rdx
	movq $336, %r8
	callq IDEKA__ilink__lk_w64__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	movq $112, %rdx
	movq $8, %r8
	callq IDEKA__ilink__lk_w64__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	movq $120, %rdx
	movq $3, %r8
	callq IDEKA__ilink__lk_w32__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	movq $124, %rdx
	movq $4, %r8
	callq IDEKA__ilink__lk_w32__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	movq -488(%rbp), %rax
	movslq %eax, %rdi
	movq $128, %rdx
	movq %rdi, %r8
	callq IDEKA__ilink__lk_w64__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	addq $4194304, %rdi
	movq $136, %rdx
	movq %rdi, %r8
	callq IDEKA__ilink__lk_w64__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	movq $144, %rdx
	movq %rdi, %r8
	callq IDEKA__ilink__lk_w64__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rdi
	movq -632(%rbp), %rcx
	callq IDEKA__ilink__lk_strlen__1__byteE1_ptr1__ret_intE1
	incl %eax
	movslq %eax, %r8
	movq %rdi, %rcx
	movq $152, %rdx
	callq IDEKA__ilink__lk_w64__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rdi
	movq -632(%rbp), %rcx
	callq IDEKA__ilink__lk_strlen__1__byteE1_ptr1__ret_intE1
	incl %eax
	movslq %eax, %r8
	movq %rdi, %rcx
	movq $160, %rdx
	callq IDEKA__ilink__lk_w64__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	movq $168, %rdx
	movq $1, %r8
	callq IDEKA__ilink__lk_w64__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movl $176, %edi
	jmp .LB11974
.LB12254:
	movq -80(%rbp), %rcx
	movq %rdi, %rdx
	movq $2, %r8
	callq IDEKA__ilink__lk_w32__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	leal 4(%rdi), %edx
	movq $6, %r8
	callq IDEKA__ilink__lk_w32__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	leal 8(%rdi), %edx
	movq %rbx, %r8
	callq IDEKA__ilink__lk_w64__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	leal 16(%rdi), %edx
	movq %r12, %r8
	callq IDEKA__ilink__lk_w64__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	leal 24(%rdi), %edx
	movq %r12, %r8
	callq IDEKA__ilink__lk_w64__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	leal 32(%rdi), %edx
	movq -624(%rbp), %rax
	shll $4, %eax
	movslq %eax, %rbx
	movq %rbx, %r8
	callq IDEKA__ilink__lk_w64__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	leal 40(%rdi), %edx
	movq %rbx, %r8
	callq IDEKA__ilink__lk_w64__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	leal 48(%rdi), %edx
	movq $8, %r8
	callq IDEKA__ilink__lk_w64__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	addl $56, %edi
	jmp .LB12256
.LB12397:
	movl %edx, -72(%rbp)
	jmp .LB12399
.LB12422:
	movl %edx, -72(%rbp)
	jmp .LB12424
.LB12441:
	movl $1852727651, -165(%rbp)
	movl $1998615663, -161(%rbp)
	movl $1702127986, -157(%rbp)
	movl $1701344288, -153(%rbp)
	movl $1953853216, -149(%rbp)
	movl $544503152, -145(%rbp)
	movl $1701603686, -141(%rbp)
	movb $0, -137(%rbp)
	leaq -165(%rbp), %rdx
	movq %rsi, %rcx
	callq IDEKA__ilink__le_fail__2__ElfLinkE1_ptr1__byteE1_ptr1__ret_boolE1
	movzbl %al, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB11574:
	movq -80(%rbp), %rcx
	movq %r12, %rdx
	movq $1, %r8
	callq IDEKA__ilink__lk_w64__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	leal 8(%r12), %edx
	movl (%r13), %eax
	movslq %eax, %r8
	callq IDEKA__ilink__lk_w64__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	addl $16, %r12d
	jmp .LB11576
.LB11516:
	movq -80(%rbp), %rcx
	movq 416(%rsi), %rax
	movslq %edi, %rdx
	movq (%rax,%rdx,8), %r8
	movq %r12, %rdx
	callq IDEKA__ilink__lk_w64__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	leal 8(%r12), %edx
	leal 1(%rdi), %eax
	movslq %eax, %rax
	shlq $32, %rax
	movq %rax, %r8
	orq $5, %r8
	callq IDEKA__ilink__lk_w64__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	leal 16(%r12), %edx
	xorl %r8d, %r8d
	callq IDEKA__ilink__lk_w64__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	addl $24, %r12d
	jmp .LB11518
.LB11453:
	movq -80(%rbp), %rcx
	movl %ebx, %eax
	shll $3, %eax
	movslq %eax, %rax
	leaq (%rdi,%rax), %r8
	movq %r12, %rdx
	callq IDEKA__ilink__lk_w64__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	leal 8(%r12), %edx
	movq 504(%rsi), %rax
	movslq %ebx, %r8
	movl (%rax,%r8,4), %eax
	incl %eax
	movslq %eax, %rax
	shlq $32, %rax
	movq %rax, %r8
	orq $6, %r8
	callq IDEKA__ilink__lk_w64__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	leal 16(%r12), %edx
	xorl %r8d, %r8d
	callq IDEKA__ilink__lk_w64__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	addl $24, %r12d
	jmp .LB11455
.LB11401:
	leal 1(%rax), %r12d
	movq -928(%rbp), %rax
	cmpl %eax, %r12d
	jl .LB11409
.LB11411:
	addl $16, %ebx
	movslq %edi, %rax
	movq -1088(%rbp), %rcx
	movl (%rcx,%rax,4), %eax
	shll $4, %eax
	addl %eax, %ebx
	movq %r12, %rax
	jmp .LB11403
.LB11409:
	movq -80(%rbp), %rax
	leal 12(%rbx), %edx
	shll $4, %ecx
	addl $16, %ecx
	movslq %ecx, %r8
	movq %rax, %rcx
	callq IDEKA__ilink__lk_w32__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	jmp .LB11411
.LB11234:
	movq -80(%rbp), %rcx
	movq -920(%rbp), %rdx
	movq $1, %r8
	callq IDEKA__ilink__lk_w16__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	movq -920(%rbp), %rax
	leal 2(%rax), %edx
	movl (%rbx), %eax
	movslq %eax, %r8
	callq IDEKA__ilink__lk_w16__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	movq -920(%rbp), %rax
	leal 4(%rax), %edx
	movslq %edi, %rax
	movq -976(%rbp), %r8
	movl (%r8,%rax,4), %eax
	movslq %eax, %r8
	callq IDEKA__ilink__lk_w32__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	movq -920(%rbp), %rax
	leal 8(%rax), %edx
	movq $16, %r8
	callq IDEKA__ilink__lk_w32__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -928(%rbp), %rax
	incl %eax
	movq %rax, -944(%rbp)
	movl (%rbx), %eax
	shll $4, %eax
	addl $16, %eax
	movq %rax, -952(%rbp)
	movq -920(%rbp), %rax
	leal 16(%rax), %ebx
	movq $0, -960(%rbp)
	movq $0, -968(%rbp)
.LB11280:
	movl 448(%rsi), %eax
	movq -968(%rbp), %rcx
	cmpl %eax, %ecx
	jge .LB11282
.LB11281:
	movq 456(%rsi), %rax
	movq -968(%rbp), %rcx
	movslq %ecx, %rcx
	movl (%rax,%rcx,4), %eax
	cmpl %edi, %eax
	je .LB11298
.LB11299:
	movq -960(%rbp), %rax
.LB11300:
	movq -968(%rbp), %rcx
	incl %ecx
	movq %rax, -960(%rbp)
	movq %rcx, -968(%rbp)
	jmp .LB11280
.LB11282:
	movq -920(%rbp), %rax
	movq -952(%rbp), %rcx
	leal (%rax,%rcx), %edx
	movq -960(%rbp), %rax
	movq -968(%rbp), %rcx
	movq -952(%rbp), %r8
	movq -944(%rbp), %r9
	jmp .LB11236
.LB11298:
	movq -80(%rbp), %rcx
	movq -960(%rbp), %rax
	shll $4, %eax
	leal (%rbx,%rax), %r12d
	movq 472(%rsi), %rax
	movq -968(%rbp), %rdx
	movslq %edx, %r13
	movq (%rax,%r13,8), %r8
	movq %r12, %rdx
	callq IDEKA__ilink__lk_w32__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	leal 4(%r12), %edx
	xorl %r8d, %r8d
	callq IDEKA__ilink__lk_w16__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	leal 6(%r12), %edx
	movq -968(%rbp), %rax
	addl $2, %eax
	movslq %eax, %r8
	callq IDEKA__ilink__lk_w16__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	leal 8(%r12), %edx
	movq -1080(%rbp), %rax
	movl (%rax,%r13,4), %eax
	movslq %eax, %r8
	callq IDEKA__ilink__lk_w32__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -960(%rbp), %rax
	leal 1(%rax), %r12d
	movslq %edi, %rax
	movq -1088(%rbp), %rcx
	movl (%rcx,%rax,4), %eax
	cmpl %eax, %r12d
	jl .LB11364
.LB11366:
	movq %r12, %rax
	jmp .LB11300
.LB11364:
	movq -80(%rbp), %rcx
	leal -1(%r12), %eax
	shll $4, %eax
	addl %ebx, %eax
	leal 12(%rax), %edx
	movq $16, %r8
	callq IDEKA__ilink__lk_w32__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	jmp .LB11366
.LB10988:
	movq -80(%rbp), %rax
	leal 4(%rbx), %ecx
	movslq %ecx, %rcx
	movb $17, (%rax,%rcx,1)
	movq -80(%rbp), %rcx
	leal 6(%rbx), %edx
	movq $65521, %r8
	callq IDEKA__ilink__lk_w16__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	leal 8(%rbx), %edx
	movq 416(%rsi), %rax
	movq -832(%rbp), %r8
	movslq %r8d, %r12
	movq (%rax,%r12,8), %r8
	callq IDEKA__ilink__lk_w64__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	leal 16(%rbx), %edx
	movq 368(%rsi), %rax
	movq (%rax,%r12,8), %r8
	callq IDEKA__ilink__lk_w64__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	jmp .LB10990
.LB10153:
	movq -728(%rbp), %r9
	incl %r9d
	movq %r9, -728(%rbp)
	movq -992(%rbp), %r10
	movq %r10, -736(%rbp)
	movq -1000(%rbp), %r10
	movq %r10, -744(%rbp)
	movq -1008(%rbp), %r10
	movq %r10, -752(%rbp)
	movq -1016(%rbp), %r10
	movq %r10, -760(%rbp)
	movq -1024(%rbp), %r10
	movq %r10, -768(%rbp)
	movq -1032(%rbp), %r10
	movq %r10, -776(%rbp)
	movq -1040(%rbp), %r10
	movq %r10, -784(%rbp)
	movq -1048(%rbp), %r10
	movq %r10, -792(%rbp)
	movq -1056(%rbp), %r10
	movq %r10, -800(%rbp)
	movq -1064(%rbp), %r10
	movq %r10, -808(%rbp)
	jmp .LB10135
.LB10205:
	movq 120(%rsi), %rax
	movq -1248(%rbp), %rdx
	movslq %edx, %rdx
	movl (%rax,%rdx,4), %eax
	movslq %eax, %rax
	movabsq $2863311531, %rdx
	imulq %rax, %rdx
	sarq $36, %rdx
	shrq $63, %rax
	addl %edx, %eax
	movq %rax, -1232(%rbp)
	movq $0, -1160(%rbp)
	movq -992(%rbp), %rdx
	movq -1000(%rbp), %r9
	movq -1008(%rbp), %rbx
	movq -1024(%rbp), %r10
	movq %r10, -1168(%rbp)
	movq -1032(%rbp), %r10
	movq %r10, -1176(%rbp)
	movq -1040(%rbp), %r10
	movq %r10, -1184(%rbp)
	movq -1048(%rbp), %r10
	movq %r10, -1192(%rbp)
	movq -1056(%rbp), %r10
	movq %r10, -1200(%rbp)
	movq -1064(%rbp), %r10
	movq %r10, -1208(%rbp)
.LB10231:
	movq -1160(%rbp), %rax
	movq -1232(%rbp), %r8
	cmpl %r8d, %eax
	jge .LB10233
.LB10232:
	movq 112(%rsi), %rax
	movq -1248(%rbp), %rcx
	movslq %ecx, %rcx
	movl (%rax,%rcx,4), %eax
	movq -1160(%rbp), %rcx
	imull $24, %ecx, %ecx
	leal (%rax,%rcx), %edi
	leal 8(%rdi), %edx
	movq -1296(%rbp), %rcx
	callq IDEKA__ilink__lk_r64__2__byteE1_ptr1__intE1__ret_dataE1_sbits64
	movq %rax, -1288(%rbp)
	movq 56(%rsi), %rcx
	movq -728(%rbp), %rdx
	movslq %edx, %rdx
	movl (%rcx,%rdx,4), %ecx
	sarq $32, %rax
	addl %eax, %ecx
	movq %rcx, -1272(%rbp)
	movabsq $4294967295, %rax
	movq -1288(%rbp), %rcx
	andq %rcx, %rax
	movq %rax, -1304(%rbp)
	leal 16(%rdi), %edx
	movq -1296(%rbp), %rcx
	callq IDEKA__ilink__lk_r64__2__byteE1_ptr1__intE1__ret_dataE1_sbits64
	movq %rax, %rbx
	movq 160(%rsi), %rax
	movq -1240(%rbp), %rcx
	movslq %ecx, %rcx
	movq %rcx, -1256(%rbp)
	movl (%rax,%rcx,4), %eax
	movq %rax, -1264(%rbp)
	movq -1296(%rbp), %rcx
	movq %rdi, %rdx
	callq IDEKA__ilink__lk_r64__2__byteE1_ptr1__intE1__ret_dataE1_sbits64
	movq -1264(%rbp), %rcx
	leal (%rcx,%rax), %r12d
	movq 144(%rsi), %rax
	movq -1256(%rbp), %rcx
	movq (%rax,%rcx,8), %rax
	movq %rax, -1280(%rbp)
	movq -1296(%rbp), %rcx
	movq %rdi, %rdx
	callq IDEKA__ilink__lk_r64__2__byteE1_ptr1__intE1__ret_dataE1_sbits64
	movq -1280(%rbp), %rcx
	leaq (%rcx,%rax), %r13
	movq 216(%rsi), %rax
	movq -1272(%rbp), %rcx
	movslq %ecx, %rcx
	movl (%rax,%rcx,4), %r14d
	movq 224(%rsi), %rax
	movl (%rax,%rcx,4), %r15d
	testl %r14d, %r14d
	jns .LB10310
.LB10311:
	testl %r15d, %r15d
	jns .LB10319
.LB10320:
	xorl %eax, %eax
.LB10312:
	movq -1304(%rbp), %rcx
	cmpl $9, %ecx
	je .LB10368
.LB10358:
	movq -1304(%rbp), %rcx
	cmpl $41, %ecx
	je .LB10368
.LB10363:
	movq -1304(%rbp), %rcx
	cmpl $42, %ecx
	je .LB10368
.LB10369:
	movq %rax, -1312(%rbp)
.LB10370:
	movq -1304(%rbp), %rax
	movq %rax, %r11
	subq $1, %r11
	cmpq $41, %r11
	ja .LB10415
	leaq .LJT22426(%rip), %r10
	jmpq *(%r10,%r11,8)
.LB10414:
	movq -80(%rbp), %rcx
	movq -1312(%rbp), %rax
	addq %rbx, %rax
	movq %rax, %r8
	subq %r13, %r8
	movq %r12, %rdx
	callq IDEKA__ilink__lk_w64__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -1200(%rbp), %rax
.LB10403:
	movq -1160(%rbp), %rcx
	incl %ecx
	movq %rcx, -1160(%rbp)
	movq -1272(%rbp), %rcx
	movq %rdi, %rdx
	movq %r14, %r9
	movq -1288(%rbp), %r10
	movq %r10, -1168(%rbp)
	movq -1312(%rbp), %r10
	movq %r10, -1176(%rbp)
	movq %rbx, -1184(%rbp)
	movq %r13, -1192(%rbp)
	movq %rax, -1200(%rbp)
	movq %r15, -1208(%rbp)
	movq -1304(%rbp), %rdi
	movq %r12, %rbx
	jmp .LB10231
.LB10233:
	movq -1160(%rbp), %rax
	movq -1232(%rbp), %r8
	movq -1240(%rbp), %r10
	movq %r10, -1104(%rbp)
	movq -1168(%rbp), %r10
	movq %r10, -1112(%rbp)
	movq -1176(%rbp), %r10
	movq %r10, -1120(%rbp)
	movq -1184(%rbp), %r10
	movq %r10, -1128(%rbp)
	movq -1192(%rbp), %r10
	movq %r10, -1136(%rbp)
	movq -1200(%rbp), %r10
	movq %r10, -1144(%rbp)
	movq -1208(%rbp), %r10
	movq %r10, -1152(%rbp)
	jmp .LB10207
.LB10319:
	movq 408(%rsi), %rax
	movslq %r15d, %rcx
	movl (%rax,%rcx,4), %eax
	testl %eax, %eax
	jne .LB10329
.LB10330:
	movq 400(%rsi), %rax
	movl (%rax,%rcx,4), %eax
	testl %eax, %eax
	jns .LB10347
.LB10348:
	xorl %eax, %eax
.LB10331:
	jmp .LB10312
.LB10347:
	movq 432(%rsi), %rax
	movslq %r15d, %rcx
	movq (%rax,%rcx,8), %rax
	jmp .LB10331
.LB10329:
	movq 416(%rsi), %rax
	movslq %r15d, %rcx
	movq (%rax,%rcx,8), %rax
	jmp .LB10331
.LB10310:
	movq %rsi, %rcx
	movq %r14, %rdx
	callq IDEKA__ilink__le_symaddr__2__ElfLinkE1_ptr1__intE1__ret_dataE1_sbits64
	jmp .LB10312
.LB10368:
	testl %r14d, %r14d
	jns .LB10373
.LB10374:
	testl %r15d, %r15d
	jns .LB10392
.LB10393:
	xorl %eax, %eax
.LB10375:
	movq %rax, -1312(%rbp)
	jmp .LB10370
.LB10392:
	movq 424(%rsi), %rax
	movslq %r15d, %rcx
	movq (%rax,%rcx,8), %rax
	jmp .LB10375
.LB10373:
	movq 232(%rsi), %rax
	movslq %r14d, %rcx
	movl (%rax,%rcx,4), %eax
	shll $3, %eax
	movslq %eax, %rax
	movq -1224(%rbp), %rcx
	addq %rcx, %rax
	jmp .LB10375
.LB10413:
	movq -80(%rbp), %rcx
	movq -1312(%rbp), %rax
	leaq (%rax,%rbx), %r8
	movq %r12, %rdx
	callq IDEKA__ilink__lk_w8__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -1200(%rbp), %rax
	jmp .LB10403
.LB10412:
	movq -80(%rbp), %rcx
	movq -1312(%rbp), %rax
	leaq (%rax,%rbx), %r8
	movq %r12, %rdx
	callq IDEKA__ilink__lk_w16__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -1200(%rbp), %rax
	jmp .LB10403
.LB10411:
	movq -1312(%rbp), %rax
	addq %rbx, %rax
	movq %rax, -1320(%rbp)
	cmpq $-2147483648, %rax
	jl .LB10745
.LB10739:
	movq -1320(%rbp), %rax
	cmpq $2147483647, %rax
	jg .LB10745
.LB10746:
	movq -80(%rbp), %rcx
	movq %r12, %rdx
	movq -1320(%rbp), %r8
	callq IDEKA__ilink__lk_w32__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -1320(%rbp), %rax
	jmp .LB10403
.LB10745:
	movl $1869374834, -189(%rbp)
	movl $1769234787, -185(%rbp)
	movl $1864396399, -181(%rbp)
	movl $1864397941, -177(%rbp)
	movl $1634869350, -173(%rbp)
	movl $6645614, -169(%rbp)
	leaq -189(%rbp), %rdx
	movq %rsi, %rcx
	callq IDEKA__ilink__le_fail__2__ElfLinkE1_ptr1__byteE1_ptr1__ret_boolE1
	movzbl %al, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB10410:
	movq -1312(%rbp), %rax
	addq %rbx, %rax
	movq %rax, -1328(%rbp)
	testq %rax, %rax
	js .LB10695
.LB10690:
	movabsq $4294967295, %rax
	movq -1328(%rbp), %rcx
	cmpq %rax, %rcx
	jg .LB10695
.LB10696:
	movq -80(%rbp), %rcx
	movq %r12, %rdx
	movq -1328(%rbp), %r8
	callq IDEKA__ilink__lk_w32__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -1328(%rbp), %rax
	jmp .LB10403
.LB10695:
	movl $1869374834, -213(%rbp)
	movl $1769234787, -209(%rbp)
	movl $1864396399, -205(%rbp)
	movl $1864397941, -201(%rbp)
	movl $1634869350, -197(%rbp)
	movl $6645614, -193(%rbp)
	leaq -213(%rbp), %rdx
	movq %rsi, %rcx
	callq IDEKA__ilink__le_fail__2__ElfLinkE1_ptr1__byteE1_ptr1__ret_boolE1
	movzbl %al, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB10409:
	movq -1312(%rbp), %rax
	addq %rbx, %rax
	subq %r13, %rax
	movq %rax, -1336(%rbp)
	cmpq $-2147483648, %rax
	jl .LB10646
.LB10640:
	movq -1336(%rbp), %rax
	cmpq $2147483647, %rax
	jg .LB10646
.LB10647:
	movq -80(%rbp), %rcx
	movq %r12, %rdx
	movq -1336(%rbp), %r8
	callq IDEKA__ilink__lk_w32__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -1336(%rbp), %rax
	jmp .LB10403
.LB10646:
	movl $1869374834, -237(%rbp)
	movl $1769234787, -233(%rbp)
	movl $1864396399, -229(%rbp)
	movl $1864397941, -225(%rbp)
	movl $1634869350, -221(%rbp)
	movl $6645614, -217(%rbp)
	leaq -237(%rbp), %rdx
	movq %rsi, %rcx
	callq IDEKA__ilink__le_fail__2__ElfLinkE1_ptr1__byteE1_ptr1__ret_boolE1
	movzbl %al, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB10408:
	movq -1312(%rbp), %rax
	addq %rbx, %rax
	subq %r13, %rax
	movq %rax, -1344(%rbp)
	cmpq $-2147483648, %rax
	jl .LB10594
.LB10588:
	movq -1344(%rbp), %rax
	cmpq $2147483647, %rax
	jg .LB10594
.LB10595:
	movq -80(%rbp), %rcx
	movq %r12, %rdx
	movq -1344(%rbp), %r8
	callq IDEKA__ilink__lk_w32__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -1344(%rbp), %rax
	jmp .LB10403
.LB10594:
	movl $1869374834, -261(%rbp)
	movl $1769234787, -257(%rbp)
	movl $1864396399, -253(%rbp)
	movl $1864397941, -249(%rbp)
	movl $1634869350, -245(%rbp)
	movl $6645614, -241(%rbp)
	leaq -261(%rbp), %rdx
	movq %rsi, %rcx
	callq IDEKA__ilink__le_fail__2__ElfLinkE1_ptr1__byteE1_ptr1__ret_boolE1
	movzbl %al, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB10407:
	movq -1312(%rbp), %rax
	addq %rbx, %rax
	subq %r13, %rax
	movq %rax, -1352(%rbp)
	cmpq $-2147483648, %rax
	jl .LB10542
.LB10536:
	movq -1352(%rbp), %rax
	cmpq $2147483647, %rax
	jg .LB10542
.LB10543:
	movq -80(%rbp), %rcx
	movq %r12, %rdx
	movq -1352(%rbp), %r8
	callq IDEKA__ilink__lk_w32__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -1352(%rbp), %rax
	jmp .LB10403
.LB10542:
	movl $1869374834, -285(%rbp)
	movl $1769234787, -281(%rbp)
	movl $1864396399, -277(%rbp)
	movl $1864397941, -273(%rbp)
	movl $1634869350, -269(%rbp)
	movl $6645614, -265(%rbp)
	leaq -285(%rbp), %rdx
	movq %rsi, %rcx
	callq IDEKA__ilink__le_fail__2__ElfLinkE1_ptr1__byteE1_ptr1__ret_boolE1
	movzbl %al, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB10406:
	movq -1312(%rbp), %rax
	addq %rbx, %rax
	subq %r13, %rax
	movq %rax, -1360(%rbp)
	cmpq $-2147483648, %rax
	jl .LB10490
.LB10484:
	movq -1360(%rbp), %rax
	cmpq $2147483647, %rax
	jg .LB10490
.LB10491:
	movq -80(%rbp), %rcx
	movq %r12, %rdx
	movq -1360(%rbp), %r8
	callq IDEKA__ilink__lk_w32__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -1360(%rbp), %rax
	jmp .LB10403
.LB10490:
	movl $1869374834, -309(%rbp)
	movl $1769234787, -305(%rbp)
	movl $1864396399, -301(%rbp)
	movl $1864397941, -297(%rbp)
	movl $1634869350, -293(%rbp)
	movl $6645614, -289(%rbp)
	leaq -309(%rbp), %rdx
	movq %rsi, %rcx
	callq IDEKA__ilink__le_fail__2__ElfLinkE1_ptr1__byteE1_ptr1__ret_boolE1
	movzbl %al, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB10405:
	movq -1312(%rbp), %rax
	addq %rbx, %rax
	subq %r13, %rax
	movq %rax, -1368(%rbp)
	cmpq $-2147483648, %rax
	jl .LB10438
.LB10432:
	movq -1368(%rbp), %rax
	cmpq $2147483647, %rax
	jg .LB10438
.LB10439:
	movq -80(%rbp), %rcx
	movq %r12, %rdx
	movq -1368(%rbp), %r8
	callq IDEKA__ilink__lk_w32__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -1368(%rbp), %rax
	jmp .LB10403
.LB10438:
	movl $1869374834, -333(%rbp)
	movl $1769234787, -329(%rbp)
	movl $1864396399, -325(%rbp)
	movl $1864397941, -321(%rbp)
	movl $1634869350, -317(%rbp)
	movl $6645614, -313(%rbp)
	leaq -333(%rbp), %rdx
	movq %rsi, %rcx
	callq IDEKA__ilink__le_fail__2__ElfLinkE1_ptr1__byteE1_ptr1__ret_boolE1
	movzbl %al, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB10404:
	movq -80(%rbp), %rcx
	movq -1312(%rbp), %rax
	leaq (%rax,%rbx), %r8
	movq %r12, %rdx
	callq IDEKA__ilink__lk_w64__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -1200(%rbp), %rax
	jmp .LB10403
.LB10415:
	movl $1970499189, -361(%rbp)
	movl $1919905904, -357(%rbp)
	movl $543450484, -353(%rbp)
	movl $1869374834, -349(%rbp)
	movl $1769234787, -345(%rbp)
	movl $1948282479, -341(%rbp)
	movl $6647929, -337(%rbp)
	leaq -361(%rbp), %rdx
	movq %rsi, %rcx
	callq IDEKA__ilink__le_fail__2__ElfLinkE1_ptr1__byteE1_ptr1__ret_boolE1
	movzbl %al, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB10112:
	movq -80(%rbp), %rdi
	movq -712(%rbp), %rax
	movl %eax, %ecx
	shll $3, %ecx
	movq -656(%rbp), %rdx
	leal (%rdx,%rcx), %ebx
	movq 504(%rsi), %rcx
	movslq %eax, %rax
	movl (%rcx,%rax,4), %edx
	movq %rsi, %rcx
	callq IDEKA__ilink__le_symaddr__2__ElfLinkE1_ptr1__intE1__ret_dataE1_sbits64
	movq %rax, %r8
	movq %rdi, %rcx
	movq %rbx, %rdx
	callq IDEKA__ilink__lk_w64__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	jmp .LB10114
.LB10036:
	movq 24(%rsi), %rax
	movq 80(%rsi), %rcx
	movq -704(%rbp), %rdx
	movslq %edx, %rdx
	movl (%rcx,%rdx,4), %ecx
	movslq %ecx, %rcx
	movq (%rax,%rcx,8), %rcx
	xorl %eax, %eax
.LB10052:
	movq 120(%rsi), %rdx
	movq -704(%rbp), %rdi
	movslq %edi, %rdi
	movl (%rdx,%rdi,4), %edx
	cmpl %edx, %eax
	jge .LB10054
.LB10053:
	movq 112(%rsi), %rdx
	movq -704(%rbp), %rdi
	movslq %edi, %rdi
	movl (%rdx,%rdi,4), %edx
	addl %eax, %edx
	movslq %edx, %rdx
	movzbl (%rcx,%rdx,1), %edx
	movq -80(%rbp), %rdi
	movq 160(%rsi), %r8
	movq -704(%rbp), %r9
	movslq %r9d, %r9
	movl (%r8,%r9,4), %r8d
	addl %eax, %r8d
	movslq %r8d, %r8
	movb %dl, (%rdi,%r8,1)
	incl %eax
	jmp .LB10052
.LB10054:
	jmp .LB10038
.LB9958:
	movl $544503151, -375(%rbp)
	movl $1830839919, -371(%rbp)
	movl $1919905125, -367(%rbp)
	movw $121, -363(%rbp)
	leaq -375(%rbp), %rdx
	movq %rsi, %rcx
	callq IDEKA__ilink__le_fail__2__ElfLinkE1_ptr1__byteE1_ptr1__ret_boolE1
	movzbl %al, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB9905:
	movl $1920233061, -409(%rbp)
	movl $1869619321, -405(%rbp)
	movl $544501353, -401(%rbp)
	movl $1651341683, -397(%rbp)
	movl $1763732591, -393(%rbp)
	movl $1869488243, -389(%rbp)
	movl $1701060724, -385(%rbp)
	movl $1701734758, -381(%rbp)
	movw $100, -377(%rbp)
	leaq -409(%rbp), %rdx
	movq %rsi, %rcx
	callq IDEKA__ilink__le_fail__2__ElfLinkE1_ptr1__byteE1_ptr1__ret_boolE1
	movzbl %al, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB9897:
	movq -672(%rbp), %rax
	jmp .LB9899
.LB9762:
	movq 416(%rsi), %rdx
	movq -664(%rbp), %rdi
	movslq %edi, %rdi
	leaq (%rdx,%rdi,8), %rdx
	movq (%rdx), %rdi
	movq -984(%rbp), %r8
	addq %rdi, %r8
	movq %r8, (%rdx)
	jmp .LB9764
.LB9790:
	shll $4, %edx
	movslq %edx, %rdx
	addq %rax, %rdx
	movq 432(%rsi), %rdi
	movq -664(%rbp), %r8
	movslq %r8d, %r8
	movq %rdx, (%rdi,%r8,8)
	jmp .LB9792
.LB9823:
	shll $3, %edx
	movslq %edx, %rdx
	addq %rcx, %rdx
	movq 424(%rsi), %rdi
	movq -664(%rbp), %r8
	movslq %r8d, %r8
	movq %rdx, (%rdi,%r8,8)
	jmp .LB9825
.LB9723:
	movq 240(%rsi), %rcx
	movslq %eax, %rdx
	leaq (%rcx,%rdx,8), %rcx
	movq (%rcx), %rdx
	movq -984(%rbp), %rdi
	addq %rdx, %rdi
	movq %rdi, (%rcx)
	jmp .LB9725
.LB9544:
	testl %r8d, %r8d
	je .LB9549
.LB9550:
	cmpl $1, %r8d
	je .LB9592
.LB9593:
	cmpl $2, %r8d
	je .LB9634
.LB9635:
	movq 160(%rsi), %r8
	movslq %edi, %r9
	movl (%r8,%r9,4), %r8d
	movslq %r8d, %r8
	movq -984(%rbp), %rbx
	addq %r8, %rbx
	movq 144(%rsi), %r8
	movq %rbx, (%r8,%r9,8)
	jmp .LB9546
.LB9634:
	movq 160(%rsi), %r8
	movslq %edi, %r9
	movl (%r8,%r9,4), %r8d
	movslq %r8d, %r8
	addq %rax, %r8
	movq 144(%rsi), %rbx
	movq %r8, (%rbx,%r9,8)
	movq 160(%rsi), %r8
	leaq (%r8,%r9,4), %r8
	movl (%r8), %r9d
	movq -640(%rbp), %rbx
	addl %r9d, %ebx
	movl %ebx, (%r8)
	jmp .LB9546
.LB9592:
	movq 160(%rsi), %r8
	movslq %edi, %r9
	movl (%r8,%r9,4), %r8d
	movslq %r8d, %r8
	addq %rcx, %r8
	movq 144(%rsi), %rbx
	movq %r8, (%rbx,%r9,8)
	movq 160(%rsi), %r8
	leaq (%r8,%r9,4), %r8
	movl (%r8), %r9d
	movq -608(%rbp), %rbx
	addl %r9d, %ebx
	movl %ebx, (%r8)
	jmp .LB9546
.LB9549:
	movq 160(%rsi), %r8
	movslq %edi, %r9
	movl (%r8,%r9,4), %r8d
	movslq %r8d, %r8
	addq %rdx, %r8
	movq 144(%rsi), %rbx
	movq %r8, (%rbx,%r9,8)
	movq 160(%rsi), %r8
	leaq (%r8,%r9,4), %r8
	movl (%r8), %r9d
	movq -600(%rbp), %rbx
	addl %r9d, %ebx
	movl %ebx, (%r8)
	jmp .LB9546
.LB9384:
	movslq %ecx, %rdi
	movq -1088(%rbp), %r9
	movl %r8d, (%r9,%rdi,4)
	leal 16(%rdx), %edi
	movl %r8d, %r9d
	shll $4, %r9d
	addl %r9d, %edi
	cmpl $0, %r8d
	cmovg %edi, %edx
	incl %ecx
	jmp .LB9373
.LB9212:
	movq 256(%rsi), %rax
	movq -424(%rbp), %rcx
	movslq %ecx, %rcx
	movq (%rax,%rcx,8), %rdx
	leaq -104(%rbp), %rcx
	callq IDEKA__ilink__lb_put_str__2__LkBufE1_ptr1__byteE1_ptr1__ret_intE1
	movl %eax, (%rdi)
	movq -432(%rbp), %rax
	incl %eax
	jmp .LB9214
.LB9115:
	movq 368(%rsi), %rax
	movslq %edi, %rbx
	movq (%rax,%rbx,8), %rax
	movq $8, %rcx
	movq $16, %rdx
	cmpq $16, %rax
	movq %rdx, %r12
	cmovl %rcx, %r12
	movl -108(%rbp), %eax
	movslq %eax, %rcx
	movq %r12, %rdx
	callq IDEKA__ilink__lk_align_up__2__dataE1_sbits64__dataE1_sbits64__ret_dataE1_sbits64
	movq 416(%rsi), %rcx
	movq %rax, (%rcx,%rbx,8)
	movq 416(%rsi), %rax
	movq (%rax,%rbx,8), %rax
	movq 368(%rsi), %rcx
	movq (%rcx,%rbx,8), %rcx
	addl %ecx, %eax
	movl %eax, -108(%rbp)
	movq %r12, %rax
	jmp .LB9117
.LB9037:
	movq 200(%rsi), %rax
	movslq %edi, %rbx
	movq (%rax,%rbx,8), %rax
	movq $1, %rcx
	cmpq $1, %rax
	movq %rax, %r12
	cmovl %rcx, %r12
	movl -108(%rbp), %eax
	movslq %eax, %rcx
	movq %r12, %rdx
	callq IDEKA__ilink__lk_align_up__2__dataE1_sbits64__dataE1_sbits64__ret_dataE1_sbits64
	movq 240(%rsi), %rcx
	movq %rax, (%rcx,%rbx,8)
	movq 240(%rsi), %rax
	movq (%rax,%rbx,8), %rax
	movq 208(%rsi), %rcx
	movq (%rcx,%rbx,8), %rcx
	addl %ecx, %eax
	movl %eax, -108(%rbp)
	movl -124(%rbp), %eax
	movslq %eax, %rax
	cmpq %rax, %r12
	jg .LB9090
.LB9092:
	movq %r12, %rax
	jmp .LB9039
.LB9090:
	movl %r12d, -124(%rbp)
	jmp .LB9092
.LB8941:
	movslq %ebx, %rax
	movl -120(%rbp,%rax,4), %eax
	movq 128(%rsi), %rcx
	movslq %edi, %r12
	movl (%rcx,%r12,4), %ecx
	movslq %eax, %rax
	movslq %ecx, %rdx
	movq %rax, %rcx
	callq IDEKA__ilink__lk_align_up__2__dataE1_sbits64__dataE1_sbits64__ret_dataE1_sbits64
	movq 160(%rsi), %rcx
	movl %eax, (%rcx,%r12,4)
	movq 160(%rsi), %rax
	movl (%rax,%r12,4), %eax
	movq 120(%rsi), %rcx
	movl (%rcx,%r12,4), %ecx
	addl %ecx, %eax
	movslq %ebx, %rcx
	movl %eax, -120(%rbp,%rcx,4)
	movq 128(%rsi), %rax
	movslq %edi, %rcx
	movl (%rax,%rcx,4), %eax
	movslq %ebx, %rcx
	movl -136(%rbp,%rcx,4), %ecx
	cmpl %ecx, %eax
	jle .LB8943
.LB8994:
	movslq %ebx, %rcx
	movl %eax, -136(%rbp,%rcx,4)
	jmp .LB8943
	.section .rodata
	.p2align 3
.LJT22426:
	.quad .LB10404
	.quad .LB10405
	.quad .LB10415
	.quad .LB10406
	.quad .LB10415
	.quad .LB10415
	.quad .LB10415
	.quad .LB10415
	.quad .LB10407
	.quad .LB10410
	.quad .LB10411
	.quad .LB10412
	.quad .LB10415
	.quad .LB10413
	.quad .LB10415
	.quad .LB10415
	.quad .LB10415
	.quad .LB10415
	.quad .LB10415
	.quad .LB10415
	.quad .LB10415
	.quad .LB10415
	.quad .LB10415
	.quad .LB10414
	.quad .LB10415
	.quad .LB10415
	.quad .LB10415
	.quad .LB10415
	.quad .LB10415
	.quad .LB10415
	.quad .LB10415
	.quad .LB10415
	.quad .LB10415
	.quad .LB10415
	.quad .LB10415
	.quad .LB10415
	.quad .LB10415
	.quad .LB10415
	.quad .LB10415
	.quad .LB10415
	.quad .LB10408
	.quad .LB10409
	.text
	.text
	.globl IDEKA__ilink__lk_elf_link__9__byteE1_ptr2__intE1__byteE1_ptr2__intE1__byteE1_ptr2__intE1__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__ret_byteE1_ptr1
	.def IDEKA__ilink__lk_elf_link__9__byteE1_ptr2__intE1__byteE1_ptr2__intE1__byteE1_ptr2__intE1__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__ret_byteE1_ptr1;
	.scl 2;
	.type 32;
	.endef
IDEKA__ilink__lk_elf_link__9__byteE1_ptr2__intE1__byteE1_ptr2__intE1__byteE1_ptr2__intE1__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__ret_byteE1_ptr1:
	pushq %rbp
	movq %rsp, %rbp
	subq $800, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
	movq %r14, -48(%rbp)
	movq %r15, -56(%rbp)
.LB12479:
	movq %rcx, %rbx
	movl %edx, %r12d
	movq %r8, %r13
	movq %r9, -680(%rbp)
	movq 48(%rbp), %r14
	movl 56(%rbp), %r15d
	movq 64(%rbp), %rax
	movq %rax, -688(%rbp)
	movq 72(%rbp), %rax
	movq %rax, -696(%rbp)
	movq 80(%rbp), %rax
	movq %rax, -704(%rbp)
	leaq .LZERO(%rip), %rsi
	leaq -640(%rbp), %rdi
	movq $584, %rcx
	rep movsb
	movl $0, -644(%rbp)
	movq $0, -640(%rbp)
	movl %r12d, -632(%rbp)
	movl $0, -304(%rbp)
	movl $0, -192(%rbp)
	movl $0, -152(%rbp)
	movl $0, -128(%rbp)
	movl $0, -112(%rbp)
	movl $0, -392(%rbp)
	leal 1(%r12), %esi
	movl %esi, %eax
	shll $3, %eax
	movslq %eax, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -616(%rbp)
	shll $2, %esi
	movslq %esi, %rsi
	movq %rsi, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -608(%rbp)
	movq %rsi, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -600(%rbp)
	movq %rsi, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -592(%rbp)
	movq %rsi, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -584(%rbp)
	movq %rsi, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -576(%rbp)
	movq %rsi, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -568(%rbp)
	xorl %esi, %esi
	movl $1, %edi
.LB12557:
	cmpl %r12d, %esi
	jge .LB12559
.LB12563:
	testb %dil, %dil
	je .LB12559
.LB12558:
	movl $0, -644(%rbp)
	movslq %esi, %rdi
	movq (%rbx,%rdi,8), %rcx
	leaq -644(%rbp), %rdx
	callq IDEKA__ilink__lk_read_file__2__byteE1_ptr1__intE1_ptr1__ret_byteE1_ptr1
	movq -616(%rbp), %rcx
	movq %rax, (%rcx,%rdi,8)
	movq -616(%rbp), %rax
	movq (%rax,%rdi,8), %rax
	testq %rax, %rax
	je .LB12591
.LB12592:
	movl -644(%rbp), %eax
	movq -608(%rbp), %rcx
	movl %eax, (%rcx,%rdi,4)
	leaq -640(%rbp), %rcx
	movq %rsi, %rdx
	callq IDEKA__ilink__le_count_obj__2__ElfLinkE1_ptr1__intE1__ret_boolE1
	movzbl %al, %eax
.LB12593:
	incl %esi
	movq %rax, %rdi
	cmpl %r12d, %esi
	jl .LB12563
.LB12559:
	testb %dil, %dil
	je .LB12639
.LB12640:
	movslq %r12d, %rax
	xorl %ecx, %ecx
	xorl %esi, %esi
	xorl %edx, %edx
.LB12646:
	cmpq %rax, %rdx
	jge .LB12648
.LB12647:
	movq -600(%rbp), %r8
	movl %ecx, (%r8,%rdx,4)
	movq -584(%rbp), %r8
	movl %esi, (%r8,%rdx,4)
	movq -592(%rbp), %r8
	movl (%r8,%rdx,4), %r8d
	addl %r8d, %ecx
	movq -576(%rbp), %r8
	movl (%r8,%rdx,4), %r8d
	addl %r8d, %esi
	incq %rdx
	cmpq %rax, %rdx
	jl .LB12647
.LB12648:
	movl %ecx, -628(%rbp)
	movl %esi, -624(%rbp)
	incl %ecx
	movq %rcx, -712(%rbp)
	shll $2, %ecx
	movslq %ecx, %rbx
	movq %rbx, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -560(%rbp)
	movq -712(%rbp), %rax
	shll $3, %eax
	movslq %eax, %rcx
	movq %rcx, -720(%rbp)
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -552(%rbp)
	movq %rbx, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -544(%rbp)
	movq -720(%rbp), %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -536(%rbp)
	movq %rbx, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -528(%rbp)
	movq %rbx, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -520(%rbp)
	movq %rbx, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -512(%rbp)
	movq %rbx, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -504(%rbp)
	movq -720(%rbp), %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -496(%rbp)
	movq %rbx, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -488(%rbp)
	movq %rbx, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -480(%rbp)
	leal 1(%rsi), %eax
	movq %rax, -728(%rbp)
	shll $2, %eax
	movslq %eax, %rbx
	movq %rbx, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -472(%rbp)
	movq -728(%rbp), %rax
	shll $3, %eax
	movslq %eax, %rcx
	movq %rcx, -736(%rbp)
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -464(%rbp)
	movq %rbx, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -456(%rbp)
	movq %rbx, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -448(%rbp)
	movq -736(%rbp), %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -440(%rbp)
	movq -736(%rbp), %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -432(%rbp)
	movq %rbx, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -424(%rbp)
	movq %rbx, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -416(%rbp)
	movq %rbx, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -408(%rbp)
	movq -736(%rbp), %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -400(%rbp)
	leal 2(%rsi), %eax
	movq %rax, -744(%rbp)
	shll $3, %eax
	movslq %eax, %rcx
	movq %rcx, -752(%rbp)
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -296(%rbp)
	movq -744(%rbp), %rax
	shll $2, %eax
	movslq %eax, %rbx
	movq %rbx, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -288(%rbp)
	movq %rbx, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -280(%rbp)
	movq -752(%rbp), %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -272(%rbp)
	movq %rbx, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -264(%rbp)
	movq %rbx, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -256(%rbp)
	movq %rbx, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -248(%rbp)
	movq %rbx, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -240(%rbp)
	movq %rbx, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -232(%rbp)
	movq -752(%rbp), %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -224(%rbp)
	movq -752(%rbp), %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -216(%rbp)
	movq -752(%rbp), %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -208(%rbp)
	movq %rbx, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -200(%rbp)
	movq %rbx, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -184(%rbp)
	movq -752(%rbp), %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -176(%rbp)
	movq -752(%rbp), %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -168(%rbp)
	movq %rbx, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -160(%rbp)
	movq -744(%rbp), %rax
	shll $1, %eax
	shll $2, %eax
	movslq %eax, %rcx
	movq %rcx, -760(%rbp)
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -144(%rbp)
	movq -760(%rbp), %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -136(%rbp)
	movq %rbx, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -120(%rbp)
	movq -680(%rbp), %rax
	leal 1(%rax), %ebx
	movl %ebx, %eax
	shll $3, %eax
	movslq %eax, %rcx
	movq %rcx, -768(%rbp)
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -384(%rbp)
	movq -768(%rbp), %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -376(%rbp)
	shll $2, %ebx
	movslq %ebx, %rbx
	movq %rbx, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -368(%rbp)
	movq %rbx, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -360(%rbp)
	movq %rbx, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -352(%rbp)
	movq %rbx, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -344(%rbp)
	movq %rbx, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -336(%rbp)
	movq %rbx, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -328(%rbp)
	movq %rbx, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -320(%rbp)
	movq %rbx, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -312(%rbp)
	leaq -80(%rbp), %rcx
	leal 2(%rsi), %edx
	callq IDEKA__ilink__lm_init__2__LkMapE1_ptr1__intE1__ret_voidE1
	xorl %esi, %esi
.LB13019:
	cmpl %r12d, %esi
	jge .LB13021
.LB13025:
	testb %dil, %dil
	je .LB13021
.LB13020:
	leaq -640(%rbp), %rcx
	movq %rsi, %rdx
	callq IDEKA__ilink__le_load_obj__2__ElfLinkE1_ptr1__intE1__ret_boolE1
	movzbl %al, %edi
	incl %esi
	cmpl %r12d, %esi
	jl .LB13025
.LB13021:
	movq -680(%rbp), %rax
	movslq %eax, %rsi
	xorl %ebx, %ebx
.LB13033:
	cmpq %rsi, %rbx
	jge .LB13035
.LB13039:
	testb %dil, %dil
	je .LB13035
.LB13034:
	movq (%r13,%rbx,8), %rdx
	leaq -640(%rbp), %rcx
	movq %r14, %r8
	movq %r15, %r9
	callq IDEKA__ilink__le_open_lib__4__ElfLinkE1_ptr1__byteE1_ptr1__byteE1_ptr2__intE1__ret_boolE1
	movzbl %al, %edi
	incq %rbx
	cmpq %rsi, %rbx
	jl .LB13039
.LB13035:
	testb %dil, %dil
	jne .LB13053
.LB13054:
.LB13055:
	testb %dil, %dil
	jne .LB13058
.LB13059:
.LB13060:
	testb %dil, %dil
	jne .LB13063
.LB13064:
	movq -640(%rbp), %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB13053:
	leaq -640(%rbp), %rcx
	callq IDEKA__ilink__le_resolve_names__1__ElfLinkE1_ptr1__ret_boolE1
	movzbl %al, %edi
	testb %dil, %dil
	je .LB13059
.LB13058:
	leaq -640(%rbp), %rcx
	callq IDEKA__ilink__le_scan_relocs__1__ElfLinkE1_ptr1__ret_boolE1
	movzbl %al, %edi
	testb %dil, %dil
	je .LB13064
.LB13063:
	leaq -640(%rbp), %rcx
	movq -688(%rbp), %rdx
	movq -696(%rbp), %r8
	movq -704(%rbp), %r9
	callq IDEKA__ilink__le_link_all__4__ElfLinkE1_ptr1__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__ret_boolE1
	movq -640(%rbp), %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB12639:
	movq -640(%rbp), %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB12591:
	movl $1852727651, -672(%rbp)
	movl $1914729583, -668(%rbp)
	movl $543449445, -664(%rbp)
	movl $1763733089, -660(%rbp)
	movl $1953853550, -656(%rbp)
	movl $1784835872, -652(%rbp)
	movl $7627621, -648(%rbp)
	leaq -672(%rbp), %rdx
	leaq -640(%rbp), %rcx
	callq IDEKA__ilink__le_fail__2__ElfLinkE1_ptr1__byteE1_ptr1__ret_boolE1
	movzbl %al, %eax
	jmp .LB12593
	.text
	.globl IDEKA__ilink__pe_fail__2__PeLinkE1_ptr1__byteE1_ptr1__ret_boolE1
	.def IDEKA__ilink__pe_fail__2__PeLinkE1_ptr1__byteE1_ptr1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
IDEKA__ilink__pe_fail__2__PeLinkE1_ptr1__byteE1_ptr1__ret_boolE1:
.LB13074:
	movq (%rcx), %rax
	testq %rax, %rax
	je .LB13086
.LB13087:
	xorl %eax, %eax
	ret
.LB13086:
	movq %rdx, (%rcx)
	xorl %eax, %eax
	ret
	.text
	.globl IDEKA__ilink__pe_has_prefix__2__byteE1_ptr1__byteE1_ptr1__ret_boolE1
	.def IDEKA__ilink__pe_has_prefix__2__byteE1_ptr1__byteE1_ptr1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
IDEKA__ilink__pe_has_prefix__2__byteE1_ptr1__byteE1_ptr1__ret_boolE1:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
	movq %rdi, -8(%rsp)
.LB13092:
	xorl %eax, %eax
.LB13096:
	movslq %eax, %rsi
	movzbl (%rdx,%rsi,1), %esi
	movzbl %sil, %edi
	testl %edi, %edi
	je .LB13098
.LB13097:
	movslq %eax, %rdi
	movzbl (%rcx,%rdi,1), %edi
	cmpb %sil, %dil
	jne .LB13114
.LB13115:
	incl %eax
	jmp .LB13096
.LB13098:
	movl $1, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB13114:
	xorl %eax, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
	.text
	.globl IDEKA__ilink__pe_add_obj__3__PeLinkE1_ptr1__byteE1_ptr1__intE1__ret_intE1
	.def IDEKA__ilink__pe_add_obj__3__PeLinkE1_ptr1__byteE1_ptr1__intE1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
IDEKA__ilink__pe_add_obj__3__PeLinkE1_ptr1__byteE1_ptr1__intE1__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
.LB13119:
	movq %rcx, %rsi
	movq %rdx, %rdi
	movl %r8d, %ebx
	movl 8(%rsi), %r12d
	movl 12(%rsi), %eax
	cmpl %eax, %r12d
	jge .LB13134
.LB13136:
	movq 16(%rsi), %rax
	movslq %r12d, %rcx
	movq %rdi, (%rax,%rcx,8)
	movq 24(%rsi), %rax
	movl %ebx, (%rax,%rcx,4)
	movl 8(%rsi), %eax
	incl %eax
	movl %eax, 8(%rsi)
	movl %r12d, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB13134:
	shll $1, %eax
	movl %eax, 12(%rsi)
	movq 16(%rsi), %rcx
	movl %eax, %edx
	shll $3, %edx
	callq IDEKA__ilink__lk_grow__2__byteE1_ptr1__intE1__ret_byteE1_ptr1
	movq %rax, 16(%rsi)
	movq 24(%rsi), %rax
	movq %rax, %rcx
	movl 12(%rsi), %eax
	movl %eax, %edx
	shll $2, %edx
	callq IDEKA__ilink__lk_grow__2__byteE1_ptr1__intE1__ret_byteE1_ptr1
	movq %rax, 24(%rsi)
	jmp .LB13136
	.text
	.globl IDEKA__ilink__pe_name__3__byteE1_ptr1__intE1__intE1__ret_byteE1_ptr1
	.def IDEKA__ilink__pe_name__3__byteE1_ptr1__intE1__intE1__ret_byteE1_ptr1;
	.scl 2;
	.type 32;
	.endef
IDEKA__ilink__pe_name__3__byteE1_ptr1__intE1__intE1__ret_byteE1_ptr1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
.LB13198:
	movq %rcx, %rsi
	movl %edx, %edi
	movl %r8d, %ebx
	movq %rsi, %rcx
	movq %rdi, %rdx
	callq IDEKA__ilink__lk_r32__2__byteE1_ptr1__intE1__ret_dataE1_sbits64
	testq %rax, %rax
	je .LB13209
.LB13210:
	movq $9, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	xorl %ecx, %ecx
.LB13224:
	cmpl $8, %ecx
	jge .LB13226
.LB13229:
	leal (%rdi,%rcx), %edx
	movslq %edx, %rdx
	movzbl (%rsi,%rdx,1), %edx
	testl %edx, %edx
	je .LB13226
.LB13225:
	leal (%rdi,%rcx), %edx
	movslq %edx, %rdx
	movzbl (%rsi,%rdx,1), %edx
	movslq %ecx, %r8
	movb %dl, (%rax,%r8,1)
	incl %ecx
	cmpl $8, %ecx
	jl .LB13229
.LB13226:
	movslq %ecx, %rcx
	movb $0, (%rax,%rcx,1)
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB13209:
	leal 4(%rdi), %edx
	movq %rsi, %rcx
	callq IDEKA__ilink__lk_r32__2__byteE1_ptr1__intE1__ret_dataE1_sbits64
	movslq %ebx, %rcx
	movslq %eax, %rax
	leaq (%rsi,%rcx,1), %rcx
	leaq (%rcx,%rax,1), %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
	.text
	.globl IDEKA__ilink__pe_is_coff__2__byteE1_ptr1__intE1__ret_boolE1
	.def IDEKA__ilink__pe_is_coff__2__byteE1_ptr1__intE1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
IDEKA__ilink__pe_is_coff__2__byteE1_ptr1__intE1__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB13256:
	cmpl $20, %edx
	jl .LB13261
.LB13262:
	xorl %edx, %edx
	callq IDEKA__ilink__lk_r16__2__byteE1_ptr1__intE1__ret_intE1
	cmpl $34404, %eax
	sete %al
	movzbl %al, %eax
	leave
	ret
.LB13261:
	xorl %eax, %eax
	leave
	ret
	.text
	.globl IDEKA__ilink__pe_add_ent__9__PeLinkE1_ptr1__byteE1_ptr1__intE1__intE1__intE1__byteE1_ptr1__byteE1_ptr1__intE1__intE1__ret_voidE1
	.def IDEKA__ilink__pe_add_ent__9__PeLinkE1_ptr1__byteE1_ptr1__intE1__intE1__intE1__byteE1_ptr1__byteE1_ptr1__intE1__intE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
IDEKA__ilink__pe_add_ent__9__PeLinkE1_ptr1__byteE1_ptr1__intE1__intE1__intE1__byteE1_ptr1__byteE1_ptr1__intE1__intE1__ret_voidE1:
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
.LB13267:
	movq %rcx, %rsi
	movq %rdx, -80(%rbp)
	movl %r8d, %edi
	movl %r9d, %ebx
	movl 48(%rbp), %r12d
	movq 56(%rbp), %r13
	movq 64(%rbp), %r14
	movl 72(%rbp), %eax
	movq %rax, -64(%rbp)
	movl 80(%rbp), %eax
	movq %rax, -72(%rbp)
	movl 296(%rsi), %r15d
	movl 300(%rsi), %eax
	cmpl %eax, %r15d
	jge .LB13288
.LB13290:
	movq 304(%rsi), %rax
	movslq %r15d, %rcx
	movl %edi, (%rax,%rcx,4)
	movq 312(%rsi), %rax
	movl %ebx, (%rax,%rcx,4)
	movq 320(%rsi), %rax
	movl %r12d, (%rax,%rcx,4)
	movq 328(%rsi), %rax
	movq %r13, (%rax,%rcx,8)
	movq 336(%rsi), %rax
	movq %r14, (%rax,%rcx,8)
	movq 344(%rsi), %rax
	movq -64(%rbp), %rdx
	movl %edx, (%rax,%rcx,4)
	movq 352(%rsi), %rax
	movq -72(%rbp), %rdx
	movl %edx, (%rax,%rcx,4)
	leaq 360(%rsi), %rcx
	movq -80(%rbp), %rdx
	movq %r15, %r8
	callq IDEKA__ilink__lm_put__3__LkMapE1_ptr1__byteE1_ptr1__intE1__ret_boolE1
	testb %al, %al
	jne .LB13464
.LB13465:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB13288:
	shll $1, %eax
	movl %eax, 300(%rsi)
	movq 304(%rsi), %rcx
	movl %eax, %edx
	shll $2, %edx
	callq IDEKA__ilink__lk_grow__2__byteE1_ptr1__intE1__ret_byteE1_ptr1
	movq %rax, 304(%rsi)
	movq 312(%rsi), %rax
	movq %rax, %rcx
	movl 300(%rsi), %eax
	movl %eax, %edx
	shll $2, %edx
	callq IDEKA__ilink__lk_grow__2__byteE1_ptr1__intE1__ret_byteE1_ptr1
	movq %rax, 312(%rsi)
	movq 320(%rsi), %rax
	movq %rax, %rcx
	movl 300(%rsi), %eax
	movl %eax, %edx
	shll $2, %edx
	callq IDEKA__ilink__lk_grow__2__byteE1_ptr1__intE1__ret_byteE1_ptr1
	movq %rax, 320(%rsi)
	movq 328(%rsi), %rax
	movq %rax, %rcx
	movl 300(%rsi), %eax
	movl %eax, %edx
	shll $3, %edx
	callq IDEKA__ilink__lk_grow__2__byteE1_ptr1__intE1__ret_byteE1_ptr1
	movq %rax, 328(%rsi)
	movq 336(%rsi), %rax
	movq %rax, %rcx
	movl 300(%rsi), %eax
	movl %eax, %edx
	shll $3, %edx
	callq IDEKA__ilink__lk_grow__2__byteE1_ptr1__intE1__ret_byteE1_ptr1
	movq %rax, 336(%rsi)
	movq 344(%rsi), %rax
	movq %rax, %rcx
	movl 300(%rsi), %eax
	movl %eax, %edx
	shll $2, %edx
	callq IDEKA__ilink__lk_grow__2__byteE1_ptr1__intE1__ret_byteE1_ptr1
	movq %rax, 344(%rsi)
	movq 352(%rsi), %rax
	movq %rax, %rcx
	movl 300(%rsi), %eax
	movl %eax, %edx
	shll $2, %edx
	callq IDEKA__ilink__lk_grow__2__byteE1_ptr1__intE1__ret_byteE1_ptr1
	movq %rax, 352(%rsi)
	jmp .LB13290
.LB13464:
	movl 296(%rsi), %eax
	incl %eax
	movl %eax, 296(%rsi)
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
	.globl IDEKA__ilink__pe_dec__3__byteE1_ptr1__intE1__intE1__ret_intE1
	.def IDEKA__ilink__pe_dec__3__byteE1_ptr1__intE1__intE1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
IDEKA__ilink__pe_dec__3__byteE1_ptr1__intE1__intE1__ret_intE1:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
	movq %rdi, -8(%rsp)
.LB13474:
	xorl %eax, %eax
	xorl %esi, %esi
.LB13480:
	cmpl %r8d, %esi
	jge .LB13482
.LB13486:
	leal (%rdx,%rsi), %edi
	movslq %edi, %rdi
	movzbl (%rcx,%rdi,1), %edi
	cmpl $48, %edi
	jb .LB13482
.LB13497:
	leal (%rdx,%rsi), %edi
	movslq %edi, %rdi
	movzbl (%rcx,%rdi,1), %edi
	cmpl $57, %edi
	ja .LB13482
.LB13481:
	imull $10, %eax, %eax
	leal (%rdx,%rsi), %edi
	movslq %edi, %rdi
	movzbl (%rcx,%rdi,1), %edi
	subl $48, %edi
	addl %edi, %eax
	incl %esi
	cmpl %r8d, %esi
	jl .LB13486
.LB13482:
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
	.text
	.globl IDEKA__ilink__pe_rbe32__2__byteE1_ptr1__intE1__ret_dataE1_sbits64
	.def IDEKA__ilink__pe_rbe32__2__byteE1_ptr1__intE1__ret_dataE1_sbits64;
	.scl 2;
	.type 32;
	.endef
IDEKA__ilink__pe_rbe32__2__byteE1_ptr1__intE1__ret_dataE1_sbits64:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
.LB13522:
	movslq %edx, %rax
	movzbl (%rcx,%rax,1), %eax
	shlq $8, %rax
	leal 1(%rdx), %esi
	movslq %esi, %rsi
	movzbl (%rcx,%rsi,1), %esi
	orq %rsi, %rax
	shlq $8, %rax
	leal 2(%rdx), %esi
	movslq %esi, %rsi
	movzbl (%rcx,%rsi,1), %esi
	orq %rsi, %rax
	shlq $8, %rax
	addl $3, %edx
	movslq %edx, %rdx
	movzbl (%rcx,%rdx,1), %ecx
	orq %rcx, %rax
	movq 0(%rsp), %rsi
	addq $16, %rsp
	ret
	.text
	.globl IDEKA__ilink__pe_open_archive__2__PeLinkE1_ptr1__intE1__ret_boolE1
	.def IDEKA__ilink__pe_open_archive__2__PeLinkE1_ptr1__intE1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
IDEKA__ilink__pe_open_archive__2__PeLinkE1_ptr1__intE1__ret_boolE1:
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
.LB13570:
	movq %rcx, %rsi
	movq %rdx, -152(%rbp)
	movq 272(%rsi), %rax
	movslq %edx, %rcx
	movq (%rax,%rcx,8), %rdi
	movq 280(%rsi), %rax
	movl (%rax,%rcx,4), %eax
	cmpl $72, %eax
	jl .LB13607
.LB13599:
	movzbl 66(%rdi), %eax
	cmpl $96, %eax
	jne .LB13607
.LB13608:
	movzbl 8(%rdi), %eax
	cmpl $47, %eax
	jne .LB13658
.LB13650:
	movzbl 9(%rdi), %eax
	cmpl $32, %eax
	jne .LB13658
.LB13659:
	movq %rdi, %rcx
	movq $56, %rdx
	movq $10, %r8
	callq IDEKA__ilink__pe_dec__3__byteE1_ptr1__intE1__intE1__ret_intE1
	movl %eax, %ebx
	movq %rdi, %rcx
	movq $68, %rdx
	callq IDEKA__ilink__pe_rbe32__2__byteE1_ptr1__intE1__ret_dataE1_sbits64
	movl %eax, %r12d
	movl %r12d, %eax
	shll $2, %eax
	addl $72, %eax
	addl $68, %ebx
	cmpl %ebx, %eax
	jg .LB13707
.LB13708:
	xorl %ebx, %ebx
	movq %rax, %r13
.LB13741:
	cmpl %r12d, %ebx
	jge .LB13743
.LB13742:
	movslq %r13d, %rax
	leaq (%rdi,%rax,1), %r14
	movq %r14, %rcx
	callq IDEKA__ilink__lk_strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %r15d
	movl %ebx, %eax
	shll $2, %eax
	leal 72(%rax), %edx
	movq %rdi, %rcx
	callq IDEKA__ilink__pe_rbe32__2__byteE1_ptr1__intE1__ret_dataE1_sbits64
	movq %rax, 32(%rsp)
	movq $0, 40(%rsp)
	movq $0, 48(%rsp)
	movq $0, 56(%rsp)
	movq $0, 64(%rsp)
	movq %rsi, %rcx
	movq %r14, %rdx
	movq -152(%rbp), %r8
	xorl %r9d, %r9d
	callq IDEKA__ilink__pe_add_ent__9__PeLinkE1_ptr1__byteE1_ptr1__intE1__intE1__intE1__byteE1_ptr1__byteE1_ptr1__intE1__intE1__ret_voidE1
	addl %r15d, %r13d
	incl %r13d
	incl %ebx
	cmpl %r12d, %ebx
	jl .LB13742
.LB13743:
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
.LB13707:
	movl $543449442, -81(%rbp)
	movl $1751347809, -77(%rbp)
	movl $543520361, -73(%rbp)
	movl $1651341683, -69(%rbp)
	movl $1763732591, -65(%rbp)
	movl $2019910766, -61(%rbp)
	movb $0, -57(%rbp)
	leaq -81(%rbp), %rdx
	movq %rsi, %rcx
	callq IDEKA__ilink__pe_fail__2__PeLinkE1_ptr1__byteE1_ptr1__ret_boolE1
	movzbl %al, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB13658:
	movl $1751347809, -109(%rbp)
	movl $543520361, -105(%rbp)
	movl $544432488, -101(%rbp)
	movl $1931505518, -97(%rbp)
	movl $1868721529, -93(%rbp)
	movl $1852383340, -89(%rbp)
	movl $7890276, -85(%rbp)
	leaq -109(%rbp), %rdx
	movq %rsi, %rcx
	callq IDEKA__ilink__pe_fail__2__PeLinkE1_ptr1__byteE1_ptr1__ret_boolE1
	movzbl %al, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB13607:
	movl $1919052140, -139(%rbp)
	movl $544830049, -135(%rbp)
	movl $1847620457, -131(%rbp)
	movl $1629516911, -127(%rbp)
	movl $1179599648, -123(%rbp)
	movl $1918967878, -119(%rbp)
	movl $1986619491, -115(%rbp)
	movw $101, -111(%rbp)
	leaq -139(%rbp), %rdx
	movq %rsi, %rcx
	callq IDEKA__ilink__pe_fail__2__PeLinkE1_ptr1__byteE1_ptr1__ret_boolE1
	movzbl %al, %eax
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
	.globl IDEKA__ilink__pe_rva_ptr__4__byteE1_ptr1__intE1__intE1__intE1__ret_byteE1_ptr1
	.def IDEKA__ilink__pe_rva_ptr__4__byteE1_ptr1__intE1__intE1__intE1__ret_byteE1_ptr1;
	.scl 2;
	.type 32;
	.endef
IDEKA__ilink__pe_rva_ptr__4__byteE1_ptr1__intE1__intE1__intE1__ret_byteE1_ptr1:
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
.LB13773:
	movq %rcx, %rsi
	movl %edx, %edi
	movq %r8, -64(%rbp)
	movl %r9d, %ebx
	xorl %r12d, %r12d
.LB13782:
	movq -64(%rbp), %rax
	cmpl %eax, %r12d
	jge .LB13784
.LB13783:
	imull $40, %r12d, %eax
	leal (%rdi,%rax), %r13d
	leal 12(%r13), %edx
	movq %rsi, %rcx
	callq IDEKA__ilink__lk_r32__2__byteE1_ptr1__intE1__ret_dataE1_sbits64
	movl %eax, %r14d
	leal 8(%r13), %edx
	movq %rsi, %rcx
	callq IDEKA__ilink__lk_r32__2__byteE1_ptr1__intE1__ret_dataE1_sbits64
	movq %rax, %r15
	leal 20(%r13), %edx
	movq %rsi, %rcx
	callq IDEKA__ilink__lk_r32__2__byteE1_ptr1__intE1__ret_dataE1_sbits64
	cmpl %r14d, %ebx
	jl .LB13824
.LB13815:
	leal (%r14,%r15), %ecx
	cmpl %ecx, %ebx
	jl .LB13823
.LB13824:
	incl %r12d
	jmp .LB13782
.LB13784:
	movq %rsi, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB13823:
	subl %r14d, %ebx
	movslq %eax, %rax
	movslq %ebx, %rcx
	leaq (%rsi,%rax,1), %rax
	leaq (%rax,%rcx,1), %rax
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
	.globl IDEKA__ilink__pe_open_dll__2__PeLinkE1_ptr1__intE1__ret_boolE1
	.def IDEKA__ilink__pe_open_dll__2__PeLinkE1_ptr1__intE1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
IDEKA__ilink__pe_open_dll__2__PeLinkE1_ptr1__intE1__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $464, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
	movq %r14, -48(%rbp)
	movq %r15, -56(%rbp)
.LB13836:
	movq %rcx, -368(%rbp)
	movq %rdx, -320(%rbp)
	movq 272(%rcx), %rax
	movslq %edx, %rdx
	movq (%rax,%rdx,8), %rsi
	movq 280(%rcx), %rax
	movl (%rax,%rdx,4), %edi
	cmpl $64, %edi
	jl .LB13890
.LB13884:
	movq %rsi, %rcx
	xorl %edx, %edx
	callq IDEKA__ilink__lk_r16__2__byteE1_ptr1__intE1__ret_intE1
	cmpl $23117, %eax
	jne .LB13890
.LB13891:
	movq %rsi, %rcx
	movq $60, %rdx
	callq IDEKA__ilink__lk_r32__2__byteE1_ptr1__intE1__ret_dataE1_sbits64
	movl %eax, %ebx
	leal 24(%rbx), %r12d
	cmpl %edi, %r12d
	jg .LB13938
.LB13930:
	movq %rsi, %rcx
	movq %rbx, %rdx
	callq IDEKA__ilink__lk_r32__2__byteE1_ptr1__intE1__ret_dataE1_sbits64
	cmpq $17744, %rax
	jne .LB13938
.LB13939:
	leal 4(%rbx), %edx
	movq %rsi, %rcx
	callq IDEKA__ilink__lk_r16__2__byteE1_ptr1__intE1__ret_intE1
	cmpl $34404, %eax
	jne .LB13976
.LB13977:
	leal 6(%rbx), %edx
	movq %rsi, %rcx
	callq IDEKA__ilink__lk_r16__2__byteE1_ptr1__intE1__ret_intE1
	movl %eax, %edi
	leal 20(%rbx), %edx
	movq %rsi, %rcx
	callq IDEKA__ilink__lk_r16__2__byteE1_ptr1__intE1__ret_intE1
	movl %eax, %ebx
	movq %rsi, %rcx
	movq %r12, %rdx
	callq IDEKA__ilink__lk_r16__2__byteE1_ptr1__intE1__ret_intE1
	cmpl $523, %eax
	jne .LB14030
.LB14031:
	leal 112(%r12), %edx
	movq %rsi, %rcx
	callq IDEKA__ilink__lk_r32__2__byteE1_ptr1__intE1__ret_dataE1_sbits64
	movq %rax, -376(%rbp)
	leal 116(%r12), %edx
	movq %rsi, %rcx
	callq IDEKA__ilink__lk_r32__2__byteE1_ptr1__intE1__ret_dataE1_sbits64
	movq %rax, -200(%rbp)
	movq -376(%rbp), %rax
	testl %eax, %eax
	je .LB14080
.LB14081:
	addl %ebx, %r12d
	xorl %ebx, %ebx
	movl $4294967295, %r10d
	movq %r10, -208(%rbp)
	movq $0, -216(%rbp)
	movq $0, -224(%rbp)
.LB14088:
	cmpl %edi, %ebx
	jge .LB14090
.LB14089:
	imull $40, %ebx, %eax
	leal (%r12,%rax), %r13d
	leal 12(%r13), %edx
	movq %rsi, %rcx
	callq IDEKA__ilink__lk_r32__2__byteE1_ptr1__intE1__ret_dataE1_sbits64
	movl %eax, %r14d
	leal 8(%r13), %edx
	movq %rsi, %rcx
	callq IDEKA__ilink__lk_r32__2__byteE1_ptr1__intE1__ret_dataE1_sbits64
	movl %eax, %r15d
	leal 20(%r13), %edx
	movq %rsi, %rcx
	callq IDEKA__ilink__lk_r32__2__byteE1_ptr1__intE1__ret_dataE1_sbits64
	movq -376(%rbp), %rcx
	cmpl %r14d, %ecx
	jl .LB14130
.LB14121:
	leal (%r14,%r15), %ecx
	movq -376(%rbp), %rdx
	cmpl %ecx, %edx
	jl .LB14129
.LB14130:
	movq -208(%rbp), %rax
.LB14131:
	incl %ebx
	movq %rax, -208(%rbp)
	movq %r14, -216(%rbp)
	movq %r15, -224(%rbp)
	cmpl %edi, %ebx
	jl .LB14089
.LB14090:
	movq -208(%rbp), %rax
	testl %eax, %eax
	js .LB14141
.LB14142:
	movq -208(%rbp), %rax
	leal 12(%rax), %edx
	movq %rsi, %rcx
	callq IDEKA__ilink__lk_r32__2__byteE1_ptr1__intE1__ret_dataE1_sbits64
	movl %eax, %r9d
	movq %rsi, %rcx
	movq %r12, %rdx
	movq %rdi, %r8
	callq IDEKA__ilink__pe_rva_ptr__4__byteE1_ptr1__intE1__intE1__intE1__ret_byteE1_ptr1
	movq %rax, -304(%rbp)
	movq -208(%rbp), %rax
	leal 20(%rax), %edx
	movq %rsi, %rcx
	callq IDEKA__ilink__lk_r32__2__byteE1_ptr1__intE1__ret_dataE1_sbits64
	movq -208(%rbp), %rax
	leal 24(%rax), %edx
	movq %rsi, %rcx
	callq IDEKA__ilink__lk_r32__2__byteE1_ptr1__intE1__ret_dataE1_sbits64
	movq %rax, -232(%rbp)
	movq -208(%rbp), %rax
	leal 28(%rax), %edx
	movq %rsi, %rcx
	callq IDEKA__ilink__lk_r32__2__byteE1_ptr1__intE1__ret_dataE1_sbits64
	movq %rax, -240(%rbp)
	movq -208(%rbp), %rax
	leal 32(%rax), %edx
	movq %rsi, %rcx
	callq IDEKA__ilink__lk_r32__2__byteE1_ptr1__intE1__ret_dataE1_sbits64
	movq %rax, -248(%rbp)
	movq -208(%rbp), %rax
	leal 36(%rax), %edx
	movq %rsi, %rcx
	callq IDEKA__ilink__lk_r32__2__byteE1_ptr1__intE1__ret_dataE1_sbits64
	movq %rax, -256(%rbp)
	movq -376(%rbp), %rax
	movq -200(%rbp), %rcx
	addl %ecx, %eax
	movq %rax, -264(%rbp)
	movq $0, -272(%rbp)
	movq -216(%rbp), %r10
	movq %r10, -280(%rbp)
	movq -224(%rbp), %r10
	movq %r10, -288(%rbp)
	movq $0, -296(%rbp)
.LB14201:
	movq -272(%rbp), %rax
	movq -232(%rbp), %rcx
	cmpl %ecx, %eax
	jge .LB14203
.LB14202:
	movq %rsi, %rcx
	movq %r12, %rdx
	movq %rdi, %r8
	movq -248(%rbp), %r9
	callq IDEKA__ilink__pe_rva_ptr__4__byteE1_ptr1__intE1__intE1__intE1__ret_byteE1_ptr1
	movq %rax, %rcx
	movq -272(%rbp), %rax
	movl %eax, %edx
	shll $2, %edx
	callq IDEKA__ilink__lk_r32__2__byteE1_ptr1__intE1__ret_dataE1_sbits64
	movl %eax, %r9d
	movq %rsi, %rcx
	movq %r12, %rdx
	movq %rdi, %r8
	callq IDEKA__ilink__pe_rva_ptr__4__byteE1_ptr1__intE1__intE1__intE1__ret_byteE1_ptr1
	movq %rax, -384(%rbp)
	movq %rsi, %rcx
	movq %r12, %rdx
	movq %rdi, %r8
	movq -256(%rbp), %r9
	callq IDEKA__ilink__pe_rva_ptr__4__byteE1_ptr1__intE1__intE1__intE1__ret_byteE1_ptr1
	movq %rax, %rcx
	movq -272(%rbp), %rax
	movl %eax, %edx
	shll $1, %edx
	callq IDEKA__ilink__lk_r16__2__byteE1_ptr1__intE1__ret_intE1
	movq %rax, -312(%rbp)
	movq %rsi, %rcx
	movq %r12, %rdx
	movq %rdi, %r8
	movq -240(%rbp), %r9
	callq IDEKA__ilink__pe_rva_ptr__4__byteE1_ptr1__intE1__intE1__intE1__ret_byteE1_ptr1
	movq %rax, %rcx
	movq -312(%rbp), %rax
	movl %eax, %edx
	shll $2, %edx
	callq IDEKA__ilink__lk_r32__2__byteE1_ptr1__intE1__ret_dataE1_sbits64
	movl %eax, %ebx
	movq $0, -328(%rbp)
	movq $0, -336(%rbp)
	movq -280(%rbp), %r10
	movq %r10, -344(%rbp)
	movq -288(%rbp), %r10
	movq %r10, -352(%rbp)
	movq -296(%rbp), %r10
	movq %r10, -360(%rbp)
.LB14238:
	movq -336(%rbp), %rax
	cmpl %edi, %eax
	jge .LB14240
.LB14239:
	movq -336(%rbp), %rax
	imull $40, %eax, %eax
	leal (%r12,%rax), %r13d
	leal 12(%r13), %edx
	movq %rsi, %rcx
	callq IDEKA__ilink__lk_r32__2__byteE1_ptr1__intE1__ret_dataE1_sbits64
	movl %eax, %r14d
	leal 8(%r13), %edx
	movq %rsi, %rcx
	callq IDEKA__ilink__lk_r32__2__byteE1_ptr1__intE1__ret_dataE1_sbits64
	movl %eax, %r15d
	leal 36(%r13), %edx
	movq %rsi, %rcx
	callq IDEKA__ilink__lk_r32__2__byteE1_ptr1__intE1__ret_dataE1_sbits64
	cmpl %r14d, %ebx
	jl .LB14286
.LB14271:
	leal (%r14,%r15), %ecx
	cmpl %ecx, %ebx
	jge .LB14286
.LB14279:
	movl %eax, %ecx
	andl $536870912, %ecx
	testl %ecx, %ecx
	jne .LB14285
.LB14286:
	movq -328(%rbp), %rcx
.LB14287:
	movq -336(%rbp), %rdx
	incl %edx
	movq %rcx, -328(%rbp)
	movq %rdx, -336(%rbp)
	movq %r14, -344(%rbp)
	movq %r15, -352(%rbp)
	movq %rax, -360(%rbp)
	jmp .LB14238
.LB14203:
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
.LB14240:
	movq -376(%rbp), %rax
	cmpl %eax, %ebx
	jl .LB14302
.LB14293:
	movq -264(%rbp), %rax
	cmpl %eax, %ebx
	jl .LB14301
.LB14302:
	movq -328(%rbp), %rbx
.LB14303:
	movl $1835622239, -63(%rbp)
	movw $24432, -59(%rbp)
	movb $0, -57(%rbp)
	leaq -63(%rbp), %rcx
	movq -384(%rbp), %rdx
	callq IDEKA__ilink__lk_cat2__2__byteE1_ptr1__byteE1_ptr1__ret_byteE1_ptr1
	movq %rax, %rdx
	movq $0, 32(%rsp)
	movq -384(%rbp), %rax
	movq %rax, 40(%rsp)
	movq -304(%rbp), %rax
	movq %rax, 48(%rsp)
	movq -272(%rbp), %rax
	movq %rax, 56(%rsp)
	movq %rbx, 64(%rsp)
	movq -368(%rbp), %rcx
	movq -320(%rbp), %r8
	movq $1, %r9
	callq IDEKA__ilink__pe_add_ent__9__PeLinkE1_ptr1__byteE1_ptr1__intE1__intE1__intE1__byteE1_ptr1__byteE1_ptr1__intE1__intE1__ret_voidE1
	cmpl $1, %ebx
	je .LB14325
.LB14327:
	movq -272(%rbp), %rax
	incl %eax
	movq %rax, -272(%rbp)
	movq -344(%rbp), %r10
	movq %r10, -280(%rbp)
	movq -352(%rbp), %r10
	movq %r10, -288(%rbp)
	movq -360(%rbp), %r10
	movq %r10, -296(%rbp)
	jmp .LB14201
.LB14301:
	movl $1, %ebx
	jmp .LB14303
.LB14325:
	movq $0, 32(%rsp)
	movq -384(%rbp), %rax
	movq %rax, 40(%rsp)
	movq -304(%rbp), %rax
	movq %rax, 48(%rsp)
	movq -272(%rbp), %rax
	movq %rax, 56(%rsp)
	movq %rbx, 64(%rsp)
	movq -368(%rbp), %rcx
	movq -384(%rbp), %rdx
	movq -320(%rbp), %r8
	movq $1, %r9
	callq IDEKA__ilink__pe_add_ent__9__PeLinkE1_ptr1__byteE1_ptr1__intE1__intE1__intE1__byteE1_ptr1__byteE1_ptr1__intE1__intE1__ret_voidE1
	jmp .LB14327
.LB14285:
	movl $1, %ecx
	jmp .LB14287
.LB14141:
	movl $543449442, -80(%rbp)
	movl $1869641829, -76(%rbp)
	movl $1948284018, -72(%rbp)
	movl $1701601889, -68(%rbp)
	movb $0, -64(%rbp)
	leaq -80(%rbp), %rdx
	movq -368(%rbp), %rcx
	callq IDEKA__ilink__pe_fail__2__PeLinkE1_ptr1__byteE1_ptr1__ret_boolE1
	movzbl %al, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB14129:
	movq -376(%rbp), %rcx
	subl %r14d, %ecx
	addl %ecx, %eax
	jmp .LB14131
.LB14080:
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
.LB14030:
	movl $1919052140, -108(%rbp)
	movl $544830049, -104(%rbp)
	movl $1847620457, -100(%rbp)
	movl $1629516911, -96(%rbp)
	movl $860180512, -92(%rbp)
	movl $1713384242, -88(%rbp)
	movl $6646889, -84(%rbp)
	leaq -108(%rbp), %rdx
	movq -368(%rbp), %rcx
	callq IDEKA__ilink__pe_fail__2__PeLinkE1_ptr1__byteE1_ptr1__ret_boolE1
	movzbl %al, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB13976:
	movl $1919052140, -141(%rbp)
	movl $544830049, -137(%rbp)
	movl $1847620457, -133(%rbp)
	movl $1629516911, -129(%rbp)
	movl $947396718, -125(%rbp)
	movl $875965750, -121(%rbp)
	movl $541413408, -117(%rbp)
	movl $1701603686, -113(%rbp)
	movb $0, -109(%rbp)
	leaq -141(%rbp), %rdx
	movq -368(%rbp), %rcx
	callq IDEKA__ilink__pe_fail__2__PeLinkE1_ptr1__byteE1_ptr1__ret_boolE1
	movzbl %al, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB13938:
	movl $1919052140, -166(%rbp)
	movl $544830049, -162(%rbp)
	movl $1847620457, -158(%rbp)
	movl $1629516911, -154(%rbp)
	movl $541413408, -150(%rbp)
	movl $1701603686, -146(%rbp)
	movb $0, -142(%rbp)
	leaq -166(%rbp), %rdx
	movq -368(%rbp), %rcx
	callq IDEKA__ilink__pe_fail__2__PeLinkE1_ptr1__byteE1_ptr1__ret_boolE1
	movzbl %al, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB13890:
	movl $1919052140, -191(%rbp)
	movl $544830049, -187(%rbp)
	movl $1847620457, -183(%rbp)
	movl $1629516911, -179(%rbp)
	movl $541413408, -175(%rbp)
	movl $1701603686, -171(%rbp)
	movb $0, -167(%rbp)
	leaq -191(%rbp), %rdx
	movq -368(%rbp), %rcx
	callq IDEKA__ilink__pe_fail__2__PeLinkE1_ptr1__byteE1_ptr1__ret_boolE1
	movzbl %al, %eax
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
	.globl IDEKA__ilink__pe_ends_with__2__byteE1_ptr1__byteE1_ptr1__ret_boolE1
	.def IDEKA__ilink__pe_ends_with__2__byteE1_ptr1__byteE1_ptr1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
IDEKA__ilink__pe_ends_with__2__byteE1_ptr1__byteE1_ptr1__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
.LB14338:
	movq %rcx, %rsi
	movq %rdx, %rdi
	movq %rsi, %rcx
	callq IDEKA__ilink__lk_strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %ebx
	movq %rdi, %rcx
	callq IDEKA__ilink__lk_strlen__1__byteE1_ptr1__ret_intE1
	cmpl %ebx, %eax
	jg .LB14351
.LB14352:
	subl %eax, %ebx
	xorl %ecx, %ecx
.LB14354:
	cmpl %eax, %ecx
	jge .LB14356
.LB14355:
	leal (%rbx,%rcx), %edx
	movslq %edx, %rdx
	movzbl (%rsi,%rdx,1), %edx
	movslq %ecx, %r8
	movzbl (%rdi,%r8,1), %r8d
	cmpb %r8b, %dl
	jne .LB14373
.LB14374:
	incl %ecx
	cmpl %eax, %ecx
	jl .LB14355
.LB14356:
	movl $1, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB14373:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB14351:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
	.text
	.globl IDEKA__ilink__pe_dll_name__1__byteE1_ptr1__ret_byteE1_ptr1
	.def IDEKA__ilink__pe_dll_name__1__byteE1_ptr1__ret_byteE1_ptr1;
	.scl 2;
	.type 32;
	.endef
IDEKA__ilink__pe_dll_name__1__byteE1_ptr1__ret_byteE1_ptr1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB14378:
	movq %rcx, %rsi
	movq %rsi, %rcx
	callq IDEKA__ilink__lk_strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edi
	leal 2(%rdi), %eax
	movslq %eax, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	leal -4(%rdi), %ecx
	movslq %ecx, %rdx
	xorl %r8d, %r8d
.LB14390:
	cmpq %rdx, %r8
	jge .LB14392
.LB14391:
	movzbl (%rsi,%r8,1), %r9d
	movb %r9b, (%rax,%r8,1)
	incq %r8
	cmpq %rdx, %r8
	jl .LB14391
.LB14392:
	movslq %ecx, %rcx
	movb $46, (%rax,%rcx,1)
	leal -3(%rdi), %ecx
	movslq %ecx, %rcx
	movb $100, (%rax,%rcx,1)
	leal -2(%rdi), %ecx
	movslq %ecx, %rcx
	movb $108, (%rax,%rcx,1)
	leal -1(%rdi), %ecx
	movslq %ecx, %rcx
	movb $108, (%rax,%rcx,1)
	movslq %edi, %rcx
	movb $0, (%rax,%rcx,1)
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
	.text
	.globl IDEKA__ilink__pe_find_file__4__byteE1_ptr1__byteE1_ptr2__intE1__intE1_ptr1__ret_byteE1_ptr1
	.def IDEKA__ilink__pe_find_file__4__byteE1_ptr1__byteE1_ptr2__intE1__intE1_ptr1__ret_byteE1_ptr1;
	.scl 2;
	.type 32;
	.endef
IDEKA__ilink__pe_find_file__4__byteE1_ptr1__byteE1_ptr2__intE1__intE1_ptr1__ret_byteE1_ptr1:
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
.LB14431:
	movq %rcx, %rsi
	movq %rdx, %rdi
	movq %r8, -72(%rbp)
	movq %r9, %rbx
	movq %rsi, %rcx
	movq %rbx, %rdx
	callq IDEKA__ilink__lk_read_file__2__byteE1_ptr1__intE1_ptr1__ret_byteE1_ptr1
	xorl %r12d, %r12d
.LB14443:
	testq %rax, %rax
	jne .LB14445
.LB14452:
	movq -72(%rbp), %rcx
	cmpl %ecx, %r12d
	jge .LB14445
.LB14444:
	movslq %r12d, %rax
	movq (%rdi,%rax,8), %rcx
	movw $47, -58(%rbp)
	leaq -58(%rbp), %rdx
	callq IDEKA__ilink__lk_cat2__2__byteE1_ptr1__byteE1_ptr1__ret_byteE1_ptr1
	movq %rax, %r13
	movq %r13, %rcx
	movq %rsi, %rdx
	callq IDEKA__ilink__lk_cat2__2__byteE1_ptr1__byteE1_ptr1__ret_byteE1_ptr1
	movq %rax, %r14
	movq %r14, %rcx
	movq %rbx, %rdx
	callq IDEKA__ilink__lk_read_file__2__byteE1_ptr1__intE1_ptr1__ret_byteE1_ptr1
	movq %rax, %r15
	movq %r13, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__byteE1_ptr1__ret_voidE1
	movq %r14, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__byteE1_ptr1__ret_voidE1
	incl %r12d
	movq %r15, %rax
	jmp .LB14443
.LB14445:
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
	.globl IDEKA__ilink__pe_open_lib__4__PeLinkE1_ptr1__byteE1_ptr1__byteE1_ptr2__intE1__ret_boolE1
	.def IDEKA__ilink__pe_open_lib__4__PeLinkE1_ptr1__byteE1_ptr1__byteE1_ptr2__intE1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
IDEKA__ilink__pe_open_lib__4__PeLinkE1_ptr1__byteE1_ptr1__byteE1_ptr2__intE1__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $144, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
	movq %r14, -48(%rbp)
.LB14478:
	movq %rcx, %rsi
	movq %rdx, %rdi
	movq %r8, %rbx
	movl %r9d, %r12d
	movl $0, -52(%rbp)
	leaq -52(%rbp), %r9
	movq %rdi, %rcx
	movq %rbx, %rdx
	movq %r12, %r8
	callq IDEKA__ilink__pe_find_file__4__byteE1_ptr1__byteE1_ptr2__intE1__intE1_ptr1__ret_byteE1_ptr1
	movq %rax, %r13
	movl 264(%rsi), %r14d
	testq %r13, %r13
	jne .LB14514
.LB14501:
	movl $1651076142, -57(%rbp)
	movb $0, -53(%rbp)
	leaq -57(%rbp), %rdx
	movq %rdi, %rcx
	callq IDEKA__ilink__pe_ends_with__2__byteE1_ptr1__byteE1_ptr1__ret_boolE1
	testb %al, %al
	jne .LB14513
.LB14514:
.LB14515:
	testq %r13, %r13
	je .LB14571
.LB14572:
	movq 272(%rsi), %rax
	movslq %r14d, %rcx
	movq %r13, (%rax,%rcx,8)
	movl -52(%rbp), %eax
	movq 280(%rsi), %rdx
	movl %eax, (%rdx,%rcx,4)
	movl -52(%rbp), %eax
	cmpl $8, %eax
	jl .LB14627
.LB14594:
	movzbl (%r13), %ecx
	cmpl $33, %ecx
	jne .LB14627
.LB14602:
	movzbl 1(%r13), %ecx
	cmpl $60, %ecx
	jne .LB14627
.LB14610:
	movzbl 2(%r13), %ecx
	cmpl $97, %ecx
	jne .LB14627
.LB14618:
	movzbl 3(%r13), %ecx
	cmpl $114, %ecx
	je .LB14626
.LB14627:
	cmpl $2, %eax
	jl .LB14667
.LB14650:
	movzbl (%r13), %eax
	cmpl $77, %eax
	jne .LB14667
.LB14658:
	movzbl 1(%r13), %eax
	cmpl $90, %eax
	je .LB14666
.LB14667:
	movl $1701998197, -107(%rbp)
	movl $1852272483, -103(%rbp)
	movl $1684372073, -99(%rbp)
	movl $1651076128, -95(%rbp)
	movl $2037539186, -91(%rbp)
	movl $1919903264, -87(%rbp)
	movl $7627117, -83(%rbp)
	leaq -107(%rbp), %rdx
	movq %rsi, %rcx
	callq IDEKA__ilink__pe_fail__2__PeLinkE1_ptr1__byteE1_ptr1__ret_boolE1
	movzbl %al, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	leave
	ret
.LB14513:
	movq %rdi, %rcx
	callq IDEKA__ilink__pe_dll_name__1__byteE1_ptr1__ret_byteE1_ptr1
	movq %rax, %rcx
	leaq -52(%rbp), %r9
	movq %rbx, %rdx
	movq %r12, %r8
	callq IDEKA__ilink__pe_find_file__4__byteE1_ptr1__byteE1_ptr2__intE1__intE1_ptr1__ret_byteE1_ptr1
	movq %rax, %r13
	testq %r13, %r13
	jne .LB14545
.LB14528:
	movl $1953653621, -66(%rbp)
	movl $1651076142, -62(%rbp)
	movb $0, -58(%rbp)
	leaq -66(%rbp), %rdx
	movq %rdi, %rcx
	callq IDEKA__ilink__lk_streq__2__byteE1_ptr1__byteE1_ptr1__ret_boolE1
	testb %al, %al
	jne .LB14544
.LB14545:
.LB14546:
	jmp .LB14515
.LB14544:
	movl $1953653621, -79(%rbp)
	movl $1702060386, -75(%rbp)
	movl $1819042862, -71(%rbp)
	movb $0, -67(%rbp)
	leaq -79(%rbp), %rcx
	leaq -52(%rbp), %r9
	movq %rbx, %rdx
	movq %r12, %r8
	callq IDEKA__ilink__pe_find_file__4__byteE1_ptr1__byteE1_ptr2__intE1__intE1_ptr1__ret_byteE1_ptr1
	movq %rax, %r13
	jmp .LB14546
.LB14666:
	movq 288(%rsi), %rax
	movslq %r14d, %rcx
	movl $1, (%rax,%rcx,4)
	movl 264(%rsi), %eax
	incl %eax
	movl %eax, 264(%rsi)
	movq %rsi, %rcx
	movq %r14, %rdx
	callq IDEKA__ilink__pe_open_dll__2__PeLinkE1_ptr1__intE1__ret_boolE1
	movzbl %al, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	leave
	ret
.LB14626:
	movq 288(%rsi), %rax
	movslq %r14d, %rcx
	movl $0, (%rax,%rcx,4)
	movl 264(%rsi), %eax
	incl %eax
	movl %eax, 264(%rsi)
	movq %rsi, %rcx
	movq %r14, %rdx
	callq IDEKA__ilink__pe_open_archive__2__PeLinkE1_ptr1__intE1__ret_boolE1
	movzbl %al, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	leave
	ret
.LB14571:
	movl $1, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	leave
	ret
	.text
	.globl IDEKA__ilink__pe_member_is_import__3__PeLinkE1_ptr1__intE1__intE1__ret_boolE1
	.def IDEKA__ilink__pe_member_is_import__3__PeLinkE1_ptr1__intE1__intE1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
IDEKA__ilink__pe_member_is_import__3__PeLinkE1_ptr1__intE1__intE1__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB14721:
	movl %r8d, %esi
	movq 272(%rcx), %rax
	movslq %edx, %rcx
	movq (%rax,%rcx,8), %rdi
	leal 60(%rsi), %edx
	movq %rdi, %rcx
	callq IDEKA__ilink__lk_r16__2__byteE1_ptr1__intE1__ret_intE1
	testl %eax, %eax
	je .LB14738
.LB22427:
	xorl %eax, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB14738:
	leal 62(%rsi), %edx
	movq %rdi, %rcx
	callq IDEKA__ilink__lk_r16__2__byteE1_ptr1__intE1__ret_intE1
	cmpl $65535, %eax
	sete %al
	movzbl %al, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
	.text
	.globl IDEKA__ilink__pe_member_import__4__PeLinkE1_ptr1__intE1__intE1__PeImpE1_ptr1__ret_voidE1
	.def IDEKA__ilink__pe_member_import__4__PeLinkE1_ptr1__intE1__intE1__PeImpE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
IDEKA__ilink__pe_member_import__4__PeLinkE1_ptr1__intE1__intE1__PeImpE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $80, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
	movq %r14, -48(%rbp)
.LB14746:
	movq %r9, %rsi
	movq 272(%rcx), %rax
	movslq %edx, %rcx
	movq (%rax,%rcx,8), %rdi
	leal 60(%r8), %ebx
	leal 18(%rbx), %edx
	movq %rdi, %rcx
	callq IDEKA__ilink__lk_r16__2__byteE1_ptr1__intE1__ret_intE1
	movl %eax, %r12d
	movl %r12d, %eax
	sarl $2, %eax
	movl %eax, %r13d
	andl $7, %r13d
	movslq %ebx, %rax
	leaq 20(%rdi,%rax,1), %r14
	movq %r14, %rcx
	callq IDEKA__ilink__lk_strlen__1__byteE1_ptr1__ret_intE1
	movslq %eax, %rax
	leaq 1(%r14,%rax,1), %rax
	movq %rax, 8(%rsi)
	leal 16(%rbx), %edx
	movq %rdi, %rcx
	callq IDEKA__ilink__lk_r16__2__byteE1_ptr1__intE1__ret_intE1
	movl %eax, 16(%rsi)
	movl $0, 24(%rsi)
	andl $3, %r12d
	je .LB14802
.LB14804:
	movl $4294967295, 20(%rsi)
	testl %r13d, %r13d
	je .LB14812
.LB14813:
	cmpl $2, %r13d
	jl .LB14851
.LB14826:
	movzbl (%r14), %eax
	cmpl $63, %eax
	jne .LB14833
.LB22428:
	movl $1, %eax
.LB14842:
	testb %al, %al
	jne .LB14850
.LB14851:
	xorl %eax, %eax
.LB14852:
	movslq %eax, %rax
	leaq (%r14,%rax,1), %rax
	cmpl $3, %r13d
	je .LB14858
.LB14859:
	movq %rax, (%rsi)
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	leave
	ret
.LB14802:
	movl $1, 24(%rsi)
	jmp .LB14804
.LB14833:
	cmpl $64, %eax
	jne .LB14841
.LB22429:
	movl $1, %eax
	testb %al, %al
	jne .LB14850
	jmp .LB14851
.LB14841:
	movzbl (%r14), %eax
	cmpl $95, %eax
	sete %al
	movzbl %al, %eax
	testb %al, %al
	je .LB14851
.LB14850:
	movl $1, %eax
	jmp .LB14852
.LB14858:
	xorl %edi, %edi
.LB14861:
	movslq %edi, %rcx
	movzbl (%rax,%rcx,1), %ecx
	testl %ecx, %ecx
	je .LB14863
.LB14870:
	cmpl $64, %ecx
	je .LB14863
.LB14862:
	incl %edi
	jmp .LB14861
.LB14863:
	movslq %edi, %rcx
	movzbl (%rax,%rcx,1), %ecx
	cmpl $64, %ecx
	je .LB14887
.LB14888:
.LB14889:
	movq %rax, (%rsi)
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	leave
	ret
.LB14887:
	movq %rax, %rcx
	callq IDEKA__ilink__lk_dup__1__byteE1_ptr1__ret_byteE1_ptr1
	movslq %edi, %rcx
	movb $0, (%rax,%rcx,1)
	jmp .LB14889
.LB14812:
	leal 16(%rbx), %edx
	movq %rdi, %rcx
	callq IDEKA__ilink__lk_r16__2__byteE1_ptr1__intE1__ret_intE1
	movl %eax, 20(%rsi)
	movq %r14, (%rsi)
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	leave
	ret
	.text
	.globl IDEKA__ilink__pe_scan_obj__4__PeLinkE1_ptr1__byteE1_ptr1__intE1__PeUndE1_ptr1__ret_boolE1
	.def IDEKA__ilink__pe_scan_obj__4__PeLinkE1_ptr1__byteE1_ptr1__intE1__PeUndE1_ptr1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
IDEKA__ilink__pe_scan_obj__4__PeLinkE1_ptr1__byteE1_ptr1__intE1__PeUndE1_ptr1__ret_boolE1:
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
.LB14899:
	movq %rcx, -72(%rbp)
	movq %rdx, %rsi
	movl %r8d, %edi
	movq %r9, %rbx
	movq %rsi, %rcx
	movq $8, %rdx
	callq IDEKA__ilink__lk_r32__2__byteE1_ptr1__intE1__ret_dataE1_sbits64
	movq %rax, -96(%rbp)
	movq %rsi, %rcx
	movq $12, %rdx
	callq IDEKA__ilink__lk_r32__2__byteE1_ptr1__intE1__ret_dataE1_sbits64
	movq %rax, -88(%rbp)
	imull $18, %eax, %eax
	movq -96(%rbp), %rcx
	addl %ecx, %eax
	movq %rax, -80(%rbp)
	testl %ecx, %ecx
	je .LB14932
.LB14926:
	movq -80(%rbp), %rax
	cmpl %edi, %eax
	jg .LB14932
.LB14933:
	xorl %edi, %edi
	movq $0, -64(%rbp)
.LB14935:
	movq -88(%rbp), %rax
	cmpl %eax, %edi
	jge .LB14937
.LB14936:
	imull $18, %edi, %eax
	movq -96(%rbp), %rcx
	leal (%rcx,%rax), %r12d
	leal 17(%r12), %edx
	movq %rsi, %rcx
	callq IDEKA__ilink__lk_r8__2__byteE1_ptr1__intE1__ret_intE1
	movq %rax, -104(%rbp)
	leal 16(%r12), %edx
	movq %rsi, %rcx
	callq IDEKA__ilink__lk_r8__2__byteE1_ptr1__intE1__ret_intE1
	movl %eax, %r13d
	leal 12(%r12), %edx
	movq %rsi, %rcx
	callq IDEKA__ilink__lk_r16__2__byteE1_ptr1__intE1__ret_intE1
	movl %eax, %r14d
	leal 8(%r12), %edx
	movq %rsi, %rcx
	callq IDEKA__ilink__lk_r32__2__byteE1_ptr1__intE1__ret_dataE1_sbits64
	movq %rax, %r15
	cmpl $2, %r13d
	je .LB14968
.LB14963:
	cmpl $105, %r13d
	je .LB14968
.LB14969:
	movq -64(%rbp), %rax
.LB14970:
	incl %edi
	movq -104(%rbp), %rcx
	addl %ecx, %edi
	movq %rax, -64(%rbp)
	jmp .LB14935
.LB14937:
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
.LB14968:
	movq %rsi, %rcx
	movq %r12, %rdx
	movq -80(%rbp), %r8
	callq IDEKA__ilink__pe_name__3__byteE1_ptr1__intE1__intE1__ret_byteE1_ptr1
	movq %rax, %r12
	testl %r14d, %r14d
	jne .LB14983
.LB14977:
	testq %r15, %r15
	jne .LB14983
.LB14984:
	movl 8(%rbx), %eax
	movl 12(%rbx), %ecx
	cmpl %ecx, %eax
	jge .LB15004
.LB15006:
	movq (%rbx), %rax
	movl 8(%rbx), %ecx
	movslq %ecx, %rcx
	movq %r12, (%rax,%rcx,8)
	movl 8(%rbx), %eax
	incl %eax
	movl %eax, 8(%rbx)
.LB14985:
	movq %r12, %rax
	jmp .LB14970
.LB15004:
	shll $1, %ecx
	movl %ecx, 12(%rbx)
	movq (%rbx), %rax
	movl %ecx, %edx
	shll $3, %edx
	movq %rax, %rcx
	callq IDEKA__ilink__lk_grow__2__byteE1_ptr1__intE1__ret_byteE1_ptr1
	movq %rax, (%rbx)
	jmp .LB15006
.LB14983:
	cmpl $2, %r13d
	jne .LB14985
.LB14988:
	movq -72(%rbp), %rax
	leaq 384(%rax), %rcx
	movq %r12, %rdx
	movq $1, %r8
	callq IDEKA__ilink__lm_put__3__LkMapE1_ptr1__byteE1_ptr1__intE1__ret_boolE1
	jmp .LB14985
.LB14932:
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
	.globl IDEKA__ilink__pe_pull_members__1__PeLinkE1_ptr1__ret_boolE1
	.def IDEKA__ilink__pe_pull_members__1__PeLinkE1_ptr1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
IDEKA__ilink__pe_pull_members__1__PeLinkE1_ptr1__ret_boolE1:
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
.LB15051:
	movq %rcx, %rsi
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -72(%rbp)
	movq $2048, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -72(%rbp)
	movl $0, -64(%rbp)
	movl $256, -60(%rbp)
	xorl %edi, %edi
.LB15071:
	movl 8(%rsi), %eax
	cmpl %eax, %edi
	jge .LB15073
.LB15072:
	movq 16(%rsi), %rax
	movslq %edi, %rcx
	movq (%rax,%rcx,8), %rdx
	movq 24(%rsi), %rax
	movl (%rax,%rcx,4), %r8d
	leaq -72(%rbp), %r9
	movq %rsi, %rcx
	callq IDEKA__ilink__pe_scan_obj__4__PeLinkE1_ptr1__byteE1_ptr1__intE1__PeUndE1_ptr1__ret_boolE1
	incl %edi
	jmp .LB15071
.LB15073:
	xorl %eax, %eax
	movq $0, -136(%rbp)
	movq $0, -144(%rbp)
	xorl %edi, %edi
	movq $0, -152(%rbp)
	xorl %ebx, %ebx
	xorl %r12d, %r12d
	movq $0, -120(%rbp)
	movq $0, -128(%rbp)
.LB15099:
	movl -64(%rbp), %ecx
	cmpl %ecx, %eax
	jge .LB15101
.LB15100:
	movq -72(%rbp), %rcx
	movslq %eax, %rdx
	movq (%rcx,%rdx,8), %r13
	leal 1(%rax), %r14d
	leaq 384(%rsi), %rcx
	movq %r13, %rdx
	callq IDEKA__ilink__lm_get__2__LkMapE1_ptr1__byteE1_ptr1__ret_intE1
	testl %eax, %eax
	jns .LB15122
.LB15123:
	leaq 360(%rsi), %rcx
	movq %r13, %rdx
	callq IDEKA__ilink__lm_get__2__LkMapE1_ptr1__byteE1_ptr1__ret_intE1
	movl %eax, %r13d
	testl %r13d, %r13d
	js .LB15131
.LB15132:
	movq 312(%rsi), %rax
	movslq %r13d, %rcx
	movl (%rax,%rcx,4), %eax
	testl %eax, %eax
	jne .LB15142
.LB15143:
	movq 304(%rsi), %rax
	movl (%rax,%rcx,4), %edi
	movq 320(%rsi), %rax
	movl (%rax,%rcx,4), %r15d
	movq %rsi, %rcx
	movq %rdi, %rdx
	movq %r15, %r8
	callq IDEKA__ilink__pe_member_is_import__3__PeLinkE1_ptr1__intE1__intE1__ret_boolE1
	testb %al, %al
	jne .LB15164
.LB15165:
	xorl %ebx, %ebx
	movq $0, -160(%rbp)
.LB15167:
	movl 408(%rsi), %eax
	cmpl %eax, %ebx
	jge .LB15169
.LB15168:
	movq 416(%rsi), %rax
	movslq %ebx, %rcx
	movl (%rax,%rcx,4), %eax
	cmpl %edi, %eax
	jne .LB15198
.LB15185:
	movq 424(%rsi), %rax
	movl (%rax,%rcx,4), %eax
	cmpl %r15d, %eax
	je .LB15197
.LB15198:
	movq -160(%rbp), %rax
.LB15199:
	incl %ebx
	movq %rax, -160(%rbp)
	jmp .LB15167
.LB15101:
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
.LB15169:
	movq -160(%rbp), %rax
	testb %al, %al
	jne .LB15203
.LB15204:
	movq 416(%rsi), %rax
	movl 408(%rsi), %ecx
	movslq %ecx, %rcx
	movl %edi, (%rax,%rcx,4)
	movq 424(%rsi), %rax
	movl 408(%rsi), %ecx
	movslq %ecx, %rcx
	movl %r15d, (%rax,%rcx,4)
	movl 408(%rsi), %eax
	incl %eax
	movl %eax, 408(%rsi)
	movq 272(%rsi), %rax
	movslq %edi, %rcx
	movq (%rax,%rcx,8), %rcx
	movslq %r15d, %rax
	leaq 60(%rcx,%rax,1), %r12
	leal 48(%r15), %edx
	movq $10, %r8
	callq IDEKA__ilink__pe_dec__3__byteE1_ptr1__intE1__intE1__ret_intE1
	movl %eax, %edx
	movq %rdx, -168(%rbp)
	movq %r12, %rcx
	callq IDEKA__ilink__pe_is_coff__2__byteE1_ptr1__intE1__ret_boolE1
	testb %al, %al
	je .LB15261
.LB15262:
	movq %rsi, %rcx
	movq %r12, %rdx
	movq -168(%rbp), %r8
	callq IDEKA__ilink__pe_add_obj__3__PeLinkE1_ptr1__byteE1_ptr1__intE1__ret_intE1
	movq %rax, -176(%rbp)
	leaq -72(%rbp), %r9
	movq %rsi, %rcx
	movq %r12, %rdx
	movq -168(%rbp), %r8
	callq IDEKA__ilink__pe_scan_obj__4__PeLinkE1_ptr1__byteE1_ptr1__intE1__PeUndE1_ptr1__ret_boolE1
	movq %r14, %rax
	movq %r13, -136(%rbp)
	movq %rdi, -144(%rbp)
	movq %r15, %rdi
	movq %rbx, -152(%rbp)
	movq -160(%rbp), %rbx
	movq -168(%rbp), %r10
	movq %r10, -120(%rbp)
	movq -176(%rbp), %r10
	movq %r10, -128(%rbp)
	jmp .LB15099
.LB15261:
	movl $1751347809, -108(%rbp)
	movl $543520361, -104(%rbp)
	movl $1651336557, -100(%rbp)
	movl $1763734117, -96(%rbp)
	movl $1869488243, -92(%rbp)
	movl $543236212, -88(%rbp)
	movl $1179012931, -84(%rbp)
	movl $1784835872, -80(%rbp)
	movl $7627621, -76(%rbp)
	leaq -108(%rbp), %rdx
	movq %rsi, %rcx
	callq IDEKA__ilink__pe_fail__2__PeLinkE1_ptr1__byteE1_ptr1__ret_boolE1
	movzbl %al, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB15203:
	movq %r14, %rax
	movq %r13, -136(%rbp)
	movq %rdi, -144(%rbp)
	movq %r15, %rdi
	movq %rbx, -152(%rbp)
	movq -160(%rbp), %rbx
	jmp .LB15099
.LB15197:
	movl $1, %eax
	jmp .LB15199
.LB15164:
	movq %r14, %rax
	movq %r13, -136(%rbp)
	movq %rdi, -144(%rbp)
	movq %r15, %rdi
	jmp .LB15099
.LB15142:
	movq %r14, %rax
	movq %r13, -136(%rbp)
	jmp .LB15099
.LB15131:
	movq %r14, %rax
	movq %r13, -136(%rbp)
	jmp .LB15099
.LB15122:
	movq %r14, %rax
	jmp .LB15099
	.text
	.globl IDEKA__ilink__pe_group__2__byteE1_ptr1__dataE1_sbits64__ret_intE1
	.def IDEKA__ilink__pe_group__2__byteE1_ptr1__dataE1_sbits64__ret_intE1;
	.scl 2;
	.type 32;
	.endef
IDEKA__ilink__pe_group__2__byteE1_ptr1__dataE1_sbits64__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
.LB15315:
	movq %rdx, %rsi
	movq %rsi, %rax
	andq $512, %rax
	testq %rax, %rax
	jne .LB15339
.LB15323:
	movq %rsi, %rax
	andq $2048, %rax
	testq %rax, %rax
	jne .LB15339
.LB15331:
	movq %rsi, %rax
	andq $33554432, %rax
	testq %rax, %rax
	jne .LB15339
.LB15340:
	movl $1633972270, -15(%rbp)
	movw $24948, -11(%rbp)
	movb $0, -9(%rbp)
	leaq -15(%rbp), %rdx
	callq IDEKA__ilink__lk_streq__2__byteE1_ptr1__byteE1_ptr1__ret_boolE1
	testb %al, %al
	jne .LB15354
.LB15355:
	movq %rsi, %rax
	andq $536870912, %rax
	testq %rax, %rax
	jne .LB15370
.LB15362:
	movq %rsi, %rax
	andq $32, %rax
	testq %rax, %rax
	jne .LB15370
.LB15371:
	movq %rsi, %rax
	andq $128, %rax
	testq %rax, %rax
	jne .LB15378
.LB15379:
	movabsq $2147483648, %rax
	andq %rax, %rsi
	jne .LB15385
.LB15386:
	movl $1, %eax
	movq -8(%rbp), %rsi
	leave
	ret
.LB15385:
	movl $2, %eax
	movq -8(%rbp), %rsi
	leave
	ret
.LB15378:
	movl $3, %eax
	movq -8(%rbp), %rsi
	leave
	ret
.LB15370:
	xorl %eax, %eax
	movq -8(%rbp), %rsi
	leave
	ret
.LB15354:
	movl $4, %eax
	movq -8(%rbp), %rsi
	leave
	ret
.LB15339:
	movabsq $4294967295, %rax
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl IDEKA__ilink__pe_load_obj__2__PeLinkE1_ptr1__intE1__ret_boolE1
	.def IDEKA__ilink__pe_load_obj__2__PeLinkE1_ptr1__intE1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
IDEKA__ilink__pe_load_obj__2__PeLinkE1_ptr1__intE1__ret_boolE1:
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
.LB15388:
	movq %rcx, %rsi
	movl %edx, %edi
	movq 16(%rsi), %rax
	movslq %edi, %rcx
	movq (%rax,%rcx,8), %rbx
	movq 24(%rsi), %rax
	movl (%rax,%rcx,4), %eax
	movq %rax, -104(%rbp)
	movq %rbx, %rcx
	movq $2, %rdx
	callq IDEKA__ilink__lk_r16__2__byteE1_ptr1__intE1__ret_intE1
	movq %rax, -192(%rbp)
	movq %rbx, %rcx
	movq $8, %rdx
	callq IDEKA__ilink__lk_r32__2__byteE1_ptr1__intE1__ret_dataE1_sbits64
	movq %rax, -144(%rbp)
	movq %rbx, %rcx
	movq $12, %rdx
	callq IDEKA__ilink__lk_r32__2__byteE1_ptr1__intE1__ret_dataE1_sbits64
	movq %rax, -136(%rbp)
	movq %rbx, %rcx
	movq $16, %rdx
	callq IDEKA__ilink__lk_r16__2__byteE1_ptr1__intE1__ret_intE1
	movq -136(%rbp), %rcx
	imull $18, %ecx, %ecx
	movq -144(%rbp), %rdx
	addl %edx, %ecx
	addl $20, %eax
	movq %rax, -96(%rbp)
	xorl %eax, %eax
	testl %edx, %edx
	cmove %eax, %ecx
	movq %rcx, -152(%rbp)
	movq $0, -112(%rbp)
	movq $0, -120(%rbp)
	movq $0, -128(%rbp)
.LB15445:
	movq -112(%rbp), %rax
	movq -192(%rbp), %rcx
	cmpl %ecx, %eax
	jge .LB15447
.LB15446:
	movq -112(%rbp), %rax
	imull $40, %eax, %ecx
	movq -96(%rbp), %rdx
	leal (%rdx,%rcx), %r12d
	movq 48(%rsi), %rcx
	movslq %edi, %rdx
	movl (%rcx,%rdx,4), %ecx
	leal (%rcx,%rax), %r13d
	movq 96(%rsi), %rax
	movslq %r13d, %rcx
	movl %edi, (%rax,%rcx,4)
	movq %rbx, %rcx
	movq %r12, %rdx
	movq -152(%rbp), %r8
	callq IDEKA__ilink__pe_name__3__byteE1_ptr1__intE1__intE1__ret_byteE1_ptr1
	movzbl (%rax), %ecx
	cmpl $47, %ecx
	jne .LB15499
.LB15482:
	movzbl 1(%rax), %ecx
	cmpl $48, %ecx
	jb .LB15499
.LB15490:
	cmpl $57, %ecx
	jbe .LB15498
.LB15499:
	movq -120(%rbp), %r14
	movq -128(%rbp), %r10
	movq %r10, -176(%rbp)
	movq %rax, -184(%rbp)
.LB15500:
	movq 104(%rsi), %rax
	movslq %r13d, %r15
	movq -184(%rbp), %rcx
	movq %rcx, (%rax,%r15,8)
	leal 36(%r12), %edx
	movq %rbx, %rcx
	callq IDEKA__ilink__lk_r32__2__byteE1_ptr1__intE1__ret_dataE1_sbits64
	movq 112(%rsi), %rcx
	movq %rax, (%rcx,%r15,8)
	leal 16(%r12), %edx
	movq %rbx, %rcx
	callq IDEKA__ilink__lk_r32__2__byteE1_ptr1__intE1__ret_dataE1_sbits64
	movq 120(%rsi), %rcx
	movl %eax, (%rcx,%r15,4)
	leal 20(%r12), %edx
	movq %rbx, %rcx
	callq IDEKA__ilink__lk_r32__2__byteE1_ptr1__intE1__ret_dataE1_sbits64
	movq 128(%rsi), %rcx
	movl %eax, (%rcx,%r15,4)
	leal 24(%r12), %edx
	movq %rbx, %rcx
	callq IDEKA__ilink__lk_r32__2__byteE1_ptr1__intE1__ret_dataE1_sbits64
	movq 136(%rsi), %rcx
	movl %eax, (%rcx,%r15,4)
	leal 32(%r12), %edx
	movq %rbx, %rcx
	callq IDEKA__ilink__lk_r16__2__byteE1_ptr1__intE1__ret_intE1
	movq 144(%rsi), %rcx
	movl %eax, (%rcx,%r15,4)
	movq 112(%rsi), %rax
	movq (%rax,%r15,8), %rax
	sarq $20, %rax
	andq $15, %rax
	testl %eax, %eax
	je .LB15621
.LB15622:
	decl %eax
	movq $1, %rcx
	shlx %eax, %ecx, %ecx
	movq 152(%rsi), %rax
	movl %ecx, (%rax,%r15,4)
.LB15623:
	movq 112(%rsi), %rax
	movslq %r13d, %r12
	movq (%rax,%r12,8), %rdx
	movq -184(%rbp), %rcx
	callq IDEKA__ilink__pe_group__2__byteE1_ptr1__dataE1_sbits64__ret_intE1
	movq 160(%rsi), %rcx
	movl %eax, (%rcx,%r12,4)
	movq 168(%rsi), %rax
	movl $0, (%rax,%r12,4)
	movq 176(%rsi), %rax
	movq $0, (%rax,%r12,8)
	movq 160(%rsi), %rax
	movl (%rax,%r12,4), %eax
	testl %eax, %eax
	js .LB15739
.LB15685:
	cmpl $3, %eax
	je .LB15739
.LB15696:
	cmpl $5, %eax
	je .LB15739
.LB15707:
	movq 120(%rsi), %rax
	movl (%rax,%r12,4), %eax
	cmpl $0, %eax
	jle .LB15739
.LB15718:
	movq 128(%rsi), %rcx
	movl (%rcx,%r12,4), %ecx
	addl %eax, %ecx
	movq -104(%rbp), %rax
	cmpl %eax, %ecx
	jg .LB15738
.LB15739:
	movq -112(%rbp), %rax
	incl %eax
	movq %rax, -112(%rbp)
	movq %r14, -120(%rbp)
	movq -176(%rbp), %r10
	movq %r10, -128(%rbp)
	jmp .LB15445
.LB15447:
	movq $0, -168(%rbp)
.LB15773:
	movq -168(%rbp), %rax
	movq -136(%rbp), %rcx
	cmpl %ecx, %eax
	jge .LB15775
.LB15774:
	movq -168(%rbp), %rax
	imull $18, %eax, %ecx
	movq -144(%rbp), %rdx
	leal (%rdx,%rcx), %r12d
	movq 56(%rsi), %rcx
	movslq %edi, %rdx
	movl (%rcx,%rdx,4), %ecx
	leal (%rcx,%rax), %r13d
	leal 17(%r12), %edx
	movq %rbx, %rcx
	callq IDEKA__ilink__lk_r8__2__byteE1_ptr1__intE1__ret_intE1
	movl %eax, %r14d
	leal 16(%r12), %edx
	movq %rbx, %rcx
	callq IDEKA__ilink__lk_r8__2__byteE1_ptr1__intE1__ret_intE1
	movq %rax, -160(%rbp)
	movq 192(%rsi), %rax
	movslq %r13d, %r15
	movl %edi, (%rax,%r15,4)
	movq %rbx, %rcx
	movq %r12, %rdx
	movq -152(%rbp), %r8
	callq IDEKA__ilink__pe_name__3__byteE1_ptr1__intE1__intE1__ret_byteE1_ptr1
	movq 184(%rsi), %rcx
	movq %rax, (%rcx,%r15,8)
	leal 8(%r12), %edx
	movq %rbx, %rcx
	callq IDEKA__ilink__lk_r32__2__byteE1_ptr1__intE1__ret_dataE1_sbits64
	movq 200(%rsi), %rcx
	movq %rax, (%rcx,%r15,8)
	leal 12(%r12), %edx
	movq %rbx, %rcx
	callq IDEKA__ilink__lk_r16__2__byteE1_ptr1__intE1__ret_intE1
	movq 208(%rsi), %rcx
	movl %eax, (%rcx,%r15,4)
	movq 208(%rsi), %rax
	leaq (%rax,%r15,4), %rax
	movl (%rax), %ecx
	cmpl $65280, %ecx
	jge .LB15853
.LB15855:
	movq 216(%rsi), %rax
	movslq %r13d, %rcx
	movq -160(%rbp), %rdx
	movl %edx, (%rax,%rcx,4)
	movq 224(%rsi), %rax
	movl $4294967295, (%rax,%rcx,4)
	movq 232(%rsi), %rax
	movl $4294967295, (%rax,%rcx,4)
	movq 240(%rsi), %rax
	movl $0, (%rax,%rcx,4)
	movq 248(%rsi), %rax
	movq $0, (%rax,%rcx,8)
	movq 256(%rsi), %rax
	movl $4294967295, (%rax,%rcx,4)
	movq -160(%rbp), %rax
	cmpl $105, %eax
	jne .LB15934
.LB15927:
	cmpl $0, %r14d
	jg .LB15932
.LB15934:
	movl $1, %eax
.LB15956:
	cmpl %r14d, %eax
	jg .LB15958
.LB15957:
	movq 192(%rsi), %rcx
	leal (%r13,%rax), %edx
	movslq %edx, %rdx
	movl %edi, (%rcx,%rdx,4)
	movb $0, -57(%rbp)
	movq 184(%rsi), %rcx
	leaq -57(%rbp), %r8
	movq %r8, (%rcx,%rdx,8)
	movq 200(%rsi), %rcx
	movq $0, (%rcx,%rdx,8)
	movq 208(%rsi), %rcx
	movl $4294967294, (%rcx,%rdx,4)
	movq 216(%rsi), %rcx
	movl $4294967295, (%rcx,%rdx,4)
	movq 224(%rsi), %rcx
	movl $4294967295, (%rcx,%rdx,4)
	movq 232(%rsi), %rcx
	movl $4294967295, (%rcx,%rdx,4)
	movq 240(%rsi), %rcx
	movl $0, (%rcx,%rdx,4)
	movq 248(%rsi), %rcx
	movq $0, (%rcx,%rdx,8)
	movq 256(%rsi), %rcx
	movl $4294967295, (%rcx,%rdx,4)
	incl %eax
	cmpl %r14d, %eax
	jle .LB15957
	jmp .LB15958
.LB15775:
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
.LB15853:
	subl $65536, %ecx
	movl %ecx, (%rax)
	jmp .LB15855
.LB15932:
	movq 56(%rsi), %rax
	movslq %edi, %rcx
	movl (%rax,%rcx,4), %r15d
	leal 18(%r12), %edx
	movq %rbx, %rcx
	callq IDEKA__ilink__lk_r32__2__byteE1_ptr1__intE1__ret_dataE1_sbits64
	addl %eax, %r15d
	movq 256(%rsi), %rax
	movslq %r13d, %rcx
	movl %r15d, (%rax,%rcx,4)
	jmp .LB15934
.LB15958:
	movq -168(%rbp), %rax
	incl %eax
	addl %r14d, %eax
	movq %rax, -168(%rbp)
	jmp .LB15773
.LB15498:
	xorl %r14d, %r14d
	movl $1, %ecx
.LB15501:
	movslq %ecx, %rdx
	movzbl (%rax,%rdx,1), %edx
	cmpl $48, %edx
	jb .LB15503
.LB15510:
	cmpl $57, %edx
	ja .LB15503
.LB15502:
	imull $10, %r14d, %r14d
	subl $48, %edx
	addl %edx, %r14d
	incl %ecx
	jmp .LB15501
.LB15503:
	movq -152(%rbp), %rax
	movslq %eax, %rax
	movslq %r14d, %rdx
	leaq (%rbx,%rax,1), %rax
	leaq (%rax,%rdx,1), %rax
	movq %rcx, -176(%rbp)
	movq %rax, -184(%rbp)
	jmp .LB15500
.LB15621:
	movq 152(%rsi), %rax
	movslq %r13d, %rcx
	movl $16, (%rax,%rcx,4)
	jmp .LB15623
.LB15738:
	movl $1952671091, -82(%rbp)
	movl $544108393, -78(%rbp)
	movl $1937012079, -74(%rbp)
	movl $543515753, -70(%rbp)
	movl $543516788, -66(%rbp)
	movl $1701603686, -62(%rbp)
	movb $0, -58(%rbp)
	leaq -82(%rbp), %rdx
	movq %rsi, %rcx
	callq IDEKA__ilink__pe_fail__2__PeLinkE1_ptr1__byteE1_ptr1__ret_boolE1
	movzbl %al, %eax
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
	.globl IDEKA__ilink__pe_resolve__1__PeLinkE1_ptr1__ret_boolE1
	.def IDEKA__ilink__pe_resolve__1__PeLinkE1_ptr1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
IDEKA__ilink__pe_resolve__1__PeLinkE1_ptr1__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $96, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
.LB16079:
	movq %rcx, %rsi
	leaq 384(%rsi), %rcx
	movl 92(%rsi), %edx
	callq IDEKA__ilink__lm_init__2__LkMapE1_ptr1__intE1__ret_voidE1
	xorl %edi, %edi
.LB16091:
	movl 92(%rsi), %eax
	cmpl %eax, %edi
	jge .LB16093
.LB16092:
	movq 216(%rsi), %rax
	movslq %edi, %rcx
	movl (%rax,%rcx,4), %eax
	movq 208(%rsi), %rdx
	movl (%rdx,%rcx,4), %edx
	cmpl $2, %eax
	jne .LB16149
.LB16116:
	testl %edx, %edx
	je .LB16120
.LB22430:
	movl $1, %eax
.LB16121:
	testb %al, %al
	je .LB16149
.LB16133:
	movq 184(%rsi), %rax
	movslq %edi, %rcx
	movq (%rax,%rcx,8), %rax
	movzbl (%rax), %eax
	testl %eax, %eax
	jne .LB16147
.LB16149:
	incl %edi
	jmp .LB16091
.LB16093:
	xorl %edi, %edi
	xorl %ebx, %ebx
.LB16205:
	movl 92(%rsi), %eax
	cmpl %eax, %edi
	jge .LB16207
.LB16206:
	movq 216(%rsi), %rax
	movslq %edi, %rcx
	movl (%rax,%rcx,4), %eax
	cmpl $2, %eax
	jne .LB16246
.LB16222:
	movq 208(%rsi), %rax
	movl (%rax,%rcx,4), %eax
	testl %eax, %eax
	jne .LB16246
.LB16233:
	movq 200(%rsi), %rax
	movq (%rax,%rcx,8), %rax
	testq %rax, %rax
	jne .LB16245
.LB16246:
.LB16247:
	incl %edi
	jmp .LB16205
.LB16207:
	xorl %edi, %edi
.LB16319:
	movl 92(%rsi), %eax
	cmpl %eax, %edi
	jge .LB16321
.LB16320:
	movq 216(%rsi), %rax
	movslq %edi, %rcx
	movl (%rax,%rcx,4), %eax
	cmpl $3, %eax
	je .LB16342
.LB16337:
	cmpl $6, %eax
	je .LB16342
.LB16343:
	cmpl $2, %eax
	je .LB16367
.LB16344:
	incl %edi
	jmp .LB16319
.LB16321:
	xorl %edi, %edi
.LB16389:
	movl 92(%rsi), %eax
	cmpl %eax, %edi
	jge .LB16391
.LB16390:
	movq 216(%rsi), %rax
	movslq %edi, %rcx
	movl (%rax,%rcx,4), %eax
	cmpl $105, %eax
	je .LB16406
.LB16407:
.LB16408:
	incl %edi
	jmp .LB16389
.LB16391:
	movl $1, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB16406:
	leaq 384(%rsi), %rcx
	movq 184(%rsi), %rax
	movslq %edi, %rbx
	movq (%rax,%rbx,8), %rdx
	callq IDEKA__ilink__lm_get__2__LkMapE1_ptr1__byteE1_ptr1__ret_intE1
	testl %eax, %eax
	jns .LB16421
.LB16422:
	movq 256(%rsi), %rcx
	movl (%rcx,%rbx,4), %ecx
	testl %ecx, %ecx
	jns .LB16441
.LB16423:
	movq %rax, %rbx
	jmp .LB16408
.LB16441:
	movq 224(%rsi), %rdx
	movslq %ecx, %rcx
	movl (%rdx,%rcx,4), %ecx
	movslq %edi, %r8
	movl %ecx, (%rdx,%r8,4)
	jmp .LB16423
.LB16421:
	movq 224(%rsi), %rcx
	movslq %edi, %rdx
	movl %eax, (%rcx,%rdx,4)
	jmp .LB16423
.LB16367:
	leaq 384(%rsi), %rcx
	movq 184(%rsi), %rax
	movslq %edi, %r12
	movq (%rax,%r12,8), %rdx
	callq IDEKA__ilink__lm_get__2__LkMapE1_ptr1__byteE1_ptr1__ret_intE1
	movq 224(%rsi), %rcx
	movl %eax, (%rcx,%r12,4)
	jmp .LB16344
.LB16342:
	movq 208(%rsi), %rax
	movslq %edi, %rcx
	movl (%rax,%rcx,4), %eax
	testl %eax, %eax
	je .LB16344
.LB16353:
	movq 224(%rsi), %rax
	movslq %edi, %rcx
	movl %edi, (%rax,%rcx,4)
	jmp .LB16344
.LB16245:
	leaq 384(%rsi), %rbx
	movq 184(%rsi), %rax
	movslq %edi, %rcx
	movq (%rax,%rcx,8), %rdx
	movq %rbx, %rcx
	callq IDEKA__ilink__lm_get__2__LkMapE1_ptr1__byteE1_ptr1__ret_intE1
	movl %eax, %r12d
	testl %r12d, %r12d
	js .LB16260
.LB16261:
	movq 208(%rsi), %rax
	movslq %r12d, %rcx
	movl (%rax,%rcx,4), %eax
	testl %eax, %eax
	jne .LB16262
.LB16282:
	movq 200(%rsi), %rax
	movslq %edi, %rcx
	movq (%rax,%rcx,8), %rcx
	movslq %r12d, %rdx
	movq (%rax,%rdx,8), %rax
	cmpq %rax, %rcx
	jg .LB16300
.LB16262:
	movq %r12, %rbx
	jmp .LB16247
.LB16300:
	movq 200(%rsi), %rax
	movslq %edi, %rcx
	movq (%rax,%rcx,8), %rcx
	movslq %r12d, %rdx
	movq %rcx, (%rax,%rdx,8)
	jmp .LB16262
.LB16260:
	movq 184(%rsi), %rax
	movslq %edi, %rcx
	movq (%rax,%rcx,8), %rdx
	movq %rbx, %rcx
	movq %rdi, %r8
	callq IDEKA__ilink__lm_put__3__LkMapE1_ptr1__byteE1_ptr1__intE1__ret_boolE1
	jmp .LB16262
.LB16120:
	movq 200(%rsi), %rax
	movq (%rax,%rcx,8), %rax
	testq %rax, %rax
	setne %al
	movzbl %al, %eax
	testb %al, %al
	jne .LB16133
	jmp .LB16149
.LB16147:
	testl %edx, %edx
	je .LB16149
.LB16152:
	leaq 384(%rsi), %rcx
	movq 184(%rsi), %rax
	movslq %edi, %rdx
	movq (%rax,%rdx,8), %rdx
	movq %rdi, %r8
	callq IDEKA__ilink__lm_put__3__LkMapE1_ptr1__byteE1_ptr1__intE1__ret_boolE1
	testb %al, %al
	jne .LB16149
.LB16167:
	movl $1819309412, -60(%rbp)
	movl $1952539497, -56(%rbp)
	movl $2037588069, -52(%rbp)
	movl $1819239021, -48(%rbp)
	movl $1717920800, -44(%rbp)
	movl $1953066601, -40(%rbp)
	movl $7237481, -36(%rbp)
	leaq -60(%rbp), %rdx
	movq %rsi, %rcx
	callq IDEKA__ilink__pe_fail__2__PeLinkE1_ptr1__byteE1_ptr1__ret_boolE1
	movzbl %al, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
	.text
	.globl IDEKA__ilink__pe_import_for__2__PeLinkE1_ptr1__byteE1_ptr1__ret_intE1
	.def IDEKA__ilink__pe_import_for__2__PeLinkE1_ptr1__byteE1_ptr1__ret_intE1;
	.scl 2;
	.type 32;
	.endef
IDEKA__ilink__pe_import_for__2__PeLinkE1_ptr1__byteE1_ptr1__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $96, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
.LB16466:
	movq %rcx, %rsi
	leaq 360(%rsi), %rcx
	callq IDEKA__ilink__lm_get__2__LkMapE1_ptr1__byteE1_ptr1__ret_intE1
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -56(%rbp)
	movq .LZERO+16(%rip), %r10
	movq %r10, -40(%rbp)
	movl .LZERO+24(%rip), %r10d
	movl %r10d, -32(%rbp)
	testl %eax, %eax
	js .LB16481
.LB16482:
	movq 312(%rsi), %rcx
	movslq %eax, %rdx
	movl (%rcx,%rdx,4), %ecx
	testl %ecx, %ecx
	je .LB16493
.LB16494:
	movq 328(%rsi), %rax
	movq (%rax,%rdx,8), %rax
	movq %rax, -56(%rbp)
	movq 336(%rsi), %rax
	movq (%rax,%rdx,8), %rax
	movq %rax, -48(%rbp)
	movq 344(%rsi), %rax
	movl (%rax,%rdx,4), %eax
	movl %eax, -40(%rbp)
	movl $4294967295, -36(%rbp)
	movq 352(%rsi), %rax
	movl (%rax,%rdx,4), %eax
	movl %eax, -32(%rbp)
.LB16495:
	movq -48(%rbp), %rcx
	movw $33, -58(%rbp)
	leaq -58(%rbp), %rdx
	callq IDEKA__ilink__lk_cat2__2__byteE1_ptr1__byteE1_ptr1__ret_byteE1_ptr1
	movq %rax, %rcx
	movq -56(%rbp), %rdx
	callq IDEKA__ilink__lk_cat2__2__byteE1_ptr1__byteE1_ptr1__ret_byteE1_ptr1
	movq %rax, %rdi
	leaq 520(%rsi), %rcx
	movq %rdi, %rdx
	callq IDEKA__ilink__lm_get__2__LkMapE1_ptr1__byteE1_ptr1__ret_intE1
	testl %eax, %eax
	jns .LB16589
.LB16590:
	movl 432(%rsi), %ebx
	movq -56(%rbp), %rax
	movq 440(%rsi), %rcx
	movslq %ebx, %rdx
	movq %rax, (%rcx,%rdx,8)
	movq -48(%rbp), %rax
	movq 448(%rsi), %rcx
	movq %rax, (%rcx,%rdx,8)
	movl -40(%rbp), %eax
	movq 456(%rsi), %rcx
	movl %eax, (%rcx,%rdx,4)
	movl -36(%rbp), %eax
	movq 464(%rsi), %rcx
	movl %eax, (%rcx,%rdx,4)
	movl -32(%rbp), %eax
	movq 472(%rsi), %rcx
	movl %eax, (%rcx,%rdx,4)
	movq 480(%rsi), %rax
	movl $0, (%rax,%rdx,4)
	movq 504(%rsi), %rax
	movq $0, (%rax,%rdx,8)
	movq 512(%rsi), %rax
	movq $0, (%rax,%rdx,8)
	leaq 520(%rsi), %rcx
	movq %rdi, %rdx
	movq %rbx, %r8
	callq IDEKA__ilink__lm_put__3__LkMapE1_ptr1__byteE1_ptr1__intE1__ret_boolE1
	movl 432(%rsi), %eax
	incl %eax
	movl %eax, 432(%rsi)
	movl %ebx, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB16493:
	movq 304(%rsi), %rcx
	movslq %eax, %rdi
	movl (%rcx,%rdi,4), %edx
	movq 320(%rsi), %rax
	movl (%rax,%rdi,4), %r8d
	movq %rsi, %rcx
	callq IDEKA__ilink__pe_member_is_import__3__PeLinkE1_ptr1__intE1__intE1__ret_boolE1
	testb %al, %al
	je .LB16514
.LB16515:
	movq 304(%rsi), %rax
	movl (%rax,%rdi,4), %edx
	movq 320(%rsi), %rax
	movl (%rax,%rdi,4), %r8d
	leaq -56(%rbp), %r9
	movq %rsi, %rcx
	callq IDEKA__ilink__pe_member_import__4__PeLinkE1_ptr1__intE1__intE1__PeImpE1_ptr1__ret_voidE1
	jmp .LB16495
.LB16589:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB16514:
	movabsq $4294967295, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB16481:
	movabsq $4294967295, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
	.text
	.globl IDEKA__ilink__pe_use_symbol__2__PeLinkE1_ptr1__intE1__ret_boolE1
	.def IDEKA__ilink__pe_use_symbol__2__PeLinkE1_ptr1__intE1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
IDEKA__ilink__pe_use_symbol__2__PeLinkE1_ptr1__intE1__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $176, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
.LB16696:
	movq %rcx, %rsi
	movl %edx, %edi
	movq 224(%rsi), %rax
	movslq %edi, %rcx
	movl (%rax,%rcx,4), %eax
	testl %eax, %eax
	jns .LB16721
.LB16709:
	movq 232(%rsi), %rax
	movl (%rax,%rcx,4), %eax
	cmpl $4294967295, %eax
	jne .LB16721
.LB16722:
	movq 184(%rsi), %rax
	movq (%rax,%rcx,8), %rbx
	movl $1833525087, -36(%rbp)
	movl $1113941857, -32(%rbp)
	movl $6648673, -28(%rbp)
	leaq -36(%rbp), %rdx
	movq %rbx, %rcx
	callq IDEKA__ilink__lk_streq__2__byteE1_ptr1__byteE1_ptr1__ret_boolE1
	testb %al, %al
	jne .LB16747
.LB16748:
	movl $1835622239, -43(%rbp)
	movw $24432, -39(%rbp)
	movb $0, -37(%rbp)
	leaq -43(%rbp), %rdx
	movq %rbx, %rcx
	callq IDEKA__ilink__pe_has_prefix__2__byteE1_ptr1__byteE1_ptr1__ret_boolE1
	testb %al, %al
	jne .LB16770
.LB16771:
	movq %rsi, %rcx
	movq %rbx, %rdx
	callq IDEKA__ilink__pe_import_for__2__PeLinkE1_ptr1__byteE1_ptr1__ret_intE1
	testl %eax, %eax
	jns .LB16805
.LB16772:
	movl 264(%rsi), %eax
	testl %eax, %eax
	je .LB16853
.LB16854:
	movl $1701080693, -62(%rbp)
	movl $1701734758, -58(%rbp)
	movl $2037588068, -54(%rbp)
	movl $1819239021, -50(%rbp)
	movw $8250, -46(%rbp)
	movb $0, -44(%rbp)
	leaq -62(%rbp), %rcx
	movq %rbx, %rdx
	callq IDEKA__ilink__lk_cat2__2__byteE1_ptr1__byteE1_ptr1__ret_byteE1_ptr1
	movq %rax, %rdx
	movq %rsi, %rcx
	callq IDEKA__ilink__pe_fail__2__PeLinkE1_ptr1__byteE1_ptr1__ret_boolE1
	movzbl %al, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB16805:
	movq 472(%rsi), %rcx
	movslq %eax, %rdx
	movl (%rcx,%rdx,4), %ecx
	testl %ecx, %ecx
	je .LB16816
.LB16817:
	movq 232(%rsi), %rcx
	movslq %edi, %rdx
	movl %eax, (%rcx,%rdx,4)
	movq 240(%rsi), %rcx
	movl $2, (%rcx,%rdx,4)
	movq 480(%rsi), %rcx
	movslq %eax, %rax
	movl $1, (%rcx,%rax,4)
	movl $1, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB16816:
	movq %rsi, %rcx
	movq %rbx, %rdx
	callq IDEKA__ilink__pe_fail__2__PeLinkE1_ptr1__byteE1_ptr1__ret_boolE1
	movzbl %al, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB16770:
	movq %rsi, %rcx
	movq %rbx, %rdx
	callq IDEKA__ilink__pe_import_for__2__PeLinkE1_ptr1__byteE1_ptr1__ret_intE1
	testl %eax, %eax
	jns .LB16779
	jmp .LB16772
.LB16853:
	movl $1701080693, -138(%rbp)
	movl $1701734758, -134(%rbp)
	movl $2037588068, -130(%rbp)
	movl $1819239021, -126(%rbp)
	movl $1869490208, -122(%rbp)
	movl $1651076128, -118(%rbp)
	movl $1769103730, -114(%rbp)
	movl $1663071077, -110(%rbp)
	movl $1684829551, -106(%rbp)
	movl $543515168, -102(%rbp)
	movl $1852141679, -98(%rbp)
	movl $539780197, -94(%rbp)
	movl $1667590243, -90(%rbp)
	movl $1229725803, -86(%rbp)
	movl $1851859010, -82(%rbp)
	movl $2035490916, -78(%rbp)
	movl $1835365491, -74(%rbp)
	movl $1953460050, -70(%rbp)
	movl $2112041, -66(%rbp)
	leaq -138(%rbp), %rcx
	movq %rbx, %rdx
	callq IDEKA__ilink__lk_cat2__2__byteE1_ptr1__byteE1_ptr1__ret_byteE1_ptr1
	movq %rax, %rdx
	movq %rsi, %rcx
	callq IDEKA__ilink__pe_fail__2__PeLinkE1_ptr1__byteE1_ptr1__ret_boolE1
	movzbl %al, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB16779:
	movq 232(%rsi), %rcx
	movslq %edi, %rdx
	movl %eax, (%rcx,%rdx,4)
	movq 240(%rsi), %rax
	movl $1, (%rax,%rdx,4)
	movl $1, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB16747:
	movq 232(%rsi), %rax
	movslq %edi, %rcx
	movl $4294967293, (%rax,%rcx,4)
	movl $1, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB16721:
	movl $1, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
	.text
	.globl IDEKA__ilink__pe_scan_relocs__1__PeLinkE1_ptr1__ret_boolE1
	.def IDEKA__ilink__pe_scan_relocs__1__PeLinkE1_ptr1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
IDEKA__ilink__pe_scan_relocs__1__PeLinkE1_ptr1__ret_boolE1:
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
.LB16965:
	movq %rcx, %rsi
	xorl %edi, %edi
	xorl %eax, %eax
	xorl %ecx, %ecx
	xorl %edx, %edx
	xorl %r8d, %r8d
	xorl %r9d, %r9d
.LB16975:
	movl 8(%rsi), %ebx
	cmpl %ebx, %edi
	jge .LB16977
.LB16976:
	movq 16(%rsi), %rbx
	movslq %edi, %r12
	movq (%rbx,%r12,8), %rbx
	movq %rbx, -72(%rbp)
	movq $0, -64(%rbp)
.LB16991:
	movq 32(%rsi), %rbx
	movslq %edi, %r12
	movl (%rbx,%r12,4), %ebx
	movq -64(%rbp), %r12
	cmpl %ebx, %r12d
	jge .LB16993
.LB16992:
	movq 48(%rsi), %rcx
	movslq %edi, %rbx
	movl (%rcx,%rbx,4), %ecx
	movq -64(%rbp), %rbx
	addl %ecx, %ebx
	movq 160(%rsi), %rcx
	movslq %ebx, %r12
	movl (%rcx,%r12,4), %ecx
	testl %ecx, %ecx
	jns .LB17020
.LB17021:
.LB17022:
	movq -64(%rbp), %rcx
	incl %ecx
	movq %rcx, -64(%rbp)
	movq %rbx, %rcx
	jmp .LB16991
.LB16977:
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
.LB16993:
	incl %edi
	jmp .LB16975
.LB17020:
	movq 144(%rsi), %rax
	movslq %ebx, %rcx
	movl (%rax,%rcx,4), %r12d
	xorl %r13d, %r13d
.LB17030:
	cmpl %r12d, %r13d
	jge .LB17032
.LB17031:
	movq 136(%rsi), %rax
	movslq %ebx, %rcx
	movl (%rax,%rcx,4), %eax
	imull $10, %r13d, %ecx
	leal (%rax,%rcx), %r14d
	movq 56(%rsi), %rax
	movslq %edi, %rcx
	movl (%rax,%rcx,4), %r15d
	leal 4(%r14), %edx
	movq -72(%rbp), %rcx
	callq IDEKA__ilink__lk_r32__2__byteE1_ptr1__intE1__ret_dataE1_sbits64
	addl %eax, %r15d
	movq %rsi, %rcx
	movq %r15, %rdx
	callq IDEKA__ilink__pe_use_symbol__2__PeLinkE1_ptr1__intE1__ret_boolE1
	testb %al, %al
	je .LB17064
.LB17065:
	incl %r13d
	movq %r14, %rdx
	movq %r15, %r8
	cmpl %r12d, %r13d
	jl .LB17031
.LB17032:
	movq %r13, %rax
	movq %r12, %r9
	jmp .LB17022
.LB17064:
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
	.globl IDEKA__ilink__pe_add_br__2__PeLinkE1_ptr1__intE1__ret_voidE1
	.def IDEKA__ilink__pe_add_br__2__PeLinkE1_ptr1__intE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
IDEKA__ilink__pe_add_br__2__PeLinkE1_ptr1__intE1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $48, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB17073:
	movq %rcx, %rsi
	movl %edx, %edi
	movl 544(%rsi), %eax
	movl 548(%rsi), %ecx
	cmpl %ecx, %eax
	jge .LB17085
.LB17087:
	movq 552(%rsi), %rax
	movl 544(%rsi), %ecx
	movslq %ecx, %rcx
	movl %edi, (%rax,%rcx,4)
	movl 544(%rsi), %eax
	incl %eax
	movl %eax, 544(%rsi)
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB17085:
	shll $1, %ecx
	movl %ecx, 548(%rsi)
	movq 552(%rsi), %rax
	movl %ecx, %edx
	shll $2, %edx
	movq %rax, %rcx
	callq IDEKA__ilink__lk_grow__2__byteE1_ptr1__intE1__ret_byteE1_ptr1
	movq %rax, 552(%rsi)
	jmp .LB17087
	.text
	.globl IDEKA__ilink__pe_sort__2__intE1_ptr1__intE1__ret_voidE1
	.def IDEKA__ilink__pe_sort__2__intE1_ptr1__intE1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
IDEKA__ilink__pe_sort__2__intE1_ptr1__intE1__ret_voidE1:
	subq $32, %rsp
	movq %rbx, 16(%rsp)
	movq %rsi, 8(%rsp)
	movq %rdi, 0(%rsp)
.LB17128:
	movl %edx, %eax
	sarl $31, %eax
	movl %edx, %eax
	shrl $31, %eax
	addl %edx, %eax
	sarl $1, %eax
	xorl %esi, %esi
	xorl %edi, %edi
.LB17137:
	cmpl $0, %eax
	jle .LB17139
.LB17138:
	movq %rdi, %r8
	movq %rsi, %rdi
	movq %rax, %rsi
.LB17143:
	cmpl %edx, %esi
	jge .LB17145
.LB17144:
	movslq %esi, %rdi
	movl (%rcx,%rdi,4), %r8d
	movq %rsi, %rdi
.LB17154:
	cmpl %eax, %edi
	jl .LB17156
.LB17160:
	movl %edi, %r9d
	subl %eax, %r9d
	movslq %r9d, %r9
	movl (%rcx,%r9,4), %r9d
	cmpl %r8d, %r9d
	jle .LB17156
.LB17155:
	movl %edi, %r9d
	subl %eax, %r9d
	movslq %r9d, %rbx
	movl (%rcx,%rbx,4), %ebx
	movslq %edi, %rdi
	movl %ebx, (%rcx,%rdi,4)
	movq %r9, %rdi
	cmpl %eax, %edi
	jge .LB17160
	jmp .LB17156
.LB17139:
	movq 16(%rsp), %rbx
	movq 8(%rsp), %rsi
	movq 0(%rsp), %rdi
	addq $32, %rsp
	ret
.LB17145:
	movl %eax, %esi
	sarl $31, %esi
	movl %eax, %esi
	shrl $31, %esi
	addl %esi, %eax
	sarl $1, %eax
	movq %rdi, %rsi
	movq %r8, %rdi
	cmpl $0, %eax
	jg .LB17138
	jmp .LB17139
.LB17156:
	movslq %edi, %r9
	movl %r8d, (%rcx,%r9,4)
	incl %esi
	cmpl %edx, %esi
	jl .LB17144
	jmp .LB17145
	.text
	.globl IDEKA__ilink__pe_symrva__2__PeLinkE1_ptr1__intE1__ret_dataE1_sbits64
	.def IDEKA__ilink__pe_symrva__2__PeLinkE1_ptr1__intE1__ret_dataE1_sbits64;
	.scl 2;
	.type 32;
	.endef
IDEKA__ilink__pe_symrva__2__PeLinkE1_ptr1__intE1__ret_dataE1_sbits64:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
	movq %rdi, -8(%rsp)
.LB17191:
	movq 208(%rcx), %rax
	movslq %edx, %rsi
	movl (%rax,%rsi,4), %eax
	cmpl $4294967295, %eax
	je .LB17206
.LB17207:
	testl %eax, %eax
	je .LB17218
.LB17219:
	movq 48(%rcx), %rdi
	movq 192(%rcx), %r8
	movl (%r8,%rsi,4), %esi
	movslq %esi, %rsi
	movl (%rdi,%rsi,4), %esi
	addl %eax, %esi
	decl %esi
	movq 176(%rcx), %rax
	movslq %esi, %rsi
	movq (%rax,%rsi,8), %rax
	movq 200(%rcx), %rcx
	movslq %edx, %rdx
	movq (%rcx,%rdx,8), %rcx
	addq %rcx, %rax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB17218:
	movq 248(%rcx), %rax
	movslq %edx, %rcx
	movq (%rax,%rcx,8), %rax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB17206:
	movq 200(%rcx), %rax
	movslq %edx, %rcx
	movq (%rax,%rcx,8), %rax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
	.text
	.globl IDEKA__ilink__pe_link_all__5__PeLinkE1_ptr1__byteE1_ptr1__intE1__dataE1_sbits64__byteE1_ptr1__ret_boolE1
	.def IDEKA__ilink__pe_link_all__5__PeLinkE1_ptr1__byteE1_ptr1__intE1__dataE1_sbits64__byteE1_ptr1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
IDEKA__ilink__pe_link_all__5__PeLinkE1_ptr1__byteE1_ptr1__intE1__dataE1_sbits64__byteE1_ptr1__ret_boolE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $1552, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
	movq %r14, -48(%rbp)
	movq %r15, -56(%rbp)
.LB17259:
	movq %rcx, %rsi
	movq %rdx, -784(%rbp)
	movq %r8, -760(%rbp)
	movq %r9, -768(%rbp)
	movq 48(%rbp), %rax
	movq %rax, -776(%rbp)
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -80(%rbp)
	movb .LZERO+16(%rip), %r10b
	movb %r10b, -64(%rbp)
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -104(%rbp)
	movb .LZERO+16(%rip), %r10b
	movb %r10b, -88(%rbp)
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -136(%rbp)
	movups .LZERO+16(%rip), %xmm15
	movups %xmm15, -120(%rbp)
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -168(%rbp)
	movups .LZERO+16(%rip), %xmm15
	movups %xmm15, -152(%rbp)
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -200(%rbp)
	movups .LZERO+16(%rip), %xmm15
	movups %xmm15, -184(%rbp)
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -232(%rbp)
	movups .LZERO+16(%rip), %xmm15
	movups %xmm15, -216(%rbp)
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -264(%rbp)
	movups .LZERO+16(%rip), %xmm15
	movups %xmm15, -248(%rbp)
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -296(%rbp)
	movups .LZERO+16(%rip), %xmm15
	movups %xmm15, -280(%rbp)
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -328(%rbp)
	movups .LZERO+16(%rip), %xmm15
	movups %xmm15, -312(%rbp)
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -360(%rbp)
	movups .LZERO+16(%rip), %xmm15
	movups %xmm15, -344(%rbp)
	movl $0, -136(%rbp)
	movl $16, -168(%rbp)
	movl $0, -296(%rbp)
	movl $0, -132(%rbp)
	movl $16, -164(%rbp)
	movl $0, -292(%rbp)
	movl $0, -128(%rbp)
	movl $16, -160(%rbp)
	movl $0, -288(%rbp)
	movl $0, -124(%rbp)
	movl $16, -156(%rbp)
	movl $0, -284(%rbp)
	movl $0, -120(%rbp)
	movl $16, -152(%rbp)
	movl $0, -280(%rbp)
	movl $0, -116(%rbp)
	movl $16, -148(%rbp)
	movl $0, -276(%rbp)
	movl $0, -112(%rbp)
	movl $16, -144(%rbp)
	movl $0, -272(%rbp)
	movl $0, -108(%rbp)
	movl $16, -140(%rbp)
	movl $0, -268(%rbp)
	movl $0, -360(%rbp)
	movl $1, -356(%rbp)
	movl $3, -352(%rbp)
	movl $5, -348(%rbp)
	movl $4, -344(%rbp)
	xorl %edi, %edi
	movq $0, -792(%rbp)
.LB17337:
	movl 88(%rsi), %eax
	cmpl %eax, %edi
	jge .LB17339
.LB17338:
	movq 160(%rsi), %rax
	movslq %edi, %rcx
	movl (%rax,%rcx,4), %eax
	testl %eax, %eax
	jns .LB17355
.LB17356:
	movq -792(%rbp), %rax
.LB17357:
	incl %edi
	movq %rax, -792(%rbp)
	jmp .LB17337
.LB17339:
	xorl %edi, %edi
.LB17425:
	movl 92(%rsi), %eax
	cmpl %eax, %edi
	jge .LB17427
.LB17426:
	movq 216(%rsi), %rax
	movslq %edi, %rcx
	movl (%rax,%rcx,4), %eax
	cmpl $2, %eax
	jne .LB17479
.LB17442:
	movq 208(%rsi), %rax
	movl (%rax,%rcx,4), %eax
	testl %eax, %eax
	jne .LB17479
.LB17453:
	movq 200(%rsi), %rax
	movq (%rax,%rcx,8), %rax
	testq %rax, %rax
	je .LB17479
.LB17465:
	movq 224(%rsi), %rax
	movl (%rax,%rcx,4), %eax
	cmpl %edi, %eax
	je .LB17477
.LB17479:
	incl %edi
	jmp .LB17425
.LB17427:
	movl -136(%rbp), %eax
	movslq %eax, %rcx
	movq $8, %rdx
	callq IDEKA__ilink__lk_align_up__2__dataE1_sbits64__dataE1_sbits64__ret_dataE1_sbits64
	xorl %ecx, %ecx
	movq %rax, %rdx
.LB17520:
	movl 432(%rsi), %edi
	cmpl %edi, %ecx
	jge .LB17522
.LB17521:
	movq 480(%rsi), %rdi
	movslq %ecx, %r8
	movl (%rdi,%r8,4), %edi
	testl %edi, %edi
	jne .LB17537
.LB17538:
.LB17539:
	incl %ecx
	jmp .LB17520
.LB17522:
	cmpl %eax, %edx
	jg .LB17557
.LB17559:
	movl 432(%rsi), %eax
	addl $2, %eax
	shll $3, %eax
	movslq %eax, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -1304(%rbp)
	movl 432(%rsi), %eax
	addl $2, %eax
	shll $2, %eax
	movslq %eax, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -1224(%rbp)
	movl 432(%rsi), %eax
	addl $2, %eax
	shll $2, %eax
	movslq %eax, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, %rdi
	movl 432(%rsi), %eax
	addl $2, %eax
	shll $2, %eax
	movslq %eax, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -1232(%rbp)
	movl 432(%rsi), %eax
	addl $2, %eax
	shll $2, %eax
	movslq %eax, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -1120(%rbp)
	movl 432(%rsi), %eax
	addl $2, %eax
	shll $2, %eax
	movslq %eax, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -1296(%rbp)
	movl 432(%rsi), %eax
	addl $2, %eax
	shll $2, %eax
	movslq %eax, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -800(%rbp)
	movl 432(%rsi), %eax
	addl $2, %eax
	shll $2, %eax
	movslq %eax, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -808(%rbp)
	movq $0, -816(%rbp)
	movq $0, -824(%rbp)
.LB17634:
	movl 432(%rsi), %eax
	movq -816(%rbp), %rcx
	cmpl %eax, %ecx
	jge .LB17636
.LB17635:
	xorl %ebx, %ebx
.LB17643:
	movq -824(%rbp), %rax
	cmpl %eax, %ebx
	jge .LB17645
.LB17649:
	movslq %ebx, %rax
	movq -1304(%rbp), %rcx
	movq (%rcx,%rax,8), %rcx
	movq 448(%rsi), %rax
	movq -816(%rbp), %rdx
	movslq %edx, %rdx
	movq (%rax,%rdx,8), %rdx
	callq IDEKA__ilink__lk_streq__2__byteE1_ptr1__byteE1_ptr1__ret_boolE1
	testb %al, %al
	jne .LB17645
.LB17644:
	incl %ebx
	jmp .LB17643
.LB17557:
	movl %edx, -136(%rbp)
	jmp .LB17559
.LB17636:
	xorl %eax, %eax
	xorl %ecx, %ecx
.LB17698:
	movq -824(%rbp), %rdx
	cmpl %edx, %ecx
	jge .LB17700
.LB17699:
	movslq %ecx, %rdx
	movq -1224(%rbp), %r8
	movl %eax, (%r8,%rdx,4)
	leaq (%rdi,%rdx,4), %rdx
	movl (%rdx), %r8d
	addl %r8d, %eax
	movl $0, (%rdx)
	incl %ecx
	jmp .LB17698
.LB17700:
	movq $0, -832(%rbp)
.LB17719:
	movl 432(%rsi), %eax
	movq -832(%rbp), %rcx
	cmpl %eax, %ecx
	jge .LB17721
.LB17720:
	xorl %ebx, %ebx
.LB17728:
	movslq %ebx, %rax
	movq -1304(%rbp), %rcx
	movq (%rcx,%rax,8), %rcx
	movq 448(%rsi), %rax
	movq -832(%rbp), %rdx
	movslq %edx, %r12
	movq (%rax,%r12,8), %rdx
	callq IDEKA__ilink__lk_streq__2__byteE1_ptr1__byteE1_ptr1__ret_boolE1
	testb %al, %al
	jne .LB17730
.LB17729:
	incl %ebx
	jmp .LB17728
.LB17721:
	cmpl $0, %eax
	jg .LB17797
.LB17798:
	movq $0, -912(%rbp)
	movq $0, -840(%rbp)
	movq $0, -848(%rbp)
	movq $0, -856(%rbp)
.LB17799:
	xorl %eax, %eax
	xorl %ecx, %ecx
.LB17942:
	cmpq $6, %rcx
	jge .LB17944
.LB17943:
	movl -136(%rbp,%rcx,4), %edx
	cmpl $0, %edx
	jg .LB17951
.LB17952:
.LB17953:
	incq %rcx
	cmpq $6, %rcx
	jl .LB17943
	jmp .LB17944
.LB17797:
	movq -824(%rbp), %rax
	leal 1(%rax), %ecx
	imull $20, %ecx, %ecx
	movq %rcx, -864(%rbp)
	movslq %eax, %rax
	movq -864(%rbp), %r10
	movq %r10, -872(%rbp)
	xorl %ecx, %ecx
.LB17804:
	cmpq %rax, %rcx
	jge .LB17806
.LB17805:
	movq -872(%rbp), %rdx
	movq -1120(%rbp), %r8
	movl %edx, (%r8,%rcx,4)
	movl (%rdi,%rcx,4), %r8d
	incl %r8d
	shll $3, %r8d
	addl %r8d, %edx
	incq %rcx
	movq %rdx, -872(%rbp)
	cmpq %rax, %rcx
	jl .LB17805
.LB17806:
	movq -824(%rbp), %rax
	movslq %eax, %rax
	movq -872(%rbp), %rcx
	xorl %edx, %edx
.LB17825:
	cmpq %rax, %rdx
	jge .LB17827
.LB17826:
	movq -1232(%rbp), %r8
	movl %ecx, (%r8,%rdx,4)
	movl (%rdi,%rdx,4), %r8d
	incl %r8d
	shll $3, %r8d
	addl %r8d, %ecx
	incq %rdx
	cmpq %rax, %rdx
	jl .LB17826
.LB17827:
	movq -872(%rbp), %rax
	movl %ecx, %edi
	subl %eax, %edi
	xorl %eax, %eax
.LB17848:
	movl 432(%rsi), %edx
	cmpl %edx, %eax
	jge .LB17850
.LB17849:
	movslq %eax, %rdx
	movq -808(%rbp), %r8
	movl $4294967295, (%r8,%rdx,4)
	incl %eax
	jmp .LB17848
.LB17850:
	movq $0, -880(%rbp)
.LB17863:
	movl 432(%rsi), %eax
	movq -880(%rbp), %rdx
	cmpl %eax, %edx
	jge .LB17865
.LB17864:
	movq 464(%rsi), %rax
	movq -880(%rbp), %rdx
	movslq %edx, %rdx
	movq -800(%rbp), %r8
	leaq (%r8,%rdx,4), %rdx
	movl (%rdx), %r8d
	movslq %r8d, %r9
	movl (%rax,%r9,4), %eax
	testl %eax, %eax
	js .LB17883
.LB17884:
.LB17885:
	movq -880(%rbp), %rax
	incl %eax
	movq %rax, -880(%rbp)
	jmp .LB17863
.LB17865:
	movq $0, -888(%rbp)
	movq %rcx, -896(%rbp)
.LB17918:
	movq -888(%rbp), %rax
	movq -824(%rbp), %rcx
	cmpl %ecx, %eax
	jge .LB17920
.LB17919:
	movq -888(%rbp), %rax
	movslq %eax, %rax
	movq -896(%rbp), %rcx
	movq -1296(%rbp), %rdx
	movl %ecx, (%rdx,%rax,4)
	movq -1304(%rbp), %rcx
	movq (%rcx,%rax,8), %rcx
	callq IDEKA__ilink__lk_strlen__1__byteE1_ptr1__ret_intE1
	movq -896(%rbp), %rcx
	addl %eax, %ecx
	incl %ecx
	movq -888(%rbp), %rax
	incl %eax
	movq %rax, -888(%rbp)
	movq %rcx, -896(%rbp)
	jmp .LB17918
.LB17920:
	movq -896(%rbp), %rax
	movl %eax, -128(%rbp)
	movl $8, -160(%rbp)
	movq -896(%rbp), %r10
	movq %r10, -912(%rbp)
	movq %rdi, -840(%rbp)
	movq -872(%rbp), %r10
	movq %r10, -848(%rbp)
	movq -864(%rbp), %r10
	movq %r10, -856(%rbp)
	jmp .LB17799
.LB17944:
	incl %eax
	movq %rax, -904(%rbp)
	imull $40, %eax, %eax
	addl $392, %eax
	movslq %eax, %rcx
	movq $512, %rdx
	callq IDEKA__ilink__lk_align_up__2__dataE1_sbits64__dataE1_sbits64__ret_dataE1_sbits64
	movq %rax, -984(%rbp)
	movslq %eax, %rcx
	movq $4096, %rdx
	callq IDEKA__ilink__lk_align_up__2__dataE1_sbits64__dataE1_sbits64__ret_dataE1_sbits64
	movq $0, -920(%rbp)
	movq %rax, -928(%rbp)
	movq -984(%rbp), %r10
	movq %r10, -936(%rbp)
	movl $1, %eax
.LB17978:
	movq -920(%rbp), %rcx
	cmpl $6, %ecx
	jge .LB17980
.LB17979:
	movq -920(%rbp), %rcx
	movslq %ecx, %rcx
	movl -296(%rbp,%rcx,4), %ecx
	cmpl $1, %ecx
	je .LB17987
.LB17988:
	movq -928(%rbp), %rcx
	movq -936(%rbp), %rdx
.LB17989:
	movq -920(%rbp), %rdi
	incl %edi
	movq %rdi, -920(%rbp)
	movq %rcx, -928(%rbp)
	movq %rdx, -936(%rbp)
	jmp .LB17978
.LB17980:
	movl %eax, -304(%rbp)
	xorl %eax, %eax
	movq -920(%rbp), %r10
	movq %r10, -944(%rbp)
	movq -792(%rbp), %r10
	movq %r10, -952(%rbp)
.LB18037:
	movl 88(%rsi), %ecx
	cmpl %ecx, %eax
	jge .LB18039
.LB18038:
	movq 160(%rsi), %rcx
	movslq %eax, %rdx
	movl (%rcx,%rdx,4), %ecx
	testl %ecx, %ecx
	jns .LB18055
.LB18056:
	movq -952(%rbp), %rdx
.LB18057:
	incl %eax
	movq %rcx, -944(%rbp)
	movq %rdx, -952(%rbp)
	jmp .LB18037
.LB18039:
	xorl %eax, %eax
.LB18083:
	movl 92(%rsi), %ecx
	cmpl %ecx, %eax
	jge .LB18085
.LB18084:
	movq 216(%rsi), %rcx
	movslq %eax, %rdx
	movl (%rcx,%rdx,4), %ecx
	cmpl $2, %ecx
	jne .LB18137
.LB18100:
	movq 208(%rsi), %rcx
	movl (%rcx,%rdx,4), %ecx
	testl %ecx, %ecx
	jne .LB18137
.LB18111:
	movq 200(%rsi), %rcx
	movq (%rcx,%rdx,8), %rcx
	testq %rcx, %rcx
	je .LB18137
.LB18123:
	movq 224(%rsi), %rcx
	movl (%rcx,%rdx,4), %ecx
	cmpl %eax, %ecx
	je .LB18135
.LB18137:
	incl %eax
	jmp .LB18083
.LB18085:
	movq $0, -960(%rbp)
.LB18159:
	movl 432(%rsi), %eax
	movq -960(%rbp), %rcx
	cmpl %eax, %ecx
	jge .LB18161
.LB18160:
	movl -192(%rbp), %eax
	movq 488(%rsi), %rcx
	movq -960(%rbp), %rdx
	movslq %edx, %rdx
	movl (%rcx,%rdx,4), %ecx
	movslq %ecx, %rdx
	movq -1232(%rbp), %rdi
	movl (%rdi,%rdx,4), %edx
	addl %edx, %eax
	movq 496(%rsi), %rdx
	movq -960(%rbp), %rdi
	movslq %edi, %rdi
	movl (%rdx,%rdi,4), %edx
	movslq %ecx, %rcx
	movq -1224(%rbp), %rdi
	movl (%rdi,%rcx,4), %ecx
	subl %ecx, %edx
	shll $3, %edx
	addl %edx, %eax
	movq 504(%rsi), %rcx
	movslq %eax, %rax
	movq -960(%rbp), %rdx
	movslq %edx, %rdx
	movq %rax, (%rcx,%rdx,8)
	movq 480(%rsi), %rax
	movl (%rax,%rdx,4), %eax
	testl %eax, %eax
	jne .LB18218
.LB18220:
	movq -960(%rbp), %rax
	incl %eax
	movq %rax, -960(%rbp)
	jmp .LB18159
.LB18161:
	movq $0, -968(%rbp)
	movl $4294967295, %r10d
	movq %r10, -976(%rbp)
.LB18243:
	movl 92(%rsi), %eax
	movq -968(%rbp), %rcx
	cmpl %eax, %ecx
	jge .LB18245
.LB18252:
	movq -976(%rbp), %rax
	testl %eax, %eax
	jns .LB18245
.LB18244:
	movq 224(%rsi), %rax
	movq -968(%rbp), %rcx
	movslq %ecx, %rdx
	movl (%rax,%rdx,4), %eax
	cmpl %ecx, %eax
	jne .LB18290
.LB18266:
	movq 216(%rsi), %rax
	movl (%rax,%rdx,4), %eax
	cmpl $2, %eax
	jne .LB18290
.LB18277:
	movq 184(%rsi), %rax
	movq (%rax,%rdx,8), %rcx
	movq -784(%rbp), %rdx
	callq IDEKA__ilink__lk_streq__2__byteE1_ptr1__byteE1_ptr1__ret_boolE1
	testb %al, %al
	jne .LB18289
.LB18290:
	movq -976(%rbp), %rax
.LB18291:
	movq -968(%rbp), %rcx
	incl %ecx
	movq %rcx, -968(%rbp)
	movq %rax, -976(%rbp)
	jmp .LB18243
.LB18245:
	movq -976(%rbp), %rax
	testl %eax, %eax
	js .LB18297
.LB18298:
	leaq -80(%rbp), %rcx
	callq IDEKA__ilink__lb_init__1__LkBufE1_ptr1__ret_voidE1
	leaq -80(%rbp), %rcx
	movq -936(%rbp), %rdx
	callq IDEKA__ilink__lb_pad_to__2__LkBufE1_ptr1__intE1__ret_voidE1
	movzbl -64(%rbp), %eax
	shrq $7, %rax
	testb %al, %al
	je .LB18345
.LB18346:
	movq -80(%rbp), %rcx
	movq -936(%rbp), %rdx
	callq IDEKA__ilink__lk_zero__2__byteE1_ptr1__intE1__ret_voidE1
	xorl %eax, %eax
	movq -944(%rbp), %rcx
	movq -960(%rbp), %rdx
	movq -952(%rbp), %rdi
	xorl %r8d, %r8d
.LB18372:
	movl 88(%rsi), %r9d
	cmpl %r9d, %eax
	jge .LB18374
.LB18373:
	movq 160(%rsi), %rcx
	movslq %eax, %r9
	movl (%rcx,%r9,4), %ecx
	testl %ecx, %ecx
	js .LB18418
.LB18390:
	cmpl $3, %ecx
	je .LB18418
.LB18395:
	movq 120(%rsi), %rbx
	movl (%rbx,%r9,4), %ebx
	cmpl $0, %ebx
	jle .LB18418
.LB18406:
	movq 128(%rsi), %rbx
	movl (%rbx,%r9,4), %r9d
	cmpl $0, %r9d
	jg .LB18417
.LB18418:
.LB18419:
	incl %eax
	jmp .LB18372
.LB18374:
	xorl %edx, %edx
	movq $0, -1376(%rbp)
	movq -968(%rbp), %r8
	movq $0, -992(%rbp)
	movq $0, -1000(%rbp)
	movq $0, -1008(%rbp)
	movq -912(%rbp), %r10
	movq %r10, -1016(%rbp)
	movq %rdi, -1024(%rbp)
	movq $0, -1032(%rbp)
	movq $0, -1040(%rbp)
	movq $0, -1048(%rbp)
	movq $0, -1056(%rbp)
	xorl %edi, %edi
.LB18483:
	movl 8(%rsi), %r9d
	movq %r9, -1064(%rbp)
	movq -1376(%rbp), %rbx
	cmpl %r9d, %ebx
	jge .LB18485
.LB18484:
	movq 16(%rsi), %r9
	movq -1376(%rbp), %rbx
	movslq %ebx, %rbx
	movq %rbx, -1136(%rbp)
	movq (%r9,%rbx,8), %rbx
	movq $0, -1144(%rbp)
	movq -992(%rbp), %r10
	movq %r10, -1152(%rbp)
	movq -1000(%rbp), %r10
	movq %r10, -1160(%rbp)
	movq -1008(%rbp), %r10
	movq %r10, -1168(%rbp)
	movq -1016(%rbp), %r10
	movq %r10, -1176(%rbp)
	movq -1024(%rbp), %r10
	movq %r10, -1184(%rbp)
	movq -1032(%rbp), %r10
	movq %r10, -1192(%rbp)
	movq -1040(%rbp), %r10
	movq %r10, -1200(%rbp)
	movq -1048(%rbp), %r10
	movq %r10, -1208(%rbp)
	movq -1056(%rbp), %r10
	movq %r10, -1216(%rbp)
.LB18499:
	movq 32(%rsi), %r9
	movq -1376(%rbp), %r12
	movslq %r12d, %r12
	movl (%r9,%r12,4), %r9d
	movq -1144(%rbp), %r12
	cmpl %r9d, %r12d
	jge .LB18501
.LB18500:
	movq 48(%rsi), %rax
	movq -1376(%rbp), %rcx
	movslq %ecx, %rcx
	movl (%rax,%rcx,4), %eax
	movq -1144(%rbp), %rcx
	addl %ecx, %eax
	movq %rax, -1392(%rbp)
	movq 160(%rsi), %rcx
	movslq %eax, %rax
	movl (%rcx,%rax,4), %eax
	movq %rax, -1352(%rbp)
	testl %eax, %eax
	js .LB18535
.LB18529:
	movq -1352(%rbp), %rax
	cmpl $3, %eax
	jne .LB18534
.LB18535:
	movq -1152(%rbp), %rax
	movq -1160(%rbp), %rcx
	movq -1168(%rbp), %r10
	movq %r10, -1240(%rbp)
	movq -1176(%rbp), %r10
	movq %r10, -1248(%rbp)
	movq -1184(%rbp), %r10
	movq %r10, -1256(%rbp)
	movq -1192(%rbp), %r10
	movq %r10, -1264(%rbp)
	movq -1200(%rbp), %r10
	movq %r10, -1272(%rbp)
	movq -1208(%rbp), %r10
	movq %r10, -1280(%rbp)
	movq -1216(%rbp), %r10
	movq %r10, -1288(%rbp)
.LB18536:
	movq -1144(%rbp), %r9
	incl %r9d
	movq %r9, -1144(%rbp)
	movq %rax, -1152(%rbp)
	movq %rcx, -1160(%rbp)
	movq -1240(%rbp), %r10
	movq %r10, -1168(%rbp)
	movq -1248(%rbp), %r10
	movq %r10, -1176(%rbp)
	movq -1256(%rbp), %r10
	movq %r10, -1184(%rbp)
	movq -1264(%rbp), %r10
	movq %r10, -1192(%rbp)
	movq -1272(%rbp), %r10
	movq %r10, -1200(%rbp)
	movq -1280(%rbp), %r10
	movq %r10, -1208(%rbp)
	movq -1288(%rbp), %r10
	movq %r10, -1216(%rbp)
	movq -1392(%rbp), %rax
	movq -1352(%rbp), %rcx
	jmp .LB18499
.LB18485:
	xorl %edi, %edi
	movq -1016(%rbp), %rax
.LB19310:
	movl 432(%rsi), %ecx
	cmpl %ecx, %edi
	jge .LB19312
.LB19311:
	movq 480(%rsi), %rcx
	movslq %edi, %rdx
	movl (%rcx,%rdx,4), %ecx
	testl %ecx, %ecx
	jne .LB19327
.LB19328:
.LB19329:
	incl %edi
	jmp .LB19310
.LB19312:
	cmpl $0, %ecx
	jg .LB19410
.LB19412:
	movq 552(%rsi), %rcx
	movl 544(%rsi), %edx
	callq IDEKA__ilink__pe_sort__2__intE1_ptr1__intE1__ret_voidE1
	leaq -104(%rbp), %rcx
	callq IDEKA__ilink__lb_init__1__LkBufE1_ptr1__ret_voidE1
	xorl %edi, %edi
.LB19660:
	movl 544(%rsi), %eax
	cmpl %eax, %edi
	jge .LB19662
.LB19661:
	movq 552(%rsi), %rax
	movslq %edi, %rcx
	movl (%rax,%rcx,4), %eax
	movl %eax, %ecx
	sarl $31, %ecx
	shrl $20, %ecx
	addl %eax, %ecx
	sarl $12, %ecx
	imull $4096, %ecx, %ecx
	negl %ecx
	addl %eax, %ecx
	subl %ecx, %eax
	movq %rdi, %rbx
.LB19686:
	movl 544(%rsi), %ecx
	cmpl %ecx, %ebx
	jge .LB19688
.LB19695:
	movq 552(%rsi), %rcx
	movslq %ebx, %rdx
	movl (%rcx,%rdx,4), %ecx
	movl %ecx, %edx
	sarl $31, %edx
	shrl $20, %edx
	addl %ecx, %edx
	sarl $12, %edx
	imull $4096, %edx, %edx
	negl %edx
	addl %ecx, %edx
	subl %edx, %ecx
	cmpl %eax, %ecx
	jne .LB19688
.LB19687:
	incl %ebx
	jmp .LB19686
.LB19410:
	xorl %edi, %edi
.LB19414:
	movq -824(%rbp), %rcx
	cmpl %ecx, %edi
	jge .LB19416
.LB19415:
	movl -224(%rbp), %eax
	imull $20, %edi, %ecx
	leal (%rax,%rcx), %ebx
	movq -80(%rbp), %rcx
	movl -192(%rbp), %eax
	movslq %edi, %rdx
	movq %rdx, -1128(%rbp)
	movq -1120(%rbp), %r8
	movl (%r8,%rdx,4), %edx
	addl %edx, %eax
	movslq %eax, %r8
	movq %rbx, %rdx
	callq IDEKA__ilink__lk_w32__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	leal 12(%rbx), %edx
	movl -192(%rbp), %eax
	movq -1296(%rbp), %r8
	movq -1128(%rbp), %r9
	movl (%r8,%r9,4), %r8d
	addl %r8d, %eax
	movslq %eax, %r8
	callq IDEKA__ilink__lk_w32__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	leal 16(%rbx), %edx
	movl -192(%rbp), %eax
	movq -1232(%rbp), %r8
	movq -1128(%rbp), %r9
	movl (%r8,%r9,4), %r8d
	addl %r8d, %eax
	movslq %eax, %r8
	callq IDEKA__ilink__lk_w32__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	xorl %eax, %eax
.LB19466:
	movslq %edi, %rcx
	movq -1304(%rbp), %rdx
	movq (%rdx,%rcx,8), %rcx
	movslq %eax, %rdx
	movzbl (%rcx,%rdx,1), %ecx
	movzbl %cl, %edx
	testl %edx, %edx
	je .LB19468
.LB19467:
	movq -80(%rbp), %rdx
	movl -224(%rbp), %r8d
	movslq %edi, %r9
	movq -1296(%rbp), %r12
	movl (%r12,%r9,4), %r9d
	addl %r9d, %r8d
	addl %eax, %r8d
	movslq %r8d, %r8
	movb %cl, (%rdx,%r8,1)
	incl %eax
	jmp .LB19466
.LB19416:
	xorl %edi, %edi
	movq %rax, %rcx
	xorl %eax, %eax
.LB19504:
	movl 432(%rsi), %edx
	cmpl %edx, %edi
	jge .LB19412
.LB19505:
	movq 488(%rsi), %rdx
	movslq %edi, %r8
	movl (%rdx,%r8,4), %ebx
	movq 496(%rsi), %rdx
	movl (%rdx,%r8,4), %edx
	movslq %ebx, %r8
	movq -1224(%rbp), %r9
	movl (%r9,%r8,4), %r8d
	subl %r8d, %edx
	movq %rdx, -1088(%rbp)
	movq 464(%rsi), %rdx
	movslq %edi, %r8
	movl (%rdx,%r8,4), %edx
	testl %edx, %edx
	jns .LB19540
.LB19541:
	movl -192(%rbp), %eax
	movq -808(%rbp), %rcx
	movl (%rcx,%r8,4), %ecx
	addl %ecx, %eax
	movslq %eax, %rax
	movq %rax, -1080(%rbp)
	movl -224(%rbp), %eax
	leal (%rax,%rcx), %r12d
	movq -80(%rbp), %rcx
	movq 456(%rsi), %rax
	movl (%rax,%r8,4), %eax
	movslq %eax, %r8
	movq %r12, %rdx
	callq IDEKA__ilink__lk_w16__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	leal 2(%r12), %eax
	xorl %ecx, %ecx
.LB19583:
	movq 440(%rsi), %rdx
	movslq %edi, %r8
	movq (%rdx,%r8,8), %rdx
	movslq %ecx, %r8
	movzbl (%rdx,%r8,1), %edx
	movzbl %dl, %r8d
	testl %r8d, %r8d
	je .LB19585
.LB19584:
	movq -80(%rbp), %r8
	leal (%rax,%rcx), %r9d
	movslq %r9d, %r9
	movb %dl, (%r8,%r9,1)
	incl %ecx
	jmp .LB19583
.LB19662:
	movl -96(%rbp), %eax
	testl %eax, %eax
	je .LB19768
.LB19770:
	movq -928(%rbp), %rax
	movl %eax, -176(%rbp)
	movl -96(%rbp), %eax
	movl %eax, -112(%rbp)
	movslq %eax, %rcx
	movq $512, %rdx
	callq IDEKA__ilink__lk_align_up__2__dataE1_sbits64__dataE1_sbits64__ret_dataE1_sbits64
	movl %eax, -240(%rbp)
	movq -936(%rbp), %rax
	movl %eax, -208(%rbp)
	movl -96(%rbp), %eax
	movq -928(%rbp), %rcx
	addl %eax, %ecx
	movslq %ecx, %rcx
	movq $4096, %rdx
	callq IDEKA__ilink__lk_align_up__2__dataE1_sbits64__dataE1_sbits64__ret_dataE1_sbits64
	movl %eax, %edi
	movl -240(%rbp), %eax
	movq -936(%rbp), %rcx
	leal (%rcx,%rax), %edx
	movq %rdx, -1072(%rbp)
	leaq -80(%rbp), %rcx
	callq IDEKA__ilink__lb_pad_to__2__LkBufE1_ptr1__intE1__ret_voidE1
	movq -80(%rbp), %rax
	movl -208(%rbp), %ecx
	movslq %ecx, %rcx
	leaq (%rax,%rcx,1), %rcx
	movl -240(%rbp), %edx
	callq IDEKA__ilink__lk_zero__2__byteE1_ptr1__intE1__ret_voidE1
	xorl %eax, %eax
.LB19817:
	movl -96(%rbp), %ecx
	cmpl %ecx, %eax
	jge .LB19819
.LB19818:
	movq -104(%rbp), %rcx
	movslq %eax, %rdx
	movzbl (%rcx,%rdx,1), %ecx
	movq -80(%rbp), %rdx
	movl -208(%rbp), %r8d
	addl %eax, %r8d
	movslq %r8d, %r8
	movb %cl, (%rdx,%r8,1)
	incl %eax
	jmp .LB19817
.LB19768:
	movl -200(%rbp), %eax
	movslq %eax, %rdx
	leaq -104(%rbp), %rcx
	callq IDEKA__ilink__lb_put32__2__LkBufE1_ptr1__dataE1_sbits64__ret_voidE1
	leaq -104(%rbp), %rcx
	movq $8, %rdx
	callq IDEKA__ilink__lb_put32__2__LkBufE1_ptr1__dataE1_sbits64__ret_voidE1
	jmp .LB19770
.LB19819:
	movq -80(%rbp), %rax
	movb $77, (%rax)
	movq -80(%rbp), %rax
	movb $90, 1(%rax)
	movq -80(%rbp), %rcx
	movq $2, %rdx
	movq $128, %r8
	callq IDEKA__ilink__lk_w16__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	movq $4, %rdx
	movq $1, %r8
	callq IDEKA__ilink__lk_w16__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	movq $8, %rdx
	movq $4, %r8
	callq IDEKA__ilink__lk_w16__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	movq $16, %rdx
	movq $184, %r8
	callq IDEKA__ilink__lk_w16__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	movq $24, %rdx
	movq $64, %r8
	callq IDEKA__ilink__lk_w16__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	movq $60, %rdx
	movq $128, %r8
	callq IDEKA__ilink__lk_w32__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rax
	movb $14, 64(%rax)
	movq -80(%rbp), %rax
	movb $31, 65(%rax)
	movq -80(%rbp), %rax
	movb $186, 66(%rax)
	movq -80(%rbp), %rax
	movb $14, 67(%rax)
	movq -80(%rbp), %rax
	movb $0, 68(%rax)
	movq -80(%rbp), %rax
	movb $180, 69(%rax)
	movq -80(%rbp), %rax
	movb $9, 70(%rax)
	movq -80(%rbp), %rax
	movb $205, 71(%rax)
	movq -80(%rbp), %rax
	movb $33, 72(%rax)
	movq -80(%rbp), %rax
	movb $184, 73(%rax)
	movq -80(%rbp), %rax
	movb $1, 74(%rax)
	movq -80(%rbp), %rax
	movb $76, 75(%rax)
	movq -80(%rbp), %rax
	movb $205, 76(%rax)
	movq -80(%rbp), %rax
	movb $33, 77(%rax)
	movl $1936287828, -400(%rbp)
	movl $1869770784, -396(%rbp)
	movl $1835102823, -392(%rbp)
	movl $1851876128, -388(%rbp)
	movl $544501614, -384(%rbp)
	movl $1914725730, -380(%rbp)
	movl $1763733109, -376(%rbp)
	movl $1329864814, -372(%rbp)
	movl $1869422675, -368(%rbp)
	movl $3040612, -364(%rbp)
	leaq -400(%rbp), %rbx
	xorl %r12d, %r12d
.LB20056:
	movslq %r12d, %rax
	movzbl (%rbx,%rax,1), %eax
	movzbl %al, %ecx
	testl %ecx, %ecx
	je .LB20058
.LB20057:
	movq -80(%rbp), %rcx
	leal 78(%r12), %edx
	movslq %edx, %rdx
	movb %al, (%rcx,%rdx,1)
	incl %r12d
	jmp .LB20056
.LB20058:
	movq -80(%rbp), %rax
	leal 78(%r12), %ecx
	movslq %ecx, %rcx
	movb $13, (%rax,%rcx,1)
	movq -80(%rbp), %rax
	leal 79(%r12), %ecx
	movslq %ecx, %rcx
	movb $13, (%rax,%rcx,1)
	movq -80(%rbp), %rax
	leal 80(%r12), %ecx
	movslq %ecx, %rcx
	movb $10, (%rax,%rcx,1)
	movq -80(%rbp), %rax
	leal 81(%r12), %ecx
	movslq %ecx, %rcx
	movb $36, (%rax,%rcx,1)
	movq -80(%rbp), %rax
	movb $80, 128(%rax)
	movq -80(%rbp), %rax
	movb $69, 129(%rax)
	movq -80(%rbp), %rcx
	movq $132, %rdx
	movq $34404, %r8
	callq IDEKA__ilink__lk_w16__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	movq -904(%rbp), %rax
	movslq %eax, %r8
	movq $134, %rdx
	callq IDEKA__ilink__lk_w16__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	movq $136, %rdx
	xorl %r8d, %r8d
	callq IDEKA__ilink__lk_w32__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	movq $148, %rdx
	movq $240, %r8
	callq IDEKA__ilink__lk_w16__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	movq $150, %rdx
	movq $34, %r8
	callq IDEKA__ilink__lk_w16__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	movq $152, %rdx
	movq $523, %r8
	callq IDEKA__ilink__lk_w16__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rax
	movb $14, 154(%rax)
	movq -80(%rbp), %rcx
	movl -136(%rbp), %eax
	movslq %eax, %r8
	movq $156, %rdx
	callq IDEKA__ilink__lk_w32__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	movl -132(%rbp), %eax
	movl -128(%rbp), %edx
	addl %edx, %eax
	movl -124(%rbp), %edx
	addl %edx, %eax
	movl -120(%rbp), %edx
	addl %edx, %eax
	movl -112(%rbp), %edx
	addl %edx, %eax
	movslq %eax, %r8
	movq $160, %rdx
	callq IDEKA__ilink__lk_w32__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	movl -116(%rbp), %eax
	movslq %eax, %r8
	movq $164, %rdx
	callq IDEKA__ilink__lk_w32__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %r13
	movq %rsi, %rcx
	movq -976(%rbp), %rdx
	callq IDEKA__ilink__pe_symrva__2__PeLinkE1_ptr1__intE1__ret_dataE1_sbits64
	movq %rax, %r8
	movq %r13, %rcx
	movq $168, %rdx
	callq IDEKA__ilink__lk_w32__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	movl -200(%rbp), %eax
	movslq %eax, %r8
	movq $172, %rdx
	callq IDEKA__ilink__lk_w32__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	movabsq $5368709120, %r8
	movq $176, %rdx
	callq IDEKA__ilink__lk_w64__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	movq $184, %rdx
	movq $4096, %r8
	callq IDEKA__ilink__lk_w32__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	movq $188, %rdx
	movq $512, %r8
	callq IDEKA__ilink__lk_w32__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	movq $192, %rdx
	movq $6, %r8
	callq IDEKA__ilink__lk_w16__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	movq $200, %rdx
	movq $6, %r8
	callq IDEKA__ilink__lk_w16__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	movslq %edi, %r8
	movq $208, %rdx
	callq IDEKA__ilink__lk_w32__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	movq -984(%rbp), %rax
	movslq %eax, %r8
	movq $212, %rdx
	callq IDEKA__ilink__lk_w32__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	movq -760(%rbp), %rax
	movslq %eax, %r8
	movq $220, %rdx
	callq IDEKA__ilink__lk_w16__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	movq $222, %rdx
	movq $33120, %r8
	callq IDEKA__ilink__lk_w16__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	movq $224, %rdx
	movq -768(%rbp), %r8
	callq IDEKA__ilink__lk_w64__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	movq $232, %rdx
	movq $4096, %r8
	callq IDEKA__ilink__lk_w64__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	movq $240, %rdx
	movq $1048576, %r8
	callq IDEKA__ilink__lk_w64__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	movq $248, %rdx
	movq $4096, %r8
	callq IDEKA__ilink__lk_w64__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	movq $260, %rdx
	movq $16, %r8
	callq IDEKA__ilink__lk_w32__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movl 432(%rsi), %eax
	cmpl $0, %eax
	jg .LB20359
.LB20361:
	movl -280(%rbp), %eax
	cmpl $1, %eax
	je .LB20405
.LB20407:
	movq -80(%rbp), %rcx
	movl -176(%rbp), %eax
	movslq %eax, %r8
	movq $304, %rdx
	callq IDEKA__ilink__lk_w32__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	movl -112(%rbp), %eax
	movslq %eax, %r8
	movq $308, %rdx
	callq IDEKA__ilink__lk_w32__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	xorl %edi, %edi
	movq -992(%rbp), %rax
	xorl %ecx, %ecx
	movq %rbx, %rdx
	movl $392, %ebx
.LB20450:
	cmpl $7, %edi
	jge .LB20452
.LB20451:
	cmpl $6, %edi
	je .LB20464
.LB20457:
	movslq %edi, %r8
	movl -296(%rbp,%r8,4), %r8d
	cmpl $1, %r8d
	je .LB20464
.LB20465:
.LB20466:
	incl %edi
	cmpl $7, %edi
	jl .LB20451
	jmp .LB20452
.LB20359:
	movq -80(%rbp), %rcx
	movl -192(%rbp), %eax
	movslq %eax, %r8
	movq $272, %rdx
	callq IDEKA__ilink__lk_w32__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	movq -856(%rbp), %rax
	movslq %eax, %r8
	movq $276, %rdx
	callq IDEKA__ilink__lk_w32__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	movl -192(%rbp), %eax
	movq -848(%rbp), %rdx
	addl %edx, %eax
	movslq %eax, %r8
	movq $360, %rdx
	callq IDEKA__ilink__lk_w32__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	movq -840(%rbp), %rax
	movslq %eax, %r8
	movq $364, %rdx
	callq IDEKA__ilink__lk_w32__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	jmp .LB20361
.LB20405:
	movq -80(%rbp), %rcx
	movl -184(%rbp), %eax
	movslq %eax, %r8
	movq $288, %rdx
	callq IDEKA__ilink__lk_w32__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	movl -120(%rbp), %eax
	movslq %eax, %r8
	movq $292, %rdx
	callq IDEKA__ilink__lk_w32__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	jmp .LB20407
.LB20452:
	movq -80(%rbp), %rdx
	movq -776(%rbp), %rcx
	movq -1072(%rbp), %r8
	callq IDEKA__ilink__lk_write_file__3__byteE1_ptr1__byteE1_ptr1__intE1__ret_boolE1
	testb %al, %al
	je .LB20639
.LB20640:
	movq -776(%rbp), %rcx
	callq IDEKA__ilink__lk_make_exec__1__byteE1_ptr1__ret_voidE1
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
.LB20639:
	movl $1852727651, -429(%rbp)
	movl $1998615663, -425(%rbp)
	movl $1702127986, -421(%rbp)
	movl $1701344288, -417(%rbp)
	movl $1953853216, -413(%rbp)
	movl $544503152, -409(%rbp)
	movl $1701603686, -405(%rbp)
	movb $0, -401(%rbp)
	leaq -429(%rbp), %rdx
	movq %rsi, %rcx
	callq IDEKA__ilink__pe_fail__2__PeLinkE1_ptr1__byteE1_ptr1__ret_boolE1
	movzbl %al, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB20464:
	testl %edi, %edi
	je .LB20470
.LB20471:
	cmpl $1, %edi
	je .LB20483
.LB20484:
	cmpl $2, %edi
	je .LB20496
.LB20497:
	cmpl $3, %edi
	je .LB20510
.LB20511:
	cmpl $4, %edi
	je .LB20523
.LB20524:
	cmpl $5, %edi
	je .LB20536
.LB20537:
	movl $1818587694, -436(%rbp)
	movw $25455, -432(%rbp)
	movb $0, -430(%rbp)
	leaq -436(%rbp), %rax
	movl $1107296320, %r12d
	movq %rax, %r13
.LB20472:
	xorl %r14d, %r14d
.LB20555:
	movslq %r14d, %rax
	movzbl (%r13,%rax,1), %eax
	movzbl %al, %ecx
	testl %ecx, %ecx
	je .LB20557
.LB20556:
	movq -80(%rbp), %rcx
	leal (%rbx,%r14), %edx
	movslq %edx, %rdx
	movb %al, (%rcx,%rdx,1)
	incl %r14d
	jmp .LB20555
.LB20536:
	movl $1936941614, -441(%rbp)
	movb $0, -437(%rbp)
	leaq -441(%rbp), %r13
	movl $3221225600, %r12d
	jmp .LB20472
.LB20523:
	movl $1633972270, -448(%rbp)
	movw $24948, -444(%rbp)
	movb $0, -442(%rbp)
	leaq -448(%rbp), %r13
	movl $1073741888, %r12d
	jmp .LB20472
.LB20510:
	movl $1952539694, -454(%rbp)
	movw $97, -450(%rbp)
	leaq -454(%rbp), %r13
	movl $3221225536, %r12d
	jmp .LB20472
.LB20496:
	movl $1633970478, -461(%rbp)
	movw $24948, -457(%rbp)
	movb $0, -455(%rbp)
	leaq -461(%rbp), %r13
	movl $3221225536, %r12d
	jmp .LB20472
.LB20483:
	movl $1633972782, -468(%rbp)
	movw $24948, -464(%rbp)
	movb $0, -462(%rbp)
	leaq -468(%rbp), %r13
	movl $1073741888, %r12d
	jmp .LB20472
.LB20470:
	movl $2019914798, -474(%rbp)
	movw $116, -470(%rbp)
	leaq -474(%rbp), %r13
	movl $1610612768, %r12d
	jmp .LB20472
.LB20557:
	movq -80(%rbp), %rcx
	leal 8(%rbx), %edx
	movslq %edi, %r15
	movl -136(%rbp,%r15,4), %eax
	movslq %eax, %r8
	callq IDEKA__ilink__lk_w32__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	leal 12(%rbx), %edx
	movl -200(%rbp,%r15,4), %eax
	movslq %eax, %r8
	callq IDEKA__ilink__lk_w32__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	leal 16(%rbx), %edx
	movl -264(%rbp,%r15,4), %eax
	movslq %eax, %r8
	callq IDEKA__ilink__lk_w32__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	leal 20(%rbx), %edx
	movl -232(%rbp,%r15,4), %eax
	movslq %eax, %r8
	callq IDEKA__ilink__lk_w32__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	leal 36(%rbx), %edx
	movslq %r12d, %r8
	callq IDEKA__ilink__lk_w32__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	leal 40(%rbx), %eax
	movq %rbx, %rcx
	movq %r13, %rdx
	movq %rax, %rbx
	movq %r12, %rax
	movq %r14, %r12
	jmp .LB20466
.LB19688:
	movl %ebx, %r12d
	subl %edi, %r12d
	movl %r12d, %ecx
	shll $1, %ecx
	addl $8, %ecx
	movl %r12d, %edx
	sarl $31, %edx
	movl %r12d, %edx
	shrl $31, %edx
	addl %r12d, %edx
	sarl $1, %edx
	imull $2, %edx, %edx
	negl %edx
	addl %r12d, %edx
	leal 2(%rcx), %r8d
	testl %edx, %edx
	movl %ecx, %r13d
	cmovne %r8d, %r13d
	movslq %eax, %rdx
	leaq -104(%rbp), %rcx
	callq IDEKA__ilink__lb_put32__2__LkBufE1_ptr1__dataE1_sbits64__ret_voidE1
	movslq %r13d, %rdx
	leaq -104(%rbp), %rcx
	callq IDEKA__ilink__lb_put32__2__LkBufE1_ptr1__dataE1_sbits64__ret_voidE1
.LB19737:
	cmpl %ebx, %edi
	jge .LB19739
.LB19738:
	movq 552(%rsi), %rax
	movslq %edi, %rcx
	movl (%rax,%rcx,4), %eax
	movl %eax, %ecx
	sarl $31, %ecx
	shrl $20, %ecx
	addl %eax, %ecx
	sarl $12, %ecx
	imull $4096, %ecx, %ecx
	subl %ecx, %eax
	addl $40960, %eax
	movslq %eax, %rdx
	leaq -104(%rbp), %rcx
	callq IDEKA__ilink__lb_put16__2__LkBufE1_ptr1__dataE1_sbits64__ret_voidE1
	incl %edi
	cmpl %ebx, %edi
	jl .LB19738
.LB19739:
	movl %r12d, %eax
	sarl $31, %eax
	movl %r12d, %eax
	shrl $31, %eax
	addl %r12d, %eax
	sarl $1, %eax
	imull $2, %eax, %eax
	subl %eax, %r12d
	jne .LB19758
.LB19760:
	movq %rbx, %rdi
	jmp .LB19660
.LB19758:
	leaq -104(%rbp), %rcx
	xorl %edx, %edx
	callq IDEKA__ilink__lb_put16__2__LkBufE1_ptr1__dataE1_sbits64__ret_voidE1
	jmp .LB19760
.LB19585:
	movq %r12, -1096(%rbp)
	movq -1080(%rbp), %r10
	movq %r10, -1104(%rbp)
	movq %rcx, %r12
.LB19542:
	movq -80(%rbp), %rcx
	movl -224(%rbp), %eax
	movslq %ebx, %rbx
	movq -1120(%rbp), %rdx
	movl (%rdx,%rbx,4), %edx
	addl %edx, %eax
	movq -1088(%rbp), %rdx
	shll $3, %edx
	movq %rdx, -1112(%rbp)
	addl %eax, %edx
	movq -1104(%rbp), %r8
	callq IDEKA__ilink__lk_w64__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rcx
	movl -224(%rbp), %eax
	movq -1232(%rbp), %rdx
	movl (%rdx,%rbx,4), %edx
	addl %edx, %eax
	movq -1112(%rbp), %rdx
	addl %eax, %edx
	movq -1104(%rbp), %r8
	callq IDEKA__ilink__lk_w64__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	incl %edi
	movq %r12, %rax
	movq -1096(%rbp), %rcx
	jmp .LB19504
.LB19540:
	movslq %edx, %rdx
	movabsq $-9223372036854775808, %r8
	orq %r8, %rdx
	movq %rax, %r12
	movq %rcx, -1096(%rbp)
	movq %rdx, -1104(%rbp)
	jmp .LB19542
.LB19468:
	incl %edi
	movq %rbx, %rax
	jmp .LB19414
.LB19327:
	movl -232(%rbp), %eax
	movq 512(%rsi), %rcx
	movslq %edi, %rdx
	movq (%rcx,%rdx,8), %rcx
	movl -200(%rbp), %edx
	movslq %edx, %rdx
	subq %rdx, %rcx
	leal (%rax,%rcx), %ebx
	movq -80(%rbp), %rax
	movslq %ebx, %rcx
	movb $255, (%rax,%rcx,1)
	movq -80(%rbp), %rax
	leal 1(%rbx), %ecx
	movslq %ecx, %rcx
	movb $37, (%rax,%rcx,1)
	movq -80(%rbp), %rcx
	leal 2(%rbx), %edx
	movq 504(%rsi), %rax
	movslq %edi, %r8
	movq (%rax,%r8,8), %rax
	movq 512(%rsi), %r9
	movq (%r9,%r8,8), %r8
	addq $6, %r8
	negq %r8
	addq %rax, %r8
	callq IDEKA__ilink__lk_w32__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -80(%rbp), %rax
	leal 6(%rbx), %ecx
	movslq %ecx, %rcx
	movb $204, (%rax,%rcx,1)
	movq -80(%rbp), %rax
	leal 7(%rbx), %ecx
	movslq %ecx, %rcx
	movb $204, (%rax,%rcx,1)
	movq %rbx, %rax
	jmp .LB19329
.LB18501:
	movq -1376(%rbp), %r9
	incl %r9d
	movq %r9, -1376(%rbp)
	movq -1152(%rbp), %r10
	movq %r10, -992(%rbp)
	movq -1160(%rbp), %r10
	movq %r10, -1000(%rbp)
	movq -1168(%rbp), %r10
	movq %r10, -1008(%rbp)
	movq -1176(%rbp), %r10
	movq %r10, -1016(%rbp)
	movq -1184(%rbp), %r10
	movq %r10, -1024(%rbp)
	movq -1192(%rbp), %r10
	movq %r10, -1032(%rbp)
	movq -1200(%rbp), %r10
	movq %r10, -1040(%rbp)
	movq -1208(%rbp), %r10
	movq %r10, -1048(%rbp)
	movq -1216(%rbp), %r10
	movq %r10, -1056(%rbp)
	jmp .LB18483
.LB18534:
	movq -1352(%rbp), %rax
	movslq %eax, %rax
	movl -360(%rbp,%rax,4), %eax
	movq %rax, -1368(%rbp)
	movq 144(%rsi), %rax
	movq -1392(%rbp), %rcx
	movslq %ecx, %rcx
	movl (%rax,%rcx,4), %eax
	movq %rax, -1360(%rbp)
	movq $0, -1312(%rbp)
	movq -1152(%rbp), %rax
	movq -1160(%rbp), %rcx
	movq -1176(%rbp), %rdx
	movq -1192(%rbp), %r10
	movq %r10, -1320(%rbp)
	movq -1200(%rbp), %r10
	movq %r10, -1328(%rbp)
	movq -1208(%rbp), %r10
	movq %r10, -1336(%rbp)
	movq -1216(%rbp), %r10
	movq %r10, -1344(%rbp)
.LB18547:
	movq -1312(%rbp), %r9
	movq -1360(%rbp), %r12
	cmpl %r12d, %r9d
	jge .LB18549
.LB18548:
	movq 136(%rsi), %rax
	movq -1392(%rbp), %rcx
	movslq %ecx, %rcx
	movl (%rax,%rcx,4), %eax
	movq -1312(%rbp), %rcx
	imull $10, %ecx, %ecx
	leal (%rax,%rcx), %edi
	movq 56(%rsi), %rax
	movq -1376(%rbp), %rcx
	movslq %ecx, %rcx
	movl (%rax,%rcx,4), %r12d
	leal 4(%rdi), %edx
	movq %rbx, %rcx
	callq IDEKA__ilink__lk_r32__2__byteE1_ptr1__intE1__ret_dataE1_sbits64
	addl %eax, %r12d
	movq %r12, -1472(%rbp)
	leal 8(%rdi), %edx
	movq %rbx, %rcx
	callq IDEKA__ilink__lk_r16__2__byteE1_ptr1__intE1__ret_intE1
	movq %rax, -1400(%rbp)
	movq -1368(%rbp), %rax
	movslq %eax, %rax
	movl -232(%rbp,%rax,4), %eax
	movq 168(%rsi), %rcx
	movq -1392(%rbp), %rdx
	movslq %edx, %r12
	movl (%rcx,%r12,4), %ecx
	addl %ecx, %eax
	movq %rax, -1384(%rbp)
	movq %rbx, %rcx
	movq %rdi, %rdx
	callq IDEKA__ilink__lk_r32__2__byteE1_ptr1__intE1__ret_dataE1_sbits64
	movq -1384(%rbp), %rcx
	leal (%rcx,%rax), %r13d
	movq 176(%rsi), %rax
	movq (%rax,%r12,8), %r12
	movq %rbx, %rcx
	movq %rdi, %rdx
	callq IDEKA__ilink__lk_r32__2__byteE1_ptr1__intE1__ret_dataE1_sbits64
	addq %rax, %r12
	movq 224(%rsi), %rax
	movq -1472(%rbp), %rcx
	movslq %ecx, %rcx
	movl (%rax,%rcx,4), %r14d
	testl %r14d, %r14d
	jns .LB18617
.LB18618:
	movq 232(%rsi), %rax
	movl (%rax,%rcx,4), %eax
	testl %eax, %eax
	jns .LB18632
.LB18633:
	cmpl $4294967293, %eax
	je .LB18680
.LB18681:
	movq $0, -1408(%rbp)
.LB18619:
	movq -1400(%rbp), %rax
	movq %rax, %r11
	subq $1, %r11
	cmpq $10, %r11
	ja .LB18696
	leaq .LJT22431(%rip), %r10
	jmpq *(%r10,%r11,8)
.LB18695:
	movq -80(%rbp), %rcx
	movq %r13, %rdx
	callq IDEKA__ilink__lk_r32s__2__byteE1_ptr1__intE1__ret_dataE1_sbits64
	movq %rax, -1416(%rbp)
	testl %r14d, %r14d
	js .LB19228
.LB19215:
	movq 208(%rsi), %rax
	movslq %r14d, %rcx
	movl (%rax,%rcx,4), %eax
	cmpl $0, %eax
	jg .LB19226
.LB19228:
	movq -1416(%rbp), %rax
	movq -1344(%rbp), %rcx
.LB18684:
	movq -1312(%rbp), %rdx
	incl %edx
	movq %rdx, -1312(%rbp)
	movq -1472(%rbp), %r8
	movq %r13, %rdx
	movq -1408(%rbp), %r10
	movq %r10, -1320(%rbp)
	movq %r12, -1328(%rbp)
	movq %rax, -1336(%rbp)
	movq %rcx, -1344(%rbp)
	movq -1400(%rbp), %rax
	movq %rdi, %rcx
	movq %r14, %rdi
	jmp .LB18547
.LB18549:
	movq -1360(%rbp), %r10
	movq %r10, -1240(%rbp)
	movq %rdx, -1248(%rbp)
	movq -1368(%rbp), %r10
	movq %r10, -1256(%rbp)
	movq -1320(%rbp), %r10
	movq %r10, -1264(%rbp)
	movq -1328(%rbp), %r10
	movq %r10, -1272(%rbp)
	movq -1336(%rbp), %r10
	movq %r10, -1280(%rbp)
	movq -1344(%rbp), %r10
	movq %r10, -1288(%rbp)
	movq -1312(%rbp), %rdx
	jmp .LB18536
.LB18680:
	movq $0, -1408(%rbp)
	jmp .LB18619
.LB18632:
	movq 240(%rsi), %rcx
	movq -1472(%rbp), %rdx
	movslq %edx, %rdx
	movl (%rcx,%rdx,4), %ecx
	cmpl $1, %ecx
	je .LB18642
.LB18643:
	movq 512(%rsi), %rcx
	movslq %eax, %rax
	movq (%rcx,%rax,8), %rax
.LB18644:
	movq %rax, -1408(%rbp)
	jmp .LB18619
.LB18642:
	movq 504(%rsi), %rcx
	movslq %eax, %rax
	movq (%rcx,%rax,8), %rax
	jmp .LB18644
.LB18617:
	movq %rsi, %rcx
	movq %r14, %rdx
	callq IDEKA__ilink__pe_symrva__2__PeLinkE1_ptr1__intE1__ret_dataE1_sbits64
	movq %rax, -1408(%rbp)
	jmp .LB18619
.LB19226:
	movq -80(%rbp), %rcx
	movq %rcx, -1520(%rbp)
	movq -1416(%rbp), %rcx
	movq -1408(%rbp), %rdx
	addq %rdx, %rcx
	movq 160(%rsi), %rdx
	movq 48(%rsi), %r8
	movq 192(%rsi), %r9
	movq %r9, -1424(%rbp)
	movslq %r14d, %r15
	movq %r15, -1432(%rbp)
	movl (%r9,%r15,4), %r9d
	movq %r9, -1440(%rbp)
	movslq %r9d, %r9
	movq %r9, -1448(%rbp)
	movl (%r8,%r9,4), %r8d
	addl %eax, %r8d
	decl %r8d
	movslq %r8d, %rax
	movl (%rdx,%rax,4), %eax
	movslq %eax, %rax
	movl -360(%rbp,%rax,4), %eax
	movslq %eax, %rax
	movl -200(%rbp,%rax,4), %eax
	movslq %eax, %rax
	movq %rcx, %r8
	subq %rax, %r8
	movq -1520(%rbp), %rcx
	movq %r13, %rdx
	callq IDEKA__ilink__lk_w32__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	jmp .LB19228
.LB18694:
	testl %r14d, %r14d
	js .LB19168
.LB19155:
	movq 208(%rsi), %rax
	movslq %r14d, %rcx
	movl (%rax,%rcx,4), %eax
	cmpl $0, %eax
	jg .LB19166
.LB19168:
	movq -1336(%rbp), %rax
	movq -1344(%rbp), %rcx
	jmp .LB18684
.LB19166:
	movq -80(%rbp), %rcx
	movq 160(%rsi), %rdx
	movq 48(%rsi), %r8
	movq 192(%rsi), %r9
	movslq %r14d, %r15
	movq %r15, -1456(%rbp)
	movl (%r9,%r15,4), %r9d
	movslq %r9d, %r9
	movl (%r8,%r9,4), %r8d
	addl %eax, %r8d
	decl %r8d
	movslq %r8d, %rax
	movl (%rdx,%rax,4), %eax
	movslq %eax, %rax
	movl -360(%rbp,%rax,4), %eax
	movslq %eax, %rax
	movl -328(%rbp,%rax,4), %eax
	movslq %eax, %r8
	movq %r13, %rdx
	callq IDEKA__ilink__lk_w16__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	jmp .LB19168
.LB18693:
	movq -80(%rbp), %rcx
	movq %r13, %rdx
	callq IDEKA__ilink__lk_r32s__2__byteE1_ptr1__intE1__ret_dataE1_sbits64
	movq %rax, -1464(%rbp)
	movq -1408(%rbp), %rcx
	addq %rcx, %rax
	leaq 9(%r12), %rcx
	movq %rax, %r15
	subq %rcx, %r15
	cmpq $-2147483648, %r15
	jl .LB19115
.LB19109:
	cmpq $2147483647, %r15
	jg .LB19115
.LB19116:
	movq -80(%rbp), %rcx
	movq %r13, %rdx
	movq %r15, %r8
	callq IDEKA__ilink__lk_w32__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -1464(%rbp), %rax
	movq %r15, %rcx
	jmp .LB18684
.LB19115:
	movl $1869374834, -498(%rbp)
	movl $1769234787, -494(%rbp)
	movl $1864396399, -490(%rbp)
	movl $1864397941, -486(%rbp)
	movl $1634869350, -482(%rbp)
	movl $6645614, -478(%rbp)
	leaq -498(%rbp), %rdx
	movq %rsi, %rcx
	callq IDEKA__ilink__pe_fail__2__PeLinkE1_ptr1__byteE1_ptr1__ret_boolE1
	movzbl %al, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB18692:
	movq -80(%rbp), %rcx
	movq %r13, %rdx
	callq IDEKA__ilink__lk_r32s__2__byteE1_ptr1__intE1__ret_dataE1_sbits64
	movq %rax, -1480(%rbp)
	movq -1408(%rbp), %rcx
	addq %rcx, %rax
	leaq 8(%r12), %rcx
	movq %rax, %r15
	subq %rcx, %r15
	cmpq $-2147483648, %r15
	jl .LB19055
.LB19049:
	cmpq $2147483647, %r15
	jg .LB19055
.LB19056:
	movq -80(%rbp), %rcx
	movq %r13, %rdx
	movq %r15, %r8
	callq IDEKA__ilink__lk_w32__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -1480(%rbp), %rax
	movq %r15, %rcx
	jmp .LB18684
.LB19055:
	movl $1869374834, -522(%rbp)
	movl $1769234787, -518(%rbp)
	movl $1864396399, -514(%rbp)
	movl $1864397941, -510(%rbp)
	movl $1634869350, -506(%rbp)
	movl $6645614, -502(%rbp)
	leaq -522(%rbp), %rdx
	movq %rsi, %rcx
	callq IDEKA__ilink__pe_fail__2__PeLinkE1_ptr1__byteE1_ptr1__ret_boolE1
	movzbl %al, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB18691:
	movq -80(%rbp), %rcx
	movq %r13, %rdx
	callq IDEKA__ilink__lk_r32s__2__byteE1_ptr1__intE1__ret_dataE1_sbits64
	movq %rax, -1488(%rbp)
	movq -1408(%rbp), %rcx
	addq %rcx, %rax
	leaq 7(%r12), %rcx
	movq %rax, %r15
	subq %rcx, %r15
	cmpq $-2147483648, %r15
	jl .LB18995
.LB18989:
	cmpq $2147483647, %r15
	jg .LB18995
.LB18996:
	movq -80(%rbp), %rcx
	movq %r13, %rdx
	movq %r15, %r8
	callq IDEKA__ilink__lk_w32__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -1488(%rbp), %rax
	movq %r15, %rcx
	jmp .LB18684
.LB18995:
	movl $1869374834, -546(%rbp)
	movl $1769234787, -542(%rbp)
	movl $1864396399, -538(%rbp)
	movl $1864397941, -534(%rbp)
	movl $1634869350, -530(%rbp)
	movl $6645614, -526(%rbp)
	leaq -546(%rbp), %rdx
	movq %rsi, %rcx
	callq IDEKA__ilink__pe_fail__2__PeLinkE1_ptr1__byteE1_ptr1__ret_boolE1
	movzbl %al, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB18690:
	movq -80(%rbp), %rcx
	movq %r13, %rdx
	callq IDEKA__ilink__lk_r32s__2__byteE1_ptr1__intE1__ret_dataE1_sbits64
	movq %rax, -1496(%rbp)
	movq -1408(%rbp), %rcx
	addq %rcx, %rax
	leaq 6(%r12), %rcx
	movq %rax, %r15
	subq %rcx, %r15
	cmpq $-2147483648, %r15
	jl .LB18935
.LB18929:
	cmpq $2147483647, %r15
	jg .LB18935
.LB18936:
	movq -80(%rbp), %rcx
	movq %r13, %rdx
	movq %r15, %r8
	callq IDEKA__ilink__lk_w32__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -1496(%rbp), %rax
	movq %r15, %rcx
	jmp .LB18684
.LB18935:
	movl $1869374834, -570(%rbp)
	movl $1769234787, -566(%rbp)
	movl $1864396399, -562(%rbp)
	movl $1864397941, -558(%rbp)
	movl $1634869350, -554(%rbp)
	movl $6645614, -550(%rbp)
	leaq -570(%rbp), %rdx
	movq %rsi, %rcx
	callq IDEKA__ilink__pe_fail__2__PeLinkE1_ptr1__byteE1_ptr1__ret_boolE1
	movzbl %al, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB18689:
	movq -80(%rbp), %rcx
	movq %r13, %rdx
	callq IDEKA__ilink__lk_r32s__2__byteE1_ptr1__intE1__ret_dataE1_sbits64
	movq %rax, -1504(%rbp)
	movq -1408(%rbp), %rcx
	addq %rcx, %rax
	leaq 5(%r12), %rcx
	movq %rax, %r15
	subq %rcx, %r15
	cmpq $-2147483648, %r15
	jl .LB18875
.LB18869:
	cmpq $2147483647, %r15
	jg .LB18875
.LB18876:
	movq -80(%rbp), %rcx
	movq %r13, %rdx
	movq %r15, %r8
	callq IDEKA__ilink__lk_w32__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -1504(%rbp), %rax
	movq %r15, %rcx
	jmp .LB18684
.LB18875:
	movl $1869374834, -594(%rbp)
	movl $1769234787, -590(%rbp)
	movl $1864396399, -586(%rbp)
	movl $1864397941, -582(%rbp)
	movl $1634869350, -578(%rbp)
	movl $6645614, -574(%rbp)
	leaq -594(%rbp), %rdx
	movq %rsi, %rcx
	callq IDEKA__ilink__pe_fail__2__PeLinkE1_ptr1__byteE1_ptr1__ret_boolE1
	movzbl %al, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB18688:
	movq -80(%rbp), %rcx
	movq %r13, %rdx
	callq IDEKA__ilink__lk_r32s__2__byteE1_ptr1__intE1__ret_dataE1_sbits64
	movq %rax, -1512(%rbp)
	movq -1408(%rbp), %rcx
	addq %rcx, %rax
	leaq 4(%r12), %rcx
	movq %rax, %r15
	subq %rcx, %r15
	cmpq $-2147483648, %r15
	jl .LB18815
.LB18809:
	cmpq $2147483647, %r15
	jg .LB18815
.LB18816:
	movq -80(%rbp), %rcx
	movq %r13, %rdx
	movq %r15, %r8
	callq IDEKA__ilink__lk_w32__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq -1512(%rbp), %rax
	movq %r15, %rcx
	jmp .LB18684
.LB18815:
	movl $1869374834, -618(%rbp)
	movl $1769234787, -614(%rbp)
	movl $1864396399, -610(%rbp)
	movl $1864397941, -606(%rbp)
	movl $1634869350, -602(%rbp)
	movl $6645614, -598(%rbp)
	leaq -618(%rbp), %rdx
	movq %rsi, %rcx
	callq IDEKA__ilink__pe_fail__2__PeLinkE1_ptr1__byteE1_ptr1__ret_boolE1
	movzbl %al, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB18687:
	movq -80(%rbp), %rcx
	movq %r13, %rdx
	callq IDEKA__ilink__lk_r32s__2__byteE1_ptr1__intE1__ret_dataE1_sbits64
	movq %rax, %r15
	movq -80(%rbp), %rcx
	movq -1408(%rbp), %rax
	leaq (%r15,%rax), %r8
	movq %r13, %rdx
	callq IDEKA__ilink__lk_w32__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movq %r15, %rax
	movq -1344(%rbp), %rcx
	jmp .LB18684
.LB18686:
	movl $1646277171, -675(%rbp)
	movl $1629516905, -671(%rbp)
	movl $1819243362, -667(%rbp)
	movl $543519861, -663(%rbp)
	movl $1869374834, -659(%rbp)
	movl $1769234787, -655(%rbp)
	movl $1847619183, -651(%rbp)
	movl $1935959397, -647(%rbp)
	movl $544104736, -643(%rbp)
	movl $1734438249, -639(%rbp)
	movl $1633820773, -635(%rbp)
	movl $1646290291, -631(%rbp)
	movl $2003790949, -627(%rbp)
	movl $1111962656, -623(%rbp)
	movb $0, -619(%rbp)
	leaq -675(%rbp), %rdx
	movq %rsi, %rcx
	callq IDEKA__ilink__pe_fail__2__PeLinkE1_ptr1__byteE1_ptr1__ret_boolE1
	movzbl %al, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB18685:
	movq -80(%rbp), %rcx
	movq %r13, %rdx
	callq IDEKA__ilink__lk_r64__2__byteE1_ptr1__intE1__ret_dataE1_sbits64
	movq %rax, %r15
	movq -80(%rbp), %rcx
	movabsq $5368709120, %rax
	addq %r15, %rax
	movq -1408(%rbp), %rdx
	leaq (%rax,%rdx), %r8
	movq %r13, %rdx
	callq IDEKA__ilink__lk_w64__3__byteE1_ptr1__intE1__dataE1_sbits64__ret_voidE1
	movl %r12d, %edx
	movq %rsi, %rcx
	callq IDEKA__ilink__pe_add_br__2__PeLinkE1_ptr1__intE1__ret_voidE1
	movq %r15, %rax
	movq -1344(%rbp), %rcx
	jmp .LB18684
.LB18696:
	movl $1970499189, -703(%rbp)
	movl $1919905904, -699(%rbp)
	movl $543450484, -695(%rbp)
	movl $1869374834, -691(%rbp)
	movl $1769234787, -687(%rbp)
	movl $1948282479, -683(%rbp)
	movl $6647929, -679(%rbp)
	leaq -703(%rbp), %rdx
	movq %rsi, %rcx
	callq IDEKA__ilink__pe_fail__2__PeLinkE1_ptr1__byteE1_ptr1__ret_boolE1
	movzbl %al, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB18417:
	movq 16(%rsi), %rdx
	movq 96(%rsi), %rdi
	movslq %eax, %r8
	movl (%rdi,%r8,4), %edi
	movslq %edi, %rdi
	movq (%rdx,%rdi,8), %r8
	movslq %ecx, %rdx
	movl -360(%rbp,%rdx,4), %edi
	xorl %edx, %edx
.LB18436:
	movq 120(%rsi), %r9
	movslq %eax, %rbx
	movl (%r9,%rbx,4), %r9d
	cmpl %r9d, %edx
	jge .LB18438
.LB18437:
	movq 128(%rsi), %r9
	movslq %eax, %rbx
	movl (%r9,%rbx,4), %r9d
	addl %edx, %r9d
	movslq %r9d, %r9
	movzbl (%r8,%r9,1), %r9d
	movq -80(%rbp), %rbx
	movslq %edi, %r12
	movl -232(%rbp,%r12,4), %r12d
	movq 168(%rsi), %r13
	movslq %eax, %r14
	movl (%r13,%r14,4), %r13d
	addl %r13d, %r12d
	addl %edx, %r12d
	movslq %r12d, %r12
	movb %r9b, (%rbx,%r12,1)
	incl %edx
	jmp .LB18436
.LB18438:
	jmp .LB18419
.LB18345:
	movl $544503151, -717(%rbp)
	movl $1830839919, -713(%rbp)
	movl $1919905125, -709(%rbp)
	movw $121, -705(%rbp)
	leaq -717(%rbp), %rdx
	movq %rsi, %rcx
	callq IDEKA__ilink__pe_fail__2__PeLinkE1_ptr1__byteE1_ptr1__ret_boolE1
	movzbl %al, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB18297:
	movl $1920233061, -751(%rbp)
	movl $1869619321, -747(%rbp)
	movl $544501353, -743(%rbp)
	movl $1651341683, -739(%rbp)
	movl $1763732591, -735(%rbp)
	movl $1869488243, -731(%rbp)
	movl $1701060724, -727(%rbp)
	movl $1701734758, -723(%rbp)
	movw $100, -719(%rbp)
	leaq -751(%rbp), %rdx
	movq %rsi, %rcx
	callq IDEKA__ilink__pe_fail__2__PeLinkE1_ptr1__byteE1_ptr1__ret_boolE1
	movzbl %al, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB18289:
	movq -968(%rbp), %rax
	jmp .LB18291
.LB18218:
	movl -200(%rbp), %eax
	movq 512(%rsi), %rcx
	movq -960(%rbp), %rdx
	movslq %edx, %rdx
	leaq (%rcx,%rdx,8), %rcx
	movq (%rcx), %rdx
	movslq %eax, %rax
	addq %rdx, %rax
	movq %rax, (%rcx)
	jmp .LB18220
.LB18135:
	movl -180(%rbp), %ecx
	movq 248(%rsi), %rdx
	movslq %eax, %rdi
	leaq (%rdx,%rdi,8), %rdx
	movq (%rdx), %rdi
	movslq %ecx, %rcx
	addq %rdi, %rcx
	movq %rcx, (%rdx)
	jmp .LB18137
.LB18055:
	movslq %ecx, %rdx
	movl -360(%rbp,%rdx,4), %edx
	movslq %edx, %rdi
	movl -200(%rbp,%rdi,4), %edi
	movq 168(%rsi), %r8
	movslq %eax, %r9
	movl (%r8,%r9,4), %r8d
	addl %r8d, %edi
	movq 176(%rsi), %r8
	movslq %edi, %rdi
	movq %rdi, (%r8,%r9,8)
	jmp .LB18057
.LB17987:
	movq -920(%rbp), %rcx
	movslq %ecx, %rdi
	movq -928(%rbp), %rcx
	movl %ecx, -200(%rbp,%rdi,4)
	movl %eax, -328(%rbp,%rdi,4)
	leal 1(%rax), %ebx
	movl -136(%rbp,%rdi,4), %eax
	addl %eax, %ecx
	movslq %ecx, %rcx
	movq $4096, %rdx
	callq IDEKA__ilink__lk_align_up__2__dataE1_sbits64__dataE1_sbits64__ret_dataE1_sbits64
	movl %eax, %r12d
	movq -920(%rbp), %rax
	cmpl $5, %eax
	je .LB18009
.LB18010:
	movl -136(%rbp,%rdi,4), %eax
	movslq %eax, %rcx
	movq $512, %rdx
	callq IDEKA__ilink__lk_align_up__2__dataE1_sbits64__dataE1_sbits64__ret_dataE1_sbits64
	movl %eax, -264(%rbp,%rdi,4)
	movq -936(%rbp), %rax
	movl %eax, -232(%rbp,%rdi,4)
	movl -264(%rbp,%rdi,4), %ecx
	addl %ecx, %eax
.LB18011:
	movq %r12, %rcx
	movq %rax, %rdx
	movq %rbx, %rax
	jmp .LB17989
.LB18009:
	movq -920(%rbp), %rax
	movslq %eax, %rax
	movl $0, -264(%rbp,%rax,4)
	movl $0, -232(%rbp,%rax,4)
	movq -936(%rbp), %rax
	jmp .LB18011
.LB17951:
	movl $1, -296(%rbp,%rcx,4)
	incl %eax
	jmp .LB17953
.LB17883:
	movslq %r8d, %rax
	movq -808(%rbp), %r8
	movl %ecx, (%r8,%rax,4)
	leal 2(%rcx), %ebx
	movq 440(%rsi), %rax
	movl (%rdx), %ecx
	movslq %ecx, %rcx
	movq (%rax,%rcx,8), %rcx
	callq IDEKA__ilink__lk_strlen__1__byteE1_ptr1__ret_intE1
	addl %eax, %ebx
	incl %ebx
	movl %ebx, %eax
	sarl $31, %eax
	movl %ebx, %eax
	shrl $31, %eax
	addl %ebx, %eax
	sarl $1, %eax
	imull $2, %eax, %eax
	negl %eax
	addl %ebx, %eax
	leal 1(%rbx), %ecx
	testl %eax, %eax
	cmove %ebx, %ecx
	jmp .LB17885
.LB17730:
	movq 488(%rsi), %rax
	movl %ebx, (%rax,%r12,4)
	movslq %ebx, %rax
	movq -1224(%rbp), %rcx
	movl (%rcx,%rax,4), %ecx
	leaq (%rdi,%rax,4), %rax
	movl (%rax), %edx
	addl %edx, %ecx
	movq 496(%rsi), %rdx
	movq -832(%rbp), %r8
	movslq %r8d, %r9
	movl %ecx, (%rdx,%r9,4)
	movq 496(%rsi), %rcx
	movl (%rcx,%r9,4), %ecx
	movslq %ecx, %rcx
	movq -800(%rbp), %rdx
	movl %r8d, (%rdx,%rcx,4)
	movl (%rax), %ecx
	incl %ecx
	movl %ecx, (%rax)
	movq -832(%rbp), %rax
	incl %eax
	movq %rax, -832(%rbp)
	jmp .LB17719
.LB17645:
	movq -824(%rbp), %rax
	cmpl %eax, %ebx
	je .LB17670
.LB17671:
	movq -824(%rbp), %rax
.LB17672:
	movslq %ebx, %rcx
	leaq (%rdi,%rcx,4), %rcx
	movl (%rcx), %edx
	incl %edx
	movl %edx, (%rcx)
	movq -816(%rbp), %rcx
	incl %ecx
	movq %rcx, -816(%rbp)
	movq %rax, -824(%rbp)
	jmp .LB17634
.LB17670:
	movq 448(%rsi), %rax
	movq -816(%rbp), %rcx
	movslq %ecx, %rcx
	movq (%rax,%rcx,8), %rax
	movq -824(%rbp), %rcx
	movslq %ecx, %rdx
	movq -1304(%rbp), %r8
	movq %rax, (%r8,%rdx,8)
	movl $0, (%rdi,%rdx,4)
	leal 1(%rcx), %eax
	jmp .LB17672
.LB17537:
	movq 512(%rsi), %rdi
	movslq %edx, %r8
	movslq %ecx, %r9
	movq %r8, (%rdi,%r9,8)
	addl $8, %edx
	jmp .LB17539
.LB17477:
	movl -116(%rbp), %eax
	movslq %eax, %rcx
	movq $16, %rdx
	callq IDEKA__ilink__lk_align_up__2__dataE1_sbits64__dataE1_sbits64__ret_dataE1_sbits64
	movq 248(%rsi), %rcx
	movslq %edi, %rdx
	movq %rax, (%rcx,%rdx,8)
	movq 248(%rsi), %rax
	movq (%rax,%rdx,8), %rax
	movq 200(%rsi), %rcx
	movq (%rcx,%rdx,8), %rcx
	addl %ecx, %eax
	movl %eax, -116(%rbp)
	jmp .LB17479
.LB17355:
	movslq %eax, %rax
	movl -360(%rbp,%rax,4), %ebx
	movslq %ebx, %rax
	movl -136(%rbp,%rax,4), %eax
	movq 152(%rsi), %rcx
	movslq %edi, %r12
	movl (%rcx,%r12,4), %ecx
	movslq %eax, %rax
	movslq %ecx, %rdx
	movq %rax, %rcx
	callq IDEKA__ilink__lk_align_up__2__dataE1_sbits64__dataE1_sbits64__ret_dataE1_sbits64
	movq 168(%rsi), %rcx
	movl %eax, (%rcx,%r12,4)
	movq 168(%rsi), %rax
	movl (%rax,%r12,4), %eax
	movq 120(%rsi), %rcx
	movl (%rcx,%r12,4), %ecx
	addl %ecx, %eax
	movslq %ebx, %rcx
	movl %eax, -136(%rbp,%rcx,4)
	movq 152(%rsi), %rax
	movslq %edi, %rcx
	movl (%rax,%rcx,4), %eax
	movslq %ebx, %rcx
	movl -168(%rbp,%rcx,4), %ecx
	cmpl %ecx, %eax
	jg .LB17411
.LB17413:
	movq %rbx, %rax
	jmp .LB17357
.LB17411:
	movslq %ebx, %rcx
	movl %eax, -168(%rbp,%rcx,4)
	jmp .LB17413
	.section .rodata
	.p2align 3
.LJT22431:
	.quad .LB18685
	.quad .LB18686
	.quad .LB18687
	.quad .LB18688
	.quad .LB18689
	.quad .LB18690
	.quad .LB18691
	.quad .LB18692
	.quad .LB18693
	.quad .LB18694
	.quad .LB18695
	.text
	.text
	.globl IDEKA__ilink__lk_pe_link__10__byteE1_ptr2__intE1__byteE1_ptr2__intE1__byteE1_ptr2__intE1__byteE1_ptr1__intE1__dataE1_sbits64__byteE1_ptr1__ret_byteE1_ptr1
	.def IDEKA__ilink__lk_pe_link__10__byteE1_ptr2__intE1__byteE1_ptr2__intE1__byteE1_ptr2__intE1__byteE1_ptr1__intE1__dataE1_sbits64__byteE1_ptr1__ret_byteE1_ptr1;
	.scl 2;
	.type 32;
	.endef
IDEKA__ilink__lk_pe_link__10__byteE1_ptr2__intE1__byteE1_ptr2__intE1__byteE1_ptr2__intE1__byteE1_ptr1__intE1__dataE1_sbits64__byteE1_ptr1__ret_byteE1_ptr1:
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
.LB20677:
	movq %rcx, %rbx
	movl %edx, %r12d
	movq %r8, %r13
	movq %r9, -696(%rbp)
	movq 48(%rbp), %r14
	movl 56(%rbp), %r15d
	movq 64(%rbp), %rax
	movq %rax, -704(%rbp)
	movl 72(%rbp), %eax
	movq %rax, -712(%rbp)
	movq 80(%rbp), %rax
	movq %rax, -720(%rbp)
	movq 88(%rbp), %rax
	movq %rax, -728(%rbp)
	leaq .LZERO(%rip), %rsi
	leaq -616(%rbp), %rdi
	movq $560, %rcx
	rep movsb
	movl $0, -620(%rbp)
	movq $0, -616(%rbp)
	movl $0, -608(%rbp)
	leal 64(%r12), %eax
	movl %eax, -604(%rbp)
	movl $0, -352(%rbp)
	movl $0, -320(%rbp)
	movl $1024, -316(%rbp)
	movl $0, -208(%rbp)
	movl $0, -184(%rbp)
	movl $0, -72(%rbp)
	movl $1024, -68(%rbp)
	movl -604(%rbp), %eax
	shll $3, %eax
	movslq %eax, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -600(%rbp)
	movl -604(%rbp), %eax
	shll $2, %eax
	movslq %eax, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -592(%rbp)
	movl -68(%rbp), %eax
	shll $2, %eax
	movslq %eax, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -64(%rbp)
	movq -696(%rbp), %rax
	leal 1(%rax), %esi
	movl %esi, %eax
	shll $3, %eax
	movslq %eax, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -344(%rbp)
	shll $2, %esi
	movslq %esi, %rsi
	movq %rsi, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -336(%rbp)
	movq %rsi, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -328(%rbp)
	movl -316(%rbp), %eax
	shll $2, %eax
	movslq %eax, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -312(%rbp)
	movl -316(%rbp), %eax
	shll $2, %eax
	movslq %eax, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -304(%rbp)
	movl -316(%rbp), %eax
	shll $2, %eax
	movslq %eax, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -296(%rbp)
	movl -316(%rbp), %eax
	shll $3, %eax
	movslq %eax, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -288(%rbp)
	movl -316(%rbp), %eax
	shll $3, %eax
	movslq %eax, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -280(%rbp)
	movl -316(%rbp), %eax
	shll $2, %eax
	movslq %eax, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -272(%rbp)
	movl -316(%rbp), %eax
	shll $2, %eax
	movslq %eax, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -264(%rbp)
	leaq -256(%rbp), %rcx
	movq $4096, %rdx
	callq IDEKA__ilink__lm_init__2__LkMapE1_ptr1__intE1__ret_voidE1
	movslq %r12d, %rax
	movq %rax, -736(%rbp)
	movl $1, %esi
	xorl %edi, %edi
.LB20823:
	movq -736(%rbp), %rax
	cmpq %rax, %rdi
	jge .LB20825
.LB20829:
	testb %sil, %sil
	je .LB20825
.LB20824:
	movl $0, -620(%rbp)
	movq (%rbx,%rdi,8), %rcx
	leaq -620(%rbp), %rdx
	callq IDEKA__ilink__lk_read_file__2__byteE1_ptr1__intE1_ptr1__ret_byteE1_ptr1
	movq %rax, %r12
	testq %r12, %r12
	je .LB20844
.LB20845:
	movl -620(%rbp), %edx
	movq %r12, %rcx
	callq IDEKA__ilink__pe_is_coff__2__byteE1_ptr1__intE1__ret_boolE1
	testb %al, %al
	je .LB20882
.LB20883:
	movl -620(%rbp), %r8d
	leaq -616(%rbp), %rcx
	movq %r12, %rdx
	callq IDEKA__ilink__pe_add_obj__3__PeLinkE1_ptr1__byteE1_ptr1__intE1__ret_intE1
.LB20846:
	incq %rdi
	jmp .LB20823
.LB20825:
	movq -696(%rbp), %rax
	movslq %eax, %rdi
	xorl %ebx, %ebx
.LB20927:
	cmpq %rdi, %rbx
	jge .LB20929
.LB20933:
	testb %sil, %sil
	je .LB20929
.LB20928:
	movq (%r13,%rbx,8), %rdx
	leaq -616(%rbp), %rcx
	movq %r14, %r8
	movq %r15, %r9
	callq IDEKA__ilink__pe_open_lib__4__PeLinkE1_ptr1__byteE1_ptr1__byteE1_ptr2__intE1__ret_boolE1
	movzbl %al, %esi
	incq %rbx
	cmpq %rdi, %rbx
	jl .LB20933
.LB20929:
	testb %sil, %sil
	je .LB20948
.LB20949:
	leaq -232(%rbp), %rcx
	movq $4096, %rdx
	callq IDEKA__ilink__lm_init__2__LkMapE1_ptr1__intE1__ret_voidE1
	movl -320(%rbp), %eax
	addl $8, %eax
	shll $2, %eax
	movslq %eax, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -200(%rbp)
	movl -320(%rbp), %eax
	addl $8, %eax
	shll $2, %eax
	movslq %eax, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -192(%rbp)
	leaq -616(%rbp), %rcx
	callq IDEKA__ilink__pe_pull_members__1__PeLinkE1_ptr1__ret_boolE1
	movzbl %al, %esi
	testb %sil, %sil
	je .LB20979
.LB20980:
	movl -608(%rbp), %eax
	incl %eax
	shll $2, %eax
	movslq %eax, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -568(%rbp)
	movl -608(%rbp), %eax
	incl %eax
	shll $2, %eax
	movslq %eax, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -584(%rbp)
	movl -608(%rbp), %eax
	incl %eax
	shll $2, %eax
	movslq %eax, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -560(%rbp)
	movl -608(%rbp), %eax
	incl %eax
	shll $2, %eax
	movslq %eax, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -576(%rbp)
	xorl %edi, %edi
	xorl %ebx, %ebx
	xorl %r12d, %r12d
.LB21026:
	movl -608(%rbp), %eax
	cmpl %eax, %edi
	jge .LB21028
.LB21027:
	movq -600(%rbp), %rax
	movslq %edi, %r13
	movq (%rax,%r13,8), %rcx
	movq $2, %rdx
	callq IDEKA__ilink__lk_r16__2__byteE1_ptr1__intE1__ret_intE1
	movq -584(%rbp), %rcx
	movl %eax, (%rcx,%r13,4)
	movq -600(%rbp), %rax
	movq (%rax,%r13,8), %rcx
	movq $12, %rdx
	callq IDEKA__ilink__lk_r32__2__byteE1_ptr1__intE1__ret_dataE1_sbits64
	movq -576(%rbp), %rcx
	movl %eax, (%rcx,%r13,4)
	movq -568(%rbp), %rax
	movl %ebx, (%rax,%r13,4)
	movq -560(%rbp), %rax
	movl %r12d, (%rax,%r13,4)
	movq -584(%rbp), %rax
	movl (%rax,%r13,4), %eax
	addl %eax, %ebx
	movq -576(%rbp), %rax
	movl (%rax,%r13,4), %eax
	addl %eax, %r12d
	incl %edi
	jmp .LB21026
.LB21028:
	movl %ebx, -528(%rbp)
	movl %r12d, -524(%rbp)
	incl %ebx
	movl %ebx, %eax
	shll $2, %eax
	movslq %eax, %rdi
	movq %rdi, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -520(%rbp)
	shll $3, %ebx
	movslq %ebx, %rbx
	movq %rbx, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -512(%rbp)
	movq %rbx, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -504(%rbp)
	movq %rdi, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -496(%rbp)
	movq %rdi, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -488(%rbp)
	movq %rdi, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -480(%rbp)
	movq %rdi, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -472(%rbp)
	movq %rdi, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -464(%rbp)
	movq %rdi, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -456(%rbp)
	movq %rdi, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -448(%rbp)
	movq %rbx, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -440(%rbp)
	leal 1(%r12), %edi
	movl %edi, %eax
	shll $3, %eax
	movslq %eax, %rbx
	movq %rbx, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -432(%rbp)
	shll $2, %edi
	movslq %edi, %rdi
	movq %rdi, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -424(%rbp)
	movq %rbx, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -416(%rbp)
	movq %rdi, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -408(%rbp)
	movq %rdi, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -400(%rbp)
	movq %rdi, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -392(%rbp)
	movq %rdi, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -384(%rbp)
	movq %rdi, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -376(%rbp)
	movq %rbx, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -368(%rbp)
	movq %rdi, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -360(%rbp)
	addl $4, %r12d
	movl %r12d, %eax
	shll $3, %eax
	movslq %eax, %rdi
	movq %rdi, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -176(%rbp)
	movq %rdi, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -168(%rbp)
	shll $2, %r12d
	movslq %r12d, %rbx
	movq %rbx, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -160(%rbp)
	movq %rbx, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -152(%rbp)
	movq %rbx, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -144(%rbp)
	movq %rbx, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -136(%rbp)
	movq %rbx, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -128(%rbp)
	movq %rbx, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -120(%rbp)
	movq %rdi, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -112(%rbp)
	movq %rdi, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -104(%rbp)
	leaq -96(%rbp), %rcx
	movq $256, %rdx
	callq IDEKA__ilink__lm_init__2__LkMapE1_ptr1__intE1__ret_voidE1
	movq %rsi, %rax
	xorl %esi, %esi
.LB21299:
	movl -608(%rbp), %ecx
	cmpl %ecx, %esi
	jge .LB21301
.LB21308:
	testb %al, %al
	je .LB21301
.LB21300:
	leaq -616(%rbp), %rcx
	movq %rsi, %rdx
	callq IDEKA__ilink__pe_load_obj__2__PeLinkE1_ptr1__intE1__ret_boolE1
	movzbl %al, %eax
	incl %esi
	jmp .LB21299
.LB21301:
	testb %al, %al
	jne .LB21317
.LB21318:
.LB21319:
	testb %al, %al
	jne .LB21322
.LB21323:
.LB21324:
	testb %al, %al
	jne .LB21327
.LB21328:
	movq -616(%rbp), %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB21317:
	leaq -616(%rbp), %rcx
	callq IDEKA__ilink__pe_resolve__1__PeLinkE1_ptr1__ret_boolE1
	movzbl %al, %eax
	testb %al, %al
	je .LB21323
.LB21322:
	leaq -616(%rbp), %rcx
	callq IDEKA__ilink__pe_scan_relocs__1__PeLinkE1_ptr1__ret_boolE1
	movzbl %al, %eax
	testb %al, %al
	je .LB21328
.LB21327:
	leaq -616(%rbp), %rcx
	movq -728(%rbp), %rax
	movq %rax, 32(%rsp)
	movq -704(%rbp), %rdx
	movq -712(%rbp), %r8
	movq -720(%rbp), %r9
	callq IDEKA__ilink__pe_link_all__5__PeLinkE1_ptr1__byteE1_ptr1__intE1__dataE1_sbits64__byteE1_ptr1__ret_boolE1
	movq -616(%rbp), %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB20979:
	movq -616(%rbp), %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB20948:
	movq -616(%rbp), %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB20882:
	movl $1970302569, -655(%rbp)
	movl $1936269428, -651(%rbp)
	movl $1953459744, -647(%rbp)
	movl $544104736, -643(%rbp)
	movl $758528120, -639(%rbp)
	movl $1126183990, -635(%rbp)
	movl $541476431, -631(%rbp)
	movl $1701470831, -627(%rbp)
	movw $29795, -623(%rbp)
	movb $0, -621(%rbp)
	leaq -655(%rbp), %rdx
	leaq -616(%rbp), %rcx
	callq IDEKA__ilink__pe_fail__2__PeLinkE1_ptr1__byteE1_ptr1__ret_boolE1
	movzbl %al, %esi
	jmp .LB20846
.LB20844:
	movl $1852727651, -683(%rbp)
	movl $1914729583, -679(%rbp)
	movl $543449445, -675(%rbp)
	movl $1763733089, -671(%rbp)
	movl $1953853550, -667(%rbp)
	movl $1784835872, -663(%rbp)
	movl $7627621, -659(%rbp)
	leaq -683(%rbp), %rdx
	leaq -616(%rbp), %rcx
	callq IDEKA__ilink__pe_fail__2__PeLinkE1_ptr1__byteE1_ptr1__ret_boolE1
	movzbl %al, %esi
	jmp .LB20846
	.text
	.globl ilink_usage__0__ret_voidE1
	.def ilink_usage__0__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
ilink_usage__0__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $288, %rsp
.LB21339:
	movl $1262830665, -38(%rbp)
	movl $1768693825, -34(%rbp)
	movl $1919249262, -30(%rbp)
	movl $1279600672, -26(%rbp)
	movl $540292678, -22(%rbp)
	movl $543452769, -18(%rbp)
	movl $842220880, -14(%rbp)
	movl $947396651, -10(%rbp)
	movl $875965750, -6(%rbp)
	movw $41, -2(%rbp)
	leaq -38(%rbp), %rcx
	callq standard__io__console__println__1__byteE1_arr__ret_voidE1
	movl $1734439765, -156(%rbp)
	movl $1763719781, -152(%rbp)
	movl $1802398060, -148(%rbp)
	movl $1949129504, -144(%rbp)
	movl $1718379808, -140(%rbp)
	movl $1566929020, -136(%rbp)
	movl $1865243424, -132(%rbp)
	movl $1953853216, -128(%rbp)
	movl $760946781, -124(%rbp)
	movl $1852121189, -120(%rbp)
	movl $1568240244, -116(%rbp)
	movl $1814911776, -112(%rbp)
	movl $1651076128, -108(%rbp)
	movl $774778461, -104(%rbp)
	movl $1278040864, -100(%rbp)
	movl $1919509536, -96(%rbp)
	movl $774778461, -92(%rbp)
	movl $1227709216, -88(%rbp)
	movl $1953392928, -84(%rbp)
	movl $1567650405, -80(%rbp)
	movl $1932352288, -76(%rbp)
	movl $2037604981, -72(%rbp)
	movl $1835365491, -68(%rbp)
	movl $542993952, -64(%rbp)
	movl $1953705307, -60(%rbp)
	movl $543908705, -56(%rbp)
	movl $1702132066, -52(%rbp)
	movl $1864392051, -48(%rbp)
	movl $774793826, -44(%rbp)
	movw $46, -40(%rbp)
	leaq -156(%rbp), %rcx
	callq standard__io__console__println__1__byteE1_arr__ret_voidE1
	movl $1279598624, -256(%rbp)
	movl $757086790, -252(%rbp)
	movl $1768693868, -248(%rbp)
	movl $1932419938, -244(%rbp)
	movl $540421743, -240(%rbp)
	movl $1684957538, -236(%rbp)
	movl $2036605043, -232(%rbp)
	movl $1768776046, -228(%rbp)
	movl $1819042147, -224(%rbp)
	movl $1344286329, -220(%rbp)
	movl $757086789, -216(%rbp)
	movl $1701519468, -212(%rbp)
	movl $1818586738, -208(%rbp)
	movl $1814966835, -204(%rbp)
	movl $673210985, -200(%rbp)
	movl $1629516399, -196(%rbp)
	movl $1818504736, -192(%rbp)
	movl $1763715436, -188(%rbp)
	movl $1919905901, -184(%rbp)
	movl $1948283764, -180(%rbp)
	movl $1970238056, -176(%rbp)
	movl $1948280935, -172(%rbp)
	movl $1814062440, -168(%rbp)
	movl $1634886249, -164(%rbp)
	movl $3045746, -160(%rbp)
	leaq -256(%rbp), %rcx
	callq standard__io__console__println__1__byteE1_arr__ret_voidE1
	leave
	ret
	.text
	.globl ilink_run__2__intE1__byteE1_ptr2__ret_intE1
	.def ilink_run__2__intE1__byteE1_ptr2__ret_intE1;
	.scl 2;
	.type 32;
	.endef
ilink_run__2__intE1__byteE1_ptr2__ret_intE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $464, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
	movq %r14, -48(%rbp)
	movq %r15, -56(%rbp)
.LB21602:
	movl %ecx, %esi
	movq %rdx, %rdi
	leal 1(%rsi), %eax
	shll $3, %eax
	movslq %eax, %rbx
	movq %rbx, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -344(%rbp)
	movq %rbx, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -336(%rbp)
	leal 8(%rsi), %eax
	shll $3, %eax
	movslq %eax, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, %rbx
	movl $1970220641, -62(%rbp)
	movw $116, -58(%rbp)
	leaq -62(%rbp), %rax
	movl $1635021663, -69(%rbp)
	movw $29810, -65(%rbp)
	movb $0, -63(%rbp)
	leaq -69(%rbp), %rcx
	movl $1651076143, -97(%rbp)
	movl $1815032886, -93(%rbp)
	movl $1768697188, -89(%rbp)
	movl $762869102, -85(%rbp)
	movl $758528120, -81(%rbp)
	movl $1932407862, -77(%rbp)
	movl $3288687, -73(%rbp)
	leaq -97(%rbp), %rdx
	movl $0, -104(%rbp)
	xorl %r12d, %r12d
	xorl %r13d, %r13d
	movq $0, -248(%rbp)
	movq %rax, -256(%rbp)
	movq %rcx, -264(%rbp)
	movq %rdx, -272(%rbp)
	movq $1, -280(%rbp)
	movl $4294967295, %r10d
	movq %r10, -288(%rbp)
	movq $3, -296(%rbp)
	movq $67108864, -304(%rbp)
	movq $0, -312(%rbp)
	movq $0, -320(%rbp)
	movq $0, -328(%rbp)
.LB21690:
	movq -280(%rbp), %rax
	cmpl %esi, %eax
	jge .LB21692
.LB21691:
	movq -280(%rbp), %rax
	movslq %eax, %r14
	leaq (%rdi,%r14,8), %r15
	movq (%r15), %rcx
	movw $28461, -198(%rbp)
	movb $0, -196(%rbp)
	leaq -198(%rbp), %rdx
	callq IDEKA__ilink__lk_streq__2__byteE1_ptr1__byteE1_ptr1__ret_boolE1
	testb %al, %al
	jne .LB21706
.LB21707:
	movq (%r15), %rcx
	movw $25901, -201(%rbp)
	movb $0, -199(%rbp)
	leaq -201(%rbp), %rdx
	callq IDEKA__ilink__lk_streq__2__byteE1_ptr1__byteE1_ptr1__ret_boolE1
	testb %al, %al
	jne .LB21731
.LB21732:
	movq (%r15), %rcx
	movw $29741, -204(%rbp)
	movb $0, -202(%rbp)
	leaq -204(%rbp), %rdx
	callq IDEKA__ilink__lk_streq__2__byteE1_ptr1__byteE1_ptr1__ret_boolE1
	testb %al, %al
	jne .LB21755
.LB21756:
	movq (%r15), %rcx
	movl $1651864365, -215(%rbp)
	movl $1953724787, -211(%rbp)
	movw $28005, -207(%rbp)
	movb $0, -205(%rbp)
	leaq -215(%rbp), %rdx
	callq IDEKA__ilink__lk_streq__2__byteE1_ptr1__byteE1_ptr1__ret_boolE1
	testb %al, %al
	jne .LB21796
.LB21797:
	movq (%r15), %rcx
	movl $1635021613, -222(%rbp)
	movw $27491, -218(%rbp)
	movb $0, -216(%rbp)
	leaq -222(%rbp), %rdx
	callq IDEKA__ilink__lk_streq__2__byteE1_ptr1__byteE1_ptr1__ret_boolE1
	testb %al, %al
	jne .LB21853
.LB21854:
	movq (%r15), %rcx
	movw $18733, -225(%rbp)
	movb $0, -223(%rbp)
	leaq -225(%rbp), %rdx
	callq IDEKA__ilink__lk_streq__2__byteE1_ptr1__byteE1_ptr1__ret_boolE1
	testb %al, %al
	jne .LB21909
.LB21910:
	movq (%r15), %rcx
	movw $27693, -228(%rbp)
	movb $0, -226(%rbp)
	leaq -228(%rbp), %rdx
	callq IDEKA__ilink__lk_streq__2__byteE1_ptr1__byteE1_ptr1__ret_boolE1
	testb %al, %al
	jne .LB21933
.LB21934:
	leaq (%rdi,%r14,8), %r14
	movq (%r14), %rcx
	movw $19501, -231(%rbp)
	movb $0, -229(%rbp)
	leaq -231(%rbp), %rdx
	callq IDEKA__ilink__lk_streq__2__byteE1_ptr1__byteE1_ptr1__ret_boolE1
	testb %al, %al
	jne .LB21962
.LB21963:
	movq (%r14), %rax
	movslq %r12d, %rcx
	movq -344(%rbp), %rdx
	movq %rax, (%rdx,%rcx,8)
	leal 1(%r12), %eax
	movq -248(%rbp), %rcx
	movq -256(%rbp), %rdx
	movq -264(%rbp), %r8
	movq -272(%rbp), %r9
	movq -280(%rbp), %r12
	movq -288(%rbp), %r14
	movq -296(%rbp), %r15
	movq -304(%rbp), %r10
	movq %r10, -352(%rbp)
	movq -312(%rbp), %r10
	movq %r10, -360(%rbp)
	movq -320(%rbp), %r10
	movq %r10, -368(%rbp)
	movq -328(%rbp), %r10
	movq %r10, -376(%rbp)
.LB21708:
	incl %r12d
	movq %rcx, -248(%rbp)
	movq %rdx, -256(%rbp)
	movq %r8, -264(%rbp)
	movq %r9, -272(%rbp)
	movq %r12, -280(%rbp)
	movq %r14, -288(%rbp)
	movq %r15, -296(%rbp)
	movq -352(%rbp), %r10
	movq %r10, -304(%rbp)
	movq -360(%rbp), %r10
	movq %r10, -312(%rbp)
	movq -368(%rbp), %r10
	movq %r10, -320(%rbp)
	movq -376(%rbp), %r10
	movq %r10, -328(%rbp)
	movq %rax, %r12
	jmp .LB21690
.LB21692:
	testl %r12d, %r12d
	je .LB21994
.LB21995:
	movq -288(%rbp), %rax
	testl %eax, %eax
	js .LB21999
.LB22000:
	movq -288(%rbp), %rax
.LB22001:
	cmpl $1, %eax
	je .LB22028
.LB22029:
	movl $1651076143, -126(%rbp)
	movl $909670447, -122(%rbp)
	movl $758396511, -118(%rbp)
	movl $1970170220, -114(%rbp)
	movl $1852255608, -110(%rbp)
	movw $117, -106(%rbp)
	leaq -126(%rbp), %rax
	movq -248(%rbp), %rcx
	movslq %ecx, %rdx
	movq %rax, (%rbx,%rdx,8)
	incl %ecx
	movl $1920169263, -152(%rbp)
	movl $1651076143, -148(%rbp)
	movl $909670447, -144(%rbp)
	movl $758396511, -140(%rbp)
	movl $1970170220, -136(%rbp)
	movl $1852255608, -132(%rbp)
	movw $117, -128(%rbp)
	leaq -152(%rbp), %rax
	movslq %ecx, %rdx
	movq %rax, (%rbx,%rdx,8)
	incl %ecx
	movl $1651076143, -159(%rbp)
	movw $13366, -155(%rbp)
	movb $0, -153(%rbp)
	leaq -159(%rbp), %rax
	movslq %ecx, %rdx
	movq %rax, (%rbx,%rdx,8)
	incl %ecx
	movl $1920169263, -168(%rbp)
	movl $1651076143, -164(%rbp)
	movb $0, -160(%rbp)
	leaq -168(%rbp), %rax
	movslq %ecx, %rdx
	movq %rax, (%rbx,%rdx,8)
	incl %ecx
	movq %rbx, 32(%rsp)
	movq %rcx, 40(%rsp)
	movq -264(%rbp), %rax
	movq %rax, 48(%rsp)
	movq -272(%rbp), %rax
	movq %rax, 56(%rsp)
	movq -256(%rbp), %rax
	movq %rax, 64(%rsp)
	movq -344(%rbp), %rcx
	movq %r12, %rdx
	movq -336(%rbp), %r8
	movq %r13, %r9
	callq IDEKA__ilink__lk_elf_link__9__byteE1_ptr2__intE1__byteE1_ptr2__intE1__byteE1_ptr2__intE1__byteE1_ptr1__byteE1_ptr1__byteE1_ptr1__ret_byteE1_ptr1
	movq %rax, %rsi
	testq %rsi, %rsi
	jne .LB22188
.LB22189:
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
.LB21999:
	movl $0, -104(%rbp)
	movq -344(%rbp), %rax
	movq (%rax), %rcx
	leaq -104(%rbp), %rdx
	callq IDEKA__ilink__lk_read_file__2__byteE1_ptr1__intE1_ptr1__ret_byteE1_ptr1
	testq %rax, %rax
	je .LB22024
.LB22012:
	movl -104(%rbp), %ecx
	cmpl $2, %ecx
	jle .LB22024
.LB22017:
	movq %rax, %rcx
	xorl %edx, %edx
	callq IDEKA__ilink__lk_r16__2__byteE1_ptr1__intE1__ret_intE1
	cmpl $34404, %eax
	je .LB22023
.LB22024:
	xorl %eax, %eax
.LB22025:
	cmpl $1, %eax
	je .LB22028
	jmp .LB22029
.LB22023:
	movl $1, %eax
	jmp .LB22025
.LB22188:
	movl $1852402793, -176(%rbp)
	movl $2112107, -172(%rbp)
	leaq -176(%rbp), %rcx
	callq standard__io__console__print__1__byteE1_arr__ret_voidE1
	movq %rsi, %rcx
	callq standard__io__console__println__1__byteE1_arr__ret_voidE1
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
.LB22028:
	movq -312(%rbp), %rax
	testb %al, %al
	je .LB22033
.LB22034:
	movq -264(%rbp), %rax
.LB22035:
	movq %rbx, 32(%rsp)
	movq -248(%rbp), %rcx
	movq %rcx, 40(%rsp)
	movq %rax, 48(%rsp)
	movq -296(%rbp), %rax
	movq %rax, 56(%rsp)
	movq -304(%rbp), %rax
	movq %rax, 64(%rsp)
	movq -256(%rbp), %rax
	movq %rax, 72(%rsp)
	movq -344(%rbp), %rcx
	movq %r12, %rdx
	movq -336(%rbp), %r8
	movq %r13, %r9
	callq IDEKA__ilink__lk_pe_link__10__byteE1_ptr2__intE1__byteE1_ptr2__intE1__byteE1_ptr2__intE1__byteE1_ptr1__intE1__dataE1_sbits64__byteE1_ptr1__ret_byteE1_ptr1
	movq %rax, %rsi
	testq %rsi, %rsi
	jne .LB22066
.LB22067:
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
.LB22033:
	movl $1398035014, -187(%rbp)
	movl $1953653108, -183(%rbp)
	movw $28789, -179(%rbp)
	movb $0, -177(%rbp)
	leaq -187(%rbp), %rax
	jmp .LB22035
.LB22066:
	movl $1852402793, -195(%rbp)
	movl $2112107, -191(%rbp)
	leaq -195(%rbp), %rcx
	callq standard__io__console__print__1__byteE1_arr__ret_voidE1
	movq %rsi, %rcx
	callq standard__io__console__println__1__byteE1_arr__ret_voidE1
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
.LB21994:
	callq ilink_usage__0__ret_voidE1
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
.LB21962:
	movq -280(%rbp), %rax
	incl %eax
	cmpl %esi, %eax
	jge .LB21969
.LB21970:
	movslq %eax, %rcx
	movq (%rdi,%rcx,8), %rcx
	movq -248(%rbp), %rdx
	movslq %edx, %r8
	movq %rcx, (%rbx,%r8,8)
	leal 1(%rdx), %ecx
	movq -256(%rbp), %rdx
	movq -264(%rbp), %r8
	movq -272(%rbp), %r9
	movq -288(%rbp), %r14
	movq -296(%rbp), %r15
	movq -304(%rbp), %r10
	movq %r10, -352(%rbp)
	movq -312(%rbp), %r10
	movq %r10, -360(%rbp)
	movq -320(%rbp), %r10
	movq %r10, -368(%rbp)
	movq -328(%rbp), %r10
	movq %r10, -376(%rbp)
	movq %rax, %r11
	movq %r12, %rax
	movq %r11, %r12
	jmp .LB21708
.LB21969:
	callq ilink_usage__0__ret_voidE1
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
.LB21933:
	movq -280(%rbp), %rax
	incl %eax
	cmpl %esi, %eax
	jge .LB21940
.LB21941:
	movslq %eax, %rcx
	movq (%rdi,%rcx,8), %rcx
	movslq %r13d, %rdx
	movq -336(%rbp), %r8
	movq %rcx, (%r8,%rdx,8)
	incl %r13d
	movq -248(%rbp), %rcx
	movq -256(%rbp), %rdx
	movq -264(%rbp), %r8
	movq -272(%rbp), %r9
	movq -288(%rbp), %r14
	movq -296(%rbp), %r15
	movq -304(%rbp), %r10
	movq %r10, -352(%rbp)
	movq -312(%rbp), %r10
	movq %r10, -360(%rbp)
	movq -320(%rbp), %r10
	movq %r10, -368(%rbp)
	movq -328(%rbp), %r10
	movq %r10, -376(%rbp)
	movq %rax, %r11
	movq %r12, %rax
	movq %r11, %r12
	jmp .LB21708
.LB21940:
	callq ilink_usage__0__ret_voidE1
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
.LB21909:
	movq -280(%rbp), %rax
	incl %eax
	cmpl %esi, %eax
	jge .LB21916
.LB21917:
	movslq %eax, %rcx
	movq (%rdi,%rcx,8), %r9
	movq -248(%rbp), %rcx
	movq -256(%rbp), %rdx
	movq -264(%rbp), %r8
	movq -288(%rbp), %r14
	movq -296(%rbp), %r15
	movq -304(%rbp), %r10
	movq %r10, -352(%rbp)
	movq -312(%rbp), %r10
	movq %r10, -360(%rbp)
	movq -320(%rbp), %r10
	movq %r10, -368(%rbp)
	movq -328(%rbp), %r10
	movq %r10, -376(%rbp)
	movq %rax, %r11
	movq %r12, %rax
	movq %r11, %r12
	jmp .LB21708
.LB21916:
	callq ilink_usage__0__ret_voidE1
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
.LB21853:
	movq -280(%rbp), %rax
	incl %eax
	cmpl %esi, %eax
	jge .LB21860
.LB21861:
	movslq %eax, %rcx
	movq (%rdi,%rcx,8), %rcx
	xorl %edx, %edx
	xorl %r8d, %r8d
.LB21868:
	movslq %r8d, %r9
	movzbl (%rcx,%r9,1), %r9d
	cmpl $48, %r9d
	jb .LB21870
.LB21877:
	cmpl $57, %r9d
	ja .LB21870
.LB21869:
	imulq $10, %rdx, %rdx
	subl $48, %r9d
	addq %r9, %rdx
	incl %r8d
	jmp .LB21868
.LB21870:
	movq -272(%rbp), %r9
	movq -288(%rbp), %r14
	movq -296(%rbp), %r15
	movq %rdx, -352(%rbp)
	movq -312(%rbp), %r10
	movq %r10, -360(%rbp)
	movq %rcx, -368(%rbp)
	movq %r8, -376(%rbp)
	movq -248(%rbp), %rcx
	movq -256(%rbp), %rdx
	movq -264(%rbp), %r8
	movq %rax, %r11
	movq %r12, %rax
	movq %r11, %r12
	jmp .LB21708
.LB21860:
	callq ilink_usage__0__ret_voidE1
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
.LB21796:
	movq -280(%rbp), %rax
	incl %eax
	cmpl %esi, %eax
	jge .LB21803
.LB21804:
	movslq %eax, %rcx
	movq (%rdi,%rcx,8), %rcx
	xorl %r15d, %r15d
	xorl %edx, %edx
.LB21810:
	movslq %edx, %r8
	movzbl (%rcx,%r8,1), %r8d
	cmpl $48, %r8d
	jb .LB21812
.LB21819:
	cmpl $57, %r8d
	ja .LB21812
.LB21811:
	imull $10, %r15d, %r15d
	subl $48, %r8d
	addl %r8d, %r15d
	incl %edx
	jmp .LB21810
.LB21812:
	movq -264(%rbp), %r8
	movq -272(%rbp), %r9
	movq -288(%rbp), %r14
	movq -304(%rbp), %r10
	movq %r10, -352(%rbp)
	movq -312(%rbp), %r10
	movq %r10, -360(%rbp)
	movq %rcx, -368(%rbp)
	movq %rdx, -376(%rbp)
	movq -248(%rbp), %rcx
	movq -256(%rbp), %rdx
	movq %rax, %r11
	movq %r12, %rax
	movq %r11, %r12
	jmp .LB21708
.LB21803:
	callq ilink_usage__0__ret_voidE1
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
.LB21755:
	movq -280(%rbp), %rax
	leal 1(%rax), %r14d
	cmpl %esi, %r14d
	jge .LB21762
.LB21763:
	movslq %r14d, %rax
	movq (%rdi,%rax,8), %rcx
	movw $25968, -234(%rbp)
	movb $0, -232(%rbp)
	leaq -234(%rbp), %rdx
	callq IDEKA__ilink__lk_streq__2__byteE1_ptr1__byteE1_ptr1__ret_boolE1
	movzbl %al, %eax
	movq $1, %rcx
	xorl %edx, %edx
	testb %al, %al
	movl %edx, %eax
	cmovne %ecx, %eax
	movq -248(%rbp), %rcx
	movq -256(%rbp), %rdx
	movq -264(%rbp), %r8
	movq -272(%rbp), %r9
	movq -296(%rbp), %r15
	movq -304(%rbp), %r10
	movq %r10, -352(%rbp)
	movq -312(%rbp), %r10
	movq %r10, -360(%rbp)
	movq -320(%rbp), %r10
	movq %r10, -368(%rbp)
	movq -328(%rbp), %r10
	movq %r10, -376(%rbp)
	movq %rax, %r11
	movq %r12, %rax
	movq %r14, %r12
	movq %r11, %r14
	jmp .LB21708
.LB21762:
	callq ilink_usage__0__ret_voidE1
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
.LB21731:
	movq -280(%rbp), %rax
	incl %eax
	cmpl %esi, %eax
	jge .LB21738
.LB21739:
	movslq %eax, %rcx
	movq (%rdi,%rcx,8), %r8
	movq -248(%rbp), %rcx
	movq -256(%rbp), %rdx
	movq -272(%rbp), %r9
	movq -288(%rbp), %r14
	movq -296(%rbp), %r15
	movq -304(%rbp), %r10
	movq %r10, -352(%rbp)
	movq $1, -360(%rbp)
	movq -320(%rbp), %r10
	movq %r10, -368(%rbp)
	movq -328(%rbp), %r10
	movq %r10, -376(%rbp)
	movq %rax, %r11
	movq %r12, %rax
	movq %r11, %r12
	jmp .LB21708
.LB21738:
	callq ilink_usage__0__ret_voidE1
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
.LB21706:
	movq -280(%rbp), %rax
	incl %eax
	cmpl %esi, %eax
	jge .LB21714
.LB21715:
	movslq %eax, %rcx
	movq (%rdi,%rcx,8), %rdx
	movq -248(%rbp), %rcx
	movq -264(%rbp), %r8
	movq -272(%rbp), %r9
	movq -288(%rbp), %r14
	movq -296(%rbp), %r15
	movq -304(%rbp), %r10
	movq %r10, -352(%rbp)
	movq -312(%rbp), %r10
	movq %r10, -360(%rbp)
	movq -320(%rbp), %r10
	movq %r10, -368(%rbp)
	movq -328(%rbp), %r10
	movq %r10, -376(%rbp)
	movq %rax, %r11
	movq %r12, %rax
	movq %r11, %r12
	jmp .LB21708
.LB21714:
	callq ilink_usage__0__ret_voidE1
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
IDEKA__ilink__LkBuf.TLD:
	.long 129
	.long 4
	.long 0
	.long 64
	.long 64
	.long 64
	.long 32
	.long 32
	.long 96
	.long 32
	.long 32
	.long 128
	.long 1
	.long 1
	.section .rdata,"dr"
	.p2align 4
IDEKA__ilink__LkMap.TLD:
	.long 192
	.long 4
	.long 0
	.long 64
	.long 64
	.long 64
	.long 64
	.long 64
	.long 128
	.long 32
	.long 32
	.long 160
	.long 32
	.long 32
	.section .rdata,"dr"
	.p2align 4
IDEKA__ilink__ElfLink.TLD:
	.long 4672
	.long 70
	.long 0
	.long 64
	.long 64
	.long 64
	.long 32
	.long 32
	.long 96
	.long 32
	.long 32
	.long 128
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
	.long 64
	.long 64
	.long 1664
	.long 64
	.long 64
	.long 1728
	.long 64
	.long 64
	.long 1792
	.long 64
	.long 64
	.long 1856
	.long 64
	.long 64
	.long 1920
	.long 64
	.long 64
	.long 1984
	.long 32
	.long 32
	.long 2048
	.long 64
	.long 64
	.long 2112
	.long 64
	.long 64
	.long 2176
	.long 64
	.long 64
	.long 2240
	.long 64
	.long 64
	.long 2304
	.long 64
	.long 64
	.long 2368
	.long 64
	.long 64
	.long 2432
	.long 64
	.long 64
	.long 2496
	.long 64
	.long 64
	.long 2560
	.long 64
	.long 64
	.long 2624
	.long 64
	.long 64
	.long 2688
	.long 32
	.long 32
	.long 2752
	.long 64
	.long 64
	.long 2816
	.long 64
	.long 64
	.long 2880
	.long 64
	.long 64
	.long 2944
	.long 64
	.long 64
	.long 3008
	.long 64
	.long 64
	.long 3072
	.long 64
	.long 64
	.long 3136
	.long 64
	.long 64
	.long 3200
	.long 64
	.long 64
	.long 3264
	.long 64
	.long 64
	.long 3328
	.long 64
	.long 64
	.long 3392
	.long 64
	.long 64
	.long 3456
	.long 64
	.long 64
	.long 3520
	.long 64
	.long 64
	.long 3584
	.long 32
	.long 32
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
	.long 32
	.long 32
	.long 3968
	.long 64
	.long 64
	.long 4032
	.long 64
	.long 64
	.long 4096
	.long 32
	.long 32
	.long 4160
	.long 64
	.long 64
	.long 4224
	.long 32
	.long 32
	.long 4288
	.long 192
	.long 64
	.long 4480
	.long 192
	.long 64
	.section .rdata,"dr"
	.p2align 4
IDEKA__ilink__PeLink.TLD:
	.long 4480
	.long 68
	.long 0
	.long 64
	.long 64
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
	.long 32
	.long 32
	.long 736
	.long 32
	.long 32
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
	.long 64
	.long 64
	.long 1664
	.long 64
	.long 64
	.long 1728
	.long 64
	.long 64
	.long 1792
	.long 64
	.long 64
	.long 1856
	.long 64
	.long 64
	.long 1920
	.long 64
	.long 64
	.long 1984
	.long 64
	.long 64
	.long 2048
	.long 64
	.long 64
	.long 2112
	.long 32
	.long 32
	.long 2176
	.long 64
	.long 64
	.long 2240
	.long 64
	.long 64
	.long 2304
	.long 64
	.long 64
	.long 2368
	.long 32
	.long 32
	.long 2400
	.long 32
	.long 32
	.long 2432
	.long 64
	.long 64
	.long 2496
	.long 64
	.long 64
	.long 2560
	.long 64
	.long 64
	.long 2624
	.long 64
	.long 64
	.long 2688
	.long 64
	.long 64
	.long 2752
	.long 64
	.long 64
	.long 2816
	.long 64
	.long 64
	.long 2880
	.long 192
	.long 64
	.long 3072
	.long 192
	.long 64
	.long 3264
	.long 32
	.long 32
	.long 3328
	.long 64
	.long 64
	.long 3392
	.long 64
	.long 64
	.long 3456
	.long 32
	.long 32
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
	.long 192
	.long 64
	.long 4352
	.long 32
	.long 32
	.long 4384
	.long 32
	.long 32
	.long 4416
	.long 64
	.long 64
	.section .rdata,"dr"
	.p2align 4
IDEKA__ilink__PeUnd.TLD:
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
IDEKA__ilink__PeImp.TLD:
	.long 224
	.long 5
	.long 0
	.long 64
	.long 64
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
	.section .rdata,"dr"
	.p2align 0
.str.0:
	.byte 114, 98, 0
	.section .rdata,"dr"
	.p2align 0
.str.1:
	.byte 119, 98, 0
	.section .rdata,"dr"
	.p2align 4
.LZERO:
	.zero 584
