
_main:

;calisma1.c,1 :: 		void main() {
;calisma1.c,2 :: 		TRISB=0;
	CLRF       TRISB+0
;calisma1.c,3 :: 		while(1){
L_main0:
;calisma1.c,4 :: 		PORTB.b1=1;
	BSF        PORTB+0, 1
;calisma1.c,5 :: 		}
	GOTO       L_main0
;calisma1.c,6 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
