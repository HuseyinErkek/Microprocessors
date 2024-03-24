
_main:

;example2.c,1 :: 		void main() {
;example2.c,2 :: 		ANSEL=ANSELH=0;
	CLRF       ANSELH+0
	CLRF       ANSEL+0
;example2.c,3 :: 		TRISB=0;
	CLRF       TRISB+0
;example2.c,4 :: 		PORTB=0xFF;
	MOVLW      255
	MOVWF      PORTB+0
;example2.c,5 :: 		delay_ms(100);
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
;example2.c,6 :: 		PORTB=0;
	CLRF       PORTB+0
;example2.c,7 :: 		PORTB=0b11000000;
	MOVLW      192
	MOVWF      PORTB+0
;example2.c,8 :: 		while(1){
L_main1:
;example2.c,9 :: 		PORTB=PORTB>>1;
	MOVF       PORTB+0, 0
	MOVWF      R0+0
	RRF        R0+0, 1
	BCF        R0+0, 7
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;example2.c,10 :: 		delay_ms(20);
	MOVLW      52
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	NOP
	NOP
;example2.c,11 :: 		if(PORTB>=0b00000011){
	MOVLW      3
	SUBWF      PORTB+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_main4
;example2.c,12 :: 		PORTB=PORTB<<1;
	MOVF       PORTB+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;example2.c,13 :: 		}
L_main4:
;example2.c,17 :: 		}
	GOTO       L_main1
;example2.c,23 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
