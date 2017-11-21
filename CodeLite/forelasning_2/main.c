#include "renderer.h"
#include <stdio.h>
#include <math.h>
#include "vecmath.h"
#include "gameobject.h"

GameObject player;
GameObject background;
void close(); 


// Screen variables
int gameWidth = 800;
int gameHeight = 600;

const Uint8 *state;

int t = 0;
bool bShake = false;
int shakeStop = 0;
void shake(vec2f* pos) {
    // om bShake == false, initiera shake med sannolikhet 1/60.
    //      Sätt bShake = true;
    //      Sätt shakeStop till t + (30 till 50) frames
    // om (bShake && t < shakeStop)
    //      addera omväxlande -1 resp 1 varannan frame till x,y
    // om (bShake && t >= shakeStop)
    //      sätt bShake = false;
    
    if( bShake == false && ((rand() % 60)==1) ) {
        bShake = true;
        shakeStop = t + (rand() % 20) + 30;
    } if( bShake && t < shakeStop) {
        pos->x += 2* ((t % 3) - 1);
        pos->y += ((rand() % 3) - 1);
    } if( bShake && (t >= shakeStop) ) {
        bShake = false;
    }
    t++;
}

void printToWindow(char* str, int x, int y) {
	renderText(str, x, y);
}

void printToConsole(char* str, int x, int y) {
	printf("%s\n", str);
}

void render(GameObject* this) {
	renderGfxObject(&this->gfxObject, this->position.x, this->position.y, this->angle, this->scale);
}

void updatePlayer(GameObject* this) {
	shake(&this->position);
	// Handle keyboard events
	if (state[SDL_SCANCODE_RIGHT]) {
		this->position.x = (this->position.x + this->speed >= gameWidth) ? gameWidth : this->position.x + this->speed;
	}
	if(state[SDL_SCANCODE_LEFT]) {
		this->position.x = (this->position.x - this->speed <= 0) ? 0 : this->position.x - this->speed;
	}
	if(state[SDL_SCANCODE_UP]) {
		this->position.y = (this->position.y - this->speed <= 0) ? 0 : this->position.y - this->speed;
	}
	if(state[SDL_SCANCODE_DOWN]) {
		this->position.y = (this->position.y + this->speed >= gameHeight) ? gameHeight : this->position.y + this->speed;
	}
}

void renderBackground(GameObject* this) {
    renderGfxObject(&this->gfxObject, gameWidth/2, gameHeight/2, this->angle, (1.8f + 0.2*sin(this->scale)));
}

void updateBackground(GameObject* this) {
	this->angle = fmod(this->angle + this->angleSpeed, 360);
    background.scale += background.scaleSpeed;
}

int main( int argc, char* args[] ) {
    // Start up SDL and create window of width=800, height = 600
    initRenderer(gameWidth, gameHeight); 
    
    // get pointer to key states
    state = SDL_GetKeyboardState(NULL); 

    // Create background
    background.gfxObject = createGfxObject("../background.jpg");
    background.gfxObject.outputWidth = gameWidth;
    background.gfxObject.outputHeight = gameHeight;
	background.angleSpeed = 0.03;
	background.scaleSpeed = 0.007;
	background.update = updateBackground;
	background.render = renderBackground;
    
	// Player ship init
	player.position = (vec2f){400, 300};
	player.speed = 3;
	player.scale = 1;
    player.gfxObject = createGfxObject(  "../ship.png" );
    player.gfxObject.outputWidth  = 200;
    player.gfxObject.outputHeight = 200;
	player.update = updatePlayer;
	player.render = render;
	
	// Create array of gameobjects
	GameObject gameObjects[] = {background, player};
	
	// Init print function pointer
	void (*print) (char* str, int x, int y) = printToWindow;
    
    while(true) // The real-time loop
    {
        // Handle events on the inqueue (e.g., mouse events)
        SDL_Event e;  //Event handler
        while( SDL_PollEvent( &e ) != 0 )
        {
            if( e.type == SDL_QUIT ) {   //User requests quit
                close(); 
                exit(0);
            }
			if( (e.type == SDL_KEYDOWN) &&
				(e.key.keysym.scancode == SDL_SCANCODE_C) ) {
					if(print == printToWindow) {
						print = printToConsole;
					} else {
						print = printToWindow;
					}
			}
        }
                
        // Clear screen with a grey background color, red=0x33, blue=0x33, green=0x33, alpha=0xff. 0=minimum, 0xff=maximum.
        // Alpha is transparency: 0 = fully transparent, 0xFF = fully opaque. However, actual use of transparency requires further settings.
        SDL_SetRenderDrawColor( gRenderer, 0x33, 0x33, 0x33, 0xFF ); 
        SDL_RenderClear( gRenderer );
		
		// Update all gameobjects
		for(int i = 0; i < (sizeof(gameObjects)/sizeof(*gameObjects)); i++) {
			gameObjects[i].update(&gameObjects[i]);
		}
		
		// Render all gameobjects
		for(int i = 0; i < (sizeof(gameObjects)/sizeof(*gameObjects)); i++) {
			gameObjects[i].render(&gameObjects[i]);
		}


        print("Hello World!", 300, 150);
         
        // This function updates the screen and also sleeps ~16 ms or so (based on the screen's refresh rate),  
        // because we used the flag SDL_RENDERER_PRESENTVSYNC in function initRenderer()
        SDL_RenderPresent( gRenderer );

    }

	close(); //Free allocated resources
	return 0;
}

void close()
{
    //Preferably, you should free all your GfxObjects, by calls to freeGfxObject(GfxObject* obj), but you don't have to.
    freeGfxObject(&background.gfxObject);
    freeGfxObject(&player.gfxObject);
    
    closeRenderer(); //Free resources and close SDL
}