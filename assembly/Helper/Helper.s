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
.LFB0:
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
.LFE0:
	.size	print_with_timestamp, .-print_with_timestamp
	.globl	StringToLower
	.type	StringToLower, @function
StringToLower:
.LFB1:
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
.LFE1:
	.size	StringToLower, .-StringToLower
	.section	.rodata
	.align 8
.LC2:
	.string	"DEBUG: Rejected char at index %d: '%c' (ASCII %d)\n"
	.text
	.globl	is_safe_hostname
	.type	is_safe_hostname, @function
is_safe_hostname:
.LFB2:
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
.LFE2:
	.size	is_safe_hostname, .-is_safe_hostname
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
