/*
 * 	startup.c
 *
 */
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

typedef struct {
	volatile unsigned int moder;
	volatile unsigned int ostyper;
	volatile unsigned int ospeedr;
	volatile unsigned int pupdr;
	volatile unsigned short idr_low;
	volatile unsigned short idr_high;
	volatile unsigned short odr_low;
	volatile unsigned short odr_high;

} GPIO;

#define portD ((GPIO*) 0x40020C00)

unsigned int count = 0;

void interrupt_handler() {
	count++;
	*((unsigned int *) 0x40013C14) |= (1<<3);
}


void init() {
	// Set port D_low as output
	portD->moder = 0x5555;
	
	// Set exception line for PE3 to EXTI3
	*((unsigned int *) 0x40013808) &= 0x0FFF;
	*((unsigned int *) 0x40013808) |= 0x4000;
	
	// Enable exceptions on EXTI3
	*((unsigned int *) 0x40013C00) |= (1<<3);
	
	// Enable trigger on negative flank on EXTI3
	*((unsigned int *) 0x40013C0C) |= (1<<3);
	
	// Set interrupt handler
	*((void (**) (void)) 0x2001C064) = interrupt_handler;
	
	//Enable PE3 in NVIC
	*((unsigned int *) 0xE000E100) |= (1<<9);

	
}

void main(void) {
	init();
	while(1) {
		portD->odr_low = count;
		portD->odr_low = count;
		portD->odr_low = count;
	}
}

