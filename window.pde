/**
 *
 */
private abstract class Window {
    
    protected boolean active;
    protected MiseEnScene m_scene;
    protected AudioPlayer m_music;
    
    private Window () {
        active = false; 
        m_scene = new MiseEnScene();
    }
    
    public void setMusic(String songName) {
        m_music = minim.loadFile("data/menu/" + songName + ".mp3");        
    }
    
    public boolean isActive() {
        return active;        
    }
    
    public abstract void initWindow(int Level);
    
}  
