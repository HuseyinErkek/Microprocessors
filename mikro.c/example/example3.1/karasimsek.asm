
_main:

;karasimsek.c,3 :: 		void main() {
;karasimsek.c,4 :: 		TRISB=0;
	CLRF       TRISB+0
;karasimsek.c,5 :: 		ANSEL=ANSELH=0;
	CLRF       ANSELH+0
	CLRF       ANSEL+0
;karasimsek.c,7 :: 		PORTB=0b00110000;
	MOVLW      48
	MOVWF      PORTB+0
;karasimsek.c,8 :: 		delay_ms(50);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
	NOP
	NOP
;karasimsek.c,9 :: 		while(1){
L_main1:
;karasimsek.c,12 :: 		if(sag==1){
	MOVLW      0
	XORWF      _sag+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main10
	MOVLW      1
	XORWF      _sag+0, 0
L__main10:
	BTFSS      STATUS+0, 2
	GOTO       L_main3
;karasimsek.c,13 :: 		PORTB=PORTB>>1;
	MOVF       PORTB+0, 0
	MOVWF      R0+0
	RRF        R0+0, 1
	BCF        R0+0, 7
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;karasimsek.c,14 :: 		delay_ms(50);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main4:
	DECFSZ     R13+0, 1
	GOTO       L_main4
	DECFSZ     R12+0, 1
	GOTO       L_main4
	NOP
	NOP
;karasimsek.c,15 :: 		if(PORTB==0b00000011){
	MOVF       PORTB+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_main5
;karasimsek.c,16 :: 		sag=0;
	CLRF       _sag+0
	CLRF       _sag+1
;karasimsek.c,17 :: 		}
L_main5:
;karasimsek.c,18 :: 		}
L_main3:
;karasimsek.c,19 :: 		if(sag==0){
	MOVLW      0
	XORWF      _sag+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main11
	MOVLW      0
	XORWF      _sag+0, 0
L__main11:
	BTFSS      STATUS+0, 2
	GOTO       L_main6
;karasimsek.c,20 :: 		PORTB=PORTB<<1;
	MOVF       PORTB+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	MOVWF      PORTB+0
;karasimsek.c,21 :: 		delay_ms(50);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main7:
	DECFSZ     R13+0, 1
	GOTO       L_main7
	DECFSZ     R12+0, 1
	GOTO       L_main7
	NOP
	NOP
;karasimsek.c,22 :: 		if(PORTB==0b11000000){
	MOVF       PORTB+0, 0
	XORLW      192
	BTFSS      STATUS+0, 2
	GOTO       L_main8
;karasimsek.c,23 :: 		sag=1;
	MOVLW      1
	MOVWF      _sag+0
	MOVLW      0
	MOVWF      _sag+1
;karasimsek.c,24 :: 		}
L_main8:
;karasimsek.c,25 :: 		}
L_main6:
;karasimsek.c,29 :: 		}
	GOTO       L_main1
;karasimsek.c,33 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
