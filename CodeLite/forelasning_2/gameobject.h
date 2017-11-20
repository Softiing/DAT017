#ifndef GAMEOBJECT_H
#define GAMEOBJECT_H

typedef struct {
	GfxObject gfxObject;
	vec2f position;
	float speed;
	double angle, angleSpeed;
	float scale, scaleSpeed;
} GameObject;

#endif