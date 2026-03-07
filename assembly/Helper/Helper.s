	.file	"Helper.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"[%H:%M:%S] "
.LC1:
	.string	"%s"
	.text
	.globl	print_with_timestamp
	.type	print_with_timestamp, @function
print_with_timestamp:
.LFB6:
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
	je	.L2
	movaps	XMMWORD PTR -128[rbp], xmm0
	movaps	XMMWORD PTR -112[rbp], xmm1
	movaps	XMMWORD PTR -96[rbp], xmm2
	movaps	XMMWORD PTR -80[rbp], xmm3
	movaps	XMMWORD PTR -64[rbp], xmm4
	movaps	XMMWORD PTR -48[rbp], xmm5
	movaps	XMMWORD PTR -32[rbp], xmm6
	movaps	XMMWORD PTR -16[rbp], xmm7
.L2:
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
	lea	rdx, .LC0[rip]
	mov	esi, 20
	mov	rdi, rax
	call	strftime@PLT
	lea	rax, -208[rbp]
	mov	rsi, rax
	lea	rax, .LC1[rip]
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
	je	.L3
	call	__stack_chk_fail@PLT
.L3:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	print_with_timestamp, .-print_with_timestamp
	.globl	StringToLower
	.type	StringToLower, @function
StringToLower:
.LFB7:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 16
	mov	QWORD PTR -8[rbp], rdi
	jmp	.L5
.L6:
	mov	rax, QWORD PTR -8[rbp]
	movzx	eax, BYTE PTR [rax]
	movzx	eax, al
	mov	edi, eax
	call	tolower@PLT
	mov	edx, eax
	mov	rax, QWORD PTR -8[rbp]
	mov	BYTE PTR [rax], dl
	add	QWORD PTR -8[rbp], 1
.L5:
	mov	rax, QWORD PTR -8[rbp]
	movzx	eax, BYTE PTR [rax]
	test	al, al
	jne	.L6
	nop
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	StringToLower, .-StringToLower
	.section	.rodata
	.align 8
.LC2:
	.string	"DEBUG: Rejected char at index %d: '%c' (ASCII %d)\n"
	.text
	.globl	is_safe_hostname
	.type	is_safe_hostname, @function
is_safe_hostname:
.LFB8:
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
	je	.L8
	mov	rax, QWORD PTR -24[rbp]
	movzx	eax, BYTE PTR [rax]
	test	al, al
	jne	.L9
.L8:
	mov	eax, 0
	jmp	.L10
.L9:
	mov	DWORD PTR -4[rbp], 0
	jmp	.L11
