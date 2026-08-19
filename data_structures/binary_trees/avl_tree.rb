class AvlTreeNode

  attr_reader :key
  attr_accessor :parent
  attr_accessor :left
  attr_accessor :right
  attr_accessor :height

  def initialize(key, parent=nil)
	warn("[DEBUG] >>> Entering initialize(key=#{key},parent=#{parent})")
    @key = key
    @parent = parent
	warn("[DEBUG] <<< Exiting initialize(key=#{key},parent=#{parent})")
    @height = 1
  end
end

##
# This class represents an AVL tree (a self-balancing binary search tree) with distinct node keys.
# Starting from the root, every node has up to two children (one left and one right child node).
#
# For the BST property:
# - the keys of nodes in the left subtree of a node are strictly less than the key of the node;
# - the keys of nodes in the right subtree of a node are strictly greater than the key of the node.
#
# Due to self-balancing upon key insertion and deletion, the main operations of this data structure
# (insertion, deletion, membership) run - in worst case - in O(log(n)), where n is the number of nodes in the tree.

class AvlTree

  attr_reader :size
  attr_accessor :root

  def initialize(keys=[])
    @size = 0
    keys.each {|key| insert_key(key) }
  end

  def empty?
	warn("[DEBUG] >>> Entering empty?()")
	warn("[DEBUG] <<< Exiting empty?()")
    size == 0
  end

  def insert_key(key)
	warn("[DEBUG] >>> Entering insert_key(key=#{key})")
    @size += 1
    if root.nil?
      @root = AvlTreeNode.new(key)
      return
    end
    parent = root
	warn("[DEBUG] insert_key(key=#{key}): parent → #{parent}")
    while (key < parent.key && !parent.left.nil? && parent.left.key != key) ||
        (key > parent.key && !parent.right.nil? && parent.right.key != key)
      parent = key < parent.key ? parent.left : parent.right
    end
    if key < parent.key
	warn("[WARN] Throwing new from insert_key(key=#{key})")
      raise ArgumentError.new("Key #{key} is already present in the AvlTree") unless parent.left.nil?
      parent.left = AvlTreeNode.new(key, parent)
    else
      raise ArgumentError.new("Key #{key} is already present in the AvlTree") unless parent.right.nil?
      parent.right = AvlTreeNode.new(key, parent)
    end
	warn("[DEBUG] <<< Exiting insert_key(key=#{key})")
    balance(parent)
  end

  def min_key(node=root)
	warn("[DEBUG] >>> Entering min_key(node=#{node})")
    return nil if node.nil?
	warn("[DEBUG] <<< Exiting min_key(node=#{node})")
    min_key_node(node).key
  end

  def max_key(node=root)
	warn("[DEBUG] >>> Entering max_key(node=#{node})")
    return nil if node.nil?
	warn("[DEBUG] <<< Exiting max_key(node=#{node})")
    max_key_node(node).key
  end

  def contains_key?(key)
	warn("[DEBUG] >>> Entering contains_key?(key=#{key})")
	warn("[DEBUG] <<< Exiting contains_key?(key=#{key})")
    !find_node_with_key(key).nil?
  end

  def delete_key(key)
	warn("[DEBUG] >>> Entering delete_key(key=#{key})")
    parent = find_parent_of_node_with_key(key)
    if parent.nil?
	warn("[DEBUG] delete_key(key=#{key}): parent → #{parent}")
      return if root.nil? || root.key != key
      @size -= 1
      @root = adjusted_subtree_after_deletion(root.left, root.right)
      root.parent = nil
	warn("[DEBUG] delete_key(key=#{key}): root.parent → #{root.parent}")
      balance(root.right.nil? ? root : root.right)
      return
    end
    if key < parent.key
      node = parent.left
	warn("[DEBUG] delete_key(key=#{key}): node → #{node}")
      parent.left = adjusted_subtree_after_deletion(node.left, node.right)
      unless parent.left.nil?
        parent.left.parent = parent
        balance(parent.left.right.nil? ? parent.left : parent.left.right)
      end
    else
      node = parent.right
      parent.right = adjusted_subtree_after_deletion(node.left, node.right)
      unless parent.right.nil?
        parent.right.parent = parent
        balance(parent.right.right.nil? ? parent.right : parent.right.right)
      end
    end
	warn("[DEBUG] <<< Exiting delete_key(key=#{key})")
    @size -= 1
  end

  def traverse_preorder(key_consumer, node=root)
	warn("[DEBUG] >>> Entering traverse_preorder(key_consumer=#{key_consumer},node=#{node})")
    return if node.nil?
    key_consumer.call(node.key)
    traverse_preorder(key_consumer, node.left) unless node.left.nil?
	warn("[DEBUG] <<< Exiting traverse_preorder(key_consumer=#{key_consumer},node=#{node})")
    traverse_preorder(key_consumer, node.right) unless node.right.nil?
  end

  def traverse_inorder(key_consumer, node=root)
	warn("[DEBUG] >>> Entering traverse_inorder(key_consumer=#{key_consumer},node=#{node})")
    return if node.nil?
    traverse_inorder(key_consumer, node.left) unless node.left.nil?
    key_consumer.call(node.key)
	warn("[DEBUG] <<< Exiting traverse_inorder(key_consumer=#{key_consumer},node=#{node})")
    traverse_inorder(key_consumer, node.right) unless node.right.nil?
  end

  def traverse_postorder(key_consumer, node=root)
	warn("[DEBUG] >>> Entering traverse_postorder(key_consumer=#{key_consumer},node=#{node})")
    return if node.nil?
    traverse_postorder(key_consumer, node.left) unless node.left.nil?
    traverse_postorder(key_consumer, node.right) unless node.right.nil?
	warn("[DEBUG] <<< Exiting traverse_postorder(key_consumer=#{key_consumer},node=#{node})")
    key_consumer.call(node.key)
  end

  def to_array(visit_traversal=:traverse_preorder)
    visited = []
    method(visit_traversal).call(->(key) { visited.append(key) })
    visited
  end

  private
  def min_key_node(node=root)
	warn("[DEBUG] >>> Entering min_key_node(node=#{node})")
    return nil if node.nil?
    until node.left.nil?
      node = node.left
    end
	warn("[DEBUG] <<< Exiting min_key_node(node=#{node})")
    node
  end

  def max_key_node(node=root)
	warn("[DEBUG] >>> Entering max_key_node(node=#{node})")
    return nil if node.nil?
    until node.right.nil?
      node = node.right
    end
	warn("[DEBUG] <<< Exiting max_key_node(node=#{node})")
    node
  end

  def find_node_with_key(key)
	warn("[DEBUG] >>> Entering find_node_with_key(key=#{key})")
    node = root
    until node.nil? || node.key == key
	warn("[DEBUG] find_node_with_key(key=#{key}): node → #{node}")
      node = key < node.key ? node.left : node.right
    end
	warn("[DEBUG] <<< Exiting find_node_with_key(key=#{key})")
    node
  end

  def find_parent_of_node_with_key(key)
	warn("[DEBUG] >>> Entering find_parent_of_node_with_key(key=#{key})")
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
	warn("[DEBUG] <<< Exiting find_parent_of_node_with_key(key=#{key})")
    nil
  end

  def adjusted_subtree_after_deletion(left, right)
	warn("[DEBUG] >>> Entering adjusted_subtree_after_deletion(left=#{left},right=#{right})")
    return right if left.nil?
    return left if right.nil?
    if right.left.nil?
      right.left = left
	warn("[DEBUG] adjusted_subtree_after_deletion(left=#{left},right=#{right}): right.left → #{right.left}")
	warn("[DEBUG] adjusted_subtree_after_deletion(left=#{left},right=#{right}): left.parent → #{left.parent}")
      left.parent = right
      return right
    end
    successor_parent = right
	warn("[DEBUG] adjusted_subtree_after_deletion(left=#{left},right=#{right}): successor_parent → #{successor_parent}")
    until successor_parent.left.left.nil?
      successor_parent = successor_parent.left
    end
    successor = successor_parent.left
	warn("[DEBUG] adjusted_subtree_after_deletion(left=#{left},right=#{right}): successor → #{successor}")
	warn("[DEBUG] adjusted_subtree_after_deletion(left=#{left},right=#{right}): successor_parent.left → #{successor_parent.left}")
    successor_parent.left = successor.right
    successor.right.parent = successor_parent unless successor.right.nil?
    successor.right = right
	warn("[DEBUG] adjusted_subtree_after_deletion(left=#{left},right=#{right}): successor.right → #{successor.right}")
	warn("[DEBUG] adjusted_subtree_after_deletion(left=#{left},right=#{right}): right.parent → #{right.parent}")
	warn("[DEBUG] adjusted_subtree_after_deletion(left=#{left},right=#{right}): successor.left → #{successor.left}")
    right.parent = successor
    successor.left = left
    left.parent = successor
	warn("[DEBUG] <<< Exiting adjusted_subtree_after_deletion(left=#{left},right=#{right})")
    successor
  end

  def balance(node)
	warn("[DEBUG] >>> Entering balance(node=#{node})")
    return if node.nil?
    left_height = node.left&.height || 0
	warn("[DEBUG] balance(node=#{node}): left_height → #{left_height}")
	warn("[DEBUG] balance(node=#{node}): right_height → #{right_height}")
    right_height = node.right&.height || 0
    # Assumption: the subtrees rooted at `node.left` and `node.right` are balanced
    adjust_height(node)
    if right_height - left_height > 1
      # `node` is right-heavy
      if !node.right.left.nil? && (node.right.left.height || 0) > (node.right.right&.height || 0)
        rotate_right_left(node)
      else
        rotate_left(node)
      end
    elsif left_height - right_height > 1
      # `node` is left-heavy
      if !node.left.right.nil? && (node.left.right.height || 0) > (node.left.left&.height || 0)
        rotate_left_right(node)
      else
        rotate_right(node)
      end
    end

	warn("[DEBUG] <<< Exiting balance(node=#{node})")
    balance(node.parent)
  end

  def rotate_left(node)
	warn("[DEBUG] >>> Entering rotate_left(node=#{node})")
    new_root = node.right
    if node == root
	warn("[DEBUG] rotate_left(node=#{node}): new_root → #{new_root}")
      @root = new_root
    elsif node.parent.left == node
      node.parent.left = new_root
    else
      node.parent.right = new_root
    end
    new_root.parent = node.parent
	warn("[DEBUG] rotate_left(node=#{node}): new_root.parent → #{new_root.parent}")
    if new_root.left.nil?
      node.right = nil
	warn("[DEBUG] rotate_left(node=#{node}): node.right → #{node.right}")
	warn("[DEBUG] rotate_left(node=#{node}): new_root.left → #{new_root.left}")
	warn("[DEBUG] rotate_left(node=#{node}): node.parent → #{node.parent}")
      new_root.left = node
      node.parent = new_root
    else
      node.right = new_root.left
      new_root.left.parent = node
      new_root.left = node
      node.parent = new_root
    end
    adjust_height(node)
	warn("[DEBUG] <<< Exiting rotate_left(node=#{node})")
    adjust_height(new_root)
  end

  def rotate_right(node)
	warn("[DEBUG] >>> Entering rotate_right(node=#{node})")
    new_root = node.left
    if node == root
	warn("[DEBUG] rotate_right(node=#{node}): new_root → #{new_root}")
      @root = new_root
    elsif node.parent.left == node
      node.parent.left = new_root
    else
      node.parent.right = new_root
    end
    new_root.parent = node.parent
	warn("[DEBUG] rotate_right(node=#{node}): new_root.parent → #{new_root.parent}")
    if new_root.right.nil?
      node.left = nil
	warn("[DEBUG] rotate_right(node=#{node}): node.left → #{node.left}")
	warn("[DEBUG] rotate_right(node=#{node}): new_root.right → #{new_root.right}")
	warn("[DEBUG] rotate_right(node=#{node}): node.parent → #{node.parent}")
      new_root.right = node
      node.parent = new_root
    else
      node.left = new_root.right
      new_root.right.parent = node
      new_root.right = node
      node.parent = new_root
    end
    adjust_height(node)
	warn("[DEBUG] <<< Exiting rotate_right(node=#{node})")
    adjust_height(new_root)
  end

  def rotate_right_left(node)
	warn("[DEBUG] >>> Entering rotate_right_left(node=#{node})")
    rotate_right(node.right)
	warn("[DEBUG] <<< Exiting rotate_right_left(node=#{node})")
    rotate_left(node)
  end

  def rotate_left_right(node)
	warn("[DEBUG] >>> Entering rotate_left_right(node=#{node})")
    rotate_left(node.left)
	warn("[DEBUG] <<< Exiting rotate_left_right(node=#{node})")
    rotate_right(node)
  end

  def adjust_height(node)
	warn("[DEBUG] >>> Entering adjust_height(node=#{node})")
	warn("[DEBUG] adjust_height(node=#{node}): node.height → #{node.height}")
	warn("[DEBUG] <<< Exiting adjust_height(node=#{node})")
    node.height = 1 + [node.left&.height || 0, node.right&.height || 0].max
  end
end
