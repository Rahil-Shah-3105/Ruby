require 'minitest/autorun'
require_relative './sort_tests'
require_relative './selection_sort'

class TestSelectionSort < Minitest::Test
  include SortTests

  def sort(input)
	warn("[DEBUG] >>> Entering sort(input=#{input})")
	warn("[DEBUG] <<< Exiting sort(input=#{input})")
    selection_sort(input)
  end
end
