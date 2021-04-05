# Walk through circle linked list and delete nodes satisfy block
#
# Remove all the Even Digit Sum Nodes from a Circular Singly Linked List
# Remove all even parity nodes from a Doubly and Circular Singly Linked List
#
require './node'

def init_circular_linked_list
  CircularLinkedList.new([9, 11, 34, 6, 13, 21 ])
end

def is_even_digit_sum?(num)
  rem = 0
  while num > 0
    rem += num % 10
    num /= 10
  end

  rem % 2 == 0
end

def is_even_parity?(num)
  rem = 0
  while num > 0
    rem += num % 2
    num /= 2
  end

  rem % 2 == 0
end

def process(list)
  list.delete_if do |node|
    is_even_parity?(node.value)
  end
end

list = init_circular_linked_list
puts "Before: #{list}"

list = process(list)
puts "After: #{list}"
