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
  25              		.file 1 "C:/Users/Hampus/Desktop/DAT017/CodeLite/robotarm/startup.c"
   1:C:/Users/Hampus/Desktop/DAT017/CodeLite/robotarm\startup.c **** /*
   2:C:/Users/Hampus/Desktop/DAT017/CodeLite/robotarm\startup.c ****  * 	startup.c
   3:C:/Users/Hampus/Desktop/DAT017/CodeLite/robotarm\startup.c ****  *
   4:C:/Users/Hampus/Desktop/DAT017/CodeLite/robotarm\startup.c ****  */
   5:C:/Users/Hampus/Desktop/DAT017/CodeLite/robotarm\startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
   6:C:/Users/Hampus/Desktop/DAT017/CodeLite/robotarm\startup.c **** 
   7:C:/Users/Hampus/Desktop/DAT017/CodeLite/robotarm\startup.c **** void startup ( void )
   8:C:/Users/Hampus/Desktop/DAT017/CodeLite/robotarm\startup.c **** {
  26              		.loc 1 8 0
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
   9:C:/Users/Hampus/Desktop/DAT017/CodeLite/robotarm\startup.c **** __asm volatile(
  31              		.loc 1 9 0
  32              		.syntax divided
  33              	@ 9 "C:/Users/Hampus/Desktop/DAT017/CodeLite/robotarm/startup.c" 1
  34 0000 0248     		 LDR R0,=0x2001C000
  35 0002 8546     	 MOV SP,R0
  36 0004 FFF7FEFF 	 BL main
  37 0008 FEE7     	_exit: B .
  38              	
  39              	@ 0 "" 2
  10:C:/Users/Hampus/Desktop/DAT017/CodeLite/robotarm\startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  11:C:/Users/Hampus/Desktop/DAT017/CodeLite/robotarm\startup.c **** 	" MOV SP,R0\n"
  12:C:/Users/Hampus/Desktop/DAT017/CodeLite/robotarm\startup.c **** 	" BL main\n"				/* call main */
  13:C:/Users/Hampus/Desktop/DAT017/CodeLite/robotarm\startup.c **** 	"_exit: B .\n"				/* never return */
  14:C:/Users/Hampus/Desktop/DAT017/CodeLite/robotarm\startup.c **** 	) ;
  15:C:/Users/Hampus/Desktop/DAT017/CodeLite/robotarm\startup.c **** }
  40              		.loc 1 15 0
  41              		.thumb
  42              		.syntax unified
  43 000a C046     		nop
  44              		.cfi_endproc
  45              	.LFE0:
  47              		.text
  48              		.align	1
  49              		.global	move
  50              		.syntax unified
  51              		.code	16
  52              		.thumb_func
  53              		.fpu softvfp
  55              	move:
  56              	.LFB1:
  16:C:/Users/Hampus/Desktop/DAT017/CodeLite/robotarm\startup.c **** 
  17:C:/Users/Hampus/Desktop/DAT017/CodeLite/robotarm\startup.c **** typedef struct {
  18:C:/Users/Hampus/Desktop/DAT017/CodeLite/robotarm\startup.c **** 	volatile unsigned char ctrl;
  19:C:/Users/Hampus/Desktop/DAT017/CodeLite/robotarm\startup.c **** 	volatile unsigned char datax;
  20:C:/Users/Hampus/Desktop/DAT017/CodeLite/robotarm\startup.c **** 	volatile unsigned char datay;
  21:C:/Users/Hampus/Desktop/DAT017/CodeLite/robotarm\startup.c **** 	volatile unsigned char posx;
  22:C:/Users/Hampus/Desktop/DAT017/CodeLite/robotarm\startup.c **** 	volatile unsigned char posy;
  23:C:/Users/Hampus/Desktop/DAT017/CodeLite/robotarm\startup.c **** } ROBOT;
  24:C:/Users/Hampus/Desktop/DAT017/CodeLite/robotarm\startup.c **** 
  25:C:/Users/Hampus/Desktop/DAT017/CodeLite/robotarm\startup.c **** #define Robot ((volatile ROBOT*) 0x0800)
  26:C:/Users/Hampus/Desktop/DAT017/CodeLite/robotarm\startup.c **** 
  27:C:/Users/Hampus/Desktop/DAT017/CodeLite/robotarm\startup.c **** void move(int x, int y) {
  57              		.loc 1 27 0
  58              		.cfi_startproc
  59              		@ args = 0, pretend = 0, frame = 8
  60              		@ frame_needed = 1, uses_anonymous_args = 0
  61 0000 80B5     		push	{r7, lr}
  62              		.cfi_def_cfa_offset 8
  63              		.cfi_offset 7, -8
  64              		.cfi_offset 14, -4
  65 0002 82B0     		sub	sp, sp, #8
  66              		.cfi_def_cfa_offset 16
  67 0004 00AF     		add	r7, sp, #0
  68              		.cfi_def_cfa_register 7
  69 0006 7860     		str	r0, [r7, #4]
  70 0008 3960     		str	r1, [r7]
  28:C:/Users/Hampus/Desktop/DAT017/CodeLite/robotarm\startup.c **** 	Robot->datax = x;
  71              		.loc 1 28 0
  72 000a 8023     		movs	r3, #128
  73 000c 1B01     		lsls	r3, r3, #4
  74 000e 7A68     		ldr	r2, [r7, #4]
  75 0010 D2B2     		uxtb	r2, r2
  76 0012 5A70     		strb	r2, [r3, #1]
  29:C:/Users/Hampus/Desktop/DAT017/CodeLite/robotarm\startup.c **** 	Robot->datay = y;
  77              		.loc 1 29 0
  78 0014 8023     		movs	r3, #128
  79 0016 1B01     		lsls	r3, r3, #4
  80 0018 3A68     		ldr	r2, [r7]
  81 001a D2B2     		uxtb	r2, r2
  82 001c 9A70     		strb	r2, [r3, #2]
  30:C:/Users/Hampus/Desktop/DAT017/CodeLite/robotarm\startup.c **** 	Robot->ctrl |= (1<<6);
  83              		.loc 1 30 0
  84 001e 8023     		movs	r3, #128
  85 0020 1B01     		lsls	r3, r3, #4
  86 0022 8022     		movs	r2, #128
  87 0024 1201     		lsls	r2, r2, #4
  88 0026 1278     		ldrb	r2, [r2]
  89 0028 D2B2     		uxtb	r2, r2
  90 002a 4021     		movs	r1, #64
  91 002c 0A43     		orrs	r2, r1
  92 002e D2B2     		uxtb	r2, r2
  93 0030 1A70     		strb	r2, [r3]
  31:C:/Users/Hampus/Desktop/DAT017/CodeLite/robotarm\startup.c **** 	while((Robot->posx != x) && (Robot->posy != y));
  94              		.loc 1 31 0
  95 0032 C046     		nop
  96              	.L4:
  97              		.loc 1 31 0 is_stmt 0 discriminator 2
  98 0034 8023     		movs	r3, #128
  99 0036 1B01     		lsls	r3, r3, #4
 100 0038 DB78     		ldrb	r3, [r3, #3]
 101 003a DBB2     		uxtb	r3, r3
 102 003c 1A00     		movs	r2, r3
 103 003e 7B68     		ldr	r3, [r7, #4]
 104 0040 9A42     		cmp	r2, r3
 105 0042 07D0     		beq	.L3
 106              		.loc 1 31 0 discriminator 1
 107 0044 8023     		movs	r3, #128
 108 0046 1B01     		lsls	r3, r3, #4
 109 0048 1B79     		ldrb	r3, [r3, #4]
 110 004a DBB2     		uxtb	r3, r3
 111 004c 1A00     		movs	r2, r3
 112 004e 3B68     		ldr	r3, [r7]
 113 0050 9A42     		cmp	r2, r3
 114 0052 EFD1     		bne	.L4
 115              	.L3:
  32:C:/Users/Hampus/Desktop/DAT017/CodeLite/robotarm\startup.c **** 	Robot->ctrl &= ~(1<<6);
 116              		.loc 1 32 0 is_stmt 1
 117 0054 8023     		movs	r3, #128
 118 0056 1B01     		lsls	r3, r3, #4
 119 0058 8022     		movs	r2, #128
 120 005a 1201     		lsls	r2, r2, #4
 121 005c 1278     		ldrb	r2, [r2]
 122 005e D2B2     		uxtb	r2, r2
 123 0060 4021     		movs	r1, #64
 124 0062 8A43     		bics	r2, r1
 125 0064 D2B2     		uxtb	r2, r2
 126 0066 1A70     		strb	r2, [r3]
  33:C:/Users/Hampus/Desktop/DAT017/CodeLite/robotarm\startup.c **** }
 127              		.loc 1 33 0
 128 0068 C046     		nop
 129 006a BD46     		mov	sp, r7
 130 006c 02B0     		add	sp, sp, #8
 131              		@ sp needed
 132 006e 80BD     		pop	{r7, pc}
 133              		.cfi_endproc
 134              	.LFE1:
 136              		.align	1
 137              		.global	returnFive
 138              		.syntax unified
 139              		.code	16
 140              		.thumb_func
 141              		.fpu softvfp
 143              	returnFive:
 144              	.LFB2:
  34:C:/Users/Hampus/Desktop/DAT017/CodeLite/robotarm\startup.c **** 
  35:C:/Users/Hampus/Desktop/DAT017/CodeLite/robotarm\startup.c **** int returnFive() {
 145              		.loc 1 35 0
 146              		.cfi_startproc
 147              		@ args = 0, pretend = 0, frame = 0
 148              		@ frame_needed = 1, uses_anonymous_args = 0
 149 0070 80B5     		push	{r7, lr}
 150              		.cfi_def_cfa_offset 8
 151              		.cfi_offset 7, -8
 152              		.cfi_offset 14, -4
 153 0072 00AF     		add	r7, sp, #0
 154              		.cfi_def_cfa_register 7
  36:C:/Users/Hampus/Desktop/DAT017/CodeLite/robotarm\startup.c **** 	return 5;
 155              		.loc 1 36 0
 156 0074 0523     		movs	r3, #5
  37:C:/Users/Hampus/Desktop/DAT017/CodeLite/robotarm\startup.c **** }
 157              		.loc 1 37 0
 158 0076 1800     		movs	r0, r3
 159 0078 BD46     		mov	sp, r7
 160              		@ sp needed
 161 007a 80BD     		pop	{r7, pc}
 162              		.cfi_endproc
 163              	.LFE2:
 165              		.align	1
 166              		.global	init
 167              		.syntax unified
 168              		.code	16
 169              		.thumb_func
 170              		.fpu softvfp
 172              	init:
 173              	.LFB3:
  38:C:/Users/Hampus/Desktop/DAT017/CodeLite/robotarm\startup.c **** 
  39:C:/Users/Hampus/Desktop/DAT017/CodeLite/robotarm\startup.c **** 
  40:C:/Users/Hampus/Desktop/DAT017/CodeLite/robotarm\startup.c **** void init() {
 174              		.loc 1 40 0
 175              		.cfi_startproc
 176              		@ args = 0, pretend = 0, frame = 0
 177              		@ frame_needed = 1, uses_anonymous_args = 0
 178 007c 80B5     		push	{r7, lr}
 179              		.cfi_def_cfa_offset 8
 180              		.cfi_offset 7, -8
 181              		.cfi_offset 14, -4
 182 007e 00AF     		add	r7, sp, #0
 183              		.cfi_def_cfa_register 7
  41:C:/Users/Hampus/Desktop/DAT017/CodeLite/robotarm\startup.c **** 	move(0,0);
 184              		.loc 1 41 0
 185 0080 0021     		movs	r1, #0
 186 0082 0020     		movs	r0, #0
 187 0084 FFF7FEFF 		bl	move
  42:C:/Users/Hampus/Desktop/DAT017/CodeLite/robotarm\startup.c **** }
 188              		.loc 1 42 0
 189 0088 C046     		nop
 190 008a BD46     		mov	sp, r7
 191              		@ sp needed
 192 008c 80BD     		pop	{r7, pc}
 193              		.cfi_endproc
 194              	.LFE3:
 196              		.align	1
 197              		.global	bringHam
 198              		.syntax unified
 199              		.code	16
 200              		.thumb_func
 201              		.fpu softvfp
 203              	bringHam:
 204              	.LFB4:
  43:C:/Users/Hampus/Desktop/DAT017/CodeLite/robotarm\startup.c **** 
  44:C:/Users/Hampus/Desktop/DAT017/CodeLite/robotarm\startup.c **** void bringHam(int (*test) (void)) {
 205              		.loc 1 44 0
 206              		.cfi_startproc
 207              		@ args = 0, pretend = 0, frame = 16
 208              		@ frame_needed = 1, uses_anonymous_args = 0
 209 008e 80B5     		push	{r7, lr}
 210              		.cfi_def_cfa_offset 8
 211              		.cfi_offset 7, -8
 212              		.cfi_offset 14, -4
 213 0090 84B0     		sub	sp, sp, #16
 214              		.cfi_def_cfa_offset 24
 215 0092 00AF     		add	r7, sp, #0
 216              		.cfi_def_cfa_register 7
 217 0094 7860     		str	r0, [r7, #4]
  45:C:/Users/Hampus/Desktop/DAT017/CodeLite/robotarm\startup.c **** 	int i = test();
 218              		.loc 1 45 0
 219 0096 7B68     		ldr	r3, [r7, #4]
 220 0098 9847     		blx	r3
 221              	.LVL0:
 222 009a 0300     		movs	r3, r0
 223 009c FB60     		str	r3, [r7, #12]
  46:C:/Users/Hampus/Desktop/DAT017/CodeLite/robotarm\startup.c **** 	*((void (**) (void)) 0x2000001) = init;
 224              		.loc 1 46 0
 225 009e 034B     		ldr	r3, .L9
 226 00a0 034A     		ldr	r2, .L9+4
 227 00a2 1A60     		str	r2, [r3]
  47:C:/Users/Hampus/Desktop/DAT017/CodeLite/robotarm\startup.c **** }
 228              		.loc 1 47 0
 229 00a4 C046     		nop
 230 00a6 BD46     		mov	sp, r7
 231 00a8 04B0     		add	sp, sp, #16
 232              		@ sp needed
 233 00aa 80BD     		pop	{r7, pc}
 234              	.L10:
 235              		.align	2
 236              	.L9:
 237 00ac 01000002 		.word	33554433
 238 00b0 00000000 		.word	init
 239              		.cfi_endproc
 240              	.LFE4:
 242              		.align	1
 243              		.global	main
 244              		.syntax unified
 245              		.code	16
 246              		.thumb_func
 247              		.fpu softvfp
 249              	main:
 250              	.LFB5:
  48:C:/Users/Hampus/Desktop/DAT017/CodeLite/robotarm\startup.c **** 
  49:C:/Users/Hampus/Desktop/DAT017/CodeLite/robotarm\startup.c **** 
  50:C:/Users/Hampus/Desktop/DAT017/CodeLite/robotarm\startup.c **** typedef void (*vfunc) (void);
  51:C:/Users/Hampus/Desktop/DAT017/CodeLite/robotarm\startup.c **** typedef void (*pfunc) (unsigned char);
  52:C:/Users/Hampus/Desktop/DAT017/CodeLite/robotarm\startup.c **** typedef unsigned char (*rfunc) (void);
  53:C:/Users/Hampus/Desktop/DAT017/CodeLite/robotarm\startup.c **** 
  54:C:/Users/Hampus/Desktop/DAT017/CodeLite/robotarm\startup.c **** 
  55:C:/Users/Hampus/Desktop/DAT017/CodeLite/robotarm\startup.c **** void main(void) {
 251              		.loc 1 55 0
 252              		.cfi_startproc
 253              		@ args = 0, pretend = 0, frame = 0
 254              		@ frame_needed = 1, uses_anonymous_args = 0
 255 00b4 80B5     		push	{r7, lr}
 256              		.cfi_def_cfa_offset 8
 257              		.cfi_offset 7, -8
 258              		.cfi_offset 14, -4
 259 00b6 00AF     		add	r7, sp, #0
 260              		.cfi_def_cfa_register 7
  56:C:/Users/Hampus/Desktop/DAT017/CodeLite/robotarm\startup.c **** 	bringHam(returnFive);
 261              		.loc 1 56 0
 262 00b8 034B     		ldr	r3, .L12
 263 00ba 1800     		movs	r0, r3
 264 00bc FFF7FEFF 		bl	bringHam
  57:C:/Users/Hampus/Desktop/DAT017/CodeLite/robotarm\startup.c **** }
 265              		.loc 1 57 0
 266 00c0 C046     		nop
 267 00c2 BD46     		mov	sp, r7
 268              		@ sp needed
 269 00c4 80BD     		pop	{r7, pc}
 270              	.L13:
 271 00c6 C046     		.align	2
 272              	.L12:
 273 00c8 00000000 		.word	returnFive
 274              		.cfi_endproc
 275              	.LFE5:
 277              	.Letext0:
