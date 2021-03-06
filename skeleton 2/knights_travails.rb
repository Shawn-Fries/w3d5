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

    def build_move_tree
        queue = [@root_node]
        until queue.length == 0
            current_node = queue.shift
            new_move_positions = new_move_positions(current_node.value)
            new_move_positions.each do |move|
                current_node.add_child(PolyTreeNode.new(move))
            end
            queue += new_move_positions if new_move_positions != []
        end
    end

end