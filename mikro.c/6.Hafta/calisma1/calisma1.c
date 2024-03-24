unsigned int rakam[]={0X3F, 0X06, 0X5B, 0X4F, 0X66, 0X6D, 0X7C, 0X07, 0X7F, 0X6F //0123456789
};
int i,j;
void main() {

TRISC=0;
PORTC=0;
TRISD=0;
PORTD=0;
delay_ms(20);
j =0;
while(1) {
PORTC=rakam[j];
for(i=0;i<10;i++){
PORTD=rakam[i];
delay_ms(20);
if(i==9){
j++;
}
if(j==10){
j=0;
}





}







}





}