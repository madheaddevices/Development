_ADC_Init:
;ADC.mpas,12 :: 		begin
;ADC.mpas,13 :: 		AD1PCFG := (not channels);
NOR	R2, R25, R0
ANDI	R2, R2, 65535
SW	R2, Offset(AD1PCFG+0)(GP)
;ADC.mpas,14 :: 		AD1CON1 := 0x8000;
ORI	R2, R0, 32768
SW	R2, Offset(AD1CON1+0)(GP)
;ADC.mpas,15 :: 		AD1CON2 := 0x0;
SW	R0, Offset(AD1CON2+0)(GP)
;ADC.mpas,16 :: 		AD1CON3 := 0x4;
ORI	R2, R0, 4
SW	R2, Offset(AD1CON3+0)(GP)
;ADC.mpas,17 :: 		end;
L_end_ADC_Init:
JR	RA
NOP	
; end of _ADC_Init
_ADC_Read:
;ADC.mpas,20 :: 		begin
;ADC.mpas,21 :: 		result := 0;
; Result start address is: 8 (R2)
MOVZ	R2, R0, R0
;ADC.mpas,22 :: 		end;
; Result end address is: 8 (R2)
L_end_ADC_Read:
JR	RA
NOP	
; end of _ADC_Read
