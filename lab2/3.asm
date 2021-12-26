%include "io.inc"

section .text
global CMAIN
CMAIN:
    ;Selection sort
    MOV ebp, esp
    LEA esi, [array]        ;Загружаем адрес первого эл-та
    LEA edx, [esi]          ;Запоминаем значение
    LEA edi, [arrayLen+esi] ;Загружаем длину массива n
IterationI:                 ;for i = 0 to n-1
    CMP edi, esi
    JE End                  ;if i = n
    MOV ebx, esi            ;imin = i
    MOV ecx, esi
    INC ecx                 ;j = i+1
IterationJ: 
    MOV ah, [ecx]           ;array[j]
    MOV al, [ebx]           ;array[imin]
    CMP edi, ecx
    JE Comparison           ;if j = n
    CMP ah, al      
    JA IncJ                 ;if array[j] > array[imin]
    MOV ebx, ecx            ;imin = j
    JMP IncJ
IncJ:
    INC ecx
    JMP IterationJ         
Comparison:
    MOV ah, [esi]
    CMP esi, ebx            
    JE IncI                 ;if i = imin
    MOV [esi], al           ;array[i] = array[imin]
    MOV [ebx], ah           ;array[imin] = array[i]
    JMP IncI
IncI:
    INC esi
    JMP IterationI    
End:
    PRINT_DEC 1, [edx]      ;Выводим отсортированный массив
    NEWLINE
    INC edx
    CMP edi, edx
    JA End
    ret  
    
section .data
array: db 11, 5, 6, 7, 23, 16
arrayLen: equ $-array