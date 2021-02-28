# Length of longest palindrome list in a linked list using O(1) extra space

require './node'

root = nil
curr = nil
File.read('./tests/11.txt').split(" ").each do |i|
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

def reverse(root)
  prev = nil
  cur = root
  max = 0
  while cur != nil
    # Check palindrome, even length
    p0 = prev
    p1 = cur
    counter = 0
    while p0 != nil && p1 != nil && p0.value == p1.value
      counter += 2
      p0 = p0.next_node
      p1 = p1.next_node
    end
    max = [max, counter].max
    # Check palindrome, odd length
    p0 = prev
    p1 = cur.next_node
    counter = 1
    while p0 != nil && p1 != nil && p0.value == p1.value
      counter += 2
      p0 = p0.next_node
      p1 = p1.next_node
    end
    max = [max, counter].max
    # Move pointer
    t = cur.next_node
    cur.next_node = prev

    prev = cur
    cur = t
  end

  max
end

root = reverse(root)
puts "After: #{root}"
