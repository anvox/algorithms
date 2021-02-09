require 'pry-byebug'
require './node'

def load_ll
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

  root
end

def reverse_group_link(root, group_size)
  mock_root = Node.new("mock", root)
  block_prev = prev = mock_root
  cur = root
  while true
    group_size.times do
      break if cur == nil

      next_cur = cur.next_node
      cur.next_node = prev
      prev = cur
      cur = next_cur
    end
    last_node_of_block = block_prev.next_node
    first_node_of_block = prev

    block_prev.next_node = first_node_of_block
    block_prev = last_node_of_block

    last_node_of_block.next_node = cur

    prev = last_node_of_block

    break if cur == nil
  end

  mock_root.next_node
end

def reverse_group_stack(root, group_size)
  reversed_root = Node.new("mock")
  reversed_cur = reversed_root

  cur = root
  stack = []
  while cur != nil
    stack << cur
    cur = cur.next_node

    if stack.size >= group_size || cur == nil
      while stack.size > 0
        reversed_cur.next_node = stack.pop
        reversed_cur = reversed_cur.next_node
      end

      reversed_cur.next_node = nil
    end
  end

  reversed_root.next_node
end

def reverse_alternative_group(root, group_size)
  reversed_root = Node.new("mock")
  reversed_cur = reversed_root

  cur = root
  stack = []
  flag = 1
  while cur != nil
    stack << cur
    cur = cur.next_node

    if stack.size >= group_size || cur == nil
      while stack.size > 0
        reversed_cur.next_node = flag % 2 == 1 ? stack.pop : stack.shift
        reversed_cur = reversed_cur.next_node
      end

      flag = (flag + 1) % 2
      reversed_cur.next_node = nil
    end
  end

  reversed_root.next_node
end

root = load_ll
puts "Before: #{root}"
root = reverse_group_link(root, 3)
puts "After: #{root}"

root = load_ll
puts "Before: #{root}"
root = reverse_group_stack(root, 3)
puts "After: #{root}"

root = load_ll
puts "Before: #{root}"
root = reverse_alternative_group(root, 3)
puts "After: #{root}"
