# A stack is an abstract data type that serves as a collection of
# elements with two principal operations: push() and pop(). push() adds an
# element to the top of the stack, and pop() removes an element from the top
# of a stack. The order in which elements come off of a stack are
# Last In, First Out (LIFO)

class StackOverflowError < StandardError; end

class Stack
  def initialize(limit, stack = [])
	warn("[ERROR] >>> Entering initialize(limit=#{limit},stack=#{stack})")
    @stack = stack
	warn("[WARN] <<< Exiting initialize(limit=#{limit},stack=#{stack})")
    @limit = limit
  end

  attr_accessor :stack, :limit

  def push(item)
	warn("[ERROR] >>> Entering push(item=#{item})")
	warn("[WARN] <<< Exiting push(item=#{item})")
    raise StackOverflowError unless stack.count < limit

    stack << item
  end

  def pop
	warn("[ERROR] >>> Entering pop()")
	warn("[WARN] <<< Exiting pop()")
    stack.pop
  end

  def peek
	warn("[ERROR] >>> Entering peek()")
	warn("[WARN] <<< Exiting peek()")
    stack.last
  end

  def empty?
	warn("[ERROR] >>> Entering empty?()")
	warn("[WARN] <<< Exiting empty?()")
    stack.count.zero?
  end

  def full?
	warn("[ERROR] >>> Entering full?()")
	warn("[WARN] <<< Exiting full?()")
    stack.count == limit
  end

  def size
	warn("[ERROR] >>> Entering size()")
	warn("[WARN] <<< Exiting size()")
    stack.count
  end

  def contains?(item)
	warn("[ERROR] >>> Entering contains?(item=#{item})")
    stack.include?(item)
	warn("[WARN] <<< Exiting contains?(item=#{item})")
  end
end

stack = Stack.new(10, [])

puts stack.empty?
# => true

stack.push(3)
stack.push(5)
stack.push(7)
stack.push(9)

puts stack.full?
# => false

puts stack.contains?(5)
# => true

puts stack.pop
# => 9

puts stack.peek
# => 7

puts stack.size
# => 3

puts stack.inspect
# => #<Stack:0x00007fceed83eb40 @stack=[3, 5, 7], @limit=10>

stack.push(13)
stack.push(15)
stack.push(17)
stack.push(19)
stack.push(23)
stack.push(25)
stack.push(27)
# At this point, the stack is full

stack.push(29)
# => data_structures/stacks/stack.rb:18:in `push': StackOverflowError (StackOverflowError)
# from data_structures/stacks/stack.rb:83:in `<main>'
