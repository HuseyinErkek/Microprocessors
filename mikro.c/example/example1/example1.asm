
_main:

;example1.c,2 :: 		void main() {
;example1.c,3 :: 		ANSEL=ANSELH=0;
	CLRF       ANSELH+0
	CLRF       ANSEL+0
;example1.c,4 :: 		TRISB=0;
	CLRF       TRISB+0
;example1.c,5 :: 		PORTB=0xFF;
	MOVLW      255
	MOVWF      PORTB+0
;example1.c,6 :: 		delay_ms(100);
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
;example1.c,7 :: 		PORTB=0;
	CLRF       PORTB+0
;example1.c,8 :: 		for(i=0;i<5;i++){
	CLRF       _i+0
	CLRF       _i+1
L_main1:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main14
	MOVLW      5
	SUBWF      _i+0, 0
L__main14:
	BTFSC      STATUS+0, 0
	GOTO       L_main2
;example1.c,9 :: 		switch(PORTB){
	GOTO       L_main4
;example1.c,10 :: 		case 0x00: PORTB=0XFF;
L_main6:
	MOVLW      255
	MOVWF      PORTB+0
;example1.c,11 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main7:
	DECFSZ     R13+0, 1
	GOTO       L_main7
	DECFSZ     R12+0, 1
	GOTO       L_main7
	DECFSZ     R11+0, 1
	GOTO       L_main7
	NOP
;example1.c,12 :: 		break;
	GOTO       L_main5
;example1.c,13 :: 		case 0xFF: PORTB=0x00;
L_main8:
	CLRF       PORTB+0
;example1.c,14 :: 		delay_ms(250);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main9:
	DECFSZ     R13+0, 1
	GOTO       L_main9
	DECFSZ     R12+0, 1
	GOTO       L_main9
	DECFSZ     R11+0, 1
	GOTO       L_main9
	NOP
	NOP
;example1.c,15 :: 		}
	GOTO       L_main5
L_main4:
	MOVF       PORTB+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_main6
	MOVF       PORTB+0, 0
	XORLW      255
	BTFSC      STATUS+0, 2
	GOTO       L_main8
L_main5:
;example1.c,8 :: 		for(i=0;i<5;i++){
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;example1.c,16 :: 		}
	GOTO       L_main1
L_main2:
;example1.c,17 :: 		PORTB=0b10101010;
	MOVLW      170
	MOVWF      PORTB+0
;example1.c,18 :: 		while(1){
L_main10:
;example1.c,19 :: 		delay_ms(50);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main12:
	DECFSZ     R13+0, 1
	GOTO       L_main12
	DECFSZ     R12+0, 1
	GOTO       L_main12
	NOP
	NOP
;example1.c,20 :: 		PORTB=~PORTB;
	COMF       PORTB+0, 1
;example1.c,23 :: 		}
	GOTO       L_main10
;example1.c,24 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
