;
; A boot sector that prints a string using our function.
;
[org 0x7c00] ; Tell the assembler where this code will be loaded

call print_nl

mov bx, HELLO_MSG 
call print_string

call print_nl

mov bx, GOODBYE_MSG 
call print_string

call print_nl

mov dx, 0x12fe
call print_hex

jmp $

%include "print_func.asm"
%include "print_hex.asm"

; Data

HELLO_MSG:
    db 'Hello, World!', 0 ; <-- The zero on the end tells our routine

GOODBYE_MSG:
    db 'Goodbye!', 0

; Padding and magic number. 
times 510-($-$$) db 0
dw 0xaa55