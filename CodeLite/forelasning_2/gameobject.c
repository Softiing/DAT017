#include "gameobject.h"

GameObject gameObjects[20];
int nGameObjects = 2;

void render(GameObject* this) {
	renderGfxObject(&this->gfxObject, this->position.x, this->position.y, this->angle, this->scale);
}