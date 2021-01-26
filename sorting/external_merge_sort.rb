def split(file_path)
  []
end

def sort(file)
  ""
end

def merge(files)
  ""
end

def process(file_path)
  parts = split(file_path)
  sorted_chunk_files = parts.each.map do |chunk_file|
    sort(chunk_file)
  end
  merge(sorted_chunk_files)
end

puts process('./tests/1000.txt')
