   1              		.arch armv6-m
   2              		.eabi_attribute 20, 1
   3              		.eabi_attribute 21, 1
   4              		.eabi_attribute 23, 3
   5              		.eabi_attribute 24, 1
   6              		.eabi_attribute 25, 1
   7              		.eabi_attribute 26, 1
   8              		.eabi_attribute 30, 6
   9              		.eabi_attribute 34, 0
  10              		.eabi_attribute 18, 4
  11              		.file	"startup.c"
  12              		.text
  13              	.Ltext0:
  14              		.cfi_sections	.debug_frame
  15              		.section	.start_section,"ax",%progbits
  16              		.align	1
  17              		.global	startup
  18              		.syntax unified
  19              		.code	16
  20              		.thumb_func
  21              		.fpu softvfp
  23              	startup:
  24              	.LFB0:
  25              		.file 1 "C:/Users/Hampus/Desktop/DAT017/CodeLite/echo_7_1/startup.c"
   1:C:/Users/Hampus/Desktop/DAT017/CodeLite/echo_7_1\startup.c **** /*
   2:C:/Users/Hampus/Desktop/DAT017/CodeLite/echo_7_1\startup.c ****  * 	startup.c
   3:C:/Users/Hampus/Desktop/DAT017/CodeLite/echo_7_1\startup.c ****  *
   4:C:/Users/Hampus/Desktop/DAT017/CodeLite/echo_7_1\startup.c ****  */
   5:C:/Users/Hampus/Desktop/DAT017/CodeLite/echo_7_1\startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
   6:C:/Users/Hampus/Desktop/DAT017/CodeLite/echo_7_1\startup.c **** 
   7:C:/Users/Hampus/Desktop/DAT017/CodeLite/echo_7_1\startup.c **** void startup ( void )
   8:C:/Users/Hampus/Desktop/DAT017/CodeLite/echo_7_1\startup.c **** {
  26              		.loc 1 8 0
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
   9:C:/Users/Hampus/Desktop/DAT017/CodeLite/echo_7_1\startup.c **** __asm volatile(
  31              		.loc 1 9 0
  32              		.syntax divided
  33              	@ 9 "C:/Users/Hampus/Desktop/DAT017/CodeLite/echo_7_1/startup.c" 1
  34 0000 0248     		 LDR R0,=0x2001C000
  35 0002 8546     	 MOV SP,R0
  36 0004 FFF7FEFF 	 BL main
  37 0008 FEE7     	_exit: B .
  38              	
  39              	@ 0 "" 2
  10:C:/Users/Hampus/Desktop/DAT017/CodeLite/echo_7_1\startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  11:C:/Users/Hampus/Desktop/DAT017/CodeLite/echo_7_1\startup.c **** 	" MOV SP,R0\n"
  12:C:/Users/Hampus/Desktop/DAT017/CodeLite/echo_7_1\startup.c **** 	" BL main\n"				/* call main */
  13:C:/Users/Hampus/Desktop/DAT017/CodeLite/echo_7_1\startup.c **** 	"_exit: B .\n"				/* never return */
  14:C:/Users/Hampus/Desktop/DAT017/CodeLite/echo_7_1\startup.c **** 	) ;
  15:C:/Users/Hampus/Desktop/DAT017/CodeLite/echo_7_1\startup.c **** }
  40              		.loc 1 15 0
  41              		.thumb
  42              		.syntax unified
  43 000a C046     		nop
  44              		.cfi_endproc
  45              	.LFE0:
  47              		.text
  48              		.align	1
  49              		.global	_tstchar
  50              		.syntax unified
  51              		.code	16
  52              		.thumb_func
  53              		.fpu softvfp
  55              	_tstchar:
  56              	.LFB1:
  16:C:/Users/Hampus/Desktop/DAT017/CodeLite/echo_7_1\startup.c **** 
  17:C:/Users/Hampus/Desktop/DAT017/CodeLite/echo_7_1\startup.c **** typedef struct {
  18:C:/Users/Hampus/Desktop/DAT017/CodeLite/echo_7_1\startup.c **** 	volatile unsigned int sr;
  19:C:/Users/Hampus/Desktop/DAT017/CodeLite/echo_7_1\startup.c **** 	volatile unsigned int dr;
  20:C:/Users/Hampus/Desktop/DAT017/CodeLite/echo_7_1\startup.c **** 	volatile unsigned int brr;
  21:C:/Users/Hampus/Desktop/DAT017/CodeLite/echo_7_1\startup.c **** 	volatile unsigned int cr1;
  22:C:/Users/Hampus/Desktop/DAT017/CodeLite/echo_7_1\startup.c **** 	volatile unsigned int cr2;
  23:C:/Users/Hampus/Desktop/DAT017/CodeLite/echo_7_1\startup.c **** 	volatile unsigned int cr3;
  24:C:/Users/Hampus/Desktop/DAT017/CodeLite/echo_7_1\startup.c **** 	volatile unsigned int gtpr;
  25:C:/Users/Hampus/Desktop/DAT017/CodeLite/echo_7_1\startup.c **** } USART;
  26:C:/Users/Hampus/Desktop/DAT017/CodeLite/echo_7_1\startup.c **** 
  27:C:/Users/Hampus/Desktop/DAT017/CodeLite/echo_7_1\startup.c **** #define USART1 ((USART*) 0x40011000)
  28:C:/Users/Hampus/Desktop/DAT017/CodeLite/echo_7_1\startup.c **** 
  29:C:/Users/Hampus/Desktop/DAT017/CodeLite/echo_7_1\startup.c **** char _tstchar() {
  57              		.loc 1 29 0
  58              		.cfi_startproc
  59              		@ args = 0, pretend = 0, frame = 0
  60              		@ frame_needed = 1, uses_anonymous_args = 0
  61 0000 80B5     		push	{r7, lr}
  62              		.cfi_def_cfa_offset 8
  63              		.cfi_offset 7, -8
  64              		.cfi_offset 14, -4
  65 0002 00AF     		add	r7, sp, #0
  66              		.cfi_def_cfa_register 7
  30:C:/Users/Hampus/Desktop/DAT017/CodeLite/echo_7_1\startup.c **** 	if((USART1->sr & (1<<5)) == 0) {
  67              		.loc 1 30 0
  68 0004 064B     		ldr	r3, .L5
  69 0006 1B68     		ldr	r3, [r3]
  70 0008 2022     		movs	r2, #32
  71 000a 1340     		ands	r3, r2
  72 000c 01D1     		bne	.L3
  31:C:/Users/Hampus/Desktop/DAT017/CodeLite/echo_7_1\startup.c **** 		return 0;
  73              		.loc 1 31 0
  74 000e 0023     		movs	r3, #0
  75 0010 02E0     		b	.L4
  76              	.L3:
  32:C:/Users/Hampus/Desktop/DAT017/CodeLite/echo_7_1\startup.c **** 	}
  33:C:/Users/Hampus/Desktop/DAT017/CodeLite/echo_7_1\startup.c **** 	return (char) USART1->dr;
  77              		.loc 1 33 0
  78 0012 034B     		ldr	r3, .L5
  79 0014 5B68     		ldr	r3, [r3, #4]
  80 0016 DBB2     		uxtb	r3, r3
  81              	.L4:
  34:C:/Users/Hampus/Desktop/DAT017/CodeLite/echo_7_1\startup.c **** }
  82              		.loc 1 34 0
  83 0018 1800     		movs	r0, r3
  84 001a BD46     		mov	sp, r7
  85              		@ sp needed
  86 001c 80BD     		pop	{r7, pc}
  87              	.L6:
  88 001e C046     		.align	2
  89              	.L5:
  90 0020 00100140 		.word	1073811456
  91              		.cfi_endproc
  92              	.LFE1:
  94              		.align	1
  95              		.global	_outchar
  96              		.syntax unified
  97              		.code	16
  98              		.thumb_func
  99              		.fpu softvfp
 101              	_outchar:
 102              	.LFB2:
  35:C:/Users/Hampus/Desktop/DAT017/CodeLite/echo_7_1\startup.c **** 
  36:C:/Users/Hampus/Desktop/DAT017/CodeLite/echo_7_1\startup.c **** char _outchar(char c) {
 103              		.loc 1 36 0
 104              		.cfi_startproc
 105              		@ args = 0, pretend = 0, frame = 8
 106              		@ frame_needed = 1, uses_anonymous_args = 0
 107 0024 80B5     		push	{r7, lr}
 108              		.cfi_def_cfa_offset 8
 109              		.cfi_offset 7, -8
 110              		.cfi_offset 14, -4
 111 0026 82B0     		sub	sp, sp, #8
 112              		.cfi_def_cfa_offset 16
 113 0028 00AF     		add	r7, sp, #0
 114              		.cfi_def_cfa_register 7
 115 002a 0200     		movs	r2, r0
 116 002c FB1D     		adds	r3, r7, #7
 117 002e 1A70     		strb	r2, [r3]
  37:C:/Users/Hampus/Desktop/DAT017/CodeLite/echo_7_1\startup.c **** 	while((USART1->sr & (1<<7)) == 0);
 118              		.loc 1 37 0
 119 0030 C046     		nop
 120              	.L8:
 121              		.loc 1 37 0 is_stmt 0 discriminator 1
 122 0032 074B     		ldr	r3, .L9
 123 0034 1B68     		ldr	r3, [r3]
 124 0036 8022     		movs	r2, #128
 125 0038 1340     		ands	r3, r2
 126 003a FAD0     		beq	.L8
  38:C:/Users/Hampus/Desktop/DAT017/CodeLite/echo_7_1\startup.c **** 	USART1->dr = (unsigned short) c;
 127              		.loc 1 38 0 is_stmt 1
 128 003c 044B     		ldr	r3, .L9
 129 003e FA1D     		adds	r2, r7, #7
 130 0040 1278     		ldrb	r2, [r2]
 131 0042 5A60     		str	r2, [r3, #4]
  39:C:/Users/Hampus/Desktop/DAT017/CodeLite/echo_7_1\startup.c **** }
 132              		.loc 1 39 0
 133 0044 C046     		nop
 134 0046 1800     		movs	r0, r3
 135 0048 BD46     		mov	sp, r7
 136 004a 02B0     		add	sp, sp, #8
 137              		@ sp needed
 138 004c 80BD     		pop	{r7, pc}
 139              	.L10:
 140 004e C046     		.align	2
 141              	.L9:
 142 0050 00100140 		.word	1073811456
 143              		.cfi_endproc
 144              	.LFE2:
 146              		.align	1
 147              		.global	_inituart
 148              		.syntax unified
 149              		.code	16
 150              		.thumb_func
 151              		.fpu softvfp
 153              	_inituart:
 154              	.LFB3:
  40:C:/Users/Hampus/Desktop/DAT017/CodeLite/echo_7_1\startup.c **** 
  41:C:/Users/Hampus/Desktop/DAT017/CodeLite/echo_7_1\startup.c **** void _inituart() {
 155              		.loc 1 41 0
 156              		.cfi_startproc
 157              		@ args = 0, pretend = 0, frame = 0
 158              		@ frame_needed = 1, uses_anonymous_args = 0
 159 0054 80B5     		push	{r7, lr}
 160              		.cfi_def_cfa_offset 8
 161              		.cfi_offset 7, -8
 162              		.cfi_offset 14, -4
 163 0056 00AF     		add	r7, sp, #0
 164              		.cfi_def_cfa_register 7
  42:C:/Users/Hampus/Desktop/DAT017/CodeLite/echo_7_1\startup.c **** 	USART1->brr = 0x2D9;
 165              		.loc 1 42 0
 166 0058 054B     		ldr	r3, .L12
 167 005a 064A     		ldr	r2, .L12+4
 168 005c 9A60     		str	r2, [r3, #8]
  43:C:/Users/Hampus/Desktop/DAT017/CodeLite/echo_7_1\startup.c **** 	USART1->cr2 = 0;
 169              		.loc 1 43 0
 170 005e 044B     		ldr	r3, .L12
 171 0060 0022     		movs	r2, #0
 172 0062 1A61     		str	r2, [r3, #16]
  44:C:/Users/Hampus/Desktop/DAT017/CodeLite/echo_7_1\startup.c **** 	USART1->cr1 = (1<<13) | (1<<3) | (1<<2);
 173              		.loc 1 44 0
 174 0064 024B     		ldr	r3, .L12
 175 0066 044A     		ldr	r2, .L12+8
 176 0068 DA60     		str	r2, [r3, #12]
  45:C:/Users/Hampus/Desktop/DAT017/CodeLite/echo_7_1\startup.c **** 	
  46:C:/Users/Hampus/Desktop/DAT017/CodeLite/echo_7_1\startup.c **** }
 177              		.loc 1 46 0
 178 006a C046     		nop
 179 006c BD46     		mov	sp, r7
 180              		@ sp needed
 181 006e 80BD     		pop	{r7, pc}
 182              	.L13:
 183              		.align	2
 184              	.L12:
 185 0070 00100140 		.word	1073811456
 186 0074 D9020000 		.word	729
 187 0078 0C200000 		.word	8204
 188              		.cfi_endproc
 189              	.LFE3:
 191              		.align	1
 192              		.global	main
 193              		.syntax unified
 194              		.code	16
 195              		.thumb_func
 196              		.fpu softvfp
 198              	main:
 199              	.LFB4:
  47:C:/Users/Hampus/Desktop/DAT017/CodeLite/echo_7_1\startup.c **** 
  48:C:/Users/Hampus/Desktop/DAT017/CodeLite/echo_7_1\startup.c **** void main(void) {
 200              		.loc 1 48 0
 201              		.cfi_startproc
 202              		@ args = 0, pretend = 0, frame = 8
 203              		@ frame_needed = 1, uses_anonymous_args = 0
 204 007c 90B5     		push	{r4, r7, lr}
 205              		.cfi_def_cfa_offset 12
 206              		.cfi_offset 4, -12
 207              		.cfi_offset 7, -8
 208              		.cfi_offset 14, -4
 209 007e 83B0     		sub	sp, sp, #12
 210              		.cfi_def_cfa_offset 24
 211 0080 00AF     		add	r7, sp, #0
 212              		.cfi_def_cfa_register 7
  49:C:/Users/Hampus/Desktop/DAT017/CodeLite/echo_7_1\startup.c **** 	char c;
  50:C:/Users/Hampus/Desktop/DAT017/CodeLite/echo_7_1\startup.c **** 	_inituart();
 213              		.loc 1 50 0
 214 0082 FFF7FEFF 		bl	_inituart
 215              	.L16:
  51:C:/Users/Hampus/Desktop/DAT017/CodeLite/echo_7_1\startup.c **** 	while(1) {
  52:C:/Users/Hampus/Desktop/DAT017/CodeLite/echo_7_1\startup.c **** 		c = _tstchar();
 216              		.loc 1 52 0
 217 0086 FC1D     		adds	r4, r7, #7
 218 0088 FFF7FEFF 		bl	_tstchar
 219 008c 0300     		movs	r3, r0
 220 008e 2370     		strb	r3, [r4]
  53:C:/Users/Hampus/Desktop/DAT017/CodeLite/echo_7_1\startup.c **** 		if(c) {
 221              		.loc 1 53 0
 222 0090 FB1D     		adds	r3, r7, #7
 223 0092 1B78     		ldrb	r3, [r3]
 224 0094 002B     		cmp	r3, #0
 225 0096 F6D0     		beq	.L16
  54:C:/Users/Hampus/Desktop/DAT017/CodeLite/echo_7_1\startup.c **** 			_outchar(c);
 226              		.loc 1 54 0
 227 0098 FB1D     		adds	r3, r7, #7
 228 009a 1B78     		ldrb	r3, [r3]
 229 009c 1800     		movs	r0, r3
 230 009e FFF7FEFF 		bl	_outchar
  52:C:/Users/Hampus/Desktop/DAT017/CodeLite/echo_7_1\startup.c **** 		if(c) {
 231              		.loc 1 52 0
 232 00a2 F0E7     		b	.L16
 233              		.cfi_endproc
 234              	.LFE4:
 236              	.Letext0:
