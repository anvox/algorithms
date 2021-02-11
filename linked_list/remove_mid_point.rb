require './node'

points = [
  {x: 0, y: 10},
  {x: 1, y: 10},
  {x: 5, y: 10},
  {x: 7, y: 10},
  {x: 7, y: 5},
  {x: 20, y: 5},
  {x: 40, y: 5},
]

root = Node.new("mock")
cur = root
points.each do |value|
  cur.next_node = Node.new(value)
  cur = cur.next_node
end
root = root.next_node

puts "Before: #{root}"
def same_line?(p0, p1, p2)
  (p0[:x] == p1[:x] && p1[:x] == p2[:x]) || (p0[:y] == p1[:y] && p1[:y] == p2[:y])
end

p0 = root
p1 = root.next_node.next_node
while p1 != nil
  if same_line?(p0.value, p0.next_node.value, p1.value)
    p0.next_node = p1
  else
    p0 = p0.next_node
  end

  p1 = p1.next_node
end

puts "After: #{root}"
