require_relative "00_tree_node.rb"

class KnightsPathFinder
    attr_reader :pos, :root_node
    attr_accessor :considered_positions

    def initialize(pos)
        @pos = pos
        @root_node = PolyTreeNode.new(pos)
        @considered_positions = [pos]
        self.build_move_tree
    end

    def self.valid_moves(pos)
        possible_move = []
        possible_move << [pos.first - 2, pos.last - 1] 
        possible_move << [pos.first - 2, pos.last + 1]
        possible_move << [pos.first - 1, pos.last - 2]
        possible_move << [pos.first - 1, pos.last + 2]  
        possible_move << [pos.first + 2, pos.last - 1] 
        possible_move << [pos.first + 2, pos.last + 1] 
        possible_move << [pos.first + 1, pos.last - 2]
        possible_move << [pos.first + 1, pos.last + 2]  
        possible_move.select { |move| move.first >= 0 && move.first < 8 && move.last >= 0 && move.last <8}
    end

    def new_move_positions(pos)
        new_moves = KnightsPathFinder.valid_moves(pos).select{|move|!@considered_positions.include?(move)}
        @considered_positions += new_moves
        new_moves
    end

    def build_move_tree(pos)
        @root_node.parent(pos)
        @root_node.children = KnightsPathFinder.valid_moves(pos)
    end

end