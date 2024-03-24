
_main:

;adcfunct.c,2 :: 		void main() {
;adcfunct.c,5 :: 		ADCON0=0b00001001;
	MOVLW      9
	MOVWF      ADCON0+0
;adcfunct.c,6 :: 		TRISA=0xFF;
	MOVLW      255
	MOVWF      TRISA+0
;adcfunct.c,7 :: 		TRISB=0;
	CLRF       TRISB+0
;adcfunct.c,8 :: 		TRISC=0;
	CLRF       TRISC+0
;adcfunct.c,9 :: 		TRISD=0;
	CLRF       TRISD+0
;adcfunct.c,10 :: 		ADCON1.b7=1;
	BSF        ADCON1+0, 7
;adcfunct.c,12 :: 		while(1){
L_main0:
;adcfunct.c,13 :: 		ADCON0.b1=1; // adc fucnt execute
	BSF        ADCON0+0, 1
;adcfunct.c,14 :: 		delay_ms(50);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	NOP
	NOP
;adcfunct.c,15 :: 		PORTC=ADRESL;
	MOVF       ADRESL+0, 0
	MOVWF      PORTC+0
;adcfunct.c,16 :: 		PORTD=ADRESH;
	MOVF       ADRESH+0, 0
	MOVWF      PORTD+0
;adcfunct.c,17 :: 		ADCON0.b1=0; // fonk durdurduk
	BCF        ADCON0+0, 1
;adcfunct.c,19 :: 		}
	GOTO       L_main0
;adcfunct.c,20 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
