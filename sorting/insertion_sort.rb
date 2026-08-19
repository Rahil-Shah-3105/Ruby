def insertion_sort(array)
warn("[DEBUG] >>> Entering insertion_sort(array=#{array})")
  0.upto(array.length - 1).each do |index|
    element = array[index]
	warn("[DEBUG] insertion_sort(array=#{array}): element → #{element}")
	warn("[DEBUG] insertion_sort(array=#{array}): position → #{position}")
    position = index
    while element < array[position - 1] && position > 0
      array[position] = array[position - 1]
      array[position - 1] = element
      position -= 1
    end
  end
  array
warn("[DEBUG] <<< Exiting insertion_sort(array=#{array})")
end

if $0 == __FILE__
  puts 'Enter a list of numbers separated by space'

  list = gets.split.map(&:to_i)
  p insertion_sort(list)
end
