void interrupt(){
    if(INTCON.INTE && INTCON.INTF) {
        PORTC.F0 = 1;  // veya PORTC = PORTC | 0x01; olarak da yaz�labilir
        INTCON.INTF = 0;
        delay_ms(50);
        // �sterseniz lambay� kapatmak i�in a�a��daki sat�r� ekleyebilirsiniz:
         PORTC.F0 = 0;
    }
}

void main() {
    ANSEL = ANSELH = 0;
    TRISC.F0 = 0;  // Lamba ��k��� olarak kullan�lacak pin
    PORTC.F0 = 0;  // Lamban�n ba�lang�� durumu

    INTCON.GIE = 1;    // GLOBAL KESMELERE �Z�N VER�R
    INTCON.INTE = 1;   // RB0 KESMES�NE �Z�N VER�R
    OPTION_REG.INTEDG = 1;  // Y�KSELEN KENARDA S�NYAL OLU�TUR
    PORTC = 0;

    while(1) {
        // Ana program burada �al��maya devam eder.
    }
}
