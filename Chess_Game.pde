/* 
 Authors: Kevin
 Class: CISC191 Final Project
 Description: This class is equivelant to the main, in processing there is no actual main method instead there is 
 void draw which is multiple times a second. This class declares and creates objects used to implement the 
 chess game. The mouseClicked() method is similar to an event definition, everytime the mouse is clicked 
 the code inside is executed.
 */

//declare objects
Chessboard board;
Move_Engine mover;
Player human1;
Player human2;
//Player bot;
boolean turn; // true for white, false for black

//create objects and setup frame
void setup() {
  board = new Chessboard();
  mover = new Move_Engine();
  human1 = new Player();
  human2 = new Player();
  // bot = new Player();
  turn = true;
  frameRate(60);
  size(800, 800);
}

//nothing draw, game is static
void draw() {
}

//this is equivelent to an event, the code is executed every time the mouse button is released, the turn
//boolean is utilized to determine who is moving a piece, if the player has not picked a piece then they pick 
//up a piece and attempt to make a move
void mouseClicked() {

  if (turn) {  //white turn
    if (human1.has_piece() == false) {  // if player1 doesn't have piece  
      human1.grab_piece(board, turn);    // grab a piece
    } else {                            // player one has a piece
      if (mover.make_move(human1, board)) {   // make a move if valid
        turn = false;
      }
    }
  } else {  //black turn
    if (human2.has_piece() == false) {  // if player2 doesn't have piece 
      human2.grab_piece(board, turn);    // player2 grab piece
    } else {
      if (mover.make_move(human2, board)) {
        ;  //make move if valid
        turn = true;
      }
    }
  }

  //  System.out.println(human1.has_piece());
  // human1.print_piece();
  //  System.out.println(human2.has_piece());
  //  human2.print_piece();
  //  board.print_pieces();
}
