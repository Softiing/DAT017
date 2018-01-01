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
  25              		.file 1 "C:/Users/Hampus/Desktop/DAT017/CodeLite/systick_irq/startup.c"
   1:C:/Users/Hampus/Desktop/DAT017/CodeLite/systick_irq\startup.c **** /*
   2:C:/Users/Hampus/Desktop/DAT017/CodeLite/systick_irq\startup.c ****  * 	startup.c
   3:C:/Users/Hampus/Desktop/DAT017/CodeLite/systick_irq\startup.c ****  *
   4:C:/Users/Hampus/Desktop/DAT017/CodeLite/systick_irq\startup.c ****  */
   5:C:/Users/Hampus/Desktop/DAT017/CodeLite/systick_irq\startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
   6:C:/Users/Hampus/Desktop/DAT017/CodeLite/systick_irq\startup.c **** 
   7:C:/Users/Hampus/Desktop/DAT017/CodeLite/systick_irq\startup.c **** void startup ( void )
   8:C:/Users/Hampus/Desktop/DAT017/CodeLite/systick_irq\startup.c **** {
  26              		.loc 1 8 0
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
   9:C:/Users/Hampus/Desktop/DAT017/CodeLite/systick_irq\startup.c **** __asm volatile(
  31              		.loc 1 9 0
  32              		.syntax divided
  33              	@ 9 "C:/Users/Hampus/Desktop/DAT017/CodeLite/systick_irq/startup.c" 1
  34 0000 0248     		 LDR R0,=0x2001C000
  35 0002 8546     	 MOV SP,R0
  36 0004 FFF7FEFF 	 BL main
  37 0008 FEE7     	_exit: B .
  38              	
  39              	@ 0 "" 2
  10:C:/Users/Hampus/Desktop/DAT017/CodeLite/systick_irq\startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  11:C:/Users/Hampus/Desktop/DAT017/CodeLite/systick_irq\startup.c **** 	" MOV SP,R0\n"
  12:C:/Users/Hampus/Desktop/DAT017/CodeLite/systick_irq\startup.c **** 	" BL main\n"				/* call main */
  13:C:/Users/Hampus/Desktop/DAT017/CodeLite/systick_irq\startup.c **** 	"_exit: B .\n"				/* never return */
  14:C:/Users/Hampus/Desktop/DAT017/CodeLite/systick_irq\startup.c **** 	) ;
  15:C:/Users/Hampus/Desktop/DAT017/CodeLite/systick_irq\startup.c **** }
  40              		.loc 1 15 0
  41              		.thumb
  42              		.syntax unified
  43 000a C046     		nop
  44              		.cfi_endproc
  45              	.LFE0:
  47              		.global	flag
  48              		.bss
  51              	flag:
  52 0000 00       		.space	1
  53              		.text
  54              		.align	1
  55              		.global	systick_irq_handler
  56              		.syntax unified
  57              		.code	16
  58              		.thumb_func
  59              		.fpu softvfp
  61              	systick_irq_handler:
  62              	.LFB1:
  16:C:/Users/Hampus/Desktop/DAT017/CodeLite/systick_irq\startup.c **** 
  17:C:/Users/Hampus/Desktop/DAT017/CodeLite/systick_irq\startup.c **** typedef struct {
  18:C:/Users/Hampus/Desktop/DAT017/CodeLite/systick_irq\startup.c **** 	volatile unsigned int ctrl;
  19:C:/Users/Hampus/Desktop/DAT017/CodeLite/systick_irq\startup.c **** 	volatile unsigned int load;
  20:C:/Users/Hampus/Desktop/DAT017/CodeLite/systick_irq\startup.c **** 	volatile unsigned int val;
  21:C:/Users/Hampus/Desktop/DAT017/CodeLite/systick_irq\startup.c **** } SysTick;
  22:C:/Users/Hampus/Desktop/DAT017/CodeLite/systick_irq\startup.c **** 
  23:C:/Users/Hampus/Desktop/DAT017/CodeLite/systick_irq\startup.c **** typedef struct {
  24:C:/Users/Hampus/Desktop/DAT017/CodeLite/systick_irq\startup.c **** 	volatile unsigned int moder;
  25:C:/Users/Hampus/Desktop/DAT017/CodeLite/systick_irq\startup.c **** 	volatile unsigned int ostyper;
  26:C:/Users/Hampus/Desktop/DAT017/CodeLite/systick_irq\startup.c **** 	volatile unsigned int ospeedr;
  27:C:/Users/Hampus/Desktop/DAT017/CodeLite/systick_irq\startup.c **** 	volatile unsigned int pupdr;
  28:C:/Users/Hampus/Desktop/DAT017/CodeLite/systick_irq\startup.c **** 	volatile unsigned short idr_low;
  29:C:/Users/Hampus/Desktop/DAT017/CodeLite/systick_irq\startup.c **** 	volatile unsigned short idr_high;
  30:C:/Users/Hampus/Desktop/DAT017/CodeLite/systick_irq\startup.c **** 	volatile unsigned short odr_low;
  31:C:/Users/Hampus/Desktop/DAT017/CodeLite/systick_irq\startup.c **** 	volatile unsigned short odr_high;
  32:C:/Users/Hampus/Desktop/DAT017/CodeLite/systick_irq\startup.c **** 
  33:C:/Users/Hampus/Desktop/DAT017/CodeLite/systick_irq\startup.c **** } GPIO;
  34:C:/Users/Hampus/Desktop/DAT017/CodeLite/systick_irq\startup.c **** 
  35:C:/Users/Hampus/Desktop/DAT017/CodeLite/systick_irq\startup.c **** // Define systick & port D
  36:C:/Users/Hampus/Desktop/DAT017/CodeLite/systick_irq\startup.c **** #define STK ((SysTick*) 0xE000E010)
  37:C:/Users/Hampus/Desktop/DAT017/CodeLite/systick_irq\startup.c **** #define portD ((GPIO*) 0x40020C00)
  38:C:/Users/Hampus/Desktop/DAT017/CodeLite/systick_irq\startup.c **** 
  39:C:/Users/Hampus/Desktop/DAT017/CodeLite/systick_irq\startup.c **** unsigned char flag = 0;
  40:C:/Users/Hampus/Desktop/DAT017/CodeLite/systick_irq\startup.c **** 
  41:C:/Users/Hampus/Desktop/DAT017/CodeLite/systick_irq\startup.c **** void systick_irq_handler() {
  63              		.loc 1 41 0
  64              		.cfi_startproc
  65              		@ args = 0, pretend = 0, frame = 0
  66              		@ frame_needed = 1, uses_anonymous_args = 0
  67 0000 80B5     		push	{r7, lr}
  68              		.cfi_def_cfa_offset 8
  69              		.cfi_offset 7, -8
  70              		.cfi_offset 14, -4
  71 0002 00AF     		add	r7, sp, #0
  72              		.cfi_def_cfa_register 7
  42:C:/Users/Hampus/Desktop/DAT017/CodeLite/systick_irq\startup.c **** 	flag = 1;
  73              		.loc 1 42 0
  74 0004 054B     		ldr	r3, .L3
  75 0006 0122     		movs	r2, #1
  76 0008 1A70     		strb	r2, [r3]
  43:C:/Users/Hampus/Desktop/DAT017/CodeLite/systick_irq\startup.c **** 	STK->ctrl &= ~1;
  77              		.loc 1 43 0
  78 000a 054B     		ldr	r3, .L3+4
  79 000c 044A     		ldr	r2, .L3+4
  80 000e 1268     		ldr	r2, [r2]
  81 0010 0121     		movs	r1, #1
  82 0012 8A43     		bics	r2, r1
  83 0014 1A60     		str	r2, [r3]
  44:C:/Users/Hampus/Desktop/DAT017/CodeLite/systick_irq\startup.c **** }
  84              		.loc 1 44 0
  85 0016 C046     		nop
  86 0018 BD46     		mov	sp, r7
  87              		@ sp needed
  88 001a 80BD     		pop	{r7, pc}
  89              	.L4:
  90              		.align	2
  91              	.L3:
  92 001c 00000000 		.word	flag
  93 0020 10E000E0 		.word	-536813552
  94              		.cfi_endproc
  95              	.LFE1:
  97              		.align	1
  98              		.global	init
  99              		.syntax unified
 100              		.code	16
 101              		.thumb_func
 102              		.fpu softvfp
 104              	init:
 105              	.LFB2:
  45:C:/Users/Hampus/Desktop/DAT017/CodeLite/systick_irq\startup.c **** 
  46:C:/Users/Hampus/Desktop/DAT017/CodeLite/systick_irq\startup.c **** void init() {
 106              		.loc 1 46 0
 107              		.cfi_startproc
 108              		@ args = 0, pretend = 0, frame = 0
 109              		@ frame_needed = 1, uses_anonymous_args = 0
 110 0024 80B5     		push	{r7, lr}
 111              		.cfi_def_cfa_offset 8
 112              		.cfi_offset 7, -8
 113              		.cfi_offset 14, -4
 114 0026 00AF     		add	r7, sp, #0
 115              		.cfi_def_cfa_register 7
  47:C:/Users/Hampus/Desktop/DAT017/CodeLite/systick_irq\startup.c **** 	portD->moder = 0x55555555;
 116              		.loc 1 47 0
 117 0028 044B     		ldr	r3, .L6
 118 002a 054A     		ldr	r2, .L6+4
 119 002c 1A60     		str	r2, [r3]
  48:C:/Users/Hampus/Desktop/DAT017/CodeLite/systick_irq\startup.c **** 	*((void (**) (void)) 0x2001C03C) = systick_irq_handler;
 120              		.loc 1 48 0
 121 002e 054B     		ldr	r3, .L6+8
 122 0030 054A     		ldr	r2, .L6+12
 123 0032 1A60     		str	r2, [r3]
  49:C:/Users/Hampus/Desktop/DAT017/CodeLite/systick_irq\startup.c **** }
 124              		.loc 1 49 0
 125 0034 C046     		nop
 126 0036 BD46     		mov	sp, r7
 127              		@ sp needed
 128 0038 80BD     		pop	{r7, pc}
 129              	.L7:
 130 003a C046     		.align	2
 131              	.L6:
 132 003c 000C0240 		.word	1073875968
 133 0040 55555555 		.word	1431655765
 134 0044 3CC00120 		.word	536985660
 135 0048 00000000 		.word	systick_irq_handler
 136              		.cfi_endproc
 137              	.LFE2:
 139              		.align	1
 140              		.global	delay
 141              		.syntax unified
 142              		.code	16
 143              		.thumb_func
 144              		.fpu softvfp
 146              	delay:
 147              	.LFB3:
  50:C:/Users/Hampus/Desktop/DAT017/CodeLite/systick_irq\startup.c **** 
  51:C:/Users/Hampus/Desktop/DAT017/CodeLite/systick_irq\startup.c **** void delay(unsigned int count) {
 148              		.loc 1 51 0
 149              		.cfi_startproc
 150              		@ args = 0, pretend = 0, frame = 8
 151              		@ frame_needed = 1, uses_anonymous_args = 0
 152 004c 80B5     		push	{r7, lr}
 153              		.cfi_def_cfa_offset 8
 154              		.cfi_offset 7, -8
 155              		.cfi_offset 14, -4
 156 004e 82B0     		sub	sp, sp, #8
 157              		.cfi_def_cfa_offset 16
 158 0050 00AF     		add	r7, sp, #0
 159              		.cfi_def_cfa_register 7
 160 0052 7860     		str	r0, [r7, #4]
  52:C:/Users/Hampus/Desktop/DAT017/CodeLite/systick_irq\startup.c **** 	STK->ctrl &= ~1;
 161              		.loc 1 52 0
 162 0054 104B     		ldr	r3, .L9
 163 0056 104A     		ldr	r2, .L9
 164 0058 1268     		ldr	r2, [r2]
 165 005a 0121     		movs	r1, #1
 166 005c 8A43     		bics	r2, r1
 167 005e 1A60     		str	r2, [r3]
  53:C:/Users/Hampus/Desktop/DAT017/CodeLite/systick_irq\startup.c **** 	STK->val = 0;
 168              		.loc 1 53 0
 169 0060 0D4B     		ldr	r3, .L9
 170 0062 0022     		movs	r2, #0
 171 0064 9A60     		str	r2, [r3, #8]
  54:C:/Users/Hampus/Desktop/DAT017/CodeLite/systick_irq\startup.c **** 	STK->load = 41 * count; //168*10^6 * 250 * 10^-9 = 168 * 250 * 10^-3 = 42
 172              		.loc 1 54 0
 173 0066 0C49     		ldr	r1, .L9
 174 0068 7A68     		ldr	r2, [r7, #4]
 175 006a 1300     		movs	r3, r2
 176 006c 9B00     		lsls	r3, r3, #2
 177 006e 9B18     		adds	r3, r3, r2
 178 0070 DB00     		lsls	r3, r3, #3
 179 0072 9B18     		adds	r3, r3, r2
 180 0074 4B60     		str	r3, [r1, #4]
  55:C:/Users/Hampus/Desktop/DAT017/CodeLite/systick_irq\startup.c **** 	STK->ctrl |= (1<<1);
 181              		.loc 1 55 0
 182 0076 084B     		ldr	r3, .L9
 183 0078 074A     		ldr	r2, .L9
 184 007a 1268     		ldr	r2, [r2]
 185 007c 0221     		movs	r1, #2
 186 007e 0A43     		orrs	r2, r1
 187 0080 1A60     		str	r2, [r3]
  56:C:/Users/Hampus/Desktop/DAT017/CodeLite/systick_irq\startup.c **** 	STK->ctrl |= 1;	
 188              		.loc 1 56 0
 189 0082 054B     		ldr	r3, .L9
 190 0084 044A     		ldr	r2, .L9
 191 0086 1268     		ldr	r2, [r2]
 192 0088 0121     		movs	r1, #1
 193 008a 0A43     		orrs	r2, r1
 194 008c 1A60     		str	r2, [r3]
  57:C:/Users/Hampus/Desktop/DAT017/CodeLite/systick_irq\startup.c **** }
 195              		.loc 1 57 0
 196 008e C046     		nop
 197 0090 BD46     		mov	sp, r7
 198 0092 02B0     		add	sp, sp, #8
 199              		@ sp needed
 200 0094 80BD     		pop	{r7, pc}
 201              	.L10:
 202 0096 C046     		.align	2
 203              	.L9:
 204 0098 10E000E0 		.word	-536813552
 205              		.cfi_endproc
 206              	.LFE3:
 208              		.align	1
 209              		.global	main
 210              		.syntax unified
 211              		.code	16
 212              		.thumb_func
 213              		.fpu softvfp
 215              	main:
 216              	.LFB4:
  58:C:/Users/Hampus/Desktop/DAT017/CodeLite/systick_irq\startup.c **** 
  59:C:/Users/Hampus/Desktop/DAT017/CodeLite/systick_irq\startup.c **** void main(void) {
 217              		.loc 1 59 0
 218              		.cfi_startproc
 219              		@ args = 0, pretend = 0, frame = 0
 220              		@ frame_needed = 1, uses_anonymous_args = 0
 221 009c 80B5     		push	{r7, lr}
 222              		.cfi_def_cfa_offset 8
 223              		.cfi_offset 7, -8
 224              		.cfi_offset 14, -4
 225 009e 00AF     		add	r7, sp, #0
 226              		.cfi_def_cfa_register 7
  60:C:/Users/Hampus/Desktop/DAT017/CodeLite/systick_irq\startup.c **** 	init();
 227              		.loc 1 60 0
 228 00a0 FFF7FEFF 		bl	init
  61:C:/Users/Hampus/Desktop/DAT017/CodeLite/systick_irq\startup.c **** 	portD->odr_low = 0;
 229              		.loc 1 61 0
 230 00a4 0D4B     		ldr	r3, .L14
 231 00a6 0022     		movs	r2, #0
 232 00a8 9A82     		strh	r2, [r3, #20]
  62:C:/Users/Hampus/Desktop/DAT017/CodeLite/systick_irq\startup.c **** 	delay(8000);
 233              		.loc 1 62 0
 234 00aa FA23     		movs	r3, #250
 235 00ac 5B01     		lsls	r3, r3, #5
 236 00ae 1800     		movs	r0, r3
 237 00b0 FFF7FEFF 		bl	delay
 238              	.L13:
  63:C:/Users/Hampus/Desktop/DAT017/CodeLite/systick_irq\startup.c **** 	while(1) {
  64:C:/Users/Hampus/Desktop/DAT017/CodeLite/systick_irq\startup.c **** 		if(flag) {
 239              		.loc 1 64 0
 240 00b4 0A4B     		ldr	r3, .L14+4
 241 00b6 1B78     		ldrb	r3, [r3]
 242 00b8 002B     		cmp	r3, #0
 243 00ba FBD0     		beq	.L13
  65:C:/Users/Hampus/Desktop/DAT017/CodeLite/systick_irq\startup.c **** 			portD->odr_low = ~portD->odr_low; 
 244              		.loc 1 65 0
 245 00bc 074A     		ldr	r2, .L14
 246 00be 074B     		ldr	r3, .L14
 247 00c0 9B8A     		ldrh	r3, [r3, #20]
 248 00c2 9BB2     		uxth	r3, r3
 249 00c4 DB43     		mvns	r3, r3
 250 00c6 9BB2     		uxth	r3, r3
 251 00c8 9382     		strh	r3, [r2, #20]
  66:C:/Users/Hampus/Desktop/DAT017/CodeLite/systick_irq\startup.c **** 			flag = 0;
 252              		.loc 1 66 0
 253 00ca 054B     		ldr	r3, .L14+4
 254 00cc 0022     		movs	r2, #0
 255 00ce 1A70     		strb	r2, [r3]
  67:C:/Users/Hampus/Desktop/DAT017/CodeLite/systick_irq\startup.c **** 			delay(8000);
 256              		.loc 1 67 0
 257 00d0 FA23     		movs	r3, #250
 258 00d2 5B01     		lsls	r3, r3, #5
 259 00d4 1800     		movs	r0, r3
 260 00d6 FFF7FEFF 		bl	delay
  64:C:/Users/Hampus/Desktop/DAT017/CodeLite/systick_irq\startup.c **** 			portD->odr_low = ~portD->odr_low; 
 261              		.loc 1 64 0
 262 00da EBE7     		b	.L13
 263              	.L15:
 264              		.align	2
 265              	.L14:
 266 00dc 000C0240 		.word	1073875968
 267 00e0 00000000 		.word	flag
 268              		.cfi_endproc
 269              	.LFE4:
 271              	.Letext0:
