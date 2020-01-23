/**
 * 
 */
public class Cloud extends Decors {
    
    Cloud(BDD bdd) {
        super(bdd);
        m_maxPosXLeft = -300;
        m_maxPosXRight = width + 300; //<>//
    }
    
    @Override
    public void parallaxLeft() {  
        if (m_move.m_coord.getX() <= m_maxPosXLeft ) {
            m_move.m_coord.setCoordinates(random(width, width*2), random(0, height/2));
        }    
    }
    
    @Override
    public void parallaxRight() {  
        if (m_move.m_coord.getX() >= m_maxPosXRight ) {
            m_move.m_coord.setCoordinates(random(0, 0-width*2), random(0, height/2));
        }  
    }
    
}
