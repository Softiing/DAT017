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
  25              		.file 1 "C:/Users/Hampus/Desktop/DAT017/CodeLite/delay/startup.c"
   1:C:/Users/Hampus/Desktop/DAT017/CodeLite/delay\startup.c **** #define STK 0xE000E010
   2:C:/Users/Hampus/Desktop/DAT017/CodeLite/delay\startup.c **** #define STK_CTRL ((volatile unsigned int *) (STK))
   3:C:/Users/Hampus/Desktop/DAT017/CodeLite/delay\startup.c **** #define STK_LOAD ((volatile unsigned int *) (STK + 0x4))
   4:C:/Users/Hampus/Desktop/DAT017/CodeLite/delay\startup.c **** #define STK_VAL ((volatile unsigned int *) (STK + 0x8))
   5:C:/Users/Hampus/Desktop/DAT017/CodeLite/delay\startup.c **** 
   6:C:/Users/Hampus/Desktop/DAT017/CodeLite/delay\startup.c **** #define GPIO_E 0x40021000
   7:C:/Users/Hampus/Desktop/DAT017/CodeLite/delay\startup.c **** #define GPIO_MODER ((volatile unsigned int *) (GPIO_E))
   8:C:/Users/Hampus/Desktop/DAT017/CodeLite/delay\startup.c **** #define GPIO_OTYPER ((volatile unsigned short *) (GPIO_E+0x4))
   9:C:/Users/Hampus/Desktop/DAT017/CodeLite/delay\startup.c **** #define GPIO_PUPDR ((volatile unsigned int *) (GPIO_E+0xC))
  10:C:/Users/Hampus/Desktop/DAT017/CodeLite/delay\startup.c **** #define GPIO_IDR_LOW ((volatile unsigned char *) (GPIO_E+0x10))
  11:C:/Users/Hampus/Desktop/DAT017/CodeLite/delay\startup.c **** #define GPIO_IDR_HIGH ((volatile unsigned char *) (GPIO_E+0x11))
  12:C:/Users/Hampus/Desktop/DAT017/CodeLite/delay\startup.c **** #define GPIO_ODR_LOW ((volatile unsigned char *) (GPIO_E+0x14))
  13:C:/Users/Hampus/Desktop/DAT017/CodeLite/delay\startup.c **** #define GPIO_ODR_HIGH ((volatile unsigned char *) (GPIO_E+0x15))
  14:C:/Users/Hampus/Desktop/DAT017/CodeLite/delay\startup.c **** 
  15:C:/Users/Hampus/Desktop/DAT017/CodeLite/delay\startup.c **** /*
  16:C:/Users/Hampus/Desktop/DAT017/CodeLite/delay\startup.c ****  * 	startup.c
  17:C:/Users/Hampus/Desktop/DAT017/CodeLite/delay\startup.c ****  *
  18:C:/Users/Hampus/Desktop/DAT017/CodeLite/delay\startup.c ****  */
  19:C:/Users/Hampus/Desktop/DAT017/CodeLite/delay\startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
  20:C:/Users/Hampus/Desktop/DAT017/CodeLite/delay\startup.c **** 
  21:C:/Users/Hampus/Desktop/DAT017/CodeLite/delay\startup.c **** void startup ( void ) {
  26              		.loc 1 21 0
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
  22:C:/Users/Hampus/Desktop/DAT017/CodeLite/delay\startup.c **** __asm volatile(
  31              		.loc 1 22 0
  32              		.syntax divided
  33              	@ 22 "C:/Users/Hampus/Desktop/DAT017/CodeLite/delay/startup.c" 1
  34 0000 0248     		 LDR R0,=0x2001C000
  35 0002 8546     	 MOV SP,R0
  36 0004 FFF7FEFF 	 BL main
  37 0008 FEE7     	_exit: B .
  38              	
  39              	@ 0 "" 2
  23:C:/Users/Hampus/Desktop/DAT017/CodeLite/delay\startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  24:C:/Users/Hampus/Desktop/DAT017/CodeLite/delay\startup.c **** 	" MOV SP,R0\n"
  25:C:/Users/Hampus/Desktop/DAT017/CodeLite/delay\startup.c **** 	" BL main\n"				/* call main */
  26:C:/Users/Hampus/Desktop/DAT017/CodeLite/delay\startup.c **** 	"_exit: B .\n"				/* never return */
  27:C:/Users/Hampus/Desktop/DAT017/CodeLite/delay\startup.c **** 	) ;
  28:C:/Users/Hampus/Desktop/DAT017/CodeLite/delay\startup.c **** }
  40              		.loc 1 28 0
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
  29:C:/Users/Hampus/Desktop/DAT017/CodeLite/delay\startup.c **** 
  30:C:/Users/Hampus/Desktop/DAT017/CodeLite/delay\startup.c **** void init_app(void) {
  57              		.loc 1 30 0
  58              		.cfi_startproc
  59              		@ args = 0, pretend = 0, frame = 0
  60              		@ frame_needed = 1, uses_anonymous_args = 0
  61 0000 80B5     		push	{r7, lr}
  62              		.cfi_def_cfa_offset 8
  63              		.cfi_offset 7, -8
  64              		.cfi_offset 14, -4
  65 0002 00AF     		add	r7, sp, #0
  66              		.cfi_def_cfa_register 7
  31:C:/Users/Hampus/Desktop/DAT017/CodeLite/delay\startup.c **** 	// Setup output pins for barograph
  32:C:/Users/Hampus/Desktop/DAT017/CodeLite/delay\startup.c **** 	*GPIO_MODER &= 0xFFFF0000;
  67              		.loc 1 32 0
  68 0004 154B     		ldr	r3, .L3
  69 0006 154A     		ldr	r2, .L3
  70 0008 1268     		ldr	r2, [r2]
  71 000a 120C     		lsrs	r2, r2, #16
  72 000c 1204     		lsls	r2, r2, #16
  73 000e 1A60     		str	r2, [r3]
  33:C:/Users/Hampus/Desktop/DAT017/CodeLite/delay\startup.c **** 	*GPIO_MODER |= 0x00005555;
  74              		.loc 1 33 0
  75 0010 124B     		ldr	r3, .L3
  76 0012 124A     		ldr	r2, .L3
  77 0014 1268     		ldr	r2, [r2]
  78 0016 1249     		ldr	r1, .L3+4
  79 0018 0A43     		orrs	r2, r1
  80 001a 1A60     		str	r2, [r3]
  34:C:/Users/Hampus/Desktop/DAT017/CodeLite/delay\startup.c **** 	
  35:C:/Users/Hampus/Desktop/DAT017/CodeLite/delay\startup.c **** 	*GPIO_OTYPER &= 0xFF00;
  81              		.loc 1 35 0
  82 001c 114A     		ldr	r2, .L3+8
  83 001e 114B     		ldr	r3, .L3+8
  84 0020 1B88     		ldrh	r3, [r3]
  85 0022 9BB2     		uxth	r3, r3
  86 0024 FF21     		movs	r1, #255
  87 0026 8B43     		bics	r3, r1
  88 0028 9BB2     		uxth	r3, r3
  89 002a 1380     		strh	r3, [r2]
  36:C:/Users/Hampus/Desktop/DAT017/CodeLite/delay\startup.c **** 	*GPIO_OTYPER |= 0x0077;
  90              		.loc 1 36 0
  91 002c 0D4A     		ldr	r2, .L3+8
  92 002e 0D4B     		ldr	r3, .L3+8
  93 0030 1B88     		ldrh	r3, [r3]
  94 0032 9BB2     		uxth	r3, r3
  95 0034 7721     		movs	r1, #119
  96 0036 0B43     		orrs	r3, r1
  97 0038 9BB2     		uxth	r3, r3
  98 003a 1380     		strh	r3, [r2]
  37:C:/Users/Hampus/Desktop/DAT017/CodeLite/delay\startup.c **** 	
  38:C:/Users/Hampus/Desktop/DAT017/CodeLite/delay\startup.c **** 	*GPIO_PUPDR &= 0xFFFF0000;
  99              		.loc 1 38 0
 100 003c 0A4B     		ldr	r3, .L3+12
 101 003e 0A4A     		ldr	r2, .L3+12
 102 0040 1268     		ldr	r2, [r2]
 103 0042 120C     		lsrs	r2, r2, #16
 104 0044 1204     		lsls	r2, r2, #16
 105 0046 1A60     		str	r2, [r3]
  39:C:/Users/Hampus/Desktop/DAT017/CodeLite/delay\startup.c **** 	*GPIO_PUPDR |= 0x0000AAAA;
 106              		.loc 1 39 0
 107 0048 074B     		ldr	r3, .L3+12
 108 004a 074A     		ldr	r2, .L3+12
 109 004c 1268     		ldr	r2, [r2]
 110 004e 0749     		ldr	r1, .L3+16
 111 0050 0A43     		orrs	r2, r1
 112 0052 1A60     		str	r2, [r3]
  40:C:/Users/Hampus/Desktop/DAT017/CodeLite/delay\startup.c **** }
 113              		.loc 1 40 0
 114 0054 C046     		nop
 115 0056 BD46     		mov	sp, r7
 116              		@ sp needed
 117 0058 80BD     		pop	{r7, pc}
 118              	.L4:
 119 005a C046     		.align	2
 120              	.L3:
 121 005c 00100240 		.word	1073876992
 122 0060 55550000 		.word	21845
 123 0064 04100240 		.word	1073876996
 124 0068 0C100240 		.word	1073877004
 125 006c AAAA0000 		.word	43690
 126              		.cfi_endproc
 127              	.LFE1:
 129              		.align	1
 130              		.global	delay_250ns
 131              		.syntax unified
 132              		.code	16
 133              		.thumb_func
 134              		.fpu softvfp
 136              	delay_250ns:
 137              	.LFB2:
  41:C:/Users/Hampus/Desktop/DAT017/CodeLite/delay\startup.c **** 
  42:C:/Users/Hampus/Desktop/DAT017/CodeLite/delay\startup.c **** void delay_250ns(void) {
 138              		.loc 1 42 0
 139              		.cfi_startproc
 140              		@ args = 0, pretend = 0, frame = 0
 141              		@ frame_needed = 1, uses_anonymous_args = 0
 142 0070 80B5     		push	{r7, lr}
 143              		.cfi_def_cfa_offset 8
 144              		.cfi_offset 7, -8
 145              		.cfi_offset 14, -4
 146 0072 00AF     		add	r7, sp, #0
 147              		.cfi_def_cfa_register 7
  43:C:/Users/Hampus/Desktop/DAT017/CodeLite/delay\startup.c **** 	*STK_CTRL = 0;
 148              		.loc 1 43 0
 149 0074 0C4B     		ldr	r3, .L7
 150 0076 0022     		movs	r2, #0
 151 0078 1A60     		str	r2, [r3]
  44:C:/Users/Hampus/Desktop/DAT017/CodeLite/delay\startup.c **** 	*STK_VAL = 0;
 152              		.loc 1 44 0
 153 007a 0C4B     		ldr	r3, .L7+4
 154 007c 0022     		movs	r2, #0
 155 007e 1A60     		str	r2, [r3]
  45:C:/Users/Hampus/Desktop/DAT017/CodeLite/delay\startup.c **** 	*STK_LOAD = 49; //  48 + 1. Have to add one as said in manual
 156              		.loc 1 45 0
 157 0080 0B4B     		ldr	r3, .L7+8
 158 0082 3122     		movs	r2, #49
 159 0084 1A60     		str	r2, [r3]
  46:C:/Users/Hampus/Desktop/DAT017/CodeLite/delay\startup.c **** 	*STK_CTRL = 0x1;
 160              		.loc 1 46 0
 161 0086 084B     		ldr	r3, .L7
 162 0088 0122     		movs	r2, #1
 163 008a 1A60     		str	r2, [r3]
  47:C:/Users/Hampus/Desktop/DAT017/CodeLite/delay\startup.c **** 	while((*STK_CTRL & 0x10000) == 0) {
 164              		.loc 1 47 0
 165 008c C046     		nop
 166              	.L6:
 167              		.loc 1 47 0 is_stmt 0 discriminator 1
 168 008e 064B     		ldr	r3, .L7
 169 0090 1A68     		ldr	r2, [r3]
 170 0092 8023     		movs	r3, #128
 171 0094 5B02     		lsls	r3, r3, #9
 172 0096 1340     		ands	r3, r2
 173 0098 F9D0     		beq	.L6
  48:C:/Users/Hampus/Desktop/DAT017/CodeLite/delay\startup.c **** 		// Do nothing :S
  49:C:/Users/Hampus/Desktop/DAT017/CodeLite/delay\startup.c **** 	}
  50:C:/Users/Hampus/Desktop/DAT017/CodeLite/delay\startup.c **** 	*STK_CTRL = 0;
 174              		.loc 1 50 0 is_stmt 1
 175 009a 034B     		ldr	r3, .L7
 176 009c 0022     		movs	r2, #0
 177 009e 1A60     		str	r2, [r3]
  51:C:/Users/Hampus/Desktop/DAT017/CodeLite/delay\startup.c **** }
 178              		.loc 1 51 0
 179 00a0 C046     		nop
 180 00a2 BD46     		mov	sp, r7
 181              		@ sp needed
 182 00a4 80BD     		pop	{r7, pc}
 183              	.L8:
 184 00a6 C046     		.align	2
 185              	.L7:
 186 00a8 10E000E0 		.word	-536813552
 187 00ac 18E000E0 		.word	-536813544
 188 00b0 14E000E0 		.word	-536813548
 189              		.cfi_endproc
 190              	.LFE2:
 192              		.align	1
 193              		.global	delay_mikro
 194              		.syntax unified
 195              		.code	16
 196              		.thumb_func
 197              		.fpu softvfp
 199              	delay_mikro:
 200              	.LFB3:
  52:C:/Users/Hampus/Desktop/DAT017/CodeLite/delay\startup.c **** 
  53:C:/Users/Hampus/Desktop/DAT017/CodeLite/delay\startup.c **** void delay_mikro(unsigned int us) {
 201              		.loc 1 53 0
 202              		.cfi_startproc
 203              		@ args = 0, pretend = 0, frame = 16
 204              		@ frame_needed = 1, uses_anonymous_args = 0
 205 00b4 80B5     		push	{r7, lr}
 206              		.cfi_def_cfa_offset 8
 207              		.cfi_offset 7, -8
 208              		.cfi_offset 14, -4
 209 00b6 84B0     		sub	sp, sp, #16
 210              		.cfi_def_cfa_offset 24
 211 00b8 00AF     		add	r7, sp, #0
 212              		.cfi_def_cfa_register 7
 213 00ba 7860     		str	r0, [r7, #4]
 214              	.LBB2:
  54:C:/Users/Hampus/Desktop/DAT017/CodeLite/delay\startup.c **** 	for(unsigned int i = 0; i < us; i++) {
 215              		.loc 1 54 0
 216 00bc 0023     		movs	r3, #0
 217 00be FB60     		str	r3, [r7, #12]
 218 00c0 02E0     		b	.L10
 219              	.L11:
 220              		.loc 1 54 0 is_stmt 0 discriminator 3
 221 00c2 FB68     		ldr	r3, [r7, #12]
 222 00c4 0133     		adds	r3, r3, #1
 223 00c6 FB60     		str	r3, [r7, #12]
 224              	.L10:
 225              		.loc 1 54 0 discriminator 1
 226 00c8 FA68     		ldr	r2, [r7, #12]
 227 00ca 7B68     		ldr	r3, [r7, #4]
 228 00cc 9A42     		cmp	r2, r3
 229 00ce F8D3     		bcc	.L11
 230              	.LBE2:
  55:C:/Users/Hampus/Desktop/DAT017/CodeLite/delay\startup.c **** 		delay_250ns;
  56:C:/Users/Hampus/Desktop/DAT017/CodeLite/delay\startup.c **** 		delay_250ns;
  57:C:/Users/Hampus/Desktop/DAT017/CodeLite/delay\startup.c **** 		delay_250ns;
  58:C:/Users/Hampus/Desktop/DAT017/CodeLite/delay\startup.c **** 		delay_250ns;
  59:C:/Users/Hampus/Desktop/DAT017/CodeLite/delay\startup.c **** 	}
  60:C:/Users/Hampus/Desktop/DAT017/CodeLite/delay\startup.c **** }
 231              		.loc 1 60 0 is_stmt 1
 232 00d0 C046     		nop
 233 00d2 BD46     		mov	sp, r7
 234 00d4 04B0     		add	sp, sp, #16
 235              		@ sp needed
 236 00d6 80BD     		pop	{r7, pc}
 237              		.cfi_endproc
 238              	.LFE3:
 240              		.global	__aeabi_uidiv
 241              		.align	1
 242              		.global	delay_milli
 243              		.syntax unified
 244              		.code	16
 245              		.thumb_func
 246              		.fpu softvfp
 248              	delay_milli:
 249              	.LFB4:
  61:C:/Users/Hampus/Desktop/DAT017/CodeLite/delay\startup.c **** 
  62:C:/Users/Hampus/Desktop/DAT017/CodeLite/delay\startup.c **** void delay_milli(unsigned int ms) {
 250              		.loc 1 62 0
 251              		.cfi_startproc
 252              		@ args = 0, pretend = 0, frame = 8
 253              		@ frame_needed = 1, uses_anonymous_args = 0
 254 00d8 80B5     		push	{r7, lr}
 255              		.cfi_def_cfa_offset 8
 256              		.cfi_offset 7, -8
 257              		.cfi_offset 14, -4
 258 00da 82B0     		sub	sp, sp, #8
 259              		.cfi_def_cfa_offset 16
 260 00dc 00AF     		add	r7, sp, #0
 261              		.cfi_def_cfa_register 7
 262 00de 7860     		str	r0, [r7, #4]
  63:C:/Users/Hampus/Desktop/DAT017/CodeLite/delay\startup.c **** 	#ifdef SIMULATOR
  64:C:/Users/Hampus/Desktop/DAT017/CodeLite/delay\startup.c **** 		ms = ms / 1000;
 263              		.loc 1 64 0
 264 00e0 7A68     		ldr	r2, [r7, #4]
 265 00e2 FA23     		movs	r3, #250
 266 00e4 9900     		lsls	r1, r3, #2
 267 00e6 1000     		movs	r0, r2
 268 00e8 FFF7FEFF 		bl	__aeabi_uidiv
 269              	.LVL0:
 270 00ec 0300     		movs	r3, r0
 271 00ee 7B60     		str	r3, [r7, #4]
  65:C:/Users/Hampus/Desktop/DAT017/CodeLite/delay\startup.c **** 		ms++;
 272              		.loc 1 65 0
 273 00f0 7B68     		ldr	r3, [r7, #4]
 274 00f2 0133     		adds	r3, r3, #1
 275 00f4 7B60     		str	r3, [r7, #4]
  66:C:/Users/Hampus/Desktop/DAT017/CodeLite/delay\startup.c **** 	#endif
  67:C:/Users/Hampus/Desktop/DAT017/CodeLite/delay\startup.c **** 	
  68:C:/Users/Hampus/Desktop/DAT017/CodeLite/delay\startup.c **** 	delay_mikro(1000 * ms);	
 276              		.loc 1 68 0
 277 00f6 7B68     		ldr	r3, [r7, #4]
 278 00f8 FA22     		movs	r2, #250
 279 00fa 9200     		lsls	r2, r2, #2
 280 00fc 5343     		muls	r3, r2
 281 00fe 1800     		movs	r0, r3
 282 0100 FFF7FEFF 		bl	delay_mikro
  69:C:/Users/Hampus/Desktop/DAT017/CodeLite/delay\startup.c **** }
 283              		.loc 1 69 0
 284 0104 C046     		nop
 285 0106 BD46     		mov	sp, r7
 286 0108 02B0     		add	sp, sp, #8
 287              		@ sp needed
 288 010a 80BD     		pop	{r7, pc}
 289              		.cfi_endproc
 290              	.LFE4:
 292              		.align	1
 293              		.global	main
 294              		.syntax unified
 295              		.code	16
 296              		.thumb_func
 297              		.fpu softvfp
 299              	main:
 300              	.LFB5:
  70:C:/Users/Hampus/Desktop/DAT017/CodeLite/delay\startup.c **** 
  71:C:/Users/Hampus/Desktop/DAT017/CodeLite/delay\startup.c **** void main(void) {
 301              		.loc 1 71 0
 302              		.cfi_startproc
 303              		@ args = 0, pretend = 0, frame = 0
 304              		@ frame_needed = 1, uses_anonymous_args = 0
 305 010c 80B5     		push	{r7, lr}
 306              		.cfi_def_cfa_offset 8
 307              		.cfi_offset 7, -8
 308              		.cfi_offset 14, -4
 309 010e 00AF     		add	r7, sp, #0
 310              		.cfi_def_cfa_register 7
  72:C:/Users/Hampus/Desktop/DAT017/CodeLite/delay\startup.c **** 	init_app();
 311              		.loc 1 72 0
 312 0110 FFF7FEFF 		bl	init_app
 313              	.L14:
  73:C:/Users/Hampus/Desktop/DAT017/CodeLite/delay\startup.c **** 	while(1) {
  74:C:/Users/Hampus/Desktop/DAT017/CodeLite/delay\startup.c **** 		*GPIO_ODR_LOW = 0;
 314              		.loc 1 74 0 discriminator 1
 315 0114 084B     		ldr	r3, .L15
 316 0116 0022     		movs	r2, #0
 317 0118 1A70     		strb	r2, [r3]
  75:C:/Users/Hampus/Desktop/DAT017/CodeLite/delay\startup.c **** 		delay_milli(500);
 318              		.loc 1 75 0 discriminator 1
 319 011a FA23     		movs	r3, #250
 320 011c 5B00     		lsls	r3, r3, #1
 321 011e 1800     		movs	r0, r3
 322 0120 FFF7FEFF 		bl	delay_milli
  76:C:/Users/Hampus/Desktop/DAT017/CodeLite/delay\startup.c **** 		*GPIO_ODR_LOW = 0xFF;
 323              		.loc 1 76 0 discriminator 1
 324 0124 044B     		ldr	r3, .L15
 325 0126 FF22     		movs	r2, #255
 326 0128 1A70     		strb	r2, [r3]
  77:C:/Users/Hampus/Desktop/DAT017/CodeLite/delay\startup.c **** 		delay_milli(500);
 327              		.loc 1 77 0 discriminator 1
 328 012a FA23     		movs	r3, #250
 329 012c 5B00     		lsls	r3, r3, #1
 330 012e 1800     		movs	r0, r3
 331 0130 FFF7FEFF 		bl	delay_milli
  74:C:/Users/Hampus/Desktop/DAT017/CodeLite/delay\startup.c **** 		delay_milli(500);
 332              		.loc 1 74 0 discriminator 1
 333 0134 EEE7     		b	.L14
 334              	.L16:
 335 0136 C046     		.align	2
 336              	.L15:
 337 0138 14100240 		.word	1073877012
 338              		.cfi_endproc
 339              	.LFE5:
 341              	.Letext0:
