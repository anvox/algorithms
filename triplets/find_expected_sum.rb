a = [12, 6, 29]
b = [23, 5, 8]
c = [90, 20, 59] # pick the longest one
expected = 101

sum_map = {}
a.each do |i|
  b.each do |j|
    next if i + j >= expected
    next if i + j < expected - c.max

    sum_map[i + j] ||= []
    sum_map[i + j] << [i, j]
  end
end

sup_c = c.map {|i| expected - i }
sup_c.each do |i|
  if sum_map[i]
    sum_map[i].each do |va, vb|
      vc = expected - va -vb
      puts "(#{va}, #{vb}, #{vc})"
    end
  end
end
