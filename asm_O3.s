	.file	"matmul.cpp"
	.intel_syntax noprefix
	.text
	.p2align 4
	.type	_ZL12matmul_naivePKdS0_Pdi, @function
_ZL12matmul_naivePKdS0_Pdi:
.LFB1906:
	.cfi_startproc
	test	ecx, ecx
	jle	.L18
	mov	r10d, ecx
	movsxd	rcx, ecx
	push	r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	mov	r11, rdi
	mov	eax, r10d
	push	r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	lea	r14, 0[0+rcx*8]
	push	r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	shr	eax
	push	r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	push	rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	mov	rbp, rdi
	push	rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	mov	rdi, rcx
	sal	rax, 4
	mov	r12, rsi
	mov	rbx, rdx
	sal	rdi, 4
	xor	edx, edx
	xor	r13d, r13d
	mov	QWORD PTR -16[rsp], r14
	mov	rsi, rax
	.p2align 4
	.p2align 3
.L3:
	mov	r15, r12
	xor	r9d, r9d
	lea	r8, [rsi+r11]
	.p2align 4
	.p2align 3
.L5:
	cmp	r10d, 1
	je	.L11
.L9:
	mov	r14, r11
	mov	rax, r15
	vxorpd	xmm1, xmm1, xmm1
	.p2align 6
	.p2align 4
	.p2align 3
.L7:
	vmovsd	xmm0, QWORD PTR [rax]
	add	r14, 16
	vmovhpd	xmm0, xmm0, QWORD PTR [rax+rcx*8]
	vmulpd	xmm0, xmm0, XMMWORD PTR -16[r14]
	add	rax, rdi
	vaddsd	xmm1, xmm1, xmm0
	vunpckhpd	xmm0, xmm0, xmm0
	vaddsd	xmm1, xmm0, xmm1
	cmp	r14, r8
	jne	.L7
	test	r10b, 1
	je	.L4
	mov	eax, r10d
	and	eax, -2
.L10:
	cdqe
	mov	r14, rcx
	add	r15, 8
	imul	r14, rax
	add	rax, rdx
	add	r14, r9
	vmovsd	xmm3, QWORD PTR [r12+r14*8]
	vfmadd231sd	xmm1, xmm3, QWORD PTR 0[rbp+rax*8]
	vmovsd	QWORD PTR [rbx+r9*8], xmm1
	inc	r9
	cmp	rcx, r9
	jne	.L5
.L6:
	mov	rax, QWORD PTR -16[rsp]
	inc	r13d
	add	rdx, rcx
	add	rbx, rax
	add	r11, rax
	cmp	r10d, r13d
	jne	.L3
	pop	rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	pop	rbp
	.cfi_def_cfa_offset 40
	pop	r12
	.cfi_def_cfa_offset 32
	pop	r13
	.cfi_def_cfa_offset 24
	pop	r14
	.cfi_def_cfa_offset 16
	pop	r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4
	.p2align 3
.L4:
	.cfi_restore_state
	vmovsd	QWORD PTR [rbx+r9*8], xmm1
	inc	r9
	add	r15, 8
	cmp	r9, rcx
	jne	.L9
	jmp	.L6
	.p2align 4
	.p2align 3
.L11:
	xor	eax, eax
	vxorpd	xmm1, xmm1, xmm1
	jmp	.L10
.L18:
	.cfi_def_cfa_offset 8
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	.cfi_restore 14
	.cfi_restore 15
	ret
	.cfi_endproc
.LFE1906:
	.size	_ZL12matmul_naivePKdS0_Pdi, .-_ZL12matmul_naivePKdS0_Pdi
	.p2align 4
	.type	_ZL10matmul_optPKdS0_Pdi, @function
_ZL10matmul_optPKdS0_Pdi:
.LFB1907:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	push	r15
	push	r14
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	movsxd	r14, ecx
	mov	rax, r14
	push	r13
	push	r12
	push	rbx
	imul	rax, r14
	and	rsp, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	mov	rbx, rsi
	mov	r12, r14
	sub	rsp, 96
	mov	QWORD PTR 40[rsp], rdi
	mov	QWORD PTR 88[rsp], rdx
	sal	rax, 3
	je	.L23
	mov	rdi, rdx
	xor	esi, esi
	mov	rdx, rax
	call	memset@PLT
