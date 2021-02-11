require './node'

root = nil
curr = nil
File.read('./tests/7.txt').split(" ").each do |i|
  node = Node.new(i.to_i)
  if root.nil?
    root = node
  end
  if curr.nil?
    curr = node
  else
    curr.next_node = node
    curr = node
  end
end

puts "before: #{root}"

def process(root)
  cur = root
  even = nil
  odd = nil
  while cur != nil
    t = cur
    cur = cur.next_node

    if t.value % 2 == 0
      t.next_node = even
      even = t
    else
      t.next_node = odd
      odd = t
    end
  end
  root = nil
  last_node = nil
  flag = 1
  while even != nil && odd != nil
    t = even
    if flag % 2 == 1
      t = odd
      odd = odd.next_node
    else
      even = even.next_node
    end

    flag = (flag + 1) % 2

    t.next_node = root
    last_node ||= t
    root = t
  end
  if even != nil
    last_node.next_node = even
  elsif odd != nil
    last_node.next_node = odd
  end

  root
end

root = process(root)

puts "After: #{root}"
