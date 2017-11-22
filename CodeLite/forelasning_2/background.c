#include "background.h"  

static GameObject background;

void renderBackground(GameObject* this) {
    renderGfxObject(&this->gfxObject, gameWidth/2, gameHeight/2, this->angle, (1.8f + 0.2*sin(this->scale)));
}

void updateBackground(GameObject* this) {
	this->angle = fmod(this->angle + this->angleSpeed, 360);
    background.scale += background.scaleSpeed;
}

void createBackground() {
	// Create background
	background.gfxObject = createGfxObject("../background.jpg");
	background.gfxObject.outputWidth = gameWidth;
	background.gfxObject.outputHeight = gameHeight;
	background.angleSpeed = 0.03;
	background.scaleSpeed = 0.007;
	background.update = updateBackground;
	background.render = renderBackground;
	gameObjects[nGameObjects++] = &background;
}