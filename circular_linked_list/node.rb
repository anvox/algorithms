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
    cur.next_node = dummy.next_node

    @root = dummy.next_node
  end

  attr_reader :root

  def empty?
    root.nil?
  end

  def single?
    root.next_node == root
  end

  def pop
    if empty?
      return nil
    end
    if single?
      value = root.value
      @root = nil

      return value
    end

    prev = root
    while prev.next_node.next_node != root
      prev = prev.next_node
    end

    tail = prev.next_node
    value = tail.value
    prev.next_node = root

    value
  end

  def shift
    if empty?
      return nil
    end
    if single?
      value = root.value
      @root = nil

      return value
    end

    prev = root
    while prev.next_node != root
      prev = prev.next_node
    end

    value = root.value
    @root = root.next_node
    prev.next_node = root

    return value
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
    return "NIL" if root.nil?
    cur = root
    result = ""
    while cur != nil
      result = "#{result}(#{cur.value})->"

      cur = cur.next_node
      break if cur == root
    end

    "#{result}ROOT(#{root.value})"
  end
end
