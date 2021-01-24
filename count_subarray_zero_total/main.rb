def process(arr)
  collected_sum = {}
  collected_sum[0] = [0]

  (1..(arr.length - 1)).each do |i|
    sum = arr[0..i].sum
    collected_sum[sum] ||= []
    collected_sum[sum] << i
  end

  counter = 0
  collected_sum.each do |_, ranges|
    next if ranges.size <= 1
    ranges.each do |i|
      ranges.each do |j|
        next if (i + 1) >= j

        puts "(#{i},#{j})"
        counter += 1
      end
    end
  end

  puts counter
end

process([1,-2,3,0,-2,2])
