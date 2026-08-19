require 'minitest/autorun'
require_relative './sort_tests'
require_relative './quicksort'

class TestQuicksort < Minitest::Test
  include SortTests

  def sort(input)
	warn("[DEBUG] >>> Entering sort(input=#{input})")
	warn("[DEBUG] <<< Exiting sort(input=#{input})")
    quicksort(input)
  end
end
