// Timer setup
#define STK 0xE000E010
#define STK_CTRL ((volatile unsigned int *) (STK))
#define STK_LOAD ((volatile unsigned int *) (STK + 0x4))
#define STK_VAL ((volatile unsigned int *) (STK + 0x8))

// Port E setup
#define GPIO_E 0x40021000
#define GPIO_MODER ((volatile unsigned int *) (GPIO_E))
#define GPIO_OTYPER ((volatile unsigned short *) (GPIO_E+0x4))
#define GPIO_PUPDR ((volatile unsigned int *) (GPIO_E+0xC))
#define GPIO_IDR_LOW ((volatile unsigned char *) (GPIO_E+0x10))
#define GPIO_IDR_HIGH ((volatile unsigned char *) (GPIO_E+0x11))
#define GPIO_ODR_LOW ((volatile unsigned char *) (GPIO_E+0x14))
#define GPIO_ODR_HIGH ((volatile unsigned char *) (GPIO_E+0x15))

// Control for display
#define B_E 0x40
#define B_SELECT 0x04
#define B_RW 0x02
#define B_RS 0x01

#define B_RST 0x20
#define B_CS2 0x10
#define B_CS1 0x08

typedef unsigned char uint8_t;

void startup(void) __attribute__((naked)) __attribute__((section (".start_section")) );

void startup ( void )
{
__asm volatile(
	" LDR R0,=0x2001C000\n"		/* set stack */
	" MOV SP,R0\n"
	" BL main\n"				/* call main */
	"_exit: B .\n"				/* never return */
	) ;
	
	// Setup output pins for display
	*GPIO_MODER = 0x55555555;
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
		delay_mikro(1000 * ms);
	#endif
}

void delay_500ns(void) {
	delay_250ns();
	delay_250ns();
}

void graphic_ctrl_bit_set(uint8_t x) {
    *GPIO_ODR_LOW |= (x & ~B_SELECT);
}

void graphic_ctrl_bit_clear(uint8_t x) {
    *GPIO_ODR_LOW &= ~x;
}

void select_cotroller(uint8_t controller) {
	if(controller == 0) {
		graphic_ctrl_bit_clear(B_CS1);
		graphic_ctrl_bit_clear(B_CS2);
	} else if(controller == B_CS1 | B_CS2) {
		graphic_ctrl_bit_set(B_CS1);
		graphic_ctrl_bit_set(B_CS2);
	} else if(controller == B_CS1) {
		graphic_ctrl_bit_set(B_CS1);
		graphic_ctrl_bit_clear(B_CS2);
	} else if(controller == B_CS2) {
		graphic_ctrl_bit_clear(B_CS1);
		graphic_ctrl_bit_set(B_CS2);
	}
}

void graphic_wait_ready() {
	graphic_ctrl_bit_clear(B_E);
	*GPIO_MODER = 0x00005555;
	graphic_ctrl_bit_clear(B_RS);
	graphic_ctrl_bit_set(B_RW);
	delay_500ns;
	while(*GPIO_IDR_HIGH & 0x80) { // Wait for display not to be busy
		graphic_ctrl_bit_set(B_E);
		delay_500ns();
		graphic_ctrl_bit_clear(B_E);
		delay_500ns();		
	}
	graphic_ctrl_bit_set(B_E);
	*GPIO_MODER = 0x55555555;
}

char graphic_read(unsigned int controller) {
	graphic_ctrl_bit_clear(B_E);
	*GPIO_MODER = 0x00005555;
	graphic_ctrl_bit_set(B_RS);
	graphic_ctrl_bit_set(B_RW);
	select_cotroller(controller);
	delay_500ns();
	graphic_ctrl_bit_set(B_E);
	delay_500ns();
	char RV = *GPIO_IDR_HIGH;
	graphic_ctrl_bit_clear(B_E);
	*GPIO_MODER = 0x55555555;
	if(controller == B_CS1) {
		select_cotroller(B_CS1);
		graphic_wait_ready();
	} else if(controller == B_CS2) {
		select_cotroller(B_CS2);
		graphic_wait_ready();
	}
	return RV;
}

void graphic_write(unsigned char value, unsigned int controller) {
	*GPIO_ODR_HIGH = value;
	select_cotroller(controller);
	delay_500ns();
	graphic_ctrl_bit_set(B_E);
	delay_500ns();
	graphic_ctrl_bit_clear(B_E);
	
	//Kanske inte ska vara så här för this statement
	if(controller | B_CS1) {
		select_cotroller(B_CS1);
		graphic_wait_ready();
	}
	
	if(controller | B_CS2) {
		select_cotroller(B_CS2);
		graphic_wait_ready();
	}
	
	*GPIO_ODR_HIGH = 0;
	graphic_ctrl_bit_set(B_E);
	select_cotroller(0);
}

void graphic_write_command(unsigned int command, unsigned int controller) {
	graphic_ctrl_bit_clear(B_E);
	select_cotroller(controller);
	graphic_ctrl_bit_clear(B_RS);
	graphic_ctrl_bit_clear(B_RW);
	graphic_write(command, controller);
}

void graphic_write_data(unsigned int data, unsigned int controller) {
	graphic_ctrl_bit_set(B_E);
	select_cotroller(controller);
	graphic_ctrl_bit_set(B_RS);
	graphic_ctrl_bit_clear(B_RW);
	graphic_write(data, controller);
}

unsigned char graphic_read_data(unsigned char controller) {
	(void) graphic_read(controller);
	return graphic_read(controller);
}


void main(void) {
}
