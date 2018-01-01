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
  25              		.file 1 "C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_2/startup.c"
   1:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_2\startup.c **** /*
   2:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_2\startup.c ****  * 	startup.c
   3:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_2\startup.c ****  *
   4:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_2\startup.c ****  */
   5:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_2\startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
   6:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_2\startup.c **** 
   7:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_2\startup.c **** void startup ( void )
   8:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_2\startup.c **** {
  26              		.loc 1 8 0
  27              		.cfi_startproc
  28              		@ Naked Function: prologue and epilogue provided by programmer.
  29              		@ args = 0, pretend = 0, frame = 0
  30              		@ frame_needed = 1, uses_anonymous_args = 0
   9:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_2\startup.c **** __asm volatile(
  31              		.loc 1 9 0
  32              		.syntax divided
  33              	@ 9 "C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_2/startup.c" 1
  34 0000 0248     		 LDR R0,=0x2001C000
  35 0002 8546     	 MOV SP,R0
  36 0004 FFF7FEFF 	 BL main
  37 0008 FEE7     	_exit: B .
  38              	
  39              	@ 0 "" 2
  10:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_2\startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  11:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_2\startup.c **** 	" MOV SP,R0\n"
  12:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_2\startup.c **** 	" BL main\n"				/* call main */
  13:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_2\startup.c **** 	"_exit: B .\n"				/* never return */
  14:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_2\startup.c **** 	) ;
  15:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_2\startup.c **** }
  40              		.loc 1 15 0
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
  16:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_2\startup.c **** 
  17:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_2\startup.c **** typedef struct {
  18:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_2\startup.c **** 	volatile unsigned int moder;
  19:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_2\startup.c **** 	volatile unsigned int ostyper;
  20:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_2\startup.c **** 	volatile unsigned int ospeedr;
  21:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_2\startup.c **** 	volatile unsigned int pupdr;
  22:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_2\startup.c **** 	volatile unsigned short idr_low;
  23:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_2\startup.c **** 	volatile unsigned short idr_high;
  24:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_2\startup.c **** 	volatile unsigned short odr_low;
  25:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_2\startup.c **** 	volatile unsigned short odr_high;
  26:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_2\startup.c **** 
  27:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_2\startup.c **** } GPIO;
  28:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_2\startup.c **** 
  29:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_2\startup.c **** #define portD ((GPIO*) 0x40020C00)
  30:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_2\startup.c **** 
  31:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_2\startup.c **** unsigned int count = 0;
  32:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_2\startup.c **** 
  33:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_2\startup.c **** void interrupt_handler() {
  64              		.loc 1 33 0
  65              		.cfi_startproc
  66              		@ args = 0, pretend = 0, frame = 0
  67              		@ frame_needed = 1, uses_anonymous_args = 0
  68 0000 80B5     		push	{r7, lr}
  69              		.cfi_def_cfa_offset 8
  70              		.cfi_offset 7, -8
  71              		.cfi_offset 14, -4
  72 0002 00AF     		add	r7, sp, #0
  73              		.cfi_def_cfa_register 7
  34:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_2\startup.c **** 	count++;
  74              		.loc 1 34 0
  75 0004 064B     		ldr	r3, .L3
  76 0006 1B68     		ldr	r3, [r3]
  77 0008 5A1C     		adds	r2, r3, #1
  78 000a 054B     		ldr	r3, .L3
  79 000c 1A60     		str	r2, [r3]
  35:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_2\startup.c **** 	*((unsigned int *) 0x40013C14) |= (1<<3);
  80              		.loc 1 35 0
  81 000e 054B     		ldr	r3, .L3+4
  82 0010 044A     		ldr	r2, .L3+4
  83 0012 1268     		ldr	r2, [r2]
  84 0014 0821     		movs	r1, #8
  85 0016 0A43     		orrs	r2, r1
  86 0018 1A60     		str	r2, [r3]
  36:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_2\startup.c **** }
  87              		.loc 1 36 0
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
 101              		.global	init
 102              		.syntax unified
 103              		.code	16
 104              		.thumb_func
 105              		.fpu softvfp
 107              	init:
 108              	.LFB2:
  37:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_2\startup.c **** 
  38:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_2\startup.c **** 
  39:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_2\startup.c **** void init() {
 109              		.loc 1 39 0
 110              		.cfi_startproc
 111              		@ args = 0, pretend = 0, frame = 0
 112              		@ frame_needed = 1, uses_anonymous_args = 0
 113 0028 80B5     		push	{r7, lr}
 114              		.cfi_def_cfa_offset 8
 115              		.cfi_offset 7, -8
 116              		.cfi_offset 14, -4
 117 002a 00AF     		add	r7, sp, #0
 118              		.cfi_def_cfa_register 7
  40:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_2\startup.c **** 	// Set port D_low as output
  41:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_2\startup.c **** 	portD->moder = 0x5555;
 119              		.loc 1 41 0
 120 002c 154B     		ldr	r3, .L6
 121 002e 164A     		ldr	r2, .L6+4
 122 0030 1A60     		str	r2, [r3]
  42:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_2\startup.c **** 	
  43:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_2\startup.c **** 	// Set exception line for PE3 to EXTI3
  44:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_2\startup.c **** 	*((unsigned short *) 0x40013808) &= 0x0FFF;
 123              		.loc 1 44 0
 124 0032 164A     		ldr	r2, .L6+8
 125 0034 154B     		ldr	r3, .L6+8
 126 0036 1B88     		ldrh	r3, [r3]
 127 0038 1B05     		lsls	r3, r3, #20
 128 003a 1B0D     		lsrs	r3, r3, #20
 129 003c 9BB2     		uxth	r3, r3
 130 003e 1380     		strh	r3, [r2]
  45:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_2\startup.c **** 	*((unsigned short *) 0x40013808) |= 0x4000;
 131              		.loc 1 45 0
 132 0040 1249     		ldr	r1, .L6+8
 133 0042 124B     		ldr	r3, .L6+8
 134 0044 1B88     		ldrh	r3, [r3]
 135 0046 8022     		movs	r2, #128
 136 0048 D201     		lsls	r2, r2, #7
 137 004a 1343     		orrs	r3, r2
 138 004c 9BB2     		uxth	r3, r3
 139 004e 0B80     		strh	r3, [r1]
  46:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_2\startup.c **** 	
  47:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_2\startup.c **** 	// Enable exceptions on EXTI3
  48:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_2\startup.c **** 	*((unsigned int *) 0x40013C00) |= (1<<3);
 140              		.loc 1 48 0
 141 0050 0F4B     		ldr	r3, .L6+12
 142 0052 0F4A     		ldr	r2, .L6+12
 143 0054 1268     		ldr	r2, [r2]
 144 0056 0821     		movs	r1, #8
 145 0058 0A43     		orrs	r2, r1
 146 005a 1A60     		str	r2, [r3]
  49:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_2\startup.c **** 	
  50:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_2\startup.c **** 	// Enable trigger on negative flank on EXTI3
  51:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_2\startup.c **** 	*((unsigned int *) 0x40013C0C) |= (1<<3);
 147              		.loc 1 51 0
 148 005c 0D4B     		ldr	r3, .L6+16
 149 005e 0D4A     		ldr	r2, .L6+16
 150 0060 1268     		ldr	r2, [r2]
 151 0062 0821     		movs	r1, #8
 152 0064 0A43     		orrs	r2, r1
 153 0066 1A60     		str	r2, [r3]
  52:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_2\startup.c **** 	
  53:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_2\startup.c **** 	// Set interrupt handler
  54:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_2\startup.c **** 	*((void (**) (void)) 0x2001C064) = interrupt_handler;
 154              		.loc 1 54 0
 155 0068 0B4B     		ldr	r3, .L6+20
 156 006a 0C4A     		ldr	r2, .L6+24
 157 006c 1A60     		str	r2, [r3]
  55:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_2\startup.c **** 	
  56:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_2\startup.c **** 	//Enable PE3 in NVIC
  57:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_2\startup.c **** 	*((unsigned int *) 0xE000E100) |= (1<<9);
 158              		.loc 1 57 0
 159 006e 0C4B     		ldr	r3, .L6+28
 160 0070 0B4A     		ldr	r2, .L6+28
 161 0072 1268     		ldr	r2, [r2]
 162 0074 8021     		movs	r1, #128
 163 0076 8900     		lsls	r1, r1, #2
 164 0078 0A43     		orrs	r2, r1
 165 007a 1A60     		str	r2, [r3]
  58:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_2\startup.c **** 
  59:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_2\startup.c **** 	
  60:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_2\startup.c **** }
 166              		.loc 1 60 0
 167 007c C046     		nop
 168 007e BD46     		mov	sp, r7
 169              		@ sp needed
 170 0080 80BD     		pop	{r7, pc}
 171              	.L7:
 172 0082 C046     		.align	2
 173              	.L6:
 174 0084 000C0240 		.word	1073875968
 175 0088 55550000 		.word	21845
 176 008c 08380140 		.word	1073821704
 177 0090 003C0140 		.word	1073822720
 178 0094 0C3C0140 		.word	1073822732
 179 0098 64C00120 		.word	536985700
 180 009c 00000000 		.word	interrupt_handler
 181 00a0 00E100E0 		.word	-536813312
 182              		.cfi_endproc
 183              	.LFE2:
 185              		.align	1
 186              		.global	main
 187              		.syntax unified
 188              		.code	16
 189              		.thumb_func
 190              		.fpu softvfp
 192              	main:
 193              	.LFB3:
  61:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_2\startup.c **** 
  62:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_2\startup.c **** void main(void) {
 194              		.loc 1 62 0
 195              		.cfi_startproc
 196              		@ args = 0, pretend = 0, frame = 0
 197              		@ frame_needed = 1, uses_anonymous_args = 0
 198 00a4 80B5     		push	{r7, lr}
 199              		.cfi_def_cfa_offset 8
 200              		.cfi_offset 7, -8
 201              		.cfi_offset 14, -4
 202 00a6 00AF     		add	r7, sp, #0
 203              		.cfi_def_cfa_register 7
  63:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_2\startup.c **** 	init();
 204              		.loc 1 63 0
 205 00a8 FFF7FEFF 		bl	init
 206              	.L9:
  64:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_2\startup.c **** 	while(1) {
  65:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_2\startup.c **** 		portD->odr_low = count;
 207              		.loc 1 65 0 discriminator 1
 208 00ac 074A     		ldr	r2, .L10
 209 00ae 084B     		ldr	r3, .L10+4
 210 00b0 1B68     		ldr	r3, [r3]
 211 00b2 9BB2     		uxth	r3, r3
 212 00b4 9382     		strh	r3, [r2, #20]
  66:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_2\startup.c **** 		portD->odr_low = count;
 213              		.loc 1 66 0 discriminator 1
 214 00b6 054A     		ldr	r2, .L10
 215 00b8 054B     		ldr	r3, .L10+4
 216 00ba 1B68     		ldr	r3, [r3]
 217 00bc 9BB2     		uxth	r3, r3
 218 00be 9382     		strh	r3, [r2, #20]
  67:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_2\startup.c **** 		portD->odr_low = count;
 219              		.loc 1 67 0 discriminator 1
 220 00c0 024A     		ldr	r2, .L10
 221 00c2 034B     		ldr	r3, .L10+4
 222 00c4 1B68     		ldr	r3, [r3]
 223 00c6 9BB2     		uxth	r3, r3
 224 00c8 9382     		strh	r3, [r2, #20]
  65:C:/Users/Hampus/Desktop/DAT017/CodeLite/flipflop_irq_2\startup.c **** 		portD->odr_low = count;
 225              		.loc 1 65 0 discriminator 1
 226 00ca EFE7     		b	.L9
 227              	.L11:
 228              		.align	2
 229              	.L10:
 230 00cc 000C0240 		.word	1073875968
 231 00d0 00000000 		.word	count
 232              		.cfi_endproc
 233              	.LFE3:
 235              	.Letext0:
