# Bishop Rook and Queen
module Slideable 
  HORIZONTAL_DIRS =   [[1,0], [-1,0], [0,1],  [0, -1]]# fill in later
  DIAGONAL_DIRS   =   [[1,1], [1,-1], [-1,1], [-1,-1]]

  def horizontal_dirs 
    HORIZONTAL_DIRS
  end
  
  # diagonal
  def diagonal_dirs 
    DIAGONAL_DIRS
  end

  def move_dirs # this is only asking for directions piece can go in...
  end 

    # @return [[dir1 positions], [dir2 positions]... ] All the possible moves until the end_pos
    def moves
      possible_moves = []
      moves_dirs.each do |pos|
        possible_moves << grow_unblocked_moves_in_dir(*pos)
      end
      possible_moves   # return remaining possible moves...
    end


  # @return [Array] All possible moves in one direction, including OFF THE BOARD
  def grow_unblocked_moves_in_dir(dx, dy) 
    unb_mvs = []
      x,y = pos # calls pieces position
      (1..7).each do |mult|
        unb_mvs << [  x + mult*dx ,  y + mult*dy ] 
      end
    unb_mvs
  end

end 

