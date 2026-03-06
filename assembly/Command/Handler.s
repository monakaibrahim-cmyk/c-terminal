	.file	"Handler.c"
	.intel_syntax noprefix
	.text
	.globl	mutex
	.bss
	.align 32
	.type	mutex, @object
	.size	mutex, 40
mutex:
	.zero	40
	.text
	.globl	StringToLower
	.type	StringToLower, @function
StringToLower:
.LFB6:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 16
	mov	QWORD PTR -8[rbp], rdi
	jmp	.L2
.L3:
	mov	rax, QWORD PTR -8[rbp]
	movzx	eax, BYTE PTR [rax]
	movzx	eax, al
	mov	edi, eax
	call	tolower@PLT
	mov	edx, eax
	mov	rax, QWORD PTR -8[rbp]
	mov	BYTE PTR [rax], dl
	add	QWORD PTR -8[rbp], 1
.L2:
	mov	rax, QWORD PTR -8[rbp]
	movzx	eax, BYTE PTR [rax]
	test	al, al
	jne	.L3
	nop
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	StringToLower, .-StringToLower
	.globl	wrapper
	.type	wrapper, @function
wrapper:
.LFB7:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi
	mov	rax, QWORD PTR -24[rbp]
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, QWORD PTR [rax]
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, QWORD PTR 16[rax]
	mov	rax, QWORD PTR -8[rbp]
	mov	eax, DWORD PTR 8[rax]
	mov	rsi, rdx
	mov	edi, eax
	call	rcx
	mov	DWORD PTR -12[rbp], 0
	jmp	.L5
.L6:
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	edx, DWORD PTR -12[rbp]
	movsx	rdx, edx
	sal	rdx, 3
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	free@PLT
	add	DWORD PTR -12[rbp], 1
.L5:
	mov	rax, QWORD PTR -8[rbp]
	mov	eax, DWORD PTR 8[rax]
	cmp	DWORD PTR -12[rbp], eax
	jl	.L6
	mov	rax, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	rdi, rax
	call	free@PLT
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	free@PLT
	mov	eax, 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	wrapper, .-wrapper
	.section	.rodata
.LC0:
	.string	"Usage for '%s': %s\n"
.LC1:
	.string	"Unknown Command: '%s'\n"
.LC2:
	.string	"Available Commands:"
.LC3:
	.string	"  %-10s - %s\n"
	.text
	.globl	cmd_help
	.type	cmd_help, @function
cmd_help:
.LFB8:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32
	mov	DWORD PTR -20[rbp], edi
	mov	QWORD PTR -32[rbp], rsi
	lea	rax, mutex[rip]
	mov	rdi, rax
	call	pthread_mutex_lock@PLT
	cmp	DWORD PTR -20[rbp], 1
	jle	.L9
	mov	DWORD PTR -8[rbp], 0
	jmp	.L10
