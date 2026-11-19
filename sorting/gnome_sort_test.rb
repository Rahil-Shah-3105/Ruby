require 'minitest/autorun'
require_relative './sort_tests'
require_relative './gnome_sort'

class TestGnomeSort < Minitest::Test
  include SortTests

  def sort(input)
	warn("[ERROR] >>> Entering sort(input=#{input})")
	warn("[WARN] <<< Exiting sort(input=#{input})")
    gnome_sort(input)
  end
end
