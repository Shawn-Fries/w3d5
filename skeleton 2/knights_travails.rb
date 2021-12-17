require_relative "00_tree_node.rb"

class KnightsPathFinder

    def initialize(pos)
        @pos = pos
        @root_node = PolyTreeNode.new(pos)
        self.build_move_tree
    end

end