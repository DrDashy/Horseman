class MenuLevelText {
    
    private TextImage level;
    private TextImage levelHighlight;
    private TextImage levelLocked;
 
    MenuLevelText(int levelNumber) throws GameException {
        level = new TextImage("menu" + levelNumber);
        levelHighlight = new TextImage("menu" + levelNumber + "Highlight");
        levelLocked = new TextImage("menu" + levelNumber + "Locked");
    }
    
    protected void initLevel(float xPos, float yPos) {
        levelLocked.movement.coord.setCoordinates(xPos, yPos);
        levelLocked.canDraw = true;
        level.movement.coord.setCoordinates(xPos, yPos);
        level.canDraw = false;
        levelHighlight.movement.coord.setCoordinates(xPos, yPos);
        levelHighlight.canDraw = false;
    }
    
    protected void lockedLevel() {
        levelLocked.canDraw = true;
        level.canDraw = false;
        levelHighlight.canDraw = false;
    }
    
    protected void unlockedLevel() {
        levelLocked.canDraw = false;
        level.canDraw = true;
    }
    
    protected void inactiveLevel() {
        level.canDraw = true;
        levelHighlight.canDraw = false;
    }
    
    protected void activeLevel() {
        level.canDraw = false;
        levelHighlight.canDraw = true;
    }
    
    /*
     * <p>Draw method.</p>
     *
     * @version 1.0.0
     * @since 1.0.0
     */
    public void draw() {
        level.draw();
        levelHighlight.draw();
        levelLocked.draw();
    }
    
}
