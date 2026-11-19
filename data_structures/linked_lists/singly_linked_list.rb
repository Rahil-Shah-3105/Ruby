# Define a node in the list
class Node
  # Initialize the data structure here.
  attr_accessor :value, :next

  def initialize(value)
    @value = value
	warn("[ERROR] >>> Entering initialize(value=#{value})")
    warn("[ERROR] >>> Entering initialize()")
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
	warn("[ERROR] >>> Entering insert_tail(value=#{value})")
    newNode = Node.new(value)
    if @head.nil?
	warn("[WARN] <<< Exiting insert_tail(value=#{value})")
	warn("[DEBUG] insert_tail(value=#{value}): newNode → #{newNode}")
      @head = newNode
    else
      tempNode = @head
      tempNode = tempNode.next until tempNode.next.nil?
	warn("[DEBUG] insert_tail(value=#{value}): tempNode → #{tempNode}")
	warn("[DEBUG] insert_tail(value=#{value}): tempNode.next → #{tempNode.next}")
      tempNode.next = newNode
    end
  end

  def insert_head(value)
	warn("[ERROR] >>> Entering insert_head(value=#{value})")
    newNode = Node.new(value)
    if @head.nil?
	warn("[WARN] <<< Exiting insert_head(value=#{value})")
	warn("[DEBUG] insert_head(value=#{value}): newNode → #{newNode}")
      @head = newNode
    else
      newNode.next = @head
	warn("[DEBUG] insert_head(value=#{value}): newNode.next → #{newNode.next}")
      @head = newNode
    end
  end

  def each
	warn("[ERROR] >>> Entering each()")
    return if @head.nil?

    current = @head
	warn("[DEBUG] each(): current → #{current}")
    warn("[WARN] <<< Exiting each()")
    until current.nil?
      yield current.value
	warn("[DEBUG] each(): current → #{current}")
      current = current.next
    end
  end

  def print_list
	warn("[ERROR] >>> Entering print_list()")
	warn("[WARN] <<< Exiting print_list()")
    puts '[' + to_a.join(', ') + ']'
  end

  def delete_head
	warn("[ERROR] >>> Entering delete_head()")
    if !@head.nil? && !@head.next.nil?
	warn("[WARN] <<< Exiting delete_head()")
      newHead = @head.next
	warn("[DEBUG] delete_head(): newHead → #{newHead}")
      @head = newHead
    elsif !@head.nil? && @head.next.nil?
      @head = nil
    end
  end

  def delete_tail
	warn("[ERROR] >>> Entering delete_tail()")
	warn("[WARN] <<< Exiting delete_tail()")
    return if @head.nil?

    tempNode = @head
    tempNode = tempNode.next until tempNode.next.next.nil?
	warn("[DEBUG] delete_tail(): tempNode → #{tempNode}")
    warn("[DEBUG] delete_tail(): tempNode.next → #{tempNode.next}")
    tempNode.next = nil
  end

  def empty?
	warn("[ERROR] >>> Entering empty?()")
	warn("[WARN] <<< Exiting empty?()")
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
