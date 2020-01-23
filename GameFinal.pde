/////////////////////////////////////////// Appel des classes ///////////////////////////////////////////

/*------------------- Création de variable pour la mini-cinématique du boss ------------------*/
int time, timeInitiale;
boolean timeInitialefait;

/////////////////////////////////////////// DRAW ///////////////////////////////////////////

void Gdraw() {

    /*------------------- On déssine les éléments de décor par rapport à la situation du Joueur ------------------
    if ( Menu.Start == true && Menu.Restart == false ) {

      if ( Plateforme.AssignationOn == false ) {
        Plateforme.assignation();
        Decors.assignation();
        Musique.assignation();
        Ennemis.assignation();
      } else if ( Plateforme.AssignationOn == true && Menu.Credit == false ) {

        if (  Menu.Victoire == false ) {
          Plateforme.draw();
          Ennemis.draw();
          Perso.draw();
        }

        /*------------------- On vérifie si le Joueur touche les Ailes ( Représente la Victoire du level ) ------------------
        if ( (Perso.X+25 > Plateforme.TableauPlateformeX[Plateforme.NombrePlateforme-1]+(Decors.LongueurPlateForme/2)-70) && (Perso.X+25 < Plateforme.TableauPlateformeX[Plateforme.NombrePlateforme-1]+(Decors.LongueurPlateForme/2)+70) && (Perso.Y < Decors.AileY+10 ) && (Perso.Y > Decors.AileY-100 ) ) {
          Musique.assignation();
          Perso.BougeDroite = false;
          Perso.BougeGauche = false;
          Decors.fait = false;
          Menu.Victoire = true;
        } else if ( ( Perso.X+75 > Plateforme.TableauPlateformeX[Plateforme.NombrePlateforme-1]+(Decors.LongueurPlateForme/2)-70) && (Perso.X+75 < Plateforme.TableauPlateformeX[Plateforme.NombrePlateforme-1]+(Decors.LongueurPlateForme/2)+70) && (Perso.Y < Decors.AileY+10 ) && (Perso.Y > Decors.AileY-100 ) ) {
          Musique.assignation();
          Perso.BougeDroite = false;
          Perso.BougeGauche = false;
          Decors.fait = false;
          Menu.Victoire = true;
        }

      }

    }

    /*------------------- On vérifie si le Joueur tombe dans le vide ------------------
    if (  Menu.Victoire == false ) {

      if ( Perso.Y > height + 100 ) {
        Musique.assignation();
        Menu.mort = 0;
        Perso.BougeDroite = false;
        Perso.BougeGauche = false;
        Plateforme.AssignationOn = false;
        Decors.fait = false;
        Menu.Restart = true;
      }

      /*------------------- On vérifie si le Joueur touche les Cuistots ------------------
      if ( Menu.level >= 4 ){
        for(int j = 0; j < Ennemis.NombreCuistot; j++){
          if ( ( Perso.X+25 > Ennemis.TableauCuistotX[j]+20 ) && ( Perso.X+25 < Ennemis.TableauCuistotX[j]+175 ) && ( Perso.Y+137 > Ennemis.TableauCuistotY[j]+30 ) && ( Perso.Y+137 < Ennemis.TableauCuistotY[j]+216 ) ) {
            Musique.assignation();
            Menu.mort = 2;
            Perso.BougeDroite = false;
            Perso.BougeGauche = false;
            Plateforme.AssignationOn = false;
            Decors.fait = false;
            Menu.Restart = true;
          } else if  ( ( Perso.X+75 > Ennemis.TableauCuistotX[j]+20 ) && ( Perso.X+75 < Ennemis.TableauCuistotX[j]+175 ) && ( Perso.Y+137 > Ennemis.TableauCuistotY[j]+30 ) && ( Perso.Y+137 < Ennemis.TableauCuistotY[j]+216 ) ) {
            Musique.assignation();
            Menu.mort = 2;
            Perso.BougeDroite = false;
            Perso.BougeGauche = false;
            Plateforme.AssignationOn = false;
            Decors.fait = false;
            Menu.Restart = true;
          }
        }
      }

      /*------------------- On vérifie si le Joueur touche les Pics ------------------
      for(int j = 0; j < Ennemis.NombrePic; j++){
        if ( ( Perso.X+25 > Ennemis.TableauPicX[j] ) && ( Perso.X+25 < Ennemis.TableauPicX[j]+175 ) && ( Perso.Y+137 > Ennemis.TableauPicY[j]+10 ) && ( Perso.Y+137 < Ennemis.TableauPicY[j]+60 ) ) {
          Musique.assignation();
          Menu.mort = 1;
          Perso.BougeDroite = false;
          Perso.BougeGauche = false;
          Plateforme.AssignationOn = false;
          Decors.fait = false;
          Menu.Restart = true;
        } else if  ( ( Perso.X+75 > Ennemis.TableauPicX[j] ) && ( Perso.X+75 < Ennemis.TableauPicX[j]+175 ) && ( Perso.Y+137 > Ennemis.TableauPicY[j]+10 ) && ( Perso.Y+137 < Ennemis.TableauPicY[j]+60 ) ) {
          Musique.assignation();
          Menu.mort = 1;
          Perso.BougeDroite = false;
          Perso.BougeGauche = false;
          Plateforme.AssignationOn = false;
          Decors.fait = false;
          Menu.Restart = true;
        }
      }

      /*------------------- Mini-cinématique d'entrée du boss ------------------
      if ( Menu.level == 10 ){

        if ( Perso.Canmove == false ){
          time = millis();
          if ( timeInitialefait == false ) {
            timeInitiale = time;
            timeInitialefait = true;
          }
          if ( time >= timeInitiale + 25500 ) {
            Perso.Canmove = true;
          }
          if ( time >= timeInitiale + 5000 && time <= timeInitiale + 15000 ) {
            Decors.Texte1();
          } else if ( time >= timeInitiale + 15000 && time <= timeInitiale + 26000 ) {
            Decors.Texte2();
          }
        }

        /*------------------- On vérifie si le Joueur touche les Battonets ------------------
        if ( ( Perso.X+25 > Ennemis.XBattonet ) && ( Perso.X+25 < Ennemis.XBattonet+80 ) && ( Perso.Y+120 > Ennemis.YBattonet ) && ( Perso.Y+120 < Ennemis.YBattonet+24 ) ) {
          Musique.assignation();
          Menu.mort = 3;
          Perso.BougeDroite = false;
          Perso.BougeGauche = false;
          Plateforme.AssignationOn = false;
          Decors.fait = false;
          Menu.Restart = true;
        } else if  ( ( Perso.X+75 > Ennemis.XBattonet ) && ( Perso.X+75 < Ennemis.XBattonet+80 ) && ( Perso.Y+120 > Ennemis.YBattonet ) && ( Perso.Y+120 < Ennemis.YBattonet+24 ) ) {
          Musique.assignation();
          Menu.mort = 3;
          Perso.BougeDroite = false;
          Perso.BougeGauche = false;
          Plateforme.AssignationOn = false;
          Decors.fait = false;
          Menu.Restart = true;
        } else if  ( ( Perso.X+15 > Ennemis.XBattonet ) && ( Perso.X+15 < Ennemis.XBattonet+80 ) && ( Perso.Y+27 > Ennemis.YBattonet ) && ( Perso.Y+27 < Ennemis.YBattonet+24 ) ) {
          Musique.assignation();
          Menu.mort = 3;
          Perso.BougeDroite = false;
          Perso.BougeGauche = false;
          Plateforme.AssignationOn = false;
          Decors.fait = false;
          Menu.Restart = true;
        } else if  ( ( Perso.X+85 > Ennemis.XBattonet ) && ( Perso.X+85 < Ennemis.XBattonet+80 ) && ( Perso.Y+27 > Ennemis.YBattonet ) && ( Perso.Y+27 < Ennemis.YBattonet+24 ) ) {
          Musique.assignation();
          Menu.mort = 3;
          Perso.BougeDroite = false;
          Perso.BougeGauche = false;
          Plateforme.AssignationOn = false;
          Decors.fait = false;
          Menu.Restart = true;
        }

      }

    }
*/
}


