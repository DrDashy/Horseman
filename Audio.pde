// Musics and sounds library
import ddf.minim.*;


/**
 * <b>Audio represent a class for the configuration and use of the minim library.<b>
 * <p>
 * <ul>
 * <li>_instance : represent the minim library object.</li>
 * </ul>
 * </p>
 *
 * @author Axel DUCUING
 * @version 1.0.0
 * @since 1.0.0
 */
public class Audio {
    
    private Minim _instance = null;
    
    private Audio () {}
    
    public Minim getInstance() {
        if (null == _instance) {
            _instance = new Minim(SKETCH_PAPPLET);
        }
        return _instance;
    }
    
}


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
    private int _id;
    private String _name;
    private String _source;
    
    // Other
    private AudioPlayer music;
    
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
