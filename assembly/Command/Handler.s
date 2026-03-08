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
	mov	eax, 6
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
	.ascii "\12\0"
.LC1:
	.ascii "Description: %s\12\0"
.LC2:
	.ascii "Usage:       %s\12\0"
.LC3:
	.ascii "ping\0"
	.align 8
.LC4:
	.ascii "\11\11-t : Pings the specified host continuously until stopped. \12\11\11-l <size> : Specifies the size, in bytes, of the echo request packet to send, from 32 to 65,527 bytes. The default size is 32 bytes.\12\11\11-a : Resolves the hostname of an IP address target, if possible.\12\11\11-f : Prevents ICMP Echo Requests from being fragmented by routers between the source and destination (IPv4 only).\12\11\11-i <TTL> : Sets the Time to Live (TTL) value for the packets, with a maximum of 255.\12\11\11-w <timeout> : Adjusts the timeout in milliseconds for each reply. The default is 4,000 milliseconds (4 seconds).\12\11\11-4 : Forces the use of IPv4.\12\11\11-6 : Forces the use of IPv6.\12\11\11/? : Displays detailed help and syntax information about the command options in the command prompt.\12\0"
.LC5:
	.ascii "Unknown Command: '%s'\12\0"
.LC6:
	.ascii "Available Commands:\12\0"
.LC7:
	.ascii "\11\33[32m%-10s\33[0m - %s\12\0"
	.text
	.globl	cmd_help
	.def	cmd_help;	.scl	2;	.type	32;	.endef
	.seh_proc	cmd_help
cmd_help:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 48
	.seh_stackalloc	48
	.seh_endprologue
	mov	DWORD PTR 16[rbp], ecx
	mov	QWORD PTR 24[rbp], rdx
	cmp	DWORD PTR 16[rbp], 1
	jle	.L13
	lea	rax, .LC0[rip]
	mov	rcx, rax
	call	printf
	mov	DWORD PTR -4[rbp], 0
	jmp	.L14
