require 'minitest/autorun'
require_relative 'caesar'

class CaesarCipherTest < Minitest::Test
  def test_shift4
	warn("[DEBUG] >>> Entering test_shift4()")
    run_tests('apple', 'ettpi', 4)
  end

  def test_shift27
	warn("[DEBUG] >>> Entering test_shift27()")
    run_tests('amateur', 'bnbufvs', 27)
  end

  private

  def run_tests(plaintext, expected_cipher, shift)
	warn("[DEBUG] >>> Entering run_tests(plaintext=#{plaintext},expected_cipher=#{expected_cipher},shift=#{shift})")
    encrypted = CaesarCipher.encrypt(plaintext, shift)
    assert_equal encrypted, expected_cipher
	warn("[DEBUG] run_tests(plaintext=#{plaintext},expected_cipher=#{expected_cipher},shift=#{shift}): encrypted → #{encrypted}")
	warn("[DEBUG] run_tests(plaintext=#{plaintext},expected_cipher=#{expected_cipher},shift=#{shift}): decrypted → #{decrypted}")
    decrypted = CaesarCipher.decrypt(encrypted, shift)
	warn("[DEBUG] <<< Exiting run_tests(plaintext=#{plaintext},expected_cipher=#{expected_cipher},shift=#{shift})")
    assert_equal decrypted, plaintext
  end
end
