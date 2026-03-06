	.file	"main.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
	.align 8
.LC0:
	.string	"Terminal App v1.0. Type 'help' for commands."
.LC1:
	.string	"[CMD] >> "
.LC2:
	.string	"\033[1A\033[2K"
.LC3:
	.string	"\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 304
	mov	DWORD PTR -292[rbp], edi
	mov	QWORD PTR -304[rbp], rsi
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	lea	rax, .LC0[rip]
	mov	rdi, rax
	call	puts@PLT
.L7:
	lea	rax, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	rdx, QWORD PTR stdin[rip]
	lea	rax, -272[rbp]
	mov	esi, 256
	mov	rdi, rax
	call	fgets@PLT
	test	rax, rax
	je	.L11
	lea	rax, .LC2[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	rax, QWORD PTR stdout[rip]
	mov	rdi, rax
	call	fflush@PLT
	lea	rax, -272[rbp]
	lea	rdx, .LC3[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	strcspn@PLT
	mov	BYTE PTR -272[rbp+rax], 0
	lea	rax, -272[rbp]
	movzx	eax, BYTE PTR [rax]
	test	al, al
	je	.L7
	lea	rax, -272[rbp]
	mov	rdi, rax
	call	handle@PLT
	mov	QWORD PTR -288[rbp], 0
	mov	QWORD PTR -280[rbp], 0
	mov	QWORD PTR -288[rbp], 0
	mov	QWORD PTR -280[rbp], 50000000
	jmp	.L5
.L6:
	nop
.L5:
	lea	rdx, -288[rbp]
	lea	rax, -288[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	nanosleep@PLT
	cmp	eax, -1
	je	.L6
	jmp	.L7
.L11:
	nop
	mov	eax, 0
	mov	rdx, QWORD PTR -8[rbp]
	sub	rdx, QWORD PTR fs:40
	je	.L9
	call	__stack_chk_fail@PLT
.L9:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
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
