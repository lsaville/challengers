require 'pry'

roads = [['A','B'], ['A','C'], ['D','E'], ['C','D'], ['F','G']]

start = 'A'
fin   = 'E'

def connected?(roads)
  islands = roads
  until all_done(islands) == true do
    islands = recursive_thing(islands)
  end
  binding.pry
end

def all_done(islands)
  islands.each_with_index.all? do |island, i| 
    islands.each_with_index.all? do |test, j| 
      next if i == j
      (island & test).length == 0
    end
  end
end

def recursive_thing(roads)
  island_map = roads.each_with_index.reduce({}) do |counts, (road, i)|
    roads.each_with_index do |test, j|
      if (road & test).count > 0
        if counts[i]
          counts[i] << j
        else
          counts[i] = [j]
        end
      end
    end
    counts
  end
  condense(island_map, roads)
end

def condense(island_map, roads)
  binding.pry
  island_map.each_with_index do |(k, v), i|
    next if v.length == 1 && k == v.first
    roads[k] = v.reduce([]) do |sum, j|
      sum << roads[k][j]
      roads.delete_at(j)
      sum.uniq!
      sum
    end
    return roads
  end
end

connected?(roads)

=begin
roads = [["a", "b"], ["a", "c"], ["d", "e"], ["c", "d"], ["f", "g"]]

def connected?(array, here, there)
  x = array.find_all { |arr| arr if arr[0] == here }
  # Goes through finding all roads with here as the first road.
  while !(x.any? { |y| y[1] == there }) # As long as there aren't any matches for there in the
    # second element of those roads, do the stuff in the loop
    #
    # Change the original endings to the second element of those arrays
    newEndings = x.map { |arr| arr[1] }.compact

    # Do a similar thing as earlier, find all arrays that have first elements
    x = newEndings.map { |new_here| array.find_all { |arr| arr if arr[0] == new_here }.flatten }
    return false if x.flatten.empty?
  end
  return true
end


puts connected?(roads, "a", "e")
# => true
puts connected?(roads, "a", "g")
# => false
puts connected?(roads, 'e', 'a')
# => false... the roads must be in order.
=end

"Something here to make pry work"
