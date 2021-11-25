def xor?(val1, val2)
    val1 && val2 == true ? false : val1 || val2
end


puts xor?(5.even?, 4.even?)
puts xor?(5.odd?, 4.odd?)
puts xor?(5.odd?, 4.even?)
puts xor?(5.even?, 4.odd?)
