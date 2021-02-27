# Merge a linked list into another linked list at alternate positions

require './node'

b = Node.new(3, Node.new(4, Node.new(7, Node.new(8, Node.new(10, Node.new(15, Node.new(17)))))))
a = Node.new(1, Node.new(2, Node.new(12)))

puts "A: #{a}"
puts "B: #{b}"

pa = a
pb = b
while pa != nil
  t = pa.next_node

  pa.next_node = pb
  pb = pb.next_node
  pa.next_node.next_node = t

  pa = t
end

b =pb

puts "After A: #{a}"
puts "After B: #{b}"
