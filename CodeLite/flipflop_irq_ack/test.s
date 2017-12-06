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
  52:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 	if(*EXTI_PR & 0x08) {
  73              		.loc 1 52 0
  74 0004 204B     		ldr	r3, .L8
  75 0006 1B68     		ldr	r3, [r3]
  76 0008 0822     		movs	r2, #8
  77 000a 1340     		ands	r3, r2
  78 000c 39D0     		beq	.L7
  53:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 		// IRQ0
  54:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 		if(*EXTI_PR & 0x01) {
  79              		.loc 1 54 0
  80 000e 1E4B     		ldr	r3, .L8
  81 0010 1B68     		ldr	r3, [r3]
  82 0012 0122     		movs	r2, #1
  83 0014 1340     		ands	r3, r2
  84 0016 0DD0     		beq	.L4
  55:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 			count++;
  85              		.loc 1 55 0
  86 0018 1C4B     		ldr	r3, .L8+4
  87 001a 1B78     		ldrb	r3, [r3]
  88 001c DBB2     		uxtb	r3, r3
  89 001e 0133     		adds	r3, r3, #1
  90 0020 DAB2     		uxtb	r2, r3
  91 0022 1A4B     		ldr	r3, .L8+4
  92 0024 1A70     		strb	r2, [r3]
  56:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 			*EXTI_PR |= 0x01;
  93              		.loc 1 56 0
  94 0026 184B     		ldr	r3, .L8
  95 0028 174A     		ldr	r2, .L8
  96 002a 1268     		ldr	r2, [r2]
  97 002c 0121     		movs	r1, #1
  98 002e 0A43     		orrs	r2, r1
  99 0030 1A60     		str	r2, [r3]
 100 0032 20E0     		b	.L5
 101              	.L4:
  57:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 		}
  58:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 		// IRQ1
  59:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 		else if(*EXTI_PR & 0x02) {
 102              		.loc 1 59 0
 103 0034 144B     		ldr	r3, .L8
 104 0036 1B68     		ldr	r3, [r3]
 105 0038 0222     		movs	r2, #2
 106 003a 1340     		ands	r3, r2
 107 003c 09D0     		beq	.L6
  60:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 			count = 0;
 108              		.loc 1 60 0
 109 003e 134B     		ldr	r3, .L8+4
 110 0040 0022     		movs	r2, #0
 111 0042 1A70     		strb	r2, [r3]
  61:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 			*EXTI_PR |= 0x02;
 112              		.loc 1 61 0
 113 0044 104B     		ldr	r3, .L8
 114 0046 104A     		ldr	r2, .L8
 115 0048 1268     		ldr	r2, [r2]
 116 004a 0221     		movs	r1, #2
 117 004c 0A43     		orrs	r2, r1
 118 004e 1A60     		str	r2, [r3]
 119 0050 11E0     		b	.L5
 120              	.L6:
  62:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 		}
  63:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 		// IRQ2
  64:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 		else if(*EXTI_PR & 0x04) {
 121              		.loc 1 64 0
 122 0052 0D4B     		ldr	r3, .L8
 123 0054 1B68     		ldr	r3, [r3]
 124 0056 0422     		movs	r2, #4
 125 0058 1340     		ands	r3, r2
 126 005a 0CD0     		beq	.L5
  65:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 			count = ~count;
 127              		.loc 1 65 0
 128 005c 0B4B     		ldr	r3, .L8+4
 129 005e 1B78     		ldrb	r3, [r3]
 130 0060 DBB2     		uxtb	r3, r3
 131 0062 DB43     		mvns	r3, r3
 132 0064 DAB2     		uxtb	r2, r3
 133 0066 094B     		ldr	r3, .L8+4
 134 0068 1A70     		strb	r2, [r3]
  66:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 			*EXTI_PR |= 0x04;
 135              		.loc 1 66 0
 136 006a 074B     		ldr	r3, .L8
 137 006c 064A     		ldr	r2, .L8
 138 006e 1268     		ldr	r2, [r2]
 139 0070 0421     		movs	r1, #4
 140 0072 0A43     		orrs	r2, r1
 141 0074 1A60     		str	r2, [r3]
 142              	.L5:
  67:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 		}
  68:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 		*EXTI_PR |= 0x08;
 143              		.loc 1 68 0
 144 0076 044B     		ldr	r3, .L8
 145 0078 034A     		ldr	r2, .L8
 146 007a 1268     		ldr	r2, [r2]
 147 007c 0821     		movs	r1, #8
 148 007e 0A43     		orrs	r2, r1
 149 0080 1A60     		str	r2, [r3]
 150              	.L7:
  69:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 	}
  70:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 	
  71:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** }
 151              		.loc 1 71 0
 152 0082 C046     		nop
 153 0084 BD46     		mov	sp, r7
 154              		@ sp needed
 155 0086 80BD     		pop	{r7, pc}
 156              	.L9:
 157              		.align	2
 158              	.L8:
 159 0088 143C0140 		.word	1073822740
 160 008c 00000000 		.word	count
 161              		.cfi_endproc
 162              	.LFE1:
 164              		.align	1
 165              		.global	init_app
 166              		.syntax unified
 167              		.code	16
 168              		.thumb_func
 169              		.fpu softvfp
 171              	init_app:
 172              	.LFB2:
  72:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 
  73:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** void init_app(void) {
 173              		.loc 1 73 0
 174              		.cfi_startproc
 175              		@ args = 0, pretend = 0, frame = 0
 176              		@ frame_needed = 1, uses_anonymous_args = 0
 177 0090 80B5     		push	{r7, lr}
 178              		.cfi_def_cfa_offset 8
 179              		.cfi_offset 7, -8
 180              		.cfi_offset 14, -4
 181 0092 00AF     		add	r7, sp, #0
 182              		.cfi_def_cfa_register 7
  74:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 	// Setup hex display
  75:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 	*GPIO_D_MODER &= 0xFFFF0000;
 183              		.loc 1 75 0
 184 0094 234B     		ldr	r3, .L11
 185 0096 234A     		ldr	r2, .L11
 186 0098 1268     		ldr	r2, [r2]
 187 009a 120C     		lsrs	r2, r2, #16
 188 009c 1204     		lsls	r2, r2, #16
 189 009e 1A60     		str	r2, [r3]
  76:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 	*GPIO_D_MODER |= 0x00005555;
 190              		.loc 1 76 0
 191 00a0 204B     		ldr	r3, .L11
 192 00a2 204A     		ldr	r2, .L11
 193 00a4 1268     		ldr	r2, [r2]
 194 00a6 2049     		ldr	r1, .L11+4
 195 00a8 0A43     		orrs	r2, r1
 196 00aa 1A60     		str	r2, [r3]
  77:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 	
  78:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 	// Setup E as input
  79:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 	*GPIO_E_MODER = 0;
 197              		.loc 1 79 0
 198 00ac 1F4B     		ldr	r3, .L11+8
 199 00ae 0022     		movs	r2, #0
 200 00b0 1A60     		str	r2, [r3]
  80:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 	
  81:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 	// Setup PE3,PE2,PE1,PE0 to EXTICR1
  82:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 	*SYSCFG_EXTICR1 &= 0xFFFF0000; 
 201              		.loc 1 82 0
 202 00b2 1F4B     		ldr	r3, .L11+12
 203 00b4 1E4A     		ldr	r2, .L11+12
 204 00b6 1268     		ldr	r2, [r2]
 205 00b8 120C     		lsrs	r2, r2, #16
 206 00ba 1204     		lsls	r2, r2, #16
 207 00bc 1A60     		str	r2, [r3]
  83:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 	*SYSCFG_EXTICR1 |= 0x00004444;
 208              		.loc 1 83 0
 209 00be 1C4B     		ldr	r3, .L11+12
 210 00c0 1B4A     		ldr	r2, .L11+12
 211 00c2 1268     		ldr	r2, [r2]
 212 00c4 1B49     		ldr	r1, .L11+16
 213 00c6 0A43     		orrs	r2, r1
 214 00c8 1A60     		str	r2, [r3]
  84:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 	
  85:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 	// Setup EXTI for P3,PE2,PE1,PE0
  86:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 	*EXTI_IMR |= 0x0F;
 215              		.loc 1 86 0
 216 00ca 1B4B     		ldr	r3, .L11+20
 217 00cc 1A4A     		ldr	r2, .L11+20
 218 00ce 1268     		ldr	r2, [r2]
 219 00d0 0F21     		movs	r1, #15
 220 00d2 0A43     		orrs	r2, r1
 221 00d4 1A60     		str	r2, [r3]
  87:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 	*EXTI_FTSR |= 0x0F;
 222              		.loc 1 87 0
 223 00d6 194B     		ldr	r3, .L11+24
 224 00d8 184A     		ldr	r2, .L11+24
 225 00da 1268     		ldr	r2, [r2]
 226 00dc 0F21     		movs	r1, #15
 227 00de 0A43     		orrs	r2, r1
 228 00e0 1A60     		str	r2, [r3]
  88:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 	
  89:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 	// Setup EXTI2,EXTI1,EXTI0 interrupt function
  90:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 	*((void (**)(void)) 0x2001C064) = interrupt_handler;
 229              		.loc 1 90 0
 230 00e2 174B     		ldr	r3, .L11+28
 231 00e4 174A     		ldr	r2, .L11+32
 232 00e6 1A60     		str	r2, [r3]
  91:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 
  92:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 	// Enable EXT13,EXTI2,EXTI1,EXTI0 in NVIC
  93:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 	*((unsigned int *) 0xE000E100) |= (1<<9);
 233              		.loc 1 93 0
 234 00e8 174B     		ldr	r3, .L11+36
 235 00ea 174A     		ldr	r2, .L11+36
 236 00ec 1268     		ldr	r2, [r2]
 237 00ee 8021     		movs	r1, #128
 238 00f0 8900     		lsls	r1, r1, #2
 239 00f2 0A43     		orrs	r2, r1
 240 00f4 1A60     		str	r2, [r3]
  94:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 	*((unsigned int *) 0xE000E100) |= (1<<8);
 241              		.loc 1 94 0
 242 00f6 144B     		ldr	r3, .L11+36
 243 00f8 134A     		ldr	r2, .L11+36
 244 00fa 1268     		ldr	r2, [r2]
 245 00fc 8021     		movs	r1, #128
 246 00fe 4900     		lsls	r1, r1, #1
 247 0100 0A43     		orrs	r2, r1
 248 0102 1A60     		str	r2, [r3]
  95:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 	*((unsigned int *) 0xE000E100) |= (1<<7);
 249              		.loc 1 95 0
 250 0104 104B     		ldr	r3, .L11+36
 251 0106 104A     		ldr	r2, .L11+36
 252 0108 1268     		ldr	r2, [r2]
 253 010a 8021     		movs	r1, #128
 254 010c 0A43     		orrs	r2, r1
 255 010e 1A60     		str	r2, [r3]
  96:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 	*((unsigned int *) 0xE000E100) |= (1<<6);
 256              		.loc 1 96 0
 257 0110 0D4B     		ldr	r3, .L11+36
 258 0112 0D4A     		ldr	r2, .L11+36
 259 0114 1268     		ldr	r2, [r2]
 260 0116 4021     		movs	r1, #64
 261 0118 0A43     		orrs	r2, r1
 262 011a 1A60     		str	r2, [r3]
  97:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** }
 263              		.loc 1 97 0
 264 011c C046     		nop
 265 011e BD46     		mov	sp, r7
 266              		@ sp needed
 267 0120 80BD     		pop	{r7, pc}
 268              	.L12:
 269 0122 C046     		.align	2
 270              	.L11:
 271 0124 000C0240 		.word	1073875968
 272 0128 55550000 		.word	21845
 273 012c 00100240 		.word	1073876992
 274 0130 08380140 		.word	1073821704
 275 0134 44440000 		.word	17476
 276 0138 003C0140 		.word	1073822720
 277 013c 0C3C0140 		.word	1073822732
 278 0140 64C00120 		.word	536985700
 279 0144 00000000 		.word	interrupt_handler
 280 0148 00E100E0 		.word	-536813312
 281              		.cfi_endproc
 282              	.LFE2:
 284              		.align	1
 285              		.global	main
 286              		.syntax unified
 287              		.code	16
 288              		.thumb_func
 289              		.fpu softvfp
 291              	main:
 292              	.LFB3:
  98:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c ****  
  99:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** void main(void) {
 293              		.loc 1 99 0
 294              		.cfi_startproc
 295              		@ args = 0, pretend = 0, frame = 0
 296              		@ frame_needed = 1, uses_anonymous_args = 0
 297 014c 80B5     		push	{r7, lr}
 298              		.cfi_def_cfa_offset 8
 299              		.cfi_offset 7, -8
 300              		.cfi_offset 14, -4
 301 014e 00AF     		add	r7, sp, #0
 302              		.cfi_def_cfa_register 7
 100:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 	init_app();
 303              		.loc 1 100 0
 304 0150 FFF7FEFF 		bl	init_app
 305              	.L14:
 101:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 	while(1) {
 102:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_ack\startup.c **** 		*GPIO_D_ODR_LOW = count;
 306              		.loc 1 102 0 discriminator 1
 307 0154 024A     		ldr	r2, .L15
 308 0156 034B     		ldr	r3, .L15+4
 309 0158 1B78     		ldrb	r3, [r3]
 310 015a DBB2     		uxtb	r3, r3
 311 015c 1370     		strb	r3, [r2]
 312 015e F9E7     		b	.L14
 313              	.L16:
 314              		.align	2
 315              	.L15:
 316 0160 140C0240 		.word	1073875988
 317 0164 00000000 		.word	count
 318              		.cfi_endproc
 319              	.LFE3:
 321              	.Letext0:
