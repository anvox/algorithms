# Move all occurrences of an element to end in a linked list

require './node'

root = nil
curr = nil
File.read('./tests/1.txt').split(" ").each do |i|
  node = Node.new(i.to_i)
  if root.nil?
    root = node
  end
  if curr.nil?
    curr = node
  else
    curr.next_node = node
    curr = node
  end
end

puts "Before: #{root}"

def process(root, x)
  mock = Node.new("root", root)
  cur = mock
  tail = Node.new("tail")
  ptail = tail
  while cur.next_node != nil
    if cur.next_node.value == x
      ptail.next_node = cur.next_node
      cur.next_node = cur.next_node.next_node

      ptail.next_node.next_node = nil
      ptail = ptail.next_node
    end

    cur = cur.next_node
  end

  cur.next_node = tail.next_node

  mock.next_node
end
root = process(root, 2)

puts "After: #{root}"
