enum nameDecors { 
    BACKGROUND,
    MOUNTAIN,
    CLOUD,
    ISLE,
    PLATEFORM
}

BDD[] datas_background = {
    new BDD(nameDecors.BACKGROUND, "background/morning", new Color()),
    new BDD(nameDecors.BACKGROUND, "background/sunny", new Color()),
    new BDD(nameDecors.BACKGROUND, "background/sunset", new Color()),
    new BDD(nameDecors.BACKGROUND, "background/night", new Color()),
    new BDD(nameDecors.BACKGROUND, "background/bloodMoon", new Color())
};

BDD[] datas_mountain = {
    new BDD(nameDecors.MOUNTAIN, "mountain/montagne1", new Color(255, 200, 200, 255)),
    new BDD(nameDecors.MOUNTAIN, "mountain/montagne1", new Color(150, 255)),
    new BDD(nameDecors.MOUNTAIN, "mountain/montagne1", new Color()),
    new BDD(nameDecors.MOUNTAIN, "mountain/montagne1", new Color(253, 108, 158, 255)),
    new BDD(nameDecors.MOUNTAIN, "mountain/montagne2", new Color())
};

BDD[] datas_cloud = {
    new BDD(nameDecors.CLOUD, "cloud/cloud", new Color(255, 200, 200, 126)),
    new BDD(nameDecors.CLOUD, "cloud/cloud", new Color(170, 126)),
    new BDD(nameDecors.CLOUD, "cloud/cloud", new Color(255, 126)),
    new BDD(nameDecors.CLOUD, "cloud/cloud", new Color(254, 191, 210, 126)),
    new BDD(nameDecors.CLOUD, "cloud/cloud", new Color(133, 6, 6, 126))
};

BDD[] datas_isle = {
    new BDD(nameDecors.ISLE, "isle/ile1", new Color()),
    new BDD(nameDecors.ISLE, "isle/ile2", new Color()),
    new BDD(nameDecors.ISLE, "isle/ile3", new Color()),
    new BDD(nameDecors.ISLE, "isle/ile4", new Color()),
    new BDD(nameDecors.ISLE, "isle/ile1boss", new Color()),
    new BDD(nameDecors.ISLE, "isle/ile2boss", new Color()),
    new BDD(nameDecors.ISLE, "isle/ile3boss", new Color()),
    new BDD(nameDecors.ISLE, "isle/ile4boss", new Color()),
};

BDD[] datas_plateform = {
    new BDD(nameDecors.PLATEFORM, "plateform/large_plateform", new Color()),
    new BDD(nameDecors.PLATEFORM, "plateform/little_plateform1", new Color()),
    new BDD(nameDecors.PLATEFORM, "plateform/little_plateform2", new Color())
};

/**
 * <b>Class of all datas for every decor.<b>
 * <p>
 * The data is characterised by :
 * <ul>
 * <li>Decor name.</li>
 * <li>Url of the pic.</li>
 * <li>Color for tint the picture.</li>
 * <li>Moving speed.</li>
 * <li>X position.</li>
 * <li>Y position.</li>
 * <li>Width of the pic.</li>
 * <li>Heigth of the pic.</li>
 * </ul>
 * </p>
 *
 * @author Axel DUCUING
 * @version 1.0.0
 * @since 1.0.0
 */
public class BDD {
    
    /** Decor name */
    private nameDecors ND;
    /** Url of the pic */
    public String URL;
    /** Color for tint the picture */
    public Color COLOR;
    /** Moving speed */
    public float SPEED;
    /** X position */
    public float X;
    /** Y position */
    public float Y;
    /** Width of the pic */
    public float WIDTH;
    /** Heigth of the pic */
    public float HEIGHT;
    
    /** 
     * Constructor Bdd
     *
     * <p>
     * When the bdd is created, we initialize the basic settings :
     * <ul>
     * <li>Name of the decor</li>
     * <li>Url of the pic</li>
     * <li>Color for the tint</li>
     * </ul>
     * </p>
     *
     * @param nD : Name of the decor
     * @param namePic : Url of the pic
     * @param C : Color for the tint
     *
     * @see nameDecors
     * @see datas_background
     * @see datas_mountain
     * @see datas_cloud
     * @see datas_isle
     * @see datas_plateform
     */
    BDD(nameDecors nD, String namePic, Color C) {
        ND = nD;
        URL = "./data/decors/" + namePic + ".png";
        COLOR = C;   //<>//
    }
    
    /**
     * Update settings
     *
     * <p>
     * For witch decor is choosen, we initialize the decor settings :
     * <ul>
     * <li>Moving speed.</li>
     * <li>X position.</li>
     * <li>Y position.</li>
     * <li>Width of the pic.</li>
     * <li>Heigth of the pic.</li>
     * </ul>
     * </p>
     */
    public void SetInformations() {
        if (ND == nameDecors.BACKGROUND) {
            SPEED = 0;
            X = 0;
            Y = 0;
            WIDTH = width;
            HEIGHT = height;
        } else if (ND == nameDecors.MOUNTAIN) {
            SPEED = 2;
            X = 0;
            Y = 0;
            WIDTH = 0;
            HEIGHT = 0;
        } else if (ND == nameDecors.CLOUD) {  
            SPEED = 5;
            X = random(0, width*2);
            Y = random(0, height/2);  
            WIDTH = 0;
            HEIGHT = 0;
        } else if (ND == nameDecors.ISLE) {  
            SPEED = 8;
            X = random(0, width/6);
            Y = random(height/10*2, height/10*5); 
            WIDTH = 0;
            HEIGHT = 0;
        } else if (ND == nameDecors.PLATEFORM) {  
            SPEED = 5;
            X = 50;
            Y = random( (height - height/4), (height - height/10) );  
            WIDTH = 0;
            HEIGHT = 0;
        }   
    }
    
}
