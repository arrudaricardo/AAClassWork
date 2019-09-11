# file requirements
require_relative(" ../Piece/pieces.rb")

class Board

  attr_reader :grid

  def initialize()
    @rows = Array.new(8) { Array.new(8) } 
    # @sentinel = NullPiece # later
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
    # update the grid 
    raise "No selected piece" if @rows[start_pos].empty? # define later
    raise "Not a valid move" unless valid_pos?(empty_pos) # check
  end


  
  def valid_pos?(piece)
 #piece on board
 end
  
  def add_piece(piece, pos)
  end  
  
  def checkmate?(color)
  end  

  def in_check?(color)
  end  
  
  def find_king(color)
  end  

  def pieces
  end 

  def dup
  end

  def move_piece!(color, start_pos, end_pos)
  end

end

