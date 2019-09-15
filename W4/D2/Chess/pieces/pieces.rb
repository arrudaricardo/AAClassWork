class Pieces
   #♜ ♖ 
  attr_reader :pos

  def initialize(color, board, initial_pos)
    @color = color
    @board = board # fix later
    @pos = initial_pos
  end

  def to_s 
    @color.to_s
  end 

  def empty? 
    # what do you mean?...
    # If symbol is not null? 
    symbol == "Null"
  end 

  def valid_moves  #all the possible moves
    # should return an array of positions
    # calls subclass move_dirs
    possible_moves = []
    # moves [[unblock dir], [unblock dir]...]
    moves.each do  |unb_dir|  # [0,0],[1,1]...
      unb_dir.each do |unb_pos|
        if board.valid_pos?(unb_pos) 
          if board[unb_pos].empty? # empty space
            possible_moves << unb_moves
          elsif board[unb_pos].color == color # not empty,  same color  
            break # stop the loop for this direction; changes direction
          elsif board[unb_pos].color != color  # not empty nor same color
            possible_moves << unb_moves  # you can attack this position
            break #  change direction
          end # of checking if empty, same color, or diff color
        end  # of checking valid position (making sure it is on the board)
     end  # for each move (going in the same direction)
    end # for each direction
    possible_moves
  end 

  def pos=(val)
    @pos = val
  end 

  def symbol 
    "Piece"
  end 

  # Private 
  def move_into_check?(end_pos) 
  end
end 

