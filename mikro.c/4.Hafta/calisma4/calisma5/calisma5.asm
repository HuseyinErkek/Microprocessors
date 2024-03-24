
_main:

;calisma5.c,1 :: 		void main() {
;calisma5.c,2 :: 		TRISB=0;
	CLRF       TRISB+0
;calisma5.c,3 :: 		TRISA.f7=1;
	BSF        TRISA+0, 7
;calisma5.c,4 :: 		ANSEL=0;
	CLRF       ANSEL+0
;calisma5.c,5 :: 		ANSELH=0;
	CLRF       ANSELH+0
;calisma5.c,6 :: 		PORTB=0;
	CLRF       PORTB+0
;calisma5.c,7 :: 		while(1){
L_main0:
;calisma5.c,8 :: 		if(PORTA.f7==1){
	BTFSS      PORTA+0, 7
	GOTO       L_main2
;calisma5.c,9 :: 		PORTB.f0=1;
	BSF        PORTB+0, 0
;calisma5.c,10 :: 		}
L_main2:
;calisma5.c,11 :: 		if(PORTA.f7==0){
	BTFSC      PORTA+0, 7
	GOTO       L_main3
;calisma5.c,12 :: 		PORTB.f0=0;
	BCF        PORTB+0, 0
;calisma5.c,14 :: 		}
L_main3:
;calisma5.c,16 :: 		}
	GOTO       L_main0
;calisma5.c,18 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
