org 0x7C00
bits 16

%define ENDL 0xD, 0xA

start:
	jmp main

puts:
	push si
	push ax

.loop
	lodsb
	or al, al
	jz .done

	mov ah, 0xE
	mov bh, 0
	int 0x10

	jmp .loop

.done:
	pop ax
	pop si
	ret

main:
	; startup data segments 
	mov ax, 0	; write 0 to ds/es
	mov ds, ax
	mov es, ax

	; setup stack
	mov ss, ax
	mov sp, 0x7C00

	mov si, msg_hello
	call puts

	jmp .halt

.halt:
	hlt
	jmp .halt

msg_hello: db "Hello World! This System is made by LFF5644", ENDL, 0

times 510-($-$$) db 0
dw 0AA55h
