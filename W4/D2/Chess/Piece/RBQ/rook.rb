
require_relative "../pieces.rb"

class Rook < Pieces
  include Slideable  # Raise Error if call diagonal dir

  def symbol
    "Rook"
  end

end