/* 
 Authors: Kevin, Howie
 Class: CISC191 Final  Project
 Description: This class houses the main structure that is used to implement the game, the chess board. 
 The class uses a 2s piece array to realize a game of chess, null spots represent empty spaces. 
 There are alot of GUI functions in this class. 
 */
public class Chessboard {   

  private Piece[][] board;
  private PImage board_image;

  Chessboard() {
    this.board = new Piece[8][8];
    this.board_image = loadImage("Chessboard.jpg");
    this.setup_board();
    this.update_boardGUI();
  }

  //return piece on board
  public Piece get_piece(int x, int y) {
    return this.board[y][x];
  }

  //private helper method for initializing board with pawns
  private void setup_pawns(int row, boolean white) {
    for (int column = 0; column < 8; column++) {
      this.board[row][column] = new Pawn(column, row, white);
    }
  }

  // returns board
  public Piece[][] get_board() {
    return  this.board;
  }

  //sets piece on board
  public void set_piece(Piece piece, int row, int col ) {
    this.board[row][col] = piece;
    this.board[row][col].set_x(col);
    this.board[row][col].set_y(row);
  }

  // This method prints out the board as a 8x8 grid with the positions of the pieces, primarily used for debugging to check the state of the board
  public void print_pieces() {
    System.out.println();
    for (int row = 0; row < board.length; row++) {
      for (int col = 0; col < board[row].length; col++) {
        if (board[row][col] != null) {
          System.out.print(board[row][col].get_name() + " ");
        } else {
          System.out.print("null ");
        }
      }
      System.out.println();
    }
    System.out.println();
  }

  //updates the main frame to correctly display pieces after a move, updates board image then pieces
  public void update_boardGUI() {
    image(this.board_image, 0, 0, 800, 800);
    this.update_piecesGUI();
  }

  //update piece images
  private void update_piecesGUI() {
    for (int row = 0; row < 8; row++) {
      for (int column = 0; column < 8; column++) {
        if (this.board[row][column] != null) {
          this.board[row][column].display_image();
        }
      }
    }
  }



  //helper method for setting up the board to it's initial state
  private void setup_board() {

    //setup black side
    this.setup_pawns(1, false);
    this.board[0][0] = new Rook(0, 0, false);
    this.board[0][7] = new Rook(7, 0, false);
    this.board[0][4] = new King(4, 0, false);
    this.board[0][3] = new Queen(3, 0, false);
    this.board[0][1] = new Knight(1, 0, false);
    this.board[0][6] = new Knight(6, 0, false);
    this.board[0][2] = new Bishop(2, 0, false);
    this.board[0][5] = new Bishop(5, 0, false);

    //setup white side
    this.setup_pawns(6, true);
    this.board[7][0] = new Rook(0, 7, true);
    this.board[7][7] = new Rook(7, 7, true);
    this.board[7][4] = new King(4, 7, true);
    this.board[7][3] = new Queen(3, 7, true);
    this.board[7][1] = new Knight(1, 7, true);
    this.board[7][6] = new Knight(6, 7, true);
    this.board[7][2] = new Bishop(2, 7, true);
    this.board[7][5] = new Bishop(5, 7, true);
  }
}
