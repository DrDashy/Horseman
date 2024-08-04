final int NUMBER_CLOUD = 5;
final int NUMBER_ISLE = 4;
final int NUMBER_LEVEL = 9;


public class Menu extends Window {
 
    private Background background;
    private Mountain mountain;
    private Cloud[] cloudList;
    private Isle[] isleList;
    private TextImage menuText;
    private MenuLevelText[] menuLevelTextList;
    private int actualLevel = game.getProfil().getMaxLevelUnlocked();
    
    Menu() throws GameException {
        super("menu");
        background = game.getRandomBackground();
        mountain = new Mountain("mountain_" + background._getName());
        cloudList = game.getRandomCloudList(NUMBER_CLOUD);
        initCloud();
        isleList = game.getRandomIsleList(NUMBER_ISLE, false);
        initIsle(); 
        menuText = new TextImage("menu");
        menuLevelTextList = new MenuLevelText[NUMBER_LEVEL];
        for (int i=0; i<NUMBER_LEVEL; i++) {
            menuLevelTextList[i] = new MenuLevelText(i+1); //<>//
        }
        initLevels(); 
        music.setGain(-5);
        music.loopMusic();
    }
    
    private void initCloud() {
        for (Cloud cloud : cloudList) { //<>//
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
    
    private void initLevels() {
        float xPos = 0;
        int margin = 0;
        float yPos = 0;
        int levelMaxUnlocked = game.getProfil().getMaxLevelUnlocked();
        for (int i=0; i<NUMBER_LEVEL; i++) {
            if (0 == i) {
                xPos = (width - ((menuLevelTextList[i].level.picture.width*9) + (menuLevelTextList[i].level.picture.width/3*9)))/2;
                yPos = (height/2) - (menuLevelTextList[i].level.picture.height/2);
                margin = menuLevelTextList[i].level.picture.width/3;
            }
            menuLevelTextList[i].initLevel(xPos, yPos);
            xPos += menuLevelTextList[i].level.picture.width + margin;
            if (levelMaxUnlocked >= i+1) {
                menuLevelTextList[i].unlockedLevel();
                if (levelMaxUnlocked == i+1) {
                    menuLevelTextList[i].activeLevel();
                }
            }
        }
    }
    
    private void nextLevel() throws GameException {
        if (actualLevel < game.getProfil().getMaxLevelUnlocked()) {
            menuLevelTextList[actualLevel-1].inactiveLevel();
            menuLevelTextList[actualLevel].activeLevel();
            actualLevel++;
        }
    }
    
    private void oldLevel() throws GameException {
        if (actualLevel > 1) {
            actualLevel--;
            menuLevelTextList[actualLevel].inactiveLevel();
            menuLevelTextList[actualLevel-1].activeLevel();
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
        
        for (MenuLevelText menulevelText : menuLevelTextList) {
            menulevelText.draw();
        }
    }
    
    @Override
    public void keyPressed() throws GameException {
        if (key == CODED) {
            if (keyCode == LEFT) {
                oldLevel();
            }
            if (keyCode == RIGHT) {
                nextLevel();
            }
        }
        if (key == ' ') {
            inactive();
            music.resetMusic();
            //game.initWindow(actualLevel);
        }
    }
    
    @Override
    public void keyReleased() {
                   
    }
    
}
