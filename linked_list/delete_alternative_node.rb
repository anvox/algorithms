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

def process(root)
  cur = root
  while cur != nil && cur.next_node != nil
    cur.next_node = cur.next_node.next_node
    cur = cur.next_node
  end

  root
end

root = process(root)
puts "After: #{root}"
