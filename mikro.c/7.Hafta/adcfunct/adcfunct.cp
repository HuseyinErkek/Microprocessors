#line 1 "C:/Users/Hüseyin/Desktop/Mikro Ýþlemciler/mikro.c/7.Hafta/adcfunct/adcfunct.c"
int temp;
void main() {


 ADCON0=0b00001001;
 TRISA=0xFF;
 TRISB=0;
 TRISC=0;
 TRISD=0;
 ADCON1.b7=1;

 while(1){
 ADCON0.b1=1;
 delay_ms(50);
 PORTC=ADRESL;
 PORTD=ADRESH;
 ADCON0.b1=0;

 }
}
