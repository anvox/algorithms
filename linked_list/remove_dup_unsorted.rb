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
curr = root
cached = {}
cached[root.value] = 1
while curr != nil && curr.next_node != nil
  if cached[curr.next_node.value] == nil
    cached[curr.next_node.value] = 1
    curr = curr.next_node
  else
    curr.next_node = curr.next_node.next_node
  end
end


puts "After: #{root}"
