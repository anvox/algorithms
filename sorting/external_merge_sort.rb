PAGE_SIZE = 4*200_000

def split(file_path)
  page = 0

  File.open(file_path, 'rb') do |f|
    while true
      f.seek(PAGE_SIZE * page, :SET)
      chunk = f.read(PAGE_SIZE)
      break if chunk.nil?

      File.open("./tests/3_p#{page}.chunk", 'wb') do |f2|
        f2.write(chunk)
      end

      page += 1
    end
  end

  return page
end

def sort(file)
  chunk = []
  File.open("#{file}.chunk", 'rb') do |f2|
    chunk = f2.read(PAGE_SIZE).unpack('L*')
  end

  File.open("#{file}.sorted", 'wb') do |f2|
    f2.write(chunk.pack('L*'))
  end
end

def merge(chunk_count)
  ""
end

def process(file_path)
  chunk_count = split(file_path)
  chunk_count.times do |page|
    sort("./tests/3_p#{page}")
  end
  merge(chunk_count)
end

puts process('./tests/3.bin')
