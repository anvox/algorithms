# Merge two sorted lists (in-place)

require './node'

a = Node.new(2, Node.new(7, Node.new(11)))
b = Node.new(5, Node.new(8, Node.new(9, Node.new(10, Node.new(12)))))

puts "A=#{a}"
puts "B=#{b}"

p0 = a
p1 = b
while p0 != nil && p1 != nil
  if p0.value > p1.value
    t = p0
    p0 = p1
    p1 = t
  end

  if p0.next_node != nil && p0.next_node.value < p1.value
    p0 = p0.next_node
  else
    t = p0.next_node
    p0.next_node = p1
    p0 = t
  end
end

root = a
if a.value > b.value
  root = b
end

puts "Merged: #{root}"
