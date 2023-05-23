; Printing given string
%macro print 2
	mov rax, 1
	mov rdi, 1
	lea rsi, %1
	lea rdx, %2
	syscall
%endmacro

section .bss
	
section .data
	ite db "0"
	ite_len equ $-ite	
	newline db 10	

section .text
	global _start

_start:
	; Printing ite
	print ite, ite_len
	print newline, 1
	
	; Moving ite into rax and increasing it by 1
	mov al, [ite]
	sub al, "0"
	inc al
	
	; If rax over 9, exit
	cmp al, 9
	jg _exit	
	
	; If not, moves it back to ite and repeat
	add al, "0"
	mov [ite], al	
	jmp _start

_exit:
	mov rax, 60
	mov rdi, 1 
	syscall	
