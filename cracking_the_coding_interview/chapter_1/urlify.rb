# Write a method to replace all spaces in a string with '%20'. You may assume
# that the string has sufficient space at teh end to hold the additonal
# characters, and that you are given the 'true' length of the string.
# (if java use a character array to do this in place)

# In Ruby this is trivial using gsub. 

def urlify(input)
  input.gsub(' ', '%20')
end

puts urlify("Mr John Smith")