.L18:
	mov	eax, DWORD PTR -4[rbp]
	movsx	rdx, eax
	mov	rax, rdx
	sal	rax, 2
	add	rax, rdx
	sal	rax, 3
	mov	rdx, rax
	lea	rax, commands[rip]
	mov	rdx, QWORD PTR [rdx+rax]
	mov	rax, QWORD PTR 24[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	rcx, rax
	call	strcmp
	test	eax, eax
	jne	.L15
	mov	eax, DWORD PTR -4[rbp]
	movsx	rdx, eax
	mov	rax, rdx
	sal	rax, 2
	add	rax, rdx
	sal	rax, 3
	mov	rdx, rax
	lea	rax, commands[rip+8]
	mov	rax, QWORD PTR [rdx+rax]
	mov	rdx, rax
	lea	rax, .LC1[rip]
	mov	rcx, rax
	call	printf
	mov	eax, DWORD PTR -4[rbp]
	movsx	rdx, eax
	mov	rax, rdx
	sal	rax, 2
	add	rax, rdx
	sal	rax, 3
	mov	rdx, rax
	lea	rax, commands[rip+16]
	mov	rax, QWORD PTR [rdx+rax]
	mov	rdx, rax
	lea	rax, .LC2[rip]
	mov	rcx, rax
	call	printf
	mov	eax, DWORD PTR -4[rbp]
	movsx	rdx, eax
	mov	rax, rdx
	sal	rax, 2
	add	rax, rdx
	sal	rax, 3
	mov	rdx, rax
	lea	rax, commands[rip]
	mov	rax, QWORD PTR [rdx+rax]
	lea	rdx, .LC3[rip]
	mov	rcx, rax
	call	strcmp
	test	eax, eax
	jne	.L22
	lea	rax, .LC4[rip]
	mov	rcx, rax
	call	printf
	jmp	.L22
.L15:
	add	DWORD PTR -4[rbp], 1
.L14:
	mov	eax, 6
	cmp	DWORD PTR -4[rbp], eax
	jl	.L18
	mov	rax, QWORD PTR 24[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	rdx, rax
	lea	rax, .LC5[rip]
	mov	rcx, rax
	call	printf
	jmp	.L19
.L13:
	lea	rax, .LC6[rip]
	mov	rcx, rax
	call	printf
	mov	DWORD PTR -8[rbp], 0
	jmp	.L20
.L21:
	mov	eax, DWORD PTR -8[rbp]
	movsx	rdx, eax
	mov	rax, rdx
	sal	rax, 2
	add	rax, rdx
	sal	rax, 3
	mov	rdx, rax
	lea	rax, commands[rip+8]
	mov	rcx, QWORD PTR [rdx+rax]
	mov	eax, DWORD PTR -8[rbp]
	movsx	rdx, eax
	mov	rax, rdx
	sal	rax, 2
	add	rax, rdx
	sal	rax, 3
	mov	rdx, rax
	lea	rax, commands[rip]
	mov	rax, QWORD PTR [rdx+rax]
	mov	r8, rcx
	mov	rdx, rax
	lea	rax, .LC7[rip]
	mov	rcx, rax
	call	printf
	add	DWORD PTR -8[rbp], 1
.L20:
	mov	eax, 6
	cmp	DWORD PTR -8[rbp], eax
	jl	.L21
.L19:
	mov	ecx, 1
	mov	rax, QWORD PTR __imp___acrt_iob_func[rip]
	call	rax
	mov	rcx, rax
	call	fflush
	jmp	.L12
.L22:
	nop
.L12:
	add	rsp, 48
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC8:
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
	lea	rax, .LC8[rip]
	mov	rcx, rax
	call	system
	nop
	add	rsp, 32
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC9:
	.ascii ".\0"
.LC10:
	.ascii "\33[32m%s\33[0m\12\0"
.LC11:
	.ascii "\0"
	.align 8
.LC12:
	.ascii "\12\33[33m%d\33[0m directories, \33[33m%d\33[0m files\12\0"
	.text
	.globl	cmd_tree
	.def	cmd_tree;	.scl	2;	.type	32;	.endef
	.seh_proc	cmd_tree
cmd_tree:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 64
	.seh_stackalloc	64
	.seh_endprologue
	mov	DWORD PTR 16[rbp], ecx
	mov	QWORD PTR 24[rbp], rdx
	cmp	DWORD PTR 16[rbp], 1
	jle	.L25
	mov	rax, QWORD PTR 24[rbp]
	mov	rax, QWORD PTR 8[rax]
	jmp	.L26
.L25:
	lea	rax, .LC9[rip]
.L26:
	mov	QWORD PTR -8[rbp], rax
	mov	DWORD PTR -12[rbp], 0
	mov	DWORD PTR -16[rbp], 0
	mov	rax, QWORD PTR -8[rbp]
	mov	rdx, rax
	lea	rax, .LC10[rip]
	mov	rcx, rax
	call	printf
	lea	rcx, -12[rbp]
	mov	rax, QWORD PTR -8[rbp]
	lea	rdx, -16[rbp]
	mov	QWORD PTR 32[rsp], rdx
	mov	r9, rcx
	mov	r8d, 1
	lea	rdx, .LC11[rip]
	mov	rcx, rax
	call	list_dir
	mov	edx, DWORD PTR -12[rbp]
	mov	eax, DWORD PTR -16[rbp]
	mov	r8d, edx
	mov	edx, eax
	lea	rax, .LC12[rip]
	mov	rcx, rax
	call	printf
	mov	ecx, 1
	mov	rax, QWORD PTR __imp___acrt_iob_func[rip]
	call	rax
	mov	rcx, rax
	call	fflush
	nop
	add	rsp, 64
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC13:
	.ascii "%s\12\0"
.LC14:
	.ascii "ping \0"
.LC15:
	.ascii " \0"
.LC16:
	.ascii "r\0"
	.align 8
.LC17:
	.ascii "\33[31mError: Failed to execute ping.\12\33[0m\0"
.LC18:
	.ascii "%s\0"
	.text
	.globl	cmd_ping
	.def	cmd_ping;	.scl	2;	.type	32;	.endef
	.seh_proc	cmd_ping
cmd_ping:
	push	rbp
	.seh_pushreg	rbp
	sub	rsp, 432
	.seh_stackalloc	432
	lea	rbp, 128[rsp]
	.seh_setframe	rbp, 128
	.seh_endprologue
	mov	DWORD PTR 320[rbp], ecx
	mov	QWORD PTR 328[rbp], rdx
	mov	rax, QWORD PTR 328[rbp]
	mov	rax, QWORD PTR [rax]
	mov	rcx, rax
	call	get_command_index
	mov	DWORD PTR 296[rbp], eax
	cmp	DWORD PTR 320[rbp], 1
	jg	.L28
	mov	eax, DWORD PTR 296[rbp]
	movsx	rdx, eax
	mov	rax, rdx
	sal	rax, 2
	add	rax, rdx
	sal	rax, 3
	mov	rdx, rax
	lea	rax, commands[rip+16]
	mov	rax, QWORD PTR [rdx+rax]
	mov	rdx, rax
	lea	rax, .LC13[rip]
	mov	rcx, rax
	call	printf
	jmp	.L27
.L28:
	lea	rax, 32[rbp]
	mov	r8d, 255
	lea	rdx, .LC14[rip]
	mov	rcx, rax
	call	strncpy
	mov	BYTE PTR 287[rbp], 0
	mov	DWORD PTR 300[rbp], 1
	jmp	.L30
.L31:
	lea	rax, 32[rbp]
	mov	rcx, rax
	call	strlen
	mov	edx, 255
	mov	rcx, rdx
	sub	rcx, rax
	mov	eax, DWORD PTR 300[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR 328[rbp]
	add	rax, rdx
	mov	rdx, QWORD PTR [rax]
	lea	rax, 32[rbp]
	mov	r8, rcx
	mov	rcx, rax
	call	strncat
	lea	rax, 32[rbp]
	mov	rcx, rax
	call	strlen
	mov	edx, 255
	sub	rdx, rax
	lea	rax, 32[rbp]
	mov	r8, rdx
	lea	rdx, .LC15[rip]
	mov	rcx, rax
	call	strncat
	add	DWORD PTR 300[rbp], 1
.L30:
	mov	eax, DWORD PTR 300[rbp]
	cmp	eax, DWORD PTR 320[rbp]
	jl	.L31
	lea	rax, 32[rbp]
	lea	rdx, .LC16[rip]
	mov	rcx, rax
	mov	rax, QWORD PTR __imp__popen[rip]
	call	rax
	mov	QWORD PTR 288[rbp], rax
	cmp	QWORD PTR 288[rbp], 0
	jne	.L33
	lea	rax, .LC17[rip]
	mov	rcx, rax
	call	printf
	jmp	.L27
.L34:
	lea	rax, -96[rbp]
	mov	rdx, rax
	lea	rax, .LC18[rip]
	mov	rcx, rax
	call	printf
	mov	ecx, 1
	mov	rax, QWORD PTR __imp___acrt_iob_func[rip]
	call	rax
	mov	rcx, rax
	call	fflush
.L33:
	mov	rdx, QWORD PTR 288[rbp]
	lea	rax, -96[rbp]
	mov	r8, rdx
	mov	edx, 128
	mov	rcx, rax
	call	fgets
	test	rax, rax
	jne	.L34
	mov	rax, QWORD PTR 288[rbp]
	mov	rcx, rax
	mov	rax, QWORD PTR __imp__pclose[rip]
	call	rax
	nop
.L27:
	add	rsp, 432
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC19:
	.ascii "\33[31mError: Could not create directory '%s' (Errno: %d)\12\33[0m\0"
.LC20:
	.ascii "a\0"
.LC21:
	.ascii "Error creating file\0"
.LC22:
	.ascii "Touched: \33[32m%s\33[0m\12\0"
	.text
	.globl	cmd_touch
	.def	cmd_touch;	.scl	2;	.type	32;	.endef
	.seh_proc	cmd_touch
cmd_touch:
	push	rbp
	.seh_pushreg	rbp
	sub	rsp, 320
	.seh_stackalloc	320
	lea	rbp, 128[rsp]
	.seh_setframe	rbp, 128
	.seh_endprologue
	mov	DWORD PTR 208[rbp], ecx
	mov	QWORD PTR 216[rbp], rdx
	mov	rax, QWORD PTR 216[rbp]
	mov	rax, QWORD PTR [rax]
	mov	rcx, rax
	call	get_command_index
	mov	DWORD PTR 184[rbp], eax
	cmp	DWORD PTR 208[rbp], 1
	jg	.L37
	mov	eax, DWORD PTR 184[rbp]
	movsx	rdx, eax
	mov	rax, rdx
	sal	rax, 2
	add	rax, rdx
	sal	rax, 3
	mov	rdx, rax
	lea	rax, commands[rip+16]
	mov	rax, QWORD PTR [rdx+rax]
	mov	rdx, rax
	lea	rax, .LC13[rip]
	mov	rcx, rax
	call	printf
	jmp	.L36
.L37:
	mov	rax, QWORD PTR 216[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	QWORD PTR 176[rbp], rax
	mov	rdx, QWORD PTR 176[rbp]
	lea	rax, -96[rbp]
	mov	r8d, 255
	mov	rcx, rax
	call	strncpy
	mov	BYTE PTR 159[rbp], 0
	mov	DWORD PTR 188[rbp], 0
	jmp	.L39
.L41:
	mov	eax, DWORD PTR 188[rbp]
	cdqe
	movzx	eax, BYTE PTR -96[rbp+rax]
	cmp	al, 47
	jne	.L40
	mov	eax, DWORD PTR 188[rbp]
	cdqe
	mov	BYTE PTR -96[rbp+rax], 92
.L40:
	add	DWORD PTR 188[rbp], 1
.L39:
	mov	eax, DWORD PTR 188[rbp]
	cdqe
	movzx	eax, BYTE PTR -96[rbp+rax]
	test	al, al
	jne	.L41
	lea	rax, -96[rbp]
	mov	edx, 92
	mov	rcx, rax
	call	strrchr
	mov	QWORD PTR 168[rbp], rax
	cmp	QWORD PTR 168[rbp], 0
	je	.L42
	mov	rax, QWORD PTR 168[rbp]
	mov	BYTE PTR [rax], 0
	lea	rax, -96[rbp]
	mov	rcx, rax
	call	_mkdir
	test	eax, eax
	je	.L42
	mov	rax, QWORD PTR __imp__errno[rip]
	call	rax
	mov	eax, DWORD PTR [rax]
	cmp	eax, 17
	je	.L42
	mov	rax, QWORD PTR __imp__errno[rip]
	call	rax
	mov	edx, DWORD PTR [rax]
	lea	rax, -96[rbp]
	mov	r8d, edx
	mov	rdx, rax
	lea	rax, .LC19[rip]
	mov	rcx, rax
	call	print_with_timestamp
	jmp	.L36
.L42:
	mov	rax, QWORD PTR 176[rbp]
	lea	rdx, .LC20[rip]
	mov	rcx, rax
	call	fopen
	mov	QWORD PTR 160[rbp], rax
	cmp	QWORD PTR 160[rbp], 0
	jne	.L43
	lea	rax, .LC21[rip]
	mov	rcx, rax
	call	perror
	jmp	.L36
.L43:
	mov	rax, QWORD PTR 160[rbp]
	mov	rcx, rax
	call	fclose
	mov	rax, QWORD PTR 216[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	rdx, rax
	lea	rax, .LC22[rip]
	mov	rcx, rax
	call	print_with_timestamp
	nop
.L36:
	add	rsp, 320
	pop	rbp
	ret
	.seh_endproc
	.globl	cmd_exit
	.def	cmd_exit;	.scl	2;	.type	32;	.endef
	.seh_proc	cmd_exit
cmd_exit:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 32
	.seh_stackalloc	32
	.seh_endprologue
	mov	DWORD PTR 16[rbp], ecx
	mov	QWORD PTR 24[rbp], rdx
	lea	rax, .LC8[rip]
	mov	rcx, rax
	call	system
	mov	ecx, 0
	call	exit
	nop
	.seh_endproc
	.globl	commands
	.section .rdata,"dr"
.LC23:
	.ascii "help\0"
	.align 8
.LC24:
	.ascii "Displays list of Commands Available\0"
.LC25:
	.ascii "help | help <command>\0"
.LC26:
	.ascii "clear\0"
.LC27:
	.ascii "Clear the Terminal Screen\0"
.LC28:
	.ascii "tree\0"
	.align 8
.LC29:
	.ascii "List directory contents in a tree structure\0"
.LC30:
	.ascii "tree [directory]\0"
.LC31:
	.ascii "Pings a hostname.\0"
.LC32:
	.ascii "ping <args> [hostname]\0"
.LC33:
	.ascii "touch\0"
.LC34:
	.ascii "Creates a file.\0"
.LC35:
	.ascii "touch [file|path/to/file]\0"
.LC36:
	.ascii "exit\0"
.LC37:
	.ascii "Exits the Application\0"
	.data
	.align 32
commands:
	.quad	.LC23
	.quad	.LC24
	.quad	.LC25
	.quad	cmd_help
	.long	0
	.space 4
	.quad	.LC26
	.quad	.LC27
	.quad	.LC26
	.quad	cmd_clear
	.long	0
	.space 4
	.quad	.LC28
	.quad	.LC29
	.quad	.LC30
	.quad	cmd_tree
	.long	1
	.space 4
	.quad	.LC3
	.quad	.LC31
	.quad	.LC32
	.quad	cmd_ping
	.long	1
	.space 4
	.quad	.LC33
	.quad	.LC34
	.quad	.LC35
	.quad	cmd_touch
	.long	1
	.space 4
	.quad	.LC36
	.quad	.LC37
	.quad	.LC36
	.quad	cmd_exit
	.long	0
	.space 4
	.globl	commands_count
	.section .rdata,"dr"
	.align 4
commands_count:
	.long	6
.LC38:
	.ascii " \12\0"
.LC39:
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
	lea	rdx, .LC38[rip]
	mov	rcx, rax
	call	strtok
	mov	QWORD PTR -16[rbp], rax
	jmp	.L47
.L49:
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
	lea	rax, .LC38[rip]
	mov	rdx, rax
	mov	ecx, 0
	call	strtok
	mov	QWORD PTR -16[rbp], rax
.L47:
	cmp	QWORD PTR -16[rbp], 0
	je	.L48
	cmp	DWORD PTR -4[rbp], 9
	jle	.L49
.L48:
	cmp	DWORD PTR -4[rbp], 0
	jne	.L50
	mov	rax, QWORD PTR -32[rbp]
	mov	rcx, rax
	call	free
	jmp	.L46
.L50:
	mov	rax, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR [rax]
	mov	rcx, rax
	call	get_command_index
	mov	DWORD PTR -36[rbp], eax
	cmp	DWORD PTR -36[rbp], -1
	je	.L52
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
	je	.L53
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
	jmp	.L46
.L53:
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
	jmp	.L55
.L56:
	mov	eax, DWORD PTR -20[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR -32[rbp]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	mov	rcx, rax
	call	free
	add	DWORD PTR -20[rbp], 1
.L55:
	mov	eax, DWORD PTR -20[rbp]
	cmp	eax, DWORD PTR -4[rbp]
	jl	.L56
	mov	rax, QWORD PTR -32[rbp]
	mov	rcx, rax
	call	free
	jmp	.L46
.L52:
	mov	rax, QWORD PTR -32[rbp]
	mov	rax, QWORD PTR [rax]
	mov	rdx, rax
	lea	rax, .LC39[rip]
	mov	rcx, rax
	call	printf
	nop
.L46:
	add	rsp, 104
	pop	rbx
	pop	rbp
	ret
	.seh_endproc
	.ident	"GCC: (GNU) 13-win32"
	.def	__mingw_vfprintf;	.scl	2;	.type	32;	.endef
	.def	strcmp;	.scl	2;	.type	32;	.endef
	.def	free;	.scl	2;	.type	32;	.endef
	.def	fflush;	.scl	2;	.type	32;	.endef
	.def	system;	.scl	2;	.type	32;	.endef
	.def	list_dir;	.scl	2;	.type	32;	.endef
	.def	strncpy;	.scl	2;	.type	32;	.endef
	.def	strlen;	.scl	2;	.type	32;	.endef
	.def	strncat;	.scl	2;	.type	32;	.endef
	.def	fgets;	.scl	2;	.type	32;	.endef
	.def	strrchr;	.scl	2;	.type	32;	.endef
	.def	_mkdir;	.scl	2;	.type	32;	.endef
	.def	print_with_timestamp;	.scl	2;	.type	32;	.endef
	.def	fopen;	.scl	2;	.type	32;	.endef
	.def	perror;	.scl	2;	.type	32;	.endef
	.def	fclose;	.scl	2;	.type	32;	.endef
	.def	exit;	.scl	2;	.type	32;	.endef
	.def	StringToLower;	.scl	2;	.type	32;	.endef
	.def	malloc;	.scl	2;	.type	32;	.endef
	.def	strtok;	.scl	2;	.type	32;	.endef
	.def	strdup;	.scl	2;	.type	32;	.endef
