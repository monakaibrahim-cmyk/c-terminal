	.file	"Handler.c"
	.intel_syntax noprefix
	.text
	.def	printf;	.scl	3;	.type	32;	.endef
	.seh_proc	printf
printf:
	push	rbp
	.seh_pushreg	rbp
	push	rbx
	.seh_pushreg	rbx
	sub	rsp, 56
	.seh_stackalloc	56
	lea	rbp, 48[rsp]
	.seh_setframe	rbp, 48
	.seh_endprologue
	mov	QWORD PTR 32[rbp], rcx
	mov	QWORD PTR 40[rbp], rdx
	mov	QWORD PTR 48[rbp], r8
	mov	QWORD PTR 56[rbp], r9
	lea	rax, 40[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	rbx, QWORD PTR -16[rbp]
	mov	ecx, 1
	mov	rax, QWORD PTR __imp___acrt_iob_func[rip]
	call	rax
	mov	rcx, rax
	mov	rax, QWORD PTR 32[rbp]
	mov	r8, rbx
	mov	rdx, rax
	call	__mingw_vfprintf
	mov	DWORD PTR -4[rbp], eax
	mov	eax, DWORD PTR -4[rbp]
	add	rsp, 56
	pop	rbx
	pop	rbp
	ret
	.seh_endproc
	.globl	is_busy
	.bss
	.align 4
is_busy:
	.space 4
	.globl	cs
	.align 32
cs:
	.space 40
	.text
	.globl	get_command_index
	.def	get_command_index;	.scl	2;	.type	32;	.endef
	.seh_proc	get_command_index
get_command_index:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 48
	.seh_stackalloc	48
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	DWORD PTR -4[rbp], 0
	jmp	.L4
.L7:
	mov	eax, DWORD PTR -4[rbp]
	movsx	rdx, eax
	mov	rax, rdx
	sal	rax, 2
	add	rax, rdx
	sal	rax, 3
	mov	rdx, rax
	lea	rax, commands[rip]
	mov	rax, QWORD PTR [rdx+rax]
	mov	rdx, QWORD PTR 16[rbp]
	mov	rcx, rax
	call	strcmp
	test	eax, eax
	jne	.L5
	mov	eax, DWORD PTR -4[rbp]
	jmp	.L6
.L5:
	add	DWORD PTR -4[rbp], 1
.L4:
	mov	eax, 3
	cmp	DWORD PTR -4[rbp], eax
	jl	.L7
	mov	eax, -1
.L6:
	add	rsp, 48
	pop	rbp
	ret
	.seh_endproc
	.globl	wrapper
	.def	wrapper;	.scl	2;	.type	32;	.endef
	.seh_proc	wrapper
wrapper:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	DWORD PTR -24[rbp], 1
	mov	eax, DWORD PTR -24[rbp]
	xchg	eax, DWORD PTR is_busy[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	r8, QWORD PTR [rax]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, QWORD PTR 16[rax]
	mov	rax, QWORD PTR -16[rbp]
	mov	eax, DWORD PTR 8[rax]
	mov	ecx, eax
	call	r8
	mov	DWORD PTR -4[rbp], 0
	jmp	.L9
.L10:
	mov	rax, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	edx, DWORD PTR -4[rbp]
	movsx	rdx, edx
	sal	rdx, 3
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	mov	rcx, rax
	call	free
	add	DWORD PTR -4[rbp], 1
.L9:
	mov	rax, QWORD PTR -16[rbp]
	mov	eax, DWORD PTR 8[rax]
	cmp	DWORD PTR -4[rbp], eax
	jl	.L10
	mov	rax, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	rcx, rax
	call	free
	mov	rax, QWORD PTR -16[rbp]
	mov	rcx, rax
	call	free
	mov	DWORD PTR -20[rbp], 0
	mov	eax, DWORD PTR -20[rbp]
	xchg	eax, DWORD PTR is_busy[rip]
	mov	eax, 0
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC0:
	.ascii "cls\0"
	.text
	.globl	cmd_clear
	.def	cmd_clear;	.scl	2;	.type	32;	.endef
	.seh_proc	cmd_clear
cmd_clear:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 32
	.seh_stackalloc	32
	.seh_endprologue
	mov	DWORD PTR 16[rbp], ecx
	mov	QWORD PTR 24[rbp], rdx
	lea	rax, .LC0[rip]
	mov	rcx, rax
	call	system
	nop
	add	rsp, 32
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC1:
	.ascii "command -v tree > /dev/null 2>&1\0"
.LC2:
	.ascii "r\0"
.LC3:
	.ascii "%s\0"
.LC4:
	.ascii ".\0"
.LC5:
	.ascii "%s\12\0"
.LC6:
	.ascii "\0"
.LC7:
	.ascii "\12%d directories, %d files\12\0"
	.text
	.globl	cmd_tree
	.def	cmd_tree;	.scl	2;	.type	32;	.endef
	.seh_proc	cmd_tree
cmd_tree:
	push	rbp
	.seh_pushreg	rbp
	push	rdi
	.seh_pushreg	rdi
	sub	rsp, 856
	.seh_stackalloc	856
	lea	rbp, 128[rsp]
	.seh_setframe	rbp, 128
	.seh_endprologue
	mov	DWORD PTR 752[rbp], ecx
	mov	QWORD PTR 760[rbp], rdx
	lea	rax, .LC1[rip]
	mov	rcx, rax
	call	system
	test	eax, eax
	jne	.L14
	movabs	rax, 139140100724
	mov	edx, 0
	mov	QWORD PTR 176[rbp], rax
	mov	QWORD PTR 184[rbp], rdx
	lea	rdx, 192[rbp]
	mov	eax, 0
	mov	ecx, 62
	mov	rdi, rdx
	rep stosq
	cmp	DWORD PTR 752[rbp], 1
	jle	.L15
	mov	rax, QWORD PTR 760[rbp]
	add	rax, 8
	mov	rdx, QWORD PTR [rax]
	lea	rax, 176[rbp]
	mov	r8d, 500
	mov	rcx, rax
	call	strncat
	jmp	.L16
.L15:
	lea	rax, 176[rbp]
	mov	rcx, rax
	call	strlen
	mov	rdx, rax
	lea	rax, 176[rbp]
	add	rax, rdx
	mov	WORD PTR [rax], 46
.L16:
	lea	rax, 176[rbp]
	lea	rdx, .LC2[rip]
	mov	rcx, rax
	mov	rax, QWORD PTR __imp__popen[rip]
	call	rax
	mov	QWORD PTR 712[rbp], rax
	cmp	QWORD PTR 712[rbp], 0
	je	.L14
	jmp	.L18
.L19:
	lea	rax, -80[rbp]
	mov	rdx, rax
	lea	rax, .LC3[rip]
	mov	rcx, rax
	call	printf
.L18:
	mov	rdx, QWORD PTR 712[rbp]
	lea	rax, -80[rbp]
	mov	r8, rdx
	mov	edx, 256
	mov	rcx, rax
	call	fgets
	test	rax, rax
	jne	.L19
	mov	rax, QWORD PTR 712[rbp]
	mov	rcx, rax
	mov	rax, QWORD PTR __imp__pclose[rip]
	call	rax
	jmp	.L13
.L14:
	cmp	DWORD PTR 752[rbp], 1
	jle	.L21
	mov	rax, QWORD PTR 760[rbp]
	mov	rax, QWORD PTR 8[rax]
	jmp	.L22
.L21:
	lea	rax, .LC4[rip]
.L22:
	mov	QWORD PTR 704[rbp], rax
	mov	DWORD PTR 700[rbp], 0
	mov	DWORD PTR 696[rbp], 0
	mov	rax, QWORD PTR 704[rbp]
	mov	rdx, rax
	lea	rax, .LC5[rip]
	mov	rcx, rax
	call	printf
	lea	rcx, 700[rbp]
	mov	rax, QWORD PTR 704[rbp]
	lea	rdx, 696[rbp]
	mov	QWORD PTR 32[rsp], rdx
	mov	r9, rcx
	mov	r8d, 1
	lea	rdx, .LC6[rip]
	mov	rcx, rax
	call	list_dir
	mov	edx, DWORD PTR 700[rbp]
	mov	eax, DWORD PTR 696[rbp]
	mov	r8d, edx
	mov	edx, eax
	lea	rax, .LC7[rip]
	mov	rcx, rax
	call	printf
	mov	ecx, 1
	mov	rax, QWORD PTR __imp___acrt_iob_func[rip]
	call	rax
	mov	rcx, rax
	call	fflush
	nop
.L13:
	add	rsp, 856
	pop	rdi
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC8:
	.ascii "\15\33[KShutting down in %d seconds\0"
	.text
	.globl	cmd_exit
	.def	cmd_exit;	.scl	2;	.type	32;	.endef
	.seh_proc	cmd_exit
cmd_exit:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 48
	.seh_stackalloc	48
	.seh_endprologue
	mov	DWORD PTR 16[rbp], ecx
	mov	QWORD PTR 24[rbp], rdx
	mov	DWORD PTR -4[rbp], 5
	jmp	.L24
.L27:
	mov	eax, DWORD PTR -4[rbp]
	mov	edx, eax
	lea	rax, .LC8[rip]
	mov	rcx, rax
	call	printf
	mov	DWORD PTR -8[rbp], 0
	jmp	.L25
.L26:
	lea	rax, .LC4[rip]
	mov	rcx, rax
	call	printf
	mov	ecx, 1
	mov	rax, QWORD PTR __imp___acrt_iob_func[rip]
	call	rax
	mov	rcx, rax
	call	fflush
	mov	ecx, 1000
	mov	rax, QWORD PTR __imp_Sleep[rip]
	call	rax
	add	DWORD PTR -8[rbp], 1
.L25:
	cmp	DWORD PTR -8[rbp], 2
	jle	.L26
	sub	DWORD PTR -4[rbp], 1
.L24:
	cmp	DWORD PTR -4[rbp], 0
	jg	.L27
	lea	rax, .LC0[rip]
	mov	rcx, rax
	call	system
	mov	ecx, 0
	call	exit
	nop
	.seh_endproc
	.globl	commands
	.section .rdata,"dr"
.LC9:
	.ascii "clear\0"
.LC10:
	.ascii "Clear the Terminal Screen\0"
.LC11:
	.ascii "tree\0"
	.align 8
.LC12:
	.ascii "List directory contents in a tree structure\0"
.LC13:
	.ascii "tree [directory]\0"
.LC14:
	.ascii "exit\0"
.LC15:
	.ascii "Exits the Application\0"
	.data
	.align 32
commands:
	.quad	.LC9
	.quad	.LC10
	.quad	.LC9
	.quad	cmd_clear
	.long	0
	.space 4
	.quad	.LC11
	.quad	.LC12
	.quad	.LC13
	.quad	cmd_tree
	.long	1
	.space 4
	.quad	.LC14
	.quad	.LC15
	.quad	.LC14
	.quad	cmd_exit
	.long	0
	.space 4
	.globl	commands_count
	.section .rdata,"dr"
	.align 4
commands_count:
	.long	3
.LC16:
	.ascii " \12\0"
.LC17:
	.ascii "Unknown command: '%s'.\12\0"
	.text
	.globl	handle
	.def	handle;	.scl	2;	.type	32;	.endef
	.seh_proc	handle
handle:
	push	rbp
	.seh_pushreg	rbp
	push	rbx
	.seh_pushreg	rbx
	sub	rsp, 104
	.seh_stackalloc	104
	lea	rbp, 96[rsp]
	.seh_setframe	rbp, 96
	.seh_endprologue
	mov	QWORD PTR 32[rbp], rcx
	mov	rax, QWORD PTR 32[rbp]
	mov	rcx, rax
	call	StringToLower
	mov	ecx, 80
	call	malloc
	mov	QWORD PTR -32[rbp], rax
	mov	DWORD PTR -4[rbp], 0
	mov	rax, QWORD PTR 32[rbp]
	lea	rdx, .LC16[rip]
	mov	rcx, rax
	call	strtok
	mov	QWORD PTR -16[rbp], rax
	jmp	.L29
.L31:
	mov	eax, DWORD PTR -4[rbp]
	lea	edx, 1[rax]
	mov	DWORD PTR -4[rbp], edx
	cdqe
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR -32[rbp]
	lea	rbx, [rdx+rax]
	mov	rax, QWORD PTR -16[rbp]
	mov	rcx, rax
	call	strdup
	mov	QWORD PTR [rbx], rax
	lea	rax, .LC16[rip]
	mov	rdx, rax
	mov	ecx, 0
	call	strtok
	mov	QWORD PTR -16[rbp], rax
.L29:
	cmp	QWORD PTR -16[rbp], 0
	je	.L30
	cmp	DWORD PTR -4[rbp], 9
	jle	.L31
.L30:
	cmp	DWORD PTR -4[rbp], 0
	jne	.L32
	mov	rax, QWORD PTR -32[rbp]
	mov	rcx, rax
	call	free
	jmp	.L28
.L32:
	mov	rax, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR [rax]
	mov	rcx, rax
	call	get_command_index
	mov	DWORD PTR -36[rbp], eax
	cmp	DWORD PTR -36[rbp], -1
	je	.L34
	mov	eax, DWORD PTR -36[rbp]
	movsx	rdx, eax
	mov	rax, rdx
	sal	rax, 2
	add	rax, rdx
	sal	rax, 3
	mov	rdx, rax
	lea	rax, commands[rip+32]
	mov	eax, DWORD PTR [rdx+rax]
	test	eax, eax
	je	.L35
	mov	ecx, 24
	call	malloc
	mov	QWORD PTR -48[rbp], rax
	mov	eax, DWORD PTR -36[rbp]
	movsx	rdx, eax
	mov	rax, rdx
	sal	rax, 2
	add	rax, rdx
	sal	rax, 3
	mov	rdx, rax
	lea	rax, commands[rip+24]
	mov	rdx, QWORD PTR [rdx+rax]
	mov	rax, QWORD PTR -48[rbp]
	mov	QWORD PTR [rax], rdx
	mov	rax, QWORD PTR -48[rbp]
	mov	edx, DWORD PTR -4[rbp]
	mov	DWORD PTR 8[rax], edx
	mov	rax, QWORD PTR -48[rbp]
	mov	rdx, QWORD PTR -32[rbp]
	mov	QWORD PTR 16[rax], rdx
	mov	rax, QWORD PTR -48[rbp]
	mov	QWORD PTR 40[rsp], 0
	mov	DWORD PTR 32[rsp], 0
	mov	r9, rax
	lea	r8, wrapper[rip]
	mov	edx, 0
	mov	ecx, 0
	mov	rax, QWORD PTR __imp__beginthreadex[rip]
	call	rax
	jmp	.L28
.L35:
	mov	eax, DWORD PTR -36[rbp]
	movsx	rdx, eax
	mov	rax, rdx
	sal	rax, 2
	add	rax, rdx
	sal	rax, 3
	mov	rdx, rax
	lea	rax, commands[rip+24]
	mov	r8, QWORD PTR [rdx+rax]
	mov	rdx, QWORD PTR -32[rbp]
	mov	eax, DWORD PTR -4[rbp]
	mov	ecx, eax
	call	r8
	mov	DWORD PTR -20[rbp], 0
	jmp	.L37
.L38:
	mov	eax, DWORD PTR -20[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR -32[rbp]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	mov	rcx, rax
	call	free
	add	DWORD PTR -20[rbp], 1
.L37:
	mov	eax, DWORD PTR -20[rbp]
	cmp	eax, DWORD PTR -4[rbp]
	jl	.L38
	mov	rax, QWORD PTR -32[rbp]
	mov	rcx, rax
	call	free
	jmp	.L28
.L34:
	mov	rax, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR [rax]
	mov	rdx, rax
	lea	rax, .LC17[rip]
	mov	rcx, rax
	call	printf
	nop
.L28:
	add	rsp, 104
	pop	rbx
	pop	rbp
	ret
	.seh_endproc
	.ident	"GCC: (GNU) 13-win32"
	.def	__mingw_vfprintf;	.scl	2;	.type	32;	.endef
	.def	strcmp;	.scl	2;	.type	32;	.endef
	.def	free;	.scl	2;	.type	32;	.endef
	.def	system;	.scl	2;	.type	32;	.endef
	.def	strncat;	.scl	2;	.type	32;	.endef
	.def	strlen;	.scl	2;	.type	32;	.endef
	.def	fgets;	.scl	2;	.type	32;	.endef
	.def	list_dir;	.scl	2;	.type	32;	.endef
	.def	fflush;	.scl	2;	.type	32;	.endef
	.def	exit;	.scl	2;	.type	32;	.endef
	.def	StringToLower;	.scl	2;	.type	32;	.endef
	.def	malloc;	.scl	2;	.type	32;	.endef
	.def	strtok;	.scl	2;	.type	32;	.endef
	.def	strdup;	.scl	2;	.type	32;	.endef
