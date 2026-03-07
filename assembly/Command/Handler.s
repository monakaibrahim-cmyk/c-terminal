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
	.section	.rodata
	.align 8
.LC0:
	.string	"DEBUG: Rejected char at index %d: '%c' (ASCII %d)\n"
	.text
	.globl	is_safe_hostname
	.type	is_safe_hostname, @function
is_safe_hostname:
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
	cmp	QWORD PTR -24[rbp], 0
	je	.L5
	mov	rax, QWORD PTR -24[rbp]
	movzx	eax, BYTE PTR [rax]
	test	al, al
	jne	.L6
.L5:
	mov	eax, 0
	jmp	.L7
.L6:
	mov	DWORD PTR -4[rbp], 0
	jmp	.L8
.L10:
	call	__ctype_b_loc@PLT
	mov	rax, QWORD PTR [rax]
	mov	edx, DWORD PTR -4[rbp]
	movsx	rcx, edx
	mov	rdx, QWORD PTR -24[rbp]
	add	rdx, rcx
	movzx	edx, BYTE PTR [rdx]
	movzx	edx, dl
	add	rdx, rdx
	add	rax, rdx
	movzx	eax, WORD PTR [rax]
	movzx	eax, ax
	and	eax, 8
	test	eax, eax
	jne	.L9
	mov	eax, DWORD PTR -4[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	cmp	al, 46
	je	.L9
	mov	eax, DWORD PTR -4[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	cmp	al, 45
	je	.L9
	mov	eax, DWORD PTR -4[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	movsx	ecx, al
	mov	eax, DWORD PTR -4[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	movsx	edx, al
	mov	eax, DWORD PTR -4[rbp]
	mov	esi, eax
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, 0
	jmp	.L7
.L9:
	add	DWORD PTR -4[rbp], 1
.L8:
	mov	eax, DWORD PTR -4[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	test	al, al
	jne	.L10
	mov	eax, 1
.L7:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	is_safe_hostname, .-is_safe_hostname
	.globl	wrapper
	.type	wrapper, @function
wrapper:
.LFB8:
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
	jmp	.L12
.L13:
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
.L12:
	mov	rax, QWORD PTR -16[rbp]
	mov	eax, DWORD PTR 8[rax]
	cmp	DWORD PTR -20[rbp], eax
	jl	.L13
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
	je	.L15
	call	__stack_chk_fail@PLT
.L15:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	wrapper, .-wrapper
	.section	.rodata
.LC1:
	.string	"Description: %s\n"
.LC2:
	.string	"Usage:       %s\n"
.LC3:
	.string	"Unknown Command: '%s'\n"
.LC4:
	.string	"Available Commands:"
.LC5:
	.string	"  %-10s - %s\n"
	.text
	.globl	cmd_help
	.type	cmd_help, @function
cmd_help:
.LFB9:
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
	jle	.L17
	mov	DWORD PTR -8[rbp], 0
	jmp	.L18
.L21:
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
	jne	.L19
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
	lea	rax, .LC1[rip]
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
	lea	rax, .LC2[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	lea	rax, mutex[rip]
	mov	rdi, rax
	call	pthread_mutex_unlock@PLT
	jmp	.L16
.L19:
	add	DWORD PTR -8[rbp], 1
.L18:
	mov	eax, DWORD PTR commands_count[rip]
	cmp	DWORD PTR -8[rbp], eax
	jl	.L21
	mov	rax, QWORD PTR -32[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	rsi, rax
	lea	rax, .LC3[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	jmp	.L22
.L17:
	lea	rax, .LC4[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	DWORD PTR -4[rbp], 0
	jmp	.L23
.L24:
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
	lea	rax, .LC5[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	add	DWORD PTR -4[rbp], 1
.L23:
	mov	eax, DWORD PTR commands_count[rip]
	cmp	DWORD PTR -4[rbp], eax
	jl	.L24
.L22:
	mov	rax, QWORD PTR stdout[rip]
	mov	rdi, rax
	call	fflush@PLT
	lea	rax, mutex[rip]
	mov	rdi, rax
	call	pthread_mutex_unlock@PLT
.L16:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	cmd_help, .-cmd_help
	.section	.rodata
.LC6:
	.string	"\033[H\033[J"
	.text
	.globl	cmd_clear
	.type	cmd_clear, @function
cmd_clear:
.LFB10:
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
	lea	rax, .LC6[rip]
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
.LFE10:
	.size	cmd_clear, .-cmd_clear
	.section	.rodata
.LC7:
	.string	"Usage: ping <hostname>"
	.align 8
.LC8:
	.string	"Error: Invalid characters in hostname."
.LC9:
	.string	"ping -c 4 %s"
.LC10:
	.string	"r"
.LC11:
	.string	"Failed to run ping."
.LC12:
	.string	"[%s] %s"
	.text
	.globl	cmd_ping
	.type	cmd_ping, @function
cmd_ping:
.LFB11:
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
	cmp	DWORD PTR -548[rbp], 1
	jg	.L27
	lea	rax, mutex[rip]
	mov	rdi, rax
	call	pthread_mutex_lock@PLT
	lea	rax, .LC7[rip]
	mov	rdi, rax
	call	puts@PLT
	lea	rax, mutex[rip]
	mov	rdi, rax
	call	pthread_mutex_unlock@PLT
	jmp	.L26
.L27:
	mov	rax, QWORD PTR -560[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	is_safe_hostname
	test	eax, eax
	jne	.L29
	lea	rax, mutex[rip]
	mov	rdi, rax
	call	pthread_mutex_lock@PLT
	lea	rax, .LC8[rip]
	mov	rdi, rax
	call	puts@PLT
	lea	rax, mutex[rip]
	mov	rdi, rax
	call	pthread_mutex_unlock@PLT
	jmp	.L26
.L29:
	mov	rax, QWORD PTR -560[rbp]
	add	rax, 8
	mov	rdx, QWORD PTR [rax]
	lea	rax, -528[rbp]
	mov	rcx, rdx
	lea	rdx, .LC9[rip]
	mov	esi, 256
	mov	rdi, rax
	mov	eax, 0
	call	snprintf@PLT
	lea	rax, -528[rbp]
	lea	rdx, .LC10[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	popen@PLT
	mov	QWORD PTR -536[rbp], rax
	cmp	QWORD PTR -536[rbp], 0
	jne	.L31
	lea	rax, mutex[rip]
	mov	rdi, rax
	call	pthread_mutex_lock@PLT
	lea	rax, .LC11[rip]
	mov	rdi, rax
	call	puts@PLT
	lea	rax, mutex[rip]
	mov	rdi, rax
	call	pthread_mutex_unlock@PLT
	jmp	.L26
.L32:
	lea	rax, mutex[rip]
	mov	rdi, rax
	call	pthread_mutex_lock@PLT
	mov	rax, QWORD PTR -560[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rdx, -272[rbp]
	mov	rsi, rax
	lea	rax, .LC12[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	rax, QWORD PTR stdout[rip]
	mov	rdi, rax
	call	fflush@PLT
	lea	rax, mutex[rip]
	mov	rdi, rax
	call	pthread_mutex_unlock@PLT
.L31:
	mov	rdx, QWORD PTR -536[rbp]
	lea	rax, -272[rbp]
	mov	esi, 256
	mov	rdi, rax
	call	fgets@PLT
	test	rax, rax
	jne	.L32
	mov	rax, QWORD PTR -536[rbp]
	mov	rdi, rax
	call	pclose@PLT
.L26:
	mov	rax, QWORD PTR -8[rbp]
	sub	rax, QWORD PTR fs:40
	je	.L34
	call	__stack_chk_fail@PLT
.L34:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	cmd_ping, .-cmd_ping
	.section	.rodata
	.align 8
.LC13:
	.string	"\r\033[KShutting down in %d seconds"
	.text
	.globl	cmd_exit
	.type	cmd_exit, @function
cmd_exit:
.LFB12:
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
	jmp	.L36
.L39:
	mov	eax, DWORD PTR -8[rbp]
	mov	esi, eax
	lea	rax, .LC13[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	DWORD PTR -4[rbp], 0
	jmp	.L37
.L38:
	mov	edi, 46
	call	putchar@PLT
	mov	rax, QWORD PTR stdout[rip]
	mov	rdi, rax
	call	fflush@PLT
	mov	edi, 1
	call	sleep@PLT
	add	DWORD PTR -4[rbp], 1
.L37:
	cmp	DWORD PTR -4[rbp], 2
	jle	.L38
	sub	DWORD PTR -8[rbp], 1
.L36:
	cmp	DWORD PTR -8[rbp], 0
	jg	.L39
	lea	rax, .LC6[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	edi, 0
	call	exit@PLT
	.cfi_endproc
.LFE12:
	.size	cmd_exit, .-cmd_exit
	.globl	commands
	.section	.rodata
.LC14:
	.string	"help"
	.align 8
.LC15:
	.string	"Displays list of Commands Available"
.LC16:
	.string	"help | help <command>"
.LC17:
	.string	"clear"
.LC18:
	.string	"Clear the Terminal Screen"
.LC19:
	.string	"ping"
.LC20:
	.string	"Pings a host"
	.align 8
.LC21:
	.string	"ping <hostname> | e.g ping 127.0.0.1 or ping www.google.com"
.LC22:
	.string	"exit"
.LC23:
	.string	"Exits the Application"
	.section	.data.rel.local,"aw"
	.align 32
	.type	commands, @object
	.size	commands, 160
commands:
	.quad	.LC14
	.quad	.LC15
	.quad	.LC16
	.quad	cmd_help
	.long	1
	.zero	4
	.quad	.LC17
	.quad	.LC18
	.quad	.LC17
	.quad	cmd_clear
	.long	0
	.zero	4
	.quad	.LC19
	.quad	.LC20
	.quad	.LC21
	.quad	cmd_ping
	.long	1
	.zero	4
	.quad	.LC22
	.quad	.LC23
	.quad	.LC22
	.quad	cmd_exit
	.long	0
	.zero	4
	.globl	commands_count
	.data
	.align 4
	.type	commands_count, @object
	.size	commands_count, 4
commands_count:
	.long	4
	.section	.rodata
.LC24:
	.string	" \n"
	.align 8
.LC25:
	.string	"Unknown command: '%s'. Type 'help'.\n"
	.text
	.globl	handle
	.type	handle, @function
handle:
.LFB13:
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
	lea	rdx, .LC24[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	strtok@PLT
	mov	QWORD PTR -48[rbp], rax
	jmp	.L41
.L43:
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
	lea	rax, .LC24[rip]
	mov	rsi, rax
	mov	edi, 0
	call	strtok@PLT
	mov	QWORD PTR -48[rbp], rax
.L41:
	cmp	QWORD PTR -48[rbp], 0
	je	.L42
	cmp	DWORD PTR -68[rbp], 9
	jle	.L43
.L42:
	cmp	DWORD PTR -68[rbp], 0
	jne	.L44
	mov	rax, QWORD PTR -40[rbp]
	mov	rdi, rax
	call	free@PLT
	jmp	.L40
.L44:
	mov	DWORD PTR -64[rbp], 0
	jmp	.L46
.L52:
	mov	eax, DWORD PTR -64[rbp]
	movsx	rdx, eax
	mov	rax, rdx
	sal	rax, 2
	add	rax, rdx
	sal	rax, 3
	mov	rdx, rax
	lea	rax, commands[rip]
	mov	rdx, QWORD PTR [rdx+rax]
	mov	rax, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR [rax]
	mov	rsi, rdx
	mov	rdi, rax
	call	strcmp@PLT
	test	eax, eax
	jne	.L47
	mov	eax, DWORD PTR -64[rbp]
	movsx	rdx, eax
	mov	rax, rdx
	sal	rax, 2
	add	rax, rdx
	sal	rax, 3
	mov	rdx, rax
	lea	rax, commands[rip+32]
	mov	eax, DWORD PTR [rdx+rax]
	test	eax, eax
	je	.L48
	mov	edi, 24
	call	malloc@PLT
	mov	QWORD PTR -32[rbp], rax
	mov	eax, DWORD PTR -64[rbp]
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
	jmp	.L40
.L48:
	mov	eax, DWORD PTR -64[rbp]
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
	mov	DWORD PTR -60[rbp], 0
	jmp	.L50
.L51:
	mov	eax, DWORD PTR -60[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR -40[rbp]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	free@PLT
	add	DWORD PTR -60[rbp], 1
.L50:
	mov	eax, DWORD PTR -60[rbp]
	cmp	eax, DWORD PTR -68[rbp]
	jl	.L51
	mov	rax, QWORD PTR -40[rbp]
	mov	rdi, rax
	call	free@PLT
	jmp	.L40
.L47:
	add	DWORD PTR -64[rbp], 1
.L46:
	mov	eax, DWORD PTR commands_count[rip]
	cmp	DWORD PTR -64[rbp], eax
	jl	.L52
	mov	rax, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR [rax]
	mov	rsi, rax
	lea	rax, .LC25[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
.L40:
	mov	rax, QWORD PTR -24[rbp]
	sub	rax, QWORD PTR fs:40
	je	.L53
	call	__stack_chk_fail@PLT
.L53:
	mov	rbx, QWORD PTR -8[rbp]
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
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
