#define GPIO_D 0x40020C00
#define GPIO_MODER *((volatile unsigned int*) (GPIO_D))
#define GPIO_OTYPER *((volatile unsigned short*) (GPIO_D+0x4))
#define GPIO_PUPDR *((volatile unsigned int*) (GPIO_D+0xC))
#define GPIO_IDR *((volatile unsigned char*) (GPIO_D+0x10))
#define GPIO_ODR_LOW *((volatile unsigned char*) (GPIO_D+0x14))
#define GPIO_ODR_HIGH *((volatile unsigned char*) (GPIO_D+0x15))
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
	
	GPIO_MODER &= 0x0000FFFF
	GPIO_MODER |= 0x55000000
	
	GPIO_OTYPER &= 0x00FF
	GPIO_OTYPER |= 0x0F00
	
	GPIO_PUPDR &= 0xFFFF0000
	GPIO_PUPDR |= 0xAAAA0000
}

void activateRow(char row) {
	GPIO_ODR_LOW = row-1; // Tror det här blir fel eftersom vi läser av hela bit strängen som ett nummer medans vi faktist är intresserade av specifika bittar.
}

char readColumn(void) {
	return GPIO_IDR // Same as above mate
}

unsigned char keyb(void) {
	for(char row = 1; row <= 4; row++) {
		activateRow(row);
		char column = readColumn();
		if(column != 0) {
			
		}
	}
	
}

void main(void) {
	
}

