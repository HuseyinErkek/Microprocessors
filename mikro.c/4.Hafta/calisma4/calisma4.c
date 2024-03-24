void main() {
    /* TRISB=0;
     ANSEL=0;
     ANSELH=0;
     PORTB=0b10101010;
     while(1){
     PORTB=-PORTB; // terslem opretoru
     delay_ms(100);     */
    //--------------------------------------------------------------------------
    /*  TRISB=0;
     ANSEL=0;
     ANSELH=0;
     PORTB=0b00000000;//255ten buyuk bir sayý kullanýrsak sekiz bit gorucem.
     while(1){
     PORTB++;
     delay_ms(100);             */
     //-------------------------------------------------------------------------
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