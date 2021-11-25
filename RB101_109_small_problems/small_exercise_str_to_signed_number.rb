def integer_to_string(integer)
  negative = integer < 0
  string = integer.abs.digits.reverse.join
  negative ? string.insert(0, "-") : string
end

p integer_to_string(-56789)
p integer_to_string(+78904)
