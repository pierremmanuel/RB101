def letter_case_count(string)
  result = { lowercase: 0, uppercase: 0, neither: 0 }
  string.chars.each do |element|
    result[:lowercase] += 1 if element =~ /[a-z]/
    result[:uppercase] += 1 if element =~  /[A-Z]/
    result[:neither] += 1 if  element =~ /[^a-z]/i
    end
  result
end

# Better solution
def letter_case_count2(string)
  counts = {}
  characters = string.chars
  counts[:lowercase] = characters.count { |char| char =~ /[a-z]/ }
  counts[:uppercase] = characters.count { |char| char =~ /[A-Z]/ }
  counts[:neither] = characters.count { |char| char =~ /[^A-Za-z]/ }
  counts
end





p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
