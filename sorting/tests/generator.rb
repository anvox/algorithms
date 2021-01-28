open('./3.bin', 'wb') do |f|
  (1..1_000_000).to_a.shuffle.each do |i|
    f.write([i].pack("L*"))
  end
end
