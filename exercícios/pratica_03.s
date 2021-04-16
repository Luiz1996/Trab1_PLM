.section .data
	output: .asciz "O ID do fabricante eh 'xxxxxxxxxxxx'\n"

.section .text

.globl _start

_start:

	movl $0, %eax
	cpuid

	movl $output,%edi
	movl %ebx, 23(%edi) # desloca 23 bytes a partir da area apontada
	movl %edx, 27(%edi) # desloca 27 bytes a partir da area apontada
	movl %ecx, 31(%edi) # desloca 31 bytes a partir da area apontada

	pushl $output
	call printf
	addl $4, %esp

	pushl $0
	call exit
