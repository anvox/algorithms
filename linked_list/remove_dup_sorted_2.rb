# Remove duplicated value in sorted linked list 2

require './node'

root = nil
curr = nil
File.read('./tests/4.txt').split(" ").each do |i|
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

c0 = root
c1 = root
while c0 != nil
  while c1.next_node != nil && c0.value == c1.next_node.value
    c1 = c1.next_node
  end

  c0.next_node = c1.next_node
  c0 = c0.next_node
  c1 = c0
end

puts "After: #{root}"
