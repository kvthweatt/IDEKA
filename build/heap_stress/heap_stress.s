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
.LB11792:
	testq %rdx, %rdx
	je .LB11794
.LB11793:
	movb %al, (%rcx,%rsi,1)
	movb %al, 1(%rcx,%rsi,1)
	movb %al, 2(%rcx,%rsi,1)
	movb %al, 3(%rcx,%rsi,1)
	addq $4, %rsi
	decq %rdx
	jne .LB11793
.LB11794:
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
	movl $9, %eax
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
	movl $16, %eax
	shlx %rcx, %rax, %rax
	ret
.LB104:
	movl $4096, %eax
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
	cmpq $0, (%rbx)
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
.LB425:
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
	je .LB462
.LB461:
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
	jmp .LB460
.LB282:
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
	xorl %ecx, %ecx
	movl $32768, %edx
	movl $12288, %r8d
	movl $4, %r9d
	callq VirtualAlloc
	movq %rax, %rsi
	testq %rsi, %rsi
	je .LB584
.LB585:
	movq %rsi, %rdi
	movl $32768, %ecx
	xorl %eax, %eax
	rep stosb
.LB592:
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
	movq standard__memory__allocators__stdheap__g_table(%rip), %rax
	movq %rcx, %rsi
	movq %rdx, %rdi
	movq %r8, %rbx
	movq %r9, %r12
	testq %rax, %rax
	je .LB629
.LB628:
	movq standard__memory__allocators__stdheap__g_table_count(%rip), %rax
	movq standard__memory__allocators__stdheap__g_table_cap(%rip), %rcx
	shlq $1, %rax
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
	decq %rdx
	andq %rdx, %rsi
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
	andq %rdx, %rsi
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
	xorl %ecx, %ecx
	movq %rsi, %rdx
	movl $12288, %r8d
	movl $4, %r9d
	callq VirtualAlloc
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
	movq standard__memory__allocators__stdheap__g_slab_size_cap(%rip), %rdx
	shlq $1, %rcx
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
	xorl %ecx, %ecx
	movq %rsi, %rdx
	movl $12288, %r8d
	movl $4, %r9d
	callq VirtualAlloc
	movq %rax, %rdi
	testq %rdi, %rdi
	je .LB1078
.LB1079:
	movq %rdi, %rcx
	movq %rsi, %rdx
	movl $1, %r8d
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
	xorl %edx, %edx
	movl $32768, %r8d
	callq VirtualFree
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
	movl $16, %eax
	shlx %rsi, %rax, %rax
	movl $4096, %ecx
	cmpq $8, %rsi
	movq %rax, %rdi
	cmova %rcx, %rdi
	movq standard__memory__allocators__stdheap__g_slab_head(%rip), %rax
	testq %rax, %rax
	je .LB11457
.LB11458:
	movq 16(%rax), %rcx
	movq 8(%rax), %r8
	movq (%rax), %r9
	leaq (%rcx,%rdi), %rdx
	leaq (%r9,%rcx,1), %rcx
	movq %rdx, 16(%rax)
	xorl %eax, %eax
	cmpq %r8, %rdx
	cmovbe %rcx, %rax
.LB11454:
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
.LB11457:
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
	je .LB11452
.LB11453:
	movq 16(%rax), %rcx
	leaq (%rcx,%rdi), %rdx
	movq 8(%rax), %rdi
	movq (%rax), %r8
	leaq (%r8,%rcx,1), %rcx
	movq %rdx, 16(%rax)
	xorl %eax, %eax
	cmpq %rdi, %rdx
	cmovbe %rcx, %rax
.LB11449:
	testq %rax, %rax
	je .LB1172
.LB1173:
	movq %rax, %rdi
	jmp .LB1152
.LB11452:
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
	leaq standard__memory__allocators__stdheap__g_bins(%rip), %rdx
	movq (%rax), %rcx
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
	je .LB11462
.LB11463:
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
.LB11464:
	movslq %edx, %rdi
	shlq $5, %rdi
	movq (%rax,%rdi,1), %rdi
	testq %rdi, %rdi
	je .LB11466
.LB11465:
	cmpq %rsi, %rdi
	je .LB11468
.LB11469:
	incq %rdx
	andq %rcx, %rdx
	jmp .LB11464
.LB11466:
	xorl %eax, %eax
.LB11459:
	testq %rax, %rax
	je .LB1219
.LB1220:
	movq 8(%rax), %rcx
	cmpq $1, 16(%rax)
	je .LB1240
.LB1241:
	movq $3, 16(%rax)
	cmpq $8, %rcx
	ja .LB11475
.LB11476:
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
.LB11468:
	shlq $5, %rdx
	leaq (%rax,%rdx,1), %rax
	jmp .LB11459
.LB11462:
	xorl %eax, %eax
	jmp .LB11459
.LB11475:
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB1240:
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
	je .LB11482
.LB11483:
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
.LB11484:
	movslq %edx, %r8
	shlq $5, %r8
	movq (%rax,%r8,1), %r8
	testq %r8, %r8
	je .LB11486
.LB11485:
	cmpq %rsi, %r8
	je .LB11488
.LB11489:
	incq %rdx
	andq %rcx, %rdx
	jmp .LB11484
.LB11486:
	xorl %ecx, %ecx
.LB11479:
	testq %rcx, %rcx
	je .LB1287
.LB1288:
	movq 8(%rcx), %rbx
	cmpq $1, 16(%rcx)
	je .LB1316
.LB1317:
	cmpq $4096, %rdi
	ja .LB11495
.LB11496:
	cmpq $16, %rdi
	jbe .LB11498
.LB11499:
	leaq -1(%rdi), %rax
	bsrq %rax, %rax
	subq $3, %rax
.LB11492:
	cmpq %rbx, %rax
	je .LB1336
.LB1337:
	cmpq %rbx, %rax
	jb .LB1344
.LB1345:
	movl $16, %edx
	shlx %rbx, %rdx, %rdx
	movl $4096, %r8d
	cmpq $8, %rbx
	cmova %r8, %rdx
	cmpq %rdx, %rdi
	movq %rdx, %r12
	cmovb %rdi, %r12
	cmpq $8, %rax
	ja .LB11510
.LB11511:
	leaq standard__memory__allocators__stdheap__g_bins(%rip), %rdx
	movslq %eax, %r8
	movq (%rdx,%r8,8), %rdx
	testq %rdx, %rdx
	jne .LB11513
.LB11512:
.LB11507:
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
	testq %r12, %r12
	cmova %r12, %rax
	shrq $2, %rax
	xorl %ecx, %ecx
.LB11798:
	testq %rax, %rax
	je .LB11800
.LB11799:
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
	jne .LB11799
	jmp .LB11800
.LB11488:
	shlq $5, %rdx
	leaq (%rax,%rdx,1), %rcx
	jmp .LB11479
.LB11482:
	xorl %ecx, %ecx
	jmp .LB11479
.LB11498:
	xorl %eax, %eax
	cmpq %rbx, %rax
	je .LB1336
	jmp .LB1337
.LB11495:
	movl $9, %eax
	cmpq %rbx, %rax
	je .LB1336
	jmp .LB1337
.LB11513:
	movq (%rdx), %r8
	leaq standard__memory__allocators__stdheap__g_bins(%rip), %r9
	movq %r8, (%r9,%rax,8)
	jmp .LB11512
.LB11510:
	xorl %edx, %edx
	testq %rdx, %rdx
	jne .LB1365
	jmp .LB1366
.LB11800:
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
	je .LB11518
.LB11519:
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
.LB11520:
	movslq %r9d, %r13
	shlq $5, %r13
	movq (%rdi,%r13,1), %r13
	testq %r13, %r13
	je .LB11522
.LB11521:
	cmpq %rdx, %r13
	je .LB11524
.LB11525:
	incq %r9
	andq %r8, %r9
	jmp .LB11520
.LB11522:
	xorl %edi, %edi
.LB11515:
	testq %rdi, %rdi
	jne .LB1378
.LB1377:
	xorl %eax, %eax
	testq %r12, %r12
	cmova %r12, %rax
	shrq $2, %rax
	xorl %edi, %edi
.LB11795:
	testq %rax, %rax
	je .LB11797
.LB11796:
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
	jne .LB11796
	jmp .LB11797
.LB11524:
	shlq $5, %r9
	leaq (%rdi,%r9,1), %rdi
	testq %rdi, %rdi
	jne .LB1378
	jmp .LB1377
.LB11518:
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
.LB11797:
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
	ja .LB11531
.LB11532:
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
	testq %rdi, %rdi
	jbe .LB1434
.LB1444:
	decq %rdi
	movq %rdi, 24(%rax)
	jmp .LB1434
.LB11531:
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
	testq %rbx, %rbx
	cmova %rbx, %rax
	shrq $2, %rax
	xorl %ecx, %ecx
.LB11801:
	testq %rax, %rax
	je .LB11803
.LB11802:
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
	jne .LB11802
.LB11803:
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
	.globl standard__memory__allocators__stdheap__coalesce_heap__0__ret_voidE1
	.def standard__memory__allocators__stdheap__coalesce_heap__0__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
standard__memory__allocators__stdheap__coalesce_heap__0__ret_voidE1:
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
.LB1532:
	movq standard__memory__allocators__stdheap__g_slab_head(%rip), %rax
	xorl %ecx, %ecx
	movq %rax, %rdx
	movq $0, -232(%rbp)
	movq $0, -96(%rbp)
	xorl %esi, %esi
	xorl %edi, %edi
	xorl %r8d, %r8d
	xorl %r9d, %r9d
	xorl %ebx, %ebx
	xorl %r12d, %r12d
	xorl %r13d, %r13d
	movq $0, -64(%rbp)
	movq $0, -72(%rbp)
	movq $0, -80(%rbp)
	movq $0, -88(%rbp)
	xorl %eax, %eax
.LB1546:
	testq %rdx, %rdx
	je .LB1548
.LB1547:
	movq 32(%rdx), %r14
	movq %r14, -224(%rbp)
	cmpq $0, 24(%rdx)
	je .LB1565
.LB1566:
	movq %r13, %r14
	movq -64(%rbp), %r10
	movq %r10, -104(%rbp)
	movq -72(%rbp), %r10
	movq %r10, -112(%rbp)
	movq -80(%rbp), %r10
	movq %r10, -120(%rbp)
	movq -88(%rbp), %r10
	movq %r10, -128(%rbp)
	movq %r12, %r13
	movq %rbx, %r12
	movq %r9, %rbx
	movq %r8, %r9
	movq %rdi, %r8
	movq %rsi, %rdi
	movq -96(%rbp), %rsi
.LB1564:
	movq %rdx, -232(%rbp)
	movq %rsi, -96(%rbp)
	movq %rdi, %rsi
	movq %r8, %rdi
	movq %r9, %r8
	movq %rbx, %r9
	movq %r12, %rbx
	movq %r13, %r12
	movq %r14, %r13
	movq -104(%rbp), %r10
	movq %r10, -64(%rbp)
	movq -112(%rbp), %r10
	movq %r10, -72(%rbp)
	movq -120(%rbp), %r10
	movq %r10, -80(%rbp)
	movq -128(%rbp), %r10
	movq %r10, -88(%rbp)
	movq -224(%rbp), %rdx
	testq %rdx, %rdx
	jne .LB1547
.LB1548:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB1565:
	movq %r8, -136(%rbp)
	movq %r9, -144(%rbp)
	movq %rbx, -152(%rbp)
	movq %r12, -160(%rbp)
	movq %r13, -168(%rbp)
	movq -64(%rbp), %r10
	movq %r10, -176(%rbp)
	movq -72(%rbp), %r10
	movq %r10, -184(%rbp)
	movq -96(%rbp), %rbx
	movq %rsi, %r12
	movq %rdi, %r13
	movq %rax, %rsi
	movq %rcx, %rdi
.LB1567:
	cmpq $8, %rsi
	ja .LB1569
.LB1568:
	leaq standard__memory__allocators__stdheap__g_bins(%rip), %rax
	movslq %esi, %rcx
	movq (%rax,%rcx,8), %rax
	testq %rax, %rax
	jne .LB11539
.LB11538:
	movq %rax, %rcx
.LB11533:
	xorl %r8d, %r8d
	xorl %r9d, %r9d
.LB1579:
	testq %rcx, %rcx
	je .LB1581
.LB1580:
	movq (%rcx), %rdi
	movq (%rdx), %rbx
	cmpq %rbx, %rcx
	jb .LB1616
.LB1600:
	addq 8(%rdx), %rbx
	cmpq %rbx, %rcx
	jb .LB1615
.LB1616:
	movq $0, (%rcx)
	testq %r9, %r9
	je .LB1629
.LB1630:
	movq %rcx, (%r9)
.LB1628:
	movq %rcx, %r9
.LB1614:
	movq %rdi, %r12
	movq %rdi, %r11
	movq %rcx, %rdi
	movq %r11, %rcx
	testq %rcx, %rcx
	jne .LB1580
	jmp .LB1581
.LB1569:
	movq -232(%rbp), %rax
	testq %rax, %rax
	je .LB1672
.LB1673:
	movq -224(%rbp), %rax
	movq -232(%rbp), %rcx
	movq %rax, 32(%rcx)
.LB1671:
	movq (%rdx), %rcx
	movq %rcx, -192(%rbp)
	movq 8(%rdx), %rax
	movq %rax, -200(%rbp)
	xorl %edx, %edx
	movl $32768, %r8d
	callq VirtualFree
	movq %rsi, %rax
	movq %rdi, %rcx
	movq -232(%rbp), %rdx
	movq %rbx, %rsi
	movq %r12, %rdi
	movq %r13, %r8
	movq -136(%rbp), %r9
	movq -144(%rbp), %rbx
	movq -152(%rbp), %r12
	movq -160(%rbp), %r13
	movq -168(%rbp), %r14
	movq -176(%rbp), %r10
	movq %r10, -104(%rbp)
	movq -184(%rbp), %r10
	movq %r10, -112(%rbp)
	movq -192(%rbp), %r10
	movq %r10, -120(%rbp)
	movq -200(%rbp), %r10
	movq %r10, -128(%rbp)
	jmp .LB1564
.LB1672:
	movq -224(%rbp), %rax
	movq %rax, standard__memory__allocators__stdheap__g_slab_head(%rip)
	jmp .LB1671
.LB11539:
	movq (%rax), %rcx
	leaq standard__memory__allocators__stdheap__g_bins(%rip), %r8
	movq %rcx, (%r8,%rsi,8)
	jmp .LB11538
.LB1581:
	movq %r8, %rbx
	movq -152(%rbp), %r13
	movq -176(%rbp), %r10
	movq %r10, -208(%rbp)
	movq -184(%rbp), %r10
	movq %r10, -216(%rbp)
.LB1645:
	testq %rbx, %rbx
	je .LB1647
.LB1646:
	movq (%rbx), %r13
	leaq standard__memory__allocators__stdheap__g_bins(%rip), %r14
	movslq %esi, %r15
	movq (%r14,%r15,8), %r14
	movq %r14, (%rbx)
	leaq standard__memory__allocators__stdheap__g_bins(%rip), %r14
	movq %rbx, (%r14,%rsi,8)
	movq %rsi, -208(%rbp)
	movq %rbx, -216(%rbp)
	movq %r13, %rbx
	testq %rbx, %rbx
	jne .LB1646
.LB1647:
	leaq 1(%rsi), %r14
	movq %r9, -136(%rbp)
	movq %rbx, -144(%rbp)
	movq %r13, -152(%rbp)
	movq %rsi, -160(%rbp)
	movq %rax, -168(%rbp)
	movq -208(%rbp), %r10
	movq %r10, -176(%rbp)
	movq -216(%rbp), %r10
	movq %r10, -184(%rbp)
	movq %r14, %rsi
	movq %rcx, %rbx
	movq %r8, %r13
	cmpq $8, %rsi
	jbe .LB1568
	jmp .LB1569
.LB1629:
	movq %rcx, %r8
	jmp .LB1628
.LB1615:
	jmp .LB1614
	.text
	.globl standard__memory__allocators__stdheap__check_fragmentation__0__ret_floatE1
	.def standard__memory__allocators__stdheap__check_fragmentation__0__ret_floatE1;
	.scl 2;
	.type 32;
	.endef
standard__memory__allocators__stdheap__check_fragmentation__0__ret_floatE1:
	subq $16, %rsp
	movq %rsi, 0(%rsp)
	movq %rdi, -8(%rsp)
.LB1692:
	movq standard__memory__allocators__stdheap__g_slab_head(%rip), %rax
	xorl %ecx, %ecx
	xorl %edx, %edx
	movq %rax, %rsi
.LB1703:
	testq %rsi, %rsi
	je .LB1705
.LB1704:
	movq 8(%rsi), %rdi
	subq $40, %rdi
	addq %rdi, %rcx
	addq 24(%rsi), %rdx
	movq 32(%rsi), %rsi
	testq %rsi, %rsi
	jne .LB1704
.LB1705:
	testq %rcx, %rcx
	je .LB1741
.LB1742:
	movq %rax, %rcx
	xorl %eax, %eax
.LB1751:
	testq %rcx, %rcx
	je .LB1753
.LB1752:
	movq 16(%rcx), %rsi
	movq 32(%rcx), %rcx
	subq $40, %rsi
	addq %rsi, %rax
	testq %rcx, %rcx
	jne .LB1752
.LB1753:
	testq %rax, %rax
	je .LB1785
.LB1786:
	movq standard__memory__allocators__stdheap__g_large_used(%rip), %rcx
	addq %rcx, %rdx
	shlq $4, %rdx
	cmpq %rax, %rdx
	cmova %rax, %rdx
	movq %rax, %rcx
	subq %rdx, %rcx
	xorps %xmm0, %xmm0
	cvtsi2ssq %rcx, %xmm0
	xorps %xmm1, %xmm1
	cvtsi2ssq %rax, %xmm1
	divss %xmm1, %xmm0
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB1785:
	xorps %xmm0, %xmm0
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB1741:
	cmpq $0, standard__memory__allocators__stdheap__g_large_used(%rip)
	ja .LB1747
.LB1748:
	xorps %xmm0, %xmm0
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB1747:
	movabsq $1065353216, %r10
	movq %r10, %xmm0
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
	.text
	.globl standard__strings__helpers__is_whitespace__1__charE1__ret_boolE1
	.def standard__strings__helpers__is_whitespace__1__charE1__ret_boolE1;
	.scl 2;
	.type 32;
	.endef
standard__strings__helpers__is_whitespace__1__charE1__ret_boolE1:
.LB1805:
	cmpb $32, %cl
	jne .LB1809
.LB11804:
	movl $1, %eax
	ret
.LB1809:
	cmpb $9, %cl
	jne .LB1814
.LB11805:
	movl $1, %eax
	ret
.LB1814:
	cmpb $10, %cl
	jne .LB1819
.LB11806:
	movl $1, %eax
	ret
.LB1819:
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
.LB1824:
	cmpb $48, %cl
	jge .LB1828
.LB11807:
	xorl %eax, %eax
	ret
.LB1828:
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
.LB1833:
	cmpb $97, %cl
	jl .LB1842
.LB1837:
	cmpb $122, %cl
	jg .LB1842
.LB11808:
	movl $1, %eax
	ret
.LB1842:
	cmpb $65, %cl
	jge .LB1846
.LB11809:
	xorl %eax, %eax
	ret
.LB1846:
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
.LB1852:
	cmpb $65, %cl
	jge .LB1856
.LB11810:
	xorl %eax, %eax
	ret
.LB1856:
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
.LB1861:
	cmpb $97, %cl
	jge .LB1865
.LB11811:
	xorl %eax, %eax
	ret
.LB1865:
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
.LB1870:
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
.LB1879:
	cmpb $65, %cl
	jl .LB1889
.LB1883:
	cmpb $90, %cl
	jle .LB1888
.LB1889:
	movzbl %cl, %eax
	ret
.LB1888:
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
.LB1896:
	cmpb $97, %cl
	jl .LB1906
.LB1900:
	cmpb $122, %cl
	jle .LB1905
.LB1906:
	movzbl %cl, %eax
	ret
.LB1905:
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
.LB1913:
	movl %r8d, %eax
.LB1917:
	movslq %eax, %rsi
	movzbl (%rcx,%rsi,1), %esi
	testb %sil, %sil
	je .LB1920
.LB1918:
	cmpb %dl, %sil
	je .LB1935
.LB1936:
	incl %eax
	jmp .LB1917
.LB1920:
	movabsq $4294967295, %rax
	movq 0(%rsp), %rsi
	addq $16, %rsp
	ret
.LB1935:
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
.LB1942:
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
	jne .LS11813f
.LS11813l:
	addq $32, %rdx
	vpcmpeqb (%rdx), %ymm15, %ymm0
	vpmovmskb %ymm0, %r9d
	testl %r9d, %r9d
	je .LS11813l
	tzcntl %r9d, %r9d
	addq %rdx, %r9
	subq %rax, %r9
	jmp .LS11813d
.LS11813f:
	tzcntl %r9d, %r9d
.LS11813d:
	vzeroupper
.LB1951:
	xorl %eax, %eax
.LB1960:
	movslq %eax, %rcx
	cmpb $0, (%rdi,%rcx,1)
	je .LB1962
.LB1961:
	incl %eax
	jmp .LB1960
.LB1962:
	testl %eax, %eax
	je .LB1973
.LB1974:
	subl %eax, %r9d
.LB1977:
	cmpl %r9d, %r8d
	jg .LB1980
.LB1978:
	xorl %ecx, %ecx
.LB1988:
	cmpl %eax, %ecx
	jl .LB1989
.LB11812:
	movl $1, %ecx
.LB1991:
	testb %cl, %cl
	jne .LB2013
.LB2014:
	incl %r8d
	cmpl %r9d, %r8d
	jle .LB1978
.LB1980:
	movabsq $4294967295, %rax
	movq 16(%rsp), %rbx
	movq 8(%rsp), %rsi
	movq 0(%rsp), %rdi
	addq $32, %rsp
	ret
.LB1989:
	leal (%r8,%rcx), %edx
	movslq %ecx, %rbx
	movslq %edx, %rdx
	movzbl (%rsi,%rdx,1), %edx
	movzbl (%rdi,%rbx,1), %ebx
	cmpb %bl, %dl
	jne .LB2007
.LB2008:
	incl %ecx
	cmpl %eax, %ecx
	jl .LB1989
	jmp .LB11812
.LB2007:
	xorl %ecx, %ecx
	testb %cl, %cl
	je .LB2014
.LB2013:
	movl %r8d, %eax
	movq 16(%rsp), %rbx
	movq 8(%rsp), %rsi
	movq 0(%rsp), %rdi
	addq $32, %rsp
	ret
.LB1973:
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
.LB2020:
	movq %rcx, %rsi
	movq %rdx, %rdi
	xorl %ebx, %ebx
.LB2026:
	movslq %ebx, %rax
	cmpb $0, (%rsi,%rax,1)
	je .LB2028
.LB2035:
	cmpb $0, (%rdi,%rax,1)
	je .LB2028
.LB2027:
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
	jne .LB2057
.LB2058:
	incl %ebx
	jmp .LB2026
.LB2028:
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
.LB2057:
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
.LB2078:
	xorl %eax, %eax
.LB2082:
	movslq %eax, %rsi
	movzbl (%rdx,%rsi,1), %esi
	testb %sil, %sil
	je .LB2084
.LB2083:
	movslq %eax, %rdi
	movzbl (%rcx,%rdi,1), %edi
	cmpb %sil, %dil
	jne .LB2100
.LB2101:
	incl %eax
	jmp .LB2082
.LB2084:
	movl $1, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB2100:
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
.LB2105:
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
	jne .LS11814f
.LS11814l:
	addq $32, %rdx
	vpcmpeqb (%rdx), %ymm15, %ymm0
	vpmovmskb %ymm0, %r8d
	testl %r8d, %r8d
	je .LS11814l
	tzcntl %r8d, %r8d
	addq %rdx, %r8
	subq %rax, %r8
	jmp .LS11814d
.LS11814f:
	tzcntl %r8d, %r8d
.LS11814d:
	vzeroupper
.LB2112:
	xorl %eax, %eax
.LB2121:
	movslq %eax, %rcx
	cmpb $0, (%rdi,%rcx,1)
	je .LB2123
.LB2122:
	incl %eax
	jmp .LB2121
.LB2123:
	cmpl %r8d, %eax
	jg .LB2135
.LB2136:
	subl %eax, %r8d
	xorl %ecx, %ecx
.LB2142:
	cmpl %eax, %ecx
	jge .LB2145
.LB2143:
	leal (%r8,%rcx), %edx
	movslq %ecx, %r9
	movslq %edx, %rdx
	movzbl (%rsi,%rdx,1), %edx
	movzbl (%rdi,%r9,1), %r9d
	cmpb %r9b, %dl
	jne .LB2161
.LB2162:
	incl %ecx
	cmpl %eax, %ecx
	jl .LB2143
.LB2145:
	movl $1, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB2161:
	xorl %eax, %eax
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB2135:
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
.LB2166:
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
	jne .LS11817f
.LS11817l:
	addq $32, %rdx
	vpcmpeqb (%rdx), %ymm15, %ymm0
	vpmovmskb %ymm0, %edi
	testl %edi, %edi
	je .LS11817l
	tzcntl %edi, %edi
	addq %rdx, %rdi
	subq %rax, %rdi
	jmp .LS11817d
.LS11817f:
	tzcntl %edi, %edi
.LS11817d:
	vzeroupper
.LB2171:
	leaq 1(%rdi), %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	testq %rax, %rax
	je .LB2191
.LB2192:
	movslq %edi, %rcx
	incq %rcx
	cmpq $32, %rcx
	jge .LB11815
.LB11816:
	xorl %ecx, %ecx
.LB2196:
	cmpl %edi, %ecx
	jg .LB2199
