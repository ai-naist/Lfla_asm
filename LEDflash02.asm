;       LED点滅プログラム
;       電気電子システム工学基礎実験

;       PORTB,RP0,F などを宣言
INCLUDE "P16F84A.INC"
;       PICの種類を指定
LIST    P=PIC16F84A

;       レジスタのアドレスにラベルを定義
CNTT500 EQU 0CH ; 12
CNTT100 EQU 0DH ; 13
CNTT04  EQU 0EH ; 14

;       プログラムの開始番地を定義
        ORG 0

;       PORTBを出力モードに設定
        BSF STATUS,RP0
        CLRF    TRISB
        BCF STATUS, RP0

MAINLP
;       7番ピン:点灯 8番ピン:点灯
        MOVLW   06H     ; 00000110b
        MOVWF   PORTB
        CALL    T500

;       7番ピン:消灯 8番ピン:消灯
        MOVLW   00H     ; 00000000b
        MOVWF   PORTB
        CALL    T500

        GOTO    MAINLP

T500
        MOVLW   05H     ; 5
        MOVWF   CNTT500
T500LP
        CALL    T100
        DECFSZ  CNTT500, F
        GOTO    T500LP
        RETURN

T100
        MOVLW   0F9H    ; 249
        MOVWF   CNTT100
T100LP
        CALL    T04
        DECFSZ  CNTT100,F
        GOTO    T100LP
        RETURN

T04
        MOVLW   0F9H    ; 249
        MOVWF   CNTT04
T04LP
        NOP
;       249回目にGOTOをNOPにしてRETURNを実行
        DECFSZ  CNTT04, F
        GOTO    T04LP
        RETURN

        END