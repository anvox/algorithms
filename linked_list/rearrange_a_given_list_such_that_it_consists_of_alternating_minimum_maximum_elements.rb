# Rearrange a given list such that it consists of alternating minimum maximum elements
# Actualy, it's better to use double linked list

require './node'

root = nil
cur = nil
File.read('./tests/1.txt').split(" ").each do |i|
  node = Node.new(i.to_i)
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

puts "Before: #{root}"

def process(root)
  mock = Node.new("mock", root)
  s = 0
  cur = mock
  while cur.next_node != nil
    s += 1
    cur = cur.next_node
  end
  # Make the circle
  cur.next_node = root
  cur = root
  s -= 1
  while s >= 2
    next_cur = cur.next_node
    tail = cur
    s.times { tail = tail.next_node }
    cur.next_node = tail
    tail.next_node = next_cur

    cur = next_cur
    s -= 2
  end
  if s == 1
    cur.next_node.next_node = nil
  else # s == 0
    cur.next_node = nil
  end

  mock.next_node
end
root = process(root)
puts "After: #{root}"
