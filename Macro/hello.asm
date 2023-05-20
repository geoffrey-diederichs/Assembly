%macro print 2
	mov rax, 1
	mov rdi, 1
	lea rsi, %1
	lea rdx, %2
	syscall
%endmacro

section .data
	hello db "Hello World !", 10
	hello_len equ $-hello	

section .text
	global _start

_start:
	; Hello World !
	print hello, hello_len	

	; Exit	
	mov rax, 60
	mov rdi, 1 
	syscall
