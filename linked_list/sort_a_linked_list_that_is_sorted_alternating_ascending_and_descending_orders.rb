# Sort a linked list that is sorted alternating ascending and descending orders

require './node'

root = nil
cur = nil
[10, 40, 53, 30, 67, 12, 89].each do |i|
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
r0 = root
r1 = nil
cur = root
while cur != nil && cur.next_node != nil
  t = cur.next_node
  cur.next_node = t.next_node

  t.next_node = r1
  r1 = t

  cur = cur.next_node
end

root = Node.new("mock")
cur = root
while r0 != nil && r1 != nil
  if r0.value < r1.value
    cur.next_node = r0
    r0 = r0.next_node
  else
    cur.next_node = r1
    r1 = r1.next_node
  end

  cur = cur.next_node
end

if r0 != nil
  cur.next_node = r0
end
if r1 != nil
  cur.next_node = r1
end

root = root.next_node
puts "After: #{root}"
