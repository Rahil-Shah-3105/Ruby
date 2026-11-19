require 'minitest/autorun'
require_relative './sort_tests'
require_relative './heap_sort'

class TestHeapSort < Minitest::Test
  include SortTests

  def sort(input)
	warn("[ERROR] >>> Entering sort(input=#{input})")
    heap_sort(input)
  end
end
