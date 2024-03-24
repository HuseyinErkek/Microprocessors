
_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;hariciOsilat_r.c,3 :: 		void interrupt(){
;hariciOsilat_r.c,4 :: 		Count++;
	INCF       _Count+0, 1
	BTFSC      STATUS+0, 2
	INCF       _Count+1, 1
;hariciOsilat_r.c,5 :: 		TMR0=6;
	MOVLW      6
	MOVWF      TMR0+0
;hariciOsilat_r.c,6 :: 		INTCON.T0IF=0;
	BCF        INTCON+0, 2
;hariciOsilat_r.c,7 :: 		}
L_end_interrupt:
L__interrupt4:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

;hariciOsilat_r.c,9 :: 		void main() {
;hariciOsilat_r.c,10 :: 		ANSEL=0;
	CLRF       ANSEL+0
;hariciOsilat_r.c,11 :: 		ANSELH=0;
	CLRF       ANSELH+0
;hariciOsilat_r.c,12 :: 		TRISA.f4=1;
	BSF        TRISA+0, 4
;hariciOsilat_r.c,13 :: 		PORTA=0;
	CLRF       PORTA+0
;hariciOsilat_r.c,14 :: 		TRISC=0;
	CLRF       TRISC+0
;hariciOsilat_r.c,15 :: 		PORTC=0;
	CLRF       PORTC+0
;hariciOsilat_r.c,16 :: 		OPTION_REG=0b00100000;
	MOVLW      32
	MOVWF      OPTION_REG+0
;hariciOsilat_r.c,17 :: 		INTCON.GIE=1;
	BSF        INTCON+0, 7
;hariciOsilat_r.c,18 :: 		INTCON.T0IE=1;
	BSF        INTCON+0, 5
;hariciOsilat_r.c,19 :: 		TMR0=6;
	MOVLW      6
	MOVWF      TMR0+0
;hariciOsilat_r.c,20 :: 		while(1){
L_main0:
;hariciOsilat_r.c,21 :: 		if(Count==2){
	MOVLW      0
	XORWF      _Count+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main6
	MOVLW      2
	XORWF      _Count+0, 0
L__main6:
	BTFSS      STATUS+0, 2
	GOTO       L_main2
;hariciOsilat_r.c,22 :: 		portc=~portc;
	COMF       PORTC+0, 1
;hariciOsilat_r.c,23 :: 		Count=0;
	CLRF       _Count+0
	CLRF       _Count+1
;hariciOsilat_r.c,25 :: 		}
L_main2:
;hariciOsilat_r.c,28 :: 		}
	GOTO       L_main0
;hariciOsilat_r.c,29 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
