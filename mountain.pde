public class Mountain extends Decors {
    
    Mountain(BDD bdd) {
        super(bdd);
        m_maxPosXLeft = (0 - m_pic.width);
        m_maxPosXRight = (0 + 2 * m_pic.width);
    }
    
    @Override
    public void parallaxLeft() {  
        if (m_move.m_coord.getX() <= m_maxPosXLeft ) {
            m_move.m_coord.setX(0 + 2 * m_pic.width);
        }    
    }
    
    @Override
    public void parallaxRight() {  
        if (m_move.m_coord.getX() >= m_maxPosXRight ) {
            m_move.m_coord.setX(0 - m_pic.width);
        }  
    }
    
}
