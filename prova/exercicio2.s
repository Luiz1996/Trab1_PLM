#Luiz Flávio Pereira ra91706 => Exercício 2

.section .data

	abertura:	.asciz	"\nCalculo de Área\n"
	opcoes:		.asciz	"\nMenu de Opcoes:\n<1> Retangulo\n<2> Triangulo\n<3> Circunferencia\n<0> Sair\n>"
	
	retang:		.asciz	"\nRetangulo\n"
	triang:		.asciz	"\nTriangulo\n"
	circun:		.asciz	"\nCirunferencia\n"

	lado1ret:	.asciz	"\Informe o lado 1 do retangulo = "
	lado2ret:	.asciz	"\Informe o lado 2 do retangulo = "
	base_tri:	.asciz	"\Informe a base do triangulo = "
	altu_tri:	.asciz	"\Informe a altura do triangulo = "
	raio_cir:	.asciz	"\Informe o raio da circunferencia = "

	resp:		.asciz	"\nArea = %d\n\n"

	num:		.asciz	"%d"

	opcao:		.int	0
	lado1:		.int	0
	lado2:		.int	0
	base:		.int	0
	altura:		.int	0
	raio:		.int	0
	area:		.int	0

	pi:			.int    3

.section .text

.globl _start

_start:	

	pushl $abertura	
	call printf
	pushl $opcoes
	call printf
	pushl $opcao
	pushl $num
	call scanf

	movl opcao, %eax
	cmpl $1, %eax
	je _calc_ret

	cmpl $2, %eax
	je _calc_tri

	cmpl $3, %eax
	je _calc_circ

	jmp	fim


_calc_ret:
	call calc_ret
	jmp	fim

_calc_tri:
	call calc_tri
	jmp	fim

_calc_circ:
	call calc_circ
	jmp	fim

fim:
	pushl $0
	call exit

calc_ret:
	pushl $retang
	call printf
	pushl $lado1ret
	call printf
	pushl $lado1
	pushl $num
	call scanf
	pushl $lado2ret
	call printf
	pushl $lado2
	pushl $num
	call scanf
	movl lado2,%eax
	mull lado1
	movl %eax, area
	pushl %eax
	pushl $resp
	call printf
	addl $36, %esp
	ret 

calc_tri:
	pushl $triang
	call printf
	pushl $base_tri
	call printf
	pushl $base
	pushl $num
	call scanf
	pushl $altu_tri
	call printf
	pushl $altura
	pushl $num
	call scanf
	movl base,%eax
	mull altura
	movl $0, %edx
	movl $2, %ebx
	divl %ebx
	movl %eax, area
	pushl %eax
	pushl $resp
	call printf
	addl $36, %esp
	ret

calc_circ:
	pushl $circun
	call printf
	pushl $raio_cir
	call printf
	pushl $raio
	pushl $num
	call scanf
	movl raio,%eax
	mull raio
	mull pi
	movl %eax, area
	pushl %eax
	pushl $resp
	call printf
	addl $24, %esp
	ret