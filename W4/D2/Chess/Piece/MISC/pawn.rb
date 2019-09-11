require_relative "../pieces.rb"


class Pawn < Pieces

  def symbol
    "Pawn"
  end
  
  # return position ([x], [y]) # works on x... since row, column
  def move_dirs
    x, y = pos
    possible_moves = []
    # going forward alone 
    foward_steps.each do |step|   # [1,2] or [1]
      possible_moves.push([x + step * forward_dir(color), y])
    end
    possible_moves 
  end

  def valid_moves # overwriting for pawns... (can't land on an enemy)
    # Write so it only checks the forward direction possibility
    # we only call this inside move_dirs
    possible_moves = []
    move_dirs.each do |mov|
      unless board[mov].empty?
        possible_moves << mov
      end
    end 
    possible_moves + side_attacks
  end

  private
  def at_start_row? 
    # if white and in row 1, or black and row 6
    color == "white" && pos[0] == 1 || color == "black" && pos[0] == 6 
  end

  def forward_dir(color)
    if color == "white" 
     1 # move by 1 because white on bottom
    else
     -1 # depending on color... 
    end
  end


  def foward_steps 
    if at_start_row?
      [1, 2]
    else 
      [1]
    end
  end

  # @return Array[pos1, pos2] if anemy is on pos
  def side_attacks
    attack = []
    x,y = pos
    pos1 = [x + forward_dir, y - 1] 
    pos2 = [x + forward_dir, y + 1]
    [pos1, pos2].each do |el|
      if board.valid_pos?(el) and color != board[el].color 
        attack << el
      end
    end 
    attack
  end

end