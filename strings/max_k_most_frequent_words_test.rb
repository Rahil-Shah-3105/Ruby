require 'minitest/autorun'
require_relative 'max_k_most_frequent_words'

class TestMaxKMostFrequentWords < Minitest::Test
  def test_top_3_frequent_words
	warn("[DEBUG] >>> Entering test_top_3_frequent_words()")
	warn("[DEBUG] <<< Exiting test_top_3_frequent_words()")
    assert max_k_most_frequent_words(['a', 'b', 'c', 'a', 'c', 'c'], 3) == ['c', 'a', 'b']
  end

  def test_top_2_frequent_words
	warn("[DEBUG] >>> Entering test_top_2_frequent_words()")
	warn("[DEBUG] <<< Exiting test_top_2_frequent_words()")
    assert max_k_most_frequent_words(['a', 'b', 'c', 'a', 'c', 'c'], 2) == ['c', 'a']
  end

  def test_top_frequent_word
	warn("[DEBUG] >>> Entering test_top_frequent_word()")
	warn("[DEBUG] <<< Exiting test_top_frequent_word()")
    assert max_k_most_frequent_words(['a', 'b', 'c', 'a', 'c', 'c'], 1) == ['c']
  end

  def test_no_frequent_word_given_zero_k
	warn("[DEBUG] >>> Entering test_no_frequent_word_given_zero_k()")
	warn("[DEBUG] <<< Exiting test_no_frequent_word_given_zero_k()")
    assert max_k_most_frequent_words(['a', 'b', 'c', 'a', 'c', 'c'], 0) == []
  end

  def test_no_frequent_word_given_empty_word_list
	warn("[DEBUG] >>> Entering test_no_frequent_word_given_empty_word_list()")
	warn("[DEBUG] <<< Exiting test_no_frequent_word_given_empty_word_list()")
    assert max_k_most_frequent_words([], 1) == []
  end

  def test_all_frequent_words_given_k_too_large
	warn("[DEBUG] >>> Entering test_all_frequent_words_given_k_too_large()")
	warn("[DEBUG] <<< Exiting test_all_frequent_words_given_k_too_large()")
    assert max_k_most_frequent_words(['a', 'a'], 2) == ['a']
  end
end
