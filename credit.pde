final int DURATION_CREDIT = 77; // Time in seconds

/*
 * Credit of the game
 * m_pic : picture of the credit
 * m_coord : position of the picture
 * m_timer : timer before the credit stop
 * m_active : boolean to know if the credit is active
 * m_music : music for the credit
 */
public class Credit {

    private PImage m_pic;
    private Point m_coord;
    private Timer m_timer;
    private boolean m_active;
    private AudioPlayer m_music;
    
    Credit() {
        m_pic = loadImage("./data/credit/credit.png");
        m_coord = new Point((width/2-428), height);
        m_timer = new Timer(DURATION_CREDIT);
        m_active = false;
        m_music = minim.loadFile("./data/credit/music_credit.mp3");
    }
    
    public boolean isActive() {
        return m_active;
    }
    
    public void activeCredit() {
        m_timer.setTimer();
        m_active = true;
        m_music.rewind();
        m_music.pause();
    }
    
    /* Update the Y position for the picture */
    private void updateCoord() {
        m_coord.setY(m_coord.getY() - 2);
    }
    
    public void draw() {
        m_music.setGain(-5);
        m_music.play(); 
        
        imageMode(CENTER);  
        image(m_pic, m_coord.getX(), m_coord.getX());
        
        updateCoord();
        
        if( !m_timer.isWorking() ) {
            m_active = false;
        }
    }
    
    public void keyPressed() {
        
    }

}
