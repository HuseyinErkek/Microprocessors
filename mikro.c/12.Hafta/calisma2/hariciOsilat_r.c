//harici osilatorde 4 ile �arp�m yap�lmaz (a4 pinine harici ba�lanan osilator kaynaklarda ge�erli)
int Count =0;
void interrupt(){
Count++;
TMR0=6;
INTCON.T0IF=0;
}

void main() {
ANSEL=0;
ANSELH=0;
TRISA.f4=1;
PORTA=0;
TRISC=0;
PORTC=0;
OPTION_REG=0b00100000;
INTCON.GIE=1;
INTCON.T0IE=1;
TMR0=6;
while(1){
if(Count==2){
portc=~portc;
Count=0;

}


}
}