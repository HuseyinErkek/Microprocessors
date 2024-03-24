
_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;TMR0.c,3 :: 		void interrupt(){
;TMR0.c,4 :: 		cnt++;
	INCF       _cnt+0, 1
	BTFSC      STATUS+0, 2
	INCF       _cnt+1, 1
;TMR0.c,5 :: 		if(cnt==125){
	MOVLW      0
	XORWF      _cnt+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt3
	MOVLW      125
	XORWF      _cnt+0, 0
L__interrupt3:
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt0
;TMR0.c,6 :: 		say=say+1;
	INCF       _say+0, 1
	BTFSC      STATUS+0, 2
	INCF       _say+1, 1
;TMR0.c,7 :: 		PORTC=dec2bcd(say);
	MOVF       _say+0, 0
	MOVWF      FARG_Dec2Bcd_decnum+0
	CALL       _Dec2Bcd+0
	MOVF       R0+0, 0
	MOVWF      PORTC+0
;TMR0.c,8 :: 		cnt=0;
	CLRF       _cnt+0
	CLRF       _cnt+1
;TMR0.c,10 :: 		} intcon.t0if=0;
L_interrupt0:
	BCF        INTCON+0, 2
;TMR0.c,11 :: 		tmr0=131;
	MOVLW      131
	MOVWF      TMR0+0
;TMR0.c,13 :: 		}
L_end_interrupt:
L__interrupt2:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

;TMR0.c,14 :: 		void main() {
;TMR0.c,15 :: 		TRISC=0;
	CLRF       TRISC+0
;TMR0.c,16 :: 		OPTION_REG.T0CS=0;
	BCF        OPTION_REG+0, 5
;TMR0.c,17 :: 		OPTION_REG.PSA=0; // TÝMER0
	BCF        OPTION_REG+0, 3
;TMR0.c,18 :: 		OPTION_REG.PS0=0;
	BCF        OPTION_REG+0, 0
;TMR0.c,19 :: 		OPTION_REG.PS1=1;
	BSF        OPTION_REG+0, 1
;TMR0.c,20 :: 		OPTION_REG.PS2=1;
	BSF        OPTION_REG+0, 2
;TMR0.c,21 :: 		INTCON.GIE=1;
	BSF        INTCON+0, 7
;TMR0.c,22 :: 		INTCON.INTF=1;
	BSF        INTCON+0, 1
;TMR0.c,23 :: 		TMR0=131;
	MOVLW      131
	MOVWF      TMR0+0
;TMR0.c,25 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
