import java.io.*;

// ImageMode
final static int MODE_CORNER = 1;
final static int MODE_CENTER = 2;


private abstract class Image {
    
    // Database
    protected int _id;
    protected String _name;
    protected String _source;
    protected int _modeId;
    
    // Other
    protected PImage picture;
    protected Color colorTint;
    protected Movement movement;
 
    /**
     * Constructor, set an Image object with values in database based on the name.
     *
     * @param name : represent the field <b>name</b> from the table <b>image</b> in the database
     *
     * @exception GameException : Game cannot process further
     */
    private Image(String name) throws GameException {
        _id = -1;
        getImageByName(name);
        
        /*
        TODO : Find a way to check if the file exist, else throw error
        File imageFile = new File('F:\Dashy computer\Projet Git\Horseman_V3\data\menu\menu.png');
        println(imageFile);
        println(_source);
        println(imageFile.exists());
        if (!imageFile.exists()) {
            throw new GameException("Image :: Image with path '" + _source + "' does not exist.");      //<>// //<>//
        }
        */
        picture = loadImage(_source);
        picture.resize(picture.width / RATION_WIDTH, picture.height / RATION_HEIGHT);
    }
    
    /**
     * Retreive Image from database and set values.
     *
     * @param imageName : represent the field <b>name</b> from the table <b>image</b> in the database
     *
     * @exception GameException : Game cannot process further
     */
    private void getImageByName(String imageName) throws GameException {
        SQLite dbConnect = null;
        int colorId = -1;
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
