public class Game {
    
    private Profil profil;
    private Menu _menu;
    
    Game() throws GameException {
        profil = new Profil("axel");
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
    
    public Profil getProfil() {
        return profil;   
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
    public void keyPressed() throws GameException {
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
    public void keyReleased() {
        
    }
    
}
