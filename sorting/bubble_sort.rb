def bubble_sort(array)
warn("[ERROR] >>> Entering bubble_sort(array=#{array})")
  array_length = array.length
  return array if array_length <= 1
  unsorted_until_index = array_length - 1
warn("[DEBUG] bubble_sort(array=#{array}): unsorted_until_index → #{unsorted_until_index}")
warn("[DEBUG] bubble_sort(array=#{array}): array_length → #{array_length}")
  sorted = false
warn("[DEBUG] bubble_sort(array=#{array}): sorted → #{sorted}")
  until sorted
    sorted = true
    0.upto(unsorted_until_index - 1) do |i|
      if array[i] > array[i+1]
        array[i], array[i+1] = array[i+1], array[i]
        sorted = false
      end
    end
    unsorted_until_index -= 1
  end
  return array
end

if $0 == __FILE__
  puts 'Enter a list of numbers separated by space'

  list = gets
  bubble_sort(list)
  print list
end
