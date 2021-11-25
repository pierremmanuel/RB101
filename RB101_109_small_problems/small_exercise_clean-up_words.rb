ALPHABET = ("A".."Z").to_a + ("a".."z").to_a

## My solution
def cleanup(string)
  result = string.split
  result.map do |word|
    word.each_char{ |chr| word.slice!(chr) unless ALPHABET.include?(chr) }
  end
 result.reject{ |word| word.empty? }.join(' ')
end

cleanup("---what's my +*& line?")

## LS solution
def cleanup2(string)
  clean_string = []

  string.chars.each do |chr|
    if ALPHABET.include?(chr)
      clean_string << chr
    else
      clean_string << " " unless clean_string.last == " "
    end
  end
  clean_string.join
end

p cleanup2("---what's my +*& line?")

## method with regex
def cleanup3(string)
  string.gsub(/[^a-z]/i, ' ').squeeze(' ')
end
