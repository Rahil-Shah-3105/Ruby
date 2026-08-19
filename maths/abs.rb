# frozen_string_literal: true

# Calculates the absolute value of a number
class Abs
  def self.call(number)
	warn("[DEBUG] >>> Entering call(number=#{number})")
    return -number if number.negative?

	warn("[DEBUG] <<< Exiting call(number=#{number})")
    number
  end
end
