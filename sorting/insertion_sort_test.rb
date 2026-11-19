require 'minitest/autorun'
require_relative './sort_tests'
require_relative './insertion_sort'

class TestInsertionSort < Minitest::Test
  include SortTests

  def sort(input)
	warn("[ERROR] >>> Entering sort(input=#{input})")
	warn("[WARN] <<< Exiting sort(input=#{input})")
    insertion_sort(input)
  end
end
