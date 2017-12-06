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
  15              		.global	systick_flag
  16              		.bss
  19              	systick_flag:
  20 0000 00       		.space	1
  21              		.section	.start_section,"ax",%progbits
  22              		.align	1
  23              		.global	startup
  24              		.syntax unified
  25              		.code	16
  26              		.thumb_func
  27              		.fpu softvfp
  29              	startup:
  30              	.LFB0:
  31              		.file 1 "C:/Users/Hampus/Desktop/DAT017/CodeLite/6_2/startup.c"
   1:C:/Users/Hampus/Desktop/DAT017/CodeLite/6_2\startup.c **** #define STK 0xE000E010
   2:C:/Users/Hampus/Desktop/DAT017/CodeLite/6_2\startup.c **** #define STK_CTRL ((volatile unsigned int *) (STK))
   3:C:/Users/Hampus/Desktop/DAT017/CodeLite/6_2\startup.c **** #define STK_LOAD ((volatile unsigned int *) (STK + 0x4))
   4:C:/Users/Hampus/Desktop/DAT017/CodeLite/6_2\startup.c **** #define STK_VAL ((volatile unsigned int *) (STK + 0x8))
   5:C:/Users/Hampus/Desktop/DAT017/CodeLite/6_2\startup.c **** 
   6:C:/Users/Hampus/Desktop/DAT017/CodeLite/6_2\startup.c **** #define GPIO_E 0x40021000
   7:C:/Users/Hampus/Desktop/DAT017/CodeLite/6_2\startup.c **** #define GPIO_MODER ((volatile unsigned int *) (GPIO_E))
   8:C:/Users/Hampus/Desktop/DAT017/CodeLite/6_2\startup.c **** #define GPIO_OTYPER ((volatile unsigned short *) (GPIO_E+0x4))
   9:C:/Users/Hampus/Desktop/DAT017/CodeLite/6_2\startup.c **** #define GPIO_PUPDR ((volatile unsigned int *) (GPIO_E+0xC))
  10:C:/Users/Hampus/Desktop/DAT017/CodeLite/6_2\startup.c **** #define GPIO_IDR_LOW ((volatile unsigned char *) (GPIO_E+0x10))
  11:C:/Users/Hampus/Desktop/DAT017/CodeLite/6_2\startup.c **** #define GPIO_IDR_HIGH ((volatile unsigned char *) (GPIO_E+0x11))
  12:C:/Users/Hampus/Desktop/DAT017/CodeLite/6_2\startup.c **** #define GPIO_ODR_LOW ((volatile unsigned char *) (GPIO_E+0x14))
  13:C:/Users/Hampus/Desktop/DAT017/CodeLite/6_2\startup.c **** #define GPIO_ODR_HIGH ((volatile unsigned char *) (GPIO_E+0x15))
  14:C:/Users/Hampus/Desktop/DAT017/CodeLite/6_2\startup.c **** 
  15:C:/Users/Hampus/Desktop/DAT017/CodeLite/6_2\startup.c **** #ifdef SIMULATOR
  16:C:/Users/Hampus/Desktop/DAT017/CodeLite/6_2\startup.c **** #define DELAY_COUNT 100
  17:C:/Users/Hampus/Desktop/DAT017/CodeLite/6_2\startup.c **** #else
  18:C:/Users/Hampus/Desktop/DAT017/CodeLite/6_2\startup.c **** #define DELAY_COUNT 1000000
  19:C:/Users/Hampus/Desktop/DAT017/CodeLite/6_2\startup.c **** #endif
  20:C:/Users/Hampus/Desktop/DAT017/CodeLite/6_2\startup.c **** 
  21:C:/Users/Hampus/Desktop/DAT017/CodeLite/6_2\startup.c **** volatile char systick_flag = 0;
  22:C:/Users/Hampus/Desktop/DAT017/CodeLite/6_2\startup.c **** 
  23:C:/Users/Hampus/Desktop/DAT017/CodeLite/6_2\startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
  24:C:/Users/Hampus/Desktop/DAT017/CodeLite/6_2\startup.c **** 
  25:C:/Users/Hampus/Desktop/DAT017/CodeLite/6_2\startup.c **** void startup ( void )
  26:C:/Users/Hampus/Desktop/DAT017/CodeLite/6_2\startup.c **** {
  32              		.loc 1 26 0
  33              		.cfi_startproc
  34              		@ Naked Function: prologue and epilogue provided by programmer.
  35              		@ args = 0, pretend = 0, frame = 0
  36              		@ frame_needed = 1, uses_anonymous_args = 0
  27:C:/Users/Hampus/Desktop/DAT017/CodeLite/6_2\startup.c **** __asm volatile(
  37              		.loc 1 27 0
  38              		.syntax divided
  39              	@ 27 "C:/Users/Hampus/Desktop/DAT017/CodeLite/6_2/startup.c" 1
  40 0000 0248     		 LDR R0,=0x2001C000
  41 0002 8546     	 MOV SP,R0
  42 0004 FFF7FEFF 	 BL main
  43 0008 FEE7     	_exit: B .
  44              	
  45              	@ 0 "" 2
  28:C:/Users/Hampus/Desktop/DAT017/CodeLite/6_2\startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  29:C:/Users/Hampus/Desktop/DAT017/CodeLite/6_2\startup.c **** 	" MOV SP,R0\n"
  30:C:/Users/Hampus/Desktop/DAT017/CodeLite/6_2\startup.c **** 	" BL main\n"				/* call main */
  31:C:/Users/Hampus/Desktop/DAT017/CodeLite/6_2\startup.c **** 	"_exit: B .\n"				/* never return */
  32:C:/Users/Hampus/Desktop/DAT017/CodeLite/6_2\startup.c **** 	) ;
  33:C:/Users/Hampus/Desktop/DAT017/CodeLite/6_2\startup.c **** }
  46              		.loc 1 33 0
  47              		.thumb
  48              		.syntax unified
  49 000a C046     		nop
  50              		.cfi_endproc
  51              	.LFE0:
  53              		.text
  54              		.align	1
  55              		.global	systick_irq_handler
  56              		.syntax unified
  57              		.code	16
  58              		.thumb_func
  59              		.fpu softvfp
  61              	systick_irq_handler:
  62              	.LFB1:
  34:C:/Users/Hampus/Desktop/DAT017/CodeLite/6_2\startup.c **** 
  35:C:/Users/Hampus/Desktop/DAT017/CodeLite/6_2\startup.c **** void systick_irq_handler(void) {
  63              		.loc 1 35 0
  64              		.cfi_startproc
  65              		@ args = 0, pretend = 0, frame = 0
  66              		@ frame_needed = 1, uses_anonymous_args = 0
  67 0000 80B5     		push	{r7, lr}
  68              		.cfi_def_cfa_offset 8
  69              		.cfi_offset 7, -8
  70              		.cfi_offset 14, -4
  71 0002 00AF     		add	r7, sp, #0
  72              		.cfi_def_cfa_register 7
  36:C:/Users/Hampus/Desktop/DAT017/CodeLite/6_2\startup.c **** 	systick_flag = 1;
  73              		.loc 1 36 0
  74 0004 024B     		ldr	r3, .L3
  75 0006 0122     		movs	r2, #1
  76 0008 1A70     		strb	r2, [r3]
  37:C:/Users/Hampus/Desktop/DAT017/CodeLite/6_2\startup.c **** }
  77              		.loc 1 37 0
  78 000a C046     		nop
  79 000c BD46     		mov	sp, r7
  80              		@ sp needed
  81 000e 80BD     		pop	{r7, pc}
  82              	.L4:
  83              		.align	2
  84              	.L3:
  85 0010 00000000 		.word	systick_flag
  86              		.cfi_endproc
  87              	.LFE1:
  89              		.align	1
  90              		.global	init_app
  91              		.syntax unified
  92              		.code	16
  93              		.thumb_func
  94              		.fpu softvfp
  96              	init_app:
  97              	.LFB2:
  38:C:/Users/Hampus/Desktop/DAT017/CodeLite/6_2\startup.c **** 
  39:C:/Users/Hampus/Desktop/DAT017/CodeLite/6_2\startup.c **** void init_app(void) {
  98              		.loc 1 39 0
  99              		.cfi_startproc
 100              		@ args = 0, pretend = 0, frame = 0
 101              		@ frame_needed = 1, uses_anonymous_args = 0
 102 0014 80B5     		push	{r7, lr}
 103              		.cfi_def_cfa_offset 8
 104              		.cfi_offset 7, -8
 105              		.cfi_offset 14, -4
 106 0016 00AF     		add	r7, sp, #0
 107              		.cfi_def_cfa_register 7
  40:C:/Users/Hampus/Desktop/DAT017/CodeLite/6_2\startup.c **** 	*GPIO_MODER &= 0xFFFF0000;
 108              		.loc 1 40 0
 109 0018 084B     		ldr	r3, .L6
 110 001a 084A     		ldr	r2, .L6
 111 001c 1268     		ldr	r2, [r2]
 112 001e 120C     		lsrs	r2, r2, #16
 113 0020 1204     		lsls	r2, r2, #16
 114 0022 1A60     		str	r2, [r3]
  41:C:/Users/Hampus/Desktop/DAT017/CodeLite/6_2\startup.c **** 	*GPIO_MODER |= 0x00005555;
 115              		.loc 1 41 0
 116 0024 054B     		ldr	r3, .L6
 117 0026 054A     		ldr	r2, .L6
 118 0028 1268     		ldr	r2, [r2]
 119 002a 0549     		ldr	r1, .L6+4
 120 002c 0A43     		orrs	r2, r1
 121 002e 1A60     		str	r2, [r3]
  42:C:/Users/Hampus/Desktop/DAT017/CodeLite/6_2\startup.c **** 	*((void(**)(void)) 0x2001C03C ) = systick_irq_handler;
 122              		.loc 1 42 0
 123 0030 044B     		ldr	r3, .L6+8
 124 0032 054A     		ldr	r2, .L6+12
 125 0034 1A60     		str	r2, [r3]
  43:C:/Users/Hampus/Desktop/DAT017/CodeLite/6_2\startup.c **** }
 126              		.loc 1 43 0
 127 0036 C046     		nop
 128 0038 BD46     		mov	sp, r7
 129              		@ sp needed
 130 003a 80BD     		pop	{r7, pc}
 131              	.L7:
 132              		.align	2
 133              	.L6:
 134 003c 00100240 		.word	1073876992
 135 0040 55550000 		.word	21845
 136 0044 3CC00120 		.word	536985660
 137 0048 00000000 		.word	systick_irq_handler
 138              		.cfi_endproc
 139              	.LFE2:
 141              		.align	1
 142              		.global	delay_1micro
 143              		.syntax unified
 144              		.code	16
 145              		.thumb_func
 146              		.fpu softvfp
 148              	delay_1micro:
 149              	.LFB3:
  44:C:/Users/Hampus/Desktop/DAT017/CodeLite/6_2\startup.c **** 
  45:C:/Users/Hampus/Desktop/DAT017/CodeLite/6_2\startup.c **** //void delay_250ns(void) {
  46:C:/Users/Hampus/Desktop/DAT017/CodeLite/6_2\startup.c **** //	*STK_CTRL = 0;
  47:C:/Users/Hampus/Desktop/DAT017/CodeLite/6_2\startup.c **** //	*STK_LOAD = 49; //  48 + 1. Have to add one as said in manual
  48:C:/Users/Hampus/Desktop/DAT017/CodeLite/6_2\startup.c **** //	*STK_VAL = 0;
  49:C:/Users/Hampus/Desktop/DAT017/CodeLite/6_2\startup.c **** //	*STK_CTRL = 5;
  50:C:/Users/Hampus/Desktop/DAT017/CodeLite/6_2\startup.c **** ////	while((*STK_CTRL & 0x10000) == 0) {
  51:C:/Users/Hampus/Desktop/DAT017/CodeLite/6_2\startup.c **** ////		// Do nothing :S
  52:C:/Users/Hampus/Desktop/DAT017/CodeLite/6_2\startup.c **** ////	}
  53:C:/Users/Hampus/Desktop/DAT017/CodeLite/6_2\startup.c **** //}
  54:C:/Users/Hampus/Desktop/DAT017/CodeLite/6_2\startup.c **** 
  55:C:/Users/Hampus/Desktop/DAT017/CodeLite/6_2\startup.c **** void delay_1micro() {
 150              		.loc 1 55 0
 151              		.cfi_startproc
 152              		@ args = 0, pretend = 0, frame = 0
 153              		@ frame_needed = 1, uses_anonymous_args = 0
 154 004c 80B5     		push	{r7, lr}
 155              		.cfi_def_cfa_offset 8
 156              		.cfi_offset 7, -8
 157              		.cfi_offset 14, -4
 158 004e 00AF     		add	r7, sp, #0
 159              		.cfi_def_cfa_register 7
  56:C:/Users/Hampus/Desktop/DAT017/CodeLite/6_2\startup.c **** 	systick_flag = 0;
 160              		.loc 1 56 0
 161 0050 084B     		ldr	r3, .L9
 162 0052 0022     		movs	r2, #0
 163 0054 1A70     		strb	r2, [r3]
  57:C:/Users/Hampus/Desktop/DAT017/CodeLite/6_2\startup.c **** 	*STK_CTRL = 0;
 164              		.loc 1 57 0
 165 0056 084B     		ldr	r3, .L9+4
 166 0058 0022     		movs	r2, #0
 167 005a 1A60     		str	r2, [r3]
  58:C:/Users/Hampus/Desktop/DAT017/CodeLite/6_2\startup.c **** 	*STK_LOAD = 192; //  48 * 4. 48 is 250ns
 168              		.loc 1 58 0
 169 005c 074B     		ldr	r3, .L9+8
 170 005e C022     		movs	r2, #192
 171 0060 1A60     		str	r2, [r3]
  59:C:/Users/Hampus/Desktop/DAT017/CodeLite/6_2\startup.c **** 	*STK_VAL = 0;
 172              		.loc 1 59 0
 173 0062 074B     		ldr	r3, .L9+12
 174 0064 0022     		movs	r2, #0
 175 0066 1A60     		str	r2, [r3]
  60:C:/Users/Hampus/Desktop/DAT017/CodeLite/6_2\startup.c **** 	*STK_CTRL = 7; // Enable interrupts by setting bit 1 to 1.
 176              		.loc 1 60 0
 177 0068 034B     		ldr	r3, .L9+4
 178 006a 0722     		movs	r2, #7
 179 006c 1A60     		str	r2, [r3]
  61:C:/Users/Hampus/Desktop/DAT017/CodeLite/6_2\startup.c **** }
 180              		.loc 1 61 0
 181 006e C046     		nop
 182 0070 BD46     		mov	sp, r7
 183              		@ sp needed
 184 0072 80BD     		pop	{r7, pc}
 185              	.L10:
 186              		.align	2
 187              	.L9:
 188 0074 00000000 		.word	systick_flag
 189 0078 10E000E0 		.word	-536813552
 190 007c 14E000E0 		.word	-536813548
 191 0080 18E000E0 		.word	-536813544
 192              		.cfi_endproc
 193              	.LFE3:
 195              		.align	1
 196              		.global	delay
 197              		.syntax unified
 198              		.code	16
 199              		.thumb_func
 200              		.fpu softvfp
 202              	delay:
 203              	.LFB4:
  62:C:/Users/Hampus/Desktop/DAT017/CodeLite/6_2\startup.c **** 
  63:C:/Users/Hampus/Desktop/DAT017/CodeLite/6_2\startup.c **** void delay(unsigned int count) {
 204              		.loc 1 63 0
 205              		.cfi_startproc
 206              		@ args = 0, pretend = 0, frame = 8
 207              		@ frame_needed = 1, uses_anonymous_args = 0
 208 0084 80B5     		push	{r7, lr}
 209              		.cfi_def_cfa_offset 8
 210              		.cfi_offset 7, -8
 211              		.cfi_offset 14, -4
 212 0086 82B0     		sub	sp, sp, #8
 213              		.cfi_def_cfa_offset 16
 214 0088 00AF     		add	r7, sp, #0
 215              		.cfi_def_cfa_register 7
 216 008a 7860     		str	r0, [r7, #4]
  64:C:/Users/Hampus/Desktop/DAT017/CodeLite/6_2\startup.c **** 	systick_flag = 0;
 217              		.loc 1 64 0
 218 008c 0B4B     		ldr	r3, .L12
 219 008e 0022     		movs	r2, #0
 220 0090 1A70     		strb	r2, [r3]
  65:C:/Users/Hampus/Desktop/DAT017/CodeLite/6_2\startup.c **** 	*STK_CTRL = 0;
 221              		.loc 1 65 0
 222 0092 0B4B     		ldr	r3, .L12+4
 223 0094 0022     		movs	r2, #0
 224 0096 1A60     		str	r2, [r3]
  66:C:/Users/Hampus/Desktop/DAT017/CodeLite/6_2\startup.c **** 	*STK_LOAD = 192*count; //  48 * 4. 48 is 250ns
 225              		.loc 1 66 0
 226 0098 0A4A     		ldr	r2, .L12+8
 227 009a 7968     		ldr	r1, [r7, #4]
 228 009c 0B00     		movs	r3, r1
 229 009e 5B00     		lsls	r3, r3, #1
 230 00a0 5B18     		adds	r3, r3, r1
 231 00a2 9B01     		lsls	r3, r3, #6
 232 00a4 1360     		str	r3, [r2]
  67:C:/Users/Hampus/Desktop/DAT017/CodeLite/6_2\startup.c **** 	*STK_VAL = 0;
 233              		.loc 1 67 0
 234 00a6 084B     		ldr	r3, .L12+12
 235 00a8 0022     		movs	r2, #0
 236 00aa 1A60     		str	r2, [r3]
  68:C:/Users/Hampus/Desktop/DAT017/CodeLite/6_2\startup.c **** 	*STK_CTRL = 7; // Enable interrupts by setting bit 1 to 1.
 237              		.loc 1 68 0
 238 00ac 044B     		ldr	r3, .L12+4
 239 00ae 0722     		movs	r2, #7
 240 00b0 1A60     		str	r2, [r3]
  69:C:/Users/Hampus/Desktop/DAT017/CodeLite/6_2\startup.c **** //	for(int i = 0; i < count; i++) {
  70:C:/Users/Hampus/Desktop/DAT017/CodeLite/6_2\startup.c **** //		delay_1micro();
  71:C:/Users/Hampus/Desktop/DAT017/CodeLite/6_2\startup.c **** //		while(!systick_flag) {
  72:C:/Users/Hampus/Desktop/DAT017/CodeLite/6_2\startup.c **** //			//Wait
  73:C:/Users/Hampus/Desktop/DAT017/CodeLite/6_2\startup.c **** //		}
  74:C:/Users/Hampus/Desktop/DAT017/CodeLite/6_2\startup.c **** //	}
  75:C:/Users/Hampus/Desktop/DAT017/CodeLite/6_2\startup.c **** }
 241              		.loc 1 75 0
 242 00b2 C046     		nop
 243 00b4 BD46     		mov	sp, r7
 244 00b6 02B0     		add	sp, sp, #8
 245              		@ sp needed
 246 00b8 80BD     		pop	{r7, pc}
 247              	.L13:
 248 00ba C046     		.align	2
 249              	.L12:
 250 00bc 00000000 		.word	systick_flag
 251 00c0 10E000E0 		.word	-536813552
 252 00c4 14E000E0 		.word	-536813548
 253 00c8 18E000E0 		.word	-536813544
 254              		.cfi_endproc
 255              	.LFE4:
 257              		.align	1
 258              		.global	main
 259              		.syntax unified
 260              		.code	16
 261              		.thumb_func
 262              		.fpu softvfp
 264              	main:
 265              	.LFB5:
  76:C:/Users/Hampus/Desktop/DAT017/CodeLite/6_2\startup.c **** 
  77:C:/Users/Hampus/Desktop/DAT017/CodeLite/6_2\startup.c **** void main(void) {
 266              		.loc 1 77 0
 267              		.cfi_startproc
 268              		@ args = 0, pretend = 0, frame = 0
 269              		@ frame_needed = 1, uses_anonymous_args = 0
 270 00cc 80B5     		push	{r7, lr}
 271              		.cfi_def_cfa_offset 8
 272              		.cfi_offset 7, -8
 273              		.cfi_offset 14, -4
 274 00ce 00AF     		add	r7, sp, #0
 275              		.cfi_def_cfa_register 7
  78:C:/Users/Hampus/Desktop/DAT017/CodeLite/6_2\startup.c **** 	init_app();
 276              		.loc 1 78 0
 277 00d0 FFF7FEFF 		bl	init_app
  79:C:/Users/Hampus/Desktop/DAT017/CodeLite/6_2\startup.c **** 	*GPIO_ODR_LOW = 0;
 278              		.loc 1 79 0
 279 00d4 0B4B     		ldr	r3, .L20
 280 00d6 0022     		movs	r2, #0
 281 00d8 1A70     		strb	r2, [r3]
  80:C:/Users/Hampus/Desktop/DAT017/CodeLite/6_2\startup.c **** 	delay(1000);
 282              		.loc 1 80 0
 283 00da FA23     		movs	r3, #250
 284 00dc 9B00     		lsls	r3, r3, #2
 285 00de 1800     		movs	r0, r3
 286 00e0 FFF7FEFF 		bl	delay
  81:C:/Users/Hampus/Desktop/DAT017/CodeLite/6_2\startup.c **** 	*GPIO_ODR_LOW = 0xFF;
 287              		.loc 1 81 0
 288 00e4 074B     		ldr	r3, .L20
 289 00e6 FF22     		movs	r2, #255
 290 00e8 1A70     		strb	r2, [r3]
 291              	.L17:
  82:C:/Users/Hampus/Desktop/DAT017/CodeLite/6_2\startup.c **** 	while(1) {
  83:C:/Users/Hampus/Desktop/DAT017/CodeLite/6_2\startup.c **** 		if(systick_flag) {
 292              		.loc 1 83 0
 293 00ea 074B     		ldr	r3, .L20+4
 294 00ec 1B78     		ldrb	r3, [r3]
 295 00ee DBB2     		uxtb	r3, r3
 296 00f0 002B     		cmp	r3, #0
 297 00f2 00D1     		bne	.L19
 298 00f4 F9E7     		b	.L17
 299              	.L19:
  84:C:/Users/Hampus/Desktop/DAT017/CodeLite/6_2\startup.c **** 			break;
 300              		.loc 1 84 0
 301 00f6 C046     		nop
  85:C:/Users/Hampus/Desktop/DAT017/CodeLite/6_2\startup.c **** 		}
  86:C:/Users/Hampus/Desktop/DAT017/CodeLite/6_2\startup.c **** 	}
  87:C:/Users/Hampus/Desktop/DAT017/CodeLite/6_2\startup.c **** 	*GPIO_ODR_LOW = 0;
 302              		.loc 1 87 0
 303 00f8 024B     		ldr	r3, .L20
 304 00fa 0022     		movs	r2, #0
 305 00fc 1A70     		strb	r2, [r3]
  88:C:/Users/Hampus/Desktop/DAT017/CodeLite/6_2\startup.c **** }
 306              		.loc 1 88 0
 307 00fe C046     		nop
 308 0100 BD46     		mov	sp, r7
 309              		@ sp needed
 310 0102 80BD     		pop	{r7, pc}
 311              	.L21:
 312              		.align	2
 313              	.L20:
 314 0104 14100240 		.word	1073877012
 315 0108 00000000 		.word	systick_flag
 316              		.cfi_endproc
 317              	.LFE5:
 319              	.Letext0:
