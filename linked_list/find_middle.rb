# require 'pry-byebug'

require './node'

root = nil
curr = nil
File.read('./tests/3.txt').split(" ").each do |i|
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

cur = root
mid = root
mid_idx = 0

while cur.next_node != nil
  if cur.next_node.next_node != nil
    cur = cur.next_node.next_node
    mid = mid.next_node

    mid_idx += 1
  else
    break
  end
end

puts root
puts "Middle item is (#{mid.value}) at [#{mid_idx}]"

