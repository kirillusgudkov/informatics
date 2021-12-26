%include "io.inc"

section .text
global CMAIN
CMAIN:
    XOR ECX, ECX   
    LEA EBX, [a]
    MOV EDI, 4
    MOV ESI, 0
    MOV DL, 2         ;заданное число
Next:
    CMP EDI, ESI
    je Exit
    MOV AH, 0
    MOV Al, [EBX+ESI]
    DIV DL
    CMP AH, 0
    JE Label1
    INC ESI
    JMP Next
Label1:
    INC ECX
    INC ESI
    JMP Next
    
Exit:
    PRINT_DEC 4, ECX
    RET
    
section .data
a: db 19, 16, 13, 0