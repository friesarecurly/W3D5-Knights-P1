  
class PolyTreeNode
  attr_reader :value, :parent
  attr_accessor :children

  def initialize(value, parent= nil, children= [])
    @value = value
    @parent = parent
    @children = children
  end
     
  def parent=(dad)
    @parent.children.delete(self) if @parent != nil
    @parent = dad
    if dad != nil && !dad.children.include?(self)
      dad.children << self
    end
  end

  def add_child(child)
    child.parent = self
  end

  def remove_child(child)
    if child.parent == self
      child.parent = nil
    else
      raise "Node is not a child of parent!"
    end
  end

  def dfs(target)
    return self if self.value == target

    result = nil
    self.children.each do |child|
      result = child.dfs(target)  
      return result if result != nil
    end

    result 
  end


  def bfs(target) #7,6
    queue = [self] #@rootnode

    until queue.empty?
      return queue.first if queue.first.value == target
      queue += queue.shift.children
    end

    nil
  end

  # def inspect
  #   @value.inspect
  # end
  
end

