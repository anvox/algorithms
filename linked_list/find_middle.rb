# require 'pry-byebug'

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

cur = root
cur_idx = 1
mid = root
mid_idx = 1
while cur.next_node != nil
  puts "[#{cur_idx}]=(#{cur.value})"

  cur = cur.next_node
  cur_idx += 1

  if (cur_idx / 2) > mid_idx
    mid = mid.next_node
    mid_idx += 1
  end
end

puts "Middle item is (#{mid.value}) at [#{mid_idx}]"
