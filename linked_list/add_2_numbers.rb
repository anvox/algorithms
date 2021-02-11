require './node'

a = Node.new(5, Node.new(2, Node.new(4)))
b = Node.new(6, Node.new(7, Node.new(8, Node.new(9, Node.new(9)))))

puts "A=#{a}"
puts "B=#{b}"

def add(root_a, root_b)
  root = Node.new("-1")
  cur = root
  rem = 0
  while root_a != nil || root_b != nil || rem != 0
    value = (root_a != nil ? root_a.value : 0) +
      (root_b != nil ? root_b.value : 0) +
      rem
    rem = value / 10

    cur.next_node = Node.new(value % 10)
    cur = cur.next_node

    root_a = root_a.next_node if root_a != nil
    root_b = root_b.next_node if root_b != nil
  end

  root.next_node
end

def len(root)
  i = 1
  cur = root
  while cur != nil
    i += 1
    cur = cur.next_node
  end

  i
end

def rsum(a, b)
  if a.next_node == nil # && b.next_node == nil
    value = a.value + b.value
    return [value / 10, Node.new(value % 10)]
  else
    rem, prev = rsum(a.next_node, b.next_node)
    value = a.value + b.value + rem

    return [value / 10, Node.new(value % 10, prev)]
  end
end

def add_remain(start_node, diff, remain, tail)
  if diff == 0
    value = start_node.value + remain
    return [value / 10, Node.new(value % 10, tail)]
  else
    remain, tail = add_remain(start_node.next_node, diff - 1, remain, tail)
    value = start_node.value + remain
    return [value / 10, Node.new(value % 10, tail)]
  end
end

def human_add(root_a, root_b)
  la = len(root_a)
  lb = len(root_b)

  longer = nil
  diff = 0

  pa = root_a
  pb = root_b

  if la > lb
    diff = la - lb
    diff.times { pa = pa.next_node }
    longer = root_a
  elsif lb > la
    diff = lb - la
    diff.times { pb = pb.next_node }
    longer = root_b
  end

  rem, root = rsum(pa, pb)

  rem, root = add_remain(longer, diff - 1, rem, root)
  if rem != 0
    root = Node.new(rem, root)
  end

  root
end

sum = add(a, b)
puts "Sum=#{sum}"

sum = human_add(a, b)
puts "Human Sum=#{sum}"
