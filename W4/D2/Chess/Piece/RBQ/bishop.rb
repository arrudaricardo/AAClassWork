
require_relative "../pieces.rb"

class Bishop < Pieces
  include Slideable  # Raise Error if call horizontal dir

  def symbol
   # "Bishop" cntrl + cmd + space for  ♝
  end

end