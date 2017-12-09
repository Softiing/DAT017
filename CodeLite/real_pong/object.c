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
void move_object(POBJECT this) {
	clear_object(this);
	
	this->posX += this->dirX;
	this->posY += this->dirY;
	
	if((this->posX < 0) ||  this->posX > 127 ) {
		this->dirX = -this->dirX;
	}
	if((this->posY < 0) ||  this->posY > 63 ) {
		this->dirY = -this->dirY;
	}
	this->draw(this);
}

void set_object_speed(POBJECT this, int x, int y) {
	this->dirX = x;
	this->dirY = y;
}