
_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;saatdksn.c,6 :: 		void interrupt(){
;saatdksn.c,7 :: 		tmrsay+=1;
	INCF       _tmrsay+0, 1
	BTFSC      STATUS+0, 2
	INCF       _tmrsay+1, 1
;saatdksn.c,8 :: 		tmr0=55;
	MOVLW      55
	MOVWF      TMR0+0
;saatdksn.c,9 :: 		intcon.t0if=0;
	BCF        INTCON+0, 2
;saatdksn.c,10 :: 		}
L_end_interrupt:
L__interrupt6:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

;saatdksn.c,12 :: 		void main() {
;saatdksn.c,13 :: 		ansel=anselh=0;
	CLRF       ANSELH+0
	CLRF       ANSEL+0
;saatdksn.c,14 :: 		trisb=0;trisc=0;trisd=0;
	CLRF       TRISB+0
	CLRF       TRISC+0
	CLRF       TRISD+0
;saatdksn.c,15 :: 		portb=0;portc=0;portd=0;
	CLRF       PORTB+0
	CLRF       PORTC+0
	CLRF       PORTD+0
;saatdksn.c,17 :: 		OPTION_REG.T0CS=0;
	BCF        OPTION_REG+0, 5
;saatdksn.c,18 :: 		OPTION_REG.PSA=0;
	BCF        OPTION_REG+0, 3
;saatdksn.c,19 :: 		OPTION_REG.PS0=0;
	BCF        OPTION_REG+0, 0
;saatdksn.c,20 :: 		OPTION_REG.PS1=0;
	BCF        OPTION_REG+0, 1
;saatdksn.c,21 :: 		OPTION_REG.PS2=0;
	BCF        OPTION_REG+0, 2
;saatdksn.c,22 :: 		INTCON.GIE=1;
	BSF        INTCON+0, 7
;saatdksn.c,23 :: 		INTCON.T0IE=1;
	BSF        INTCON+0, 5
;saatdksn.c,24 :: 		tmr0=55;
	MOVLW      55
	MOVWF      TMR0+0
;saatdksn.c,28 :: 		while(1){
L_main0:
;saatdksn.c,29 :: 		if(tmrsay>=5000){
	MOVLW      128
	XORWF      _tmrsay+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      19
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main8
	MOVLW      136
	SUBWF      _tmrsay+0, 0
L__main8:
	BTFSS      STATUS+0, 0
	GOTO       L_main2
;saatdksn.c,30 :: 		sny+=1;
	INCF       _sny+0, 1
	BTFSC      STATUS+0, 2
	INCF       _sny+1, 1
;saatdksn.c,31 :: 		portd=dec2bcd(sny);
	MOVF       _sny+0, 0
	MOVWF      FARG_Dec2Bcd_decnum+0
	CALL       _Dec2Bcd+0
	MOVF       R0+0, 0
	MOVWF      PORTD+0
;saatdksn.c,32 :: 		tmrsay=0;
	CLRF       _tmrsay+0
	CLRF       _tmrsay+1
;saatdksn.c,33 :: 		}
L_main2:
;saatdksn.c,34 :: 		if(sny>=59){
	MOVLW      128
	XORWF      _sny+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main9
	MOVLW      59
	SUBWF      _sny+0, 0
L__main9:
	BTFSS      STATUS+0, 0
	GOTO       L_main3
;saatdksn.c,35 :: 		dk+=1;
	INCF       _dk+0, 1
	BTFSC      STATUS+0, 2
	INCF       _dk+1, 1
;saatdksn.c,36 :: 		portc=dec2bcd(dk);
	MOVF       _dk+0, 0
	MOVWF      FARG_Dec2Bcd_decnum+0
	CALL       _Dec2Bcd+0
	MOVF       R0+0, 0
	MOVWF      PORTC+0
;saatdksn.c,37 :: 		sny=0;
	CLRF       _sny+0
	CLRF       _sny+1
;saatdksn.c,38 :: 		}
L_main3:
;saatdksn.c,39 :: 		if(dk>=59){
	MOVLW      128
	XORWF      _dk+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main10
	MOVLW      59
	SUBWF      _dk+0, 0
L__main10:
	BTFSS      STATUS+0, 0
	GOTO       L_main4
;saatdksn.c,40 :: 		saat+=1;
	INCF       _saat+0, 1
	BTFSC      STATUS+0, 2
	INCF       _saat+1, 1
;saatdksn.c,41 :: 		portb=dec2bcd(saat);
	MOVF       _saat+0, 0
	MOVWF      FARG_Dec2Bcd_decnum+0
	CALL       _Dec2Bcd+0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;saatdksn.c,42 :: 		}
L_main4:
;saatdksn.c,43 :: 		}
	GOTO       L_main0
;saatdksn.c,44 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
