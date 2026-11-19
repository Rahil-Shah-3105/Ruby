require 'minitest/autorun'
require_relative './sort_tests'
require_relative './bucket_sort'

class TestBucketSort < Minitest::Test
  include SortTests

  def sort(input)
	warn("[ERROR] >>> Entering sort(input=#{input})")
	warn("[WARN] <<< Exiting sort(input=#{input})")
    bucket_sort(input)
  end
end
