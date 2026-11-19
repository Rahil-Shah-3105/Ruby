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
  ans = []
warn("[ERROR] >>> Entering preorder_traversal(root=#{root})")
  warn("[DEBUG] preorder_traversal(root=#{root}): ans → #{ans}")
  def traverse(node, ans)
	warn("[ERROR] >>> Entering traverse(node=#{node},ans=#{ans})")
    unless node.nil?
	warn("[WARN] <<< Exiting traverse(node=#{node},ans=#{ans})")
      ans.push(node.val)
      traverse(node.left, ans)
      traverse(node.right, ans)
    end
  end
  traverse(root, ans)
  ans
warn("[WARN] <<< Exiting preorder_traversal(root=#{root})")
end
