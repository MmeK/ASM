%include%include "asm_io.inc"
segment .text
global asm_main
asm_main:
	enter 0,0
	pusha
	mov edx,0
	mov ecx,0
	mov edi,0
	mov esi,0
	
	l1:
	call read_int
	cmp eax, 0
	jne not_tensor
		inc edx
		jmp l1
	not_tensor:
	cmp eax,1
	jne not_keras
		inc edi
		jmp l1
	not_keras:
	cmp eax,2
	jne not_any
		inc esi
		jmp l1
	not_any:		;input finished, calculating maximum
	
	cmp edx,esi
	jnae l2
					;edx>=esi
		cmp edx,edi
		jnae l3		;edx>=edi edx is max
			mov ecx, edx
			jmp endmax
		l3:
					;edi>edx edi is max
			mov ecx,edi
			jmp endmax
	l2:
					;esi>edx
		cmp esi,edi
		jnae l4
					;esi>=edi esi is max
			mov ecx, esi
			jmp endmax
		l4:
					;edi>esi edi is max
			mov ecx, edi
			jmp endmax
	endmax:
					;max calculated, printing chart
	chart_loop:
		mov eax,124
		call print_char
		mov eax,32
		call print_char
		call print_char
		cmp edx,ecx
		jnae l5
			mov eax,42
			call print_char
			jmp endif1
		l5:
		mov eax,32
		call print_char
		endif1:
		mov eax,32
		call print_char
		call print_char
		cmp edi,ecx
		jnae l6
			mov eax,42
			call print_char
			jmp endif2
		l6:
		mov eax,32
		call print_char
		endif2:
		mov eax,32
		call print_char
		call print_char
		cmp esi,ecx
		jnae l7
			mov eax,42
			call print_char
			jmp endif3
		l7:
		mov eax,32
		call print_char
		endif3:
		mov eax,32
		call print_char
		call print_char
		mov eax,124
		call print_char
		call print_nl
		dec ecx
		jnz chart_loop
	
	popa
	leave
	ret