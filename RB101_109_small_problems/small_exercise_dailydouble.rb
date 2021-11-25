def crunch(string)
  result = []
  counter = 0
  loop do
    break if counter > string.size - 1
    result << string[counter] unless string[counter] == string[counter + 1]
    counter += 1
  end
  result.join
end

p crunch('ddaaiillyy ddoouubbllee')
p crunch('4444abcabccba')
p crunch('ggggggggggggggg')
p crunch('a')
p crunch('')
