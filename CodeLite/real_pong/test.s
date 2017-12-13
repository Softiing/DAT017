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
  11              		.file	"timer.c"
  12              		.text
  13              	.Ltext0:
  14              		.cfi_sections	.debug_frame
  15              		.align	1
  16              		.global	delay_250ns
  17              		.syntax unified
  18              		.code	16
  19              		.thumb_func
  20              		.fpu softvfp
  22              	delay_250ns:
  23              	.LFB0:
  24              		.file 1 "C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong/timer.c"
   1:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\timer.c **** #include "timer.h"
   2:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\timer.c **** 
   3:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\timer.c **** #define SIMULATOR
   4:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\timer.c **** 
   5:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\timer.c **** void delay_250ns(void) {
  25              		.loc 1 5 0
  26              		.cfi_startproc
  27              		@ args = 0, pretend = 0, frame = 0
  28              		@ frame_needed = 1, uses_anonymous_args = 0
  29 0000 80B5     		push	{r7, lr}
  30              		.cfi_def_cfa_offset 8
  31              		.cfi_offset 7, -8
  32              		.cfi_offset 14, -4
  33 0002 00AF     		add	r7, sp, #0
  34              		.cfi_def_cfa_register 7
   6:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\timer.c **** 	*STK_CTRL = 0;
  35              		.loc 1 6 0
  36 0004 0C4B     		ldr	r3, .L3
  37 0006 0022     		movs	r2, #0
  38 0008 1A60     		str	r2, [r3]
   7:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\timer.c **** 	*STK_LOAD = 49; //  48 + 1. Have to add one as said in manual
  39              		.loc 1 7 0
  40 000a 0C4B     		ldr	r3, .L3+4
  41 000c 3122     		movs	r2, #49
  42 000e 1A60     		str	r2, [r3]
   8:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\timer.c **** 	*STK_VAL = 0;
  43              		.loc 1 8 0
  44 0010 0B4B     		ldr	r3, .L3+8
  45 0012 0022     		movs	r2, #0
  46 0014 1A60     		str	r2, [r3]
   9:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\timer.c **** 	*STK_CTRL = 5;
  47              		.loc 1 9 0
  48 0016 084B     		ldr	r3, .L3
  49 0018 0522     		movs	r2, #5
  50 001a 1A60     		str	r2, [r3]
  10:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\timer.c **** 	while((*STK_CTRL & 0x10000) == 0) {
  51              		.loc 1 10 0
  52 001c C046     		nop
  53              	.L2:
  54              		.loc 1 10 0 is_stmt 0 discriminator 1
  55 001e 064B     		ldr	r3, .L3
  56 0020 1A68     		ldr	r2, [r3]
  57 0022 8023     		movs	r3, #128
  58 0024 5B02     		lsls	r3, r3, #9
  59 0026 1340     		ands	r3, r2
  60 0028 F9D0     		beq	.L2
  11:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\timer.c **** 		// Do nothing :S
  12:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\timer.c **** 	}
  13:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\timer.c **** 	*STK_CTRL = 0;
  61              		.loc 1 13 0 is_stmt 1
  62 002a 034B     		ldr	r3, .L3
  63 002c 0022     		movs	r2, #0
  64 002e 1A60     		str	r2, [r3]
  14:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\timer.c **** }
  65              		.loc 1 14 0
  66 0030 C046     		nop
  67 0032 BD46     		mov	sp, r7
  68              		@ sp needed
  69 0034 80BD     		pop	{r7, pc}
  70              	.L4:
  71 0036 C046     		.align	2
  72              	.L3:
  73 0038 10E000E0 		.word	-536813552
  74 003c 14E000E0 		.word	-536813548
  75 0040 18E000E0 		.word	-536813544
  76              		.cfi_endproc
  77              	.LFE0:
  79              		.align	1
  80              		.global	delay_micro
  81              		.syntax unified
  82              		.code	16
  83              		.thumb_func
  84              		.fpu softvfp
  86              	delay_micro:
  87              	.LFB1:
  15:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\timer.c **** 
  16:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\timer.c **** void delay_micro(unsigned int us) {
  88              		.loc 1 16 0
  89              		.cfi_startproc
  90              		@ args = 0, pretend = 0, frame = 8
  91              		@ frame_needed = 1, uses_anonymous_args = 0
  92 0044 80B5     		push	{r7, lr}
  93              		.cfi_def_cfa_offset 8
  94              		.cfi_offset 7, -8
  95              		.cfi_offset 14, -4
  96 0046 82B0     		sub	sp, sp, #8
  97              		.cfi_def_cfa_offset 16
  98 0048 00AF     		add	r7, sp, #0
  99              		.cfi_def_cfa_register 7
 100 004a 7860     		str	r0, [r7, #4]
  17:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\timer.c **** 	while(us--) {
 101              		.loc 1 17 0
 102 004c 07E0     		b	.L6
 103              	.L7:
  18:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\timer.c **** 		delay_250ns();
 104              		.loc 1 18 0
 105 004e FFF7FEFF 		bl	delay_250ns
  19:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\timer.c **** 		delay_250ns();
 106              		.loc 1 19 0
 107 0052 FFF7FEFF 		bl	delay_250ns
  20:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\timer.c **** 		delay_250ns();
 108              		.loc 1 20 0
 109 0056 FFF7FEFF 		bl	delay_250ns
  21:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\timer.c **** 		delay_250ns();
 110              		.loc 1 21 0
 111 005a FFF7FEFF 		bl	delay_250ns
 112              	.L6:
  17:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\timer.c **** 		delay_250ns();
 113              		.loc 1 17 0
 114 005e 7B68     		ldr	r3, [r7, #4]
 115 0060 5A1E     		subs	r2, r3, #1
 116 0062 7A60     		str	r2, [r7, #4]
 117 0064 002B     		cmp	r3, #0
 118 0066 F2D1     		bne	.L7
  22:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\timer.c **** 	}
  23:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\timer.c **** }
 119              		.loc 1 23 0
 120 0068 C046     		nop
 121 006a BD46     		mov	sp, r7
 122 006c 02B0     		add	sp, sp, #8
 123              		@ sp needed
 124 006e 80BD     		pop	{r7, pc}
 125              		.cfi_endproc
 126              	.LFE1:
 128              		.align	1
 129              		.global	delay_milli
 130              		.syntax unified
 131              		.code	16
 132              		.thumb_func
 133              		.fpu softvfp
 135              	delay_milli:
 136              	.LFB2:
  24:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\timer.c **** 
  25:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\timer.c **** void delay_milli(unsigned int ms) {
 137              		.loc 1 25 0
 138              		.cfi_startproc
 139              		@ args = 0, pretend = 0, frame = 8
 140              		@ frame_needed = 1, uses_anonymous_args = 0
 141 0070 80B5     		push	{r7, lr}
 142              		.cfi_def_cfa_offset 8
 143              		.cfi_offset 7, -8
 144              		.cfi_offset 14, -4
 145 0072 82B0     		sub	sp, sp, #8
 146              		.cfi_def_cfa_offset 16
 147 0074 00AF     		add	r7, sp, #0
 148              		.cfi_def_cfa_register 7
 149 0076 7860     		str	r0, [r7, #4]
  26:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\timer.c **** 	#ifdef SIMULATOR
  27:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\timer.c **** 		delay_micro(ms);
 150              		.loc 1 27 0
 151 0078 7B68     		ldr	r3, [r7, #4]
 152 007a 1800     		movs	r0, r3
 153 007c FFF7FEFF 		bl	delay_micro
  28:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\timer.c **** 	#else
  29:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\timer.c **** 		delay_micro(1000 * ms);
  30:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\timer.c **** 	#endif
  31:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\timer.c **** }
 154              		.loc 1 31 0
 155 0080 C046     		nop
 156 0082 BD46     		mov	sp, r7
 157 0084 02B0     		add	sp, sp, #8
 158              		@ sp needed
 159 0086 80BD     		pop	{r7, pc}
 160              		.cfi_endproc
 161              	.LFE2:
 163              		.align	1
 164              		.global	delay_500ns
 165              		.syntax unified
 166              		.code	16
 167              		.thumb_func
 168              		.fpu softvfp
 170              	delay_500ns:
 171              	.LFB3:
  32:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\timer.c **** 
  33:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\timer.c **** void delay_500ns(void) {
 172              		.loc 1 33 0
 173              		.cfi_startproc
 174              		@ args = 0, pretend = 0, frame = 0
 175              		@ frame_needed = 1, uses_anonymous_args = 0
 176 0088 80B5     		push	{r7, lr}
 177              		.cfi_def_cfa_offset 8
 178              		.cfi_offset 7, -8
 179              		.cfi_offset 14, -4
 180 008a 00AF     		add	r7, sp, #0
 181              		.cfi_def_cfa_register 7
  34:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\timer.c **** 	delay_250ns();
 182              		.loc 1 34 0
 183 008c FFF7FEFF 		bl	delay_250ns
  35:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\timer.c **** 	delay_250ns();
 184              		.loc 1 35 0
 185 0090 FFF7FEFF 		bl	delay_250ns
  36:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\timer.c **** }
 186              		.loc 1 36 0
 187 0094 C046     		nop
 188 0096 BD46     		mov	sp, r7
 189              		@ sp needed
 190 0098 80BD     		pop	{r7, pc}
 191              		.cfi_endproc
 192              	.LFE3:
 194              	.Letext0:
