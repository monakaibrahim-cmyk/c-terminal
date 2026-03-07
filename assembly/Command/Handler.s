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
	.section	.rodata
.LC1:
	.string	"[%H:%M:%S] "
.LC2:
	.string	"%s"
	.text
	.globl	print_with_timestamp
	.type	print_with_timestamp, @function
print_with_timestamp:
.LFB8:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 272
	mov	QWORD PTR -264[rbp], rdi
	mov	QWORD PTR -168[rbp], rsi
	mov	QWORD PTR -160[rbp], rdx
	mov	QWORD PTR -152[rbp], rcx
	mov	QWORD PTR -144[rbp], r8
	mov	QWORD PTR -136[rbp], r9
	test	al, al
	je	.L12
	movaps	XMMWORD PTR -128[rbp], xmm0
	movaps	XMMWORD PTR -112[rbp], xmm1
	movaps	XMMWORD PTR -96[rbp], xmm2
	movaps	XMMWORD PTR -80[rbp], xmm3
	movaps	XMMWORD PTR -64[rbp], xmm4
	movaps	XMMWORD PTR -48[rbp], xmm5
	movaps	XMMWORD PTR -32[rbp], xmm6
	movaps	XMMWORD PTR -16[rbp], xmm7
.L12:
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -184[rbp], rax
	xor	eax, eax
	lea	rax, -248[rbp]
	mov	rdi, rax
	call	time@PLT
	lea	rax, -248[rbp]
	mov	rdi, rax
	call	localtime@PLT
	mov	QWORD PTR -240[rbp], rax
	mov	rdx, QWORD PTR -240[rbp]
	lea	rax, -208[rbp]
	mov	rcx, rdx
	lea	rdx, .LC1[rip]
	mov	esi, 20
	mov	rdi, rax
	call	strftime@PLT
	lea	rax, -208[rbp]
	mov	rsi, rax
	lea	rax, .LC2[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	DWORD PTR -232[rbp], 8
	mov	DWORD PTR -228[rbp], 48
	lea	rax, 16[rbp]
	mov	QWORD PTR -224[rbp], rax
	lea	rax, -176[rbp]
	mov	QWORD PTR -216[rbp], rax
	lea	rdx, -232[rbp]
	mov	rax, QWORD PTR -264[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	vprintf@PLT
	nop
	mov	rax, QWORD PTR -184[rbp]
	sub	rax, QWORD PTR fs:40
	je	.L13
	call	__stack_chk_fail@PLT
.L13:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	print_with_timestamp, .-print_with_timestamp
	.globl	get_command_index
	.type	get_command_index, @function
get_command_index:
.LFB9:
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
	jmp	.L15
.L18:
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
	jne	.L16
	mov	eax, DWORD PTR -4[rbp]
	jmp	.L17
.L16:
	add	DWORD PTR -4[rbp], 1
.L15:
	mov	eax, 4
	cmp	DWORD PTR -4[rbp], eax
	jl	.L18
	mov	eax, -1
.L17:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	get_command_index, .-get_command_index
	.globl	wrapper
	.type	wrapper, @function
wrapper:
.LFB10:
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
	jmp	.L20
.L21:
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
.L20:
	mov	rax, QWORD PTR -16[rbp]
	mov	eax, DWORD PTR 8[rax]
	cmp	DWORD PTR -20[rbp], eax
	jl	.L21
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
	je	.L23
	call	__stack_chk_fail@PLT
.L23:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	wrapper, .-wrapper
	.section	.rodata
.LC3:
	.string	"Description: %s\n"
.LC4:
	.string	"Usage:       %s\n"
.LC5:
	.string	"Unknown Command: '%s'\n"
.LC6:
	.string	"Available Commands:"
.LC7:
	.string	"  %-10s - %s\n"
	.text
	.globl	cmd_help
	.type	cmd_help, @function
cmd_help:
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
	lea	rax, mutex[rip]
	mov	rdi, rax
	call	pthread_mutex_lock@PLT
	cmp	DWORD PTR -20[rbp], 1
	jle	.L25
	mov	DWORD PTR -8[rbp], 0
	jmp	.L26
.L29:
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
	jne	.L27
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
	lea	rax, .LC3[rip]
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
	lea	rax, .LC4[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	lea	rax, mutex[rip]
	mov	rdi, rax
	call	pthread_mutex_unlock@PLT
	jmp	.L24
.L27:
	add	DWORD PTR -8[rbp], 1
.L26:
	mov	eax, 4
	cmp	DWORD PTR -8[rbp], eax
	jl	.L29
	mov	rax, QWORD PTR -32[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	rsi, rax
	lea	rax, .LC5[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	jmp	.L30
.L25:
	lea	rax, .LC6[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	DWORD PTR -4[rbp], 0
	jmp	.L31
.L32:
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
	lea	rax, .LC7[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	add	DWORD PTR -4[rbp], 1
.L31:
	mov	eax, 4
	cmp	DWORD PTR -4[rbp], eax
	jl	.L32
.L30:
	mov	rax, QWORD PTR stdout[rip]
	mov	rdi, rax
	call	fflush@PLT
	lea	rax, mutex[rip]
	mov	rdi, rax
	call	pthread_mutex_unlock@PLT
.L24:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	cmd_help, .-cmd_help
	.section	.rodata
.LC8:
	.string	"\033[H\033[J"
	.text
	.globl	cmd_clear
	.type	cmd_clear, @function
cmd_clear:
.LFB12:
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
	lea	rax, .LC8[rip]
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
.LFE12:
	.size	cmd_clear, .-cmd_clear
	.section	.rodata
.LC9:
	.string	"ping"
	.align 8
.LC10:
	.string	"Error: Invalid characters in hostname."
.LC11:
	.string	"ping -c 4 %s"
.LC12:
	.string	"r"
.LC13:
	.string	"Failed to run ping."
.LC14:
	.string	"[%s] %s"
	.text
	.globl	cmd_ping
	.type	cmd_ping, @function
cmd_ping:
.LFB13:
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
	lea	rax, .LC9[rip]
	mov	rdi, rax
	call	get_command_index
	mov	DWORD PTR -540[rbp], eax
	cmp	DWORD PTR -548[rbp], 1
	jg	.L35
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
	jmp	.L34
.L35:
	mov	rax, QWORD PTR -560[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	is_safe_hostname
	test	eax, eax
	jne	.L37
	lea	rax, mutex[rip]
	mov	rdi, rax
	call	pthread_mutex_lock@PLT
	lea	rax, .LC10[rip]
	mov	rdi, rax
	call	puts@PLT
	lea	rax, mutex[rip]
	mov	rdi, rax
	call	pthread_mutex_unlock@PLT
	jmp	.L34
.L37:
	mov	rax, QWORD PTR -560[rbp]
	add	rax, 8
	mov	rdx, QWORD PTR [rax]
	lea	rax, -528[rbp]
	mov	rcx, rdx
	lea	rdx, .LC11[rip]
	mov	esi, 256
	mov	rdi, rax
	mov	eax, 0
	call	snprintf@PLT
	lea	rax, -528[rbp]
	lea	rdx, .LC12[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	popen@PLT
	mov	QWORD PTR -536[rbp], rax
	cmp	QWORD PTR -536[rbp], 0
	jne	.L39
	lea	rax, mutex[rip]
	mov	rdi, rax
	call	pthread_mutex_lock@PLT
	lea	rax, .LC13[rip]
	mov	rdi, rax
	call	puts@PLT
	lea	rax, mutex[rip]
	mov	rdi, rax
	call	pthread_mutex_unlock@PLT
	jmp	.L34
.L40:
	lea	rax, mutex[rip]
	mov	rdi, rax
	call	pthread_mutex_lock@PLT
	mov	rax, QWORD PTR -560[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rdx, -272[rbp]
	mov	rsi, rax
	lea	rax, .LC14[rip]
	mov	rdi, rax
	mov	eax, 0
	call	print_with_timestamp
	mov	rax, QWORD PTR stdout[rip]
	mov	rdi, rax
	call	fflush@PLT
	lea	rax, mutex[rip]
	mov	rdi, rax
	call	pthread_mutex_unlock@PLT
.L39:
	mov	rdx, QWORD PTR -536[rbp]
	lea	rax, -272[rbp]
	mov	esi, 256
	mov	rdi, rax
	call	fgets@PLT
	test	rax, rax
	jne	.L40
	mov	rax, QWORD PTR -536[rbp]
	mov	rdi, rax
	call	pclose@PLT
.L34:
	mov	rax, QWORD PTR -8[rbp]
	sub	rax, QWORD PTR fs:40
	je	.L42
	call	__stack_chk_fail@PLT
.L42:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	cmd_ping, .-cmd_ping
	.section	.rodata
	.align 8
.LC15:
	.string	"\r\033[KShutting down in %d seconds"
	.text
	.globl	cmd_exit
	.type	cmd_exit, @function
cmd_exit:
.LFB14:
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
	jmp	.L44
.L47:
	mov	eax, DWORD PTR -8[rbp]
	mov	esi, eax
	lea	rax, .LC15[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	DWORD PTR -4[rbp], 0
	jmp	.L45
.L46:
	mov	edi, 46
	call	putchar@PLT
	mov	rax, QWORD PTR stdout[rip]
	mov	rdi, rax
	call	fflush@PLT
	mov	edi, 1
	call	sleep@PLT
	add	DWORD PTR -4[rbp], 1
.L45:
	cmp	DWORD PTR -4[rbp], 2
	jle	.L46
	sub	DWORD PTR -8[rbp], 1
.L44:
	cmp	DWORD PTR -8[rbp], 0
	jg	.L47
	lea	rax, .LC8[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	edi, 0
	call	exit@PLT
	.cfi_endproc
.LFE14:
	.size	cmd_exit, .-cmd_exit
	.globl	commands
	.section	.rodata
.LC16:
	.string	"help"
	.align 8
.LC17:
	.string	"Displays list of Commands Available"
.LC18:
	.string	"help | help <command>"
.LC19:
	.string	"clear"
.LC20:
	.string	"Clear the Terminal Screen"
.LC21:
	.string	"Pings a host"
	.align 8
.LC22:
	.string	"ping <hostname> | e.g ping 127.0.0.1 or ping www.google.com"
.LC23:
	.string	"exit"
.LC24:
	.string	"Exits the Application"
	.section	.data.rel.local,"aw"
	.align 32
	.type	commands, @object
	.size	commands, 160
commands:
	.quad	.LC16
	.quad	.LC17
	.quad	.LC18
	.quad	cmd_help
	.long	1
	.zero	4
	.quad	.LC19
	.quad	.LC20
	.quad	.LC19
	.quad	cmd_clear
	.long	0
	.zero	4
	.quad	.LC9
	.quad	.LC21
	.quad	.LC22
	.quad	cmd_ping
	.long	1
	.zero	4
	.quad	.LC23
	.quad	.LC24
	.quad	.LC23
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
.LC25:
	.string	" \n"
	.align 8
.LC26:
	.string	"Unknown command: '%s'. Type 'help'.\n"
	.text
	.globl	handle
	.type	handle, @function
handle:
.LFB15:
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
	lea	rdx, .LC25[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	strtok@PLT
	mov	QWORD PTR -48[rbp], rax
	jmp	.L49
.L51:
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
	lea	rax, .LC25[rip]
	mov	rsi, rax
	mov	edi, 0
	call	strtok@PLT
	mov	QWORD PTR -48[rbp], rax
.L49:
	cmp	QWORD PTR -48[rbp], 0
	je	.L50
	cmp	DWORD PTR -68[rbp], 9
	jle	.L51
.L50:
	cmp	DWORD PTR -68[rbp], 0
	jne	.L52
	mov	rax, QWORD PTR -40[rbp]
	mov	rdi, rax
	call	free@PLT
	jmp	.L48
.L52:
	mov	rax, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	get_command_index
	mov	DWORD PTR -60[rbp], eax
	cmp	DWORD PTR -60[rbp], -1
	je	.L54
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
	je	.L55
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
	jmp	.L48
.L55:
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
	jmp	.L57
.L58:
	mov	eax, DWORD PTR -64[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR -40[rbp]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	free@PLT
	add	DWORD PTR -64[rbp], 1
.L57:
	mov	eax, DWORD PTR -64[rbp]
	cmp	eax, DWORD PTR -68[rbp]
	jl	.L58
	mov	rax, QWORD PTR -40[rbp]
	mov	rdi, rax
	call	free@PLT
	jmp	.L48
.L54:
	mov	rax, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR [rax]
	mov	rsi, rax
	lea	rax, .LC26[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
.L48:
	mov	rax, QWORD PTR -24[rbp]
	sub	rax, QWORD PTR fs:40
	je	.L59
	call	__stack_chk_fail@PLT
.L59:
	mov	rbx, QWORD PTR -8[rbp]
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE15:
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