.LB2197:
	movslq %ecx, %rdx
	movzbl (%rsi,%rdx,1), %r8d
	movb %r8b, (%rax,%rdx,1)
	incl %ecx
	cmpl %edi, %ecx
	jle .LB2197
	jmp .LB2199
.LB11815:
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
.LB2199:
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB2191:
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
.LB2214:
	movq %rcx, %rsi
	movl %edx, %edi
	leaq 1(%rdi), %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	testq %rax, %rax
	je .LB2228
.LB2229:
	movslq %edi, %rcx
	xorl %edx, %edx
.LB2233:
	cmpq %rcx, %rdx
	jge .LB2236
.LB2241:
	movzbl (%rsi,%rdx,1), %r8d
	testb %r8b, %r8b
	je .LB2236
.LB2234:
	movb %r8b, (%rax,%rdx,1)
	incq %rdx
	cmpq %rcx, %rdx
	jl .LB2241
.LB2236:
	movslq %edi, %rcx
	movb $0, (%rax,%rcx,1)
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB2228:
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
.LB2264:
	movq %rcx, %rsi
	movl %edx, %edi
	movl %r8d, %ebx
	leaq 1(%rbx), %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	testq %rax, %rax
	je .LB2279
.LB2280:
	xorl %ecx, %ecx
.LB2284:
	cmpl %ebx, %ecx
	jge .LB2287
.LB2292:
	leal (%rdi,%rcx), %edx
	movslq %edx, %rdx
	cmpb $0, (%rsi,%rdx,1)
	je .LB2287
.LB2285:
	leal (%rdi,%rcx), %edx
	movslq %edx, %rdx
	movzbl (%rsi,%rdx,1), %edx
	movslq %ecx, %r8
	movb %dl, (%rax,%r8,1)
	incl %ecx
	cmpl %ebx, %ecx
	jl .LB2292
.LB2287:
	movslq %ebx, %rcx
	movb $0, (%rax,%rcx,1)
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB2279:
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
.LB2319:
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
	jne .LS11826f
.LS11826l:
	addq $32, %rdx
	vpcmpeqb (%rdx), %ymm15, %ymm0
	vpmovmskb %ymm0, %edi
	testl %edi, %edi
	je .LS11826l
	tzcntl %edi, %edi
	addq %rdx, %rdi
	subq %rax, %rdi
	jmp .LS11826d
.LS11826f:
	tzcntl %edi, %edi
.LS11826d:
	vzeroupper
	movl %edi, %r12d
.LB2325:
	xorl %r13d, %r13d
.LB2335:
	movslq %r13d, %rax
	cmpb $0, (%rbx,%rax,1)
	je .LB2337
.LB2336:
	incl %r13d
	jmp .LB2335
.LB2337:
	leaq (%r12,%r13), %rax
	leaq 1(%rax), %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	testq %rax, %rax
	je .LB2360
.LB2361:
	cmpl $32, %r12d
	jge .LB11818
.LB11819:
	movslq %r12d, %rcx
	xorl %edx, %edx
	testq %rcx, %rcx
	cmovg %rcx, %rdx
	shrq $2, %rdx
	xorl %edi, %edi
.LB11820:
	testq %rdx, %rdx
	je .LB11822
.LB11821:
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
	jne .LB11821
.LB11822:
.LB2365:
	cmpq %rcx, %rdi
	jge .LB2368
.LB2366:
	movzbl (%rsi,%rdi,1), %edx
	movb %dl, (%rax,%rdi,1)
	incq %rdi
	cmpq %rcx, %rdi
	jl .LB2366
	jmp .LB2368
.LB11818:
	movslq %r12d, %rcx
	movq %rcx, %rdx
	sarq $63, %rdx
	notq %rdx
	andq %rdx, %rcx
	movq %rax, %rdi
	rep movsb
.LB2368:
	xorl %ecx, %ecx
	testl %r13d, %r13d
	cmovg %r13d, %ecx
	shrl $2, %ecx
	xorl %edx, %edx
.LB11823:
	testl %ecx, %ecx
	je .LB11825
.LB11824:
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
	jne .LB11824
.LB11825:
.LB2382:
	cmpl %r13d, %edx
	jge .LB2385
.LB2383:
	movslq %edx, %rcx
	movzbl (%rbx,%rcx,1), %ecx
	leal (%r12,%rdx), %esi
	movslq %esi, %rsi
	movb %cl, (%rax,%rsi,1)
	incl %edx
	cmpl %r13d, %edx
	jl .LB2383
.LB2385:
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
.LB2360:
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
.LB2408:
	movq %rcx, %rax
	xorl %ecx, %ecx
.LB2412:
	leaq 1(%rax), %rdx
	cmpb $0, (%rax)
	je .LB2419
.LB2420:
	incl %ecx
	movq %rdx, %rax
	jmp .LB2412
.LB2419:
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
.LB2424:
	testw %cx, %cx
	je .LB2430
.LB2431:
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
.LB2452:
	testw %cx, %cx
	jle .LB2454
.LB2453:
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
	jg .LB2453
.LB2454:
	testb %al, %al
	jne .LB2474
.LB2475:
	xorl %eax, %eax
.LB2476:
	leal -1(%rsi), %ecx
.LB2485:
	testw %cx, %cx
	js .LB2487
.LB2486:
	movswl %cx, %esi
	movslq %esi, %rsi
	movzbl (%rsp,%rsi,1), %esi
	movswq %ax, %rdi
	movb %sil, (%rdx,%rdi,1)
	incl %eax
	decl %ecx
	testw %cx, %cx
	jns .LB2486
	jmp .LB2487
.LB2474:
	movb $45, (%rdx)
	movl $1, %eax
	jmp .LB2476
.LB2487:
	movswq %ax, %rcx
	movzwl %ax, %eax
	movb $0, (%rdx,%rcx,1)
	movq 16(%rsp), %rsi
	movq 8(%rsp), %rdi
	addq $32, %rsp
	ret
.LB2430:
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
.LB2507:
	testl %ecx, %ecx
	je .LB2512
.LB2513:
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
.LB2531:
	testl %ecx, %ecx
	jle .LB2533
.LB2532:
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
	jg .LB2532
.LB2533:
	cmpl $1, %edi
	je .LB2549
.LB2550:
	xorl %ecx, %ecx
.LB2551:
	decl %eax
.LB2558:
	testl %eax, %eax
	js .LB2560
.LB2559:
	movslq %eax, %rsi
	movzbl -8(%rsp,%rsi,1), %esi
	movslq %ecx, %rdi
	movb %sil, (%rdx,%rdi,1)
	incl %ecx
	decl %eax
	jns .LB2559
	jmp .LB2560
.LB2549:
	movb $45, (%rdx)
	movl $1, %ecx
	jmp .LB2551
.LB2560:
	movslq %ecx, %rax
	movb $0, (%rdx,%rax,1)
	movl %ecx, %eax
	movq 32(%rsp), %rsi
	movq 24(%rsp), %rdi
	addq $48, %rsp
	ret
.LB2512:
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
.LB2578:
	movq %rdx, %rsi
	testq %rcx, %rcx
	je .LB2584
.LB2585:
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
.LB2608:
	testq %rcx, %rcx
	jle .LB2610
.LB2609:
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
	jg .LB2609
.LB2610:
	cmpq $1, %rdi
	je .LB2632
.LB2633:
	xorl %eax, %eax
.LB2634:
	leaq -1(%r8), %rcx
.LB2643:
	testq %rcx, %rcx
	js .LB2645
.LB2644:
	movslq %ecx, %rdx
	movzbl -8(%rsp,%rdx,1), %edx
	movb %dl, (%rsi,%rax,1)
	incq %rax
	decq %rcx
	jns .LB2644
	jmp .LB2645
.LB2632:
	movb $45, (%rsi)
	movl $1, %eax
	jmp .LB2634
.LB2645:
	movb $0, (%rsi,%rax,1)
	movq 32(%rsp), %rsi
	movq 24(%rsp), %rdi
	addq $48, %rsp
	ret
.LB2584:
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
.LB2665:
	testw %cx, %cx
	je .LB2671
.LB2672:
	movq .LZERO(%rip), %r10
	movq %r10, (%rsp)
	xorl %eax, %eax
.LB2684:
	testw %cx, %cx
	jbe .LB2686
.LB2685:
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
	ja .LB2685
.LB2686:
	movq %rax, %rcx
	xorl %eax, %eax
.LB2707:
	testw %cx, %cx
	jbe .LB2709
.LB2708:
	decl %ecx
	movswl %cx, %esi
	movslq %esi, %rsi
	movzbl (%rsp,%rsi,1), %esi
	movswq %ax, %rdi
	movb %sil, (%rdx,%rdi,1)
	incl %eax
	testw %cx, %cx
	ja .LB2708
.LB2709:
	movswq %ax, %rcx
	movzwl %ax, %eax
	movb $0, (%rdx,%rcx,1)
	movq 16(%rsp), %rsi
	movq 8(%rsp), %rdi
	addq $32, %rsp
	ret
.LB2671:
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
.LB2729:
	testl %ecx, %ecx
	je .LB2734
.LB2735:
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -8(%rsp)
	vzeroupper
	xorl %eax, %eax
.LB2745:
	testl %ecx, %ecx
	jbe .LB2747
.LB2746:
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
	ja .LB2746
.LB2747:
	movq %rax, %rcx
	xorl %eax, %eax
.LB2763:
	testl %ecx, %ecx
	jbe .LB2765
.LB2764:
	decl %ecx
	movslq %ecx, %rsi
	movzbl -8(%rsp,%rsi,1), %esi
	movslq %eax, %rdi
	movb %sil, (%rdx,%rdi,1)
	incl %eax
	testl %ecx, %ecx
	ja .LB2764
.LB2765:
	movslq %eax, %rcx
	movb $0, (%rdx,%rcx,1)
	movq 32(%rsp), %rsi
	movq 24(%rsp), %rdi
	addq $48, %rsp
	ret
.LB2734:
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
.LB2783:
	movq %rdx, %rsi
	testq %rcx, %rcx
	je .LB2789
.LB2790:
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -8(%rsp)
	vzeroupper
	xorl %edi, %edi
.LB2802:
	testq %rcx, %rcx
	je .LB2804
.LB2803:
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
	jne .LB2803
.LB2804:
	xorl %eax, %eax
.LB2825:
	testq %rdi, %rdi
	je .LB2827
.LB2826:
	decq %rdi
	movslq %edi, %rcx
	movzbl -8(%rsp,%rcx,1), %ecx
	movb %cl, (%rsi,%rax,1)
	incq %rax
	testq %rdi, %rdi
	jne .LB2826
.LB2827:
	movb $0, (%rsi,%rax,1)
	movq 32(%rsp), %rsi
	movq 24(%rsp), %rdi
	addq $48, %rsp
	ret
.LB2789:
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
.LB2847:
	xorl %eax, %eax
.LB2854:
	movslq %eax, %rdx
	movzbl (%rcx,%rdx,1), %esi
	cmpb $32, %sil
	je .LB2855
.LB2863:
	cmpb $9, %sil
	je .LB2855
.LB2872:
	cmpb $10, (%rcx,%rdx,1)
	je .LB2855
.LB2881:
	cmpb $13, (%rcx,%rdx,1)
	jne .LB2856
.LB2855:
	incl %eax
	jmp .LB2854
.LB2856:
	movzbl (%rcx,%rdx,1), %edx
	cmpb $45, %dl
	je .LB2898
.LB2899:
	cmpb $43, %dl
	je .LB2910
.LB2911:
	movl $1, %edx
.LB2900:
	movq %rax, %rsi
	xorl %eax, %eax
.LB2914:
	movslq %esi, %rdi
	movzbl (%rcx,%rdi,1), %edi
	testb %dil, %dil
	je .LB2916
.LB2915:
	cmpb $48, %dil
	jb .LB2916
.LB2930:
	cmpb $57, %dil
	ja .LB2916
.LB2936:
	movzbl %dil, %edi
	subl $48, %edi
	imull $10, %eax, %eax
	addl %edi, %eax
	incl %esi
	jmp .LB2914
.LB2910:
	incl %eax
	movl $1, %edx
	jmp .LB2900
.LB2898:
	incl %eax
	movl $4294967295, %edx
	jmp .LB2900
.LB2916:
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
.LB2951:
	xorl %eax, %eax
.LB2957:
	movslq %eax, %rdx
	movzbl (%rcx,%rdx,1), %edx
	leal -9(%rdx), %esi
	cmpb $24, %sil
	jae .LB11827
.LB11828:
	movzbl %sil, %esi
	movl $8388627, %edi
	btq %rsi, %rdi
	jae .LB11827
.LB2958:
	incl %eax
	jmp .LB2957
.LB11827:
	cmpb $45, %dl
	je .LB3001
.LB3002:
	leal 1(%rax), %esi
	cmpb $43, %dl
	cmove %esi, %eax
	movq %rax, %rdx
	xorl %eax, %eax
.LB3014:
	movslq %edx, %rsi
	movzbl (%rcx,%rsi,1), %esi
	movzbl %sil, %edi
	testb %sil, %sil
	je .LB3016
.LB3015:
	cmpb $48, %sil
	jb .LB3037
.LB3030:
	cmpb $57, %sil
	ja .LB3037
.LB3036:
	subl $48, %edi
	imull $10, %eax, %eax
	addl %edi, %eax
	incl %edx
	jmp .LB3014
.LB3037:
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB3016:
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB3001:
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
.LB3049:
	xorl %eax, %eax
.LB3057:
	movslq %eax, %rdx
	movzbl (%rcx,%rdx,1), %esi
	cmpb $32, %sil
	je .LB3058
.LB3066:
	cmpb $9, %sil
	je .LB3058
.LB3075:
	cmpb $10, (%rcx,%rdx,1)
	je .LB3058
.LB3084:
	cmpb $13, (%rcx,%rdx,1)
	jne .LB3059
.LB3058:
	incl %eax
	jmp .LB3057
.LB3059:
	movzbl (%rcx,%rdx,1), %edx
	cmpb $45, %dl
	je .LB3101
.LB3102:
	cmpb $43, %dl
	je .LB3114
.LB3115:
	movq %rax, %rdx
	movl $1, %eax
.LB3103:
	movq %rdx, %rsi
	xorl %edx, %edx
.LB3118:
	movslq %esi, %rdi
	movzbl (%rcx,%rdi,1), %edi
	testb %dil, %dil
	je .LB3120
.LB3119:
	cmpb $48, %dil
	jb .LB3120
.LB3134:
	cmpb $57, %dil
	ja .LB3120
.LB3140:
	movzbl %dil, %edi
	subl $48, %edi
	imulq $10, %rdx, %rdx
	addq %rdi, %rdx
	incl %esi
	jmp .LB3118
.LB3114:
	leal 1(%rax), %edx
	movl $1, %eax
	jmp .LB3103
.LB3101:
	leal 1(%rax), %edx
	movq $-1, %rax
	jmp .LB3103
.LB3120:
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
.LB3157:
	xorl %eax, %eax
.LB3163:
	movslq %eax, %rdx
	movzbl (%rcx,%rdx,1), %edx
	leal -9(%rdx), %esi
	cmpb $24, %sil
	jae .LB11829
.LB11830:
	movzbl %sil, %esi
	movl $8388627, %edi
	btq %rsi, %rdi
	jae .LB11829
.LB3164:
	incl %eax
	jmp .LB3163
.LB11829:
	cmpb $45, %dl
	je .LB3207
.LB3208:
	leal 1(%rax), %esi
	cmpb $43, %dl
	cmove %esi, %eax
	movq %rax, %rdx
	xorl %eax, %eax
.LB3221:
	movslq %edx, %rsi
	movzbl (%rcx,%rsi,1), %esi
	movzbl %sil, %edi
	testb %sil, %sil
	je .LB3223
.LB3222:
	cmpb $48, %sil
	jb .LB3244
.LB3237:
	cmpb $57, %sil
	ja .LB3244
.LB3243:
	leal -48(%rdi), %esi
	imulq $10, %rax, %rax
	addq %rsi, %rax
	incl %edx
	jmp .LB3221
.LB3244:
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB3223:
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB3207:
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
.LB3258:
	xorps %xmm1, %xmm1
	ucomiss %xmm0, %xmm1
	ja .LB3266
.LB3267:
	xorl %eax, %eax
.LB3268:
	xorps %xmm1, %xmm1
	ucomiss %xmm1, %xmm0
	sete %cl
	setnp %sil
	movzbl %cl, %ecx
	movzbl %sil, %esi
	andl %esi, %ecx
	testb %cl, %cl
	jne .LB3276
.LB3277:
	cvttss2siq %xmm0, %rcx
	movl %ecx, %ecx
	movslq %ecx, %rsi
	xorps %xmm1, %xmm1
	cvtsi2ssq %rsi, %xmm1
	subss %xmm1, %xmm0
	movl $1, %esi
	xorl %edi, %edi
.LB3324:
	cmpl %r8d, %edi
	jge .LB3326
.LB3325:
	imull $10, %esi, %esi
	incl %edi
	cmpl %r8d, %edi
	jl .LB3325
	jmp .LB3326
.LB3266:
	movb $45, (%rdx)
	xorps %xmm1, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subss %xmm15, %xmm0
	movl $1, %eax
	jmp .LB3268
.LB3326:
	movslq %esi, %rdi
	xorps %xmm1, %xmm1
	cvtsi2ssq %rdi, %xmm1
	movabsq $1056964608, %r10
	movq %r10, %xmm2
	vfmadd132ss %xmm1, %xmm2, %xmm0
	cvttss2siq %xmm0, %rdi
	movl %edi, %edi
	cmpl %esi, %edi
	jge .LB3346
.LB3347:
.LB3348:
	testl %ecx, %ecx
	je .LB3364
.LB3365:
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, 32(%rsp)
	vzeroupper
	movq %rcx, %rsi
	xorl %ecx, %ecx
.LB3377:
	testl %esi, %esi
	jle .LB3379
.LB3378:
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
	jg .LB3378
	jmp .LB3379
.LB3346:
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
	jne .LB3361
.LB3354:
	testl %r8d, %r8d
	jle .LB3361
.LB3361:
	xorl %edi, %edi
	testl %ecx, %ecx
	je .LB3364
	jmp .LB3365
.LB3379:
	decl %ecx
.LB3395:
	testl %ecx, %ecx
	js .LB3397
.LB3396:
	movslq %ecx, %rsi
	movzbl 32(%rsp,%rsi,1), %esi
	movslq %eax, %r9
	movb %sil, (%rdx,%r9,1)
	incl %eax
	decl %ecx
	jns .LB3396
.LB3397:
.LB3366:
	testl %r8d, %r8d
	jg .LB3412
.LB3413:
	movslq %eax, %rcx
	movb $0, (%rdx,%rcx,1)
	movq 80(%rsp), %rbx
	movq 72(%rsp), %rsi
	movq 64(%rsp), %rdi
	addq $96, %rsp
	ret
.LB3364:
	movslq %eax, %rcx
	movb $48, (%rdx,%rcx,1)
	incl %eax
	testl %r8d, %r8d
	jle .LB3413
.LB3412:
	movslq %eax, %rcx
	movb $46, (%rdx,%rcx,1)
	incl %eax
	testl %edi, %edi
	je .LB3423
.LB3424:
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, (%rsp)
	vzeroupper
	xorl %ecx, %ecx
.LB3445:
	testl %edi, %edi
	jle .LB3447
.LB3446:
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
	jg .LB3446
.LB3447:
	subl %ecx, %r8d
	xorl %esi, %esi
.LB3465:
	cmpl %r8d, %esi
	jge .LB3467
.LB3466:
	movslq %eax, %rdi
	movb $48, (%rdx,%rdi,1)
	incl %eax
	incl %esi
	cmpl %r8d, %esi
	jl .LB3466
.LB3467:
	decl %ecx
.LB3482:
	testl %ecx, %ecx
	js .LB3484
.LB3483:
	movslq %ecx, %rsi
	movzbl (%rsp,%rsi,1), %esi
	movslq %eax, %rdi
	movb %sil, (%rdx,%rdi,1)
	incl %eax
	decl %ecx
	jns .LB3483
.LB3484:
.LB3425:
	movslq %eax, %rcx
	movb $0, (%rdx,%rcx,1)
	movq 80(%rsp), %rbx
	movq 72(%rsp), %rsi
	movq 64(%rsp), %rdi
	addq $96, %rsp
	ret
.LB3423:
	xorl %ecx, %ecx
.LB3427:
	cmpl %r8d, %ecx
	jge .LB3429
.LB3428:
	movslq %eax, %rsi
	movb $48, (%rdx,%rsi,1)
	incl %eax
	incl %ecx
	cmpl %r8d, %ecx
	jl .LB3428
.LB3429:
	jmp .LB3425
.LB3276:
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
.LB11831:
	testl %esi, %esi
	je .LB11833
.LB11832:
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
	jne .LB11832
.LB11833:
.LB3288:
	cmpl %r8d, %edi
	jge .LB3290
.LB3289:
	leal (%rcx,%rdi), %esi
	movslq %esi, %rsi
	movb $48, (%rdx,%rsi,1)
	incl %edi
	cmpl %r8d, %edi
	jl .LB3289
.LB3290:
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
.LB3502:
	movq %rdx, %rcx
	xorps %xmm1, %xmm1
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm0, %xmm1
	ja .LB3510
.LB3511:
	xorl %esi, %esi
.LB3512:
	xorps %xmm1, %xmm1
	cvtss2sd %xmm1, %xmm1
	ucomisd %xmm1, %xmm0
	sete %al
	setnp %dl
	movzbl %al, %eax
	movzbl %dl, %edx
	andl %edx, %eax
	testb %al, %al
	jne .LB3520
.LB3521:
	cvttsd2siq %xmm0, %rax
	xorps %xmm1, %xmm1
	cvtsi2sdq %rax, %xmm1
	subsd %xmm1, %xmm0
	movl $1, %edx
	xorl %edi, %edi
.LB3570:
	cmpl %r8d, %edi
	jge .LB3572
.LB3571:
	imulq $10, %rdx, %rdx
	incl %edi
	cmpl %r8d, %edi
	jl .LB3571
	jmp .LB3572
.LB3510:
	movb $69, (%rcx)
	xorps %xmm1, %xmm1
	movaps %xmm0, %xmm15
	movaps %xmm1, %xmm0
	subsd %xmm15, %xmm0
	movl $1, %esi
	jmp .LB3512
.LB3572:
	xorps %xmm1, %xmm1
	cvtsi2sdq %rdx, %xmm1
	movabsq $1056964608, %r10
	movq %r10, %xmm2
	cvtss2sd %xmm2, %xmm2
	vfmadd132sd %xmm1, %xmm2, %xmm0
	cvttsd2siq %xmm0, %rdi
	cmpq %rdx, %rdi
	jge .LB3594
.LB3595:
.LB3596:
	testq %rax, %rax
	je .LB3617
.LB3618:
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, 32(%rsp)
	vzeroupper
	xorl %r9d, %r9d
	movq %rax, %rbx
.LB3630:
	testq %rbx, %rbx
	jle .LB3632
.LB3631:
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
	jg .LB3631
	jmp .LB3632
.LB3594:
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
	jne .LB3613
.LB3606:
	testl %r8d, %r8d
	jle .LB3613
.LB3613:
	movq %rdi, %rax
	xorl %edi, %edi
	testq %rax, %rax
	je .LB3617
	jmp .LB3618
.LB3632:
	leal -1(%r9), %eax
.LB3652:
	testl %eax, %eax
	js .LB3654
.LB3653:
	movslq %eax, %rdx
	movzbl 32(%rsp,%rdx,1), %edx
	movslq %esi, %r9
	movb %dl, (%rcx,%r9,1)
	incl %esi
	decl %eax
	jns .LB3653
.LB3654:
.LB3619:
	testl %r8d, %r8d
	jg .LB3669
.LB3670:
	movq %rsi, %rax
	movslq %eax, %rdx
	movb $0, (%rcx,%rdx,1)
	movq 80(%rsp), %rbx
	movq 72(%rsp), %rsi
	movq 64(%rsp), %rdi
	addq $96, %rsp
	ret
.LB3617:
	movslq %esi, %rax
	movb $48, (%rcx,%rax,1)
	incl %esi
	testl %r8d, %r8d
	jle .LB3670
.LB3669:
	movslq %esi, %rax
	movb $46, (%rcx,%rax,1)
	incl %esi
	testq %rdi, %rdi
	je .LB3681
.LB3682:
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, (%rsp)
	vzeroupper
	movq %rdi, %r9
	xorl %edi, %edi
.LB3703:
	testq %r9, %r9
	jle .LB3705
.LB3704:
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
	jg .LB3704
.LB3705:
	subl %edi, %r8d
	xorl %eax, %eax
.LB3727:
	cmpl %r8d, %eax
	jge .LB3729
.LB3728:
	movslq %esi, %rdx
	movb $48, (%rcx,%rdx,1)
	incl %esi
	incl %eax
	cmpl %r8d, %eax
	jl .LB3728
.LB3729:
	leal -1(%rdi), %eax
.LB3744:
	testl %eax, %eax
	js .LB3746
.LB3745:
	movslq %eax, %rdx
	movzbl (%rsp,%rdx,1), %edx
	movslq %esi, %rdi
	movb %dl, (%rcx,%rdi,1)
	incl %esi
	decl %eax
	jns .LB3745
.LB3746:
.LB3683:
	movq %rsi, %rax
	movslq %eax, %rdx
	movb $0, (%rcx,%rdx,1)
	movq 80(%rsp), %rbx
	movq 72(%rsp), %rsi
	movq 64(%rsp), %rdi
	addq $96, %rsp
	ret
.LB3681:
	xorl %eax, %eax
.LB3685:
	cmpl %r8d, %eax
	jge .LB3687
.LB3686:
	movslq %esi, %rdx
	movb $48, (%rcx,%rdx,1)
	incl %esi
	incl %eax
	cmpl %r8d, %eax
	jl .LB3686
