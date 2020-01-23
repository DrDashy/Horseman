/*
class Ennemis {
  
//////////////////////////////////// Declaration des variables //////////////////////////////////////////////////
  
  //------------------- Ennemis Pics ------------------
  PImage pic;
  int NombrePic, SpeedPic, picX, picY;
  int[] TableauPicX;
  int[] TableauPicY;
  
  //------------------- Récupération de donnée des Plateforme ------------------
  int NombrePetitePlateforme, NombreGrandePlateforme, compteur;
  boolean compteurGrandePlateforme, compteurPetitePlateforme;
  
  //------------------- Ennemis Cuistots ------------------
  PImage cuistot;
  int[] TableauCuistotX;
  int[] TableauCuistotY;
  int[] TableauPlateformeCuistot;
  int compteurcuistot,SpeedCuistot;
  boolean CuistotDroit, CuistotGauche;
  int cuistotSpeed, NombreCuistot;
  int[] anim = new int [4];
  int annimSpeed, spriteCounter ,frameCounter;

  //------------------- Boss ------------------
  PImage boss;
  float BossX, BossY;
  boolean bossMonte, bossDescent;
  int[] anim2 = new int [4];
  
  //------------------- Ennemis Battonets ------------------
  PImage battonet;
  float XBattonet, YBattonet;
  int NombreBattonet, SpeedBattonet;
  boolean Batonnetfait;
  
  
///////////////////////////////////// Fonction constructeur /////////////////////////////////////////////////////
  
  Ennemis() {
    
    //------------------- Importation des sprites ------------------
    pic = loadImage("Data/pic.png");
    cuistot = loadImage("Data/cuistoannim.png");
    boss = loadImage("Data/bossannim.png");
    battonet = loadImage("Data/battonet.png");
    
    //------------------- Vitesse des Ennemis ------------------
    SpeedBattonet = 10;
    SpeedPic = 14;
    SpeedCuistot = 5;
    
    //------------------- Déplacement des Ennemis ------------------
    CuistotDroit = true;
    CuistotGauche = false;
    
    bossMonte = false;
    bossDescent = false;
    BossX = width-400;
    BossY = height+20;
    
    //---------------------- Selection sur le spritesheet --------------
    anim[0]=0;
    anim[1]=200;
    anim[2]=400;
    anim[3]=200;
    
    anim2[0]=0;
    anim2[1]=524;
    anim2[2]=1048;
    anim2[3]=524;

    annimSpeed = 5;
    
  }
  
  
  // Cette fonction permet de créer aléatoirement tous les Ennemis suivant le niveau
  // Quand cette fonction est appellé, elle remet à zéro toutes les caractéristiques et compteur pour permettre de recréer une map aléatoire.
  void assignation () {
    
    //---------------------- Réinitialisation des variables et compteurs --------------
    NombrePic = 0;
    NombreCuistot = 0;
    compteur = 0;
    compteurcuistot = 0;
    compteurGrandePlateforme = true;
    compteurPetitePlateforme = true;
    NombrePetitePlateforme = 0;
    NombreGrandePlateforme = 0;
    
    //---------------------- On compte le nombre de Plateforme par type ( Grande, Petite ) --------------
    for(int i = 1; i < Plateforme.NombrePlateforme-1; i++){
      if ( Plateforme.TableauPlateformeTypeDefinie[i] == 0 ){
        NombreGrandePlateforme = NombreGrandePlateforme + 1;
      } else if ( Plateforme.TableauPlateformeTypeDefinie[i] == 1 || Plateforme.TableauPlateformeTypeDefinie[i] == 2  ){
        NombrePetitePlateforme = NombrePetitePlateforme + 1;
      }
    }
    
    //---------------------- Création des Ennemis suivant le level --------------
    // Les nivaux sont de plus en plus dificile tel que le niveau 1 a 1Pic toute les deux grandes plateformes, alors que le niveau 9 a 2 Pic par grande plateformes et 1 Pic par pettite plateforme et 1 Cuistot par grande platteforme
    if ( Menu.level == 1 ){
      if ( NombreGrandePlateforme%2 != 0 ){
        NombreGrandePlateforme = NombreGrandePlateforme + 1;
      }
      NombrePic = NombreGrandePlateforme/2;
      TableauPicX = new int[NombrePic];
      TableauPicY = new int[NombrePic];
      for(int i = 1; i < Plateforme.NombrePlateforme-1; i++){
        if ( Plateforme.TableauPlateformeTypeDefinie[i] == 0 ){
          if ( compteurGrandePlateforme == true ) {
            TableauPicX[compteur] = Plateforme.TableauPlateformeX[i] + (int)random(25,575);
            TableauPicY[compteur] = Plateforme.TableauPlateformeY[i] - 54;
            compteur = compteur + 1;
            compteurGrandePlateforme = false;
          } else if ( compteurGrandePlateforme == false ){
            compteurGrandePlateforme = true;
          }
        }
      }
    } else if ( Menu.level == 2 ){
      NombrePic = NombreGrandePlateforme;
      TableauPicX = new int[NombrePic];
      TableauPicY = new int[NombrePic];
      for(int i = 1; i < Plateforme.NombrePlateforme-1; i++){
        if ( Plateforme.TableauPlateformeTypeDefinie[i] == 0 ){
          TableauPicX[compteur] = Plateforme.TableauPlateformeX[i] + (int)random(25,575);
          TableauPicY[compteur] = Plateforme.TableauPlateformeY[i] - 54;
          compteur = compteur + 1;
        }
      }
    } else if ( Menu.level == 3 ){
      if ( NombreGrandePlateforme%2 != 0 ){
        NombreGrandePlateforme = NombreGrandePlateforme + 1;
      }
      if ( NombrePetitePlateforme%2 != 0 ){
        NombrePetitePlateforme = NombrePetitePlateforme + 1;
      }
      NombrePic = NombreGrandePlateforme/2 + NombrePetitePlateforme/2;
      TableauPicX = new int[NombrePic];
      TableauPicY = new int[NombrePic];
      for(int i = 1; i < Plateforme.NombrePlateforme-1; i++){
        if ( Plateforme.TableauPlateformeTypeDefinie[i] == 0 ){
          if ( compteurGrandePlateforme == true ) {
            TableauPicX[compteur] = Plateforme.TableauPlateformeX[i] + (int)random(25,575);
            TableauPicY[compteur] = Plateforme.TableauPlateformeY[i] - 54;
            compteur = compteur + 1;
            compteurGrandePlateforme = false;
          } else if ( compteurGrandePlateforme == false ){
            compteurGrandePlateforme = true;
          }
        }  else if ( Plateforme.TableauPlateformeTypeDefinie[i] == 1 || Plateforme.TableauPlateformeTypeDefinie[i] == 2  ){
          if ( compteurPetitePlateforme == true ) {
            TableauPicX[compteur] = Plateforme.TableauPlateformeX[i] + (int)random(25,175);
            TableauPicY[compteur] = Plateforme.TableauPlateformeY[i] - 54;
            compteur = compteur + 1;
            compteurPetitePlateforme = false;
          } else if ( compteurPetitePlateforme == false ) {
            compteurPetitePlateforme = true;
          }
        }
      }
    } else if ( Menu.level == 4 ){
      if ( NombreGrandePlateforme%2 != 0 ){
        NombreGrandePlateforme = NombreGrandePlateforme + 1;
      }
      if ( NombrePetitePlateforme%2 != 0 ){
        NombrePetitePlateforme = NombrePetitePlateforme + 1;
      }
      NombrePic = NombreGrandePlateforme/2 + NombrePetitePlateforme/2;
      TableauPicX = new int[NombrePic];
      TableauPicY = new int[NombrePic];
      NombreCuistot = NombreGrandePlateforme/2;
      TableauCuistotX = new int[NombreCuistot];
      TableauCuistotY = new int[NombreCuistot];
      TableauPlateformeCuistot = new int[NombreCuistot];
      for(int i = 1; i < Plateforme.NombrePlateforme-1; i++){
        if ( Plateforme.TableauPlateformeTypeDefinie[i] == 0 ){
          if ( compteurGrandePlateforme == true ) {
            TableauPicX[compteur] = Plateforme.TableauPlateformeX[i] + (int)random(25,575);
            TableauPicY[compteur] = Plateforme.TableauPlateformeY[i] - 54;
            compteur = compteur + 1;
            TableauCuistotX[compteurcuistot] = Plateforme.TableauPlateformeX[i];
            TableauCuistotY[compteurcuistot] = Plateforme.TableauPlateformeY[i] - 206;
            TableauPlateformeCuistot[compteurcuistot] = i;
            compteurcuistot = compteurcuistot + 1;
            compteurGrandePlateforme = false;
          } else if ( compteurGrandePlateforme == false ){
            compteurGrandePlateforme = true;
          }
        }  else if ( Plateforme.TableauPlateformeTypeDefinie[i] == 1 || Plateforme.TableauPlateformeTypeDefinie[i] == 2  ){
          if ( compteurPetitePlateforme == true ) {
            TableauPicX[compteur] = Plateforme.TableauPlateformeX[i] + (int)random(25,175);
            TableauPicY[compteur] = Plateforme.TableauPlateformeY[i] - 54;
            compteur = compteur + 1;
            compteurPetitePlateforme = false;
          } else if ( compteurPetitePlateforme == false ) {
            compteurPetitePlateforme = true;
          }
        }
      }
    } else if ( Menu.level == 5 ){
      if ( NombrePetitePlateforme%2 != 0 ){
        NombrePetitePlateforme = NombrePetitePlateforme + 1;
      }
      NombrePic = NombreGrandePlateforme + NombrePetitePlateforme/2;
      TableauPicX = new int[NombrePic];
      TableauPicY = new int[NombrePic];
      if ( NombreGrandePlateforme%2 != 0 ){
        NombreGrandePlateforme = NombreGrandePlateforme + 1;
      }
      NombreCuistot = NombreGrandePlateforme/2;
      TableauCuistotX = new int[NombreCuistot];
      TableauCuistotY = new int[NombreCuistot];
      TableauPlateformeCuistot = new int[NombreCuistot];
      for(int i = 1; i < Plateforme.NombrePlateforme-1; i++){
        if ( Plateforme.TableauPlateformeTypeDefinie[i] == 0 ){
          TableauPicX[compteur] = Plateforme.TableauPlateformeX[i] + (int)random(25,575);
          TableauPicY[compteur] = Plateforme.TableauPlateformeY[i] - 54;
          compteur = compteur + 1;
          if ( compteurGrandePlateforme == true ) {
            TableauCuistotX[compteurcuistot] = Plateforme.TableauPlateformeX[i];
            TableauCuistotY[compteurcuistot] = Plateforme.TableauPlateformeY[i] - 206;
            TableauPlateformeCuistot[compteurcuistot] = i;
            compteurcuistot = compteurcuistot + 1;
            compteurGrandePlateforme = false;
          } else if ( compteurGrandePlateforme == false ){
            compteurGrandePlateforme = true;
          }
        } else if ( Plateforme.TableauPlateformeTypeDefinie[i] == 1 || Plateforme.TableauPlateformeTypeDefinie[i] == 2  ){
          if ( compteurPetitePlateforme == true ) {
            TableauPicX[compteur] = Plateforme.TableauPlateformeX[i] + (int)random(25,175);
            TableauPicY[compteur] = Plateforme.TableauPlateformeY[i] - 54;
            compteur = compteur + 1;
            compteurPetitePlateforme = false;
          } else if ( compteurPetitePlateforme == false ) {
            compteurPetitePlateforme = true;
          }
        }
      }
    } else if ( Menu.level == 6 ){
      if ( NombrePetitePlateforme%2 != 0 ){
        NombrePetitePlateforme = NombrePetitePlateforme + 1;
      }
      NombrePic = NombreGrandePlateforme + NombrePetitePlateforme/2;
      TableauPicX = new int[NombrePic];
      TableauPicY = new int[NombrePic];
      if ( NombreGrandePlateforme%2 != 0 ){
        NombreGrandePlateforme = NombreGrandePlateforme + 1;
      }
      NombreCuistot = NombreGrandePlateforme/2;
      TableauCuistotX = new int[NombreCuistot];
      TableauCuistotY = new int[NombreCuistot];
      TableauPlateformeCuistot = new int[NombreCuistot];
      for(int i = 1; i < Plateforme.NombrePlateforme-1; i++){
        if ( Plateforme.TableauPlateformeTypeDefinie[i] == 0 ){
          TableauPicX[compteur] = Plateforme.TableauPlateformeX[i] + (int)random(25,575);
          TableauPicY[compteur] = Plateforme.TableauPlateformeY[i] - 54;
          compteur = compteur + 1;
          if ( compteurGrandePlateforme == true ) {
            TableauCuistotX[compteurcuistot] = Plateforme.TableauPlateformeX[i];
            TableauCuistotY[compteurcuistot] = Plateforme.TableauPlateformeY[i] - 206;
            TableauPlateformeCuistot[compteurcuistot] = i;
            compteurcuistot = compteurcuistot + 1;
            compteurGrandePlateforme = false;
          } else if ( compteurGrandePlateforme == false ){
            compteurGrandePlateforme = true;
          }
        } else if ( Plateforme.TableauPlateformeTypeDefinie[i] == 1 || Plateforme.TableauPlateformeTypeDefinie[i] == 2  ){
          if ( compteurPetitePlateforme == true ) {
            TableauPicX[compteur] = Plateforme.TableauPlateformeX[i] + (int)random(25,175);
            TableauPicY[compteur] = Plateforme.TableauPlateformeY[i] - 54;
            compteur = compteur + 1;
            compteurPetitePlateforme = false;
          } else if ( compteurPetitePlateforme == false ) {
            compteurPetitePlateforme = true;
          }
        }
      }
    } else if ( Menu.level == 7 ){
      if ( NombreGrandePlateforme%2 != 0 ){
        NombreGrandePlateforme = NombreGrandePlateforme + 1;
      }
      if ( NombrePetitePlateforme%2 != 0 ){
        NombrePetitePlateforme = NombrePetitePlateforme + 1;
      }
      NombreCuistot = NombreGrandePlateforme/2;
      NombrePic = (NombrePetitePlateforme / 2) + (NombreGrandePlateforme);
      TableauPicX = new int[NombrePic];
      TableauPicY = new int[NombrePic];
      TableauCuistotX = new int[NombreCuistot];
      TableauCuistotY = new int[NombreCuistot];
      TableauPlateformeCuistot = new int[NombreCuistot];
      for(int i = 1; i < Plateforme.NombrePlateforme-1; i++){
        if ( Plateforme.TableauPlateformeTypeDefinie[i] == 0 ){
          if ( compteurGrandePlateforme == true ) {
            TableauPicX[compteur] = Plateforme.TableauPlateformeX[i] + (int)random(25,150);
            TableauPicY[compteur] = Plateforme.TableauPlateformeY[i] - 54;
            compteur = compteur + 1;
            TableauPicX[compteur] = Plateforme.TableauPlateformeX[i] + (int)random(350,575);
            TableauPicY[compteur] = Plateforme.TableauPlateformeY[i] - 54;
            compteur = compteur + 1;
            TableauCuistotX[compteurcuistot] = Plateforme.TableauPlateformeX[i];
            TableauCuistotY[compteurcuistot] = Plateforme.TableauPlateformeY[i] - 206;
            TableauPlateformeCuistot[compteurcuistot] = i;
            compteurcuistot = compteurcuistot + 1;
            compteurGrandePlateforme = false;
          } else if ( compteurGrandePlateforme == false ){
            compteurGrandePlateforme = true;
          }
        } else if ( Plateforme.TableauPlateformeTypeDefinie[i] == 1 || Plateforme.TableauPlateformeTypeDefinie[i] == 2  ){
          if ( compteurPetitePlateforme == true ) {
            TableauPicX[compteur] = Plateforme.TableauPlateformeX[i] + (int)random(25,175);
            TableauPicY[compteur] = Plateforme.TableauPlateformeY[i] - 54;
            compteur = compteur + 1;
            compteurPetitePlateforme = false;
          } else if ( compteurPetitePlateforme == false ) {
            compteurPetitePlateforme = true;
          }
        }
      }
    } else if ( Menu.level == 8 ){
      NombreCuistot = NombreGrandePlateforme;
      TableauCuistotX = new int[NombreCuistot];
      TableauCuistotY = new int[NombreCuistot];
      TableauPlateformeCuistot = new int[NombreCuistot];
      NombrePic = Plateforme.NombrePlateforme-2;
      TableauPicX = new int[NombrePic];
      TableauPicY = new int[NombrePic];
      for(int i = 1; i < Plateforme.NombrePlateforme-1; i++){
        if ( Plateforme.TableauPlateformeTypeDefinie[i] == 0 ){
          TableauPicX[compteur] = Plateforme.TableauPlateformeX[i] + (int)random(25,575);
          TableauPicY[compteur] = Plateforme.TableauPlateformeY[i] - 54;
          TableauCuistotX[compteurcuistot] = Plateforme.TableauPlateformeX[i];
          TableauCuistotY[compteurcuistot] = Plateforme.TableauPlateformeY[i] - 206;
          TableauPlateformeCuistot[compteurcuistot] = i;
          compteurcuistot = compteurcuistot + 1;
          compteur = compteur + 1;
        } else if ( Plateforme.TableauPlateformeTypeDefinie[i] == 1 || Plateforme.TableauPlateformeTypeDefinie[i] == 2  ){
          TableauPicX[compteur] = Plateforme.TableauPlateformeX[i] + (int)random(25,175);
          TableauPicY[compteur] = Plateforme.TableauPlateformeY[i] - 54;
          compteur = compteur + 1;
        }
      }
    } else if ( Menu.level == 9 ){
      NombreCuistot = NombreGrandePlateforme;
      TableauCuistotX = new int[NombreCuistot];
      TableauCuistotY = new int[NombreCuistot];
      TableauPlateformeCuistot = new int[NombreCuistot];
      NombrePic = NombrePetitePlateforme + (NombreGrandePlateforme * 2);
      TableauPicX = new int[NombrePic];
      TableauPicY = new int[NombrePic];
      for(int i = 1; i < Plateforme.NombrePlateforme-1; i++){
        if ( Plateforme.TableauPlateformeTypeDefinie[i] == 0 ){
          TableauPicX[compteur] = Plateforme.TableauPlateformeX[i] + (int)random(25,150);
          TableauPicY[compteur] = Plateforme.TableauPlateformeY[i] - 54;
          compteur = compteur + 1;
          TableauPicX[compteur] = Plateforme.TableauPlateformeX[i] + (int)random(350,575);
          TableauPicY[compteur] = Plateforme.TableauPlateformeY[i] - 54;
          compteur = compteur + 1;
          TableauCuistotX[compteurcuistot] = Plateforme.TableauPlateformeX[i];
          TableauCuistotY[compteurcuistot] = Plateforme.TableauPlateformeY[i] - 206;
          TableauPlateformeCuistot[compteurcuistot] = i;
          compteurcuistot = compteurcuistot + 1;
        } else if ( Plateforme.TableauPlateformeTypeDefinie[i] == 1 || Plateforme.TableauPlateformeTypeDefinie[i] == 2  ){
          TableauPicX[compteur] = Plateforme.TableauPlateformeX[i] + (int)random(25,175);
          TableauPicY[compteur] = Plateforme.TableauPlateformeY[i] - 54;
          compteur = compteur + 1;
        }
      }
    }  else if ( Menu.level == 10 ){
      NombreBattonet = 2;
      Batonnetfait = false;
      bossMonte = false;
      bossDescent = false;
      BossX = width-400;
      BossY = height+20;
      NombreCuistot = NombreGrandePlateforme;
      TableauCuistotX = new int[NombreCuistot];
      TableauCuistotY = new int[NombreCuistot];
      TableauPlateformeCuistot = new int[NombreCuistot];
      NombrePic = NombrePetitePlateforme + (NombreGrandePlateforme * 2);
      TableauPicX = new int[NombrePic];
      TableauPicY = new int[NombrePic];
      for(int i = 1; i < Plateforme.NombrePlateforme-1; i++){
        if ( Plateforme.TableauPlateformeTypeDefinie[i] == 0 ){
          TableauPicX[compteur] = Plateforme.TableauPlateformeX[i] + (int)random(25,150);
          TableauPicY[compteur] = Plateforme.TableauPlateformeY[i] - 54;
          compteur = compteur + 1;
          TableauPicX[compteur] = Plateforme.TableauPlateformeX[i] + (int)random(350,575);
          TableauPicY[compteur] = Plateforme.TableauPlateformeY[i] - 54;
          compteur = compteur + 1;
          TableauCuistotX[compteurcuistot] = Plateforme.TableauPlateformeX[i];
          TableauCuistotY[compteurcuistot] = Plateforme.TableauPlateformeY[i] - 206;
          TableauPlateformeCuistot[compteurcuistot] = i;
          compteurcuistot = compteurcuistot + 1;
        } else if ( Plateforme.TableauPlateformeTypeDefinie[i] == 1 || Plateforme.TableauPlateformeTypeDefinie[i] == 2  ){
          TableauPicX[compteur] = Plateforme.TableauPlateformeX[i] + (int)random(25,175);
          TableauPicY[compteur] = Plateforme.TableauPlateformeY[i] - 54;
          compteur = compteur + 1;
        }
      }
    }
    
    //---------------------- Création de la map terminée --------------
    Plateforme.AssignationOn = true;
    
  }

///////////////////////////////////// Actualisation  /////////////////////////////////////////////////////    
  
  void update() {

    //---------------------- Annimation des Cuistots --------------
    frameCounter++;
    if(frameCounter==annimSpeed){
      frameCounter=0;
      spriteCounter++;
      if(spriteCounter==4){
         spriteCounter=0;
       }
    }
    
    //---------------------- Déplacement des Cuistots, des Pics ( et des Battonets au niveau du Boss ) par rapport au Scroll du Joueur --------------
    if ( Perso.BougeDroite == true && Perso.BougeGauche == false && Perso.ScrollRight == true ){
      CuistotBougeD();
      PicBougeD();
      if ( Menu.level == 10 ){
        BattonetBougeD();
      }
    } else if ( Perso.BougeDroite == false && Perso.BougeGauche == true && Perso.ScrollLeft == true ){
      CuistotBougeG();
      PicBougeG();
      if ( Menu.level == 10 ){
        BattonetBougeG();
      }
    }

    //---------------------- Déplacement automatique des Cuistot par rapport au Plateforme --------------
    for (int i = 0; i < NombreCuistot; i++){
      if ( TableauCuistotX[i] >= Plateforme.TableauPlateformeX[TableauPlateformeCuistot[i]]+650){
        CuistotDroit = false;
        CuistotGauche = true;
      } else if ( TableauCuistotX[i] <= Plateforme.TableauPlateformeX[TableauPlateformeCuistot[i]]-50){
        CuistotGauche = false;
        CuistotDroit = true;
      }
    }
    
    //---------------------- Déplacement du Boss --------------
    if ( Menu.level == 10 ){
      if ( BossY <= height/6*2 ){
        bossMonte = false;
        bossDescent = true;
      } else if ( BossY >= height/6*3 ){
        bossMonte = true;
        bossDescent = false;
      }
    }
    
  }

///////////////////////////////////////// DRAW /////////////////////////////////////////////////////
  
  void draw() {
    
    update();
    Pic();
    Cuistot();
    if ( CuistotDroit == false && CuistotGauche == true ){
      CuistotG();
    } else if ( CuistotDroit == true && CuistotGauche == false ){
      CuistotD();
    }
    if ( Menu.level == 10 ) {
      Boss();
      if ( Perso.Canmove == true ){
        Battonet();
        if ( bossDescent == false && bossMonte == true ){
          BossMonte();
        } else if ( bossDescent == true && bossMonte == false ){
          BossDescent();
        }
      } else if ( Perso.Canmove == false ) {
        if ( BossY > height/6*2 ){
          BossMonte();
        }
      }
    }
    
  }

///////////////////////////////////////// Dessin des Pics ///////////////////////////////////////////////////// 
  
  void Pic() {
    for(int j = 0; j < NombrePic; j++){
      image(pic, TableauPicX[j], TableauPicY[j]);
    }
  }

///////////////////////////////////////// Déplacement des Pics ( En cas de Scroll ) ///////////////////////////////////////////////////// 

  void PicBougeD() {
    for (int j = 0; j < NombrePic; j++){
        TableauPicX[j] = TableauPicX[j] - SpeedPic;
    }
  }
  
   void PicBougeG() {
    for (int j = 0; j < NombrePic; j++){
        TableauPicX[j] = TableauPicX[j] + SpeedPic;
    }
  }

///////////////////////////////////////// Dessin des Cuistot ///////////////////////////////////////////////////// 
  
  void Cuistot() {
    for (int i = 0; i < NombreCuistot; i++){
      if ( CuistotDroit == false && CuistotGauche == true ){
        PImage newCuistot = cuistot.get(anim[spriteCounter],206, 200, 411 );
        image(newCuistot,TableauCuistotX[i], TableauCuistotY[i]);
      } else if ( CuistotDroit == true && CuistotGauche == false ){
        PImage newCuistot = cuistot.get(anim[spriteCounter],0, 200, 208 );
        image(newCuistot,TableauCuistotX[i], TableauCuistotY[i]);
      }
    }
  }

///////////////////////////////////////// Déplacement des Cuistots ///////////////////////////////////////////////////// 
  
  void CuistotD() {
    for (int i = 0; i < NombreCuistot; i++){
      TableauCuistotX[i] = TableauCuistotX[i] + SpeedCuistot;
    }
  }

  
  void CuistotG() {
    for (int i = 0; i < NombreCuistot; i++){
      TableauCuistotX[i] = TableauCuistotX[i] - SpeedCuistot;
    }
  }

///////////////////////////////////////// Déplacement des Cuistots ( En cas de Scroll ) ///////////////////////////////////////////////////// 
  
  void CuistotBougeD() {
    for(int i = 0; i < NombreCuistot; i++){
      TableauCuistotX[i] = TableauCuistotX[i] - Plateforme.SpeedPlaque;
    }
  }

  
  void CuistotBougeG() {
    for(int i = 0; i < NombreCuistot; i++){
      TableauCuistotX[i] = TableauCuistotX[i] + Plateforme.SpeedPlaque;
    }
  }

///////////////////////////////////////// Dessin du boss ///////////////////////////////////////////////////// 
  
  void Boss() {
     PImage newBoss = boss.get(0,anim2[spriteCounter], 400, 523 );
     image(newBoss,BossX, BossY);
  }

///////////////////////////////////////// Déplacement du boss ///////////////////////////////////////////////////// 
  
  void BossMonte() {
    BossY = BossY - 2;
  }

  
  void BossDescent() {
    BossY = BossY + 2;
  }

///////////////////////////////////////// Déplacement des Battonets /////////////////////////////////////////////////////   
  
  void Battonet() {
    if ( Batonnetfait == false ) {
      XBattonet = BossX;
      YBattonet = BossY+100; 
      Batonnetfait = true;
    } else {
      image(battonet, XBattonet, YBattonet);
      XBattonet = XBattonet - SpeedBattonet;
      if ( XBattonet <= -300 ){
        XBattonet = BossX;
        YBattonet = BossY+100;   
      }
    }
  }

///////////////////////////////////////// Déplacement des Battonets ( En cas de Scroll ) ///////////////////////////////////////////////////// 
  
  void BattonetBougeD() {
    XBattonet = XBattonet - SpeedBattonet; //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>//
  }
  
  
  void BattonetBougeG() {
    XBattonet = XBattonet + SpeedBattonet;
  }

  
}
*/
