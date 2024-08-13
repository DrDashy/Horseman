public class Menu extends Window {
    
    // Constant
    private final int NUMBER_CLOUD = 5;
    private final int NUMBER_ISLE = 4;
 
    // Other
    private Decord background;
    private Decord mountain;
    private Decord[] cloudList;
    private Decord[] isleList;
    private Decord menuText;
    private ProfilSelector profilSelector;
    private LevelSelector levelSelector;
    public Music menuClick;
    
    /***** CONSTRUCTOR *****/
    
    Menu() throws GameException {
        super("menu");
        background = new Decord(imageType.BACKGROUND, databaseData.getRandomBackground(), false, movementDirection.NONE);
        mountain = new Decord(imageType.MOUNTAIN, "mountain_" + background.getImage()._getName(), false, movementDirection.NONE);
        cloudList = new Decord[NUMBER_CLOUD];
        Image[] cloudImageList = databaseData.getRandomCloudList(NUMBER_CLOUD);
        for (int i=0; i<NUMBER_CLOUD; i++) {
            cloudList[i] = new Decord(imageType.CLOUD, cloudImageList[i], random(0, width*3), random(0, height/2), true, movementDirection.LEFT);
            cloudList[i].initRespawn(true, true, width, width*3, 0, height/2);
        }
        isleList = new Decord[NUMBER_ISLE];
        Image[] isleImageList = databaseData.getRandomIsleList(NUMBER_ISLE, false);
        for (int i=0; i<NUMBER_ISLE; i++) {
            isleList[i] = new Decord(imageType.ISLE, isleImageList[i], random(0, width+(width/3)), random(height/10*2, height/10*5), true, movementDirection.LEFT);
            isleList[i].initRespawn(true, true, width, width+(width/3), height/10*2, height/10*5);
        }
        menuText = new Decord(imageType.TEXT, "menu", false, movementDirection.NONE);
        profilSelector = new ProfilSelector();
        levelSelector = new LevelSelector();
        menuClick = new Music("menu_click");
        
        profilSelector.active();
        levelSelector.inactive();
         //<>//
        music.loopMusic();
    }
    
    /***** METHOD *****/
    
    @Override
    public void draw() {
        background.draw();
        mountain.draw();
        for (Decord cloud : cloudList) {
            cloud.draw();
        }
        for (Decord isle : isleList) {
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
