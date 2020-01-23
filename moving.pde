/*
 * 
 */
public class Moving {
    
    protected float m_speed;
    protected Point m_coord;
    
    Moving() {
        m_speed = 0;
        m_coord = new Point(0, 0);
    }
    
    Moving(float S, float X, float Y) {
        m_speed = S;
        m_coord = new Point(X, Y);
    }
    
    public void setSpeed(float S) {
        m_speed = S;
    }
    
    public void MoveRight(){
        m_coord.setX(m_coord.getX() + m_speed);
    }
      
    public void MoveLeft(){
        m_coord.setX(m_coord.getX() - m_speed);
    }
    
}
