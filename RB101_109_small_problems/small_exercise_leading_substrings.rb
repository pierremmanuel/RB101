def leading_substrings(string)
  current, result = 1, []
  while current <= string.size
    result << string[0, current]
    current += 1
  end
  result
end

# def leading_substrings(string)
#   result = []
#   1.upto(string.size) do |index|
#     result << string[0..index]
#   end
#   result
# end

p leading_substrings('abc')
# == ['a', 'ab', 'abc']
p leading_substrings('a')
# == ['a']
p leading_substrings('xyzzy')
# == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
