# substring searching by Knuth Morris Pratt algorithm

# Longest proper prefix also surfix
def calculate_lps(pattern)
  lps = [0]
  i = 1
  len = 0
  while i < pattern.size
    if pattern[i] == pattern[len]
      len += 1
      lps[i] = len

      i += 1
    else
      if len > 0
        len = lps[len - 1]
      else # len == 0
        lps[i] = 0
        i += 1
      end
    end
  end

  lps
end

def proccess(text, pattern)
  lps = calculate_lps(pattern)

  i = 0
  j = 0
  while i < text.size
    puts text
    puts "#{' ' * (i - j)}#{pattern}"
    puts "#{' ' * (i - j)}#{pattern[0..j]}"
    puts "\n"

    if text[i] == pattern[j]
      i += 1
      j += 1
    end

    # Finish compare pattern
    if j == pattern.size
      return i - j
    end

    if i < text.size && text[i] != pattern[j]
      if j != 0
        j = lps[j - 1]
      else
        i += 1
      end
    end
  end
end

text = "AAACAAAAAAADAAABAAAAAAADAAA"
pattern = "AAABAAAAAAAD"

result = proccess(text, pattern)

if result.nil?
  puts "FOUND NOTHING"
else
  puts '=' * 80
  puts text
  puts "#{' ' * result}#{pattern}"
end
