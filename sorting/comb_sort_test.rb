require 'minitest/autorun'
require_relative './sort_tests'
require_relative './comb_sort'

class TestCombSort < Minitest::Test
  include SortTests

  def sort(input)
	warn("[ERROR] >>> Entering sort(input=#{input})")
	warn("[WARN] <<< Exiting sort(input=#{input})")
    comb_sort(input)
  end
end