.L13:
	mov	eax, DWORD PTR -8[rbp]
	cdqe
	sal	rax, 5
	mov	rdx, rax
	lea	rax, commands[rip]
	mov	rdx, QWORD PTR [rdx+rax]
	mov	rax, QWORD PTR -32[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	rsi, rdx
	mov	rdi, rax
	call	strcmp@PLT
	test	eax, eax
	jne	.L11
	mov	eax, DWORD PTR -8[rbp]
	cdqe
	sal	rax, 5
	mov	rdx, rax
	lea	rax, commands[rip+8]
	mov	rdx, QWORD PTR [rdx+rax]
	mov	eax, DWORD PTR -8[rbp]
	cdqe
	sal	rax, 5
	mov	rcx, rax
	lea	rax, commands[rip]
	mov	rax, QWORD PTR [rcx+rax]
	mov	rsi, rax
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	lea	rax, mutex[rip]
	mov	rdi, rax
	call	pthread_mutex_unlock@PLT
	jmp	.L8
.L11:
	add	DWORD PTR -8[rbp], 1
.L10:
	mov	eax, DWORD PTR commands_count[rip]
	cmp	DWORD PTR -8[rbp], eax
	jl	.L13
	mov	rax, QWORD PTR -32[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	rsi, rax
	lea	rax, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	jmp	.L14
.L9:
	lea	rax, .LC2[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	DWORD PTR -4[rbp], 0
	jmp	.L15
.L16:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	sal	rax, 5
	mov	rdx, rax
	lea	rax, commands[rip+8]
	mov	rdx, QWORD PTR [rdx+rax]
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	sal	rax, 5
	mov	rcx, rax
	lea	rax, commands[rip]
	mov	rax, QWORD PTR [rcx+rax]
	mov	rsi, rax
	lea	rax, .LC3[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	add	DWORD PTR -4[rbp], 1
.L15:
	mov	eax, DWORD PTR commands_count[rip]
	cmp	DWORD PTR -4[rbp], eax
	jl	.L16
.L14:
	mov	rax, QWORD PTR stdout[rip]
	mov	rdi, rax
	call	fflush@PLT
	lea	rax, mutex[rip]
	mov	rdi, rax
	call	pthread_mutex_unlock@PLT
.L8:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	cmd_help, .-cmd_help
	.section	.rodata
.LC4:
	.string	"\033[H\033[J"
	.text
	.globl	cmd_clear
	.type	cmd_clear, @function
cmd_clear:
.LFB9:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 16
	mov	DWORD PTR -4[rbp], edi
	mov	QWORD PTR -16[rbp], rsi
	lea	rax, .LC4[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	rax, QWORD PTR stdout[rip]
	mov	rdi, rax
	call	fflush@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	cmd_clear, .-cmd_clear
	.section	.rodata
	.align 8
.LC5:
	.string	"\r\033[KShuttinig down in %d seconds"
	.text
	.globl	cmd_exit
	.type	cmd_exit, @function
cmd_exit:
.LFB10:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32
	mov	DWORD PTR -20[rbp], edi
	mov	QWORD PTR -32[rbp], rsi
	mov	DWORD PTR -8[rbp], 5
	jmp	.L19
.L22:
	mov	eax, DWORD PTR -8[rbp]
	mov	esi, eax
	lea	rax, .LC5[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	DWORD PTR -4[rbp], 0
	jmp	.L20
.L21:
	mov	edi, 46
	call	putchar@PLT
	mov	rax, QWORD PTR stdout[rip]
	mov	rdi, rax
	call	fflush@PLT
	mov	edi, 1
	call	sleep@PLT
	add	DWORD PTR -4[rbp], 1
.L20:
	cmp	DWORD PTR -4[rbp], 2
	jle	.L21
	sub	DWORD PTR -8[rbp], 1
.L19:
	cmp	DWORD PTR -8[rbp], 0
	jg	.L22
	lea	rax, .LC4[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	edi, 0
	call	exit@PLT
	.cfi_endproc
.LFE10:
	.size	cmd_exit, .-cmd_exit
	.globl	commands
	.section	.rodata
.LC6:
	.string	"help"
	.align 8
.LC7:
	.string	"Displays list of Commands Available"
.LC8:
	.string	"clear"
.LC9:
	.string	"Clear the Terminal Screen"
.LC10:
	.string	"exit"
.LC11:
	.string	"Exits the Application"
	.section	.data.rel.local,"aw"
	.align 32
	.type	commands, @object
	.size	commands, 96
commands:
	.quad	.LC6
	.quad	.LC7
	.quad	cmd_help
	.long	1
	.zero	4
	.quad	.LC8
	.quad	.LC9
	.quad	cmd_clear
	.long	0
	.zero	4
	.quad	.LC10
	.quad	.LC11
	.quad	cmd_exit
	.long	0
	.zero	4
	.globl	commands_count
	.data
	.align 4
	.type	commands_count, @object
	.size	commands_count, 4
commands_count:
	.long	3
	.section	.rodata
.LC12:
	.string	" \n"
	.align 8
.LC13:
	.string	"Unknown command: '%s'. Type 'help'.\n"
	.text
	.globl	handle
	.type	handle, @function
handle:
.LFB11:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	push	rbx
	sub	rsp, 88
	.cfi_offset 3, -24
	mov	QWORD PTR -88[rbp], rdi
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -24[rbp], rax
	xor	eax, eax
	mov	rax, QWORD PTR -88[rbp]
	mov	rdi, rax
	call	StringToLower
	mov	edi, 80
	call	malloc@PLT
	mov	QWORD PTR -40[rbp], rax
	mov	DWORD PTR -68[rbp], 0
	mov	rax, QWORD PTR -88[rbp]
	lea	rdx, .LC12[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	strtok@PLT
	mov	QWORD PTR -48[rbp], rax
	jmp	.L24
.L26:
	mov	eax, DWORD PTR -68[rbp]
	lea	edx, 1[rax]
	mov	DWORD PTR -68[rbp], edx
	cdqe
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR -40[rbp]
	lea	rbx, [rdx+rax]
	mov	rax, QWORD PTR -48[rbp]
	mov	rdi, rax
	call	strdup@PLT
	mov	QWORD PTR [rbx], rax
	lea	rax, .LC12[rip]
	mov	rsi, rax
	mov	edi, 0
	call	strtok@PLT
	mov	QWORD PTR -48[rbp], rax
.L24:
	cmp	QWORD PTR -48[rbp], 0
	je	.L25
	cmp	DWORD PTR -68[rbp], 9
	jle	.L26
.L25:
	cmp	DWORD PTR -68[rbp], 0
	jne	.L27
	mov	rax, QWORD PTR -40[rbp]
	mov	rdi, rax
	call	free@PLT
	jmp	.L23
.L27:
	mov	DWORD PTR -64[rbp], 0
	jmp	.L29
.L35:
	mov	eax, DWORD PTR -64[rbp]
	cdqe
	sal	rax, 5
	mov	rdx, rax
	lea	rax, commands[rip]
	mov	rdx, QWORD PTR [rdx+rax]
	mov	rax, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR [rax]
	mov	rsi, rdx
	mov	rdi, rax
	call	strcmp@PLT
	test	eax, eax
	jne	.L30
	mov	eax, DWORD PTR -64[rbp]
	cdqe
	sal	rax, 5
	mov	rdx, rax
	lea	rax, commands[rip+24]
	mov	eax, DWORD PTR [rdx+rax]
	test	eax, eax
	je	.L31
	mov	edi, 24
	call	malloc@PLT
	mov	QWORD PTR -32[rbp], rax
	mov	eax, DWORD PTR -64[rbp]
	cdqe
	sal	rax, 5
	mov	rdx, rax
	lea	rax, commands[rip+16]
	mov	rdx, QWORD PTR [rdx+rax]
	mov	rax, QWORD PTR -32[rbp]
	mov	QWORD PTR [rax], rdx
	mov	rax, QWORD PTR -32[rbp]
	mov	edx, DWORD PTR -68[rbp]
	mov	DWORD PTR 8[rax], edx
	mov	rax, QWORD PTR -32[rbp]
	mov	rdx, QWORD PTR -40[rbp]
	mov	QWORD PTR 16[rax], rdx
	mov	rdx, QWORD PTR -32[rbp]
	lea	rax, -56[rbp]
	mov	rcx, rdx
	lea	rdx, wrapper[rip]
	mov	esi, 0
	mov	rdi, rax
	call	pthread_create@PLT
	mov	rax, QWORD PTR -56[rbp]
	mov	rdi, rax
	call	pthread_detach@PLT
	jmp	.L23
.L31:
	mov	eax, DWORD PTR -64[rbp]
	cdqe
	sal	rax, 5
	mov	rdx, rax
	lea	rax, commands[rip+16]
	mov	rcx, QWORD PTR [rdx+rax]
	mov	rdx, QWORD PTR -40[rbp]
	mov	eax, DWORD PTR -68[rbp]
	mov	rsi, rdx
	mov	edi, eax
	call	rcx
	mov	DWORD PTR -60[rbp], 0
	jmp	.L33
.L34:
	mov	eax, DWORD PTR -60[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR -40[rbp]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	free@PLT
	add	DWORD PTR -60[rbp], 1
.L33:
	mov	eax, DWORD PTR -60[rbp]
	cmp	eax, DWORD PTR -68[rbp]
	jl	.L34
	mov	rax, QWORD PTR -40[rbp]
	mov	rdi, rax
	call	free@PLT
	jmp	.L23
.L30:
	add	DWORD PTR -64[rbp], 1
.L29:
	mov	eax, DWORD PTR commands_count[rip]
	cmp	DWORD PTR -64[rbp], eax
	jl	.L35
	mov	rax, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR [rax]
	mov	rsi, rax
	lea	rax, .LC13[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
.L23:
	mov	rax, QWORD PTR -24[rbp]
	sub	rax, QWORD PTR fs:40
	je	.L36
	call	__stack_chk_fail@PLT
.L36:
	mov	rbx, QWORD PTR -8[rbp]
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	handle, .-handle
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
