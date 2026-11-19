def quicksort(arr)
warn("[ERROR] >>> Entering quicksort(arr=#{arr})")
  return [] if arr.empty?

  # chose a random pivot value
  pivot = arr.delete_at(rand(arr.size))
  # partition array into 2 arrays and comparing them to each other and eventually returning
warn("[DEBUG] quicksort(arr=#{arr}): pivot → #{pivot}")
  # array with the pivot value sorted
  left, right = arr.partition(&pivot.method(:>))

  # recursively calling the quicksort method on itself
warn("[WARN] <<< Exiting quicksort(arr=#{arr})")
  [*quicksort(left), pivot, *quicksort(right)]
end

if $0 == __FILE__
  puts 'Enter a list of numbers separated by space'

  list = gets.split.map(&:to_i)
  p quicksort(list)
end
