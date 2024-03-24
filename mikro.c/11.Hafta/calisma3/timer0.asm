
_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;timer0.c,2 :: 		void interrupt() {
;timer0.c,3 :: 		cnt++;
	INCF       _cnt+0, 1
	BTFSC      STATUS+0, 2
	INCF       _cnt+1, 1
;timer0.c,4 :: 		TMR0 = 96;
	MOVLW      96
	MOVWF      TMR0+0
;timer0.c,5 :: 		INTCON = 0X20;
	MOVLW      32
	MOVWF      INTCON+0
;timer0.c,6 :: 		}
L_end_interrupt:
L__interrupt5:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

;timer0.c,8 :: 		void main() {
;timer0.c,9 :: 		OPTION_REG = 0X84;
	MOVLW      132
	MOVWF      OPTION_REG+0
;timer0.c,10 :: 		ANSEL = 0;
	CLRF       ANSEL+0
;timer0.c,11 :: 		TRISD = 0;
	CLRF       TRISD+0
;timer0.c,12 :: 		PORTD = 0X00;
	CLRF       PORTD+0
;timer0.c,13 :: 		TMR0 =96;
	MOVLW      96
	MOVWF      TMR0+0
;timer0.c,14 :: 		INTCON =0XA0;
	MOVLW      160
	MOVWF      INTCON+0
;timer0.c,15 :: 		cnt = 0;
	CLRF       _cnt+0
	CLRF       _cnt+1
;timer0.c,16 :: 		do {
L_main0:
;timer0.c,17 :: 		if (cnt == 400) {
	MOVF       _cnt+1, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__main7
	MOVLW      144
	XORWF      _cnt+0, 0
L__main7:
	BTFSS      STATUS+0, 2
	GOTO       L_main3
;timer0.c,18 :: 		PORTD = PORTD++;
	INCF       PORTD+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      PORTD+0
;timer0.c,19 :: 		cnt = 0;
	CLRF       _cnt+0
	CLRF       _cnt+1
;timer0.c,20 :: 		}
L_main3:
;timer0.c,21 :: 		}while (1);
	GOTO       L_main0
;timer0.c,22 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
