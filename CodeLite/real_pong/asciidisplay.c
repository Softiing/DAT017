#include "timer.h"
#include "GPIOE.h"
#include "asciidisplay.h"

#define B_E 6
#define B_SELECT 2
#define B_RW 1
#define B_RS 0

void ascii_ctrl_bit_set(unsigned int x) {
	switch(x) {
		case 0: *GPIO_E_ODR_LOW |= 1; break;
		case 1: *GPIO_E_ODR_LOW |= 2; break;
		case 2: *GPIO_E_ODR_LOW |= 4; break;
		case 3: *GPIO_E_ODR_LOW |= 8; break;
		case 4: *GPIO_E_ODR_LOW |= 16; break;
		case 5: *GPIO_E_ODR_LOW |= 32; break;
		case 6: *GPIO_E_ODR_LOW |= 64; break;
		case 7: *GPIO_E_ODR_LOW |= 128; break;
	}
}

void ascii_ctrl_bit_clear(unsigned int x) {
	switch(x) {
		case(0): *GPIO_E_ODR_LOW &= 0xFE; break;
		case(1): *GPIO_E_ODR_LOW &= 0xFD; break;
		case(2): *GPIO_E_ODR_LOW &= 0xFB; break;
		case(3): *GPIO_E_ODR_LOW &= 0xF7; break;
		case(4): *GPIO_E_ODR_LOW &= 0xEF; break;
		case(5): *GPIO_E_ODR_LOW &= 0xDF; break;
		case(6): *GPIO_E_ODR_LOW &= 0xBF; break;
		case(7): *GPIO_E_ODR_LOW &= 0x7F; break;
	}
}

void ascii_write_controller(unsigned char byte) {
	ascii_ctrl_bit_set(B_E);
	*GPIO_E_ODR_HIGH = byte;
	delay_250ns();
	ascii_ctrl_bit_clear(B_E);
}

unsigned char ascii_read_controller() {
	ascii_ctrl_bit_set(B_E);
	delay_250ns();
	delay_250ns();
	unsigned char rv = *GPIO_E_IDR_HIGH;
	ascii_ctrl_bit_clear(B_E);
	return rv;
}

void ascii_write_cmd(unsigned char command) {
	ascii_ctrl_bit_clear(B_RS);
	ascii_ctrl_bit_clear(B_RW);
	ascii_write_controller(command);
}

void ascii_write_data(unsigned char data) {
	ascii_ctrl_bit_set(B_RS);
	ascii_ctrl_bit_clear(B_RW);
	ascii_write_controller(data);
}

unsigned char ascii_read_status(void) {
	*GPIO_E_MODER &= 0x0000FFFF;	
	ascii_ctrl_bit_clear(B_RS);
	ascii_ctrl_bit_set(B_RW);
	unsigned char rv = ascii_read_controller();
	*GPIO_E_MODER &= 0x0000FFFF;
	*GPIO_E_MODER |= 0x55550000;	
	return rv;
}

unsigned char ascii_read_data(void) {
	*GPIO_E_MODER &= 0x0000FFFF;	
	ascii_ctrl_bit_set(B_RS);
	ascii_ctrl_bit_set(B_RW);
	unsigned char rv = ascii_read_controller();
	*GPIO_E_MODER &= 0x0000FFFF;
	*GPIO_E_MODER |= 0x55550000;	
	return rv;
}

void ascii_command(char command, unsigned int delayMicro) {
	while((ascii_read_status() & 0x80) == 0x80) {
		// Do nothing, wait for status flag
	}
	delay_micro(8);
	ascii_write_cmd(command);
	delay_micro(delayMicro);
}

void ascii_init(void) {
	ascii_ctrl_bit_set(B_SELECT);
	ascii_command(0x38, 40); // Set display size and font size
    ascii_command(0xE, 40); // Set display, cursor on
	ascii_command(0x01, 1530); // Clear display
    ascii_command(0x6, 40); // Inc, no shift
}

void ascii_write_char(unsigned char charToWrite) {
	while((ascii_read_status() & 0x80) == 0x80) {
	// Do nothing, wait for status flag
    }
	delay_micro(8);
    ascii_write_data(charToWrite);
    delay_micro(45);
}

void goToXY(unsigned char row, unsigned char column) {
	unsigned char address = row - 1;
	if(column == 2) {
		address = address + 0x40;
	}
	ascii_write_cmd(0x80 | address);
}