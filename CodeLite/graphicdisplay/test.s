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
  25              		.file 1 "C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay/startup.c"
   1:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** // Timer setup
   2:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** #define STK 0xE000E010
   3:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** #define STK_CTRL ((volatile unsigned int *) (STK))
   4:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** #define STK_LOAD ((volatile unsigned int *) (STK + 0x4))
   5:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** #define STK_VAL ((volatile unsigned int *) (STK + 0x8))
   6:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 
   7:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** // Port E setup
   8:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** #define GPIO_E 0x40021000
   9:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** #define GPIO_MODER ((volatile unsigned int *) (GPIO_E))
  10:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** #define GPIO_OTYPER ((volatile unsigned short *) (GPIO_E+0x4))
  11:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** #define GPIO_PUPDR ((volatile unsigned int *) (GPIO_E+0xC))
  12:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** #define GPIO_IDR_LOW ((volatile unsigned char *) (GPIO_E+0x10))
  13:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** #define GPIO_IDR_HIGH ((volatile unsigned char *) (GPIO_E+0x11))
  14:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** #define GPIO_ODR_LOW ((volatile unsigned char *) (GPIO_E+0x14))
  15:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** #define GPIO_ODR_HIGH ((volatile unsigned char *) (GPIO_E+0x15))
  16:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 
  17:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** // Control for display
  18:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** #define B_E 0x40
  19:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** #define B_SELECT 0x04
  20:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** #define B_RW 0x02
  21:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** #define B_RS 0x01
  22:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 
  23:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** #define B_RST 0x20
  24:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** #define B_CS2 0x10
  25:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** #define B_CS1 0x08
  26:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 
  27:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** typedef unsigned char uint8_t;
  28:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 
  29:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
  30:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 
  31:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** void startup ( void )
  32:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** {
  26              		.loc 1 32 0
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
  33:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** __asm volatile(
  31              		.loc 1 33 0
  32              		.syntax divided
  33              	@ 33 "C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay/startup.c" 1
  34 0000 0648     		 LDR R0,=0x2001C000
  35 0002 8546     	 MOV SP,R0
  36 0004 FFF7FEFF 	 BL main
  37 0008 FEE7     	_exit: B .
  38              	
  39              	@ 0 "" 2
  34:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  35:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	" MOV SP,R0\n"
  36:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	" BL main\n"				/* call main */
  37:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	"_exit: B .\n"				/* never return */
  38:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	) ;
  39:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	
  40:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	// Setup output pins for display
  41:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	*GPIO_MODER = 0x55555555;
  40              		.loc 1 41 0
  41              		.thumb
  42              		.syntax unified
  43 000a 024B     		ldr	r3, .L2
  44 000c 024A     		ldr	r2, .L2+4
  45 000e 1A60     		str	r2, [r3]
  42:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** }
  46              		.loc 1 42 0
  47 0010 C046     		nop
  48              	.L3:
  49 0012 C046     		.align	2
  50              	.L2:
  51 0014 00100240 		.word	1073876992
  52 0018 55555555 		.word	1431655765
  53              		.cfi_endproc
  54              	.LFE0:
  56              		.text
  57              		.align	1
  58              		.global	delay_250ns
  59              		.syntax unified
  60              		.code	16
  61              		.thumb_func
  62              		.fpu softvfp
  64              	delay_250ns:
  65              	.LFB1:
  43:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 
  44:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** void delay_250ns(void) {
  66              		.loc 1 44 0
  67              		.cfi_startproc
  68              		@ args = 0, pretend = 0, frame = 0
  69              		@ frame_needed = 1, uses_anonymous_args = 0
  70 0000 80B5     		push	{r7, lr}
  71              		.cfi_def_cfa_offset 8
  72              		.cfi_offset 7, -8
  73              		.cfi_offset 14, -4
  74 0002 00AF     		add	r7, sp, #0
  75              		.cfi_def_cfa_register 7
  45:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	*STK_CTRL = 0;
  76              		.loc 1 45 0
  77 0004 0C4B     		ldr	r3, .L6
  78 0006 0022     		movs	r2, #0
  79 0008 1A60     		str	r2, [r3]
  46:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	*STK_LOAD = 49; //  48 + 1. Have to add one as said in manual
  80              		.loc 1 46 0
  81 000a 0C4B     		ldr	r3, .L6+4
  82 000c 3122     		movs	r2, #49
  83 000e 1A60     		str	r2, [r3]
  47:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	*STK_VAL = 0;
  84              		.loc 1 47 0
  85 0010 0B4B     		ldr	r3, .L6+8
  86 0012 0022     		movs	r2, #0
  87 0014 1A60     		str	r2, [r3]
  48:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	*STK_CTRL = 5;
  88              		.loc 1 48 0
  89 0016 084B     		ldr	r3, .L6
  90 0018 0522     		movs	r2, #5
  91 001a 1A60     		str	r2, [r3]
  49:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	while((*STK_CTRL & 0x10000) == 0) {
  92              		.loc 1 49 0
  93 001c C046     		nop
  94              	.L5:
  95              		.loc 1 49 0 is_stmt 0 discriminator 1
  96 001e 064B     		ldr	r3, .L6
  97 0020 1A68     		ldr	r2, [r3]
  98 0022 8023     		movs	r3, #128
  99 0024 5B02     		lsls	r3, r3, #9
 100 0026 1340     		ands	r3, r2
 101 0028 F9D0     		beq	.L5
  50:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		// Do nothing :S
  51:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	}
  52:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	*STK_CTRL = 0;
 102              		.loc 1 52 0 is_stmt 1
 103 002a 034B     		ldr	r3, .L6
 104 002c 0022     		movs	r2, #0
 105 002e 1A60     		str	r2, [r3]
  53:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** }
 106              		.loc 1 53 0
 107 0030 C046     		nop
 108 0032 BD46     		mov	sp, r7
 109              		@ sp needed
 110 0034 80BD     		pop	{r7, pc}
 111              	.L7:
 112 0036 C046     		.align	2
 113              	.L6:
 114 0038 10E000E0 		.word	-536813552
 115 003c 14E000E0 		.word	-536813548
 116 0040 18E000E0 		.word	-536813544
 117              		.cfi_endproc
 118              	.LFE1:
 120              		.align	1
 121              		.global	delay_mikro
 122              		.syntax unified
 123              		.code	16
 124              		.thumb_func
 125              		.fpu softvfp
 127              	delay_mikro:
 128              	.LFB2:
  54:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 
  55:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** void delay_mikro(unsigned int us) {
 129              		.loc 1 55 0
 130              		.cfi_startproc
 131              		@ args = 0, pretend = 0, frame = 8
 132              		@ frame_needed = 1, uses_anonymous_args = 0
 133 0044 80B5     		push	{r7, lr}
 134              		.cfi_def_cfa_offset 8
 135              		.cfi_offset 7, -8
 136              		.cfi_offset 14, -4
 137 0046 82B0     		sub	sp, sp, #8
 138              		.cfi_def_cfa_offset 16
 139 0048 00AF     		add	r7, sp, #0
 140              		.cfi_def_cfa_register 7
 141 004a 7860     		str	r0, [r7, #4]
  56:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	while(us--) {
 142              		.loc 1 56 0
 143 004c 07E0     		b	.L9
 144              	.L10:
  57:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		delay_250ns();
 145              		.loc 1 57 0
 146 004e FFF7FEFF 		bl	delay_250ns
  58:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		delay_250ns();
 147              		.loc 1 58 0
 148 0052 FFF7FEFF 		bl	delay_250ns
  59:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		delay_250ns();
 149              		.loc 1 59 0
 150 0056 FFF7FEFF 		bl	delay_250ns
  60:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		delay_250ns();
 151              		.loc 1 60 0
 152 005a FFF7FEFF 		bl	delay_250ns
 153              	.L9:
  56:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		delay_250ns();
 154              		.loc 1 56 0
 155 005e 7B68     		ldr	r3, [r7, #4]
 156 0060 5A1E     		subs	r2, r3, #1
 157 0062 7A60     		str	r2, [r7, #4]
 158 0064 002B     		cmp	r3, #0
 159 0066 F2D1     		bne	.L10
  61:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	}
  62:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** }
 160              		.loc 1 62 0
 161 0068 C046     		nop
 162 006a BD46     		mov	sp, r7
 163 006c 02B0     		add	sp, sp, #8
 164              		@ sp needed
 165 006e 80BD     		pop	{r7, pc}
 166              		.cfi_endproc
 167              	.LFE2:
 169              		.align	1
 170              		.global	delay_milli
 171              		.syntax unified
 172              		.code	16
 173              		.thumb_func
 174              		.fpu softvfp
 176              	delay_milli:
 177              	.LFB3:
  63:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 
  64:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** void delay_milli(unsigned int ms) {
 178              		.loc 1 64 0
 179              		.cfi_startproc
 180              		@ args = 0, pretend = 0, frame = 8
 181              		@ frame_needed = 1, uses_anonymous_args = 0
 182 0070 80B5     		push	{r7, lr}
 183              		.cfi_def_cfa_offset 8
 184              		.cfi_offset 7, -8
 185              		.cfi_offset 14, -4
 186 0072 82B0     		sub	sp, sp, #8
 187              		.cfi_def_cfa_offset 16
 188 0074 00AF     		add	r7, sp, #0
 189              		.cfi_def_cfa_register 7
 190 0076 7860     		str	r0, [r7, #4]
  65:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	#ifdef SIMULATOR
  66:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		delay_mikro(ms);
  67:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	#else
  68:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		delay_mikro(1000 * ms);
 191              		.loc 1 68 0
 192 0078 7B68     		ldr	r3, [r7, #4]
 193 007a FA22     		movs	r2, #250
 194 007c 9200     		lsls	r2, r2, #2
 195 007e 5343     		muls	r3, r2
 196 0080 1800     		movs	r0, r3
 197 0082 FFF7FEFF 		bl	delay_mikro
  69:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	#endif
  70:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** }
 198              		.loc 1 70 0
 199 0086 C046     		nop
 200 0088 BD46     		mov	sp, r7
 201 008a 02B0     		add	sp, sp, #8
 202              		@ sp needed
 203 008c 80BD     		pop	{r7, pc}
 204              		.cfi_endproc
 205              	.LFE3:
 207              		.align	1
 208              		.global	delay_500ns
 209              		.syntax unified
 210              		.code	16
 211              		.thumb_func
 212              		.fpu softvfp
 214              	delay_500ns:
 215              	.LFB4:
  71:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 
  72:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** void delay_500ns(void) {
 216              		.loc 1 72 0
 217              		.cfi_startproc
 218              		@ args = 0, pretend = 0, frame = 0
 219              		@ frame_needed = 1, uses_anonymous_args = 0
 220 008e 80B5     		push	{r7, lr}
 221              		.cfi_def_cfa_offset 8
 222              		.cfi_offset 7, -8
 223              		.cfi_offset 14, -4
 224 0090 00AF     		add	r7, sp, #0
 225              		.cfi_def_cfa_register 7
  73:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	delay_250ns();
 226              		.loc 1 73 0
 227 0092 FFF7FEFF 		bl	delay_250ns
  74:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	delay_250ns();
 228              		.loc 1 74 0
 229 0096 FFF7FEFF 		bl	delay_250ns
  75:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** }
 230              		.loc 1 75 0
 231 009a C046     		nop
 232 009c BD46     		mov	sp, r7
 233              		@ sp needed
 234 009e 80BD     		pop	{r7, pc}
 235              		.cfi_endproc
 236              	.LFE4:
 238              		.align	1
 239              		.global	graphic_ctrl_bit_set
 240              		.syntax unified
 241              		.code	16
 242              		.thumb_func
 243              		.fpu softvfp
 245              	graphic_ctrl_bit_set:
 246              	.LFB5:
  76:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 
  77:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** void graphic_ctrl_bit_set(uint8_t x) {
 247              		.loc 1 77 0
 248              		.cfi_startproc
 249              		@ args = 0, pretend = 0, frame = 8
 250              		@ frame_needed = 1, uses_anonymous_args = 0
 251 00a0 80B5     		push	{r7, lr}
 252              		.cfi_def_cfa_offset 8
 253              		.cfi_offset 7, -8
 254              		.cfi_offset 14, -4
 255 00a2 82B0     		sub	sp, sp, #8
 256              		.cfi_def_cfa_offset 16
 257 00a4 00AF     		add	r7, sp, #0
 258              		.cfi_def_cfa_register 7
 259 00a6 0200     		movs	r2, r0
 260 00a8 FB1D     		adds	r3, r7, #7
 261 00aa 1A70     		strb	r2, [r3]
  78:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c ****     *GPIO_ODR_LOW |= (x & ~B_SELECT);
 262              		.loc 1 78 0
 263 00ac 0949     		ldr	r1, .L14
 264 00ae 094B     		ldr	r3, .L14
 265 00b0 1B78     		ldrb	r3, [r3]
 266 00b2 DBB2     		uxtb	r3, r3
 267 00b4 5AB2     		sxtb	r2, r3
 268 00b6 FB1D     		adds	r3, r7, #7
 269 00b8 1B78     		ldrb	r3, [r3]
 270 00ba 5BB2     		sxtb	r3, r3
 271 00bc 0420     		movs	r0, #4
 272 00be 8343     		bics	r3, r0
 273 00c0 5BB2     		sxtb	r3, r3
 274 00c2 1343     		orrs	r3, r2
 275 00c4 5BB2     		sxtb	r3, r3
 276 00c6 DBB2     		uxtb	r3, r3
 277 00c8 0B70     		strb	r3, [r1]
  79:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** }
 278              		.loc 1 79 0
 279 00ca C046     		nop
 280 00cc BD46     		mov	sp, r7
 281 00ce 02B0     		add	sp, sp, #8
 282              		@ sp needed
 283 00d0 80BD     		pop	{r7, pc}
 284              	.L15:
 285 00d2 C046     		.align	2
 286              	.L14:
 287 00d4 14100240 		.word	1073877012
 288              		.cfi_endproc
 289              	.LFE5:
 291              		.align	1
 292              		.global	graphic_ctrl_bit_clear
 293              		.syntax unified
 294              		.code	16
 295              		.thumb_func
 296              		.fpu softvfp
 298              	graphic_ctrl_bit_clear:
 299              	.LFB6:
  80:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 
  81:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** void graphic_ctrl_bit_clear(uint8_t x) {
 300              		.loc 1 81 0
 301              		.cfi_startproc
 302              		@ args = 0, pretend = 0, frame = 8
 303              		@ frame_needed = 1, uses_anonymous_args = 0
 304 00d8 80B5     		push	{r7, lr}
 305              		.cfi_def_cfa_offset 8
 306              		.cfi_offset 7, -8
 307              		.cfi_offset 14, -4
 308 00da 82B0     		sub	sp, sp, #8
 309              		.cfi_def_cfa_offset 16
 310 00dc 00AF     		add	r7, sp, #0
 311              		.cfi_def_cfa_register 7
 312 00de 0200     		movs	r2, r0
 313 00e0 FB1D     		adds	r3, r7, #7
 314 00e2 1A70     		strb	r2, [r3]
  82:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c ****     *GPIO_ODR_LOW &= ~x;
 315              		.loc 1 82 0
 316 00e4 0849     		ldr	r1, .L17
 317 00e6 084B     		ldr	r3, .L17
 318 00e8 1B78     		ldrb	r3, [r3]
 319 00ea DBB2     		uxtb	r3, r3
 320 00ec 5BB2     		sxtb	r3, r3
 321 00ee FA1D     		adds	r2, r7, #7
 322 00f0 1278     		ldrb	r2, [r2]
 323 00f2 52B2     		sxtb	r2, r2
 324 00f4 D243     		mvns	r2, r2
 325 00f6 52B2     		sxtb	r2, r2
 326 00f8 1340     		ands	r3, r2
 327 00fa 5BB2     		sxtb	r3, r3
 328 00fc DBB2     		uxtb	r3, r3
 329 00fe 0B70     		strb	r3, [r1]
  83:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** }
 330              		.loc 1 83 0
 331 0100 C046     		nop
 332 0102 BD46     		mov	sp, r7
 333 0104 02B0     		add	sp, sp, #8
 334              		@ sp needed
 335 0106 80BD     		pop	{r7, pc}
 336              	.L18:
 337              		.align	2
 338              	.L17:
 339 0108 14100240 		.word	1073877012
 340              		.cfi_endproc
 341              	.LFE6:
 343              		.align	1
 344              		.global	select_cotroller
 345              		.syntax unified
 346              		.code	16
 347              		.thumb_func
 348              		.fpu softvfp
 350              	select_cotroller:
 351              	.LFB7:
  84:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 
  85:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** void select_cotroller(uint8_t controller) {
 352              		.loc 1 85 0
 353              		.cfi_startproc
 354              		@ args = 0, pretend = 0, frame = 8
 355              		@ frame_needed = 1, uses_anonymous_args = 0
 356 010c 80B5     		push	{r7, lr}
 357              		.cfi_def_cfa_offset 8
 358              		.cfi_offset 7, -8
 359              		.cfi_offset 14, -4
 360 010e 82B0     		sub	sp, sp, #8
 361              		.cfi_def_cfa_offset 16
 362 0110 00AF     		add	r7, sp, #0
 363              		.cfi_def_cfa_register 7
 364 0112 0200     		movs	r2, r0
 365 0114 FB1D     		adds	r3, r7, #7
 366 0116 1A70     		strb	r2, [r3]
  86:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	if(controller == 0) {
 367              		.loc 1 86 0
 368 0118 FB1D     		adds	r3, r7, #7
 369 011a 1B78     		ldrb	r3, [r3]
 370 011c 002B     		cmp	r3, #0
 371 011e 06D1     		bne	.L20
  87:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		graphic_ctrl_bit_clear(B_CS1);
 372              		.loc 1 87 0
 373 0120 0820     		movs	r0, #8
 374 0122 FFF7FEFF 		bl	graphic_ctrl_bit_clear
  88:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		graphic_ctrl_bit_clear(B_CS2);
 375              		.loc 1 88 0
 376 0126 1020     		movs	r0, #16
 377 0128 FFF7FEFF 		bl	graphic_ctrl_bit_clear
  89:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	} else if(controller == B_CS1 | B_CS2) {
  90:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		graphic_ctrl_bit_set(B_CS1);
  91:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		graphic_ctrl_bit_set(B_CS2);
  92:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	} else if(controller == B_CS1) {
  93:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		graphic_ctrl_bit_set(B_CS1);
  94:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		graphic_ctrl_bit_clear(B_CS2);
  95:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	} else if(controller == B_CS2) {
  96:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		graphic_ctrl_bit_clear(B_CS1);
  97:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		graphic_ctrl_bit_set(B_CS2);
  98:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	}
  99:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** }
 378              		.loc 1 99 0
 379 012c 05E0     		b	.L22
 380              	.L20:
  90:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		graphic_ctrl_bit_set(B_CS2);
 381              		.loc 1 90 0
 382 012e 0820     		movs	r0, #8
 383 0130 FFF7FEFF 		bl	graphic_ctrl_bit_set
  91:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	} else if(controller == B_CS1) {
 384              		.loc 1 91 0
 385 0134 1020     		movs	r0, #16
 386 0136 FFF7FEFF 		bl	graphic_ctrl_bit_set
 387              	.L22:
 388              		.loc 1 99 0
 389 013a C046     		nop
 390 013c BD46     		mov	sp, r7
 391 013e 02B0     		add	sp, sp, #8
 392              		@ sp needed
 393 0140 80BD     		pop	{r7, pc}
 394              		.cfi_endproc
 395              	.LFE7:
 397              		.align	1
 398              		.global	graphic_wait_ready
 399              		.syntax unified
 400              		.code	16
 401              		.thumb_func
 402              		.fpu softvfp
 404              	graphic_wait_ready:
 405              	.LFB8:
 100:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 
 101:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** void graphic_wait_ready() {
 406              		.loc 1 101 0
 407              		.cfi_startproc
 408              		@ args = 0, pretend = 0, frame = 0
 409              		@ frame_needed = 1, uses_anonymous_args = 0
 410 0142 80B5     		push	{r7, lr}
 411              		.cfi_def_cfa_offset 8
 412              		.cfi_offset 7, -8
 413              		.cfi_offset 14, -4
 414 0144 00AF     		add	r7, sp, #0
 415              		.cfi_def_cfa_register 7
 102:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_ctrl_bit_clear(B_E);
 416              		.loc 1 102 0
 417 0146 4020     		movs	r0, #64
 418 0148 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 103:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	*GPIO_MODER = 0x00005555;
 419              		.loc 1 103 0
 420 014c 114B     		ldr	r3, .L26
 421 014e 124A     		ldr	r2, .L26+4
 422 0150 1A60     		str	r2, [r3]
 104:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_ctrl_bit_clear(B_RS);
 423              		.loc 1 104 0
 424 0152 0120     		movs	r0, #1
 425 0154 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 105:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_ctrl_bit_set(B_RW);
 426              		.loc 1 105 0
 427 0158 0220     		movs	r0, #2
 428 015a FFF7FEFF 		bl	graphic_ctrl_bit_set
 106:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	delay_500ns;
 107:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	while(*GPIO_IDR_HIGH & 0x80) { // Wait for display not to be busy
 429              		.loc 1 107 0
 430 015e 09E0     		b	.L24
 431              	.L25:
 108:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		graphic_ctrl_bit_set(B_E);
 432              		.loc 1 108 0
 433 0160 4020     		movs	r0, #64
 434 0162 FFF7FEFF 		bl	graphic_ctrl_bit_set
 109:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		delay_500ns();
 435              		.loc 1 109 0
 436 0166 FFF7FEFF 		bl	delay_500ns
 110:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		graphic_ctrl_bit_clear(B_E);
 437              		.loc 1 110 0
 438 016a 4020     		movs	r0, #64
 439 016c FFF7FEFF 		bl	graphic_ctrl_bit_clear
 111:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		delay_500ns();		
 440              		.loc 1 111 0
 441 0170 FFF7FEFF 		bl	delay_500ns
 442              	.L24:
 107:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		graphic_ctrl_bit_set(B_E);
 443              		.loc 1 107 0
 444 0174 094B     		ldr	r3, .L26+8
 445 0176 1B78     		ldrb	r3, [r3]
 446 0178 DBB2     		uxtb	r3, r3
 447 017a 5BB2     		sxtb	r3, r3
 448 017c 002B     		cmp	r3, #0
 449 017e EFDB     		blt	.L25
 112:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	}
 113:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_ctrl_bit_set(B_E);
 450              		.loc 1 113 0
 451 0180 4020     		movs	r0, #64
 452 0182 FFF7FEFF 		bl	graphic_ctrl_bit_set
 114:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	*GPIO_MODER = 0x55555555;
 453              		.loc 1 114 0
 454 0186 034B     		ldr	r3, .L26
 455 0188 054A     		ldr	r2, .L26+12
 456 018a 1A60     		str	r2, [r3]
 115:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** }
 457              		.loc 1 115 0
 458 018c C046     		nop
 459 018e BD46     		mov	sp, r7
 460              		@ sp needed
 461 0190 80BD     		pop	{r7, pc}
 462              	.L27:
 463 0192 C046     		.align	2
 464              	.L26:
 465 0194 00100240 		.word	1073876992
 466 0198 55550000 		.word	21845
 467 019c 11100240 		.word	1073877009
 468 01a0 55555555 		.word	1431655765
 469              		.cfi_endproc
 470              	.LFE8:
 472              		.align	1
 473              		.global	graphic_read
 474              		.syntax unified
 475              		.code	16
 476              		.thumb_func
 477              		.fpu softvfp
 479              	graphic_read:
 480              	.LFB9:
 116:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 
 117:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** char graphic_read(unsigned int controller) {
 481              		.loc 1 117 0
 482              		.cfi_startproc
 483              		@ args = 0, pretend = 0, frame = 16
 484              		@ frame_needed = 1, uses_anonymous_args = 0
 485 01a4 80B5     		push	{r7, lr}
 486              		.cfi_def_cfa_offset 8
 487              		.cfi_offset 7, -8
 488              		.cfi_offset 14, -4
 489 01a6 84B0     		sub	sp, sp, #16
 490              		.cfi_def_cfa_offset 24
 491 01a8 00AF     		add	r7, sp, #0
 492              		.cfi_def_cfa_register 7
 493 01aa 7860     		str	r0, [r7, #4]
 118:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_ctrl_bit_clear(B_E);
 494              		.loc 1 118 0
 495 01ac 4020     		movs	r0, #64
 496 01ae FFF7FEFF 		bl	graphic_ctrl_bit_clear
 119:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	*GPIO_MODER = 0x00005555;
 497              		.loc 1 119 0
 498 01b2 1C4B     		ldr	r3, .L32
 499 01b4 1C4A     		ldr	r2, .L32+4
 500 01b6 1A60     		str	r2, [r3]
 120:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_ctrl_bit_set(B_RS);
 501              		.loc 1 120 0
 502 01b8 0120     		movs	r0, #1
 503 01ba FFF7FEFF 		bl	graphic_ctrl_bit_set
 121:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_ctrl_bit_set(B_RW);
 504              		.loc 1 121 0
 505 01be 0220     		movs	r0, #2
 506 01c0 FFF7FEFF 		bl	graphic_ctrl_bit_set
 122:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	select_cotroller(controller);
 507              		.loc 1 122 0
 508 01c4 7B68     		ldr	r3, [r7, #4]
 509 01c6 DBB2     		uxtb	r3, r3
 510 01c8 1800     		movs	r0, r3
 511 01ca FFF7FEFF 		bl	select_cotroller
 123:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	delay_500ns();
 512              		.loc 1 123 0
 513 01ce FFF7FEFF 		bl	delay_500ns
 124:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_ctrl_bit_set(B_E);
 514              		.loc 1 124 0
 515 01d2 4020     		movs	r0, #64
 516 01d4 FFF7FEFF 		bl	graphic_ctrl_bit_set
 125:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	delay_500ns();
 517              		.loc 1 125 0
 518 01d8 FFF7FEFF 		bl	delay_500ns
 126:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	char RV = *GPIO_IDR_HIGH;
 519              		.loc 1 126 0
 520 01dc 134A     		ldr	r2, .L32+8
 521 01de 0F23     		movs	r3, #15
 522 01e0 FB18     		adds	r3, r7, r3
 523 01e2 1278     		ldrb	r2, [r2]
 524 01e4 1A70     		strb	r2, [r3]
 127:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_ctrl_bit_clear(B_E);
 525              		.loc 1 127 0
 526 01e6 4020     		movs	r0, #64
 527 01e8 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 128:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	*GPIO_MODER = 0x55555555;
 528              		.loc 1 128 0
 529 01ec 0D4B     		ldr	r3, .L32
 530 01ee 104A     		ldr	r2, .L32+12
 531 01f0 1A60     		str	r2, [r3]
 129:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	if(controller == B_CS1) {
 532              		.loc 1 129 0
 533 01f2 7B68     		ldr	r3, [r7, #4]
 534 01f4 082B     		cmp	r3, #8
 535 01f6 05D1     		bne	.L29
 130:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		select_cotroller(B_CS1);
 536              		.loc 1 130 0
 537 01f8 0820     		movs	r0, #8
 538 01fa FFF7FEFF 		bl	select_cotroller
 131:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		graphic_wait_ready();
 539              		.loc 1 131 0
 540 01fe FFF7FEFF 		bl	graphic_wait_ready
 541 0202 07E0     		b	.L30
 542              	.L29:
 132:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	} else if(controller == B_CS2) {
 543              		.loc 1 132 0
 544 0204 7B68     		ldr	r3, [r7, #4]
 545 0206 102B     		cmp	r3, #16
 546 0208 04D1     		bne	.L30
 133:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		select_cotroller(B_CS2);
 547              		.loc 1 133 0
 548 020a 1020     		movs	r0, #16
 549 020c FFF7FEFF 		bl	select_cotroller
 134:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		graphic_wait_ready();
 550              		.loc 1 134 0
 551 0210 FFF7FEFF 		bl	graphic_wait_ready
 552              	.L30:
 135:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	}
 136:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	return RV;
 553              		.loc 1 136 0
 554 0214 0F23     		movs	r3, #15
 555 0216 FB18     		adds	r3, r7, r3
 556 0218 1B78     		ldrb	r3, [r3]
 137:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** }
 557              		.loc 1 137 0
 558 021a 1800     		movs	r0, r3
 559 021c BD46     		mov	sp, r7
 560 021e 04B0     		add	sp, sp, #16
 561              		@ sp needed
 562 0220 80BD     		pop	{r7, pc}
 563              	.L33:
 564 0222 C046     		.align	2
 565              	.L32:
 566 0224 00100240 		.word	1073876992
 567 0228 55550000 		.word	21845
 568 022c 11100240 		.word	1073877009
 569 0230 55555555 		.word	1431655765
 570              		.cfi_endproc
 571              	.LFE9:
 573              		.align	1
 574              		.global	graphic_write
 575              		.syntax unified
 576              		.code	16
 577              		.thumb_func
 578              		.fpu softvfp
 580              	graphic_write:
 581              	.LFB10:
 138:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 
 139:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** void graphic_write(unsigned char value, unsigned int controller) {
 582              		.loc 1 139 0
 583              		.cfi_startproc
 584              		@ args = 0, pretend = 0, frame = 8
 585              		@ frame_needed = 1, uses_anonymous_args = 0
 586 0234 80B5     		push	{r7, lr}
 587              		.cfi_def_cfa_offset 8
 588              		.cfi_offset 7, -8
 589              		.cfi_offset 14, -4
 590 0236 82B0     		sub	sp, sp, #8
 591              		.cfi_def_cfa_offset 16
 592 0238 00AF     		add	r7, sp, #0
 593              		.cfi_def_cfa_register 7
 594 023a 0200     		movs	r2, r0
 595 023c 3960     		str	r1, [r7]
 596 023e FB1D     		adds	r3, r7, #7
 597 0240 1A70     		strb	r2, [r3]
 140:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	*GPIO_ODR_HIGH = value;
 598              		.loc 1 140 0
 599 0242 154A     		ldr	r2, .L35
 600 0244 FB1D     		adds	r3, r7, #7
 601 0246 1B78     		ldrb	r3, [r3]
 602 0248 1370     		strb	r3, [r2]
 141:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	select_cotroller(controller);
 603              		.loc 1 141 0
 604 024a 3B68     		ldr	r3, [r7]
 605 024c DBB2     		uxtb	r3, r3
 606 024e 1800     		movs	r0, r3
 607 0250 FFF7FEFF 		bl	select_cotroller
 142:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	delay_500ns();
 608              		.loc 1 142 0
 609 0254 FFF7FEFF 		bl	delay_500ns
 143:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_ctrl_bit_set(B_E);
 610              		.loc 1 143 0
 611 0258 4020     		movs	r0, #64
 612 025a FFF7FEFF 		bl	graphic_ctrl_bit_set
 144:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	delay_500ns();
 613              		.loc 1 144 0
 614 025e FFF7FEFF 		bl	delay_500ns
 145:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_ctrl_bit_clear(B_E);
 615              		.loc 1 145 0
 616 0262 4020     		movs	r0, #64
 617 0264 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 146:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	
 147:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	//Kanske inte ska vara så här för this statement
 148:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	if(controller | B_CS1) {
 149:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		select_cotroller(B_CS1);
 618              		.loc 1 149 0
 619 0268 0820     		movs	r0, #8
 620 026a FFF7FEFF 		bl	select_cotroller
 150:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		graphic_wait_ready();
 621              		.loc 1 150 0
 622 026e FFF7FEFF 		bl	graphic_wait_ready
 151:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	}
 152:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	
 153:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	if(controller | B_CS2) {
 154:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		select_cotroller(B_CS2);
 623              		.loc 1 154 0
 624 0272 1020     		movs	r0, #16
 625 0274 FFF7FEFF 		bl	select_cotroller
 155:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		graphic_wait_ready();
 626              		.loc 1 155 0
 627 0278 FFF7FEFF 		bl	graphic_wait_ready
 156:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	}
 157:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	
 158:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	*GPIO_ODR_HIGH = 0;
 628              		.loc 1 158 0
 629 027c 064B     		ldr	r3, .L35
 630 027e 0022     		movs	r2, #0
 631 0280 1A70     		strb	r2, [r3]
 159:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_ctrl_bit_set(B_E);
 632              		.loc 1 159 0
 633 0282 4020     		movs	r0, #64
 634 0284 FFF7FEFF 		bl	graphic_ctrl_bit_set
 160:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	select_cotroller(0);
 635              		.loc 1 160 0
 636 0288 0020     		movs	r0, #0
 637 028a FFF7FEFF 		bl	select_cotroller
 161:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** }
 638              		.loc 1 161 0
 639 028e C046     		nop
 640 0290 BD46     		mov	sp, r7
 641 0292 02B0     		add	sp, sp, #8
 642              		@ sp needed
 643 0294 80BD     		pop	{r7, pc}
 644              	.L36:
 645 0296 C046     		.align	2
 646              	.L35:
 647 0298 15100240 		.word	1073877013
 648              		.cfi_endproc
 649              	.LFE10:
 651              		.align	1
 652              		.global	graphic_write_command
 653              		.syntax unified
 654              		.code	16
 655              		.thumb_func
 656              		.fpu softvfp
 658              	graphic_write_command:
 659              	.LFB11:
 162:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 
 163:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** void graphic_write_command(unsigned int command, unsigned int controller) {
 660              		.loc 1 163 0
 661              		.cfi_startproc
 662              		@ args = 0, pretend = 0, frame = 8
 663              		@ frame_needed = 1, uses_anonymous_args = 0
 664 029c 80B5     		push	{r7, lr}
 665              		.cfi_def_cfa_offset 8
 666              		.cfi_offset 7, -8
 667              		.cfi_offset 14, -4
 668 029e 82B0     		sub	sp, sp, #8
 669              		.cfi_def_cfa_offset 16
 670 02a0 00AF     		add	r7, sp, #0
 671              		.cfi_def_cfa_register 7
 672 02a2 7860     		str	r0, [r7, #4]
 673 02a4 3960     		str	r1, [r7]
 164:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_ctrl_bit_clear(B_E);
 674              		.loc 1 164 0
 675 02a6 4020     		movs	r0, #64
 676 02a8 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 165:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	select_cotroller(controller);
 677              		.loc 1 165 0
 678 02ac 3B68     		ldr	r3, [r7]
 679 02ae DBB2     		uxtb	r3, r3
 680 02b0 1800     		movs	r0, r3
 681 02b2 FFF7FEFF 		bl	select_cotroller
 166:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_ctrl_bit_clear(B_RS);
 682              		.loc 1 166 0
 683 02b6 0120     		movs	r0, #1
 684 02b8 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 167:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_ctrl_bit_clear(B_RW);
 685              		.loc 1 167 0
 686 02bc 0220     		movs	r0, #2
 687 02be FFF7FEFF 		bl	graphic_ctrl_bit_clear
 168:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_write(command, controller);
 688              		.loc 1 168 0
 689 02c2 7B68     		ldr	r3, [r7, #4]
 690 02c4 DBB2     		uxtb	r3, r3
 691 02c6 3A68     		ldr	r2, [r7]
 692 02c8 1100     		movs	r1, r2
 693 02ca 1800     		movs	r0, r3
 694 02cc FFF7FEFF 		bl	graphic_write
 169:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** }
 695              		.loc 1 169 0
 696 02d0 C046     		nop
 697 02d2 BD46     		mov	sp, r7
 698 02d4 02B0     		add	sp, sp, #8
 699              		@ sp needed
 700 02d6 80BD     		pop	{r7, pc}
 701              		.cfi_endproc
 702              	.LFE11:
 704              		.align	1
 705              		.global	graphic_write_data
 706              		.syntax unified
 707              		.code	16
 708              		.thumb_func
 709              		.fpu softvfp
 711              	graphic_write_data:
 712              	.LFB12:
 170:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 
 171:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** void graphic_write_data(unsigned int data, unsigned int controller) {
 713              		.loc 1 171 0
 714              		.cfi_startproc
 715              		@ args = 0, pretend = 0, frame = 8
 716              		@ frame_needed = 1, uses_anonymous_args = 0
 717 02d8 80B5     		push	{r7, lr}
 718              		.cfi_def_cfa_offset 8
 719              		.cfi_offset 7, -8
 720              		.cfi_offset 14, -4
 721 02da 82B0     		sub	sp, sp, #8
 722              		.cfi_def_cfa_offset 16
 723 02dc 00AF     		add	r7, sp, #0
 724              		.cfi_def_cfa_register 7
 725 02de 7860     		str	r0, [r7, #4]
 726 02e0 3960     		str	r1, [r7]
 172:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_ctrl_bit_set(B_E);
 727              		.loc 1 172 0
 728 02e2 4020     		movs	r0, #64
 729 02e4 FFF7FEFF 		bl	graphic_ctrl_bit_set
 173:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	select_cotroller(controller);
 730              		.loc 1 173 0
 731 02e8 3B68     		ldr	r3, [r7]
 732 02ea DBB2     		uxtb	r3, r3
 733 02ec 1800     		movs	r0, r3
 734 02ee FFF7FEFF 		bl	select_cotroller
 174:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_ctrl_bit_set(B_RS);
 735              		.loc 1 174 0
 736 02f2 0120     		movs	r0, #1
 737 02f4 FFF7FEFF 		bl	graphic_ctrl_bit_set
 175:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_ctrl_bit_clear(B_RW);
 738              		.loc 1 175 0
 739 02f8 0220     		movs	r0, #2
 740 02fa FFF7FEFF 		bl	graphic_ctrl_bit_clear
 176:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_write(data, controller);
 741              		.loc 1 176 0
 742 02fe 7B68     		ldr	r3, [r7, #4]
 743 0300 DBB2     		uxtb	r3, r3
 744 0302 3A68     		ldr	r2, [r7]
 745 0304 1100     		movs	r1, r2
 746 0306 1800     		movs	r0, r3
 747 0308 FFF7FEFF 		bl	graphic_write
 177:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** }
 748              		.loc 1 177 0
 749 030c C046     		nop
 750 030e BD46     		mov	sp, r7
 751 0310 02B0     		add	sp, sp, #8
 752              		@ sp needed
 753 0312 80BD     		pop	{r7, pc}
 754              		.cfi_endproc
 755              	.LFE12:
 757              		.align	1
 758              		.global	graphic_read_data
 759              		.syntax unified
 760              		.code	16
 761              		.thumb_func
 762              		.fpu softvfp
 764              	graphic_read_data:
 765              	.LFB13:
 178:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 
 179:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** unsigned char graphic_read_data(unsigned char controller) {
 766              		.loc 1 179 0
 767              		.cfi_startproc
 768              		@ args = 0, pretend = 0, frame = 8
 769              		@ frame_needed = 1, uses_anonymous_args = 0
 770 0314 80B5     		push	{r7, lr}
 771              		.cfi_def_cfa_offset 8
 772              		.cfi_offset 7, -8
 773              		.cfi_offset 14, -4
 774 0316 82B0     		sub	sp, sp, #8
 775              		.cfi_def_cfa_offset 16
 776 0318 00AF     		add	r7, sp, #0
 777              		.cfi_def_cfa_register 7
 778 031a 0200     		movs	r2, r0
 779 031c FB1D     		adds	r3, r7, #7
 780 031e 1A70     		strb	r2, [r3]
 180:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	(void) graphic_read(controller);
 781              		.loc 1 180 0
 782 0320 FB1D     		adds	r3, r7, #7
 783 0322 1B78     		ldrb	r3, [r3]
 784 0324 1800     		movs	r0, r3
 785 0326 FFF7FEFF 		bl	graphic_read
 181:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	return graphic_read(controller);
 786              		.loc 1 181 0
 787 032a FB1D     		adds	r3, r7, #7
 788 032c 1B78     		ldrb	r3, [r3]
 789 032e 1800     		movs	r0, r3
 790 0330 FFF7FEFF 		bl	graphic_read
 791 0334 0300     		movs	r3, r0
 182:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** }
 792              		.loc 1 182 0
 793 0336 1800     		movs	r0, r3
 794 0338 BD46     		mov	sp, r7
 795 033a 02B0     		add	sp, sp, #8
 796              		@ sp needed
 797 033c 80BD     		pop	{r7, pc}
 798              		.cfi_endproc
 799              	.LFE13:
 801              		.align	1
 802              		.global	main
 803              		.syntax unified
 804              		.code	16
 805              		.thumb_func
 806              		.fpu softvfp
 808              	main:
 809              	.LFB14:
 183:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 
 184:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 
 185:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** void main(void) {
 810              		.loc 1 185 0
 811              		.cfi_startproc
 812              		@ args = 0, pretend = 0, frame = 0
 813              		@ frame_needed = 1, uses_anonymous_args = 0
 814 033e 80B5     		push	{r7, lr}
 815              		.cfi_def_cfa_offset 8
 816              		.cfi_offset 7, -8
 817              		.cfi_offset 14, -4
 818 0340 00AF     		add	r7, sp, #0
 819              		.cfi_def_cfa_register 7
 186:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** }
 820              		.loc 1 186 0
 821 0342 C046     		nop
 822 0344 BD46     		mov	sp, r7
 823              		@ sp needed
 824 0346 80BD     		pop	{r7, pc}
 825              		.cfi_endproc
 826              	.LFE14:
 828              	.Letext0:
