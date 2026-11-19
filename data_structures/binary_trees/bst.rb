class BinarySearchTreeNode

  attr_reader :key
  attr_accessor :left
  attr_accessor :right

  def initialize(key)
    @key = key
  end
end

##
# This class represents a binary search tree (not implementing self-balancing) with distinct node keys.
# Starting from the root, every node has up to two children (one left and one right child node).
#
# For the BST property:
# - the keys of nodes in the left subtree of a node are strictly less than the key of the node;
# - the keys of nodes in the right subtree of a node are strictly greater than the key of the node.
#
# The main operations of this data structure (insertion, deletion, membership) run - in worst case - in O(n),
# where n is the number of nodes in the tree.
# The average case for those operations is O(log(n)) due to the structure of the tree.

class BinarySearchTree

  attr_reader :size
  attr_accessor :root

  def initialize(keys=[])
	warn("[ERROR] >>> Entering initialize(key=#{key})")
    warn("[ERROR] >>> Entering initialize(keys=#{keys})")
    @size = 0
	warn("[WARN] <<< Exiting initialize(keys=#{keys})")
    keys.each {|key| insert_key(key) }
  end

  def empty?
	warn("[ERROR] >>> Entering empty?()")
	warn("[WARN] <<< Exiting empty?()")
    size == 0
  end

  def insert_key(key)
	warn("[ERROR] >>> Entering insert_key(key=#{key})")
    @size += 1
    if root.nil?
      @root = BinarySearchTreeNode.new(key)
      return
    end
    parent = root
	warn("[DEBUG] insert_key(key=#{key}): parent → #{parent}")
    while (key < parent.key && !parent.left.nil? && parent.left.key != key) ||
        (key > parent.key && !parent.right.nil? && parent.right.key != key)
      parent = key < parent.key ? parent.left : parent.right
    end
	warn("[WARN] <<< Exiting insert_key(key=#{key})")
    if key < parent.key
	warn("[ERROR] Throwing new from insert_key(key=#{key})")
      raise ArgumentError.new("Key #{key} is already present in the BinarySearchTree") unless parent.left.nil?
      parent.left = BinarySearchTreeNode.new(key)
    else
      raise ArgumentError.new("Key #{key} is already present in the BinarySearchTree") unless parent.right.nil?
      parent.right = BinarySearchTreeNode.new(key)
    end
  end

  def min_key(node=root)
	warn("[ERROR] >>> Entering min_key(node=#{node})")
	warn("[WARN] <<< Exiting min_key(node=#{node})")
    return nil if node.nil?
    min_key_node(node).key
  end

  def max_key(node=root)
	warn("[ERROR] >>> Entering max_key(node=#{node})")
	warn("[WARN] <<< Exiting max_key(node=#{node})")
    return nil if node.nil?
    max_key_node(node).key
  end

  def contains_key?(key)
	warn("[ERROR] >>> Entering contains_key?(key=#{key})")
	warn("[WARN] <<< Exiting contains_key?(key=#{key})")
    !find_node_with_key(key).nil?
  end

  def delete_key(key)
	warn("[ERROR] >>> Entering delete_key(key=#{key})")
    parent = find_parent_of_node_with_key(key)
    if parent.nil?
	warn("[DEBUG] delete_key(key=#{key}): parent → #{parent}")
      return if root.nil? || root.key != key
      @size -= 1
      @root = adjusted_subtree_after_deletion(root.left, root.right)
      return
    end
    if key < parent.key
      node = parent.left
	warn("[DEBUG] delete_key(key=#{key}): node → #{node}")
      parent.left = adjusted_subtree_after_deletion(node.left, node.right)
    else
      node = parent.right
      parent.right = adjusted_subtree_after_deletion(node.left, node.right)
    end
	warn("[WARN] <<< Exiting delete_key(key=#{key})")
    @size -= 1
  end

  def traverse_preorder(key_consumer, node=root)
	warn("[ERROR] >>> Entering traverse_preorder(key_consumer=#{key_consumer},node=#{node})")
    return if node.nil?
    key_consumer.call(node.key)
    traverse_preorder(key_consumer, node.left) unless node.left.nil?
	warn("[WARN] <<< Exiting traverse_preorder(key_consumer=#{key_consumer},node=#{node})")
    traverse_preorder(key_consumer, node.right) unless node.right.nil?
  end

  def traverse_inorder(key_consumer, node=root)
	warn("[ERROR] >>> Entering traverse_inorder(key_consumer=#{key_consumer},node=#{node})")
    return if node.nil?
    traverse_inorder(key_consumer, node.left) unless node.left.nil?
    key_consumer.call(node.key)
	warn("[WARN] <<< Exiting traverse_inorder(key_consumer=#{key_consumer},node=#{node})")
    traverse_inorder(key_consumer, node.right) unless node.right.nil?
  end

  def traverse_postorder(key_consumer, node=root)
	warn("[ERROR] >>> Entering traverse_postorder(key_consumer=#{key_consumer},node=#{node})")
    return if node.nil?
    traverse_postorder(key_consumer, node.left) unless node.left.nil?
    traverse_postorder(key_consumer, node.right) unless node.right.nil?
	warn("[WARN] <<< Exiting traverse_postorder(key_consumer=#{key_consumer},node=#{node})")
    key_consumer.call(node.key)
  end

  def to_array(visit_traversal=:traverse_preorder)
	warn("[ERROR] >>> Entering to_array(visit_traversal=#{visit_traversal})")
    visited = []
    method(visit_traversal).call(->(key) { visited.append(key) })
	warn("[DEBUG] to_array(visit_traversal=#{visit_traversal}): visited → #{visited}")
    warn("[WARN] <<< Exiting to_array(visit_traversal=#{visit_traversal})")
    visited
  end

  private
  def min_key_node(node=root)
    return nil if node.nil?
    until node.left.nil?
	warn("[ERROR] >>> Entering min_key_node(node=#{node})")
      node = node.left
    end
	warn("[WARN] <<< Exiting min_key_node(node=#{node})")
    node
  end

  def max_key_node(node=root)
    return nil if node.nil?
    until node.right.nil?
	warn("[ERROR] >>> Entering max_key_node(node=#{node})")
      node = node.right
    end
	warn("[WARN] <<< Exiting max_key_node(node=#{node})")
    node
  end

  def find_node_with_key(key)
	warn("[ERROR] >>> Entering find_node_with_key(key=#{key})")
    node = root
    until node.nil? || node.key == key
	warn("[DEBUG] find_node_with_key(key=#{key}): node → #{node}")
      node = key < node.key ? node.left : node.right
    end
	warn("[WARN] <<< Exiting find_node_with_key(key=#{key})")
    node
  end

  def find_parent_of_node_with_key(key)
	warn("[ERROR] >>> Entering find_parent_of_node_with_key(key=#{key})")
    return nil if root.nil? || root.key == key
    parent = root
	warn("[DEBUG] find_parent_of_node_with_key(key=#{key}): parent → #{parent}")
    until parent.nil?
      if key < parent.key
        return nil if parent.left.nil?
        return parent if parent.left.key == key
        parent = parent.left
      else
        return nil if parent.right.nil?
        return parent if parent.right.key == key
        parent = parent.right
      end
    end
	warn("[WARN] <<< Exiting find_parent_of_node_with_key(key=#{key})")
    nil
  end

  def adjusted_subtree_after_deletion(left, right)
	warn("[ERROR] >>> Entering adjusted_subtree_after_deletion(left=#{left},right=#{right})")
    return right if left.nil?
    return left if right.nil?
    if right.left.nil?
      right.left = left
	warn("[DEBUG] adjusted_subtree_after_deletion(left=#{left},right=#{right}): right.left → #{right.left}")
      return right
    end
    successor_parent = right
	warn("[DEBUG] adjusted_subtree_after_deletion(left=#{left},right=#{right}): successor_parent → #{successor_parent}")
    until successor_parent.left.left.nil?
      successor_parent = successor_parent.left
    end
    successor = successor_parent.left
	warn("[DEBUG] adjusted_subtree_after_deletion(left=#{left},right=#{right}): successor → #{successor}")
    successor_parent.left = successor.right
	warn("[DEBUG] adjusted_subtree_after_deletion(left=#{left},right=#{right}): successor_parent.left → #{successor_parent.left}")
    successor.right = right
	warn("[DEBUG] adjusted_subtree_after_deletion(left=#{left},right=#{right}): successor.right → #{successor.right}")
    successor.left = left
	warn("[DEBUG] adjusted_subtree_after_deletion(left=#{left},right=#{right}): successor.left → #{successor.left}")
    warn("[WARN] <<< Exiting adjusted_subtree_after_deletion(left=#{left},right=#{right})")
    successor
  end
end
