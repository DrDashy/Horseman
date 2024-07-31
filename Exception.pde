/**
 * <p>Exception used when throwing error that makes the game unplayable.</p>
 *
 * @author Axel DUCUING
 * @version 1.0.0
 * @since 1.0.0
 */
public class GameException extends Exception {
    public GameException(String message) {
        super(message);
    }
}

/**
 * <p>Exception used when throwing error for the database.</p>
 *
 * @author Axel DUCUING
 * @version 1.0.0
 * @since 1.0.0
 */
public class DatabaseException extends Exception {
    public DatabaseException(String message) {
        super(message);
    }
}
