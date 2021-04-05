require './node'

def init_circular_linked_list
  CircularLinkedList.new([])
end

def process(list, arr)
  cur = list.root
  arr.each do |item|
    puts "Debug: #{list}"
    if cur == nil
      list.push(item)
      cur = list.root
    else
      while cur.value > item && item > cur.next_node.value
        cur = cur.next_node

        if cur.next_node.value < cur.value
          break
        end
      end

      if item > cur.value
        # tail
        list.push(item)
      elsif item < list.root.value
        # head
        list.unshift(item)
      else
        cur.next_node = Node.new(item, cur.next_node)
      end
    end
  end

  list
end

list = init_circular_linked_list
puts "Before: #{list}"

list = process(list, [12, 56, 2, 11, 1, 90])
puts "After: #{list}"

