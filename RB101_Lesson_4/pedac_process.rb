def substrings(string)
  result = []
  starting_index = 0

  while starting_index <= string.length - 2
    num_chars = 2
    while num_chars <= string.length - starting_index
      result << string[starting_index, num_chars]
      num_chars += 1
    end
    starting_index += 1
  end
  result
end

def palindrome?(string)
  string.reverse == string
end

def change_me(string)
  result = []
  substrings(string).each do |sub|
    result.push(sub.upcase) if palindrome?(sub)
  end
  result
end


p change_me("baabla")
