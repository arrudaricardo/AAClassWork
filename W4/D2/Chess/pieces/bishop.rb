require_relative "pieces.rb"
require_relative "slideable.rb"

class Bishop < Pieces
  include Slideable  # Raise Error if call horizontal dir

  def symbol
    "Bishop"
   # "Bishop" cntrl + cmd + space for  ♝
  end

  def move_dirs
    diagonal_dirs
  end

end
