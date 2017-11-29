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
  11              		.file	"graphic.c"
  12              		.text
  13              	.Ltext0:
  14              		.cfi_sections	.debug_frame
  15              		.align	1
  16              		.global	graphic_ctrl_bit_set
  17              		.syntax unified
  18              		.code	16
  19              		.thumb_func
  20              		.fpu softvfp
  22              	graphic_ctrl_bit_set:
  23              	.LFB0:
  24              		.file 1 "C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay/graphic.c"
   1:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** #include "graphic.h"
   2:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 
   3:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** void graphic_ctrl_bit_set(uint8_t x) {
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
   4:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c ****     *GPIO_ODR_LOW |= (x & ~B_SELECT);
  40              		.loc 1 4 0
  41 000c 0949     		ldr	r1, .L2
  42 000e 094B     		ldr	r3, .L2
  43 0010 1B78     		ldrb	r3, [r3]
  44 0012 DBB2     		uxtb	r3, r3
  45 0014 5AB2     		sxtb	r2, r3
  46 0016 FB1D     		adds	r3, r7, #7
  47 0018 1B78     		ldrb	r3, [r3]
  48 001a 5BB2     		sxtb	r3, r3
  49 001c 0420     		movs	r0, #4
  50 001e 8343     		bics	r3, r0
  51 0020 5BB2     		sxtb	r3, r3
  52 0022 1343     		orrs	r3, r2
  53 0024 5BB2     		sxtb	r3, r3
  54 0026 DBB2     		uxtb	r3, r3
  55 0028 0B70     		strb	r3, [r1]
   5:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** }
  56              		.loc 1 5 0
  57 002a C046     		nop
  58 002c BD46     		mov	sp, r7
  59 002e 02B0     		add	sp, sp, #8
  60              		@ sp needed
  61 0030 80BD     		pop	{r7, pc}
  62              	.L3:
  63 0032 C046     		.align	2
  64              	.L2:
  65 0034 14100240 		.word	1073877012
  66              		.cfi_endproc
  67              	.LFE0:
  69              		.align	1
  70              		.global	graphic_ctrl_bit_clear
  71              		.syntax unified
  72              		.code	16
  73              		.thumb_func
  74              		.fpu softvfp
  76              	graphic_ctrl_bit_clear:
  77              	.LFB1:
   6:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 
   7:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** void graphic_ctrl_bit_clear(uint8_t x) {
  78              		.loc 1 7 0
  79              		.cfi_startproc
  80              		@ args = 0, pretend = 0, frame = 8
  81              		@ frame_needed = 1, uses_anonymous_args = 0
  82 0038 80B5     		push	{r7, lr}
  83              		.cfi_def_cfa_offset 8
  84              		.cfi_offset 7, -8
  85              		.cfi_offset 14, -4
  86 003a 82B0     		sub	sp, sp, #8
  87              		.cfi_def_cfa_offset 16
  88 003c 00AF     		add	r7, sp, #0
  89              		.cfi_def_cfa_register 7
  90 003e 0200     		movs	r2, r0
  91 0040 FB1D     		adds	r3, r7, #7
  92 0042 1A70     		strb	r2, [r3]
   8:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c ****     *GPIO_ODR_LOW &= ~x;
  93              		.loc 1 8 0
  94 0044 0849     		ldr	r1, .L5
  95 0046 084B     		ldr	r3, .L5
  96 0048 1B78     		ldrb	r3, [r3]
  97 004a DBB2     		uxtb	r3, r3
  98 004c 5BB2     		sxtb	r3, r3
  99 004e FA1D     		adds	r2, r7, #7
 100 0050 1278     		ldrb	r2, [r2]
 101 0052 52B2     		sxtb	r2, r2
 102 0054 D243     		mvns	r2, r2
 103 0056 52B2     		sxtb	r2, r2
 104 0058 1340     		ands	r3, r2
 105 005a 5BB2     		sxtb	r3, r3
 106 005c DBB2     		uxtb	r3, r3
 107 005e 0B70     		strb	r3, [r1]
   9:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** }
 108              		.loc 1 9 0
 109 0060 C046     		nop
 110 0062 BD46     		mov	sp, r7
 111 0064 02B0     		add	sp, sp, #8
 112              		@ sp needed
 113 0066 80BD     		pop	{r7, pc}
 114              	.L6:
 115              		.align	2
 116              	.L5:
 117 0068 14100240 		.word	1073877012
 118              		.cfi_endproc
 119              	.LFE1:
 121              		.align	1
 122              		.global	select_cotroller
 123              		.syntax unified
 124              		.code	16
 125              		.thumb_func
 126              		.fpu softvfp
 128              	select_cotroller:
 129              	.LFB2:
  10:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 
  11:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** void select_cotroller(uint8_t controller) {
 130              		.loc 1 11 0
 131              		.cfi_startproc
 132              		@ args = 0, pretend = 0, frame = 8
 133              		@ frame_needed = 1, uses_anonymous_args = 0
 134 006c 80B5     		push	{r7, lr}
 135              		.cfi_def_cfa_offset 8
 136              		.cfi_offset 7, -8
 137              		.cfi_offset 14, -4
 138 006e 82B0     		sub	sp, sp, #8
 139              		.cfi_def_cfa_offset 16
 140 0070 00AF     		add	r7, sp, #0
 141              		.cfi_def_cfa_register 7
 142 0072 0200     		movs	r2, r0
 143 0074 FB1D     		adds	r3, r7, #7
 144 0076 1A70     		strb	r2, [r3]
  12:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 	if(controller == 0) {
 145              		.loc 1 12 0
 146 0078 FB1D     		adds	r3, r7, #7
 147 007a 1B78     		ldrb	r3, [r3]
 148 007c 002B     		cmp	r3, #0
 149 007e 06D1     		bne	.L8
  13:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 		graphic_ctrl_bit_clear(B_CS1);
 150              		.loc 1 13 0
 151 0080 0820     		movs	r0, #8
 152 0082 FFF7FEFF 		bl	graphic_ctrl_bit_clear
  14:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 		graphic_ctrl_bit_clear(B_CS2);
 153              		.loc 1 14 0
 154 0086 1020     		movs	r0, #16
 155 0088 FFF7FEFF 		bl	graphic_ctrl_bit_clear
  15:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 	} else if(controller == (B_CS1 | B_CS2)) {
  16:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 		graphic_ctrl_bit_set(B_CS1);
  17:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 		graphic_ctrl_bit_set(B_CS2);
  18:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 	} else if(controller == B_CS1) {
  19:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 		graphic_ctrl_bit_set(B_CS1);
  20:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 		graphic_ctrl_bit_clear(B_CS2);
  21:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 	} else if(controller == B_CS2) {
  22:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 		graphic_ctrl_bit_clear(B_CS1);
  23:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 		graphic_ctrl_bit_set(B_CS2);
  24:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 	}
  25:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** }
 156              		.loc 1 25 0
 157 008c 1FE0     		b	.L12
 158              	.L8:
  15:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 	} else if(controller == (B_CS1 | B_CS2)) {
 159              		.loc 1 15 0
 160 008e FB1D     		adds	r3, r7, #7
 161 0090 1B78     		ldrb	r3, [r3]
 162 0092 182B     		cmp	r3, #24
 163 0094 06D1     		bne	.L10
  16:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 		graphic_ctrl_bit_set(B_CS2);
 164              		.loc 1 16 0
 165 0096 0820     		movs	r0, #8
 166 0098 FFF7FEFF 		bl	graphic_ctrl_bit_set
  17:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 	} else if(controller == B_CS1) {
 167              		.loc 1 17 0
 168 009c 1020     		movs	r0, #16
 169 009e FFF7FEFF 		bl	graphic_ctrl_bit_set
 170              		.loc 1 25 0
 171 00a2 14E0     		b	.L12
 172              	.L10:
  18:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 		graphic_ctrl_bit_set(B_CS1);
 173              		.loc 1 18 0
 174 00a4 FB1D     		adds	r3, r7, #7
 175 00a6 1B78     		ldrb	r3, [r3]
 176 00a8 082B     		cmp	r3, #8
 177 00aa 06D1     		bne	.L11
  19:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 		graphic_ctrl_bit_clear(B_CS2);
 178              		.loc 1 19 0
 179 00ac 0820     		movs	r0, #8
 180 00ae FFF7FEFF 		bl	graphic_ctrl_bit_set
  20:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 	} else if(controller == B_CS2) {
 181              		.loc 1 20 0
 182 00b2 1020     		movs	r0, #16
 183 00b4 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 184              		.loc 1 25 0
 185 00b8 09E0     		b	.L12
 186              	.L11:
  21:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 		graphic_ctrl_bit_clear(B_CS1);
 187              		.loc 1 21 0
 188 00ba FB1D     		adds	r3, r7, #7
 189 00bc 1B78     		ldrb	r3, [r3]
 190 00be 102B     		cmp	r3, #16
 191 00c0 05D1     		bne	.L12
  22:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 		graphic_ctrl_bit_set(B_CS2);
 192              		.loc 1 22 0
 193 00c2 0820     		movs	r0, #8
 194 00c4 FFF7FEFF 		bl	graphic_ctrl_bit_clear
  23:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 	}
 195              		.loc 1 23 0
 196 00c8 1020     		movs	r0, #16
 197 00ca FFF7FEFF 		bl	graphic_ctrl_bit_set
 198              	.L12:
 199              		.loc 1 25 0
 200 00ce C046     		nop
 201 00d0 BD46     		mov	sp, r7
 202 00d2 02B0     		add	sp, sp, #8
 203              		@ sp needed
 204 00d4 80BD     		pop	{r7, pc}
 205              		.cfi_endproc
 206              	.LFE2:
 208              		.align	1
 209              		.global	graphic_wait_ready
 210              		.syntax unified
 211              		.code	16
 212              		.thumb_func
 213              		.fpu softvfp
 215              	graphic_wait_ready:
 216              	.LFB3:
  26:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 
  27:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** void graphic_wait_ready() {
 217              		.loc 1 27 0
 218              		.cfi_startproc
 219              		@ args = 0, pretend = 0, frame = 8
 220              		@ frame_needed = 1, uses_anonymous_args = 0
 221 00d6 80B5     		push	{r7, lr}
 222              		.cfi_def_cfa_offset 8
 223              		.cfi_offset 7, -8
 224              		.cfi_offset 14, -4
 225 00d8 82B0     		sub	sp, sp, #8
 226              		.cfi_def_cfa_offset 16
 227 00da 00AF     		add	r7, sp, #0
 228              		.cfi_def_cfa_register 7
  28:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 	graphic_ctrl_bit_clear(B_E);
 229              		.loc 1 28 0
 230 00dc 4020     		movs	r0, #64
 231 00de FFF7FEFF 		bl	graphic_ctrl_bit_clear
  29:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 	*GPIO_MODER = 0x00005555;
 232              		.loc 1 29 0
 233 00e2 154B     		ldr	r3, .L19
 234 00e4 154A     		ldr	r2, .L19+4
 235 00e6 1A60     		str	r2, [r3]
  30:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 	graphic_ctrl_bit_clear(B_RS);
 236              		.loc 1 30 0
 237 00e8 0120     		movs	r0, #1
 238 00ea FFF7FEFF 		bl	graphic_ctrl_bit_clear
  31:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 	graphic_ctrl_bit_set(B_RW);
 239              		.loc 1 31 0
 240 00ee 0220     		movs	r0, #2
 241 00f0 FFF7FEFF 		bl	graphic_ctrl_bit_set
  32:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 	delay_500ns();
 242              		.loc 1 32 0
 243 00f4 FFF7FEFF 		bl	delay_500ns
 244              	.L16:
 245              	.LBB2:
  33:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 	while(1) { // Wait for display not to be busy
  34:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 		graphic_ctrl_bit_set(B_E);
 246              		.loc 1 34 0
 247 00f8 4020     		movs	r0, #64
 248 00fa FFF7FEFF 		bl	graphic_ctrl_bit_set
  35:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 		delay_500ns();
 249              		.loc 1 35 0
 250 00fe FFF7FEFF 		bl	delay_500ns
  36:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 		graphic_ctrl_bit_clear(B_E);
 251              		.loc 1 36 0
 252 0102 4020     		movs	r0, #64
 253 0104 FFF7FEFF 		bl	graphic_ctrl_bit_clear
  37:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 		delay_500ns();		
 254              		.loc 1 37 0
 255 0108 FFF7FEFF 		bl	delay_500ns
  38:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 		unsigned char i = *GPIO_IDR_HIGH;
 256              		.loc 1 38 0
 257 010c 0C4A     		ldr	r2, .L19+8
 258 010e FB1D     		adds	r3, r7, #7
 259 0110 1278     		ldrb	r2, [r2]
 260 0112 1A70     		strb	r2, [r3]
  39:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 		if((*GPIO_IDR_HIGH & LCD_BUSY) == 0) {
 261              		.loc 1 39 0
 262 0114 0A4B     		ldr	r3, .L19+8
 263 0116 1B78     		ldrb	r3, [r3]
 264 0118 DBB2     		uxtb	r3, r3
 265 011a 5BB2     		sxtb	r3, r3
 266 011c 002B     		cmp	r3, #0
 267 011e 00DA     		bge	.L18
 268              	.LBE2:
  33:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 		graphic_ctrl_bit_set(B_E);
 269              		.loc 1 33 0
 270 0120 EAE7     		b	.L16
 271              	.L18:
 272              	.LBB3:
  40:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 			break;
 273              		.loc 1 40 0
 274 0122 C046     		nop
 275              	.LBE3:
  41:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 		}
  42:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 	}
  43:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 	graphic_ctrl_bit_set(B_E);
 276              		.loc 1 43 0
 277 0124 4020     		movs	r0, #64
 278 0126 FFF7FEFF 		bl	graphic_ctrl_bit_set
  44:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 	*GPIO_MODER = 0x55555555;
 279              		.loc 1 44 0
 280 012a 034B     		ldr	r3, .L19
 281 012c 054A     		ldr	r2, .L19+12
 282 012e 1A60     		str	r2, [r3]
  45:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** }
 283              		.loc 1 45 0
 284 0130 C046     		nop
 285 0132 BD46     		mov	sp, r7
 286 0134 02B0     		add	sp, sp, #8
 287              		@ sp needed
 288 0136 80BD     		pop	{r7, pc}
 289              	.L20:
 290              		.align	2
 291              	.L19:
 292 0138 00100240 		.word	1073876992
 293 013c 55550000 		.word	21845
 294 0140 11100240 		.word	1073877009
 295 0144 55555555 		.word	1431655765
 296              		.cfi_endproc
 297              	.LFE3:
 299              		.align	1
 300              		.global	graphic_read
 301              		.syntax unified
 302              		.code	16
 303              		.thumb_func
 304              		.fpu softvfp
 306              	graphic_read:
 307              	.LFB4:
  46:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 
  47:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** unsigned char graphic_read(unsigned char controller) {
 308              		.loc 1 47 0
 309              		.cfi_startproc
 310              		@ args = 0, pretend = 0, frame = 16
 311              		@ frame_needed = 1, uses_anonymous_args = 0
 312 0148 80B5     		push	{r7, lr}
 313              		.cfi_def_cfa_offset 8
 314              		.cfi_offset 7, -8
 315              		.cfi_offset 14, -4
 316 014a 84B0     		sub	sp, sp, #16
 317              		.cfi_def_cfa_offset 24
 318 014c 00AF     		add	r7, sp, #0
 319              		.cfi_def_cfa_register 7
 320 014e 0200     		movs	r2, r0
 321 0150 FB1D     		adds	r3, r7, #7
 322 0152 1A70     		strb	r2, [r3]
  48:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 	graphic_ctrl_bit_clear(B_E);
 323              		.loc 1 48 0
 324 0154 4020     		movs	r0, #64
 325 0156 FFF7FEFF 		bl	graphic_ctrl_bit_clear
  49:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 	*GPIO_MODER = 0x00005555;
 326              		.loc 1 49 0
 327 015a 1B4B     		ldr	r3, .L25
 328 015c 1B4A     		ldr	r2, .L25+4
 329 015e 1A60     		str	r2, [r3]
  50:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 	graphic_ctrl_bit_set(B_RS | B_RW);
 330              		.loc 1 50 0
 331 0160 0320     		movs	r0, #3
 332 0162 FFF7FEFF 		bl	graphic_ctrl_bit_set
  51:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 	select_cotroller(controller);
 333              		.loc 1 51 0
 334 0166 FB1D     		adds	r3, r7, #7
 335 0168 1B78     		ldrb	r3, [r3]
 336 016a 1800     		movs	r0, r3
 337 016c FFF7FEFF 		bl	select_cotroller
  52:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 	delay_500ns();
 338              		.loc 1 52 0
 339 0170 FFF7FEFF 		bl	delay_500ns
  53:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 	graphic_ctrl_bit_set(B_E);
 340              		.loc 1 53 0
 341 0174 4020     		movs	r0, #64
 342 0176 FFF7FEFF 		bl	graphic_ctrl_bit_set
  54:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 	delay_500ns();
 343              		.loc 1 54 0
 344 017a FFF7FEFF 		bl	delay_500ns
  55:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 	unsigned char RV = *GPIO_IDR_HIGH;
 345              		.loc 1 55 0
 346 017e 144A     		ldr	r2, .L25+8
 347 0180 0F23     		movs	r3, #15
 348 0182 FB18     		adds	r3, r7, r3
 349 0184 1278     		ldrb	r2, [r2]
 350 0186 1A70     		strb	r2, [r3]
  56:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 	graphic_ctrl_bit_clear(B_E);
 351              		.loc 1 56 0
 352 0188 4020     		movs	r0, #64
 353 018a FFF7FEFF 		bl	graphic_ctrl_bit_clear
  57:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 	*GPIO_MODER = 0x55555555;
 354              		.loc 1 57 0
 355 018e 0E4B     		ldr	r3, .L25
 356 0190 104A     		ldr	r2, .L25+12
 357 0192 1A60     		str	r2, [r3]
  58:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 	if(controller == B_CS1) {
 358              		.loc 1 58 0
 359 0194 FB1D     		adds	r3, r7, #7
 360 0196 1B78     		ldrb	r3, [r3]
 361 0198 082B     		cmp	r3, #8
 362 019a 04D1     		bne	.L22
  59:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 		select_cotroller(B_CS1);
 363              		.loc 1 59 0
 364 019c 0820     		movs	r0, #8
 365 019e FFF7FEFF 		bl	select_cotroller
  60:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 		graphic_wait_ready();
 366              		.loc 1 60 0
 367 01a2 FFF7FEFF 		bl	graphic_wait_ready
 368              	.L22:
  61:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 	}
  62:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 	if(controller == B_CS2) {
 369              		.loc 1 62 0
 370 01a6 FB1D     		adds	r3, r7, #7
 371 01a8 1B78     		ldrb	r3, [r3]
 372 01aa 102B     		cmp	r3, #16
 373 01ac 04D1     		bne	.L23
  63:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 		select_cotroller(B_CS2);
 374              		.loc 1 63 0
 375 01ae 1020     		movs	r0, #16
 376 01b0 FFF7FEFF 		bl	select_cotroller
  64:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 		graphic_wait_ready();
 377              		.loc 1 64 0
 378 01b4 FFF7FEFF 		bl	graphic_wait_ready
 379              	.L23:
  65:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 	}
  66:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 	return RV;
 380              		.loc 1 66 0
 381 01b8 0F23     		movs	r3, #15
 382 01ba FB18     		adds	r3, r7, r3
 383 01bc 1B78     		ldrb	r3, [r3]
  67:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** }
 384              		.loc 1 67 0
 385 01be 1800     		movs	r0, r3
 386 01c0 BD46     		mov	sp, r7
 387 01c2 04B0     		add	sp, sp, #16
 388              		@ sp needed
 389 01c4 80BD     		pop	{r7, pc}
 390              	.L26:
 391 01c6 C046     		.align	2
 392              	.L25:
 393 01c8 00100240 		.word	1073876992
 394 01cc 55550000 		.word	21845
 395 01d0 11100240 		.word	1073877009
 396 01d4 55555555 		.word	1431655765
 397              		.cfi_endproc
 398              	.LFE4:
 400              		.align	1
 401              		.global	graphic_write
 402              		.syntax unified
 403              		.code	16
 404              		.thumb_func
 405              		.fpu softvfp
 407              	graphic_write:
 408              	.LFB5:
  68:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 
  69:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** void graphic_write(unsigned char value, unsigned char controller) {
 409              		.loc 1 69 0
 410              		.cfi_startproc
 411              		@ args = 0, pretend = 0, frame = 8
 412              		@ frame_needed = 1, uses_anonymous_args = 0
 413 01d8 80B5     		push	{r7, lr}
 414              		.cfi_def_cfa_offset 8
 415              		.cfi_offset 7, -8
 416              		.cfi_offset 14, -4
 417 01da 82B0     		sub	sp, sp, #8
 418              		.cfi_def_cfa_offset 16
 419 01dc 00AF     		add	r7, sp, #0
 420              		.cfi_def_cfa_register 7
 421 01de 0200     		movs	r2, r0
 422 01e0 FB1D     		adds	r3, r7, #7
 423 01e2 1A70     		strb	r2, [r3]
 424 01e4 BB1D     		adds	r3, r7, #6
 425 01e6 0A1C     		adds	r2, r1, #0
 426 01e8 1A70     		strb	r2, [r3]
  70:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 	*GPIO_ODR_HIGH = value;
 427              		.loc 1 70 0
 428 01ea 1A4A     		ldr	r2, .L30
 429 01ec FB1D     		adds	r3, r7, #7
 430 01ee 1B78     		ldrb	r3, [r3]
 431 01f0 1370     		strb	r3, [r2]
  71:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 	select_cotroller(controller);
 432              		.loc 1 71 0
 433 01f2 BB1D     		adds	r3, r7, #6
 434 01f4 1B78     		ldrb	r3, [r3]
 435 01f6 1800     		movs	r0, r3
 436 01f8 FFF7FEFF 		bl	select_cotroller
  72:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 	delay_500ns();
 437              		.loc 1 72 0
 438 01fc FFF7FEFF 		bl	delay_500ns
  73:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 	graphic_ctrl_bit_set(B_E);
 439              		.loc 1 73 0
 440 0200 4020     		movs	r0, #64
 441 0202 FFF7FEFF 		bl	graphic_ctrl_bit_set
  74:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 	delay_500ns();
 442              		.loc 1 74 0
 443 0206 FFF7FEFF 		bl	delay_500ns
  75:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 	graphic_ctrl_bit_clear(B_E);
 444              		.loc 1 75 0
 445 020a 4020     		movs	r0, #64
 446 020c FFF7FEFF 		bl	graphic_ctrl_bit_clear
  76:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 	
  77:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 	//Kanske inte ska vara så här för this statement
  78:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 	if(controller & B_CS1) {
 447              		.loc 1 78 0
 448 0210 BB1D     		adds	r3, r7, #6
 449 0212 1B78     		ldrb	r3, [r3]
 450 0214 0822     		movs	r2, #8
 451 0216 1340     		ands	r3, r2
 452 0218 04D0     		beq	.L28
  79:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 		select_cotroller(B_CS1);
 453              		.loc 1 79 0
 454 021a 0820     		movs	r0, #8
 455 021c FFF7FEFF 		bl	select_cotroller
  80:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 		graphic_wait_ready();
 456              		.loc 1 80 0
 457 0220 FFF7FEFF 		bl	graphic_wait_ready
 458              	.L28:
  81:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 	}
  82:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 	
  83:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 	if(controller & B_CS2) {
 459              		.loc 1 83 0
 460 0224 BB1D     		adds	r3, r7, #6
 461 0226 1B78     		ldrb	r3, [r3]
 462 0228 1022     		movs	r2, #16
 463 022a 1340     		ands	r3, r2
 464 022c 04D0     		beq	.L29
  84:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 		select_cotroller(B_CS2);
 465              		.loc 1 84 0
 466 022e 1020     		movs	r0, #16
 467 0230 FFF7FEFF 		bl	select_cotroller
  85:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 		graphic_wait_ready();
 468              		.loc 1 85 0
 469 0234 FFF7FEFF 		bl	graphic_wait_ready
 470              	.L29:
  86:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 	}
  87:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 	
  88:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 	*GPIO_ODR_HIGH = 0;
 471              		.loc 1 88 0
 472 0238 064B     		ldr	r3, .L30
 473 023a 0022     		movs	r2, #0
 474 023c 1A70     		strb	r2, [r3]
  89:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 	graphic_ctrl_bit_set(B_E);
 475              		.loc 1 89 0
 476 023e 4020     		movs	r0, #64
 477 0240 FFF7FEFF 		bl	graphic_ctrl_bit_set
  90:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 	select_cotroller(0);
 478              		.loc 1 90 0
 479 0244 0020     		movs	r0, #0
 480 0246 FFF7FEFF 		bl	select_cotroller
  91:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** }
 481              		.loc 1 91 0
 482 024a C046     		nop
 483 024c BD46     		mov	sp, r7
 484 024e 02B0     		add	sp, sp, #8
 485              		@ sp needed
 486 0250 80BD     		pop	{r7, pc}
 487              	.L31:
 488 0252 C046     		.align	2
 489              	.L30:
 490 0254 15100240 		.word	1073877013
 491              		.cfi_endproc
 492              	.LFE5:
 494              		.align	1
 495              		.global	graphic_write_command
 496              		.syntax unified
 497              		.code	16
 498              		.thumb_func
 499              		.fpu softvfp
 501              	graphic_write_command:
 502              	.LFB6:
  92:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 
  93:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** void graphic_write_command(unsigned char command, unsigned char controller) {
 503              		.loc 1 93 0
 504              		.cfi_startproc
 505              		@ args = 0, pretend = 0, frame = 8
 506              		@ frame_needed = 1, uses_anonymous_args = 0
 507 0258 80B5     		push	{r7, lr}
 508              		.cfi_def_cfa_offset 8
 509              		.cfi_offset 7, -8
 510              		.cfi_offset 14, -4
 511 025a 82B0     		sub	sp, sp, #8
 512              		.cfi_def_cfa_offset 16
 513 025c 00AF     		add	r7, sp, #0
 514              		.cfi_def_cfa_register 7
 515 025e 0200     		movs	r2, r0
 516 0260 FB1D     		adds	r3, r7, #7
 517 0262 1A70     		strb	r2, [r3]
 518 0264 BB1D     		adds	r3, r7, #6
 519 0266 0A1C     		adds	r2, r1, #0
 520 0268 1A70     		strb	r2, [r3]
  94:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 	graphic_ctrl_bit_clear(B_E);
 521              		.loc 1 94 0
 522 026a 4020     		movs	r0, #64
 523 026c FFF7FEFF 		bl	graphic_ctrl_bit_clear
  95:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 	select_cotroller(controller);
 524              		.loc 1 95 0
 525 0270 BB1D     		adds	r3, r7, #6
 526 0272 1B78     		ldrb	r3, [r3]
 527 0274 1800     		movs	r0, r3
 528 0276 FFF7FEFF 		bl	select_cotroller
  96:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 	graphic_ctrl_bit_clear(B_RS | B_RW);
 529              		.loc 1 96 0
 530 027a 0320     		movs	r0, #3
 531 027c FFF7FEFF 		bl	graphic_ctrl_bit_clear
  97:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 	graphic_write(command, controller);
 532              		.loc 1 97 0
 533 0280 BB1D     		adds	r3, r7, #6
 534 0282 1A78     		ldrb	r2, [r3]
 535 0284 FB1D     		adds	r3, r7, #7
 536 0286 1B78     		ldrb	r3, [r3]
 537 0288 1100     		movs	r1, r2
 538 028a 1800     		movs	r0, r3
 539 028c FFF7FEFF 		bl	graphic_write
  98:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** }
 540              		.loc 1 98 0
 541 0290 C046     		nop
 542 0292 BD46     		mov	sp, r7
 543 0294 02B0     		add	sp, sp, #8
 544              		@ sp needed
 545 0296 80BD     		pop	{r7, pc}
 546              		.cfi_endproc
 547              	.LFE6:
 549              		.align	1
 550              		.global	graphic_write_data
 551              		.syntax unified
 552              		.code	16
 553              		.thumb_func
 554              		.fpu softvfp
 556              	graphic_write_data:
 557              	.LFB7:
  99:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 
 100:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** void graphic_write_data(unsigned char data, unsigned char controller) {
 558              		.loc 1 100 0
 559              		.cfi_startproc
 560              		@ args = 0, pretend = 0, frame = 8
 561              		@ frame_needed = 1, uses_anonymous_args = 0
 562 0298 80B5     		push	{r7, lr}
 563              		.cfi_def_cfa_offset 8
 564              		.cfi_offset 7, -8
 565              		.cfi_offset 14, -4
 566 029a 82B0     		sub	sp, sp, #8
 567              		.cfi_def_cfa_offset 16
 568 029c 00AF     		add	r7, sp, #0
 569              		.cfi_def_cfa_register 7
 570 029e 0200     		movs	r2, r0
 571 02a0 FB1D     		adds	r3, r7, #7
 572 02a2 1A70     		strb	r2, [r3]
 573 02a4 BB1D     		adds	r3, r7, #6
 574 02a6 0A1C     		adds	r2, r1, #0
 575 02a8 1A70     		strb	r2, [r3]
 101:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 	graphic_ctrl_bit_clear(B_E);
 576              		.loc 1 101 0
 577 02aa 4020     		movs	r0, #64
 578 02ac FFF7FEFF 		bl	graphic_ctrl_bit_clear
 102:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 	select_cotroller(controller);
 579              		.loc 1 102 0
 580 02b0 BB1D     		adds	r3, r7, #6
 581 02b2 1B78     		ldrb	r3, [r3]
 582 02b4 1800     		movs	r0, r3
 583 02b6 FFF7FEFF 		bl	select_cotroller
 103:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 	graphic_ctrl_bit_set(B_RS);
 584              		.loc 1 103 0
 585 02ba 0120     		movs	r0, #1
 586 02bc FFF7FEFF 		bl	graphic_ctrl_bit_set
 104:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 	graphic_ctrl_bit_clear(B_RW);
 587              		.loc 1 104 0
 588 02c0 0220     		movs	r0, #2
 589 02c2 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 105:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 	graphic_write(data, controller);
 590              		.loc 1 105 0
 591 02c6 BB1D     		adds	r3, r7, #6
 592 02c8 1A78     		ldrb	r2, [r3]
 593 02ca FB1D     		adds	r3, r7, #7
 594 02cc 1B78     		ldrb	r3, [r3]
 595 02ce 1100     		movs	r1, r2
 596 02d0 1800     		movs	r0, r3
 597 02d2 FFF7FEFF 		bl	graphic_write
 106:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** }
 598              		.loc 1 106 0
 599 02d6 C046     		nop
 600 02d8 BD46     		mov	sp, r7
 601 02da 02B0     		add	sp, sp, #8
 602              		@ sp needed
 603 02dc 80BD     		pop	{r7, pc}
 604              		.cfi_endproc
 605              	.LFE7:
 607              		.align	1
 608              		.global	graphic_read_data
 609              		.syntax unified
 610              		.code	16
 611              		.thumb_func
 612              		.fpu softvfp
 614              	graphic_read_data:
 615              	.LFB8:
 107:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 
 108:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** unsigned char graphic_read_data(unsigned char controller) {
 616              		.loc 1 108 0
 617              		.cfi_startproc
 618              		@ args = 0, pretend = 0, frame = 8
 619              		@ frame_needed = 1, uses_anonymous_args = 0
 620 02de 80B5     		push	{r7, lr}
 621              		.cfi_def_cfa_offset 8
 622              		.cfi_offset 7, -8
 623              		.cfi_offset 14, -4
 624 02e0 82B0     		sub	sp, sp, #8
 625              		.cfi_def_cfa_offset 16
 626 02e2 00AF     		add	r7, sp, #0
 627              		.cfi_def_cfa_register 7
 628 02e4 0200     		movs	r2, r0
 629 02e6 FB1D     		adds	r3, r7, #7
 630 02e8 1A70     		strb	r2, [r3]
 109:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 	(void) graphic_read(controller);
 631              		.loc 1 109 0
 632 02ea FB1D     		adds	r3, r7, #7
 633 02ec 1B78     		ldrb	r3, [r3]
 634 02ee 1800     		movs	r0, r3
 635 02f0 FFF7FEFF 		bl	graphic_read
 110:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 	return graphic_read(controller);
 636              		.loc 1 110 0
 637 02f4 FB1D     		adds	r3, r7, #7
 638 02f6 1B78     		ldrb	r3, [r3]
 639 02f8 1800     		movs	r0, r3
 640 02fa FFF7FEFF 		bl	graphic_read
 641 02fe 0300     		movs	r3, r0
 111:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** }
 642              		.loc 1 111 0
 643 0300 1800     		movs	r0, r3
 644 0302 BD46     		mov	sp, r7
 645 0304 02B0     		add	sp, sp, #8
 646              		@ sp needed
 647 0306 80BD     		pop	{r7, pc}
 648              		.cfi_endproc
 649              	.LFE8:
 651              		.align	1
 652              		.global	graphic_initalize
 653              		.syntax unified
 654              		.code	16
 655              		.thumb_func
 656              		.fpu softvfp
 658              	graphic_initalize:
 659              	.LFB9:
 112:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 
 113:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** void graphic_initalize(void) {
 660              		.loc 1 113 0
 661              		.cfi_startproc
 662              		@ args = 0, pretend = 0, frame = 0
 663              		@ frame_needed = 1, uses_anonymous_args = 0
 664 0308 80B5     		push	{r7, lr}
 665              		.cfi_def_cfa_offset 8
 666              		.cfi_offset 7, -8
 667              		.cfi_offset 14, -4
 668 030a 00AF     		add	r7, sp, #0
 669              		.cfi_def_cfa_register 7
 114:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 	graphic_ctrl_bit_set(B_E);
 670              		.loc 1 114 0
 671 030c 4020     		movs	r0, #64
 672 030e FFF7FEFF 		bl	graphic_ctrl_bit_set
 115:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 	delay_mikro(10);
 673              		.loc 1 115 0
 674 0312 0A20     		movs	r0, #10
 675 0314 FFF7FEFF 		bl	delay_mikro
 116:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 	graphic_ctrl_bit_clear(B_CS1 | B_CS2 | B_RST | B_E);
 676              		.loc 1 116 0
 677 0318 7820     		movs	r0, #120
 678 031a FFF7FEFF 		bl	graphic_ctrl_bit_clear
 117:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 	delay_milli(30);
 679              		.loc 1 117 0
 680 031e 1E20     		movs	r0, #30
 681 0320 FFF7FEFF 		bl	delay_milli
 118:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 	graphic_ctrl_bit_set(B_RST);
 682              		.loc 1 118 0
 683 0324 2020     		movs	r0, #32
 684 0326 FFF7FEFF 		bl	graphic_ctrl_bit_set
 119:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 	graphic_write_command(LCD_OFF, B_CS1 | B_CS2);
 685              		.loc 1 119 0
 686 032a 1821     		movs	r1, #24
 687 032c 3E20     		movs	r0, #62
 688 032e FFF7FEFF 		bl	graphic_write_command
 120:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 	graphic_write_command(LCD_ON, B_CS1 | B_CS2);
 689              		.loc 1 120 0
 690 0332 1821     		movs	r1, #24
 691 0334 3F20     		movs	r0, #63
 692 0336 FFF7FEFF 		bl	graphic_write_command
 121:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 	graphic_write_command(LCD_DISP_START, B_CS1 | B_CS2);
 693              		.loc 1 121 0
 694 033a 1821     		movs	r1, #24
 695 033c C020     		movs	r0, #192
 696 033e FFF7FEFF 		bl	graphic_write_command
 122:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 	graphic_write_command(LCD_SET_ADD, B_CS1 | B_CS2);
 697              		.loc 1 122 0
 698 0342 1821     		movs	r1, #24
 699 0344 4020     		movs	r0, #64
 700 0346 FFF7FEFF 		bl	graphic_write_command
 123:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 	graphic_write_command(LCD_SET_PAGE, B_CS1 | B_CS2);
 701              		.loc 1 123 0
 702 034a 1821     		movs	r1, #24
 703 034c B820     		movs	r0, #184
 704 034e FFF7FEFF 		bl	graphic_write_command
 124:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 	select_cotroller(0);
 705              		.loc 1 124 0
 706 0352 0020     		movs	r0, #0
 707 0354 FFF7FEFF 		bl	select_cotroller
 125:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** }
 708              		.loc 1 125 0
 709 0358 C046     		nop
 710 035a BD46     		mov	sp, r7
 711              		@ sp needed
 712 035c 80BD     		pop	{r7, pc}
 713              		.cfi_endproc
 714              	.LFE9:
 716              		.align	1
 717              		.global	graphic_clear_screen
 718              		.syntax unified
 719              		.code	16
 720              		.thumb_func
 721              		.fpu softvfp
 723              	graphic_clear_screen:
 724              	.LFB10:
 126:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 
 127:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** void graphic_clear_screen(void) {
 725              		.loc 1 127 0
 726              		.cfi_startproc
 727              		@ args = 0, pretend = 0, frame = 8
 728              		@ frame_needed = 1, uses_anonymous_args = 0
 729 035e 80B5     		push	{r7, lr}
 730              		.cfi_def_cfa_offset 8
 731              		.cfi_offset 7, -8
 732              		.cfi_offset 14, -4
 733 0360 82B0     		sub	sp, sp, #8
 734              		.cfi_def_cfa_offset 16
 735 0362 00AF     		add	r7, sp, #0
 736              		.cfi_def_cfa_register 7
 737              	.LBB4:
 128:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 	for(int page = 0; page < 7; page++) {
 738              		.loc 1 128 0
 739 0364 0023     		movs	r3, #0
 740 0366 7B60     		str	r3, [r7, #4]
 741 0368 1EE0     		b	.L38
 742              	.L41:
 129:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 		graphic_write_command(LCD_SET_PAGE | page, B_CS1 | B_CS2);
 743              		.loc 1 129 0
 744 036a 7B68     		ldr	r3, [r7, #4]
 745 036c 5BB2     		sxtb	r3, r3
 746 036e 4822     		movs	r2, #72
 747 0370 5242     		rsbs	r2, r2, #0
 748 0372 1343     		orrs	r3, r2
 749 0374 5BB2     		sxtb	r3, r3
 750 0376 DBB2     		uxtb	r3, r3
 751 0378 1821     		movs	r1, #24
 752 037a 1800     		movs	r0, r3
 753 037c FFF7FEFF 		bl	graphic_write_command
 130:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 		graphic_write_command(LCD_SET_ADD | 0, B_CS1 | B_CS2);
 754              		.loc 1 130 0
 755 0380 1821     		movs	r1, #24
 756 0382 4020     		movs	r0, #64
 757 0384 FFF7FEFF 		bl	graphic_write_command
 758              	.LBB5:
 131:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 		for(int add = 0; add < 63; add++) {
 759              		.loc 1 131 0
 760 0388 0023     		movs	r3, #0
 761 038a 3B60     		str	r3, [r7]
 762 038c 06E0     		b	.L39
 763              	.L40:
 132:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 			graphic_write_data(0, B_CS1 | B_CS2);
 764              		.loc 1 132 0 discriminator 3
 765 038e 1821     		movs	r1, #24
 766 0390 0020     		movs	r0, #0
 767 0392 FFF7FEFF 		bl	graphic_write_data
 131:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 		for(int add = 0; add < 63; add++) {
 768              		.loc 1 131 0 discriminator 3
 769 0396 3B68     		ldr	r3, [r7]
 770 0398 0133     		adds	r3, r3, #1
 771 039a 3B60     		str	r3, [r7]
 772              	.L39:
 131:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 		for(int add = 0; add < 63; add++) {
 773              		.loc 1 131 0 is_stmt 0 discriminator 1
 774 039c 3B68     		ldr	r3, [r7]
 775 039e 3E2B     		cmp	r3, #62
 776 03a0 F5DD     		ble	.L40
 777              	.LBE5:
 128:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 		graphic_write_command(LCD_SET_PAGE | page, B_CS1 | B_CS2);
 778              		.loc 1 128 0 is_stmt 1 discriminator 2
 779 03a2 7B68     		ldr	r3, [r7, #4]
 780 03a4 0133     		adds	r3, r3, #1
 781 03a6 7B60     		str	r3, [r7, #4]
 782              	.L38:
 128:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 		graphic_write_command(LCD_SET_PAGE | page, B_CS1 | B_CS2);
 783              		.loc 1 128 0 is_stmt 0 discriminator 1
 784 03a8 7B68     		ldr	r3, [r7, #4]
 785 03aa 062B     		cmp	r3, #6
 786 03ac DDDD     		ble	.L41
 787              	.LBE4:
 133:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 		}
 134:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** 	}
 135:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\graphic.c **** }...
 788              		.loc 1 135 0 is_stmt 1
 789 03ae C046     		nop
 790 03b0 BD46     		mov	sp, r7
 791 03b2 02B0     		add	sp, sp, #8
 792              		@ sp needed
 793 03b4 80BD     		pop	{r7, pc}
 794              		.cfi_endproc
 795              	.LFE10:
 797              	.Letext0:
 798              		.file 2 "C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay/graphic.h"
