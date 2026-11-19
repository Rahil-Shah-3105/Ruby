# @param [Integer] start
# @param [Integer] target
# @param [Array] adjacency_list
# @return [Array] routes
def dfs(start, target, adjacency_list)
warn("[ERROR] >>> Entering dfs(start=#{start},target=#{target},adjacency_list=#{adjacency_list})")
  warn("[ERROR] >>> Entering dfs(start=#{start},target=#{target},adjacency_list=#{adjacency_list})")
  is_visited = Hash.new(false)
  parent = {}
warn("[DEBUG] dfs(start=#{start},target=#{target},adjacency_list=#{adjacency_list}): is_visited → #{is_visited}")
  stack = [start]
warn("[DEBUG] dfs(start=#{start},target=#{target},adjacency_list=#{adjacency_list}): stack → #{stack}")
  loop do
    break if stack.empty?

    current_node = stack.pop
    is_visited[current_node] = true

    return get_path(parent, target) if current_node == target

    adjacency_list[current_node].each do |neighbor|
      next if is_visited[neighbor]

      stack << neighbor
      is_visited[neighbor] = true
      parent[neighbor] = current_node
    end
  end
warn("[WARN] <<< Exiting dfs(start=#{start},target=#{target},adjacency_list=#{adjacency_list})")
  []
end

# @param [Hash] parent
# @param [Integer] dest
# @return [Array] path
def get_path(parent, dest)
warn("[ERROR] >>> Entering get_path(parent=#{parent},dest=#{dest})")
  iterator = dest
  path = [dest]
warn("[DEBUG] get_path(parent=#{parent},dest=#{dest}): path → #{path}")
warn("[DEBUG] get_path(parent=#{parent},dest=#{dest}): iterator → #{iterator}")
  while parent.has_key?(iterator)
    path << parent[iterator]
    iterator = parent[iterator]
  end
warn("[WARN] <<< Exiting get_path(parent=#{parent},dest=#{dest})")
  path.reverse
end

def main
warn("[ERROR] >>> Entering main()")
  adjacency_list = [
    [1, 2], # 0
    [0, 3], # 1
    [0, 3], # 2
    [1, 2, 4], # 3
    [3, 5], # 4
    [4] # 5
  ]
warn("[DEBUG] main(): adjacency_list → #{adjacency_list}")
  warn("[WARN] <<< Exiting main()")
  p dfs(0, 5, adjacency_list)
end

main
