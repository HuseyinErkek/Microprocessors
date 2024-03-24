#line 1 "C:/Users/Hüseyin/Desktop/Mikro Ýþlemciler1/mikro.c/9.Hafta/calisma1/Interrupt.c"
void interrupt(){
 if(INTCON.INTE && INTCON.INTF) {
 PORTC.F0 = 1;
 INTCON.INTF = 0;
 delay_ms(50);

 PORTC.F0 = 0;
 }
}

void main() {
 ANSEL = ANSELH = 0;
 TRISC.F0 = 0;
 PORTC.F0 = 0;

 INTCON.GIE = 1;
 INTCON.INTE = 1;
 OPTION_REG.INTEDG = 1;
 PORTC = 0;

 while(1) {

 }
}
