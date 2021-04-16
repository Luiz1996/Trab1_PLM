.section .data
	pdN:	.asciz "Digite um numero: "
	m1: 	.asciz "os numeros sao iguais\n"
	m2: 	.asciz "o primeiro numero informado eh menor\n"
	m3: 	.asciz "o primeiro numero informado eh maior\n"
	fmt: 	.asciz "%d"

	n1:	.int 0
	n2: 	.int 0

.section .text

.globl _start

_start:
	pushl $pdN
	call printf

	pushl $n1
	pushl $fmt
	call scanf

	pushl $pdN
        call printf

        pushl $n2
        pushl $fmt
        call scanf

	mov n1, %eax
	cmpl n2, %eax
	je igual
	jg maior

menor:
	pushl $m2
	call printf
	jmp fim

igual:
	pushl $m1
	call printf
	jmp fim

maior: 
	pushl $m3
	call printf
	jmp fim

fim:
	#atualizando a pilha
	addl $28, %esp

	#finalizando o programa		
	pushl $0
	call exit