.LB3687:
	jmp .LB3683
.LB3520:
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
.LB11838:
	testl %edx, %edx
	je .LB11840
.LB11839:
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
	jne .LB11839
.LB11840:
.LB3533:
	cmpl %r8d, %edi
	jge .LB3535
.LB3534:
	leal (%rax,%rdi), %edx
	movslq %edx, %rdx
	movb $48, (%rcx,%rdx,1)
	incl %edi
	cmpl %r8d, %edi
	jl .LB3534
.LB3535:
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
.LB3764:
	xorl %eax, %eax
	xorl %edx, %edx
.LB3767:
	movslq %edx, %rsi
	movzbl (%rcx,%rsi,1), %esi
	testb %sil, %sil
	je .LB3770
.LB3768:
	leal 1(%rax), %edi
	cmpb $10, %sil
	cmove %edi, %eax
	incl %edx
	jmp .LB3767
.LB3770:
	testl %eax, %eax
	jg .LB3800
.LB3792:
	cmpb $0, (%rcx)
	jne .LB3800
.LB3801:
	movq 0(%rsp), %rsi
	movq -8(%rsp), %rdi
	addq $16, %rsp
	ret
.LB3800:
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
.LB3806:
	xorl %eax, %eax
	xorl %esi, %esi
.LB3811:
	movslq %esi, %rdi
	movzbl (%rcx,%rdi,1), %edi
	testb %dil, %dil
	jne .LB3812
.LB11845:
	xorl %esi, %esi
.LB3814:
	cmpl %edx, %eax
	jne .LB3844
.LB3845:
	movq %rsi, %rax
.LB3851:
	movslq %eax, %rdx
	movzbl (%rcx,%rdx,1), %edx
	testb %dl, %dl
	je .LB3853
.LB3860:
	cmpb $10, %dl
	je .LB3853
.LB3852:
	incl %eax
	jmp .LB3851
.LB3812:
	cmpl %edx, %eax
	je .LB3825
.LB3826:
	leal 1(%rax), %r8d
	cmpb $10, %dil
	cmove %r8d, %eax
	incl %esi
	jmp .LB3811
.LB3825:
	cmpl %edx, %eax
	jne .LB3844
	jmp .LB3845
.LB3853:
	movl %eax, %r8d
	subl %esi, %r8d
	movq %rsi, %rdx
	callq standard__strings__manip__substring__3__byteE1_ptr1__intE1__intE1__ret_byteE1_ptr1
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB3844:
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
.LB3878:
	movq %rcx, %rsi
	xorl %edi, %edi
	xorl %ebx, %ebx
	xorl %r12d, %r12d
.LB3882:
	movslq %r12d, %rax
	movzbl (%rsi,%rax,1), %eax
	testb %al, %al
	je .LB3885
.LB3883:
	movzbl %al, %ecx
	callq standard__strings__helpers__is_whitespace__1__charE1__ret_boolE1
	testb %al, %al
	jne .LB3898
.LB3899:
	testb %bl, %bl
	je .LB3903
.LB3904:
.LB3900:
	incl %r12d
	jmp .LB3882
.LB3885:
	movl %edi, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB3903:
	incl %edi
	movl $1, %ebx
	jmp .LB3900
.LB3898:
	xorl %ebx, %ebx
	jmp .LB3900
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
.LB3910:
	movq %rcx, %rbx
	movq %rdx, %rsi
	movq %r8, %r12
	movq %rbx, %rcx
	movq %rsi, %rdx
	xorl %r8d, %r8d
	callq standard__strings__helpers__find_substring__3__byteE1_ptr1__byteE1_ptr1__intE1__ret_intE1
	movl %eax, %r13d
	cmpl $4294967295, %r13d
	je .LB3921
.LB3922:
	xorl %r14d, %r14d
.LB3927:
	movslq %r14d, %rax
	cmpb $0, (%rbx,%rax,1)
	je .LB3929
.LB3928:
	incl %r14d
	jmp .LB3927
.LB3929:
	xorl %r15d, %r15d
.LB3939:
	movslq %r15d, %rax
	cmpb $0, (%rsi,%rax,1)
	je .LB3941
.LB3940:
	incl %r15d
	jmp .LB3939
.LB3941:
	movq $0, -64(%rbp)
.LB3951:
	movq -64(%rbp), %rax
	movslq %eax, %rax
	cmpb $0, (%r12,%rax,1)
	je .LB3953
.LB3952:
	movq -64(%rbp), %rax
	incl %eax
	movq %rax, -64(%rbp)
	jmp .LB3951
.LB3953:
	movl %r14d, %eax
	subl %r15d, %eax
	movq -64(%rbp), %rcx
	addl %ecx, %eax
	leaq 1(%rax), %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	testq %rax, %rax
	je .LB3979
.LB3980:
	cmpl $32, %r13d
	jge .LB11846
.LB11847:
	movslq %r13d, %rcx
	xorl %edx, %edx
	testq %rcx, %rcx
	cmovg %rcx, %rdx
	shrq $2, %rdx
	xorl %esi, %esi
.LB11848:
	testq %rdx, %rdx
	je .LB11850
.LB11849:
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
	jne .LB11849
.LB11850:
.LB3984:
	cmpq %rcx, %rsi
	jge .LB3987
.LB3985:
	movzbl (%rbx,%rsi,1), %edx
	movb %dl, (%rax,%rsi,1)
	incq %rsi
	cmpq %rcx, %rsi
	jl .LB3985
	jmp .LB3987
.LB11846:
	movslq %r13d, %rcx
	movq %rcx, %rdx
	sarq $63, %rdx
	notq %rdx
	andq %rdx, %rcx
	movq %rax, %rdi
	movq %rbx, %rsi
	rep movsb
.LB3987:
	xorl %ecx, %ecx
	movq -64(%rbp), %rdx
	testl %edx, %edx
	cmovg %edx, %ecx
	shrl $2, %ecx
	xorl %edx, %edx
.LB11851:
	testl %ecx, %ecx
	je .LB11853
.LB11852:
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
	jne .LB11852
.LB11853:
.LB4001:
	movq -64(%rbp), %rcx
	cmpl %ecx, %edx
	jge .LB4004
.LB4002:
	movslq %edx, %rcx
	movzbl (%r12,%rcx,1), %ecx
	leal (%r13,%rdx), %esi
	movslq %esi, %rsi
	movb %cl, (%rax,%rsi,1)
	incl %edx
	jmp .LB4001
.LB4004:
	leal (%r13,%r15), %ecx
.LB4020:
	cmpl %r14d, %ecx
	jg .LB4023
.LB4021:
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
	jle .LB4021
.LB4023:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB3979:
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
.LB3921:
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
.LB4045:
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
.LB11854:
	testq %rdx, %rdx
	je .LB11856
.LB11855:
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
	jne .LB11855
.LB11856:
.LB4056:
	cmpq %rcx, %r8
	jge .LB4058
.LB4057:
	movzbl -32(%rbp,%r8,1), %edx
	movslq (%rdi), %r9
	movb %dl, (%rsi,%r9,1)
	movl (%rdi), %edx
	incl %edx
	movl %edx, (%rdi)
	incq %r8
	cmpq %rcx, %r8
	jl .LB4057
.LB4058:
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
.LB4076:
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
.LB11857:
	testq %rdx, %rdx
	je .LB11859
.LB11858:
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
	jne .LB11858
.LB11859:
.LB4086:
	cmpq %rcx, %r8
	jge .LB4088
.LB4087:
	movzbl -56(%rbp,%r8,1), %edx
	movslq (%rdi), %r9
	movb %dl, (%rsi,%r9,1)
	movl (%rdi), %edx
	incl %edx
	movl %edx, (%rdi)
	incq %r8
	cmpq %rcx, %r8
	jl .LB4087
.LB4088:
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
.LB4106:
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
.LB11860:
	testq %rdx, %rdx
	je .LB11862
.LB11861:
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
	jne .LB11861
.LB11862:
.LB4117:
	cmpq %rcx, %r8
	jge .LB4119
.LB4118:
	movzbl -56(%rbp,%r8,1), %edx
	movslq (%rdi), %r9
	movb %dl, (%rsi,%r9,1)
	movl (%rdi), %edx
	incl %edx
	movl %edx, (%rdi)
	incq %r8
	cmpq %rcx, %r8
	jl .LB4118
.LB4119:
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
.LB4137:
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
.LB11863:
	testq %rdx, %rdx
	je .LB11865
.LB11864:
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
	jne .LB11864
.LB11865:
.LB4148:
	cmpq %rcx, %r8
	jge .LB4150
.LB4149:
	movzbl -32(%rbp,%r8,1), %edx
	movslq (%rdi), %r9
	movb %dl, (%rsi,%r9,1)
	movl (%rdi), %edx
	incl %edx
	movl %edx, (%rdi)
	incq %r8
	cmpq %rcx, %r8
	jl .LB4149
.LB4150:
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
.LB4168:
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
.LB11866:
	testq %rdx, %rdx
	je .LB11868
.LB11867:
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
	jne .LB11867
.LB11868:
.LB4178:
	cmpq %rcx, %r8
	jge .LB4180
.LB4179:
	movzbl -56(%rbp,%r8,1), %edx
	movslq (%rdi), %r9
	movb %dl, (%rsi,%r9,1)
	movl (%rdi), %edx
	incl %edx
	movl %edx, (%rdi)
	incq %r8
	cmpq %rcx, %r8
	jl .LB4179
.LB4180:
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
.LB4198:
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
.LB11869:
	testq %rdx, %rdx
	je .LB11871
.LB11870:
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
	jne .LB11870
.LB11871:
.LB4209:
	cmpq %rcx, %r8
	jge .LB4211
.LB4210:
	movzbl -56(%rbp,%r8,1), %edx
	movslq (%rdi), %r9
	movb %dl, (%rsi,%r9,1)
	movl (%rdi), %edx
	incl %edx
	movl %edx, (%rdi)
	incq %r8
	cmpq %rcx, %r8
	jl .LB4210
.LB4211:
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
.LB4229:
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
.LB11872:
	testq %rdx, %rdx
	je .LB11874
.LB11873:
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
	jne .LB11873
.LB11874:
.LB4239:
	cmpq %rcx, %r8
	jge .LB4241
.LB4240:
	movzbl -56(%rbp,%r8,1), %edx
	movslq (%rdi), %r9
	movb %dl, (%rsi,%r9,1)
	movl (%rdi), %edx
	incl %edx
	movl %edx, (%rdi)
	incq %r8
	cmpq %rcx, %r8
	jl .LB4240
.LB4241:
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
.LB4259:
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
.LB11875:
	testq %rdx, %rdx
	je .LB11877
.LB11876:
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
	jne .LB11876
.LB11877:
.LB4269:
	cmpq %rcx, %r8
	jge .LB4271
.LB4270:
	movzbl -56(%rbp,%r8,1), %edx
	movslq (%rdi), %r9
	movb %dl, (%rsi,%r9,1)
	movl (%rdi), %edx
	incl %edx
	movl %edx, (%rdi)
	incq %r8
	cmpq %rcx, %r8
	jl .LB4270
.LB4271:
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
.LB4289:
	xorl %eax, %eax
.LB4294:
	movslq %eax, %rsi
	movzbl (%rcx,%rsi,1), %esi
	testb %sil, %sil
	je .LB4296
.LB4295:
	movslq (%r8), %rdi
	movb %sil, (%rdx,%rdi,1)
	movl (%r8), %esi
	incl %esi
	movl %esi, (%r8)
	incl %eax
	jmp .LB4294
.LB4296:
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
.LB4318:
	movq %rcx, %rsi
	movq %rdx, %rdi
	testq %rsi, %rsi
	je .LB4332
.LB4325:
	testq %rdi, %rdi
	je .LB4332
.LB4333:
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %ebx
	movq %rdi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	testl %eax, %eax
	je .LB4344
.LB4345:
	cmpl %ebx, %eax
	jg .LB4351
.LB4352:
	movl %ebx, %ecx
	subl %eax, %ecx
.LB4356:
	testl %ecx, %ecx
	js .LB4359
.LB4357:
	xorl %edx, %edx
.LB4366:
	cmpl %eax, %edx
	jl .LB4367
.LB11878:
	movl $1, %edx
.LB4369:
	testb %dl, %dl
	jne .LB4391
.LB4392:
	decl %ecx
	jns .LB4357
.LB4359:
	movabsq $4294967295, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB4367:
	leal (%rcx,%rdx), %r8d
	movslq %edx, %r9
	movslq %r8d, %r8
	movzbl (%rsi,%r8,1), %r8d
	movzbl (%rdi,%r9,1), %r9d
	cmpb %r9b, %r8b
	jne .LB4385
.LB4386:
	incl %edx
	cmpl %eax, %edx
	jl .LB4367
	jmp .LB11878
.LB4385:
	xorl %edx, %edx
	testb %dl, %dl
	je .LB4392
.LB4391:
	movl %ecx, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB4351:
	movabsq $4294967295, %rax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB4344:
	movl %ebx, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB4332:
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
.LB4398:
	movq %rcx, %rsi
	movl %edx, %edi
	testq %rsi, %rsi
	je .LB4405
.LB4406:
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	decl %eax
.LB4412:
	testl %eax, %eax
	js .LB4415
.LB4413:
	movslq %eax, %rcx
	movzbl (%rsi,%rcx,1), %ecx
	cmpb %dil, %cl
	je .LB4427
.LB4428:
	decl %eax
	jns .LB4413
.LB4415:
	movabsq $4294967295, %rax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB4427:
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB4405:
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
.LB4434:
	movq %rcx, %rsi
	movq %rdx, %rdi
	testq %rsi, %rsi
	je .LB4448
.LB4441:
	testq %rdi, %rdi
	je .LB4448
.LB4449:
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %ebx
	movq %rdi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	testl %eax, %eax
	je .LB4465
.LB4459:
	cmpl %ebx, %eax
	jg .LB4465
.LB4466:
	subl %eax, %ebx
	xorl %ecx, %ecx
	xorl %edx, %edx
.LB4471:
	cmpl %ebx, %edx
	jg .LB4473
.LB4472:
	xorl %r8d, %r8d
.LB4479:
	cmpl %eax, %r8d
	jl .LB4480
.LB11879:
	movl $1, %r8d
.LB4482:
	leal 1(%rcx), %r9d
	leal (%rdx,%rax), %r12d
	incl %edx
	testb %r8b, %r8b
	cmovne %r9d, %ecx
	testb %r8b, %r8b
	cmovne %r12d, %edx
	cmpl %ebx, %edx
	jle .LB4472
.LB4473:
	movl %ecx, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB4480:
	leal (%rdx,%r8), %r9d
	movslq %r8d, %r12
	movslq %r9d, %r9
	movzbl (%rsi,%r9,1), %r9d
	movzbl (%rdi,%r12,1), %r12d
	cmpb %r12b, %r9b
	jne .LB4498
.LB4499:
	incl %r8d
	cmpl %eax, %r8d
	jl .LB4480
	jmp .LB11879
.LB4498:
	xorl %r8d, %r8d
	jmp .LB4482
.LB4465:
	xorl %eax, %eax
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB4448:
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
.LB4515:
	movq $0, -24(%rbp)
	movq $0, -32(%rbp)
	leaq -24(%rbp), %rcx
	callq QueryPerformanceCounter
	leaq -32(%rbp), %rcx
	callq QueryPerformanceFrequency
	cmpq $0, -32(%rbp)
	je .LB4523
.LB4524:
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
.LB4523:
	xorl %eax, %eax
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
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
.LB4540:
	movl $1, %eax
	cmpl $1, %eax
	jne .LB4543
.LB4542:
	callq standard__time__win_time_now__0__ret_dataE1_sbits64
	leave
	ret
.LB4543:
	xorl %eax, %eax
	leave
	ret
	.text
	.globl standard__time__ns_to_us__1__dataE1_sbits64__ret_dataE1_sbits64
	.def standard__time__ns_to_us__1__dataE1_sbits64__ret_dataE1_sbits64;
	.scl 2;
	.type 32;
	.endef
standard__time__ns_to_us__1__dataE1_sbits64__ret_dataE1_sbits64:
.LB4546:
	movq %rcx, %rax
	movq standard__time__TIME_NS_PER_US(%rip), %rcx
	cqto
	idivq %rcx
	ret
	.text
	.globl standard__time__ns_to_ms__1__dataE1_sbits64__ret_dataE1_sbits64
	.def standard__time__ns_to_ms__1__dataE1_sbits64__ret_dataE1_sbits64;
	.scl 2;
	.type 32;
	.endef
standard__time__ns_to_ms__1__dataE1_sbits64__ret_dataE1_sbits64:
.LB4551:
	movq %rcx, %rax
	movq standard__time__TIME_NS_PER_MS(%rip), %rcx
	cqto
	idivq %rcx
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
.LB4566:
	movl standard__io__console__out_len(%rip), %edi
	testl %edi, %edi
	je .LB4571
.LB4572:
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
.LB4571:
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
.LB4576:
	movq %rcx, %rsi
	movl %edx, %edi
	testl %edi, %edi
	jle .LB4582
.LB4583:
	cmpl $8192, %edi
	jge .LB4587
.LB4588:
	movl standard__io__console__out_len(%rip), %eax
	addl %edi, %eax
	cmpl $8192, %eax
	jg .LB4596
.LB4598:
	movl %edi, %eax
	shrl $2, %eax
	xorl %ecx, %ecx
.LB11880:
	testl %eax, %eax
	je .LB11882
.LB11881:
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
	jne .LB11881
	jmp .LB11882
.LB4596:
	callq standard__io__console__flush__0__ret_voidE1
	jmp .LB4598
.LB11882:
.LB4599:
	cmpl %edi, %ecx
	jge .LB4601
.LB4600:
	movslq %ecx, %rax
	leaq standard__io__console__out_buf(%rip), %r8
	movzbl (%rsi,%rax,1), %eax
	movl standard__io__console__out_len(%rip), %edx
	addl %ecx, %edx
	incl %ecx
	movslq %edx, %rdx
	movb %al, (%r8,%rdx,1)
	cmpl %edi, %ecx
	jl .LB4600
.LB4601:
	movl standard__io__console__out_len(%rip), %eax
	addl %edi, %eax
	movl %eax, standard__io__console__out_len(%rip)
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
.LB4587:
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
.LB4582:
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
.LB4556:
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
.LB4618:
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
.LB4623:
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
.LB4630:
	testb %cl, %cl
	jne .LB4633
.LB4634:
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
.LB4633:
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
.LB4662:
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
.LB4654:
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
.LB4651:
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
.LB4677:
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
.LB4684:
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
.LB4670:
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
.LB4691:
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
.LB4698:
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
.LB4705:
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
.LB4712:
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
.LB4719:
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
.LB4722:
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
.LB4725:
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
.LB4733:
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
.LB4748:
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
.LB4756:
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
.LB4561:
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
	subq $128, %rsp
	movq %rsi, -8(%rbp)
.LB11344:
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -40(%rbp)
	vzeroupper
	leaq -70(%rbp), %rsi
	movl $540884285, -70(%rbp)
	movl $1751413875, -66(%rbp)
	movl $544235877, -62(%rbp)
	movl $1701999731, -58(%rbp)
	movl $1948283763, -54(%rbp)
	movl $544502629, -50(%rbp)
	movl $171785533, -46(%rbp)
	movw $10, -42(%rbp)
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	callq test_edge_cases__0__ret_voidE1
	callq test_all_size_classes__0__ret_voidE1
	callq test_large_alloc__0__ret_voidE1
	callq test_bin_reuse__0__ret_voidE1
	callq test_write_read__0__ret_voidE1
	callq test_no_overlap__0__ret_voidE1
	callq test_frealloc_same_class__0__ret_voidE1
	callq test_frealloc_grow__0__ret_voidE1
	callq test_frealloc_large_identity__0__ret_voidE1
	callq test_frealloc_chain__0__ret_voidE1
	callq test_coalesce__0__ret_voidE1
	callq test_coalesce_bin_integrity__0__ret_voidE1
	callq test_fragmentation__0__ret_voidE1
	callq test_mixed_pattern__0__ret_voidE1
	callq test_table_stress__0__ret_voidE1
	callq test_double_free_guard__0__ret_voidE1
	callq test_throughput_small__0__ret_voidE1
	callq test_throughput_mixed__0__ret_voidE1
	callq test_throughput_fastpath__0__ret_voidE1
	callq test_bandwidth__0__ret_voidE1
	callq test_frealloc_pressure__0__ret_voidE1
	callq test_slab_exhaustion_recovery__0__ret_voidE1
	movw $10, -72(%rbp)
	leaq -72(%rbp), %rsi
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	movl g_pass(%rip), %ecx
	leaq -40(%rbp), %rdx
	callq standard__strings__i32str__2__dataE1_sbits32__byteE1_ptr1__ret_dataE1_sbits32
	leaq -40(%rbp), %rsi
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	movl $1935765536, -82(%rbp)
	movl $744777075, -78(%rbp)
	movw $32, -74(%rbp)
	leaq -82(%rbp), %rsi
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	movl g_fail(%rip), %ecx
	leaq -40(%rbp), %rdx
	callq standard__strings__i32str__2__dataE1_sbits32__byteE1_ptr1__ret_dataE1_sbits32
	leaq -40(%rbp), %rsi
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	movl $1767990816, -91(%rbp)
	movl $174351724, -87(%rbp)
	movb $0, -83(%rbp)
	leaq -91(%rbp), %rsi
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	movl g_fail(%rip), %eax
	movq -8(%rbp), %rsi
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
.LB11414:
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
.LB4772:
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
.LB4791:
	movslq %eax, %rcx
	cmpw $0, (%rsi,%rcx,2)
	je .LB4793
.LB4792:
.LB4800:
	movslq %eax, %rcx
	movzwl (%rsi,%rcx,2), %ecx
	cmpw $32, %cx
	je .LB4801
.LB4809:
	cmpw $9, %cx
	jne .LB4802
.LB4801:
	incl %eax
	jmp .LB4800
.LB4802:
	testw %cx, %cx
	je .LB4793
.LB4827:
	cmpw $34, %cx
	je .LB4835
.LB4836:
.LB4871:
	movslq %eax, %rcx
	movzwl (%rsi,%rcx,2), %ecx
	testw %cx, %cx
	je .LB4873
.LB4880:
	cmpw $32, %cx
	je .LB4873
.LB4889:
	cmpw $9, %cx
	je .LB4873
.LB4872:
	incl %eax
	jmp .LB4871
.LB4873:
.LB4837:
	incl %edi
	jmp .LB4791
.LB4835:
	incl %eax
.LB4840:
	movslq %eax, %rcx
	movzwl (%rsi,%rcx,2), %ecx
	testw %cx, %cx
	je .LB4842
.LB4849:
	cmpw $34, %cx
	je .LB4842
.LB4841:
	incl %eax
	jmp .LB4840
.LB4842:
	leal 1(%rax), %ecx
	movslq %eax, %rdx
	cmpw $34, (%rsi,%rdx,2)
	cmove %ecx, %eax
	jmp .LB4837
.LB4793:
	movq %rdi, %rcx
	shlq $3, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, %rbx
	xorl %r12d, %r12d
	xorl %eax, %eax
	xorl %ecx, %ecx
.LB4908:
	movslq %eax, %rdx
	cmpw $0, (%rsi,%rdx,2)
	je .LB4910
.LB4909:
.LB4917:
	movslq %eax, %rdx
	movzwl (%rsi,%rdx,2), %edx
	cmpw $32, %dx
	je .LB4918
.LB4926:
	cmpw $9, %dx
	jne .LB4919
.LB4918:
	incl %eax
	jmp .LB4917
.LB4919:
	testw %dx, %dx
	je .LB4910
.LB4944:
	cmpw $34, %dx
	je .LB4953
.LB4954:
	movq %rax, %rdx
	xorl %r8d, %r8d
.LB4992:
	movslq %edx, %r9
	movzwl (%rsi,%r9,2), %r9d
	testw %r9w, %r9w
	je .LB4994
.LB5001:
	cmpw $32, %r9w
	je .LB4994
.LB5010:
	cmpw $9, %r9w
	je .LB4994
.LB4993:
	incl %r8d
	incl %edx
	jmp .LB4992
.LB4994:
	movq %rdx, %r13
	movq %rax, %r14
	movq %r8, %r15
	movq %rcx, -80(%rbp)
.LB4955:
	leaq 1(%r15), %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	xorl %ecx, %ecx
	testl %r15d, %r15d
	cmovg %r15d, %ecx
	shrl $2, %ecx
	xorl %edx, %edx
.LB11883:
	testl %ecx, %ecx
	je .LB11885
.LB11884:
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
	jne .LB11884
	jmp .LB11885
.LB4953:
	incl %eax
	movq %rax, %rcx
	xorl %r15d, %r15d
.LB4959:
	movslq %ecx, %rdx
	movzwl (%rsi,%rdx,2), %edx
	testw %dx, %dx
	je .LB4961
.LB4968:
	cmpw $34, %dx
	je .LB4961
.LB4960:
	incl %r15d
	incl %ecx
	jmp .LB4959
.LB4961:
	leal 1(%rcx), %edx
	movslq %ecx, %r8
	cmpw $34, (%rsi,%r8,2)
	movl %ecx, %r13d
	cmove %edx, %r13d
	movq %rax, %r14
	movq $1, -80(%rbp)
	jmp .LB4955
.LB11885:
.LB5029:
	cmpl %r15d, %edx
	jge .LB5031
.LB5030:
	leal (%r14,%rdx), %ecx
	movslq %ecx, %rcx
	movzwl (%rsi,%rcx,2), %ecx
	movslq %edx, %r8
	movb %cl, (%rax,%r8,1)
	incl %edx
	cmpl %r15d, %edx
	jl .LB5030
