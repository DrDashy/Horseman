enum direction {
    RIGHT,
    LEFT,
    UP,
    DOWN
}


/**
 *
 */
public class MiseEnScene {

    private Background m_background;
    
    private int m_nbMountain;
    private ArrayList<Mountain> m_tabMountain;

    private int m_nbCloud;
    private ArrayList<Cloud> m_tabCloud;

    private int m_nbIsle;
    private ArrayList<Isle> m_tabIsle;
    
    private int m_nbPlateform;
    private ArrayList<Plateform> m_tabPlateform;
    
    MiseEnScene () {
        // Mountain settings
        m_nbMountain = 3;
        m_tabMountain = new ArrayList<Mountain>();
        
        // Could settings
        m_nbCloud = 5;
        m_tabCloud = new ArrayList<Cloud>();
         
        // Isle Settings
        m_nbIsle = 15;
        m_tabIsle = new ArrayList<Isle>();
        
        // Palteform Settings
        m_nbPlateform = 15;
        m_tabPlateform = new ArrayList<Plateform>();
    }
    
    // Initialize background
    private void setBackground(int Type) {
        m_background = new Background(datas_background[Type]);
    }
    
    // Initialize all mountains
    private void setMountain(int Type) {
        int tempPos = 0;
        for (int i = 0; i < m_nbMountain; i++) {
            m_tabMountain.add(new Mountain(datas_mountain[Type]));
            // Initialize position
            m_tabMountain.get(i).m_move.m_coord.setX(tempPos);
            // Reset next position
            tempPos += m_tabMountain.get(i).m_pic.width;
        }
    }
    
    // Initialize all clouds
    private void setClouds(int Type) {
        for (int i = 0; i < m_nbCloud; i++) {
            m_tabCloud.add(new Cloud(datas_cloud[Type]));
        }
    }
   
    // Initialize all isles
    private void setIsle(int Type) {
        float tempPosX = random(0-width, 0);
        float tempPosY = random(height/10*2, height/10*5);
        for (int i = 0; i < m_nbIsle; i++) {
            int type = (int) random(1, 11);
            if (type < 3) {
                type = 0;    
            } else if (type < 6) {
                type = 1;    
            } else if (type < 9) {
                type = 2;    
            } else {
                type = 3;    
            }
            if (Type != 4) {
                m_tabIsle.add(new Isle(datas_isle[type]));
            } else {
                m_tabIsle.add(new Isle(datas_isle[type*2]));   
            }
            // Initialize position
            m_tabIsle.get(i).m_move.m_coord.setX(tempPosX);
            m_tabIsle.get(i).m_move.m_coord.setY(tempPosY);
            // Reset next position
            tempPosX = tempPosX + random(width/2, width);
            tempPosY = random(height/10*2, height/10*5);
        }
    }
    
    // Initialize all plateform
    private void setPlateform() {
        float tempPosX = 50;
        float tempPosY = random( (height - height/4), (height - height/10) );
        for (int i = 0; i < m_nbPlateform; i++) {
            int typePlateform = (int) random(0, 3);
            m_tabPlateform.add(new Plateform(datas_plateform[typePlateform]));
            // Initialize position
            m_tabPlateform.get(i).m_move.m_coord.setX(tempPosX);
            m_tabPlateform.get(i).m_move.m_coord.setY(tempPosY);
            // Reset next position
            // We count the width of the picture too
            tempPosX = tempPosX + m_tabPlateform.get(i).m_pic.width + (width / 3);
            tempPosY = random( (height - height/4), (height - height/10) );
        }
    }
    
    public void resetDecorsMenu(int Type) {
        // Clear all ArrayList
        m_tabMountain.clear();
        m_tabCloud.clear();
        // Initialize Decors
        setBackground(Type);
        setMountain(Type);
        setClouds(Type);
    }

    public void resetDecorsGame(int Type) {
        // Clear all ArrayList
        m_tabMountain.clear();
        m_tabCloud.clear();
        m_tabIsle.clear();
        m_tabPlateform.clear();
        // Initialize Decors
        setBackground(Type);
        setMountain(Type);
        setClouds(Type);
        setIsle(Type);
        setPlateform();
    }
    
    public void moveMountain(direction D) {
        for (Mountain montain : m_tabMountain) {    
            switch(D) {
                case LEFT :
                    montain.parallaxLeft();
                    montain.m_move.MoveLeft();
                    break;
                
                case RIGHT :
                    montain.parallaxRight();
                    montain.m_move.MoveRight();
                    break;
                    
                case UP :
                    break;
                    
                case DOWN :
                    break;
            };
        }
    }
    
    public void moveCloud(direction D) {
        for (Cloud cloud : m_tabCloud) {    
            switch(D) {
                case LEFT :
                    cloud.m_move.MoveLeft();
                    break;
                
                case RIGHT :
                    cloud.m_move.MoveRight();
                    break;
                    
                case UP :
                    break;
                    
                case DOWN :
                    break;
            };
        }
    }
    
    public void moveIsle(direction D) {
        for (Isle isle : m_tabIsle) {    
            switch(D) {
                case LEFT :
                    isle.m_move.MoveLeft();
                    break;
                
                case RIGHT :
                    isle.m_move.MoveRight();
                    break;
                    
                case UP :
                    break;
                    
                case DOWN :
                    break;
            };
        }
    }
    
    public void movePlateform(direction D) {
        for (Plateform plateform : m_tabPlateform) {    
            switch(D) {
                case LEFT :
                    plateform.m_move.MoveLeft();
                    break;
                
                case RIGHT :
                    plateform.m_move.MoveRight();
                    break;
                    
                case UP :
                    break;
                    
                case DOWN :
                    break;
            };
        }
    }
    
    public void draw() {
        m_background.draw(); //<>//
        
        for (Mountain montain : m_tabMountain) {
            montain.draw();
        }
        
        for (Cloud cloud : m_tabCloud) {
            cloud.draw();
            // Clouds always move to the left even if the player is not moving
            cloud.m_move.MoveLeft();
            cloud.parallaxLeft();
        }
        
        for (Isle isle : m_tabIsle) {
            isle.draw();
        }
        
        for (Plateform plateform : m_tabPlateform) {
            plateform.draw();
        }
    }
       
}