.L23:
	test	r12d, r12d
	jle	.L70
	lea	rax, 0[0+r14*8]
	lea	edx, -3[r12]
	xor	r15d, r15d
	mov	DWORD PTR 68[rsp], 0
	mov	QWORD PTR 32[rsp], rax
	mov	rax, QWORD PTR 40[rsp]
	and	edx, -2
	lea	edi, 2[rdx]
	mov	edx, r12d
	shr	edx, 2
	mov	DWORD PTR 76[rsp], edi
	sal	rdx, 5
	lea	r10, 8[rax]
	lea	rax, [r14+r14]
	mov	QWORD PTR 24[rsp], rax
	lea	eax, -1[r12]
	mov	DWORD PTR 72[rsp], eax
	mov	rax, QWORD PTR 88[rsp]
	.p2align 4
	.p2align 3
.L25:
	xor	ecx, ecx
	cmp	r12d, 2
	jle	.L43
	mov	ecx, DWORD PTR 76[rsp]
	mov	QWORD PTR 80[rsp], r15
	mov	r15, QWORD PTR 24[rsp]
	mov	rdi, r10
	mov	r9, r14
	xor	r8d, r8d
	xor	r11d, r11d
	mov	QWORD PTR 56[rsp], r14
	mov	QWORD PTR 48[rsp], r10
	mov	DWORD PTR 64[rsp], ecx
	.p2align 4
	.p2align 3
.L31:
	cmp	DWORD PTR 72[rsp], 2
	vmovsd	xmm3, QWORD PTR -8[rdi]
	je	.L45
.L28:
	vbroadcastsd	ymm1, QWORD PTR [rdi]
	lea	r10, [rbx+r8*8]
	vbroadcastsd	ymm2, xmm3
	lea	rsi, [rbx+r9*8]
	xor	ecx, ecx
	.p2align 5
	.p2align 4
	.p2align 3
.L40:
	vmovupd	ymm0, YMMWORD PTR [r10+rcx]
	vfmadd213pd	ymm0, ymm2, YMMWORD PTR [rax+rcx]
	vfmadd231pd	ymm0, ymm1, YMMWORD PTR [rsi+rcx]
	vmovupd	YMMWORD PTR [rax+rcx], ymm0
	add	rcx, 32
	cmp	rcx, rdx
	jne	.L40
	mov	ecx, r12d
	and	ecx, -4
	mov	esi, ecx
	cmp	r12d, ecx
	je	.L72
	mov	r10d, r12d
	sub	r10d, ecx
	cmp	r10d, 1
	je	.L29
.L39:
	mov	r14, QWORD PTR 80[rsp]
	vmovddup	xmm1, xmm3
	vmovddup	xmm0, QWORD PTR [rdi]
	lea	r13, [rsi+r14]
	mov	r14, QWORD PTR 88[rsp]
	lea	r13, [r14+r13*8]
	lea	r14, [r9+rsi]
	add	rsi, r8
	vmovupd	xmm4, XMMWORD PTR 0[r13]
	vfmadd132pd	xmm1, xmm4, XMMWORD PTR [rbx+rsi*8]
	vfmadd132pd	xmm0, xmm1, XMMWORD PTR [rbx+r14*8]
	vmovupd	XMMWORD PTR 0[r13], xmm0
	test	r10b, 1
	je	.L30
	and	r10d, -2
	add	ecx, r10d
.L29:
	mov	rsi, QWORD PTR 80[rsp]
	mov	r14, QWORD PTR 88[rsp]
	movsxd	rcx, ecx
	lea	r10, [r9+rcx]
	vmovsd	xmm6, QWORD PTR [rdi]
	add	rsi, rcx
	add	rcx, r8
	vmovsd	xmm5, QWORD PTR [r14+rsi*8]
	vfmadd132sd	xmm3, xmm5, QWORD PTR [rbx+rcx*8]
	vfmadd231sd	xmm3, xmm6, QWORD PTR [rbx+r10*8]
	vmovsd	QWORD PTR [r14+rsi*8], xmm3
.L30:
	add	r11d, 2
	add	r8, r15
	add	r9, r15
	add	rdi, 16
	cmp	r11d, DWORD PTR 76[rsp]
	jne	.L31
.L66:
	mov	r14, QWORD PTR 56[rsp]
	mov	ecx, DWORD PTR 64[rsp]
	mov	r15, QWORD PTR 80[rsp]
	mov	r10, QWORD PTR 48[rsp]
.L43:
	mov	rdi, QWORD PTR 40[rsp]
	movsxd	r8, ecx
	lea	rcx, 0[0+r15*8]
	mov	r9, r14
	imul	r9, r8
	mov	QWORD PTR 56[rsp], rax
	lea	r13, [rdi+rcx]
	add	rcx, QWORD PTR 88[rsp]
