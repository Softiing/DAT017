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
  25              		.file 1 "C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack/startup.c"
   1:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** #define GPIO_E 0x40021000
   2:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** #define GPIO_E_MODER ((volatile unsigned int *) (GPIO_E))
   3:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** #define GPIO_E_OTYPER ((volatile unsigned short *) (GPIO_E+0x4))
   4:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** #define GPIO_E_PUPDR ((volatile unsigned int *) (GPIO_E+0xC))
   5:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** #define GPIO_E_IDR_LOW ((volatile unsigned char *) (GPIO_E+0x10))
   6:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** #define GPIO_E_IDR_HIGH ((volatile unsigned char *) (GPIO_E+0x11))
   7:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** #define GPIO_E_ODR_LOW ((volatile unsigned char *) (GPIO_E+0x14))
   8:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** #define GPIO_E_ODR_HIGH ((volatile unsigned char *) (GPIO_E+0x15))
   9:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 
  10:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** #define GPIO_D 0x40020C00
  11:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** #define GPIO_D_MODER ((volatile unsigned int *) (GPIO_D))
  12:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** #define GPIO_D_OTYPER ((volatile unsigned short *) (GPIO_D+0x4))
  13:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** #define GPIO_D_PUPDR ((volatile unsigned int *) (GPIO_D+0xC))
  14:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** #define GPIO_D_IDR_LOW ((volatile unsigned char *) (GPIO_D+0x10))
  15:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** #define GPIO_D_IDR_HIGH ((volatile unsigned char *) (GPIO_D+0x11))
  16:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** #define GPIO_D_ODR_LOW ((volatile unsigned char *) (GPIO_D+0x14))
  17:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** #define GPIO_D_ODR_HIGH ((volatile unsigned char *) (GPIO_D+0x15))
  18:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 
  19:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** #define SYSCFG 0x40013800
  20:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** #define SYSCFG_MEMRMP ((volatile unsigned int*)(SYSCFG))
  21:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** #define SYSCFG_PCM ((volatile unsigned int*)(SYSCFG + 0x04))
  22:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** #define SYSCFG_EXTICR1 ((volatile unsigned int*)(SYSCFG + 0x08))
  23:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** #define SYSCFG_EXTICR2 ((volatile unsigned int*)(SYSCFG + 0x0C))
  24:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** #define SYSCFG_EXTICR3 ((volatile unsigned int*)(SYSCFG + 0x10))
  25:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** #define SYSCFG_EXTICR4 ((volatile unsigned int*)(SYSCFG + 0x14))
  26:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** #define SYSCFG_CMPCR ((volatile unsigned int*)(SYSCFG + 0x20))
  27:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 
  28:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** #define EXTI 0x40013C00
  29:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** #define EXTI_IMR ((volatile unsigned int*)(EXTI))
  30:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** #define EXTI_EMR ((volatile unsigned int*)(EXTI + 0x04))
  31:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** #define EXTI_RTSR ((volatile unsigned int*)(EXTI + 0x08))
  32:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** #define EXTI_FTSR ((volatile unsigned int*)(EXTI + 0x0C))
  33:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** #define EXTI_SWIER ((volatile unsigned int*)(EXTI + 0x10))
  34:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** #define EXTI_PR ((volatile unsigned int*)(EXTI + 0x14))
  35:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 
  36:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 
  37:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
  38:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 
  39:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** void startup ( void )
  40:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** {
  26              		.loc 1 40 0
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
  41:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** __asm volatile(
  31              		.loc 1 41 0
  32              		.syntax divided
  33              	@ 41 "C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack/startup.c" 1
  34 0000 0248     		 LDR R0,=0x2001C000
  35 0002 8546     	 MOV SP,R0
  36 0004 FFF7FEFF 	 BL main
  37 0008 FEE7     	_exit: B .
  38              	
  39              	@ 0 "" 2
  42:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  43:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 	" MOV SP,R0\n"
  44:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 	" BL main\n"				/* call main */
  45:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 	"_exit: B .\n"				/* never return */
  46:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 	) ;
  47:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** }
  40              		.loc 1 47 0
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
  55              		.global	interrupt_handler
  56              		.syntax unified
  57              		.code	16
  58              		.thumb_func
  59              		.fpu softvfp
  61              	interrupt_handler:
  62              	.LFB1:
  48:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 
  49:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 
  50:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** volatile unsigned char count = 0;
  51:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** void interrupt_handler(void) {
  63              		.loc 1 51 0
  64              		.cfi_startproc
  65              		@ args = 0, pretend = 0, frame = 0
  66              		@ frame_needed = 1, uses_anonymous_args = 0
  67 0000 80B5     		push	{r7, lr}
  68              		.cfi_def_cfa_offset 8
  69              		.cfi_offset 7, -8
  70              		.cfi_offset 14, -4
  71 0002 00AF     		add	r7, sp, #0
  72              		.cfi_def_cfa_register 7
  52:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 	// IRQ0
  53:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 	if(*EXTI_PR & 0x01) {
  73              		.loc 1 53 0
  74 0004 164B     		ldr	r3, .L7
  75 0006 1B68     		ldr	r3, [r3]
  76 0008 0122     		movs	r2, #1
  77 000a 1340     		ands	r3, r2
  78 000c 0AD0     		beq	.L3
  54:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 		count++;
  79              		.loc 1 54 0
  80 000e 154B     		ldr	r3, .L7+4
  81 0010 1B78     		ldrb	r3, [r3]
  82 0012 DBB2     		uxtb	r3, r3
  83 0014 0133     		adds	r3, r3, #1
  84 0016 DAB2     		uxtb	r2, r3
  85 0018 124B     		ldr	r3, .L7+4
  86 001a 1A70     		strb	r2, [r3]
  55:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 		*EXTI_PR = 0x01;
  87              		.loc 1 55 0
  88 001c 104B     		ldr	r3, .L7
  89 001e 0122     		movs	r2, #1
  90 0020 1A60     		str	r2, [r3]
  56:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 	}
  57:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 	// IRQ1
  58:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 	else if(*EXTI_PR & 0x02) {
  59:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 		count = 0;
  60:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 		*EXTI_PR = 0x02;
  61:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 	}
  62:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 	// IRQ2
  63:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 	else if(*EXTI_PR & 0x04) {
  64:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 		count = ~count;
  65:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 		*EXTI_PR = 0x04;
  66:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 	}
  67:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** //	*EXTI_PR |= 0x00000008;
  68:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** }
  91              		.loc 1 68 0
  92 0022 1AE0     		b	.L6
  93              	.L3:
  58:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 		count = 0;
  94              		.loc 1 58 0
  95 0024 0E4B     		ldr	r3, .L7
  96 0026 1B68     		ldr	r3, [r3]
  97 0028 0222     		movs	r2, #2
  98 002a 1340     		ands	r3, r2
  99 002c 06D0     		beq	.L5
  59:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 		*EXTI_PR = 0x02;
 100              		.loc 1 59 0
 101 002e 0D4B     		ldr	r3, .L7+4
 102 0030 0022     		movs	r2, #0
 103 0032 1A70     		strb	r2, [r3]
  60:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 	}
 104              		.loc 1 60 0
 105 0034 0A4B     		ldr	r3, .L7
 106 0036 0222     		movs	r2, #2
 107 0038 1A60     		str	r2, [r3]
 108              		.loc 1 68 0
 109 003a 0EE0     		b	.L6
 110              	.L5:
  63:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 		count = ~count;
 111              		.loc 1 63 0
 112 003c 084B     		ldr	r3, .L7
 113 003e 1B68     		ldr	r3, [r3]
 114 0040 0422     		movs	r2, #4
 115 0042 1340     		ands	r3, r2
 116 0044 09D0     		beq	.L6
  64:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 		*EXTI_PR = 0x04;
 117              		.loc 1 64 0
 118 0046 074B     		ldr	r3, .L7+4
 119 0048 1B78     		ldrb	r3, [r3]
 120 004a DBB2     		uxtb	r3, r3
 121 004c DB43     		mvns	r3, r3
 122 004e DAB2     		uxtb	r2, r3
 123 0050 044B     		ldr	r3, .L7+4
 124 0052 1A70     		strb	r2, [r3]
  65:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 	}
 125              		.loc 1 65 0
 126 0054 024B     		ldr	r3, .L7
 127 0056 0422     		movs	r2, #4
 128 0058 1A60     		str	r2, [r3]
 129              	.L6:
 130              		.loc 1 68 0
 131 005a C046     		nop
 132 005c BD46     		mov	sp, r7
 133              		@ sp needed
 134 005e 80BD     		pop	{r7, pc}
 135              	.L8:
 136              		.align	2
 137              	.L7:
 138 0060 143C0140 		.word	1073822740
 139 0064 00000000 		.word	count
 140              		.cfi_endproc
 141              	.LFE1:
 143              		.align	1
 144              		.global	init_app
 145              		.syntax unified
 146              		.code	16
 147              		.thumb_func
 148              		.fpu softvfp
 150              	init_app:
 151              	.LFB2:
  69:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 
  70:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** void init_app(void) {
 152              		.loc 1 70 0
 153              		.cfi_startproc
 154              		@ args = 0, pretend = 0, frame = 0
 155              		@ frame_needed = 1, uses_anonymous_args = 0
 156 0068 80B5     		push	{r7, lr}
 157              		.cfi_def_cfa_offset 8
 158              		.cfi_offset 7, -8
 159              		.cfi_offset 14, -4
 160 006a 00AF     		add	r7, sp, #0
 161              		.cfi_def_cfa_register 7
  71:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 	// Setup hex display
  72:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 	*GPIO_D_MODER &= 0xFFFF0000;
 162              		.loc 1 72 0
 163 006c 224B     		ldr	r3, .L10
 164 006e 224A     		ldr	r2, .L10
 165 0070 1268     		ldr	r2, [r2]
 166 0072 120C     		lsrs	r2, r2, #16
 167 0074 1204     		lsls	r2, r2, #16
 168 0076 1A60     		str	r2, [r3]
  73:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 	*GPIO_D_MODER |= 0x00005555;
 169              		.loc 1 73 0
 170 0078 1F4B     		ldr	r3, .L10
 171 007a 1F4A     		ldr	r2, .L10
 172 007c 1268     		ldr	r2, [r2]
 173 007e 1F49     		ldr	r1, .L10+4
 174 0080 0A43     		orrs	r2, r1
 175 0082 1A60     		str	r2, [r3]
  74:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 	
  75:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 	// Setup E as input
  76:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 	*GPIO_E_MODER = 0;
 176              		.loc 1 76 0
 177 0084 1E4B     		ldr	r3, .L10+8
 178 0086 0022     		movs	r2, #0
 179 0088 1A60     		str	r2, [r3]
  77:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 	
  78:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 	// Setup PE2,PE1,PE0 to EXTICR1
  79:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 	*SYSCFG_EXTICR1 &= 0xFFFFF000; 
 180              		.loc 1 79 0
 181 008a 1E4B     		ldr	r3, .L10+12
 182 008c 1D4A     		ldr	r2, .L10+12
 183 008e 1268     		ldr	r2, [r2]
 184 0090 120B     		lsrs	r2, r2, #12
 185 0092 1203     		lsls	r2, r2, #12
 186 0094 1A60     		str	r2, [r3]
  80:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 	*SYSCFG_EXTICR1 |= 0x00000444;
 187              		.loc 1 80 0
 188 0096 1B4B     		ldr	r3, .L10+12
 189 0098 1A4A     		ldr	r2, .L10+12
 190 009a 1268     		ldr	r2, [r2]
 191 009c 1A49     		ldr	r1, .L10+16
 192 009e 0A43     		orrs	r2, r1
 193 00a0 1A60     		str	r2, [r3]
  81:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 	
  82:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 	// Setup EXTI for PE2,PE1,PE0
  83:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 	*EXTI_IMR |= 0x07;
 194              		.loc 1 83 0
 195 00a2 1A4B     		ldr	r3, .L10+20
 196 00a4 194A     		ldr	r2, .L10+20
 197 00a6 1268     		ldr	r2, [r2]
 198 00a8 0721     		movs	r1, #7
 199 00aa 0A43     		orrs	r2, r1
 200 00ac 1A60     		str	r2, [r3]
  84:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 	*EXTI_FTSR |= 0x07;
 201              		.loc 1 84 0
 202 00ae 184B     		ldr	r3, .L10+24
 203 00b0 174A     		ldr	r2, .L10+24
 204 00b2 1268     		ldr	r2, [r2]
 205 00b4 0721     		movs	r1, #7
 206 00b6 0A43     		orrs	r2, r1
 207 00b8 1A60     		str	r2, [r3]
  85:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 	
  86:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 	// Setup EXTI2,EXTI1,EXTI0 interrupt function
  87:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 	*((void (**)(void)) 0x2001C060) = interrupt_handler;
 208              		.loc 1 87 0
 209 00ba 164B     		ldr	r3, .L10+28
 210 00bc 164A     		ldr	r2, .L10+32
 211 00be 1A60     		str	r2, [r3]
  88:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 	*((void (**)(void)) 0x2001C05C) = interrupt_handler;
 212              		.loc 1 88 0
 213 00c0 164B     		ldr	r3, .L10+36
 214 00c2 154A     		ldr	r2, .L10+32
 215 00c4 1A60     		str	r2, [r3]
  89:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 	*((void (**)(void)) 0x2001C058) = interrupt_handler;
 216              		.loc 1 89 0
 217 00c6 164B     		ldr	r3, .L10+40
 218 00c8 134A     		ldr	r2, .L10+32
 219 00ca 1A60     		str	r2, [r3]
  90:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 
  91:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 	// Enable EXTI2,EXTI1,EXTI0 in NVIC
  92:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 	*((unsigned int *) 0xE000E100) |= (1<<8);
 220              		.loc 1 92 0
 221 00cc 154B     		ldr	r3, .L10+44
 222 00ce 154A     		ldr	r2, .L10+44
 223 00d0 1268     		ldr	r2, [r2]
 224 00d2 8021     		movs	r1, #128
 225 00d4 4900     		lsls	r1, r1, #1
 226 00d6 0A43     		orrs	r2, r1
 227 00d8 1A60     		str	r2, [r3]
  93:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 	*((unsigned int *) 0xE000E100) |= (1<<7);
 228              		.loc 1 93 0
 229 00da 124B     		ldr	r3, .L10+44
 230 00dc 114A     		ldr	r2, .L10+44
 231 00de 1268     		ldr	r2, [r2]
 232 00e0 8021     		movs	r1, #128
 233 00e2 0A43     		orrs	r2, r1
 234 00e4 1A60     		str	r2, [r3]
  94:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 	*((unsigned int *) 0xE000E100) |= (1<<6);
 235              		.loc 1 94 0
 236 00e6 0F4B     		ldr	r3, .L10+44
 237 00e8 0E4A     		ldr	r2, .L10+44
 238 00ea 1268     		ldr	r2, [r2]
 239 00ec 4021     		movs	r1, #64
 240 00ee 0A43     		orrs	r2, r1
 241 00f0 1A60     		str	r2, [r3]
  95:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** }
 242              		.loc 1 95 0
 243 00f2 C046     		nop
 244 00f4 BD46     		mov	sp, r7
 245              		@ sp needed
 246 00f6 80BD     		pop	{r7, pc}
 247              	.L11:
 248              		.align	2
 249              	.L10:
 250 00f8 000C0240 		.word	1073875968
 251 00fc 55550000 		.word	21845
 252 0100 00100240 		.word	1073876992
 253 0104 08380140 		.word	1073821704
 254 0108 44040000 		.word	1092
 255 010c 003C0140 		.word	1073822720
 256 0110 0C3C0140 		.word	1073822732
 257 0114 60C00120 		.word	536985696
 258 0118 00000000 		.word	interrupt_handler
 259 011c 5CC00120 		.word	536985692
 260 0120 58C00120 		.word	536985688
 261 0124 00E100E0 		.word	-536813312
 262              		.cfi_endproc
 263              	.LFE2:
 265              		.align	1
 266              		.global	main
 267              		.syntax unified
 268              		.code	16
 269              		.thumb_func
 270              		.fpu softvfp
 272              	main:
 273              	.LFB3:
  96:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c ****  
  97:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** void main(void) {
 274              		.loc 1 97 0
 275              		.cfi_startproc
 276              		@ args = 0, pretend = 0, frame = 0
 277              		@ frame_needed = 1, uses_anonymous_args = 0
 278 0128 80B5     		push	{r7, lr}
 279              		.cfi_def_cfa_offset 8
 280              		.cfi_offset 7, -8
 281              		.cfi_offset 14, -4
 282 012a 00AF     		add	r7, sp, #0
 283              		.cfi_def_cfa_register 7
  98:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 	init_app();
 284              		.loc 1 98 0
 285 012c FFF7FEFF 		bl	init_app
 286              	.L13:
  99:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 	while(1) {
 100:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 		*GPIO_D_ODR_LOW = count;
 287              		.loc 1 100 0 discriminator 1
 288 0130 024A     		ldr	r2, .L14
 289 0132 034B     		ldr	r3, .L14+4
 290 0134 1B78     		ldrb	r3, [r3]
 291 0136 DBB2     		uxtb	r3, r3
 292 0138 1370     		strb	r3, [r2]
 293 013a F9E7     		b	.L13
 294              	.L15:
 295              		.align	2
 296              	.L14:
 297 013c 140C0240 		.word	1073875988
 298 0140 00000000 		.word	count
 299              		.cfi_endproc
 300              	.LFE3:
 302              	.Letext0:
