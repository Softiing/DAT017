#include "timer.h"
#include "graphic.h"


typedef unsigned char uint8_t;

void graphics_ctrl_bit_set(uint8_t x){
    *GPIO_E_ODR_LOW |= (x & ~B_SELECT);
}

void graphics_ctrl_bit_clear(uint8_t x){
    *GPIO_E_ODR_LOW &= ~x;
}

void select_controller(uint8_t controller){
    if(controller == 0) {
        graphics_ctrl_bit_clear(B_CS1);
        graphics_ctrl_bit_clear(B_CS2);
    } else if(controller == (B_CS1 | B_CS2)) {
        graphics_ctrl_bit_set(B_CS1);
        graphics_ctrl_bit_set(B_CS2);
    } else if(controller == B_CS1) {
        graphics_ctrl_bit_set(B_CS1);
        graphics_ctrl_bit_clear(B_CS2);
    } else if(controller == B_CS2) {
        graphics_ctrl_bit_clear(B_CS1);
        graphics_ctrl_bit_set(B_CS2);
    }
}

void graphic_wait_ready(){
    graphics_ctrl_bit_clear(B_E);
    *GPIO_E_MODER = 0x00005555;
    graphics_ctrl_bit_clear(B_RS);
    graphics_ctrl_bit_set(B_RW);
    delay_500ns();
    
    while(1) { // Wait for display not to be busy
        graphics_ctrl_bit_set(B_E);
        delay_500ns();
		unsigned char busy = *GPIO_E_IDR_HIGH;
        graphics_ctrl_bit_clear(B_E);
        delay_500ns();
        //unsigned char i = *GPIO_IDR_HIGH;
        if((busy & LCD_BUSY) == 0) {
            break;
        }
    }
    graphics_ctrl_bit_set(B_E);
    *GPIO_E_MODER = 0x55555555;
    
}

uint8_t graphic_read(uint8_t controller){
    graphics_ctrl_bit_clear(B_E);
    *GPIO_E_MODER = 0x00005555;
    graphics_ctrl_bit_set(B_RS | B_RW);
    select_controller(controller);
    delay_500ns();
    graphics_ctrl_bit_set(B_E);
    delay_500ns();
    
    uint8_t RV = *GPIO_E_IDR_HIGH;
    graphics_ctrl_bit_clear(B_E);
    *GPIO_E_MODER = 0x55555555;
    
    if(controller == B_CS1){
        select_controller(B_CS1);
        graphic_wait_ready();
    }
    
    if(controller == B_CS2){
        select_controller(B_CS2);
        graphic_wait_ready();
    }
    
    return RV;
    
}

void graphic_write(uint8_t value, uint8_t controller){
    *GPIO_E_ODR_HIGH = value;
    select_controller(controller);
    delay_500ns();
    graphics_ctrl_bit_set(B_E);
    delay_500ns();
    graphics_ctrl_bit_clear(B_E);
    
    if(controller & B_CS1){
        select_controller(B_CS1);
        graphic_wait_ready();
    }
    
    if(controller & B_CS2){
        select_controller(B_CS2);
        graphic_wait_ready();
    }
    
    *GPIO_E_ODR_HIGH = 0;
    graphics_ctrl_bit_set(B_E);
    select_controller(0);
}

void graphic_write_command(uint8_t command, uint8_t controller){
    graphics_ctrl_bit_clear(B_E);
    select_controller(controller);
    graphics_ctrl_bit_clear(B_RS | B_RW);
    graphic_write(command, controller);
}

void graphic_write_data(uint8_t data, uint8_t controller){
    graphics_ctrl_bit_clear(B_E);
    select_controller(controller);
    graphics_ctrl_bit_set(B_RS);
    graphics_ctrl_bit_clear(B_RW);
    graphic_write(data, controller);
}

uint8_t graphics_read_data(uint8_t controller){
    (void) graphic_read(controller);
    return graphic_read(controller);
}

void graphic_initialize(void){
    graphics_ctrl_bit_set(B_E);
    graphics_ctrl_bit_set(B_SELECT);
    delay_micro(10);
    graphics_ctrl_bit_clear(B_CS1 | B_CS2 | B_RST | B_E);
    delay_milli(30);
    graphics_ctrl_bit_set(B_RST);
    graphic_write_command(LCD_OFF, B_CS1|B_CS2);
    graphic_write_command(LCD_ON, B_CS1|B_CS2);
    graphic_write_command(LCD_DISP_START, B_CS1|B_CS2);
    graphic_write_command(LCD_SET_ADD, B_CS1|B_CS2);
    graphic_write_command(LCD_SET_PAGE, B_CS1|B_CS2);
    select_controller(0);
}

void graphic_clear_screen(void){
    for(int page = 0; page < 8; page++){
        graphic_write_command(LCD_SET_PAGE | page, B_CS1|B_CS2);
        graphic_write_command(LCD_SET_ADD | 0, B_CS1|B_CS2);
        for(int add = 0; add < 64; add++){
            graphic_write_data(0, B_CS1|B_CS2);
        }
    }
    
}


void pixel(unsigned char x, unsigned char y, unsigned char set) {
	if(x < 0 || y < 0) return;
	if(x > 127 || y > 63) return;
	unsigned char mask;
	unsigned char index = y / 8;
	
	switch(y % 8) {
		case 0: mask = 1; break;
		case 1: mask = 2; break;
		case 2: mask = 4; break;
		case 3: mask = 8; break;
		case 4: mask = 16; break;
		case 5: mask = 32; break;
		case 6: mask = 64; break;
		case 7: mask = 128; break;
	}
	
	if(set == 0) {
		mask = ~mask;
	}
	
	unsigned char controller;
	if(x > 63) {
		controller = B_CS2;
		x = x - 64;
	} else {
		controller = B_CS1;
	}
	
	graphic_write_command(LCD_SET_ADD | x, controller);
	graphic_write_command(LCD_SET_PAGE | index, controller);
	unsigned char temp = graphics_read_data(controller);
	graphic_write_command(LCD_SET_ADD | x, controller);
	
	if(set) {
		mask = mask | temp;
	} else {
		mask = mask & temp;
	}
	
	graphic_write_data(mask, controller);
	
}
