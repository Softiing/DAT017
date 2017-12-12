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
  11              		.file	"paddle.c"
  12              		.text
  13              	.Ltext0:
  14              		.cfi_sections	.debug_frame
  15              		.global	paddle_geometry
  16              		.data
  17              		.align	2
  20              	paddle_geometry:
  21 0000 64000000 		.word	100
  22 0004 04000000 		.word	4
  23 0008 19000000 		.word	25
  24 000c 00       		.byte	0
  25 000d 00       		.byte	0
  26 000e 01       		.byte	1
  27 000f 00       		.byte	0
  28 0010 02       		.byte	2
  29 0011 00       		.byte	0
  30 0012 03       		.byte	3
  31 0013 00       		.byte	0
  32 0014 00       		.byte	0
  33 0015 01       		.byte	1
  34 0016 01       		.byte	1
  35 0017 01       		.byte	1
  36 0018 02       		.byte	2
  37 0019 01       		.byte	1
  38 001a 03       		.byte	3
  39 001b 01       		.byte	1
  40 001c 00       		.byte	0
  41 001d 02       		.byte	2
  42 001e 01       		.byte	1
  43 001f 02       		.byte	2
  44 0020 02       		.byte	2
  45 0021 02       		.byte	2
  46 0022 03       		.byte	3
  47 0023 02       		.byte	2
  48 0024 00       		.byte	0
  49 0025 03       		.byte	3
  50 0026 01       		.byte	1
  51 0027 03       		.byte	3
  52 0028 02       		.byte	2
  53 0029 03       		.byte	3
  54 002a 03       		.byte	3
  55 002b 03       		.byte	3
  56 002c 00       		.byte	0
  57 002d 04       		.byte	4
  58 002e 01       		.byte	1
  59 002f 04       		.byte	4
  60 0030 02       		.byte	2
  61 0031 04       		.byte	4
  62 0032 03       		.byte	3
  63 0033 04       		.byte	4
  64 0034 00       		.byte	0
  65 0035 05       		.byte	5
  66 0036 01       		.byte	1
  67 0037 05       		.byte	5
  68 0038 02       		.byte	2
  69 0039 05       		.byte	5
  70 003a 03       		.byte	3
  71 003b 05       		.byte	5
  72 003c 00       		.byte	0
  73 003d 06       		.byte	6
  74 003e 01       		.byte	1
  75 003f 06       		.byte	6
  76 0040 02       		.byte	2
  77 0041 06       		.byte	6
  78 0042 03       		.byte	3
  79 0043 06       		.byte	6
  80 0044 00       		.byte	0
  81 0045 07       		.byte	7
  82 0046 01       		.byte	1
  83 0047 07       		.byte	7
  84 0048 02       		.byte	2
  85 0049 07       		.byte	7
  86 004a 03       		.byte	3
  87 004b 07       		.byte	7
  88 004c 00       		.byte	0
  89 004d 08       		.byte	8
  90 004e 01       		.byte	1
  91 004f 08       		.byte	8
  92 0050 02       		.byte	2
  93 0051 08       		.byte	8
  94 0052 03       		.byte	3
  95 0053 08       		.byte	8
  96 0054 00       		.byte	0
  97 0055 09       		.byte	9
  98 0056 01       		.byte	1
  99 0057 09       		.byte	9
 100 0058 02       		.byte	2
 101 0059 09       		.byte	9
 102 005a 03       		.byte	3
 103 005b 09       		.byte	9
 104 005c 00       		.byte	0
 105 005d 0A       		.byte	10
 106 005e 01       		.byte	1
 107 005f 0A       		.byte	10
 108 0060 02       		.byte	2
 109 0061 0A       		.byte	10
 110 0062 03       		.byte	3
 111 0063 0A       		.byte	10
 112 0064 00       		.byte	0
 113 0065 0B       		.byte	11
 114 0066 01       		.byte	1
 115 0067 0B       		.byte	11
 116 0068 02       		.byte	2
 117 0069 0B       		.byte	11
 118 006a 03       		.byte	3
 119 006b 0B       		.byte	11
 120 006c 00       		.byte	0
 121 006d 0C       		.byte	12
 122 006e 01       		.byte	1
 123 006f 0C       		.byte	12
 124 0070 02       		.byte	2
 125 0071 0C       		.byte	12
 126 0072 03       		.byte	3
 127 0073 0C       		.byte	12
 128 0074 00       		.byte	0
 129 0075 0D       		.byte	13
 130 0076 01       		.byte	1
 131 0077 0D       		.byte	13
 132 0078 02       		.byte	2
 133 0079 0D       		.byte	13
 134 007a 03       		.byte	3
 135 007b 0D       		.byte	13
 136 007c 00       		.byte	0
 137 007d 0E       		.byte	14
 138 007e 01       		.byte	1
 139 007f 0E       		.byte	14
 140 0080 02       		.byte	2
 141 0081 0E       		.byte	14
 142 0082 03       		.byte	3
 143 0083 0E       		.byte	14
 144 0084 00       		.byte	0
 145 0085 0F       		.byte	15
 146 0086 01       		.byte	1
 147 0087 0F       		.byte	15
 148 0088 02       		.byte	2
 149 0089 0F       		.byte	15
 150 008a 03       		.byte	3
 151 008b 0F       		.byte	15
 152 008c 00       		.byte	0
 153 008d 10       		.byte	16
 154 008e 01       		.byte	1
 155 008f 10       		.byte	16
 156 0090 02       		.byte	2
 157 0091 10       		.byte	16
 158 0092 03       		.byte	3
 159 0093 10       		.byte	16
 160 0094 00       		.byte	0
 161 0095 11       		.byte	17
 162 0096 01       		.byte	1
 163 0097 11       		.byte	17
 164 0098 02       		.byte	2
 165 0099 11       		.byte	17
 166 009a 03       		.byte	3
 167 009b 11       		.byte	17
 168 009c 00       		.byte	0
 169 009d 12       		.byte	18
 170 009e 01       		.byte	1
 171 009f 12       		.byte	18
 172 00a0 02       		.byte	2
 173 00a1 12       		.byte	18
 174 00a2 03       		.byte	3
 175 00a3 12       		.byte	18
 176 00a4 00       		.byte	0
 177 00a5 13       		.byte	19
 178 00a6 01       		.byte	1
 179 00a7 13       		.byte	19
 180 00a8 02       		.byte	2
 181 00a9 13       		.byte	19
 182 00aa 03       		.byte	3
 183 00ab 13       		.byte	19
 184 00ac 00       		.byte	0
 185 00ad 14       		.byte	20
 186 00ae 01       		.byte	1
 187 00af 14       		.byte	20
 188 00b0 02       		.byte	2
 189 00b1 14       		.byte	20
 190 00b2 03       		.byte	3
 191 00b3 14       		.byte	20
 192 00b4 00       		.byte	0
 193 00b5 15       		.byte	21
 194 00b6 01       		.byte	1
 195 00b7 15       		.byte	21
 196 00b8 02       		.byte	2
 197 00b9 15       		.byte	21
 198 00ba 03       		.byte	3
 199 00bb 15       		.byte	21
 200 00bc 00       		.byte	0
 201 00bd 16       		.byte	22
 202 00be 01       		.byte	1
 203 00bf 16       		.byte	22
 204 00c0 02       		.byte	2
 205 00c1 16       		.byte	22
 206 00c2 03       		.byte	3
 207 00c3 16       		.byte	22
 208 00c4 00       		.byte	0
 209 00c5 17       		.byte	23
 210 00c6 01       		.byte	1
 211 00c7 17       		.byte	23
 212 00c8 02       		.byte	2
 213 00c9 17       		.byte	23
 214 00ca 03       		.byte	3
 215 00cb 17       		.byte	23
 216 00cc 00       		.byte	0
 217 00cd 18       		.byte	24
 218 00ce 01       		.byte	1
 219 00cf 18       		.byte	24
 220 00d0 02       		.byte	2
 221 00d1 18       		.byte	24
 222 00d2 03       		.byte	3
 223 00d3 18       		.byte	24
 224              		.global	leftPaddle
 225              		.align	2
 228              	leftPaddle:
 229 00d4 00000000 		.word	paddle_geometry
 230 00d8 00000000 		.word	0
 231 00dc 00000000 		.word	0
 232 00e0 01000000 		.word	1
 233 00e4 20000000 		.word	32
 234 00e8 00000000 		.word	draw_object
 235 00ec 00000000 		.word	clear_object
 236 00f0 00000000 		.word	move_paddle
 237 00f4 00000000 		.word	set_object_speed
 238              		.global	rightPaddle
 239              		.align	2
 242              	rightPaddle:
 243 00f8 00000000 		.word	paddle_geometry
 244 00fc 00000000 		.word	0
 245 0100 00000000 		.word	0
 246 0104 7C000000 		.word	124
 247 0108 20000000 		.word	32
 248 010c 00000000 		.word	draw_object
 249 0110 00000000 		.word	clear_object
 250 0114 00000000 		.word	move_paddle
 251 0118 00000000 		.word	set_object_speed
 252              		.text
 253              		.align	1
 254              		.global	move_paddle
 255              		.syntax unified
 256              		.code	16
 257              		.thumb_func
 258              		.fpu softvfp
 260              	move_paddle:
 261              	.LFB0:
 262              		.file 1 "C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong/paddle.c"
   1:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** #include "paddle.h"
   2:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 
   3:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** GEOMETRY paddle_geometry = {
   4:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 	100,
   5:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 	4, 25,
   6:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 	{
   7:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 		{0, 0}, {1, 0}, {2, 0}, {3, 0},
   8:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 		{0, 1}, {1, 1}, {2, 1}, {3, 1},
   9:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 		{0, 2}, {1, 2}, {2, 2}, {3, 2},
  10:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 		{0, 3}, {1, 3}, {2, 3}, {3, 3},
  11:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 		{0, 4}, {1, 4}, {2, 4}, {3, 4},
  12:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 		{0, 5}, {1, 5}, {2, 5}, {3, 5},
  13:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 		{0, 6}, {1, 6}, {2, 6}, {3, 6},
  14:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 		{0, 7}, {1, 7}, {2, 7}, {3, 7},
  15:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 		{0, 8}, {1, 8}, {2, 8}, {3, 8},
  16:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 		{0, 9}, {1, 9}, {2, 9}, {3, 9},
  17:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 		{0, 10}, {1, 10}, {2, 10}, {3, 10},
  18:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 		{0, 11}, {1, 11}, {2, 11}, {3, 11},
  19:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 		{0, 12}, {1, 12}, {2, 12}, {3, 12},
  20:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 		{0, 13}, {1, 13}, {2, 13}, {3, 13},
  21:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 		{0, 14}, {1, 14}, {2, 14}, {3, 14},
  22:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 		{0, 15}, {1, 15}, {2, 15}, {3, 15},
  23:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 		{0, 16}, {1, 16}, {2, 16}, {3, 16},
  24:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 		{0, 17}, {1, 17}, {2, 17}, {3, 17},
  25:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 		{0, 18}, {1, 18}, {2, 18}, {3, 18},
  26:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 		{0, 19}, {1, 19}, {2, 19}, {3, 19},
  27:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 		{0, 20}, {1, 20}, {2, 20}, {3, 20},
  28:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 		{0, 21}, {1, 21}, {2, 21}, {3, 21},
  29:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 		{0, 22}, {1, 22}, {2, 22}, {3, 22},
  30:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 		{0, 23}, {1, 23}, {2, 23}, {3, 23},
  31:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 		{0, 24}, {1, 24}, {2, 24}, {3, 24},
  32:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 	}
  33:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** };
  34:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 
  35:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** OBJECT leftPaddle = {
  36:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 	&paddle_geometry,
  37:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 	0, 0,
  38:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 	1, 32,
  39:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 	draw_object,
  40:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 	clear_object,
  41:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 	move_paddle,
  42:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 	set_object_speed
  43:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** };
  44:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 
  45:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** OBJECT rightPaddle = {
  46:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 	&paddle_geometry,
  47:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 	0, 0,
  48:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 	124, 32,
  49:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 	draw_object,
  50:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 	clear_object,
  51:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 	move_paddle,
  52:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 	set_object_speed
  53:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** };
  54:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 
  55:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** void move_paddle(POBJECT this) {
 263              		.loc 1 55 0
 264              		.cfi_startproc
 265              		@ args = 0, pretend = 0, frame = 8
 266              		@ frame_needed = 1, uses_anonymous_args = 0
 267 0000 80B5     		push	{r7, lr}
 268              		.cfi_def_cfa_offset 8
 269              		.cfi_offset 7, -8
 270              		.cfi_offset 14, -4
 271 0002 82B0     		sub	sp, sp, #8
 272              		.cfi_def_cfa_offset 16
 273 0004 00AF     		add	r7, sp, #0
 274              		.cfi_def_cfa_register 7
 275 0006 7860     		str	r0, [r7, #4]
  56:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 	clear_object(this);
 276              		.loc 1 56 0
 277 0008 7B68     		ldr	r3, [r7, #4]
 278 000a 1800     		movs	r0, r3
 279 000c FFF7FEFF 		bl	clear_object
  57:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 	
  58:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 	// Move paddle in y direction only.
  59:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 	this->posY += this->dirY;
 280              		.loc 1 59 0
 281 0010 7B68     		ldr	r3, [r7, #4]
 282 0012 1A69     		ldr	r2, [r3, #16]
 283 0014 7B68     		ldr	r3, [r7, #4]
 284 0016 9B68     		ldr	r3, [r3, #8]
 285 0018 D218     		adds	r2, r2, r3
 286 001a 7B68     		ldr	r3, [r7, #4]
 287 001c 1A61     		str	r2, [r3, #16]
  60:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 	
  61:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 	// Wall collisions todo add width check with paddle.
  62:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 	if(this->posY < 0) {
 288              		.loc 1 62 0
 289 001e 7B68     		ldr	r3, [r7, #4]
 290 0020 1B69     		ldr	r3, [r3, #16]
 291 0022 002B     		cmp	r3, #0
 292 0024 03DA     		bge	.L2
  63:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 		this->posY = 0;
 293              		.loc 1 63 0
 294 0026 7B68     		ldr	r3, [r7, #4]
 295 0028 0022     		movs	r2, #0
 296 002a 1A61     		str	r2, [r3, #16]
 297 002c 0EE0     		b	.L3
 298              	.L2:
  64:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 	} else if(this->posY + this->geo->sizeY > 127) {
 299              		.loc 1 64 0
 300 002e 7B68     		ldr	r3, [r7, #4]
 301 0030 1A69     		ldr	r2, [r3, #16]
 302 0032 7B68     		ldr	r3, [r7, #4]
 303 0034 1B68     		ldr	r3, [r3]
 304 0036 9B68     		ldr	r3, [r3, #8]
 305 0038 D318     		adds	r3, r2, r3
 306 003a 7F2B     		cmp	r3, #127
 307 003c 06DD     		ble	.L3
  65:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 		this->posY = 127 - this->geo->sizeY;
 308              		.loc 1 65 0
 309 003e 7B68     		ldr	r3, [r7, #4]
 310 0040 1B68     		ldr	r3, [r3]
 311 0042 9B68     		ldr	r3, [r3, #8]
 312 0044 7F22     		movs	r2, #127
 313 0046 D21A     		subs	r2, r2, r3
 314 0048 7B68     		ldr	r3, [r7, #4]
 315 004a 1A61     		str	r2, [r3, #16]
 316              	.L3:
  66:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 	}
  67:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 	
  68:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 	this->draw(this);
 317              		.loc 1 68 0
 318 004c 7B68     		ldr	r3, [r7, #4]
 319 004e 5B69     		ldr	r3, [r3, #20]
 320 0050 7A68     		ldr	r2, [r7, #4]
 321 0052 1000     		movs	r0, r2
 322 0054 9847     		blx	r3
 323              	.LVL0:
  69:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** }...
 324              		.loc 1 69 0
 325 0056 C046     		nop
 326 0058 BD46     		mov	sp, r7
 327 005a 02B0     		add	sp, sp, #8
 328              		@ sp needed
 329 005c 80BD     		pop	{r7, pc}
 330              		.cfi_endproc
 331              	.LFE0:
 333              	.Letext0:
 334              		.file 2 "C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong/object.h"
 335              		.file 3 "C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong/paddle.h"
