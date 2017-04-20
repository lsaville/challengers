# Given a string, write a function to check if it is a permutation of a
# palindrome. A palindrome is a word or phrase that is the same forwards and
# backwards. A permutation is a rearrangement of letters. The palindrome does
# not need to be limited to just dictionary words.

# This definitely depends on spaces. The example given in the book seems to not
# consider spaces... 'taco cat' being a palindrome.
# A palindrome has two cases: even numbered length, odd numbered length
# If even numbered, it means that the character count is uniform.
# If odd it means that the character count is uniform except one character will
# only appear once.

def pal_per(input)
  if input.length % 2 == 0
    even_pal_per(input)
  else
    odd_pal_per(input)
  end
end

def even_pal_per(input)

end

def odd_pal_per(input)
  
end