.L38:
	cmp	DWORD PTR 72[rsp], 2
	vmovsd	xmm2, QWORD PTR 0[r13+r8*8]
	jbe	.L44
.L35:
	lea	rsi, [rbx+r9*8]
	vbroadcastsd	ymm1, xmm2
	xor	eax, eax
	.p2align 5
	.p2align 4
	.p2align 3
.L33:
	vmovupd	ymm0, YMMWORD PTR [rsi+rax]
	vfmadd213pd	ymm0, ymm1, YMMWORD PTR [rcx+rax]
	vmovupd	YMMWORD PTR [rcx+rax], ymm0
	add	rax, 32
	cmp	rdx, rax
	jne	.L33
	mov	eax, r12d
	and	eax, -4
	mov	esi, eax
	cmp	eax, r12d
	je	.L73
	mov	DWORD PTR 80[rsp], eax
.L32:
	mov	edi, r12d
	sub	edi, esi
	cmp	edi, 1
	je	.L36
	mov	rax, QWORD PTR 88[rsp]
	lea	r11, [rsi+r15]
	add	rsi, r9
	vmovddup	xmm0, xmm2
	vmovupd	xmm7, XMMWORD PTR [rax+r11*8]
	vfmadd132pd	xmm0, xmm7, XMMWORD PTR [rbx+rsi*8]
	vmovupd	XMMWORD PTR [rax+r11*8], xmm0
	test	dil, 1
	je	.L37
	and	edi, -2
	add	DWORD PTR 80[rsp], edi
.L36:
	movsxd	rax, DWORD PTR 80[rsp]
	mov	rdi, QWORD PTR 88[rsp]
	lea	rsi, [rax+r15]
	add	rax, r9
	vmovsd	xmm7, QWORD PTR [rdi+rsi*8]
	vfmadd132sd	xmm2, xmm7, QWORD PTR [rbx+rax*8]
	vmovsd	QWORD PTR [rdi+rsi*8], xmm2
.L37:
	inc	r8
	add	r9, r14
	cmp	r12d, r8d
	jg	.L38
.L68:
	mov	rsi, QWORD PTR 32[rsp]
	mov	rax, QWORD PTR 56[rsp]
	add	r15, r14
	inc	DWORD PTR 68[rsp]
	add	rax, rsi
	add	r10, rsi
	cmp	r12d, DWORD PTR 68[rsp]
	jne	.L25
	vzeroupper
.L70:
	lea	rsp, -40[rbp]
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4
	.p2align 3
.L72:
	.cfi_restore_state
	add	r11d, 2
	cmp	DWORD PTR 76[rsp], r11d
	je	.L66
	add	rdi, 16
	add	r8, r15
	add	r9, r15
	vmovsd	xmm3, QWORD PTR -8[rdi]
	jmp	.L28
.L45:
	mov	r10d, 3
	xor	esi, esi
	xor	ecx, ecx
	jmp	.L39
.L73:
	inc	r8
	cmp	r12d, r8d
	jle	.L68
	vmovsd	xmm2, QWORD PTR 0[r13+r8*8]
	add	r9, r14
	jmp	.L35
.L44:
	xor	esi, esi
	mov	DWORD PTR 80[rsp], 0
	jmp	.L32
	.cfi_endproc
.LFE1907:
	.size	_ZL10matmul_optPKdS0_Pdi, .-_ZL10matmul_optPKdS0_Pdi
	.section	.rodata._ZNSt6vectorIdSaIdEEC2EmRKS0_.str1.8,"aMS",@progbits,1
	.align 8
.LC1:
	.string	"cannot create std::vector larger than max_size()"
	.section	.text._ZNSt6vectorIdSaIdEEC2EmRKS0_,"axG",@progbits,_ZNSt6vectorIdSaIdEEC5EmRKS0_,comdat
	.align 2
	.p2align 4
	.weak	_ZNSt6vectorIdSaIdEEC2EmRKS0_
	.type	_ZNSt6vectorIdSaIdEEC2EmRKS0_, @function
