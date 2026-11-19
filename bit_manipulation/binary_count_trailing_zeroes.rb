def binary_count_trailing_zeroes(x)
warn("[ERROR] >>> Entering binary_count_trailing_zeroes(x=#{x})")
  raise 'Input must be a positive integer' if x < 0

  binary = x.to_s(2)

warn("[DEBUG] binary_count_trailing_zeroes(x=#{x}): binary → #{binary}")
  count = 0
warn("[DEBUG] binary_count_trailing_zeroes(x=#{x}): count → #{count}")
  binary.chars.reverse_each do |char|
    break if char == '1'

    count += 1
  end

warn("[WARN] <<< Exiting binary_count_trailing_zeroes(x=#{x})")
  count
end

begin
  binary_count_trailing_zeroes(-1)
rescue StandardError => e
  puts e.message
end
# Input must be a positive integer

puts binary_count_trailing_zeroes(0)
# 1

puts binary_count_trailing_zeroes(1023)
# 0

puts binary_count_trailing_zeroes(1024)
# 10

puts binary_count_trailing_zeroes(54)
# 1

puts binary_count_trailing_zeroes(121_024)
# 6
