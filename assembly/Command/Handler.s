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
	.globl	is_busy
	.align 4
	.type	is_busy, @object
	.size	is_busy, 4
is_busy:
	.zero	4
	.text
	.globl	get_command_index
	.type	get_command_index, @function
get_command_index:
.LFB6:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi
	mov	DWORD PTR -4[rbp], 0
	jmp	.L2
.L5:
	mov	eax, DWORD PTR -4[rbp]
	movsx	rdx, eax
	mov	rax, rdx
	sal	rax, 2
	add	rax, rdx
	sal	rax, 3
	mov	rdx, rax
	lea	rax, commands[rip]
	mov	rax, QWORD PTR [rdx+rax]
	mov	rdx, QWORD PTR -24[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	strcmp@PLT
	test	eax, eax
	jne	.L3
	mov	eax, DWORD PTR -4[rbp]
	jmp	.L4
.L3:
	add	DWORD PTR -4[rbp], 1
.L2:
	mov	eax, 4
	cmp	DWORD PTR -4[rbp], eax
	jl	.L5
	mov	eax, -1
.L4:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	get_command_index, .-get_command_index
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
	sub	rsp, 48
	mov	QWORD PTR -40[rbp], rdi
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	mov	rax, QWORD PTR -40[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	DWORD PTR -28[rbp], 1
	mov	eax, DWORD PTR -28[rbp]
	xchg	eax, DWORD PTR is_busy[rip]
	mov	rax, QWORD PTR -16[rbp]
	mov	rcx, QWORD PTR [rax]
	mov	rax, QWORD PTR -16[rbp]
	mov	rdx, QWORD PTR 16[rax]
	mov	rax, QWORD PTR -16[rbp]
	mov	eax, DWORD PTR 8[rax]
	mov	rsi, rdx
	mov	edi, eax
	call	rcx
	mov	DWORD PTR -20[rbp], 0
	jmp	.L7
.L8:
	mov	rax, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	edx, DWORD PTR -20[rbp]
	movsx	rdx, edx
	sal	rdx, 3
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	free@PLT
	add	DWORD PTR -20[rbp], 1
.L7:
	mov	rax, QWORD PTR -16[rbp]
	mov	eax, DWORD PTR 8[rax]
	cmp	DWORD PTR -20[rbp], eax
	jl	.L8
	mov	rax, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR 16[rax]
	mov	rdi, rax
	call	free@PLT
	mov	rax, QWORD PTR -16[rbp]
	mov	rdi, rax
	call	free@PLT
	mov	DWORD PTR -24[rbp], 0
	mov	eax, DWORD PTR -24[rbp]
	xchg	eax, DWORD PTR is_busy[rip]
	mov	eax, 0
	mov	rdx, QWORD PTR -8[rbp]
	sub	rdx, QWORD PTR fs:40
	je	.L10
	call	__stack_chk_fail@PLT
.L10:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	wrapper, .-wrapper
	.section	.rodata
.LC0:
	.string	"Description: %s\n"
.LC1:
	.string	"Usage:       %s\n"
.LC2:
	.string	"Unknown Command: '%s'\n"
.LC3:
	.string	"Available Commands:"
.LC4:
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
	jle	.L12
	mov	DWORD PTR -8[rbp], 0
	jmp	.L13
.L16:
	mov	eax, DWORD PTR -8[rbp]
	movsx	rdx, eax
	mov	rax, rdx
	sal	rax, 2
	add	rax, rdx
	sal	rax, 3
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
	jne	.L14
	mov	eax, DWORD PTR -8[rbp]
	movsx	rdx, eax
	mov	rax, rdx
	sal	rax, 2
	add	rax, rdx
	sal	rax, 3
	mov	rdx, rax
	lea	rax, commands[rip+8]
	mov	rax, QWORD PTR [rdx+rax]
	mov	rsi, rax
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, DWORD PTR -8[rbp]
	movsx	rdx, eax
	mov	rax, rdx
	sal	rax, 2
	add	rax, rdx
	sal	rax, 3
	mov	rdx, rax
	lea	rax, commands[rip+16]
	mov	rax, QWORD PTR [rdx+rax]
	mov	rsi, rax
	lea	rax, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	lea	rax, mutex[rip]
	mov	rdi, rax
	call	pthread_mutex_unlock@PLT
	jmp	.L11
.L14:
	add	DWORD PTR -8[rbp], 1
.L13:
	mov	eax, 4
	cmp	DWORD PTR -8[rbp], eax
	jl	.L16
	mov	rax, QWORD PTR -32[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	rsi, rax
	lea	rax, .LC2[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	jmp	.L17
.L12:
	lea	rax, .LC3[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	DWORD PTR -4[rbp], 0
	jmp	.L18
.L19:
	mov	eax, DWORD PTR -4[rbp]
	movsx	rdx, eax
	mov	rax, rdx
	sal	rax, 2
	add	rax, rdx
	sal	rax, 3
	mov	rdx, rax
	lea	rax, commands[rip+8]
	mov	rcx, QWORD PTR [rdx+rax]
	mov	eax, DWORD PTR -4[rbp]
	movsx	rdx, eax
	mov	rax, rdx
	sal	rax, 2
	add	rax, rdx
	sal	rax, 3
	mov	rdx, rax
	lea	rax, commands[rip]
	mov	rax, QWORD PTR [rdx+rax]
	mov	rdx, rcx
	mov	rsi, rax
	lea	rax, .LC4[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	add	DWORD PTR -4[rbp], 1
.L18:
	mov	eax, 4
	cmp	DWORD PTR -4[rbp], eax
	jl	.L19
.L17:
	mov	rax, QWORD PTR stdout[rip]
	mov	rdi, rax
	call	fflush@PLT
	lea	rax, mutex[rip]
	mov	rdi, rax
	call	pthread_mutex_unlock@PLT
.L11:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	cmd_help, .-cmd_help
	.section	.rodata
.LC5:
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
	lea	rax, .LC5[rip]
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
.LC6:
	.string	"ping"
	.align 8
.LC7:
	.string	"Error: Invalid characters in hostname."
.LC8:
	.string	"ping -c 4 %s"
.LC9:
	.string	"r"
.LC10:
	.string	"Failed to run ping."
.LC11:
	.string	"[%s] %s"
	.text
	.globl	cmd_ping
	.type	cmd_ping, @function
cmd_ping:
.LFB10:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 560
	mov	DWORD PTR -548[rbp], edi
	mov	QWORD PTR -560[rbp], rsi
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	lea	rax, .LC6[rip]
	mov	rdi, rax
	call	get_command_index
	mov	DWORD PTR -540[rbp], eax
	cmp	DWORD PTR -548[rbp], 1
	jg	.L22
	lea	rax, mutex[rip]
	mov	rdi, rax
	call	pthread_mutex_lock@PLT
	mov	eax, DWORD PTR -540[rbp]
	movsx	rdx, eax
	mov	rax, rdx
	sal	rax, 2
	add	rax, rdx
	sal	rax, 3
	mov	rdx, rax
	lea	rax, commands[rip+16]
	mov	rax, QWORD PTR [rdx+rax]
	mov	rdi, rax
	call	puts@PLT
	lea	rax, mutex[rip]
	mov	rdi, rax
	call	pthread_mutex_unlock@PLT
	jmp	.L21
.L22:
	mov	rax, QWORD PTR -560[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	is_safe_hostname@PLT
	test	eax, eax
	jne	.L24
	lea	rax, mutex[rip]
	mov	rdi, rax
	call	pthread_mutex_lock@PLT
	lea	rax, .LC7[rip]
	mov	rdi, rax
	call	puts@PLT
	lea	rax, mutex[rip]
	mov	rdi, rax
	call	pthread_mutex_unlock@PLT
	jmp	.L21
.L24:
	mov	rax, QWORD PTR -560[rbp]
	add	rax, 8
	mov	rdx, QWORD PTR [rax]
	lea	rax, -528[rbp]
	mov	rcx, rdx
	lea	rdx, .LC8[rip]
	mov	esi, 256
	mov	rdi, rax
	mov	eax, 0
	call	snprintf@PLT
	lea	rax, -528[rbp]
	lea	rdx, .LC9[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	popen@PLT
	mov	QWORD PTR -536[rbp], rax
	cmp	QWORD PTR -536[rbp], 0
	jne	.L26
	lea	rax, mutex[rip]
	mov	rdi, rax
	call	pthread_mutex_lock@PLT
	lea	rax, .LC10[rip]
	mov	rdi, rax
	call	puts@PLT
	lea	rax, mutex[rip]
	mov	rdi, rax
	call	pthread_mutex_unlock@PLT
	jmp	.L21
.L27:
	lea	rax, mutex[rip]
	mov	rdi, rax
	call	pthread_mutex_lock@PLT
	mov	rax, QWORD PTR -560[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rdx, -272[rbp]
	mov	rsi, rax
	lea	rax, .LC11[rip]
	mov	rdi, rax
	mov	eax, 0
	call	print_with_timestamp@PLT
	mov	rax, QWORD PTR stdout[rip]
	mov	rdi, rax
	call	fflush@PLT
	lea	rax, mutex[rip]
	mov	rdi, rax
	call	pthread_mutex_unlock@PLT
.L26:
	mov	rdx, QWORD PTR -536[rbp]
	lea	rax, -272[rbp]
	mov	esi, 256
	mov	rdi, rax
	call	fgets@PLT
	test	rax, rax
	jne	.L27
	mov	rax, QWORD PTR -536[rbp]
	mov	rdi, rax
	call	pclose@PLT
.L21:
	mov	rax, QWORD PTR -8[rbp]
	sub	rax, QWORD PTR fs:40
	je	.L29
	call	__stack_chk_fail@PLT
.L29:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	cmd_ping, .-cmd_ping
	.section	.rodata
	.align 8
.LC12:
	.string	"\r\033[KShutting down in %d seconds"
	.text
	.globl	cmd_exit
	.type	cmd_exit, @function
cmd_exit:
.LFB11:
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
	jmp	.L31
.L34:
	mov	eax, DWORD PTR -8[rbp]
	mov	esi, eax
	lea	rax, .LC12[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	DWORD PTR -4[rbp], 0
	jmp	.L32
.L33:
	mov	edi, 46
	call	putchar@PLT
	mov	rax, QWORD PTR stdout[rip]
	mov	rdi, rax
	call	fflush@PLT
	mov	edi, 1
	call	sleep@PLT
	add	DWORD PTR -4[rbp], 1
.L32:
	cmp	DWORD PTR -4[rbp], 2
	jle	.L33
	sub	DWORD PTR -8[rbp], 1
.L31:
	cmp	DWORD PTR -8[rbp], 0
	jg	.L34
	lea	rax, .LC5[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	edi, 0
	call	exit@PLT
	.cfi_endproc
.LFE11:
	.size	cmd_exit, .-cmd_exit
	.globl	commands
	.section	.rodata
.LC13:
	.string	"help"
	.align 8
.LC14:
	.string	"Displays list of Commands Available"
.LC15:
	.string	"help | help <command>"
.LC16:
	.string	"clear"
.LC17:
	.string	"Clear the Terminal Screen"
.LC18:
	.string	"Pings a host"
	.align 8
.LC19:
	.string	"ping <hostname> | e.g ping 127.0.0.1 or ping www.google.com"
.LC20:
	.string	"exit"
.LC21:
	.string	"Exits the Application"
	.section	.data.rel.local,"aw"
	.align 32
	.type	commands, @object
	.size	commands, 160
commands:
	.quad	.LC13
	.quad	.LC14
	.quad	.LC15
	.quad	cmd_help
	.long	1
	.zero	4
	.quad	.LC16
	.quad	.LC17
	.quad	.LC16
	.quad	cmd_clear
	.long	0
	.zero	4
	.quad	.LC6
	.quad	.LC18
	.quad	.LC19
	.quad	cmd_ping
	.long	1
	.zero	4
	.quad	.LC20
	.quad	.LC21
	.quad	.LC20
	.quad	cmd_exit
	.long	0
	.zero	4
	.globl	commands_count
	.section	.rodata
	.align 4
	.type	commands_count, @object
	.size	commands_count, 4
commands_count:
	.long	4
.LC22:
	.string	" \n"
	.align 8
.LC23:
	.string	"Unknown command: '%s'. Type 'help'.\n"
	.text
	.globl	handle
	.type	handle, @function
handle:
.LFB12:
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
	call	StringToLower@PLT
	mov	edi, 80
	call	malloc@PLT
	mov	QWORD PTR -40[rbp], rax
	mov	DWORD PTR -68[rbp], 0
	mov	rax, QWORD PTR -88[rbp]
	lea	rdx, .LC22[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	strtok@PLT
	mov	QWORD PTR -48[rbp], rax
	jmp	.L36
.L38:
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
	lea	rax, .LC22[rip]
	mov	rsi, rax
	mov	edi, 0
	call	strtok@PLT
	mov	QWORD PTR -48[rbp], rax
.L36:
	cmp	QWORD PTR -48[rbp], 0
	je	.L37
	cmp	DWORD PTR -68[rbp], 9
	jle	.L38
.L37:
	cmp	DWORD PTR -68[rbp], 0
	jne	.L39
	mov	rax, QWORD PTR -40[rbp]
	mov	rdi, rax
	call	free@PLT
	jmp	.L35
.L39:
	mov	rax, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	get_command_index
	mov	DWORD PTR -60[rbp], eax
	cmp	DWORD PTR -60[rbp], -1
	je	.L41
	mov	eax, DWORD PTR -60[rbp]
	movsx	rdx, eax
	mov	rax, rdx
	sal	rax, 2
	add	rax, rdx
	sal	rax, 3
	mov	rdx, rax
	lea	rax, commands[rip+32]
	mov	eax, DWORD PTR [rdx+rax]
	test	eax, eax
	je	.L42
	mov	edi, 24
	call	malloc@PLT
	mov	QWORD PTR -32[rbp], rax
	mov	eax, DWORD PTR -60[rbp]
	movsx	rdx, eax
	mov	rax, rdx
	sal	rax, 2
	add	rax, rdx
	sal	rax, 3
	mov	rdx, rax
	lea	rax, commands[rip+24]
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
	jmp	.L35
.L42:
	mov	eax, DWORD PTR -60[rbp]
	movsx	rdx, eax
	mov	rax, rdx
	sal	rax, 2
	add	rax, rdx
	sal	rax, 3
	mov	rdx, rax
	lea	rax, commands[rip+24]
	mov	rcx, QWORD PTR [rdx+rax]
	mov	rdx, QWORD PTR -40[rbp]
	mov	eax, DWORD PTR -68[rbp]
	mov	rsi, rdx
	mov	edi, eax
	call	rcx
	mov	DWORD PTR -64[rbp], 0
	jmp	.L44
.L45:
	mov	eax, DWORD PTR -64[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR -40[rbp]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	free@PLT
	add	DWORD PTR -64[rbp], 1
.L44:
	mov	eax, DWORD PTR -64[rbp]
	cmp	eax, DWORD PTR -68[rbp]
	jl	.L45
	mov	rax, QWORD PTR -40[rbp]
	mov	rdi, rax
	call	free@PLT
	jmp	.L35
.L41:
	mov	rax, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR [rax]
	mov	rsi, rax
	lea	rax, .LC23[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
.L35:
	mov	rax, QWORD PTR -24[rbp]
	sub	rax, QWORD PTR fs:40
	je	.L46
	call	__stack_chk_fail@PLT
.L46:
	mov	rbx, QWORD PTR -8[rbp]
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
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
