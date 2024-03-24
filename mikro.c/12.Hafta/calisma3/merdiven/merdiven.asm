
_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;merdiven.c,2 :: 		void interrupt() {
;merdiven.c,3 :: 		if (intcon.intf==1){
	BTFSS      INTCON+0, 1
	GOTO       L_interrupt0
;merdiven.c,4 :: 		portc.f0=1;
	BSF        PORTC+0, 0
;merdiven.c,5 :: 		intcon.t0ie=1;
	BSF        INTCON+0, 5
;merdiven.c,6 :: 		intcon.intf=0;
	BCF        INTCON+0, 1
;merdiven.c,7 :: 		}
L_interrupt0:
;merdiven.c,8 :: 		if (intcon.t0if==1) {
	BTFSS      INTCON+0, 2
	GOTO       L_interrupt1
;merdiven.c,9 :: 		if (say==45) {
	MOVF       _say+0, 0
	XORLW      45
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt2
;merdiven.c,10 :: 		portc=0;
	CLRF       PORTC+0
;merdiven.c,11 :: 		say=0;
	CLRF       _say+0
;merdiven.c,12 :: 		intcon.t0ie=0;
	BCF        INTCON+0, 5
;merdiven.c,13 :: 		}
L_interrupt2:
;merdiven.c,14 :: 		say++;
	INCF       _say+0, 1
;merdiven.c,15 :: 		portc.f0=0;
	BCF        PORTC+0, 0
;merdiven.c,16 :: 		intcon.t0if=0;
	BCF        INTCON+0, 2
;merdiven.c,17 :: 		}
L_interrupt1:
;merdiven.c,18 :: 		}//interrupt
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

;merdiven.c,19 :: 		void main() {
;merdiven.c,20 :: 		ansel=0; anselh=0;
	CLRF       ANSEL+0
	CLRF       ANSELH+0
;merdiven.c,21 :: 		trisb=0xff; trisc=0;
	MOVLW      255
	MOVWF      TRISB+0
	CLRF       TRISC+0
;merdiven.c,22 :: 		portc.f0=0;
	BCF        PORTC+0, 0
;merdiven.c,23 :: 		option_reg=0b01000111; // L2H, 1:256
	MOVLW      71
	MOVWF      OPTION_REG+0
;merdiven.c,24 :: 		intcon.GIE=1;
	BSF        INTCON+0, 7
;merdiven.c,25 :: 		intcon.INTE=1;
	BSF        INTCON+0, 4
;merdiven.c,26 :: 		while(1) { }
L_main3:
	GOTO       L_main3
;merdiven.c,27 :: 		}//main
L_end_main:
	GOTO       $+0
; end of _main
