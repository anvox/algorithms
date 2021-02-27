# In-place Merge two linked lists without changing links of first list

require './node'

b = Node.new(3, Node.new(4, Node.new(7, Node.new(8, Node.new(10, Node.new(15, Node.new(17)))))))
a = Node.new(1, Node.new(2, Node.new(12)))

puts "A: #{a}"
puts "B: #{b}"

p0 = p1 = pa = Node.new('a', a)
pb = b

while pa.next_node != nil && pb != nil
  if pa.next_node.value < pb.value
    pa = pa.next_node
    p1 = p1.next_node
  else
    t = pb
    pb = pb.next_node
    t.next_node = pa.next_node
    pa.next_node = t

    pa = t
  end
end

while pa.next_node != nil
  pa = pa.next_node
  p1 = p1.next_node
end

if pb != nil
  pa.next_node = pb
end

a = p0.next_node
b = p1.next_node
p1.next_node = nil

puts "After A: #{a}"
puts "After B: #{b}"