.LB5031:
	movslq %r15d, %rcx
	movb $0, (%rax,%rcx,1)
	movslq %r12d, %rcx
	movq %rax, (%rbx,%rcx,8)
	incl %r12d
	movq %r13, %rax
	movq -80(%rbp), %rcx
	jmp .LB4908
.LB4910:
	cmpl $1, %edi
	jg .LB5059
.LB5060:
	callq main__0__ret_intE1
	movq %rax, %rsi
.LB5061:
	movslq %edi, %rdi
	xorl %r12d, %r12d
.LB5066:
	cmpq %rdi, %r12
	jge .LB5068
.LB5067:
	movq (%rbx,%r12,8), %rax
	movq %rax, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	incq %r12
	cmpq %rdi, %r12
	jl .LB5067
	jmp .LB5068
.LB5059:
	callq main__0__ret_intE1
	movl %eax, %esi
	jmp .LB5061
.LB5068:
	testl %esi, %esi
	jne .LB5081
.LB5083:
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
.LB5081:
	cmpl $3221225477, %esi
	jne .LB5083
.LB5087:
	movl $1179075923, -66(%rbp)
	movl $1414288705, -62(%rbp)
	movw $10, -58(%rbp)
	leaq -66(%rbp), %rdi
	movq %rdi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rdi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	jmp .LB5083
	.text
	.globl __chkstk
	.def __chkstk;
	.scl 2;
	.type 32;
	.endef
__chkstk:
.LB4771:
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
	.globl standard__random__get_rdtsc__0__ret_dataE1_ubits64
	.def standard__random__get_rdtsc__0__ret_dataE1_ubits64;
	.scl 2;
	.type 32;
	.endef
standard__random__get_rdtsc__0__ret_dataE1_ubits64:
.LB5106:
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
.LB5111:
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
.LB5127:
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
.LB5175:
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
.LB5185:
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
	.globl pass__1__byteE1_ptr1__ret_voidE1
	.def pass__1__byteE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
pass__1__byteE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB5223:
	movq %rcx, %rsi
	movl $1396789339, -24(%rbp)
	movl $2121043, -20(%rbp)
	leaq -24(%rbp), %rdi
	movq %rdi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rdi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	movw $10, -26(%rbp)
	leaq -26(%rbp), %rsi
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	movl g_pass(%rip), %eax
	incl %eax
	movl %eax, g_pass(%rip)
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
	.text
	.globl fail__1__byteE1_ptr1__ret_voidE1
	.def fail__1__byteE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
fail__1__byteE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $64, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB5242:
	movq %rcx, %rsi
	movl $1229014619, -24(%rbp)
	movl $2121036, -20(%rbp)
	leaq -24(%rbp), %rdi
	movq %rdi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rdi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	movw $10, -26(%rbp)
	leaq -26(%rbp), %rsi
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	movl g_fail(%rip), %eax
	incl %eax
	movl %eax, g_fail(%rip)
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
	.text
	.globl check__2__boolE1__byteE1_ptr1__ret_voidE1
	.def check__2__boolE1__byteE1_ptr1__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
check__2__boolE1__byteE1_ptr1__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
.LB5261:
	testb %cl, %cl
	jne .LB5265
.LB5266:
	movq %rdx, %rcx
	callq fail__1__byteE1_ptr1__ret_voidE1
	leave
	ret
.LB5265:
	movq %rdx, %rcx
	callq pass__1__byteE1_ptr1__ret_voidE1
	leave
	ret
	.text
	.globl test_edge_cases__0__ret_voidE1
	.def test_edge_cases__0__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
test_edge_cases__0__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $256, %rsp
	movq %rsi, -8(%rbp)
.LB5270:
	leaq -26(%rbp), %rsi
	movl $1696607533, -26(%rbp)
	movl $543516516, -22(%rbp)
	movl $1702060387, -18(%rbp)
	movl $757932147, -14(%rbp)
	movw $10, -10(%rbp)
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	xorl %ecx, %ecx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	leaq -50(%rbp), %rdx
	xorl %ecx, %ecx
	movl $1818324326, -50(%rbp)
	movl $677605228, -46(%rbp)
	movl $1914710320, -42(%rbp)
	movl $1920300133, -38(%rbp)
	testq %rax, %rax
	movl $1847620462, -34(%rbp)
	movl $7105653, -30(%rbp)
	sete %cl
	movzbl %cl, %ecx
	callq check__2__boolE1__byteE1_ptr1__ret_voidE1
	xorl %ecx, %ecx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	leaq -77(%rbp), %rdx
	movl $1701996134, -77(%rbp)
	movl $1970153573, -73(%rbp)
	movl $539585644, -69(%rbp)
	movl $1936027492, -65(%rbp)
	movl $1953459744, -61(%rbp)
	movl $1634886432, -57(%rbp)
	movw $26739, -53(%rbp)
	movb $0, -51(%rbp)
	movl $1, %ecx
	callq check__2__boolE1__byteE1_ptr1__ret_voidE1
	xorl %ecx, %ecx
	xorl %edx, %edx
	callq standard__memory__allocators__stdheap__frealloc__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64
	leaq -108(%rbp), %rdx
	xorl %ecx, %ecx
	movl $1634038374, -108(%rbp)
	movl $1668246636, -104(%rbp)
	movl $1819635240, -100(%rbp)
	movl $807414892, -96(%rbp)
	testq %rax, %rax
	movl $1701978153, -92(%rbp)
	movl $1852994932, -88(%rbp)
	movl $1970151539, -84(%rbp)
	sete %cl
	movw $27756, -80(%rbp)
	movb $0, -78(%rbp)
	movzbl %cl, %ecx
	callq check__2__boolE1__byteE1_ptr1__ret_voidE1
	xorl %ecx, %ecx
	movl $64, %edx
	callq standard__memory__allocators__stdheap__frealloc__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64
	leaq -143(%rbp), %rdx
	movq %rax, %rsi
	xorl %eax, %eax
	movl $1634038374, -143(%rbp)
	testq %rsi, %rsi
	movl $1668246636, -139(%rbp)
	movl $1819635240, -135(%rbp)
	movl $908078188, -131(%rbp)
	setne %al
	movl $1629497652, -127(%rbp)
	movl $544437347, -123(%rbp)
	movl $1713402721, -119(%rbp)
	movzbl %al, %ecx
	movl $1819042157, -115(%rbp)
	movw $25455, -111(%rbp)
	movb $0, -109(%rbp)
	callq check__2__boolE1__byteE1_ptr1__ret_voidE1
	movq %rsi, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movl $64, %ecx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	leaq -175(%rbp), %rdx
	movq %rax, %rsi
	xorl %eax, %eax
	movl $1970562419, -175(%rbp)
	testq %rsi, %rsi
	movl $1818304624, -171(%rbp)
	movl $543387500, -167(%rbp)
	movl $544370534, -163(%rbp)
	setne %al
	movl $1634038374, -159(%rbp)
	movl $1668246636, -155(%rbp)
	movl $1920233512, -151(%rbp)
	movzbl %al, %ecx
	movl $2699308, -147(%rbp)
	callq check__2__boolE1__byteE1_ptr1__ret_voidE1
	movq %rsi, %rcx
	xorl %edx, %edx
	callq standard__memory__allocators__stdheap__frealloc__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64
	leaq -220(%rbp), %rdx
	xorl %ecx, %ecx
	movl $1634038374, -220(%rbp)
	testq %rax, %rax
	movl $1668246636, -216(%rbp)
	movl $1920233512, -212(%rbp)
	movl $691019820, -208(%rbp)
	sete %cl
	movl $1952669984, -204(%rbp)
	movl $1935745139, -200(%rbp)
	movl $1919313440, -196(%rbp)
	movzbl %cl, %ecx
	movl $539780453, -192(%rbp)
	movl $1970562418, -188(%rbp)
	movl $544435826, -184(%rbp)
	movl $1819047278, -180(%rbp)
	movb $0, -176(%rbp)
	callq check__2__boolE1__byteE1_ptr1__ret_voidE1
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl test_all_size_classes__0__ret_voidE1
	.def test_all_size_classes__0__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
test_all_size_classes__0__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $496, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB5531:
	leaq .LZERO(%rip), %rsi
	leaq -160(%rbp), %rdi
	movl $144, %ecx
	rep movsb
	leaq .LZERO(%rip), %rsi
	leaq -304(%rbp), %rdi
	movl $144, %ecx
	rep movsb
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -368(%rbp)
	vmovdqu .LZERO+32(%rip), %ymm15
	vmovdqu %ymm15, -336(%rbp)
	vzeroupper
	leaq -392(%rbp), %rsi
	movl $1629498669, -392(%rbp)
	movl $1931504748, -388(%rbp)
	movl $543521385, -384(%rbp)
	movl $1935764579, -380(%rbp)
	movl $544433523, -376(%rbp)
	movl $666925, -372(%rbp)
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	movq $1, -160(%rbp)
	movq $16, -152(%rbp)
	movq $17, -144(%rbp)
	movq $32, -136(%rbp)
	movq $33, -128(%rbp)
	movq $64, -120(%rbp)
	movq $65, -112(%rbp)
	movq $128, -104(%rbp)
	movq $129, -96(%rbp)
	movq $256, -88(%rbp)
	movq $257, -80(%rbp)
	movq $512, -72(%rbp)
	movq $513, -64(%rbp)
	movq $1024, -56(%rbp)
	movq $1025, -48(%rbp)
	movq $2048, -40(%rbp)
	movq $2049, -32(%rbp)
	movq $4096, -24(%rbp)
	xorl %esi, %esi
.LB5598:
	cmpq $18, %rsi
	jae .LB5600
.LB5599:
	movslq %esi, %rdi
	movq -160(%rbp,%rdi,8), %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	leaq -418(%rbp), %rdx
	movq %rax, -304(%rbp,%rsi,8)
	cmpq $0, -304(%rbp,%rdi,8)
	movl $0, %eax
	movl $1702521203, -418(%rbp)
	movl $1634493216, -414(%rbp)
	movl $1629516659, -410(%rbp)
	movl $1668246636, -406(%rbp)
	movl $1852796448, -402(%rbp)
	movl $1819635245, -398(%rbp)
	movw $108, -394(%rbp)
	setne %al
	movzbl %al, %ecx
	callq check__2__boolE1__byteE1_ptr1__ret_voidE1
	leaq -451(%rbp), %rdx
	xorl %ecx, %ecx
	movslq %esi, %rax
	movq -304(%rbp,%rax,8), %rax
	movl $1702521203, -451(%rbp)
	movl $1634493216, -447(%rbp)
	movl $1629516659, -443(%rbp)
	movl $1668246636, -439(%rbp)
	movl $758526240, -435(%rbp)
	movl $1702132066, -431(%rbp)
	movl $1768710432, -427(%rbp)
	movl $1684368999, -423(%rbp)
	movb $0, -419(%rbp)
	andq $15, %rax
	sete %cl
	movzbl %cl, %ecx
	callq check__2__boolE1__byteE1_ptr1__ret_voidE1
	incq %rsi
	cmpq $18, %rsi
	jb .LB5599
.LB5600:
	xorl %esi, %esi
.LB5691:
	cmpq $18, %rsi
	jae .LB5693
.LB5692:
	movslq %esi, %rax
	movq -304(%rbp,%rax,8), %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	incq %rsi
	cmpq $18, %rsi
	jb .LB5692
.LB5693:
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
	.text
	.globl test_large_alloc__0__ret_voidE1
	.def test_large_alloc__0__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
test_large_alloc__0__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $272, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB5703:
	leaq -43(%rbp), %rsi
	movl $1814048045, -43(%rbp)
	movl $1701278305, -39(%rbp)
	movl $1819042080, -35(%rbp)
	movl $673211247, -31(%rbp)
	movl $959460414, -27(%rbp)
	movl $757082422, -23(%rbp)
	movw $2605, -19(%rbp)
	movb $0, -17(%rbp)
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	movl $4097, %ecx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	leaq -66(%rbp), %rdx
	movq %rax, %rsi
	xorl %eax, %eax
	movl $1818324326, -66(%rbp)
	testq %rsi, %rsi
	movl $677605228, -62(%rbp)
	movl $926494772, -58(%rbp)
	movl $1869488169, -54(%rbp)
	setne %al
	movl $1970154862, -50(%rbp)
	movw $27756, -46(%rbp)
	movb $0, -44(%rbp)
	movzbl %al, %ecx
	callq check__2__boolE1__byteE1_ptr1__ret_voidE1
	leaq -96(%rbp), %rdx
	movq %rsi, %rax
	andq $15, %rax
	xorl %ecx, %ecx
	movl $1818324326, -96(%rbp)
	testq %rax, %rax
	movl $677605228, -92(%rbp)
	movl $926494772, -88(%rbp)
	movl $909189161, -84(%rbp)
	sete %cl
	movl $1954112045, -80(%rbp)
	movl $1818304613, -76(%rbp)
	movl $1701734249, -72(%rbp)
	movzbl %cl, %ecx
	movw $100, -68(%rbp)
	callq check__2__boolE1__byteE1_ptr1__ret_voidE1
	movq %rsi, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movl $1048576, %ecx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	leaq -118(%rbp), %rdx
	movq %rax, %rsi
	xorl %eax, %eax
	movl $1818324326, -118(%rbp)
	testq %rsi, %rsi
	movl $677605228, -114(%rbp)
	movl $692210993, -110(%rbp)
	movl $1852796448, -106(%rbp)
	setne %al
	movl $1819635245, -102(%rbp)
	movw $108, -98(%rbp)
	movzbl %al, %ecx
	callq check__2__boolE1__byteE1_ptr1__ret_voidE1
	leaq -147(%rbp), %rdx
	movq %rsi, %rax
	andq $15, %rax
	xorl %ecx, %ecx
	movl $1818324326, -147(%rbp)
	testq %rax, %rax
	movl $677605228, -143(%rbp)
	movl $692210993, -139(%rbp)
	movl $758526240, -135(%rbp)
	sete %cl
	movl $1702132066, -131(%rbp)
	movl $1768710432, -127(%rbp)
	movl $1684368999, -123(%rbp)
	movzbl %cl, %ecx
	movb $0, -119(%rbp)
	callq check__2__boolE1__byteE1_ptr1__ret_voidE1
	movq %rsi, %rdx
	movl $1048576, %ecx
	movq %rdx, %rdi
	movl $205, %eax
	rep stosb
.LB5876:
	xorl %eax, %eax
.LB5887:
	cmpq $1048576, %rax
	jb .LB5888
.LB11886:
	movl $1, %eax
.LB5889:
	leaq -179(%rbp), %rdx
	movzbl %al, %ecx
	movl $1818324326, -179(%rbp)
	movl $677605228, -175(%rbp)
	movl $692210993, -171(%rbp)
	movl $1769109280, -167(%rbp)
	movl $1915708788, -163(%rbp)
	movl $543449445, -159(%rbp)
	movl $1920102243, -155(%rbp)
	movl $7627621, -151(%rbp)
	callq check__2__boolE1__byteE1_ptr1__ret_voidE1
	movq %rsi, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movl $8388608, %ecx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	leaq -201(%rbp), %rdx
	movq %rax, %rsi
	xorl %eax, %eax
	movl $1818324326, -201(%rbp)
	testq %rsi, %rsi
	movl $677605228, -197(%rbp)
	movl $692211000, -193(%rbp)
	movl $1852796448, -189(%rbp)
	setne %al
	movl $1819635245, -185(%rbp)
	movw $108, -181(%rbp)
	movzbl %al, %ecx
	callq check__2__boolE1__byteE1_ptr1__ret_voidE1
	movq %rsi, %rdx
	movl $8388608, %ecx
	movq %rdx, %rdi
	movl $171, %eax
	rep stosb
.LB5976:
	xorl %eax, %eax
.LB5987:
	cmpq $8388608, %rax
	jb .LB5988
.LB11887:
	movl $1, %eax
.LB5989:
	leaq -233(%rbp), %rdx
	movzbl %al, %ecx
	movl $1818324326, -233(%rbp)
	movl $677605228, -229(%rbp)
	movl $692211000, -225(%rbp)
	movl $1769109280, -221(%rbp)
	movl $1915708788, -217(%rbp)
	movl $543449445, -213(%rbp)
	movl $1920102243, -209(%rbp)
	movl $7627621, -205(%rbp)
	callq check__2__boolE1__byteE1_ptr1__ret_voidE1
	movq %rsi, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB5888:
	movslq %eax, %rcx
	cmpb $205, (%rdx,%rcx,1)
	jne .LB5900
.LB5901:
	incq %rax
	cmpq $1048576, %rax
	jb .LB5888
	jmp .LB11886
.LB5900:
	xorl %eax, %eax
	jmp .LB5889
.LB5988:
	movslq %eax, %rcx
	cmpb $171, (%rdx,%rcx,1)
	jne .LB6000
.LB6001:
	incq %rax
	cmpq $8388608, %rax
	jb .LB5988
	jmp .LB11887
.LB6000:
	xorl %eax, %eax
	jmp .LB5989
	.text
	.globl test_bin_reuse__0__ret_voidE1
	.def test_bin_reuse__0__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
test_bin_reuse__0__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $256, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
.LB6041:
	leaq -41(%rbp), %rsi
	movl $1646275885, -41(%rbp)
	movl $1914728041, -37(%rbp)
	movl $1702065509, -33(%rbp)
	movl $170732832, -29(%rbp)
	movb $0, -25(%rbp)
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	movl $64, %ecx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, %rsi
	movl $64, %ecx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	leaq -67(%rbp), %rdx
	movq %rax, %rdi
	xorl %eax, %eax
	testq %rsi, %rsi
	setne %al
	movl $1936877926, -67(%rbp)
	movl $1629495412, -63(%rbp)
	movl $1668246636, -59(%rbp)
	movzbl %al, %ecx
	movl $691287592, -55(%rbp)
	movl $1852796448, -51(%rbp)
	movl $1819635245, -47(%rbp)
	movw $108, -43(%rbp)
	callq check__2__boolE1__byteE1_ptr1__ret_voidE1
	leaq -93(%rbp), %rdx
	xorl %eax, %eax
	testq %rdi, %rdi
	movl $1868785011, -93(%rbp)
	setne %al
	movl $1629512814, -89(%rbp)
	movl $1668246636, -85(%rbp)
	movl $691287592, -81(%rbp)
	movzbl %al, %ecx
	movl $1852796448, -77(%rbp)
	movl $1819635245, -73(%rbp)
	movw $108, -69(%rbp)
	callq check__2__boolE1__byteE1_ptr1__ret_voidE1
	leaq -111(%rbp), %rdx
	xorl %eax, %eax
	cmpq %rdi, %rsi
	movl $544175988, -111(%rbp)
	setne %al
	movl $1869376609, -107(%rbp)
	movl $1679848291, -103(%rbp)
	movl $1701209705, -99(%rbp)
	movzbl %al, %ecx
	movw $114, -95(%rbp)
	callq check__2__boolE1__byteE1_ptr1__ret_voidE1
	movq %rsi, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movl $64, %ecx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	leaq -152(%rbp), %rdx
	movq %rax, %rbx
	xorl %eax, %eax
	movl $544106850, -152(%rbp)
	cmpq %rsi, %rbx
	movl $1937073522, -148(%rbp)
	movl $1701978213, -144(%rbp)
	movl $1852994932, -140(%rbp)
	sete %al
	movl $1919950963, -136(%rbp)
	movl $1869182565, -132(%rbp)
	movl $2037150581, -128(%rbp)
	movzbl %al, %ecx
	movl $1701996064, -124(%rbp)
	movl $1646290021, -120(%rbp)
	movl $1801678700, -116(%rbp)
	movb $0, -112(%rbp)
	callq check__2__boolE1__byteE1_ptr1__ret_voidE1
	movq %rdi, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movq %rbx, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movl $128, %ecx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, %rsi
	movq %rsi, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movl $128, %ecx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	leaq -182(%rbp), %rdx
	movq %rax, %rdi
	xorl %eax, %eax
	movl $544106850, -182(%rbp)
	cmpq %rsi, %rdi
	movl $1937073522, -178(%rbp)
	movl $1818435685, -174(%rbp)
	movl $762540897, -170(%rbp)
	sete %al
	movl $824713267, -166(%rbp)
	movl $1646278706, -162(%rbp)
	movl $1936028793, -158(%rbp)
	movzbl %al, %ecx
	movw $41, -154(%rbp)
	callq check__2__boolE1__byteE1_ptr1__ret_voidE1
	movq %rdi, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movl $16, %ecx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, %rsi
	movq %rsi, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movl $16, %ecx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	leaq -211(%rbp), %rdx
	movq %rax, %rdi
	xorl %eax, %eax
	movl $544106850, -211(%rbp)
	cmpq %rsi, %rdi
	movl $1937073522, -207(%rbp)
	movl $1818435685, -203(%rbp)
	movl $762540897, -199(%rbp)
	sete %al
	movl $824713264, -195(%rbp)
	movl $2036473910, -191(%rbp)
	movl $695428468, -187(%rbp)
	movzbl %al, %ecx
	movb $0, -183(%rbp)
	callq check__2__boolE1__byteE1_ptr1__ret_voidE1
	movq %rdi, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
	.text
	.globl test_write_read__0__ret_voidE1
	.def test_write_read__0__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
test_write_read__0__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $208, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
.LB6285:
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -56(%rbp)
	leaq -107(%rbp), %rsi
	movl $1998597421, -107(%rbp)
	movl $1702127986, -103(%rbp)
	movl $1634038319, -99(%rbp)
	movl $1868767332, -95(%rbp)
	movl $1667592818, -91(%rbp)
	movl $1936027252, -87(%rbp)
	movl $824713331, -83(%rbp)
	movl $808464432, -79(%rbp)
	movl $1819042080, -75(%rbp)
	movl $796091247, -71(%rbp)
	movl $1701147238, -67(%rbp)
	movl $757082483, -63(%rbp)
	movw $2605, -59(%rbp)
	movb $0, -57(%rbp)
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	callq standard__random__get_entropy__0__ret_dataE1_ubits64
	movq %rax, %rsi
	callq standard__random__get_entropy__0__ret_dataE1_ubits64
	movq %rax, %r8
	leaq -56(%rbp), %rcx
	movq %rsi, %rdx
	callq standard__random__pcg32_seed__3__PCG32E1_ptr1__dataE1_ubits64__dataE1_ubits64__ret_voidE1
	xorl %esi, %esi
	movl $1, %ebx
.LB6351:
	cmpq $10000, %rsi
	jb .LB6352
.LB11893:
.LB6353:
	leaq -170(%rbp), %rdx
	movzbl %bl, %ecx
	movl $1953067639, -170(%rbp)
	movl $1701982053, -166(%rbp)
	movl $1663067233, -162(%rbp)
	movl $1701999215, -158(%rbp)
	movl $1629516899, -154(%rbp)
	movl $1936683619, -150(%rbp)
	movl $808525939, -146(%rbp)
	movl $540028976, -142(%rbp)
	movl $1684955506, -138(%rbp)
	movl $1932356975, -134(%rbp)
	movl $1684372073, -130(%rbp)
	movl $1819042080, -126(%rbp)
	movl $1714381679, -122(%rbp)
	movl $543516018, -118(%rbp)
	movl $1818458467, -114(%rbp)
	movw $29541, -110(%rbp)
	movb $0, -108(%rbp)
	callq check__2__boolE1__byteE1_ptr1__ret_voidE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB6352:
	leaq -56(%rbp), %rcx
	callq standard__random__pcg32_next__1__PCG32E1_ptr1__ret_dataE1_ubits32
	andq $4095, %rax
	leaq 1(%rax), %r12
	movq %rsi, %rax
	andq $255, %rax
	movl %eax, %r13d
	movq %r12, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, %rdx
	testq %rdx, %rdx
	je .LB6374
.LB6375:
	cmpq $32, %r12
	jge .LB11888
.LB11889:
	xorl %eax, %eax
	testq %r12, %r12
	cmova %r12, %rax
	shrq $2, %rax
	xorl %ecx, %ecx
.LB11890:
	testq %rax, %rax
	je .LB11892
.LB11891:
	movb %r13b, (%rdx,%rcx,1)
	movb %r13b, 1(%rdx,%rcx,1)
	movb %r13b, 2(%rdx,%rcx,1)
	movb %r13b, 3(%rdx,%rcx,1)
	addq $4, %rcx
	decq %rax
	jne .LB11891
.LB11892:
.LB6380:
	cmpq %r12, %rcx
	jae .LB6382
.LB6381:
	movb %r13b, (%rdx,%rcx,1)
	incq %rcx
	cmpq %r12, %rcx
	jb .LB6381
	jmp .LB6382
.LB11888:
	movq %rdx, %rdi
	movq %r12, %rcx
	movl %r13d, %eax
	rep stosb
.LB6382:
	xorl %eax, %eax
.LB6393:
	cmpq %r12, %rax
	jb .LB6394
.LB11894:
.LB6395:
	testb %bl, %bl
	je .LB6413
.LB6414:
	movq %rdx, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	incq %rsi
	cmpq $10000, %rsi
	jb .LB6352
	jmp .LB11893
.LB6394:
	movslq %eax, %rcx
	movzbl (%rdx,%rcx,1), %ecx
	cmpb %r13b, %cl
	jne .LB6406
.LB6407:
	incq %rax
	cmpq %r12, %rax
	jb .LB6394
	jmp .LB11894
.LB6406:
	xorl %ebx, %ebx
	testb %bl, %bl
	jne .LB6414
.LB6413:
	jmp .LB6353
.LB6374:
	xorl %ebx, %ebx
	jmp .LB6353
	.text
	.globl test_no_overlap__0__ret_voidE1
	.def test_no_overlap__0__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
