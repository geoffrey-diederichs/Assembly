; Printing the given string
%macro print 2
	mov rax, 1
	mov rdi, 1
	lea rsi, %1
	lea rdx, %2
	syscall
%endmacro

; Storing user input in given variable
%macro user_input 2
	mov rax, 0
	mov rdi, 1
	mov rsi, %1
	mov rdx, %2
	syscall
%endmacro

; Uninitialized data
section .bss
	resp resb 50
	resp_len equ $-resp	

section .data
	hello db "Hello, what's your name ?", 10
	hello_len equ $-hello
	bye db "Goodbye", 32 
	bye_len equ $-bye

section .text
	global _start

_start:
	; Asking for the user's name
	print hello, hello_len	
	
	; Getting user input
	user_input resp, resp_len
	
	; Saying good bye
	print bye, bye_len
	print resp, resp_len

	; Exit	
	mov rax, 60
	mov rdi, 1 
	syscall
