require_relative "pieces.rb"
require "singleton"

class NullPiece < Pieces

  include Singleton

  def initialize
  end

  def moves
    nil
  end

  def symbol
    "Null"
  end

end
