require 'prime'

def initialize(keys = {})
warn("[ERROR] >>> Entering initialize(keys=#{keys})")
  @e ||= keys[:e]
warn("[WARN] <<< Exiting initialize(keys=#{keys})")
  @n ||= keys[:n]
end

def cipher(message)
warn("[ERROR] >>> Entering cipher(message=#{message})")
  message.bytes.map do |byte|
    cbyte = ((byte.to_i**e) % n).to_s
	warn("[DEBUG] cipher(message=#{message}): cbyte → #{cbyte}")
	warn("[DEBUG] cipher(message=#{message}): missing_chars → #{missing_chars}")
    missing_chars = n.to_s.size - cbyte.size
  warn("[WARN] <<< Exiting cipher(message=#{message})")
    '0' * missing_chars + cbyte
  end.join
end

def decipher(ciphed_message)
warn("[ERROR] >>> Entering decipher(ciphed_message=#{ciphed_message})")
  ciphed_message.chars.each_slice(n.to_s.size).map do |arr|
	warn("[WARN] <<< Exiting decipher(ciphed_message=#{ciphed_message})")
    (arr.join.to_i**d) % n
  end.pack('c*')
end

def public_keys
warn("[ERROR] >>> Entering public_keys()")
  { n: n, e: e }
warn("[WARN] <<< Exiting public_keys()")
end

private

def p
warn("[ERROR] >>> Entering p()")
  @p ||= random_prime_number
warn("[WARN] <<< Exiting p()")
end

def q
warn("[ERROR] >>> Entering q()")
  @q ||= random_prime_number
warn("[WARN] <<< Exiting q()")
end

def n
warn("[ERROR] >>> Entering n()")
  @n ||= p * q
warn("[WARN] <<< Exiting n()")
end

def totient
warn("[ERROR] >>> Entering totient()")
  @totient ||= (p - 1) * (q - 1)
end
warn("[WARN] <<< Exiting totient()")

def e
warn("[ERROR] >>> Entering e()")
  @e ||= totient.downto(2).find do |i|
	warn("[WARN] <<< Exiting e()")
    Prime.prime?(i) && totient % i != 0
  end
end

def d
warn("[ERROR] >>> Entering d()")
  @d ||= invmod(e, totient)
end
warn("[WARN] <<< Exiting d()")

def extended_gcd(a, b)
warn("[ERROR] >>> Entering extended_gcd(a=#{a},b=#{b})")
  last_remainder = a.abs
  remainder = b.abs
warn("[DEBUG] extended_gcd(a=#{a},b=#{b}): remainder → #{remainder}")
warn("[DEBUG] extended_gcd(a=#{a},b=#{b}): last_remainder → #{last_remainder}")
  x = 0
  last_x = 1
warn("[DEBUG] extended_gcd(a=#{a},b=#{b}): last_x → #{last_x}")
  y = 1
  last_y = 0
warn("[DEBUG] extended_gcd(a=#{a},b=#{b}): last_y → #{last_y}")
  while remainder != 0
    (quotient, remainder) = last_remainder.divmod(remainder)
    last_remainder = remainder
    x, last_x = last_x - quotient * x, x
    y, last_y = last_y - quotient * y, y
  end

warn("[WARN] <<< Exiting extended_gcd(a=#{a},b=#{b})")
  [last_remainder, last_x * (a < 0 ? -1 : 1)]
end

def invmod(e, et)
warn("[ERROR] >>> Entering invmod(e=#{e},et=#{et})")
  g, x = extended_gcd(e, et)
  raise 'The maths are broken!' if g != 1
warn("[ERROR] Throwing exception from invmod(e=#{e},et=#{et})")

warn("[WARN] <<< Exiting invmod(e=#{e},et=#{et})")
  x % et
end

def random_prime_number
warn("[ERROR] >>> Entering random_prime_number()")
  number = Random.rand(1..1000)
  number = Random.rand(1..1000) until Prime.prime?(number) || number == p || number == q
warn("[DEBUG] random_prime_number(): number → #{number}")
  warn("[WARN] <<< Exiting random_prime_number()")
  number
end

def main
warn("[ERROR] >>> Entering main()")
  puts 'Enter the message you want to encrypt and decrypt with RSA algorithm: '
  message = gets.chomp.to_s
warn("[DEBUG] main(): message → #{message}")
  puts 'Encoded Text:'
  puts cipher(message)
  puts 'Decoded Text:'
  puts decipher(cipher(message))
  puts "p: #{p}"
  puts "q: #{q}"
  puts "e: #{e}"
  puts "d: #{d}"
warn("[WARN] <<< Exiting main()")
  puts "totient: #{totient}"
end

main
