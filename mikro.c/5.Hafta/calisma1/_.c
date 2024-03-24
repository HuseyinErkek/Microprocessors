void main() {
TRISB=0;
ANSEL=ANSELH=0;
PORTB=0B0010100;
delay_ms(50);
while(1){
PORTB=PORTB>>1;
delay_ms(50);
if(PORTB<=0b0000101){
PORTB=0b100000010;                      //binary olarka çevirin
delay_ms(50);
}
if(PORTB<=0b100000010){
PORTB=0b01000001;//binary olarka çevirin
delay_ms(50);

}
if(PORTB<=0b01000001){
PORTB=0b10100000;//binary olarka çevirin
delay_ms(50);
}

}
}