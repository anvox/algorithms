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
  if root_node.value == value1 || root_node.value == value2
    node2 = root_node
    while node2.next_node && (node2.next_node.value != value1 && node2.next_node.value != value2)
      node2 = node2.next_node
    end

    if node2.next_node == nil
      return nil
    else
      temp = node2.next_node

      tail = temp.next_node
      temp.next_node = root_node.next_node
      root_node.next_node = tail
      node2.next_node = root_node

      return temp
    end
  else
    pre_pointer = {}
    curr = root_node
    while curr.next_node && pre_pointer.size < 2
      if curr.next_node.value == value1 || curr.next_node.value == value2
        pre_pointer[curr.next_node.value] = curr
      end

      curr = curr.next_node
    end

    if pre_pointer.size < 2
      return nil
    else
      tail = pre_pointer[value1].next_node.next_node
      pre_pointer[value1].next_node.next_node = pre_pointer[value2].next_node.next_node
      pre_pointer[value2].next_node.next_node = tail

      mid = pre_pointer[value1].next_node
      pre_pointer[value1].next_node = pre_pointer[value2].next_node
      pre_pointer[value2].next_node = mid

      return root_node
    end
  end
end
root = process(root, 3, 10)

puts "After: #{root}"
