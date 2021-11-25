NUMBERS = %w(zero one two three four five six seven eight nine)

def finds_and_formats_phone_number(string)
  match = string.match(/(\d{3})(\d{3})(\d{4})/)
  match ? string = '(' + match[1] + ') ' + match[2] + '-' + match[3] : string
end

def word_to_digit(string)
  NUMBERS.each_with_index { |num, idx| string.gsub!(/\b#{num}\b/i , idx.to_s) }
  string.gsub!(/(?<=\d)\s(?=\d)/, "")
  string.gsub!(/\d{10}/, "")
  string.split.map { |word| finds_and_formats_phone_number(word) }.join(" ")
end

word_to_digit('Please call me at 9 1 1 FIVE Five five One two three four. Thanks. My phone is 0123456789 and 45567890123456')
# == 'Please call me at 5 5 5 1 2 3 4. Thanks.'


p finds_and_formats_phone_number("0123456789 56 ")




# first solution, not working because of non-word characters in the array
def word_to_digit1(string)
  string.split.map do |word|
    NUMBERS.include?(word) ? word = NUMBERS.index(word) : word
  end.join(" ")
end
