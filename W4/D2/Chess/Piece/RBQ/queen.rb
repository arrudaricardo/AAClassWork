require_relative "../pieces.rb"

class Queen < Pieces
  include Slideable

  def symbol
    'Queen'
  end
  
end