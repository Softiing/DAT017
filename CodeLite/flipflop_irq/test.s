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
  25              		.file 1 "C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq/startup.c"
   1:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq\startup.c **** #define GPIO_E 0x40021000
   2:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq\startup.c **** #define GPIO_E_MODER ((volatile unsigned int *) (GPIO_E))
   3:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq\startup.c **** #define GPIO_E_OTYPER ((volatile unsigned short *) (GPIO_E+0x4))
   4:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq\startup.c **** #define GPIO_E_PUPDR ((volatile unsigned int *) (GPIO_E+0xC))
   5:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq\startup.c **** #define GPIO_E_IDR_LOW ((volatile unsigned char *) (GPIO_E+0x10))
   6:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq\startup.c **** #define GPIO_E_IDR_HIGH ((volatile unsigned char *) (GPIO_E+0x11))
   7:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq\startup.c **** #define GPIO_E_ODR_LOW ((volatile unsigned char *) (GPIO_E+0x14))
   8:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq\startup.c **** #define GPIO_E_ODR_HIGH ((volatile unsigned char *) (GPIO_E+0x15))
   9:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq\startup.c **** 
  10:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq\startup.c **** #define GPIO_D 0x40020C00
  11:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq\startup.c **** #define GPIO_D_MODER ((volatile unsigned int *) (GPIO_D))
  12:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq\startup.c **** #define GPIO_D_OTYPER ((volatile unsigned short *) (GPIO_D+0x4))
  13:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq\startup.c **** #define GPIO_D_PUPDR ((volatile unsigned int *) (GPIO_D+0xC))
  14:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq\startup.c **** #define GPIO_D_IDR_LOW ((volatile unsigned char *) (GPIO_D+0x10))
  15:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq\startup.c **** #define GPIO_D_IDR_HIGH ((volatile unsigned char *) (GPIO_D+0x11))
  16:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq\startup.c **** #define GPIO_D_ODR_LOW ((volatile unsigned char *) (GPIO_D+0x14))
  17:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq\startup.c **** #define GPIO_D_ODR_HIGH ((volatile unsigned char *) (GPIO_D+0x15))
  18:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq\startup.c **** 
  19:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq\startup.c **** #define SYSCFG 0x40013800
  20:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq\startup.c **** #define SYSCFG_MEMRMP ((volatile unsigned int*)(SYSCFG))
  21:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq\startup.c **** #define SYSCFG_PCM ((volatile unsigned int*)(SYSCFG + 0x04))
  22:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq\startup.c **** #define SYSCFG_EXTICR1 ((volatile unsigned int*)(SYSCFG + 0x08))
  23:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq\startup.c **** #define SYSCFG_EXTICR2 ((volatile unsigned int*)(SYSCFG + 0x0C))
  24:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq\startup.c **** #define SYSCFG_EXTICR3 ((volatile unsigned int*)(SYSCFG + 0x10))
  25:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq\startup.c **** #define SYSCFG_EXTICR4 ((volatile unsigned int*)(SYSCFG + 0x14))
  26:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq\startup.c **** #define SYSCFG_CMPCR ((volatile unsigned int*)(SYSCFG + 0x20))
  27:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq\startup.c **** 
  28:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq\startup.c **** #define EXTI 0x40013C00
  29:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq\startup.c **** #define EXTI_IMR ((volatile unsigned int*)(EXTI))
  30:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq\startup.c **** #define EXTI_EMR ((volatile unsigned int*)(EXTI + 0x04))
  31:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq\startup.c **** #define EXTI_RTSR ((volatile unsigned int*)(EXTI + 0x08))
  32:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq\startup.c **** #define EXTI_FTSR ((volatile unsigned int*)(EXTI + 0x0C))
  33:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq\startup.c **** #define EXTI_SWIER ((volatile unsigned int*)(EXTI + 0x10))
  34:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq\startup.c **** #define EXTI_PR ((volatile unsigned int*)(EXTI + 0x14))
  35:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq\startup.c **** 
  36:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq\startup.c **** 
  37:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq\startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
  38:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq\startup.c **** 
  39:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq\startup.c **** void startup ( void )
  40:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq\startup.c **** {
  26              		.loc 1 40 0
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
  41:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq\startup.c **** __asm volatile(
  31              		.loc 1 41 0
  32              		.syntax divided
  33              	@ 41 "C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq/startup.c" 1
  34 0000 0248     		 LDR R0,=0x2001C000
  35 0002 8546     	 MOV SP,R0
  36 0004 FFF7FEFF 	 BL main
  37 0008 FEE7     	_exit: B .
  38              	
  39              	@ 0 "" 2
  42:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq\startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  43:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq\startup.c **** 	" MOV SP,R0\n"
  44:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq\startup.c **** 	" BL main\n"				/* call main */
  45:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq\startup.c **** 	"_exit: B .\n"				/* never return */
  46:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq\startup.c **** 	) ;
  47:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq\startup.c **** }
  40              		.loc 1 47 0
  41              		.thumb
  42              		.syntax unified
  43 000a C046     		nop
  44              		.cfi_endproc
  45              	.LFE0:
  47              		.global	count
  48              		.bss
  49              		.align	2
  52              	count:
  53 0000 00000000 		.space	4
  54              		.text
  55              		.align	1
  56              		.global	interrupt_handler
  57              		.syntax unified
  58              		.code	16
  59              		.thumb_func
  60              		.fpu softvfp
  62              	interrupt_handler:
  63              	.LFB1:
  48:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq\startup.c **** 
  49:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq\startup.c **** 
  50:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq\startup.c **** volatile unsigned int count = 0;
  51:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq\startup.c **** void interrupt_handler(void) {
  64              		.loc 1 51 0
  65              		.cfi_startproc
  66              		@ args = 0, pretend = 0, frame = 0
  67              		@ frame_needed = 1, uses_anonymous_args = 0
  68 0000 80B5     		push	{r7, lr}
  69              		.cfi_def_cfa_offset 8
  70              		.cfi_offset 7, -8
  71              		.cfi_offset 14, -4
  72 0002 00AF     		add	r7, sp, #0
  73              		.cfi_def_cfa_register 7
  52:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq\startup.c **** 	count++;
  74              		.loc 1 52 0
  75 0004 064B     		ldr	r3, .L3
  76 0006 1B68     		ldr	r3, [r3]
  77 0008 5A1C     		adds	r2, r3, #1
  78 000a 054B     		ldr	r3, .L3
  79 000c 1A60     		str	r2, [r3]
  53:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq\startup.c **** 	*EXTI_PR |= 0x00000008;
  80              		.loc 1 53 0
  81 000e 054B     		ldr	r3, .L3+4
  82 0010 044A     		ldr	r2, .L3+4
  83 0012 1268     		ldr	r2, [r2]
  84 0014 0821     		movs	r1, #8
  85 0016 0A43     		orrs	r2, r1
  86 0018 1A60     		str	r2, [r3]
  54:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq\startup.c **** }
  87              		.loc 1 54 0
  88 001a C046     		nop
  89 001c BD46     		mov	sp, r7
  90              		@ sp needed
  91 001e 80BD     		pop	{r7, pc}
  92              	.L4:
  93              		.align	2
  94              	.L3:
  95 0020 00000000 		.word	count
  96 0024 143C0140 		.word	1073822740
  97              		.cfi_endproc
  98              	.LFE1:
 100              		.align	1
 101              		.global	init_app
 102              		.syntax unified
 103              		.code	16
 104              		.thumb_func
 105              		.fpu softvfp
 107              	init_app:
 108              	.LFB2:
  55:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq\startup.c **** 
  56:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq\startup.c **** void init_app(void) {
 109              		.loc 1 56 0
 110              		.cfi_startproc
 111              		@ args = 0, pretend = 0, frame = 0
 112              		@ frame_needed = 1, uses_anonymous_args = 0
 113 0028 80B5     		push	{r7, lr}
 114              		.cfi_def_cfa_offset 8
 115              		.cfi_offset 7, -8
 116              		.cfi_offset 14, -4
 117 002a 00AF     		add	r7, sp, #0
 118              		.cfi_def_cfa_register 7
  57:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq\startup.c **** 	// Setup hex display
  58:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq\startup.c **** 	*GPIO_D_MODER &= 0xFFFF0000;
 119              		.loc 1 58 0
 120 002c 1A4B     		ldr	r3, .L6
 121 002e 1A4A     		ldr	r2, .L6
 122 0030 1268     		ldr	r2, [r2]
 123 0032 120C     		lsrs	r2, r2, #16
 124 0034 1204     		lsls	r2, r2, #16
 125 0036 1A60     		str	r2, [r3]
  59:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq\startup.c **** 	*GPIO_D_MODER |= 0x00005555;
 126              		.loc 1 59 0
 127 0038 174B     		ldr	r3, .L6
 128 003a 174A     		ldr	r2, .L6
 129 003c 1268     		ldr	r2, [r2]
 130 003e 1749     		ldr	r1, .L6+4
 131 0040 0A43     		orrs	r2, r1
 132 0042 1A60     		str	r2, [r3]
  60:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq\startup.c **** 	
  61:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq\startup.c **** 	// Setup E as input
  62:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq\startup.c **** 	*GPIO_E_MODER = 0;
 133              		.loc 1 62 0
 134 0044 164B     		ldr	r3, .L6+8
 135 0046 0022     		movs	r2, #0
 136 0048 1A60     		str	r2, [r3]
  63:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq\startup.c **** 	
  64:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq\startup.c **** 	// Setup PE3 to EXTICR1
  65:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq\startup.c **** 	*SYSCFG_EXTICR1 &= 0xFFFF0FFF; 
 137              		.loc 1 65 0
 138 004a 164B     		ldr	r3, .L6+12
 139 004c 154A     		ldr	r2, .L6+12
 140 004e 1268     		ldr	r2, [r2]
 141 0050 1549     		ldr	r1, .L6+16
 142 0052 0A40     		ands	r2, r1
 143 0054 1A60     		str	r2, [r3]
  66:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq\startup.c **** 	*SYSCFG_EXTICR1 |= 0x00004000; 
 144              		.loc 1 66 0
 145 0056 134B     		ldr	r3, .L6+12
 146 0058 124A     		ldr	r2, .L6+12
 147 005a 1268     		ldr	r2, [r2]
 148 005c 8021     		movs	r1, #128
 149 005e C901     		lsls	r1, r1, #7
 150 0060 0A43     		orrs	r2, r1
 151 0062 1A60     		str	r2, [r3]
  67:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq\startup.c **** 	
  68:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq\startup.c **** 	// Setup EXTI for PE3
  69:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq\startup.c **** 	*EXTI_IMR |= 0x08;
 152              		.loc 1 69 0
 153 0064 114B     		ldr	r3, .L6+20
 154 0066 114A     		ldr	r2, .L6+20
 155 0068 1268     		ldr	r2, [r2]
 156 006a 0821     		movs	r1, #8
 157 006c 0A43     		orrs	r2, r1
 158 006e 1A60     		str	r2, [r3]
  70:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq\startup.c **** 	*EXTI_FTSR |= 0x08;
 159              		.loc 1 70 0
 160 0070 0F4B     		ldr	r3, .L6+24
 161 0072 0F4A     		ldr	r2, .L6+24
 162 0074 1268     		ldr	r2, [r2]
 163 0076 0821     		movs	r1, #8
 164 0078 0A43     		orrs	r2, r1
 165 007a 1A60     		str	r2, [r3]
  71:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq\startup.c **** 	
  72:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq\startup.c **** 	// Setup EXTI3 interrupt function
  73:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq\startup.c **** 	*((void (**)(void)) 0x2001C064) = interrupt_handler;
 166              		.loc 1 73 0
 167 007c 0D4B     		ldr	r3, .L6+28
 168 007e 0E4A     		ldr	r2, .L6+32
 169 0080 1A60     		str	r2, [r3]
  74:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq\startup.c **** 	
  75:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq\startup.c **** 	// Enable EXTI3 in NVIC
  76:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq\startup.c **** 	*((unsigned int *) 0xE000E100) |= (1<<9);
 170              		.loc 1 76 0
 171 0082 0E4B     		ldr	r3, .L6+36
 172 0084 0D4A     		ldr	r2, .L6+36
 173 0086 1268     		ldr	r2, [r2]
 174 0088 8021     		movs	r1, #128
 175 008a 8900     		lsls	r1, r1, #2
 176 008c 0A43     		orrs	r2, r1
 177 008e 1A60     		str	r2, [r3]
  77:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq\startup.c **** }
 178              		.loc 1 77 0
 179 0090 C046     		nop
 180 0092 BD46     		mov	sp, r7
 181              		@ sp needed
 182 0094 80BD     		pop	{r7, pc}
 183              	.L7:
 184 0096 C046     		.align	2
 185              	.L6:
 186 0098 000C0240 		.word	1073875968
 187 009c 55550000 		.word	21845
 188 00a0 00100240 		.word	1073876992
 189 00a4 08380140 		.word	1073821704
 190 00a8 FF0FFFFF 		.word	-61441
 191 00ac 003C0140 		.word	1073822720
 192 00b0 0C3C0140 		.word	1073822732
 193 00b4 64C00120 		.word	536985700
 194 00b8 00000000 		.word	interrupt_handler
 195 00bc 00E100E0 		.word	-536813312
 196              		.cfi_endproc
 197              	.LFE2:
 199              		.align	1
 200              		.global	main
 201              		.syntax unified
 202              		.code	16
 203              		.thumb_func
 204              		.fpu softvfp
 206              	main:
 207              	.LFB3:
  78:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq\startup.c ****  
  79:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq\startup.c **** void main(void) {
 208              		.loc 1 79 0
 209              		.cfi_startproc
 210              		@ args = 0, pretend = 0, frame = 0
 211              		@ frame_needed = 1, uses_anonymous_args = 0
 212 00c0 80B5     		push	{r7, lr}
 213              		.cfi_def_cfa_offset 8
 214              		.cfi_offset 7, -8
 215              		.cfi_offset 14, -4
 216 00c2 00AF     		add	r7, sp, #0
 217              		.cfi_def_cfa_register 7
  80:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq\startup.c **** 	init_app();
 218              		.loc 1 80 0
 219 00c4 FFF7FEFF 		bl	init_app
 220              	.L9:
  81:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq\startup.c **** 	while(1) {
  82:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq\startup.c **** 		*GPIO_D_ODR_LOW = count;
 221              		.loc 1 82 0 discriminator 1
 222 00c8 024A     		ldr	r2, .L10
 223 00ca 034B     		ldr	r3, .L10+4
 224 00cc 1B68     		ldr	r3, [r3]
 225 00ce DBB2     		uxtb	r3, r3
 226 00d0 1370     		strb	r3, [r2]
 227 00d2 F9E7     		b	.L9
 228              	.L11:
 229              		.align	2
 230              	.L10:
 231 00d4 140C0240 		.word	1073875988
 232 00d8 00000000 		.word	count
 233              		.cfi_endproc
 234              	.LFE3:
 236              	.Letext0:
