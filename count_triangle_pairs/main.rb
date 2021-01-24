def process(arr)
  arr = arr.sort

  count = 0
  arr[1..-2].each do |i|
    if arr[0] + i > arr[-1]
      count += i - 1
    end
  end

  puts count
end

process([2,5,3,4])
