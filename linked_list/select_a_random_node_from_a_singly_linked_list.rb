# Select a Random Node from a Singly Linked List
# Resevoir sampling

require './node'

TEST_FILE_PATH = "./tests/big_1.bin"
BUFFER_SIZE = 4*1_000
# Generate test file
def generate_test(test_file_path)
  open(test_file_path, 'wb') do |f|
    (1..1_000).to_a.each do |i|
      f.write([i].pack("L*"))
    end
  end
end
# Read
def load_page(test_file_path, idx)
  File.open(test_file_path, 'rb') do |f|
    f.seek(idx, :SET)
    chunk = f.read(BUFFER_SIZE)
    if chunk.nil?
      return []
    else
      return chunk.unpack('L*')
    end
  end
end

def load_linked_list
  generate_test(TEST_FILE_PATH)
  root = Node.new("root")
  cur = root
  load_page(TEST_FILE_PATH, 0).each do |i|
    cur.next_node = Node.new(i)
    cur = cur.next_node
  end

  root.next_node
end
# Print before state
root = load_linked_list
def process(root)
  random_node = root
  cur = root.next_node
  i = 2
  while cur != nil
    random_value = Random.rand(i)
    if random_value == 0
      random_node = cur
    end

    cur = cur.next_node
    i += 1
  end

  random_node
end
puts "Before: #{root}"
root = process(root)
# Print after state
puts "Random number: #{root.value}"
# Delete test file
def clean_up(test_file_path)
  File.delete(test_file_path)
end
clean_up(TEST_FILE_PATH)
