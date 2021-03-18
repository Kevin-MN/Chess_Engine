/* 
 Authors: Kevin, Garrison, Howie 
 Class: CISC191 Final Project
 Description: This class is used to do the majority of the move checks to make sure that pieces move according
 to the rules of the game.
 */
public class Move_Engine {

  //member data that holds positions of current piece and destination, we can do alot with this information
  private int currentX;
  private int currentY;
  private int moveX;
  private int moveY;


  Move_Engine() {
    this.currentX = 0;
    this.currentY = 0;
    this.moveX = 0;
    this.moveY = 0;
  }

  // returns true if spot is empty, false otherwise
  public boolean empty(Chessboard board, int destX, int destY) {
    if (board.get_board()[destY][destX] == null) {
      return true;
    } else {
      return false;
    }
  }

  /*  This method is used to implement colision between opposing pieces, not finished
   public boolean enemy(Chessboard board,Player player, int destX, int destY){
   if(!empty(
   }
   */

  //this method is used to make move on the board
  public boolean make_move(Player player, Chessboard board) {

    // set data members from players stored piece and desired move location
    this.currentX = player.get_piece().get_x();
    this.currentY = player.get_piece().get_y();
    this.moveX = mouseX / 100;
    this.moveY = mouseY / 100;

    boolean moved = false;  //collision check: if the spot is empty || the pieces are not on the same team, proceed to next check 
    if (board.get_piece(moveX, moveY) == null || board.get_piece(moveX, moveY).get_team() != player.get_piece().get_team()) {
      if (player.get_piece().validate_move_scheme(this.currentX, this.currentY, this.moveX, this.moveY)) {// polymorphism, validate move based on piece type
        board.set_piece(player.get_piece(), moveY, moveX);  // move the piece if valid
        if (currentX != moveX || currentY != moveY) {  // if the piece is moving to a new spot
          board.get_board()[currentY][currentX] = null;  // set previous spot to null
          moved = true;
        }
      }
    }

    player.null_piece();  //set players held piece to null
    board.update_boardGUI();  // update board
    return moved;
  }
}
