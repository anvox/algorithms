# Union and Intersection of two Linked Lists
# Using megre sort and hash

require './node'

a = Node.new(10 ,Node.new(15 ,Node.new(4 ,Node.new(20))))
b = Node.new(8 ,Node.new(4 ,Node.new(2 ,Node.new(10))))

def sort(a)
  if a == nil || a.next_node == nil
    return a
  elsif a.next_node.next_node == nil
    b = a.next_node
    if a.value > b.value
      a.next_node = b.next_node
      b.next_node = a

      return b
    end

    return a
  else # divide into 2 linked lists
    pfast = a
    pslow = a
    while pfast != nil && pfast.next_node != nil
      pfast = pfast.next_node.next_node
      pslow = pslow.next_node
    end

    b = pslow.next_node
    pslow.next_node = nil
    return merge(sort(a), sort(b))
  end
end

# Merge 2 sorted linkedlist
def merge(a, b)
  p0 = a
  p1 = b
  while p0 != nil && p1 != nil
    if p1.value < p0.value
      t = p0
      p0 = p1
      p1 = t
    end

    if p0.next_node != nil && p0.next_node.value < p1.value
      p0 = p0.next_node
    else
      t = p0.next_node
      p0.next_node = p1
      p0 = t
    end
  end

  if a.value < b.value
    return a
  end
  return b
end

def process(a, b)
  a = sort(a)
  b = sort(b)

  pa = a
  pb = b
  punion = union = Node.new('union')
  pintersect = intersect = Node.new('intersect')
  while pa != nil && pb != nil
    if pa.value == pb.value
      pintersect.next_node = Node.new(pb.value)
      pintersect = pintersect.next_node

      punion.next_node = Node.new(pa.value)
      punion = punion.next_node

      pa = pa.next_node
      pb = pb.next_node
    elsif pa.value > pb.value
      punion.next_node = Node.new(pb.value)
      punion = punion.next_node

      pb = pb.next_node
    else # if pa.value < pb.value
      punion.next_node = Node.new(pb.value)
      punion = punion.next_node

      pa = pa.next_node
    end
  end

  while pa != nil
    punion.next_node = Node.new(pa.value)
    punion = punion.next_node

    pa = pa.next_node
  end

  while pb != nil
    punion.next_node = Node.new(pb.value)
    punion = punion.next_node

    pb = pb.next_node
  end

  [union.next_node, intersect.next_node]
end

puts "Before A: #{a}"
puts "Before B: #{b}"

a, b = process(a, b)
puts "Union: #{a}"
puts "Intersect: #{b}"
