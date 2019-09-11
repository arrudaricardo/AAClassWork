require_relative "../pieces.rb"

class Queen < Pieces
  include Slideable

  def symbol
    'Queen'
  end

  def move_dirs
    horizontal_dirs + diagonal_dirs
  end
  
end