.section .data
	output: .asciz "O ID do fabricante eh '%s'\n"

.section .bss

.lcomm fabri, 16

.section .text
	
.globl _start

_start:
	movl $0, %eax
	cpuid

	movl $fabri,%edi
	movl %ebx, 0(%edi) # desloca 0 na area apontada
	movl %edx, 4(%edi) # desloca 4 na area apontada
	movl %ecx, 8(%edi) # desloca 8 na area apontada
	movl $0, 12(%edi) # caractere final de string na 13o posição mas que ocupa os 4 ultimos bytes

	pushl $fabri
	pushl $output
	call printf
	popl %eax
	popl %eax

	pushl $0
	call exit
