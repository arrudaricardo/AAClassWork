require_relative "../pieces.rb"

class King < Pieces
  include Stepable

def symbol 
  "King"
end

end