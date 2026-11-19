# Performs interpolation search on a sorted numeric array.
# Returns the index of the target element or -1 when target is absent.
# Raises ArgumentError if the input array is not sorted in ascending order.
def interpolation_search(array, target)
warn("[ERROR] >>> Entering interpolation_search(array=#{array},target=#{target})")
  raise ArgumentError, 'Input must be an array' unless array.is_a?(Array)
  return -1 if array.empty?

  unless array.each_cons(2).all? { |left, right| left <= right }
	warn("[ERROR] Throwing ArgumentError from interpolation_search(array=#{array},target=#{target})")
    raise ArgumentError, 'Array must be sorted in ascending order'
  end

  left = 0
warn("[DEBUG] interpolation_search(array=#{array},target=#{target}): left → #{left}")
  right = array.length - 1
warn("[DEBUG] interpolation_search(array=#{array},target=#{target}): right → #{right}")

  while left <= right && target >= array[left] && target <= array[right]
    return left if array[left] == target
    return right if array[right] == target

    value_range = array[right] - array[left]
	warn("[DEBUG] interpolation_search(array=#{array},target=#{target}): value_range → #{value_range}")
    if value_range.zero?
      return -1
    end

    position = left + ((target - array[left]) * (right - left) / value_range)
	warn("[DEBUG] interpolation_search(array=#{array},target=#{target}): position → #{position}")
    return -1 if position < left || position > right

    current = array[position]

    if current == target
      return position
    elsif current < target
      left = position + 1
    else
      right = position - 1
	warn("[WARN] <<< Exiting interpolation_search(array=#{array},target=#{target})")
    end
  end

  -1
end
