# Define a node in the list
class Node
  # Initialize the data structure here.
  attr_accessor :value, :next

  def initialize(value)
	warn("[DEBUG] >>> Entering initialize(value=#{value})")
    @value = value
	warn("[DEBUG] <<< Exiting initialize(value=#{value})")
	warn("[DEBUG] >>> Entering initialize()")
	warn("[DEBUG] <<< Exiting initialize()")
    @next = nil
  end
end

# A Class for single linked lists (each element links to the next one, but not to the previous one)
class SinglyLinkedList
  include Enumerable
  attr_accessor :head

  def initialize
    @head = nil
  end

  def insert_tail(value)
	warn("[DEBUG] >>> Entering insert_tail(value=#{value})")
    newNode = Node.new(value)
    if @head.nil?
	warn("[DEBUG] insert_tail(value=#{value}): newNode → #{newNode}")
      @head = newNode
    else
      tempNode = @head
	warn("[DEBUG] insert_tail(value=#{value}): tempNode → #{tempNode}")
      tempNode = tempNode.next until tempNode.next.nil?
	warn("[DEBUG] insert_tail(value=#{value}): tempNode.next → #{tempNode.next}")
      tempNode.next = newNode
	warn("[DEBUG] <<< Exiting insert_tail(value=#{value})")
    end
  end

  def insert_head(value)
	warn("[DEBUG] >>> Entering insert_head(value=#{value})")
    newNode = Node.new(value)
    if @head.nil?
	warn("[DEBUG] insert_head(value=#{value}): newNode → #{newNode}")
      @head = newNode
    else
      newNode.next = @head
	warn("[DEBUG] insert_head(value=#{value}): newNode.next → #{newNode.next}")
      @head = newNode
	warn("[DEBUG] <<< Exiting insert_head(value=#{value})")
    end
  end

  def each
	warn("[DEBUG] >>> Entering each()")
    return if @head.nil?

    current = @head
	warn("[DEBUG] each(): current → #{current}")
    until current.nil?
      yield current.value
      current = current.next
	warn("[DEBUG] <<< Exiting each()")
    end
  end

  def print_list
    puts '[' + to_a.join(', ') + ']'
  end

  def delete_head
	warn("[DEBUG] >>> Entering delete_head()")
    if !@head.nil? && !@head.next.nil?
      newHead = @head.next
	warn("[DEBUG] delete_head(): newHead → #{newHead}")
      @head = newHead
    elsif !@head.nil? && @head.next.nil?
      @head = nil
	warn("[DEBUG] <<< Exiting delete_head()")
    end
  end

  def delete_tail
	warn("[DEBUG] >>> Entering delete_tail()")
	warn("[DEBUG] <<< Exiting delete_tail()")
    return if @head.nil?

    tempNode = @head
	warn("[DEBUG] delete_tail(): tempNode → #{tempNode}")
    tempNode = tempNode.next until tempNode.next.next.nil?
	warn("[DEBUG] delete_tail(): tempNode.next → #{tempNode.next}")
    tempNode.next = nil
  end

  def empty?
	warn("[DEBUG] >>> Entering empty?()")
	warn("[DEBUG] <<< Exiting empty?()")
    @head.nil?
  end
end

obj = SinglyLinkedList.new

obj.insert_head(1)
obj.insert_head(2)
obj.insert_head(3)
obj.insert_head(4)
obj.insert_head(5)
obj.print_list

obj.insert_tail(6)
obj.print_list

obj.delete_head
obj.print_list

obj.delete_tail
obj.print_list
