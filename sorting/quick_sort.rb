require 'pry-byebug'

def process_pointer(arr)
  if arr.size <= 1
    return arr
  elsif arr.size <= 2
    if arr[0] > arr[1]
      return [arr[1], arr[0]]
    else
      return arr
    end
  else
    pivot = arr.length - 1

    p_high = 0
    while arr[p_high] < arr[pivot]
      p_high += 1
    end

    p_low = p_high + 1
    while p_low < pivot
      if arr[p_low] < arr[pivot]
        t = arr[p_high]
        arr[p_high] = arr[p_low]
        arr[p_low] = t

        p_high += 1
      end

      p_low += 1
    end

    # Switch pivot
    t = arr[pivot]
    arr[pivot] = arr[p_high]
    arr[p_high] = t

    if p_high - 1 <= 0
      return [arr[p_high]] + process_pointer(arr[(p_high + 1)..-1])
    elsif p_high >= arr.size
      return process_pointer(arr[0..(p_high - 1)]) + [arr[p_high]]
    else
      return process_pointer(arr[0..(p_high - 1)]) + [arr[p_high]] + process_pointer(arr[(p_high + 1)..-1])
    end
  end
end

def process(arr)
  if arr.size <= 1
    return arr
  elsif arr.size <= 2
    if arr[0] > arr[1]
      return [arr[1], arr[0]]
    else
      return arr
    end
  else
    pivot = arr.length - 1
    low = []
    high = []
    mid = [arr[pivot]]
    arr[0..-2].each do |i|
      if i == arr[pivot]
        mid << i
      elsif i > arr[pivot]
        high << i
      else
        low << i
      end
    end
    return process(low) + mid + process(high)
  end
end

arr = File.read('./tests/2.txt').split(" ").map(&:to_i)
puts process_pointer(arr)
