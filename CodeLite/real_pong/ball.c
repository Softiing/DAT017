#include "ball.h"

GEOMETRY ball_geometry = {
	12,
	4, 4,
	{
		{0, 1}, {0, 2}, {1, 0}, {1, 1}, {1, 2},
		{1, 3}, {2, 0}, {2, 1}, {2, 2}, {2, 3},
		{3, 1},
		{3, 2}
	}
};

OBJECT ball = {
	&ball_geometry,
	0, 0,
	1, 1,
	draw_object,
	clear_object,
	move_ball,
	set_object_speed
};

void move_ball(POBJECT this) {
	clear_object(this);
	
	this->posX += this->dirX;
	this->posY += this->dirY;
	
	// Wall collisions
	if((this->posY < 0) ||  this->posY > 63 ) {
		this->dirY = -this->dirY;
	}
	
	// End game collisions
	if((this->posX < 0) ||  this->posX > 163 ) {
		// Handle game over.
	}
	
	// TODO Paddle collisions
	
	this->draw(this);
}