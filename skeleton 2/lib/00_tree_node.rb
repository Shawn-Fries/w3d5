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

    def dfs(target_value)
        return self if self.value == target_value
        self.children.each do |child|
            result = child.dfs(target_value)
            return result if result != nil
        end
        nil
    end

    def bfs(target_value)
        queue = [self]
        until queue.length == 0
            current_node = queue.shift
            return current_node if current_node.value == target_value
            return nil if current_node.children == nil
            queue += current_node.children
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