require './node'

a = Node.new(12, Node.new(6, Node.new(29)))
b = Node.new(23, Node.new(5, Node.new(18)))
c = Node.new(90, Node.new(20, Node.new(59)))

expected = 101

sum_map = {}
pointer_a = a
pointer_b = b

while pointer_a != nil && pointer_b != nil
  sum_map[pointer_a.value + pointer_b.value] ||= []
  sum_map[pointer_a.value + pointer_b.value] << [pointer_a.value, pointer_b.value]

  pointer_b = pointer_b.next_node
  if pointer_b == nil
    pointer_a = pointer_a.next_node
    pointer_b = b
  end
end

sup_c = []
pointer_c = c
while pointer_c != nil
  sup_c << expected - pointer_c.value

  pointer_c = pointer_c.next_node
end
sup_c.each do |i|
  if sum_map[i]
    sum_map[i].each do |va, vb|
      vc = expected - va -vb
      puts "(#{va}, #{vb}, #{vc})"
    end
  end
end
