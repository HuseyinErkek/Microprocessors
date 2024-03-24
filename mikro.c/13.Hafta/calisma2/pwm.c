short duty_1=128;
short duty_2=128;

void main() {
ANSEL=ANSELH=0;
TRISB=0XFF;
TRISC=0X00;
PWM1_Init(500);
PWM1_Start();
PWM1_Set_Duty(duty_1);
// Tek bir timer2 modulu kullandýklarý için en son ayarlana frenkansta
// gösterim oluyor ikisi icinde ama araya uzun bir delay atarsak farklý
// þekilde ossiloskopta görebiliriz
Delay_ms(500);
PWM2_Init(1000);
PWM2_Start();
PWM2_Set_Duty(duty_2);
while(1){
if(!PORTB.F0){
Delay_ms(50);
duty_1=duty_1+16;
PWM1_Set_Duty(duty_1);
}
if(!PORTB.F1){
Delay_ms(50);
duty_1=duty_1-16;
PWM1_Set_Duty(duty_1);
}
if(!PORTB.F2){
Delay_ms(50);
duty_2=duty_2+16;
PWM2_Set_Duty(duty_2);
}
if(!PORTB.F3){
Delay_ms(50);
duty_2=duty_2-16;
PWM1_Set_Duty(duty_2);
}
}
}