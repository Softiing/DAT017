#include "aliens.h"

static GameObject aliens[3];

static void updateAlien(GameObject* this) {
	static float i = 0;
	this->position.x *= 5 * sin(i);
//	this->position.y += gameWidth * sin(i);
	i=+0.1;
}

void createAliens() {
	static GfxObject gfx;
    static bool init = true;
	
	if(init) {
		init = false;
		gfx = createGfxObject(  "../alienship.png" );
		gfx.outputWidth = 200;
		gfx.outputHeight = 200;
	}
	
	aliens[0].gfxObject = gfx;
	aliens[0].update = updateAlien;
	aliens[0].render = render;
	aliens[0].speed = 1;
	aliens[0].scale = 1;
	aliens[0].position = (vec2f){200, 300};
	
	aliens[1].gfxObject = gfx;
	aliens[1].update = updateAlien;
	aliens[1].render = render;
	aliens[1].speed = 1;
	aliens[1].scale = 1;
	aliens[1].position = (vec2f){350, 700};

	
	aliens[2].gfxObject = gfx;
	aliens[2].update = updateAlien;
	aliens[2].render = render;
	aliens[2].speed = 1;
	aliens[2].scale = 1;
	aliens[2].position = (vec2f){150, 50};
	
	gameObjects[nGameObjects++] = &aliens[0];
	gameObjects[nGameObjects++] = &aliens[1];
	gameObjects[nGameObjects++] = &aliens[2];
}