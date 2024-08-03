public class Movement {
    
    protected float speed;
    protected Point coord;
    
    Movement() {
        speed = 0;
        coord = new Point(0, 0);
    }
    
    Movement(float speed, float x, float y) {
        this.speed = speed;
        coord = new Point(x, y);
    }
    
    /*
     * Deep copy constructor
     */
    private Movement(Movement copy) {
        speed = copy.speed;
        coord = new Point(copy.coord);
    }
    
    public void setSpeed(float newSpeed) {
        speed = newSpeed;
    }
    
    public void MoveRight(){
        coord.setX(coord.getX() + speed);
    }
      
    public void MoveLeft(){
        coord.setX(coord.getX() - speed);
    }
    
}
