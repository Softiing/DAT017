#ifndef GPIOE_H
#define GPIOE_H
// Port E setup
#define GPIO_E 0x40021000
#define GPIO_E_MODER ((volatile unsigned int *) (GPIO_E))
#define GPIO_E_OTYPER ((volatile unsigned short *) (GPIO_E+0x4))
#define GPIO_E_PUPDR ((volatile unsigned int *) (GPIO_E+0xC))
#define GPIO_E_IDR_LOW ((volatile unsigned char *) (GPIO_E+0x10))
#define GPIO_E_IDR_HIGH ((volatile unsigned char *) (GPIO_E+0x11))
#define GPIO_E_ODR_LOW ((volatile unsigned char *) (GPIO_E+0x14))
#define GPIO_E_ODR_HIGH ((volatile unsigned char *) (GPIO_E+0x15))

#endif