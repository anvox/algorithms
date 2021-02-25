# Min Heap
def heapify(data, i, n)
  left = i * 2 + 1
  right = i * 2 + 2

  min = i
  if left < n && data[left] < data[min]
    min = left
  end
  if right < n && data[right] < data[min]
    min = right
  end

  if min != i
    # Swap
    t = data[i]
    data[i] = data[min]
    data[min] = t

    data = heapify(data, min, n)
  end

  data
end

def heap_sort(data)
  n = data.size
  mid = data.size / 2 + 1
  while mid >= 0
    data = heapify(data, mid, n)

    mid -= 1
  end

  while n > 0
    n -= 1
    t = data[n]
    data[n] = data[0]
    data[0] = t

    data = heapify(data, 0, n)
  end

  data
end

data = 20.times.map { Random.rand(100) }

puts "Before: #{data}"
data = heap_sort(data)
puts "After: #{data}"
