def palindrome?(value)
  value = value.downcase.delete("^a-z0-9")
  value.reverse == value
end


p palindrome?('madam?&*,.:;')
