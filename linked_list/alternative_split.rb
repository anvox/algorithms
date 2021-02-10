# swap 2 node
require 'pry-byebug'
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

puts "Before: #{root}"

def process(root)
  tail_odd = head_odd = nil
  tail_even = head_even = nil

  cur = root
  flag = 0
  while cur != nil
    t = cur
    cur = cur.next_node
    t.next_node = nil

    if flag % 2 == 0
      head_even ||= t
      if tail_even == nil
        tail_even = t
      else
        tail_even.next_node = t
        tail_even = t
      end
    else
      head_odd ||= t
      if tail_odd == nil
        tail_odd = t
      else
        tail_odd.next_node = t
        tail_odd = t
      end
    end

    flag =  (flag + 1) % 2
  end

  [head_even, head_odd]
end

def process_using_circle(root)
  odd = nil
  even = nil

  cur = root
  flag = 0
  while cur != nil
    t = cur
    cur = cur.next_node

    if flag % 2 == 0
      if even == nil
        even = t
        even.next_node = even
      else
        t.next_node = even.next_node
        even.next_node = t

        even = t
      end
    else
      if odd == nil # 0 -> 1
        odd = t
        odd.next_node = odd
      else
        t.next_node = odd.next_node
        odd.next_node = t

        odd = t
      end
    end

    flag =  (flag + 1) % 2
  end

  [even.next_node, odd.next_node].tap do
    even.next_node = nil
    odd.next_node = nil
  end
end

root_even, root_odd = process_using_circle(root)

puts "After: even: #{root_even}\nAfter: odd: #{root_odd}"
