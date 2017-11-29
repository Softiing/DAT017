#include "timer.h"
#include "graphic.h"
#include "ball.h"

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

extern OBJECT ball;

void main(void) {
	POBJECT p = &ball;
	init_app();
	graphic_initalize();
  #ifndef SIMULATOR
	graphic_clear_screen();
  #endif
  
	p->set_speed(p, 4, 4);
	while(1) {
		p->move(p);
		delay_milli(40);
	}
}

