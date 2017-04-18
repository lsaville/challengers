# Is Unique: Implement an algorithm to determine if a string has all unique characters. What if you cannot use additional data structures?

require 'pry'

def all_unique_chars?(string)
  return false if string.length > 128

  characters = Hash.new(false)
  string.chars.each do |token|
    return false if characters[token]
    characters[token] = true
  end
  return true
end

a = 'meow'
b = 'mm'

puts all_unique_chars?(a)
puts all_unique_chars?(b)
