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
Lcd_Init();
Lcd_Cmd(_LCD_CURSOR_OFF);  // ekranda imleç yanýp sonmesin diye
Lcd_Cmd(_LCD_CLEAR);
Lcd_Out(1,9,"Merhaba Dünya"); //1. satýrda baþlayalým
delay_ms(50);
Lcd_Cmd(_LCD_CLEAR);
Lcd_Out(2,6,"Bye");
delay_ms(50);
Lcd_Cmd(_LCD_CLEAR);  // 2. satýrý kullanýyourz

}