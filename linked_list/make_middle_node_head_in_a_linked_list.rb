# Make middle node head in a linked list

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

prev = pslow = pfast = Node.new('dummy', root)
while pfast != nil && pfast.next_node != nil
  prev = pslow
  pslow = pslow.next_node
  pfast = pfast.next_node.next_node
end

prev.next_node = pslow.next_node
pslow.next_node = root
root = pslow

puts "Before: #{root}"
