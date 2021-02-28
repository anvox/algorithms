# Insert a node after the n-th node from the end

require './node'

root = Node.new(3, Node.new(4, Node.new(7, Node.new(8, Node.new(10, Node.new(15, Node.new(17)))))))

# Insert x after i-th node
def process(root, i, x)
  cur = root
  i.times do
    cur = cur.next_node

    break if cur == nil
  end

  if cur == nil
    return Node.new(x, root)
  end

  prev = root
  while cur != nil
    cur = cur.next_node
    prev = prev.next_node
  end

  prev.next_node = Node.new(x, prev.next_node)

  root
end

puts "Before: #{root}"

root = process(root, 14, 19)

puts "After: #{root}"
