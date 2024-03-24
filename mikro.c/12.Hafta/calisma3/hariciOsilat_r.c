short count=0;
void interrupt(){
if(intcon.intf==1){
portc.f0=1;
intcon.t0ie=1;
intcon.intf=0;
}
if(intcon.t0ie=1){
if(count=45){
portc=0;
count=0;
}
count++;
portc.f0=0;
intcon.t0if=0;
}


}

void main() {
ANSEL=ANSELH=0;
TRISB=0XFF;
TRISC=0X00;
PORTC.F0=1;
OPTION_REG.T0CS=1;
OPTION_REG.PSA=0;
OPTION_REG.PS2=0;
OPTION_REG.PS1=0;
OPTION_REG.PS0;
//TIMER0=0;
INTCON.GIE=1;
INTCON.INTE=1;




}