# Rearrange a linked list such that all even and odd positioned nodes are together
require './node'

root = nil
cur = nil
File.read('./tests/1.txt').split(" ").each do |i|
  node = Node.new(i.to_i)
  if root.nil?
    root = node
  end
  if cur.nil?
    cur = node
  else
    cur.next_node = node
    cur = node
  end
end

puts "Before: #{root}"

even = root
odd = root.next_node
cur = root
while cur != nil && cur.next_node != nil
  t = cur.next_node
  cur.next_node = cur.next_node.next_node

  cur = t
end

cur = even
while cur.next_node != nil
  cur = cur.next_node
end
cur.next_node = odd
root = even

puts "After: #{root}"
