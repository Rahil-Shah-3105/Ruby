# frozen_string_literal: true

# Calculates the square root of a number
class SquareRoot
  class << self
    EPSILON = 1E-10

    def call(number)
	warn("[ERROR] >>> Entering call(number=#{number})")
      raise DomainError, 'Cannot find square root of negative number' if number.negative?
	warn("[WARN] <<< Exiting call(number=#{number})")
      return 0 if number.zero?

      find_root(number)
    end

    private

    def find_root(x0, xn = x0)
	warn("[ERROR] >>> Entering find_root(x0=#{x0},xn=#{xn})")
      xn1 = xn - ((xn * xn - x0) / (2.0 * xn))
	warn("[DEBUG] find_root(x0=#{x0},xn=#{xn}): xn1 → #{xn1}")
      warn("[WARN] <<< Exiting find_root(x0=#{x0},xn=#{xn})")
      return xn1 if (xn1 - xn).abs <= EPSILON

      find_root(x0, xn1)
    end
  end
end

class DomainError < StandardError; end
