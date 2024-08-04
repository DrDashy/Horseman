/**
 * <p>Window represent a class for the configuration of a scene.</p>
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
private abstract class Window {
    
    // Database info
    private int _id;
    private String _name;
    
    // Other
    protected boolean active;
    protected Music music;
    
    /**
     * Constructor, set a Window object with values in database based on the id.
     *
     * @param id : represent the field <b>id</b> from the table <b>color</b> in the database
     *
     * @exception GameException : Game cannot process further
     */
    private Window(String windowName) throws GameException {
        _id = -1;
        getWindowByName(windowName);
    }
    
    /**
     * <p>Retreive window information in database base by the window's name.</p>
     *
     * @param windowName : value for red, green and blue
     *
     * @exception GameException : Game cannot process further
     *
     * @version 1.0.0
     * @since 1.0.0
     */
    private void getWindowByName(String windowName) throws GameException {
        SQLite dbConnect = null;
        try {
            dbConnect = database.getInstance().getDbConnection();
        } catch (DatabaseException e) {
            println(e.getMessage());
            throw new GameException("Window :: Unable to get the database connection instance."); 
        }
        dbConnect.query(
            (
                "SELECT w.id AS w_id, w.name AS w_name, m.id AS m_id, m.name AS m_name, m.source AS m_source " +
                "FROM window AS w, music AS m " + 
                "WHERE m.id = w.musicId " +
                "AND w.name='%s';"
            ), windowName
        );
        while (dbConnect.next())
        {
            _id = dbConnect.getInt("w_id");
            _name = dbConnect.getString("w_name");
            music = new Music(
                dbConnect.getInt("m_id"), 
                dbConnect.getString("m_name"), 
                dbConnect.getString("m_source")
            );
        }
        if (-1 == _id) {
            throw new GameException("Window :: Window named '" + windowName + "' not initialize properly.");
        }
    }
    
    /**
     * <p>Check if the window is active.</p>
     *
     * @return the boolean value that check if the window is active
     *
     * @version 1.0.0
     * @since 1.0.0
     */
    public boolean isActive() {
        return active;        
    }
    
    /**
     * <p>Set the window active.</p>
     *
     * @version 1.0.0
     * @since 1.0.0
     */
    public void active() {
        active = true;        
    }
    
    /**
     * <p>Set the window inactive.</p>
     *
     * @version 1.0.0
     * @since 1.0.0
     */
    public void inactive() {
        active = false;        
    }
    
    /**
     * <p>Draw method.</p>
     *
     * @version 1.0.0
     * @since 1.0.0
     */
    public abstract void draw();
    
    /**
     * <p>Key Pressed method.</p>
     *
     * @version 1.0.0
     * @since 1.0.0
     */
    public abstract void keyPressed() throws GameException;
    
    /**
     * <p>Key Released method.</p>
     *
     * @version 1.0.0
     * @since 1.0.0
     */
    public abstract void keyReleased();
    
}
