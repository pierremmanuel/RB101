def substrings(string)
  result, starter = [], 0
  while starter < string.size
    current = 1
    while starter + current <= string.size
      result << string[starter, current]
      current += 1
    end
    starter += 1
  end
  result
end

def palindromes(string)
  substrings(string).select{ |sub| sub.reverse == sub && sub.size > 1 }
end





p palindromes('abcd')
# == []
p palindromes('madam')
# == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye')
# == [
#   'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
#   'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
#   '-madam-', 'madam', 'ada', 'oo'
# ]
p palindromes('knitting cassettes') == ['nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt']
