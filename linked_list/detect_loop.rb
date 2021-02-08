require './node'

root = nil
curr = nil
File.read('./tests/1.txt').split(" ").each do |i|
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

# Create loop
curr.next_node = root.next_node

curr = root
i = 0
while curr.next_node != nil && i < 30
  curr = curr.next_node
  i += 1
end

if curr.next_node != nil
  puts "May be loop"
end

# Detect
map = {}
curr = root
map[curr.object_id] = 1
while curr.next_node != nil
  if map[curr.next_node.object_id].nil?
    map[curr.next_node.object_id] = 1
  else
    puts "Looped at (#{curr.value})"
    break
  end

  curr = curr.next_node
end
