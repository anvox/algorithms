class Node
  def initialize(value, next_node = nil)
    @value = value
    @next_node = next_node
  end

  attr_reader :value
  attr_accessor :next_node
end

root = nil
curr = nil
File.read('./tests/2.txt').split(" ").each do |i|
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

# Create loop
curr.next_node = root.next_node

curr = root
i = 0
while curr.next_node != nil && i < 30
  curr = curr.next_node
  i += 1
end

if curr.next_node != nil
  puts "May be loop"
end

# Detect
slow = root
fast = root
while fast.next_node != nil && fast.next_node.next_node != nil
  puts "slow=#{slow.value}, fast=#{fast.value}"
  slow = slow.next_node
  fast = fast.next_node.next_node

  if slow == fast
    break
  end
end

if fast.next_node.nil? || fast.next_node.next_node.nil?
  puts "No loop"
elsif slow == fast
  puts "Looped at (#{slow.value})"
else
  puts '?????'
end
