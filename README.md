# Horseman
Video game : [Horseman can't fly] by Axel DUCUING and Théo LERBEIL

## What is it :
  This game was made as a homework on my second year of my University Tech Degree.
  The goal was to create a video game using the software “Processing”, with a deadline of one week.
  
  For that, we were two :
    ⋅⋅* Axel DUCUING, as a programmer
    ⋅⋅* Théo LERBEIL, as a graphic designer, but also as support programmer
  
  The game is a simple 2D scrolling game where you can only jump and try to avoid the traps laid on the path to the level's end.
  There is nine levels and a boss at the end of the game.
  
  The game was ready for the deadline, but some problems remained and couldn't be solved at that time :
    ⋅⋅* The player can “air jump” after dropping from the platform
    ⋅⋅* The game did not work for all computer screens because of the difference in screens' resolutions. 
    ⋅⋅* The game has a lot of FPS drop
    ⋅⋅* We cannot skip the cinematic at the boss (so you had to wait at least 30 seconds every time)

## What I want to do :
  Today, I decided to redo this game, and make it better, with the help of everything I have learned until now..

  First, I'll try to recode it in a more proper and tidy manner (like by using object-oriented programming), and also try to    
  correct all the problems announced above.

  Then I will try to evolve the game by adding more features :
    ⋅⋅* diversify the level design
    ⋅⋅* work on the sound-design (music level, sound effect...)
    ⋅⋅* randomize the level's environment
    
  There is also one more reason for me wanting to redo this game.
  Indeed, at some point of this game's conception, we ran into a problem.
  The player's character sprite would move up by one pixel for each new platform passed.

  Our player was one pixel more above the platform collider for each platform passed.
  The problem was ultimately solved by this line of code :
  ```java
  (Player) Y = Plateform.ArrayPlateformY[i] - 137 + ( i * 1.4 ) - ( Plateform.NumberPlateform + ( 1.4 * 2 ) );
  ```

  The problem is: to this day, I do not know how I came up with this line of code, and WHY IN HELL DOES IT WORKS?
  This, is the biggest reason for my wanting to redo this game.
    
## In progress :
  ⋅⋅* Randomize the level's environment
  ⋅⋅* Add horizontal parallax
  ⋅⋅* Add Javadoc in all class and function

## Run the game in Processing :
  1. [Download processing](https://processing.org/download/)
  2. In processing you have to download libraries : Tools --> add tools --> Libraries --> Search for "Minim" --> Install
  3. Open Project
  4. Run the game
  
## Run the game with executable :
  ⋅⋅* First playable version coming soon...
