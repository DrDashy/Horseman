public class Game {
    
    private Background backgroundMorning;
    private Background backgroundSunny;
    private Background backgroundSunset;
    private Background backgroundNight;
    private Background backgroundBloodMoon;
    private Background[] backgroundList = new Background[5];
    private Cloud[] couldList = new Cloud[5];

    public Menu _menu;
    
    Game() throws GameException {
        // Initialize background images
        backgroundMorning = new Background("morning");
        backgroundSunny = new Background("sunny");
        backgroundSunset = new Background("sunset");
        backgroundNight = new Background("night");
        backgroundBloodMoon = new Background("bloodMoon");
        backgroundList[0] = backgroundMorning;
        backgroundList[1] = backgroundSunny;
        backgroundList[2] = backgroundSunset;
        backgroundList[3] = backgroundNight;
        // Initialize cloud images
        couldList[0] = new Cloud("cloud1");
        couldList[1] = new Cloud("cloud2");
        couldList[2] = new Cloud("cloud3");
        couldList[3] = new Cloud("cloud4");
        couldList[4] = new Cloud("cloud5");
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
