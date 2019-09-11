class Pieces
  attr_reader :pos
  def initialize(color, board, initial_pos)
    @color = color
    @board = board # fix later
    @pos = initial_pos
  end
# SYMBOLS FOR EACH PIECE
    #EX ROOK: ♜ ♖ 
    # we'll use this in the display only. This way we can keep the pieces logic simpler
    # and throw the above into the display method.

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

  Private 
  def move_into_check?(end_pos) 
  end
end 

# Bishop Rook and Queen
module Slideable # need to know what direction piece can move 
  HORIZONTAL_DIRS =   [[1,0], [-1,0], [0,1],  [0, -1]]# fill in later
  DIAGONAL_DIRS   =   [[1,1], [1,-1], [-1,1], [-1,-1]]

  # Misc Notes
  # stop slideable if another piece is in the way or end of board...?

  # horiz (and vertical)
  def horizontal_dirs 
    HORIZONTAL_DIRS
  end
  
  # diagonal
  def diagonal_dirs 
    DIAGONAL_DIRS
  end

  def move_dirs # this is only asking for directions piece can go in...
  end 

    # @return [[dir1 positions], [dir2 positions]... ] All the possible moves until the end_pos
    def moves
      possible_moves = []
      moves_dirs.each do |pos|
        possible_moves << grow_unblocked_moves_in_dir(*pos)
      end
      possible_moves   # return remaining possible moves...
    end


  # @return [Array] All possible moves in one direction, including OFF THE BOARD
  def grow_unblocked_moves_in_dir(dx, dy) 
    unb_mvs = []
      x,y = pos # calls pieces position
      (1..7).each do |mult|
        unb_mvs << [  x + mult*dx ,  y + mult*dy ] 
      end
    unb_mvs
  end

end 

# Knight and King

    # KK CAN TRAVEL TO 8 SPACES UNOBSTRUCTED

module Stepable 

  def moves
    # can call move_diffs

  end

  Private
  def move_diffs
  end
end 

