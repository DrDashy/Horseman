/**
 * All victory screen
 * m_pic1 : victory after winning the level 1 to 8
 * m_pic2 : victory after winning the level 9
 * m_pic3 : victory after winning the boss
 */
public class Victory {

    private PImage m_pic1;
    private PImage m_pic2;
    private PImage m_pic3;
    private AudioPlayer m_win1;
    private AudioPlayer m_win2;
    private AudioPlayer m_win3;
    
    Victory() {
        m_pic1 = loadImage("./data/victory/victoire.png");
        m_pic2 = loadImage("./data/victory/victoire2.png");
        m_pic3 = loadImage("./data/victory/victoire3.png");
        m_win1 = minim.loadFile("./data/victory/music_win1.mp3");
        m_win2 = minim.loadFile("./data/victory/music_win2.mp3");
        m_win3 = minim.loadFile("./data/victory/music_win3.mp3");
    }
    
    public void StopMusic() {
        m_win1.rewind();
        m_win1.pause();
        m_win2.rewind();
        m_win2.pause();
        m_win3.rewind();
        m_win3.pause();
    }
    
    public void WinOtherLevel() {
        m_win1.setGain(-5);
        m_win1.play(); 
        imageMode(CORNER); 
        image(m_pic1, 0, 0, width, height);
    }

    public void WinLevel9() {
        m_win2.setGain(-5);
        m_win2.play(); 
        imageMode(CORNER);
        image(m_pic2, 0, 0, width, height);
    }

    public void WinBoss() {
        m_win3.setGain(-5);
        m_win3.play(); 
        imageMode(CORNER);
        image(m_pic3, 0, 0, width, height);
    }

}
