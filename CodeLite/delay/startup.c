#define STK 0xE000E010
#define STK_CTRL ((volatile unsigned int *) (STK))
#define STK_LOAD ((volatile unsigned int *) (STK + 0x4))
#define STK_VAL ((volatile unsigned int *) (STK + 0x8))

#define GPIO_E 0x40021000
#define GPIO_MODER ((volatile unsigned int *) (GPIO_E))
#define GPIO_OTYPER ((volatile unsigned short *) (GPIO_E+0x4))
#define GPIO_PUPDR ((volatile unsigned int *) (GPIO_E+0xC))
#define GPIO_IDR_LOW ((volatile unsigned char *) (GPIO_E+0x10))
#define GPIO_IDR_HIGH ((volatile unsigned char *) (GPIO_E+0x11))
#define GPIO_ODR_LOW ((volatile unsigned char *) (GPIO_E+0x14))
#define GPIO_ODR_HIGH ((volatile unsigned char *) (GPIO_E+0x15))

/*
 * 	startup.c
 *
 */
void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );

void startup ( void ) {
__asm volatile(
	" LDR R0,=0x2001C000\n"		/* set stack */
	" MOV SP,R0\n"
	" BL main\n"				/* call main */
	"_exit: B .\n"				/* never return */
	) ;
}

void init_app(void) {
	// Setup output pins for barograph
	*GPIO_MODER &= 0xFFFF0000;
	*GPIO_MODER |= 0x00005555;
	
	*GPIO_OTYPER &= 0xFF00;
	*GPIO_OTYPER |= 0x0077;
	
	*GPIO_PUPDR &= 0xFFFF0000;
	*GPIO_PUPDR |= 0x0000AAAA;
}

void delay_250ns(void) {
	*STK_CTRL = 0;
	*STK_LOAD = 49; //  48 + 1. Have to add one as said in manual
	*STK_VAL = 0;
	*STK_CTRL = 5;
	while((*STK_CTRL & 0x10000) == 0) {
		// Do nothing :S
	}
	*STK_CTRL = 0;
}

void delay_mikro(unsigned int us) {
	while(us--) {
		delay_250ns();
		delay_250ns();
		delay_250ns();
		delay_250ns();
	}
}

void delay_milli(unsigned int ms) {
	#ifdef SIMULATOR
		delay_mikro(ms);
	#else
		delay_mikro(1000 * ms)
	#endif
}

void main(void) {
	init_app();
	while(1) {
		*GPIO_ODR_LOW = 0;
		delay_milli(500);
		*GPIO_ODR_LOW = 0xFF;
		delay_milli(500);
	}
}