/////////////////////////////////////////// Fonctions du clavier ///////////////////////////////////////////

void GkeyPressed() {

    /*------------------- On vérifie si le Joueur est en Jeu ------------------
    if ( Menu.Start == true && Menu.Restart == false && Menu.Victoire == false && Menu.Credit == false ) {

      /*------------------- On vérifie si le Joueur peut bouger ------------------
      if ( Perso.Canmove == true ){
        Perso.keyPressed();
      }

      /*------------------- Retour au Menu ------------------
      if (key == 'm' || key == 'M'){
        if ( Menu.level > 9 ) {
          Menu.level = 9;
        }
        Musique.assignation();
        Perso.Canmove = true;
        Perso.BougeDroite = false;
        Perso.BougeGauche = false;
        Plateforme.AssignationOn = false;
        Decors.fait = false;
        Menu.Start = false;
        Musique.assignation();
      }

    /*------------------- On vérifie si le Joueur est dans le Menu ------------------
    } else if ( Menu.Start == false ) {

      /*------------------- Commencer la partie ------------------
      if (key == ' ' ){
        Perso.Y = 0;
        Perso.X = 50;
        Perso.BougeDroite = false;
        Perso.BougeGauche = false;
        Plateforme.AssignationOn = false;
        Decors.fait = false;
        Menu.Start = true;
      }

    /*------------------- On vérifie si le Joueur est dans l'écran de GameOver ------------------
    } else if ( Menu.Restart == true ) {

       /*------------------- Restart du niveau actuel ------------------
       if (key == 'r' || key == 'R' ){
          Perso.Y = 0;
          Perso.X = 50;
          if ( Menu.level > 9 ){
            Perso.Canmove = false;
            timeInitialefait = false;
            Perso.turnRight = true;
            Perso.X = 150;
            Menu.level = 10;
          }
          Perso.BougeDroite = false;
          Perso.BougeGauche = false;
          Plateforme.AssignationOn = false;
          Decors.fait = false;
          Menu.Restart = false;
       }

    /*------------------- On vérifie si le Joueur est dans l'écran de Victoire ------------------
    } else if ( Menu.Victoire == true ){

        /*------------------- Commence la partie au niveau suivant ( ou lance les crédit si niveau du boss gagné ) ------------------
        if (key == ' ' ){
          Perso.Y = 0;
          Perso.X = 50;
          Perso.BougeDroite = false;
          Perso.BougeGauche = false;
          if ( Menu.level < 9 ){
            Menu.level = Menu.level + 1;
          } else if ( Menu.level == 9 ) {
            Perso.Canmove = false;
            timeInitialefait = false;
            Perso.turnRight = true;
            Perso.X = 150;
            Menu.level = 10;
          } else if ( Menu.level == 10 ) {
            Menu.timeInitialefait2 = false;
            Menu.CreditY = height;
            Menu.Credit = true;
          }
          Plateforme.AssignationOn = false;
          Decors.fait = false;
          Menu.Victoire = false;
        }

    }
*/
}

void GkeyReleased() {

    /*------------------- On vérifie si le Joueur est en Jeu ------------------
    if ( Menu.Start == true && Menu.Restart == false && Menu.Victoire == false && Menu.Credit == false ) {

      /*------------------- On vérifie si le Joueur peut bouger ------------------
      if ( Perso.Canmove == true ){
        Perso.keyReleased();
      }

    }
    */
}
