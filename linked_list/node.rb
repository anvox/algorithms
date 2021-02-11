class Node
  def initialize(value, next_node = nil)
    @value = value
    @next_node = next_node
  end

  attr_reader :value
  attr_accessor :next_node

  def to_s
    if next_node.nil?
      "(#{value})->NIL"
    else
      "(#{value})->#{next_node}"
    end
  end
end

class CNode
  def initialize(value, next_node = nil, children = nil)
    @value = value
    @next_node = next_node
    @children = children
  end

  attr_reader :value
  attr_accessor :next_node, :children

  def to_s
    if next_node.nil?
      "(#{value}[#{children&.value}])->NIL"
    else
      "(#{value}[#{children&.value}])->#{next_node}"
    end
  end
end
