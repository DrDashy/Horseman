/**
 * Menu principal
 * m_pics : array of all the menu pics
 * m_actualLevel : actual level
 * m_music : music of the menu
 */
class Menu extends Window {

    private PImage[] m_pics;
    private int m_actualLevel;
    private int m_levelMin;
    private int m_levelMax;

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
