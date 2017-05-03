string = 'meowmeowwoemzztoppotxxx'

# returns an array of all palindromes

# non-reverse convoluted implementation of palidrome?
def pal?(word)
  half = word.length / 2
  half.times do |n|
    return false if word[half-1-n] != word[half+n]
  end
  true
end

puts pal?('moewweom')
puts pal?('drewcarey')
