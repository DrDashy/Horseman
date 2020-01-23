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


public class BDD {
    
    public String URL;
    public Color COLOR;
    public float SPEED;
    public float X;
    public float Y;
    public float WIDTH;
    public float HEIGHT;
    
    // Contructor Background - Mountain - Cloud
    BDD(nameDecors nD, String namePic, Color C) {
        URL = "./data/decors/" + namePic + ".png";
        COLOR = C;  
        if (nD == nameDecors.BACKGROUND) {
            SPEED = 0;
            X = 0;
            Y = 0;
            WIDTH = width;
            HEIGHT = height;
        } else if (nD == nameDecors.MOUNTAIN) {
            SPEED = 2;
            X = 0;
            Y = 0;
            WIDTH = 0;
            HEIGHT = 0;
        } else if (nD == nameDecors.CLOUD) {  
            SPEED = 5;
            X = random(0, width*2);
            Y = random(0, height/2);  
            WIDTH = 0;
            HEIGHT = 0;
        } else if (nD == nameDecors.ISLE) {  
            SPEED = 8;
            X = random(0, width/6);
            Y = random(height/10*2, height/10*5); 
            WIDTH = 0;
            HEIGHT = 0;
        } else if (nD == nameDecors.PLATEFORM) {  
            SPEED = 5;
            X = 50;
            Y = random( (height - height/4), (height - height/10) );  
            WIDTH = 0;
            HEIGHT = 0;
        }
    }
    
}
