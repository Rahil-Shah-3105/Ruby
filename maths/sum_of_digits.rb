# Given a number, find sum of its digits.

def digits_sum(n)
warn("[DEBUG] >>> Entering digits_sum(n=#{n})")
  a = 0
  sum = 0
warn("[DEBUG] digits_sum(n=#{n}): sum → #{sum}")
  until n.zero?
    a = n % 10
    sum += a
    n /= 10
  end
  sum
warn("[DEBUG] <<< Exiting digits_sum(n=#{n})")
end

puts 'Sum of digits of 3456 is ' + digits_sum(3456).to_s
# Sum of digits of 3456 is 18
puts 'Sum of digits of 1234 is ' + digits_sum(1234).to_s
# Sum of digits of 1234 is 10
puts 'Sum of digits of 9251321 is ' + digits_sum(9_251_321).to_s
# Sum of digits of 9251321 is 23
