#include "timer.h"
#include "graphic.h"
#include "ball.h"
#include "paddle.h"
#include "keypad.h"
#include "GPIOE.h"
#include "asciidisplay.h"


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
	// Setup display
	*GPIO_E_MODER = 0x55555555;
	
	// Setup for keypad
	*GPIO_D_MODER = 0x55000000;
	*GPIO_D_OTYPER &= 0x0000FFFF;   
	*GPIO_D_OTYPER |= 0x00000000;     
	*GPIO_D_PUPDR = 0x00AA0000;    
}


// Reference all game objects
extern OBJECT ball;
extern OBJECT leftPaddle;
extern OBJECT rightPaddle;

void main(void) {
	// Load all game objects
	POBJECT p = &ball;
	POBJECT pl = &leftPaddle;
	POBJECT pr = &rightPaddle;
	
	init_app();
	graphic_initialize();
  #ifndef SIMULATOR
	graphic_clear_screen();
  #endif
	
	// Init asciidisplay
	ascii_init();
	graphics_ctrl_bit_clear(B_SELECT);
	
	// Set speed for ball
	p->set_speed(p, 4, 4);
	
	// Game loop
	while(1) {
		// Update from keypad
		unsigned char *pressedKeys = keyb();
		pl->set_speed(pl,0,0);
		pr->set_speed(pr,0,0);
		for(unsigned char i = 0; i < 4; i++) {
			switch(pressedKeys[i]) {
				case 0x01: pl->set_speed(pl,0,-5); break;
				case 0x04: pl->set_speed(pl,0,5); break;
				case 0x0C: pr->set_speed(pr,0,-5); break;
				case 0x0D: pr->set_speed(pr,0,5); break;
			}
		}
		
		// Move game objects
		p->move(p);
		pl->move(pl);
		pr->move(pr);
		delay_milli(30);
	}
}

