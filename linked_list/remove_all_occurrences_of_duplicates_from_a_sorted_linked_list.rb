# Remove all occurrences of duplicates from a sorted Linked List

require './node'

root = nil
curr = nil
File.read('./tests/12.txt').split(" ").each do |i|
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

def process(root)
  mock = Node.new("root", root)
  prev = mock
  while prev.next_node != nil
    cur = prev.next_node
    counter = 0
    while cur != nil && cur.value == prev.next_node.value
      counter += 1
      cur = cur.next_node
    end

    if counter > 1
      prev.next_node.next_node = cur
    end

    prev = prev.next_node
  end

  mock.next_node
end

root = process(root)
puts "After: #{root}"
