class PolyTreeNode
    attr_reader :parent, :value, :children
    
    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(parent)
        if @parent != nil
            @parent.children.delete(self)
        end

        @parent = parent
        @parent.children << self if parent != nil
    end

    def add_child(child)
        child.parent = self
    end

    def remove_child(child)
        child.parent = nil
        raise "not a child" if !@children.include?(child)
    end
require "byebug"
    #####Searchable#####
    def dfs(target_value)
        # return self if self.value == target_value
        # debugger
        # @children.each do |child|
        #     return child if child.value == target_value
        #     child.dfs(target_value) if child.children.length > 0
        # end
        length = self.index.length
        (0...length).each do |i|
            return i if self[i] == target_value
        end
        nil
    end

    def index

        parent_index = 0
        self.each_with_index do |child, index|
        if index.zero?
        child.parent = self[parent_index]
        parent_index += 1 if index.even?
        end
    end
  end
end

n1 = PolyTreeNode.new("root1")
n2 = PolyTreeNode.new("root2")
n3 = PolyTreeNode.new("root3")

# connect n3 to n1
n3.parent = n1
# connect n3 to n2
n3.parent = n2

# this should work
raise "Bad parent=!" unless n3.parent == n2
raise "Bad parent=!" unless n2.children == [n3]

# this probably doesn't
raise "Bad parent=!" unless n1.children == []