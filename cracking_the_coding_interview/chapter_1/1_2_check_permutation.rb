# Given two strings, write a method to decide if one is the permutation
# of the other.

# I imagine this method returning true or false

# This would be a solution if you were allowed to use a sort implemented by the
# language

def permutation(input_one, input_two)
  return false if input_one.length != input_two.length

  input_one.split('').sort == input_two.split('').sort
end

# The book brings up the interesting questions of case insensitivity and whitespace.
# It also splits the sorting out into a separate method.

def permutation(input_one, input_two)
  return false if input_one.length != input_two.length

  sort(input_one) == sort(input_two)
end

def sort(input)
  input.split('').sort
end

# Some of the hints in the book talk about using a hash table. I couldn't understand
# this without the additional hint of character counting...

def permutation(input_one, input_two)
  return false if input_one.length != input_two.length
  char_count(input_one) == char_count(input_two)
end

def char_count(input)
  input.split('').reduce({}) do |count, char|
    if count[char]
      count[char] +=  1
    else
      count[char] = 1
    end
    count
  end
end

# Stab at doing it array style (without the array default overwrite in array_mimic.rb)

def permutation(input_one, input_two)
  return false if input_one.length != input_two.length

  letters = Array.new
  for char_num in input_one.codepoints do
    if letters[char_num]
      letters[char_num] += 1
    else
      letters[char_num] = 1
    end
  end

  for test_char in input_two.codepoints do
    if letters[test_char]
      letters[test_char] -= 1
    else
      letters[test_char] = -1
    end
    return false if letters[test_char] < 0
  end
  return true
end

puts permutation('meow', 'woem') # Same word scrambled
puts permutation('blahdls', 'ejlfsg') # Different lengths
puts permutation('qwert', 'asdfg') # Same length different letters
puts permutation('lalala', 'alalal') # Same scrambled again
puts permutation('im a fine fellow', 'fellow fine im a') # Same scrambled with spaces
