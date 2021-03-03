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

class CircularLinkedList
  def initialize(arr)
    cur = dummy = Node.new('dummy')
    Array(arr).each do |value|
      cur.next_node = Node.new(value)
      cur = cur.next_node
    end

    @root = dummy.next_node
  end

  attr_reader :root

  def pop
  end

  def shift
  end

  def push(value)
  end

  def unshift(value)
  end

  def at(index)
  end

  def insert_at(index, value)
  end

  def remove_at(index)
  end

  def to_s
  end
end
