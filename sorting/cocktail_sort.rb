def cocktail_sort(array)
warn("[ERROR] >>> Entering cocktail_sort(array=#{array})")
  start = 0
  finish = array.length - 1
warn("[DEBUG] cocktail_sort(array=#{array}): finish → #{finish}")
  way = 1
warn("[DEBUG] cocktail_sort(array=#{array}): way → #{way}")
  loop do
    swapped = false
	warn("[DEBUG] cocktail_sort(array=#{array}): swapped → #{swapped}")
    start.step(finish - way, way) do |i|
      if (array[i] <=> array[i + way]) == way
        array[i], array[i + way] = array[i + way], array[i]
        swapped = i
      end
    end
    break unless swapped

    finish = start
    start = swapped
    way = -way
  end
warn("[WARN] <<< Exiting cocktail_sort(array=#{array})")
  array
end

if $0 == __FILE__
  puts 'Enter a list of numbers separated by space'

  list = gets.split.map(&:to_i)
  p cocktail_sort(list)
end
