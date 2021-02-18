# Check linked list with a loop is palindrome or not

require './node'

a = Node.new(3)
b = Node.new(2, Node.new(3, Node.new(1, a)))
a.next_node = b
root = Node.new(1, a)

cur = root
arr = []
while cur != nil
  break if arr.include?(cur)

  arr << cur
  cur = cur.next_node
end

arr = arr.map {|node| node.value }

puts "Before: #{arr}"
l = arr.size / 2
i = 0
while i < l
  break if arr[i] != arr[-i - 1]
  i += 1
end

if i >= l
  puts "Palindrome"
else
  puts "Not Palindrome"
end
