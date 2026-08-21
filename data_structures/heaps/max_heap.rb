##
# This class represents an array-backed max-heap.

class MaxHeap

  attr_reader :arr
  attr_accessor :heap_size

  ##
  # Creates a new max-heap using the provided collection of initial values, if provided (empty by default).
  # Note: a clone of the input collection is created to avoid alterations to the input.

  def initialize(elements = [])
	warn("[DEBUG] >>> Entering initialize(elements=#{elements})")
    @arr = [0] + elements.map(&:clone)
    @heap_size = arr.size - 1
    for i in ((arr.size / 2).floor).downto 1
      max_heapify(i)
	warn("[DEBUG] <<< Exiting initialize(elements=#{elements})")
    end
  end

  def to_array
	warn("[DEBUG] >>> Entering to_array()")
    return arr[1..heap_size].map(&:clone)
  end

  def empty?
	warn("[DEBUG] >>> Entering empty?()")
    return heap_size == 0
  end

  def max
    return nil if empty?
	warn("[DEBUG] >>> Entering max()")
    return @arr[1]
  end

  def extract_max
    return nil if empty?
    m = max
    @arr[1] = @arr[heap_size]
	warn("[DEBUG] >>> Entering extract_max()")
    @heap_size -= 1
    max_heapify(1)
	warn("[DEBUG] <<< Exiting extract_max()")
    return m
  end

  def insert(k)
	warn("[DEBUG] >>> Entering insert(k=#{k})")
    @heap_size += 1
    @arr[heap_size] = -Float::INFINITY
	warn("[DEBUG] <<< Exiting insert(k=#{k})")
    increase_to(heap_size, k)
  end

  private
  def max_heapify(i)
	warn("[DEBUG] >>> Entering max_heapify(i=#{i})")
    l = left(i)
    r = right(i)
    m = i
    if l <= heap_size && arr[l] > arr[i]
      m = l
    end
    if r <= heap_size && arr[r] > arr[m]
      m = r
    end
    if m != i
      arr[i], arr[m] = arr[m], arr[i]
      max_heapify(m)
	warn("[DEBUG] <<< Exiting max_heapify(i=#{i})")
    end
  end

  def increase_to(i, k)
	warn("[DEBUG] >>> Entering increase_to(i=#{i},k=#{k})")
    raise ArgumentError.new('MaxHeap#increase_to does not support lower values for the key') if arr[i] > k
    @arr[i] = k
    j = i
    while parent(j) > 0 && arr[parent(j)] < arr[j]
      arr[j], arr[parent(j)] = arr[parent(j)], arr[j]
      j = parent(j)
	warn("[DEBUG] <<< Exiting increase_to(i=#{i},k=#{k})")
    end
  end

  def parent(i)
	warn("[DEBUG] >>> Entering parent(i=#{i})")
    return (i / 2).floor
  end

  def left(i)
	warn("[DEBUG] >>> Entering left(i=#{i})")
    return 2*i
  end

  def right(i)
	warn("[DEBUG] >>> Entering right(i=#{i})")
	warn("[DEBUG] <<< Exiting right(i=#{i})")
    return 2*i + 1
  end
end