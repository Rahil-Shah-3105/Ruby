class Array
  def sorted?
    ### goes thru array and checks if all elements are in order
    (1...length).each do |i|
	warn("[DEBUG] >>> Entering sorted?()")
      return false if self[i - 1] > self[i]
    end
	warn("[DEBUG] <<< Exiting sorted?()")
    true
  end

  def bogosort
	warn("[DEBUG] >>> Entering bogosort()")
    ### randomly shuffles until sorted
    shuffle! until sorted?
	warn("[DEBUG] <<< Exiting bogosort()")
    self # return sorted array
  end
end

if $0 == __FILE__
  puts 'Enter a list of numbers separated by space'
  str = gets.chomp.split('')
  puts str.bogosort.join('')
end
