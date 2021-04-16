		.text
Message:	.asciz "Hello World!"
_main:
	push $Message
	call _puts
	add $4, %esp
	ret
	.global _main
