class PolyTreeNode

attr_reader :parent, :value
attr_accessor :children

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  # @param prop <PolyTreeNode>
  def parent=(prop)
    # sets the parent property
    if prop != nil and prop.parent != nil and prop.parent == @parent
      prop.parent.children.delete(self) 
    end
    
    @parent = prop

    # adds the node to their parent's array of children 
    if prop != nil && !prop.children.include?(self) 
        prop.children << self 
    end
    # @parent.children.each do |child|
    #  child.parent = self
    # end

  end 

  def add_child(child_node)
    self.children << child_node if !self.children.include?(child_node)
    child_node.parent = self
    
    # should pass itself to the child's #parent
    # doesn't add the child twice 
  end

  def remove_child(child_node)
    if self.children.include?(child_node)
        child_node.parent = nil 
        self.children.delete(child_node) 
    else 
        raise 
    end
  end

  # def dfs(root=self, target_val)
  #   # First, check the value at this node. If a node's value matches the target value, return the node.
  #   # If not, iterate through the #children and repeat.   
   
  #   return nil if root == nil
  #   if root.value == target_val 
  #       return root 
  #   else                                    
  #       root.children.each do |child|  
  #          ret = dfs(child, target_val)    
  #          return ret if ret != nil
  #       end
  #   end
    
  #   nil
  # end

  def dfs(target)
    
    return self if self.value == target

    self.children.each do |child|
      result = child.dfs(target)
      return result unless result.nil?
    end

    nil
  end

  def bfs(target)
    nodes = [self]
    until nodes.empty?
      node = nodes.shift

      return node if node.value == target
      nodes.concat(node.children)
    end

    nil
  end

  def inspect
    { 'value' => @value, 'parent_value' => @parent.value }.inspect
  end

end