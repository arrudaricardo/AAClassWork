# file requirements
require_relative("../Piece/pieces.rb")
require_relative("../Piece/MISC/nullpiece.rb")

class Board
    # White on Top
    # Black on bottom

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

  def move_piece(color, start_pos, end_pos) # should NOT mutate board
    new_rows = dup
    # Error handling  
    raise "No selected piece" if new_rows[start_pos].empty? # checks if null piece
    raise "Not a valid move" unless new_rows[start_pos].valid_moves.include?(end_pos) # new position not in standard
    raise "NO STEALING MY PIECES" if color != player.color # will fix later. 
    # if no errors so far

    # update the grid; move piece from start_pos to end_pos
    piece = new_rows[start_pos] # call piece
    piece.pos = end_pos # update piece instance
    new_rows[end_pos] = piece
    new_rows[start_pos] = NullPiece.instance
    return new_rows # we moved the piece
  end

  # @param piece [Piece]
  # @return Boolean
  def valid_pos?(pos)
    pos.all? { |el| el.between(0, 7) }
  end
  
  def add_piece(piece, pos)
    board[pos] = piece
  end  
  
  def checkmate?(color)
    # No way to get out of check
    # Call all possible moves on player in check
      # if no way to get out of check, return true. 
      # calls in_check? on
    # Piece in color. 
    rows.each do |row|
      row.each do |piece| 
        if !piece.empty? && piece.color == color  
          piece.valid_moves.each do |move| # find piece in 
              # new_board, call valid_moves, then for each valid move:
              new_board = move_piece(piece.color, piece.pos, move) # move piece to a valid move
              return false unless new_board.in_check? # return false if new_board NOT in check 
          end # of moving the board
        end # of checking if piece is empty and same color
      end # of piece 
    end # of rows
    return true
  end  

  def in_check?(color)
    # see if color's king is a valid position of any opposite color's piece
    king = find_king(color)

    rows.each do |row|
      row.each do |piece|  
        if !piece.empty?  && piece.color != color # if there is a piece of opp. color
          piece.valid_moves.includes?(king.pos) # returns true if king is in a valid move of enemy piece
        end # of if
      end  # of iterating through piece
    end # of going through rows
  end   # of method
  
  def find_king(color) # return king object by iterating through board. object has position
    rows.each do |row|
      row.each do |piece| # each column
        if piece.color == color && piece.symbol == "King"
          return piece 
        end  # if
      end  # for each col
    end #  for each piece # thing in column 
  end   # method find_king

  def dup
    @row.map(&:dup)
  end

  def move_piece!(color, start_pos, end_pos)
    # Error handling  
    raise "No selected piece" if @rows[start_pos].empty? # checks if null piece
    raise "Not a valid move" unless @rows[start_pos].valid_moves.include?(end_pos) # new position not in standard
    raise "NO STEALING MY PIECES" if color != player.color # will fix later. 
    # if no errors so far

    # update the grid; move piece from start_pos to end_pos
    piece = @rows[start_pos] # call piece
    piece.pos = end_pos # update piece instance
    @rows[end_pos] = piece
    @rows[start_pos] = NullPiece.instance

    return true
  end

end # of board class. 

