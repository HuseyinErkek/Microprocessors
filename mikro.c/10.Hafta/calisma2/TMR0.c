int say=0; // bir de�i�ken tan�mlama
int cnt;
void interrupt(){                       1
cnt++;
if(cnt==125){
say=say+1;
PORTC=dec2bcd(say);
cnt=0;

} intcon.t0if=0;
tmr0=131;
//BAYRA�I �NTERRUPT B�T�M�DE SIFIRLIYORUZ
}
void main() {
TRISC=0;
OPTION_REG.T0CS=0;
OPTION_REG.PSA=0; // T�MER0
OPTION_REG.PS0=0;
OPTION_REG.PS1=1;
OPTION_REG.PS2=1;
INTCON.GIE=1;
INTCON.INTF=1;
TMR0=131;
 while(){
 
 }
}