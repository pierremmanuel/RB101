def rotate_array(array)
  array[1..-1] + [array[0]]
end

def rotate_string(string)
  string[1..-1] + string[0]
end

def rotate_integer(integer)
  sprintf(%(%.#{integer.to_s.size}d), rotate_string(integer.to_s).to_i)
end



text1 = "blablabla"
text2 = "Bonjour Monsieur"

days = 365
year = 200455

p rotate_integer(days)
p rotate_integer(year)
p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true
