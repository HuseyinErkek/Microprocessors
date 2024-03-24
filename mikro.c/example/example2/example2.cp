#line 1 "C:/Users/Hüseyin/Desktop/Mikro Ýþlemciler1/mikro.c/example/example2/example2.c"
void main() {
ANSEL=ANSELH=0;
TRISB=0;
PORTB=0xFF;
delay_ms(100);
PORTB=0;
PORTB=0b11000000;
while(1){
PORTB=PORTB>>1;
delay_ms(20);
if(PORTB>=0b00000011){
PORTB=PORTB<<1;
}



}
#line 23 "C:/Users/Hüseyin/Desktop/Mikro Ýþlemciler1/mikro.c/example/example2/example2.c"
}
