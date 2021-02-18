# Decimal Equivalent of Binary Linked List

require './node'

root = Node.new("root")
cur = root
[0, 0, 0, 1, 1, 0, 0, 1, 0].each do |v|
  cur.next_node = Node.new(v)
  cur = cur.next_node
end
root = root.next_node

puts "Before: #{root}"

carry = 0
cur = root
while cur != nil
  carry = carry * 2 + cur.value

  cur = cur.next_node
end

puts "After: #{carry}"
