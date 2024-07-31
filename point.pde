/*
 * Coordinate X and Y axes
 * X : position on the axes X
 * Y : position on the axes Y
 */
public class Point {

    private float x;
    private float y;

    Point() {
        x = 0;
        y = 0;
    }

    Point(float x, float y) {
        this.x = x;
        this.y = y;
    }

    public float getX () {
        return x;
    }

    public void setX(float x) {
        this.x = x;
    }

    public float getY () {
        return y;
    }

    public void setY(float y) {
        this.y = y;
    }

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
