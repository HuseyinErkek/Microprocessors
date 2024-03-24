
_main:

;calisma3.c,2 :: 		void main() {
;calisma3.c,4 :: 		int i = 0;
	CLRF       main_i_L0+0
	CLRF       main_i_L0+1
;calisma3.c,5 :: 		TRISC=0;
	CLRF       TRISC+0
;calisma3.c,6 :: 		PORTC = 0X3F      ;
	MOVLW      63
	MOVWF      PORTC+0
;calisma3.c,7 :: 		while(1){
L_main0:
;calisma3.c,8 :: 		if(i<0 || i > 9){
	MOVLW      128
	XORWF      main_i_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main8
	MOVLW      0
	SUBWF      main_i_L0+0, 0
L__main8:
	BTFSS      STATUS+0, 0
	GOTO       L__main6
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      main_i_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main9
	MOVF       main_i_L0+0, 0
	SUBLW      9
L__main9:
	BTFSS      STATUS+0, 0
	GOTO       L__main6
	GOTO       L_main4
L__main6:
;calisma3.c,9 :: 		i = 0;
	CLRF       main_i_L0+0
	CLRF       main_i_L0+1
;calisma3.c,10 :: 		}
L_main4:
;calisma3.c,11 :: 		PORTC = seg[i];
	MOVF       main_i_L0+0, 0
	ADDLW      _seg+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTC+0
;calisma3.c,12 :: 		delay_ms(50);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	NOP
	NOP
;calisma3.c,13 :: 		i++;
	INCF       main_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_i_L0+1, 1
;calisma3.c,14 :: 		}
	GOTO       L_main0
;calisma3.c,15 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
