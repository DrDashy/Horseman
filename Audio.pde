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
