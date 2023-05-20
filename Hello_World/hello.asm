section .data
	hello db "Hello World !", 10
	hello_len equ $-hello	

section .text
	global _start

_start:
	; Hello World !
	mov rax, 1
	mov rdi, 1
	lea rsi, hello
	lea rdx, hello_len
	syscall
	
	; Exit
	mov rax, 60
	mov rdi, 1 
	syscall
