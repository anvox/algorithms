def process(arr)
end

arr = File.read('./tests/1000.txt').split(" ").map(&:to_i)
puts process(arr)
