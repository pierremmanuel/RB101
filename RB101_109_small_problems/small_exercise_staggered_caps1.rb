def staggered_case(string, starter = true)
  string.chars.each do |char|
    starter ? char.upcase! : char.downcase!
    starter = !starter
  end.join
end

p staggered_case('I Love Launch School!', false)
# == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS', true)
# == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers', false)
# == 'IgNoRe 77 ThE 444 NuMbErS'
