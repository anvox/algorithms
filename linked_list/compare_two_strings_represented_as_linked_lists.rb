# Compare two strings represented as linked lists

require './node'

root1 = Node.new("g", Node.new("e", Node.new("e", Node.new("k"))))
root2 = Node.new("g", Node.new("e", Node.new("e", Node.new("k", Node.new("b")))))

puts "1: #{root1}"
puts "2: #{root2}"

def process(root1, root2)
  p1 = root1
  p2 = root2
  while p1 != nil && p2 != nil
    if p1.value > p2.value
      return 1
    elsif p1.value < p2.value
      return -1
    end

    p1 = p1.next_node
    p2 = p2.next_node
  end

  return 1 if p1 != nil
  return -1 if p2 != nil

  return 0
end

result = process(root1, root2)
puts "Result: #{result}"
