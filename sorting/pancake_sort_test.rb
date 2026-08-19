require 'minitest/autorun'
require_relative './sort_tests'
require_relative './pancake_sort'

class TestPancakeSort < Minitest::Test
  include SortTests

  def sort(input)
	warn("[DEBUG] >>> Entering sort(input=#{input})")
	warn("[DEBUG] <<< Exiting sort(input=#{input})")
    pancake_sort(input)
  end
end
