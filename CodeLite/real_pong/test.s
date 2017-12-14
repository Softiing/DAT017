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
  63              		.text
  64              		.align	1
  65              		.global	move_ball
  66              		.syntax unified
  67              		.code	16
  68              		.thumb_func
  69              		.fpu softvfp
  71              	move_ball:
  72              	.LFB0:
  73              		.file 1 "C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong/ball.c"
   1:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** #include "ball.h"
   2:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** #include "paddle.h"
   3:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 
   4:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** GEOMETRY ball_geometry = {
   5:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 	12,
   6:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 	4, 4,
   7:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 	{
   8:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 		{0, 1}, {0, 2}, {1, 0}, {1, 1}, {1, 2},
   9:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 		{1, 3}, {2, 0}, {2, 1}, {2, 2}, {2, 3},
  10:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 		{3, 1},
  11:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 		{3, 2}
  12:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 	}
  13:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** };
  14:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 
  15:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** OBJECT ball = {
  16:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 	&ball_geometry,
  17:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 	0, 0,
  18:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 	63, 32,
  19:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 	draw_object,
  20:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 	clear_object,
  21:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 	move_ball,
  22:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 	set_object_speed
  23:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** };
  24:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 
  25:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** extern OBJECT leftPaddle;
  26:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** extern OBJECT rightPaddle;
  27:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 
  28:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** void move_ball(POBJECT this) {
  74              		.loc 1 28 0
  75              		.cfi_startproc
  76              		@ args = 0, pretend = 0, frame = 16
  77              		@ frame_needed = 1, uses_anonymous_args = 0
  78 0000 80B5     		push	{r7, lr}
  79              		.cfi_def_cfa_offset 8
  80              		.cfi_offset 7, -8
  81              		.cfi_offset 14, -4
  82 0002 84B0     		sub	sp, sp, #16
  83              		.cfi_def_cfa_offset 24
  84 0004 00AF     		add	r7, sp, #0
  85              		.cfi_def_cfa_register 7
  86 0006 7860     		str	r0, [r7, #4]
  29:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 	clear_object(this);
  87              		.loc 1 29 0
  88 0008 7B68     		ldr	r3, [r7, #4]
  89 000a 1800     		movs	r0, r3
  90 000c FFF7FEFF 		bl	clear_object
  30:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 	
  31:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 	this->posX += this->dirX;
  91              		.loc 1 31 0
  92 0010 7B68     		ldr	r3, [r7, #4]
  93 0012 DA68     		ldr	r2, [r3, #12]
  94 0014 7B68     		ldr	r3, [r7, #4]
  95 0016 5B68     		ldr	r3, [r3, #4]
  96 0018 D218     		adds	r2, r2, r3
  97 001a 7B68     		ldr	r3, [r7, #4]
  98 001c DA60     		str	r2, [r3, #12]
  32:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 	this->posY += this->dirY;
  99              		.loc 1 32 0
 100 001e 7B68     		ldr	r3, [r7, #4]
 101 0020 1A69     		ldr	r2, [r3, #16]
 102 0022 7B68     		ldr	r3, [r7, #4]
 103 0024 9B68     		ldr	r3, [r3, #8]
 104 0026 D218     		adds	r2, r2, r3
 105 0028 7B68     		ldr	r3, [r7, #4]
 106 002a 1A61     		str	r2, [r3, #16]
  33:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 	
  34:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 	// Wall collisions
  35:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 	if(this->posY < 0) {
 107              		.loc 1 35 0
 108 002c 7B68     		ldr	r3, [r7, #4]
 109 002e 1B69     		ldr	r3, [r3, #16]
 110 0030 002B     		cmp	r3, #0
 111 0032 08DA     		bge	.L2
  36:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 		this->posY = 0;
 112              		.loc 1 36 0
 113 0034 7B68     		ldr	r3, [r7, #4]
 114 0036 0022     		movs	r2, #0
 115 0038 1A61     		str	r2, [r3, #16]
  37:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 		this->dirY = -this->dirY;
 116              		.loc 1 37 0
 117 003a 7B68     		ldr	r3, [r7, #4]
 118 003c 9B68     		ldr	r3, [r3, #8]
 119 003e 5A42     		rsbs	r2, r3, #0
 120 0040 7B68     		ldr	r3, [r7, #4]
 121 0042 9A60     		str	r2, [r3, #8]
 122 0044 0BE0     		b	.L3
 123              	.L2:
  38:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 	} else if(this->posY > 63) {
 124              		.loc 1 38 0
 125 0046 7B68     		ldr	r3, [r7, #4]
 126 0048 1B69     		ldr	r3, [r3, #16]
 127 004a 3F2B     		cmp	r3, #63
 128 004c 07DD     		ble	.L3
  39:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 		this->posY = 63;
 129              		.loc 1 39 0
 130 004e 7B68     		ldr	r3, [r7, #4]
 131 0050 3F22     		movs	r2, #63
 132 0052 1A61     		str	r2, [r3, #16]
  40:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 		this->dirY = -this->dirY;
 133              		.loc 1 40 0
 134 0054 7B68     		ldr	r3, [r7, #4]
 135 0056 9B68     		ldr	r3, [r3, #8]
 136 0058 5A42     		rsbs	r2, r3, #0
 137 005a 7B68     		ldr	r3, [r7, #4]
 138 005c 9A60     		str	r2, [r3, #8]
 139              	.L3:
  41:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 	}
  42:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 	
  43:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 	// Define left and right paddle
  44:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 	POBJECT lp = &leftPaddle;
 140              		.loc 1 44 0
 141 005e 3D4B     		ldr	r3, .L8
 142 0060 FB60     		str	r3, [r7, #12]
  45:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 	POBJECT rp = &rightPaddle;
 143              		.loc 1 45 0
 144 0062 3D4B     		ldr	r3, .L8+4
 145 0064 BB60     		str	r3, [r7, #8]
  46:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 	
  47:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 	//For left paddle
  48:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 	if(this->posX <= lp->posX + lp->geo->sizeX) {
 146              		.loc 1 48 0
 147 0066 7B68     		ldr	r3, [r7, #4]
 148 0068 DA68     		ldr	r2, [r3, #12]
 149 006a FB68     		ldr	r3, [r7, #12]
 150 006c D968     		ldr	r1, [r3, #12]
 151 006e FB68     		ldr	r3, [r7, #12]
 152 0070 1B68     		ldr	r3, [r3]
 153 0072 5B68     		ldr	r3, [r3, #4]
 154 0074 CB18     		adds	r3, r1, r3
 155 0076 9A42     		cmp	r2, r3
 156 0078 30DC     		bgt	.L4
  49:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 		if((this->posY >= lp->posY) && (this->posY <= lp->posY + lp->geo->sizeY)) {
 157              		.loc 1 49 0
 158 007a 7B68     		ldr	r3, [r7, #4]
 159 007c 1A69     		ldr	r2, [r3, #16]
 160 007e FB68     		ldr	r3, [r7, #12]
 161 0080 1B69     		ldr	r3, [r3, #16]
 162 0082 9A42     		cmp	r2, r3
 163 0084 18DB     		blt	.L5
 164              		.loc 1 49 0 is_stmt 0 discriminator 1
 165 0086 7B68     		ldr	r3, [r7, #4]
 166 0088 1A69     		ldr	r2, [r3, #16]
 167 008a FB68     		ldr	r3, [r7, #12]
 168 008c 1969     		ldr	r1, [r3, #16]
 169 008e FB68     		ldr	r3, [r7, #12]
 170 0090 1B68     		ldr	r3, [r3]
 171 0092 9B68     		ldr	r3, [r3, #8]
 172 0094 CB18     		adds	r3, r1, r3
 173 0096 9A42     		cmp	r2, r3
 174 0098 0EDC     		bgt	.L5
  50:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 			this->posX = lp->posX + lp->geo->sizeX + 1;
 175              		.loc 1 50 0 is_stmt 1
 176 009a FB68     		ldr	r3, [r7, #12]
 177 009c DA68     		ldr	r2, [r3, #12]
 178 009e FB68     		ldr	r3, [r7, #12]
 179 00a0 1B68     		ldr	r3, [r3]
 180 00a2 5B68     		ldr	r3, [r3, #4]
 181 00a4 D318     		adds	r3, r2, r3
 182 00a6 5A1C     		adds	r2, r3, #1
 183 00a8 7B68     		ldr	r3, [r7, #4]
 184 00aa DA60     		str	r2, [r3, #12]
  51:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 			this->dirX = -this->dirX;
 185              		.loc 1 51 0
 186 00ac 7B68     		ldr	r3, [r7, #4]
 187 00ae 5B68     		ldr	r3, [r3, #4]
 188 00b0 5A42     		rsbs	r2, r3, #0
 189 00b2 7B68     		ldr	r3, [r7, #4]
 190 00b4 5A60     		str	r2, [r3, #4]
 191 00b6 11E0     		b	.L4
 192              	.L5:
 193              	.LBB2:
  52:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 		} else {
  53:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 			// Left player lost
  54:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 			delay_milli(500);
 194              		.loc 1 54 0
 195 00b8 FA23     		movs	r3, #250
 196 00ba 5B00     		lsls	r3, r3, #1
 197 00bc 1800     		movs	r0, r3
 198 00be FFF7FEFF 		bl	delay_milli
  55:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 			this->posX = 63;
 199              		.loc 1 55 0
 200 00c2 7B68     		ldr	r3, [r7, #4]
 201 00c4 3F22     		movs	r2, #63
 202 00c6 DA60     		str	r2, [r3, #12]
  56:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 			this->dirX = -this->dirX;
 203              		.loc 1 56 0
 204 00c8 7B68     		ldr	r3, [r7, #4]
 205 00ca 5B68     		ldr	r3, [r3, #4]
 206 00cc 5A42     		rsbs	r2, r3, #0
 207 00ce 7B68     		ldr	r3, [r7, #4]
 208 00d0 5A60     		str	r2, [r3, #4]
  57:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 			this->dirY = -this->dirY;
 209              		.loc 1 57 0
 210 00d2 7B68     		ldr	r3, [r7, #4]
 211 00d4 9B68     		ldr	r3, [r3, #8]
 212 00d6 5A42     		rsbs	r2, r3, #0
 213 00d8 7B68     		ldr	r3, [r7, #4]
 214 00da 9A60     		str	r2, [r3, #8]
 215              	.L4:
 216              	.LBE2:
  58:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 		}
  59:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 	}
  60:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 	
  61:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 	//For right paddle
  62:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 	if(this->posX >= rp->posX) {
 217              		.loc 1 62 0
 218 00dc 7B68     		ldr	r3, [r7, #4]
 219 00de DA68     		ldr	r2, [r3, #12]
 220 00e0 BB68     		ldr	r3, [r7, #8]
 221 00e2 DB68     		ldr	r3, [r3, #12]
 222 00e4 9A42     		cmp	r2, r3
 223 00e6 2CDB     		blt	.L6
  63:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 		if((this->posY >= rp->posY) && (this->posY <= rp->posY + rp->geo->sizeY)) {
 224              		.loc 1 63 0
 225 00e8 7B68     		ldr	r3, [r7, #4]
 226 00ea 1A69     		ldr	r2, [r3, #16]
 227 00ec BB68     		ldr	r3, [r7, #8]
 228 00ee 1B69     		ldr	r3, [r3, #16]
 229 00f0 9A42     		cmp	r2, r3
 230 00f2 14DB     		blt	.L7
 231              		.loc 1 63 0 is_stmt 0 discriminator 1
 232 00f4 7B68     		ldr	r3, [r7, #4]
 233 00f6 1A69     		ldr	r2, [r3, #16]
 234 00f8 BB68     		ldr	r3, [r7, #8]
 235 00fa 1969     		ldr	r1, [r3, #16]
 236 00fc BB68     		ldr	r3, [r7, #8]
 237 00fe 1B68     		ldr	r3, [r3]
 238 0100 9B68     		ldr	r3, [r3, #8]
 239 0102 CB18     		adds	r3, r1, r3
 240 0104 9A42     		cmp	r2, r3
 241 0106 0ADC     		bgt	.L7
  64:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 			this->posX = rp->posX - 1;
 242              		.loc 1 64 0 is_stmt 1
 243 0108 BB68     		ldr	r3, [r7, #8]
 244 010a DB68     		ldr	r3, [r3, #12]
 245 010c 5A1E     		subs	r2, r3, #1
 246 010e 7B68     		ldr	r3, [r7, #4]
 247 0110 DA60     		str	r2, [r3, #12]
  65:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 			this->dirX = -this->dirX;
 248              		.loc 1 65 0
 249 0112 7B68     		ldr	r3, [r7, #4]
 250 0114 5B68     		ldr	r3, [r3, #4]
 251 0116 5A42     		rsbs	r2, r3, #0
 252 0118 7B68     		ldr	r3, [r7, #4]
 253 011a 5A60     		str	r2, [r3, #4]
 254 011c 11E0     		b	.L6
 255              	.L7:
 256              	.LBB3:
  66:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 		} else {
  67:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 			// Right player lost
  68:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 			delay_milli(500);
 257              		.loc 1 68 0
 258 011e FA23     		movs	r3, #250
 259 0120 5B00     		lsls	r3, r3, #1
 260 0122 1800     		movs	r0, r3
 261 0124 FFF7FEFF 		bl	delay_milli
  69:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 			this->posX = 63;
 262              		.loc 1 69 0
 263 0128 7B68     		ldr	r3, [r7, #4]
 264 012a 3F22     		movs	r2, #63
 265 012c DA60     		str	r2, [r3, #12]
  70:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 			this->dirX = -this->dirX;
 266              		.loc 1 70 0
 267 012e 7B68     		ldr	r3, [r7, #4]
 268 0130 5B68     		ldr	r3, [r3, #4]
 269 0132 5A42     		rsbs	r2, r3, #0
 270 0134 7B68     		ldr	r3, [r7, #4]
 271 0136 5A60     		str	r2, [r3, #4]
  71:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 			this->dirY = -this->dirY;
 272              		.loc 1 71 0
 273 0138 7B68     		ldr	r3, [r7, #4]
 274 013a 9B68     		ldr	r3, [r3, #8]
 275 013c 5A42     		rsbs	r2, r3, #0
 276 013e 7B68     		ldr	r3, [r7, #4]
 277 0140 9A60     		str	r2, [r3, #8]
 278              	.L6:
 279              	.LBE3:
  72:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 		}
  73:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 	}
  74:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 	
  75:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 	this->draw(this);
 280              		.loc 1 75 0
 281 0142 7B68     		ldr	r3, [r7, #4]
 282 0144 5B69     		ldr	r3, [r3, #20]
 283 0146 7A68     		ldr	r2, [r7, #4]
 284 0148 1000     		movs	r0, r2
 285 014a 9847     		blx	r3
 286              	.LVL0:
  76:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** }...
 287              		.loc 1 76 0
 288 014c C046     		nop
 289 014e BD46     		mov	sp, r7
 290 0150 04B0     		add	sp, sp, #16
 291              		@ sp needed
 292 0152 80BD     		pop	{r7, pc}
 293              	.L9:
 294              		.align	2
 295              	.L8:
 296 0154 00000000 		.word	leftPaddle
 297 0158 00000000 		.word	rightPaddle
 298              		.cfi_endproc
 299              	.LFE0:
 301              	.Letext0:
 302              		.file 2 "C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong/object.h"
 303              		.file 3 "C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong/ball.h"
 304              		.file 4 "C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong/paddle.h"
