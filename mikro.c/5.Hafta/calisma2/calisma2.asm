
_main:

;calisma2.c,1 :: 		void main() {
;calisma2.c,2 :: 		TRISB=0;
	CLRF       TRISB+0
;calisma2.c,3 :: 		ANSEL=ANSELH=0;
	CLRF       ANSELH+0
	CLRF       ANSEL+0
;calisma2.c,4 :: 		PORTB=0;
	CLRF       PORTB+0
;calisma2.c,6 :: 		delay_ms(20);
	MOVLW      52
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
	NOP
	NOP
;calisma2.c,7 :: 		while(1){
L_main1:
;calisma2.c,8 :: 		PORTB.b1=1;
	BSF        PORTB+0, 1
;calisma2.c,9 :: 		PORTB.b0=1;
	BSF        PORTB+0, 0
;calisma2.c,10 :: 		while(PORTB<128){
L_main3:
	MOVLW      128
	SUBWF      PORTB+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main4
;calisma2.c,11 :: 		PORTB<<=1;
	MOVF       PORTB+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;calisma2.c,12 :: 		delay_ms(30);
	MOVLW      78
	MOVWF      R12+0
	MOVLW      235
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
;calisma2.c,13 :: 		}
	GOTO       L_main3
L_main4:
;calisma2.c,14 :: 		while(PORTB>1){
L_main6:
	MOVF       PORTB+0, 0
	SUBLW      1
	BTFSC      STATUS+0, 0
	GOTO       L_main7
;calisma2.c,15 :: 		PORTB>>=1;
	MOVF       PORTB+0, 0
	MOVWF      R0+0
	RRF        R0+0, 1
	BCF        R0+0, 7
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;calisma2.c,16 :: 		delay_ms(30);
	MOVLW      78
	MOVWF      R12+0
	MOVLW      235
	MOVWF      R13+0
L_main8:
	DECFSZ     R13+0, 1
	GOTO       L_main8
	DECFSZ     R12+0, 1
	GOTO       L_main8
;calisma2.c,17 :: 		}
	GOTO       L_main6
L_main7:
;calisma2.c,18 :: 		}
	GOTO       L_main1
;calisma2.c,20 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
