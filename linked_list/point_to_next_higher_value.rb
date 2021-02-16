require './node'

root = nil
curr = nil
File.read('./tests/3.txt').split(" ").each do |i|
  node = CNode.new(i.to_i)
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

def to_s_by_children(root)
  cur = root
  s = ""
  while cur != nil
    s += "#{cur.value}->"
    cur = cur.children
  end

  "#{s}NIL"
end

puts "Before: #{root}"
puts "Children: #{to_s_by_children(root)}"

def process(root)
  arr = []
  cur = root
  while cur != nil
    arr << cur
    cur = cur.next_node
  end
  # I know it's hack here but sort isn't this problem's target target
  arr.sort_by! {|node| node.value}
  (arr.size - 1).times do |i|
    arr[i].children = arr[i + 1]
  end

  arr[0]
end

root2 = process(root)
puts "After: #{root}"
puts "Children: #{to_s_by_children(root2)}"
