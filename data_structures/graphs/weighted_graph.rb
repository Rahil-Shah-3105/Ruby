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
	warn("[DEBUG] >>> Entering initialize(nodes=#{nodes},edges=#{edges},directed=#{directed})")
    @nodes = Set[]
    @edges = {}
    @directed = directed
    for node in nodes
      add_node(node)
    end
    edges.each do |node, edges|
      for neighbor, weight in edges
        add_edge(node, neighbor, weight)
      end
	warn("[DEBUG] <<< Exiting initialize(nodes=#{nodes},edges=#{edges},directed=#{directed})")
    end
  end

  def add_node(node)
    if include?(node)
	warn("[DEBUG] >>> Entering add_node(node=#{node})")
      raise ArgumentError, "node #{node} already exists in this graph!"
	warn("[WARN] Throwing ArgumentError from add_node(node=#{node})")
    end
    @nodes.add(node)
	warn("[DEBUG] <<< Exiting add_node(node=#{node})")
    @edges[node] = {}
  end

  def add_edge(start_node, end_node, weight)
    if has_neighbor?(start_node, end_node)
	warn("[DEBUG] >>> Entering add_edge(start_node=#{start_node},end_node=#{end_node},weight=#{weight})")
      raise ArgumentError, "node #{start_node} already has an edge to #{end_node} in this graph!"
	warn("[WARN] Throwing ArgumentError from add_edge(start_node=#{start_node},end_node=#{end_node},weight=#{weight})")
    end
    @edges[start_node][end_node] = weight
	warn("[DEBUG] <<< Exiting add_edge(start_node=#{start_node},end_node=#{end_node},weight=#{weight})")
    @edges[end_node][start_node] = weight unless directed
  end

  def edges(node)
    unless include?(node)
	warn("[DEBUG] >>> Entering edges(node=#{node})")
      raise ArgumentError, "node #{node} does not exist in this graph!"
    end
	warn("[DEBUG] <<< Exiting edges(node=#{node})")
    @edges[node]
  end

  def empty?
	warn("[DEBUG] >>> Entering empty?()")
	warn("[DEBUG] <<< Exiting empty?()")
    nodes.empty?
  end

  def include?(node)
	warn("[DEBUG] >>> Entering include?(node=#{node})")
    nodes.include?(node)
  end
	warn("[DEBUG] <<< Exiting include?(node=#{node})")

  def has_neighbor?(start_node, end_node)
	warn("[DEBUG] >>> Entering has_neighbor?(start_node=#{start_node},end_node=#{end_node})")
    edges(start_node).key?(end_node)
  end
	warn("[DEBUG] <<< Exiting has_neighbor?(start_node=#{start_node},end_node=#{end_node})")

  def edge_weight(start_node, end_node)
	warn("[DEBUG] >>> Entering edge_weight(start_node=#{start_node},end_node=#{end_node})")
	warn("[DEBUG] <<< Exiting edge_weight(start_node=#{start_node},end_node=#{end_node})")
    edges(start_node)[end_node]
  end
end
