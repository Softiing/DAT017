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
	volatile unsigned char ctrl;
	volatile unsigned char datax;
	volatile unsigned char datay;
	volatile unsigned char posx;
	volatile unsigned char posy;
} ROBOT;

#define Robot ((volatile ROBOT*) 0x0800)

void move(int x, int y) {
	Robot->datax = x;
	Robot->datay = y;
	Robot->ctrl |= (1<<6);
	while((Robot->posx != x) && (Robot->posy != y));
	Robot->ctrl &= ~(1<<6);
}

int returnFive() {
	return 5;
}


void init() {
	move(0,0);
}

void bringHam(int (*test) (void)) {
	int i = test();
	*((void (**) (void)) 0x2000001) = init;
}


typedef void (*vfunc) (void);
typedef void (*pfunc) (unsigned char);
typedef unsigned char (*rfunc) (void);


void main(void) {
	bringHam(returnFive);
}

