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
  27:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** #define LCD_ON 0x3F
  28:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** #define LCD_OFF 0x3E
  29:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** #define LCD_DISP_START 0xC0
  30:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** #define LCD_SET_ADD 0x40
  31:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** #define LCD_SET_PAGE 0xB8
  32:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** #define LCD_BUSY 0x80
  33:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 
  34:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** #define SIMULATOR // DO it
  35:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 
  36:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** typedef unsigned char uint8_t;
  37:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 
  38:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
  39:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 
  40:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** void startup ( void )
  41:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** {
  26              		.loc 1 41 0
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
  42:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** __asm volatile(
  31              		.loc 1 42 0
  32              		.syntax divided
  33              	@ 42 "C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay/startup.c" 1
  34 0000 0248     		 LDR R0,=0x2001C000
  35 0002 8546     	 MOV SP,R0
  36 0004 FFF7FEFF 	 BL main
  37 0008 FEE7     	_exit: B .
  38              	
  39              	@ 0 "" 2
  43:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  44:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	" MOV SP,R0\n"
  45:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	" BL main\n"				/* call main */
  46:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	"_exit: B .\n"				/* never return */
  47:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	) ;
  48:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** }
  40              		.loc 1 48 0
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
  49:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 
  50:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** void init_app(void) {
  57              		.loc 1 50 0
  58              		.cfi_startproc
  59              		@ args = 0, pretend = 0, frame = 0
  60              		@ frame_needed = 1, uses_anonymous_args = 0
  61 0000 80B5     		push	{r7, lr}
  62              		.cfi_def_cfa_offset 8
  63              		.cfi_offset 7, -8
  64              		.cfi_offset 14, -4
  65 0002 00AF     		add	r7, sp, #0
  66              		.cfi_def_cfa_register 7
  51:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	// Setup output pins for display
  52:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	*GPIO_MODER = 0x55555555;
  67              		.loc 1 52 0
  68 0004 074B     		ldr	r3, .L3
  69 0006 084A     		ldr	r2, .L3+4
  70 0008 1A60     		str	r2, [r3]
  53:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** //	*GPIO_OTYPER = 0x7777;
  54:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** //	*GPIO_PUPDR = 0xAAAAAAAA;
  55:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	*GPIO_ODR_HIGH = 0;
  71              		.loc 1 55 0
  72 000a 084B     		ldr	r3, .L3+8
  73 000c 0022     		movs	r2, #0
  74 000e 1A70     		strb	r2, [r3]
  56:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	*GPIO_ODR_LOW = 0;
  75              		.loc 1 56 0
  76 0010 074B     		ldr	r3, .L3+12
  77 0012 0022     		movs	r2, #0
  78 0014 1A70     		strb	r2, [r3]
  57:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	*GPIO_IDR_HIGH = 0;
  79              		.loc 1 57 0
  80 0016 074B     		ldr	r3, .L3+16
  81 0018 0022     		movs	r2, #0
  82 001a 1A70     		strb	r2, [r3]
  58:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** }
  83              		.loc 1 58 0
  84 001c C046     		nop
  85 001e BD46     		mov	sp, r7
  86              		@ sp needed
  87 0020 80BD     		pop	{r7, pc}
  88              	.L4:
  89 0022 C046     		.align	2
  90              	.L3:
  91 0024 00100240 		.word	1073876992
  92 0028 55555555 		.word	1431655765
  93 002c 15100240 		.word	1073877013
  94 0030 14100240 		.word	1073877012
  95 0034 11100240 		.word	1073877009
  96              		.cfi_endproc
  97              	.LFE1:
  99              		.align	1
 100              		.global	delay_250ns
 101              		.syntax unified
 102              		.code	16
 103              		.thumb_func
 104              		.fpu softvfp
 106              	delay_250ns:
 107              	.LFB2:
  59:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 
  60:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** void delay_250ns(void) {
 108              		.loc 1 60 0
 109              		.cfi_startproc
 110              		@ args = 0, pretend = 0, frame = 0
 111              		@ frame_needed = 1, uses_anonymous_args = 0
 112 0038 80B5     		push	{r7, lr}
 113              		.cfi_def_cfa_offset 8
 114              		.cfi_offset 7, -8
 115              		.cfi_offset 14, -4
 116 003a 00AF     		add	r7, sp, #0
 117              		.cfi_def_cfa_register 7
  61:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	*STK_CTRL = 0;
 118              		.loc 1 61 0
 119 003c 0C4B     		ldr	r3, .L7
 120 003e 0022     		movs	r2, #0
 121 0040 1A60     		str	r2, [r3]
  62:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	*STK_LOAD = 49; //  48 + 1. Have to add one as said in manual
 122              		.loc 1 62 0
 123 0042 0C4B     		ldr	r3, .L7+4
 124 0044 3122     		movs	r2, #49
 125 0046 1A60     		str	r2, [r3]
  63:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	*STK_VAL = 0;
 126              		.loc 1 63 0
 127 0048 0B4B     		ldr	r3, .L7+8
 128 004a 0022     		movs	r2, #0
 129 004c 1A60     		str	r2, [r3]
  64:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	*STK_CTRL = 5;
 130              		.loc 1 64 0
 131 004e 084B     		ldr	r3, .L7
 132 0050 0522     		movs	r2, #5
 133 0052 1A60     		str	r2, [r3]
  65:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	while((*STK_CTRL & 0x10000) == 0) {
 134              		.loc 1 65 0
 135 0054 C046     		nop
 136              	.L6:
 137              		.loc 1 65 0 is_stmt 0 discriminator 1
 138 0056 064B     		ldr	r3, .L7
 139 0058 1A68     		ldr	r2, [r3]
 140 005a 8023     		movs	r3, #128
 141 005c 5B02     		lsls	r3, r3, #9
 142 005e 1340     		ands	r3, r2
 143 0060 F9D0     		beq	.L6
  66:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		// Do nothing :S
  67:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	}
  68:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	*STK_CTRL = 0;
 144              		.loc 1 68 0 is_stmt 1
 145 0062 034B     		ldr	r3, .L7
 146 0064 0022     		movs	r2, #0
 147 0066 1A60     		str	r2, [r3]
  69:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** }
 148              		.loc 1 69 0
 149 0068 C046     		nop
 150 006a BD46     		mov	sp, r7
 151              		@ sp needed
 152 006c 80BD     		pop	{r7, pc}
 153              	.L8:
 154 006e C046     		.align	2
 155              	.L7:
 156 0070 10E000E0 		.word	-536813552
 157 0074 14E000E0 		.word	-536813548
 158 0078 18E000E0 		.word	-536813544
 159              		.cfi_endproc
 160              	.LFE2:
 162              		.align	1
 163              		.global	delay_mikro
 164              		.syntax unified
 165              		.code	16
 166              		.thumb_func
 167              		.fpu softvfp
 169              	delay_mikro:
 170              	.LFB3:
  70:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 
  71:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** void delay_mikro(unsigned int us) {
 171              		.loc 1 71 0
 172              		.cfi_startproc
 173              		@ args = 0, pretend = 0, frame = 8
 174              		@ frame_needed = 1, uses_anonymous_args = 0
 175 007c 80B5     		push	{r7, lr}
 176              		.cfi_def_cfa_offset 8
 177              		.cfi_offset 7, -8
 178              		.cfi_offset 14, -4
 179 007e 82B0     		sub	sp, sp, #8
 180              		.cfi_def_cfa_offset 16
 181 0080 00AF     		add	r7, sp, #0
 182              		.cfi_def_cfa_register 7
 183 0082 7860     		str	r0, [r7, #4]
  72:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	while(us--) {
 184              		.loc 1 72 0
 185 0084 07E0     		b	.L10
 186              	.L11:
  73:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		delay_250ns();
 187              		.loc 1 73 0
 188 0086 FFF7FEFF 		bl	delay_250ns
  74:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		delay_250ns();
 189              		.loc 1 74 0
 190 008a FFF7FEFF 		bl	delay_250ns
  75:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		delay_250ns();
 191              		.loc 1 75 0
 192 008e FFF7FEFF 		bl	delay_250ns
  76:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		delay_250ns();
 193              		.loc 1 76 0
 194 0092 FFF7FEFF 		bl	delay_250ns
 195              	.L10:
  72:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		delay_250ns();
 196              		.loc 1 72 0
 197 0096 7B68     		ldr	r3, [r7, #4]
 198 0098 5A1E     		subs	r2, r3, #1
 199 009a 7A60     		str	r2, [r7, #4]
 200 009c 002B     		cmp	r3, #0
 201 009e F2D1     		bne	.L11
  77:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	}
  78:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** }
 202              		.loc 1 78 0
 203 00a0 C046     		nop
 204 00a2 BD46     		mov	sp, r7
 205 00a4 02B0     		add	sp, sp, #8
 206              		@ sp needed
 207 00a6 80BD     		pop	{r7, pc}
 208              		.cfi_endproc
 209              	.LFE3:
 211              		.align	1
 212              		.global	delay_milli
 213              		.syntax unified
 214              		.code	16
 215              		.thumb_func
 216              		.fpu softvfp
 218              	delay_milli:
 219              	.LFB4:
  79:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 
  80:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** void delay_milli(unsigned int ms) {
 220              		.loc 1 80 0
 221              		.cfi_startproc
 222              		@ args = 0, pretend = 0, frame = 8
 223              		@ frame_needed = 1, uses_anonymous_args = 0
 224 00a8 80B5     		push	{r7, lr}
 225              		.cfi_def_cfa_offset 8
 226              		.cfi_offset 7, -8
 227              		.cfi_offset 14, -4
 228 00aa 82B0     		sub	sp, sp, #8
 229              		.cfi_def_cfa_offset 16
 230 00ac 00AF     		add	r7, sp, #0
 231              		.cfi_def_cfa_register 7
 232 00ae 7860     		str	r0, [r7, #4]
  81:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	#ifdef SIMULATOR
  82:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		delay_mikro(ms);
 233              		.loc 1 82 0
 234 00b0 7B68     		ldr	r3, [r7, #4]
 235 00b2 1800     		movs	r0, r3
 236 00b4 FFF7FEFF 		bl	delay_mikro
  83:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	#else
  84:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		delay_mikro(1000 * ms);
  85:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	#endif
  86:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** }
 237              		.loc 1 86 0
 238 00b8 C046     		nop
 239 00ba BD46     		mov	sp, r7
 240 00bc 02B0     		add	sp, sp, #8
 241              		@ sp needed
 242 00be 80BD     		pop	{r7, pc}
 243              		.cfi_endproc
 244              	.LFE4:
 246              		.align	1
 247              		.global	delay_500ns
 248              		.syntax unified
 249              		.code	16
 250              		.thumb_func
 251              		.fpu softvfp
 253              	delay_500ns:
 254              	.LFB5:
  87:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 
  88:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** void delay_500ns(void) {
 255              		.loc 1 88 0
 256              		.cfi_startproc
 257              		@ args = 0, pretend = 0, frame = 0
 258              		@ frame_needed = 1, uses_anonymous_args = 0
 259 00c0 80B5     		push	{r7, lr}
 260              		.cfi_def_cfa_offset 8
 261              		.cfi_offset 7, -8
 262              		.cfi_offset 14, -4
 263 00c2 00AF     		add	r7, sp, #0
 264              		.cfi_def_cfa_register 7
  89:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	delay_250ns();
 265              		.loc 1 89 0
 266 00c4 FFF7FEFF 		bl	delay_250ns
  90:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	delay_250ns();
 267              		.loc 1 90 0
 268 00c8 FFF7FEFF 		bl	delay_250ns
  91:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** }
 269              		.loc 1 91 0
 270 00cc C046     		nop
 271 00ce BD46     		mov	sp, r7
 272              		@ sp needed
 273 00d0 80BD     		pop	{r7, pc}
 274              		.cfi_endproc
 275              	.LFE5:
 277              		.align	1
 278              		.global	graphic_ctrl_bit_set
 279              		.syntax unified
 280              		.code	16
 281              		.thumb_func
 282              		.fpu softvfp
 284              	graphic_ctrl_bit_set:
 285              	.LFB6:
  92:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 
  93:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** void graphic_ctrl_bit_set(uint8_t x) {
 286              		.loc 1 93 0
 287              		.cfi_startproc
 288              		@ args = 0, pretend = 0, frame = 8
 289              		@ frame_needed = 1, uses_anonymous_args = 0
 290 00d2 80B5     		push	{r7, lr}
 291              		.cfi_def_cfa_offset 8
 292              		.cfi_offset 7, -8
 293              		.cfi_offset 14, -4
 294 00d4 82B0     		sub	sp, sp, #8
 295              		.cfi_def_cfa_offset 16
 296 00d6 00AF     		add	r7, sp, #0
 297              		.cfi_def_cfa_register 7
 298 00d8 0200     		movs	r2, r0
 299 00da FB1D     		adds	r3, r7, #7
 300 00dc 1A70     		strb	r2, [r3]
  94:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c ****     *GPIO_ODR_LOW |= (x & ~B_SELECT);
 301              		.loc 1 94 0
 302 00de 0949     		ldr	r1, .L15
 303 00e0 084B     		ldr	r3, .L15
 304 00e2 1B78     		ldrb	r3, [r3]
 305 00e4 DBB2     		uxtb	r3, r3
 306 00e6 5AB2     		sxtb	r2, r3
 307 00e8 FB1D     		adds	r3, r7, #7
 308 00ea 1B78     		ldrb	r3, [r3]
 309 00ec 5BB2     		sxtb	r3, r3
 310 00ee 0420     		movs	r0, #4
 311 00f0 8343     		bics	r3, r0
 312 00f2 5BB2     		sxtb	r3, r3
 313 00f4 1343     		orrs	r3, r2
 314 00f6 5BB2     		sxtb	r3, r3
 315 00f8 DBB2     		uxtb	r3, r3
 316 00fa 0B70     		strb	r3, [r1]
  95:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** }
 317              		.loc 1 95 0
 318 00fc C046     		nop
 319 00fe BD46     		mov	sp, r7
 320 0100 02B0     		add	sp, sp, #8
 321              		@ sp needed
 322 0102 80BD     		pop	{r7, pc}
 323              	.L16:
 324              		.align	2
 325              	.L15:
 326 0104 14100240 		.word	1073877012
 327              		.cfi_endproc
 328              	.LFE6:
 330              		.align	1
 331              		.global	graphic_ctrl_bit_clear
 332              		.syntax unified
 333              		.code	16
 334              		.thumb_func
 335              		.fpu softvfp
 337              	graphic_ctrl_bit_clear:
 338              	.LFB7:
  96:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 
  97:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** void graphic_ctrl_bit_clear(uint8_t x) {
 339              		.loc 1 97 0
 340              		.cfi_startproc
 341              		@ args = 0, pretend = 0, frame = 8
 342              		@ frame_needed = 1, uses_anonymous_args = 0
 343 0108 80B5     		push	{r7, lr}
 344              		.cfi_def_cfa_offset 8
 345              		.cfi_offset 7, -8
 346              		.cfi_offset 14, -4
 347 010a 82B0     		sub	sp, sp, #8
 348              		.cfi_def_cfa_offset 16
 349 010c 00AF     		add	r7, sp, #0
 350              		.cfi_def_cfa_register 7
 351 010e 0200     		movs	r2, r0
 352 0110 FB1D     		adds	r3, r7, #7
 353 0112 1A70     		strb	r2, [r3]
  98:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c ****     *GPIO_ODR_LOW &= ~x;
 354              		.loc 1 98 0
 355 0114 0849     		ldr	r1, .L18
 356 0116 084B     		ldr	r3, .L18
 357 0118 1B78     		ldrb	r3, [r3]
 358 011a DBB2     		uxtb	r3, r3
 359 011c 5BB2     		sxtb	r3, r3
 360 011e FA1D     		adds	r2, r7, #7
 361 0120 1278     		ldrb	r2, [r2]
 362 0122 52B2     		sxtb	r2, r2
 363 0124 D243     		mvns	r2, r2
 364 0126 52B2     		sxtb	r2, r2
 365 0128 1340     		ands	r3, r2
 366 012a 5BB2     		sxtb	r3, r3
 367 012c DBB2     		uxtb	r3, r3
 368 012e 0B70     		strb	r3, [r1]
  99:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** }
 369              		.loc 1 99 0
 370 0130 C046     		nop
 371 0132 BD46     		mov	sp, r7
 372 0134 02B0     		add	sp, sp, #8
 373              		@ sp needed
 374 0136 80BD     		pop	{r7, pc}
 375              	.L19:
 376              		.align	2
 377              	.L18:
 378 0138 14100240 		.word	1073877012
 379              		.cfi_endproc
 380              	.LFE7:
 382              		.align	1
 383              		.global	select_cotroller
 384              		.syntax unified
 385              		.code	16
 386              		.thumb_func
 387              		.fpu softvfp
 389              	select_cotroller:
 390              	.LFB8:
 100:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 
 101:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** void select_cotroller(uint8_t controller) {
 391              		.loc 1 101 0
 392              		.cfi_startproc
 393              		@ args = 0, pretend = 0, frame = 8
 394              		@ frame_needed = 1, uses_anonymous_args = 0
 395 013c 80B5     		push	{r7, lr}
 396              		.cfi_def_cfa_offset 8
 397              		.cfi_offset 7, -8
 398              		.cfi_offset 14, -4
 399 013e 82B0     		sub	sp, sp, #8
 400              		.cfi_def_cfa_offset 16
 401 0140 00AF     		add	r7, sp, #0
 402              		.cfi_def_cfa_register 7
 403 0142 0200     		movs	r2, r0
 404 0144 FB1D     		adds	r3, r7, #7
 405 0146 1A70     		strb	r2, [r3]
 102:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	if(controller == 0) {
 406              		.loc 1 102 0
 407 0148 FB1D     		adds	r3, r7, #7
 408 014a 1B78     		ldrb	r3, [r3]
 409 014c 002B     		cmp	r3, #0
 410 014e 06D1     		bne	.L21
 103:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		graphic_ctrl_bit_clear(B_CS1);
 411              		.loc 1 103 0
 412 0150 0820     		movs	r0, #8
 413 0152 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 104:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		graphic_ctrl_bit_clear(B_CS2);
 414              		.loc 1 104 0
 415 0156 1020     		movs	r0, #16
 416 0158 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 105:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	} else if(controller == (B_CS1 | B_CS2)) {
 106:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		graphic_ctrl_bit_set(B_CS1);
 107:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		graphic_ctrl_bit_set(B_CS2);
 108:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	} else if(controller == B_CS1) {
 109:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		graphic_ctrl_bit_set(B_CS1);
 110:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		graphic_ctrl_bit_clear(B_CS2);
 111:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	} else if(controller == B_CS2) {
 112:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		graphic_ctrl_bit_clear(B_CS1);
 113:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		graphic_ctrl_bit_set(B_CS2);
 114:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	}
 115:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** }
 417              		.loc 1 115 0
 418 015c 1FE0     		b	.L25
 419              	.L21:
 105:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	} else if(controller == (B_CS1 | B_CS2)) {
 420              		.loc 1 105 0
 421 015e FB1D     		adds	r3, r7, #7
 422 0160 1B78     		ldrb	r3, [r3]
 423 0162 182B     		cmp	r3, #24
 424 0164 06D1     		bne	.L23
 106:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		graphic_ctrl_bit_set(B_CS2);
 425              		.loc 1 106 0
 426 0166 0820     		movs	r0, #8
 427 0168 FFF7FEFF 		bl	graphic_ctrl_bit_set
 107:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	} else if(controller == B_CS1) {
 428              		.loc 1 107 0
 429 016c 1020     		movs	r0, #16
 430 016e FFF7FEFF 		bl	graphic_ctrl_bit_set
 431              		.loc 1 115 0
 432 0172 14E0     		b	.L25
 433              	.L23:
 108:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		graphic_ctrl_bit_set(B_CS1);
 434              		.loc 1 108 0
 435 0174 FB1D     		adds	r3, r7, #7
 436 0176 1B78     		ldrb	r3, [r3]
 437 0178 082B     		cmp	r3, #8
 438 017a 06D1     		bne	.L24
 109:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		graphic_ctrl_bit_clear(B_CS2);
 439              		.loc 1 109 0
 440 017c 0820     		movs	r0, #8
 441 017e FFF7FEFF 		bl	graphic_ctrl_bit_set
 110:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	} else if(controller == B_CS2) {
 442              		.loc 1 110 0
 443 0182 1020     		movs	r0, #16
 444 0184 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 445              		.loc 1 115 0
 446 0188 09E0     		b	.L25
 447              	.L24:
 111:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		graphic_ctrl_bit_clear(B_CS1);
 448              		.loc 1 111 0
 449 018a FB1D     		adds	r3, r7, #7
 450 018c 1B78     		ldrb	r3, [r3]
 451 018e 102B     		cmp	r3, #16
 452 0190 05D1     		bne	.L25
 112:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		graphic_ctrl_bit_set(B_CS2);
 453              		.loc 1 112 0
 454 0192 0820     		movs	r0, #8
 455 0194 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 113:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	}
 456              		.loc 1 113 0
 457 0198 1020     		movs	r0, #16
 458 019a FFF7FEFF 		bl	graphic_ctrl_bit_set
 459              	.L25:
 460              		.loc 1 115 0
 461 019e C046     		nop
 462 01a0 BD46     		mov	sp, r7
 463 01a2 02B0     		add	sp, sp, #8
 464              		@ sp needed
 465 01a4 80BD     		pop	{r7, pc}
 466              		.cfi_endproc
 467              	.LFE8:
 469              		.align	1
 470              		.global	graphic_wait_ready
 471              		.syntax unified
 472              		.code	16
 473              		.thumb_func
 474              		.fpu softvfp
 476              	graphic_wait_ready:
 477              	.LFB9:
 116:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 
 117:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** void graphic_wait_ready() {
 478              		.loc 1 117 0
 479              		.cfi_startproc
 480              		@ args = 0, pretend = 0, frame = 0
 481              		@ frame_needed = 1, uses_anonymous_args = 0
 482 01a6 80B5     		push	{r7, lr}
 483              		.cfi_def_cfa_offset 8
 484              		.cfi_offset 7, -8
 485              		.cfi_offset 14, -4
 486 01a8 00AF     		add	r7, sp, #0
 487              		.cfi_def_cfa_register 7
 118:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_ctrl_bit_clear(B_E);
 488              		.loc 1 118 0
 489 01aa 4020     		movs	r0, #64
 490 01ac FFF7FEFF 		bl	graphic_ctrl_bit_clear
 119:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	*GPIO_MODER = 0x00005555;
 491              		.loc 1 119 0
 492 01b0 124B     		ldr	r3, .L29
 493 01b2 134A     		ldr	r2, .L29+4
 494 01b4 1A60     		str	r2, [r3]
 120:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_ctrl_bit_clear(B_RS);
 495              		.loc 1 120 0
 496 01b6 0120     		movs	r0, #1
 497 01b8 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 121:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_ctrl_bit_set(B_RW);
 498              		.loc 1 121 0
 499 01bc 0220     		movs	r0, #2
 500 01be FFF7FEFF 		bl	graphic_ctrl_bit_set
 122:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	delay_500ns();
 501              		.loc 1 122 0
 502 01c2 FFF7FEFF 		bl	delay_500ns
 123:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	while(*GPIO_IDR_HIGH & LCD_BUSY) { // Wait for display not to be busy
 503              		.loc 1 123 0
 504 01c6 09E0     		b	.L27
 505              	.L28:
 124:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		graphic_ctrl_bit_set(B_E);
 506              		.loc 1 124 0
 507 01c8 4020     		movs	r0, #64
 508 01ca FFF7FEFF 		bl	graphic_ctrl_bit_set
 125:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		delay_500ns();
 509              		.loc 1 125 0
 510 01ce FFF7FEFF 		bl	delay_500ns
 126:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		graphic_ctrl_bit_clear(B_E);
 511              		.loc 1 126 0
 512 01d2 4020     		movs	r0, #64
 513 01d4 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 127:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		delay_500ns();		
 514              		.loc 1 127 0
 515 01d8 FFF7FEFF 		bl	delay_500ns
 516              	.L27:
 123:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		graphic_ctrl_bit_set(B_E);
 517              		.loc 1 123 0
 518 01dc 094B     		ldr	r3, .L29+8
 519 01de 1B78     		ldrb	r3, [r3]
 520 01e0 DBB2     		uxtb	r3, r3
 521 01e2 5BB2     		sxtb	r3, r3
 522 01e4 002B     		cmp	r3, #0
 523 01e6 EFDB     		blt	.L28
 128:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	}
 129:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_ctrl_bit_set(B_E);
 524              		.loc 1 129 0
 525 01e8 4020     		movs	r0, #64
 526 01ea FFF7FEFF 		bl	graphic_ctrl_bit_set
 130:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	*GPIO_MODER = 0x55555555;
 527              		.loc 1 130 0
 528 01ee 034B     		ldr	r3, .L29
 529 01f0 054A     		ldr	r2, .L29+12
 530 01f2 1A60     		str	r2, [r3]
 131:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** }
 531              		.loc 1 131 0
 532 01f4 C046     		nop
 533 01f6 BD46     		mov	sp, r7
 534              		@ sp needed
 535 01f8 80BD     		pop	{r7, pc}
 536              	.L30:
 537 01fa C046     		.align	2
 538              	.L29:
 539 01fc 00100240 		.word	1073876992
 540 0200 55550000 		.word	21845
 541 0204 11100240 		.word	1073877009
 542 0208 55555555 		.word	1431655765
 543              		.cfi_endproc
 544              	.LFE9:
 546              		.align	1
 547              		.global	graphic_read
 548              		.syntax unified
 549              		.code	16
 550              		.thumb_func
 551              		.fpu softvfp
 553              	graphic_read:
 554              	.LFB10:
 132:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 
 133:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** unsigned char graphic_read(unsigned char controller) {
 555              		.loc 1 133 0
 556              		.cfi_startproc
 557              		@ args = 0, pretend = 0, frame = 16
 558              		@ frame_needed = 1, uses_anonymous_args = 0
 559 020c 80B5     		push	{r7, lr}
 560              		.cfi_def_cfa_offset 8
 561              		.cfi_offset 7, -8
 562              		.cfi_offset 14, -4
 563 020e 84B0     		sub	sp, sp, #16
 564              		.cfi_def_cfa_offset 24
 565 0210 00AF     		add	r7, sp, #0
 566              		.cfi_def_cfa_register 7
 567 0212 0200     		movs	r2, r0
 568 0214 FB1D     		adds	r3, r7, #7
 569 0216 1A70     		strb	r2, [r3]
 134:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_ctrl_bit_clear(B_E);
 570              		.loc 1 134 0
 571 0218 4020     		movs	r0, #64
 572 021a FFF7FEFF 		bl	graphic_ctrl_bit_clear
 135:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	*GPIO_MODER = 0x00005555;
 573              		.loc 1 135 0
 574 021e 1C4B     		ldr	r3, .L35
 575 0220 1C4A     		ldr	r2, .L35+4
 576 0222 1A60     		str	r2, [r3]
 136:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_ctrl_bit_set(B_RS);
 577              		.loc 1 136 0
 578 0224 0120     		movs	r0, #1
 579 0226 FFF7FEFF 		bl	graphic_ctrl_bit_set
 137:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_ctrl_bit_set(B_RW);
 580              		.loc 1 137 0
 581 022a 0220     		movs	r0, #2
 582 022c FFF7FEFF 		bl	graphic_ctrl_bit_set
 138:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	select_cotroller(controller);
 583              		.loc 1 138 0
 584 0230 FB1D     		adds	r3, r7, #7
 585 0232 1B78     		ldrb	r3, [r3]
 586 0234 1800     		movs	r0, r3
 587 0236 FFF7FEFF 		bl	select_cotroller
 139:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	delay_500ns();
 588              		.loc 1 139 0
 589 023a FFF7FEFF 		bl	delay_500ns
 140:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_ctrl_bit_set(B_E);
 590              		.loc 1 140 0
 591 023e 4020     		movs	r0, #64
 592 0240 FFF7FEFF 		bl	graphic_ctrl_bit_set
 141:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	delay_500ns();
 593              		.loc 1 141 0
 594 0244 FFF7FEFF 		bl	delay_500ns
 142:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	unsigned char RV = *GPIO_IDR_HIGH;
 595              		.loc 1 142 0
 596 0248 134A     		ldr	r2, .L35+8
 597 024a 0F23     		movs	r3, #15
 598 024c FB18     		adds	r3, r7, r3
 599 024e 1278     		ldrb	r2, [r2]
 600 0250 1A70     		strb	r2, [r3]
 143:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_ctrl_bit_clear(B_E);
 601              		.loc 1 143 0
 602 0252 4020     		movs	r0, #64
 603 0254 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 144:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	*GPIO_MODER = 0x55555555;
 604              		.loc 1 144 0
 605 0258 0D4B     		ldr	r3, .L35
 606 025a 104A     		ldr	r2, .L35+12
 607 025c 1A60     		str	r2, [r3]
 145:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	if(controller == B_CS1) {
 608              		.loc 1 145 0
 609 025e FB1D     		adds	r3, r7, #7
 610 0260 1B78     		ldrb	r3, [r3]
 611 0262 082B     		cmp	r3, #8
 612 0264 04D1     		bne	.L32
 146:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		select_cotroller(B_CS1);
 613              		.loc 1 146 0
 614 0266 0820     		movs	r0, #8
 615 0268 FFF7FEFF 		bl	select_cotroller
 147:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		graphic_wait_ready();
 616              		.loc 1 147 0
 617 026c FFF7FEFF 		bl	graphic_wait_ready
 618              	.L32:
 148:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	}
 149:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	if(controller == B_CS2) {
 619              		.loc 1 149 0
 620 0270 FB1D     		adds	r3, r7, #7
 621 0272 1B78     		ldrb	r3, [r3]
 622 0274 102B     		cmp	r3, #16
 623 0276 04D1     		bne	.L33
 150:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		select_cotroller(B_CS2);
 624              		.loc 1 150 0
 625 0278 1020     		movs	r0, #16
 626 027a FFF7FEFF 		bl	select_cotroller
 151:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		graphic_wait_ready();
 627              		.loc 1 151 0
 628 027e FFF7FEFF 		bl	graphic_wait_ready
 629              	.L33:
 152:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	}
 153:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	return RV;
 630              		.loc 1 153 0
 631 0282 0F23     		movs	r3, #15
 632 0284 FB18     		adds	r3, r7, r3
 633 0286 1B78     		ldrb	r3, [r3]
 154:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** }
 634              		.loc 1 154 0
 635 0288 1800     		movs	r0, r3
 636 028a BD46     		mov	sp, r7
 637 028c 04B0     		add	sp, sp, #16
 638              		@ sp needed
 639 028e 80BD     		pop	{r7, pc}
 640              	.L36:
 641              		.align	2
 642              	.L35:
 643 0290 00100240 		.word	1073876992
 644 0294 55550000 		.word	21845
 645 0298 11100240 		.word	1073877009
 646 029c 55555555 		.word	1431655765
 647              		.cfi_endproc
 648              	.LFE10:
 650              		.align	1
 651              		.global	graphic_write
 652              		.syntax unified
 653              		.code	16
 654              		.thumb_func
 655              		.fpu softvfp
 657              	graphic_write:
 658              	.LFB11:
 155:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 
 156:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** void graphic_write(unsigned char value, unsigned char controller) {
 659              		.loc 1 156 0
 660              		.cfi_startproc
 661              		@ args = 0, pretend = 0, frame = 8
 662              		@ frame_needed = 1, uses_anonymous_args = 0
 663 02a0 80B5     		push	{r7, lr}
 664              		.cfi_def_cfa_offset 8
 665              		.cfi_offset 7, -8
 666              		.cfi_offset 14, -4
 667 02a2 82B0     		sub	sp, sp, #8
 668              		.cfi_def_cfa_offset 16
 669 02a4 00AF     		add	r7, sp, #0
 670              		.cfi_def_cfa_register 7
 671 02a6 0200     		movs	r2, r0
 672 02a8 FB1D     		adds	r3, r7, #7
 673 02aa 1A70     		strb	r2, [r3]
 674 02ac BB1D     		adds	r3, r7, #6
 675 02ae 0A1C     		adds	r2, r1, #0
 676 02b0 1A70     		strb	r2, [r3]
 157:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	*GPIO_ODR_HIGH = value;
 677              		.loc 1 157 0
 678 02b2 1A4A     		ldr	r2, .L40
 679 02b4 FB1D     		adds	r3, r7, #7
 680 02b6 1B78     		ldrb	r3, [r3]
 681 02b8 1370     		strb	r3, [r2]
 158:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	select_cotroller(controller);
 682              		.loc 1 158 0
 683 02ba BB1D     		adds	r3, r7, #6
 684 02bc 1B78     		ldrb	r3, [r3]
 685 02be 1800     		movs	r0, r3
 686 02c0 FFF7FEFF 		bl	select_cotroller
 159:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	delay_500ns();
 687              		.loc 1 159 0
 688 02c4 FFF7FEFF 		bl	delay_500ns
 160:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_ctrl_bit_set(B_E);
 689              		.loc 1 160 0
 690 02c8 4020     		movs	r0, #64
 691 02ca FFF7FEFF 		bl	graphic_ctrl_bit_set
 161:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	delay_500ns();
 692              		.loc 1 161 0
 693 02ce FFF7FEFF 		bl	delay_500ns
 162:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_ctrl_bit_clear(B_E);
 694              		.loc 1 162 0
 695 02d2 4020     		movs	r0, #64
 696 02d4 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 163:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	
 164:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	//Kanske inte ska vara så här för this statement
 165:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	if(controller & B_CS1) {
 697              		.loc 1 165 0
 698 02d8 BB1D     		adds	r3, r7, #6
 699 02da 1B78     		ldrb	r3, [r3]
 700 02dc 0822     		movs	r2, #8
 701 02de 1340     		ands	r3, r2
 702 02e0 04D0     		beq	.L38
 166:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		select_cotroller(B_CS1);
 703              		.loc 1 166 0
 704 02e2 0820     		movs	r0, #8
 705 02e4 FFF7FEFF 		bl	select_cotroller
 167:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		graphic_wait_ready();
 706              		.loc 1 167 0
 707 02e8 FFF7FEFF 		bl	graphic_wait_ready
 708              	.L38:
 168:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	}
 169:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	
 170:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	if(controller & B_CS2) {
 709              		.loc 1 170 0
 710 02ec BB1D     		adds	r3, r7, #6
 711 02ee 1B78     		ldrb	r3, [r3]
 712 02f0 1022     		movs	r2, #16
 713 02f2 1340     		ands	r3, r2
 714 02f4 04D0     		beq	.L39
 171:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		select_cotroller(B_CS2);
 715              		.loc 1 171 0
 716 02f6 1020     		movs	r0, #16
 717 02f8 FFF7FEFF 		bl	select_cotroller
 172:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		graphic_wait_ready();
 718              		.loc 1 172 0
 719 02fc FFF7FEFF 		bl	graphic_wait_ready
 720              	.L39:
 173:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	}
 174:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	
 175:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	*GPIO_ODR_HIGH = 0;
 721              		.loc 1 175 0
 722 0300 064B     		ldr	r3, .L40
 723 0302 0022     		movs	r2, #0
 724 0304 1A70     		strb	r2, [r3]
 176:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_ctrl_bit_set(B_E);
 725              		.loc 1 176 0
 726 0306 4020     		movs	r0, #64
 727 0308 FFF7FEFF 		bl	graphic_ctrl_bit_set
 177:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	select_cotroller(0);
 728              		.loc 1 177 0
 729 030c 0020     		movs	r0, #0
 730 030e FFF7FEFF 		bl	select_cotroller
 178:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** }
 731              		.loc 1 178 0
 732 0312 C046     		nop
 733 0314 BD46     		mov	sp, r7
 734 0316 02B0     		add	sp, sp, #8
 735              		@ sp needed
 736 0318 80BD     		pop	{r7, pc}
 737              	.L41:
 738 031a C046     		.align	2
 739              	.L40:
 740 031c 15100240 		.word	1073877013
 741              		.cfi_endproc
 742              	.LFE11:
 744              		.align	1
 745              		.global	graphic_write_command
 746              		.syntax unified
 747              		.code	16
 748              		.thumb_func
 749              		.fpu softvfp
 751              	graphic_write_command:
 752              	.LFB12:
 179:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 
 180:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** void graphic_write_command(unsigned char command, unsigned char controller) {
 753              		.loc 1 180 0
 754              		.cfi_startproc
 755              		@ args = 0, pretend = 0, frame = 8
 756              		@ frame_needed = 1, uses_anonymous_args = 0
 757 0320 80B5     		push	{r7, lr}
 758              		.cfi_def_cfa_offset 8
 759              		.cfi_offset 7, -8
 760              		.cfi_offset 14, -4
 761 0322 82B0     		sub	sp, sp, #8
 762              		.cfi_def_cfa_offset 16
 763 0324 00AF     		add	r7, sp, #0
 764              		.cfi_def_cfa_register 7
 765 0326 0200     		movs	r2, r0
 766 0328 FB1D     		adds	r3, r7, #7
 767 032a 1A70     		strb	r2, [r3]
 768 032c BB1D     		adds	r3, r7, #6
 769 032e 0A1C     		adds	r2, r1, #0
 770 0330 1A70     		strb	r2, [r3]
 181:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_ctrl_bit_clear(B_E);
 771              		.loc 1 181 0
 772 0332 4020     		movs	r0, #64
 773 0334 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 182:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	select_cotroller(controller);
 774              		.loc 1 182 0
 775 0338 BB1D     		adds	r3, r7, #6
 776 033a 1B78     		ldrb	r3, [r3]
 777 033c 1800     		movs	r0, r3
 778 033e FFF7FEFF 		bl	select_cotroller
 183:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_ctrl_bit_clear(B_RS);
 779              		.loc 1 183 0
 780 0342 0120     		movs	r0, #1
 781 0344 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 184:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_ctrl_bit_clear(B_RW);
 782              		.loc 1 184 0
 783 0348 0220     		movs	r0, #2
 784 034a FFF7FEFF 		bl	graphic_ctrl_bit_clear
 185:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_write(command, controller);
 785              		.loc 1 185 0
 786 034e BB1D     		adds	r3, r7, #6
 787 0350 1A78     		ldrb	r2, [r3]
 788 0352 FB1D     		adds	r3, r7, #7
 789 0354 1B78     		ldrb	r3, [r3]
 790 0356 1100     		movs	r1, r2
 791 0358 1800     		movs	r0, r3
 792 035a FFF7FEFF 		bl	graphic_write
 186:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** }
 793              		.loc 1 186 0
 794 035e C046     		nop
 795 0360 BD46     		mov	sp, r7
 796 0362 02B0     		add	sp, sp, #8
 797              		@ sp needed
 798 0364 80BD     		pop	{r7, pc}
 799              		.cfi_endproc
 800              	.LFE12:
 802              		.align	1
 803              		.global	graphic_write_data
 804              		.syntax unified
 805              		.code	16
 806              		.thumb_func
 807              		.fpu softvfp
 809              	graphic_write_data:
 810              	.LFB13:
 187:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 
 188:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** void graphic_write_data(unsigned char data, unsigned char controller) {
 811              		.loc 1 188 0
 812              		.cfi_startproc
 813              		@ args = 0, pretend = 0, frame = 8
 814              		@ frame_needed = 1, uses_anonymous_args = 0
 815 0366 80B5     		push	{r7, lr}
 816              		.cfi_def_cfa_offset 8
 817              		.cfi_offset 7, -8
 818              		.cfi_offset 14, -4
 819 0368 82B0     		sub	sp, sp, #8
 820              		.cfi_def_cfa_offset 16
 821 036a 00AF     		add	r7, sp, #0
 822              		.cfi_def_cfa_register 7
 823 036c 0200     		movs	r2, r0
 824 036e FB1D     		adds	r3, r7, #7
 825 0370 1A70     		strb	r2, [r3]
 826 0372 BB1D     		adds	r3, r7, #6
 827 0374 0A1C     		adds	r2, r1, #0
 828 0376 1A70     		strb	r2, [r3]
 189:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_ctrl_bit_set(B_E);
 829              		.loc 1 189 0
 830 0378 4020     		movs	r0, #64
 831 037a FFF7FEFF 		bl	graphic_ctrl_bit_set
 190:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	select_cotroller(controller);
 832              		.loc 1 190 0
 833 037e BB1D     		adds	r3, r7, #6
 834 0380 1B78     		ldrb	r3, [r3]
 835 0382 1800     		movs	r0, r3
 836 0384 FFF7FEFF 		bl	select_cotroller
 191:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_ctrl_bit_set(B_RS);
 837              		.loc 1 191 0
 838 0388 0120     		movs	r0, #1
 839 038a FFF7FEFF 		bl	graphic_ctrl_bit_set
 192:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_ctrl_bit_clear(B_RW);
 840              		.loc 1 192 0
 841 038e 0220     		movs	r0, #2
 842 0390 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 193:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_write(data, controller);
 843              		.loc 1 193 0
 844 0394 BB1D     		adds	r3, r7, #6
 845 0396 1A78     		ldrb	r2, [r3]
 846 0398 FB1D     		adds	r3, r7, #7
 847 039a 1B78     		ldrb	r3, [r3]
 848 039c 1100     		movs	r1, r2
 849 039e 1800     		movs	r0, r3
 850 03a0 FFF7FEFF 		bl	graphic_write
 194:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** }
 851              		.loc 1 194 0
 852 03a4 C046     		nop
 853 03a6 BD46     		mov	sp, r7
 854 03a8 02B0     		add	sp, sp, #8
 855              		@ sp needed
 856 03aa 80BD     		pop	{r7, pc}
 857              		.cfi_endproc
 858              	.LFE13:
 860              		.align	1
 861              		.global	graphic_read_data
 862              		.syntax unified
 863              		.code	16
 864              		.thumb_func
 865              		.fpu softvfp
 867              	graphic_read_data:
 868              	.LFB14:
 195:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 
 196:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** unsigned char graphic_read_data(unsigned char controller) {
 869              		.loc 1 196 0
 870              		.cfi_startproc
 871              		@ args = 0, pretend = 0, frame = 8
 872              		@ frame_needed = 1, uses_anonymous_args = 0
 873 03ac 80B5     		push	{r7, lr}
 874              		.cfi_def_cfa_offset 8
 875              		.cfi_offset 7, -8
 876              		.cfi_offset 14, -4
 877 03ae 82B0     		sub	sp, sp, #8
 878              		.cfi_def_cfa_offset 16
 879 03b0 00AF     		add	r7, sp, #0
 880              		.cfi_def_cfa_register 7
 881 03b2 0200     		movs	r2, r0
 882 03b4 FB1D     		adds	r3, r7, #7
 883 03b6 1A70     		strb	r2, [r3]
 197:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	(void) graphic_read(controller);
 884              		.loc 1 197 0
 885 03b8 FB1D     		adds	r3, r7, #7
 886 03ba 1B78     		ldrb	r3, [r3]
 887 03bc 1800     		movs	r0, r3
 888 03be FFF7FEFF 		bl	graphic_read
 198:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	return graphic_read(controller);
 889              		.loc 1 198 0
 890 03c2 FB1D     		adds	r3, r7, #7
 891 03c4 1B78     		ldrb	r3, [r3]
 892 03c6 1800     		movs	r0, r3
 893 03c8 FFF7FEFF 		bl	graphic_read
 894 03cc 0300     		movs	r3, r0
 199:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** }
 895              		.loc 1 199 0
 896 03ce 1800     		movs	r0, r3
 897 03d0 BD46     		mov	sp, r7
 898 03d2 02B0     		add	sp, sp, #8
 899              		@ sp needed
 900 03d4 80BD     		pop	{r7, pc}
 901              		.cfi_endproc
 902              	.LFE14:
 904              		.align	1
 905              		.global	graphic_initalize
 906              		.syntax unified
 907              		.code	16
 908              		.thumb_func
 909              		.fpu softvfp
 911              	graphic_initalize:
 912              	.LFB15:
 200:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 
 201:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** void graphic_initalize(void) {
 913              		.loc 1 201 0
 914              		.cfi_startproc
 915              		@ args = 0, pretend = 0, frame = 0
 916              		@ frame_needed = 1, uses_anonymous_args = 0
 917 03d6 80B5     		push	{r7, lr}
 918              		.cfi_def_cfa_offset 8
 919              		.cfi_offset 7, -8
 920              		.cfi_offset 14, -4
 921 03d8 00AF     		add	r7, sp, #0
 922              		.cfi_def_cfa_register 7
 202:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_ctrl_bit_set(B_E);
 923              		.loc 1 202 0
 924 03da 4020     		movs	r0, #64
 925 03dc FFF7FEFF 		bl	graphic_ctrl_bit_set
 203:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	delay_mikro(10);
 926              		.loc 1 203 0
 927 03e0 0A20     		movs	r0, #10
 928 03e2 FFF7FEFF 		bl	delay_mikro
 204:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_ctrl_bit_clear(B_CS1 | B_CS2 | B_RST | B_E);
 929              		.loc 1 204 0
 930 03e6 7820     		movs	r0, #120
 931 03e8 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 205:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	delay_milli(30);
 932              		.loc 1 205 0
 933 03ec 1E20     		movs	r0, #30
 934 03ee FFF7FEFF 		bl	delay_milli
 206:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_ctrl_bit_set(B_RST);
 935              		.loc 1 206 0
 936 03f2 2020     		movs	r0, #32
 937 03f4 FFF7FEFF 		bl	graphic_ctrl_bit_set
 207:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_write_command(LCD_OFF, B_CS1 | B_CS2);
 938              		.loc 1 207 0
 939 03f8 1821     		movs	r1, #24
 940 03fa 3E20     		movs	r0, #62
 941 03fc FFF7FEFF 		bl	graphic_write_command
 208:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_write_command(LCD_ON, B_CS1 | B_CS2);
 942              		.loc 1 208 0
 943 0400 1821     		movs	r1, #24
 944 0402 3F20     		movs	r0, #63
 945 0404 FFF7FEFF 		bl	graphic_write_command
 209:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_write_command(LCD_DISP_START, B_CS1 | B_CS2);
 946              		.loc 1 209 0
 947 0408 1821     		movs	r1, #24
 948 040a C020     		movs	r0, #192
 949 040c FFF7FEFF 		bl	graphic_write_command
 210:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_write_command(LCD_SET_ADD, B_CS1 | B_CS2);
 950              		.loc 1 210 0
 951 0410 1821     		movs	r1, #24
 952 0412 4020     		movs	r0, #64
 953 0414 FFF7FEFF 		bl	graphic_write_command
 211:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_write_command(LCD_SET_PAGE, B_CS1 | B_CS2);
 954              		.loc 1 211 0
 955 0418 1821     		movs	r1, #24
 956 041a B820     		movs	r0, #184
 957 041c FFF7FEFF 		bl	graphic_write_command
 212:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	select_cotroller(0);
 958              		.loc 1 212 0
 959 0420 0020     		movs	r0, #0
 960 0422 FFF7FEFF 		bl	select_cotroller
 213:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** }
 961              		.loc 1 213 0
 962 0426 C046     		nop
 963 0428 BD46     		mov	sp, r7
 964              		@ sp needed
 965 042a 80BD     		pop	{r7, pc}
 966              		.cfi_endproc
 967              	.LFE15:
 969              		.align	1
 970              		.global	graphic_clear_screen
 971              		.syntax unified
 972              		.code	16
 973              		.thumb_func
 974              		.fpu softvfp
 976              	graphic_clear_screen:
 977              	.LFB16:
 214:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 
 215:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** void graphic_clear_screen(void) {
 978              		.loc 1 215 0
 979              		.cfi_startproc
 980              		@ args = 0, pretend = 0, frame = 8
 981              		@ frame_needed = 1, uses_anonymous_args = 0
 982 042c 80B5     		push	{r7, lr}
 983              		.cfi_def_cfa_offset 8
 984              		.cfi_offset 7, -8
 985              		.cfi_offset 14, -4
 986 042e 82B0     		sub	sp, sp, #8
 987              		.cfi_def_cfa_offset 16
 988 0430 00AF     		add	r7, sp, #0
 989              		.cfi_def_cfa_register 7
 990              	.LBB2:
 216:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	for(int page = 0; page < 7; page++) {
 991              		.loc 1 216 0
 992 0432 0023     		movs	r3, #0
 993 0434 7B60     		str	r3, [r7, #4]
 994 0436 1EE0     		b	.L48
 995              	.L51:
 217:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		graphic_write_command(LCD_SET_PAGE | page, B_CS1 | B_CS2);
 996              		.loc 1 217 0
 997 0438 7B68     		ldr	r3, [r7, #4]
 998 043a 5BB2     		sxtb	r3, r3
 999 043c 4822     		movs	r2, #72
 1000 043e 5242     		rsbs	r2, r2, #0
 1001 0440 1343     		orrs	r3, r2
 1002 0442 5BB2     		sxtb	r3, r3
 1003 0444 DBB2     		uxtb	r3, r3
 1004 0446 1821     		movs	r1, #24
 1005 0448 1800     		movs	r0, r3
 1006 044a FFF7FEFF 		bl	graphic_write_command
 218:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		graphic_write_command(LCD_SET_ADD | 0, B_CS1 | B_CS2);
 1007              		.loc 1 218 0
 1008 044e 1821     		movs	r1, #24
 1009 0450 4020     		movs	r0, #64
 1010 0452 FFF7FEFF 		bl	graphic_write_command
 1011              	.LBB3:
 219:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		for(int add = 0; add < 63; add++) {
 1012              		.loc 1 219 0
 1013 0456 0023     		movs	r3, #0
 1014 0458 3B60     		str	r3, [r7]
 1015 045a 06E0     		b	.L49
 1016              	.L50:
 220:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 			graphic_write_data(0, B_CS1 | B_CS2);
 1017              		.loc 1 220 0 discriminator 3
 1018 045c 1821     		movs	r1, #24
 1019 045e 0020     		movs	r0, #0
 1020 0460 FFF7FEFF 		bl	graphic_write_data
 219:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		for(int add = 0; add < 63; add++) {
 1021              		.loc 1 219 0 discriminator 3
 1022 0464 3B68     		ldr	r3, [r7]
 1023 0466 0133     		adds	r3, r3, #1
 1024 0468 3B60     		str	r3, [r7]
 1025              	.L49:
 219:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		for(int add = 0; add < 63; add++) {
 1026              		.loc 1 219 0 is_stmt 0 discriminator 1
 1027 046a 3B68     		ldr	r3, [r7]
 1028 046c 3E2B     		cmp	r3, #62
 1029 046e F5DD     		ble	.L50
 1030              	.LBE3:
 216:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		graphic_write_command(LCD_SET_PAGE | page, B_CS1 | B_CS2);
 1031              		.loc 1 216 0 is_stmt 1 discriminator 2
 1032 0470 7B68     		ldr	r3, [r7, #4]
 1033 0472 0133     		adds	r3, r3, #1
 1034 0474 7B60     		str	r3, [r7, #4]
 1035              	.L48:
 216:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		graphic_write_command(LCD_SET_PAGE | page, B_CS1 | B_CS2);
 1036              		.loc 1 216 0 is_stmt 0 discriminator 1
 1037 0476 7B68     		ldr	r3, [r7, #4]
 1038 0478 062B     		cmp	r3, #6
 1039 047a DDDD     		ble	.L51
 1040              	.LBE2:
 221:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		}
 222:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	}
 223:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** }
 1041              		.loc 1 223 0 is_stmt 1
 1042 047c C046     		nop
 1043 047e BD46     		mov	sp, r7
 1044 0480 02B0     		add	sp, sp, #8
 1045              		@ sp needed
 1046 0482 80BD     		pop	{r7, pc}
 1047              		.cfi_endproc
 1048              	.LFE16:
 1050              		.align	1
 1051              		.global	main
 1052              		.syntax unified
 1053              		.code	16
 1054              		.thumb_func
 1055              		.fpu softvfp
 1057              	main:
 1058              	.LFB17:
 224:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 
 225:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** void main(void) {
 1059              		.loc 1 225 0
 1060              		.cfi_startproc
 1061              		@ args = 0, pretend = 0, frame = 0
 1062              		@ frame_needed = 1, uses_anonymous_args = 0
 1063 0484 80B5     		push	{r7, lr}
 1064              		.cfi_def_cfa_offset 8
 1065              		.cfi_offset 7, -8
 1066              		.cfi_offset 14, -4
 1067 0486 00AF     		add	r7, sp, #0
 1068              		.cfi_def_cfa_register 7
 226:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	init_app();
 1069              		.loc 1 226 0
 1070 0488 FFF7FEFF 		bl	init_app
 227:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_initalize();
 1071              		.loc 1 227 0
 1072 048c FFF7FEFF 		bl	graphic_initalize
 228:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c ****   #ifndef SIMULATOR
 229:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_clear_screen();
 230:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c ****   #endif
 231:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_write_command(LCD_SET_ADD | 10, B_CS1 | B_CS2);
 1073              		.loc 1 231 0
 1074 0490 1821     		movs	r1, #24
 1075 0492 4A20     		movs	r0, #74
 1076 0494 FFF7FEFF 		bl	graphic_write_command
 232:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_write_command(LCD_SET_PAGE | 1, B_CS1 | B_CS2);
 1077              		.loc 1 232 0
 1078 0498 1821     		movs	r1, #24
 1079 049a B920     		movs	r0, #185
 1080 049c FFF7FEFF 		bl	graphic_write_command
 233:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_write(0xFF, B_CS1 | B_CS2);
 1081              		.loc 1 233 0
 1082 04a0 1821     		movs	r1, #24
 1083 04a2 FF20     		movs	r0, #255
 1084 04a4 FFF7FEFF 		bl	graphic_write
 234:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** }
 1085              		.loc 1 234 0
 1086 04a8 C046     		nop
 1087 04aa BD46     		mov	sp, r7
 1088              		@ sp needed
 1089 04ac 80BD     		pop	{r7, pc}
 1090              		.cfi_endproc
 1091              	.LFE17:
 1093              	.Letext0:
