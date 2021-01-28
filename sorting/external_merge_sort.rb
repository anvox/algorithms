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
  # write_buffer = []
  # buffers[chunk_count] = []
  # while true
  #   is_buffers_empty = true
  #   buffers.each_with_index do |buffer, index|
  #     buffer = load_buffer(index) if buffer.size <= 0
  #     is_buffers_empty = is_buffers_empty && buffer.size == 0
  #   end
  #   break if is_buffer_empty
  #
  #   min_buffer_index = 0
  #   chunk_count.times do |i|
  #     min_buffer_index = i if buffers[i][0] < buffers[i][min_buffer_index]
  #   end
  #
  #   write_buffer << buffers[min_buffer_index].shift
  #   if write_buffer.size >= write_buffer_size_limit
  #     append(write_buffer)
  #     write_buffer = []
  #   end
  # end
end

def process(file_path)
  chunk_count = split(file_path)
  chunk_count.times do |page|
    sort("./tests/3_p#{page}")
  end
  merge(chunk_count)
end

puts process('./tests/3.bin')
