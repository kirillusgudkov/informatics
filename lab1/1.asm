%include "io.inc"

;(a-b)/c {7, 16, 19}

section .text
global CMAIN
CMAIN:
mov ebp, esp; for correct debugging
mov DX, 0xFFFF
MOV AX, [a]
SUB AX, [b];(a-b)
MOV BX, [c]
IDIV BX ;division with sing
PRINT_DEC 4, AX ;quotient
NEWLINE
PRINT_DEC 4, DX ;remainder
RET

section .data
a dw 0x0007
b dw 0x0010
c dw 0x0013