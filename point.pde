/*
 * Coordinate X and Y axes
 * X : position on the axes X
 * Y : position on the axes Y
 */
public class Point {

    private float X;
    private float Y;

    Point() {
        X = 0;
        Y = 0;
    }

    Point(float X, float Y) {
        this.X = X;
        this.Y = Y;
    }

    public float getX () {
        return X;
    }

    public void setX(float X) {
        this.X = X;
    }

    public float getY () {
        return Y;
    }

    public void setY(float Y) {
        this.Y = Y;
    }

    /* Set new coordinate */
    public void setCoordinates(float X, float Y) {
        this.X = X;
        this.Y = Y;
    }

}
