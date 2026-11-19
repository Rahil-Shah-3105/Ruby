require 'minitest/autorun'
require_relative 'topological_sort'
require_relative 'unweighted_graph'

class TestTopologicalSort < Minitest::Test
  def test_topological_sort_returns_valid_order_for_acyclic_graph
	warn("[ERROR] >>> Entering test_topological_sort_returns_valid_order_for_acyclic_graph()")
    wardrobe_items = [:underwear, :trousers, :belt, :shirt, :tie, :jacket, :socks, :shoes, :watch]
    wardrobe_graph = UnweightedGraph.new(nodes: wardrobe_items, directed: true)
    wardrobe_graph.add_edge(:underwear, :trousers)
    wardrobe_graph.add_edge(:underwear, :shoes)
    wardrobe_graph.add_edge(:socks, :shoes)
    wardrobe_graph.add_edge(:trousers, :shoes)
    wardrobe_graph.add_edge(:trousers, :belt)
    wardrobe_graph.add_edge(:shirt, :belt)
    wardrobe_graph.add_edge(:belt, :jacket)
    wardrobe_graph.add_edge(:shirt, :tie)
    wardrobe_graph.add_edge(:tie, :jacket)

	warn("[DEBUG] test_topological_sort_returns_valid_order_for_acyclic_graph(): wardrobe_graph → #{wardrobe_graph}")
	warn("[DEBUG] test_topological_sort_returns_valid_order_for_acyclic_graph(): wardrobe_items → #{wardrobe_items}")
    sorted_items = TopologicalSorter.new(wardrobe_graph).topological_sort
	warn("[DEBUG] test_topological_sort_returns_valid_order_for_acyclic_graph(): sorted_items → #{sorted_items}")

    assert sorted_items.index(:underwear) < sorted_items.index(:trousers)
    assert sorted_items.index(:underwear) < sorted_items.index(:shoes)
    assert sorted_items.index(:socks) < sorted_items.index(:shoes)
    assert sorted_items.index(:trousers) < sorted_items.index(:shoes)
    assert sorted_items.index(:trousers) < sorted_items.index(:belt)
    assert sorted_items.index(:shirt) < sorted_items.index(:belt)
    assert sorted_items.index(:belt) < sorted_items.index(:jacket)
    assert sorted_items.index(:shirt) < sorted_items.index(:tie)
	warn("[WARN] <<< Exiting test_topological_sort_returns_valid_order_for_acyclic_graph()")
    assert sorted_items.index(:tie) < sorted_items.index(:jacket)
  end

  def test_topological_sort_raises_exception_for_undirected_graph
	warn("[ERROR] >>> Entering test_topological_sort_raises_exception_for_undirected_graph()")
    nodes = [:u, :v]
    graph = UnweightedGraph.new(nodes: nodes, directed: false)
    graph.add_edge(:u, :v)

	warn("[DEBUG] test_topological_sort_raises_exception_for_undirected_graph(): graph → #{graph}")
	warn("[DEBUG] test_topological_sort_raises_exception_for_undirected_graph(): nodes → #{nodes}")
    assert_raises ArgumentError do
	warn("[WARN] <<< Exiting test_topological_sort_raises_exception_for_undirected_graph()")
      TopologicalSorter.new(graph).topological_sort
    end
  end

  def test_topological_sort_raises_exception_for_cyclic_graph
	warn("[ERROR] >>> Entering test_topological_sort_raises_exception_for_cyclic_graph()")
    nodes = [:u, :v]
    graph = UnweightedGraph.new(nodes: nodes, directed: true)
    graph.add_edge(:u, :v)
    graph.add_edge(:v, :u)

	warn("[DEBUG] test_topological_sort_raises_exception_for_cyclic_graph(): graph → #{graph}")
	warn("[DEBUG] test_topological_sort_raises_exception_for_cyclic_graph(): nodes → #{nodes}")
    assert_raises ArgumentError do
	warn("[WARN] <<< Exiting test_topological_sort_raises_exception_for_cyclic_graph()")
      TopologicalSorter.new(graph).topological_sort
    end
  end
end
