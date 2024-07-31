public class Menu extends Window {
 
    protected Background background;
    protected Mountain mountain;
    protected Cloud[] cloudList;
    protected TextImage menuText;
    
    Menu() throws GameException {
        super("menu");
        background = game.getRandomBackground();
        mountain = new Mountain("mountain_" + background._name);
        cloudList = game.getCloudList();
        menuText = new TextImage("menu");
    }
    
    @Override
    public void draw() {
        background.draw();
        
        for (Cloud cloud : cloudList) {
            cloud.draw();
        }
        
        mountain.draw();
        
        menuText.draw();
    }
    
    @Override
    public void keyPressed() {
                   
    }
    
    @Override
    public void keyReleased() {
                   
    }
    
}
