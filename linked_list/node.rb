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
