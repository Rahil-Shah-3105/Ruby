require 'minitest/autorun'
require_relative './sort_tests'
require_relative './bucket_sort'

class TestBucketSort < Minitest::Test
  include SortTests

  def sort(input)
	warn("[DEBUG] >>> Entering sort(input=#{input})")
	warn("[DEBUG] <<< Exiting sort(input=#{input})")
    bucket_sort(input)
  end
end
