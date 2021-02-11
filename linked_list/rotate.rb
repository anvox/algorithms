require './node'

root = Node.new(1, Node.new(2, Node.new(3, Node.new(4, Node.new(5)))))
puts "Before: #{root}"

def process(root, k)
  return root if k == 0

  prev = root
  cur = root.next_node
  new_root = nil
  while cur != nil
    if k <= 1
      new_root = cur
      prev.next_node = nil
    end

    prev = cur
    cur = cur.next_node
    k -= 1
  end
  prev.next_node = root

  new_root
end

root = process(root, 4)
puts "After: #{root}"
