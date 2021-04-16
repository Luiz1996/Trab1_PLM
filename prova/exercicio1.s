#Luiz Flávio Pereira ra91706 => Exercício 1

.section .data

        abert:  .asciz  "\n\n--------------------------------------------\n\n\nPrograma para Identificar Tipos de Triangulos\n\n"
        pedeA:  .asciz  "\nInforme o angulo A: => "
        pedeB:  .asciz  "\nInforme o angulo B: => "
        pedeC:  .asciz  "\nInforme o angulo C: => "
        tpEqu:  .asciz  "\nO triangulo eh Equilatero\n\n--------------------------------------------\n\n"
        tpIso:  .asciz  "\nO triangulo eh Isosceles\n\n--------------------------------------------\n\n"
        tpEsc:  .asciz  "\nO triangulo eh Escaleno\n\n--------------------------------------------\n\n"
        denovo: .asciz  "Deseja continuar [s]im/[n]ao?\nR:"
	num:    .asciz  "%d"
	char:   .asciz  " %c"

	dNv:    .byte  'n'

        a:     .int    0
        b:     .int    0
        c:     .int    0

.section .text
.globl _start

_start:
	pushl $abert
	call printf
	
        pushl $pedeA
        call printf

        pushl $a
        pushl $num
        call scanf

        pushl $pedeB
        call printf

        pushl $b
        pushl $num
        call scanf

        pushl $pedeC
        call printf

        pushl $c
        pushl $num
        call scanf

        #atualizando a pilha
        addl $40, %esp

        movl b, %eax
        cmpl a, %eax
        je a_igual_b
        
compara_a_c:
	movl a, %eax
	cmpl c, %eax
	je eh_isosceles

compara_b_c:
	movl b, %eax
	cmpl c, %eax
	je eh_isosceles
	jmp eh_escaleno

b_maior_a:
        cmpl c, %eax
        je eh_isosceles
        jg eh_escaleno

a_igual_b:
        cmpl c, %eax
        je eh_equilatero
        jmp eh_isosceles

eh_escaleno:
        pushl $tpEsc
        call printf
        addl $4, %esp
        jmp fim

eh_isosceles:
        pushl $tpIso
        call printf
        addl $4, %esp
        jmp fim

eh_equilatero:
        pushl $tpEqu
        call printf
        addl $4, %esp
        jmp fim

fim:
        pushl $denovo
	call printf

	pushl $dNv
	pushl $char
	call scanf

	movb dNv, %al
	cmpb $'s', %al
	je _start	

	pushl $0
        call exit
