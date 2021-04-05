# Modify a Circular Doubly Linked List such that
#   each node stores the sum of all nodes except itself

require './node'

def init_circular_linked_list
  CircularLinkedList.new([4,5,6,7,8])
end

def process(list)
  cur = root = list.root
  sum = 0
  while true
    sum += cur.value

    cur = cur.next_node
    break if cur == root
  end

  while true
    cur.update(sum - cur.value)

    cur = cur.next_node
    break if cur == root
  end

  list
end

list = init_circular_linked_list
puts "Before: #{list}"

list = process(list)
puts "After: #{list}"
