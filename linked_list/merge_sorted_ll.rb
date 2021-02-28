# Merge two sorted linked lists
# I use dummy node, just for different, clone is not the best one
# the good one is in-place which is covered

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
a = root
root = nil
curr = nil
File.read('./tests/5.txt').split(" ").each do |i|
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
b = root

puts "A: #{a}"
puts "B: #{b}"

c = nil
while a != nil && b != nil
  if a.value < b.value
    t = a.next_node
    a.next_node = c
    c = a

    a = t
  else
    t = b.next_node
    b.next_node = c
    c = b

    b = t
  end
end

while a != nil
  t = a.next_node
  a.next_node = c
  c = a

  a = t
end

while b != nil
  t = b.next_node
  b.next_node = c
  c = b

  b = t
end

puts "C: #{c}"

