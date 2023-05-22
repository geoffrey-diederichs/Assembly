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

section .bss
	choice resb 2
	num resb 2
	
section .data
	msg1 db "Give a number between 0 and 9 : "
	msg1_len equ $-msg1
	msg2 db "1 - Check if even", 10, "2 - Check if odd", 10, "3 - Check if greater then 5", 10, "Choose an option : "
	msg2_len equ $-msg2	
	msg3 db "The given number is even.", 10
	msg3_len equ $-msg3
	msg4 db "The given number is odd.", 10
	msg4_len equ $-msg4
	msg5 db "The given number is greater than 5.", 10
	msg5_len equ $-msg5
	msg6 db "The given number is less than, or equal to 5.", 10
	msg6_len equ $-msg6
	number2 db "2", 10
	number5 db "5", 10

section .text
	global _start

_start:
	; Asking for the number
	print msg1, msg1_len
	user_input num, 2
	
	; Asking to choose option
	print msg2, msg2_len
	user_input choice, 2

	; Moving choice into register, comparing it, and jumping accordingly
	mov ax, [choice]
	cmp ax, [number2]
	jl _even
	je _odd
	jg _greater

; Determines if even
_even:
	; Uses logical AND to determine if even, if not jumps to _odd
	mov ax, [num]
	and ax, 01H
	jne _odd
	
	; Says the number is even, jumps to _exit
	print msg3, msg3_len
	jmp _exit	

; Determines if odd
_odd:
	; Uses logical AND to determine if even, if it is jumps to _even
	mov ax, [num]
	and ax, 01H
	je _even
	
	; Says the number is odd, jumps to _exit
	print msg4, msg4_len
	jmp _exit

; Determines if greater than 5
_greater:
	; If number less than or equal to 5, jumps to _less
	mov ax, [num]
	cmp ax, [number5]
	jle _less
	
	; Says the number is greater than 5, jumps to _exit
	print msg5, msg5_len
	jmp _exit	

; Says the number is less than or equal to 5, jumps to _exit
_less:
	print msg6, msg6_len
	jmp _exit

_exit:
	mov rax, 60
	mov rdi, 1 
	syscall
		
