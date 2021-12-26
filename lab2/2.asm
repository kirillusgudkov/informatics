%include "io.inc"

section .text
global CMAIN
CMAIN:
    LEA ESI, [a]
    MOV AL, [ESI]
    AND AL, 0XF8 ;МАСКИРУЕМ ПЕРВЫЕ 5 БИТ
    SHR AL, 3 ;СДВИГАЕМ ИХ НА 3 ВПРАВО
    PRINT_DEC 1, AL
    NEWLINE
    MOV BL, [ESI]
    AND BL, 0X07 ;МАСКИРУЕМ ПОСЛЕДНИЕ 3 БИТА ПЕРВОГО БАЙТА
    SHL BL, 2 ;СДВИГАЕМ ИХ НА 2 ВЛЕВО
    INC ESI
    MOV AL, [ESI] ;ЗАГРУЖАЕМ СЛЕДУЮЩИЙ БАЙТ
    AND AL, 0xC0 ;МАСКИРУЕМ ПЕРВЫЕ 2 БИТА
    SHR AL, 6 ;СДВИГАЕМ ИХ НА 6 ВПРАВО
    OR AL, BL ;ОБЪЕДИНЯЕМ БИТЫ В ОДИН РЕГИСТР
    PRINT_DEC 1, AL
    NEWLINE
    MOV AL, [ESI]
    AND AL, 0x3E
    SHR AL, 1
    PRINT_DEC 1, AL
    NEWLINE
    MOV BL, [ESI]
    AND BL, 0x01
    SHL BL, 4
    INC ESI
    MOV AL, [ESI]
    AND AL, 0xF0
    SHR AL, 4
    OR AL, BL
    PRINT_DEC 1, AL
    NEWLINE
    MOV BL, [ESI]
    AND BL, 0x0F
    SHL BL, 1
    INC ESI
    MOV AL, [ESI]
    AND AL, 0x80
    SHR AL, 7
    OR AL, BL
    PRINT_DEC 1, AL
    NEWLINE
    MOV AL, [ESI]
    AND AL, 0x7C
    SHR AL, 2
    PRINT_DEC 1, AL
    NEWLINE
    MOV BL, [ESI]
    AND BL, 0x03
    SHL BL, 3
    INC ESI
    MOV AL, [ESI]
    AND AL, 0xE0
    SHR AL, 5
    OR AL, BL
    PRINT_DEC 1, AL
    NEWLINE
    MOV AL, [ESI]
    AND AL, 0x1F
    PRINT_DEC 1, AL
    NEWLINE
    RET
section .data
a: db 0xCC, 0x7E, 0x87, 0x60, 0xC0

;Пакуем по 5 бит
;25 17 31 8 14 24 6 0
;11001 10001 11111 01000 01110 11000 00110 00000
;11001100 01111110 10000111 01100000 11000000
;0xCC 0x7E 0x87 0x60 0xC0

