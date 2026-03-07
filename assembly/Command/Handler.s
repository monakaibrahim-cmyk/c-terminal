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
	mov	eax, 6
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
	mov	eax, 6
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
	mov	eax, 6
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
	.string	";|&><$()"
	.align 8
.LC7:
	.string	"Error: Illegal character in arguments."
.LC8:
	.string	" "
.LC9:
	.string	"2>&1"
.LC10:
	.string	"r"
	.align 8
.LC11:
	.string	"Error: Could not execute curl."
.LC12:
	.string	"%s"
	.text
	.globl	cmd_curl
	.type	cmd_curl, @function
cmd_curl:
.LFB10:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 2608
	mov	DWORD PTR -2596[rbp], edi
	mov	QWORD PTR -2608[rbp], rsi
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	mov	rax, QWORD PTR -2608[rbp]
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	get_command_index
	mov	DWORD PTR -2588[rbp], eax
	cmp	DWORD PTR -2596[rbp], 1
	jg	.L22
	lea	rax, mutex[rip]
	mov	rdi, rax
	call	pthread_mutex_lock@PLT
	mov	eax, DWORD PTR -2588[rbp]
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
	movabs	rax, 139258393955
	mov	edx, 0
	mov	QWORD PTR -2064[rbp], rax
	mov	QWORD PTR -2056[rbp], rdx
	lea	rdx, -2048[rbp]
	mov	eax, 0
	mov	ecx, 254
	mov	rdi, rdx
	rep stosq
	mov	DWORD PTR -2592[rbp], 1
	jmp	.L24
