#line 1 "C:/Users/Hüseyin/Desktop/Mikro Ýþlemciler/mikro.c/calisma2.c"
void main() {
 TRISB=0;
 while(1){
 PORTB.f1=1;
 delay_ms(100);
 PORTB.f1=0;
 delay_ms(100);

 }

}
