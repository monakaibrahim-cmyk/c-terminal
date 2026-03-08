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
	.align 8
.LC0:
	.ascii "Terminal App v1.0. Type 'help' for commands.\12\0"
.LC1:
	.ascii "[CMD] >> \0"
.LC2:
	.ascii "\33[1A\33[2K\0"
.LC3:
	.ascii "\12\0"
	.text
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	push	rbp
	.seh_pushreg	rbp
	sub	rsp, 320
	.seh_stackalloc	320
	lea	rbp, 128[rsp]
	.seh_setframe	rbp, 128
	.seh_endprologue
	mov	DWORD PTR 208[rbp], ecx
	mov	QWORD PTR 216[rbp], rdx
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
	jmp	.L5
.L6:
	mov	ecx, 100
	call	msleep
.L5:
	mov	rax, QWORD PTR .refptr.is_busy[rip]
	mov	QWORD PTR 184[rbp], rax
	mov	rax, QWORD PTR 184[rbp]
	mov	eax, DWORD PTR [rax]
	mov	DWORD PTR -84[rbp], eax
	mov	eax, DWORD PTR -84[rbp]
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
	lea	rax, -80[rbp]
	mov	r8, rdx
	mov	edx, 256
	mov	rcx, rax
	call	fgets
	test	rax, rax
	je	.L13
	lea	rax, .LC2[rip]
	mov	rcx, rax
	call	printf
	mov	ecx, 1
	mov	rax, QWORD PTR __imp___acrt_iob_func[rip]
	call	rax
	mov	rcx, rax
	call	fflush
	lea	rax, -80[rbp]
	lea	rdx, .LC3[rip]
	mov	rcx, rax
	call	strcspn
	mov	BYTE PTR -80[rbp+rax], 0
	lea	rax, -80[rbp]
	movzx	eax, BYTE PTR [rax]
	test	al, al
	je	.L5
	lea	rax, -80[rbp]
	mov	rcx, rax
	call	handle
	mov	ecx, 50
	call	msleep
	jmp	.L5
.L13:
	nop
	mov	eax, 0
	add	rsp, 320
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
