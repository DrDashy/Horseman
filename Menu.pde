public class Menu extends Window {
    
    // Constant
    private final int NUMBER_CLOUD = 5;
    private final int NUMBER_ISLE = 4;
 
    // Other
    private Background background;
    private Mountain mountain;
    private Cloud[] cloudList;
    private Isle[] isleList;
    private TextImage menuText;
    private ProfilSelector profilSelector;
    private LevelSelector levelSelector;
    public Music menuClick;
    
    /***** CONSTRUCTOR *****/
    
    Menu() throws GameException {
        super("menu");
        background = game.getRandomBackground();
        mountain = new Mountain("mountain_" + background._getName());
        cloudList = game.getRandomCloudList(NUMBER_CLOUD);
        initCloud();
        isleList = game.getRandomIsleList(NUMBER_ISLE, false);
        initIsle(); 
        menuText = new TextImage("menu");
        profilSelector = new ProfilSelector();
        levelSelector = new LevelSelector();
        menuClick = new Music("menu_click");
        
        profilSelector.active();
        levelSelector.inactive();
         //<>//
        music.loopMusic();
    }
    
    /***** METHOD *****/
    
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
        
        if (profilSelector.isActive()) {
            profilSelector.draw();
        } else if (levelSelector.isActive()) {
            levelSelector.draw();
        }
    }
     //<>//
    @Override
    public void keyPressed() throws GameException {
        if (profilSelector.isActive()) {
            profilSelector.keyPressed();
            if (key == ' ') {
                menuClick.autoPlayMusic();
                if (profilSelector.isNewGame()) {
                    profilSelector.resetGame();
                    levelSelector.resetActualLevel();
                }
                profilSelector.inactive();
                levelSelector.active();
            }
        } else if (levelSelector.isActive()) {
            levelSelector.keyPressed();
            if (key == ' ') {
                menuClick.autoPlayMusic();
                levelSelector.inactive();
                music.resetMusic();
                inactive();
            }
        }
    }
    
    @Override
    public void keyReleased() {
        if (profilSelector.isActive()) {
            profilSelector.keyReleased();
        } else if (levelSelector.isActive()) {
            levelSelector.keyReleased();
        }
    }
    
}
