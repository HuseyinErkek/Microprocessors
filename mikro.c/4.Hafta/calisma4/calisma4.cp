#line 1 "C:/Users/Hüseyin/Desktop/Mikro Ýþlemciler/mikro.c/calisma4/calisma4.c"
void main() {
#line 18 "C:/Users/Hüseyin/Desktop/Mikro Ýþlemciler/mikro.c/calisma4/calisma4.c"
 TRISB=0;
 ANSEL=0;
 ANSELH=0;
 PORTB=0b00000000;
 delay_ms(100);
 while(1){
 while(portb<255){
 PORTB++;
 delay_ms(50);
 }
 while(portb>0){
 PORTB--;
 delay_ms(50);
 }

 }



}
