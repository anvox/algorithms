# Delete middle of linked list

require './node'

root = nil
cur = nil
stacks = []
File.read('./tests/1.txt').split(" ").each do |i|
  node = Node.new(i.to_i)
  stacks << node
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

pfast = root
pslow = root
prev = Node.new('dummy', root)
while pfast != nil && pfast.next_node != nil
  pfast = pfast.next_node.next_node
  pslow = pslow.next_node

  prev = prev.next_node
end

prev.next_node = prev.next_node.next_node

puts "After: #{root}"
