	LDR	R1,=s
	LDR	R2,=c
	LDRH	R0,[R1]
	STRB	R0,[R2]

	LDR	R2,=i
	LDR	R0,[R2]
	STRH	R0,[R1]

	.ALIGN
i:	.WORD	0x3E000
s:	.HWORD	0x3E0
c:	.BYTE
