 int temp;
 void main() {
 ANSEL=0b00000100;
 ANSELH=0b00000000;
 TRISA=0xFF;
 TRISC=0;
 PORTB=0;
 
 while(1){
 temp=ADC_Read(2);
 if(temp>=0&&temp<=51){
 PORTC=0;
 }
 if(temp>=51&&temp<255){
 PORTC=0b00001111;
 }
 if(temp>=255&&temp<511){
 PORTC=0b00111111;
 }
 if(temp>=511&&temp<=1023){
 PORTC=0b11111111;
 }
 
 }
 
}