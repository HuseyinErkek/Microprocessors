void interrupt(){
    if(INTCON.INTE && INTCON.INTF) {
        PORTC.F0 = 1;  // veya PORTC = PORTC | 0x01; olarak da yazýlabilir
        INTCON.INTF = 0;
        delay_ms(50);
        // Ýsterseniz lambayý kapatmak için aþaðýdaki satýrý ekleyebilirsiniz:
         PORTC.F0 = 0;
    }
}

void main() {
    ANSEL = ANSELH = 0;
    TRISC.F0 = 0;  // Lamba çýkýþý olarak kullanýlacak pin
    PORTC.F0 = 0;  // Lambanýn baþlangýç durumu

    INTCON.GIE = 1;    // GLOBAL KESMELERE ÝZÝN VERÝR
    INTCON.INTE = 1;   // RB0 KESMESÝNE ÝZÝN VERÝR
    OPTION_REG.INTEDG = 1;  // YÜKSELEN KENARDA SÝNYAL OLUÞTUR
    PORTC = 0;

    while(1) {
        // Ana program burada çalýþmaya devam eder.
    }
}
