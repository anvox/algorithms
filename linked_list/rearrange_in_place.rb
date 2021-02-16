require './node'

root = nil
curr = nil
File.read('./tests/1.txt').split(" ").each do |i|
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

def process(root)
  list = []
  cur = root
  while cur != nil
    list << cur
    cur = cur.next_node
  end

  root = list[0]
  i = 0
  j = list.size - 1
  while i <= j
    if i == j
      list[i].next_node = nil
    elsif list[i].next_node == list[j]
      list[j].next_node = nil
    else
      list[j].next_node = list[i].next_node
      list[i].next_node = list[j]
    end

    i += 1
    j -= 1
  end

  root
end

root = process(root)
puts "After: #{root}"
