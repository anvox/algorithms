def process(input_arr)
  i = 0
  j = 1
  arr = input_arr
  while i < arr.length - 1 && j < arr.length
    if arr[i] > arr[j]
      t = arr[i]
      arr[i] = arr[j]
      arr[j] = t
    end

    j += 1
    if j >= arr.length
      i += 1
      j = i + 1
    end
  end

  arr
end


arr = File.read('./tests/1.txt').split(" ").map(&:to_i)
puts process(arr)
