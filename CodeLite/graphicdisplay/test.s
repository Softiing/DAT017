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
 492 01b0 114B     		ldr	r3, .L29
 493 01b2 124A     		ldr	r2, .L29+4
 494 01b4 1A60     		str	r2, [r3]
 120:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_ctrl_bit_clear(B_RS);
 495              		.loc 1 120 0
 496 01b6 0120     		movs	r0, #1
 497 01b8 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 121:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_ctrl_bit_set(B_RW);
 498              		.loc 1 121 0
 499 01bc 0220     		movs	r0, #2
 500 01be FFF7FEFF 		bl	graphic_ctrl_bit_set
 122:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	delay_500ns;
 123:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	while(*GPIO_IDR_HIGH & LCD_BUSY) { // Wait for display not to be busy
 501              		.loc 1 123 0
 502 01c2 09E0     		b	.L27
 503              	.L28:
 124:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		graphic_ctrl_bit_set(B_E);
 504              		.loc 1 124 0
 505 01c4 4020     		movs	r0, #64
 506 01c6 FFF7FEFF 		bl	graphic_ctrl_bit_set
 125:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		delay_500ns();
 507              		.loc 1 125 0
 508 01ca FFF7FEFF 		bl	delay_500ns
 126:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		graphic_ctrl_bit_clear(B_E);
 509              		.loc 1 126 0
 510 01ce 4020     		movs	r0, #64
 511 01d0 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 127:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		delay_500ns();		
 512              		.loc 1 127 0
 513 01d4 FFF7FEFF 		bl	delay_500ns
 514              	.L27:
 123:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		graphic_ctrl_bit_set(B_E);
 515              		.loc 1 123 0
 516 01d8 094B     		ldr	r3, .L29+8
 517 01da 1B78     		ldrb	r3, [r3]
 518 01dc DBB2     		uxtb	r3, r3
 519 01de 5BB2     		sxtb	r3, r3
 520 01e0 002B     		cmp	r3, #0
 521 01e2 EFDB     		blt	.L28
 128:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	}
 129:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_ctrl_bit_set(B_E);
 522              		.loc 1 129 0
 523 01e4 4020     		movs	r0, #64
 524 01e6 FFF7FEFF 		bl	graphic_ctrl_bit_set
 130:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	*GPIO_MODER = 0x55555555;
 525              		.loc 1 130 0
 526 01ea 034B     		ldr	r3, .L29
 527 01ec 054A     		ldr	r2, .L29+12
 528 01ee 1A60     		str	r2, [r3]
 131:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** }
 529              		.loc 1 131 0
 530 01f0 C046     		nop
 531 01f2 BD46     		mov	sp, r7
 532              		@ sp needed
 533 01f4 80BD     		pop	{r7, pc}
 534              	.L30:
 535 01f6 C046     		.align	2
 536              	.L29:
 537 01f8 00100240 		.word	1073876992
 538 01fc 55550000 		.word	21845
 539 0200 11100240 		.word	1073877009
 540 0204 55555555 		.word	1431655765
 541              		.cfi_endproc
 542              	.LFE9:
 544              		.align	1
 545              		.global	graphic_read
 546              		.syntax unified
 547              		.code	16
 548              		.thumb_func
 549              		.fpu softvfp
 551              	graphic_read:
 552              	.LFB10:
 132:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 
 133:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** unsigned char graphic_read(unsigned char controller) {
 553              		.loc 1 133 0
 554              		.cfi_startproc
 555              		@ args = 0, pretend = 0, frame = 16
 556              		@ frame_needed = 1, uses_anonymous_args = 0
 557 0208 80B5     		push	{r7, lr}
 558              		.cfi_def_cfa_offset 8
 559              		.cfi_offset 7, -8
 560              		.cfi_offset 14, -4
 561 020a 84B0     		sub	sp, sp, #16
 562              		.cfi_def_cfa_offset 24
 563 020c 00AF     		add	r7, sp, #0
 564              		.cfi_def_cfa_register 7
 565 020e 0200     		movs	r2, r0
 566 0210 FB1D     		adds	r3, r7, #7
 567 0212 1A70     		strb	r2, [r3]
 134:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_ctrl_bit_clear(B_E);
 568              		.loc 1 134 0
 569 0214 4020     		movs	r0, #64
 570 0216 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 135:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	*GPIO_MODER = 0x00005555;
 571              		.loc 1 135 0
 572 021a 1D4B     		ldr	r3, .L35
 573 021c 1D4A     		ldr	r2, .L35+4
 574 021e 1A60     		str	r2, [r3]
 136:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_ctrl_bit_set(B_RS);
 575              		.loc 1 136 0
 576 0220 0120     		movs	r0, #1
 577 0222 FFF7FEFF 		bl	graphic_ctrl_bit_set
 137:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_ctrl_bit_set(B_RW);
 578              		.loc 1 137 0
 579 0226 0220     		movs	r0, #2
 580 0228 FFF7FEFF 		bl	graphic_ctrl_bit_set
 138:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	select_cotroller(controller);
 581              		.loc 1 138 0
 582 022c FB1D     		adds	r3, r7, #7
 583 022e 1B78     		ldrb	r3, [r3]
 584 0230 1800     		movs	r0, r3
 585 0232 FFF7FEFF 		bl	select_cotroller
 139:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	delay_500ns();
 586              		.loc 1 139 0
 587 0236 FFF7FEFF 		bl	delay_500ns
 140:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_ctrl_bit_set(B_E);
 588              		.loc 1 140 0
 589 023a 4020     		movs	r0, #64
 590 023c FFF7FEFF 		bl	graphic_ctrl_bit_set
 141:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	delay_500ns();
 591              		.loc 1 141 0
 592 0240 FFF7FEFF 		bl	delay_500ns
 142:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	unsigned char RV = *GPIO_IDR_HIGH;
 593              		.loc 1 142 0
 594 0244 144A     		ldr	r2, .L35+8
 595 0246 0F23     		movs	r3, #15
 596 0248 FB18     		adds	r3, r7, r3
 597 024a 1278     		ldrb	r2, [r2]
 598 024c 1A70     		strb	r2, [r3]
 143:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_ctrl_bit_clear(B_E);
 599              		.loc 1 143 0
 600 024e 4020     		movs	r0, #64
 601 0250 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 144:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	*GPIO_MODER = 0x55555555;
 602              		.loc 1 144 0
 603 0254 0E4B     		ldr	r3, .L35
 604 0256 114A     		ldr	r2, .L35+12
 605 0258 1A60     		str	r2, [r3]
 145:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	if(controller == B_CS1) {
 606              		.loc 1 145 0
 607 025a FB1D     		adds	r3, r7, #7
 608 025c 1B78     		ldrb	r3, [r3]
 609 025e 082B     		cmp	r3, #8
 610 0260 05D1     		bne	.L32
 146:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		select_cotroller(B_CS1);
 611              		.loc 1 146 0
 612 0262 0820     		movs	r0, #8
 613 0264 FFF7FEFF 		bl	select_cotroller
 147:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		graphic_wait_ready();
 614              		.loc 1 147 0
 615 0268 FFF7FEFF 		bl	graphic_wait_ready
 616 026c 08E0     		b	.L33
 617              	.L32:
 148:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	} else if(controller == B_CS2) {
 618              		.loc 1 148 0
 619 026e FB1D     		adds	r3, r7, #7
 620 0270 1B78     		ldrb	r3, [r3]
 621 0272 102B     		cmp	r3, #16
 622 0274 04D1     		bne	.L33
 149:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		select_cotroller(B_CS2);
 623              		.loc 1 149 0
 624 0276 1020     		movs	r0, #16
 625 0278 FFF7FEFF 		bl	select_cotroller
 150:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		graphic_wait_ready();
 626              		.loc 1 150 0
 627 027c FFF7FEFF 		bl	graphic_wait_ready
 628              	.L33:
 151:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	}
 152:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	return RV;
 629              		.loc 1 152 0
 630 0280 0F23     		movs	r3, #15
 631 0282 FB18     		adds	r3, r7, r3
 632 0284 1B78     		ldrb	r3, [r3]
 153:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** }
 633              		.loc 1 153 0
 634 0286 1800     		movs	r0, r3
 635 0288 BD46     		mov	sp, r7
 636 028a 04B0     		add	sp, sp, #16
 637              		@ sp needed
 638 028c 80BD     		pop	{r7, pc}
 639              	.L36:
 640 028e C046     		.align	2
 641              	.L35:
 642 0290 00100240 		.word	1073876992
 643 0294 55550000 		.word	21845
 644 0298 11100240 		.word	1073877009
 645 029c 55555555 		.word	1431655765
 646              		.cfi_endproc
 647              	.LFE10:
 649              		.align	1
 650              		.global	graphic_write
 651              		.syntax unified
 652              		.code	16
 653              		.thumb_func
 654              		.fpu softvfp
 656              	graphic_write:
 657              	.LFB11:
 154:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 
 155:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** void graphic_write(unsigned char value, unsigned char controller) {
 658              		.loc 1 155 0
 659              		.cfi_startproc
 660              		@ args = 0, pretend = 0, frame = 8
 661              		@ frame_needed = 1, uses_anonymous_args = 0
 662 02a0 80B5     		push	{r7, lr}
 663              		.cfi_def_cfa_offset 8
 664              		.cfi_offset 7, -8
 665              		.cfi_offset 14, -4
 666 02a2 82B0     		sub	sp, sp, #8
 667              		.cfi_def_cfa_offset 16
 668 02a4 00AF     		add	r7, sp, #0
 669              		.cfi_def_cfa_register 7
 670 02a6 0200     		movs	r2, r0
 671 02a8 FB1D     		adds	r3, r7, #7
 672 02aa 1A70     		strb	r2, [r3]
 673 02ac BB1D     		adds	r3, r7, #6
 674 02ae 0A1C     		adds	r2, r1, #0
 675 02b0 1A70     		strb	r2, [r3]
 156:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	*GPIO_ODR_HIGH = value;
 676              		.loc 1 156 0
 677 02b2 1A4A     		ldr	r2, .L40
 678 02b4 FB1D     		adds	r3, r7, #7
 679 02b6 1B78     		ldrb	r3, [r3]
 680 02b8 1370     		strb	r3, [r2]
 157:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	select_cotroller(controller);
 681              		.loc 1 157 0
 682 02ba BB1D     		adds	r3, r7, #6
 683 02bc 1B78     		ldrb	r3, [r3]
 684 02be 1800     		movs	r0, r3
 685 02c0 FFF7FEFF 		bl	select_cotroller
 158:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	delay_500ns();
 686              		.loc 1 158 0
 687 02c4 FFF7FEFF 		bl	delay_500ns
 159:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_ctrl_bit_set(B_E);
 688              		.loc 1 159 0
 689 02c8 4020     		movs	r0, #64
 690 02ca FFF7FEFF 		bl	graphic_ctrl_bit_set
 160:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	delay_500ns();
 691              		.loc 1 160 0
 692 02ce FFF7FEFF 		bl	delay_500ns
 161:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_ctrl_bit_clear(B_E);
 693              		.loc 1 161 0
 694 02d2 4020     		movs	r0, #64
 695 02d4 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 162:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	
 163:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	//Kanske inte ska vara så här för this statement
 164:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	if(controller & B_CS1) {
 696              		.loc 1 164 0
 697 02d8 BB1D     		adds	r3, r7, #6
 698 02da 1B78     		ldrb	r3, [r3]
 699 02dc 0822     		movs	r2, #8
 700 02de 1340     		ands	r3, r2
 701 02e0 04D0     		beq	.L38
 165:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		select_cotroller(B_CS1);
 702              		.loc 1 165 0
 703 02e2 0820     		movs	r0, #8
 704 02e4 FFF7FEFF 		bl	select_cotroller
 166:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		graphic_wait_ready();
 705              		.loc 1 166 0
 706 02e8 FFF7FEFF 		bl	graphic_wait_ready
 707              	.L38:
 167:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	}
 168:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	
 169:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	if(controller & B_CS2) {
 708              		.loc 1 169 0
 709 02ec BB1D     		adds	r3, r7, #6
 710 02ee 1B78     		ldrb	r3, [r3]
 711 02f0 1022     		movs	r2, #16
 712 02f2 1340     		ands	r3, r2
 713 02f4 04D0     		beq	.L39
 170:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		select_cotroller(B_CS2);
 714              		.loc 1 170 0
 715 02f6 1020     		movs	r0, #16
 716 02f8 FFF7FEFF 		bl	select_cotroller
 171:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		graphic_wait_ready();
 717              		.loc 1 171 0
 718 02fc FFF7FEFF 		bl	graphic_wait_ready
 719              	.L39:
 172:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	}
 173:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	
 174:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	*GPIO_ODR_HIGH = 0;
 720              		.loc 1 174 0
 721 0300 064B     		ldr	r3, .L40
 722 0302 0022     		movs	r2, #0
 723 0304 1A70     		strb	r2, [r3]
 175:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_ctrl_bit_set(B_E);
 724              		.loc 1 175 0
 725 0306 4020     		movs	r0, #64
 726 0308 FFF7FEFF 		bl	graphic_ctrl_bit_set
 176:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	select_cotroller(0);
 727              		.loc 1 176 0
 728 030c 0020     		movs	r0, #0
 729 030e FFF7FEFF 		bl	select_cotroller
 177:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** }
 730              		.loc 1 177 0
 731 0312 C046     		nop
 732 0314 BD46     		mov	sp, r7
 733 0316 02B0     		add	sp, sp, #8
 734              		@ sp needed
 735 0318 80BD     		pop	{r7, pc}
 736              	.L41:
 737 031a C046     		.align	2
 738              	.L40:
 739 031c 15100240 		.word	1073877013
 740              		.cfi_endproc
 741              	.LFE11:
 743              		.align	1
 744              		.global	graphic_write_command
 745              		.syntax unified
 746              		.code	16
 747              		.thumb_func
 748              		.fpu softvfp
 750              	graphic_write_command:
 751              	.LFB12:
 178:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 
 179:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** void graphic_write_command(unsigned char command, unsigned char controller) {
 752              		.loc 1 179 0
 753              		.cfi_startproc
 754              		@ args = 0, pretend = 0, frame = 8
 755              		@ frame_needed = 1, uses_anonymous_args = 0
 756 0320 80B5     		push	{r7, lr}
 757              		.cfi_def_cfa_offset 8
 758              		.cfi_offset 7, -8
 759              		.cfi_offset 14, -4
 760 0322 82B0     		sub	sp, sp, #8
 761              		.cfi_def_cfa_offset 16
 762 0324 00AF     		add	r7, sp, #0
 763              		.cfi_def_cfa_register 7
 764 0326 0200     		movs	r2, r0
 765 0328 FB1D     		adds	r3, r7, #7
 766 032a 1A70     		strb	r2, [r3]
 767 032c BB1D     		adds	r3, r7, #6
 768 032e 0A1C     		adds	r2, r1, #0
 769 0330 1A70     		strb	r2, [r3]
 180:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_ctrl_bit_clear(B_E);
 770              		.loc 1 180 0
 771 0332 4020     		movs	r0, #64
 772 0334 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 181:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	select_cotroller(controller);
 773              		.loc 1 181 0
 774 0338 BB1D     		adds	r3, r7, #6
 775 033a 1B78     		ldrb	r3, [r3]
 776 033c 1800     		movs	r0, r3
 777 033e FFF7FEFF 		bl	select_cotroller
 182:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_ctrl_bit_clear(B_RS);
 778              		.loc 1 182 0
 779 0342 0120     		movs	r0, #1
 780 0344 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 183:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_ctrl_bit_clear(B_RW);
 781              		.loc 1 183 0
 782 0348 0220     		movs	r0, #2
 783 034a FFF7FEFF 		bl	graphic_ctrl_bit_clear
 184:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_write(command, controller);
 784              		.loc 1 184 0
 785 034e BB1D     		adds	r3, r7, #6
 786 0350 1A78     		ldrb	r2, [r3]
 787 0352 FB1D     		adds	r3, r7, #7
 788 0354 1B78     		ldrb	r3, [r3]
 789 0356 1100     		movs	r1, r2
 790 0358 1800     		movs	r0, r3
 791 035a FFF7FEFF 		bl	graphic_write
 185:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** }
 792              		.loc 1 185 0
 793 035e C046     		nop
 794 0360 BD46     		mov	sp, r7
 795 0362 02B0     		add	sp, sp, #8
 796              		@ sp needed
 797 0364 80BD     		pop	{r7, pc}
 798              		.cfi_endproc
 799              	.LFE12:
 801              		.align	1
 802              		.global	graphic_write_data
 803              		.syntax unified
 804              		.code	16
 805              		.thumb_func
 806              		.fpu softvfp
 808              	graphic_write_data:
 809              	.LFB13:
 186:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 
 187:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** void graphic_write_data(unsigned char data, unsigned char controller) {
 810              		.loc 1 187 0
 811              		.cfi_startproc
 812              		@ args = 0, pretend = 0, frame = 8
 813              		@ frame_needed = 1, uses_anonymous_args = 0
 814 0366 80B5     		push	{r7, lr}
 815              		.cfi_def_cfa_offset 8
 816              		.cfi_offset 7, -8
 817              		.cfi_offset 14, -4
 818 0368 82B0     		sub	sp, sp, #8
 819              		.cfi_def_cfa_offset 16
 820 036a 00AF     		add	r7, sp, #0
 821              		.cfi_def_cfa_register 7
 822 036c 0200     		movs	r2, r0
 823 036e FB1D     		adds	r3, r7, #7
 824 0370 1A70     		strb	r2, [r3]
 825 0372 BB1D     		adds	r3, r7, #6
 826 0374 0A1C     		adds	r2, r1, #0
 827 0376 1A70     		strb	r2, [r3]
 188:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_ctrl_bit_set(B_E);
 828              		.loc 1 188 0
 829 0378 4020     		movs	r0, #64
 830 037a FFF7FEFF 		bl	graphic_ctrl_bit_set
 189:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	select_cotroller(controller);
 831              		.loc 1 189 0
 832 037e BB1D     		adds	r3, r7, #6
 833 0380 1B78     		ldrb	r3, [r3]
 834 0382 1800     		movs	r0, r3
 835 0384 FFF7FEFF 		bl	select_cotroller
 190:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_ctrl_bit_set(B_RS);
 836              		.loc 1 190 0
 837 0388 0120     		movs	r0, #1
 838 038a FFF7FEFF 		bl	graphic_ctrl_bit_set
 191:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_ctrl_bit_clear(B_RW);
 839              		.loc 1 191 0
 840 038e 0220     		movs	r0, #2
 841 0390 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 192:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_write(data, controller);
 842              		.loc 1 192 0
 843 0394 BB1D     		adds	r3, r7, #6
 844 0396 1A78     		ldrb	r2, [r3]
 845 0398 FB1D     		adds	r3, r7, #7
 846 039a 1B78     		ldrb	r3, [r3]
 847 039c 1100     		movs	r1, r2
 848 039e 1800     		movs	r0, r3
 849 03a0 FFF7FEFF 		bl	graphic_write
 193:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** }
 850              		.loc 1 193 0
 851 03a4 C046     		nop
 852 03a6 BD46     		mov	sp, r7
 853 03a8 02B0     		add	sp, sp, #8
 854              		@ sp needed
 855 03aa 80BD     		pop	{r7, pc}
 856              		.cfi_endproc
 857              	.LFE13:
 859              		.align	1
 860              		.global	graphic_read_data
 861              		.syntax unified
 862              		.code	16
 863              		.thumb_func
 864              		.fpu softvfp
 866              	graphic_read_data:
 867              	.LFB14:
 194:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 
 195:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** unsigned char graphic_read_data(unsigned char controller) {
 868              		.loc 1 195 0
 869              		.cfi_startproc
 870              		@ args = 0, pretend = 0, frame = 8
 871              		@ frame_needed = 1, uses_anonymous_args = 0
 872 03ac 80B5     		push	{r7, lr}
 873              		.cfi_def_cfa_offset 8
 874              		.cfi_offset 7, -8
 875              		.cfi_offset 14, -4
 876 03ae 82B0     		sub	sp, sp, #8
 877              		.cfi_def_cfa_offset 16
 878 03b0 00AF     		add	r7, sp, #0
 879              		.cfi_def_cfa_register 7
 880 03b2 0200     		movs	r2, r0
 881 03b4 FB1D     		adds	r3, r7, #7
 882 03b6 1A70     		strb	r2, [r3]
 196:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	(void) graphic_read(controller);
 883              		.loc 1 196 0
 884 03b8 FB1D     		adds	r3, r7, #7
 885 03ba 1B78     		ldrb	r3, [r3]
 886 03bc 1800     		movs	r0, r3
 887 03be FFF7FEFF 		bl	graphic_read
 197:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	return graphic_read(controller);
 888              		.loc 1 197 0
 889 03c2 FB1D     		adds	r3, r7, #7
 890 03c4 1B78     		ldrb	r3, [r3]
 891 03c6 1800     		movs	r0, r3
 892 03c8 FFF7FEFF 		bl	graphic_read
 893 03cc 0300     		movs	r3, r0
 198:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** }
 894              		.loc 1 198 0
 895 03ce 1800     		movs	r0, r3
 896 03d0 BD46     		mov	sp, r7
 897 03d2 02B0     		add	sp, sp, #8
 898              		@ sp needed
 899 03d4 80BD     		pop	{r7, pc}
 900              		.cfi_endproc
 901              	.LFE14:
 903              		.align	1
 904              		.global	graphic_initalize
 905              		.syntax unified
 906              		.code	16
 907              		.thumb_func
 908              		.fpu softvfp
 910              	graphic_initalize:
 911              	.LFB15:
 199:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 
 200:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** void graphic_initalize(void) {
 912              		.loc 1 200 0
 913              		.cfi_startproc
 914              		@ args = 0, pretend = 0, frame = 0
 915              		@ frame_needed = 1, uses_anonymous_args = 0
 916 03d6 80B5     		push	{r7, lr}
 917              		.cfi_def_cfa_offset 8
 918              		.cfi_offset 7, -8
 919              		.cfi_offset 14, -4
 920 03d8 00AF     		add	r7, sp, #0
 921              		.cfi_def_cfa_register 7
 201:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_ctrl_bit_set(B_E);
 922              		.loc 1 201 0
 923 03da 4020     		movs	r0, #64
 924 03dc FFF7FEFF 		bl	graphic_ctrl_bit_set
 202:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	delay_mikro(10);
 925              		.loc 1 202 0
 926 03e0 0A20     		movs	r0, #10
 927 03e2 FFF7FEFF 		bl	delay_mikro
 203:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_ctrl_bit_clear(B_CS1 | B_CS2 | B_RST | B_E);
 928              		.loc 1 203 0
 929 03e6 7820     		movs	r0, #120
 930 03e8 FFF7FEFF 		bl	graphic_ctrl_bit_clear
 204:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	delay_milli(30);
 931              		.loc 1 204 0
 932 03ec 1E20     		movs	r0, #30
 933 03ee FFF7FEFF 		bl	delay_milli
 205:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_ctrl_bit_set(B_RST);
 934              		.loc 1 205 0
 935 03f2 2020     		movs	r0, #32
 936 03f4 FFF7FEFF 		bl	graphic_ctrl_bit_set
 206:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_write_command(LCD_OFF, B_CS1 | B_CS2);
 937              		.loc 1 206 0
 938 03f8 1821     		movs	r1, #24
 939 03fa 3E20     		movs	r0, #62
 940 03fc FFF7FEFF 		bl	graphic_write_command
 207:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_write_command(LCD_ON, B_CS1 | B_CS2);
 941              		.loc 1 207 0
 942 0400 1821     		movs	r1, #24
 943 0402 3F20     		movs	r0, #63
 944 0404 FFF7FEFF 		bl	graphic_write_command
 208:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_write_command(LCD_DISP_START, B_CS1 | B_CS2);
 945              		.loc 1 208 0
 946 0408 1821     		movs	r1, #24
 947 040a C020     		movs	r0, #192
 948 040c FFF7FEFF 		bl	graphic_write_command
 209:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_write_command(LCD_SET_ADD, B_CS1 | B_CS2);
 949              		.loc 1 209 0
 950 0410 1821     		movs	r1, #24
 951 0412 4020     		movs	r0, #64
 952 0414 FFF7FEFF 		bl	graphic_write_command
 210:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_write_command(LCD_SET_PAGE, B_CS1 | B_CS2);
 953              		.loc 1 210 0
 954 0418 1821     		movs	r1, #24
 955 041a B820     		movs	r0, #184
 956 041c FFF7FEFF 		bl	graphic_write_command
 211:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	select_cotroller(0);
 957              		.loc 1 211 0
 958 0420 0020     		movs	r0, #0
 959 0422 FFF7FEFF 		bl	select_cotroller
 212:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** }
 960              		.loc 1 212 0
 961 0426 C046     		nop
 962 0428 BD46     		mov	sp, r7
 963              		@ sp needed
 964 042a 80BD     		pop	{r7, pc}
 965              		.cfi_endproc
 966              	.LFE15:
 968              		.align	1
 969              		.global	graphic_clear_screen
 970              		.syntax unified
 971              		.code	16
 972              		.thumb_func
 973              		.fpu softvfp
 975              	graphic_clear_screen:
 976              	.LFB16:
 213:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 
 214:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** void graphic_clear_screen(void) {
 977              		.loc 1 214 0
 978              		.cfi_startproc
 979              		@ args = 0, pretend = 0, frame = 8
 980              		@ frame_needed = 1, uses_anonymous_args = 0
 981 042c 80B5     		push	{r7, lr}
 982              		.cfi_def_cfa_offset 8
 983              		.cfi_offset 7, -8
 984              		.cfi_offset 14, -4
 985 042e 82B0     		sub	sp, sp, #8
 986              		.cfi_def_cfa_offset 16
 987 0430 00AF     		add	r7, sp, #0
 988              		.cfi_def_cfa_register 7
 989              	.LBB2:
 215:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	for(int page = 0; page < 7; page++) {
 990              		.loc 1 215 0
 991 0432 0023     		movs	r3, #0
 992 0434 7B60     		str	r3, [r7, #4]
 993 0436 1EE0     		b	.L48
 994              	.L51:
 216:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		graphic_write_command(LCD_SET_PAGE | page, B_CS1 | B_CS2);
 995              		.loc 1 216 0
 996 0438 7B68     		ldr	r3, [r7, #4]
 997 043a 5BB2     		sxtb	r3, r3
 998 043c 4822     		movs	r2, #72
 999 043e 5242     		rsbs	r2, r2, #0
 1000 0440 1343     		orrs	r3, r2
 1001 0442 5BB2     		sxtb	r3, r3
 1002 0444 DBB2     		uxtb	r3, r3
 1003 0446 1821     		movs	r1, #24
 1004 0448 1800     		movs	r0, r3
 1005 044a FFF7FEFF 		bl	graphic_write_command
 217:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		graphic_write_command(LCD_SET_ADD | 0, B_CS1 | B_CS2);
 1006              		.loc 1 217 0
 1007 044e 1821     		movs	r1, #24
 1008 0450 4020     		movs	r0, #64
 1009 0452 FFF7FEFF 		bl	graphic_write_command
 1010              	.LBB3:
 218:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		for(int add = 0; add < 63; add++) {
 1011              		.loc 1 218 0
 1012 0456 0023     		movs	r3, #0
 1013 0458 3B60     		str	r3, [r7]
 1014 045a 06E0     		b	.L49
 1015              	.L50:
 219:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 			graphic_write_data(0, B_CS1 | B_CS2);
 1016              		.loc 1 219 0 discriminator 3
 1017 045c 1821     		movs	r1, #24
 1018 045e 0020     		movs	r0, #0
 1019 0460 FFF7FEFF 		bl	graphic_write_data
 218:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		for(int add = 0; add < 63; add++) {
 1020              		.loc 1 218 0 discriminator 3
 1021 0464 3B68     		ldr	r3, [r7]
 1022 0466 0133     		adds	r3, r3, #1
 1023 0468 3B60     		str	r3, [r7]
 1024              	.L49:
 218:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		for(int add = 0; add < 63; add++) {
 1025              		.loc 1 218 0 is_stmt 0 discriminator 1
 1026 046a 3B68     		ldr	r3, [r7]
 1027 046c 3E2B     		cmp	r3, #62
 1028 046e F5DD     		ble	.L50
 1029              	.LBE3:
 215:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		graphic_write_command(LCD_SET_PAGE | page, B_CS1 | B_CS2);
 1030              		.loc 1 215 0 is_stmt 1 discriminator 2
 1031 0470 7B68     		ldr	r3, [r7, #4]
 1032 0472 0133     		adds	r3, r3, #1
 1033 0474 7B60     		str	r3, [r7, #4]
 1034              	.L48:
 215:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		graphic_write_command(LCD_SET_PAGE | page, B_CS1 | B_CS2);
 1035              		.loc 1 215 0 is_stmt 0 discriminator 1
 1036 0476 7B68     		ldr	r3, [r7, #4]
 1037 0478 062B     		cmp	r3, #6
 1038 047a DDDD     		ble	.L51
 1039              	.LBE2:
 220:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 		}
 221:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	}
 222:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** }
 1040              		.loc 1 222 0 is_stmt 1
 1041 047c C046     		nop
 1042 047e BD46     		mov	sp, r7
 1043 0480 02B0     		add	sp, sp, #8
 1044              		@ sp needed
 1045 0482 80BD     		pop	{r7, pc}
 1046              		.cfi_endproc
 1047              	.LFE16:
 1049              		.align	1
 1050              		.global	main
 1051              		.syntax unified
 1052              		.code	16
 1053              		.thumb_func
 1054              		.fpu softvfp
 1056              	main:
 1057              	.LFB17:
 223:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 
 224:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** void main(void) {
 1058              		.loc 1 224 0
 1059              		.cfi_startproc
 1060              		@ args = 0, pretend = 0, frame = 0
 1061              		@ frame_needed = 1, uses_anonymous_args = 0
 1062 0484 80B5     		push	{r7, lr}
 1063              		.cfi_def_cfa_offset 8
 1064              		.cfi_offset 7, -8
 1065              		.cfi_offset 14, -4
 1066 0486 00AF     		add	r7, sp, #0
 1067              		.cfi_def_cfa_register 7
 225:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	init_app();
 1068              		.loc 1 225 0
 1069 0488 FFF7FEFF 		bl	init_app
 226:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_initalize();
 1070              		.loc 1 226 0
 1071 048c FFF7FEFF 		bl	graphic_initalize
 227:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c ****   #ifndef SIMULATOR
 228:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_clear_screen();
 229:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c ****   #endif
 230:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_write_command(LCD_SET_ADD | 10, B_CS1 | B_CS2);
 1072              		.loc 1 230 0
 1073 0490 1821     		movs	r1, #24
 1074 0492 4A20     		movs	r0, #74
 1075 0494 FFF7FEFF 		bl	graphic_write_command
 231:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_write_command(LCD_SET_PAGE | 1, B_CS1 | B_CS2);
 1076              		.loc 1 231 0
 1077 0498 1821     		movs	r1, #24
 1078 049a B920     		movs	r0, #185
 1079 049c FFF7FEFF 		bl	graphic_write_command
 232:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	graphic_write(0xFF, B_CS1 | B_CS2);
 1080              		.loc 1 232 0
 1081 04a0 1821     		movs	r1, #24
 1082 04a2 FF20     		movs	r0, #255
 1083 04a4 FFF7FEFF 		bl	graphic_write
 233:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** 	
 234:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** //	char i = *GPIO_ODR_LOW;
 235:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** //	graphic_ctrl_bit_clear(0xFF);
 236:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** //	i = *GPIO_ODR_LOW;
 237:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** //	graphic_ctrl_bit_set(0x01);
 238:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** //	i = *GPIO_ODR_LOW;
 239:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** //	graphic_ctrl_bit_set(0x02);
 240:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** //	i = *GPIO_ODR_LOW;
 241:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** //	graphic_ctrl_bit_set(0x04);
 242:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** //	i = *GPIO_ODR_LOW;
 243:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** //	graphic_ctrl_bit_set(0x08);
 244:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** //	i = *GPIO_ODR_LOW;
 245:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** //	graphic_ctrl_bit_set(0x10);
 246:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** //	i = *GPIO_ODR_LOW;
 247:C:/Users/Hampus/Desktop/DAT017/CodeLite/graphicdisplay\startup.c **** }
 1084              		.loc 1 247 0
 1085 04a8 C046     		nop
 1086 04aa BD46     		mov	sp, r7
 1087              		@ sp needed
 1088 04ac 80BD     		pop	{r7, pc}
 1089              		.cfi_endproc
 1090              	.LFE17:
 1092              	.Letext0:
