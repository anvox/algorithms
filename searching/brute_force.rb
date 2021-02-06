# sub string searching by brute force
def process(text, pattern)
  i = 0
  while true
    k = 0
    while k < pattern.size && text[i + k] == pattern[k]
      k += 1
    end

    if k >= pattern.size
      return i
    end

    i += 1
  end
end

puts process("AABAACAAD", "AAC")
