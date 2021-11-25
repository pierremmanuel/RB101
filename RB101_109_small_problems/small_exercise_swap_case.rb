def swapcase3(string)
  downup = Hash[("a".."z").zip("A".."Z")]
  string.chars.map do |char|
    if downup.keys.include?(char)
      char = char.gsub(/[a-z]/, downup)
    else
      char = char.gsub(/[A-Z]/, downup.invert)
    end
  end.join
end

def swapcase2(string)
  string.chars.map do |char|
    if char =~ /[a-z]/
      char = char.upcase
    elsif char =~ /[A-Z]/
      char = char.downcase
    else
      char
    end
  end.join
end

def swapcase(string)
  string.chars.map { |c| c.upcase == c ? c.downcase : c.upcase }.join
end

p swapcase('CamelCase')
# == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV')
# == 'tONIGHT ON xyz-tv'
