def letter_percentages(string)
  result = { lowercase: 0.0, uppercase: 0.0, neither: 0.0 }
  result[:lowercase] = (string.scan(/[a-z]/).size / string.size.to_f * 100).round(2)
  result[:uppercase] = (string.scan(/[A-Z]/).size / string.size.to_f * 100).round(2)
  result[:neither] = (string.scan(/[^a-z]/i).size / string.size.to_f * 100).round(2)
  result
end

# you can also use count("a-z"). "a-z" will be used just like a regexp
def letter_percentages2(str)
  percentages = {lowercase: "a-z", uppercase: "A-Z", neither: "^A-Za-z"}
  percentages.each do |k, v|
    percentages[k] = (str.count(v).to_f / str.size * 100).round(2)
  end
  p percentages
end

p letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }
