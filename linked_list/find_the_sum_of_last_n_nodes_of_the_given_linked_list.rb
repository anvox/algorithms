# Find the sum of last n nodes of the given Linked List

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

def process(root, n)
  count = 0
  cur = root
  while cur != nil
    count += 1
    cur = cur.next_node
  end

  cur = root
  if count > n
    (count - n).times { cur = cur.next_node }
  end

  count = 0
  while cur != nil
    count += cur.value
    cur = cur.next_node
  end

  count
end

puts "After: #{process(root, 3)}"
