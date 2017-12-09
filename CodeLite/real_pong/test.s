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
  48 0024 00000000 		.space	16
  48      00000000 
  48      00000000 
  48      00000000 
  49              		.global	ball
  50              		.align	2
  53              	ball:
  54 0034 00000000 		.word	ball_geometry
  55 0038 00000000 		.word	0
  56 003c 00000000 		.word	0
  57 0040 01000000 		.word	1
  58 0044 01000000 		.word	1
  59 0048 00000000 		.word	draw_object
  60 004c 00000000 		.word	clear_object
  61 0050 00000000 		.word	move_ball
  62 0054 00000000 		.word	set_object_speed
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
   2:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 
   3:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** GEOMETRY ball_geometry = {
   4:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 	12,
   5:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 	4, 4,
   6:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 	{
   7:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 		{0, 1}, {0, 2}, {1, 0}, {1, 1}, {1, 2},
   8:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 		{1, 3}, {2, 0}, {2, 1}, {2, 2}, {2, 3},
   9:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 		{3, 1},
  10:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 		{3, 2}
  11:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 	}
  12:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** };
  13:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 
  14:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** OBJECT ball = {
  15:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 	&ball_geometry,
  16:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 	0, 0,
  17:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 	1, 1,
  18:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 	draw_object,
  19:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 	clear_object,
  20:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 	move_ball,
  21:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 	set_object_speed
  22:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** };
  23:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 
  24:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** void move_ball(POBJECT this) {
  74              		.loc 1 24 0
  75              		.cfi_startproc
  76              		@ args = 0, pretend = 0, frame = 8
  77              		@ frame_needed = 1, uses_anonymous_args = 0
  78 0000 80B5     		push	{r7, lr}
  79              		.cfi_def_cfa_offset 8
  80              		.cfi_offset 7, -8
  81              		.cfi_offset 14, -4
  82 0002 82B0     		sub	sp, sp, #8
  83              		.cfi_def_cfa_offset 16
  84 0004 00AF     		add	r7, sp, #0
  85              		.cfi_def_cfa_register 7
  86 0006 7860     		str	r0, [r7, #4]
  25:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 	clear_object(this);
  87              		.loc 1 25 0
  88 0008 7B68     		ldr	r3, [r7, #4]
  89 000a 1800     		movs	r0, r3
  90 000c FFF7FEFF 		bl	clear_object
  26:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 	
  27:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 	this->posX += this->dirX;
  91              		.loc 1 27 0
  92 0010 7B68     		ldr	r3, [r7, #4]
  93 0012 DA68     		ldr	r2, [r3, #12]
  94 0014 7B68     		ldr	r3, [r7, #4]
  95 0016 5B68     		ldr	r3, [r3, #4]
  96 0018 D218     		adds	r2, r2, r3
  97 001a 7B68     		ldr	r3, [r7, #4]
  98 001c DA60     		str	r2, [r3, #12]
  28:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 	this->posY += this->dirY;
  99              		.loc 1 28 0
 100 001e 7B68     		ldr	r3, [r7, #4]
 101 0020 1A69     		ldr	r2, [r3, #16]
 102 0022 7B68     		ldr	r3, [r7, #4]
 103 0024 9B68     		ldr	r3, [r3, #8]
 104 0026 D218     		adds	r2, r2, r3
 105 0028 7B68     		ldr	r3, [r7, #4]
 106 002a 1A61     		str	r2, [r3, #16]
  29:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 	
  30:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 	// Wall collisions
  31:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 	if((this->posY < 0) ||  this->posY > 63 ) {
 107              		.loc 1 31 0
 108 002c 7B68     		ldr	r3, [r7, #4]
 109 002e 1B69     		ldr	r3, [r3, #16]
 110 0030 002B     		cmp	r3, #0
 111 0032 03DB     		blt	.L2
 112              		.loc 1 31 0 is_stmt 0 discriminator 1
 113 0034 7B68     		ldr	r3, [r7, #4]
 114 0036 1B69     		ldr	r3, [r3, #16]
 115 0038 3F2B     		cmp	r3, #63
 116 003a 04DD     		ble	.L3
 117              	.L2:
  32:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 		this->dirY = -this->dirY;
 118              		.loc 1 32 0 is_stmt 1
 119 003c 7B68     		ldr	r3, [r7, #4]
 120 003e 9B68     		ldr	r3, [r3, #8]
 121 0040 5A42     		rsbs	r2, r3, #0
 122 0042 7B68     		ldr	r3, [r7, #4]
 123 0044 9A60     		str	r2, [r3, #8]
 124              	.L3:
  33:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 	}
  34:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 	
  35:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 	// TODO Paddle collisions
  36:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 	
  37:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** 	this->draw(this);
 125              		.loc 1 37 0
 126 0046 7B68     		ldr	r3, [r7, #4]
 127 0048 5B69     		ldr	r3, [r3, #20]
 128 004a 7A68     		ldr	r2, [r7, #4]
 129 004c 1000     		movs	r0, r2
 130 004e 9847     		blx	r3
 131              	.LVL0:
  38:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\ball.c **** }...
 132              		.loc 1 38 0
 133 0050 C046     		nop
 134 0052 BD46     		mov	sp, r7
 135 0054 02B0     		add	sp, sp, #8
 136              		@ sp needed
 137 0056 80BD     		pop	{r7, pc}
 138              		.cfi_endproc
 139              	.LFE0:
 141              	.Letext0:
 142              		.file 2 "C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong/object.h"
 143              		.file 3 "C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong/ball.h"
