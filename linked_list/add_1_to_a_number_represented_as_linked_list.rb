# Add 1 to a number represented as linked list

require './node'

root = MNode.new(9, MNode.new(9, MNode.new(9, MNode.new(9))))

puts "Before: #{root}"

def r(node)
  if node.next_node == nil
    value = node.value + 1
  else
    value = node.value + r(node.next_node)
  end

  node.value = value % 10
  carry = value / 10

  carry
end

def process(root)
  carry = r(root)
  if carry != 0
    Node.new(carry, root)
  else
    root
  end
end
root = process(root)

puts "After: #{root}"
