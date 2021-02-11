require './node'

root = CNode.new(10, CNode.new(5, CNode.new(12, CNode.new(7, CNode.new(11),
                                                          CNode.new(17, CNode.new(6),
                                                                    CNode.new(9, CNode.new(8),
                                                                              CNode.new(19, CNode.new(15))))))),
                 CNode.new(4, CNode.new(20, CNode.new(13, nil,
                                                      CNode.new(16, nil,
                                                                CNode.new(3))),
                                        CNode.new(2))))
puts "Before: #{root}"

def process(root)
  stacks = []
  cur = root
  flatten = Node.new("mock")
  flatten_pointer = flatten
  while cur != nil
    if cur.children
      stacks << cur.children
    end

    flatten_pointer.next_node = Node.new(cur.value)
    flatten_pointer = flatten_pointer.next_node
    cur = cur.next_node
    if cur == nil
      cur = stacks.shift
    end
  end

  flatten.next_node
end

root = process(root)
puts "After: #{root}"
