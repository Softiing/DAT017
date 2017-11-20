#include "renderer.h"
#include <stdio.h>
#include <math.h>
#include "vecmath.h"

GfxObject ship;
GfxObject background;
void close(); 


// Screen variables
int gameWidth = 800;
int gameHeight = 600;

// Background variables
double backgroundAngle = 0;
double backgroundZoom = 0;

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

int main( int argc, char* args[] )
{
    // Player position
	vec2f playerPosition = {400, 300};
    float playerSpeed = 3;

    // If you want the program to not launch the terminal, then go to 
    // Project->Settings->General->"This program is a GUI application" and uncheck that flag.
    
    // Start up SDL and create window of width=800, height = 600
    initRenderer(gameWidth, gameHeight); 
    
    // get pointer to key states
    const Uint8 *state = SDL_GetKeyboardState(NULL); 

    // Create background
    background  = createGfxObject("../background.jpg");
    background.outputWidth = gameWidth;
    background.outputHeight = gameHeight;
    
    // Create an object
    ship = createGfxObject(  "../ship.png" );
    ship.outputWidth  = 200;
    ship.outputHeight = 200;
    
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
        }
        
		shake(&playerPosition);
        // Handle keyboard events
        if (state[SDL_SCANCODE_RIGHT]) {
            playerPosition.x = (playerPosition.x + playerSpeed >= gameWidth) ? gameWidth : playerPosition.x + playerSpeed;
        }
        if(state[SDL_SCANCODE_LEFT]) {
            playerPosition.x = (playerPosition.x - playerSpeed <= 0) ? 0 : playerPosition.x - playerSpeed;
        }
        if(state[SDL_SCANCODE_UP]) {
            playerPosition.y = (playerPosition.y - playerSpeed <= 0) ? 0 : playerPosition.y - playerSpeed;
        }
        if(state[SDL_SCANCODE_DOWN]) {
            playerPosition.y = (playerPosition.y + playerSpeed >= gameHeight) ? gameHeight : playerPosition.y + playerSpeed;
        }
        
        // Clear screen with a grey background color, red=0x33, blue=0x33, green=0x33, alpha=0xff. 0=minimum, 0xff=maximum.
        // Alpha is transparency: 0 = fully transparent, 0xFF = fully opaque. However, actual use of transparency requires further settings.
        SDL_SetRenderDrawColor( gRenderer, 0x33, 0x33, 0x33, 0xFF ); 
        SDL_RenderClear( gRenderer );
        renderBackground();
        // Render our object(s) - background objects first, and then forward objects (like a painter)
        renderGfxObject(&ship, playerPosition.x, playerPosition.y, 0, 1.0f);
        renderText("Hello World!", 300, 150);
         
        // This function updates the screen and also sleeps ~16 ms or so (based on the screen's refresh rate),  
        // because we used the flag SDL_RENDERER_PRESENTVSYNC in function initRenderer()
        SDL_RenderPresent( gRenderer );

    }

	close(); //Free allocated resources
	return 0;
}

void renderBackground() {
    renderGfxObject(&background, gameWidth/2, gameHeight/2, fmod(backgroundAngle, 360), (1.8f + 0.2*sin(backgroundZoom)));
    backgroundAngle += 0.03;
    backgroundZoom += 0.007;
}

void close()
{
    //Preferably, you should free all your GfxObjects, by calls to freeGfxObject(GfxObject* obj), but you don't have to.
    freeGfxObject(&background);
    freeGfxObject(&ship);
    
    closeRenderer(); //Free resources and close SDL
}