#ifndef PLAYER_H
#define PLAYER_H
#include "gameobject.h"

extern const Uint8 *state;
static int t;
static bool bShake;
static int shakeStop;
extern GameObject player;
extern int gameHeight, gameWidth;
void shake(vec2f* pos);
void updatePlayer(GameObject* this);
#endif