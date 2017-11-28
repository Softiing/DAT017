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
 480              		@ args = 0, pretend = 0, frame = 8
 481              		@ frame_needed = 1, uses_anonymous_args = 0
 482 01a6 80B5     		push	{r7, lr}
 483              		.cfi_def_cfa_offset 8
 484              		.cfi_offset 7, -8
 485              		.cfi_offset 14, -4
 486 01a8 82B0     		sub	sp, sp, #8
 487              		.cfi_def_cfa_offset 16
 488 01aa 00AF     		add	r7, sp, #0
 489              		.cfi_def_cfa_register 7
 118:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_ctrl_bit_clear(B_E);
 490              		.loc 1 118 0
 491 01ac 4020     		movs	r0, #64
 492 01ae FFF7FEFF 		bl	graphic_ctrl_bit_clear
 119:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	*GPIO_MODER = 0x00005555;
 493              		.loc 1 119 0
 494 01b2 154B     		ldr	r3, .L32
 495 01b4 154A     		ldr	r2, .L32+4
 496 01b6 1A60     		str	r2, [r3]
 120:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_ctrl_bit_clear(B_RS);
 497              		.loc 1 120 0
 498 01b8 0120     		movs	r0, #1
 499 01ba FFF7FEFF 		bl	graphic_ctrl_bit_clear
 121:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_ctrl_bit_set(B_RW);
 500              		.loc 1 121 0
 501 01be 0220     		movs	r0, #2
 502 01c0 FFF7FEFF 		bl	graphic_ctrl_bit_set
 122:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	delay_500ns();
 503              		.loc 1 122 0
 504 01c4 FFF7FEFF 		bl	delay_500ns
 505              	.L29:
 506              	.LBB2:
 123:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	while(1) { // Wait for display not to be busy
 124:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		graphic_ctrl_bit_set(B_E);
 507              		.loc 1 124 0
 508 01c8 4020     		movs	r0, #64
 509 01ca FFF7FEFF 		bl	graphic_ctrl_bit_set
 125:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		delay_500ns();
 510              		.loc 1 125 0
 511 01ce FFF7FEFF 		bl	delay_500ns
 126:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		graphic_ctrl_bit_clear(B_E);
 512              		.loc 1 126 0
 513 01d2 4020     		movs	r0, #64
 514 01d4 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 127:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		delay_500ns();		
 515              		.loc 1 127 0
 516 01d8 FFF7FEFF 		bl	delay_500ns
 128:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		unsigned char i = *GPIO_IDR_HIGH;
 517              		.loc 1 128 0
 518 01dc 0C4A     		ldr	r2, .L32+8
 519 01de FB1D     		adds	r3, r7, #7
 520 01e0 1278     		ldrb	r2, [r2]
 521 01e2 1A70     		strb	r2, [r3]
 129:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		if((*GPIO_IDR_HIGH & LCD_BUSY) == 0) {
 522              		.loc 1 129 0
 523 01e4 0A4B     		ldr	r3, .L32+8
 524 01e6 1B78     		ldrb	r3, [r3]
 525 01e8 DBB2     		uxtb	r3, r3
 526 01ea 5BB2     		sxtb	r3, r3
 527 01ec 002B     		cmp	r3, #0
 528 01ee 00DA     		bge	.L31
 529              	.LBE2:
 123:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		graphic_ctrl_bit_set(B_E);
 530              		.loc 1 123 0
 531 01f0 EAE7     		b	.L29
 532              	.L31:
 533              	.LBB3:
 130:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 			break;
 534              		.loc 1 130 0
 535 01f2 C046     		nop
 536              	.LBE3:
 131:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		}
 132:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	}
 133:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_ctrl_bit_set(B_E);
 537              		.loc 1 133 0
 538 01f4 4020     		movs	r0, #64
 539 01f6 FFF7FEFF 		bl	graphic_ctrl_bit_set
 134:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	*GPIO_MODER = 0x55555555;
 540              		.loc 1 134 0
 541 01fa 034B     		ldr	r3, .L32
 542 01fc 054A     		ldr	r2, .L32+12
 543 01fe 1A60     		str	r2, [r3]
 135:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** }
 544              		.loc 1 135 0
 545 0200 C046     		nop
 546 0202 BD46     		mov	sp, r7
 547 0204 02B0     		add	sp, sp, #8
 548              		@ sp needed
 549 0206 80BD     		pop	{r7, pc}
 550              	.L33:
 551              		.align	2
 552              	.L32:
 553 0208 00100240 		.word	1073876992
 554 020c 55550000 		.word	21845
 555 0210 11100240 		.word	1073877009
 556 0214 55555555 		.word	1431655765
 557              		.cfi_endproc
 558              	.LFE9:
 560              		.align	1
 561              		.global	graphic_read
 562              		.syntax unified
 563              		.code	16
 564              		.thumb_func
 565              		.fpu softvfp
 567              	graphic_read:
 568              	.LFB10:
 136:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 
 137:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** unsigned char graphic_read(unsigned char controller) {
 569              		.loc 1 137 0
 570              		.cfi_startproc
 571              		@ args = 0, pretend = 0, frame = 16
 572              		@ frame_needed = 1, uses_anonymous_args = 0
 573 0218 80B5     		push	{r7, lr}
 574              		.cfi_def_cfa_offset 8
 575              		.cfi_offset 7, -8
 576              		.cfi_offset 14, -4
 577 021a 84B0     		sub	sp, sp, #16
 578              		.cfi_def_cfa_offset 24
 579 021c 00AF     		add	r7, sp, #0
 580              		.cfi_def_cfa_register 7
 581 021e 0200     		movs	r2, r0
 582 0220 FB1D     		adds	r3, r7, #7
 583 0222 1A70     		strb	r2, [r3]
 138:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_ctrl_bit_clear(B_E);
 584              		.loc 1 138 0
 585 0224 4020     		movs	r0, #64
 586 0226 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 139:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	*GPIO_MODER = 0x00005555;
 587              		.loc 1 139 0
 588 022a 1C4B     		ldr	r3, .L38
 589 022c 1C4A     		ldr	r2, .L38+4
 590 022e 1A60     		str	r2, [r3]
 140:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_ctrl_bit_set(B_RS);
 591              		.loc 1 140 0
 592 0230 0120     		movs	r0, #1
 593 0232 FFF7FEFF 		bl	graphic_ctrl_bit_set
 141:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_ctrl_bit_set(B_RW);
 594              		.loc 1 141 0
 595 0236 0220     		movs	r0, #2
 596 0238 FFF7FEFF 		bl	graphic_ctrl_bit_set
 142:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	select_cotroller(controller);
 597              		.loc 1 142 0
 598 023c FB1D     		adds	r3, r7, #7
 599 023e 1B78     		ldrb	r3, [r3]
 600 0240 1800     		movs	r0, r3
 601 0242 FFF7FEFF 		bl	select_cotroller
 143:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	delay_500ns();
 602              		.loc 1 143 0
 603 0246 FFF7FEFF 		bl	delay_500ns
 144:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_ctrl_bit_set(B_E);
 604              		.loc 1 144 0
 605 024a 4020     		movs	r0, #64
 606 024c FFF7FEFF 		bl	graphic_ctrl_bit_set
 145:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	delay_500ns();
 607              		.loc 1 145 0
 608 0250 FFF7FEFF 		bl	delay_500ns
 146:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	unsigned char RV = *GPIO_IDR_HIGH;
 609              		.loc 1 146 0
 610 0254 134A     		ldr	r2, .L38+8
 611 0256 0F23     		movs	r3, #15
 612 0258 FB18     		adds	r3, r7, r3
 613 025a 1278     		ldrb	r2, [r2]
 614 025c 1A70     		strb	r2, [r3]
 147:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_ctrl_bit_clear(B_E);
 615              		.loc 1 147 0
 616 025e 4020     		movs	r0, #64
 617 0260 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 148:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	*GPIO_MODER = 0x55555555;
 618              		.loc 1 148 0
 619 0264 0D4B     		ldr	r3, .L38
 620 0266 104A     		ldr	r2, .L38+12
 621 0268 1A60     		str	r2, [r3]
 149:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	if(controller == B_CS1) {
 622              		.loc 1 149 0
 623 026a FB1D     		adds	r3, r7, #7
 624 026c 1B78     		ldrb	r3, [r3]
 625 026e 082B     		cmp	r3, #8
 626 0270 04D1     		bne	.L35
 150:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		select_cotroller(B_CS1);
 627              		.loc 1 150 0
 628 0272 0820     		movs	r0, #8
 629 0274 FFF7FEFF 		bl	select_cotroller
 151:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		graphic_wait_ready();
 630              		.loc 1 151 0
 631 0278 FFF7FEFF 		bl	graphic_wait_ready
 632              	.L35:
 152:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	}
 153:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	if(controller == B_CS2) {
 633              		.loc 1 153 0
 634 027c FB1D     		adds	r3, r7, #7
 635 027e 1B78     		ldrb	r3, [r3]
 636 0280 102B     		cmp	r3, #16
 637 0282 04D1     		bne	.L36
 154:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		select_cotroller(B_CS2);
 638              		.loc 1 154 0
 639 0284 1020     		movs	r0, #16
 640 0286 FFF7FEFF 		bl	select_cotroller
 155:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		graphic_wait_ready();
 641              		.loc 1 155 0
 642 028a FFF7FEFF 		bl	graphic_wait_ready
 643              	.L36:
 156:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	}
 157:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	return RV;
 644              		.loc 1 157 0
 645 028e 0F23     		movs	r3, #15
 646 0290 FB18     		adds	r3, r7, r3
 647 0292 1B78     		ldrb	r3, [r3]
 158:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** }
 648              		.loc 1 158 0
 649 0294 1800     		movs	r0, r3
 650 0296 BD46     		mov	sp, r7
 651 0298 04B0     		add	sp, sp, #16
 652              		@ sp needed
 653 029a 80BD     		pop	{r7, pc}
 654              	.L39:
 655              		.align	2
 656              	.L38:
 657 029c 00100240 		.word	1073876992
 658 02a0 55550000 		.word	21845
 659 02a4 11100240 		.word	1073877009
 660 02a8 55555555 		.word	1431655765
 661              		.cfi_endproc
 662              	.LFE10:
 664              		.align	1
 665              		.global	graphic_write
 666              		.syntax unified
 667              		.code	16
 668              		.thumb_func
 669              		.fpu softvfp
 671              	graphic_write:
 672              	.LFB11:
 159:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 
 160:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** void graphic_write(unsigned char value, unsigned char controller) {
 673              		.loc 1 160 0
 674              		.cfi_startproc
 675              		@ args = 0, pretend = 0, frame = 8
 676              		@ frame_needed = 1, uses_anonymous_args = 0
 677 02ac 80B5     		push	{r7, lr}
 678              		.cfi_def_cfa_offset 8
 679              		.cfi_offset 7, -8
 680              		.cfi_offset 14, -4
 681 02ae 82B0     		sub	sp, sp, #8
 682              		.cfi_def_cfa_offset 16
 683 02b0 00AF     		add	r7, sp, #0
 684              		.cfi_def_cfa_register 7
 685 02b2 0200     		movs	r2, r0
 686 02b4 FB1D     		adds	r3, r7, #7
 687 02b6 1A70     		strb	r2, [r3]
 688 02b8 BB1D     		adds	r3, r7, #6
 689 02ba 0A1C     		adds	r2, r1, #0
 690 02bc 1A70     		strb	r2, [r3]
 161:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	*GPIO_ODR_HIGH = value;
 691              		.loc 1 161 0
 692 02be 1A4A     		ldr	r2, .L43
 693 02c0 FB1D     		adds	r3, r7, #7
 694 02c2 1B78     		ldrb	r3, [r3]
 695 02c4 1370     		strb	r3, [r2]
 162:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	select_cotroller(controller);
 696              		.loc 1 162 0
 697 02c6 BB1D     		adds	r3, r7, #6
 698 02c8 1B78     		ldrb	r3, [r3]
 699 02ca 1800     		movs	r0, r3
 700 02cc FFF7FEFF 		bl	select_cotroller
 163:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	delay_500ns();
 701              		.loc 1 163 0
 702 02d0 FFF7FEFF 		bl	delay_500ns
 164:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_ctrl_bit_set(B_E);
 703              		.loc 1 164 0
 704 02d4 4020     		movs	r0, #64
 705 02d6 FFF7FEFF 		bl	graphic_ctrl_bit_set
 165:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	delay_500ns();
 706              		.loc 1 165 0
 707 02da FFF7FEFF 		bl	delay_500ns
 166:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_ctrl_bit_clear(B_E);
 708              		.loc 1 166 0
 709 02de 4020     		movs	r0, #64
 710 02e0 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 167:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	
 168:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	//Kanske inte ska vara så här för this statement
 169:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	if(controller & B_CS1) {
 711              		.loc 1 169 0
 712 02e4 BB1D     		adds	r3, r7, #6
 713 02e6 1B78     		ldrb	r3, [r3]
 714 02e8 0822     		movs	r2, #8
 715 02ea 1340     		ands	r3, r2
 716 02ec 04D0     		beq	.L41
 170:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		select_cotroller(B_CS1);
 717              		.loc 1 170 0
 718 02ee 0820     		movs	r0, #8
 719 02f0 FFF7FEFF 		bl	select_cotroller
 171:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		graphic_wait_ready();
 720              		.loc 1 171 0
 721 02f4 FFF7FEFF 		bl	graphic_wait_ready
 722              	.L41:
 172:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	}
 173:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	
 174:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	if(controller & B_CS2) {
 723              		.loc 1 174 0
 724 02f8 BB1D     		adds	r3, r7, #6
 725 02fa 1B78     		ldrb	r3, [r3]
 726 02fc 1022     		movs	r2, #16
 727 02fe 1340     		ands	r3, r2
 728 0300 04D0     		beq	.L42
 175:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		select_cotroller(B_CS2);
 729              		.loc 1 175 0
 730 0302 1020     		movs	r0, #16
 731 0304 FFF7FEFF 		bl	select_cotroller
 176:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		graphic_wait_ready();
 732              		.loc 1 176 0
 733 0308 FFF7FEFF 		bl	graphic_wait_ready
 734              	.L42:
 177:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	}
 178:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	
 179:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	*GPIO_ODR_HIGH = 0;
 735              		.loc 1 179 0
 736 030c 064B     		ldr	r3, .L43
 737 030e 0022     		movs	r2, #0
 738 0310 1A70     		strb	r2, [r3]
 180:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_ctrl_bit_set(B_E);
 739              		.loc 1 180 0
 740 0312 4020     		movs	r0, #64
 741 0314 FFF7FEFF 		bl	graphic_ctrl_bit_set
 181:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	select_cotroller(0);
 742              		.loc 1 181 0
 743 0318 0020     		movs	r0, #0
 744 031a FFF7FEFF 		bl	select_cotroller
 182:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** }
 745              		.loc 1 182 0
 746 031e C046     		nop
 747 0320 BD46     		mov	sp, r7
 748 0322 02B0     		add	sp, sp, #8
 749              		@ sp needed
 750 0324 80BD     		pop	{r7, pc}
 751              	.L44:
 752 0326 C046     		.align	2
 753              	.L43:
 754 0328 15100240 		.word	1073877013
 755              		.cfi_endproc
 756              	.LFE11:
 758              		.align	1
 759              		.global	graphic_write_command
 760              		.syntax unified
 761              		.code	16
 762              		.thumb_func
 763              		.fpu softvfp
 765              	graphic_write_command:
 766              	.LFB12:
 183:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 
 184:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** void graphic_write_command(unsigned char command, unsigned char controller) {
 767              		.loc 1 184 0
 768              		.cfi_startproc
 769              		@ args = 0, pretend = 0, frame = 8
 770              		@ frame_needed = 1, uses_anonymous_args = 0
 771 032c 80B5     		push	{r7, lr}
 772              		.cfi_def_cfa_offset 8
 773              		.cfi_offset 7, -8
 774              		.cfi_offset 14, -4
 775 032e 82B0     		sub	sp, sp, #8
 776              		.cfi_def_cfa_offset 16
 777 0330 00AF     		add	r7, sp, #0
 778              		.cfi_def_cfa_register 7
 779 0332 0200     		movs	r2, r0
 780 0334 FB1D     		adds	r3, r7, #7
 781 0336 1A70     		strb	r2, [r3]
 782 0338 BB1D     		adds	r3, r7, #6
 783 033a 0A1C     		adds	r2, r1, #0
 784 033c 1A70     		strb	r2, [r3]
 185:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_ctrl_bit_clear(B_E);
 785              		.loc 1 185 0
 786 033e 4020     		movs	r0, #64
 787 0340 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 186:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	select_cotroller(controller);
 788              		.loc 1 186 0
 789 0344 BB1D     		adds	r3, r7, #6
 790 0346 1B78     		ldrb	r3, [r3]
 791 0348 1800     		movs	r0, r3
 792 034a FFF7FEFF 		bl	select_cotroller
 187:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_ctrl_bit_clear(B_RS);
 793              		.loc 1 187 0
 794 034e 0120     		movs	r0, #1
 795 0350 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 188:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_ctrl_bit_clear(B_RW);
 796              		.loc 1 188 0
 797 0354 0220     		movs	r0, #2
 798 0356 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 189:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_write(command, controller);
 799              		.loc 1 189 0
 800 035a BB1D     		adds	r3, r7, #6
 801 035c 1A78     		ldrb	r2, [r3]
 802 035e FB1D     		adds	r3, r7, #7
 803 0360 1B78     		ldrb	r3, [r3]
 804 0362 1100     		movs	r1, r2
 805 0364 1800     		movs	r0, r3
 806 0366 FFF7FEFF 		bl	graphic_write
 190:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** }
 807              		.loc 1 190 0
 808 036a C046     		nop
 809 036c BD46     		mov	sp, r7
 810 036e 02B0     		add	sp, sp, #8
 811              		@ sp needed
 812 0370 80BD     		pop	{r7, pc}
 813              		.cfi_endproc
 814              	.LFE12:
 816              		.align	1
 817              		.global	graphic_write_data
 818              		.syntax unified
 819              		.code	16
 820              		.thumb_func
 821              		.fpu softvfp
 823              	graphic_write_data:
 824              	.LFB13:
 191:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 
 192:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** void graphic_write_data(unsigned char data, unsigned char controller) {
 825              		.loc 1 192 0
 826              		.cfi_startproc
 827              		@ args = 0, pretend = 0, frame = 8
 828              		@ frame_needed = 1, uses_anonymous_args = 0
 829 0372 80B5     		push	{r7, lr}
 830              		.cfi_def_cfa_offset 8
 831              		.cfi_offset 7, -8
 832              		.cfi_offset 14, -4
 833 0374 82B0     		sub	sp, sp, #8
 834              		.cfi_def_cfa_offset 16
 835 0376 00AF     		add	r7, sp, #0
 836              		.cfi_def_cfa_register 7
 837 0378 0200     		movs	r2, r0
 838 037a FB1D     		adds	r3, r7, #7
 839 037c 1A70     		strb	r2, [r3]
 840 037e BB1D     		adds	r3, r7, #6
 841 0380 0A1C     		adds	r2, r1, #0
 842 0382 1A70     		strb	r2, [r3]
 193:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_ctrl_bit_set(B_E);
 843              		.loc 1 193 0
 844 0384 4020     		movs	r0, #64
 845 0386 FFF7FEFF 		bl	graphic_ctrl_bit_set
 194:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	select_cotroller(controller);
 846              		.loc 1 194 0
 847 038a BB1D     		adds	r3, r7, #6
 848 038c 1B78     		ldrb	r3, [r3]
 849 038e 1800     		movs	r0, r3
 850 0390 FFF7FEFF 		bl	select_cotroller
 195:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_ctrl_bit_set(B_RS);
 851              		.loc 1 195 0
 852 0394 0120     		movs	r0, #1
 853 0396 FFF7FEFF 		bl	graphic_ctrl_bit_set
 196:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_ctrl_bit_clear(B_RW);
 854              		.loc 1 196 0
 855 039a 0220     		movs	r0, #2
 856 039c FFF7FEFF 		bl	graphic_ctrl_bit_clear
 197:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_write(data, controller);
 857              		.loc 1 197 0
 858 03a0 BB1D     		adds	r3, r7, #6
 859 03a2 1A78     		ldrb	r2, [r3]
 860 03a4 FB1D     		adds	r3, r7, #7
 861 03a6 1B78     		ldrb	r3, [r3]
 862 03a8 1100     		movs	r1, r2
 863 03aa 1800     		movs	r0, r3
 864 03ac FFF7FEFF 		bl	graphic_write
 198:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** }
 865              		.loc 1 198 0
 866 03b0 C046     		nop
 867 03b2 BD46     		mov	sp, r7
 868 03b4 02B0     		add	sp, sp, #8
 869              		@ sp needed
 870 03b6 80BD     		pop	{r7, pc}
 871              		.cfi_endproc
 872              	.LFE13:
 874              		.align	1
 875              		.global	graphic_read_data
 876              		.syntax unified
 877              		.code	16
 878              		.thumb_func
 879              		.fpu softvfp
 881              	graphic_read_data:
 882              	.LFB14:
 199:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 
 200:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** unsigned char graphic_read_data(unsigned char controller) {
 883              		.loc 1 200 0
 884              		.cfi_startproc
 885              		@ args = 0, pretend = 0, frame = 8
 886              		@ frame_needed = 1, uses_anonymous_args = 0
 887 03b8 80B5     		push	{r7, lr}
 888              		.cfi_def_cfa_offset 8
 889              		.cfi_offset 7, -8
 890              		.cfi_offset 14, -4
 891 03ba 82B0     		sub	sp, sp, #8
 892              		.cfi_def_cfa_offset 16
 893 03bc 00AF     		add	r7, sp, #0
 894              		.cfi_def_cfa_register 7
 895 03be 0200     		movs	r2, r0
 896 03c0 FB1D     		adds	r3, r7, #7
 897 03c2 1A70     		strb	r2, [r3]
 201:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	(void) graphic_read(controller);
 898              		.loc 1 201 0
 899 03c4 FB1D     		adds	r3, r7, #7
 900 03c6 1B78     		ldrb	r3, [r3]
 901 03c8 1800     		movs	r0, r3
 902 03ca FFF7FEFF 		bl	graphic_read
 202:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	return graphic_read(controller);
 903              		.loc 1 202 0
 904 03ce FB1D     		adds	r3, r7, #7
 905 03d0 1B78     		ldrb	r3, [r3]
 906 03d2 1800     		movs	r0, r3
 907 03d4 FFF7FEFF 		bl	graphic_read
 908 03d8 0300     		movs	r3, r0
 203:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** }
 909              		.loc 1 203 0
 910 03da 1800     		movs	r0, r3
 911 03dc BD46     		mov	sp, r7
 912 03de 02B0     		add	sp, sp, #8
 913              		@ sp needed
 914 03e0 80BD     		pop	{r7, pc}
 915              		.cfi_endproc
 916              	.LFE14:
 918              		.align	1
 919              		.global	graphic_initalize
 920              		.syntax unified
 921              		.code	16
 922              		.thumb_func
 923              		.fpu softvfp
 925              	graphic_initalize:
 926              	.LFB15:
 204:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 
 205:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** void graphic_initalize(void) {
 927              		.loc 1 205 0
 928              		.cfi_startproc
 929              		@ args = 0, pretend = 0, frame = 0
 930              		@ frame_needed = 1, uses_anonymous_args = 0
 931 03e2 80B5     		push	{r7, lr}
 932              		.cfi_def_cfa_offset 8
 933              		.cfi_offset 7, -8
 934              		.cfi_offset 14, -4
 935 03e4 00AF     		add	r7, sp, #0
 936              		.cfi_def_cfa_register 7
 206:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_ctrl_bit_set(B_E);
 937              		.loc 1 206 0
 938 03e6 4020     		movs	r0, #64
 939 03e8 FFF7FEFF 		bl	graphic_ctrl_bit_set
 207:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	delay_mikro(10);
 940              		.loc 1 207 0
 941 03ec 0A20     		movs	r0, #10
 942 03ee FFF7FEFF 		bl	delay_mikro
 208:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_ctrl_bit_clear(B_CS1 | B_CS2 | B_RST | B_E);
 943              		.loc 1 208 0
 944 03f2 7820     		movs	r0, #120
 945 03f4 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 209:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	delay_milli(30);
 946              		.loc 1 209 0
 947 03f8 1E20     		movs	r0, #30
 948 03fa FFF7FEFF 		bl	delay_milli
 210:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_ctrl_bit_set(B_RST);
 949              		.loc 1 210 0
 950 03fe 2020     		movs	r0, #32
 951 0400 FFF7FEFF 		bl	graphic_ctrl_bit_set
 211:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_write_command(LCD_OFF, B_CS1 | B_CS2);
 952              		.loc 1 211 0
 953 0404 1821     		movs	r1, #24
 954 0406 3E20     		movs	r0, #62
 955 0408 FFF7FEFF 		bl	graphic_write_command
 212:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_write_command(LCD_ON, B_CS1 | B_CS2);
 956              		.loc 1 212 0
 957 040c 1821     		movs	r1, #24
 958 040e 3F20     		movs	r0, #63
 959 0410 FFF7FEFF 		bl	graphic_write_command
 213:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_write_command(LCD_DISP_START, B_CS1 | B_CS2);
 960              		.loc 1 213 0
 961 0414 1821     		movs	r1, #24
 962 0416 C020     		movs	r0, #192
 963 0418 FFF7FEFF 		bl	graphic_write_command
 214:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_write_command(LCD_SET_ADD, B_CS1 | B_CS2);
 964              		.loc 1 214 0
 965 041c 1821     		movs	r1, #24
 966 041e 4020     		movs	r0, #64
 967 0420 FFF7FEFF 		bl	graphic_write_command
 215:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_write_command(LCD_SET_PAGE, B_CS1 | B_CS2);
 968              		.loc 1 215 0
 969 0424 1821     		movs	r1, #24
 970 0426 B820     		movs	r0, #184
 971 0428 FFF7FEFF 		bl	graphic_write_command
 216:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	select_cotroller(0);
 972              		.loc 1 216 0
 973 042c 0020     		movs	r0, #0
 974 042e FFF7FEFF 		bl	select_cotroller
 217:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** }
 975              		.loc 1 217 0
 976 0432 C046     		nop
 977 0434 BD46     		mov	sp, r7
 978              		@ sp needed
 979 0436 80BD     		pop	{r7, pc}
 980              		.cfi_endproc
 981              	.LFE15:
 983              		.align	1
 984              		.global	graphic_clear_screen
 985              		.syntax unified
 986              		.code	16
 987              		.thumb_func
 988              		.fpu softvfp
 990              	graphic_clear_screen:
 991              	.LFB16:
 218:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 
 219:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** void graphic_clear_screen(void) {
 992              		.loc 1 219 0
 993              		.cfi_startproc
 994              		@ args = 0, pretend = 0, frame = 8
 995              		@ frame_needed = 1, uses_anonymous_args = 0
 996 0438 80B5     		push	{r7, lr}
 997              		.cfi_def_cfa_offset 8
 998              		.cfi_offset 7, -8
 999              		.cfi_offset 14, -4
 1000 043a 82B0     		sub	sp, sp, #8
 1001              		.cfi_def_cfa_offset 16
 1002 043c 00AF     		add	r7, sp, #0
 1003              		.cfi_def_cfa_register 7
 1004              	.LBB4:
 220:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	for(int page = 0; page < 7; page++) {
 1005              		.loc 1 220 0
 1006 043e 0023     		movs	r3, #0
 1007 0440 7B60     		str	r3, [r7, #4]
 1008 0442 1EE0     		b	.L51
 1009              	.L54:
 221:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		graphic_write_command(LCD_SET_PAGE | page, B_CS1 | B_CS2);
 1010              		.loc 1 221 0
 1011 0444 7B68     		ldr	r3, [r7, #4]
 1012 0446 5BB2     		sxtb	r3, r3
 1013 0448 4822     		movs	r2, #72
 1014 044a 5242     		rsbs	r2, r2, #0
 1015 044c 1343     		orrs	r3, r2
 1016 044e 5BB2     		sxtb	r3, r3
 1017 0450 DBB2     		uxtb	r3, r3
 1018 0452 1821     		movs	r1, #24
 1019 0454 1800     		movs	r0, r3
 1020 0456 FFF7FEFF 		bl	graphic_write_command
 222:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		graphic_write_command(LCD_SET_ADD | 0, B_CS1 | B_CS2);
 1021              		.loc 1 222 0
 1022 045a 1821     		movs	r1, #24
 1023 045c 4020     		movs	r0, #64
 1024 045e FFF7FEFF 		bl	graphic_write_command
 1025              	.LBB5:
 223:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		for(int add = 0; add < 63; add++) {
 1026              		.loc 1 223 0
 1027 0462 0023     		movs	r3, #0
 1028 0464 3B60     		str	r3, [r7]
 1029 0466 06E0     		b	.L52
 1030              	.L53:
 224:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 			graphic_write_data(0, B_CS1 | B_CS2);
 1031              		.loc 1 224 0 discriminator 3
 1032 0468 1821     		movs	r1, #24
 1033 046a 0020     		movs	r0, #0
 1034 046c FFF7FEFF 		bl	graphic_write_data
 223:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		for(int add = 0; add < 63; add++) {
 1035              		.loc 1 223 0 discriminator 3
 1036 0470 3B68     		ldr	r3, [r7]
 1037 0472 0133     		adds	r3, r3, #1
 1038 0474 3B60     		str	r3, [r7]
 1039              	.L52:
 223:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		for(int add = 0; add < 63; add++) {
 1040              		.loc 1 223 0 is_stmt 0 discriminator 1
 1041 0476 3B68     		ldr	r3, [r7]
 1042 0478 3E2B     		cmp	r3, #62
 1043 047a F5DD     		ble	.L53
 1044              	.LBE5:
 220:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		graphic_write_command(LCD_SET_PAGE | page, B_CS1 | B_CS2);
 1045              		.loc 1 220 0 is_stmt 1 discriminator 2
 1046 047c 7B68     		ldr	r3, [r7, #4]
 1047 047e 0133     		adds	r3, r3, #1
 1048 0480 7B60     		str	r3, [r7, #4]
 1049              	.L51:
 220:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		graphic_write_command(LCD_SET_PAGE | page, B_CS1 | B_CS2);
 1050              		.loc 1 220 0 is_stmt 0 discriminator 1
 1051 0482 7B68     		ldr	r3, [r7, #4]
 1052 0484 062B     		cmp	r3, #6
 1053 0486 DDDD     		ble	.L54
 1054              	.LBE4:
 225:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		}
 226:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	}
 227:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** }
 1055              		.loc 1 227 0 is_stmt 1
 1056 0488 C046     		nop
 1057 048a BD46     		mov	sp, r7
 1058 048c 02B0     		add	sp, sp, #8
 1059              		@ sp needed
 1060 048e 80BD     		pop	{r7, pc}
 1061              		.cfi_endproc
 1062              	.LFE16:
 1064              		.align	1
 1065              		.global	main
 1066              		.syntax unified
 1067              		.code	16
 1068              		.thumb_func
 1069              		.fpu softvfp
 1071              	main:
 1072              	.LFB17:
 228:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 
 229:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** void main(void) {
 1073              		.loc 1 229 0
 1074              		.cfi_startproc
 1075              		@ args = 0, pretend = 0, frame = 0
 1076              		@ frame_needed = 1, uses_anonymous_args = 0
 1077 0490 80B5     		push	{r7, lr}
 1078              		.cfi_def_cfa_offset 8
 1079              		.cfi_offset 7, -8
 1080              		.cfi_offset 14, -4
 1081 0492 00AF     		add	r7, sp, #0
 1082              		.cfi_def_cfa_register 7
 230:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	init_app();
 1083              		.loc 1 230 0
 1084 0494 FFF7FEFF 		bl	init_app
 231:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_initalize();
 1085              		.loc 1 231 0
 1086 0498 FFF7FEFF 		bl	graphic_initalize
 232:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c ****   #ifndef SIMULATOR
 233:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_clear_screen();
 234:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c ****   #endif
 235:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_write_command(LCD_SET_ADD | 10, B_CS1 | B_CS2);
 1087              		.loc 1 235 0
 1088 049c 1821     		movs	r1, #24
 1089 049e 4A20     		movs	r0, #74
 1090 04a0 FFF7FEFF 		bl	graphic_write_command
 236:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_write_command(LCD_SET_PAGE | 1, B_CS1 | B_CS2);
 1091              		.loc 1 236 0
 1092 04a4 1821     		movs	r1, #24
 1093 04a6 B920     		movs	r0, #185
 1094 04a8 FFF7FEFF 		bl	graphic_write_command
 237:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_write(0xFF, B_CS1 | B_CS2);
 1095              		.loc 1 237 0
 1096 04ac 1821     		movs	r1, #24
 1097 04ae FF20     		movs	r0, #255
 1098 04b0 FFF7FEFF 		bl	graphic_write
 238:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** }
 1099              		.loc 1 238 0
 1100 04b4 C046     		nop
 1101 04b6 BD46     		mov	sp, r7
 1102              		@ sp needed
 1103 04b8 80BD     		pop	{r7, pc}
 1104              		.cfi_endproc
 1105              	.LFE17:
 1107              	.Letext0:
