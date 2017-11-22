#include "renderer.h"
#include <stdio.h>
#include <math.h>
#include "vecmath.h"
#include "gameobject.h"
#include "player.h"
#include "background.h"


extern GameObject player;
extern GameObject background;
void close(); 


// Screen variables
int gameWidth = 800;
int gameHeight = 600;

const Uint8 *state;

void printToWindow(char* str, int x, int y) {
	renderText(str, x, y);
}

void printToConsole(char* str, int x, int y) {
	printf("%s\n", str);
}


int main( int argc, char* args[] ) {
    // Start up SDL and create window of width=800, height = 600
    initRenderer(gameWidth, gameHeight); 
    
    // get pointer to key states
    state = SDL_GetKeyboardState(NULL); 
	
	// Init player and background
	createPlayer();
	createBackground();
	
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