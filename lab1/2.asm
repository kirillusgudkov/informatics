%include "io.inc"

; (a-b)/c {7, 16, 19}

section .text
global CMAIN
CMAIN:
MOV EBP, ESP ;for currect debugging
FLD DWORD [a]
FLD DWORD [b]
FSUB
FLD DWORD [c]
FDIV
FST DWORD [result]
PRINT_HEX 4, [result]
RET

section .data
a dd 0x40e00000
b dd 0x41800000
c dd 0x41980000
result dd 0x00000000