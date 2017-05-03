def one_away?(str_1, str_2)
  return false if (str_1.length - str_2.length).abs > 1
  if (str_1.length + 1) == str_2.length
    return addition?(str_1, str_2)
  elsif str_1.length == (str_2.length + 1)
    return addition?(str_2, str_1)
  else
    return replacement?(str_1, str_2)
  end
end

def addition?(str_1, str_2)
  count = 0
  str_1.chars.each_with_index do |token, index|
    return false if count > 1
    count += 1 if token != str_2[index + count] 
  end
  return true if count < 2
end

def replacement?(str_1, str_2)
  count = 0
  str_1.chars.each_with_index do |token, index|
    return false if count > 1
    count += 1 if token != str_2[index]
  end
  return true if count < 2
end

#test examples from book
puts one_away?('pale', 'ple')   #=> true
puts one_away?('pales', 'pale') #=> true
puts one_away?('pale', 'bale')  #=> true
puts one_away?('pale', 'bake')  #=> false

#a couple more for good measure
puts one_away?('meow', 'woem')     #=> false
puts one_away?('lalalala', 'lala') #=> false
puts one_away?('pale', 'pales')    #=> true
