private abstract class View {
    
    // Other
    private boolean isActive;
    
    /***** CONSTRUCTOR *****/
    
    View() {
        isActive = false;
    }
    
    /**
     * <p>Set the window active.</p>
     *
     * @version 1.0.0
     * @since 1.0.0
     */
    public void active() {
        isActive = true;        
    }
    
    /**
     * <p>Set the window inactive.</p>
     *
     * @version 1.0.0
     * @since 1.0.0
     */
    public void inactive() {
        isActive = false;        
    }
    
    /**
     * <p>Get the window active.</p>
     *
     * @version 1.0.0
     * @since 1.0.0
     */
    public boolean isActive() {
        return isActive;        
    }
    
    /**
     * <p>Draw method.</p>
     *
     * @version 1.0.0
     * @since 1.0.0
     */
    public abstract void draw();
    
    /**
     * <p>Key Pressed method.</p>
     *
     * @version 1.0.0
     * @since 1.0.0
     */
    public abstract void keyPressed() throws GameException;
    
    /**
     * <p>Key Released method.</p>
     *
     * @version 1.0.0
     * @since 1.0.0
     */
    public abstract void keyReleased();
    
}
