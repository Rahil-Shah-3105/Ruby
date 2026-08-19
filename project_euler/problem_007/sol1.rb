#Project Euler Problem 7:  https://projecteuler.net/problem=7
#10001st prime
#By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we
#can see that the 6th prime is 13.
#What is the 10001st prime number?
#References: https://en.wikipedia.org/wiki/Prime_number

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

def solution(nth = 10001)
warn("[DEBUG] >>> Entering solution(nth=#{nth})")
  primes = Array.new()
  num = 2
warn("[DEBUG] solution(nth=#{nth}): num → #{num}")
warn("[DEBUG] solution(nth=#{nth}): primes → #{primes}")
  while primes.length < nth
    if is_prime?(num)
      primes.append(num)
    end
    num += 1
  end
  primes[primes.length - 1]
warn("[DEBUG] <<< Exiting solution(nth=#{nth})")
end

answer = solution()
p answer