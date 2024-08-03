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
        cloudList = game.getRandomCloudList(5);
        initCloud();
        isleList = game.getRandomIsleList(4, false);
        initIsle(); 
        menuText = new TextImage("menu"); //<>//
        // music.loopMusic();
    }
    
    private void initCloud() {
        for (Cloud cloud : cloudList) {
            cloud.canRespawn = true;
            cloud.newSpeedOnRespawn = true;
            cloud.movement.setSpeed(random(cloud.movement.speed/2, cloud.movement.speed));
            cloud.movement.coord.setCoordinates(random(0, width*2), random(0, height/2));
        }
    }
    
    private void initIsle() {
        for (Isle isle : isleList) {
            isle.canRespawn = true;
            isle.newSpeedOnRespawn = true;
            isle.movement.setSpeed(random(isle.movement.speed/4, isle.movement.speed/2));
            isle.movement.coord.setCoordinates(random(0, width+(width/2)), random(height/10*2, height/10*5));
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
