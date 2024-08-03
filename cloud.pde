class Cloud extends Image {
    
    Cloud(String imageName) throws GameException {
        super(imageName);
    }
    
    /*
     * Deep copy constructor
     */
    Cloud(Cloud copy) {
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
                movement.setSpeed(random(_speed/2, _speed));
            }
            movement.coord.setCoordinates(random(width, width*2), random(0, height/2));
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
        if (canRespawn) {
            respawnLeft();
        } else {
            parallaxLeft();    
        }
        movement.MoveLeft();
        super.draw();
    }
    
}
