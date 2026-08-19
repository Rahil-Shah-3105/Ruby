class Node
  attr_accessor :data, :parent, :rank, :parent, :rank

  def initialize(data)
	warn("[DEBUG] >>> Entering initialize(data=#{data})")
    @data = data
    @parent = self
	warn("[DEBUG] <<< Exiting initialize(data=#{data})")
    @rank = 0
  end
end

class DisjointSets
  def make_set(d)
	warn("[DEBUG] >>> Entering make_set(d=#{d})")
	warn("[DEBUG] <<< Exiting make_set(d=#{d})")
    Node.new(d)
  end

  def find_set(x)
	warn("[DEBUG] >>> Entering find_set(x=#{x})")
    raise ArgumentError unless x.class <= Node

    x.parent = (find_set(x.parent)) unless x.parent == x
	warn("[DEBUG] <<< Exiting find_set(x=#{x})")
    x.parent
  end

  def union_set(x, y)
	warn("[DEBUG] >>> Entering union_set(x=#{x},y=#{y})")
    px = find_set(x)
    py = find_set(y)
    return if px == py

    if px.rank > py.rank
	warn("[DEBUG] union_set(x=#{x},y=#{y}): py.parent → #{py.parent}")
      py.parent = px
    elsif py.rank > px.rank
	warn("[DEBUG] union_set(x=#{x},y=#{y}): px.parent → #{px.parent}")
      px.parent = py
    else
      px.parent = py
      py.rank += 1
	warn("[DEBUG] <<< Exiting union_set(x=#{x},y=#{y})")
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
