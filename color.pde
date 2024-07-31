/**
 * <p>Audio represent a class for the configuration and use of the minim library.</p>
 * <p>
 * <ul>
 * <li>_id : represent the field <b>id</b> from the table <b>color</b> in the database.</li>
 * <li>_red : represent the field <b>red</b> from the table <b>color</b> in the database.</li>
 * <li>_green : represent the field <b>green</b> from the table <b>color</b> in the database.</li>
 * <li>_blue : represent the field <b>blue</b> from the table <b>color</b> in the database.</li>
 * <li>_alpha : represent the field <b>alpha</b> from the table <b>color</b> in the database.</li>
 * </ul>
 * </p>
 *
 * @author Axel DUCUING
 * @version 1.0.0
 * @since 1.0.0
 */
public class Color { 
    
    private int _id;
    private int _red;
    private int _green;
    private int _blue;
    private int _alpha;
    
    /**
     * Constructor, set by the same value for red, green and blue and another value to the alpha.
     *
     * @param rvb : value for red, green and blue
     * @param alpha : value for alpha
     *
     * @version 1.0.0
     * @since 1.0.0
     */
    Color(int rvb, int alpha) {
        _id = -1;
        _red = rvb;
        _green = rvb;
        _blue = rvb; 
        _alpha = alpha;
    }
    
    /**
     * Constructor, copy the value for red, green, blue and alpha from another color object.
     *
     * @param rvb : value for red, green and blue
     * @param alpha : value for alpha
     *
     * @version 1.0.0
     * @since 1.0.0
     */
    Color(Color otherColor) {
        _id = otherColor.getId();
        _red = otherColor.getRed();
        _green = otherColor.getGreen();
        _blue = otherColor.getBlue(); 
        _alpha = otherColor.getAlpha();
    }
    
    /**
     * Constructor, set a specific value for red, green, blue and alpha.
     *
     * @param red : value for red
     * @param green : value for green
     * @param blue : value for blue
     * @param alpha : value for alpha
     *
     * @version 1.0.0
     * @since 1.0.0
     */
    Color(int red, int green, int blue, int alpha) {
        _id = -1;
        _red = red;
        _green = green;
        _blue = blue; 
        _alpha = alpha;
    }
    
    /**
     * Constructor, set a Color object with values in database based on the id.
     *
     * @param id : represent the field <b>id</b> from the table <b>color</b> in the database
     *
     * @exception GameException : Game cannot process further
     *
     * @version 1.0.0
     * @since 1.0.0
     */
    Color(int id) throws GameException {
        _id = -1;
        getColorById(id);     
    }
    
    /**
     * Retreive Color from database and set values.
     *
     * @param colorId : represent the field <b>id</b> from the table <b>color</b> in the database
     *
     * @exception GameException : Game cannot process further
     *
     * @version 1.0.0
     * @since 1.0.0
     */
    private void getColorById(int colorId) throws GameException {
        SQLite dbConnect = null;
        try {
            dbConnect = database.getInstance().getDbConnection();
        } catch (DatabaseException e) {
            println(e.getMessage());
            throw new GameException("Image :: Unable to get the database connection instance.");
        }
        dbConnect.query(
            (
                "SELECT id, red, green, blue, alpha " +
                "FROM color AS c " + 
                "WHERE c.id='%d';"
            ), colorId
        );
        while (dbConnect.next())
        {
            _id = dbConnect.getInt("id");
            _red = dbConnect.getInt("red");
            _green = dbConnect.getInt("green");
            _blue = dbConnect.getInt("blue");
            _alpha = dbConnect.getInt("alpha");
        }
        if (-1 == _id) {
            throw new GameException("Color :: Color with id '" + colorId + "' not initialize properly.");
        }
    }
    
    /* GETTER */
    public int getId() {
        return _id;
    }
    
    public int getRed() {
        return _red;
    }
    
    public int getGreen() {
        return _green;
    }
    
    public int getBlue() {
        return _blue;
    }
    
    public int getAlpha() {
        return _alpha;
    }
    
    /**
     * <p>Return the color object in RGBA format.</p>
     *
     * @return the color object in RVBA format
     *
     * @version 1.0.0
     * @since 1.0.0
     */
    public color getColor() {
        return color(_red, _green, _blue, _alpha);
    }
    
    /**
     * <p>Update the red, green and blue color value.</p>
     *
     * @param red : new value for red
     * @param green : new value for green
     * @param blue : new value for blue
     *
     * @version 1.0.0
     * @since 1.0.0
     */
    public void changeColor(int red, int green, int blue) {
        _red = red;
        _green = green;
        _blue = blue;
    }
    
    /**
     * <p>Copy the red, green and blue color value from another color.</p>
     *
     * @param otherColor : color object
     *
     * @version 1.0.0
     * @since 1.0.0
     */
    public void changeColor(Color otherColor) {
        _red = otherColor.getRed();
        _green = otherColor.getGreen();
        _blue = otherColor.getBlue();
    }
    
    /**
     * <p>Update the alpha.</p>
     *
     * @param int alpha : new value of alpha.
     *
     * @version 1.0.0
     * @since 1.0.0
     */
    public void changeAlpha(int alpha) {
        _alpha = alpha;
    }
    
    /**
     * <p>Set a new random RVB color.</p>
     *
     * @version 1.0.0
     * @since 1.0.0
     */
    public void changeColorRandomly() {
        // Range : [0;256[
        _red = (int) random(0, 256);
        _green = (int) random(0, 256);
        _blue = (int) random(0, 256);
    }
    
}
