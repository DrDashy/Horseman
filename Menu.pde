public class Menu extends Window {
 
    protected Background background;
    protected Mountain mountain;
    protected Cloud[] cloudList;
    protected Isle[] isleList;
    protected TextImage menuText;
    protected TextImage menu1;
    protected TextImage menu1Highlight;
    protected TextImage menu2;
    protected TextImage menu2Highlight;
    protected TextImage menu3;
    protected TextImage menu3Highlight;
    protected TextImage menu4;
    protected TextImage menu4Highlight;
    protected TextImage menu5;
    protected TextImage menu5Highlight;
    protected TextImage menu6;
    protected TextImage menu6Highlight;
    protected TextImage menu7;
    protected TextImage menu7Highlight;
    protected TextImage menu8;
    protected TextImage menu8Highlight;
    protected TextImage menu9;
    protected TextImage menu9Highlight;
    protected int actualLevel = game.getProfil().getMaxLevelUnlocked();
    
    Menu() throws GameException {
        super("menu");
        background = game.getRandomBackground();
        mountain = new Mountain("mountain_" + background._name);
        cloudList = game.getRandomCloudList(5);
        initCloud();
        isleList = game.getRandomIsleList(4, false);
        initIsle();  //<>//
        menuText = new TextImage("menu"); //<>//
        menu1 = new TextImage("menu1");
        menu1Highlight = new TextImage("menu1Highlight");
        menu2 = new TextImage("menu2");
        menu2Highlight = new TextImage("menu2Highlight");
        menu3 = new TextImage("menu3");
        menu3Highlight = new TextImage("menu3Highlight");
        menu4 = new TextImage("menu4");
        menu4Highlight = new TextImage("menu4Highlight");
        menu5 = new TextImage("menu5");
        menu5Highlight = new TextImage("menu5Highlight");
        menu6 = new TextImage("menu6");
        menu6Highlight = new TextImage("menu6Highlight");
        menu7 = new TextImage("menu7");
        menu7Highlight = new TextImage("menu7Highlight");
        menu8 = new TextImage("menu8");
        menu8Highlight = new TextImage("menu8Highlight");
        menu9 = new TextImage("menu9");
        menu9Highlight = new TextImage("menu9Highlight");
        initLevels(); 
        music.setGain(-5);
        //music.loopMusic();
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
    
    private void initLevels() throws GameException {
        float xPos = (width - ((menu1.picture.width*9) + (menu1.picture.width/3*9)))/2;
        int margin = menu1.picture.width/3;
        float yPos = (height/2) - (menu1.picture.height/2);
        menu1.movement.coord.setCoordinates(xPos, yPos);
        menu1Highlight.movement.coord.setCoordinates(xPos, yPos);
        menu1Highlight.canDraw = false;
        xPos += menu1.picture.width + margin;
        menu2.movement.coord.setCoordinates(xPos, yPos);
        menu2Highlight.movement.coord.setCoordinates(xPos, yPos);
        menu2Highlight.canDraw = false;
        xPos += menu2.picture.width + margin;
        menu3.movement.coord.setCoordinates(xPos, yPos);
        menu3Highlight.movement.coord.setCoordinates(xPos, yPos);
        menu3Highlight.canDraw = false;
        xPos += menu3.picture.width + margin;
        menu4.movement.coord.setCoordinates(xPos, yPos);
        menu4Highlight.movement.coord.setCoordinates(xPos, yPos);
        menu4Highlight.canDraw = false;
        xPos += menu4.picture.width + margin;
        menu5.movement.coord.setCoordinates(xPos, yPos);
        menu5Highlight.movement.coord.setCoordinates(xPos, yPos);
        menu5Highlight.canDraw = false;
        xPos += menu5.picture.width + margin;
        menu6.movement.coord.setCoordinates(xPos, yPos);
        menu6Highlight.movement.coord.setCoordinates(xPos, yPos);
        menu6Highlight.canDraw = false;
        xPos += menu6.picture.width + margin;
        menu7.movement.coord.setCoordinates(xPos, yPos);
        menu7Highlight.movement.coord.setCoordinates(xPos, yPos);
        menu7Highlight.canDraw = false;
        xPos += menu7.picture.width + margin;
        menu8.movement.coord.setCoordinates(xPos, yPos);
        menu8Highlight.movement.coord.setCoordinates(xPos, yPos);
        menu8Highlight.canDraw = false;
        xPos += menu8.picture.width + margin;
        menu9.movement.coord.setCoordinates(xPos, yPos);
        menu9Highlight.movement.coord.setCoordinates(xPos, yPos);
        menu9Highlight.canDraw = false;
        updateLevelHighlighted(game.getProfil().getMaxLevelUnlocked());
    }
    
    private void resetLevelHighlighted() throws GameException {
        menu1.canDraw = true;
        menu1Highlight.canDraw = false;
        menu2.canDraw = true;
        menu2Highlight.canDraw = false;
        menu3.canDraw = true;
        menu3Highlight.canDraw = false;
        menu4.canDraw = true;
        menu4Highlight.canDraw = false;
        menu5.canDraw = true;
        menu5Highlight.canDraw = false;
        menu6.canDraw = true;
        menu6Highlight.canDraw = false;
        menu7.canDraw = true;
        menu7Highlight.canDraw = false;
        menu8.canDraw = true;
        menu8Highlight.canDraw = false;
        menu9.canDraw = true;
        menu9Highlight.canDraw = false;
    }
    
    private void updateLevelHighlighted(int level) throws GameException {
        switch(level) {
            case 1:
                menu1.canDraw = false;
                menu1Highlight.canDraw = true;
                break;
            case 2:
                menu2.canDraw = false;
                menu2Highlight.canDraw = true;
                break;
            case 3:
                menu3.canDraw = false;
                menu3Highlight.canDraw = true;
                break;
            case 4:
                menu4.canDraw = false;
                menu4Highlight.canDraw = true;
                break;
            case 5:
                menu5.canDraw = false;
                menu5Highlight.canDraw = true;
                break;
            case 6:
                menu6.canDraw = false;
                menu6Highlight.canDraw = true;
                break;
            case 7:
                menu7.canDraw = false;
                menu7Highlight.canDraw = true;
                break;
            case 8:
                menu8.canDraw = false;
                menu8Highlight.canDraw = true;
                break;
            case 9:
                menu9.canDraw = false;
                menu9Highlight.canDraw = true;
                break;
            default:
                throw new GameException("Menu :: the level max that the user unlocked does not exist. Level max found : '" + game.getProfil().getMaxLevelUnlocked() + "'");
        }    
    }
    
    private void nextLevel() throws GameException {
        if (actualLevel < game.getProfil().getMaxLevelUnlocked()) {
            resetLevelHighlighted();
            actualLevel++;
            updateLevelHighlighted(actualLevel);
        }
    }
    
    private void oldLevel() throws GameException {
        if (actualLevel > 1) {
            resetLevelHighlighted();
            actualLevel--;  
            updateLevelHighlighted(actualLevel);
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
        menu1.draw();
        menu1Highlight.draw();
        menu2.draw();
        menu2Highlight.draw();
        menu3.draw();
        menu3Highlight.draw();
        menu4.draw();
        menu4Highlight.draw();
        menu5.draw();
        menu5Highlight.draw();
        menu6.draw();
        menu6Highlight.draw();
        menu7.draw();
        menu7Highlight.draw();
        menu8.draw();
        menu8Highlight.draw();
        menu9.draw();
        menu9Highlight.draw();
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
