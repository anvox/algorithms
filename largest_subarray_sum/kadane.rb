arr = [-2, -3, 4, -1, -2, 1, 5, -3]

def process(arr)
  max_so_far = 0
  max_ending_here = 0

  arr.each do |value|
    puts "max_so_far: #{max_so_far}, max_ending_here: #{max_ending_here}, value: #{value}"
    max_ending_here = max_ending_here + value
    if max_ending_here < 0
      max_ending_here = 0
    end
    if max_so_far < max_ending_here
      max_so_far = max_ending_here
    end
  end

  max_so_far
end

puts "Before: #{arr}"
puts "After : #{process(arr)}"
