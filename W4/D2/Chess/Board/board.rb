# file requirements
require_relative(" ../Piece/pieces.rb")
require_relative("../Piece/MISC/nullpiece.rb")

class Board

  attr_reader :grid

  def initialize
    @rows = Array.new(8) { Array.new(8) } 
    @sentinel = NullPiece.instance 
  end 

  def [](arr)
    x, y = arr
    @rows[x][y]
  end

  def []=(pos, val)
    x, y = pos
    @rows[x][y] = val
  end

  def move_piece(start_pos, end_pos) 
    # Error handling
    raise "No selected piece" if @rows[start_pos].empty? # define later
    raise "Not a valid move" unless valid_pos?(@rows[end_pos]) # check

    # update the grid; move piece from start_pos to end_pos
    piece = @rows[end_pos]
    # if end_pos is included in all positions the piece can go to... (valid moves)
    if valid_moves(piece).include?(end_pos)
      piece.pos = end_pos
      @rows[end_pos] = piece
      @rows[start_pos] = NullPiece.instance
    else
      raise "Not a valid move."
    end
  end

  # @param piece [Piece]
  # @return Boolean
  def valid_pos?(piece)
    piece.pos.all? { |el| el.between(0, 7) }
  end
  
  def add_piece(piece, pos)

  end  
  
  def checkmate?(color)

  end  

  def in_check?(color)

  end  
  
  def find_king(color)

  end  

  def dup

  end

  def move_piece!(color, start_pos, end_pos)

  end

end

