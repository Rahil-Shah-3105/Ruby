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
def preorder_traversal(root)
warn("[DEBUG] >>> Entering preorder_traversal(root=#{root})")
warn("[DEBUG] preorder_traversal(root=#{root}): ans → #{ans}")
  ans = []
  def traverse(node, ans)
	warn("[DEBUG] >>> Entering traverse(node=#{node},ans=#{ans})")
    unless node.nil?
      ans.push(node.val)
      traverse(node.left, ans)
      traverse(node.right, ans)
	warn("[DEBUG] <<< Exiting traverse(node=#{node},ans=#{ans})")
    end
  end
  traverse(root, ans)
  ans
end
