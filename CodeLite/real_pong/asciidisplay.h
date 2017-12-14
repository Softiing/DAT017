
void ascii_ctrl_bit_set(unsigned int x);

void ascii_ctrl_bit_clear(unsigned int x);

void ascii_write_controller(unsigned char byte);

unsigned char ascii_read_controller();

void ascii_write_cmd(unsigned char command);

void ascii_write_data(unsigned char data);

unsigned char ascii_read_status(void);

unsigned char ascii_read_data(void);

void ascii_command(char command, unsigned int delayMicro);

void ascii_init(void);

void ascii_write_char(unsigned char charToWrite);

void goToXY(unsigned char row, unsigned char column);