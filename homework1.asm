%include "asm_io.inc"
segment .text
global asm_main
asm_main:
	enter 0,0
	pusha

	call read_int
	mov ecx, eax
	call read_int
	mov edx, eax

	mov eax, ecx
	add eax, eax
	add eax, eax
	add eax, ecx
	sub eax, 53
	
	mov esi, edx
	add edx, 68

	sub eax, edx

	add eax, eax
	add eax, eax
	sub eax, esi

	call print_int

	popa
	leave
	ret
