import java.io.*;

// ImageMode
final static int MODE_CORNER = 1;
final static int MODE_CENTER = 2;


private abstract class Image {
    
    // Database
    private int _id = -1;
    private String _name;
    private String _source;
    private int _modeId;
    private float _speed;
    
    // Other
    protected PImage picture;
    protected Color colorTint;
    protected Movement movement;
    protected boolean canDraw = true;
    protected boolean canRespawn = false;
    protected boolean newSpeedOnRespawn = false;
    protected boolean isSpecialPic = false;
    protected int maxPosXLeft;
    protected int maxPosXRight;
 
    /***** CONSTRUCTOR *****/
 
    /**
     * Constructor, set an Image object with values in database based on the name.
     *
     * @param name : represent the field <b>name</b> from the table <b>image</b> in the database
     *
     * @exception GameException : Game cannot process further
     */
    private Image(String name) throws GameException {
        getImageByName(name);
        
        /*
        TODO : Find a way to check if the file exist, else throw error
        File imageFile = new File('F:\Dashy computer\Projet Git\Horseman_V3\data\menu\menu.png');
        println(imageFile);
        println(_source);
        println(imageFile.exists());
        if (!imageFile.exists()) {
            throw new GameException("Image :: Image with path '" + _source + "' does not exist."); //<>// //<>// //<>// //<>//
        }
        */
        
        picture = loadImage(_source);
        picture.resize(picture.width / RATION_WIDTH, picture.height / RATION_HEIGHT);
        
        initMaxPosX();
    }
    
    /*
     * Deep copy constructor
     */
    private Image(Image copy) {
        _id = copy._id;
        _name = copy._name;
        _source = copy._source;
        _modeId = copy._modeId;
        _speed = copy._speed;
        picture = copy.picture;
        colorTint = copy.colorTint;
        movement = new Movement(copy.movement);
        canDraw = copy.canDraw;
        canRespawn = copy.canRespawn;
        newSpeedOnRespawn = copy.newSpeedOnRespawn;
        maxPosXLeft = copy.maxPosXLeft;
        maxPosXRight = copy.maxPosXRight;
    }
    
    /***** GETTER *****/
    
    public String _getName() {
        return _name;    
    }
    
    public float _getSpeed() {
        return _speed;    
    }
    
    /***** METHOD *****/
    
    /**
     * Retreive Image from database and set values.
     *
     * @param imageName : represent the field <b>name</b> from the table <b>image</b> in the database
     *
     * @exception GameException : Game cannot process further
     *
     * @version 1.0.0
     * @since 1.0.0
     */
    private void getImageByName(String imageName) throws GameException {
        int colorId = -1;
        SQLite dbConnect = null;
        try {
            dbConnect = database.getInstance().getDbConnection();
        } catch (DatabaseException e) {
            println(e.getMessage());
            throw new GameException("Image :: Unable to get the database connection instance.");
        }
        dbConnect.query(
            (
                "SELECT id, name, source, modeId, colorId, speed, xPos, yPos " +
                "FROM image " + 
                "WHERE name='%s';"
            ), imageName
        );
        while (dbConnect.next())
        {
            _id = dbConnect.getInt("id");
            _name = dbConnect.getString("name");
            _source = dbConnect.getString("source");
            _modeId = dbConnect.getInt("modeId");
            _speed = dbConnect.getInt("speed");
            colorId = dbConnect.getInt("colorId");
            movement = new Movement(
                dbConnect.getInt("speed"), 
                dbConnect.getInt("xPos"), dbConnect.getInt("yPos")
            );
        }
        if (-1 == _id || -1 == colorId) {
            throw new GameException("Image :: Image named '" + imageName + "' not initialize properly.");
        }
        colorTint = new Color(colorId);
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
    
    /**
     * <p>Draw method.</p>
     *
     * @version 1.0.0
     * @since 1.0.0
     */
    public void draw() {
        tint(colorTint.getRed(), colorTint.getGreen(), colorTint.getBlue(), colorTint.getAlpha());
        switch(_modeId) {
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