test_no_overlap__0__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	movl $4800, %eax
	callq __chkstk
	subq %rax, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB6485:
	leaq -4112(%rbp), %rax
	movq %rax, %rdi
	xorl %eax, %eax
	movl $4096, %ecx
	rep stosb
	leaq -4624(%rbp), %rax
	movq %rax, %rdi
	xorl %eax, %eax
	movl $512, %ecx
	rep stosb
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -4640(%rbp)
	leaq -4680(%rbp), %rsi
	movl $1847602477, -4680(%rbp)
	movl $1986997615, -4676(%rbp)
	movl $1634497125, -4672(%rbp)
	movl $1853169776, -4668(%rbp)
	movl $544367972, -4664(%rbp)
	movl $540160309, -4660(%rbp)
	movl $1702259052, -4656(%rbp)
	movl $1869373984, -4652(%rbp)
	movl $544435043, -4648(%rbp)
	movl $666925, -4644(%rbp)
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	callq standard__random__get_entropy__0__ret_dataE1_ubits64
	movq %rax, %rsi
	callq standard__random__get_entropy__0__ret_dataE1_ubits64
	movq %rax, %r8
	leaq -4640(%rbp), %rcx
	movq %rsi, %rdx
	callq standard__random__pcg32_seed__3__PCG32E1_ptr1__dataE1_ubits64__dataE1_ubits64__ret_voidE1
	xorl %esi, %esi
.LB6542:
	cmpq $512, %rsi
	jb .LB6543
.LB11895:
	movl $1, %eax
.LB6544:
	leaq -4714(%rbp), %rdx
	movzbl %al, %ecx
	movl $543976545, -4714(%rbp)
	movl $540160309, -4710(%rbp)
	movl $1668246626, -4706(%rbp)
	movl $1629516651, -4702(%rbp)
	movl $1668246636, -4698(%rbp)
	movl $1684370529, -4694(%rbp)
	movl $1852796448, -4690(%rbp)
	movl $1819635245, -4686(%rbp)
	movw $108, -4682(%rbp)
	callq check__2__boolE1__byteE1_ptr1__ret_voidE1
	xorl %eax, %eax
.LB6642:
	cmpq $512, %rax
	jb .LB6643
.LB11896:
	movl $1, %eax
.LB6644:
	leaq -4753(%rbp), %rdx
	movzbl %al, %ecx
	movl $1646292846, -4753(%rbp)
	movl $1801678700, -4749(%rbp)
	movl $1768710432, -4745(%rbp)
	movl $1852404577, -4741(%rbp)
	movl $1629502055, -4737(%rbp)
	movl $1948281964, -4733(%rbp)
	movl $1663068001, -4729(%rbp)
	movl $1801676136, -4725(%rbp)
	movl $1634738291, -4721(%rbp)
	movw $29555, -4717(%rbp)
	movb $0, -4715(%rbp)
	callq check__2__boolE1__byteE1_ptr1__ret_voidE1
	xorl %esi, %esi
.LB6709:
	cmpq $512, %rsi
	jae .LB6711
.LB6710:
	movslq %esi, %rax
	movq -4112(%rbp,%rax,8), %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	incq %rsi
	cmpq $512, %rsi
	jb .LB6710
	jmp .LB6711
.LB6543:
	leaq -4640(%rbp), %rcx
	callq standard__random__pcg32_next__1__PCG32E1_ptr1__ret_dataE1_ubits32
	andq $255, %rax
	leaq 1(%rax), %rdi
	movq %rdi, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -4112(%rbp,%rsi,8)
	movq %rsi, %rax
	andq $255, %rax
	movb %al, -4624(%rbp,%rsi,1)
	movslq %esi, %rax
	cmpq $0, -4112(%rbp,%rax,8)
	je .LB6572
.LB6573:
	movq -4112(%rbp,%rax,8), %rax
	xorl %ecx, %ecx
.LB6581:
	cmpq $16, %rcx
	jae .LB6583
.LB6587:
	cmpq %rdi, %rcx
	jae .LB6583
.LB6582:
	movslq %esi, %rdx
	movzbl -4624(%rbp,%rdx,1), %edx
	movb %dl, (%rax,%rcx,1)
	incq %rcx
	cmpq $16, %rcx
	jb .LB6587
.LB6583:
	incq %rsi
	cmpq $512, %rsi
	jb .LB6543
	jmp .LB11895
.LB6572:
	xorl %eax, %eax
	jmp .LB6544
.LB6643:
	movslq %eax, %rcx
	movq -4112(%rbp,%rcx,8), %rdx
	movzbl (%rdx), %edx
	movzbl -4624(%rbp,%rcx,1), %ecx
	cmpb %cl, %dl
	jne .LB6661
.LB6662:
	incq %rax
	cmpq $512, %rax
	jb .LB6643
	jmp .LB11896
.LB6661:
	xorl %eax, %eax
	jmp .LB6644
.LB6711:
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
	.text
	.globl test_frealloc_same_class__0__ret_voidE1
	.def test_frealloc_same_class__0__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
test_frealloc_same_class__0__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $320, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB6721:
	leaq -52(%rbp), %rsi
	movl $1713384749, -52(%rbp)
	movl $1818322290, -48(%rbp)
	movl $543387500, -44(%rbp)
	movl $1701667187, -40(%rbp)
	movl $1634493229, -36(%rbp)
	movl $1763734387, -32(%rbp)
	movl $1819290990, -28(%rbp)
	movl $543515489, -24(%rbp)
	movl $666925, -20(%rbp)
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	movl $33, %ecx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	leaq -73(%rbp), %rdx
	movq %rax, %rsi
	xorl %eax, %eax
	movl $1818324326, -73(%rbp)
	testq %rsi, %rsi
	movl $677605228, -69(%rbp)
	movl $539570995, -65(%rbp)
	movl $762212206, -61(%rbp)
	setne %al
	movl $1819047278, -57(%rbp)
	movb $0, -53(%rbp)
	movzbl %al, %ecx
	callq check__2__boolE1__byteE1_ptr1__ret_voidE1
	movq %rsi, %rdi
	movl $33, %ecx
	movl $170, %eax
	rep stosb
.LB6798:
	movq %rsi, %rcx
	movl $64, %edx
	callq standard__memory__allocators__stdheap__frealloc__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64
	leaq -118(%rbp), %rdx
	movq %rax, %rdi
	xorl %eax, %eax
	movl $1634038374, -118(%rbp)
	cmpq %rsi, %rdi
	movl $1668246636, -114(%rbp)
	movl $1953068832, -110(%rbp)
	movl $544106856, -106(%rbp)
	sete %al
	movl $1935764579, -102(%rbp)
	movl $1931491955, -98(%rbp)
	movl $543518049, -94(%rbp)
	movzbl %al, %ecx
	movl $1852403568, -90(%rbp)
	movl $544367988, -86(%rbp)
	movl $1970562418, -82(%rbp)
	movl $1684369010, -78(%rbp)
	movb $0, -74(%rbp)
	callq check__2__boolE1__byteE1_ptr1__ret_voidE1
	xorl %eax, %eax
.LB6862:
	cmpq $33, %rax
	jb .LB6863
.LB11897:
	movl $1, %eax
.LB6864:
	leaq -156(%rbp), %rdx
	movzbl %al, %ecx
	movl $1634038374, -156(%rbp)
	movl $1668246636, -152(%rbp)
	movl $1953068832, -148(%rbp)
	movl $544106856, -144(%rbp)
	movl $1935764579, -140(%rbp)
	movl $1679833715, -136(%rbp)
	movl $543257697, -132(%rbp)
	movl $1936028272, -128(%rbp)
	movl $1702261349, -124(%rbp)
	movw $100, -120(%rbp)
	callq check__2__boolE1__byteE1_ptr1__ret_voidE1
	movq %rdi, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movl $128, %ecx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	leaq -194(%rbp), %rdx
	movq %rax, %rsi
	xorl %eax, %eax
	movl $1818324326, -194(%rbp)
	testq %rsi, %rsi
	movl $677605228, -190(%rbp)
	movl $691548721, -186(%rbp)
	movl $1852796448, -182(%rbp)
	setne %al
	movl $1819635245, -178(%rbp)
	movl $1868963948, -174(%rbp)
	movl $1752375410, -170(%rbp)
	movzbl %al, %ecx
	movl $1802398066, -166(%rbp)
	movl $1936028704, -162(%rbp)
	movw $116, -158(%rbp)
	callq check__2__boolE1__byteE1_ptr1__ret_voidE1
	movq %rsi, %rdi
	movl $64, %ecx
	movl $187, %eax
	rep stosb
.LB6973:
	movq %rsi, %rcx
	movl $60, %edx
	callq standard__memory__allocators__stdheap__frealloc__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64
	leaq -241(%rbp), %rdx
	movq %rax, %rdi
	xorl %eax, %eax
	movl $1634038374, -241(%rbp)
	cmpq %rsi, %rdi
	movl $1668246636, -237(%rbp)
	movl $1919447840, -233(%rbp)
	movl $543911529, -229(%rbp)
	sete %al
	movl $1931505524, -225(%rbp)
	movl $1819042157, -221(%rbp)
	movl $1663070821, -217(%rbp)
	movzbl %al, %ecx
	movl $1936941420, -213(%rbp)
	movl $1634934842, -209(%rbp)
	movl $1881171309, -205(%rbp)
	movl $1953393007, -201(%rbp)
	movw $29285, -197(%rbp)
	movb $0, -195(%rbp)
	callq check__2__boolE1__byteE1_ptr1__ret_voidE1
	xorl %eax, %eax
.LB7039:
	cmpq $60, %rax
	jb .LB7040
.LB11898:
	movl $1, %eax
.LB7041:
	leaq -273(%rbp), %rdx
	movzbl %al, %ecx
	movl $1634038374, -273(%rbp)
	movl $1668246636, -269(%rbp)
	movl $1919447840, -265(%rbp)
	movl $980119145, -261(%rbp)
	movl $1952539680, -257(%rbp)
	movl $1919950945, -253(%rbp)
	movl $1919251301, -249(%rbp)
	movl $6579574, -245(%rbp)
	callq check__2__boolE1__byteE1_ptr1__ret_voidE1
	movq %rdi, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB6863:
	movslq %eax, %rcx
	cmpb $170, (%rdi,%rcx,1)
	jne .LB6876
.LB6877:
	incq %rax
	cmpq $33, %rax
	jb .LB6863
	jmp .LB11897
.LB6876:
	xorl %eax, %eax
	jmp .LB6864
.LB7040:
	movslq %eax, %rcx
	cmpb $187, (%rdi,%rcx,1)
	jne .LB7053
.LB7054:
	incq %rax
	cmpq $60, %rax
	jb .LB7040
	jmp .LB11898
.LB7053:
	xorl %eax, %eax
	jmp .LB7041
	.text
	.globl test_frealloc_grow__0__ret_voidE1
	.def test_frealloc_grow__0__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
test_frealloc_grow__0__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $432, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB7094:
	leaq -37(%rbp), %rsi
	movl $1713384749, -37(%rbp)
	movl $1818322290, -33(%rbp)
	movl $543387500, -29(%rbp)
	movl $2003792487, -25(%rbp)
	movl $170732832, -21(%rbp)
	movb $0, -17(%rbp)
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	movl $32, %ecx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	leaq -58(%rbp), %rdx
	movq %rax, %rsi
	xorl %eax, %eax
	movl $1818324326, -58(%rbp)
	testq %rsi, %rsi
	movl $677605228, -54(%rbp)
	movl $539570739, -50(%rbp)
	movl $762212206, -46(%rbp)
	setne %al
	movl $1819047278, -42(%rbp)
	movb $0, -38(%rbp)
	movzbl %al, %ecx
	callq check__2__boolE1__byteE1_ptr1__ret_voidE1
	movl $8, %eax
	xorl %ecx, %ecx
.LB11899:
	testq %rax, %rax
	je .LB11901
.LB11900:
	movq %rcx, %rdx
	andq $255, %rdx
	movb %dl, (%rsi,%rcx,1)
	leaq 1(%rcx), %rdx
	andq $255, %rdx
	movb %dl, 1(%rsi,%rcx,1)
	leaq 2(%rcx), %rdx
	andq $255, %rdx
	movb %dl, 2(%rsi,%rcx,1)
	leaq 3(%rcx), %rdx
	andq $255, %rdx
	movb %dl, 3(%rsi,%rcx,1)
	addq $4, %rcx
	decq %rax
	jne .LB11900
.LB11901:
.LB7154:
	cmpq $32, %rcx
	jae .LB7156
.LB7155:
	movq %rcx, %rax
	andq $255, %rax
	movb %al, (%rsi,%rcx,1)
	incq %rcx
	cmpq $32, %rcx
	jb .LB7155
.LB7156:
	movq %rsi, %rcx
	movl $128, %edx
	callq standard__memory__allocators__stdheap__frealloc__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64
	leaq -81(%rbp), %rdx
	movq %rax, %rsi
	xorl %eax, %eax
	movl $1634038374, -81(%rbp)
	testq %rsi, %rsi
	movl $1668246636, -77(%rbp)
	movl $1869768480, -73(%rbp)
	movl $1869488247, -69(%rbp)
	setne %al
	movl $1970154862, -65(%rbp)
	movw $27756, -61(%rbp)
	movb $0, -59(%rbp)
	movzbl %al, %ecx
	callq check__2__boolE1__byteE1_ptr1__ret_voidE1
	xorl %eax, %eax
.LB7201:
	cmpq $32, %rax
	jb .LB7202
.LB11908:
	movl $1, %eax
.LB7203:
	leaq -121(%rbp), %rdx
	movzbl %al, %ecx
	movl $1634038374, -121(%rbp)
	movl $1668246636, -117(%rbp)
	movl $1869768480, -113(%rbp)
	movl $1864383095, -109(%rbp)
	movl $1768384882, -105(%rbp)
	movl $543973742, -101(%rbp)
	movl $1702132066, -97(%rbp)
	movl $1919950963, -93(%rbp)
	movl $1919251301, -89(%rbp)
	movl $6579574, -85(%rbp)
	callq check__2__boolE1__byteE1_ptr1__ret_voidE1
	movq %rsi, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movl $64, %ecx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	leaq -166(%rbp), %rdx
	movq %rax, %rsi
	xorl %eax, %eax
	movl $1818324326, -166(%rbp)
	testq %rsi, %rsi
	movl $677605228, -162(%rbp)
	movl $539571254, -158(%rbp)
	movl $762212206, -154(%rbp)
	setne %al
	movl $1819047278, -150(%rbp)
	movl $1919903264, -146(%rbp)
	movl $1869767456, -142(%rbp)
	movzbl %al, %ecx
	movl $1647145843, -138(%rbp)
	movl $1684960623, -134(%rbp)
	movl $544830049, -130(%rbp)
	movl $2003792487, -126(%rbp)
	movb $0, -122(%rbp)
	callq check__2__boolE1__byteE1_ptr1__ret_voidE1
	movl $16, %eax
	xorl %ecx, %ecx
.LB11902:
	testq %rax, %rax
	je .LB11904
.LB11903:
	movl $255, %edx
	subq %rcx, %rdx
	movb %dl, (%rsi,%rcx,1)
	leaq 1(%rcx), %rdx
	movl $255, %edi
	negq %rdx
	addq %rdi, %rdx
	movb %dl, 1(%rsi,%rcx,1)
	leaq 2(%rcx), %rdx
	movl $255, %edi
	negq %rdx
	addq %rdi, %rdx
	movb %dl, 2(%rsi,%rcx,1)
	leaq 3(%rcx), %rdx
	movl $255, %edi
	negq %rdx
	addq %rdi, %rdx
	movb %dl, 3(%rsi,%rcx,1)
	addq $4, %rcx
	decq %rax
	jne .LB11903
	jmp .LB11904
.LB7202:
	movslq %eax, %rcx
	movzbl (%rsi,%rcx,1), %ecx
	movq %rax, %rdx
	andq $255, %rdx
	cmpb %dl, %cl
	jne .LB7218
.LB7219:
	incq %rax
	cmpq $32, %rax
	jb .LB7202
	jmp .LB11908
.LB7218:
	xorl %eax, %eax
	jmp .LB7203
.LB11904:
.LB7322:
	cmpq $64, %rcx
	jae .LB7324
.LB7323:
	movl $255, %eax
	subq %rcx, %rax
	movb %al, (%rsi,%rcx,1)
	incq %rcx
	cmpq $64, %rcx
	jb .LB7323
.LB7324:
	movq %rsi, %rcx
	movl $8192, %edx
	callq standard__memory__allocators__stdheap__frealloc__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64
	leaq -197(%rbp), %rdx
	movq %rax, %rdi
	xorl %eax, %eax
	movl $1634038374, -197(%rbp)
	testq %rdi, %rdi
	movl $1668246636, -193(%rbp)
	movl $1634562848, -189(%rbp)
	movl $1043164268, -185(%rbp)
	setne %al
	movl $1735549292, -181(%rbp)
	movl $1869488229, -177(%rbp)
	movl $1970154862, -173(%rbp)
	movzbl %al, %ecx
	movw $27756, -169(%rbp)
	movb $0, -167(%rbp)
	callq check__2__boolE1__byteE1_ptr1__ret_voidE1
	leaq -233(%rbp), %rdx
	xorl %eax, %eax
	cmpq %rsi, %rdi
	movl $1634038374, -233(%rbp)
	setne %al
	movl $1668246636, -229(%rbp)
	movl $1634562848, -225(%rbp)
	movl $1043164268, -221(%rbp)
	movzbl %al, %ecx
	movl $1735549292, -217(%rbp)
	movl $1869422693, -213(%rbp)
	movl $543450486, -209(%rbp)
	movl $1852403568, -205(%rbp)
	movl $7497076, -201(%rbp)
	callq check__2__boolE1__byteE1_ptr1__ret_voidE1
	xorl %eax, %eax
.LB7418:
	cmpq $64, %rax
	jb .LB7419
.LB11909:
	movl $1, %eax
.LB7420:
	leaq -281(%rbp), %rdx
	movzbl %al, %ecx
	movl $1634038374, -281(%rbp)
	movl $1668246636, -277(%rbp)
	movl $1634562848, -273(%rbp)
	movl $1043164268, -269(%rbp)
	movl $1735549292, -265(%rbp)
	movl $1864383077, -261(%rbp)
	movl $1768384882, -257(%rbp)
	movl $543973742, -253(%rbp)
	movl $1702132066, -249(%rbp)
	movl $1919950963, -245(%rbp)
	movl $1919251301, -241(%rbp)
	movl $6579574, -237(%rbp)
	callq check__2__boolE1__byteE1_ptr1__ret_voidE1
	movq %rdi, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movl $8192, %ecx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	leaq -328(%rbp), %rdx
	movq %rax, %rsi
	xorl %eax, %eax
	movl $1818324326, -328(%rbp)
	testq %rsi, %rsi
	movl $677605228, -324(%rbp)
	movl $842608952, -320(%rbp)
	movl $1869488169, -316(%rbp)
	setne %al
	movl $1970154862, -312(%rbp)
	movl $1713400940, -308(%rbp)
	movl $1814065775, -304(%rbp)
	movzbl %al, %ecx
	movl $1701278305, -300(%rbp)
	movl $1836269101, -296(%rbp)
	movl $543976545, -292(%rbp)
	movl $1769105523, -288(%rbp)
	movw $27502, -284(%rbp)
	movb $0, -282(%rbp)
	callq check__2__boolE1__byteE1_ptr1__ret_voidE1
	movl $16, %eax
	xorl %ecx, %ecx
.LB11905:
	testq %rax, %rax
	je .LB11907
.LB11906:
	leaq (%rcx,%rcx,2), %rdx
	movb %dl, (%rsi,%rcx,1)
	leaq 1(%rcx), %rdx
	leaq (%rdx,%rdx,2), %rdx
	movb %dl, 1(%rsi,%rcx,1)
	leaq 2(%rcx), %rdx
	leaq (%rdx,%rdx,2), %rdx
	movb %dl, 2(%rsi,%rcx,1)
	leaq 3(%rcx), %rdx
	leaq (%rdx,%rdx,2), %rdx
	movb %dl, 3(%rsi,%rcx,1)
	addq $4, %rcx
	decq %rax
	jne .LB11906
	jmp .LB11907
.LB7419:
	movslq %eax, %rcx
	movzbl (%rdi,%rcx,1), %ecx
	movl $255, %edx
	subq %rax, %rdx
	cmpb %dl, %cl
	jne .LB7435
.LB7436:
	incq %rax
	cmpq $64, %rax
	jb .LB7419
	jmp .LB11909
.LB7435:
	xorl %eax, %eax
	jmp .LB7420
.LB11907:
.LB7549:
	cmpq $64, %rcx
	jae .LB7551
.LB7550:
	leaq (%rcx,%rcx,2), %rax
	movb %al, (%rsi,%rcx,1)
	incq %rcx
	cmpq $64, %rcx
	jb .LB7550
.LB7551:
	movq %rsi, %rcx
	movl $64, %edx
	callq standard__memory__allocators__stdheap__frealloc__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64
	leaq -359(%rbp), %rdx
	movq %rax, %rsi
	xorl %eax, %eax
	movl $1634038374, -359(%rbp)
	testq %rsi, %rsi
	movl $1668246636, -355(%rbp)
	movl $1918987296, -351(%rbp)
	movl $1043162471, -347(%rbp)
	setne %al
	movl $1818324339, -343(%rbp)
	movl $1869488236, -339(%rbp)
	movl $1970154862, -335(%rbp)
	movzbl %al, %ecx
	movw $27756, -331(%rbp)
	movb $0, -329(%rbp)
	callq check__2__boolE1__byteE1_ptr1__ret_voidE1
	xorl %eax, %eax
.LB7604:
	cmpq $64, %rax
	jb .LB7605
.LB11910:
	movl $1, %eax
.LB7606:
	leaq -398(%rbp), %rdx
	movzbl %al, %ecx
	movl $1634038374, -398(%rbp)
	movl $1668246636, -394(%rbp)
	movl $1918987296, -390(%rbp)
	movl $1043162471, -386(%rbp)
	movl $1818324339, -382(%rbp)
	movl $1646279276, -378(%rbp)
	movl $1936028793, -374(%rbp)
	movl $1701998624, -370(%rbp)
	movl $1987208563, -366(%rbp)
	movw $25701, -362(%rbp)
	movb $0, -360(%rbp)
	callq check__2__boolE1__byteE1_ptr1__ret_voidE1
	movq %rsi, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
.LB7605:
	movslq %eax, %rcx
	leaq (%rax,%rax,2), %rdx
	movzbl (%rsi,%rcx,1), %ecx
	cmpb %dl, %cl
	jne .LB7621
.LB7622:
	incq %rax
	cmpq $64, %rax
	jb .LB7605
	jmp .LB11910
.LB7621:
	xorl %eax, %eax
	jmp .LB7606
	.text
	.globl test_frealloc_large_identity__0__ret_voidE1
	.def test_frealloc_large_identity__0__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
test_frealloc_large_identity__0__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $160, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB7669:
	leaq -53(%rbp), %rsi
	movl $1713384749, -53(%rbp)
	movl $1818322290, -49(%rbp)
	movl $543387500, -45(%rbp)
	movl $1735549292, -41(%rbp)
	movl $1818373477, -37(%rbp)
	movl $543908719, -33(%rbp)
	movl $1852138601, -29(%rbp)
	movl $2037672308, -25(%rbp)
	movl $170732832, -21(%rbp)
	movb $0, -17(%rbp)
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	movl $65536, %ecx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	leaq -75(%rbp), %rdx
	movq %rax, %rsi
	xorl %eax, %eax
	movl $1818324326, -75(%rbp)
	testq %rsi, %rsi
	movl $677605228, -71(%rbp)
	movl $692794422, -67(%rbp)
	movl $1852796448, -63(%rbp)
	setne %al
	movl $1819635245, -59(%rbp)
	movw $108, -55(%rbp)
	movzbl %al, %ecx
	callq check__2__boolE1__byteE1_ptr1__ret_voidE1
	movq %rsi, %rcx
	movl $65536, %edx
	callq standard__memory__allocators__stdheap__frealloc__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64
	leaq -121(%rbp), %rdx
	movq %rax, %rdi
	xorl %eax, %eax
	movl $1634038374, -121(%rbp)
	cmpq %rsi, %rdi
	movl $1668246636, -117(%rbp)
	movl $1918987296, -113(%rbp)
	movl $1931502951, -109(%rbp)
	sete %al
	movl $761621857, -105(%rbp)
	movl $1702521203, -101(%rbp)
	movl $1952805408, -97(%rbp)
	movzbl %al, %ecx
	movl $1936618101, -93(%rbp)
	movl $1835103008, -89(%rbp)
	movl $1869619301, -85(%rbp)
	movl $1702129257, -81(%rbp)
	movw $114, -77(%rbp)
	callq check__2__boolE1__byteE1_ptr1__ret_voidE1
	movq %rdi, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
	.text
	.globl test_frealloc_chain__0__ret_voidE1
	.def test_frealloc_chain__0__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
test_frealloc_chain__0__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $288, %rsp
	movq %rsi, -8(%rbp)
