_Init:
;template_main.mpas,10 :: 		begin
;template_main.mpas,11 :: 		AD1PCFG := 0xFFFF;        // All pins are digital
ORI	R2, R0, 65535
SW	R2, Offset(AD1PCFG+0)(GP)
;template_main.mpas,12 :: 		TRISD:=0;                 // PORTD to be outputs
SW	R0, Offset(TRISD+0)(GP)
;template_main.mpas,13 :: 		LATD:=0;                  // PORTD turn to off
SW	R0, Offset(LATD+0)(GP)
;template_main.mpas,14 :: 		end;
L_end_Init:
JR	RA
NOP	
; end of _Init
_main:
;template_main.mpas,16 :: 		begin                          // Main loop
;template_main.mpas,17 :: 		Init;                        // Call Init procedure
JAL	_Init+0
NOP	
;template_main.mpas,18 :: 		while true do
L__main3:
;template_main.mpas,20 :: 		DATA_LED := not DATA_LED;
_LX	
EXT	R2, R2, BitPos(LATD6_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATD6_bit+0), 1
_SX	
;template_main.mpas,21 :: 		delay_ms(500);
LUI	R24, 203
ORI	R24, R24, 29524
L__main7:
ADDIU	R24, R24, -1
BNE	R24, R0, L__main7
NOP	
NOP	
NOP	
;template_main.mpas,22 :: 		end;
J	L__main3
NOP	
;template_main.mpas,23 :: 		end.
L_end_main:
L__main_end_loop:
J	L__main_end_loop
NOP	
; end of _main
