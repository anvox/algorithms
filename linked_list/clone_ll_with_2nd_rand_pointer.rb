require './node'

root = nil
cur = nil
stacks = []
File.read('./tests/1.txt').split(" ").each do |i|
  node = CNode.new(i.to_i)
  stacks << node
  if root.nil?
    root = node
  end
  if cur.nil?
    cur = node
  else
    cur.next_node = node
    cur = node
  end
end

cur = root
while cur != nil
  cur.children = stacks.sample
  cur = cur.next_node
end

puts "Before: #{root}"

def intersect?(a, b)
  while a != nil && b != nil
    if a == b
      return true
    end

    a = a.next_node
    b = b.next_node
  end

  false
end

def clone_linked_list(root)
  # duplicate nodes
  cur = root
  while cur != nil
    odd_node = CNode.new(cur.value, cur.next_node, cur.children)
    cur.next_node = odd_node

    cur = odd_node.next_node
  end
  # re-pointing children
  cur = root
  while cur != nil
    odd_node = cur.next_node
    odd_node.children = odd_node.children.next_node

    cur = cur.next_node.next_node
  end
  # detach odd nodes
  cur = root
  root2 = CNode.new("mock")
  cur2 = root2
  while cur != nil
    odd_node = cur.next_node
    cur.next_node = cur.next_node.next_node
    cur = cur.next_node

    cur2.next_node = odd_node
    cur2 = odd_node
  end

  root2.next_node
end

root2 = clone_linked_list(root)
puts "Before: #{root2}"

if intersect?(root, root2)
  puts "Something wrong, 2 linked list intersect"
end