.LB7795:
	leaq -39(%rbp), %rsi
	movl $1713384749, -39(%rbp)
	movl $1818322290, -35(%rbp)
	movl $543387500, -31(%rbp)
	movl $1767991395, -27(%rbp)
	movl $543450478, -23(%rbp)
	movl $2003792487, -19(%rbp)
	movl $757098612, -15(%rbp)
	movw $2605, -11(%rbp)
	movb $0, -9(%rbp)
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	movl $8, %ecx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	leaq -67(%rbp), %rdx
	movq %rax, %rsi
	xorl %eax, %eax
	movl $1953066601, -67(%rbp)
	testq %rsi, %rsi
	movl $543973737, -63(%rbp)
	movl $1818324326, -59(%rbp)
	movl $677605228, -55(%rbp)
	setne %al
	movl $1847601464, -51(%rbp)
	movl $1848471151, -47(%rbp)
	movl $7105653, -43(%rbp)
	movzbl %al, %ecx
	callq check__2__boolE1__byteE1_ptr1__ret_voidE1
	movb $66, (%rsi)
	movq %rsi, %rcx
	movl $32, %edx
	callq standard__memory__allocators__stdheap__frealloc__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64
	leaq -91(%rbp), %rdx
	movq %rax, %rsi
	xorl %eax, %eax
	movl $1634038374, -91(%rbp)
	testq %rsi, %rsi
	movl $1668246636, -87(%rbp)
	movl $540945696, -83(%rbp)
	movl $1847603763, -79(%rbp)
	setne %al
	movl $1848471151, -75(%rbp)
	movl $7105653, -71(%rbp)
	movzbl %al, %ecx
	callq check__2__boolE1__byteE1_ptr1__ret_voidE1
	movq %rsi, %rcx
	movl $128, %edx
	callq standard__memory__allocators__stdheap__frealloc__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64
	leaq -116(%rbp), %rdx
	movq %rax, %rsi
	xorl %eax, %eax
	movl $1634038374, -116(%rbp)
	testq %rsi, %rsi
	movl $1668246636, -112(%rbp)
	movl $540945696, -108(%rbp)
	movl $540553777, -104(%rbp)
	setne %al
	movl $762212206, -100(%rbp)
	movl $1819047278, -96(%rbp)
	movb $0, -92(%rbp)
	movzbl %al, %ecx
	callq check__2__boolE1__byteE1_ptr1__ret_voidE1
	movq %rsi, %rcx
	movl $512, %edx
	callq standard__memory__allocators__stdheap__frealloc__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64
	leaq -141(%rbp), %rdx
	movq %rax, %rsi
	xorl %eax, %eax
	movl $1634038374, -141(%rbp)
	testq %rsi, %rsi
	movl $1668246636, -137(%rbp)
	movl $540945696, -133(%rbp)
	movl $540160309, -129(%rbp)
	setne %al
	movl $762212206, -125(%rbp)
	movl $1819047278, -121(%rbp)
	movb $0, -117(%rbp)
	movzbl %al, %ecx
	callq check__2__boolE1__byteE1_ptr1__ret_voidE1
	movq %rsi, %rcx
	movl $4096, %edx
	callq standard__memory__allocators__stdheap__frealloc__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64
	leaq -167(%rbp), %rdx
	movq %rax, %rsi
	xorl %eax, %eax
	movl $1634038374, -167(%rbp)
	testq %rsi, %rsi
	movl $1668246636, -163(%rbp)
	movl $540945696, -159(%rbp)
	movl $909717556, -155(%rbp)
	setne %al
	movl $1852796448, -151(%rbp)
	movl $1819635245, -147(%rbp)
	movw $108, -143(%rbp)
	movzbl %al, %ecx
	callq check__2__boolE1__byteE1_ptr1__ret_voidE1
	movq %rsi, %rcx
	movl $65536, %edx
	callq standard__memory__allocators__stdheap__frealloc__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64
	leaq -202(%rbp), %rdx
	movq %rax, %rsi
	xorl %eax, %eax
	movl $1634038374, -202(%rbp)
	testq %rsi, %rsi
	movl $1668246636, -198(%rbp)
	movl $540945696, -194(%rbp)
	movl $859125046, -190(%rbp)
	setne %al
	movl $1814569014, -186(%rbp)
	movl $1701278305, -182(%rbp)
	movl $1869488169, -178(%rbp)
	movzbl %al, %ecx
	movl $1970154862, -174(%rbp)
	movw $27756, -170(%rbp)
	movb $0, -168(%rbp)
	callq check__2__boolE1__byteE1_ptr1__ret_voidE1
	movq %rsi, %rcx
	movl $4096, %edx
	callq standard__memory__allocators__stdheap__frealloc__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64
	leaq -232(%rbp), %rdx
	movq %rax, %rsi
	xorl %eax, %eax
	movl $1634038374, -232(%rbp)
	testq %rsi, %rsi
	movl $1668246636, -228(%rbp)
	movl $1918987296, -224(%rbp)
	movl $1043162471, -220(%rbp)
	setne %al
	movl $909717556, -216(%rbp)
	movl $1852796448, -212(%rbp)
	movl $1819635245, -208(%rbp)
	movzbl %al, %ecx
	movw $108, -204(%rbp)
	callq check__2__boolE1__byteE1_ptr1__ret_voidE1
	movq %rsi, %rcx
	movl $64, %edx
	callq standard__memory__allocators__stdheap__frealloc__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64
	leaq -255(%rbp), %rdx
	movq %rax, %rsi
	xorl %eax, %eax
	movl $1634038374, -255(%rbp)
	testq %rsi, %rsi
	movl $1668246636, -251(%rbp)
	movl $910044448, -247(%rbp)
	movl $1869488180, -243(%rbp)
	setne %al
	movl $1970154862, -239(%rbp)
	movw $27756, -235(%rbp)
	movb $0, -233(%rbp)
	movzbl %al, %ecx
	callq check__2__boolE1__byteE1_ptr1__ret_voidE1
	movq %rsi, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl test_coalesce__0__ret_voidE1
	.def test_coalesce__0__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
test_coalesce__0__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $688, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB8117:
	leaq .LZERO(%rip), %rsi
	leaq -528(%rbp), %rdi
	movl $512, %ecx
	rep movsb
	leaq -549(%rbp), %rsi
	movl $1663053101, -549(%rbp)
	movl $1701601647, -545(%rbp)
	movl $1600480115, -541(%rbp)
	movl $1885431144, -537(%rbp)
	movl $170732832, -533(%rbp)
	movb $0, -529(%rbp)
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	xorl %esi, %esi
.LB8146:
	cmpq $64, %rsi
	jb .LB8147
.LB11911:
	movl $1, %eax
.LB8148:
	leaq -587(%rbp), %rdx
	movzbl %al, %ecx
	movl $1646277686, -587(%rbp)
	movl $1801678700, -583(%rbp)
	movl $1818304627, -579(%rbp)
	movl $1633906540, -575(%rbp)
	movl $543450484, -571(%rbp)
	movl $544370534, -567(%rbp)
	movl $1818324835, -563(%rbp)
	movl $1701016421, -559(%rbp)
	movl $1936028704, -555(%rbp)
	movw $116, -551(%rbp)
	callq check__2__boolE1__byteE1_ptr1__ret_voidE1
	xorl %esi, %esi
.LB8209:
	cmpq $64, %rsi
	jae .LB8211
.LB8210:
	movslq %esi, %rax
	movq -528(%rbp,%rax,8), %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	incq %rsi
	cmpq $64, %rsi
	jb .LB8210
	jmp .LB8211
.LB8147:
	movl $32, %ecx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -528(%rbp,%rsi,8)
	movslq %esi, %rax
	cmpq $0, -528(%rbp,%rax,8)
	je .LB8162
.LB8163:
	incq %rsi
	cmpq $64, %rsi
	jb .LB8147
	jmp .LB11911
.LB8162:
	xorl %eax, %eax
	jmp .LB8148
.LB8211:
	callq standard__memory__allocators__stdheap__coalesce_heap__0__ret_voidE1
	leaq -625(%rbp), %rdx
	movl $1818324835, -625(%rbp)
	movl $1701016421, -621(%rbp)
	movl $1634035807, -617(%rbp)
	movl $1868767344, -613(%rbp)
	movl $1701605485, -609(%rbp)
	movl $543450484, -605(%rbp)
	movl $1752459639, -601(%rbp)
	movl $544503151, -597(%rbp)
	movl $1935766115, -593(%rbp)
	movw $104, -589(%rbp)
	movl $1, %ecx
	callq check__2__boolE1__byteE1_ptr1__ret_voidE1
	movl $32, %ecx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	leaq -655(%rbp), %rdx
	movq %rax, %rsi
	xorl %eax, %eax
	movl $1869376609, -655(%rbp)
	testq %rsi, %rsi
	movl $1717641315, -651(%rbp)
	movl $544367988, -647(%rbp)
	movl $1818324835, -643(%rbp)
	setne %al
	movl $1701016421, -639(%rbp)
	movl $1668641568, -635(%rbp)
	movl $1684366691, -631(%rbp)
	movzbl %al, %ecx
	movw $115, -627(%rbp)
	callq check__2__boolE1__byteE1_ptr1__ret_voidE1
	movq %rsi, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
	.text
	.globl test_coalesce_bin_integrity__0__ret_voidE1
	.def test_coalesce_bin_integrity__0__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
test_coalesce_bin_integrity__0__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $432, %rsp
	movq %rsi, -8(%rbp)
	movq %rdi, -16(%rbp)
.LB8301:
	leaq .LZERO(%rip), %rsi
	leaq -272(%rbp), %rdi
	movl $256, %ecx
	rep movsb
	leaq -302(%rbp), %rsi
	movl $1663053101, -302(%rbp)
	movl $1701601647, -298(%rbp)
	movl $543515507, -294(%rbp)
	movl $544106850, -290(%rbp)
	movl $1702129257, -286(%rbp)
	movl $1953067623, -282(%rbp)
	movl $757932153, -278(%rbp)
	movw $10, -274(%rbp)
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	xorl %esi, %esi
.LB8342:
	cmpq $32, %rsi
	jb .LB8343
.LB11915:
	movl $1, %eax
.LB8344:
	leaq -330(%rbp), %rdx
	movzbl %al, %ecx
	movl $1663054387, -330(%rbp)
	movl $1936941420, -326(%rbp)
	movl $1646277165, -322(%rbp)
	movl $1801678700, -318(%rbp)
	movl $1818304627, -314(%rbp)
	movl $1633906540, -310(%rbp)
	movl $6579572, -306(%rbp)
	callq check__2__boolE1__byteE1_ptr1__ret_voidE1
	xorl %esi, %esi
.LB8395:
	cmpq $32, %rsi
	jae .LB8397
.LB8396:
	movslq %esi, %rax
	movq -272(%rbp,%rax,8), %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	incq %rsi
	cmpq $32, %rsi
	jb .LB8396
	jmp .LB8397
.LB8343:
	movl $64, %ecx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -272(%rbp,%rsi,8)
	movslq %esi, %rax
	cmpq $0, -272(%rbp,%rax,8)
	je .LB8358
.LB8359:
	incq %rsi
	cmpq $32, %rsi
	jb .LB8343
	jmp .LB11915
.LB8358:
	xorl %eax, %eax
	jmp .LB8344
.LB8397:
	callq standard__memory__allocators__stdheap__coalesce_heap__0__ret_voidE1
	xorl %esi, %esi
.LB8408:
	cmpq $32, %rsi
	jb .LB8409
.LB11916:
	movl $1, %eax
.LB8410:
	leaq -364(%rbp), %rdx
	movzbl %al, %ecx
	movl $1953722224, -364(%rbp)
	movl $1634689837, -360(%rbp)
	movl $1668506988, -356(%rbp)
	movl $1818304613, -352(%rbp)
	movl $1935896428, -348(%rbp)
	movl $1819042080, -344(%rbp)
	movl $1852796448, -340(%rbp)
	movl $1819635245, -336(%rbp)
	movw $108, -332(%rbp)
	callq check__2__boolE1__byteE1_ptr1__ret_voidE1
	xorl %eax, %eax
.LB8488:
	cmpq $32, %rax
	jb .LB8489
.LB11917:
	movl $1, %eax
.LB8490:
	leaq -397(%rbp), %rdx
	movzbl %al, %ecx
	movl $1953722224, -397(%rbp)
	movl $1634689837, -393(%rbp)
	movl $1668506988, -389(%rbp)
	movl $1920409701, -385(%rbp)
	movl $795178089, -381(%rbp)
	movl $1684104562, -377(%rbp)
	movl $1919902496, -373(%rbp)
	movl $1952671090, -369(%rbp)
	movb $0, -365(%rbp)
	callq check__2__boolE1__byteE1_ptr1__ret_voidE1
	xorl %esi, %esi
.LB8549:
	cmpq $32, %rsi
	jae .LB8551
.LB8550:
	movslq %esi, %rax
	movq -272(%rbp,%rax,8), %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	incq %rsi
	cmpq $32, %rsi
	jb .LB8550
	jmp .LB8551
.LB8409:
	movl $64, %ecx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -272(%rbp,%rsi,8)
	movslq %esi, %rax
	cmpq $0, -272(%rbp,%rax,8)
	je .LB8424
.LB8425:
	movq -272(%rbp,%rax,8), %rax
	movq %rsi, %rcx
	andq $255, %rcx
	movl $16, %edx
	xorl %edi, %edi
.LB11912:
	testq %rdx, %rdx
	je .LB11914
.LB11913:
	movb %cl, (%rax,%rdi,1)
	movb %cl, 1(%rax,%rdi,1)
	movb %cl, 2(%rax,%rdi,1)
	movb %cl, 3(%rax,%rdi,1)
	addq $4, %rdi
	decq %rdx
	jne .LB11913
.LB11914:
.LB8433:
	cmpq $64, %rdi
	jae .LB8435
.LB8434:
	movb %cl, (%rax,%rdi,1)
	incq %rdi
	cmpq $64, %rdi
	jb .LB8434
.LB8435:
	incq %rsi
	cmpq $32, %rsi
	jb .LB8409
	jmp .LB11916
.LB8424:
	xorl %eax, %eax
	jmp .LB8410
.LB8489:
	movslq %eax, %rcx
	movq -272(%rbp,%rcx,8), %rcx
	movzbl (%rcx), %ecx
	movq %rax, %rdx
	andq $255, %rdx
	cmpb %dl, %cl
	jne .LB8507
.LB8508:
	incq %rax
	cmpq $32, %rax
	jb .LB8489
	jmp .LB11917
.LB8507:
	xorl %eax, %eax
	jmp .LB8490
.LB8551:
	movq -8(%rbp), %rsi
	movq -16(%rbp), %rdi
	leave
	ret
	.text
	.globl test_fragmentation__0__ret_voidE1
	.def test_fragmentation__0__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
test_fragmentation__0__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $288, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
.LB8561:
	leaq -59(%rbp), %rsi
	movl $1663053101, -59(%rbp)
	movl $1801676136, -55(%rbp)
	movl $1634887263, -51(%rbp)
	movl $1852140903, -47(%rbp)
	movl $1769234804, -43(%rbp)
	movl $757100143, -39(%rbp)
	movw $2605, -35(%rbp)
	movb $0, -33(%rbp)
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	callq standard__memory__allocators__stdheap__check_fragmentation__0__ret_floatE1
	xorps %xmm1, %xmm1
	leaq -99(%rbp), %rdx
	movl $1734439526, -99(%rbp)
	movl $1953391981, -95(%rbp)
	movl $1869182049, -91(%rbp)
	movl $1852383342, -87(%rbp)
	movl $741366560, -83(%rbp)
	movl $1646288177, -79(%rbp)
	movl $1919903333, -75(%rbp)
	movl $1851859045, -71(%rbp)
	movl $1818304633, -67(%rbp)
	ucomiss %xmm1, %xmm0
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	movl $6516588, -63(%rbp)
	setae %al
	ucomiss %xmm0, %xmm1
	movzbl %al, %eax
	setae %cl
	movzbl %cl, %ecx
	andl %ecx, %eax
	movzbl %al, %ecx
	callq check__2__boolE1__byteE1_ptr1__ret_voidE1
	movl $64, %ecx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, %rsi
	movl $128, %ecx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, %rdi
	movl $256, %ecx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, %rbx
	movl $512, %ecx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, %r12
	callq standard__memory__allocators__stdheap__check_fragmentation__0__ret_floatE1
	xorps %xmm1, %xmm1
	leaq -139(%rbp), %rdx
	movsd %xmm0, -240(%rbp)
	movl $1734439526, -139(%rbp)
	movl $1953391981, -135(%rbp)
	movl $1869182049, -131(%rbp)
	movl $1852383342, -127(%rbp)
	movl $741366560, -123(%rbp)
	movl $1998609713, -119(%rbp)
	movl $543716457, -115(%rbp)
	ucomiss %xmm1, %xmm0
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	movl $1702259052, -111(%rbp)
	movl $1869373984, -107(%rbp)
	movl $7564131, -103(%rbp)
	setae %al
	ucomiss %xmm0, %xmm1
	movzbl %al, %eax
	setae %cl
	movzbl %cl, %ecx
	andl %ecx, %eax
	movzbl %al, %ecx
	callq check__2__boolE1__byteE1_ptr1__ret_voidE1
	movq %rsi, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movq %rdi, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movq %rbx, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movq %r12, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	callq standard__memory__allocators__stdheap__check_fragmentation__0__ret_floatE1
	xorps %xmm1, %xmm1
	leaq -180(%rbp), %rdx
	movsd %xmm0, -248(%rbp)
	movl $1734439526, -180(%rbp)
	movl $1953391981, -176(%rbp)
	movl $1869182049, -172(%rbp)
	movl $1852383342, -168(%rbp)
	movl $741366560, -164(%rbp)
	movl $1629510961, -160(%rbp)
	movl $1919251558, -156(%rbp)
	ucomiss %xmm1, %xmm0
	movabsq $1065353216, %r10
	movq %r10, %xmm1
	movl $1701996064, -152(%rbp)
	movl $1735289189, -148(%rbp)
	movl $1819042080, -144(%rbp)
	movb $0, -140(%rbp)
	setae %al
	ucomiss %xmm0, %xmm1
	movzbl %al, %eax
	setae %cl
	movzbl %cl, %ecx
	andl %ecx, %eax
	movzbl %al, %ecx
	callq check__2__boolE1__byteE1_ptr1__ret_voidE1
	movsd -248(%rbp), %xmm0
	movsd -240(%rbp), %xmm1
	leaq -226(%rbp), %rdx
	movl $1734439526, -226(%rbp)
	movl $1953391981, -222(%rbp)
	movl $1869182049, -218(%rbp)
	movl $1769087086, -214(%rbp)
	movl $544433523, -210(%rbp)
	movl $1702127201, -206(%rbp)
	movl $1919295602, -202(%rbp)
	movl $1852400997, -198(%rbp)
	movl $1768693863, -194(%rbp)
	movl $1646290294, -190(%rbp)
	movl $1801678700, -186(%rbp)
	movw $115, -182(%rbp)
	ucomiss %xmm1, %xmm0
	setae %al
	movzbl %al, %eax
	movzbl %al, %ecx
	callq check__2__boolE1__byteE1_ptr1__ret_voidE1
	callq standard__memory__allocators__stdheap__coalesce_heap__0__ret_voidE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
	.text
	.globl test_mixed_pattern__0__ret_voidE1
	.def test_mixed_pattern__0__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
test_mixed_pattern__0__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	movl $4288, %eax
	callq __chkstk
	subq %rax, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
	movq %r14, -48(%rbp)
	movq %r15, -56(%rbp)
.LB8812:
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -72(%rbp)
	leaq -2120(%rbp), %rax
	movq %rax, %rdi
	xorl %eax, %eax
	movl $2048, %ecx
	rep stosb
	leaq -4168(%rbp), %rax
	movq %rax, %rdi
	xorl %eax, %eax
	movl $2048, %ecx
	rep stosb
	leaq -4219(%rbp), %rsi
	movl $1830825261, -4219(%rbp)
	movl $1684371561, -4215(%rbp)
	movl $1819042080, -4211(%rbp)
	movl $1714381679, -4207(%rbp)
	movl $543516018, -4203(%rbp)
	movl $808465704, -4199(%rbp)
	movl $1886330928, -4195(%rbp)
	movl $1965042803, -4191(%rbp)
	movl $1869881456, -4187(%rbp)
	movl $909455904, -4183(%rbp)
	movl $1986620448, -4179(%rbp)
	movl $757082469, -4175(%rbp)
	movw $2605, -4171(%rbp)
	movb $0, -4169(%rbp)
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	callq standard__random__get_entropy__0__ret_dataE1_ubits64
	movq %rax, %rsi
	callq standard__random__get_entropy__0__ret_dataE1_ubits64
	movq %rax, %r8
	leaq -72(%rbp), %rcx
	movq %rsi, %rdx
	callq standard__random__pcg32_seed__3__PCG32E1_ptr1__dataE1_ubits64__dataE1_ubits64__ret_voidE1
	xorl %esi, %esi
	xorl %edi, %edi
	xorl %ebx, %ebx
	xorl %r12d, %r12d
	xorl %r13d, %r13d
	xorl %r14d, %r14d
	xorl %r15d, %r15d
.LB8885:
	cmpq $5000, %rsi
	jb .LB8886
.LB11918:
	movl $1, %eax
.LB8887:
	leaq -4255(%rbp), %rdx
	movzbl %al, %ecx
	movl $808464437, -4255(%rbp)
	movl $2020175136, -4251(%rbp)
	movl $1864393829, -4247(%rbp)
	movl $540701552, -4243(%rbp)
	movl $543976545, -4239(%rbp)
	movl $1869376609, -4235(%rbp)
	movl $1847620451, -4231(%rbp)
	movl $1848471151, -4227(%rbp)
	movl $7105653, -4223(%rbp)
	callq check__2__boolE1__byteE1_ptr1__ret_voidE1
	xorl %esi, %esi
.LB9027:
	cmpq %rbx, %rsi
	jae .LB9029
.LB9028:
	movslq %esi, %rax
	movq -2120(%rbp,%rax,8), %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	incq %rsi
	cmpq %rbx, %rsi
	jb .LB9028
	jmp .LB9029
.LB8886:
	leaq -72(%rbp), %rcx
	callq standard__random__pcg32_next__1__PCG32E1_ptr1__ret_dataE1_ubits32
	cmpq $256, %rbx
	je .LB8897
.LB8898:
	testq %rbx, %rbx
	je .LB8903
.LB8904:
	movq %rax, %rcx
	andq $255, %rcx
	xorl %edx, %edx
	cmpq $153, %rcx
	setb %dl
.LB8899:
	testb %dl, %dl
	jne .LB8912
.LB8913:
	xorl %edx, %edx
	divq %rbx
	movq %rdx, %r15
	movslq %r15d, %rax
	movq -2120(%rbp,%rax,8), %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	leaq -1(%rbx), %rax
	movslq %eax, %rcx
	movq -2120(%rbp,%rcx,8), %rdx
	movq %rdx, -2120(%rbp,%r15,8)
	movq -4168(%rbp,%rcx,8), %rcx
	movq %rcx, -4168(%rbp,%r15,8)
.LB8911:
	incq %rsi
	movq %rax, %rbx
	cmpq $5000, %rsi
	jb .LB8886
	jmp .LB11918
.LB8903:
	movl $1, %edx
	testb %dl, %dl
	jne .LB8912
	jmp .LB8913
.LB8897:
	xorl %edx, %edx
	testb %dl, %dl
	je .LB8913
.LB8912:
	andq $4095, %rax
	leaq 1(%rax), %rdi
	movq %rdi, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	testq %rax, %rax
	je .LB8924
.LB8925:
	movq %rbx, %rcx
	andq $255, %rcx
	xorl %r14d, %r14d
.LB8930:
	cmpq $8, %r14
	jae .LB8932
.LB8936:
	cmpq %rdi, %r14
	jae .LB8932
.LB8931:
	movb %cl, (%rax,%r14,1)
	incq %r14
	cmpq $8, %r14
	jb .LB8936
.LB8932:
	movq %rax, -2120(%rbp,%rbx,8)
	movq %rdi, -4168(%rbp,%rbx,8)
	leaq 1(%rbx), %rcx
	movq %rax, %r12
	movq %rax, %r13
	movq %rcx, %rax
	jmp .LB8911
.LB8924:
	xorl %eax, %eax
	jmp .LB8887
.LB9029:
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
	.globl test_table_stress__0__ret_voidE1
	.def test_table_stress__0__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
test_table_stress__0__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $2256, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
.LB9039:
	leaq -76(%rbp), %rsi
	movl $1948265773, -76(%rbp)
	movl $1701601889, -72(%rbp)
	movl $1920234272, -68(%rbp)
	movl $980644709, -64(%rbp)
	movl $875573792, -60(%rbp)
	movl $1768693816, -56(%rbp)
	movl $1814062454, -52(%rbp)
	movl $1701278305, -48(%rbp)
	movl $1869373984, -44(%rbp)
	movl $544435043, -40(%rbp)
	movl $666925, -36(%rbp)
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	leaq -2128(%rbp), %rax
	movq %rax, %rdi
	xorl %eax, %eax
	movl $2048, %ecx
	rep stosb
	xorl %eax, %eax
	movl $1, %esi
	xorl %edi, %edi
.LB9098:
	cmpq $2048, %rdi
	jb .LB9099
.LB11919:
.LB9100:
	leaq -2185(%rbp), %rdx
	movzbl %sil, %ecx
	movl $942944306, -2185(%rbp)
	movl $1918987296, -2181(%rbp)
	movl $1646290279, -2177(%rbp)
	movl $1801678700, -2173(%rbp)
	movl $942153843, -2169(%rbp)
	movl $1952539168, -2165(%rbp)
	movl $1936025699, -2161(%rbp)
	movl $543584032, -2157(%rbp)
	movl $691418418, -2153(%rbp)
	movl $1819042080, -2149(%rbp)
	movl $1952539503, -2145(%rbp)
	movl $1629512805, -2141(%rbp)
	movl $1713398894, -2137(%rbp)
	movl $1684366706, -2133(%rbp)
	movb $0, -2129(%rbp)
	callq check__2__boolE1__byteE1_ptr1__ret_voidE1
	movl $64, %ecx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	leaq -2219(%rbp), %rdx
	movq %rax, %rsi
	xorl %eax, %eax
	movl $1869376609, -2219(%rbp)
	testq %rsi, %rsi
	movl $1970479203, -2215(%rbp)
	movl $1701143395, -2211(%rbp)
	movl $1629516644, -2207(%rbp)
	setne %al
	movl $1919251558, -2203(%rbp)
	movl $1650553888, -2199(%rbp)
	movl $1931502956, -2195(%rbp)
	movzbl %al, %ecx
	movl $1936028276, -2191(%rbp)
	movw $115, -2187(%rbp)
	callq check__2__boolE1__byteE1_ptr1__ret_voidE1
	movq %rsi, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB9099:
	xorl %ebx, %ebx
