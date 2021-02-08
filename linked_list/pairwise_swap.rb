# swap 2 node

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

def process(root_node)
  pre_node = nil
  pairs = [root_node, root_node.next_node]
  while pairs[0] && pairs[1]
    pairs[0].next_node = pairs[1].next_node
    pairs[1].next_node = pairs[0]

    if pre_node == nil
      root_node = pairs[1]
    else
      pre_node.next_node = pairs[1]
    end

    pre_node = pairs[0]
    pairs = [pre_node.next_node]
    if pairs[0]
      pairs << pairs[0].next_node
    end
  end

  root_node
end
root = process(root)

puts "After: #{root}"
