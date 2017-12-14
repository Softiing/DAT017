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
  25              		.file 1 "C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong/startup.c"
   1:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c **** #include "timer.h"
   2:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c **** #include "graphic.h"
   3:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c **** #include "ball.h"
   4:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c **** #include "paddle.h"
   5:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c **** #include "keypad.h"
   6:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c **** 
   7:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c **** 
   8:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
   9:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c **** 
  10:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c **** void startup ( void )
  11:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c **** {
  26              		.loc 1 11 0
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
  12:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c **** __asm volatile(
  31              		.loc 1 12 0
  32              		.syntax divided
  33              	@ 12 "C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong/startup.c" 1
  34 0000 0248     		 LDR R0,=0x2001C000
  35 0002 8546     	 MOV SP,R0
  36 0004 FFF7FEFF 	 BL main
  37 0008 FEE7     	_exit: B .
  38              	
  39              	@ 0 "" 2
  13:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  14:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c **** 	" MOV SP,R0\n"
  15:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c **** 	" BL main\n"				/* call main */
  16:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c **** 	"_exit: B .\n"				/* never return */
  17:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c **** 	) ;
  18:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c **** }
  40              		.loc 1 18 0
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
  19:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c **** 
  20:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c **** void init_app(void) {
  57              		.loc 1 20 0
  58              		.cfi_startproc
  59              		@ args = 0, pretend = 0, frame = 0
  60              		@ frame_needed = 1, uses_anonymous_args = 0
  61 0000 80B5     		push	{r7, lr}
  62              		.cfi_def_cfa_offset 8
  63              		.cfi_offset 7, -8
  64              		.cfi_offset 14, -4
  65 0002 00AF     		add	r7, sp, #0
  66              		.cfi_def_cfa_register 7
  21:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c **** 	// Setup display
  22:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c **** 	*GPIO_E_MODER = 0x55555555;
  67              		.loc 1 22 0
  68 0004 0B4B     		ldr	r3, .L3
  69 0006 0C4A     		ldr	r2, .L3+4
  70 0008 1A60     		str	r2, [r3]
  23:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c **** 	
  24:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c **** 	// Setup for keypad
  25:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c **** 	*GPIO_D_MODER = 0x55000000;
  71              		.loc 1 25 0
  72 000a 0C4B     		ldr	r3, .L3+8
  73 000c AA22     		movs	r2, #170
  74 000e D205     		lsls	r2, r2, #23
  75 0010 1A60     		str	r2, [r3]
  26:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c **** 	*GPIO_D_OTYPER &= 0x0000FFFF;   
  76              		.loc 1 26 0
  77 0012 0B4B     		ldr	r3, .L3+12
  78 0014 0A4A     		ldr	r2, .L3+12
  79 0016 1288     		ldrh	r2, [r2]
  80 0018 92B2     		uxth	r2, r2
  81 001a 1A80     		strh	r2, [r3]
  27:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c **** 	*GPIO_D_OTYPER |= 0x00000000;     
  82              		.loc 1 27 0
  83 001c 084B     		ldr	r3, .L3+12
  84 001e 084A     		ldr	r2, .L3+12
  85 0020 1288     		ldrh	r2, [r2]
  86 0022 92B2     		uxth	r2, r2
  87 0024 1A80     		strh	r2, [r3]
  28:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c **** 	*GPIO_D_PUPDR = 0x00AA0000;    
  88              		.loc 1 28 0
  89 0026 074B     		ldr	r3, .L3+16
  90 0028 AA22     		movs	r2, #170
  91 002a 1204     		lsls	r2, r2, #16
  92 002c 1A60     		str	r2, [r3]
  29:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c **** }
  93              		.loc 1 29 0
  94 002e C046     		nop
  95 0030 BD46     		mov	sp, r7
  96              		@ sp needed
  97 0032 80BD     		pop	{r7, pc}
  98              	.L4:
  99              		.align	2
 100              	.L3:
 101 0034 00100240 		.word	1073876992
 102 0038 55555555 		.word	1431655765
 103 003c 000C0240 		.word	1073875968
 104 0040 040C0240 		.word	1073875972
 105 0044 0C0C0240 		.word	1073875980
 106              		.cfi_endproc
 107              	.LFE1:
 109              		.align	1
 110              		.global	main
 111              		.syntax unified
 112              		.code	16
 113              		.thumb_func
 114              		.fpu softvfp
 116              	main:
 117              	.LFB2:
  30:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c **** 
  31:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c **** 
  32:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c **** 
  33:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c **** extern OBJECT ball;
  34:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c **** extern OBJECT leftPaddle;
  35:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c **** extern OBJECT rightPaddle;
  36:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c **** 
  37:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c **** void main(void) {
 118              		.loc 1 37 0
 119              		.cfi_startproc
 120              		@ args = 0, pretend = 0, frame = 24
 121              		@ frame_needed = 1, uses_anonymous_args = 0
 122 0048 80B5     		push	{r7, lr}
 123              		.cfi_def_cfa_offset 8
 124              		.cfi_offset 7, -8
 125              		.cfi_offset 14, -4
 126 004a 86B0     		sub	sp, sp, #24
 127              		.cfi_def_cfa_offset 32
 128 004c 00AF     		add	r7, sp, #0
 129              		.cfi_def_cfa_register 7
  38:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c **** 	POBJECT p = &ball;
 130              		.loc 1 38 0
 131 004e 374B     		ldr	r3, .L15
 132 0050 3B61     		str	r3, [r7, #16]
  39:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c **** 	POBJECT pl = &leftPaddle;
 133              		.loc 1 39 0
 134 0052 374B     		ldr	r3, .L15+4
 135 0054 FB60     		str	r3, [r7, #12]
  40:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c **** 	POBJECT pr = &rightPaddle;
 136              		.loc 1 40 0
 137 0056 374B     		ldr	r3, .L15+8
 138 0058 BB60     		str	r3, [r7, #8]
  41:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c **** 	init_app();
 139              		.loc 1 41 0
 140 005a FFF7FEFF 		bl	init_app
  42:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c **** 	graphic_initialize();
 141              		.loc 1 42 0
 142 005e FFF7FEFF 		bl	graphic_initialize
  43:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c ****   #ifndef SIMULATOR
  44:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c **** 	graphic_clear_screen();
 143              		.loc 1 44 0
 144 0062 FFF7FEFF 		bl	graphic_clear_screen
 145              	.L14:
 146              	.LBB2:
  45:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c ****   #endif
  46:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c ****   
  47:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c **** //	p->set_speed(p, 4, 4);
  48:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c **** 	while(1) {
  49:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c **** 		// Update from keypad
  50:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c **** 		unsigned char *pressedKeys = keyb();
 147              		.loc 1 50 0
 148 0066 FFF7FEFF 		bl	keyb
 149 006a 0300     		movs	r3, r0
 150 006c 7B60     		str	r3, [r7, #4]
  51:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c **** 		pl->set_speed(pl,0,0);
 151              		.loc 1 51 0
 152 006e FB68     		ldr	r3, [r7, #12]
 153 0070 1B6A     		ldr	r3, [r3, #32]
 154 0072 F868     		ldr	r0, [r7, #12]
 155 0074 0022     		movs	r2, #0
 156 0076 0021     		movs	r1, #0
 157 0078 9847     		blx	r3
 158              	.LVL0:
  52:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c **** 		pr->set_speed(pr,0,0);
 159              		.loc 1 52 0
 160 007a BB68     		ldr	r3, [r7, #8]
 161 007c 1B6A     		ldr	r3, [r3, #32]
 162 007e B868     		ldr	r0, [r7, #8]
 163 0080 0022     		movs	r2, #0
 164 0082 0021     		movs	r1, #0
 165 0084 9847     		blx	r3
 166              	.LVL1:
 167              	.LBB3:
  53:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c **** 		for(unsigned char i = 0; i < 4; i++) {
 168              		.loc 1 53 0
 169 0086 1723     		movs	r3, #23
 170 0088 FB18     		adds	r3, r7, r3
 171 008a 0022     		movs	r2, #0
 172 008c 1A70     		strb	r2, [r3]
 173 008e 35E0     		b	.L6
 174              	.L13:
  54:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c **** 			switch(pressedKeys[i]) {
 175              		.loc 1 54 0
 176 0090 1723     		movs	r3, #23
 177 0092 FB18     		adds	r3, r7, r3
 178 0094 1B78     		ldrb	r3, [r3]
 179 0096 7A68     		ldr	r2, [r7, #4]
 180 0098 D318     		adds	r3, r2, r3
 181 009a 1B78     		ldrb	r3, [r3]
 182 009c 042B     		cmp	r3, #4
 183 009e 10D0     		beq	.L8
 184 00a0 02DC     		bgt	.L9
 185 00a2 012B     		cmp	r3, #1
 186 00a4 05D0     		beq	.L10
 187 00a6 22E0     		b	.L7
 188              	.L9:
 189 00a8 0C2B     		cmp	r3, #12
 190 00aa 11D0     		beq	.L11
 191 00ac 0D2B     		cmp	r3, #13
 192 00ae 17D0     		beq	.L12
 193 00b0 1DE0     		b	.L7
 194              	.L10:
  55:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c **** 				case 0x01: pl->set_speed(pl,0,-5); break;
 195              		.loc 1 55 0
 196 00b2 FB68     		ldr	r3, [r7, #12]
 197 00b4 1B6A     		ldr	r3, [r3, #32]
 198 00b6 0522     		movs	r2, #5
 199 00b8 5242     		rsbs	r2, r2, #0
 200 00ba F868     		ldr	r0, [r7, #12]
 201 00bc 0021     		movs	r1, #0
 202 00be 9847     		blx	r3
 203              	.LVL2:
 204 00c0 15E0     		b	.L7
 205              	.L8:
  56:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c **** 				case 0x04: pl->set_speed(pl,0,5); break;
 206              		.loc 1 56 0
 207 00c2 FB68     		ldr	r3, [r7, #12]
 208 00c4 1B6A     		ldr	r3, [r3, #32]
 209 00c6 F868     		ldr	r0, [r7, #12]
 210 00c8 0522     		movs	r2, #5
 211 00ca 0021     		movs	r1, #0
 212 00cc 9847     		blx	r3
 213              	.LVL3:
 214 00ce 0EE0     		b	.L7
 215              	.L11:
  57:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c **** 				case 0x0C: pr->set_speed(pr,0,-5); break;
 216              		.loc 1 57 0
 217 00d0 BB68     		ldr	r3, [r7, #8]
 218 00d2 1B6A     		ldr	r3, [r3, #32]
 219 00d4 0522     		movs	r2, #5
 220 00d6 5242     		rsbs	r2, r2, #0
 221 00d8 B868     		ldr	r0, [r7, #8]
 222 00da 0021     		movs	r1, #0
 223 00dc 9847     		blx	r3
 224              	.LVL4:
 225 00de 06E0     		b	.L7
 226              	.L12:
  58:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c **** 				case 0x0D: pr->set_speed(pr,0,5); break;
 227              		.loc 1 58 0
 228 00e0 BB68     		ldr	r3, [r7, #8]
 229 00e2 1B6A     		ldr	r3, [r3, #32]
 230 00e4 B868     		ldr	r0, [r7, #8]
 231 00e6 0522     		movs	r2, #5
 232 00e8 0021     		movs	r1, #0
 233 00ea 9847     		blx	r3
 234              	.LVL5:
 235 00ec C046     		nop
 236              	.L7:
  53:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c **** 			switch(pressedKeys[i]) {
 237              		.loc 1 53 0 discriminator 2
 238 00ee 1723     		movs	r3, #23
 239 00f0 FB18     		adds	r3, r7, r3
 240 00f2 1A78     		ldrb	r2, [r3]
 241 00f4 1723     		movs	r3, #23
 242 00f6 FB18     		adds	r3, r7, r3
 243 00f8 0132     		adds	r2, r2, #1
 244 00fa 1A70     		strb	r2, [r3]
 245              	.L6:
  53:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c **** 			switch(pressedKeys[i]) {
 246              		.loc 1 53 0 is_stmt 0 discriminator 1
 247 00fc 1723     		movs	r3, #23
 248 00fe FB18     		adds	r3, r7, r3
 249 0100 1B78     		ldrb	r3, [r3]
 250 0102 032B     		cmp	r3, #3
 251 0104 C4D9     		bls	.L13
 252              	.LBE3:
  59:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c **** 			}
  60:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c **** 		}
  61:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c **** 		p->move(p);
 253              		.loc 1 61 0 is_stmt 1
 254 0106 3B69     		ldr	r3, [r7, #16]
 255 0108 DB69     		ldr	r3, [r3, #28]
 256 010a 3A69     		ldr	r2, [r7, #16]
 257 010c 1000     		movs	r0, r2
 258 010e 9847     		blx	r3
 259              	.LVL6:
  62:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c **** 		pl->move(pl);
 260              		.loc 1 62 0
 261 0110 FB68     		ldr	r3, [r7, #12]
 262 0112 DB69     		ldr	r3, [r3, #28]
 263 0114 FA68     		ldr	r2, [r7, #12]
 264 0116 1000     		movs	r0, r2
 265 0118 9847     		blx	r3
 266              	.LVL7:
  63:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c **** 		pr->move(pr);
 267              		.loc 1 63 0
 268 011a BB68     		ldr	r3, [r7, #8]
 269 011c DB69     		ldr	r3, [r3, #28]
 270 011e BA68     		ldr	r2, [r7, #8]
 271 0120 1000     		movs	r0, r2
 272 0122 9847     		blx	r3
 273              	.LVL8:
  64:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c **** 		delay_milli(50);
 274              		.loc 1 64 0
 275 0124 3220     		movs	r0, #50
 276 0126 FFF7FEFF 		bl	delay_milli
 277              	.LBE2:
  48:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c **** 		// Update from keypad
 278              		.loc 1 48 0
 279 012a 9CE7     		b	.L14
 280              	.L16:
 281              		.align	2
 282              	.L15:
 283 012c 00000000 		.word	ball
 284 0130 00000000 		.word	leftPaddle
 285 0134 00000000 		.word	rightPaddle
 286              		.cfi_endproc
 287              	.LFE2:
 289              	.Letext0:
 290              		.file 2 "C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong/object.h"
 291              		.file 3 "C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong/ball.h"
 292              		.file 4 "C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong/paddle.h"
