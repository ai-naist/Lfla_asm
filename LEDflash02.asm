;       LED�_�Ńv���O����
;       �d�C�d�q�V�X�e���H�w��b����

;       PORTB,RP0,F �Ȃǂ�錾
INCLUDE "P16F84A.INC"
;       PIC�̎�ނ��w��
LIST    P=PIC16F84A

;       ���W�X�^�̃A�h���X�Ƀ��x�����`
CNTT500 EQU 0CH ; 12
CNTT100 EQU 0DH ; 13
CNTT04  EQU 0EH ; 14

;       �v���O�����̊J�n�Ԓn���`
        ORG 0

;       PORTB���o�̓��[�h�ɐݒ�
        BSF STATUS,RP0
        CLRF    TRISB
        BCF STATUS, RP0

MAINLP
;       7�ԃs��:�_�� 8�ԃs��:�_��
        MOVLW   06H     ; 00000110b
        MOVWF   PORTB
        CALL    T500

;       7�ԃs��:���� 8�ԃs��:����
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
;       249��ڂ�GOTO��NOP�ɂ���RETURN�����s
        DECFSZ  CNTT04, F
        GOTO    T04LP
        RETURN

        END