_ZNSt6vectorIdSaIdEEC2EmRKS0_:
.LFB1936:
	.cfi_startproc
	endbr64
	push	rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	mov	rax, rsi
	sub	rsp, 16
	.cfi_def_cfa_offset 32
	shr	rax, 60
	jne	.L82
	mov	rbx, rdi
	test	rsi, rsi
	je	.L83
	lea	rdx, 0[0+rsi*8]
	mov	QWORD PTR 8[rsp], rsi
	mov	rdi, rdx
	mov	QWORD PTR [rsp], rdx
	call	_Znwm@PLT
	mov	rdx, QWORD PTR [rsp]
	cmp	QWORD PTR 8[rsp], 1
	mov	QWORD PTR [rbx], rax
	mov	QWORD PTR [rax], 0x000000000
	lea	rcx, 8[rax]
	lea	r9, [rax+rdx]
	mov	QWORD PTR 16[rbx], r9
	je	.L77
	mov	rdi, rcx
	sub	rdx, 8
	xor	esi, esi
	mov	QWORD PTR 8[rsp], r9
	mov	QWORD PTR [rsp], rax
	call	memset@PLT
	mov	r9, QWORD PTR 8[rsp]
	lea	rcx, [r9+rax]
	sub	rcx, QWORD PTR [rsp]
	sub	rcx, 8
.L77:
	mov	QWORD PTR 8[rbx], rcx
	add	rsp, 16
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	pop	rbx
	.cfi_def_cfa_offset 8
	ret
	.p2align 4
	.p2align 3
.L83:
	.cfi_restore_state
	xor	ecx, ecx
	mov	QWORD PTR [rdi], 0
	mov	QWORD PTR 16[rdi], 0
	mov	QWORD PTR 8[rbx], rcx
	add	rsp, 16
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	pop	rbx
	.cfi_def_cfa_offset 8
	ret
.L82:
	.cfi_restore_state
	lea	rdi, .LC1[rip]
	call	_ZSt20__throw_length_errorPKc@PLT
	.cfi_endproc
.LFE1936:
	.size	_ZNSt6vectorIdSaIdEEC2EmRKS0_, .-_ZNSt6vectorIdSaIdEEC2EmRKS0_
	.weak	_ZNSt6vectorIdSaIdEEC1EmRKS0_
	.set	_ZNSt6vectorIdSaIdEEC1EmRKS0_,_ZNSt6vectorIdSaIdEEC2EmRKS0_
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC2:
	.string	"naive"
.LC4:
	.string	"opt"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC6:
	.string	"mode=%s n=%d checksum=%.6f time=%.3f s\n"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB7:
	.section	.text.startup,"ax",@progbits
.LHOTB7:
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB1908:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA1908
	endbr64
	push	r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	push	r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	push	r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	push	r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	push	rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	push	rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	sub	rsp, 152
	.cfi_def_cfa_offset 208
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR 136[rsp], rax
	xor	eax, eax
	cmp	edi, 1
	jle	.L105
	mov	rax, QWORD PTR 8[rsi]
	mov	r14d, 1024
	mov	QWORD PTR [rsp], rax
	cmp	edi, 2
	jne	.L142
.L85:
	movsxd	rbx, r14d
	lea	rdi, 48[rsp]
	lea	rdx, 112[rsp]
	mov	QWORD PTR 48[rsp], 0
	imul	rbx, rbx
	mov	QWORD PTR 64[rsp], 0
	mov	rsi, rbx
.LEHB0:
	call	_ZNSt6vectorIdSaIdEEC1EmRKS0_
.LEHE0:
	mov	rax, QWORD PTR 64[rsp]
	lea	rdi, 80[rsp]
	lea	rdx, 112[rsp]
	mov	rsi, rbx
	mov	rbp, QWORD PTR 48[rsp]
	mov	QWORD PTR 80[rsp], 0
	mov	QWORD PTR 96[rsp], 0
	mov	QWORD PTR 8[rsp], rax
.LEHB1:
	call	_ZNSt6vectorIdSaIdEEC1EmRKS0_
.LEHE1:
	mov	rax, QWORD PTR 96[rsp]
	lea	rdx, 47[rsp]
	mov	rsi, rbx
	lea	rdi, 112[rsp]
	mov	r12, QWORD PTR 80[rsp]
	mov	QWORD PTR 112[rsp], 0
	mov	QWORD PTR 128[rsp], 0
	mov	QWORD PTR 16[rsp], rax
.LEHB2:
	call	_ZNSt6vectorIdSaIdEEC1EmRKS0_
.LEHE2:
	mov	rax, QWORD PTR 128[rsp]
	mov	edi, 42
	mov	r13, QWORD PTR 112[rsp]
	mov	QWORD PTR 24[rsp], rax
	call	srand@PLT
	test	rbx, rbx
	je	.L86
	xor	r15d, r15d
	.p2align 4
	.p2align 3
