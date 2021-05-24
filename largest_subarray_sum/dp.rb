arr = [-2, -3, 4, -1, -2, 1, 5, -3]

def process(arr)
  dp = [arr[0]]

  arr[1..].each_with_index do |value, index|
    dp[index + 1] = [dp[index] + arr[index + 1], arr[index + 1]].max
  end

  dp.max
end

puts "Before: #{arr}"
puts "After : #{process(arr)}"
