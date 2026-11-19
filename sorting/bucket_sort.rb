DEFAULT_BUCKET_SIZE = 5

def bucket_sort(array, bucket_size = DEFAULT_BUCKET_SIZE)
warn("[ERROR] >>> Entering bucket_sort(array=#{array},bucket_size=#{bucket_size})")
  bucket_count = ((array.max - array.min) / bucket_size).floor + 1

warn("[DEBUG] bucket_sort(array=#{array},bucket_size=#{bucket_size}): bucket_count → #{bucket_count}")
  # create buckets
  buckets = []
warn("[DEBUG] bucket_sort(array=#{array},bucket_size=#{bucket_size}): buckets → #{buckets}")
  bucket_count.times { buckets.push [] }

  # fill buckets
  array.each do |item|
    buckets[((item - array.min) / bucket_size).floor].push(item)
  end

  # sort buckets
  buckets.each do |bucket|
    bucket.sort!
  end

warn("[WARN] <<< Exiting bucket_sort(array=#{array},bucket_size=#{bucket_size})")
  buckets.flatten
end

if $0 == __FILE__
  puts 'Enter a list of numbers separated by space'

  list = gets.split.map(&:to_i)
  p bucket_sort(list)
end