.L87:
	call	rand@PLT
	vxorpd	xmm2, xmm2, xmm2
	vcvtsi2sd	xmm0, xmm2, eax
	vdivsd	xmm0, xmm0, QWORD PTR .LC3[rip]
	vmovsd	QWORD PTR 0[rbp+r15*8], xmm0
	call	rand@PLT
	vxorpd	xmm2, xmm2, xmm2
	vcvtsi2sd	xmm0, xmm2, eax
	vdivsd	xmm0, xmm0, QWORD PTR .LC3[rip]
	vmovsd	QWORD PTR [r12+r15*8], xmm0
	inc	r15
	cmp	r15, rbx
	jne	.L87
.L86:
	call	_ZNSt6chrono3_V212steady_clock3nowEv@PLT
	mov	rdi, QWORD PTR [rsp]
	lea	rsi, .LC4[rip]
	mov	rbx, rax
	call	strcmp@PLT
	mov	ecx, r14d
	mov	rdx, r13
	mov	rsi, r12
	mov	rdi, rbp
	test	eax, eax
	jne	.L88
	call	_ZL10matmul_optPKdS0_Pdi
.L89:
	call	_ZNSt6chrono3_V212steady_clock3nowEv@PLT
	mov	rsi, QWORD PTR 120[rsp]
	mov	rdi, rax
	cmp	rsi, r13
	je	.L107
	lea	rcx, -8[rsi]
	mov	rax, r13
	sub	rcx, r13
	cmp	rcx, 16
	jbe	.L108
	shr	rcx, 3
	vxorpd	xmm0, xmm0, xmm0
	inc	rcx
	mov	rdx, rcx
	shr	rdx, 2
	sal	rdx, 5
	add	rdx, r13
	.p2align 5
	.p2align 4
	.p2align 3
.L92:
	vaddsd	xmm0, xmm0, QWORD PTR [rax]
	add	rax, 32
	vaddsd	xmm0, xmm0, QWORD PTR -24[rax]
	vaddsd	xmm0, xmm0, QWORD PTR -16[rax]
	vaddsd	xmm0, xmm0, QWORD PTR -8[rax]
	cmp	rax, rdx
	jne	.L92
	test	cl, 3
	je	.L90
	and	rcx, -4
	lea	rax, 0[r13+rcx*8]
.L91:
	lea	rdx, 8[rax]
	vaddsd	xmm0, xmm0, QWORD PTR [rax]
	cmp	rsi, rdx
	je	.L90
	lea	rdx, 16[rax]
	vaddsd	xmm0, xmm0, QWORD PTR 8[rax]
	cmp	rsi, rdx
	je	.L90
	vaddsd	xmm0, xmm0, QWORD PTR 16[rax]
.L90:
	sub	rdi, rbx
	vxorpd	xmm3, xmm3, xmm3
	mov	rdx, QWORD PTR [rsp]
	mov	ecx, r14d
	vcvtsi2sd	xmm1, xmm3, rdi
	vdivsd	xmm1, xmm1, QWORD PTR .LC5[rip]
	lea	rsi, .LC6[rip]
	mov	edi, 2
	mov	eax, 2
.LEHB3:
	call	__printf_chk@PLT
.LEHE3:
	test	r13, r13
	je	.L94
	mov	rsi, QWORD PTR 24[rsp]
	mov	rdi, r13
	sub	rsi, r13
	call	_ZdlPvm@PLT
.L94:
	test	r12, r12
	je	.L95
	mov	rsi, QWORD PTR 16[rsp]
	mov	rdi, r12
	sub	rsi, r12
	call	_ZdlPvm@PLT
.L95:
	test	rbp, rbp
	je	.L96
	mov	rsi, QWORD PTR 8[rsp]
	mov	rdi, rbp
	sub	rsi, rbp
	call	_ZdlPvm@PLT
.L96:
	mov	rax, QWORD PTR 136[rsp]
	sub	rax, QWORD PTR fs:40
	jne	.L143
	add	rsp, 152
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	xor	eax, eax
	pop	rbx
	.cfi_def_cfa_offset 48
	pop	rbp
	.cfi_def_cfa_offset 40
	pop	r12
	.cfi_def_cfa_offset 32
	pop	r13
	.cfi_def_cfa_offset 24
	pop	r14
	.cfi_def_cfa_offset 16
	pop	r15
	.cfi_def_cfa_offset 8
	ret
