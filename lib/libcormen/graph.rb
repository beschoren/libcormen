class Graph
	def initialize()
    @vertices = {}
	end

  def vertices
    @vertices.keys
  end

  def add_vertex(vertex_label, edges=[])
    @vertices[vertex_label] = edges

    # adds vertex with no arrows if destination not present
    edges.each do |e|
			@vertices[e] || @vertices[e] = []
    end
  end

  def get_edges(vertex)
    @vertices[vertex]
  end

  def remove_vertex(vertex)
    @vertices.delete(vertex)

    # must delete all references to this vertex
    @vertices.each do |vertex_key, edges|
      edges.delete(vertex)
		end
  end

  def to_dot
    print = ""
    @vertices.each do |vertex, edges|
			edges.each do |edge|
				print += "#{vertex} -- #{edge}\n"
			end
    end
    print = "graph {\n#{print}}"
  end

  def to_s
    to_dot
  end

  def to_dot_file(filename="graph.dot")
    File.write(filename, to_dot)
  end

  def to_svg_file(filename="graph.svg")
    to_dot_file
    `dot -Tsvg "graph.dot" > #{filename}`
  end
end
