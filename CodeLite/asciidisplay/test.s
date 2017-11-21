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
  39:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	*GPIO_MODER &= 0xFFFFFFFF;
  67              		.loc 1 39 0
  68 0004 144B     		ldr	r3, .L3
  69 0006 144A     		ldr	r2, .L3
  70 0008 1268     		ldr	r2, [r2]
  71 000a 1A60     		str	r2, [r3]
  40:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	*GPIO_MODER |= 0x55555555;
  72              		.loc 1 40 0
  73 000c 124B     		ldr	r3, .L3
  74 000e 124A     		ldr	r2, .L3
  75 0010 1268     		ldr	r2, [r2]
  76 0012 1249     		ldr	r1, .L3+4
  77 0014 0A43     		orrs	r2, r1
  78 0016 1A60     		str	r2, [r3]
  41:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	
  42:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	*GPIO_OTYPER &= 0xFFFF;
  79              		.loc 1 42 0
  80 0018 114B     		ldr	r3, .L3+8
  81 001a 114A     		ldr	r2, .L3+8
  82 001c 1288     		ldrh	r2, [r2]
  83 001e 92B2     		uxth	r2, r2
  84 0020 1A80     		strh	r2, [r3]
  43:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	*GPIO_OTYPER |= 0x7777;
  85              		.loc 1 43 0
  86 0022 0F4A     		ldr	r2, .L3+8
  87 0024 0E4B     		ldr	r3, .L3+8
  88 0026 1B88     		ldrh	r3, [r3]
  89 0028 9BB2     		uxth	r3, r3
  90 002a 0E49     		ldr	r1, .L3+12
  91 002c 0B43     		orrs	r3, r1
  92 002e 9BB2     		uxth	r3, r3
  93 0030 1380     		strh	r3, [r2]
  44:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	
  45:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	*GPIO_PUPDR &= 0xFFFFFFFF;
  94              		.loc 1 45 0
  95 0032 0D4B     		ldr	r3, .L3+16
  96 0034 0C4A     		ldr	r2, .L3+16
  97 0036 1268     		ldr	r2, [r2]
  98 0038 1A60     		str	r2, [r3]
  46:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	*GPIO_PUPDR |= 0xAAAAAAAA;
  99              		.loc 1 46 0
 100 003a 0B4B     		ldr	r3, .L3+16
 101 003c 0A4A     		ldr	r2, .L3+16
 102 003e 1268     		ldr	r2, [r2]
 103 0040 0A49     		ldr	r1, .L3+20
 104 0042 0A43     		orrs	r2, r1
 105 0044 1A60     		str	r2, [r3]
  47:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	
  48:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	*GPIO_ODR_HIGH = 0;
 106              		.loc 1 48 0
 107 0046 0A4B     		ldr	r3, .L3+24
 108 0048 0022     		movs	r2, #0
 109 004a 1A70     		strb	r2, [r3]
  49:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	*GPIO_IDR_LOW = 0;
 110              		.loc 1 49 0
 111 004c 094B     		ldr	r3, .L3+28
 112 004e 0022     		movs	r2, #0
 113 0050 1A70     		strb	r2, [r3]
  50:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	
  51:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** }
 114              		.loc 1 51 0
 115 0052 C046     		nop
 116 0054 BD46     		mov	sp, r7
 117              		@ sp needed
 118 0056 80BD     		pop	{r7, pc}
 119              	.L4:
 120              		.align	2
 121              	.L3:
 122 0058 00100240 		.word	1073876992
 123 005c 55555555 		.word	1431655765
 124 0060 04100240 		.word	1073876996
 125 0064 77770000 		.word	30583
 126 0068 0C100240 		.word	1073877004
 127 006c AAAAAAAA 		.word	-1431655766
 128 0070 15100240 		.word	1073877013
 129 0074 10100240 		.word	1073877008
 130              		.cfi_endproc
 131              	.LFE1:
 133              		.align	1
 134              		.global	delay_250ns
 135              		.syntax unified
 136              		.code	16
 137              		.thumb_func
 138              		.fpu softvfp
 140              	delay_250ns:
 141              	.LFB2:
  52:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 
  53:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** void delay_250ns(void) {
 142              		.loc 1 53 0
 143              		.cfi_startproc
 144              		@ args = 0, pretend = 0, frame = 0
 145              		@ frame_needed = 1, uses_anonymous_args = 0
 146 0078 80B5     		push	{r7, lr}
 147              		.cfi_def_cfa_offset 8
 148              		.cfi_offset 7, -8
 149              		.cfi_offset 14, -4
 150 007a 00AF     		add	r7, sp, #0
 151              		.cfi_def_cfa_register 7
  54:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	*STK_CTRL = 0;
 152              		.loc 1 54 0
 153 007c 0C4B     		ldr	r3, .L7
 154 007e 0022     		movs	r2, #0
 155 0080 1A60     		str	r2, [r3]
  55:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	*STK_VAL = 0;
 156              		.loc 1 55 0
 157 0082 0C4B     		ldr	r3, .L7+4
 158 0084 0022     		movs	r2, #0
 159 0086 1A60     		str	r2, [r3]
  56:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	*STK_LOAD = 49; //  48 + 1. Have to add one as said in manual
 160              		.loc 1 56 0
 161 0088 0B4B     		ldr	r3, .L7+8
 162 008a 3122     		movs	r2, #49
 163 008c 1A60     		str	r2, [r3]
  57:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	*STK_CTRL = 5;
 164              		.loc 1 57 0
 165 008e 084B     		ldr	r3, .L7
 166 0090 0522     		movs	r2, #5
 167 0092 1A60     		str	r2, [r3]
  58:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	while((*STK_CTRL & 0x10000) == 0) {
 168              		.loc 1 58 0
 169 0094 C046     		nop
 170              	.L6:
 171              		.loc 1 58 0 is_stmt 0 discriminator 1
 172 0096 064B     		ldr	r3, .L7
 173 0098 1A68     		ldr	r2, [r3]
 174 009a 8023     		movs	r3, #128
 175 009c 5B02     		lsls	r3, r3, #9
 176 009e 1340     		ands	r3, r2
 177 00a0 F9D0     		beq	.L6
  59:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		// Do nothing :S
  60:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	}
  61:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	*STK_CTRL = 0;
 178              		.loc 1 61 0 is_stmt 1
 179 00a2 034B     		ldr	r3, .L7
 180 00a4 0022     		movs	r2, #0
 181 00a6 1A60     		str	r2, [r3]
  62:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** }
 182              		.loc 1 62 0
 183 00a8 C046     		nop
 184 00aa BD46     		mov	sp, r7
 185              		@ sp needed
 186 00ac 80BD     		pop	{r7, pc}
 187              	.L8:
 188 00ae C046     		.align	2
 189              	.L7:
 190 00b0 10E000E0 		.word	-536813552
 191 00b4 18E000E0 		.word	-536813544
 192 00b8 14E000E0 		.word	-536813548
 193              		.cfi_endproc
 194              	.LFE2:
 196              		.align	1
 197              		.global	delay_mikro
 198              		.syntax unified
 199              		.code	16
 200              		.thumb_func
 201              		.fpu softvfp
 203              	delay_mikro:
 204              	.LFB3:
  63:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 
  64:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** void delay_mikro(unsigned int us) {
 205              		.loc 1 64 0
 206              		.cfi_startproc
 207              		@ args = 0, pretend = 0, frame = 16
 208              		@ frame_needed = 1, uses_anonymous_args = 0
 209 00bc 80B5     		push	{r7, lr}
 210              		.cfi_def_cfa_offset 8
 211              		.cfi_offset 7, -8
 212              		.cfi_offset 14, -4
 213 00be 84B0     		sub	sp, sp, #16
 214              		.cfi_def_cfa_offset 24
 215 00c0 00AF     		add	r7, sp, #0
 216              		.cfi_def_cfa_register 7
 217 00c2 7860     		str	r0, [r7, #4]
 218              	.LBB2:
  65:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	for(unsigned int i = 0; i < us; i++) {
 219              		.loc 1 65 0
 220 00c4 0023     		movs	r3, #0
 221 00c6 FB60     		str	r3, [r7, #12]
 222 00c8 0AE0     		b	.L10
 223              	.L11:
  66:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		delay_250ns();
 224              		.loc 1 66 0 discriminator 3
 225 00ca FFF7FEFF 		bl	delay_250ns
  67:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		delay_250ns();
 226              		.loc 1 67 0 discriminator 3
 227 00ce FFF7FEFF 		bl	delay_250ns
  68:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		delay_250ns();
 228              		.loc 1 68 0 discriminator 3
 229 00d2 FFF7FEFF 		bl	delay_250ns
  69:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		delay_250ns();
 230              		.loc 1 69 0 discriminator 3
 231 00d6 FFF7FEFF 		bl	delay_250ns
  65:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		delay_250ns();
 232              		.loc 1 65 0 discriminator 3
 233 00da FB68     		ldr	r3, [r7, #12]
 234 00dc 0133     		adds	r3, r3, #1
 235 00de FB60     		str	r3, [r7, #12]
 236              	.L10:
  65:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		delay_250ns();
 237              		.loc 1 65 0 is_stmt 0 discriminator 1
 238 00e0 FA68     		ldr	r2, [r7, #12]
 239 00e2 7B68     		ldr	r3, [r7, #4]
 240 00e4 9A42     		cmp	r2, r3
 241 00e6 F0D3     		bcc	.L11
 242              	.LBE2:
  70:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	}
  71:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** }
 243              		.loc 1 71 0 is_stmt 1
 244 00e8 C046     		nop
 245 00ea BD46     		mov	sp, r7
 246 00ec 04B0     		add	sp, sp, #16
 247              		@ sp needed
 248 00ee 80BD     		pop	{r7, pc}
 249              		.cfi_endproc
 250              	.LFE3:
 252              		.global	__aeabi_uidiv
 253              		.align	1
 254              		.global	delay_milli
 255              		.syntax unified
 256              		.code	16
 257              		.thumb_func
 258              		.fpu softvfp
 260              	delay_milli:
 261              	.LFB4:
  72:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 
  73:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** void delay_milli(unsigned int ms) {
 262              		.loc 1 73 0
 263              		.cfi_startproc
 264              		@ args = 0, pretend = 0, frame = 8
 265              		@ frame_needed = 1, uses_anonymous_args = 0
 266 00f0 80B5     		push	{r7, lr}
 267              		.cfi_def_cfa_offset 8
 268              		.cfi_offset 7, -8
 269              		.cfi_offset 14, -4
 270 00f2 82B0     		sub	sp, sp, #8
 271              		.cfi_def_cfa_offset 16
 272 00f4 00AF     		add	r7, sp, #0
 273              		.cfi_def_cfa_register 7
 274 00f6 7860     		str	r0, [r7, #4]
  74:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	#ifdef SIMULATOR
  75:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		ms = ms / 1000;
 275              		.loc 1 75 0
 276 00f8 7A68     		ldr	r2, [r7, #4]
 277 00fa FA23     		movs	r3, #250
 278 00fc 9900     		lsls	r1, r3, #2
 279 00fe 1000     		movs	r0, r2
 280 0100 FFF7FEFF 		bl	__aeabi_uidiv
 281              	.LVL0:
 282 0104 0300     		movs	r3, r0
 283 0106 7B60     		str	r3, [r7, #4]
  76:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		ms++;
 284              		.loc 1 76 0
 285 0108 7B68     		ldr	r3, [r7, #4]
 286 010a 0133     		adds	r3, r3, #1
 287 010c 7B60     		str	r3, [r7, #4]
  77:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	#endif
  78:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	
  79:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	delay_mikro(1000 * ms);	
 288              		.loc 1 79 0
 289 010e 7B68     		ldr	r3, [r7, #4]
 290 0110 FA22     		movs	r2, #250
 291 0112 9200     		lsls	r2, r2, #2
 292 0114 5343     		muls	r3, r2
 293 0116 1800     		movs	r0, r3
 294 0118 FFF7FEFF 		bl	delay_mikro
  80:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** }
 295              		.loc 1 80 0
 296 011c C046     		nop
 297 011e BD46     		mov	sp, r7
 298 0120 02B0     		add	sp, sp, #8
 299              		@ sp needed
 300 0122 80BD     		pop	{r7, pc}
 301              		.cfi_endproc
 302              	.LFE4:
 304              		.align	1
 305              		.global	ascii_ctrl_bit_set
 306              		.syntax unified
 307              		.code	16
 308              		.thumb_func
 309              		.fpu softvfp
 311              	ascii_ctrl_bit_set:
 312              	.LFB5:
  81:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 
  82:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** void ascii_ctrl_bit_set(unsigned char x) {
 313              		.loc 1 82 0
 314              		.cfi_startproc
 315              		@ args = 0, pretend = 0, frame = 8
 316              		@ frame_needed = 1, uses_anonymous_args = 0
 317 0124 80B5     		push	{r7, lr}
 318              		.cfi_def_cfa_offset 8
 319              		.cfi_offset 7, -8
 320              		.cfi_offset 14, -4
 321 0126 82B0     		sub	sp, sp, #8
 322              		.cfi_def_cfa_offset 16
 323 0128 00AF     		add	r7, sp, #0
 324              		.cfi_def_cfa_register 7
 325 012a 0200     		movs	r2, r0
 326 012c FB1D     		adds	r3, r7, #7
 327 012e 1A70     		strb	r2, [r3]
  83:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	switch(x) {
 328              		.loc 1 83 0
 329 0130 FB1D     		adds	r3, r7, #7
 330 0132 1B78     		ldrb	r3, [r3]
 331 0134 072B     		cmp	r3, #7
 332 0136 3AD8     		bhi	.L24
 333 0138 9A00     		lsls	r2, r3, #2
 334 013a 1F4B     		ldr	r3, .L25
 335 013c D318     		adds	r3, r2, r3
 336 013e 1B68     		ldr	r3, [r3]
 337 0140 9F46     		mov	pc, r3
 338              		.section	.rodata
 339              		.align	2
 340              	.L16:
 341 0000 42010000 		.word	.L15
 342 0004 54010000 		.word	.L17
 343 0008 66010000 		.word	.L18
 344 000c 72010000 		.word	.L19
 345 0010 7E010000 		.word	.L20
 346 0014 8A010000 		.word	.L21
 347 0018 96010000 		.word	.L22
 348 001c A2010000 		.word	.L23
 349              		.text
 350              	.L15:
  84:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		case(0): *GPIO_ODR_LOW |= 0x00000001; break;
 351              		.loc 1 84 0
 352 0142 1E4A     		ldr	r2, .L25+4
 353 0144 1D4B     		ldr	r3, .L25+4
 354 0146 1B78     		ldrb	r3, [r3]
 355 0148 DBB2     		uxtb	r3, r3
 356 014a 0121     		movs	r1, #1
 357 014c 0B43     		orrs	r3, r1
 358 014e DBB2     		uxtb	r3, r3
 359 0150 1370     		strb	r3, [r2]
 360 0152 2CE0     		b	.L14
 361              	.L17:
  85:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		case(1): *GPIO_ODR_LOW |= 0x00000010; break;
 362              		.loc 1 85 0
 363 0154 194A     		ldr	r2, .L25+4
 364 0156 194B     		ldr	r3, .L25+4
 365 0158 1B78     		ldrb	r3, [r3]
 366 015a DBB2     		uxtb	r3, r3
 367 015c 1021     		movs	r1, #16
 368 015e 0B43     		orrs	r3, r1
 369 0160 DBB2     		uxtb	r3, r3
 370 0162 1370     		strb	r3, [r2]
 371 0164 23E0     		b	.L14
 372              	.L18:
  86:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		case(2): *GPIO_ODR_LOW |= 0x00000100; break;
 373              		.loc 1 86 0
 374 0166 154B     		ldr	r3, .L25+4
 375 0168 144A     		ldr	r2, .L25+4
 376 016a 1278     		ldrb	r2, [r2]
 377 016c D2B2     		uxtb	r2, r2
 378 016e 1A70     		strb	r2, [r3]
 379 0170 1DE0     		b	.L14
 380              	.L19:
  87:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		case(3): *GPIO_ODR_LOW |= 0x00001000; break;
 381              		.loc 1 87 0
 382 0172 124B     		ldr	r3, .L25+4
 383 0174 114A     		ldr	r2, .L25+4
 384 0176 1278     		ldrb	r2, [r2]
 385 0178 D2B2     		uxtb	r2, r2
 386 017a 1A70     		strb	r2, [r3]
 387 017c 17E0     		b	.L14
 388              	.L20:
  88:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		case(4): *GPIO_ODR_LOW |= 0x00010000; break;
 389              		.loc 1 88 0
 390 017e 0F4B     		ldr	r3, .L25+4
 391 0180 0E4A     		ldr	r2, .L25+4
 392 0182 1278     		ldrb	r2, [r2]
 393 0184 D2B2     		uxtb	r2, r2
 394 0186 1A70     		strb	r2, [r3]
 395 0188 11E0     		b	.L14
 396              	.L21:
  89:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		case(5): *GPIO_ODR_LOW |= 0x00100000; break;
 397              		.loc 1 89 0
 398 018a 0C4B     		ldr	r3, .L25+4
 399 018c 0B4A     		ldr	r2, .L25+4
 400 018e 1278     		ldrb	r2, [r2]
 401 0190 D2B2     		uxtb	r2, r2
 402 0192 1A70     		strb	r2, [r3]
 403 0194 0BE0     		b	.L14
 404              	.L22:
  90:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		case(6): *GPIO_ODR_LOW |= 0x01000000; break;
 405              		.loc 1 90 0
 406 0196 094B     		ldr	r3, .L25+4
 407 0198 084A     		ldr	r2, .L25+4
 408 019a 1278     		ldrb	r2, [r2]
 409 019c D2B2     		uxtb	r2, r2
 410 019e 1A70     		strb	r2, [r3]
 411 01a0 05E0     		b	.L14
 412              	.L23:
  91:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		case(7): *GPIO_ODR_LOW |= 0x10000000; break;
 413              		.loc 1 91 0
 414 01a2 064B     		ldr	r3, .L25+4
 415 01a4 054A     		ldr	r2, .L25+4
 416 01a6 1278     		ldrb	r2, [r2]
 417 01a8 D2B2     		uxtb	r2, r2
 418 01aa 1A70     		strb	r2, [r3]
 419 01ac C046     		nop
 420              	.L14:
 421              	.L24:
  92:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	}
  93:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** }
 422              		.loc 1 93 0
 423 01ae C046     		nop
 424 01b0 BD46     		mov	sp, r7
 425 01b2 02B0     		add	sp, sp, #8
 426              		@ sp needed
 427 01b4 80BD     		pop	{r7, pc}
 428              	.L26:
 429 01b6 C046     		.align	2
 430              	.L25:
 431 01b8 00000000 		.word	.L16
 432 01bc 14100240 		.word	1073877012
 433              		.cfi_endproc
 434              	.LFE5:
 436              		.align	1
 437              		.global	ascii_ctrl_bit_clear
 438              		.syntax unified
 439              		.code	16
 440              		.thumb_func
 441              		.fpu softvfp
 443              	ascii_ctrl_bit_clear:
 444              	.LFB6:
  94:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 
  95:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** void ascii_ctrl_bit_clear(unsigned char x) {
 445              		.loc 1 95 0
 446              		.cfi_startproc
 447              		@ args = 0, pretend = 0, frame = 8
 448              		@ frame_needed = 1, uses_anonymous_args = 0
 449 01c0 80B5     		push	{r7, lr}
 450              		.cfi_def_cfa_offset 8
 451              		.cfi_offset 7, -8
 452              		.cfi_offset 14, -4
 453 01c2 82B0     		sub	sp, sp, #8
 454              		.cfi_def_cfa_offset 16
 455 01c4 00AF     		add	r7, sp, #0
 456              		.cfi_def_cfa_register 7
 457 01c6 0200     		movs	r2, r0
 458 01c8 FB1D     		adds	r3, r7, #7
 459 01ca 1A70     		strb	r2, [r3]
  96:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	switch(x) {
 460              		.loc 1 96 0
 461 01cc FB1D     		adds	r3, r7, #7
 462 01ce 1B78     		ldrb	r3, [r3]
 463 01d0 072B     		cmp	r3, #7
 464 01d2 4CD8     		bhi	.L38
 465 01d4 9A00     		lsls	r2, r3, #2
 466 01d6 284B     		ldr	r3, .L39
 467 01d8 D318     		adds	r3, r2, r3
 468 01da 1B68     		ldr	r3, [r3]
 469 01dc 9F46     		mov	pc, r3
 470              		.section	.rodata
 471              		.align	2
 472              	.L30:
 473 0020 DE010000 		.word	.L29
 474 0024 F0010000 		.word	.L31
 475 0028 02020000 		.word	.L32
 476 002c 14020000 		.word	.L33
 477 0030 26020000 		.word	.L34
 478 0034 38020000 		.word	.L35
 479 0038 4A020000 		.word	.L36
 480 003c 5C020000 		.word	.L37
 481              		.text
 482              	.L29:
  97:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		case(0): *GPIO_ODR_LOW &= 0x11111110; break;
 483              		.loc 1 97 0
 484 01de 274A     		ldr	r2, .L39+4
 485 01e0 264B     		ldr	r3, .L39+4
 486 01e2 1B78     		ldrb	r3, [r3]
 487 01e4 DBB2     		uxtb	r3, r3
 488 01e6 1021     		movs	r1, #16
 489 01e8 0B40     		ands	r3, r1
 490 01ea DBB2     		uxtb	r3, r3
 491 01ec 1370     		strb	r3, [r2]
 492 01ee 3EE0     		b	.L28
 493              	.L31:
  98:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		case(1): *GPIO_ODR_LOW &= 0x11111101; break;
 494              		.loc 1 98 0
 495 01f0 224A     		ldr	r2, .L39+4
 496 01f2 224B     		ldr	r3, .L39+4
 497 01f4 1B78     		ldrb	r3, [r3]
 498 01f6 DBB2     		uxtb	r3, r3
 499 01f8 0121     		movs	r1, #1
 500 01fa 0B40     		ands	r3, r1
 501 01fc DBB2     		uxtb	r3, r3
 502 01fe 1370     		strb	r3, [r2]
 503 0200 35E0     		b	.L28
 504              	.L32:
  99:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		case(2): *GPIO_ODR_LOW &= 0x11111011; break;
 505              		.loc 1 99 0
 506 0202 1E4A     		ldr	r2, .L39+4
 507 0204 1D4B     		ldr	r3, .L39+4
 508 0206 1B78     		ldrb	r3, [r3]
 509 0208 DBB2     		uxtb	r3, r3
 510 020a 1121     		movs	r1, #17
 511 020c 0B40     		ands	r3, r1
 512 020e DBB2     		uxtb	r3, r3
 513 0210 1370     		strb	r3, [r2]
 514 0212 2CE0     		b	.L28
 515              	.L33:
 100:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		case(3): *GPIO_ODR_LOW &= 0x11110111; break;
 516              		.loc 1 100 0
 517 0214 194A     		ldr	r2, .L39+4
 518 0216 194B     		ldr	r3, .L39+4
 519 0218 1B78     		ldrb	r3, [r3]
 520 021a DBB2     		uxtb	r3, r3
 521 021c 1121     		movs	r1, #17
 522 021e 0B40     		ands	r3, r1
 523 0220 DBB2     		uxtb	r3, r3
 524 0222 1370     		strb	r3, [r2]
 525 0224 23E0     		b	.L28
 526              	.L34:
 101:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		case(4): *GPIO_ODR_LOW &= 0x11101111; break;
 527              		.loc 1 101 0
 528 0226 154A     		ldr	r2, .L39+4
 529 0228 144B     		ldr	r3, .L39+4
 530 022a 1B78     		ldrb	r3, [r3]
 531 022c DBB2     		uxtb	r3, r3
 532 022e 1121     		movs	r1, #17
 533 0230 0B40     		ands	r3, r1
 534 0232 DBB2     		uxtb	r3, r3
 535 0234 1370     		strb	r3, [r2]
 536 0236 1AE0     		b	.L28
 537              	.L35:
 102:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		case(5): *GPIO_ODR_LOW &= 0x11011111; break;
 538              		.loc 1 102 0
 539 0238 104A     		ldr	r2, .L39+4
 540 023a 104B     		ldr	r3, .L39+4
 541 023c 1B78     		ldrb	r3, [r3]
 542 023e DBB2     		uxtb	r3, r3
 543 0240 1121     		movs	r1, #17
 544 0242 0B40     		ands	r3, r1
 545 0244 DBB2     		uxtb	r3, r3
 546 0246 1370     		strb	r3, [r2]
 547 0248 11E0     		b	.L28
 548              	.L36:
 103:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		case(6): *GPIO_ODR_LOW &= 0x10111111; break;
 549              		.loc 1 103 0
 550 024a 0C4A     		ldr	r2, .L39+4
 551 024c 0B4B     		ldr	r3, .L39+4
 552 024e 1B78     		ldrb	r3, [r3]
 553 0250 DBB2     		uxtb	r3, r3
 554 0252 1121     		movs	r1, #17
 555 0254 0B40     		ands	r3, r1
 556 0256 DBB2     		uxtb	r3, r3
 557 0258 1370     		strb	r3, [r2]
 558 025a 08E0     		b	.L28
 559              	.L37:
 104:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		case(7): *GPIO_ODR_LOW &= 0x01111111; break;
 560              		.loc 1 104 0
 561 025c 074A     		ldr	r2, .L39+4
 562 025e 074B     		ldr	r3, .L39+4
 563 0260 1B78     		ldrb	r3, [r3]
 564 0262 DBB2     		uxtb	r3, r3
 565 0264 1121     		movs	r1, #17
 566 0266 0B40     		ands	r3, r1
 567 0268 DBB2     		uxtb	r3, r3
 568 026a 1370     		strb	r3, [r2]
 569 026c C046     		nop
 570              	.L28:
 571              	.L38:
 105:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	}
 106:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** }
 572              		.loc 1 106 0
 573 026e C046     		nop
 574 0270 BD46     		mov	sp, r7
 575 0272 02B0     		add	sp, sp, #8
 576              		@ sp needed
 577 0274 80BD     		pop	{r7, pc}
 578              	.L40:
 579 0276 C046     		.align	2
 580              	.L39:
 581 0278 20000000 		.word	.L30
 582 027c 14100240 		.word	1073877012
 583              		.cfi_endproc
 584              	.LFE6:
 586              		.align	1
 587              		.global	ascii_write_controller
 588              		.syntax unified
 589              		.code	16
 590              		.thumb_func
 591              		.fpu softvfp
 593              	ascii_write_controller:
 594              	.LFB7:
 107:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 
 108:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** void ascii_write_controller(unsigned char byte) {
 595              		.loc 1 108 0
 596              		.cfi_startproc
 597              		@ args = 0, pretend = 0, frame = 8
 598              		@ frame_needed = 1, uses_anonymous_args = 0
 599 0280 80B5     		push	{r7, lr}
 600              		.cfi_def_cfa_offset 8
 601              		.cfi_offset 7, -8
 602              		.cfi_offset 14, -4
 603 0282 82B0     		sub	sp, sp, #8
 604              		.cfi_def_cfa_offset 16
 605 0284 00AF     		add	r7, sp, #0
 606              		.cfi_def_cfa_register 7
 607 0286 0200     		movs	r2, r0
 608 0288 FB1D     		adds	r3, r7, #7
 609 028a 1A70     		strb	r2, [r3]
 109:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	ascii_ctrl_bit_set(B_E);
 610              		.loc 1 109 0
 611 028c 0620     		movs	r0, #6
 612 028e FFF7FEFF 		bl	ascii_ctrl_bit_set
 110:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	*GPIO_ODR_HIGH = byte;
 613              		.loc 1 110 0
 614 0292 064A     		ldr	r2, .L42
 615 0294 FB1D     		adds	r3, r7, #7
 616 0296 1B78     		ldrb	r3, [r3]
 617 0298 1370     		strb	r3, [r2]
 111:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	delay_250ns();
 618              		.loc 1 111 0
 619 029a FFF7FEFF 		bl	delay_250ns
 112:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	ascii_ctrl_bit_clear(B_E);
 620              		.loc 1 112 0
 621 029e 0620     		movs	r0, #6
 622 02a0 FFF7FEFF 		bl	ascii_ctrl_bit_clear
 113:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** }
 623              		.loc 1 113 0
 624 02a4 C046     		nop
 625 02a6 BD46     		mov	sp, r7
 626 02a8 02B0     		add	sp, sp, #8
 627              		@ sp needed
 628 02aa 80BD     		pop	{r7, pc}
 629              	.L43:
 630              		.align	2
 631              	.L42:
 632 02ac 15100240 		.word	1073877013
 633              		.cfi_endproc
 634              	.LFE7:
 636              		.align	1
 637              		.global	ascii_read_controller
 638              		.syntax unified
 639              		.code	16
 640              		.thumb_func
 641              		.fpu softvfp
 643              	ascii_read_controller:
 644              	.LFB8:
 114:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 
 115:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** unsigned char ascii_read_controller() {
 645              		.loc 1 115 0
 646              		.cfi_startproc
 647              		@ args = 0, pretend = 0, frame = 8
 648              		@ frame_needed = 1, uses_anonymous_args = 0
 649 02b0 80B5     		push	{r7, lr}
 650              		.cfi_def_cfa_offset 8
 651              		.cfi_offset 7, -8
 652              		.cfi_offset 14, -4
 653 02b2 82B0     		sub	sp, sp, #8
 654              		.cfi_def_cfa_offset 16
 655 02b4 00AF     		add	r7, sp, #0
 656              		.cfi_def_cfa_register 7
 116:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	ascii_ctrl_bit_set(B_E);
 657              		.loc 1 116 0
 658 02b6 0620     		movs	r0, #6
 659 02b8 FFF7FEFF 		bl	ascii_ctrl_bit_set
 117:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	delay_250ns();
 660              		.loc 1 117 0
 661 02bc FFF7FEFF 		bl	delay_250ns
 118:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	delay_250ns();
 662              		.loc 1 118 0
 663 02c0 FFF7FEFF 		bl	delay_250ns
 119:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	unsigned char rv = *GPIO_IDR_HIGH;
 664              		.loc 1 119 0
 665 02c4 064A     		ldr	r2, .L46
 666 02c6 FB1D     		adds	r3, r7, #7
 667 02c8 1278     		ldrb	r2, [r2]
 668 02ca 1A70     		strb	r2, [r3]
 120:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	ascii_ctrl_bit_clear(B_E);
 669              		.loc 1 120 0
 670 02cc 0620     		movs	r0, #6
 671 02ce FFF7FEFF 		bl	ascii_ctrl_bit_clear
 121:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	return rv;
 672              		.loc 1 121 0
 673 02d2 FB1D     		adds	r3, r7, #7
 674 02d4 1B78     		ldrb	r3, [r3]
 122:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** }
 675              		.loc 1 122 0
 676 02d6 1800     		movs	r0, r3
 677 02d8 BD46     		mov	sp, r7
 678 02da 02B0     		add	sp, sp, #8
 679              		@ sp needed
 680 02dc 80BD     		pop	{r7, pc}
 681              	.L47:
 682 02de C046     		.align	2
 683              	.L46:
 684 02e0 11100240 		.word	1073877009
 685              		.cfi_endproc
 686              	.LFE8:
 688              		.align	1
 689              		.global	ascii_write_cmd
 690              		.syntax unified
 691              		.code	16
 692              		.thumb_func
 693              		.fpu softvfp
 695              	ascii_write_cmd:
 696              	.LFB9:
 123:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 
 124:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** void ascii_write_cmd(unsigned char command) {
 697              		.loc 1 124 0
 698              		.cfi_startproc
 699              		@ args = 0, pretend = 0, frame = 8
 700              		@ frame_needed = 1, uses_anonymous_args = 0
 701 02e4 80B5     		push	{r7, lr}
 702              		.cfi_def_cfa_offset 8
 703              		.cfi_offset 7, -8
 704              		.cfi_offset 14, -4
 705 02e6 82B0     		sub	sp, sp, #8
 706              		.cfi_def_cfa_offset 16
 707 02e8 00AF     		add	r7, sp, #0
 708              		.cfi_def_cfa_register 7
 709 02ea 0200     		movs	r2, r0
 710 02ec FB1D     		adds	r3, r7, #7
 711 02ee 1A70     		strb	r2, [r3]
 125:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	ascii_ctrl_bit_clear(B_RS);
 712              		.loc 1 125 0
 713 02f0 0020     		movs	r0, #0
 714 02f2 FFF7FEFF 		bl	ascii_ctrl_bit_clear
 126:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	ascii_ctrl_bit_clear(B_RW);
 715              		.loc 1 126 0
 716 02f6 0120     		movs	r0, #1
 717 02f8 FFF7FEFF 		bl	ascii_ctrl_bit_clear
 127:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	ascii_write_controller(command);
 718              		.loc 1 127 0
 719 02fc FB1D     		adds	r3, r7, #7
 720 02fe 1B78     		ldrb	r3, [r3]
 721 0300 1800     		movs	r0, r3
 722 0302 FFF7FEFF 		bl	ascii_write_controller
 128:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** }
 723              		.loc 1 128 0
 724 0306 C046     		nop
 725 0308 BD46     		mov	sp, r7
 726 030a 02B0     		add	sp, sp, #8
 727              		@ sp needed
 728 030c 80BD     		pop	{r7, pc}
 729              		.cfi_endproc
 730              	.LFE9:
 732              		.align	1
 733              		.global	ascii_write_data
 734              		.syntax unified
 735              		.code	16
 736              		.thumb_func
 737              		.fpu softvfp
 739              	ascii_write_data:
 740              	.LFB10:
 129:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 
 130:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** void ascii_write_data(unsigned char data) {
 741              		.loc 1 130 0
 742              		.cfi_startproc
 743              		@ args = 0, pretend = 0, frame = 8
 744              		@ frame_needed = 1, uses_anonymous_args = 0
 745 030e 80B5     		push	{r7, lr}
 746              		.cfi_def_cfa_offset 8
 747              		.cfi_offset 7, -8
 748              		.cfi_offset 14, -4
 749 0310 82B0     		sub	sp, sp, #8
 750              		.cfi_def_cfa_offset 16
 751 0312 00AF     		add	r7, sp, #0
 752              		.cfi_def_cfa_register 7
 753 0314 0200     		movs	r2, r0
 754 0316 FB1D     		adds	r3, r7, #7
 755 0318 1A70     		strb	r2, [r3]
 131:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	ascii_ctrl_bit_set(B_RS);
 756              		.loc 1 131 0
 757 031a 0020     		movs	r0, #0
 758 031c FFF7FEFF 		bl	ascii_ctrl_bit_set
 132:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	ascii_ctrl_bit_clear(B_RW);
 759              		.loc 1 132 0
 760 0320 0120     		movs	r0, #1
 761 0322 FFF7FEFF 		bl	ascii_ctrl_bit_clear
 133:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	ascii_write_controller(data);
 762              		.loc 1 133 0
 763 0326 FB1D     		adds	r3, r7, #7
 764 0328 1B78     		ldrb	r3, [r3]
 765 032a 1800     		movs	r0, r3
 766 032c FFF7FEFF 		bl	ascii_write_controller
 134:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** }
 767              		.loc 1 134 0
 768 0330 C046     		nop
 769 0332 BD46     		mov	sp, r7
 770 0334 02B0     		add	sp, sp, #8
 771              		@ sp needed
 772 0336 80BD     		pop	{r7, pc}
 773              		.cfi_endproc
 774              	.LFE10:
 776              		.align	1
 777              		.global	ascii_read_status
 778              		.syntax unified
 779              		.code	16
 780              		.thumb_func
 781              		.fpu softvfp
 783              	ascii_read_status:
 784              	.LFB11:
 135:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 
 136:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** unsigned char ascii_read_status(void) {
 785              		.loc 1 136 0
 786              		.cfi_startproc
 787              		@ args = 0, pretend = 0, frame = 8
 788              		@ frame_needed = 1, uses_anonymous_args = 0
 789 0338 90B5     		push	{r4, r7, lr}
 790              		.cfi_def_cfa_offset 12
 791              		.cfi_offset 4, -12
 792              		.cfi_offset 7, -8
 793              		.cfi_offset 14, -4
 794 033a 83B0     		sub	sp, sp, #12
 795              		.cfi_def_cfa_offset 24
 796 033c 00AF     		add	r7, sp, #0
 797              		.cfi_def_cfa_register 7
 137:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	*GPIO_MODER &= 0x0000FFFF;	
 798              		.loc 1 137 0
 799 033e 0E4B     		ldr	r3, .L52
 800 0340 0D4A     		ldr	r2, .L52
 801 0342 1268     		ldr	r2, [r2]
 802 0344 1204     		lsls	r2, r2, #16
 803 0346 120C     		lsrs	r2, r2, #16
 804 0348 1A60     		str	r2, [r3]
 138:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	ascii_ctrl_bit_clear(B_RS);
 805              		.loc 1 138 0
 806 034a 0020     		movs	r0, #0
 807 034c FFF7FEFF 		bl	ascii_ctrl_bit_clear
 139:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	ascii_ctrl_bit_set(B_RW);
 808              		.loc 1 139 0
 809 0350 0120     		movs	r0, #1
 810 0352 FFF7FEFF 		bl	ascii_ctrl_bit_set
 140:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	unsigned char rv = ascii_read_controller();
 811              		.loc 1 140 0
 812 0356 FC1D     		adds	r4, r7, #7
 813 0358 FFF7FEFF 		bl	ascii_read_controller
 814 035c 0300     		movs	r3, r0
 815 035e 2370     		strb	r3, [r4]
 141:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	*GPIO_MODER |= 0x55550000;	
 816              		.loc 1 141 0
 817 0360 054B     		ldr	r3, .L52
 818 0362 054A     		ldr	r2, .L52
 819 0364 1268     		ldr	r2, [r2]
 820 0366 0549     		ldr	r1, .L52+4
 821 0368 0A43     		orrs	r2, r1
 822 036a 1A60     		str	r2, [r3]
 142:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	return rv;
 823              		.loc 1 142 0
 824 036c FB1D     		adds	r3, r7, #7
 825 036e 1B78     		ldrb	r3, [r3]
 143:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** }
 826              		.loc 1 143 0
 827 0370 1800     		movs	r0, r3
 828 0372 BD46     		mov	sp, r7
 829 0374 03B0     		add	sp, sp, #12
 830              		@ sp needed
 831 0376 90BD     		pop	{r4, r7, pc}
 832              	.L53:
 833              		.align	2
 834              	.L52:
 835 0378 00100240 		.word	1073876992
 836 037c 00005555 		.word	1431633920
 837              		.cfi_endproc
 838              	.LFE11:
 840              		.align	1
 841              		.global	ascii_read_data
 842              		.syntax unified
 843              		.code	16
 844              		.thumb_func
 845              		.fpu softvfp
 847              	ascii_read_data:
 848              	.LFB12:
 144:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 
 145:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** unsigned char ascii_read_data(void) {
 849              		.loc 1 145 0
 850              		.cfi_startproc
 851              		@ args = 0, pretend = 0, frame = 8
 852              		@ frame_needed = 1, uses_anonymous_args = 0
 853 0380 90B5     		push	{r4, r7, lr}
 854              		.cfi_def_cfa_offset 12
 855              		.cfi_offset 4, -12
 856              		.cfi_offset 7, -8
 857              		.cfi_offset 14, -4
 858 0382 83B0     		sub	sp, sp, #12
 859              		.cfi_def_cfa_offset 24
 860 0384 00AF     		add	r7, sp, #0
 861              		.cfi_def_cfa_register 7
 146:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	*GPIO_MODER &= 0x0000FFFF;	
 862              		.loc 1 146 0
 863 0386 0E4B     		ldr	r3, .L56
 864 0388 0D4A     		ldr	r2, .L56
 865 038a 1268     		ldr	r2, [r2]
 866 038c 1204     		lsls	r2, r2, #16
 867 038e 120C     		lsrs	r2, r2, #16
 868 0390 1A60     		str	r2, [r3]
 147:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	ascii_ctrl_bit_set(B_RS);
 869              		.loc 1 147 0
 870 0392 0020     		movs	r0, #0
 871 0394 FFF7FEFF 		bl	ascii_ctrl_bit_set
 148:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	ascii_ctrl_bit_set(B_RW);
 872              		.loc 1 148 0
 873 0398 0120     		movs	r0, #1
 874 039a FFF7FEFF 		bl	ascii_ctrl_bit_set
 149:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	unsigned char rv = ascii_read_controller();
 875              		.loc 1 149 0
 876 039e FC1D     		adds	r4, r7, #7
 877 03a0 FFF7FEFF 		bl	ascii_read_controller
 878 03a4 0300     		movs	r3, r0
 879 03a6 2370     		strb	r3, [r4]
 150:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	*GPIO_MODER |= 0x55550000;	
 880              		.loc 1 150 0
 881 03a8 054B     		ldr	r3, .L56
 882 03aa 054A     		ldr	r2, .L56
 883 03ac 1268     		ldr	r2, [r2]
 884 03ae 0549     		ldr	r1, .L56+4
 885 03b0 0A43     		orrs	r2, r1
 886 03b2 1A60     		str	r2, [r3]
 151:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	return rv;
 887              		.loc 1 151 0
 888 03b4 FB1D     		adds	r3, r7, #7
 889 03b6 1B78     		ldrb	r3, [r3]
 152:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** }
 890              		.loc 1 152 0
 891 03b8 1800     		movs	r0, r3
 892 03ba BD46     		mov	sp, r7
 893 03bc 03B0     		add	sp, sp, #12
 894              		@ sp needed
 895 03be 90BD     		pop	{r4, r7, pc}
 896              	.L57:
 897              		.align	2
 898              	.L56:
 899 03c0 00100240 		.word	1073876992
 900 03c4 00005555 		.word	1431633920
 901              		.cfi_endproc
 902              	.LFE12:
 904              		.align	1
 905              		.global	ascii_command
 906              		.syntax unified
 907              		.code	16
 908              		.thumb_func
 909              		.fpu softvfp
 911              	ascii_command:
 912              	.LFB13:
 153:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 
 154:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** void ascii_command(char command) {
 913              		.loc 1 154 0
 914              		.cfi_startproc
 915              		@ args = 0, pretend = 0, frame = 8
 916              		@ frame_needed = 1, uses_anonymous_args = 0
 917 03c8 80B5     		push	{r7, lr}
 918              		.cfi_def_cfa_offset 8
 919              		.cfi_offset 7, -8
 920              		.cfi_offset 14, -4
 921 03ca 82B0     		sub	sp, sp, #8
 922              		.cfi_def_cfa_offset 16
 923 03cc 00AF     		add	r7, sp, #0
 924              		.cfi_def_cfa_register 7
 925 03ce 0200     		movs	r2, r0
 926 03d0 FB1D     		adds	r3, r7, #7
 927 03d2 1A70     		strb	r2, [r3]
 155:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	while((ascii_read_status() & 0x80) == 0x80) {
 928              		.loc 1 155 0
 929 03d4 C046     		nop
 930              	.L59:
 931              		.loc 1 155 0 is_stmt 0 discriminator 1
 932 03d6 FFF7FEFF 		bl	ascii_read_status
 933 03da 0300     		movs	r3, r0
 934 03dc 1A00     		movs	r2, r3
 935 03de 8023     		movs	r3, #128
 936 03e0 1340     		ands	r3, r2
 937 03e2 802B     		cmp	r3, #128
 938 03e4 F7D0     		beq	.L59
 156:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		// Do nothing, wait for status flag
 157:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	}
 158:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	delay_mikro(8);
 939              		.loc 1 158 0 is_stmt 1
 940 03e6 0820     		movs	r0, #8
 941 03e8 FFF7FEFF 		bl	delay_mikro
 159:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	ascii_write_cmd(command);
 942              		.loc 1 159 0
 943 03ec FB1D     		adds	r3, r7, #7
 944 03ee 1B78     		ldrb	r3, [r3]
 945 03f0 1800     		movs	r0, r3
 946 03f2 FFF7FEFF 		bl	ascii_write_cmd
 160:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	delay_milli(2);
 947              		.loc 1 160 0
 948 03f6 0220     		movs	r0, #2
 949 03f8 FFF7FEFF 		bl	delay_milli
 161:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** }
 950              		.loc 1 161 0
 951 03fc C046     		nop
 952 03fe BD46     		mov	sp, r7
 953 0400 02B0     		add	sp, sp, #8
 954              		@ sp needed
 955 0402 80BD     		pop	{r7, pc}
 956              		.cfi_endproc
 957              	.LFE13:
 959              		.align	1
 960              		.global	ascii_init
 961              		.syntax unified
 962              		.code	16
 963              		.thumb_func
 964              		.fpu softvfp
 966              	ascii_init:
 967              	.LFB14:
 162:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 
 163:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** void ascii_init(void) {
 968              		.loc 1 163 0
 969              		.cfi_startproc
 970              		@ args = 0, pretend = 0, frame = 0
 971              		@ frame_needed = 1, uses_anonymous_args = 0
 972 0404 80B5     		push	{r7, lr}
 973              		.cfi_def_cfa_offset 8
 974              		.cfi_offset 7, -8
 975              		.cfi_offset 14, -4
 976 0406 00AF     		add	r7, sp, #0
 977              		.cfi_def_cfa_register 7
 164:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	ascii_command(0x00111000); // Set display size and font size
 978              		.loc 1 164 0
 979 0408 0020     		movs	r0, #0
 980 040a FFF7FEFF 		bl	ascii_command
 165:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c ****     ascii_command(0x00001110); // Set display, cursor on
 981              		.loc 1 165 0
 982 040e 1020     		movs	r0, #16
 983 0410 FFF7FEFF 		bl	ascii_command
 166:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c ****     ascii_command(0x00000110); // Inc, no shift
 984              		.loc 1 166 0
 985 0414 1020     		movs	r0, #16
 986 0416 FFF7FEFF 		bl	ascii_command
 167:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** }
 987              		.loc 1 167 0
 988 041a C046     		nop
 989 041c BD46     		mov	sp, r7
 990              		@ sp needed
 991 041e 80BD     		pop	{r7, pc}
 992              		.cfi_endproc
 993              	.LFE14:
 995              		.align	1
 996              		.global	ascii_write_char
 997              		.syntax unified
 998              		.code	16
 999              		.thumb_func
 1000              		.fpu softvfp
 1002              	ascii_write_char:
 1003              	.LFB15:
 168:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 
 169:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** void ascii_write_char(unsigned char charToWrite) {
 1004              		.loc 1 169 0
 1005              		.cfi_startproc
 1006              		@ args = 0, pretend = 0, frame = 8
 1007              		@ frame_needed = 1, uses_anonymous_args = 0
 1008 0420 80B5     		push	{r7, lr}
 1009              		.cfi_def_cfa_offset 8
 1010              		.cfi_offset 7, -8
 1011              		.cfi_offset 14, -4
 1012 0422 82B0     		sub	sp, sp, #8
 1013              		.cfi_def_cfa_offset 16
 1014 0424 00AF     		add	r7, sp, #0
 1015              		.cfi_def_cfa_register 7
 1016 0426 0200     		movs	r2, r0
 1017 0428 FB1D     		adds	r3, r7, #7
 1018 042a 1A70     		strb	r2, [r3]
 170:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	while((ascii_read_status() & 0x80) == 0x80) {
 1019              		.loc 1 170 0
 1020 042c C046     		nop
 1021              	.L62:
 1022              		.loc 1 170 0 is_stmt 0 discriminator 1
 1023 042e FFF7FEFF 		bl	ascii_read_status
 1024 0432 0300     		movs	r3, r0
 1025 0434 1A00     		movs	r2, r3
 1026 0436 8023     		movs	r3, #128
 1027 0438 1340     		ands	r3, r2
 1028 043a 802B     		cmp	r3, #128
 1029 043c F7D0     		beq	.L62
 171:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	// Do nothing, wait for status flag
 172:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c ****     }
 173:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	delay_mikro(8);
 1030              		.loc 1 173 0 is_stmt 1
 1031 043e 0820     		movs	r0, #8
 1032 0440 FFF7FEFF 		bl	delay_mikro
 174:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c ****     ascii_write_data(charToWrite);
 1033              		.loc 1 174 0
 1034 0444 FB1D     		adds	r3, r7, #7
 1035 0446 1B78     		ldrb	r3, [r3]
 1036 0448 1800     		movs	r0, r3
 1037 044a FFF7FEFF 		bl	ascii_write_data
 175:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c ****     delay_milli(2);
 1038              		.loc 1 175 0
 1039 044e 0220     		movs	r0, #2
 1040 0450 FFF7FEFF 		bl	delay_milli
 176:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** }
 1041              		.loc 1 176 0
 1042 0454 C046     		nop
 1043 0456 BD46     		mov	sp, r7
 1044 0458 02B0     		add	sp, sp, #8
 1045              		@ sp needed
 1046 045a 80BD     		pop	{r7, pc}
 1047              		.cfi_endproc
 1048              	.LFE15:
 1050              		.align	1
 1051              		.global	goToXY
 1052              		.syntax unified
 1053              		.code	16
 1054              		.thumb_func
 1055              		.fpu softvfp
 1057              	goToXY:
 1058              	.LFB16:
 177:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 
 178:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** void goToXY(unsigned char row, unsigned char column) {
 1059              		.loc 1 178 0
 1060              		.cfi_startproc
 1061              		@ args = 0, pretend = 0, frame = 16
 1062              		@ frame_needed = 1, uses_anonymous_args = 0
 1063 045c 80B5     		push	{r7, lr}
 1064              		.cfi_def_cfa_offset 8
 1065              		.cfi_offset 7, -8
 1066              		.cfi_offset 14, -4
 1067 045e 84B0     		sub	sp, sp, #16
 1068              		.cfi_def_cfa_offset 24
 1069 0460 00AF     		add	r7, sp, #0
 1070              		.cfi_def_cfa_register 7
 1071 0462 0200     		movs	r2, r0
 1072 0464 FB1D     		adds	r3, r7, #7
 1073 0466 1A70     		strb	r2, [r3]
 1074 0468 BB1D     		adds	r3, r7, #6
 1075 046a 0A1C     		adds	r2, r1, #0
 1076 046c 1A70     		strb	r2, [r3]
 179:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	unsigned char address = row - 1;
 1077              		.loc 1 179 0
 1078 046e 0F23     		movs	r3, #15
 1079 0470 FB18     		adds	r3, r7, r3
 1080 0472 FA1D     		adds	r2, r7, #7
 1081 0474 1278     		ldrb	r2, [r2]
 1082 0476 013A     		subs	r2, r2, #1
 1083 0478 1A70     		strb	r2, [r3]
 180:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	if(column == 2) {
 1084              		.loc 1 180 0
 1085 047a BB1D     		adds	r3, r7, #6
 1086 047c 1B78     		ldrb	r3, [r3]
 1087 047e 022B     		cmp	r3, #2
 1088 0480 06D1     		bne	.L64
 181:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		address = address + 0x40;
 1089              		.loc 1 181 0
 1090 0482 0F23     		movs	r3, #15
 1091 0484 FB18     		adds	r3, r7, r3
 1092 0486 0F22     		movs	r2, #15
 1093 0488 BA18     		adds	r2, r7, r2
 1094 048a 1278     		ldrb	r2, [r2]
 1095 048c 4032     		adds	r2, r2, #64
 1096 048e 1A70     		strb	r2, [r3]
 1097              	.L64:
 182:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	}
 183:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	ascii_write_cmd(0x80 | address);
 1098              		.loc 1 183 0
 1099 0490 0F23     		movs	r3, #15
 1100 0492 FB18     		adds	r3, r7, r3
 1101 0494 1B78     		ldrb	r3, [r3]
 1102 0496 8022     		movs	r2, #128
 1103 0498 5242     		rsbs	r2, r2, #0
 1104 049a 1343     		orrs	r3, r2
 1105 049c DBB2     		uxtb	r3, r3
 1106 049e 1800     		movs	r0, r3
 1107 04a0 FFF7FEFF 		bl	ascii_write_cmd
 184:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** }
 1108              		.loc 1 184 0
 1109 04a4 C046     		nop
 1110 04a6 BD46     		mov	sp, r7
 1111 04a8 04B0     		add	sp, sp, #16
 1112              		@ sp needed
 1113 04aa 80BD     		pop	{r7, pc}
 1114              		.cfi_endproc
 1115              	.LFE16:
 1117              		.align	1
 1118              		.global	main
 1119              		.syntax unified
 1120              		.code	16
 1121              		.thumb_func
 1122              		.fpu softvfp
 1124              	main:
 1125              	.LFB17:
 185:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 
 186:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** void main(void) {
 1126              		.loc 1 186 0
 1127              		.cfi_startproc
 1128              		@ args = 0, pretend = 0, frame = 0
 1129              		@ frame_needed = 1, uses_anonymous_args = 0
 1130 04ac 80B5     		push	{r7, lr}
 1131              		.cfi_def_cfa_offset 8
 1132              		.cfi_offset 7, -8
 1133              		.cfi_offset 14, -4
 1134 04ae 00AF     		add	r7, sp, #0
 1135              		.cfi_def_cfa_register 7
 187:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	init_app();
 1136              		.loc 1 187 0
 1137 04b0 FFF7FEFF 		bl	init_app
 188:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c ****     ascii_init();
 1138              		.loc 1 188 0
 1139 04b4 FFF7FEFF 		bl	ascii_init
 189:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	goToXY(1,1);
 1140              		.loc 1 189 0
 1141 04b8 0121     		movs	r1, #1
 1142 04ba 0120     		movs	r0, #1
 1143 04bc FFF7FEFF 		bl	goToXY
 190:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	ascii_write_char('b');
 1144              		.loc 1 190 0
 1145 04c0 6220     		movs	r0, #98
 1146 04c2 FFF7FEFF 		bl	ascii_write_char
 191:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** }
 1147              		.loc 1 191 0
 1148 04c6 C046     		nop
 1149 04c8 BD46     		mov	sp, r7
 1150              		@ sp needed
 1151 04ca 80BD     		pop	{r7, pc}
 1152              		.cfi_endproc
 1153              	.LFE17:
 1155              	.Letext0:
