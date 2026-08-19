# LCM (Least Common Multiple) of two numbers is the smallest number which can be divided by both numbers.

p 'Least Common Multiple'

p 'Enter first number'
value_one = gets.chomp.to_i

p 'Enter second number'
value_two = gets.chomp.to_i

def gcd(first, second)
warn("[DEBUG] >>> Entering gcd(first=#{first},second=#{second})")
  if second != 0
    gcd(second, first % second)
  else
    first
  end
warn("[DEBUG] <<< Exiting gcd(first=#{first},second=#{second})")
end

def lcm(first, second)
warn("[DEBUG] >>> Entering lcm(first=#{first},second=#{second})")
  (first * second) / gcd(first, second)
warn("[DEBUG] <<< Exiting lcm(first=#{first},second=#{second})")
end

p "Least Common Multiple is: #{lcm(value_one, value_two)}"
