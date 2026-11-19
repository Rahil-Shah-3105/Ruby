class Node
  attr_accessor :data, :parent, :rank, :parent, :rank

  def initialize(data)
	warn("[ERROR] >>> Entering initialize(data=#{data})")
    @data = data
    @parent = self
	warn("[WARN] <<< Exiting initialize(data=#{data})")
    @rank = 0
  end
end

class DisjointSets
  def make_set(d)
	warn("[ERROR] >>> Entering make_set(d=#{d})")
    Node.new(d)
  end

  def find_set(x)
	warn("[ERROR] >>> Entering find_set(x=#{x})")
    raise ArgumentError unless x.class <= Node

    x.parent = (find_set(x.parent)) unless x.parent == x
	warn("[WARN] <<< Exiting find_set(x=#{x})")
    x.parent
  end

  def union_set(x, y)
	warn("[ERROR] >>> Entering union_set(x=#{x},y=#{y})")
    px = find_set(x)
    py = find_set(y)
	warn("[WARN] <<< Exiting union_set(x=#{x},y=#{y})")
    return if px == py

    if px.rank > py.rank
      py.parent = px
	warn("[DEBUG] union_set(x=#{x},y=#{y}): py.parent → #{py.parent}")
    elsif py.rank > px.rank
      px.parent = py
	warn("[DEBUG] union_set(x=#{x},y=#{y}): px.parent → #{px.parent}")
    else
      px.parent = py
      py.rank += 1
    end
  end
end

ds = DisjointSets.new
one = ds.make_set(1)
two = ds.make_set(2)
three = ds.make_set(3)
ds.union_set(one, two)
puts ds.find_set(one) == ds.find_set(two) # should be true
ds.union_set(one, three)
puts ds.find_set(two) == ds.find_set(three) # should be true
puts one.rank + two.rank + three.rank == 1 # should be true
