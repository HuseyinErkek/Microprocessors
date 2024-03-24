sbit LCD_RS at RC2_bit;
sbit LCD_EN at RC3_bit;
sbit LCD_D4 at RC4_bit;
sbit LCD_D5 at RC5_bit;
sbit LCD_D6 at RC6_bit;
sbit LCD_D7 at RC7_bit;



sbit LCD_RS_Direction at TRISC2_bit;
sbit LCD_EN_Direction at  TRISC3_bit;
sbit LCD_D4_Direction at TRISC4_bit;
sbit LCD_D5_Direction at TRISC5_bit;
sbit LCD_D6_Direction at TRISC6_bit;
sbit LCD_D7_Direction at TRISC7_bit;



void main() {
TRISC = 0x00;
PWM2_Init(5000); // kare dalgan�n hz cinsinden sinyali.
PWM2_Start();  // PWM BASLATMA KISMI
Lcd_Init();
Lcd_Cmd(_LCD_CLEAR);
Lcd_Cmd(_LCD_CURSOR_OFF);


while (1) {
Lcd_Out(1,1,"25% Duty Cycle");
PWM2_Set_Duty(63); // 0-100 doluluk ora�n�n binary olarak giriyoruz.
//(63-127-192-255)
Delay_ms(200);
Lcd_Out(1,1,"75% Duty Cycle");
PWM2_Set_Duty(192); // 0-100 doluluk ora�n�n binary olarak giriyoruz.(63-127-192-255)
Delay_ms(200);
}
}