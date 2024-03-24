void main() {
     TRISB=0;
    ANSEL=0;
    ANSELH=0;
     while(1){
     PORTB=0b10101010;
     delay_ms(100);
     PORTB=0b01010101;
     delay_ms(100);
     }

}