# Common operations of circular linked list

require './node'

def init_circular_linked_list
  CircularLinkedList.new([0, 1,2,3,4,5,6,7,8])
end

def test_pop_shift
  list = init_circular_linked_list
  puts "Before : #{list}"

  rev = true
  while value = rev ? list.pop : list.shift
    puts "#{rev ? "popped" : "shifted"} : #{value}"
    puts "L : #{list}"

    rev = !rev
  end
end

def test_index(at_zero = false)
  list = init_circular_linked_list
  puts "Before : #{list}"
  l = list.length

  at = at_zero ? 0 : Random.rand(l + 1)
  puts "At #{at}: #{list.at(at).value}"

  v = Random.rand(1001)
  list.insert_at(at, v)
  puts "Inserted (#{v}) at [#{at}]: #{list}"

  node = list.remove_at(at)
  puts "Removed (#{node.value}) at [#{at}]: #{list}"
end

test_index
test_index(true)
