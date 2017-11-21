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

// AciiiDisplay values
#define B_E 6
#define B_SELECT 2
#define B_RW 1
#define B_RS 0


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


void init_app(void) {
	// Setup output pins for asciidisplay
	*GPIO_MODER &= 0xFFFFFFFF;
	*GPIO_MODER |= 0x55555555;
	
	*GPIO_OTYPER &= 0xFFFF;
	*GPIO_OTYPER |= 0x7777;
	
	*GPIO_PUPDR &= 0xFFFFFFFF;
	*GPIO_PUPDR |= 0xAAAAAAAA;
}

void delay_250ns(void) {
	*STK_CTRL = 0;
	*STK_VAL = 0;
	*STK_LOAD = 49; //  48 + 1. Have to add one as said in manual
	*STK_CTRL = 0x1;
	while((*STK_CTRL & 0x10000) == 0) {
		// Do nothing :S
	}
	*STK_CTRL = 0;
}

void delay_mikro(unsigned int us) {
	for(unsigned int i = 0; i < us; i++) {
		delay_250ns;
		delay_250ns;
		delay_250ns;
		delay_250ns;
	}
}

void delay_milli(unsigned int ms) {
	#ifdef SIMULATOR
		ms = ms / 1000;
		ms++;
	#endif
	
	delay_mikro(1000 * ms);	
}

void ascii_ctrl_bit_set(unsigned char x) {
	switch(x) {
		case(0): *GPIO_ODR_LOW |= 0x00000001; break;
		case(1): *GPIO_ODR_LOW |= 0x00000010; break;
		case(2): *GPIO_ODR_LOW |= 0x00000100; break;
		case(3): *GPIO_ODR_LOW |= 0x00001000; break;
		case(4): *GPIO_ODR_LOW |= 0x00010000; break;
		case(5): *GPIO_ODR_LOW |= 0x00100000; break;
		case(6): *GPIO_ODR_LOW |= 0x01000000; break;
		case(7): *GPIO_ODR_LOW |= 0x10000000; break;
	}
}

void ascii_ctrl_bit_clear(unsigned char x) {
	switch(x) {
		case(0): *GPIO_ODR_LOW &= 0x11111110; break;
		case(1): *GPIO_ODR_LOW &= 0x11111101; break;
		case(2): *GPIO_ODR_LOW &= 0x11111011; break;
		case(3): *GPIO_ODR_LOW &= 0x11110111; break;
		case(4): *GPIO_ODR_LOW &= 0x11101111; break;
		case(5): *GPIO_ODR_LOW &= 0x11011111; break;
		case(6): *GPIO_ODR_LOW &= 0x10111111; break;
		case(7): *GPIO_ODR_LOW &= 0x01111111; break;
	}
}

void ascii_write_controller(unsigned char byte) {
	ascii_ctrl_bit_set(B_E);
	*GPIO_ODR_HIGH = byte;
	delay_250ns();
	ascii_ctrl_bit_clear(B_E);
}

unsigned char ascii_read_controller() {
	ascii_ctrl_bit_set(B_E);
	delay_250ns();
	delay_250ns();
	unsigned char rv = *GPIO_IDR_HIGH;
	ascii_ctrl_bit_clear(B_E);
	return rv;
}

void ascii_write_cmd(unsigned char command) {
	ascii_ctrl_bit_set(B_RS);
	ascii_ctrl_bit_set(B_RW);
	ascii_write_controller(command);
}

void ascii_write_data(unsigned char data) {
	ascii_ctrl_bit_set(B_RS);
	ascii_ctrl_bit_clear(B_RW);
	ascii_write_controller(data);
}

unsigned char ascii_read_status(void) {
	*GPIO_MODER &= 0x0000FFFF;	
	ascii_ctrl_bit_clear(B_RS);
	ascii_ctrl_bit_set(B_RW);
	unsigned char rv = ascii_read_controller();
	*GPIO_MODER |= 0x5555FFFF;	
	return rv;
}

unsigned char ascii_read_data(void) {
	*GPIO_MODER &= 0x0000FFFF;	
	ascii_ctrl_bit_set(B_RS);
	ascii_ctrl_bit_set(B_RW);
	unsigned char rv = ascii_read_controller();
	*GPIO_MODER |= 0x5555FFFF;	
	return rv;
}

void ascii_command(char command) {
	while((ascii_read_status() & 80) == 0x80) {
		// Do nothing, wait for status flag
	}
	delay_mikro(8);
	ascii_write_cmd(1);
	delay_milli(2);
}

void ascii_init(void) {
	ascii_command(0x00111000); // Set display size and font size
    ascii_command(0x00001110); // Set display, cursor on
    ascii_command(0x00000110); // Inc, no shift
}

void ascii_write_char(unsigned char charToWrite) {
	while((ascii_read_status() & 80) == 0x80) {
	// Do nothing, wait for status flag
    }
	delay_mikro(8);
    ascii_write_data(charToWrite);
    delay_milli(2);
}

void main(void) {
	init_app();
    ascii_init();
	ascii_write_char('a');
	ascii_write_char('a');
	ascii_write_char('a');
	ascii_write_char('a');
	ascii_write_char('a');
	ascii_write_char('a');
	ascii_write_char('a');
	ascii_write_char('a');
	ascii_write_char('a');
	ascii_write_char('a');
	ascii_write_char('a');
	ascii_write_char('a');
}
