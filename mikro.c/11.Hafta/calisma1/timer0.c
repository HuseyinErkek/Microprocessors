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
OPTION_REG.PSA=0; // psa s�f�r timer s�f�ra �evirir psa bir wdt ye �evirir oranlarda dolay� 000 wdtde 1:1 oldu�u i�in bir butob ba�� bir art�r�m timer s�ff�rda prescaler 000 1:2 olur iki buton bas�� 1 art�r�m yapar.
OPTION_REG.PS0=0;
OPTION_REG.PS1=0;
OPTION_REG.PS2=0;
TMR0=0;
while(1)
SSD();

}