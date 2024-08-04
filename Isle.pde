class Isle extends Image {
    
    Isle(String imageName) throws GameException {
        super(imageName);
    }
    
    /*
     * Deep copy constructor
     */
    Isle(Isle copy) {
        super(copy);
    }
    
    private void parallaxLeft() {  
        if (movement.coord.getX() < maxPosXLeft ) {
            canDraw = false;
        } else {
            canDraw = true;
        } 
    }
    
    private void respawnLeft() {
        if (movement.coord.getX() < maxPosXLeft ) {
            if (newSpeedOnRespawn) {
                movement.setSpeed(random(_getSpeed()/2, _getSpeed()));
            }
            movement.coord.setCoordinates(random(width, width+(width/2)), random(height/10*2, height/10*5));
        }
    }
    
    private void parallaxRight() {  
        if (movement.coord.getX() > maxPosXRight ) {
            canDraw = false;
        } else {
            canDraw = true;
        }
    }
    
    /*
     * <p>Draw method.</p>
     *
     * @version 1.0.0
     * @since 1.0.0
     */
    @Override
    public void draw() {
        if (canDraw) {
            if (canRespawn) {
                respawnLeft();
            } else {
                parallaxLeft();    
            }
            movement.MoveLeft(); 
            super.draw();
        }
    }
    
}
