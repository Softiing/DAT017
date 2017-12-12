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
  11              		.file	"keypad.c"
  12              		.text
  13              	.Ltext0:
  14              		.cfi_sections	.debug_frame
  15              		.align	1
  16              		.global	activateRow
  17              		.syntax unified
  18              		.code	16
  19              		.thumb_func
  20              		.fpu softvfp
  22              	activateRow:
  23              	.LFB0:
  24              		.file 1 "C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong/keypad.c"
   1:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\keypad.c **** #include "keypad.h"
   2:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\keypad.c **** 
   3:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\keypad.c **** void activateRow(unsigned char row) {
  25              		.loc 1 3 0
  26              		.cfi_startproc
  27              		@ args = 0, pretend = 0, frame = 8
  28              		@ frame_needed = 1, uses_anonymous_args = 0
  29 0000 80B5     		push	{r7, lr}
  30              		.cfi_def_cfa_offset 8
  31              		.cfi_offset 7, -8
  32              		.cfi_offset 14, -4
  33 0002 82B0     		sub	sp, sp, #8
  34              		.cfi_def_cfa_offset 16
  35 0004 00AF     		add	r7, sp, #0
  36              		.cfi_def_cfa_register 7
  37 0006 0200     		movs	r2, r0
  38 0008 FB1D     		adds	r3, r7, #7
  39 000a 1A70     		strb	r2, [r3]
   4:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\keypad.c **** 	switch(row) {
  40              		.loc 1 4 0
  41 000c FB1D     		adds	r3, r7, #7
  42 000e 1B78     		ldrb	r3, [r3]
  43 0010 042B     		cmp	r3, #4
  44 0012 18D8     		bhi	.L9
  45 0014 9A00     		lsls	r2, r3, #2
  46 0016 0E4B     		ldr	r3, .L10
  47 0018 D318     		adds	r3, r2, r3
  48 001a 1B68     		ldr	r3, [r3]
  49 001c 9F46     		mov	pc, r3
  50              		.section	.rodata
  51              		.align	2
  52              	.L4:
  53 0000 1E000000 		.word	.L3
  54 0004 26000000 		.word	.L5
  55 0008 2E000000 		.word	.L6
  56 000c 36000000 		.word	.L7
  57 0010 3E000000 		.word	.L8
  58              		.text
  59              	.L3:
   5:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\keypad.c **** 		case 0: *GPIO_D_ODR_HIGH = 0x00; break;
  60              		.loc 1 5 0
  61 001e 0D4B     		ldr	r3, .L10+4
  62 0020 0022     		movs	r2, #0
  63 0022 1A70     		strb	r2, [r3]
  64 0024 0FE0     		b	.L2
  65              	.L5:
   6:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\keypad.c **** 		case 1: *GPIO_D_ODR_HIGH = 0x10; break;
  66              		.loc 1 6 0
  67 0026 0B4B     		ldr	r3, .L10+4
  68 0028 1022     		movs	r2, #16
  69 002a 1A70     		strb	r2, [r3]
  70 002c 0BE0     		b	.L2
  71              	.L6:
   7:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\keypad.c **** 		case 2: *GPIO_D_ODR_HIGH = 0x20; break;
  72              		.loc 1 7 0
  73 002e 094B     		ldr	r3, .L10+4
  74 0030 2022     		movs	r2, #32
  75 0032 1A70     		strb	r2, [r3]
  76 0034 07E0     		b	.L2
  77              	.L7:
   8:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\keypad.c **** 		case 3: *GPIO_D_ODR_HIGH = 0x40; break;
  78              		.loc 1 8 0
  79 0036 074B     		ldr	r3, .L10+4
  80 0038 4022     		movs	r2, #64
  81 003a 1A70     		strb	r2, [r3]
  82 003c 03E0     		b	.L2
  83              	.L8:
   9:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\keypad.c **** 		case 4: *GPIO_D_ODR_HIGH = 0x80; break;
  84              		.loc 1 9 0
  85 003e 054B     		ldr	r3, .L10+4
  86 0040 8022     		movs	r2, #128
  87 0042 1A70     		strb	r2, [r3]
  88 0044 C046     		nop
  89              	.L2:
  90              	.L9:
  10:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\keypad.c **** 	}
  11:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\keypad.c **** }
  91              		.loc 1 11 0
  92 0046 C046     		nop
  93 0048 BD46     		mov	sp, r7
  94 004a 02B0     		add	sp, sp, #8
  95              		@ sp needed
  96 004c 80BD     		pop	{r7, pc}
  97              	.L11:
  98 004e C046     		.align	2
  99              	.L10:
 100 0050 00000000 		.word	.L4
 101 0054 150C0240 		.word	1073875989
 102              		.cfi_endproc
 103              	.LFE0:
 105              		.align	1
 106              		.global	readColumn
 107              		.syntax unified
 108              		.code	16
 109              		.thumb_func
 110              		.fpu softvfp
 112              	readColumn:
 113              	.LFB1:
  12:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\keypad.c **** 
  13:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\keypad.c **** unsigned char readColumn(void) {
 114              		.loc 1 13 0
 115              		.cfi_startproc
 116              		@ args = 0, pretend = 0, frame = 8
 117              		@ frame_needed = 1, uses_anonymous_args = 0
 118 0058 80B5     		push	{r7, lr}
 119              		.cfi_def_cfa_offset 8
 120              		.cfi_offset 7, -8
 121              		.cfi_offset 14, -4
 122 005a 82B0     		sub	sp, sp, #8
 123              		.cfi_def_cfa_offset 16
 124 005c 00AF     		add	r7, sp, #0
 125              		.cfi_def_cfa_register 7
  14:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\keypad.c **** 	unsigned char idr = *GPIO_D_IDR_HIGH;
 126              		.loc 1 14 0
 127 005e 104A     		ldr	r2, .L18
 128 0060 FB1D     		adds	r3, r7, #7
 129 0062 1278     		ldrb	r2, [r2]
 130 0064 1A70     		strb	r2, [r3]
  15:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\keypad.c **** 	if(idr == 0x01) return 1;
 131              		.loc 1 15 0
 132 0066 FB1D     		adds	r3, r7, #7
 133 0068 1B78     		ldrb	r3, [r3]
 134 006a 012B     		cmp	r3, #1
 135 006c 01D1     		bne	.L13
 136              		.loc 1 15 0 is_stmt 0 discriminator 1
 137 006e 0123     		movs	r3, #1
 138 0070 12E0     		b	.L14
 139              	.L13:
  16:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\keypad.c **** 	if(idr == 0x02) return 2;
 140              		.loc 1 16 0 is_stmt 1
 141 0072 FB1D     		adds	r3, r7, #7
 142 0074 1B78     		ldrb	r3, [r3]
 143 0076 022B     		cmp	r3, #2
 144 0078 01D1     		bne	.L15
 145              		.loc 1 16 0 is_stmt 0 discriminator 1
 146 007a 0223     		movs	r3, #2
 147 007c 0CE0     		b	.L14
 148              	.L15:
  17:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\keypad.c **** 	if(idr == 0x04) return 3;
 149              		.loc 1 17 0 is_stmt 1
 150 007e FB1D     		adds	r3, r7, #7
 151 0080 1B78     		ldrb	r3, [r3]
 152 0082 042B     		cmp	r3, #4
 153 0084 01D1     		bne	.L16
 154              		.loc 1 17 0 is_stmt 0 discriminator 1
 155 0086 0323     		movs	r3, #3
 156 0088 06E0     		b	.L14
 157              	.L16:
  18:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\keypad.c **** 	if(idr == 0x08) return 4;
 158              		.loc 1 18 0 is_stmt 1
 159 008a FB1D     		adds	r3, r7, #7
 160 008c 1B78     		ldrb	r3, [r3]
 161 008e 082B     		cmp	r3, #8
 162 0090 01D1     		bne	.L17
 163              		.loc 1 18 0 is_stmt 0 discriminator 1
 164 0092 0423     		movs	r3, #4
 165 0094 00E0     		b	.L14
 166              	.L17:
  19:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\keypad.c **** 	return 0;
 167              		.loc 1 19 0 is_stmt 1
 168 0096 0023     		movs	r3, #0
 169              	.L14:
  20:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\keypad.c **** }
 170              		.loc 1 20 0
 171 0098 1800     		movs	r0, r3
 172 009a BD46     		mov	sp, r7
 173 009c 02B0     		add	sp, sp, #8
 174              		@ sp needed
 175 009e 80BD     		pop	{r7, pc}
 176              	.L19:
 177              		.align	2
 178              	.L18:
 179 00a0 110C0240 		.word	1073875985
 180              		.cfi_endproc
 181              	.LFE1:
 183              		.section	.rodata
 184              		.align	2
 185              	.LC0:
 186 0014 01       		.byte	1
 187 0015 02       		.byte	2
 188 0016 03       		.byte	3
 189 0017 0A       		.byte	10
 190 0018 04       		.byte	4
 191 0019 05       		.byte	5
 192 001a 06       		.byte	6
 193 001b 0B       		.byte	11
 194 001c 07       		.byte	7
 195 001d 08       		.byte	8
 196 001e 09       		.byte	9
 197 001f 0C       		.byte	12
 198 0020 0E       		.byte	14
 199 0021 00       		.byte	0
 200 0022 0F       		.byte	15
 201 0023 0D       		.byte	13
 202              		.text
 203              		.align	1
 204              		.global	keyb
 205              		.syntax unified
 206              		.code	16
 207              		.thumb_func
 208              		.fpu softvfp
 210              	keyb:
 211              	.LFB2:
  21:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\keypad.c **** 
  22:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\keypad.c **** unsigned char * keyb(void) {
 212              		.loc 1 22 0
 213              		.cfi_startproc
 214              		@ args = 0, pretend = 0, frame = 24
 215              		@ frame_needed = 1, uses_anonymous_args = 0
 216 00a4 90B5     		push	{r4, r7, lr}
 217              		.cfi_def_cfa_offset 12
 218              		.cfi_offset 4, -12
 219              		.cfi_offset 7, -8
 220              		.cfi_offset 14, -4
 221 00a6 87B0     		sub	sp, sp, #28
 222              		.cfi_def_cfa_offset 40
 223 00a8 00AF     		add	r7, sp, #0
 224              		.cfi_def_cfa_register 7
  23:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\keypad.c **** 	unsigned char keys[] = {0x1,0x2,0x3,0xA,0x4,0x5,0x6,0xB,0x7,0x8,0x9,0xC,0xE,0x0,0xF,0xD};
 225              		.loc 1 23 0
 226 00aa 3B1D     		adds	r3, r7, #4
 227 00ac 214A     		ldr	r2, .L25
 228 00ae 13CA     		ldmia	r2!, {r0, r1, r4}
 229 00b0 13C3     		stmia	r3!, {r0, r1, r4}
 230 00b2 1268     		ldr	r2, [r2]
 231 00b4 1A60     		str	r2, [r3]
 232              	.LBB2:
  24:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\keypad.c **** 	static unsigned char returnKeys[4] = {0xFF,0xFF,0xFF,0xFF};
  25:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\keypad.c **** 	for(char row = 1; row <= 4; row++) {
 233              		.loc 1 25 0
 234 00b6 1723     		movs	r3, #23
 235 00b8 FB18     		adds	r3, r7, r3
 236 00ba 0122     		movs	r2, #1
 237 00bc 1A70     		strb	r2, [r3]
 238 00be 2CE0     		b	.L21
 239              	.L23:
 240              	.LBB3:
  26:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\keypad.c **** 		activateRow(row);
 241              		.loc 1 26 0
 242 00c0 1723     		movs	r3, #23
 243 00c2 FB18     		adds	r3, r7, r3
 244 00c4 1B78     		ldrb	r3, [r3]
 245 00c6 1800     		movs	r0, r3
 246 00c8 FFF7FEFF 		bl	activateRow
  27:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\keypad.c **** 		char column = readColumn();
 247              		.loc 1 27 0
 248 00cc 1623     		movs	r3, #22
 249 00ce FC18     		adds	r4, r7, r3
 250 00d0 FFF7FEFF 		bl	readColumn
 251 00d4 0300     		movs	r3, r0
 252 00d6 2370     		strb	r3, [r4]
  28:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\keypad.c **** 		if(column != 0) {
 253              		.loc 1 28 0
 254 00d8 1623     		movs	r3, #22
 255 00da FB18     		adds	r3, r7, r3
 256 00dc 1B78     		ldrb	r3, [r3]
 257 00de 002B     		cmp	r3, #0
 258 00e0 14D0     		beq	.L22
  29:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\keypad.c **** 			activateRow(0);
 259              		.loc 1 29 0
 260 00e2 0020     		movs	r0, #0
 261 00e4 FFF7FEFF 		bl	activateRow
  30:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\keypad.c **** 			returnKeys[row-4] = keys[4 * (row - 1) + (column - 1)];
 262              		.loc 1 30 0
 263 00e8 1723     		movs	r3, #23
 264 00ea FB18     		adds	r3, r7, r3
 265 00ec 1B78     		ldrb	r3, [r3]
 266 00ee 043B     		subs	r3, r3, #4
 267 00f0 1722     		movs	r2, #23
 268 00f2 BA18     		adds	r2, r7, r2
 269 00f4 1278     		ldrb	r2, [r2]
 270 00f6 013A     		subs	r2, r2, #1
 271 00f8 9100     		lsls	r1, r2, #2
 272 00fa 1622     		movs	r2, #22
 273 00fc BA18     		adds	r2, r7, r2
 274 00fe 1278     		ldrb	r2, [r2]
 275 0100 013A     		subs	r2, r2, #1
 276 0102 8A18     		adds	r2, r1, r2
 277 0104 391D     		adds	r1, r7, #4
 278 0106 895C     		ldrb	r1, [r1, r2]
 279 0108 0B4A     		ldr	r2, .L25+4
 280 010a D154     		strb	r1, [r2, r3]
 281              	.L22:
 282              	.LBE3:
  25:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\keypad.c **** 		activateRow(row);
 283              		.loc 1 25 0 discriminator 2
 284 010c 1723     		movs	r3, #23
 285 010e FB18     		adds	r3, r7, r3
 286 0110 1A78     		ldrb	r2, [r3]
 287 0112 1723     		movs	r3, #23
 288 0114 FB18     		adds	r3, r7, r3
 289 0116 0132     		adds	r2, r2, #1
 290 0118 1A70     		strb	r2, [r3]
 291              	.L21:
  25:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\keypad.c **** 		activateRow(row);
 292              		.loc 1 25 0 is_stmt 0 discriminator 1
 293 011a 1723     		movs	r3, #23
 294 011c FB18     		adds	r3, r7, r3
 295 011e 1B78     		ldrb	r3, [r3]
 296 0120 042B     		cmp	r3, #4
 297 0122 CDD9     		bls	.L23
 298              	.LBE2:
  31:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\keypad.c **** 		}
  32:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\keypad.c **** 	}
  33:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\keypad.c **** 	activateRow(0);
 299              		.loc 1 33 0 is_stmt 1
 300 0124 0020     		movs	r0, #0
 301 0126 FFF7FEFF 		bl	activateRow
  34:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\keypad.c **** 	return returnKeys;
 302              		.loc 1 34 0
 303 012a 034B     		ldr	r3, .L25+4
  35:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\keypad.c **** }...
 304              		.loc 1 35 0
 305 012c 1800     		movs	r0, r3
 306 012e BD46     		mov	sp, r7
 307 0130 07B0     		add	sp, sp, #28
 308              		@ sp needed
 309 0132 90BD     		pop	{r4, r7, pc}
 310              	.L26:
 311              		.align	2
 312              	.L25:
 313 0134 14000000 		.word	.LC0
 314 0138 00000000 		.word	returnKeys.4003
 315              		.cfi_endproc
 316              	.LFE2:
 318              		.data
 319              		.align	2
 322              	returnKeys.4003:
 323 0000 FF       		.byte	-1
 324 0001 FF       		.byte	-1
 325 0002 FF       		.byte	-1
 326 0003 FF       		.byte	-1
 327              		.text
 328              	.Letext0:
