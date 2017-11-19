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
  25              		.file 1 "C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard/startup.c"
   1:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** #define GPIO_D 0x40020C00
   2:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** #define GPIO_MODER ((volatile unsigned int *) (GPIO_D))
   3:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** #define GPIO_OTYPER ((volatile unsigned short *) (GPIO_D+0x4))
   4:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** #define GPIO_PUPDR ((volatile unsigned int *) (GPIO_D+0xC))
   5:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** #define GPIO_IDR_LOW ((volatile unsigned char *) (GPIO_D+0x10))
   6:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** #define GPIO_IDR_HIGH ((volatile unsigned char *) (GPIO_D+0x11))
   7:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** #define GPIO_ODR_LOW ((volatile unsigned char *) (GPIO_D+0x14))
   8:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** #define GPIO_ODR_HIGH ((volatile unsigned char *) (GPIO_D+0x15))
   9:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** /*
  10:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c ****  * 	startup.c
  11:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c ****  *
  12:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c ****  */
  13:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
  14:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 
  15:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** void startup ( void ) {
  26              		.loc 1 15 0
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
  16:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** __asm volatile(
  31              		.loc 1 16 0
  32              		.syntax divided
  33              	@ 16 "C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard/startup.c" 1
  34 0000 0248     		 LDR R0,=0x2001C000
  35 0002 8546     	 MOV SP,R0
  36 0004 FFF7FEFF 	 BL main
  37 0008 FEE7     	_exit: B .
  38              	
  39              	@ 0 "" 2
  17:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  18:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 	" MOV SP,R0\n"
  19:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 	" BL main\n"				/* call main */
  20:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 	"_exit: B .\n"				/* never return */
  21:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 	) ;
  22:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** }
  40              		.loc 1 22 0
  41              		.thumb
  42              		.syntax unified
  43 000a C046     		nop
  44              		.cfi_endproc
  45              	.LFE0:
  47              		.text
  48              		.align	1
  49              		.global	app_init
  50              		.syntax unified
  51              		.code	16
  52              		.thumb_func
  53              		.fpu softvfp
  55              	app_init:
  56              	.LFB1:
  23:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 
  24:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** void app_init(void) {
  57              		.loc 1 24 0
  58              		.cfi_startproc
  59              		@ args = 0, pretend = 0, frame = 0
  60              		@ frame_needed = 1, uses_anonymous_args = 0
  61 0000 80B5     		push	{r7, lr}
  62              		.cfi_def_cfa_offset 8
  63              		.cfi_offset 7, -8
  64              		.cfi_offset 14, -4
  65 0002 00AF     		add	r7, sp, #0
  66              		.cfi_def_cfa_register 7
  25:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 	
  26:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 	// Setup for keypad
  27:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 	*GPIO_MODER &= 0x0000FFFF;
  67              		.loc 1 27 0
  68 0004 2A4B     		ldr	r3, .L3
  69 0006 2A4A     		ldr	r2, .L3
  70 0008 1268     		ldr	r2, [r2]
  71 000a 1204     		lsls	r2, r2, #16
  72 000c 120C     		lsrs	r2, r2, #16
  73 000e 1A60     		str	r2, [r3]
  28:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 	*GPIO_MODER |= 0x55000000;
  74              		.loc 1 28 0
  75 0010 274B     		ldr	r3, .L3
  76 0012 274A     		ldr	r2, .L3
  77 0014 1268     		ldr	r2, [r2]
  78 0016 AA21     		movs	r1, #170
  79 0018 C905     		lsls	r1, r1, #23
  80 001a 0A43     		orrs	r2, r1
  81 001c 1A60     		str	r2, [r3]
  29:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 	
  30:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 	*GPIO_OTYPER &= 0x00FF;
  82              		.loc 1 30 0
  83 001e 254A     		ldr	r2, .L3+4
  84 0020 244B     		ldr	r3, .L3+4
  85 0022 1B88     		ldrh	r3, [r3]
  86 0024 9BB2     		uxth	r3, r3
  87 0026 FF21     		movs	r1, #255
  88 0028 0B40     		ands	r3, r1
  89 002a 9BB2     		uxth	r3, r3
  90 002c 1380     		strh	r3, [r2]
  31:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 	*GPIO_OTYPER |= 0x7000;
  91              		.loc 1 31 0
  92 002e 2149     		ldr	r1, .L3+4
  93 0030 204B     		ldr	r3, .L3+4
  94 0032 1B88     		ldrh	r3, [r3]
  95 0034 9BB2     		uxth	r3, r3
  96 0036 E022     		movs	r2, #224
  97 0038 D201     		lsls	r2, r2, #7
  98 003a 1343     		orrs	r3, r2
  99 003c 9BB2     		uxth	r3, r3
 100 003e 0B80     		strh	r3, [r1]
  32:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 	
  33:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 	*GPIO_PUPDR &= 0x0000FFFF;
 101              		.loc 1 33 0
 102 0040 1D4B     		ldr	r3, .L3+8
 103 0042 1D4A     		ldr	r2, .L3+8
 104 0044 1268     		ldr	r2, [r2]
 105 0046 1204     		lsls	r2, r2, #16
 106 0048 120C     		lsrs	r2, r2, #16
 107 004a 1A60     		str	r2, [r3]
  34:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 	*GPIO_PUPDR |= 0xAAAA0000;
 108              		.loc 1 34 0
 109 004c 1A4B     		ldr	r3, .L3+8
 110 004e 1A4A     		ldr	r2, .L3+8
 111 0050 1268     		ldr	r2, [r2]
 112 0052 1A49     		ldr	r1, .L3+12
 113 0054 0A43     		orrs	r2, r1
 114 0056 1A60     		str	r2, [r3]
  35:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 	
  36:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 	// Setup for 7 segments display
  37:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 	*GPIO_MODER &= 0xFFFF0000;
 115              		.loc 1 37 0
 116 0058 154B     		ldr	r3, .L3
 117 005a 154A     		ldr	r2, .L3
 118 005c 1268     		ldr	r2, [r2]
 119 005e 120C     		lsrs	r2, r2, #16
 120 0060 1204     		lsls	r2, r2, #16
 121 0062 1A60     		str	r2, [r3]
  38:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 	*GPIO_MODER |= 0x00005555;
 122              		.loc 1 38 0
 123 0064 124B     		ldr	r3, .L3
 124 0066 124A     		ldr	r2, .L3
 125 0068 1268     		ldr	r2, [r2]
 126 006a 1549     		ldr	r1, .L3+16
 127 006c 0A43     		orrs	r2, r1
 128 006e 1A60     		str	r2, [r3]
  39:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 	
  40:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 	*GPIO_OTYPER &= 0xFF00;
 129              		.loc 1 40 0
 130 0070 104A     		ldr	r2, .L3+4
 131 0072 104B     		ldr	r3, .L3+4
 132 0074 1B88     		ldrh	r3, [r3]
 133 0076 9BB2     		uxth	r3, r3
 134 0078 FF21     		movs	r1, #255
 135 007a 8B43     		bics	r3, r1
 136 007c 9BB2     		uxth	r3, r3
 137 007e 1380     		strh	r3, [r2]
  41:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 	*GPIO_OTYPER |= 0x0077;
 138              		.loc 1 41 0
 139 0080 0C4A     		ldr	r2, .L3+4
 140 0082 0C4B     		ldr	r3, .L3+4
 141 0084 1B88     		ldrh	r3, [r3]
 142 0086 9BB2     		uxth	r3, r3
 143 0088 7721     		movs	r1, #119
 144 008a 0B43     		orrs	r3, r1
 145 008c 9BB2     		uxth	r3, r3
 146 008e 1380     		strh	r3, [r2]
  42:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 	
  43:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 	*GPIO_PUPDR &= 0xFFFF0000;
 147              		.loc 1 43 0
 148 0090 094B     		ldr	r3, .L3+8
 149 0092 094A     		ldr	r2, .L3+8
 150 0094 1268     		ldr	r2, [r2]
 151 0096 120C     		lsrs	r2, r2, #16
 152 0098 1204     		lsls	r2, r2, #16
 153 009a 1A60     		str	r2, [r3]
  44:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 	*GPIO_PUPDR |= 0x0000AAAA;
 154              		.loc 1 44 0
 155 009c 064B     		ldr	r3, .L3+8
 156 009e 064A     		ldr	r2, .L3+8
 157 00a0 1268     		ldr	r2, [r2]
 158 00a2 0849     		ldr	r1, .L3+20
 159 00a4 0A43     		orrs	r2, r1
 160 00a6 1A60     		str	r2, [r3]
  45:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** }
 161              		.loc 1 45 0
 162 00a8 C046     		nop
 163 00aa BD46     		mov	sp, r7
 164              		@ sp needed
 165 00ac 80BD     		pop	{r7, pc}
 166              	.L4:
 167 00ae C046     		.align	2
 168              	.L3:
 169 00b0 000C0240 		.word	1073875968
 170 00b4 040C0240 		.word	1073875972
 171 00b8 0C0C0240 		.word	1073875980
 172 00bc 0000AAAA 		.word	-1431699456
 173 00c0 55550000 		.word	21845
 174 00c4 AAAA0000 		.word	43690
 175              		.cfi_endproc
 176              	.LFE1:
 178              		.align	1
 179              		.global	activateRow
 180              		.syntax unified
 181              		.code	16
 182              		.thumb_func
 183              		.fpu softvfp
 185              	activateRow:
 186              	.LFB2:
  46:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 
  47:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** void activateRow(unsigned char row) {
 187              		.loc 1 47 0
 188              		.cfi_startproc
 189              		@ args = 0, pretend = 0, frame = 8
 190              		@ frame_needed = 1, uses_anonymous_args = 0
 191 00c8 80B5     		push	{r7, lr}
 192              		.cfi_def_cfa_offset 8
 193              		.cfi_offset 7, -8
 194              		.cfi_offset 14, -4
 195 00ca 82B0     		sub	sp, sp, #8
 196              		.cfi_def_cfa_offset 16
 197 00cc 00AF     		add	r7, sp, #0
 198              		.cfi_def_cfa_register 7
 199 00ce 0200     		movs	r2, r0
 200 00d0 FB1D     		adds	r3, r7, #7
 201 00d2 1A70     		strb	r2, [r3]
  48:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 	switch(row) {
 202              		.loc 1 48 0
 203 00d4 FB1D     		adds	r3, r7, #7
 204 00d6 1B78     		ldrb	r3, [r3]
 205 00d8 042B     		cmp	r3, #4
 206 00da 18D8     		bhi	.L13
 207 00dc 9A00     		lsls	r2, r3, #2
 208 00de 0E4B     		ldr	r3, .L14
 209 00e0 D318     		adds	r3, r2, r3
 210 00e2 1B68     		ldr	r3, [r3]
 211 00e4 9F46     		mov	pc, r3
 212              		.section	.rodata
 213              		.align	2
 214              	.L8:
 215 0000 E6000000 		.word	.L7
 216 0004 EE000000 		.word	.L9
 217 0008 F6000000 		.word	.L10
 218 000c FE000000 		.word	.L11
 219 0010 06010000 		.word	.L12
 220              		.text
 221              	.L7:
  49:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 		case 0: *GPIO_ODR_HIGH = 0x00; break;
 222              		.loc 1 49 0
 223 00e6 0D4B     		ldr	r3, .L14+4
 224 00e8 0022     		movs	r2, #0
 225 00ea 1A70     		strb	r2, [r3]
 226 00ec 0FE0     		b	.L6
 227              	.L9:
  50:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 		case 1: *GPIO_ODR_HIGH = 0x10; break;
 228              		.loc 1 50 0
 229 00ee 0B4B     		ldr	r3, .L14+4
 230 00f0 1022     		movs	r2, #16
 231 00f2 1A70     		strb	r2, [r3]
 232 00f4 0BE0     		b	.L6
 233              	.L10:
  51:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 		case 2: *GPIO_ODR_HIGH = 0x20; break;
 234              		.loc 1 51 0
 235 00f6 094B     		ldr	r3, .L14+4
 236 00f8 2022     		movs	r2, #32
 237 00fa 1A70     		strb	r2, [r3]
 238 00fc 07E0     		b	.L6
 239              	.L11:
  52:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 		case 3: *GPIO_ODR_HIGH = 0x40; break;
 240              		.loc 1 52 0
 241 00fe 074B     		ldr	r3, .L14+4
 242 0100 4022     		movs	r2, #64
 243 0102 1A70     		strb	r2, [r3]
 244 0104 03E0     		b	.L6
 245              	.L12:
  53:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 		case 4: *GPIO_ODR_HIGH = 0x80; break;
 246              		.loc 1 53 0
 247 0106 054B     		ldr	r3, .L14+4
 248 0108 8022     		movs	r2, #128
 249 010a 1A70     		strb	r2, [r3]
 250 010c C046     		nop
 251              	.L6:
 252              	.L13:
  54:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 	}
  55:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** }
 253              		.loc 1 55 0
 254 010e C046     		nop
 255 0110 BD46     		mov	sp, r7
 256 0112 02B0     		add	sp, sp, #8
 257              		@ sp needed
 258 0114 80BD     		pop	{r7, pc}
 259              	.L15:
 260 0116 C046     		.align	2
 261              	.L14:
 262 0118 00000000 		.word	.L8
 263 011c 150C0240 		.word	1073875989
 264              		.cfi_endproc
 265              	.LFE2:
 267              		.align	1
 268              		.global	readColumn
 269              		.syntax unified
 270              		.code	16
 271              		.thumb_func
 272              		.fpu softvfp
 274              	readColumn:
 275              	.LFB3:
  56:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 
  57:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** unsigned char readColumn(void) {
 276              		.loc 1 57 0
 277              		.cfi_startproc
 278              		@ args = 0, pretend = 0, frame = 8
 279              		@ frame_needed = 1, uses_anonymous_args = 0
 280 0120 80B5     		push	{r7, lr}
 281              		.cfi_def_cfa_offset 8
 282              		.cfi_offset 7, -8
 283              		.cfi_offset 14, -4
 284 0122 82B0     		sub	sp, sp, #8
 285              		.cfi_def_cfa_offset 16
 286 0124 00AF     		add	r7, sp, #0
 287              		.cfi_def_cfa_register 7
  58:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 	unsigned char idr = *GPIO_IDR_HIGH;
 288              		.loc 1 58 0
 289 0126 104A     		ldr	r2, .L22
 290 0128 FB1D     		adds	r3, r7, #7
 291 012a 1278     		ldrb	r2, [r2]
 292 012c 1A70     		strb	r2, [r3]
  59:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 	if(idr == 0x01) return 1;
 293              		.loc 1 59 0
 294 012e FB1D     		adds	r3, r7, #7
 295 0130 1B78     		ldrb	r3, [r3]
 296 0132 012B     		cmp	r3, #1
 297 0134 01D1     		bne	.L17
 298              		.loc 1 59 0 is_stmt 0 discriminator 1
 299 0136 0123     		movs	r3, #1
 300 0138 12E0     		b	.L18
 301              	.L17:
  60:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 	if(idr == 0x02) return 2;
 302              		.loc 1 60 0 is_stmt 1
 303 013a FB1D     		adds	r3, r7, #7
 304 013c 1B78     		ldrb	r3, [r3]
 305 013e 022B     		cmp	r3, #2
 306 0140 01D1     		bne	.L19
 307              		.loc 1 60 0 is_stmt 0 discriminator 1
 308 0142 0223     		movs	r3, #2
 309 0144 0CE0     		b	.L18
 310              	.L19:
  61:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 	if(idr == 0x04) return 3;
 311              		.loc 1 61 0 is_stmt 1
 312 0146 FB1D     		adds	r3, r7, #7
 313 0148 1B78     		ldrb	r3, [r3]
 314 014a 042B     		cmp	r3, #4
 315 014c 01D1     		bne	.L20
 316              		.loc 1 61 0 is_stmt 0 discriminator 1
 317 014e 0323     		movs	r3, #3
 318 0150 06E0     		b	.L18
 319              	.L20:
  62:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 	if(idr == 0x08) return 4;
 320              		.loc 1 62 0 is_stmt 1
 321 0152 FB1D     		adds	r3, r7, #7
 322 0154 1B78     		ldrb	r3, [r3]
 323 0156 082B     		cmp	r3, #8
 324 0158 01D1     		bne	.L21
 325              		.loc 1 62 0 is_stmt 0 discriminator 1
 326 015a 0423     		movs	r3, #4
 327 015c 00E0     		b	.L18
 328              	.L21:
  63:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 	return 0;
 329              		.loc 1 63 0 is_stmt 1
 330 015e 0023     		movs	r3, #0
 331              	.L18:
  64:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** }
 332              		.loc 1 64 0
 333 0160 1800     		movs	r0, r3
 334 0162 BD46     		mov	sp, r7
 335 0164 02B0     		add	sp, sp, #8
 336              		@ sp needed
 337 0166 80BD     		pop	{r7, pc}
 338              	.L23:
 339              		.align	2
 340              	.L22:
 341 0168 110C0240 		.word	1073875985
 342              		.cfi_endproc
 343              	.LFE3:
 345              		.section	.rodata
 346              		.align	2
 347              	.LC0:
 348 0014 01       		.byte	1
 349 0015 02       		.byte	2
 350 0016 03       		.byte	3
 351 0017 0A       		.byte	10
 352 0018 04       		.byte	4
 353 0019 05       		.byte	5
 354 001a 06       		.byte	6
 355 001b 0B       		.byte	11
 356 001c 07       		.byte	7
 357 001d 08       		.byte	8
 358 001e 09       		.byte	9
 359 001f 0C       		.byte	12
 360 0020 0E       		.byte	14
 361 0021 00       		.byte	0
 362 0022 0F       		.byte	15
 363 0023 0D       		.byte	13
 364              		.text
 365              		.align	1
 366              		.global	keyb
 367              		.syntax unified
 368              		.code	16
 369              		.thumb_func
 370              		.fpu softvfp
 372              	keyb:
 373              	.LFB4:
  65:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 
  66:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** unsigned char keyb(void) {
 374              		.loc 1 66 0
 375              		.cfi_startproc
 376              		@ args = 0, pretend = 0, frame = 24
 377              		@ frame_needed = 1, uses_anonymous_args = 0
 378 016c 90B5     		push	{r4, r7, lr}
 379              		.cfi_def_cfa_offset 12
 380              		.cfi_offset 4, -12
 381              		.cfi_offset 7, -8
 382              		.cfi_offset 14, -4
 383 016e 87B0     		sub	sp, sp, #28
 384              		.cfi_def_cfa_offset 40
 385 0170 00AF     		add	r7, sp, #0
 386              		.cfi_def_cfa_register 7
  67:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 	unsigned char keys[] = {0x1,0x2,0x3,0xA,0x4,0x5,0x6,0xB,0x7,0x8,0x9,0xC,0xE,0x0,0xF,0xD};
 387              		.loc 1 67 0
 388 0172 3B1D     		adds	r3, r7, #4
 389 0174 1F4A     		ldr	r2, .L30
 390 0176 13CA     		ldmia	r2!, {r0, r1, r4}
 391 0178 13C3     		stmia	r3!, {r0, r1, r4}
 392 017a 1268     		ldr	r2, [r2]
 393 017c 1A60     		str	r2, [r3]
 394              	.LBB2:
  68:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 	for(char row = 1; row <= 4; row++) {
 395              		.loc 1 68 0
 396 017e 1723     		movs	r3, #23
 397 0180 FB18     		adds	r3, r7, r3
 398 0182 0122     		movs	r2, #1
 399 0184 1A70     		strb	r2, [r3]
 400 0186 27E0     		b	.L25
 401              	.L28:
 402              	.LBB3:
  69:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 		activateRow(row);
 403              		.loc 1 69 0
 404 0188 1723     		movs	r3, #23
 405 018a FB18     		adds	r3, r7, r3
 406 018c 1B78     		ldrb	r3, [r3]
 407 018e 1800     		movs	r0, r3
 408 0190 FFF7FEFF 		bl	activateRow
  70:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 		char column = readColumn();
 409              		.loc 1 70 0
 410 0194 1623     		movs	r3, #22
 411 0196 FC18     		adds	r4, r7, r3
 412 0198 FFF7FEFF 		bl	readColumn
 413 019c 0300     		movs	r3, r0
 414 019e 2370     		strb	r3, [r4]
  71:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 		if(column != 0) {
 415              		.loc 1 71 0
 416 01a0 1623     		movs	r3, #22
 417 01a2 FB18     		adds	r3, r7, r3
 418 01a4 1B78     		ldrb	r3, [r3]
 419 01a6 002B     		cmp	r3, #0
 420 01a8 0FD0     		beq	.L26
  72:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 			activateRow(0);
 421              		.loc 1 72 0
 422 01aa 0020     		movs	r0, #0
 423 01ac FFF7FEFF 		bl	activateRow
  73:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 			return keys[4 * (row - 1) + (column - 1)];
 424              		.loc 1 73 0
 425 01b0 1723     		movs	r3, #23
 426 01b2 FB18     		adds	r3, r7, r3
 427 01b4 1B78     		ldrb	r3, [r3]
 428 01b6 013B     		subs	r3, r3, #1
 429 01b8 9A00     		lsls	r2, r3, #2
 430 01ba 1623     		movs	r3, #22
 431 01bc FB18     		adds	r3, r7, r3
 432 01be 1B78     		ldrb	r3, [r3]
 433 01c0 013B     		subs	r3, r3, #1
 434 01c2 D318     		adds	r3, r2, r3
 435 01c4 3A1D     		adds	r2, r7, #4
 436 01c6 D35C     		ldrb	r3, [r2, r3]
 437 01c8 0FE0     		b	.L29
 438              	.L26:
 439              	.LBE3:
  68:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 		activateRow(row);
 440              		.loc 1 68 0 discriminator 2
 441 01ca 1723     		movs	r3, #23
 442 01cc FB18     		adds	r3, r7, r3
 443 01ce 1A78     		ldrb	r2, [r3]
 444 01d0 1723     		movs	r3, #23
 445 01d2 FB18     		adds	r3, r7, r3
 446 01d4 0132     		adds	r2, r2, #1
 447 01d6 1A70     		strb	r2, [r3]
 448              	.L25:
  68:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 		activateRow(row);
 449              		.loc 1 68 0 is_stmt 0 discriminator 1
 450 01d8 1723     		movs	r3, #23
 451 01da FB18     		adds	r3, r7, r3
 452 01dc 1B78     		ldrb	r3, [r3]
 453 01de 042B     		cmp	r3, #4
 454 01e0 D2D9     		bls	.L28
 455              	.LBE2:
  74:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 		}
  75:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 	}
  76:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 	activateRow(0);
 456              		.loc 1 76 0 is_stmt 1
 457 01e2 0020     		movs	r0, #0
 458 01e4 FFF7FEFF 		bl	activateRow
  77:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 	return 0xFF;
 459              		.loc 1 77 0
 460 01e8 FF23     		movs	r3, #255
 461              	.L29:
  78:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** }
 462              		.loc 1 78 0 discriminator 1
 463 01ea 1800     		movs	r0, r3
 464 01ec BD46     		mov	sp, r7
 465 01ee 07B0     		add	sp, sp, #28
 466              		@ sp needed
 467 01f0 90BD     		pop	{r4, r7, pc}
 468              	.L31:
 469 01f2 C046     		.align	2
 470              	.L30:
 471 01f4 14000000 		.word	.LC0
 472              		.cfi_endproc
 473              	.LFE4:
 475              		.align	1
 476              		.global	updateDisplay
 477              		.syntax unified
 478              		.code	16
 479              		.thumb_func
 480              		.fpu softvfp
 482              	updateDisplay:
 483              	.LFB5:
  79:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 
  80:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** unsigned char updateDisplay(unsigned char key) {
 484              		.loc 1 80 0
 485              		.cfi_startproc
 486              		@ args = 0, pretend = 0, frame = 8
 487              		@ frame_needed = 1, uses_anonymous_args = 0
 488 01f8 80B5     		push	{r7, lr}
 489              		.cfi_def_cfa_offset 8
 490              		.cfi_offset 7, -8
 491              		.cfi_offset 14, -4
 492 01fa 82B0     		sub	sp, sp, #8
 493              		.cfi_def_cfa_offset 16
 494 01fc 00AF     		add	r7, sp, #0
 495              		.cfi_def_cfa_register 7
 496 01fe 0200     		movs	r2, r0
 497 0200 FB1D     		adds	r3, r7, #7
 498 0202 1A70     		strb	r2, [r3]
  81:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 	if(key == 0x0) *GPIO_ODR_LOW = 0x3F; 
 499              		.loc 1 81 0
 500 0204 FB1D     		adds	r3, r7, #7
 501 0206 1B78     		ldrb	r3, [r3]
 502 0208 002B     		cmp	r3, #0
 503 020a 03D1     		bne	.L33
 504              		.loc 1 81 0 is_stmt 0 discriminator 1
 505 020c 414B     		ldr	r3, .L50
 506 020e 3F22     		movs	r2, #63
 507 0210 1A70     		strb	r2, [r3]
 508 0212 7AE0     		b	.L34
 509              	.L33:
  82:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 	else if(key == 0x1) *GPIO_ODR_LOW = 0x06; 
 510              		.loc 1 82 0 is_stmt 1
 511 0214 FB1D     		adds	r3, r7, #7
 512 0216 1B78     		ldrb	r3, [r3]
 513 0218 012B     		cmp	r3, #1
 514 021a 03D1     		bne	.L35
 515              		.loc 1 82 0 is_stmt 0 discriminator 1
 516 021c 3D4B     		ldr	r3, .L50
 517 021e 0622     		movs	r2, #6
 518 0220 1A70     		strb	r2, [r3]
 519 0222 72E0     		b	.L34
 520              	.L35:
  83:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 	else if(key == 0x2) *GPIO_ODR_LOW = 0x5B;  
 521              		.loc 1 83 0 is_stmt 1
 522 0224 FB1D     		adds	r3, r7, #7
 523 0226 1B78     		ldrb	r3, [r3]
 524 0228 022B     		cmp	r3, #2
 525 022a 03D1     		bne	.L36
 526              		.loc 1 83 0 is_stmt 0 discriminator 1
 527 022c 394B     		ldr	r3, .L50
 528 022e 5B22     		movs	r2, #91
 529 0230 1A70     		strb	r2, [r3]
 530 0232 6AE0     		b	.L34
 531              	.L36:
  84:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 	else if(key == 0x3) *GPIO_ODR_LOW = 0x4F;  
 532              		.loc 1 84 0 is_stmt 1
 533 0234 FB1D     		adds	r3, r7, #7
 534 0236 1B78     		ldrb	r3, [r3]
 535 0238 032B     		cmp	r3, #3
 536 023a 03D1     		bne	.L37
 537              		.loc 1 84 0 is_stmt 0 discriminator 1
 538 023c 354B     		ldr	r3, .L50
 539 023e 4F22     		movs	r2, #79
 540 0240 1A70     		strb	r2, [r3]
 541 0242 62E0     		b	.L34
 542              	.L37:
  85:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 	else if(key == 0x4) *GPIO_ODR_LOW = 0x66;  
 543              		.loc 1 85 0 is_stmt 1
 544 0244 FB1D     		adds	r3, r7, #7
 545 0246 1B78     		ldrb	r3, [r3]
 546 0248 042B     		cmp	r3, #4
 547 024a 03D1     		bne	.L38
 548              		.loc 1 85 0 is_stmt 0 discriminator 1
 549 024c 314B     		ldr	r3, .L50
 550 024e 6622     		movs	r2, #102
 551 0250 1A70     		strb	r2, [r3]
 552 0252 5AE0     		b	.L34
 553              	.L38:
  86:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 	else if(key == 0x5) *GPIO_ODR_LOW = 0x6D;  
 554              		.loc 1 86 0 is_stmt 1
 555 0254 FB1D     		adds	r3, r7, #7
 556 0256 1B78     		ldrb	r3, [r3]
 557 0258 052B     		cmp	r3, #5
 558 025a 03D1     		bne	.L39
 559              		.loc 1 86 0 is_stmt 0 discriminator 1
 560 025c 2D4B     		ldr	r3, .L50
 561 025e 6D22     		movs	r2, #109
 562 0260 1A70     		strb	r2, [r3]
 563 0262 52E0     		b	.L34
 564              	.L39:
  87:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 	else if(key == 0x6) *GPIO_ODR_LOW = 0x7D;  
 565              		.loc 1 87 0 is_stmt 1
 566 0264 FB1D     		adds	r3, r7, #7
 567 0266 1B78     		ldrb	r3, [r3]
 568 0268 062B     		cmp	r3, #6
 569 026a 03D1     		bne	.L40
 570              		.loc 1 87 0 is_stmt 0 discriminator 1
 571 026c 294B     		ldr	r3, .L50
 572 026e 7D22     		movs	r2, #125
 573 0270 1A70     		strb	r2, [r3]
 574 0272 4AE0     		b	.L34
 575              	.L40:
  88:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 	else if(key == 0x7) *GPIO_ODR_LOW = 0x07;  
 576              		.loc 1 88 0 is_stmt 1
 577 0274 FB1D     		adds	r3, r7, #7
 578 0276 1B78     		ldrb	r3, [r3]
 579 0278 072B     		cmp	r3, #7
 580 027a 03D1     		bne	.L41
 581              		.loc 1 88 0 is_stmt 0 discriminator 1
 582 027c 254B     		ldr	r3, .L50
 583 027e 0722     		movs	r2, #7
 584 0280 1A70     		strb	r2, [r3]
 585 0282 42E0     		b	.L34
 586              	.L41:
  89:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 	else if(key == 0x8) *GPIO_ODR_LOW = 0x7F;  
 587              		.loc 1 89 0 is_stmt 1
 588 0284 FB1D     		adds	r3, r7, #7
 589 0286 1B78     		ldrb	r3, [r3]
 590 0288 082B     		cmp	r3, #8
 591 028a 03D1     		bne	.L42
 592              		.loc 1 89 0 is_stmt 0 discriminator 1
 593 028c 214B     		ldr	r3, .L50
 594 028e 7F22     		movs	r2, #127
 595 0290 1A70     		strb	r2, [r3]
 596 0292 3AE0     		b	.L34
 597              	.L42:
  90:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 	else if(key == 0x9) *GPIO_ODR_LOW = 0x67;  
 598              		.loc 1 90 0 is_stmt 1
 599 0294 FB1D     		adds	r3, r7, #7
 600 0296 1B78     		ldrb	r3, [r3]
 601 0298 092B     		cmp	r3, #9
 602 029a 03D1     		bne	.L43
 603              		.loc 1 90 0 is_stmt 0 discriminator 1
 604 029c 1D4B     		ldr	r3, .L50
 605 029e 6722     		movs	r2, #103
 606 02a0 1A70     		strb	r2, [r3]
 607 02a2 32E0     		b	.L34
 608              	.L43:
  91:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 	else if(key == 0xA) *GPIO_ODR_LOW = 0x77;  
 609              		.loc 1 91 0 is_stmt 1
 610 02a4 FB1D     		adds	r3, r7, #7
 611 02a6 1B78     		ldrb	r3, [r3]
 612 02a8 0A2B     		cmp	r3, #10
 613 02aa 03D1     		bne	.L44
 614              		.loc 1 91 0 is_stmt 0 discriminator 1
 615 02ac 194B     		ldr	r3, .L50
 616 02ae 7722     		movs	r2, #119
 617 02b0 1A70     		strb	r2, [r3]
 618 02b2 2AE0     		b	.L34
 619              	.L44:
  92:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 	else if(key == 0xB) *GPIO_ODR_LOW = 0xFF;  
 620              		.loc 1 92 0 is_stmt 1
 621 02b4 FB1D     		adds	r3, r7, #7
 622 02b6 1B78     		ldrb	r3, [r3]
 623 02b8 0B2B     		cmp	r3, #11
 624 02ba 03D1     		bne	.L45
 625              		.loc 1 92 0 is_stmt 0 discriminator 1
 626 02bc 154B     		ldr	r3, .L50
 627 02be FF22     		movs	r2, #255
 628 02c0 1A70     		strb	r2, [r3]
 629 02c2 22E0     		b	.L34
 630              	.L45:
  93:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 	else if(key == 0xC) *GPIO_ODR_LOW = 0x39;  
 631              		.loc 1 93 0 is_stmt 1
 632 02c4 FB1D     		adds	r3, r7, #7
 633 02c6 1B78     		ldrb	r3, [r3]
 634 02c8 0C2B     		cmp	r3, #12
 635 02ca 03D1     		bne	.L46
 636              		.loc 1 93 0 is_stmt 0 discriminator 1
 637 02cc 114B     		ldr	r3, .L50
 638 02ce 3922     		movs	r2, #57
 639 02d0 1A70     		strb	r2, [r3]
 640 02d2 1AE0     		b	.L34
 641              	.L46:
  94:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 	else if(key == 0xD) *GPIO_ODR_LOW = 0xBF;  
 642              		.loc 1 94 0 is_stmt 1
 643 02d4 FB1D     		adds	r3, r7, #7
 644 02d6 1B78     		ldrb	r3, [r3]
 645 02d8 0D2B     		cmp	r3, #13
 646 02da 03D1     		bne	.L47
 647              		.loc 1 94 0 is_stmt 0 discriminator 1
 648 02dc 0D4B     		ldr	r3, .L50
 649 02de BF22     		movs	r2, #191
 650 02e0 1A70     		strb	r2, [r3]
 651 02e2 12E0     		b	.L34
 652              	.L47:
  95:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 	else if(key == 0xE) *GPIO_ODR_LOW = 0x79;  
 653              		.loc 1 95 0 is_stmt 1
 654 02e4 FB1D     		adds	r3, r7, #7
 655 02e6 1B78     		ldrb	r3, [r3]
 656 02e8 0E2B     		cmp	r3, #14
 657 02ea 03D1     		bne	.L48
 658              		.loc 1 95 0 is_stmt 0 discriminator 1
 659 02ec 094B     		ldr	r3, .L50
 660 02ee 7922     		movs	r2, #121
 661 02f0 1A70     		strb	r2, [r3]
 662 02f2 0AE0     		b	.L34
 663              	.L48:
  96:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 	else if(key == 0xF) *GPIO_ODR_LOW = 0x71;
 664              		.loc 1 96 0 is_stmt 1
 665 02f4 FB1D     		adds	r3, r7, #7
 666 02f6 1B78     		ldrb	r3, [r3]
 667 02f8 0F2B     		cmp	r3, #15
 668 02fa 03D1     		bne	.L49
 669              		.loc 1 96 0 is_stmt 0 discriminator 1
 670 02fc 054B     		ldr	r3, .L50
 671 02fe 7122     		movs	r2, #113
 672 0300 1A70     		strb	r2, [r3]
 673 0302 02E0     		b	.L34
 674              	.L49:
  97:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 	else *GPIO_ODR_LOW = 0x00;
 675              		.loc 1 97 0 is_stmt 1
 676 0304 034B     		ldr	r3, .L50
 677 0306 0022     		movs	r2, #0
 678 0308 1A70     		strb	r2, [r3]
 679              	.L34:
  98:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** }
 680              		.loc 1 98 0
 681 030a C046     		nop
 682 030c 1800     		movs	r0, r3
 683 030e BD46     		mov	sp, r7
 684 0310 02B0     		add	sp, sp, #8
 685              		@ sp needed
 686 0312 80BD     		pop	{r7, pc}
 687              	.L51:
 688              		.align	2
 689              	.L50:
 690 0314 140C0240 		.word	1073875988
 691              		.cfi_endproc
 692              	.LFE5:
 694              		.align	1
 695              		.global	main
 696              		.syntax unified
 697              		.code	16
 698              		.thumb_func
 699              		.fpu softvfp
 701              	main:
 702              	.LFB6:
  99:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 
 100:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** void main(void) {
 703              		.loc 1 100 0
 704              		.cfi_startproc
 705              		@ args = 0, pretend = 0, frame = 8
 706              		@ frame_needed = 1, uses_anonymous_args = 0
 707 0318 90B5     		push	{r4, r7, lr}
 708              		.cfi_def_cfa_offset 12
 709              		.cfi_offset 4, -12
 710              		.cfi_offset 7, -8
 711              		.cfi_offset 14, -4
 712 031a 83B0     		sub	sp, sp, #12
 713              		.cfi_def_cfa_offset 24
 714 031c 00AF     		add	r7, sp, #0
 715              		.cfi_def_cfa_register 7
 101:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 	app_init();
 716              		.loc 1 101 0
 717 031e FFF7FEFF 		bl	app_init
 718              	.L53:
 719              	.LBB4:
 102:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 	while(1) {
 103:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 		unsigned char i = keyb();
 720              		.loc 1 103 0 discriminator 1
 721 0322 FC1D     		adds	r4, r7, #7
 722 0324 FFF7FEFF 		bl	keyb
 723 0328 0300     		movs	r3, r0
 724 032a 2370     		strb	r3, [r4]
 104:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 		updateDisplay(i);
 725              		.loc 1 104 0 discriminator 1
 726 032c FB1D     		adds	r3, r7, #7
 727 032e 1B78     		ldrb	r3, [r3]
 728 0330 1800     		movs	r0, r3
 729 0332 FFF7FEFF 		bl	updateDisplay
 730              	.LBE4:
 102:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 	while(1) {
 731              		.loc 1 102 0 discriminator 1
 732 0336 F4E7     		b	.L53
 733              		.cfi_endproc
 734              	.LFE6:
 736              	.Letext0:
