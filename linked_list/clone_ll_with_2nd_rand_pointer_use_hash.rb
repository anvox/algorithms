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
  cur = root
  dup_stacks = {}
  while cur != nil
    node = CNode.new(cur.value, cur.next_node, cur.children)
    dup_stacks[cur] = node

    cur = cur.next_node
  end

  dup_stacks.values.each do |node|
    node.next_node = dup_stacks[node.next_node]
    node.children = dup_stacks[node.children]
  end

  dup_stacks[root]
end

root2 = clone_linked_list(root)
puts "Before: #{root2}"

if intersect?(root, root2)
  puts "Something wrong, 2 linked list intersect"
end
