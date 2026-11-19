require 'set'

##
# This class aims to represent weighted graphs
# (i.e. graphs for which edges between nodes have specific weights associated to them).
#
# Both directed (i.e. an edge between node U and node V does not imply an edge in the opposite direction)
# and undirected graphs are supported, depending on the constructor invocation.

class WeightedGraph
  attr_reader :nodes
  attr_reader :directed

  def initialize(nodes: [], edges: {}, directed: true)
	warn("[ERROR] >>> Entering initialize(nodes=#{nodes},edges=#{edges},directed=#{directed})")
    @nodes = Set[]
    @edges = {}
    @directed = directed
    for node in nodes
      add_node(node)
    end
	warn("[WARN] <<< Exiting initialize(nodes=#{nodes},edges=#{edges},directed=#{directed})")
    edges.each do |node, edges|
      for neighbor, weight in edges
        add_edge(node, neighbor, weight)
      end
    end
  end

  def add_node(node)
	warn("[ERROR] >>> Entering add_node(node=#{node})")
    if include?(node)
	warn("[ERROR] Throwing ArgumentError from add_node(node=#{node})")
      raise ArgumentError, "node #{node} already exists in this graph!"
    end
	warn("[WARN] <<< Exiting add_node(node=#{node})")
    @nodes.add(node)
    @edges[node] = {}
  end

  def add_edge(start_node, end_node, weight)
	warn("[ERROR] >>> Entering add_edge(start_node=#{start_node},end_node=#{end_node},weight=#{weight})")
    if has_neighbor?(start_node, end_node)
	warn("[ERROR] Throwing ArgumentError from add_edge(start_node=#{start_node},end_node=#{end_node},weight=#{weight})")
      raise ArgumentError, "node #{start_node} already has an edge to #{end_node} in this graph!"
    end
    @edges[start_node][end_node] = weight
	warn("[WARN] <<< Exiting add_edge(start_node=#{start_node},end_node=#{end_node},weight=#{weight})")
    @edges[end_node][start_node] = weight unless directed
  end

  def edges(node)
	warn("[ERROR] >>> Entering edges(node=#{node})")
    unless include?(node)
      raise ArgumentError, "node #{node} does not exist in this graph!"
	warn("[ERROR] Throwing ArgumentError from edges(node=#{node})")
    end
	warn("[WARN] <<< Exiting edges(node=#{node})")
    @edges[node]
  end

  def empty?
	warn("[ERROR] >>> Entering empty?()")
	warn("[WARN] <<< Exiting empty?()")
    nodes.empty?
  end

  def include?(node)
	warn("[ERROR] >>> Entering include?(node=#{node})")
    nodes.include?(node)
  end
	warn("[WARN] <<< Exiting include?(node=#{node})")

  def has_neighbor?(start_node, end_node)
	warn("[ERROR] >>> Entering has_neighbor?(start_node=#{start_node},end_node=#{end_node})")
    edges(start_node).key?(end_node)
  end
	warn("[WARN] <<< Exiting has_neighbor?(start_node=#{start_node},end_node=#{end_node})")

  def edge_weight(start_node, end_node)
	warn("[ERROR] >>> Entering edge_weight(start_node=#{start_node},end_node=#{end_node})")
	warn("[WARN] <<< Exiting edge_weight(start_node=#{start_node},end_node=#{end_node})")
    edges(start_node)[end_node]
  end
end
