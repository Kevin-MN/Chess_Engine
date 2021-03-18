/* 
 Authors: Kevin
 Class: CISC191 Final Project
 Description: This class acts primarily as a stub and is used to display how a bot class would be implemented. 
 The majority of the code is pseudocode.
 */

public class Bot extends Player {

  ArrayList<Pair> possible_moves;  
  MyThread computation_thread;

  Bot() {
    possible_moves = new ArrayList<Pair>();
    computation_thread = new MyThread();
  }

  // clear possible_moves
  public void empty_moves() {
    this.possible_moves.clear();
  }

  //used to select a random number 
  public Pair generate_move() {
    return this.possible_moves.get((int)random(possible_moves.size()));
    //possible that thread.start() could be called here
  }

  // this method prints out all the pairs recursively, primarily used for debugging to make sure added "pairs" are correct
  public void print_pair(int index) {
    if (this.possible_moves.size() < 0 || index >= this.possible_moves.size()) { // base case
      return;
    }
    System.out.println(this.possible_moves.get(index).get_piece().get_name() + " @ " +
      this.possible_moves.get(index).get_piece().get_x() + "," + this.possible_moves.get(index).get_piece().get_y() + " to " +
      this.possible_moves.get(index).getX() + "," + this.possible_moves.get(index).getY() );
    print_pair(index+1);
  }

  //process moves according to x criteria? 
  public void process_moves() {
    // implement optimization or sort
    computation_thread.start();
    this.print_pair(0);
  }

  // a thread for collection processing and computation
  public class MyThread extends Thread {
    //What data might the thread use??


    MyThread() {
      //initialize?
    }

    public void start() {
      super.start();
    }

    public void run() {
      //run optimizations/computations concurrent with main thread 
      //sort possible moves based on a set of criteria
    }
  }




  // create data structures that the bot would use
  public class Pair {
    private Piece piece;
    private int moveX;
    private int moveY;

    public Pair(Piece piece, int x, int y) {
      this.piece = piece;
      this.moveX = x;
      this.moveY = y;
    }

    public int getX() {
      return this.moveX;
    }

    public Piece get_piece() {
      return this.piece;
    }

    public int getY() {
      return this.moveY;
    }
  }
}
