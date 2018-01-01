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
	volatile unsigned int ctrl;
	volatile unsigned int load;
	volatile unsigned int val;
} SysTick;

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

// Define systick & port D
#define STK ((SysTick*) 0xE000E010)
#define portD ((GPIO*) 0x40020C00)

unsigned char flag = 0;

void systick_irq_handler() {
	flag = 1;
	STK->ctrl &= ~1;
}

void init() {
	portD->moder = 0x55555555;
	*((void (**) (void)) 0x2001C03C) = systick_irq_handler;
}

void delay(unsigned int count) {
	STK->ctrl &= ~1;
	STK->val = 0;
	STK->load = 41 * count; //168*10^6 * 250 * 10^-9 = 168 * 250 * 10^-3 = 42
	STK->ctrl |= (1<<1);
	STK->ctrl |= 1;	
}

void main(void) {
	init();
	portD->odr_low = 0;
	delay(4000);
	while(1) {
		if(flag) {
			portD->odr_low = ~portD->odr_low; 
			flag = 0;
			delay(4000);
		}
	}
}

