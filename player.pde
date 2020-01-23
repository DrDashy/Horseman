/*
 *
 */
class Player {

    private PImage m_picPlayer;
    private int[] m_anim;
    private int m_annimSpeed;
    private int m_spriteCounter;
    private int m_frameCounter;
    private Point m_coord;
    private float m_runSpeed;
    private boolean m_goingRight;
    private boolean m_goingLeft;
    private boolean m_isTurnRight;
    private boolean m_isJumping;
    private boolean m_goingUp;
    private float m_jumpSpeed;
    private AudioPlayer m_audioJump;
    

    //boolean ScrollRight, ScrollLeft;
    //int LongueurPlateForme;
    //boolean Canmove;

    Player () {
        m_coord = new Point(100, height/2);
        m_picPlayer = loadImage("data/personnage/playerannim.png");
        m_anim = new int [10];
        m_anim[0] = 0;
        m_anim[1] = 100;
        m_anim[2] = 200;
        m_anim[3] = 100;
        m_anim[4] = 300;
        m_annimSpeed = 5;
        m_spriteCounter = 0;
        m_frameCounter = 0;
        
        m_isJumping = false;
        m_goingUp = false;
        m_jumpSpeed = 25;
        m_audioJump = minim.loadFile("data/personnage/jump.mp3");
        
        m_goingRight = false;
        m_goingLeft = false;
        m_isTurnRight = true;
        m_runSpeed = 10;
    }
    
    private void MoveRight() {
        m_coord.setX(m_coord.getX() + m_runSpeed);
    }

    private void MoveLeft() {
        m_coord.setX(m_coord.getX() - m_runSpeed);
    }
    
    private void Sauter() {
        m_coord.setY(m_coord.getY() - m_jumpSpeed);
        m_jumpSpeed = m_jumpSpeed - 1.05;
        if ( m_jumpSpeed <= 0 ) {
            m_jumpSpeed = 0;
            m_goingUp = false;
        }
    }
    
    private void Descente() {
        m_coord.setY(m_coord.getY() + m_jumpSpeed);
        m_jumpSpeed = m_jumpSpeed + 1.1;
        if ( m_coord.getY() >= height/2 ){
            m_jumpSpeed = 35;
            m_isJumping = false;
        }
    }

    void draw() {
        PImage tempAnim = new PImage();
        // Check if the player is on a jump
        if (!m_isJumping) {
            tempAnim = m_picPlayer.get(m_anim[m_spriteCounter], 0, 100, 137 );
            // Check if the player is moving
            if (m_goingRight || m_goingLeft) {
                // Check witch way the player is looking 
                if (m_isTurnRight) {
                    tempAnim = m_picPlayer.get(m_anim[m_spriteCounter], 0, 100, 137 );
                } else {
                    tempAnim = m_picPlayer.get(m_anim[m_spriteCounter], 137, 100, 274 );
                }
            } else {
                // Check witch way the player is looking 
                if (m_isTurnRight) {
                    tempAnim = m_picPlayer.get(m_anim[0], 0, 100, 137 );
                } else if (!m_isTurnRight) {
                    tempAnim = m_picPlayer.get(m_anim[0], 137, 100, 274 );
                }    
            }
        } else if (m_isJumping) {
            // Check if the player ascent or descent
            if (m_goingUp) {
                Sauter();    
            } else if (!m_goingUp) {
                Descente();    
            }
            // Check witch way the player is looking
            if (m_isTurnRight) {
                tempAnim = m_picPlayer.get(m_anim[4], 0, 100, 137 );
            } else if (!m_isTurnRight) {
                tempAnim = m_picPlayer.get(m_anim[4], 137, 100, 274 );
            }
        }
        
        image(tempAnim, m_coord.getX(), m_coord.getY());
        
        // Player move to the right
        if (m_goingRight) {
            MoveRight();    
        }
        // Player move to the left
        if (m_goingLeft) {
            MoveLeft();    
        }
        
        // Update the animation
        m_frameCounter++;
        if (m_frameCounter == m_annimSpeed) {
            m_frameCounter = 0;
            m_spriteCounter++;
            if (m_spriteCounter == 4) {
                m_spriteCounter = 0;
            }
        }
    }
    
    void keyPressed() {
        // Run
        if (key == CODED) {
            if (keyCode == RIGHT) {
                m_goingRight = true;
                m_goingLeft = false;
                m_isTurnRight = true;
            } else if (keyCode == LEFT) {
                m_goingLeft = true;
                m_goingRight = false;
                m_isTurnRight = false;
            }    
        }
        
        // Jump
        if (key == ' ' && !m_isJumping) {
            m_isJumping = true;
            m_goingUp = true;
            m_audioJump.play();
            m_audioJump.rewind();
        }
    }

    void keyReleased() {
        if (key == CODED) {
            if (keyCode == RIGHT) {
                m_goingRight = false;
            } 
            if (keyCode == LEFT) {
                m_goingLeft = false;
            }    
        }
    }
    
}
    /*
    void update() {
        // Collider platteforme
        for (int i = 0; i < Plateforme.NombrePlateforme; i++) {
            if ( Plateforme.TableauPlateformeTypeDefinie[i] == 0 ) {
                LongueurPlateForme = 800;
            } else {
                LongueurPlateForme = 400;
            }
            if ( (Y < Plateforme.TableauPlateformeY[i]) && (Y > (Plateforme.TableauPlateformeY[i] - 137)) && (X+50 >= (Plateforme.TableauPlateformeX[i] - 20))  && (X+50 <= (Plateforme.TableauPlateformeX[i] + LongueurPlateForme + 20)) ) {
                JumpSpeed = 60;
                Y = Plateforme.TableauPlateformeY[i] - 137 + ( i * 1.4 ) - ( Plateforme.NombrePlateforme + ( 1.4 * 2 ) );
                descente = false;
            } else if ( (X+50 <= (Plateforme.TableauPlateformeX[i] - 20)) || (X+50 >= (Plateforme.TableauPlateformeX[i] + LongueurPlateForme + 20))) {
                Y = Y + 1.4;
            }
        }

        //-------------------------- Test du scroll -----------------------------------  
        if ( Menu.level == 10 ) {
            if ( X > width - (width/4*3) ) {
                ScrollRight = true;
                ScrollLeft = false;
            } else if ( X < (width/4*1) ) {
                ScrollRight = false;
                ScrollLeft = true;
            } else {
                ScrollRight = false;
                ScrollLeft = false;
            }
        } else {
            if ( X > width - (width/4*2) ) {
                ScrollRight = true;
                ScrollLeft = false;
            } else if ( X < (width/4*2) ) {
                ScrollRight = false;
                ScrollLeft = true;
            } else {
                ScrollRight = false;
                ScrollLeft = false;
            }
        }

    }*/
