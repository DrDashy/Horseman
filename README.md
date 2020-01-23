# Horseman
Video game : Horseman can't fly by Axel DUCUING and Théo LERBEIL

# What is it :
  This game was made for my homework asked on my second year of my University Tech Degree.  
  The goal was to create a video game using Processing software with a delay of one week.

  For that, we were two :  
    - Axel DUCUING as a programmer  
    - Théo LERBEIL more as a graphic designer but also help as a programmer

  The game was a simple scrolling game where you can only jump and try to avoid traps on the road.  
  There was nine levels and a boss at the end.

  The game was ready at the end but count some problems :  
    - The player can jump even after dropping the plateform  
    - The game cannot be adapted to all computer screen  
    - The game as a lot of FPS drop  
    - We cannot skip the cinematic at the boss (so we have to wait at least 30 seconds every times)

# What I want to do :
  Today, I want to give this game a good refractor.

  First, I try to have a better global conception of the proggram and correct all the problems announce above.  
  Then I wil try to evolve the game to add more features :  
    - diversify the level design  
    - add sounds (music level, sound effect...)  
    - randomize the environment level
    
  I also want to know something, when we created the game, we were having a big issue.  
  Our player was one pixel more above the platform collider for each platform passed.     
  And to get rid of this bug, I end up with this calcul to finnaly have the perfect player position matchess with the platform collider :   
  Y = Plateform.ArrayPlateformY[i] - 137 + ( i * 1.4 ) - ( Plateform.NumberPlateform + ( 1.4 * 2 ) );  
  PS : it actually work Oo'
    
# In progress :
  - Randomize the environment level
  - Add parallax (left and right)
  - Add Javadoc in all class and function

# Run the game in Processing :
  - Download processing "https://processing.org/download/"
  - In processing you have to download libraries : Tools --> add tools --> Libaries --> Search for "Minim" --> Install
  - Open Project
  - Run the game
  
# Run the game with executable :
  - First version playable comming soon...
