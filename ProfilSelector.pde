public class ProfilSelector extends View {
       
    ProfilSelector() {
        super();
    }
    
    @Override
    public void draw() {
        
    }
    
    @Override
    public void keyPressed() throws GameException {
        if (key == ' ') {
            inactive();
        }
    }
    
    @Override
    public void keyReleased() {
                   
    }
    
}
