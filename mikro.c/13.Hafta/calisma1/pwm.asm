
_main:

;pwm.c,19 :: 		void main() {
;pwm.c,20 :: 		TRISC = 0x00;
	CLRF       TRISC+0
;pwm.c,21 :: 		PWM2_Init(5000); // kare dalganýn hz cinsinden sinyali.
	BSF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      99
	MOVWF      PR2+0
	CALL       _PWM2_Init+0
;pwm.c,22 :: 		PWM2_Start();  // PWM BASLATMA KISMI
	CALL       _PWM2_Start+0
;pwm.c,23 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;pwm.c,24 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;pwm.c,25 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;pwm.c,28 :: 		while (1) {
L_main0:
;pwm.c,29 :: 		Lcd_Out(1,1,"25% Duty Cycle");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_pwm+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;pwm.c,30 :: 		PWM2_Set_Duty(63); // 0-100 doluluk oraýnýn binary olarak giriyoruz.
	MOVLW      63
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;pwm.c,32 :: 		Delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
;pwm.c,33 :: 		Lcd_Out(1,1,"75% Duty Cycle");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_pwm+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;pwm.c,34 :: 		PWM2_Set_Duty(192); // 0-100 doluluk oraýnýn binary olarak giriyoruz.(63-127-192-255)
	MOVLW      192
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;pwm.c,35 :: 		Delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
;pwm.c,36 :: 		}
	GOTO       L_main0
;pwm.c,37 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
