def rotate_array(array)
  array[1..-1] + [array[0]]
end

def rotate_string(string)
  string[1..-1] + string[0]
end

def rotate_integer(integer)
  sprintf(%(%.#{integer.to_s.size}d), rotate_string(integer.to_s).to_i)
end

def rotate_rightmost_digits(num, idx)
  num = num.to_s.chars
  num << num.delete_at(-idx)
  num.join.to_i
end

def rotate_rightmost_digits2(num, n)
  first, last = (num % 10**n).divmod(10**(n - 1))
  (num - num % 10**n) + last * 10 + first
end

# ma solution
def rotate_rightmost_digits3(num, n)
  (num.to_s[0, num.to_s.size - n] + rotate_string(num.to_s[-n..-1])).to_i
end

p rotate_rightmost_digits(200345, 6)
p rotate_rightmost_digits(103023, 6)
p rotate_rightmost_digits(100344, 6)

 p rotate_rightmost_digits(735291, 2) == 735219
 p rotate_rightmost_digits(735291, 3) == 735912
 p rotate_rightmost_digits(735291, 4) == 732915
 p rotate_rightmost_digits(735291, 5) == 752913
 p rotate_rightmost_digits(735291, 6) == 352917
