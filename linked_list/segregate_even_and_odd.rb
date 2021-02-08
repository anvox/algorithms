require './node'

root = nil
cur = nil
File.read('./tests/5.txt').split(" ").each do |i|
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
mock_e = Node.new("mocke", root)
last_e = mock_e

cur = root
prev = mock_e
while cur != nil
  if cur.value % 2 == 0
    if cur == last_e.next_node
      cur = cur.next_node
      prev = prev.next_node
      last_e = last_e.next_node
    else
      prev.next_node = cur.next_node
      t = last_e.next_node
      last_e.next_node = cur
      cur.next_node = t
      last_e = cur

      cur = prev.next_node
    end
  else
    cur = cur.next_node
    prev = prev.next_node
  end
end

root = mock_e.next_node
mock_e.next_node = nil
puts "Before: #{root}"
