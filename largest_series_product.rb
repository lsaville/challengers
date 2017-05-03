str = '1027839564'
six = '73167176531330624919225119674426574742355349194934'

def largest_series_product(str, n)
  max = -1.0/0
  index = 0
  for char in str.chars[0..(-n)]
    chunk = str[index..index + (n-1)]
    product = chunk.split('').reduce(1) do |prod, char|
      prod *= char.to_i
    end
    max = [max, product].max
    index += 1
  end
  return max
end

puts largest_series_product(str, 3) # => 270
puts largest_series_product(str, 5) # => 7560
puts largest_series_product(six, 6) # => 23520
