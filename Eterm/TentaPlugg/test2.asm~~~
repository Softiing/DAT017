	@Input at PE0-7
	@Output at PD0-16


	LDR	R0,=0x55555555 @ Setup port D
	LDR	R1,=0x40020C00 @ Setup port D
	STR	R0,[R1]	       @ Setup port D
	LDR	R3,=0x40021000 @ Setup port E
	LDR 	R0,=0x0		@ Start value
	LDR	R2,=0x10	@Offset within port E
loop:	LDRSB	R4,[R3,R2]
	STR	R0,[R1,#0x14]
	ADD	R0,R0,R4
	BL	loop
