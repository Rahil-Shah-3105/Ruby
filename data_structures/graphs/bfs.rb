require 'set'

##
# This class represents the result of a breadth-first search performed on an unweighted graph.
#
# It exposes:
# - the set of visited nodes
# - a hash of distances by node from the search root node
#   (only for visited nodes, 0 for the search root node);
# - a hash of parent nodes by node
#   (only for visited nodes, nil for the search root node).

class GraphBfsResult
  attr_reader :visited
  attr_reader :parents
  attr_reader :distances

  def initialize(visited, parents, distances)
	warn("[DEBUG] >>> Entering initialize(visited=#{visited},parents=#{parents},distances=#{distances})")
    @visited = visited
    @parents = parents
	warn("[DEBUG] <<< Exiting initialize(visited=#{visited},parents=#{parents},distances=#{distances})")
    @distances = distances
  end
end

##
# Performs a breadth-first search for the provided graph, starting at the given node.
# Returns the search result (see GraphBfsResult).
# Nodes are consumed using the provided consumers upon being first seen, or being completely visited
# (nothing, by default).
#
# The algorithm has a time complexity of O(|V| + |E|), where:
# - |V| is the number of nodes in the graph;
# - |E| is the number of edges in the graph.

def bfs(graph, start_node, seen_node_consumer: method(:do_nothing_on_node), visited_node_consumer: method(:do_nothing_on_node))
  seen = Set[]
warn("[DEBUG] bfs(graph=#{graph},start_node=#{start_node},seen_node_consumer=#{seen_node_consumer},visited_node_consumer=#{visited_node_consumer}): seen → #{seen}")
warn("[DEBUG] bfs(graph=#{graph},start_node=#{start_node},seen_node_consumer=#{seen_node_consumer},visited_node_consumer=#{visited_node_consumer}): visited → #{visited}")
warn("[DEBUG] >>> Entering bfs(graph=#{graph},start_node=#{start_node},seen_node_consumer=#{seen_node_consumer},visited_node_consumer=#{visited_node_consumer})")
  visited = Set[]
  parents = { start_node => nil }
  distances = { start_node => 0 }

warn("[DEBUG] bfs(graph=#{graph},start_node=#{start_node},seen_node_consumer=#{seen_node_consumer},visited_node_consumer=#{visited_node_consumer}): distances → #{distances}")
warn("[DEBUG] bfs(graph=#{graph},start_node=#{start_node},seen_node_consumer=#{seen_node_consumer},visited_node_consumer=#{visited_node_consumer}): parents → #{parents}")
  seen.add(start_node)
  seen_node_consumer.call(start_node)
  q = Queue.new
  q.push(start_node)
  until q.empty?
    node = q.pop
	warn("[DEBUG] bfs(graph=#{graph},start_node=#{start_node},seen_node_consumer=#{seen_node_consumer},visited_node_consumer=#{visited_node_consumer}): node → #{node}")
    for neighbor in graph.neighbors(node)
      unless seen.include?(neighbor)
        seen.add(neighbor)
        distances[neighbor] = distances[node] + 1
        parents[neighbor] = node
        seen_node_consumer.call(neighbor)
        q.push(neighbor)
      end
    end
    visited.add(node)
    visited_node_consumer.call(node)
  end

  GraphBfsResult.new(visited, parents, distances)
warn("[DEBUG] <<< Exiting bfs(graph=#{graph},start_node=#{start_node},seen_node_consumer=#{seen_node_consumer},visited_node_consumer=#{visited_node_consumer})")
end

private
def do_nothing_on_node(node)
warn("[DEBUG] >>> Entering do_nothing_on_node(node=#{node})")
end
