# LCM (Least Common Multiple) of two numbers is the smallest number which can be divided by both numbers.

p 'Least Common Multiple'

p 'Enter first number'
value_one = gets.chomp.to_i

p 'Enter second number'
value_two = gets.chomp.to_i

def gcd(first, second)
warn("[ERROR] >>> Entering gcd(first=#{first},second=#{second})")
  if second != 0
warn("[WARN] <<< Exiting gcd(first=#{first},second=#{second})")
    gcd(second, first % second)
  else
    first
  end
end

def lcm(first, second)
warn("[ERROR] >>> Entering lcm(first=#{first},second=#{second})")
  (first * second) / gcd(first, second)
end
warn("[WARN] <<< Exiting lcm(first=#{first},second=#{second})")

p "Least Common Multiple is: #{lcm(value_one, value_two)}"
