
_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;Interrupt.c,1 :: 		void interrupt(){
;Interrupt.c,2 :: 		if(INTCON.INTE && INTCON.INTF) {
	BTFSS      INTCON+0, 4
	GOTO       L_interrupt2
	BTFSS      INTCON+0, 1
	GOTO       L_interrupt2
L__interrupt6:
;Interrupt.c,3 :: 		PORTC.F0 = 1;  // veya PORTC = PORTC | 0x01; olarak da yazýlabilir
	BSF        PORTC+0, 0
;Interrupt.c,4 :: 		INTCON.INTF = 0;
	BCF        INTCON+0, 1
;Interrupt.c,5 :: 		delay_ms(50);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_interrupt3:
	DECFSZ     R13+0, 1
	GOTO       L_interrupt3
	DECFSZ     R12+0, 1
	GOTO       L_interrupt3
	NOP
	NOP
;Interrupt.c,7 :: 		PORTC.F0 = 0;
	BCF        PORTC+0, 0
;Interrupt.c,8 :: 		}
L_interrupt2:
;Interrupt.c,9 :: 		}
L_end_interrupt:
L__interrupt8:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

;Interrupt.c,11 :: 		void main() {
;Interrupt.c,12 :: 		ANSEL = ANSELH = 0;
	CLRF       ANSELH+0
	CLRF       ANSEL+0
;Interrupt.c,13 :: 		TRISC.F0 = 0;  // Lamba çýkýþý olarak kullanýlacak pin
	BCF        TRISC+0, 0
;Interrupt.c,14 :: 		PORTC.F0 = 0;  // Lambanýn baþlangýç durumu
	BCF        PORTC+0, 0
;Interrupt.c,16 :: 		INTCON.GIE = 1;    // GLOBAL KESMELERE ÝZÝN VERÝR
	BSF        INTCON+0, 7
;Interrupt.c,17 :: 		INTCON.INTE = 1;   // RB0 KESMESÝNE ÝZÝN VERÝR
	BSF        INTCON+0, 4
;Interrupt.c,18 :: 		OPTION_REG.INTEDG = 1;  // YÜKSELEN KENARDA SÝNYAL OLUÞTUR
	BSF        OPTION_REG+0, 6
;Interrupt.c,19 :: 		PORTC = 0;
	CLRF       PORTC+0
;Interrupt.c,21 :: 		while(1) {
L_main4:
;Interrupt.c,23 :: 		}
	GOTO       L_main4
;Interrupt.c,24 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
