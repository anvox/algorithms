# Splitting starting N nodes into new Circular Linked List while preserving the old nodes

require './node'

def init_circular_linked_list
  CircularLinkedList.new([4,5,6,7,8,9,10])
end

list = init_circular_linked_list

puts "Before: #{list}"
new_list = list.split_n(4)


puts "After          list: #{list}"
puts "After splitted list: #{new_list}"
