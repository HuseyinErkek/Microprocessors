int temp;
void main() {
     //   ANSEL=0X04;
     // ALSELH=0;
     ADCON0=0b00001001;
     TRISA=0xFF;
     TRISB=0;
     TRISC=0;
     TRISD=0;
     ADCON1.b7=1;
     
     while(1){
     ADCON0.b1=1; // adc fucnt execute
     delay_ms(50);
     PORTC=ADRESL;
     PORTD=ADRESH;
     ADCON0.b1=0; // fonk durdurduk
     
     }
}