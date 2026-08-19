# Define a node for the list
class Node
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

# Class for circular linked list (last node points to the head node)
class CircularList
  attr_reader :head

  def initialize
    @head = nil
  end

  def insert_tail(value)
	warn("[DEBUG] >>> Entering insert_tail(value=#{value})")
    newNode = Node.new(value)
    if @head.nil?
	warn("[DEBUG] insert_tail(value=#{value}): newNode → #{newNode}")
      @head = newNode
      @head.next = @head
    else
      tempNode = @head
	warn("[DEBUG] insert_tail(value=#{value}): tempNode → #{tempNode}")
      tempNode = tempNode.next while tempNode.next != @head
      newNode.next = @head
	warn("[DEBUG] insert_tail(value=#{value}): newNode.next → #{newNode.next}")
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
      @head.next = head
    else
      tempNode = @head
	warn("[DEBUG] insert_head(value=#{value}): tempNode → #{tempNode}")
      tempNode = tempNode.next while tempNode.next != @head
      newNode.next = @head
	warn("[DEBUG] insert_head(value=#{value}): newNode.next → #{newNode.next}")
	warn("[DEBUG] insert_head(value=#{value}): tempNode.next → #{tempNode.next}")
      tempNode.next = newNode
      @head = newNode
	warn("[DEBUG] <<< Exiting insert_head(value=#{value})")
    end
  end

  def print_list
	warn("[DEBUG] >>> Entering print_list()")
    print '['
    unless @head.nil?
      printNode = @head
	warn("[DEBUG] print_list(): printNode → #{printNode}")
      while printNode.next != @head
        print printNode.value.to_s
        print ', '
        printNode = printNode.next
      end
      print printNode.value
    end
    print ']'

	warn("[DEBUG] <<< Exiting print_list()")
    puts(STDOUT.flush)
  end

  def delete_head
	warn("[DEBUG] >>> Entering delete_head()")
    return if @head.nil?

    if @head.next != @head
      newHead = @head.next
	warn("[DEBUG] delete_head(): newHead → #{newHead}")
	warn("[DEBUG] delete_head(): tempNode → #{tempNode}")
      tempNode = newHead
      tempNode = tempNode.next while tempNode.next != @head
      tempNode.next = newHead
	warn("[DEBUG] delete_head(): tempNode.next → #{tempNode.next}")
      @head = newHead
    elsif !@head.nil? && (@head.next == @head)
      @head = nil
	warn("[DEBUG] <<< Exiting delete_head()")
    end
  end

  def delete_tail
	warn("[DEBUG] >>> Entering delete_tail()")
    return if @head.nil?

    if @head.next != @head
      tempNode = @head
	warn("[DEBUG] delete_tail(): tempNode → #{tempNode}")
      tempNode = tempNode.next while tempNode.next.next != @head
	warn("[DEBUG] delete_tail(): tempNode.next → #{tempNode.next}")
      tempNode.next = @head
    elsif !@head.nil? && (@head.next == @head)
      @head = nil
	warn("[DEBUG] <<< Exiting delete_tail()")
    end
  end

  def is_empty
	warn("[DEBUG] >>> Entering is_empty()")
	warn("[DEBUG] <<< Exiting is_empty()")
    @head.nil?
  end
end

obj = CircularList.new

obj.insert_tail(1)
obj.insert_tail(2)
obj.insert_tail(3)
obj.insert_tail(4)
obj.insert_tail(5)
obj.print_list

obj.insert_head(6)
obj.print_list

obj.delete_tail
obj.print_list

obj.delete_head
obj.print_list
