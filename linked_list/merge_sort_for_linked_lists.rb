# Merge Sort for Linked Lists

require './node'

root = nil
curr = nil
File.read('./tests/9.txt').split(" ").each do |i|
  node = Node.new(i.to_i)
  if root.nil?
    root = node
  end
  if curr.nil?
    curr = node
  else
    curr.next_node = node
    curr = node
  end
end

puts "Before: #{root}"

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

def process(root)
  sort(root)
end

root = process(root)
puts "After: #{root}"
