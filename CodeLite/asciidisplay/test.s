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
  68 0004 114B     		ldr	r3, .L3
  69 0006 114A     		ldr	r2, .L3
  70 0008 1268     		ldr	r2, [r2]
  71 000a 1A60     		str	r2, [r3]
  40:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	*GPIO_MODER |= 0x55555555;
  72              		.loc 1 40 0
  73 000c 0F4B     		ldr	r3, .L3
  74 000e 0F4A     		ldr	r2, .L3
  75 0010 1268     		ldr	r2, [r2]
  76 0012 0F49     		ldr	r1, .L3+4
  77 0014 0A43     		orrs	r2, r1
  78 0016 1A60     		str	r2, [r3]
  41:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	
  42:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	*GPIO_OTYPER &= 0xFFFF;
  79              		.loc 1 42 0
  80 0018 0E4B     		ldr	r3, .L3+8
  81 001a 0E4A     		ldr	r2, .L3+8
  82 001c 1288     		ldrh	r2, [r2]
  83 001e 92B2     		uxth	r2, r2
  84 0020 1A80     		strh	r2, [r3]
  43:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	*GPIO_OTYPER |= 0x7777;
  85              		.loc 1 43 0
  86 0022 0C4A     		ldr	r2, .L3+8
  87 0024 0B4B     		ldr	r3, .L3+8
  88 0026 1B88     		ldrh	r3, [r3]
  89 0028 9BB2     		uxth	r3, r3
  90 002a 0B49     		ldr	r1, .L3+12
  91 002c 0B43     		orrs	r3, r1
  92 002e 9BB2     		uxth	r3, r3
  93 0030 1380     		strh	r3, [r2]
  44:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	
  45:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	*GPIO_PUPDR &= 0xFFFFFFFF;
  94              		.loc 1 45 0
  95 0032 0A4B     		ldr	r3, .L3+16
  96 0034 094A     		ldr	r2, .L3+16
  97 0036 1268     		ldr	r2, [r2]
  98 0038 1A60     		str	r2, [r3]
  46:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	*GPIO_PUPDR |= 0xAAAAAAAA;
  99              		.loc 1 46 0
 100 003a 084B     		ldr	r3, .L3+16
 101 003c 074A     		ldr	r2, .L3+16
 102 003e 1268     		ldr	r2, [r2]
 103 0040 0749     		ldr	r1, .L3+20
 104 0042 0A43     		orrs	r2, r1
 105 0044 1A60     		str	r2, [r3]
  47:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** }
 106              		.loc 1 47 0
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
  48:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 
  49:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** void delay_250ns(void) {
 132              		.loc 1 49 0
 133              		.cfi_startproc
 134              		@ args = 0, pretend = 0, frame = 0
 135              		@ frame_needed = 1, uses_anonymous_args = 0
 136 0064 80B5     		push	{r7, lr}
 137              		.cfi_def_cfa_offset 8
 138              		.cfi_offset 7, -8
 139              		.cfi_offset 14, -4
 140 0066 00AF     		add	r7, sp, #0
 141              		.cfi_def_cfa_register 7
  50:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	*STK_CTRL = 0;
 142              		.loc 1 50 0
 143 0068 0C4B     		ldr	r3, .L7
 144 006a 0022     		movs	r2, #0
 145 006c 1A60     		str	r2, [r3]
  51:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	*STK_VAL = 0;
 146              		.loc 1 51 0
 147 006e 0C4B     		ldr	r3, .L7+4
 148 0070 0022     		movs	r2, #0
 149 0072 1A60     		str	r2, [r3]
  52:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	*STK_LOAD = 49; //  48 + 1. Have to add one as said in manual
 150              		.loc 1 52 0
 151 0074 0B4B     		ldr	r3, .L7+8
 152 0076 3122     		movs	r2, #49
 153 0078 1A60     		str	r2, [r3]
  53:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	*STK_CTRL = 0x1;
 154              		.loc 1 53 0
 155 007a 084B     		ldr	r3, .L7
 156 007c 0122     		movs	r2, #1
 157 007e 1A60     		str	r2, [r3]
  54:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	while((*STK_CTRL & 0x10000) == 0) {
 158              		.loc 1 54 0
 159 0080 C046     		nop
 160              	.L6:
 161              		.loc 1 54 0 is_stmt 0 discriminator 1
 162 0082 064B     		ldr	r3, .L7
 163 0084 1A68     		ldr	r2, [r3]
 164 0086 8023     		movs	r3, #128
 165 0088 5B02     		lsls	r3, r3, #9
 166 008a 1340     		ands	r3, r2
 167 008c F9D0     		beq	.L6
  55:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		// Do nothing :S
  56:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	}
  57:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	*STK_CTRL = 0;
 168              		.loc 1 57 0 is_stmt 1
 169 008e 034B     		ldr	r3, .L7
 170 0090 0022     		movs	r2, #0
 171 0092 1A60     		str	r2, [r3]
  58:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** }
 172              		.loc 1 58 0
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
  59:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 
  60:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** void delay_mikro(unsigned int us) {
 195              		.loc 1 60 0
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
  61:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	for(unsigned int i = 0; i < us; i++) {
 209              		.loc 1 61 0
 210 00b0 0023     		movs	r3, #0
 211 00b2 FB60     		str	r3, [r7, #12]
 212 00b4 02E0     		b	.L10
 213              	.L11:
 214              		.loc 1 61 0 is_stmt 0 discriminator 3
 215 00b6 FB68     		ldr	r3, [r7, #12]
 216 00b8 0133     		adds	r3, r3, #1
 217 00ba FB60     		str	r3, [r7, #12]
 218              	.L10:
 219              		.loc 1 61 0 discriminator 1
 220 00bc FA68     		ldr	r2, [r7, #12]
 221 00be 7B68     		ldr	r3, [r7, #4]
 222 00c0 9A42     		cmp	r2, r3
 223 00c2 F8D3     		bcc	.L11
 224              	.LBE2:
  62:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		delay_250ns;
  63:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		delay_250ns;
  64:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		delay_250ns;
  65:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		delay_250ns;
  66:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	}
  67:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** }
 225              		.loc 1 67 0 is_stmt 1
 226 00c4 C046     		nop
 227 00c6 BD46     		mov	sp, r7
 228 00c8 04B0     		add	sp, sp, #16
 229              		@ sp needed
 230 00ca 80BD     		pop	{r7, pc}
 231              		.cfi_endproc
 232              	.LFE3:
 234              		.global	__aeabi_uidiv
 235              		.align	1
 236              		.global	delay_milli
 237              		.syntax unified
 238              		.code	16
 239              		.thumb_func
 240              		.fpu softvfp
 242              	delay_milli:
 243              	.LFB4:
  68:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 
  69:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** void delay_milli(unsigned int ms) {
 244              		.loc 1 69 0
 245              		.cfi_startproc
 246              		@ args = 0, pretend = 0, frame = 8
 247              		@ frame_needed = 1, uses_anonymous_args = 0
 248 00cc 80B5     		push	{r7, lr}
 249              		.cfi_def_cfa_offset 8
 250              		.cfi_offset 7, -8
 251              		.cfi_offset 14, -4
 252 00ce 82B0     		sub	sp, sp, #8
 253              		.cfi_def_cfa_offset 16
 254 00d0 00AF     		add	r7, sp, #0
 255              		.cfi_def_cfa_register 7
 256 00d2 7860     		str	r0, [r7, #4]
  70:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	#ifdef SIMULATOR
  71:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		ms = ms / 1000;
 257              		.loc 1 71 0
 258 00d4 7A68     		ldr	r2, [r7, #4]
 259 00d6 FA23     		movs	r3, #250
 260 00d8 9900     		lsls	r1, r3, #2
 261 00da 1000     		movs	r0, r2
 262 00dc FFF7FEFF 		bl	__aeabi_uidiv
 263              	.LVL0:
 264 00e0 0300     		movs	r3, r0
 265 00e2 7B60     		str	r3, [r7, #4]
  72:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		ms++;
 266              		.loc 1 72 0
 267 00e4 7B68     		ldr	r3, [r7, #4]
 268 00e6 0133     		adds	r3, r3, #1
 269 00e8 7B60     		str	r3, [r7, #4]
  73:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	#endif
  74:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	
  75:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	delay_mikro(1000 * ms);	
 270              		.loc 1 75 0
 271 00ea 7B68     		ldr	r3, [r7, #4]
 272 00ec FA22     		movs	r2, #250
 273 00ee 9200     		lsls	r2, r2, #2
 274 00f0 5343     		muls	r3, r2
 275 00f2 1800     		movs	r0, r3
 276 00f4 FFF7FEFF 		bl	delay_mikro
  76:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** }
 277              		.loc 1 76 0
 278 00f8 C046     		nop
 279 00fa BD46     		mov	sp, r7
 280 00fc 02B0     		add	sp, sp, #8
 281              		@ sp needed
 282 00fe 80BD     		pop	{r7, pc}
 283              		.cfi_endproc
 284              	.LFE4:
 286              		.align	1
 287              		.global	ascii_ctrl_bit_set
 288              		.syntax unified
 289              		.code	16
 290              		.thumb_func
 291              		.fpu softvfp
 293              	ascii_ctrl_bit_set:
 294              	.LFB5:
  77:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 
  78:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** void ascii_ctrl_bit_set(unsigned char x) {
 295              		.loc 1 78 0
 296              		.cfi_startproc
 297              		@ args = 0, pretend = 0, frame = 8
 298              		@ frame_needed = 1, uses_anonymous_args = 0
 299 0100 80B5     		push	{r7, lr}
 300              		.cfi_def_cfa_offset 8
 301              		.cfi_offset 7, -8
 302              		.cfi_offset 14, -4
 303 0102 82B0     		sub	sp, sp, #8
 304              		.cfi_def_cfa_offset 16
 305 0104 00AF     		add	r7, sp, #0
 306              		.cfi_def_cfa_register 7
 307 0106 0200     		movs	r2, r0
 308 0108 FB1D     		adds	r3, r7, #7
 309 010a 1A70     		strb	r2, [r3]
  79:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	switch(x) {
 310              		.loc 1 79 0
 311 010c FB1D     		adds	r3, r7, #7
 312 010e 1B78     		ldrb	r3, [r3]
 313 0110 072B     		cmp	r3, #7
 314 0112 3AD8     		bhi	.L24
 315 0114 9A00     		lsls	r2, r3, #2
 316 0116 1F4B     		ldr	r3, .L25
 317 0118 D318     		adds	r3, r2, r3
 318 011a 1B68     		ldr	r3, [r3]
 319 011c 9F46     		mov	pc, r3
 320              		.section	.rodata
 321              		.align	2
 322              	.L16:
 323 0000 1E010000 		.word	.L15
 324 0004 30010000 		.word	.L17
 325 0008 42010000 		.word	.L18
 326 000c 4E010000 		.word	.L19
 327 0010 5A010000 		.word	.L20
 328 0014 66010000 		.word	.L21
 329 0018 72010000 		.word	.L22
 330 001c 7E010000 		.word	.L23
 331              		.text
 332              	.L15:
  80:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		case(0): *GPIO_ODR_LOW |= 0x00000001; break;
 333              		.loc 1 80 0
 334 011e 1E4A     		ldr	r2, .L25+4
 335 0120 1D4B     		ldr	r3, .L25+4
 336 0122 1B78     		ldrb	r3, [r3]
 337 0124 DBB2     		uxtb	r3, r3
 338 0126 0121     		movs	r1, #1
 339 0128 0B43     		orrs	r3, r1
 340 012a DBB2     		uxtb	r3, r3
 341 012c 1370     		strb	r3, [r2]
 342 012e 2CE0     		b	.L14
 343              	.L17:
  81:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		case(1): *GPIO_ODR_LOW |= 0x00000010; break;
 344              		.loc 1 81 0
 345 0130 194A     		ldr	r2, .L25+4
 346 0132 194B     		ldr	r3, .L25+4
 347 0134 1B78     		ldrb	r3, [r3]
 348 0136 DBB2     		uxtb	r3, r3
 349 0138 1021     		movs	r1, #16
 350 013a 0B43     		orrs	r3, r1
 351 013c DBB2     		uxtb	r3, r3
 352 013e 1370     		strb	r3, [r2]
 353 0140 23E0     		b	.L14
 354              	.L18:
  82:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		case(2): *GPIO_ODR_LOW |= 0x00000100; break;
 355              		.loc 1 82 0
 356 0142 154B     		ldr	r3, .L25+4
 357 0144 144A     		ldr	r2, .L25+4
 358 0146 1278     		ldrb	r2, [r2]
 359 0148 D2B2     		uxtb	r2, r2
 360 014a 1A70     		strb	r2, [r3]
 361 014c 1DE0     		b	.L14
 362              	.L19:
  83:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		case(3): *GPIO_ODR_LOW |= 0x00001000; break;
 363              		.loc 1 83 0
 364 014e 124B     		ldr	r3, .L25+4
 365 0150 114A     		ldr	r2, .L25+4
 366 0152 1278     		ldrb	r2, [r2]
 367 0154 D2B2     		uxtb	r2, r2
 368 0156 1A70     		strb	r2, [r3]
 369 0158 17E0     		b	.L14
 370              	.L20:
  84:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		case(4): *GPIO_ODR_LOW |= 0x00010000; break;
 371              		.loc 1 84 0
 372 015a 0F4B     		ldr	r3, .L25+4
 373 015c 0E4A     		ldr	r2, .L25+4
 374 015e 1278     		ldrb	r2, [r2]
 375 0160 D2B2     		uxtb	r2, r2
 376 0162 1A70     		strb	r2, [r3]
 377 0164 11E0     		b	.L14
 378              	.L21:
  85:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		case(5): *GPIO_ODR_LOW |= 0x00100000; break;
 379              		.loc 1 85 0
 380 0166 0C4B     		ldr	r3, .L25+4
 381 0168 0B4A     		ldr	r2, .L25+4
 382 016a 1278     		ldrb	r2, [r2]
 383 016c D2B2     		uxtb	r2, r2
 384 016e 1A70     		strb	r2, [r3]
 385 0170 0BE0     		b	.L14
 386              	.L22:
  86:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		case(6): *GPIO_ODR_LOW |= 0x01000000; break;
 387              		.loc 1 86 0
 388 0172 094B     		ldr	r3, .L25+4
 389 0174 084A     		ldr	r2, .L25+4
 390 0176 1278     		ldrb	r2, [r2]
 391 0178 D2B2     		uxtb	r2, r2
 392 017a 1A70     		strb	r2, [r3]
 393 017c 05E0     		b	.L14
 394              	.L23:
  87:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		case(7): *GPIO_ODR_LOW |= 0x10000000; break;
 395              		.loc 1 87 0
 396 017e 064B     		ldr	r3, .L25+4
 397 0180 054A     		ldr	r2, .L25+4
 398 0182 1278     		ldrb	r2, [r2]
 399 0184 D2B2     		uxtb	r2, r2
 400 0186 1A70     		strb	r2, [r3]
 401 0188 C046     		nop
 402              	.L14:
 403              	.L24:
  88:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	}
  89:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** }
 404              		.loc 1 89 0
 405 018a C046     		nop
 406 018c BD46     		mov	sp, r7
 407 018e 02B0     		add	sp, sp, #8
 408              		@ sp needed
 409 0190 80BD     		pop	{r7, pc}
 410              	.L26:
 411 0192 C046     		.align	2
 412              	.L25:
 413 0194 00000000 		.word	.L16
 414 0198 14100240 		.word	1073877012
 415              		.cfi_endproc
 416              	.LFE5:
 418              		.align	1
 419              		.global	ascii_ctrl_bit_clear
 420              		.syntax unified
 421              		.code	16
 422              		.thumb_func
 423              		.fpu softvfp
 425              	ascii_ctrl_bit_clear:
 426              	.LFB6:
  90:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 
  91:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** void ascii_ctrl_bit_clear(unsigned char x) {
 427              		.loc 1 91 0
 428              		.cfi_startproc
 429              		@ args = 0, pretend = 0, frame = 8
 430              		@ frame_needed = 1, uses_anonymous_args = 0
 431 019c 80B5     		push	{r7, lr}
 432              		.cfi_def_cfa_offset 8
 433              		.cfi_offset 7, -8
 434              		.cfi_offset 14, -4
 435 019e 82B0     		sub	sp, sp, #8
 436              		.cfi_def_cfa_offset 16
 437 01a0 00AF     		add	r7, sp, #0
 438              		.cfi_def_cfa_register 7
 439 01a2 0200     		movs	r2, r0
 440 01a4 FB1D     		adds	r3, r7, #7
 441 01a6 1A70     		strb	r2, [r3]
  92:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	switch(x) {
 442              		.loc 1 92 0
 443 01a8 FB1D     		adds	r3, r7, #7
 444 01aa 1B78     		ldrb	r3, [r3]
 445 01ac 072B     		cmp	r3, #7
 446 01ae 4CD8     		bhi	.L38
 447 01b0 9A00     		lsls	r2, r3, #2
 448 01b2 284B     		ldr	r3, .L39
 449 01b4 D318     		adds	r3, r2, r3
 450 01b6 1B68     		ldr	r3, [r3]
 451 01b8 9F46     		mov	pc, r3
 452              		.section	.rodata
 453              		.align	2
 454              	.L30:
 455 0020 BA010000 		.word	.L29
 456 0024 CC010000 		.word	.L31
 457 0028 DE010000 		.word	.L32
 458 002c F0010000 		.word	.L33
 459 0030 02020000 		.word	.L34
 460 0034 14020000 		.word	.L35
 461 0038 26020000 		.word	.L36
 462 003c 38020000 		.word	.L37
 463              		.text
 464              	.L29:
  93:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		case(0): *GPIO_ODR_LOW &= 0x11111110; break;
 465              		.loc 1 93 0
 466 01ba 274A     		ldr	r2, .L39+4
 467 01bc 264B     		ldr	r3, .L39+4
 468 01be 1B78     		ldrb	r3, [r3]
 469 01c0 DBB2     		uxtb	r3, r3
 470 01c2 1021     		movs	r1, #16
 471 01c4 0B40     		ands	r3, r1
 472 01c6 DBB2     		uxtb	r3, r3
 473 01c8 1370     		strb	r3, [r2]
 474 01ca 3EE0     		b	.L28
 475              	.L31:
  94:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		case(1): *GPIO_ODR_LOW &= 0x11111101; break;
 476              		.loc 1 94 0
 477 01cc 224A     		ldr	r2, .L39+4
 478 01ce 224B     		ldr	r3, .L39+4
 479 01d0 1B78     		ldrb	r3, [r3]
 480 01d2 DBB2     		uxtb	r3, r3
 481 01d4 0121     		movs	r1, #1
 482 01d6 0B40     		ands	r3, r1
 483 01d8 DBB2     		uxtb	r3, r3
 484 01da 1370     		strb	r3, [r2]
 485 01dc 35E0     		b	.L28
 486              	.L32:
  95:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		case(2): *GPIO_ODR_LOW &= 0x11111011; break;
 487              		.loc 1 95 0
 488 01de 1E4A     		ldr	r2, .L39+4
 489 01e0 1D4B     		ldr	r3, .L39+4
 490 01e2 1B78     		ldrb	r3, [r3]
 491 01e4 DBB2     		uxtb	r3, r3
 492 01e6 1121     		movs	r1, #17
 493 01e8 0B40     		ands	r3, r1
 494 01ea DBB2     		uxtb	r3, r3
 495 01ec 1370     		strb	r3, [r2]
 496 01ee 2CE0     		b	.L28
 497              	.L33:
  96:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		case(3): *GPIO_ODR_LOW &= 0x11110111; break;
 498              		.loc 1 96 0
 499 01f0 194A     		ldr	r2, .L39+4
 500 01f2 194B     		ldr	r3, .L39+4
 501 01f4 1B78     		ldrb	r3, [r3]
 502 01f6 DBB2     		uxtb	r3, r3
 503 01f8 1121     		movs	r1, #17
 504 01fa 0B40     		ands	r3, r1
 505 01fc DBB2     		uxtb	r3, r3
 506 01fe 1370     		strb	r3, [r2]
 507 0200 23E0     		b	.L28
 508              	.L34:
  97:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		case(4): *GPIO_ODR_LOW &= 0x11101111; break;
 509              		.loc 1 97 0
 510 0202 154A     		ldr	r2, .L39+4
 511 0204 144B     		ldr	r3, .L39+4
 512 0206 1B78     		ldrb	r3, [r3]
 513 0208 DBB2     		uxtb	r3, r3
 514 020a 1121     		movs	r1, #17
 515 020c 0B40     		ands	r3, r1
 516 020e DBB2     		uxtb	r3, r3
 517 0210 1370     		strb	r3, [r2]
 518 0212 1AE0     		b	.L28
 519              	.L35:
  98:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		case(5): *GPIO_ODR_LOW &= 0x11011111; break;
 520              		.loc 1 98 0
 521 0214 104A     		ldr	r2, .L39+4
 522 0216 104B     		ldr	r3, .L39+4
 523 0218 1B78     		ldrb	r3, [r3]
 524 021a DBB2     		uxtb	r3, r3
 525 021c 1121     		movs	r1, #17
 526 021e 0B40     		ands	r3, r1
 527 0220 DBB2     		uxtb	r3, r3
 528 0222 1370     		strb	r3, [r2]
 529 0224 11E0     		b	.L28
 530              	.L36:
  99:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		case(6): *GPIO_ODR_LOW &= 0x10111111; break;
 531              		.loc 1 99 0
 532 0226 0C4A     		ldr	r2, .L39+4
 533 0228 0B4B     		ldr	r3, .L39+4
 534 022a 1B78     		ldrb	r3, [r3]
 535 022c DBB2     		uxtb	r3, r3
 536 022e 1121     		movs	r1, #17
 537 0230 0B40     		ands	r3, r1
 538 0232 DBB2     		uxtb	r3, r3
 539 0234 1370     		strb	r3, [r2]
 540 0236 08E0     		b	.L28
 541              	.L37:
 100:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		case(7): *GPIO_ODR_LOW &= 0x01111111; break;
 542              		.loc 1 100 0
 543 0238 074A     		ldr	r2, .L39+4
 544 023a 074B     		ldr	r3, .L39+4
 545 023c 1B78     		ldrb	r3, [r3]
 546 023e DBB2     		uxtb	r3, r3
 547 0240 1121     		movs	r1, #17
 548 0242 0B40     		ands	r3, r1
 549 0244 DBB2     		uxtb	r3, r3
 550 0246 1370     		strb	r3, [r2]
 551 0248 C046     		nop
 552              	.L28:
 553              	.L38:
 101:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	}
 102:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** }
 554              		.loc 1 102 0
 555 024a C046     		nop
 556 024c BD46     		mov	sp, r7
 557 024e 02B0     		add	sp, sp, #8
 558              		@ sp needed
 559 0250 80BD     		pop	{r7, pc}
 560              	.L40:
 561 0252 C046     		.align	2
 562              	.L39:
 563 0254 20000000 		.word	.L30
 564 0258 14100240 		.word	1073877012
 565              		.cfi_endproc
 566              	.LFE6:
 568              		.align	1
 569              		.global	ascii_write_controller
 570              		.syntax unified
 571              		.code	16
 572              		.thumb_func
 573              		.fpu softvfp
 575              	ascii_write_controller:
 576              	.LFB7:
 103:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 
 104:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** void ascii_write_controller(unsigned char byte) {
 577              		.loc 1 104 0
 578              		.cfi_startproc
 579              		@ args = 0, pretend = 0, frame = 8
 580              		@ frame_needed = 1, uses_anonymous_args = 0
 581 025c 80B5     		push	{r7, lr}
 582              		.cfi_def_cfa_offset 8
 583              		.cfi_offset 7, -8
 584              		.cfi_offset 14, -4
 585 025e 82B0     		sub	sp, sp, #8
 586              		.cfi_def_cfa_offset 16
 587 0260 00AF     		add	r7, sp, #0
 588              		.cfi_def_cfa_register 7
 589 0262 0200     		movs	r2, r0
 590 0264 FB1D     		adds	r3, r7, #7
 591 0266 1A70     		strb	r2, [r3]
 105:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	ascii_ctrl_bit_set(B_E);
 592              		.loc 1 105 0
 593 0268 0620     		movs	r0, #6
 594 026a FFF7FEFF 		bl	ascii_ctrl_bit_set
 106:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	*GPIO_ODR_HIGH = byte;
 595              		.loc 1 106 0
 596 026e 064A     		ldr	r2, .L42
 597 0270 FB1D     		adds	r3, r7, #7
 598 0272 1B78     		ldrb	r3, [r3]
 599 0274 1370     		strb	r3, [r2]
 107:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	delay_250ns();
 600              		.loc 1 107 0
 601 0276 FFF7FEFF 		bl	delay_250ns
 108:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	ascii_ctrl_bit_clear(B_E);
 602              		.loc 1 108 0
 603 027a 0620     		movs	r0, #6
 604 027c FFF7FEFF 		bl	ascii_ctrl_bit_clear
 109:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** }
 605              		.loc 1 109 0
 606 0280 C046     		nop
 607 0282 BD46     		mov	sp, r7
 608 0284 02B0     		add	sp, sp, #8
 609              		@ sp needed
 610 0286 80BD     		pop	{r7, pc}
 611              	.L43:
 612              		.align	2
 613              	.L42:
 614 0288 15100240 		.word	1073877013
 615              		.cfi_endproc
 616              	.LFE7:
 618              		.align	1
 619              		.global	ascii_read_controller
 620              		.syntax unified
 621              		.code	16
 622              		.thumb_func
 623              		.fpu softvfp
 625              	ascii_read_controller:
 626              	.LFB8:
 110:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 
 111:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** unsigned char ascii_read_controller() {
 627              		.loc 1 111 0
 628              		.cfi_startproc
 629              		@ args = 0, pretend = 0, frame = 8
 630              		@ frame_needed = 1, uses_anonymous_args = 0
 631 028c 80B5     		push	{r7, lr}
 632              		.cfi_def_cfa_offset 8
 633              		.cfi_offset 7, -8
 634              		.cfi_offset 14, -4
 635 028e 82B0     		sub	sp, sp, #8
 636              		.cfi_def_cfa_offset 16
 637 0290 00AF     		add	r7, sp, #0
 638              		.cfi_def_cfa_register 7
 112:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	ascii_ctrl_bit_set(B_E);
 639              		.loc 1 112 0
 640 0292 0620     		movs	r0, #6
 641 0294 FFF7FEFF 		bl	ascii_ctrl_bit_set
 113:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	delay_250ns();
 642              		.loc 1 113 0
 643 0298 FFF7FEFF 		bl	delay_250ns
 114:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	delay_250ns();
 644              		.loc 1 114 0
 645 029c FFF7FEFF 		bl	delay_250ns
 115:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	unsigned char rv = *GPIO_IDR_HIGH;
 646              		.loc 1 115 0
 647 02a0 064A     		ldr	r2, .L46
 648 02a2 FB1D     		adds	r3, r7, #7
 649 02a4 1278     		ldrb	r2, [r2]
 650 02a6 1A70     		strb	r2, [r3]
 116:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	ascii_ctrl_bit_clear(B_E);
 651              		.loc 1 116 0
 652 02a8 0620     		movs	r0, #6
 653 02aa FFF7FEFF 		bl	ascii_ctrl_bit_clear
 117:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	return rv;
 654              		.loc 1 117 0
 655 02ae FB1D     		adds	r3, r7, #7
 656 02b0 1B78     		ldrb	r3, [r3]
 118:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** }
 657              		.loc 1 118 0
 658 02b2 1800     		movs	r0, r3
 659 02b4 BD46     		mov	sp, r7
 660 02b6 02B0     		add	sp, sp, #8
 661              		@ sp needed
 662 02b8 80BD     		pop	{r7, pc}
 663              	.L47:
 664 02ba C046     		.align	2
 665              	.L46:
 666 02bc 11100240 		.word	1073877009
 667              		.cfi_endproc
 668              	.LFE8:
 670              		.align	1
 671              		.global	ascii_write_cmd
 672              		.syntax unified
 673              		.code	16
 674              		.thumb_func
 675              		.fpu softvfp
 677              	ascii_write_cmd:
 678              	.LFB9:
 119:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 
 120:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** void ascii_write_cmd(unsigned char command) {
 679              		.loc 1 120 0
 680              		.cfi_startproc
 681              		@ args = 0, pretend = 0, frame = 8
 682              		@ frame_needed = 1, uses_anonymous_args = 0
 683 02c0 80B5     		push	{r7, lr}
 684              		.cfi_def_cfa_offset 8
 685              		.cfi_offset 7, -8
 686              		.cfi_offset 14, -4
 687 02c2 82B0     		sub	sp, sp, #8
 688              		.cfi_def_cfa_offset 16
 689 02c4 00AF     		add	r7, sp, #0
 690              		.cfi_def_cfa_register 7
 691 02c6 0200     		movs	r2, r0
 692 02c8 FB1D     		adds	r3, r7, #7
 693 02ca 1A70     		strb	r2, [r3]
 121:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	ascii_ctrl_bit_set(B_RS);
 694              		.loc 1 121 0
 695 02cc 0020     		movs	r0, #0
 696 02ce FFF7FEFF 		bl	ascii_ctrl_bit_set
 122:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	ascii_ctrl_bit_set(B_RW);
 697              		.loc 1 122 0
 698 02d2 0120     		movs	r0, #1
 699 02d4 FFF7FEFF 		bl	ascii_ctrl_bit_set
 123:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	ascii_write_controller(command);
 700              		.loc 1 123 0
 701 02d8 FB1D     		adds	r3, r7, #7
 702 02da 1B78     		ldrb	r3, [r3]
 703 02dc 1800     		movs	r0, r3
 704 02de FFF7FEFF 		bl	ascii_write_controller
 124:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** }
 705              		.loc 1 124 0
 706 02e2 C046     		nop
 707 02e4 BD46     		mov	sp, r7
 708 02e6 02B0     		add	sp, sp, #8
 709              		@ sp needed
 710 02e8 80BD     		pop	{r7, pc}
 711              		.cfi_endproc
 712              	.LFE9:
 714              		.align	1
 715              		.global	ascii_write_data
 716              		.syntax unified
 717              		.code	16
 718              		.thumb_func
 719              		.fpu softvfp
 721              	ascii_write_data:
 722              	.LFB10:
 125:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 
 126:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** void ascii_write_data(unsigned char data) {
 723              		.loc 1 126 0
 724              		.cfi_startproc
 725              		@ args = 0, pretend = 0, frame = 8
 726              		@ frame_needed = 1, uses_anonymous_args = 0
 727 02ea 80B5     		push	{r7, lr}
 728              		.cfi_def_cfa_offset 8
 729              		.cfi_offset 7, -8
 730              		.cfi_offset 14, -4
 731 02ec 82B0     		sub	sp, sp, #8
 732              		.cfi_def_cfa_offset 16
 733 02ee 00AF     		add	r7, sp, #0
 734              		.cfi_def_cfa_register 7
 735 02f0 0200     		movs	r2, r0
 736 02f2 FB1D     		adds	r3, r7, #7
 737 02f4 1A70     		strb	r2, [r3]
 127:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	ascii_ctrl_bit_set(B_RS);
 738              		.loc 1 127 0
 739 02f6 0020     		movs	r0, #0
 740 02f8 FFF7FEFF 		bl	ascii_ctrl_bit_set
 128:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	ascii_ctrl_bit_clear(B_RW);
 741              		.loc 1 128 0
 742 02fc 0120     		movs	r0, #1
 743 02fe FFF7FEFF 		bl	ascii_ctrl_bit_clear
 129:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	ascii_write_controller(data);
 744              		.loc 1 129 0
 745 0302 FB1D     		adds	r3, r7, #7
 746 0304 1B78     		ldrb	r3, [r3]
 747 0306 1800     		movs	r0, r3
 748 0308 FFF7FEFF 		bl	ascii_write_controller
 130:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** }
 749              		.loc 1 130 0
 750 030c C046     		nop
 751 030e BD46     		mov	sp, r7
 752 0310 02B0     		add	sp, sp, #8
 753              		@ sp needed
 754 0312 80BD     		pop	{r7, pc}
 755              		.cfi_endproc
 756              	.LFE10:
 758              		.align	1
 759              		.global	ascii_read_status
 760              		.syntax unified
 761              		.code	16
 762              		.thumb_func
 763              		.fpu softvfp
 765              	ascii_read_status:
 766              	.LFB11:
 131:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 
 132:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** unsigned char ascii_read_status(void) {
 767              		.loc 1 132 0
 768              		.cfi_startproc
 769              		@ args = 0, pretend = 0, frame = 8
 770              		@ frame_needed = 1, uses_anonymous_args = 0
 771 0314 90B5     		push	{r4, r7, lr}
 772              		.cfi_def_cfa_offset 12
 773              		.cfi_offset 4, -12
 774              		.cfi_offset 7, -8
 775              		.cfi_offset 14, -4
 776 0316 83B0     		sub	sp, sp, #12
 777              		.cfi_def_cfa_offset 24
 778 0318 00AF     		add	r7, sp, #0
 779              		.cfi_def_cfa_register 7
 133:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	*GPIO_MODER &= 0x0000FFFF;	
 780              		.loc 1 133 0
 781 031a 0E4B     		ldr	r3, .L52
 782 031c 0D4A     		ldr	r2, .L52
 783 031e 1268     		ldr	r2, [r2]
 784 0320 1204     		lsls	r2, r2, #16
 785 0322 120C     		lsrs	r2, r2, #16
 786 0324 1A60     		str	r2, [r3]
 134:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	ascii_ctrl_bit_clear(B_RS);
 787              		.loc 1 134 0
 788 0326 0020     		movs	r0, #0
 789 0328 FFF7FEFF 		bl	ascii_ctrl_bit_clear
 135:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	ascii_ctrl_bit_set(B_RW);
 790              		.loc 1 135 0
 791 032c 0120     		movs	r0, #1
 792 032e FFF7FEFF 		bl	ascii_ctrl_bit_set
 136:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	unsigned char rv = ascii_read_controller();
 793              		.loc 1 136 0
 794 0332 FC1D     		adds	r4, r7, #7
 795 0334 FFF7FEFF 		bl	ascii_read_controller
 796 0338 0300     		movs	r3, r0
 797 033a 2370     		strb	r3, [r4]
 137:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	*GPIO_MODER |= 0x5555FFFF;	
 798              		.loc 1 137 0
 799 033c 054B     		ldr	r3, .L52
 800 033e 054A     		ldr	r2, .L52
 801 0340 1268     		ldr	r2, [r2]
 802 0342 0549     		ldr	r1, .L52+4
 803 0344 0A43     		orrs	r2, r1
 804 0346 1A60     		str	r2, [r3]
 138:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	return rv;
 805              		.loc 1 138 0
 806 0348 FB1D     		adds	r3, r7, #7
 807 034a 1B78     		ldrb	r3, [r3]
 139:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** }
 808              		.loc 1 139 0
 809 034c 1800     		movs	r0, r3
 810 034e BD46     		mov	sp, r7
 811 0350 03B0     		add	sp, sp, #12
 812              		@ sp needed
 813 0352 90BD     		pop	{r4, r7, pc}
 814              	.L53:
 815              		.align	2
 816              	.L52:
 817 0354 00100240 		.word	1073876992
 818 0358 FFFF5555 		.word	1431699455
 819              		.cfi_endproc
 820              	.LFE11:
 822              		.align	1
 823              		.global	ascii_read_data
 824              		.syntax unified
 825              		.code	16
 826              		.thumb_func
 827              		.fpu softvfp
 829              	ascii_read_data:
 830              	.LFB12:
 140:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 
 141:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** unsigned char ascii_read_data(void) {
 831              		.loc 1 141 0
 832              		.cfi_startproc
 833              		@ args = 0, pretend = 0, frame = 8
 834              		@ frame_needed = 1, uses_anonymous_args = 0
 835 035c 90B5     		push	{r4, r7, lr}
 836              		.cfi_def_cfa_offset 12
 837              		.cfi_offset 4, -12
 838              		.cfi_offset 7, -8
 839              		.cfi_offset 14, -4
 840 035e 83B0     		sub	sp, sp, #12
 841              		.cfi_def_cfa_offset 24
 842 0360 00AF     		add	r7, sp, #0
 843              		.cfi_def_cfa_register 7
 142:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	*GPIO_MODER &= 0x0000FFFF;	
 844              		.loc 1 142 0
 845 0362 0E4B     		ldr	r3, .L56
 846 0364 0D4A     		ldr	r2, .L56
 847 0366 1268     		ldr	r2, [r2]
 848 0368 1204     		lsls	r2, r2, #16
 849 036a 120C     		lsrs	r2, r2, #16
 850 036c 1A60     		str	r2, [r3]
 143:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	ascii_ctrl_bit_set(B_RS);
 851              		.loc 1 143 0
 852 036e 0020     		movs	r0, #0
 853 0370 FFF7FEFF 		bl	ascii_ctrl_bit_set
 144:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	ascii_ctrl_bit_set(B_RW);
 854              		.loc 1 144 0
 855 0374 0120     		movs	r0, #1
 856 0376 FFF7FEFF 		bl	ascii_ctrl_bit_set
 145:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	unsigned char rv = ascii_read_controller();
 857              		.loc 1 145 0
 858 037a FC1D     		adds	r4, r7, #7
 859 037c FFF7FEFF 		bl	ascii_read_controller
 860 0380 0300     		movs	r3, r0
 861 0382 2370     		strb	r3, [r4]
 146:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	*GPIO_MODER |= 0x5555FFFF;	
 862              		.loc 1 146 0
 863 0384 054B     		ldr	r3, .L56
 864 0386 054A     		ldr	r2, .L56
 865 0388 1268     		ldr	r2, [r2]
 866 038a 0549     		ldr	r1, .L56+4
 867 038c 0A43     		orrs	r2, r1
 868 038e 1A60     		str	r2, [r3]
 147:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	return rv;
 869              		.loc 1 147 0
 870 0390 FB1D     		adds	r3, r7, #7
 871 0392 1B78     		ldrb	r3, [r3]
 148:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** }
 872              		.loc 1 148 0
 873 0394 1800     		movs	r0, r3
 874 0396 BD46     		mov	sp, r7
 875 0398 03B0     		add	sp, sp, #12
 876              		@ sp needed
 877 039a 90BD     		pop	{r4, r7, pc}
 878              	.L57:
 879              		.align	2
 880              	.L56:
 881 039c 00100240 		.word	1073876992
 882 03a0 FFFF5555 		.word	1431699455
 883              		.cfi_endproc
 884              	.LFE12:
 886              		.align	1
 887              		.global	ascii_command
 888              		.syntax unified
 889              		.code	16
 890              		.thumb_func
 891              		.fpu softvfp
 893              	ascii_command:
 894              	.LFB13:
 149:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 
 150:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** void ascii_command(char command) {
 895              		.loc 1 150 0
 896              		.cfi_startproc
 897              		@ args = 0, pretend = 0, frame = 8
 898              		@ frame_needed = 1, uses_anonymous_args = 0
 899 03a4 80B5     		push	{r7, lr}
 900              		.cfi_def_cfa_offset 8
 901              		.cfi_offset 7, -8
 902              		.cfi_offset 14, -4
 903 03a6 82B0     		sub	sp, sp, #8
 904              		.cfi_def_cfa_offset 16
 905 03a8 00AF     		add	r7, sp, #0
 906              		.cfi_def_cfa_register 7
 907 03aa 0200     		movs	r2, r0
 908 03ac FB1D     		adds	r3, r7, #7
 909 03ae 1A70     		strb	r2, [r3]
 151:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	while((ascii_read_status() & 80) == 0x80) {
 910              		.loc 1 151 0
 911 03b0 C046     		nop
 912 03b2 FFF7FEFF 		bl	ascii_read_status
 152:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 		// Do nothing, wait for status flag
 153:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	}
 154:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	delay_mikro(8);
 913              		.loc 1 154 0
 914 03b6 0820     		movs	r0, #8
 915 03b8 FFF7FEFF 		bl	delay_mikro
 155:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	ascii_write_cmd(1);
 916              		.loc 1 155 0
 917 03bc 0120     		movs	r0, #1
 918 03be FFF7FEFF 		bl	ascii_write_cmd
 156:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	delay_milli(2);
 919              		.loc 1 156 0
 920 03c2 0220     		movs	r0, #2
 921 03c4 FFF7FEFF 		bl	delay_milli
 157:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** }
 922              		.loc 1 157 0
 923 03c8 C046     		nop
 924 03ca BD46     		mov	sp, r7
 925 03cc 02B0     		add	sp, sp, #8
 926              		@ sp needed
 927 03ce 80BD     		pop	{r7, pc}
 928              		.cfi_endproc
 929              	.LFE13:
 931              		.align	1
 932              		.global	ascii_init
 933              		.syntax unified
 934              		.code	16
 935              		.thumb_func
 936              		.fpu softvfp
 938              	ascii_init:
 939              	.LFB14:
 158:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 
 159:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** void ascii_init(void) {
 940              		.loc 1 159 0
 941              		.cfi_startproc
 942              		@ args = 0, pretend = 0, frame = 0
 943              		@ frame_needed = 1, uses_anonymous_args = 0
 944 03d0 80B5     		push	{r7, lr}
 945              		.cfi_def_cfa_offset 8
 946              		.cfi_offset 7, -8
 947              		.cfi_offset 14, -4
 948 03d2 00AF     		add	r7, sp, #0
 949              		.cfi_def_cfa_register 7
 160:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	ascii_command(0x00111000); // Set display size and font size
 950              		.loc 1 160 0
 951 03d4 0020     		movs	r0, #0
 952 03d6 FFF7FEFF 		bl	ascii_command
 161:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c ****     ascii_command(0x00001110); // Set display, cursor on
 953              		.loc 1 161 0
 954 03da 1020     		movs	r0, #16
 955 03dc FFF7FEFF 		bl	ascii_command
 162:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c ****     ascii_command(0x00000110); // Inc, no shift
 956              		.loc 1 162 0
 957 03e0 1020     		movs	r0, #16
 958 03e2 FFF7FEFF 		bl	ascii_command
 163:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** }
 959              		.loc 1 163 0
 960 03e6 C046     		nop
 961 03e8 BD46     		mov	sp, r7
 962              		@ sp needed
 963 03ea 80BD     		pop	{r7, pc}
 964              		.cfi_endproc
 965              	.LFE14:
 967              		.align	1
 968              		.global	ascii_write_char
 969              		.syntax unified
 970              		.code	16
 971              		.thumb_func
 972              		.fpu softvfp
 974              	ascii_write_char:
 975              	.LFB15:
 164:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 
 165:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** void ascii_write_char(unsigned char charToWrite) {
 976              		.loc 1 165 0
 977              		.cfi_startproc
 978              		@ args = 0, pretend = 0, frame = 8
 979              		@ frame_needed = 1, uses_anonymous_args = 0
 980 03ec 80B5     		push	{r7, lr}
 981              		.cfi_def_cfa_offset 8
 982              		.cfi_offset 7, -8
 983              		.cfi_offset 14, -4
 984 03ee 82B0     		sub	sp, sp, #8
 985              		.cfi_def_cfa_offset 16
 986 03f0 00AF     		add	r7, sp, #0
 987              		.cfi_def_cfa_register 7
 988 03f2 0200     		movs	r2, r0
 989 03f4 FB1D     		adds	r3, r7, #7
 990 03f6 1A70     		strb	r2, [r3]
 166:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	while((ascii_read_status() & 80) == 0x80) {
 991              		.loc 1 166 0
 992 03f8 C046     		nop
 993 03fa FFF7FEFF 		bl	ascii_read_status
 167:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	// Do nothing, wait for status flag
 168:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c ****     }
 169:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	delay_mikro(8);
 994              		.loc 1 169 0
 995 03fe 0820     		movs	r0, #8
 996 0400 FFF7FEFF 		bl	delay_mikro
 170:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c ****     ascii_write_data(charToWrite);
 997              		.loc 1 170 0
 998 0404 FB1D     		adds	r3, r7, #7
 999 0406 1B78     		ldrb	r3, [r3]
 1000 0408 1800     		movs	r0, r3
 1001 040a FFF7FEFF 		bl	ascii_write_data
 171:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c ****     delay_milli(2);
 1002              		.loc 1 171 0
 1003 040e 0220     		movs	r0, #2
 1004 0410 FFF7FEFF 		bl	delay_milli
 172:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** }
 1005              		.loc 1 172 0
 1006 0414 C046     		nop
 1007 0416 BD46     		mov	sp, r7
 1008 0418 02B0     		add	sp, sp, #8
 1009              		@ sp needed
 1010 041a 80BD     		pop	{r7, pc}
 1011              		.cfi_endproc
 1012              	.LFE15:
 1014              		.align	1
 1015              		.global	main
 1016              		.syntax unified
 1017              		.code	16
 1018              		.thumb_func
 1019              		.fpu softvfp
 1021              	main:
 1022              	.LFB16:
 173:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 
 174:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** void main(void) {
 1023              		.loc 1 174 0
 1024              		.cfi_startproc
 1025              		@ args = 0, pretend = 0, frame = 0
 1026              		@ frame_needed = 1, uses_anonymous_args = 0
 1027 041c 80B5     		push	{r7, lr}
 1028              		.cfi_def_cfa_offset 8
 1029              		.cfi_offset 7, -8
 1030              		.cfi_offset 14, -4
 1031 041e 00AF     		add	r7, sp, #0
 1032              		.cfi_def_cfa_register 7
 175:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	init_app();
 1033              		.loc 1 175 0
 1034 0420 FFF7FEFF 		bl	init_app
 176:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c ****     ascii_init();
 1035              		.loc 1 176 0
 1036 0424 FFF7FEFF 		bl	ascii_init
 177:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	ascii_write_char('a');
 1037              		.loc 1 177 0
 1038 0428 6120     		movs	r0, #97
 1039 042a FFF7FEFF 		bl	ascii_write_char
 178:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	ascii_write_char('a');
 1040              		.loc 1 178 0
 1041 042e 6120     		movs	r0, #97
 1042 0430 FFF7FEFF 		bl	ascii_write_char
 179:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	ascii_write_char('a');
 1043              		.loc 1 179 0
 1044 0434 6120     		movs	r0, #97
 1045 0436 FFF7FEFF 		bl	ascii_write_char
 180:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	ascii_write_char('a');
 1046              		.loc 1 180 0
 1047 043a 6120     		movs	r0, #97
 1048 043c FFF7FEFF 		bl	ascii_write_char
 181:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	ascii_write_char('a');
 1049              		.loc 1 181 0
 1050 0440 6120     		movs	r0, #97
 1051 0442 FFF7FEFF 		bl	ascii_write_char
 182:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	ascii_write_char('a');
 1052              		.loc 1 182 0
 1053 0446 6120     		movs	r0, #97
 1054 0448 FFF7FEFF 		bl	ascii_write_char
 183:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	ascii_write_char('a');
 1055              		.loc 1 183 0
 1056 044c 6120     		movs	r0, #97
 1057 044e FFF7FEFF 		bl	ascii_write_char
 184:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	ascii_write_char('a');
 1058              		.loc 1 184 0
 1059 0452 6120     		movs	r0, #97
 1060 0454 FFF7FEFF 		bl	ascii_write_char
 185:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	ascii_write_char('a');
 1061              		.loc 1 185 0
 1062 0458 6120     		movs	r0, #97
 1063 045a FFF7FEFF 		bl	ascii_write_char
 186:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	ascii_write_char('a');
 1064              		.loc 1 186 0
 1065 045e 6120     		movs	r0, #97
 1066 0460 FFF7FEFF 		bl	ascii_write_char
 187:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	ascii_write_char('a');
 1067              		.loc 1 187 0
 1068 0464 6120     		movs	r0, #97
 1069 0466 FFF7FEFF 		bl	ascii_write_char
 188:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** 	ascii_write_char('a');
 1070              		.loc 1 188 0
 1071 046a 6120     		movs	r0, #97
 1072 046c FFF7FEFF 		bl	ascii_write_char
 189:C:/Users/Hampus/Desktop/DAT017/CodeLite/asciidisplay\startup.c **** }
 1073              		.loc 1 189 0
 1074 0470 C046     		nop
 1075 0472 BD46     		mov	sp, r7
 1076              		@ sp needed
 1077 0474 80BD     		pop	{r7, pc}
 1078              		.cfi_endproc
 1079              	.LFE16:
 1081              	.Letext0:
