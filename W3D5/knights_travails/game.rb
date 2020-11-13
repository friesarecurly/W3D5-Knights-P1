require_relative "tree_node"

class KnightPathFinder

    attr_reader :root_node

    # up to 8 possible pos (1,2) from argument position
    def self.valid_moves(pos)
      pos_moves = [ [1, 2], [1, -2], [-1, 2], [-1, -2], 
      [2, 1], [2, -1], [-2, 1], [-2, -1] ]

      valid = []
      pos_moves.each do |move| # [0, 0]
        x, y = move[0] + pos[0], move[1] + pos[1]
        next if x < 0 || y < 0 || x > 7 || y > 7
        new_pos = [0,0]
        new_pos[0] = x
        new_pos[1] = y
        valid << new_pos
      end

      p valid
    end

    def initialize(pos)
      @root_node = PolyTreeNode(pos)
      @considered_positions = [pos]
    end

    def new_move_positions(pos)
      arr = KnightPathFinder.valid_moves(pos)
      new_pos = arr.select do |path| 
        !@considered_positions.include(path)
      end
      @considered_positions << new_pos
      new_pos
    end

end

# kpf = KnightPathFinder.new([0,0])
KnightPathFinder.valid_moves( [0,3] )
KnightPathFinder.new_move_positions([0,3])