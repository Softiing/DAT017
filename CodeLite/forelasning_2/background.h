#ifndef BACKGROUND_H
#define BACKGROUND_H
#include "gameobject.h"
extern const Uint8 *state;
extern int gameWidth, gameHeight;
static GameObject background;
void renderBackground(GameObject* this);
void updateBackground(GameObject* this);
#endif