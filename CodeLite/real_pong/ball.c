#include "ball.h"
#include "paddle.h"

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

extern OBJECT leftPaddle;
extern OBJECT rightPaddle;

void move_ball(POBJECT this) {
	clear_object(this);
	
	this->posX += this->dirX;
	this->posY += this->dirY;
	
	// Wall collisions
	if((this->posY < 0) ||  this->posY > 63 ) {
		this->dirY = -this->dirY;
	}
	
	// Define left and right paddle
	POBJECT lp = &leftPaddle;
	POBJECT rp = &rightPaddle;
	
	//For left paddle
	if(this->posX <= lp->posX + lp->geo->sizeX) {
		if((this->posY >= lp->posY) && (this->posY <= lp->posY + lp->geo->sizeY)) {
			this->dirX = -this->dirX;
		} else {
			// Left player lost
		}
	}
	
	//For right paddle
	if(this->posX >= rp->posX) {
		if((this->posY >= rp->posY) && (this->posY <= rp->posY + rp->geo->sizeY)) {
			this->dirX = -this->dirX;
		} else {
			// Right player lost
		}
	}
	
	this->draw(this);
}