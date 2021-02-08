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
cur = root.next_node
root.next_node = nil
while cur != nil
  t = cur
  cur = cur.next_node

  t.next_node = root
  root = t
end

puts "After: #{root}"
