#ifndef GRAPHIC_H
#define GRAPHIC_H

// Port E setup
#define GPIO_E 0x40021000
#define GPIO_MODER ((volatile unsigned int *) (GPIO_E))
#define GPIO_OTYPER ((volatile unsigned short *) (GPIO_E+0x4))
#define GPIO_PUPDR ((volatile unsigned int *) (GPIO_E+0xC))
#define GPIO_IDR_LOW ((volatile unsigned char *) (GPIO_E+0x10))
#define GPIO_IDR_HIGH ((volatile unsigned char *) (GPIO_E+0x11))
#define GPIO_ODR_LOW ((volatile unsigned char *) (GPIO_E+0x14))
#define GPIO_ODR_HIGH ((volatile unsigned char *) (GPIO_E+0x15))


// Control for display
#define B_E 0x40
#define B_SELECT 0x04
#define B_RW 0x02
#define B_RS 0x01

#define B_RST 0x20
#define B_CS2 0x10
#define B_CS1 0x08

#define LCD_ON 0x3F
#define LCD_OFF 0x3E
#define LCD_DISP_START 0xC0
#define LCD_SET_ADD 0x40
#define LCD_SET_PAGE 0xB8
#define LCD_BUSY 0x80

typedef unsigned char uint8_t;


void graphic_ctrl_bit_set(uint8_t x);

void graphic_ctrl_bit_clear(uint8_t x);

void select_cotroller(uint8_t controller);

void graphic_wait_ready(void);

unsigned char graphic_read(unsigned char controller);

void graphic_write(unsigned char value, unsigned char controller);

void graphic_write_command(unsigned char command, unsigned char controller);

void graphic_write_data(unsigned char data, unsigned char controller);

unsigned char graphic_read_data(unsigned char controller);

void graphic_initalize(void);

void graphic_clear_screen(void);

#endif