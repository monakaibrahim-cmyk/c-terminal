	.file	"Helper.c"
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
	.def	vprintf;	.scl	3;	.type	32;	.endef
	.seh_proc	vprintf
vprintf:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 32
	.seh_stackalloc	32
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	ecx, 1
	mov	rax, QWORD PTR __imp___acrt_iob_func[rip]
	call	rax
	mov	rcx, rax
	mov	rdx, QWORD PTR 24[rbp]
	mov	rax, QWORD PTR 16[rbp]
	mov	r8, rdx
	mov	rdx, rax
	call	__mingw_vfprintf
	add	rsp, 32
	pop	rbp
	ret
	.seh_endproc
	.def	snprintf;	.scl	3;	.type	32;	.endef
	.seh_proc	snprintf
snprintf:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 48
	.seh_stackalloc	48
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	QWORD PTR 40[rbp], r9
	lea	rax, 40[rbp]
	mov	QWORD PTR -16[rbp], rax
	mov	r8, QWORD PTR -16[rbp]
	mov	rcx, QWORD PTR 32[rbp]
	mov	rdx, QWORD PTR 24[rbp]
	mov	rax, QWORD PTR 16[rbp]
	mov	r9, r8
	mov	r8, rcx
	mov	rcx, rax
	call	__mingw_vsnprintf
	mov	DWORD PTR -4[rbp], eax
	mov	eax, DWORD PTR -4[rbp]
	add	rsp, 48
	pop	rbp
	ret
	.seh_endproc
	.def	time;	.scl	3;	.type	32;	.endef
	.seh_proc	time
time:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 32
	.seh_stackalloc	32
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	rax, QWORD PTR 16[rbp]
	mov	rcx, rax
	mov	rax, QWORD PTR __imp__time64[rip]
	call	rax
	add	rsp, 32
	pop	rbp
	ret
	.seh_endproc
	.def	localtime_s;	.scl	3;	.type	32;	.endef
	.seh_proc	localtime_s
localtime_s:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 32
	.seh_stackalloc	32
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	rdx, QWORD PTR 24[rbp]
	mov	rax, QWORD PTR 16[rbp]
	mov	rcx, rax
	mov	rax, QWORD PTR __imp__localtime64_s[rip]
	call	rax
	add	rsp, 32
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC0:
	.ascii "[%H:%M:%S] \0"
.LC1:
	.ascii "%s\0"
	.text
	.globl	print_with_timestamp
	.def	print_with_timestamp;	.scl	2;	.type	32;	.endef
	.seh_proc	print_with_timestamp
print_with_timestamp:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	add	rsp, -128
	.seh_stackalloc	128
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	mov	QWORD PTR 32[rbp], r8
	mov	QWORD PTR 40[rbp], r9
	lea	rax, -8[rbp]
	mov	rcx, rax
	call	time
	lea	rdx, -8[rbp]
	lea	rax, -48[rbp]
	mov	rcx, rax
	call	localtime_s
	lea	rdx, -48[rbp]
	lea	rax, -80[rbp]
	mov	r9, rdx
	lea	r8, .LC0[rip]
	mov	edx, 20
	mov	rcx, rax
	call	strftime
	lea	rax, -80[rbp]
	mov	rdx, rax
	lea	rax, .LC1[rip]
	mov	rcx, rax
	call	printf
	lea	rax, 24[rbp]
	mov	QWORD PTR -88[rbp], rax
	mov	rdx, QWORD PTR -88[rbp]
	mov	rax, QWORD PTR 16[rbp]
	mov	rcx, rax
	call	vprintf
	nop
	sub	rsp, -128
	pop	rbp
	ret
	.seh_endproc
	.globl	StringToLower
	.def	StringToLower;	.scl	2;	.type	32;	.endef
	.seh_proc	StringToLower
StringToLower:
	push	rbp
	.seh_pushreg	rbp
	mov	rbp, rsp
	.seh_setframe	rbp, 0
	sub	rsp, 32
	.seh_stackalloc	32
	.seh_endprologue
	mov	QWORD PTR 16[rbp], rcx
	jmp	.L13
