#line 1 "C:/Users/Hüseyin/Desktop/Mikro Ýþlemciler1/mikro.c/8.Hafta/calisma1/Interrupt.c"
int SAY;
void interrupt(){
SAY++;
PORTC=Dec2Bcd(SAY);
INTCON.INTF=0;
}
void main() {
ANSEL=ANSELH=0;
TRISC=0X00;
TRISB=0XFF;
INTCON.GIE=1;
INTCON.INTE=1;

OPTION_REG.INTEDG=1;
PORTC=0;



}
