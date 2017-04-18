# Is Unique: Implement an algorithm to determine if a string has all unique characters. What if you cannot use additional data structures?

# Solution based on solution from Cracking the Coding Interview, modified to use a hash.

def all_unique_chars?(string)
  return false if string.length > 128

  characters = Hash.new(false)
  string.chars.each do |token|
    return false if characters[token]
    characters[token] = true
  end
  return true
end

# The brute force edition as per the clause about not using another data structure
# This solution is ugly. I'm being wasteful... I only need to look at a dimishing subset
# of the original array on each go

def all_unique_chars?(string)
  return false if string.length > 128
  characters = string.chars

  characters.each_with_index do |token, i|
    characters.each_with_index do |test, j|
      next if j == i
      return false if token == test
    end
  end
  true
end

# This prevents a little of the waste, utilizing the trick from the apple_stock
# problem

def all_unique_chars?(string)
  return false if string.length > 128
  characters = string.chars

  characters.each_with_index do |token, i|
    for later_char in characters[i+1..-1]
      return false if token == later_char
    end
  end
  true
end

# This solution takes into account only single word strings. If it were a sentence
# the method would detect repeating spaces.

# And finally a stab at recreating the java style by cracking open Array and
# overwriting the bracket method of the Array class so it defaults to false.

require_relative('../array_mimic')

def all_unique_chars?(string)
  return false if string.length > 128

  char_set = SpecialArray.new
  characters = string.chars
  for char in characters
    val = char.ord
    return false if char_set[val]
    char_set[val] = true
  end
  true
end

a = 'meow'
b = 'mm'

puts all_unique_chars?(a)
puts all_unique_chars?(b)
