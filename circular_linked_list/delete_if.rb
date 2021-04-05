# Walk through circle linked list and delete nodes satisfy block

require './node'

def init_circular_linked_list
  CircularLinkedList.new([4,5,6,7,8])
end

def process(list)
  list.delete_if do |node|
    node.value % 2 == 0
  end
end

list = init_circular_linked_list
puts "Before: #{list}"

list = process(list)
puts "After: #{list}"
