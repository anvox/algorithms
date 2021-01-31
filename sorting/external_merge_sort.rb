require 'pry-byebug'

PAGE_SIZE = 4*200_000
WRITE_BUFFER_SIZE_LIMIT = 1000

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
  # Do some stuffs
  chunk.sort!
  File.open("#{file}.sorted", 'wb') do |f2|
    f2.write(chunk.pack('L*'))
  end
end

BUFFER_SIZE = 4*2_000 # PAGE_SIZE / 100
def load_buffer(idx, cursors)
  File.open("./tests/3_p#{idx}.sorted", 'rb') do |f2|
    f2.seek(cursors[idx], :SET)
    chunk = f2.read(BUFFER_SIZE)
    cursors[idx] += BUFFER_SIZE

    if chunk.nil?
      return []
    else
      return chunk.unpack('L*')
    end
  end
end

def merge(chunk_count)
  write_buffer = []
  buffers = Array.new(chunk_count) { [] }
  cursors = Array.new(chunk_count) { 0 }
  while true
    is_buffers_empty = true
    buffers.each_with_index do |buffer, index|
      if buffer.size <= 0
        buffer = load_buffer(index, cursors)
      end

      is_buffers_empty = is_buffers_empty && buffer.size == 0
      buffers[index] = buffer
    end

    break if is_buffers_empty

    min_buffer_index = nil
    chunk_count.times do |i|
      next if buffers[i].size <= 0

      if min_buffer_index.nil?
        min_buffer_index = i
      elsif buffers[i][0] < buffers[min_buffer_index][0]
        min_buffer_index = i
      end
    end

    write_buffer << buffers[min_buffer_index].shift
    if write_buffer.size >= WRITE_BUFFER_SIZE_LIMIT
      append(write_buffer)
      write_buffer = []
    end
  end
end

def append(numbers)
  puts numbers
end

def process(file_path)
  chunk_count = split(file_path)
  chunk_count.times do |page|
    sort("./tests/3_p#{page}")
  end
  merge(chunk_count)
end

puts process('./tests/3.bin')
