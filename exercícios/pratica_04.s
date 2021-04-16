.section .data
	saida: .asciz "Soma: %d + %d + %d = %d\n"
	n1: .int 10
	n2: .int 25
	n3: .int 5
	vl: .int 10, 25, 5

.section .bss
	.lcomm res, 4  

.section .text
.globl _start
_start:

	movl n3, %eax 	
	addl n2, %eax
	addl n1, %eax
	movl %eax, res

	push res
	push n3
	push n2
	push n1
	push $saida

	call printf
	addl $20, %esp

	movl $vl, %edi
	movl (%edi), %eax
	addl $4, %edi
	addl (%edi), %eax
	addl $4, %edi
	addl (%edi), %eax
	movl %eax, res

	push res
	push n3
	push n2
	push n1
	push $saida
	call printf

	push $0
	call exit
