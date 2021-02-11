require './node'

root = CNode.new(5,
                 CNode.new(10,
                           CNode.new(19,
                                     CNode.new(28,
                                               nil,
                                               CNode.new(35, CNode.new(40, CNode.new(45)))),
                                     CNode.new(22, CNode.new(50))),
                           CNode.new(20)),
                 CNode.new(7, CNode.new(8, CNode.new(30))))
puts "Before: #{root}"

heads = [root]
cur = root
while cur != nil
  heads << cur.children

  cur = cur.next_node
end

flatten = Node.new("mock")
flatten_pointer = flatten
while true
  min = 0
  while heads[min].nil? && min < heads.size
    min += 1
  end
  break if heads[min].nil?

  heads.size.times do |i|
    next if heads[i].nil?

    if heads[i].value < heads[min].value
      min = i
    end
  end
  flatten_pointer.next_node = Node.new(heads[min].value)
  flatten_pointer = flatten_pointer.next_node
  heads[min] = heads[min].next_node
end

puts "After: #{flatten.next_node}"
