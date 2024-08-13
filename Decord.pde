public class Decord {
 
    private imageType imageType;
    private Image image;
    private PImage picture;
    private Color colorTint;
    private Movement movement;
    
    private int maxPosXLeft;
    private int maxPosXRight;
    
    private boolean canDraw;
    private boolean canAutoMove;
    private movementDirection direction;
    private boolean canRespawn;
    private boolean newImageOnRespawn;
    private boolean newSpeedOnRespawn;
    private float respawnPosXMin;
    private float respawnPosXMax;
    private float respawnPosYMin;
    private float respawnPosYMax;
    
    /***** CONSTRUCTOR *****/
    
    Decord(
        imageType imageType, String imageName, boolean canAutoMove, movementDirection direction
    ) throws GameException {
        this.imageType = imageType;
        image = new Image(imageName);
        colorTint = new Color(image._getColorId());
        movement = new Movement(random(image._getSpeed()/2, image._getSpeed()), image._getPosX(), image._getPosY());
        loadPicture();
        initMaxPosX();
        canDraw = true;
        this.canAutoMove = canAutoMove;
        this.direction = direction;
    }
    
    Decord(
        imageType imageType, String imageName, float initPosX, float initPosY, boolean canAutoMove, movementDirection direction
    ) throws GameException {
        this.imageType = imageType;
        image = new Image(imageName);
        colorTint = new Color(image._getColorId());
        movement = new Movement(random(image._getSpeed()/2, image._getSpeed()), initPosX, initPosY);
        loadPicture();
        initMaxPosX();
        canDraw = true;
        this.canAutoMove = canAutoMove;
        this.direction = direction;
    }
    
    Decord(
        imageType imageType, Image image, boolean canAutoMove, movementDirection direction
    ) throws GameException {
        this.imageType = imageType;
        this.image = image;
        colorTint = new Color(image._getColorId());
        movement = new Movement(random(image._getSpeed()/2, image._getSpeed()), image._getPosX(), image._getPosY());
        loadPicture();
        initMaxPosX();
        canDraw = true;
        this.canAutoMove = canAutoMove;
        this.direction = direction;
    }
    
    Decord(
        imageType imageType, Image image, float initPosX, float initPosY, boolean canAutoMove, movementDirection direction
    ) throws GameException {
        this.imageType = imageType;
        this.image = image;
        colorTint = new Color(image._getColorId());
        movement = new Movement(random(image._getSpeed()/2, image._getSpeed()), initPosX, initPosY);
        loadPicture();
        initMaxPosX();
        canDraw = true;
        this.canAutoMove = canAutoMove;
        this.direction = direction;
    }
    
    /*
     * Deep copy constructor
     */
     Decord(Decord copy) {
         imageType = copy.imageType;
         image = new Image(copy.image);
         picture = copy.picture;
         colorTint = new Color(copy.colorTint);
         movement = new Movement(copy.movement);
         maxPosXLeft = copy.maxPosXLeft;
         maxPosXRight = copy.maxPosXRight;
         canDraw = copy.canDraw;
         canAutoMove = copy.canAutoMove;
         direction = copy.direction;
         canRespawn = copy.canRespawn;
         newImageOnRespawn = copy.newImageOnRespawn;
         newSpeedOnRespawn = copy.newSpeedOnRespawn;
         respawnPosXMin = copy.respawnPosXMin;
         respawnPosXMax = copy.respawnPosXMax;
         respawnPosYMin = copy.respawnPosYMin;
         respawnPosYMax = copy.respawnPosYMax;
     }
    
    /***** GETTER *****/
    
    public Image getImage() {
        return image;
    }
    
    /***** METHOD *****/
    
    private void loadPicture() {
        picture = loadImage(image._getSource());
        picture.resize(picture.width / RATION_WIDTH, picture.height / RATION_HEIGHT);    
    }
    
    public void initRespawn(
        boolean newImageOnRespawn, boolean newSpeedOnRespawn, float respawnPosXMin, 
        float respawnPosXMax, float respawnPosYMin, float respawnPosYMax
    ) {
        this.canRespawn = true;
        this.newImageOnRespawn = newImageOnRespawn;
        this.newSpeedOnRespawn = newSpeedOnRespawn;
        this.respawnPosXMin = respawnPosXMin;
        this.respawnPosXMax = respawnPosXMax;
        this.respawnPosYMin = respawnPosYMin;
        this.respawnPosYMax = respawnPosYMax;
    }
    
    /**
     * Initialize the coordonate max on the horizontal axis where an action will be triggered.
     *
     * @version 1.0.0
     * @since 1.0.0
     */
    private void initMaxPosX() {
        maxPosXLeft = MAX_POS_X_LEFT - picture.width;
        maxPosXRight = MAX_POS_X_RIGHT + picture.width;
    }
    
    private void parallaxLeft() {  
        if (movement.coord.getX() < maxPosXLeft ) {
            canDraw = false;
        } else {
            canDraw = true;
        }
    }
    
    private void parallaxRight() {  
        if (movement.coord.getX() > maxPosXRight ) {
            canDraw = false;
        } else {
            canDraw = true;
        } 
    }
    
    private void respawnRight() {
        if (movement.coord.getX() < maxPosXLeft ) {
            if (newImageOnRespawn) {
                switch (imageType) {
                    case CLOUD:
                        image = databaseData.getRandomCloud();
                        break;
                        
                    case ISLE:
                        image = databaseData.getRandomIsle(false);
                        break; 
                        
                    default:
                        break;
                }
                loadPicture();
            }
            if (newSpeedOnRespawn) {
                movement.setSpeed(random(image._getSpeed()/2, image._getSpeed()));
            }
            movement.coord.setCoordinates(random(respawnPosXMin, respawnPosXMax), random(respawnPosYMin, respawnPosYMax));
        }
    }
    
    /**
     * <p>Draw method.</p>
     *
     * @version 1.0.0
     * @since 1.0.0
     */
    public void draw() {
        if (canDraw) {
            if (canAutoMove) {
                switch (direction) {
                    case NONE:
                        break;
                    
                    case LEFT:
                        if (canRespawn) {
                            respawnRight();
                        } else {
                            parallaxLeft();    
                        }
                        movement.MoveLeft();
                        break;
                        
                    case RIGHT:
                    case UP:
                    case DOWN:
                    case UP_LEFT:
                    case UP_RIGHT:
                    case DOWN_LEFT:
                    case DOWN_RIGHT:
                        break;
                }
            }
            tint(colorTint.getRed(), colorTint.getGreen(), colorTint.getBlue(), colorTint.getAlpha());
            switch(image._getModeId()) {
                case MODE_CORNER:
                    imageMode(CORNER);
                    break;
                case MODE_CENTER:
                    imageMode(CENTER);
                    break;
            }
            image(picture, movement.coord.getX(), movement.coord.getY());
            // Reset tint for other elements to draw properly
            tint(255);
        }
    }
    
}
