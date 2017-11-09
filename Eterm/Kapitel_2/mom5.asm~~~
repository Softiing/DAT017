	LDR	R6,=0x55555555
	LDR	R5,=0x40020C00	@ Addr till port D
	STR	R6,[R5]		@ Sätt utport
	LDR	R5,=0x40020C14	@ Adr till port D utport
	LDR	R6,=0x40021010	@ Adr till port D inport
main:
	LDRSB	R0,[R6]		@ Ladda första byte värde från D (PE0-E7)
	LDRSB	R1,[R6,#1]	@ Ladda nästa byte värde från D (PE8-E15)
	SXTB	R0,R0		@ Konventera till signed word
	SXTB	R1,R1		@ Konventera till signed word
	ADD	R0,R0,R1	@ Addera bytes
	STRH	R0,[R5]		@ Sätt byte till inport
	B	main		@ Loop @ main