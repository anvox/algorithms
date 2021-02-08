require './node'

a = Node.new(1, Node.new(2, Node.new(3)))
b = Node.new(4, Node.new(5, a))
c = Node.new(6, Node.new(7, Node.new(8, Node.new(9, a))))

h = {}
cur = b
while cur != nil
  h[cur] = 1
  cur = cur.next_node
end

cur = c
while cur != nil && h[cur] == nil
  cur = cur.next_node
end

puts "Common node: #{cur}"
