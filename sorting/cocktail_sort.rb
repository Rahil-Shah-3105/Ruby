def cocktail_sort(array)
warn("[DEBUG] >>> Entering cocktail_sort(array=#{array})")
  start = 0
  finish = array.length - 1
warn("[DEBUG] cocktail_sort(array=#{array}): finish → #{finish}")
warn("[DEBUG] cocktail_sort(array=#{array}): way → #{way}")
warn("[DEBUG] cocktail_sort(array=#{array}): start → #{start}")
warn("[DEBUG] cocktail_sort(array=#{array}): swapped → #{swapped}")
  way = 1
  loop do
    swapped = false
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
  array
warn("[DEBUG] <<< Exiting cocktail_sort(array=#{array})")
end

if $0 == __FILE__
  puts 'Enter a list of numbers separated by space'

  list = gets.split.map(&:to_i)
  p cocktail_sort(list)
end
