# Partitioning a linked list around a given value and keeping the original order

require './node'

root = nil
cur = nil
File.read('./tests/3.txt').split(" ").each do |i|
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

def process(root, x)
  p_head = head = Node.new("head")
  p_mid  = mid  = Node.new("mid")
  p_tail = tail = Node.new("tail")

  cur = root
  while cur != nil
    if cur.value < x
      p_head.next_node = cur
      cur = cur.next_node
      p_head = p_head.next_node
      p_head.next_node = nil
    elsif cur.value > x
      p_tail.next_node = cur
      cur = cur.next_node
      p_tail = p_tail.next_node
      p_tail.next_node = nil
    else
      p_mid.next_node = cur
      cur = cur.next_node
      p_mid = p_mid.next_node
      p_mid.next_node = nil
    end
  end

  p_head.next_node = mid.next_node
  p_mid.next_node = tail.next_node

  head.next_node
end

root = process(root, 4)

puts "After: #{root}"
