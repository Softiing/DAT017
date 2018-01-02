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
	volatile unsigned int sr;
	volatile unsigned int dr;
	volatile unsigned int brr;
	volatile unsigned int cr1;
	volatile unsigned int cr2;
	volatile unsigned int cr3;
	volatile unsigned int gtpr;
} USART;

#define USART1 ((USART*) 0x40011000)

char _tstchar() {
	if((USART1->sr & (1<<5)) == 0) {
		return 0;
	}
	return (char) USART1->dr;
}

char _outchar(char c) {
	while((USART1->sr & (1<<7)) == 0);
	USART1->dr = (unsigned short) c;
}

void _inituart() {
	USART1->brr = 0x2D9;
	USART1->cr2 = 0;
	USART1->cr1 = (1<<13) | (1<<3) | (1<<2);
	
}

void main(void) {
	char c;
	_inituart();
	while(1) {
		c = _tstchar();
		if(c) {
			_outchar(c);
		}
	}
	
}

