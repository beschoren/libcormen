require 'test_helper'

class GraphTest < Minitest::Test
  def test_empty_graph
    g = Graph.new

    assert_equal g.vertices, []
  end
end
