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
  11              		.file	"ball.c"
  12              		.text
  13              	.Ltext0:
  14              		.cfi_sections	.debug_frame
  15              		.global	ball_geometry
  16              		.data
  17              		.align	2
  20              	ball_geometry:
  21 0000 0C000000 		.word	12
  22 0004 04000000 		.word	4
  23 0008 04000000 		.word	4
  24 000c 00       		.byte	0
  25 000d 01       		.byte	1
  26 000e 00       		.byte	0
  27 000f 02       		.byte	2
  28 0010 01       		.byte	1
  29 0011 00       		.byte	0
  30 0012 01       		.byte	1
  31 0013 01       		.byte	1
  32 0014 01       		.byte	1
  33 0015 02       		.byte	2
  34 0016 01       		.byte	1
  35 0017 03       		.byte	3
  36 0018 02       		.byte	2
  37 0019 00       		.byte	0
  38 001a 02       		.byte	2
  39 001b 01       		.byte	1
  40 001c 02       		.byte	2
  41 001d 02       		.byte	2
  42 001e 02       		.byte	2
  43 001f 03       		.byte	3
  44 0020 03       		.byte	3
  45 0021 01       		.byte	1
  46 0022 03       		.byte	3
  47 0023 02       		.byte	2
  48 0024 00000000 		.space	176
  48      00000000 
  48      00000000 
  48      00000000 
  48      00000000 
  49              		.global	ball
  50              		.align	2
  53              	ball:
  54 00d4 00000000 		.word	ball_geometry
  55 00d8 00000000 		.word	0
  56 00dc 00000000 		.word	0
  57 00e0 3F000000 		.word	63
  58 00e4 20000000 		.word	32
  59 00e8 00000000 		.word	draw_object
  60 00ec 00000000 		.word	clear_object
  61 00f0 00000000 		.word	move_ball
  62 00f4 00000000 		.word	set_object_speed
  63              		.section	.rodata
  64              		.align	2
  65              	.LC2:
  66 0000 52696768 		.ascii	"Right player won! \000"
  66      7420706C 
  66      61796572 
  66      20776F6E 
  66      212000
  67 0013 00       		.align	2
  68              	.LC4:
  69 0014 4C656674 		.ascii	"Left player won!\000"
  69      20706C61 
  69      79657220 
  69      776F6E21 
  69      00
  70              		.text
  71              		.align	1
  72              		.global	move_ball
  73              		.syntax unified
  74              		.code	16
  75              		.thumb_func
  76              		.fpu softvfp
  78              	move_ball:
  79              	.LFB0:
  80              		.file 1 "C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong/ball.c"
   1:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** #include "ball.h"
   2:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** #include "paddle.h"
   3:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** #include "asciidisplay.h"
   4:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** #include "graphic.h"
   5:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 
   6:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** GEOMETRY ball_geometry = {
   7:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 	12,
   8:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 	4, 4,
   9:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 	{
  10:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 		{0, 1}, {0, 2}, {1, 0}, {1, 1}, {1, 2},
  11:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 		{1, 3}, {2, 0}, {2, 1}, {2, 2}, {2, 3},
  12:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 		{3, 1},
  13:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 		{3, 2}
  14:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 	}
  15:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** };
  16:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 
  17:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** OBJECT ball = {
  18:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 	&ball_geometry,
  19:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 	0, 0,
  20:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 	63, 32,
  21:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 	draw_object,
  22:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 	clear_object,
  23:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 	move_ball,
  24:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 	set_object_speed
  25:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** };
  26:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 
  27:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** extern OBJECT leftPaddle;
  28:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** extern OBJECT rightPaddle;
  29:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 
  30:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** void move_ball(POBJECT this) {
  81              		.loc 1 30 0
  82              		.cfi_startproc
  83              		@ args = 0, pretend = 0, frame = 64
  84              		@ frame_needed = 1, uses_anonymous_args = 0
  85 0000 90B5     		push	{r4, r7, lr}
  86              		.cfi_def_cfa_offset 12
  87              		.cfi_offset 4, -12
  88              		.cfi_offset 7, -8
  89              		.cfi_offset 14, -4
  90 0002 91B0     		sub	sp, sp, #68
  91              		.cfi_def_cfa_offset 80
  92 0004 00AF     		add	r7, sp, #0
  93              		.cfi_def_cfa_register 7
  94 0006 7860     		str	r0, [r7, #4]
  31:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 	clear_object(this);
  95              		.loc 1 31 0
  96 0008 7B68     		ldr	r3, [r7, #4]
  97 000a 1800     		movs	r0, r3
  98 000c FFF7FEFF 		bl	clear_object
  32:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 	
  33:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 	// Move ball
  34:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 	this->posX += this->dirX;
  99              		.loc 1 34 0
 100 0010 7B68     		ldr	r3, [r7, #4]
 101 0012 DA68     		ldr	r2, [r3, #12]
 102 0014 7B68     		ldr	r3, [r7, #4]
 103 0016 5B68     		ldr	r3, [r3, #4]
 104 0018 D218     		adds	r2, r2, r3
 105 001a 7B68     		ldr	r3, [r7, #4]
 106 001c DA60     		str	r2, [r3, #12]
  35:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 	this->posY += this->dirY;
 107              		.loc 1 35 0
 108 001e 7B68     		ldr	r3, [r7, #4]
 109 0020 1A69     		ldr	r2, [r3, #16]
 110 0022 7B68     		ldr	r3, [r7, #4]
 111 0024 9B68     		ldr	r3, [r3, #8]
 112 0026 D218     		adds	r2, r2, r3
 113 0028 7B68     		ldr	r3, [r7, #4]
 114 002a 1A61     		str	r2, [r3, #16]
  36:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 	
  37:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 	// Wall collisions
  38:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 	if(this->posY < 0) {
 115              		.loc 1 38 0
 116 002c 7B68     		ldr	r3, [r7, #4]
 117 002e 1B69     		ldr	r3, [r3, #16]
 118 0030 002B     		cmp	r3, #0
 119 0032 08DA     		bge	.L2
  39:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 		this->posY = 0;
 120              		.loc 1 39 0
 121 0034 7B68     		ldr	r3, [r7, #4]
 122 0036 0022     		movs	r2, #0
 123 0038 1A61     		str	r2, [r3, #16]
  40:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 		this->dirY = -this->dirY;
 124              		.loc 1 40 0
 125 003a 7B68     		ldr	r3, [r7, #4]
 126 003c 9B68     		ldr	r3, [r3, #8]
 127 003e 5A42     		rsbs	r2, r3, #0
 128 0040 7B68     		ldr	r3, [r7, #4]
 129 0042 9A60     		str	r2, [r3, #8]
 130 0044 0BE0     		b	.L3
 131              	.L2:
  41:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 	} else if(this->posY > 63) {
 132              		.loc 1 41 0
 133 0046 7B68     		ldr	r3, [r7, #4]
 134 0048 1B69     		ldr	r3, [r3, #16]
 135 004a 3F2B     		cmp	r3, #63
 136 004c 07DD     		ble	.L3
  42:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 		this->posY = 63;
 137              		.loc 1 42 0
 138 004e 7B68     		ldr	r3, [r7, #4]
 139 0050 3F22     		movs	r2, #63
 140 0052 1A61     		str	r2, [r3, #16]
  43:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 		this->dirY = -this->dirY;
 141              		.loc 1 43 0
 142 0054 7B68     		ldr	r3, [r7, #4]
 143 0056 9B68     		ldr	r3, [r3, #8]
 144 0058 5A42     		rsbs	r2, r3, #0
 145 005a 7B68     		ldr	r3, [r7, #4]
 146 005c 9A60     		str	r2, [r3, #8]
 147              	.L3:
  44:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 	}
  45:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 	
  46:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 	// Define left and right paddle
  47:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 	POBJECT lp = &leftPaddle;
 148              		.loc 1 47 0
 149 005e 604B     		ldr	r3, .L12
 150 0060 7B63     		str	r3, [r7, #52]
  48:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 	POBJECT rp = &rightPaddle;
 151              		.loc 1 48 0
 152 0062 604B     		ldr	r3, .L12+4
 153 0064 3B63     		str	r3, [r7, #48]
  49:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 	
  50:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 	// Collision left paddle
  51:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 	if(this->posX <= lp->posX + lp->geo->sizeX) {
 154              		.loc 1 51 0
 155 0066 7B68     		ldr	r3, [r7, #4]
 156 0068 DA68     		ldr	r2, [r3, #12]
 157 006a 7B6B     		ldr	r3, [r7, #52]
 158 006c D968     		ldr	r1, [r3, #12]
 159 006e 7B6B     		ldr	r3, [r7, #52]
 160 0070 1B68     		ldr	r3, [r3]
 161 0072 5B68     		ldr	r3, [r3, #4]
 162 0074 CB18     		adds	r3, r1, r3
 163 0076 9A42     		cmp	r2, r3
 164 0078 54DC     		bgt	.L4
  52:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 		if((this->posY >= lp->posY) && (this->posY <= lp->posY + lp->geo->sizeY)) {
 165              		.loc 1 52 0
 166 007a 7B68     		ldr	r3, [r7, #4]
 167 007c 1A69     		ldr	r2, [r3, #16]
 168 007e 7B6B     		ldr	r3, [r7, #52]
 169 0080 1B69     		ldr	r3, [r3, #16]
 170 0082 9A42     		cmp	r2, r3
 171 0084 18DB     		blt	.L5
 172              		.loc 1 52 0 is_stmt 0 discriminator 1
 173 0086 7B68     		ldr	r3, [r7, #4]
 174 0088 1A69     		ldr	r2, [r3, #16]
 175 008a 7B6B     		ldr	r3, [r7, #52]
 176 008c 1969     		ldr	r1, [r3, #16]
 177 008e 7B6B     		ldr	r3, [r7, #52]
 178 0090 1B68     		ldr	r3, [r3]
 179 0092 9B68     		ldr	r3, [r3, #8]
 180 0094 CB18     		adds	r3, r1, r3
 181 0096 9A42     		cmp	r2, r3
 182 0098 0EDC     		bgt	.L5
  53:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 			this->posX = lp->posX + lp->geo->sizeX + 1;
 183              		.loc 1 53 0 is_stmt 1
 184 009a 7B6B     		ldr	r3, [r7, #52]
 185 009c DA68     		ldr	r2, [r3, #12]
 186 009e 7B6B     		ldr	r3, [r7, #52]
 187 00a0 1B68     		ldr	r3, [r3]
 188 00a2 5B68     		ldr	r3, [r3, #4]
 189 00a4 D318     		adds	r3, r2, r3
 190 00a6 5A1C     		adds	r2, r3, #1
 191 00a8 7B68     		ldr	r3, [r7, #4]
 192 00aa DA60     		str	r2, [r3, #12]
  54:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 			this->dirX = -this->dirX;
 193              		.loc 1 54 0
 194 00ac 7B68     		ldr	r3, [r7, #4]
 195 00ae 5B68     		ldr	r3, [r3, #4]
 196 00b0 5A42     		rsbs	r2, r3, #0
 197 00b2 7B68     		ldr	r3, [r7, #4]
 198 00b4 5A60     		str	r2, [r3, #4]
 199 00b6 35E0     		b	.L4
 200              	.L5:
 201              	.LBB2:
  55:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 		} else {
  56:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 			// Left player lost
  57:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 			ascii_ctrl_bit_set(2);
 202              		.loc 1 57 0
 203 00b8 0220     		movs	r0, #2
 204 00ba FFF7FEFF 		bl	ascii_ctrl_bit_set
  58:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 			goToXY(1,1);
 205              		.loc 1 58 0
 206 00be 0121     		movs	r1, #1
 207 00c0 0120     		movs	r0, #1
 208 00c2 FFF7FEFF 		bl	goToXY
  59:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 			char *s;
  60:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 			char test1[] = "Right player won! ";
 209              		.loc 1 60 0
 210 00c6 1C23     		movs	r3, #28
 211 00c8 FB18     		adds	r3, r7, r3
 212 00ca 474A     		ldr	r2, .L12+8
 213 00cc 13CA     		ldmia	r2!, {r0, r1, r4}
 214 00ce 13C3     		stmia	r3!, {r0, r1, r4}
 215 00d0 1168     		ldr	r1, [r2]
 216 00d2 1960     		str	r1, [r3]
 217 00d4 9188     		ldrh	r1, [r2, #4]
 218 00d6 9980     		strh	r1, [r3, #4]
 219 00d8 9279     		ldrb	r2, [r2, #6]
 220 00da 9A71     		strb	r2, [r3, #6]
  61:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 			s = test1;
 221              		.loc 1 61 0
 222 00dc 1C23     		movs	r3, #28
 223 00de FB18     		adds	r3, r7, r3
 224 00e0 FB63     		str	r3, [r7, #60]
  62:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 			while(*s) {
 225              		.loc 1 62 0
 226 00e2 06E0     		b	.L6
 227              	.L7:
  63:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 				ascii_write_char(*s++);
 228              		.loc 1 63 0
 229 00e4 FB6B     		ldr	r3, [r7, #60]
 230 00e6 5A1C     		adds	r2, r3, #1
 231 00e8 FA63     		str	r2, [r7, #60]
 232 00ea 1B78     		ldrb	r3, [r3]
 233 00ec 1800     		movs	r0, r3
 234 00ee FFF7FEFF 		bl	ascii_write_char
 235              	.L6:
  62:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 			while(*s) {
 236              		.loc 1 62 0
 237 00f2 FB6B     		ldr	r3, [r7, #60]
 238 00f4 1B78     		ldrb	r3, [r3]
 239 00f6 002B     		cmp	r3, #0
 240 00f8 F4D1     		bne	.L7
  64:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 			}
  65:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 			graphics_ctrl_bit_clear(B_SELECT);
 241              		.loc 1 65 0
 242 00fa 0420     		movs	r0, #4
 243 00fc FFF7FEFF 		bl	graphics_ctrl_bit_clear
  66:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 			
  67:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 			delay_milli(500);
 244              		.loc 1 67 0
 245 0100 FA23     		movs	r3, #250
 246 0102 5B00     		lsls	r3, r3, #1
 247 0104 1800     		movs	r0, r3
 248 0106 FFF7FEFF 		bl	delay_milli
  68:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 			this->posX = 63;
 249              		.loc 1 68 0
 250 010a 7B68     		ldr	r3, [r7, #4]
 251 010c 3F22     		movs	r2, #63
 252 010e DA60     		str	r2, [r3, #12]
  69:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 			this->dirX = -this->dirX;
 253              		.loc 1 69 0
 254 0110 7B68     		ldr	r3, [r7, #4]
 255 0112 5B68     		ldr	r3, [r3, #4]
 256 0114 5A42     		rsbs	r2, r3, #0
 257 0116 7B68     		ldr	r3, [r7, #4]
 258 0118 5A60     		str	r2, [r3, #4]
  70:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 			this->dirY = -this->dirY;
 259              		.loc 1 70 0
 260 011a 7B68     		ldr	r3, [r7, #4]
 261 011c 9B68     		ldr	r3, [r3, #8]
 262 011e 5A42     		rsbs	r2, r3, #0
 263 0120 7B68     		ldr	r3, [r7, #4]
 264 0122 9A60     		str	r2, [r3, #8]
 265              	.L4:
 266              	.LBE2:
  71:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 		}
  72:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 	}
  73:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 	
  74:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 	// Collision right paddle
  75:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 	if(this->posX >= rp->posX) {
 267              		.loc 1 75 0
 268 0124 7B68     		ldr	r3, [r7, #4]
 269 0126 DA68     		ldr	r2, [r3, #12]
 270 0128 3B6B     		ldr	r3, [r7, #48]
 271 012a DB68     		ldr	r3, [r3, #12]
 272 012c 9A42     		cmp	r2, r3
 273 012e 4EDB     		blt	.L8
  76:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 		if((this->posY >= rp->posY) && (this->posY <= rp->posY + rp->geo->sizeY)) {
 274              		.loc 1 76 0
 275 0130 7B68     		ldr	r3, [r7, #4]
 276 0132 1A69     		ldr	r2, [r3, #16]
 277 0134 3B6B     		ldr	r3, [r7, #48]
 278 0136 1B69     		ldr	r3, [r3, #16]
 279 0138 9A42     		cmp	r2, r3
 280 013a 14DB     		blt	.L9
 281              		.loc 1 76 0 is_stmt 0 discriminator 1
 282 013c 7B68     		ldr	r3, [r7, #4]
 283 013e 1A69     		ldr	r2, [r3, #16]
 284 0140 3B6B     		ldr	r3, [r7, #48]
 285 0142 1969     		ldr	r1, [r3, #16]
 286 0144 3B6B     		ldr	r3, [r7, #48]
 287 0146 1B68     		ldr	r3, [r3]
 288 0148 9B68     		ldr	r3, [r3, #8]
 289 014a CB18     		adds	r3, r1, r3
 290 014c 9A42     		cmp	r2, r3
 291 014e 0ADC     		bgt	.L9
  77:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 			this->posX = rp->posX - 1;
 292              		.loc 1 77 0 is_stmt 1
 293 0150 3B6B     		ldr	r3, [r7, #48]
 294 0152 DB68     		ldr	r3, [r3, #12]
 295 0154 5A1E     		subs	r2, r3, #1
 296 0156 7B68     		ldr	r3, [r7, #4]
 297 0158 DA60     		str	r2, [r3, #12]
  78:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 			this->dirX = -this->dirX;
 298              		.loc 1 78 0
 299 015a 7B68     		ldr	r3, [r7, #4]
 300 015c 5B68     		ldr	r3, [r3, #4]
 301 015e 5A42     		rsbs	r2, r3, #0
 302 0160 7B68     		ldr	r3, [r7, #4]
 303 0162 5A60     		str	r2, [r3, #4]
 304 0164 33E0     		b	.L8
 305              	.L9:
 306              	.LBB3:
  79:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 		} else {
  80:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 			// Right player lost
  81:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 			ascii_ctrl_bit_set(2);
 307              		.loc 1 81 0
 308 0166 0220     		movs	r0, #2
 309 0168 FFF7FEFF 		bl	ascii_ctrl_bit_set
  82:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 			goToXY(1,1);
 310              		.loc 1 82 0
 311 016c 0121     		movs	r1, #1
 312 016e 0120     		movs	r0, #1
 313 0170 FFF7FEFF 		bl	goToXY
  83:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 			char *s;
  84:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 			char test1[] = "Left player won!";
 314              		.loc 1 84 0
 315 0174 0823     		movs	r3, #8
 316 0176 FB18     		adds	r3, r7, r3
 317 0178 1C4A     		ldr	r2, .L12+12
 318 017a 13CA     		ldmia	r2!, {r0, r1, r4}
 319 017c 13C3     		stmia	r3!, {r0, r1, r4}
 320 017e 1168     		ldr	r1, [r2]
 321 0180 1960     		str	r1, [r3]
 322 0182 1279     		ldrb	r2, [r2, #4]
 323 0184 1A71     		strb	r2, [r3, #4]
  85:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 			s = test1;
 324              		.loc 1 85 0
 325 0186 0823     		movs	r3, #8
 326 0188 FB18     		adds	r3, r7, r3
 327 018a BB63     		str	r3, [r7, #56]
  86:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 			while(*s) {
 328              		.loc 1 86 0
 329 018c 06E0     		b	.L10
 330              	.L11:
  87:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 				ascii_write_char(*s++);
 331              		.loc 1 87 0
 332 018e BB6B     		ldr	r3, [r7, #56]
 333 0190 5A1C     		adds	r2, r3, #1
 334 0192 BA63     		str	r2, [r7, #56]
 335 0194 1B78     		ldrb	r3, [r3]
 336 0196 1800     		movs	r0, r3
 337 0198 FFF7FEFF 		bl	ascii_write_char
 338              	.L10:
  86:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 			while(*s) {
 339              		.loc 1 86 0
 340 019c BB6B     		ldr	r3, [r7, #56]
 341 019e 1B78     		ldrb	r3, [r3]
 342 01a0 002B     		cmp	r3, #0
 343 01a2 F4D1     		bne	.L11
  88:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 			}
  89:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 			graphics_ctrl_bit_clear(B_SELECT);
 344              		.loc 1 89 0
 345 01a4 0420     		movs	r0, #4
 346 01a6 FFF7FEFF 		bl	graphics_ctrl_bit_clear
  90:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 			
  91:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 			delay_milli(500);
 347              		.loc 1 91 0
 348 01aa FA23     		movs	r3, #250
 349 01ac 5B00     		lsls	r3, r3, #1
 350 01ae 1800     		movs	r0, r3
 351 01b0 FFF7FEFF 		bl	delay_milli
  92:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 			this->posX = 63;
 352              		.loc 1 92 0
 353 01b4 7B68     		ldr	r3, [r7, #4]
 354 01b6 3F22     		movs	r2, #63
 355 01b8 DA60     		str	r2, [r3, #12]
  93:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 			this->dirX = -this->dirX;
 356              		.loc 1 93 0
 357 01ba 7B68     		ldr	r3, [r7, #4]
 358 01bc 5B68     		ldr	r3, [r3, #4]
 359 01be 5A42     		rsbs	r2, r3, #0
 360 01c0 7B68     		ldr	r3, [r7, #4]
 361 01c2 5A60     		str	r2, [r3, #4]
  94:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 			this->dirY = -this->dirY;
 362              		.loc 1 94 0
 363 01c4 7B68     		ldr	r3, [r7, #4]
 364 01c6 9B68     		ldr	r3, [r3, #8]
 365 01c8 5A42     		rsbs	r2, r3, #0
 366 01ca 7B68     		ldr	r3, [r7, #4]
 367 01cc 9A60     		str	r2, [r3, #8]
 368              	.L8:
 369              	.LBE3:
  95:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 		}
  96:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 	}
  97:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 	
  98:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 	this->draw(this);
 370              		.loc 1 98 0
 371 01ce 7B68     		ldr	r3, [r7, #4]
 372 01d0 5B69     		ldr	r3, [r3, #20]
 373 01d2 7A68     		ldr	r2, [r7, #4]
 374 01d4 1000     		movs	r0, r2
 375 01d6 9847     		blx	r3
 376              	.LVL0:
  99:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** }...
 377              		.loc 1 99 0
 378 01d8 C046     		nop
 379 01da BD46     		mov	sp, r7
 380 01dc 11B0     		add	sp, sp, #68
 381              		@ sp needed
 382 01de 90BD     		pop	{r4, r7, pc}
 383              	.L13:
 384              		.align	2
 385              	.L12:
 386 01e0 00000000 		.word	leftPaddle
 387 01e4 00000000 		.word	rightPaddle
 388 01e8 00000000 		.word	.LC2
 389 01ec 14000000 		.word	.LC4
 390              		.cfi_endproc
 391              	.LFE0:
 393              	.Letext0:
 394              		.file 2 "C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong/object.h"
 395              		.file 3 "C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong/ball.h"
 396              		.file 4 "C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong/paddle.h"
