start:	LDR	R0,=0x55555555
	LDR	R1,=0x40020C00	@ konfig port D
	STR	R0,[R1]

	LDR	R1,=0x40020c14	@ utport GPIO D
	LDR	R2,=0x40021010	@ inport GPIO E
	B	main

blink:	LDR R4,[PC,#0]
	STR R4,[R1]
	
main:	LDR	R0,[R2]
	STR	R0,[R1]
	B	blink
	B	main
