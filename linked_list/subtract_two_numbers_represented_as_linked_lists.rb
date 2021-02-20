# Subtract Two Numbers represented as Linked Lists

require './node'

l1 = Node.new(1, Node.new(0, Node.new(0)))
l2 = Node.new(1)

def nsub(p1, p2)
  if p1.next_node == nil && p2.next_node == nil
    value = p1.value - p2.value
    if value < 0
      [Node.new(value + 10), 1]
    else
      [Node.new(value), 0]
    end
  else
    tail, borrow = nsub(p1.next_node, p2.next_node)
    value = p1.value - p2.value - borrow
    if value < 0
      [Node.new(value + 10, tail), 1]
    else
      [Node.new(value, tail), 0]
    end
  end
end

def process(l1, l2)
  # Make sure 2 linked lists have same length
  s1 = 0
  cur = l1
  while cur != nil
    s1 += 1
    cur = cur.next_node
  end

  s2 = 0
  cur = l2
  while cur != nil
    s2 += 1
    cur = cur.next_node
  end

  if s1 < s2
    t = l1
    l1 = l2
    l2 = t

    t = s1
    s1 = s2
    s2 = t
  end

  (s1 - s2).times do
    l2 = Node.new(0, l2)
  end

  # Make sure l1 > l2
  p1 = l1
  p2 = l2
  while p1 != nil && p2 != nil && p1.value == p2.value
    p1 = p1.next_node
    p2 = p2.next_node
  end

  if p1 == nil || p2 == nil
    return Node.new(0)
  end

  if p1.value < p2.value
    t = l1
    l1 = l2
    l2 = t
  end

  # do subtract
  puts "  #{l1}"
  puts "- #{l2}"
  p1 = l1
  p2 = l2
  root, borrow = nsub(p1, p2)
  # if borrow != 0
  #   # WTF???
  # end
  root
end

root = process(l1, l2)
puts "Result: #{root}"
