%include "io.inc"

;maxim from 3

section .text
global CMAIN
CMAIN:
MOV AH, [a]
MOV AL, [b]
CMP AH, AL
JA AC
MOV AH, [c]
CMP AL, AH
JA B
JMP C
B:
PRINT_DEC 1, [b]
RET
C:
PRINT_DEC 1, [c]
RET
AC:
MOV AL, [c]
CMP AH, AL
JA A
PRINT_DEC 1, [c]
RET
A:
PRINT_DEC 1, [a]
RET

section .data
a: db 5
b: db 58
c: db 46