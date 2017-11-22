#ifndef GAMEOBJECT_H
#define GAMEOBJECT_H
#include "renderer.h"
#include "vecmath.h"

typedef struct tGameObject{
	GfxObject gfxObject;
	vec2f position;
	float speed;
	double angle, angleSpeed;
	float scale, scaleSpeed;
	void (*update) (struct tGameObject* this);
	void (*render) (struct tGameObject* this);
} GameObject;

extern GameObject* gameObjects[];
extern int nGameObjects;

void render(GameObject* this);

#endif