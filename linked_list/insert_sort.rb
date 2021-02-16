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

result = Node.new("result")
cur = root
while cur != nil
  puts "#{cur.value} >> #{result}"
  result_pointer = result
  while result_pointer.next_node != nil && result_pointer.next_node.value < cur.value
    result_pointer = result_pointer.next_node
  end

  # Detach node
  t = cur
  cur = cur.next_node

  # Attach to new ll
  t.next_node = result_pointer.next_node
  result_pointer.next_node = t
end

puts "After: #{result.next_node}"
