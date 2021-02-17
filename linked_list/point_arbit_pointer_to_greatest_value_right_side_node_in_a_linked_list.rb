# Point arbit pointer to greatest value right side node in a linked list

require './node'

root = nil
curr = nil
File.read('./tests/9.txt').split(" ").each do |i|
  node = CNode.new(i.to_i)
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
  prev = root
  cur = root.next_node
  while cur != nil
    t = cur.next_node
    cur.next_node = prev

    prev = cur
    cur = t
  end

  root.next_node = nil
  prev
end

def process(root)
  root = reverse(root)
  root.children = nil
  cur = root.next_node
  max = root
  while cur != nil
    cur.children = max
    if cur.value > max.value
      max = cur
    end

    cur = cur.next_node
  end

  reverse(root)
end
root = process(root)

puts "Before: #{root}"