.LB9105:
	cmpq $256, %rbx
	jb .LB9106
.LB11920:
	movq %rsi, %rbx
	movq %rax, %rsi
.LB9107:
	testb %bl, %bl
	je .LB9126
.LB9127:
	xorl %r12d, %r12d
.LB9130:
	cmpq $256, %r12
	jae .LB9132
.LB9131:
	movslq %r12d, %rax
	movq -2128(%rbp,%rax,8), %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	incq %r12
	cmpq $256, %r12
	jb .LB9131
	jmp .LB9132
.LB9106:
	movl $8192, %ecx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	testq %rax, %rax
	je .LB9116
.LB9117:
	movq %rax, -2128(%rbp,%rbx,8)
	incq %rbx
	cmpq $256, %rbx
	jb .LB9106
	jmp .LB11920
.LB9116:
	movq %rax, %rsi
	xorl %ebx, %ebx
	testb %bl, %bl
	je .LB9126
	jmp .LB9127
.LB9132:
	addq $256, %rdi
	movq %rsi, %rax
	movq %rbx, %rsi
	cmpq $2048, %rdi
	jb .LB9099
	jmp .LB11919
.LB9126:
	movq %rbx, %rsi
	jmp .LB9100
	.text
	.globl test_double_free_guard__0__ret_voidE1
	.def test_double_free_guard__0__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
test_double_free_guard__0__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $160, %rsp
	movq %rsi, -8(%rbp)
.LB9248:
	leaq -33(%rbp), %rsi
	movl $1679830317, -33(%rbp)
	movl $1818391919, -29(%rbp)
	movl $1919298917, -25(%rbp)
	movl $1730176357, -21(%rbp)
	movl $1685217653, -17(%rbp)
	movl $170732832, -13(%rbp)
	movb $0, -9(%rbp)
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	movl $64, %ecx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	leaq -60(%rbp), %rdx
	movq %rax, %rsi
	xorl %eax, %eax
	movl $1869376609, -60(%rbp)
	testq %rsi, %rsi
	movl $1868963939, -56(%rbp)
	movl $1868832882, -52(%rbp)
	movl $1701601909, -48(%rbp)
	setne %al
	movl $1701996077, -44(%rbp)
	movl $1702109285, -40(%rbp)
	movw $29811, -36(%rbp)
	movzbl %al, %ecx
	movb $0, -34(%rbp)
	callq check__2__boolE1__byteE1_ptr1__ret_voidE1
	movq %rsi, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movq %rsi, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	leaq -87(%rbp), %rdx
	movl $1651863396, -87(%rbp)
	movl $1714251116, -83(%rbp)
	movl $543516018, -79(%rbp)
	movl $1936027492, -75(%rbp)
	movl $1953459744, -71(%rbp)
	movl $1634886432, -67(%rbp)
	movw $26739, -63(%rbp)
	movb $0, -61(%rbp)
	movl $1, %ecx
	callq check__2__boolE1__byteE1_ptr1__ret_voidE1
	movl $64, %ecx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	leaq -125(%rbp), %rdx
	movq %rax, %rsi
	xorl %eax, %eax
	movl $1869376609, -125(%rbp)
	testq %rsi, %rsi
	movl $1717641315, -121(%rbp)
	movl $544367988, -117(%rbp)
	movl $1651863396, -113(%rbp)
	setne %al
	movl $1714251116, -109(%rbp)
	movl $543516018, -105(%rbp)
	movl $1713402729, -101(%rbp)
	movzbl %al, %ecx
	movl $1952673397, -97(%rbp)
	movl $1634627433, -93(%rbp)
	movw $108, -89(%rbp)
	callq check__2__boolE1__byteE1_ptr1__ret_voidE1
	movq %rsi, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movq -8(%rbp), %rsi
	leave
	ret
	.text
	.globl test_throughput_small__0__ret_voidE1
	.def test_throughput_small__0__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
test_throughput_small__0__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $272, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
.LB9390:
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -104(%rbp)
	vmovdqu .LZERO+32(%rip), %ymm15
	vmovdqu %ymm15, -72(%rbp)
	vzeroupper
	leaq -153(%rbp), %rsi
	movl $1948265773, -153(%rbp)
	movl $1970238056, -149(%rbp)
	movl $1970301031, -145(%rbp)
	movl $824195700, -141(%rbp)
	movl $544743501, -137(%rbp)
	movl $1647129654, -133(%rbp)
	movl $543519865, -129(%rbp)
	movl $1869376609, -125(%rbp)
	movl $1919298403, -121(%rbp)
	movl $1881171301, -117(%rbp)
	movl $1936877921, -113(%rbp)
	movl $170732832, -109(%rbp)
	movb $0, -105(%rbp)
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	callq standard__time__time_now__0__ret_dataE1_sbits64
	movq %rax, %rsi
	xorl %edi, %edi
.LB9459:
	cmpq $1000000, %rdi
	jb .LB9460
.LB11921:
	movl $1, %edi
.LB9461:
	callq standard__time__time_now__0__ret_dataE1_sbits64
	leaq -187(%rbp), %rdx
	movzbl %dil, %ecx
	movq %rax, %rbx
	movl $1629506865, -187(%rbp)
	movl $1668246636, -183(%rbp)
	movl $1701996075, -179(%rbp)
	movl $1634738277, -175(%rbp)
	movl $544436841, -171(%rbp)
	movl $543976545, -167(%rbp)
	movl $1667462515, -163(%rbp)
	movl $1701078373, -159(%rbp)
	movw $100, -155(%rbp)
	callq check__2__boolE1__byteE1_ptr1__ret_voidE1
	movq %rbx, %rcx
	subq %rsi, %rcx
	movq standard__time__TIME_NS_PER_MS(%rip), %rsi
	movq %rcx, %rax
	cqto
	idivq %rsi
	movq %rax, %rsi
	movq standard__time__TIME_NS_PER_US(%rip), %rdi
	movq %rcx, %rax
	cqto
	idivq %rdi
	movq %rax, %rdi
	movq %rdi, %rax
	movabsq $2361183241434822607, %rdx
	imulq %rdx
	sarq $7, %rdx
	movq %rdx, %rax
	shrq $63, %rax
	addq %rax, %rdx
	imulq $1000, %rdx, %rdx
	subq %rdx, %rdi
	movq %rcx, %rax
	movabsq $2361183241434822607, %rcx
	imulq %rcx
	sarq $7, %rdx
	movq %rdx, %rax
	shrq $63, %rax
	addq %rdx, %rax
	movl $1, %ecx
	testq %rax, %rax
	cmovg %rax, %rcx
	movabsq $64000000000, %rax
	cqto
	idivq %rcx
	leaq -202(%rbp), %r13
	movl $1769218080, -202(%rbp)
	movl $540697965, -198(%rbp)
	movq %rax, %rcx
	sarq $63, %rcx
	movl $538976288, -194(%rbp)
	movw $8224, -190(%rbp)
	movb $0, -188(%rbp)
	shrq $54, %rcx
	addq %rax, %rcx
	sarq $10, %rcx
	movq %rcx, %rbx
	movq %rax, %rcx
	sarq $63, %rcx
	shrq $54, %rcx
	addq %rax, %rcx
	sarq $10, %rcx
	imulq $1024, %rcx, %rcx
	subq %rcx, %rax
	imulq $10, %rax, %rax
	movq %rax, %rcx
	sarq $63, %rcx
	shrq $54, %rcx
	addq %rcx, %rax
	movq %r13, %rcx
	sarq $10, %rax
	movq %rax, %r12
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %r13, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	leaq -104(%rbp), %rdx
	movq %rsi, %rcx
	callq standard__strings__i64str__2__dataE1_sbits64__byteE1_ptr1__ret_dataE1_sbits64
	leaq -104(%rbp), %rsi
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	movw $46, -204(%rbp)
	leaq -204(%rbp), %rsi
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	cmpq $100, %rdi
	jl .LB9578
.LB9580:
	cmpq $10, %rdi
	jl .LB9588
.LB9590:
	leaq -104(%rbp), %rdx
	movq %rdi, %rcx
	callq standard__strings__i64str__2__dataE1_sbits64__byteE1_ptr1__ret_dataE1_sbits64
	leaq -104(%rbp), %rsi
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	movl $175336736, -213(%rbp)
	movb $0, -209(%rbp)
	leaq -213(%rbp), %rsi
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	leaq -228(%rbp), %rsi
	movl $1752440864, -228(%rbp)
	movl $1735749490, -224(%rbp)
	movl $1953853544, -220(%rbp)
	movw $8250, -216(%rbp)
	movb $0, -214(%rbp)
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	leaq -104(%rbp), %rdx
	movq %rbx, %rcx
	callq standard__strings__i64str__2__dataE1_sbits64__byteE1_ptr1__ret_dataE1_sbits64
	leaq -104(%rbp), %rsi
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	movw $46, -230(%rbp)
	leaq -230(%rbp), %rsi
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	leaq -104(%rbp), %rdx
	movq %r12, %rcx
	callq standard__strings__i64str__2__dataE1_sbits64__byteE1_ptr1__ret_dataE1_sbits64
	leaq -104(%rbp), %rsi
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	movl $792874272, -237(%rbp)
	movw $2675, -233(%rbp)
	movb $0, -231(%rbp)
	leaq -237(%rbp), %rsi
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
.LB9460:
	movl $64, %ecx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	testq %rax, %rax
	je .LB9470
.LB9471:
	movq %rax, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	incq %rdi
	cmpq $1000000, %rdi
	jb .LB9460
	jmp .LB11921
.LB9470:
	xorl %edi, %edi
	jmp .LB9461
.LB9578:
	movw $48, -206(%rbp)
	leaq -206(%rbp), %rsi
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	cmpq $10, %rdi
	jge .LB9590
.LB9588:
	movw $48, -208(%rbp)
	leaq -208(%rbp), %rsi
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	jmp .LB9590
	.text
	.globl test_throughput_mixed__0__ret_voidE1
	.def test_throughput_mixed__0__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
test_throughput_mixed__0__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $320, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
.LB9644:
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -56(%rbp)
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -120(%rbp)
	vmovdqu .LZERO+32(%rip), %ymm15
	vmovdqu %ymm15, -88(%rbp)
	vzeroupper
	leaq -185(%rbp), %rsi
	movl $1948265773, -185(%rbp)
	movl $1970238056, -181(%rbp)
	movl $1970301031, -177(%rbp)
	movl $824195700, -173(%rbp)
	movl $1768759373, -169(%rbp)
	movl $761554296, -165(%rbp)
	movl $1702521203, -161(%rbp)
	movl $758196256, -157(%rbp)
	movl $909717556, -153(%rbp)
	movl $1954112032, -149(%rbp)
	movl $539587429, -145(%rbp)
	movl $1869376609, -141(%rbp)
	movl $1919298403, -137(%rbp)
	movl $1881171301, -133(%rbp)
	movl $1936877921, -129(%rbp)
	movl $170732832, -125(%rbp)
	movb $0, -121(%rbp)
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	callq standard__random__get_entropy__0__ret_dataE1_ubits64
	movq %rax, %rsi
	callq standard__random__get_entropy__0__ret_dataE1_ubits64
	movq %rax, %r8
	leaq -56(%rbp), %rcx
	movq %rsi, %rdx
	callq standard__random__pcg32_seed__3__PCG32E1_ptr1__dataE1_ubits64__dataE1_ubits64__ret_voidE1
	callq standard__time__time_now__0__ret_dataE1_sbits64
	movq %rax, %rsi
	xorl %edi, %edi
	xorl %ebx, %ebx
.LB9735:
	cmpq $1000000, %rbx
	jb .LB9736
.LB11922:
	movl $1, %ebx
.LB9737:
	callq standard__time__time_now__0__ret_dataE1_sbits64
	leaq -225(%rbp), %rdx
	movzbl %bl, %ecx
	movq %rax, %r12
	movl $1830833457, -225(%rbp)
	movl $1684371561, -221(%rbp)
	movl $1819042080, -217(%rbp)
	movl $1714119535, -213(%rbp)
	movl $543516018, -209(%rbp)
	movl $1919508848, -205(%rbp)
	movl $1818304627, -201(%rbp)
	movl $1970479212, -197(%rbp)
	movl $1701143395, -193(%rbp)
	movl $6579556, -189(%rbp)
	callq check__2__boolE1__byteE1_ptr1__ret_voidE1
	movq %r12, %rcx
	subq %rsi, %rcx
	movq standard__time__TIME_NS_PER_MS(%rip), %rsi
	movq %rcx, %rax
	cqto
	idivq %rsi
	movq %rax, %rsi
	movq standard__time__TIME_NS_PER_US(%rip), %r8
	movq %rcx, %rax
	cqto
	idivq %r8
	movq %rax, %r8
	movq %r8, %rax
	movabsq $2361183241434822607, %rdx
	imulq %rdx
	sarq $7, %rdx
	movq %rdx, %rax
	shrq $63, %rax
	addq %rax, %rdx
	imulq $1000, %rdx, %rdx
	movq %r8, %rbx
	subq %rdx, %rbx
	movq %rcx, %rax
	movabsq $2361183241434822607, %rcx
	imulq %rcx
	sarq $7, %rdx
	movq %rdx, %rax
	shrq $63, %rax
	addq %rdx, %rax
	movl $1, %ecx
	testq %rax, %rax
	cmovg %rax, %rcx
	imulq $1000, %rdi, %rax
	cqto
	idivq %rcx
	leaq -240(%rbp), %r13
	movl $1769218080, -240(%rbp)
	movl $540697965, -236(%rbp)
	movq %rax, %rcx
	sarq $63, %rcx
	movl $538976288, -232(%rbp)
	movw $8224, -228(%rbp)
	movb $0, -226(%rbp)
	shrq $54, %rcx
	addq %rax, %rcx
	sarq $10, %rcx
	movq %rcx, %rdi
	movq %rax, %rcx
	sarq $63, %rcx
	shrq $54, %rcx
	addq %rax, %rcx
	sarq $10, %rcx
	imulq $1024, %rcx, %rcx
	subq %rcx, %rax
	imulq $10, %rax, %rax
	movq %rax, %rcx
	sarq $63, %rcx
	shrq $54, %rcx
	addq %rcx, %rax
	movq %r13, %rcx
	sarq $10, %rax
	movq %rax, %r12
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %r13, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	leaq -120(%rbp), %rdx
	movq %rsi, %rcx
	callq standard__strings__i64str__2__dataE1_sbits64__byteE1_ptr1__ret_dataE1_sbits64
	leaq -120(%rbp), %rsi
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	movw $46, -242(%rbp)
	leaq -242(%rbp), %rsi
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	cmpq $100, %rbx
	jl .LB9869
.LB9871:
	cmpq $10, %rbx
	jl .LB9879
.LB9881:
	leaq -120(%rbp), %rdx
	movq %rbx, %rcx
	callq standard__strings__i64str__2__dataE1_sbits64__byteE1_ptr1__ret_dataE1_sbits64
	leaq -120(%rbp), %rsi
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	movl $175336736, -251(%rbp)
	movb $0, -247(%rbp)
	leaq -251(%rbp), %rsi
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	leaq -266(%rbp), %rsi
	movl $1752440864, -266(%rbp)
	movl $1735749490, -262(%rbp)
	movl $1953853544, -258(%rbp)
	movw $8250, -254(%rbp)
	movb $0, -252(%rbp)
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	leaq -120(%rbp), %rdx
	movq %rdi, %rcx
	callq standard__strings__i64str__2__dataE1_sbits64__byteE1_ptr1__ret_dataE1_sbits64
	leaq -120(%rbp), %rsi
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	movw $46, -268(%rbp)
	leaq -268(%rbp), %rsi
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	leaq -120(%rbp), %rdx
	movq %r12, %rcx
	callq standard__strings__i64str__2__dataE1_sbits64__byteE1_ptr1__ret_dataE1_sbits64
	leaq -120(%rbp), %rsi
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	movl $792874272, -275(%rbp)
	movw $2675, -271(%rbp)
	movb $0, -269(%rbp)
	leaq -275(%rbp), %rsi
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
.LB9736:
	leaq -56(%rbp), %rcx
	callq standard__random__pcg32_next__1__PCG32E1_ptr1__ret_dataE1_ubits32
	andq $4095, %rax
	leaq 1(%rax), %r12
	movq %r12, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	testq %rax, %rax
	je .LB9754
.LB9755:
	addq %r12, %rdi
	movq %rax, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	incq %rbx
	cmpq $1000000, %rbx
	jb .LB9736
	jmp .LB11922
.LB9754:
	xorl %ebx, %ebx
	jmp .LB9737
.LB9869:
	movw $48, -244(%rbp)
	leaq -244(%rbp), %rsi
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	cmpq $10, %rbx
	jge .LB9881
.LB9879:
	movw $48, -246(%rbp)
	leaq -246(%rbp), %rsi
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	jmp .LB9881
	.text
	.globl test_throughput_fastpath__0__ret_voidE1
	.def test_throughput_fastpath__0__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
test_throughput_fastpath__0__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $304, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
.LB9935:
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -104(%rbp)
	vmovdqu .LZERO+32(%rip), %ymm15
	vmovdqu %ymm15, -72(%rbp)
	vzeroupper
	leaq -168(%rbp), %rsi
	movl $1948265773, -168(%rbp)
	movl $1970238056, -164(%rbp)
	movl $1970301031, -160(%rbp)
	movl $1713388148, -156(%rbp)
	movl $762606433, -152(%rbp)
	movl $1752457584, -148(%rbp)
	movl $1852400160, -144(%rbp)
	movl $1969582624, -140(%rbp)
	movl $673211763, -136(%rbp)
	movl $2015382833, -132(%rbp)
	movl $758396448, -128(%rbp)
	movl $1702132066, -124(%rbp)
	movl $1635196972, -120(%rbp)
	movl $1646292338, -116(%rbp)
	movl $539586153, -112(%rbp)
	movl $666925, -108(%rbp)
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	movl $64, %ecx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	callq standard__time__time_now__0__ret_dataE1_sbits64
	movq %rax, %rsi
	xorl %edi, %edi
.LB10022:
	cmpq $1000000, %rdi
	jb .LB10023
.LB11923:
	movl $1, %edi
.LB10024:
	callq standard__time__time_now__0__ret_dataE1_sbits64
	leaq -212(%rbp), %rdx
	movzbl %dil, %ecx
	movq %rax, %rbx
	movl $1713392945, -212(%rbp)
	movl $762606433, -208(%rbp)
	movl $1752457584, -204(%rbp)
	movl $1852400160, -200(%rbp)
	movl $1969582637, -196(%rbp)
	movl $1663067507, -192(%rbp)
	movl $1701602169, -188(%rbp)
	movl $1818304627, -184(%rbp)
	movl $1970479212, -180(%rbp)
	movl $1701143395, -176(%rbp)
	movl $6579556, -172(%rbp)
	callq check__2__boolE1__byteE1_ptr1__ret_voidE1
	movq %rbx, %rcx
	subq %rsi, %rcx
	movq standard__time__TIME_NS_PER_MS(%rip), %rsi
	movq %rcx, %rax
	cqto
	idivq %rsi
	movq %rax, %rsi
	movq standard__time__TIME_NS_PER_US(%rip), %rdi
	movq %rcx, %rax
	cqto
	idivq %rdi
	movq %rax, %rdi
	movq %rdi, %rax
	movabsq $2361183241434822607, %rdx
	imulq %rdx
	sarq $7, %rdx
	movq %rdx, %rax
	shrq $63, %rax
	addq %rax, %rdx
	imulq $1000, %rdx, %rdx
	subq %rdx, %rdi
	movq %rcx, %rax
	movabsq $2361183241434822607, %rcx
	imulq %rcx
	sarq $7, %rdx
	movq %rdx, %rax
	shrq $63, %rax
	addq %rdx, %rax
	movl $1, %ecx
	testq %rax, %rax
	cmovg %rax, %rcx
	movabsq $64000000000, %rax
	cqto
	idivq %rcx
	leaq -227(%rbp), %r13
	movl $1769218080, -227(%rbp)
	movl $540697965, -223(%rbp)
	movq %rax, %rcx
	sarq $63, %rcx
	movl $538976288, -219(%rbp)
	movw $8224, -215(%rbp)
	movb $0, -213(%rbp)
	shrq $54, %rcx
	addq %rax, %rcx
	sarq $10, %rcx
	movq %rcx, %rbx
	movq %rax, %rcx
	sarq $63, %rcx
	shrq $54, %rcx
	addq %rax, %rcx
	sarq $10, %rcx
	imulq $1024, %rcx, %rcx
	subq %rcx, %rax
	imulq $10, %rax, %rax
	movq %rax, %rcx
	sarq $63, %rcx
	shrq $54, %rcx
	addq %rcx, %rax
	movq %r13, %rcx
	sarq $10, %rax
	movq %rax, %r12
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %r13, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	leaq -104(%rbp), %rdx
	movq %rsi, %rcx
	callq standard__strings__i64str__2__dataE1_sbits64__byteE1_ptr1__ret_dataE1_sbits64
	leaq -104(%rbp), %rsi
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	movw $46, -229(%rbp)
	leaq -229(%rbp), %rsi
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	cmpq $100, %rdi
	jl .LB10151
.LB10153:
	cmpq $10, %rdi
	jl .LB10161
.LB10163:
	leaq -104(%rbp), %rdx
	movq %rdi, %rcx
	callq standard__strings__i64str__2__dataE1_sbits64__byteE1_ptr1__ret_dataE1_sbits64
	leaq -104(%rbp), %rsi
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	movl $175336736, -238(%rbp)
	movb $0, -234(%rbp)
	leaq -238(%rbp), %rsi
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	leaq -253(%rbp), %rsi
	movl $1752440864, -253(%rbp)
	movl $1735749490, -249(%rbp)
	movl $1953853544, -245(%rbp)
	movw $8250, -241(%rbp)
	movb $0, -239(%rbp)
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	leaq -104(%rbp), %rdx
	movq %rbx, %rcx
	callq standard__strings__i64str__2__dataE1_sbits64__byteE1_ptr1__ret_dataE1_sbits64
	leaq -104(%rbp), %rsi
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	movw $46, -255(%rbp)
	leaq -255(%rbp), %rsi
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	leaq -104(%rbp), %rdx
	movq %r12, %rcx
	callq standard__strings__i64str__2__dataE1_sbits64__byteE1_ptr1__ret_dataE1_sbits64
	leaq -104(%rbp), %rsi
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	movl $792874272, -262(%rbp)
	movw $2675, -258(%rbp)
	movb $0, -256(%rbp)
	leaq -262(%rbp), %rsi
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
.LB10023:
	movl $64, %ecx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	testq %rax, %rax
	je .LB10033
.LB10034:
	movq %rax, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	incq %rdi
	cmpq $1000000, %rdi
	jb .LB10023
	jmp .LB11923
.LB10033:
	xorl %edi, %edi
	jmp .LB10024
.LB10151:
	movw $48, -231(%rbp)
	leaq -231(%rbp), %rsi
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	cmpq $10, %rdi
	jge .LB10163
.LB10161:
	movw $48, -233(%rbp)
	leaq -233(%rbp), %rsi
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	jmp .LB10163
	.text
	.globl bw_print__3__byteE1_ptr1__dataE1_sbits64__dataE1_sbits64__ret_voidE1
	.def bw_print__3__byteE1_ptr1__dataE1_sbits64__dataE1_sbits64__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
bw_print__3__byteE1_ptr1__dataE1_sbits64__dataE1_sbits64__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $144, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
.LB10217:
	movq %rcx, %rsi
	movq %rdx, %rcx
	movq %r8, %rax
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -88(%rbp)
	vmovdqu .LZERO+32(%rip), %ymm15
	vmovdqu %ymm15, -56(%rbp)
	vzeroupper
	movabsq $2361183241434822607, %rdx
	imulq %rdx
	sarq $7, %rdx
	movq %rdx, %rax
	shrq $63, %rax
	addq %rdx, %rax
	movl $1, %edx
	testq %rax, %rax
	movq %rax, %rdi
	cmovle %rdx, %rdi
	imulq $1000000, %rcx, %rax
	cqto
	idivq %rdi
	movq %rax, %rcx
	sarq $63, %rcx
	shrq $44, %rcx
	addq %rax, %rcx
	sarq $20, %rcx
	movq %rcx, %rdi
	movq %rax, %rcx
	sarq $63, %rcx
	shrq $44, %rcx
	addq %rax, %rcx
	sarq $20, %rcx
	imulq $1048576, %rcx, %rcx
	subq %rcx, %rax
	imulq $10, %rax, %rax
	movq %rax, %rcx
	sarq $63, %rcx
	shrq $44, %rcx
	addq %rcx, %rax
	sarq $20, %rax
	movq %rax, %rbx
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	leaq -88(%rbp), %rdx
	movq %rdi, %rcx
	callq standard__strings__i64str__2__dataE1_sbits64__byteE1_ptr1__ret_dataE1_sbits64
	leaq -88(%rbp), %rsi
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	movw $46, -90(%rbp)
	leaq -90(%rbp), %rsi
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	leaq -88(%rbp), %rdx
	movq %rbx, %rcx
	callq standard__strings__i64str__2__dataE1_sbits64__byteE1_ptr1__ret_dataE1_sbits64
	leaq -88(%rbp), %rsi
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	movl $792874272, -97(%rbp)
	movw $2675, -93(%rbp)
	movb $0, -91(%rbp)
	leaq -97(%rbp), %rsi
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	leave
	ret
	.text
	.globl test_bandwidth__0__ret_voidE1
	.def test_bandwidth__0__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
test_bandwidth__0__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $448, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
	movq %r14, -48(%rbp)
	movq %r15, -56(%rbp)
