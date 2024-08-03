class Isle extends Image {
    
    Isle(String imageName) throws GameException {
        super(imageName);
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
    
    @Override
    public void draw() {
        if (canRespawn) {
            respawnLeft();
        } else {
            parallaxLeft();    
        }
        movement.MoveLeft(); 
        if (canDraw) {
            super.draw();
        }
    }
    
}
