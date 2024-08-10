/**
 * <p>The class <b>Music</b> represent a class for the configuration and use of an audio music player.<p>
 * <p>
 * <ul>
 * <li>_id : represent the field <b>id</b> from the table <b>music</b> in the database.</li>
 * <li>_name : represent the field <b>name</b> from the table <b>music</b> in the database.</li>
 * <li>_source : represent the field <b>source</b> from the table <b>music</b> in the database.</li>
 * <li>music : represent the audio music player.</li>
 * </ul>
 * </p>
 *
 * @author Axel DUCUING
 * @version 1.0.0
 * @since 1.0.0
 */
class Music extends Audio {
    
    // Database info
    private int _id = -1;
    private String _name;
    private String _source;
    
    // Other
    private AudioPlayer music;
    
    /***** CONSTRUCTOR *****/
    
    Music (String musicName) throws GameException {
        super();
        getMusicByName(musicName);
        music = getInstance().loadFile(_source);
    }
    
    /**
     * Constructor, set the values with given parameters.
     *
     * @param id : represent the field <b>id</b> from the table <b>music</b> in the database
     * @param name : represent the field <b>name</b> from the table <b>music</b> in the database
     * @param source : represent the field <b>source</b> from the table <b>music</b> in the database
     *
     * @version 1.0.0
     * @since 1.0.0
     */
    Music (int id, String name, String source) {
        super();
        _id = id;
        _name = name;
        _source = source;
        music = getInstance().loadFile(_source);
    }
    
    /***** METHOD *****/
    
    /**
     * <p>Retreive music information in database base by the music's name.</p>
     *
     * @param musicName : represent the field <b>name</b> from the table <b>music</b> in the database
     *
     * @exception GameException : Game cannot process further
     *
     * @version 1.0.0
     * @since 1.0.0
     */
    private void getMusicByName(String musicName) throws GameException {
        SQLite dbConnect = null;
        try {
            dbConnect = database.getInstance().getDbConnection();
        } catch (DatabaseException e) {
            println(e.getMessage());
            throw new GameException("Music :: Unable to get the database connection instance."); 
        }
        dbConnect.query(
            (
                "SELECT id, name, source " +
                "FROM music " + 
                "WHERE name='%s';"
            ), musicName
        );
        while (dbConnect.next())
        {
            _id = dbConnect.getInt("id");
            _name = dbConnect.getString("name");
            _source = dbConnect.getString("source");
        }
        if (-1 == _id) {
            throw new GameException("Music :: Music named '" + musicName + "' not initialize properly.");
        }
    }
    
    /**
     * <p>Play the music.</p>
     *
     * @version 1.0.0
     * @since 1.0.0
     */
    public void playMusic() {
        music.play();
    }
    
    /**
     * <p>Play the music then rewind.</p>
     *
     * @version 1.0.0
     * @since 1.0.0
     */
    public void autoPlayMusic() {
        music.play();
        music.rewind();
    }
    
    /**
     * <p>Play and loop the music.</p>
     *
     * @version 1.0.0
     * @since 1.0.0
     */
    public void loopMusic() {
        music.loop();
    }
    
    /**
     * <p>Rewind the music.</p>
     *
     * @version 1.0.0
     * @since 1.0.0
     */
    public void rewindMusic() {
        music.rewind();
    }
    
    /**
     * <p>Pause the music.</p>
     *
     * @version 1.0.0
     * @since 1.0.0
     */
    public void pauseMusic() {
        music.pause();
    }
    
    /**
     * <p>Reset the music.</p>
     *
     * @version 1.0.0
     * @since 1.0.0
     */
    public void resetMusic() {
        pauseMusic();
        rewindMusic();
    }
    
}
