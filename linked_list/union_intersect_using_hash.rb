# Union and Intersection of two Linked Lists
# Using megre sort and hash

require './node'

a = Node.new(10 ,Node.new(15 ,Node.new(4 ,Node.new(20))))
b = Node.new(8 ,Node.new(4 ,Node.new(2 ,Node.new(10))))

def process(a, b)
  pa = a
  pb = b
  collector = {}
  while pa != nil
    collector[pa.value] = 1

    pa = pa.next_node
  end

  while pb != nil
    if collector[pb.value]
      collector[pb.value] = 2
    else
      collector[pb.value] = 1
    end

    pb = pb.next_node
  end

  punion = union = Node.new('union')
  pintersect = intersect = Node.new('intersect')
  collector.each do |value, count|
    punion.next_node = Node.new(value)
    punion = punion.next_node

    if count == 2
      pintersect.next_node = Node.new(value)
      pintersect = pintersect.next_node
    end
  end

  [union.next_node, intersect.next_node]
end

puts "Before A: #{a}"
puts "Before B: #{b}"

a, b = process(a, b)
puts "Union: #{a}"
puts "Intersect: #{b}"
