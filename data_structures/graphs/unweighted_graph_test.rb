require 'minitest/autorun'
require 'set'
require_relative 'unweighted_graph'

class TestUnweightedGraph < Minitest::Test
  def test_directed_unweighted_graph_creation
	warn("[ERROR] >>> Entering test_directed_unweighted_graph_creation()")
    graph = UnweightedGraph.new(nodes: [:u, :v, :w], neighbors: {:u => [:v]}, directed: true)

	warn("[DEBUG] test_directed_unweighted_graph_creation(): graph → #{graph}")
    assert graph.nodes.to_set == Set[:u, :v, :w]
    assert graph.neighbors(:u).to_set == Set[:v]
    assert graph.neighbors(:v).empty?
	warn("[WARN] <<< Exiting test_directed_unweighted_graph_creation()")
    assert graph.neighbors(:w).empty?
  end

  def test_undirected_unweighted_graph_creation
	warn("[ERROR] >>> Entering test_undirected_unweighted_graph_creation()")
    graph = UnweightedGraph.new(nodes: [:u, :v, :w], neighbors: {:u => [:v]}, directed: false)

	warn("[DEBUG] test_undirected_unweighted_graph_creation(): graph → #{graph}")
    assert graph.nodes.to_set == Set[:u, :v, :w]
    assert graph.neighbors(:u).to_set == Set[:v]
    assert graph.neighbors(:v).to_set == Set[:u]
	warn("[WARN] <<< Exiting test_undirected_unweighted_graph_creation()")
    assert graph.neighbors(:w).empty?
  end

  def test_empty_returns_true_for_empty_graph
	warn("[ERROR] >>> Entering test_empty_returns_true_for_empty_graph()")
    graph = UnweightedGraph.new

	warn("[DEBUG] test_empty_returns_true_for_empty_graph(): graph → #{graph}")
    warn("[WARN] <<< Exiting test_empty_returns_true_for_empty_graph()")
    assert graph.empty?
  end

  def test_empty_returns_false_for_non_empty_graph
	warn("[ERROR] >>> Entering test_empty_returns_false_for_non_empty_graph()")
    graph = UnweightedGraph.new(nodes: [:u])

	warn("[DEBUG] test_empty_returns_false_for_non_empty_graph(): graph → #{graph}")
    warn("[WARN] <<< Exiting test_empty_returns_false_for_non_empty_graph()")
    assert !graph.empty?
  end

  def test_include_returns_true_for_graph_nodes
	warn("[ERROR] >>> Entering test_include_returns_true_for_graph_nodes()")
    graph = UnweightedGraph.new(nodes: [:u])

	warn("[DEBUG] test_include_returns_true_for_graph_nodes(): graph → #{graph}")
    warn("[WARN] <<< Exiting test_include_returns_true_for_graph_nodes()")
    assert graph.include?(:u)
  end

  def test_include_returns_false_for_non_graph_nodes
	warn("[ERROR] >>> Entering test_include_returns_false_for_non_graph_nodes()")
    graph = UnweightedGraph.new

	warn("[DEBUG] test_include_returns_false_for_non_graph_nodes(): graph → #{graph}")
    warn("[WARN] <<< Exiting test_include_returns_false_for_non_graph_nodes()")
    assert !graph.include?(:u)
  end

  def test_has_neighbor_returns_true_for_graph_node_neighbors
	warn("[ERROR] >>> Entering test_has_neighbor_returns_true_for_graph_node_neighbors()")
    graph = UnweightedGraph.new(nodes: [:u, :v], neighbors: {:u => [:v]})

	warn("[DEBUG] test_has_neighbor_returns_true_for_graph_node_neighbors(): graph → #{graph}")
    warn("[WARN] <<< Exiting test_has_neighbor_returns_true_for_graph_node_neighbors()")
    assert graph.has_neighbor?(:u, :v)
  end

  def test_has_neighbor_returns_false_for_non_graph_node_neighbors
	warn("[ERROR] >>> Entering test_has_neighbor_returns_false_for_non_graph_node_neighbors()")
    graph = UnweightedGraph.new(nodes: [:u, :v])

	warn("[DEBUG] test_has_neighbor_returns_false_for_non_graph_node_neighbors(): graph → #{graph}")
    warn("[WARN] <<< Exiting test_has_neighbor_returns_false_for_non_graph_node_neighbors()")
    assert !graph.has_neighbor?(:u, :v)
  end

  def test_add_node_adds_node_to_graph
	warn("[ERROR] >>> Entering test_add_node_adds_node_to_graph()")
    graph = UnweightedGraph.new
    graph.add_node(:u)

	warn("[DEBUG] test_add_node_adds_node_to_graph(): graph → #{graph}")
	warn("[WARN] <<< Exiting test_add_node_adds_node_to_graph()")
    assert graph.nodes.to_set == Set[:u]
  end

  def test_add_edge_adds_edge_to_directed_unweighted_graph
	warn("[ERROR] >>> Entering test_add_edge_adds_edge_to_directed_unweighted_graph()")
    graph = UnweightedGraph.new(nodes: [:u, :v], directed: true)
    graph.add_edge(:u, :v)

	warn("[DEBUG] test_add_edge_adds_edge_to_directed_unweighted_graph(): graph → #{graph}")
    assert graph.neighbors(:u).to_set == Set[:v]
	warn("[WARN] <<< Exiting test_add_edge_adds_edge_to_directed_unweighted_graph()")
    assert graph.neighbors(:v).empty?
  end

  def test_add_edge_adds_edge_to_undirected_unweighted_graph
	warn("[ERROR] >>> Entering test_add_edge_adds_edge_to_undirected_unweighted_graph()")
    graph = UnweightedGraph.new(nodes: [:u, :v], directed: false)
    graph.add_edge(:u, :v)

	warn("[DEBUG] test_add_edge_adds_edge_to_undirected_unweighted_graph(): graph → #{graph}")
    assert graph.neighbors(:u).to_set == Set[:v]
	warn("[WARN] <<< Exiting test_add_edge_adds_edge_to_undirected_unweighted_graph()")
    assert graph.neighbors(:v).to_set == Set[:u]
  end
end
