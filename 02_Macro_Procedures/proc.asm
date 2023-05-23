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
	lea rsi, [hello]
	lea rdx, [hello_len]
	call _print
	
	; Getting user input
	lea rsi, [resp]
	lea rdx, [resp_len]
	call _input
	
	; Saying good bye
	lea rsi, [bye]
	lea rdx, [bye_len]
	call _print	
	lea rsi, [resp]
	lea rdx, [resp_len]
	call _print

	; Exiting
	call _exit

; Calling sys_write
_print:
	mov rax, 1
	mov rdi, 1
	syscall
	ret

; Calling sys_read
_input:
	mov rax, 0
	mov rdi, 1
	syscall
	ret

_exit:
	mov rax, 60
	mov rdi, 1 
	syscall
