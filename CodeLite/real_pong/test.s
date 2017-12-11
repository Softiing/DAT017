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
  48 0024 00000000 		.space	16
  48      00000000 
  48      00000000 
  48      00000000 
  49              		.global	leftPaddle
  50              		.align	2
  53              	leftPaddle:
  54 0034 00000000 		.word	paddle_geometry
  55 0038 00000000 		.word	0
  56 003c 00000000 		.word	0
  57 0040 01000000 		.word	1
  58 0044 01000000 		.word	1
  59 0048 00000000 		.word	draw_object
  60 004c 00000000 		.word	clear_object
  61 0050 00000000 		.word	move_paddle
  62 0054 00000000 		.word	set_object_speed
  63              		.global	rightPaddle
  64              		.align	2
  67              	rightPaddle:
  68 0058 00000000 		.word	paddle_geometry
  69 005c 00000000 		.word	0
  70 0060 00000000 		.word	0
  71 0064 01000000 		.word	1
  72 0068 01000000 		.word	1
  73 006c 00000000 		.word	draw_object
  74 0070 00000000 		.word	clear_object
  75 0074 00000000 		.word	move_paddle
  76 0078 00000000 		.word	set_object_speed
  77              		.text
  78              		.align	1
  79              		.global	move_paddle
  80              		.syntax unified
  81              		.code	16
  82              		.thumb_func
  83              		.fpu softvfp
  85              	move_paddle:
  86              	.LFB0:
  87              		.file 1 "C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong/paddle.c"
   1:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** #include "paddle.h"
   2:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 
   3:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** GEOMETRY paddle_geometry = {
   4:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 	12,
   5:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 	4, 4,
   6:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 	{
   7:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 		{0, 1}, {0, 2}, {1, 0}, {1, 1}, {1, 2},
   8:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 		{1, 3}, {2, 0}, {2, 1}, {2, 2}, {2, 3},
   9:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 		{3, 1},
  10:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 		{3, 2}
  11:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 	}
  12:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** };
  13:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 
  14:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** OBJECT leftPaddle = {
  15:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 	&paddle_geometry,
  16:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 	0, 0,
  17:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 	1, 1,
  18:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 	draw_object,
  19:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 	clear_object,
  20:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 	move_paddle,
  21:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 	set_object_speed
  22:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** };
  23:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 
  24:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** OBJECT rightPaddle = {
  25:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 	&paddle_geometry,
  26:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 	0, 0,
  27:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 	1, 1,
  28:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 	draw_object,
  29:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 	clear_object,
  30:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 	move_paddle,
  31:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 	set_object_speed
  32:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** };
  33:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 
  34:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** void move_paddle(POBJECT this) {
  88              		.loc 1 34 0
  89              		.cfi_startproc
  90              		@ args = 0, pretend = 0, frame = 8
  91              		@ frame_needed = 1, uses_anonymous_args = 0
  92 0000 80B5     		push	{r7, lr}
  93              		.cfi_def_cfa_offset 8
  94              		.cfi_offset 7, -8
  95              		.cfi_offset 14, -4
  96 0002 82B0     		sub	sp, sp, #8
  97              		.cfi_def_cfa_offset 16
  98 0004 00AF     		add	r7, sp, #0
  99              		.cfi_def_cfa_register 7
 100 0006 7860     		str	r0, [r7, #4]
  35:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 	clear_object(this);
 101              		.loc 1 35 0
 102 0008 7B68     		ldr	r3, [r7, #4]
 103 000a 1800     		movs	r0, r3
 104 000c FFF7FEFF 		bl	clear_object
  36:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 	
  37:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 	// Move paddle in y direction only.
  38:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 	this->posY += this->dirY;
 105              		.loc 1 38 0
 106 0010 7B68     		ldr	r3, [r7, #4]
 107 0012 1A69     		ldr	r2, [r3, #16]
 108 0014 7B68     		ldr	r3, [r7, #4]
 109 0016 9B68     		ldr	r3, [r3, #8]
 110 0018 D218     		adds	r2, r2, r3
 111 001a 7B68     		ldr	r3, [r7, #4]
 112 001c 1A61     		str	r2, [r3, #16]
  39:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 	
  40:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 	// Wall collisions todo add width check with paddle.
  41:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 	if(this->posY < 0) {
 113              		.loc 1 41 0
 114 001e 7B68     		ldr	r3, [r7, #4]
 115 0020 1B69     		ldr	r3, [r3, #16]
 116 0022 002B     		cmp	r3, #0
 117 0024 03DA     		bge	.L2
  42:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 		this->posY = 0;
 118              		.loc 1 42 0
 119 0026 7B68     		ldr	r3, [r7, #4]
 120 0028 0022     		movs	r2, #0
 121 002a 1A61     		str	r2, [r3, #16]
 122 002c 0EE0     		b	.L3
 123              	.L2:
  43:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 	} else if(this->posY + this->geo->sizeY > 127) {
 124              		.loc 1 43 0
 125 002e 7B68     		ldr	r3, [r7, #4]
 126 0030 1A69     		ldr	r2, [r3, #16]
 127 0032 7B68     		ldr	r3, [r7, #4]
 128 0034 1B68     		ldr	r3, [r3]
 129 0036 9B68     		ldr	r3, [r3, #8]
 130 0038 D318     		adds	r3, r2, r3
 131 003a 7F2B     		cmp	r3, #127
 132 003c 06DD     		ble	.L3
  44:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 		this->posY = 127 - this->geo->sizeY;
 133              		.loc 1 44 0
 134 003e 7B68     		ldr	r3, [r7, #4]
 135 0040 1B68     		ldr	r3, [r3]
 136 0042 9B68     		ldr	r3, [r3, #8]
 137 0044 7F22     		movs	r2, #127
 138 0046 D21A     		subs	r2, r2, r3
 139 0048 7B68     		ldr	r3, [r7, #4]
 140 004a 1A61     		str	r2, [r3, #16]
 141              	.L3:
  45:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 	}
  46:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 	
  47:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** 	this->draw(this);
 142              		.loc 1 47 0
 143 004c 7B68     		ldr	r3, [r7, #4]
 144 004e 5B69     		ldr	r3, [r3, #20]
 145 0050 7A68     		ldr	r2, [r7, #4]
 146 0052 1000     		movs	r0, r2
 147 0054 9847     		blx	r3
 148              	.LVL0:
  48:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\paddle.c **** }...
 149              		.loc 1 48 0
 150 0056 C046     		nop
 151 0058 BD46     		mov	sp, r7
 152 005a 02B0     		add	sp, sp, #8
 153              		@ sp needed
 154 005c 80BD     		pop	{r7, pc}
 155              		.cfi_endproc
 156              	.LFE0:
 158              	.Letext0:
 159              		.file 2 "C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong/object.h"
 160              		.file 3 "C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong/paddle.h"
