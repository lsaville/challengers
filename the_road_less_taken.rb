require 'pry'

roads = [['A','B'], ['A','C'], ['D','E'], ['C','D'], ['F','G']]

get_islands(roads)
  roads.map do |road|
    roads.map do |test_road|
      road.select do |city|
        test_road.include?(city)
      end
    end
end

binding.pry

"Something here to make pry work"
