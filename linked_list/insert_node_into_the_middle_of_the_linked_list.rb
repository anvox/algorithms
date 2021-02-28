# Insert node into the middle of the linked list

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

def process(root, x)
  pfast = pslow = Node.new('dummy', root)
  while pfast != nil && pfast.next_node != nil
    pfast = pfast.next_node.next_node
    pslow = pslow.next_node
  end

  pslow.next_node = Node.new(x, pslow.next_node)

  root
end
root = process(root, 10)

puts "After: #{root}"
