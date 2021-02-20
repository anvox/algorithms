# Find pair for given sum in a sorted singly linked without extra space

require './node'

root = nil
cur = nil
File.read('./tests/10.txt').split(" ").each do |i|
  node = CNode.new(i.to_i, nil, cur)
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
tail = cur

puts "Before: #{root}\nTail: #{tail.value}"

def process(root, tail, x)
  while tail.value > root.value
    # puts "[#{root.value}, #{tail.value}]"
    if tail.value + root.value == x
      puts "(#{root.value}, #{tail.value})"
      root = root.next_node
    elsif root.value + tail.value > x
      tail = tail.children
    else
      root = root.next_node
    end
  end
end

process(root, tail, 17)
