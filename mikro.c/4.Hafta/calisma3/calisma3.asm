
_main:

;calisma3.c,1 :: 		void main() {
;calisma3.c,2 :: 		TRISB=0;
	CLRF       TRISB+0
;calisma3.c,3 :: 		ANSEL=0;
	CLRF       ANSEL+0
;calisma3.c,4 :: 		ANSELH=0;
	CLRF       ANSELH+0
;calisma3.c,5 :: 		while(1){
L_main0:
;calisma3.c,6 :: 		PORTB=0b10101010;
	MOVLW      170
	MOVWF      PORTB+0
;calisma3.c,7 :: 		delay_ms(100);
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
;calisma3.c,8 :: 		PORTB=0b01010101;
	MOVLW      85
	MOVWF      PORTB+0
;calisma3.c,9 :: 		delay_ms(100);
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
;calisma3.c,10 :: 		}
	GOTO       L_main0
;calisma3.c,12 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
