# Sort linked list which is already sorted on absolute values

require './node'

root = nil
curr = nil
[1,3,5,6,-7,-9,12,-15,-56].each do |i|
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

  cur = mock
  while cur.next_node != nil
    if cur.next_node.value < 0
      t = cur.next_node
      cur.next_node = t.next_node

      t.next_node = root
      root = t
    else
      cur = cur.next_node
    end
  end

  root
end

root = process(root)
puts "After: #{root}"
