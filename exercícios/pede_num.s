.section .data
	abertura: .asciz "\nTeste de programa\n\n"
	pedeNum:  .asciz "Digite um numero:"
	printNum: .asciz "\nO numero digitado eh %d\n\n"
	formatoN: .asciz "%d"

	num:      .int 0

.section .text

.globl _start

_start:
	#imprimindo a abertura
	pushl $abertura
	call printf

	#pedindo numero
	pushl $pedeNum
	call printf

	pushl $num
	pushl $formatoN
	call scanf

	#imprimindo numero digitado
	pushl num
	pushl $printNum
	call printf

	#atualizando topo da pilha
	addl $24, %esp

	#finalizando programa
	pushl $0
	call exit
