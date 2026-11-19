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
	warn("[ERROR] >>> Entering initialize(nodes=#{nodes},neighbors=#{neighbors},directed=#{directed})")
    @nodes = Set[]
    @neighbors = {}
    @directed = directed
    for node in nodes
      add_node(node)
    end
	warn("[WARN] <<< Exiting initialize(nodes=#{nodes},neighbors=#{neighbors},directed=#{directed})")
    neighbors.each do |node, neighbors|
      for neighbor in neighbors
        add_edge(node, neighbor)
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
    @neighbors[node] = Set[]
  end

  def add_edge(start_node, end_node)
	warn("[ERROR] >>> Entering add_edge(start_node=#{start_node},end_node=#{end_node})")
    if has_neighbor?(start_node, end_node)
	warn("[ERROR] Throwing ArgumentError from add_edge(start_node=#{start_node},end_node=#{end_node})")
      raise ArgumentError, "node #{start_node} already has an edge to #{end_node} in this graph!"
    end
    @neighbors[start_node].add(end_node)
	warn("[WARN] <<< Exiting add_edge(start_node=#{start_node},end_node=#{end_node})")
    @neighbors[end_node].add(start_node) unless directed
  end

  def neighbors(node)
	warn("[ERROR] >>> Entering neighbors(node=#{node})")
    unless include?(node)
      raise ArgumentError, "node #{node} does not exist in this graph!"
	warn("[ERROR] Throwing ArgumentError from neighbors(node=#{node})")
    end
	warn("[WARN] <<< Exiting neighbors(node=#{node})")
    @neighbors[node]
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
    neighbors(start_node).include?(end_node)
	warn("[WARN] <<< Exiting has_neighbor?(start_node=#{start_node},end_node=#{end_node})")
  end
end
