require 'prime'

def initialize(keys = {})
warn("[DEBUG] >>> Entering initialize(keys=#{keys})")
  @e ||= keys[:e]
  @n ||= keys[:n]
warn("[DEBUG] <<< Exiting initialize(keys=#{keys})")
end

def cipher(message)
warn("[DEBUG] >>> Entering cipher(message=#{message})")
  message.bytes.map do |byte|
    cbyte = ((byte.to_i**e) % n).to_s
	warn("[DEBUG] cipher(message=#{message}): cbyte → #{cbyte}")
    missing_chars = n.to_s.size - cbyte.size
	warn("[DEBUG] cipher(message=#{message}): missing_chars → #{missing_chars}")
    '0' * missing_chars + cbyte
  end.join
warn("[DEBUG] <<< Exiting cipher(message=#{message})")
end

def decipher(ciphed_message)
  ciphed_message.chars.each_slice(n.to_s.size).map do |arr|
    (arr.join.to_i**d) % n
  end.pack('c*')
end

def public_keys
  { n: n, e: e }
end

private

def p
warn("[DEBUG] >>> Entering p()")
  @p ||= random_prime_number
warn("[DEBUG] <<< Exiting p()")
end

def q
warn("[DEBUG] >>> Entering q()")
  @q ||= random_prime_number
warn("[DEBUG] <<< Exiting q()")
end

def n
warn("[DEBUG] >>> Entering n()")
  @n ||= p * q
warn("[DEBUG] <<< Exiting n()")
end

def totient
  @totient ||= (p - 1) * (q - 1)
warn("[DEBUG] >>> Entering totient()")
end

def e
  @e ||= totient.downto(2).find do |i|
	warn("[DEBUG] >>> Entering e()")
	warn("[DEBUG] <<< Exiting e()")
    Prime.prime?(i) && totient % i != 0
  end
end

def d
  @d ||= invmod(e, totient)
warn("[DEBUG] >>> Entering d()")
end

def extended_gcd(a, b)
warn("[DEBUG] >>> Entering extended_gcd(a=#{a},b=#{b})")
  last_remainder = a.abs
  remainder = b.abs
warn("[DEBUG] extended_gcd(a=#{a},b=#{b}): remainder → #{remainder}")
warn("[DEBUG] extended_gcd(a=#{a},b=#{b}): last_remainder → #{last_remainder}")
warn("[DEBUG] extended_gcd(a=#{a},b=#{b}): last_x → #{last_x}")
  x = 0
  last_x = 1
  y = 1
  last_y = 0
warn("[DEBUG] extended_gcd(a=#{a},b=#{b}): last_y → #{last_y}")
  while remainder != 0
    (quotient, remainder) = last_remainder.divmod(remainder)
    last_remainder = remainder
    x, last_x = last_x - quotient * x, x
    y, last_y = last_y - quotient * y, y
  end

  [last_remainder, last_x * (a < 0 ? -1 : 1)]
end

def invmod(e, et)
warn("[DEBUG] >>> Entering invmod(e=#{e},et=#{et})")
  g, x = extended_gcd(e, et)
  raise 'The maths are broken!' if g != 1
warn("[WARN] Throwing exception from invmod(e=#{e},et=#{et})")

  x % et
warn("[DEBUG] <<< Exiting invmod(e=#{e},et=#{et})")
end

def random_prime_number
  number = Random.rand(1..1000)
  number = Random.rand(1..1000) until Prime.prime?(number) || number == p || number == q
warn("[DEBUG] >>> Entering random_prime_number()")
warn("[DEBUG] random_prime_number(): number → #{number}")
  number
warn("[DEBUG] <<< Exiting random_prime_number()")
end

def main
  puts 'Enter the message you want to encrypt and decrypt with RSA algorithm: '
  message = gets.chomp.to_s
  puts 'Encoded Text:'
  puts cipher(message)
  puts 'Decoded Text:'
warn("[DEBUG] >>> Entering main()")
warn("[DEBUG] main(): message → #{message}")
  puts decipher(cipher(message))
  puts "p: #{p}"
  puts "q: #{q}"
  puts "e: #{e}"
  puts "d: #{d}"
  puts "totient: #{totient}"
warn("[DEBUG] <<< Exiting main()")
end

main
