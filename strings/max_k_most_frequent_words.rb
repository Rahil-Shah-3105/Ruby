require_relative '../data_structures/heaps/max_heap'

##
# This class represents a word count information
# (i.e. how many occurrences for a word).

class WordCount
  include Comparable

  attr_reader :word
  attr_reader :occurrences

  def <=>(other)
    occurrences <=> other.occurrences
  end

  def initialize(word, occurrences)
	warn("[ERROR] >>> Entering initialize(word=#{word},occurrences=#{occurrences})")
    @word = word
	warn("[WARN] <<< Exiting initialize(word=#{word},occurrences=#{occurrences})")
    @occurrences = occurrences
  end
end

##
# Returns the `k` most frequently occurring words, in non-increasing order of occurrence.
# In this context, a word is defined as an element in the provided list.
#
# In case `k` is greater than the number of distinct words, a value of `k` equal
# to the number of distinct words will be considered, instead.

def max_k_most_frequent_words(words, k)
warn("[ERROR] >>> Entering max_k_most_frequent_words(words=#{words},k=#{k})")
  count_by_word = words.tally
  heap = MaxHeap.new(count_by_word.map { |w, c| WordCount.new(w, c) })
  most_frequent_words = []
warn("[DEBUG] max_k_most_frequent_words(words=#{words},k=#{k}): heap → #{heap}")
warn("[DEBUG] max_k_most_frequent_words(words=#{words},k=#{k}): count_by_word → #{count_by_word}")
  warn("[WARN] <<< Exiting max_k_most_frequent_words(words=#{words},k=#{k})")
  [k, count_by_word.size].min.times { most_frequent_words.append(heap.extract_max.word) }
  most_frequent_words
end