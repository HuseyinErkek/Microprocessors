
_main:

;_.c,1 :: 		void main() {
;_.c,2 :: 		TRISB=0;
	CLRF       TRISB+0
;_.c,3 :: 		ANSEL=ANSELH=0;
	CLRF       ANSELH+0
	CLRF       ANSEL+0
;_.c,4 :: 		PORTB=0B0010100;
	MOVLW      20
	MOVWF      PORTB+0
;_.c,5 :: 		delay_ms(50);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
	NOP
	NOP
;_.c,6 :: 		while(1){
L_main1:
;_.c,7 :: 		PORTB=PORTB>>1;
	MOVF       PORTB+0, 0
	MOVWF      R0+0
	RRF        R0+0, 1
	BCF        R0+0, 7
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;_.c,8 :: 		delay_ms(50);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	NOP
	NOP
;_.c,9 :: 		if(PORTB<=0b0000101){
	MOVF       PORTB+0, 0
	SUBLW      5
	BTFSS      STATUS+0, 0
	GOTO       L_main4
;_.c,10 :: 		PORTB=0b100000010;                      //binary olarka çevirin
	MOVLW      2
	MOVWF      PORTB+0
;_.c,11 :: 		delay_ms(50);
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
;_.c,12 :: 		}
L_main4:
;_.c,13 :: 		if(PORTB<=0b100000010){
	MOVLW      128
	XORLW      1
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main11
	MOVF       PORTB+0, 0
	SUBLW      2
L__main11:
	BTFSS      STATUS+0, 0
	GOTO       L_main6
;_.c,14 :: 		PORTB=0b01000001;//binary olarka çevirin
	MOVLW      65
	MOVWF      PORTB+0
;_.c,15 :: 		delay_ms(50);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main7:
	DECFSZ     R13+0, 1
	GOTO       L_main7
	DECFSZ     R12+0, 1
	GOTO       L_main7
	NOP
	NOP
;_.c,17 :: 		}
L_main6:
;_.c,18 :: 		if(PORTB<=0b01000001){
	MOVF       PORTB+0, 0
	SUBLW      65
	BTFSS      STATUS+0, 0
	GOTO       L_main8
;_.c,19 :: 		PORTB=0b10100000;//binary olarka çevirin
	MOVLW      160
	MOVWF      PORTB+0
;_.c,20 :: 		delay_ms(50);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main9:
	DECFSZ     R13+0, 1
	GOTO       L_main9
	DECFSZ     R12+0, 1
	GOTO       L_main9
	NOP
	NOP
;_.c,21 :: 		}
L_main8:
;_.c,23 :: 		}
	GOTO       L_main1
;_.c,24 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