.L13:
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
	jne	.L12
	mov	eax, DWORD PTR -4[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	cmp	al, 46
	je	.L12
	mov	eax, DWORD PTR -4[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	cmp	al, 45
	je	.L12
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
	lea	rax, .LC2[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, 0
	jmp	.L10
.L12:
	add	DWORD PTR -4[rbp], 1
.L11:
	mov	eax, DWORD PTR -4[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	test	al, al
	jne	.L13
	mov	eax, 1
.L10:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	is_safe_hostname, .-is_safe_hostname
	.section	.rodata
.LC3:
	.string	"\342\224\224\342\224\200\342\224\200"
.LC4:
	.string	"\342\224\234\342\224\200\342\224\200"
.LC5:
	.string	"%s%s %s\n"
.LC6:
	.string	"%s/%s"
.LC7:
	.string	" "
.LC8:
	.string	"\342\224\202"
.LC9:
	.string	"%s%s   "
	.text
	.globl	list_dir
	.type	list_dir, @function
list_dir:
.LFB9:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 4096
	or	QWORD PTR [rsp], 0
	sub	rsp, 4096
	or	QWORD PTR [rsp], 0
	sub	rsp, 1792
	mov	QWORD PTR -9944[rbp], rdi
	mov	QWORD PTR -9952[rbp], rsi
	mov	DWORD PTR -9956[rbp], edx
	mov	QWORD PTR -9968[rbp], rcx
	mov	QWORD PTR -9976[rbp], r8
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	mov	rax, QWORD PTR -9944[rbp]
	mov	rdi, rax
	call	opendir@PLT
	mov	QWORD PTR -9912[rbp], rax
	cmp	QWORD PTR -9912[rbp], 0
	je	.L29
	mov	DWORD PTR -9924[rbp], 0
	jmp	.L18
.L19:
	mov	rax, QWORD PTR -9904[rbp]
	movzx	eax, BYTE PTR 19[rax]
	cmp	al, 46
	je	.L18
	mov	eax, DWORD PTR -9924[rbp]
	lea	edx, 1[rax]
	mov	DWORD PTR -9924[rbp], edx
	cdqe
	mov	rdx, QWORD PTR -9904[rbp]
	mov	QWORD PTR -9744[rbp+rax*8], rdx
.L18:
	mov	rax, QWORD PTR -9912[rbp]
	mov	rdi, rax
	call	readdir@PLT
	mov	QWORD PTR -9904[rbp], rax
	cmp	QWORD PTR -9904[rbp], 0
	jne	.L19
	mov	DWORD PTR -9920[rbp], 0
	jmp	.L20
.L27:
	mov	eax, DWORD PTR -9924[rbp]
	sub	eax, 1
	cmp	DWORD PTR -9920[rbp], eax
	sete	al
	movzx	eax, al
	mov	DWORD PTR -9916[rbp], eax
	mov	eax, DWORD PTR -9920[rbp]
	cdqe
	mov	rax, QWORD PTR -9744[rbp+rax*8]
	add	rax, 19
	mov	QWORD PTR -9896[rbp], rax
	cmp	DWORD PTR -9916[rbp], 0
	je	.L21
	lea	rax, .LC3[rip]
	jmp	.L22
.L21:
	lea	rax, .LC4[rip]
.L22:
	mov	rdx, QWORD PTR -9896[rbp]
	mov	rsi, QWORD PTR -9952[rbp]
	mov	rcx, rdx
	mov	rdx, rax
	lea	rax, .LC5[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	rcx, QWORD PTR -9896[rbp]
	mov	rdx, QWORD PTR -9944[rbp]
	lea	rax, -1040[rbp]
	mov	r8, rcx
	mov	rcx, rdx
	lea	rdx, .LC6[rip]
	mov	esi, 1024
	mov	rdi, rax
	mov	eax, 0
	call	snprintf@PLT
	lea	rdx, -9888[rbp]
	lea	rax, -1040[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	stat@PLT
	test	eax, eax
	jne	.L23
	mov	eax, DWORD PTR -9864[rbp]
	and	eax, 61440
	cmp	eax, 16384
	jne	.L24
	mov	rax, QWORD PTR -9976[rbp]
	mov	eax, DWORD PTR [rax]
	lea	edx, 1[rax]
	mov	rax, QWORD PTR -9976[rbp]
	mov	DWORD PTR [rax], edx
	cmp	DWORD PTR -9916[rbp], 0
	je	.L25
	lea	rax, .LC7[rip]
	jmp	.L26
.L25:
	lea	rax, .LC8[rip]
.L26:
	mov	rdx, QWORD PTR -9952[rbp]
	lea	rdi, -1552[rbp]
	mov	r8, rax
	mov	rcx, rdx
	lea	rax, .LC9[rip]
	mov	rdx, rax
	mov	esi, 512
	mov	eax, 0
	call	snprintf@PLT
	mov	rdi, QWORD PTR -9976[rbp]
	mov	rcx, QWORD PTR -9968[rbp]
	mov	edx, DWORD PTR -9916[rbp]
	lea	rsi, -1552[rbp]
	lea	rax, -1040[rbp]
	mov	r8, rdi
	mov	rdi, rax
	call	list_dir
	jmp	.L23
.L24:
	mov	rax, QWORD PTR -9968[rbp]
	mov	eax, DWORD PTR [rax]
	lea	edx, 1[rax]
	mov	rax, QWORD PTR -9968[rbp]
	mov	DWORD PTR [rax], edx
.L23:
	add	DWORD PTR -9920[rbp], 1
.L20:
	mov	eax, DWORD PTR -9920[rbp]
	cmp	eax, DWORD PTR -9924[rbp]
	jl	.L27
	mov	rax, QWORD PTR -9912[rbp]
	mov	rdi, rax
	call	closedir@PLT
	jmp	.L14
.L29:
	nop
.L14:
	mov	rax, QWORD PTR -8[rbp]
	sub	rax, QWORD PTR fs:40
	je	.L28
	call	__stack_chk_fail@PLT
.L28:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	list_dir, .-list_dir
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
