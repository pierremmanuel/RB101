def century(integer)
  result, remainder = integer.divmod(100)
  cent = remainder == 0 ? result : result + 1

  case cent.digits[0]
  when 1 then cent.digits[1] == 1 ? "#{cent}th" : "#{cent}st"
  when 2 then cent.digits[1] == 1 ? "#{cent}th" : "#{cent}nd"
  when 3 then cent.digits[1] == 1 ? "#{cent}th" : "#{cent}rd"
  else "#{cent}th"
  end
end

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'
