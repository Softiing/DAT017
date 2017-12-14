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
 131 004e 3A4B     		ldr	r3, .L15
 132 0050 3B61     		str	r3, [r7, #16]
  39:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c **** 	POBJECT pl = &leftPaddle;
 133              		.loc 1 39 0
 134 0052 3A4B     		ldr	r3, .L15+4
 135 0054 FB60     		str	r3, [r7, #12]
  40:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c **** 	POBJECT pr = &rightPaddle;
 136              		.loc 1 40 0
 137 0056 3A4B     		ldr	r3, .L15+8
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
  45:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c ****   #endif
  46:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c **** 	
  47:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c **** 	// Set speed for ball
  48:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c **** 	p->set_speed(p, 4, 4);
 145              		.loc 1 48 0
 146 0066 3B69     		ldr	r3, [r7, #16]
 147 0068 1B6A     		ldr	r3, [r3, #32]
 148 006a 3869     		ldr	r0, [r7, #16]
 149 006c 0422     		movs	r2, #4
 150 006e 0421     		movs	r1, #4
 151 0070 9847     		blx	r3
 152              	.LVL0:
 153              	.L14:
 154              	.LBB2:
  49:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c **** 	while(1) {
  50:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c **** 		// Update from keypad
  51:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c **** 		unsigned char *pressedKeys = keyb();
 155              		.loc 1 51 0
 156 0072 FFF7FEFF 		bl	keyb
 157 0076 0300     		movs	r3, r0
 158 0078 7B60     		str	r3, [r7, #4]
  52:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c **** 		pl->set_speed(pl,0,0);
 159              		.loc 1 52 0
 160 007a FB68     		ldr	r3, [r7, #12]
 161 007c 1B6A     		ldr	r3, [r3, #32]
 162 007e F868     		ldr	r0, [r7, #12]
 163 0080 0022     		movs	r2, #0
 164 0082 0021     		movs	r1, #0
 165 0084 9847     		blx	r3
 166              	.LVL1:
  53:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c **** 		pr->set_speed(pr,0,0);
 167              		.loc 1 53 0
 168 0086 BB68     		ldr	r3, [r7, #8]
 169 0088 1B6A     		ldr	r3, [r3, #32]
 170 008a B868     		ldr	r0, [r7, #8]
 171 008c 0022     		movs	r2, #0
 172 008e 0021     		movs	r1, #0
 173 0090 9847     		blx	r3
 174              	.LVL2:
 175              	.LBB3:
  54:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c **** 		for(unsigned char i = 0; i < 4; i++) {
 176              		.loc 1 54 0
 177 0092 1723     		movs	r3, #23
 178 0094 FB18     		adds	r3, r7, r3
 179 0096 0022     		movs	r2, #0
 180 0098 1A70     		strb	r2, [r3]
 181 009a 35E0     		b	.L6
 182              	.L13:
  55:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c **** 			switch(pressedKeys[i]) {
 183              		.loc 1 55 0
 184 009c 1723     		movs	r3, #23
 185 009e FB18     		adds	r3, r7, r3
 186 00a0 1B78     		ldrb	r3, [r3]
 187 00a2 7A68     		ldr	r2, [r7, #4]
 188 00a4 D318     		adds	r3, r2, r3
 189 00a6 1B78     		ldrb	r3, [r3]
 190 00a8 042B     		cmp	r3, #4
 191 00aa 10D0     		beq	.L8
 192 00ac 02DC     		bgt	.L9
 193 00ae 012B     		cmp	r3, #1
 194 00b0 05D0     		beq	.L10
 195 00b2 22E0     		b	.L7
 196              	.L9:
 197 00b4 0C2B     		cmp	r3, #12
 198 00b6 11D0     		beq	.L11
 199 00b8 0D2B     		cmp	r3, #13
 200 00ba 17D0     		beq	.L12
 201 00bc 1DE0     		b	.L7
 202              	.L10:
  56:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c **** 				case 0x01: pl->set_speed(pl,0,-5); break;
 203              		.loc 1 56 0
 204 00be FB68     		ldr	r3, [r7, #12]
 205 00c0 1B6A     		ldr	r3, [r3, #32]
 206 00c2 0522     		movs	r2, #5
 207 00c4 5242     		rsbs	r2, r2, #0
 208 00c6 F868     		ldr	r0, [r7, #12]
 209 00c8 0021     		movs	r1, #0
 210 00ca 9847     		blx	r3
 211              	.LVL3:
 212 00cc 15E0     		b	.L7
 213              	.L8:
  57:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c **** 				case 0x04: pl->set_speed(pl,0,5); break;
 214              		.loc 1 57 0
 215 00ce FB68     		ldr	r3, [r7, #12]
 216 00d0 1B6A     		ldr	r3, [r3, #32]
 217 00d2 F868     		ldr	r0, [r7, #12]
 218 00d4 0522     		movs	r2, #5
 219 00d6 0021     		movs	r1, #0
 220 00d8 9847     		blx	r3
 221              	.LVL4:
 222 00da 0EE0     		b	.L7
 223              	.L11:
  58:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c **** 				case 0x0C: pr->set_speed(pr,0,-5); break;
 224              		.loc 1 58 0
 225 00dc BB68     		ldr	r3, [r7, #8]
 226 00de 1B6A     		ldr	r3, [r3, #32]
 227 00e0 0522     		movs	r2, #5
 228 00e2 5242     		rsbs	r2, r2, #0
 229 00e4 B868     		ldr	r0, [r7, #8]
 230 00e6 0021     		movs	r1, #0
 231 00e8 9847     		blx	r3
 232              	.LVL5:
 233 00ea 06E0     		b	.L7
 234              	.L12:
  59:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c **** 				case 0x0D: pr->set_speed(pr,0,5); break;
 235              		.loc 1 59 0
 236 00ec BB68     		ldr	r3, [r7, #8]
 237 00ee 1B6A     		ldr	r3, [r3, #32]
 238 00f0 B868     		ldr	r0, [r7, #8]
 239 00f2 0522     		movs	r2, #5
 240 00f4 0021     		movs	r1, #0
 241 00f6 9847     		blx	r3
 242              	.LVL6:
 243 00f8 C046     		nop
 244              	.L7:
  54:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c **** 			switch(pressedKeys[i]) {
 245              		.loc 1 54 0 discriminator 2
 246 00fa 1723     		movs	r3, #23
 247 00fc FB18     		adds	r3, r7, r3
 248 00fe 1A78     		ldrb	r2, [r3]
 249 0100 1723     		movs	r3, #23
 250 0102 FB18     		adds	r3, r7, r3
 251 0104 0132     		adds	r2, r2, #1
 252 0106 1A70     		strb	r2, [r3]
 253              	.L6:
  54:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c **** 			switch(pressedKeys[i]) {
 254              		.loc 1 54 0 is_stmt 0 discriminator 1
 255 0108 1723     		movs	r3, #23
 256 010a FB18     		adds	r3, r7, r3
 257 010c 1B78     		ldrb	r3, [r3]
 258 010e 032B     		cmp	r3, #3
 259 0110 C4D9     		bls	.L13
 260              	.LBE3:
  60:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c **** 			}
  61:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c **** 		}
  62:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c **** 		
  63:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c **** 		// Move game objects
  64:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c **** 		p->move(p);
 261              		.loc 1 64 0 is_stmt 1
 262 0112 3B69     		ldr	r3, [r7, #16]
 263 0114 DB69     		ldr	r3, [r3, #28]
 264 0116 3A69     		ldr	r2, [r7, #16]
 265 0118 1000     		movs	r0, r2
 266 011a 9847     		blx	r3
 267              	.LVL7:
  65:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c **** 		pl->move(pl);
 268              		.loc 1 65 0
 269 011c FB68     		ldr	r3, [r7, #12]
 270 011e DB69     		ldr	r3, [r3, #28]
 271 0120 FA68     		ldr	r2, [r7, #12]
 272 0122 1000     		movs	r0, r2
 273 0124 9847     		blx	r3
 274              	.LVL8:
  66:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c **** 		pr->move(pr);
 275              		.loc 1 66 0
 276 0126 BB68     		ldr	r3, [r7, #8]
 277 0128 DB69     		ldr	r3, [r3, #28]
 278 012a BA68     		ldr	r2, [r7, #8]
 279 012c 1000     		movs	r0, r2
 280 012e 9847     		blx	r3
 281              	.LVL9:
  67:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c **** 		delay_milli(30);
 282              		.loc 1 67 0
 283 0130 1E20     		movs	r0, #30
 284 0132 FFF7FEFF 		bl	delay_milli
 285              	.LBE2:
  49:C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong\startup.c **** 		// Update from keypad
 286              		.loc 1 49 0
 287 0136 9CE7     		b	.L14
 288              	.L16:
 289              		.align	2
 290              	.L15:
 291 0138 00000000 		.word	ball
 292 013c 00000000 		.word	leftPaddle
 293 0140 00000000 		.word	rightPaddle
 294              		.cfi_endproc
 295              	.LFE2:
 297              	.Letext0:
 298              		.file 2 "C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong/object.h"
 299              		.file 3 "C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong/ball.h"
 300              		.file 4 "C:/Users/Hampus/Desktop/DAT017/CodeLite/real_pong/paddle.h"
