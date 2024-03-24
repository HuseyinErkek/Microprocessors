#line 1 "C:/Users/Hüseyin/Desktop/Mikro Ýþlemciler1/mikro.c/11.Hafta/calisma1/timer0.c"
void SSD(){
char LED[16]={0x3F, 0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x7F,0x6F,0x77,0x7C,0x39,0x5E,0x79,0x71};
PORTB=LED[TMR0];
if(TMR0==16) TMR0=0;

}

void main() {
PORTA=0x00;
PORTB=0x00;
TRISA.TRISA4=1;
TRISB=0x00;
OSCCON=0x70;
OPTION_REG.T0CS=1;
OPTION_REG.T0SE=1;
OPTION_REG.PSA=0;
OPTION_REG.PS0=0;
OPTION_REG.PS1=0;
OPTION_REG.PS2=0;
TMR0=0;
while(1)
SSD();

}
