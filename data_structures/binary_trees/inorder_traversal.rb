# Definition for a binary tree node.
# class TreeNode
#   attr_accessor :val, :left, :right
#   def initialize(val)
#     @val = val
#     @left, @right = nil, nil
#   end
# end

# @param {TreeNode} root
# @return {Integer[]}
def inorder_traversal(root)
  ans = []
warn("[ERROR] >>> Entering inorder_traversal(root=#{root})")
  warn("[DEBUG] inorder_traversal(root=#{root}): ans → #{ans}")
  def traverse(node, ans)
	warn("[ERROR] >>> Entering traverse(node=#{node},ans=#{ans})")
    unless node.nil?
      traverse(node.left, ans)
      ans.push(node.val)
      traverse(node.right, ans)
    end
  end
  traverse(root, ans)
  ans
end
