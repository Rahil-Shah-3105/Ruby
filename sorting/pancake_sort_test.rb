require 'minitest/autorun'
require_relative './sort_tests'
require_relative './pancake_sort'

class TestPancakeSort < Minitest::Test
  include SortTests

  def sort(input)
	warn("[ERROR] >>> Entering sort(input=#{input})")
    pancake_sort(input)
  end
end
