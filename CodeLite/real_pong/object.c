#include "object.h"
#include "graphic.h"

void draw_object(POBJECT this) {
	for(int i = 0; i < MAX_POINTS; i++) {
		pixel(this->geo->px[i].x + this->posX, this->geo->px[i].y + this->posY, 1);
	}
}
void clear_object(POBJECT this) {
	for(int i = 0; i < MAX_POINTS; i++) {
		pixel(this->geo->px[i].x + this->posX, this->geo->px[i].y + this->posY, 0);
	}
}

void set_object_speed(POBJECT this, int x, int y) {
	this->dirX = x;
	this->dirY = y;
}