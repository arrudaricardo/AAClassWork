require_relative '../W3D5/Polytreenode/skeleton/lib/00_tree_node.rb'

class KnightPathFinder

  attr_reader :root_node, :considered_pos

  # @param pos [Array<interger>] Initial position to be tested
  def self.valid_moves(pos)
    # loop x,y = pos
    moves = [[2,1],[2,-1], [-2,1],[ -2, -1],[ 1,2],[ 1,-2], [-1,2], [-1,-2]]
    valid_moves = []

    moves.each do |move|
      x,y = pos
      new_x = move.first + x
      new_y = move.last + y

      valid_moves << [new_x, new_y] if [new_x, new_y].all? { |ele| ele.between?(0, 7) }
    
    end
    valid_moves
  end

  def initialize(pos)
    @root_node = PolyTreeNode.new(pos)
    @considered_pos = Array.new 
    build_move_tree
  end

  def new_move_positions(node)
    new_pos = KnightPathFinder.valid_moves(node.value)

    new_pos.each do |pos| 
      child_node = PolyTreeNode.new(pos)
      next if considered_pos.any? do |considered|
        considered.value == pos
      end

      considered_pos.push(child_node) 
      node.add_child(child_node)

    end
  end

  def build_move_tree

    new_move_positions(root_node)

    until considered_pos.size >= 63
      considered_pos.each do |position| 

        new_move_positions(position) 
      end
    end
    true
  end

  def find_path(end_pos)
    last_node = root_node.bfs(end_pos)
    trace_path_back(last_node)
  end

  #returns array
  def trace_path_back(last_node)
    path = []
    current_node = last_node
    while current_node != root_node
      current_node = current_node.parent
      path << current_node.value
    end
    path.reverse << last_node.value
  end

end