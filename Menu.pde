public class Menu extends Window {
 
    // Other
    private ProfilSelector profilSelector;
    private LevelSelector levelSelector;
    
    Menu() throws GameException {
        super("menu");
        profilSelector = new ProfilSelector();
        levelSelector = new LevelSelector();
        
        profilSelector.active();
        levelSelector.inactive();
         //<>//
        music.loopMusic();
    }
    
    @Override
    public void draw() {
        if (profilSelector.isActive()) {
            profilSelector.draw();
        } else if (levelSelector.isActive()) {
            levelSelector.draw();
        }
    }
     //<>//
    @Override
    public void keyPressed() throws GameException {
        if (profilSelector.isActive()) {
            profilSelector.keyPressed();
            if (key == ' ') {
                profilSelector.inactive();
                levelSelector.active();
            }
        } else if (levelSelector.isActive()) {
            levelSelector.keyPressed();
            if (key == ' ') {
                levelSelector.inactive();
                music.resetMusic();
            }
        }
    }
    
    @Override
    public void keyReleased() {
        if (profilSelector.isActive()) {
            profilSelector.keyReleased();
        } else if (levelSelector.isActive()) {
            levelSelector.keyReleased();
        }
    }
    
}