.L88:
	.cfi_restore_state
	call	_ZL12matmul_naivePKdS0_Pdi
	jmp	.L89
.L142:
	mov	rdi, QWORD PTR 16[rsi]
	mov	edx, 10
	xor	esi, esi
	call	__isoc23_strtol@PLT
	mov	r14d, eax
	jmp	.L85
.L105:
	lea	rax, .LC2[rip]
	mov	r14d, 1024
	mov	QWORD PTR [rsp], rax
	jmp	.L85
.L107:
	vxorpd	xmm0, xmm0, xmm0
	jmp	.L90
.L108:
	vxorpd	xmm0, xmm0, xmm0
	jmp	.L91
.L143:
	call	__stack_chk_fail@PLT
.L111:
	endbr64
	mov	rbx, rax
	jmp	.L97
.L110:
	endbr64
	mov	rbx, rax
	vzeroupper
	jmp	.L99
.L109:
	endbr64
	mov	rbx, rax
	vzeroupper
	jmp	.L101
	.section	.gcc_except_table,"a",@progbits
.LLSDA1908:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE1908-.LLSDACSB1908
.LLSDACSB1908:
	.uleb128 .LEHB0-.LFB1908
	.uleb128 .LEHE0-.LEHB0
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB1-.LFB1908
	.uleb128 .LEHE1-.LEHB1
	.uleb128 .L109-.LFB1908
	.uleb128 0
	.uleb128 .LEHB2-.LFB1908
	.uleb128 .LEHE2-.LEHB2
	.uleb128 .L110-.LFB1908
	.uleb128 0
	.uleb128 .LEHB3-.LFB1908
	.uleb128 .LEHE3-.LEHB3
	.uleb128 .L111-.LFB1908
	.uleb128 0
.LLSDACSE1908:
	.section	.text.startup
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDAC1908
	.type	main.cold, @function
main.cold:
.LFSB1908:
.L97:
	.cfi_def_cfa_offset 208
	.cfi_offset 3, -56
	.cfi_offset 6, -48
	.cfi_offset 12, -40
	.cfi_offset 13, -32
	.cfi_offset 14, -24
	.cfi_offset 15, -16
	test	r13, r13
	je	.L140
	mov	rsi, QWORD PTR 24[rsp]
	mov	rdi, r13
	sub	rsi, r13
	vzeroupper
	call	_ZdlPvm@PLT
.L99:
	test	r12, r12
	je	.L101
	mov	rsi, QWORD PTR 16[rsp]
	mov	rdi, r12
	sub	rsi, r12
	call	_ZdlPvm@PLT
.L101:
	test	rbp, rbp
	je	.L102
	mov	rsi, QWORD PTR 8[rsp]
	mov	rdi, rbp
	sub	rsi, rbp
	call	_ZdlPvm@PLT
.L102:
	mov	rax, QWORD PTR 136[rsp]
	sub	rax, QWORD PTR fs:40
	jne	.L144
	mov	rdi, rbx
.LEHB4:
	call	_Unwind_Resume@PLT
.LEHE4:
.L144:
	call	__stack_chk_fail@PLT
.L140:
	vzeroupper
	jmp	.L99
	.cfi_endproc
.LFE1908:
	.section	.gcc_except_table
.LLSDAC1908:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSEC1908-.LLSDACSBC1908
.LLSDACSBC1908:
	.uleb128 .LEHB4-.LCOLDB7
	.uleb128 .LEHE4-.LEHB4
	.uleb128 0
	.uleb128 0
.LLSDACSEC1908:
	.section	.text.unlikely
	.section	.text.startup
	.size	main, .-main
	.section	.text.unlikely
	.size	main.cold, .-main.cold
.LCOLDE7:
	.section	.text.startup
.LHOTE7:
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC3:
	.long	-4194304
	.long	1105199103
	.align 8
.LC5:
	.long	0
	.long	1104006501
	.hidden	DW.ref.__gxx_personality_v0
	.weak	DW.ref.__gxx_personality_v0
	.section	.data.rel.local.DW.ref.__gxx_personality_v0,"awG",@progbits,DW.ref.__gxx_personality_v0,comdat
	.align 8
	.type	DW.ref.__gxx_personality_v0, @object
	.size	DW.ref.__gxx_personality_v0, 8
DW.ref.__gxx_personality_v0:
	.quad	__gxx_personality_v0
	.globl	__gxx_personality_v0
	.ident	"GCC: (Ubuntu 15.2.0-16ubuntu1) 15.2.0"
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
