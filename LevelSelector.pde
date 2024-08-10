public class LevelSelector extends View {
    
    // Constant
    private final int NUMBER_LEVEL = 9;
 
    // Other
    private MenuLevelText[] menuLevelTextList;
    private int actualLevel = game.getProfil().getMaxLevelUnlocked();
    
    /***** CONSTRUCTOR *****/
    
    LevelSelector() throws GameException {
        menuLevelTextList = new MenuLevelText[NUMBER_LEVEL];
        for (int i=0; i<NUMBER_LEVEL; i++) {
            menuLevelTextList[i] = new MenuLevelText(i+1);
        }
        initLevels();
    }
    
    /***** METHOD *****/
    
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
    
    public void resetActualLevel() {
        actualLevel = game.getProfil().getMaxLevelUnlocked();
        for (int i=0; i<NUMBER_LEVEL; i++) { 
            if (actualLevel >= i+1) {
                menuLevelTextList[i].unlockedLevel();
                if (actualLevel == i+1) {
                    menuLevelTextList[i].activeLevel();
                }
            } else {
                menuLevelTextList[i].lockedLevel(); 
            }
        }
    }
    
    private void nextLevel() throws GameException {
        if (actualLevel < game.getProfil().getMaxLevelUnlocked()) {
            game._menu.menuClick.autoPlayMusic();
            menuLevelTextList[actualLevel-1].inactiveLevel();
            menuLevelTextList[actualLevel].activeLevel();
            actualLevel++;
        }
    }
    
    private void oldLevel() throws GameException {
        if (actualLevel > 1) {
            game._menu.menuClick.autoPlayMusic();
            actualLevel--;
            menuLevelTextList[actualLevel].inactiveLevel();
            menuLevelTextList[actualLevel-1].activeLevel();
        }
    }
    
    @Override
    public void draw() {
        if (isActive()) {
            for (MenuLevelText menulevelText : menuLevelTextList) {
                menulevelText.draw();
            } 
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
    }
    
    @Override
    public void keyReleased() {
                   
    }
    
}
