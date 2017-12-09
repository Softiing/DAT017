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

OBJECT paddle1 = {
	&paddle_geometry,
	0, 0,
	1, 1,
	draw_object,
	clear_object,
	move_paddle,
	set_object_speed
};

OBJECT paddle2 = {
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
	
	this->posX += this->dirX;
//	this->posY += this->dirY;
	
	// Wall collisions
	if(this->posY < 0) {
		this->posY = 0;
	} else if(this->posY > 127) {
		this->posY = 127;
	}
	
	this->draw(this);
}