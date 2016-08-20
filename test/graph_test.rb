require 'test_helper'

class GraphTest < Minitest::Test
  def test_empty_graph
    g = Graph.new
    assert_equal g.vertices, []
  end

  def test_add_vertices_basic
    g = Graph.new
    g.add_vertex "a" 
    g.add_vertex "b" 
		assert_equal g.vertices, ["a","b"]
  end

  def test_add_vertices_complete
    g = Graph.new
    g.add_vertex("a", ["b", "c"])
    g.add_vertex("b", ["a", "c"])
    g.add_vertex("c", ["b", "a"])
    
    assert_equal g.vertices, ["a","b","c"]
    assert_equal g.get_edges("a"), ["b","c"]
    assert_equal g.get_edges("b"), ["a","c"]
    assert_equal g.get_edges("c"), ["b","a"]

    g.add_vertex("a", ["d"])
    assert_equal g.get_edges("a"), ["d"]
    assert_equal g.vertices, ["a","b","c","d"]
  end

  def test_remove_vertices
    g = Graph.new
    g.add_vertex("a", ["b", "c"])
    g.add_vertex("b", ["a", "c"])
    g.add_vertex("c", ["b", "a"])
    
    g.remove_vertex("b")
    
    assert_equal g.vertices, ["a","c"]
    assert_equal g.get_edges("a"),["c"]
    assert_equal g.get_edges("c"),["a"]
  end

  def test_to_dot
    g = Graph.new
    g.add_vertex("a", ["b"])
    g.add_vertex("b", ["c"])
    g.add_vertex("c", ["a"])

    dot = g.to_dot
    
    expected_dot = 
"graph {
a -- b
b -- c
c -- a
}"
    assert_equal dot, expected_dot
  end

  def test_to_file
    #Todo
  end
end
