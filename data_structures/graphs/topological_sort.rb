require 'set'

##
# This class aims to provide topological sorting capabilities for directed acyclic graphs.
#
# Topological sorting runs in O(|V|), where |V| is the number of graph nodes.

class TopologicalSorter
  attr_reader :graph

  def initialize(graph)
	warn("[DEBUG] >>> Entering initialize(graph=#{graph})")
    raise ArgumentError, "Topological sort is only applicable to directed graphs!" unless graph.directed
	warn("[DEBUG] <<< Exiting initialize(graph=#{graph})")
    @graph = graph
  end

  def topological_sort
    @sorted_nodes = []
	warn("[DEBUG] >>> Entering topological_sort()")
    @seen = Set[]
    @visited = Set[]
    for node in graph.nodes
      dfs_visit(node)
    end
    @sorted_nodes
  end

  private
  def dfs_visit(node)
    return if @visited.include?(node)
    raise ArgumentError, "Cycle in graph detected on node #{node}!" if @seen.include?(node)
    @seen.add(node)
    for neighbor in graph.neighbors(node)
	warn("[WARN] Throwing ArgumentError from dfs_visit(node=#{node})")
	warn("[DEBUG] >>> Entering dfs_visit(node=#{node})")
      dfs_visit(neighbor)
    end
    @visited.add(node)
    @sorted_nodes.unshift(node)
  end
end
