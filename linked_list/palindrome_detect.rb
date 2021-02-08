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

arr = [mid.value]

while cur.next_node != nil && cur.next_node.next_node != nil
  cur = cur.next_node.next_node
  mid = mid.next_node
  arr << mid.value
  mid_idx += 1
end

if cur.next_node == nil
  arr.pop
end

mid = mid.next_node
while mid != nil
  if arr.pop != mid.value
    break
  end

  mid = mid.next_node
end

puts root.to_s
if mid == nil
  puts "Palindrome"
else
  puts "No Palindrome"
end

