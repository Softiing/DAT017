#include "gameobject.h"
void render(GameObject* this) {
	renderGfxObject(&this->gfxObject, this->position.x, this->position.y, this->angle, this->scale);
}