#ifndef TIMER_H
#define TIMER_H
// Timer setup
#define STK 0xE000E010
#define STK_CTRL ((volatile unsigned int *) (STK))
#define STK_LOAD ((volatile unsigned int *) (STK + 0x4))
#define STK_VAL ((volatile unsigned int *) (STK + 0x8))
#define SIMULATOR
void delay_250ns(void);

void delay_mikro(unsigned int us);

void delay_milli(unsigned int ms);

void delay_500ns(void);


#endif