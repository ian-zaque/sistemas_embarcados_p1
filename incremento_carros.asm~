ORG 0000H

START:
    MOV P1, #3FH      ; Inicializa o display em "0"
    MOV R0, #00H      ; Inicializa o contador em 0

LOOP:
    MOV A, P2         ; Lê o estado das chaves DIP (P2)
    JB ACC.0, LOOP    ; Se o botão NÃO estiver pressionado (P2.0 = 1), continua no loop

    CALL INCREMENTO   ; Se o botão foi pressionado, incrementa o número

    ; Aguarda a liberação do botão para evitar contagens múltiplas indesejadas
WAIT_RELEASE:
    MOV A, P2
    JNB ACC.0, WAIT_RELEASE  ; Espera até o botão ser solto (P2.0 = 1)

    SJMP LOOP         ; Repete o loop

; -------------------------
; Sub-rotina de incremento
; -------------------------
INCREMENTO:
    INC R0           ; Incrementa o contador
    CJNE R0, #0AH, SHOW_NUMBER  ; Se for 10 (0AH), reinicia para 0
    MOV R0, #00H

SHOW_NUMBER:
    MOV DPTR, #TABELA   ; Carrega a tabela de conversão para display
    MOV A, R0
    MOVC A, @A+DPTR     ; Obtém o valor correspondente ao número armazenado
    MOV P1, A           ; Envia para o display
    RET

; -------------------------
; Tabela de conversão para display de 7 segmentos (comum cátodo)
; -------------------------
TABELA:
    DB 3FH  ; 0
    DB 06H  ; 1
    DB 5BH  ; 2
    DB 4FH  ; 3
    DB 66H  ; 4
    DB 6DH  ; 5
    DB 7DH  ; 6
    DB 07H  ; 7
    DB 7FH  ; 8
    DB 6FH  ; 9
END