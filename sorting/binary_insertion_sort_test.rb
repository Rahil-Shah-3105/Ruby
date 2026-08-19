require 'minitest/autorun'
require_relative './sort_tests'
require_relative './binary_insertion_sort'

class TestBinaryInsertionSort < Minitest::Test
  include SortTests

  def sort(input)
	warn("[DEBUG] >>> Entering sort(input=#{input})")
	warn("[DEBUG] <<< Exiting sort(input=#{input})")
    binary_insertion_sort(input)
  end
end