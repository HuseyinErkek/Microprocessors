unsigned cnt;
void interrupt() {
cnt++;
TMR0 = 96;
INTCON = 0X20;
}

void main() {
OPTION_REG = 0X84;
ANSEL = 0;
TRISD = 0;
PORTD = 0X00;
TMR0 =96;
INTCON =0XA0;
cnt = 0;
do {
if (cnt == 400) {
PORTD = PORTD++;
cnt = 0;
}
}while (1);
}