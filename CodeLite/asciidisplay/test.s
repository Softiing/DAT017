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
  17:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 
  18:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 
  19:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
  20:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 
  21:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** void startup ( void )
  22:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** {
  26              		.loc 1 22 0
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
  23:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** __asm volatile(
  31              		.loc 1 23 0
  32              		.syntax divided
  33              	@ 23 "C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay/startup.c" 1
  34 0000 0248     		 LDR R0,=0x2001C000
  35 0002 8546     	 MOV SP,R0
  36 0004 FFF7FEFF 	 BL main
  37 0008 FEE7     	_exit: B .
  38              	
  39              	@ 0 "" 2
  24:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  25:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	" MOV SP,R0\n"
  26:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	" BL main\n"				/* call main */
  27:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	"_exit: B .\n"				/* never return */
  28:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	) ;
  29:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** }
  40              		.loc 1 29 0
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
  30:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 
  31:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 
  32:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** void init_app(void) {
  57              		.loc 1 32 0
  58              		.cfi_startproc
  59              		@ args = 0, pretend = 0, frame = 0
  60              		@ frame_needed = 1, uses_anonymous_args = 0
  61 0000 80B5     		push	{r7, lr}
  62              		.cfi_def_cfa_offset 8
  63              		.cfi_offset 7, -8
  64              		.cfi_offset 14, -4
  65 0002 00AF     		add	r7, sp, #0
  66              		.cfi_def_cfa_register 7
  33:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	// Setup output pins for asciidisplay
  34:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	*GPIO_MODER &= 0xFFFFFFFF;
  67              		.loc 1 34 0
  68 0004 114B     		ldr	r3, .L3
  69 0006 114A     		ldr	r2, .L3
  70 0008 1268     		ldr	r2, [r2]
  71 000a 1A60     		str	r2, [r3]
  35:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	*GPIO_MODER |= 0x55555555;
  72              		.loc 1 35 0
  73 000c 0F4B     		ldr	r3, .L3
  74 000e 0F4A     		ldr	r2, .L3
  75 0010 1268     		ldr	r2, [r2]
  76 0012 0F49     		ldr	r1, .L3+4
  77 0014 0A43     		orrs	r2, r1
  78 0016 1A60     		str	r2, [r3]
  36:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	
  37:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	*GPIO_OTYPER &= 0xFFFF;
  79              		.loc 1 37 0
  80 0018 0E4B     		ldr	r3, .L3+8
  81 001a 0E4A     		ldr	r2, .L3+8
  82 001c 1288     		ldrh	r2, [r2]
  83 001e 92B2     		uxth	r2, r2
  84 0020 1A80     		strh	r2, [r3]
  38:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	*GPIO_OTYPER |= 0x7777;
  85              		.loc 1 38 0
  86 0022 0C4A     		ldr	r2, .L3+8
  87 0024 0B4B     		ldr	r3, .L3+8
  88 0026 1B88     		ldrh	r3, [r3]
  89 0028 9BB2     		uxth	r3, r3
  90 002a 0B49     		ldr	r1, .L3+12
  91 002c 0B43     		orrs	r3, r1
  92 002e 9BB2     		uxth	r3, r3
  93 0030 1380     		strh	r3, [r2]
  39:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	
  40:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	*GPIO_PUPDR &= 0xFFFFFFFF;
  94              		.loc 1 40 0
  95 0032 0A4B     		ldr	r3, .L3+16
  96 0034 094A     		ldr	r2, .L3+16
  97 0036 1268     		ldr	r2, [r2]
  98 0038 1A60     		str	r2, [r3]
  41:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	*GPIO_PUPDR |= 0xAAAAAAAA;
  99              		.loc 1 41 0
 100 003a 084B     		ldr	r3, .L3+16
 101 003c 074A     		ldr	r2, .L3+16
 102 003e 1268     		ldr	r2, [r2]
 103 0040 0749     		ldr	r1, .L3+20
 104 0042 0A43     		orrs	r2, r1
 105 0044 1A60     		str	r2, [r3]
  42:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** }
 106              		.loc 1 42 0
 107 0046 C046     		nop
 108 0048 BD46     		mov	sp, r7
 109              		@ sp needed
 110 004a 80BD     		pop	{r7, pc}
 111              	.L4:
 112              		.align	2
 113              	.L3:
 114 004c 00100240 		.word	1073876992
 115 0050 55555555 		.word	1431655765
 116 0054 04100240 		.word	1073876996
 117 0058 77770000 		.word	30583
 118 005c 0C100240 		.word	1073877004
 119 0060 AAAAAAAA 		.word	-1431655766
 120              		.cfi_endproc
 121              	.LFE1:
 123              		.align	1
 124              		.global	delay_250ns
 125              		.syntax unified
 126              		.code	16
 127              		.thumb_func
 128              		.fpu softvfp
 130              	delay_250ns:
 131              	.LFB2:
  43:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 
  44:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** void delay_250ns(void) {
 132              		.loc 1 44 0
 133              		.cfi_startproc
 134              		@ args = 0, pretend = 0, frame = 0
 135              		@ frame_needed = 1, uses_anonymous_args = 0
 136 0064 80B5     		push	{r7, lr}
 137              		.cfi_def_cfa_offset 8
 138              		.cfi_offset 7, -8
 139              		.cfi_offset 14, -4
 140 0066 00AF     		add	r7, sp, #0
 141              		.cfi_def_cfa_register 7
  45:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	*STK_CTRL = 0;
 142              		.loc 1 45 0
 143 0068 0C4B     		ldr	r3, .L7
 144 006a 0022     		movs	r2, #0
 145 006c 1A60     		str	r2, [r3]
  46:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	*STK_VAL = 0;
 146              		.loc 1 46 0
 147 006e 0C4B     		ldr	r3, .L7+4
 148 0070 0022     		movs	r2, #0
 149 0072 1A60     		str	r2, [r3]
  47:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	*STK_LOAD = 49; //  48 + 1. Have to add one as said in manual
 150              		.loc 1 47 0
 151 0074 0B4B     		ldr	r3, .L7+8
 152 0076 3122     		movs	r2, #49
 153 0078 1A60     		str	r2, [r3]
  48:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	*STK_CTRL = 0x1;
 154              		.loc 1 48 0
 155 007a 084B     		ldr	r3, .L7
 156 007c 0122     		movs	r2, #1
 157 007e 1A60     		str	r2, [r3]
  49:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	while((*STK_CTRL & 0x10000) == 0) {
 158              		.loc 1 49 0
 159 0080 C046     		nop
 160              	.L6:
 161              		.loc 1 49 0 is_stmt 0 discriminator 1
 162 0082 064B     		ldr	r3, .L7
 163 0084 1A68     		ldr	r2, [r3]
 164 0086 8023     		movs	r3, #128
 165 0088 5B02     		lsls	r3, r3, #9
 166 008a 1340     		ands	r3, r2
 167 008c F9D0     		beq	.L6
  50:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		// Do nothing :S
  51:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	}
  52:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	*STK_CTRL = 0;
 168              		.loc 1 52 0 is_stmt 1
 169 008e 034B     		ldr	r3, .L7
 170 0090 0022     		movs	r2, #0
 171 0092 1A60     		str	r2, [r3]
  53:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** }
 172              		.loc 1 53 0
 173 0094 C046     		nop
 174 0096 BD46     		mov	sp, r7
 175              		@ sp needed
 176 0098 80BD     		pop	{r7, pc}
 177              	.L8:
 178 009a C046     		.align	2
 179              	.L7:
 180 009c 10E000E0 		.word	-536813552
 181 00a0 18E000E0 		.word	-536813544
 182 00a4 14E000E0 		.word	-536813548
 183              		.cfi_endproc
 184              	.LFE2:
 186              		.align	1
 187              		.global	delay_mikro
 188              		.syntax unified
 189              		.code	16
 190              		.thumb_func
 191              		.fpu softvfp
 193              	delay_mikro:
 194              	.LFB3:
  54:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 
  55:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** void delay_mikro(unsigned int us) {
 195              		.loc 1 55 0
 196              		.cfi_startproc
 197              		@ args = 0, pretend = 0, frame = 16
 198              		@ frame_needed = 1, uses_anonymous_args = 0
 199 00a8 80B5     		push	{r7, lr}
 200              		.cfi_def_cfa_offset 8
 201              		.cfi_offset 7, -8
 202              		.cfi_offset 14, -4
 203 00aa 84B0     		sub	sp, sp, #16
 204              		.cfi_def_cfa_offset 24
 205 00ac 00AF     		add	r7, sp, #0
 206              		.cfi_def_cfa_register 7
 207 00ae 7860     		str	r0, [r7, #4]
 208              	.LBB2:
  56:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	for(unsigned int i = 0; i < us; i++) {
 209              		.loc 1 56 0
 210 00b0 0023     		movs	r3, #0
 211 00b2 FB60     		str	r3, [r7, #12]
 212 00b4 02E0     		b	.L10
 213              	.L11:
 214              		.loc 1 56 0 is_stmt 0 discriminator 3
 215 00b6 FB68     		ldr	r3, [r7, #12]
 216 00b8 0133     		adds	r3, r3, #1
 217 00ba FB60     		str	r3, [r7, #12]
 218              	.L10:
 219              		.loc 1 56 0 discriminator 1
 220 00bc FA68     		ldr	r2, [r7, #12]
 221 00be 7B68     		ldr	r3, [r7, #4]
 222 00c0 9A42     		cmp	r2, r3
 223 00c2 F8D3     		bcc	.L11
 224              	.LBE2:
  57:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		delay_250ns;
  58:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		delay_250ns;
  59:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		delay_250ns;
  60:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		delay_250ns;
  61:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	}
  62:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** }
 225              		.loc 1 62 0 is_stmt 1
 226 00c4 C046     		nop
 227 00c6 BD46     		mov	sp, r7
 228 00c8 04B0     		add	sp, sp, #16
 229              		@ sp needed
 230 00ca 80BD     		pop	{r7, pc}
 231              		.cfi_endproc
 232              	.LFE3:
 234              		.align	1
 235              		.global	delay_milli
 236              		.syntax unified
 237              		.code	16
 238              		.thumb_func
 239              		.fpu softvfp
 241              	delay_milli:
 242              	.LFB4:
  63:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 
  64:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** void delay_milli(unsigned int ms) {
 243              		.loc 1 64 0
 244              		.cfi_startproc
 245              		@ args = 0, pretend = 0, frame = 8
 246              		@ frame_needed = 1, uses_anonymous_args = 0
 247 00cc 80B5     		push	{r7, lr}
 248              		.cfi_def_cfa_offset 8
 249              		.cfi_offset 7, -8
 250              		.cfi_offset 14, -4
 251 00ce 82B0     		sub	sp, sp, #8
 252              		.cfi_def_cfa_offset 16
 253 00d0 00AF     		add	r7, sp, #0
 254              		.cfi_def_cfa_register 7
 255 00d2 7860     		str	r0, [r7, #4]
  65:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	#ifdef SIMULATOR
  66:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		ms = ms / 1000;
  67:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		ms++;
  68:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	#endif
  69:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	
  70:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	delay_mikro(1000 * ms);	
 256              		.loc 1 70 0
 257 00d4 7B68     		ldr	r3, [r7, #4]
 258 00d6 FA22     		movs	r2, #250
 259 00d8 9200     		lsls	r2, r2, #2
 260 00da 5343     		muls	r3, r2
 261 00dc 1800     		movs	r0, r3
 262 00de FFF7FEFF 		bl	delay_mikro
  71:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** }
 263              		.loc 1 71 0
 264 00e2 C046     		nop
 265 00e4 BD46     		mov	sp, r7
 266 00e6 02B0     		add	sp, sp, #8
 267              		@ sp needed
 268 00e8 80BD     		pop	{r7, pc}
 269              		.cfi_endproc
 270              	.LFE4:
 272              		.align	1
 273              		.global	ascii_ctrl_bit_set
 274              		.syntax unified
 275              		.code	16
 276              		.thumb_func
 277              		.fpu softvfp
 279              	ascii_ctrl_bit_set:
 280              	.LFB5:
  72:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 
  73:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** void ascii_ctrl_bit_set(unsigned char x) {
 281              		.loc 1 73 0
 282              		.cfi_startproc
 283              		@ args = 0, pretend = 0, frame = 8
 284              		@ frame_needed = 1, uses_anonymous_args = 0
 285 00ea 80B5     		push	{r7, lr}
 286              		.cfi_def_cfa_offset 8
 287              		.cfi_offset 7, -8
 288              		.cfi_offset 14, -4
 289 00ec 82B0     		sub	sp, sp, #8
 290              		.cfi_def_cfa_offset 16
 291 00ee 00AF     		add	r7, sp, #0
 292              		.cfi_def_cfa_register 7
 293 00f0 0200     		movs	r2, r0
 294 00f2 FB1D     		adds	r3, r7, #7
 295 00f4 1A70     		strb	r2, [r3]
  74:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	switch(x) {
 296              		.loc 1 74 0
 297 00f6 FB1D     		adds	r3, r7, #7
 298 00f8 1B78     		ldrb	r3, [r3]
 299 00fa 072B     		cmp	r3, #7
 300 00fc 3AD8     		bhi	.L24
 301 00fe 9A00     		lsls	r2, r3, #2
 302 0100 1E4B     		ldr	r3, .L25
 303 0102 D318     		adds	r3, r2, r3
 304 0104 1B68     		ldr	r3, [r3]
 305 0106 9F46     		mov	pc, r3
 306              		.section	.rodata
 307              		.align	2
 308              	.L16:
 309 0000 08010000 		.word	.L15
 310 0004 1A010000 		.word	.L17
 311 0008 2C010000 		.word	.L18
 312 000c 38010000 		.word	.L19
 313 0010 44010000 		.word	.L20
 314 0014 50010000 		.word	.L21
 315 0018 5C010000 		.word	.L22
 316 001c 68010000 		.word	.L23
 317              		.text
 318              	.L15:
  75:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		case(0): *GPIO_ODR_LOW |= 0x00000001; break;
 319              		.loc 1 75 0
 320 0108 1D4A     		ldr	r2, .L25+4
 321 010a 1D4B     		ldr	r3, .L25+4
 322 010c 1B78     		ldrb	r3, [r3]
 323 010e DBB2     		uxtb	r3, r3
 324 0110 0121     		movs	r1, #1
 325 0112 0B43     		orrs	r3, r1
 326 0114 DBB2     		uxtb	r3, r3
 327 0116 1370     		strb	r3, [r2]
 328 0118 2CE0     		b	.L14
 329              	.L17:
  76:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		case(1): *GPIO_ODR_LOW |= 0x00000010; break;
 330              		.loc 1 76 0
 331 011a 194A     		ldr	r2, .L25+4
 332 011c 184B     		ldr	r3, .L25+4
 333 011e 1B78     		ldrb	r3, [r3]
 334 0120 DBB2     		uxtb	r3, r3
 335 0122 1021     		movs	r1, #16
 336 0124 0B43     		orrs	r3, r1
 337 0126 DBB2     		uxtb	r3, r3
 338 0128 1370     		strb	r3, [r2]
 339 012a 23E0     		b	.L14
 340              	.L18:
  77:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		case(2): *GPIO_ODR_LOW |= 0x00000100; break;
 341              		.loc 1 77 0
 342 012c 144B     		ldr	r3, .L25+4
 343 012e 144A     		ldr	r2, .L25+4
 344 0130 1278     		ldrb	r2, [r2]
 345 0132 D2B2     		uxtb	r2, r2
 346 0134 1A70     		strb	r2, [r3]
 347 0136 1DE0     		b	.L14
 348              	.L19:
  78:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		case(3): *GPIO_ODR_LOW |= 0x00001000; break;
 349              		.loc 1 78 0
 350 0138 114B     		ldr	r3, .L25+4
 351 013a 114A     		ldr	r2, .L25+4
 352 013c 1278     		ldrb	r2, [r2]
 353 013e D2B2     		uxtb	r2, r2
 354 0140 1A70     		strb	r2, [r3]
 355 0142 17E0     		b	.L14
 356              	.L20:
  79:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		case(4): *GPIO_ODR_LOW |= 0x00010000; break;
 357              		.loc 1 79 0
 358 0144 0E4B     		ldr	r3, .L25+4
 359 0146 0E4A     		ldr	r2, .L25+4
 360 0148 1278     		ldrb	r2, [r2]
 361 014a D2B2     		uxtb	r2, r2
 362 014c 1A70     		strb	r2, [r3]
 363 014e 11E0     		b	.L14
 364              	.L21:
  80:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		case(5): *GPIO_ODR_LOW |= 0x00100000; break;
 365              		.loc 1 80 0
 366 0150 0B4B     		ldr	r3, .L25+4
 367 0152 0B4A     		ldr	r2, .L25+4
 368 0154 1278     		ldrb	r2, [r2]
 369 0156 D2B2     		uxtb	r2, r2
 370 0158 1A70     		strb	r2, [r3]
 371 015a 0BE0     		b	.L14
 372              	.L22:
  81:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		case(6): *GPIO_ODR_LOW |= 0x01000000; break;
 373              		.loc 1 81 0
 374 015c 084B     		ldr	r3, .L25+4
 375 015e 084A     		ldr	r2, .L25+4
 376 0160 1278     		ldrb	r2, [r2]
 377 0162 D2B2     		uxtb	r2, r2
 378 0164 1A70     		strb	r2, [r3]
 379 0166 05E0     		b	.L14
 380              	.L23:
  82:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		case(7): *GPIO_ODR_LOW |= 0x10000000; break;
 381              		.loc 1 82 0
 382 0168 054B     		ldr	r3, .L25+4
 383 016a 054A     		ldr	r2, .L25+4
 384 016c 1278     		ldrb	r2, [r2]
 385 016e D2B2     		uxtb	r2, r2
 386 0170 1A70     		strb	r2, [r3]
 387 0172 C046     		nop
 388              	.L14:
 389              	.L24:
  83:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	}
  84:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** }
 390              		.loc 1 84 0
 391 0174 C046     		nop
 392 0176 BD46     		mov	sp, r7
 393 0178 02B0     		add	sp, sp, #8
 394              		@ sp needed
 395 017a 80BD     		pop	{r7, pc}
 396              	.L26:
 397              		.align	2
 398              	.L25:
 399 017c 00000000 		.word	.L16
 400 0180 14100240 		.word	1073877012
 401              		.cfi_endproc
 402              	.LFE5:
 404              		.align	1
 405              		.global	ascii_ctrl_bit_clear
 406              		.syntax unified
 407              		.code	16
 408              		.thumb_func
 409              		.fpu softvfp
 411              	ascii_ctrl_bit_clear:
 412              	.LFB6:
  85:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 
  86:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** void ascii_ctrl_bit_clear(unsigned char x) {
 413              		.loc 1 86 0
 414              		.cfi_startproc
 415              		@ args = 0, pretend = 0, frame = 8
 416              		@ frame_needed = 1, uses_anonymous_args = 0
 417 0184 80B5     		push	{r7, lr}
 418              		.cfi_def_cfa_offset 8
 419              		.cfi_offset 7, -8
 420              		.cfi_offset 14, -4
 421 0186 82B0     		sub	sp, sp, #8
 422              		.cfi_def_cfa_offset 16
 423 0188 00AF     		add	r7, sp, #0
 424              		.cfi_def_cfa_register 7
 425 018a 0200     		movs	r2, r0
 426 018c FB1D     		adds	r3, r7, #7
 427 018e 1A70     		strb	r2, [r3]
  87:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	switch(x) {
 428              		.loc 1 87 0
 429 0190 FB1D     		adds	r3, r7, #7
 430 0192 1B78     		ldrb	r3, [r3]
 431 0194 072B     		cmp	r3, #7
 432 0196 4CD8     		bhi	.L38
 433 0198 9A00     		lsls	r2, r3, #2
 434 019a 284B     		ldr	r3, .L39
 435 019c D318     		adds	r3, r2, r3
 436 019e 1B68     		ldr	r3, [r3]
 437 01a0 9F46     		mov	pc, r3
 438              		.section	.rodata
 439              		.align	2
 440              	.L30:
 441 0020 A2010000 		.word	.L29
 442 0024 B4010000 		.word	.L31
 443 0028 C6010000 		.word	.L32
 444 002c D8010000 		.word	.L33
 445 0030 EA010000 		.word	.L34
 446 0034 FC010000 		.word	.L35
 447 0038 0E020000 		.word	.L36
 448 003c 20020000 		.word	.L37
 449              		.text
 450              	.L29:
  88:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		case(0): *GPIO_ODR_LOW &= 0x11111110; break;
 451              		.loc 1 88 0
 452 01a2 274A     		ldr	r2, .L39+4
 453 01a4 264B     		ldr	r3, .L39+4
 454 01a6 1B78     		ldrb	r3, [r3]
 455 01a8 DBB2     		uxtb	r3, r3
 456 01aa 1021     		movs	r1, #16
 457 01ac 0B40     		ands	r3, r1
 458 01ae DBB2     		uxtb	r3, r3
 459 01b0 1370     		strb	r3, [r2]
 460 01b2 3EE0     		b	.L28
 461              	.L31:
  89:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		case(1): *GPIO_ODR_LOW &= 0x11111101; break;
 462              		.loc 1 89 0
 463 01b4 224A     		ldr	r2, .L39+4
 464 01b6 224B     		ldr	r3, .L39+4
 465 01b8 1B78     		ldrb	r3, [r3]
 466 01ba DBB2     		uxtb	r3, r3
 467 01bc 0121     		movs	r1, #1
 468 01be 0B40     		ands	r3, r1
 469 01c0 DBB2     		uxtb	r3, r3
 470 01c2 1370     		strb	r3, [r2]
 471 01c4 35E0     		b	.L28
 472              	.L32:
  90:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		case(2): *GPIO_ODR_LOW &= 0x11111011; break;
 473              		.loc 1 90 0
 474 01c6 1E4A     		ldr	r2, .L39+4
 475 01c8 1D4B     		ldr	r3, .L39+4
 476 01ca 1B78     		ldrb	r3, [r3]
 477 01cc DBB2     		uxtb	r3, r3
 478 01ce 1121     		movs	r1, #17
 479 01d0 0B40     		ands	r3, r1
 480 01d2 DBB2     		uxtb	r3, r3
 481 01d4 1370     		strb	r3, [r2]
 482 01d6 2CE0     		b	.L28
 483              	.L33:
  91:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		case(3): *GPIO_ODR_LOW &= 0x11110111; break;
 484              		.loc 1 91 0
 485 01d8 194A     		ldr	r2, .L39+4
 486 01da 194B     		ldr	r3, .L39+4
 487 01dc 1B78     		ldrb	r3, [r3]
 488 01de DBB2     		uxtb	r3, r3
 489 01e0 1121     		movs	r1, #17
 490 01e2 0B40     		ands	r3, r1
 491 01e4 DBB2     		uxtb	r3, r3
 492 01e6 1370     		strb	r3, [r2]
 493 01e8 23E0     		b	.L28
 494              	.L34:
  92:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		case(4): *GPIO_ODR_LOW &= 0x11101111; break;
 495              		.loc 1 92 0
 496 01ea 154A     		ldr	r2, .L39+4
 497 01ec 144B     		ldr	r3, .L39+4
 498 01ee 1B78     		ldrb	r3, [r3]
 499 01f0 DBB2     		uxtb	r3, r3
 500 01f2 1121     		movs	r1, #17
 501 01f4 0B40     		ands	r3, r1
 502 01f6 DBB2     		uxtb	r3, r3
 503 01f8 1370     		strb	r3, [r2]
 504 01fa 1AE0     		b	.L28
 505              	.L35:
  93:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		case(5): *GPIO_ODR_LOW &= 0x11011111; break;
 506              		.loc 1 93 0
 507 01fc 104A     		ldr	r2, .L39+4
 508 01fe 104B     		ldr	r3, .L39+4
 509 0200 1B78     		ldrb	r3, [r3]
 510 0202 DBB2     		uxtb	r3, r3
 511 0204 1121     		movs	r1, #17
 512 0206 0B40     		ands	r3, r1
 513 0208 DBB2     		uxtb	r3, r3
 514 020a 1370     		strb	r3, [r2]
 515 020c 11E0     		b	.L28
 516              	.L36:
  94:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		case(6): *GPIO_ODR_LOW &= 0x10111111; break;
 517              		.loc 1 94 0
 518 020e 0C4A     		ldr	r2, .L39+4
 519 0210 0B4B     		ldr	r3, .L39+4
 520 0212 1B78     		ldrb	r3, [r3]
 521 0214 DBB2     		uxtb	r3, r3
 522 0216 1121     		movs	r1, #17
 523 0218 0B40     		ands	r3, r1
 524 021a DBB2     		uxtb	r3, r3
 525 021c 1370     		strb	r3, [r2]
 526 021e 08E0     		b	.L28
 527              	.L37:
  95:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		case(7): *GPIO_ODR_LOW &= 0x01111111; break;
 528              		.loc 1 95 0
 529 0220 074A     		ldr	r2, .L39+4
 530 0222 074B     		ldr	r3, .L39+4
 531 0224 1B78     		ldrb	r3, [r3]
 532 0226 DBB2     		uxtb	r3, r3
 533 0228 1121     		movs	r1, #17
 534 022a 0B40     		ands	r3, r1
 535 022c DBB2     		uxtb	r3, r3
 536 022e 1370     		strb	r3, [r2]
 537 0230 C046     		nop
 538              	.L28:
 539              	.L38:
  96:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	}
  97:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** }
 540              		.loc 1 97 0
 541 0232 C046     		nop
 542 0234 BD46     		mov	sp, r7
 543 0236 02B0     		add	sp, sp, #8
 544              		@ sp needed
 545 0238 80BD     		pop	{r7, pc}
 546              	.L40:
 547 023a C046     		.align	2
 548              	.L39:
 549 023c 20000000 		.word	.L30
 550 0240 14100240 		.word	1073877012
 551              		.cfi_endproc
 552              	.LFE6:
 554              		.align	1
 555              		.global	main
 556              		.syntax unified
 557              		.code	16
 558              		.thumb_func
 559              		.fpu softvfp
 561              	main:
 562              	.LFB7:
  98:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 
  99:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** void main(void) {
 563              		.loc 1 99 0
 564              		.cfi_startproc
 565              		@ args = 0, pretend = 0, frame = 0
 566              		@ frame_needed = 1, uses_anonymous_args = 0
 567 0244 80B5     		push	{r7, lr}
 568              		.cfi_def_cfa_offset 8
 569              		.cfi_offset 7, -8
 570              		.cfi_offset 14, -4
 571 0246 00AF     		add	r7, sp, #0
 572              		.cfi_def_cfa_register 7
 100:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	init_app();
 573              		.loc 1 100 0
 574 0248 FFF7FEFF 		bl	init_app
 575              	.L42:
 101:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	while(1) {
 102:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		*GPIO_ODR_LOW = 0;
 576              		.loc 1 102 0 discriminator 1
 577 024c 084B     		ldr	r3, .L43
 578 024e 0022     		movs	r2, #0
 579 0250 1A70     		strb	r2, [r3]
 103:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		delay_milli(500);
 580              		.loc 1 103 0 discriminator 1
 581 0252 FA23     		movs	r3, #250
 582 0254 5B00     		lsls	r3, r3, #1
 583 0256 1800     		movs	r0, r3
 584 0258 FFF7FEFF 		bl	delay_milli
 104:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		*GPIO_ODR_LOW = 0xFF;
 585              		.loc 1 104 0 discriminator 1
 586 025c 044B     		ldr	r3, .L43
 587 025e FF22     		movs	r2, #255
 588 0260 1A70     		strb	r2, [r3]
 105:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		delay_milli(500);
 589              		.loc 1 105 0 discriminator 1
 590 0262 FA23     		movs	r3, #250
 591 0264 5B00     		lsls	r3, r3, #1
 592 0266 1800     		movs	r0, r3
 593 0268 FFF7FEFF 		bl	delay_milli
 102:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		delay_milli(500);
 594              		.loc 1 102 0 discriminator 1
 595 026c EEE7     		b	.L42
 596              	.L44:
 597 026e C046     		.align	2
 598              	.L43:
 599 0270 14100240 		.word	1073877012
 600              		.cfi_endproc
 601              	.LFE7:
 603              	.Letext0:
