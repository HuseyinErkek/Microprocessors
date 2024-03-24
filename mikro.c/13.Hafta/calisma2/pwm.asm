
_main:

;pwm.c,4 :: 		void main() {
;pwm.c,5 :: 		ANSEL=ANSELH=0;
	CLRF       ANSELH+0
	CLRF       ANSEL+0
;pwm.c,6 :: 		TRISB=0XFF;
	MOVLW      255
	MOVWF      TRISB+0
;pwm.c,7 :: 		TRISC=0X00;
	CLRF       TRISC+0
;pwm.c,8 :: 		PWM1_Init(500);
	BSF        T2CON+0, 0
	BSF        T2CON+0, 1
	MOVLW      249
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;pwm.c,9 :: 		PWM1_Start();
	CALL       _PWM1_Start+0
;pwm.c,10 :: 		PWM1_Set_Duty(duty_1);
	MOVF       _duty_1+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;pwm.c,14 :: 		Delay_ms(500);
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
;pwm.c,15 :: 		PWM2_Init(1000);
	BSF        T2CON+0, 0
	BSF        T2CON+0, 1
	MOVLW      124
	MOVWF      PR2+0
	CALL       _PWM2_Init+0
;pwm.c,16 :: 		PWM2_Start();
	CALL       _PWM2_Start+0
;pwm.c,17 :: 		PWM2_Set_Duty(duty_2);
	MOVF       _duty_2+0, 0
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;pwm.c,18 :: 		while(1){
L_main1:
;pwm.c,19 :: 		if(!PORTB.F0){
	BTFSC      PORTB+0, 0
	GOTO       L_main3
;pwm.c,20 :: 		Delay_ms(50);
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
;pwm.c,21 :: 		duty_1=duty_1+16;
	MOVLW      16
	ADDWF      _duty_1+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      _duty_1+0
;pwm.c,22 :: 		PWM1_Set_Duty(duty_1);
	MOVF       R0+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;pwm.c,23 :: 		}
L_main3:
;pwm.c,24 :: 		if(!PORTB.F1){
	BTFSC      PORTB+0, 1
	GOTO       L_main5
;pwm.c,25 :: 		Delay_ms(50);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	NOP
	NOP
;pwm.c,26 :: 		duty_1=duty_1-16;
	MOVLW      16
	SUBWF      _duty_1+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      _duty_1+0
;pwm.c,27 :: 		PWM1_Set_Duty(duty_1);
	MOVF       R0+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;pwm.c,28 :: 		}
L_main5:
;pwm.c,29 :: 		if(!PORTB.F2){
	BTFSC      PORTB+0, 2
	GOTO       L_main7
;pwm.c,30 :: 		Delay_ms(50);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main8:
	DECFSZ     R13+0, 1
	GOTO       L_main8
	DECFSZ     R12+0, 1
	GOTO       L_main8
	NOP
	NOP
;pwm.c,31 :: 		duty_2=duty_2+16;
	MOVLW      16
	ADDWF      _duty_2+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      _duty_2+0
;pwm.c,32 :: 		PWM2_Set_Duty(duty_2);
	MOVF       R0+0, 0
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;pwm.c,33 :: 		}
L_main7:
;pwm.c,34 :: 		if(!PORTB.F3){
	BTFSC      PORTB+0, 3
	GOTO       L_main9
;pwm.c,35 :: 		Delay_ms(50);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main10:
	DECFSZ     R13+0, 1
	GOTO       L_main10
	DECFSZ     R12+0, 1
	GOTO       L_main10
	NOP
	NOP
;pwm.c,36 :: 		duty_2=duty_2-16;
	MOVLW      16
	SUBWF      _duty_2+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      _duty_2+0
;pwm.c,37 :: 		PWM1_Set_Duty(duty_2);
	MOVF       R0+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;pwm.c,38 :: 		}
L_main9:
;pwm.c,39 :: 		}
	GOTO       L_main1
;pwm.c,40 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
