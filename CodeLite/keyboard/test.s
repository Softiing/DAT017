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
  25:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 	*GPIO_MODER &= 0x0000FFFF;
  67              		.loc 1 25 0
  68 0004 164B     		ldr	r3, .L3
  69 0006 164A     		ldr	r2, .L3
  70 0008 1268     		ldr	r2, [r2]
  71 000a 1204     		lsls	r2, r2, #16
  72 000c 120C     		lsrs	r2, r2, #16
  73 000e 1A60     		str	r2, [r3]
  26:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 	*GPIO_MODER |= 0x55000000;
  74              		.loc 1 26 0
  75 0010 134B     		ldr	r3, .L3
  76 0012 134A     		ldr	r2, .L3
  77 0014 1268     		ldr	r2, [r2]
  78 0016 AA21     		movs	r1, #170
  79 0018 C905     		lsls	r1, r1, #23
  80 001a 0A43     		orrs	r2, r1
  81 001c 1A60     		str	r2, [r3]
  27:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 	
  28:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 	*GPIO_OTYPER &= 0x00FF;
  82              		.loc 1 28 0
  83 001e 114A     		ldr	r2, .L3+4
  84 0020 104B     		ldr	r3, .L3+4
  85 0022 1B88     		ldrh	r3, [r3]
  86 0024 9BB2     		uxth	r3, r3
  87 0026 FF21     		movs	r1, #255
  88 0028 0B40     		ands	r3, r1
  89 002a 9BB2     		uxth	r3, r3
  90 002c 1380     		strh	r3, [r2]
  29:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 	*GPIO_OTYPER |= 0x7000;
  91              		.loc 1 29 0
  92 002e 0D49     		ldr	r1, .L3+4
  93 0030 0C4B     		ldr	r3, .L3+4
  94 0032 1B88     		ldrh	r3, [r3]
  95 0034 9BB2     		uxth	r3, r3
  96 0036 E022     		movs	r2, #224
  97 0038 D201     		lsls	r2, r2, #7
  98 003a 1343     		orrs	r3, r2
  99 003c 9BB2     		uxth	r3, r3
 100 003e 0B80     		strh	r3, [r1]
  30:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 	
  31:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 	*GPIO_PUPDR &= 0x0000FFFF;
 101              		.loc 1 31 0
 102 0040 094B     		ldr	r3, .L3+8
 103 0042 094A     		ldr	r2, .L3+8
 104 0044 1268     		ldr	r2, [r2]
 105 0046 1204     		lsls	r2, r2, #16
 106 0048 120C     		lsrs	r2, r2, #16
 107 004a 1A60     		str	r2, [r3]
  32:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 	*GPIO_PUPDR |= 0xAAAA0000;
 108              		.loc 1 32 0
 109 004c 064B     		ldr	r3, .L3+8
 110 004e 064A     		ldr	r2, .L3+8
 111 0050 1268     		ldr	r2, [r2]
 112 0052 0649     		ldr	r1, .L3+12
 113 0054 0A43     		orrs	r2, r1
 114 0056 1A60     		str	r2, [r3]
  33:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** }
 115              		.loc 1 33 0
 116 0058 C046     		nop
 117 005a BD46     		mov	sp, r7
 118              		@ sp needed
 119 005c 80BD     		pop	{r7, pc}
 120              	.L4:
 121 005e C046     		.align	2
 122              	.L3:
 123 0060 000C0240 		.word	1073875968
 124 0064 040C0240 		.word	1073875972
 125 0068 0C0C0240 		.word	1073875980
 126 006c 0000AAAA 		.word	-1431699456
 127              		.cfi_endproc
 128              	.LFE1:
 130              		.align	1
 131              		.global	activateRow
 132              		.syntax unified
 133              		.code	16
 134              		.thumb_func
 135              		.fpu softvfp
 137              	activateRow:
 138              	.LFB2:
  34:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 
  35:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** void activateRow(unsigned char row) {
 139              		.loc 1 35 0
 140              		.cfi_startproc
 141              		@ args = 0, pretend = 0, frame = 8
 142              		@ frame_needed = 1, uses_anonymous_args = 0
 143 0070 80B5     		push	{r7, lr}
 144              		.cfi_def_cfa_offset 8
 145              		.cfi_offset 7, -8
 146              		.cfi_offset 14, -4
 147 0072 82B0     		sub	sp, sp, #8
 148              		.cfi_def_cfa_offset 16
 149 0074 00AF     		add	r7, sp, #0
 150              		.cfi_def_cfa_register 7
 151 0076 0200     		movs	r2, r0
 152 0078 FB1D     		adds	r3, r7, #7
 153 007a 1A70     		strb	r2, [r3]
  36:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 	switch(row) {
 154              		.loc 1 36 0
 155 007c FB1D     		adds	r3, r7, #7
 156 007e 1B78     		ldrb	r3, [r3]
 157 0080 022B     		cmp	r3, #2
 158 0082 0CD0     		beq	.L7
 159 0084 02DC     		bgt	.L8
 160 0086 012B     		cmp	r3, #1
 161 0088 05D0     		beq	.L9
  37:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 		case 1: *GPIO_ODR_HIGH = 0x10; break;
  38:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 		case 2: *GPIO_ODR_HIGH = 0x20; break;
  39:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 		case 3: *GPIO_ODR_HIGH = 0x40; break;
  40:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 		case 4: *GPIO_ODR_HIGH = 0x80; break;
  41:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 	}
  42:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** }
 162              		.loc 1 42 0
 163 008a 14E0     		b	.L12
 164              	.L8:
  36:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 	switch(row) {
 165              		.loc 1 36 0
 166 008c 032B     		cmp	r3, #3
 167 008e 0AD0     		beq	.L10
 168 0090 042B     		cmp	r3, #4
 169 0092 0CD0     		beq	.L11
 170              		.loc 1 42 0
 171 0094 0FE0     		b	.L12
 172              	.L9:
  37:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 		case 1: *GPIO_ODR_HIGH = 0x10; break;
 173              		.loc 1 37 0
 174 0096 0A4B     		ldr	r3, .L13
 175 0098 1022     		movs	r2, #16
 176 009a 1A70     		strb	r2, [r3]
 177 009c 0BE0     		b	.L6
 178              	.L7:
  38:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 		case 3: *GPIO_ODR_HIGH = 0x40; break;
 179              		.loc 1 38 0
 180 009e 084B     		ldr	r3, .L13
 181 00a0 2022     		movs	r2, #32
 182 00a2 1A70     		strb	r2, [r3]
 183 00a4 07E0     		b	.L6
 184              	.L10:
  39:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 		case 4: *GPIO_ODR_HIGH = 0x80; break;
 185              		.loc 1 39 0
 186 00a6 064B     		ldr	r3, .L13
 187 00a8 4022     		movs	r2, #64
 188 00aa 1A70     		strb	r2, [r3]
 189 00ac 03E0     		b	.L6
 190              	.L11:
  40:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 	}
 191              		.loc 1 40 0
 192 00ae 044B     		ldr	r3, .L13
 193 00b0 8022     		movs	r2, #128
 194 00b2 1A70     		strb	r2, [r3]
 195 00b4 C046     		nop
 196              	.L6:
 197              	.L12:
 198              		.loc 1 42 0
 199 00b6 C046     		nop
 200 00b8 BD46     		mov	sp, r7
 201 00ba 02B0     		add	sp, sp, #8
 202              		@ sp needed
 203 00bc 80BD     		pop	{r7, pc}
 204              	.L14:
 205 00be C046     		.align	2
 206              	.L13:
 207 00c0 150C0240 		.word	1073875989
 208              		.cfi_endproc
 209              	.LFE2:
 211              		.align	1
 212              		.global	readColumn
 213              		.syntax unified
 214              		.code	16
 215              		.thumb_func
 216              		.fpu softvfp
 218              	readColumn:
 219              	.LFB3:
  43:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 
  44:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** unsigned char readColumn(void) {
 220              		.loc 1 44 0
 221              		.cfi_startproc
 222              		@ args = 0, pretend = 0, frame = 8
 223              		@ frame_needed = 1, uses_anonymous_args = 0
 224 00c4 80B5     		push	{r7, lr}
 225              		.cfi_def_cfa_offset 8
 226              		.cfi_offset 7, -8
 227              		.cfi_offset 14, -4
 228 00c6 82B0     		sub	sp, sp, #8
 229              		.cfi_def_cfa_offset 16
 230 00c8 00AF     		add	r7, sp, #0
 231              		.cfi_def_cfa_register 7
  45:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 	unsigned char idr = *GPIO_IDR_HIGH;
 232              		.loc 1 45 0
 233 00ca 104A     		ldr	r2, .L21
 234 00cc FB1D     		adds	r3, r7, #7
 235 00ce 1278     		ldrb	r2, [r2]
 236 00d0 1A70     		strb	r2, [r3]
  46:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 	if(idr == 0x01) return 1;
 237              		.loc 1 46 0
 238 00d2 FB1D     		adds	r3, r7, #7
 239 00d4 1B78     		ldrb	r3, [r3]
 240 00d6 012B     		cmp	r3, #1
 241 00d8 01D1     		bne	.L16
 242              		.loc 1 46 0 is_stmt 0 discriminator 1
 243 00da 0123     		movs	r3, #1
 244 00dc 12E0     		b	.L17
 245              	.L16:
  47:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 	if(idr == 0x02) return 2;
 246              		.loc 1 47 0 is_stmt 1
 247 00de FB1D     		adds	r3, r7, #7
 248 00e0 1B78     		ldrb	r3, [r3]
 249 00e2 022B     		cmp	r3, #2
 250 00e4 01D1     		bne	.L18
 251              		.loc 1 47 0 is_stmt 0 discriminator 1
 252 00e6 0223     		movs	r3, #2
 253 00e8 0CE0     		b	.L17
 254              	.L18:
  48:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 	if(idr == 0x04) return 4;
 255              		.loc 1 48 0 is_stmt 1
 256 00ea FB1D     		adds	r3, r7, #7
 257 00ec 1B78     		ldrb	r3, [r3]
 258 00ee 042B     		cmp	r3, #4
 259 00f0 01D1     		bne	.L19
 260              		.loc 1 48 0 is_stmt 0 discriminator 1
 261 00f2 0423     		movs	r3, #4
 262 00f4 06E0     		b	.L17
 263              	.L19:
  49:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 	if(idr == 0x08) return 8;
 264              		.loc 1 49 0 is_stmt 1
 265 00f6 FB1D     		adds	r3, r7, #7
 266 00f8 1B78     		ldrb	r3, [r3]
 267 00fa 082B     		cmp	r3, #8
 268 00fc 01D1     		bne	.L20
 269              		.loc 1 49 0 is_stmt 0 discriminator 1
 270 00fe 0823     		movs	r3, #8
 271 0100 00E0     		b	.L17
 272              	.L20:
  50:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 	return 0;
 273              		.loc 1 50 0 is_stmt 1
 274 0102 0023     		movs	r3, #0
 275              	.L17:
  51:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** }
 276              		.loc 1 51 0
 277 0104 1800     		movs	r0, r3
 278 0106 BD46     		mov	sp, r7
 279 0108 02B0     		add	sp, sp, #8
 280              		@ sp needed
 281 010a 80BD     		pop	{r7, pc}
 282              	.L22:
 283              		.align	2
 284              	.L21:
 285 010c 110C0240 		.word	1073875985
 286              		.cfi_endproc
 287              	.LFE3:
 289              		.section	.rodata
 290              		.align	2
 291              	.LC0:
 292 0000 01       		.byte	1
 293 0001 02       		.byte	2
 294 0002 03       		.byte	3
 295 0003 0A       		.byte	10
 296 0004 04       		.byte	4
 297 0005 05       		.byte	5
 298 0006 06       		.byte	6
 299 0007 0B       		.byte	11
 300 0008 07       		.byte	7
 301 0009 08       		.byte	8
 302 000a 09       		.byte	9
 303 000b 0C       		.byte	12
 304 000c 0E       		.byte	14
 305 000d 00       		.byte	0
 306 000e 0F       		.byte	15
 307 000f 0D       		.byte	13
 308              		.text
 309              		.align	1
 310              		.global	keyb
 311              		.syntax unified
 312              		.code	16
 313              		.thumb_func
 314              		.fpu softvfp
 316              	keyb:
 317              	.LFB4:
  52:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 
  53:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** unsigned char keyb(void) {
 318              		.loc 1 53 0
 319              		.cfi_startproc
 320              		@ args = 0, pretend = 0, frame = 24
 321              		@ frame_needed = 1, uses_anonymous_args = 0
 322 0110 90B5     		push	{r4, r7, lr}
 323              		.cfi_def_cfa_offset 12
 324              		.cfi_offset 4, -12
 325              		.cfi_offset 7, -8
 326              		.cfi_offset 14, -4
 327 0112 87B0     		sub	sp, sp, #28
 328              		.cfi_def_cfa_offset 40
 329 0114 00AF     		add	r7, sp, #0
 330              		.cfi_def_cfa_register 7
  54:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 	unsigned char keys[] = {0x1,0x2,0x3,0xA,0x4,0x5,0x6,0xB,0x7,0x8,0x9,0xC,0xE,0x0,0xF,0xD};
 331              		.loc 1 54 0
 332 0116 3B1D     		adds	r3, r7, #4
 333 0118 1C4A     		ldr	r2, .L29
 334 011a 13CA     		ldmia	r2!, {r0, r1, r4}
 335 011c 13C3     		stmia	r3!, {r0, r1, r4}
 336 011e 1268     		ldr	r2, [r2]
 337 0120 1A60     		str	r2, [r3]
 338              	.LBB2:
  55:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 	for(char row = 1; row <= 4; row++) {
 339              		.loc 1 55 0
 340 0122 1723     		movs	r3, #23
 341 0124 FB18     		adds	r3, r7, r3
 342 0126 0122     		movs	r2, #1
 343 0128 1A70     		strb	r2, [r3]
 344 012a 24E0     		b	.L24
 345              	.L27:
 346              	.LBB3:
  56:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 		activateRow(row);
 347              		.loc 1 56 0
 348 012c 1723     		movs	r3, #23
 349 012e FB18     		adds	r3, r7, r3
 350 0130 1B78     		ldrb	r3, [r3]
 351 0132 1800     		movs	r0, r3
 352 0134 FFF7FEFF 		bl	activateRow
  57:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 		char column = readColumn();
 353              		.loc 1 57 0
 354 0138 1623     		movs	r3, #22
 355 013a FC18     		adds	r4, r7, r3
 356 013c FFF7FEFF 		bl	readColumn
 357 0140 0300     		movs	r3, r0
 358 0142 2370     		strb	r3, [r4]
  58:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 		if(column != 0) {
 359              		.loc 1 58 0
 360 0144 1623     		movs	r3, #22
 361 0146 FB18     		adds	r3, r7, r3
 362 0148 1B78     		ldrb	r3, [r3]
 363 014a 002B     		cmp	r3, #0
 364 014c 0CD0     		beq	.L25
  59:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 			return keys[4 * (row - 1) + (column -1)];
 365              		.loc 1 59 0
 366 014e 1723     		movs	r3, #23
 367 0150 FB18     		adds	r3, r7, r3
 368 0152 1B78     		ldrb	r3, [r3]
 369 0154 013B     		subs	r3, r3, #1
 370 0156 9A00     		lsls	r2, r3, #2
 371 0158 1623     		movs	r3, #22
 372 015a FB18     		adds	r3, r7, r3
 373 015c 1B78     		ldrb	r3, [r3]
 374 015e 013B     		subs	r3, r3, #1
 375 0160 D318     		adds	r3, r2, r3
 376 0162 3A1D     		adds	r2, r7, #4
 377 0164 D35C     		ldrb	r3, [r2, r3]
 378 0166 0CE0     		b	.L28
 379              	.L25:
 380              	.LBE3:
  55:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 		activateRow(row);
 381              		.loc 1 55 0 discriminator 2
 382 0168 1723     		movs	r3, #23
 383 016a FB18     		adds	r3, r7, r3
 384 016c 1A78     		ldrb	r2, [r3]
 385 016e 1723     		movs	r3, #23
 386 0170 FB18     		adds	r3, r7, r3
 387 0172 0132     		adds	r2, r2, #1
 388 0174 1A70     		strb	r2, [r3]
 389              	.L24:
  55:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 		activateRow(row);
 390              		.loc 1 55 0 is_stmt 0 discriminator 1
 391 0176 1723     		movs	r3, #23
 392 0178 FB18     		adds	r3, r7, r3
 393 017a 1B78     		ldrb	r3, [r3]
 394 017c 042B     		cmp	r3, #4
 395 017e D5D9     		bls	.L27
 396              	.LBE2:
  60:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 		}
  61:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 	}
  62:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 	return 0xFF;
 397              		.loc 1 62 0 is_stmt 1
 398 0180 FF23     		movs	r3, #255
 399              	.L28:
  63:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 	
  64:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** }
 400              		.loc 1 64 0 discriminator 1
 401 0182 1800     		movs	r0, r3
 402 0184 BD46     		mov	sp, r7
 403 0186 07B0     		add	sp, sp, #28
 404              		@ sp needed
 405 0188 90BD     		pop	{r4, r7, pc}
 406              	.L30:
 407 018a C046     		.align	2
 408              	.L29:
 409 018c 00000000 		.word	.LC0
 410              		.cfi_endproc
 411              	.LFE4:
 413              		.align	1
 414              		.global	main
 415              		.syntax unified
 416              		.code	16
 417              		.thumb_func
 418              		.fpu softvfp
 420              	main:
 421              	.LFB5:
  65:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 
  66:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** void main(void) {
 422              		.loc 1 66 0
 423              		.cfi_startproc
 424              		@ args = 0, pretend = 0, frame = 8
 425              		@ frame_needed = 1, uses_anonymous_args = 0
 426 0190 90B5     		push	{r4, r7, lr}
 427              		.cfi_def_cfa_offset 12
 428              		.cfi_offset 4, -12
 429              		.cfi_offset 7, -8
 430              		.cfi_offset 14, -4
 431 0192 83B0     		sub	sp, sp, #12
 432              		.cfi_def_cfa_offset 24
 433 0194 00AF     		add	r7, sp, #0
 434              		.cfi_def_cfa_register 7
  67:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 	app_init();
 435              		.loc 1 67 0
 436 0196 FFF7FEFF 		bl	app_init
 437              	.L32:
 438              	.LBB4:
  68:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 	while(1) {
  69:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 		unsigned char i = keyb();
 439              		.loc 1 69 0 discriminator 1
 440 019a FC1D     		adds	r4, r7, #7
 441 019c FFF7FEFF 		bl	keyb
 442 01a0 0300     		movs	r3, r0
 443 01a2 2370     		strb	r3, [r4]
 444              	.LBE4:
  68:C:/Users/Hampus/Desktop/DAT017/CodeLite/keyboard\startup.c **** 	while(1) {
 445              		.loc 1 68 0 discriminator 1
 446 01a4 F9E7     		b	.L32
 447              		.cfi_endproc
 448              	.LFE5:
 450              	.Letext0:
