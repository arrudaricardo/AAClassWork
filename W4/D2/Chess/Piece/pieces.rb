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
  def moves
    # combines horiz or dirs
  end
  # Misc Notes
  # stop slideable if another piece is in the way or end of board...?

  # horiz (and vertical)
  def horizontal_dirs 
    tmp_dirs = []
    HORIZONTAL_DIRS.each do |el| 
      #(1..7).each do |mult| # (mult j and k). Probably done in move_dirs
        x,y = pos # pieces load this pos. 
        j, k = el
        tmp_dirs << [x + j, y + k]  
      #end
    end 
    return tmp_dirs
  end
  
  # diagonal
  def diagonal_dirs 
    tmp_dirs = []
    DIAGONAL_DIRS.each do |el| 
      #(1..7).each do |mult| # (mult j and k). Probably done in move_dirs
        x,y = pos # pieces load this pos. 
        j, k = el
        tmp_dirs << [x + j, y + k]  
      #end
    end 
    return tmp_dirs
  end

  def move_dirs # this is only asking for directions piece can go in...
    # RBQ CAN TRAVEL TO 14 SPACES UNOBSTRUCTED
    # Check symbol
    case symbol
    when "Rook"
      return horizontal_dirs
    when "Bishop"
      return diagonal_dirs
    when "Queen"
      return horizontal_dirs + diagonal_dirs
    end 


  end

  def grow_unblocked_moves_in_dir(dx, dy)
    # What 
  end
end 

# Knight and King

    # KK CAN TRAVEL TO 8 SPACES UNOBSTRUCTED

module Stepable 

  def moves
    
  end

  def move_diffs
  end
end 

