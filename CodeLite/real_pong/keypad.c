#include "keypad.h"

void activateRow(unsigned int row) {
	switch(row) {
		case 0: *GPIO_D_ODR_HIGH = 0x00; break;
		case 1: *GPIO_D_ODR_HIGH = 0x10; break;
		case 2: *GPIO_D_ODR_HIGH = 0x20; break;
		case 3: *GPIO_D_ODR_HIGH = 0x40; break;
		case 4: *GPIO_D_ODR_HIGH = 0x80; break;
	}
}

unsigned char readColumn(void) {
	unsigned char idr = *GPIO_D_IDR_HIGH;
	if(idr & 0x01) return 1;
	if(idr & 0x02) return 2;
	if(idr & 0x04) return 3;
	if(idr & 0x08) return 4;
	return 0;
}

unsigned char * keyb(void) {
	unsigned char keys[] = {0x1,0x2,0x3,0xA,0x4,0x5,0x6,0xB,0x7,0x8,0x9,0xC,0xE,0x0,0xF,0xD};
	static unsigned char returnKeys[4] = {0xFF,0xFF,0xFF,0xFF};
	for(char row = 1; row <= 4; row++) {
		activateRow(row);
		delay_250ns();
		char column = readColumn();
		if(column != 0) {
			returnKeys[row-1] = keys[4 * (row - 1) + (column - 1)];
		}
	}
	activateRow(0);
	return returnKeys;
}