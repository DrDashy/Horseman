/**
 * All gameOver screen
 * m_pic1 : pic of the death by falling the platform
 * m_pic2 : pic of the death by falling on a spike
 * m_pic3 : pic of the death by falling on a cook
 * m_pic4 : pic of the death by the boss treasure
 */
public class GameOver {

    private PImage m_pic1;
    private PImage m_pic2;
    private PImage m_pic3;
    private PImage m_pic4;
    
    GameOver() {
        m_pic1 = loadImage("./data/gameover/gameover1.png");
        m_pic2 = loadImage("./data/gameover/gameover2.png");
        m_pic3 = loadImage("./data/gameover/gameover3.png");
        m_pic4 = loadImage("./data/gameover/gameover4.png");
    }
    
    public void DeathFall() {
        image(m_pic1, 0, 0, width, height);   
    }
    
    public void DeathSpike() {
        image(m_pic2, 0, 0, width, height);   
    }
    
    public void DeathCook() {
        image(m_pic3, 0, 0, width, height);   
    }
    
    public void DeathBoss() {
        image(m_pic4, 0, 0, width, height);   
    }

}