.LB10275:
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -72(%rbp)
	vmovdqu .LZERO(%rip), %ymm15
	vmovdqu %ymm15, -136(%rbp)
	vmovdqu .LZERO+32(%rip), %ymm15
	vmovdqu %ymm15, -104(%rbp)
	vzeroupper
	leaq -182(%rbp), %rsi
	movl $1646275885, -182(%rbp)
	movl $2003070561, -178(%rbp)
	movl $1752458345, -174(%rbp)
	movl $2036473914, -170(%rbp)
	movl $544433524, -166(%rbp)
	movl $1953067639, -162(%rbp)
	movl $544105844, -158(%rbp)
	movl $543452769, -154(%rbp)
	movl $1684104562, -150(%rbp)
	movl $1667326496, -146(%rbp)
	movl $757932139, -142(%rbp)
	movw $10, -138(%rbp)
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	callq standard__time__time_now__0__ret_dataE1_sbits64
	movq %rax, -392(%rbp)
	xorl %esi, %esi
	xorl %edi, %edi
	xorl %ebx, %ebx
	xorl %r12d, %r12d
.LB10349:
	cmpq $1000000, %rdi
	jb .LB10350
.LB11936:
	movq $1, -416(%rbp)
.LB10351:
	callq standard__time__time_now__0__ret_dataE1_sbits64
	movq -416(%rbp), %rcx
	leaq -217(%rbp), %rdx
	movq %rax, %rdi
	xorl %eax, %eax
	cmpq %r12, %rbx
	movl $1647129654, -217(%rbp)
	movl $543519865, -213(%rbp)
	movl $1953067639, -209(%rbp)
	sete %al
	movl $1701982053, -205(%rbp)
	movl $1647141985, -201(%rbp)
	movl $543908705, -197(%rbp)
	movl $1936553331, -193(%rbp)
	movl $1952541984, -189(%rbp)
	movw $26723, -185(%rbp)
	movb $0, -183(%rbp)
	andl %eax, %ecx
	movzbl %cl, %ecx
	callq check__2__boolE1__byteE1_ptr1__ret_voidE1
	movl $875962400, -236(%rbp)
	movl $1954112045, -232(%rbp)
	movl $1634738277, -228(%rbp)
	movl $980644457, -224(%rbp)
	movw $8224, -220(%rbp)
	movb $0, -218(%rbp)
	movq -392(%rbp), %rax
	leaq -236(%rbp), %rcx
	movq %rsi, %rdx
	movq %rdi, %r8
	subq %rax, %r8
	callq bw_print__3__byteE1_ptr1__dataE1_sbits64__dataE1_sbits64__ret_voidE1
	callq standard__random__get_entropy__0__ret_dataE1_ubits64
	movq %rax, %rsi
	callq standard__random__get_entropy__0__ret_dataE1_ubits64
	movq %rax, %r8
	leaq -72(%rbp), %rcx
	movq %rsi, %rdx
	callq standard__random__pcg32_seed__3__PCG32E1_ptr1__dataE1_ubits64__dataE1_ubits64__ret_voidE1
	callq standard__time__time_now__0__ret_dataE1_sbits64
	movq %rax, -408(%rbp)
	xorl %esi, %esi
	xorl %edi, %edi
	xorl %ebx, %ebx
	xorl %r12d, %r12d
.LB10484:
	cmpq $1000000, %rdi
	jb .LB10485
.LB11937:
	movq -416(%rbp), %rdi
.LB10486:
	callq standard__time__time_now__0__ret_dataE1_sbits64
	leaq -269(%rbp), %rdx
	movq %rax, %r13
	xorl %eax, %eax
	cmpq %r12, %rbx
	sete %al
	movl $1702390125, -269(%rbp)
	movl $1920409700, -265(%rbp)
	movl $795178089, -261(%rbp)
	andl %eax, %edi
	movl $1684104562, -257(%rbp)
	movl $1667326509, -253(%rbp)
	movl $1970479211, -249(%rbp)
	movzbl %dil, %ecx
	movl $1830843245, -245(%rbp)
	movl $1751348321, -241(%rbp)
	movb $0, -237(%rbp)
	callq check__2__boolE1__byteE1_ptr1__ret_voidE1
	movl $1768759328, -288(%rbp)
	movl $543450488, -284(%rbp)
	movl $1919508848, -280(%rbp)
	movl $538983027, -276(%rbp)
	movw $8224, -272(%rbp)
	movb $0, -270(%rbp)
	movq -408(%rbp), %rax
	leaq -288(%rbp), %rcx
	movq %rsi, %rdx
	movq %r13, %r8
	subq %rax, %r8
	callq bw_print__3__byteE1_ptr1__dataE1_sbits64__dataE1_sbits64__ret_voidE1
	movl $67108864, %ecx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	leaq -310(%rbp), %rdx
	movq %rax, %rsi
	xorl %edi, %edi
	movl $1293956150, -310(%rbp)
	testq %rsi, %rsi
	movl $1818370114, -306(%rbp)
	movl $543908719, -302(%rbp)
	movl $1869376609, -298(%rbp)
	setne %dil
	movl $1702125923, -294(%rbp)
	movw $100, -290(%rbp)
	movzbl %dil, %ecx
	callq check__2__boolE1__byteE1_ptr1__ret_voidE1
	testb %dil, %dil
	jne .LB10673
.LB10674:
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	movq -48(%rbp), %r14
	movq -56(%rbp), %r15
	leave
	ret
.LB10350:
	movl $64, %ecx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	testq %rax, %rax
	je .LB10360
.LB10361:
	leaq 1(%rdi), %r13
	leaq 2(%rdi), %rcx
	leaq 3(%rdi), %rdx
	leaq 4(%rdi), %r8
	leaq 5(%rdi), %r9
	leaq 6(%rdi), %r14
	leaq 7(%rdi), %r15
	addq %rdi, %rbx
	addq %r13, %rbx
	movq %rdi, (%rax)
	addq %rcx, %rbx
	movq %r13, 8(%rax)
	movq %rcx, 16(%rax)
	addq %rdx, %rbx
	movq %rdx, 24(%rax)
	movq %r8, 32(%rax)
	movq %r9, 40(%rax)
	addq %r8, %rbx
	movq %r14, 48(%rax)
	movq %r15, 56(%rax)
	movq %rax, %rcx
	addq %r9, %rbx
	addq %r14, %rbx
	addq %r15, %rbx
	shlq $3, %rdi
	addq %rdi, %r12
	addq $28, %r12
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	addq $128, %rsi
	movq %r13, %rdi
	cmpq $1000000, %rdi
	jb .LB10350
	jmp .LB11936
.LB10360:
	movq $0, -416(%rbp)
	jmp .LB10351
.LB10485:
	leaq -72(%rbp), %rcx
	callq standard__random__pcg32_next__1__PCG32E1_ptr1__ret_dataE1_ubits32
	andq $4095, %rax
	leaq 1(%rax), %r13
	movq %r13, %rcx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	testq %rax, %rax
	je .LB10503
.LB10504:
	shrq $3, %r13
	movl $1, %ecx
	testq %r13, %r13
	cmove %rcx, %r13
	xorl %ecx, %ecx
	testq %r13, %r13
	cmova %r13, %rcx
	shrq $2, %rcx
	xorl %edx, %edx
.LB11924:
	testq %rcx, %rcx
	je .LB11926
.LB11925:
	leaq (%rdi,%rdx), %r8
	movq %r8, (%rax,%rdx,8)
	leaq 1(%rdx), %r8
	addq %rdi, %r8
	movq %r8, 8(%rax,%rdx,8)
	leaq 2(%rdx), %r8
	addq %rdi, %r8
	movq %r8, 16(%rax,%rdx,8)
	leaq 3(%rdx), %r8
	addq %rdi, %r8
	movq %r8, 24(%rax,%rdx,8)
	addq $4, %rdx
	decq %rcx
	jne .LB11925
.LB11926:
.LB10519:
	cmpq %r13, %rdx
	jae .LB10521
.LB10520:
	leaq (%rdi,%rdx), %rcx
	movq %rcx, (%rax,%rdx,8)
	incq %rdx
	cmpq %r13, %rdx
	jb .LB10520
.LB10521:
	xorl %ecx, %ecx
	testq %r13, %r13
	cmova %r13, %rcx
	shrq $2, %rcx
	xorl %edx, %edx
	xorl %r8d, %r8d
	xorl %r9d, %r9d
	movq $0, -400(%rbp)
.LB11927:
	testq %rcx, %rcx
	je .LB11929
.LB11928:
	movslq %edx, %r14
	addq (%rax,%r14,8), %rbx
	leaq 1(%rdx), %r14
	movslq %r14d, %r14
	addq (%rax,%r14,8), %r8
	leaq 2(%rdx), %r14
	movslq %r14d, %r14
	addq (%rax,%r14,8), %r9
	movq -400(%rbp), %r15
	leaq 3(%rdx), %r14
	movslq %r14d, %r14
	addq (%rax,%r14,8), %r15
	addq $4, %rdx
	decq %rcx
	movq %r15, -400(%rbp)
	testq %rcx, %rcx
	jne .LB11928
.LB11929:
	addq %r8, %rbx
	movq -400(%rbp), %rcx
	addq %rcx, %r9
	leaq (%rbx,%r9), %rcx
	movq %rcx, %rbx
.LB10534:
	cmpq %r13, %rdx
	jae .LB10536
.LB10535:
	movslq %edx, %rcx
	addq (%rax,%rcx,8), %rbx
	incq %rdx
	cmpq %r13, %rdx
	jb .LB10535
.LB10536:
	movq %rdi, %rcx
	imulq %r13, %rcx
	addq %rcx, %r12
	leaq -1(%r13), %rcx
	imulq %r13, %rcx
	shrq $1, %rcx
	addq %rcx, %r12
	movq %rax, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	shlq $4, %r13
	addq %r13, %rsi
	incq %rdi
	cmpq $1000000, %rdi
	jb .LB10485
	jmp .LB11937
.LB10503:
	xorl %edi, %edi
	jmp .LB10486
.LB10673:
	callq standard__time__time_now__0__ret_dataE1_sbits64
	movq %rax, %rdi
	xorl %eax, %eax
.LB10683:
	cmpq $4, %rax
	jae .LB10685
.LB10684:
	movl $2097152, %ecx
	xorl %edx, %edx
.LB11930:
	testq %rcx, %rcx
	je .LB11932
.LB11931:
	leaq (%rdx,%rax), %r8
	movq %r8, (%rsi,%rdx,8)
	leaq 1(%rdx), %r8
	addq %rax, %r8
	movq %r8, 8(%rsi,%rdx,8)
	leaq 2(%rdx), %r8
	addq %rax, %r8
	movq %r8, 16(%rsi,%rdx,8)
	leaq 3(%rdx), %r8
	addq %rax, %r8
	movq %r8, 24(%rsi,%rdx,8)
	addq $4, %rdx
	decq %rcx
	jne .LB11931
	jmp .LB11932
.LB10685:
	callq standard__time__time_now__0__ret_dataE1_sbits64
	leaq -329(%rbp), %rcx
	movl $1953701920, -329(%rbp)
	movl $1835099506, -325(%rbp)
	movq %rax, %r8
	subq %rdi, %r8
	movl $1769109280, -321(%rbp)
	movl $540697972, -317(%rbp)
	movw $8224, -313(%rbp)
	movb $0, -311(%rbp)
	movl $268435456, %edx
	callq bw_print__3__byteE1_ptr1__dataE1_sbits64__dataE1_sbits64__ret_voidE1
	callq standard__time__time_now__0__ret_dataE1_sbits64
	movq %rax, %rdi
	xorl %eax, %eax
	xorl %ebx, %ebx
.LB10737:
	cmpq $4, %rax
	jae .LB10739
.LB10738:
	movl $2097152, %ecx
	xorl %edx, %edx
	xorl %r8d, %r8d
	xorl %r9d, %r9d
	xorl %r12d, %r12d
.LB11933:
	testq %rcx, %rcx
	je .LB11935
.LB11934:
	movslq %edx, %r13
	addq (%rsi,%r13,8), %rbx
	leaq 1(%rdx), %r13
	movslq %r13d, %r13
	addq (%rsi,%r13,8), %r8
	leaq 2(%rdx), %r13
	movslq %r13d, %r13
	addq (%rsi,%r13,8), %r9
	leaq 3(%rdx), %r13
	movslq %r13d, %r13
	addq (%rsi,%r13,8), %r12
	addq $4, %rdx
	decq %rcx
	jne .LB11934
	jmp .LB11935
.LB10739:
	callq standard__time__time_now__0__ret_dataE1_sbits64
	leaq -358(%rbp), %rdx
	movq %rax, %r12
	movabsq $140737572241408, %rax
	xorl %ecx, %ecx
	cmpq %rax, %rbx
	movl $1701999731, -358(%rbp)
	movl $1914727777, -354(%rbp)
	movl $761553253, -350(%rbp)
	sete %cl
	movl $1801675106, -346(%rbp)
	movl $1836413728, -342(%rbp)
	movl $1952541984, -338(%rbp)
	movzbl %cl, %ecx
	movl $1936025699, -334(%rbp)
	movb $0, -330(%rbp)
	callq check__2__boolE1__byteE1_ptr1__ret_voidE1
	leaq -377(%rbp), %rcx
	movq %r12, %r8
	subq %rdi, %r8
	movl $1953701920, -377(%rbp)
	movl $1835099506, -373(%rbp)
	movl $1634038304, -369(%rbp)
	movl $538983012, -365(%rbp)
	movw $8224, -361(%rbp)
	movb $0, -359(%rbp)
	movl $268435456, %edx
	callq bw_print__3__byteE1_ptr1__dataE1_sbits64__dataE1_sbits64__ret_voidE1
	movq %rsi, %rcx
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
.LB11935:
	addq %r8, %rbx
	addq %r12, %r9
	leaq (%rbx,%r9), %rcx
.LB10744:
	cmpq $8388608, %rdx
	jae .LB10746
.LB10745:
	movslq %edx, %r8
	addq (%rsi,%r8,8), %rcx
	incq %rdx
	cmpq $8388608, %rdx
	jb .LB10745
.LB10746:
	incq %rax
	movq %rcx, %rbx
	cmpq $4, %rax
	jb .LB10738
	jmp .LB10739
.LB11932:
.LB10690:
	cmpq $8388608, %rdx
	jae .LB10692
.LB10691:
	leaq (%rdx,%rax), %rcx
	movq %rcx, (%rsi,%rdx,8)
	incq %rdx
	cmpq $8388608, %rdx
	jb .LB10691
.LB10692:
	incq %rax
	cmpq $4, %rax
	jb .LB10684
	jmp .LB10685
	.text
	.globl test_frealloc_pressure__0__ret_voidE1
	.def test_frealloc_pressure__0__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
test_frealloc_pressure__0__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $240, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
	movq %r13, -40(%rbp)
.LB10837:
	movups .LZERO(%rip), %xmm15
	movups %xmm15, -56(%rbp)
	leaq -114(%rbp), %rsi
	movl $1713384749, -114(%rbp)
	movl $1818322290, -110(%rbp)
	movl $543387500, -106(%rbp)
	movl $1936028272, -102(%rbp)
	movl $1701999987, -98(%rbp)
	movl $808527904, -94(%rbp)
	movl $1914712112, -90(%rbp)
	movl $1868852833, -86(%rbp)
	movl $1919361133, -82(%rbp)
	movl $1932490607, -78(%rbp)
	movl $1852404328, -74(%rbp)
	movl $2036539499, -70(%rbp)
	movl $1936026723, -66(%rbp)
	movl $757932073, -62(%rbp)
	movw $10, -58(%rbp)
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	callq standard__random__get_entropy__0__ret_dataE1_ubits64
	movq %rax, %rsi
	callq standard__random__get_entropy__0__ret_dataE1_ubits64
	movq %rax, %r8
	leaq -56(%rbp), %rcx
	movq %rsi, %rdx
	callq standard__random__pcg32_seed__3__PCG32E1_ptr1__dataE1_ubits64__dataE1_ubits64__ret_voidE1
	movl $64, %ecx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	leaq -150(%rbp), %rdx
	movq %rax, %rsi
	xorl %eax, %eax
	movl $1953066601, -150(%rbp)
	testq %rsi, %rsi
	movl $543973737, -146(%rbp)
	movl $1869376609, -142(%rbp)
	movl $1868963939, -138(%rbp)
	setne %al
	movl $1919295602, -134(%rbp)
	movl $1819042149, -130(%rbp)
	movl $1881170799, -126(%rbp)
	movzbl %al, %ecx
	movl $1936942450, -122(%rbp)
	movl $6648437, -118(%rbp)
	callq check__2__boolE1__byteE1_ptr1__ret_voidE1
	movl $16, %eax
	xorl %ecx, %ecx
.LB11938:
	testq %rax, %rax
	je .LB11940
.LB11939:
	movb $90, (%rsi,%rcx,1)
	movb $90, 1(%rsi,%rcx,1)
	movb $90, 2(%rsi,%rcx,1)
	movb $90, 3(%rsi,%rcx,1)
	addq $4, %rcx
	decq %rax
	jne .LB11939
.LB11940:
.LB10959:
	cmpq $64, %rcx
	jae .LB10961
.LB10960:
	movb $90, (%rsi,%rcx,1)
	incq %rcx
	cmpq $64, %rcx
	jb .LB10960
.LB10961:
	xorl %edi, %edi
	movl $64, %ebx
	movl $1, %r12d
.LB10971:
	cmpq $1000, %rdi
	jb .LB10972
.LB11944:
.LB10973:
	leaq -206(%rbp), %rdx
	movzbl %r12b, %ecx
	movl $808464433, -206(%rbp)
	movl $1701996064, -202(%rbp)
	movl $1869376609, -198(%rbp)
	movl $1919361123, -194(%rbp)
	movl $1932490607, -190(%rbp)
	movl $1852404328, -186(%rbp)
	movl $2036539499, -182(%rbp)
	movl $1936026723, -178(%rbp)
	movl $1633951802, -174(%rbp)
	movl $1629512052, -170(%rbp)
	movl $2036430700, -166(%rbp)
	movl $1919950963, -162(%rbp)
	movl $1919251301, -158(%rbp)
	movl $6579574, -154(%rbp)
	callq check__2__boolE1__byteE1_ptr1__ret_voidE1
	movq %rsi, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	movq -40(%rbp), %r13
	leave
	ret
.LB10972:
	leaq -56(%rbp), %rcx
	callq standard__random__pcg32_next__1__PCG32E1_ptr1__ret_dataE1_ubits32
	andq $8191, %rax
	leaq 1(%rax), %r13
	cmpq %rbx, %r13
	cmovb %r13, %rbx
	movq %rsi, %rcx
	movq %r13, %rdx
	callq standard__memory__allocators__stdheap__frealloc__2__dataE1_ubits64__dataE1_ubits64__ret_dataE1_ubits64
	testq %rax, %rax
	je .LB10999
.LB11000:
	xorl %ecx, %ecx
.LB11005:
	cmpq %rbx, %rcx
	jb .LB11006
.LB11945:
.LB11007:
	testb %r12b, %r12b
	je .LB11025
.LB11026:
	xorl %ecx, %ecx
	testq %r13, %r13
	cmova %r13, %rcx
	shrq $2, %rcx
	xorl %edx, %edx
.LB11941:
	testq %rcx, %rcx
	je .LB11943
.LB11942:
	movb $90, (%rax,%rdx,1)
	movb $90, 1(%rax,%rdx,1)
	movb $90, 2(%rax,%rdx,1)
	movb $90, 3(%rax,%rdx,1)
	addq $4, %rdx
	decq %rcx
	jne .LB11942
	jmp .LB11943
.LB11006:
	movslq %ecx, %rdx
	cmpb $90, (%rax,%rdx,1)
	jne .LB11018
.LB11019:
	incq %rcx
	cmpq %rbx, %rcx
	jb .LB11006
	jmp .LB11945
.LB11018:
	xorl %r12d, %r12d
	testb %r12b, %r12b
	je .LB11025
	jmp .LB11026
.LB11943:
.LB11029:
	cmpq %r13, %rdx
	jae .LB11031
.LB11030:
	movb $90, (%rax,%rdx,1)
	incq %rdx
	cmpq %r13, %rdx
	jb .LB11030
.LB11031:
	incq %rdi
	movq %rax, %rsi
	movq %r13, %rbx
	cmpq $1000, %rdi
	jb .LB10972
	jmp .LB11944
.LB11025:
	jmp .LB10973
.LB10999:
	xorl %r12d, %r12d
	jmp .LB10973
	.text
	.globl test_slab_exhaustion_recovery__0__ret_voidE1
	.def test_slab_exhaustion_recovery__0__ret_voidE1;
	.scl 2;
	.type 32;
	.endef
test_slab_exhaustion_recovery__0__ret_voidE1:
	pushq %rbp
	movq %rsp, %rbp
	subq $2272, %rsp
	movq %rbx, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdi, -24(%rbp)
	movq %r12, -32(%rbp)
.LB11105:
	leaq -2080(%rbp), %rax
	movq %rax, %rdi
	xorl %eax, %eax
	movl $2048, %ecx
	rep stosb
	leaq -2116(%rbp), %rsi
	movl $1931488557, -2116(%rbp)
	movl $543318380, -2112(%rbp)
	movl $1634236517, -2108(%rbp)
	movl $1769239413, -2104(%rbp)
	movl $1629515375, -2100(%rbp)
	movl $1914725486, -2096(%rbp)
	movl $1987011429, -2092(%rbp)
	movl $544830053, -2088(%rbp)
	movl $666925, -2084(%rbp)
	movq %rsi, %rcx
	callq standard__strings__strlen__1__byteE1_ptr1__ret_intE1
	movl %eax, %edx
	movq %rsi, %rcx
	callq standard__io__console__out_write__2__byteE1_ptr1__intE1__ret_voidE1
	xorl %eax, %eax
	movl $1, %esi
.LB11157:
	cmpq $393216, %rax
	jae .LB11159
.LB11163:
	testb %sil, %sil
	je .LB11159
.LB11158:
	xorl %edi, %edi
	movq %rax, %rbx
.LB11168:
	cmpq $256, %rdi
	jb .LB11174
.LB11946:
.LB11170:
	xorl %r12d, %r12d
.LB11199:
	cmpq %rdi, %r12
	jae .LB11201
.LB11200:
	movslq %r12d, %rax
	movq -2080(%rbp,%rax,8), %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	incq %r12
	cmpq %rdi, %r12
	jb .LB11200
	jmp .LB11201
.LB11159:
	leaq -2158(%rbp), %rdx
	movzbl %sil, %ecx
	movl $541216054, -2158(%rbp)
	movl $1650551923, -2154(%rbp)
	movl $1752720672, -2150(%rbp)
	movl $1953723745, -2146(%rbp)
	movl $980316009, -2142(%rbp)
	movl $1819042080, -2138(%rbp)
	movl $1819042080, -2134(%rbp)
	movl $544433007, -2130(%rbp)
	movl $1667462515, -2126(%rbp)
	movl $1701078373, -2122(%rbp)
	movw $100, -2118(%rbp)
	callq check__2__boolE1__byteE1_ptr1__ret_voidE1
	callq standard__memory__allocators__stdheap__coalesce_heap__0__ret_voidE1
	leaq -2194(%rbp), %rdx
	movl $1818324835, -2194(%rbp)
	movl $1701016421, -2190(%rbp)
	movl $1952866592, -2186(%rbp)
	movl $1696625253, -2182(%rbp)
	movl $1969318008, -2178(%rbp)
	movl $1869182067, -2174(%rbp)
	movl $1847605870, -2170(%rbp)
	movl $1919098991, -2166(%rbp)
	movl $6845281, -2162(%rbp)
	movl $1, %ecx
	callq check__2__boolE1__byteE1_ptr1__ret_voidE1
	movl $64, %ecx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	leaq -2235(%rbp), %rdx
	movq %rax, %rsi
	xorl %eax, %eax
	movl $1869376609, -2235(%rbp)
	testq %rsi, %rsi
	movl $1717641315, -2231(%rbp)
	movl $544367988, -2227(%rbp)
	movl $1634236517, -2223(%rbp)
	setne %al
	movl $1769239413, -2219(%rbp)
	movl $1663790703, -2215(%rbp)
	movl $1701601647, -2211(%rbp)
	movzbl %al, %ecx
	movl $543515507, -2207(%rbp)
	movl $1667462515, -2203(%rbp)
	movl $1935959397, -2199(%rbp)
	movb $0, -2195(%rbp)
	callq check__2__boolE1__byteE1_ptr1__ret_voidE1
	movq %rsi, %rcx
	callq standard__memory__allocators__stdheap__ffree__1__dataE1_ubits64__ret_voidE1
	movq -8(%rbp), %rbx
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -32(%rbp), %r12
	leave
	ret
.LB11174:
	cmpq $393216, %rbx
	jb .LB11169
.LB11947:
	jmp .LB11170
.LB11169:
	movl $16, %ecx
	callq standard__memory__allocators__stdheap__fmalloc__1__dataE1_ubits64__ret_dataE1_ubits64
	movq %rax, -2080(%rbp,%rdi,8)
	movslq %edi, %rax
	cmpq $0, -2080(%rbp,%rax,8)
	je .LB11190
.LB11191:
	incq %rdi
	incq %rbx
	cmpq $256, %rdi
	jb .LB11174
	jmp .LB11946
.LB11190:
	xorl %esi, %esi
	jmp .LB11170
.LB11201:
	movq %rbx, %rax
	cmpq $393216, %rax
	jb .LB11163
	jmp .LB11159
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
standard__time__TIME_NS_PER_US:
	.quad 1000
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
	.p2align 4
global_rng:
	.zero 16
	.bss
	.p2align 0
global_rng_initialized:
	.zero 1
	.bss
	.p2align 2
g_pass:
	.zero 4
	.bss
	.p2align 2
g_fail:
	.zero 4
	.section .rdata,"dr"
	.p2align 4
.LZERO:
	.zero 512
