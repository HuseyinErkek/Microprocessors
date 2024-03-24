
_main:

;calisma4.c,1 :: 		void main() {
;calisma4.c,18 :: 		TRISB=0;
	CLRF       TRISB+0
;calisma4.c,19 :: 		ANSEL=0;
	CLRF       ANSEL+0
;calisma4.c,20 :: 		ANSELH=0;
	CLRF       ANSELH+0
;calisma4.c,21 :: 		PORTB=0b00000000;
	CLRF       PORTB+0
;calisma4.c,22 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
	DECFSZ     R11+0, 1
	GOTO       L_main0
	NOP
;calisma4.c,23 :: 		while(1){
L_main1:
;calisma4.c,24 :: 		while(portb<255){
L_main3:
	MOVLW      255
	SUBWF      PORTB+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main4
;calisma4.c,25 :: 		PORTB++;
	INCF       PORTB+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;calisma4.c,26 :: 		delay_ms(50);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	NOP
	NOP
;calisma4.c,27 :: 		}
	GOTO       L_main3
L_main4:
;calisma4.c,28 :: 		while(portb>0){
L_main6:
	MOVF       PORTB+0, 0
	SUBLW      0
	BTFSC      STATUS+0, 0
	GOTO       L_main7
;calisma4.c,29 :: 		PORTB--;
	DECF       PORTB+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;calisma4.c,30 :: 		delay_ms(50);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main8:
	DECFSZ     R13+0, 1
	GOTO       L_main8
	DECFSZ     R12+0, 1
	GOTO       L_main8
	NOP
	NOP
;calisma4.c,31 :: 		}
	GOTO       L_main6
L_main7:
;calisma4.c,33 :: 		}
	GOTO       L_main1
;calisma4.c,37 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
