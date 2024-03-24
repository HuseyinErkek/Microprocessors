int i;
void main() {
ANSEL=ANSELH=0;
TRISB=0;
PORTB=0xFF;
delay_ms(100);
PORTB=0;
for(i=0;i<5;i++){
switch(PORTB){
case 0x00: PORTB=0XFF;
delay_ms(100);
break;
case 0xFF: PORTB=0x00;
delay_ms(250);
}
}
PORTB=0b10101010;
while(1){
delay_ms(50);
PORTB=~PORTB;


}
}