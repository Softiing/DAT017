#define GPIO_D 0x40020C00
#define GPIO_MODER ((volatile unsigned int *) (GPIO_D))
#define GPIO_OTYPER ((volatile unsigned short *) (GPIO_D+0x4))
#define GPIO_PUPDR ((volatile unsigned int *) (GPIO_D+0xC))
#define GPIO_IDR_LOW ((volatile unsigned char *) (GPIO_D+0x10))
#define GPIO_IDR_HIGH ((volatile unsigned char *) (GPIO_D+0x11))
#define GPIO_ODR_LOW ((volatile unsigned char *) (GPIO_D+0x14))
#define GPIO_ODR_HIGH ((volatile unsigned char *) (GPIO_D+0x15))
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

void app_init(void) {
	
	// Setup for keypad
	*GPIO_MODER &= 0x0000FFFF;
	*GPIO_MODER |= 0x55000000;
	
	*GPIO_OTYPER &= 0x00FF;
	*GPIO_OTYPER |= 0x7000;
	
	*GPIO_PUPDR &= 0x0000FFFF;
	*GPIO_PUPDR |= 0xAAAA0000;
	
	// Setup for 7 segments display
	*GPIO_MODER &= 0xFFFF0000;
	*GPIO_MODER |= 0x00005555;
	
	*GPIO_OTYPER &= 0xFF00;
	*GPIO_OTYPER |= 0x0077;
	
	*GPIO_PUPDR &= 0xFFFF0000;
	*GPIO_PUPDR |= 0x0000AAAA;
}

void activateRow(unsigned char row) {
	switch(row) {
		case 0: *GPIO_ODR_HIGH = 0x00; break;
		case 1: *GPIO_ODR_HIGH = 0x10; break;
		case 2: *GPIO_ODR_HIGH = 0x20; break;
		case 3: *GPIO_ODR_HIGH = 0x40; break;
		case 4: *GPIO_ODR_HIGH = 0x80; break;
	}
}

unsigned char readColumn(void) {
	unsigned char idr = *GPIO_IDR_HIGH;
	if(idr == 0x01) return 1;
	if(idr == 0x02) return 2;
	if(idr == 0x04) return 3;
	if(idr == 0x08) return 4;
	return 0;
}

unsigned char keyb(void) {
	unsigned char keys[] = {0x1,0x2,0x3,0xA,0x4,0x5,0x6,0xB,0x7,0x8,0x9,0xC,0xE,0x0,0xF,0xD};
	for(char row = 1; row <= 4; row++) {
		activateRow(row);
		char column = readColumn();
		if(column != 0) {
			activateRow(0);
			return keys[4 * (row - 1) + (column - 1)];
		}
	}
	activateRow(0);
	return 0xFF;
}

unsigned char updateDisplay(unsigned char key) {
	if(key == 0x0) *GPIO_ODR_LOW = 0x3F; 
	else if(key == 0x1) *GPIO_ODR_LOW = 0x06; 
	else if(key == 0x2) *GPIO_ODR_LOW = 0x5B;  
	else if(key == 0x3) *GPIO_ODR_LOW = 0x4F;  
	else if(key == 0x4) *GPIO_ODR_LOW = 0x66;  
	else if(key == 0x5) *GPIO_ODR_LOW = 0x6D;  
	else if(key == 0x6) *GPIO_ODR_LOW = 0x7D;  
	else if(key == 0x7) *GPIO_ODR_LOW = 0x07;  
	else if(key == 0x8) *GPIO_ODR_LOW = 0x7F;  
	else if(key == 0x9) *GPIO_ODR_LOW = 0x67;  
	else if(key == 0xA) *GPIO_ODR_LOW = 0x77;  
	else if(key == 0xB) *GPIO_ODR_LOW = 0xFF;  
	else if(key == 0xC) *GPIO_ODR_LOW = 0x39;  
	else if(key == 0xD) *GPIO_ODR_LOW = 0xBF;  
	else if(key == 0xE) *GPIO_ODR_LOW = 0x79;  
	else if(key == 0xF) *GPIO_ODR_LOW = 0x71;
	else *GPIO_ODR_LOW = 0x00;
}

void main(void) {
	app_init();
	while(1) {
		unsigned char i = keyb();
		updateDisplay(i);
	}
}

