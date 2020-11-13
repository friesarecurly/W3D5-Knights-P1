require_relative "tree_node"

class KnightPathFinder

    attr_reader :root_node, :start

    # up to 8 possible pos (1,2) from argument position
    def self.valid_moves(pos)  
      pos_moves = [ [1, 2], [1, -2], [-1, 2], [-1, -2], 
      [2, 1], [2, -1], [-2, 1], [-2, -1] ]

      valid = []
      pos_moves.each do |move| 
        x, y = move[0] + pos[0], move[1] + pos[1]
        next if x < 0 || y < 0 || x > 7 || y > 7
        new_pos = [0,0]
        new_pos[0] = x
        new_pos[1] = y
        valid << new_pos
      end

      valid
    end

    def initialize(pos)
      @root_node = PolyTreeNode.new(pos)
      @start = pos
      @considered_positions = [pos] #0,0
    end

    def new_move_positions(pos)
      arr = KnightPathFinder.valid_moves(pos)
      new_pos = arr.select do |path| 
        !@considered_positions.include?(path)
      end
      @considered_positions += new_pos
      new_pos
    end

    require "byebug"
    def build_move_tree
      queue = [@root_node] # 1
      
      new_pos = [nil]
      until new_pos.empty?
        current = queue.shift #root_node
        new_pos = new_move_positions(current.value) #0,0 1,2 2,1
        new_pos.each do |np|
            current.add_child( PolyTreeNode.new(np) )
        end
        #break if new_pos.empty?
        queue += current.children
      end

      # @root_node
    end

end

# kpf = KnightPathFinder.new([0,0])
# p kpf.build_move_tree

# p KnightPathFinder.valid_moves([7,7])