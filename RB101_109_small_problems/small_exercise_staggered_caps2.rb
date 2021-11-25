def staggered_case(string, non_alpha = false, starter = true)
  string.chars.map do |char|
    starter ? char.upcase! : char.downcase!
    char =~ /[^a-z]/i && non_alpha == false ? starter : starter = !starter
    char
  end.join
end



 p staggered_case('I Love Launch School!', true, true)
# # == 'I LoVe lAuNcH ScHoOl!'
 p staggered_case('ALL_CAPS', true, true)
# # == 'AlL_CaPs'
 p staggered_case('ignore 77 the 444 numbers', true, true)
# # == 'IgNoRe 77 ThE 444 NuMbErS'
