; Contador com Atraso Simplificado para 8051
; Evita loops aninhados que podem causar problemas

    ORG 0000H
START:
    ; Inicializa P1 (tudo apagado)
    MOV P1, #0FFH
    
    ; Mostra dígito 9
    MOV P1, #6FH
    
    ; Atraso simples sem loops aninhados
    MOV R7, #25

DELAY_0:
    DJNZ R7, DELAY_0
    
    ; Mostra dígito 1
    MOV P1, #06H
    
    ; Atraso simples
    MOV R7, #25

DELAY_1:
    DJNZ R7, DELAY_1
    
    ; Mostra dígito 2
    MOV P1, #5BH
    
    ; Atraso simples
    MOV R7, #25

DELAY_2:
    DJNZ R7, DELAY_2
    
    ; Mostra dígito 3
    MOV P1, #4FH
    
    ; Atraso simples
    MOV R7, #25

DELAY_3:
    DJNZ R7, DELAY_3
    
    ; Mostra dígito 4
    MOV P1, #66H
    
    ; Atraso simples
    MOV R7, #25

DELAY_4:
    DJNZ R7, DELAY_4
    
    ; Mostra dígito 5
    MOV P1, #6DH
    
    ; Atraso simples
    MOV R7, #25

DELAY_5:
    DJNZ R7, DELAY_5
    
    ; Mostra dígito 6
    MOV P1, #7DH
    
    ; Atraso simples
    MOV R7, #25

DELAY_6:
    DJNZ R7, DELAY_6
    
    ; Mostra dígito 7
    MOV P1, #07H
    
    ; Atraso simples
    MOV R7, #25

DELAY_7:
    DJNZ R7, DELAY_7
    
    ; Mostra dígito 8
    MOV P1, #7FH
    
    ; Atraso simples
    MOV R7, #25

DELAY_8:
    DJNZ R7, DELAY_8
    
    ; Mostra dígito 9
    MOV P1, #6FH
    
    ; Atraso simples
    MOV R7, #25

DELAY_9:
    DJNZ R7, DELAY_9
    
    ; Volta ao início
    JMP START
    
END