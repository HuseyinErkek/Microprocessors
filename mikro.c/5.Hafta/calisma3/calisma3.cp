#line 1 "C:/Users/H�seyin/Desktop/Mikro ��lemciler/mikro.c/5.Hafta/calisma3/calisma3.c"
unsigned char seg []={0X3F ,0X06,0X5B,0X4F,0X66,0X6D,0X7C,0X07,0X7F,0X6F };
void main() {

int i = 0;
TRISC=0;
PORTC = 0X3F ;
while(1){
if(i<0 || i > 9){
i = 0;
}
PORTC = seg[i];
delay_ms(50);
i++;
}
}
