
_main:

;pwm.c,3 :: 		void main(){
;pwm.c,4 :: 		INTCON = 0;
	CLRF       INTCON+0
;pwm.c,5 :: 		TRISA = 0x04;
	MOVLW      4
	MOVWF      TRISA+0
;pwm.c,6 :: 		ANSEL=0B00000100;
	MOVLW      4
	MOVWF      ANSEL+0
;pwm.c,7 :: 		TRISC = 0;
	CLRF       TRISC+0
;pwm.c,8 :: 		PORTC = 0;
	CLRF       PORTC+0
;pwm.c,9 :: 		PWM1_Init(1000);
	BSF        T2CON+0, 0
	BSF        T2CON+0, 1
	MOVLW      124
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;pwm.c,11 :: 		Delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
	DECFSZ     R11+0, 1
	GOTO       L_main0
	NOP
	NOP
;pwm.c,12 :: 		PWM1_Start();
	CALL       _PWM1_Start+0
;pwm.c,13 :: 		while (1){
L_main1:
;pwm.c,14 :: 		adc_rd = ADC_Read(2);
	MOVLW      2
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _adc_rd+0
	MOVF       R0+1, 0
	MOVWF      _adc_rd+1
;pwm.c,15 :: 		Delay_ms(50);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	NOP
	NOP
;pwm.c,16 :: 		division = adc_rd/4;
	MOVF       _adc_rd+0, 0
	MOVWF      R0+0
	MOVF       _adc_rd+1, 0
	MOVWF      R0+1
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	MOVF       R0+0, 0
	MOVWF      _division+0
	MOVF       R0+1, 0
	MOVWF      _division+1
;pwm.c,17 :: 		PWM1_Set_Duty(division);
	MOVF       R0+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;pwm.c,18 :: 		Delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main4:
	DECFSZ     R13+0, 1
	GOTO       L_main4
	DECFSZ     R12+0, 1
	GOTO       L_main4
	DECFSZ     R11+0, 1
	GOTO       L_main4
	NOP
;pwm.c,19 :: 		}
	GOTO       L_main1
;pwm.c,20 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
