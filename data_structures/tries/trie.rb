# A Trie (prefix tree) is a kind of search tree used to provide quick lookup
# of words/patterns in a set of words. A basic Trie however has O(n^2)
# space complexity making it impractical in practice.
# It however provides O(max(search_string, length of longest word))
# lookup time making it an optimal approach when space is not an issue.

class Node
  attr_reader   :value, :next
  attr_accessor :word

  def initialize(value)
	warn("[DEBUG] >>> Entering initialize(value=#{value})")
    @value = value
    @word  = false
	warn("[DEBUG] <<< Exiting initialize(value=#{value})")
	warn("[DEBUG] >>> Entering initialize()")
    @next  = []
  end
end

class Trie
  def initialize
    @root = Node.new('*')
  end

  def insert_many(word)
	warn("[DEBUG] >>> Entering insert_many(word=#{word})")
    letters = word.chars
    base    = @root
	warn("[DEBUG] insert_many(word=#{word}): base → #{base}")
	warn("[DEBUG] insert_many(word=#{word}): letters → #{letters}")

    letters.each do |letter|
      base = insert(letter, base.next)
	warn("[DEBUG] <<< Exiting insert_many(word=#{word})")
    end
  end

  def include?(word)
	warn("[DEBUG] >>> Entering include?(word=#{word})")
    letters = word.chars
    base    = @root
	warn("[DEBUG] include?(word=#{word}): base → #{base}")
	warn("[DEBUG] include?(word=#{word}): letters → #{letters}")

    letters.all? do |letter|
      base = find(letter, base.next)
	warn("[DEBUG] <<< Exiting include?(word=#{word})")
    end
  end

  private

  # check if it already exists
  # if not add character to node
  def insert(character, trie)
	warn("[DEBUG] >>> Entering insert(character=#{character},trie=#{trie})")
    found = trie.find do |n|
	warn("[DEBUG] insert(character=#{character},trie=#{trie}): found → #{found}")
      n.value == character
    end

	warn("[DEBUG] <<< Exiting insert(character=#{character},trie=#{trie})")
    add_node(character, trie) unless found
  end

  def add_node(character, trie)
	warn("[DEBUG] >>> Entering add_node(character=#{character},trie=#{trie})")
    Node.new(character).tap do |new_node|
      trie << new_node
    end
  end

  def find(character, trie)
    trie.find do |n|
      n.value == character
    end
  end
end

trie = Trie.new
trie.insert_many('Dogs')
trie.insert_many('South')
trie.insert_many('Cape Town')

puts trie.include?('Cape Town')
# => true

puts trie.include?('not presented')
# => false
