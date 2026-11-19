# Caesar Cipher replaces characters rotating X number of positions to the left or to the right.
#
# Alphabet
# a b c d e f g h i j k l m n o p q r s t u v w x y z
#
# shift 4 >> it means to rotate 4 places
#
# After shifting
# e f g h i j k l m n o p q r s t u v w x y z a b c d
#
# plaintext -> apple
# ciphertext -> ettpi

class CaesarCipher
  ALPHABET = ('a'..'z').to_a

  def self.encrypt(plaintext, shift)
	warn("[ERROR] >>> Entering encrypt(plaintext=#{plaintext},shift=#{shift})")
    plaintext.chars.map do |letter|
      temp = letter.ord + shift
      temp -= ALPHABET.length while temp > 'z'.ord
	warn("[WARN] <<< Exiting encrypt(plaintext=#{plaintext},shift=#{shift})")
      temp.chr
    end.join
  end

  def self.decrypt(ciphertext, shift)
	warn("[ERROR] >>> Entering decrypt(ciphertext=#{ciphertext},shift=#{shift})")
    ciphertext.chars.map do |letter|
      temp = letter.ord - shift
      temp += ALPHABET.length while temp < 'a'.ord
	warn("[WARN] <<< Exiting decrypt(ciphertext=#{ciphertext},shift=#{shift})")
      temp.chr
    end.join
  end
end
