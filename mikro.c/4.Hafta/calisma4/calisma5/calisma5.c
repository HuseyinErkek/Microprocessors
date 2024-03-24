void main() {
TRISB=0;
TRISA.f7=1;
ANSEL=0;
ANSELH=0;
PORTB=0;
while(1){
if(PORTA.f7==1){
    PORTB.f0=1;
}
if(PORTA.f7==0){
     PORTB.f0=0;

}

}

}