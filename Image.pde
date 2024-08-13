import java.io.*;

// ImageMode
final static int MODE_CORNER = 1;
final static int MODE_CENTER = 2;

// Image type
enum imageType {
    BACKGROUND,
    MOUNTAIN,
    TEXT,
    CLOUD,
    ISLE
}


public class Image {
    
    // Database
    private int _id = -1;
    private String _name;
    private String _source;
    private int _modeId;
    private int _colorId = -1;
    private float _speed;
    private int _xPos;
    private int _yPos;
    
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
            throw new GameException("Image :: Image with path '" + _source + "' does not exist."); //<>// //<>//
        }
        */
    }
    
    /*
     * Deep copy constructor
     */
    private Image(Image copy) {
        _id = copy._id;
        _name = copy._name;
        _source = copy._source;
        _modeId = copy._modeId;
        _colorId = copy._colorId;
        _speed = copy._speed;
        _xPos = copy._xPos;
        _yPos = copy._yPos;
    }
    
    /***** GETTER *****/
    
    public String _getName() {
        return _name;
    }
    
    public String _getSource() {
        return _source;
    }
    
    public int _getModeId() {
        return _modeId;
    }
    
    public int _getColorId() {
        return _colorId;
    }
    
    public float _getSpeed() {
        return _speed;
    }
    
    public int _getPosX() {
        return _colorId;    
    }
    
    public int _getPosY() {
        return _colorId;
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
            _colorId = dbConnect.getInt("colorId");
            _speed = dbConnect.getInt("speed");
            _xPos = dbConnect.getInt("xPos");
            _yPos = dbConnect.getInt("yPos");
        }
        if (-1 == _id || -1 == _colorId) {
            throw new GameException("Image :: Image named '" + imageName + "' not initialize properly.");
        }
    }
    
}
