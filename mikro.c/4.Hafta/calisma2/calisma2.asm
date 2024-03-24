
_main:

;calisma2.c,1 :: 		void main() {
;calisma2.c,2 :: 		TRISB=0;
	CLRF       TRISB+0
;calisma2.c,3 :: 		while(1){
L_main0:
;calisma2.c,4 :: 		PORTB.f1=1;
	BSF        PORTB+0, 1
;calisma2.c,5 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
	NOP
;calisma2.c,6 :: 		PORTB.f1=0;
	BCF        PORTB+0, 1
;calisma2.c,7 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
	NOP
;calisma2.c,9 :: 		}
	GOTO       L_main0
;calisma2.c,11 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
