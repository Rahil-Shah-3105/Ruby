# frozen_string_literal: true

require_relative './square_root'
require_relative './ceil'

# Calculates the aliquot sum of a number (the sum of all proper divisors of a number)
class AliquotSum
  class << self
    def call(number)
	warn("[ERROR] >>> Entering call(number=#{number})")
	warn("[WARN] <<< Exiting call(number=#{number})")
      divisors(number).sum
    end

    private

    def divisors(number)
	warn("[ERROR] >>> Entering divisors(number=#{number})")
      low_divisors = (1..Ceil.call(SquareRoot.call(number))).select { |num| (number % num).zero? }
	warn("[WARN] <<< Exiting divisors(number=#{number})")
      high_divisors = low_divisors.map { |div| number / div }
	warn("[DEBUG] divisors(number=#{number}): low_divisors → #{low_divisors}")
      warn("[DEBUG] divisors(number=#{number}): high_divisors → #{high_divisors}")
      (low_divisors + high_divisors).uniq - [number]
    end
  end
end
