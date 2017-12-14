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
  11              		.file	"asciidisplay.c"
  12              		.text
  13              	.Ltext0:
  14              		.cfi_sections	.debug_frame
  15              		.align	1
  16              		.global	ascii_ctrl_bit_set
  17              		.syntax unified
  18              		.code	16
  19              		.thumb_func
  20              		.fpu softvfp
  22              	ascii_ctrl_bit_set:
  23              	.LFB0:
  24              		.file 1 "C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong/asciidisplay.c"
   1:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** #include "timer.h"
   2:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** #include "GPIOE.h"
   3:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** #include "asciidisplay.h"
   4:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** 
   5:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** #define B_E 6
   6:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** #define B_SELECT 2
   7:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** #define B_RW 1
   8:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** #define B_RS 0
   9:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** 
  10:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** void ascii_ctrl_bit_set(unsigned int x) {
  25              		.loc 1 10 0
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
  37 0006 7860     		str	r0, [r7, #4]
  11:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** 	switch(x) {
  38              		.loc 1 11 0
  39 0008 7B68     		ldr	r3, [r7, #4]
  40 000a 072B     		cmp	r3, #7
  41 000c 4ED8     		bhi	.L12
  42 000e 7B68     		ldr	r3, [r7, #4]
  43 0010 9A00     		lsls	r2, r3, #2
  44 0012 284B     		ldr	r3, .L13
  45 0014 D318     		adds	r3, r2, r3
  46 0016 1B68     		ldr	r3, [r3]
  47 0018 9F46     		mov	pc, r3
  48              		.section	.rodata
  49              		.align	2
  50              	.L4:
  51 0000 1A000000 		.word	.L3
  52 0004 2C000000 		.word	.L5
  53 0008 3E000000 		.word	.L6
  54 000c 50000000 		.word	.L7
  55 0010 62000000 		.word	.L8
  56 0014 74000000 		.word	.L9
  57 0018 86000000 		.word	.L10
  58 001c 98000000 		.word	.L11
  59              		.text
  60              	.L3:
  12:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** 		case 0: *GPIO_E_ODR_LOW |= 1; break;
  61              		.loc 1 12 0
  62 001a 274A     		ldr	r2, .L13+4
  63 001c 264B     		ldr	r3, .L13+4
  64 001e 1B78     		ldrb	r3, [r3]
  65 0020 DBB2     		uxtb	r3, r3
  66 0022 0121     		movs	r1, #1
  67 0024 0B43     		orrs	r3, r1
  68 0026 DBB2     		uxtb	r3, r3
  69 0028 1370     		strb	r3, [r2]
  70 002a 3FE0     		b	.L2
  71              	.L5:
  13:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** 		case 1: *GPIO_E_ODR_LOW |= 2; break;
  72              		.loc 1 13 0
  73 002c 224A     		ldr	r2, .L13+4
  74 002e 224B     		ldr	r3, .L13+4
  75 0030 1B78     		ldrb	r3, [r3]
  76 0032 DBB2     		uxtb	r3, r3
  77 0034 0221     		movs	r1, #2
  78 0036 0B43     		orrs	r3, r1
  79 0038 DBB2     		uxtb	r3, r3
  80 003a 1370     		strb	r3, [r2]
  81 003c 36E0     		b	.L2
  82              	.L6:
  14:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** 		case 2: *GPIO_E_ODR_LOW |= 4; break;
  83              		.loc 1 14 0
  84 003e 1E4A     		ldr	r2, .L13+4
  85 0040 1D4B     		ldr	r3, .L13+4
  86 0042 1B78     		ldrb	r3, [r3]
  87 0044 DBB2     		uxtb	r3, r3
  88 0046 0421     		movs	r1, #4
  89 0048 0B43     		orrs	r3, r1
  90 004a DBB2     		uxtb	r3, r3
  91 004c 1370     		strb	r3, [r2]
  92 004e 2DE0     		b	.L2
  93              	.L7:
  15:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** 		case 3: *GPIO_E_ODR_LOW |= 8; break;
  94              		.loc 1 15 0
  95 0050 194A     		ldr	r2, .L13+4
  96 0052 194B     		ldr	r3, .L13+4
  97 0054 1B78     		ldrb	r3, [r3]
  98 0056 DBB2     		uxtb	r3, r3
  99 0058 0821     		movs	r1, #8
 100 005a 0B43     		orrs	r3, r1
 101 005c DBB2     		uxtb	r3, r3
 102 005e 1370     		strb	r3, [r2]
 103 0060 24E0     		b	.L2
 104              	.L8:
  16:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** 		case 4: *GPIO_E_ODR_LOW |= 16; break;
 105              		.loc 1 16 0
 106 0062 154A     		ldr	r2, .L13+4
 107 0064 144B     		ldr	r3, .L13+4
 108 0066 1B78     		ldrb	r3, [r3]
 109 0068 DBB2     		uxtb	r3, r3
 110 006a 1021     		movs	r1, #16
 111 006c 0B43     		orrs	r3, r1
 112 006e DBB2     		uxtb	r3, r3
 113 0070 1370     		strb	r3, [r2]
 114 0072 1BE0     		b	.L2
 115              	.L9:
  17:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** 		case 5: *GPIO_E_ODR_LOW |= 32; break;
 116              		.loc 1 17 0
 117 0074 104A     		ldr	r2, .L13+4
 118 0076 104B     		ldr	r3, .L13+4
 119 0078 1B78     		ldrb	r3, [r3]
 120 007a DBB2     		uxtb	r3, r3
 121 007c 2021     		movs	r1, #32
 122 007e 0B43     		orrs	r3, r1
 123 0080 DBB2     		uxtb	r3, r3
 124 0082 1370     		strb	r3, [r2]
 125 0084 12E0     		b	.L2
 126              	.L10:
  18:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** 		case 6: *GPIO_E_ODR_LOW |= 64; break;
 127              		.loc 1 18 0
 128 0086 0C4A     		ldr	r2, .L13+4
 129 0088 0B4B     		ldr	r3, .L13+4
 130 008a 1B78     		ldrb	r3, [r3]
 131 008c DBB2     		uxtb	r3, r3
 132 008e 4021     		movs	r1, #64
 133 0090 0B43     		orrs	r3, r1
 134 0092 DBB2     		uxtb	r3, r3
 135 0094 1370     		strb	r3, [r2]
 136 0096 09E0     		b	.L2
 137              	.L11:
  19:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** 		case 7: *GPIO_E_ODR_LOW |= 128; break;
 138              		.loc 1 19 0
 139 0098 0749     		ldr	r1, .L13+4
 140 009a 074B     		ldr	r3, .L13+4
 141 009c 1B78     		ldrb	r3, [r3]
 142 009e DBB2     		uxtb	r3, r3
 143 00a0 8022     		movs	r2, #128
 144 00a2 5242     		rsbs	r2, r2, #0
 145 00a4 1343     		orrs	r3, r2
 146 00a6 DBB2     		uxtb	r3, r3
 147 00a8 0B70     		strb	r3, [r1]
 148 00aa C046     		nop
 149              	.L2:
 150              	.L12:
  20:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** 	}
  21:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** }
 151              		.loc 1 21 0
 152 00ac C046     		nop
 153 00ae BD46     		mov	sp, r7
 154 00b0 02B0     		add	sp, sp, #8
 155              		@ sp needed
 156 00b2 80BD     		pop	{r7, pc}
 157              	.L14:
 158              		.align	2
 159              	.L13:
 160 00b4 00000000 		.word	.L4
 161 00b8 14100240 		.word	1073877012
 162              		.cfi_endproc
 163              	.LFE0:
 165              		.align	1
 166              		.global	ascii_ctrl_bit_clear
 167              		.syntax unified
 168              		.code	16
 169              		.thumb_func
 170              		.fpu softvfp
 172              	ascii_ctrl_bit_clear:
 173              	.LFB1:
  22:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** 
  23:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** void ascii_ctrl_bit_clear(unsigned int x) {
 174              		.loc 1 23 0
 175              		.cfi_startproc
 176              		@ args = 0, pretend = 0, frame = 8
 177              		@ frame_needed = 1, uses_anonymous_args = 0
 178 00bc 80B5     		push	{r7, lr}
 179              		.cfi_def_cfa_offset 8
 180              		.cfi_offset 7, -8
 181              		.cfi_offset 14, -4
 182 00be 82B0     		sub	sp, sp, #8
 183              		.cfi_def_cfa_offset 16
 184 00c0 00AF     		add	r7, sp, #0
 185              		.cfi_def_cfa_register 7
 186 00c2 7860     		str	r0, [r7, #4]
  24:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** 	switch(x) {
 187              		.loc 1 24 0
 188 00c4 7B68     		ldr	r3, [r7, #4]
 189 00c6 072B     		cmp	r3, #7
 190 00c8 4DD8     		bhi	.L26
 191 00ca 7B68     		ldr	r3, [r7, #4]
 192 00cc 9A00     		lsls	r2, r3, #2
 193 00ce 284B     		ldr	r3, .L27
 194 00d0 D318     		adds	r3, r2, r3
 195 00d2 1B68     		ldr	r3, [r3]
 196 00d4 9F46     		mov	pc, r3
 197              		.section	.rodata
 198              		.align	2
 199              	.L18:
 200 0020 D6000000 		.word	.L17
 201 0024 E8000000 		.word	.L19
 202 0028 FA000000 		.word	.L20
 203 002c 0C010000 		.word	.L21
 204 0030 1E010000 		.word	.L22
 205 0034 30010000 		.word	.L23
 206 0038 42010000 		.word	.L24
 207 003c 54010000 		.word	.L25
 208              		.text
 209              	.L17:
  25:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** 		case(0): *GPIO_E_ODR_LOW &= 0xFE; break;
 210              		.loc 1 25 0
 211 00d6 274A     		ldr	r2, .L27+4
 212 00d8 264B     		ldr	r3, .L27+4
 213 00da 1B78     		ldrb	r3, [r3]
 214 00dc DBB2     		uxtb	r3, r3
 215 00de 0121     		movs	r1, #1
 216 00e0 8B43     		bics	r3, r1
 217 00e2 DBB2     		uxtb	r3, r3
 218 00e4 1370     		strb	r3, [r2]
 219 00e6 3EE0     		b	.L16
 220              	.L19:
  26:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** 		case(1): *GPIO_E_ODR_LOW &= 0xFD; break;
 221              		.loc 1 26 0
 222 00e8 224A     		ldr	r2, .L27+4
 223 00ea 224B     		ldr	r3, .L27+4
 224 00ec 1B78     		ldrb	r3, [r3]
 225 00ee DBB2     		uxtb	r3, r3
 226 00f0 0221     		movs	r1, #2
 227 00f2 8B43     		bics	r3, r1
 228 00f4 DBB2     		uxtb	r3, r3
 229 00f6 1370     		strb	r3, [r2]
 230 00f8 35E0     		b	.L16
 231              	.L20:
  27:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** 		case(2): *GPIO_E_ODR_LOW &= 0xFB; break;
 232              		.loc 1 27 0
 233 00fa 1E4A     		ldr	r2, .L27+4
 234 00fc 1D4B     		ldr	r3, .L27+4
 235 00fe 1B78     		ldrb	r3, [r3]
 236 0100 DBB2     		uxtb	r3, r3
 237 0102 0421     		movs	r1, #4
 238 0104 8B43     		bics	r3, r1
 239 0106 DBB2     		uxtb	r3, r3
 240 0108 1370     		strb	r3, [r2]
 241 010a 2CE0     		b	.L16
 242              	.L21:
  28:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** 		case(3): *GPIO_E_ODR_LOW &= 0xF7; break;
 243              		.loc 1 28 0
 244 010c 194A     		ldr	r2, .L27+4
 245 010e 194B     		ldr	r3, .L27+4
 246 0110 1B78     		ldrb	r3, [r3]
 247 0112 DBB2     		uxtb	r3, r3
 248 0114 0821     		movs	r1, #8
 249 0116 8B43     		bics	r3, r1
 250 0118 DBB2     		uxtb	r3, r3
 251 011a 1370     		strb	r3, [r2]
 252 011c 23E0     		b	.L16
 253              	.L22:
  29:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** 		case(4): *GPIO_E_ODR_LOW &= 0xEF; break;
 254              		.loc 1 29 0
 255 011e 154A     		ldr	r2, .L27+4
 256 0120 144B     		ldr	r3, .L27+4
 257 0122 1B78     		ldrb	r3, [r3]
 258 0124 DBB2     		uxtb	r3, r3
 259 0126 1021     		movs	r1, #16
 260 0128 8B43     		bics	r3, r1
 261 012a DBB2     		uxtb	r3, r3
 262 012c 1370     		strb	r3, [r2]
 263 012e 1AE0     		b	.L16
 264              	.L23:
  30:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** 		case(5): *GPIO_E_ODR_LOW &= 0xDF; break;
 265              		.loc 1 30 0
 266 0130 104A     		ldr	r2, .L27+4
 267 0132 104B     		ldr	r3, .L27+4
 268 0134 1B78     		ldrb	r3, [r3]
 269 0136 DBB2     		uxtb	r3, r3
 270 0138 2021     		movs	r1, #32
 271 013a 8B43     		bics	r3, r1
 272 013c DBB2     		uxtb	r3, r3
 273 013e 1370     		strb	r3, [r2]
 274 0140 11E0     		b	.L16
 275              	.L24:
  31:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** 		case(6): *GPIO_E_ODR_LOW &= 0xBF; break;
 276              		.loc 1 31 0
 277 0142 0C4A     		ldr	r2, .L27+4
 278 0144 0B4B     		ldr	r3, .L27+4
 279 0146 1B78     		ldrb	r3, [r3]
 280 0148 DBB2     		uxtb	r3, r3
 281 014a 4021     		movs	r1, #64
 282 014c 8B43     		bics	r3, r1
 283 014e DBB2     		uxtb	r3, r3
 284 0150 1370     		strb	r3, [r2]
 285 0152 08E0     		b	.L16
 286              	.L25:
  32:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** 		case(7): *GPIO_E_ODR_LOW &= 0x7F; break;
 287              		.loc 1 32 0
 288 0154 074A     		ldr	r2, .L27+4
 289 0156 074B     		ldr	r3, .L27+4
 290 0158 1B78     		ldrb	r3, [r3]
 291 015a DBB2     		uxtb	r3, r3
 292 015c 7F21     		movs	r1, #127
 293 015e 0B40     		ands	r3, r1
 294 0160 DBB2     		uxtb	r3, r3
 295 0162 1370     		strb	r3, [r2]
 296 0164 C046     		nop
 297              	.L16:
 298              	.L26:
  33:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** 	}
  34:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** }
 299              		.loc 1 34 0
 300 0166 C046     		nop
 301 0168 BD46     		mov	sp, r7
 302 016a 02B0     		add	sp, sp, #8
 303              		@ sp needed
 304 016c 80BD     		pop	{r7, pc}
 305              	.L28:
 306 016e C046     		.align	2
 307              	.L27:
 308 0170 20000000 		.word	.L18
 309 0174 14100240 		.word	1073877012
 310              		.cfi_endproc
 311              	.LFE1:
 313              		.align	1
 314              		.global	ascii_write_controller
 315              		.syntax unified
 316              		.code	16
 317              		.thumb_func
 318              		.fpu softvfp
 320              	ascii_write_controller:
 321              	.LFB2:
  35:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** 
  36:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** void ascii_write_controller(unsigned char byte) {
 322              		.loc 1 36 0
 323              		.cfi_startproc
 324              		@ args = 0, pretend = 0, frame = 8
 325              		@ frame_needed = 1, uses_anonymous_args = 0
 326 0178 80B5     		push	{r7, lr}
 327              		.cfi_def_cfa_offset 8
 328              		.cfi_offset 7, -8
 329              		.cfi_offset 14, -4
 330 017a 82B0     		sub	sp, sp, #8
 331              		.cfi_def_cfa_offset 16
 332 017c 00AF     		add	r7, sp, #0
 333              		.cfi_def_cfa_register 7
 334 017e 0200     		movs	r2, r0
 335 0180 FB1D     		adds	r3, r7, #7
 336 0182 1A70     		strb	r2, [r3]
  37:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** 	ascii_ctrl_bit_set(B_E);
 337              		.loc 1 37 0
 338 0184 0620     		movs	r0, #6
 339 0186 FFF7FEFF 		bl	ascii_ctrl_bit_set
  38:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** 	*GPIO_E_ODR_HIGH = byte;
 340              		.loc 1 38 0
 341 018a 064A     		ldr	r2, .L30
 342 018c FB1D     		adds	r3, r7, #7
 343 018e 1B78     		ldrb	r3, [r3]
 344 0190 1370     		strb	r3, [r2]
  39:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** 	delay_250ns();
 345              		.loc 1 39 0
 346 0192 FFF7FEFF 		bl	delay_250ns
  40:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** 	ascii_ctrl_bit_clear(B_E);
 347              		.loc 1 40 0
 348 0196 0620     		movs	r0, #6
 349 0198 FFF7FEFF 		bl	ascii_ctrl_bit_clear
  41:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** }
 350              		.loc 1 41 0
 351 019c C046     		nop
 352 019e BD46     		mov	sp, r7
 353 01a0 02B0     		add	sp, sp, #8
 354              		@ sp needed
 355 01a2 80BD     		pop	{r7, pc}
 356              	.L31:
 357              		.align	2
 358              	.L30:
 359 01a4 15100240 		.word	1073877013
 360              		.cfi_endproc
 361              	.LFE2:
 363              		.align	1
 364              		.global	ascii_read_controller
 365              		.syntax unified
 366              		.code	16
 367              		.thumb_func
 368              		.fpu softvfp
 370              	ascii_read_controller:
 371              	.LFB3:
  42:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** 
  43:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** unsigned char ascii_read_controller() {
 372              		.loc 1 43 0
 373              		.cfi_startproc
 374              		@ args = 0, pretend = 0, frame = 8
 375              		@ frame_needed = 1, uses_anonymous_args = 0
 376 01a8 80B5     		push	{r7, lr}
 377              		.cfi_def_cfa_offset 8
 378              		.cfi_offset 7, -8
 379              		.cfi_offset 14, -4
 380 01aa 82B0     		sub	sp, sp, #8
 381              		.cfi_def_cfa_offset 16
 382 01ac 00AF     		add	r7, sp, #0
 383              		.cfi_def_cfa_register 7
  44:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** 	ascii_ctrl_bit_set(B_E);
 384              		.loc 1 44 0
 385 01ae 0620     		movs	r0, #6
 386 01b0 FFF7FEFF 		bl	ascii_ctrl_bit_set
  45:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** 	delay_250ns();
 387              		.loc 1 45 0
 388 01b4 FFF7FEFF 		bl	delay_250ns
  46:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** 	delay_250ns();
 389              		.loc 1 46 0
 390 01b8 FFF7FEFF 		bl	delay_250ns
  47:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** 	unsigned char rv = *GPIO_E_IDR_HIGH;
 391              		.loc 1 47 0
 392 01bc 064A     		ldr	r2, .L34
 393 01be FB1D     		adds	r3, r7, #7
 394 01c0 1278     		ldrb	r2, [r2]
 395 01c2 1A70     		strb	r2, [r3]
  48:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** 	ascii_ctrl_bit_clear(B_E);
 396              		.loc 1 48 0
 397 01c4 0620     		movs	r0, #6
 398 01c6 FFF7FEFF 		bl	ascii_ctrl_bit_clear
  49:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** 	return rv;
 399              		.loc 1 49 0
 400 01ca FB1D     		adds	r3, r7, #7
 401 01cc 1B78     		ldrb	r3, [r3]
  50:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** }
 402              		.loc 1 50 0
 403 01ce 1800     		movs	r0, r3
 404 01d0 BD46     		mov	sp, r7
 405 01d2 02B0     		add	sp, sp, #8
 406              		@ sp needed
 407 01d4 80BD     		pop	{r7, pc}
 408              	.L35:
 409 01d6 C046     		.align	2
 410              	.L34:
 411 01d8 11100240 		.word	1073877009
 412              		.cfi_endproc
 413              	.LFE3:
 415              		.align	1
 416              		.global	ascii_write_cmd
 417              		.syntax unified
 418              		.code	16
 419              		.thumb_func
 420              		.fpu softvfp
 422              	ascii_write_cmd:
 423              	.LFB4:
  51:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** 
  52:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** void ascii_write_cmd(unsigned char command) {
 424              		.loc 1 52 0
 425              		.cfi_startproc
 426              		@ args = 0, pretend = 0, frame = 8
 427              		@ frame_needed = 1, uses_anonymous_args = 0
 428 01dc 80B5     		push	{r7, lr}
 429              		.cfi_def_cfa_offset 8
 430              		.cfi_offset 7, -8
 431              		.cfi_offset 14, -4
 432 01de 82B0     		sub	sp, sp, #8
 433              		.cfi_def_cfa_offset 16
 434 01e0 00AF     		add	r7, sp, #0
 435              		.cfi_def_cfa_register 7
 436 01e2 0200     		movs	r2, r0
 437 01e4 FB1D     		adds	r3, r7, #7
 438 01e6 1A70     		strb	r2, [r3]
  53:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** 	ascii_ctrl_bit_clear(B_RS);
 439              		.loc 1 53 0
 440 01e8 0020     		movs	r0, #0
 441 01ea FFF7FEFF 		bl	ascii_ctrl_bit_clear
  54:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** 	ascii_ctrl_bit_clear(B_RW);
 442              		.loc 1 54 0
 443 01ee 0120     		movs	r0, #1
 444 01f0 FFF7FEFF 		bl	ascii_ctrl_bit_clear
  55:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** 	ascii_write_controller(command);
 445              		.loc 1 55 0
 446 01f4 FB1D     		adds	r3, r7, #7
 447 01f6 1B78     		ldrb	r3, [r3]
 448 01f8 1800     		movs	r0, r3
 449 01fa FFF7FEFF 		bl	ascii_write_controller
  56:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** }
 450              		.loc 1 56 0
 451 01fe C046     		nop
 452 0200 BD46     		mov	sp, r7
 453 0202 02B0     		add	sp, sp, #8
 454              		@ sp needed
 455 0204 80BD     		pop	{r7, pc}
 456              		.cfi_endproc
 457              	.LFE4:
 459              		.align	1
 460              		.global	ascii_write_data
 461              		.syntax unified
 462              		.code	16
 463              		.thumb_func
 464              		.fpu softvfp
 466              	ascii_write_data:
 467              	.LFB5:
  57:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** 
  58:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** void ascii_write_data(unsigned char data) {
 468              		.loc 1 58 0
 469              		.cfi_startproc
 470              		@ args = 0, pretend = 0, frame = 8
 471              		@ frame_needed = 1, uses_anonymous_args = 0
 472 0206 80B5     		push	{r7, lr}
 473              		.cfi_def_cfa_offset 8
 474              		.cfi_offset 7, -8
 475              		.cfi_offset 14, -4
 476 0208 82B0     		sub	sp, sp, #8
 477              		.cfi_def_cfa_offset 16
 478 020a 00AF     		add	r7, sp, #0
 479              		.cfi_def_cfa_register 7
 480 020c 0200     		movs	r2, r0
 481 020e FB1D     		adds	r3, r7, #7
 482 0210 1A70     		strb	r2, [r3]
  59:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** 	ascii_ctrl_bit_set(B_RS);
 483              		.loc 1 59 0
 484 0212 0020     		movs	r0, #0
 485 0214 FFF7FEFF 		bl	ascii_ctrl_bit_set
  60:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** 	ascii_ctrl_bit_clear(B_RW);
 486              		.loc 1 60 0
 487 0218 0120     		movs	r0, #1
 488 021a FFF7FEFF 		bl	ascii_ctrl_bit_clear
  61:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** 	ascii_write_controller(data);
 489              		.loc 1 61 0
 490 021e FB1D     		adds	r3, r7, #7
 491 0220 1B78     		ldrb	r3, [r3]
 492 0222 1800     		movs	r0, r3
 493 0224 FFF7FEFF 		bl	ascii_write_controller
  62:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** }
 494              		.loc 1 62 0
 495 0228 C046     		nop
 496 022a BD46     		mov	sp, r7
 497 022c 02B0     		add	sp, sp, #8
 498              		@ sp needed
 499 022e 80BD     		pop	{r7, pc}
 500              		.cfi_endproc
 501              	.LFE5:
 503              		.align	1
 504              		.global	ascii_read_status
 505              		.syntax unified
 506              		.code	16
 507              		.thumb_func
 508              		.fpu softvfp
 510              	ascii_read_status:
 511              	.LFB6:
  63:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** 
  64:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** unsigned char ascii_read_status(void) {
 512              		.loc 1 64 0
 513              		.cfi_startproc
 514              		@ args = 0, pretend = 0, frame = 8
 515              		@ frame_needed = 1, uses_anonymous_args = 0
 516 0230 90B5     		push	{r4, r7, lr}
 517              		.cfi_def_cfa_offset 12
 518              		.cfi_offset 4, -12
 519              		.cfi_offset 7, -8
 520              		.cfi_offset 14, -4
 521 0232 83B0     		sub	sp, sp, #12
 522              		.cfi_def_cfa_offset 24
 523 0234 00AF     		add	r7, sp, #0
 524              		.cfi_def_cfa_register 7
  65:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** 	*GPIO_E_MODER &= 0x0000FFFF;	
 525              		.loc 1 65 0
 526 0236 114B     		ldr	r3, .L40
 527 0238 104A     		ldr	r2, .L40
 528 023a 1268     		ldr	r2, [r2]
 529 023c 1204     		lsls	r2, r2, #16
 530 023e 120C     		lsrs	r2, r2, #16
 531 0240 1A60     		str	r2, [r3]
  66:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** 	ascii_ctrl_bit_clear(B_RS);
 532              		.loc 1 66 0
 533 0242 0020     		movs	r0, #0
 534 0244 FFF7FEFF 		bl	ascii_ctrl_bit_clear
  67:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** 	ascii_ctrl_bit_set(B_RW);
 535              		.loc 1 67 0
 536 0248 0120     		movs	r0, #1
 537 024a FFF7FEFF 		bl	ascii_ctrl_bit_set
  68:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** 	unsigned char rv = ascii_read_controller();
 538              		.loc 1 68 0
 539 024e FC1D     		adds	r4, r7, #7
 540 0250 FFF7FEFF 		bl	ascii_read_controller
 541 0254 0300     		movs	r3, r0
 542 0256 2370     		strb	r3, [r4]
  69:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** 	*GPIO_E_MODER &= 0x0000FFFF;
 543              		.loc 1 69 0
 544 0258 084B     		ldr	r3, .L40
 545 025a 084A     		ldr	r2, .L40
 546 025c 1268     		ldr	r2, [r2]
 547 025e 1204     		lsls	r2, r2, #16
 548 0260 120C     		lsrs	r2, r2, #16
 549 0262 1A60     		str	r2, [r3]
  70:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** 	*GPIO_E_MODER |= 0x55550000;	
 550              		.loc 1 70 0
 551 0264 054B     		ldr	r3, .L40
 552 0266 054A     		ldr	r2, .L40
 553 0268 1268     		ldr	r2, [r2]
 554 026a 0549     		ldr	r1, .L40+4
 555 026c 0A43     		orrs	r2, r1
 556 026e 1A60     		str	r2, [r3]
  71:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** 	return rv;
 557              		.loc 1 71 0
 558 0270 FB1D     		adds	r3, r7, #7
 559 0272 1B78     		ldrb	r3, [r3]
  72:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** }
 560              		.loc 1 72 0
 561 0274 1800     		movs	r0, r3
 562 0276 BD46     		mov	sp, r7
 563 0278 03B0     		add	sp, sp, #12
 564              		@ sp needed
 565 027a 90BD     		pop	{r4, r7, pc}
 566              	.L41:
 567              		.align	2
 568              	.L40:
 569 027c 00100240 		.word	1073876992
 570 0280 00005555 		.word	1431633920
 571              		.cfi_endproc
 572              	.LFE6:
 574              		.align	1
 575              		.global	ascii_read_data
 576              		.syntax unified
 577              		.code	16
 578              		.thumb_func
 579              		.fpu softvfp
 581              	ascii_read_data:
 582              	.LFB7:
  73:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** 
  74:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** unsigned char ascii_read_data(void) {
 583              		.loc 1 74 0
 584              		.cfi_startproc
 585              		@ args = 0, pretend = 0, frame = 8
 586              		@ frame_needed = 1, uses_anonymous_args = 0
 587 0284 90B5     		push	{r4, r7, lr}
 588              		.cfi_def_cfa_offset 12
 589              		.cfi_offset 4, -12
 590              		.cfi_offset 7, -8
 591              		.cfi_offset 14, -4
 592 0286 83B0     		sub	sp, sp, #12
 593              		.cfi_def_cfa_offset 24
 594 0288 00AF     		add	r7, sp, #0
 595              		.cfi_def_cfa_register 7
  75:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** 	*GPIO_E_MODER &= 0x0000FFFF;	
 596              		.loc 1 75 0
 597 028a 114B     		ldr	r3, .L44
 598 028c 104A     		ldr	r2, .L44
 599 028e 1268     		ldr	r2, [r2]
 600 0290 1204     		lsls	r2, r2, #16
 601 0292 120C     		lsrs	r2, r2, #16
 602 0294 1A60     		str	r2, [r3]
  76:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** 	ascii_ctrl_bit_set(B_RS);
 603              		.loc 1 76 0
 604 0296 0020     		movs	r0, #0
 605 0298 FFF7FEFF 		bl	ascii_ctrl_bit_set
  77:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** 	ascii_ctrl_bit_set(B_RW);
 606              		.loc 1 77 0
 607 029c 0120     		movs	r0, #1
 608 029e FFF7FEFF 		bl	ascii_ctrl_bit_set
  78:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** 	unsigned char rv = ascii_read_controller();
 609              		.loc 1 78 0
 610 02a2 FC1D     		adds	r4, r7, #7
 611 02a4 FFF7FEFF 		bl	ascii_read_controller
 612 02a8 0300     		movs	r3, r0
 613 02aa 2370     		strb	r3, [r4]
  79:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** 	*GPIO_E_MODER &= 0x0000FFFF;
 614              		.loc 1 79 0
 615 02ac 084B     		ldr	r3, .L44
 616 02ae 084A     		ldr	r2, .L44
 617 02b0 1268     		ldr	r2, [r2]
 618 02b2 1204     		lsls	r2, r2, #16
 619 02b4 120C     		lsrs	r2, r2, #16
 620 02b6 1A60     		str	r2, [r3]
  80:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** 	*GPIO_E_MODER |= 0x55550000;	
 621              		.loc 1 80 0
 622 02b8 054B     		ldr	r3, .L44
 623 02ba 054A     		ldr	r2, .L44
 624 02bc 1268     		ldr	r2, [r2]
 625 02be 0549     		ldr	r1, .L44+4
 626 02c0 0A43     		orrs	r2, r1
 627 02c2 1A60     		str	r2, [r3]
  81:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** 	return rv;
 628              		.loc 1 81 0
 629 02c4 FB1D     		adds	r3, r7, #7
 630 02c6 1B78     		ldrb	r3, [r3]
  82:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** }
 631              		.loc 1 82 0
 632 02c8 1800     		movs	r0, r3
 633 02ca BD46     		mov	sp, r7
 634 02cc 03B0     		add	sp, sp, #12
 635              		@ sp needed
 636 02ce 90BD     		pop	{r4, r7, pc}
 637              	.L45:
 638              		.align	2
 639              	.L44:
 640 02d0 00100240 		.word	1073876992
 641 02d4 00005555 		.word	1431633920
 642              		.cfi_endproc
 643              	.LFE7:
 645              		.align	1
 646              		.global	ascii_command
 647              		.syntax unified
 648              		.code	16
 649              		.thumb_func
 650              		.fpu softvfp
 652              	ascii_command:
 653              	.LFB8:
  83:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** 
  84:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** void ascii_command(char command, unsigned int delayMicro) {
 654              		.loc 1 84 0
 655              		.cfi_startproc
 656              		@ args = 0, pretend = 0, frame = 8
 657              		@ frame_needed = 1, uses_anonymous_args = 0
 658 02d8 80B5     		push	{r7, lr}
 659              		.cfi_def_cfa_offset 8
 660              		.cfi_offset 7, -8
 661              		.cfi_offset 14, -4
 662 02da 82B0     		sub	sp, sp, #8
 663              		.cfi_def_cfa_offset 16
 664 02dc 00AF     		add	r7, sp, #0
 665              		.cfi_def_cfa_register 7
 666 02de 0200     		movs	r2, r0
 667 02e0 3960     		str	r1, [r7]
 668 02e2 FB1D     		adds	r3, r7, #7
 669 02e4 1A70     		strb	r2, [r3]
  85:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** 	while((ascii_read_status() & 0x80) == 0x80) {
 670              		.loc 1 85 0
 671 02e6 C046     		nop
 672              	.L47:
 673              		.loc 1 85 0 is_stmt 0 discriminator 1
 674 02e8 FFF7FEFF 		bl	ascii_read_status
 675 02ec 0300     		movs	r3, r0
 676 02ee 1A00     		movs	r2, r3
 677 02f0 8023     		movs	r3, #128
 678 02f2 1340     		ands	r3, r2
 679 02f4 802B     		cmp	r3, #128
 680 02f6 F7D0     		beq	.L47
  86:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** 		// Do nothing, wait for status flag
  87:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** 	}
  88:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** 	delay_micro(8);
 681              		.loc 1 88 0 is_stmt 1
 682 02f8 0820     		movs	r0, #8
 683 02fa FFF7FEFF 		bl	delay_micro
  89:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** 	ascii_write_cmd(command);
 684              		.loc 1 89 0
 685 02fe FB1D     		adds	r3, r7, #7
 686 0300 1B78     		ldrb	r3, [r3]
 687 0302 1800     		movs	r0, r3
 688 0304 FFF7FEFF 		bl	ascii_write_cmd
  90:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** 	delay_micro(delayMicro);
 689              		.loc 1 90 0
 690 0308 3B68     		ldr	r3, [r7]
 691 030a 1800     		movs	r0, r3
 692 030c FFF7FEFF 		bl	delay_micro
  91:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** }
 693              		.loc 1 91 0
 694 0310 C046     		nop
 695 0312 BD46     		mov	sp, r7
 696 0314 02B0     		add	sp, sp, #8
 697              		@ sp needed
 698 0316 80BD     		pop	{r7, pc}
 699              		.cfi_endproc
 700              	.LFE8:
 702              		.align	1
 703              		.global	ascii_init
 704              		.syntax unified
 705              		.code	16
 706              		.thumb_func
 707              		.fpu softvfp
 709              	ascii_init:
 710              	.LFB9:
  92:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** 
  93:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** void ascii_init(void) {
 711              		.loc 1 93 0
 712              		.cfi_startproc
 713              		@ args = 0, pretend = 0, frame = 0
 714              		@ frame_needed = 1, uses_anonymous_args = 0
 715 0318 80B5     		push	{r7, lr}
 716              		.cfi_def_cfa_offset 8
 717              		.cfi_offset 7, -8
 718              		.cfi_offset 14, -4
 719 031a 00AF     		add	r7, sp, #0
 720              		.cfi_def_cfa_register 7
  94:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** 	ascii_ctrl_bit_set(B_SELECT);
 721              		.loc 1 94 0
 722 031c 0220     		movs	r0, #2
 723 031e FFF7FEFF 		bl	ascii_ctrl_bit_set
  95:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** 	ascii_command(0x38, 40); // Set display size and font size
 724              		.loc 1 95 0
 725 0322 2821     		movs	r1, #40
 726 0324 3820     		movs	r0, #56
 727 0326 FFF7FEFF 		bl	ascii_command
  96:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c ****     ascii_command(0xE, 40); // Set display, cursor on
 728              		.loc 1 96 0
 729 032a 2821     		movs	r1, #40
 730 032c 0E20     		movs	r0, #14
 731 032e FFF7FEFF 		bl	ascii_command
  97:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** 	ascii_command(0x01, 1530); // Clear display
 732              		.loc 1 97 0
 733 0332 064B     		ldr	r3, .L49
 734 0334 1900     		movs	r1, r3
 735 0336 0120     		movs	r0, #1
 736 0338 FFF7FEFF 		bl	ascii_command
  98:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c ****     ascii_command(0x6, 40); // Inc, no shift
 737              		.loc 1 98 0
 738 033c 2821     		movs	r1, #40
 739 033e 0620     		movs	r0, #6
 740 0340 FFF7FEFF 		bl	ascii_command
  99:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** }
 741              		.loc 1 99 0
 742 0344 C046     		nop
 743 0346 BD46     		mov	sp, r7
 744              		@ sp needed
 745 0348 80BD     		pop	{r7, pc}
 746              	.L50:
 747 034a C046     		.align	2
 748              	.L49:
 749 034c FA050000 		.word	1530
 750              		.cfi_endproc
 751              	.LFE9:
 753              		.align	1
 754              		.global	ascii_write_char
 755              		.syntax unified
 756              		.code	16
 757              		.thumb_func
 758              		.fpu softvfp
 760              	ascii_write_char:
 761              	.LFB10:
 100:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** 
 101:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** void ascii_write_char(unsigned char charToWrite) {
 762              		.loc 1 101 0
 763              		.cfi_startproc
 764              		@ args = 0, pretend = 0, frame = 8
 765              		@ frame_needed = 1, uses_anonymous_args = 0
 766 0350 80B5     		push	{r7, lr}
 767              		.cfi_def_cfa_offset 8
 768              		.cfi_offset 7, -8
 769              		.cfi_offset 14, -4
 770 0352 82B0     		sub	sp, sp, #8
 771              		.cfi_def_cfa_offset 16
 772 0354 00AF     		add	r7, sp, #0
 773              		.cfi_def_cfa_register 7
 774 0356 0200     		movs	r2, r0
 775 0358 FB1D     		adds	r3, r7, #7
 776 035a 1A70     		strb	r2, [r3]
 102:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** 	while((ascii_read_status() & 0x80) == 0x80) {
 777              		.loc 1 102 0
 778 035c C046     		nop
 779              	.L52:
 780              		.loc 1 102 0 is_stmt 0 discriminator 1
 781 035e FFF7FEFF 		bl	ascii_read_status
 782 0362 0300     		movs	r3, r0
 783 0364 1A00     		movs	r2, r3
 784 0366 8023     		movs	r3, #128
 785 0368 1340     		ands	r3, r2
 786 036a 802B     		cmp	r3, #128
 787 036c F7D0     		beq	.L52
 103:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** 	// Do nothing, wait for status flag
 104:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c ****     }
 105:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** 	delay_micro(8);
 788              		.loc 1 105 0 is_stmt 1
 789 036e 0820     		movs	r0, #8
 790 0370 FFF7FEFF 		bl	delay_micro
 106:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c ****     ascii_write_data(charToWrite);
 791              		.loc 1 106 0
 792 0374 FB1D     		adds	r3, r7, #7
 793 0376 1B78     		ldrb	r3, [r3]
 794 0378 1800     		movs	r0, r3
 795 037a FFF7FEFF 		bl	ascii_write_data
 107:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c ****     delay_micro(45);
 796              		.loc 1 107 0
 797 037e 2D20     		movs	r0, #45
 798 0380 FFF7FEFF 		bl	delay_micro
 108:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** }
 799              		.loc 1 108 0
 800 0384 C046     		nop
 801 0386 BD46     		mov	sp, r7
 802 0388 02B0     		add	sp, sp, #8
 803              		@ sp needed
 804 038a 80BD     		pop	{r7, pc}
 805              		.cfi_endproc
 806              	.LFE10:
 808              		.align	1
 809              		.global	goToXY
 810              		.syntax unified
 811              		.code	16
 812              		.thumb_func
 813              		.fpu softvfp
 815              	goToXY:
 816              	.LFB11:
 109:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** 
 110:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** void goToXY(unsigned char row, unsigned char column) {
 817              		.loc 1 110 0
 818              		.cfi_startproc
 819              		@ args = 0, pretend = 0, frame = 16
 820              		@ frame_needed = 1, uses_anonymous_args = 0
 821 038c 80B5     		push	{r7, lr}
 822              		.cfi_def_cfa_offset 8
 823              		.cfi_offset 7, -8
 824              		.cfi_offset 14, -4
 825 038e 84B0     		sub	sp, sp, #16
 826              		.cfi_def_cfa_offset 24
 827 0390 00AF     		add	r7, sp, #0
 828              		.cfi_def_cfa_register 7
 829 0392 0200     		movs	r2, r0
 830 0394 FB1D     		adds	r3, r7, #7
 831 0396 1A70     		strb	r2, [r3]
 832 0398 BB1D     		adds	r3, r7, #6
 833 039a 0A1C     		adds	r2, r1, #0
 834 039c 1A70     		strb	r2, [r3]
 111:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** 	unsigned char address = row - 1;
 835              		.loc 1 111 0
 836 039e 0F23     		movs	r3, #15
 837 03a0 FB18     		adds	r3, r7, r3
 838 03a2 FA1D     		adds	r2, r7, #7
 839 03a4 1278     		ldrb	r2, [r2]
 840 03a6 013A     		subs	r2, r2, #1
 841 03a8 1A70     		strb	r2, [r3]
 112:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** 	if(column == 2) {
 842              		.loc 1 112 0
 843 03aa BB1D     		adds	r3, r7, #6
 844 03ac 1B78     		ldrb	r3, [r3]
 845 03ae 022B     		cmp	r3, #2
 846 03b0 06D1     		bne	.L54
 113:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** 		address = address + 0x40;
 847              		.loc 1 113 0
 848 03b2 0F23     		movs	r3, #15
 849 03b4 FB18     		adds	r3, r7, r3
 850 03b6 0F22     		movs	r2, #15
 851 03b8 BA18     		adds	r2, r7, r2
 852 03ba 1278     		ldrb	r2, [r2]
 853 03bc 4032     		adds	r2, r2, #64
 854 03be 1A70     		strb	r2, [r3]
 855              	.L54:
 114:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** 	}
 115:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** 	ascii_write_cmd(0x80 | address);
 856              		.loc 1 115 0
 857 03c0 0F23     		movs	r3, #15
 858 03c2 FB18     		adds	r3, r7, r3
 859 03c4 1B78     		ldrb	r3, [r3]
 860 03c6 8022     		movs	r2, #128
 861 03c8 5242     		rsbs	r2, r2, #0
 862 03ca 1343     		orrs	r3, r2
 863 03cc DBB2     		uxtb	r3, r3
 864 03ce 1800     		movs	r0, r3
 865 03d0 FFF7FEFF 		bl	ascii_write_cmd
 116:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\asciidisplay.c **** }...
 866              		.loc 1 116 0
 867 03d4 C046     		nop
 868 03d6 BD46     		mov	sp, r7
 869 03d8 04B0     		add	sp, sp, #16
 870              		@ sp needed
 871 03da 80BD     		pop	{r7, pc}
 872              		.cfi_endproc
 873              	.LFE11:
 875              	.Letext0:
