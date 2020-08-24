# Connect 4 Pseudocode

* Print welcome msg to console
* Print menu options
* New game =>
* Draw blank board to console
* CORE LOOP => Get Player 1 input until input is valid (correct column notation and column is free)
* Redraw the the board to console with the updated data
* Check if the game is won
  * If yes, print a win message to console and either exit or restart
* Check if game is drawn
  * Repeat substep above
* Otherwise, repeat steps beginning from CORE LOOP with the opposite player

## Api sketch

### Board

* Grid co-ordinates
* Human readable format
* Check win / draw conditions

### Player

* Name
* Symbol
* Get input

### Game

* Inject board and player dependencies
* Begin menu
* End menu
* Help / rules
* Play round
* Play game
