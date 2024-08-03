public class Menu extends Window {
 
    protected Background background;
    protected Mountain mountain;
    protected Cloud[] cloudList;
    protected TextImage menuText;
    protected Isle[] isleList;
    
    Menu() throws GameException {
        super("menu");
        background = game.getRandomBackground();
        mountain = new Mountain("mountain_" + background._name);
        cloudList = game.getCloudList();
        isleList = game.getRandomIsleList(3, false);
        initIsle(); 
        menuText = new TextImage("menu"); //<>//
        // music.loopMusic();
    }
    
    private void initIsle() {
        float posX = width/2;
        for (Isle isle : isleList) {
            isle.canRespawn = true;
            isle.movement.setSpeed(random(isle.movement.speed/2, isle.movement.speed));
            isle.movement.coord.setCoordinates(posX, random(height/10*2, height/10*5));
            posX = posX + random(width/2, width);
        }
    }
    
    @Override
    public void draw() {
        background.draw();
        
        mountain.draw();
        
        for (Cloud cloud : cloudList) {
            cloud.draw();
        }
        
        for (Isle isle : isleList) {
            isle.draw();
        }
        
        menuText.draw();
    }
    
    @Override
    public void keyPressed() {
                   
    }
    
    @Override
    public void keyReleased() {
                   
    }
    
}
