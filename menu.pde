/**
 * <b>Menu represent a class for the main menu.<b>
 * <p>
 * Only one instance of menu is created.
 * the member of menu is characterised by :
 * <ul>
 * <li>A list of all picture of the menu.</li>
 * <li>The number of the choosen level (can be 1 to 9).</li>
 * <li>The number of the minimum level : 1.</li>
 * <li>The number of the maximum level : 9.</li>
 * </ul>
 * </p>
 *
 * @author Axel DUCUING
 * @version 1.0.0
 * @since 1.0.0
 */
class Menu extends Window {
    
    /** Array of all the menu pics */
    private PImage[] m_pics;
    /** Actual level choose */
    private int m_actualLevel;
    /** Number of the first level */
    private int m_levelMin;
    /** Number of the last level */
    private int m_levelMax;

    /** 
     * Constructor Menu
     *
     * <p>
     * When the menu is created, we initialize the window.
     * All pictures are loaded, add we set the music.
     * We also initialize the level choose by default, which is the level 1.
     * </p>
     *
     * @see Window
     */
    Menu () { 
        super();
        setMusic("music_menu");
        m_pics = new PImage[9];
        m_pics[0] = loadImage("data/menu/menu1.png");
        m_pics[1] = loadImage("data/menu/menu2.png");
        m_pics[2] = loadImage("data/menu/menu3.png");
        m_pics[3] = loadImage("data/menu/menu4.png");
        m_pics[4] = loadImage("data/menu/menu5.png");
        m_pics[5] = loadImage("data/menu/menu6.png");
        m_pics[6] = loadImage("data/menu/menu7.png");
        m_pics[7] = loadImage("data/menu/menu8.png");
        m_pics[8] = loadImage("data/menu/menu9.png");
        m_levelMin = 1;
        m_levelMax = 9;
        m_actualLevel = m_levelMin;
    }
    
    /**
     * 
     * @return 
     */
    public int getLevelChoose() {
        return m_actualLevel;
    }
    
    /* Initialize the menu */
    public void initWindow(int Level) {
        active = true;
        m_scene.resetDecorsMenu((int) random(0, 5));
        m_actualLevel = Level;
        m_music.rewind();
        m_music.pause();
    }
    
    private void nextLevel() {
        if (m_actualLevel < m_levelMax) {
            m_actualLevel++;   
        }
    }
    
    private void oldLevel() {
        if (m_actualLevel > m_levelMin) {
            m_actualLevel--;    
        }
    }
    
    public void draw() {
        m_scene.draw();
        m_scene.moveMountain(direction.LEFT);
        m_scene.moveCloud(direction.LEFT);
        
        m_music.setGain(-20);
        m_music.play(); 
        imageMode(CORNERS); 
        image(m_pics[m_actualLevel-1], 0, 0, width, height);
    }
    
    public void keyPressed() {
        if (key == CODED) {
            if (keyCode == LEFT) {
                oldLevel();
            }
            if (keyCode == RIGHT) {
                nextLevel();
            }
        }
        if (key == ' ') {
            active = false;
            m_music.rewind();
            m_music.pause();
            game.initWindow(m_actualLevel);
        }
    }

}
