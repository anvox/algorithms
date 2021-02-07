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

def process(root_node, value1, value2)
  pre_pointers = {}
  curr_pointers = {}

  prev_node = nil
  curr = root_node
  while curr
    if curr.value == value1 || curr.value == value2
      pre_pointers[curr.value] = prev_node
      curr_pointers[curr.value] = curr
    end

    prev_node = curr
    curr = curr.next_node
  end

  if curr_pointers.size < 2
    return nil
  else
    tail = curr_pointers[value1].next_node
    curr_pointers[value1].next_node = curr_pointers[value2].next_node
    curr_pointers[value2].next_node = tail

    if pre_pointers[value1]
      pre_pointers[value1].next_node = curr_pointers[value2]
    else
      root_node = curr_pointers[value2]
    end
    if pre_pointers[value2]
      pre_pointers[value2].next_node = curr_pointers[value1]
    else
      root_node = curr_pointers[value1]
    end

    return root_node
  end
end
root = process(root, 3, 7)

puts "After: #{root}"
