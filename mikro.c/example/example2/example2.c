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

/*while(1){
PORTB=~PORTB;
delay_ms(50);
} */
}