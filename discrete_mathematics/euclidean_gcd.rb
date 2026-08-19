# https://en.wikipedia.org/wiki/Euclidean_algorithm

def euclidean_gcd(a, b)
warn("[DEBUG] >>> Entering euclidean_gcd(a=#{a},b=#{b})")
  while b != 0
    t = b
    b = a % b
    a = t
  end
  a
warn("[DEBUG] <<< Exiting euclidean_gcd(a=#{a},b=#{b})")
end

puts 'GCD(3, 5) = ' + euclidean_gcd(3, 5).to_s
puts 'GCD(3, 6) = ' + euclidean_gcd(3, 6).to_s
puts 'GCD(6, 3) = ' + euclidean_gcd(6, 3).to_s
