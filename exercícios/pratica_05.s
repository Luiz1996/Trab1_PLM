.section .data
	
	abertura: .asciz "\nPrograma para calcular area retangulo\n"
	saida:    .asciz "\nArea = %d\n"  

	peden1:   .asciz "\nEntre com o valor de n1 = "
	peden2:   .asciz "\nEntre com o valor de n2 = "
	
	formato:  .asciz "%d"


	n1:  .int 0
	n2:  .int 0
	res: .int 0
 

.section .text

.globl _start

_start:

	pushl $abertura
	call printf

	pushl $peden1
	call printf
	pushl $n1
	pushl $formato
	call scanf

	pushl $peden2
	call printf
	pushl $n2
	pushl $formato
	call scanf

	movl n1, %eax
	mull n2
	movl %eax, res
	
	pushl res
	pushl $saida
	call printf
	addl $48, %esp

	pushl $0
	call exit
