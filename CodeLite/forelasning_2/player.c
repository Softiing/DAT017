#include "player.h"
static int t = 0;
static bool bShake = false;
static int shakeStop = 0;
GameObject player;

void shake(vec2f* pos) {
    // om bShake == false, initiera shake med sannolikhet 1/60.
    //      Sätt bShake = true;
    //      Sätt shakeStop till t + (30 till 50) frames
    // om (bShake && t < shakeStop)
    //      addera omväxlande -1 resp 1 varannan frame till x,y
    // om (bShake && t >= shakeStop)
    //      sätt bShake = false;
    
    if( bShake == false && ((rand() % 60)==1) ) {
        bShake = true;
        shakeStop = t + (rand() % 20) + 30;
    } if( bShake && t < shakeStop) {
        pos->x += 2* ((t % 3) - 1);
        pos->y += ((rand() % 3) - 1);
    } if( bShake && (t >= shakeStop) ) {
        bShake = false;
    }
    t++;
}

void updatePlayer(GameObject* this) {
	shake(&this->position);
	// Handle keyboard events
	if (state[SDL_SCANCODE_RIGHT]) {
		this->position.x = (this->position.x + this->speed >= gameWidth) ? gameWidth : this->position.x + this->speed;
	}
	if(state[SDL_SCANCODE_LEFT]) {
		this->position.x = (this->position.x - this->speed <= 0) ? 0 : this->position.x - this->speed;
	}
	if(state[SDL_SCANCODE_UP]) {
		this->position.y = (this->position.y - this->speed <= 0) ? 0 : this->position.y - this->speed;
	}
	if(state[SDL_SCANCODE_DOWN]) {
		this->position.y = (this->position.y + this->speed >= gameHeight) ? gameHeight : this->position.y + this->speed;
	}
}

void createPlayer() {
	// Player ship init
	player.position = (vec2f){400, 300};
	player.speed = 3;
	player.scale = 1;
	player.gfxObject = createGfxObject(  "../ship.png" );
	player.gfxObject.outputWidth  = 200;
	player.gfxObject.outputHeight = 200;
	player.update = updatePlayer;
	player.render = render;
}