#line 1 "C:/Users/Hüseyin/Desktop/Mikro Ýþlemciler1/mikro.c/13.Hafta/calisma4/pwm.c"
unsigned int adc_rd;
unsigned int division;
void main(){
INTCON = 0;
TRISA = 0x04;
ANSEL=0B00000100;
TRISC = 0;
PORTC = 0;
PWM1_Init(1000);

Delay_ms(500);
PWM1_Start();
while (1){
adc_rd = ADC_Read(2);
Delay_ms(50);
division = adc_rd/4;
PWM1_Set_Duty(division);
Delay_ms(100);
}
}
