// Timer setup
#define STK 0xE000E010
#define STK_CTRL ((volatile unsigned int *) (STK))
#define STK_LOAD ((volatile unsigned int *) (STK + 0x4))
#define STK_VAL ((volatile unsigned int *) (STK + 0x8))

void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );

void startup ( void )
{
__asm volatile(
	" LDR R0,=0x2001C000\n"		/* set stack */
	" MOV SP,R0\n"
	" BL main\n"				/* call main */
	"_exit: B .\n"				/* never return */
	) ;
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

void delay_500ns(void) {
	delay_250ns();
	delay_250ns();
}

void main(void)
{
}

