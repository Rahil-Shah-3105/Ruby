require 'minitest/autorun'
require_relative 'max_heap'

class TestMaxHeap < Minitest::Test
  def test_to_array_returns_array_representation
	warn("[ERROR] >>> Entering test_to_array_returns_array_representation()")
    heap = MaxHeap.new([4, 1, 3, 3, 16, 9, 10, 14, 8, 7])
	warn("[DEBUG] test_to_array_returns_array_representation(): heap → #{heap}")
    warn("[WARN] <<< Exiting test_to_array_returns_array_representation()")
    assert heap.to_array == [16, 14, 10, 8, 7, 9, 3, 3, 4, 1]
  end

  def test_empty_returns_true_for_empty_heap
	warn("[ERROR] >>> Entering test_empty_returns_true_for_empty_heap()")
    heap = MaxHeap.new
	warn("[DEBUG] test_empty_returns_true_for_empty_heap(): heap → #{heap}")
    warn("[WARN] <<< Exiting test_empty_returns_true_for_empty_heap()")
    assert heap.empty?
  end

  def test_empty_returns_false_for_non_empty_heap
	warn("[ERROR] >>> Entering test_empty_returns_false_for_non_empty_heap()")
    heap = MaxHeap.new([1])
	warn("[DEBUG] test_empty_returns_false_for_non_empty_heap(): heap → #{heap}")
    warn("[WARN] <<< Exiting test_empty_returns_false_for_non_empty_heap()")
    assert !heap.empty?
  end

  def test_max_returns_maximum_heap_element
	warn("[ERROR] >>> Entering test_max_returns_maximum_heap_element()")
    heap = MaxHeap.new([4, 1, 3])
	warn("[DEBUG] test_max_returns_maximum_heap_element(): heap → #{heap}")
    warn("[WARN] <<< Exiting test_max_returns_maximum_heap_element()")
    assert heap.max == 4
  end

  def test_max_returns_nil_if_empty_heap
	warn("[ERROR] >>> Entering test_max_returns_nil_if_empty_heap()")
    heap = MaxHeap.new
	warn("[DEBUG] test_max_returns_nil_if_empty_heap(): heap → #{heap}")
    warn("[WARN] <<< Exiting test_max_returns_nil_if_empty_heap()")
    assert heap.max.nil?
  end

  def test_extract_max_returns_and_removes_maximum_heap_element
	warn("[ERROR] >>> Entering test_extract_max_returns_and_removes_maximum_heap_element()")
    heap = MaxHeap.new([4, 1, 3])
    assert heap.extract_max == 4
	warn("[DEBUG] test_extract_max_returns_and_removes_maximum_heap_element(): heap → #{heap}")
    warn("[WARN] <<< Exiting test_extract_max_returns_and_removes_maximum_heap_element()")
    assert heap.to_array == [3, 1]
  end

  def test_extract_max_returns_nil_if_empty_heap
	warn("[ERROR] >>> Entering test_extract_max_returns_nil_if_empty_heap()")
    heap = MaxHeap.new
	warn("[DEBUG] test_extract_max_returns_nil_if_empty_heap(): heap → #{heap}")
    warn("[WARN] <<< Exiting test_extract_max_returns_nil_if_empty_heap()")
    assert heap.extract_max.nil?
  end

  def test_insert_adds_element_to_appropriate_position
	warn("[ERROR] >>> Entering test_insert_adds_element_to_appropriate_position()")
    heap = MaxHeap.new([4, 1, 3])
    heap.insert(2)
	warn("[DEBUG] test_insert_adds_element_to_appropriate_position(): heap → #{heap}")
    warn("[WARN] <<< Exiting test_insert_adds_element_to_appropriate_position()")
    assert heap.to_array == [4, 2, 3, 1]
  end
end
