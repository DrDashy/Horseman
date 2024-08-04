class Mountain extends Image {
 
    Mountain(String imageName) throws GameException {
        super(imageName);
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
            super.draw();
        }
    }
    
}
