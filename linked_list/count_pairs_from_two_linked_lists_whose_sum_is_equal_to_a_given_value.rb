# Count pairs from two linked lists whose sum is equal to a given value

require './node'

a = Node.new(4, Node.new(3, Node.new(5, Node.new(7, Node.new(11, Node.new(2, Node.new(1)))))))
b = Node.new(2, Node.new(3, Node.new(4, Node.new(5, Node.new(6, Node.new(8, Node.new(12)))))))

puts "A: #{a}"
puts "B: #{b}"

def process(a, b, x)
  h = {}
  count = 0
  cur = a
  while cur != nil
    h[x - cur.value] ||= []
    h[x - cur.value] << cur

    cur = cur.next_node
  end
  cur = b
  while cur != nil
    if h[cur.value]
      count += h[cur.value].size
      h[cur.value].each { |aitem| puts "(#{cur.value}, #{aitem.value})" }
    end

    cur = cur.next_node
  end

  count
end

puts "Result: #{process(a, b, 9)}"
