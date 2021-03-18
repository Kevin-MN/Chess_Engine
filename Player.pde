/* 
 Author: Kevin, Garrison
 Class: CISC191 Final Project
 Description: This class is used to represent a player, a player stores a piece when they grab it, 
 if they do not have a piece then the piece is null. 
 */
public class Player {

  protected Piece move_piece;
  protected ArrayList<Piece> hostages;  // not used
  protected ArrayList<Piece> my_pieces; // not used

  Player() {
    move_piece = null;
  }

  //grabs a piece from the board with respective team
  public void grab_piece(Chessboard board, boolean white) {

    this.move_piece = board.get_piece(mouseX/100, mouseY/100); // set player piece to piece selected on grid via mouse
    if (this.move_piece != null && this.move_piece.get_team() != white) { // if piece grabbed is from different team, piece is not picked up
      this.move_piece = null;
    }
    this.display_selected();
  }

  //return whether the player has picked up a piece
  public boolean has_piece() {
    if (this.move_piece == null) {
      return false;
    } else {
      return true;
    }
  }

  //sets players piece to null indicating they have not picked up a piece
  public void null_piece() {
    this.move_piece = null;
  }

  //little gui method that draws a red box around a selected piece
  private void display_selected() {
    if (this.move_piece != null) {
      noFill();
      stroke(255, 0, 0);
      rect(this.move_piece.get_x() * 100, this.move_piece.get_y() * 100, 100, 100);
    }
  }

  public Piece get_piece() {
    return this.move_piece;
  }

  // this method is used for debugging
  public void print_piece() {
    if (move_piece != null) {
      System.out.println("\n" + this.move_piece.get_x() + " " + this.move_piece.get_y() + " " + this.move_piece.get_name() + "\n");
    } else {
      System.out.println("\n" +  (int)(mouseX/100) + " " +(int)(mouseY/100)  + " Null\n");
    }
  }
}
