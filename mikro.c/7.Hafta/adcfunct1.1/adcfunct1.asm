
_main:

;adcfunct1.c,2 :: 		void main() {
;adcfunct1.c,3 :: 		ANSEL=0X04;
	MOVLW      4
	MOVWF      ANSEL+0
;adcfunct1.c,4 :: 		ANSELH=0b00000000;
	CLRF       ANSELH+0
;adcfunct1.c,5 :: 		TRISA=0xFF;
	MOVLW      255
	MOVWF      TRISA+0
;adcfunct1.c,6 :: 		TRISC=0;
	CLRF       TRISC+0
;adcfunct1.c,7 :: 		PORTB=0;
	CLRF       PORTB+0
;adcfunct1.c,9 :: 		while(1){
L_main0:
;adcfunct1.c,10 :: 		temp=ADC_Read(2);
	MOVLW      2
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _temp+0
	MOVF       R0+1, 0
	MOVWF      _temp+1
;adcfunct1.c,11 :: 		if(temp>=0&&temp<=51){
	MOVLW      128
	XORWF      R0+1, 0
	MOVWF      R2+0
	MOVLW      128
	SUBWF      R2+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main19
	MOVLW      0
	SUBWF      R0+0, 0
L__main19:
	BTFSS      STATUS+0, 0
	GOTO       L_main4
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _temp+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main20
	MOVF       _temp+0, 0
	SUBLW      51
L__main20:
	BTFSS      STATUS+0, 0
	GOTO       L_main4
L__main17:
;adcfunct1.c,12 :: 		PORTC=0;
	CLRF       PORTC+0
;adcfunct1.c,13 :: 		}
L_main4:
;adcfunct1.c,14 :: 		if(temp>=51&&temp<255){
	MOVLW      128
	XORWF      _temp+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main21
	MOVLW      51
	SUBWF      _temp+0, 0
L__main21:
	BTFSS      STATUS+0, 0
	GOTO       L_main7
	MOVLW      128
	XORWF      _temp+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main22
	MOVLW      255
	SUBWF      _temp+0, 0
L__main22:
	BTFSC      STATUS+0, 0
	GOTO       L_main7
L__main16:
;adcfunct1.c,15 :: 		PORTC=0b00001111;
	MOVLW      15
	MOVWF      PORTC+0
;adcfunct1.c,16 :: 		}
L_main7:
;adcfunct1.c,17 :: 		if(temp>=255&&temp<511){
	MOVLW      128
	XORWF      _temp+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main23
	MOVLW      255
	SUBWF      _temp+0, 0
L__main23:
	BTFSS      STATUS+0, 0
	GOTO       L_main10
	MOVLW      128
	XORWF      _temp+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      1
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main24
	MOVLW      255
	SUBWF      _temp+0, 0
L__main24:
	BTFSC      STATUS+0, 0
	GOTO       L_main10
L__main15:
;adcfunct1.c,18 :: 		PORTC=0b00111111;
	MOVLW      63
	MOVWF      PORTC+0
;adcfunct1.c,19 :: 		}
L_main10:
;adcfunct1.c,20 :: 		if(temp>=511&&temp<=1023){
	MOVLW      128
	XORWF      _temp+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      1
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main25
	MOVLW      255
	SUBWF      _temp+0, 0
L__main25:
	BTFSS      STATUS+0, 0
	GOTO       L_main13
	MOVLW      128
	XORLW      3
	MOVWF      R0+0
	MOVLW      128
	XORWF      _temp+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main26
	MOVF       _temp+0, 0
	SUBLW      255
L__main26:
	BTFSS      STATUS+0, 0
	GOTO       L_main13
L__main14:
;adcfunct1.c,21 :: 		PORTC=0b11111111;
	MOVLW      255
	MOVWF      PORTC+0
;adcfunct1.c,22 :: 		}
L_main13:
;adcfunct1.c,24 :: 		}
	GOTO       L_main0
;adcfunct1.c,26 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
