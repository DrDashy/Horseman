final PApplet SKETCH_PAPPLET = this;
final int BASE_WIDTH = 1920;
final int BASE_HEIGHT = 1080;
int RATION_WIDTH;
int RATION_HEIGHT;
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


void draw() {
    game.draw();
}
