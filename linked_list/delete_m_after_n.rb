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

def process(root, m, n)
  mock = Node.new("mock", root)
  cur = mock
  n.times do
    cur = cur.next_node
    break if cur == nil
  end
  return root if cur == nil || cur.next_node == nil

  tail = cur
  cur = cur.next_node
  m.times do
    cur = cur.next_node
    break if cur == nil
  end
  if cur == nil
    tail.next_node = nil
  else
    tail.next_node = cur
  end

  return mock.next_node
end
root = process(root, 3, 0)

puts "After: #{root}"
