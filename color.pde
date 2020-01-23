/*
 * Red, Green and Blue value
 * cR : decimal for color Red
 * cG : decimal for color Green
 * cB : decimal for color Blue
 * cA : decimal for alpha
 */
public class Color { 
    
    private int cR, cG, cB, cA;
    
    Color() {
        cR = 255;
        cG = 255;
        cB = 255; 
        cA = 255;
    }
    
    Color(int cRGB, int A) {
        this.cR = cRGB;
        this.cG = cRGB;
        this.cB = cRGB; 
        this.cA = A;
    }
    
    Color(Color C) {
        this.cR = C.getRed();
        this.cG = C.getGreen();
        this.cB = C.getBlue(); 
        this.cA = C.getAlpha();
    }
    
    Color(int R, int G, int B, int A) {
        this.cR = R;
        this.cG = G;
        this.cB = B; 
        this.cA = A;
    }
    
    /* GETTER */
    public int getRed() {
        return cR;
    }
    
    public int getGreen() {
        return cG;
    }
    
    public int getBlue() {
        return cB;
    }
    
    public int getAlpha() {
        return cA;
    }
    
    /* Return the color in RGB format (alpha include) (Red,Green,Blue,Alpha) */
    public color getColor() {
        return color(cR, cG, cB, cA);
    }
    
    /* Set a new color */
    public void changeColor(int R, int G, int B) {
        cR = R;
        cG = G;
        cB = B;
    }
    
    public void changeColor(Color C) {
        cR = C.getRed();
        cG = C.getGreen();
        cB = C.getBlue();
    }
    
    public void changeAlpha(int A) {
        cA = A;
    }
    
    /* Set a new random color */
    public void changeColorRandomly() {
        // Range : [0;256[
        cR = (int) random(0, 256);
        cG = (int) random(0, 256);
        cB = (int) random(0, 256);
    }
    
}
