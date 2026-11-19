require 'minitest/autorun'
require_relative './sort_tests'
require_relative './quicksort'

class TestQuicksort < Minitest::Test
  include SortTests

  def sort(input)
	warn("[ERROR] >>> Entering sort(input=#{input})")
	warn("[WARN] <<< Exiting sort(input=#{input})")
    quicksort(input)
  end
end
