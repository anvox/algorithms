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

class IndexOutOfBound < StandardError
  def initialize(*_)
    super("Index out of bound.")
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

    tail = find_tail

    value = root.value
    @root = root.next_node
    tail.next_node = root

    value
  end

  def push(value)
    unshift(value)
    @root = root.next_node
    self
  end

  def unshift(value)
    if empty?
      @root = Node.new(value)
      root.next_node = root

      return self
    end

    tail = find_tail
    @root = Node.new(value, root)
    tail.next_node = root

    self
  end

  # Return node at index
  def at(index)
    if empty?
      return nil
    end

    cur = root
    index.times do
      cur = cur.next_node
      raise IndexOutOfBound.new if cur == root
    end

    cur
  end

  # Return inserted node
  def insert_at(index, value)
    if empty? || index == 0
      unshift(value)

      return root
    end

    prev = root
    (index - 1).times do
      prev = prev.next_node
      raise IndexOutOfBound.new if prev == root
    end
    prev.next_node = Node.new(value, prev.next_node)

    prev.next_node
  end

  # Return removed node
  def remove_at(index)
    if empty?
      return nil
    end
    if index == 0
      node = root
      tail = find_tail

      @root = node.next_node
      tail.next_node = root

      return node
    end

    prev = root
    (index - 1).times do
      prev = prev.next_node
      raise IndexOutOfBound.new if prev == root
    end
    node = prev.next_node
    prev.next_node = node.next_node

    return node
  end

  def find_tail
    tail = root
    while tail.next_node != root
      tail = tail.next_node
    end

    tail
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

  def length
    return 0 if empty?

    cur = root
    i = 1
    while cur.next_node != root
      i += 1
      cur = cur.next_node
    end

    i
  end

  def inspect
    to_s
  end

  def search(value)
    return -1 if empty?

    cur = root
    i = 0
    while true
      return i if cur.value == value
      cur = cur.next_node

      i += 1
      break if cur == root
    end

    return -1
  end
end
