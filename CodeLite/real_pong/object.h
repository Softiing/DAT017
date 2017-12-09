#ifndef OBJECT_H
#define OBJECT_H
#define MAX_POINTS 20

typedef struct tPoint {
	unsigned char x;
	unsigned char y;
} POINT;


typedef struct tGeometry {
	int numPoints;
	int sizeX;
	int sizeY;
	POINT px[MAX_POINTS];
} GEOMETRY, *PGEOMETRY;

typedef struct tObj {
	PGEOMETRY geo;
	int dirX, dirY;
	int posX, posY;
	void(*draw) (struct tObj *);
	void(*clear) (struct tObj *);
	void(*move) (struct tObj *);
	void(*set_speed) (struct tObj *, int, int);
} OBJECT, *POBJECT;


void draw_object(POBJECT);
void clear_object(POBJECT);
void move_object(POBJECT);
void set_object_speed(POBJECT, int, int);

#endif