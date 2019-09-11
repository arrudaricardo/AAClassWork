
require_relative "../pieces.rb"

class Knight < Pieces
  include Stepable

  def symbol
    "Knight"
  end


end