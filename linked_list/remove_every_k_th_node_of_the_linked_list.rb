# Remove every k-th node of the linked list

require './node'

root = nil
curr = nil
File.read('./tests/2.txt').split(" ").each do |i|
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

def process(root, k)
  prev = mock = Node.new("root", root)
  while prev != nil && prev.next_node != nil
    (k - 1).times do
      prev = prev.next_node
      break if prev == nil
    end
    break if prev == nil || prev.next_node == nil

    prev.next_node = prev.next_node.next_node
  end

  mock.next_node
end

root = process(root, 3)
puts "After: #{root}"
