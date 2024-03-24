
_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;Interrupt.c,2 :: 		void interrupt(){
;Interrupt.c,3 :: 		SAY++;
	INCF       _SAY+0, 1
	BTFSC      STATUS+0, 2
	INCF       _SAY+1, 1
;Interrupt.c,4 :: 		PORTC=Dec2Bcd(SAY);
	MOVF       _SAY+0, 0
	MOVWF      FARG_Dec2Bcd_decnum+0
	CALL       _Dec2Bcd+0
	MOVF       R0+0, 0
	MOVWF      PORTC+0
;Interrupt.c,5 :: 		INTCON.INTF=0; // KESME BAYRAÐI SIFIRLAMAK YENÝDEN KESME MÜMKÜN KILAR
	BCF        INTCON+0, 1
;Interrupt.c,6 :: 		}
L_end_interrupt:
L__interrupt1:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

;Interrupt.c,7 :: 		void main() {
;Interrupt.c,8 :: 		ANSEL=ANSELH=0;
	CLRF       ANSELH+0
	CLRF       ANSEL+0
;Interrupt.c,9 :: 		TRISC=0X00;
	CLRF       TRISC+0
;Interrupt.c,10 :: 		TRISB=0XFF;
	MOVLW      255
	MOVWF      TRISB+0
;Interrupt.c,11 :: 		INTCON.GIE=1; //GLOBAL KESMELERE ÝZÝN VER
	BSF        INTCON+0, 7
;Interrupt.c,12 :: 		INTCON.INTE=1;// RB0 KESMESÝNE ÝZÝN VER
	BSF        INTCON+0, 4
;Interrupt.c,14 :: 		OPTION_REG.INTEDG=1;// ÜRETÝLEN KARE DALGANIN YÜKSELEN KENARINDAN
	BSF        OPTION_REG+0, 6
;Interrupt.c,15 :: 		PORTC=0;
	CLRF       PORTC+0
;Interrupt.c,19 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
