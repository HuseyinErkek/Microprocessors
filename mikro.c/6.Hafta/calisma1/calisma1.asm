
_main:

;calisma1.c,4 :: 		void main() {
;calisma1.c,6 :: 		TRISC=0;
	CLRF       TRISC+0
;calisma1.c,7 :: 		PORTC=0;
	CLRF       PORTC+0
;calisma1.c,8 :: 		TRISD=0;
	CLRF       TRISD+0
;calisma1.c,9 :: 		PORTD=0;
	CLRF       PORTD+0
;calisma1.c,10 :: 		delay_ms(20);
	MOVLW      52
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
	NOP
	NOP
;calisma1.c,11 :: 		j =0;
	CLRF       _j+0
	CLRF       _j+1
;calisma1.c,12 :: 		while(1) {
L_main1:
;calisma1.c,13 :: 		PORTC=rakam[j];
	MOVF       _j+0, 0
	MOVWF      R0+0
	MOVF       _j+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _rakam+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTC+0
;calisma1.c,14 :: 		for(i=0;i<10;i++){
	CLRF       _i+0
	CLRF       _i+1
L_main3:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main10
	MOVLW      10
	SUBWF      _i+0, 0
L__main10:
	BTFSC      STATUS+0, 0
	GOTO       L_main4
;calisma1.c,15 :: 		PORTD=rakam[i];
	MOVF       _i+0, 0
	MOVWF      R0+0
	MOVF       _i+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      _rakam+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTD+0
;calisma1.c,16 :: 		delay_ms(20);
	MOVLW      52
	MOVWF      R12+0
	MOVLW      241
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	NOP
	NOP
;calisma1.c,17 :: 		if(i==9){
	MOVLW      0
	XORWF      _i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main11
	MOVLW      9
	XORWF      _i+0, 0
L__main11:
	BTFSS      STATUS+0, 2
	GOTO       L_main7
;calisma1.c,18 :: 		j++;
	INCF       _j+0, 1
	BTFSC      STATUS+0, 2
	INCF       _j+1, 1
;calisma1.c,19 :: 		}
L_main7:
;calisma1.c,20 :: 		if(j==10){
	MOVLW      0
	XORWF      _j+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main12
	MOVLW      10
	XORWF      _j+0, 0
L__main12:
	BTFSS      STATUS+0, 2
	GOTO       L_main8
;calisma1.c,21 :: 		j=0;
	CLRF       _j+0
	CLRF       _j+1
;calisma1.c,22 :: 		}
L_main8:
;calisma1.c,14 :: 		for(i=0;i<10;i++){
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;calisma1.c,28 :: 		}
	GOTO       L_main3
L_main4:
;calisma1.c,36 :: 		}
	GOTO       L_main1
;calisma1.c,42 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
