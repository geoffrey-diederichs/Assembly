; Printing given string
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

; Exiting program
%macro exit 0
	mov rax, 60
	mov rdi, 1 
	syscall
%endmacro

section .bss
	num1 resb 2
	num2 resb 2
	res resb 1 

section .data
	msg1 db "Give the first number (0-9) : "
	msg1_len equ $-msg1
	msg2 db "Give the second number (0-9) : "
	msg2_len equ $-msg2
	msg3 db "Result is : "
	msg3_len equ $-msg3
	newline db 10

section .text
	global _start

_start:
	; Asking for the numbers to multiply 	
	print msg1, msg1_len
	user_input num1, 2
	print msg2, msg2_len
	user_input num2, 2

	; Moving numbers to register
	; Subtracting '0' to convert to decimal
	mov al, [num1]
	mov bl, [num2]
	sub al, '0'
	sub bl, '0'

	; Dividing the numbers
	div bl
	
	; Adding '0' to convert to ascii
	; Moving the result into res
	add al, '0'
	mov [res], rax

	; Printing the result
	print msg3, msg3_len
	print res, 1 
	print newline, 1

	exit
