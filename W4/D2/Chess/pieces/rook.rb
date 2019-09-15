require_relative "pieces.rb"
require_relative "slideable.rb"

class Rook < Pieces
  include Slideable  # Raise Error if call diagonal dir

  def symbol
    "Rook"
  end

  # @return [Array] All possible dir or moves?
  def move_dirs
    horizontal_dirs
  end

end
