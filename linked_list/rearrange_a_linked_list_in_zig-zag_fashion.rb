# Rearrange a Linked List in Zig-Zag fashion
require './node'

root = nil
curr = nil
File.read('./tests/8.txt').split(" ").each do |i|
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

def swap(node0, node1)
  t = node0.value
  node0.value = node1.value
  node1.value = t
end

def process(root)
  prev = Node.new("mock", root)
  cur = root
  flag = 0
  while cur != nil && cur.next_node != nil
    if flag == 0 && cur.value > cur.next_node.value
      prev.next_node = cur.next_node
      cur.next_node = cur.next_node.next_node
      prev.next_node.next_node = cur
    elsif flag == 1 && cur.value < cur.next_node.value
      prev.next_node = cur.next_node
      cur.next_node = cur.next_node.next_node
      prev.next_node.next_node = cur
    else
      cur = cur.next_node
    end

    prev = prev.next_node
    flag = (flag + 1) % 2
  end

  root
end

root = process(root)
puts "After: #{root}"
