#line 1 "C:/Users/H�seyin/Desktop/Mikro ��lemciler/mikro.c/5.Hafta/calisma2/calisma2.c"
void main() {
TRISB=0;
ANSEL=ANSELH=0;
PORTB=0;

delay_ms(20);
while(1){
 PORTB.b1=1;
PORTB.b0=1;
while(PORTB<128){
PORTB<<=1;
delay_ms(30);
}
while(PORTB>1){
PORTB>>=1;
delay_ms(30);
}
}

}
