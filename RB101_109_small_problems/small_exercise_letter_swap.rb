def swap(string)
  result = string.split
  result.map do |word|
    word[0], word[-1] = word[-1], word[0]
  end
  result.join(' ')
end

p swap('Oh what a wonderful day it is')
p swap('Abcde')
p swap('a')
