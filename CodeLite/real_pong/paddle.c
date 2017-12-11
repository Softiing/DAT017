#include "paddle.h"

GEOMETRY paddle_geometry = {
	12,
	4, 4,
	{
		{0, 1}, {0, 2}, {1, 0}, {1, 1}, {1, 2},
		{1, 3}, {2, 0}, {2, 1}, {2, 2}, {2, 3},
		{3, 1},
		{3, 2}
	}
};

OBJECT leftPaddle = {
	&paddle_geometry,
	0, 0,
	1, 1,
	draw_object,
	clear_object,
	move_paddle,
	set_object_speed
};

OBJECT rightPaddle = {
	&paddle_geometry,
	0, 0,
	1, 1,
	draw_object,
	clear_object,
	move_paddle,
	set_object_speed
};

void move_paddle(POBJECT this) {
	clear_object(this);
	
	// Move paddle in y direction only.
	this->posY += this->dirY;
	
	// Wall collisions todo add width check with paddle.
	if(this->posY < 0) {
		this->posY = 0;
	} else if(this->posY + this->geo->sizeY > 127) {
		this->posY = 127 - this->geo->sizeY;
	}
	
	this->draw(this);
}