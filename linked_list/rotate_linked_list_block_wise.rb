# Rotate Linked List block wise

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

def process(root, k, d)
  head = dummy = Node.new('dummy', root)
  cur = root

  while cur != nil
    l = 1
    (k - 1).times do
      break if cur.next_node == nil
      cur = cur.next_node
      l += 1
    end

    tail = cur.next_node
    cur.next_node = head.next_node

    r = if d < 0 # clock wise
      l + d
    else
      d
    end

    r.times { cur = cur.next_node }

    head.next_node = cur.next_node
    cur.next_node = tail

    head = cur
    cur = tail
  end

  dummy.next_node
end

puts "Before: #{root}"
root = process(root, 4, 1)
puts "After: #{root}"
