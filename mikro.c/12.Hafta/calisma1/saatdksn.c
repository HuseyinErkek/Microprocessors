int tmrsay=0;
int sny=0;
int dk=0;
int saat=0;

void interrupt(){
tmrsay+=1;
tmr0=55;
intcon.t0if=0;
}

void main() {
ansel=anselh=0;
trisb=0;trisc=0;trisd=0;
portb=0;portc=0;portd=0;

OPTION_REG.T0CS=0;
OPTION_REG.PSA=0;
OPTION_REG.PS0=0;
OPTION_REG.PS1=0;
OPTION_REG.PS2=0;
INTCON.GIE=1;
INTCON.T0IE=1;
tmr0=55;



while(1){
if(tmrsay>=5000){
sny+=1;
portd=dec2bcd(sny);
tmrsay=0;
  }
  if(sny>=59){
dk+=1;
portc=dec2bcd(dk);
sny=0;
}
if(dk>=59){
saat+=1;
portb=dec2bcd(saat);
}
}
}