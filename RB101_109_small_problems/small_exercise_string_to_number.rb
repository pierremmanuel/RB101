# My solution

# def hexadecimal_to_integer(string)
#   str_array = %w(0 1 2 3 4 5 6 7 8 9 A B C D E F)
#   numbers = (0..15).to_a
#   array = string.upcase.chars
#   for i in 0..(array.size - 1)
#     for j in 0..15
#       array[i] == str_array[j] ? (array[i] = numbers[j]) && break : ''
#     end
#   end
#   array.inject{ |p, d| (p * 16) + d }
# end
#
# p hexadecimal_to_integer("4D9f")
# p hexadecimal_to_integer("A34DE67")

#-------------------------------------
# Better solution

DECIMAL = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
}

HEX = DECIMAL.merge({
  'A' => 10, 'B' => 11, 'C' => 12, 'D' => 13,
  'E' => 14, 'F' => 15
})


def string_to_integer(string)
  string.chars.inject(0) {|accumulator, char| 10 * accumulator + DECIMAL[char]}
end

def hexadecimal_to_integer(string)
  string.upcase.chars.inject(0) {|accumulator, char| 16 * accumulator + HEX[char]}
end


def string_to_signed_integer(string)
  if string[0] == "+"
    string_to_integer(string.slice(0))
  elsif string[0] == "-"
    string_to_integer(string.insert(0))
  else
    string_to_integer(string)
  end
end


# Why do I get 'nil cannot be coerced into integer' Error for the following code?
# def string_to_signed_integer(string)
#   if string[0] == "+"
#     string_to_integer(string.slice(0))
#   elsif string[0] == "-"
#     string_to_integer(string.slice(0)) * (-1)
#   else
#     string_to_integer(string)
#   end
# end

p string_to_signed_integer("456789")
p string_to_signed_integer("+8935676")
p string_to_signed_integer("-8935676")
