#include "timer.h"
#include "graphic.h"

#define SIMULATOR

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
	*GPIO_MODER = 0x55555555;
}


void main(void) {
	unsigned char i;
	init_app();
	graphic_initalize();
  #ifndef SIMULATOR
	graphic_clear_screen();
  #endif
  
	for(i = 0; i < 128; i++) {
		pixel(i, 10, 1);
	}
	for(i = 0; i < 64; i++) {
		pixel(10, i, 1);
	}
	delay_milli(50);
	for(i = 0; i < 128; i++) {
		pixel(i, 10, 0);
	}
	for(i = 0; i < 64; i++) {
		pixel(10, i, 0);
	}

}

