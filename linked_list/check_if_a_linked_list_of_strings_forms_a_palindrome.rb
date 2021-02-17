# Check if a linked list of strings forms a palindrome
require './node'

a = Node.new("a", Node.new("bc", Node.new("d", Node.new("dcb", Node.new("a")))))
b = Node.new("a", Node.new("bc", Node.new("d", Node.new("ba"))))

s = ""
rs = ""
cur = b
while cur != nil
  s = "#{s}#{cur.value}"
  rs = "#{cur.value.reverse}#{rs}"

  cur = cur.next_node
end

puts "After: #{s} #{s == rs ? "==" : "!="} #{rs}"
