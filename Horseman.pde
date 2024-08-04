final PApplet SKETCH_PAPPLET = this;
final int BASE_WIDTH = 1920;
final int BASE_HEIGHT = 1080;
int RATION_WIDTH;
int RATION_HEIGHT;
final int MAX_POS_X_LEFT = -300;
final int MAX_POS_X_RIGHT = 300;
Game game;


void setup() {
    fullScreen();
    frameRate(144); // specified the frameRate
    smooth(8); // specified x8 anti aliasing
    
    RATION_WIDTH = abs(BASE_WIDTH/width);
    RATION_HEIGHT = abs(BASE_HEIGHT/height);
    
    try {
        game = new Game();
        game.initWindows();
        game._menu.active();
    } catch (GameException e) {
        println(e.getMessage());
        exit();
    } catch (Exception e) {
        println("Uncaught error throw !");
        println(e.getMessage());
        exit();
    }
}

/**
 * <p>Draw method.</p>
 *
 * @version 1.0.0
 * @since 1.0.0
 */
void draw() {
    // Reset background to update all drawing
    background(15);
    game.draw();
}

/**
 * <p>Key Pressed method.</p>
 *
 * @version 1.0.0
 * @since 1.0.0
 */
public void keyPressed() {
    try {
        game.keyPressed();
    } catch (GameException e) {
        println(e.getMessage());
        exit();
    }
}

/**
 * <p>Key Released method.</p>
 *
 * @version 1.0.0
 * @since 1.0.0
 */
public void keyReleased() {
    game.keyReleased();
}
