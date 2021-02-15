_Timer1Interrupt:
;djsync.mpas,70 :: 		begin
RDPGPR	SP, SP
ADDIU	SP, SP, -12
MFC0	R30, 12, 2
SW	R30, 8(SP)
MFC0	R30, 14, 0
SW	R30, 4(SP)
MFC0	R30, 12, 0
SW	R30, 0(SP)
INS	R30, R0, 1, 15
ORI	R30, R0, 7168
MTC0	R30, 12, 0
ADDIU	SP, SP, -4
SW	RA, 0(SP)
;djsync.mpas,71 :: 		T1IF_bit	 := 0;
LUI	R2, BitMask(T1IF_bit+0)
ORI	R2, R2, BitMask(T1IF_bit+0)
_SX	
;djsync.mpas,73 :: 		if Timer1_Counter = 1000 then Timer1_Counter := 0 else inc(Timer1_Counter);
LHU	R3, Offset(_Timer1_Counter+0)(GP)
ORI	R2, R0, 1000
BEQ	R3, R2, L__Timer1Interrupt43
NOP	
J	L__Timer1Interrupt2
NOP	
L__Timer1Interrupt43:
SH	R0, Offset(_Timer1_Counter+0)(GP)
J	L__Timer1Interrupt3
NOP	
L__Timer1Interrupt2:
LHU	R2, Offset(_Timer1_Counter+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_Timer1_Counter+0)(GP)
L__Timer1Interrupt3:
;djsync.mpas,74 :: 		if Timer1_Counter mod 1000 = 0 then
LHU	R3, Offset(_Timer1_Counter+0)(GP)
ORI	R2, R0, 1000
DIVU	R3, R2
MFHI	R2
ANDI	R2, R2, 65535
BEQ	R2, R0, L__Timer1Interrupt44
NOP	
J	L__Timer1Interrupt5
NOP	
L__Timer1Interrupt44:
;djsync.mpas,77 :: 		Time := 32676 - rand;
JAL	_rand+0
NOP	
ORI	R3, R0, 32676
SUBU	R2, R3, R2
SH	R2, Offset(_Time+0)(GP)
;djsync.mpas,78 :: 		end;
L__Timer1Interrupt5:
;djsync.mpas,79 :: 		Temp := not Temp; // debug output for interrupt calling test, 1kHz output
_LX	
EXT	R2, R2, BitPos(LATG6_bit+0), 1
XORI	R3, R2, 1
_LX	
INS	R2, R3, BitPos(LATG6_bit+0), 1
_SX	
;djsync.mpas,80 :: 		if Segment_Counter = 3 then Segment_Counter := 0 else inc(Segment_Counter);
LBU	R3, Offset(_Segment_Counter+0)(GP)
ORI	R2, R0, 3
BEQ	R3, R2, L__Timer1Interrupt45
NOP	
J	L__Timer1Interrupt8
NOP	
L__Timer1Interrupt45:
SB	R0, Offset(_Segment_Counter+0)(GP)
J	L__Timer1Interrupt9
NOP	
L__Timer1Interrupt8:
LBU	R2, Offset(_Segment_Counter+0)(GP)
ADDIU	R2, R2, 1
SB	R2, Offset(_Segment_Counter+0)(GP)
L__Timer1Interrupt9:
;djsync.mpas,81 :: 		end;
L_end_Timer1Interrupt:
LW	RA, 0(SP)
ADDIU	SP, SP, 4
DI	
EHB	
LW	R30, 8(SP)
MTC0	R30, 12, 2
LW	R30, 4(SP)
MTC0	R30, 14, 0
LW	R30, 0(SP)
MTC0	R30, 12, 0
ADDIU	SP, SP, 12
WRPGPR	SP, SP
ERET	
; end of _Timer1Interrupt
_Timer2Interrupt:
;djsync.mpas,84 :: 		begin
RDPGPR	SP, SP
ADDIU	SP, SP, -12
MFC0	R30, 12, 2
SW	R30, 8(SP)
MFC0	R30, 14, 0
SW	R30, 4(SP)
MFC0	R30, 12, 0
SW	R30, 0(SP)
INS	R30, R0, 1, 15
ORI	R30, R0, 7168
MTC0	R30, 12, 0
;djsync.mpas,85 :: 		T2IF_bit	 := 0;
LUI	R2, BitMask(T2IF_bit+0)
ORI	R2, R2, BitMask(T2IF_bit+0)
_SX	
;djsync.mpas,87 :: 		end;
L_end_Timer2Interrupt:
DI	
EHB	
LW	R30, 8(SP)
MTC0	R30, 12, 2
LW	R30, 4(SP)
MTC0	R30, 14, 0
LW	R30, 0(SP)
MTC0	R30, 12, 0
ADDIU	SP, SP, 12
WRPGPR	SP, SP
ERET	
; end of _Timer2Interrupt
_InitTimer1:
;djsync.mpas,91 :: 		begin
;djsync.mpas,92 :: 		T1CON	         := 0x8010; //0x8010
ORI	R2, R0, 32784
SW	R2, Offset(T1CON+0)(GP)
;djsync.mpas,93 :: 		T1IP0_bit	 := 1;
LUI	R2, BitMask(T1IP0_bit+0)
ORI	R2, R2, BitMask(T1IP0_bit+0)
_SX	
;djsync.mpas,94 :: 		T1IP1_bit	 := 1;
LUI	R2, BitMask(T1IP1_bit+0)
ORI	R2, R2, BitMask(T1IP1_bit+0)
_SX	
;djsync.mpas,95 :: 		T1IP2_bit	 := 1;
LUI	R2, BitMask(T1IP2_bit+0)
ORI	R2, R2, BitMask(T1IP2_bit+0)
_SX	
;djsync.mpas,96 :: 		T1IF_bit	 := 0;
LUI	R2, BitMask(T1IF_bit+0)
ORI	R2, R2, BitMask(T1IF_bit+0)
_SX	
;djsync.mpas,97 :: 		T1IE_bit	 := 1;
LUI	R2, BitMask(T1IE_bit+0)
ORI	R2, R2, BitMask(T1IE_bit+0)
_SX	
;djsync.mpas,98 :: 		PR1		 := 10000;
ORI	R2, R0, 10000
SW	R2, Offset(PR1+0)(GP)
;djsync.mpas,99 :: 		TMR1		 := 0;
SW	R0, Offset(TMR1+0)(GP)
;djsync.mpas,100 :: 		Time := 0;
SH	R0, Offset(_Time+0)(GP)
;djsync.mpas,101 :: 		end;
L_end_InitTimer1:
JR	RA
NOP	
; end of _InitTimer1
_InitTimer2:
;djsync.mpas,104 :: 		begin
;djsync.mpas,105 :: 		T2CON	 := 0x8040;
ORI	R2, R0, 32832
SW	R2, Offset(T2CON+0)(GP)
;djsync.mpas,106 :: 		T2IP0_bit	 := 1;
LUI	R2, BitMask(T2IP0_bit+0)
ORI	R2, R2, BitMask(T2IP0_bit+0)
_SX	
;djsync.mpas,107 :: 		T2IP1_bit	 := 1;
LUI	R2, BitMask(T2IP1_bit+0)
ORI	R2, R2, BitMask(T2IP1_bit+0)
_SX	
;djsync.mpas,108 :: 		T2IP2_bit	 := 1;
LUI	R2, BitMask(T2IP2_bit+0)
ORI	R2, R2, BitMask(T2IP2_bit+0)
_SX	
;djsync.mpas,109 :: 		T2IF_bit	 := 0;
LUI	R2, BitMask(T2IF_bit+0)
ORI	R2, R2, BitMask(T2IF_bit+0)
_SX	
;djsync.mpas,110 :: 		T2IE_bit	 := 1;
LUI	R2, BitMask(T2IE_bit+0)
ORI	R2, R2, BitMask(T2IE_bit+0)
_SX	
;djsync.mpas,111 :: 		PR2		 := 50000;
ORI	R2, R0, 50000
SW	R2, Offset(PR2+0)(GP)
;djsync.mpas,112 :: 		TMR2		 := 0
SW	R0, Offset(TMR2+0)(GP)
;djsync.mpas,113 :: 		end;
L_end_InitTimer2:
JR	RA
NOP	
; end of _InitTimer2
_LEDCHAR4:
;djsync.mpas,138 :: 		begin
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;djsync.mpas,140 :: 		WordToStrWithZeros(in_number, outputTXT);
SW	R26, 4(SP)
ADDIU	R2, SP, 10
SH	R25, 8(SP)
MOVZ	R26, R2, R0
JAL	_WordToStrWithZeros+0
NOP	
LHU	R25, 8(SP)
;djsync.mpas,141 :: 		digit1:= outputTXT[1]-48;
LBU	R2, 11(SP)
ADDIU	R2, R2, -48
; digit1 start address is: 16 (R4)
ANDI	R4, R2, 255
;djsync.mpas,142 :: 		digit2:= outputTXT[2]-48;
LBU	R2, 12(SP)
ADDIU	R2, R2, -48
; digit2 start address is: 20 (R5)
ANDI	R5, R2, 255
;djsync.mpas,143 :: 		digit3:= outputTXT[3]-48;
LBU	R2, 13(SP)
ADDIU	R2, R2, -48
; digit3 start address is: 24 (R6)
ANDI	R6, R2, 255
;djsync.mpas,144 :: 		digit4:= outputTXT[4]-48;
LBU	R2, 14(SP)
ADDIU	R2, R2, -48
; digit4 start address is: 28 (R7)
ANDI	R7, R2, 255
;djsync.mpas,146 :: 		if Segment_Counter = 0 then
LBU	R2, Offset(_Segment_Counter+0)(GP)
BEQ	R2, R0, L__LEDCHAR450
NOP	
J	L__LEDCHAR415
NOP	
L__LEDCHAR450:
;djsync.mpas,148 :: 		LATE := 0;
SW	R0, Offset(LATE+0)(GP)
;djsync.mpas,149 :: 		SEG1:=1;
LUI	R2, BitMask(LATF4_bit+0)
ORI	R2, R2, BitMask(LATF4_bit+0)
_SX	
;djsync.mpas,150 :: 		LATE:= LED_char[digit4];
ANDI	R3, R7, 255
; digit4 end address is: 28 (R7)
LUI	R2, hi_addr(_LED_char+0)
ORI	R2, R2, lo_addr(_LED_char+0)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SW	R2, Offset(LATE+0)(GP)
;djsync.mpas,151 :: 		SEG4:=0;
LUI	R2, BitMask(LATG7_bit+0)
ORI	R2, R2, BitMask(LATG7_bit+0)
_SX	
;djsync.mpas,152 :: 		end;
L__LEDCHAR415:
;djsync.mpas,154 :: 		if (Segment_Counter = 1) then
LBU	R3, Offset(_Segment_Counter+0)(GP)
ORI	R2, R0, 1
BEQ	R3, R2, L__LEDCHAR451
NOP	
J	L__LEDCHAR418
NOP	
L__LEDCHAR451:
;djsync.mpas,156 :: 		LATE := 0;
SW	R0, Offset(LATE+0)(GP)
;djsync.mpas,157 :: 		SEG4:=1;
LUI	R2, BitMask(LATG7_bit+0)
ORI	R2, R2, BitMask(LATG7_bit+0)
_SX	
;djsync.mpas,158 :: 		if in_number >= 10 then LATE:= LED_char[digit3] else LATE:=0;
ANDI	R2, R25, 65535
SLTIU	R2, R2, 10
BEQ	R2, R0, L__LEDCHAR452
NOP	
J	L__LEDCHAR421
NOP	
L__LEDCHAR452:
ANDI	R3, R6, 255
; digit3 end address is: 24 (R6)
LUI	R2, hi_addr(_LED_char+0)
ORI	R2, R2, lo_addr(_LED_char+0)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SW	R2, Offset(LATE+0)(GP)
J	L__LEDCHAR422
NOP	
L__LEDCHAR421:
SW	R0, Offset(LATE+0)(GP)
L__LEDCHAR422:
;djsync.mpas,159 :: 		SEG3:=0;
LUI	R2, BitMask(LATG8_bit+0)
ORI	R2, R2, BitMask(LATG8_bit+0)
_SX	
;djsync.mpas,160 :: 		end;
L__LEDCHAR418:
;djsync.mpas,162 :: 		if (Segment_Counter = 2) then
LBU	R3, Offset(_Segment_Counter+0)(GP)
ORI	R2, R0, 2
BEQ	R3, R2, L__LEDCHAR453
NOP	
J	L__LEDCHAR424
NOP	
L__LEDCHAR453:
;djsync.mpas,164 :: 		LATE := 0;
SW	R0, Offset(LATE+0)(GP)
;djsync.mpas,165 :: 		SEG3:=1;
LUI	R2, BitMask(LATG8_bit+0)
ORI	R2, R2, BitMask(LATG8_bit+0)
_SX	
;djsync.mpas,166 :: 		if in_number >= 100 then LATE:= LED_char[digit2] else LATE:=0;
ANDI	R2, R25, 65535
SLTIU	R2, R2, 100
BEQ	R2, R0, L__LEDCHAR454
NOP	
J	L__LEDCHAR427
NOP	
L__LEDCHAR454:
ANDI	R3, R5, 255
; digit2 end address is: 20 (R5)
LUI	R2, hi_addr(_LED_char+0)
ORI	R2, R2, lo_addr(_LED_char+0)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SW	R2, Offset(LATE+0)(GP)
J	L__LEDCHAR428
NOP	
L__LEDCHAR427:
SW	R0, Offset(LATE+0)(GP)
L__LEDCHAR428:
;djsync.mpas,168 :: 		SEG2:=0;
LUI	R2, BitMask(LATF5_bit+0)
ORI	R2, R2, BitMask(LATF5_bit+0)
_SX	
;djsync.mpas,169 :: 		end;
L__LEDCHAR424:
;djsync.mpas,171 :: 		if (Segment_Counter = 3) then
LBU	R3, Offset(_Segment_Counter+0)(GP)
ORI	R2, R0, 3
BEQ	R3, R2, L__LEDCHAR455
NOP	
J	L__LEDCHAR430
NOP	
L__LEDCHAR455:
;djsync.mpas,173 :: 		LATE := 0;
SW	R0, Offset(LATE+0)(GP)
;djsync.mpas,174 :: 		SEG2:=1;
LUI	R2, BitMask(LATF5_bit+0)
ORI	R2, R2, BitMask(LATF5_bit+0)
_SX	
;djsync.mpas,175 :: 		SEG1:=0;
LUI	R2, BitMask(LATF4_bit+0)
ORI	R2, R2, BitMask(LATF4_bit+0)
_SX	
;djsync.mpas,176 :: 		if in_number >= 1000 then LATE:= LED_char[digit1] else LATE:=0;
ANDI	R2, R25, 65535
SLTIU	R2, R2, 1000
BEQ	R2, R0, L__LEDCHAR456
NOP	
J	L__LEDCHAR433
NOP	
L__LEDCHAR456:
ANDI	R3, R4, 255
; digit1 end address is: 16 (R4)
LUI	R2, hi_addr(_LED_char+0)
ORI	R2, R2, lo_addr(_LED_char+0)
ADDU	R2, R2, R3
LBU	R2, 0(R2)
ANDI	R2, R2, 255
SW	R2, Offset(LATE+0)(GP)
J	L__LEDCHAR434
NOP	
L__LEDCHAR433:
SW	R0, Offset(LATE+0)(GP)
L__LEDCHAR434:
;djsync.mpas,177 :: 		SEG1:=0;
LUI	R2, BitMask(LATF4_bit+0)
ORI	R2, R2, BitMask(LATF4_bit+0)
_SX	
;djsync.mpas,178 :: 		end;
L__LEDCHAR430:
;djsync.mpas,179 :: 		end;
L_end_LEDCHAR4:
LW	R26, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _LEDCHAR4
_Init:
;djsync.mpas,182 :: 		begin
ADDIU	SP, SP, -24
SW	RA, 0(SP)
;djsync.mpas,184 :: 		UART1_Init(57600);
SW	R25, 4(SP)
ORI	R25, R0, 57600
JAL	_UART1_Init+0
NOP	
;djsync.mpas,185 :: 		UART1_Write_Text('Debug mode ON');
ADDIU	R3, SP, 8
ORI	R2, R0, 68
SB	R2, 0(R3)
ORI	R2, R0, 101
SB	R2, 1(R3)
ORI	R2, R0, 98
SB	R2, 2(R3)
ORI	R2, R0, 117
SB	R2, 3(R3)
ORI	R2, R0, 103
SB	R2, 4(R3)
ORI	R2, R0, 32
SB	R2, 5(R3)
ORI	R2, R0, 109
SB	R2, 6(R3)
ORI	R2, R0, 111
SB	R2, 7(R3)
ORI	R2, R0, 100
SB	R2, 8(R3)
ORI	R2, R0, 101
SB	R2, 9(R3)
ORI	R2, R0, 32
SB	R2, 10(R3)
ORI	R2, R0, 79
SB	R2, 11(R3)
ORI	R2, R0, 78
SB	R2, 12(R3)
SB	R0, 13(R3)
ADDIU	R2, SP, 8
MOVZ	R25, R2, R0
JAL	_UART1_Write_Text+0
NOP	
;djsync.mpas,186 :: 		UART1_Write(13);
ORI	R25, R0, 13
JAL	_UART1_Write+0
NOP	
;djsync.mpas,188 :: 		DisableInterrupts;
DI	R30
;djsync.mpas,189 :: 		Time := 0;
SH	R0, Offset(_Time+0)(GP)
;djsync.mpas,190 :: 		AD1PCFG := 0xFFFF;         // All pins are digital
ORI	R2, R0, 65535
SW	R2, Offset(AD1PCFG+0)(GP)
;djsync.mpas,191 :: 		TRISB15_bit := 1;          // RB15 input
LUI	R2, BitMask(TRISB15_bit+0)
ORI	R2, R2, BitMask(TRISB15_bit+0)
_SX	
;djsync.mpas,193 :: 		TRISF4_bit := 0;
LUI	R2, BitMask(TRISF4_bit+0)
ORI	R2, R2, BitMask(TRISF4_bit+0)
_SX	
;djsync.mpas,194 :: 		TRISF5_bit := 0;
LUI	R2, BitMask(TRISF5_bit+0)
ORI	R2, R2, BitMask(TRISF5_bit+0)
_SX	
;djsync.mpas,195 :: 		TRISG8_bit := 0;
LUI	R2, BitMask(TRISG8_bit+0)
ORI	R2, R2, BitMask(TRISG8_bit+0)
_SX	
;djsync.mpas,196 :: 		TRISG7_bit := 0;
LUI	R2, BitMask(TRISG7_bit+0)
ORI	R2, R2, BitMask(TRISG7_bit+0)
_SX	
;djsync.mpas,197 :: 		TRISG6_bit := 0;
LUI	R2, BitMask(TRISG6_bit+0)
ORI	R2, R2, BitMask(TRISG6_bit+0)
_SX	
;djsync.mpas,199 :: 		TRISE := 0;                // PORTE to be outputs
SW	R0, Offset(TRISE+0)(GP)
;djsync.mpas,200 :: 		LATE := 0;                 // PORTE set off
SW	R0, Offset(LATE+0)(GP)
;djsync.mpas,201 :: 		MVEC_bit := 1;
LUI	R2, BitMask(MVEC_bit+0)
ORI	R2, R2, BitMask(MVEC_bit+0)
_SX	
;djsync.mpas,202 :: 		InitTimer1;                // Init. Timer1 ISR - Read UI / 1kHz
JAL	_InitTimer1+0
NOP	
;djsync.mpas,203 :: 		InitTimer2;                // Init. Timer2 ISR - Refresh UI / 100Hz
JAL	_InitTimer2+0
NOP	
;djsync.mpas,205 :: 		dummy := PORTD;
LW	R2, Offset(PORTD+0)(GP)
SH	R2, Offset(_dummy+0)(GP)
;djsync.mpas,206 :: 		CNIF_bit := 0;
LUI	R2, BitMask(CNIF_bit+0)
ORI	R2, R2, BitMask(CNIF_bit+0)
_SX	
;djsync.mpas,207 :: 		EnableInterrupts;
EI	R30
;djsync.mpas,208 :: 		SEG1 := 1;
LUI	R2, BitMask(LATF4_bit+0)
ORI	R2, R2, BitMask(LATF4_bit+0)
_SX	
;djsync.mpas,209 :: 		SEG2 := 1;
LUI	R2, BitMask(LATF5_bit+0)
ORI	R2, R2, BitMask(LATF5_bit+0)
_SX	
;djsync.mpas,210 :: 		SEG3 := 1;
LUI	R2, BitMask(LATG8_bit+0)
ORI	R2, R2, BitMask(LATG8_bit+0)
_SX	
;djsync.mpas,211 :: 		SEG4 := 1;
LUI	R2, BitMask(LATG7_bit+0)
ORI	R2, R2, BitMask(LATG7_bit+0)
_SX	
;djsync.mpas,213 :: 		Timer1_Counter := 0;
SH	R0, Offset(_Timer1_Counter+0)(GP)
;djsync.mpas,214 :: 		Segment_Counter := 0;
SB	R0, Offset(_Segment_Counter+0)(GP)
;djsync.mpas,216 :: 		srand(30000);
ORI	R25, R0, 30000
JAL	_srand+0
NOP	
;djsync.mpas,217 :: 		end;
L_end_Init:
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 24
JR	RA
NOP	
; end of _Init
_main:
;djsync.mpas,219 :: 		begin                          // Main loop
;djsync.mpas,220 :: 		Init;                        // Call Init procedure
JAL	_Init+0
NOP	
;djsync.mpas,221 :: 		while true do
L__main38:
;djsync.mpas,223 :: 		LEDCHAR4(1);
ORI	R25, R0, 1
JAL	_LEDCHAR4+0
NOP	
;djsync.mpas,224 :: 		end;
J	L__main38
NOP	
;djsync.mpas,225 :: 		end.
L_end_main:
L__main_end_loop:
J	L__main_end_loop
NOP	
; end of _main
