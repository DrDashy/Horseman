public class Game {
    
    private Profil profil;
    
    private Background backgroundMorning;
    private Background backgroundSunny;
    private Background backgroundSunset;
    private Background backgroundNight;
    private Background[] backgroundList = new Background[4];
    private Cloud[] couldList = new Cloud[5];
    private Isle isle1;
    private Isle isle2;
    private Isle isle3;
    private Isle isle4;
    private Isle[] isleList = new Isle[4];
    
    private Background backgroundBloodMoon;
    private Isle isle1BloodMoon;
    private Isle isle2BloodMoon;
    private Isle isle3BloodMoon;
    private Isle isle4BloodMoon;
    private Isle[] isleBloodMoonList = new Isle[4];

    private Menu _menu;
    
    Game() throws GameException {
        profil = new Profil("axel");
        
        // Initialize background images
        backgroundMorning = new Background("morning");
        backgroundSunny = new Background("sunny");
        backgroundSunset = new Background("sunset");
        backgroundNight = new Background("night");
        backgroundList[0] = backgroundMorning;
        backgroundList[1] = backgroundSunny;
        backgroundList[2] = backgroundSunset;
        backgroundList[3] = backgroundNight;
        backgroundBloodMoon = new Background("bloodMoon");
        
        // Initialize cloud images
        couldList[0] = new Cloud("cloud1");
        couldList[1] = new Cloud("cloud2");
        couldList[2] = new Cloud("cloud3");
        couldList[3] = new Cloud("cloud4");
        couldList[4] = new Cloud("cloud5");
        
        // Initialize isle images
        isle1 = new Isle("isle1");
        isle2 = new Isle("isle2");
        isle3 = new Isle("isle3");
        isle4 = new Isle("isle4");
        isleList[0] = isle1;
        isleList[1] = isle2;
        isleList[2] = isle3;
        isleList[3] = isle4;
        isle1BloodMoon = new Isle("isle1_bloodMoon");
        isle2BloodMoon = new Isle("isle2_bloodMoon");
        isle3BloodMoon = new Isle("isle3_bloodMoon");
        isle4BloodMoon = new Isle("isle4_bloodMoon");
        isleBloodMoonList[0] = isle1BloodMoon;
        isleBloodMoonList[1] = isle2BloodMoon;
        isleBloodMoonList[2] = isle3BloodMoon;
        isleBloodMoonList[3] = isle4BloodMoon;
    }
    
    /**
     * <p>Initialize Windows.</p>
     *
     * @version 1.0.0
     * @since 1.0.0
     */
    public void initWindows() throws GameException {
        // Initialize windows
        _menu = new Menu();   
    }
    
    /* GETTER */
    
    public Profil getProfil() {
        return profil;   
    }
    
    public Background getBackgroundMorning() {
        return backgroundMorning;
    }
    
    public Background getBackgroundSunny() {
        return backgroundSunny;
    }
    
    public Background getBackgroundSunset() {
        return backgroundSunset;
    }
    
    public Background getBackgroundNight() {
        return backgroundNight;
    }
    
    public Background getBackgroundBloodMoon() {
        return backgroundBloodMoon;
    }
    
    public Cloud[] getCloudList() {
        return couldList;
    }
    
    public Cloud[] getRandomCloudList(int nbCloud) {
        Cloud[] newCloudList = new Cloud[nbCloud];
        int maxRange = couldList.length;
        for (int i=0; i<nbCloud; i++) {
            newCloudList[i] = new Cloud(couldList[(int) random(0, maxRange)]);
        }
        return newCloudList;
    }
    
    public Isle[] getRandomIsleList(int nbIsle, boolean specialIsle) {
        Isle[] newIsleList = new Isle[nbIsle];
        int maxRange = (specialIsle) ? 4 : 3;
        for (int i=0; i<nbIsle; i++) {
            newIsleList[i] = new Isle(isleList[(int) random(0, maxRange)]);
        }
        return newIsleList;
    }
    
    public Isle[] getIsleBloodMoonList() {
        return isleBloodMoonList;
    }
    
    /**
     * <p>Get a random background from a list of background.</p>
     *
     * @return Image : the background image
     *
     * @version 1.0.0
     * @since 1.0.0
     */
    public Background getRandomBackground() {
        // Range : [0;4[
        int rand = (int) random(0, 4);
        return backgroundList[rand];
    }
    
    /**
     * <p>Draw method.</p>
     *
     * @version 1.0.0
     * @since 1.0.0
     */
    public void draw() {
       if (_menu.isActive()) {
           _menu.draw();    
       }
    }
    
    /**
     * <p>Key Pressed method.</p>
     *
     * @version 1.0.0
     * @since 1.0.0
     */
    void keyPressed() {
        if (_menu.isActive()) {
            _menu.keyPressed();    
        }
    }
    
    /**
     * <p>Key Released method.</p>
     *
     * @version 1.0.0
     * @since 1.0.0
     */
    void keyReleased() {
        
    }
    
}
