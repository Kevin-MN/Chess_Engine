/* 
 Author: Kevin, Garrison
 Class: CISC191 Final Project
 Description: This class is used to represent pieces in the game of chess, data members include vital information
 like position and team status. There are specific pieces that implement the abstract validate_move_scheme() method. 
 
 */
public abstract class Piece {

  protected PImage piece_image;
  protected int x_index;
  protected int y_index;
  protected String name;
  protected boolean team; // true for white, false for black

  Piece(String name, int x, int y, boolean team) {
    this.name = name;
    this.x_index = x;
    this.y_index = y;
    this.team = team;
    this.load_image();
  }
  // to be implemented by specific pieces
  public abstract boolean validate_move_scheme(int currX, int currY, int destX, int destY);

  public int get_x() {
    return this.x_index;
  }

  public int get_y() {
    return this.y_index;
  }

  public void set_x(int x) {
    this.x_index = x;
  }

  public void set_y(int y) {
    this.y_index = y;
  }

  public boolean get_team() {
    return this.team;
  }

  public void display_image() {
    image(this.piece_image, this.x_index * 100, this.y_index * 100, 100, 100);
  }

  public String get_name() {
    return this.name;
  }

  //private helper method used by constructor, loads images 
  private void load_image() {
    if (this.team == true) {
      this.piece_image = loadImage("w" + this.name + ".png");
    } else {
      this.piece_image = loadImage("b" + this.name + ".png");
    }
  }
}

public class Queen extends Piece {
  Queen(int x, int y, boolean white) {
    super("Queen", x, y, white);
  }
  // the queen can move verticaly, horizontally, and diagonally in all directions
  public boolean validate_move_scheme(int currX, int currY, int destX, int destY) {
    if (abs(destX-currX) > 0 && ((destY-currY) == 0) || abs(destY-currY) > 0 && ((destX-currX) == 0)) { // horizontal and vertical movement
      return true;
    } else if (((destX - currX) == (destY - currY)) || (destX - currX) == (-1 * (destY - currY))) { // diagonal movement
      return true;
    } else {
      return false;
    }
  }
}


public class Pawn extends Piece {
  public boolean first_move;
  Pawn(int x, int y, boolean white) {
    super("Pawn", x, y, white);
    this.first_move = true;
  }

  public boolean validate_move_scheme(int currX, int currY, int destX, int destY) {
    System.out.println(this.team);
    if (this.team) { // white move
      if (currX == destX && currY - destY == 2 && first_move) {// first move 2 spots
        first_move = false;
        return true;
      } else if (currY - destY == 1) { // 1 spot move
        return true;
      }
    } else {  //black move
      if (currX == destX && currY - destY == -2 && first_move) {  //first move 2 spots
        first_move = false;
        return true;
      } else if (currY - destY == -1) {  // 1 spot move
        return true;
      }
    }
    return false;
  }
}

public class King extends Piece {
  King(int x, int y, boolean white) {
    super("King", x, y, white);
  }
  //no castling
  public boolean validate_move_scheme(int currX, int currY, int destX, int destY) {
    if (sqrt(sq(destX - currX) + sq(destY - currY)) == 1 || sqrt(sq(destX - currX) + sq(destY - currY)) == sqrt(2)) {// all adjacent spots
      return true;
    } else {
      return false;
    }
  }
}

public class Bishop extends Piece { 
  Bishop(int x, int y, boolean white) {
    super("Bishop", x, y, white);
  }

  public boolean validate_move_scheme(int currX, int currY, int destX, int destY) {

    if (((destX - currX) == (destY - currY)) || (destX - currX) == (-1 * (destY - currY))) {// all diagonal spots
      return true;
    } else {
      return false;
    }
  }
}

public class Knight extends Piece {
  Knight(int x, int y, boolean white) {
    super("Knight", x, y, white);
  }

  public boolean validate_move_scheme(int currX, int currY, int destX, int destY) {
    if (sqrt(sq(destX-currX) + sq(destY-currY)) == sqrt(5)) { // using vector algebra all spots with |v| = sqrt(5)
      return true;
    } else {
      return false;
    }
  }
}

public class Rook extends Piece {
  Rook(int x, int y, boolean white) {
    super("Rook", x, y, white);
  }

  public boolean validate_move_scheme(int currX, int currY, int destX, int destY) {
    if (abs(destX-currX) > 0 && ((destY-currY) == 0) || abs(destY-currY) > 0 && ((destX-currX) == 0)) { // horizontal and vertical
      return true;
    } else {
      return false;
    }
  }
}
