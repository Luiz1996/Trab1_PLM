.section .data
	saida: .asciz "Teste %d: O valor do registrador é: %X\n\n"
	saida2: .asciz "Teste %d: Os valores dos registradores sao: %X e %X\n\n"
	saida3: .asciz "Teste %d:\n EAX = %X\n EBX = %X\n ECX = %X\n EDX = %X\n ESI = %X\n EDI = %X\n\n"

.section .text

.globl _start

_start:

# teste 1
	movl $0x12345678, %ebx
	pushl %ebx
	pushl $1
	pushl $saida
	call printf

# teste 2
	movw $0xABCD, %bx
	pushl %ebx
	pushl $2
	pushl $saida
	call printf

# teste 3
	movb $0xEE, %bh
	movb $0xFF, %bl
	pushl %ebx
	pushl $3
	pushl $saida
	call printf
	
	addl $36, %esp #desfazendo todos os últimos 9 pushs para limpar a pilha

	pushl $0
	call exit

# teste 4:
	movl $0xAAAAAAAA, %eax
	movl $0xBBBBBBBB, %ebx
	movl $0xCCCCCCCC, %ecx
	movl $0xDDDDDDDD, %edx
	movl $0xEEEEEEEE, %esi
	movl $0xFFFFFFFF, %edi

	pushl %edi
	pushl %esi
	pushl %edx
	pushl %ecx
	pushl %ebx
	pushl %eax
	pushl $4
	pushl $saida3
	call printf

# teste 5
	pushl %edi
	pushl %esi
	pushl %edx
	pushl %ecx
	pushl %ebx
	pushl %eax
	pushl $5
	pushl $saida3
	call printf

	addl $40, %esp #desempilha os últimos 10 pushs para liberar os registradores backupeados

# teste 6
	popl %eax
	popl %ebx
	popl %ecx
	popl %edx
	popl %esi
	popl %edi

	pushl %edi
	pushl %esi
	pushl %edx
	pushl %ecx
	pushl %ebx
	pushl %eax
	pushl $6
	pushl $saida3
	call printf

	addl $32, %esp #desempilha os 8 últimos pushs

# 5) 
	movl $0x12345678, %eax
	roll $16, %eax
	rolw $8, %ax
	rolb $4, %al
	pushl %eax
	pushl $7
	pushl $saida
	call printf
	movl $0x12345678, %eax
	roll $8, %eax
	rolw $4, %ax
	rolb $4, %al
	pushl %eax
	pushl $8
	pushl $saida
	call printf

	addl $24, %esp #desempilha os últimos 6 pushs

# 6)
	movl $0x12345678, %eax
	rorl $16, %eax
	rorw $8, %ax
	rorb $4, %al
	pushl %eax
	pushl $9
	pushl $saida
	call printf
	movl $0x12345678, %eax
	rorl $8, %eax
	rorw $4, %ax
	rorb $4, %al
	pushl %eax
	pushl $10
	pushl $saida
	call printf

	addl $24, %esp #desempilha os últimos 6 pushs

# 7)
	movl $0x12345678, %eax
	salb $4, %al
	salw $8, %ax
	sall $16, %eax
	pushl %eax
	pushl $11
	pushl $saida
	call printf
	movl $0x12345678, %eax
	salb $4, %al
	salw $4, %ax	
	sall $8, %eax
	pushl %eax
	pushl $12
	pushl $saida
	call printf

	addl $24, %esp #desempilha os últimos 6 pushs

# 8)
	movl $0x12345678, %eax
	sarl $16, %eax
	sarw $8, %ax
	sarb $4, %al
	pushl %eax
	pushl $13
	pushl $saida
	call printf
	movl $0x12345678, %eax
	sarl $8, %eax
	sarw $4, %ax
	sarb $4, %al
	pushl %eax
	pushl $14
	pushl $saida
	call printf
	
	addl $24, %esp #desempilha os últimos 6 pushs

# 9)
	movl $0x12341234, %eax
	movl $0xabcdabcd, %ebx
	xchgb %al, %bl
	xchgw %ax, %bx
	xchgl %eax, %ebx
	pushl %ebx
	pushl %eax
	pushl $15
	pushl $saida2
	call printf
	
	addl $16, %esp #desempilha os últimos 4 pushs
