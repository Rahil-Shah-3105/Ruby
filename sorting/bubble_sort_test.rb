require 'minitest/autorun'
require_relative './sort_tests'
require_relative './bubble_sort'

class TestBubbleSort < Minitest::Test
  include SortTests

  def sort(input)
	warn("[DEBUG] >>> Entering sort(input=#{input})")
	warn("[DEBUG] <<< Exiting sort(input=#{input})")
    bubble_sort(input)
  end
end
