#Luiz Flávio Pereira ra91706 => Exercício 3a

.section .data
	output: .ascii "O fabricante 'xxxxxxxxxxxx' foi identificado\n"

.section .text

.globl _start

_start:
	movl $0, %eax
	cpuid
	movl $output,%edi
	movl %ebx, 14(%edi)
	movl %edx, 18(%edi)
	movl %ecx, 22(%edi)
	movl $4, %eax
	movl $1, %ebx
	movl $output, %ecx
	movl $45, %edx
	int $0x80
	movl $1, %eax
	movl $0, %ebx
	int $0x80
