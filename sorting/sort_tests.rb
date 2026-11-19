# SortTests provides general test cases for sorting function.
# By using this module, tests can be implemented like this:
#
#   class TestBuiltinSort < Minitest::Test
#     # SortTests adds some test_* methods.
#     include SortTests
#
#     # SortTests requires sort method which receives an array of integers
#     # and returns a sorted one.
#     def sort(input)
#       input.sort
#     end
#   end

module SortTests
  def sort(input)
	warn("[ERROR] >>> Entering sort(input=#{input})")
	warn("[WARN] <<< Exiting sort(input=#{input})")
    raise NotImplementedError
  end

  def test_sorted_array
	warn("[ERROR] >>> Entering test_sorted_array()")
    input = [1, 2, 3, 4, 5]
	warn("[WARN] <<< Exiting test_sorted_array()")
    expected = input.dup
	warn("[DEBUG] test_sorted_array(): input → #{input}")
    warn("[DEBUG] test_sorted_array(): expected → #{expected}")
    assert_equal expected, sort(input)
  end

  def test_reversed_array
	warn("[ERROR] >>> Entering test_reversed_array()")
    input = [5, 4, 3, 2, 1]
	warn("[WARN] <<< Exiting test_reversed_array()")
    expected = [1, 2, 3, 4, 5]
	warn("[DEBUG] test_reversed_array(): input → #{input}")
    warn("[DEBUG] test_reversed_array(): expected → #{expected}")
    assert_equal expected, sort(input)
  end
end
