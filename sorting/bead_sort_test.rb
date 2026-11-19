require 'minitest/autorun'
require_relative './sort_tests'
require_relative './bead_sort'

class TestBeadSort < Minitest::Test
  include SortTests

  def sort(input)
	warn("[ERROR] >>> Entering sort(input=#{input})")
    bead_sort(input)
  end
end
