/*
 * Coordinate X and Y axes
 * X : position on the axes X
 * Y : position on the axes Y
 *
 * @author Axel DUCUING
 * @version 1.0.0
 * @since 1.0.0
 */
public class Point {

    private float x;
    private float y;

    /***** CONSTRUCTOR *****/

    Point() {
        x = 0;
        y = 0;
    }

    Point(float x, float y) {
        this.x = x;
        this.y = y;
    }
    
    /*
     * Deep copy constructor
     */
    private Point(Point copy) {
        x = copy.x;
        y = copy.y;
    }
    
    /***** GETTER *****/
    
    public float getX () {
        return x;
    }
    
    public float getY () {
        return y;
    }
    
    /***** SETTER *****/
    
    public void setX(float x) {
        this.x = x;
    }

    public void setY(float y) {
        this.y = y;
    }
    
    /***** METHOD *****/

    /**
     * <p>Set new coordonate position.</p>
     *
     * @param x : value on x
     * @param y : value on y
     *
     * @version 1.0.0
     * @since 1.0.0
     */
    public void setCoordinates(float x, float y) {
        this.x = x;
        this.y = y;
    }

}
