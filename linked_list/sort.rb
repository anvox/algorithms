# Sort a linked list

require './node'

root = nil
curr = nil
File.read('./tests/3.txt').split(" ").each do |i|
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

def sorted_insert(root, node)
  if node.value <= root.value
    node.next_node = root
    return node
  end

  curr = root
  while curr.next_node && curr.next_node.value < node.value
    curr = curr.next_node
  end
  node.next_node = curr.next_node
  curr.next_node = node

  root
end

sorted_root = Node.new(root.value)
curr = root.next_node
while curr != nil
  node = Node.new(curr.value)

  sorted_root = sorted_insert(sorted_root, node)

  curr = curr.next_node
end

puts "After: #{sorted_root}"
