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
  25              		.file 1 "C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay/startup.c"
   1:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** // Timer setup
   2:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** #define STK 0xE000E010
   3:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** #define STK_CTRL ((volatile unsigned int *) (STK))
   4:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** #define STK_LOAD ((volatile unsigned int *) (STK + 0x4))
   5:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** #define STK_VAL ((volatile unsigned int *) (STK + 0x8))
   6:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 
   7:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** // Port E setup
   8:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** #define GPIO_E 0x40021000
   9:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** #define GPIO_MODER ((volatile unsigned int *) (GPIO_E))
  10:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** #define GPIO_OTYPER ((volatile unsigned short *) (GPIO_E+0x4))
  11:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** #define GPIO_PUPDR ((volatile unsigned int *) (GPIO_E+0xC))
  12:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** #define GPIO_IDR_LOW ((volatile unsigned char *) (GPIO_E+0x10))
  13:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** #define GPIO_IDR_HIGH ((volatile unsigned char *) (GPIO_E+0x11))
  14:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** #define GPIO_ODR_LOW ((volatile unsigned char *) (GPIO_E+0x14))
  15:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** #define GPIO_ODR_HIGH ((volatile unsigned char *) (GPIO_E+0x15))
  16:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 
  17:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** // AciiiDisplay values
  18:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** #define B_E 6
  19:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** #define B_SELECT 2
  20:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** #define B_RW 1
  21:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** #define B_RS 0
  22:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 
  23:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 
  24:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
  25:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 
  26:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** void startup ( void )
  27:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** {
  26              		.loc 1 27 0
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
  28:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** __asm volatile(
  31              		.loc 1 28 0
  32              		.syntax divided
  33              	@ 28 "C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay/startup.c" 1
  34 0000 0248     		 LDR R0,=0x2001C000
  35 0002 8546     	 MOV SP,R0
  36 0004 FFF7FEFF 	 BL main
  37 0008 FEE7     	_exit: B .
  38              	
  39              	@ 0 "" 2
  29:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  30:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	" MOV SP,R0\n"
  31:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	" BL main\n"				/* call main */
  32:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	"_exit: B .\n"				/* never return */
  33:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	) ;
  34:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** }
  40              		.loc 1 34 0
  41              		.thumb
  42              		.syntax unified
  43 000a C046     		nop
  44              		.cfi_endproc
  45              	.LFE0:
  47              		.text
  48              		.align	1
  49              		.global	init_app
  50              		.syntax unified
  51              		.code	16
  52              		.thumb_func
  53              		.fpu softvfp
  55              	init_app:
  56              	.LFB1:
  35:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 
  36:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 
  37:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** void init_app(void) {
  57              		.loc 1 37 0
  58              		.cfi_startproc
  59              		@ args = 0, pretend = 0, frame = 0
  60              		@ frame_needed = 1, uses_anonymous_args = 0
  61 0000 80B5     		push	{r7, lr}
  62              		.cfi_def_cfa_offset 8
  63              		.cfi_offset 7, -8
  64              		.cfi_offset 14, -4
  65 0002 00AF     		add	r7, sp, #0
  66              		.cfi_def_cfa_register 7
  38:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	// Setup output pins for asciidisplay
  39:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	*GPIO_MODER = 0x55555555;
  67              		.loc 1 39 0
  68 0004 0A4B     		ldr	r3, .L3
  69 0006 0B4A     		ldr	r2, .L3+4
  70 0008 1A60     		str	r2, [r3]
  40:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	
  41:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	*GPIO_OTYPER = 0x7777;
  71              		.loc 1 41 0
  72 000a 0B4B     		ldr	r3, .L3+8
  73 000c 0B4A     		ldr	r2, .L3+12
  74 000e 1A80     		strh	r2, [r3]
  42:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	
  43:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	*GPIO_PUPDR = 0xAAAAAAAA;
  75              		.loc 1 43 0
  76 0010 0B4B     		ldr	r3, .L3+16
  77 0012 0C4A     		ldr	r2, .L3+20
  78 0014 1A60     		str	r2, [r3]
  44:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	
  45:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	*GPIO_ODR_HIGH = 0;
  79              		.loc 1 45 0
  80 0016 0C4B     		ldr	r3, .L3+24
  81 0018 0022     		movs	r2, #0
  82 001a 1A70     		strb	r2, [r3]
  46:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	*GPIO_ODR_LOW = 0;
  83              		.loc 1 46 0
  84 001c 0B4B     		ldr	r3, .L3+28
  85 001e 0022     		movs	r2, #0
  86 0020 1A70     		strb	r2, [r3]
  47:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	*GPIO_IDR_HIGH = 0;
  87              		.loc 1 47 0
  88 0022 0B4B     		ldr	r3, .L3+32
  89 0024 0022     		movs	r2, #0
  90 0026 1A70     		strb	r2, [r3]
  48:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	
  49:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** }
  91              		.loc 1 49 0
  92 0028 C046     		nop
  93 002a BD46     		mov	sp, r7
  94              		@ sp needed
  95 002c 80BD     		pop	{r7, pc}
  96              	.L4:
  97 002e C046     		.align	2
  98              	.L3:
  99 0030 00100240 		.word	1073876992
 100 0034 55555555 		.word	1431655765
 101 0038 04100240 		.word	1073876996
 102 003c 77770000 		.word	30583
 103 0040 0C100240 		.word	1073877004
 104 0044 AAAAAAAA 		.word	-1431655766
 105 0048 15100240 		.word	1073877013
 106 004c 14100240 		.word	1073877012
 107 0050 11100240 		.word	1073877009
 108              		.cfi_endproc
 109              	.LFE1:
 111              		.align	1
 112              		.global	delay_250ns
 113              		.syntax unified
 114              		.code	16
 115              		.thumb_func
 116              		.fpu softvfp
 118              	delay_250ns:
 119              	.LFB2:
  50:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 
  51:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** void delay_250ns(void) {
 120              		.loc 1 51 0
 121              		.cfi_startproc
 122              		@ args = 0, pretend = 0, frame = 0
 123              		@ frame_needed = 1, uses_anonymous_args = 0
 124 0054 80B5     		push	{r7, lr}
 125              		.cfi_def_cfa_offset 8
 126              		.cfi_offset 7, -8
 127              		.cfi_offset 14, -4
 128 0056 00AF     		add	r7, sp, #0
 129              		.cfi_def_cfa_register 7
  52:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	*STK_CTRL = 0;
 130              		.loc 1 52 0
 131 0058 0C4B     		ldr	r3, .L7
 132 005a 0022     		movs	r2, #0
 133 005c 1A60     		str	r2, [r3]
  53:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	*STK_LOAD = 49; //  48 + 1. Have to add one as said in manual
 134              		.loc 1 53 0
 135 005e 0C4B     		ldr	r3, .L7+4
 136 0060 3122     		movs	r2, #49
 137 0062 1A60     		str	r2, [r3]
  54:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	*STK_VAL = 0;
 138              		.loc 1 54 0
 139 0064 0B4B     		ldr	r3, .L7+8
 140 0066 0022     		movs	r2, #0
 141 0068 1A60     		str	r2, [r3]
  55:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	*STK_CTRL = 5;
 142              		.loc 1 55 0
 143 006a 084B     		ldr	r3, .L7
 144 006c 0522     		movs	r2, #5
 145 006e 1A60     		str	r2, [r3]
  56:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	while((*STK_CTRL & 0x10000) == 0) {
 146              		.loc 1 56 0
 147 0070 C046     		nop
 148              	.L6:
 149              		.loc 1 56 0 is_stmt 0 discriminator 1
 150 0072 064B     		ldr	r3, .L7
 151 0074 1A68     		ldr	r2, [r3]
 152 0076 8023     		movs	r3, #128
 153 0078 5B02     		lsls	r3, r3, #9
 154 007a 1340     		ands	r3, r2
 155 007c F9D0     		beq	.L6
  57:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		// Do nothing :S
  58:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	}
  59:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	*STK_CTRL = 0;
 156              		.loc 1 59 0 is_stmt 1
 157 007e 034B     		ldr	r3, .L7
 158 0080 0022     		movs	r2, #0
 159 0082 1A60     		str	r2, [r3]
  60:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** }
 160              		.loc 1 60 0
 161 0084 C046     		nop
 162 0086 BD46     		mov	sp, r7
 163              		@ sp needed
 164 0088 80BD     		pop	{r7, pc}
 165              	.L8:
 166 008a C046     		.align	2
 167              	.L7:
 168 008c 10E000E0 		.word	-536813552
 169 0090 14E000E0 		.word	-536813548
 170 0094 18E000E0 		.word	-536813544
 171              		.cfi_endproc
 172              	.LFE2:
 174              		.align	1
 175              		.global	delay_mikro
 176              		.syntax unified
 177              		.code	16
 178              		.thumb_func
 179              		.fpu softvfp
 181              	delay_mikro:
 182              	.LFB3:
  61:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 
  62:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** void delay_mikro(unsigned int us) {
 183              		.loc 1 62 0
 184              		.cfi_startproc
 185              		@ args = 0, pretend = 0, frame = 8
 186              		@ frame_needed = 1, uses_anonymous_args = 0
 187 0098 80B5     		push	{r7, lr}
 188              		.cfi_def_cfa_offset 8
 189              		.cfi_offset 7, -8
 190              		.cfi_offset 14, -4
 191 009a 82B0     		sub	sp, sp, #8
 192              		.cfi_def_cfa_offset 16
 193 009c 00AF     		add	r7, sp, #0
 194              		.cfi_def_cfa_register 7
 195 009e 7860     		str	r0, [r7, #4]
  63:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	while(us--) {
 196              		.loc 1 63 0
 197 00a0 07E0     		b	.L10
 198              	.L11:
  64:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		delay_250ns();
 199              		.loc 1 64 0
 200 00a2 FFF7FEFF 		bl	delay_250ns
  65:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		delay_250ns();
 201              		.loc 1 65 0
 202 00a6 FFF7FEFF 		bl	delay_250ns
  66:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		delay_250ns();
 203              		.loc 1 66 0
 204 00aa FFF7FEFF 		bl	delay_250ns
  67:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		delay_250ns();
 205              		.loc 1 67 0
 206 00ae FFF7FEFF 		bl	delay_250ns
 207              	.L10:
  63:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		delay_250ns();
 208              		.loc 1 63 0
 209 00b2 7B68     		ldr	r3, [r7, #4]
 210 00b4 5A1E     		subs	r2, r3, #1
 211 00b6 7A60     		str	r2, [r7, #4]
 212 00b8 002B     		cmp	r3, #0
 213 00ba F2D1     		bne	.L11
  68:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	}
  69:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** }
 214              		.loc 1 69 0
 215 00bc C046     		nop
 216 00be BD46     		mov	sp, r7
 217 00c0 02B0     		add	sp, sp, #8
 218              		@ sp needed
 219 00c2 80BD     		pop	{r7, pc}
 220              		.cfi_endproc
 221              	.LFE3:
 223              		.align	1
 224              		.global	delay_milli
 225              		.syntax unified
 226              		.code	16
 227              		.thumb_func
 228              		.fpu softvfp
 230              	delay_milli:
 231              	.LFB4:
  70:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 
  71:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** void delay_milli(unsigned int ms) {
 232              		.loc 1 71 0
 233              		.cfi_startproc
 234              		@ args = 0, pretend = 0, frame = 8
 235              		@ frame_needed = 1, uses_anonymous_args = 0
 236 00c4 80B5     		push	{r7, lr}
 237              		.cfi_def_cfa_offset 8
 238              		.cfi_offset 7, -8
 239              		.cfi_offset 14, -4
 240 00c6 82B0     		sub	sp, sp, #8
 241              		.cfi_def_cfa_offset 16
 242 00c8 00AF     		add	r7, sp, #0
 243              		.cfi_def_cfa_register 7
 244 00ca 7860     		str	r0, [r7, #4]
  72:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	#ifdef SIMULATOR
  73:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		delay_mikro(ms);
 245              		.loc 1 73 0
 246 00cc 7B68     		ldr	r3, [r7, #4]
 247 00ce 1800     		movs	r0, r3
 248 00d0 FFF7FEFF 		bl	delay_mikro
  74:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	#else
  75:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		delay_mikro(1000 * ms)
  76:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	#endif
  77:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** }
 249              		.loc 1 77 0
 250 00d4 C046     		nop
 251 00d6 BD46     		mov	sp, r7
 252 00d8 02B0     		add	sp, sp, #8
 253              		@ sp needed
 254 00da 80BD     		pop	{r7, pc}
 255              		.cfi_endproc
 256              	.LFE4:
 258              		.align	1
 259              		.global	ascii_ctrl_bit_set
 260              		.syntax unified
 261              		.code	16
 262              		.thumb_func
 263              		.fpu softvfp
 265              	ascii_ctrl_bit_set:
 266              	.LFB5:
  78:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 
  79:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** void ascii_ctrl_bit_set(unsigned int x) {
 267              		.loc 1 79 0
 268              		.cfi_startproc
 269              		@ args = 0, pretend = 0, frame = 8
 270              		@ frame_needed = 1, uses_anonymous_args = 0
 271 00dc 80B5     		push	{r7, lr}
 272              		.cfi_def_cfa_offset 8
 273              		.cfi_offset 7, -8
 274              		.cfi_offset 14, -4
 275 00de 82B0     		sub	sp, sp, #8
 276              		.cfi_def_cfa_offset 16
 277 00e0 00AF     		add	r7, sp, #0
 278              		.cfi_def_cfa_register 7
 279 00e2 7860     		str	r0, [r7, #4]
  80:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	switch(x) {
 280              		.loc 1 80 0
 281 00e4 7B68     		ldr	r3, [r7, #4]
 282 00e6 072B     		cmp	r3, #7
 283 00e8 4ED8     		bhi	.L24
 284 00ea 7B68     		ldr	r3, [r7, #4]
 285 00ec 9A00     		lsls	r2, r3, #2
 286 00ee 284B     		ldr	r3, .L25
 287 00f0 D318     		adds	r3, r2, r3
 288 00f2 1B68     		ldr	r3, [r3]
 289 00f4 9F46     		mov	pc, r3
 290              		.section	.rodata
 291              		.align	2
 292              	.L16:
 293 0000 F6000000 		.word	.L15
 294 0004 08010000 		.word	.L17
 295 0008 1A010000 		.word	.L18
 296 000c 2C010000 		.word	.L19
 297 0010 3E010000 		.word	.L20
 298 0014 50010000 		.word	.L21
 299 0018 62010000 		.word	.L22
 300 001c 74010000 		.word	.L23
 301              		.text
 302              	.L15:
  81:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		case 0: *GPIO_ODR_LOW |= 1; break;
 303              		.loc 1 81 0
 304 00f6 274A     		ldr	r2, .L25+4
 305 00f8 264B     		ldr	r3, .L25+4
 306 00fa 1B78     		ldrb	r3, [r3]
 307 00fc DBB2     		uxtb	r3, r3
 308 00fe 0121     		movs	r1, #1
 309 0100 0B43     		orrs	r3, r1
 310 0102 DBB2     		uxtb	r3, r3
 311 0104 1370     		strb	r3, [r2]
 312 0106 3FE0     		b	.L14
 313              	.L17:
  82:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		case 1: *GPIO_ODR_LOW |= 2; break;
 314              		.loc 1 82 0
 315 0108 224A     		ldr	r2, .L25+4
 316 010a 224B     		ldr	r3, .L25+4
 317 010c 1B78     		ldrb	r3, [r3]
 318 010e DBB2     		uxtb	r3, r3
 319 0110 0221     		movs	r1, #2
 320 0112 0B43     		orrs	r3, r1
 321 0114 DBB2     		uxtb	r3, r3
 322 0116 1370     		strb	r3, [r2]
 323 0118 36E0     		b	.L14
 324              	.L18:
  83:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		case 2: *GPIO_ODR_LOW |= 4; break;
 325              		.loc 1 83 0
 326 011a 1E4A     		ldr	r2, .L25+4
 327 011c 1D4B     		ldr	r3, .L25+4
 328 011e 1B78     		ldrb	r3, [r3]
 329 0120 DBB2     		uxtb	r3, r3
 330 0122 0421     		movs	r1, #4
 331 0124 0B43     		orrs	r3, r1
 332 0126 DBB2     		uxtb	r3, r3
 333 0128 1370     		strb	r3, [r2]
 334 012a 2DE0     		b	.L14
 335              	.L19:
  84:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		case 3: *GPIO_ODR_LOW |= 8; break;
 336              		.loc 1 84 0
 337 012c 194A     		ldr	r2, .L25+4
 338 012e 194B     		ldr	r3, .L25+4
 339 0130 1B78     		ldrb	r3, [r3]
 340 0132 DBB2     		uxtb	r3, r3
 341 0134 0821     		movs	r1, #8
 342 0136 0B43     		orrs	r3, r1
 343 0138 DBB2     		uxtb	r3, r3
 344 013a 1370     		strb	r3, [r2]
 345 013c 24E0     		b	.L14
 346              	.L20:
  85:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		case 4: *GPIO_ODR_LOW |= 16; break;
 347              		.loc 1 85 0
 348 013e 154A     		ldr	r2, .L25+4
 349 0140 144B     		ldr	r3, .L25+4
 350 0142 1B78     		ldrb	r3, [r3]
 351 0144 DBB2     		uxtb	r3, r3
 352 0146 1021     		movs	r1, #16
 353 0148 0B43     		orrs	r3, r1
 354 014a DBB2     		uxtb	r3, r3
 355 014c 1370     		strb	r3, [r2]
 356 014e 1BE0     		b	.L14
 357              	.L21:
  86:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		case 5: *GPIO_ODR_LOW |= 32; break;
 358              		.loc 1 86 0
 359 0150 104A     		ldr	r2, .L25+4
 360 0152 104B     		ldr	r3, .L25+4
 361 0154 1B78     		ldrb	r3, [r3]
 362 0156 DBB2     		uxtb	r3, r3
 363 0158 2021     		movs	r1, #32
 364 015a 0B43     		orrs	r3, r1
 365 015c DBB2     		uxtb	r3, r3
 366 015e 1370     		strb	r3, [r2]
 367 0160 12E0     		b	.L14
 368              	.L22:
  87:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		case 6: *GPIO_ODR_LOW |= 64; break;
 369              		.loc 1 87 0
 370 0162 0C4A     		ldr	r2, .L25+4
 371 0164 0B4B     		ldr	r3, .L25+4
 372 0166 1B78     		ldrb	r3, [r3]
 373 0168 DBB2     		uxtb	r3, r3
 374 016a 4021     		movs	r1, #64
 375 016c 0B43     		orrs	r3, r1
 376 016e DBB2     		uxtb	r3, r3
 377 0170 1370     		strb	r3, [r2]
 378 0172 09E0     		b	.L14
 379              	.L23:
  88:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		case 7: *GPIO_ODR_LOW |= 128; break;
 380              		.loc 1 88 0
 381 0174 0749     		ldr	r1, .L25+4
 382 0176 074B     		ldr	r3, .L25+4
 383 0178 1B78     		ldrb	r3, [r3]
 384 017a DBB2     		uxtb	r3, r3
 385 017c 8022     		movs	r2, #128
 386 017e 5242     		rsbs	r2, r2, #0
 387 0180 1343     		orrs	r3, r2
 388 0182 DBB2     		uxtb	r3, r3
 389 0184 0B70     		strb	r3, [r1]
 390 0186 C046     		nop
 391              	.L14:
 392              	.L24:
  89:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	}
  90:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** }
 393              		.loc 1 90 0
 394 0188 C046     		nop
 395 018a BD46     		mov	sp, r7
 396 018c 02B0     		add	sp, sp, #8
 397              		@ sp needed
 398 018e 80BD     		pop	{r7, pc}
 399              	.L26:
 400              		.align	2
 401              	.L25:
 402 0190 00000000 		.word	.L16
 403 0194 14100240 		.word	1073877012
 404              		.cfi_endproc
 405              	.LFE5:
 407              		.align	1
 408              		.global	ascii_ctrl_bit_clear
 409              		.syntax unified
 410              		.code	16
 411              		.thumb_func
 412              		.fpu softvfp
 414              	ascii_ctrl_bit_clear:
 415              	.LFB6:
  91:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 
  92:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** void ascii_ctrl_bit_clear(unsigned int x) {
 416              		.loc 1 92 0
 417              		.cfi_startproc
 418              		@ args = 0, pretend = 0, frame = 8
 419              		@ frame_needed = 1, uses_anonymous_args = 0
 420 0198 80B5     		push	{r7, lr}
 421              		.cfi_def_cfa_offset 8
 422              		.cfi_offset 7, -8
 423              		.cfi_offset 14, -4
 424 019a 82B0     		sub	sp, sp, #8
 425              		.cfi_def_cfa_offset 16
 426 019c 00AF     		add	r7, sp, #0
 427              		.cfi_def_cfa_register 7
 428 019e 7860     		str	r0, [r7, #4]
  93:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	switch(x) {
 429              		.loc 1 93 0
 430 01a0 7B68     		ldr	r3, [r7, #4]
 431 01a2 072B     		cmp	r3, #7
 432 01a4 4DD8     		bhi	.L38
 433 01a6 7B68     		ldr	r3, [r7, #4]
 434 01a8 9A00     		lsls	r2, r3, #2
 435 01aa 284B     		ldr	r3, .L39
 436 01ac D318     		adds	r3, r2, r3
 437 01ae 1B68     		ldr	r3, [r3]
 438 01b0 9F46     		mov	pc, r3
 439              		.section	.rodata
 440              		.align	2
 441              	.L30:
 442 0020 B2010000 		.word	.L29
 443 0024 C4010000 		.word	.L31
 444 0028 D6010000 		.word	.L32
 445 002c E8010000 		.word	.L33
 446 0030 FA010000 		.word	.L34
 447 0034 0C020000 		.word	.L35
 448 0038 1E020000 		.word	.L36
 449 003c 30020000 		.word	.L37
 450              		.text
 451              	.L29:
  94:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		case(0): *GPIO_ODR_LOW &= 0xFE; break;
 452              		.loc 1 94 0
 453 01b2 274A     		ldr	r2, .L39+4
 454 01b4 264B     		ldr	r3, .L39+4
 455 01b6 1B78     		ldrb	r3, [r3]
 456 01b8 DBB2     		uxtb	r3, r3
 457 01ba 0121     		movs	r1, #1
 458 01bc 8B43     		bics	r3, r1
 459 01be DBB2     		uxtb	r3, r3
 460 01c0 1370     		strb	r3, [r2]
 461 01c2 3EE0     		b	.L28
 462              	.L31:
  95:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		case(1): *GPIO_ODR_LOW &= 0xFD; break;
 463              		.loc 1 95 0
 464 01c4 224A     		ldr	r2, .L39+4
 465 01c6 224B     		ldr	r3, .L39+4
 466 01c8 1B78     		ldrb	r3, [r3]
 467 01ca DBB2     		uxtb	r3, r3
 468 01cc 0221     		movs	r1, #2
 469 01ce 8B43     		bics	r3, r1
 470 01d0 DBB2     		uxtb	r3, r3
 471 01d2 1370     		strb	r3, [r2]
 472 01d4 35E0     		b	.L28
 473              	.L32:
  96:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		case(2): *GPIO_ODR_LOW &= 0xFB; break;
 474              		.loc 1 96 0
 475 01d6 1E4A     		ldr	r2, .L39+4
 476 01d8 1D4B     		ldr	r3, .L39+4
 477 01da 1B78     		ldrb	r3, [r3]
 478 01dc DBB2     		uxtb	r3, r3
 479 01de 0421     		movs	r1, #4
 480 01e0 8B43     		bics	r3, r1
 481 01e2 DBB2     		uxtb	r3, r3
 482 01e4 1370     		strb	r3, [r2]
 483 01e6 2CE0     		b	.L28
 484              	.L33:
  97:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		case(3): *GPIO_ODR_LOW &= 0xF7; break;
 485              		.loc 1 97 0
 486 01e8 194A     		ldr	r2, .L39+4
 487 01ea 194B     		ldr	r3, .L39+4
 488 01ec 1B78     		ldrb	r3, [r3]
 489 01ee DBB2     		uxtb	r3, r3
 490 01f0 0821     		movs	r1, #8
 491 01f2 8B43     		bics	r3, r1
 492 01f4 DBB2     		uxtb	r3, r3
 493 01f6 1370     		strb	r3, [r2]
 494 01f8 23E0     		b	.L28
 495              	.L34:
  98:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		case(4): *GPIO_ODR_LOW &= 0xEF; break;
 496              		.loc 1 98 0
 497 01fa 154A     		ldr	r2, .L39+4
 498 01fc 144B     		ldr	r3, .L39+4
 499 01fe 1B78     		ldrb	r3, [r3]
 500 0200 DBB2     		uxtb	r3, r3
 501 0202 1021     		movs	r1, #16
 502 0204 8B43     		bics	r3, r1
 503 0206 DBB2     		uxtb	r3, r3
 504 0208 1370     		strb	r3, [r2]
 505 020a 1AE0     		b	.L28
 506              	.L35:
  99:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		case(5): *GPIO_ODR_LOW &= 0xDF; break;
 507              		.loc 1 99 0
 508 020c 104A     		ldr	r2, .L39+4
 509 020e 104B     		ldr	r3, .L39+4
 510 0210 1B78     		ldrb	r3, [r3]
 511 0212 DBB2     		uxtb	r3, r3
 512 0214 2021     		movs	r1, #32
 513 0216 8B43     		bics	r3, r1
 514 0218 DBB2     		uxtb	r3, r3
 515 021a 1370     		strb	r3, [r2]
 516 021c 11E0     		b	.L28
 517              	.L36:
 100:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		case(6): *GPIO_ODR_LOW &= 0xBF; break;
 518              		.loc 1 100 0
 519 021e 0C4A     		ldr	r2, .L39+4
 520 0220 0B4B     		ldr	r3, .L39+4
 521 0222 1B78     		ldrb	r3, [r3]
 522 0224 DBB2     		uxtb	r3, r3
 523 0226 4021     		movs	r1, #64
 524 0228 8B43     		bics	r3, r1
 525 022a DBB2     		uxtb	r3, r3
 526 022c 1370     		strb	r3, [r2]
 527 022e 08E0     		b	.L28
 528              	.L37:
 101:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		case(7): *GPIO_ODR_LOW &= 0x7F; break;
 529              		.loc 1 101 0
 530 0230 074A     		ldr	r2, .L39+4
 531 0232 074B     		ldr	r3, .L39+4
 532 0234 1B78     		ldrb	r3, [r3]
 533 0236 DBB2     		uxtb	r3, r3
 534 0238 7F21     		movs	r1, #127
 535 023a 0B40     		ands	r3, r1
 536 023c DBB2     		uxtb	r3, r3
 537 023e 1370     		strb	r3, [r2]
 538 0240 C046     		nop
 539              	.L28:
 540              	.L38:
 102:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	}
 103:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** }
 541              		.loc 1 103 0
 542 0242 C046     		nop
 543 0244 BD46     		mov	sp, r7
 544 0246 02B0     		add	sp, sp, #8
 545              		@ sp needed
 546 0248 80BD     		pop	{r7, pc}
 547              	.L40:
 548 024a C046     		.align	2
 549              	.L39:
 550 024c 20000000 		.word	.L30
 551 0250 14100240 		.word	1073877012
 552              		.cfi_endproc
 553              	.LFE6:
 555              		.align	1
 556              		.global	ascii_write_controller
 557              		.syntax unified
 558              		.code	16
 559              		.thumb_func
 560              		.fpu softvfp
 562              	ascii_write_controller:
 563              	.LFB7:
 104:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 
 105:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** void ascii_write_controller(unsigned char byte) {
 564              		.loc 1 105 0
 565              		.cfi_startproc
 566              		@ args = 0, pretend = 0, frame = 8
 567              		@ frame_needed = 1, uses_anonymous_args = 0
 568 0254 80B5     		push	{r7, lr}
 569              		.cfi_def_cfa_offset 8
 570              		.cfi_offset 7, -8
 571              		.cfi_offset 14, -4
 572 0256 82B0     		sub	sp, sp, #8
 573              		.cfi_def_cfa_offset 16
 574 0258 00AF     		add	r7, sp, #0
 575              		.cfi_def_cfa_register 7
 576 025a 0200     		movs	r2, r0
 577 025c FB1D     		adds	r3, r7, #7
 578 025e 1A70     		strb	r2, [r3]
 106:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	ascii_ctrl_bit_set(B_E);
 579              		.loc 1 106 0
 580 0260 0620     		movs	r0, #6
 581 0262 FFF7FEFF 		bl	ascii_ctrl_bit_set
 107:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	*GPIO_ODR_HIGH = byte;
 582              		.loc 1 107 0
 583 0266 064A     		ldr	r2, .L42
 584 0268 FB1D     		adds	r3, r7, #7
 585 026a 1B78     		ldrb	r3, [r3]
 586 026c 1370     		strb	r3, [r2]
 108:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	delay_250ns();
 587              		.loc 1 108 0
 588 026e FFF7FEFF 		bl	delay_250ns
 109:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	ascii_ctrl_bit_clear(B_E);
 589              		.loc 1 109 0
 590 0272 0620     		movs	r0, #6
 591 0274 FFF7FEFF 		bl	ascii_ctrl_bit_clear
 110:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** }
 592              		.loc 1 110 0
 593 0278 C046     		nop
 594 027a BD46     		mov	sp, r7
 595 027c 02B0     		add	sp, sp, #8
 596              		@ sp needed
 597 027e 80BD     		pop	{r7, pc}
 598              	.L43:
 599              		.align	2
 600              	.L42:
 601 0280 15100240 		.word	1073877013
 602              		.cfi_endproc
 603              	.LFE7:
 605              		.align	1
 606              		.global	ascii_read_controller
 607              		.syntax unified
 608              		.code	16
 609              		.thumb_func
 610              		.fpu softvfp
 612              	ascii_read_controller:
 613              	.LFB8:
 111:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 
 112:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** unsigned char ascii_read_controller() {
 614              		.loc 1 112 0
 615              		.cfi_startproc
 616              		@ args = 0, pretend = 0, frame = 8
 617              		@ frame_needed = 1, uses_anonymous_args = 0
 618 0284 80B5     		push	{r7, lr}
 619              		.cfi_def_cfa_offset 8
 620              		.cfi_offset 7, -8
 621              		.cfi_offset 14, -4
 622 0286 82B0     		sub	sp, sp, #8
 623              		.cfi_def_cfa_offset 16
 624 0288 00AF     		add	r7, sp, #0
 625              		.cfi_def_cfa_register 7
 113:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	ascii_ctrl_bit_set(B_E);
 626              		.loc 1 113 0
 627 028a 0620     		movs	r0, #6
 628 028c FFF7FEFF 		bl	ascii_ctrl_bit_set
 114:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	delay_250ns();
 629              		.loc 1 114 0
 630 0290 FFF7FEFF 		bl	delay_250ns
 115:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	delay_250ns();
 631              		.loc 1 115 0
 632 0294 FFF7FEFF 		bl	delay_250ns
 116:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	unsigned char rv = *GPIO_IDR_HIGH;
 633              		.loc 1 116 0
 634 0298 064A     		ldr	r2, .L46
 635 029a FB1D     		adds	r3, r7, #7
 636 029c 1278     		ldrb	r2, [r2]
 637 029e 1A70     		strb	r2, [r3]
 117:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	ascii_ctrl_bit_clear(B_E);
 638              		.loc 1 117 0
 639 02a0 0620     		movs	r0, #6
 640 02a2 FFF7FEFF 		bl	ascii_ctrl_bit_clear
 118:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	return rv;
 641              		.loc 1 118 0
 642 02a6 FB1D     		adds	r3, r7, #7
 643 02a8 1B78     		ldrb	r3, [r3]
 119:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** }
 644              		.loc 1 119 0
 645 02aa 1800     		movs	r0, r3
 646 02ac BD46     		mov	sp, r7
 647 02ae 02B0     		add	sp, sp, #8
 648              		@ sp needed
 649 02b0 80BD     		pop	{r7, pc}
 650              	.L47:
 651 02b2 C046     		.align	2
 652              	.L46:
 653 02b4 11100240 		.word	1073877009
 654              		.cfi_endproc
 655              	.LFE8:
 657              		.align	1
 658              		.global	ascii_write_cmd
 659              		.syntax unified
 660              		.code	16
 661              		.thumb_func
 662              		.fpu softvfp
 664              	ascii_write_cmd:
 665              	.LFB9:
 120:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 
 121:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** void ascii_write_cmd(unsigned char command) {
 666              		.loc 1 121 0
 667              		.cfi_startproc
 668              		@ args = 0, pretend = 0, frame = 8
 669              		@ frame_needed = 1, uses_anonymous_args = 0
 670 02b8 80B5     		push	{r7, lr}
 671              		.cfi_def_cfa_offset 8
 672              		.cfi_offset 7, -8
 673              		.cfi_offset 14, -4
 674 02ba 82B0     		sub	sp, sp, #8
 675              		.cfi_def_cfa_offset 16
 676 02bc 00AF     		add	r7, sp, #0
 677              		.cfi_def_cfa_register 7
 678 02be 0200     		movs	r2, r0
 679 02c0 FB1D     		adds	r3, r7, #7
 680 02c2 1A70     		strb	r2, [r3]
 122:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	ascii_ctrl_bit_clear(B_RS);
 681              		.loc 1 122 0
 682 02c4 0020     		movs	r0, #0
 683 02c6 FFF7FEFF 		bl	ascii_ctrl_bit_clear
 123:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	ascii_ctrl_bit_clear(B_RW);
 684              		.loc 1 123 0
 685 02ca 0120     		movs	r0, #1
 686 02cc FFF7FEFF 		bl	ascii_ctrl_bit_clear
 124:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	ascii_write_controller(command);
 687              		.loc 1 124 0
 688 02d0 FB1D     		adds	r3, r7, #7
 689 02d2 1B78     		ldrb	r3, [r3]
 690 02d4 1800     		movs	r0, r3
 691 02d6 FFF7FEFF 		bl	ascii_write_controller
 125:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** }
 692              		.loc 1 125 0
 693 02da C046     		nop
 694 02dc BD46     		mov	sp, r7
 695 02de 02B0     		add	sp, sp, #8
 696              		@ sp needed
 697 02e0 80BD     		pop	{r7, pc}
 698              		.cfi_endproc
 699              	.LFE9:
 701              		.align	1
 702              		.global	ascii_write_data
 703              		.syntax unified
 704              		.code	16
 705              		.thumb_func
 706              		.fpu softvfp
 708              	ascii_write_data:
 709              	.LFB10:
 126:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 
 127:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** void ascii_write_data(unsigned char data) {
 710              		.loc 1 127 0
 711              		.cfi_startproc
 712              		@ args = 0, pretend = 0, frame = 8
 713              		@ frame_needed = 1, uses_anonymous_args = 0
 714 02e2 80B5     		push	{r7, lr}
 715              		.cfi_def_cfa_offset 8
 716              		.cfi_offset 7, -8
 717              		.cfi_offset 14, -4
 718 02e4 82B0     		sub	sp, sp, #8
 719              		.cfi_def_cfa_offset 16
 720 02e6 00AF     		add	r7, sp, #0
 721              		.cfi_def_cfa_register 7
 722 02e8 0200     		movs	r2, r0
 723 02ea FB1D     		adds	r3, r7, #7
 724 02ec 1A70     		strb	r2, [r3]
 128:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	ascii_ctrl_bit_set(B_RS);
 725              		.loc 1 128 0
 726 02ee 0020     		movs	r0, #0
 727 02f0 FFF7FEFF 		bl	ascii_ctrl_bit_set
 129:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	ascii_ctrl_bit_clear(B_RW);
 728              		.loc 1 129 0
 729 02f4 0120     		movs	r0, #1
 730 02f6 FFF7FEFF 		bl	ascii_ctrl_bit_clear
 130:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	ascii_write_controller(data);
 731              		.loc 1 130 0
 732 02fa FB1D     		adds	r3, r7, #7
 733 02fc 1B78     		ldrb	r3, [r3]
 734 02fe 1800     		movs	r0, r3
 735 0300 FFF7FEFF 		bl	ascii_write_controller
 131:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** }
 736              		.loc 1 131 0
 737 0304 C046     		nop
 738 0306 BD46     		mov	sp, r7
 739 0308 02B0     		add	sp, sp, #8
 740              		@ sp needed
 741 030a 80BD     		pop	{r7, pc}
 742              		.cfi_endproc
 743              	.LFE10:
 745              		.align	1
 746              		.global	ascii_read_status
 747              		.syntax unified
 748              		.code	16
 749              		.thumb_func
 750              		.fpu softvfp
 752              	ascii_read_status:
 753              	.LFB11:
 132:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 
 133:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** unsigned char ascii_read_status(void) {
 754              		.loc 1 133 0
 755              		.cfi_startproc
 756              		@ args = 0, pretend = 0, frame = 8
 757              		@ frame_needed = 1, uses_anonymous_args = 0
 758 030c 90B5     		push	{r4, r7, lr}
 759              		.cfi_def_cfa_offset 12
 760              		.cfi_offset 4, -12
 761              		.cfi_offset 7, -8
 762              		.cfi_offset 14, -4
 763 030e 83B0     		sub	sp, sp, #12
 764              		.cfi_def_cfa_offset 24
 765 0310 00AF     		add	r7, sp, #0
 766              		.cfi_def_cfa_register 7
 134:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	*GPIO_MODER &= 0x0000FFFF;	
 767              		.loc 1 134 0
 768 0312 114B     		ldr	r3, .L52
 769 0314 104A     		ldr	r2, .L52
 770 0316 1268     		ldr	r2, [r2]
 771 0318 1204     		lsls	r2, r2, #16
 772 031a 120C     		lsrs	r2, r2, #16
 773 031c 1A60     		str	r2, [r3]
 135:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	ascii_ctrl_bit_clear(B_RS);
 774              		.loc 1 135 0
 775 031e 0020     		movs	r0, #0
 776 0320 FFF7FEFF 		bl	ascii_ctrl_bit_clear
 136:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	ascii_ctrl_bit_set(B_RW);
 777              		.loc 1 136 0
 778 0324 0120     		movs	r0, #1
 779 0326 FFF7FEFF 		bl	ascii_ctrl_bit_set
 137:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	unsigned char rv = ascii_read_controller();
 780              		.loc 1 137 0
 781 032a FC1D     		adds	r4, r7, #7
 782 032c FFF7FEFF 		bl	ascii_read_controller
 783 0330 0300     		movs	r3, r0
 784 0332 2370     		strb	r3, [r4]
 138:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	*GPIO_MODER &= 0x0000FFFF;
 785              		.loc 1 138 0
 786 0334 084B     		ldr	r3, .L52
 787 0336 084A     		ldr	r2, .L52
 788 0338 1268     		ldr	r2, [r2]
 789 033a 1204     		lsls	r2, r2, #16
 790 033c 120C     		lsrs	r2, r2, #16
 791 033e 1A60     		str	r2, [r3]
 139:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	*GPIO_MODER |= 0x55550000;	
 792              		.loc 1 139 0
 793 0340 054B     		ldr	r3, .L52
 794 0342 054A     		ldr	r2, .L52
 795 0344 1268     		ldr	r2, [r2]
 796 0346 0549     		ldr	r1, .L52+4
 797 0348 0A43     		orrs	r2, r1
 798 034a 1A60     		str	r2, [r3]
 140:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	return rv;
 799              		.loc 1 140 0
 800 034c FB1D     		adds	r3, r7, #7
 801 034e 1B78     		ldrb	r3, [r3]
 141:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** }
 802              		.loc 1 141 0
 803 0350 1800     		movs	r0, r3
 804 0352 BD46     		mov	sp, r7
 805 0354 03B0     		add	sp, sp, #12
 806              		@ sp needed
 807 0356 90BD     		pop	{r4, r7, pc}
 808              	.L53:
 809              		.align	2
 810              	.L52:
 811 0358 00100240 		.word	1073876992
 812 035c 00005555 		.word	1431633920
 813              		.cfi_endproc
 814              	.LFE11:
 816              		.align	1
 817              		.global	ascii_read_data
 818              		.syntax unified
 819              		.code	16
 820              		.thumb_func
 821              		.fpu softvfp
 823              	ascii_read_data:
 824              	.LFB12:
 142:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 
 143:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** unsigned char ascii_read_data(void) {
 825              		.loc 1 143 0
 826              		.cfi_startproc
 827              		@ args = 0, pretend = 0, frame = 8
 828              		@ frame_needed = 1, uses_anonymous_args = 0
 829 0360 90B5     		push	{r4, r7, lr}
 830              		.cfi_def_cfa_offset 12
 831              		.cfi_offset 4, -12
 832              		.cfi_offset 7, -8
 833              		.cfi_offset 14, -4
 834 0362 83B0     		sub	sp, sp, #12
 835              		.cfi_def_cfa_offset 24
 836 0364 00AF     		add	r7, sp, #0
 837              		.cfi_def_cfa_register 7
 144:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	*GPIO_MODER &= 0x0000FFFF;	
 838              		.loc 1 144 0
 839 0366 114B     		ldr	r3, .L56
 840 0368 104A     		ldr	r2, .L56
 841 036a 1268     		ldr	r2, [r2]
 842 036c 1204     		lsls	r2, r2, #16
 843 036e 120C     		lsrs	r2, r2, #16
 844 0370 1A60     		str	r2, [r3]
 145:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	ascii_ctrl_bit_set(B_RS);
 845              		.loc 1 145 0
 846 0372 0020     		movs	r0, #0
 847 0374 FFF7FEFF 		bl	ascii_ctrl_bit_set
 146:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	ascii_ctrl_bit_set(B_RW);
 848              		.loc 1 146 0
 849 0378 0120     		movs	r0, #1
 850 037a FFF7FEFF 		bl	ascii_ctrl_bit_set
 147:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	unsigned char rv = ascii_read_controller();
 851              		.loc 1 147 0
 852 037e FC1D     		adds	r4, r7, #7
 853 0380 FFF7FEFF 		bl	ascii_read_controller
 854 0384 0300     		movs	r3, r0
 855 0386 2370     		strb	r3, [r4]
 148:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	*GPIO_MODER &= 0x0000FFFF;
 856              		.loc 1 148 0
 857 0388 084B     		ldr	r3, .L56
 858 038a 084A     		ldr	r2, .L56
 859 038c 1268     		ldr	r2, [r2]
 860 038e 1204     		lsls	r2, r2, #16
 861 0390 120C     		lsrs	r2, r2, #16
 862 0392 1A60     		str	r2, [r3]
 149:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	*GPIO_MODER |= 0x55550000;	
 863              		.loc 1 149 0
 864 0394 054B     		ldr	r3, .L56
 865 0396 054A     		ldr	r2, .L56
 866 0398 1268     		ldr	r2, [r2]
 867 039a 0549     		ldr	r1, .L56+4
 868 039c 0A43     		orrs	r2, r1
 869 039e 1A60     		str	r2, [r3]
 150:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	return rv;
 870              		.loc 1 150 0
 871 03a0 FB1D     		adds	r3, r7, #7
 872 03a2 1B78     		ldrb	r3, [r3]
 151:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** }
 873              		.loc 1 151 0
 874 03a4 1800     		movs	r0, r3
 875 03a6 BD46     		mov	sp, r7
 876 03a8 03B0     		add	sp, sp, #12
 877              		@ sp needed
 878 03aa 90BD     		pop	{r4, r7, pc}
 879              	.L57:
 880              		.align	2
 881              	.L56:
 882 03ac 00100240 		.word	1073876992
 883 03b0 00005555 		.word	1431633920
 884              		.cfi_endproc
 885              	.LFE12:
 887              		.align	1
 888              		.global	ascii_command
 889              		.syntax unified
 890              		.code	16
 891              		.thumb_func
 892              		.fpu softvfp
 894              	ascii_command:
 895              	.LFB13:
 152:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 
 153:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** void ascii_command(char command, unsigned int delayMicro) {
 896              		.loc 1 153 0
 897              		.cfi_startproc
 898              		@ args = 0, pretend = 0, frame = 8
 899              		@ frame_needed = 1, uses_anonymous_args = 0
 900 03b4 80B5     		push	{r7, lr}
 901              		.cfi_def_cfa_offset 8
 902              		.cfi_offset 7, -8
 903              		.cfi_offset 14, -4
 904 03b6 82B0     		sub	sp, sp, #8
 905              		.cfi_def_cfa_offset 16
 906 03b8 00AF     		add	r7, sp, #0
 907              		.cfi_def_cfa_register 7
 908 03ba 0200     		movs	r2, r0
 909 03bc 3960     		str	r1, [r7]
 910 03be FB1D     		adds	r3, r7, #7
 911 03c0 1A70     		strb	r2, [r3]
 154:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	while((ascii_read_status() & 0x80) == 0x80) {
 912              		.loc 1 154 0
 913 03c2 C046     		nop
 914              	.L59:
 915              		.loc 1 154 0 is_stmt 0 discriminator 1
 916 03c4 FFF7FEFF 		bl	ascii_read_status
 917 03c8 0300     		movs	r3, r0
 918 03ca 1A00     		movs	r2, r3
 919 03cc 8023     		movs	r3, #128
 920 03ce 1340     		ands	r3, r2
 921 03d0 802B     		cmp	r3, #128
 922 03d2 F7D0     		beq	.L59
 155:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		// Do nothing, wait for status flag
 156:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	}
 157:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	delay_mikro(8);
 923              		.loc 1 157 0 is_stmt 1
 924 03d4 0820     		movs	r0, #8
 925 03d6 FFF7FEFF 		bl	delay_mikro
 158:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	ascii_write_cmd(command);
 926              		.loc 1 158 0
 927 03da FB1D     		adds	r3, r7, #7
 928 03dc 1B78     		ldrb	r3, [r3]
 929 03de 1800     		movs	r0, r3
 930 03e0 FFF7FEFF 		bl	ascii_write_cmd
 159:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	delay_mikro(delayMicro);
 931              		.loc 1 159 0
 932 03e4 3B68     		ldr	r3, [r7]
 933 03e6 1800     		movs	r0, r3
 934 03e8 FFF7FEFF 		bl	delay_mikro
 160:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** }
 935              		.loc 1 160 0
 936 03ec C046     		nop
 937 03ee BD46     		mov	sp, r7
 938 03f0 02B0     		add	sp, sp, #8
 939              		@ sp needed
 940 03f2 80BD     		pop	{r7, pc}
 941              		.cfi_endproc
 942              	.LFE13:
 944              		.align	1
 945              		.global	ascii_init
 946              		.syntax unified
 947              		.code	16
 948              		.thumb_func
 949              		.fpu softvfp
 951              	ascii_init:
 952              	.LFB14:
 161:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 
 162:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** void ascii_init(void) {
 953              		.loc 1 162 0
 954              		.cfi_startproc
 955              		@ args = 0, pretend = 0, frame = 0
 956              		@ frame_needed = 1, uses_anonymous_args = 0
 957 03f4 80B5     		push	{r7, lr}
 958              		.cfi_def_cfa_offset 8
 959              		.cfi_offset 7, -8
 960              		.cfi_offset 14, -4
 961 03f6 00AF     		add	r7, sp, #0
 962              		.cfi_def_cfa_register 7
 163:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	ascii_command(0x38, 40); // Set display size and font size
 963              		.loc 1 163 0
 964 03f8 2821     		movs	r1, #40
 965 03fa 3820     		movs	r0, #56
 966 03fc FFF7FEFF 		bl	ascii_command
 164:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c ****     ascii_command(0xE, 40); // Set display, cursor on
 967              		.loc 1 164 0
 968 0400 2821     		movs	r1, #40
 969 0402 0E20     		movs	r0, #14
 970 0404 FFF7FEFF 		bl	ascii_command
 165:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	ascii_command(0x01, 1530); // Clear display
 971              		.loc 1 165 0
 972 0408 054B     		ldr	r3, .L61
 973 040a 1900     		movs	r1, r3
 974 040c 0120     		movs	r0, #1
 975 040e FFF7FEFF 		bl	ascii_command
 166:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c ****     ascii_command(0x6, 40); // Inc, no shift
 976              		.loc 1 166 0
 977 0412 2821     		movs	r1, #40
 978 0414 0620     		movs	r0, #6
 979 0416 FFF7FEFF 		bl	ascii_command
 167:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** }
 980              		.loc 1 167 0
 981 041a C046     		nop
 982 041c BD46     		mov	sp, r7
 983              		@ sp needed
 984 041e 80BD     		pop	{r7, pc}
 985              	.L62:
 986              		.align	2
 987              	.L61:
 988 0420 FA050000 		.word	1530
 989              		.cfi_endproc
 990              	.LFE14:
 992              		.align	1
 993              		.global	ascii_write_char
 994              		.syntax unified
 995              		.code	16
 996              		.thumb_func
 997              		.fpu softvfp
 999              	ascii_write_char:
 1000              	.LFB15:
 168:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 
 169:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** void ascii_write_char(unsigned char charToWrite) {
 1001              		.loc 1 169 0
 1002              		.cfi_startproc
 1003              		@ args = 0, pretend = 0, frame = 8
 1004              		@ frame_needed = 1, uses_anonymous_args = 0
 1005 0424 80B5     		push	{r7, lr}
 1006              		.cfi_def_cfa_offset 8
 1007              		.cfi_offset 7, -8
 1008              		.cfi_offset 14, -4
 1009 0426 82B0     		sub	sp, sp, #8
 1010              		.cfi_def_cfa_offset 16
 1011 0428 00AF     		add	r7, sp, #0
 1012              		.cfi_def_cfa_register 7
 1013 042a 0200     		movs	r2, r0
 1014 042c FB1D     		adds	r3, r7, #7
 1015 042e 1A70     		strb	r2, [r3]
 170:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	while((ascii_read_status() & 0x80) == 0x80) {
 1016              		.loc 1 170 0
 1017 0430 C046     		nop
 1018              	.L64:
 1019              		.loc 1 170 0 is_stmt 0 discriminator 1
 1020 0432 FFF7FEFF 		bl	ascii_read_status
 1021 0436 0300     		movs	r3, r0
 1022 0438 1A00     		movs	r2, r3
 1023 043a 8023     		movs	r3, #128
 1024 043c 1340     		ands	r3, r2
 1025 043e 802B     		cmp	r3, #128
 1026 0440 F7D0     		beq	.L64
 171:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	// Do nothing, wait for status flag
 172:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c ****     }
 173:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	delay_mikro(8);
 1027              		.loc 1 173 0 is_stmt 1
 1028 0442 0820     		movs	r0, #8
 1029 0444 FFF7FEFF 		bl	delay_mikro
 174:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c ****     ascii_write_data(charToWrite);
 1030              		.loc 1 174 0
 1031 0448 FB1D     		adds	r3, r7, #7
 1032 044a 1B78     		ldrb	r3, [r3]
 1033 044c 1800     		movs	r0, r3
 1034 044e FFF7FEFF 		bl	ascii_write_data
 175:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c ****     delay_mikro(45);
 1035              		.loc 1 175 0
 1036 0452 2D20     		movs	r0, #45
 1037 0454 FFF7FEFF 		bl	delay_mikro
 176:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** }
 1038              		.loc 1 176 0
 1039 0458 C046     		nop
 1040 045a BD46     		mov	sp, r7
 1041 045c 02B0     		add	sp, sp, #8
 1042              		@ sp needed
 1043 045e 80BD     		pop	{r7, pc}
 1044              		.cfi_endproc
 1045              	.LFE15:
 1047              		.align	1
 1048              		.global	goToXY
 1049              		.syntax unified
 1050              		.code	16
 1051              		.thumb_func
 1052              		.fpu softvfp
 1054              	goToXY:
 1055              	.LFB16:
 177:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 
 178:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** void goToXY(unsigned char row, unsigned char column) {
 1056              		.loc 1 178 0
 1057              		.cfi_startproc
 1058              		@ args = 0, pretend = 0, frame = 16
 1059              		@ frame_needed = 1, uses_anonymous_args = 0
 1060 0460 80B5     		push	{r7, lr}
 1061              		.cfi_def_cfa_offset 8
 1062              		.cfi_offset 7, -8
 1063              		.cfi_offset 14, -4
 1064 0462 84B0     		sub	sp, sp, #16
 1065              		.cfi_def_cfa_offset 24
 1066 0464 00AF     		add	r7, sp, #0
 1067              		.cfi_def_cfa_register 7
 1068 0466 0200     		movs	r2, r0
 1069 0468 FB1D     		adds	r3, r7, #7
 1070 046a 1A70     		strb	r2, [r3]
 1071 046c BB1D     		adds	r3, r7, #6
 1072 046e 0A1C     		adds	r2, r1, #0
 1073 0470 1A70     		strb	r2, [r3]
 179:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	unsigned char address = row - 1;
 1074              		.loc 1 179 0
 1075 0472 0F23     		movs	r3, #15
 1076 0474 FB18     		adds	r3, r7, r3
 1077 0476 FA1D     		adds	r2, r7, #7
 1078 0478 1278     		ldrb	r2, [r2]
 1079 047a 013A     		subs	r2, r2, #1
 1080 047c 1A70     		strb	r2, [r3]
 180:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	if(column == 2) {
 1081              		.loc 1 180 0
 1082 047e BB1D     		adds	r3, r7, #6
 1083 0480 1B78     		ldrb	r3, [r3]
 1084 0482 022B     		cmp	r3, #2
 1085 0484 06D1     		bne	.L66
 181:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		address = address + 0x40;
 1086              		.loc 1 181 0
 1087 0486 0F23     		movs	r3, #15
 1088 0488 FB18     		adds	r3, r7, r3
 1089 048a 0F22     		movs	r2, #15
 1090 048c BA18     		adds	r2, r7, r2
 1091 048e 1278     		ldrb	r2, [r2]
 1092 0490 4032     		adds	r2, r2, #64
 1093 0492 1A70     		strb	r2, [r3]
 1094              	.L66:
 182:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	}
 183:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	ascii_write_cmd(0x80 | address);
 1095              		.loc 1 183 0
 1096 0494 0F23     		movs	r3, #15
 1097 0496 FB18     		adds	r3, r7, r3
 1098 0498 1B78     		ldrb	r3, [r3]
 1099 049a 8022     		movs	r2, #128
 1100 049c 5242     		rsbs	r2, r2, #0
 1101 049e 1343     		orrs	r3, r2
 1102 04a0 DBB2     		uxtb	r3, r3
 1103 04a2 1800     		movs	r0, r3
 1104 04a4 FFF7FEFF 		bl	ascii_write_cmd
 184:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** }
 1105              		.loc 1 184 0
 1106 04a8 C046     		nop
 1107 04aa BD46     		mov	sp, r7
 1108 04ac 04B0     		add	sp, sp, #16
 1109              		@ sp needed
 1110 04ae 80BD     		pop	{r7, pc}
 1111              		.cfi_endproc
 1112              	.LFE16:
 1114              		.section	.rodata
 1115              		.align	2
 1116              	.LC2:
 1117 0040 416C6661 		.ascii	"Alfanumerisk \000"
 1117      6E756D65 
 1117      7269736B 
 1117      2000
 1118 004e 0000     		.align	2
 1119              	.LC4:
 1120 0050 44697370 		.ascii	"Display - test\000"
 1120      6C617920 
 1120      2D207465 
 1120      737400
 1121              		.text
 1122              		.align	1
 1123              		.global	main
 1124              		.syntax unified
 1125              		.code	16
 1126              		.thumb_func
 1127              		.fpu softvfp
 1129              	main:
 1130              	.LFB17:
 185:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 
 186:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** void main(int argc, char **argv) {
 1131              		.loc 1 186 0
 1132              		.cfi_startproc
 1133              		@ args = 0, pretend = 0, frame = 48
 1134              		@ frame_needed = 1, uses_anonymous_args = 0
 1135 04b0 90B5     		push	{r4, r7, lr}
 1136              		.cfi_def_cfa_offset 12
 1137              		.cfi_offset 4, -12
 1138              		.cfi_offset 7, -8
 1139              		.cfi_offset 14, -4
 1140 04b2 8DB0     		sub	sp, sp, #52
 1141              		.cfi_def_cfa_offset 64
 1142 04b4 00AF     		add	r7, sp, #0
 1143              		.cfi_def_cfa_register 7
 1144 04b6 7860     		str	r0, [r7, #4]
 1145 04b8 3960     		str	r1, [r7]
 187:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	char *s;
 188:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	char test1[] = "Alfanumerisk ";
 1146              		.loc 1 188 0
 1147 04ba 1C23     		movs	r3, #28
 1148 04bc FB18     		adds	r3, r7, r3
 1149 04be 1C4A     		ldr	r2, .L73
 1150 04c0 13CA     		ldmia	r2!, {r0, r1, r4}
 1151 04c2 13C3     		stmia	r3!, {r0, r1, r4}
 1152 04c4 1288     		ldrh	r2, [r2]
 1153 04c6 1A80     		strh	r2, [r3]
 189:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	char test2[] = "Display - test";
 1154              		.loc 1 189 0
 1155 04c8 0C23     		movs	r3, #12
 1156 04ca FB18     		adds	r3, r7, r3
 1157 04cc 194A     		ldr	r2, .L73+4
 1158 04ce 13CA     		ldmia	r2!, {r0, r1, r4}
 1159 04d0 13C3     		stmia	r3!, {r0, r1, r4}
 1160 04d2 1188     		ldrh	r1, [r2]
 1161 04d4 1980     		strh	r1, [r3]
 1162 04d6 9278     		ldrb	r2, [r2, #2]
 1163 04d8 9A70     		strb	r2, [r3, #2]
 190:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** //	
 191:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	init_app();
 1164              		.loc 1 191 0
 1165 04da FFF7FEFF 		bl	init_app
 192:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c ****     ascii_init();
 1166              		.loc 1 192 0
 1167 04de FFF7FEFF 		bl	ascii_init
 193:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	goToXY(1,1);
 1168              		.loc 1 193 0
 1169 04e2 0121     		movs	r1, #1
 1170 04e4 0120     		movs	r0, #1
 1171 04e6 FFF7FEFF 		bl	goToXY
 194:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	
 195:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	s = test1;
 1172              		.loc 1 195 0
 1173 04ea 1C23     		movs	r3, #28
 1174 04ec FB18     		adds	r3, r7, r3
 1175 04ee FB62     		str	r3, [r7, #44]
 196:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	while(*s) {
 1176              		.loc 1 196 0
 1177 04f0 06E0     		b	.L68
 1178              	.L69:
 197:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		ascii_write_char(*s++);
 1179              		.loc 1 197 0
 1180 04f2 FB6A     		ldr	r3, [r7, #44]
 1181 04f4 5A1C     		adds	r2, r3, #1
 1182 04f6 FA62     		str	r2, [r7, #44]
 1183 04f8 1B78     		ldrb	r3, [r3]
 1184 04fa 1800     		movs	r0, r3
 1185 04fc FFF7FEFF 		bl	ascii_write_char
 1186              	.L68:
 196:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	while(*s) {
 1187              		.loc 1 196 0
 1188 0500 FB6A     		ldr	r3, [r7, #44]
 1189 0502 1B78     		ldrb	r3, [r3]
 1190 0504 002B     		cmp	r3, #0
 1191 0506 F4D1     		bne	.L69
 198:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	}
 199:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	s = test2;
 1192              		.loc 1 199 0
 1193 0508 0C23     		movs	r3, #12
 1194 050a FB18     		adds	r3, r7, r3
 1195 050c FB62     		str	r3, [r7, #44]
 200:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	while(*s) {
 1196              		.loc 1 200 0
 1197 050e 06E0     		b	.L70
 1198              	.L71:
 201:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		ascii_write_char(*s++);
 1199              		.loc 1 201 0
 1200 0510 FB6A     		ldr	r3, [r7, #44]
 1201 0512 5A1C     		adds	r2, r3, #1
 1202 0514 FA62     		str	r2, [r7, #44]
 1203 0516 1B78     		ldrb	r3, [r3]
 1204 0518 1800     		movs	r0, r3
 1205 051a FFF7FEFF 		bl	ascii_write_char
 1206              	.L70:
 200:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	while(*s) {
 1207              		.loc 1 200 0
 1208 051e FB6A     		ldr	r3, [r7, #44]
 1209 0520 1B78     		ldrb	r3, [r3]
 1210 0522 002B     		cmp	r3, #0
 1211 0524 F4D1     		bne	.L71
 202:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	}
 203:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** //		ascii_write_char(*s++);
 204:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** //	}
 205:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** //	ascii_ctrl_bit_set(0);
 206:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** //	ascii_ctrl_bit_set(1);
 207:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** //	ascii_ctrl_bit_set(2);
 208:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** //	ascii_ctrl_bit_set(3);
 209:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** //	ascii_ctrl_bit_set(4);
 210:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** //	ascii_ctrl_bit_set(5);
 211:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** //	ascii_ctrl_bit_set(6);
 212:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** //	ascii_ctrl_bit_set(7);
 213:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** //	
 214:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** //	ascii_ctrl_bit_clear(0);
 215:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** //	ascii_ctrl_bit_clear(1);
 216:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** //	ascii_ctrl_bit_clear(2);
 217:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** //	ascii_ctrl_bit_clear(3);
 218:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** //	ascii_ctrl_bit_clear(4);
 219:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** //	ascii_ctrl_bit_clear(5);
 220:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** //	ascii_ctrl_bit_clear(6);
 221:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** //	ascii_ctrl_bit_clear(7);
 222:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	return 0;
 1212              		.loc 1 222 0
 1213 0526 C046     		nop
 223:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** }
 1214              		.loc 1 223 0
 1215 0528 BD46     		mov	sp, r7
 1216 052a 0DB0     		add	sp, sp, #52
 1217              		@ sp needed
 1218 052c 90BD     		pop	{r4, r7, pc}
 1219              	.L74:
 1220 052e C046     		.align	2
 1221              	.L73:
 1222 0530 40000000 		.word	.LC2
 1223 0534 50000000 		.word	.LC4
 1224              		.cfi_endproc
 1225              	.LFE17:
 1227              	.Letext0:
