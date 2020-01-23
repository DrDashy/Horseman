
// Importation de la librairie Minim ( Gère la musique )
import ddf.minim.*;
Minim minim;

final int BASE_WIDTH = 1920;
final int BASE_HEIGHT = 1080;

int RATION_WIDTH;
int RATION_HEIGHT;

// Color for the background
/**
 *  @author (classes and interfaces only, required)
    @version (classes and interfaces only, required. See footnote 1)
    @param (methods and constructors only)
    @return (methods only)
    @exception (@throws is a synonym added in Javadoc 1.2)
    @see
    @since
 */

final Color cBackground = new Color(240, 255);

Menu menu;
Game game;

void setup() {
    fullScreen(P2D);
    smooth(4);
    
    RATION_WIDTH = abs(BASE_WIDTH/width);
    RATION_HEIGHT = abs(BASE_HEIGHT/height);
    
    minim = new Minim(this);
    menu = new Menu();
    menu.initWindow(1);
    
    game = new Game();
    
    frameRate(120);
}

void draw() {
    // Reset background to update all drawing
    background(cBackground.getColor());
    
    if (menu.isActive()) {
        menu.draw();    
    }
    if (game.isActive()) {
        game.draw();
    }
}

void keyPressed() {
    if (menu.isActive()) {
        menu.keyPressed();    
    }
    if (game.isActive()) {
        game.keyPressed();
    }
}

void keyReleased() {
    if (game.isActive()) {
        game.keyReleased();
    }
}
