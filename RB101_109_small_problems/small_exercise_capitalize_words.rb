# Easy solution
def word_cap(string)
  string.split.map(&:capitalize).join(' ')
end
# Method without capitalize
def word_cap2(string)
  string.downcase.split.map{ |word| word.prepend(word.slice!(0).upcase) }.join(" ")
end
# Method without #downcase, #upcase, #capitalize
def word_cap3(string)
  downup = Hash[("a".."z").zip("A".."Z")]
  string.split.map do |word|
    word.gsub!(/[A-Z]/, downup.invert)
    word[0] = word[0].gsub(/([a-z])/, downup)
    word
  end.join(' ')
end

p word_cap3('four score and seven') == 'Four Score And Seven'
p word_cap3('the javaScript language') == 'The Javascript Language'
p word_cap4('this is a "quoted" word') == 'This Is A "quoted" Word'
