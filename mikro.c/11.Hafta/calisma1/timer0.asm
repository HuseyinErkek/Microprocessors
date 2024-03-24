
_SSD:

;timer0.c,1 :: 		void SSD(){
;timer0.c,2 :: 		char LED[16]={0x3F, 0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x7F,0x6F,0x77,0x7C,0x39,0x5E,0x79,0x71};
	MOVLW      63
	MOVWF      SSD_LED_L0+0
	MOVLW      6
	MOVWF      SSD_LED_L0+1
	MOVLW      91
	MOVWF      SSD_LED_L0+2
	MOVLW      79
	MOVWF      SSD_LED_L0+3
	MOVLW      102
	MOVWF      SSD_LED_L0+4
	MOVLW      109
	MOVWF      SSD_LED_L0+5
	MOVLW      125
	MOVWF      SSD_LED_L0+6
	MOVLW      127
	MOVWF      SSD_LED_L0+7
	MOVLW      111
	MOVWF      SSD_LED_L0+8
	MOVLW      119
	MOVWF      SSD_LED_L0+9
	MOVLW      124
	MOVWF      SSD_LED_L0+10
	MOVLW      57
	MOVWF      SSD_LED_L0+11
	MOVLW      94
	MOVWF      SSD_LED_L0+12
	MOVLW      121
	MOVWF      SSD_LED_L0+13
	MOVLW      113
	MOVWF      SSD_LED_L0+14
	CLRF       SSD_LED_L0+15
;timer0.c,3 :: 		PORTB=LED[TMR0];
	MOVF       TMR0+0, 0
	ADDLW      SSD_LED_L0+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;timer0.c,4 :: 		if(TMR0==16) TMR0=0;
	MOVF       TMR0+0, 0
	XORLW      16
	BTFSS      STATUS+0, 2
	GOTO       L_SSD0
	CLRF       TMR0+0
L_SSD0:
;timer0.c,6 :: 		}
L_end_SSD:
	RETURN
; end of _SSD

_main:

;timer0.c,8 :: 		void main() {
;timer0.c,9 :: 		PORTA=0x00;
	CLRF       PORTA+0
;timer0.c,10 :: 		PORTB=0x00;
	CLRF       PORTB+0
;timer0.c,11 :: 		TRISA.TRISA4=1;
	BSF        TRISA+0, 4
;timer0.c,12 :: 		TRISB=0x00;
	CLRF       TRISB+0
;timer0.c,13 :: 		OSCCON=0x70;
	MOVLW      112
	MOVWF      OSCCON+0
;timer0.c,14 :: 		OPTION_REG.T0CS=1;
	BSF        OPTION_REG+0, 5
;timer0.c,15 :: 		OPTION_REG.T0SE=1;
	BSF        OPTION_REG+0, 4
;timer0.c,16 :: 		OPTION_REG.PSA=0;
	BCF        OPTION_REG+0, 3
;timer0.c,17 :: 		OPTION_REG.PS0=0;
	BCF        OPTION_REG+0, 0
;timer0.c,18 :: 		OPTION_REG.PS1=0;
	BCF        OPTION_REG+0, 1
;timer0.c,19 :: 		OPTION_REG.PS2=0;
	BCF        OPTION_REG+0, 2
;timer0.c,20 :: 		TMR0=0;
	CLRF       TMR0+0
;timer0.c,21 :: 		while(1)
L_main1:
;timer0.c,22 :: 		SSD();
	CALL       _SSD+0
	GOTO       L_main1
;timer0.c,24 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
