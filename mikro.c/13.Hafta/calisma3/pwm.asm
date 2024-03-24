
_initMain:

;pwm.c,2 :: 		void initMain() {
;pwm.c,3 :: 		ANSEL = 0;
	CLRF       ANSEL+0
;pwm.c,4 :: 		ANSELH = 0;
	CLRF       ANSELH+0
;pwm.c,5 :: 		TRISA = 255;
	MOVLW      255
	MOVWF      TRISA+0
;pwm.c,6 :: 		TRISD = 0;
	CLRF       TRISD+0
;pwm.c,7 :: 		TRISC = 0;
	CLRF       TRISC+0
;pwm.c,8 :: 		PORTA = 0;
	CLRF       PORTA+0
;pwm.c,9 :: 		PORTD = 0;
	CLRF       PORTD+0
;pwm.c,10 :: 		PORTC = 0;
	CLRF       PORTC+0
;pwm.c,11 :: 		PWM1_Init(1000);
	BSF        T2CON+0, 0
	BSF        T2CON+0, 1
	MOVLW      124
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;pwm.c,12 :: 		}
L_end_initMain:
	RETURN
; end of _initMain

_main:

;pwm.c,13 :: 		void main() {
;pwm.c,14 :: 		initMain();
	CALL       _initMain+0
;pwm.c,15 :: 		duty = 128;
	MOVLW      128
	MOVWF      _duty+0
;pwm.c,16 :: 		temp_duty = 0;
	CLRF       _temp_duty+0
;pwm.c,17 :: 		PWM1_Start();
	CALL       _PWM1_Start+0
;pwm.c,18 :: 		while (1) {
L_main0:
;pwm.c,19 :: 		if (!PORTA.F0) duty+=4 ;
	BTFSC      PORTA+0, 0
	GOTO       L_main2
	MOVLW      4
	ADDWF      _duty+0, 1
L_main2:
;pwm.c,20 :: 		if (!PORTA.F1) duty-=4 ;
	BTFSC      PORTA+0, 1
	GOTO       L_main3
	MOVLW      4
	SUBWF      _duty+0, 1
L_main3:
;pwm.c,21 :: 		if (temp_duty != duty) {
	MOVF       _temp_duty+0, 0
	XORWF      _duty+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main4
;pwm.c,22 :: 		PWM1_Set_Duty(duty);
	MOVF       _duty+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;pwm.c,23 :: 		temp_duty = duty;
	MOVF       _duty+0, 0
	MOVWF      _temp_duty+0
;pwm.c,24 :: 		PORTD = temp_duty;
	MOVF       _duty+0, 0
	MOVWF      PORTD+0
;pwm.c,25 :: 		}
L_main4:
;pwm.c,26 :: 		Delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	DECFSZ     R11+0, 1
	GOTO       L_main5
;pwm.c,27 :: 		}
	GOTO       L_main0
;pwm.c,28 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
