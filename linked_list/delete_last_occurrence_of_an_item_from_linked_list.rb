# Delete last occurrence of an item from linked list

require './node'

def reverse(root)
  stack = []
  cur = root
  while cur != nil
    stack << cur
    cur = cur.next_node
  end

  root = stack[-1]
  while stack.size > 0
    t = stack.pop
    t.next_node = stack[-1]
  end

  root
end

root = nil
curr = nil
File.read('./tests/3.txt').split(" ").each do |i|
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

def process(root, value)
  root = Node.new("root", reverse(root))
  prev = nil
  cur = root
  while cur != nil && cur.next_node != nil
    if cur.next_node.value == value
      if prev == nil
        prev = cur
      else
        prev.next_node = prev.next_node.next_node
        break
      end
    end

    cur = cur.next_node
  end

  reverse(root.next_node)
end

root = process(root, 7)
puts "After: #{root}"
