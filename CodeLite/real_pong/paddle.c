#include "paddle.h"

GEOMETRY paddle_geometry = {
	12,
	4, 25,
	{
		{0, 0}, {1, 0}, {2, 0}, {3, 0},
		{0, 1}, {1, 1}, {2, 1}, {3, 1},
		{0, 2}, {1, 2}, {2, 2}, {3, 2},
		{0, 3}, {1, 3}, {2, 3}, {3, 3},
		{0, 4}, {1, 4}, {2, 4}, {3, 4},
		{0, 5}, {1, 5}, {2, 5}, {3, 5},
		{0, 6}, {1, 6}, {2, 6}, {3, 6},
		{0, 7}, {1, 7}, {2, 7}, {3, 7},
		{0, 8}, {1, 8}, {2, 8}, {3, 8},
		{0, 9}, {1, 9}, {2, 9}, {3, 9},
		{0, 10}, {1, 10}, {2, 10}, {3, 10},
		{0, 11}, {1, 11}, {2, 11}, {3, 11},
		{0, 12}, {1, 12}, {2, 12}, {3, 12},
		{0, 13}, {1, 13}, {2, 13}, {3, 13},
		{0, 14}, {1, 14}, {2, 14}, {3, 14},
		{0, 15}, {1, 15}, {2, 15}, {3, 15},
		{0, 16}, {1, 16}, {2, 16}, {3, 16},
		{0, 17}, {1, 17}, {2, 17}, {3, 17},
		{0, 18}, {1, 18}, {2, 18}, {3, 18},
		{0, 19}, {1, 19}, {2, 19}, {3, 19},
		{0, 20}, {1, 20}, {2, 20}, {3, 20},
		{0, 21}, {1, 21}, {2, 21}, {3, 21},
		{0, 22}, {1, 22}, {2, 22}, {3, 22},
		{0, 23}, {1, 23}, {2, 23}, {3, 23},
		{0, 24}, {1, 24}, {2, 24}, {3, 24},
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