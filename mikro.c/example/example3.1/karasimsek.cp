#line 1 "C:/Users/Hüseyin/Desktop/Mikro Ýþlemciler1/mikro.c/example/example3.1/karasimsek.c"

int sag=1;
void main() {
TRISB=0;
ANSEL=ANSELH=0;

PORTB=0b00110000;
delay_ms(50);
while(1){


if(sag==1){
PORTB=PORTB>>1;
delay_ms(50);
if(PORTB==0b00000011){
sag=0;
}
}
if(sag==0){
PORTB=PORTB<<1;
delay_ms(50);
if(PORTB==0b11000000){
sag=1;
}
}



}



}
