require_relative "00_tree_node.rb"

class KnightsPathFinder
    attr_reader :pos, :root_node
    attr_accessor :considered_positions

    def initialize(pos)
        @pos = pos
        @root_node = PolyTreeNode.new(pos)
        @considered_positions = []
        self.build_move_tree
    end

    def self.valid_moves(pos)
        row, col = pos
        if (col > 8 and 0 > col) and (row > 8 and 0 > row)
            return false
        end
        true
    end

    def new_move_positions(pos)
        if KnightsPathFinder.valid_moves == false
    end

end