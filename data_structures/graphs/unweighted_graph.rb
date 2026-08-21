require 'set'

##
# This class aims to represent unweighted graphs
# (i.e. graphs for which edges between nodes have no specific weight associated to them).
#
# Both directed (i.e. an edge between node U and node V does not imply an edge in the opposite direction)
# and undirected graphs are supported, depending on the constructor invocation.

class UnweightedGraph
  attr_reader :nodes
  attr_reader :directed

  def initialize(nodes: [], neighbors: {}, directed: true)
	warn("[DEBUG] >>> Entering initialize(nodes=#{nodes},neighbors=#{neighbors},directed=#{directed})")
    @nodes = Set[]
    @neighbors = {}
    @directed = directed
    for node in nodes
      add_node(node)
    end
    neighbors.each do |node, neighbors|
      for neighbor in neighbors
        add_edge(node, neighbor)
      end
	warn("[DEBUG] <<< Exiting initialize(nodes=#{nodes},neighbors=#{neighbors},directed=#{directed})")
    end
  end

  def add_node(node)
    if include?(node)
	warn("[DEBUG] >>> Entering add_node(node=#{node})")
      raise ArgumentError, "node #{node} already exists in this graph!"
    end
	warn("[WARN] Throwing ArgumentError from add_node(node=#{node})")
    @nodes.add(node)
	warn("[DEBUG] <<< Exiting add_node(node=#{node})")
    @neighbors[node] = Set[]
  end

  def add_edge(start_node, end_node)
    if has_neighbor?(start_node, end_node)
	warn("[DEBUG] >>> Entering add_edge(start_node=#{start_node},end_node=#{end_node})")
      raise ArgumentError, "node #{start_node} already has an edge to #{end_node} in this graph!"
    end
	warn("[WARN] Throwing ArgumentError from add_edge(start_node=#{start_node},end_node=#{end_node})")
    @neighbors[start_node].add(end_node)
	warn("[DEBUG] <<< Exiting add_edge(start_node=#{start_node},end_node=#{end_node})")
    @neighbors[end_node].add(start_node) unless directed
  end

  def neighbors(node)
    unless include?(node)
	warn("[DEBUG] >>> Entering neighbors(node=#{node})")
      raise ArgumentError, "node #{node} does not exist in this graph!"
    end
	warn("[WARN] Throwing ArgumentError from neighbors(node=#{node})")
	warn("[DEBUG] <<< Exiting neighbors(node=#{node})")
    @neighbors[node]
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
    neighbors(start_node).include?(end_node)
	warn("[DEBUG] <<< Exiting has_neighbor?(start_node=#{start_node},end_node=#{end_node})")
  end
end
