	.file	"main.c"
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
	.globl	msleep
	.def	msleep;	.scl	2;	.type	32;	.endef
	.seh_proc	msleep
msleep:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 32
	.seh_stackalloc	32
	.seh_endprologue
	mov	DWORD PTR 16[rbp], ecx
	mov	eax, DWORD PTR 16[rbp]
	mov	ecx, eax
	mov	rax, QWORD PTR __imp_Sleep[rip]
	call	rax
	nop
	add	rsp, 32
	pop	rbp
	ret
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
.LC0:
	.ascii "Terminal App v1.0.\12\0"
.LC1:
	.ascii "[CMD] >> \0"
.LC2:
	.ascii "\12\0"
	.text
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	push	rbp
	.seh_pushreg	rbp
	sub	rsp, 368
	.seh_stackalloc	368
	lea	rbp, 128[rsp]
	.seh_setframe	rbp, 128
	.seh_endprologue
	mov	DWORD PTR 256[rbp], ecx
	mov	QWORD PTR 264[rbp], rdx
	call	__main
	mov	ecx, 65001
	mov	rax, QWORD PTR __imp_SetConsoleOutputCP[rip]
	call	rax
	mov	ecx, 65001
	mov	rax, QWORD PTR __imp_SetConsoleCP[rip]
	call	rax
	lea	rax, .LC0[rip]
	mov	rcx, rax
	call	printf
.L10:
	jmp	.L5
.L6:
	mov	ecx, 100
	call	msleep
.L5:
	mov	rax, QWORD PTR .refptr.is_busy[rip]
	mov	QWORD PTR 232[rbp], rax
	mov	rax, QWORD PTR 232[rbp]
	mov	eax, DWORD PTR [rax]
	mov	DWORD PTR -76[rbp], eax
	mov	eax, DWORD PTR -76[rbp]
	test	eax, eax
	jne	.L6
	lea	rax, .LC1[rip]
	mov	rcx, rax
	call	printf
	mov	ecx, 1
	mov	rax, QWORD PTR __imp___acrt_iob_func[rip]
	call	rax
	mov	rcx, rax
	call	fflush
	mov	ecx, 0
	mov	rax, QWORD PTR __imp___acrt_iob_func[rip]
	call	rax
	mov	rdx, rax
	lea	rax, -32[rbp]
	mov	r8, rdx
	mov	edx, 256
	mov	rcx, rax
	call	fgets
	test	rax, rax
	jne	.L7
	mov	eax, 0
	jmp	.L11
.L7:
	mov	ecx, -11
	mov	rax, QWORD PTR __imp_GetStdHandle[rip]
	call	rax
	mov	QWORD PTR 224[rbp], rax
	lea	rdx, -64[rbp]
	mov	rax, QWORD PTR 224[rbp]
	mov	rcx, rax
	mov	rax, QWORD PTR __imp_GetConsoleScreenBufferInfo[rip]
	call	rax
	mov	WORD PTR -68[rbp], 0
	movzx	eax, WORD PTR -58[rbp]
	mov	WORD PTR -66[rbp], ax
	movzx	eax, WORD PTR -64[rbp]
	movsx	ecx, ax
	mov	r8d, DWORD PTR -68[rbp]
	mov	rax, QWORD PTR 224[rbp]
	lea	rdx, -72[rbp]
	mov	QWORD PTR 32[rsp], rdx
	mov	r9d, r8d
	mov	r8d, ecx
	mov	edx, 32
	mov	rcx, rax
	mov	rax, QWORD PTR __imp_FillConsoleOutputCharacterA[rip]
	call	rax
	mov	edx, DWORD PTR -68[rbp]
	mov	rax, QWORD PTR 224[rbp]
	mov	rcx, rax
	mov	rax, QWORD PTR __imp_SetConsoleCursorPosition[rip]
	call	rax
	mov	ecx, 1
	mov	rax, QWORD PTR __imp___acrt_iob_func[rip]
	call	rax
	mov	rcx, rax
	call	fflush
	lea	rax, -32[rbp]
	lea	rdx, .LC2[rip]
	mov	rcx, rax
	call	strcspn
	mov	BYTE PTR -32[rbp+rax], 0
	lea	rax, -32[rbp]
	movzx	eax, BYTE PTR [rax]
	test	al, al
	je	.L10
	lea	rax, -32[rbp]
	mov	rcx, rax
	call	handle
	mov	ecx, 50
	call	msleep
	jmp	.L10
.L11:
	add	rsp, 368
	pop	rbp
	ret
	.seh_endproc
	.ident	"GCC: (GNU) 13-win32"
	.def	__mingw_vfprintf;	.scl	2;	.type	32;	.endef
	.def	fflush;	.scl	2;	.type	32;	.endef
	.def	fgets;	.scl	2;	.type	32;	.endef
	.def	strcspn;	.scl	2;	.type	32;	.endef
	.def	handle;	.scl	2;	.type	32;	.endef
	.section	.rdata$.refptr.is_busy, "dr"
	.globl	.refptr.is_busy
	.linkonce	discard
.refptr.is_busy:
	.quad	is_busy
