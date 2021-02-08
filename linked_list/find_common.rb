require './node'

a = Node.new(1, Node.new(2, Node.new(3)))
b = Node.new(4, Node.new(5, a))
c = Node.new(6, Node.new(7, Node.new(8, Node.new(9, a))))

b_size = 0
pointer_b = b

c_size = 0
pointer_c = c
while pointer_b != nil || pointer_c != nil
  if pointer_b != nil
    pointer_b = pointer_b.next_node
    b_size += 1
  end

  if pointer_c != nil
    pointer_c = pointer_c.next_node
    c_size += 1
  end
end

diff = 0
long_link, short_link = if b_size > c_size
  diff = b_size - c_size
  [b, c]
else
  diff = c_size - b_size
  [c, b]
end

diff.times do
  puts "long=#{long_link.value}"
  long_link = long_link.next_node
end

while long_link != short_link && long_link != nil && short_link != nil
  puts "long=#{long_link.value}, short=#{short_link.value}"

  long_link = long_link.next_node
  short_link = short_link.next_node
end

if long_link == short_link
  puts "Common: #{long_link.value}"
else
  puts "No Common"
end
