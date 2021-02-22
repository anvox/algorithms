# Multiply two numbers represented by Linked Lists

require './node'

a = Node.new(9, Node.new(4, Node.new(6)))
b = Node.new(8, Node.new(4))

puts "A: #{a}"
puts "B: #{b}"

mul = 0
pa = a
while pa != nil
  pb = b
  sub_mul = 0
  while pb != nil
    sub_mul = sub_mul * 10 + pa.value * pb.value
    pb = pb.next_node
  end
  mul = mul * 10 + sub_mul

  pa = pa.next_node
end

puts "Mul: #{mul}"
