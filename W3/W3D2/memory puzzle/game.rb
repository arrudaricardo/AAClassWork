require_relative "board"

class Game

      
  def initialize
    puts 'Game initialize' 
    @board = Board.new(4)
    @board.populate
  end
  
  # You may want a play loop that runs until the game is over. 
  # Inside the loop, you should render the board, prompt the player for input, and get a guessed pos. 
  # Pass this pos to a make_guess method, where you will handle the actual memory/matching logic. 
  def play

      @board.render(clear=true)
    until @board.won? 

      # should call reveal two time
      guess_1 = @board.reveal  # gonna get position guess from the user and return the value
      @board.render(clear=true)
      guess_2 = @board.reveal  # gonna get position guess from the user and return the value
      @board.render(clear=true)
      
      if guess_1 == guess_2
        puts "It's a match!" 
      else
        # reset the board - set all card to face_up == false
        puts "Try Again!"
        @board.reset 
      end
      sleep 3
      
      @board.render(clear=true)
    end
  end

  

end