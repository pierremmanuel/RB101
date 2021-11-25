def featured(n)
  result = (n + 1..9_876_543_210).find do |i|
    i % 7 == 0 && i.odd? && i.digits.uniq == i.digits
  end
  result ? result : "There is no possible number that fulfills those requirement"
end


p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987

# p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements
