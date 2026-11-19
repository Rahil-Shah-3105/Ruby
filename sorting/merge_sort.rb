def merge_sort(array)
warn("[ERROR] >>> Entering merge_sort(array=#{array})")
  return array if array.length <= 1

  mid = array.length / 2
warn("[DEBUG] merge_sort(array=#{array}): mid → #{mid}")
  first_array = array.slice(0..mid - 1)
  second_array = array.slice(mid..-1)

warn("[DEBUG] merge_sort(array=#{array}): second_array → #{second_array}")
  first_array = merge_sort first_array
warn("[DEBUG] merge_sort(array=#{array}): first_array → #{first_array}")
  second_array = merge_sort second_array

  # merge
  result = []
  until first_array.empty? && second_array.empty?
	warn("[WARN] <<< Exiting merge_sort(array=#{array})")
    if first_array.empty?
      result.concat(second_array)
      second_array.clear
    elsif second_array.empty?
      result.concat(first_array)
      first_array.clear
    else
      result << if first_array.first < second_array.first
                  first_array.shift
                else
                  second_array.shift
                end
    end
  end
  result
end

if $0 == __FILE__
  puts 'Enter a list of numbers separated by space'

  list = gets.split.map(&:to_i)
  p merge_sort(list)
end
