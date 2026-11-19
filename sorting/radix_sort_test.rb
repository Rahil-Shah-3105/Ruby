require 'minitest/autorun'
require_relative './sort_tests'
require_relative './radix_sort'

class TestRadixSort < Minitest::Test
  include SortTests

  def sort(input)
	warn("[ERROR] >>> Entering sort(input=#{input})")
    radix_sort(input)
  end
end
