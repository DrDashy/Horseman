public class ProfilSelector extends View {
       
    // Other
    private TextImage newGameText;
    private TextImage newGameHighlightText;
    private TextImage continueGameLockedText;
    private TextImage continueGameText;
    private TextImage continueGameHighlightText;
    private int actualLevel = game.getProfil().getMaxLevelUnlocked();
    
    /***** CONSTRUCTOR *****/
    
    ProfilSelector() throws GameException {
        super();
        newGameText = new TextImage("newGame");
        newGameHighlightText = new TextImage("newGameHighlight");
        continueGameLockedText = new TextImage("continueGameLocked");
        continueGameText = new TextImage("continueGame");
        continueGameHighlightText = new TextImage("continueGameHighlight");
        initMenu();
    }
    
    /***** METHOD *****/
    
    private void initMenu() {
        float xPos = (width/2) - (newGameText.picture.width/2);
        float yPos = (height/2) - (newGameText.picture.height/2);
        int margin = newGameText.picture.height;
        
        newGameText.movement.coord.setCoordinates(xPos, yPos);
        newGameHighlightText.movement.coord.setCoordinates(xPos, yPos);
        yPos += margin*2;
        continueGameLockedText.movement.coord.setCoordinates(xPos, yPos);
        continueGameText.movement.coord.setCoordinates(xPos, yPos);
        continueGameHighlightText.movement.coord.setCoordinates(xPos, yPos);
        
        if (actualLevel == 0) {
            newGameText.canDraw = false;
            newGameHighlightText.canDraw = true;
            continueGameLockedText.canDraw = true;
            continueGameText.canDraw = false;
            continueGameHighlightText.canDraw = false;
        } else {
            newGameText.canDraw = true;
            newGameHighlightText.canDraw = false;
            continueGameLockedText.canDraw = false;
            continueGameText.canDraw = false;
            continueGameHighlightText.canDraw = true;
        }
    }
    
    private void changeFocus() {
        if (!continueGameLockedText.canDraw) {
            if (newGameHighlightText.canDraw) {
                newGameText.canDraw = true;
                newGameHighlightText.canDraw = false;
                continueGameText.canDraw = false;
                continueGameHighlightText.canDraw = true;
            } else {
                newGameText.canDraw = false;
                newGameHighlightText.canDraw = true;
                continueGameText.canDraw = true;
                continueGameHighlightText.canDraw = false;
            }
        }
    }
    
    public boolean isNewGame() {
        if (newGameHighlightText.canDraw) {
            return true;    
        }
        return false;
    }
    
    private void resetGame() throws GameException {
        actualLevel = game.getProfil().getMaxLevelUnlocked();
        game.profil.setMaxLevelUnlocked(1);
        game.profil.updateMaxLevelUnlocked(1);
    }
    
    @Override
    public void draw() {
        if (isActive()) {
            newGameText.draw();
            newGameHighlightText.draw();
            continueGameLockedText.draw();
            continueGameText.draw();
            continueGameHighlightText.draw();
        }
    }
    
    @Override
    public void keyPressed() throws GameException {
        if (key == CODED) {
            if (keyCode == UP || keyCode == DOWN) {
                changeFocus();
            }
        }
    }
    
    @Override
    public void keyReleased() {
                   
    }
    
}
