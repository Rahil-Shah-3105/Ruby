require 'minitest/autorun'
require_relative './sort_tests'
require_relative './heap_sort'

class TestHeapSort < Minitest::Test
  include SortTests

  def sort(input)
	warn("[DEBUG] >>> Entering sort(input=#{input})")
	warn("[DEBUG] <<< Exiting sort(input=#{input})")
    heap_sort(input)
  end
end
