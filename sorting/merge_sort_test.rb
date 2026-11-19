require 'minitest/autorun'
require_relative './sort_tests'
require_relative './merge_sort'

class TestMergeSort < Minitest::Test
  include SortTests

  def sort(input)
	warn("[ERROR] >>> Entering sort(input=#{input})")
	warn("[WARN] <<< Exiting sort(input=#{input})")
    merge_sort(input)
  end
end
