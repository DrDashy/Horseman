/**
 *
 */
private abstract class Decors {
    
    protected PImage m_pic;
    protected Color m_color;
    protected Moving m_move;
    protected float m_maxPosXLeft;
    protected float m_maxPosXRight;
    
    private Decors (BDD bdd) {
        m_pic = loadImage(bdd.URL);
        m_pic.resize(m_pic.width / RATION_WIDTH, m_pic.height / RATION_HEIGHT);
        m_color = bdd.COLOR;
        m_move = new Moving(bdd.SPEED, bdd.X, bdd.Y);
    }
    
    /**
     * Draw the decor
     */
    public void draw() {
        tint(m_color.getRed(), m_color.getGreen(), m_color.getBlue(), m_color.getAlpha());
        imageMode(CORNER);
        image(m_pic, m_move.m_coord.getX(), m_move.m_coord.getY());  
        // Reset tint for other elements to draw properly
        tint(255);
    }
    
    /**
     * Check if the decor's position should be reset for the Left parallax
     */
    public abstract void parallaxLeft();
    
    /**
     * Check if the decor's position should be reset for the Right parallax
     */
    public abstract void parallaxRight();
    
}  


  /*
  PImage aile;
  int LongueurPlateForme, AileY;
  boolean monteaile, fait;
  
  PImage[] TableauSign = new PImage[10];
  int SignNumero;
  
  PImage arbre;
  int distance1, distance2, distance3;
  int plateforme1, plateforme2, plateforme3;
  
  PImage herbe;
  int distanceHerbe1, distanceHerbe2, distanceHerbe3, distanceHerbe4, distanceHerbe5, distanceHerbe6, distanceHerbe7;
  int plateformeHerbe1, plateformeHerbe2, plateformeHerbe3, plateformeHerbe4, plateformeHerbe5, plateformeHerbe6, plateformeHerbe7;
  
  PImage barriere;
  int distanceBarriere1, distanceBarriere2, distanceBarriere3, distanceBarriere4;
  int plateformeBarriere1, plateformeBarriere2, plateformeBarriere3, plateformeBarriere4;
  
  PImage deadsign;
  
  PImage texte1, texte2;


///////////////////////////////////// Fonction constructeur /////////////////////////////////////////////////////

  void DecorsG () {
    
    aile = loadImage("Data/aile.png");
    arbre = loadImage("Data/arbre.png");
    herbe = loadImage("Data/herbe.png");
    barriere = loadImage("Data/barriere.png");
    deadsign = loadImage("Data/deadsign.png");
    texte1 = loadImage("Data/texte1.png");
    texte2 = loadImage("Data/texte2.png");
    
    TableauSign[0] = loadImage("Data/sign1.png");
    TableauSign[1] = loadImage("Data/sign2.png");
    TableauSign[2] = loadImage("Data/sign3.png"); 
    TableauSign[3] = loadImage("Data/sign4.png");
    TableauSign[4] = loadImage("Data/sign5.png");
    TableauSign[5] = loadImage("Data/sign6.png");
    TableauSign[6] = loadImage("Data/sign7.png"); 
    TableauSign[7] = loadImage("Data/sign8.png");
    TableauSign[8] = loadImage("Data/sign9.png");
    TableauSign[9] = loadImage("Data/deadsign.png");
    
    //------------------- Génération des ailes --------------
    monteaile = true;
    fait = false;
    
  }
  
  void assignation() {
     
    ileRainbow = false;
    if ( Menu.level == 10 ) {
      choixfond =  5;
    } else {
      choixfond = (int)random(5);
    }
     
    LongueurPlateForme = 0;
    AileY = 0;
       
    if ( Plateforme.TableauPlateformeTypeDefinie[Plateforme.NombrePlateforme-1] == 0 ) {
        LongueurPlateForme = 800;
    } else {
        LongueurPlateForme = 400;
    }
    
    if ( fait == false ) {
      AileY = Plateforme.TableauPlateformeY[Plateforme.NombrePlateforme-1]-100;
      fait = true;
    }
    
    plateforme1 = (int)random(1,5);
    if ( Plateforme.TableauPlateformeTypeDefinie[plateforme1] == 0 ){
      distance1 = (int)random(0,600);
    } else {
      distance1 = (int)random(0,200);
    }
    
    plateforme2 = (int)random(6,10);
    if ( Plateforme.TableauPlateformeTypeDefinie[plateforme2] == 0 ){
      distance2 = (int)random(0,600);
    } else {
      distance2 = (int)random(0,200);
    }
    
    plateforme3 = (int)random(11,13);
    if ( Plateforme.TableauPlateformeTypeDefinie[plateforme3] == 0 ){
      distance3 = (int)random(0,600);
    } else {
      distance3 = (int)random(0,200);
    }
    
    plateformeHerbe1 = (int)random(0,1);
    plateformeHerbe2 = (int)random(2,3);
    plateformeHerbe3 = (int)random(4,5);
    if ( Plateforme.TableauPlateformeTypeDefinie[plateformeHerbe1] == 0 ){
      distanceHerbe1 = (int)random(0,600);
    } else {
      distanceHerbe1 = (int)random(0,200);
    }
    if ( Plateforme.TableauPlateformeTypeDefinie[plateformeHerbe2] == 0 ){
      distanceHerbe2 = (int)random(0,600);
    } else {
      distanceHerbe2 = (int)random(0,200);
    }
    if ( Plateforme.TableauPlateformeTypeDefinie[plateformeHerbe3] == 0 ){
      distanceHerbe3 = (int)random(0,600);
    } else {
      distanceHerbe3 = (int)random(0,200);
    }
    
    plateformeHerbe4 = (int)random(6,7);
    plateformeHerbe5 = (int)random(8,9);
    plateformeHerbe6 = (int)random(10,11);
    if ( Plateforme.TableauPlateformeTypeDefinie[plateformeHerbe4] == 0 ){
      distanceHerbe4 = (int)random(0,600);
    } else {
      distanceHerbe4 = (int)random(0,200);
    }
    if ( Plateforme.TableauPlateformeTypeDefinie[plateformeHerbe5] == 0 ){
      distanceHerbe5 = (int)random(0,600);
    } else {
      distanceHerbe5 = (int)random(0,200);
    }
    if ( Plateforme.TableauPlateformeTypeDefinie[plateformeHerbe6] == 0 ){
      distanceHerbe6 = (int)random(0,600);
    } else {
      distanceHerbe6 = (int)random(0,200);
    }
    
    plateformeHerbe7 = (int)random(12,13);
    if ( Plateforme.TableauPlateformeTypeDefinie[plateformeHerbe7] == 0 ){
      distanceHerbe7 = (int)random(0,600);
    } else {
      distanceHerbe7 = (int)random(0,200);
    }
    
    
    plateformeBarriere1 = (int)random(1,3);
    if ( Plateforme.TableauPlateformeTypeDefinie[plateformeBarriere1] == 0 ){
      distanceBarriere1 = (int)random(0,600);
    } else {
      distanceBarriere1 = (int)random(0,200);
    }
    
    plateformeBarriere2 = (int)random(4,6);
    if ( Plateforme.TableauPlateformeTypeDefinie[plateformeBarriere2] == 0 ){
      distanceBarriere2 = (int)random(0,600);
    } else {
      distanceBarriere2 = (int)random(0,200);
    }
    
    plateformeBarriere3 = (int)random(7,10);
    if ( Plateforme.TableauPlateformeTypeDefinie[plateformeBarriere3] == 0 ){
      distanceBarriere3 = (int)random(0,600);
    } else {
      distanceBarriere3 = (int)random(0,200);
    }
    
    plateformeBarriere4 = (int)random(11,13);
    if ( Plateforme.TableauPlateformeTypeDefinie[plateformeBarriere4] == 0 ){
      distanceBarriere4 = (int)random(0,600);
    } else {
      distanceBarriere4 = (int)random(0,200);
    }
      
   }
    
///////////////////////////////////// Actualisation  /////////////////////////////////////////////////////  
  
  void update() {
    
    //---------------------- Déplacement des Montagnes, des Iles et des Nuages par rapport au Scroll du Joueur --------------
    if ( Perso.BougeDroite == true && Perso.BougeGauche == false && Perso.ScrollRight == true ){
      MontagneBougeD();
      IleBougeD();
      CloudBougeD();
    } else if ( Perso.BougeDroite == false && Perso.BougeGauche == true && Perso.ScrollLeft == true ){
      MontagneBougeG();
      IleBougeG();
      CloudBougeG();
    }
    
  }
  
///////////////////////////////////////// DRAW /////////////////////////////////////////////////////

  void draw() {
    
    update();
   
    //---------------------- On vérifie si toutes les caractéristique de positionnement du décorts a été fait --------------
    if ( Plateforme.AssignationOn == true ) {
      
       //------------------- On vérifie si le Joueur est en Jeu ------------------
       if ( Menu.Start == true && Menu.Restart == false && Menu.Victoire == false && Menu.Credit == false ) {
         
         Ile();
         Aile();
         Sign();
         
         //------------------- On vérifie le level du Joueur ------------------
         if ( Menu.level == 9 ){
           Deadsign();
         }
         
         Arbre();
         Barriere();
         Herbe();
         
       }
       
    }
    
  }
  
///////////////////////////////////////// Dessin des Ailes ///////////////////////////////////////////////////// 
  
  void Aile() { 
    image(aile, Plateforme.TableauPlateformeX[Plateforme.NombrePlateforme-1]+(LongueurPlateForme/2)-(140/2), AileY, 140, 100);  
    
    if ( AileY == Plateforme.TableauPlateformeY[Plateforme.NombrePlateforme-1]-125 ) {
      monteaile = false;
    } else if ( AileY == Plateforme.TableauPlateformeY[Plateforme.NombrePlateforme-1]-75 ) {
      monteaile = true;
    }
    
    if ( monteaile == true ) {
      AileY = AileY - 1;
    } else if ( monteaile == false ) {
      AileY = AileY + 1;
    } 
  }
  
///////////////////////////////////////// Dessin des Arbres ///////////////////////////////////////////////////// 
  
  void Arbre(){
    image(arbre, Plateforme.TableauPlateformeX[plateforme1]+distance1, Plateforme.TableauPlateformeY[plateforme1]-428);
    image(arbre, Plateforme.TableauPlateformeX[plateforme2]+distance2, Plateforme.TableauPlateformeY[plateforme2]-428);
    image(arbre, Plateforme.TableauPlateformeX[plateforme3]+distance3, Plateforme.TableauPlateformeY[plateforme3]-428);
  }
  
///////////////////////////////////////// Dessin des herbes /////////////////////////////////////////////////////  

  void Herbe(){
    image(herbe, Plateforme.TableauPlateformeX[plateformeHerbe1]+distanceHerbe1, Plateforme.TableauPlateformeY[plateformeHerbe1]-42);
    image(herbe, Plateforme.TableauPlateformeX[plateformeHerbe2]+distanceHerbe2, Plateforme.TableauPlateformeY[plateformeHerbe2]-42);
    image(herbe, Plateforme.TableauPlateformeX[plateformeHerbe3]+distanceHerbe3, Plateforme.TableauPlateformeY[plateformeHerbe3]-42);
    image(herbe, Plateforme.TableauPlateformeX[plateformeHerbe4]+distanceHerbe4, Plateforme.TableauPlateformeY[plateformeHerbe4]-42);
    image(herbe, Plateforme.TableauPlateformeX[plateformeHerbe5]+distanceHerbe5, Plateforme.TableauPlateformeY[plateformeHerbe5]-42);
    image(herbe, Plateforme.TableauPlateformeX[plateformeHerbe6]+distanceHerbe6, Plateforme.TableauPlateformeY[plateformeHerbe6]-42);
    image(herbe, Plateforme.TableauPlateformeX[plateformeHerbe7]+distanceHerbe7, Plateforme.TableauPlateformeY[plateformeHerbe7]-42);
  }
 
///////////////////////////////////////// Dessin des Barrières /////////////////////////////////////////////////////   
  
  void Barriere(){
    image(barriere, Plateforme.TableauPlateformeX[plateformeBarriere1]+distanceBarriere1, Plateforme.TableauPlateformeY[plateformeBarriere1]-102);
    image(barriere, Plateforme.TableauPlateformeX[plateformeBarriere2]+distanceBarriere2, Plateforme.TableauPlateformeY[plateformeBarriere2]-102);
    image(barriere, Plateforme.TableauPlateformeX[plateformeBarriere3]+distanceBarriere3, Plateforme.TableauPlateformeY[plateformeBarriere3]-102);
    image(barriere, Plateforme.TableauPlateformeX[plateformeBarriere4]+distanceBarriere4, Plateforme.TableauPlateformeY[plateformeBarriere4]-102);
  }
  
///////////////////////////////////////// Dessin des Panneaux ///////////////////////////////////////////////////// 

  void Sign() {
    if ( Menu.level == 1 ){
      SignNumero = 0;
    } else if ( Menu.level == 2 ){
      SignNumero = 1;
    } else if ( Menu.level == 3 ){
      SignNumero = 2;
    } else if ( Menu.level == 4 ){
      SignNumero = 3;
    } else if ( Menu.level == 5 ){
      SignNumero = 4;
    } else if ( Menu.level == 6 ){
      SignNumero = 5;
    } else if ( Menu.level == 7 ){
      SignNumero = 6;
    } else if ( Menu.level == 8 ){
      SignNumero = 7;
    } else if ( Menu.level == 9 ){
      SignNumero = 8;
    } else if ( Menu.level == 10 ){
      SignNumero = 9;
    }
    image(TableauSign[SignNumero], Plateforme.TableauPlateformeX[0]+50, Plateforme.TableauPlateformeY[0]-180);
  }
  
  void Deadsign(){
    image(deadsign, Plateforme.TableauPlateformeX[14]+25, Plateforme.TableauPlateformeY[14]-194);
  }

///////////////////////////////////////// Mouvement des Iles /////////////////////////////////////////////////////   

  void IleBougeD() {
    for (int j = 0; j < NombreIle; j++){
      TableauIleX[j] = TableauIleX[j] - SpeedIle;
    }
  }
  
  void IleBougeG() {
    for (int j = 0; j < NombreIle; j++){
      TableauIleX[j] = TableauIleX[j] + SpeedIle;
    }
  }

///////////////////////////////////////// Dessins des Textes ( Seulement au boss dans la mini-cinématique /////////////////////////////////////////////////////   
  
  void Texte1() {
    image(texte1, width/2-375, height-300);
  }
  
  void Texte2() {
    image(texte2, width/2-375, height-300);
  }
  
  
}
