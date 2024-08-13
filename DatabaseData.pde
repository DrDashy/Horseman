public class DatabaseData {
    
    private DatabaseData _instance = null;
    
    private Image backgroundMorning;
    private Image backgroundSunny;
    private Image backgroundSunset;
    private Image backgroundNight;
    private Image[] backgroundList = new Image[4];
    
    private Image[] couldList = new Image[5];
    
    private Image isle1;
    private Image isle2;
    private Image isle3;
    private Image isle4;
    private Image[] isleList = new Image[4];
    
    private Image backgroundBloodMoon;
    private Image isle1BloodMoon;
    private Image isle2BloodMoon;
    private Image isle3BloodMoon;
    private Image isle4BloodMoon;
    private Image[] isleBloodMoonList = new Image[4];
    
    /***** CONSTRUCTOR *****/
    
    public DatabaseData() throws GameException {
        // Initialize background images
        backgroundMorning = new Image("morning");
        backgroundSunny = new Image("sunny");
        backgroundSunset = new Image("sunset");
        backgroundNight = new Image("night");
        backgroundList[0] = backgroundMorning;
        backgroundList[1] = backgroundSunny;
        backgroundList[2] = backgroundSunset;
        backgroundList[3] = backgroundNight;
        backgroundBloodMoon = new Image("bloodMoon");
        
        // Initialize cloud images
        couldList[0] = new Image("cloud1");
        couldList[1] = new Image("cloud2");
        couldList[2] = new Image("cloud3");
        couldList[3] = new Image("cloud4");
        couldList[4] = new Image("cloud5");
        
        // Initialize isle images
        isle1 = new Image("isle1");
        isle2 = new Image("isle2");
        isle3 = new Image("isle3");
        isle4 = new Image("isle4");
        isleList[0] = isle1;
        isleList[1] = isle2;
        isleList[2] = isle3;
        isleList[3] = isle4;
        isle1BloodMoon = new Image("isle1_bloodMoon");
        isle2BloodMoon = new Image("isle2_bloodMoon");
        isle3BloodMoon = new Image("isle3_bloodMoon");
        isle4BloodMoon = new Image("isle4_bloodMoon");
        isleBloodMoonList[0] = isle1BloodMoon;
        isleBloodMoonList[1] = isle2BloodMoon;
        isleBloodMoonList[2] = isle3BloodMoon;
        isleBloodMoonList[3] = isle4BloodMoon;
    }
    
    /***** METHOD *****/
    
    public DatabaseData getInstance() throws GameException {
        if (null == _instance) {
            _instance = new DatabaseData();
        }
        return _instance;
    }
    
    public Image getBackgroundMorning() {
        return backgroundMorning;
    }
    
    public Image getBackgroundSunny() {
        return backgroundSunny;
    }
    
    public Image getBackgroundSunset() {
        return backgroundSunset;
    }
    
    public Image getBackgroundNight() {
        return backgroundNight;
    }
    
    public Image getBackgroundBloodMoon() {
        return backgroundBloodMoon;
    }
    
    public Image[] getCloudList() {
        return couldList;
    }
    
    public Image getRandomCloud() {
        int maxRange = couldList.length;
        return new Image(couldList[(int) random(0, maxRange)]);
    }
    
    public Image[] getRandomCloudList(int nbCloud) {
        Image[] newCloudList = new Image[nbCloud];
        int maxRange = couldList.length;
        for (int i=0; i<nbCloud; i++) {
            newCloudList[i] = new Image(couldList[(int) random(0, maxRange)]);
        }
        return newCloudList;
    }
    
    public Image getRandomIsle(boolean specialIsle) {
        int maxRange = (specialIsle) ? 4 : 3;
        return new Image(isleList[(int) random(0, maxRange)]);
    }
    
    public Image[] getRandomIsleList(int nbIsle, boolean specialIsle) {
        Image[] newIsleList = new Image[nbIsle];
        int maxRange = (specialIsle) ? 4 : 3;
        for (int i=0; i<nbIsle; i++) {
            newIsleList[i] = new Image(isleList[(int) random(0, maxRange)]);
        }
        return newIsleList;
    }
    
    public Image[] getIsleBloodMoonList() {
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
    public Image getRandomBackground() {
        // Range : [0;4[
        int rand = (int) random(0, 4);
        return backgroundList[rand];
    }
    
}