.L14:
	mov	rax, QWORD PTR 16[rbp]
	movzx	eax, BYTE PTR [rax]
	movzx	eax, al
	mov	ecx, eax
	mov	rax, QWORD PTR __imp_tolower[rip]
	call	rax
	mov	edx, eax
	mov	rax, QWORD PTR 16[rbp]
	mov	BYTE PTR [rax], dl
	add	QWORD PTR 16[rbp], 1
.L13:
	mov	rax, QWORD PTR 16[rbp]
	movzx	eax, BYTE PTR [rax]
	test	al, al
	jne	.L14
	nop
	nop
	add	rsp, 32
	pop	rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
.LC2:
	.ascii "%s\\*\0"
.LC3:
	.ascii ".\0"
.LC4:
	.ascii "..\0"
.LC5:
	.ascii "%s\\%s\0"
.LC6:
	.ascii "\342\224\224\342\224\200\342\224\200\0"
.LC7:
	.ascii "\342\224\234\342\224\200\342\224\200\0"
.LC8:
	.ascii "%s%s %s\12\0"
.LC9:
	.ascii " \0"
.LC10:
	.ascii "\342\224\202\0"
.LC11:
	.ascii "%s%s   \0"
	.text
	.globl	list_dir
	.def	list_dir;	.scl	2;	.type	32;	.endef
	.seh_proc	list_dir
list_dir:
	push	rbp
	.seh_pushreg	rbp
	mov	eax, 328560
	call	___chkstk_ms
	sub	rsp, rax
	.seh_stackalloc	328560
	lea	rbp, 128[rsp]
	.seh_setframe	rbp, 128
	.seh_endprologue
	mov	QWORD PTR 328448[rbp], rcx
	mov	QWORD PTR 328456[rbp], rdx
	mov	DWORD PTR 328464[rbp], r8d
	mov	QWORD PTR 328472[rbp], r9
	mov	rdx, QWORD PTR 328448[rbp]
	lea	rax, 328144[rbp]
	mov	r9, rdx
	lea	r8, .LC2[rip]
	mov	edx, 260
	mov	rcx, rax
	call	snprintf
	mov	DWORD PTR 328428[rbp], 0
	lea	rcx, 464[rbp]
	mov	eax, DWORD PTR 328428[rbp]
	movsx	rdx, eax
	mov	rax, rdx
	sal	rax, 2
	add	rax, rdx
	sal	rax, 6
	lea	rdx, [rcx+rax]
	lea	rax, 328144[rbp]
	mov	rcx, rax
	mov	rax, QWORD PTR __imp_FindFirstFileA[rip]
	call	rax
	mov	QWORD PTR 328416[rbp], rax
	cmp	QWORD PTR 328416[rbp], -1
	je	.L16
.L19:
	lea	rcx, 464[rbp]
	mov	eax, DWORD PTR 328428[rbp]
	movsx	rdx, eax
	mov	rax, rdx
	sal	rax, 2
	add	rax, rdx
	sal	rax, 6
	add	rax, 32
	add	rax, rcx
	add	rax, 12
	lea	rdx, .LC3[rip]
	mov	rcx, rax
	call	strcmp
	test	eax, eax
	je	.L17
	lea	rcx, 464[rbp]
	mov	eax, DWORD PTR 328428[rbp]
	movsx	rdx, eax
	mov	rax, rdx
	sal	rax, 2
	add	rax, rdx
	sal	rax, 6
	add	rax, 32
	add	rax, rcx
	add	rax, 12
	lea	rdx, .LC4[rip]
	mov	rcx, rax
	call	strcmp
	test	eax, eax
	je	.L17
	add	DWORD PTR 328428[rbp], 1
.L17:
	lea	rcx, 464[rbp]
	mov	eax, DWORD PTR 328428[rbp]
	movsx	rdx, eax
	mov	rax, rdx
	sal	rax, 2
	add	rax, rdx
	sal	rax, 6
	lea	rdx, [rcx+rax]
	mov	rax, QWORD PTR 328416[rbp]
	mov	rcx, rax
	mov	rax, QWORD PTR __imp_FindNextFileA[rip]
	call	rax
	test	eax, eax
	je	.L18
	cmp	DWORD PTR 328428[rbp], 1023
	jle	.L19
