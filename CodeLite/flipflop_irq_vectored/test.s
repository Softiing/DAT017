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
  25              		.file 1 "C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored/startup.c"
   1:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** #define GPIO_E 0x40021000
   2:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** #define GPIO_E_MODER ((volatile unsigned int *) (GPIO_E))
   3:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** #define GPIO_E_OTYPER ((volatile unsigned short *) (GPIO_E+0x4))
   4:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** #define GPIO_E_PUPDR ((volatile unsigned int *) (GPIO_E+0xC))
   5:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** #define GPIO_E_IDR_LOW ((volatile unsigned char *) (GPIO_E+0x10))
   6:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** #define GPIO_E_IDR_HIGH ((volatile unsigned char *) (GPIO_E+0x11))
   7:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** #define GPIO_E_ODR_LOW ((volatile unsigned char *) (GPIO_E+0x14))
   8:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** #define GPIO_E_ODR_HIGH ((volatile unsigned char *) (GPIO_E+0x15))
   9:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** 
  10:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** #define GPIO_D 0x40020C00
  11:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** #define GPIO_D_MODER ((volatile unsigned int *) (GPIO_D))
  12:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** #define GPIO_D_OTYPER ((volatile unsigned short *) (GPIO_D+0x4))
  13:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** #define GPIO_D_PUPDR ((volatile unsigned int *) (GPIO_D+0xC))
  14:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** #define GPIO_D_IDR_LOW ((volatile unsigned char *) (GPIO_D+0x10))
  15:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** #define GPIO_D_IDR_HIGH ((volatile unsigned char *) (GPIO_D+0x11))
  16:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** #define GPIO_D_ODR_LOW ((volatile unsigned char *) (GPIO_D+0x14))
  17:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** #define GPIO_D_ODR_HIGH ((volatile unsigned char *) (GPIO_D+0x15))
  18:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** 
  19:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** #define SYSCFG 0x40013800
  20:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** #define SYSCFG_MEMRMP ((volatile unsigned int*)(SYSCFG))
  21:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** #define SYSCFG_PCM ((volatile unsigned int*)(SYSCFG + 0x04))
  22:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** #define SYSCFG_EXTICR1 ((volatile unsigned int*)(SYSCFG + 0x08))
  23:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** #define SYSCFG_EXTICR2 ((volatile unsigned int*)(SYSCFG + 0x0C))
  24:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** #define SYSCFG_EXTICR3 ((volatile unsigned int*)(SYSCFG + 0x10))
  25:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** #define SYSCFG_EXTICR4 ((volatile unsigned int*)(SYSCFG + 0x14))
  26:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** #define SYSCFG_CMPCR ((volatile unsigned int*)(SYSCFG + 0x20))
  27:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** 
  28:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** #define EXTI 0x40013C00
  29:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** #define EXTI_IMR ((volatile unsigned int*)(EXTI))
  30:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** #define EXTI_EMR ((volatile unsigned int*)(EXTI + 0x04))
  31:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** #define EXTI_RTSR ((volatile unsigned int*)(EXTI + 0x08))
  32:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** #define EXTI_FTSR ((volatile unsigned int*)(EXTI + 0x0C))
  33:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** #define EXTI_SWIER ((volatile unsigned int*)(EXTI + 0x10))
  34:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** #define EXTI_PR ((volatile unsigned int*)(EXTI + 0x14))
  35:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** 
  36:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** #define EXTI3_IRQVEC ((void (**) (void)) 0x2001C064)
  37:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** #define EXTI2_IRQVEC ((void (**) (void)) 0x2001C060)
  38:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** #define EXTI1_IRQVEC ((void (**) (void)) 0x2001C05C)
  39:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** #define EXTI0_IRQVEC ((void (**) (void)) 0x2001C058)
  40:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** 
  41:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** #define NVIC_ISER0 ((volatile unsigned int *) 0xE000E100)
  42:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** #define NVIC_EXTI3_IRQ_BPOS (1<<9)
  43:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** #define NVIC_EXTI2_IRQ_BPOS (1<<8)
  44:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** #define NVIC_EXTI1_IRQ_BPOS (1<<7)
  45:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** #define NVIC_EXTI0_IRQ_BPOS (1<<6)
  46:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** 
  47:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** #define EXTI3_IRQ_BPOS (1<<3)
  48:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** #define EXTI2_IRQ_BPOS (1<<2)
  49:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** #define EXTI1_IRQ_BPOS (1<<1)
  50:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** #define EXTI0_IRQ_BPOS (1<<0)
  51:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** 
  52:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** 
  53:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
  54:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** 
  55:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** void startup ( void )
  56:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** {
  26              		.loc 1 56 0
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
  57:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** __asm volatile(
  31              		.loc 1 57 0
  32              		.syntax divided
  33              	@ 57 "C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored/startup.c" 1
  34 0000 0248     		 LDR R0,=0x2001C000
  35 0002 8546     	 MOV SP,R0
  36 0004 FFF7FEFF 	 BL main
  37 0008 FEE7     	_exit: B .
  38              	
  39              	@ 0 "" 2
  58:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  59:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** 	" MOV SP,R0\n"
  60:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** 	" BL main\n"				/* call main */
  61:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** 	"_exit: B .\n"				/* never return */
  62:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** 	) ;
  63:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** }
  40              		.loc 1 63 0
  41              		.thumb
  42              		.syntax unified
  43 000a C046     		nop
  44              		.cfi_endproc
  45              	.LFE0:
  47              		.global	count
  48              		.bss
  51              	count:
  52 0000 00       		.space	1
  53              		.text
  54              		.align	1
  55              		.global	irq_0
  56              		.syntax unified
  57              		.code	16
  58              		.thumb_func
  59              		.fpu softvfp
  61              	irq_0:
  62              	.LFB1:
  64:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** 
  65:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** 
  66:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** volatile unsigned char count = 0;
  67:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** 
  68:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** void irq_0(void) {
  63              		.loc 1 68 0
  64              		.cfi_startproc
  65              		@ args = 0, pretend = 0, frame = 0
  66              		@ frame_needed = 1, uses_anonymous_args = 0
  67 0000 80B5     		push	{r7, lr}
  68              		.cfi_def_cfa_offset 8
  69              		.cfi_offset 7, -8
  70              		.cfi_offset 14, -4
  71 0002 00AF     		add	r7, sp, #0
  72              		.cfi_def_cfa_register 7
  69:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** 	count++;
  73              		.loc 1 69 0
  74 0004 074B     		ldr	r3, .L3
  75 0006 1B78     		ldrb	r3, [r3]
  76 0008 DBB2     		uxtb	r3, r3
  77 000a 0133     		adds	r3, r3, #1
  78 000c DAB2     		uxtb	r2, r3
  79 000e 054B     		ldr	r3, .L3
  80 0010 1A70     		strb	r2, [r3]
  70:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** 	*EXTI_PR |= EXTI0_IRQ_BPOS;
  81              		.loc 1 70 0
  82 0012 054B     		ldr	r3, .L3+4
  83 0014 044A     		ldr	r2, .L3+4
  84 0016 1268     		ldr	r2, [r2]
  85 0018 0121     		movs	r1, #1
  86 001a 0A43     		orrs	r2, r1
  87 001c 1A60     		str	r2, [r3]
  71:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** }
  88              		.loc 1 71 0
  89 001e C046     		nop
  90 0020 BD46     		mov	sp, r7
  91              		@ sp needed
  92 0022 80BD     		pop	{r7, pc}
  93              	.L4:
  94              		.align	2
  95              	.L3:
  96 0024 00000000 		.word	count
  97 0028 143C0140 		.word	1073822740
  98              		.cfi_endproc
  99              	.LFE1:
 101              		.align	1
 102              		.global	irq_1
 103              		.syntax unified
 104              		.code	16
 105              		.thumb_func
 106              		.fpu softvfp
 108              	irq_1:
 109              	.LFB2:
  72:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** void irq_1(void) {
 110              		.loc 1 72 0
 111              		.cfi_startproc
 112              		@ args = 0, pretend = 0, frame = 0
 113              		@ frame_needed = 1, uses_anonymous_args = 0
 114 002c 80B5     		push	{r7, lr}
 115              		.cfi_def_cfa_offset 8
 116              		.cfi_offset 7, -8
 117              		.cfi_offset 14, -4
 118 002e 00AF     		add	r7, sp, #0
 119              		.cfi_def_cfa_register 7
  73:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** 	count = 0;
 120              		.loc 1 73 0
 121 0030 054B     		ldr	r3, .L6
 122 0032 0022     		movs	r2, #0
 123 0034 1A70     		strb	r2, [r3]
  74:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** 	*EXTI_PR |= EXTI1_IRQ_BPOS;
 124              		.loc 1 74 0
 125 0036 054B     		ldr	r3, .L6+4
 126 0038 044A     		ldr	r2, .L6+4
 127 003a 1268     		ldr	r2, [r2]
 128 003c 0221     		movs	r1, #2
 129 003e 0A43     		orrs	r2, r1
 130 0040 1A60     		str	r2, [r3]
  75:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** }
 131              		.loc 1 75 0
 132 0042 C046     		nop
 133 0044 BD46     		mov	sp, r7
 134              		@ sp needed
 135 0046 80BD     		pop	{r7, pc}
 136              	.L7:
 137              		.align	2
 138              	.L6:
 139 0048 00000000 		.word	count
 140 004c 143C0140 		.word	1073822740
 141              		.cfi_endproc
 142              	.LFE2:
 144              		.align	1
 145              		.global	irq_2
 146              		.syntax unified
 147              		.code	16
 148              		.thumb_func
 149              		.fpu softvfp
 151              	irq_2:
 152              	.LFB3:
  76:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** void irq_2(void) {
 153              		.loc 1 76 0
 154              		.cfi_startproc
 155              		@ args = 0, pretend = 0, frame = 0
 156              		@ frame_needed = 1, uses_anonymous_args = 0
 157 0050 80B5     		push	{r7, lr}
 158              		.cfi_def_cfa_offset 8
 159              		.cfi_offset 7, -8
 160              		.cfi_offset 14, -4
 161 0052 00AF     		add	r7, sp, #0
 162              		.cfi_def_cfa_register 7
  77:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** 	count = ~count;
 163              		.loc 1 77 0
 164 0054 074B     		ldr	r3, .L9
 165 0056 1B78     		ldrb	r3, [r3]
 166 0058 DBB2     		uxtb	r3, r3
 167 005a DB43     		mvns	r3, r3
 168 005c DAB2     		uxtb	r2, r3
 169 005e 054B     		ldr	r3, .L9
 170 0060 1A70     		strb	r2, [r3]
  78:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** 	*EXTI_PR |= EXTI2_IRQ_BPOS;
 171              		.loc 1 78 0
 172 0062 054B     		ldr	r3, .L9+4
 173 0064 044A     		ldr	r2, .L9+4
 174 0066 1268     		ldr	r2, [r2]
 175 0068 0421     		movs	r1, #4
 176 006a 0A43     		orrs	r2, r1
 177 006c 1A60     		str	r2, [r3]
  79:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** }
 178              		.loc 1 79 0
 179 006e C046     		nop
 180 0070 BD46     		mov	sp, r7
 181              		@ sp needed
 182 0072 80BD     		pop	{r7, pc}
 183              	.L10:
 184              		.align	2
 185              	.L9:
 186 0074 00000000 		.word	count
 187 0078 143C0140 		.word	1073822740
 188              		.cfi_endproc
 189              	.LFE3:
 191              		.align	1
 192              		.global	init_app
 193              		.syntax unified
 194              		.code	16
 195              		.thumb_func
 196              		.fpu softvfp
 198              	init_app:
 199              	.LFB4:
  80:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** void init_app(void) {
 200              		.loc 1 80 0
 201              		.cfi_startproc
 202              		@ args = 0, pretend = 0, frame = 0
 203              		@ frame_needed = 1, uses_anonymous_args = 0
 204 007c 80B5     		push	{r7, lr}
 205              		.cfi_def_cfa_offset 8
 206              		.cfi_offset 7, -8
 207              		.cfi_offset 14, -4
 208 007e 00AF     		add	r7, sp, #0
 209              		.cfi_def_cfa_register 7
  81:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** 	// Setup hex display
  82:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** 	*GPIO_D_MODER &= 0xFFFF0000;
 210              		.loc 1 82 0
 211 0080 224B     		ldr	r3, .L12
 212 0082 224A     		ldr	r2, .L12
 213 0084 1268     		ldr	r2, [r2]
 214 0086 120C     		lsrs	r2, r2, #16
 215 0088 1204     		lsls	r2, r2, #16
 216 008a 1A60     		str	r2, [r3]
  83:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** 	*GPIO_D_MODER |= 0x00005555;
 217              		.loc 1 83 0
 218 008c 1F4B     		ldr	r3, .L12
 219 008e 1F4A     		ldr	r2, .L12
 220 0090 1268     		ldr	r2, [r2]
 221 0092 1F49     		ldr	r1, .L12+4
 222 0094 0A43     		orrs	r2, r1
 223 0096 1A60     		str	r2, [r3]
  84:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** 	
  85:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** 	// Setup E as input
  86:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** 	*GPIO_E_MODER = 0;
 224              		.loc 1 86 0
 225 0098 1E4B     		ldr	r3, .L12+8
 226 009a 0022     		movs	r2, #0
 227 009c 1A60     		str	r2, [r3]
  87:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** 	
  88:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** 	// Setup PE2,PE1,PE0 to EXTICR1
  89:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** 	*SYSCFG_EXTICR1 &= 0xFFFFF000; 
 228              		.loc 1 89 0
 229 009e 1E4B     		ldr	r3, .L12+12
 230 00a0 1D4A     		ldr	r2, .L12+12
 231 00a2 1268     		ldr	r2, [r2]
 232 00a4 120B     		lsrs	r2, r2, #12
 233 00a6 1203     		lsls	r2, r2, #12
 234 00a8 1A60     		str	r2, [r3]
  90:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** 	*SYSCFG_EXTICR1 |= 0x00000444;
 235              		.loc 1 90 0
 236 00aa 1B4B     		ldr	r3, .L12+12
 237 00ac 1A4A     		ldr	r2, .L12+12
 238 00ae 1268     		ldr	r2, [r2]
 239 00b0 1A49     		ldr	r1, .L12+16
 240 00b2 0A43     		orrs	r2, r1
 241 00b4 1A60     		str	r2, [r3]
  91:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** 	
  92:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** 	// Setup EXTI for PE2,PE1,PE0
  93:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** 	*EXTI_IMR |= (EXTI2_IRQ_BPOS | EXTI1_IRQ_BPOS | EXTI0_IRQ_BPOS);
 242              		.loc 1 93 0
 243 00b6 1A4B     		ldr	r3, .L12+20
 244 00b8 194A     		ldr	r2, .L12+20
 245 00ba 1268     		ldr	r2, [r2]
 246 00bc 0721     		movs	r1, #7
 247 00be 0A43     		orrs	r2, r1
 248 00c0 1A60     		str	r2, [r3]
  94:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** 	*EXTI_FTSR |= (EXTI2_IRQ_BPOS | EXTI1_IRQ_BPOS | EXTI0_IRQ_BPOS);
 249              		.loc 1 94 0
 250 00c2 184B     		ldr	r3, .L12+24
 251 00c4 174A     		ldr	r2, .L12+24
 252 00c6 1268     		ldr	r2, [r2]
 253 00c8 0721     		movs	r1, #7
 254 00ca 0A43     		orrs	r2, r1
 255 00cc 1A60     		str	r2, [r3]
  95:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** 	
  96:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** 	// Setup EXTI2,EXTI1,EXTI0 interrupt function
  97:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** 	*((void (**)(void)) EXTI2_IRQVEC) = irq_2;
 256              		.loc 1 97 0
 257 00ce 164B     		ldr	r3, .L12+28
 258 00d0 164A     		ldr	r2, .L12+32
 259 00d2 1A60     		str	r2, [r3]
  98:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** 	*((void (**)(void)) EXTI1_IRQVEC) = irq_1;
 260              		.loc 1 98 0
 261 00d4 164B     		ldr	r3, .L12+36
 262 00d6 174A     		ldr	r2, .L12+40
 263 00d8 1A60     		str	r2, [r3]
  99:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** 	*((void (**)(void)) EXTI0_IRQVEC) = irq_0;
 264              		.loc 1 99 0
 265 00da 174B     		ldr	r3, .L12+44
 266 00dc 174A     		ldr	r2, .L12+48
 267 00de 1A60     		str	r2, [r3]
 100:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** 
 101:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** 	// Enable EXTI2,EXTI1,EXTI0 in NVIC
 102:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** 	*((unsigned int *) NVIC_ISER0) |= NVIC_EXTI2_IRQ_BPOS;
 268              		.loc 1 102 0
 269 00e0 174B     		ldr	r3, .L12+52
 270 00e2 174A     		ldr	r2, .L12+52
 271 00e4 1268     		ldr	r2, [r2]
 272 00e6 8021     		movs	r1, #128
 273 00e8 4900     		lsls	r1, r1, #1
 274 00ea 0A43     		orrs	r2, r1
 275 00ec 1A60     		str	r2, [r3]
 103:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** 	*((unsigned int *) NVIC_ISER0) |= NVIC_EXTI1_IRQ_BPOS;
 276              		.loc 1 103 0
 277 00ee 144B     		ldr	r3, .L12+52
 278 00f0 134A     		ldr	r2, .L12+52
 279 00f2 1268     		ldr	r2, [r2]
 280 00f4 8021     		movs	r1, #128
 281 00f6 0A43     		orrs	r2, r1
 282 00f8 1A60     		str	r2, [r3]
 104:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** 	*((unsigned int *) NVIC_ISER0) |= NVIC_EXTI0_IRQ_BPOS;
 283              		.loc 1 104 0
 284 00fa 114B     		ldr	r3, .L12+52
 285 00fc 104A     		ldr	r2, .L12+52
 286 00fe 1268     		ldr	r2, [r2]
 287 0100 4021     		movs	r1, #64
 288 0102 0A43     		orrs	r2, r1
 289 0104 1A60     		str	r2, [r3]
 105:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** }
 290              		.loc 1 105 0
 291 0106 C046     		nop
 292 0108 BD46     		mov	sp, r7
 293              		@ sp needed
 294 010a 80BD     		pop	{r7, pc}
 295              	.L13:
 296              		.align	2
 297              	.L12:
 298 010c 000C0240 		.word	1073875968
 299 0110 55550000 		.word	21845
 300 0114 00100240 		.word	1073876992
 301 0118 08380140 		.word	1073821704
 302 011c 44040000 		.word	1092
 303 0120 003C0140 		.word	1073822720
 304 0124 0C3C0140 		.word	1073822732
 305 0128 60C00120 		.word	536985696
 306 012c 00000000 		.word	irq_2
 307 0130 5CC00120 		.word	536985692
 308 0134 00000000 		.word	irq_1
 309 0138 58C00120 		.word	536985688
 310 013c 00000000 		.word	irq_0
 311 0140 00E100E0 		.word	-536813312
 312              		.cfi_endproc
 313              	.LFE4:
 315              		.align	1
 316              		.global	main
 317              		.syntax unified
 318              		.code	16
 319              		.thumb_func
 320              		.fpu softvfp
 322              	main:
 323              	.LFB5:
 106:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c ****  
 107:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** void main(void) {
 324              		.loc 1 107 0
 325              		.cfi_startproc
 326              		@ args = 0, pretend = 0, frame = 0
 327              		@ frame_needed = 1, uses_anonymous_args = 0
 328 0144 80B5     		push	{r7, lr}
 329              		.cfi_def_cfa_offset 8
 330              		.cfi_offset 7, -8
 331              		.cfi_offset 14, -4
 332 0146 00AF     		add	r7, sp, #0
 333              		.cfi_def_cfa_register 7
 108:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** 	init_app();
 334              		.loc 1 108 0
 335 0148 FFF7FEFF 		bl	init_app
 336              	.L15:
 109:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** 	while(1) {
 110:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_vectored\startup.c **** 		*GPIO_D_ODR_LOW = count;
 337              		.loc 1 110 0 discriminator 1
 338 014c 024A     		ldr	r2, .L16
 339 014e 034B     		ldr	r3, .L16+4
 340 0150 1B78     		ldrb	r3, [r3]
 341 0152 DBB2     		uxtb	r3, r3
 342 0154 1370     		strb	r3, [r2]
 343 0156 F9E7     		b	.L15
 344              	.L17:
 345              		.align	2
 346              	.L16:
 347 0158 140C0240 		.word	1073875988
 348 015c 00000000 		.word	count
 349              		.cfi_endproc
 350              	.LFE5:
 352              	.Letext0:
