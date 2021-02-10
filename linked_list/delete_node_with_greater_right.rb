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

def process(root)
  root = reverse(root)
  max = root
  cur = root.next_node
  while cur != nil
    if cur.value < max.value
      max.next_node = cur.next_node
      cur = cur.next_node
    else
      max = cur
      cur = cur.next_node
    end
  end

  reverse(root)
end

root = process(root)
puts "After: #{root}"
