#include "timer.h"
#include "graphic.h"
#include "ball.h"
#include "paddle.h"

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
	*GPIO_E_MODER = 0x55555555;
}

extern OBJECT ball;
extern OBJECT leftPaddle;
extern OBJECT rightPaddle;

void main(void) {
	POBJECT p = &ball;
	POBJECT pl = &leftPaddle;
	POBJECT pr = &rightPaddle;
	init_app();
	graphic_initialize();
  #ifndef SIMULATOR
	graphic_clear_screen();
  #endif
  
	p->set_speed(p, 16, 16);
	p->set_speed(pl, 0, 1);
	p->set_speed(pr, 0, 1);
	while(1) {
		p->move(p);
		pl->move(pl);
		pr->move(pr);
		delay_milli(50);
	}
}

