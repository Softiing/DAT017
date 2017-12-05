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
  25              		.file 1 "C:/Users/Hampus/Desktop/DAT017/CodeLite/autopong/startup.c"
   1:C:/Users/Hampus/Desktop/DAT017/CodeLite/autopong\startup.c **** #include "timer.h"
   2:C:/Users/Hampus/Desktop/DAT017/CodeLite/autopong\startup.c **** #include "graphic.h"
   3:C:/Users/Hampus/Desktop/DAT017/CodeLite/autopong\startup.c **** #include "ball.h"
   4:C:/Users/Hampus/Desktop/DAT017/CodeLite/autopong\startup.c **** 
   5:C:/Users/Hampus/Desktop/DAT017/CodeLite/autopong\startup.c **** #define SIMULATOR
   6:C:/Users/Hampus/Desktop/DAT017/CodeLite/autopong\startup.c **** 
   7:C:/Users/Hampus/Desktop/DAT017/CodeLite/autopong\startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
   8:C:/Users/Hampus/Desktop/DAT017/CodeLite/autopong\startup.c **** 
   9:C:/Users/Hampus/Desktop/DAT017/CodeLite/autopong\startup.c **** void startup ( void )
  10:C:/Users/Hampus/Desktop/DAT017/CodeLite/autopong\startup.c **** {
  26              		.loc 1 10 0
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
  11:C:/Users/Hampus/Desktop/DAT017/CodeLite/autopong\startup.c **** __asm volatile(
  31              		.loc 1 11 0
  32              		.syntax divided
  33              	@ 11 "C:/Users/Hampus/Desktop/DAT017/CodeLite/autopong/startup.c" 1
  34 0000 0248     		 LDR R0,=0x2001C000
  35 0002 8546     	 MOV SP,R0
  36 0004 FFF7FEFF 	 BL main
  37 0008 FEE7     	_exit: B .
  38              	
  39              	@ 0 "" 2
  12:C:/Users/Hampus/Desktop/DAT017/CodeLite/autopong\startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  13:C:/Users/Hampus/Desktop/DAT017/CodeLite/autopong\startup.c **** 	" MOV SP,R0\n"
  14:C:/Users/Hampus/Desktop/DAT017/CodeLite/autopong\startup.c **** 	" BL main\n"				/* call main */
  15:C:/Users/Hampus/Desktop/DAT017/CodeLite/autopong\startup.c **** 	"_exit: B .\n"				/* never return */
  16:C:/Users/Hampus/Desktop/DAT017/CodeLite/autopong\startup.c **** 	) ;
  17:C:/Users/Hampus/Desktop/DAT017/CodeLite/autopong\startup.c **** }
  40              		.loc 1 17 0
  41              		.thumb
  42              		.syntax unified
  43 000a C046     		nop
  44              		.cfi_endproc
  45              	.LFE0:
  47              		.text
  48              		.align	1
  49              		.global	init_app
  50              		.syntax unified
  51              		.code	16
  52              		.thumb_func
  53              		.fpu softvfp
  55              	init_app:
  56              	.LFB1:
  18:C:/Users/Hampus/Desktop/DAT017/CodeLite/autopong\startup.c **** 
  19:C:/Users/Hampus/Desktop/DAT017/CodeLite/autopong\startup.c **** void init_app(void) {
  57              		.loc 1 19 0
  58              		.cfi_startproc
  59              		@ args = 0, pretend = 0, frame = 0
  60              		@ frame_needed = 1, uses_anonymous_args = 0
  61 0000 80B5     		push	{r7, lr}
  62              		.cfi_def_cfa_offset 8
  63              		.cfi_offset 7, -8
  64              		.cfi_offset 14, -4
  65 0002 00AF     		add	r7, sp, #0
  66              		.cfi_def_cfa_register 7
  20:C:/Users/Hampus/Desktop/DAT017/CodeLite/autopong\startup.c **** 	*GPIO_MODER = 0x55555555;
  67              		.loc 1 20 0
  68 0004 024B     		ldr	r3, .L3
  69 0006 034A     		ldr	r2, .L3+4
  70 0008 1A60     		str	r2, [r3]
  21:C:/Users/Hampus/Desktop/DAT017/CodeLite/autopong\startup.c **** }
  71              		.loc 1 21 0
  72 000a C046     		nop
  73 000c BD46     		mov	sp, r7
  74              		@ sp needed
  75 000e 80BD     		pop	{r7, pc}
  76              	.L4:
  77              		.align	2
  78              	.L3:
  79 0010 00100240 		.word	1073876992
  80 0014 55555555 		.word	1431655765
  81              		.cfi_endproc
  82              	.LFE1:
  84              		.align	1
  85              		.global	main
  86              		.syntax unified
  87              		.code	16
  88              		.thumb_func
  89              		.fpu softvfp
  91              	main:
  92              	.LFB2:
  22:C:/Users/Hampus/Desktop/DAT017/CodeLite/autopong\startup.c **** 
  23:C:/Users/Hampus/Desktop/DAT017/CodeLite/autopong\startup.c **** extern OBJECT ball;
  24:C:/Users/Hampus/Desktop/DAT017/CodeLite/autopong\startup.c **** 
  25:C:/Users/Hampus/Desktop/DAT017/CodeLite/autopong\startup.c **** void main(void) {
  93              		.loc 1 25 0
  94              		.cfi_startproc
  95              		@ args = 0, pretend = 0, frame = 8
  96              		@ frame_needed = 1, uses_anonymous_args = 0
  97 0018 80B5     		push	{r7, lr}
  98              		.cfi_def_cfa_offset 8
  99              		.cfi_offset 7, -8
 100              		.cfi_offset 14, -4
 101 001a 82B0     		sub	sp, sp, #8
 102              		.cfi_def_cfa_offset 16
 103 001c 00AF     		add	r7, sp, #0
 104              		.cfi_def_cfa_register 7
  26:C:/Users/Hampus/Desktop/DAT017/CodeLite/autopong\startup.c **** 	POBJECT p = &ball;
 105              		.loc 1 26 0
 106 001e 0A4B     		ldr	r3, .L7
 107 0020 7B60     		str	r3, [r7, #4]
  27:C:/Users/Hampus/Desktop/DAT017/CodeLite/autopong\startup.c **** 	init_app();
 108              		.loc 1 27 0
 109 0022 FFF7FEFF 		bl	init_app
  28:C:/Users/Hampus/Desktop/DAT017/CodeLite/autopong\startup.c **** 	graphic_initalize();
 110              		.loc 1 28 0
 111 0026 FFF7FEFF 		bl	graphic_initalize
  29:C:/Users/Hampus/Desktop/DAT017/CodeLite/autopong\startup.c ****   #ifndef SIMULATOR
  30:C:/Users/Hampus/Desktop/DAT017/CodeLite/autopong\startup.c **** 	graphic_clear_screen();
  31:C:/Users/Hampus/Desktop/DAT017/CodeLite/autopong\startup.c ****   #endif
  32:C:/Users/Hampus/Desktop/DAT017/CodeLite/autopong\startup.c ****   
  33:C:/Users/Hampus/Desktop/DAT017/CodeLite/autopong\startup.c **** 	p->set_speed(p, 16, 16);
 112              		.loc 1 33 0
 113 002a 7B68     		ldr	r3, [r7, #4]
 114 002c 1B6A     		ldr	r3, [r3, #32]
 115 002e 7868     		ldr	r0, [r7, #4]
 116 0030 1022     		movs	r2, #16
 117 0032 1021     		movs	r1, #16
 118 0034 9847     		blx	r3
 119              	.LVL0:
 120              	.L6:
  34:C:/Users/Hampus/Desktop/DAT017/CodeLite/autopong\startup.c **** 	while(1) {
  35:C:/Users/Hampus/Desktop/DAT017/CodeLite/autopong\startup.c **** 		p->move(p);
 121              		.loc 1 35 0 discriminator 1
 122 0036 7B68     		ldr	r3, [r7, #4]
 123 0038 DB69     		ldr	r3, [r3, #28]
 124 003a 7A68     		ldr	r2, [r7, #4]
 125 003c 1000     		movs	r0, r2
 126 003e 9847     		blx	r3
 127              	.LVL1:
  36:C:/Users/Hampus/Desktop/DAT017/CodeLite/autopong\startup.c **** 		delay_milli(40);
 128              		.loc 1 36 0 discriminator 1
 129 0040 2820     		movs	r0, #40
 130 0042 FFF7FEFF 		bl	delay_milli
  35:C:/Users/Hampus/Desktop/DAT017/CodeLite/autopong\startup.c **** 		delay_milli(40);
 131              		.loc 1 35 0 discriminator 1
 132 0046 F6E7     		b	.L6
 133              	.L8:
 134              		.align	2
 135              	.L7:
 136 0048 00000000 		.word	ball
 137              		.cfi_endproc
 138              	.LFE2:
 140              	.Letext0:
 141              		.file 2 "C:/Users/Hampus/Desktop/DAT017/CodeLite/autopong/object.h"
 142              		.file 3 "C:/Users/Hampus/Desktop/DAT017/CodeLite/autopong/ball.h"
