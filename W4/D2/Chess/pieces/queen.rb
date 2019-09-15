require_relative "pieces.rb"
require_relative "slideable.rb"

class Queen < Pieces
  include Slideable

  def symbol
    'Queen'
  end

  def move_dirs
    horizontal_dirs + diagonal_dirs
  end
  
end
