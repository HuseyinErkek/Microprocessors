#line 1 "C:/Users/Hüseyin/Desktop/Mikro Ýþlemciler1/mikro.c/13.Hafta/calisma1/pwm.c"
sbit LCD_RS at RC2_bit;
sbit LCD_EN at RC3_bit;
sbit LCD_D4 at RC4_bit;
sbit LCD_D5 at RC5_bit;
sbit LCD_D6 at RC6_bit;
sbit LCD_D7 at RC7_bit;



sbit LCD_RS_Direction at TRISC2_bit;
sbit LCD_EN_Direction at TRISC3_bit;
sbit LCD_D4_Direction at TRISC4_bit;
sbit LCD_D5_Direction at TRISC5_bit;
sbit LCD_D6_Direction at TRISC6_bit;
sbit LCD_D7_Direction at TRISC7_bit;



void main() {
TRISC = 0x00;
PWM2_Init(5000);
PWM2_Start();
Lcd_Init();
Lcd_Cmd(_LCD_CLEAR);
Lcd_Cmd(_LCD_CURSOR_OFF);


while (1) {
Lcd_Out(1,1,"25% Duty Cycle");
PWM2_Set_Duty(63);

Delay_ms(200);
Lcd_Out(1,1,"75% Duty Cycle");
PWM2_Set_Duty(192);
Delay_ms(200);
}
}
