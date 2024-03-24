#line 1 "C:/Users/Hüseyin/Desktop/Mikro Ýþlemciler1/mikro.c/5.Hafta/calisma1/_.c"
void main() {
TRISB=0;
ANSEL=ANSELH=0;
PORTB=0B0010100;
delay_ms(50);
while(1){
PORTB=PORTB>>1;
delay_ms(50);
if(PORTB<=0b0000101){
PORTB=0b100000010;
delay_ms(50);
}
if(PORTB<=0b100000010){
PORTB=0b01000001;
delay_ms(50);

}
if(PORTB<=0b01000001){
PORTB=0b10100000;
delay_ms(50);
}

}
}
