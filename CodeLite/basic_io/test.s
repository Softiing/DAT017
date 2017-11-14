   1              		.file	"startup.c"
   2              		.text
   3              	.Ltext0:
   4              		.cfi_sections	.debug_frame
   5              		.section	.start_section,"x"
   6              		.globl	startup
   8              		.seh_proc	startup
   9              	startup:
  10              	.LFB0:
  11              		.file 1 "C:/Users/Hampus/Desktop/DAT017/CodeLite/basic_io/startup.c"
   1:C:/Users/Hampus/Desktop/DAT017/CodeLite/basic_io\startup.c **** /*
   2:C:/Users/Hampus/Desktop/DAT017/CodeLite/basic_io\startup.c ****  * 	startup.c
   3:C:/Users/Hampus/Desktop/DAT017/CodeLite/basic_io\startup.c ****  *
   4:C:/Users/Hampus/Desktop/DAT017/CodeLite/basic_io\startup.c ****  */
   5:C:/Users/Hampus/Desktop/DAT017/CodeLite/basic_io\startup.c **** void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );
   6:C:/Users/Hampus/Desktop/DAT017/CodeLite/basic_io\startup.c **** 
   7:C:/Users/Hampus/Desktop/DAT017/CodeLite/basic_io\startup.c **** void startup ( void )
   8:C:/Users/Hampus/Desktop/DAT017/CodeLite/basic_io\startup.c **** {
  12              		.loc 1 8 0
  13              		.cfi_startproc
  14 ???? 55       		pushq	%rbp
  15              		.seh_pushreg	%rbp
  16              		.cfi_def_cfa_offset 16
  17              		.cfi_offset 6, -16
  18 ???? 4889E5   		movq	%rsp, %rbp
  19              		.seh_setframe	%rbp, 0
  20              		.cfi_def_cfa_register 6
  21              		.seh_endprologue
   9:C:/Users/Hampus/Desktop/DAT017/CodeLite/basic_io\startup.c **** __asm volatile(
  22              		.loc 1 9 0
  23              	/APP
  24              	 # 9 "C:/Users/Hampus/Desktop/DAT017/CodeLite/basic_io/startup.c" 1
  25              		 LDR R0,=0x2001C000
  26              	 MOV SP,R0
  27              	 BL main
  28              	_exit: B .
  29              	
  30              	 # 0 "" 2
  10:C:/Users/Hampus/Desktop/DAT017/CodeLite/basic_io\startup.c **** 	" LDR R0,=0x2001C000\n"		/* set stack */
  11:C:/Users/Hampus/Desktop/DAT017/CodeLite/basic_io\startup.c **** 	" MOV SP,R0\n"
  12:C:/Users/Hampus/Desktop/DAT017/CodeLite/basic_io\startup.c **** 	" BL main\n"				/* call main */
  13:C:/Users/Hampus/Desktop/DAT017/CodeLite/basic_io\startup.c **** 	"_exit: B .\n"				/* never return */
  14:C:/Users/Hampus/Desktop/DAT017/CodeLite/basic_io\startup.c **** 	) ;
  15:C:/Users/Hampus/Desktop/DAT017/CodeLite/basic_io\startup.c **** }
  31              		.loc 1 15 0
  32              	/NO_APP
  33 ???? 5D       		popq	%rbp
  34              		.cfi_restore 6
  35              		.cfi_def_cfa 7, 8
  36 ???? C3       		ret
  37              		.cfi_endproc
  38              	.LFE0:
  39              		.seh_endproc
  40 ???? 9090     		.text
  41              		.globl	app_init
  43              		.seh_proc	app_init
  44              	app_init:
  45              	.LFB1:
  16:C:/Users/Hampus/Desktop/DAT017/CodeLite/basic_io\startup.c **** 
  17:C:/Users/Hampus/Desktop/DAT017/CodeLite/basic_io\startup.c **** void app_init(void) {
  46              		.loc 1 17 0
  47              		.cfi_startproc
  48 ???? 55       		pushq	%rbp
  49              		.seh_pushreg	%rbp
  50              		.cfi_def_cfa_offset 16
  51              		.cfi_offset 6, -16
  52 ???? 4889E5   		movq	%rsp, %rbp
  53              		.seh_setframe	%rbp, 0
  54              		.cfi_def_cfa_register 6
  55              		.seh_endprologue
  18:C:/Users/Hampus/Desktop/DAT017/CodeLite/basic_io\startup.c ****     *((unsigned long *) 0x40020C00) = 0x00005555;
  56              		.loc 1 18 0
  57 ???? B8000C02 		movl	$1073875968, %eax
  57      40
  58 ???? C7005555 		movl	$21845, (%rax)
  58      0000
  19:C:/Users/Hampus/Desktop/DAT017/CodeLite/basic_io\startup.c **** }
  59              		.loc 1 19 0
  60 ???? 5D       		popq	%rbp
  61              		.cfi_restore 6
  62              		.cfi_def_cfa 7, 8
  63 ???? C3       		ret
  64              		.cfi_endproc
  65              	.LFE1:
  66              		.seh_endproc
  68              		.globl	main
  70              		.seh_proc	main
  71              	main:
  72              	.LFB2:
  20:C:/Users/Hampus/Desktop/DAT017/CodeLite/basic_io\startup.c **** 
  21:C:/Users/Hampus/Desktop/DAT017/CodeLite/basic_io\startup.c **** void main(void) {
  73              		.loc 1 21 0
  74              		.cfi_startproc
  75 ???? 55       		pushq	%rbp
  76              		.seh_pushreg	%rbp
  77              		.cfi_def_cfa_offset 16
  78              		.cfi_offset 6, -16
  79 ???? 4889E5   		movq	%rsp, %rbp
  80              		.seh_setframe	%rbp, 0
  81              		.cfi_def_cfa_register 6
  82 ???? 4883EC30 		subq	$48, %rsp
  83              		.seh_stackalloc	48
  84              		.seh_endprologue
  85              		.loc 1 21 0
  86 ???? E81A0000 		call	__main
  86      00
  22:C:/Users/Hampus/Desktop/DAT017/CodeLite/basic_io\startup.c ****     unsigned char c;
  23:C:/Users/Hampus/Desktop/DAT017/CodeLite/basic_io\startup.c ****     app_init();
  87              		.loc 1 23 0
  88 ???? E8DDFFFF 		call	app_init
  88      FF
  89              	.L4:
  24:C:/Users/Hampus/Desktop/DAT017/CodeLite/basic_io\startup.c ****     while(1) {
  25:C:/Users/Hampus/Desktop/DAT017/CodeLite/basic_io\startup.c ****         c = (unsigned char) * ((unsigned short *) 0x40021010);
  90              		.loc 1 25 0 discriminator 1
  91 ???? B8101002 		movl	$1073877008, %eax
  91      40
  92 ???? 0FB700   		movzwl	(%rax), %eax
  93 ???? 8845FF   		movb	%al, -1(%rbp)
  26:C:/Users/Hampus/Desktop/DAT017/CodeLite/basic_io\startup.c ****         * ((unsigned char *) 0x40020C14) = c;
  94              		.loc 1 26 0 discriminator 1
  95 ???? BA140C02 		movl	$1073875988, %edx
  95      40
  96 ???? 0FB645FF 		movzbl	-1(%rbp), %eax
  97 ???? 8802     		movb	%al, (%rdx)
  27:C:/Users/Hampus/Desktop/DAT017/CodeLite/basic_io\startup.c ****     }
  98              		.loc 1 27 0 discriminator 1
  99 ???? EBE8     		jmp	.L4
 100              		.cfi_endproc
 101              	.LFE2:
 102              		.seh_endproc
 103              	.Letext0:
 104 ???? 90909090 		.section	.debug_info,"dr"
 104      90
 105              	.Ldebug_info0:
 106 ???? 05010000 		.long	0x105
 107 ???? 0400     		.word	0x4
 108 ???? 00000000 		.secrel32	.Ldebug_abbrev0
 109 ???? 08       		.byte	0x8
 110 ???? 01       		.uleb128 0x1
 111 ???? 474E5520 		.ascii "GNU C 4.9.2 -mtune=generic -march=x86-64 -g -O0 -std=c99\0"
 111      4320342E 
 111      392E3220 
 111      2D6D7475 
 111      6E653D67 
 112 ???? 01       		.byte	0x1
 113 ???? 433A2F55 		.ascii "C:/Users/Hampus/Desktop/DAT017/CodeLite/basic_io/startup.c\0"
 113      73657273 
 113      2F48616D 
 113      7075732F 
 113      4465736B 
 114 ???? 00000000 		.secrel32	.Ldebug_ranges0+0
 115 ???? 00000000 		.quad	0
 115      00000000 
 116 ???? 00000000 		.secrel32	.Ldebug_line0
 117 ???? 02       		.uleb128 0x2
 118 ???? 73746172 		.ascii "startup\0"
 118      74757000 
 119 ???? 01       		.byte	0x1
 120 ???? 07       		.byte	0x7
 121 ???? 00000000 		.quad	.LFB0
 121      00000000 
 122 ???? 06000000 		.quad	.LFE0-.LFB0
 122      00000000 
 123 ???? 01       		.uleb128 0x1
 124 ???? 9C       		.byte	0x9c
 125 ???? 02       		.uleb128 0x2
 126 ???? 6170705F 		.ascii "app_init\0"
 126      696E6974 
 126      00
 127 ???? 01       		.byte	0x1
 128 ???? 11       		.byte	0x11
 129 ???? 00000000 		.quad	.LFB1
 129      00000000 
 130 ???? 11000000 		.quad	.LFE1-.LFB1
 130      00000000 
 131 ???? 01       		.uleb128 0x1
 132 ???? 9C       		.byte	0x9c
 133 ???? 03       		.uleb128 0x3
 134 ???? 6D61696E 		.ascii "main\0"
 134      00
 135 ???? 01       		.byte	0x1
 136 ???? 15       		.byte	0x15
 137 ???? 11000000 		.quad	.LFB2
 137      00000000 
 138 ???? 2A000000 		.quad	.LFE2-.LFB2
 138      00000000 
 139 ???? 01       		.uleb128 0x1
 140 ???? 9C       		.byte	0x9c
 141 ???? F7000000 		.long	0xf7
 142 ???? 04       		.uleb128 0x4
 143 ???? 6300     		.ascii "c\0"
 144 ???? 01       		.byte	0x1
 145 ???? 16       		.byte	0x16
 146 ???? F7000000 		.long	0xf7
 147 ???? 02       		.uleb128 0x2
 148 ???? 91       		.byte	0x91
 149 ???? 6F       		.sleb128 -17
 150 ???? 00       		.byte	0
 151 ???? 05       		.uleb128 0x5
 152 ???? 01       		.byte	0x1
 153 ???? 08       		.byte	0x8
 154 ???? 756E7369 		.ascii "unsigned char\0"
 154      676E6564 
 154      20636861 
 154      7200
 155 ???? 00       		.byte	0
 156              		.section	.debug_abbrev,"dr"
 157              	.Ldebug_abbrev0:
 158 ???? 01       		.uleb128 0x1
 159 ???? 11       		.uleb128 0x11
 160 ???? 01       		.byte	0x1
 161 ???? 25       		.uleb128 0x25
 162 ???? 08       		.uleb128 0x8
 163 ???? 13       		.uleb128 0x13
 164 ???? 0B       		.uleb128 0xb
 165 ???? 03       		.uleb128 0x3
 166 ???? 08       		.uleb128 0x8
 167 ???? 55       		.uleb128 0x55
 168 ???? 17       		.uleb128 0x17
 169 ???? 11       		.uleb128 0x11
 170 ???? 01       		.uleb128 0x1
 171 ???? 10       		.uleb128 0x10
 172 ???? 17       		.uleb128 0x17
 173 ???? 00       		.byte	0
 174 ???? 00       		.byte	0
 175 ???? 02       		.uleb128 0x2
 176 ???? 2E       		.uleb128 0x2e
 177 ???? 00       		.byte	0
 178 ???? 3F       		.uleb128 0x3f
 179 ???? 19       		.uleb128 0x19
 180 ???? 03       		.uleb128 0x3
 181 ???? 08       		.uleb128 0x8
 182 ???? 3A       		.uleb128 0x3a
 183 ???? 0B       		.uleb128 0xb
 184 ???? 3B       		.uleb128 0x3b
 185 ???? 0B       		.uleb128 0xb
 186 ???? 27       		.uleb128 0x27
 187 ???? 19       		.uleb128 0x19
 188 ???? 11       		.uleb128 0x11
 189 ???? 01       		.uleb128 0x1
 190 ???? 12       		.uleb128 0x12
 191 ???? 07       		.uleb128 0x7
 192 ???? 40       		.uleb128 0x40
 193 ???? 18       		.uleb128 0x18
 194 ???? 9742     		.uleb128 0x2117
 195 ???? 19       		.uleb128 0x19
 196 ???? 00       		.byte	0
 197 ???? 00       		.byte	0
 198 ???? 03       		.uleb128 0x3
 199 ???? 2E       		.uleb128 0x2e
 200 ???? 01       		.byte	0x1
 201 ???? 3F       		.uleb128 0x3f
 202 ???? 19       		.uleb128 0x19
 203 ???? 03       		.uleb128 0x3
 204 ???? 08       		.uleb128 0x8
 205 ???? 3A       		.uleb128 0x3a
 206 ???? 0B       		.uleb128 0xb
 207 ???? 3B       		.uleb128 0x3b
 208 ???? 0B       		.uleb128 0xb
 209 ???? 27       		.uleb128 0x27
 210 ???? 19       		.uleb128 0x19
 211 ???? 11       		.uleb128 0x11
 212 ???? 01       		.uleb128 0x1
 213 ???? 12       		.uleb128 0x12
 214 ???? 07       		.uleb128 0x7
 215 ???? 40       		.uleb128 0x40
 216 ???? 18       		.uleb128 0x18
 217 ???? 9642     		.uleb128 0x2116
 218 ???? 19       		.uleb128 0x19
 219 ???? 01       		.uleb128 0x1
 220 ???? 13       		.uleb128 0x13
 221 ???? 00       		.byte	0
 222 ???? 00       		.byte	0
 223 ???? 04       		.uleb128 0x4
 224 ???? 34       		.uleb128 0x34
 225 ???? 00       		.byte	0
 226 ???? 03       		.uleb128 0x3
 227 ???? 08       		.uleb128 0x8
 228 ???? 3A       		.uleb128 0x3a
 229 ???? 0B       		.uleb128 0xb
 230 ???? 3B       		.uleb128 0x3b
 231 ???? 0B       		.uleb128 0xb
 232 ???? 49       		.uleb128 0x49
 233 ???? 13       		.uleb128 0x13
 234 ???? 02       		.uleb128 0x2
 235 ???? 18       		.uleb128 0x18
 236 ???? 00       		.byte	0
 237 ???? 00       		.byte	0
 238 ???? 05       		.uleb128 0x5
 239 ???? 24       		.uleb128 0x24
 240 ???? 00       		.byte	0
 241 ???? 0B       		.uleb128 0xb
 242 ???? 0B       		.uleb128 0xb
 243 ???? 3E       		.uleb128 0x3e
 244 ???? 0B       		.uleb128 0xb
 245 ???? 03       		.uleb128 0x3
 246 ???? 08       		.uleb128 0x8
 247 ???? 00       		.byte	0
 248 ???? 00       		.byte	0
 249 ???? 00       		.byte	0
 250              		.section	.debug_aranges,"dr"
 251 ???? 3C000000 		.long	0x3c
 252 ???? 0200     		.word	0x2
 253 ???? 00000000 		.secrel32	.Ldebug_info0
 254 ???? 08       		.byte	0x8
 255 ???? 00       		.byte	0
 256 ???? 0000     		.word	0
 257 ???? 0000     		.word	0
 258 ???? 00000000 		.quad	.Ltext0
 258      00000000 
 259 ???? 3B000000 		.quad	.Letext0-.Ltext0
 259      00000000 
 260 ???? 00000000 		.quad	.LFB0
 260      00000000 
 261 ???? 06000000 		.quad	.LFE0-.LFB0
 261      00000000 
 262 ???? 00000000 		.quad	0
 262      00000000 
 263 ???? 00000000 		.quad	0
 263      00000000 
 264              		.section	.debug_ranges,"dr"
 265              	.Ldebug_ranges0:
 266 ???? 00000000 		.quad	.Ltext0
 266      00000000 
 267 ???? 3B000000 		.quad	.Letext0
 267      00000000 
 268 ???? 00000000 		.quad	.LFB0
 268      00000000 
 269 ???? 06000000 		.quad	.LFE0
 269      00000000 
 270 ???? 00000000 		.quad	0
 270      00000000 
 271 ???? 00000000 		.quad	0
 271      00000000 
 272              		.section	.debug_line,"dr"
 273              	.Ldebug_line0:
 274 ???? 91000000 		.section	.debug_str,"dr"
 274      02005100 
 274      00000101 
 274      FB0E0D00 
 274      01010101 
 275              		.ident	"GCC: (tdm64-1) 4.9.2"
