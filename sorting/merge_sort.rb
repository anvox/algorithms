def merge(left, right)
  merged = []
  while left.size > 0 && right.size > 0
    if left[0] < right[0]
      merged << left[0]
      left.shift
    else
      merged << right[0]
      right.shift
    end
  end

  return merged.concat(left).concat(right)
end

def merge_sort(arr)
  if arr.size <= 1
    return arr
  elsif arr.size == 2
    if arr[0] > arr[1]
      return [arr[1], arr[0]]
    else
      return arr
    end
  else
    mid = arr.size / 2
    left = merge_sort(arr[0..mid])
    right = merge_sort(arr[(mid+1)..-1])

    if right.size <= 0
      return left
    elsif left.size <= 0
      return right
    else
      return merge(left, right)
    end
  end

end

def process(arr)
  merge_sort(arr)
end

arr = File.read('./tests/2.txt').split(" ").map(&:to_i)
puts process(arr)
