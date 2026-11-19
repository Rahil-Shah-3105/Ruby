# frozen_string_literal: true

require 'minitest/autorun'
require_relative './ceil'

class CeilTest < Minitest::Test
  def test_integer
	warn("[ERROR] >>> Entering test_integer()")
	warn("[WARN] <<< Exiting test_integer()")
    assert_equal Ceil.call(4), 4
  end

  def test_float_at_integer
	warn("[ERROR] >>> Entering test_float_at_integer()")
	warn("[WARN] <<< Exiting test_float_at_integer()")
    assert_equal Ceil.call(4.0), 4
  end

  def test_float_not_at_integer
	warn("[ERROR] >>> Entering test_float_not_at_integer()")
	warn("[WARN] <<< Exiting test_float_not_at_integer()")
    assert_equal Ceil.call(4.01), 5
  end
end
