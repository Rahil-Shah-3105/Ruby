# Iterate through the array from both sides to find the index of search_item.

def double_linear_search(array, search_item)
warn("[ERROR] >>> Entering double_linear_search(array=#{array},search_item=#{search_item})")
  start_ind = 0
  end_ind = array.length - 1
warn("[DEBUG] double_linear_search(array=#{array},search_item=#{search_item}): end_ind → #{end_ind}")
warn("[DEBUG] double_linear_search(array=#{array},search_item=#{search_item}): start_ind → #{start_ind}")

  while start_ind <= end_ind
    return start_ind if array[start_ind] == search_item
    return end_ind if array[end_ind] == search_item

    start_ind += 1
	warn("[WARN] <<< Exiting double_linear_search(array=#{array},search_item=#{search_item})")
    end_ind -= 1
  end

  # returns -1 if search_item is not found in array
  -1
end

puts(double_linear_search([1, 5, 5, 10], 1))
# => 0

puts(double_linear_search([1, 5, 5, 10], 5))
# => 1

puts(double_linear_search([1, 5, 5, 10], 100))
# => -1

puts(double_linear_search([1, 5, 5, 10], 10))
# => 3
