# Common operations of circular linked list

require './node'

def init_circular_linked_list
  CircularLinkedList.new([1,2,3,4,5,6,7,8])
end

list = init_circular_linked_list
puts "Before : #{list}"

rev = true
while value = rev ? list.pop : list.shift
  puts "#{rev ? "popped" : "shifted"} : #{value}"
  puts "L : #{list}"

  rev = !rev
end

