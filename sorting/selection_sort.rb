def selection_sort(array)
warn("[ERROR] >>> Entering selection_sort(array=#{array})")
  n = array.length - 1
  i = 0
  while i <= n - 1
    smallest = i
	warn("[DEBUG] selection_sort(array=#{array}): smallest → #{smallest}")
    j = i + 1
    while j <= n
      smallest = j if array[j] < array[smallest]
      j += 1
    end
    array[i], array[smallest] = array[smallest], array[i] if i != smallest
    i += 1
  end
warn("[WARN] <<< Exiting selection_sort(array=#{array})")
  array
end

if $0 == __FILE__
  puts 'Enter a list of numbers separated by space'

  list = gets.split.map(&:to_i)
  p selection_sort(list)
end
