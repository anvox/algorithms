# move last element

require './node'

root = nil
curr = nil
File.read('./tests/5.txt').split(" ").each do |i|
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
ll1 = root

root = nil
curr = nil
File.read('./tests/6.txt').split(" ").each do |i|
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
ll2 = root

puts "#{ll1}"
puts "#{ll2}"

cur1 = ll1
cur2 = ll2
ll = nil
curll = nil
while cur1 != nil && cur2 != nil
  if cur1.value == cur2.value
    if ll.nil?
      ll = Node.new(cur1.value)
      curll = ll
    else
      curll.next_node = Node.new(cur1.value)
      curll = curll.next_node
    end

    cur1 = cur1.next_node
    cur2 = cur2.next_node
  elsif cur1.value > cur2.value
    cur2 = cur2.next_node
  elsif cur1.value < cur2.value
    cur1 = cur1.next_node
  end
end

puts "Intersection: #{ll}"
