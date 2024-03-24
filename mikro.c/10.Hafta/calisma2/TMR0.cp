#line 1 "C:/Users/Hüseyin/Desktop/Mikro Ýþlemciler1/mikro.c/10.Hafta/calisma2/TMR0.c"
int say=0;
int cnt;
void interrupt(){
cnt++;
if(cnt==125){
say=say+1;
PORTC=dec2bcd(say);
cnt=0;

} intcon.t0if=0;
tmr0=131;

}
void main() {
TRISC=0;
OPTION_REG.T0CS=0;
OPTION_REG.PSA=0;
OPTION_REG.PS0=0;
OPTION_REG.PS1=1;
OPTION_REG.PS2=1;
INTCON.GIE=1;
INTCON.INTF=1;
TMR0=131;

}
