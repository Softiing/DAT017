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

#ifdef SIMULATOR
#define DELAY_COUNT 100
#else
#define DELAY_COUNT 1000000
#endif

volatile char systick_flag = 0;

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

void systick_irq_handler(void) {
	systick_flag = 1;
}

void init_app(void) {
	*GPIO_MODER &= 0xFFFF0000;
	*GPIO_MODER |= 0x00005555;
	*((void(**)(void)) 0x2001C03C ) = systick_irq_handler;
}

//void delay_250ns(void) {
//	*STK_CTRL = 0;
//	*STK_LOAD = 49; //  48 + 1. Have to add one as said in manual
//	*STK_VAL = 0;
//	*STK_CTRL = 5;
////	while((*STK_CTRL & 0x10000) == 0) {
////		// Do nothing :S
////	}
//}

void delay_1micro() {
	systick_flag = 0;
	*STK_CTRL = 0;
	*STK_LOAD = 192; //  48 * 4. 48 is 250ns
	*STK_VAL = 0;
	*STK_CTRL = 7; // Enable interrupts by setting bit 1 to 1.
}

void delay(unsigned int count) {
	systick_flag = 0;
	*STK_CTRL = 0;
	*STK_LOAD = 192*count; //  48 * 4. 48 is 250ns
	*STK_VAL = 0;
	*STK_CTRL = 7; // Enable interrupts by setting bit 1 to 1.
//	for(int i = 0; i < count; i++) {
//		delay_1micro();
//		while(!systick_flag) {
//			//Wait
//		}
//	}
}

void main(void) {
	init_app();
	*GPIO_ODR_LOW = 0;
	delay(1000);
	*GPIO_ODR_LOW = 0xFF;
	while(1) {
		if(systick_flag) {
			break;
		}
	}
	*GPIO_ODR_LOW = 0;
}

