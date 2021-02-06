# Remove duplicated value in sorted linked list

require './node'

def process(root_node)
end

root = nil
curr = nil
File.read('./tests/4.txt').split(" ").each do |i|
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

puts "Before: #{root}"

cursor = root
while cursor != nil
  if cursor.next_node && cursor.value == cursor.next_node.value
    c2 = cursor.next_node
    while c2 && c2.value == cursor.value
      c2 = c2.next_node
    end
    if c2
      cursor.next_node = c2
    else
      cursor.next_node = nil
    end
  end

  cursor = cursor.next_node
end

puts "After: #{root}"
