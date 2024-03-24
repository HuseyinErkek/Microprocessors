#line 1 "C:/Users/Hüseyin/Desktop/Mikro Ýþlemciler1/mikro.c/12.Hafta/calisma3/merdiven/merdiven.c"
short say=0;
void interrupt() {
if (intcon.intf==1){
portc.f0=1;
intcon.t0ie=1;
intcon.intf=0;
}
if (intcon.t0if==1) {
if (say==45) {
portc=0;
say=0;
intcon.t0ie=0;
}
say++;
portc.f0=0;
intcon.t0if=0;
}
}
void main() {
ansel=0; anselh=0;
trisb=0xff; trisc=0;
portc.f0=0;
option_reg=0b01000111;
intcon.GIE=1;
intcon.INTE=1;
while(1) { }
}