.L26:
	mov	eax, DWORD PTR -2592[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR -2608[rbp]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC6[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	strpbrk@PLT
	test	rax, rax
	je	.L25
	lea	rax, mutex[rip]
	mov	rdi, rax
	call	pthread_mutex_lock@PLT
	lea	rax, .LC7[rip]
	mov	rdi, rax
	mov	eax, 0
	call	print_with_timestamp@PLT
	lea	rax, mutex[rip]
	mov	rdi, rax
	call	pthread_mutex_unlock@PLT
	jmp	.L21
.L25:
	lea	rax, -2064[rbp]
	mov	rdi, rax
	call	strlen@PLT
	mov	edx, 2047
	sub	rdx, rax
	mov	eax, DWORD PTR -2592[rbp]
	cdqe
	lea	rcx, 0[0+rax*8]
	mov	rax, QWORD PTR -2608[rbp]
	add	rax, rcx
	mov	rcx, QWORD PTR [rax]
	lea	rax, -2064[rbp]
	mov	rsi, rcx
	mov	rdi, rax
	call	strncat@PLT
	lea	rax, -2064[rbp]
	mov	rdi, rax
	call	strlen@PLT
	mov	edx, 2047
	sub	rdx, rax
	lea	rax, -2064[rbp]
	lea	rcx, .LC8[rip]
	mov	rsi, rcx
	mov	rdi, rax
	call	strncat@PLT
	add	DWORD PTR -2592[rbp], 1
.L24:
	mov	eax, DWORD PTR -2592[rbp]
	cmp	eax, DWORD PTR -2596[rbp]
	jl	.L26
	lea	rax, -2064[rbp]
	mov	rdi, rax
	call	strlen@PLT
	mov	edx, 2047
	sub	rdx, rax
	lea	rax, -2064[rbp]
	lea	rcx, .LC9[rip]
	mov	rsi, rcx
	mov	rdi, rax
	call	strncat@PLT
	lea	rax, -2064[rbp]
	lea	rdx, .LC10[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	popen@PLT
	mov	QWORD PTR -2584[rbp], rax
	cmp	QWORD PTR -2584[rbp], 0
	jne	.L28
	lea	rax, mutex[rip]
	mov	rdi, rax
	call	pthread_mutex_lock@PLT
	lea	rax, .LC11[rip]
	mov	rdi, rax
	mov	eax, 0
	call	print_with_timestamp@PLT
	lea	rax, mutex[rip]
	mov	rdi, rax
	call	pthread_mutex_unlock@PLT
	jmp	.L21
.L32:
	movzx	eax, BYTE PTR -2576[rbp]
	cmp	al, 42
	je	.L35
	movzx	eax, BYTE PTR -2576[rbp]
	cmp	al, 62
	je	.L35
	movzx	eax, BYTE PTR -2576[rbp]
	cmp	al, 60
	je	.L35
	lea	rax, mutex[rip]
	mov	rdi, rax
	call	pthread_mutex_lock@PLT
	lea	rax, -2576[rbp]
	mov	rsi, rax
	lea	rax, .LC12[rip]
	mov	rdi, rax
	mov	eax, 0
	call	print_with_timestamp@PLT
	mov	rax, QWORD PTR stdout[rip]
	mov	rdi, rax
	call	fflush@PLT
	lea	rax, mutex[rip]
	mov	rdi, rax
	call	pthread_mutex_unlock@PLT
	jmp	.L28
.L35:
	nop
.L28:
	mov	rdx, QWORD PTR -2584[rbp]
	lea	rax, -2576[rbp]
	mov	esi, 512
	mov	rdi, rax
	call	fgets@PLT
	test	rax, rax
	jne	.L32
	mov	rax, QWORD PTR -2584[rbp]
	mov	rdi, rax
	call	pclose@PLT
.L21:
	mov	rax, QWORD PTR -8[rbp]
	sub	rax, QWORD PTR fs:40
	je	.L34
	call	__stack_chk_fail@PLT
.L34:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	cmd_curl, .-cmd_curl
	.section	.rodata
	.align 8
.LC13:
	.string	"Error: Invalid characters in hostname."
.LC14:
	.string	"ping -c 4 %s"
.LC15:
	.string	"Failed to run ping."
.LC16:
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
	mov	rax, QWORD PTR -560[rbp]
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	get_command_index
	mov	DWORD PTR -540[rbp], eax
	cmp	DWORD PTR -548[rbp], 1
	jg	.L37
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
	jmp	.L36
.L37:
	mov	rax, QWORD PTR -560[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	is_safe_hostname@PLT
	test	eax, eax
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
	jmp	.L36
.L39:
	mov	rax, QWORD PTR -560[rbp]
	add	rax, 8
	mov	rdx, QWORD PTR [rax]
	lea	rax, -528[rbp]
	mov	rcx, rdx
	lea	rdx, .LC14[rip]
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
	jne	.L41
	lea	rax, mutex[rip]
	mov	rdi, rax
	call	pthread_mutex_lock@PLT
	lea	rax, .LC15[rip]
	mov	rdi, rax
	call	puts@PLT
	lea	rax, mutex[rip]
	mov	rdi, rax
	call	pthread_mutex_unlock@PLT
	jmp	.L36
.L42:
	lea	rax, mutex[rip]
	mov	rdi, rax
	call	pthread_mutex_lock@PLT
	mov	rax, QWORD PTR -560[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rdx, -272[rbp]
	mov	rsi, rax
	lea	rax, .LC16[rip]
	mov	rdi, rax
	mov	eax, 0
	call	print_with_timestamp@PLT
	mov	rax, QWORD PTR stdout[rip]
	mov	rdi, rax
	call	fflush@PLT
	lea	rax, mutex[rip]
	mov	rdi, rax
	call	pthread_mutex_unlock@PLT
.L41:
	mov	rdx, QWORD PTR -536[rbp]
	lea	rax, -272[rbp]
	mov	esi, 256
	mov	rdi, rax
	call	fgets@PLT
	test	rax, rax
	jne	.L42
	mov	rax, QWORD PTR -536[rbp]
	mov	rdi, rax
	call	pclose@PLT
.L36:
	mov	rax, QWORD PTR -8[rbp]
	sub	rax, QWORD PTR fs:40
	je	.L44
	call	__stack_chk_fail@PLT
.L44:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	cmd_ping, .-cmd_ping
	.section	.rodata
	.align 8
.LC17:
	.string	"command -v tree > /dev/null 2>&1"
.LC18:
	.string	"."
.LC19:
	.string	""
.LC20:
	.string	"\n%d directories, %d files\n"
	.text
	.globl	cmd_tree
	.type	cmd_tree, @function
cmd_tree:
.LFB12:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 832
	mov	DWORD PTR -820[rbp], edi
	mov	QWORD PTR -832[rbp], rsi
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	lea	rax, .LC17[rip]
	mov	rdi, rax
	call	system@PLT
	test	eax, eax
	jne	.L46
	movabs	rax, 139140100724
	mov	edx, 0
	mov	QWORD PTR -528[rbp], rax
	mov	QWORD PTR -520[rbp], rdx
	lea	rdx, -512[rbp]
	mov	eax, 0
	mov	ecx, 62
	mov	rdi, rdx
	rep stosq
	cmp	DWORD PTR -820[rbp], 1
	jle	.L47
	mov	rax, QWORD PTR -832[rbp]
	add	rax, 8
	mov	rcx, QWORD PTR [rax]
	lea	rax, -528[rbp]
	mov	edx, 500
	mov	rsi, rcx
	mov	rdi, rax
	call	strncat@PLT
	jmp	.L48
.L47:
	lea	rax, -528[rbp]
	mov	rdi, rax
	call	strlen@PLT
	mov	rdx, rax
	lea	rax, -528[rbp]
	add	rax, rdx
	mov	WORD PTR [rax], 46
.L48:
	lea	rax, -528[rbp]
	lea	rdx, .LC10[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	popen@PLT
	mov	QWORD PTR -800[rbp], rax
	cmp	QWORD PTR -800[rbp], 0
	je	.L46
	jmp	.L50
.L51:
	lea	rax, -784[rbp]
	mov	rsi, rax
	lea	rax, .LC12[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
.L50:
	mov	rdx, QWORD PTR -800[rbp]
	lea	rax, -784[rbp]
	mov	esi, 256
	mov	rdi, rax
	call	fgets@PLT
	test	rax, rax
	jne	.L51
	mov	rax, QWORD PTR -800[rbp]
	mov	rdi, rax
	call	pclose@PLT
	jmp	.L45
.L46:
	cmp	DWORD PTR -820[rbp], 1
	jle	.L53
	mov	rax, QWORD PTR -832[rbp]
	mov	rax, QWORD PTR 8[rax]
	jmp	.L54
.L53:
	lea	rax, .LC18[rip]
.L54:
	mov	QWORD PTR -792[rbp], rax
	mov	DWORD PTR -808[rbp], 0
	mov	DWORD PTR -804[rbp], 0
	mov	rax, QWORD PTR -792[rbp]
	mov	rdi, rax
	call	puts@PLT
	lea	rcx, -804[rbp]
	lea	rdx, -808[rbp]
	mov	rax, QWORD PTR -792[rbp]
	mov	r8, rcx
	mov	rcx, rdx
	mov	edx, 1
	lea	rsi, .LC19[rip]
	mov	rdi, rax
	call	list_dir@PLT
	mov	edx, DWORD PTR -808[rbp]
	mov	eax, DWORD PTR -804[rbp]
	mov	esi, eax
	lea	rax, .LC20[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	rax, QWORD PTR stdout[rip]
	mov	rdi, rax
	call	fflush@PLT
.L45:
	mov	rax, QWORD PTR -8[rbp]
	sub	rax, QWORD PTR fs:40
	je	.L55
	call	__stack_chk_fail@PLT
.L55:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	cmd_tree, .-cmd_tree
	.section	.rodata
	.align 8
.LC21:
	.string	"\r\033[KShutting down in %d seconds"
	.text
	.globl	cmd_exit
	.type	cmd_exit, @function
cmd_exit:
.LFB13:
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
	jmp	.L57
.L60:
	mov	eax, DWORD PTR -8[rbp]
	mov	esi, eax
	lea	rax, .LC21[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	DWORD PTR -4[rbp], 0
	jmp	.L58
.L59:
	mov	edi, 46
	call	putchar@PLT
	mov	rax, QWORD PTR stdout[rip]
	mov	rdi, rax
	call	fflush@PLT
	mov	edi, 1
	call	sleep@PLT
	add	DWORD PTR -4[rbp], 1
.L58:
	cmp	DWORD PTR -4[rbp], 2
	jle	.L59
	sub	DWORD PTR -8[rbp], 1
.L57:
	cmp	DWORD PTR -8[rbp], 0
	jg	.L60
	lea	rax, .LC5[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	edi, 0
	call	exit@PLT
	.cfi_endproc
.LFE13:
	.size	cmd_exit, .-cmd_exit
	.globl	commands
	.section	.rodata
.LC22:
	.string	"help"
	.align 8
.LC23:
	.string	"Displays list of Commands Available"
.LC24:
	.string	"help | help <command>"
.LC25:
	.string	"clear"
.LC26:
	.string	"Clear the Terminal Screen"
.LC27:
	.string	"curl"
.LC28:
	.string	"Sends HTTP requests"
	.align 8
.LC29:
	.string	"curl [options] <url> (e.g., curl -I https://google.com)"
.LC30:
	.string	"ping"
.LC31:
	.string	"Pings a host"
	.align 8
.LC32:
	.string	"ping <hostname> | e.g ping 127.0.0.1 or ping www.google.com"
.LC33:
	.string	"tree"
	.align 8
.LC34:
	.string	"List directory contents in a tree structure"
.LC35:
	.string	"tree [directory]"
.LC36:
	.string	"exit"
.LC37:
	.string	"Exits the Application"
	.section	.data.rel.local,"aw"
	.align 32
	.type	commands, @object
	.size	commands, 240
commands:
	.quad	.LC22
	.quad	.LC23
	.quad	.LC24
	.quad	cmd_help
	.long	1
	.zero	4
	.quad	.LC25
	.quad	.LC26
	.quad	.LC25
	.quad	cmd_clear
	.long	0
	.zero	4
	.quad	.LC27
	.quad	.LC28
	.quad	.LC29
	.quad	cmd_curl
	.long	1
	.zero	4
	.quad	.LC30
	.quad	.LC31
	.quad	.LC32
	.quad	cmd_ping
	.long	1
	.zero	4
	.quad	.LC33
	.quad	.LC34
	.quad	.LC35
	.quad	cmd_tree
	.long	1
	.zero	4
	.quad	.LC36
	.quad	.LC37
	.quad	.LC36
	.quad	cmd_exit
	.long	0
	.zero	4
	.globl	commands_count
	.section	.rodata
	.align 4
	.type	commands_count, @object
	.size	commands_count, 4
commands_count:
	.long	6
.LC38:
	.string	" \n"
	.align 8
.LC39:
	.string	"Unknown command: '%s'. Type 'help'.\n"
	.text
	.globl	handle
	.type	handle, @function
handle:
.LFB14:
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
	lea	rdx, .LC38[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	strtok@PLT
	mov	QWORD PTR -48[rbp], rax
	jmp	.L62
.L64:
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
	lea	rax, .LC38[rip]
	mov	rsi, rax
	mov	edi, 0
	call	strtok@PLT
	mov	QWORD PTR -48[rbp], rax
.L62:
	cmp	QWORD PTR -48[rbp], 0
	je	.L63
	cmp	DWORD PTR -68[rbp], 9
	jle	.L64
.L63:
	cmp	DWORD PTR -68[rbp], 0
	jne	.L65
	mov	rax, QWORD PTR -40[rbp]
	mov	rdi, rax
	call	free@PLT
	jmp	.L61
.L65:
	mov	rax, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	get_command_index
	mov	DWORD PTR -60[rbp], eax
	cmp	DWORD PTR -60[rbp], -1
	je	.L67
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
	je	.L68
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
	jmp	.L61
.L68:
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
	jmp	.L70
.L71:
	mov	eax, DWORD PTR -64[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR -40[rbp]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	free@PLT
	add	DWORD PTR -64[rbp], 1
.L70:
	mov	eax, DWORD PTR -64[rbp]
	cmp	eax, DWORD PTR -68[rbp]
	jl	.L71
	mov	rax, QWORD PTR -40[rbp]
	mov	rdi, rax
	call	free@PLT
	jmp	.L61
.L67:
	mov	rax, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR [rax]
	mov	rsi, rax
	lea	rax, .LC39[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
.L61:
	mov	rax, QWORD PTR -24[rbp]
	sub	rax, QWORD PTR fs:40
	je	.L72
	call	__stack_chk_fail@PLT
.L72:
	mov	rbx, QWORD PTR -8[rbp]
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE14:
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
