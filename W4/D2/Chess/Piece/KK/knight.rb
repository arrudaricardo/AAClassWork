
require_relative "../pieces.rb"

class Knight < Pieces
  include Stepable

  def symbol
    "Knight"
  end


  def move_diffs
    [2,1,-2,-1].permutation(2).to_a.select { |arr| arr.sum != 0 }
  end

end