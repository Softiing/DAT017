#ifndef ALIENS_H
#define ALIENS_H
#include "gameobject.h"
extern GameObject* gameObjects[];
extern int nGameObjects;
extern int gameWidth, gameHeight;
static GameObject aliens[];
static void updateAlien(GameObject* this);

#endif