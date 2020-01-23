/**
 * Game
 */
class Game extends Window {
    
    private Player m_player;

    Game () {
        super();
        m_player = new Player();
    }
    
    /* Initialize the game */
    public void initWindow(int Level) {
        active = true;
        
        setMusic("musiclevel"+Level);
        
        int type = 0;
        if (Level < 3) {
            type = 0;    
        } else if (Level < 6) {
            type = 1;    
        } else if (Level < 9) {
            type = 2;    
        } else {
            type = 3;    
        }
        
        m_scene.resetDecorsGame(type);
        
        m_music = minim.loadFile("data/game/musiclevel"+Level+".mp3");
        m_music.rewind();
        m_music.pause();
    }
    
    public void draw() {
        m_scene.draw();
        
        if (m_player.m_goingRight) {
            m_scene.moveMountain(direction.LEFT);
            m_scene.moveCloud(direction.LEFT);  
            m_scene.moveIsle(direction.LEFT);
            m_scene.movePlateform(direction.LEFT);
        }
        
        if (m_player.m_goingLeft) {
            m_scene.moveMountain(direction.RIGHT);
            m_scene.moveCloud(direction.RIGHT);  
            m_scene.moveIsle(direction.RIGHT);
            m_scene.movePlateform(direction.RIGHT);
        }
        
        m_music.setGain(-20);
        m_music.play();
        
        m_player.draw();
    }
    
    public void keyPressed() {
        m_player.keyPressed();
        
        if (key == 'm') {
            active = false;
            m_music.rewind();
            m_music.pause();
            menu.initWindow(1);
        }    
    }
    
    public void keyReleased() {
        m_player.keyReleased();    
    }

}
