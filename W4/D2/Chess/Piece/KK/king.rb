require_relative "../pieces.rb"

class King < Pieces
  include Stepable

def symbol 
  "King"
end

def move_diffs
  [-1, 0, 1].permutation(2).to_a.map{|dir| [pos[0] + dir[0], pos[1] + dir[1]] }
end

end 