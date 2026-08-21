#Project Euler Problem 10:  https://projecteuler.net/problem=10
#Summation of primes
#The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
#Find the sum of all the primes below two million.
#References:  https://en.wikipedia.org/wiki/Prime_number
def is_prime?(number)   
	warn("[DEBUG] >>> Entering is_prime?(number=#{number})")
    value = true
    if number > 1 and number < 4
		warn("[DEBUG] is_prime?(number=#{number}): value → #{value}")
        # 2 and 3 are primes
        value = true
    elsif number < 2 or number % 2 == 0 or number % 3 == 0
    # Negatives, 0, 1, all even numbers, all multiples of 3 are not primes
        value = false
    end
    end_range = (Math.sqrt(number) + 1).to_i
	warn("[DEBUG] is_prime?(number=#{number}): end_range → #{end_range}")
    # All primes number are in format of 6k +/- 1
    for i in (5..end_range).step(6)
        if number % i == 0 or number % (i + 2) == 0
            value = false
        end
    end
	warn("[DEBUG] <<< Exiting is_prime?(number=#{number})")
    result = value
end

def solution(max_total = 2000000)
warn("[DEBUG] >>> Entering solution(max_total=#{max_total})")
  sum = 1
  num = 2
warn("[DEBUG] solution(max_total=#{max_total}): num → #{num}")
warn("[DEBUG] solution(max_total=#{max_total}): value → #{value}")
warn("[DEBUG] solution(max_total=#{max_total}): sum → #{sum}")
  value = 1
  while num < max_total and value < max_total
    if is_prime?(num)
      value += num
      if value < max_total
        sum = value
      end
    end
    num += 1
  end
  result = sum
warn("[DEBUG] <<< Exiting solution(max_total=#{max_total})")
end

answer = solution()
p answer