; Contador com Atraso Usando Timer 0 em Modo 2 para 8051
; Usando Timer 0 em Modo 2 para gerar o atraso de 100 ms

ORG 0000H          ; Endereço inicial do programa

START:
    ; Configura o Timer 0 em modo 2 (8-bit auto-reload)
    MOV TMOD, #02H      ; Timer 0 em Modo 2 (8-bit auto-reload)

    MOV P1, #6FH	; Mostra dígito 9 (#6FH)
    CALL DELAY 		; Atraso usando o Timer 0

    MOV P1, #7FH	; Mostra dígito 8 (#7FH)
    CALL DELAY		; Atraso usando o Timer 0

    MOV P1, #07H	; Mostra dígito 7 (#07H)
    CALL DELAY		; Atraso usando o Timer 0

    MOV P1, #7DH	; Mostra dígito 6 (#7DH)
    CALL DELAY		; Atraso usando o Timer 0

    MOV P1, #6DH	; Mostra dígito 5 (#6DH)
    CALL DELAY		; Atraso usando o Timer 0

    MOV P1, #66H	; Mostra dígito 4 (66H)
    CALL DELAY		; Atraso usando o Timer 0

    MOV P1, #4FH	; Mostra dígito 3 (#4FH)
    CALL DELAY		; Atraso usando o Timer 0

    MOV P1, #5BH	; Mostra dígito 2 (#5BH)
    CALL DELAY		; Atraso usando o Timer 0

    MOV P1, #06H	; Mostra dígito 1 (#06H)
    CALL DELAY		; Atraso usando o Timer 0

    MOV P1, #3FH	; Mostra dígito 0 (3FH)
    CALL DELAY		; Atraso usando o Timer 0

    JMP START		; Volta ao início

; Sub-rotina de atraso usando Timer 0 em Modo 2
DELAY:
    ; Carrega o valor de reload para o Timer 0
    MOV TH0, #0FFH  ; Valor de reload (auto-reload para 255)
    MOV TL0, #0FFH  ; Inicializa o contador do Timer 0 (começa em 255)

    ; Inicia o Timer 0
    SETB TR0         ; Ativa o Timer 0

; Espera o Timer 0 overflow
WAIT:
    JNB TF0, WAIT    ; Espera até o overflow (TF0 será setado quando o timer transbordar)

    ; Para o Timer 0 após o overflow
    CLR TR0          ; Desativa o Timer 0
    CLR TF0          ; Limpa o flag de overflow do Timer 0

    RET              ; Retorna da sub-rotina DELAY

END