.L18:
	mov	rax, QWORD PTR 328416[rbp]
	mov	rcx, rax
	mov	rax, QWORD PTR __imp_FindClose[rip]
	call	rax
.L16:
	mov	DWORD PTR 328424[rbp], 0
	jmp	.L20
.L27:
	mov	eax, DWORD PTR 328428[rbp]
	sub	eax, 1
	cmp	DWORD PTR 328424[rbp], eax
	sete	al
	movzx	eax, al
	mov	DWORD PTR 328412[rbp], eax
	lea	rcx, 464[rbp]
	mov	eax, DWORD PTR 328424[rbp]
	movsx	rdx, eax
	mov	rax, rdx
	sal	rax, 2
	add	rax, rdx
	sal	rax, 6
	add	rax, 32
	add	rax, rcx
	lea	rdx, 12[rax]
	mov	rcx, QWORD PTR 328448[rbp]
	lea	rax, -80[rbp]
	mov	QWORD PTR 32[rsp], rdx
	mov	r9, rcx
	lea	r8, .LC5[rip]
	mov	edx, 260
	mov	rcx, rax
	call	snprintf
	lea	rcx, 464[rbp]
	mov	eax, DWORD PTR 328424[rbp]
	movsx	rdx, eax
	mov	rax, rdx
	sal	rax, 2
	add	rax, rdx
	sal	rax, 6
	add	rax, 32
	add	rax, rcx
	lea	rcx, 12[rax]
	cmp	DWORD PTR 328412[rbp], 0
	je	.L21
	lea	rax, .LC6[rip]
	jmp	.L22
.L21:
	lea	rax, .LC7[rip]
.L22:
	mov	rdx, QWORD PTR 328456[rbp]
	mov	r9, rcx
	mov	r8, rax
	lea	rax, .LC8[rip]
	mov	rcx, rax
	call	printf
	mov	eax, DWORD PTR 328424[rbp]
	movsx	rdx, eax
	mov	rax, rdx
	sal	rax, 2
	add	rax, rdx
	sal	rax, 6
	lea	rax, 328432[rax]
	add	rax, rbp
	sub	rax, 327968
	mov	eax, DWORD PTR [rax]
	and	eax, 16
	test	eax, eax
	je	.L23
	mov	rax, QWORD PTR 328480[rbp]
	mov	eax, DWORD PTR [rax]
	lea	edx, 1[rax]
	mov	rax, QWORD PTR 328480[rbp]
	mov	DWORD PTR [rax], edx
	cmp	DWORD PTR 328412[rbp], 0
	je	.L24
	lea	rax, .LC9[rip]
	jmp	.L25
.L24:
	lea	rax, .LC10[rip]
.L25:
	mov	rdx, QWORD PTR 328456[rbp]
	lea	rcx, 192[rbp]
	mov	QWORD PTR 32[rsp], rax
	mov	r9, rdx
	lea	r8, .LC11[rip]
	mov	edx, 260
	call	snprintf
	mov	r9, QWORD PTR 328472[rbp]
	mov	r8d, DWORD PTR 328412[rbp]
	lea	rdx, 192[rbp]
	lea	rax, -80[rbp]
	mov	rcx, QWORD PTR 328480[rbp]
	mov	QWORD PTR 32[rsp], rcx
	mov	rcx, rax
	call	list_dir
	jmp	.L26
.L23:
	mov	rax, QWORD PTR 328472[rbp]
	mov	eax, DWORD PTR [rax]
	lea	edx, 1[rax]
	mov	rax, QWORD PTR 328472[rbp]
	mov	DWORD PTR [rax], edx
.L26:
	add	DWORD PTR 328424[rbp], 1
.L20:
	mov	eax, DWORD PTR 328424[rbp]
	cmp	eax, DWORD PTR 328428[rbp]
	jl	.L27
	nop
	nop
	add	rsp, 328560
	pop	rbp
	ret
	.seh_endproc
	.ident	"GCC: (GNU) 13-win32"
	.def	__mingw_vfprintf;	.scl	2;	.type	32;	.endef
	.def	__mingw_vsnprintf;	.scl	2;	.type	32;	.endef
	.def	strftime;	.scl	2;	.type	32;	.endef
	.def	strcmp;	.scl	2;	.type	32;	.endef
