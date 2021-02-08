# move last element

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

puts "Before: #{root}"

last_node = root.next_node
prev = root

if last_node != nil
  while last_node.next_node != nil
    last_node = last_node.next_node
    prev = prev.next_node
  end

  last_node.next_node = root
  prev.next_node = nil

  root = last_node
end

puts "After: #{root}"
