class Cloud extends Image {
    
    Cloud(String imageName) throws GameException {
        super(imageName);
        
        // Initialize position of cloud out of screen
        movement.coord.setX(random(0, width*2));
        movement.coord.setY(random(0, height/2)); 
    }
    
    private void parallaxLeft() {  
        if (movement.coord.getX() < maxPosXLeft ) {
            movement.coord.setCoordinates(random(width, width*2), random(0, height/2));
        }    
    }
    
    @Override
    public void draw() {
        parallaxLeft();
        movement.MoveLeft();
        super.draw();
    }
    
}
