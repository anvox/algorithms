# Delete a Linked List node at a given position

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

def process(root, position)
  prev = Node.new("root", root)
  cur = prev
  while position > 0 && cur != nil
    cur = cur.next_node
    position -= 1
  end

  if cur.next_node
    cur.next_node = cur.next_node.next_node
  end

  prev.next_node
end

root = process(root, 10)
puts "After: #{root}"
