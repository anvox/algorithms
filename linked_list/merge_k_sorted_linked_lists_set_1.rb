# Merge K sorted linked lists | Set 1
# Divide and Conquer: merging by pair
# Min Heap

require './node'

# Load k linked lists
def load_linked_list
  k = 10
  n =20
  k.times.map {
    root = Node.new("root")
    cur = root
    20.times.map { Random.rand(100) }.sort.each do |v|
      cur.next_node = Node.new(v)
      cur = cur.next_node
    end

    root.next_node
  }
end

def merge(a, b)
  p0 = a
  p1 = b

  while p0 != nil && p1 != nil
    if p0.value > p1.value
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
    a
  end
  b
end

def merge_sort(linked_lists)
  while linked_lists.size > 1
    p0 = linked_lists.shift
    p1 = linked_lists.shift

    pmerged = merge(p0, p1)
    linked_lists << pmerged
  end

  linked_lists[0]
end

def heap_sort(linked_lists)
  nil
end

# Main
def process(linked_lists)
  merge_sort(linked_lists)
end

puts "Before:"
linked_lists = load_linked_list
linked_lists.each do |ll|
  puts "#{ll}"
end

root = process(linked_lists)
puts "After:\n#{root}"
