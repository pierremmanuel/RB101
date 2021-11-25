DIGITS = {
  0 => '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4',
  5 => '5', 6 => '6', 7 => '7', 8 => '8', 9 => '9'
}

def integer_to_string(integer)
  integer.digits.reverse.map{ |digit| DIGITS[digit] }.join
  # You can just use #join instead of #map because it already returns a string
  # #digits returns the reversed input integer
end

integer_to_string(78098735)
