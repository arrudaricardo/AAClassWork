class Pieces
  def initialize(color, board, pos)
    @color = color
    @board = board # fix later
    @pos = []
  end

  def to_s 
  end 
  def empty? 
  end 
  def valid_moves 
  end 
  def pos=(val)
  end 
  def symbol 
  end 

  Private 
  def move_into_check?(end_pos) 
  end
end 

# Bishop Rook and Queen
module Slideable # need to know what direction piece can move 
  def moves(new_pos, piece)
    if @board.is_valid?(pos) 
      # check something... recursive loop here infinite?
      original_pos = piece.pos
      @board.move_piece(piece.color, original_pos, new_pos )
    end
  end
  # stop slideable if another piece is in the way or end of board
end 

# Knight and King
module Stepable 
  def moves(new_pos, piece)
    if @board.is_valid?(pos) 
      # check something... recursive loop here infinite?
      original_pos = piece.pos
      @board.move_piece(piece.color, original_pos, new_pos )
    end
  end
end